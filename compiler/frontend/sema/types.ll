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
declare void @print_int(i8*)
declare void @print_float(i8*)
declare i64 @puts(i8*)

@.str.0 = private unnamed_addr constant [4 x i8] c"Int\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"Float\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"Boolean\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"Char\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"Void\00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"Unknown\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"Int\00", align 1
@.str.8 = private unnamed_addr constant [6 x i8] c"Float\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"Boolean\00", align 1
@.str.10 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.11 = private unnamed_addr constant [5 x i8] c"Char\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"Void\00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"[]\00", align 1
@.str.14 = private unnamed_addr constant [8 x i8] c"Unknown\00", align 1
@.str.15 = private unnamed_addr constant [2 x i8] c"^\00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c"?\00", align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"None\00", align 1
@.str.18 = private unnamed_addr constant [8 x i8] c"Unknown\00", align 1

define void @print_string(i8* noalias %param_value) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_size_a = alloca i64
  %ptr_err = alloca i64**
  %ptr_arr = alloca i64**
  %ptr_sb = alloca i64
  %ptr_val = alloca i64
  %ptr_inner_box = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_value = alloca i8*
  %ptr_inner_str = alloca i8*
  %ptr_s = alloca i64
  %ptr_start_line = alloca i64
  %ptr_s1 = alloca i64
  %ptr_ret = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_span = alloca i64**
  %ptr_sa = alloca i64
  store i8* %param_value, i8** %ptr_value
  %1 = load i8*, i8** %ptr_value
  %2 = call i64 @puts(i8* %1)
  ret void
}

define i64** @alloc_span(i64 %start_line, i64 %start_col, i64 %end_line, i64 %end_col) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_size_a = alloca i64
  %ptr_err = alloca i64**
  %ptr_arr = alloca i64**
  %ptr_sb = alloca i64
  %ptr_val = alloca i64
  %ptr_inner_box = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_value = alloca i8*
  %ptr_inner_str = alloca i8*
  %ptr_s = alloca i64
  %ptr_start_line = alloca i64
  %ptr_s1 = alloca i64
  %ptr_ret = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_span = alloca i64**
  %ptr_sa = alloca i64
  store i64 %start_line, i64* %ptr_start_line
  %1 = call i8* @malloc(i64 32)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_span
  %3 = load i64**, i64*** %ptr_span
  %4 = load i64, i64* %ptr_start_line
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  store i64 %4, i64* %7, align 8
  %8 = load i64**, i64*** %ptr_span
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 %start_col, i64* %11, align 8
  %12 = load i64**, i64*** %ptr_span
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 2
  %15 = bitcast i64* %14 to i64*
  store i64 %end_line, i64* %15, align 8
  %16 = load i64**, i64*** %ptr_span
  %17 = bitcast i64** %16 to i64*
  %18 = getelementptr inbounds i64, i64* %17, i64 3
  %19 = bitcast i64* %18 to i64*
  store i64 %end_col, i64* %19, align 8
  %20 = load i64**, i64*** %ptr_span
  ret i64** %20
unreachable_0:
  ret i64** null
}

define i64** @merge_span(i64** noalias %param_a, i64** noalias %param_b) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_size_a = alloca i64
  %ptr_err = alloca i64**
  %ptr_arr = alloca i64**
  %ptr_sb = alloca i64
  %ptr_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_inner_box = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_value = alloca i8*
  %ptr_inner_str = alloca i8*
  %ptr_s = alloca i64
  %ptr_start_line = alloca i64
  %ptr_a = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_ret = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_span = alloca i64**
  %ptr_sa = alloca i64
  store i64** %param_a, i64*** %ptr_a
  store i64** %param_b, i64*** %ptr_b
  %1 = load i64**, i64*** %ptr_a
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  store i64 %5, i64* %ptr_start_line
  %6 = load i64**, i64*** %ptr_b
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 0
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = load i64**, i64*** %ptr_a
  %12 = bitcast i64** %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i64*
  %15 = load i64, i64* %14, align 8
  %16 = icmp slt i64 %10, %15
  br i1 %16, label %then_0, label %end_if_1
then_0:
  %17 = load i64**, i64*** %ptr_b
  %18 = bitcast i64** %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  %20 = bitcast i64* %19 to i64*
  %21 = load i64, i64* %20, align 8
  store i64 %21, i64* %ptr_start_line
  br label %end_if_1
end_if_1:
  %22 = load i64**, i64*** %ptr_a
  %23 = bitcast i64** %22 to i64*
  %24 = getelementptr inbounds i64, i64* %23, i64 1
  %25 = bitcast i64* %24 to i64*
  %26 = load i64, i64* %25, align 8
  %27 = load i64**, i64*** %ptr_a
  %28 = bitcast i64** %27 to i64*
  %29 = getelementptr inbounds i64, i64* %28, i64 0
  %30 = bitcast i64* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = load i64**, i64*** %ptr_b
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 0
  %35 = bitcast i64* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = icmp eq i64 %31, %36
  br i1 %37, label %then_2, label %end_if_3
then_2:
  %38 = load i64**, i64*** %ptr_b
  %39 = bitcast i64** %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 1
  %41 = bitcast i64* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = load i64**, i64*** %ptr_a
  %44 = bitcast i64** %43 to i64*
  %45 = getelementptr inbounds i64, i64* %44, i64 1
  %46 = bitcast i64* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = icmp slt i64 %42, %47
  br i1 %48, label %then_4, label %end_if_5
then_4:
  %49 = load i64**, i64*** %ptr_b
  %50 = bitcast i64** %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 1
  %52 = bitcast i64* %51 to i64*
  %53 = load i64, i64* %52, align 8
  store i64 %53, i64 %26
  br label %end_if_5
end_if_5:
  br label %end_if_3
end_if_3:
  %54 = load i64**, i64*** %ptr_b
  %55 = bitcast i64** %54 to i64*
  %56 = getelementptr inbounds i64, i64* %55, i64 0
  %57 = bitcast i64* %56 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = load i64**, i64*** %ptr_a
  %60 = bitcast i64** %59 to i64*
  %61 = getelementptr inbounds i64, i64* %60, i64 0
  %62 = bitcast i64* %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = icmp slt i64 %58, %63
  br i1 %64, label %then_6, label %end_if_7
then_6:
  %65 = load i64**, i64*** %ptr_b
  %66 = bitcast i64** %65 to i64*
  %67 = getelementptr inbounds i64, i64* %66, i64 1
  %68 = bitcast i64* %67 to i64*
  %69 = load i64, i64* %68, align 8
  store i64 %69, i64 %26
  br label %end_if_7
end_if_7:
  %70 = load i64**, i64*** %ptr_a
  %71 = bitcast i64** %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = load i64**, i64*** %ptr_b
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 2
  %78 = bitcast i64* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = load i64**, i64*** %ptr_a
  %81 = bitcast i64** %80 to i64*
  %82 = getelementptr inbounds i64, i64* %81, i64 2
  %83 = bitcast i64* %82 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = icmp sgt i64 %79, %84
  br i1 %85, label %then_8, label %end_if_9
then_8:
  %86 = load i64**, i64*** %ptr_b
  %87 = bitcast i64** %86 to i64*
  %88 = getelementptr inbounds i64, i64* %87, i64 2
  %89 = bitcast i64* %88 to i64*
  %90 = load i64, i64* %89, align 8
  store i64 %90, i64 %74
  br label %end_if_9
end_if_9:
  %91 = load i64**, i64*** %ptr_a
  %92 = bitcast i64** %91 to i64*
  %93 = getelementptr inbounds i64, i64* %92, i64 3
  %94 = bitcast i64* %93 to i64*
  %95 = load i64, i64* %94, align 8
  %96 = load i64**, i64*** %ptr_a
  %97 = bitcast i64** %96 to i64*
  %98 = getelementptr inbounds i64, i64* %97, i64 2
  %99 = bitcast i64* %98 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = load i64**, i64*** %ptr_b
  %102 = bitcast i64** %101 to i64*
  %103 = getelementptr inbounds i64, i64* %102, i64 2
  %104 = bitcast i64* %103 to i64*
  %105 = load i64, i64* %104, align 8
  %106 = icmp eq i64 %100, %105
  br i1 %106, label %then_10, label %end_if_11
then_10:
  %107 = load i64**, i64*** %ptr_b
  %108 = bitcast i64** %107 to i64*
  %109 = getelementptr inbounds i64, i64* %108, i64 3
  %110 = bitcast i64* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = load i64**, i64*** %ptr_a
  %113 = bitcast i64** %112 to i64*
  %114 = getelementptr inbounds i64, i64* %113, i64 3
  %115 = bitcast i64* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = icmp sgt i64 %111, %116
  br i1 %117, label %then_12, label %end_if_13
then_12:
  %118 = load i64**, i64*** %ptr_b
  %119 = bitcast i64** %118 to i64*
  %120 = getelementptr inbounds i64, i64* %119, i64 3
  %121 = bitcast i64* %120 to i64*
  %122 = load i64, i64* %121, align 8
  store i64 %122, i64 %95
  br label %end_if_13
end_if_13:
  br label %end_if_11
