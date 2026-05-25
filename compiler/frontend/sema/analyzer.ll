; ModuleID = 'nera_program'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

declare i8* @malloc(i64)
declare void @free(i8*)
declare i8* @strncpy(i8*, i8*, i64)
declare i32 @strcmp(i8*, i8*)
declare i64 @strlen(i64**)
declare i8* @int_to_string(i1)
declare i8* @concat_strings(i64, i64)
declare void @print_int(i8*)
declare void @print_float(i8*)
declare i64 @puts(i8*)
declare i64** @alloc_array_DiagnosticError(i64, i64)
declare i64* @ptr_read_DiagnosticError(i64**, i64)
declare void @ptr_write_DiagnosticError(i64**, i64, i1)
declare void @free_array_DiagnosticError(i64**)
declare i64* @ptr_read_Spanned_Declaration(i64**, i64)
declare i64* @ptr_read_Param(i64**, i64)
declare i64* @ptr_read_Spanned_Statement(i64**, i64)
declare i64* @ptr_read_Spanned_Expression(i64**, i64)
declare i64* @ptr_read_WhenCase(i64**, i64)

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
@.str.19 = private unnamed_addr constant [21 x i8] c"Undefined identifier\00", align 1
@.str.20 = private unnamed_addr constant [7 x i8] c"length\00", align 1
@.str.21 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.22 = private unnamed_addr constant [1 x i8] c"\00", align 1

define void @print_string(i8* noalias %param_value) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i8* %param_value, i8** %ptr_value
  %1 = load i8*, i8** %ptr_value
  %2 = call i64 @puts(i8* %1)
  ret void
}

define i64** @alloc_span(i64 %start_line, i64 %start_col, i64 %end_line, i64 %end_col) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
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
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
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
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
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
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
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
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
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
  store i64 2, i64* %20
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
  store i64 5, i64* %30
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
  %88 = call i8* @malloc(i64 8)
  %89 = bitcast i8* %88 to i64*
  store i64* %9, i64* %89
  %90 = bitcast i64* %87 to i64*
  %91 = getelementptr inbounds i64, i64* %90, i64 0
  %92 = bitcast i64* %91 to i64**
  store i64* %89, i64** %92, align 8
  %93 = load i64**, i64*** %ptr_ty
  %94 = bitcast i64** %93 to i64*
  %95 = getelementptr inbounds i64, i64* %94, i64 3
  %96 = bitcast i64* %95 to i64*
  %97 = load i64, i64* %96, align 8
  %98 = bitcast i64* %87 to i64*
  %99 = getelementptr inbounds i64, i64* %98, i64 1
  %100 = bitcast i64* %99 to i64*
  store i64 %97, i64* %100, align 8
  %101 = call i8* @malloc(i64 16)
  %102 = bitcast i8* %101 to i64*
  %103 = getelementptr inbounds i64, i64* %102, i64 0
  store i64 6, i64* %103
  %104 = getelementptr inbounds i64, i64* %102, i64 1
  %105 = bitcast i64* %104 to i64**
  store i64* %87, i64** %105
  store i64* %102, i64* %9
  br label %end_if_22
end_if_22:
  %106 = load i64**, i64*** %ptr_ty
  %107 = bitcast i64** %106 to i64*
  %108 = getelementptr inbounds i64, i64* %107, i64 4
  %109 = bitcast i64* %108 to i1*
  %110 = load i1, i1* %109, align 8
  br i1 %110, label %then_23, label %end_if_24
then_23:
  %111 = call i8* @malloc(i64 8)
  %112 = bitcast i8* %111 to i64*
  store i64* %112, i64* %89
  store i64* %9, i64* %89
  %113 = call i8* @malloc(i64 16)
  %114 = bitcast i8* %113 to i64*
  %115 = getelementptr inbounds i64, i64* %114, i64 0
  store i64 9, i64* %115
  %116 = getelementptr inbounds i64, i64* %114, i64 1
  %117 = bitcast i64* %116 to i64**
  store i64* %89, i64** %117
  store i64* %114, i64* %9
  br label %end_if_24
end_if_24:
  %118 = load i64**, i64*** %ptr_ty
  %119 = bitcast i64** %118 to i64*
  %120 = getelementptr inbounds i64, i64* %119, i64 5
  %121 = bitcast i64* %120 to i1*
  %122 = load i1, i1* %121, align 8
  br i1 %122, label %then_25, label %end_if_26
then_25:
  %123 = call i8* @malloc(i64 8)
  %124 = bitcast i8* %123 to i64*
  store i64* %124, i64* %89
  store i64* %9, i64* %89
  %125 = call i8* @malloc(i64 16)
  %126 = bitcast i8* %125 to i64*
  %127 = getelementptr inbounds i64, i64* %126, i64 0
  store i64 10, i64* %127
  %128 = getelementptr inbounds i64, i64* %126, i64 1
  %129 = bitcast i64* %128 to i64**
  store i64* %89, i64** %129
  store i64* %126, i64* %9
  br label %end_if_26
end_if_26:
  %130 = call i8* @malloc(i64 8)
  %131 = bitcast i8* %130 to i64*
  store i64* %9, i64* %131
  ret i64* %131
unreachable_27:
  ret i64** null
}

define i8* @type_info_to_string(i64** noalias %param_info) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
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
  %7 = icmp eq i64 %5, 2
  br i1 %7, label %when_case_4, label %when_next_5
when_case_4:
  ret i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.8, i64 0, i64 0)
unreachable_6:
  br label %when_end_0
when_next_5:
  %8 = icmp eq i64 %5, 5
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
  %16 = bitcast i64** %15 to i64*
  %17 = getelementptr inbounds i64, i64* %16, i64 0
  %18 = bitcast i64* %17 to i8**
  %19 = load i8*, i8** %18, align 8
  %20 = call i8* @type_info_to_string(i8* %19)
  store i8* %20, i8** %ptr_inner_str
  %21 = load i8*, i8** %ptr_inner_str
  %22 = add nsw i8* %21, getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i64 0, i64 0)
  ret i8* %22
unreachable_21:
  br label %when_end_0
when_next_20:
  %23 = icmp eq i64 %5, 7
  br i1 %23, label %when_case_22, label %when_next_23
when_case_22:
  %24 = getelementptr inbounds i64, i64* %2, i64 1
  %25 = bitcast i64* %24 to i8**
  %26 = load i8*, i8** %25, align 8
  ret i8* %26
unreachable_24:
  br label %when_end_0
when_next_23:
  %27 = icmp eq i64 %5, 8
  br i1 %27, label %when_case_25, label %when_next_26
when_case_25:
  ret i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.14, i64 0, i64 0)
unreachable_27:
  br label %when_end_0
when_next_26:
  %28 = icmp eq i64 %5, 9
  br i1 %28, label %when_case_28, label %when_next_29
when_case_28:
  %29 = getelementptr inbounds i64, i64* %2, i64 1
  %30 = bitcast i64* %29 to i64***
  %31 = load i64**, i64*** %30, align 8
  store i64** %31, i64*** %ptr_inner
  %32 = load i64**, i64*** %ptr_inner
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
  store i64** %39, i64*** %ptr_inner
  %40 = load i64**, i64*** %ptr_inner
  %41 = call i8* @type_info_to_string(i64** %40)
  store i8* %41, i8** %ptr_inner_str
  %42 = load i8*, i8** %ptr_inner_str
  %43 = add nsw i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.16, i64 0, i64 0), %42
  ret i8* %43
unreachable_33:
  br label %when_end_0
when_next_32:
  %44 = icmp eq i64 %5, 11
  br i1 %44, label %when_case_34, label %when_next_35
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
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
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
  %13 = icmp eq i64 %11, 2
  br i1 %13, label %when_case_7, label %when_next_8
when_case_7:
  ret i1 0
unreachable_9:
  br label %when_end_3
when_next_8:
  %14 = icmp eq i64 %11, 5
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
  %24 = icmp eq i64 %5, 2
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
  %31 = icmp eq i64 %29, 2
  br i1 %31, label %when_case_46, label %when_next_47
when_case_46:
  ret i1 1
unreachable_48:
  br label %when_end_42
when_next_47:
  %32 = icmp eq i64 %29, 5
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
  %42 = icmp eq i64 %5, 5
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
  %49 = icmp eq i64 %47, 2
  br i1 %49, label %when_case_85, label %when_next_86
when_case_85:
  ret i1 0
unreachable_87:
  br label %when_end_81
when_next_86:
  %50 = icmp eq i64 %47, 5
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
  %67 = icmp eq i64 %65, 2
  br i1 %67, label %when_case_124, label %when_next_125
when_case_124:
  ret i1 0
unreachable_126:
  br label %when_end_120
when_next_125:
  %68 = icmp eq i64 %65, 5
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
  %85 = icmp eq i64 %83, 2
  br i1 %85, label %when_case_163, label %when_next_164
when_case_163:
  ret i1 0
unreachable_165:
  br label %when_end_159
when_next_164:
  %86 = icmp eq i64 %83, 5
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
  %103 = icmp eq i64 %101, 2
  br i1 %103, label %when_case_202, label %when_next_203
when_case_202:
  ret i1 0
unreachable_204:
  br label %when_end_198
when_next_203:
  %104 = icmp eq i64 %101, 5
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
  %124 = icmp eq i64 %122, 2
  br i1 %124, label %when_case_241, label %when_next_242
when_case_241:
  ret i1 0
unreachable_243:
  br label %when_end_237
when_next_242:
  %125 = icmp eq i64 %122, 5
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
  %176 = icmp eq i64 %174, 2
  br i1 %176, label %when_case_294, label %when_next_295
when_case_294:
  ret i1 0
unreachable_296:
  br label %when_end_290
when_next_295:
  %177 = icmp eq i64 %174, 5
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
  %199 = icmp eq i64 %197, 2
  br i1 %199, label %when_case_333, label %when_next_334
when_case_333:
  ret i1 0
unreachable_335:
  br label %when_end_329
when_next_334:
  %200 = icmp eq i64 %197, 5
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
  %220 = icmp eq i64 %218, 2
  br i1 %220, label %when_case_372, label %when_next_373
when_case_372:
  ret i1 0
unreachable_374:
  br label %when_end_368
when_next_373:
  %221 = icmp eq i64 %218, 5
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
  %245 = icmp eq i64 %243, 2
  br i1 %245, label %when_case_411, label %when_next_412
when_case_411:
  ret i1 0
unreachable_413:
  br label %when_end_407
when_next_412:
  %246 = icmp eq i64 %243, 5
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
  %267 = icmp eq i64 %265, 2
  br i1 %267, label %when_case_450, label %when_next_451
when_case_450:
  ret i1 0
unreachable_452:
  br label %when_end_446
when_next_451:
  %268 = icmp eq i64 %265, 5
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
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
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
  %7 = icmp eq i64 %5, 2
  br i1 %7, label %when_case_4, label %when_next_5
when_case_4:
  ret i1 0
unreachable_6:
  br label %when_end_0
when_next_5:
  %8 = icmp eq i64 %5, 5
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
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
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
  %7 = icmp eq i64 %5, 2
  br i1 %7, label %when_case_3, label %when_next_4
when_case_3:
  br label %when_end_0
when_next_4:
  %8 = icmp eq i64 %5, 5
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
  %16 = bitcast i64** %15 to i64*
  %17 = getelementptr inbounds i64, i64* %16, i64 0
  %18 = bitcast i64* %17 to i8**
  %19 = load i8*, i8** %18, align 8
  ret i8* %19
unreachable_15:
  br label %when_end_0
when_next_14:
  %20 = icmp eq i64 %5, 7
  br i1 %20, label %when_case_16, label %when_next_17
when_case_16:
  br label %when_end_0
when_next_17:
  %21 = icmp eq i64 %5, 8
  br i1 %21, label %when_case_18, label %when_next_19
when_case_18:
  br label %when_end_0
when_next_19:
  %22 = icmp eq i64 %5, 9
  br i1 %22, label %when_case_20, label %when_next_21
when_case_20:
  br label %when_end_0
when_next_21:
  %23 = icmp eq i64 %5, 10
  br i1 %23, label %when_case_22, label %when_next_23
when_case_22:
  br label %when_end_0
when_next_23:
  %24 = icmp eq i64 %5, 11
  br i1 %24, label %when_case_24, label %when_next_25
when_case_24:
  br label %when_end_0
when_next_25:
  br label %when_end_0
when_end_0:
  store i8* null, i8* %19
  ret i8* %19
unreachable_26:
  ret i64** null
}

define i64** @env_new() {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  %1 = call i8* @malloc(i64 8)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_env
  %3 = call i8* @malloc(i64 16)
  %4 = bitcast i8* %3 to i64*
  %5 = bitcast i64* %4 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i8**
  store i8* null, i8** %7, align 8
  %8 = bitcast i64* %4 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 1
  %10 = bitcast i64* %9 to i8**
  store i8* null, i8** %10, align 8
  %11 = load i64**, i64*** %ptr_env
  %12 = bitcast i64** %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i64**
  store i64* %4, i64** %14, align 8
  %15 = load i64**, i64*** %ptr_env
  ret i64** %15
unreachable_0:
  ret i64** null
}

define void @env_enter_scope(i64** noalias %param_env) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_env, i64*** %ptr_env
  %1 = call i8* @malloc(i64 16)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_new_scope
  %3 = load i64**, i64*** %ptr_new_scope
  %4 = bitcast i64** %3 to i64*
  %5 = getelementptr inbounds i64, i64* %4, i64 0
  %6 = bitcast i64* %5 to i8**
  store i8* null, i8** %6, align 8
  %7 = load i64**, i64*** %ptr_env
  %8 = bitcast i64** %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 0
  %10 = bitcast i64* %9 to i8**
  %11 = load i8*, i8** %10, align 8
  %12 = load i64**, i64*** %ptr_new_scope
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 1
  %15 = bitcast i64* %14 to i8**
  store i8* %11, i8** %15, align 8
  %16 = load i64**, i64*** %ptr_env
  %17 = load i64**, i64*** %ptr_new_scope
  %18 = bitcast i64** %16 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  %20 = bitcast i64* %19 to i64***
  store i64** %17, i64*** %20, align 8
  ret void
}

define void @env_exit_scope(i64** noalias %param_env) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_env, i64*** %ptr_env
  %1 = load i64**, i64*** %ptr_env
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  store i8* %5, i64*** %ptr_cur
  %6 = load i64**, i64*** %ptr_cur
  %7 = icmp ne i64** %6, null
  br i1 %7, label %then_0, label %end_if_1
then_0:
  %8 = load i64**, i64*** %ptr_cur
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i8**
  %12 = load i8*, i8** %11, align 8
  %13 = load i64**, i64*** %ptr_env
  %14 = bitcast i64** %13 to i64*
  %15 = getelementptr inbounds i64, i64* %14, i64 0
  %16 = bitcast i64* %15 to i8**
  store i8* %12, i8** %16, align 8
  br label %end_if_1
end_if_1:
  ret void
}

define void @env_define(i64** noalias %param_env, i8* noalias %param_name, i64** noalias %param_sym) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_env, i64*** %ptr_env
  store i8* %param_name, i8** %ptr_name
  store i64** %param_sym, i64*** %ptr_sym
  %1 = load i64**, i64*** %ptr_env
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  store i8* %5, i64*** %ptr_cur
  %6 = load i64**, i64*** %ptr_cur
  %7 = icmp ne i64** %6, null
  br i1 %7, label %then_0, label %end_if_1
then_0:
  %8 = call i8* @malloc(i64 24)
  %9 = bitcast i8* %8 to i64*
  store i64* %9, i64*** %ptr_new_entry
  %10 = load i64**, i64*** %ptr_new_entry
  %11 = load i8*, i8** %ptr_name
  %12 = bitcast i64** %10 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  store i8* %11, i8** %14, align 8
  %15 = load i64**, i64*** %ptr_new_entry
  %16 = load i64**, i64*** %ptr_sym
  %17 = bitcast i64** %15 to i64*
  %18 = getelementptr inbounds i64, i64* %17, i64 1
  %19 = bitcast i64* %18 to i64***
  store i64** %16, i64*** %19, align 8
  %20 = load i64**, i64*** %ptr_cur
  %21 = bitcast i64** %20 to i64*
  %22 = getelementptr inbounds i64, i64* %21, i64 0
  %23 = bitcast i64* %22 to i8**
  %24 = load i8*, i8** %23, align 8
  %25 = load i64**, i64*** %ptr_new_entry
  %26 = bitcast i64** %25 to i64*
  %27 = getelementptr inbounds i64, i64* %26, i64 2
  %28 = bitcast i64* %27 to i8**
  store i8* %24, i8** %28, align 8
  %29 = load i64**, i64*** %ptr_cur
  %30 = load i64**, i64*** %ptr_new_entry
  %31 = bitcast i64** %29 to i64*
  %32 = getelementptr inbounds i64, i64* %31, i64 0
  %33 = bitcast i64* %32 to i64***
  store i64** %30, i64*** %33, align 8
  br label %end_if_1
