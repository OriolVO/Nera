use std::collections::HashMap;
use crate::frontend::sema::TypeInfo;
use crate::frontend::ast::{AssignOp, BinaryOp, UnaryOp};
use crate::error::CompileError;
use crate::midend::ir::{IRInstruction, IROperand, IRFunction, Terminator, VectorOperand};
use crate::midend::optimizer::OptimizedIR;
use crate::backend::llvm_ir::{LLVMType, LLVMValue, IRBuilder};

pub struct LLVMGenerator {
    pub type_env: HashMap<String, TypeInfo>,
    pub data_structs: HashMap<String, Vec<String>>,
    builder: IRBuilder,
    temp_map: HashMap<usize, LLVMValue>,
    temp_type_map: HashMap<usize, TypeInfo>,
    function_params: HashMap<String, LLVMValue>,
    scalar_vars: std::collections::HashSet<String>,
    global_scalar_vars: std::collections::HashSet<String>,
    adt_vars: std::collections::HashSet<String>,
    parameter_names: std::collections::HashSet<String>,
    main_arena_ptr: Option<LLVMValue>,
    shared_vec_idx: Option<LLVMValue>,
    func_ret_types: HashMap<String, LLVMType>,
    func_semantic_ret_types: HashMap<String, TypeInfo>,
    current_function: Option<String>,
}

impl LLVMGenerator {
    pub fn new() -> Self {
        Self {
            type_env: HashMap::new(),
            data_structs: HashMap::new(),
            builder: IRBuilder::new("nera_program"),
            temp_map: HashMap::new(),
            temp_type_map: HashMap::new(),
            function_params: HashMap::new(),
            scalar_vars: std::collections::HashSet::new(),
            global_scalar_vars: std::collections::HashSet::new(),
            adt_vars: std::collections::HashSet::new(),
            parameter_names: std::collections::HashSet::new(),
            main_arena_ptr: None,
            shared_vec_idx: None,
            func_ret_types: HashMap::new(),
            func_semantic_ret_types: HashMap::new(),
            current_function: None,
        }
    }

    fn get_type(&self, name: &str) -> Option<&TypeInfo> {
        let key = if let Some(func) = &self.current_function {
            format!("{}_{}", func, name)
        } else {
            name.to_string()
        };
        self.type_env.get(&key).or_else(|| self.type_env.get(name))
    }

    fn get_operand_type(&self, op: &IROperand) -> Option<TypeInfo> {
        match op {
            IROperand::Variable(n) => self.get_type(n).cloned(),
            IROperand::TempReg(t) => self.temp_type_map.get(t).cloned(),
            _ => None,
        }
    }

    fn get_struct_name(&self, ty: &TypeInfo) -> Option<String> {
        match ty {
            TypeInfo::Custom(name) => Some(name.clone()),
            TypeInfo::Pointer(inner) => self.get_struct_name(inner),
            TypeInfo::Nullable(inner) => self.get_struct_name(inner),
            _ => None,
        }
    }

    fn is_custom_or_choice_type(&self, ty: &TypeInfo) -> bool {
        match ty {
            TypeInfo::Custom(_) => true,
            TypeInfo::Pointer(inner) => self.is_custom_or_choice_type(inner),
            TypeInfo::Nullable(inner) => self.is_custom_or_choice_type(inner),
            _ => false,
        }
    }

    fn is_scalar_type(&self, ty: &TypeInfo) -> bool {
        match ty {
            TypeInfo::Void | TypeInfo::None => false,
            _ => true,
        }
    }

    fn str_to_llvm_type(&self, ty_str: &str) -> LLVMType {
        match ty_str {
            "Int" | "Char" => LLVMType::I64,
            "Float" => LLVMType::Double,
            "Boolean" => LLVMType::I1,
            "String" => LLVMType::Pointer(Box::new(LLVMType::I8)),
            _ => LLVMType::Pointer(Box::new(LLVMType::I8)), // fallback for pointers
        }
    }

    fn type_to_llvm(&self, nera_ty: &TypeInfo) -> LLVMType {
        match nera_ty {
            TypeInfo::Int => LLVMType::I64,
            TypeInfo::Float => LLVMType::Double,
            TypeInfo::Boolean => LLVMType::I1,
            TypeInfo::String => LLVMType::Pointer(Box::new(LLVMType::I8)),
            TypeInfo::Array(inner, _) => {
                let inner_llvm = self.type_to_llvm(inner);
                LLVMType::Pointer(Box::new(inner_llvm))
            }
            TypeInfo::Pointer(inner) => {
                if **inner == TypeInfo::Void {
                    LLVMType::Pointer(Box::new(LLVMType::I8))
                } else {
                    let inner_llvm = self.type_to_llvm(inner);
                    LLVMType::Pointer(Box::new(inner_llvm))
                }
            }
            TypeInfo::Void => LLVMType::Void,
            TypeInfo::Custom(_) => LLVMType::Pointer(Box::new(LLVMType::I64)), // data/choice are heap-allocated
            TypeInfo::Nullable(inner) => {
                let inner_llvm = self.type_to_llvm(inner);
                // Nullable pointers are still pointers; nullable primitives use i64 (0 = None)
                if matches!(inner_llvm, LLVMType::Pointer(_)) {
                    inner_llvm
                } else {
                    LLVMType::I64
                }
            }
            TypeInfo::None => LLVMType::Pointer(Box::new(LLVMType::I8)), // null pointer
            _ => LLVMType::I64,
        }
    }

    fn type_str_to_llvm(&self, ret_type_str: &str) -> LLVMType {
        let mut s = ret_type_str;
        let is_nullable = s.starts_with('?');
        if is_nullable { s = &s[1..]; }
        let is_ptr = s.starts_with('^');
        if is_ptr { s = &s[1..]; }
        
        let mut ret_info = match s {
            "Int" => TypeInfo::Int,
            "Float" => TypeInfo::Float,
            "Boolean" => TypeInfo::Boolean,
            "String" => TypeInfo::String,
            "Char" => TypeInfo::Int, // Char is i64 at LLVM level
            "Void" => TypeInfo::Void,
            _ => TypeInfo::Custom(s.to_string()),
        };
        if is_ptr { ret_info = TypeInfo::Pointer(Box::new(ret_info)); }
        if is_nullable { ret_info = TypeInfo::Nullable(Box::new(ret_info)); }
        self.type_to_llvm(&ret_info)
    }

    fn parse_type_str(&self, type_str: &str) -> TypeInfo {
        let mut s = type_str;
        let is_nullable = s.starts_with('?');
        if is_nullable { s = &s[1..]; }
        let is_ptr = s.starts_with('^');
        if is_ptr { s = &s[1..]; }
        
        let mut ret_info = match s {
            "Int" => TypeInfo::Int,
            "Float" => TypeInfo::Float,
            "Boolean" => TypeInfo::Boolean,
            "String" => TypeInfo::String,
            "Char" => TypeInfo::Int,
            "Void" => TypeInfo::Void,
            _ => TypeInfo::Custom(s.to_string()),
        };
        if is_ptr { ret_info = TypeInfo::Pointer(Box::new(ret_info)); }
        if is_nullable { ret_info = TypeInfo::Nullable(Box::new(ret_info)); }
        ret_info
    }

