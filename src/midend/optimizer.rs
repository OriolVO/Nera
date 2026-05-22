use std::collections::{HashSet, HashMap};
use super::ir::{IRInstruction, IROperand, IRFunction, Terminator, VectorOperand};
use crate::error::CompileError;

pub struct OptimizedIR {
    pub functions: Vec<IRFunction>,
    pub soa_arrays: Vec<(String, i64)>, // Array names and their sizes
    pub global_instructions: Vec<IRInstruction>,
}

pub struct IROptimizer;

impl IROptimizer {
    pub fn new() -> Self {
        Self {}
    }

    pub fn optimize(&self, functions: Vec<IRFunction>, global_instructions: Vec<IRInstruction>) -> Result<OptimizedIR, CompileError> {
        let mut soa_arrays = self.run_soa_pass_globals(&global_instructions);
        let mut optimized_functions = Vec::new();

        for mut func in functions {
            let func_soa = self.run_soa_pass_func(&func);
            soa_arrays.extend(func_soa);

            self.run_loop_fusion(&mut func);
            self.run_liveness_and_dce(&mut func)?;
            optimized_functions.push(func);
        }

        soa_arrays.sort_by(|a, b| a.0.cmp(&b.0));
        soa_arrays.dedup_by(|a, b| a.0 == b.0);

        Ok(OptimizedIR {
            functions: optimized_functions,
            soa_arrays,
            global_instructions,
        })
    }

    fn run_soa_pass_globals(&self, instructions: &[IRInstruction]) -> Vec<(String, i64)> {
        let mut soa_map = HashMap::new();
        for instr in instructions {
            if let IRInstruction::FlatVectorApply(target_array, ops, _start, _end, size) = instr {
                for (prop, _, rhs) in ops {
                    soa_map.insert(format!("{}_{}", target_array, prop), *size);
                    if let VectorOperand::Vector(rhs_arr, rhs_prop) = rhs {
                        soa_map.insert(format!("{}_{}", rhs_arr, rhs_prop), *size);
                    }
                }
            } else if let IRInstruction::LoadArrayElement(_, array, prop, _, size) = instr {
                soa_map.insert(format!("{}_{}", array, prop), *size);
            } else if let IRInstruction::StoreArrayElement(array, prop, _, _, size) = instr {
                soa_map.insert(format!("{}_{}", array, prop), *size);
            }
        }
        soa_map.into_iter().collect()
    }

    fn run_soa_pass_func(&self, func: &IRFunction) -> Vec<(String, i64)> {
        let mut soa_map = HashMap::new();
        for block in &func.blocks {
            for instr in &block.instrs {
                if let IRInstruction::FlatVectorApply(target_array, ops, _start, _end, size) = instr {
                    for (prop, _, rhs) in ops {
                        soa_map.insert(format!("{}_{}", target_array, prop), *size);
                        if let VectorOperand::Vector(rhs_arr, rhs_prop) = rhs {
                            soa_map.insert(format!("{}_{}", rhs_arr, rhs_prop), *size);
                        }
                    }
                } else if let IRInstruction::LoadArrayElement(_, array, prop, _, size) = instr {
                    soa_map.insert(format!("{}_{}", array, prop), *size);
                } else if let IRInstruction::StoreArrayElement(array, prop, _, _, size) = instr {
                    soa_map.insert(format!("{}_{}", array, prop), *size);
                }
            }
        }
        soa_map.into_iter().collect()
    }

    fn run_loop_fusion(&self, func: &mut IRFunction) {
        for block in &mut func.blocks {
            let mut fused_instrs: Vec<IRInstruction> = Vec::new();
            
            for instr in &block.instrs {
                if let IRInstruction::FlatVectorApply(target, ops, start, end, size) = instr {
                    let mut merged = false;
                    if let Some(IRInstruction::FlatVectorApply(last_target, last_ops, last_start, last_end, last_size)) = fused_instrs.last_mut() {
                        if target == last_target && size == last_size && start == last_start && end == last_end {
                            last_ops.extend(ops.clone());
                            merged = true;
                        }
                    }
                    if !merged {
                        fused_instrs.push(instr.clone());
                    }
                } else {
                    fused_instrs.push(instr.clone());
                }
            }
            
            block.instrs = fused_instrs;
        }
    }

