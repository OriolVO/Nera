use super::lexer::{Lexer, Token, TokenKind};
use super::ast::*;
use super::diagnostics::{Span, Spanned, DiagnosticError, print_diagnostic};

/// A professional, recursive-descent parser for the Nera language.
#[derive(Clone)]
pub struct Parser<'a> {
    pub source: &'a str,
    lexer: Lexer<'a>,
    current_token: Token,
    next_token: Token,
    pub errors: Vec<DiagnosticError>,
    pub is_lookahead: bool,
}

impl<'a> Parser<'a> {
    /// Creates a new Parser from a given Lexer.
    pub fn new(source: &'a str, mut lexer: Lexer<'a>) -> Self {
        let current_token = lexer.next_token();
        let next_token = lexer.next_token();
        Self {
            source,
            lexer,
            current_token,
            next_token,
            errors: Vec::new(),
            is_lookahead: false,
        }
    }

    /// Advances the parser to the next token.
    fn advance(&mut self) {
        self.current_token = self.next_token.clone();
        self.next_token = self.lexer.next_token();
    }

    fn report_error(&mut self, span: &Span, message: &str) {
        self.errors.push(DiagnosticError {
            span: span.clone(),
            message: message.to_string(),
        });
        if !self.is_lookahead {
            print_diagnostic(self.source, span, message);
        }
    }

    /// Consumes the current token if it matches the expected kind, otherwise returns None.
    fn consume(&mut self, expected: TokenKind, message: &str) -> Option<()> {
        if self.current_token.kind == expected {
            self.advance();
            Some(())
        } else if std::mem::discriminant(&self.current_token.kind) == std::mem::discriminant(&expected) {
            self.advance();
            Some(())
        } else {
            self.report_error(&self.current_token.span.clone(), message);
            None
        }
    }

    fn synchronize(&mut self) {
        self.advance();

        while self.current_token.kind != TokenKind::Eof {
            if self.current_token.kind == TokenKind::RBrace {
                return;
            }

            match self.current_token.kind {
                TokenKind::Data | TokenKind::Fn | TokenKind::Let | TokenKind::Mut |
                TokenKind::If | TokenKind::While | TokenKind::Return | TokenKind::Use => {
                    return;
                }
                _ => {}
            }
            self.advance();
        }
    }

    /// Parses a complete Nera program.
    pub fn parse_program(&mut self) -> Program {
        let mut imports = Vec::new();
        let mut declarations = Vec::new();

        while self.current_token.kind == TokenKind::Use {
            if let Some(import) = self.parse_import_directive() {
                imports.push(import);
            } else {
                self.synchronize();
            }
        }

        while self.current_token.kind != TokenKind::Eof {
            if let Some(decl) = self.parse_declaration() {
                declarations.push(decl);
            } else {
                self.synchronize();
            }
        }

        Program { imports, declarations }
    }

    fn parse_import_directive(&mut self) -> Option<Spanned<ImportDirective>> {
        let start_span = self.current_token.span.clone();
        self.consume(TokenKind::Use, "Expected 'use'")?;

        let mut path = Vec::new();
        
        let first_name = match &self.current_token.kind {
            TokenKind::Identifier(name) => name.clone(),
            _ => {
                self.report_error(&self.current_token.span.clone(), "Expected identifier in import path");
                return None;
            }
        };
        path.push(first_name);
        let mut end_span = self.current_token.span.clone();
        self.advance(); // consume identifier

        while self.current_token.kind == TokenKind::Dot {
            self.advance(); // consume '.'
            
            let next_name = match &self.current_token.kind {
                TokenKind::Identifier(name) => name.clone(),
                _ => {
                    self.report_error(&self.current_token.span.clone(), "Expected identifier after '.' in import path");
                    return None;
                }
            };
            path.push(next_name);
            end_span = self.current_token.span.clone();
            self.advance(); // consume identifier
        }

        let span = start_span.merge(&end_span);
        Some(Spanned::new(ImportDirective { path }, span))
    }

    fn parse_declaration(&mut self) -> Option<Spanned<Declaration>> {
        if let TokenKind::Error(ref msg) = self.current_token.kind {
            let msg = msg.clone();
            self.report_error(&self.current_token.span.clone(), &msg);
            self.synchronize();
            return None;
        }

        let start_span = self.current_token.span.clone();
        
        let decl = match self.current_token.kind {
            TokenKind::Data => Declaration::Data(self.parse_data_decl()?),
            TokenKind::Choice => Declaration::Choice(self.parse_choice_decl()?),
            TokenKind::Fn => Declaration::Fn(self.parse_fn_decl()?),
            TokenKind::Extern => Declaration::Extern(self.parse_extern_decl()?),
            TokenKind::Let | TokenKind::Mut => Declaration::Var(self.parse_var_decl()?),
            _ => {
                self.report_error(&start_span, "Expected declaration (data, choice, fn, extern, let, mut)");
                return None;
            }
        };

        Some(Spanned::new(decl, start_span))
    }


