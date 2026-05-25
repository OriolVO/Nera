with open('compiler/frontend/parser.nera', 'r') as f:
    text = f.read()

text = text.replace('mut args: ^List(^Spanned(Expression)) = new_list(0, dummy_expr)', 'mut args = new_list(0, dummy_expr)')
text = text.replace('mut args: ^List(^Spanned(Expression)) = new_list(2, dummy_expr)', 'mut args = new_list(2, dummy_expr)')

text = text.replace('a -> { list_push(args, a) }', 'a -> { list_push(args, a^) }')
text = text.replace('n -> { list_push(args, n) }', 'n -> { list_push(args, n^) }')

with open('compiler/frontend/parser.nera', 'w') as f:
    f.write(text)