    fn operand_to_var(&self, op: &IROperand) -> Option<String> {
        match op {
            IROperand::Variable(name) => Some(name.clone()),
            IROperand::TempReg(r) => Some(format!("t{}", r)),
            _ => None,
        }
    }

    fn instr_use_def(&self, instr: &IRInstruction) -> (Vec<String>, Vec<String>) {
        let mut uses = Vec::new();
        let mut defs = Vec::new();

        let mut add_use = |op: &IROperand| {
            if let Some(v) = self.operand_to_var(op) { uses.push(v); }
        };
        let mut add_def = |op: &IROperand| {
            if let Some(v) = self.operand_to_var(op) { defs.push(v); }
        };

        match instr {
            IRInstruction::Assign(dest, src) => {
                add_use(src);
                add_def(dest);
            }
            IRInstruction::BinaryOp(dest, _, left, right) => {
                add_use(left);
                add_use(right);
                add_def(dest);
            }
            IRInstruction::LoadProperty(dest, obj, _) => {
                add_use(obj);
                add_def(dest);
            }
            IRInstruction::StoreProperty(obj, _, val) => {
                add_use(obj);
                add_use(val);
            }
            IRInstruction::Call(dest_opt, callee, args) => {
                add_use(callee);
                for arg in args {
                    add_use(arg);
                }
                if let Some(dest) = dest_opt {
                    add_def(dest);
                }
            }
            IRInstruction::FlatVectorApply(_, ops, start, end, _) => {
                add_use(start);
                add_use(end);
                for (_, _, rhs) in ops {
                    if let VectorOperand::Scalar(op) = rhs {
                        add_use(op);
                    }
                }
            }
            IRInstruction::ExtractTag(dest, obj) => {
                add_use(obj);
                add_def(dest);
            }
            IRInstruction::LoadArrayElement(dest, _, _, index, _) => {
                add_use(index);
                add_def(dest);
            }
            IRInstruction::StoreArrayElement(_, _, index, val, _) => {
                add_use(index);
                add_use(val);
            }
            IRInstruction::ExtractPayload(dest, obj, _) => {
                add_use(obj);
                add_def(dest);
            }
            IRInstruction::Alloc(dest, _) => {
                add_def(dest);
            }
            IRInstruction::LoadPointer(dest, ptr) => {
                add_use(ptr);
                add_def(dest);
            }
            IRInstruction::StorePointer(ptr, val) => {
                add_use(ptr);
                add_use(val);
            }
            IRInstruction::ConstructADT(dest, _, args) => {
                for arg in args {
                    add_use(arg);
                }
                add_def(dest);
            }
            IRInstruction::Free(ptr) => {
                add_use(ptr);
            }
        }
        (uses, defs)
    }

