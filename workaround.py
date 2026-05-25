with open('compiler/frontend/parser.nera', 'r') as f:
    text = f.read()

# Add the wrappers at the top
wrappers = """
fn new_empty_expr_list() -> ^List(Spanned(Expression)) {
    mut dummy = alloc Spanned(Expression)()
    return new_list(2, dummy)
}

fn push_expr_list(list: ^List(Spanned(Expression)), expr: Spanned(Expression)) -> Void {
    list_push(list, expr)
}
"""

text = text.replace('fn force_instantiate_expr_list() -> ^List(Spanned(Expression)) {\n    mut dummy = alloc Spanned(Expression)()\n    mut list = new_list(0, dummy)\n    mut dummy_expr = alloc Spanned(Expression)()\n    list_push(list, dummy_expr^)\n    return list\n}\n', wrappers)

# Replace instantiations
text = text.replace('mut dummy_expr = alloc Spanned(Expression)()\n                        mut args = new_list(2, dummy_expr)', 'mut args = new_empty_expr_list()')
text = text.replace('mut dummy_expr = alloc Spanned(Expression)()\n                    mut args = new_list(2, dummy_expr)', 'mut args = new_empty_expr_list()')
text = text.replace('mut dummy_expr = alloc Spanned(Expression)()\n            mut args = new_list(2, dummy_expr)', 'mut args = new_empty_expr_list()')

# Handle the one with 0
text = text.replace('mut dummy_expr = alloc Spanned(Expression)()\n                    mut args = new_list(0, dummy_expr)', 'mut args = new_empty_expr_list()')

# Replace list_push
text = text.replace('list_push(args, a^)', 'push_expr_list(args, a^)')
text = text.replace('list_push(args, n^)', 'push_expr_list(args, n^)')
text = text.replace('list_push(args, arg^)', 'push_expr_list(args, arg^)')

with open('compiler/frontend/parser.nera', 'w') as f:
    f.write(text)
