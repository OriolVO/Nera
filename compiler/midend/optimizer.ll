; ModuleID = 'nera_program'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

declare i8* @malloc(i64)
declare void @free(i8*)
declare i8* @strncpy(i8*, i8*, i64)
declare i32 @strcmp(i8*, i8*)
declare i64 @strlen(i64**)
declare i8* @int_to_string(i64**)
declare i8* @concat_strings(i64**, i64**)
declare void @print_int(i8*)
declare void @print_float(i8*)
declare i64 @puts(i8*)
declare i8** @alloc_array_String(i64, i64**)
declare i8* @ptr_read_String(i64**, i64)
declare void @ptr_write_String(i64**, i64, i64**)
declare void @free_array_String(i64**)
declare i64* @ptr_read_SoAArray(i64**, i64)
declare i64** @alloc_array_SoAArray(i64, i64**)
declare void @ptr_write_SoAArray(i64**, i64, i64**)
declare void @free_array_SoAArray(i64**)
declare i64* @ptr_read_IRInstruction(i64**, i64)
declare i64* @ptr_read_FlatVectorApplyOp(i64**, i64)
declare i64* @ptr_read_BasicBlock(i64**, i64)
declare i64* @ptr_read_IROperand(i64**, i64)
declare i64* @alloc_array_Int(i64, i64**)
declare i64** @alloc_array_IntListPtr(i64, i64**)
declare i64** @alloc_array_StringSetPtr(i64, i64**)
declare i64 @ptr_read_Int(i64**, i64)
declare void @ptr_write_Int(i64**, i64, i64**)
declare void @free_array_Int(i64**)
declare void @ptr_write_IntListPtr(i64**, i64, i64**)
declare void @ptr_write_StringSetPtr(i64**, i64, i64**)
declare i64* @ptr_read_IntListPtr(i64**, i64)
declare i64* @ptr_read_StringSetPtr(i64**, i64)
declare i64** @alloc_array_IRInstruction(i64, i64**)
declare void @ptr_write_IRInstruction(i64**, i64, i64**)
declare void @free_array_IRInstruction(i64**)
declare void @ptr_write_BasicBlock(i64**, i64, i64**)
declare i64* @ptr_read_IRFunction(i64**, i64)
declare i64** @alloc_array_IRFunction(i64, i64**)
declare void @ptr_write_IRFunction(i64**, i64, i64**)
declare void @free_array_IRFunction(i64**)

@.str.0 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"%t\00", align 1
@.str.11 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.12 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.13 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.14 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.15 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.16 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.17 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.18 = private unnamed_addr constant [1 x i8] c"\00", align 1

define i1 @string_eq(i64** noalias %param_s1, i64** noalias %param_s2) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_val = alloca i64**
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_s1, i64*** %ptr_s1
  store i64** %param_s2, i64*** %ptr_s2
  %1 = load i64**, i64*** %ptr_s1
  %2 = load i64**, i64*** %ptr_s2
  %3 = call i32 @strcmp(i64** %1, i64** %2)
  %4 = icmp eq i32 %3, 0
  ret i1 %4
unreachable_0:
  ret i1 0
}

define i64** @new_string_set() {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_val = alloca i64**
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  %1 = call i8* @malloc(i64 8)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_set
  %3 = call i8* @malloc(i64 8)
  %4 = bitcast i8* %3 to i64*
  store i64* %4, i8*** %ptr_dummy_str
  %5 = load i8**, i8*** %ptr_dummy_str
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.0, i64 0, i64 0), i8** %5
  %6 = load i8**, i8*** %ptr_dummy_str
  %7 = call i64** @new_list_String(i64 10, i8** %6)
  %8 = load i8**, i8*** %ptr_dummy_str
  %9 = call i64** @new_list_String(i64 10, i8** %8)
  %10 = load i64**, i64*** %ptr_set
  %11 = bitcast i64** %10 to i64*
  %12 = getelementptr inbounds i64, i64* %11, i64 0
  %13 = bitcast i64* %12 to i64***
  store i64** %9, i64*** %13, align 8
  %14 = load i64**, i64*** %ptr_set
  ret i64** %14
unreachable_0:
  ret i64** null
}

define void @string_set_add(i64** noalias %param_set, i64** noalias %param_val) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_val = alloca i64**
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_set, i64*** %ptr_set
  store i64** %param_val, i64*** %ptr_val
  store i1 0, i1* %ptr_exists
  store i64 0, i64* %ptr_i
  br label %while_cond_0
while_cond_0:
  %1 = load i64**, i64*** %ptr_set
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = load i64, i64* %ptr_i
  %11 = icmp slt i64 %10, %9
  br i1 %11, label %while_body_1, label %while_end_2
while_body_1:
  %12 = load i64**, i64*** %ptr_set
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 0
  %15 = bitcast i64* %14 to i8**
  %16 = load i8*, i8** %15, align 8
  %17 = load i64, i64* %ptr_i
  %18 = call i8* @list_get_String(i8* %16, i64 %17)
  store i8* %18, i64** %ptr_item
  %19 = load i64*, i64** %ptr_item
  %20 = load i64**, i64*** %ptr_val
  %21 = call i1 @string_eq(i64* %19, i64** %20)
  br i1 %21, label %then_3, label %else_5
then_3:
  store i1 1, i1* %ptr_exists
  %22 = load i64**, i64*** %ptr_set
  %23 = bitcast i64** %22 to i64*
  %24 = getelementptr inbounds i64, i64* %23, i64 0
  %25 = bitcast i64* %24 to i8**
  %26 = load i8*, i8** %25, align 8
  %27 = bitcast i8* %26 to i64*
  %28 = getelementptr inbounds i64, i64* %27, i64 1
  %29 = bitcast i64* %28 to i64*
  %30 = load i64, i64* %29, align 8
  store i64 %30, i64* %ptr_i
  br label %end_if_4
else_5:
  %31 = load i64, i64* %ptr_i
  %32 = add nsw i64 %31, 1
  store i64 %32, i64* %ptr_i
  br label %end_if_4
end_if_4:
  br label %while_cond_0
while_end_2:
  %33 = load i1, i1* %ptr_exists
  %34 = xor i1 %33, 1
  br i1 %34, label %then_6, label %end_if_7
then_6:
  %35 = load i64**, i64*** %ptr_set
  %36 = bitcast i64** %35 to i64*
  %37 = getelementptr inbounds i64, i64* %36, i64 0
  %38 = bitcast i64* %37 to i8**
  %39 = load i8*, i8** %38, align 8
  %40 = load i64**, i64*** %ptr_val
  call void @list_push_String(i8* %39, i64** %40)
  br label %end_if_7
end_if_7:
  ret void
}

define i1 @string_set_contains(i64** noalias %param_set, i64** noalias %param_val) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_val = alloca i64**
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_set, i64*** %ptr_set
  store i64** %param_val, i64*** %ptr_val
  store i64 0, i64* %ptr_i
  br label %while_cond_0
while_cond_0:
  %1 = load i64**, i64*** %ptr_set
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = load i64, i64* %ptr_i
  %11 = icmp slt i64 %10, %9
  br i1 %11, label %while_body_1, label %while_end_2
while_body_1:
  %12 = load i64**, i64*** %ptr_set
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 0
  %15 = bitcast i64* %14 to i8**
  %16 = load i8*, i8** %15, align 8
  %17 = load i64, i64* %ptr_i
  %18 = call i8* @list_get_String(i8* %16, i64 %17)
  store i8* %18, i64** %ptr_item
  %19 = load i64*, i64** %ptr_item
  %20 = load i64**, i64*** %ptr_val
  %21 = call i1 @string_eq(i64* %19, i64** %20)
  br i1 %21, label %then_3, label %end_if_4
then_3:
  ret i1 1
unreachable_5:
  br label %end_if_4
end_if_4:
  %22 = load i64, i64* %ptr_i
  %23 = add nsw i64 %22, 1
  store i64 %23, i64* %ptr_i
  br label %while_cond_0
while_end_2:
  ret i1 0
unreachable_6:
  ret i1 0
}

define void @string_set_remove(i64** noalias %param_set, i64** noalias %param_val) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_val = alloca i64**
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_set, i64*** %ptr_set
  store i64** %param_val, i64*** %ptr_val
  %1 = call i8* @malloc(i64 8)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i8*** %ptr_dummy_str
  %3 = load i8**, i8*** %ptr_dummy_str
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0), i8** %3
  %4 = load i8**, i8*** %ptr_dummy_str
  %5 = call i64** @new_list_String(i64 10, i8** %4)
  store i64** %5, i64*** %ptr_temp_list
  store i64 0, i64* %ptr_i
  br label %while_cond_0
while_cond_0:
  %6 = load i64**, i64*** %ptr_set
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 0
  %9 = bitcast i64* %8 to i8**
  %10 = load i8*, i8** %9, align 8
  %11 = bitcast i8* %10 to i64*
  %12 = getelementptr inbounds i64, i64* %11, i64 1
  %13 = bitcast i64* %12 to i64*
  %14 = load i64, i64* %13, align 8
  %15 = load i64, i64* %ptr_i
  %16 = icmp slt i64 %15, %14
  br i1 %16, label %while_body_1, label %while_end_2
while_body_1:
  %17 = load i64**, i64*** %ptr_set
  %18 = bitcast i64** %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = load i64, i64* %ptr_i
  %23 = call i8* @list_get_String(i8* %21, i64 %22)
  store i8* %23, i64** %ptr_item
  %24 = load i64*, i64** %ptr_item
  %25 = load i64**, i64*** %ptr_val
  %26 = call i1 @string_eq(i64* %24, i64** %25)
  %27 = xor i1 %26, 1
  br i1 %27, label %then_3, label %end_if_4
then_3:
  %28 = load i64**, i64*** %ptr_temp_list
  %29 = load i64*, i64** %ptr_item
  call void @list_push_String(i64** %28, i64* %29)
  br label %end_if_4
end_if_4:
  %30 = load i64, i64* %ptr_i
  %31 = add nsw i64 %30, 1
  store i64 %31, i64* %ptr_i
  br label %while_cond_0
while_end_2:
  %32 = load i64**, i64*** %ptr_set
  %33 = load i64**, i64*** %ptr_temp_list
  %34 = bitcast i64** %32 to i64*
  %35 = getelementptr inbounds i64, i64* %34, i64 0
  %36 = bitcast i64* %35 to i64***
  store i64** %33, i64*** %36, align 8
  ret void
}

define i1 @string_set_equals(i64** noalias %param_s1, i64** noalias %param_s2) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_val = alloca i64**
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_s1, i64*** %ptr_s1
  store i64** %param_s2, i64*** %ptr_s2
  %1 = load i64**, i64*** %ptr_s1
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = load i64**, i64*** %ptr_s2
  %11 = bitcast i64** %10 to i64*
  %12 = getelementptr inbounds i64, i64* %11, i64 0
  %13 = bitcast i64* %12 to i8**
  %14 = load i8*, i8** %13, align 8
  %15 = bitcast i8* %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 1
  %17 = bitcast i64* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = icmp ne i64 %9, %18
  br i1 %19, label %then_0, label %end_if_1
then_0:
  ret i1 0
unreachable_2:
  br label %end_if_1
end_if_1:
  store i64 0, i64* %ptr_i
  br label %while_cond_3
while_cond_3:
  %20 = load i64**, i64*** %ptr_s1
  %21 = bitcast i64** %20 to i64*
  %22 = getelementptr inbounds i64, i64* %21, i64 0
  %23 = bitcast i64* %22 to i8**
  %24 = load i8*, i8** %23, align 8
  %25 = bitcast i8* %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 1
  %27 = bitcast i64* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = load i64, i64* %ptr_i
  %30 = icmp slt i64 %29, %28
  br i1 %30, label %while_body_4, label %while_end_5
while_body_4:
  %31 = load i64**, i64*** %ptr_s1
  %32 = bitcast i64** %31 to i64*
  %33 = getelementptr inbounds i64, i64* %32, i64 0
  %34 = bitcast i64* %33 to i8**
  %35 = load i8*, i8** %34, align 8
  %36 = load i64, i64* %ptr_i
  %37 = call i8* @list_get_String(i8* %35, i64 %36)
  store i8* %37, i64*** %ptr_val
  %38 = load i64**, i64*** %ptr_s2
  %39 = load i64**, i64*** %ptr_val
  %40 = call i1 @string_set_contains(i64** %38, i64** %39)
  %41 = xor i1 %40, 1
  br i1 %41, label %then_6, label %end_if_7
then_6:
  ret i1 0
unreachable_8:
  br label %end_if_7
end_if_7:
  %42 = load i64, i64* %ptr_i
  %43 = add nsw i64 %42, 1
  store i64 %43, i64* %ptr_i
  br label %while_cond_3
while_end_5:
  ret i1 1
unreachable_9:
  ret i1 0
}

define i64** @string_set_copy(i64** noalias %param_src) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_val = alloca i64**
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_src, i64*** %ptr_src
  %1 = call i64** @new_string_set()
  store i64** %1, i64*** %ptr_dst
  store i64 0, i64* %ptr_i
  br label %while_cond_0
while_cond_0:
  %2 = load i64**, i64*** %ptr_src
  %3 = bitcast i64** %2 to i64*
  %4 = getelementptr inbounds i64, i64* %3, i64 0
  %5 = bitcast i64* %4 to i8**
  %6 = load i8*, i8** %5, align 8
  %7 = bitcast i8* %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 1
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = load i64, i64* %ptr_i
  %12 = icmp slt i64 %11, %10
  br i1 %12, label %while_body_1, label %while_end_2
while_body_1:
  %13 = load i64**, i64*** %ptr_src
  %14 = bitcast i64** %13 to i64*
  %15 = getelementptr inbounds i64, i64* %14, i64 0
  %16 = bitcast i64* %15 to i8**
  %17 = load i8*, i8** %16, align 8
  %18 = load i64, i64* %ptr_i
  %19 = call i8* @list_get_String(i8* %17, i64 %18)
  store i8* %19, i64*** %ptr_val
  %20 = load i64**, i64*** %ptr_dst
  %21 = bitcast i64** %20 to i64*
  %22 = getelementptr inbounds i64, i64* %21, i64 0
  %23 = bitcast i64* %22 to i8**
  %24 = load i8*, i8** %23, align 8
  %25 = load i64**, i64*** %ptr_val
  call void @list_push_String(i8* %24, i64** %25)
  %26 = load i64, i64* %ptr_i
  %27 = add nsw i64 %26, 1
  store i64 %27, i64* %ptr_i
  br label %while_cond_0
while_end_2:
  %28 = load i64**, i64*** %ptr_dst
  ret i64** %28
unreachable_3:
  ret i64** null
}

define void @print_string(i8* noalias %param_value) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i8* %param_value, i8** %ptr_value
  %1 = load i8*, i8** %ptr_value
  %2 = call i64 @puts(i8* %1)
  ret void
}

define i64** @alloc_span(i64 %start_line, i64 %start_col, i64 %end_line, i64 %end_col) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
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

define i64** @merge_span(i8* noalias %param_a, i1 %param_b) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i8* %param_a, i8** %ptr_a
  store i1 %param_b, i1* %ptr_b
  %1 = load i8*, i8** %ptr_a
  %2 = bitcast i8* %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  store i64 %5, i64* %ptr_start_line
  %6 = load i1, i1* %ptr_b
  %7 = bitcast i1 %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 0
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = load i8*, i8** %ptr_a
  %12 = bitcast i8* %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i64*
  %15 = load i64, i64* %14, align 8
  %16 = icmp slt i64 %10, %15
  br i1 %16, label %then_0, label %end_if_1
then_0:
  %17 = load i1, i1* %ptr_b
  %18 = bitcast i1 %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  %20 = bitcast i64* %19 to i64*
  %21 = load i64, i64* %20, align 8
  store i64 %21, i64* %ptr_start_line
  br label %end_if_1
end_if_1:
  %22 = load i8*, i8** %ptr_a
  %23 = bitcast i8* %22 to i64*
  %24 = getelementptr inbounds i64, i64* %23, i64 1
  %25 = bitcast i64* %24 to i64*
  %26 = load i64, i64* %25, align 8
  store i64 %26, i64* %ptr_start_col
  %27 = load i8*, i8** %ptr_a
  %28 = bitcast i8* %27 to i64*
  %29 = getelementptr inbounds i64, i64* %28, i64 0
  %30 = bitcast i64* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = load i1, i1* %ptr_b
  %33 = bitcast i1 %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 0
  %35 = bitcast i64* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = icmp eq i64 %31, %36
  br i1 %37, label %then_2, label %end_if_3
then_2:
  %38 = load i1, i1* %ptr_b
  %39 = bitcast i1 %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 1
  %41 = bitcast i64* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = load i8*, i8** %ptr_a
  %44 = bitcast i8* %43 to i64*
  %45 = getelementptr inbounds i64, i64* %44, i64 1
  %46 = bitcast i64* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = icmp slt i64 %42, %47
  br i1 %48, label %then_4, label %end_if_5
then_4:
  %49 = load i1, i1* %ptr_b
  %50 = bitcast i1 %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 1
  %52 = bitcast i64* %51 to i64*
  %53 = load i64, i64* %52, align 8
  store i64 %53, i64* %ptr_start_col
  br label %end_if_5
end_if_5:
  br label %end_if_3
end_if_3:
  %54 = load i1, i1* %ptr_b
  %55 = bitcast i1 %54 to i64*
  %56 = getelementptr inbounds i64, i64* %55, i64 0
  %57 = bitcast i64* %56 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = load i8*, i8** %ptr_a
  %60 = bitcast i8* %59 to i64*
  %61 = getelementptr inbounds i64, i64* %60, i64 0
  %62 = bitcast i64* %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = icmp slt i64 %58, %63
  br i1 %64, label %then_6, label %end_if_7
then_6:
  %65 = load i1, i1* %ptr_b
  %66 = bitcast i1 %65 to i64*
  %67 = getelementptr inbounds i64, i64* %66, i64 1
  %68 = bitcast i64* %67 to i64*
  %69 = load i64, i64* %68, align 8
  store i64 %69, i64* %ptr_start_col
  br label %end_if_7
end_if_7:
  %70 = load i8*, i8** %ptr_a
  %71 = bitcast i8* %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i64*
  %74 = load i64, i64* %73, align 8
  store i64 %74, i64* %ptr_end_line
  %75 = load i1, i1* %ptr_b
  %76 = bitcast i1 %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 2
  %78 = bitcast i64* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = load i8*, i8** %ptr_a
  %81 = bitcast i8* %80 to i64*
  %82 = getelementptr inbounds i64, i64* %81, i64 2
  %83 = bitcast i64* %82 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = icmp sgt i64 %79, %84
  br i1 %85, label %then_8, label %end_if_9
then_8:
  %86 = load i1, i1* %ptr_b
  %87 = bitcast i1 %86 to i64*
  %88 = getelementptr inbounds i64, i64* %87, i64 2
  %89 = bitcast i64* %88 to i64*
  %90 = load i64, i64* %89, align 8
  store i64 %90, i64* %ptr_end_line
  br label %end_if_9
end_if_9:
  %91 = load i8*, i8** %ptr_a
  %92 = bitcast i8* %91 to i64*
  %93 = getelementptr inbounds i64, i64* %92, i64 3
  %94 = bitcast i64* %93 to i64*
  %95 = load i64, i64* %94, align 8
  store i64 %95, i64* %ptr_end_col
  %96 = load i8*, i8** %ptr_a
  %97 = bitcast i8* %96 to i64*
  %98 = getelementptr inbounds i64, i64* %97, i64 2
  %99 = bitcast i64* %98 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = load i1, i1* %ptr_b
  %102 = bitcast i1 %101 to i64*
  %103 = getelementptr inbounds i64, i64* %102, i64 2
  %104 = bitcast i64* %103 to i64*
  %105 = load i64, i64* %104, align 8
  %106 = icmp eq i64 %100, %105
  br i1 %106, label %then_10, label %end_if_11
then_10:
  %107 = load i1, i1* %ptr_b
  %108 = bitcast i1 %107 to i64*
  %109 = getelementptr inbounds i64, i64* %108, i64 3
  %110 = bitcast i64* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = load i8*, i8** %ptr_a
  %113 = bitcast i8* %112 to i64*
  %114 = getelementptr inbounds i64, i64* %113, i64 3
  %115 = bitcast i64* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = icmp sgt i64 %111, %116
  br i1 %117, label %then_12, label %end_if_13
then_12:
  %118 = load i1, i1* %ptr_b
  %119 = bitcast i1 %118 to i64*
  %120 = getelementptr inbounds i64, i64* %119, i64 3
  %121 = bitcast i64* %120 to i64*
  %122 = load i64, i64* %121, align 8
  store i64 %122, i64* %ptr_end_col
  br label %end_if_13
end_if_13:
  br label %end_if_11
end_if_11:
  %123 = load i1, i1* %ptr_b
  %124 = bitcast i1 %123 to i64*
  %125 = getelementptr inbounds i64, i64* %124, i64 2
  %126 = bitcast i64* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = load i8*, i8** %ptr_a
  %129 = bitcast i8* %128 to i64*
  %130 = getelementptr inbounds i64, i64* %129, i64 2
  %131 = bitcast i64* %130 to i64*
  %132 = load i64, i64* %131, align 8
  %133 = icmp sgt i64 %127, %132
  br i1 %133, label %then_14, label %end_if_15
then_14:
  %134 = load i1, i1* %ptr_b
  %135 = bitcast i1 %134 to i64*
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
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
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
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i8* %param_source, i8** %ptr_source
  store i64** %param_span, i64*** %ptr_span
  store i8* %param_message, i8** %ptr_message
  %1 = load i8*, i8** %ptr_message
  %2 = call i64 @puts(i8* %1)
  ret void
}

define i64** @ir_optimizer_new() {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  %1 = call i8* @malloc(i64 8)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_opt
  %3 = load i64**, i64*** %ptr_opt
  %4 = bitcast i64** %3 to i64*
  %5 = getelementptr inbounds i64, i64* %4, i64 0
  %6 = bitcast i64* %5 to i64*
  store i64 0, i64* %6, align 8
  %7 = load i64**, i64*** %ptr_opt
  ret i64** %7
unreachable_0:
  ret i64** null
}

define void @add_soa(i64** noalias %param_list, i8* noalias %param_name, i64 %param_size) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_list, i64*** %ptr_list
  store i8* %param_name, i8** %ptr_name
  store i64 %param_size, i64* %ptr_size
  store i1 0, i1* %ptr_exists
  store i64 0, i64* %ptr_i
  br label %while_cond_0
while_cond_0:
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = load i64, i64* %ptr_i
  %7 = icmp slt i64 %6, %5
  br i1 %7, label %while_body_1, label %while_end_2
while_body_1:
  %8 = load i64**, i64*** %ptr_list
  %9 = load i64, i64* %ptr_i
  %10 = call i64* @list_get_SoAArray(i64** %8, i64 %9)
  store i64* %10, i64** %ptr_item
  %11 = load i64*, i64** %ptr_item
  %12 = bitcast i64* %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = load i8*, i8** %ptr_name
  %17 = call i1 @string_eq(i8* %15, i8* %16)
  br i1 %17, label %then_3, label %end_if_4