end_if_1:
  ret void
}

define i64** @env_resolve(i64** noalias %param_env, i8* noalias %param_name) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_env, i64*** %ptr_env
  store i8* %param_name, i8** %ptr_name
  %1 = load i64**, i64*** %ptr_env
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  store i8* %5, i64*** %ptr_cur_scope
  store i1 1, i1* %ptr_searching
  br label %while_cond_0
while_cond_0:
  %6 = load i1, i1* %ptr_searching
  br i1 %6, label %while_body_1, label %while_end_2
while_body_1:
  store i8* null, i64*** %ptr_next_scope
  %7 = load i64**, i64*** %ptr_cur_scope
  %8 = icmp ne i64** %7, null
  br i1 %8, label %then_3, label %else_5
then_3:
  %9 = load i64**, i64*** %ptr_cur_scope
  %10 = bitcast i64** %9 to i64*
  %11 = getelementptr inbounds i64, i64* %10, i64 0
  %12 = bitcast i64* %11 to i8**
  %13 = load i8*, i8** %12, align 8
  store i8* %13, i64*** %ptr_cur_entry
  store i1 1, i1* %ptr_searching_entries
  br label %while_cond_6
while_cond_6:
  %14 = load i1, i1* %ptr_searching_entries
  br i1 %14, label %while_body_7, label %while_end_8
while_body_7:
  store i8* null, i64*** %ptr_next_entry
  %15 = load i64**, i64*** %ptr_cur_entry
  %16 = icmp ne i64** %15, null
  br i1 %16, label %then_9, label %else_11
then_9:
  %17 = load i64**, i64*** %ptr_cur_entry
  %18 = bitcast i64** %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = load i8*, i8** %ptr_name
  %23 = call i32 @strcmp(i8* %21, i8* %22)
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %then_12, label %end_if_13
then_12:
  %25 = load i64**, i64*** %ptr_cur_entry
  %26 = bitcast i64** %25 to i64*
  %27 = getelementptr inbounds i64, i64* %26, i64 1
  %28 = bitcast i64* %27 to i8**
  %29 = load i8*, i8** %28, align 8
  ret i8* %29
unreachable_14:
  br label %end_if_13
end_if_13:
  %30 = load i64**, i64*** %ptr_cur_entry
  %31 = bitcast i64** %30 to i64*
  %32 = getelementptr inbounds i64, i64* %31, i64 2
  %33 = bitcast i64* %32 to i8**
  %34 = load i8*, i8** %33, align 8
  store i8* %34, i64*** %ptr_next_entry
  br label %end_if_10
else_11:
  store i1 0, i1* %ptr_searching_entries
  br label %end_if_10
end_if_10:
  %35 = load i64**, i64*** %ptr_next_entry
  store i64** %35, i64*** %ptr_cur_entry
  br label %while_cond_6
while_end_8:
  %36 = load i64**, i64*** %ptr_cur_scope
  %37 = bitcast i64** %36 to i64*
  %38 = getelementptr inbounds i64, i64* %37, i64 1
  %39 = bitcast i64* %38 to i8**
  %40 = load i8*, i8** %39, align 8
  store i8* %40, i64*** %ptr_next_scope
  br label %end_if_4
else_5:
  store i1 0, i1* %ptr_searching
  br label %end_if_4
end_if_4:
  %41 = load i64**, i64*** %ptr_next_scope
  store i64** %41, i64*** %ptr_cur_scope
  br label %while_cond_0
while_end_2:
  store i8* null, i8* %29
  ret i8* %29
unreachable_15:
  ret i64** null
}

define i64** @analyzer_new() {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_analyzer
  %3 = call i64** @env_new()
  %4 = call i64** @env_new()
  %5 = load i64**, i64*** %ptr_analyzer
  %6 = bitcast i64** %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 0
  %8 = bitcast i64* %7 to i64***
  store i64** %4, i64*** %8, align 8
  %9 = call i8* @malloc(i64 16)
  %10 = bitcast i8* %9 to i64*
  %11 = call i64 @new_list(i64 %DiagnosticError)
  %12 = call i64 @unknown(i64 16, i64* %10)
  %13 = call i64 @new_list(i64 %DiagnosticError)
  %14 = call i64 @unknown(i64 16, i64* %10)
  %15 = load i64**, i64*** %ptr_analyzer
  %16 = bitcast i64** %15 to i64*
  %17 = getelementptr inbounds i64, i64* %16, i64 1
  %18 = bitcast i64* %17 to i64*
  store i64 %14, i64* %18, align 8
  %19 = load i64**, i64*** %ptr_analyzer
  %20 = bitcast i64** %19 to i64*
  %21 = getelementptr inbounds i64, i64* %20, i64 2
  %22 = bitcast i64* %21 to i64*
  store i64 0, i64* %22, align 8
  %23 = load i64**, i64*** %ptr_analyzer
  ret i64** %23
unreachable_0:
  ret i64** null
}

define void @report_error(i64** noalias %param_analyzer, i64** noalias %param_span, i8* noalias %param_msg) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_analyzer, i64*** %ptr_analyzer
  store i64** %param_span, i64*** %ptr_span
  store i8* %param_msg, i8** %ptr_msg
  %1 = load i64**, i64*** %ptr_span
  %2 = load i8*, i8** %ptr_msg
  %3 = call i64** @alloc_diagnostic_error(i64** %1, i8* %2)
  store i64** %3, i64*** %ptr_err
  %4 = load i64**, i64*** %ptr_analyzer
  %5 = bitcast i64** %4 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 1
  %7 = bitcast i64* %6 to i8**
  %8 = load i8*, i8** %7, align 8
  %9 = load i64**, i64*** %ptr_err
  %10 = load i64*, i64** %9
  call void @list_push_DiagnosticError(i8* %8, i64* %10)
  ret void
}

define void @_dummy_instantiate_spanned_decl(i64** noalias %param_d) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_d = alloca i64**
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_d, i64*** %ptr_d
  ret void
}

define void @_dummy_instantiate_spanned_expr(i64* noalias %param_e) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_d = alloca i64**
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_e = alloca i64*
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64* %param_e, i64** %ptr_e
  ret void
}

define void @_dummy_instantiate_spanned_stmt(i64** noalias %param_s) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_ty_info = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_d = alloca i64**
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_e = alloca i64*
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_s, i64*** %ptr_s
  ret void
}

define void @_dummy_instantiate_type_info(i64** noalias %param_t) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_ty_info = alloca i64**
  %ptr_t = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_d = alloca i64**
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_e = alloca i64*
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_t, i64*** %ptr_t
  ret void
}

define void @_dummy_type_check_var_sym(i64** noalias %var_sym) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_ty_info = alloca i64**
  %ptr_t = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_d = alloca i64**
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_e = alloca i64*
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  ret void
}

define void @analyze_program(i64** noalias %param_analyzer, i64** noalias %param_program) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_ty_info = alloca i64**
  %ptr_t = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_d = alloca i64**
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_e = alloca i64*
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_program = alloca i64**
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_analyzer, i64*** %ptr_analyzer
  store i64** %param_program, i64*** %ptr_program
  %1 = load i64**, i64*** %ptr_program
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  store i8* %5, i64*** %ptr_decl_list
  br label %while_cond_0
while_cond_0:
  %6 = load i64**, i64*** %ptr_decl_list
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 1
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = icmp slt i64 0, %10
  br i1 %11, label %while_body_1, label %while_end_2
while_body_1:
  %12 = load i64**, i64*** %ptr_decl_list
  %13 = call i64* @list_get_Spanned_Declaration(i64** %12, i64 0)
  %14 = bitcast i64* %13 to i64*
  %15 = getelementptr inbounds i64, i64* %14, i64 0
  %16 = bitcast i64* %15 to i8**
  %17 = load i8*, i8** %16, align 8
  store i8* %17, i64** %ptr_decl
  %18 = load i64**, i64*** %ptr_analyzer
  %19 = load i64*, i64** %ptr_decl
  call void @analyzer_register_declaration(i64** %18, i64* %19)
  %20 = add nsw i64 0, 1
  store i64 %20, i64 0
  br label %while_cond_0
while_end_2:
  store i64 0, i64 0
  br label %while_cond_3
while_cond_3:
  %21 = load i64**, i64*** %ptr_decl_list
  %22 = bitcast i64** %21 to i64*
  %23 = getelementptr inbounds i64, i64* %22, i64 1
  %24 = bitcast i64* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = icmp slt i64 0, %25
  br i1 %26, label %while_body_4, label %while_end_5
while_body_4:
  %27 = load i64**, i64*** %ptr_decl_list
  %28 = call i64* @list_get_Spanned_Declaration(i64** %27, i64 0)
  store i64* %28, i64* %13
  %29 = bitcast i64* %13 to i64*
  %30 = getelementptr inbounds i64, i64* %29, i64 0
  %31 = bitcast i64* %30 to i8**
  %32 = load i8*, i8** %31, align 8
  store i8* %32, i64** %ptr_decl
  %33 = load i64**, i64*** %ptr_analyzer
  %34 = load i64*, i64** %ptr_decl
  call void @analyzer_analyze_declaration(i64** %33, i64* %34)
  %35 = add nsw i64 0, 1
  store i64 %35, i64 0
  br label %while_cond_3
while_end_5:
  ret void
}

define void @analyzer_register_declaration(i64** noalias %param_analyzer, i64* noalias %param_decl) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_ty_info = alloca i64**
  %ptr_t = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_d = alloca i64**
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_e = alloca i64*
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_program = alloca i64**
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_analyzer, i64*** %ptr_analyzer
  store i64* %param_decl, i64** %ptr_decl
  %1 = load i64*, i64** %ptr_decl
  %2 = getelementptr inbounds i64, i64* %1, i64 0
  %3 = bitcast i64* %2 to i64*
  %4 = load i64, i64* %3, align 8
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %when_case_1, label %when_next_2
when_case_1:
  %6 = load i64*, i64** %ptr_decl
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64***
  %9 = load i64**, i64*** %8, align 8
  %10 = call i8* @malloc(i64 8)
  %11 = bitcast i8* %10 to i64*
  store i64* %11, i64*** %ptr_sym
  %12 = load i64**, i64*** %ptr_sym
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 0
  %15 = bitcast i64* %14 to i64*
  store i64 0, i64* %15, align 8
  %16 = call i8* @malloc(i64 8)
  %17 = bitcast i8* %16 to i64*
  store i64* %17, i64*** %ptr_s
  %18 = call i8* @malloc(i64 16)
  %19 = bitcast i8* %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 0
  store i64 0, i64* %20
  %21 = load i64**, i64*** %ptr_sym
  %22 = getelementptr inbounds i64, i64* %19, i64 1
  %23 = bitcast i64* %22 to i64***
  store i64** %21, i64*** %23
  %24 = load i64**, i64*** %ptr_s
  store i64* %19, i64** %24
  %25 = load i64**, i64*** %ptr_analyzer
  %26 = bitcast i64** %25 to i64*
  %27 = getelementptr inbounds i64, i64* %26, i64 0
  %28 = bitcast i64* %27 to i8**
  %29 = load i8*, i8** %28, align 8
  %30 = bitcast i64** %9 to i64*
  %31 = getelementptr inbounds i64, i64* %30, i64 0
  %32 = bitcast i64* %31 to i8**
  %33 = load i8*, i8** %32, align 8
  %34 = load i64**, i64*** %ptr_s
  call void @env_define(i8* %29, i8* %33, i64** %34)
  br label %when_end_0
when_next_2:
  %35 = icmp eq i64 %4, 1
  br i1 %35, label %when_case_3, label %when_next_4
when_case_3:
  %36 = load i64*, i64** %ptr_decl
  %37 = getelementptr inbounds i64, i64* %36, i64 1
  %38 = bitcast i64* %37 to i64***
  %39 = load i64**, i64*** %38, align 8
  %40 = call i8* @malloc(i64 8)
  %41 = bitcast i8* %40 to i64*
  store i64* %41, i64*** %ptr_sym
  %42 = load i64**, i64*** %ptr_sym
  %43 = bitcast i64** %42 to i64*
  %44 = getelementptr inbounds i64, i64* %43, i64 0
  %45 = bitcast i64* %44 to i64*
  store i64 0, i64* %45, align 8
  %46 = call i8* @malloc(i64 8)
  %47 = bitcast i8* %46 to i64*
  store i64* %47, i64*** %ptr_s
  %48 = call i8* @malloc(i64 16)
  %49 = bitcast i8* %48 to i64*
  %50 = getelementptr inbounds i64, i64* %49, i64 0
  store i64 1, i64* %50
  %51 = load i64**, i64*** %ptr_sym
  %52 = getelementptr inbounds i64, i64* %49, i64 1
  %53 = bitcast i64* %52 to i64***
  store i64** %51, i64*** %53
  %54 = load i64**, i64*** %ptr_s
  store i64* %49, i64** %54
  %55 = load i64**, i64*** %ptr_analyzer
  %56 = bitcast i64** %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 0
  %58 = bitcast i64* %57 to i8**
  %59 = load i8*, i8** %58, align 8
  %60 = bitcast i64** %39 to i64*
  %61 = getelementptr inbounds i64, i64* %60, i64 0
  %62 = bitcast i64* %61 to i8**
  %63 = load i8*, i8** %62, align 8
  %64 = load i64**, i64*** %ptr_s
  call void @env_define(i8* %59, i8* %63, i64** %64)
  br label %when_end_0
when_next_4:
  %65 = icmp eq i64 %4, 2
  br i1 %65, label %when_case_5, label %when_next_6
when_case_5:
  %66 = load i64*, i64** %ptr_decl
  %67 = getelementptr inbounds i64, i64* %66, i64 1
  %68 = bitcast i64* %67 to i64***
  %69 = load i64**, i64*** %68, align 8
  %70 = call i8* @malloc(i64 8)
  %71 = bitcast i8* %70 to i64*
  store i64* %71, i64*** %ptr_sym
  %72 = bitcast i64** %69 to i64*
  %73 = getelementptr inbounds i64, i64* %72, i64 3
  %74 = bitcast i64* %73 to i8**
  %75 = load i8*, i8** %74, align 8
  %76 = icmp ne i8* %75, null
  br i1 %76, label %then_7, label %else_9
then_7:
  store i8* %75, i64*** %ptr_ret_span
  %77 = call i8* @malloc(i64 48)
  %78 = bitcast i8* %77 to i64*
  store i64* %78, i64*** %ptr_t
  %79 = load i64**, i64*** %ptr_ret_span
  %80 = bitcast i64** %79 to i64*
  %81 = getelementptr inbounds i64, i64* %80, i64 0
  %82 = bitcast i64* %81 to i8**
  %83 = load i8*, i8** %82, align 8
  %84 = load i64**, i64*** %ptr_t
  store i8* %83, i64** %84
  %85 = load i64**, i64*** %ptr_t
  %86 = call i64** @type_info_from_ast(i64** %85)
  %87 = load i64**, i64*** %ptr_t
  %88 = call i64** @type_info_from_ast(i64** %87)
  %89 = load i64**, i64*** %ptr_sym
  %90 = bitcast i64** %89 to i64*
  %91 = getelementptr inbounds i64, i64* %90, i64 0
  %92 = bitcast i64* %91 to i64***
  store i64** %88, i64*** %92, align 8
  br label %end_if_8
else_9:
  %93 = call i8* @malloc(i64 8)
  %94 = bitcast i8* %93 to i64*
  %95 = call i8* @malloc(i64 8)
  %96 = bitcast i8* %95 to i64*
  %97 = getelementptr inbounds i64, i64* %96, i64 0
  store i64 5, i64* %97
  store i64* %96, i64* %94
  %98 = load i64**, i64*** %ptr_sym
  %99 = bitcast i64** %98 to i64*
  %100 = getelementptr inbounds i64, i64* %99, i64 0
  %101 = bitcast i64* %100 to i64**
  store i64* %94, i64** %101, align 8
  br label %end_if_8
end_if_8:
  %102 = call i8* @malloc(i64 8)
  %103 = bitcast i8* %102 to i64*
  store i64* %103, i64*** %ptr_s
  %104 = call i8* @malloc(i64 16)
  %105 = bitcast i8* %104 to i64*
  %106 = getelementptr inbounds i64, i64* %105, i64 0
  store i64 1, i64* %106
  %107 = load i64**, i64*** %ptr_sym
  %108 = getelementptr inbounds i64, i64* %105, i64 1
  %109 = bitcast i64* %108 to i64***
  store i64** %107, i64*** %109
  %110 = load i64**, i64*** %ptr_s
  store i64* %105, i64** %110
  %111 = load i64**, i64*** %ptr_analyzer
  %112 = bitcast i64** %111 to i64*
  %113 = getelementptr inbounds i64, i64* %112, i64 0
  %114 = bitcast i64* %113 to i8**
  %115 = load i8*, i8** %114, align 8
  %116 = bitcast i64** %69 to i64*
  %117 = getelementptr inbounds i64, i64* %116, i64 0
  %118 = bitcast i64* %117 to i8**
  %119 = load i8*, i8** %118, align 8
  %120 = load i64**, i64*** %ptr_s
  call void @env_define(i8* %115, i8* %119, i64** %120)
  br label %when_end_0