    fn parse_generic_params(&mut self) -> Option<Vec<String>> {
        let mut params = Vec::new();
        if self.current_token.kind == TokenKind::LParen {
            self.advance(); // consume '('
            if self.current_token.kind != TokenKind::RParen {
                let name = match &self.current_token.kind {
                    TokenKind::Identifier(name) => name.clone(),
                    _ => {
                        self.report_error(&self.current_token.span.clone(), "Expected identifier for generic parameter");
                        return None;
                    }
                };
                params.push(name);
                self.advance();
                
                while self.current_token.kind == TokenKind::Comma {
                    self.advance(); // consume ','
                    let next_name = match &self.current_token.kind {
                        TokenKind::Identifier(name) => name.clone(),
                        _ => {
                            self.report_error(&self.current_token.span.clone(), "Expected identifier for generic parameter");
                            return None;
                        }
                    };
                    params.push(next_name);
                    self.advance();
                }
            }
            self.consume(TokenKind::RParen, "Expected ')' after generic parameters")?;
        }
        Some(params)
    }

    fn parse_choice_decl(&mut self) -> Option<ChoiceDecl> {
        self.consume(TokenKind::Choice, "Expected 'choice'")?;
        
        let name = match &self.current_token.kind {
            TokenKind::Identifier(name) => name.clone(),
            _ => {
                self.report_error(&self.current_token.span.clone(), "Expected identifier for choice name");
                return None;
            }
        };
        self.advance(); // consume identifier

        let generic_params = self.parse_generic_params()?;

        self.consume(TokenKind::LBrace, "Expected '{' before choice body")?;

        let mut variants = Vec::new();
        while self.current_token.kind != TokenKind::RBrace && self.current_token.kind != TokenKind::Eof {
            let variant_name = match &self.current_token.kind {
                TokenKind::Identifier(name) => name.clone(),
                TokenKind::NoneLiteral => "None".to_string(),
                _ => {
                    self.report_error(&self.current_token.span.clone(), "Expected identifier for variant name");
                    return None;
                }
            };
            self.advance();

            let mut associated_types = Vec::new();
            if self.current_token.kind == TokenKind::LParen {
                self.advance(); // consume '('
                if self.current_token.kind != TokenKind::RParen {
                    associated_types.push(self.parse_type()?);
                    while self.current_token.kind == TokenKind::Comma {
                        self.advance(); // consume ','
                        if self.current_token.kind != TokenKind::RParen {
                            associated_types.push(self.parse_type()?);
                        }
                    }
                }
                self.consume(TokenKind::RParen, "Expected ')' after associated types")?;
            }

            variants.push(VariantDecl { name: variant_name, associated_types });

            // Optional comma between variants
            if self.current_token.kind == TokenKind::Comma {
                self.advance();
            }
        }

        self.consume(TokenKind::RBrace, "Expected '}' after choice body")?;

        Some(ChoiceDecl { name, generic_params, variants })
    }

    fn parse_data_decl(&mut self) -> Option<DataDecl> {
        self.consume(TokenKind::Data, "Expected 'data'")?;
        
        let name = match &self.current_token.kind {
            TokenKind::Identifier(name) => name.clone(),
            _ => {
                self.report_error(&self.current_token.span.clone(), "Expected identifier for data structure name");
                return None;
            }
        };
        self.advance(); // consume identifier

        let generic_params = self.parse_generic_params()?;

        self.consume(TokenKind::LBrace, "Expected '{' before data body")?;

        let mut fields = Vec::new();
        while self.current_token.kind != TokenKind::RBrace && self.current_token.kind != TokenKind::Eof {
            fields.push(self.parse_field_decl()?);
        }

        self.consume(TokenKind::RBrace, "Expected '}' after data body")?;

        Some(DataDecl { name, generic_params, fields })
    }

    fn parse_field_decl(&mut self) -> Option<FieldDecl> {
        let name = match &self.current_token.kind {
            TokenKind::Identifier(name) => name.clone(),
            _ => {
                self.report_error(&self.current_token.span.clone(), "Expected identifier for field name");
                return None;
            }
        };
        self.advance();

        self.consume(TokenKind::Colon, "Expected ':' after field name")?;
        let ty = self.parse_type()?;

        Some(FieldDecl { name, ty })
    }

