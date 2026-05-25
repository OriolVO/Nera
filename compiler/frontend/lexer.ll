; ModuleID = 'nera_program'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

declare i8* @malloc(i64)
declare void @free(i8*)
declare i8* @strncpy(i8*, i8*, i64)
declare i32 @strcmp(i8*, i8*)
declare i64 @strlen(i64)
declare i8* @int_to_string(i64)
declare i8* @concat_strings(i64, i64)

@.str.0 = private unnamed_addr constant [23 x i8] c"Unexpected character !\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"Unterminated string literal\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"Unterminated character literal\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"Unterminated escape sequence\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"Invalid escape sequence\00", align 1
@.str.5 = private unnamed_addr constant [45 x i8] c"Expected closing quote for character literal\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"data\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"fn\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"let\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"mut\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@.str.11 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"return\00", align 1
@.str.14 = private unnamed_addr constant [5 x i8] c"when\00", align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"break\00", align 1
@.str.16 = private unnamed_addr constant [9 x i8] c"continue\00", align 1
@.str.17 = private unnamed_addr constant [4 x i8] c"use\00", align 1
@.str.18 = private unnamed_addr constant [7 x i8] c"extern\00", align 1
@.str.19 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str.20 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@.str.21 = private unnamed_addr constant [7 x i8] c"choice\00", align 1
@.str.22 = private unnamed_addr constant [6 x i8] c"alloc\00", align 1
@.str.23 = private unnamed_addr constant [5 x i8] c"free\00", align 1
@.str.24 = private unnamed_addr constant [5 x i8] c"None\00", align 1
@.str.25 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@.str.26 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@.str.27 = private unnamed_addr constant [4 x i8] c"not\00", align 1
@.str.28 = private unnamed_addr constant [7 x i8] c"bitand\00", align 1
@.str.29 = private unnamed_addr constant [6 x i8] c"bitor\00", align 1
@.str.30 = private unnamed_addr constant [7 x i8] c"bitxor\00", align 1
@.str.31 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@.str.32 = private unnamed_addr constant [4 x i8] c"shr\00", align 1
@.str.33 = private unnamed_addr constant [3 x i8] c"as\00", align 1
@.str.34 = private unnamed_addr constant [21 x i8] c"Unexpected character\00", align 1

define i64** @alloc_lexer(i8* noalias %param_src) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_digit_val = alloca i64
  %ptr_c = alloca i64
  %ptr_val_int = alloca i64
  %ptr_val_float = alloca double
  %ptr_val = alloca i64
  %ptr_s2 = alloca i64
  %ptr_matched = alloca i1
  %ptr_s = alloca i64
  %ptr_s1 = alloca i64
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_char_val = alloca i64
  %ptr_esc = alloca i64
  %ptr_end_pos = alloca i64
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_start_col = alloca i64
  %ptr_lex = alloca i64**
  %ptr_tok = alloca i64**
  %ptr_fractional_mult = alloca double
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  store i8* %param_src, i8** %ptr_src
  %1 = call i8* @malloc(i64 40)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_lex
  %3 = load i64**, i64*** %ptr_lex
  %4 = load i8*, i8** %ptr_src
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i8**
  store i8* %4, i8** %7, align 8
  %8 = load i64**, i64*** %ptr_lex
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i8*, i8** %ptr_src
  %13 = call i64 @strlen(i8* %12)
  %14 = load i8*, i8** %ptr_src
  %15 = call i64 @strlen(i8* %14)
  %16 = load i64**, i64*** %ptr_lex
  %17 = bitcast i64** %16 to i64*
  %18 = getelementptr inbounds i64, i64* %17, i64 2
  %19 = bitcast i64* %18 to i64*
  store i64 %15, i64* %19, align 8
  %20 = load i64**, i64*** %ptr_lex
  %21 = bitcast i64** %20 to i64*
  %22 = getelementptr inbounds i64, i64* %21, i64 3
  %23 = bitcast i64* %22 to i64*
  store i64 1, i64* %23, align 8
  %24 = load i64**, i64*** %ptr_lex
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 4
  %27 = bitcast i64* %26 to i64*
  store i64 1, i64* %27, align 8
  %28 = load i64**, i64*** %ptr_lex
  ret i64** %28
unreachable_0:
  ret i64** null
}

define void @free_lexer(i64** noalias %param_lex) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_digit_val = alloca i64
  %ptr_c = alloca i64
  %ptr_val_int = alloca i64
  %ptr_val_float = alloca double
  %ptr_val = alloca i64
  %ptr_s2 = alloca i64
  %ptr_matched = alloca i1
  %ptr_s = alloca i64
  %ptr_s1 = alloca i64
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_char_val = alloca i64
  %ptr_esc = alloca i64
  %ptr_end_pos = alloca i64
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_start_col = alloca i64
  %ptr_lex = alloca i64**
  %ptr_tok = alloca i64**
  %ptr_fractional_mult = alloca double
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  store i64** %param_lex, i64*** %ptr_lex
  %1 = load i64**, i64*** %ptr_lex
  %2 = bitcast i64** %1 to i8*
  call void @free(i8* %2)
  ret void
}

define i1 @is_at_end(i64** noalias %param_lex) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_digit_val = alloca i64
  %ptr_c = alloca i64
  %ptr_val_int = alloca i64
  %ptr_val_float = alloca double
  %ptr_val = alloca i64
  %ptr_s2 = alloca i64
  %ptr_matched = alloca i1
  %ptr_s = alloca i64
  %ptr_s1 = alloca i64
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_char_val = alloca i64
  %ptr_esc = alloca i64
  %ptr_end_pos = alloca i64
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_start_col = alloca i64
  %ptr_lex = alloca i64**
  %ptr_tok = alloca i64**
  %ptr_fractional_mult = alloca double
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  store i64** %param_lex, i64*** %ptr_lex
  %1 = load i64**, i64*** %ptr_lex
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = load i64**, i64*** %ptr_lex
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 2
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = icmp sge i64 %5, %10
  ret i1 %11
unreachable_0:
  ret i1 0
}

define i64 @peek(i64** noalias %param_lex) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_digit_val = alloca i64
  %ptr_c = alloca i64
  %ptr_val_int = alloca i64
  %ptr_val_float = alloca double
  %ptr_val = alloca i64
  %ptr_s2 = alloca i64
  %ptr_matched = alloca i1
  %ptr_s = alloca i64
  %ptr_s1 = alloca i64
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_char_val = alloca i64
  %ptr_esc = alloca i64
  %ptr_end_pos = alloca i64
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_start_col = alloca i64
  %ptr_lex = alloca i64**
  %ptr_tok = alloca i64**
  %ptr_fractional_mult = alloca double
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  store i64** %param_lex, i64*** %ptr_lex
  %1 = load i64**, i64*** %ptr_lex
  %2 = call i1 @is_at_end(i64** %1)
  br i1 %2, label %then_0, label %end_if_1
then_0:
  ret i64 0
unreachable_2:
  br label %end_if_1
end_if_1:
  %3 = load i64**, i64*** %ptr_lex
  %4 = bitcast i64** %3 to i64*
  %5 = getelementptr inbounds i64, i64* %4, i64 0
  %6 = bitcast i64* %5 to i8**
  %7 = load i8*, i8** %6, align 8
  %8 = load i64**, i64*** %ptr_lex
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = getelementptr inbounds i8, i8* %7, i64 %12
  %14 = load i8, i8* %13, align 1
  %15 = zext i8 %14 to i64
  ret i64 %15
unreachable_3:
  ret i64 0
}

define i64 @peek_next(i64** noalias %param_lex) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_digit_val = alloca i64
  %ptr_c = alloca i64
  %ptr_val_int = alloca i64
  %ptr_val_float = alloca double
  %ptr_val = alloca i64
  %ptr_s2 = alloca i64
  %ptr_matched = alloca i1
  %ptr_s = alloca i64
  %ptr_s1 = alloca i64
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_char_val = alloca i64
  %ptr_esc = alloca i64
  %ptr_end_pos = alloca i64
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_start_col = alloca i64
  %ptr_lex = alloca i64**
  %ptr_tok = alloca i64**
  %ptr_fractional_mult = alloca double
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  store i64** %param_lex, i64*** %ptr_lex
  %1 = load i64**, i64*** %ptr_lex
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = add nsw i64 %5, 1
  %7 = load i64**, i64*** %ptr_lex
  %8 = bitcast i64** %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 2
  %10 = bitcast i64* %9 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = icmp sge i64 %6, %11
  br i1 %12, label %then_0, label %end_if_1
then_0:
  ret i64 0
unreachable_2:
  br label %end_if_1
end_if_1:
  %13 = load i64**, i64*** %ptr_lex
  %14 = bitcast i64** %13 to i64*
  %15 = getelementptr inbounds i64, i64* %14, i64 0
  %16 = bitcast i64* %15 to i8**
  %17 = load i8*, i8** %16, align 8
  %18 = load i64**, i64*** %ptr_lex
  %19 = bitcast i64** %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 1
  %21 = bitcast i64* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = add nsw i64 %22, 1
  %24 = getelementptr inbounds i8, i8* %17, i64 %23
  %25 = load i8, i8* %24, align 1
  %26 = zext i8 %25 to i64
  ret i64 %26
unreachable_3:
  ret i64 0
}

define i64 @advance(i64** noalias %param_lex) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_digit_val = alloca i64
  %ptr_c = alloca i64
  %ptr_val_int = alloca i64
  %ptr_val_float = alloca double
  %ptr_val = alloca i64
  %ptr_s2 = alloca i64
  %ptr_matched = alloca i1
  %ptr_s = alloca i64
  %ptr_s1 = alloca i64
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_char_val = alloca i64
  %ptr_esc = alloca i64
  %ptr_end_pos = alloca i64
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_start_col = alloca i64
  %ptr_lex = alloca i64**
  %ptr_tok = alloca i64**
  %ptr_fractional_mult = alloca double
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  store i64** %param_lex, i64*** %ptr_lex
  %1 = load i64**, i64*** %ptr_lex
  %2 = call i64 @peek(i64** %1)
  store i64 %2, i64* %ptr_c
  %3 = load i64**, i64*** %ptr_lex
  %4 = bitcast i64** %3 to i64*
  %5 = getelementptr inbounds i64, i64* %4, i64 1
  %6 = bitcast i64* %5 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = add nsw i64 %7, 1
  %9 = load i64**, i64*** %ptr_lex
  %10 = bitcast i64** %9 to i64*
  %11 = getelementptr inbounds i64, i64* %10, i64 1
  %12 = bitcast i64* %11 to i64*
  store i64 %8, i64* %12, align 8
  %13 = load i64, i64* %ptr_c
  %14 = icmp eq i64 %13, 10
  br i1 %14, label %then_0, label %else_2
