use std::env;
use std::fs;
use std::process;

mod frontend;
mod midend;
mod backend;

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
        print_usage();
        process::exit(1);
    }

    let source = match fs::read_to_string(filename) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("Error reading file {}: {}", filename, e);
            process::exit(1);
        }
    };

    // Frontend: Lexing & Parsing
    let lexer = Lexer::new(&source);
    let mut parser = Parser::new(&source, lexer);
    let mut program = parser.parse_program();

    if !parser.errors.is_empty() {
        eprintln!("\nCompilation aborted due to syntax errors.");
        process::exit(1);
    }

    // Frontend: AST Stitching (Module Imports)
    let mut all_declarations = Vec::new();

    for import in &program.imports {
        let path_str = import.node.path.join("/");
        let dep_filename = format!("{}.nera", path_str);

        let dep_source = match fs::read_to_string(&dep_filename) {
            Ok(s) => s,
            Err(e) => {
                eprintln!("Error reading imported module {}: {}", dep_filename, e);
                process::exit(1);
            }
        };

        // Leak the source to keep span metadata valid conceptually
        let dep_source_leaked: &'static str = Box::leak(dep_source.into_boxed_str());
        let dep_lexer = Lexer::new(dep_source_leaked);
        let mut dep_parser = Parser::new(dep_source_leaked, dep_lexer);
        let mut dep_program = dep_parser.parse_program();

        if !dep_parser.errors.is_empty() {
            eprintln!("\nCompilation aborted due to syntax errors in module {}.", dep_filename);
            process::exit(1);
        }

        // Prevent cyclic dependencies by ignoring nested imports for now
        if !dep_program.imports.is_empty() {
            eprintln!("Warning: Nested imports in {} are not supported in this prototype.", dep_filename);
        }

        all_declarations.append(&mut dep_program.declarations);
    }

    // Append main program declarations last so they can use the dependencies
    all_declarations.append(&mut program.declarations);
    program.declarations = all_declarations;

    // Frontend: Semantic Analysis
    let mut analyzer = SemanticAnalyzer::new(&source);
    if analyzer.analyze(&mut program).is_err() {
        eprintln!("\nCompilation aborted due to semantic errors.");
        process::exit(1);
    }
    let type_env = analyzer.inferred_types.clone();

    // Mid-end: IR Generation
    let mut ir_gen = IRGenerator::new();
    ir_gen.generate(&program);

    // Mid-end: Optimization
    let optimizer = IROptimizer::new();
    let optimized_ir = optimizer.optimize(ir_gen.functions.clone(), ir_gen.global_instructions.clone());

    // Backend: LLVM Code Generation
    let mut llvm_gen = LLVMGenerator::new();
    let llvm_text = llvm_gen.generate(&optimized_ir, type_env);

    // Write .ll file
    let base_name = filename.strip_suffix(".nera").unwrap_or(filename);
    let ll_filename = format!("{}.ll", base_name);
    if let Err(e) = fs::write(&ll_filename, &llvm_text) {
        eprintln!("Error writing LLVM IR: {}", e);
        process::exit(1);
    }

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
            .status()
            .expect("Failed to execute llc. Is llvm installed and in your PATH?");

        if !verify_status.success() {
            eprintln!("LLVM IR Verification failed. The generated IR is invalid.");
            process::exit(1);
        }

        // Invoke clang to compile .ll to binary
        let clang_status = process::Command::new("clang")
            .arg(&ll_filename)
            .arg("-o")
            .arg(&bin_filename)
            .status()
            .expect("Failed to execute clang. Is clang installed and in your PATH?");

        if !clang_status.success() {
            eprintln!("Clang backend compilation failed.");
            process::exit(1);
        }

        // Smart cleanup: delete the intermediate .ll file
        let _ = fs::remove_file(&ll_filename);

        // Execute the binary natively
        let run_status = process::Command::new(format!("./{}", bin_filename)).status();
            
        match run_status {
            Ok(status) => {
                if !status.success() {
                    eprintln!("Program exited with an error status: {}", status);
                }
            }
            Err(e) => {
                eprintln!("Failed to execute the generated binary: {}", e);
            }
        }
    } else {
        println!("Successfully compiled to {}", ll_filename);
    }
}