when_next_6:
  %121 = icmp eq i64 %4, 3
  br i1 %121, label %when_case_10, label %when_next_11
when_case_10:
  %122 = load i64*, i64** %ptr_decl
  %123 = getelementptr inbounds i64, i64* %122, i64 1
  %124 = bitcast i64* %123 to i64***
  %125 = load i64**, i64*** %124, align 8
  %126 = call i8* @malloc(i64 8)
  %127 = bitcast i8* %126 to i64*
  store i64* %127, i64*** %ptr_sym
  %128 = bitcast i64** %125 to i64*
  %129 = getelementptr inbounds i64, i64* %128, i64 3
  %130 = bitcast i64* %129 to i8**
  %131 = load i8*, i8** %130, align 8
  store i8* %131, i8* %75
  %132 = icmp ne i8* %75, null
  br i1 %132, label %then_12, label %else_14
then_12:
  store i8* %75, i64*** %ptr_ret_span
  %133 = call i8* @malloc(i64 48)
  %134 = bitcast i8* %133 to i64*
  store i64* %134, i64*** %ptr_t
  %135 = load i64**, i64*** %ptr_ret_span
  %136 = bitcast i64** %135 to i64*
  %137 = getelementptr inbounds i64, i64* %136, i64 0
  %138 = bitcast i64* %137 to i8**
  %139 = load i8*, i8** %138, align 8
  %140 = load i64**, i64*** %ptr_t
  store i8* %139, i64** %140
  %141 = load i64**, i64*** %ptr_t
  %142 = call i64** @type_info_from_ast(i64** %141)
  %143 = load i64**, i64*** %ptr_t
  %144 = call i64** @type_info_from_ast(i64** %143)
  %145 = load i64**, i64*** %ptr_sym
  %146 = bitcast i64** %145 to i64*
  %147 = getelementptr inbounds i64, i64* %146, i64 0
  %148 = bitcast i64* %147 to i64***
  store i64** %144, i64*** %148, align 8
  br label %end_if_13
else_14:
  %149 = call i8* @malloc(i64 8)
  %150 = bitcast i8* %149 to i64*
  store i64* %150, i64* %94
  %151 = call i8* @malloc(i64 8)
  %152 = bitcast i8* %151 to i64*
  %153 = getelementptr inbounds i64, i64* %152, i64 0
  store i64 5, i64* %153
  store i64* %152, i64* %94
  %154 = load i64**, i64*** %ptr_sym
  %155 = bitcast i64** %154 to i64*
  %156 = getelementptr inbounds i64, i64* %155, i64 0
  %157 = bitcast i64* %156 to i64**
  store i64* %94, i64** %157, align 8
  br label %end_if_13
end_if_13:
  %158 = call i8* @malloc(i64 8)
  %159 = bitcast i8* %158 to i64*
  store i64* %159, i64*** %ptr_s
  %160 = call i8* @malloc(i64 16)
  %161 = bitcast i8* %160 to i64*
  %162 = getelementptr inbounds i64, i64* %161, i64 0
  store i64 1, i64* %162
  %163 = load i64**, i64*** %ptr_sym
  %164 = getelementptr inbounds i64, i64* %161, i64 1
  %165 = bitcast i64* %164 to i64***
  store i64** %163, i64*** %165
  %166 = load i64**, i64*** %ptr_s
  store i64* %161, i64** %166
  %167 = load i64**, i64*** %ptr_analyzer
  %168 = bitcast i64** %167 to i64*
  %169 = getelementptr inbounds i64, i64* %168, i64 0
  %170 = bitcast i64* %169 to i8**
  %171 = load i8*, i8** %170, align 8
  %172 = bitcast i64** %125 to i64*
  %173 = getelementptr inbounds i64, i64* %172, i64 0
  %174 = bitcast i64* %173 to i8**
  %175 = load i8*, i8** %174, align 8
  %176 = load i64**, i64*** %ptr_s
  call void @env_define(i8* %171, i8* %175, i64** %176)
  br label %when_end_0
when_next_11:
  %177 = icmp eq i64 %4, 4
  br i1 %177, label %when_case_15, label %when_next_16
when_case_15:
  br label %when_end_0
when_next_16:
  br label %when_end_0
when_end_0:
  ret void
}

define void @analyzer_analyze_declaration(i64** noalias %param_analyzer, i64* noalias %param_decl) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_ty_info = alloca i64**
  %ptr_t = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_d = alloca i64**
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_e = alloca i64*
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_program = alloca i64**
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_analyzer, i64*** %ptr_analyzer
  store i64* %param_decl, i64** %ptr_decl
  %1 = load i64*, i64** %ptr_decl
  %2 = getelementptr inbounds i64, i64* %1, i64 0
  %3 = bitcast i64* %2 to i64*
  %4 = load i64, i64* %3, align 8
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %when_case_1, label %when_next_2
when_case_1:
  br label %when_end_0
when_next_2:
  %6 = icmp eq i64 %4, 1
  br i1 %6, label %when_case_3, label %when_next_4
when_case_3:
  br label %when_end_0
when_next_4:
  %7 = icmp eq i64 %4, 3
  br i1 %7, label %when_case_5, label %when_next_6
when_case_5:
  br label %when_end_0
when_next_6:
  %8 = icmp eq i64 %4, 2
  br i1 %8, label %when_case_7, label %when_next_8
when_case_7:
  %9 = load i64*, i64** %ptr_decl
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64***
  %12 = load i64**, i64*** %11, align 8
  %13 = load i64**, i64*** %ptr_analyzer
  %14 = bitcast i64** %13 to i64*
  %15 = getelementptr inbounds i64, i64* %14, i64 0
  %16 = bitcast i64* %15 to i8**
  %17 = load i8*, i8** %16, align 8
  call void @env_enter_scope(i8* %17)
  br label %while_cond_9
while_cond_9:
  %18 = bitcast i64** %12 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 2
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = bitcast i8* %21 to i64*
  %23 = getelementptr inbounds i64, i64* %22, i64 1
  %24 = bitcast i64* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = icmp slt i64 0, %25
  br i1 %26, label %while_body_10, label %while_end_11
while_body_10:
  %27 = bitcast i64** %12 to i64*
  %28 = getelementptr inbounds i64, i64* %27, i64 2
  %29 = bitcast i64* %28 to i8**
  %30 = load i8*, i8** %29, align 8
  %31 = call i64* @list_get_Param(i8* %30, i64 0)
  %32 = call i8* @malloc(i64 48)
  %33 = bitcast i8* %32 to i64*
  store i64* %33, i64*** %ptr_t
  %34 = bitcast i64* %31 to i64*
  %35 = getelementptr inbounds i64, i64* %34, i64 2
  %36 = bitcast i64* %35 to i8**
  %37 = load i8*, i8** %36, align 8
  %38 = bitcast i8* %37 to i64*
  %39 = getelementptr inbounds i64, i64* %38, i64 0
  %40 = bitcast i64* %39 to i8**
  %41 = load i8*, i8** %40, align 8
  %42 = load i64**, i64*** %ptr_t
  store i8* %41, i64** %42
  %43 = load i64**, i64*** %ptr_t
  %44 = call i64** @type_info_from_ast(i64** %43)
  store i64** %44, i64*** %ptr_ty_info
  %45 = call i8* @malloc(i64 24)
  %46 = bitcast i8* %45 to i64*
  store i64* %46, i64*** %ptr_sym
  %47 = bitcast i64* %31 to i64*
  %48 = getelementptr inbounds i64, i64* %47, i64 0
  %49 = bitcast i64* %48 to i1*
  %50 = load i1, i1* %49, align 8
  %51 = load i64**, i64*** %ptr_sym
  %52 = bitcast i64** %51 to i64*
  %53 = getelementptr inbounds i64, i64* %52, i64 0
  %54 = bitcast i64* %53 to i1*
  store i1 %50, i1* %54, align 8
  %55 = load i64**, i64*** %ptr_sym
  %56 = load i64**, i64*** %ptr_ty_info
  %57 = bitcast i64** %55 to i64*
  %58 = getelementptr inbounds i64, i64* %57, i64 1
  %59 = bitcast i64* %58 to i64***
  store i64** %56, i64*** %59, align 8
  %60 = load i64**, i64*** %ptr_t
  %61 = bitcast i64** %60 to i64*
  %62 = getelementptr inbounds i64, i64* %61, i64 3
  %63 = bitcast i64* %62 to i64*
  %64 = load i64, i64* %63, align 8
  %65 = load i64**, i64*** %ptr_sym
  %66 = bitcast i64** %65 to i64*
  %67 = getelementptr inbounds i64, i64* %66, i64 2
  %68 = bitcast i64* %67 to i64*
  store i64 %64, i64* %68, align 8
  %69 = call i8* @malloc(i64 8)
  %70 = bitcast i8* %69 to i64*
  store i64* %70, i64*** %ptr_s
  %71 = call i8* @malloc(i64 16)
  %72 = bitcast i8* %71 to i64*
  %73 = getelementptr inbounds i64, i64* %72, i64 0
  store i64 0, i64* %73
  %74 = load i64**, i64*** %ptr_sym
  %75 = getelementptr inbounds i64, i64* %72, i64 1
  %76 = bitcast i64* %75 to i64***
  store i64** %74, i64*** %76
  %77 = load i64**, i64*** %ptr_s
  store i64* %72, i64** %77
  %78 = load i64**, i64*** %ptr_analyzer
  %79 = bitcast i64** %78 to i64*
  %80 = getelementptr inbounds i64, i64* %79, i64 0
  %81 = bitcast i64* %80 to i8**
  %82 = load i8*, i8** %81, align 8
  %83 = bitcast i64* %31 to i64*
  %84 = getelementptr inbounds i64, i64* %83, i64 1
  %85 = bitcast i64* %84 to i8**
  %86 = load i8*, i8** %85, align 8
  %87 = load i64**, i64*** %ptr_s
  call void @env_define(i8* %82, i8* %86, i64** %87)
  %88 = add nsw i64 0, 1
  store i64 %88, i64 0
  br label %while_cond_9
while_end_11:
  %89 = bitcast i64** %12 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 4
  %91 = bitcast i64* %90 to i8**
  %92 = load i8*, i8** %91, align 8
  %93 = load i64**, i64*** %ptr_analyzer
  call void @analyzer_analyze_block(i64** %93, i8* %92)
  %94 = load i64**, i64*** %ptr_analyzer
  %95 = bitcast i64** %94 to i64*
  %96 = getelementptr inbounds i64, i64* %95, i64 0
  %97 = bitcast i64* %96 to i8**
  %98 = load i8*, i8** %97, align 8
  call void @env_exit_scope(i8* %98)
  br label %when_end_0
when_next_8:
  %99 = icmp eq i64 %4, 4
  br i1 %99, label %when_case_12, label %when_next_13
when_case_12:
  %100 = load i64*, i64** %ptr_decl
  %101 = getelementptr inbounds i64, i64* %100, i64 1
  %102 = bitcast i64* %101 to i64***
  %103 = load i64**, i64*** %102, align 8
  %104 = bitcast i64** %103 to i64*
  %105 = getelementptr inbounds i64, i64* %104, i64 3
  %106 = bitcast i64* %105 to i8**
  %107 = load i8*, i8** %106, align 8
  %108 = load i64**, i64*** %ptr_analyzer
  %109 = call i64** @analyzer_analyze_expression(i64** %108, i8* %107)
  br label %when_end_0
when_next_13:
  br label %when_end_0
when_end_0:
  ret void
}

define void @analyzer_analyze_block(i64** noalias %param_analyzer, i64** noalias %param_block) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_ty_info = alloca i64**
  %ptr_t = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_block = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_d = alloca i64**
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_e = alloca i64*
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_program = alloca i64**
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_analyzer, i64*** %ptr_analyzer
  store i64** %param_block, i64*** %ptr_block
  %1 = load i64**, i64*** %ptr_block
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  store i8* %5, i64*** %ptr_b
  br label %while_cond_0
while_cond_0:
  %6 = load i64**, i64*** %ptr_b
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 0
  %9 = bitcast i64* %8 to i8**
  %10 = load i8*, i8** %9, align 8
  %11 = bitcast i8* %10 to i64*
  %12 = getelementptr inbounds i64, i64* %11, i64 1
  %13 = bitcast i64* %12 to i64*
  %14 = load i64, i64* %13, align 8
  %15 = icmp slt i64 0, %14
  br i1 %15, label %while_body_1, label %while_end_2
while_body_1:
  %16 = load i64**, i64*** %ptr_b
  %17 = bitcast i64** %16 to i64*
  %18 = getelementptr inbounds i64, i64* %17, i64 0
  %19 = bitcast i64* %18 to i8**
  %20 = load i8*, i8** %19, align 8
  %21 = call i64* @list_get_Spanned_Statement(i8* %20, i64 0)
  %22 = call i8* @malloc(i64 16)
  %23 = bitcast i8* %22 to i64*
  store i64* %21, i64* %23
  %24 = load i64**, i64*** %ptr_analyzer
  call void @analyzer_analyze_statement(i64** %24, i64* %23)
  %25 = add nsw i64 0, 1
  store i64 %25, i64 0
  br label %while_cond_0
while_end_2:
  ret void
}

define void @analyzer_analyze_statement(i64** noalias %param_analyzer, i64** noalias %param_stmt) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_ty_info = alloca i64**
  %ptr_t = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_block = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_d = alloca i64**
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_stmt = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_e = alloca i64*
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_program = alloca i64**
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_analyzer, i64*** %ptr_analyzer
  store i64** %param_stmt, i64*** %ptr_stmt
  %1 = load i64**, i64*** %ptr_stmt
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = getelementptr inbounds i64, i8* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = icmp eq i64 %8, 4
  br i1 %9, label %when_case_1, label %when_next_2
when_case_1:
  %10 = getelementptr inbounds i64, i8* %5, i64 1
  %11 = bitcast i64* %10 to i64***
  %12 = load i64**, i64*** %11, align 8
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 3
  %15 = bitcast i64* %14 to i8**
  %16 = load i8*, i8** %15, align 8
  %17 = load i64**, i64*** %ptr_analyzer
  %18 = call i64** @analyzer_analyze_expression(i64** %17, i8* %16)
  store i64** %18, i64*** %ptr_ty_info
  %19 = bitcast i64** %12 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 2
  %21 = bitcast i64* %20 to i8**
  %22 = load i8*, i8** %21, align 8
  %23 = icmp ne i8* %22, null
  br i1 %23, label %then_3, label %end_if_4
then_3:
  store i8* %22, i64*** %ptr_ty_span
  %24 = call i8* @malloc(i64 48)
  %25 = bitcast i8* %24 to i64*
  store i64* %25, i64*** %ptr_t
  %26 = load i64**, i64*** %ptr_ty_span
  %27 = bitcast i64** %26 to i64*
  %28 = getelementptr inbounds i64, i64* %27, i64 0
  %29 = bitcast i64* %28 to i8**
  %30 = load i8*, i8** %29, align 8
  %31 = load i64**, i64*** %ptr_t
  store i8* %30, i64** %31
  %32 = load i64**, i64*** %ptr_t
  %33 = call i64** @type_info_from_ast(i64** %32)
  store i64** %33, i64*** %ptr_ty_info
  br label %end_if_4
end_if_4:
  %34 = call i8* @malloc(i64 24)
  %35 = bitcast i8* %34 to i64*
  store i64* %35, i64*** %ptr_sym
  %36 = bitcast i64** %12 to i64*
  %37 = getelementptr inbounds i64, i64* %36, i64 0
  %38 = bitcast i64* %37 to i1*
  %39 = load i1, i1* %38, align 8
  %40 = load i64**, i64*** %ptr_sym
  %41 = bitcast i64** %40 to i64*
  %42 = getelementptr inbounds i64, i64* %41, i64 0
  %43 = bitcast i64* %42 to i1*
  store i1 %39, i1* %43, align 8
  %44 = load i64**, i64*** %ptr_sym
  %45 = load i64**, i64*** %ptr_ty_info
  %46 = bitcast i64** %44 to i64*
  %47 = getelementptr inbounds i64, i64* %46, i64 1
  %48 = bitcast i64* %47 to i64***
  store i64** %45, i64*** %48, align 8
  %49 = load i64**, i64*** %ptr_sym
  %50 = bitcast i64** %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 2
  %52 = bitcast i64* %51 to i64*
  store i64 0, i64* %52, align 8
  %53 = call i8* @malloc(i64 8)
  %54 = bitcast i8* %53 to i64*
  store i64* %54, i64*** %ptr_s
  %55 = call i8* @malloc(i64 16)
  %56 = bitcast i8* %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 0
  store i64 0, i64* %57
  %58 = load i64**, i64*** %ptr_sym
  %59 = getelementptr inbounds i64, i64* %56, i64 1
  %60 = bitcast i64* %59 to i64***
  store i64** %58, i64*** %60
  %61 = load i64**, i64*** %ptr_s
  store i64* %56, i64** %61
  %62 = load i64**, i64*** %ptr_analyzer
  %63 = bitcast i64** %62 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 0
  %65 = bitcast i64* %64 to i8**
  %66 = load i8*, i8** %65, align 8
  %67 = bitcast i64** %12 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 1
  %69 = bitcast i64* %68 to i8**
  %70 = load i8*, i8** %69, align 8
  %71 = load i64**, i64*** %ptr_s
  call void @env_define(i8* %66, i8* %70, i64** %71)
  br label %when_end_0
