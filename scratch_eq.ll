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

@.str.0 = private unnamed_addr constant [4 x i8] c"let\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"mut\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"fn\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"return\00", align 1
@.str.7 = private unnamed_addr constant [21 x i8] c"Unexpected character\00", align 1

define i64** @alloc_lexer(i8* noalias %param_src) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_start_col = alloca i64
  %ptr_val = alloca i64
  %ptr_start_pos = alloca i64
  %ptr_tok = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_lex = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_c = alloca i64
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
  %ptr_start_col = alloca i64
  %ptr_val = alloca i64
  %ptr_start_pos = alloca i64
  %ptr_tok = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_lex = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_c = alloca i64
  store i64** %param_lex, i64*** %ptr_lex
  %1 = load i64**, i64*** %ptr_lex
  %2 = bitcast i64** %1 to i8*
  call void @free(i8* %2)
  ret void
}

define i1 @is_at_end(i64** noalias %param_lex) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_start_col = alloca i64
  %ptr_val = alloca i64
  %ptr_start_pos = alloca i64
  %ptr_tok = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_lex = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_c = alloca i64
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
  %ptr_start_col = alloca i64
  %ptr_val = alloca i64
  %ptr_start_pos = alloca i64
  %ptr_tok = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_lex = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_c = alloca i64
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
  %ptr_start_col = alloca i64
  %ptr_val = alloca i64
  %ptr_start_pos = alloca i64
  %ptr_tok = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_lex = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_c = alloca i64
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
  %ptr_start_col = alloca i64
  %ptr_val = alloca i64
  %ptr_start_pos = alloca i64
  %ptr_tok = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_lex = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_c = alloca i64
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
  %ptr_start_col = alloca i64
  %ptr_val = alloca i64
  %ptr_start_pos = alloca i64
  %ptr_tok = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_lex = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_c = alloca i64
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
  %ptr_start_col = alloca i64
  %ptr_val = alloca i64
  %ptr_start_pos = alloca i64
  %ptr_tok = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_lex = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_c = alloca i64
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
  %ptr_start_col = alloca i64
  %ptr_val = alloca i64
  %ptr_start_pos = alloca i64
  %ptr_tok = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_lex = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_c = alloca i64
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
  %ptr_start_col = alloca i64
  %ptr_val = alloca i64
  %ptr_start_pos = alloca i64
  %ptr_tok = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_lex = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_c = alloca i64
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
  %ptr_start_col = alloca i64
  %ptr_val = alloca i64
  %ptr_start_pos = alloca i64
  %ptr_tok = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_ident = alloca i8*
  %ptr_lex = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_c = alloca i64
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
  %ptr_start_col = alloca i64
  %ptr_val = alloca i64
  %ptr_start_pos = alloca i64
  %ptr_tok = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_kind = alloca i64*
  %ptr_col = alloca i64
  %ptr_ident = alloca i8*
  %ptr_lex = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_line = alloca i64
  %ptr_c = alloca i64
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
  %ptr_start_col = alloca i64
  %ptr_val = alloca i64
  %ptr_start_pos = alloca i64
  %ptr_tok = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_kind = alloca i64*
  %ptr_col = alloca i64
  %ptr_ident = alloca i8*
  %ptr_lex = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_src = alloca i8*
  %ptr_line = alloca i64
  %ptr_c = alloca i64
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
  %24 = call i8* @malloc(i64 8)
  %25 = bitcast i8* %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 0
  store i64 41, i64* %26
  %27 = load i64, i64* %ptr_start_line
  %28 = load i64, i64* %ptr_start_col
  %29 = call i64** @make_token(i64* %25, i64 %27, i64 %28)
  ret i64** %29
unreachable_5:
  br label %end_if_4
end_if_4:
  %30 = load i64, i64* %ptr_c
  %31 = icmp eq i64 %30, 45
  br i1 %31, label %then_6, label %end_if_7
then_6:
  %32 = load i64**, i64*** %ptr_lex
  %33 = call i64 @peek(i64** %32)
  %34 = icmp eq i64 %33, 62
  br i1 %34, label %then_8, label %end_if_9