then_0:
  %15 = load i64**, i64*** %ptr_lex
  %16 = bitcast i64** %15 to i64*
  %17 = getelementptr inbounds i64, i64* %16, i64 3
  %18 = bitcast i64* %17 to i64*
  %19 = load i64, i64* %18, align 8
  %20 = add nsw i64 %19, 1
  %21 = load i64**, i64*** %ptr_lex
  %22 = bitcast i64** %21 to i64*
  %23 = getelementptr inbounds i64, i64* %22, i64 3
  %24 = bitcast i64* %23 to i64*
  store i64 %20, i64* %24, align 8
  %25 = load i64**, i64*** %ptr_lex
  %26 = bitcast i64** %25 to i64*
  %27 = getelementptr inbounds i64, i64* %26, i64 4
  %28 = bitcast i64* %27 to i64*
  store i64 1, i64* %28, align 8
  br label %end_if_1
else_2:
  %29 = load i64**, i64*** %ptr_lex
  %30 = bitcast i64** %29 to i64*
  %31 = getelementptr inbounds i64, i64* %30, i64 4
  %32 = bitcast i64* %31 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = add nsw i64 %33, 1
  %35 = load i64**, i64*** %ptr_lex
  %36 = bitcast i64** %35 to i64*
  %37 = getelementptr inbounds i64, i64* %36, i64 4
  %38 = bitcast i64* %37 to i64*
  store i64 %34, i64* %38, align 8
  br label %end_if_1
end_if_1:
  %39 = load i64, i64* %ptr_c
  ret i64 %39
unreachable_3:
  ret i64 0
}

define i1 @is_whitespace(i64 %param_c) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_digit_val = alloca i64
  %ptr_c = alloca i64
  %ptr_val_int = alloca i64
  %ptr_val_float = alloca double
  %ptr_val = alloca i64
  %ptr_s2 = alloca i64
  %ptr_matched = alloca i1
  %ptr_s = alloca i64
  %ptr_s1 = alloca i64
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_char_val = alloca i64
  %ptr_esc = alloca i64
  %ptr_end_pos = alloca i64
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_start_col = alloca i64
  %ptr_lex = alloca i64**
  %ptr_tok = alloca i64**
  %ptr_fractional_mult = alloca double
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  store i64 %param_c, i64* %ptr_c
  %1 = load i64, i64* %ptr_c
  %2 = icmp eq i64 %1, 32
  %3 = load i64, i64* %ptr_c
  %4 = icmp eq i64 %3, 13
  %5 = or i1 %2, %4
  %6 = load i64, i64* %ptr_c
  %7 = icmp eq i64 %6, 9
  %8 = or i1 %5, %7
  %9 = load i64, i64* %ptr_c
  %10 = icmp eq i64 %9, 10
  %11 = or i1 %8, %10
  ret i1 %11
unreachable_0:
  ret i1 0
}

define i1 @is_alpha(i64 %param_c) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_digit_val = alloca i64
  %ptr_c = alloca i64
  %ptr_val_int = alloca i64
  %ptr_val_float = alloca double
  %ptr_val = alloca i64
  %ptr_s2 = alloca i64
  %ptr_matched = alloca i1
  %ptr_s = alloca i64
  %ptr_s1 = alloca i64
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_char_val = alloca i64
  %ptr_esc = alloca i64
  %ptr_end_pos = alloca i64
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_start_col = alloca i64
  %ptr_lex = alloca i64**
  %ptr_tok = alloca i64**
  %ptr_fractional_mult = alloca double
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  store i64 %param_c, i64* %ptr_c
  %1 = load i64, i64* %ptr_c
  %2 = icmp sge i64 %1, 97
  %3 = load i64, i64* %ptr_c
  %4 = icmp sle i64 %3, 122
  %5 = and i1 %2, %4
  %6 = load i64, i64* %ptr_c
  %7 = icmp sge i64 %6, 65
  %8 = load i64, i64* %ptr_c
  %9 = icmp sle i64 %8, 90
  %10 = and i1 %7, %9
  %11 = or i1 %5, %10
  %12 = load i64, i64* %ptr_c
  %13 = icmp eq i64 %12, 95
  %14 = or i1 %11, %13
  ret i1 %14
unreachable_0:
  ret i1 0
}

define i1 @is_digit(i64 %param_c) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_digit_val = alloca i64
  %ptr_c = alloca i64
  %ptr_val_int = alloca i64
  %ptr_val_float = alloca double
  %ptr_val = alloca i64
  %ptr_s2 = alloca i64
  %ptr_matched = alloca i1
  %ptr_s = alloca i64
  %ptr_s1 = alloca i64
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_char_val = alloca i64
  %ptr_esc = alloca i64
  %ptr_end_pos = alloca i64
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_start_col = alloca i64
  %ptr_lex = alloca i64**
  %ptr_tok = alloca i64**
  %ptr_fractional_mult = alloca double
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  store i64 %param_c, i64* %ptr_c
  %1 = load i64, i64* %ptr_c
  %2 = icmp sge i64 %1, 48
  %3 = load i64, i64* %ptr_c
  %4 = icmp sle i64 %3, 57
  %5 = and i1 %2, %4
  ret i1 %5
unreachable_0:
  ret i1 0
}

define i1 @is_alphanumeric(i64 %param_c) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_digit_val = alloca i64
  %ptr_c = alloca i64
  %ptr_val_int = alloca i64
  %ptr_val_float = alloca double
  %ptr_val = alloca i64
  %ptr_s2 = alloca i64
  %ptr_matched = alloca i1
  %ptr_s = alloca i64
  %ptr_s1 = alloca i64
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_char_val = alloca i64
  %ptr_esc = alloca i64
  %ptr_end_pos = alloca i64
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_start_col = alloca i64
  %ptr_lex = alloca i64**
  %ptr_tok = alloca i64**
  %ptr_fractional_mult = alloca double
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  store i64 %param_c, i64* %ptr_c
  %1 = load i64, i64* %ptr_c
  %2 = call i1 @is_alpha(i64 %1)
  %3 = load i64, i64* %ptr_c
  %4 = call i1 @is_digit(i64 %3)
  %5 = or i1 %2, %4
  ret i1 %5
unreachable_0:
  ret i1 0
}

define void @skip_whitespace(i64** noalias %param_lex) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_digit_val = alloca i64
  %ptr_c = alloca i64
  %ptr_val_int = alloca i64
  %ptr_val_float = alloca double
  %ptr_val = alloca i64
  %ptr_s2 = alloca i64
  %ptr_matched = alloca i1
  %ptr_s = alloca i64
  %ptr_s1 = alloca i64
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_char_val = alloca i64
  %ptr_esc = alloca i64
  %ptr_end_pos = alloca i64
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_start_col = alloca i64
  %ptr_lex = alloca i64**
  %ptr_tok = alloca i64**
  %ptr_fractional_mult = alloca double
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  store i64** %param_lex, i64*** %ptr_lex
  br label %while_cond_0
while_cond_0:
  %1 = load i64**, i64*** %ptr_lex
  %2 = call i1 @is_at_end(i64** %1)
  %3 = xor i1 %2, 1
  br i1 %3, label %while_body_1, label %while_end_2
while_body_1:
  %4 = load i64**, i64*** %ptr_lex
  %5 = call i64 @peek(i64** %4)
  store i64 %5, i64* %ptr_c
  %6 = load i64, i64* %ptr_c
  %7 = call i1 @is_whitespace(i64 %6)
  br i1 %7, label %then_3, label %else_5
then_3:
  %8 = load i64**, i64*** %ptr_lex
  %9 = call i64 @advance(i64** %8)
  br label %end_if_4
else_5:
  %10 = load i64, i64* %ptr_c
  %11 = icmp eq i64 %10, 47
  %12 = load i64**, i64*** %ptr_lex
  %13 = call i64 @peek_next(i64** %12)
  %14 = icmp eq i64 %13, 47
  %15 = and i1 %11, %14
  br i1 %15, label %then_6, label %else_8
then_6:
  br label %while_cond_9
while_cond_9:
  %16 = load i64**, i64*** %ptr_lex
  %17 = call i1 @is_at_end(i64** %16)
  %18 = xor i1 %17, 1
  %19 = load i64**, i64*** %ptr_lex
  %20 = call i64 @peek(i64** %19)
  %21 = icmp ne i64 %20, 10
  %22 = and i1 %18, %21
  br i1 %22, label %while_body_10, label %while_end_11
while_body_10:
  %23 = load i64**, i64*** %ptr_lex
  %24 = call i64 @advance(i64** %23)
  br label %while_cond_9
while_end_11:
  br label %end_if_7
else_8:
  %25 = load i64, i64* %ptr_c
  %26 = icmp eq i64 %25, 47
  %27 = load i64**, i64*** %ptr_lex
  %28 = call i64 @peek_next(i64** %27)
  %29 = icmp eq i64 %28, 42
  %30 = and i1 %26, %29
  br i1 %30, label %then_12, label %else_14
then_12:
  %31 = load i64**, i64*** %ptr_lex
  %32 = call i64 @advance(i64** %31)
  %33 = load i64**, i64*** %ptr_lex
  %34 = call i64 @advance(i64** %33)
  br label %while_cond_15
while_cond_15:
  %35 = load i64**, i64*** %ptr_lex
  %36 = call i1 @is_at_end(i64** %35)
  %37 = xor i1 %36, 1
  br i1 %37, label %while_body_16, label %while_end_17
while_body_16:
  %38 = load i64**, i64*** %ptr_lex
  %39 = call i64 @peek(i64** %38)
  %40 = icmp eq i64 %39, 42
  %41 = load i64**, i64*** %ptr_lex
  %42 = call i64 @peek_next(i64** %41)
  %43 = icmp eq i64 %42, 47
  %44 = and i1 %40, %43
  br i1 %44, label %then_18, label %end_if_19
then_18:
  %45 = load i64**, i64*** %ptr_lex
  %46 = call i64 @advance(i64** %45)
  %47 = load i64**, i64*** %ptr_lex
  %48 = call i64 @advance(i64** %47)
  br label %while_end_17
unreachable_20:
  br label %end_if_19
end_if_19:
  %49 = load i64**, i64*** %ptr_lex
  %50 = call i64 @advance(i64** %49)
  br label %while_cond_15
while_end_17:
  br label %end_if_13
else_14:
  br label %while_end_2
unreachable_21:
  br label %end_if_13
end_if_13:
  br label %end_if_7
end_if_7:
  br label %end_if_4
end_if_4:
  br label %while_cond_0
while_end_2:
  ret void
}

