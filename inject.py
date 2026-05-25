import re

variants = """
        Data -> {} Fn -> {} Let -> {} Mut -> {} If -> {} Else -> {} While -> {} Return -> {} Break -> {} Continue -> {}
        Use -> {} Extern -> {} Choice -> {} And -> {} Or -> {} Not -> {} BitAnd -> {} BitOr -> {} BitXor -> {} Shl -> {} Shr -> {} As -> {}
        Assign -> {} AddAssign -> {} SubAssign -> {} MulAssign -> {} DivAssign -> {} Eq -> {} NotEq -> {} Lt -> {} LtEq -> {} Gt -> {} GtEq -> {}
        Add -> {} Sub -> {} Mul -> {} Div -> {} Mod -> {} Pipe -> {} Arrow -> {} Caret -> {} Question -> {}
        LBrace -> {} RBrace -> {} Colon -> {} Comma -> {} Dot -> {} DotDot -> {} Error(val) -> {} Eof -> {} RParen -> {} RBracket -> {}
"""

content = f"""
fn parse_when_expr(mut p: ^Parser) -> ?^WhenExpr {{
    consume(p, "When", "Expected 'when'")
    
    let target_opt = parse_expression(p)
    mut target: ?^Spanned(Expression) = None
    when target_opt {{
        None -> {{
            mut ret: ?^WhenExpr = None
            return ret
        }}
        t -> {{ target = t }}
    }}
    
    consume(p, "LBrace", "Expected '{{' before when cases")
    
    mut dummy_case = alloc WhenCase()
    mut cases = new_list(4, dummy_case)
    
    while not check_token(p^.current_token^.kind, "RBrace") and not check_token(p^.current_token^.kind, "Eof") {{
        mut variant_name = ""
        if check_token(p^.current_token^.kind, "NoneLiteral") {{
            variant_name = "None"
            advance_parser(p)
        }} else {{
            variant_name = consume_ident(p, "Expected variant name in when case")
            if variant_name == "" {{
                mut ret: ?^WhenExpr = None
                return ret
            }}
        }}
        
        mut dummy_str = alloc String()
        mut bindings = new_list(2, dummy_str)
        
        if check_token(p^.current_token^.kind, "LParen") {{
            advance_parser(p)
            if not check_token(p^.current_token^.kind, "RParen") {{
                let bn = consume_ident(p, "Expected identifier for binding")
                if bn == "" {{
                    mut ret: ?^WhenExpr = None
                    return ret
                }}
                list_push(bindings, bn)
                
                while check_token(p^.current_token^.kind, "Comma") {{
                    advance_parser(p)
                    if not check_token(p^.current_token^.kind, "RParen") {{
                        let bn2 = consume_ident(p, "Expected identifier for binding")
                        if bn2 == "" {{
                            mut ret: ?^WhenExpr = None
                            return ret
                        }}
                        list_push(bindings, bn2)
                    }}
                }}
            }}
            consume(p, "RParen", "Expected ')' after bindings")
        }}
        
        consume(p, "Arrow", "Expected '->' after when case pattern")
        
        let body_opt = parse_block(p)
        when body_opt {{
            None -> {{
                mut ret: ?^WhenExpr = None
                return ret
            }}
            b -> {{
                mut case_decl = alloc WhenCase()
                case_decl^.variant_name = variant_name
                case_decl^.bindings = bindings
                case_decl^.body = b
                list_push(cases, case_decl^)
            }}
        }}
        
        if check_token(p^.current_token^.kind, "Comma") {{
            advance_parser(p)
        }}
    }}
    
    consume(p, "RBrace", "Expected '}}' after when cases")
    
    when target {{
        None -> {{}} // unreachable
        t -> {{
            mut expr = alloc WhenExpr()
            expr^.target = t
            expr^.cases = cases
            expr^.is_nullable = false
            mut ret: ?^WhenExpr = None
            ret = expr
            return ret
        }}
    }}
    mut ret: ?^WhenExpr = None
    return ret
}}

fn parse_primary_expr(mut p: ^Parser) -> ?^Spanned(Expression) {{
    let start_line = p^.current_token^.line
    let start_col = p^.current_token^.col
    
    mut prim_opt: ?PrimaryExpr = None
    
    when p^.current_token^.kind {{
        Identifier(val) -> {{
            advance_parser(p)
            prim_opt = PrimaryExpr.Identifier(val)
        }}
        Integer(val) -> {{
            advance_parser(p)
            prim_opt = PrimaryExpr.Integer(val)
        }}
        Float(val) -> {{
            advance_parser(p)
            prim_opt = PrimaryExpr.Float(val)
        }}
        StringLiteral(val) -> {{
            advance_parser(p)
            prim_opt = PrimaryExpr.String(val)
        }}
        CharLiteral(val) -> {{
            advance_parser(p)
            prim_opt = PrimaryExpr.Char(val)
        }}
        True -> {{
            advance_parser(p)
            prim_opt = PrimaryExpr.Boolean(true)
        }}
        False -> {{
            advance_parser(p)
            prim_opt = PrimaryExpr.Boolean(false)
        }}
        NoneLiteral -> {{
            advance_parser(p)
            prim_opt = PrimaryExpr.NoneLiteral
        }}
        LBracket -> {{
            advance_parser(p)
            mut dummy_expr = alloc Spanned(Expression)()
            mut args = new_list(2, dummy_expr)
            if not check_token(p^.current_token^.kind, "RBracket") {{
                let a_opt = parse_expression(p)
                when a_opt {{
                    None -> {{}}
                    a -> {{ list_push(args, a^) }}
                }}
                while check_token(p^.current_token^.kind, "Comma") {{
                    advance_parser(p)
                    let n_opt = parse_expression(p)
                    when n_opt {{
                        None -> {{}}
                        n -> {{ list_push(args, n^) }}
                    }}
                }}
            }}
            consume(p, "RBracket", "Expected ']' after list literal")
            prim_opt = PrimaryExpr.ListLiteral(args)
        }}
        LParen -> {{
            advance_parser(p)
            let inner_opt = parse_expression(p)
            consume(p, "RParen", "Expected ')' after grouped expression")
            when inner_opt {{
                None -> {{}}
                inner -> {{
                    mut p_ptr = alloc Spanned(Expression)()
                    p_ptr^ = inner^
                    prim_opt = PrimaryExpr.Grouped(p_ptr)
                }}
            }}
        }}
        When -> {{
            let when_opt = parse_when_expr(p)
            when when_opt {{
                None -> {{
                    mut ret: ?^Spanned(Expression) = None
                    return ret
                }}
                w -> {{
                    mut span = alloc_span(start_line, start_col, p^.current_token^.line, p^.current_token^.col)
                    mut expr = alloc Spanned(Expression)()
                    expr^.span = span
                    mut p_ptr = alloc WhenExpr()
                    p_ptr^ = w^
                    expr^.node = Expression.When(p_ptr)
                    mut ret: ?^Spanned(Expression) = None
                    ret = expr
                    return ret
                }}
            }}
        }}
        Alloc -> {{
            mut end_line = start_line
            mut end_col = start_col
            advance_parser(p)
            let ty_opt = parse_type(p)
            when ty_opt {{
                None -> {{
                    mut span = alloc_span(start_line, start_col, p^.current_token^.line, p^.current_token^.col)
                    report_error(p, span, "Expected type after 'alloc'")
                    mut ret: ?^Spanned(Expression) = None
                    return ret
                }}
                ty -> {{
                    mut dummy_expr = alloc Spanned(Expression)()
                    mut args = new_list(0, dummy_expr)
                    
                    if check_token(p^.current_token^.kind, "LParen") {{
                        advance_parser(p)
                        if not check_token(p^.current_token^.kind, "RParen") {{
                            let a_opt = parse_expression(p)
                            when a_opt {{
                                None -> {{}}
                                a -> {{ list_push(args, a^) }}
                            }}
                            while check_token(p^.current_token^.kind, "Comma") {{
                                advance_parser(p)
                                let n_opt = parse_expression(p)
                                when n_opt {{
                                    None -> {{}}
                                    n -> {{ list_push(args, n^) }}
                                }}
                            }}
                        }}
                        end_line = p^.current_token^.line
                        end_col = p^.current_token^.col
                        consume(p, "RParen", "Expected ')' after alloc arguments")
                    }} else {{
                        end_line = ty^.span^.end_line
                        end_col = ty^.span^.end_col
                    }}
                    
                    mut span = alloc_span(start_line, start_col, end_line, end_col)
                    mut alloc_ex = alloc AllocExpr()
                    alloc_ex^.ty = ty
                    alloc_ex^.arguments = args
                    
                    mut expr = alloc Spanned(Expression)()
                    expr^.span = span
                    mut p_ptr = alloc AllocExpr()
                    p_ptr^ = alloc_ex^
                    expr^.node = Expression.Alloc(p_ptr)
                    mut ret: ?^Spanned(Expression) = None
                    ret = expr
                    return ret
                }}
            }}
        }}
        // Dummy cases for exhaustiveness
{variants}
    }}
    
    when prim_opt {{
        None -> {{
            mut span = alloc_span(start_line, start_col, p^.current_token^.line, p^.current_token^.col)
            report_error(p, span, "Unexpected token in primary expression")
            mut ret: ?^Spanned(Expression) = None
            return ret
        }}
        prim -> {{
            mut span = alloc_span(start_line, start_col, p^.current_token^.line, p^.current_token^.col)
            mut expr = alloc Spanned(Expression)()
            expr^.span = span
            mut p_ptr = alloc PrimaryExpr()
            p_ptr^ = prim
            expr^.node = Expression.Primary(p_ptr)
            mut ret: ?^Spanned(Expression) = None
            ret = expr
            return ret
        }}
    }}
}}
"""

with open('compiler/frontend/parser.nera', 'r') as f:
    text = f.read()

# Replace the comment "// We will implement `parse_when_expr` and `parse_primary_expr` directly in `parser.nera` via another append if this works."
text = text.replace("// We will implement `parse_when_expr` and `parse_primary_expr` directly in `parser.nera` via another append if this works.", content)

with open('compiler/frontend/parser.nera', 'w') as f:
    f.write(text)