end_if_11:
  %123 = load i64**, i64*** %ptr_b
  %124 = bitcast i64** %123 to i64*
  %125 = getelementptr inbounds i64, i64* %124, i64 2
  %126 = bitcast i64* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = load i64**, i64*** %ptr_a
  %129 = bitcast i64** %128 to i64*
  %130 = getelementptr inbounds i64, i64* %129, i64 2
  %131 = bitcast i64* %130 to i64*
  %132 = load i64, i64* %131, align 8
  %133 = icmp sgt i64 %127, %132
  br i1 %133, label %then_14, label %end_if_15
then_14:
  %134 = load i64**, i64*** %ptr_b
  %135 = bitcast i64** %134 to i64*
  %136 = getelementptr inbounds i64, i64* %135, i64 3
  %137 = bitcast i64* %136 to i64*
  %138 = load i64, i64* %137, align 8
  store i64 %138, i64 %95
  br label %end_if_15
end_if_15:
  %139 = load i64, i64* %ptr_start_line
  %140 = call i64** @alloc_span(i64 %139, i64 %26, i64 %74, i64 %95)
  ret i64** %140
unreachable_16:
  ret i64** null
}

define i64** @alloc_diagnostic_error(i64** noalias %param_span, i8* noalias %param_message) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_size_a = alloca i64
  %ptr_err = alloca i64**
  %ptr_arr = alloca i64**
  %ptr_sb = alloca i64
  %ptr_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_inner_box = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_value = alloca i8*
  %ptr_inner_str = alloca i8*
  %ptr_s = alloca i64
  %ptr_start_line = alloca i64
  %ptr_a = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_ret = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_span = alloca i64**
  %ptr_sa = alloca i64
  %ptr_message = alloca i8*
  store i64** %param_span, i64*** %ptr_span
  store i8* %param_message, i8** %ptr_message
  %1 = call i8* @malloc(i64 16)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_err
  %3 = load i64**, i64*** %ptr_err
  %4 = load i64**, i64*** %ptr_span
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64***
  store i64** %4, i64*** %7, align 8
  %8 = load i64**, i64*** %ptr_err
  %9 = load i8*, i8** %ptr_message
  %10 = bitcast i64** %8 to i64*
  %11 = getelementptr inbounds i64, i64* %10, i64 1
  %12 = bitcast i64* %11 to i8**
  store i8* %9, i8** %12, align 8
  %13 = load i64**, i64*** %ptr_err
  ret i64** %13
unreachable_0:
  ret i64** null
}

define void @print_diagnostic(i8* noalias %param_source, i64** noalias %param_span, i8* noalias %param_message) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_size_a = alloca i64
  %ptr_err = alloca i64**
  %ptr_arr = alloca i64**
  %ptr_sb = alloca i64
  %ptr_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_inner_box = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_value = alloca i8*
  %ptr_inner_str = alloca i8*
  %ptr_s = alloca i64
  %ptr_source = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_a = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_ret = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_span = alloca i64**
  %ptr_sa = alloca i64
  %ptr_message = alloca i8*
  store i8* %param_source, i8** %ptr_source
  store i64** %param_span, i64*** %ptr_span
  store i8* %param_message, i8** %ptr_message
  %1 = load i8*, i8** %ptr_message
  %2 = call i64 @puts(i8* %1)
  ret void
}

define i64** @type_info_from_ast(i64** noalias %param_ty) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_size_a = alloca i64
  %ptr_err = alloca i64**
  %ptr_arr = alloca i64**
  %ptr_sb = alloca i64
  %ptr_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_inner_box = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_ty = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inner_str = alloca i8*
  %ptr_s = alloca i64
  %ptr_source = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_a = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_ret = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_span = alloca i64**
  %ptr_sa = alloca i64
  %ptr_message = alloca i8*
  store i64** %param_ty, i64*** %ptr_ty
  %1 = load i64**, i64*** %ptr_ty
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = call i32 @strcmp(i8* %5, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.0, i64 0, i64 0))
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %then_0, label %else_2
then_0:
  %8 = call i8* @malloc(i64 8)
  %9 = bitcast i8* %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 0
  store i64 0, i64* %10
  br label %end_if_1
else_2:
  %11 = load i64**, i64*** %ptr_ty
  %12 = bitcast i64** %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i32 @strcmp(i8* %15, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0))
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %then_3, label %else_5
then_3:
  %18 = call i8* @malloc(i64 8)
  %19 = bitcast i8* %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 0
  store i64 1, i64* %20
  store i64* %19, i64* %9
  br label %end_if_4
else_5:
  %21 = load i64**, i64*** %ptr_ty
  %22 = bitcast i64** %21 to i64*
  %23 = getelementptr inbounds i64, i64* %22, i64 0
  %24 = bitcast i64* %23 to i8**
  %25 = load i8*, i8** %24, align 8
  %26 = call i32 @strcmp(i8* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0))
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %then_6, label %else_8
then_6:
  %28 = call i8* @malloc(i64 8)
  %29 = bitcast i8* %28 to i64*
  %30 = getelementptr inbounds i64, i64* %29, i64 0
  store i64 2, i64* %30
  store i64* %29, i64* %9
  br label %end_if_7
else_8:
  %31 = load i64**, i64*** %ptr_ty
  %32 = bitcast i64** %31 to i64*
  %33 = getelementptr inbounds i64, i64* %32, i64 0
  %34 = bitcast i64* %33 to i8**
  %35 = load i8*, i8** %34, align 8
  %36 = call i32 @strcmp(i8* %35, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0))
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %then_9, label %else_11
then_9:
  %38 = call i8* @malloc(i64 8)
  %39 = bitcast i8* %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 0
  store i64 3, i64* %40
  store i64* %39, i64* %9
  br label %end_if_10
else_11:
  %41 = load i64**, i64*** %ptr_ty
  %42 = bitcast i64** %41 to i64*
  %43 = getelementptr inbounds i64, i64* %42, i64 0
  %44 = bitcast i64* %43 to i8**
  %45 = load i8*, i8** %44, align 8
  %46 = call i32 @strcmp(i8* %45, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0))
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %then_12, label %else_14
then_12:
  %48 = call i8* @malloc(i64 8)
  %49 = bitcast i8* %48 to i64*
  %50 = getelementptr inbounds i64, i64* %49, i64 0
  store i64 4, i64* %50
  store i64* %49, i64* %9
  br label %end_if_13
else_14:
  %51 = load i64**, i64*** %ptr_ty
  %52 = bitcast i64** %51 to i64*
  %53 = getelementptr inbounds i64, i64* %52, i64 0
  %54 = bitcast i64* %53 to i8**
  %55 = load i8*, i8** %54, align 8
  %56 = call i32 @strcmp(i8* %55, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0))
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %then_15, label %else_17
then_15:
  %58 = call i8* @malloc(i64 8)
  %59 = bitcast i8* %58 to i64*
  %60 = getelementptr inbounds i64, i64* %59, i64 0
  store i64 5, i64* %60
  store i64* %59, i64* %9
  br label %end_if_16
else_17:
  %61 = load i64**, i64*** %ptr_ty
  %62 = bitcast i64** %61 to i64*
  %63 = getelementptr inbounds i64, i64* %62, i64 0
  %64 = bitcast i64* %63 to i8**
  %65 = load i8*, i8** %64, align 8
  %66 = call i32 @strcmp(i8* %65, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0))
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %then_18, label %else_20
then_18:
  %68 = call i8* @malloc(i64 8)
  %69 = bitcast i8* %68 to i64*
  %70 = getelementptr inbounds i64, i64* %69, i64 0
  store i64 8, i64* %70
  store i64* %69, i64* %9
  br label %end_if_19
else_20:
  %71 = load i64**, i64*** %ptr_ty
  %72 = bitcast i64** %71 to i64*
  %73 = getelementptr inbounds i64, i64* %72, i64 0
  %74 = bitcast i64* %73 to i8**
  %75 = load i8*, i8** %74, align 8
  %76 = call i8* @malloc(i64 16)
  %77 = bitcast i8* %76 to i64*
  %78 = getelementptr inbounds i64, i64* %77, i64 0
  store i64 7, i64* %78
  %79 = getelementptr inbounds i64, i64* %77, i64 1
  %80 = bitcast i64* %79 to i8**
  store i8* %75, i8** %80
  store i64* %77, i64* %9
  br label %end_if_19
end_if_19:
  br label %end_if_16
end_if_16:
  br label %end_if_13
end_if_13:
  br label %end_if_10
end_if_10:
  br label %end_if_7
end_if_7:
  br label %end_if_4
end_if_4:
  br label %end_if_1
end_if_1:
  %81 = load i64**, i64*** %ptr_ty
  %82 = bitcast i64** %81 to i64*
  %83 = getelementptr inbounds i64, i64* %82, i64 2
  %84 = bitcast i64* %83 to i1*
  %85 = load i1, i1* %84, align 8
  br i1 %85, label %then_21, label %end_if_22