then_8:
  %35 = load i64**, i64*** %ptr_lex
  %36 = call i64 @advance(i64** %35)
  %37 = call i8* @malloc(i64 8)
  %38 = bitcast i8* %37 to i64*
  %39 = getelementptr inbounds i64, i64* %38, i64 0
  store i64 47, i64* %39
  %40 = load i64, i64* %ptr_start_line
  %41 = load i64, i64* %ptr_start_col
  %42 = call i64** @make_token(i64* %38, i64 %40, i64 %41)
  ret i64** %42
unreachable_10:
  br label %end_if_9
end_if_9:
  %43 = call i8* @malloc(i64 8)
  %44 = bitcast i8* %43 to i64*
  %45 = getelementptr inbounds i64, i64* %44, i64 0
  store i64 42, i64* %45
  %46 = load i64, i64* %ptr_start_line
  %47 = load i64, i64* %ptr_start_col
  %48 = call i64** @make_token(i64* %44, i64 %46, i64 %47)
  ret i64** %48
unreachable_11:
  br label %end_if_7
end_if_7:
  %49 = load i64, i64* %ptr_c
  %50 = icmp eq i64 %49, 61
  br i1 %50, label %then_12, label %end_if_13
then_12:
  %51 = load i64**, i64*** %ptr_lex
  %52 = call i64 @peek(i64** %51)
  %53 = icmp eq i64 %52, 61
  br i1 %53, label %then_14, label %end_if_15
then_14:
  %54 = load i64**, i64*** %ptr_lex
  %55 = call i64 @advance(i64** %54)
  %56 = call i8* @malloc(i64 8)
  %57 = bitcast i8* %56 to i64*
  %58 = getelementptr inbounds i64, i64* %57, i64 0
  store i64 35, i64* %58
  %59 = load i64, i64* %ptr_start_line
  %60 = load i64, i64* %ptr_start_col
  %61 = call i64** @make_token(i64* %57, i64 %59, i64 %60)
  ret i64** %61
unreachable_16:
  br label %end_if_15
end_if_15:
  %62 = call i8* @malloc(i64 8)
  %63 = bitcast i8* %62 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 0
  store i64 30, i64* %64
  %65 = load i64, i64* %ptr_start_line
  %66 = load i64, i64* %ptr_start_col
  %67 = call i64** @make_token(i64* %63, i64 %65, i64 %66)
  ret i64** %67
unreachable_17:
  br label %end_if_13
end_if_13:
  %68 = load i64, i64* %ptr_c
  %69 = call i1 @is_alpha(i64 %68)
  br i1 %69, label %then_18, label %end_if_19
then_18:
  %70 = load i64**, i64*** %ptr_lex
  %71 = bitcast i64** %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 1
  %73 = bitcast i64* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = sub nsw i64 %74, 1
  store i64 %75, i64* %ptr_start_pos
  br label %while_cond_20
while_cond_20:
  %76 = load i64**, i64*** %ptr_lex
  %77 = call i64 @peek(i64** %76)
  %78 = call i1 @is_alphanumeric(i64 %77)
  br i1 %78, label %while_body_21, label %while_end_22
while_body_21:
  %79 = load i64**, i64*** %ptr_lex
  %80 = call i64 @advance(i64** %79)
  br label %while_cond_20
