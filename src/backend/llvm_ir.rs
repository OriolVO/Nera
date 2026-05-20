use std::collections::HashMap;

#[derive(Debug, Clone, PartialEq)]
pub enum LLVMType {
    I1,
    I8,
    I32,
    I64,
    Double,
    Pointer(Box<LLVMType>),
    Void,
    Array(usize, Box<LLVMType>),
    Named(String),
}

impl LLVMType {
    pub fn to_string(&self) -> String {
        match self {
            LLVMType::I1 => "i1".to_string(),
            LLVMType::I8 => "i8".to_string(),
            LLVMType::I32 => "i32".to_string(),
            LLVMType::I64 => "i64".to_string(),
            LLVMType::Double => "double".to_string(),
            LLVMType::Pointer(inner) => format!("{}*", inner.to_string()),
            LLVMType::Void => "void".to_string(),
            LLVMType::Array(size, inner) => format!("[{} x {}]", size, inner.to_string()),
            LLVMType::Named(name) => format!("%{}", name),
        }
    }
}

#[derive(Debug, Clone, PartialEq)]
pub enum LLVMValue {
    Reg(String, LLVMType),
    Global(String, LLVMType),
    ConstI1(bool),
    ConstI32(i32),
    ConstI64(i64),
    ConstDouble(f64),
    Null(LLVMType),
}

impl LLVMValue {
    pub fn get_type(&self) -> LLVMType {
        match self {
            LLVMValue::Reg(_, t) => t.clone(),
            LLVMValue::Global(_, t) => t.clone(),
            LLVMValue::ConstI1(_) => LLVMType::I1,
            LLVMValue::ConstI32(_) => LLVMType::I32,
            LLVMValue::ConstI64(_) => LLVMType::I64,
            LLVMValue::ConstDouble(_) => LLVMType::Double,
            LLVMValue::Null(t) => t.clone(),
        }
    }

    pub fn to_string(&self) -> String {
        match self {
            LLVMValue::Reg(name, _) => format!("%{}", name),
            LLVMValue::Global(name, _) => format!("@{}", name),
            LLVMValue::ConstI1(v) => if *v { "1".to_string() } else { "0".to_string() },
            LLVMValue::ConstI32(v) => v.to_string(),
            LLVMValue::ConstI64(v) => v.to_string(),
            LLVMValue::ConstDouble(v) => {
                if v.fract() == 0.0 {
                    format!("{}.0", v)
                } else {
                    v.to_string()
                }
            }
            LLVMValue::Null(_) => "null".to_string(),
        }
    }

    pub fn typed_string(&self) -> String {
        format!("{} {}", self.get_type().to_string(), self.to_string())
    }
}

#[derive(Debug, Clone)]
pub enum LLVMInstruction {
    Alloca(String, LLVMType),
    Load(String, LLVMType, LLVMValue, Option<usize>), // dest, type, ptr, align
    Store(LLVMValue, LLVMValue, Option<usize>), // val, ptr, align
    GetElementPtr(String, LLVMType, LLVMValue, Vec<LLVMValue>), // dest, base_type, ptr, indices
    Add(String, LLVMType, LLVMValue, LLVMValue),
    FAdd(String, LLVMType, LLVMValue, LLVMValue),
    Sub(String, LLVMType, LLVMValue, LLVMValue),
    FSub(String, LLVMType, LLVMValue, LLVMValue),
    Mul(String, LLVMType, LLVMValue, LLVMValue),
    FMul(String, LLVMType, LLVMValue, LLVMValue),
    SDiv(String, LLVMType, LLVMValue, LLVMValue),
    FDiv(String, LLVMType, LLVMValue, LLVMValue),
    ICmp(String, String, LLVMType, LLVMValue, LLVMValue), // dest, pred
    FCmp(String, String, LLVMType, LLVMValue, LLVMValue),
    And(String, LLVMType, LLVMValue, LLVMValue),
    Or(String, LLVMType, LLVMValue, LLVMValue),
    ZExt(String, LLVMType, LLVMValue, LLVMType), // dest, dest_ty, val, src_ty
    Trunc(String, LLVMType, LLVMValue, LLVMType),
    BitCast(String, LLVMType, LLVMValue, LLVMType),
    Phi(String, LLVMType, Vec<(LLVMValue, String)>), // dest, type, [(val, block)]
    Call(Option<String>, LLVMType, String, Vec<LLVMValue>), // dest, ret_type, name, args
    Br(String),
    CondBr(LLVMValue, String, String),
    Ret(Option<LLVMValue>),
    Unreachable,
}