then_3:
  store i1 1, i1* %ptr_exists
  br label %end_if_4
end_if_4:
  %18 = load i64, i64* %ptr_i
  %19 = add nsw i64 %18, 1
  store i64 %19, i64* %ptr_i
  br label %while_cond_0
while_end_2:
  %20 = load i1, i1* %ptr_exists
  %21 = xor i1 %20, 1
  br i1 %21, label %then_5, label %end_if_6
then_5:
  %22 = call i8* @malloc(i64 16)
  %23 = bitcast i8* %22 to i64*
  store i64* %23, i64*** %ptr_new_soa
  %24 = load i64**, i64*** %ptr_new_soa
  %25 = load i8*, i8** %ptr_name
  %26 = bitcast i64** %24 to i64*
  %27 = getelementptr inbounds i64, i64* %26, i64 0
  %28 = bitcast i64* %27 to i8**
  store i8* %25, i8** %28, align 8
  %29 = load i64**, i64*** %ptr_new_soa
  %30 = load i64, i64* %ptr_size
  %31 = bitcast i64** %29 to i64*
  %32 = getelementptr inbounds i64, i64* %31, i64 1
  %33 = bitcast i64* %32 to i64*
  store i64 %30, i64* %33, align 8
  %34 = load i64**, i64*** %ptr_new_soa
  %35 = load i64*, i64** %34
  %36 = load i64**, i64*** %ptr_list
  call void @list_push_SoAArray(i64** %36, i64* %35)
  br label %end_if_6
end_if_6:
  ret void
}

define i64** @optimizer_run_soa_pass_globals(i64** noalias %param_opt, i64** noalias %param_instrs) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_opt, i64*** %ptr_opt
  store i64** %param_instrs, i64*** %ptr_instrs
  %1 = call i8* @malloc(i64 16)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_dummy_soa
  %3 = load i64**, i64*** %ptr_dummy_soa
  %4 = call i64** @new_list_SoAArray(i64 10, i64** %3)
  store i64** %4, i64*** %ptr_soa_list
  store i64 0, i64* %ptr_i
  br label %while_cond_0
while_cond_0:
  %5 = load i64**, i64*** %ptr_instrs
  %6 = bitcast i64** %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = load i64, i64* %ptr_i
  %11 = icmp slt i64 %10, %9
  br i1 %11, label %while_body_1, label %while_end_2
while_body_1:
  %12 = load i64**, i64*** %ptr_instrs
  %13 = load i64, i64* %ptr_i
  %14 = call i64* @list_get_IRInstruction(i64** %12, i64 %13)
  store i64* %14, i64** %ptr_instr
  %15 = load i64*, i64** %ptr_instr
  %16 = getelementptr inbounds i64, i64* %15, i64 0
  %17 = bitcast i64* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = icmp eq i64 %18, 6
  br i1 %19, label %when_case_4, label %when_next_5
when_case_4:
  %20 = load i64*, i64** %ptr_instr
  %21 = getelementptr inbounds i64, i64* %20, i64 1
  %22 = bitcast i64* %21 to i8**
  %23 = load i8*, i8** %22, align 8
  %24 = load i64*, i64** %ptr_instr
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i64***
  %27 = load i64**, i64*** %26, align 8
  %28 = load i64*, i64** %ptr_instr
  %29 = getelementptr inbounds i64, i64* %28, i64 5
  %30 = bitcast i64* %29 to i64*
  %31 = load i64, i64* %30, align 8
  store i64 %31, i64* %ptr_size
  store i64 0, i64* %ptr_j
  br label %while_cond_6
while_cond_6:
  %32 = bitcast i64** %27 to i64*
  %33 = getelementptr inbounds i64, i64* %32, i64 1
  %34 = bitcast i64* %33 to i64*
  %35 = load i64, i64* %34, align 8
  %36 = load i64, i64* %ptr_j
  %37 = icmp slt i64 %36, %35
  br i1 %37, label %while_body_7, label %while_end_8
while_body_7:
  %38 = load i64, i64* %ptr_j
  %39 = call i64* @list_get_FlatVectorApplyOp(i64** %27, i64 %38)
  store i64* %39, i64*** %ptr_op
  %40 = load i64**, i64*** %ptr_op
  %41 = bitcast i64** %40 to i64*
  %42 = getelementptr inbounds i64, i64* %41, i64 0
  %43 = bitcast i64* %42 to i8**
  %44 = load i8*, i8** %43, align 8
  %45 = call i8* @concat_strings(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0), i8* %44)
  %46 = call i8* @concat_strings(i8* %23, i8* %45)
  store i8* %46, i8** %ptr_full_name
  %47 = load i64**, i64*** %ptr_soa_list
  %48 = load i8*, i8** %ptr_full_name
  %49 = load i64, i64* %ptr_size
  call void @add_soa(i64** %47, i8* %48, i64 %49)
  %50 = load i64**, i64*** %ptr_op
  %51 = bitcast i64** %50 to i64*
  %52 = getelementptr inbounds i64, i64* %51, i64 2
  %53 = bitcast i64* %52 to i8**
  %54 = load i8*, i8** %53, align 8
  %55 = getelementptr inbounds i64, i8* %54, i64 0
  %56 = bitcast i64* %55 to i64*
  %57 = load i64, i64* %56, align 8
  %58 = icmp eq i64 %57, 1
  br i1 %58, label %when_case_10, label %when_next_11
when_case_10:
  %59 = getelementptr inbounds i64, i8* %54, i64 1
  %60 = bitcast i64* %59 to i8**
  %61 = load i8*, i8** %60, align 8
  %62 = getelementptr inbounds i64, i8* %54, i64 2
  %63 = bitcast i64* %62 to i8**
  %64 = load i8*, i8** %63, align 8
  %65 = call i8* @concat_strings(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0), i8* %64)
  %66 = call i8* @concat_strings(i8* %61, i8* %65)
  store i8* %66, i8** %ptr_rhs_full
  %67 = load i64**, i64*** %ptr_soa_list
  %68 = load i8*, i8** %ptr_rhs_full
  %69 = load i64, i64* %ptr_size
  call void @add_soa(i64** %67, i8* %68, i64 %69)
  br label %when_end_9
when_next_11:
  %70 = icmp eq i64 %57, 0
  br i1 %70, label %when_case_12, label %when_next_13
when_case_12:
  br label %when_end_9
when_next_13:
  br label %when_end_9
when_end_9:
  %71 = load i64, i64* %ptr_j
  %72 = add nsw i64 %71, 1
  store i64 %72, i64* %ptr_j
  br label %while_cond_6
while_end_8:
  br label %when_end_3
when_next_5:
  %73 = icmp eq i64 %18, 16
  br i1 %73, label %when_case_14, label %when_next_15
when_case_14:
  %74 = load i64*, i64** %ptr_instr
  %75 = getelementptr inbounds i64, i64* %74, i64 2
  %76 = bitcast i64* %75 to i8**
  %77 = load i8*, i8** %76, align 8
  %78 = load i64*, i64** %ptr_instr
  %79 = getelementptr inbounds i64, i64* %78, i64 3
  %80 = bitcast i64* %79 to i8**
  %81 = load i8*, i8** %80, align 8
  %82 = load i64*, i64** %ptr_instr
  %83 = getelementptr inbounds i64, i64* %82, i64 5
  %84 = bitcast i64* %83 to i64*
  %85 = load i64, i64* %84, align 8
  store i64 %85, i64* %ptr_size
  %86 = call i8* @concat_strings(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0), i8* %81)
  %87 = call i8* @concat_strings(i8* %77, i8* %86)
  store i8* %87, i8** %ptr_full_name
  %88 = load i64**, i64*** %ptr_soa_list
  %89 = load i8*, i8** %ptr_full_name
  %90 = load i64, i64* %ptr_size
  call void @add_soa(i64** %88, i8* %89, i64 %90)
  br label %when_end_3
when_next_15:
  %91 = icmp eq i64 %18, 17
  br i1 %91, label %when_case_16, label %when_next_17
when_case_16:
  %92 = load i64*, i64** %ptr_instr
  %93 = getelementptr inbounds i64, i64* %92, i64 1
  %94 = bitcast i64* %93 to i8**
  %95 = load i8*, i8** %94, align 8
  store i8* %95, i8* %77
  %96 = load i64*, i64** %ptr_instr
  %97 = getelementptr inbounds i64, i64* %96, i64 2
  %98 = bitcast i64* %97 to i8**
  %99 = load i8*, i8** %98, align 8
  store i8* %99, i8* %81
  %100 = load i64*, i64** %ptr_instr
  %101 = getelementptr inbounds i64, i64* %100, i64 5
  %102 = bitcast i64* %101 to i64*
  %103 = load i64, i64* %102, align 8
  store i64 %103, i64* %ptr_size
  %104 = call i8* @concat_strings(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0), i8* %81)
  %105 = call i8* @concat_strings(i8* %77, i8* %104)
  store i8* %105, i8** %ptr_full_name
  %106 = load i64**, i64*** %ptr_soa_list
  %107 = load i8*, i8** %ptr_full_name
  %108 = load i64, i64* %ptr_size
  call void @add_soa(i64** %106, i8* %107, i64 %108)
  br label %when_end_3
when_next_17:
  %109 = icmp eq i64 %18, 0
  br i1 %109, label %when_case_18, label %when_next_19
when_case_18:
  br label %when_end_3
when_next_19:
  %110 = icmp eq i64 %18, 1
  br i1 %110, label %when_case_20, label %when_next_21
when_case_20:
  br label %when_end_3
when_next_21:
  %111 = icmp eq i64 %18, 2
  br i1 %111, label %when_case_22, label %when_next_23
when_case_22:
  br label %when_end_3
when_next_23:
  %112 = icmp eq i64 %18, 3
  br i1 %112, label %when_case_24, label %when_next_25
when_case_24:
  br label %when_end_3
when_next_25:
  %113 = icmp eq i64 %18, 4
  br i1 %113, label %when_case_26, label %when_next_27
when_case_26:
  br label %when_end_3
when_next_27:
  %114 = icmp eq i64 %18, 3
  br i1 %114, label %when_case_28, label %when_next_29
when_case_28:
  br label %when_end_3
when_next_29:
  %115 = icmp eq i64 %18, 7
  br i1 %115, label %when_case_30, label %when_next_31
when_case_30:
  br label %when_end_3
when_next_31:
  %116 = icmp eq i64 %18, 8
  br i1 %116, label %when_case_32, label %when_next_33
when_case_32:
  br label %when_end_3
when_next_33:
  %117 = icmp eq i64 %18, 9
  br i1 %117, label %when_case_34, label %when_next_35
when_case_34:
  br label %when_end_3
when_next_35:
  %118 = icmp eq i64 %18, 5
  br i1 %118, label %when_case_36, label %when_next_37
when_case_36:
  br label %when_end_3
when_next_37:
  %119 = icmp eq i64 %18, 6
  br i1 %119, label %when_case_38, label %when_next_39
when_case_38:
  br label %when_end_3
when_next_39:
  %120 = icmp eq i64 %18, 12
  br i1 %120, label %when_case_40, label %when_next_41
when_case_40:
  br label %when_end_3
when_next_41:
  %121 = icmp eq i64 %18, 13
  br i1 %121, label %when_case_42, label %when_next_43
when_case_42:
  br label %when_end_3
when_next_43:
  %122 = icmp eq i64 %18, 14
  br i1 %122, label %when_case_44, label %when_next_45
when_case_44:
  %123 = load i64*, i64** %ptr_instr
  %124 = getelementptr inbounds i64, i64* %123, i64 3
  %125 = bitcast i64* %124 to i64*
  %126 = load i64, i64* %125, align 8
  store i64 %126, i64* %ptr_i
  br label %when_end_3
when_next_45:
  %127 = icmp eq i64 %18, 15
  br i1 %127, label %when_case_46, label %when_next_47
when_case_46:
  %128 = load i64*, i64** %ptr_instr
  %129 = getelementptr inbounds i64, i64* %128, i64 2
  %130 = bitcast i64* %129 to i64*
  %131 = load i64, i64* %130, align 8
  store i64 %131, i64* %ptr_i
  br label %when_end_3
when_next_47:
  %132 = icmp eq i64 %18, 18
  br i1 %132, label %when_case_48, label %when_next_49
when_case_48:
  %133 = load i64*, i64** %ptr_instr
  %134 = getelementptr inbounds i64, i64* %133, i64 3
  %135 = bitcast i64* %134 to i64*
  %136 = load i64, i64* %135, align 8
  store i64 %136, i64* %ptr_i
  br label %when_end_3
when_next_49:
  %137 = icmp eq i64 %18, 19
  br i1 %137, label %when_case_50, label %when_next_51
when_case_50:
  br label %when_end_3
when_next_51:
  %138 = icmp eq i64 %18, 20
  br i1 %138, label %when_case_52, label %when_next_53
when_case_52:
  br label %when_end_3
when_next_53:
  %139 = icmp eq i64 %18, 15
  br i1 %139, label %when_case_54, label %when_next_55
when_case_54:
  br label %when_end_3
when_next_55:
  br label %when_end_3
when_end_3:
  %140 = load i64, i64* %ptr_i
  %141 = add nsw i64 %140, 1
  store i64 %141, i64* %ptr_i
  br label %while_cond_0
while_end_2:
  %142 = load i64**, i64*** %ptr_soa_list
  ret i64** %142
unreachable_56:
  ret i64** null
}

define i64** @optimizer_run_soa_pass_func(i64** noalias %param_opt, i64** noalias %param_func) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_opt, i64*** %ptr_opt
  store i64** %param_func, i64*** %ptr_func
  %1 = call i8* @malloc(i64 16)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_dummy_soa
  %3 = load i64**, i64*** %ptr_dummy_soa
  %4 = call i64** @new_list_SoAArray(i64 10, i64** %3)
  store i64** %4, i64*** %ptr_soa_list
  store i64 0, i1* %ptr_b
  br label %while_cond_0
while_cond_0:
  %5 = load i64**, i64*** %ptr_func
  %6 = bitcast i64** %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 3
  %8 = bitcast i64* %7 to i8**
  %9 = load i8*, i8** %8, align 8
  %10 = bitcast i8* %9 to i64*
  %11 = getelementptr inbounds i64, i64* %10, i64 1
  %12 = bitcast i64* %11 to i64*
  %13 = load i64, i64* %12, align 8
  %14 = load i1, i1* %ptr_b
  %15 = icmp slt i1 %14, %13
  br i1 %15, label %while_body_1, label %while_end_2
while_body_1:
  %16 = load i64**, i64*** %ptr_func
  %17 = bitcast i64** %16 to i64*
  %18 = getelementptr inbounds i64, i64* %17, i64 3
  %19 = bitcast i64* %18 to i8**
  %20 = load i8*, i8** %19, align 8
  %21 = load i1, i1* %ptr_b
  %22 = call i64* @list_get_BasicBlock(i8* %20, i1 %21)
  store i64* %22, i64** %ptr_block
  store i64 0, i64* %ptr_i
  br label %while_cond_3
while_cond_3:
  %23 = load i64*, i64** %ptr_block
  %24 = bitcast i64* %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 1
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = bitcast i8* %27 to i64*
  %29 = getelementptr inbounds i64, i64* %28, i64 1
  %30 = bitcast i64* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = load i64, i64* %ptr_i
  %33 = icmp slt i64 %32, %31
  br i1 %33, label %while_body_4, label %while_end_5
while_body_4:
  %34 = load i64*, i64** %ptr_block
  %35 = bitcast i64* %34 to i64*
  %36 = getelementptr inbounds i64, i64* %35, i64 1
  %37 = bitcast i64* %36 to i8**
  %38 = load i8*, i8** %37, align 8
  %39 = load i64, i64* %ptr_i
  %40 = call i64* @list_get_IRInstruction(i8* %38, i64 %39)
  store i64* %40, i64** %ptr_instr
  %41 = load i64*, i64** %ptr_instr
  %42 = getelementptr inbounds i64, i64* %41, i64 0
  %43 = bitcast i64* %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = icmp eq i64 %44, 6
  br i1 %45, label %when_case_7, label %when_next_8
when_case_7:
  %46 = load i64*, i64** %ptr_instr
  %47 = getelementptr inbounds i64, i64* %46, i64 1
  %48 = bitcast i64* %47 to i8**
  %49 = load i8*, i8** %48, align 8
  %50 = load i64*, i64** %ptr_instr
  %51 = getelementptr inbounds i64, i64* %50, i64 2
  %52 = bitcast i64* %51 to i64***
  %53 = load i64**, i64*** %52, align 8
  %54 = load i64*, i64** %ptr_instr
  %55 = getelementptr inbounds i64, i64* %54, i64 5
  %56 = bitcast i64* %55 to i64*
  %57 = load i64, i64* %56, align 8
  store i64 %57, i64* %ptr_size
  store i64 0, i64* %ptr_j
  br label %while_cond_9
while_cond_9:
  %58 = bitcast i64** %53 to i64*
  %59 = getelementptr inbounds i64, i64* %58, i64 1
  %60 = bitcast i64* %59 to i64*
  %61 = load i64, i64* %60, align 8
  %62 = load i64, i64* %ptr_j
  %63 = icmp slt i64 %62, %61
  br i1 %63, label %while_body_10, label %while_end_11
while_body_10:
  %64 = load i64, i64* %ptr_j
  %65 = call i64* @list_get_FlatVectorApplyOp(i64** %53, i64 %64)
  store i64* %65, i64*** %ptr_op
  %66 = load i64**, i64*** %ptr_op
  %67 = bitcast i64** %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 0
  %69 = bitcast i64* %68 to i8**
  %70 = load i8*, i8** %69, align 8
  %71 = call i8* @concat_strings(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0), i8* %70)
  %72 = call i8* @concat_strings(i8* %49, i8* %71)
  store i8* %72, i8** %ptr_full_name
  %73 = load i64**, i64*** %ptr_soa_list
  %74 = load i8*, i8** %ptr_full_name
  %75 = load i64, i64* %ptr_size
  call void @add_soa(i64** %73, i8* %74, i64 %75)
  %76 = load i64**, i64*** %ptr_op
  %77 = bitcast i64** %76 to i64*
  %78 = getelementptr inbounds i64, i64* %77, i64 2
  %79 = bitcast i64* %78 to i8**
  %80 = load i8*, i8** %79, align 8
  %81 = getelementptr inbounds i64, i8* %80, i64 0
  %82 = bitcast i64* %81 to i64*
  %83 = load i64, i64* %82, align 8
  %84 = icmp eq i64 %83, 1
  br i1 %84, label %when_case_13, label %when_next_14
when_case_13:
  %85 = getelementptr inbounds i64, i8* %80, i64 1
  %86 = bitcast i64* %85 to i8**
  %87 = load i8*, i8** %86, align 8
  %88 = getelementptr inbounds i64, i8* %80, i64 2
  %89 = bitcast i64* %88 to i8**
  %90 = load i8*, i8** %89, align 8
  %91 = call i8* @concat_strings(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0), i8* %90)
  %92 = call i8* @concat_strings(i8* %87, i8* %91)
  store i8* %92, i8** %ptr_rhs_full
  %93 = load i64**, i64*** %ptr_soa_list
  %94 = load i8*, i8** %ptr_rhs_full
  %95 = load i64, i64* %ptr_size
  call void @add_soa(i64** %93, i8* %94, i64 %95)
  br label %when_end_12
when_next_14:
  %96 = icmp eq i64 %83, 0
  br i1 %96, label %when_case_15, label %when_next_16
when_case_15:
  br label %when_end_12
when_next_16:
  br label %when_end_12
when_end_12:
  %97 = load i64, i64* %ptr_j
  %98 = add nsw i64 %97, 1
  store i64 %98, i64* %ptr_j
  br label %while_cond_9
while_end_11:
  br label %when_end_6
when_next_8:
  %99 = icmp eq i64 %44, 16
  br i1 %99, label %when_case_17, label %when_next_18
when_case_17:
  %100 = load i64*, i64** %ptr_instr
  %101 = getelementptr inbounds i64, i64* %100, i64 2
  %102 = bitcast i64* %101 to i8**
  %103 = load i8*, i8** %102, align 8
  %104 = load i64*, i64** %ptr_instr
  %105 = getelementptr inbounds i64, i64* %104, i64 3
  %106 = bitcast i64* %105 to i8**
  %107 = load i8*, i8** %106, align 8
  %108 = load i64*, i64** %ptr_instr
  %109 = getelementptr inbounds i64, i64* %108, i64 5
  %110 = bitcast i64* %109 to i64*
  %111 = load i64, i64* %110, align 8
  store i64 %111, i64* %ptr_size
  %112 = call i8* @concat_strings(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0), i8* %107)
  %113 = call i8* @concat_strings(i8* %103, i8* %112)
  store i8* %113, i8** %ptr_full_name
  %114 = load i64**, i64*** %ptr_soa_list
  %115 = load i8*, i8** %ptr_full_name
  %116 = load i64, i64* %ptr_size
  call void @add_soa(i64** %114, i8* %115, i64 %116)
  br label %when_end_6
when_next_18:
  %117 = icmp eq i64 %44, 17
  br i1 %117, label %when_case_19, label %when_next_20
when_case_19:
  %118 = load i64*, i64** %ptr_instr
  %119 = getelementptr inbounds i64, i64* %118, i64 1
  %120 = bitcast i64* %119 to i8**
  %121 = load i8*, i8** %120, align 8
  store i8* %121, i8* %103
  %122 = load i64*, i64** %ptr_instr
  %123 = getelementptr inbounds i64, i64* %122, i64 2
  %124 = bitcast i64* %123 to i8**
  %125 = load i8*, i8** %124, align 8
  store i8* %125, i8* %107
  %126 = load i64*, i64** %ptr_instr
  %127 = getelementptr inbounds i64, i64* %126, i64 5
  %128 = bitcast i64* %127 to i64*
  %129 = load i64, i64* %128, align 8
  store i64 %129, i64* %ptr_size
  %130 = call i8* @concat_strings(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i8* %107)
  %131 = call i8* @concat_strings(i8* %103, i8* %130)
  store i8* %131, i8** %ptr_full_name
  %132 = load i64**, i64*** %ptr_soa_list
  %133 = load i8*, i8** %ptr_full_name
  %134 = load i64, i64* %ptr_size
  call void @add_soa(i64** %132, i8* %133, i64 %134)
  br label %when_end_6
when_next_20:
  %135 = icmp eq i64 %44, 0
  br i1 %135, label %when_case_21, label %when_next_22
when_case_21:
  br label %when_end_6
when_next_22:
  %136 = icmp eq i64 %44, 1
  br i1 %136, label %when_case_23, label %when_next_24
when_case_23:
  br label %when_end_6
when_next_24:
  %137 = icmp eq i64 %44, 2
  br i1 %137, label %when_case_25, label %when_next_26
when_case_25:
  br label %when_end_6
when_next_26:
  %138 = icmp eq i64 %44, 3
  br i1 %138, label %when_case_27, label %when_next_28
when_case_27:
  br label %when_end_6
when_next_28:
  %139 = icmp eq i64 %44, 4
  br i1 %139, label %when_case_29, label %when_next_30