when_next_2:
  %72 = icmp eq i64 %8, 1
  br i1 %72, label %when_case_5, label %when_next_6
when_case_5:
  %73 = getelementptr inbounds i64, i8* %5, i64 1
  %74 = bitcast i64* %73 to i64***
  %75 = load i64**, i64*** %74, align 8
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 0
  %78 = bitcast i64* %77 to i8**
  %79 = load i8*, i8** %78, align 8
  %80 = load i64**, i64*** %ptr_analyzer
  %81 = call i64** @analyzer_analyze_expression(i64** %80, i8* %79)
  %82 = bitcast i64** %75 to i64*
  %83 = getelementptr inbounds i64, i64* %82, i64 2
  %84 = bitcast i64* %83 to i8**
  %85 = load i8*, i8** %84, align 8
  %86 = load i64**, i64*** %ptr_analyzer
  %87 = call i64** @analyzer_analyze_expression(i64** %86, i8* %85)
  br label %when_end_0
when_next_6:
  %88 = icmp eq i64 %8, 0
  br i1 %88, label %when_case_7, label %when_next_8
when_case_7:
  %89 = getelementptr inbounds i64, i8* %5, i64 1
  %90 = bitcast i64* %89 to i64***
  %91 = load i64**, i64*** %90, align 8
  %92 = bitcast i64** %91 to i64*
  %93 = getelementptr inbounds i64, i64* %92, i64 0
  %94 = bitcast i64* %93 to i8**
  %95 = load i8*, i8** %94, align 8
  %96 = load i64**, i64*** %ptr_analyzer
  %97 = call i64** @analyzer_analyze_expression(i64** %96, i8* %95)
  %98 = bitcast i64** %91 to i64*
  %99 = getelementptr inbounds i64, i64* %98, i64 1
  %100 = bitcast i64* %99 to i8**
  %101 = load i8*, i8** %100, align 8
  %102 = load i64**, i64*** %ptr_analyzer
  call void @analyzer_analyze_block(i64** %102, i8* %101)
  %103 = bitcast i64** %91 to i64*
  %104 = getelementptr inbounds i64, i64* %103, i64 2
  %105 = bitcast i64* %104 to i8**
  %106 = load i8*, i8** %105, align 8
  %107 = icmp ne i8* %106, null
  br i1 %107, label %then_9, label %end_if_10
then_9:
  store i8* %106, i64*** %ptr_else_br
  %108 = load i64**, i64*** %ptr_else_br
  %109 = bitcast i64** %108 to i64*
  %110 = getelementptr inbounds i64, i64* %109, i64 0
  %111 = bitcast i64* %110 to i8**
  %112 = load i8*, i8** %111, align 8
  %113 = getelementptr inbounds i64, i8* %112, i64 0
  %114 = bitcast i64* %113 to i64*
  %115 = load i64, i64* %114, align 8
  %116 = icmp eq i64 %115, 0
  br i1 %116, label %when_case_12, label %when_next_13
when_case_12:
  %117 = getelementptr inbounds i64, i8* %112, i64 1
  %118 = bitcast i64* %117 to i64***
  %119 = load i64**, i64*** %118, align 8
  %120 = call i8* @malloc(i64 16)
  %121 = bitcast i8* %120 to i64*
  %122 = call i8* @malloc(i64 8)
  %123 = bitcast i8* %122 to i64*
  store i64* %123, i64*** %ptr_stmt
  %124 = call i8* @malloc(i64 16)
  %125 = bitcast i8* %124 to i64*
  %126 = getelementptr inbounds i64, i64* %125, i64 0
  store i64 0, i64* %126
  %127 = getelementptr inbounds i64, i64* %125, i64 1
  %128 = bitcast i64* %127 to i64***
  store i64** %119, i64*** %128
  %129 = load i64**, i64*** %ptr_stmt
  store i64* %125, i64** %129
  %130 = load i64**, i64*** %ptr_stmt
  %131 = load i64*, i64** %130
  %132 = bitcast i64* %121 to i64*
  %133 = getelementptr inbounds i64, i64* %132, i64 0
  %134 = bitcast i64* %133 to i64**
  store i64* %131, i64** %134, align 8
  %135 = load i64**, i64*** %ptr_else_br
  %136 = bitcast i64** %135 to i64*
  %137 = getelementptr inbounds i64, i64* %136, i64 1
  %138 = bitcast i64* %137 to i8**
  %139 = load i8*, i8** %138, align 8
  %140 = bitcast i64* %121 to i64*
  %141 = getelementptr inbounds i64, i64* %140, i64 1
  %142 = bitcast i64* %141 to i8**
  store i8* %139, i8** %142, align 8
  %143 = load i64**, i64*** %ptr_analyzer
  call void @analyzer_analyze_statement(i64** %143, i64* %121)
  br label %when_end_11
when_next_13:
  %144 = icmp eq i64 %115, 1
  br i1 %144, label %when_case_14, label %when_next_15
when_case_14:
  %145 = getelementptr inbounds i64, i8* %112, i64 1
  %146 = bitcast i64* %145 to i64***
  %147 = load i64**, i64*** %146, align 8
  store i64** %147, i64*** %ptr_b
  %148 = call i8* @malloc(i64 16)
  %149 = bitcast i8* %148 to i64*
  store i64* %149, i64*** %ptr_span_b
  %150 = load i64**, i64*** %ptr_b
  %151 = load i64*, i64** %150
  %152 = load i64**, i64*** %ptr_span_b
  %153 = bitcast i64** %152 to i64*
  %154 = getelementptr inbounds i64, i64* %153, i64 0
  %155 = bitcast i64* %154 to i64**
  store i64* %151, i64** %155, align 8
  %156 = load i64**, i64*** %ptr_else_br
  %157 = bitcast i64** %156 to i64*
  %158 = getelementptr inbounds i64, i64* %157, i64 1
  %159 = bitcast i64* %158 to i8**
  %160 = load i8*, i8** %159, align 8
  %161 = load i64**, i64*** %ptr_span_b
  %162 = bitcast i64** %161 to i64*
  %163 = getelementptr inbounds i64, i64* %162, i64 1
  %164 = bitcast i64* %163 to i8**
  store i8* %160, i8** %164, align 8
  %165 = load i64**, i64*** %ptr_analyzer
  %166 = load i64**, i64*** %ptr_span_b
  call void @analyzer_analyze_block(i64** %165, i64** %166)
  br label %when_end_11
when_next_15:
  br label %when_end_11
when_end_11:
  br label %end_if_10
end_if_10:
  br label %when_end_0
when_next_8:
  %167 = icmp eq i64 %8, 3
  br i1 %167, label %when_case_16, label %when_next_17
when_case_16:
  %168 = getelementptr inbounds i64, i8* %5, i64 1
  %169 = bitcast i64* %168 to i64***
  %170 = load i64**, i64*** %169, align 8
  %171 = bitcast i64** %170 to i64*
  %172 = getelementptr inbounds i64, i64* %171, i64 0
  %173 = bitcast i64* %172 to i8**
  %174 = load i8*, i8** %173, align 8
  %175 = load i64**, i64*** %ptr_analyzer
  %176 = call i64** @analyzer_analyze_expression(i64** %175, i8* %174)
  %177 = load i64**, i64*** %ptr_analyzer
  %178 = bitcast i64** %177 to i64*
  %179 = getelementptr inbounds i64, i64* %178, i64 2
  %180 = bitcast i64* %179 to i64*
  %181 = load i64, i64* %180, align 8
  %182 = add nsw i64 %181, 1
  %183 = load i64**, i64*** %ptr_analyzer
  %184 = bitcast i64** %183 to i64*
  %185 = getelementptr inbounds i64, i64* %184, i64 2
  %186 = bitcast i64* %185 to i64*
  store i64 %182, i64* %186, align 8
  %187 = bitcast i64** %170 to i64*
  %188 = getelementptr inbounds i64, i64* %187, i64 1
  %189 = bitcast i64* %188 to i8**
  %190 = load i8*, i8** %189, align 8
  %191 = load i64**, i64*** %ptr_analyzer
  call void @analyzer_analyze_block(i64** %191, i8* %190)
  %192 = load i64**, i64*** %ptr_analyzer
  %193 = bitcast i64** %192 to i64*
  %194 = getelementptr inbounds i64, i64* %193, i64 2
  %195 = bitcast i64* %194 to i64*
  %196 = load i64, i64* %195, align 8
  %197 = sub nsw i64 %196, 1
  %198 = load i64**, i64*** %ptr_analyzer
  %199 = bitcast i64** %198 to i64*
  %200 = getelementptr inbounds i64, i64* %199, i64 2
  %201 = bitcast i64* %200 to i64*
  store i64 %197, i64* %201, align 8
  br label %when_end_0
when_next_17:
  %202 = icmp eq i64 %8, 4
  br i1 %202, label %when_case_18, label %when_next_19
when_case_18:
  %203 = getelementptr inbounds i64, i8* %5, i64 1
  %204 = bitcast i64* %203 to i64***
  %205 = load i64**, i64*** %204, align 8
  %206 = bitcast i64** %205 to i64*
  %207 = getelementptr inbounds i64, i64* %206, i64 0
  %208 = bitcast i64* %207 to i8**
  %209 = load i8*, i8** %208, align 8
  store i8* %209, i64*** %ptr_val_opt
  %210 = load i64**, i64*** %ptr_val_opt
  %211 = icmp ne i64** %210, null
  br i1 %211, label %then_20, label %end_if_21
then_20:
  %212 = load i64**, i64*** %ptr_val_opt
  store i64** %212, i1* %ptr_val
  %213 = load i64**, i64*** %ptr_analyzer
  %214 = load i1, i1* %ptr_val
  %215 = call i64** @analyzer_analyze_expression(i64** %213, i1 %214)
  br label %end_if_21
end_if_21:
  br label %when_end_0
when_next_19:
  %216 = icmp eq i64 %8, 5
  br i1 %216, label %when_case_22, label %when_next_23
when_case_22:
  %217 = getelementptr inbounds i64, i8* %5, i64 1
  %218 = bitcast i64* %217 to i64***
  %219 = load i64**, i64*** %218, align 8
  %220 = load i64**, i64*** %ptr_analyzer
  %221 = call i64** @analyzer_analyze_expression(i64** %220, i64** %219)
  br label %when_end_0
when_next_23:
  %222 = icmp eq i64 %8, 6
  br i1 %222, label %when_case_24, label %when_next_25
when_case_24:
  %223 = getelementptr inbounds i64, i8* %5, i64 1
  %224 = bitcast i64* %223 to i64***
  %225 = load i64**, i64*** %224, align 8
  store i64** %225, i64** %219
  %226 = load i64**, i64*** %ptr_analyzer
  %227 = call i64** @analyzer_analyze_expression(i64** %226, i64** %219)
  br label %when_end_0
when_next_25:
  %228 = icmp eq i64 %8, 7
  br i1 %228, label %when_case_26, label %when_next_27
when_case_26:
  br label %when_end_0
when_next_27:
  %229 = icmp eq i64 %8, 8
  br i1 %229, label %when_case_28, label %when_next_29
when_case_28:
  br label %when_end_0
when_next_29:
  br label %when_end_0
when_end_0:
  ret void
}

define i64** @analyzer_analyze_expression(i64** noalias %param_analyzer, i64** noalias %param_expr) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_ty_info = alloca i64**
  %ptr_t = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_block = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_d = alloca i64**
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_stmt = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_e = alloca i64*
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_program = alloca i64**
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_analyzer, i64*** %ptr_analyzer
  store i64** %param_expr, i64*** %ptr_expr
  %1 = call i8* @malloc(i64 8)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_ret_ty
  %3 = call i8* @malloc(i64 8)
  %4 = bitcast i8* %3 to i64*
  %5 = getelementptr inbounds i64, i64* %4, i64 0
  store i64 8, i64* %5
  %6 = load i64**, i64*** %ptr_ret_ty
  store i64* %4, i64** %6
  %7 = load i64**, i64*** %ptr_expr
  %8 = bitcast i64** %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 0
  %10 = bitcast i64* %9 to i8**
  %11 = load i8*, i8** %10, align 8
  %12 = getelementptr inbounds i64, i8* %11, i64 0
  %13 = bitcast i64* %12 to i64*
  %14 = load i64, i64* %13, align 8
  %15 = icmp eq i64 %14, 16
  br i1 %15, label %when_case_1, label %when_next_2
when_case_1:
  %16 = getelementptr inbounds i64, i8* %11, i64 1
  %17 = bitcast i64* %16 to i64***
  %18 = load i64**, i64*** %17, align 8
  %19 = load i64*, i64** %18
  %20 = getelementptr inbounds i64, i64* %19, i64 0
  %21 = bitcast i64* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %when_case_4, label %when_next_5
when_case_4:
  %24 = getelementptr inbounds i64, i64* %19, i64 1
  %25 = bitcast i64* %24 to i8**
  %26 = load i8*, i8** %25, align 8
  store i8* %26, i8** %ptr_name
  %27 = load i64**, i64*** %ptr_analyzer
  %28 = bitcast i64** %27 to i64*
  %29 = getelementptr inbounds i64, i64* %28, i64 0
  %30 = bitcast i64* %29 to i8**
  %31 = load i8*, i8** %30, align 8
  %32 = load i8*, i8** %ptr_name
  %33 = call i64** @env_resolve(i8* %31, i8* %32)
  store i64** %33, i64*** %ptr_sym_opt
  %34 = load i64**, i64*** %ptr_sym_opt
  %35 = icmp ne i64** %34, null
  br i1 %35, label %then_6, label %else_8
then_6:
  %36 = load i64**, i64*** %ptr_sym_opt
  store i64** %36, i64*** %ptr_sym
  %37 = load i64**, i64*** %ptr_sym
  %38 = load i64*, i64** %37
  %39 = getelementptr inbounds i64, i64* %38, i64 0
  %40 = bitcast i64* %39 to i64*
  %41 = load i64, i64* %40, align 8
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %when_case_10, label %when_next_11
when_case_10:
  %43 = getelementptr inbounds i64, i64* %38, i64 1
  %44 = bitcast i64* %43 to i64***
  %45 = load i64**, i64*** %44, align 8
  store i64** %45, i64*** %ptr_v
  %46 = load i64**, i64*** %ptr_v
  %47 = bitcast i64** %46 to i64*
  %48 = getelementptr inbounds i64, i64* %47, i64 1
  %49 = bitcast i64* %48 to i8**
  %50 = load i8*, i8** %49, align 8
  store i8* %50, i64*** %ptr_t_ptr
  %51 = load i64**, i64*** %ptr_t_ptr
  %52 = load i64*, i64** %51
  %53 = load i64**, i64*** %ptr_ret_ty
  store i64* %52, i64** %53
  br label %when_end_9
when_next_11:
  %54 = icmp eq i64 %41, 1
  br i1 %54, label %when_case_12, label %when_next_13
when_case_12:
  br label %when_end_9
when_next_13:
  %55 = icmp eq i64 %41, 0
  br i1 %55, label %when_case_14, label %when_next_15
when_case_14:
  %56 = call i8* @malloc(i64 16)
  %57 = bitcast i8* %56 to i64*
  %58 = getelementptr inbounds i64, i64* %57, i64 0
  store i64 7, i64* %58
  %59 = load i8*, i8** %ptr_name
  %60 = getelementptr inbounds i64, i64* %57, i64 1
  %61 = bitcast i64* %60 to i8**
  store i8* %59, i8** %61
  %62 = load i64**, i64*** %ptr_ret_ty
  store i64* %57, i64** %62
  br label %when_end_9
when_next_15:
  %63 = icmp eq i64 %41, 1
  br i1 %63, label %when_case_16, label %when_next_17
when_case_16:
  %64 = call i8* @malloc(i64 16)
  %65 = bitcast i8* %64 to i64*
  %66 = getelementptr inbounds i64, i64* %65, i64 0
  store i64 7, i64* %66
  %67 = load i8*, i8** %ptr_name
  %68 = getelementptr inbounds i64, i64* %65, i64 1
  %69 = bitcast i64* %68 to i8**
  store i8* %67, i8** %69
  %70 = load i64**, i64*** %ptr_ret_ty
  store i64* %65, i64** %70
  br label %when_end_9