impl LLVMInstruction {
    pub fn to_string(&self) -> String {
        match self {
            LLVMInstruction::Alloca(dest, ty) => format!("  %{} = alloca {}", dest, ty.to_string()),
            LLVMInstruction::Load(dest, ty, ptr, align) => {
                let mut s = format!("  %{} = load {}, {}", dest, ty.to_string(), ptr.typed_string());
                if let Some(a) = align { s.push_str(&format!(", align {}", a)); }
                s
            }
            LLVMInstruction::Store(val, ptr, align) => {
                let mut s = format!("  store {}, {}", val.typed_string(), ptr.typed_string());
                if let Some(a) = align { s.push_str(&format!(", align {}", a)); }
                s
            }
            LLVMInstruction::GetElementPtr(dest, base_ty, ptr, indices) => {
                let idx_strs: Vec<String> = indices.iter().map(|i| i.typed_string()).collect();
                format!("  %{} = getelementptr inbounds {}, {}, {}", dest, base_ty.to_string(), ptr.typed_string(), idx_strs.join(", "))
            }
            LLVMInstruction::Add(dest, ty, l, r) => format!("  %{} = add nsw {} {}, {}", dest, ty.to_string(), l.to_string(), r.to_string()),
            LLVMInstruction::FAdd(dest, ty, l, r) => format!("  %{} = fadd {} {}, {}", dest, ty.to_string(), l.to_string(), r.to_string()),
            LLVMInstruction::Sub(dest, ty, l, r) => format!("  %{} = sub nsw {} {}, {}", dest, ty.to_string(), l.to_string(), r.to_string()),
            LLVMInstruction::FSub(dest, ty, l, r) => format!("  %{} = fsub {} {}, {}", dest, ty.to_string(), l.to_string(), r.to_string()),
            LLVMInstruction::Mul(dest, ty, l, r) => format!("  %{} = mul nsw {} {}, {}", dest, ty.to_string(), l.to_string(), r.to_string()),
            LLVMInstruction::FMul(dest, ty, l, r) => format!("  %{} = fmul {} {}, {}", dest, ty.to_string(), l.to_string(), r.to_string()),
            LLVMInstruction::SDiv(dest, ty, l, r) => format!("  %{} = sdiv {} {}, {}", dest, ty.to_string(), l.to_string(), r.to_string()),
            LLVMInstruction::FDiv(dest, ty, l, r) => format!("  %{} = fdiv {} {}, {}", dest, ty.to_string(), l.to_string(), r.to_string()),
            LLVMInstruction::ICmp(dest, pred, ty, l, r) => format!("  %{} = icmp {} {} {}, {}", dest, pred, ty.to_string(), l.to_string(), r.to_string()),
            LLVMInstruction::FCmp(dest, pred, ty, l, r) => format!("  %{} = fcmp {} {} {}, {}", dest, pred, ty.to_string(), l.to_string(), r.to_string()),
            LLVMInstruction::And(dest, ty, l, r) => format!("  %{} = and {} {}, {}", dest, ty.to_string(), l.to_string(), r.to_string()),
            LLVMInstruction::Or(dest, ty, l, r) => format!("  %{} = or {} {}, {}", dest, ty.to_string(), l.to_string(), r.to_string()),
            LLVMInstruction::ZExt(dest, dest_ty, val, _src_ty) => format!("  %{} = zext {} to {}", dest, val.typed_string(), dest_ty.to_string()),
            LLVMInstruction::Trunc(dest, dest_ty, val, _src_ty) => format!("  %{} = trunc {} to {}", dest, val.typed_string(), dest_ty.to_string()),
            LLVMInstruction::BitCast(dest, dest_ty, val, _src_ty) => format!("  %{} = bitcast {} to {}", dest, val.typed_string(), dest_ty.to_string()),
            LLVMInstruction::Phi(dest, ty, incoming) => {
                let inc_strs: Vec<String> = incoming.iter().map(|(v, b)| format!("[ {}, %{} ]", v.to_string(), b)).collect();
                format!("  %{} = phi {} {}", dest, ty.to_string(), inc_strs.join(", "))
            }
            LLVMInstruction::Call(dest_opt, ret_ty, name, args) => {
                let arg_strs: Vec<String> = args.iter().map(|a| a.typed_string()).collect();
                if let Some(dest) = dest_opt {
                    format!("  %{} = call {} @{}({})", dest, ret_ty.to_string(), name, arg_strs.join(", "))
                } else {
                    format!("  call {} @{}({})", ret_ty.to_string(), name, arg_strs.join(", "))
                }
            }
            LLVMInstruction::Br(lbl) => format!("  br label %{}", lbl),
            LLVMInstruction::CondBr(cond, true_lbl, false_lbl) => format!("  br i1 {}, label %{}, label %{}", cond.to_string(), true_lbl, false_lbl),
            LLVMInstruction::Ret(Some(val)) => format!("  ret {}", val.typed_string()),
            LLVMInstruction::Ret(None) => "  ret void".to_string(),
            LLVMInstruction::Unreachable => "  unreachable".to_string(),
        }
    }
}