then_21:
  %86 = call i8* @malloc(i64 16)
  %87 = bitcast i8* %86 to i64*
  store i64* %87, i64*** %ptr_arr
  %88 = call i8* @malloc(i64 8)
  %89 = bitcast i8* %88 to i64*
  store i64* %89, i64*** %ptr_inner_box
  %90 = load i64**, i64*** %ptr_inner_box
  store i64* %9, i64** %90
  %91 = load i64**, i64*** %ptr_arr
  %92 = load i64**, i64*** %ptr_inner_box
  %93 = bitcast i64** %91 to i64*
  %94 = getelementptr inbounds i64, i64* %93, i64 0
  %95 = bitcast i64* %94 to i64***
  store i64** %92, i64*** %95, align 8
  %96 = load i64**, i64*** %ptr_ty
  %97 = bitcast i64** %96 to i64*
  %98 = getelementptr inbounds i64, i64* %97, i64 3
  %99 = bitcast i64* %98 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = load i64**, i64*** %ptr_arr
  %102 = bitcast i64** %101 to i64*
  %103 = getelementptr inbounds i64, i64* %102, i64 1
  %104 = bitcast i64* %103 to i64*
  store i64 %100, i64* %104, align 8
  %105 = call i8* @malloc(i64 16)
  %106 = bitcast i8* %105 to i64*
  %107 = getelementptr inbounds i64, i64* %106, i64 0
  store i64 6, i64* %107
  %108 = load i64**, i64*** %ptr_arr
  %109 = getelementptr inbounds i64, i64* %106, i64 1
  %110 = bitcast i64* %109 to i64***
  store i64** %108, i64*** %110
  store i64* %106, i64* %9
  br label %end_if_22
end_if_22:
  %111 = load i64**, i64*** %ptr_ty
  %112 = bitcast i64** %111 to i64*
  %113 = getelementptr inbounds i64, i64* %112, i64 4
  %114 = bitcast i64* %113 to i1*
  %115 = load i1, i1* %114, align 8
  br i1 %115, label %then_23, label %end_if_24
then_23:
  %116 = call i8* @malloc(i64 8)
  %117 = bitcast i8* %116 to i64*
  store i64* %117, i64*** %ptr_inner_box
  %118 = load i64**, i64*** %ptr_inner_box
  store i64* %9, i64** %118
  %119 = call i8* @malloc(i64 16)
  %120 = bitcast i8* %119 to i64*
  %121 = getelementptr inbounds i64, i64* %120, i64 0
  store i64 9, i64* %121
  %122 = load i64**, i64*** %ptr_inner_box
  %123 = getelementptr inbounds i64, i64* %120, i64 1
  %124 = bitcast i64* %123 to i64***
  store i64** %122, i64*** %124
  store i64* %120, i64* %9
  br label %end_if_24
end_if_24:
  %125 = load i64**, i64*** %ptr_ty
  %126 = bitcast i64** %125 to i64*
  %127 = getelementptr inbounds i64, i64* %126, i64 5
  %128 = bitcast i64* %127 to i1*
  %129 = load i1, i1* %128, align 8
  br i1 %129, label %then_25, label %end_if_26
then_25:
  %130 = call i8* @malloc(i64 8)
  %131 = bitcast i8* %130 to i64*
  store i64* %131, i64*** %ptr_inner_box
  %132 = load i64**, i64*** %ptr_inner_box
  store i64* %9, i64** %132
  %133 = call i8* @malloc(i64 16)
  %134 = bitcast i8* %133 to i64*
  %135 = getelementptr inbounds i64, i64* %134, i64 0
  store i64 10, i64* %135
  %136 = load i64**, i64*** %ptr_inner_box
  %137 = getelementptr inbounds i64, i64* %134, i64 1
  %138 = bitcast i64* %137 to i64***
  store i64** %136, i64*** %138
  store i64* %134, i64* %9
  br label %end_if_26
end_if_26:
  %139 = call i8* @malloc(i64 8)
  %140 = bitcast i8* %139 to i64*
  store i64* %140, i64*** %ptr_ret
  %141 = load i64**, i64*** %ptr_ret
  store i64* %9, i64** %141
  %142 = load i64**, i64*** %ptr_ret
  ret i64** %142
unreachable_27:
  ret i64** null
}

define i8* @type_info_to_string(i64** noalias %param_info) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_size_a = alloca i64
  %ptr_err = alloca i64**
  %ptr_arr = alloca i64**
  %ptr_sb = alloca i64
  %ptr_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_inner_box = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_ty = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inner_str = alloca i8*
  %ptr_s = alloca i64
  %ptr_source = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_info = alloca i64**
  %ptr_a = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_ret = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_span = alloca i64**
  %ptr_sa = alloca i64
  %ptr_message = alloca i8*
  store i64** %param_info, i64*** %ptr_info
  %1 = load i64**, i64*** %ptr_info
  %2 = load i64*, i64** %1
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %when_case_1, label %when_next_2
when_case_1:
  ret i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i64 0, i64 0)
unreachable_3:
  br label %when_end_0
when_next_2:
  %7 = icmp eq i64 %5, 1
  br i1 %7, label %when_case_4, label %when_next_5
when_case_4:
  ret i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.8, i64 0, i64 0)
unreachable_6:
  br label %when_end_0
when_next_5:
  %8 = icmp eq i64 %5, 2
  br i1 %8, label %when_case_7, label %when_next_8
when_case_7:
  ret i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0)
unreachable_9:
  br label %when_end_0
when_next_8:
  %9 = icmp eq i64 %5, 3
  br i1 %9, label %when_case_10, label %when_next_11
when_case_10:
  ret i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i64 0, i64 0)
unreachable_12:
  br label %when_end_0
when_next_11:
  %10 = icmp eq i64 %5, 4
  br i1 %10, label %when_case_13, label %when_next_14
when_case_13:
  ret i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i64 0, i64 0)
unreachable_15:
  br label %when_end_0
when_next_14:
  %11 = icmp eq i64 %5, 5
  br i1 %11, label %when_case_16, label %when_next_17
when_case_16:
  ret i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i64 0, i64 0)
unreachable_18:
  br label %when_end_0
when_next_17:
  %12 = icmp eq i64 %5, 6
  br i1 %12, label %when_case_19, label %when_next_20
when_case_19:
  %13 = getelementptr inbounds i64, i64* %2, i64 1
  %14 = bitcast i64* %13 to i64***
  %15 = load i64**, i64*** %14, align 8
  store i64** %15, i64*** %ptr_arr
  %16 = load i64**, i64*** %ptr_arr
  %17 = bitcast i64** %16 to i64*
  %18 = getelementptr inbounds i64, i64* %17, i64 0
  %19 = bitcast i64* %18 to i8**
  %20 = load i8*, i8** %19, align 8
  %21 = call i8* @type_info_to_string(i8* %20)
  store i8* %21, i8** %ptr_inner_str
  %22 = load i8*, i8** %ptr_inner_str
  %23 = add nsw i8* %22, getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i64 0, i64 0)
  ret i8* %23
unreachable_21:
  br label %when_end_0
when_next_20:
  %24 = icmp eq i64 %5, 7
  br i1 %24, label %when_case_22, label %when_next_23
when_case_22:
  %25 = getelementptr inbounds i64, i64* %2, i64 1
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  ret i8* %27
unreachable_24:
  br label %when_end_0
when_next_23:
  %28 = icmp eq i64 %5, 8
  br i1 %28, label %when_case_25, label %when_next_26
when_case_25:
  ret i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.14, i64 0, i64 0)
unreachable_27:
  br label %when_end_0
when_next_26:
  %29 = icmp eq i64 %5, 9
  br i1 %29, label %when_case_28, label %when_next_29
when_case_28:
  %30 = getelementptr inbounds i64, i64* %2, i64 1
  %31 = bitcast i64* %30 to i64***
  %32 = load i64**, i64*** %31, align 8
  %33 = call i8* @type_info_to_string(i64** %32)
  store i8* %33, i8** %ptr_inner_str
  %34 = load i8*, i8** %ptr_inner_str
  %35 = add nsw i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i64 0, i64 0), %34
  ret i8* %35
unreachable_30:
  br label %when_end_0
when_next_29:
  %36 = icmp eq i64 %5, 10
  br i1 %36, label %when_case_31, label %when_next_32
when_case_31:
  %37 = getelementptr inbounds i64, i64* %2, i64 1
  %38 = bitcast i64* %37 to i64***
  %39 = load i64**, i64*** %38, align 8
  store i64** %39, i64** %32
  %40 = call i8* @type_info_to_string(i64** %32)
  store i8* %40, i8** %ptr_inner_str
  %41 = load i8*, i8** %ptr_inner_str
  %42 = add nsw i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.16, i64 0, i64 0), %41
  ret i8* %42
unreachable_33:
  br label %when_end_0
when_next_32:
  %43 = icmp eq i64 %5, 11
  br i1 %43, label %when_case_34, label %when_next_35
when_case_34:
  ret i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.17, i64 0, i64 0)
unreachable_36:
  br label %when_end_0
when_next_35:
  br label %when_end_0
when_end_0:
  ret i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.18, i64 0, i64 0)
unreachable_37:
  ret i8* null
}

