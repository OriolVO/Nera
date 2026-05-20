import re

with open("src/backend/llvm_gen.rs", "r") as f:
    content = f.read()

# Replace the generate function
new_generate = """    pub fn generate(&mut self, optimized_ir: &OptimizedIR, type_env: HashMap<String, TypeInfo>) -> String {
        self.type_env = type_env;
        self.output.clear();
        self.register_count = 1;
        self.temp_map.clear();
        self.function_params.clear();
        self.main_arena_ptr = None;

        let mut actual_soa_arrays = optimized_ir.soa_arrays.clone();
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

        self.scalar_vars.clear();
        for func in &optimized_ir.functions {
            for block in &func.blocks {
                for instr in &block.instrs {
                    if let IRInstruction::Assign(IROperand::Variable(name), src) = instr {
                        if !matches!(src, IROperand::Void) && !actual_soa_arrays.iter().any(|(n, _)| n == name) {
                            self.scalar_vars.insert(name.clone());
                        }
                    }
                }
            }
        }

        self.emit("; ModuleID = 'nera_program'");
        self.emit("target datalayout = \\"e-m:e-i64:64-f80:128-n8:16:32:64-S128\\"");
        self.emit("target triple = \\"x86_64-pc-linux-gnu\\"");
        self.emit("");

        self.emit("declare i8* @malloc(i64)");
        self.emit("declare void @free(i8*)");
        self.emit("declare i32 @printf(i8*, ...)");
        self.emit("@str_fmt_int = private unnamed_addr constant [5 x i8] c\\"%ld\\\\0A\\\\00\\", align 1");
        self.emit("@str_fmt_float = private unnamed_addr constant [4 x i8] c\\"%f\\\\0A\\\\00\\", align 1");
        self.emit("");

        for func in &optimized_ir.functions {
            self.lower_function(func, &actual_soa_arrays);
        }

        if !actual_soa_arrays.is_empty() {
            self.emit("");
            self.emit("!1 = !{!1, !2}");
            self.emit("!2 = !{\\"llvm.loop.vectorize.enable\\", i1 true}");
        }

        self.output.clone()
    }

    fn lower_function(&mut self, func: &crate::midend::ir::IRFunction, soa_arrays: &Vec<(String, i64)>) {
        let ret_info = match func.return_type.as_str() {
            "Int" => TypeInfo::Int,
            "Float" => TypeInfo::Float,
            "Boolean" => TypeInfo::Boolean,
            "String" => TypeInfo::String,
            "Void" => TypeInfo::Void,
            _ => TypeInfo::Custom(func.return_type.clone()),
        };
        let ret_str = self.type_to_llvm(&ret_info);
        self.register_count = 1;
        self.temp_map.clear();
        self.function_params.clear();
        self.main_arena_ptr = None;

        let mut param_strs = Vec::new();
        for param in &func.params {
            let param_ty = self.type_env.get(param).unwrap_or(&TypeInfo::Int);
            let llvm_ty = self.type_to_llvm(param_ty);
            let is_scalar = !param.contains("soa_") && !param.contains('_');
            if is_scalar {
                param_strs.push(format!("{} %param_{}", llvm_ty, param));
                self.scalar_vars.insert(param.clone());
            } else {
                param_strs.push(format!("{} %{}", llvm_ty, param));
            }
            self.function_params.insert(param.clone(), format!("%param_{}", param));
        }

        self.emit(&format!("define {} @{}({}) {{", ret_str, func.name, param_strs.join(", ")));
        
        let mut first_block = true;

        for block in &func.blocks {
            self.emit(&format!("{}:", block.name));
            self.current_block = block.name.clone();

            if first_block {
                if func.name == "main" {
                    let arena_start_i8 = self.new_reg();
                    self.emit(&format!("  {} = call i8* @malloc(i64 67108864)", arena_start_i8));
                    let arena_start = self.new_reg();
                    self.emit(&format!("  {} = bitcast i8* {} to i64*", arena_start, arena_start_i8));

                    let mut current_offset = 0;
                    for (soa_array, size) in soa_arrays {
                        let ptr_reg = self.new_reg();
                        self.emit(&format!("  {} = getelementptr inbounds i64, i64* {}, i64 {}", ptr_reg, arena_start, current_offset));
                        self.emit(&format!("  %soa_{} = bitcast i64* {} to i64*", soa_array, ptr_reg));
                        current_offset += size; 
                    }
                    self.main_arena_ptr = Some(arena_start_i8);
                }

                let vars_to_allocate = self.scalar_vars.clone();
                for var in vars_to_allocate {
                    let var_ty = self.type_env.get(&var).unwrap_or(&TypeInfo::Int);
                    let llvm_ty = self.type_to_llvm(var_ty);
                    self.emit(&format!("  %ptr_{} = alloca {}", var, llvm_ty));
                }

                for param in &func.params {
                    if !param.contains("soa_") && !param.contains('_') {
                        let param_ty = self.type_env.get(param).unwrap_or(&TypeInfo::Int);
                        let llvm_ty = self.type_to_llvm(param_ty);
                        self.emit(&format!("  store {} %param_{}, {}* %ptr_{}", llvm_ty, param, llvm_ty, param));
                    }
                }
                first_block = false;
            }

            for instr in &block.instrs {
                self.lower_instruction(instr, soa_arrays);
            }

            match &block.terminator {
                crate::midend::ir::Terminator::Jump(target) => {
                    self.emit(&format!("  br label %{}", target));
                }
                crate::midend::ir::Terminator::Branch(cond, true_lbl, false_lbl) => {
                    let cond_val = self.operand_to_string(cond);
                    self.emit(&format!("  br i1 {}, label %{}, label %{}", cond_val, true_lbl, false_lbl));
                }
                crate::midend::ir::Terminator::Return(val_opt) => {
                    if let Some(arena_i8) = &self.main_arena_ptr {
                        self.emit(&format!("  call void @free(i8* {})", arena_i8));
                    }
                    if let Some(val) = val_opt {
                        let is_float = matches!(val, IROperand::LiteralFloat(_));
                        let ty = if is_float { "double" } else { "i64" };
                        let val_str = self.operand_to_string(val);
                        self.emit(&format!("  ret {} {}", ty, val_str));
                    } else {
                        if ret_str == "void" {
                            self.emit("  ret void");
                        } else {
                            self.emit("  ret i64 0");
                        }
                    }
                }
                crate::midend::ir::Terminator::None => {
                    self.emit("  unreachable");
                }
            }
        }
        self.emit("}");
    }
"""

start_idx = content.find("    pub fn generate")
end_idx = content.find("    fn lower_instruction")

if start_idx != -1 and end_idx != -1:
    content = content[:start_idx] + new_generate + content[end_idx:]
else:
    print("Could not find start/end indices")

# Clean up lower_instruction
# Remove DefineFunction, Return, Label, Jump, JumpIfFalse
to_remove = [
    r'IRInstruction::DefineFunction.*?IRInstruction::Assign',
    r'IRInstruction::Return.*?IRInstruction::Assign',
    r'IRInstruction::Label\(name\).*?IRInstruction::Call',
    r'IRInstruction::Jump\(label\).*?IRInstruction::Call',
    r'IRInstruction::JumpIfFalse\(cond, label\).*?IRInstruction::Call',
]

for p in to_remove:
    pass # Wait, doing this by regex might break. Let's just write the whole file.
"""