pub struct LLVMBasicBlock {
    pub name: String,
    pub instrs: Vec<LLVMInstruction>,
}

pub struct LLVMFunction {
    pub name: String,
    pub ret_ty: LLVMType,
    pub params: Vec<(String, LLVMType)>,
    pub blocks: Vec<LLVMBasicBlock>,
}

pub struct LLVMModule {
    pub name: String,
    pub funcs: Vec<LLVMFunction>,
    pub declarations: Vec<String>,
}

pub struct IRBuilder {
    pub module: LLVMModule,
    active_func: Option<LLVMFunction>,
    active_block: Option<LLVMBasicBlock>,
    reg_count: usize,
}

impl IRBuilder {
    pub fn new(module_name: &str) -> Self {
        Self {
            module: LLVMModule {
                name: module_name.to_string(),
                funcs: Vec::new(),
                declarations: Vec::new(),
            },
            active_func: None,
            active_block: None,
            reg_count: 1,
        }
    }

    pub fn declare(&mut self, decl: &str) {
        self.module.declarations.push(decl.to_string());
    }

    pub fn next_reg_name(&mut self) -> String {
        let r = self.reg_count;
        self.reg_count += 1;
        r.to_string()
    }

    pub fn start_function(&mut self, name: &str, ret_ty: LLVMType, params: Vec<(String, LLVMType)>) {
        self.reg_count = 1;
        self.active_func = Some(LLVMFunction {
            name: name.to_string(),
            ret_ty,
            params,
            blocks: Vec::new(),
        });
    }

    pub fn end_function(&mut self) {
        if let Some(block) = self.active_block.take() {
            if let Some(func) = &mut self.active_func {
                func.blocks.push(block);
            }
        }
        if let Some(func) = self.active_func.take() {
            self.module.funcs.push(func);
        }
    }

    pub fn start_block(&mut self, name: &str) {
        if let Some(block) = self.active_block.take() {
            if let Some(func) = &mut self.active_func {
                func.blocks.push(block);
            }
        }
        self.active_block = Some(LLVMBasicBlock {
            name: name.to_string(),
            instrs: Vec::new(),
        });
    }

    pub fn current_block_name(&self) -> Option<String> {
        self.active_block.as_ref().map(|b| b.name.clone())
    }

    fn push_instr(&mut self, instr: LLVMInstruction) {
        if let Some(b) = &mut self.active_block {
            b.instrs.push(instr);
        }
    }

    pub fn build_alloca(&mut self, name: &str, ty: LLVMType) -> LLVMValue {
        self.push_instr(LLVMInstruction::Alloca(name.to_string(), ty.clone()));
        LLVMValue::Reg(name.to_string(), LLVMType::Pointer(Box::new(ty)))
    }

    pub fn build_load(&mut self, ptr: LLVMValue, align: Option<usize>) -> LLVMValue {
        let ty = match ptr.get_type() {
            LLVMType::Pointer(inner) => *inner,
            _ => panic!("build_load on non-pointer"),
        };
        let dest = self.next_reg_name();
        self.push_instr(LLVMInstruction::Load(dest.clone(), ty.clone(), ptr, align));
        LLVMValue::Reg(dest, ty)
    }

    pub fn build_store(&mut self, val: LLVMValue, ptr: LLVMValue, align: Option<usize>) {
        self.push_instr(LLVMInstruction::Store(val, ptr, align));
    }