    pub fn generate(&mut self, optimized_ir: &OptimizedIR, type_env: HashMap<String, TypeInfo>) -> Result<String, CompileError> {
        self.type_env = type_env;
        self.data_structs = optimized_ir.data_structs.clone();
        self.builder = IRBuilder::new("nera_program");
        self.temp_map.clear();
        self.function_params.clear();
        self.main_arena_ptr = None;

        let mut actual_soa_arrays = optimized_ir.soa_arrays.clone();
        for instr in &optimized_ir.global_instructions {
            if let IRInstruction::Assign(IROperand::Variable(name), IROperand::Void) = instr {
                if !actual_soa_arrays.iter().any(|(n, _)| n == name) {
                    actual_soa_arrays.push((name.clone(), 1000));
                }
            }
        }
        for func in &optimized_ir.functions {
            for block in &func.blocks {
                for instr in &block.instrs {
                    if let IRInstruction::Assign(IROperand::Variable(name), IROperand::Void) = instr {
                        if !actual_soa_arrays.iter().any(|(n, _)| n == name) {
                            actual_soa_arrays.push((name.clone(), 1000));
                        }
                    }
                }
            }
        }

        // Collect vars that are ADT pointer destinations — these must NOT be scalars
        self.adt_vars.clear();
        for func in &optimized_ir.functions {
            for block in &func.blocks {
                for instr in &block.instrs {
                    if let IRInstruction::ConstructADT(IROperand::Variable(name), _, _) = instr {
                        self.adt_vars.insert(name.clone());
                    }
                }
            }
        }
        // We also need to find Assign(var, temp) where temp came from ConstructADT
        let mut adt_temps: std::collections::HashSet<usize> = std::collections::HashSet::new();
        for func in &optimized_ir.functions {
            for block in &func.blocks {
                for instr in &block.instrs {
                    if let IRInstruction::ConstructADT(IROperand::TempReg(t), _, _) = instr {
                        adt_temps.insert(*t);
                    }
                }
            }
        }
        for func in &optimized_ir.functions {
            for block in &func.blocks {
                for instr in &block.instrs {
                    if let IRInstruction::Assign(IROperand::Variable(name), IROperand::TempReg(t)) = instr {
                        if adt_temps.contains(t) {
                            self.adt_vars.insert(name.clone());
                        }
                    }
                }
            }
        }

        self.global_scalar_vars.clear();
        for instr in &optimized_ir.global_instructions {
            if let IRInstruction::Assign(IROperand::Variable(name), src) = instr {
                if !matches!(src, IROperand::Void) && !actual_soa_arrays.iter().any(|(n, _)| n == name) && !self.adt_vars.contains(name) {
                    self.global_scalar_vars.insert(name.clone());
                }
            }
        }
        
        self.scalar_vars.clear();

        self.builder.declare("declare i8* @malloc(i64)");
        self.builder.declare("declare void @free(i8*)");
        self.builder.declare("declare i8* @strncpy(i8*, i8*, i64)");
        self.builder.declare("declare i32 @strcmp(i8*, i8*)");
        self.builder.declare("declare i8* @string_concat(i8*, i8*)");

        // Pre-populate func_ret_types and func_semantic_ret_types from all functions
        // Register both the raw Nera name and the sanitized LLVM name so
        // call-site lookups (which use the sanitized name) succeed for generics.
        self.func_ret_types.clear();
        self.func_semantic_ret_types.clear();
        for func in &optimized_ir.functions {
            let ret_ty = self.type_str_to_llvm(&func.return_type);
            let semantic_ret_ty = self.parse_type_str(&func.return_type);
            let sanitized = func.name.replace('(', "_").replace(')', "").replace(", ", "_").replace('^', "Ptr");
            
            self.func_ret_types.insert(func.name.clone(), ret_ty.clone());
            self.func_ret_types.insert(sanitized.clone(), ret_ty);
            
            self.func_semantic_ret_types.insert(func.name.clone(), semantic_ret_ty.clone());
            self.func_semantic_ret_types.insert(sanitized, semantic_ret_ty);
        }

        for func in &optimized_ir.functions {
            self.lower_function(func, &actual_soa_arrays)?;
        }

        if !actual_soa_arrays.is_empty() {
            self.builder.declare("!1 = !{!1, !2}");
            self.builder.declare("!2 = !{!\"llvm.loop.vectorize.enable\", i1 true}");
        }

        Ok(self.builder.emit_to_string())
    }

    fn lower_function(&mut self, func: &IRFunction, soa_arrays: &Vec<(String, i64)>) -> Result<(), CompileError> {
        self.current_function = Some(func.name.clone());

        let mut ret_ty = self.type_str_to_llvm(&func.return_type);
        if func.name == "main" {
            ret_ty = LLVMType::I32;
        }

        self.temp_map.clear();
        self.function_params.clear();
        self.scalar_vars = self.global_scalar_vars.clone();
        for block in &func.blocks {
            for instr in &block.instrs {
                if let IRInstruction::Assign(IROperand::Variable(name), src) = instr {
                    if !matches!(src, IROperand::Void) && !soa_arrays.iter().any(|(n, _)| n == name) && !self.adt_vars.contains(name) {
                        self.scalar_vars.insert(name.clone());
                    }
                }
            }
        }
        self.parameter_names.clear();
        for (param_name, _) in &func.params {
            self.parameter_names.insert(param_name.clone());
        }

        let mut params = Vec::new();
        for (param_name, param_ty_str) in &func.params {
            let llvm_ty = self.type_str_to_llvm(param_ty_str);
            let is_scalar = !param_name.contains("soa_") && (!param_name.contains('_') || param_name == "all_decls");
            if is_scalar {
                params.push((format!("param_{}", param_name), llvm_ty));
                self.scalar_vars.insert(param_name.clone());
            } else {
                params.push((param_name.clone(), llvm_ty));
            }
        }

        let mut sanitized_name = func.name.replace("(", "_").replace(")", "").replace(", ", "_").replace("^", "Ptr");
        if func.name == "main" {
            sanitized_name = "nera_main".to_string();
        }

        if func.is_extern {
            let param_strs: Vec<String> = params.iter().map(|(_, t)| t.to_string()).collect();
            self.builder.declare(&format!("declare {} @{}({})", ret_ty.to_string(), sanitized_name, param_strs.join(", ")));
            return Ok(());
        }

        self.builder.start_function(&sanitized_name, ret_ty.clone(), params.clone());

        let mut first_block = true;
        for block in &func.blocks {
            self.builder.start_block(&block.name);

            if first_block {
                let shared_idx = self.builder.build_alloca("shared_vec_idx", LLVMType::I64);
                self.shared_vec_idx = Some(shared_idx);

                if func.name == "main" {
                    // Dynamic Arena Allocation Calculation

                    let total_elements = soa_arrays.iter().map(|(_, sz)| *sz).max().unwrap_or(0);
                    if total_elements == 0 {
                        let arena_start_i8 = self.builder.build_call(LLVMType::Pointer(Box::new(LLVMType::I8)), "malloc", vec![LLVMValue::ConstI64(32)]);
                        self.main_arena_ptr = Some(arena_start_i8);
                    } else {
                        let mut size_of_struct: i64 = 0;
                        
                        for (soa_array, _sz) in soa_arrays {
                            let field_ty = self.get_type(soa_array).cloned().unwrap_or(TypeInfo::Int);
                            let bytes = match field_ty {
                                TypeInfo::Float => 8,
                                TypeInfo::Boolean => 1,
                                _ => 8, // Int is i64
                            };
                            size_of_struct += bytes;
                        }
                        
                        let arena_size = total_elements * size_of_struct;
                        let arena_size_val = LLVMValue::ConstI64(arena_size.max(8)); // at least 8 bytes

                        let arena_start_i8 = self.builder.build_call(LLVMType::Pointer(Box::new(LLVMType::I8)), "malloc", vec![arena_size_val]);
                        self.main_arena_ptr = Some(arena_start_i8.clone());
                        let arena_start = self.builder.build_bitcast(arena_start_i8.clone(), LLVMType::Pointer(Box::new(LLVMType::I64)));


                    let mut current_offset = 0;
                    for (soa_array, _sz) in soa_arrays {
                        let offset_val = LLVMValue::ConstI64(current_offset);
                        let ptr_reg = self.builder.build_gep(LLVMType::I64, arena_start.clone(), vec![offset_val])?;
                        
                        let field_ty = self.get_type(soa_array).cloned().unwrap_or(TypeInfo::Int);
                        let ptr_ty = LLVMType::Pointer(Box::new(self.type_to_llvm(&field_ty)));
                        
                        let casted = self.builder.build_bitcast(ptr_reg, ptr_ty);
                        self.function_params.insert(soa_array.clone(), casted);
                        
                        let elements = total_elements; // must match total_elements
                        let bytes = match field_ty {
                            TypeInfo::Float => 8,
                            TypeInfo::Boolean => 1,
                            _ => 8,
                        };
                        current_offset += (elements * bytes) / 8; // advancing I64 pointer
                    }
                    self.main_arena_ptr = Some(arena_start_i8);
                    }
                }

                let vars_to_allocate = self.scalar_vars.clone();
                for var in vars_to_allocate {
                    let var_ty = self.get_type(&var).cloned().unwrap_or(TypeInfo::Int);
                    let llvm_ty = self.type_to_llvm(&var_ty);
                    let alloca = self.builder.build_alloca(&format!("ptr_{}", var), llvm_ty.clone());
                    self.function_params.insert(var.clone(), alloca);
                }

                for (name, ty) in &params {
                    let raw_name = if name.starts_with("param_") { name.strip_prefix("param_").ok_or_else(|| CompileError::BackendError(format!("Malformed param name: {}", name)))? } else { name.as_str() };
                    if let Some(alloca) = self.function_params.get(raw_name) {
                        let storage_ty = match alloca.get_type() {
                            LLVMType::Pointer(inner) => *inner,
                            _ => unreachable!(),
                        };
                        let val_reg = LLVMValue::Reg(name.clone(), ty.clone());
                        let val_to_store = if ty != &storage_ty {
                            self.builder.build_bitcast(val_reg, storage_ty)
                        } else {
                            val_reg
                        };
                        self.builder.build_store(val_to_store, alloca.clone(), None);
                    } else {
                        self.function_params.insert(name.clone(), LLVMValue::Reg(name.clone(), ty.clone()));
                    }
                }
                first_block = false;
            }

            for instr in &block.instrs {
                self.lower_instruction(instr, soa_arrays)?;
            }

            match &block.terminator {
                Terminator::Jump(target) => {
                    self.builder.build_br(target, None);
                }
                Terminator::Branch(cond, true_lbl, false_lbl) => {
                    let cond_val = self.operand_to_value(cond)?;
                    self.builder.build_cond_br(cond_val, true_lbl, false_lbl, None);
                }
                Terminator::Return(val_opt) => {
                    if func.name == "main" {
                        if let Some(arena_i8) = &self.main_arena_ptr {
                            self.builder.build_call(LLVMType::Void, "free", vec![arena_i8.clone()]);
                        }
                    }
                    if let Some(val) = val_opt {
                        let val_val = self.operand_to_value(val)?;
                        if func.name == "main" {
                            let ret_32 = self.builder.build_trunc(val_val, LLVMType::I32);
                            self.builder.build_ret(Some(ret_32));
                        } else {
                            // Bitcast if the value type doesn't match the declared return type
                            // (e.g. generic call fell back to i64 but function returns i64**)
                            let coerced = if val_val.get_type() != ret_ty {
                                self.builder.build_bitcast(val_val, ret_ty.clone())
                            } else {
                                val_val
                            };
                            self.builder.build_ret(Some(coerced));
                        }
                    } else {
                        if func.name == "main" {
                            self.builder.build_ret(Some(LLVMValue::ConstI32(0)));
                        } else if ret_ty == LLVMType::Void {
                            self.builder.build_ret(None);
                        } else {
                            self.builder.build_ret(Some(LLVMValue::Null(ret_ty.clone())));
                        }
                    }
                }
                Terminator::None => {
                    self.builder.build_unreachable();
                }
            }
        }
        self.builder.end_function();
        Ok(())
    }