define i64** @make_token(i64* noalias %param_kind, i64 %param_line, i64 %param_col) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_digit_val = alloca i64
  %ptr_c = alloca i64
  %ptr_val_int = alloca i64
  %ptr_val_float = alloca double
  %ptr_val = alloca i64
  %ptr_s2 = alloca i64
  %ptr_matched = alloca i1
  %ptr_s = alloca i64
  %ptr_s1 = alloca i64
  %ptr_kind = alloca i64*
  %ptr_line = alloca i64
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_char_val = alloca i64
  %ptr_esc = alloca i64
  %ptr_end_pos = alloca i64
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_start_col = alloca i64
  %ptr_lex = alloca i64**
  %ptr_tok = alloca i64**
  %ptr_fractional_mult = alloca double
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_col = alloca i64
  store i64* %param_kind, i64** %ptr_kind
  store i64 %param_line, i64* %ptr_line
  store i64 %param_col, i64* %ptr_col
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_tok
  %3 = load i64**, i64*** %ptr_tok
  %4 = load i64*, i64** %ptr_kind
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64**
  store i64* %4, i64** %7, align 8
  %8 = load i64**, i64*** %ptr_tok
  %9 = load i64, i64* %ptr_line
  %10 = bitcast i64** %8 to i64*
  %11 = getelementptr inbounds i64, i64* %10, i64 1
  %12 = bitcast i64* %11 to i64*
  store i64 %9, i64* %12, align 8
  %13 = load i64**, i64*** %ptr_tok
  %14 = load i64, i64* %ptr_col
  %15 = bitcast i64** %13 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i64*
  store i64 %14, i64* %17, align 8
  %18 = load i64**, i64*** %ptr_tok
  ret i64** %18
unreachable_0:
  ret i64** null
}

define i64** @next_token(i64** noalias %param_lex) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_digit_val = alloca i64
  %ptr_c = alloca i64
  %ptr_val_int = alloca i64
  %ptr_val_float = alloca double
  %ptr_val = alloca i64
  %ptr_s2 = alloca i64
  %ptr_matched = alloca i1
  %ptr_s = alloca i64
  %ptr_s1 = alloca i64
  %ptr_kind = alloca i64*
  %ptr_line = alloca i64
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_char_val = alloca i64
  %ptr_esc = alloca i64
  %ptr_end_pos = alloca i64
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_start_col = alloca i64
  %ptr_lex = alloca i64**
  %ptr_tok = alloca i64**
  %ptr_fractional_mult = alloca double
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_col = alloca i64
  store i64** %param_lex, i64*** %ptr_lex
  %1 = load i64**, i64*** %ptr_lex
  call void @skip_whitespace(i64** %1)
  %2 = load i64**, i64*** %ptr_lex
  %3 = bitcast i64** %2 to i64*
  %4 = getelementptr inbounds i64, i64* %3, i64 3
  %5 = bitcast i64* %4 to i64*
  %6 = load i64, i64* %5, align 8
  store i64 %6, i64* %ptr_start_line
  %7 = load i64**, i64*** %ptr_lex
  %8 = bitcast i64** %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 4
  %10 = bitcast i64* %9 to i64*
  %11 = load i64, i64* %10, align 8
  store i64 %11, i64* %ptr_start_col
  %12 = load i64**, i64*** %ptr_lex
  %13 = call i1 @is_at_end(i64** %12)
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = call i8* @malloc(i64 8)
  %15 = bitcast i8* %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 0
  store i64 64, i64* %16
  %17 = load i64, i64* %ptr_start_line
  %18 = load i64, i64* %ptr_start_col
  %19 = call i64** @make_token(i64* %15, i64 %17, i64 %18)
  ret i64** %19
unreachable_2:
  br label %end_if_1
end_if_1:
  %20 = load i64**, i64*** %ptr_lex
  %21 = call i64 @advance(i64** %20)
  store i64 %21, i64* %ptr_c
  %22 = load i64, i64* %ptr_c
  %23 = icmp eq i64 %22, 43
  br i1 %23, label %then_3, label %end_if_4
then_3:
  %24 = load i64**, i64*** %ptr_lex
  %25 = call i64 @peek(i64** %24)
  %26 = icmp eq i64 %25, 61
  br i1 %26, label %then_5, label %end_if_6
then_5:
  %27 = load i64**, i64*** %ptr_lex
  %28 = call i64 @advance(i64** %27)
  %29 = call i8* @malloc(i64 8)
  %30 = bitcast i8* %29 to i64*
  %31 = getelementptr inbounds i64, i64* %30, i64 0
  store i64 31, i64* %31
  %32 = load i64, i64* %ptr_start_line
  %33 = load i64, i64* %ptr_start_col
  %34 = call i64** @make_token(i64* %30, i64 %32, i64 %33)
  ret i64** %34
unreachable_7:
  br label %end_if_6
end_if_6:
  %35 = call i8* @malloc(i64 8)
  %36 = bitcast i8* %35 to i64*
  %37 = getelementptr inbounds i64, i64* %36, i64 0
  store i64 41, i64* %37
  %38 = load i64, i64* %ptr_start_line
  %39 = load i64, i64* %ptr_start_col
  %40 = call i64** @make_token(i64* %36, i64 %38, i64 %39)
  ret i64** %40
unreachable_8:
  br label %end_if_4
end_if_4:
  %41 = load i64, i64* %ptr_c
  %42 = icmp eq i64 %41, 45
  br i1 %42, label %then_9, label %end_if_10
then_9:
  %43 = load i64**, i64*** %ptr_lex
  %44 = call i64 @peek(i64** %43)
  %45 = icmp eq i64 %44, 62
  br i1 %45, label %then_11, label %end_if_12
then_11:
  %46 = load i64**, i64*** %ptr_lex
  %47 = call i64 @advance(i64** %46)
  %48 = call i8* @malloc(i64 8)
  %49 = bitcast i8* %48 to i64*
  %50 = getelementptr inbounds i64, i64* %49, i64 0
  store i64 47, i64* %50
  %51 = load i64, i64* %ptr_start_line
  %52 = load i64, i64* %ptr_start_col
  %53 = call i64** @make_token(i64* %49, i64 %51, i64 %52)
  ret i64** %53
unreachable_13:
  br label %end_if_12
end_if_12:
  %54 = load i64**, i64*** %ptr_lex
  %55 = call i64 @peek(i64** %54)
  %56 = icmp eq i64 %55, 61
  br i1 %56, label %then_14, label %end_if_15
then_14:
  %57 = load i64**, i64*** %ptr_lex
  %58 = call i64 @advance(i64** %57)
  %59 = call i8* @malloc(i64 8)
  %60 = bitcast i8* %59 to i64*
  %61 = getelementptr inbounds i64, i64* %60, i64 0
  store i64 32, i64* %61
  %62 = load i64, i64* %ptr_start_line
  %63 = load i64, i64* %ptr_start_col
  %64 = call i64** @make_token(i64* %60, i64 %62, i64 %63)
  ret i64** %64
unreachable_16:
  br label %end_if_15
end_if_15:
  %65 = call i8* @malloc(i64 8)
  %66 = bitcast i8* %65 to i64*
  %67 = getelementptr inbounds i64, i64* %66, i64 0
  store i64 42, i64* %67
  %68 = load i64, i64* %ptr_start_line
  %69 = load i64, i64* %ptr_start_col
  %70 = call i64** @make_token(i64* %66, i64 %68, i64 %69)
  ret i64** %70
unreachable_17:
  br label %end_if_10
end_if_10:
  %71 = load i64, i64* %ptr_c
  %72 = icmp eq i64 %71, 42
  br i1 %72, label %then_18, label %end_if_19
then_18:
  %73 = load i64**, i64*** %ptr_lex
  %74 = call i64 @peek(i64** %73)
  %75 = icmp eq i64 %74, 61
  br i1 %75, label %then_20, label %end_if_21
then_20:
  %76 = load i64**, i64*** %ptr_lex
  %77 = call i64 @advance(i64** %76)
  %78 = call i8* @malloc(i64 8)
  %79 = bitcast i8* %78 to i64*
  %80 = getelementptr inbounds i64, i64* %79, i64 0
  store i64 33, i64* %80
  %81 = load i64, i64* %ptr_start_line
  %82 = load i64, i64* %ptr_start_col
  %83 = call i64** @make_token(i64* %79, i64 %81, i64 %82)
  ret i64** %83
unreachable_22:
  br label %end_if_21
end_if_21:
  %84 = call i8* @malloc(i64 8)
  %85 = bitcast i8* %84 to i64*
  %86 = getelementptr inbounds i64, i64* %85, i64 0
  store i64 43, i64* %86
  %87 = load i64, i64* %ptr_start_line
  %88 = load i64, i64* %ptr_start_col
  %89 = call i64** @make_token(i64* %85, i64 %87, i64 %88)
  ret i64** %89
unreachable_23:
  br label %end_if_19
end_if_19:
  %90 = load i64, i64* %ptr_c
  %91 = icmp eq i64 %90, 47
  br i1 %91, label %then_24, label %end_if_25
then_24:
  %92 = load i64**, i64*** %ptr_lex
  %93 = call i64 @peek(i64** %92)
  %94 = icmp eq i64 %93, 61
  br i1 %94, label %then_26, label %end_if_27
then_26:
  %95 = load i64**, i64*** %ptr_lex
  %96 = call i64 @advance(i64** %95)
  %97 = call i8* @malloc(i64 8)
  %98 = bitcast i8* %97 to i64*
  %99 = getelementptr inbounds i64, i64* %98, i64 0
  store i64 34, i64* %99
  %100 = load i64, i64* %ptr_start_line
  %101 = load i64, i64* %ptr_start_col
  %102 = call i64** @make_token(i64* %98, i64 %100, i64 %101)
  ret i64** %102
unreachable_28:
  br label %end_if_27
end_if_27:
  %103 = call i8* @malloc(i64 8)
  %104 = bitcast i8* %103 to i64*
  %105 = getelementptr inbounds i64, i64* %104, i64 0
  store i64 44, i64* %105
  %106 = load i64, i64* %ptr_start_line
  %107 = load i64, i64* %ptr_start_col
  %108 = call i64** @make_token(i64* %104, i64 %106, i64 %107)
  ret i64** %108
unreachable_29:
  br label %end_if_25
end_if_25:
  %109 = load i64, i64* %ptr_c
  %110 = icmp eq i64 %109, 37
  br i1 %110, label %then_30, label %end_if_31
then_30:
  %111 = call i8* @malloc(i64 8)
  %112 = bitcast i8* %111 to i64*
  %113 = getelementptr inbounds i64, i64* %112, i64 0
  store i64 45, i64* %113
  %114 = load i64, i64* %ptr_start_line
  %115 = load i64, i64* %ptr_start_col
  %116 = call i64** @make_token(i64* %112, i64 %114, i64 %115)
  ret i64** %116
unreachable_32:
  br label %end_if_31
end_if_31:
  %117 = load i64, i64* %ptr_c
  %118 = icmp eq i64 %117, 61
  br i1 %118, label %then_33, label %end_if_34
then_33:
  %119 = load i64**, i64*** %ptr_lex
  %120 = call i64 @peek(i64** %119)
  %121 = icmp eq i64 %120, 61
  br i1 %121, label %then_35, label %end_if_36
