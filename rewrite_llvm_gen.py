import re
import sys

def process_file():
    with open('src/backend/llvm_gen.rs', 'r') as f:
        content = f.read()

    # Add import
    if 'use crate::frontend::sema::TypeInfo;' not in content:
        content = content.replace('use std::collections::HashMap;', 'use std::collections::HashMap;\nuse crate::frontend::sema::TypeInfo;')

    # Replace type_env definition
    content = content.replace('pub type_env: HashMap<String, String>,', 'pub type_env: HashMap<String, TypeInfo>,')
    content = content.replace('pub fn generate(&mut self, optimized_ir: &OptimizedIR, type_env: HashMap<String, String>) -> String {', 'pub fn generate(&mut self, optimized_ir: &OptimizedIR, type_env: HashMap<String, TypeInfo>) -> String {')

    # Replace type_to_llvm
    old_type_to_llvm = '''    fn type_to_llvm(&self, nera_ty: &str) -> String {
        let base = if nera_ty.ends_with("[]") {
            nera_ty.strip_suffix("[]").unwrap()
        } else {
            nera_ty
        };
        
        let llvm_base = match base {
            "Int" => "i64",
            "Float" => "double",
            "Boolean" => "i1",
            "String" => "i8*",
            _ => "i64",
        };

        if nera_ty.ends_with("[]") {
            format!("{}*", llvm_base)
        } else {
            llvm_base.to_string()
        }
    }'''

    new_type_to_llvm = '''    fn type_to_llvm(&self, nera_ty: &TypeInfo) -> String {
        match nera_ty {
            TypeInfo::Int => "i64".to_string(),
            TypeInfo::Float => "double".to_string(),
            TypeInfo::Boolean => "i1".to_string(),
            TypeInfo::String => "i8*".to_string(),
            TypeInfo::Array(inner, _) => {
                let inner_llvm = self.type_to_llvm(inner);
                format!("{}*", inner_llvm)
            }
            _ => "i64".to_string(),
        }
    }'''

    content = content.replace(old_type_to_llvm, new_type_to_llvm)

    # Replace usages of type_env.get().map(|s| s.as_str()).unwrap_or("Int")
    content = re.sub(r'\.map\(\|s\| s\.as_str\(\)\)\.unwrap_or\("Int"\)', '.cloned().unwrap_or(TypeInfo::Int)', content)
    content = re.sub(r'\.unwrap_or\("Int"\)', '.cloned().unwrap_or(TypeInfo::Int)', content)

    # Specific replacements
    content = content.replace('if let Some(t) = self.type_env.get(n) {\n                                if t == "Float" { format_str = "@str_fmt_float"; }', 'if let Some(t) = self.type_env.get(n) {\n                                if *t == TypeInfo::Float { format_str = "@str_fmt_float"; }')
    content = content.replace('if self.type_env.get(n).map(|s| s.as_str()) == Some("Boolean") {', 'if self.type_env.get(n) == Some(&TypeInfo::Boolean) {')
    
    with open('src/backend/llvm_gen.rs', 'w') as f:
        f.write(content)

if __name__ == '__main__':
    process_file()
