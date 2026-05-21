use std::collections::HashMap;
use crate::frontend::sema::TypeInfo;
use crate::frontend::ast::{AssignOp, BinaryOp};
use crate::error::CompileError;
use crate::midend::ir::{IRInstruction, IROperand, IRFunction, Terminator};
use crate::midend::optimizer::OptimizedIR;
use crate::backend::llvm_ir::{LLVMType, LLVMValue, IRBuilder};

pub struct LLVMGenerator {
    pub type_env: HashMap<String, TypeInfo>,
    builder: IRBuilder,
    temp_map: HashMap<usize, LLVMValue>,
    function_params: HashMap<String, LLVMValue>,
    scalar_vars: std::collections::HashSet<String>,
    main_arena_ptr: Option<LLVMValue>,
    shared_vec_idx: Option<LLVMValue>,
}

impl LLVMGenerator {
    pub fn new() -> Self {
        Self {
            type_env: HashMap::new(),
            builder: IRBuilder::new("nera_program"),
            temp_map: HashMap::new(),
            function_params: HashMap::new(),
            scalar_vars: std::collections::HashSet::new(),
            main_arena_ptr: None,
            shared_vec_idx: None,
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
                let inner_llvm = self.type_to_llvm(inner);
                LLVMType::Pointer(Box::new(inner_llvm))
            }
            TypeInfo::Void => LLVMType::Void,
            _ => LLVMType::I64,
        }
    }

    pub fn generate(&mut self, optimized_ir: &OptimizedIR, type_env: HashMap<String, TypeInfo>) -> Result<String, CompileError> {
        self.type_env = type_env;
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
        let mut adt_vars: std::collections::HashSet<String> = std::collections::HashSet::new();
        for func in &optimized_ir.functions {
            for block in &func.blocks {
                for instr in &block.instrs {
                    if let IRInstruction::ConstructADT(IROperand::Variable(name), _, _) = instr {
                        adt_vars.insert(name.clone());
                    }
                    // Also catch Assign(var, TempReg) where the temp came from ConstructADT
                    if let IRInstruction::ConstructADT(IROperand::TempReg(_), _, _) = instr {}
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
                            adt_vars.insert(name.clone());
                        }
                    }
                }
            }
        }

        self.scalar_vars.clear();
        for instr in &optimized_ir.global_instructions {
            if let IRInstruction::Assign(IROperand::Variable(name), src) = instr {
                if !matches!(src, IROperand::Void) && !actual_soa_arrays.iter().any(|(n, _)| n == name) && !adt_vars.contains(name) {
                    self.scalar_vars.insert(name.clone());
                }
            }
        }
        for func in &optimized_ir.functions {
            for block in &func.blocks {
                for instr in &block.instrs {
                    if let IRInstruction::Assign(IROperand::Variable(name), src) = instr {
                        if !matches!(src, IROperand::Void) && !actual_soa_arrays.iter().any(|(n, _)| n == name) && !adt_vars.contains(name) {
                            self.scalar_vars.insert(name.clone());
                        }
                    }
                }
            }
        }

        self.builder.declare("declare i8* @aligned_alloc(i64, i64)");
        self.builder.declare("declare void @free(i8*)");
        self.builder.declare("declare i64 @print_int(i64)");
        self.builder.declare("declare i64 @print_float(double)");

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
        let ret_info = match func.return_type.as_str() {
            "Int" => TypeInfo::Int,
            "Float" => TypeInfo::Float,
            "Boolean" => TypeInfo::Boolean,
            "String" => TypeInfo::String,
            "Void" => TypeInfo::Void,
            _ => TypeInfo::Custom(func.return_type.clone()),
        };
        let mut ret_ty = self.type_to_llvm(&ret_info);
        if func.name == "main" {
            ret_ty = LLVMType::I32;
        }

        self.temp_map.clear();
        self.function_params.clear();
        self.main_arena_ptr = None;
        self.shared_vec_idx = None;

        let mut params = Vec::new();
        for param in &func.params {
            let param_ty = self.type_env.get(param).unwrap_or(&TypeInfo::Int);
            let llvm_ty = self.type_to_llvm(param_ty);
            let is_scalar = !param.contains("soa_") && !param.contains('_');
            if is_scalar {
                params.push((format!("param_{}", param), llvm_ty));
                self.scalar_vars.insert(param.clone());
            } else {
                params.push((param.clone(), llvm_ty));
            }
        }

        self.builder.start_function(&func.name, ret_ty.clone(), params.clone());

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
                        let arena_start_i8 = self.builder.build_call(LLVMType::Pointer(Box::new(LLVMType::I8)), "aligned_alloc", vec![LLVMValue::ConstI64(32), LLVMValue::ConstI64(32)]);
                        self.main_arena_ptr = Some(arena_start_i8);
                    } else {
                        let mut size_of_struct: i64 = 0;
                        
                        for (soa_array, _sz) in soa_arrays {
                            let field_ty = self.type_env.get(soa_array).unwrap_or(&TypeInfo::Int);
                            let bytes = match field_ty {
                                TypeInfo::Float => 8,
                                TypeInfo::Boolean => 1,
                                _ => 8, // Int is i64
                            };
                            size_of_struct += bytes;
                        }
                        
                        let arena_size = total_elements * size_of_struct;
                        let arena_size_val = LLVMValue::ConstI64(arena_size.max(8)); // at least 8 bytes

                        let arena_start_i8 = self.builder.build_call(LLVMType::Pointer(Box::new(LLVMType::I8)), "aligned_alloc", vec![LLVMValue::ConstI64(32), arena_size_val]);
                        self.main_arena_ptr = Some(arena_start_i8.clone());
                        let arena_start = self.builder.build_bitcast(arena_start_i8.clone(), LLVMType::Pointer(Box::new(LLVMType::I64)));


                    let mut current_offset = 0;
                    for (soa_array, _sz) in soa_arrays {
                        let offset_val = LLVMValue::ConstI64(current_offset);
                        let ptr_reg = self.builder.build_gep(LLVMType::I64, arena_start.clone(), vec![offset_val])?;
                        
                        let field_ty = self.type_env.get(soa_array).unwrap_or(&TypeInfo::Int);
                        let ptr_ty = LLVMType::Pointer(Box::new(self.type_to_llvm(field_ty)));
                        
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
                    let var_ty = self.type_env.get(&var).unwrap_or(&TypeInfo::Int);
                    let llvm_ty = self.type_to_llvm(var_ty);
                    let alloca = self.builder.build_alloca(&format!("ptr_{}", var), llvm_ty.clone());
                    self.function_params.insert(var.clone(), alloca);
                }

                for (name, ty) in &params {
                    let raw_name = if name.starts_with("param_") { name.strip_prefix("param_").ok_or_else(|| CompileError::BackendError(format!("Malformed param name: {}", name)))? } else { name.as_str() };
                    if let Some(alloca) = self.function_params.get(raw_name) {
                        if alloca.get_type() == LLVMType::Pointer(Box::new(ty.clone())) {
                            self.builder.build_store(LLVMValue::Reg(name.clone(), ty.clone()), alloca.clone(), None);
                        }
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
                    self.builder.build_br(target);
                }
                Terminator::Branch(cond, true_lbl, false_lbl) => {
                    let cond_val = self.operand_to_value(cond)?;
                    self.builder.build_cond_br(cond_val, true_lbl, false_lbl);
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
                            self.builder.build_ret(Some(val_val));
                        }
                    } else {
                        if func.name == "main" {
                            self.builder.build_ret(Some(LLVMValue::ConstI32(0)));
                        } else if ret_ty == LLVMType::Void {
                            self.builder.build_ret(None);
                        } else {
                            self.builder.build_ret(Some(LLVMValue::ConstI64(0)));
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

    fn lower_instruction(&mut self, instr: &IRInstruction, soa_arrays: &Vec<(String, i64)>) -> Result<(), CompileError> {
        match instr {
            IRInstruction::Assign(dest, src) => {
                if matches!(src, IROperand::Void) { return Ok(()); }
                let src_val = self.operand_to_value(src)?;
                
                if let IROperand::Variable(name) = dest {
                    if let Some(ptr) = self.function_params.get(name) {
                        self.builder.build_store(src_val, ptr.clone(), None);
                    } else {
                        // For non-alloca vars, map directly to reg
                        self.function_params.insert(name.clone(), src_val);
                    }
                } else if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, src_val);
                }
            }
            IRInstruction::BinaryOp(dest, op, left, right) => {
                let l_val = self.operand_to_value(left)?;
                let r_val = self.operand_to_value(right)?;
                let is_float = l_val.get_type() == LLVMType::Double || r_val.get_type() == LLVMType::Double;
                
                let res = match op {
                    BinaryOp::Add => if is_float { self.builder.build_fadd(l_val, r_val) } else { self.builder.build_add(l_val, r_val) },
                    BinaryOp::Sub => if is_float { self.builder.build_fsub(l_val, r_val) } else { self.builder.build_sub(l_val, r_val) },
                    BinaryOp::Mul => if is_float { self.builder.build_fmul(l_val, r_val) } else { self.builder.build_mul(l_val, r_val) },
                    BinaryOp::Div => if is_float { self.builder.build_fdiv(l_val, r_val) } else { self.builder.build_sdiv(l_val, r_val) },
                    BinaryOp::Eq => if is_float { self.builder.build_fcmp("oeq", l_val, r_val) } else { self.builder.build_icmp("eq", l_val, r_val) },
                    BinaryOp::NotEq => if is_float { self.builder.build_fcmp("one", l_val, r_val) } else { self.builder.build_icmp("ne", l_val, r_val) },
                    BinaryOp::Lt => if is_float { self.builder.build_fcmp("olt", l_val, r_val) } else { self.builder.build_icmp("slt", l_val, r_val) },
                    BinaryOp::LtEq => if is_float { self.builder.build_fcmp("ole", l_val, r_val) } else { self.builder.build_icmp("sle", l_val, r_val) },
                    BinaryOp::Gt => if is_float { self.builder.build_fcmp("ogt", l_val, r_val) } else { self.builder.build_icmp("sgt", l_val, r_val) },
                    BinaryOp::GtEq => if is_float { self.builder.build_fcmp("oge", l_val, r_val) } else { self.builder.build_icmp("sge", l_val, r_val) },
                    BinaryOp::And => self.builder.build_and(l_val, r_val),
                    BinaryOp::Or => self.builder.build_or(l_val, r_val),
                    BinaryOp::Pipe => unreachable!(),
                };

                if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, res);
                }
            }
            IRInstruction::Call(dest_opt, callee, args) => {
                let callee_str = match callee {
                    IROperand::Variable(n) => n.clone(),
                    _ => "unknown".to_string(),
                };

                let mut arg_vals = Vec::new();
                for arg in args {
                    if let IROperand::Variable(vname) = arg {
                        if let Some(ptr) = self.function_params.get(vname) {
                            if let LLVMType::Pointer(inner) = ptr.get_type() {
                                let is_scalar = self.scalar_vars.contains(vname) || vname.starts_with("param_");
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

                let ret_ty = if dest_opt.is_some() { LLVMType::I64 } else { LLVMType::Void };
                let res = self.builder.build_call(ret_ty, &callee_str, arg_vals);
                if let Some(IROperand::TempReg(t)) = dest_opt {
                    self.temp_map.insert(*t, res);
                }
            }
            IRInstruction::LoadProperty(dest, obj, prop) => {
                let raw_name = match obj {
                    IROperand::Variable(n) => n.clone(),
                    _ => "".to_string(),
                };
                let field_key = format!("{}_{}", raw_name, prop);
                
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

                let field_ty = self.type_env.get(&field_key).or_else(|| self.type_env.get(&raw_name)).unwrap_or(&TypeInfo::Int);
                let target_llvm_ty = self.type_to_llvm(field_ty);
                let casted_ptr = self.builder.build_bitcast(element_ptr, LLVMType::Pointer(Box::new(target_llvm_ty)));

                // Align 32 for SIMD capability
                let loaded = self.builder.build_load(casted_ptr, Some(32))?;

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

                let field_ty = self.type_env.get(&field_key).or_else(|| self.type_env.get(&raw_name)).unwrap_or(&TypeInfo::Int);
                let target_llvm_ty = self.type_to_llvm(field_ty);
                let casted_ptr = self.builder.build_bitcast(element_ptr, LLVMType::Pointer(Box::new(target_llvm_ty)));

                let val_val = self.operand_to_value(val)?;
                // Align 32 for SIMD capability
                self.builder.build_store(val_val, casted_ptr, Some(32));
            }
            IRInstruction::FlatVectorApply(target_array, prop, op, right_val, size) => {
                let r_val = self.operand_to_value(right_val)?;
                let loop_head = format!("vec_loop_head_{}", self.builder.next_reg_name());
                let loop_body = format!("vec_loop_body_{}", self.builder.next_reg_name());
                let loop_end = format!("vec_loop_end_{}", self.builder.next_reg_name());
                
                let pred_block = self.builder.current_block_name().unwrap_or("entry".to_string());

                let field_key = format!("{}_{}", target_array, prop);
                
                let array_ptr = if let Some(p) = self.function_params.get(&field_key) {
                    p.clone()
                } else if let Some(p) = self.function_params.get(target_array) {
                    p.clone()
                } else {
                    return Err(CompileError::BackendError("Missing array pointer for target array in FlatVectorApply".to_string()));
                };

                let inner_ty = match array_ptr.get_type() {
                    LLVMType::Pointer(inner) => *inner,
                    _ => LLVMType::I64,
                };

                let idx_ptr = self.shared_vec_idx.clone().ok_or_else(|| CompileError::BackendError("Missing shared vector index inside FlatVectorApply block".to_string()))?;
                self.builder.build_store(LLVMValue::ConstI64(0), idx_ptr.clone(), None);

                self.builder.build_br(&loop_head);
                
                self.builder.start_block(&loop_head);
                let idx_val = self.builder.build_load(idx_ptr.clone(), None)?;
                
                let cmp = self.builder.build_icmp("slt", idx_val.clone(), LLVMValue::ConstI64(*size));
                self.builder.build_cond_br(cmp, &loop_body, &loop_end);
                
                self.builder.start_block(&loop_body);
                let ptr = self.builder.build_gep(inner_ty.clone(), array_ptr, vec![idx_val.clone()])?;
                
                let field_ty = self.type_env.get(&field_key).or_else(|| self.type_env.get(target_array)).unwrap_or(&TypeInfo::Int);
                let target_llvm_ty = self.type_to_llvm(field_ty);
                let casted_ptr = self.builder.build_bitcast(ptr, LLVMType::Pointer(Box::new(target_llvm_ty)));

                if *op == AssignOp::Assign {
                    self.builder.build_store(r_val, casted_ptr, Some(32));
                } else {
                    let loaded = self.builder.build_load(casted_ptr.clone(), Some(32))?;
                    let is_float = loaded.get_type() == LLVMType::Double;
                    let result = match op {
                        AssignOp::AddAssign => if is_float { self.builder.build_fadd(loaded, r_val) } else { self.builder.build_add(loaded, r_val) },
                        AssignOp::SubAssign => if is_float { self.builder.build_fsub(loaded, r_val) } else { self.builder.build_sub(loaded, r_val) },
                        AssignOp::MulAssign => if is_float { self.builder.build_fmul(loaded, r_val) } else { self.builder.build_mul(loaded, r_val) },
                        AssignOp::DivAssign => if is_float { self.builder.build_fdiv(loaded, r_val) } else { self.builder.build_sdiv(loaded, r_val) },
                        AssignOp::Assign => unreachable!(),
                    };
                    self.builder.build_store(result, casted_ptr, Some(32));
                }
                
                let next_idx = self.builder.build_add(idx_val, LLVMValue::ConstI64(1));
                self.builder.build_store(next_idx, idx_ptr, None);
                self.builder.build_br(&loop_head);
                
                self.builder.start_block(&loop_end);
            }
            IRInstruction::ExtractTag(dest, target_struct) => {
                let target_val = self.operand_to_value(target_struct)?;
                let idx_val = LLVMValue::ConstI64(0);
                let ptr = self.builder.build_gep(LLVMType::I64, target_val, vec![idx_val])?;
                let casted_ptr = self.builder.build_bitcast(ptr, LLVMType::Pointer(Box::new(LLVMType::I64)));
                let tag_val = self.builder.build_load(casted_ptr, Some(8))?;
                
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
            IRInstruction::Alloc(dest, type_name) => {
                let alloc_call = self.builder.build_call(
                    LLVMType::Pointer(Box::new(LLVMType::I8)),
                    "aligned_alloc",
                    vec![LLVMValue::ConstI64(32), LLVMValue::ConstI64(64)]
                );
                
                let target_llvm_ty = if let Some(ty) = self.type_env.get(type_name) {
                    self.type_to_llvm(ty)
                } else {
                    LLVMType::I64
                };
                
                let casted_ptr = self.builder.build_bitcast(alloc_call, LLVMType::Pointer(Box::new(target_llvm_ty)));
                
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
            IRInstruction::LoadPointer(dest, ptr) => {
                let ptr_val = self.operand_to_value(ptr)?;
                let loaded_val = self.builder.build_load(ptr_val, None)?;
                
                if let IROperand::Variable(name) = dest {
                    if let Some(dest_ptr) = self.function_params.get(name) {
                        self.builder.build_store(loaded_val.clone(), dest_ptr.clone(), None);
                    } else {
                        self.function_params.insert(name.clone(), loaded_val);
                    }
                } else if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, loaded_val);
                }
            }
            IRInstruction::StorePointer(dest_ptr, source_val) => {
                let ptr_val = self.operand_to_value(dest_ptr)?;
                let val_val = self.operand_to_value(source_val)?;
                self.builder.build_store(val_val, ptr_val, None);
            }
            IRInstruction::ConstructADT(dest, expected_tag, args) => {
                let alloc_call = self.builder.build_call(
                    LLVMType::Pointer(Box::new(LLVMType::I8)),
                    "aligned_alloc",
                    vec![LLVMValue::ConstI64(32), LLVMValue::ConstI64(64)]
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
                    if let Some(ty) = self.type_env.get(name) {
                        target_llvm_ty = self.type_to_llvm(ty);
                    }
                }
                
                let ptr = self.builder.build_gep(LLVMType::I64, target_val, vec![idx_val])?;
                let casted_ptr = self.builder.build_bitcast(ptr, LLVMType::Pointer(Box::new(target_llvm_ty.clone())));
                let payload_val = self.builder.build_load(casted_ptr, Some(8))?;
                
                if let IROperand::Variable(name) = dest {
                    if let Some(dest_ptr) = self.function_params.get(name) {
                        self.builder.build_store(payload_val, dest_ptr.clone(), None);
                    } else {
                        self.function_params.insert(name.clone(), payload_val);
                    }
                } else if let IROperand::TempReg(t) = dest {
                    self.temp_map.insert(*t, payload_val);
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
            IROperand::LiteralBool(v) => Ok(LLVMValue::ConstI1(*v)),
            IROperand::Variable(name) => {
                if let Some(ptr) = self.function_params.get(name) {
                    if let LLVMType::Pointer(_) = ptr.get_type() {
                        let is_scalar = self.scalar_vars.contains(name) || name.starts_with("param_");
                        if is_scalar {
                            self.builder.build_load(ptr.clone(), None)
                        } else {
                            Ok(ptr.clone())
                        }
                    } else {
                        Ok(ptr.clone())
                    }
                } else {
                    let var_ty = self.type_env.get(name).unwrap_or(&TypeInfo::Int);
                    Ok(LLVMValue::Reg(name.clone(), self.type_to_llvm(var_ty)))
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