when_case_29:
  br label %when_end_6
when_next_30:
  %140 = icmp eq i64 %44, 3
  br i1 %140, label %when_case_31, label %when_next_32
when_case_31:
  br label %when_end_6
when_next_32:
  %141 = icmp eq i64 %44, 7
  br i1 %141, label %when_case_33, label %when_next_34
when_case_33:
  br label %when_end_6
when_next_34:
  %142 = icmp eq i64 %44, 8
  br i1 %142, label %when_case_35, label %when_next_36
when_case_35:
  br label %when_end_6
when_next_36:
  %143 = icmp eq i64 %44, 9
  br i1 %143, label %when_case_37, label %when_next_38
when_case_37:
  br label %when_end_6
when_next_38:
  %144 = icmp eq i64 %44, 5
  br i1 %144, label %when_case_39, label %when_next_40
when_case_39:
  br label %when_end_6
when_next_40:
  %145 = icmp eq i64 %44, 6
  br i1 %145, label %when_case_41, label %when_next_42
when_case_41:
  br label %when_end_6
when_next_42:
  %146 = icmp eq i64 %44, 12
  br i1 %146, label %when_case_43, label %when_next_44
when_case_43:
  br label %when_end_6
when_next_44:
  %147 = icmp eq i64 %44, 13
  br i1 %147, label %when_case_45, label %when_next_46
when_case_45:
  br label %when_end_6
when_next_46:
  %148 = icmp eq i64 %44, 14
  br i1 %148, label %when_case_47, label %when_next_48
when_case_47:
  %149 = load i64*, i64** %ptr_instr
  %150 = getelementptr inbounds i64, i64* %149, i64 3
  %151 = bitcast i64* %150 to i64*
  %152 = load i64, i64* %151, align 8
  store i64 %152, i64* %ptr_i
  br label %when_end_6
when_next_48:
  %153 = icmp eq i64 %44, 15
  br i1 %153, label %when_case_49, label %when_next_50
when_case_49:
  %154 = load i64*, i64** %ptr_instr
  %155 = getelementptr inbounds i64, i64* %154, i64 2
  %156 = bitcast i64* %155 to i64*
  %157 = load i64, i64* %156, align 8
  store i64 %157, i64* %ptr_i
  br label %when_end_6
when_next_50:
  %158 = icmp eq i64 %44, 18
  br i1 %158, label %when_case_51, label %when_next_52
when_case_51:
  %159 = load i64*, i64** %ptr_instr
  %160 = getelementptr inbounds i64, i64* %159, i64 3
  %161 = bitcast i64* %160 to i64*
  %162 = load i64, i64* %161, align 8
  store i64 %162, i64* %ptr_i
  br label %when_end_6
when_next_52:
  %163 = icmp eq i64 %44, 19
  br i1 %163, label %when_case_53, label %when_next_54
when_case_53:
  br label %when_end_6
when_next_54:
  %164 = icmp eq i64 %44, 20
  br i1 %164, label %when_case_55, label %when_next_56
when_case_55:
  %165 = load i64*, i64** %ptr_instr
  %166 = getelementptr inbounds i64, i64* %165, i64 4
  %167 = bitcast i64* %166 to i1*
  %168 = load i1, i1* %167, align 8
  store i1 %168, i1* %ptr_b
  br label %when_end_6
when_next_56:
  %169 = icmp eq i64 %44, 15
  br i1 %169, label %when_case_57, label %when_next_58
when_case_57:
  br label %when_end_6
when_next_58:
  br label %when_end_6
when_end_6:
  %170 = load i64, i64* %ptr_i
  %171 = add nsw i64 %170, 1
  store i64 %171, i64* %ptr_i
  br label %while_cond_3
while_end_5:
  %172 = load i1, i1* %ptr_b
  %173 = add nsw i1 %172, 1
  store i1 %173, i1* %ptr_b
  br label %while_cond_0
while_end_2:
  %174 = load i64**, i64*** %ptr_soa_list
  ret i64** %174
unreachable_59:
  ret i64** null
}

define i8* @operand_to_var(i64** noalias %param_opt, i64** noalias %param_op) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_opt, i64*** %ptr_opt
  store i64** %param_op, i64*** %ptr_op
  %1 = load i64**, i64*** %ptr_op
  %2 = load i64*, i64** %1
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = icmp eq i64 %5, 5
  br i1 %6, label %when_case_1, label %when_next_2
when_case_1:
  %7 = getelementptr inbounds i64, i64* %2, i64 1
  %8 = bitcast i64* %7 to i8**
  %9 = load i8*, i8** %8, align 8
  store i8* %9, i8** %ptr_name
  %10 = load i8*, i8** %ptr_name
  ret i8* %10
unreachable_3:
  br label %when_end_0
when_next_2:
  %11 = icmp eq i64 %5, 6
  br i1 %11, label %when_case_4, label %when_next_5
when_case_4:
  %12 = getelementptr inbounds i64, i64* %2, i64 1
  %13 = bitcast i64* %12 to i64***
  %14 = load i64**, i64*** %13, align 8
  %15 = call i8* @int_to_string(i64** %14)
  %16 = call i8* @concat_strings(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i64 0, i64 0), i8* %15)
  ret i8* %16
unreachable_6:
  br label %when_end_0
when_next_5:
  %17 = icmp eq i64 %5, 0
  br i1 %17, label %when_case_7, label %when_next_8
when_case_7:
  br label %when_end_0
when_next_8:
  %18 = icmp eq i64 %5, 1
  br i1 %18, label %when_case_9, label %when_next_10
when_case_9:
  br label %when_end_0
when_next_10:
  %19 = icmp eq i64 %5, 2
  br i1 %19, label %when_case_11, label %when_next_12
when_case_11:
  br label %when_end_0
when_next_12:
  %20 = icmp eq i64 %5, 3
  br i1 %20, label %when_case_13, label %when_next_14
when_case_13:
  br label %when_end_0
when_next_14:
  %21 = icmp eq i64 %5, 4
  br i1 %21, label %when_case_15, label %when_next_16
when_case_15:
  br label %when_end_0
when_next_16:
  %22 = icmp eq i64 %5, 7
  br i1 %22, label %when_case_17, label %when_next_18
when_case_17:
  br label %when_end_0
when_next_18:
  %23 = icmp eq i64 %5, 7
  br i1 %23, label %when_case_19, label %when_next_20
when_case_19:
  br label %when_end_0
when_next_20:
  br label %when_end_0
when_end_0:
  ret i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.11, i64 0, i64 0)
unreachable_21:
  ret i8* null
}

define void @add_use(i64** noalias %param_opt, i64** noalias %param_uses, i64** noalias %param_op) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_opt, i64*** %ptr_opt
  store i64** %param_uses, i64*** %ptr_uses
  store i64** %param_op, i64*** %ptr_op
  %1 = load i64**, i64*** %ptr_opt
  %2 = load i64**, i64*** %ptr_op
  %3 = call i8* @operand_to_var(i64** %1, i64** %2)
  store i8* %3, i8** %ptr_var_name
  %4 = load i8*, i8** %ptr_var_name
  %5 = call i1 @string_eq(i8* %4, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0))
  %6 = xor i1 %5, 1
  br i1 %6, label %then_0, label %end_if_1
then_0:
  %7 = load i64**, i64*** %ptr_uses
  %8 = load i8*, i8** %ptr_var_name
  call void @list_push_String(i64** %7, i8* %8)
  br label %end_if_1
end_if_1:
  ret void
}

define void @add_def(i64** noalias %param_opt, i64** noalias %param_defs, i64** noalias %param_op) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_opt, i64*** %ptr_opt
  store i64** %param_defs, i64*** %ptr_defs
  store i64** %param_op, i64*** %ptr_op
  %1 = load i64**, i64*** %ptr_opt
  %2 = load i64**, i64*** %ptr_op
  %3 = call i8* @operand_to_var(i64** %1, i64** %2)
  store i8* %3, i8** %ptr_var_name
  %4 = load i8*, i8** %ptr_var_name
  %5 = call i1 @string_eq(i8* %4, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.13, i64 0, i64 0))
  %6 = xor i1 %5, 1
  br i1 %6, label %then_0, label %end_if_1
then_0:
  %7 = load i64**, i64*** %ptr_defs
  %8 = load i8*, i8** %ptr_var_name
  call void @list_push_String(i64** %7, i8* %8)
  br label %end_if_1
end_if_1:
  ret void
}

define i64** @instr_use_def(i64** noalias %param_opt, i64* noalias %param_instr) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_opt, i64*** %ptr_opt
  store i64* %param_instr, i64** %ptr_instr
  %1 = call i8* @malloc(i64 16)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_res
  %3 = call i8* @malloc(i64 8)
  %4 = bitcast i8* %3 to i64*
  store i64* %4, i8*** %ptr_dummy_str
  %5 = load i8**, i8*** %ptr_dummy_str
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.14, i64 0, i64 0), i8** %5
  %6 = load i8**, i8*** %ptr_dummy_str
  %7 = call i64** @new_list_String(i64 5, i8** %6)
  %8 = load i8**, i8*** %ptr_dummy_str
  %9 = call i64** @new_list_String(i64 5, i8** %8)
  %10 = load i64**, i64*** %ptr_res
  %11 = bitcast i64** %10 to i64*
  %12 = getelementptr inbounds i64, i64* %11, i64 0
  %13 = bitcast i64* %12 to i64***
  store i64** %9, i64*** %13, align 8
  %14 = load i8**, i8*** %ptr_dummy_str
  %15 = call i64** @new_list_String(i64 5, i8** %14)
  %16 = load i8**, i8*** %ptr_dummy_str
  %17 = call i64** @new_list_String(i64 5, i8** %16)
  %18 = load i64**, i64*** %ptr_res
  %19 = bitcast i64** %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 1
  %21 = bitcast i64* %20 to i64***
  store i64** %17, i64*** %21, align 8
  %22 = load i64*, i64** %ptr_instr
  %23 = getelementptr inbounds i64, i64* %22, i64 0
  %24 = bitcast i64* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = icmp eq i64 %25, 0
  br i1 %26, label %when_case_1, label %when_next_2
when_case_1:
  %27 = load i64*, i64** %ptr_instr
  %28 = getelementptr inbounds i64, i64* %27, i64 1
  %29 = bitcast i64* %28 to i64***
  %30 = load i64**, i64*** %29, align 8
  %31 = load i64*, i64** %ptr_instr
  %32 = getelementptr inbounds i64, i64* %31, i64 2
  %33 = bitcast i64* %32 to i64***
  %34 = load i64**, i64*** %33, align 8
  store i64** %34, i64*** %ptr_src
  %35 = load i64**, i64*** %ptr_res
  %36 = bitcast i64** %35 to i64*
  %37 = getelementptr inbounds i64, i64* %36, i64 0
  %38 = bitcast i64* %37 to i8**
  %39 = load i8*, i8** %38, align 8
  %40 = load i64**, i64*** %ptr_opt
  %41 = load i64**, i64*** %ptr_src
  call void @add_use(i64** %40, i8* %39, i64** %41)
  %42 = load i64**, i64*** %ptr_res
  %43 = bitcast i64** %42 to i64*
  %44 = getelementptr inbounds i64, i64* %43, i64 1
  %45 = bitcast i64* %44 to i8**
  %46 = load i8*, i8** %45, align 8
  %47 = load i64**, i64*** %ptr_opt
  call void @add_def(i64** %47, i8* %46, i64** %30)
  br label %when_end_0
when_next_2:
  %48 = icmp eq i64 %25, 1
  br i1 %48, label %when_case_3, label %when_next_4
when_case_3:
  %49 = load i64*, i64** %ptr_instr
  %50 = getelementptr inbounds i64, i64* %49, i64 1
  %51 = bitcast i64* %50 to i64***
  %52 = load i64**, i64*** %51, align 8
  store i64** %52, i64** %30
  %53 = load i64*, i64** %ptr_instr
  %54 = getelementptr inbounds i64, i64* %53, i64 3
  %55 = bitcast i64* %54 to i64***
  %56 = load i64**, i64*** %55, align 8
  %57 = load i64**, i64*** %ptr_res
  %58 = bitcast i64** %57 to i64*
  %59 = getelementptr inbounds i64, i64* %58, i64 0
  %60 = bitcast i64* %59 to i8**
  %61 = load i8*, i8** %60, align 8
  %62 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %62, i8* %61, i64** %56)
  %63 = load i64**, i64*** %ptr_res
  %64 = bitcast i64** %63 to i64*
  %65 = getelementptr inbounds i64, i64* %64, i64 1
  %66 = bitcast i64* %65 to i8**
  %67 = load i8*, i8** %66, align 8
  %68 = load i64**, i64*** %ptr_opt
  call void @add_def(i64** %68, i8* %67, i64** %30)
  br label %when_end_0
when_next_4:
  %69 = icmp eq i64 %25, 2
  br i1 %69, label %when_case_5, label %when_next_6
when_case_5:
  %70 = load i64*, i64** %ptr_instr
  %71 = getelementptr inbounds i64, i64* %70, i64 1
  %72 = bitcast i64* %71 to i64***
  %73 = load i64**, i64*** %72, align 8
  store i64** %73, i64** %30
  %74 = load i64*, i64** %ptr_instr
  %75 = getelementptr inbounds i64, i64* %74, i64 3
  %76 = bitcast i64* %75 to i64***
  %77 = load i64**, i64*** %76, align 8
  %78 = load i64*, i64** %ptr_instr
  %79 = getelementptr inbounds i64, i64* %78, i64 4
  %80 = bitcast i64* %79 to i64***
  %81 = load i64**, i64*** %80, align 8
  %82 = load i64**, i64*** %ptr_res
  %83 = bitcast i64** %82 to i64*
  %84 = getelementptr inbounds i64, i64* %83, i64 0
  %85 = bitcast i64* %84 to i8**
  %86 = load i8*, i8** %85, align 8
  %87 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %87, i8* %86, i64** %77)
  %88 = load i64**, i64*** %ptr_res
  %89 = bitcast i64** %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 0
  %91 = bitcast i64* %90 to i8**
  %92 = load i8*, i8** %91, align 8
  %93 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %93, i8* %92, i64** %81)
  %94 = load i64**, i64*** %ptr_res
  %95 = bitcast i64** %94 to i64*
  %96 = getelementptr inbounds i64, i64* %95, i64 1
  %97 = bitcast i64* %96 to i8**
  %98 = load i8*, i8** %97, align 8
  %99 = load i64**, i64*** %ptr_opt
  call void @add_def(i64** %99, i8* %98, i64** %30)
  br label %when_end_0
when_next_6:
  %100 = icmp eq i64 %25, 15
  br i1 %100, label %when_case_7, label %when_next_8
when_case_7:
  %101 = load i64*, i64** %ptr_instr
  %102 = getelementptr inbounds i64, i64* %101, i64 1
  %103 = bitcast i64* %102 to i64***
  %104 = load i64**, i64*** %103, align 8
  store i64** %104, i64** %30
  %105 = load i64*, i64** %ptr_instr
  %106 = getelementptr inbounds i64, i64* %105, i64 3
  %107 = bitcast i64* %106 to i64***
  %108 = load i64**, i64*** %107, align 8
  store i64** %108, i64*** %ptr_src
  %109 = load i64**, i64*** %ptr_res
  %110 = bitcast i64** %109 to i64*
  %111 = getelementptr inbounds i64, i64* %110, i64 0
  %112 = bitcast i64* %111 to i8**
  %113 = load i8*, i8** %112, align 8
  %114 = load i64**, i64*** %ptr_opt
  %115 = load i64**, i64*** %ptr_src
  call void @add_use(i64** %114, i8* %113, i64** %115)
  %116 = load i64**, i64*** %ptr_res
  %117 = bitcast i64** %116 to i64*
  %118 = getelementptr inbounds i64, i64* %117, i64 1
  %119 = bitcast i64* %118 to i8**
  %120 = load i8*, i8** %119, align 8
  %121 = load i64**, i64*** %ptr_opt
  call void @add_def(i64** %121, i8* %120, i64** %30)
  br label %when_end_0
when_next_8:
  %122 = icmp eq i64 %25, 3
  br i1 %122, label %when_case_9, label %when_next_10
when_case_9:
  %123 = load i64*, i64** %ptr_instr
  %124 = getelementptr inbounds i64, i64* %123, i64 1
  %125 = bitcast i64* %124 to i64***
  %126 = load i64**, i64*** %125, align 8
  store i64** %126, i64** %30
  %127 = load i64*, i64** %ptr_instr
  %128 = getelementptr inbounds i64, i64* %127, i64 2
  %129 = bitcast i64* %128 to i64***
  %130 = load i64**, i64*** %129, align 8
  %131 = load i64**, i64*** %ptr_res
  %132 = bitcast i64** %131 to i64*
  %133 = getelementptr inbounds i64, i64* %132, i64 0
  %134 = bitcast i64* %133 to i8**
  %135 = load i8*, i8** %134, align 8
  %136 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %136, i8* %135, i64** %130)
  %137 = load i64**, i64*** %ptr_res
  %138 = bitcast i64** %137 to i64*
  %139 = getelementptr inbounds i64, i64* %138, i64 1
  %140 = bitcast i64* %139 to i8**
  %141 = load i8*, i8** %140, align 8
  %142 = load i64**, i64*** %ptr_opt
  call void @add_def(i64** %142, i8* %141, i64** %30)
  br label %when_end_0
when_next_10:
  %143 = icmp eq i64 %25, 4
  br i1 %143, label %when_case_11, label %when_next_12
when_case_11:
  %144 = load i64*, i64** %ptr_instr
  %145 = getelementptr inbounds i64, i64* %144, i64 1
  %146 = bitcast i64* %145 to i64***
  %147 = load i64**, i64*** %146, align 8
  store i64** %147, i64** %130
  %148 = load i64*, i64** %ptr_instr
  %149 = getelementptr inbounds i64, i64* %148, i64 3
  %150 = bitcast i64* %149 to i64***
  %151 = load i64**, i64*** %150, align 8
  store i64** %151, i64*** %ptr_val
  %152 = load i64**, i64*** %ptr_res
  %153 = bitcast i64** %152 to i64*
  %154 = getelementptr inbounds i64, i64* %153, i64 0
  %155 = bitcast i64* %154 to i8**
  %156 = load i8*, i8** %155, align 8
  %157 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %157, i8* %156, i64** %130)
  %158 = load i64**, i64*** %ptr_res
  %159 = bitcast i64** %158 to i64*
  %160 = getelementptr inbounds i64, i64* %159, i64 0
  %161 = bitcast i64* %160 to i8**
  %162 = load i8*, i8** %161, align 8
  %163 = load i64**, i64*** %ptr_opt
  %164 = load i64**, i64*** %ptr_val
  call void @add_use(i64** %163, i8* %162, i64** %164)
  br label %when_end_0
when_next_12:
  %165 = icmp eq i64 %25, 3
  br i1 %165, label %when_case_13, label %when_next_14
when_case_13:
  %166 = load i64*, i64** %ptr_instr
  %167 = getelementptr inbounds i64, i64* %166, i64 1
  %168 = bitcast i64* %167 to i64***
  %169 = load i64**, i64*** %168, align 8
  %170 = load i64*, i64** %ptr_instr
  %171 = getelementptr inbounds i64, i64* %170, i64 2
  %172 = bitcast i64* %171 to i64***
  %173 = load i64**, i64*** %172, align 8
  %174 = load i64*, i64** %ptr_instr
  %175 = getelementptr inbounds i64, i64* %174, i64 3
  %176 = bitcast i64* %175 to i64***
  %177 = load i64**, i64*** %176, align 8
  %178 = load i64**, i64*** %ptr_res
  %179 = bitcast i64** %178 to i64*
  %180 = getelementptr inbounds i64, i64* %179, i64 0
  %181 = bitcast i64* %180 to i8**
  %182 = load i8*, i8** %181, align 8
  %183 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %183, i8* %182, i64** %173)
  store i64 0, i64* %ptr_i
  br label %while_cond_15
while_cond_15:
  %184 = bitcast i64** %177 to i64*
  %185 = getelementptr inbounds i64, i64* %184, i64 1
  %186 = bitcast i64* %185 to i64*
  %187 = load i64, i64* %186, align 8
  %188 = load i64, i64* %ptr_i
  %189 = icmp slt i64 %188, %187
  br i1 %189, label %while_body_16, label %while_end_17
while_body_16:
  %190 = load i64, i64* %ptr_i
  %191 = call i64* @list_get_IROperand(i64** %177, i64 %190)
  store i64* %191, i8** %ptr_a
  %192 = call i8* @malloc(i64 8)
  %193 = bitcast i8* %192 to i64*
  store i64* %193, i64*** %ptr_a_ptr
  %194 = load i64**, i64*** %ptr_a_ptr
  %195 = load i8*, i8** %ptr_a
  store i8* %195, i64** %194
  %196 = load i64**, i64*** %ptr_res
  %197 = bitcast i64** %196 to i64*
  %198 = getelementptr inbounds i64, i64* %197, i64 0
  %199 = bitcast i64* %198 to i8**
  %200 = load i8*, i8** %199, align 8
  %201 = load i64**, i64*** %ptr_opt
  %202 = load i64**, i64*** %ptr_a_ptr
  call void @add_use(i64** %201, i8* %200, i64** %202)
  %203 = load i64, i64* %ptr_i
  %204 = add nsw i64 %203, 1
  store i64 %204, i64* %ptr_i
  br label %while_cond_15
while_end_17:
  %205 = icmp ne i64** %169, null
  br i1 %205, label %then_18, label %end_if_19
then_18:
  store i64** %169, i8** %ptr_d
  %206 = load i64**, i64*** %ptr_res
  %207 = bitcast i64** %206 to i64*
  %208 = getelementptr inbounds i64, i64* %207, i64 1
  %209 = bitcast i64* %208 to i8**
  %210 = load i8*, i8** %209, align 8
  %211 = load i64**, i64*** %ptr_opt
  %212 = load i8*, i8** %ptr_d
  call void @add_def(i64** %211, i8* %210, i8* %212)
  br label %end_if_19
end_if_19:
  br label %when_end_0
when_next_14:
  %213 = icmp eq i64 %25, 6
  br i1 %213, label %when_case_20, label %when_next_21
when_case_20:
  %214 = load i64*, i64** %ptr_instr
  %215 = getelementptr inbounds i64, i64* %214, i64 2
  %216 = bitcast i64* %215 to i64***
  %217 = load i64**, i64*** %216, align 8
  %218 = load i64*, i64** %ptr_instr
  %219 = getelementptr inbounds i64, i64* %218, i64 3
  %220 = bitcast i64* %219 to i64***
  %221 = load i64**, i64*** %220, align 8
  %222 = load i64*, i64** %ptr_instr
  %223 = getelementptr inbounds i64, i64* %222, i64 4
  %224 = bitcast i64* %223 to i64***
  %225 = load i64**, i64*** %224, align 8
  %226 = load i64**, i64*** %ptr_res
  %227 = bitcast i64** %226 to i64*
  %228 = getelementptr inbounds i64, i64* %227, i64 0
  %229 = bitcast i64* %228 to i8**
  %230 = load i8*, i8** %229, align 8
  %231 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %231, i8* %230, i64** %221)
  %232 = load i64**, i64*** %ptr_res
  %233 = bitcast i64** %232 to i64*
  %234 = getelementptr inbounds i64, i64* %233, i64 0
  %235 = bitcast i64* %234 to i8**
  %236 = load i8*, i8** %235, align 8
  %237 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %237, i8* %236, i64** %225)
  store i64 0, i64* %ptr_i
  br label %while_cond_22
