import re

with open('compiler/frontend/parser.nera', 'r') as f:
    content = f.read()

variants = """
        Data -> { if target_str == "Data" { return true } }
        Fn -> { if target_str == "Fn" { return true } }
        Let -> { if target_str == "Let" { return true } }
        Mut -> { if target_str == "Mut" { return true } }
        If -> { if target_str == "If" { return true } }
        Else -> { if target_str == "Else" { return true } }
        While -> { if target_str == "While" { return true } }
        Return -> { if target_str == "Return" { return true } }
        When -> { if target_str == "When" { return true } }
        Break -> { if target_str == "Break" { return true } }
        Continue -> { if target_str == "Continue" { return true } }
        Use -> { if target_str == "Use" { return true } }
        Extern -> { if target_str == "Extern" { return true } }
        True -> { if target_str == "True" { return true } }
        False -> { if target_str == "False" { return true } }
        Choice -> { if target_str == "Choice" { return true } }
        And -> { if target_str == "And" { return true } }
        Or -> { if target_str == "Or" { return true } }
        Not -> { if target_str == "Not" { return true } }
        BitAnd -> { if target_str == "BitAnd" { return true } }
        BitOr -> { if target_str == "BitOr" { return true } }
        BitXor -> { if target_str == "BitXor" { return true } }
        Shl -> { if target_str == "Shl" { return true } }
        Shr -> { if target_str == "Shr" { return true } }
        As -> { if target_str == "As" { return true } }
        Identifier(val) -> { if target_str == "Identifier" { return true } }
        Integer(val) -> { if target_str == "Integer" { return true } }
        Float(val) -> { if target_str == "Float" { return true } }
        StringLiteral(val) -> { if target_str == "StringLiteral" { return true } }
        CharLiteral(val) -> { if target_str == "CharLiteral" { return true } }
        Assign -> { if target_str == "Assign" { return true } }
        AddAssign -> { if target_str == "AddAssign" { return true } }
        SubAssign -> { if target_str == "SubAssign" { return true } }
        MulAssign -> { if target_str == "MulAssign" { return true } }
        DivAssign -> { if target_str == "DivAssign" { return true } }
        Eq -> { if target_str == "Eq" { return true } }
        NotEq -> { if target_str == "NotEq" { return true } }
        Lt -> { if target_str == "Lt" { return true } }
        LtEq -> { if target_str == "LtEq" { return true } }
        Gt -> { if target_str == "Gt" { return true } }
        GtEq -> { if target_str == "GtEq" { return true } }
        Add -> { if target_str == "Add" { return true } }
        Sub -> { if target_str == "Sub" { return true } }
        Mul -> { if target_str == "Mul" { return true } }
        Div -> { if target_str == "Div" { return true } }
        Mod -> { if target_str == "Mod" { return true } }
        Pipe -> { if target_str == "Pipe" { return true } }
        Arrow -> { if target_str == "Arrow" { return true } }
        Caret -> { if target_str == "Caret" { return true } }
        Alloc -> { if target_str == "Alloc" { return true } }
        Free -> { if target_str == "Free" { return true } }
        Question -> { if target_str == "Question" { return true } }
        NoneLiteral -> { if target_str == "NoneLiteral" { return true } }
        LBrace -> { if target_str == "LBrace" { return true } }
        RBrace -> { if target_str == "RBrace" { return true } }
        LBracket -> { if target_str == "LBracket" { return true } }
        RBracket -> { if target_str == "RBracket" { return true } }
        LParen -> { if target_str == "LParen" { return true } }
        RParen -> { if target_str == "RParen" { return true } }
        Colon -> { if target_str == "Colon" { return true } }
        Comma -> { if target_str == "Comma" { return true } }
        Dot -> { if target_str == "Dot" { return true } }
        DotDot -> { if target_str == "DotDot" { return true } }
        Error(val) -> { if target_str == "Error" { return true } }
        Eof -> { if target_str == "Eof" { return true } }"""

ident_variants = ""
for line in variants.split('\n'):
    if not line.strip(): continue
    if "Identifier" in line:
        ident_variants += '        Identifier(name) -> {\n            ident = name\n            matched = true\n        }\n'
    else:
        ident_variants += '        ' + line.split('->')[0].strip() + ' -> { }\n'


content = re.sub(r'fn check_token.*?return false\n}', 
    'fn check_token(kind: TokenKind, target_str: String) -> Boolean {\n    when kind {\n' + variants + '\n    }\n    return false\n}', 
    content, flags=re.DOTALL)

content = re.sub(r'fn consume_ident.*?return ""\n}', 
    'fn consume_ident(mut p: ^Parser, msg: String) -> String {\n    mut ident = ""\n    mut matched = false\n    when p^.current_token^.kind {\n' + ident_variants + '    }\n    if matched {\n        advance_parser(p)\n        return ident\n    }\n    mut span = alloc_span(p^.current_token^.line, p^.current_token^.col, p^.current_token^.line, p^.current_token^.col)\n    report_error(p, span, msg)\n    return ""\n}', 
    content, flags=re.DOTALL)

with open('compiler/frontend/parser.nera', 'w') as f:
    f.write(content)
