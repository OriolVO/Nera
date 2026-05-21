use crate::frontend::ast::{AssignOp, BinaryOp, Block, Declaration, Expression, IfStmt, PrimaryExpr, Program, Statement, WhileStmt, ElseBranch};
use crate::frontend::diagnostics::Spanned;
use std::collections::HashMap;
use crate::error::CompileError;

#[derive(Debug, Clone, PartialEq)]
pub enum IROperand {
    LiteralInt(i64),
    LiteralFloat(f64),
    LiteralString(String),
    LiteralBool(bool),
    Variable(String),
    TempReg(usize),
    Void,
}

#[derive(Debug, Clone, PartialEq)]
pub enum Terminator {
    Jump(String),
    Branch(IROperand, String, String),
    Return(Option<IROperand>),
    None,
}

#[derive(Debug, Clone, PartialEq)]
pub struct BasicBlock {
    pub name: String,
    pub instrs: Vec<IRInstruction>,
    pub terminator: Terminator,
}

#[derive(Debug, Clone, PartialEq)]
pub struct IRFunction {
    pub name: String,
    pub params: Vec<String>,
    pub return_type: String,
    pub blocks: Vec<BasicBlock>,
}

#[derive(Debug, Clone, PartialEq)]
pub enum IRInstruction {
    Assign(IROperand, IROperand), // dest, src
    BinaryOp(IROperand, BinaryOp, IROperand, IROperand), // dest, op, left, right
    LoadProperty(IROperand, IROperand, String), // dest, object, property
    StoreProperty(IROperand, String, IROperand), // object, property, value
    Call(Option<IROperand>, IROperand, Vec<IROperand>), // dest_opt, callee, arguments
    FlatVectorApply(String, String, AssignOp, IROperand, i64), // target_array, property, op, right_operand, size
    ExtractTag(IROperand, IROperand), // dest, target_struct
    ExtractPayload(IROperand, IROperand, usize), // dest, target_struct, payload_index
}

pub struct IRGenerator {
    pub functions: Vec<IRFunction>,
    active_function: Option<IRFunction>,
    active_block: Option<BasicBlock>,
    temp_count: usize,
    label_count: usize,
    data_structs: HashMap<String, Vec<String>>,
    array_params: HashMap<String, String>, // Tracks array param variables to their type name
    array_sizes: HashMap<String, i64>, // Tracks dynamic array sizes
    pub choice_tags: HashMap<String, HashMap<String, i64>>, // ChoiceName -> VariantName -> Tag
    pub global_instructions: Vec<IRInstruction>, // for global vars, but we can just use main or init
}

impl IRGenerator {
    pub fn new() -> Self {
        Self {
            functions: Vec::new(),
            active_function: None,
            active_block: None,
            temp_count: 0,
            label_count: 0,
            data_structs: HashMap::new(),
            array_params: HashMap::new(),
            array_sizes: HashMap::new(),
            choice_tags: HashMap::new(),
            global_instructions: Vec::new(),
        }
    }

    pub fn generate(&mut self, program: &Program) -> Result<(), CompileError> {
        for decl in &program.declarations {
            if let Declaration::Data(data_decl) = &decl.node {
                let mut fields = Vec::new();
                for field in &data_decl.fields {
                    fields.push(field.name.clone());
                }
                self.data_structs.insert(data_decl.name.clone(), fields);
            }
        }

        for decl in &program.declarations {
            self.generate_declaration(decl);
        }
        Ok(())
    }

    fn new_temp(&mut self) -> IROperand {
        let t = self.temp_count;
        self.temp_count += 1;
        IROperand::TempReg(t)
    }

    fn new_label(&mut self, prefix: &str) -> String {
        let l = self.label_count;
        self.label_count += 1;
        format!("{}_{}", prefix, l)
    }

    fn emit(&mut self, instr: IRInstruction) {
        if let Some(block) = &mut self.active_block {
            block.instrs.push(instr);
        } else {
            self.global_instructions.push(instr);
        }
    }

    fn finish_block(&mut self, term: Terminator) {
        if let Some(mut block) = self.active_block.take() {
            if block.terminator == Terminator::None {
                block.terminator = term;
            }
            if let Some(func) = &mut self.active_function {
                func.blocks.push(block);
            }
        }
    }