while_cond_22:
  %238 = bitcast i64** %217 to i64*
  %239 = getelementptr inbounds i64, i64* %238, i64 1
  %240 = bitcast i64* %239 to i64*
  %241 = load i64, i64* %240, align 8
  %242 = load i64, i64* %ptr_i
  %243 = icmp slt i64 %242, %241
  br i1 %243, label %while_body_23, label %while_end_24
while_body_23:
  %244 = load i64, i64* %ptr_i
  %245 = call i64* @list_get_FlatVectorApplyOp(i64** %217, i64 %244)
  store i64* %245, i64** %ptr_vop
  %246 = load i64*, i64** %ptr_vop
  %247 = bitcast i64* %246 to i64*
  %248 = getelementptr inbounds i64, i64* %247, i64 2
  %249 = bitcast i64* %248 to i8**
  %250 = load i8*, i8** %249, align 8
  %251 = getelementptr inbounds i64, i8* %250, i64 0
  %252 = bitcast i64* %251 to i64*
  %253 = load i64, i64* %252, align 8
  %254 = icmp eq i64 %253, 0
  br i1 %254, label %when_case_26, label %when_next_27
when_case_26:
  %255 = getelementptr inbounds i64, i8* %250, i64 1
  %256 = bitcast i64* %255 to i64***
  %257 = load i64**, i64*** %256, align 8
  store i64** %257, i64*** %ptr_op
  %258 = load i64**, i64*** %ptr_res
  %259 = bitcast i64** %258 to i64*
  %260 = getelementptr inbounds i64, i64* %259, i64 0
  %261 = bitcast i64* %260 to i8**
  %262 = load i8*, i8** %261, align 8
  %263 = load i64**, i64*** %ptr_opt
  %264 = load i64**, i64*** %ptr_op
  call void @add_use(i64** %263, i8* %262, i64** %264)
  br label %when_end_25
when_next_27:
  %265 = icmp eq i64 %253, 1
  br i1 %265, label %when_case_28, label %when_next_29
when_case_28:
  br label %when_end_25
when_next_29:
  br label %when_end_25
when_end_25:
  %266 = load i64, i64* %ptr_i
  %267 = add nsw i64 %266, 1
  store i64 %267, i64* %ptr_i
  br label %while_cond_22
while_end_24:
  br label %when_end_0
when_next_21:
  %268 = icmp eq i64 %25, 7
  br i1 %268, label %when_case_30, label %when_next_31
when_case_30:
  %269 = load i64*, i64** %ptr_instr
  %270 = getelementptr inbounds i64, i64* %269, i64 1
  %271 = bitcast i64* %270 to i64***
  %272 = load i64**, i64*** %271, align 8
  store i64** %272, i64** %30
  %273 = load i64*, i64** %ptr_instr
  %274 = getelementptr inbounds i64, i64* %273, i64 2
  %275 = bitcast i64* %274 to i64***
  %276 = load i64**, i64*** %275, align 8
  store i64** %276, i64** %130
  %277 = load i64**, i64*** %ptr_res
  %278 = bitcast i64** %277 to i64*
  %279 = getelementptr inbounds i64, i64* %278, i64 0
  %280 = bitcast i64* %279 to i8**
  %281 = load i8*, i8** %280, align 8
  %282 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %282, i8* %281, i64** %130)
  %283 = load i64**, i64*** %ptr_res
  %284 = bitcast i64** %283 to i64*
  %285 = getelementptr inbounds i64, i64* %284, i64 1
  %286 = bitcast i64* %285 to i8**
  %287 = load i8*, i8** %286, align 8
  %288 = load i64**, i64*** %ptr_opt
  call void @add_def(i64** %288, i8* %287, i64** %30)
  br label %when_end_0
when_next_31:
  %289 = icmp eq i64 %25, 16
  br i1 %289, label %when_case_32, label %when_next_33
when_case_32:
  %290 = load i64*, i64** %ptr_instr
  %291 = getelementptr inbounds i64, i64* %290, i64 1
  %292 = bitcast i64* %291 to i64***
  %293 = load i64**, i64*** %292, align 8
  store i64** %293, i64** %30
  %294 = load i64*, i64** %ptr_instr
  %295 = getelementptr inbounds i64, i64* %294, i64 4
  %296 = bitcast i64* %295 to i64*
  %297 = load i64, i64* %296, align 8
  %298 = load i64**, i64*** %ptr_res
  %299 = bitcast i64** %298 to i64*
  %300 = getelementptr inbounds i64, i64* %299, i64 0
  %301 = bitcast i64* %300 to i8**
  %302 = load i8*, i8** %301, align 8
  %303 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %303, i8* %302, i64 %297)
  %304 = load i64**, i64*** %ptr_res
  %305 = bitcast i64** %304 to i64*
  %306 = getelementptr inbounds i64, i64* %305, i64 1
  %307 = bitcast i64* %306 to i8**
  %308 = load i8*, i8** %307, align 8
  %309 = load i64**, i64*** %ptr_opt
  call void @add_def(i64** %309, i8* %308, i64** %30)
  br label %when_end_0
when_next_33:
  %310 = icmp eq i64 %25, 17
  br i1 %310, label %when_case_34, label %when_next_35
when_case_34:
  %311 = load i64*, i64** %ptr_instr
  %312 = getelementptr inbounds i64, i64* %311, i64 3
  %313 = bitcast i64* %312 to i64*
  %314 = load i64, i64* %313, align 8
  store i64 %314, i64 %297
  %315 = load i64*, i64** %ptr_instr
  %316 = getelementptr inbounds i64, i64* %315, i64 4
  %317 = bitcast i64* %316 to i64***
  %318 = load i64**, i64*** %317, align 8
  store i64** %318, i64*** %ptr_val
  %319 = load i64**, i64*** %ptr_res
  %320 = bitcast i64** %319 to i64*
  %321 = getelementptr inbounds i64, i64* %320, i64 0
  %322 = bitcast i64* %321 to i8**
  %323 = load i8*, i8** %322, align 8
  %324 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %324, i8* %323, i64 %297)
  %325 = load i64**, i64*** %ptr_res
  %326 = bitcast i64** %325 to i64*
  %327 = getelementptr inbounds i64, i64* %326, i64 0
  %328 = bitcast i64* %327 to i8**
  %329 = load i8*, i8** %328, align 8
  %330 = load i64**, i64*** %ptr_opt
  %331 = load i64**, i64*** %ptr_val
  call void @add_use(i64** %330, i8* %329, i64** %331)
  br label %when_end_0
when_next_35:
  %332 = icmp eq i64 %25, 8
  br i1 %332, label %when_case_36, label %when_next_37
when_case_36:
  %333 = load i64*, i64** %ptr_instr
  %334 = getelementptr inbounds i64, i64* %333, i64 1
  %335 = bitcast i64* %334 to i64***
  %336 = load i64**, i64*** %335, align 8
  store i64** %336, i64** %30
  %337 = load i64*, i64** %ptr_instr
  %338 = getelementptr inbounds i64, i64* %337, i64 2
  %339 = bitcast i64* %338 to i64***
  %340 = load i64**, i64*** %339, align 8
  store i64** %340, i64** %130
  %341 = load i64**, i64*** %ptr_res
  %342 = bitcast i64** %341 to i64*
  %343 = getelementptr inbounds i64, i64* %342, i64 0
  %344 = bitcast i64* %343 to i8**
  %345 = load i8*, i8** %344, align 8
  %346 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %346, i8* %345, i64** %130)
  %347 = load i64**, i64*** %ptr_res
  %348 = bitcast i64** %347 to i64*
  %349 = getelementptr inbounds i64, i64* %348, i64 1
  %350 = bitcast i64* %349 to i8**
  %351 = load i8*, i8** %350, align 8
  %352 = load i64**, i64*** %ptr_opt
  call void @add_def(i64** %352, i8* %351, i64** %30)
  br label %when_end_0
when_next_37:
  %353 = icmp eq i64 %25, 5
  br i1 %353, label %when_case_38, label %when_next_39
when_case_38:
  %354 = load i64*, i64** %ptr_instr
  %355 = getelementptr inbounds i64, i64* %354, i64 1
  %356 = bitcast i64* %355 to i64***
  %357 = load i64**, i64*** %356, align 8
  store i64** %357, i64** %30
  %358 = load i64**, i64*** %ptr_res
  %359 = bitcast i64** %358 to i64*
  %360 = getelementptr inbounds i64, i64* %359, i64 1
  %361 = bitcast i64* %360 to i8**
  %362 = load i8*, i8** %361, align 8
  %363 = load i64**, i64*** %ptr_opt
  call void @add_def(i64** %363, i8* %362, i64** %30)
  br label %when_end_0
when_next_39:
  %364 = icmp eq i64 %25, 12
  br i1 %364, label %when_case_40, label %when_next_41
when_case_40:
  %365 = load i64*, i64** %ptr_instr
  %366 = getelementptr inbounds i64, i64* %365, i64 1
  %367 = bitcast i64* %366 to i64***
  %368 = load i64**, i64*** %367, align 8
  store i64** %368, i64** %30
  %369 = load i64*, i64** %ptr_instr
  %370 = getelementptr inbounds i64, i64* %369, i64 2
  %371 = bitcast i64* %370 to i64***
  %372 = load i64**, i64*** %371, align 8
  %373 = load i64**, i64*** %ptr_res
  %374 = bitcast i64** %373 to i64*
  %375 = getelementptr inbounds i64, i64* %374, i64 0
  %376 = bitcast i64* %375 to i8**
  %377 = load i8*, i8** %376, align 8
  %378 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %378, i8* %377, i64** %372)
  %379 = load i64**, i64*** %ptr_res
  %380 = bitcast i64** %379 to i64*
  %381 = getelementptr inbounds i64, i64* %380, i64 1
  %382 = bitcast i64* %381 to i8**
  %383 = load i8*, i8** %382, align 8
  %384 = load i64**, i64*** %ptr_opt
  call void @add_def(i64** %384, i8* %383, i64** %30)
  br label %when_end_0
when_next_41:
  %385 = icmp eq i64 %25, 13
  br i1 %385, label %when_case_42, label %when_next_43
when_case_42:
  %386 = load i64*, i64** %ptr_instr
  %387 = getelementptr inbounds i64, i64* %386, i64 1
  %388 = bitcast i64* %387 to i64***
  %389 = load i64**, i64*** %388, align 8
  store i64** %389, i64** %372
  %390 = load i64*, i64** %ptr_instr
  %391 = getelementptr inbounds i64, i64* %390, i64 2
  %392 = bitcast i64* %391 to i64***
  %393 = load i64**, i64*** %392, align 8
  store i64** %393, i64*** %ptr_val
  %394 = load i64**, i64*** %ptr_res
  %395 = bitcast i64** %394 to i64*
  %396 = getelementptr inbounds i64, i64* %395, i64 0
  %397 = bitcast i64* %396 to i8**
  %398 = load i8*, i8** %397, align 8
  %399 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %399, i8* %398, i64** %372)
  %400 = load i64**, i64*** %ptr_res
  %401 = bitcast i64** %400 to i64*
  %402 = getelementptr inbounds i64, i64* %401, i64 0
  %403 = bitcast i64* %402 to i8**
  %404 = load i8*, i8** %403, align 8
  %405 = load i64**, i64*** %ptr_opt
  %406 = load i64**, i64*** %ptr_val
  call void @add_use(i64** %405, i8* %404, i64** %406)
  br label %when_end_0
when_next_43:
  %407 = icmp eq i64 %25, 9
  br i1 %407, label %when_case_44, label %when_next_45
when_case_44:
  %408 = load i64*, i64** %ptr_instr
  %409 = getelementptr inbounds i64, i64* %408, i64 1
  %410 = bitcast i64* %409 to i64***
  %411 = load i64**, i64*** %410, align 8
  store i64** %411, i64** %30
  %412 = load i64*, i64** %ptr_instr
  %413 = getelementptr inbounds i64, i64* %412, i64 3
  %414 = bitcast i64* %413 to i64***
  %415 = load i64**, i64*** %414, align 8
  store i64** %415, i64** %177
  store i64 0, i64* %ptr_i
  br label %while_cond_46
while_cond_46:
  %416 = bitcast i64** %177 to i64*
  %417 = getelementptr inbounds i64, i64* %416, i64 1
  %418 = bitcast i64* %417 to i64*
  %419 = load i64, i64* %418, align 8
  %420 = load i64, i64* %ptr_i
  %421 = icmp slt i64 %420, %419
  br i1 %421, label %while_body_47, label %while_end_48
while_body_47:
  %422 = load i64, i64* %ptr_i
  %423 = call i64* @list_get_IROperand(i64** %177, i64 %422)
  store i64* %423, i8** %ptr_a
  %424 = call i8* @malloc(i64 8)
  %425 = bitcast i8* %424 to i64*
  store i64* %425, i64*** %ptr_a_ptr
  %426 = load i64**, i64*** %ptr_a_ptr
  %427 = load i8*, i8** %ptr_a
  store i8* %427, i64** %426
  %428 = load i64**, i64*** %ptr_res
  %429 = bitcast i64** %428 to i64*
  %430 = getelementptr inbounds i64, i64* %429, i64 0
  %431 = bitcast i64* %430 to i8**
  %432 = load i8*, i8** %431, align 8
  %433 = load i64**, i64*** %ptr_opt
  %434 = load i64**, i64*** %ptr_a_ptr
  call void @add_use(i64** %433, i8* %432, i64** %434)
  %435 = load i64, i64* %ptr_i
  %436 = add nsw i64 %435, 1
  store i64 %436, i64* %ptr_i
  br label %while_cond_46
while_end_48:
  %437 = load i64**, i64*** %ptr_res
  %438 = bitcast i64** %437 to i64*
  %439 = getelementptr inbounds i64, i64* %438, i64 1
  %440 = bitcast i64* %439 to i8**
  %441 = load i8*, i8** %440, align 8
  %442 = load i64**, i64*** %ptr_opt
  call void @add_def(i64** %442, i8* %441, i64** %30)
  br label %when_end_0
when_next_45:
  %443 = icmp eq i64 %25, 6
  br i1 %443, label %when_case_49, label %when_next_50
when_case_49:
  %444 = load i64*, i64** %ptr_instr
  %445 = getelementptr inbounds i64, i64* %444, i64 1
  %446 = bitcast i64* %445 to i64***
  %447 = load i64**, i64*** %446, align 8
  store i64** %447, i64** %372
  %448 = load i64**, i64*** %ptr_res
  %449 = bitcast i64** %448 to i64*
  %450 = getelementptr inbounds i64, i64* %449, i64 0
  %451 = bitcast i64* %450 to i8**
  %452 = load i8*, i8** %451, align 8
  %453 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %453, i8* %452, i64** %372)
  br label %when_end_0
when_next_50:
  %454 = icmp eq i64 %25, 14
  br i1 %454, label %when_case_51, label %when_next_52
when_case_51:
  %455 = load i64*, i64** %ptr_instr
  %456 = getelementptr inbounds i64, i64* %455, i64 1
  %457 = bitcast i64* %456 to i64***
  %458 = load i64**, i64*** %457, align 8
  store i64** %458, i64** %30
  %459 = load i64*, i64** %ptr_instr
  %460 = getelementptr inbounds i64, i64* %459, i64 2
  %461 = bitcast i64* %460 to i64***
  %462 = load i64**, i64*** %461, align 8
  store i64** %462, i64** %372
  %463 = load i64**, i64*** %ptr_res
  %464 = bitcast i64** %463 to i64*
  %465 = getelementptr inbounds i64, i64* %464, i64 0
  %466 = bitcast i64* %465 to i8**
  %467 = load i8*, i8** %466, align 8
  %468 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %468, i8* %467, i64** %372)
  %469 = load i64**, i64*** %ptr_res
  %470 = bitcast i64** %469 to i64*
  %471 = getelementptr inbounds i64, i64* %470, i64 1
  %472 = bitcast i64* %471 to i8**
  %473 = load i8*, i8** %472, align 8
  %474 = load i64**, i64*** %ptr_opt
  call void @add_def(i64** %474, i8* %473, i64** %30)
  br label %when_end_0
when_next_52:
  %475 = icmp eq i64 %25, 15
  br i1 %475, label %when_case_53, label %when_next_54
when_case_53:
  %476 = load i64*, i64** %ptr_instr
  %477 = getelementptr inbounds i64, i64* %476, i64 1
  %478 = bitcast i64* %477 to i64***
  %479 = load i64**, i64*** %478, align 8
  store i64** %479, i64** %372
  %480 = load i64*, i64** %ptr_instr
  %481 = getelementptr inbounds i64, i64* %480, i64 3
  %482 = bitcast i64* %481 to i64***
  %483 = load i64**, i64*** %482, align 8
  store i64** %483, i64*** %ptr_val
  %484 = load i64**, i64*** %ptr_res
  %485 = bitcast i64** %484 to i64*
  %486 = getelementptr inbounds i64, i64* %485, i64 0
  %487 = bitcast i64* %486 to i8**
  %488 = load i8*, i8** %487, align 8
  %489 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %489, i8* %488, i64** %372)
  %490 = load i64**, i64*** %ptr_res
  %491 = bitcast i64** %490 to i64*
  %492 = getelementptr inbounds i64, i64* %491, i64 0
  %493 = bitcast i64* %492 to i8**
  %494 = load i8*, i8** %493, align 8
  %495 = load i64**, i64*** %ptr_opt
  %496 = load i64**, i64*** %ptr_val
  call void @add_use(i64** %495, i8* %494, i64** %496)
  br label %when_end_0
when_next_54:
  %497 = icmp eq i64 %25, 18
  br i1 %497, label %when_case_55, label %when_next_56
when_case_55:
  %498 = load i64*, i64** %ptr_instr
  %499 = getelementptr inbounds i64, i64* %498, i64 1
  %500 = bitcast i64* %499 to i64***
  %501 = load i64**, i64*** %500, align 8
  store i64** %501, i64** %30
  %502 = load i64*, i64** %ptr_instr
  %503 = getelementptr inbounds i64, i64* %502, i64 2
  %504 = bitcast i64* %503 to i64***
  %505 = load i64**, i64*** %504, align 8
  %506 = load i64*, i64** %ptr_instr
  %507 = getelementptr inbounds i64, i64* %506, i64 3
  %508 = bitcast i64* %507 to i64*
  %509 = load i64, i64* %508, align 8
  store i64 %509, i64 %297
  %510 = load i64**, i64*** %ptr_res
  %511 = bitcast i64** %510 to i64*
  %512 = getelementptr inbounds i64, i64* %511, i64 0
  %513 = bitcast i64* %512 to i8**
  %514 = load i8*, i8** %513, align 8
  %515 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %515, i8* %514, i64** %505)
  %516 = load i64**, i64*** %ptr_res
  %517 = bitcast i64** %516 to i64*
  %518 = getelementptr inbounds i64, i64* %517, i64 0
  %519 = bitcast i64* %518 to i8**
  %520 = load i8*, i8** %519, align 8
  %521 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %521, i8* %520, i64 %297)
  %522 = load i64**, i64*** %ptr_res
  %523 = bitcast i64** %522 to i64*
  %524 = getelementptr inbounds i64, i64* %523, i64 1
  %525 = bitcast i64* %524 to i8**
  %526 = load i8*, i8** %525, align 8
  %527 = load i64**, i64*** %ptr_opt
  call void @add_def(i64** %527, i8* %526, i64** %30)
  br label %when_end_0
when_next_56:
  %528 = icmp eq i64 %25, 19
  br i1 %528, label %when_case_57, label %when_next_58
when_case_57:
  %529 = load i64*, i64** %ptr_instr
  %530 = getelementptr inbounds i64, i64* %529, i64 1
  %531 = bitcast i64* %530 to i64***
  %532 = load i64**, i64*** %531, align 8
  store i64** %532, i64** %30
  %533 = load i64*, i64** %ptr_instr
  %534 = getelementptr inbounds i64, i64* %533, i64 2
  %535 = bitcast i64* %534 to i64***
  %536 = load i64**, i64*** %535, align 8
  store i64** %536, i64** %505
  %537 = load i64*, i64** %ptr_instr
  %538 = getelementptr inbounds i64, i64* %537, i64 3
  %539 = bitcast i64* %538 to i64***
  %540 = load i64**, i64*** %539, align 8
  store i64** %540, i64** %221
  %541 = load i64*, i64** %ptr_instr
  %542 = getelementptr inbounds i64, i64* %541, i64 4
  %543 = bitcast i64* %542 to i64***
  %544 = load i64**, i64*** %543, align 8
  store i64** %544, i64** %225
  %545 = load i64**, i64*** %ptr_res
  %546 = bitcast i64** %545 to i64*
  %547 = getelementptr inbounds i64, i64* %546, i64 0
  %548 = bitcast i64* %547 to i8**
  %549 = load i8*, i8** %548, align 8
  %550 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %550, i8* %549, i64** %505)
  %551 = load i64**, i64*** %ptr_res
  %552 = bitcast i64** %551 to i64*
  %553 = getelementptr inbounds i64, i64* %552, i64 0
  %554 = bitcast i64* %553 to i8**
  %555 = load i8*, i8** %554, align 8
  %556 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %556, i8* %555, i64** %221)
  %557 = load i64**, i64*** %ptr_res
  %558 = bitcast i64** %557 to i64*
  %559 = getelementptr inbounds i64, i64* %558, i64 0
  %560 = bitcast i64* %559 to i8**
  %561 = load i8*, i8** %560, align 8
  %562 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %562, i8* %561, i64** %225)
  %563 = load i64**, i64*** %ptr_res
  %564 = bitcast i64** %563 to i64*
  %565 = getelementptr inbounds i64, i64* %564, i64 1
  %566 = bitcast i64* %565 to i8**
  %567 = load i8*, i8** %566, align 8
  %568 = load i64**, i64*** %ptr_opt
  call void @add_def(i64** %568, i8* %567, i64** %30)
  br label %when_end_0
when_next_58:
  %569 = icmp eq i64 %25, 20
  br i1 %569, label %when_case_59, label %when_next_60
