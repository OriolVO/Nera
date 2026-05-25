import re

levels = [
    ("pipe", "logical", [("Pipe", "Pipe")]),
    ("logical", "bitwise_or", [("And", "And"), ("Or", "Or")]),
    ("bitwise_or", "bitwise_xor", [("BitOr", "BitOr")]),
    ("bitwise_xor", "bitwise_and", [("BitXor", "BitXor")]),
    ("bitwise_and", "equality", [("BitAnd", "BitAnd")]),
    ("equality", "relational", [("Eq", "Eq"), ("NotEq", "NotEq")]),
    ("relational", "shift", [("Lt", "Lt"), ("LtEq", "LtEq"), ("Gt", "Gt"), ("GtEq", "GtEq")]),
    ("shift", "additive", [("Shl", "Shl"), ("Shr", "Shr")]),
    ("additive", "multiplicative", [("Add", "Add"), ("Sub", "Sub")]),
    ("multiplicative", "unary", [("Mul", "Mul"), ("Div", "Div"), ("Mod", "Mod")])
]

methods = []

for name, next_level, ops in levels:
    check_cond = " or ".join([f'check_token(p^.current_token^.kind, "{t[0]}")' for t in ops])
    
    op_assigns = []
    for i, t in enumerate(ops):
        if i == 0:
            op_assigns.append(f'                mut op = BinaryOp.{t[1]}')
        else:
            op_assigns.append(f'                if check_token(p^.current_token^.kind, "{t[0]}") {{\n                    op = BinaryOp.{t[1]}\n                }}')
            
    op_code = "\n".join(op_assigns)
    
    method = f"""fn parse_{name}_expr(mut p: ^Parser) -> ?^Spanned(Expression) {{
    mut left_opt = parse_{next_level}_expr(p)
    when left_opt {{
        None -> {{
            mut ret: ?^Spanned(Expression) = None
            return ret
        }}
        l -> {{
            mut left = l
            while {check_cond} {{
{op_code}
                advance_parser(p)
                
                let right_opt = parse_{next_level}_expr(p)
                when right_opt {{
                    None -> {{
                        mut ret: ?^Spanned(Expression) = None
                        return ret
                    }}
                    right -> {{
                        mut span = alloc_span(left^.span^.start_line, left^.span^.start_col, right^.span^.end_line, right^.span^.end_col)
                        
                        mut bin_expr = alloc BinaryExpr()
                        bin_expr^.left = left
                        bin_expr^.op = op
                        bin_expr^.right = right
                        
                        mut expr = alloc Spanned(Expression)()
                        expr^.span = span
                        
                        mut p_ptr = alloc BinaryExpr()
                        p_ptr^ = bin_expr^
                        expr^.node = Expression.Binary(p_ptr)
                        
                        left = expr
                    }}
                }}
            }}
            mut ret: ?^Spanned(Expression) = None
            ret = left
            return ret
        }}
    }}
}}
"""
    methods.append(method)

with open('compiler/frontend/parser.nera', 'r') as f:
    content = f.read()

# Replace the parse_expression stub
# with parse_expression calling parse_pipe_expr, followed by the generated methods.
replacement = f"""fn parse_expression(mut p: ^Parser) -> ?^Spanned(Expression) {{
    return parse_pipe_expr(p)
}}

{"".join(methods)}"""

# First find where the stub starts
start_idx = content.find("fn parse_expression(mut p: ^Parser)")
end_idx = content.find("fn parse_generic_params", start_idx)

new_content = content[:start_idx] + replacement + "\n" + content[end_idx:]

with open('compiler/frontend/parser.nera', 'w') as f:
    f.write(new_content)