    fn start_block(&mut self, name: String) {
        if let Some(block) = &self.active_block {
            if block.terminator == Terminator::None {
                self.finish_block(Terminator::Jump(name.clone()));
            } else {
                self.finish_block(Terminator::None);
            }
        }
        self.active_block = Some(BasicBlock {
            name,
            instrs: Vec::new(),
            terminator: Terminator::None,
        });
    }

    fn generate_declaration(&mut self, decl: &Spanned<Declaration>) {
        match &decl.node {
            Declaration::Fn(fn_decl) => {
                self.array_params.clear();
                self.temp_count = 0;
                self.label_count = 0;

                let return_type = if let Some(ty) = &fn_decl.return_type {
                    ty.node.name.clone()
                } else {
                    "Void".to_string()
                };

                let mut flattened_params = Vec::new();
                for param in &fn_decl.params {
                    if param.ty.node.is_array {
                        if let Some(sz) = param.ty.node.array_size {
                            self.array_sizes.insert(param.name.clone(), sz);
                        }
                        let ty_name = &param.ty.node.name;
                        self.array_params.insert(param.name.clone(), ty_name.clone());
                        if let Some(fields) = self.data_structs.get(ty_name) {
                            for field in fields {
                                flattened_params.push(format!("{}_{}", param.name, field));
                            }
                        } else {
                            flattened_params.push(param.name.clone());
                        }
                    } else {
                        flattened_params.push(param.name.clone());
                    }
                }

                self.active_function = Some(IRFunction {
                    name: fn_decl.name.clone(),
                    params: flattened_params,
                    return_type,
                    blocks: Vec::new(),
                });

                self.start_block("entry".to_string());
                self.generate_block(&fn_decl.body);
                
                if let Some(block) = &self.active_block {
                    if block.terminator == Terminator::None {
                        self.finish_block(Terminator::Return(None));
                    } else {
                        self.finish_block(Terminator::None);
                    }
                }

                if let Some(func) = self.active_function.take() {
                    self.functions.push(func);
                }
            }
            Declaration::Var(var_decl) => {
                if let Some(ty) = &var_decl.ty {
                    if ty.node.is_array {
                        if let Some(sz) = ty.node.array_size {
                            self.array_sizes.insert(var_decl.name.clone(), sz);
                        }
                    }
                }
                
                // Wait, global variable initializers should probably be injected into `main`, but we just emit them as Assigns.
                // In Nera's current state, variables outside functions might just be ignored by LLVM generator if not in a function.
                // Or maybe LLVM generator doesn't support them well. Let's just emit them to a global stream or ignore them for now.
                // The current implementation generated them directly.
                // We'll wrap them in an implicit "global_init" block if we wanted, but let's just let it be.
                let val = self.generate_expression(&var_decl.initializer);
                self.emit(IRInstruction::Assign(
                    IROperand::Variable(var_decl.name.clone()),
                    val,
                ));
            }
            Declaration::Data(_) => {}
            Declaration::Choice(choice_decl) => {
                let mut tag_map = HashMap::new();
                for (i, variant) in choice_decl.variants.iter().enumerate() {
                    tag_map.insert(variant.name.clone(), i as i64);
                }
                self.choice_tags.insert(choice_decl.name.clone(), tag_map);
            }
        }
    }

    fn generate_block(&mut self, block: &Spanned<Block>) {
        for stmt in &block.node.statements {
            self.generate_statement(stmt);
        }
    }