when_case_59:
  %570 = load i64*, i64** %ptr_instr
  %571 = getelementptr inbounds i64, i64* %570, i64 1
  %572 = bitcast i64* %571 to i64***
  %573 = load i64**, i64*** %572, align 8
  store i64** %573, i64** %30
  %574 = load i64*, i64** %ptr_instr
  %575 = getelementptr inbounds i64, i64* %574, i64 2
  %576 = bitcast i64* %575 to i64***
  %577 = load i64**, i64*** %576, align 8
  store i64** %577, i64** %77
  %578 = load i64*, i64** %ptr_instr
  %579 = getelementptr inbounds i64, i64* %578, i64 3
  %580 = bitcast i64* %579 to i64***
  %581 = load i64**, i64*** %580, align 8
  store i64** %581, i64** %81
  %582 = load i64**, i64*** %ptr_res
  %583 = bitcast i64** %582 to i64*
  %584 = getelementptr inbounds i64, i64* %583, i64 0
  %585 = bitcast i64* %584 to i8**
  %586 = load i8*, i8** %585, align 8
  %587 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %587, i8* %586, i64** %77)
  %588 = load i64**, i64*** %ptr_res
  %589 = bitcast i64** %588 to i64*
  %590 = getelementptr inbounds i64, i64* %589, i64 0
  %591 = bitcast i64* %590 to i8**
  %592 = load i8*, i8** %591, align 8
  %593 = load i64**, i64*** %ptr_opt
  call void @add_use(i64** %593, i8* %592, i64** %81)
  %594 = load i64**, i64*** %ptr_res
  %595 = bitcast i64** %594 to i64*
  %596 = getelementptr inbounds i64, i64* %595, i64 1
  %597 = bitcast i64* %596 to i8**
  %598 = load i8*, i8** %597, align 8
  %599 = load i64**, i64*** %ptr_opt
  call void @add_def(i64** %599, i8* %598, i64** %30)
  br label %when_end_0
when_next_60:
  br label %when_end_0
when_end_0:
  %600 = load i64**, i64*** %ptr_res
  ret i64** %600
unreachable_61:
  ret i64** null
}

define i64 @get_block_index(i64** noalias %param_func, i8* noalias %param_name) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_func, i64*** %ptr_func
  store i8* %param_name, i8** %ptr_name
  store i64 0, i64* %ptr_i
  br label %while_cond_0
while_cond_0:
  %1 = load i64**, i64*** %ptr_func
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 3
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = load i64, i64* %ptr_i
  %11 = icmp slt i64 %10, %9
  br i1 %11, label %while_body_1, label %while_end_2
while_body_1:
  %12 = load i64**, i64*** %ptr_func
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 3
  %15 = bitcast i64* %14 to i8**
  %16 = load i8*, i8** %15, align 8
  %17 = load i64, i64* %ptr_i
  %18 = call i64* @list_get_BasicBlock(i8* %16, i64 %17)
  store i64* %18, i1* %ptr_b
  %19 = load i1, i1* %ptr_b
  %20 = bitcast i1 %19 to i64*
  %21 = getelementptr inbounds i64, i64* %20, i64 0
  %22 = bitcast i64* %21 to i8**
  %23 = load i8*, i8** %22, align 8
  %24 = load i8*, i8** %ptr_name
  %25 = call i1 @string_eq(i8* %23, i8* %24)
  br i1 %25, label %then_3, label %end_if_4
then_3:
  %26 = load i64, i64* %ptr_i
  ret i64 %26
unreachable_5:
  br label %end_if_4
end_if_4:
  %27 = load i64, i64* %ptr_i
  %28 = add nsw i64 %27, 1
  store i64 %28, i64* %ptr_i
  br label %while_cond_0
while_end_2:
  %29 = sub nsw i64 0, 1
  ret i64 %29
unreachable_6:
  ret i64 0
}

define void @optimizer_run_liveness_and_dce(i64** noalias %param_opt, i64** noalias %param_func) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_opt, i64*** %ptr_opt
  store i64** %param_func, i64*** %ptr_func
  %1 = load i64**, i64*** %ptr_func
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 3
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  store i64 %9, i64* %ptr_num_blocks
  %10 = load i64, i64* %ptr_num_blocks
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %then_0, label %end_if_1
then_0:
  ret void
unreachable_2:
  br label %end_if_1
end_if_1:
  %12 = call i8* @malloc(i64 8)
  %13 = bitcast i8* %12 to i64*
  store i64* %13, i64** %ptr_dummy_int
  %14 = load i64*, i64** %ptr_dummy_int
  store i64 0, i64* %14
  %15 = load i64*, i64** %ptr_dummy_int
  %16 = call i64** @new_list_Int(i64 1, i64* %15)
  store i64** %16, i64*** %ptr_dummy_int_list
  %17 = call i8* @malloc(i64 8)
  %18 = bitcast i8* %17 to i64*
  store i64* %18, i64*** %ptr_dummy_succ
  %19 = load i64**, i64*** %ptr_dummy_succ
  %20 = load i64**, i64*** %ptr_dummy_int_list
  %21 = bitcast i64** %19 to i64*
  %22 = getelementptr inbounds i64, i64* %21, i64 0
  %23 = bitcast i64* %22 to i64***
  store i64** %20, i64*** %23, align 8
  %24 = load i64, i64* %ptr_num_blocks
  %25 = load i64**, i64*** %ptr_dummy_succ
  %26 = call i64** @new_list_IntListPtr(i64 %24, i64** %25)
  store i64** %26, i64*** %ptr_succs
  %27 = call i8* @malloc(i64 8)
  %28 = bitcast i8* %27 to i64*
  store i64* %28, i64*** %ptr_dummy_set
  %29 = call i64** @new_string_set()
  %30 = call i64** @new_string_set()
  %31 = load i64**, i64*** %ptr_dummy_set
  %32 = bitcast i64** %31 to i64*
  %33 = getelementptr inbounds i64, i64* %32, i64 0
  %34 = bitcast i64* %33 to i64***
  store i64** %30, i64*** %34, align 8
  %35 = load i64, i64* %ptr_num_blocks
  %36 = load i64**, i64*** %ptr_dummy_set
  %37 = call i64** @new_list_StringSetPtr(i64 %35, i64** %36)
  store i64** %37, i64*** %ptr_def_sets
  %38 = load i64, i64* %ptr_num_blocks
  %39 = load i64**, i64*** %ptr_dummy_set
  %40 = call i64** @new_list_StringSetPtr(i64 %38, i64** %39)
  store i64** %40, i64*** %ptr_use_sets
  %41 = load i64, i64* %ptr_num_blocks
  %42 = load i64**, i64*** %ptr_dummy_set
  %43 = call i64** @new_list_StringSetPtr(i64 %41, i64** %42)
  store i64** %43, i64*** %ptr_in_sets
  %44 = load i64, i64* %ptr_num_blocks
  %45 = load i64**, i64*** %ptr_dummy_set
  %46 = call i64** @new_list_StringSetPtr(i64 %44, i64** %45)
  store i64** %46, i64*** %ptr_out_sets
  store i64 0, i1* %ptr_b
  br label %while_cond_3
while_cond_3:
  %47 = load i1, i1* %ptr_b
  %48 = load i64, i64* %ptr_num_blocks
  %49 = icmp slt i1 %47, %48
  br i1 %49, label %while_body_4, label %while_end_5
while_body_4:
  %50 = load i64**, i64*** %ptr_func
  %51 = bitcast i64** %50 to i64*
  %52 = getelementptr inbounds i64, i64* %51, i64 3
  %53 = bitcast i64* %52 to i8**
  %54 = load i8*, i8** %53, align 8
  %55 = load i1, i1* %ptr_b
  %56 = call i64* @list_get_BasicBlock(i8* %54, i1 %55)
  store i64* %56, i64** %ptr_block
  %57 = load i64*, i64** %ptr_dummy_int
  %58 = call i64** @new_list_Int(i64 2, i64* %57)
  store i64** %58, i64*** %ptr_s_list
  %59 = load i64*, i64** %ptr_block
  %60 = bitcast i64* %59 to i64*
  %61 = getelementptr inbounds i64, i64* %60, i64 2
  %62 = bitcast i64* %61 to i8**
  %63 = load i8*, i8** %62, align 8
  %64 = getelementptr inbounds i64, i8* %63, i64 0
  %65 = bitcast i64* %64 to i64*
  %66 = load i64, i64* %65, align 8
  %67 = icmp eq i64 %66, 0
  br i1 %67, label %when_case_7, label %when_next_8
when_case_7:
  %68 = getelementptr inbounds i64, i8* %63, i64 1
  %69 = bitcast i64* %68 to i8**
  %70 = load i8*, i8** %69, align 8
  %71 = load i64**, i64*** %ptr_func
  %72 = call i64 @get_block_index(i64** %71, i8* %70)
  store i64 %72, i64*** %ptr_idx
  %73 = load i64**, i64*** %ptr_idx
  %74 = icmp sge i64** %73, 0
  br i1 %74, label %then_9, label %end_if_10
then_9:
  %75 = load i64**, i64*** %ptr_s_list
  %76 = load i64**, i64*** %ptr_idx
  call void @list_push_Int(i64** %75, i64** %76)
  br label %end_if_10
end_if_10:
  br label %when_end_6
when_next_8:
  %77 = icmp eq i64 %66, 1
  br i1 %77, label %when_case_11, label %when_next_12
when_case_11:
  %78 = getelementptr inbounds i64, i8* %63, i64 2
  %79 = bitcast i64* %78 to i8**
  %80 = load i8*, i8** %79, align 8
  %81 = getelementptr inbounds i64, i8* %63, i64 3
  %82 = bitcast i64* %81 to i8**
  %83 = load i8*, i8** %82, align 8
  %84 = load i64**, i64*** %ptr_func
  %85 = call i64 @get_block_index(i64** %84, i8* %80)
  store i64 %85, i64* %ptr_idx_t
  %86 = load i64**, i64*** %ptr_func
  %87 = call i64 @get_block_index(i64** %86, i8* %83)
  store i64 %87, i64* %ptr_idx_f
  %88 = load i64, i64* %ptr_idx_t
  %89 = icmp sge i64 %88, 0
  br i1 %89, label %then_13, label %end_if_14
then_13:
  %90 = load i64**, i64*** %ptr_s_list
  %91 = load i64, i64* %ptr_idx_t
  call void @list_push_Int(i64** %90, i64 %91)
  br label %end_if_14
end_if_14:
  %92 = load i64, i64* %ptr_idx_f
  %93 = icmp sge i64 %92, 0
  br i1 %93, label %then_15, label %end_if_16
then_15:
  %94 = load i64**, i64*** %ptr_s_list
  %95 = load i64, i64* %ptr_idx_f
  call void @list_push_Int(i64** %94, i64 %95)
  br label %end_if_16
end_if_16:
  br label %when_end_6
when_next_12:
  %96 = icmp eq i64 %66, 4
  br i1 %96, label %when_case_17, label %when_next_18
when_case_17:
  br label %when_end_6
when_next_18:
  %97 = icmp eq i64 %66, 3
  br i1 %97, label %when_case_19, label %when_next_20
when_case_19:
  br label %when_end_6
when_next_20:
  br label %when_end_6
when_end_6:
  %98 = call i8* @malloc(i64 8)
  %99 = bitcast i8* %98 to i64*
  store i64* %99, i64*** %ptr_s_wrapper
  %100 = load i64**, i64*** %ptr_s_wrapper
  %101 = load i64**, i64*** %ptr_s_list
  %102 = bitcast i64** %100 to i64*
  %103 = getelementptr inbounds i64, i64* %102, i64 0
  %104 = bitcast i64* %103 to i64***
  store i64** %101, i64*** %104, align 8
  %105 = load i64**, i64*** %ptr_s_wrapper
  %106 = load i64*, i64** %105
  %107 = load i64**, i64*** %ptr_succs
  %108 = load i1, i1* %ptr_b
  call void @list_set_IntListPtr(i64** %107, i1 %108, i64* %106)
  %109 = call i64** @new_string_set()
  store i64** %109, i64*** %ptr_b_def
  %110 = call i64** @new_string_set()
  store i64** %110, i64*** %ptr_b_use
  store i64 0, i64* %ptr_i
  br label %while_cond_21
while_cond_21:
  %111 = load i64*, i64** %ptr_block
  %112 = bitcast i64* %111 to i64*
  %113 = getelementptr inbounds i64, i64* %112, i64 1
  %114 = bitcast i64* %113 to i8**
  %115 = load i8*, i8** %114, align 8
  %116 = bitcast i8* %115 to i64*
  %117 = getelementptr inbounds i64, i64* %116, i64 1
  %118 = bitcast i64* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = load i64, i64* %ptr_i
  %121 = icmp slt i64 %120, %119
  br i1 %121, label %while_body_22, label %while_end_23
while_body_22:
  %122 = load i64*, i64** %ptr_block
  %123 = bitcast i64* %122 to i64*
  %124 = getelementptr inbounds i64, i64* %123, i64 1
  %125 = bitcast i64* %124 to i8**
  %126 = load i8*, i8** %125, align 8
  %127 = load i64, i64* %ptr_i
  %128 = call i64* @list_get_IRInstruction(i8* %126, i64 %127)
  store i64* %128, i64** %ptr_instr
  %129 = load i64**, i64*** %ptr_opt
  %130 = load i64*, i64** %ptr_instr
  %131 = call i64** @instr_use_def(i64** %129, i64* %130)
  store i64** %131, i64*** %ptr_ud
  store i64 0, i64* %ptr_u_idx
  br label %while_cond_24
while_cond_24:
  %132 = load i64**, i64*** %ptr_ud
  %133 = bitcast i64** %132 to i64*
  %134 = getelementptr inbounds i64, i64* %133, i64 0
  %135 = bitcast i64* %134 to i8**
  %136 = load i8*, i8** %135, align 8
  %137 = bitcast i8* %136 to i64*
  %138 = getelementptr inbounds i64, i64* %137, i64 1
  %139 = bitcast i64* %138 to i64*
  %140 = load i64, i64* %139, align 8
  %141 = load i64, i64* %ptr_u_idx
  %142 = icmp slt i64 %141, %140
  br i1 %142, label %while_body_25, label %while_end_26
while_body_25:
  %143 = load i64**, i64*** %ptr_ud
  %144 = bitcast i64** %143 to i64*
  %145 = getelementptr inbounds i64, i64* %144, i64 0
  %146 = bitcast i64* %145 to i8**
  %147 = load i8*, i8** %146, align 8
  %148 = load i64, i64* %ptr_u_idx
  %149 = call i8* @list_get_String(i8* %147, i64 %148)
  store i8* %149, i8** %ptr_u
  %150 = load i64**, i64*** %ptr_b_def
  %151 = load i8*, i8** %ptr_u
  %152 = call i1 @string_set_contains(i64** %150, i8* %151)
  %153 = xor i1 %152, 1
  br i1 %153, label %then_27, label %end_if_28
then_27:
  %154 = load i64**, i64*** %ptr_b_use
  %155 = load i8*, i8** %ptr_u
  call void @string_set_add(i64** %154, i8* %155)
  br label %end_if_28
end_if_28:
  %156 = load i64, i64* %ptr_u_idx
  %157 = add nsw i64 %156, 1
  store i64 %157, i64* %ptr_u_idx
  br label %while_cond_24
while_end_26:
  store i64 0, i64* %ptr_d_idx
  br label %while_cond_29
while_cond_29:
  %158 = load i64**, i64*** %ptr_ud
  %159 = bitcast i64** %158 to i64*
  %160 = getelementptr inbounds i64, i64* %159, i64 1
  %161 = bitcast i64* %160 to i8**
  %162 = load i8*, i8** %161, align 8
  %163 = bitcast i8* %162 to i64*
  %164 = getelementptr inbounds i64, i64* %163, i64 1
  %165 = bitcast i64* %164 to i64*
  %166 = load i64, i64* %165, align 8
  %167 = load i64, i64* %ptr_d_idx
  %168 = icmp slt i64 %167, %166
  br i1 %168, label %while_body_30, label %while_end_31
while_body_30:
  %169 = load i64**, i64*** %ptr_ud
  %170 = bitcast i64** %169 to i64*
  %171 = getelementptr inbounds i64, i64* %170, i64 1
  %172 = bitcast i64* %171 to i8**
  %173 = load i8*, i8** %172, align 8
  %174 = load i64, i64* %ptr_d_idx
  %175 = call i8* @list_get_String(i8* %173, i64 %174)
  store i8* %175, i8** %ptr_d
  %176 = load i64**, i64*** %ptr_b_def
  %177 = load i8*, i8** %ptr_d
  call void @string_set_add(i64** %176, i8* %177)
  %178 = load i64, i64* %ptr_d_idx
  %179 = add nsw i64 %178, 1
  store i64 %179, i64* %ptr_d_idx
  br label %while_cond_29
while_end_31:
  %180 = load i64, i64* %ptr_i
  %181 = add nsw i64 %180, 1
  store i64 %181, i64* %ptr_i
  br label %while_cond_21
while_end_23:
  %182 = load i64*, i64** %ptr_block
  %183 = bitcast i64* %182 to i64*
  %184 = getelementptr inbounds i64, i64* %183, i64 2
  %185 = bitcast i64* %184 to i8**
  %186 = load i8*, i8** %185, align 8
  %187 = getelementptr inbounds i64, i8* %186, i64 0
  %188 = bitcast i64* %187 to i64*
  %189 = load i64, i64* %188, align 8
  %190 = icmp eq i64 %189, 1
  br i1 %190, label %when_case_33, label %when_next_34
when_case_33:
  %191 = getelementptr inbounds i64, i8* %186, i64 1
  %192 = bitcast i64* %191 to i64***
  %193 = load i64**, i64*** %192, align 8
  %194 = load i64**, i64*** %ptr_opt
  %195 = call i8* @operand_to_var(i64** %194, i64** %193)
  store i8* %195, i8** %ptr_u
  %196 = load i8*, i8** %ptr_u
  %197 = call i1 @string_eq(i8* %196, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.15, i64 0, i64 0))
  %198 = xor i1 %197, 1
  %199 = load i64**, i64*** %ptr_b_def
  %200 = load i8*, i8** %ptr_u
  %201 = call i1 @string_set_contains(i64** %199, i8* %200)
  %202 = xor i1 %201, 1
  %203 = and i1 %198, %202
  br i1 %203, label %then_35, label %end_if_36
then_35:
  %204 = load i64**, i64*** %ptr_b_use
  %205 = load i8*, i8** %ptr_u
  call void @string_set_add(i64** %204, i8* %205)
  br label %end_if_36
end_if_36:
  br label %when_end_32
when_next_34:
  %206 = icmp eq i64 %189, 4
  br i1 %206, label %when_case_37, label %when_next_38
when_case_37:
  %207 = getelementptr inbounds i64, i8* %186, i64 1
  %208 = bitcast i64* %207 to i64***
  %209 = load i64**, i64*** %208, align 8
  %210 = icmp ne i64** %209, null
  br i1 %210, label %then_39, label %end_if_40
then_39:
  store i64** %209, i64*** %ptr_val
  %211 = load i64**, i64*** %ptr_opt
  %212 = load i64**, i64*** %ptr_val
  %213 = call i8* @operand_to_var(i64** %211, i64** %212)
  store i8* %213, i8** %ptr_u
  %214 = load i8*, i8** %ptr_u
  %215 = call i1 @string_eq(i8* %214, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.16, i64 0, i64 0))
  %216 = xor i1 %215, 1
  %217 = load i64**, i64*** %ptr_b_def
  %218 = load i8*, i8** %ptr_u
  %219 = call i1 @string_set_contains(i64** %217, i8* %218)
  %220 = xor i1 %219, 1
  %221 = and i1 %216, %220
  br i1 %221, label %then_41, label %end_if_42
then_41:
  %222 = load i64**, i64*** %ptr_b_use
  %223 = load i8*, i8** %ptr_u
  call void @string_set_add(i64** %222, i8* %223)
  br label %end_if_42
end_if_42:
  br label %end_if_40
end_if_40:
  br label %when_end_32
when_next_38:
  %224 = icmp eq i64 %189, 0
  br i1 %224, label %when_case_43, label %when_next_44
when_case_43:
  br label %when_end_32
when_next_44:
  %225 = icmp eq i64 %189, 3
  br i1 %225, label %when_case_45, label %when_next_46
when_case_45:
  br label %when_end_32
when_next_46:
  br label %when_end_32
when_end_32:
  %226 = call i8* @malloc(i64 8)
  %227 = bitcast i8* %226 to i64*
  store i64* %227, i64** %ptr_def_wrapper
  %228 = load i64*, i64** %ptr_def_wrapper
  %229 = load i64**, i64*** %ptr_b_def
  %230 = bitcast i64* %228 to i64*
  %231 = getelementptr inbounds i64, i64* %230, i64 0
  %232 = bitcast i64* %231 to i64***
  store i64** %229, i64*** %232, align 8
  %233 = load i64*, i64** %ptr_def_wrapper
  %234 = load i64, i64* %233
  %235 = load i64**, i64*** %ptr_def_sets
  %236 = load i1, i1* %ptr_b
  call void @list_set_StringSetPtr(i64** %235, i1 %236, i64 %234)
  %237 = call i8* @malloc(i64 8)
  %238 = bitcast i8* %237 to i64*
  store i64* %238, i64** %ptr_use_wrapper
  %239 = load i64*, i64** %ptr_use_wrapper
  %240 = load i64**, i64*** %ptr_b_use
  %241 = bitcast i64* %239 to i64*
  %242 = getelementptr inbounds i64, i64* %241, i64 0
  %243 = bitcast i64* %242 to i64***
  store i64** %240, i64*** %243, align 8
  %244 = load i64*, i64** %ptr_use_wrapper
  %245 = load i64, i64* %244
  %246 = load i64**, i64*** %ptr_use_sets
  %247 = load i1, i1* %ptr_b
  call void @list_set_StringSetPtr(i64** %246, i1 %247, i64 %245)
  %248 = call i8* @malloc(i64 8)
  %249 = bitcast i8* %248 to i64*
  store i64* %249, i64** %ptr_in_wrapper
  %250 = call i64** @new_string_set()
  %251 = call i64** @new_string_set()
  %252 = load i64*, i64** %ptr_in_wrapper
  %253 = bitcast i64* %252 to i64*
  %254 = getelementptr inbounds i64, i64* %253, i64 0
  %255 = bitcast i64* %254 to i64***
  store i64** %251, i64*** %255, align 8
  %256 = load i64*, i64** %ptr_in_wrapper
  %257 = load i64, i64* %256
  %258 = load i64**, i64*** %ptr_in_sets
  %259 = load i1, i1* %ptr_b
  call void @list_set_StringSetPtr(i64** %258, i1 %259, i64 %257)
  %260 = call i8* @malloc(i64 8)
  %261 = bitcast i8* %260 to i64*
  store i64* %261, i64** %ptr_out_wrapper
  %262 = call i64** @new_string_set()
  %263 = call i64** @new_string_set()
  %264 = load i64*, i64** %ptr_out_wrapper
  %265 = bitcast i64* %264 to i64*
  %266 = getelementptr inbounds i64, i64* %265, i64 0
  %267 = bitcast i64* %266 to i64***
  store i64** %263, i64*** %267, align 8
  %268 = load i64*, i64** %ptr_out_wrapper
  %269 = load i64, i64* %268
  %270 = load i64**, i64*** %ptr_out_sets
  %271 = load i1, i1* %ptr_b
  call void @list_set_StringSetPtr(i64** %270, i1 %271, i64 %269)
  %272 = load i1, i1* %ptr_b
  %273 = add nsw i1 %272, 1
  store i1 %273, i1* %ptr_b
  br label %while_cond_3
while_end_5:
  store i1 1, i1* %ptr_changed
  br label %while_cond_47
