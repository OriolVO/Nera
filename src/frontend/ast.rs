use crate::frontend::diagnostics::Spanned;

/// Represents the complete abstract syntax tree of a Nera program.
#[derive(Debug, Clone, PartialEq)]
pub struct Program {
    pub imports: Vec<Spanned<ImportDirective>>,
    pub declarations: Vec<Spanned<Declaration>>,
}

/// An import directive, e.g. `use std.math`
#[derive(Debug, Clone, PartialEq)]
pub struct ImportDirective {
    pub path: Vec<String>,
}

/// A top-level declaration in a Nera program.
#[derive(Debug, Clone, PartialEq)]
pub enum Declaration {
    Data(DataDecl),
    Choice(ChoiceDecl),
    Fn(FnDecl),
    Extern(ExternDecl),
    Var(VarDecl),
}

/// A data structure declaration, e.g. `data Particle { x: Float }`
#[derive(Debug, Clone, PartialEq)]
pub struct DataDecl {
    pub name: String,
    pub fields: Vec<FieldDecl>,
}

/// A field declaration inside a data structure.
#[derive(Debug, Clone, PartialEq)]
pub struct FieldDecl {
    pub name: String,
    pub ty: Spanned<Type>,
}


/// A choice declaration (ADT), e.g., `choice Option { Some(T), None }`
#[derive(Debug, Clone, PartialEq)]
pub struct ChoiceDecl {
    pub name: String,
    pub variants: Vec<VariantDecl>,
}

/// A variant of a choice declaration.
#[derive(Debug, Clone, PartialEq)]
pub struct VariantDecl {
    pub name: String,
    pub associated_types: Vec<Spanned<Type>>, // Empty if no data is associated
}

/// A function declaration, e.g. `fn move_particle(p: mut Particle) -> Void { ... }`
#[derive(Debug, Clone, PartialEq)]
pub struct FnDecl {
    pub name: String,
    pub params: Vec<Param>,
    pub return_type: Option<Spanned<Type>>,
    pub body: Spanned<Block>,
}

/// An external function declaration, e.g. `extern fn printf(fmt: String) -> Int`
#[derive(Debug, Clone, PartialEq)]
pub struct ExternDecl {
    pub name: String,
    pub params: Vec<Param>,
    pub return_type: Option<Spanned<Type>>,
}

/// A parameter in a function declaration.
#[derive(Debug, Clone, PartialEq)]
pub struct Param {
    pub is_mut: bool,
    pub name: String,
    pub ty: Spanned<Type>,
}

/// Represents a Nera type. It can be a simple identifier, or an array type.
#[derive(Debug, Clone, PartialEq)]
pub struct Type {
    pub name: String,
    pub is_array: bool,
    pub array_size: Option<i64>, // Only relevant if is_array is true. None means dynamic [].
    pub is_ptr: bool,
    pub is_nullable: bool,
}

/// A block of statements enclosed in curly braces.
#[derive(Debug, Clone, PartialEq)]
pub struct Block {
    pub statements: Vec<Spanned<Statement>>,
}

/// A statement within a block.
#[derive(Debug, Clone, PartialEq)]
pub enum Statement {
    Var(VarDecl),
    Assignment(Assignment),
    If(IfStmt),
    While(WhileStmt),
    Return(ReturnStmt),
    Expr(Spanned<Expression>),
    Free(Spanned<Expression>),
}

/// A variable declaration, e.g. `let x: Int = 5` or `mut y = 10`
#[derive(Debug, Clone, PartialEq)]
pub struct VarDecl {
    pub is_mut: bool,
    pub name: String,
    pub ty: Option<Spanned<Type>>,
    pub initializer: Spanned<Expression>,
}

/// An assignment operation, e.g. `x = 5`, `y += 2`
#[derive(Debug, Clone, PartialEq)]
pub struct Assignment {
    pub target: Spanned<Expression>,
    pub op: AssignOp,
    pub value: Spanned<Expression>,
}

/// Assignment operators
#[derive(Debug, Clone, PartialEq)]
pub enum AssignOp {
    Assign,    // =
    AddAssign, // +=
    SubAssign, // -=
    MulAssign, // *=
    DivAssign, // /=
}