define i1 @type_info_equals(i64** noalias %param_a, i64** noalias %param_b) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_size_a = alloca i64
  %ptr_err = alloca i64**
  %ptr_arr = alloca i64**
  %ptr_sb = alloca i64
  %ptr_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_inner_box = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_ty = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inner_str = alloca i8*
  %ptr_s = alloca i64
  %ptr_source = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_info = alloca i64**
  %ptr_a = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_ret = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_span = alloca i64**
  %ptr_sa = alloca i64
  %ptr_message = alloca i8*
  store i64** %param_a, i64*** %ptr_a
  store i64** %param_b, i64*** %ptr_b
  %1 = load i64**, i64*** %ptr_a
  %2 = load i64*, i64** %1
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %when_case_1, label %when_next_2
when_case_1:
  %7 = load i64**, i64*** %ptr_b
  %8 = load i64*, i64** %7
  %9 = getelementptr inbounds i64, i64* %8, i64 0
  %10 = bitcast i64* %9 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %when_case_4, label %when_next_5
when_case_4:
  ret i1 1
unreachable_6:
  br label %when_end_3
when_next_5:
  %13 = icmp eq i64 %11, 1
  br i1 %13, label %when_case_7, label %when_next_8
when_case_7:
  ret i1 0
unreachable_9:
  br label %when_end_3
when_next_8:
  %14 = icmp eq i64 %11, 2
  br i1 %14, label %when_case_10, label %when_next_11
when_case_10:
  ret i1 0
unreachable_12:
  br label %when_end_3
when_next_11:
  %15 = icmp eq i64 %11, 3
  br i1 %15, label %when_case_13, label %when_next_14
when_case_13:
  ret i1 0
unreachable_15:
  br label %when_end_3
when_next_14:
  %16 = icmp eq i64 %11, 4
  br i1 %16, label %when_case_16, label %when_next_17
when_case_16:
  ret i1 0
unreachable_18:
  br label %when_end_3
when_next_17:
  %17 = icmp eq i64 %11, 5
  br i1 %17, label %when_case_19, label %when_next_20
when_case_19:
  ret i1 0
unreachable_21:
  br label %when_end_3
when_next_20:
  %18 = icmp eq i64 %11, 6
  br i1 %18, label %when_case_22, label %when_next_23
when_case_22:
  ret i1 0
unreachable_24:
  br label %when_end_3
when_next_23:
  %19 = icmp eq i64 %11, 7
  br i1 %19, label %when_case_25, label %when_next_26
when_case_25:
  ret i1 0
unreachable_27:
  br label %when_end_3
when_next_26:
  %20 = icmp eq i64 %11, 8
  br i1 %20, label %when_case_28, label %when_next_29
when_case_28:
  ret i1 0
unreachable_30:
  br label %when_end_3
when_next_29:
  %21 = icmp eq i64 %11, 9
  br i1 %21, label %when_case_31, label %when_next_32
when_case_31:
  ret i1 0
unreachable_33:
  br label %when_end_3
when_next_32:
  %22 = icmp eq i64 %11, 10
  br i1 %22, label %when_case_34, label %when_next_35
when_case_34:
  ret i1 0
unreachable_36:
  br label %when_end_3
when_next_35:
  %23 = icmp eq i64 %11, 11
  br i1 %23, label %when_case_37, label %when_next_38
when_case_37:
  ret i1 0
unreachable_39:
  br label %when_end_3
when_next_38:
  br label %when_end_3
when_end_3:
  br label %when_end_0
when_next_2:
  %24 = icmp eq i64 %5, 1
  br i1 %24, label %when_case_40, label %when_next_41
when_case_40:
  %25 = load i64**, i64*** %ptr_b
  %26 = load i64*, i64** %25
  %27 = getelementptr inbounds i64, i64* %26, i64 0
  %28 = bitcast i64* %27 to i64*
  %29 = load i64, i64* %28, align 8
  %30 = icmp eq i64 %29, 0
  br i1 %30, label %when_case_43, label %when_next_44
when_case_43:
  ret i1 0
unreachable_45:
  br label %when_end_42
when_next_44:
  %31 = icmp eq i64 %29, 1
  br i1 %31, label %when_case_46, label %when_next_47
when_case_46:
  ret i1 1
unreachable_48:
  br label %when_end_42
when_next_47:
  %32 = icmp eq i64 %29, 2
  br i1 %32, label %when_case_49, label %when_next_50
when_case_49:
  ret i1 0
unreachable_51:
  br label %when_end_42
when_next_50:
  %33 = icmp eq i64 %29, 3
  br i1 %33, label %when_case_52, label %when_next_53
when_case_52:
  ret i1 0
unreachable_54:
  br label %when_end_42
when_next_53:
  %34 = icmp eq i64 %29, 4
  br i1 %34, label %when_case_55, label %when_next_56
when_case_55:
  ret i1 0
unreachable_57:
  br label %when_end_42
when_next_56:
  %35 = icmp eq i64 %29, 5
  br i1 %35, label %when_case_58, label %when_next_59
when_case_58:
  ret i1 0
unreachable_60:
  br label %when_end_42
when_next_59:
  %36 = icmp eq i64 %29, 6
  br i1 %36, label %when_case_61, label %when_next_62
when_case_61:
  ret i1 0
unreachable_63:
  br label %when_end_42
when_next_62:
  %37 = icmp eq i64 %29, 7
  br i1 %37, label %when_case_64, label %when_next_65
when_case_64:
  ret i1 0
unreachable_66:
  br label %when_end_42
when_next_65:
  %38 = icmp eq i64 %29, 8
  br i1 %38, label %when_case_67, label %when_next_68
when_case_67:
  ret i1 0
unreachable_69:
  br label %when_end_42
when_next_68:
  %39 = icmp eq i64 %29, 9
  br i1 %39, label %when_case_70, label %when_next_71
when_case_70:
  ret i1 0
unreachable_72:
  br label %when_end_42
when_next_71:
  %40 = icmp eq i64 %29, 10
  br i1 %40, label %when_case_73, label %when_next_74
when_case_73:
  ret i1 0
unreachable_75:
  br label %when_end_42
when_next_74:
  %41 = icmp eq i64 %29, 11
  br i1 %41, label %when_case_76, label %when_next_77
when_case_76:
  ret i1 0
unreachable_78:
  br label %when_end_42
when_next_77:
  br label %when_end_42
when_end_42:
  br label %when_end_0
when_next_41:
  %42 = icmp eq i64 %5, 2
  br i1 %42, label %when_case_79, label %when_next_80
when_case_79:
  %43 = load i64**, i64*** %ptr_b
  %44 = load i64*, i64** %43
  %45 = getelementptr inbounds i64, i64* %44, i64 0
  %46 = bitcast i64* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = icmp eq i64 %47, 0
  br i1 %48, label %when_case_82, label %when_next_83
when_case_82:
  ret i1 0
unreachable_84:
  br label %when_end_81
when_next_83:
  %49 = icmp eq i64 %47, 1
  br i1 %49, label %when_case_85, label %when_next_86
when_case_85:
  ret i1 0
unreachable_87:
  br label %when_end_81
when_next_86:
  %50 = icmp eq i64 %47, 2
  br i1 %50, label %when_case_88, label %when_next_89
when_case_88:
  ret i1 1
unreachable_90:
  br label %when_end_81
when_next_89:
  %51 = icmp eq i64 %47, 3
  br i1 %51, label %when_case_91, label %when_next_92
when_case_91:
  ret i1 0
unreachable_93:
  br label %when_end_81
when_next_92:
  %52 = icmp eq i64 %47, 4
  br i1 %52, label %when_case_94, label %when_next_95
when_case_94:
  ret i1 0
unreachable_96:
  br label %when_end_81
when_next_95:
  %53 = icmp eq i64 %47, 5
  br i1 %53, label %when_case_97, label %when_next_98
when_case_97:
  ret i1 0
unreachable_99:
  br label %when_end_81
when_next_98:
  %54 = icmp eq i64 %47, 6
  br i1 %54, label %when_case_100, label %when_next_101
when_case_100:
  ret i1 0
unreachable_102:
  br label %when_end_81
when_next_101:
  %55 = icmp eq i64 %47, 7
  br i1 %55, label %when_case_103, label %when_next_104
when_case_103:
  ret i1 0
unreachable_105:
  br label %when_end_81
when_next_104:
  %56 = icmp eq i64 %47, 8
  br i1 %56, label %when_case_106, label %when_next_107
when_case_106:
  ret i1 0
unreachable_108:
  br label %when_end_81
when_next_107:
  %57 = icmp eq i64 %47, 9
  br i1 %57, label %when_case_109, label %when_next_110
when_case_109:
  ret i1 0
unreachable_111:
  br label %when_end_81
when_next_110:
  %58 = icmp eq i64 %47, 10
  br i1 %58, label %when_case_112, label %when_next_113
when_case_112:
  ret i1 0
unreachable_114:
  br label %when_end_81
when_next_113:
  %59 = icmp eq i64 %47, 11
  br i1 %59, label %when_case_115, label %when_next_116
when_case_115:
  ret i1 0
unreachable_117:
  br label %when_end_81
when_next_116:
  br label %when_end_81
when_end_81:
  br label %when_end_0
when_next_80:
  %60 = icmp eq i64 %5, 3
  br i1 %60, label %when_case_118, label %when_next_119
when_case_118:
  %61 = load i64**, i64*** %ptr_b
  %62 = load i64*, i64** %61
  %63 = getelementptr inbounds i64, i64* %62, i64 0
  %64 = bitcast i64* %63 to i64*
  %65 = load i64, i64* %64, align 8
  %66 = icmp eq i64 %65, 0
  br i1 %66, label %when_case_121, label %when_next_122