    fn parse_fn_decl(&mut self) -> Option<FnDecl> {
        self.consume(TokenKind::Fn, "Expected 'fn'")?;

        let name = match &self.current_token.kind {
            TokenKind::Identifier(name) => name.clone(),
            _ => {
                self.report_error(&self.current_token.span.clone(), "Expected identifier for function name");
                return None;
            }
        };
        self.advance();

        let mut generic_params = Vec::new();
        if self.current_token.kind == TokenKind::LParen {
            let mut lookahead = self.clone();
            lookahead.is_lookahead = true;
            lookahead.errors.clear(); // Don't care about lookahead errors
            let _ = lookahead.parse_generic_params();
            if lookahead.current_token.kind == TokenKind::LParen {
                if let Some(params) = self.parse_generic_params() {
                    generic_params = params;
                }
            }
        }

        self.consume(TokenKind::LParen, "Expected '(' after function name")?;

        let mut params = Vec::new();
        if self.current_token.kind != TokenKind::RParen {
            params.push(self.parse_param()?);
            while self.current_token.kind == TokenKind::Comma {
                self.advance(); // consume ','
                params.push(self.parse_param()?);
            }
        }
        self.consume(TokenKind::RParen, "Expected ')' after parameters")?;

        let mut return_type = None;
        if self.current_token.kind == TokenKind::Arrow {
            self.advance(); // consume '->'
            return_type = Some(self.parse_type()?);
        }

        let body = self.parse_block()?;

        Some(FnDecl {
            name,
            generic_params,
            params,
            return_type,
            body,
        })
    }

    fn parse_extern_decl(&mut self) -> Option<ExternDecl> {
        self.consume(TokenKind::Extern, "Expected 'extern'")?;
        self.consume(TokenKind::Fn, "Expected 'fn' after 'extern'")?;

        let name = match &self.current_token.kind {
            TokenKind::Identifier(name) => name.clone(),
            _ => {
                self.report_error(&self.current_token.span.clone(), "Expected identifier for external function name");
                return None;
            }
        };
        self.advance();

        let mut generic_params = Vec::new();
        if self.current_token.kind == TokenKind::LParen {
            let mut lookahead = self.clone();
            lookahead.is_lookahead = true;
            lookahead.errors.clear();
            let _ = lookahead.parse_generic_params();
            if lookahead.current_token.kind == TokenKind::LParen {
                if let Some(params) = self.parse_generic_params() {
                    generic_params = params;
                }
            }
        }

        self.consume(TokenKind::LParen, "Expected '(' after function name")?;

        let mut params = Vec::new();
        if self.current_token.kind != TokenKind::RParen {
            params.push(self.parse_param()?);
            while self.current_token.kind == TokenKind::Comma {
                self.advance(); // consume ','
                params.push(self.parse_param()?);
            }
        }
        self.consume(TokenKind::RParen, "Expected ')' after parameters")?;

        let mut return_type = None;
        if self.current_token.kind == TokenKind::Arrow {
            self.advance(); // consume '->'
            return_type = Some(self.parse_type()?);
        }

        Some(ExternDecl {
            name,
            generic_params,
            params,
            return_type,
        })
    }

    fn parse_param(&mut self) -> Option<Param> {
        let mut is_mut = false;
        if self.current_token.kind == TokenKind::Mut {
            is_mut = true;
            self.advance();
        }

        let name = match &self.current_token.kind {
            TokenKind::Identifier(name) => name.clone(),
            _ => {
                self.report_error(&self.current_token.span.clone(), "Expected identifier for parameter name");
                return None;
            }
        };
        self.advance();

        self.consume(TokenKind::Colon, "Expected ':' after parameter name")?;
        let ty = self.parse_type()?;

        Some(Param { is_mut, name, ty })
    }

    fn parse_type(&mut self) -> Option<Spanned<Type>> {
        let start_span = self.current_token.span.clone();
        let mut end_span = start_span.clone();

        let mut is_nullable = false;
        if self.current_token.kind == TokenKind::Question {
            is_nullable = true;
            self.advance();
            end_span = self.current_token.span.clone();
        }

        let mut is_ptr = false;
        if self.current_token.kind == TokenKind::Caret {
            is_ptr = true;
            self.advance();
            end_span = self.current_token.span.clone(); // in case it fails next
        }

        let name = match &self.current_token.kind {
            TokenKind::Identifier(name) => name.clone(),
            _ => {
                self.report_error(&self.current_token.span.clone(), "Expected identifier for type name");
                return None;
            }
        };
        self.advance();
        end_span = self.current_token.span.clone();

        let mut generic_args = Vec::new();
        if self.current_token.kind == TokenKind::LParen {
            self.advance(); // consume '('
            if self.current_token.kind != TokenKind::RParen {
                generic_args.push(self.parse_type()?);
                while self.current_token.kind == TokenKind::Comma {
                    self.advance(); // consume ','
                    if self.current_token.kind != TokenKind::RParen {
                        generic_args.push(self.parse_type()?);
                    }
                }
            }
            end_span = self.current_token.span.clone();
            self.consume(TokenKind::RParen, "Expected ')' after generic arguments")?;
        }

        let mut is_array = false;
        let mut array_size = None;
        if self.current_token.kind == TokenKind::LBracket {
            is_array = true;
            self.advance(); // consume '['
            if let TokenKind::Integer(size) = self.current_token.kind {
                array_size = Some(size);
                self.advance(); // consume integer
            }
            end_span = self.current_token.span.clone();
            self.consume(TokenKind::RBracket, "Expected ']' after array size")?;
        }

        let span = start_span.merge(&end_span);
        Some(Spanned::new(Type { name, generic_args, is_array, array_size, is_ptr, is_nullable }, span))
    }

