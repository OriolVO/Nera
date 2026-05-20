pub mod ir;
pub mod optimizer;

pub use ir::{IROperand, IRInstruction, IRGenerator};
pub use optimizer::{IROptimizer, OptimizedIR};