when_case_121:
  ret i1 0
unreachable_123:
  br label %when_end_120
when_next_122:
  %67 = icmp eq i64 %65, 1
  br i1 %67, label %when_case_124, label %when_next_125
when_case_124:
  ret i1 0
unreachable_126:
  br label %when_end_120
when_next_125:
  %68 = icmp eq i64 %65, 2
  br i1 %68, label %when_case_127, label %when_next_128
when_case_127:
  ret i1 0
unreachable_129:
  br label %when_end_120
when_next_128:
  %69 = icmp eq i64 %65, 3
  br i1 %69, label %when_case_130, label %when_next_131
when_case_130:
  ret i1 1
unreachable_132:
  br label %when_end_120
when_next_131:
  %70 = icmp eq i64 %65, 4
  br i1 %70, label %when_case_133, label %when_next_134
when_case_133:
  ret i1 0
unreachable_135:
  br label %when_end_120
when_next_134:
  %71 = icmp eq i64 %65, 5
  br i1 %71, label %when_case_136, label %when_next_137
when_case_136:
  ret i1 0
unreachable_138:
  br label %when_end_120
when_next_137:
  %72 = icmp eq i64 %65, 6
  br i1 %72, label %when_case_139, label %when_next_140
when_case_139:
  ret i1 0
unreachable_141:
  br label %when_end_120
when_next_140:
  %73 = icmp eq i64 %65, 7
  br i1 %73, label %when_case_142, label %when_next_143
when_case_142:
  ret i1 0
unreachable_144:
  br label %when_end_120
when_next_143:
  %74 = icmp eq i64 %65, 8
  br i1 %74, label %when_case_145, label %when_next_146
when_case_145:
  ret i1 0
unreachable_147:
  br label %when_end_120
when_next_146:
  %75 = icmp eq i64 %65, 9
  br i1 %75, label %when_case_148, label %when_next_149
when_case_148:
  ret i1 0
unreachable_150:
  br label %when_end_120
when_next_149:
  %76 = icmp eq i64 %65, 10
  br i1 %76, label %when_case_151, label %when_next_152
when_case_151:
  ret i1 0
unreachable_153:
  br label %when_end_120
when_next_152:
  %77 = icmp eq i64 %65, 11
  br i1 %77, label %when_case_154, label %when_next_155
when_case_154:
  ret i1 0
unreachable_156:
  br label %when_end_120
when_next_155:
  br label %when_end_120
when_end_120:
  br label %when_end_0
when_next_119:
  %78 = icmp eq i64 %5, 4
  br i1 %78, label %when_case_157, label %when_next_158
when_case_157:
  %79 = load i64**, i64*** %ptr_b
  %80 = load i64*, i64** %79
  %81 = getelementptr inbounds i64, i64* %80, i64 0
  %82 = bitcast i64* %81 to i64*
  %83 = load i64, i64* %82, align 8
  %84 = icmp eq i64 %83, 0
  br i1 %84, label %when_case_160, label %when_next_161
when_case_160:
  ret i1 0
unreachable_162:
  br label %when_end_159
when_next_161:
  %85 = icmp eq i64 %83, 1
  br i1 %85, label %when_case_163, label %when_next_164
when_case_163:
  ret i1 0
unreachable_165:
  br label %when_end_159
when_next_164:
  %86 = icmp eq i64 %83, 2
  br i1 %86, label %when_case_166, label %when_next_167
when_case_166:
  ret i1 0
unreachable_168:
  br label %when_end_159
when_next_167:
  %87 = icmp eq i64 %83, 3
  br i1 %87, label %when_case_169, label %when_next_170
when_case_169:
  ret i1 0
unreachable_171:
  br label %when_end_159
when_next_170:
  %88 = icmp eq i64 %83, 4
  br i1 %88, label %when_case_172, label %when_next_173
when_case_172:
  ret i1 1
unreachable_174:
  br label %when_end_159
when_next_173:
  %89 = icmp eq i64 %83, 5
  br i1 %89, label %when_case_175, label %when_next_176
when_case_175:
  ret i1 0
unreachable_177:
  br label %when_end_159
when_next_176:
  %90 = icmp eq i64 %83, 6
  br i1 %90, label %when_case_178, label %when_next_179
when_case_178:
  ret i1 0
unreachable_180:
  br label %when_end_159
when_next_179:
  %91 = icmp eq i64 %83, 7
  br i1 %91, label %when_case_181, label %when_next_182
when_case_181:
  ret i1 0
unreachable_183:
  br label %when_end_159
when_next_182:
  %92 = icmp eq i64 %83, 8
  br i1 %92, label %when_case_184, label %when_next_185
when_case_184:
  ret i1 0
unreachable_186:
  br label %when_end_159
when_next_185:
  %93 = icmp eq i64 %83, 9
  br i1 %93, label %when_case_187, label %when_next_188
when_case_187:
  ret i1 0
unreachable_189:
  br label %when_end_159
when_next_188:
  %94 = icmp eq i64 %83, 10
  br i1 %94, label %when_case_190, label %when_next_191
when_case_190:
  ret i1 0
unreachable_192:
  br label %when_end_159
when_next_191:
  %95 = icmp eq i64 %83, 11
  br i1 %95, label %when_case_193, label %when_next_194
when_case_193:
  ret i1 0
unreachable_195:
  br label %when_end_159
when_next_194:
  br label %when_end_159
when_end_159:
  br label %when_end_0
when_next_158:
  %96 = icmp eq i64 %5, 5
  br i1 %96, label %when_case_196, label %when_next_197
when_case_196:
  %97 = load i64**, i64*** %ptr_b
  %98 = load i64*, i64** %97
  %99 = getelementptr inbounds i64, i64* %98, i64 0
  %100 = bitcast i64* %99 to i64*
  %101 = load i64, i64* %100, align 8
  %102 = icmp eq i64 %101, 0
  br i1 %102, label %when_case_199, label %when_next_200
when_case_199:
  ret i1 0
unreachable_201:
  br label %when_end_198
when_next_200:
  %103 = icmp eq i64 %101, 1
  br i1 %103, label %when_case_202, label %when_next_203
when_case_202:
  ret i1 0
unreachable_204:
  br label %when_end_198
when_next_203:
  %104 = icmp eq i64 %101, 2
  br i1 %104, label %when_case_205, label %when_next_206
when_case_205:
  ret i1 0
unreachable_207:
  br label %when_end_198
when_next_206:
  %105 = icmp eq i64 %101, 3
  br i1 %105, label %when_case_208, label %when_next_209
when_case_208:
  ret i1 0
unreachable_210:
  br label %when_end_198
when_next_209:
  %106 = icmp eq i64 %101, 4
  br i1 %106, label %when_case_211, label %when_next_212
when_case_211:
  ret i1 0
unreachable_213:
  br label %when_end_198
when_next_212:
  %107 = icmp eq i64 %101, 5
  br i1 %107, label %when_case_214, label %when_next_215
when_case_214:
  ret i1 1
unreachable_216:
  br label %when_end_198
when_next_215:
  %108 = icmp eq i64 %101, 6
  br i1 %108, label %when_case_217, label %when_next_218
when_case_217:
  ret i1 0
unreachable_219:
  br label %when_end_198
when_next_218:
  %109 = icmp eq i64 %101, 7
  br i1 %109, label %when_case_220, label %when_next_221
when_case_220:
  ret i1 0
unreachable_222:
  br label %when_end_198
when_next_221:
  %110 = icmp eq i64 %101, 8
  br i1 %110, label %when_case_223, label %when_next_224
when_case_223:
  ret i1 0
unreachable_225:
  br label %when_end_198
when_next_224:
  %111 = icmp eq i64 %101, 9
  br i1 %111, label %when_case_226, label %when_next_227
when_case_226:
  ret i1 0
unreachable_228:
  br label %when_end_198
when_next_227:
  %112 = icmp eq i64 %101, 10
  br i1 %112, label %when_case_229, label %when_next_230
when_case_229:
  ret i1 0
unreachable_231:
  br label %when_end_198
when_next_230:
  %113 = icmp eq i64 %101, 11
  br i1 %113, label %when_case_232, label %when_next_233
when_case_232:
  ret i1 0
unreachable_234:
  br label %when_end_198
when_next_233:
  br label %when_end_198
when_end_198:
  br label %when_end_0
when_next_197:
  %114 = icmp eq i64 %5, 6
  br i1 %114, label %when_case_235, label %when_next_236
when_case_235:
  %115 = getelementptr inbounds i64, i64* %2, i64 1
  %116 = bitcast i64* %115 to i64***
  %117 = load i64**, i64*** %116, align 8
  %118 = load i64**, i64*** %ptr_b
  %119 = load i64*, i64** %118
  %120 = getelementptr inbounds i64, i64* %119, i64 0
  %121 = bitcast i64* %120 to i64*
  %122 = load i64, i64* %121, align 8
  %123 = icmp eq i64 %122, 0
  br i1 %123, label %when_case_238, label %when_next_239
when_case_238:
  ret i1 0
unreachable_240:
  br label %when_end_237
