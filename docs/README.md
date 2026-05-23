# Nera Programming Language

Nera is a statically-typed, high-performance, data-oriented programming language designed for efficiency, scannability, and extreme cache friendliness. It completely eliminates traditional Object-Oriented Programming (OOP) overhead in favor of a strict separation between data and pure logic, providing C/Rust-level optimization speeds with a clean, low-friction syntax free of line noise.

---

## Core Philosophy

1. **Data-Oriented Design (DOD):** Data structures (`data`) only hold memory layout and state; they possess no behavior. Logic lives exclusively inside pure functions (`fn`).
2. **Invisible Safety:** Type-safety and immutability by default (inspired by Rust), paired with an aggressive type-inference engine to keep source code clean.
3. **Flat Application (Vectorization):** Array iterations and field updates can be applied natively over whole collections (`swarm.x += 1.5`), which the mid-end compiler auto-vectorizes using SIMD instructions.
4. **Zero Line Noise:** Minimal syntactic boilerplate. No mandatory parentheses for conditionals, no mandatory semicolons, and clean visual blocks.

---

## Syntax Overview

### Variables & Type Inference
Variables are immutable by default. Mutability must be explicitly declared using the `mut` keyword.

```nera
// Immutable string (inferred)
let standard_message = "Hello, Nera"

// Mutable integer (explicitly typed)
mut system_status: Int = 200
system_status = 404
```

---

### Algebraic Data Types (`choice` & `when`)

Nera supports variant types via the `choice` keyword, matched exhaustively using `when`.
Variants are **instantiated** using `ChoiceName.VariantName(args)` — no separate constructor syntax required.

```nera
choice Shape {
    Circle(Float)      // radius
    Rectangle(Float, Float)  // width, height
    Point
}

fn describe(s: Shape) {
    when s {
        Circle(r)      -> { print(r) }
        Rectangle(w, h) -> { print(w) }
        Point          -> { print(0) }
    }
}

fn main() {
    mut c = Shape.Circle(3.14)
    mut r = Shape.Rectangle(10, 5)
    mut p = Shape.Point

    describe(c)   // prints 3.14
    describe(r)   // prints 10
    describe(p)   // prints 0
}
```

---

### Native Nullables (`?Type`)

Nera has first-class nullable types using the `?` prefix. A nullable variable can hold either `None` or a valid value. Zero-overhead: `None` compiles to a null pointer.

```nera
fn find_value() -> ?Int {
    return None
}

fn main() {
    mut result: ?^Int = None

    // Smart cast: inside the if-block, 'result' is auto-unwrapped to ^Int
    if result != None {
        print(result^)
    }

    // Pattern match with 'when'
    when result {
        None -> { print(0) }
        val  -> { print(val^) }
    }
}
```

---

### Dynamic Memory & Pointers (`alloc` & `^`)

Nera supports explicit heap allocation and pointers via `alloc` and `^` (postfix dereference).

- `^T` — a pointer type to `T`
- `alloc T()` — allocates `T` on the heap, returns `^T`
- `ptr^` — dereference a pointer (postfix `^`)

```nera
data Node {
    value: Int
    next: ^Node
}

fn create_node(v: Int) -> ^Node {
    let node = alloc Node()
    node^.value = v
    return node
}

fn main() {
    let n = create_node(42)
    print(n^.value)   // 42
}
```

---

### Data vs. Logic Separation

```nera
// Pure memory layout (Structure of Arrays optimization target)
data Particle {
    x: Float
    y: Float
    velocity: Float
}

// Pure function operating on data
fn move_particle(p: mut Particle) {
    p.x = p.x + p.velocity
    p.y = p.y + p.velocity
}
```

---

### Flat Application & Pipe Pipelines

```nera
fn process_simulation() {
    // Allocation of a flat 10,000 particle buffer
    mut swarm: Particle[10000] = initialize_swarm()

    // 1. Flat Application: Automatically vectorized by the compiler
    swarm.x[] += 1.5

    // 2. Pipe Operator: Clean sequential data streaming
    let results = swarm >> filter_active >> compute_metrics
}
```

---

## Standard Library `std`

Nera comes with a standard library to interface with the system.

#### `std.io`
- `printf(fmt: String, ...)`: Print formatted text.
- `print_int(value: Int)`: Print an integer.
- `print_float(value: Float)`: Print a float.
- `puts(value: String)`: Print a string with a newline.

#### `std.fs`
- `read_file_to_string(path: String) -> ?String`: Reads an entire file into a dynamically allocated string, returning `None` if the file could not be opened.

---

## CLI Compiler Driver

