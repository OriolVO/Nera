; ModuleID = 'nera_program'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

declare i8* @malloc(i64)
declare void @free(i8*)
declare i1 @print_int()
declare i1 @print_float()
declare i1 @puts()


define i1 @print_string() {
entry:

}

define i1 @nera_main() {
entry:

}

