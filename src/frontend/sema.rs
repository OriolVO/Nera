use std::collections::HashMap;
use super::ast::*;
use super::diagnostics::{print_diagnostic, Span, Spanned, DiagnosticError};

#[derive(Debug, Clone, PartialEq)]
pub enum TypeInfo {
    Int,
    Float,
    Boolean,
    String,
    Void,
    Array(Box<TypeInfo>, Option<i64>),
    Custom(String),
    Unknown,
}

impl TypeInfo {
    pub fn from_ast(ty: &Type) -> Self {
        let base = match ty.name.as_str() {
            "Int" => TypeInfo::Int,
            "Float" => TypeInfo::Float,
            "Boolean" => TypeInfo::Boolean,
            "String" => TypeInfo::String,
            "Void" => TypeInfo::Void,
            "Unknown" => TypeInfo::Unknown,
            custom => TypeInfo::Custom(custom.to_string()),
        };
        if ty.is_array {
            TypeInfo::Array(Box::new(base), ty.array_size)
        } else {
            base
        }
    }

    pub fn to_string(&self) -> String {
        match self {
            TypeInfo::Int => "Int".to_string(),
            TypeInfo::Float => "Float".to_string(),
            TypeInfo::Boolean => "Boolean".to_string(),
            TypeInfo::String => "String".to_string(),
            TypeInfo::Void => "Void".to_string(),
            TypeInfo::Array(inner, _) => format!("{}[]", inner.to_string()),
            TypeInfo::Custom(name) => name.clone(),
            TypeInfo::Unknown => "Unknown".to_string(),
        }
    }

    pub fn is_array(&self) -> bool {
        matches!(self, TypeInfo::Array(_, _))
    }

    pub fn get_array_inner(&self) -> Option<TypeInfo> {
        if let TypeInfo::Array(inner, _) = self {
            Some((**inner).clone())
        } else {
            None
        }
    }
}

/// Represents a variable within the symbol table.
#[derive(Debug, Clone)]
pub struct VariableSymbol {
    pub is_mut: bool,
    pub ty: TypeInfo,
    pub size: Option<i64>,
}

/// Represents a function within the symbol table.
#[derive(Debug, Clone)]
pub struct FunctionSymbol {
    pub params: Vec<(String, TypeInfo)>, // name, type
    pub return_ty: TypeInfo,
}

/// Represents a data structure within the symbol table.
#[derive(Debug, Clone)]
pub struct DataSymbol {
    pub fields: HashMap<String, TypeInfo>, // field name, type
}

/// A generic symbol that can be stored in the environment.
#[derive(Debug, Clone)]
pub enum Symbol {
    Variable(VariableSymbol),
    Function(FunctionSymbol),
    Data(DataSymbol),
}

/// A scoped symbol table for tracking declarations.
pub struct Environment {
    scopes: Vec<HashMap<String, Symbol>>,
}

impl Environment {
    pub fn new() -> Self {
        let mut global_scope = HashMap::new();
        global_scope.insert("print".to_string(), Symbol::Function(FunctionSymbol {
            params: vec![("value".to_string(), TypeInfo::Unknown)],
            return_ty: TypeInfo::Void,
        }));
        Self {
            scopes: vec![global_scope],
        }
    }

    pub fn enter_scope(&mut self) {
        self.scopes.push(HashMap::new());
    }

    pub fn exit_scope(&mut self) {
        self.scopes.pop();
    }

    pub fn define(&mut self, name: String, symbol: Symbol) {
        if let Some(scope) = self.scopes.last_mut() {
            scope.insert(name, symbol);
        }
    }

    pub fn resolve(&self, name: &str) -> Option<&Symbol> {
        for scope in self.scopes.iter().rev() {
            if let Some(sym) = scope.get(name) {
                return Some(sym);
            }
        }
        None
    }
}

/// The Semantic Analyzer is responsible for enforcing type safety and mutability rules.
pub struct SemanticAnalyzer<'a> {
    pub source: &'a str,
    env: Environment,
    pub errors: Vec<DiagnosticError>,
    current_return_ty: Option<TypeInfo>,
    pub inferred_types: HashMap<String, TypeInfo>,
}

