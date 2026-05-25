import re

with open('compiler/frontend/parser.nera', 'r') as f:
    text = f.read()

new_code = """fn parse_import_directive(mut p: ^Parser) -> ?^Spanned(ImportDirective) {
    let start_line = p^.current_token^.line
    let start_col = p^.current_token^.col
    
    if not consume(p, "Use", "Expected 'use'") {
        mut ret: ?^Spanned(ImportDirective) = None
        return ret
    }
    
    mut dummy_str = alloc String()
    mut path = new_list(2, dummy_str)
    
    let first_name = consume_ident(p, "Expected identifier in import path")
    if first_name == "" {
        mut ret: ?^Spanned(ImportDirective) = None
        return ret
    }
    list_push(path, first_name)
    
    mut end_line = p^.current_token^.line
    mut end_col = p^.current_token^.col
    
    while check_token(p^.current_token^.kind, "Dot") {
        advance_parser(p)
        let next_name = consume_ident(p, "Expected identifier after '.' in import path")
        if next_name == "" {
            mut ret: ?^Spanned(ImportDirective) = None
            return ret
        }
        list_push(path, next_name)
        end_line = p^.current_token^.line
        end_col = p^.current_token^.col
    }
    
    mut span = alloc_span(start_line, start_col, end_line, end_col)
    mut directive = alloc ImportDirective()
    directive^.path = path
    
    mut ret: ?^Spanned(ImportDirective) = alloc_spanned(ImportDirective)(directive^, span)
    return ret
}

fn parse_program(mut p: ^Parser) -> ^Program {
    mut prog = alloc Program()
    
    mut dummy_import = alloc Spanned(ImportDirective)()
    prog^.imports = new_list(0, dummy_import)
    
    mut dummy_decl = alloc Spanned(Declaration)()
    prog^.declarations = new_list(10, dummy_decl)
    
    while check_token(p^.current_token^.kind, "Use") {
        let import_opt = parse_import_directive(p)
        when import_opt {
            None -> { advance_parser(p) }
            imp -> { list_push(prog^.imports, imp^) }
        }
    }
    
    while not check_token(p^.current_token^.kind, "Eof") {
        let decl_opt = parse_declaration(p)
        when decl_opt {
            None -> { }
            decl -> { list_push(prog^.declarations, decl^) }
        }
        if not check_token(p^.current_token^.kind, "Eof") {
            advance_parser(p) // prevent infinite loop on error
        }
    }
    
    return prog
}"""

old_parse_program = """fn parse_program(mut p: ^Parser) -> ^Program {
    mut prog = alloc Program()
    
    mut dummy_import = alloc Spanned(ImportDirective)()
    prog^.imports = new_list(0, dummy_import)
    
    mut dummy_decl = alloc Spanned(Declaration)()
    prog^.declarations = new_list(10, dummy_decl)
    
    while not check_token(p^.current_token^.kind, "Eof") {
        let decl_opt = parse_declaration(p)
        when decl_opt {
            None -> { }
            decl -> { list_push(prog^.declarations, decl^) }
        }
        if not check_token(p^.current_token^.kind, "Eof") {
            advance_parser(p) // prevent infinite loop on error
        }
    }
    
    return prog
}"""

if old_parse_program in text:
    text = text.replace(old_parse_program, new_code)
else:
    print("Could not find parse_program to replace")

with open('compiler/frontend/parser.nera', 'w') as f:
    f.write(text)