    fn parse_block(&mut self) -> Option<Spanned<Block>> {
        let start_span = self.current_token.span.clone();
        self.consume(TokenKind::LBrace, "Expected '{' to start block")?;
        
        let mut statements = Vec::new();
        while self.current_token.kind != TokenKind::RBrace && self.current_token.kind != TokenKind::Eof {
            if let Some(stmt) = self.parse_statement() {
                statements.push(stmt);
            } else {
                self.synchronize();
            }
        }

        let end_span = self.current_token.span.clone();
        self.consume(TokenKind::RBrace, "Expected '}' to end block")?;

        let span = start_span.merge(&end_span);
        Some(Spanned::new(Block { statements }, span))
    }

    fn parse_statement(&mut self) -> Option<Spanned<Statement>> {
        if let TokenKind::Error(ref msg) = self.current_token.kind {
            let msg = msg.clone();
            self.report_error(&self.current_token.span.clone(), &msg);
            self.synchronize();
            return None;
        }

        let start_span = self.current_token.span.clone();
        
        let stmt = match self.current_token.kind {
            TokenKind::Let | TokenKind::Mut => Statement::Var(self.parse_var_decl()?),
            TokenKind::If => Statement::If(self.parse_if_stmt()?),
            TokenKind::While => Statement::While(self.parse_while_stmt()?),
            TokenKind::Return => Statement::Return(self.parse_return_stmt()?),
            TokenKind::Break => {
                self.advance();
                Statement::Break
            },
            TokenKind::Continue => {
                self.advance();
                Statement::Continue
            },
            TokenKind::Free => Statement::Free(self.parse_free_stmt()?),
            _ => {
                let expr = self.parse_expression()?;
                
                let is_assign = match self.current_token.kind {
                    TokenKind::Assign | TokenKind::AddAssign | TokenKind::SubAssign |
                    TokenKind::MulAssign | TokenKind::DivAssign => true,
                    _ => false,
                };

                if is_assign {
                    let op = match self.current_token.kind {
                        TokenKind::Assign => AssignOp::Assign,
                        TokenKind::AddAssign => AssignOp::AddAssign,
                        TokenKind::SubAssign => AssignOp::SubAssign,
                        TokenKind::MulAssign => AssignOp::MulAssign,
                        TokenKind::DivAssign => AssignOp::DivAssign,
                        _ => unreachable!(),
                    };
                    self.advance(); // consume operator
                    let value = self.parse_expression()?;
                    Statement::Assignment(Assignment { target: expr, op, value })
                } else {
                    Statement::Expr(expr)
                }
            }
        };

        Some(Spanned::new(stmt, start_span))
    }

    fn parse_var_decl(&mut self) -> Option<VarDecl> {
        let is_mut = match self.current_token.kind {
            TokenKind::Let => false,
            TokenKind::Mut => true,
            _ => {
                self.report_error(&self.current_token.span.clone(), "Expected 'let' or 'mut'");
                return None;
            }
        };
        self.advance();

        let name = match &self.current_token.kind {
            TokenKind::Identifier(name) => name.clone(),
            _ => {
                self.report_error(&self.current_token.span.clone(), "Expected identifier for variable name");
                return None;
            }
        };
        self.advance();

        let mut ty = None;
        if self.current_token.kind == TokenKind::Colon {
            self.advance(); // consume ':'
            ty = Some(self.parse_type()?);
        }

        self.consume(TokenKind::Assign, "Expected '=' in variable declaration")?;
        
        let initializer = self.parse_expression()?;

        Some(VarDecl {
            is_mut,
            name,
            ty,
            initializer,
        })
    }

    fn parse_if_stmt(&mut self) -> Option<IfStmt> {
        self.consume(TokenKind::If, "Expected 'if'")?;
        let condition = self.parse_expression()?;
        let then_block = self.parse_block()?;
        
        let mut else_branch = None;
        if self.current_token.kind == TokenKind::Else {
            let start_span = self.current_token.span.clone();
            self.advance(); // consume 'else'
            if self.current_token.kind == TokenKind::If {
                else_branch = Some(Box::new(Spanned::new(ElseBranch::If(self.parse_if_stmt()?), start_span)));
            } else {
                else_branch = Some(Box::new(Spanned::new(ElseBranch::Block(self.parse_block()?.node), start_span)));
            }
        }

        Some(IfStmt {
            condition,
            then_block,
            else_branch,
        })
    }