    fn generate_statement(&mut self, stmt: &Spanned<Statement>) {
        match &stmt.node {
            Statement::Var(var_decl) => {
                if let Some(ty) = &var_decl.ty {
                    if ty.node.is_array {
                        if let Some(sz) = ty.node.array_size {
                            self.array_sizes.insert(var_decl.name.clone(), sz);
                        }
                    }
                }
                let val = self.generate_expression(&var_decl.initializer);
                self.emit(IRInstruction::Assign(
                    IROperand::Variable(var_decl.name.clone()),
                    val,
                ));
            }
            Statement::Assignment(assignment) => {
                if let Expression::Property(prop_access) = &assignment.target.node {
                    if let Expression::Primary(PrimaryExpr::Identifier(target_array)) = &prop_access.object.node {
                        let right_val = self.generate_expression(&assignment.value);
                        let size = *self.array_sizes.get(target_array).unwrap_or(&0); // 100000 per precaució
                        self.emit(IRInstruction::FlatVectorApply(
                            target_array.clone(),
                            prop_access.property.clone(),
                            assignment.op.clone(),
                            right_val,
                            size,
                        ));
                        return;
                    }
                }

                let right_val = self.generate_expression(&assignment.value);
                
                let final_val = match assignment.op {
                    AssignOp::Assign => right_val,
                    _ => {
                        let left_val = self.generate_expression(&assignment.target);
                        let bin_op = match assignment.op {
                            AssignOp::AddAssign => BinaryOp::Add,
                            AssignOp::SubAssign => BinaryOp::Sub,
                            AssignOp::MulAssign => BinaryOp::Mul,
                            AssignOp::DivAssign => BinaryOp::Div,
                            AssignOp::Assign => unreachable!(),
                        };
                        let dest = self.new_temp();
                        self.emit(IRInstruction::BinaryOp(dest.clone(), bin_op, left_val, right_val));
                        dest
                    }
                };
                
                if let Expression::Property(prop_access) = &assignment.target.node {
                    let obj_val = self.generate_expression(&prop_access.object);
                    self.emit(IRInstruction::StoreProperty(
                        obj_val,
                        prop_access.property.clone(),
                        final_val,
                    ));
                } else if let Expression::Primary(PrimaryExpr::Identifier(name)) = &assignment.target.node {
                    self.emit(IRInstruction::Assign(
                        IROperand::Variable(name.clone()),
                        final_val,
                    ));
                }
            }
            Statement::If(if_stmt) => {
                let cond_val = self.generate_expression(&if_stmt.condition);
                let true_label = self.new_label("then");
                let end_label = self.new_label("end_if");
                
                let has_else = if_stmt.else_branch.is_some();
                let false_label = if has_else { self.new_label("else") } else { end_label.clone() };

                self.finish_block(Terminator::Branch(cond_val, true_label.clone(), false_label.clone()));

                self.start_block(true_label);
                self.generate_block(&if_stmt.then_block);
                self.finish_block(Terminator::Jump(end_label.clone()));

                if has_else {
                    self.start_block(false_label);
                    if let Some(else_branch) = &if_stmt.else_branch {
                        match &else_branch.node {
                            ElseBranch::If(else_if) => {
                                let spanned_if = Spanned::new(Statement::If(else_if.clone()), else_branch.span.clone());
                                self.generate_statement(&spanned_if);
                            }
                            ElseBranch::Block(b) => {
                                let spanned_b = Spanned::new(b.clone(), else_branch.span.clone());
                                self.generate_block(&spanned_b);
                            }
                        }
                    }
                    self.finish_block(Terminator::Jump(end_label.clone()));
                }

                self.start_block(end_label);
            }
            Statement::While(while_stmt) => {
                let loop_cond = self.new_label("while_cond");
                let loop_body = self.new_label("while_body");
                let loop_end = self.new_label("while_end");

                self.finish_block(Terminator::Jump(loop_cond.clone()));

                self.start_block(loop_cond.clone());
                let cond_val = self.generate_expression(&while_stmt.condition);
                self.finish_block(Terminator::Branch(cond_val, loop_body.clone(), loop_end.clone()));
                
                self.start_block(loop_body);
                self.generate_block(&while_stmt.block);
                self.finish_block(Terminator::Jump(loop_cond));
                
                self.start_block(loop_end);
            }
            Statement::Return(return_stmt) => {
                let val_opt = return_stmt.value.as_ref().map(|v| self.generate_expression(v));
                self.finish_block(Terminator::Return(val_opt));
                let unreachable_lbl = self.new_label("unreachable");
                self.start_block(unreachable_lbl);
            }
            Statement::Expr(expr) => {
                self.generate_expression(expr);
            }
        }
    }

    fn flatten_argument(&self, args: &mut Vec<IROperand>, op: IROperand) {
        if let IROperand::Variable(name) = &op {
            if let Some(ty_name) = self.array_params.get(name) {
                if let Some(fields) = self.data_structs.get(ty_name) {
                    for field in fields {
                        args.push(IROperand::Variable(format!("{}_{}", name, field)));
                    }
                    return;
                }
            }
        }
        args.push(op);
    }