    fn emit_bounds_check(&mut self, index: LLVMValue, capacity: i64) -> Result<(), CompileError> {
        let ok_block = format!("bounds_ok_{}", self.builder.next_reg_name());
        let oob_block = format!("bounds_fail_{}", self.builder.next_reg_name());
        
        let cmp_slt = self.builder.build_icmp("slt", index.clone(), LLVMValue::ConstI64(0));
        let cmp_sge = self.builder.build_icmp("sge", index.clone(), LLVMValue::ConstI64(capacity));
        let is_oob = self.builder.build_or(cmp_slt, cmp_sge);
        
        self.builder.build_cond_br(is_oob, &oob_block, &ok_block, None);
        
        self.builder.start_block(&oob_block);
        // self.builder.build_unreachable();
        self.builder.build_br(&ok_block, None);
        
        self.builder.start_block(&ok_block);
        Ok(())
    }

    fn lower_instruction(&mut self, instr: &IRInstruction, _soa_arrays: &Vec<(String, i64)>) -> Result<(), CompileError> {
        match instr {
            IRInstruction::Assign(dest, src) => {
                if matches!(src, IROperand::Void) { return Ok(()); }
                let src_val = self.operand_to_value(src)?;
                
                if let IROperand::Variable(name) = dest {
                    if let Some(ptr) = self.function_params.get(name).cloned() {
                        let ptr_inner_ty = match ptr.get_type() {
                            LLVMType::Pointer(inner) => *inner,
                            _ => ptr.get_type(),
                        };
                        if ptr_inner_ty != src_val.get_type() {
                            let coerced_val = if matches!(ptr_inner_ty, LLVMType::Pointer(_)) && matches!(src_val.get_type(), LLVMType::Pointer(_)) {
                                Some(self.builder.build_bitcast(src_val.clone(), ptr_inner_ty.clone()))
                            } else if matches!(ptr_inner_ty, LLVMType::Pointer(_)) && src_val.get_type() == LLVMType::I64 {
                                Some(self.builder.build_int_to_ptr(src_val.clone(), ptr_inner_ty.clone()))
                            } else if ptr_inner_ty == LLVMType::I64 && matches!(src_val.get_type(), LLVMType::Pointer(_)) {
                                Some(self.builder.build_ptr_to_int(src_val.clone(), LLVMType::I64))
                            } else {
                                None
                            };

                            if let Some(coerced) = coerced_val {
                                self.builder.build_store(coerced, ptr, None);
                            } else {
                                // Type changed (e.g. variable reused across when branches with different types):
                                // allocate a fresh uniquely-named slot and re-register.
                                let fresh = self.builder.next_reg_name();
                                let new_alloca = self.builder.build_alloca(&format!("ptr_{}_{}", name, fresh), src_val.get_type());
                                self.builder.build_store(src_val, new_alloca.clone(), None);
                                self.function_params.insert(name.clone(), new_alloca);
                            }
                            // Keep it in scalar_vars so operand_to_value still emits a load
                        } else {
                            self.builder.build_store(src_val, ptr, None);
                        }
                    } else {
                        // Allocate a stack slot so future reassignments store into a pointer, not a value
                        let alloca = self.builder.build_alloca(&format!("ptr_{}", name), src_val.get_type());
                        self.builder.build_store(src_val, alloca.clone(), None);
                        self.function_params.insert(name.clone(), alloca);
                        self.scalar_vars.insert(name.clone());
                    }
                } else if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, src_val);
                }
            }
            IRInstruction::UnaryOp(dest, op, operand) => {
                let op_val = self.operand_to_value(operand)?;
                let is_float = op_val.get_type() == LLVMType::Double;
                
                let res = match op {
                    UnaryOp::Negate => {
                        if is_float {
                            self.builder.build_fneg(op_val)
                        } else {
                            let zero = LLVMValue::ConstI64(0);
                            self.builder.build_sub(zero, op_val)
                        }
                    }
                    UnaryOp::Not => {
                        // true is 1 (i1), false is 0 (i1)
                        // xor with 1 flips the bit
                        let one = LLVMValue::ConstI1(true); // the builder will bitcast it to i1 if needed or just use i1 literal
                        self.builder.build_xor(op_val, one)
                    }
                };
                
                if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, res);
                }
            }
            IRInstruction::BinaryOp(dest, op, left, right) => {
                let l_val = self.operand_to_value(left)?;
                let r_val = self.operand_to_value(right)?;
                let is_float = l_val.get_type() == LLVMType::Double || r_val.get_type() == LLVMType::Double;
                let is_string = l_val.get_type() == LLVMType::Pointer(Box::new(LLVMType::I8));

                // Coerce null pointer to integer 0 when comparing with an integer type.
                // This handles nullable integer comparisons like `when some_nullable_int { None -> ... }`.
                let is_null_val = |v: &LLVMValue| matches!(v, LLVMValue::Null(_));
                let (l_val, r_val) = match (l_val.get_type(), r_val.get_type()) {
                    (LLVMType::I64, _) if is_null_val(&r_val) => (l_val, LLVMValue::ConstI64(0)),
                    (_, LLVMType::I64) if is_null_val(&l_val) => (LLVMValue::ConstI64(0), r_val),
                    _ => (l_val, r_val),
                };

                let res = match op {
                    BinaryOp::Add => {
                        if is_string {
                            // String concatenation: call string_concat(a, b) -> i8*
                            self.builder.build_call(
                                LLVMType::Pointer(Box::new(LLVMType::I8)),
                                "string_concat",
                                vec![l_val, r_val],
                            )
                        } else if is_float {
                            self.builder.build_fadd(l_val, r_val)
                        } else {
                            self.builder.build_add(l_val, r_val)
                        }
                    }
                    BinaryOp::Sub => if is_float { self.builder.build_fsub(l_val, r_val) } else { self.builder.build_sub(l_val, r_val) },
                    BinaryOp::Mul => if is_float { self.builder.build_fmul(l_val, r_val) } else { self.builder.build_mul(l_val, r_val) },
                    BinaryOp::Div => if is_float { self.builder.build_fdiv(l_val, r_val) } else { self.builder.build_sdiv(l_val, r_val) },
                    BinaryOp::Mod => self.builder.build_srem(l_val, r_val),
                    BinaryOp::Eq => if is_float { self.builder.build_fcmp("oeq", l_val, r_val) } else { self.builder.build_icmp("eq", l_val, r_val) },
                    BinaryOp::NotEq => if is_float { self.builder.build_fcmp("one", l_val, r_val) } else { self.builder.build_icmp("ne", l_val, r_val) },
                    BinaryOp::Lt => if is_float { self.builder.build_fcmp("olt", l_val, r_val) } else { self.builder.build_icmp("slt", l_val, r_val) },
                    BinaryOp::LtEq => if is_float { self.builder.build_fcmp("ole", l_val, r_val) } else { self.builder.build_icmp("sle", l_val, r_val) },
                    BinaryOp::Gt => if is_float { self.builder.build_fcmp("ogt", l_val, r_val) } else { self.builder.build_icmp("sgt", l_val, r_val) },
                    BinaryOp::GtEq => if is_float { self.builder.build_fcmp("oge", l_val, r_val) } else { self.builder.build_icmp("sge", l_val, r_val) },
                    BinaryOp::And | BinaryOp::BitAnd => self.builder.build_and(l_val, r_val),
                    BinaryOp::Or | BinaryOp::BitOr => self.builder.build_or(l_val, r_val),
                    BinaryOp::BitXor => self.builder.build_xor(l_val, r_val),
                    BinaryOp::Shl => self.builder.build_shl(l_val, r_val),
                    BinaryOp::Shr => self.builder.build_ashr(l_val, r_val),
                    BinaryOp::Pipe => unreachable!(),
                };

                if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, res);
                }
            }
            IRInstruction::Call(dest_opt, callee, args) => {
                let mut callee_str = match callee {
                    IROperand::Variable(n) => n.clone(),
                    _ => "unknown".to_string(),
                };
                callee_str = callee_str.replace("(", "_").replace(")", "").replace(", ", "_").replace("^", "Ptr");

                let mut arg_vals = Vec::new();
                for arg in args {
                    if let IROperand::Variable(vname) = arg {
                        if let Some(ptr) = self.function_params.get(vname) {
                            if let LLVMType::Pointer(_inner) = ptr.get_type() {
                                let mut has_stack_slot = false;
                                if let LLVMValue::Reg(reg_name, _) = ptr {
                                    if reg_name.starts_with("ptr_") || reg_name.starts_with("param_") {
                                        has_stack_slot = true;
                                    }
                                }
                                let is_scalar = if let Some(ty) = self.get_type(vname) {
                                    self.is_scalar_type(ty)
                                } else {
                                    false
                                };
                                let is_scalar = has_stack_slot && (is_scalar || self.scalar_vars.contains(vname) || vname.starts_with("param_"));
                                if is_scalar {
                                    arg_vals.push(self.builder.build_load(ptr.clone(), None)?);
                                } else {
                                    arg_vals.push(ptr.clone());
                                }
                            } else {
                                arg_vals.push(ptr.clone());
                            }
                        } else {
                            arg_vals.push(self.operand_to_value(arg)?);
                        }
                    } else {
                        arg_vals.push(self.operand_to_value(arg)?);
                    }
                }

                if callee_str.starts_with("alloc_array_") {
                    let type_name = callee_str.strip_prefix("alloc_array_").unwrap();
                    let target_ty = self.get_type(type_name).cloned().unwrap_or(TypeInfo::Int);
                    let element_size = match &target_ty {
                         TypeInfo::Float => 8,
                         TypeInfo::Boolean => 1,
                         _ => 8,
                    };
                    
                    let count_val = arg_vals[0].clone(); // First argument is capacity
                    let bytes_val = self.builder.build_mul(count_val, LLVMValue::ConstI64(element_size));
                    let alloc_call = self.builder.build_call(
                        LLVMType::Pointer(Box::new(LLVMType::I8)),
                        "malloc",
                        vec![bytes_val]
                    );
                    let target_llvm_ty = self.type_to_llvm(&target_ty);
                    let casted_ptr = self.builder.build_bitcast(alloc_call, LLVMType::Pointer(Box::new(target_llvm_ty)));
                    if let Some(IROperand::TempReg(t)) = dest_opt {
                        self.temp_map.insert(*t, casted_ptr);
                        self.temp_type_map.insert(*t, TypeInfo::Pointer(Box::new(target_ty)));
                    }
                } else if callee_str.starts_with("free_array_") {
                    let ptr_val = arg_vals[0].clone();
                    let void_ptr = self.builder.build_bitcast(ptr_val, LLVMType::Pointer(Box::new(LLVMType::I8)));
                    self.builder.build_call(
                        LLVMType::Void,
                        "free",
                        vec![void_ptr]
                    );
                } else if callee_str.starts_with("ptr_read_") {
                    let ptr_val = arg_vals[0].clone();
                    let offset_val = arg_vals[1].clone();
                    
                    let type_name = callee_str.strip_prefix("ptr_read_").unwrap();
                    let target_ty = self.get_type(type_name).cloned().unwrap_or(TypeInfo::Int);
                    let target_llvm_ty = self.type_to_llvm(&target_ty);
                    
                    let gep = self.builder.build_gep(target_llvm_ty, ptr_val, vec![offset_val]).unwrap();
                    let loaded = self.builder.build_load(gep, None).unwrap();
                    
                    if let Some(IROperand::TempReg(t)) = dest_opt {
                        self.temp_map.insert(*t, loaded);
                        self.temp_type_map.insert(*t, target_ty.clone());
                    }
                } else if callee_str.starts_with("ptr_write_") {
                    let ptr_val = arg_vals[0].clone();
                    let offset_val = arg_vals[1].clone();
                    let val_val = arg_vals[2].clone();
                    
                    let type_name = callee_str.strip_prefix("ptr_write_").unwrap();
                    let target_ty = self.get_type(type_name).unwrap_or(&TypeInfo::Int);
                    let target_llvm_ty = self.type_to_llvm(target_ty);
                    
                    let gep = self.builder.build_gep(target_llvm_ty, ptr_val, vec![offset_val]).unwrap();
                    self.builder.build_store(val_val, gep, None);
                } else {
                    let ret_ty = if dest_opt.is_none() {
                        LLVMType::Void
                    } else if let Some(known_ty) = self.func_ret_types.get(&callee_str) {
                        known_ty.clone()
                    } else {
                        LLVMType::I64 // fallback for unknown/runtime functions
                    };
                    let res = self.builder.build_call(ret_ty, &callee_str, arg_vals);
                    if let Some(IROperand::TempReg(t)) = dest_opt {
                        self.temp_map.insert(*t, res);
                        if let Some(semantic_ret_ty) = self.func_semantic_ret_types.get(&callee_str) {
                            self.temp_type_map.insert(*t, semantic_ret_ty.clone());
                        }
                    }
                }
            }
            IRInstruction::LoadProperty(dest, obj, prop) => {
                let raw_name = match obj {
                    IROperand::Variable(n) => n.clone(),
                    _ => "".to_string(),
                };
                let field_key = format!("{}_{}", raw_name, prop);
                
                let is_soa = self.function_params.contains_key(&field_key);
                let mut is_custom_struct = false;
                let mut struct_name = String::new();
                if !is_soa {
                    if let Some(var_ty) = self.get_operand_type(obj) {
                        if let Some(s_name) = self.get_struct_name(&var_ty) {
                            if self.data_structs.contains_key(&s_name) {
                                is_custom_struct = true;
                                struct_name = s_name;
                            }
                        }
                    }
                }

                let loaded = if is_custom_struct {
                    let heap_ptr = self.operand_to_value(obj)?;
                    let casted_i64_ptr = self.builder.build_bitcast(heap_ptr, LLVMType::Pointer(Box::new(LLVMType::I64)));
                    
                    let fields = self.data_structs.get(&struct_name).unwrap();
                    let index = fields.iter().position(|f| f == prop)
                        .ok_or_else(|| CompileError::BackendError(format!("Property '{}' not found on struct '{}'", prop, struct_name)))?;
                    
                    let element_ptr = self.builder.build_gep(LLVMType::I64, casted_i64_ptr, vec![LLVMValue::ConstI64(index as i64)])?;
                    
                    let field_ty = self.get_type(&field_key).or_else(|| self.get_type(&raw_name)).unwrap_or(&TypeInfo::Int);
                    let target_llvm_ty = self.type_to_llvm(field_ty);
                    let target_ptr = self.builder.build_bitcast(element_ptr, LLVMType::Pointer(Box::new(target_llvm_ty)));
                    
                    self.builder.build_load(target_ptr, Some(8))?
                } else {
                    let array_ptr = if let Some(p) = self.function_params.get(&field_key) {
                        p.clone()
                    } else if let Some(p) = self.function_params.get(&raw_name) {
                        p.clone()
                    } else {
                        return Err(CompileError::BackendError(format!("Missing array pointer for variable '{}' in LoadProperty", raw_name)));
                    };

                    let inner_ty = match array_ptr.get_type() {
                        LLVMType::Pointer(inner) => *inner,
                        _ => LLVMType::I64,
                    };
                    let element_ptr = self.builder.build_gep(inner_ty, array_ptr, vec![LLVMValue::ConstI64(0)])?;

                    let field_ty = self.get_type(&field_key).or_else(|| self.get_type(&raw_name)).unwrap_or(&TypeInfo::Int);
                    let target_llvm_ty = self.type_to_llvm(field_ty);
                    let casted_ptr = self.builder.build_bitcast(element_ptr, LLVMType::Pointer(Box::new(target_llvm_ty)));

                    self.builder.build_load(casted_ptr, Some(8))?
                };

                if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, loaded);
                }
            }
            IRInstruction::StoreProperty(obj, prop, val) => {
                let raw_name = match obj {
                    IROperand::Variable(n) => n.clone(),
                    _ => "".to_string(),
                };
                let field_key = format!("{}_{}", raw_name, prop);
                
                let is_soa = self.function_params.contains_key(&field_key);
                let mut is_custom_struct = false;
                let mut struct_name = String::new();
                if !is_soa {
                    let var_ty_opt = self.get_operand_type(obj);
                    if let Some(var_ty) = var_ty_opt {
                        if let Some(s_name) = self.get_struct_name(&var_ty) {
                            if self.data_structs.contains_key(&s_name) {
                                is_custom_struct = true;
                                struct_name = s_name;
                            }
                        }
                    }
                }

                let val_val = self.operand_to_value(val)?;

                if is_custom_struct {
                    let heap_ptr = self.operand_to_value(obj)?;
                    let casted_i64_ptr = self.builder.build_bitcast(heap_ptr, LLVMType::Pointer(Box::new(LLVMType::I64)));
                    
                    let fields = self.data_structs.get(&struct_name).unwrap();
                    let index = fields.iter().position(|f| f == prop)
                        .ok_or_else(|| CompileError::BackendError(format!("Property '{}' not found on struct '{}'", prop, struct_name)))?;
                    
                    let element_ptr = self.builder.build_gep(LLVMType::I64, casted_i64_ptr, vec![LLVMValue::ConstI64(index as i64)])?;
                    
                    let target_ptr = self.builder.build_bitcast(element_ptr, LLVMType::Pointer(Box::new(val_val.get_type())));
                    
                    self.builder.build_store(val_val, target_ptr, Some(8));
                } else {
                    let array_ptr = if let Some(p) = self.function_params.get(&field_key) {
                        p.clone()
                    } else if let Some(p) = self.function_params.get(&raw_name) {
                        p.clone()
                    } else {
                        return Err(CompileError::BackendError(format!("Missing array pointer for variable '{}' in StoreProperty", raw_name)));
                    };

                    let inner_ty = match array_ptr.get_type() {
                        LLVMType::Pointer(inner) => *inner,
                        _ => LLVMType::I64,
                    };
                    let element_ptr = self.builder.build_gep(inner_ty, array_ptr, vec![LLVMValue::ConstI64(0)])?;

                    let field_ty = self.get_type(&field_key).or_else(|| self.get_type(&raw_name)).unwrap_or(&TypeInfo::Int);
                    let target_llvm_ty = self.type_to_llvm(field_ty);
                    let casted_ptr = self.builder.build_bitcast(element_ptr, LLVMType::Pointer(Box::new(target_llvm_ty)));

                    self.builder.build_store(val_val, casted_ptr, Some(8));
                }
            }
            IRInstruction::LoadStructField(dest, ptr, index, type_name) => {
                let ptr_val = self.operand_to_value(ptr)?;
                // Cast to i64* to step by 8 bytes
                let casted_i64_ptr = self.builder.build_bitcast(ptr_val, LLVMType::Pointer(Box::new(LLVMType::I64)));
                let element_ptr = self.builder.build_gep(LLVMType::I64, casted_i64_ptr, vec![LLVMValue::ConstI64(*index as i64)])?;
                
                let field_llvm_ty = self.str_to_llvm_type(type_name);

                let target_ptr = self.builder.build_bitcast(element_ptr, LLVMType::Pointer(Box::new(field_llvm_ty)));
                let loaded = self.builder.build_load(target_ptr, Some(8))?;

                if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, loaded);
                }
            }
            IRInstruction::StoreStructField(ptr, index, val) => {
                let ptr_val = self.operand_to_value(ptr)?;
                let val_val = self.operand_to_value(val)?;

                // Cast to i64* to step by 8 bytes
                let casted_i64_ptr = self.builder.build_bitcast(ptr_val, LLVMType::Pointer(Box::new(LLVMType::I64)));
                let element_ptr = self.builder.build_gep(LLVMType::I64, casted_i64_ptr, vec![LLVMValue::ConstI64(*index as i64)])?;
                
                let target_ptr = self.builder.build_bitcast(element_ptr, LLVMType::Pointer(Box::new(val_val.get_type())));
                self.builder.build_store(val_val, target_ptr, Some(8));
            }
            IRInstruction::LoadArrayElement(dest, array_name, prop_name, index, capacity) => {
                let field_key = format!("{}_{}", array_name, prop_name);
                let array_ptr = if let Some(p) = self.function_params.get(&field_key) {
                    p.clone()
                } else if let Some(p) = self.function_params.get(array_name) {
                    p.clone()
                } else {
                    return Err(CompileError::BackendError(format!("Missing array pointer for variable '{}'", array_name)));
                };

                let idx_val = self.operand_to_value(index)?;
                
                // Bounds Check
                self.emit_bounds_check(idx_val.clone(), *capacity)?;

                let field_ty = self.get_type(&field_key).or_else(|| self.get_type(array_name)).unwrap_or(&TypeInfo::Int);
                let target_llvm_ty = self.type_to_llvm(field_ty);
                let casted_ptr = self.builder.build_bitcast(array_ptr, LLVMType::Pointer(Box::new(target_llvm_ty.clone())));

                let ptr = self.builder.build_gep(target_llvm_ty, casted_ptr, vec![idx_val])?;
                let loaded = self.builder.build_load(ptr, Some(8))?;

                if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, loaded);
                }
            }
            IRInstruction::StoreArrayElement(array_name, prop_name, index, val, capacity) => {
                let field_key = format!("{}_{}", array_name, prop_name);
                let array_ptr = if let Some(p) = self.function_params.get(&field_key) {
                    p.clone()
                } else if let Some(p) = self.function_params.get(array_name) {
                    p.clone()
                } else {
                    return Err(CompileError::BackendError(format!("Missing array pointer for variable '{}'", array_name)));
                };

                let idx_val = self.operand_to_value(index)?;
                let val_val = self.operand_to_value(val)?;
                
                // Bounds Check
                self.emit_bounds_check(idx_val.clone(), *capacity)?;

                let field_ty = self.get_type(&field_key).or_else(|| self.get_type(array_name)).unwrap_or(&TypeInfo::Int);
                let target_llvm_ty = self.type_to_llvm(field_ty);
                let casted_ptr = self.builder.build_bitcast(array_ptr, LLVMType::Pointer(Box::new(target_llvm_ty.clone())));

                let ptr = self.builder.build_gep(target_llvm_ty, casted_ptr, vec![idx_val])?;
                self.builder.build_store(val_val, ptr, Some(8));
            }
            IRInstruction::FlatVectorApply(target_array, operations, start_op, end_op, size) => {
                let start_val = self.operand_to_value(start_op)?;
                let end_val = self.operand_to_value(end_op)?;
                
                // Bounds Check
                self.emit_bounds_check(start_val.clone(), *size)?;
                
                // We also check end_val - 1 since end is exclusive, but for simplicity, just checking end_val <= size
                // Actually, if end_val > size, it's OOB.
                let end_sub_val = self.builder.build_sub(end_val.clone(), LLVMValue::ConstI64(1));
                self.emit_bounds_check(end_sub_val, *size)?;

                let loop_head = format!("vec_loop_head_{}", self.builder.next_reg_name());
                let loop_body = format!("vec_loop_body_{}", self.builder.next_reg_name());
                let loop_end = format!("vec_loop_end_{}", self.builder.next_reg_name());
                let pred_block = self.builder.current_block_name().unwrap_or("entry".to_string());
                
                let mut op_data = Vec::new();
                for (prop, op, right_val) in operations {
                    let field_key = format!("{}_{}", target_array, prop);
                    
                    let array_ptr = if let Some(p) = self.function_params.get(&field_key) {
                        p.clone()
                    } else if let Some(p) = self.function_params.get(target_array) {
                        p.clone()
                    } else {
                        return Err(CompileError::BackendError("Missing array pointer for target array in FlatVectorApply".to_string()));
                    };

                    let target_field_ty = self.get_type(&field_key).or_else(|| self.get_type(target_array)).cloned().unwrap_or(TypeInfo::Int);
                    let target_llvm_ty = self.type_to_llvm(&target_field_ty);
                    let target_casted_ptr = self.builder.build_bitcast(array_ptr, LLVMType::Pointer(Box::new(target_llvm_ty.clone())));

                    let rhs_processed = match right_val {
                        VectorOperand::Vector(rhs_arr, rhs_prop) => {
                            let rhs_field_key = format!("{}_{}", rhs_arr, rhs_prop);
                            let rhs_ptr = if let Some(p) = self.function_params.get(&rhs_field_key) {
                                p.clone()
                            } else if let Some(p) = self.function_params.get(rhs_arr) {
                                p.clone()
                            } else {
                                return Err(CompileError::BackendError("Missing array pointer for RHS array in FlatVectorApply".to_string()));
                            };

                            let rhs_field_ty = self.get_type(&rhs_field_key).or_else(|| self.get_type(rhs_arr)).cloned().unwrap_or(TypeInfo::Int);
                            let rhs_target_llvm_ty = self.type_to_llvm(&rhs_field_ty);
                            let rhs_casted_ptr = self.builder.build_bitcast(rhs_ptr, LLVMType::Pointer(Box::new(rhs_target_llvm_ty.clone())));
                            Some((rhs_casted_ptr, rhs_target_llvm_ty))
                        },
                        VectorOperand::Scalar(_) => None,
                    };

                    let scalar_r_val = match right_val {
                        VectorOperand::Scalar(val) => Some(self.operand_to_value(val)?),
                        VectorOperand::Vector(_, _) => None,
                    };

                    op_data.push((op.clone(), target_casted_ptr, target_llvm_ty, rhs_processed, scalar_r_val));
                }

                self.builder.build_br(&loop_head, None);
                
                self.builder.start_block(&loop_head);
                let next_idx_name = format!("next_idx_{}", self.builder.next_reg_name());
                let next_idx_val = LLVMValue::Reg(next_idx_name.clone(), LLVMType::I64);

                let idx_val = self.builder.build_phi(LLVMType::I64, vec![
                    (start_val, pred_block.clone()),
                    (next_idx_val.clone(), loop_body.clone())
                ]);
                
                let cmp = self.builder.build_icmp("slt", idx_val.clone(), end_val);
                self.builder.build_cond_br(cmp, &loop_body, &loop_end, None);
                
                self.builder.start_block(&loop_body);
                
                for (op, target_casted_ptr, target_llvm_ty, rhs_processed, scalar_r_val) in op_data {
                    let actual_r_val = if let Some((rhs_casted_ptr, rhs_llvm_ty)) = rhs_processed {
                        let rhs_gep = self.builder.build_gep(rhs_llvm_ty, rhs_casted_ptr, vec![idx_val.clone()])?;
                        self.builder.build_load(rhs_gep, Some(8))?
                    } else {
                        scalar_r_val.clone().unwrap()
                    };

                    let ptr = self.builder.build_gep(target_llvm_ty, target_casted_ptr, vec![idx_val.clone()])?;
                    
                    if op == AssignOp::Assign {
                        self.builder.build_store(actual_r_val, ptr, Some(8));
                    } else {
                        let loaded = self.builder.build_load(ptr.clone(), Some(8))?;
                        let is_float = loaded.get_type() == LLVMType::Double;
                        let result = match op {
                            AssignOp::AddAssign => if is_float { self.builder.build_fadd(loaded, actual_r_val) } else { self.builder.build_add(loaded, actual_r_val) },
                            AssignOp::SubAssign => if is_float { self.builder.build_fsub(loaded, actual_r_val) } else { self.builder.build_sub(loaded, actual_r_val) },
                            AssignOp::MulAssign => if is_float { self.builder.build_fmul(loaded, actual_r_val) } else { self.builder.build_mul(loaded, actual_r_val) },
                            AssignOp::DivAssign => if is_float { self.builder.build_fdiv(loaded, actual_r_val) } else { self.builder.build_sdiv(loaded, actual_r_val) },
                            AssignOp::Assign => unreachable!(),
                        };
                        self.builder.build_store(result, ptr, Some(8));
                    }
                }
                
                self.builder.build_add_with_name(&next_idx_name, idx_val, LLVMValue::ConstI64(1));
                self.builder.build_br(&loop_head, Some("!llvm.loop !1"));
                
                self.builder.start_block(&loop_end);
            }
            IRInstruction::ExtractTag(dest, target_struct) => {
                let target_val = self.operand_to_value(target_struct)?;
                let idx_val = LLVMValue::ConstI64(0);
                let casted_target = self.builder.build_bitcast(target_val, LLVMType::Pointer(Box::new(LLVMType::I64)));
                let ptr = self.builder.build_gep(LLVMType::I64, casted_target, vec![idx_val])?;
                let tag_val = self.builder.build_load(ptr, Some(8))?;
                
                if let IROperand::Variable(name) = dest {
                    if let Some(dest_ptr) = self.function_params.get(name) {
                        self.builder.build_store(tag_val, dest_ptr.clone(), None);
                    } else {
                        self.function_params.insert(name.clone(), tag_val);
                    }
                } else if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, tag_val);
                }
            }
            IRInstruction::Alloc(dest, type_name, size_in_bytes) => {
                let parsed_ty = TypeInfo::Custom(type_name.clone());
                let target_llvm_ty = self.type_to_llvm(&parsed_ty);
                let cast_ty = LLVMType::Pointer(Box::new(target_llvm_ty));

                let size_val = LLVMValue::ConstI64(*size_in_bytes as i64);

                let alloc_call = self.builder.build_call(
                    LLVMType::Pointer(Box::new(LLVMType::I8)),
                    "malloc",
                    vec![size_val]
                );

                let casted_ptr = self.builder.build_bitcast(alloc_call, cast_ty);
                
                if let IROperand::Variable(name) = dest {
                    if let Some(dest_ptr) = self.function_params.get(name) {
                        self.builder.build_store(casted_ptr.clone(), dest_ptr.clone(), None);
                    } else {
                        self.function_params.insert(name.clone(), casted_ptr);
                    }
                } else if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, casted_ptr);
                }
            }
            IRInstruction::Free(target) => {
                let ptr_val = self.operand_to_value(target)?;
                let void_ptr = self.builder.build_bitcast(ptr_val, LLVMType::Pointer(Box::new(LLVMType::I8)));
                self.builder.build_call(
                    LLVMType::Void,
                    "free",
                    vec![void_ptr]
                );
            }
            IRInstruction::LoadPointer(dest, ptr) => {
                let ptr_val = self.operand_to_value(ptr)?;
                
                // Determine the semantic type of the pointer and the loaded value
                let ptr_ty_opt = self.get_operand_type(ptr);
                let loaded_ty = if let Some(ty) = &ptr_ty_opt {
                    match ty {
                        TypeInfo::Pointer(inner) => Some((**inner).clone()),
                        other => Some(other.clone()),
                    }
                } else {
                    None
                };
                
                // Determine if we are dereferencing a pointer to a custom/choice struct.
                // A custom/choice struct is already represented as a pointer in LLVM (e.g., i64*).
                // Dereferencing it is a no-op because operand_to_value already loads from
                // the alloca, giving us the struct pointer — no second load is needed.
                //
                // We check BOTH Pointer(Custom(X)) and bare Custom(X) because the type_env
                // is a flat HashMap and variable names reused across scopes can cause the
                // Pointer wrapper to be lost (the later scope's type overwrites the earlier one).
                let mut is_custom_or_choice = false;
                let mut is_parameter = false;
                if let IROperand::Variable(name) = ptr {
                    if self.parameter_names.contains(name) {
                        is_parameter = true;
                    }
                }
                
                if !is_parameter {
                    if let Some(ty) = &ptr_ty_opt {
                        if self.is_custom_or_choice_type(ty) {
                            is_custom_or_choice = true;
                        }
                    }
                }
                
                let loaded_val = if is_custom_or_choice {
                    ptr_val
                } else {
                    let mut target_llvm_ty = LLVMType::I64;
                    if let Some(ty) = &loaded_ty {
                        target_llvm_ty = self.type_to_llvm(ty);
                    }
                    
                    let casted_ptr = self.builder.build_bitcast(ptr_val, LLVMType::Pointer(Box::new(target_llvm_ty)));
                    self.builder.build_load(casted_ptr, None)?
                };
                
                if let IROperand::Variable(name) = dest {
                    if let Some(dest_ptr) = self.function_params.get(name) {
                        self.builder.build_store(loaded_val.clone(), dest_ptr.clone(), None);
                    } else {
                        self.function_params.insert(name.clone(), loaded_val.clone());
                    }
                } else if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, loaded_val.clone());
                    if let Some(ty) = loaded_ty {
                        self.temp_type_map.insert(*t, ty);
                    }
                }
            }
            IRInstruction::StorePointer(dest_ptr, source_val) => {
                let ptr_val = self.operand_to_value(dest_ptr)?;
                let val_val = self.operand_to_value(source_val)?;

                // If dest_ptr is a pointer to a custom struct, copy the entire struct field by field
                let mut struct_name = None;
                if let IROperand::Variable(name) = dest_ptr {
                    if let Some(ty) = self.get_type(name) {
                        struct_name = self.get_struct_name(ty);
                    }
                }

                if let Some(s_name) = struct_name {
                    if self.data_structs.contains_key(&s_name) {
                        let fields = self.data_structs.get(&s_name).unwrap();
                        let num_fields = fields.len();
                        
                        let src_cast = self.builder.build_bitcast(val_val, LLVMType::Pointer(Box::new(LLVMType::I64)));
                        let dest_cast = self.builder.build_bitcast(ptr_val, LLVMType::Pointer(Box::new(LLVMType::I64)));
                        
                        for i in 0..num_fields {
                            let src_field_ptr = self.builder.build_gep(LLVMType::I64, src_cast.clone(), vec![LLVMValue::ConstI64(i as i64)])?;
                            let val = self.builder.build_load(src_field_ptr, None)?;
                            let dest_field_ptr = self.builder.build_gep(LLVMType::I64, dest_cast.clone(), vec![LLVMValue::ConstI64(i as i64)])?;
                            self.builder.build_store(val, dest_field_ptr, None);
                        }
                    } else {
                        let casted_ptr = self.builder.build_bitcast(ptr_val, LLVMType::Pointer(Box::new(val_val.get_type())));
                        self.builder.build_store(val_val, casted_ptr, None);
                    }
                } else {
                    let casted_ptr = self.builder.build_bitcast(ptr_val, LLVMType::Pointer(Box::new(val_val.get_type())));
                    self.builder.build_store(val_val, casted_ptr, None);
                }
            }
            IRInstruction::ConstructADT(dest, expected_tag, args) => {
                let size_in_bytes = (args.len() as i64 + 1) * 8;
                let alloc_call = self.builder.build_call(
                    LLVMType::Pointer(Box::new(LLVMType::I8)),
                    "malloc",
                    vec![LLVMValue::ConstI64(size_in_bytes)]
                );
                let ptr = self.builder.build_bitcast(alloc_call, LLVMType::Pointer(Box::new(LLVMType::I64)));
                
                let tag_ptr = self.builder.build_gep(LLVMType::I64, ptr.clone(), vec![LLVMValue::ConstI64(0)])?;
                self.builder.build_store(LLVMValue::ConstI64(*expected_tag), tag_ptr, None);
                
                for (i, arg) in args.iter().enumerate() {
                    let arg_val = self.operand_to_value(arg)?;
                    let offset = i as i64 + 1;
                    
                    let arg_ptr = self.builder.build_gep(LLVMType::I64, ptr.clone(), vec![LLVMValue::ConstI64(offset)])?;
                    let arg_type = arg_val.get_type();
                    let casted_arg_ptr = self.builder.build_bitcast(arg_ptr, LLVMType::Pointer(Box::new(arg_type)));
                    self.builder.build_store(arg_val, casted_arg_ptr, None);
                }
                
                // Always store the pointer directly (never via alloca) — ADT vars are excluded from scalar_vars
                if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, ptr.clone());
                } else if let IROperand::Variable(name) = dest {
                    self.function_params.insert(name.clone(), ptr.clone());
                }
            }
            IRInstruction::ExtractPayload(dest, target_struct, payload_index) => {
                let target_val = self.operand_to_value(target_struct)?;
                let offset = *payload_index as i64 + 1;
                let idx_val = LLVMValue::ConstI64(offset);
                
                let mut target_llvm_ty = LLVMType::I64;
                if let IROperand::Variable(name) = dest {
                    if let Some(ty) = self.get_type(name) {
                        target_llvm_ty = self.type_to_llvm(ty);
                    }
                }
                
                let casted_target = self.builder.build_bitcast(target_val, LLVMType::Pointer(Box::new(LLVMType::I64)));
                let ptr = self.builder.build_gep(LLVMType::I64, casted_target, vec![idx_val])?;
                let casted_ptr = self.builder.build_bitcast(ptr, LLVMType::Pointer(Box::new(target_llvm_ty.clone())));
                let payload_val = self.builder.build_load(casted_ptr, Some(8))?;
                
                if let IROperand::Variable(name) = dest {
                    if let Some(dest_ptr) = self.function_params.get(name).cloned() {
                        // Bitcast the dest_ptr if its element type doesn't match the payload type
                        let target_ptr = match dest_ptr.get_type() {
                            LLVMType::Pointer(inner) if *inner != payload_val.get_type() => {
                                self.builder.build_bitcast(dest_ptr, LLVMType::Pointer(Box::new(payload_val.get_type())))
                            }
                            _ => dest_ptr,
                        };
                        self.builder.build_store(payload_val, target_ptr, None);
                    } else {
                        let alloca = self.builder.build_alloca(&format!("ptr_{}", name), payload_val.get_type());
                        self.builder.build_store(payload_val, alloca.clone(), None);
                        self.function_params.insert(name.clone(), alloca);
                        self.scalar_vars.insert(name.clone());
                    }
                } else if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, payload_val);
                }
            }
            IRInstruction::LoadStringChar(dest, str_ptr, index) => {
                let str_val = self.operand_to_value(str_ptr)?;
                let idx_val = self.operand_to_value(index)?;
                
                // Get pointer to character
                let char_ptr = self.builder.build_gep(LLVMType::I8, str_val, vec![idx_val])?;
                // Load i8 character
                let char_val = self.builder.build_load(char_ptr, Some(1))?;
                // Zero extend to i64 to match Nera Int/Char representation
                let char_i64 = self.builder.build_zext(char_val, LLVMType::I64);
                
                if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, char_i64);
                }
            }
            IRInstruction::Substring(dest, str_ptr, start_op, end_op) => {
                let str_val = self.operand_to_value(str_ptr)?;
                let start_val = self.operand_to_value(start_op)?;
                let end_val = self.operand_to_value(end_op)?;
                
                let len = self.builder.build_sub(end_val, start_val.clone());
                let alloc_size = self.builder.build_add(len.clone(), LLVMValue::ConstI64(1)); // +1 for null terminator
                
                let new_str = self.builder.build_call(
                    LLVMType::Pointer(Box::new(LLVMType::I8)),
                    "malloc",
                    vec![alloc_size]
                );
                
                let src_ptr = self.builder.build_gep(LLVMType::I8, str_val, vec![start_val])?;
                
                self.builder.build_call(
                    LLVMType::Pointer(Box::new(LLVMType::I8)),
                    "strncpy",
                    vec![new_str.clone(), src_ptr, len.clone()]
                );
                
                // Add null terminator
                let null_ptr = self.builder.build_gep(LLVMType::I8, new_str.clone(), vec![len])?;
                self.builder.build_store(LLVMValue::ConstI8(0), null_ptr, Some(1));
                
                if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, new_str);
                }
            }
            IRInstruction::StringCompare(dest, left, right, is_eq) => {
                let left_val = self.operand_to_value(left)?;
                let right_val = self.operand_to_value(right)?;
                
                let cmp_res = self.builder.build_call(
                    LLVMType::I32,
                    "strcmp",
                    vec![left_val, right_val]
                );
                
                let bool_res = if *is_eq {
                    self.builder.build_icmp("eq", cmp_res, LLVMValue::ConstI32(0))
                } else {
                    self.builder.build_icmp("ne", cmp_res, LLVMValue::ConstI32(0))
                };
                
                if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, bool_res);
                }
            }
            IRInstruction::Cast(dest, target_type, src) => {
                let src_val = self.operand_to_value(src)?;
                let src_ty = src_val.get_type();
                let dest_ty = self.str_to_llvm_type(target_type);

                let casted_val = match (src_ty, dest_ty) {
                    (LLVMType::I64, LLVMType::Double) => self.builder.build_sitofp(src_val, LLVMType::Double),
                    (LLVMType::Double, LLVMType::I64) => self.builder.build_fptosi(src_val, LLVMType::I64),
                    (LLVMType::I1, LLVMType::I64) => self.builder.build_zext(src_val, LLVMType::I64),
                    (LLVMType::I64, LLVMType::I1) => self.builder.build_icmp("ne", src_val, LLVMValue::ConstI64(0)),
                    (LLVMType::I64, LLVMType::I64) => src_val, // No-op
                    _ => src_val, // Fallback
                };

                if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, casted_val);
                }
            }
        }
        Ok(())
    }

    fn operand_to_value(&mut self, op: &IROperand) -> Result<LLVMValue, CompileError> {
        match op {
            IROperand::LiteralInt(v) => Ok(LLVMValue::ConstI64(*v)),
            IROperand::LiteralFloat(v) => Ok(LLVMValue::ConstDouble(*v)),
            IROperand::LiteralString(v) => Ok(self.builder.build_global_string_ptr(v)),
            IROperand::LiteralChar(v) => Ok(LLVMValue::ConstI64(*v)),
            IROperand::LiteralBool(v) => Ok(LLVMValue::ConstI1(*v)),
            IROperand::Variable(name) => {
                if let Some(ptr) = self.function_params.get(name) {
                    if let LLVMType::Pointer(_) = ptr.get_type() {
                        let mut has_stack_slot = false;
                        if let LLVMValue::Reg(reg_name, _) = ptr {
                            if reg_name.starts_with("ptr_") || reg_name.starts_with("param_") {
                                has_stack_slot = true;
                            }
                        }
                        let is_scalar = if let Some(ty) = self.get_type(name) {
                            self.is_scalar_type(ty)
                        } else {
                            false
                        };
                        let is_scalar = has_stack_slot && (is_scalar || self.scalar_vars.contains(name) || name.starts_with("param_"));
                        if is_scalar {
                            self.builder.build_load(ptr.clone(), None)
                        } else {
                            Ok(ptr.clone())
                        }
                    } else {
                        Ok(ptr.clone())
                    }
                } else {
                    let var_ty = self.get_type(name).cloned().unwrap_or(TypeInfo::Int);
                    Ok(LLVMValue::Reg(name.clone(), self.type_to_llvm(&var_ty)))
                }
            },
            IROperand::TempReg(t) => {
                if let Some(v) = self.temp_map.get(t) {
                    Ok(v.clone())
                } else {
                    Ok(LLVMValue::Reg(format!("t{}", t), LLVMType::I64))
                }
            },
            IROperand::Void => Ok(LLVMValue::Null(LLVMType::Void)),
            IROperand::NoneLiteral => Ok(LLVMValue::Null(LLVMType::Pointer(Box::new(LLVMType::I8)))),
        }
    }
}