    fn parse_while_stmt(&mut self) -> Option<WhileStmt> {
        self.consume(TokenKind::While, "Expected 'while'")?;
        let condition = self.parse_expression()?;
        let block = self.parse_block()?;

        Some(WhileStmt { condition, block })
    }

    fn parse_return_stmt(&mut self) -> Option<ReturnStmt> {
        self.consume(TokenKind::Return, "Expected 'return'")?;
        
        let value = match self.current_token.kind {
            TokenKind::RBrace | TokenKind::Eof => None,
            _ => Some(self.parse_expression()?),
        };

        Some(ReturnStmt { value })
    }

    fn parse_free_stmt(&mut self) -> Option<Spanned<Expression>> {
        self.consume(TokenKind::Free, "Expected 'free'")?;
        self.parse_expression()
    }

    // Expressions parsing follows precedence levels

    fn parse_expression(&mut self) -> Option<Spanned<Expression>> {
        self.parse_pipe_expr()
    }

    fn parse_pipe_expr(&mut self) -> Option<Spanned<Expression>> {
        let mut left = self.parse_logical_expr()?;

        while self.current_token.kind == TokenKind::Pipe {
            self.advance();
            let right = self.parse_logical_expr()?;
            let span = left.span.merge(&right.span);
            left = Spanned::new(Expression::Binary(Box::new(BinaryExpr {
                left,
                op: BinaryOp::Pipe,
                right,
            })), span);
        }

        Some(left)
    }

    fn parse_logical_expr(&mut self) -> Option<Spanned<Expression>> {
        let mut left = self.parse_bitwise_or_expr()?;

        while self.current_token.kind == TokenKind::And || self.current_token.kind == TokenKind::Or {
            let op = match self.current_token.kind {
                TokenKind::And => BinaryOp::And,
                TokenKind::Or => BinaryOp::Or,
                _ => unreachable!(),
            };
            self.advance();
            let right = self.parse_bitwise_or_expr()?;
            let span = left.span.merge(&right.span);
            left = Spanned::new(Expression::Binary(Box::new(BinaryExpr {
                left,
                op,
                right,
            })), span);
        }

        Some(left)
    }

    fn parse_bitwise_or_expr(&mut self) -> Option<Spanned<Expression>> {
        let mut left = self.parse_bitwise_xor_expr()?;
        while self.current_token.kind == TokenKind::BitOr {
            self.advance();
            let right = self.parse_bitwise_xor_expr()?;
            let span = left.span.merge(&right.span);
            left = Spanned::new(Expression::Binary(Box::new(BinaryExpr {
                left,
                op: BinaryOp::BitOr,
                right,
            })), span);
        }
        Some(left)
    }

    fn parse_bitwise_xor_expr(&mut self) -> Option<Spanned<Expression>> {
        let mut left = self.parse_bitwise_and_expr()?;
        while self.current_token.kind == TokenKind::BitXor {
            self.advance();
            let right = self.parse_bitwise_and_expr()?;
            let span = left.span.merge(&right.span);
            left = Spanned::new(Expression::Binary(Box::new(BinaryExpr {
                left,
                op: BinaryOp::BitXor,
                right,
            })), span);
        }
        Some(left)
    }

    fn parse_bitwise_and_expr(&mut self) -> Option<Spanned<Expression>> {
        let mut left = self.parse_equality_expr()?;
        while self.current_token.kind == TokenKind::BitAnd {
            self.advance();
            let right = self.parse_equality_expr()?;
            let span = left.span.merge(&right.span);
            left = Spanned::new(Expression::Binary(Box::new(BinaryExpr {
                left,
                op: BinaryOp::BitAnd,
                right,
            })), span);
        }
        Some(left)
    }

    fn parse_equality_expr(&mut self) -> Option<Spanned<Expression>> {
        let mut left = self.parse_relational_expr()?;

        while self.current_token.kind == TokenKind::Eq || self.current_token.kind == TokenKind::NotEq {
            let op = match self.current_token.kind {
                TokenKind::Eq => BinaryOp::Eq,
                TokenKind::NotEq => BinaryOp::NotEq,
                _ => unreachable!(),
            };
            self.advance();
            let right = self.parse_relational_expr()?;
            let span = left.span.merge(&right.span);
            left = Spanned::new(Expression::Binary(Box::new(BinaryExpr {
                left,
                op,
                right,
            })), span);
        }

        Some(left)
    }