while_end_22:
  %81 = load i64**, i64*** %ptr_lex
  %82 = bitcast i64** %81 to i64*
  %83 = getelementptr inbounds i64, i64* %82, i64 0
  %84 = bitcast i64* %83 to i8**
  %85 = load i8*, i8** %84, align 8
  %86 = load i64**, i64*** %ptr_lex
  %87 = bitcast i64** %86 to i64*
  %88 = getelementptr inbounds i64, i64* %87, i64 1
  %89 = bitcast i64* %88 to i64*
  %90 = load i64, i64* %89, align 8
  %91 = load i64, i64* %ptr_start_pos
  %92 = sub nsw i64 %90, %91
  %93 = add nsw i64 %92, 1
  %94 = call i8* @malloc(i64 %93)
  %95 = getelementptr inbounds i8, i8* %85, i64 %91
  %96 = call i8* @strncpy(i8* %94, i8* %95, i64 %92)
  %97 = getelementptr inbounds i8, i8* %94, i64 %92
  store i8 0, i8* %97, align 1
  store i8* %94, i8** %ptr_ident
  %98 = load i8*, i8** %ptr_ident
  %99 = call i32 @strcmp(i8* %98, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.0, i64 0, i64 0))
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %then_23, label %end_if_24
then_23:
  %101 = call i8* @malloc(i64 8)
  %102 = bitcast i8* %101 to i64*
  %103 = getelementptr inbounds i64, i64* %102, i64 0
  store i64 2, i64* %103
  %104 = load i64, i64* %ptr_start_line
  %105 = load i64, i64* %ptr_start_col
  %106 = call i64** @make_token(i64* %102, i64 %104, i64 %105)
  ret i64** %106
unreachable_25:
  br label %end_if_24
end_if_24:
  %107 = load i8*, i8** %ptr_ident
  %108 = call i32 @strcmp(i8* %107, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0))
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %then_26, label %end_if_27
then_26:
  %110 = call i8* @malloc(i64 8)
  %111 = bitcast i8* %110 to i64*
  %112 = getelementptr inbounds i64, i64* %111, i64 0
  store i64 3, i64* %112
  %113 = load i64, i64* %ptr_start_line
  %114 = load i64, i64* %ptr_start_col
  %115 = call i64** @make_token(i64* %111, i64 %113, i64 %114)
  ret i64** %115
unreachable_28:
  br label %end_if_27
end_if_27:
  %116 = load i8*, i8** %ptr_ident
  %117 = call i32 @strcmp(i8* %116, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0))
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %then_29, label %end_if_30
then_29:
  %119 = call i8* @malloc(i64 8)
  %120 = bitcast i8* %119 to i64*
  %121 = getelementptr inbounds i64, i64* %120, i64 0
  store i64 1, i64* %121
  %122 = load i64, i64* %ptr_start_line
  %123 = load i64, i64* %ptr_start_col
  %124 = call i64** @make_token(i64* %120, i64 %122, i64 %123)
  ret i64** %124
unreachable_31:
  br label %end_if_30
end_if_30:
  %125 = load i8*, i8** %ptr_ident
  %126 = call i32 @strcmp(i8* %125, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0))
  %127 = icmp eq i32 %126, 0
  br i1 %127, label %then_32, label %end_if_33
then_32:
  %128 = call i8* @malloc(i64 8)
  %129 = bitcast i8* %128 to i64*
  %130 = getelementptr inbounds i64, i64* %129, i64 0
  store i64 4, i64* %130
  %131 = load i64, i64* %ptr_start_line
  %132 = load i64, i64* %ptr_start_col
  %133 = call i64** @make_token(i64* %129, i64 %131, i64 %132)
  ret i64** %133
unreachable_34:
  br label %end_if_33
end_if_33:
  %134 = load i8*, i8** %ptr_ident
  %135 = call i32 @strcmp(i8* %134, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0))
  %136 = icmp eq i32 %135, 0
  br i1 %136, label %then_35, label %end_if_36
then_35:
  %137 = call i8* @malloc(i64 8)
  %138 = bitcast i8* %137 to i64*
  %139 = getelementptr inbounds i64, i64* %138, i64 0
  store i64 5, i64* %139
  %140 = load i64, i64* %ptr_start_line
  %141 = load i64, i64* %ptr_start_col
  %142 = call i64** @make_token(i64* %138, i64 %140, i64 %141)
  ret i64** %142
unreachable_37:
  br label %end_if_36
end_if_36:
  %143 = load i8*, i8** %ptr_ident
  %144 = call i32 @strcmp(i8* %143, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0))
  %145 = icmp eq i32 %144, 0
  br i1 %145, label %then_38, label %end_if_39