when_next_239:
  %124 = icmp eq i64 %122, 1
  br i1 %124, label %when_case_241, label %when_next_242
when_case_241:
  ret i1 0
unreachable_243:
  br label %when_end_237
when_next_242:
  %125 = icmp eq i64 %122, 2
  br i1 %125, label %when_case_244, label %when_next_245
when_case_244:
  ret i1 0
unreachable_246:
  br label %when_end_237
when_next_245:
  %126 = icmp eq i64 %122, 3
  br i1 %126, label %when_case_247, label %when_next_248
when_case_247:
  ret i1 0
unreachable_249:
  br label %when_end_237
when_next_248:
  %127 = icmp eq i64 %122, 4
  br i1 %127, label %when_case_250, label %when_next_251
when_case_250:
  ret i1 0
unreachable_252:
  br label %when_end_237
when_next_251:
  %128 = icmp eq i64 %122, 5
  br i1 %128, label %when_case_253, label %when_next_254
when_case_253:
  ret i1 0
unreachable_255:
  br label %when_end_237
when_next_254:
  %129 = icmp eq i64 %122, 6
  br i1 %129, label %when_case_256, label %when_next_257
when_case_256:
  %130 = getelementptr inbounds i64, i64* %119, i64 1
  %131 = bitcast i64* %130 to i64***
  %132 = load i64**, i64*** %131, align 8
  %133 = bitcast i64** %117 to i64*
  %134 = getelementptr inbounds i64, i64* %133, i64 1
  %135 = bitcast i64* %134 to i8**
  %136 = load i8*, i8** %135, align 8
  store i8* %136, i64* %ptr_size_a
  %137 = bitcast i64** %132 to i64*
  %138 = getelementptr inbounds i64, i64* %137, i64 1
  %139 = bitcast i64* %138 to i8**
  %140 = load i8*, i8** %139, align 8
  store i8* %140, i64* %ptr_size_b
  %141 = load i64, i64* %ptr_size_a
  %142 = icmp eq i64 %141, null
  br i1 %142, label %when_none_259, label %when_val_260
when_none_259:
  %143 = load i64, i64* %ptr_size_b
  %144 = icmp eq i64 %143, null
  br i1 %144, label %when_none_262, label %when_val_263
when_none_262:
  br label %when_end_261
when_val_263:
  ret i1 0
unreachable_264:
  br label %when_end_261
when_end_261:
  br label %when_end_258
when_val_260:
  %145 = load i64, i64* %ptr_size_a
  store i64 %145, i64* %ptr_sa
  %146 = load i64, i64* %ptr_size_b
  %147 = icmp eq i64 %146, null
  br i1 %147, label %when_none_266, label %when_val_267
when_none_266:
  ret i1 0
unreachable_268:
  br label %when_end_265
when_val_267:
  %148 = load i64, i64* %ptr_size_b
  store i64 %148, i64* %ptr_sb
  %149 = load i64, i64* %ptr_sa
  %150 = load i64, i64* %ptr_sb
  %151 = icmp ne i64 %149, %150
  br i1 %151, label %then_269, label %end_if_270
then_269:
  ret i1 0
unreachable_271:
  br label %end_if_270
end_if_270:
  br label %when_end_265
when_end_265:
  br label %when_end_258
when_end_258:
  %152 = bitcast i64** %117 to i64*
  %153 = getelementptr inbounds i64, i64* %152, i64 0
  %154 = bitcast i64* %153 to i8**
  %155 = load i8*, i8** %154, align 8
  %156 = bitcast i64** %132 to i64*
  %157 = getelementptr inbounds i64, i64* %156, i64 0
  %158 = bitcast i64* %157 to i8**
  %159 = load i8*, i8** %158, align 8
  %160 = call i1 @type_info_equals(i8* %155, i8* %159)
  ret i1 %160
unreachable_272:
  br label %when_end_237
when_next_257:
  %161 = icmp eq i64 %122, 7
  br i1 %161, label %when_case_273, label %when_next_274
when_case_273:
  ret i1 0
unreachable_275:
  br label %when_end_237
when_next_274:
  %162 = icmp eq i64 %122, 8
  br i1 %162, label %when_case_276, label %when_next_277
when_case_276:
  ret i1 0
unreachable_278:
  br label %when_end_237
when_next_277:
  %163 = icmp eq i64 %122, 9
  br i1 %163, label %when_case_279, label %when_next_280
when_case_279:
  ret i1 0
unreachable_281:
  br label %when_end_237
when_next_280:
  %164 = icmp eq i64 %122, 10
  br i1 %164, label %when_case_282, label %when_next_283
when_case_282:
  ret i1 0
unreachable_284:
  br label %when_end_237
when_next_283:
  %165 = icmp eq i64 %122, 11
  br i1 %165, label %when_case_285, label %when_next_286
when_case_285:
  ret i1 0
unreachable_287:
  br label %when_end_237
when_next_286:
  br label %when_end_237
when_end_237:
  br label %when_end_0
when_next_236:
  %166 = icmp eq i64 %5, 7
  br i1 %166, label %when_case_288, label %when_next_289
when_case_288:
  %167 = getelementptr inbounds i64, i64* %2, i64 1
  %168 = bitcast i64* %167 to i8**
  %169 = load i8*, i8** %168, align 8
  %170 = load i64**, i64*** %ptr_b
  %171 = load i64*, i64** %170
  %172 = getelementptr inbounds i64, i64* %171, i64 0
  %173 = bitcast i64* %172 to i64*
  %174 = load i64, i64* %173, align 8
  %175 = icmp eq i64 %174, 0
  br i1 %175, label %when_case_291, label %when_next_292
when_case_291:
  ret i1 0
unreachable_293:
  br label %when_end_290
when_next_292:
  %176 = icmp eq i64 %174, 1
  br i1 %176, label %when_case_294, label %when_next_295
when_case_294:
  ret i1 0
unreachable_296:
  br label %when_end_290
when_next_295:
  %177 = icmp eq i64 %174, 2
  br i1 %177, label %when_case_297, label %when_next_298
when_case_297:
  ret i1 0
unreachable_299:
  br label %when_end_290
when_next_298:
  %178 = icmp eq i64 %174, 3
  br i1 %178, label %when_case_300, label %when_next_301
when_case_300:
  ret i1 0
unreachable_302:
  br label %when_end_290
when_next_301:
  %179 = icmp eq i64 %174, 4
  br i1 %179, label %when_case_303, label %when_next_304
when_case_303:
  ret i1 0
unreachable_305:
  br label %when_end_290
when_next_304:
  %180 = icmp eq i64 %174, 5
  br i1 %180, label %when_case_306, label %when_next_307
when_case_306:
  ret i1 0
unreachable_308:
  br label %when_end_290
when_next_307:
  %181 = icmp eq i64 %174, 6
  br i1 %181, label %when_case_309, label %when_next_310
when_case_309:
  ret i1 0
unreachable_311:
  br label %when_end_290
when_next_310:
  %182 = icmp eq i64 %174, 7
  br i1 %182, label %when_case_312, label %when_next_313
when_case_312:
  %183 = getelementptr inbounds i64, i64* %171, i64 1
  %184 = bitcast i64* %183 to i8**
  %185 = load i8*, i8** %184, align 8
  %186 = call i32 @strcmp(i8* %169, i8* %185)
  %187 = icmp eq i32 %186, 0
  ret i1 %187
unreachable_314:
  br label %when_end_290
when_next_313:
  %188 = icmp eq i64 %174, 8
  br i1 %188, label %when_case_315, label %when_next_316
when_case_315:
  ret i1 0
unreachable_317:
  br label %when_end_290
when_next_316:
  %189 = icmp eq i64 %174, 9
  br i1 %189, label %when_case_318, label %when_next_319
when_case_318:
  ret i1 0
unreachable_320:
  br label %when_end_290
when_next_319:
  %190 = icmp eq i64 %174, 10
  br i1 %190, label %when_case_321, label %when_next_322
when_case_321:
  ret i1 0
unreachable_323:
  br label %when_end_290
when_next_322:
  %191 = icmp eq i64 %174, 11
  br i1 %191, label %when_case_324, label %when_next_325
when_case_324:
  ret i1 0
unreachable_326:
  br label %when_end_290
when_next_325:
  br label %when_end_290
when_end_290:
  br label %when_end_0
when_next_289:
  %192 = icmp eq i64 %5, 8
  br i1 %192, label %when_case_327, label %when_next_328
when_case_327:
  %193 = load i64**, i64*** %ptr_b
  %194 = load i64*, i64** %193
  %195 = getelementptr inbounds i64, i64* %194, i64 0
  %196 = bitcast i64* %195 to i64*
  %197 = load i64, i64* %196, align 8
  %198 = icmp eq i64 %197, 0
  br i1 %198, label %when_case_330, label %when_next_331
when_case_330:
  ret i1 0
unreachable_332:
  br label %when_end_329
when_next_331:
  %199 = icmp eq i64 %197, 1
  br i1 %199, label %when_case_333, label %when_next_334
when_case_333:
  ret i1 0
unreachable_335:
  br label %when_end_329
when_next_334:
  %200 = icmp eq i64 %197, 2
  br i1 %200, label %when_case_336, label %when_next_337