then_35:
  %122 = load i64**, i64*** %ptr_lex
  %123 = call i64 @advance(i64** %122)
  %124 = call i8* @malloc(i64 8)
  %125 = bitcast i8* %124 to i64*
  %126 = getelementptr inbounds i64, i64* %125, i64 0
  store i64 35, i64* %126
  %127 = load i64, i64* %ptr_start_line
  %128 = load i64, i64* %ptr_start_col
  %129 = call i64** @make_token(i64* %125, i64 %127, i64 %128)
  ret i64** %129
unreachable_37:
  br label %end_if_36
end_if_36:
  %130 = call i8* @malloc(i64 8)
  %131 = bitcast i8* %130 to i64*
  %132 = getelementptr inbounds i64, i64* %131, i64 0
  store i64 30, i64* %132
  %133 = load i64, i64* %ptr_start_line
  %134 = load i64, i64* %ptr_start_col
  %135 = call i64** @make_token(i64* %131, i64 %133, i64 %134)
  ret i64** %135
unreachable_38:
  br label %end_if_34
end_if_34:
  %136 = load i64, i64* %ptr_c
  %137 = icmp eq i64 %136, 33
  br i1 %137, label %then_39, label %end_if_40
then_39:
  %138 = load i64**, i64*** %ptr_lex
  %139 = call i64 @peek(i64** %138)
  %140 = icmp eq i64 %139, 61
  br i1 %140, label %then_41, label %end_if_42
then_41:
  %141 = load i64**, i64*** %ptr_lex
  %142 = call i64 @advance(i64** %141)
  %143 = call i8* @malloc(i64 8)
  %144 = bitcast i8* %143 to i64*
  %145 = getelementptr inbounds i64, i64* %144, i64 0
  store i64 36, i64* %145
  %146 = load i64, i64* %ptr_start_line
  %147 = load i64, i64* %ptr_start_col
  %148 = call i64** @make_token(i64* %144, i64 %146, i64 %147)
  ret i64** %148
unreachable_43:
  br label %end_if_42
end_if_42:
  %149 = call i8* @malloc(i64 16)
  %150 = bitcast i8* %149 to i64*
  %151 = getelementptr inbounds i64, i64* %150, i64 0
  store i64 63, i64* %151
  %152 = getelementptr inbounds i64, i64* %150, i64 1
  %153 = bitcast i64* %152 to i8**
  store i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.0, i64 0, i64 0), i8** %153
  %154 = load i64, i64* %ptr_start_line
  %155 = load i64, i64* %ptr_start_col
  %156 = call i64** @make_token(i64* %150, i64 %154, i64 %155)
  ret i64** %156
unreachable_44:
  br label %end_if_40
end_if_40:
  %157 = load i64, i64* %ptr_c
  %158 = icmp eq i64 %157, 60
  br i1 %158, label %then_45, label %end_if_46
then_45:
  %159 = load i64**, i64*** %ptr_lex
  %160 = call i64 @peek(i64** %159)
  %161 = icmp eq i64 %160, 61
  br i1 %161, label %then_47, label %end_if_48
then_47:
  %162 = load i64**, i64*** %ptr_lex
  %163 = call i64 @advance(i64** %162)
  %164 = call i8* @malloc(i64 8)
  %165 = bitcast i8* %164 to i64*
  %166 = getelementptr inbounds i64, i64* %165, i64 0
  store i64 38, i64* %166
  %167 = load i64, i64* %ptr_start_line
  %168 = load i64, i64* %ptr_start_col
  %169 = call i64** @make_token(i64* %165, i64 %167, i64 %168)
  ret i64** %169
unreachable_49:
  br label %end_if_48
end_if_48:
  %170 = call i8* @malloc(i64 8)
  %171 = bitcast i8* %170 to i64*
  %172 = getelementptr inbounds i64, i64* %171, i64 0
  store i64 37, i64* %172
  %173 = load i64, i64* %ptr_start_line
  %174 = load i64, i64* %ptr_start_col
  %175 = call i64** @make_token(i64* %171, i64 %173, i64 %174)
  ret i64** %175
unreachable_50:
  br label %end_if_46
end_if_46:
  %176 = load i64, i64* %ptr_c
  %177 = icmp eq i64 %176, 62
  br i1 %177, label %then_51, label %end_if_52
then_51:
  %178 = load i64**, i64*** %ptr_lex
  %179 = call i64 @peek(i64** %178)
  %180 = icmp eq i64 %179, 61
  br i1 %180, label %then_53, label %end_if_54
then_53:
  %181 = load i64**, i64*** %ptr_lex
  %182 = call i64 @advance(i64** %181)
  %183 = call i8* @malloc(i64 8)
  %184 = bitcast i8* %183 to i64*
  %185 = getelementptr inbounds i64, i64* %184, i64 0
  store i64 40, i64* %185
  %186 = load i64, i64* %ptr_start_line
  %187 = load i64, i64* %ptr_start_col
  %188 = call i64** @make_token(i64* %184, i64 %186, i64 %187)
  ret i64** %188
unreachable_55:
  br label %end_if_54
end_if_54:
  %189 = load i64**, i64*** %ptr_lex
  %190 = call i64 @peek(i64** %189)
  %191 = icmp eq i64 %190, 62
  br i1 %191, label %then_56, label %end_if_57
then_56:
  %192 = load i64**, i64*** %ptr_lex
  %193 = call i64 @advance(i64** %192)
  %194 = call i8* @malloc(i64 8)
  %195 = bitcast i8* %194 to i64*
  %196 = getelementptr inbounds i64, i64* %195, i64 0
  store i64 46, i64* %196
  %197 = load i64, i64* %ptr_start_line
  %198 = load i64, i64* %ptr_start_col
  %199 = call i64** @make_token(i64* %195, i64 %197, i64 %198)
  ret i64** %199
unreachable_58:
  br label %end_if_57
end_if_57:
  %200 = call i8* @malloc(i64 8)
  %201 = bitcast i8* %200 to i64*
  %202 = getelementptr inbounds i64, i64* %201, i64 0
  store i64 39, i64* %202
  %203 = load i64, i64* %ptr_start_line
  %204 = load i64, i64* %ptr_start_col
  %205 = call i64** @make_token(i64* %201, i64 %203, i64 %204)
  ret i64** %205
unreachable_59:
  br label %end_if_52
end_if_52:
  %206 = load i64, i64* %ptr_c
  %207 = icmp eq i64 %206, 94
  br i1 %207, label %then_60, label %end_if_61
then_60:
  %208 = call i8* @malloc(i64 8)
  %209 = bitcast i8* %208 to i64*
  %210 = getelementptr inbounds i64, i64* %209, i64 0
  store i64 48, i64* %210
  %211 = load i64, i64* %ptr_start_line
  %212 = load i64, i64* %ptr_start_col
  %213 = call i64** @make_token(i64* %209, i64 %211, i64 %212)
  ret i64** %213
unreachable_62:
  br label %end_if_61
end_if_61:
  %214 = load i64, i64* %ptr_c
  %215 = icmp eq i64 %214, 63
  br i1 %215, label %then_63, label %end_if_64
then_63:
  %216 = call i8* @malloc(i64 8)
  %217 = bitcast i8* %216 to i64*
  %218 = getelementptr inbounds i64, i64* %217, i64 0
  store i64 51, i64* %218
  %219 = load i64, i64* %ptr_start_line
  %220 = load i64, i64* %ptr_start_col
  %221 = call i64** @make_token(i64* %217, i64 %219, i64 %220)
  ret i64** %221
unreachable_65:
  br label %end_if_64
end_if_64:
  %222 = load i64, i64* %ptr_c
  %223 = icmp eq i64 %222, 123
  br i1 %223, label %then_66, label %end_if_67
then_66:
  %224 = call i8* @malloc(i64 8)
  %225 = bitcast i8* %224 to i64*
  %226 = getelementptr inbounds i64, i64* %225, i64 0
  store i64 53, i64* %226
  %227 = load i64, i64* %ptr_start_line
  %228 = load i64, i64* %ptr_start_col
  %229 = call i64** @make_token(i64* %225, i64 %227, i64 %228)
  ret i64** %229
unreachable_68:
  br label %end_if_67
end_if_67:
  %230 = load i64, i64* %ptr_c
  %231 = icmp eq i64 %230, 125
  br i1 %231, label %then_69, label %end_if_70
then_69:
  %232 = call i8* @malloc(i64 8)
  %233 = bitcast i8* %232 to i64*
  %234 = getelementptr inbounds i64, i64* %233, i64 0
  store i64 54, i64* %234
  %235 = load i64, i64* %ptr_start_line
  %236 = load i64, i64* %ptr_start_col
  %237 = call i64** @make_token(i64* %233, i64 %235, i64 %236)
  ret i64** %237
unreachable_71:
  br label %end_if_70
end_if_70:
  %238 = load i64, i64* %ptr_c
  %239 = icmp eq i64 %238, 91
  br i1 %239, label %then_72, label %end_if_73
then_72:
  %240 = call i8* @malloc(i64 8)
  %241 = bitcast i8* %240 to i64*
  %242 = getelementptr inbounds i64, i64* %241, i64 0
  store i64 55, i64* %242
  %243 = load i64, i64* %ptr_start_line
  %244 = load i64, i64* %ptr_start_col
  %245 = call i64** @make_token(i64* %241, i64 %243, i64 %244)
  ret i64** %245
unreachable_74:
  br label %end_if_73
end_if_73:
  %246 = load i64, i64* %ptr_c
  %247 = icmp eq i64 %246, 93
  br i1 %247, label %then_75, label %end_if_76
then_75:
  %248 = call i8* @malloc(i64 8)
  %249 = bitcast i8* %248 to i64*
  %250 = getelementptr inbounds i64, i64* %249, i64 0
  store i64 56, i64* %250
  %251 = load i64, i64* %ptr_start_line
  %252 = load i64, i64* %ptr_start_col
  %253 = call i64** @make_token(i64* %249, i64 %251, i64 %252)
  ret i64** %253
unreachable_77:
  br label %end_if_76
end_if_76:
  %254 = load i64, i64* %ptr_c
  %255 = icmp eq i64 %254, 40
  br i1 %255, label %then_78, label %end_if_79
then_78:
  %256 = call i8* @malloc(i64 8)
  %257 = bitcast i8* %256 to i64*
  %258 = getelementptr inbounds i64, i64* %257, i64 0
  store i64 57, i64* %258
  %259 = load i64, i64* %ptr_start_line
  %260 = load i64, i64* %ptr_start_col
  %261 = call i64** @make_token(i64* %257, i64 %259, i64 %260)
  ret i64** %261
unreachable_80:
  br label %end_if_79
end_if_79:
  %262 = load i64, i64* %ptr_c
  %263 = icmp eq i64 %262, 41
  br i1 %263, label %then_81, label %end_if_82
