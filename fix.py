with open('compiler/frontend/parser.nera', 'r') as f:
    text = f.read()

text = text.replace('PrimaryExpr.String(val)', 'PrimaryExpr.StringLiteral(val)')
text = text.replace('PrimaryExpr.Char(val)', 'PrimaryExpr.CharLiteral(val)')

text = text.replace('mut args = new_list(0, dummy_expr)', 'mut args: ^List(^Spanned(Expression)) = new_list(0, dummy_expr)')
text = text.replace('mut args = new_list(2, dummy_expr)', 'mut args: ^List(^Spanned(Expression)) = new_list(2, dummy_expr)')

text = text.replace('a -> { list_push(args, a^) }', 'a -> { list_push(args, a) }')
text = text.replace('n -> { list_push(args, n^) }', 'n -> { list_push(args, n) }')

text = text.replace('Question -> {}', 'Question -> {} Free -> {}')

with open('compiler/frontend/parser.nera', 'w') as f:
    f.write(text)