when_case_336:
  ret i1 0
unreachable_338:
  br label %when_end_329
when_next_337:
  %201 = icmp eq i64 %197, 3
  br i1 %201, label %when_case_339, label %when_next_340
when_case_339:
  ret i1 0
unreachable_341:
  br label %when_end_329
when_next_340:
  %202 = icmp eq i64 %197, 4
  br i1 %202, label %when_case_342, label %when_next_343
when_case_342:
  ret i1 0
unreachable_344:
  br label %when_end_329
when_next_343:
  %203 = icmp eq i64 %197, 5
  br i1 %203, label %when_case_345, label %when_next_346
when_case_345:
  ret i1 0
unreachable_347:
  br label %when_end_329
when_next_346:
  %204 = icmp eq i64 %197, 6
  br i1 %204, label %when_case_348, label %when_next_349
when_case_348:
  ret i1 0
unreachable_350:
  br label %when_end_329
when_next_349:
  %205 = icmp eq i64 %197, 7
  br i1 %205, label %when_case_351, label %when_next_352
when_case_351:
  ret i1 0
unreachable_353:
  br label %when_end_329
when_next_352:
  %206 = icmp eq i64 %197, 8
  br i1 %206, label %when_case_354, label %when_next_355
when_case_354:
  ret i1 1
unreachable_356:
  br label %when_end_329
when_next_355:
  %207 = icmp eq i64 %197, 9
  br i1 %207, label %when_case_357, label %when_next_358
when_case_357:
  ret i1 0
unreachable_359:
  br label %when_end_329
when_next_358:
  %208 = icmp eq i64 %197, 10
  br i1 %208, label %when_case_360, label %when_next_361
when_case_360:
  ret i1 0
unreachable_362:
  br label %when_end_329
when_next_361:
  %209 = icmp eq i64 %197, 11
  br i1 %209, label %when_case_363, label %when_next_364
when_case_363:
  ret i1 0
unreachable_365:
  br label %when_end_329
when_next_364:
  br label %when_end_329
when_end_329:
  br label %when_end_0
when_next_328:
  %210 = icmp eq i64 %5, 9
  br i1 %210, label %when_case_366, label %when_next_367
when_case_366:
  %211 = getelementptr inbounds i64, i64* %2, i64 1
  %212 = bitcast i64* %211 to i64***
  %213 = load i64**, i64*** %212, align 8
  %214 = load i64**, i64*** %ptr_b
  %215 = load i64*, i64** %214
  %216 = getelementptr inbounds i64, i64* %215, i64 0
  %217 = bitcast i64* %216 to i64*
  %218 = load i64, i64* %217, align 8
  %219 = icmp eq i64 %218, 0
  br i1 %219, label %when_case_369, label %when_next_370
when_case_369:
  ret i1 0
unreachable_371:
  br label %when_end_368
when_next_370:
  %220 = icmp eq i64 %218, 1
  br i1 %220, label %when_case_372, label %when_next_373
when_case_372:
  ret i1 0
unreachable_374:
  br label %when_end_368
when_next_373:
  %221 = icmp eq i64 %218, 2
  br i1 %221, label %when_case_375, label %when_next_376
when_case_375:
  ret i1 0
unreachable_377:
  br label %when_end_368
when_next_376:
  %222 = icmp eq i64 %218, 3
  br i1 %222, label %when_case_378, label %when_next_379
when_case_378:
  ret i1 0
unreachable_380:
  br label %when_end_368
when_next_379:
  %223 = icmp eq i64 %218, 4
  br i1 %223, label %when_case_381, label %when_next_382
when_case_381:
  ret i1 0
unreachable_383:
  br label %when_end_368
when_next_382:
  %224 = icmp eq i64 %218, 5
  br i1 %224, label %when_case_384, label %when_next_385
when_case_384:
  ret i1 0
unreachable_386:
  br label %when_end_368
when_next_385:
  %225 = icmp eq i64 %218, 6
  br i1 %225, label %when_case_387, label %when_next_388
when_case_387:
  ret i1 0
unreachable_389:
  br label %when_end_368
when_next_388:
  %226 = icmp eq i64 %218, 7
  br i1 %226, label %when_case_390, label %when_next_391
when_case_390:
  ret i1 0
unreachable_392:
  br label %when_end_368
when_next_391:
  %227 = icmp eq i64 %218, 8
  br i1 %227, label %when_case_393, label %when_next_394
when_case_393:
  ret i1 0
unreachable_395:
  br label %when_end_368
when_next_394:
  %228 = icmp eq i64 %218, 9
  br i1 %228, label %when_case_396, label %when_next_397
when_case_396:
  %229 = getelementptr inbounds i64, i64* %215, i64 1
  %230 = bitcast i64* %229 to i64***
  %231 = load i64**, i64*** %230, align 8
  %232 = call i1 @type_info_equals(i64** %213, i64** %231)
  ret i1 %232
unreachable_398:
  br label %when_end_368
when_next_397:
  %233 = icmp eq i64 %218, 10
  br i1 %233, label %when_case_399, label %when_next_400
when_case_399:
  ret i1 0
unreachable_401:
  br label %when_end_368
when_next_400:
  %234 = icmp eq i64 %218, 11
  br i1 %234, label %when_case_402, label %when_next_403
when_case_402:
  ret i1 0
unreachable_404:
  br label %when_end_368
when_next_403:
  br label %when_end_368
when_end_368:
  br label %when_end_0
when_next_367:
  %235 = icmp eq i64 %5, 10
  br i1 %235, label %when_case_405, label %when_next_406
when_case_405:
  %236 = getelementptr inbounds i64, i64* %2, i64 1
  %237 = bitcast i64* %236 to i64***
  %238 = load i64**, i64*** %237, align 8
  store i64** %238, i64** %213
  %239 = load i64**, i64*** %ptr_b
  %240 = load i64*, i64** %239
  %241 = getelementptr inbounds i64, i64* %240, i64 0
  %242 = bitcast i64* %241 to i64*
  %243 = load i64, i64* %242, align 8
  %244 = icmp eq i64 %243, 0
  br i1 %244, label %when_case_408, label %when_next_409
when_case_408:
  ret i1 0
unreachable_410:
  br label %when_end_407
when_next_409:
  %245 = icmp eq i64 %243, 1
  br i1 %245, label %when_case_411, label %when_next_412
when_case_411:
  ret i1 0
unreachable_413:
  br label %when_end_407
when_next_412:
  %246 = icmp eq i64 %243, 2
  br i1 %246, label %when_case_414, label %when_next_415
when_case_414:
  ret i1 0
unreachable_416:
  br label %when_end_407
when_next_415:
  %247 = icmp eq i64 %243, 3
  br i1 %247, label %when_case_417, label %when_next_418
when_case_417:
  ret i1 0
unreachable_419:
  br label %when_end_407
when_next_418:
  %248 = icmp eq i64 %243, 4
  br i1 %248, label %when_case_420, label %when_next_421
when_case_420:
  ret i1 0
unreachable_422:
  br label %when_end_407
when_next_421:
  %249 = icmp eq i64 %243, 5
  br i1 %249, label %when_case_423, label %when_next_424
when_case_423:
  ret i1 0
unreachable_425:
  br label %when_end_407
when_next_424:
  %250 = icmp eq i64 %243, 6
  br i1 %250, label %when_case_426, label %when_next_427
when_case_426:
  ret i1 0
unreachable_428:
  br label %when_end_407
when_next_427:
  %251 = icmp eq i64 %243, 7
  br i1 %251, label %when_case_429, label %when_next_430
when_case_429:
  ret i1 0
unreachable_431:
  br label %when_end_407
when_next_430:
  %252 = icmp eq i64 %243, 8
  br i1 %252, label %when_case_432, label %when_next_433
when_case_432:
  ret i1 0
unreachable_434:
  br label %when_end_407
when_next_433:
  %253 = icmp eq i64 %243, 9
  br i1 %253, label %when_case_435, label %when_next_436
when_case_435:
  ret i1 0
unreachable_437:
  br label %when_end_407
when_next_436:
  %254 = icmp eq i64 %243, 10
  br i1 %254, label %when_case_438, label %when_next_439
when_case_438:
  %255 = getelementptr inbounds i64, i64* %240, i64 1
  %256 = bitcast i64* %255 to i64***
  %257 = load i64**, i64*** %256, align 8
  store i64** %257, i64** %231
  %258 = call i1 @type_info_equals(i64** %213, i64** %231)
  ret i1 %258
unreachable_440:
  br label %when_end_407
when_next_439:
  %259 = icmp eq i64 %243, 11
  br i1 %259, label %when_case_441, label %when_next_442
when_case_441:
  ret i1 0
unreachable_443:
  br label %when_end_407
when_next_442:
  br label %when_end_407
when_end_407:
  br label %when_end_0
when_next_406:
  %260 = icmp eq i64 %5, 11
  br i1 %260, label %when_case_444, label %when_next_445
when_case_444:
  %261 = load i64**, i64*** %ptr_b
  %262 = load i64*, i64** %261
  %263 = getelementptr inbounds i64, i64* %262, i64 0
  %264 = bitcast i64* %263 to i64*
  %265 = load i64, i64* %264, align 8
  %266 = icmp eq i64 %265, 0
  br i1 %266, label %when_case_447, label %when_next_448