when_next_17:
  br label %when_end_9
when_end_9:
  br label %end_if_7
else_8:
  %71 = load i64**, i64*** %ptr_expr
  %72 = bitcast i64** %71 to i64*
  %73 = getelementptr inbounds i64, i64* %72, i64 1
  %74 = bitcast i64* %73 to i8**
  %75 = load i8*, i8** %74, align 8
  %76 = load i64**, i64*** %ptr_analyzer
  call void @report_error(i64** %76, i8* %75, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.19, i64 0, i64 0))
  br label %end_if_7
end_if_7:
  br label %when_end_3
when_next_5:
  %77 = icmp eq i64 %22, 1
  br i1 %77, label %when_case_18, label %when_next_19
when_case_18:
  %78 = call i8* @malloc(i64 8)
  %79 = bitcast i8* %78 to i64*
  %80 = getelementptr inbounds i64, i64* %79, i64 0
  store i64 0, i64* %80
  %81 = load i64**, i64*** %ptr_ret_ty
  store i64* %79, i64** %81
  br label %when_end_3
when_next_19:
  %82 = icmp eq i64 %22, 2
  br i1 %82, label %when_case_20, label %when_next_21
when_case_20:
  %83 = call i8* @malloc(i64 8)
  %84 = bitcast i8* %83 to i64*
  %85 = getelementptr inbounds i64, i64* %84, i64 0
  store i64 2, i64* %85
  %86 = load i64**, i64*** %ptr_ret_ty
  store i64* %84, i64** %86
  br label %when_end_3
when_next_21:
  %87 = icmp eq i64 %22, 3
  br i1 %87, label %when_case_22, label %when_next_23
when_case_22:
  %88 = call i8* @malloc(i64 8)
  %89 = bitcast i8* %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 0
  store i64 3, i64* %90
  %91 = load i64**, i64*** %ptr_ret_ty
  store i64* %89, i64** %91
  br label %when_end_3
when_next_23:
  %92 = icmp eq i64 %22, 4
  br i1 %92, label %when_case_24, label %when_next_25
when_case_24:
  %93 = call i8* @malloc(i64 8)
  %94 = bitcast i8* %93 to i64*
  %95 = getelementptr inbounds i64, i64* %94, i64 0
  store i64 0, i64* %95
  %96 = load i64**, i64*** %ptr_ret_ty
  store i64* %94, i64** %96
  br label %when_end_3
when_next_25:
  %97 = icmp eq i64 %22, 5
  br i1 %97, label %when_case_26, label %when_next_27
when_case_26:
  %98 = call i8* @malloc(i64 8)
  %99 = bitcast i8* %98 to i64*
  %100 = getelementptr inbounds i64, i64* %99, i64 0
  store i64 5, i64* %100
  %101 = load i64**, i64*** %ptr_ret_ty
  store i64* %99, i64** %101
  br label %when_end_3
when_next_27:
  %102 = icmp eq i64 %22, 7
  br i1 %102, label %when_case_28, label %when_next_29
when_case_28:
  %103 = call i8* @malloc(i64 8)
  %104 = bitcast i8* %103 to i64*
  %105 = call i8* @malloc(i64 8)
  %106 = bitcast i8* %105 to i64*
  %107 = getelementptr inbounds i64, i64* %106, i64 0
  store i64 5, i64* %107
  store i64* %106, i64* %104
  %108 = call i8* @malloc(i64 16)
  %109 = bitcast i8* %108 to i64*
  %110 = getelementptr inbounds i64, i64* %109, i64 0
  store i64 10, i64* %110
  %111 = getelementptr inbounds i64, i64* %109, i64 1
  %112 = bitcast i64* %111 to i64**
  store i64* %104, i64** %112
  %113 = load i64**, i64*** %ptr_ret_ty
  store i64* %109, i64** %113
  br label %when_end_3
when_next_29:
  %114 = icmp eq i64 %22, 8
  br i1 %114, label %when_case_30, label %when_next_31
when_case_30:
  %115 = getelementptr inbounds i64, i64* %19, i64 1
  %116 = bitcast i64* %115 to i64***
  %117 = load i64**, i64*** %116, align 8
  store i64** %117, i64*** %ptr_inner
  %118 = load i64**, i64*** %ptr_analyzer
  %119 = load i64**, i64*** %ptr_inner
  %120 = call i64** @analyzer_analyze_expression(i64** %118, i64** %119)
  store i64** %120, i64*** %ptr_inner_ty
  %121 = load i64**, i64*** %ptr_inner_ty
  %122 = load i64*, i64** %121
  %123 = load i64**, i64*** %ptr_ret_ty
  store i64* %122, i64** %123
  br label %when_end_3
when_next_31:
  %124 = icmp eq i64 %22, 6
  br i1 %124, label %when_case_32, label %when_next_33
when_case_32:
  %125 = getelementptr inbounds i64, i64* %19, i64 1
  %126 = bitcast i64* %125 to i64***
  %127 = load i64**, i64*** %126, align 8
  %128 = call i8* @malloc(i64 8)
  %129 = bitcast i8* %128 to i64*
  store i64* %129, i64*** %ptr_inner_ty
  %130 = call i8* @malloc(i64 8)
  %131 = bitcast i8* %130 to i64*
  %132 = getelementptr inbounds i64, i64* %131, i64 0
  store i64 8, i64* %132
  %133 = load i64**, i64*** %ptr_inner_ty
  store i64* %131, i64** %133
  br label %while_cond_34
while_cond_34:
  %134 = bitcast i64** %127 to i64*
  %135 = getelementptr inbounds i64, i64* %134, i64 1
  %136 = bitcast i64* %135 to i64*
  %137 = load i64, i64* %136, align 8
  %138 = icmp slt i64 0, %137
  br i1 %138, label %while_body_35, label %while_end_36
while_body_35:
  %139 = call i64* @list_get_Spanned_Expression(i64** %127, i64 0)
  store i64* %139, i64** %ptr_el
  %140 = call i8* @malloc(i64 16)
  %141 = bitcast i8* %140 to i64*
  store i64* %141, i64*** %ptr_el_ptr
  %142 = load i64**, i64*** %ptr_el_ptr
  %143 = load i64*, i64** %ptr_el
  store i64* %143, i64** %142
  %144 = load i64**, i64*** %ptr_analyzer
  %145 = load i64**, i64*** %ptr_el_ptr
  %146 = call i64** @analyzer_analyze_expression(i64** %144, i64** %145)
  store i64** %146, i64*** %ptr_ty
  %147 = icmp eq i64 0, 0
  br i1 %147, label %then_37, label %end_if_38
then_37:
  %148 = load i64**, i64*** %ptr_ty
  %149 = load i64*, i64** %148
  %150 = load i64**, i64*** %ptr_inner_ty
  store i64* %149, i64** %150
  br label %end_if_38
end_if_38:
  %151 = add nsw i64 0, 1
  store i64 %151, i64 0
  br label %while_cond_34
while_end_36:
  %152 = call i8* @malloc(i64 16)
  %153 = bitcast i8* %152 to i64*
  store i64* %153, i64*** %ptr_array_info
  %154 = load i64**, i64*** %ptr_array_info
  %155 = load i64**, i64*** %ptr_inner_ty
  %156 = bitcast i64** %154 to i64*
  %157 = getelementptr inbounds i64, i64* %156, i64 0
  %158 = bitcast i64* %157 to i64***
  store i64** %155, i64*** %158, align 8
  %159 = bitcast i64** %127 to i64*
  %160 = getelementptr inbounds i64, i64* %159, i64 1
  %161 = bitcast i64* %160 to i64*
  %162 = load i64, i64* %161, align 8
  store i64 %162, i64* %ptr_len_opt
  %163 = load i64**, i64*** %ptr_array_info
  %164 = load i64, i64* %ptr_len_opt
  %165 = bitcast i64** %163 to i64*
  %166 = getelementptr inbounds i64, i64* %165, i64 1
  %167 = bitcast i64* %166 to i64*
  store i64 %164, i64* %167, align 8
  %168 = call i8* @malloc(i64 16)
  %169 = bitcast i8* %168 to i64*
  %170 = getelementptr inbounds i64, i64* %169, i64 0
  store i64 6, i64* %170
  %171 = load i64**, i64*** %ptr_array_info
  %172 = getelementptr inbounds i64, i64* %169, i64 1
  %173 = bitcast i64* %172 to i64***
  store i64** %171, i64*** %173
  %174 = load i64**, i64*** %ptr_ret_ty
  store i64* %169, i64** %174
  br label %when_end_3
when_next_33:
  br label %when_end_3
when_end_3:
  br label %when_end_0
when_next_2:
  %175 = icmp eq i64 %14, 0
  br i1 %175, label %when_case_39, label %when_next_40
when_case_39:
  %176 = getelementptr inbounds i64, i8* %11, i64 1
  %177 = bitcast i64* %176 to i64***
  %178 = load i64**, i64*** %177, align 8
  store i64** %178, i64*** %ptr_u
  %179 = load i64**, i64*** %ptr_u
  %180 = bitcast i64** %179 to i64*
  %181 = getelementptr inbounds i64, i64* %180, i64 1
  %182 = bitcast i64* %181 to i8**
  %183 = load i8*, i8** %182, align 8
  %184 = load i64**, i64*** %ptr_analyzer
  %185 = call i64** @analyzer_analyze_expression(i64** %184, i8* %183)
  store i64** %185, i64*** %ptr_operand_ty
  %186 = load i64**, i64*** %ptr_u
  %187 = bitcast i64** %186 to i64*
  %188 = getelementptr inbounds i64, i64* %187, i64 0
  %189 = bitcast i64* %188 to i8**
  %190 = load i8*, i8** %189, align 8
  store i8* %190, i64** %ptr_op
  %191 = load i64*, i64** %ptr_op
  %192 = getelementptr inbounds i64, i64* %191, i64 0
  %193 = bitcast i64* %192 to i64*
  %194 = load i64, i64* %193, align 8
  %195 = icmp eq i64 %194, 0
  br i1 %195, label %when_case_42, label %when_next_43
when_case_42:
  %196 = load i64**, i64*** %ptr_operand_ty
  %197 = load i64*, i64** %196
  %198 = load i64**, i64*** %ptr_ret_ty
  store i64* %197, i64** %198
  br label %when_end_41
when_next_43:
  %199 = icmp eq i64 %194, 1
  br i1 %199, label %when_case_44, label %when_next_45
when_case_44:
  %200 = call i8* @malloc(i64 8)
  %201 = bitcast i8* %200 to i64*
  %202 = getelementptr inbounds i64, i64* %201, i64 0
  store i64 5, i64* %202
  %203 = load i64**, i64*** %ptr_ret_ty
  store i64* %201, i64** %203
  br label %when_end_41
when_next_45:
  br label %when_end_41
when_end_41:
  br label %when_end_0
when_next_40:
  %204 = icmp eq i64 %14, 1
  br i1 %204, label %when_case_46, label %when_next_47
when_case_46:
  %205 = getelementptr inbounds i64, i8* %11, i64 1
  %206 = bitcast i64* %205 to i64***
  %207 = load i64**, i64*** %206, align 8
  store i64** %207, i64*** %ptr_b
  %208 = load i64**, i64*** %ptr_b
  %209 = bitcast i64** %208 to i64*
  %210 = getelementptr inbounds i64, i64* %209, i64 0
  %211 = bitcast i64* %210 to i8**
  %212 = load i8*, i8** %211, align 8
  %213 = load i64**, i64*** %ptr_analyzer
  %214 = call i64** @analyzer_analyze_expression(i64** %213, i8* %212)
  store i64** %214, i64*** %ptr_left_ty
  %215 = load i64**, i64*** %ptr_b
  %216 = bitcast i64** %215 to i64*
  %217 = getelementptr inbounds i64, i64* %216, i64 2
  %218 = bitcast i64* %217 to i8**
  %219 = load i8*, i8** %218, align 8
  %220 = load i64**, i64*** %ptr_analyzer
  %221 = call i64** @analyzer_analyze_expression(i64** %220, i8* %219)
  store i64** %221, i64*** %ptr_right_ty
  %222 = load i64**, i64*** %ptr_b
  %223 = bitcast i64** %222 to i64*
  %224 = getelementptr inbounds i64, i64* %223, i64 1
  %225 = bitcast i64* %224 to i8**
  %226 = load i8*, i8** %225, align 8
  store i8* %226, i64** %ptr_op
  %227 = load i64*, i64** %ptr_op
  %228 = getelementptr inbounds i64, i64* %227, i64 0
  %229 = bitcast i64* %228 to i64*
  %230 = load i64, i64* %229, align 8
  %231 = icmp eq i64 %230, 14
  br i1 %231, label %when_case_49, label %when_next_50
when_case_49:
  %232 = load i64**, i64*** %ptr_left_ty
  %233 = load i64*, i64** %232
  %234 = load i64**, i64*** %ptr_ret_ty
  store i64* %233, i64** %234
  br label %when_end_48
when_next_50:
  %235 = icmp eq i64 %230, 15
  br i1 %235, label %when_case_51, label %when_next_52
when_case_51:
  %236 = load i64**, i64*** %ptr_left_ty
  %237 = load i64*, i64** %236
  %238 = load i64**, i64*** %ptr_ret_ty
  store i64* %237, i64** %238
  br label %when_end_48
when_next_52:
  %239 = icmp eq i64 %230, 16
  br i1 %239, label %when_case_53, label %when_next_54
when_case_53:
  %240 = load i64**, i64*** %ptr_left_ty
  %241 = load i64*, i64** %240
  %242 = load i64**, i64*** %ptr_ret_ty
  store i64* %241, i64** %242
  br label %when_end_48
when_next_54:
  %243 = icmp eq i64 %230, 17
  br i1 %243, label %when_case_55, label %when_next_56
when_case_55:
  %244 = load i64**, i64*** %ptr_left_ty
  %245 = load i64*, i64** %244
  %246 = load i64**, i64*** %ptr_ret_ty
  store i64* %245, i64** %246
  br label %when_end_48
when_next_56:
  %247 = icmp eq i64 %230, 18
  br i1 %247, label %when_case_57, label %when_next_58
when_case_57:
  %248 = load i64**, i64*** %ptr_left_ty
  %249 = load i64*, i64** %248
  %250 = load i64**, i64*** %ptr_ret_ty
  store i64* %249, i64** %250
  br label %when_end_48
when_next_58:
  %251 = icmp eq i64 %230, 8
  br i1 %251, label %when_case_59, label %when_next_60
when_case_59:
  %252 = call i8* @malloc(i64 8)
  %253 = bitcast i8* %252 to i64*
  %254 = getelementptr inbounds i64, i64* %253, i64 0
  store i64 5, i64* %254
  %255 = load i64**, i64*** %ptr_ret_ty
  store i64* %253, i64** %255
  br label %when_end_48
when_next_60:
  %256 = icmp eq i64 %230, 9
  br i1 %256, label %when_case_61, label %when_next_62
when_case_61:
  %257 = call i8* @malloc(i64 8)
  %258 = bitcast i8* %257 to i64*
  %259 = getelementptr inbounds i64, i64* %258, i64 0
  store i64 5, i64* %259
  %260 = load i64**, i64*** %ptr_ret_ty
  store i64* %258, i64** %260
  br label %when_end_48
when_next_62:
  %261 = icmp eq i64 %230, 10
  br i1 %261, label %when_case_63, label %when_next_64
when_case_63:
  %262 = call i8* @malloc(i64 8)
  %263 = bitcast i8* %262 to i64*
  %264 = getelementptr inbounds i64, i64* %263, i64 0
  store i64 5, i64* %264
  %265 = load i64**, i64*** %ptr_ret_ty
  store i64* %263, i64** %265
  br label %when_end_48
when_next_64:
  %266 = icmp eq i64 %230, 11
  br i1 %266, label %when_case_65, label %when_next_66
when_case_65:
  %267 = call i8* @malloc(i64 8)
  %268 = bitcast i8* %267 to i64*
  %269 = getelementptr inbounds i64, i64* %268, i64 0
  store i64 5, i64* %269
  %270 = load i64**, i64*** %ptr_ret_ty
  store i64* %268, i64** %270
  br label %when_end_48
when_next_66:
  %271 = icmp eq i64 %230, 12
  br i1 %271, label %when_case_67, label %when_next_68
when_case_67:
  %272 = call i8* @malloc(i64 8)
  %273 = bitcast i8* %272 to i64*
  %274 = getelementptr inbounds i64, i64* %273, i64 0
  store i64 5, i64* %274
  %275 = load i64**, i64*** %ptr_ret_ty
  store i64* %273, i64** %275
  br label %when_end_48
when_next_68:
  %276 = icmp eq i64 %230, 13
  br i1 %276, label %when_case_69, label %when_next_70