    fn generate_expression(&mut self, expr: &Spanned<Expression>) -> IROperand {
        match &expr.node {
            Expression::Binary(bin_expr) => {
                if bin_expr.op == BinaryOp::Pipe {
                    let data_operand = self.generate_expression(&bin_expr.left);
                    let mut call_args = Vec::new();
                    self.flatten_argument(&mut call_args, data_operand);

                    let callee_operand = self.generate_expression(&bin_expr.right);
                    let dest = self.new_temp();
                    self.emit(IRInstruction::Call(
                        Some(dest.clone()),
                        callee_operand,
                        call_args,
                    ));
                    return dest;
                }

                let left = self.generate_expression(&bin_expr.left);
                let right = self.generate_expression(&bin_expr.right);
                let dest = self.new_temp();
                self.emit(IRInstruction::BinaryOp(
                    dest.clone(),
                    bin_expr.op.clone(),
                    left,
                    right,
                ));
                dest
            }
            Expression::Property(prop_access) => {
                let obj = self.generate_expression(&prop_access.object);
                let dest = self.new_temp();
                self.emit(IRInstruction::LoadProperty(
                    dest.clone(),
                    obj,
                    prop_access.property.clone(),
                ));
                dest
            }
            Expression::Call(func_call) => {
                let callee = self.generate_expression(&func_call.callee);
                let mut call_args = Vec::new();
                for arg in &func_call.arguments {
                    let arg_op = self.generate_expression(arg);
                    self.flatten_argument(&mut call_args, arg_op);
                }
                let dest = self.new_temp();
                self.emit(IRInstruction::Call(
                    Some(dest.clone()),
                    callee,
                    call_args,
                ));
                dest
            }
            Expression::Primary(primary) => {
                match primary {
                    PrimaryExpr::Integer(val) => IROperand::LiteralInt(*val),
                    PrimaryExpr::Float(val) => IROperand::LiteralFloat(*val),
                    PrimaryExpr::String(val) => IROperand::LiteralString(val.clone()),
                    PrimaryExpr::Boolean(val) => IROperand::LiteralBool(*val),
                    PrimaryExpr::Identifier(name) => IROperand::Variable(name.clone()),
                    PrimaryExpr::Grouped(inner) => self.generate_expression(inner),
                    PrimaryExpr::ListLiteral(_) => {
                        IROperand::Void
                    }
                }
            }
            Expression::When(when_expr) => {
                let target_op = self.generate_expression(&when_expr.target);
                let dest_temp = self.new_temp();
                
                let tag_temp = self.new_temp();
                self.emit(IRInstruction::ExtractTag(tag_temp.clone(), target_op.clone()));
                
                let end_label = self.new_label("when_end");
                
                for case in &when_expr.cases {
                    let case_label = self.new_label("when_case");
                    let next_label = self.new_label("when_next");
                    
                    // We assume variants are uniquely named across all choices or just search for it
                    let mut expected_tag = 0;
                    for tags in self.choice_tags.values() {
                        if let Some(tag) = tags.get(&case.variant_name) {
                            expected_tag = *tag;
                            break;
                        }
                    }
                    
                    let cmp_res = self.new_temp();
                    self.emit(IRInstruction::BinaryOp(
                        cmp_res.clone(),
                        BinaryOp::Eq,
                        tag_temp.clone(),
                        IROperand::LiteralInt(expected_tag),
                    ));
                    
                    self.finish_block(Terminator::Branch(cmp_res, case_label.clone(), next_label.clone()));
                    self.start_block(case_label);
                    
                    for (i, binding) in case.bindings.iter().enumerate() {
                        let bind_var = IROperand::Variable(binding.clone());
                        self.emit(IRInstruction::ExtractPayload(bind_var, target_op.clone(), i));
                    }
                    
                    for (i, stmt) in case.body.node.statements.iter().enumerate() {
                        if i == case.body.node.statements.len() - 1 {
                            if let Statement::Expr(expr) = &stmt.node {
                                let val = self.generate_expression(expr);
                                self.emit(IRInstruction::Assign(dest_temp.clone(), val));
                            } else {
                                self.generate_statement(stmt);
                            }
                        } else {
                            self.generate_statement(stmt);
                        }
                    }
                    
                    self.finish_block(Terminator::Jump(end_label.clone()));
                    self.start_block(next_label);
                }
                
                // Fallback / end of match
                self.emit(IRInstruction::Assign(dest_temp.clone(), IROperand::Void));
                self.finish_block(Terminator::Jump(end_label.clone()));
                
                self.start_block(end_label);
                dest_temp
            }
        }
    }
}