/// An if statement, potentially with an else block or else-if chain.
#[derive(Debug, Clone, PartialEq)]
pub struct IfStmt {
    pub condition: Spanned<Expression>,
    pub then_block: Spanned<Block>,
    pub else_branch: Option<Box<Spanned<ElseBranch>>>,
}

/// The else branch of an if statement.
#[derive(Debug, Clone, PartialEq)]
pub enum ElseBranch {
    If(IfStmt),
    Block(Block),
}

/// A while loop.
#[derive(Debug, Clone, PartialEq)]
pub struct VariantConstructExpr {
    pub choice_name: String,
    pub variant_name: String,
    pub arguments: Vec<Spanned<Expression>>,
}

#[derive(Debug, Clone, PartialEq)]
pub struct WhileStmt {
    pub condition: Spanned<Expression>,
    pub block: Spanned<Block>,
}

/// A return statement.
#[derive(Debug, Clone, PartialEq)]
pub struct ReturnStmt {
    pub value: Option<Spanned<Expression>>,
}

/// An expression.
#[derive(Debug, Clone, PartialEq)]
pub enum Expression {
    Binary(Box<BinaryExpr>),
    Property(Box<PropertyAccess>),
    Call(Box<FunctionCall>),
    When(Box<WhenExpr>),
    Alloc(Box<AllocExpr>),
    Deref(Box<Spanned<Expression>>),
    VectorSlice(Box<VectorSliceExpr>),
    Index(Box<IndexExpr>),
    VariantConstruct(Box<VariantConstructExpr>),
    Primary(PrimaryExpr),
}


/// A when expression for pattern matching.
#[derive(Debug, Clone, PartialEq)]
pub struct AllocExpr {
    pub ty: Spanned<Type>,
    pub arguments: Vec<Spanned<Expression>>,
}

#[derive(Debug, Clone, PartialEq)]
pub struct WhenExpr {
    pub target: Spanned<Expression>,
    pub cases: Vec<WhenCase>,
    pub is_nullable: bool,
}

/// A case inside a when expression.
#[derive(Debug, Clone, PartialEq)]
pub struct WhenCase {
    pub variant_name: String,
    pub bindings: Vec<String>,
    pub body: Spanned<Block>,
}

/// A binary expression (combines logical, equality, relational, additive, multiplicative, pipe).
#[derive(Debug, Clone, PartialEq)]
pub struct BinaryExpr {
    pub left: Spanned<Expression>,
    pub op: BinaryOp,
    pub right: Spanned<Expression>,
}

/// Binary operators.
#[derive(Debug, Clone, PartialEq)]
pub enum BinaryOp {
    Pipe, // >>
    And, Or,
    Eq, NotEq,
    Lt, LtEq, Gt, GtEq,
    Add, Sub,
    Mul, Div,
}

/// A primary expression (the leaves of the expression tree).
#[derive(Debug, Clone, PartialEq)]
pub enum PrimaryExpr {
    Identifier(String),
    Integer(i64),
    Float(f64),
    String(String),
    Boolean(bool),
    ListLiteral(Vec<Spanned<Expression>>),
    NoneLiteral,
    Grouped(Box<Spanned<Expression>>),
}

/// A function call.
#[derive(Debug, Clone, PartialEq)]
pub struct FunctionCall {
    pub callee: Box<Spanned<Expression>>,
    pub arguments: Vec<Spanned<Expression>>,
}

/// A property access, e.g. `swarm.x`.
#[derive(Debug, Clone, PartialEq)]
pub struct PropertyAccess {
    pub object: Spanned<Expression>,
    pub property: String,
}

/// An explicit vector slice, e.g. `swarm.x[]` or `swarm.x[start..end]`.
#[derive(Debug, Clone, PartialEq)]
pub struct VectorSliceExpr {
    pub target: Spanned<Expression>,
    pub start: Option<Spanned<Expression>>,
    pub end: Option<Spanned<Expression>>,
}

/// An array index, e.g. `swarm.x[20]`.
#[derive(Debug, Clone, PartialEq)]
pub struct IndexExpr {
    pub target: Spanned<Expression>,
    pub index: Spanned<Expression>,
}
