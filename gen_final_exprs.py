content = """
fn parse_unary_expr(mut p: ^Parser) -> ?^Spanned(Expression) {
    if check_token(p^.current_token^.kind, "Sub") or check_token(p^.current_token^.kind, "Not") {
        let start_line = p^.current_token^.line
        let start_col = p^.current_token^.col
        
        mut op = UnaryOp.Negate
        if check_token(p^.current_token^.kind, "Not") {
            op = UnaryOp.Not
        }
        
        advance_parser(p)
        
        let operand_opt = parse_unary_expr(p)
        when operand_opt {
            None -> {
                mut ret: ?^Spanned(Expression) = None
                return ret
            }
            operand -> {
                mut span = alloc_span(start_line, start_col, operand^.span^.end_line, operand^.span^.end_col)
                
                mut un_expr = alloc UnaryExpr()
                un_expr^.op = op
                un_expr^.operand = operand
                
                mut expr = alloc Spanned(Expression)()
                expr^.span = span
                
                mut p_ptr = alloc UnaryExpr()
                p_ptr^ = un_expr^
                expr^.node = Expression.Unary(p_ptr)
                
                mut ret: ?^Spanned(Expression) = None
                ret = expr
                return ret
            }
        }
    }
    return parse_cast_expr(p)
}

fn parse_cast_expr(mut p: ^Parser) -> ?^Spanned(Expression) {
    mut left_opt = parse_postfix_expr(p)
    when left_opt {
        None -> {
            mut ret: ?^Spanned(Expression) = None
            return ret
        }
        l -> {
            mut left = l
            while check_token(p^.current_token^.kind, "As") {
                advance_parser(p)
                let target_opt = parse_type(p)
                when target_opt {
                    None -> {
                        mut span = alloc_span(p^.current_token^.line, p^.current_token^.col, p^.current_token^.line, p^.current_token^.col)
                        report_error(p, span, "Expected a valid type after 'as'")
                        mut ret: ?^Spanned(Expression) = None
                        return ret
                    }
                    target_type -> {
                        mut span = alloc_span(left^.span^.start_line, left^.span^.start_col, target_type^.span^.end_line, target_type^.span^.end_col)
                        
                        mut c_expr = alloc CastExpr()
                        c_expr^.expr = left
                        c_expr^.target_type = target_type
                        
                        mut expr = alloc Spanned(Expression)()
                        expr^.span = span
                        
                        mut p_ptr = alloc CastExpr()
                        p_ptr^ = c_expr^
                        expr^.node = Expression.Cast(p_ptr)
                        
                        left = expr
                    }
                }
            }
            mut ret: ?^Spanned(Expression) = None
            ret = left
            return ret
        }
    }
}

fn parse_postfix_expr(mut p: ^Parser) -> ?^Spanned(Expression) {
    mut left_opt = parse_primary_expr(p)
    when left_opt {
        None -> {
            mut ret: ?^Spanned(Expression) = None
            return ret
        }
        l -> {
            mut left = l
            mut parsing = true
            while parsing {
                if check_token(p^.current_token^.kind, "Dot") {
                    advance_parser(p)
                    
                    mut prop = ""
                    if check_token(p^.current_token^.kind, "NoneLiteral") {
                        prop = "None"
                        advance_parser(p)
                    } else {
                        prop = consume_ident(p, "Expected identifier after '.'")
                        if prop == "" {
                            mut ret: ?^Spanned(Expression) = None
                            return ret
                        }
                    }
                    
                    if check_token(p^.current_token^.kind, "LParen") {
                        advance_parser(p)
                        mut dummy_expr = alloc Spanned(Expression)()
                        mut args = new_list(2, dummy_expr)
                        
                        if not check_token(p^.current_token^.kind, "RParen") {
                            let arg_opt = parse_expression(p)
                            when arg_opt {
                                None -> {}
                                arg -> { list_push(args, arg^) }
                            }
                            while check_token(p^.current_token^.kind, "Comma") {
                                advance_parser(p)
                                let n_opt = parse_expression(p)
                                when n_opt {
                                    None -> {}
                                    n -> { list_push(args, n^) }
                                }
                            }
                        }
                        let end_line = p^.current_token^.line
                        let end_col = p^.current_token^.col
                        consume(p, "RParen", "Expected ')' after method arguments")
                        
                        mut span = alloc_span(left^.span^.start_line, left^.span^.start_col, end_line, end_col)
                        
                        mut prop_access = alloc PropertyAccess()
                        prop_access^.object = left
                        prop_access^.property = prop
                        
                        mut callee_span = alloc_span(left^.span^.start_line, left^.span^.start_col, end_line, end_col)
                        mut callee = alloc Spanned(Expression)()
                        callee^.span = callee_span
                        mut p_ptr_p = alloc PropertyAccess()
                        p_ptr_p^ = prop_access^
                        callee^.node = Expression.Property(p_ptr_p)
                        
                        mut call = alloc FunctionCall()
                        call^.callee = callee
                        call^.arguments = args
                        
                        mut expr = alloc Spanned(Expression)()
                        expr^.span = span
                        mut p_ptr_c = alloc FunctionCall()
                        p_ptr_c^ = call^
                        expr^.node = Expression.Call(p_ptr_c)
                        
                        left = expr
                    } else {
                        mut span = alloc_span(left^.span^.start_line, left^.span^.start_col, p^.current_token^.line, p^.current_token^.col)
                        
                        mut prop_access = alloc PropertyAccess()
                        prop_access^.object = left
                        prop_access^.property = prop
                        
                        mut expr = alloc Spanned(Expression)()
                        expr^.span = span
                        mut p_ptr = alloc PropertyAccess()
                        p_ptr^ = prop_access^
                        expr^.node = Expression.Property(p_ptr)
                        
                        left = expr
                    }
                } else {
                    if check_token(p^.current_token^.kind, "LParen") {
                        advance_parser(p)
                        mut dummy_expr = alloc Spanned(Expression)()
                        mut args = new_list(2, dummy_expr)
                        
                        if not check_token(p^.current_token^.kind, "RParen") {
                            let arg_opt = parse_expression(p)
                            when arg_opt {
                                None -> {}
                                arg -> { list_push(args, arg^) }
                            }
                            while check_token(p^.current_token^.kind, "Comma") {
                                advance_parser(p)
                                let n_opt = parse_expression(p)
                                when n_opt {
                                    None -> {}
                                    n -> { list_push(args, n^) }
                                }
                            }
                        }
                        let end_line = p^.current_token^.line
                        let end_col = p^.current_token^.col
                        consume(p, "RParen", "Expected ')' after function arguments")
                        
                        mut span = alloc_span(left^.span^.start_line, left^.span^.start_col, end_line, end_col)
                        
                        mut call = alloc FunctionCall()
                        call^.callee = left
                        call^.arguments = args
                        
                        mut expr = alloc Spanned(Expression)()
                        expr^.span = span
                        mut p_ptr = alloc FunctionCall()
                        p_ptr^ = call^
                        expr^.node = Expression.Call(p_ptr)
                        
                        left = expr
                    } else {
                        if check_token(p^.current_token^.kind, "Caret") {
                            advance_parser(p)
                            mut span = alloc_span(left^.span^.start_line, left^.span^.start_col, p^.current_token^.line, p^.current_token^.col)
                            
                            mut expr = alloc Spanned(Expression)()
                            expr^.span = span
                            expr^.node = Expression.Deref(left)
                            
                            left = expr
                        } else {
                            if check_token(p^.current_token^.kind, "LBracket") {
                                advance_parser(p)
                                mut start_expr: ?^Spanned(Expression) = None
                                mut end_expr: ?^Spanned(Expression) = None
                                mut is_slice = false
                                
                                if not check_token(p^.current_token^.kind, "RBracket") {
                                    if check_token(p^.current_token^.kind, "DotDot") {
                                        is_slice = true
                                        advance_parser(p)
                                        if not check_token(p^.current_token^.kind, "RBracket") {
                                            end_expr = parse_expression(p)
                                        }
                                    } else {
                                        start_expr = parse_expression(p)
                                        if check_token(p^.current_token^.kind, "DotDot") {
                                            is_slice = true
                                            advance_parser(p)
                                            if not check_token(p^.current_token^.kind, "RBracket") {
                                                end_expr = parse_expression(p)
                                            }
                                        } else {
                                            if not check_token(p^.current_token^.kind, "RBracket") {
                                                mut span_err = alloc_span(p^.current_token^.line, p^.current_token^.col, p^.current_token^.line, p^.current_token^.col)
                                                report_error(p, span_err, "Expected '..' for slice or ']' for index")
                                                mut ret: ?^Spanned(Expression) = None
                                                return ret
                                            } else {
                                                let end_line = p^.current_token^.line
                                                let end_col = p^.current_token^.col
                                                advance_parser(p) // consume RBracket
                                                
                                                mut span = alloc_span(left^.span^.start_line, left^.span^.start_col, end_line, end_col)
                                                
                                                when start_expr {
                                                    None -> {} // unreachable
                                                    idx -> {
                                                        mut idx_expr = alloc IndexExpr()
                                                        idx_expr^.target = left
                                                        idx_expr^.index = idx
                                                        
                                                        mut expr = alloc Spanned(Expression)()
                                                        expr^.span = span
                                                        mut p_ptr = alloc IndexExpr()
                                                        p_ptr^ = idx_expr^
                                                        expr^.node = Expression.Index(p_ptr)
                                                        left = expr
                                                    }
                                                }
                                                // skip to next iteration
                                                parsing = true // keep it true to bypass
                                                // Nera lacks continue!
                                                // Hack: do nothing and the loop continues naturally, but we have to ensure we don't break below.
                                                // We don't break, so it naturally loops
                                            }
                                        }
                                    }
                                } else {
                                    is_slice = true
                                }
                                
                                if is_slice {
                                    let end_line = p^.current_token^.line
                                    let end_col = p^.current_token^.col
                                    consume(p, "RBracket", "Expected ']' after slice/index")
                                    
                                    mut span = alloc_span(left^.span^.start_line, left^.span^.start_col, end_line, end_col)
                                    
                                    mut slice = alloc VectorSliceExpr()
                                    slice^.target = left
                                    slice^.start = start_expr
                                    slice^.end = end_expr
                                    
                                    mut expr = alloc Spanned(Expression)()
                                    expr^.span = span
                                    mut p_ptr = alloc VectorSliceExpr()
                                    p_ptr^ = slice^
                                    expr^.node = Expression.VectorSlice(p_ptr)
                                    left = expr
                                }
                            } else {
                                parsing = false
                            }
                        }
                    }
                }
            }
            mut ret: ?^Spanned(Expression) = None
            ret = left
            return ret
        }
    }
}

// We will implement `parse_when_expr` and `parse_primary_expr` directly in `parser.nera` via another append if this works.
"""

with open('compiler/frontend/parser.nera', 'a') as f:
    f.write("\n" + content)