while_cond_47:
  %274 = load i1, i1* %ptr_changed
  br i1 %274, label %while_body_48, label %while_end_49
while_body_48:
  store i1 0, i1* %ptr_changed
  %275 = load i64, i64* %ptr_num_blocks
  %276 = sub nsw i64 %275, 1
  store i64 %276, i64* %ptr_b_idx
  br label %while_cond_50
while_cond_50:
  %277 = load i64, i64* %ptr_b_idx
  %278 = icmp sge i64 %277, 0
  br i1 %278, label %while_body_51, label %while_end_52
while_body_51:
  %279 = call i64** @new_string_set()
  store i64** %279, i64*** %ptr_new_out
  %280 = load i64**, i64*** %ptr_succs
  %281 = load i64, i64* %ptr_b_idx
  %282 = call i64* @list_get_IntListPtr(i64** %280, i64 %281)
  store i64* %282, i64** %ptr_succ_wrapper
  %283 = load i64*, i64** %ptr_succ_wrapper
  %284 = bitcast i64* %283 to i64*
  %285 = getelementptr inbounds i64, i64* %284, i64 0
  %286 = bitcast i64* %285 to i8**
  %287 = load i8*, i8** %286, align 8
  store i8* %287, i64*** %ptr_s_list
  store i64 0, i64* %ptr_s_i
  br label %while_cond_53
while_cond_53:
  %288 = load i64**, i64*** %ptr_s_list
  %289 = bitcast i64** %288 to i64*
  %290 = getelementptr inbounds i64, i64* %289, i64 1
  %291 = bitcast i64* %290 to i64*
  %292 = load i64, i64* %291, align 8
  %293 = load i64, i64* %ptr_s_i
  %294 = icmp slt i64 %293, %292
  br i1 %294, label %while_body_54, label %while_end_55
while_body_54:
  %295 = load i64**, i64*** %ptr_s_list
  %296 = load i64, i64* %ptr_s_i
  %297 = call i64 @list_get_Int(i64** %295, i64 %296)
  store i64 %297, i64* %ptr_s_val
  %298 = load i64**, i64*** %ptr_in_sets
  %299 = load i64, i64* %ptr_s_val
  %300 = call i64* @list_get_StringSetPtr(i64** %298, i64 %299)
  store i64* %300, i64** %ptr_in_wrapper
  %301 = load i64*, i64** %ptr_in_wrapper
  %302 = bitcast i64* %301 to i64*
  %303 = getelementptr inbounds i64, i64* %302, i64 0
  %304 = bitcast i64* %303 to i8**
  %305 = load i8*, i8** %304, align 8
  store i8* %305, i64*** %ptr_s_in
  store i64 0, i64* %ptr_v_i
  br label %while_cond_56
while_cond_56:
  %306 = load i64**, i64*** %ptr_s_in
  %307 = bitcast i64** %306 to i64*
  %308 = getelementptr inbounds i64, i64* %307, i64 0
  %309 = bitcast i64* %308 to i8**
  %310 = load i8*, i8** %309, align 8
  %311 = bitcast i8* %310 to i64*
  %312 = getelementptr inbounds i64, i64* %311, i64 1
  %313 = bitcast i64* %312 to i64*
  %314 = load i64, i64* %313, align 8
  %315 = load i64, i64* %ptr_v_i
  %316 = icmp slt i64 %315, %314
  br i1 %316, label %while_body_57, label %while_end_58
while_body_57:
  %317 = load i64**, i64*** %ptr_s_in
  %318 = bitcast i64** %317 to i64*
  %319 = getelementptr inbounds i64, i64* %318, i64 0
  %320 = bitcast i64* %319 to i8**
  %321 = load i8*, i8** %320, align 8
  %322 = load i64, i64* %ptr_v_i
  %323 = call i8* @list_get_String(i8* %321, i64 %322)
  store i8* %323, i64*** %ptr_v
  %324 = load i64**, i64*** %ptr_new_out
  %325 = load i64**, i64*** %ptr_v
  call void @string_set_add(i64** %324, i64** %325)
  %326 = load i64, i64* %ptr_v_i
  %327 = add nsw i64 %326, 1
  store i64 %327, i64* %ptr_v_i
  br label %while_cond_56
while_end_58:
  %328 = load i64, i64* %ptr_s_i
  %329 = add nsw i64 %328, 1
  store i64 %329, i64* %ptr_s_i
  br label %while_cond_53
while_end_55:
  %330 = load i64**, i64*** %ptr_out_sets
  %331 = load i64, i64* %ptr_b_idx
  %332 = call i64* @list_get_StringSetPtr(i64** %330, i64 %331)
  store i64* %332, i64** %ptr_out_wrapper
  %333 = load i64*, i64** %ptr_out_wrapper
  %334 = bitcast i64* %333 to i64*
  %335 = getelementptr inbounds i64, i64* %334, i64 0
  %336 = bitcast i64* %335 to i8**
  %337 = load i8*, i8** %336, align 8
  store i8* %337, i64*** %ptr_old_out
  %338 = load i64**, i64*** %ptr_new_out
  %339 = load i64**, i64*** %ptr_old_out
  %340 = call i1 @string_set_equals(i64** %338, i64** %339)
  %341 = xor i1 %340, 1
  br i1 %341, label %then_59, label %else_61
then_59:
  %342 = call i8* @malloc(i64 8)
  %343 = bitcast i8* %342 to i64*
  store i64* %343, i64*** %ptr_new_out_wrapper
  %344 = load i64**, i64*** %ptr_new_out_wrapper
  %345 = load i64**, i64*** %ptr_new_out
  %346 = bitcast i64** %344 to i64*
  %347 = getelementptr inbounds i64, i64* %346, i64 0
  %348 = bitcast i64* %347 to i64***
  store i64** %345, i64*** %348, align 8
  %349 = load i64**, i64*** %ptr_new_out_wrapper
  %350 = load i64*, i64** %349
  %351 = load i64**, i64*** %ptr_out_sets
  %352 = load i64, i64* %ptr_b_idx
  call void @list_set_StringSetPtr(i64** %351, i64 %352, i64* %350)
  store i1 1, i1* %ptr_changed
  br label %end_if_60
else_61:
  %353 = load i64**, i64*** %ptr_old_out
  store i64** %353, i64*** %ptr_new_out
  br label %end_if_60
end_if_60:
  %354 = load i64**, i64*** %ptr_use_sets
  %355 = load i64, i64* %ptr_b_idx
  %356 = call i64* @list_get_StringSetPtr(i64** %354, i64 %355)
  store i64* %356, i64** %ptr_use_wrapper
  %357 = load i64*, i64** %ptr_use_wrapper
  %358 = bitcast i64* %357 to i64*
  %359 = getelementptr inbounds i64, i64* %358, i64 0
  %360 = bitcast i64* %359 to i8**
  %361 = load i8*, i8** %360, align 8
  %362 = call i64** @string_set_copy(i8* %361)
  store i64** %362, i64*** %ptr_new_in
  %363 = load i64**, i64*** %ptr_def_sets
  %364 = load i64, i64* %ptr_b_idx
  %365 = call i64* @list_get_StringSetPtr(i64** %363, i64 %364)
  store i64* %365, i64** %ptr_def_wrapper
  %366 = load i64*, i64** %ptr_def_wrapper
  %367 = bitcast i64* %366 to i64*
  %368 = getelementptr inbounds i64, i64* %367, i64 0
  %369 = bitcast i64* %368 to i8**
  %370 = load i8*, i8** %369, align 8
  store i8* %370, i64*** %ptr_b_def
  store i64 0, i64* %ptr_v_i2
  br label %while_cond_62
while_cond_62:
  %371 = load i64**, i64*** %ptr_new_out
  %372 = bitcast i64** %371 to i64*
  %373 = getelementptr inbounds i64, i64* %372, i64 0
  %374 = bitcast i64* %373 to i8**
  %375 = load i8*, i8** %374, align 8
  %376 = bitcast i8* %375 to i64*
  %377 = getelementptr inbounds i64, i64* %376, i64 1
  %378 = bitcast i64* %377 to i64*
  %379 = load i64, i64* %378, align 8
  %380 = load i64, i64* %ptr_v_i2
  %381 = icmp slt i64 %380, %379
  br i1 %381, label %while_body_63, label %while_end_64
while_body_63:
  %382 = load i64**, i64*** %ptr_new_out
  %383 = bitcast i64** %382 to i64*
  %384 = getelementptr inbounds i64, i64* %383, i64 0
  %385 = bitcast i64* %384 to i8**
  %386 = load i8*, i8** %385, align 8
  %387 = load i64, i64* %ptr_v_i2
  %388 = call i8* @list_get_String(i8* %386, i64 %387)
  store i8* %388, i64*** %ptr_v
  %389 = load i64**, i64*** %ptr_b_def
  %390 = load i64**, i64*** %ptr_v
  %391 = call i1 @string_set_contains(i64** %389, i64** %390)
  %392 = xor i1 %391, 1
  br i1 %392, label %then_65, label %end_if_66
then_65:
  %393 = load i64**, i64*** %ptr_new_in
  %394 = load i64**, i64*** %ptr_v
  call void @string_set_add(i64** %393, i64** %394)
  br label %end_if_66
end_if_66:
  %395 = load i64, i64* %ptr_v_i2
  %396 = add nsw i64 %395, 1
  store i64 %396, i64* %ptr_v_i2
  br label %while_cond_62
while_end_64:
  %397 = load i64**, i64*** %ptr_in_sets
  %398 = load i64, i64* %ptr_b_idx
  %399 = call i64* @list_get_StringSetPtr(i64** %397, i64 %398)
  store i64* %399, i64** %ptr_old_in_wrapper
  %400 = load i64*, i64** %ptr_old_in_wrapper
  %401 = bitcast i64* %400 to i64*
  %402 = getelementptr inbounds i64, i64* %401, i64 0
  %403 = bitcast i64* %402 to i8**
  %404 = load i8*, i8** %403, align 8
  store i8* %404, i64*** %ptr_old_in
  %405 = load i64**, i64*** %ptr_new_in
  %406 = load i64**, i64*** %ptr_old_in
  %407 = call i1 @string_set_equals(i64** %405, i64** %406)
  %408 = xor i1 %407, 1
  br i1 %408, label %then_67, label %end_if_68
then_67:
  %409 = call i8* @malloc(i64 8)
  %410 = bitcast i8* %409 to i64*
  store i64* %410, i64*** %ptr_new_in_wrapper
  %411 = load i64**, i64*** %ptr_new_in_wrapper
  %412 = load i64**, i64*** %ptr_new_in
  %413 = bitcast i64** %411 to i64*
  %414 = getelementptr inbounds i64, i64* %413, i64 0
  %415 = bitcast i64* %414 to i64***
  store i64** %412, i64*** %415, align 8
  %416 = load i64**, i64*** %ptr_new_in_wrapper
  %417 = load i64*, i64** %416
  %418 = load i64**, i64*** %ptr_in_sets
  %419 = load i64, i64* %ptr_b_idx
  call void @list_set_StringSetPtr(i64** %418, i64 %419, i64* %417)
  store i1 1, i1* %ptr_changed
  br label %end_if_68
end_if_68:
  %420 = load i64, i64* %ptr_b_idx
  %421 = sub nsw i64 %420, 1
  store i64 %421, i64* %ptr_b_idx
  br label %while_cond_50
while_end_52:
  br label %while_cond_47
while_end_49:
  store i64 0, i1* %ptr_b
  br label %while_cond_69
while_cond_69:
  %422 = load i1, i1* %ptr_b
  %423 = load i64, i64* %ptr_num_blocks
  %424 = icmp slt i1 %422, %423
  br i1 %424, label %while_body_70, label %while_end_71
while_body_70:
  %425 = load i64**, i64*** %ptr_func
  %426 = bitcast i64** %425 to i64*
  %427 = getelementptr inbounds i64, i64* %426, i64 3
  %428 = bitcast i64* %427 to i8**
  %429 = load i8*, i8** %428, align 8
  %430 = load i1, i1* %ptr_b
  %431 = call i64* @list_get_BasicBlock(i8* %429, i1 %430)
  store i64* %431, i64** %ptr_block
  %432 = load i64**, i64*** %ptr_out_sets
  %433 = load i1, i1* %ptr_b
  %434 = call i64* @list_get_StringSetPtr(i64** %432, i1 %433)
  store i64* %434, i64** %ptr_out_wrapper
  %435 = load i64*, i64** %ptr_out_wrapper
  %436 = bitcast i64* %435 to i64*
  %437 = getelementptr inbounds i64, i64* %436, i64 0
  %438 = bitcast i64* %437 to i8**
  %439 = load i8*, i8** %438, align 8
  %440 = call i64** @string_set_copy(i8* %439)
  store i64** %440, i64*** %ptr_live_now
  %441 = load i64*, i64** %ptr_block
  %442 = bitcast i64* %441 to i64*
  %443 = getelementptr inbounds i64, i64* %442, i64 2
  %444 = bitcast i64* %443 to i8**
  %445 = load i8*, i8** %444, align 8
  %446 = getelementptr inbounds i64, i8* %445, i64 0
  %447 = bitcast i64* %446 to i64*
  %448 = load i64, i64* %447, align 8
  %449 = icmp eq i64 %448, 1
  br i1 %449, label %when_case_73, label %when_next_74
when_case_73:
  %450 = getelementptr inbounds i64, i8* %445, i64 1
  %451 = bitcast i64* %450 to i64***
  %452 = load i64**, i64*** %451, align 8
  store i64** %452, i64** %193
  %453 = load i64**, i64*** %ptr_opt
  %454 = call i8* @operand_to_var(i64** %453, i64** %193)
  store i8* %454, i8** %ptr_u
  %455 = load i8*, i8** %ptr_u
  %456 = call i1 @string_eq(i8* %455, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.17, i64 0, i64 0))
  %457 = xor i1 %456, 1
  br i1 %457, label %then_75, label %end_if_76
then_75:
  %458 = load i64**, i64*** %ptr_live_now
  %459 = load i8*, i8** %ptr_u
  call void @string_set_add(i64** %458, i8* %459)
  br label %end_if_76
end_if_76:
  br label %when_end_72
when_next_74:
  %460 = icmp eq i64 %448, 4
  br i1 %460, label %when_case_77, label %when_next_78
when_case_77:
  %461 = getelementptr inbounds i64, i8* %445, i64 1
  %462 = bitcast i64* %461 to i64***
  %463 = load i64**, i64*** %462, align 8
  store i64** %463, i64** %209
  %464 = icmp ne i64** %209, null
  br i1 %464, label %then_79, label %end_if_80
then_79:
  store i64** %209, i64*** %ptr_val
  %465 = load i64**, i64*** %ptr_opt
  %466 = load i64**, i64*** %ptr_val
  %467 = call i8* @operand_to_var(i64** %465, i64** %466)
  store i8* %467, i8** %ptr_u
  %468 = load i8*, i8** %ptr_u
  %469 = call i1 @string_eq(i8* %468, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.18, i64 0, i64 0))
  %470 = xor i1 %469, 1
  br i1 %470, label %then_81, label %end_if_82
then_81:
  %471 = load i64**, i64*** %ptr_live_now
  %472 = load i8*, i8** %ptr_u
  call void @string_set_add(i64** %471, i8* %472)
  br label %end_if_82
end_if_82:
  br label %end_if_80
end_if_80:
  br label %when_end_72
when_next_78:
  %473 = icmp eq i64 %448, 0
  br i1 %473, label %when_case_83, label %when_next_84
when_case_83:
  br label %when_end_72
when_next_84:
  %474 = icmp eq i64 %448, 3
  br i1 %474, label %when_case_85, label %when_next_86
when_case_85:
  br label %when_end_72
when_next_86:
  br label %when_end_72
when_end_72:
  %475 = call i8* @malloc(i64 8)
  %476 = bitcast i8* %475 to i64*
  store i64* %476, i64*** %ptr_dummy_instr
  %477 = load i64**, i64*** %ptr_dummy_instr
  %478 = call i64** @new_list_IRInstruction(i64 10, i64** %477)
  store i64** %478, i64*** %ptr_opt_instrs
  %479 = load i64*, i64** %ptr_block
  %480 = bitcast i64* %479 to i64*
  %481 = getelementptr inbounds i64, i64* %480, i64 1
  %482 = bitcast i64* %481 to i8**
  %483 = load i8*, i8** %482, align 8
  %484 = bitcast i8* %483 to i64*
  %485 = getelementptr inbounds i64, i64* %484, i64 1
  %486 = bitcast i64* %485 to i64*
  %487 = load i64, i64* %486, align 8
  %488 = sub nsw i64 %487, 1
  store i64 %488, i64* %ptr_inst_idx
  br label %while_cond_87
while_cond_87:
  %489 = load i64, i64* %ptr_inst_idx
  %490 = icmp sge i64 %489, 0
  br i1 %490, label %while_body_88, label %while_end_89
while_body_88:
  %491 = load i64*, i64** %ptr_block
  %492 = bitcast i64* %491 to i64*
  %493 = getelementptr inbounds i64, i64* %492, i64 1
  %494 = bitcast i64* %493 to i8**
  %495 = load i8*, i8** %494, align 8
  %496 = load i64, i64* %ptr_inst_idx
  %497 = call i64* @list_get_IRInstruction(i8* %495, i64 %496)
  store i64* %497, i64** %ptr_instr
  %498 = load i64**, i64*** %ptr_opt
  %499 = load i64*, i64** %ptr_instr
  %500 = call i64** @instr_use_def(i64** %498, i64* %499)
  store i64** %500, i64*** %ptr_ud
  store i1 0, i1* %ptr_has_side_effects
  %501 = load i64*, i64** %ptr_instr
  %502 = getelementptr inbounds i64, i64* %501, i64 0
  %503 = bitcast i64* %502 to i64*
  %504 = load i64, i64* %503, align 8
  %505 = icmp eq i64 %504, 3
  br i1 %505, label %when_case_91, label %when_next_92
when_case_91:
  store i1 1, i1* %ptr_has_side_effects
  br label %when_end_90
when_next_92:
  %506 = icmp eq i64 %504, 4
  br i1 %506, label %when_case_93, label %when_next_94
when_case_93:
  store i1 1, i1* %ptr_has_side_effects
  br label %when_end_90
when_next_94:
  %507 = icmp eq i64 %504, 6
  br i1 %507, label %when_case_95, label %when_next_96
when_case_95:
  store i1 1, i1* %ptr_has_side_effects
  br label %when_end_90
when_next_96:
  %508 = icmp eq i64 %504, 17
  br i1 %508, label %when_case_97, label %when_next_98
when_case_97:
  store i1 1, i1* %ptr_has_side_effects
  br label %when_end_90
when_next_98:
  %509 = icmp eq i64 %504, 6
  br i1 %509, label %when_case_99, label %when_next_100
when_case_99:
  store i1 1, i1* %ptr_has_side_effects
  br label %when_end_90
when_next_100:
  %510 = icmp eq i64 %504, 15
  br i1 %510, label %when_case_101, label %when_next_102
when_case_101:
  store i1 1, i1* %ptr_has_side_effects
  br label %when_end_90
when_next_102:
  %511 = icmp eq i64 %504, 0
  br i1 %511, label %when_case_103, label %when_next_104
when_case_103:
  br label %when_end_90
when_next_104:
  %512 = icmp eq i64 %504, 1
  br i1 %512, label %when_case_105, label %when_next_106
when_case_105:
  br label %when_end_90
when_next_106:
  %513 = icmp eq i64 %504, 2
  br i1 %513, label %when_case_107, label %when_next_108
when_case_107:
  br label %when_end_90
when_next_108:
  %514 = icmp eq i64 %504, 3
  br i1 %514, label %when_case_109, label %when_next_110
when_case_109:
  br label %when_end_90
when_next_110:
  %515 = icmp eq i64 %504, 7
  br i1 %515, label %when_case_111, label %when_next_112
when_case_111:
  br label %when_end_90
when_next_112:
  %516 = icmp eq i64 %504, 8
  br i1 %516, label %when_case_113, label %when_next_114
when_case_113:
  br label %when_end_90
when_next_114:
  %517 = icmp eq i64 %504, 9
  br i1 %517, label %when_case_115, label %when_next_116
when_case_115:
  br label %when_end_90
when_next_116:
  %518 = icmp eq i64 %504, 5
  br i1 %518, label %when_case_117, label %when_next_118
when_case_117:
  br label %when_end_90
when_next_118:
  %519 = icmp eq i64 %504, 12
  br i1 %519, label %when_case_119, label %when_next_120
when_case_119:
  br label %when_end_90
when_next_120:
  %520 = icmp eq i64 %504, 13
  br i1 %520, label %when_case_121, label %when_next_122
when_case_121:
  br label %when_end_90
when_next_122:
  %521 = icmp eq i64 %504, 14
  br i1 %521, label %when_case_123, label %when_next_124
when_case_123:
  br label %when_end_90
when_next_124:
  %522 = icmp eq i64 %504, 16
  br i1 %522, label %when_case_125, label %when_next_126
when_case_125:
  br label %when_end_90
when_next_126:
  %523 = icmp eq i64 %504, 18
  br i1 %523, label %when_case_127, label %when_next_128
when_case_127:
  br label %when_end_90
when_next_128:
  %524 = icmp eq i64 %504, 19
  br i1 %524, label %when_case_129, label %when_next_130
when_case_129:
  br label %when_end_90
when_next_130:
  %525 = icmp eq i64 %504, 20
  br i1 %525, label %when_case_131, label %when_next_132
when_case_131:
  %526 = load i64*, i64** %ptr_instr
  %527 = getelementptr inbounds i64, i64* %526, i64 4
  %528 = bitcast i64* %527 to i1*
  %529 = load i1, i1* %528, align 8
  store i1 %529, i1* %ptr_b
  br label %when_end_90
when_next_132:
  %530 = icmp eq i64 %504, 15
  br i1 %530, label %when_case_133, label %when_next_134
when_case_133:
  br label %when_end_90
when_next_134:
  br label %when_end_90
when_end_90:
  store i1 1, i1* %ptr_is_dead
  store i64 0, i64* %ptr_d_idx
  br label %while_cond_135
while_cond_135:
  %531 = load i64**, i64*** %ptr_ud
  %532 = bitcast i64** %531 to i64*
  %533 = getelementptr inbounds i64, i64* %532, i64 1
  %534 = bitcast i64* %533 to i8**
  %535 = load i8*, i8** %534, align 8
  %536 = bitcast i8* %535 to i64*
  %537 = getelementptr inbounds i64, i64* %536, i64 1
  %538 = bitcast i64* %537 to i64*
  %539 = load i64, i64* %538, align 8
  %540 = load i64, i64* %ptr_d_idx
  %541 = icmp slt i64 %540, %539
  br i1 %541, label %while_body_136, label %while_end_137
while_body_136:
  %542 = load i64**, i64*** %ptr_ud
  %543 = bitcast i64** %542 to i64*
  %544 = getelementptr inbounds i64, i64* %543, i64 1
  %545 = bitcast i64* %544 to i8**
  %546 = load i8*, i8** %545, align 8
  %547 = load i64, i64* %ptr_d_idx
  %548 = call i8* @list_get_String(i8* %546, i64 %547)
  store i8* %548, i8** %ptr_d
  %549 = load i64**, i64*** %ptr_live_now
  %550 = load i8*, i8** %ptr_d
  %551 = call i1 @string_set_contains(i64** %549, i8* %550)
  br i1 %551, label %then_138, label %end_if_139
