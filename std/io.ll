; ModuleID = 'nera_program'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

declare i8* @malloc(i64)
declare void @free(i8*)
declare i8* @strncpy(i8*, i8*, i64)
declare i32 @strcmp(i8*, i8*)
declare i8* @string_concat(i8*, i8*)
declare void @print_int(i64)
declare void @print_float(double)
declare i64 @puts(i8*)


define void @"print_string"(i8* noalias %param_value) {
entry:
  %ptr_value = alloca i8*
  %shared_vec_idx = alloca i64
  store i8* %param_value, i8** %ptr_value
  %1 = load i8*, i8** %ptr_value
  %2 = call i64 @"puts"(i8* %1)
  ret void
}

