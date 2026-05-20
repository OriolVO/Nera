#[derive(Debug, Clone, PartialEq, Default)]
pub struct Span {
    pub start_line: usize,
    pub start_col: usize,
    pub end_line: usize,
    pub end_col: usize,
}

impl Span {
    pub fn new(start_line: usize, start_col: usize, end_line: usize, end_col: usize) -> Self {
        Self {
            start_line,
            start_col,
            end_line,
            end_col,
        }
    }

    pub fn merge(&self, other: &Span) -> Span {
        let start_line = self.start_line.min(other.start_line);
        let start_col = if self.start_line == other.start_line {
            self.start_col.min(other.start_col)
        } else if self.start_line < other.start_line {
            self.start_col
        } else {
            other.start_col
        };

        let end_line = self.end_line.max(other.end_line);
        let end_col = if self.end_line == other.end_line {
            self.end_col.max(other.end_col)
        } else if self.end_line > other.end_line {
            self.end_col
        } else {
            other.end_col
        };

        Span {
            start_line,
            start_col,
            end_line,
            end_col,
        }
    }
}

#[derive(Debug, Clone)]
pub struct DiagnosticError {
    pub span: Span,
    pub message: String,
}

#[derive(Debug, Clone, PartialEq)]
pub struct Spanned<T> {
    pub node: T,
    pub span: Span,
}

impl<T> Spanned<T> {
    pub fn new(node: T, span: Span) -> Self {
        Self { node, span }
    }
}

pub fn print_diagnostic(source: &str, span: &Span, message: &str) {
    println!("Error: {}", message);
    
    // We only print the first line of the error span for simplicity in this prototype.
    let target_line = span.start_line;
    let lines: Vec<&str> = source.lines().collect();

    if target_line > 0 && target_line <= lines.len() {
        let line_text = lines[target_line - 1];
        println!("{} | {}", target_line, line_text);
        
        // Print the carets
        let prefix = " ".repeat(target_line.to_string().len() + 3 + span.start_col.saturating_sub(1));
        
        let caret_len = if span.start_line == span.end_line {
            span.end_col.saturating_sub(span.start_col).max(1)
        } else {
            line_text.len().saturating_sub(span.start_col.saturating_sub(1)).max(1)
        };

        let carets = "^".repeat(caret_len);
        println!("{}{}", prefix, carets);
    } else {
        println!("  at line {}, column {}", span.start_line, span.start_col);
    }
}
