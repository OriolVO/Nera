; ModuleID = 'nera_program'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

declare i8* @malloc(i64)
declare void @free(i8*)
declare i8* @strncpy(i8*, i8*, i64)
declare i32 @strcmp(i8*, i8*)


define i1 @string_eq(i8* noalias %param_s1, i8* noalias %param_s2) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s1 = alloca i8*
  store i8* %param_s1, i8** %ptr_s1
  store i8* %param_s2, i8** %ptr_s2
  %1 = load i8*, i8** %ptr_s1
  %2 = load i8*, i8** %ptr_s2
  %3 = call i32 @strcmp(i8* %1, i8* %2)
  %4 = icmp eq i32 %3, 0
  ret i1 %4
unreachable_0:
  ret i1 0
}