then_138:
  store i1 0, i1* %ptr_is_dead
  br label %end_if_139
end_if_139:
  %552 = load i64, i64* %ptr_d_idx
  %553 = add nsw i64 %552, 1
  store i64 %553, i64* %ptr_d_idx
  br label %while_cond_135
while_end_137:
  %554 = load i64**, i64*** %ptr_ud
  %555 = bitcast i64** %554 to i64*
  %556 = getelementptr inbounds i64, i64* %555, i64 1
  %557 = bitcast i64* %556 to i8**
  %558 = load i8*, i8** %557, align 8
  %559 = bitcast i8* %558 to i64*
  %560 = getelementptr inbounds i64, i64* %559, i64 1
  %561 = bitcast i64* %560 to i64*
  %562 = load i64, i64* %561, align 8
  %563 = icmp eq i64 %562, 0
  br i1 %563, label %then_140, label %end_if_141
then_140:
  store i1 0, i1* %ptr_is_dead
  br label %end_if_141
end_if_141:
  %564 = load i1, i1* %ptr_is_dead
  %565 = xor i1 %564, 1
  %566 = load i1, i1* %ptr_has_side_effects
  %567 = or i1 %565, %566
  br i1 %567, label %then_142, label %end_if_143
then_142:
  store i64 0, i64* %ptr_d_idx
  br label %while_cond_144
while_cond_144:
  %568 = load i64**, i64*** %ptr_ud
  %569 = bitcast i64** %568 to i64*
  %570 = getelementptr inbounds i64, i64* %569, i64 1
  %571 = bitcast i64* %570 to i8**
  %572 = load i8*, i8** %571, align 8
  %573 = bitcast i8* %572 to i64*
  %574 = getelementptr inbounds i64, i64* %573, i64 1
  %575 = bitcast i64* %574 to i64*
  %576 = load i64, i64* %575, align 8
  %577 = load i64, i64* %ptr_d_idx
  %578 = icmp slt i64 %577, %576
  br i1 %578, label %while_body_145, label %while_end_146
while_body_145:
  %579 = load i64**, i64*** %ptr_ud
  %580 = bitcast i64** %579 to i64*
  %581 = getelementptr inbounds i64, i64* %580, i64 1
  %582 = bitcast i64* %581 to i8**
  %583 = load i8*, i8** %582, align 8
  %584 = load i64, i64* %ptr_d_idx
  %585 = call i8* @list_get_String(i8* %583, i64 %584)
  store i8* %585, i8** %ptr_d
  %586 = load i64**, i64*** %ptr_live_now
  %587 = load i8*, i8** %ptr_d
  call void @string_set_remove(i64** %586, i8* %587)
  %588 = load i64, i64* %ptr_d_idx
  %589 = add nsw i64 %588, 1
  store i64 %589, i64* %ptr_d_idx
  br label %while_cond_144
while_end_146:
  store i64 0, i64* %ptr_u_idx
  br label %while_cond_147
while_cond_147:
  %590 = load i64**, i64*** %ptr_ud
  %591 = bitcast i64** %590 to i64*
  %592 = getelementptr inbounds i64, i64* %591, i64 0
  %593 = bitcast i64* %592 to i8**
  %594 = load i8*, i8** %593, align 8
  %595 = bitcast i8* %594 to i64*
  %596 = getelementptr inbounds i64, i64* %595, i64 1
  %597 = bitcast i64* %596 to i64*
  %598 = load i64, i64* %597, align 8
  %599 = load i64, i64* %ptr_u_idx
  %600 = icmp slt i64 %599, %598
  br i1 %600, label %while_body_148, label %while_end_149
while_body_148:
  %601 = load i64**, i64*** %ptr_ud
  %602 = bitcast i64** %601 to i64*
  %603 = getelementptr inbounds i64, i64* %602, i64 0
  %604 = bitcast i64* %603 to i8**
  %605 = load i8*, i8** %604, align 8
  %606 = load i64, i64* %ptr_u_idx
  %607 = call i8* @list_get_String(i8* %605, i64 %606)
  store i8* %607, i8** %ptr_u
  %608 = load i64**, i64*** %ptr_live_now
  %609 = load i8*, i8** %ptr_u
  call void @string_set_add(i64** %608, i8* %609)
  %610 = load i64, i64* %ptr_u_idx
  %611 = add nsw i64 %610, 1
  store i64 %611, i64* %ptr_u_idx
  br label %while_cond_147
while_end_149:
  %612 = load i64**, i64*** %ptr_opt_instrs
  %613 = load i64*, i64** %ptr_instr
  call void @list_push_IRInstruction(i64** %612, i64* %613)
  br label %end_if_143
end_if_143:
  %614 = load i64, i64* %ptr_inst_idx
  %615 = sub nsw i64 %614, 1
  store i64 %615, i64* %ptr_inst_idx
  br label %while_cond_87
while_end_89:
  %616 = load i64**, i64*** %ptr_opt_instrs
  %617 = bitcast i64** %616 to i64*
  %618 = getelementptr inbounds i64, i64* %617, i64 1
  %619 = bitcast i64* %618 to i64*
  %620 = load i64, i64* %619, align 8
  %621 = load i64**, i64*** %ptr_dummy_instr
  %622 = call i64** @new_list_IRInstruction(i64 %620, i64** %621)
  store i64** %622, i64*** %ptr_final_instrs
  %623 = load i64**, i64*** %ptr_opt_instrs
  %624 = bitcast i64** %623 to i64*
  %625 = getelementptr inbounds i64, i64* %624, i64 1
  %626 = bitcast i64* %625 to i64*
  %627 = load i64, i64* %626, align 8
  %628 = sub nsw i64 %627, 1
  store i64 %628, i64* %ptr_rev_idx
  br label %while_cond_150
while_cond_150:
  %629 = load i64, i64* %ptr_rev_idx
  %630 = icmp sge i64 %629, 0
  br i1 %630, label %while_body_151, label %while_end_152
while_body_151:
  %631 = load i64**, i64*** %ptr_opt_instrs
  %632 = load i64, i64* %ptr_rev_idx
  %633 = call i64* @list_get_IRInstruction(i64** %631, i64 %632)
  store i64* %633, i64** %ptr_instr
  %634 = load i64**, i64*** %ptr_final_instrs
  %635 = load i64*, i64** %ptr_instr
  call void @list_push_IRInstruction(i64** %634, i64* %635)
  %636 = load i64, i64* %ptr_rev_idx
  %637 = sub nsw i64 %636, 1
  store i64 %637, i64* %ptr_rev_idx
  br label %while_cond_150
while_end_152:
  %638 = load i64*, i64** %ptr_block
  %639 = load i64**, i64*** %ptr_final_instrs
  %640 = bitcast i64* %638 to i64*
  %641 = getelementptr inbounds i64, i64* %640, i64 1
  %642 = bitcast i64* %641 to i64***
  store i64** %639, i64*** %642, align 8
  %643 = load i64**, i64*** %ptr_func
  %644 = bitcast i64** %643 to i64*
  %645 = getelementptr inbounds i64, i64* %644, i64 3
  %646 = bitcast i64* %645 to i8**
  %647 = load i8*, i8** %646, align 8
  %648 = load i1, i1* %ptr_b
  %649 = load i64*, i64** %ptr_block
  call void @list_set_BasicBlock(i8* %647, i1 %648, i64* %649)
  %650 = load i1, i1* %ptr_b
  %651 = add nsw i1 %650, 1
  store i1 %651, i1* %ptr_b
  br label %while_cond_69
while_end_71:
  ret void
}

define i64** @optimizer_optimize(i64** noalias %param_opt, i64** noalias %param_functions, i64** noalias %global_instructions) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_opt, i64*** %ptr_opt
  store i64** %param_functions, i64*** %ptr_functions
  %1 = load i64**, i64*** %ptr_opt
  %2 = call i64** @optimizer_run_soa_pass_globals(i64** %1, i64** %global_instructions)
  store i64** %2, i64*** %ptr_soa_arrays
  %3 = call i8* @malloc(i64 40)
  %4 = bitcast i8* %3 to i64*
  store i64* %4, i64*** %ptr_dummy_func
  %5 = load i64**, i64*** %ptr_functions
  %6 = bitcast i64** %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = icmp sgt i64 %9, 0
  br i1 %10, label %then_0, label %end_if_1
then_0:
  %11 = load i64**, i64*** %ptr_functions
  %12 = call i64* @list_get_IRFunction(i64** %11, i64 0)
  %13 = load i64**, i64*** %ptr_dummy_func
  store i64* %12, i64** %13
  br label %end_if_1
end_if_1:
  %14 = load i64**, i64*** %ptr_dummy_func
  %15 = call i64** @new_list_IRFunction(i64 10, i64** %14)
  store i64** %15, i64*** %ptr_optimized_functions
  store i64 0, i64* %ptr_i
  br label %while_cond_2
while_cond_2:
  %16 = load i64**, i64*** %ptr_functions
  %17 = bitcast i64** %16 to i64*
  %18 = getelementptr inbounds i64, i64* %17, i64 1
  %19 = bitcast i64* %18 to i64*
  %20 = load i64, i64* %19, align 8
  %21 = load i64, i64* %ptr_i
  %22 = icmp slt i64 %21, %20
  br i1 %22, label %while_body_3, label %while_end_4
while_body_3:
  %23 = load i64**, i64*** %ptr_functions
  %24 = load i64, i64* %ptr_i
  %25 = call i64* @list_get_IRFunction(i64** %23, i64 %24)
  store i64* %25, i64** %ptr_func_val
  %26 = call i8* @malloc(i64 40)
  %27 = bitcast i8* %26 to i64*
  store i64* %27, i64*** %ptr_func
  %28 = load i64**, i64*** %ptr_func
  %29 = load i64*, i64** %ptr_func_val
  store i64* %29, i64** %28
  %30 = load i64**, i64*** %ptr_opt
  %31 = load i64**, i64*** %ptr_func
  %32 = call i64** @optimizer_run_soa_pass_func(i64** %30, i64** %31)
  store i64** %32, i64*** %ptr_func_soa
  store i64 0, i64* %ptr_j
  br label %while_cond_5
while_cond_5:
  %33 = load i64**, i64*** %ptr_func_soa
  %34 = bitcast i64** %33 to i64*
  %35 = getelementptr inbounds i64, i64* %34, i64 1
  %36 = bitcast i64* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = load i64, i64* %ptr_j
  %39 = icmp slt i64 %38, %37
  br i1 %39, label %while_body_6, label %while_end_7
while_body_6:
  %40 = load i64**, i64*** %ptr_func_soa
  %41 = load i64, i64* %ptr_j
  %42 = call i64* @list_get_SoAArray(i64** %40, i64 %41)
  store i64* %42, i64** %ptr_item
  %43 = load i64*, i64** %ptr_item
  %44 = bitcast i64* %43 to i64*
  %45 = getelementptr inbounds i64, i64* %44, i64 0
  %46 = bitcast i64* %45 to i8**
  %47 = load i8*, i8** %46, align 8
  %48 = load i64*, i64** %ptr_item
  %49 = bitcast i64* %48 to i64*
  %50 = getelementptr inbounds i64, i64* %49, i64 1
  %51 = bitcast i64* %50 to i64*
  %52 = load i64, i64* %51, align 8
  %53 = load i64**, i64*** %ptr_soa_arrays
  call void @add_soa(i64** %53, i8* %47, i64 %52)
  %54 = load i64, i64* %ptr_j
  %55 = add nsw i64 %54, 1
  store i64 %55, i64* %ptr_j
  br label %while_cond_5
while_end_7:
  %56 = load i64**, i64*** %ptr_opt
  %57 = load i64**, i64*** %ptr_func
  call void @optimizer_run_liveness_and_dce(i64** %56, i64** %57)
  %58 = load i64**, i64*** %ptr_func
  %59 = load i64*, i64** %58
  %60 = load i64**, i64*** %ptr_optimized_functions
  call void @list_push_IRFunction(i64** %60, i64* %59)
  %61 = load i64, i64* %ptr_i
  %62 = add nsw i64 %61, 1
  store i64 %62, i64* %ptr_i
  br label %while_cond_2
while_end_4:
  %63 = call i8* @malloc(i64 24)
  %64 = bitcast i8* %63 to i64*
  store i64* %64, i64*** %ptr_res
  %65 = load i64**, i64*** %ptr_res
  %66 = load i64**, i64*** %ptr_optimized_functions
  %67 = bitcast i64** %65 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 0
  %69 = bitcast i64* %68 to i64***
  store i64** %66, i64*** %69, align 8
  %70 = load i64**, i64*** %ptr_res
  %71 = load i64**, i64*** %ptr_soa_arrays
  %72 = bitcast i64** %70 to i64*
  %73 = getelementptr inbounds i64, i64* %72, i64 1
  %74 = bitcast i64* %73 to i64***
  store i64** %71, i64*** %74, align 8
  %75 = load i64**, i64*** %ptr_res
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 2
  %78 = bitcast i64* %77 to i64***
  store i64** %global_instructions, i64*** %78, align 8
  %79 = load i64**, i64*** %ptr_res
  ret i64** %79
unreachable_8:
  ret i64** null
}

define i64** @new_list_String(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64 %param_capacity, i64* %ptr_capacity
  store i64** %param_dummy, i64*** %ptr_dummy
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_list
  %3 = load i64**, i64*** %ptr_list
  %4 = load i64, i64* %ptr_capacity
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  store i64 %4, i64* %7, align 8
  %8 = load i64**, i64*** %ptr_list
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i64, i64* %ptr_capacity
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = load i64**, i64*** %ptr_list
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = load i64, i64* %ptr_capacity
  %20 = mul nsw i64 %19, 8
  %21 = call i8* @malloc(i64 %20)
  %22 = bitcast i8* %21 to i64*
  %23 = load i64**, i64*** %ptr_list
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = load i64, i64* %ptr_capacity
  %29 = mul nsw i64 %28, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 2
  %35 = bitcast i64* %34 to i64**
  store i64* %31, i64** %35, align 8
  br label %end_if_1
end_if_1:
  %36 = load i64**, i64*** %ptr_list
  ret i64** %36
unreachable_2:
  ret i64** null
}

define i8* @list_get_String(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
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
  ret i8* null
}

define void @list_push_String(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
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
  store i64 0, i64* %ptr_i
  br label %while_cond_4
while_cond_4:
  %33 = load i64**, i64*** %ptr_list
  %34 = bitcast i64** %33 to i64*
  %35 = getelementptr inbounds i64, i64* %34, i64 1
  %36 = bitcast i64* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = load i64, i64* %ptr_i
  %39 = icmp slt i64 %38, %37
  br i1 %39, label %while_body_5, label %while_end_6
while_body_5:
  %40 = load i64**, i64*** %ptr_list
  %41 = bitcast i64** %40 to i64*
  %42 = getelementptr inbounds i64, i64* %41, i64 2
  %43 = bitcast i64* %42 to i8**
  %44 = load i8*, i8** %43, align 8
  %45 = load i64, i64* %ptr_i
  %46 = getelementptr inbounds i64, i8* %44, i64 %45
  %47 = load i64, i64* %46
  store i64 %47, i64** %ptr_old_item
  %48 = load i64**, i64*** %ptr_new_buffer
  %49 = load i64, i64* %ptr_i
  %50 = load i64*, i64** %ptr_old_item
  %51 = getelementptr inbounds i64, i64** %48, i64 %49
  store i64* %50, i64* %51
  %52 = load i64, i64* %ptr_i
  %53 = add nsw i64 %52, 1
  store i64 %53, i64* %ptr_i
  br label %while_cond_4
while_end_6:
  %54 = load i64**, i64*** %ptr_list
  %55 = bitcast i64** %54 to i64*
  %56 = getelementptr inbounds i64, i64* %55, i64 0
  %57 = bitcast i64* %56 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = icmp sgt i64 %58, 0
  br i1 %59, label %then_7, label %end_if_8
then_7:
  %60 = load i64**, i64*** %ptr_list
  %61 = bitcast i64** %60 to i64*
  %62 = getelementptr inbounds i64, i64* %61, i64 2
  %63 = bitcast i64* %62 to i8**
  %64 = load i8*, i8** %63, align 8
  %65 = bitcast i8* %64 to i8*
  call void @free(i8* %65)
  br label %end_if_8
end_if_8:
  %66 = load i64**, i64*** %ptr_list
  %67 = load i64**, i64*** %ptr_new_buffer
  %68 = bitcast i64** %66 to i64*
  %69 = getelementptr inbounds i64, i64* %68, i64 2
  %70 = bitcast i64* %69 to i64***
  store i64** %67, i64*** %70, align 8
  %71 = load i64**, i64*** %ptr_list
  %72 = load i64, i64* %ptr_new_capacity
  %73 = bitcast i64** %71 to i64*
  %74 = getelementptr inbounds i64, i64* %73, i64 0
  %75 = bitcast i64* %74 to i64*
  store i64 %72, i64* %75, align 8
  br label %end_if_1
end_if_1:
  %76 = load i64**, i64*** %ptr_list
  %77 = bitcast i64** %76 to i64*
  %78 = getelementptr inbounds i64, i64* %77, i64 2
  %79 = bitcast i64* %78 to i8**
  %80 = load i8*, i8** %79, align 8
  %81 = load i64**, i64*** %ptr_list
  %82 = bitcast i64** %81 to i64*
  %83 = getelementptr inbounds i64, i64* %82, i64 1
  %84 = bitcast i64* %83 to i64*
  %85 = load i64, i64* %84, align 8
  %86 = load i64*, i64** %ptr_item
  %87 = getelementptr inbounds i64, i8* %80, i64 %85
  store i64* %86, i64* %87
  %88 = load i64**, i64*** %ptr_list
  %89 = bitcast i64** %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 1
  %91 = bitcast i64* %90 to i64*
  %92 = load i64, i64* %91, align 8
  %93 = add nsw i64 %92, 1
  %94 = load i64**, i64*** %ptr_list
  %95 = bitcast i64** %94 to i64*
  %96 = getelementptr inbounds i64, i64* %95, i64 1
  %97 = bitcast i64* %96 to i64*
  store i64 %93, i64* %97, align 8
  ret void
}