Nera ships with a unified Command-Line Interface (CLI) capable of compiling into LLVM IR natively, or executing your programs immediately via a "smart cleanup" mechanism that utilizes the system's `clang`.

```bash
nera compile <file.nera>   # Compile Nera source to an optimized LLVM IR (.ll) file
nera run <file.nera>       # Compile and immediately execute (produces native binary)
```

---

## Formal EBNF Grammar

This is the canonical context-free grammar for the Nera front-end Lexer and Parser.

```ebnf
Program         ::= Declaration*

Declaration     ::= DataDecl | ChoiceDecl | FnDecl | VarDecl


/* --- DATA STRUCTURES --- */

DataDecl        ::= "data" Identifier "{" FieldDecl* "}"
FieldDecl       ::= Identifier ":" Type


/* --- ALGEBRAIC DATA TYPES --- */

ChoiceDecl      ::= "choice" Identifier "{" (VariantDecl ","?)* "}"
VariantDecl     ::= Identifier ("(" Type ("," Type)* ")")?


/* --- FUNCTIONS --- */

FnDecl          ::= "fn" Identifier "(" ParamList? ")" ("->" Type)? Block
ParamList       ::= Param ("," Param)*
Param           ::= "mut"? Identifier ":" Type


/* --- TYPES
   ^T     = explicit pointer to T (heap-allocated)
   ?T     = nullable T  (None | T); zero-overhead null pointer
   T[N]   = fixed-length array of N elements
   T[]    = dynamically-sized array
*/
Type            ::= "?"? "^"? Identifier ("[" Integer? "]")?


/* --- BLOCKS & STATEMENTS --- */

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


/* --- EXPRESSIONS (precedence: lowest → highest) --- */

Expression      ::= PipeExpr

PipeExpr        ::= LogicalExpr (">>" LogicalExpr)*
LogicalExpr     ::= EqualityExpr (("and" | "or") EqualityExpr)*
EqualityExpr    ::= RelationalExpr (("==" | "!=") RelationalExpr)*
RelationalExpr  ::= AdditiveExpr (("<" | "<=" | ">" | ">=") AdditiveExpr)*
AdditiveExpr    ::= MultiplicativeExpr (("+" | "-") MultiplicativeExpr)*
MultiplicativeExpr ::= PostfixExpr (("*" | "/") PostfixExpr)*

/* Postfix (left-associative):
     expr.field            – field / property access
     expr.method(args)     – method-style call (desugared to free fn in sema)
     Choice.Variant        – zero-arg ADT constructor     (resolved in sema)
     Choice.Variant(args)  – ADT constructor with payload (resolved in sema)
     expr(args)            – direct function call
     expr^                 – pointer dereference
     expr[]                – explicit vector slice / indexing
*/
PostfixExpr     ::= PrimaryExpr ( "." Identifier ( "(" ArgumentList? ")" )?
                                 | "[" (Expression ".." Expression | Expression)? "]"
                                 | "(" ArgumentList? ")"
                                 | "^"
                                 )*

PrimaryExpr     ::= Identifier
                  | Literal
                  | ListLiteral
                  | WhenExpr
                  | AllocExpr
                  | "(" Expression ")"

ArgumentList    ::= Expression ("," Expression)*


/* --- HEAP ALLOCATION ---
   alloc T()       allocates T on the heap, returns ^T.
   alloc T(args)   allocates and initialises a data struct.
*/
AllocExpr       ::= "alloc" Type ("(" ArgumentList? ")")?


/* --- PATTERN MATCHING ---
   Handles both 'choice' ADTs and nullable '?T' types.
*/
WhenExpr        ::= "when" Expression "{" WhenCase+ "}"
WhenCase        ::= WhenPattern "->" Block
WhenPattern     ::= "None"                                             /* nullable null arm     */
                  | Identifier "(" Identifier ("," Identifier)* ")"   /* variant with bindings */
                  | Identifier                                         /* no-payload or catch-all */


/* --- LITERALS --- */

ListLiteral     ::= "[" ArgumentList? "]"
Literal         ::= Integer | Float | String | Char | Boolean | NoneLiteral
NoneLiteral     ::= "None"
Integer         ::= [0-9]+
Float           ::= [0-9]+ "." [0-9]+
String          ::= '"' [^"]* '"'
Char            ::= "'" [^'] "'"
Boolean         ::= "true" | "false"


/* --- LEXICAL ELEMENTS --- */

Identifier      ::= [a-zA-Z_] [a-zA-Z0-9_]*
LineComment     ::= "//" [^\n]*
BlockComment    ::= "/*" .* "*/"
```

---

***