impl<'a> SemanticAnalyzer<'a> {
    pub fn new(source: &'a str) -> Self {
        Self {
            source,
            env: Environment::new(),
            errors: Vec::new(),
            current_return_ty: None,
            inferred_types: HashMap::new(),
        }
    }

    fn report_error(&mut self, span: &Span, message: &str) {
        self.errors.push(DiagnosticError {
            span: span.clone(),
            message: message.to_string(),
        });
        print_diagnostic(self.source, span, message);
    }

    /// Analyzes the entire AST of a Nera program.
    pub fn analyze(&mut self, program: &mut Program) -> Result<(), ()> {
        for decl in &mut program.declarations {
            self.register_declaration(decl);
        }

        for decl in &mut program.declarations {
            self.analyze_declaration(decl);
        }

        if self.errors.is_empty() {
            Ok(())
        } else {
            Err(())
        }
    }

    fn register_declaration(&mut self, decl: &mut Spanned<Declaration>) {
        match &mut decl.node {
            Declaration::Data(data_decl) => {
                let mut fields = HashMap::new();
                for field in &data_decl.fields {
                    fields.insert(field.name.clone(), TypeInfo::from_ast(&field.ty.node));
                }
                self.env.define(data_decl.name.clone(), Symbol::Data(DataSymbol { fields }));
            }
            Declaration::Fn(fn_decl) => {
                let mut params = Vec::new();
                for param in &fn_decl.params {
                    params.push((param.name.clone(), TypeInfo::from_ast(&param.ty.node)));
                }
                let return_ty = if let Some(ty) = &fn_decl.return_type {
                    TypeInfo::from_ast(&ty.node)
                } else {
                    TypeInfo::Void
                };
                self.env.define(fn_decl.name.clone(), Symbol::Function(FunctionSymbol { params, return_ty }));
            }
            Declaration::Var(_) => {}
        }
    }

    fn analyze_declaration(&mut self, decl: &mut Spanned<Declaration>) {
        match &mut decl.node {
            Declaration::Data(_) => {}
            Declaration::Fn(fn_decl) => {
                self.env.enter_scope();
                for param in &fn_decl.params {
                    let ty_info = TypeInfo::from_ast(&param.ty.node);
                    self.env.define(param.name.clone(), Symbol::Variable(VariableSymbol {
                        is_mut: param.is_mut,
                        ty: ty_info.clone(),
                        size: param.ty.node.array_size,
                    }));
                    self.inferred_types.insert(param.name.clone(), ty_info);
                }

                let expected_ret = if let Some(ty) = &fn_decl.return_type {
                    TypeInfo::from_ast(&ty.node)
                } else {
                    TypeInfo::Void
                };
                self.current_return_ty = Some(expected_ret);
                self.analyze_block(&mut fn_decl.body);
                self.current_return_ty = None;
                
                self.env.exit_scope();
            }
            Declaration::Var(var_decl) => {
                let inferred_ty = self.analyze_expression(&mut var_decl.initializer);
                let mut size = None;
                let final_ty = if let Some(explicit_ty) = &var_decl.ty {
                    size = explicit_ty.node.array_size;
                    let explicit_info = TypeInfo::from_ast(&explicit_ty.node);
                    if explicit_info != inferred_ty && inferred_ty != TypeInfo::Unknown {
                        self.report_error(&explicit_ty.span, &format!("Type mismatch: expected {}, found {}", explicit_info.to_string(), inferred_ty.to_string()));
                    }
                    explicit_info
                } else {
                    if inferred_ty == TypeInfo::Unknown {
                        self.report_error(&var_decl.initializer.span, "Empty array declarations require an explicit type annotation.");
                        TypeInfo::Unknown
                    } else {
                        inferred_ty
                    }
                };
                self.env.define(var_decl.name.clone(), Symbol::Variable(VariableSymbol {
                    is_mut: var_decl.is_mut,
                    ty: final_ty.clone(),
                    size,
                }));
                self.inferred_types.insert(var_decl.name.clone(), final_ty);
            }
        }
    }

