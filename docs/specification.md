# Nera Language Specification: Core Architecture & Expansion

## 1. Formal Method Desugaring & Memory Layout Specification
### 1.1 Zero-Overhead Method Desugaring
Nera achieves the ergonomics of Object-Oriented Programming (OOP) without compromising the rigid performance guarantees of Data-Oriented Design (DOD) via Compile-Time Method Desugaring.
When the frontend parser encounters a method chain expression, such as `swarm.update(1.5)`, it is initially parsed as a Property access within a FunctionCall. During the Semantic Analysis phase (`sema.rs`), before mid-end IR generation, Nera intercepts this node structure. It dynamically transforms the AST in-place, extracting the object (`swarm`) and injecting it as the implicit first argument of a globally resolved function call: `update(swarm, 1.5)`.

### 1.2 Structure of Arrays (SoA) Arena Layout
To guarantee extreme cache-friendliness, Nera utilizes a deterministic bump-pointer Arena Allocator backing a pure SoA layout.
When an array of structures is declared, e.g., `mut swarm: Particle[1000] = []`, the compiler calculates the stride dynamically. Instead of creating an array of packed Particle structs (AoS), the LLVM backend allocates a single monolithic, contiguous memory block via `malloc` during the `main` entry point. For each field in Particle (e.g., `x: Float`, `y: Float`), a separate, contiguous sub-block of `1000 * sizeof(Float)` bytes is logically partitioned. These column bindings (`%soa_swarm_x`, `%soa_swarm_y`) are mapped directly to native LLVM pointers.

## 2. Module Import System (use) Grammar & Semantics
### 2.1 EBNF Grammar Expansion
The canonical grammar is updated to permit an optional preamble of `ImportDirective` nodes at the root of a `Program`.
```ebnf
Program         ::= ImportDirective* Declaration*
ImportDirective ::= "use" PathIdentifier
PathIdentifier  ::= Identifier ("." Identifier)*
```

### 2.2 Resolution Mechanics and AST Merging
The use directive represents a static file-system mapping mechanism evaluated by the Compiler Driver (main.rs) prior to semantic analysis.

- Path Resolution: A namespace path like use std.math is translated by replacing dot tokens with the host OS directory separator, resolving to the physical file ./std/math.nera.

- AST Stitching: The parser loads and tokenizes the target file, yielding a distinct Program AST. The driver then extracts all Declaration nodes from the module and prepends them into the primary Program's declaration vector.

## 3. Intrinsics Architecture & FFI (C Linkage via LLVM)
### 3.1 Intrinsics Blueprint
The semantic environment pre-registers specific identifiers as global primitives:
- print_int(i: Int) -> Void
- print_float(f: Float) -> Void
- print_str(s: String) -> Void

### 3.2 LLVM IR Generation
During backend generation (llvm_gen.rs), Nera injects global string formatting constants and C-runtime function declarations at the module header:
```llvm
declare i32 @printf(i8*, ...)
@str_fmt_int = private unnamed_addr constant [5 x i8] c"%ld\n\00", align 1
@str_fmt_float = private unnamed_addr constant [4 x i8] c"%f\n\00", align 1
```

When lowering a call, instead of emitting a standard call i64 @print_int(...), Nera forcefully maps the operation to native @printf.

## 4. Bootstrap Specification for std/math.nera
```nera
// Nera Standard Library: Mathematics (std.math)
fn max(a: Int, b: Int) -> Int {
    if a > b { return a }
    return b
}
fn min(a: Int, b: Int) -> Int {
    if a < b { return a }
    return b
}
```
