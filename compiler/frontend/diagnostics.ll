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


define void @print_string(i8* noalias %param_value) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s2 = alloca i64
  %ptr_span = alloca i64**
  %ptr_s = alloca i64
  %ptr_err = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_end_line = alloca i64
  %ptr_end_col = alloca i64
  %ptr_start_col = alloca i64
  %ptr_val = alloca i64
  %ptr_s1 = alloca i64
  %ptr_value = alloca i8*
  store i8* %param_value, i8** %ptr_value
  %1 = load i8*, i8** %ptr_value
  %2 = call i64 @puts(i8* %1)
  ret void
}

define i64** @alloc_span(i64 %start_line, i64 %start_col, i64 %end_line, i64 %end_col) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s2 = alloca i64
  %ptr_span = alloca i64**
  %ptr_s = alloca i64
  %ptr_err = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_end_line = alloca i64
  %ptr_end_col = alloca i64
  %ptr_start_col = alloca i64
  %ptr_val = alloca i64
  %ptr_s1 = alloca i64
  %ptr_value = alloca i8*
  store i64 %start_line, i64* %ptr_start_line
  store i64 %start_col, i64* %ptr_start_col
  store i64 %end_line, i64* %ptr_end_line
  store i64 %end_col, i64* %ptr_end_col
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
  %9 = load i64, i64* %ptr_start_col
  %10 = bitcast i64** %8 to i64*
  %11 = getelementptr inbounds i64, i64* %10, i64 1
  %12 = bitcast i64* %11 to i64*
  store i64 %9, i64* %12, align 8
  %13 = load i64**, i64*** %ptr_span
  %14 = load i64, i64* %ptr_end_line
  %15 = bitcast i64** %13 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i64*
  store i64 %14, i64* %17, align 8
  %18 = load i64**, i64*** %ptr_span
  %19 = load i64, i64* %ptr_end_col
  %20 = bitcast i64** %18 to i64*
  %21 = getelementptr inbounds i64, i64* %20, i64 3
  %22 = bitcast i64* %21 to i64*
  store i64 %19, i64* %22, align 8
  %23 = load i64**, i64*** %ptr_span
  ret i64** %23
unreachable_0:
  ret i64** null
}

define i64** @merge_span(i64** noalias %param_a, i64** noalias %param_b) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s2 = alloca i64
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_s = alloca i64
  %ptr_err = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_end_line = alloca i64
  %ptr_end_col = alloca i64
  %ptr_a = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_val = alloca i64
  %ptr_s1 = alloca i64
  %ptr_value = alloca i8*
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
  store i64 %26, i64* %ptr_start_col
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
  store i64 %53, i64* %ptr_start_col
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
  store i64 %69, i64* %ptr_start_col
  br label %end_if_7
end_if_7:
  %70 = load i64**, i64*** %ptr_a
  %71 = bitcast i64** %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i64*
  %74 = load i64, i64* %73, align 8
  store i64 %74, i64* %ptr_end_line
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
  store i64 %90, i64* %ptr_end_line
  br label %end_if_9
end_if_9:
  %91 = load i64**, i64*** %ptr_a
  %92 = bitcast i64** %91 to i64*
  %93 = getelementptr inbounds i64, i64* %92, i64 3
  %94 = bitcast i64* %93 to i64*
  %95 = load i64, i64* %94, align 8
  store i64 %95, i64* %ptr_end_col
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
  store i64 %122, i64* %ptr_end_col
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
  store i64 %138, i64* %ptr_end_col
  br label %end_if_15
end_if_15:
  %139 = load i64, i64* %ptr_start_line
  %140 = load i64, i64* %ptr_start_col
  %141 = load i64, i64* %ptr_end_line
  %142 = load i64, i64* %ptr_end_col
  %143 = call i64** @alloc_span(i64 %139, i64 %140, i64 %141, i64 %142)
  ret i64** %143
unreachable_16:
  ret i64** null
}

define i64** @alloc_diagnostic_error(i64** noalias %param_span, i8* noalias %param_message) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s2 = alloca i64
  %ptr_message = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_s = alloca i64
  %ptr_err = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_end_line = alloca i64
  %ptr_end_col = alloca i64
  %ptr_a = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_val = alloca i64
  %ptr_s1 = alloca i64
  %ptr_value = alloca i8*
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
  %ptr_span = alloca i64**
  %ptr_source = alloca i8*
  %ptr_err = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_s1 = alloca i64
  %ptr_s2 = alloca i64
  %ptr_b = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s = alloca i64
  %ptr_end_line = alloca i64
  %ptr_end_col = alloca i64
  %ptr_a = alloca i64**
  %ptr_message = alloca i8*
  %ptr_val = alloca i64
  %ptr_value = alloca i8*
  store i8* %param_source, i8** %ptr_source
  store i64** %param_span, i64*** %ptr_span
  store i8* %param_message, i8** %ptr_message
  %1 = load i8*, i8** %ptr_message
  %2 = call i64 @puts(i8* %1)
  ret void
}