    fn analyze_block(&mut self, block: &mut Spanned<Block>) {
        for stmt in &mut block.node.statements {
            self.analyze_statement(stmt);
        }
    }

    fn analyze_statement(&mut self, stmt: &mut Spanned<Statement>) {
        match &mut stmt.node {
            Statement::Var(var_decl) => {
                let inferred_ty = self.analyze_expression(&mut var_decl.initializer);
                let mut size = None;
                let final_ty = if let Some(explicit_ty) = &var_decl.ty {
                    size = explicit_ty.node.array_size;
                    let explicit_info = TypeInfo::from_ast(&explicit_ty.node);
                    if explicit_info != inferred_ty && inferred_ty != TypeInfo::Unknown {
                        self.report_error(&explicit_ty.span, &format!("Type mismatch: expected {}, found {}", explicit_info.to_string(), inferred_ty.to_string()));
                    }
                    explicit_info
                } else {
                    if inferred_ty == TypeInfo::Unknown {
                        self.report_error(&var_decl.initializer.span, "Empty array declarations require an explicit type annotation.");
                        TypeInfo::Unknown
                    } else {
                        inferred_ty
                    }
                };
                
                self.env.define(var_decl.name.clone(), Symbol::Variable(VariableSymbol {
                    is_mut: var_decl.is_mut,
                    ty: final_ty.clone(),
                    size,
                }));
                self.inferred_types.insert(var_decl.name.clone(), final_ty);
            }
            Statement::Assignment(assignment) => {
                let right_ty = self.analyze_expression(&mut assignment.value);
                let left_ty = self.analyze_expression(&mut assignment.target);
                
                let is_broadcasting = left_ty.is_array() && left_ty.get_array_inner() == Some(right_ty.clone());

                if !is_broadcasting && left_ty != right_ty && left_ty != TypeInfo::Unknown && right_ty != TypeInfo::Unknown {
                    self.report_error(&assignment.value.span, &format!("Type mismatch in assignment: cannot assign {} to {}", right_ty.to_string(), left_ty.to_string()));
                }

                if let Some(root_name) = self.get_root_identifier(&assignment.target) {
                    if let Some(Symbol::Variable(var_sym)) = self.env.resolve(&root_name) {
                        if !var_sym.is_mut {
                            self.report_error(&assignment.target.span, &format!("Mutation of immutable binding '{}' is strictly forbidden.", root_name));
                        }
                    } else {
                        self.report_error(&assignment.target.span, &format!("Undefined variable '{}' in assignment.", root_name));
                    }
                } else {
                    self.report_error(&assignment.target.span, "Invalid assignment target.");
                }
            }
            Statement::If(if_stmt) => {
                let cond_ty = self.analyze_expression(&mut if_stmt.condition);
                if cond_ty != TypeInfo::Boolean && cond_ty != TypeInfo::Unknown {
                    self.report_error(&if_stmt.condition.span, &format!("If condition must be a Boolean, found {}", cond_ty.to_string()));
                }
                
                self.env.enter_scope();
                self.analyze_block(&mut if_stmt.then_block);
                self.env.exit_scope();
                
                if let Some(else_branch) = &mut if_stmt.else_branch {
                    match &mut else_branch.node {
                        ElseBranch::If(else_if) => {
                            let mut spanned_if = Spanned::new(Statement::If(else_if.clone()), else_branch.span.clone());
                            self.analyze_statement(&mut spanned_if);
                        }
                        ElseBranch::Block(b) => {
                            self.env.enter_scope();
                            let mut spanned_b = Spanned::new(b.clone(), else_branch.span.clone());
                            self.analyze_block(&mut spanned_b);
                            self.env.exit_scope();
                        }
                    }
                }
            }
            Statement::While(while_stmt) => {
                let cond_ty = self.analyze_expression(&mut while_stmt.condition);
                if cond_ty != TypeInfo::Boolean && cond_ty != TypeInfo::Unknown {
                    self.report_error(&while_stmt.condition.span, &format!("While condition must be a Boolean, found {}", cond_ty.to_string()));
                }
                
                self.env.enter_scope();
                self.analyze_block(&mut while_stmt.block);
                self.env.exit_scope();
            }
            Statement::Return(return_stmt) => {
                let actual_ty = if let Some(val) = &mut return_stmt.value {
                    self.analyze_expression(val)
                } else {
                    TypeInfo::Void
                };

                if let Some(expected_ty) = &self.current_return_ty {
                    if *expected_ty != actual_ty && actual_ty != TypeInfo::Unknown {
                        self.report_error(&stmt.span, &format!("Type mismatch in return: expected {}, found {}", expected_ty.to_string(), actual_ty.to_string()));
                    }
                }
            }
            Statement::Expr(expr) => {
                self.analyze_expression(expr);
            }
        }
    }