    fn parse_relational_expr(&mut self) -> Option<Spanned<Expression>> {
        let mut left = self.parse_shift_expr()?;

        while matches!(self.current_token.kind, TokenKind::Lt | TokenKind::LtEq | TokenKind::Gt | TokenKind::GtEq) {
            let op = match self.current_token.kind {
                TokenKind::Lt => BinaryOp::Lt,
                TokenKind::LtEq => BinaryOp::LtEq,
                TokenKind::Gt => BinaryOp::Gt,
                TokenKind::GtEq => BinaryOp::GtEq,
                _ => unreachable!(),
            };
            self.advance();
            let right = self.parse_shift_expr()?;
            let span = left.span.merge(&right.span);
            left = Spanned::new(Expression::Binary(Box::new(BinaryExpr {
                left,
                op,
                right,
            })), span);
        }

        Some(left)
    }

    fn parse_shift_expr(&mut self) -> Option<Spanned<Expression>> {
        let mut left = self.parse_additive_expr()?;
        while self.current_token.kind == TokenKind::Shl || self.current_token.kind == TokenKind::Shr {
            let op = match self.current_token.kind {
                TokenKind::Shl => BinaryOp::Shl,
                TokenKind::Shr => BinaryOp::Shr,
                _ => unreachable!(),
            };
            self.advance();
            let right = self.parse_additive_expr()?;
            let span = left.span.merge(&right.span);
            left = Spanned::new(Expression::Binary(Box::new(BinaryExpr {
                left,
                op,
                right,
            })), span);
        }
        Some(left)
    }

    fn parse_additive_expr(&mut self) -> Option<Spanned<Expression>> {
        let mut left = self.parse_multiplicative_expr()?;

        while self.current_token.kind == TokenKind::Add || self.current_token.kind == TokenKind::Sub {
            let op = match self.current_token.kind {
                TokenKind::Add => BinaryOp::Add,
                TokenKind::Sub => BinaryOp::Sub,
                _ => unreachable!(),
            };
            self.advance();
            let right = self.parse_multiplicative_expr()?;
            let span = left.span.merge(&right.span);
            left = Spanned::new(Expression::Binary(Box::new(BinaryExpr {
                left,
                op,
                right,
            })), span);
        }

        Some(left)
    }

    fn parse_multiplicative_expr(&mut self) -> Option<Spanned<Expression>> {
        let mut left = self.parse_unary_expr()?;

        while self.current_token.kind == TokenKind::Mul || self.current_token.kind == TokenKind::Div || self.current_token.kind == TokenKind::Mod {
            let op = match self.current_token.kind {
                TokenKind::Mul => BinaryOp::Mul,
                TokenKind::Div => BinaryOp::Div,
                TokenKind::Mod => BinaryOp::Mod,
                _ => unreachable!(),
            };
            self.advance();
            let right = self.parse_unary_expr()?;
            let span = left.span.merge(&right.span);
            left = Spanned::new(Expression::Binary(Box::new(BinaryExpr {
                left,
                op,
                right,
            })), span);
        }

        Some(left)
    }

    fn parse_unary_expr(&mut self) -> Option<Spanned<Expression>> {
        if self.current_token.kind == TokenKind::Sub || self.current_token.kind == TokenKind::Not {
            let start_span = self.current_token.span.clone();
            let op = match self.current_token.kind {
                TokenKind::Sub => UnaryOp::Negate,
                TokenKind::Not => UnaryOp::Not,
                _ => unreachable!(),
            };
            self.advance();
            let operand = self.parse_unary_expr()?; // allow nested unary ops
            let span = start_span.merge(&operand.span);
            return Some(Spanned::new(Expression::Unary(Box::new(UnaryExpr {
                op,
                operand,
            })), span));
        }

        self.parse_cast_expr()
    }

    fn parse_cast_expr(&mut self) -> Option<Spanned<Expression>> {
        let mut left = self.parse_postfix_expr()?;

        while self.current_token.kind == TokenKind::As {
            self.advance();
            if let Some(target_type) = self.parse_type() {
                let span = left.span.merge(&target_type.span);
                left = Spanned::new(Expression::Cast(Box::new(CastExpr {
                    expr: left,
                    target_type,
                })), span);
            } else {
                self.report_error(&self.current_token.span.clone(), "Expected a valid type after 'as'");
                return None;
            }
        }
        
        Some(left)
    }