when_case_69:
  %277 = call i8* @malloc(i64 8)
  %278 = bitcast i8* %277 to i64*
  %279 = getelementptr inbounds i64, i64* %278, i64 0
  store i64 5, i64* %279
  %280 = load i64**, i64*** %ptr_ret_ty
  store i64* %278, i64** %280
  br label %when_end_48
when_next_70:
  %281 = icmp eq i64 %230, 1
  br i1 %281, label %when_case_71, label %when_next_72
when_case_71:
  %282 = call i8* @malloc(i64 8)
  %283 = bitcast i8* %282 to i64*
  %284 = getelementptr inbounds i64, i64* %283, i64 0
  store i64 5, i64* %284
  %285 = load i64**, i64*** %ptr_ret_ty
  store i64* %283, i64** %285
  br label %when_end_48
when_next_72:
  %286 = icmp eq i64 %230, 2
  br i1 %286, label %when_case_73, label %when_next_74
when_case_73:
  %287 = call i8* @malloc(i64 8)
  %288 = bitcast i8* %287 to i64*
  %289 = getelementptr inbounds i64, i64* %288, i64 0
  store i64 5, i64* %289
  %290 = load i64**, i64*** %ptr_ret_ty
  store i64* %288, i64** %290
  br label %when_end_48
when_next_74:
  %291 = icmp eq i64 %230, 3
  br i1 %291, label %when_case_75, label %when_next_76
when_case_75:
  %292 = load i64**, i64*** %ptr_left_ty
  %293 = load i64*, i64** %292
  %294 = load i64**, i64*** %ptr_ret_ty
  store i64* %293, i64** %294
  br label %when_end_48
when_next_76:
  %295 = icmp eq i64 %230, 4
  br i1 %295, label %when_case_77, label %when_next_78
when_case_77:
  %296 = load i64**, i64*** %ptr_left_ty
  %297 = load i64*, i64** %296
  %298 = load i64**, i64*** %ptr_ret_ty
  store i64* %297, i64** %298
  br label %when_end_48
when_next_78:
  %299 = icmp eq i64 %230, 5
  br i1 %299, label %when_case_79, label %when_next_80
when_case_79:
  %300 = load i64**, i64*** %ptr_left_ty
  %301 = load i64*, i64** %300
  %302 = load i64**, i64*** %ptr_ret_ty
  store i64* %301, i64** %302
  br label %when_end_48
when_next_80:
  %303 = icmp eq i64 %230, 6
  br i1 %303, label %when_case_81, label %when_next_82
when_case_81:
  %304 = load i64**, i64*** %ptr_left_ty
  %305 = load i64*, i64** %304
  %306 = load i64**, i64*** %ptr_ret_ty
  store i64* %305, i64** %306
  br label %when_end_48
when_next_82:
  %307 = icmp eq i64 %230, 7
  br i1 %307, label %when_case_83, label %when_next_84
when_case_83:
  %308 = load i64**, i64*** %ptr_left_ty
  %309 = load i64*, i64** %308
  %310 = load i64**, i64*** %ptr_ret_ty
  store i64* %309, i64** %310
  br label %when_end_48
when_next_84:
  %311 = icmp eq i64 %230, 0
  br i1 %311, label %when_case_85, label %when_next_86
when_case_85:
  %312 = load i64**, i64*** %ptr_right_ty
  %313 = load i64*, i64** %312
  %314 = load i64**, i64*** %ptr_ret_ty
  store i64* %313, i64** %314
  br label %when_end_48
when_next_86:
  br label %when_end_48
when_end_48:
  br label %when_end_0
when_next_47:
  %315 = icmp eq i64 %14, 2
  br i1 %315, label %when_case_87, label %when_next_88
when_case_87:
  %316 = getelementptr inbounds i64, i8* %11, i64 1
  %317 = bitcast i64* %316 to i64***
  %318 = load i64**, i64*** %317, align 8
  store i64** %318, i64*** %ptr_p
  %319 = load i64**, i64*** %ptr_p
  %320 = bitcast i64** %319 to i64*
  %321 = getelementptr inbounds i64, i64* %320, i64 0
  %322 = bitcast i64* %321 to i8**
  %323 = load i8*, i8** %322, align 8
  %324 = load i64**, i64*** %ptr_analyzer
  %325 = call i64** @analyzer_analyze_expression(i64** %324, i8* %323)
  store i64** %325, i64*** %ptr_obj_ty
  %326 = load i64**, i64*** %ptr_p
  %327 = bitcast i64** %326 to i64*
  %328 = getelementptr inbounds i64, i64* %327, i64 1
  %329 = bitcast i64* %328 to i8**
  %330 = load i8*, i8** %329, align 8
  %331 = call i32 @strcmp(i8* %330, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.20, i64 0, i64 0))
  %332 = icmp eq i32 %331, 0
  br i1 %332, label %then_89, label %end_if_90
then_89:
  %333 = load i64**, i64*** %ptr_obj_ty
  %334 = load i64*, i64** %333
  %335 = getelementptr inbounds i64, i64* %334, i64 0
  %336 = bitcast i64* %335 to i64*
  %337 = load i64, i64* %336, align 8
  %338 = icmp eq i64 %337, 6
  br i1 %338, label %when_case_92, label %when_next_93
when_case_92:
  %339 = call i8* @malloc(i64 8)
  %340 = bitcast i8* %339 to i64*
  %341 = getelementptr inbounds i64, i64* %340, i64 0
  store i64 0, i64* %341
  %342 = load i64**, i64*** %ptr_ret_ty
  store i64* %340, i64** %342
  br label %when_end_91
when_next_93:
  %343 = icmp eq i64 %337, 3
  br i1 %343, label %when_case_94, label %when_next_95
when_case_94:
  %344 = call i8* @malloc(i64 8)
  %345 = bitcast i8* %344 to i64*
  %346 = getelementptr inbounds i64, i64* %345, i64 0
  store i64 0, i64* %346
  %347 = load i64**, i64*** %ptr_ret_ty
  store i64* %345, i64** %347
  br label %when_end_91
when_next_95:
  %348 = icmp eq i64 %337, 8
  br i1 %348, label %when_case_96, label %when_next_97
when_case_96:
  br label %when_end_91
when_next_97:
  %349 = icmp eq i64 %337, 0
  br i1 %349, label %when_case_98, label %when_next_99
when_case_98:
  br label %when_end_91
when_next_99:
  %350 = icmp eq i64 %337, 2
  br i1 %350, label %when_case_100, label %when_next_101
when_case_100:
  br label %when_end_91
when_next_101:
  %351 = icmp eq i64 %337, 5
  br i1 %351, label %when_case_102, label %when_next_103
when_case_102:
  br label %when_end_91
when_next_103:
  %352 = icmp eq i64 %337, 4
  br i1 %352, label %when_case_104, label %when_next_105
when_case_104:
  br label %when_end_91
when_next_105:
  %353 = icmp eq i64 %337, 5
  br i1 %353, label %when_case_106, label %when_next_107
when_case_106:
  br label %when_end_91
when_next_107:
  %354 = icmp eq i64 %337, 7
  br i1 %354, label %when_case_108, label %when_next_109
when_case_108:
  br label %when_end_91
when_next_109:
  %355 = icmp eq i64 %337, 9
  br i1 %355, label %when_case_110, label %when_next_111
when_case_110:
  br label %when_end_91
when_next_111:
  %356 = icmp eq i64 %337, 10
  br i1 %356, label %when_case_112, label %when_next_113
when_case_112:
  br label %when_end_91
when_next_113:
  %357 = icmp eq i64 %337, 11
  br i1 %357, label %when_case_114, label %when_next_115
when_case_114:
  br label %when_end_91
when_next_115:
  br label %when_end_91
when_end_91:
  br label %end_if_90
end_if_90:
  br label %when_end_0
when_next_88:
  %358 = icmp eq i64 %14, 3
  br i1 %358, label %when_case_116, label %when_next_117
when_case_116:
  %359 = getelementptr inbounds i64, i8* %11, i64 1
  %360 = bitcast i64* %359 to i64***
  %361 = load i64**, i64*** %360, align 8
  store i64** %361, i64*** %ptr_c
  %362 = load i64**, i64*** %ptr_c
  %363 = bitcast i64** %362 to i64*
  %364 = getelementptr inbounds i64, i64* %363, i64 0
  %365 = bitcast i64* %364 to i8**
  %366 = load i8*, i8** %365, align 8
  %367 = load i64**, i64*** %ptr_analyzer
  %368 = call i64** @analyzer_analyze_expression(i64** %367, i8* %366)
  store i64 0, i64 0
  br label %while_cond_118
while_cond_118:
  %369 = load i64**, i64*** %ptr_c
  %370 = bitcast i64** %369 to i64*
  %371 = getelementptr inbounds i64, i64* %370, i64 1
  %372 = bitcast i64* %371 to i8**
  %373 = load i8*, i8** %372, align 8
  %374 = bitcast i8* %373 to i64*
  %375 = getelementptr inbounds i64, i64* %374, i64 1
  %376 = bitcast i64* %375 to i64*
  %377 = load i64, i64* %376, align 8
  %378 = icmp slt i64 0, %377
  br i1 %378, label %while_body_119, label %while_end_120
while_body_119:
  %379 = load i64**, i64*** %ptr_c
  %380 = bitcast i64** %379 to i64*
  %381 = getelementptr inbounds i64, i64* %380, i64 1
  %382 = bitcast i64* %381 to i8**
  %383 = load i8*, i8** %382, align 8
  %384 = call i64* @list_get_Spanned_Expression(i8* %383, i64 0)
  store i64* %384, i64** %ptr_arg
  %385 = call i8* @malloc(i64 16)
  %386 = bitcast i8* %385 to i64*
  store i64* %386, i64*** %ptr_arg_ptr
  %387 = load i64**, i64*** %ptr_arg_ptr
  %388 = load i64*, i64** %ptr_arg
  store i64* %388, i64** %387
  %389 = load i64**, i64*** %ptr_analyzer
  %390 = load i64**, i64*** %ptr_arg_ptr
  %391 = call i64** @analyzer_analyze_expression(i64** %389, i64** %390)
  %392 = add nsw i64 0, 1
  store i64 %392, i64 0
  br label %while_cond_118
while_end_120:
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.21, i64 0, i64 0), i8** %ptr_callee_name
  %393 = load i64**, i64*** %ptr_c
  %394 = bitcast i64** %393 to i64*
  %395 = getelementptr inbounds i64, i64* %394, i64 0
  %396 = bitcast i64* %395 to i8**
  %397 = load i8*, i8** %396, align 8
  %398 = bitcast i8* %397 to i64*
  %399 = getelementptr inbounds i64, i64* %398, i64 0
  %400 = bitcast i64* %399 to i8**
  %401 = load i8*, i8** %400, align 8
  %402 = getelementptr inbounds i64, i8* %401, i64 0
  %403 = bitcast i64* %402 to i64*
  %404 = load i64, i64* %403, align 8
  %405 = icmp eq i64 %404, 16
  br i1 %405, label %when_case_122, label %when_next_123
when_case_122:
  %406 = getelementptr inbounds i64, i8* %401, i64 1
  %407 = bitcast i64* %406 to i64***
  %408 = load i64**, i64*** %407, align 8
  store i64** %408, i64*** %ptr_pr_ptr
  %409 = load i64**, i64*** %ptr_pr_ptr
  %410 = load i64*, i64** %409
  %411 = getelementptr inbounds i64, i64* %410, i64 0
  %412 = bitcast i64* %411 to i64*
  %413 = load i64, i64* %412, align 8
  %414 = icmp eq i64 %413, 0
  br i1 %414, label %when_case_125, label %when_next_126
when_case_125:
  %415 = getelementptr inbounds i64, i64* %410, i64 1
  %416 = bitcast i64* %415 to i8**
  %417 = load i8*, i8** %416, align 8
  store i8* %417, i8** %ptr_name
  %418 = load i8*, i8** %ptr_name
  store i8* %418, i8** %ptr_callee_name
  br label %when_end_124
when_next_126:
  %419 = icmp eq i64 %413, 1
  br i1 %419, label %when_case_127, label %when_next_128
when_case_127:
  br label %when_end_124
when_next_128:
  %420 = icmp eq i64 %413, 2
  br i1 %420, label %when_case_129, label %when_next_130
when_case_129:
  br label %when_end_124
when_next_130:
  %421 = icmp eq i64 %413, 3
  br i1 %421, label %when_case_131, label %when_next_132
when_case_131:
  br label %when_end_124
when_next_132:
  %422 = icmp eq i64 %413, 4
  br i1 %422, label %when_case_133, label %when_next_134
when_case_133:
  br label %when_end_124
when_next_134:
  %423 = icmp eq i64 %413, 5
  br i1 %423, label %when_case_135, label %when_next_136
when_case_135:
  br label %when_end_124
when_next_136:
  %424 = icmp eq i64 %413, 6
  br i1 %424, label %when_case_137, label %when_next_138
when_case_137:
  br label %when_end_124
when_next_138:
  %425 = icmp eq i64 %413, 7
  br i1 %425, label %when_case_139, label %when_next_140
when_case_139:
  br label %when_end_124
when_next_140:
  %426 = icmp eq i64 %413, 8
  br i1 %426, label %when_case_141, label %when_next_142
when_case_141:
  br label %when_end_124
when_next_142:
  br label %when_end_124
when_end_124:
  br label %when_end_121
when_next_123:
  %427 = icmp eq i64 %404, 0
  br i1 %427, label %when_case_143, label %when_next_144
when_case_143:
  br label %when_end_121
when_next_144:
  %428 = icmp eq i64 %404, 1
  br i1 %428, label %when_case_145, label %when_next_146
when_case_145:
  br label %when_end_121
when_next_146:
  %429 = icmp eq i64 %404, 2
  br i1 %429, label %when_case_147, label %when_next_148
when_case_147:
  br label %when_end_121
when_next_148:
  %430 = icmp eq i64 %404, 3
  br i1 %430, label %when_case_149, label %when_next_150
when_case_149:
  br label %when_end_121
when_next_150:
  %431 = icmp eq i64 %404, 4
  br i1 %431, label %when_case_151, label %when_next_152
when_case_151:
  br label %when_end_121
when_next_152:
  %432 = icmp eq i64 %404, 5
  br i1 %432, label %when_case_153, label %when_next_154
when_case_153:
  br label %when_end_121
when_next_154:
  %433 = icmp eq i64 %404, 6
  br i1 %433, label %when_case_155, label %when_next_156
when_case_155:
  br label %when_end_121
when_next_156:
  %434 = icmp eq i64 %404, 7
  br i1 %434, label %when_case_157, label %when_next_158
when_case_157:
  br label %when_end_121
when_next_158:
  %435 = icmp eq i64 %404, 8
  br i1 %435, label %when_case_159, label %when_next_160
when_case_159:
  br label %when_end_121
when_next_160:
  %436 = icmp eq i64 %404, 9
  br i1 %436, label %when_case_161, label %when_next_162
when_case_161:
  br label %when_end_121
when_next_162:
  %437 = icmp eq i64 %404, 10
  br i1 %437, label %when_case_163, label %when_next_164
when_case_163:
  br label %when_end_121
when_next_164:
  %438 = icmp eq i64 %404, 11
  br i1 %438, label %when_case_165, label %when_next_166
when_case_165:
  br label %when_end_121
when_next_166:
  %439 = icmp eq i64 %404, 12
  br i1 %439, label %when_case_167, label %when_next_168
when_case_167:
  br label %when_end_121
when_next_168:
  %440 = icmp eq i64 %404, 13
  br i1 %440, label %when_case_169, label %when_next_170
when_case_169:
  br label %when_end_121
when_next_170:
  %441 = icmp eq i64 %404, 14
  br i1 %441, label %when_case_171, label %when_next_172
when_case_171:
  br label %when_end_121
when_next_172:
  %442 = icmp eq i64 %404, 15
  br i1 %442, label %when_case_173, label %when_next_174
when_case_173:
  br label %when_end_121
when_next_174:
  br label %when_end_121
when_end_121:
  %443 = load i8*, i8** %ptr_callee_name
  %444 = call i32 @strcmp(i8* %443, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.22, i64 0, i64 0))
  %445 = icmp ne i32 %444, 0
  br i1 %445, label %then_175, label %end_if_176
then_175:
  %446 = load i64**, i64*** %ptr_analyzer
  %447 = bitcast i64** %446 to i64*
  %448 = getelementptr inbounds i64, i64* %447, i64 0
  %449 = bitcast i64* %448 to i8**
  %450 = load i8*, i8** %449, align 8
  %451 = load i8*, i8** %ptr_callee_name
  %452 = call i64** @env_resolve(i8* %450, i8* %451)
  store i64** %452, i64*** %ptr_sym_opt
  %453 = load i64**, i64*** %ptr_sym_opt
  %454 = icmp ne i64** %453, null
  br i1 %454, label %then_177, label %end_if_178