    pub fn build_gep(&mut self, base_ty: LLVMType, ptr: LLVMValue, indices: Vec<LLVMValue>) -> LLVMValue {
        let dest = self.next_reg_name();
        let ptr_ty = match ptr.get_type() {
            LLVMType::Pointer(inner) => *inner,
            _ => panic!("build_gep on non-pointer"),
        };
        // Compute return type simplified
        let ret_ty = if let LLVMType::Array(_, inner) = base_ty.clone() {
            if indices.len() == 2 {
                LLVMType::Pointer(inner)
            } else {
                LLVMType::Pointer(Box::new(base_ty.clone()))
            }
        } else {
            LLVMType::Pointer(Box::new(base_ty.clone()))
        };
        self.push_instr(LLVMInstruction::GetElementPtr(dest.clone(), base_ty, ptr, indices));
        LLVMValue::Reg(dest, ret_ty)
    }

    pub fn build_add(&mut self, l: LLVMValue, r: LLVMValue) -> LLVMValue {
        let dest = self.next_reg_name();
        let ty = l.get_type();
        self.push_instr(LLVMInstruction::Add(dest.clone(), ty.clone(), l, r));
        LLVMValue::Reg(dest, ty)
    }

    pub fn build_fadd(&mut self, l: LLVMValue, r: LLVMValue) -> LLVMValue {
        let dest = self.next_reg_name();
        let ty = l.get_type();
        self.push_instr(LLVMInstruction::FAdd(dest.clone(), ty.clone(), l, r));
        LLVMValue::Reg(dest, ty)
    }

    pub fn build_sub(&mut self, l: LLVMValue, r: LLVMValue) -> LLVMValue {
        let dest = self.next_reg_name();
        let ty = l.get_type();
        self.push_instr(LLVMInstruction::Sub(dest.clone(), ty.clone(), l, r));
        LLVMValue::Reg(dest, ty)
    }

    pub fn build_fsub(&mut self, l: LLVMValue, r: LLVMValue) -> LLVMValue {
        let dest = self.next_reg_name();
        let ty = l.get_type();
        self.push_instr(LLVMInstruction::FSub(dest.clone(), ty.clone(), l, r));
        LLVMValue::Reg(dest, ty)
    }

    pub fn build_mul(&mut self, l: LLVMValue, r: LLVMValue) -> LLVMValue {
        let dest = self.next_reg_name();
        let ty = l.get_type();
        self.push_instr(LLVMInstruction::Mul(dest.clone(), ty.clone(), l, r));
        LLVMValue::Reg(dest, ty)
    }

    pub fn build_fmul(&mut self, l: LLVMValue, r: LLVMValue) -> LLVMValue {
        let dest = self.next_reg_name();
        let ty = l.get_type();
        self.push_instr(LLVMInstruction::FMul(dest.clone(), ty.clone(), l, r));
        LLVMValue::Reg(dest, ty)
    }

    pub fn build_sdiv(&mut self, l: LLVMValue, r: LLVMValue) -> LLVMValue {
        let dest = self.next_reg_name();
        let ty = l.get_type();
        self.push_instr(LLVMInstruction::SDiv(dest.clone(), ty.clone(), l, r));
        LLVMValue::Reg(dest, ty)
    }

    pub fn build_fdiv(&mut self, l: LLVMValue, r: LLVMValue) -> LLVMValue {
        let dest = self.next_reg_name();
        let ty = l.get_type();
        self.push_instr(LLVMInstruction::FDiv(dest.clone(), ty.clone(), l, r));
        LLVMValue::Reg(dest, ty)
    }

    pub fn build_icmp(&mut self, pred: &str, l: LLVMValue, r: LLVMValue) -> LLVMValue {
        let dest = self.next_reg_name();
        let ty = l.get_type();
        self.push_instr(LLVMInstruction::ICmp(dest.clone(), pred.to_string(), ty, l, r));
        LLVMValue::Reg(dest, LLVMType::I1)
    }

    pub fn build_fcmp(&mut self, pred: &str, l: LLVMValue, r: LLVMValue) -> LLVMValue {
        let dest = self.next_reg_name();
        let ty = l.get_type();
        self.push_instr(LLVMInstruction::FCmp(dest.clone(), pred.to_string(), ty, l, r));
        LLVMValue::Reg(dest, LLVMType::I1)
    }