then_81:
  %264 = call i8* @malloc(i64 8)
  %265 = bitcast i8* %264 to i64*
  %266 = getelementptr inbounds i64, i64* %265, i64 0
  store i64 58, i64* %266
  %267 = load i64, i64* %ptr_start_line
  %268 = load i64, i64* %ptr_start_col
  %269 = call i64** @make_token(i64* %265, i64 %267, i64 %268)
  ret i64** %269
unreachable_83:
  br label %end_if_82
end_if_82:
  %270 = load i64, i64* %ptr_c
  %271 = icmp eq i64 %270, 58
  br i1 %271, label %then_84, label %end_if_85
then_84:
  %272 = call i8* @malloc(i64 8)
  %273 = bitcast i8* %272 to i64*
  %274 = getelementptr inbounds i64, i64* %273, i64 0
  store i64 59, i64* %274
  %275 = load i64, i64* %ptr_start_line
  %276 = load i64, i64* %ptr_start_col
  %277 = call i64** @make_token(i64* %273, i64 %275, i64 %276)
  ret i64** %277
unreachable_86:
  br label %end_if_85
end_if_85:
  %278 = load i64, i64* %ptr_c
  %279 = icmp eq i64 %278, 44
  br i1 %279, label %then_87, label %end_if_88
then_87:
  %280 = call i8* @malloc(i64 8)
  %281 = bitcast i8* %280 to i64*
  %282 = getelementptr inbounds i64, i64* %281, i64 0
  store i64 60, i64* %282
  %283 = load i64, i64* %ptr_start_line
  %284 = load i64, i64* %ptr_start_col
  %285 = call i64** @make_token(i64* %281, i64 %283, i64 %284)
  ret i64** %285
unreachable_89:
  br label %end_if_88
end_if_88:
  %286 = load i64, i64* %ptr_c
  %287 = icmp eq i64 %286, 46
  br i1 %287, label %then_90, label %end_if_91
then_90:
  %288 = load i64**, i64*** %ptr_lex
  %289 = call i64 @peek(i64** %288)
  %290 = icmp eq i64 %289, 46
  br i1 %290, label %then_92, label %end_if_93
then_92:
  %291 = load i64**, i64*** %ptr_lex
  %292 = call i64 @advance(i64** %291)
  %293 = call i8* @malloc(i64 8)
  %294 = bitcast i8* %293 to i64*
  %295 = getelementptr inbounds i64, i64* %294, i64 0
  store i64 62, i64* %295
  %296 = load i64, i64* %ptr_start_line
  %297 = load i64, i64* %ptr_start_col
  %298 = call i64** @make_token(i64* %294, i64 %296, i64 %297)
  ret i64** %298
unreachable_94:
  br label %end_if_93
end_if_93:
  %299 = call i8* @malloc(i64 8)
  %300 = bitcast i8* %299 to i64*
  %301 = getelementptr inbounds i64, i64* %300, i64 0
  store i64 61, i64* %301
  %302 = load i64, i64* %ptr_start_line
  %303 = load i64, i64* %ptr_start_col
  %304 = call i64** @make_token(i64* %300, i64 %302, i64 %303)
  ret i64** %304
unreachable_95:
  br label %end_if_91
end_if_91:
  %305 = load i64, i64* %ptr_c
  %306 = icmp eq i64 %305, 34
  br i1 %306, label %then_96, label %end_if_97
then_96:
  %307 = load i64**, i64*** %ptr_lex
  %308 = bitcast i64** %307 to i64*
  %309 = getelementptr inbounds i64, i64* %308, i64 1
  %310 = bitcast i64* %309 to i64*
  %311 = load i64, i64* %310, align 8
  store i64 %311, i64* %ptr_start_pos
  br label %while_cond_98
while_cond_98:
  %312 = load i64**, i64*** %ptr_lex
  %313 = call i1 @is_at_end(i64** %312)
  %314 = xor i1 %313, 1
  %315 = load i64**, i64*** %ptr_lex
  %316 = call i64 @peek(i64** %315)
  %317 = icmp ne i64 %316, 34
  %318 = and i1 %314, %317
  br i1 %318, label %while_body_99, label %while_end_100
while_body_99:
  %319 = load i64**, i64*** %ptr_lex
  %320 = call i64 @peek(i64** %319)
  %321 = icmp eq i64 %320, 92
  br i1 %321, label %then_101, label %end_if_102
then_101:
  %322 = load i64**, i64*** %ptr_lex
  %323 = call i64 @advance(i64** %322)
  br label %end_if_102
end_if_102:
  %324 = load i64**, i64*** %ptr_lex
  %325 = call i64 @advance(i64** %324)
  br label %while_cond_98
while_end_100:
  %326 = load i64**, i64*** %ptr_lex
  %327 = call i1 @is_at_end(i64** %326)
  br i1 %327, label %then_103, label %end_if_104
then_103:
  %328 = call i8* @malloc(i64 16)
  %329 = bitcast i8* %328 to i64*
  %330 = getelementptr inbounds i64, i64* %329, i64 0
  store i64 63, i64* %330
  %331 = getelementptr inbounds i64, i64* %329, i64 1
  %332 = bitcast i64* %331 to i8**
  store i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i64 0, i64 0), i8** %332
  %333 = load i64, i64* %ptr_start_line
  %334 = load i64, i64* %ptr_start_col
  %335 = call i64** @make_token(i64* %329, i64 %333, i64 %334)
  ret i64** %335
unreachable_105:
  br label %end_if_104
end_if_104:
  %336 = load i64**, i64*** %ptr_lex
  %337 = bitcast i64** %336 to i64*
  %338 = getelementptr inbounds i64, i64* %337, i64 1
  %339 = bitcast i64* %338 to i64*
  %340 = load i64, i64* %339, align 8
  store i64 %340, i64* %ptr_end_pos
  %341 = load i64**, i64*** %ptr_lex
  %342 = call i64 @advance(i64** %341)
  %343 = load i64**, i64*** %ptr_lex
  %344 = bitcast i64** %343 to i64*
  %345 = getelementptr inbounds i64, i64* %344, i64 0
  %346 = bitcast i64* %345 to i8**
  %347 = load i8*, i8** %346, align 8
  %348 = load i64, i64* %ptr_start_pos
  %349 = load i64, i64* %ptr_end_pos
  %350 = sub nsw i64 %349, %348
  %351 = add nsw i64 %350, 1
  %352 = call i8* @malloc(i64 %351)
  %353 = getelementptr inbounds i8, i8* %347, i64 %348
  %354 = call i8* @strncpy(i8* %352, i8* %353, i64 %350)
  %355 = getelementptr inbounds i8, i8* %352, i64 %350
  store i8 0, i8* %355, align 1
  store i8* %352, i8** %ptr_str_val
  %356 = call i8* @malloc(i64 16)
  %357 = bitcast i8* %356 to i64*
  %358 = getelementptr inbounds i64, i64* %357, i64 0
  store i64 28, i64* %358
  %359 = load i8*, i8** %ptr_str_val
  %360 = getelementptr inbounds i64, i64* %357, i64 1
  %361 = bitcast i64* %360 to i8**
  store i8* %359, i8** %361
  %362 = load i64, i64* %ptr_start_line
  %363 = load i64, i64* %ptr_start_col
  %364 = call i64** @make_token(i64* %357, i64 %362, i64 %363)
  ret i64** %364
unreachable_106:
  br label %end_if_97
end_if_97:
  %365 = load i64, i64* %ptr_c
  %366 = icmp eq i64 %365, 39
  br i1 %366, label %then_107, label %end_if_108
then_107:
  %367 = load i64**, i64*** %ptr_lex
  %368 = call i1 @is_at_end(i64** %367)
  br i1 %368, label %then_109, label %end_if_110
then_109:
  %369 = call i8* @malloc(i64 16)
  %370 = bitcast i8* %369 to i64*
  %371 = getelementptr inbounds i64, i64* %370, i64 0
  store i64 63, i64* %371
  %372 = getelementptr inbounds i64, i64* %370, i64 1
  %373 = bitcast i64* %372 to i8**
  store i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0), i8** %373
  %374 = load i64, i64* %ptr_start_line
  %375 = load i64, i64* %ptr_start_col
  %376 = call i64** @make_token(i64* %370, i64 %374, i64 %375)
  ret i64** %376
unreachable_111:
  br label %end_if_110
end_if_110:
  %377 = load i64**, i64*** %ptr_lex
  %378 = call i64 @advance(i64** %377)
  store i64 %378, i64* %ptr_char_val
  %379 = load i64, i64* %ptr_char_val
  %380 = icmp eq i64 %379, 92
  br i1 %380, label %then_112, label %end_if_113
then_112:
  %381 = load i64**, i64*** %ptr_lex
  %382 = call i1 @is_at_end(i64** %381)
  br i1 %382, label %then_114, label %end_if_115
then_114:
  %383 = call i8* @malloc(i64 16)
  %384 = bitcast i8* %383 to i64*
  %385 = getelementptr inbounds i64, i64* %384, i64 0
  store i64 63, i64* %385
  %386 = getelementptr inbounds i64, i64* %384, i64 1
  %387 = bitcast i64* %386 to i8**
  store i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i64 0, i64 0), i8** %387
  %388 = load i64, i64* %ptr_start_line
  %389 = load i64, i64* %ptr_start_col
  %390 = call i64** @make_token(i64* %384, i64 %388, i64 %389)
  ret i64** %390
unreachable_116:
  br label %end_if_115
end_if_115:
  %391 = load i64**, i64*** %ptr_lex
  %392 = call i64 @advance(i64** %391)
  store i64 %392, i64* %ptr_esc
  %393 = load i64, i64* %ptr_esc
  %394 = icmp eq i64 %393, 110
  br i1 %394, label %then_117, label %end_if_118
then_117:
  store i64 10, i64* %ptr_char_val
  br label %end_if_118
end_if_118:
  %395 = load i64, i64* %ptr_esc
  %396 = icmp eq i64 %395, 114
  br i1 %396, label %then_119, label %end_if_120
then_119:
  store i64 13, i64* %ptr_char_val
  br label %end_if_120
end_if_120:
  %397 = load i64, i64* %ptr_esc
  %398 = icmp eq i64 %397, 116
  br i1 %398, label %then_121, label %end_if_122
then_121:
  store i64 9, i64* %ptr_char_val
  br label %end_if_122
end_if_122:
  %399 = load i64, i64* %ptr_esc
  %400 = icmp eq i64 %399, 92
  br i1 %400, label %then_123, label %end_if_124
then_123:
  store i64 92, i64* %ptr_char_val
  br label %end_if_124
end_if_124:
  %401 = load i64, i64* %ptr_esc
  %402 = icmp eq i64 %401, 34
  br i1 %402, label %then_125, label %end_if_126
then_125:
  store i64 34, i64* %ptr_char_val
  br label %end_if_126
end_if_126:
  %403 = load i64, i64* %ptr_esc
  %404 = icmp eq i64 %403, 39
  br i1 %404, label %then_127, label %end_if_128