then_177:
  %455 = load i64**, i64*** %ptr_sym_opt
  store i64** %455, i64*** %ptr_sym
  %456 = load i64**, i64*** %ptr_sym
  %457 = load i64*, i64** %456
  %458 = getelementptr inbounds i64, i64* %457, i64 0
  %459 = bitcast i64* %458 to i64*
  %460 = load i64, i64* %459, align 8
  %461 = icmp eq i64 %460, 1
  br i1 %461, label %when_case_180, label %when_next_181
when_case_180:
  %462 = getelementptr inbounds i64, i64* %457, i64 1
  %463 = bitcast i64* %462 to i64***
  %464 = load i64**, i64*** %463, align 8
  store i64** %464, i64*** %ptr_f
  %465 = load i64**, i64*** %ptr_f
  %466 = bitcast i64** %465 to i64*
  %467 = getelementptr inbounds i64, i64* %466, i64 0
  %468 = bitcast i64* %467 to i8**
  %469 = load i8*, i8** %468, align 8
  %470 = load i8, i8* %469
  %471 = load i64**, i64*** %ptr_ret_ty
  store i8 %470, i64** %471
  br label %when_end_179
when_next_181:
  %472 = icmp eq i64 %460, 0
  br i1 %472, label %when_case_182, label %when_next_183
when_case_182:
  %473 = call i8* @malloc(i64 16)
  %474 = bitcast i8* %473 to i64*
  %475 = getelementptr inbounds i64, i64* %474, i64 0
  store i64 7, i64* %475
  %476 = load i8*, i8** %ptr_callee_name
  %477 = getelementptr inbounds i64, i64* %474, i64 1
  %478 = bitcast i64* %477 to i8**
  store i8* %476, i8** %478
  %479 = load i64**, i64*** %ptr_ret_ty
  store i64* %474, i64** %479
  br label %when_end_179
when_next_183:
  %480 = icmp eq i64 %460, 0
  br i1 %480, label %when_case_184, label %when_next_185
when_case_184:
  br label %when_end_179
when_next_185:
  %481 = icmp eq i64 %460, 1
  br i1 %481, label %when_case_186, label %when_next_187
when_case_186:
  br label %when_end_179
when_next_187:
  br label %when_end_179
when_end_179:
  br label %end_if_178
end_if_178:
  br label %end_if_176
end_if_176:
  br label %when_end_0
when_next_117:
  %482 = icmp eq i64 %14, 4
  br i1 %482, label %when_case_188, label %when_next_189
when_case_188:
  %483 = getelementptr inbounds i64, i8* %11, i64 1
  %484 = bitcast i64* %483 to i64***
  %485 = load i64**, i64*** %484, align 8
  store i64** %485, i64*** %ptr_wh
  %486 = load i64**, i64*** %ptr_wh
  %487 = bitcast i64** %486 to i64*
  %488 = getelementptr inbounds i64, i64* %487, i64 0
  %489 = bitcast i64* %488 to i8**
  %490 = load i8*, i8** %489, align 8
  %491 = load i64**, i64*** %ptr_analyzer
  %492 = call i64** @analyzer_analyze_expression(i64** %491, i8* %490)
  store i64 0, i64 0
  br label %while_cond_190
while_cond_190:
  %493 = load i64**, i64*** %ptr_wh
  %494 = bitcast i64** %493 to i64*
  %495 = getelementptr inbounds i64, i64* %494, i64 1
  %496 = bitcast i64* %495 to i8**
  %497 = load i8*, i8** %496, align 8
  %498 = bitcast i8* %497 to i64*
  %499 = getelementptr inbounds i64, i64* %498, i64 1
  %500 = bitcast i64* %499 to i64*
  %501 = load i64, i64* %500, align 8
  %502 = icmp slt i64 0, %501
  br i1 %502, label %while_body_191, label %while_end_192
while_body_191:
  %503 = load i64**, i64*** %ptr_wh
  %504 = bitcast i64** %503 to i64*
  %505 = getelementptr inbounds i64, i64* %504, i64 1
  %506 = bitcast i64* %505 to i8**
  %507 = load i8*, i8** %506, align 8
  %508 = call i64* @list_get_WhenCase(i8* %507, i64 0)
  store i64* %508, i64** %ptr_case_item
  %509 = call i8* @malloc(i64 16)
  %510 = bitcast i8* %509 to i64*
  store i64* %510, i64*** %ptr_block_ptr
  %511 = load i64*, i64** %ptr_case_item
  %512 = bitcast i64* %511 to i64*
  %513 = getelementptr inbounds i64, i64* %512, i64 2
  %514 = bitcast i64* %513 to i8**
  %515 = load i8*, i8** %514, align 8
  %516 = load i8, i8* %515
  %517 = load i64**, i64*** %ptr_block_ptr
  store i8 %516, i64** %517
  %518 = load i64**, i64*** %ptr_analyzer
  %519 = load i64**, i64*** %ptr_block_ptr
  call void @analyzer_analyze_block(i64** %518, i64** %519)
  %520 = add nsw i64 0, 1
  store i64 %520, i64 0
  br label %while_cond_190
while_end_192:
  br label %when_end_0
when_next_189:
  %521 = icmp eq i64 %14, 5
  br i1 %521, label %when_case_193, label %when_next_194
when_case_193:
  %522 = getelementptr inbounds i64, i8* %11, i64 1
  %523 = bitcast i64* %522 to i64***
  %524 = load i64**, i64*** %523, align 8
  store i64** %524, i64*** %ptr_a
  %525 = load i64**, i64*** %ptr_a
  store i64** %525, i64*** %ptr_al
  %526 = call i8* @malloc(i64 48)
  %527 = bitcast i8* %526 to i64*
  store i64* %527, i64*** %ptr_ty_ptr
  %528 = load i64**, i64*** %ptr_al
  %529 = bitcast i64** %528 to i64*
  %530 = getelementptr inbounds i64, i64* %529, i64 0
  %531 = bitcast i64* %530 to i8**
  %532 = load i8*, i8** %531, align 8
  %533 = bitcast i8* %532 to i64*
  %534 = getelementptr inbounds i64, i64* %533, i64 0
  %535 = bitcast i64* %534 to i8**
  %536 = load i8*, i8** %535, align 8
  %537 = load i64**, i64*** %ptr_ty_ptr
  store i8* %536, i64** %537
  %538 = load i64**, i64*** %ptr_ty_ptr
  %539 = call i64** @type_info_from_ast(i64** %538)
  store i64** %539, i64*** %ptr_alloc_ptr
  %540 = call i8* @malloc(i64 16)
  %541 = bitcast i8* %540 to i64*
  %542 = getelementptr inbounds i64, i64* %541, i64 0
  store i64 9, i64* %542
  %543 = load i64**, i64*** %ptr_alloc_ptr
  %544 = getelementptr inbounds i64, i64* %541, i64 1
  %545 = bitcast i64* %544 to i64***
  store i64** %543, i64*** %545
  %546 = load i64**, i64*** %ptr_ret_ty
  store i64* %541, i64** %546
  store i64 0, i64 0
  br label %while_cond_195
while_cond_195:
  %547 = load i64**, i64*** %ptr_al
  %548 = bitcast i64** %547 to i64*
  %549 = getelementptr inbounds i64, i64* %548, i64 1
  %550 = bitcast i64* %549 to i8**
  %551 = load i8*, i8** %550, align 8
  %552 = bitcast i8* %551 to i64*
  %553 = getelementptr inbounds i64, i64* %552, i64 1
  %554 = bitcast i64* %553 to i64*
  %555 = load i64, i64* %554, align 8
  %556 = icmp slt i64 0, %555
  br i1 %556, label %while_body_196, label %while_end_197
while_body_196:
  %557 = load i64**, i64*** %ptr_al
  %558 = bitcast i64** %557 to i64*
  %559 = getelementptr inbounds i64, i64* %558, i64 1
  %560 = bitcast i64* %559 to i8**
  %561 = load i8*, i8** %560, align 8
  %562 = call i64* @list_get_Spanned_Expression(i8* %561, i64 0)
  store i64* %562, i64** %ptr_arg
  %563 = call i8* @malloc(i64 16)
  %564 = bitcast i8* %563 to i64*
  store i64* %564, i64*** %ptr_arg_ptr
  %565 = load i64**, i64*** %ptr_arg_ptr
  %566 = load i64*, i64** %ptr_arg
  store i64* %566, i64** %565
  %567 = load i64**, i64*** %ptr_analyzer
  %568 = load i64**, i64*** %ptr_arg_ptr
  %569 = call i64** @analyzer_analyze_expression(i64** %567, i64** %568)
  %570 = add nsw i64 0, 1
  store i64 %570, i64 0
  br label %while_cond_195
while_end_197:
  br label %when_end_0
when_next_194:
  %571 = icmp eq i64 %14, 6
  br i1 %571, label %when_case_198, label %when_next_199
when_case_198:
  %572 = getelementptr inbounds i64, i8* %11, i64 1
  %573 = bitcast i64* %572 to i64***
  %574 = load i64**, i64*** %573, align 8
  store i64** %574, i64*** %ptr_d
  %575 = load i64**, i64*** %ptr_d
  store i64** %575, i64*** %ptr_de
  %576 = load i64**, i64*** %ptr_analyzer
  %577 = load i64**, i64*** %ptr_de
  %578 = call i64** @analyzer_analyze_expression(i64** %576, i64** %577)
  store i64** %578, i64*** %ptr_inner_ty
  %579 = load i64**, i64*** %ptr_inner_ty
  %580 = load i64*, i64** %579
  %581 = getelementptr inbounds i64, i64* %580, i64 0
  %582 = bitcast i64* %581 to i64*
  %583 = load i64, i64* %582, align 8
  %584 = icmp eq i64 %583, 9
  br i1 %584, label %when_case_201, label %when_next_202
when_case_201:
  %585 = getelementptr inbounds i64, i64* %580, i64 1
  %586 = bitcast i64* %585 to i64***
  %587 = load i64**, i64*** %586, align 8
  store i64** %587, i64*** %ptr_ptr
  %588 = load i64**, i64*** %ptr_ptr
  %589 = load i64*, i64** %588
  %590 = load i64**, i64*** %ptr_ret_ty
  store i64* %589, i64** %590
  br label %when_end_200
when_next_202:
  %591 = icmp eq i64 %583, 10
  br i1 %591, label %when_case_203, label %when_next_204
when_case_203:
  %592 = getelementptr inbounds i64, i64* %580, i64 1
  %593 = bitcast i64* %592 to i64***
  %594 = load i64**, i64*** %593, align 8
  store i64** %594, i64** %587
  store i64** %587, i64*** %ptr_ptr
  %595 = load i64**, i64*** %ptr_ptr
  %596 = load i64*, i64** %595
  %597 = load i64**, i64*** %ptr_ret_ty
  store i64* %596, i64** %597
  br label %when_end_200
when_next_204:
  %598 = icmp eq i64 %583, 8
  br i1 %598, label %when_case_205, label %when_next_206
when_case_205:
  br label %when_end_200
when_next_206:
  %599 = icmp eq i64 %583, 0
  br i1 %599, label %when_case_207, label %when_next_208
when_case_207:
  br label %when_end_200
when_next_208:
  %600 = icmp eq i64 %583, 2
  br i1 %600, label %when_case_209, label %when_next_210
when_case_209:
  br label %when_end_200
when_next_210:
  %601 = icmp eq i64 %583, 5
  br i1 %601, label %when_case_211, label %when_next_212
when_case_211:
  br label %when_end_200
when_next_212:
  %602 = icmp eq i64 %583, 3
  br i1 %602, label %when_case_213, label %when_next_214
when_case_213:
  br label %when_end_200
when_next_214:
  %603 = icmp eq i64 %583, 4
  br i1 %603, label %when_case_215, label %when_next_216
when_case_215:
  br label %when_end_200
when_next_216:
  %604 = icmp eq i64 %583, 5
  br i1 %604, label %when_case_217, label %when_next_218
when_case_217:
  br label %when_end_200
when_next_218:
  %605 = icmp eq i64 %583, 7
  br i1 %605, label %when_case_219, label %when_next_220
when_case_219:
  br label %when_end_200
when_next_220:
  %606 = icmp eq i64 %583, 6
  br i1 %606, label %when_case_221, label %when_next_222
when_case_221:
  br label %when_end_200
when_next_222:
  %607 = icmp eq i64 %583, 11
  br i1 %607, label %when_case_223, label %when_next_224
when_case_223:
  br label %when_end_200
when_next_224:
  br label %when_end_200
when_end_200:
  br label %when_end_0
when_next_199:
  %608 = icmp eq i64 %14, 7
  br i1 %608, label %when_case_225, label %when_next_226
when_case_225:
  %609 = getelementptr inbounds i64, i8* %11, i64 1
  %610 = bitcast i64* %609 to i64***
  %611 = load i64**, i64*** %610, align 8
  store i64** %611, i64*** %ptr_v
  %612 = load i64**, i64*** %ptr_v
  store i64** %612, i64*** %ptr_v_expr
  %613 = load i64**, i64*** %ptr_v_expr
  %614 = bitcast i64** %613 to i64*
  %615 = getelementptr inbounds i64, i64* %614, i64 0
  %616 = bitcast i64* %615 to i8**
  %617 = load i8*, i8** %616, align 8
  %618 = load i64**, i64*** %ptr_analyzer
  %619 = call i64** @analyzer_analyze_expression(i64** %618, i8* %617)
  store i64** %619, i64*** %ptr_target_ty
  %620 = load i64**, i64*** %ptr_target_ty
  %621 = load i64*, i64** %620
  %622 = load i64**, i64*** %ptr_ret_ty
  store i64* %621, i64** %622
  br label %when_end_0
when_next_226:
  %623 = icmp eq i64 %14, 8
  br i1 %623, label %when_case_227, label %when_next_228
when_case_227:
  %624 = getelementptr inbounds i64, i8* %11, i64 1
  %625 = bitcast i64* %624 to i64***
  %626 = load i64**, i64*** %625, align 8
  store i64** %626, i64*** %ptr_idx_expr
  %627 = load i64**, i64*** %ptr_idx_expr
  %628 = bitcast i64** %627 to i64*
  %629 = getelementptr inbounds i64, i64* %628, i64 0
  %630 = bitcast i64* %629 to i8**
  %631 = load i8*, i8** %630, align 8
  %632 = load i64**, i64*** %ptr_analyzer
  %633 = call i64** @analyzer_analyze_expression(i64** %632, i8* %631)
  store i64** %633, i64*** %ptr_target_ty
  %634 = load i64**, i64*** %ptr_idx_expr
  %635 = bitcast i64** %634 to i64*
  %636 = getelementptr inbounds i64, i64* %635, i64 1
  %637 = bitcast i64* %636 to i8**
  %638 = load i8*, i8** %637, align 8
  %639 = load i64**, i64*** %ptr_analyzer
  %640 = call i64** @analyzer_analyze_expression(i64** %639, i8* %638)
  %641 = load i64**, i64*** %ptr_target_ty
  %642 = load i64*, i64** %641
  %643 = getelementptr inbounds i64, i64* %642, i64 0
  %644 = bitcast i64* %643 to i64*
  %645 = load i64, i64* %644, align 8
  %646 = icmp eq i64 %645, 6
  br i1 %646, label %when_case_230, label %when_next_231
when_case_230:
  %647 = getelementptr inbounds i64, i64* %642, i64 1
  %648 = bitcast i64* %647 to i64***
  %649 = load i64**, i64*** %648, align 8
  store i64** %649, i64*** %ptr_a_info
  %650 = load i64**, i64*** %ptr_a_info
  %651 = bitcast i64** %650 to i64*
  %652 = getelementptr inbounds i64, i64* %651, i64 0
  %653 = bitcast i64* %652 to i8**
  %654 = load i8*, i8** %653, align 8
  store i8* %654, i64*** %ptr_inner
  %655 = load i64**, i64*** %ptr_inner
  %656 = load i64*, i64** %655
  %657 = load i64**, i64*** %ptr_ret_ty
  store i64* %656, i64** %657
  br label %when_end_229
when_next_231:
  %658 = icmp eq i64 %645, 8
  br i1 %658, label %when_case_232, label %when_next_233
when_case_232:
  br label %when_end_229
when_next_233:
  %659 = icmp eq i64 %645, 0
  br i1 %659, label %when_case_234, label %when_next_235
when_case_234:
  br label %when_end_229
when_next_235:
  %660 = icmp eq i64 %645, 2
  br i1 %660, label %when_case_236, label %when_next_237
when_case_236:
  br label %when_end_229
when_next_237:
  %661 = icmp eq i64 %645, 5
  br i1 %661, label %when_case_238, label %when_next_239
when_case_238:
  br label %when_end_229
when_next_239:
  %662 = icmp eq i64 %645, 3
  br i1 %662, label %when_case_240, label %when_next_241
when_case_240:
  br label %when_end_229
when_next_241:
  %663 = icmp eq i64 %645, 4
  br i1 %663, label %when_case_242, label %when_next_243