    pub fn build_and(&mut self, l: LLVMValue, r: LLVMValue) -> LLVMValue {
        let dest = self.next_reg_name();
        let ty = l.get_type();
        self.push_instr(LLVMInstruction::And(dest.clone(), ty.clone(), l, r));
        LLVMValue::Reg(dest, ty)
    }

    pub fn build_or(&mut self, l: LLVMValue, r: LLVMValue) -> LLVMValue {
        let dest = self.next_reg_name();
        let ty = l.get_type();
        self.push_instr(LLVMInstruction::Or(dest.clone(), ty.clone(), l, r));
        LLVMValue::Reg(dest, ty)
    }

    pub fn build_zext(&mut self, val: LLVMValue, dest_ty: LLVMType) -> LLVMValue {
        let dest = self.next_reg_name();
        let src_ty = val.get_type();
        self.push_instr(LLVMInstruction::ZExt(dest.clone(), dest_ty.clone(), val, src_ty));
        LLVMValue::Reg(dest, dest_ty)
    }

    pub fn build_trunc(&mut self, val: LLVMValue, dest_ty: LLVMType) -> LLVMValue {
        let dest = self.next_reg_name();
        let src_ty = val.get_type();
        self.push_instr(LLVMInstruction::Trunc(dest.clone(), dest_ty.clone(), val, src_ty));
        LLVMValue::Reg(dest, dest_ty)
    }

    pub fn build_bitcast(&mut self, val: LLVMValue, dest_ty: LLVMType) -> LLVMValue {
        let dest = self.next_reg_name();
        let src_ty = val.get_type();
        self.push_instr(LLVMInstruction::BitCast(dest.clone(), dest_ty.clone(), val, src_ty));
        LLVMValue::Reg(dest, dest_ty)
    }

    pub fn build_phi(&mut self, ty: LLVMType, incoming: Vec<(LLVMValue, String)>) -> LLVMValue {
        let dest = self.next_reg_name();
        self.push_instr(LLVMInstruction::Phi(dest.clone(), ty.clone(), incoming));
        LLVMValue::Reg(dest, ty)
    }

    pub fn build_call(&mut self, ret_ty: LLVMType, name: &str, args: Vec<LLVMValue>) -> LLVMValue {
        if ret_ty == LLVMType::Void {
            self.push_instr(LLVMInstruction::Call(None, ret_ty.clone(), name.to_string(), args));
            LLVMValue::Null(LLVMType::Void)
        } else {
            let dest = self.next_reg_name();
            self.push_instr(LLVMInstruction::Call(Some(dest.clone()), ret_ty.clone(), name.to_string(), args));
            LLVMValue::Reg(dest, ret_ty)
        }
    }

    pub fn build_br(&mut self, lbl: &str) {
        self.push_instr(LLVMInstruction::Br(lbl.to_string()));
    }

    pub fn build_cond_br(&mut self, cond: LLVMValue, true_lbl: &str, false_lbl: &str) {
        self.push_instr(LLVMInstruction::CondBr(cond, true_lbl.to_string(), false_lbl.to_string()));
    }

    pub fn build_ret(&mut self, val: Option<LLVMValue>) {
        self.push_instr(LLVMInstruction::Ret(val));
    }

    pub fn build_unreachable(&mut self) {
        self.push_instr(LLVMInstruction::Unreachable);
    }

    pub fn emit_to_string(&self) -> String {
        let mut out = String::new();
        out.push_str(&format!("; ModuleID = '{}'\n", self.module.name));
        out.push_str("target datalayout = \"e-m:e-i64:64-f80:128-n8:16:32:64-S128\"\n");
        out.push_str("target triple = \"x86_64-pc-linux-gnu\"\n\n");

        for decl in &self.module.declarations {
            out.push_str(decl);
            out.push('\n');
        }
        out.push('\n');

        for func in &self.module.funcs {
            let param_strs: Vec<String> = func.params.iter().map(|(n, t)| format!("{} %{}", t.to_string(), n)).collect();
            out.push_str(&format!("define {} @{}({}) {{\n", func.ret_ty.to_string(), func.name, param_strs.join(", ")));
            for block in &func.blocks {
                out.push_str(&format!("{}:\n", block.name));
                for instr in &block.instrs {
                    out.push_str(&instr.to_string());
                    out.push('\n');
                }
            }
            out.push_str("}\n\n");
        }

        out
    }
}
