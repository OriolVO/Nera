# Nera Language Specification: Core Architecture & Expansion

## 1. Formal Method Desugaring & Memory Layout Specification
### 1.1 Zero-Overhead Method Desugaring
Nera achieves the ergonomics of Object-Oriented Programming (OOP) without compromising the rigid performance guarantees of Data-Oriented Design (DOD) via Compile-Time Method Desugaring.
When the frontend parser encounters a method chain expression, such as `swarm.update(1.5)`, it is initially parsed as a Property access within a FunctionCall. During the Semantic Analysis phase (`sema.rs`), before mid-end IR generation, Nera intercepts this node structure. It dynamically transforms the AST in-place, extracting the object (`swarm`) and injecting it as the implicit first argument of a globally resolved function call: `update(swarm, 1.5)`.

### 1.2 Structure of Arrays (SoA) Arena Layout
To guarantee extreme cache-friendliness, Nera utilizes a deterministic bump-pointer Arena Allocator backing a pure SoA layout.
When an array of structures is declared, e.g., `mut swarm: Particle[1000] = []`, the compiler calculates the stride dynamically. Instead of creating an array of packed Particle structs (AoS), the LLVM backend allocates a single monolithic, contiguous memory block via `malloc` during the `main` entry point. For each field in Particle (e.g., `x: Float`, `y: Float`), a separate, contiguous sub-block of `1000 * sizeof(Float)` bytes is logically partitioned. These column bindings (`%soa_swarm_x`, `%soa_swarm_y`) are mapped directly to native LLVM pointers.

### 1.3 Explicit SIMD Vectorization & Slicing
Nera requires explicit vectorization syntax using array slicing `[]`. Instead of implicitly vectorizing a scalar assignment (e.g., `swarm.x += swarm.vx`), the language enforces `swarm.x[] += swarm.vx[]`. This ensures performance predictability by explicitly informing the programmer that an SIMD vector operation over the Struct-of-Arrays (SoA) layout is occurring. Vector slice operations compile down to highly optimized `!llvm.loop.vectorize` loops.

#### Advanced Slicing and Single-Element Indexing
Developers can utilize partial boundaries to manipulate subsets of data:
- **Bounded Slices:** `[start..end]` iterates exclusively over the defined range.
- **Optional Boundaries:** `[..end]` infers the start index as `0`, and `[start..]` infers the end index as the capacity of the array.
- **Single-Element Indexing:** Scalar indexing uses `[index]` to modify or read a specific element without invoking a vector loop.

**Dynamic Expressions & Semantic Type Checking**: Indices and slice bounds can be dynamic variables (`let` or `mut` expressions). During semantic analysis, Nera statically verifies that all bound expressions evaluate exclusively to an `Int`. If a mismatched type (like a `Float` or `String`) is used as an index, the compiler emits a strict type error. Furthermore, assignments between slices are compile-time validated to ensure both sides operate on exactly matching array block sizes (e.g., `x[..20] = y[..20]`), otherwise a semantic error is thrown.

#### Safety and Bounds Checking
By default, all dynamic and literal indexing is equipped with fail-fast runtime Out-Of-Bounds (OOB) checks. Prior to lowering LLVM IR instructions for array retrieval or mutation, Nera emits `icmp` bounds checks (`0 <= index < capacity`). Any violation dynamically branches to an `unreachable` panic state, preventing memory violations without significantly impairing vectorized speed.
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
### 3.1 Intrinsics Blueprint & Extern Functions
Nera natively supports `extern fn` declarations to bind directly to standard `libc` functions without hardcoding them into the compiler's semantic analyzer. This enables developers to create standard libraries entirely in Nera.
```nera
extern fn fopen(path: String, mode: String) -> ^Void
extern fn fread(ptr: ^Void, size: Int, n: Int, stream: ^Void) -> Int
extern fn malloc(size: Int) -> ^Void
```
Historically, Nera also pre-registered specific identifiers as global primitives:
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
```

## 5. Generics and Collections
### 5.1 Generics Infrastructure
Nera supports robust monomorphization of generic data structures and functions, utilizing a syntax like `List(T)`. During semantic analysis, generic usages are expanded into concrete implementations based on their type parameters (e.g. `List(Int)` or `List(Float)`). This approach allows identical logic to seamlessly integrate into Nera's memory-safe, data-oriented architectural backend without sacrificing Type Safety.
When instantiating generic entities, type annotations are explicitly provided to remove ambiguity, particularly for `extern fn` or `data` structures.

### 5.2 Dynamic Collections: `List(T)`
The core implementation of dynamic arrays in Nera is `List(T)`, which combines a backing buffer pointer alongside state trackers for current `length` and `capacity`.
To work with dynamic collections, developers can leverage functions designed for standard generic interaction:
- `new_list(capacity, dummy_item)`
- `list_push(list, item)`
- `list_get(list, index)`
- `list_free(list)`

Under the hood, `List(T)` allocations natively use standard C memory management (e.g., `malloc` and `free`). Dynamic bounds checking and transparent vector reallocation guarantee safe access. Explicit instantiations resolve `T` sequentially, stripping out any pointer (`^`) or nullable (`?`) wrappers dynamically to align to base scalar types, matching C-API level structs cleanly.