when_case_242:
  br label %when_end_229
when_next_243:
  %664 = icmp eq i64 %645, 5
  br i1 %664, label %when_case_244, label %when_next_245
when_case_244:
  br label %when_end_229
when_next_245:
  %665 = icmp eq i64 %645, 7
  br i1 %665, label %when_case_246, label %when_next_247
when_case_246:
  br label %when_end_229
when_next_247:
  %666 = icmp eq i64 %645, 9
  br i1 %666, label %when_case_248, label %when_next_249
when_case_248:
  br label %when_end_229
when_next_249:
  %667 = icmp eq i64 %645, 10
  br i1 %667, label %when_case_250, label %when_next_251
when_case_250:
  br label %when_end_229
when_next_251:
  %668 = icmp eq i64 %645, 11
  br i1 %668, label %when_case_252, label %when_next_253
when_case_252:
  br label %when_end_229
when_next_253:
  br label %when_end_229
when_end_229:
  br label %when_end_0
when_next_228:
  %669 = icmp eq i64 %14, 9
  br i1 %669, label %when_case_254, label %when_next_255
when_case_254:
  %670 = getelementptr inbounds i64, i8* %11, i64 1
  %671 = bitcast i64* %670 to i64***
  %672 = load i64**, i64*** %671, align 8
  store i64** %672, i64*** %ptr_v
  %673 = load i64**, i64*** %ptr_v
  store i64** %673, i64*** %ptr_var_expr
  %674 = load i64**, i64*** %ptr_var_expr
  %675 = bitcast i64** %674 to i64*
  %676 = getelementptr inbounds i64, i64* %675, i64 0
  %677 = bitcast i64* %676 to i8**
  %678 = load i8*, i8** %677, align 8
  %679 = call i8* @malloc(i64 16)
  %680 = bitcast i8* %679 to i64*
  %681 = getelementptr inbounds i64, i64* %680, i64 0
  store i64 7, i64* %681
  %682 = getelementptr inbounds i64, i64* %680, i64 1
  %683 = bitcast i64* %682 to i8**
  store i8* %678, i8** %683
  %684 = load i64**, i64*** %ptr_ret_ty
  store i64* %680, i64** %684
  br label %when_end_0
when_next_255:
  %685 = icmp eq i64 %14, 10
  br i1 %685, label %when_case_256, label %when_next_257
when_case_256:
  %686 = call i8* @malloc(i64 8)
  %687 = bitcast i8* %686 to i64*
  %688 = getelementptr inbounds i64, i64* %687, i64 0
  store i64 8, i64* %688
  %689 = load i64**, i64*** %ptr_ret_ty
  store i64* %687, i64** %689
  br label %when_end_0
when_next_257:
  %690 = icmp eq i64 %14, 11
  br i1 %690, label %when_case_258, label %when_next_259
when_case_258:
  %691 = call i8* @malloc(i64 8)
  %692 = bitcast i8* %691 to i64*
  %693 = getelementptr inbounds i64, i64* %692, i64 0
  store i64 4, i64* %693
  %694 = load i64**, i64*** %ptr_ret_ty
  store i64* %692, i64** %694
  br label %when_end_0
when_next_259:
  %695 = icmp eq i64 %14, 12
  br i1 %695, label %when_case_260, label %when_next_261
when_case_260:
  %696 = call i8* @malloc(i64 8)
  %697 = bitcast i8* %696 to i64*
  %698 = getelementptr inbounds i64, i64* %697, i64 0
  store i64 3, i64* %698
  %699 = load i64**, i64*** %ptr_ret_ty
  store i64* %697, i64** %699
  br label %when_end_0
when_next_261:
  %700 = icmp eq i64 %14, 13
  br i1 %700, label %when_case_262, label %when_next_263
when_case_262:
  %701 = call i8* @malloc(i64 8)
  %702 = bitcast i8* %701 to i64*
  %703 = getelementptr inbounds i64, i64* %702, i64 0
  store i64 5, i64* %703
  %704 = load i64**, i64*** %ptr_ret_ty
  store i64* %702, i64** %704
  br label %when_end_0
when_next_263:
  %705 = icmp eq i64 %14, 14
  br i1 %705, label %when_case_264, label %when_next_265
when_case_264:
  %706 = call i8* @malloc(i64 8)
  %707 = bitcast i8* %706 to i64*
  %708 = getelementptr inbounds i64, i64* %707, i64 0
  store i64 5, i64* %708
  %709 = load i64**, i64*** %ptr_ret_ty
  store i64* %707, i64** %709
  br label %when_end_0
when_next_265:
  %710 = icmp eq i64 %14, 15
  br i1 %710, label %when_case_266, label %when_next_267
when_case_266:
  %711 = getelementptr inbounds i64, i8* %11, i64 1
  %712 = bitcast i64* %711 to i64***
  %713 = load i64**, i64*** %712, align 8
  store i64** %713, i64*** %ptr_c
  %714 = load i64**, i64*** %ptr_c
  store i64** %714, i64*** %ptr_cast_expr
  %715 = load i64**, i64*** %ptr_cast_expr
  %716 = bitcast i64** %715 to i64*
  %717 = getelementptr inbounds i64, i64* %716, i64 0
  %718 = bitcast i64* %717 to i8**
  %719 = load i8*, i8** %718, align 8
  %720 = load i64**, i64*** %ptr_analyzer
  %721 = call i64** @analyzer_analyze_expression(i64** %720, i8* %719)
  %722 = call i8* @malloc(i64 48)
  %723 = bitcast i8* %722 to i64*
  store i64* %723, i64*** %ptr_ty_ptr
  %724 = load i64**, i64*** %ptr_cast_expr
  %725 = bitcast i64** %724 to i64*
  %726 = getelementptr inbounds i64, i64* %725, i64 1
  %727 = bitcast i64* %726 to i8**
  %728 = load i8*, i8** %727, align 8
  %729 = bitcast i8* %728 to i64*
  %730 = getelementptr inbounds i64, i64* %729, i64 0
  %731 = bitcast i64* %730 to i8**
  %732 = load i8*, i8** %731, align 8
  %733 = load i64**, i64*** %ptr_ty_ptr
  store i8* %732, i64** %733
  %734 = load i64**, i64*** %ptr_ty_ptr
  %735 = call i64** @type_info_from_ast(i64** %734)
  store i64** %735, i64*** %ptr_cast_ret
  %736 = load i64**, i64*** %ptr_cast_ret
  %737 = load i64*, i64** %736
  %738 = load i64**, i64*** %ptr_ret_ty
  store i64* %737, i64** %738
  br label %when_end_0
when_next_267:
  br label %when_end_0
when_end_0:
  %739 = load i64**, i64*** %ptr_ret_ty
  ret i64** %739
unreachable_268:
  ret i64** null
}

define void @list_push_DiagnosticError(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_ty_info = alloca i64**
  %ptr_t = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_dummy = alloca i64
  %ptr_item = alloca i64*
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_block = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_d = alloca i64**
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_stmt = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_e = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_program = alloca i64**
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_list, i64*** %ptr_list
  store i64* %param_item, i64** %ptr_item
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = load i64**, i64*** %ptr_list
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 0
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = icmp eq i64 %5, %10
  br i1 %11, label %then_0, label %end_if_1
then_0:
  %12 = load i64**, i64*** %ptr_list
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 0
  %15 = bitcast i64* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = mul nsw i64 %16, 2
  store i64 %17, i64* %ptr_new_capacity
  %18 = load i64**, i64*** %ptr_list
  %19 = bitcast i64** %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 0
  %21 = bitcast i64* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %then_2, label %end_if_3
then_2:
  store i64 8, i64* %ptr_new_capacity
  br label %end_if_3
end_if_3:
  %24 = load i64**, i64*** %ptr_list
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 2
  %27 = bitcast i64* %26 to i8**
  %28 = load i8*, i8** %27, align 8
  %29 = load i64, i64* %ptr_new_capacity
  %30 = mul nsw i64 %29, 8
  %31 = call i8* @malloc(i64 %30)
  %32 = bitcast i8* %31 to i64*
  store i64* %32, i64*** %ptr_new_buffer
  br label %while_cond_4
while_cond_4:
  %33 = load i64**, i64*** %ptr_list
  %34 = bitcast i64** %33 to i64*
  %35 = getelementptr inbounds i64, i64* %34, i64 1
  %36 = bitcast i64* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = icmp slt i64 0, %37
  br i1 %38, label %while_body_5, label %while_end_6
while_body_5:
  %39 = load i64**, i64*** %ptr_list
  %40 = bitcast i64** %39 to i64*
  %41 = getelementptr inbounds i64, i64* %40, i64 2
  %42 = bitcast i64* %41 to i8**
  %43 = load i8*, i8** %42, align 8
  %44 = getelementptr inbounds i64, i8* %43, i64 0
  %45 = load i64, i64* %44
  %46 = load i64**, i64*** %ptr_new_buffer
  %47 = getelementptr inbounds i64, i64** %46, i64 0
  store i64 %45, i64* %47
  %48 = add nsw i64 0, 1
  store i64 %48, i64 0
  br label %while_cond_4
while_end_6:
  %49 = load i64**, i64*** %ptr_list
  %50 = bitcast i64** %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 0
  %52 = bitcast i64* %51 to i64*
  %53 = load i64, i64* %52, align 8
  %54 = icmp sgt i64 %53, 0
  br i1 %54, label %then_7, label %end_if_8
then_7:
  %55 = load i64**, i64*** %ptr_list
  %56 = bitcast i64** %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 2
  %58 = bitcast i64* %57 to i8**
  %59 = load i8*, i8** %58, align 8
  %60 = bitcast i8* %59 to i8*
  call void @free(i8* %60)
  br label %end_if_8
end_if_8:
  %61 = load i64**, i64*** %ptr_list
  %62 = load i64**, i64*** %ptr_new_buffer
  %63 = bitcast i64** %61 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 2
  %65 = bitcast i64* %64 to i64***
  store i64** %62, i64*** %65, align 8
  %66 = load i64**, i64*** %ptr_list
  %67 = load i64, i64* %ptr_new_capacity
  %68 = bitcast i64** %66 to i64*
  %69 = getelementptr inbounds i64, i64* %68, i64 0
  %70 = bitcast i64* %69 to i64*
  store i64 %67, i64* %70, align 8
  br label %end_if_1
end_if_1:
  %71 = load i64**, i64*** %ptr_list
  %72 = bitcast i64** %71 to i64*
  %73 = getelementptr inbounds i64, i64* %72, i64 2
  %74 = bitcast i64* %73 to i8**
  %75 = load i8*, i8** %74, align 8
  %76 = load i64**, i64*** %ptr_list
  %77 = bitcast i64** %76 to i64*
  %78 = getelementptr inbounds i64, i64* %77, i64 1
  %79 = bitcast i64* %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = load i64*, i64** %ptr_item
  %82 = getelementptr inbounds i64, i8* %75, i64 %80
  store i64* %81, i64* %82
  %83 = load i64**, i64*** %ptr_list
  %84 = bitcast i64** %83 to i64*
  %85 = getelementptr inbounds i64, i64* %84, i64 1
  %86 = bitcast i64* %85 to i64*
  %87 = load i64, i64* %86, align 8
  %88 = add nsw i64 %87, 1
  %89 = load i64**, i64*** %ptr_list
  %90 = bitcast i64** %89 to i64*
  %91 = getelementptr inbounds i64, i64* %90, i64 1
  %92 = bitcast i64* %91 to i64*
  store i64 %88, i64* %92, align 8
  ret void
}

define i64* @list_get_Spanned_Declaration(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_ty_info = alloca i64**
  %ptr_t = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_dummy = alloca i64
  %ptr_item = alloca i64*
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_index = alloca i64
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_block = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_d = alloca i64**
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_stmt = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_e = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_program = alloca i64**
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_list, i64*** %ptr_list
  store i64 %param_index, i64* %ptr_index
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 2
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = load i64, i64* %ptr_index
  %7 = getelementptr inbounds i64, i8* %5, i64 %6
  %8 = load i64, i64* %7
  ret i64 %8
unreachable_0:
  ret i64* null
}

define i64* @list_get_Param(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_ty_info = alloca i64**
  %ptr_t = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_dummy = alloca i64
  %ptr_item = alloca i64*
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_index = alloca i64
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_block = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_d = alloca i64**
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_stmt = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_e = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_program = alloca i64**
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_list, i64*** %ptr_list
  store i64 %param_index, i64* %ptr_index
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 2
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = load i64, i64* %ptr_index
  %7 = getelementptr inbounds i64, i8* %5, i64 %6
  %8 = load i64, i64* %7
  ret i64 %8
unreachable_0:
  ret i64* null
}

define i64* @list_get_Spanned_Statement(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_ty_info = alloca i64**
  %ptr_t = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_dummy = alloca i64
  %ptr_item = alloca i64*
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_index = alloca i64
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_block = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_d = alloca i64**
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_stmt = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_e = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_program = alloca i64**
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_list, i64*** %ptr_list
  store i64 %param_index, i64* %ptr_index
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 2
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = load i64, i64* %ptr_index
  %7 = getelementptr inbounds i64, i8* %5, i64 %6
  %8 = load i64, i64* %7
  ret i64 %8
unreachable_0:
  ret i64* null
}

define i64* @list_get_Spanned_Expression(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_ty_info = alloca i64**
  %ptr_t = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_dummy = alloca i64
  %ptr_item = alloca i64*
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_index = alloca i64
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_block = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_d = alloca i64**
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_stmt = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_e = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_program = alloca i64**
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_list, i64*** %ptr_list
  store i64 %param_index, i64* %ptr_index
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 2
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = load i64, i64* %ptr_index
  %7 = getelementptr inbounds i64, i8* %5, i64 %6
  %8 = load i64, i64* %7
  ret i64 %8
unreachable_0:
  ret i64* null
}

define i64* @list_get_WhenCase(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_decl = alloca i64*
  %ptr_analyzer = alloca i64**
  %ptr_ret_span = alloca i64**
  %ptr_right_ty = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_value = alloca i8*
  %ptr_sym_opt = alloca i64**
  %ptr_el = alloca i64*
  %ptr_else_br = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_ty_info = alloca i64**
  %ptr_t = alloca i64**
  %ptr_sb = alloca i64
  %ptr_decl_list = alloca i64**
  %ptr_sa = alloca i64
  %ptr_ty_ptr = alloca i64**
  %ptr_new_scope = alloca i64**
  %ptr_u = alloca i64**
  %ptr_de = alloca i64**
  %ptr_new_entry = alloca i64**
  %ptr_cur_scope = alloca i64**
  %ptr_searching_entries = alloca i1
  %ptr_dummy = alloca i64
  %ptr_item = alloca i64*
  %ptr_name = alloca i8*
  %ptr_cast_expr = alloca i64**
  %ptr_index = alloca i64
  %ptr_val = alloca i1
  %ptr_len_opt = alloca i64
  %ptr_callee_name = alloca i8*
  %ptr_new_capacity = alloca i64
  %ptr_s = alloca i64**
  %ptr_block = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_el_ptr = alloca i64**
  %ptr_sym = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_inner_str = alloca i8*
  %ptr_target_ty = alloca i64**
  %ptr_f = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_inner_ty = alloca i64**
  %ptr_source = alloca i8*
  %ptr_b = alloca i64**
  %ptr_span = alloca i64**
  %ptr_ty = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_operand_ty = alloca i64**
  %ptr_case_item = alloca i64*
  %ptr_block_ptr = alloca i64**
  %ptr_env = alloca i64**
  %ptr_pr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_v = alloca i64**
  %ptr_left_ty = alloca i64**
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_d = alloca i64**
  %ptr_obj_ty = alloca i64**
  %ptr_ty_span = alloca i64**
  %ptr_array_info = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_next_scope = alloca i64**
  %ptr_a_info = alloca i64**
  %ptr_cast_ret = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_t_ptr = alloca i64**
  %ptr_cur = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_alloc_ptr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_info = alloca i64**
  %ptr_next_entry = alloca i64**
  %ptr_cur_entry = alloca i64**
  %ptr_message = alloca i8*
  %ptr_stmt = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_err = alloca i64**
  %ptr_p = alloca i64**
  %ptr_al = alloca i64**
  %ptr_v_expr = alloca i64**
  %ptr_e = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_wh = alloca i64**
  %ptr_ptr = alloca i64**
  %ptr_size_a = alloca i64
  %ptr_op = alloca i64*
  %ptr_program = alloca i64**
  %ptr_c = alloca i64**
  %ptr_size_b = alloca i64
  %ptr_arg = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_ret_ty = alloca i64**
  %ptr_searching = alloca i1
  store i64** %param_list, i64*** %ptr_list
  store i64 %param_index, i64* %ptr_index
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 2
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = load i64, i64* %ptr_index
  %7 = getelementptr inbounds i64, i8* %5, i64 %6
  %8 = load i64, i64* %7
  ret i64 %8
unreachable_0:
  ret i64* null
}

