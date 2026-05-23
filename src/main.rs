use std::env;
use std::fs;
use std::process;

mod error;
mod frontend;
mod midend;
mod backend;

use error::CompileError;
use frontend::lexer::Lexer;
use frontend::parser::Parser;
use frontend::sema::SemanticAnalyzer;
use midend::ir::IRGenerator;
use midend::optimizer::IROptimizer;
use backend::llvm_gen::LLVMGenerator;

fn print_usage() {
    println!("Nera Compiler");
    println!("Usage:");
    println!("  nera compile <file.nera>   Compile to LLVM IR (.ll)");
    println!("  nera run <file.nera>       Compile and execute");
}

fn run_compiler(command: &str, filename: &str, program_args: &[String]) -> Result<(), CompileError> {

    let source = fs::read_to_string(filename)?;

    // Frontend: AST Stitching (Module Imports)
    let mut visited = std::collections::HashSet::new();
    let mut pending = vec![filename.to_string()];
    let mut all_declarations = Vec::new();

    while let Some(current_file) = pending.pop() {
        if !visited.insert(current_file.clone()) {
            continue; // Already processed this file, skip to prevent cyclic loops
        }

        let source = if current_file == filename {
            source.clone()
        } else {
            fs::read_to_string(&current_file)?
        };
        let source_leaked: &'static str = Box::leak(source.into_boxed_str());

        let lexer = Lexer::new(source_leaked);
        let mut parser = Parser::new(source_leaked, lexer);
        let mut program = parser.parse_program();

        if !parser.errors.is_empty() {
            return Err(CompileError::SyntaxError(parser.errors));
        }

        // Queue up nested imports
        for import in &program.imports {
            let path_str = import.node.path.join("/");
            let dep_filename = format!("{}.nera", path_str);
            pending.push(dep_filename);
        }

        all_declarations.append(&mut program.declarations);
    }

    // Create a synthetic master program
    let mut master_program = crate::frontend::ast::Program {
        imports: Vec::new(),
        declarations: all_declarations,
    };


    // Frontend: Semantic Analysis
    let mut analyzer = SemanticAnalyzer::new(&source);
    if analyzer.analyze(&mut master_program).is_err() {
        return Err(CompileError::SemanticError(analyzer.errors));
    }
    let type_env = analyzer.inferred_types.clone();

    // Mid-end: IR Generation
    let mut ir_gen = IRGenerator::new();
    ir_gen.generate(&master_program)?;

    // Mid-end: Optimization
    let optimizer = IROptimizer::new();
    let optimized_ir = optimizer.optimize(ir_gen.functions.clone(), ir_gen.global_instructions.clone())?;

    // Backend: LLVM Code Generation
    let mut llvm_gen = LLVMGenerator::new();
    let llvm_text = llvm_gen.generate(&optimized_ir, type_env)?;

    // Write .ll file
    let base_name = filename.strip_suffix(".nera").unwrap_or(filename);
    let ll_filename = format!("{}.ll", base_name);
    fs::write(&ll_filename, &llvm_text)?;

    if command == "run" {
        let bin_filename = if cfg!(windows) {
            format!("{}.exe", base_name)
        } else {
            base_name.to_string()
        };

        // Verify LLVM IR
        let verify_status = process::Command::new("llc")
            .arg("-verify-machineinstrs")
            .arg(&ll_filename)
            .arg("-o")
            .arg("/dev/null")
            .status();
            
        if let Ok(status) = verify_status {
            if !status.success() {
                let _ = fs::remove_file(&ll_filename);
                return Err(CompileError::BackendError("LLVM IR Verification failed. The generated IR is invalid.".to_string()));
            }
        } else {
            let _ = fs::remove_file(&ll_filename);
            return Err(CompileError::BackendError("Failed to execute llc. Is llvm installed and in your PATH?".to_string()));
        }

        // Invoke clang to compile .ll to binary with full optimization
        let clang_status = process::Command::new("clang")
            .arg("-O3")
            .arg("-march=native")
            .arg("-ffast-math")
            .arg(&ll_filename)
            .arg("src/runtime.c")
            .arg("-o")
            .arg(&bin_filename)
            .status();

        if let Ok(status) = clang_status {
            if !status.success() {
                let _ = fs::remove_file(&ll_filename);
                return Err(CompileError::BackendError("Clang backend compilation failed.".to_string()));
            }
        } else {
            let _ = fs::remove_file(&ll_filename);
            return Err(CompileError::BackendError("Failed to execute clang. Is clang installed and in your PATH?".to_string()));
        }

        // Smart cleanup: delete the intermediate .ll file
        let _ = fs::remove_file(&ll_filename);

        // Execute the binary natively
        let mut cmd = process::Command::new(format!("./{}", bin_filename));
        for arg in program_args {
            cmd.arg(arg);
        }
        let run_status = cmd.status();
            
        match run_status {
            Ok(status) => {
                if !status.success() {
                    return Err(CompileError::BackendError(format!("Program exited with an error status: {}", status)));
                }
            }
            Err(e) => {
                return Err(CompileError::BackendError(format!("Failed to execute the generated binary: {}", e)));
            }
        }
    }
    
    Ok(())
}

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 3 {
        print_usage();
        process::exit(1);
    }

    let command = &args[1];
    let filename = &args[2];

    if command != "compile" && command != "run" {
        eprintln!("Unknown command: {}", command);
        process::exit(1);
    }

    let program_args = if args.len() > 3 {
        &args[3..]
    } else {
        &[]
    };

    match run_compiler(command, filename, program_args) {
        Ok(_) => {
            if command == "compile" {
                println!("Successfully compiled.");
            }
        }
        Err(e) => {
            eprintln!("Compilation failed:\n{}", e);
            std::process::exit(1);
        }
    }
}
