use std::fmt;
use std::io;

use crate::frontend::diagnostics::DiagnosticError;

#[derive(Debug)]
pub enum CompileError {
    IoError(io::Error),
    SyntaxError(Vec<DiagnosticError>),
    SemanticError(Vec<DiagnosticError>),
    BackendError(String),
}

impl fmt::Display for CompileError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            CompileError::IoError(err) => write!(f, "IO Error: {}", err),
            CompileError::SyntaxError(errs) => {
                writeln!(f, "Syntax Errors:")?;
                for err in errs {
                    writeln!(f, "  - {}", err.message)?;
                }
                Ok(())
            },
            CompileError::SemanticError(errs) => {
                writeln!(f, "Semantic Errors:")?;
                for err in errs {
                    writeln!(f, "  - {}", err.message)?;
                }
                Ok(())
            },
            CompileError::BackendError(msg) => write!(f, "Backend Error: {}", msg),
        }
    }
}

impl std::error::Error for CompileError {}

impl From<io::Error> for CompileError {
    fn from(err: io::Error) -> Self {
        CompileError::IoError(err)
    }
}
