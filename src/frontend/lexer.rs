use crate::frontend::diagnostics::Span;

/// Represents the different types of tokens that the lexer can produce.
#[derive(Debug, Clone, PartialEq)]
pub enum TokenKind {
    // Keywords
    Data,
    Fn,
    Let,
    Mut,
    If,
    Else,
    While,
    Return,
    Use,
    Extern,
    True,
    False,
    Choice,
    When,
    And,
    Or,
    Not,

    Identifier(String),
    Integer(i64),
    Float(f64),
    String(String),
    Char(i64),

    // Operators
    Assign,       // =
    AddAssign,    // +=
    SubAssign,    // -=
    MulAssign,    // *=
    DivAssign,    // /=
    Eq,           // ==
    NotEq,        // !=
    Lt,           // <
    LtEq,         // <=
    Gt,           // >
    GtEq,         // >=
    Add,          // +
    Sub,          // -
    Mul,          // *
    Div,          // /
    Pipe,         // >>
    Arrow,        // ->
    Caret,        // ^
    Alloc,        // alloc
    Free,         // free
    Question,     // ?
    NoneLiteral,  // None

    // Delimiters
    LBrace,       // {
    RBrace,       // }
    LBracket,     // [
    RBracket,     // ]
    LParen,       // (
    RParen,       // )
    Colon,        // :
    Comma,        // ,
    Dot,          // .
    DotDot,       // ..

    Error(String),
    Eof,
}

/// Represents a lexical token along with its position in the source code.
#[derive(Debug, Clone, PartialEq)]
pub struct Token {
    pub kind: TokenKind,
    pub span: Span,
}

impl Token {
    pub fn new(kind: TokenKind, span: Span) -> Self {
        Self { kind, span }
    }
}

/// The lexer is responsible for converting a stream of characters into a stream of tokens.
#[derive(Clone)]
pub struct Lexer<'a> {
    input: std::iter::Peekable<std::str::Chars<'a>>,
    line: usize,
    column: usize,
}

impl<'a> Lexer<'a> {
    /// Creates a new lexer from a given source string.
    pub fn new(source: &'a str) -> Self {
        Self {
            input: source.chars().peekable(),
            line: 1,
            column: 1,
        }
    }

    fn advance(&mut self) -> Option<char> {
        let c = self.input.next()?;
        if c == '\n' {
            self.line += 1;
            self.column = 1;
        } else {
            self.column += 1;
        }
        Some(c)
    }

    fn peek(&mut self) -> Option<&char> {
        self.input.peek()
    }

    fn skip_whitespace(&mut self) {
        while let Some(&c) = self.peek() {
            if c.is_whitespace() {
                self.advance();
            } else {
                break;
            }
        }
    }

    fn skip_comments(&mut self) {
        if let Some(&'/') = self.peek() {
            // We need to check if the next character is also '/' without advancing yet
            // To do this simply, we'll extract the iterator, check, and potentially put it back
            // However, a simpler way is just to advance and if not '/', return it. 
            // For now, we'll keep it simple: we just don't support multi-line comments in this basic lexer, only single line.
            // Let's implement peek_next if needed, but since we are parsing character by character we can just consume.
        }
    }

    /// Reads an identifier or a keyword.
    fn read_identifier(&mut self, first_char: char) -> TokenKind {
        let mut ident = String::new();
        ident.push(first_char);

        while let Some(&c) = self.peek() {
            if c.is_alphanumeric() || c == '_' {
                ident.push(c);
                self.advance();
            } else {
                break;
            }
        }

        match ident.as_str() {
            "data" => TokenKind::Data,
            "fn" => TokenKind::Fn,
            "let" => TokenKind::Let,
            "mut" => TokenKind::Mut,
            "if" => TokenKind::If,
            "else" => TokenKind::Else,
            "while" => TokenKind::While,
            "return" => TokenKind::Return,
            "use" => TokenKind::Use,
            "extern" => TokenKind::Extern,
            "true" => TokenKind::True,
            "false" => TokenKind::False,
            "choice" => TokenKind::Choice,
            "when" => TokenKind::When,
            "alloc" => TokenKind::Alloc,
            "free" => TokenKind::Free,
            "None" => TokenKind::NoneLiteral,
            "and" => TokenKind::And,
            "or" => TokenKind::Or,
            "not" => TokenKind::Not,
            _ => TokenKind::Identifier(ident),
        }
    }