    fn parse_postfix_expr(&mut self) -> Option<Spanned<Expression>> {
        let mut expr = self.parse_primary_expr()?;

        loop {
            match self.current_token.kind {
                TokenKind::Dot => {
                    self.advance(); // consume '.'
                    let prop = match &self.current_token.kind {
                        TokenKind::Identifier(name) => name.clone(),
                        TokenKind::NoneLiteral => "None".to_string(),
                        _ => {
                            self.report_error(&self.current_token.span.clone(), "Expected identifier after '.'");
                            return None;
                        }
                    };
                    let prop_span = self.current_token.span.clone();
                    self.advance();

                    if self.current_token.kind == TokenKind::LParen {
                        // Method invocation pattern recognized
                        self.advance(); // consume '('
                        let mut arguments = Vec::new();
                        if self.current_token.kind != TokenKind::RParen {
                            arguments.push(self.parse_expression()?);
                            while self.current_token.kind == TokenKind::Comma {
                                self.advance();
                                arguments.push(self.parse_expression()?);
                            }
                        }
                        let end_span = self.current_token.span.clone();
                        self.consume(TokenKind::RParen, "Expected ')' after method arguments")?;
                        
                        let span = expr.span.merge(&end_span);
                        let callee = Spanned::new(Expression::Property(Box::new(PropertyAccess {
                            object: expr,
                            property: prop,
                        })), prop_span);
                        
                        expr = Spanned::new(Expression::Call(Box::new(FunctionCall {
                            callee: Box::new(callee),
                            arguments,
                        })), span);
                    } else {
                        let span = expr.span.merge(&prop_span);
                        expr = Spanned::new(Expression::Property(Box::new(PropertyAccess {
                            object: expr,
                            property: prop,
                        })), span);
                    }
                }
                TokenKind::LParen => {
                    self.advance(); // consume '('
                    let mut arguments = Vec::new();
                    if self.current_token.kind != TokenKind::RParen {
                        arguments.push(self.parse_expression()?);
                        while self.current_token.kind == TokenKind::Comma {
                            self.advance();
                            arguments.push(self.parse_expression()?);
                        }
                    }
                    let end_span = self.current_token.span.clone();
                    self.consume(TokenKind::RParen, "Expected ')' after function arguments")?;
                    
                    let span = expr.span.merge(&end_span);
                    expr = Spanned::new(Expression::Call(Box::new(FunctionCall {
                        callee: Box::new(expr),
                        arguments,
                    })), span);
                }
                TokenKind::Caret => {
                    self.advance();
                    let end_span = expr.span.clone(); // Can be improved
                    let span = expr.span.merge(&end_span);
                    expr = Spanned::new(Expression::Deref(Box::new(expr)), span);
                }
                TokenKind::LBracket => {
                    self.advance(); // consume '['
                    let mut start = None;
                    let mut end = None;
                    let mut is_slice = false;
                    
                    if self.current_token.kind != TokenKind::RBracket {
                        if self.current_token.kind == TokenKind::DotDot {
                            is_slice = true;
                            self.advance(); // consume '..'
                            if self.current_token.kind != TokenKind::RBracket {
                                end = Some(self.parse_expression()?);
                            }
                        } else {
                            let first_expr = self.parse_expression()?;
                            if self.current_token.kind == TokenKind::DotDot {
                                is_slice = true;
                                start = Some(first_expr);
                                self.advance(); // consume '..'
                                if self.current_token.kind != TokenKind::RBracket {
                                    end = Some(self.parse_expression()?);
                                }
                            } else if self.current_token.kind != TokenKind::RBracket {
                                self.report_error(&self.current_token.span.clone(), "Expected '..' for slice or ']' for index");
                                return None;
                            } else {
                                // It is an IndexExpr
                                let end_span = self.current_token.span.clone();
                                self.consume(TokenKind::RBracket, "Expected ']' after slice/index")?;
                                let span = expr.span.merge(&end_span);
                                expr = Spanned::new(Expression::Index(Box::new(IndexExpr {
                                    target: expr,
                                    index: first_expr,
                                })), span);
                                continue;
                            }
                        }
                    } else {
                        is_slice = true;
                    }
                    
                    let end_span = self.current_token.span.clone();
                    self.consume(TokenKind::RBracket, "Expected ']' after slice/index")?;
                    let span = expr.span.merge(&end_span);
                    
                    if is_slice {
                        expr = Spanned::new(Expression::VectorSlice(Box::new(VectorSliceExpr {
                            target: expr,
                            start,
                            end,
                        })), span);
                    }
                }
                _ => break,
            }
        }

        Some(expr)
    }


