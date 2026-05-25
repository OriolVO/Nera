variants = """
    Data, Fn, Let, Mut,
    If, Else, While, Return, When, Break, Continue,
    Use, Extern, True, False, Choice, And, Or, Not,
    BitAnd, BitOr, BitXor, Shl, Shr, As,
    Identifier(String),
    Integer(Int),
    Float(Float),
    StringLiteral(String),
    CharLiteral(Char),
    Assign, AddAssign, SubAssign, MulAssign, DivAssign,
    Eq, NotEq, Lt, LtEq, Gt, GtEq,
    Add, Sub, Mul, Div, Mod, Pipe, Arrow, Caret,
    Alloc, Free, Question, NoneLiteral,
    LBrace, RBrace, LBracket, RBracket, LParen, RParen,
    Colon, Comma, Dot, DotDot,
    Error(String),
    Eof
"""

import re
v_list = re.findall(r'([A-Za-z]+)(?:\([^\)]+\))?', variants)

print("    when kind {")
for v in v_list:
    if v in ["Identifier", "Error", "StringLiteral"]:
        print(f'        {v}(val) -> {{ if target_str == "{v}" {{ return true }} }}')
    elif v in ["Integer"]:
        print(f'        {v}(val) -> {{ if target_str == "{v}" {{ return true }} }}')
    elif v in ["Float"]:
        print(f'        {v}(val) -> {{ if target_str == "{v}" {{ return true }} }}')
    elif v in ["CharLiteral"]:
        print(f'        {v}(val) -> {{ if target_str == "{v}" {{ return true }} }}')
    else:
        print(f'        {v} -> {{ if target_str == "{v}" {{ return true }} }}')
print("    }")