then_38:
  %146 = call i8* @malloc(i64 8)
  %147 = bitcast i8* %146 to i64*
  %148 = getelementptr inbounds i64, i64* %147, i64 0
  store i64 6, i64* %148
  %149 = load i64, i64* %ptr_start_line
  %150 = load i64, i64* %ptr_start_col
  %151 = call i64** @make_token(i64* %147, i64 %149, i64 %150)
  ret i64** %151
unreachable_40:
  br label %end_if_39
end_if_39:
  %152 = load i8*, i8** %ptr_ident
  %153 = call i32 @strcmp(i8* %152, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0))
  %154 = icmp eq i32 %153, 0
  br i1 %154, label %then_41, label %end_if_42
then_41:
  %155 = call i8* @malloc(i64 8)
  %156 = bitcast i8* %155 to i64*
  %157 = getelementptr inbounds i64, i64* %156, i64 0
  store i64 7, i64* %157
  %158 = load i64, i64* %ptr_start_line
  %159 = load i64, i64* %ptr_start_col
  %160 = call i64** @make_token(i64* %156, i64 %158, i64 %159)
  ret i64** %160
unreachable_43:
  br label %end_if_42
end_if_42:
  %161 = call i8* @malloc(i64 16)
  %162 = bitcast i8* %161 to i64*
  %163 = getelementptr inbounds i64, i64* %162, i64 0
  store i64 25, i64* %163
  %164 = load i8*, i8** %ptr_ident
  %165 = getelementptr inbounds i64, i64* %162, i64 1
  %166 = bitcast i64* %165 to i8**
  store i8* %164, i8** %166
  %167 = load i64, i64* %ptr_start_line
  %168 = load i64, i64* %ptr_start_col
  %169 = call i64** @make_token(i64* %162, i64 %167, i64 %168)
  ret i64** %169
unreachable_44:
  br label %end_if_19
end_if_19:
  %170 = load i64, i64* %ptr_c
  %171 = call i1 @is_digit(i64 %170)
  br i1 %171, label %then_45, label %end_if_46
then_45:
  %172 = load i64, i64* %ptr_c
  %173 = sub nsw i64 %172, 48
  store i64 %173, i64* %ptr_val
  br label %while_cond_47
while_cond_47:
  %174 = load i64**, i64*** %ptr_lex
  %175 = call i64 @peek(i64** %174)
  %176 = call i1 @is_digit(i64 %175)
  br i1 %176, label %while_body_48, label %while_end_49
while_body_48:
  %177 = load i64**, i64*** %ptr_lex
  %178 = call i64 @advance(i64** %177)
  store i64 %178, i64* %ptr_next_c
  %179 = load i64, i64* %ptr_val
  %180 = mul nsw i64 %179, 10
  %181 = load i64, i64* %ptr_next_c
  %182 = sub nsw i64 %181, 48
  %183 = add nsw i64 %180, %182
  store i64 %183, i64* %ptr_val
  br label %while_cond_47
while_end_49:
  %184 = call i8* @malloc(i64 16)
  %185 = bitcast i8* %184 to i64*
  %186 = getelementptr inbounds i64, i64* %185, i64 0
  store i64 26, i64* %186
  %187 = load i64, i64* %ptr_val
  %188 = getelementptr inbounds i64, i64* %185, i64 1
  %189 = bitcast i64* %188 to i64*
  store i64 %187, i64* %189
  %190 = load i64, i64* %ptr_start_line
  %191 = load i64, i64* %ptr_start_col
  %192 = call i64** @make_token(i64* %185, i64 %190, i64 %191)
  ret i64** %192
unreachable_50:
  br label %end_if_46
end_if_46:
  %193 = call i8* @malloc(i64 16)
  %194 = bitcast i8* %193 to i64*
  %195 = getelementptr inbounds i64, i64* %194, i64 0
  store i64 63, i64* %195
  %196 = getelementptr inbounds i64, i64* %194, i64 1
  %197 = bitcast i64* %196 to i8**
  store i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.7, i64 0, i64 0), i8** %197
  %198 = load i64, i64* %ptr_start_line
  %199 = load i64, i64* %ptr_start_col
  %200 = call i64** @make_token(i64* %194, i64 %198, i64 %199)
  ret i64** %200
unreachable_51:
  ret i64** null
}