    fn run_liveness_and_dce(&self, func: &mut IRFunction) -> Result<(), CompileError> {
        // 1. Build successors map
        let mut succs: HashMap<String, Vec<String>> = HashMap::new();
        for block in &func.blocks {
            let mut s = Vec::new();
            match &block.terminator {
                Terminator::Jump(target) => s.push(target.clone()),
                Terminator::Branch(_, true_tgt, false_tgt) => {
                    s.push(true_tgt.clone());
                    s.push(false_tgt.clone());
                }
                Terminator::Return(_) | Terminator::None => {}
            }
            succs.insert(block.name.clone(), s);
        }

        // 2. Compute DEF and USE for each block
        let mut def_sets: HashMap<String, HashSet<String>> = HashMap::new();
        let mut use_sets: HashMap<String, HashSet<String>> = HashMap::new();

        for block in &func.blocks {
            let mut b_def = HashSet::new();
            let mut b_use = HashSet::new();

            for instr in &block.instrs {
                let (uses, defs) = self.instr_use_def(instr);
                for u in uses {
                    if !b_def.contains(&u) {
                        b_use.insert(u);
                    }
                }
                for d in defs {
                    b_def.insert(d);
                }
            }
            
            match &block.terminator {
                Terminator::Branch(cond, _, _) => {
                    if let Some(u) = self.operand_to_var(cond) {
                        if !b_def.contains(&u) {
                            b_use.insert(u);
                        }
                    }
                }
                Terminator::Return(Some(val)) => {
                    if let Some(u) = self.operand_to_var(val) {
                        if !b_def.contains(&u) {
                            b_use.insert(u);
                        }
                    }
                }
                _ => {}
            }

            def_sets.insert(block.name.clone(), b_def);
            use_sets.insert(block.name.clone(), b_use);
        }

        // 3. Fix-point iteration for IN and OUT sets
        let mut in_sets: HashMap<String, HashSet<String>> = HashMap::new();
        let mut out_sets: HashMap<String, HashSet<String>> = HashMap::new();

        for block in &func.blocks {
            in_sets.insert(block.name.clone(), HashSet::new());
            out_sets.insert(block.name.clone(), HashSet::new());
        }

        let mut changed = true;
        while changed {
            changed = false;
            for block in func.blocks.iter().rev() {
                let name = &block.name;

                let mut new_out = HashSet::new();
                if let Some(s_list) = succs.get(name) {
                    for s in s_list {
                        if let Some(s_in) = in_sets.get(s) {
                            for v in s_in {
                                new_out.insert(v.clone());
                            }
                        }
                    }
                }
                
                let old_out = out_sets.get(name).ok_or_else(|| CompileError::BackendError(format!("Missing OUT set for block '{}'", name)))?.clone();
                if new_out != old_out {
                    out_sets.insert(name.clone(), new_out.clone());
                    changed = true;
                }

                let mut new_in = use_sets.get(name).ok_or_else(|| CompileError::BackendError(format!("Missing USE set for block '{}'", name)))?.clone();
                let def = def_sets.get(name).ok_or_else(|| CompileError::BackendError(format!("Missing DEF set for block '{}'", name)))?;
                for v in &new_out {
                    if !def.contains(v) {
                        new_in.insert(v.clone());
                    }
                }

                let old_in = in_sets.get(name).ok_or_else(|| CompileError::BackendError(format!("Missing IN set for block '{}'", name)))?.clone();
                if new_in != old_in {
                    in_sets.insert(name.clone(), new_in);
                    changed = true;
                }
            }
        }

        // 4. Safe DCE Pass
        for block in &mut func.blocks {
            let mut live_now = out_sets.get(&block.name).ok_or_else(|| CompileError::BackendError(format!("Missing OUT set for block '{}' during DCE", block.name)))?.clone();
            
            match &block.terminator {
                Terminator::Branch(cond, _, _) => {
                    if let Some(u) = self.operand_to_var(cond) {
                        live_now.insert(u);
                    }
                }
                Terminator::Return(Some(val)) => {
                    if let Some(u) = self.operand_to_var(val) {
                        live_now.insert(u);
                    }
                }
                _ => {}
            }

            let mut optimized_instrs = Vec::new();
            for instr in block.instrs.iter().rev() {
                let (uses, defs) = self.instr_use_def(instr);
                let has_side_effects = matches!(
                    instr,
                    IRInstruction::Call(_, _, _) | IRInstruction::StoreProperty(_, _, _) | IRInstruction::FlatVectorApply(..) | IRInstruction::StoreArrayElement(..) | IRInstruction::Free(_)
                );

                let mut is_dead = true;
                for d in &defs {
                    if live_now.contains(d) {
                        is_dead = false;
                        break;
                    }
                }

                if defs.is_empty() {
                    is_dead = false;
                }

                if !is_dead || has_side_effects {
                    for d in defs {
                        live_now.remove(&d);
                    }
                    for u in uses {
                        live_now.insert(u);
                    }
                    optimized_instrs.push(instr.clone());
                }
            }
            optimized_instrs.reverse();
            block.instrs = optimized_instrs;
        }
        Ok(())
    }
}