    /// Reads a number literal (integer or float).
    fn read_number(&mut self, first_char: char) -> TokenKind {
        let mut num_str = String::new();
        num_str.push(first_char);
        let mut is_float = false;

        while let Some(&c) = self.peek() {
            if c.is_ascii_digit() {
                num_str.push(c);
                self.advance();
            } else if c == '.' && !is_float {
                // Check if it's '..', if so, break and don't consume the dot
                let mut peek_iter = self.input.clone();
                peek_iter.next(); // skip the first dot we just peeked
                if peek_iter.peek() == Some(&'.') {
                    break;
                }
                
                is_float = true;
                num_str.push(c);
                self.advance();
            } else {
                break;
            }
        }

        if is_float {
            TokenKind::Float(num_str.parse().unwrap_or(0.0))
        } else {
            TokenKind::Integer(num_str.parse().unwrap_or(0))
        }
    }

    /// Reads a string literal.
    fn read_string(&mut self) -> TokenKind {
        let mut string = String::new();

        while let Some(c) = self.advance() {
            if c == '"' {
                break;
            }
            string.push(c);
        }

        TokenKind::String(string)
    }

    /// Reads a character literal.
    fn read_char(&mut self) -> TokenKind {
        let Some(c) = self.advance() else {
            return TokenKind::Error("Unterminated character literal".to_string());
        };
        
        let val = c as i64;
        
        if self.peek() == Some(&'\'') {
            self.advance(); // consume closing quote
            TokenKind::Char(val)
        } else {
            TokenKind::Error("Expected closing quote for character literal".to_string())
        }
    }

    /// Retrieves the next token from the input stream.
    pub fn next_token(&mut self) -> Token {
        self.skip_whitespace();

        // Handle single-line comments //
        while let Some(&'/') = self.peek() {
            let start_line = self.line;
            let start_col = self.column;
            self.advance(); // consume '/'
            if let Some(&'/') = self.peek() {
                // It's a comment, consume until newline
                self.advance(); // consume second '/'
                while let Some(c) = self.advance() {
                    if c == '\n' {
                        break;
                    }
                }
                self.skip_whitespace();
            } else {
                // It's just a division sign
                let mut kind = TokenKind::Div;
                if let Some(&'=') = self.peek() {
                    self.advance();
                    kind = TokenKind::DivAssign;
                }
                let span = Span::new(start_line, start_col, self.line, self.column);
                return Token::new(kind, span);
            }
        }

        let start_line = self.line;
        let start_col = self.column;

        let Some(c) = self.advance() else {
            let span = Span::new(start_line, start_col, start_line, start_col);
            return Token::new(TokenKind::Eof, span);
        };

        let kind = match c {
            '{' => TokenKind::LBrace,
            '}' => TokenKind::RBrace,
            '[' => TokenKind::LBracket,
            ']' => TokenKind::RBracket,
            '(' => TokenKind::LParen,
            ')' => TokenKind::RParen,
            ':' => TokenKind::Colon,
            ',' => TokenKind::Comma,
            '.' => {
                if let Some(&'.') = self.peek() {
                    self.advance();
                    TokenKind::DotDot
                } else {
                    TokenKind::Dot
                }
            },
            '^' => TokenKind::Caret,
            '?' => TokenKind::Question,
            '=' => {
                if let Some(&'=') = self.peek() {
                    self.advance();
                    TokenKind::Eq
                } else {
                    TokenKind::Assign
                }
            }
            '+' => {
                if let Some(&'=') = self.peek() {
                    self.advance();
                    TokenKind::AddAssign
                } else {
                    TokenKind::Add
                }
            }
            '-' => {
                if let Some(&'=') = self.peek() {
                    self.advance();
                    TokenKind::SubAssign
                } else if let Some(&'>') = self.peek() {
                    self.advance();
                    TokenKind::Arrow
                } else {
                    TokenKind::Sub
                }
            }
            '*' => {
                if let Some(&'=') = self.peek() {
                    self.advance();
                    TokenKind::MulAssign
                } else {
                    TokenKind::Mul
                }
            }
            '<' => {
                if let Some(&'=') = self.peek() {
                    self.advance();
                    TokenKind::LtEq
                } else {
                    TokenKind::Lt
                }
            }
            '>' => {
                if let Some(&'=') = self.peek() {
                    self.advance();
                    TokenKind::GtEq
                } else if let Some(&'>') = self.peek() {
                    self.advance();
                    TokenKind::Pipe
                } else {
                    TokenKind::Gt
                }
            }
            '!' => {
                if let Some(&'=') = self.peek() {
                    self.advance();
                    TokenKind::NotEq
                } else {
                    TokenKind::Error("Unexpected character '!'".to_string())
                }
            }
            '"' => self.read_string(),
            '\'' => self.read_char(),
            _ if c.is_alphabetic() || c == '_' => self.read_identifier(c),
            _ if c.is_ascii_digit() => self.read_number(c),
            _ => TokenKind::Error(format!("Unexpected character: {}", c)),
        };

        let span = Span::new(start_line, start_col, self.line, self.column);
        Token::new(kind, span)
    }
}