then_127:
  store i64 39, i64* %ptr_char_val
  br label %end_if_128
end_if_128:
  %405 = load i64, i64* %ptr_esc
  %406 = icmp eq i64 %405, 48
  br i1 %406, label %then_129, label %end_if_130
then_129:
  store i64 0, i64* %ptr_char_val
  br label %end_if_130
end_if_130:
  %407 = load i64, i64* %ptr_esc
  %408 = icmp ne i64 %407, 110
  %409 = load i64, i64* %ptr_esc
  %410 = icmp ne i64 %409, 114
  %411 = and i1 %408, %410
  %412 = load i64, i64* %ptr_esc
  %413 = icmp ne i64 %412, 116
  %414 = and i1 %411, %413
  %415 = load i64, i64* %ptr_esc
  %416 = icmp ne i64 %415, 92
  %417 = and i1 %414, %416
  %418 = load i64, i64* %ptr_esc
  %419 = icmp ne i64 %418, 34
  %420 = and i1 %417, %419
  %421 = load i64, i64* %ptr_esc
  %422 = icmp ne i64 %421, 39
  %423 = and i1 %420, %422
  %424 = load i64, i64* %ptr_esc
  %425 = icmp ne i64 %424, 48
  %426 = and i1 %423, %425
  br i1 %426, label %then_131, label %end_if_132
then_131:
  %427 = call i8* @malloc(i64 16)
  %428 = bitcast i8* %427 to i64*
  %429 = getelementptr inbounds i64, i64* %428, i64 0
  store i64 63, i64* %429
  %430 = getelementptr inbounds i64, i64* %428, i64 1
  %431 = bitcast i64* %430 to i8**
  store i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.4, i64 0, i64 0), i8** %431
  %432 = load i64, i64* %ptr_start_line
  %433 = load i64, i64* %ptr_start_col
  %434 = call i64** @make_token(i64* %428, i64 %432, i64 %433)
  ret i64** %434
unreachable_133:
  br label %end_if_132
end_if_132:
  br label %end_if_113
end_if_113:
  %435 = load i64**, i64*** %ptr_lex
  %436 = call i64 @peek(i64** %435)
  %437 = icmp eq i64 %436, 39
  br i1 %437, label %then_134, label %end_if_135
then_134:
  %438 = load i64**, i64*** %ptr_lex
  %439 = call i64 @advance(i64** %438)
  %440 = call i8* @malloc(i64 16)
  %441 = bitcast i8* %440 to i64*
  %442 = getelementptr inbounds i64, i64* %441, i64 0
  store i64 29, i64* %442
  %443 = load i64, i64* %ptr_char_val
  %444 = getelementptr inbounds i64, i64* %441, i64 1
  %445 = bitcast i64* %444 to i64*
  store i64 %443, i64* %445
  %446 = load i64, i64* %ptr_start_line
  %447 = load i64, i64* %ptr_start_col
  %448 = call i64** @make_token(i64* %441, i64 %446, i64 %447)
  ret i64** %448
unreachable_136:
  br label %end_if_135
end_if_135:
  %449 = call i8* @malloc(i64 16)
  %450 = bitcast i8* %449 to i64*
  %451 = getelementptr inbounds i64, i64* %450, i64 0
  store i64 63, i64* %451
  %452 = getelementptr inbounds i64, i64* %450, i64 1
  %453 = bitcast i64* %452 to i8**
  store i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.5, i64 0, i64 0), i8** %453
  %454 = load i64, i64* %ptr_start_line
  %455 = load i64, i64* %ptr_start_col
  %456 = call i64** @make_token(i64* %450, i64 %454, i64 %455)
  ret i64** %456
unreachable_137:
  br label %end_if_108
end_if_108:
  %457 = load i64, i64* %ptr_c
  %458 = call i1 @is_alpha(i64 %457)
  br i1 %458, label %then_138, label %end_if_139
then_138:
  %459 = load i64**, i64*** %ptr_lex
  %460 = bitcast i64** %459 to i64*
  %461 = getelementptr inbounds i64, i64* %460, i64 1
  %462 = bitcast i64* %461 to i64*
  %463 = load i64, i64* %462, align 8
  %464 = sub nsw i64 %463, 1
  store i64 %464, i64* %ptr_start_pos
  br label %while_cond_140
while_cond_140:
  %465 = load i64**, i64*** %ptr_lex
  %466 = call i64 @peek(i64** %465)
  %467 = call i1 @is_alphanumeric(i64 %466)
  br i1 %467, label %while_body_141, label %while_end_142
while_body_141:
  %468 = load i64**, i64*** %ptr_lex
  %469 = call i64 @advance(i64** %468)
  br label %while_cond_140
while_end_142:
  %470 = load i64**, i64*** %ptr_lex
  %471 = bitcast i64** %470 to i64*
  %472 = getelementptr inbounds i64, i64* %471, i64 0
  %473 = bitcast i64* %472 to i8**
  %474 = load i8*, i8** %473, align 8
  %475 = load i64**, i64*** %ptr_lex
  %476 = bitcast i64** %475 to i64*
  %477 = getelementptr inbounds i64, i64* %476, i64 1
  %478 = bitcast i64* %477 to i64*
  %479 = load i64, i64* %478, align 8
  %480 = load i64, i64* %ptr_start_pos
  %481 = sub nsw i64 %479, %480
  %482 = add nsw i64 %481, 1
  %483 = call i8* @malloc(i64 %482)
  %484 = getelementptr inbounds i8, i8* %474, i64 %480
  %485 = call i8* @strncpy(i8* %483, i8* %484, i64 %481)
  %486 = getelementptr inbounds i8, i8* %483, i64 %481
  store i8 0, i8* %486, align 1
  store i8* %483, i8** %ptr_ident
  %487 = load i8*, i8** %ptr_ident
  %488 = call i32 @strcmp(i8* %487, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0))
  %489 = icmp eq i32 %488, 0
  br i1 %489, label %then_143, label %end_if_144
then_143:
  %490 = call i8* @malloc(i64 8)
  %491 = bitcast i8* %490 to i64*
  %492 = getelementptr inbounds i64, i64* %491, i64 0
  store i64 0, i64* %492
  %493 = load i64, i64* %ptr_start_line
  %494 = load i64, i64* %ptr_start_col
  %495 = call i64** @make_token(i64* %491, i64 %493, i64 %494)
  ret i64** %495
unreachable_145:
  br label %end_if_144
end_if_144:
  %496 = load i8*, i8** %ptr_ident
  %497 = call i32 @strcmp(i8* %496, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0))
  %498 = icmp eq i32 %497, 0
  br i1 %498, label %then_146, label %end_if_147
then_146:
  %499 = call i8* @malloc(i64 8)
  %500 = bitcast i8* %499 to i64*
  %501 = getelementptr inbounds i64, i64* %500, i64 0
  store i64 1, i64* %501
  %502 = load i64, i64* %ptr_start_line
  %503 = load i64, i64* %ptr_start_col
  %504 = call i64** @make_token(i64* %500, i64 %502, i64 %503)
  ret i64** %504
unreachable_148:
  br label %end_if_147
end_if_147:
  %505 = load i8*, i8** %ptr_ident
  %506 = call i32 @strcmp(i8* %505, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0))
  %507 = icmp eq i32 %506, 0
  br i1 %507, label %then_149, label %end_if_150
then_149:
  %508 = call i8* @malloc(i64 8)
  %509 = bitcast i8* %508 to i64*
  %510 = getelementptr inbounds i64, i64* %509, i64 0
  store i64 2, i64* %510
  %511 = load i64, i64* %ptr_start_line
  %512 = load i64, i64* %ptr_start_col
  %513 = call i64** @make_token(i64* %509, i64 %511, i64 %512)
  ret i64** %513
unreachable_151:
  br label %end_if_150
end_if_150:
  %514 = load i8*, i8** %ptr_ident
  %515 = call i32 @strcmp(i8* %514, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0))
  %516 = icmp eq i32 %515, 0
  br i1 %516, label %then_152, label %end_if_153
then_152:
  %517 = call i8* @malloc(i64 8)
  %518 = bitcast i8* %517 to i64*
  %519 = getelementptr inbounds i64, i64* %518, i64 0
  store i64 3, i64* %519
  %520 = load i64, i64* %ptr_start_line
  %521 = load i64, i64* %ptr_start_col
  %522 = call i64** @make_token(i64* %518, i64 %520, i64 %521)
  ret i64** %522
unreachable_154:
  br label %end_if_153
end_if_153:
  %523 = load i8*, i8** %ptr_ident
  %524 = call i32 @strcmp(i8* %523, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i64 0, i64 0))
  %525 = icmp eq i32 %524, 0
  br i1 %525, label %then_155, label %end_if_156
then_155:
  %526 = call i8* @malloc(i64 8)
  %527 = bitcast i8* %526 to i64*
  %528 = getelementptr inbounds i64, i64* %527, i64 0
  store i64 4, i64* %528
  %529 = load i64, i64* %ptr_start_line
  %530 = load i64, i64* %ptr_start_col
  %531 = call i64** @make_token(i64* %527, i64 %529, i64 %530)
  ret i64** %531
unreachable_157:
  br label %end_if_156
end_if_156:
  %532 = load i8*, i8** %ptr_ident
  %533 = call i32 @strcmp(i8* %532, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i64 0, i64 0))
  %534 = icmp eq i32 %533, 0
  br i1 %534, label %then_158, label %end_if_159
then_158:
  %535 = call i8* @malloc(i64 8)
  %536 = bitcast i8* %535 to i64*
  %537 = getelementptr inbounds i64, i64* %536, i64 0
  store i64 5, i64* %537
  %538 = load i64, i64* %ptr_start_line
  %539 = load i64, i64* %ptr_start_col
  %540 = call i64** @make_token(i64* %536, i64 %538, i64 %539)
  ret i64** %540
unreachable_160:
  br label %end_if_159
end_if_159:
  %541 = load i8*, i8** %ptr_ident
  %542 = call i32 @strcmp(i8* %541, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i64 0, i64 0))
  %543 = icmp eq i32 %542, 0
  br i1 %543, label %then_161, label %end_if_162
then_161:
  %544 = call i8* @malloc(i64 8)
  %545 = bitcast i8* %544 to i64*
  %546 = getelementptr inbounds i64, i64* %545, i64 0
  store i64 6, i64* %546
  %547 = load i64, i64* %ptr_start_line
  %548 = load i64, i64* %ptr_start_col
  %549 = call i64** @make_token(i64* %545, i64 %547, i64 %548)
  ret i64** %549
unreachable_163:
  br label %end_if_162
end_if_162:
  %550 = load i8*, i8** %ptr_ident
  %551 = call i32 @strcmp(i8* %550, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i64 0, i64 0))
  %552 = icmp eq i32 %551, 0
  br i1 %552, label %then_164, label %end_if_165