    fn analyze_expression(&mut self, expr: &mut Spanned<Expression>) -> TypeInfo {
        // Intercept method call desugaring before matching
        if let Expression::Call(func_call) = &mut expr.node {
            if let Expression::Property(prop_access) = &func_call.callee.node {
                // We have intercepted a method call: object.method(args...)
                let object = prop_access.object.clone();
                let method_name = prop_access.property.clone();
                let method_span = func_call.callee.span.clone();

                func_call.arguments.insert(0, object);
                func_call.callee.node = Expression::Primary(PrimaryExpr::Identifier(method_name));
                func_call.callee.span = method_span;
            }
        }

        match &mut expr.node {
            Expression::Call(func_call) => {
                let mut arg_types = Vec::new();
                for arg in &mut func_call.arguments {
                    arg_types.push(self.analyze_expression(arg));
                }
                
                if let Expression::Primary(PrimaryExpr::Identifier(name)) = &func_call.callee.node {
                    if name == "print" {
                        if arg_types.len() != 1 {
                            self.report_error(&func_call.callee.span, "Function 'print' expects exactly 1 argument");
                        }
                        return TypeInfo::Void;
                    }
                    
                    let fn_info = if let Some(Symbol::Function(fn_sym)) = self.env.resolve(name) {
                        Some((fn_sym.params.clone(), fn_sym.return_ty.clone()))
                    } else {
                        None
                    };
                    
                    if let Some((expected_params, return_ty)) = fn_info {
                        if arg_types.len() != expected_params.len() {
                            self.report_error(&func_call.callee.span, &format!("Function '{}' expects {} arguments, but got {}", name, expected_params.len(), arg_types.len()));
                        } else {
                            for (i, arg_ty) in arg_types.iter().enumerate() {
                                let expected_ty = &expected_params[i].1;
                                
                                let is_dod_param = arg_ty.is_array() && arg_ty.get_array_inner().as_ref() == Some(expected_ty);
                                
                                if arg_ty != expected_ty && !is_dod_param && *arg_ty != TypeInfo::Unknown && *expected_ty != TypeInfo::Unknown {
                                    self.report_error(&func_call.arguments[i].span, &format!("Argument {} type mismatch: expected {}, found {}", i+1, expected_ty.to_string(), arg_ty.to_string()));
                                }
                            }
                        }
                        return return_ty;
                    } else {
                        self.report_error(&func_call.callee.span, &format!("Undefined function '{}'", name));
                    }
                }
                
                TypeInfo::Unknown
            }
            Expression::Binary(bin_expr) => {
                let left_ty = self.analyze_expression(&mut bin_expr.left);
                let right_ty = self.analyze_expression(&mut bin_expr.right);
                
                match bin_expr.op {
                    BinaryOp::Add | BinaryOp::Sub | BinaryOp::Mul | BinaryOp::Div => {
                        let is_vector_math = (left_ty.is_array() && left_ty.get_array_inner() == Some(right_ty.clone()))
                            || (right_ty.is_array() && right_ty.get_array_inner() == Some(left_ty.clone()));

                        if !is_vector_math && left_ty != right_ty && left_ty != TypeInfo::Unknown && right_ty != TypeInfo::Unknown {
                            self.report_error(&expr.span, &format!("Binary operation type mismatch: {} and {}", left_ty.to_string(), right_ty.to_string()));
                        }
                        
                        if left_ty.is_array() { left_ty } else { right_ty }
                    }
                    BinaryOp::Eq | BinaryOp::NotEq | BinaryOp::Lt | BinaryOp::LtEq | BinaryOp::Gt | BinaryOp::GtEq => {
                        TypeInfo::Boolean
                    }
                    BinaryOp::And | BinaryOp::Or => {
                        if (left_ty != TypeInfo::Boolean && left_ty != TypeInfo::Unknown) || (right_ty != TypeInfo::Boolean && right_ty != TypeInfo::Unknown) {
                            self.report_error(&expr.span, "Logical operators require Boolean operands");
                        }
                        TypeInfo::Boolean
                    }
                    BinaryOp::Pipe => right_ty,
                }
            }
            Expression::Property(prop_access) => {
                let obj_ty = self.analyze_expression(&mut prop_access.object);
                if obj_ty == TypeInfo::Unknown {
                    return TypeInfo::Unknown;
                }

                let (base_ty, is_array) = if let TypeInfo::Array(inner, _) = &obj_ty {
                    ((**inner).clone(), true)
                } else {
                    (obj_ty.clone(), false)
                };

                let base_name = if let TypeInfo::Custom(name) = &base_ty {
                    name.clone()
                } else {
                    base_ty.to_string()
                };

                if let Some(Symbol::Data(data_sym)) = self.env.resolve(&base_name) {
                    if let Some(field_ty) = data_sym.fields.get(&prop_access.property) {
                        if let Some(root_name) = self.get_root_identifier(&prop_access.object) {
                            self.inferred_types.insert(format!("{}_{}", root_name, prop_access.property), field_ty.clone());
                        }

                        if is_array {
                            return TypeInfo::Array(Box::new(field_ty.clone()), None);
                        } else {
                            return field_ty.clone();
                        }
                    } else {
                        self.report_error(&expr.span, &format!("Property '{}' not found on type '{}'", prop_access.property, base_name));
                        TypeInfo::Unknown
                    }
                } else {
                    self.report_error(&prop_access.object.span, &format!("Cannot access property '{}' on non-data type '{}'", prop_access.property, obj_ty.to_string()));
                    TypeInfo::Unknown
                }
            }
            Expression::Primary(primary) => {
                match primary {
                    PrimaryExpr::Integer(_) => TypeInfo::Int,
                    PrimaryExpr::Float(_) => TypeInfo::Float,
                    PrimaryExpr::String(_) => TypeInfo::String,
                    PrimaryExpr::Boolean(_) => TypeInfo::Boolean,
                    PrimaryExpr::Identifier(name) => {
                        if let Some(Symbol::Variable(var_sym)) = self.env.resolve(name) {
                            var_sym.ty.clone()
                        } else {
                            self.report_error(&expr.span, &format!("Undefined variable '{}'", name));
                            TypeInfo::Unknown
                        }
                    }
                    PrimaryExpr::ListLiteral(elems) => {
                        if elems.is_empty() {
                            TypeInfo::Unknown
                        } else {
                            let el_ty = self.analyze_expression(&mut elems[0]);
                            for i in 1..elems.len() {
                                let curr_ty = self.analyze_expression(&mut elems[i]);
                                if curr_ty != el_ty && curr_ty != TypeInfo::Unknown && el_ty != TypeInfo::Unknown {
                                    self.report_error(&elems[i].span, &format!("Array type mismatch: expected {}, found {}", el_ty.to_string(), curr_ty.to_string()));
                                }
                            }
                            TypeInfo::Array(Box::new(el_ty), None)
                        }
                    }
                    PrimaryExpr::Grouped(inner) => {
                        self.analyze_expression(inner)
                    }
                }
            }
        }
    }

    fn get_root_identifier(&self, expr: &Spanned<Expression>) -> Option<String> {
        match &expr.node {
            Expression::Primary(PrimaryExpr::Identifier(name)) => Some(name.clone()),
            Expression::Property(prop_access) => self.get_root_identifier(&prop_access.object),
            _ => None,
        }
    }
}
