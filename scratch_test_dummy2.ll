; ModuleID = 'nera_program'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

declare i8* @malloc(i64)
declare void @free(i8*)
declare i8* @strncpy(i8*, i8*, i64)
declare i32 @strcmp(i8*, i8*)
declare void @print_int(i8*)
declare void @print_float(i8*)
declare i64 @puts(i8*)


define i32 @nera_main() {
entry:
  %shared_vec_idx = alloca i64
  %1 = call i8* @malloc(i64 32)
  call void @free(i8* %1)
  %2 = trunc i64 0 to i32
  ret i32 %2
unreachable_0:
  call void @free(i8* %1)
  ret i32 0
}

define void @print_string(i8* noalias %param_value) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_value = alloca i8*
  store i8* %param_value, i8** %ptr_value
  %1 = load i8*, i8** %ptr_value
  %2 = call i64 @puts(i8* %1)
  ret void
}