then_164:
  %553 = call i8* @malloc(i64 8)
  %554 = bitcast i8* %553 to i64*
  %555 = getelementptr inbounds i64, i64* %554, i64 0
  store i64 7, i64* %555
  %556 = load i64, i64* %ptr_start_line
  %557 = load i64, i64* %ptr_start_col
  %558 = call i64** @make_token(i64* %554, i64 %556, i64 %557)
  ret i64** %558
unreachable_166:
  br label %end_if_165
end_if_165:
  %559 = load i8*, i8** %ptr_ident
  %560 = call i32 @strcmp(i8* %559, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14, i64 0, i64 0))
  %561 = icmp eq i32 %560, 0
  br i1 %561, label %then_167, label %end_if_168
then_167:
  %562 = call i8* @malloc(i64 8)
  %563 = bitcast i8* %562 to i64*
  %564 = getelementptr inbounds i64, i64* %563, i64 0
  store i64 8, i64* %564
  %565 = load i64, i64* %ptr_start_line
  %566 = load i64, i64* %ptr_start_col
  %567 = call i64** @make_token(i64* %563, i64 %565, i64 %566)
  ret i64** %567
unreachable_169:
  br label %end_if_168
end_if_168:
  %568 = load i8*, i8** %ptr_ident
  %569 = call i32 @strcmp(i8* %568, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i64 0, i64 0))
  %570 = icmp eq i32 %569, 0
  br i1 %570, label %then_170, label %end_if_171
then_170:
  %571 = call i8* @malloc(i64 8)
  %572 = bitcast i8* %571 to i64*
  %573 = getelementptr inbounds i64, i64* %572, i64 0
  store i64 9, i64* %573
  %574 = load i64, i64* %ptr_start_line
  %575 = load i64, i64* %ptr_start_col
  %576 = call i64** @make_token(i64* %572, i64 %574, i64 %575)
  ret i64** %576
unreachable_172:
  br label %end_if_171
end_if_171:
  %577 = load i8*, i8** %ptr_ident
  %578 = call i32 @strcmp(i8* %577, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.16, i64 0, i64 0))
  %579 = icmp eq i32 %578, 0
  br i1 %579, label %then_173, label %end_if_174
then_173:
  %580 = call i8* @malloc(i64 8)
  %581 = bitcast i8* %580 to i64*
  %582 = getelementptr inbounds i64, i64* %581, i64 0
  store i64 10, i64* %582
  %583 = load i64, i64* %ptr_start_line
  %584 = load i64, i64* %ptr_start_col
  %585 = call i64** @make_token(i64* %581, i64 %583, i64 %584)
  ret i64** %585
unreachable_175:
  br label %end_if_174
end_if_174:
  %586 = load i8*, i8** %ptr_ident
  %587 = call i32 @strcmp(i8* %586, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.17, i64 0, i64 0))
  %588 = icmp eq i32 %587, 0
  br i1 %588, label %then_176, label %end_if_177
then_176:
  %589 = call i8* @malloc(i64 8)
  %590 = bitcast i8* %589 to i64*
  %591 = getelementptr inbounds i64, i64* %590, i64 0
  store i64 11, i64* %591
  %592 = load i64, i64* %ptr_start_line
  %593 = load i64, i64* %ptr_start_col
  %594 = call i64** @make_token(i64* %590, i64 %592, i64 %593)
  ret i64** %594
unreachable_178:
  br label %end_if_177
end_if_177:
  %595 = load i8*, i8** %ptr_ident
  %596 = call i32 @strcmp(i8* %595, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.18, i64 0, i64 0))
  %597 = icmp eq i32 %596, 0
  br i1 %597, label %then_179, label %end_if_180
then_179:
  %598 = call i8* @malloc(i64 8)
  %599 = bitcast i8* %598 to i64*
  %600 = getelementptr inbounds i64, i64* %599, i64 0
  store i64 12, i64* %600
  %601 = load i64, i64* %ptr_start_line
  %602 = load i64, i64* %ptr_start_col
  %603 = call i64** @make_token(i64* %599, i64 %601, i64 %602)
  ret i64** %603
unreachable_181:
  br label %end_if_180
end_if_180:
  %604 = load i8*, i8** %ptr_ident
  %605 = call i32 @strcmp(i8* %604, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19, i64 0, i64 0))
  %606 = icmp eq i32 %605, 0
  br i1 %606, label %then_182, label %end_if_183
then_182:
  %607 = call i8* @malloc(i64 8)
  %608 = bitcast i8* %607 to i64*
  %609 = getelementptr inbounds i64, i64* %608, i64 0
  store i64 13, i64* %609
  %610 = load i64, i64* %ptr_start_line
  %611 = load i64, i64* %ptr_start_col
  %612 = call i64** @make_token(i64* %608, i64 %610, i64 %611)
  ret i64** %612
unreachable_184:
  br label %end_if_183
end_if_183:
  %613 = load i8*, i8** %ptr_ident
  %614 = call i32 @strcmp(i8* %613, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.20, i64 0, i64 0))
  %615 = icmp eq i32 %614, 0
  br i1 %615, label %then_185, label %end_if_186
then_185:
  %616 = call i8* @malloc(i64 8)
  %617 = bitcast i8* %616 to i64*
  %618 = getelementptr inbounds i64, i64* %617, i64 0
  store i64 14, i64* %618
  %619 = load i64, i64* %ptr_start_line
  %620 = load i64, i64* %ptr_start_col
  %621 = call i64** @make_token(i64* %617, i64 %619, i64 %620)
  ret i64** %621
unreachable_187:
  br label %end_if_186
end_if_186:
  %622 = load i8*, i8** %ptr_ident
  %623 = call i32 @strcmp(i8* %622, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.21, i64 0, i64 0))
  %624 = icmp eq i32 %623, 0
  br i1 %624, label %then_188, label %end_if_189
then_188:
  %625 = call i8* @malloc(i64 8)
  %626 = bitcast i8* %625 to i64*
  %627 = getelementptr inbounds i64, i64* %626, i64 0
  store i64 15, i64* %627
  %628 = load i64, i64* %ptr_start_line
  %629 = load i64, i64* %ptr_start_col
  %630 = call i64** @make_token(i64* %626, i64 %628, i64 %629)
  ret i64** %630
unreachable_190:
  br label %end_if_189
end_if_189:
  %631 = load i8*, i8** %ptr_ident
  %632 = call i32 @strcmp(i8* %631, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.22, i64 0, i64 0))
  %633 = icmp eq i32 %632, 0
  br i1 %633, label %then_191, label %end_if_192
then_191:
  %634 = call i8* @malloc(i64 8)
  %635 = bitcast i8* %634 to i64*
  %636 = getelementptr inbounds i64, i64* %635, i64 0
  store i64 49, i64* %636
  %637 = load i64, i64* %ptr_start_line
  %638 = load i64, i64* %ptr_start_col
  %639 = call i64** @make_token(i64* %635, i64 %637, i64 %638)
  ret i64** %639
unreachable_193:
  br label %end_if_192
end_if_192:
  %640 = load i8*, i8** %ptr_ident
  %641 = call i32 @strcmp(i8* %640, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.23, i64 0, i64 0))
  %642 = icmp eq i32 %641, 0
  br i1 %642, label %then_194, label %end_if_195
then_194:
  %643 = call i8* @malloc(i64 8)
  %644 = bitcast i8* %643 to i64*
  %645 = getelementptr inbounds i64, i64* %644, i64 0
  store i64 50, i64* %645
  %646 = load i64, i64* %ptr_start_line
  %647 = load i64, i64* %ptr_start_col
  %648 = call i64** @make_token(i64* %644, i64 %646, i64 %647)
  ret i64** %648
unreachable_196:
  br label %end_if_195
end_if_195:
  %649 = load i8*, i8** %ptr_ident
  %650 = call i32 @strcmp(i8* %649, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i64 0, i64 0))
  %651 = icmp eq i32 %650, 0
  br i1 %651, label %then_197, label %end_if_198
then_197:
  %652 = call i8* @malloc(i64 8)
  %653 = bitcast i8* %652 to i64*
  %654 = getelementptr inbounds i64, i64* %653, i64 0
  store i64 52, i64* %654
  %655 = load i64, i64* %ptr_start_line
  %656 = load i64, i64* %ptr_start_col
  %657 = call i64** @make_token(i64* %653, i64 %655, i64 %656)
  ret i64** %657
unreachable_199:
  br label %end_if_198
end_if_198:
  %658 = load i8*, i8** %ptr_ident
  %659 = call i32 @strcmp(i8* %658, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.25, i64 0, i64 0))
  %660 = icmp eq i32 %659, 0
  br i1 %660, label %then_200, label %end_if_201
then_200:
  %661 = call i8* @malloc(i64 8)
  %662 = bitcast i8* %661 to i64*
  %663 = getelementptr inbounds i64, i64* %662, i64 0
  store i64 16, i64* %663
  %664 = load i64, i64* %ptr_start_line
  %665 = load i64, i64* %ptr_start_col
  %666 = call i64** @make_token(i64* %662, i64 %664, i64 %665)
  ret i64** %666
unreachable_202:
  br label %end_if_201
end_if_201:
  %667 = load i8*, i8** %ptr_ident
  %668 = call i32 @strcmp(i8* %667, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.26, i64 0, i64 0))
  %669 = icmp eq i32 %668, 0
  br i1 %669, label %then_203, label %end_if_204
then_203:
  %670 = call i8* @malloc(i64 8)
  %671 = bitcast i8* %670 to i64*
  %672 = getelementptr inbounds i64, i64* %671, i64 0
  store i64 17, i64* %672
  %673 = load i64, i64* %ptr_start_line
  %674 = load i64, i64* %ptr_start_col
  %675 = call i64** @make_token(i64* %671, i64 %673, i64 %674)
  ret i64** %675
unreachable_205:
  br label %end_if_204
end_if_204:
  %676 = load i8*, i8** %ptr_ident
  %677 = call i32 @strcmp(i8* %676, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.27, i64 0, i64 0))
  %678 = icmp eq i32 %677, 0
  br i1 %678, label %then_206, label %end_if_207
then_206:
  %679 = call i8* @malloc(i64 8)
  %680 = bitcast i8* %679 to i64*
  %681 = getelementptr inbounds i64, i64* %680, i64 0
  store i64 18, i64* %681
  %682 = load i64, i64* %ptr_start_line
  %683 = load i64, i64* %ptr_start_col
  %684 = call i64** @make_token(i64* %680, i64 %682, i64 %683)
  ret i64** %684
unreachable_208:
  br label %end_if_207
end_if_207:
  %685 = load i8*, i8** %ptr_ident
  %686 = call i32 @strcmp(i8* %685, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.28, i64 0, i64 0))
  %687 = icmp eq i32 %686, 0
  br i1 %687, label %then_209, label %end_if_210