define i64* @list_get_SoAArray(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
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

define void @list_push_SoAArray(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
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
  store i64 0, i64* %ptr_i
  br label %while_cond_4
while_cond_4:
  %33 = load i64**, i64*** %ptr_list
  %34 = bitcast i64** %33 to i64*
  %35 = getelementptr inbounds i64, i64* %34, i64 1
  %36 = bitcast i64* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = load i64, i64* %ptr_i
  %39 = icmp slt i64 %38, %37
  br i1 %39, label %while_body_5, label %while_end_6
while_body_5:
  %40 = load i64**, i64*** %ptr_list
  %41 = bitcast i64** %40 to i64*
  %42 = getelementptr inbounds i64, i64* %41, i64 2
  %43 = bitcast i64* %42 to i8**
  %44 = load i8*, i8** %43, align 8
  %45 = load i64, i64* %ptr_i
  %46 = getelementptr inbounds i64, i8* %44, i64 %45
  %47 = load i64, i64* %46
  store i64 %47, i64** %ptr_old_item
  %48 = load i64**, i64*** %ptr_new_buffer
  %49 = load i64, i64* %ptr_i
  %50 = load i64*, i64** %ptr_old_item
  %51 = getelementptr inbounds i64, i64** %48, i64 %49
  store i64* %50, i64* %51
  %52 = load i64, i64* %ptr_i
  %53 = add nsw i64 %52, 1
  store i64 %53, i64* %ptr_i
  br label %while_cond_4
while_end_6:
  %54 = load i64**, i64*** %ptr_list
  %55 = bitcast i64** %54 to i64*
  %56 = getelementptr inbounds i64, i64* %55, i64 0
  %57 = bitcast i64* %56 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = icmp sgt i64 %58, 0
  br i1 %59, label %then_7, label %end_if_8
then_7:
  %60 = load i64**, i64*** %ptr_list
  %61 = bitcast i64** %60 to i64*
  %62 = getelementptr inbounds i64, i64* %61, i64 2
  %63 = bitcast i64* %62 to i8**
  %64 = load i8*, i8** %63, align 8
  %65 = bitcast i8* %64 to i8*
  call void @free(i8* %65)
  br label %end_if_8
end_if_8:
  %66 = load i64**, i64*** %ptr_list
  %67 = load i64**, i64*** %ptr_new_buffer
  %68 = bitcast i64** %66 to i64*
  %69 = getelementptr inbounds i64, i64* %68, i64 2
  %70 = bitcast i64* %69 to i64***
  store i64** %67, i64*** %70, align 8
  %71 = load i64**, i64*** %ptr_list
  %72 = load i64, i64* %ptr_new_capacity
  %73 = bitcast i64** %71 to i64*
  %74 = getelementptr inbounds i64, i64* %73, i64 0
  %75 = bitcast i64* %74 to i64*
  store i64 %72, i64* %75, align 8
  br label %end_if_1
end_if_1:
  %76 = load i64**, i64*** %ptr_list
  %77 = bitcast i64** %76 to i64*
  %78 = getelementptr inbounds i64, i64* %77, i64 2
  %79 = bitcast i64* %78 to i8**
  %80 = load i8*, i8** %79, align 8
  %81 = load i64**, i64*** %ptr_list
  %82 = bitcast i64** %81 to i64*
  %83 = getelementptr inbounds i64, i64* %82, i64 1
  %84 = bitcast i64* %83 to i64*
  %85 = load i64, i64* %84, align 8
  %86 = load i64*, i64** %ptr_item
  %87 = getelementptr inbounds i64, i8* %80, i64 %85
  store i64* %86, i64* %87
  %88 = load i64**, i64*** %ptr_list
  %89 = bitcast i64** %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 1
  %91 = bitcast i64* %90 to i64*
  %92 = load i64, i64* %91, align 8
  %93 = add nsw i64 %92, 1
  %94 = load i64**, i64*** %ptr_list
  %95 = bitcast i64** %94 to i64*
  %96 = getelementptr inbounds i64, i64* %95, i64 1
  %97 = bitcast i64* %96 to i64*
  store i64 %93, i64* %97, align 8
  ret void
}

define i64** @new_list_SoAArray(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64 %param_capacity, i64* %ptr_capacity
  store i64** %param_dummy, i64*** %ptr_dummy
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_list
  %3 = load i64**, i64*** %ptr_list
  %4 = load i64, i64* %ptr_capacity
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  store i64 %4, i64* %7, align 8
  %8 = load i64**, i64*** %ptr_list
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i64, i64* %ptr_capacity
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = load i64**, i64*** %ptr_list
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = load i64, i64* %ptr_capacity
  %20 = mul nsw i64 %19, 8
  %21 = call i8* @malloc(i64 %20)
  %22 = bitcast i8* %21 to i64*
  %23 = load i64**, i64*** %ptr_list
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = load i64, i64* %ptr_capacity
  %29 = mul nsw i64 %28, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 2
  %35 = bitcast i64* %34 to i64**
  store i64* %31, i64** %35, align 8
  br label %end_if_1
end_if_1:
  %36 = load i64**, i64*** %ptr_list
  ret i64** %36
unreachable_2:
  ret i64** null
}

define i64* @list_get_IRInstruction(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
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

define i64* @list_get_FlatVectorApplyOp(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
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

define i64* @list_get_BasicBlock(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
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

define i64* @list_get_IROperand(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
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

define i64** @new_list_Int(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64 %param_capacity, i64* %ptr_capacity
  store i64** %param_dummy, i64*** %ptr_dummy
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_list
  %3 = load i64**, i64*** %ptr_list
  %4 = load i64, i64* %ptr_capacity
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  store i64 %4, i64* %7, align 8
  %8 = load i64**, i64*** %ptr_list
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i64, i64* %ptr_capacity
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = load i64**, i64*** %ptr_list
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = load i64, i64* %ptr_capacity
  %20 = mul nsw i64 %19, 8
  %21 = call i8* @malloc(i64 %20)
  %22 = bitcast i8* %21 to i64*
  %23 = load i64**, i64*** %ptr_list
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = load i64, i64* %ptr_capacity
  %29 = mul nsw i64 %28, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 2
  %35 = bitcast i64* %34 to i64**
  store i64* %31, i64** %35, align 8
  br label %end_if_1
end_if_1:
  %36 = load i64**, i64*** %ptr_list
  ret i64** %36
unreachable_2:
  ret i64** null
}

define i64** @new_list_IntListPtr(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64 %param_capacity, i64* %ptr_capacity
  store i64** %param_dummy, i64*** %ptr_dummy
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_list
  %3 = load i64**, i64*** %ptr_list
  %4 = load i64, i64* %ptr_capacity
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  store i64 %4, i64* %7, align 8
  %8 = load i64**, i64*** %ptr_list
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i64, i64* %ptr_capacity
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = load i64**, i64*** %ptr_list
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = load i64, i64* %ptr_capacity
  %20 = mul nsw i64 %19, 8
  %21 = call i8* @malloc(i64 %20)
  %22 = bitcast i8* %21 to i64*
  %23 = load i64**, i64*** %ptr_list
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = load i64, i64* %ptr_capacity
  %29 = mul nsw i64 %28, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 2
  %35 = bitcast i64* %34 to i64**
  store i64* %31, i64** %35, align 8
  br label %end_if_1
end_if_1:
  %36 = load i64**, i64*** %ptr_list
  ret i64** %36
unreachable_2:
  ret i64** null
}

define i64** @new_list_StringSetPtr(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64 %param_capacity, i64* %ptr_capacity
  store i64** %param_dummy, i64*** %ptr_dummy
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_list
  %3 = load i64**, i64*** %ptr_list
  %4 = load i64, i64* %ptr_capacity
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  store i64 %4, i64* %7, align 8
  %8 = load i64**, i64*** %ptr_list
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i64, i64* %ptr_capacity
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = load i64**, i64*** %ptr_list
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = load i64, i64* %ptr_capacity
  %20 = mul nsw i64 %19, 8
  %21 = call i8* @malloc(i64 %20)
  %22 = bitcast i8* %21 to i64*
  %23 = load i64**, i64*** %ptr_list
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = load i64, i64* %ptr_capacity
  %29 = mul nsw i64 %28, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 2
  %35 = bitcast i64* %34 to i64**
  store i64* %31, i64** %35, align 8
  br label %end_if_1
end_if_1:
  %36 = load i64**, i64*** %ptr_list
  ret i64** %36
unreachable_2:
  ret i64** null
}

define void @list_push_Int(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
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
  store i64 0, i64* %ptr_i
  br label %while_cond_4
while_cond_4:
  %33 = load i64**, i64*** %ptr_list
  %34 = bitcast i64** %33 to i64*
  %35 = getelementptr inbounds i64, i64* %34, i64 1
  %36 = bitcast i64* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = load i64, i64* %ptr_i
  %39 = icmp slt i64 %38, %37
  br i1 %39, label %while_body_5, label %while_end_6
while_body_5:
  %40 = load i64**, i64*** %ptr_list
  %41 = bitcast i64** %40 to i64*
  %42 = getelementptr inbounds i64, i64* %41, i64 2
  %43 = bitcast i64* %42 to i8**
  %44 = load i8*, i8** %43, align 8
  %45 = load i64, i64* %ptr_i
  %46 = getelementptr inbounds i64, i8* %44, i64 %45
  %47 = load i64, i64* %46
  store i64 %47, i64** %ptr_old_item
  %48 = load i64**, i64*** %ptr_new_buffer
  %49 = load i64, i64* %ptr_i
  %50 = load i64*, i64** %ptr_old_item
  %51 = getelementptr inbounds i64, i64** %48, i64 %49
  store i64* %50, i64* %51
  %52 = load i64, i64* %ptr_i
  %53 = add nsw i64 %52, 1
  store i64 %53, i64* %ptr_i
  br label %while_cond_4
while_end_6:
  %54 = load i64**, i64*** %ptr_list
  %55 = bitcast i64** %54 to i64*
  %56 = getelementptr inbounds i64, i64* %55, i64 0
  %57 = bitcast i64* %56 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = icmp sgt i64 %58, 0
  br i1 %59, label %then_7, label %end_if_8
then_7:
  %60 = load i64**, i64*** %ptr_list
  %61 = bitcast i64** %60 to i64*
  %62 = getelementptr inbounds i64, i64* %61, i64 2
  %63 = bitcast i64* %62 to i8**
  %64 = load i8*, i8** %63, align 8
  %65 = bitcast i8* %64 to i8*
  call void @free(i8* %65)
  br label %end_if_8
end_if_8:
  %66 = load i64**, i64*** %ptr_list
  %67 = load i64**, i64*** %ptr_new_buffer
  %68 = bitcast i64** %66 to i64*
  %69 = getelementptr inbounds i64, i64* %68, i64 2
  %70 = bitcast i64* %69 to i64***
  store i64** %67, i64*** %70, align 8
  %71 = load i64**, i64*** %ptr_list
  %72 = load i64, i64* %ptr_new_capacity
  %73 = bitcast i64** %71 to i64*
  %74 = getelementptr inbounds i64, i64* %73, i64 0
  %75 = bitcast i64* %74 to i64*
  store i64 %72, i64* %75, align 8
  br label %end_if_1
end_if_1:
  %76 = load i64**, i64*** %ptr_list
  %77 = bitcast i64** %76 to i64*
  %78 = getelementptr inbounds i64, i64* %77, i64 2
  %79 = bitcast i64* %78 to i8**
  %80 = load i8*, i8** %79, align 8
  %81 = load i64**, i64*** %ptr_list
  %82 = bitcast i64** %81 to i64*
  %83 = getelementptr inbounds i64, i64* %82, i64 1
  %84 = bitcast i64* %83 to i64*
  %85 = load i64, i64* %84, align 8
  %86 = load i64*, i64** %ptr_item
  %87 = getelementptr inbounds i64, i8* %80, i64 %85
  store i64* %86, i64* %87
  %88 = load i64**, i64*** %ptr_list
  %89 = bitcast i64** %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 1
  %91 = bitcast i64* %90 to i64*
  %92 = load i64, i64* %91, align 8
  %93 = add nsw i64 %92, 1
  %94 = load i64**, i64*** %ptr_list
  %95 = bitcast i64** %94 to i64*
  %96 = getelementptr inbounds i64, i64* %95, i64 1
  %97 = bitcast i64* %96 to i64*
  store i64 %93, i64* %97, align 8
  ret void
}

define void @list_set_IntListPtr(i64** noalias %param_list, i64 %param_index, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_list, i64*** %ptr_list
  store i64 %param_index, i64* %ptr_index
  store i64* %param_item, i64** %ptr_item
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 2
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = load i64, i64* %ptr_index
  %7 = load i64*, i64** %ptr_item
  %8 = getelementptr inbounds i64, i8* %5, i64 %6
  store i64* %7, i64* %8
  ret void
}

define void @list_set_StringSetPtr(i64** noalias %param_list, i64 %param_index, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_list, i64*** %ptr_list
  store i64 %param_index, i64* %ptr_index
  store i64* %param_item, i64** %ptr_item
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 2
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = load i64, i64* %ptr_index
  %7 = load i64*, i64** %ptr_item
  %8 = getelementptr inbounds i64, i8* %5, i64 %6
  store i64* %7, i64* %8
  ret void
}

define i64* @list_get_IntListPtr(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
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

define i64 @list_get_Int(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
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
  ret i64 0
}

define i64* @list_get_StringSetPtr(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
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

define i64** @new_list_IRInstruction(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64 %param_capacity, i64* %ptr_capacity
  store i64** %param_dummy, i64*** %ptr_dummy
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_list
  %3 = load i64**, i64*** %ptr_list
  %4 = load i64, i64* %ptr_capacity
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  store i64 %4, i64* %7, align 8
  %8 = load i64**, i64*** %ptr_list
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i64, i64* %ptr_capacity
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = load i64**, i64*** %ptr_list
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = load i64, i64* %ptr_capacity
  %20 = mul nsw i64 %19, 8
  %21 = call i8* @malloc(i64 %20)
  %22 = bitcast i8* %21 to i64*
  %23 = load i64**, i64*** %ptr_list
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = load i64, i64* %ptr_capacity
  %29 = mul nsw i64 %28, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 2
  %35 = bitcast i64* %34 to i64**
  store i64* %31, i64** %35, align 8
  br label %end_if_1
end_if_1:
  %36 = load i64**, i64*** %ptr_list
  ret i64** %36
unreachable_2:
  ret i64** null
}

define void @list_push_IRInstruction(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
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
  store i64 0, i64* %ptr_i
  br label %while_cond_4
while_cond_4:
  %33 = load i64**, i64*** %ptr_list
  %34 = bitcast i64** %33 to i64*
  %35 = getelementptr inbounds i64, i64* %34, i64 1
  %36 = bitcast i64* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = load i64, i64* %ptr_i
  %39 = icmp slt i64 %38, %37
  br i1 %39, label %while_body_5, label %while_end_6
while_body_5:
  %40 = load i64**, i64*** %ptr_list
  %41 = bitcast i64** %40 to i64*
  %42 = getelementptr inbounds i64, i64* %41, i64 2
  %43 = bitcast i64* %42 to i8**
  %44 = load i8*, i8** %43, align 8
  %45 = load i64, i64* %ptr_i
  %46 = getelementptr inbounds i64, i8* %44, i64 %45
  %47 = load i64, i64* %46
  store i64 %47, i64** %ptr_old_item
  %48 = load i64**, i64*** %ptr_new_buffer
  %49 = load i64, i64* %ptr_i
  %50 = load i64*, i64** %ptr_old_item
  %51 = getelementptr inbounds i64, i64** %48, i64 %49
  store i64* %50, i64* %51
  %52 = load i64, i64* %ptr_i
  %53 = add nsw i64 %52, 1
  store i64 %53, i64* %ptr_i
  br label %while_cond_4
while_end_6:
  %54 = load i64**, i64*** %ptr_list
  %55 = bitcast i64** %54 to i64*
  %56 = getelementptr inbounds i64, i64* %55, i64 0
  %57 = bitcast i64* %56 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = icmp sgt i64 %58, 0
  br i1 %59, label %then_7, label %end_if_8
then_7:
  %60 = load i64**, i64*** %ptr_list
  %61 = bitcast i64** %60 to i64*
  %62 = getelementptr inbounds i64, i64* %61, i64 2
  %63 = bitcast i64* %62 to i8**
  %64 = load i8*, i8** %63, align 8
  %65 = bitcast i8* %64 to i8*
  call void @free(i8* %65)
  br label %end_if_8
end_if_8:
  %66 = load i64**, i64*** %ptr_list
  %67 = load i64**, i64*** %ptr_new_buffer
  %68 = bitcast i64** %66 to i64*
  %69 = getelementptr inbounds i64, i64* %68, i64 2
  %70 = bitcast i64* %69 to i64***
  store i64** %67, i64*** %70, align 8
  %71 = load i64**, i64*** %ptr_list
  %72 = load i64, i64* %ptr_new_capacity
  %73 = bitcast i64** %71 to i64*
  %74 = getelementptr inbounds i64, i64* %73, i64 0
  %75 = bitcast i64* %74 to i64*
  store i64 %72, i64* %75, align 8
  br label %end_if_1
end_if_1:
  %76 = load i64**, i64*** %ptr_list
  %77 = bitcast i64** %76 to i64*
  %78 = getelementptr inbounds i64, i64* %77, i64 2
  %79 = bitcast i64* %78 to i8**
  %80 = load i8*, i8** %79, align 8
  %81 = load i64**, i64*** %ptr_list
  %82 = bitcast i64** %81 to i64*
  %83 = getelementptr inbounds i64, i64* %82, i64 1
  %84 = bitcast i64* %83 to i64*
  %85 = load i64, i64* %84, align 8
  %86 = load i64*, i64** %ptr_item
  %87 = getelementptr inbounds i64, i8* %80, i64 %85
  store i64* %86, i64* %87
  %88 = load i64**, i64*** %ptr_list
  %89 = bitcast i64** %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 1
  %91 = bitcast i64* %90 to i64*
  %92 = load i64, i64* %91, align 8
  %93 = add nsw i64 %92, 1
  %94 = load i64**, i64*** %ptr_list
  %95 = bitcast i64** %94 to i64*
  %96 = getelementptr inbounds i64, i64* %95, i64 1
  %97 = bitcast i64* %96 to i64*
  store i64 %93, i64* %97, align 8
  ret void
}

define void @list_set_BasicBlock(i64** noalias %param_list, i64 %param_index, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64** %param_list, i64*** %ptr_list
  store i64 %param_index, i64* %ptr_index
  store i64* %param_item, i64** %ptr_item
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 2
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = load i64, i64* %ptr_index
  %7 = load i64*, i64** %ptr_item
  %8 = getelementptr inbounds i64, i8* %5, i64 %6
  store i64* %7, i64* %8
  ret void
}

define i64* @list_get_IRFunction(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
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

define i64** @new_list_IRFunction(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
  store i64 %param_capacity, i64* %ptr_capacity
  store i64** %param_dummy, i64*** %ptr_dummy
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_list
  %3 = load i64**, i64*** %ptr_list
  %4 = load i64, i64* %ptr_capacity
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  store i64 %4, i64* %7, align 8
  %8 = load i64**, i64*** %ptr_list
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i64, i64* %ptr_capacity
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = load i64**, i64*** %ptr_list
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = load i64, i64* %ptr_capacity
  %20 = mul nsw i64 %19, 8
  %21 = call i8* @malloc(i64 %20)
  %22 = bitcast i8* %21 to i64*
  %23 = load i64**, i64*** %ptr_list
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = load i64, i64* %ptr_capacity
  %29 = mul nsw i64 %28, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 2
  %35 = bitcast i64* %34 to i64**
  store i64* %31, i64** %35, align 8
  br label %end_if_1
end_if_1:
  %36 = load i64**, i64*** %ptr_list
  ret i64** %36
unreachable_2:
  ret i64** null
}

define void @list_push_IRFunction(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_s_in = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_size = alloca i64
  %ptr_set = alloca i64**
  %ptr_rhs_full = alloca i8*
  %ptr_dummy_set = alloca i64**
  %ptr_idx_t = alloca i64
  %ptr_changed = alloca i1
  %ptr_soa_list = alloca i64**
  %ptr_succ_wrapper = alloca i64*
  %ptr_item = alloca i64*
  %ptr_b = alloca i1
  %ptr_idx_f = alloca i64
  %ptr_a = alloca i8*
  %ptr_i = alloca i64
  %ptr_old_in = alloca i64**
  %ptr_old_out = alloca i64**
  %ptr_live_now = alloca i64**
  %ptr_optimized_functions = alloca i64**
  %ptr_block = alloca i64*
  %ptr_defs = alloca i64**
  %ptr_succs = alloca i64**
  %ptr_out_wrapper = alloca i64*
  %ptr_u = alloca i8*
  %ptr_has_side_effects = alloca i1
  %ptr_functions = alloca i64**
  %ptr_start_col = alloca i64
  %ptr_opt = alloca i64**
  %ptr_soa_arrays = alloca i64**
  %ptr_def_sets = alloca i64**
  %ptr_dummy_soa = alloca i64**
  %ptr_exists = alloca i1
  %ptr_dummy_int = alloca i64*
  %ptr_list = alloca i64**
  %ptr_s1 = alloca i64**
  %ptr_vop = alloca i64*
  %ptr_source = alloca i8*
  %ptr_var_name = alloca i8*
  %ptr_new_in = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_j = alloca i64
  %ptr_src = alloca i64**
  %ptr_full_name = alloca i8*
  %ptr_new_out = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_v = alloca i64**
  %ptr_b_use = alloca i64**
  %ptr_b_def = alloca i64**
  %ptr_err = alloca i64**
  %ptr_s_val = alloca i64
  %ptr_opt_instrs = alloca i64**
  %ptr_func_soa = alloca i64**
  %ptr_dummy_func = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_name = alloca i8*
  %ptr_d = alloca i8*
  %ptr_new_soa = alloca i64**
  %ptr_s_list = alloca i64**
  %ptr_new_out_wrapper = alloca i64**
  %ptr_old_in_wrapper = alloca i64*
  %ptr_op = alloca i64**
  %ptr_s = alloca i64**
  %ptr_in_sets = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_ud = alloca i64**
  %ptr_d_idx = alloca i64
  %ptr_use_wrapper = alloca i64*
  %ptr_rev_idx = alloca i64
  %ptr_ptr = alloca i64**
  %ptr_offset = alloca i64
  %ptr_temp_list = alloca i64**
  %ptr_dst = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_out_sets = alloca i64**
  %ptr_message = alloca i8*
  %ptr_end_col = alloca i64
  %ptr_def_wrapper = alloca i64*
  %ptr_u_idx = alloca i64
  %ptr_dummy_instr = alloca i64**
  %ptr_a_ptr = alloca i64**
  %ptr_func = alloca i64**
  %ptr_s2 = alloca i64**
  %ptr_index = alloca i64
  %ptr_s_i = alloca i64
  %ptr_final_instrs = alloca i64**
  %ptr_dummy_succ = alloca i64**
  %ptr_dummy_int_list = alloca i64**
  %ptr_num_blocks = alloca i64
  %ptr_use_sets = alloca i64**
  %ptr_s_wrapper = alloca i64**
  %ptr_new_in_wrapper = alloca i64**
  %ptr_span = alloca i64**
  %ptr_uses = alloca i64**
  %ptr_val = alloca i64**
  %ptr_value = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_inst_idx = alloca i64
  %ptr_new_capacity = alloca i64
  %ptr_end_line = alloca i64
  %ptr_v_i2 = alloca i64
  %ptr_res = alloca i64**
  %ptr_v_i = alloca i64
  %ptr_instr = alloca i64*
  %ptr_instrs = alloca i64**
  %ptr_func_val = alloca i64*
  %ptr_old_item = alloca i64*
  %ptr_in_wrapper = alloca i64*
  %ptr_is_dead = alloca i1
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
  store i64 0, i64* %ptr_i
  br label %while_cond_4
while_cond_4:
  %33 = load i64**, i64*** %ptr_list
  %34 = bitcast i64** %33 to i64*
  %35 = getelementptr inbounds i64, i64* %34, i64 1
  %36 = bitcast i64* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = load i64, i64* %ptr_i
  %39 = icmp slt i64 %38, %37
  br i1 %39, label %while_body_5, label %while_end_6
while_body_5:
  %40 = load i64**, i64*** %ptr_list
  %41 = bitcast i64** %40 to i64*
  %42 = getelementptr inbounds i64, i64* %41, i64 2
  %43 = bitcast i64* %42 to i8**
  %44 = load i8*, i8** %43, align 8
  %45 = load i64, i64* %ptr_i
  %46 = getelementptr inbounds i64, i8* %44, i64 %45
  %47 = load i64, i64* %46
  store i64 %47, i64** %ptr_old_item
  %48 = load i64**, i64*** %ptr_new_buffer
  %49 = load i64, i64* %ptr_i
  %50 = load i64*, i64** %ptr_old_item
  %51 = getelementptr inbounds i64, i64** %48, i64 %49
  store i64* %50, i64* %51
  %52 = load i64, i64* %ptr_i
  %53 = add nsw i64 %52, 1
  store i64 %53, i64* %ptr_i
  br label %while_cond_4
while_end_6:
  %54 = load i64**, i64*** %ptr_list
  %55 = bitcast i64** %54 to i64*
  %56 = getelementptr inbounds i64, i64* %55, i64 0
  %57 = bitcast i64* %56 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = icmp sgt i64 %58, 0
  br i1 %59, label %then_7, label %end_if_8
then_7:
  %60 = load i64**, i64*** %ptr_list
  %61 = bitcast i64** %60 to i64*
  %62 = getelementptr inbounds i64, i64* %61, i64 2
  %63 = bitcast i64* %62 to i8**
  %64 = load i8*, i8** %63, align 8
  %65 = bitcast i8* %64 to i8*
  call void @free(i8* %65)
  br label %end_if_8
end_if_8:
  %66 = load i64**, i64*** %ptr_list
  %67 = load i64**, i64*** %ptr_new_buffer
  %68 = bitcast i64** %66 to i64*
  %69 = getelementptr inbounds i64, i64* %68, i64 2
  %70 = bitcast i64* %69 to i64***
  store i64** %67, i64*** %70, align 8
  %71 = load i64**, i64*** %ptr_list
  %72 = load i64, i64* %ptr_new_capacity
  %73 = bitcast i64** %71 to i64*
  %74 = getelementptr inbounds i64, i64* %73, i64 0
  %75 = bitcast i64* %74 to i64*
  store i64 %72, i64* %75, align 8
  br label %end_if_1
end_if_1:
  %76 = load i64**, i64*** %ptr_list
  %77 = bitcast i64** %76 to i64*
  %78 = getelementptr inbounds i64, i64* %77, i64 2
  %79 = bitcast i64* %78 to i8**
  %80 = load i8*, i8** %79, align 8
  %81 = load i64**, i64*** %ptr_list
  %82 = bitcast i64** %81 to i64*
  %83 = getelementptr inbounds i64, i64* %82, i64 1
  %84 = bitcast i64* %83 to i64*
  %85 = load i64, i64* %84, align 8
  %86 = load i64*, i64** %ptr_item
  %87 = getelementptr inbounds i64, i8* %80, i64 %85
  store i64* %86, i64* %87
  %88 = load i64**, i64*** %ptr_list
  %89 = bitcast i64** %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 1
  %91 = bitcast i64* %90 to i64*
  %92 = load i64, i64* %91, align 8
  %93 = add nsw i64 %92, 1
  %94 = load i64**, i64*** %ptr_list
  %95 = bitcast i64** %94 to i64*
  %96 = getelementptr inbounds i64, i64* %95, i64 1
  %97 = bitcast i64* %96 to i64*
  store i64 %93, i64* %97, align 8
  ret void
}