    fn parse_when_expr(&mut self) -> Option<WhenExpr> {
        self.consume(TokenKind::When, "Expected 'when'")?;
        
        let target = self.parse_expression()?;
        
        self.consume(TokenKind::LBrace, "Expected '{' before when cases")?;
        
        let mut cases = Vec::new();
        while self.current_token.kind != TokenKind::RBrace && self.current_token.kind != TokenKind::Eof {
            let variant_name = match &self.current_token.kind {
                TokenKind::Identifier(name) => name.clone(),
                TokenKind::NoneLiteral => "None".to_string(),
                _ => {
                    self.report_error(&self.current_token.span.clone(), "Expected variant name in when case");
                    return None;
                }
            };
            self.advance(); // consume variant name

            let mut bindings = Vec::new();
            if self.current_token.kind == TokenKind::LParen {
                self.advance(); // consume '('
                if self.current_token.kind != TokenKind::RParen {
                    let binding_name = match &self.current_token.kind {
                        TokenKind::Identifier(name) => name.clone(),
                        _ => {
                            self.report_error(&self.current_token.span.clone(), "Expected identifier for binding");
                            return None;
                        }
                    };
                    bindings.push(binding_name);
                    self.advance();
                    
                    while self.current_token.kind == TokenKind::Comma {
                        self.advance(); // consume ','
                        if self.current_token.kind != TokenKind::RParen {
                            let binding_name = match &self.current_token.kind {
                                TokenKind::Identifier(name) => name.clone(),
                                _ => {
                                    self.report_error(&self.current_token.span.clone(), "Expected identifier for binding");
                                    return None;
                                }
                            };
                            bindings.push(binding_name);
                            self.advance();
                        }
                    }
                }
                self.consume(TokenKind::RParen, "Expected ')' after bindings")?;
            }

            self.consume(TokenKind::Arrow, "Expected '->' after when case pattern")?;

            let body = self.parse_block()?;

            cases.push(WhenCase {
                variant_name,
                bindings,
                body,
            });
            
            // Optional comma between cases
            if self.current_token.kind == TokenKind::Comma {
                self.advance();
            }
        }
        
        self.consume(TokenKind::RBrace, "Expected '}' after when cases")?;
        
        Some(WhenExpr { target, cases, is_nullable: false })
    }

    fn parse_primary_expr(&mut self) -> Option<Spanned<Expression>> {
        let start_span = self.current_token.span.clone();
        
        let primary = match self.current_token.kind.clone() {
            TokenKind::Identifier(name) => {
                self.advance();
                PrimaryExpr::Identifier(name)
            }
            TokenKind::Integer(val) => {
                self.advance();
                PrimaryExpr::Integer(val)
            }
            TokenKind::Float(val) => {
                self.advance();
                PrimaryExpr::Float(val)
            }
            TokenKind::String(val) => {
                self.advance();
                PrimaryExpr::String(val)
            }
            TokenKind::Char(val) => {
                self.advance();
                PrimaryExpr::Char(val)
            }
            TokenKind::True => {
                self.advance();
                PrimaryExpr::Boolean(true)
            }
            TokenKind::False => {
                self.advance();
                PrimaryExpr::Boolean(false)
            }
            TokenKind::NoneLiteral => {
                self.advance();
                PrimaryExpr::NoneLiteral
            }
            TokenKind::When => {
                let when_expr = self.parse_when_expr()?;
                return Some(Spanned::new(Expression::When(Box::new(when_expr)), start_span));
            }
            TokenKind::Alloc => {
                let mut end_span = start_span.clone();
                self.advance();
                if let Some(ty) = self.parse_type() {
                    let mut arguments = Vec::new();
                    if self.current_token.kind == TokenKind::LParen {
                        self.advance();
                        if self.current_token.kind != TokenKind::RParen {
                            arguments.push(self.parse_expression()?);
                            while self.current_token.kind == TokenKind::Comma {
                                self.advance();
                                arguments.push(self.parse_expression()?);
                            }
                        }
                        end_span = self.current_token.span.clone();
                        self.consume(TokenKind::RParen, "Expected ')' after alloc arguments")?;
                    } else {
                        end_span = ty.span.clone();
                    }
                    let span = start_span.merge(&end_span);
                    return Some(Spanned::new(Expression::Alloc(Box::new(AllocExpr { ty, arguments })), span));
                } else {
                    self.report_error(&start_span, "Expected type after 'alloc'");
                    return None;
                }
            }

            TokenKind::LBracket => {
                self.advance();
                let mut arguments = Vec::new();
                if self.current_token.kind != TokenKind::RBracket {
                    arguments.push(self.parse_expression()?);
                    while self.current_token.kind == TokenKind::Comma {
                        self.advance();
                        arguments.push(self.parse_expression()?);
                    }
                }
                self.consume(TokenKind::RBracket, "Expected ']' after list literal")?;
                PrimaryExpr::ListLiteral(arguments)
            }
            TokenKind::LParen => {
                self.advance();
                let inner = self.parse_expression()?;
                self.consume(TokenKind::RParen, "Expected ')' after grouped expression")?;
                PrimaryExpr::Grouped(Box::new(inner))
            }
            _ => {
                self.report_error(&start_span, "Unexpected token in primary expression");
                return None;
            }
        };

        Some(Spanned::new(Expression::Primary(primary), start_span))
    }
}