then_209:
  %688 = call i8* @malloc(i64 8)
  %689 = bitcast i8* %688 to i64*
  %690 = getelementptr inbounds i64, i64* %689, i64 0
  store i64 19, i64* %690
  %691 = load i64, i64* %ptr_start_line
  %692 = load i64, i64* %ptr_start_col
  %693 = call i64** @make_token(i64* %689, i64 %691, i64 %692)
  ret i64** %693
unreachable_211:
  br label %end_if_210
end_if_210:
  %694 = load i8*, i8** %ptr_ident
  %695 = call i32 @strcmp(i8* %694, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.29, i64 0, i64 0))
  %696 = icmp eq i32 %695, 0
  br i1 %696, label %then_212, label %end_if_213
then_212:
  %697 = call i8* @malloc(i64 8)
  %698 = bitcast i8* %697 to i64*
  %699 = getelementptr inbounds i64, i64* %698, i64 0
  store i64 20, i64* %699
  %700 = load i64, i64* %ptr_start_line
  %701 = load i64, i64* %ptr_start_col
  %702 = call i64** @make_token(i64* %698, i64 %700, i64 %701)
  ret i64** %702
unreachable_214:
  br label %end_if_213
end_if_213:
  %703 = load i8*, i8** %ptr_ident
  %704 = call i32 @strcmp(i8* %703, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30, i64 0, i64 0))
  %705 = icmp eq i32 %704, 0
  br i1 %705, label %then_215, label %end_if_216
then_215:
  %706 = call i8* @malloc(i64 8)
  %707 = bitcast i8* %706 to i64*
  %708 = getelementptr inbounds i64, i64* %707, i64 0
  store i64 21, i64* %708
  %709 = load i64, i64* %ptr_start_line
  %710 = load i64, i64* %ptr_start_col
  %711 = call i64** @make_token(i64* %707, i64 %709, i64 %710)
  ret i64** %711
unreachable_217:
  br label %end_if_216
end_if_216:
  %712 = load i8*, i8** %ptr_ident
  %713 = call i32 @strcmp(i8* %712, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.31, i64 0, i64 0))
  %714 = icmp eq i32 %713, 0
  br i1 %714, label %then_218, label %end_if_219
then_218:
  %715 = call i8* @malloc(i64 8)
  %716 = bitcast i8* %715 to i64*
  %717 = getelementptr inbounds i64, i64* %716, i64 0
  store i64 22, i64* %717
  %718 = load i64, i64* %ptr_start_line
  %719 = load i64, i64* %ptr_start_col
  %720 = call i64** @make_token(i64* %716, i64 %718, i64 %719)
  ret i64** %720
unreachable_220:
  br label %end_if_219
end_if_219:
  %721 = load i8*, i8** %ptr_ident
  %722 = call i32 @strcmp(i8* %721, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.32, i64 0, i64 0))
  %723 = icmp eq i32 %722, 0
  br i1 %723, label %then_221, label %end_if_222
then_221:
  %724 = call i8* @malloc(i64 8)
  %725 = bitcast i8* %724 to i64*
  %726 = getelementptr inbounds i64, i64* %725, i64 0
  store i64 23, i64* %726
  %727 = load i64, i64* %ptr_start_line
  %728 = load i64, i64* %ptr_start_col
  %729 = call i64** @make_token(i64* %725, i64 %727, i64 %728)
  ret i64** %729
unreachable_223:
  br label %end_if_222
end_if_222:
  %730 = load i8*, i8** %ptr_ident
  %731 = call i32 @strcmp(i8* %730, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.33, i64 0, i64 0))
  %732 = icmp eq i32 %731, 0
  br i1 %732, label %then_224, label %end_if_225
then_224:
  %733 = call i8* @malloc(i64 8)
  %734 = bitcast i8* %733 to i64*
  %735 = getelementptr inbounds i64, i64* %734, i64 0
  store i64 24, i64* %735
  %736 = load i64, i64* %ptr_start_line
  %737 = load i64, i64* %ptr_start_col
  %738 = call i64** @make_token(i64* %734, i64 %736, i64 %737)
  ret i64** %738
unreachable_226:
  br label %end_if_225
end_if_225:
  %739 = call i8* @malloc(i64 16)
  %740 = bitcast i8* %739 to i64*
  %741 = getelementptr inbounds i64, i64* %740, i64 0
  store i64 25, i64* %741
  %742 = load i8*, i8** %ptr_ident
  %743 = getelementptr inbounds i64, i64* %740, i64 1
  %744 = bitcast i64* %743 to i8**
  store i8* %742, i8** %744
  %745 = load i64, i64* %ptr_start_line
  %746 = load i64, i64* %ptr_start_col
  %747 = call i64** @make_token(i64* %740, i64 %745, i64 %746)
  ret i64** %747
unreachable_227:
  br label %end_if_139
end_if_139:
  %748 = load i64, i64* %ptr_c
  %749 = call i1 @is_digit(i64 %748)
  br i1 %749, label %then_228, label %end_if_229
then_228:
  %750 = load i64, i64* %ptr_c
  %751 = sub nsw i64 %750, 48
  store i64 %751, i64* %ptr_val_int
  store i1 0, i1* %ptr_is_float
  store double 0.0, double* %ptr_val_float
  store double 0.1, double* %ptr_fractional_mult
  br label %while_cond_230
while_cond_230:
  %752 = load i64**, i64*** %ptr_lex
  %753 = call i1 @is_at_end(i64** %752)
  %754 = xor i1 %753, 1
  br i1 %754, label %while_body_231, label %while_end_232
while_body_231:
  %755 = load i64**, i64*** %ptr_lex
  %756 = call i64 @peek(i64** %755)
  store i64 %756, i64* %ptr_next_c
  store i1 0, i1* %ptr_matched
  %757 = load i64, i64* %ptr_next_c
  %758 = call i1 @is_digit(i64 %757)
  br i1 %758, label %then_233, label %end_if_234
then_233:
  %759 = load i64**, i64*** %ptr_lex
  %760 = call i64 @advance(i64** %759)
  %761 = load i1, i1* %ptr_is_float
  br i1 %761, label %then_235, label %end_if_236
then_235:
  %762 = load i64, i64* %ptr_next_c
  %763 = sub nsw i64 %762, 48
  store i64 %763, i64* %ptr_digit_val
  %764 = load i64, i64* %ptr_digit_val
  %765 = sitofp i64 %764 to double
  %766 = load double, double* %ptr_fractional_mult
  %767 = fmul double %765, %766
  %768 = load double, double* %ptr_val_float
  %769 = fadd double %768, %767
  store double %769, double* %ptr_val_float
  %770 = load double, double* %ptr_fractional_mult
  %771 = fmul double %770, 0.1
  store double %771, double* %ptr_fractional_mult
  br label %end_if_236
end_if_236:
  %772 = load i1, i1* %ptr_is_float
  %773 = xor i1 %772, 1
  br i1 %773, label %then_237, label %end_if_238
then_237:
  %774 = load i64, i64* %ptr_next_c
  %775 = sub nsw i64 %774, 48
  store i64 %775, i64* %ptr_digit_val
  %776 = load i64, i64* %ptr_val_int
  %777 = mul nsw i64 %776, 10
  %778 = load i64, i64* %ptr_digit_val
  %779 = add nsw i64 %777, %778
  store i64 %779, i64* %ptr_val_int
  br label %end_if_238
end_if_238:
  store i1 1, i1* %ptr_matched
  br label %end_if_234
end_if_234:
  %780 = load i1, i1* %ptr_matched
  %781 = xor i1 %780, 1
  br i1 %781, label %then_239, label %end_if_240
then_239:
  %782 = load i64, i64* %ptr_next_c
  %783 = icmp eq i64 %782, 46
  br i1 %783, label %then_241, label %end_if_242
then_241:
  %784 = load i1, i1* %ptr_is_float
  br i1 %784, label %then_243, label %end_if_244
then_243:
  br label %while_end_232
unreachable_245:
  br label %end_if_244
end_if_244:
  %785 = load i64**, i64*** %ptr_lex
  %786 = call i64 @peek_next(i64** %785)
  %787 = icmp eq i64 %786, 46
  br i1 %787, label %then_246, label %end_if_247
then_246:
  br label %while_end_232
unreachable_248:
  br label %end_if_247
end_if_247:
  %788 = load i64**, i64*** %ptr_lex
  %789 = call i64 @advance(i64** %788)
  store i1 1, i1* %ptr_is_float
  %790 = load i64, i64* %ptr_val_int
  %791 = sitofp i64 %790 to double
  store double %791, double* %ptr_val_float
  store i1 1, i1* %ptr_matched
  br label %end_if_242
end_if_242:
  br label %end_if_240
end_if_240:
  %792 = load i1, i1* %ptr_matched
  %793 = xor i1 %792, 1
  br i1 %793, label %then_249, label %end_if_250
then_249:
  br label %while_end_232
unreachable_251:
  br label %end_if_250
end_if_250:
  br label %while_cond_230
while_end_232:
  %794 = load i1, i1* %ptr_is_float
  br i1 %794, label %then_252, label %end_if_253
then_252:
  %795 = call i8* @malloc(i64 16)
  %796 = bitcast i8* %795 to i64*
  %797 = getelementptr inbounds i64, i64* %796, i64 0
  store i64 27, i64* %797
  %798 = load double, double* %ptr_val_float
  %799 = getelementptr inbounds i64, i64* %796, i64 1
  %800 = bitcast i64* %799 to double*
  store double %798, double* %800
  %801 = load i64, i64* %ptr_start_line
  %802 = load i64, i64* %ptr_start_col
  %803 = call i64** @make_token(i64* %796, i64 %801, i64 %802)
  ret i64** %803
unreachable_254:
  br label %end_if_253
end_if_253:
  %804 = call i8* @malloc(i64 16)
  %805 = bitcast i8* %804 to i64*
  %806 = getelementptr inbounds i64, i64* %805, i64 0
  store i64 26, i64* %806
  %807 = load i64, i64* %ptr_val_int
  %808 = getelementptr inbounds i64, i64* %805, i64 1
  %809 = bitcast i64* %808 to i64*
  store i64 %807, i64* %809
  %810 = load i64, i64* %ptr_start_line
  %811 = load i64, i64* %ptr_start_col
  %812 = call i64** @make_token(i64* %805, i64 %810, i64 %811)
  ret i64** %812
unreachable_255:
  br label %end_if_229
end_if_229:
  %813 = call i8* @malloc(i64 16)
  %814 = bitcast i8* %813 to i64*
  %815 = getelementptr inbounds i64, i64* %814, i64 0
  store i64 63, i64* %815
  %816 = getelementptr inbounds i64, i64* %814, i64 1
  %817 = bitcast i64* %816 to i8**
  store i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.34, i64 0, i64 0), i8** %817
  %818 = load i64, i64* %ptr_start_line
  %819 = load i64, i64* %ptr_start_col
  %820 = call i64** @make_token(i64* %814, i64 %818, i64 %819)
  ret i64** %820
unreachable_256:
  ret i64** null
}

