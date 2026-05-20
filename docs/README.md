# Nera Programming Language

Nera is a statically-typed, high-performance, data-oriented programming language designed for efficiency, scannability, and extreme cache friendliness. It completely eliminates traditional Object-Oriented Programming (OOP) overhead in favor of a strict separation between data and pure logic, providing C/Rust-level optimization speeds with a clean, low-friction syntax free of line noise.

---

## Core Philosophy

1. **Data-Oriented Design (DOD):** Data structures (`data`) only hold memory layout and state; they possess no behavior. Logic lives exclusively inside pure functions (`fn`).
2. **Invisible Safety:** Type-safety and immutability by default (inspired by Rust), paired with an aggressive type-inference engine to keep source code clean.
3. **Flat Application (Vectorization):** Array iterations and field updates can be applied natively over whole collections (`eixam.x += 1.5`), which the mid-end compiler auto-vectorizes using SIMD instructions.
4. **Zero Line Noise:** Minimal syntactic boilerplate. No mandatory parentheses for conditionals, no mandatory semicolons, and clean visual blocks.

---

## Syntax Overview

### Variables & Type Inference
Variables are immutable by default. Mutability must be explicitly declared using the `mut` keyword.

```nerapos
// Immutable string (inferred)
let standard_message = "Hello, Nera"

// Mutable integer (explicitly typed)
mut system_status: Int = 200
system_status = 404

### Data vs. Logic Separation

```nerapos
// Pure memory layout layout (Structure of Arrays optimization targets)
data Particle {
    x: Float
    y: Float
    velocity: Float
}

// Pure function modifying mutable state
fn move_particle(p: mut Particle) {
    p.x = p.x + p.velocity
    p.y = p.y + p.velocity
}
```

### Flat Application & Pipe Pipelines

```nerapos
fn process_simulation() {
    // Allocation of a flat 10,000 particle buffer
    mut swarm: Particle[10000] = initialize_swarm()

    // 1. Flat Application: Automatically vectorized by the compiler
    swarm.x += 1.5

    // 2. Pipe Operator: Clean sequential data streaming 
    let results = swarm >> filter_active >> compute_metrics
}
```

## CLI Compiler Driver

Nera ships with a unified Command-Line Interface (CLI) capable of compiling into LLVM IR natively, or executing your programs immediately via a "smart cleanup" mechanism that utilizes the system's `clang`.

```bash
nera compile <file.nera>   # Compile Nera source to an optimized LLVM IR (.ll) file
nera run <file.nera>       # Compile and immediately execute (produces native binary)
```

### Formal EBNF Grammar

This is the canonical context-free grammar blueprint for the Front-end Lexer and Parser components.

```ebnf
Program         ::= Declaration*

Declaration     ::= DataDecl | FnDecl | VarDecl

/* --- ESTRUCTURES DE DADES --- */
DataDecl        ::= "data" Identifier "{" FieldDecl* "}"
FieldDecl       ::= Identifier ":" Type

/* --- FUNCIONS --- */
FnDecl          ::= "fn" Identifier "(" ParamList? ")" ("->" Type)? Block
ParamList       ::= Param ("," Param)*
Param           ::= "mut"? Identifier ":" Type

/* --- TIPUS --- */
Type            ::= Identifier ("[" Integer? "]")?

/* --- BLOCS I INSTRUCCIONS --- */
Block           ::= "{" Statement* "}"

Statement       ::= VarDecl 
                  | Assignment 
                  | IfStmt 
                  | WhileStmt
                  | ReturnStmt 
                  | ExprStmt

VarDecl         ::= ("let" | "mut") Identifier (":" Type)? "=" Expression
Assignment      ::= Expression ("=" | "+=" | "-=" | "*=" | "/=") Expression
IfStmt          ::= "if" Expression Block ("else" IfStmt | "else" Block)?
WhileStmt       ::= "while" Expression Block 
ReturnStmt      ::= "return" Expression?
ExprStmt        ::= Expression

/* --- EXPRESSIONS (Ordre de prioritat de menor a major) --- */
Expression      ::= PipeExpr

PipeExpr        ::= LogicalExpr (">>" LogicalExpr)*
LogicalExpr     ::= EqualityExpr (("and" | "or") EqualityExpr)*
EqualityExpr    ::= RelationalExpr (("==" | "!=") RelationalExpr)*
RelationalExpr  ::= AdditiveExpr (("<" | "<=" | ">" | ">=") AdditiveExpr)*
AdditiveExpr    ::= MultiplicativeExpr (("+" | "-") MultiplicativeExpr)*
MultiplicativeExpr ::= PostfixExpr (("*" | "/") PostfixExpr)*

/* Operadors Postfix: resol els mètodes encadenats i propietats en bucle */
PostfixExpr     ::= PrimaryExpr ( "." Identifier | "(" ArgumentList? ")" )*

PrimaryExpr     ::= Identifier 
                  | Literal 
                  | ListLiteral
                  | "(" Expression ")"

ArgumentList    ::= Expression ("," Expression)*

/* --- BASIC ELEMENTS --- */
ListLiteral     ::= "[" ArgumentList? "]"
Identifier      ::= [a-zA-Z_] [a-zA-Z0-9_]*
Literal         ::= Integer | Float | String | Boolean
Integer         ::= [0-9]+
Float           ::= [0-9]+ "." [0-9]+
String          ::= '"' [^"]* '"'
Boolean         ::= "true" | "false"
```


***