when_case_447:
  ret i1 0
unreachable_449:
  br label %when_end_446
when_next_448:
  %267 = icmp eq i64 %265, 1
  br i1 %267, label %when_case_450, label %when_next_451
when_case_450:
  ret i1 0
unreachable_452:
  br label %when_end_446
when_next_451:
  %268 = icmp eq i64 %265, 2
  br i1 %268, label %when_case_453, label %when_next_454
when_case_453:
  ret i1 0
unreachable_455:
  br label %when_end_446
when_next_454:
  %269 = icmp eq i64 %265, 3
  br i1 %269, label %when_case_456, label %when_next_457
when_case_456:
  ret i1 0
unreachable_458:
  br label %when_end_446
when_next_457:
  %270 = icmp eq i64 %265, 4
  br i1 %270, label %when_case_459, label %when_next_460
when_case_459:
  ret i1 0
unreachable_461:
  br label %when_end_446
when_next_460:
  %271 = icmp eq i64 %265, 5
  br i1 %271, label %when_case_462, label %when_next_463
when_case_462:
  ret i1 0
unreachable_464:
  br label %when_end_446
when_next_463:
  %272 = icmp eq i64 %265, 6
  br i1 %272, label %when_case_465, label %when_next_466
when_case_465:
  ret i1 0
unreachable_467:
  br label %when_end_446
when_next_466:
  %273 = icmp eq i64 %265, 7
  br i1 %273, label %when_case_468, label %when_next_469
when_case_468:
  ret i1 0
unreachable_470:
  br label %when_end_446
when_next_469:
  %274 = icmp eq i64 %265, 8
  br i1 %274, label %when_case_471, label %when_next_472
when_case_471:
  ret i1 0
unreachable_473:
  br label %when_end_446
when_next_472:
  %275 = icmp eq i64 %265, 9
  br i1 %275, label %when_case_474, label %when_next_475
when_case_474:
  ret i1 0
unreachable_476:
  br label %when_end_446
when_next_475:
  %276 = icmp eq i64 %265, 10
  br i1 %276, label %when_case_477, label %when_next_478
when_case_477:
  ret i1 0
unreachable_479:
  br label %when_end_446
when_next_478:
  %277 = icmp eq i64 %265, 11
  br i1 %277, label %when_case_480, label %when_next_481
when_case_480:
  ret i1 1
unreachable_482:
  br label %when_end_446
when_next_481:
  br label %when_end_446
when_end_446:
  br label %when_end_0
when_next_445:
  br label %when_end_0
when_end_0:
  ret i1 0
unreachable_483:
  ret i1 0
}

define i1 @type_info_is_array(i64** noalias %param_info) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_size_a = alloca i64
  %ptr_err = alloca i64**
  %ptr_arr = alloca i64**
  %ptr_sb = alloca i64
  %ptr_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_inner_box = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_ty = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inner_str = alloca i8*
  %ptr_s = alloca i64
  %ptr_source = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_info = alloca i64**
  %ptr_a = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_ret = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_span = alloca i64**
  %ptr_sa = alloca i64
  %ptr_message = alloca i8*
  store i64** %param_info, i64*** %ptr_info
  %1 = load i64**, i64*** %ptr_info
  %2 = load i64*, i64** %1
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %when_case_1, label %when_next_2
when_case_1:
  ret i1 0
unreachable_3:
  br label %when_end_0
when_next_2:
  %7 = icmp eq i64 %5, 1
  br i1 %7, label %when_case_4, label %when_next_5
when_case_4:
  ret i1 0
unreachable_6:
  br label %when_end_0
when_next_5:
  %8 = icmp eq i64 %5, 2
  br i1 %8, label %when_case_7, label %when_next_8
when_case_7:
  ret i1 0
unreachable_9:
  br label %when_end_0
when_next_8:
  %9 = icmp eq i64 %5, 3
  br i1 %9, label %when_case_10, label %when_next_11
when_case_10:
  ret i1 0
unreachable_12:
  br label %when_end_0
when_next_11:
  %10 = icmp eq i64 %5, 4
  br i1 %10, label %when_case_13, label %when_next_14
when_case_13:
  ret i1 0
unreachable_15:
  br label %when_end_0
when_next_14:
  %11 = icmp eq i64 %5, 5
  br i1 %11, label %when_case_16, label %when_next_17
when_case_16:
  ret i1 0
unreachable_18:
  br label %when_end_0
when_next_17:
  %12 = icmp eq i64 %5, 6
  br i1 %12, label %when_case_19, label %when_next_20
when_case_19:
  ret i1 1
unreachable_21:
  br label %when_end_0
when_next_20:
  %13 = icmp eq i64 %5, 7
  br i1 %13, label %when_case_22, label %when_next_23
when_case_22:
  ret i1 0
unreachable_24:
  br label %when_end_0
when_next_23:
  %14 = icmp eq i64 %5, 8
  br i1 %14, label %when_case_25, label %when_next_26
when_case_25:
  ret i1 0
unreachable_27:
  br label %when_end_0
when_next_26:
  %15 = icmp eq i64 %5, 9
  br i1 %15, label %when_case_28, label %when_next_29
when_case_28:
  ret i1 0
unreachable_30:
  br label %when_end_0
when_next_29:
  %16 = icmp eq i64 %5, 10
  br i1 %16, label %when_case_31, label %when_next_32
when_case_31:
  ret i1 0
unreachable_33:
  br label %when_end_0
when_next_32:
  %17 = icmp eq i64 %5, 11
  br i1 %17, label %when_case_34, label %when_next_35
when_case_34:
  ret i1 0
unreachable_36:
  br label %when_end_0
when_next_35:
  br label %when_end_0
when_end_0:
  ret i1 0
unreachable_37:
  ret i1 0
}

define i64** @type_info_get_array_inner(i64** noalias %param_info) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_size_a = alloca i64
  %ptr_err = alloca i64**
  %ptr_arr = alloca i64**
  %ptr_sb = alloca i64
  %ptr_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_inner_box = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_ty = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inner_str = alloca i8*
  %ptr_s = alloca i64
  %ptr_source = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_info = alloca i64**
  %ptr_a = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_ret = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_span = alloca i64**
  %ptr_sa = alloca i64
  %ptr_message = alloca i8*
  store i64** %param_info, i64*** %ptr_info
  %1 = load i64**, i64*** %ptr_info
  %2 = load i64*, i64** %1
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %when_case_1, label %when_next_2
when_case_1:
  br label %when_end_0
when_next_2:
  %7 = icmp eq i64 %5, 1
  br i1 %7, label %when_case_3, label %when_next_4
when_case_3:
  br label %when_end_0
when_next_4:
  %8 = icmp eq i64 %5, 2
  br i1 %8, label %when_case_5, label %when_next_6
when_case_5:
  br label %when_end_0
when_next_6:
  %9 = icmp eq i64 %5, 3
  br i1 %9, label %when_case_7, label %when_next_8
when_case_7:
  br label %when_end_0
when_next_8:
  %10 = icmp eq i64 %5, 4
  br i1 %10, label %when_case_9, label %when_next_10
when_case_9:
  br label %when_end_0
when_next_10:
  %11 = icmp eq i64 %5, 5
  br i1 %11, label %when_case_11, label %when_next_12
when_case_11:
  br label %when_end_0
when_next_12:
  %12 = icmp eq i64 %5, 6
  br i1 %12, label %when_case_13, label %when_next_14
when_case_13:
  %13 = getelementptr inbounds i64, i64* %2, i64 1
  %14 = bitcast i64* %13 to i64***
  %15 = load i64**, i64*** %14, align 8
  store i64** %15, i64*** %ptr_arr
  %16 = load i64**, i64*** %ptr_arr
  %17 = bitcast i64** %16 to i64*
  %18 = getelementptr inbounds i64, i64* %17, i64 0
  %19 = bitcast i64* %18 to i8**
  %20 = load i8*, i8** %19, align 8
  store i8* %20, i64*** %ptr_ret
  %21 = load i64**, i64*** %ptr_ret
  ret i64** %21
unreachable_15:
  br label %when_end_0
when_next_14:
  %22 = icmp eq i64 %5, 7
  br i1 %22, label %when_case_16, label %when_next_17
when_case_16:
  br label %when_end_0
when_next_17:
  %23 = icmp eq i64 %5, 8
  br i1 %23, label %when_case_18, label %when_next_19
when_case_18:
  br label %when_end_0
when_next_19:
  %24 = icmp eq i64 %5, 9
  br i1 %24, label %when_case_20, label %when_next_21
when_case_20:
  br label %when_end_0
when_next_21:
  %25 = icmp eq i64 %5, 10
  br i1 %25, label %when_case_22, label %when_next_23
when_case_22:
  br label %when_end_0
when_next_23:
  %26 = icmp eq i64 %5, 11
  br i1 %26, label %when_case_24, label %when_next_25
when_case_24:
  br label %when_end_0
when_next_25:
  br label %when_end_0
when_end_0:
  store i8* null, i64*** %ptr_ret
  %27 = load i64**, i64*** %ptr_ret
  ret i64** %27
unreachable_26:
  ret i64** null
}

