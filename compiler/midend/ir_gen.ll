; ModuleID = 'nera_program'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

declare i8* @malloc(i64)
declare void @free(i8*)
declare i8* @strncpy(i8*, i8*, i64)
declare i32 @strcmp(i8*, i8*)
declare i64 @strlen(i64**)
declare i8* @int_to_string(i64**)
declare i8* @concat_strings(i8*, i8*)
declare void @print_int(i64)
declare void @print_float(i64)
declare i64 @puts(i64)
declare i64* @ptr_read_StringListMapEntry(i64**, i64)
declare void @ptr_write_StringListMapEntry(i64**, i64, i64**)
declare i64** @alloc_array_StringListMapEntry(i64, i64**)
declare void @free_array_StringListMapEntry(i64**)
declare i64* @ptr_read_StringInnerMapEntry(i64**, i64)
declare void @ptr_write_StringInnerMapEntry(i64**, i64, i64**)
declare i64** @alloc_array_StringInnerMapEntry(i64, i64**)
declare void @free_array_StringInnerMapEntry(i64**)
declare i64* @ptr_read_StringIntMapEntry(i64**, i64)
declare void @ptr_write_StringIntMapEntry(i64**, i64, i64**)
declare i64** @alloc_array_StringIntMapEntry(i64, i64**)
declare void @free_array_StringIntMapEntry(i64**)
declare i64* @ptr_read_StringStringMapEntry(i64**, i64)
declare i64** @alloc_array_IRFunction(i64, i64**)
declare i64** @alloc_array_IRInstruction(i64, i64**)
declare i64** @alloc_array_StringStringMapEntry(i64, i64**)
declare i64* @ptr_read_IRInstruction(i64**, i64)
declare void @ptr_write_IRInstruction(i64**, i64, i64**)
declare void @free_array_IRInstruction(i64**)
declare i64** @alloc_array_BasicBlock(i64, i64**)
declare i64* @ptr_read_BasicBlock(i64**, i64)
declare void @ptr_write_BasicBlock(i64**, i64, i64**)
declare void @free_array_BasicBlock(i64**)
declare i64* @ptr_read_Spanned_Declaration(i64**, i64)
declare i8** @alloc_array_String(i64, i64**)
declare i64* @ptr_read_Param(i64**, i64)
declare i8* @ptr_read_String(i64**, i64)
declare void @ptr_write_String(i64**, i64, i64**)
declare void @free_array_String(i64**)
declare i64* @ptr_read_IRFunction(i64**, i64)
declare void @ptr_write_IRFunction(i64**, i64, i64**)
declare void @free_array_IRFunction(i64**)
declare i64* @ptr_read_FieldDecl(i64**, i64)
declare i64* @ptr_read_VariantDecl(i64**, i64)
declare i64* @ptr_read_Spanned_Statement(i64**, i64)
declare i64** @alloc_array_FlatVectorApplyOp(i64, i64**)
declare i64* @ptr_read_FlatVectorApplyOp(i64**, i64)
declare void @ptr_write_FlatVectorApplyOp(i64**, i64, i64**)
declare void @free_array_FlatVectorApplyOp(i64**)
declare i64** @alloc_array_IROperand(i64, i64**)
declare i64* @ptr_read_Spanned_Expression(i64**, i64)
declare i64* @ptr_read_IROperand(i64**, i64)
declare void @ptr_write_IROperand(i64**, i64, i64**)
declare void @free_array_IROperand(i64**)
declare i64* @ptr_read_WhenCase(i64**, i64)

@.str.0 = private unnamed_addr constant [5 x i8] c"Void\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"entry\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"Void\00", align 1
@.str.4 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.5 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.6 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.7 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"if_then\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"if_end\00", align 1
@.str.10 = private unnamed_addr constant [8 x i8] c"if_else\00", align 1
@.str.11 = private unnamed_addr constant [11 x i8] c"while_cond\00", align 1
@.str.12 = private unnamed_addr constant [11 x i8] c"while_body\00", align 1
@.str.13 = private unnamed_addr constant [10 x i8] c"while_end\00", align 1
@.str.14 = private unnamed_addr constant [9 x i8] c"when_end\00", align 1
@.str.15 = private unnamed_addr constant [10 x i8] c"when_none\00", align 1
@.str.16 = private unnamed_addr constant [9 x i8] c"when_val\00", align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"None\00", align 1
@.str.18 = private unnamed_addr constant [5 x i8] c"None\00", align 1
@.str.19 = private unnamed_addr constant [10 x i8] c"when_case\00", align 1
@.str.20 = private unnamed_addr constant [10 x i8] c"when_next\00", align 1

define i1 @string_eq(i8* noalias %param_s1, i8* noalias %param_s2) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define void @print_string(i64 %param_value) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64 %param_value, i64* %ptr_value
  %1 = load i64, i64* %ptr_value
  %2 = call i64 @puts(i64 %1)
  ret void
}

define i64** @alloc_span(i64 %start_line, i64 %start_col, i64 %end_line, i64 %end_col) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i8* %param_source, i8** %ptr_source
  store i64** %param_span, i64*** %ptr_span
  store i8* %param_message, i8** %ptr_message
  %1 = load i8*, i8** %ptr_message
  %2 = call i64 @puts(i8* %1)
  ret void
}

define i1 @string_eq(i8* noalias %param_s1, i8* noalias %param_s2) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define void @string_list_map_put(i64** noalias %param_map, i8* noalias %param_key, i64 %param_value) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_map, i64*** %ptr_map
  store i8* %param_key, i8** %ptr_key
  store i64 %param_value, i64* %ptr_value
  br label %while_cond_0
while_cond_0:
  %1 = load i64**, i64*** %ptr_map
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = icmp slt i64 0, %9
  br i1 %10, label %while_body_1, label %while_end_2
while_body_1:
  %11 = load i64**, i64*** %ptr_map
  %12 = bitcast i64** %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i64* @list_get_StringListMapEntry(i8* %15, i64 0)
  store i64* %16, i64** %ptr_entry
  %17 = load i64*, i64** %ptr_entry
  %18 = bitcast i64* %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = load i8*, i8** %ptr_key
  %23 = call i1 @string_eq(i8* %21, i8* %22)
  br i1 %23, label %then_3, label %end_if_4
then_3:
  %24 = call i8* @malloc(i64 16)
  %25 = bitcast i8* %24 to i64*
  store i64* %25, i64*** %ptr_updated
  %26 = load i64**, i64*** %ptr_updated
  %27 = load i8*, i8** %ptr_key
  %28 = bitcast i64** %26 to i64*
  %29 = getelementptr inbounds i64, i64* %28, i64 0
  %30 = bitcast i64* %29 to i8**
  store i8* %27, i8** %30, align 8
  %31 = load i64**, i64*** %ptr_updated
  %32 = load i64, i64* %ptr_value
  %33 = bitcast i64** %31 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 1
  %35 = bitcast i64* %34 to i64*
  store i64 %32, i64* %35, align 8
  %36 = load i64**, i64*** %ptr_map
  %37 = bitcast i64** %36 to i64*
  %38 = getelementptr inbounds i64, i64* %37, i64 0
  %39 = bitcast i64* %38 to i8**
  %40 = load i8*, i8** %39, align 8
  %41 = load i64**, i64*** %ptr_updated
  %42 = load i64*, i64** %41
  call void @list_set_StringListMapEntry(i8* %40, i64 0, i64* %42)
  ret void
unreachable_5:
  br label %end_if_4
end_if_4:
  %43 = add nsw i64 0, 1
  store i64 %43, i64 0
  br label %while_cond_0
while_end_2:
  %44 = call i8* @malloc(i64 16)
  %45 = bitcast i8* %44 to i64*
  %46 = load i8*, i8** %ptr_key
  %47 = bitcast i64* %45 to i64*
  %48 = getelementptr inbounds i64, i64* %47, i64 0
  %49 = bitcast i64* %48 to i8**
  store i8* %46, i8** %49, align 8
  %50 = load i64, i64* %ptr_value
  %51 = bitcast i64* %45 to i64*
  %52 = getelementptr inbounds i64, i64* %51, i64 1
  %53 = bitcast i64* %52 to i64*
  store i64 %50, i64* %53, align 8
  %54 = load i64**, i64*** %ptr_map
  %55 = bitcast i64** %54 to i64*
  %56 = getelementptr inbounds i64, i64* %55, i64 0
  %57 = bitcast i64* %56 to i8**
  %58 = load i8*, i8** %57, align 8
  %59 = load i64, i64* %45
  call void @list_push_StringListMapEntry(i8* %58, i64 %59)
  ret void
}

define i64** @string_list_map_get(i64** noalias %param_map, i8* noalias %param_key) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_map, i64*** %ptr_map
  store i8* %param_key, i8** %ptr_key
  br label %while_cond_0
while_cond_0:
  %1 = load i64**, i64*** %ptr_map
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = icmp slt i64 0, %9
  br i1 %10, label %while_body_1, label %while_end_2
while_body_1:
  %11 = load i64**, i64*** %ptr_map
  %12 = bitcast i64** %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i64* @list_get_StringListMapEntry(i8* %15, i64 0)
  store i64* %16, i64** %ptr_entry
  %17 = load i64*, i64** %ptr_entry
  %18 = bitcast i64* %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = load i8*, i8** %ptr_key
  %23 = call i1 @string_eq(i8* %21, i8* %22)
  br i1 %23, label %then_3, label %end_if_4
then_3:
  %24 = load i64*, i64** %ptr_entry
  %25 = bitcast i64* %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 1
  %27 = bitcast i64* %26 to i8**
  %28 = load i8*, i8** %27, align 8
  store i8* %28, i64* %ptr_ret
  %29 = load i64, i64* %ptr_ret
  ret i64 %29
unreachable_5:
  br label %end_if_4
end_if_4:
  %30 = add nsw i64 0, 1
  store i64 %30, i64 0
  br label %while_cond_0
while_end_2:
  store i8* null, i64* %ptr_ret
  %31 = load i64, i64* %ptr_ret
  ret i64 %31
unreachable_6:
  ret i64** null
}

define void @string_inner_map_put(i64** noalias %param_map, i8* noalias %param_key, i64 %param_value) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_map, i64*** %ptr_map
  store i8* %param_key, i8** %ptr_key
  store i64 %param_value, i64* %ptr_value
  br label %while_cond_0
while_cond_0:
  %1 = load i64**, i64*** %ptr_map
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = icmp slt i64 0, %9
  br i1 %10, label %while_body_1, label %while_end_2
while_body_1:
  %11 = load i64**, i64*** %ptr_map
  %12 = bitcast i64** %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i64* @list_get_StringInnerMapEntry(i8* %15, i64 0)
  store i64* %16, i64** %ptr_entry
  %17 = load i64*, i64** %ptr_entry
  %18 = bitcast i64* %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = load i8*, i8** %ptr_key
  %23 = call i1 @string_eq(i8* %21, i8* %22)
  br i1 %23, label %then_3, label %end_if_4
then_3:
  %24 = call i8* @malloc(i64 16)
  %25 = bitcast i8* %24 to i64*
  store i64* %25, i64*** %ptr_updated
  %26 = load i64**, i64*** %ptr_updated
  %27 = load i8*, i8** %ptr_key
  %28 = bitcast i64** %26 to i64*
  %29 = getelementptr inbounds i64, i64* %28, i64 0
  %30 = bitcast i64* %29 to i8**
  store i8* %27, i8** %30, align 8
  %31 = load i64**, i64*** %ptr_updated
  %32 = load i64, i64* %ptr_value
  %33 = bitcast i64** %31 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 1
  %35 = bitcast i64* %34 to i64*
  store i64 %32, i64* %35, align 8
  %36 = load i64**, i64*** %ptr_map
  %37 = bitcast i64** %36 to i64*
  %38 = getelementptr inbounds i64, i64* %37, i64 0
  %39 = bitcast i64* %38 to i8**
  %40 = load i8*, i8** %39, align 8
  %41 = load i64**, i64*** %ptr_updated
  %42 = load i64*, i64** %41
  call void @list_set_StringInnerMapEntry(i8* %40, i64 0, i64* %42)
  ret void
unreachable_5:
  br label %end_if_4
end_if_4:
  %43 = add nsw i64 0, 1
  store i64 %43, i64 0
  br label %while_cond_0
while_end_2:
  %44 = call i8* @malloc(i64 16)
  %45 = bitcast i8* %44 to i64*
  %46 = load i8*, i8** %ptr_key
  %47 = bitcast i64* %45 to i64*
  %48 = getelementptr inbounds i64, i64* %47, i64 0
  %49 = bitcast i64* %48 to i8**
  store i8* %46, i8** %49, align 8
  %50 = load i64, i64* %ptr_value
  %51 = bitcast i64* %45 to i64*
  %52 = getelementptr inbounds i64, i64* %51, i64 1
  %53 = bitcast i64* %52 to i64*
  store i64 %50, i64* %53, align 8
  %54 = load i64**, i64*** %ptr_map
  %55 = bitcast i64** %54 to i64*
  %56 = getelementptr inbounds i64, i64* %55, i64 0
  %57 = bitcast i64* %56 to i8**
  %58 = load i8*, i8** %57, align 8
  %59 = load i64, i64* %45
  call void @list_push_StringInnerMapEntry(i8* %58, i64 %59)
  ret void
}

define i64** @string_inner_map_get(i64** noalias %param_map, i8* noalias %param_key) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_map, i64*** %ptr_map
  store i8* %param_key, i8** %ptr_key
  br label %while_cond_0
while_cond_0:
  %1 = load i64**, i64*** %ptr_map
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = icmp slt i64 0, %9
  br i1 %10, label %while_body_1, label %while_end_2
while_body_1:
  %11 = load i64**, i64*** %ptr_map
  %12 = bitcast i64** %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i64* @list_get_StringInnerMapEntry(i8* %15, i64 0)
  store i64* %16, i64** %ptr_entry
  %17 = load i64*, i64** %ptr_entry
  %18 = bitcast i64* %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = load i8*, i8** %ptr_key
  %23 = call i1 @string_eq(i8* %21, i8* %22)
  br i1 %23, label %then_3, label %end_if_4
then_3:
  %24 = load i64*, i64** %ptr_entry
  %25 = bitcast i64* %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 1
  %27 = bitcast i64* %26 to i8**
  %28 = load i8*, i8** %27, align 8
  store i8* %28, i64* %ptr_ret
  %29 = load i64, i64* %ptr_ret
  ret i64 %29
unreachable_5:
  br label %end_if_4
end_if_4:
  %30 = add nsw i64 0, 1
  store i64 %30, i64 0
  br label %while_cond_0
while_end_2:
  store i8* null, i64* %ptr_ret
  %31 = load i64, i64* %ptr_ret
  ret i64 %31
unreachable_6:
  ret i64** null
}

define void @string_int_map_put(i64** noalias %param_map, i8* noalias %param_key, i64 %param_value) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_map, i64*** %ptr_map
  store i8* %param_key, i8** %ptr_key
  store i64 %param_value, i64* %ptr_value
  br label %while_cond_0
while_cond_0:
  %1 = load i64**, i64*** %ptr_map
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = icmp slt i64 0, %9
  br i1 %10, label %while_body_1, label %while_end_2
while_body_1:
  %11 = load i64**, i64*** %ptr_map
  %12 = bitcast i64** %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i64* @list_get_StringIntMapEntry(i8* %15, i64 0)
  store i64* %16, i64** %ptr_entry
  %17 = load i64*, i64** %ptr_entry
  %18 = bitcast i64* %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = load i8*, i8** %ptr_key
  %23 = call i1 @string_eq(i8* %21, i8* %22)
  br i1 %23, label %then_3, label %end_if_4
then_3:
  %24 = call i8* @malloc(i64 16)
  %25 = bitcast i8* %24 to i64*
  store i64* %25, i64*** %ptr_updated
  %26 = load i64**, i64*** %ptr_updated
  %27 = load i8*, i8** %ptr_key
  %28 = bitcast i64** %26 to i64*
  %29 = getelementptr inbounds i64, i64* %28, i64 0
  %30 = bitcast i64* %29 to i8**
  store i8* %27, i8** %30, align 8
  %31 = load i64**, i64*** %ptr_updated
  %32 = load i64, i64* %ptr_value
  %33 = bitcast i64** %31 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 1
  %35 = bitcast i64* %34 to i64*
  store i64 %32, i64* %35, align 8
  %36 = load i64**, i64*** %ptr_map
  %37 = bitcast i64** %36 to i64*
  %38 = getelementptr inbounds i64, i64* %37, i64 0
  %39 = bitcast i64* %38 to i8**
  %40 = load i8*, i8** %39, align 8
  %41 = load i64**, i64*** %ptr_updated
  %42 = load i64*, i64** %41
  call void @list_set_StringIntMapEntry(i8* %40, i64 0, i64* %42)
  ret void
unreachable_5:
  br label %end_if_4
end_if_4:
  %43 = add nsw i64 0, 1
  store i64 %43, i64 0
  br label %while_cond_0
while_end_2:
  %44 = call i8* @malloc(i64 16)
  %45 = bitcast i8* %44 to i64*
  %46 = load i8*, i8** %ptr_key
  %47 = bitcast i64* %45 to i64*
  %48 = getelementptr inbounds i64, i64* %47, i64 0
  %49 = bitcast i64* %48 to i8**
  store i8* %46, i8** %49, align 8
  %50 = load i64, i64* %ptr_value
  %51 = bitcast i64* %45 to i64*
  %52 = getelementptr inbounds i64, i64* %51, i64 1
  %53 = bitcast i64* %52 to i64*
  store i64 %50, i64* %53, align 8
  %54 = load i64**, i64*** %ptr_map
  %55 = bitcast i64** %54 to i64*
  %56 = getelementptr inbounds i64, i64* %55, i64 0
  %57 = bitcast i64* %56 to i8**
  %58 = load i8*, i8** %57, align 8
  %59 = load i64, i64* %45
  call void @list_push_StringIntMapEntry(i8* %58, i64 %59)
  ret void
}

define i64 @string_int_map_get(i64** noalias %param_map, i8* noalias %param_key) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_map, i64*** %ptr_map
  store i8* %param_key, i8** %ptr_key
  br label %while_cond_0
while_cond_0:
  %1 = load i64**, i64*** %ptr_map
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = icmp slt i64 0, %9
  br i1 %10, label %while_body_1, label %while_end_2
while_body_1:
  %11 = load i64**, i64*** %ptr_map
  %12 = bitcast i64** %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i64* @list_get_StringIntMapEntry(i8* %15, i64 0)
  store i64* %16, i64** %ptr_entry
  %17 = load i64*, i64** %ptr_entry
  %18 = bitcast i64* %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = load i8*, i8** %ptr_key
  %23 = call i1 @string_eq(i8* %21, i8* %22)
  br i1 %23, label %then_3, label %end_if_4
then_3:
  %24 = load i64*, i64** %ptr_entry
  %25 = bitcast i64* %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 1
  %27 = bitcast i64* %26 to i64*
  %28 = load i64, i64* %27, align 8
  store i64 %28, i64* %ptr_ret
  %29 = load i64, i64* %ptr_ret
  ret i64 %29
unreachable_5:
  br label %end_if_4
end_if_4:
  %30 = add nsw i64 0, 1
  store i64 %30, i64 0
  br label %while_cond_0
while_end_2:
  store i8* null, i64* %ptr_ret
  %31 = load i64, i64* %ptr_ret
  ret i64 %31
unreachable_6:
  ret i64 0
}

define i1 @string_int_map_contains(i64** noalias %param_map, i8* noalias %param_key) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_map, i64*** %ptr_map
  store i8* %param_key, i8** %ptr_key
  br label %while_cond_0
while_cond_0:
  %1 = load i64**, i64*** %ptr_map
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = icmp slt i64 0, %9
  br i1 %10, label %while_body_1, label %while_end_2
while_body_1:
  %11 = load i64**, i64*** %ptr_map
  %12 = bitcast i64** %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i64* @list_get_StringIntMapEntry(i8* %15, i64 0)
  store i64* %16, i64** %ptr_entry
  %17 = load i64*, i64** %ptr_entry
  %18 = bitcast i64* %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = load i8*, i8** %ptr_key
  %23 = call i1 @string_eq(i8* %21, i8* %22)
  br i1 %23, label %then_3, label %end_if_4
then_3:
  ret i1 1
unreachable_5:
  br label %end_if_4
end_if_4:
  %24 = add nsw i64 0, 1
  store i64 %24, i64 0
  br label %while_cond_0
while_end_2:
  ret i1 0
unreachable_6:
  ret i1 0
}

define i1 @string_str_map_contains(i64** noalias %param_map, i8* noalias %param_key) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_map, i64*** %ptr_map
  store i8* %param_key, i8** %ptr_key
  br label %while_cond_0
while_cond_0:
  %1 = load i64**, i64*** %ptr_map
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = icmp slt i64 0, %9
  br i1 %10, label %while_body_1, label %while_end_2
while_body_1:
  %11 = load i64**, i64*** %ptr_map
  %12 = bitcast i64** %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i64* @list_get_StringStringMapEntry(i8* %15, i64 0)
  store i64* %16, i64** %ptr_entry
  %17 = load i64*, i64** %ptr_entry
  %18 = bitcast i64* %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = load i8*, i8** %ptr_key
  %23 = call i1 @string_eq(i8* %21, i8* %22)
  br i1 %23, label %then_3, label %end_if_4
then_3:
  ret i1 1
unreachable_5:
  br label %end_if_4
end_if_4:
  %24 = add nsw i64 0, 1
  store i64 %24, i64 0
  br label %while_cond_0
while_end_2:
  ret i1 0
unreachable_6:
  ret i1 0
}

define i64** @ir_gen_new() {
entry:
  %shared_vec_idx = alloca i64
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  %1 = call i8* @malloc(i64 80)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_gen
  %3 = call i8* @malloc(i64 40)
  %4 = bitcast i8* %3 to i64*
  %5 = call i64** @new_list_IRFunction(i64 10, i64* %4)
  %6 = call i64** @new_list_IRFunction(i64 10, i64* %4)
  %7 = load i64**, i64*** %ptr_gen
  %8 = bitcast i64** %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 0
  %10 = bitcast i64* %9 to i64***
  store i64** %6, i64*** %10, align 8
  %11 = load i64**, i64*** %ptr_gen
  %12 = bitcast i64** %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 1
  %14 = bitcast i64* %13 to i8**
  store i8* null, i8** %14, align 8
  %15 = load i64**, i64*** %ptr_gen
  %16 = bitcast i64** %15 to i64*
  %17 = getelementptr inbounds i64, i64* %16, i64 2
  %18 = bitcast i64* %17 to i8**
  store i8* null, i8** %18, align 8
  %19 = load i64**, i64*** %ptr_gen
  %20 = bitcast i64** %19 to i64*
  %21 = getelementptr inbounds i64, i64* %20, i64 3
  %22 = bitcast i64* %21 to i64*
  store i64 0, i64* %22, align 8
  %23 = load i64**, i64*** %ptr_gen
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 4
  %26 = bitcast i64* %25 to i64*
  store i64 0, i64* %26, align 8
  %27 = call i8* @malloc(i64 8)
  %28 = bitcast i8* %27 to i64*
  store i64* %28, i64*** %ptr_dummy_instr
  %29 = load i64**, i64*** %ptr_dummy_instr
  %30 = call i64** @new_list_IRInstruction(i64 10, i64** %29)
  %31 = load i64**, i64*** %ptr_dummy_instr
  %32 = call i64** @new_list_IRInstruction(i64 10, i64** %31)
  %33 = load i64**, i64*** %ptr_gen
  %34 = bitcast i64** %33 to i64*
  %35 = getelementptr inbounds i64, i64* %34, i64 5
  %36 = bitcast i64* %35 to i64***
  store i64** %32, i64*** %36, align 8
  %37 = call i8* @malloc(i64 8)
  %38 = bitcast i8* %37 to i64*
  store i64* %38, i64*** %ptr_data_structs
  %39 = call i8* @malloc(i64 16)
  %40 = bitcast i8* %39 to i64*
  store i64* %40, i64*** %ptr_dummy_slme
  %41 = load i64**, i64*** %ptr_dummy_slme
  %42 = call i64** @new_list_StringListMapEntry(i64 10, i64** %41)
  %43 = load i64**, i64*** %ptr_dummy_slme
  %44 = call i64** @new_list_StringListMapEntry(i64 10, i64** %43)
  %45 = load i64**, i64*** %ptr_data_structs
  %46 = bitcast i64** %45 to i64*
  %47 = getelementptr inbounds i64, i64* %46, i64 0
  %48 = bitcast i64* %47 to i64***
  store i64** %44, i64*** %48, align 8
  %49 = load i64**, i64*** %ptr_gen
  %50 = load i64**, i64*** %ptr_data_structs
  %51 = bitcast i64** %49 to i64*
  %52 = getelementptr inbounds i64, i64* %51, i64 6
  %53 = bitcast i64* %52 to i64***
  store i64** %50, i64*** %53, align 8
  %54 = call i8* @malloc(i64 8)
  %55 = bitcast i8* %54 to i64*
  store i64* %55, i64*** %ptr_choice_tags
  %56 = call i8* @malloc(i64 16)
  %57 = bitcast i8* %56 to i64*
  %58 = call i64** @new_list_StringInnerMapEntry(i64 10, i64* %57)
  %59 = call i64** @new_list_StringInnerMapEntry(i64 10, i64* %57)
  %60 = load i64**, i64*** %ptr_choice_tags
  %61 = bitcast i64** %60 to i64*
  %62 = getelementptr inbounds i64, i64* %61, i64 0
  %63 = bitcast i64* %62 to i64***
  store i64** %59, i64*** %63, align 8
  %64 = load i64**, i64*** %ptr_gen
  %65 = load i64**, i64*** %ptr_choice_tags
  %66 = bitcast i64** %64 to i64*
  %67 = getelementptr inbounds i64, i64* %66, i64 7
  %68 = bitcast i64* %67 to i64***
  store i64** %65, i64*** %68, align 8
  %69 = call i8* @malloc(i64 8)
  %70 = bitcast i8* %69 to i64*
  store i64* %70, i64*** %ptr_array_sizes
  %71 = call i8* @malloc(i64 16)
  %72 = bitcast i8* %71 to i64*
  %73 = call i64** @new_list_StringIntMapEntry(i64 10, i64* %72)
  %74 = call i64** @new_list_StringIntMapEntry(i64 10, i64* %72)
  %75 = load i64**, i64*** %ptr_array_sizes
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 0
  %78 = bitcast i64* %77 to i64***
  store i64** %74, i64*** %78, align 8
  %79 = load i64**, i64*** %ptr_gen
  %80 = load i64**, i64*** %ptr_array_sizes
  %81 = bitcast i64** %79 to i64*
  %82 = getelementptr inbounds i64, i64* %81, i64 8
  %83 = bitcast i64* %82 to i64***
  store i64** %80, i64*** %83, align 8
  %84 = call i8* @malloc(i64 8)
  %85 = bitcast i8* %84 to i64*
  %86 = call i8* @malloc(i64 16)
  %87 = bitcast i8* %86 to i64*
  %88 = call i64** @new_list_StringStringMapEntry(i64 10, i64* %87)
  %89 = call i64** @new_list_StringStringMapEntry(i64 10, i64* %87)
  %90 = bitcast i64* %85 to i64*
  %91 = getelementptr inbounds i64, i64* %90, i64 0
  %92 = bitcast i64* %91 to i64***
  store i64** %89, i64*** %92, align 8
  %93 = load i64**, i64*** %ptr_gen
  %94 = bitcast i64** %93 to i64*
  %95 = getelementptr inbounds i64, i64* %94, i64 9
  %96 = bitcast i64* %95 to i64**
  store i64* %85, i64** %96, align 8
  %97 = load i64**, i64*** %ptr_gen
  ret i64** %97
unreachable_0:
  ret i64** null
}

define i64** @ir_new_temp(i64** noalias %param_gen) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_gen, i64*** %ptr_gen
  %1 = load i64**, i64*** %ptr_gen
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 3
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  store i64 %5, i8** %ptr_t
  %6 = load i64**, i64*** %ptr_gen
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 3
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = add nsw i64 %10, 1
  %12 = load i64**, i64*** %ptr_gen
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 3
  %15 = bitcast i64* %14 to i64*
  store i64 %11, i64* %15, align 8
  %16 = call i8* @malloc(i64 8)
  %17 = bitcast i8* %16 to i64*
  store i64* %17, i64*** %ptr_op
  %18 = call i8* @malloc(i64 16)
  %19 = bitcast i8* %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 0
  store i64 6, i64* %20
  %21 = load i8*, i8** %ptr_t
  %22 = getelementptr inbounds i64, i64* %19, i64 1
  %23 = bitcast i64* %22 to i8**
  store i8* %21, i8** %23
  %24 = load i64**, i64*** %ptr_op
  store i64* %19, i64** %24
  %25 = load i64**, i64*** %ptr_op
  ret i64** %25
unreachable_0:
  ret i64** null
}

define i8* @ir_new_label(i64** noalias %param_gen, i8* noalias %param_prefix) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_gen, i64*** %ptr_gen
  store i8* %param_prefix, i8** %ptr_prefix
  %1 = load i64**, i64*** %ptr_gen
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 4
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  store i64 %5, i64*** %ptr_l
  %6 = load i64**, i64*** %ptr_gen
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 4
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = add nsw i64 %10, 1
  %12 = load i64**, i64*** %ptr_gen
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 4
  %15 = bitcast i64* %14 to i64*
  store i64 %11, i64* %15, align 8
  %16 = load i64**, i64*** %ptr_l
  %17 = call i8* @int_to_string(i64** %16)
  %18 = load i8*, i8** %ptr_prefix
  %19 = call i8* @concat_strings(i8* %18, i8* %17)
  ret i8* %19
unreachable_0:
  ret i8* null
}

define void @ir_emit(i64** noalias %param_gen, i64* noalias %param_instr) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_gen, i64*** %ptr_gen
  store i64* %param_instr, i64** %ptr_instr
  %1 = load i64**, i64*** %ptr_gen
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 2
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  store i8* %5, i64*** %ptr_blk_opt
  %6 = load i64**, i64*** %ptr_blk_opt
  %7 = icmp ne i64** %6, null
  br i1 %7, label %then_0, label %else_2
then_0:
  %8 = load i64**, i64*** %ptr_blk_opt
  store i64** %8, i64*** %ptr_blk
  %9 = load i64**, i64*** %ptr_blk
  %10 = bitcast i64** %9 to i64*
  %11 = getelementptr inbounds i64, i64* %10, i64 1
  %12 = bitcast i64* %11 to i8**
  %13 = load i8*, i8** %12, align 8
  %14 = load i64*, i64** %ptr_instr
  call void @list_push_IRInstruction(i8* %13, i64* %14)
  br label %end_if_1
else_2:
  %15 = load i64**, i64*** %ptr_gen
  %16 = bitcast i64** %15 to i64*
  %17 = getelementptr inbounds i64, i64* %16, i64 5
  %18 = bitcast i64* %17 to i8**
  %19 = load i8*, i8** %18, align 8
  %20 = load i64*, i64** %ptr_instr
  call void @list_push_IRInstruction(i8* %19, i64* %20)
  br label %end_if_1
end_if_1:
  ret void
}

define void @ir_finish_block(i64** noalias %param_gen, i64* noalias %param_term) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_gen, i64*** %ptr_gen
  store i64* %param_term, i64** %ptr_term
  %1 = load i64**, i64*** %ptr_gen
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 2
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  store i8* %5, i64*** %ptr_blk_opt
  %6 = load i64**, i64*** %ptr_blk_opt
  %7 = icmp ne i64** %6, null
  br i1 %7, label %then_0, label %end_if_1
then_0:
  %8 = load i64**, i64*** %ptr_blk_opt
  store i64** %8, i64*** %ptr_blk
  store i1 0, i1* %ptr_set_term
  %9 = load i64**, i64*** %ptr_blk
  %10 = bitcast i64** %9 to i64*
  %11 = getelementptr inbounds i64, i64* %10, i64 2
  %12 = bitcast i64* %11 to i8**
  %13 = load i8*, i8** %12, align 8
  %14 = getelementptr inbounds i64, i8* %13, i64 0
  %15 = bitcast i64* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = icmp eq i64 %16, 3
  br i1 %17, label %when_case_3, label %when_next_4
when_case_3:
  store i1 1, i1* %ptr_set_term
  br label %when_end_2
when_next_4:
  %18 = icmp eq i64 %16, 0
  br i1 %18, label %when_case_5, label %when_next_6
when_case_5:
  br label %when_end_2
when_next_6:
  %19 = icmp eq i64 %16, 1
  br i1 %19, label %when_case_7, label %when_next_8
when_case_7:
  br label %when_end_2
when_next_8:
  %20 = icmp eq i64 %16, 2
  br i1 %20, label %when_case_9, label %when_next_10
when_case_9:
  br label %when_end_2
when_next_10:
  br label %when_end_2
when_end_2:
  %21 = load i1, i1* %ptr_set_term
  br i1 %21, label %then_11, label %end_if_12
then_11:
  %22 = load i64**, i64*** %ptr_blk
  %23 = load i64*, i64** %ptr_term
  %24 = bitcast i64** %22 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i64**
  store i64* %23, i64** %26, align 8
  br label %end_if_12
end_if_12:
  %27 = load i64**, i64*** %ptr_gen
  %28 = bitcast i64** %27 to i64*
  %29 = getelementptr inbounds i64, i64* %28, i64 1
  %30 = bitcast i64* %29 to i8**
  %31 = load i8*, i8** %30, align 8
  store i8* %31, i64*** %ptr_fn_opt
  %32 = load i64**, i64*** %ptr_fn_opt
  %33 = icmp ne i64** %32, null
  br i1 %33, label %then_13, label %end_if_14
then_13:
  %34 = load i64**, i64*** %ptr_fn_opt
  %35 = bitcast i64** %34 to i64*
  %36 = getelementptr inbounds i64, i64* %35, i64 3
  %37 = bitcast i64* %36 to i8**
  %38 = load i8*, i8** %37, align 8
  %39 = load i64**, i64*** %ptr_blk
  %40 = load i64*, i64** %39
  call void @list_push_BasicBlock(i8* %38, i64* %40)
  br label %end_if_14
end_if_14:
  %41 = load i64**, i64*** %ptr_gen
  %42 = bitcast i64** %41 to i64*
  %43 = getelementptr inbounds i64, i64* %42, i64 2
  %44 = bitcast i64* %43 to i8**
  store i8* null, i8** %44, align 8
  br label %end_if_1
end_if_1:
  ret void
}

define void @ir_start_block(i64** noalias %param_gen, i8* noalias %param_name) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_gen, i64*** %ptr_gen
  store i8* %param_name, i8** %ptr_name
  %1 = load i64**, i64*** %ptr_gen
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 2
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  store i8* %5, i64*** %ptr_blk_opt
  %6 = load i64**, i64*** %ptr_blk_opt
  %7 = icmp ne i64** %6, null
  br i1 %7, label %then_0, label %end_if_1
then_0:
  %8 = load i64**, i64*** %ptr_blk_opt
  store i64** %8, i64*** %ptr_blk
  store i1 1, i1* %ptr_has_term
  %9 = load i64**, i64*** %ptr_blk
  %10 = bitcast i64** %9 to i64*
  %11 = getelementptr inbounds i64, i64* %10, i64 2
  %12 = bitcast i64* %11 to i8**
  %13 = load i8*, i8** %12, align 8
  %14 = getelementptr inbounds i64, i8* %13, i64 0
  %15 = bitcast i64* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = icmp eq i64 %16, 3
  br i1 %17, label %when_case_3, label %when_next_4
when_case_3:
  store i1 0, i1* %ptr_has_term
  br label %when_end_2
when_next_4:
  %18 = icmp eq i64 %16, 0
  br i1 %18, label %when_case_5, label %when_next_6
when_case_5:
  br label %when_end_2
when_next_6:
  %19 = icmp eq i64 %16, 1
  br i1 %19, label %when_case_7, label %when_next_8
when_case_7:
  br label %when_end_2
when_next_8:
  %20 = icmp eq i64 %16, 2
  br i1 %20, label %when_case_9, label %when_next_10
when_case_9:
  br label %when_end_2
when_next_10:
  br label %when_end_2
when_end_2:
  %21 = load i1, i1* %ptr_has_term
  %22 = xor i1 %21, 1
  br i1 %22, label %then_11, label %else_13
then_11:
  %23 = call i8* @malloc(i64 16)
  %24 = bitcast i8* %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 0
  store i64 0, i64* %25
  %26 = load i8*, i8** %ptr_name
  %27 = getelementptr inbounds i64, i64* %24, i64 1
  %28 = bitcast i64* %27 to i8**
  store i8* %26, i8** %28
  %29 = load i64**, i64*** %ptr_gen
  call void @ir_finish_block(i64** %29, i64* %24)
  br label %end_if_12
else_13:
  %30 = call i8* @malloc(i64 8)
  %31 = bitcast i8* %30 to i64*
  %32 = getelementptr inbounds i64, i64* %31, i64 0
  store i64 3, i64* %32
  %33 = load i64**, i64*** %ptr_gen
  call void @ir_finish_block(i64** %33, i64* %31)
  br label %end_if_12
end_if_12:
  br label %end_if_1
end_if_1:
  %34 = call i8* @malloc(i64 24)
  %35 = bitcast i8* %34 to i64*
  %36 = load i8*, i8** %ptr_name
  %37 = bitcast i64* %35 to i64*
  %38 = getelementptr inbounds i64, i64* %37, i64 0
  %39 = bitcast i64* %38 to i8**
  store i8* %36, i8** %39, align 8
  %40 = call i8* @malloc(i64 8)
  %41 = bitcast i8* %40 to i64*
  store i64* %41, i64*** %ptr_dummy_instr
  %42 = load i64**, i64*** %ptr_dummy_instr
  %43 = call i64** @new_list_IRInstruction(i64 10, i64** %42)
  %44 = load i64**, i64*** %ptr_dummy_instr
  %45 = call i64** @new_list_IRInstruction(i64 10, i64** %44)
  %46 = bitcast i64* %35 to i64*
  %47 = getelementptr inbounds i64, i64* %46, i64 1
  %48 = bitcast i64* %47 to i64***
  store i64** %45, i64*** %48, align 8
  %49 = call i8* @malloc(i64 8)
  %50 = bitcast i8* %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 0
  store i64 3, i64* %51
  %52 = bitcast i64* %35 to i64*
  %53 = getelementptr inbounds i64, i64* %52, i64 2
  %54 = bitcast i64* %53 to i64**
  store i64* %50, i64** %54, align 8
  %55 = load i64**, i64*** %ptr_gen
  %56 = bitcast i64** %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 2
  %58 = bitcast i64* %57 to i64**
  store i64* %35, i64** %58, align 8
  ret void
}

define void @ir_generate(i64** noalias %param_gen, i64** noalias %param_program) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_gen, i64*** %ptr_gen
  store i64** %param_program, i64*** %ptr_program
  br label %while_cond_0
while_cond_0:
  %1 = load i64**, i64*** %ptr_program
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = icmp slt i64 0, %9
  br i1 %10, label %while_body_1, label %while_end_2
while_body_1:
  %11 = load i64**, i64*** %ptr_program
  %12 = bitcast i64** %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 1
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i64* @list_get_Spanned_Declaration(i8* %15, i64 0)
  store i64* %16, i64** %ptr_span_decl
  %17 = load i64*, i64** %ptr_span_decl
  %18 = bitcast i64* %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  store i8* %21, i64** %ptr_decl
  %22 = load i64**, i64*** %ptr_gen
  %23 = load i64*, i64** %ptr_decl
  call void @ir_generate_declaration(i64** %22, i64* %23)
  %24 = add nsw i64 0, 1
  store i64 %24, i64 0
  br label %while_cond_0
while_end_2:
  ret void
}

define void @ir_generate_declaration(i64** noalias %param_gen, i64* noalias %param_decl) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_gen, i64*** %ptr_gen
  store i64* %param_decl, i64** %ptr_decl
  %1 = load i64*, i64** %ptr_decl
  %2 = getelementptr inbounds i64, i64* %1, i64 0
  %3 = bitcast i64* %2 to i64*
  %4 = load i64, i64* %3, align 8
  %5 = icmp eq i64 %4, 2
  br i1 %5, label %when_case_1, label %when_next_2
when_case_1:
  %6 = load i64*, i64** %ptr_decl
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64***
  %9 = load i64**, i64*** %8, align 8
  %10 = load i64**, i64*** %ptr_gen
  %11 = bitcast i64** %10 to i64*
  %12 = getelementptr inbounds i64, i64* %11, i64 3
  %13 = bitcast i64* %12 to i64*
  store i64 0, i64* %13, align 8
  %14 = load i64**, i64*** %ptr_gen
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 4
  %17 = bitcast i64* %16 to i64*
  store i64 0, i64* %17, align 8
  %18 = bitcast i64** %9 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 3
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = icmp ne i8* %21, null
  br i1 %22, label %then_3, label %end_if_4
then_3:
  store i8* %21, i64*** %ptr_r
  %23 = load i64**, i64*** %ptr_r
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 0
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = bitcast i8* %27 to i64*
  %29 = getelementptr inbounds i64, i64* %28, i64 0
  %30 = bitcast i64* %29 to i8**
  %31 = load i8*, i8** %30, align 8
  store i8* %31, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.0, i64 0, i64 0)
  br label %end_if_4
end_if_4:
  %32 = call i8* @malloc(i64 8)
  %33 = bitcast i8* %32 to i64*
  store i64* %33, i8*** %ptr_dummy_str
  %34 = load i8**, i8*** %ptr_dummy_str
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0), i8** %34
  %35 = load i8**, i8*** %ptr_dummy_str
  %36 = call i64** @new_list_String(i64 10, i8** %35)
  store i64** %36, i64*** %ptr_params_list
  br label %while_cond_5
while_cond_5:
  %37 = bitcast i64** %9 to i64*
  %38 = getelementptr inbounds i64, i64* %37, i64 2
  %39 = bitcast i64* %38 to i8**
  %40 = load i8*, i8** %39, align 8
  %41 = bitcast i8* %40 to i64*
  %42 = getelementptr inbounds i64, i64* %41, i64 1
  %43 = bitcast i64* %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = icmp slt i64 0, %44
  br i1 %45, label %while_body_6, label %while_end_7
while_body_6:
  %46 = bitcast i64** %9 to i64*
  %47 = getelementptr inbounds i64, i64* %46, i64 2
  %48 = bitcast i64* %47 to i8**
  %49 = load i8*, i8** %48, align 8
  %50 = call i64* @list_get_Param(i8* %49, i64 0)
  store i64* %50, i64** %ptr_param
  %51 = load i64*, i64** %ptr_param
  %52 = bitcast i64* %51 to i64*
  %53 = getelementptr inbounds i64, i64* %52, i64 1
  %54 = bitcast i64* %53 to i8**
  %55 = load i8*, i8** %54, align 8
  %56 = load i64**, i64*** %ptr_params_list
  call void @list_push_String(i64** %56, i8* %55)
  %57 = add nsw i64 0, 1
  store i64 %57, i64 0
  br label %while_cond_5
while_end_7:
  %58 = call i8* @malloc(i64 40)
  %59 = bitcast i8* %58 to i64*
  %60 = bitcast i64** %9 to i64*
  %61 = getelementptr inbounds i64, i64* %60, i64 0
  %62 = bitcast i64* %61 to i8**
  %63 = load i8*, i8** %62, align 8
  %64 = bitcast i64* %59 to i64*
  %65 = getelementptr inbounds i64, i64* %64, i64 0
  %66 = bitcast i64* %65 to i8**
  store i8* %63, i8** %66, align 8
  %67 = load i64**, i64*** %ptr_params_list
  %68 = bitcast i64* %59 to i64*
  %69 = getelementptr inbounds i64, i64* %68, i64 1
  %70 = bitcast i64* %69 to i64***
  store i64** %67, i64*** %70, align 8
  %71 = bitcast i64* %59 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i8**
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.0, i64 0, i64 0), i8** %73, align 8
  %74 = call i8* @malloc(i64 24)
  %75 = bitcast i8* %74 to i64*
  %76 = call i64** @new_list_BasicBlock(i64 10, i64* %75)
  %77 = call i64** @new_list_BasicBlock(i64 10, i64* %75)
  %78 = bitcast i64* %59 to i64*
  %79 = getelementptr inbounds i64, i64* %78, i64 3
  %80 = bitcast i64* %79 to i64***
  store i64** %77, i64*** %80, align 8
  %81 = bitcast i64* %59 to i64*
  %82 = getelementptr inbounds i64, i64* %81, i64 4
  %83 = bitcast i64* %82 to i1*
  store i1 0, i1* %83, align 8
  %84 = load i64**, i64*** %ptr_gen
  %85 = bitcast i64** %84 to i64*
  %86 = getelementptr inbounds i64, i64* %85, i64 1
  %87 = bitcast i64* %86 to i64**
  store i64* %59, i64** %87, align 8
  %88 = load i64**, i64*** %ptr_gen
  call void @ir_start_block(i64** %88, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0))
  %89 = bitcast i64** %9 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 4
  %91 = bitcast i64* %90 to i8**
  %92 = load i8*, i8** %91, align 8
  %93 = load i64**, i64*** %ptr_gen
  call void @ir_generate_block(i64** %93, i8* %92)
  %94 = load i64**, i64*** %ptr_gen
  %95 = bitcast i64** %94 to i64*
  %96 = getelementptr inbounds i64, i64* %95, i64 2
  %97 = bitcast i64* %96 to i8**
  %98 = load i8*, i8** %97, align 8
  store i8* %98, i64*** %ptr_blk_opt
  %99 = load i64**, i64*** %ptr_blk_opt
  %100 = icmp ne i64** %99, null
  br i1 %100, label %then_8, label %end_if_9
then_8:
  %101 = load i64**, i64*** %ptr_blk_opt
  store i64** %101, i64*** %ptr_blk
  store i1 1, i1* %ptr_has_term
  %102 = load i64**, i64*** %ptr_blk
  %103 = bitcast i64** %102 to i64*
  %104 = getelementptr inbounds i64, i64* %103, i64 2
  %105 = bitcast i64* %104 to i8**
  %106 = load i8*, i8** %105, align 8
  %107 = getelementptr inbounds i64, i8* %106, i64 0
  %108 = bitcast i64* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = icmp eq i64 %109, 3
  br i1 %110, label %when_case_11, label %when_next_12
when_case_11:
  store i1 0, i1* %ptr_has_term
  br label %when_end_10
when_next_12:
  %111 = icmp eq i64 %109, 0
  br i1 %111, label %when_case_13, label %when_next_14
when_case_13:
  br label %when_end_10
when_next_14:
  %112 = icmp eq i64 %109, 1
  br i1 %112, label %when_case_15, label %when_next_16
when_case_15:
  br label %when_end_10
when_next_16:
  %113 = icmp eq i64 %109, 2
  br i1 %113, label %when_case_17, label %when_next_18
when_case_17:
  br label %when_end_10
when_next_18:
  br label %when_end_10
when_end_10:
  %114 = load i1, i1* %ptr_has_term
  %115 = xor i1 %114, 1
  br i1 %115, label %then_19, label %else_21
then_19:
  store i8* null, i64*** %ptr_ret_val
  %116 = call i8* @malloc(i64 16)
  %117 = bitcast i8* %116 to i64*
  %118 = getelementptr inbounds i64, i64* %117, i64 0
  store i64 2, i64* %118
  %119 = load i64**, i64*** %ptr_ret_val
  %120 = getelementptr inbounds i64, i64* %117, i64 1
  %121 = bitcast i64* %120 to i64***
  store i64** %119, i64*** %121
  %122 = load i64**, i64*** %ptr_gen
  call void @ir_finish_block(i64** %122, i64* %117)
  br label %end_if_20
else_21:
  %123 = call i8* @malloc(i64 8)
  %124 = bitcast i8* %123 to i64*
  %125 = getelementptr inbounds i64, i64* %124, i64 0
  store i64 3, i64* %125
  %126 = load i64**, i64*** %ptr_gen
  call void @ir_finish_block(i64** %126, i64* %124)
  br label %end_if_20
end_if_20:
  br label %end_if_9
end_if_9:
  %127 = load i64**, i64*** %ptr_gen
  %128 = bitcast i64** %127 to i64*
  %129 = getelementptr inbounds i64, i64* %128, i64 1
  %130 = bitcast i64* %129 to i8**
  %131 = load i8*, i8** %130, align 8
  store i8* %131, i64*** %ptr_cur_fn_opt
  %132 = load i64**, i64*** %ptr_cur_fn_opt
  %133 = icmp ne i64** %132, null
  br i1 %133, label %then_22, label %end_if_23
then_22:
  %134 = load i64**, i64*** %ptr_cur_fn_opt
  store i64** %134, i64*** %ptr_cur_fn
  %135 = load i64**, i64*** %ptr_gen
  %136 = bitcast i64** %135 to i64*
  %137 = getelementptr inbounds i64, i64* %136, i64 0
  %138 = bitcast i64* %137 to i8**
  %139 = load i8*, i8** %138, align 8
  %140 = load i64**, i64*** %ptr_cur_fn
  %141 = load i64*, i64** %140
  call void @list_push_IRFunction(i8* %139, i64* %141)
  br label %end_if_23
end_if_23:
  %142 = load i64**, i64*** %ptr_gen
  %143 = bitcast i64** %142 to i64*
  %144 = getelementptr inbounds i64, i64* %143, i64 1
  %145 = bitcast i64* %144 to i8**
  store i8* null, i8** %145, align 8
  br label %when_end_0
when_next_2:
  %146 = icmp eq i64 %4, 3
  br i1 %146, label %when_case_24, label %when_next_25
when_case_24:
  %147 = load i64*, i64** %ptr_decl
  %148 = getelementptr inbounds i64, i64* %147, i64 1
  %149 = bitcast i64* %148 to i64***
  %150 = load i64**, i64*** %149, align 8
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.0, i64 0, i64 0)
  %151 = bitcast i64** %150 to i64*
  %152 = getelementptr inbounds i64, i64* %151, i64 3
  %153 = bitcast i64* %152 to i8**
  %154 = load i8*, i8** %153, align 8
  store i8* %154, i8* %21
  %155 = icmp ne i8* %21, null
  br i1 %155, label %then_26, label %end_if_27
then_26:
  store i8* %21, i64*** %ptr_r
  %156 = load i64**, i64*** %ptr_r
  %157 = bitcast i64** %156 to i64*
  %158 = getelementptr inbounds i64, i64* %157, i64 0
  %159 = bitcast i64* %158 to i8**
  %160 = load i8*, i8** %159, align 8
  %161 = bitcast i8* %160 to i64*
  %162 = getelementptr inbounds i64, i64* %161, i64 0
  %163 = bitcast i64* %162 to i8**
  %164 = load i8*, i8** %163, align 8
  store i8* %164, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.0, i64 0, i64 0)
  br label %end_if_27
end_if_27:
  %165 = call i8* @malloc(i64 8)
  %166 = bitcast i8* %165 to i64*
  store i64* %166, i8*** %ptr_dummy_str
  %167 = load i8**, i8*** %ptr_dummy_str
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i64 0, i64 0), i8** %167
  %168 = load i8**, i8*** %ptr_dummy_str
  %169 = call i64** @new_list_String(i64 10, i8** %168)
  store i64** %169, i64*** %ptr_params_list
  store i64 0, i64 0
  br label %while_cond_28
while_cond_28:
  %170 = bitcast i64** %150 to i64*
  %171 = getelementptr inbounds i64, i64* %170, i64 2
  %172 = bitcast i64* %171 to i8**
  %173 = load i8*, i8** %172, align 8
  %174 = bitcast i8* %173 to i64*
  %175 = getelementptr inbounds i64, i64* %174, i64 1
  %176 = bitcast i64* %175 to i64*
  %177 = load i64, i64* %176, align 8
  %178 = icmp slt i64 0, %177
  br i1 %178, label %while_body_29, label %while_end_30
while_body_29:
  %179 = bitcast i64** %150 to i64*
  %180 = getelementptr inbounds i64, i64* %179, i64 2
  %181 = bitcast i64* %180 to i8**
  %182 = load i8*, i8** %181, align 8
  %183 = call i64* @list_get_Param(i8* %182, i64 0)
  store i64* %183, i64** %ptr_param
  %184 = load i64*, i64** %ptr_param
  %185 = bitcast i64* %184 to i64*
  %186 = getelementptr inbounds i64, i64* %185, i64 1
  %187 = bitcast i64* %186 to i8**
  %188 = load i8*, i8** %187, align 8
  %189 = load i64**, i64*** %ptr_params_list
  call void @list_push_String(i64** %189, i8* %188)
  %190 = add nsw i64 0, 1
  store i64 %190, i64 0
  br label %while_cond_28
while_end_30:
  %191 = call i8* @malloc(i64 40)
  %192 = bitcast i8* %191 to i64*
  store i64* %192, i64* %59
  %193 = bitcast i64** %150 to i64*
  %194 = getelementptr inbounds i64, i64* %193, i64 0
  %195 = bitcast i64* %194 to i8**
  %196 = load i8*, i8** %195, align 8
  %197 = bitcast i64* %59 to i64*
  %198 = getelementptr inbounds i64, i64* %197, i64 0
  %199 = bitcast i64* %198 to i8**
  store i8* %196, i8** %199, align 8
  %200 = load i64**, i64*** %ptr_params_list
  %201 = bitcast i64* %59 to i64*
  %202 = getelementptr inbounds i64, i64* %201, i64 1
  %203 = bitcast i64* %202 to i64***
  store i64** %200, i64*** %203, align 8
  %204 = bitcast i64* %59 to i64*
  %205 = getelementptr inbounds i64, i64* %204, i64 2
  %206 = bitcast i64* %205 to i8**
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.0, i64 0, i64 0), i8** %206, align 8
  %207 = call i8* @malloc(i64 24)
  %208 = bitcast i8* %207 to i64*
  store i64* %208, i64* %75
  %209 = call i64** @new_list_BasicBlock(i64 10, i64* %75)
  %210 = call i64** @new_list_BasicBlock(i64 10, i64* %75)
  %211 = bitcast i64* %59 to i64*
  %212 = getelementptr inbounds i64, i64* %211, i64 3
  %213 = bitcast i64* %212 to i64***
  store i64** %210, i64*** %213, align 8
  %214 = bitcast i64* %59 to i64*
  %215 = getelementptr inbounds i64, i64* %214, i64 4
  %216 = bitcast i64* %215 to i1*
  store i1 1, i1* %216, align 8
  %217 = load i64**, i64*** %ptr_gen
  %218 = bitcast i64** %217 to i64*
  %219 = getelementptr inbounds i64, i64* %218, i64 0
  %220 = bitcast i64* %219 to i8**
  %221 = load i8*, i8** %220, align 8
  %222 = load i64, i64* %59
  call void @list_push_IRFunction(i8* %221, i64 %222)
  br label %when_end_0
when_next_25:
  %223 = icmp eq i64 %4, 4
  br i1 %223, label %when_case_31, label %when_next_32
when_case_31:
  %224 = load i64*, i64** %ptr_decl
  %225 = getelementptr inbounds i64, i64* %224, i64 1
  %226 = bitcast i64* %225 to i64***
  %227 = load i64**, i64*** %226, align 8
  %228 = bitcast i64** %227 to i64*
  %229 = getelementptr inbounds i64, i64* %228, i64 3
  %230 = bitcast i64* %229 to i8**
  %231 = load i8*, i8** %230, align 8
  %232 = load i64**, i64*** %ptr_gen
  %233 = call i64** @ir_generate_expression(i64** %232, i8* %231)
  store i64** %233, i64*** %ptr_val
  %234 = call i8* @malloc(i64 8)
  %235 = bitcast i8* %234 to i64*
  %236 = bitcast i64** %227 to i64*
  %237 = getelementptr inbounds i64, i64* %236, i64 1
  %238 = bitcast i64* %237 to i8**
  %239 = load i8*, i8** %238, align 8
  %240 = call i8* @malloc(i64 16)
  %241 = bitcast i8* %240 to i64*
  %242 = getelementptr inbounds i64, i64* %241, i64 0
  store i64 5, i64* %242
  %243 = getelementptr inbounds i64, i64* %241, i64 1
  %244 = bitcast i64* %243 to i8**
  store i8* %239, i8** %244
  store i64* %241, i64* %235
  %245 = call i8* @malloc(i64 24)
  %246 = bitcast i8* %245 to i64*
  %247 = getelementptr inbounds i64, i64* %246, i64 0
  store i64 0, i64* %247
  %248 = getelementptr inbounds i64, i64* %246, i64 1
  %249 = bitcast i64* %248 to i64**
  store i64* %235, i64** %249
  %250 = load i64**, i64*** %ptr_val
  %251 = getelementptr inbounds i64, i64* %246, i64 2
  %252 = bitcast i64* %251 to i64***
  store i64** %250, i64*** %252
  %253 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %253, i64* %246)
  br label %when_end_0
when_next_32:
  %254 = icmp eq i64 %4, 0
  br i1 %254, label %when_case_33, label %when_next_34
when_case_33:
  %255 = load i64*, i64** %ptr_decl
  %256 = getelementptr inbounds i64, i64* %255, i64 1
  %257 = bitcast i64* %256 to i64***
  %258 = load i64**, i64*** %257, align 8
  %259 = call i8* @malloc(i64 8)
  %260 = bitcast i8* %259 to i64*
  store i64* %260, i8*** %ptr_dummy_str
  %261 = load i8**, i8*** %ptr_dummy_str
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.5, i64 0, i64 0), i8** %261
  %262 = load i8**, i8*** %ptr_dummy_str
  %263 = call i64** @new_list_String(i64 10, i8** %262)
  store i64** %263, i64*** %ptr_fields_list
  store i64 0, i64 0
  br label %while_cond_35
while_cond_35:
  %264 = bitcast i64** %258 to i64*
  %265 = getelementptr inbounds i64, i64* %264, i64 2
  %266 = bitcast i64* %265 to i8**
  %267 = load i8*, i8** %266, align 8
  %268 = bitcast i8* %267 to i64*
  %269 = getelementptr inbounds i64, i64* %268, i64 1
  %270 = bitcast i64* %269 to i64*
  %271 = load i64, i64* %270, align 8
  %272 = icmp slt i64 0, %271
  br i1 %272, label %while_body_36, label %while_end_37
while_body_36:
  %273 = bitcast i64** %258 to i64*
  %274 = getelementptr inbounds i64, i64* %273, i64 2
  %275 = bitcast i64* %274 to i8**
  %276 = load i8*, i8** %275, align 8
  %277 = call i64* @list_get_FieldDecl(i8* %276, i64 0)
  store i64* %277, i64** %ptr_field
  %278 = load i64*, i64** %ptr_field
  %279 = bitcast i64* %278 to i64*
  %280 = getelementptr inbounds i64, i64* %279, i64 0
  %281 = bitcast i64* %280 to i8**
  %282 = load i8*, i8** %281, align 8
  %283 = load i64**, i64*** %ptr_fields_list
  call void @list_push_String(i64** %283, i8* %282)
  %284 = add nsw i64 0, 1
  store i64 %284, i64 0
  br label %while_cond_35
while_end_37:
  %285 = load i64**, i64*** %ptr_gen
  %286 = bitcast i64** %285 to i64*
  %287 = getelementptr inbounds i64, i64* %286, i64 6
  %288 = bitcast i64* %287 to i8**
  %289 = load i8*, i8** %288, align 8
  %290 = bitcast i64** %258 to i64*
  %291 = getelementptr inbounds i64, i64* %290, i64 0
  %292 = bitcast i64* %291 to i8**
  %293 = load i8*, i8** %292, align 8
  %294 = load i64**, i64*** %ptr_fields_list
  call void @string_list_map_put(i8* %289, i8* %293, i64** %294)
  br label %when_end_0
when_next_34:
  %295 = icmp eq i64 %4, 1
  br i1 %295, label %when_case_38, label %when_next_39
when_case_38:
  %296 = load i64*, i64** %ptr_decl
  %297 = getelementptr inbounds i64, i64* %296, i64 1
  %298 = bitcast i64* %297 to i64***
  %299 = load i64**, i64*** %298, align 8
  %300 = call i8* @malloc(i64 8)
  %301 = bitcast i8* %300 to i64*
  store i64* %301, i64*** %ptr_tag_map
  %302 = call i8* @malloc(i64 16)
  %303 = bitcast i8* %302 to i64*
  store i64* %303, i64*** %ptr_dummy_entry
  %304 = load i64**, i64*** %ptr_dummy_entry
  %305 = call i64** @new_list_StringIntMapEntry(i64 10, i64** %304)
  %306 = load i64**, i64*** %ptr_dummy_entry
  %307 = call i64** @new_list_StringIntMapEntry(i64 10, i64** %306)
  %308 = load i64**, i64*** %ptr_tag_map
  %309 = bitcast i64** %308 to i64*
  %310 = getelementptr inbounds i64, i64* %309, i64 0
  %311 = bitcast i64* %310 to i64***
  store i64** %307, i64*** %311, align 8
  store i64 0, i64 0
  br label %while_cond_40
while_cond_40:
  %312 = bitcast i64** %299 to i64*
  %313 = getelementptr inbounds i64, i64* %312, i64 2
  %314 = bitcast i64* %313 to i8**
  %315 = load i8*, i8** %314, align 8
  %316 = bitcast i8* %315 to i64*
  %317 = getelementptr inbounds i64, i64* %316, i64 1
  %318 = bitcast i64* %317 to i64*
  %319 = load i64, i64* %318, align 8
  %320 = icmp slt i64 0, %319
  br i1 %320, label %while_body_41, label %while_end_42
while_body_41:
  %321 = bitcast i64** %299 to i64*
  %322 = getelementptr inbounds i64, i64* %321, i64 2
  %323 = bitcast i64* %322 to i8**
  %324 = load i8*, i8** %323, align 8
  %325 = call i64* @list_get_VariantDecl(i8* %324, i64 0)
  store i64* %325, i64** %ptr_variant
  %326 = load i64*, i64** %ptr_variant
  %327 = bitcast i64* %326 to i64*
  %328 = getelementptr inbounds i64, i64* %327, i64 0
  %329 = bitcast i64* %328 to i8**
  %330 = load i8*, i8** %329, align 8
  %331 = load i64**, i64*** %ptr_tag_map
  call void @string_int_map_put(i64** %331, i8* %330, i64 0)
  %332 = add nsw i64 0, 1
  store i64 %332, i64 0
  br label %while_cond_40
while_end_42:
  %333 = load i64**, i64*** %ptr_gen
  %334 = bitcast i64** %333 to i64*
  %335 = getelementptr inbounds i64, i64* %334, i64 7
  %336 = bitcast i64* %335 to i8**
  %337 = load i8*, i8** %336, align 8
  %338 = bitcast i64** %299 to i64*
  %339 = getelementptr inbounds i64, i64* %338, i64 0
  %340 = bitcast i64* %339 to i8**
  %341 = load i8*, i8** %340, align 8
  %342 = load i64**, i64*** %ptr_tag_map
  call void @string_inner_map_put(i8* %337, i8* %341, i64** %342)
  br label %when_end_0
when_next_39:
  br label %when_end_0
when_end_0:
  ret void
}

define void @ir_generate_block(i64** noalias %param_gen, i64** noalias %param_block) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_gen, i64*** %ptr_gen
  store i64** %param_block, i64*** %ptr_block
  br label %while_cond_0
while_cond_0:
  %1 = load i64**, i64*** %ptr_block
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 0
  %8 = bitcast i64* %7 to i8**
  %9 = load i8*, i8** %8, align 8
  %10 = bitcast i8* %9 to i64*
  %11 = getelementptr inbounds i64, i64* %10, i64 1
  %12 = bitcast i64* %11 to i64*
  %13 = load i64, i64* %12, align 8
  %14 = icmp slt i64 0, %13
  br i1 %14, label %while_body_1, label %while_end_2
while_body_1:
  %15 = load i64**, i64*** %ptr_block
  %16 = bitcast i64** %15 to i64*
  %17 = getelementptr inbounds i64, i64* %16, i64 0
  %18 = bitcast i64* %17 to i8**
  %19 = load i8*, i8** %18, align 8
  %20 = bitcast i8* %19 to i64*
  %21 = getelementptr inbounds i64, i64* %20, i64 0
  %22 = bitcast i64* %21 to i8**
  %23 = load i8*, i8** %22, align 8
  %24 = call i64* @list_get_Spanned_Statement(i8* %23, i64 0)
  %25 = call i8* @malloc(i64 16)
  %26 = bitcast i8* %25 to i64*
  store i64* %26, i64*** %ptr_stmt_ptr
  %27 = load i64**, i64*** %ptr_stmt_ptr
  store i64* %24, i64** %27
  %28 = load i64**, i64*** %ptr_gen
  %29 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %28, i64** %29)
  %30 = add nsw i64 0, 1
  store i64 %30, i64 0
  br label %while_cond_0
while_end_2:
  ret void
}

define void @_dummy_instantiate_ir_decl(i64** noalias %param_d) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_d, i64*** %ptr_d
  ret void
}

define void @_dummy_instantiate_ir_stmt(i64** noalias %param_s) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_s, i64*** %ptr_s
  ret void
}

define void @_dummy_instantiate_ir_expr(i64** noalias %param_e) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_e, i64*** %ptr_e
  ret void
}

define void @ir_generate_statement(i64** noalias %param_gen, i64* noalias %param_stmt) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_gen, i64*** %ptr_gen
  store i64* %param_stmt, i64** %ptr_stmt
  %1 = load i64*, i64** %ptr_stmt
  %2 = bitcast i64* %1 to i64*
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
  %14 = getelementptr inbounds i64, i64* %13, i64 2
  %15 = bitcast i64* %14 to i8**
  %16 = load i8*, i8** %15, align 8
  store i8* %16, i64*** %ptr_ty_opt
  %17 = load i64**, i64*** %ptr_ty_opt
  %18 = icmp ne i64** %17, null
  br i1 %18, label %then_3, label %end_if_4
then_3:
  %19 = load i64**, i64*** %ptr_ty_opt
  store i64** %19, i64*** %ptr_ty
  %20 = load i64**, i64*** %ptr_ty
  %21 = bitcast i64** %20 to i64*
  %22 = getelementptr inbounds i64, i64* %21, i64 0
  %23 = bitcast i64* %22 to i8**
  %24 = load i8*, i8** %23, align 8
  %25 = bitcast i8* %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 2
  %27 = bitcast i64* %26 to i1*
  %28 = load i1, i1* %27, align 8
  br i1 %28, label %then_5, label %end_if_6
then_5:
  %29 = load i64**, i64*** %ptr_ty
  %30 = bitcast i64** %29 to i64*
  %31 = getelementptr inbounds i64, i64* %30, i64 0
  %32 = bitcast i64* %31 to i8**
  %33 = load i8*, i8** %32, align 8
  %34 = bitcast i8* %33 to i64*
  %35 = getelementptr inbounds i64, i64* %34, i64 3
  %36 = bitcast i64* %35 to i64*
  %37 = load i64, i64* %36, align 8
  store i64 %37, i64* %ptr_sz
  %38 = load i64, i64* %ptr_sz
  %39 = icmp sgt i64 %38, 0
  br i1 %39, label %then_7, label %end_if_8
then_7:
  %40 = load i64**, i64*** %ptr_gen
  %41 = bitcast i64** %40 to i64*
  %42 = getelementptr inbounds i64, i64* %41, i64 8
  %43 = bitcast i64* %42 to i8**
  %44 = load i8*, i8** %43, align 8
  %45 = bitcast i64** %12 to i64*
  %46 = getelementptr inbounds i64, i64* %45, i64 1
  %47 = bitcast i64* %46 to i8**
  %48 = load i8*, i8** %47, align 8
  %49 = load i64, i64* %ptr_sz
  call void @string_int_map_put(i8* %44, i8* %48, i64 %49)
  br label %end_if_8
end_if_8:
  br label %end_if_6
end_if_6:
  br label %end_if_4
end_if_4:
  %50 = bitcast i64** %12 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 3
  %52 = bitcast i64* %51 to i8**
  %53 = load i8*, i8** %52, align 8
  %54 = load i64**, i64*** %ptr_gen
  %55 = call i64** @ir_generate_expression(i64** %54, i8* %53)
  store i64** %55, i64*** %ptr_val
  %56 = call i8* @malloc(i64 8)
  %57 = bitcast i8* %56 to i64*
  %58 = bitcast i64** %12 to i64*
  %59 = getelementptr inbounds i64, i64* %58, i64 1
  %60 = bitcast i64* %59 to i8**
  %61 = load i8*, i8** %60, align 8
  %62 = call i8* @malloc(i64 16)
  %63 = bitcast i8* %62 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 0
  store i64 5, i64* %64
  %65 = getelementptr inbounds i64, i64* %63, i64 1
  %66 = bitcast i64* %65 to i8**
  store i8* %61, i8** %66
  store i64* %63, i64* %57
  %67 = call i8* @malloc(i64 24)
  %68 = bitcast i8* %67 to i64*
  %69 = getelementptr inbounds i64, i64* %68, i64 0
  store i64 0, i64* %69
  %70 = getelementptr inbounds i64, i64* %68, i64 1
  %71 = bitcast i64* %70 to i64**
  store i64* %57, i64** %71
  %72 = load i64**, i64*** %ptr_val
  %73 = getelementptr inbounds i64, i64* %68, i64 2
  %74 = bitcast i64* %73 to i64***
  store i64** %72, i64*** %74
  %75 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %75, i64* %68)
  br label %when_end_0
when_next_2:
  %76 = icmp eq i64 %8, 1
  br i1 %76, label %when_case_9, label %when_next_10
when_case_9:
  %77 = getelementptr inbounds i64, i8* %5, i64 1
  %78 = bitcast i64* %77 to i64***
  %79 = load i64**, i64*** %78, align 8
  store i1 0, i1* %ptr_handled_special
  %80 = bitcast i64** %79 to i64*
  %81 = getelementptr inbounds i64, i64* %80, i64 0
  %82 = bitcast i64* %81 to i8**
  %83 = load i8*, i8** %82, align 8
  %84 = bitcast i8* %83 to i64*
  %85 = getelementptr inbounds i64, i64* %84, i64 0
  %86 = bitcast i64* %85 to i8**
  %87 = load i8*, i8** %86, align 8
  store i8* %87, i64** %ptr_target_node
  %88 = load i64*, i64** %ptr_target_node
  %89 = getelementptr inbounds i64, i64* %88, i64 0
  %90 = bitcast i64* %89 to i64*
  %91 = load i64, i64* %90, align 8
  %92 = icmp eq i64 %91, 7
  br i1 %92, label %when_case_12, label %when_next_13
when_case_12:
  %93 = load i64*, i64** %ptr_target_node
  %94 = getelementptr inbounds i64, i64* %93, i64 1
  %95 = bitcast i64* %94 to i64***
  %96 = load i64**, i64*** %95, align 8
  %97 = bitcast i64** %96 to i64*
  %98 = getelementptr inbounds i64, i64* %97, i64 0
  %99 = bitcast i64* %98 to i8**
  %100 = load i8*, i8** %99, align 8
  %101 = bitcast i8* %100 to i64*
  %102 = getelementptr inbounds i64, i64* %101, i64 0
  %103 = bitcast i64* %102 to i8**
  %104 = load i8*, i8** %103, align 8
  store i8* %104, i64** %ptr_target_slice_node
  %105 = load i64*, i64** %ptr_target_slice_node
  %106 = getelementptr inbounds i64, i64* %105, i64 0
  %107 = bitcast i64* %106 to i64*
  %108 = load i64, i64* %107, align 8
  %109 = icmp eq i64 %108, 2
  br i1 %109, label %when_case_15, label %when_next_16
when_case_15:
  %110 = load i64*, i64** %ptr_target_slice_node
  %111 = getelementptr inbounds i64, i64* %110, i64 1
  %112 = bitcast i64* %111 to i64***
  %113 = load i64**, i64*** %112, align 8
  %114 = bitcast i64** %113 to i64*
  %115 = getelementptr inbounds i64, i64* %114, i64 0
  %116 = bitcast i64* %115 to i8**
  %117 = load i8*, i8** %116, align 8
  %118 = bitcast i8* %117 to i64*
  %119 = getelementptr inbounds i64, i64* %118, i64 0
  %120 = bitcast i64* %119 to i8**
  %121 = load i8*, i8** %120, align 8
  store i8* %121, i64** %ptr_prop_access_obj_node
  %122 = load i64*, i64** %ptr_prop_access_obj_node
  %123 = getelementptr inbounds i64, i64* %122, i64 0
  %124 = bitcast i64* %123 to i64*
  %125 = load i64, i64* %124, align 8
  %126 = icmp eq i64 %125, 16
  br i1 %126, label %when_case_18, label %when_next_19
when_case_18:
  %127 = load i64*, i64** %ptr_prop_access_obj_node
  %128 = getelementptr inbounds i64, i64* %127, i64 1
  %129 = bitcast i64* %128 to i64***
  %130 = load i64**, i64*** %129, align 8
  %131 = load i64*, i64** %130
  %132 = getelementptr inbounds i64, i64* %131, i64 0
  %133 = bitcast i64* %132 to i64*
  %134 = load i64, i64* %133, align 8
  %135 = icmp eq i64 %134, 0
  br i1 %135, label %when_case_21, label %when_next_22
when_case_21:
  %136 = getelementptr inbounds i64, i64* %131, i64 1
  %137 = bitcast i64* %136 to i8**
  %138 = load i8*, i8** %137, align 8
  store i1 0, i1* %ptr_rhs_is_vector
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.6, i64 0, i64 0), i8** %ptr_rhs_arr
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.7, i64 0, i64 0), i8** %ptr_rhs_prop_name
  %139 = bitcast i64** %79 to i64*
  %140 = getelementptr inbounds i64, i64* %139, i64 2
  %141 = bitcast i64* %140 to i8**
  %142 = load i8*, i8** %141, align 8
  %143 = bitcast i8* %142 to i64*
  %144 = getelementptr inbounds i64, i64* %143, i64 0
  %145 = bitcast i64* %144 to i8**
  %146 = load i8*, i8** %145, align 8
  store i8* %146, i64** %ptr_assign_val_node
  %147 = load i64*, i64** %ptr_assign_val_node
  %148 = getelementptr inbounds i64, i64* %147, i64 0
  %149 = bitcast i64* %148 to i64*
  %150 = load i64, i64* %149, align 8
  %151 = icmp eq i64 %150, 7
  br i1 %151, label %when_case_24, label %when_next_25
when_case_24:
  %152 = load i64*, i64** %ptr_assign_val_node
  %153 = getelementptr inbounds i64, i64* %152, i64 1
  %154 = bitcast i64* %153 to i64***
  %155 = load i64**, i64*** %154, align 8
  %156 = bitcast i64** %155 to i64*
  %157 = getelementptr inbounds i64, i64* %156, i64 0
  %158 = bitcast i64* %157 to i8**
  %159 = load i8*, i8** %158, align 8
  %160 = bitcast i8* %159 to i64*
  %161 = getelementptr inbounds i64, i64* %160, i64 0
  %162 = bitcast i64* %161 to i8**
  %163 = load i8*, i8** %162, align 8
  store i8* %163, i64** %ptr_rhs_slice_target_node
  %164 = load i64*, i64** %ptr_rhs_slice_target_node
  %165 = getelementptr inbounds i64, i64* %164, i64 0
  %166 = bitcast i64* %165 to i64*
  %167 = load i64, i64* %166, align 8
  %168 = icmp eq i64 %167, 2
  br i1 %168, label %when_case_27, label %when_next_28
when_case_27:
  %169 = load i64*, i64** %ptr_rhs_slice_target_node
  %170 = getelementptr inbounds i64, i64* %169, i64 1
  %171 = bitcast i64* %170 to i64***
  %172 = load i64**, i64*** %171, align 8
  %173 = bitcast i64** %172 to i64*
  %174 = getelementptr inbounds i64, i64* %173, i64 0
  %175 = bitcast i64* %174 to i8**
  %176 = load i8*, i8** %175, align 8
  %177 = bitcast i8* %176 to i64*
  %178 = getelementptr inbounds i64, i64* %177, i64 0
  %179 = bitcast i64* %178 to i8**
  %180 = load i8*, i8** %179, align 8
  store i8* %180, i64** %ptr_rhs_prop_obj_node
  %181 = load i64*, i64** %ptr_rhs_prop_obj_node
  %182 = getelementptr inbounds i64, i64* %181, i64 0
  %183 = bitcast i64* %182 to i64*
  %184 = load i64, i64* %183, align 8
  %185 = icmp eq i64 %184, 16
  br i1 %185, label %when_case_30, label %when_next_31
when_case_30:
  %186 = load i64*, i64** %ptr_rhs_prop_obj_node
  %187 = getelementptr inbounds i64, i64* %186, i64 1
  %188 = bitcast i64* %187 to i64***
  %189 = load i64**, i64*** %188, align 8
  %190 = load i64*, i64** %189
  %191 = getelementptr inbounds i64, i64* %190, i64 0
  %192 = bitcast i64* %191 to i64*
  %193 = load i64, i64* %192, align 8
  %194 = icmp eq i64 %193, 0
  br i1 %194, label %when_case_33, label %when_next_34
when_case_33:
  %195 = getelementptr inbounds i64, i64* %190, i64 1
  %196 = bitcast i64* %195 to i8**
  %197 = load i8*, i8** %196, align 8
  store i8* %197, i8** %ptr_name
  %198 = load i64**, i64*** %ptr_gen
  %199 = bitcast i64** %198 to i64*
  %200 = getelementptr inbounds i64, i64* %199, i64 8
  %201 = bitcast i64* %200 to i8**
  %202 = load i8*, i8** %201, align 8
  %203 = load i8*, i8** %ptr_name
  %204 = call i1 @string_int_map_contains(i8* %202, i8* %203)
  %205 = load i64**, i64*** %ptr_gen
  %206 = bitcast i64** %205 to i64*
  %207 = getelementptr inbounds i64, i64* %206, i64 9
  %208 = bitcast i64* %207 to i8**
  %209 = load i8*, i8** %208, align 8
  %210 = load i8*, i8** %ptr_name
  %211 = call i1 @string_str_map_contains(i8* %209, i8* %210)
  %212 = or i1 %204, %211
  br i1 %212, label %then_35, label %end_if_36
then_35:
  store i1 1, i1* %ptr_rhs_is_vector
  %213 = load i8*, i8** %ptr_name
  store i8* %213, i8** %ptr_rhs_arr
  %214 = bitcast i64** %172 to i64*
  %215 = getelementptr inbounds i64, i64* %214, i64 1
  %216 = bitcast i64* %215 to i8**
  %217 = load i8*, i8** %216, align 8
  store i8* %217, i8** %ptr_rhs_prop_name
  br label %end_if_36
end_if_36:
  br label %when_end_32
when_next_34:
  %218 = icmp eq i64 %193, 1
  br i1 %218, label %when_case_37, label %when_next_38
when_case_37:
  br label %when_end_32
when_next_38:
  %219 = icmp eq i64 %193, 2
  br i1 %219, label %when_case_39, label %when_next_40
when_case_39:
  br label %when_end_32
when_next_40:
  %220 = icmp eq i64 %193, 5
  br i1 %220, label %when_case_41, label %when_next_42
when_case_41:
  br label %when_end_32
when_next_42:
  %221 = icmp eq i64 %193, 3
  br i1 %221, label %when_case_43, label %when_next_44
when_case_43:
  br label %when_end_32
when_next_44:
  %222 = icmp eq i64 %193, 4
  br i1 %222, label %when_case_45, label %when_next_46
when_case_45:
  br label %when_end_32
when_next_46:
  %223 = icmp eq i64 %193, 7
  br i1 %223, label %when_case_47, label %when_next_48
when_case_47:
  br label %when_end_32
when_next_48:
  %224 = icmp eq i64 %193, 6
  br i1 %224, label %when_case_49, label %when_next_50
when_case_49:
  br label %when_end_32
when_next_50:
  %225 = icmp eq i64 %193, 8
  br i1 %225, label %when_case_51, label %when_next_52
when_case_51:
  br label %when_end_32
when_next_52:
  br label %when_end_32
when_end_32:
  br label %when_end_29
when_next_31:
  %226 = icmp eq i64 %184, 3
  br i1 %226, label %when_case_53, label %when_next_54
when_case_53:
  br label %when_end_29
when_next_54:
  %227 = icmp eq i64 %184, 4
  br i1 %227, label %when_case_55, label %when_next_56
when_case_55:
  br label %when_end_29
when_next_56:
  %228 = icmp eq i64 %184, 7
  br i1 %228, label %when_case_57, label %when_next_58
when_case_57:
  br label %when_end_29
when_next_58:
  %229 = icmp eq i64 %184, 8
  br i1 %229, label %when_case_59, label %when_next_60
when_case_59:
  br label %when_end_29
when_next_60:
  %230 = icmp eq i64 %184, 9
  br i1 %230, label %when_case_61, label %when_next_62
when_case_61:
  br label %when_end_29
when_next_62:
  %231 = icmp eq i64 %184, 5
  br i1 %231, label %when_case_63, label %when_next_64
when_case_63:
  br label %when_end_29
when_next_64:
  %232 = icmp eq i64 %184, 15
  br i1 %232, label %when_case_65, label %when_next_66
when_case_65:
  br label %when_end_29
when_next_66:
  %233 = icmp eq i64 %184, 11
  br i1 %233, label %when_case_67, label %when_next_68
when_case_67:
  br label %when_end_29
when_next_68:
  %234 = icmp eq i64 %184, 12
  br i1 %234, label %when_case_69, label %when_next_70
when_case_69:
  br label %when_end_29
when_next_70:
  %235 = icmp eq i64 %184, 13
  br i1 %235, label %when_case_71, label %when_next_72
when_case_71:
  br label %when_end_29
when_next_72:
  %236 = icmp eq i64 %184, 14
  br i1 %236, label %when_case_73, label %when_next_74
when_case_73:
  br label %when_end_29
when_next_74:
  %237 = icmp eq i64 %184, 1
  br i1 %237, label %when_case_75, label %when_next_76
when_case_75:
  br label %when_end_29
when_next_76:
  %238 = icmp eq i64 %184, 0
  br i1 %238, label %when_case_77, label %when_next_78
when_case_77:
  br label %when_end_29
when_next_78:
  %239 = icmp eq i64 %184, 2
  br i1 %239, label %when_case_79, label %when_next_80
when_case_79:
  br label %when_end_29
when_next_80:
  %240 = icmp eq i64 %184, 6
  br i1 %240, label %when_case_81, label %when_next_82
when_case_81:
  br label %when_end_29
when_next_82:
  %241 = icmp eq i64 %184, 10
  br i1 %241, label %when_case_83, label %when_next_84
when_case_83:
  br label %when_end_29
when_next_84:
  br label %when_end_29
when_end_29:
  br label %when_end_26
when_next_28:
  %242 = icmp eq i64 %167, 3
  br i1 %242, label %when_case_85, label %when_next_86
when_case_85:
  br label %when_end_26
when_next_86:
  %243 = icmp eq i64 %167, 4
  br i1 %243, label %when_case_87, label %when_next_88
when_case_87:
  br label %when_end_26
when_next_88:
  %244 = icmp eq i64 %167, 7
  br i1 %244, label %when_case_89, label %when_next_90
when_case_89:
  br label %when_end_26
when_next_90:
  %245 = icmp eq i64 %167, 8
  br i1 %245, label %when_case_91, label %when_next_92
when_case_91:
  br label %when_end_26
when_next_92:
  %246 = icmp eq i64 %167, 9
  br i1 %246, label %when_case_93, label %when_next_94
when_case_93:
  br label %when_end_26
when_next_94:
  %247 = icmp eq i64 %167, 5
  br i1 %247, label %when_case_95, label %when_next_96
when_case_95:
  br label %when_end_26
when_next_96:
  %248 = icmp eq i64 %167, 15
  br i1 %248, label %when_case_97, label %when_next_98
when_case_97:
  br label %when_end_26
when_next_98:
  %249 = icmp eq i64 %167, 11
  br i1 %249, label %when_case_99, label %when_next_100
when_case_99:
  br label %when_end_26
when_next_100:
  %250 = icmp eq i64 %167, 12
  br i1 %250, label %when_case_101, label %when_next_102
when_case_101:
  br label %when_end_26
when_next_102:
  %251 = icmp eq i64 %167, 13
  br i1 %251, label %when_case_103, label %when_next_104
when_case_103:
  br label %when_end_26
when_next_104:
  %252 = icmp eq i64 %167, 14
  br i1 %252, label %when_case_105, label %when_next_106
when_case_105:
  br label %when_end_26
when_next_106:
  %253 = icmp eq i64 %167, 1
  br i1 %253, label %when_case_107, label %when_next_108
when_case_107:
  br label %when_end_26
when_next_108:
  %254 = icmp eq i64 %167, 0
  br i1 %254, label %when_case_109, label %when_next_110
when_case_109:
  br label %when_end_26
when_next_110:
  %255 = icmp eq i64 %167, 16
  br i1 %255, label %when_case_111, label %when_next_112
when_case_111:
  br label %when_end_26
when_next_112:
  %256 = icmp eq i64 %167, 6
  br i1 %256, label %when_case_113, label %when_next_114
when_case_113:
  br label %when_end_26
when_next_114:
  %257 = icmp eq i64 %167, 10
  br i1 %257, label %when_case_115, label %when_next_116
when_case_115:
  br label %when_end_26
when_next_116:
  %258 = icmp eq i64 %167, 2
  br i1 %258, label %when_case_117, label %when_next_118
when_case_117:
  br label %when_end_26
when_next_118:
  br label %when_end_26
when_end_26:
  br label %when_end_23
when_next_25:
  %259 = icmp eq i64 %150, 3
  br i1 %259, label %when_case_119, label %when_next_120
when_case_119:
  br label %when_end_23
when_next_120:
  %260 = icmp eq i64 %150, 4
  br i1 %260, label %when_case_121, label %when_next_122
when_case_121:
  br label %when_end_23
when_next_122:
  %261 = icmp eq i64 %150, 8
  br i1 %261, label %when_case_123, label %when_next_124
when_case_123:
  br label %when_end_23
when_next_124:
  %262 = icmp eq i64 %150, 9
  br i1 %262, label %when_case_125, label %when_next_126
when_case_125:
  br label %when_end_23
when_next_126:
  %263 = icmp eq i64 %150, 5
  br i1 %263, label %when_case_127, label %when_next_128
when_case_127:
  br label %when_end_23
when_next_128:
  %264 = icmp eq i64 %150, 15
  br i1 %264, label %when_case_129, label %when_next_130
when_case_129:
  br label %when_end_23
when_next_130:
  %265 = icmp eq i64 %150, 11
  br i1 %265, label %when_case_131, label %when_next_132
when_case_131:
  br label %when_end_23
when_next_132:
  %266 = icmp eq i64 %150, 12
  br i1 %266, label %when_case_133, label %when_next_134
when_case_133:
  br label %when_end_23
when_next_134:
  %267 = icmp eq i64 %150, 13
  br i1 %267, label %when_case_135, label %when_next_136
when_case_135:
  br label %when_end_23
when_next_136:
  %268 = icmp eq i64 %150, 14
  br i1 %268, label %when_case_137, label %when_next_138
when_case_137:
  br label %when_end_23
when_next_138:
  %269 = icmp eq i64 %150, 1
  br i1 %269, label %when_case_139, label %when_next_140
when_case_139:
  br label %when_end_23
when_next_140:
  %270 = icmp eq i64 %150, 0
  br i1 %270, label %when_case_141, label %when_next_142
when_case_141:
  br label %when_end_23
when_next_142:
  %271 = icmp eq i64 %150, 2
  br i1 %271, label %when_case_143, label %when_next_144
when_case_143:
  br label %when_end_23
when_next_144:
  %272 = icmp eq i64 %150, 16
  br i1 %272, label %when_case_145, label %when_next_146
when_case_145:
  br label %when_end_23
when_next_146:
  %273 = icmp eq i64 %150, 6
  br i1 %273, label %when_case_147, label %when_next_148
when_case_147:
  br label %when_end_23
when_next_148:
  %274 = icmp eq i64 %150, 10
  br i1 %274, label %when_case_149, label %when_next_150
when_case_149:
  br label %when_end_23
when_next_150:
  br label %when_end_23
when_end_23:
  %275 = call i8* @malloc(i64 8)
  %276 = bitcast i8* %275 to i64*
  store i64* %276, i64*** %ptr_right_val
  %277 = load i1, i1* %ptr_rhs_is_vector
  br i1 %277, label %then_151, label %else_153
then_151:
  %278 = call i8* @malloc(i64 24)
  %279 = bitcast i8* %278 to i64*
  %280 = getelementptr inbounds i64, i64* %279, i64 0
  store i64 1, i64* %280
  %281 = load i8*, i8** %ptr_rhs_arr
  %282 = getelementptr inbounds i64, i64* %279, i64 1
  %283 = bitcast i64* %282 to i8**
  store i8* %281, i8** %283
  %284 = load i8*, i8** %ptr_rhs_prop_name
  %285 = getelementptr inbounds i64, i64* %279, i64 2
  %286 = bitcast i64* %285 to i8**
  store i8* %284, i8** %286
  %287 = load i64**, i64*** %ptr_right_val
  store i64* %279, i64** %287
  br label %end_if_152
else_153:
  %288 = bitcast i64** %79 to i64*
  %289 = getelementptr inbounds i64, i64* %288, i64 2
  %290 = bitcast i64* %289 to i8**
  %291 = load i8*, i8** %290, align 8
  %292 = load i64**, i64*** %ptr_gen
  %293 = call i64** @ir_generate_expression(i64** %292, i8* %291)
  store i64** %293, i64*** %ptr_scalar_val
  %294 = call i8* @malloc(i64 16)
  %295 = bitcast i8* %294 to i64*
  %296 = getelementptr inbounds i64, i64* %295, i64 0
  store i64 0, i64* %296
  %297 = load i64**, i64*** %ptr_scalar_val
  %298 = getelementptr inbounds i64, i64* %295, i64 1
  %299 = bitcast i64* %298 to i64***
  store i64** %297, i64*** %299
  %300 = load i64**, i64*** %ptr_right_val
  store i64* %295, i64** %300
  br label %end_if_152
end_if_152:
  store i64 0, i64* %ptr_size
  %301 = load i64**, i64*** %ptr_gen
  %302 = bitcast i64** %301 to i64*
  %303 = getelementptr inbounds i64, i64* %302, i64 8
  %304 = bitcast i64* %303 to i8**
  %305 = load i8*, i8** %304, align 8
  %306 = call i64 @string_int_map_get(i8* %305, i8* %138)
  store i64 %306, i64* %ptr_sz_opt
  %307 = load i64, i64* %ptr_sz_opt
  %308 = icmp ne i64 %307, null
  br i1 %308, label %then_154, label %end_if_155
then_154:
  %309 = load i64, i64* %ptr_sz_opt
  store i64 %309, i64*** %ptr_s
  %310 = load i64**, i64*** %ptr_s
  store i64** %310, i64* %ptr_size
  br label %end_if_155
end_if_155:
  %311 = call i8* @malloc(i64 8)
  %312 = bitcast i8* %311 to i64*
  store i64* %312, i64*** %ptr_start_op
  %313 = call i8* @malloc(i64 16)
  %314 = bitcast i8* %313 to i64*
  %315 = getelementptr inbounds i64, i64* %314, i64 0
  store i64 0, i64* %315
  %316 = getelementptr inbounds i64, i64* %314, i64 1
  %317 = bitcast i64* %316 to i64*
  store i64 0, i64* %317
  %318 = load i64**, i64*** %ptr_start_op
  store i64* %314, i64** %318
  %319 = bitcast i64** %96 to i64*
  %320 = getelementptr inbounds i64, i64* %319, i64 1
  %321 = bitcast i64* %320 to i8**
  %322 = load i8*, i8** %321, align 8
  store i8* %322, i64*** %ptr_start_expr_opt
  %323 = load i64**, i64*** %ptr_start_expr_opt
  %324 = icmp ne i64** %323, null
  br i1 %324, label %then_156, label %end_if_157
then_156:
  %325 = load i64**, i64*** %ptr_start_expr_opt
  store i64** %325, i64*** %ptr_s_expr
  %326 = load i64**, i64*** %ptr_gen
  %327 = load i64**, i64*** %ptr_s_expr
  %328 = call i64** @ir_generate_expression(i64** %326, i64** %327)
  store i64** %328, i64*** %ptr_start_op
  br label %end_if_157
end_if_157:
  %329 = call i8* @malloc(i64 8)
  %330 = bitcast i8* %329 to i64*
  store i64* %330, i64*** %ptr_end_op
  %331 = call i8* @malloc(i64 16)
  %332 = bitcast i8* %331 to i64*
  %333 = getelementptr inbounds i64, i64* %332, i64 0
  store i64 0, i64* %333
  %334 = load i64, i64* %ptr_size
  %335 = getelementptr inbounds i64, i64* %332, i64 1
  %336 = bitcast i64* %335 to i64*
  store i64 %334, i64* %336
  %337 = load i64**, i64*** %ptr_end_op
  store i64* %332, i64** %337
  %338 = bitcast i64** %96 to i64*
  %339 = getelementptr inbounds i64, i64* %338, i64 2
  %340 = bitcast i64* %339 to i8**
  %341 = load i8*, i8** %340, align 8
  store i8* %341, i64*** %ptr_end_expr_opt
  %342 = load i64**, i64*** %ptr_end_expr_opt
  %343 = icmp ne i64** %342, null
  br i1 %343, label %then_158, label %end_if_159
then_158:
  %344 = load i64**, i64*** %ptr_end_expr_opt
  store i64** %344, i64*** %ptr_e_expr
  %345 = load i64**, i64*** %ptr_gen
  %346 = load i64**, i64*** %ptr_e_expr
  %347 = call i64** @ir_generate_expression(i64** %345, i64** %346)
  store i64** %347, i64*** %ptr_end_op
  br label %end_if_159
end_if_159:
  %348 = call i8* @malloc(i64 24)
  %349 = bitcast i8* %348 to i64*
  store i64* %349, i64*** %ptr_apply_op
  %350 = bitcast i64** %113 to i64*
  %351 = getelementptr inbounds i64, i64* %350, i64 1
  %352 = bitcast i64* %351 to i8**
  %353 = load i8*, i8** %352, align 8
  %354 = load i64**, i64*** %ptr_apply_op
  %355 = bitcast i64** %354 to i64*
  %356 = getelementptr inbounds i64, i64* %355, i64 0
  %357 = bitcast i64* %356 to i8**
  store i8* %353, i8** %357, align 8
  %358 = bitcast i64** %79 to i64*
  %359 = getelementptr inbounds i64, i64* %358, i64 1
  %360 = bitcast i64* %359 to i8**
  %361 = load i8*, i8** %360, align 8
  %362 = load i64**, i64*** %ptr_apply_op
  %363 = bitcast i64** %362 to i64*
  %364 = getelementptr inbounds i64, i64* %363, i64 1
  %365 = bitcast i64* %364 to i8**
  store i8* %361, i8** %365, align 8
  %366 = load i64**, i64*** %ptr_right_val
  %367 = load i64*, i64** %366
  %368 = load i64**, i64*** %ptr_apply_op
  %369 = bitcast i64** %368 to i64*
  %370 = getelementptr inbounds i64, i64* %369, i64 2
  %371 = bitcast i64* %370 to i64**
  store i64* %367, i64** %371, align 8
  %372 = call i8* @malloc(i64 24)
  %373 = bitcast i8* %372 to i64*
  %374 = call i64** @new_list_FlatVectorApplyOp(i64 1, i64* %373)
  store i64** %374, i64*** %ptr_ops_list
  %375 = load i64**, i64*** %ptr_apply_op
  %376 = load i64*, i64** %375
  %377 = load i64**, i64*** %ptr_ops_list
  call void @list_push_FlatVectorApplyOp(i64** %377, i64* %376)
  %378 = call i8* @malloc(i64 48)
  %379 = bitcast i8* %378 to i64*
  %380 = getelementptr inbounds i64, i64* %379, i64 0
  store i64 6, i64* %380
  %381 = getelementptr inbounds i64, i64* %379, i64 1
  %382 = bitcast i64* %381 to i8**
  store i8* %138, i8** %382
  %383 = load i64**, i64*** %ptr_ops_list
  %384 = getelementptr inbounds i64, i64* %379, i64 2
  %385 = bitcast i64* %384 to i64***
  store i64** %383, i64*** %385
  %386 = load i64**, i64*** %ptr_start_op
  %387 = getelementptr inbounds i64, i64* %379, i64 3
  %388 = bitcast i64* %387 to i64***
  store i64** %386, i64*** %388
  %389 = load i64**, i64*** %ptr_end_op
  %390 = getelementptr inbounds i64, i64* %379, i64 4
  %391 = bitcast i64* %390 to i64***
  store i64** %389, i64*** %391
  %392 = load i64, i64* %ptr_size
  %393 = getelementptr inbounds i64, i64* %379, i64 5
  %394 = bitcast i64* %393 to i64*
  store i64 %392, i64* %394
  %395 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %395, i64* %379)
  store i1 1, i1* %ptr_handled_special
  br label %when_end_20
when_next_22:
  %396 = icmp eq i64 %134, 1
  br i1 %396, label %when_case_160, label %when_next_161
when_case_160:
  br label %when_end_20
when_next_161:
  %397 = icmp eq i64 %134, 2
  br i1 %397, label %when_case_162, label %when_next_163
when_case_162:
  br label %when_end_20
when_next_163:
  %398 = icmp eq i64 %134, 5
  br i1 %398, label %when_case_164, label %when_next_165
when_case_164:
  br label %when_end_20
when_next_165:
  %399 = icmp eq i64 %134, 3
  br i1 %399, label %when_case_166, label %when_next_167
when_case_166:
  br label %when_end_20
when_next_167:
  %400 = icmp eq i64 %134, 4
  br i1 %400, label %when_case_168, label %when_next_169
when_case_168:
  br label %when_end_20
when_next_169:
  %401 = icmp eq i64 %134, 7
  br i1 %401, label %when_case_170, label %when_next_171
when_case_170:
  br label %when_end_20
when_next_171:
  %402 = icmp eq i64 %134, 6
  br i1 %402, label %when_case_172, label %when_next_173
when_case_172:
  br label %when_end_20
when_next_173:
  %403 = icmp eq i64 %134, 8
  br i1 %403, label %when_case_174, label %when_next_175
when_case_174:
  br label %when_end_20
when_next_175:
  br label %when_end_20
when_end_20:
  br label %when_end_17
when_next_19:
  %404 = icmp eq i64 %125, 3
  br i1 %404, label %when_case_176, label %when_next_177
when_case_176:
  br label %when_end_17
when_next_177:
  %405 = icmp eq i64 %125, 4
  br i1 %405, label %when_case_178, label %when_next_179
when_case_178:
  br label %when_end_17
when_next_179:
  %406 = icmp eq i64 %125, 7
  br i1 %406, label %when_case_180, label %when_next_181
when_case_180:
  br label %when_end_17
when_next_181:
  %407 = icmp eq i64 %125, 8
  br i1 %407, label %when_case_182, label %when_next_183
when_case_182:
  br label %when_end_17
when_next_183:
  %408 = icmp eq i64 %125, 9
  br i1 %408, label %when_case_184, label %when_next_185
when_case_184:
  br label %when_end_17
when_next_185:
  %409 = icmp eq i64 %125, 5
  br i1 %409, label %when_case_186, label %when_next_187
when_case_186:
  br label %when_end_17
when_next_187:
  %410 = icmp eq i64 %125, 15
  br i1 %410, label %when_case_188, label %when_next_189
when_case_188:
  br label %when_end_17
when_next_189:
  %411 = icmp eq i64 %125, 11
  br i1 %411, label %when_case_190, label %when_next_191
when_case_190:
  br label %when_end_17
when_next_191:
  %412 = icmp eq i64 %125, 12
  br i1 %412, label %when_case_192, label %when_next_193
when_case_192:
  br label %when_end_17
when_next_193:
  %413 = icmp eq i64 %125, 13
  br i1 %413, label %when_case_194, label %when_next_195
when_case_194:
  br label %when_end_17
when_next_195:
  %414 = icmp eq i64 %125, 14
  br i1 %414, label %when_case_196, label %when_next_197
when_case_196:
  br label %when_end_17
when_next_197:
  %415 = icmp eq i64 %125, 1
  br i1 %415, label %when_case_198, label %when_next_199
when_case_198:
  br label %when_end_17
when_next_199:
  %416 = icmp eq i64 %125, 0
  br i1 %416, label %when_case_200, label %when_next_201
when_case_200:
  br label %when_end_17
when_next_201:
  %417 = icmp eq i64 %125, 2
  br i1 %417, label %when_case_202, label %when_next_203
when_case_202:
  br label %when_end_17
when_next_203:
  %418 = icmp eq i64 %125, 6
  br i1 %418, label %when_case_204, label %when_next_205
when_case_204:
  br label %when_end_17
when_next_205:
  %419 = icmp eq i64 %125, 10
  br i1 %419, label %when_case_206, label %when_next_207
when_case_206:
  br label %when_end_17
when_next_207:
  br label %when_end_17
when_end_17:
  br label %when_end_14
when_next_16:
  %420 = icmp eq i64 %108, 3
  br i1 %420, label %when_case_208, label %when_next_209
when_case_208:
  br label %when_end_14
when_next_209:
  %421 = icmp eq i64 %108, 4
  br i1 %421, label %when_case_210, label %when_next_211
when_case_210:
  br label %when_end_14
when_next_211:
  %422 = icmp eq i64 %108, 7
  br i1 %422, label %when_case_212, label %when_next_213
when_case_212:
  br label %when_end_14
when_next_213:
  %423 = icmp eq i64 %108, 8
  br i1 %423, label %when_case_214, label %when_next_215
when_case_214:
  br label %when_end_14
when_next_215:
  %424 = icmp eq i64 %108, 9
  br i1 %424, label %when_case_216, label %when_next_217
when_case_216:
  br label %when_end_14
when_next_217:
  %425 = icmp eq i64 %108, 5
  br i1 %425, label %when_case_218, label %when_next_219
when_case_218:
  br label %when_end_14
when_next_219:
  %426 = icmp eq i64 %108, 15
  br i1 %426, label %when_case_220, label %when_next_221
when_case_220:
  br label %when_end_14
when_next_221:
  %427 = icmp eq i64 %108, 11
  br i1 %427, label %when_case_222, label %when_next_223
when_case_222:
  br label %when_end_14
when_next_223:
  %428 = icmp eq i64 %108, 12
  br i1 %428, label %when_case_224, label %when_next_225
when_case_224:
  br label %when_end_14
when_next_225:
  %429 = icmp eq i64 %108, 13
  br i1 %429, label %when_case_226, label %when_next_227
when_case_226:
  br label %when_end_14
when_next_227:
  %430 = icmp eq i64 %108, 14
  br i1 %430, label %when_case_228, label %when_next_229
when_case_228:
  br label %when_end_14
when_next_229:
  %431 = icmp eq i64 %108, 1
  br i1 %431, label %when_case_230, label %when_next_231
when_case_230:
  br label %when_end_14
when_next_231:
  %432 = icmp eq i64 %108, 0
  br i1 %432, label %when_case_232, label %when_next_233
when_case_232:
  br label %when_end_14
when_next_233:
  %433 = icmp eq i64 %108, 16
  br i1 %433, label %when_case_234, label %when_next_235
when_case_234:
  br label %when_end_14
when_next_235:
  %434 = icmp eq i64 %108, 6
  br i1 %434, label %when_case_236, label %when_next_237
when_case_236:
  br label %when_end_14
when_next_237:
  %435 = icmp eq i64 %108, 10
  br i1 %435, label %when_case_238, label %when_next_239
when_case_238:
  br label %when_end_14
when_next_239:
  %436 = icmp eq i64 %108, 2
  br i1 %436, label %when_case_240, label %when_next_241
when_case_240:
  br label %when_end_14
when_next_241:
  br label %when_end_14
when_end_14:
  br label %when_end_11
when_next_13:
  %437 = icmp eq i64 %91, 8
  br i1 %437, label %when_case_242, label %when_next_243
when_case_242:
  %438 = load i64*, i64** %ptr_target_node
  %439 = getelementptr inbounds i64, i64* %438, i64 1
  %440 = bitcast i64* %439 to i64***
  %441 = load i64**, i64*** %440, align 8
  %442 = bitcast i64** %441 to i64*
  %443 = getelementptr inbounds i64, i64* %442, i64 0
  %444 = bitcast i64* %443 to i8**
  %445 = load i8*, i8** %444, align 8
  %446 = bitcast i8* %445 to i64*
  %447 = getelementptr inbounds i64, i64* %446, i64 0
  %448 = bitcast i64* %447 to i8**
  %449 = load i8*, i8** %448, align 8
  store i8* %449, i64** %ptr_index_expr_node
  %450 = load i64*, i64** %ptr_index_expr_node
  %451 = getelementptr inbounds i64, i64* %450, i64 0
  %452 = bitcast i64* %451 to i64*
  %453 = load i64, i64* %452, align 8
  %454 = icmp eq i64 %453, 2
  br i1 %454, label %when_case_245, label %when_next_246
when_case_245:
  %455 = load i64*, i64** %ptr_index_expr_node
  %456 = getelementptr inbounds i64, i64* %455, i64 1
  %457 = bitcast i64* %456 to i64***
  %458 = load i64**, i64*** %457, align 8
  store i64** %458, i64** %113
  %459 = bitcast i64** %113 to i64*
  %460 = getelementptr inbounds i64, i64* %459, i64 0
  %461 = bitcast i64* %460 to i8**
  %462 = load i8*, i8** %461, align 8
  %463 = bitcast i8* %462 to i64*
  %464 = getelementptr inbounds i64, i64* %463, i64 0
  %465 = bitcast i64* %464 to i8**
  %466 = load i8*, i8** %465, align 8
  store i8* %466, i64** %ptr_prop_access_obj_node
  %467 = load i64*, i64** %ptr_prop_access_obj_node
  %468 = getelementptr inbounds i64, i64* %467, i64 0
  %469 = bitcast i64* %468 to i64*
  %470 = load i64, i64* %469, align 8
  %471 = icmp eq i64 %470, 16
  br i1 %471, label %when_case_248, label %when_next_249
when_case_248:
  %472 = load i64*, i64** %ptr_prop_access_obj_node
  %473 = getelementptr inbounds i64, i64* %472, i64 1
  %474 = bitcast i64* %473 to i64***
  %475 = load i64**, i64*** %474, align 8
  store i64** %475, i64** %130
  %476 = load i64*, i64** %130
  %477 = getelementptr inbounds i64, i64* %476, i64 0
  %478 = bitcast i64* %477 to i64*
  %479 = load i64, i64* %478, align 8
  %480 = icmp eq i64 %479, 0
  br i1 %480, label %when_case_251, label %when_next_252
when_case_251:
  %481 = getelementptr inbounds i64, i64* %476, i64 1
  %482 = bitcast i64* %481 to i8**
  %483 = load i8*, i8** %482, align 8
  store i8* %483, i8* %138
  %484 = bitcast i64** %79 to i64*
  %485 = getelementptr inbounds i64, i64* %484, i64 2
  %486 = bitcast i64* %485 to i8**
  %487 = load i8*, i8** %486, align 8
  %488 = load i64**, i64*** %ptr_gen
  %489 = call i64** @ir_generate_expression(i64** %488, i8* %487)
  store i64** %489, i64*** %ptr_val
  %490 = bitcast i64** %441 to i64*
  %491 = getelementptr inbounds i64, i64* %490, i64 1
  %492 = bitcast i64* %491 to i8**
  %493 = load i8*, i8** %492, align 8
  %494 = load i64**, i64*** %ptr_gen
  %495 = call i64** @ir_generate_expression(i64** %494, i8* %493)
  store i64** %495, i64*** %ptr_idx
  store i64 0, i64* %ptr_size
  %496 = load i64**, i64*** %ptr_gen
  %497 = bitcast i64** %496 to i64*
  %498 = getelementptr inbounds i64, i64* %497, i64 8
  %499 = bitcast i64* %498 to i8**
  %500 = load i8*, i8** %499, align 8
  %501 = call i64 @string_int_map_get(i8* %500, i8* %138)
  store i64 %501, i64* %ptr_sz_opt
  %502 = load i64, i64* %ptr_sz_opt
  %503 = icmp ne i64 %502, null
  br i1 %503, label %then_253, label %end_if_254
then_253:
  %504 = load i64, i64* %ptr_sz_opt
  store i64 %504, i64*** %ptr_s
  %505 = load i64**, i64*** %ptr_s
  store i64** %505, i64* %ptr_size
  br label %end_if_254
end_if_254:
  %506 = bitcast i64** %113 to i64*
  %507 = getelementptr inbounds i64, i64* %506, i64 1
  %508 = bitcast i64* %507 to i8**
  %509 = load i8*, i8** %508, align 8
  %510 = call i8* @malloc(i64 48)
  %511 = bitcast i8* %510 to i64*
  %512 = getelementptr inbounds i64, i64* %511, i64 0
  store i64 17, i64* %512
  %513 = getelementptr inbounds i64, i64* %511, i64 1
  %514 = bitcast i64* %513 to i8**
  store i8* %138, i8** %514
  %515 = getelementptr inbounds i64, i64* %511, i64 2
  %516 = bitcast i64* %515 to i8**
  store i8* %509, i8** %516
  %517 = load i64**, i64*** %ptr_idx
  %518 = getelementptr inbounds i64, i64* %511, i64 3
  %519 = bitcast i64* %518 to i64***
  store i64** %517, i64*** %519
  %520 = load i64**, i64*** %ptr_val
  %521 = getelementptr inbounds i64, i64* %511, i64 4
  %522 = bitcast i64* %521 to i64***
  store i64** %520, i64*** %522
  %523 = load i64, i64* %ptr_size
  %524 = getelementptr inbounds i64, i64* %511, i64 5
  %525 = bitcast i64* %524 to i64*
  store i64 %523, i64* %525
  %526 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %526, i64* %511)
  store i1 1, i1* %ptr_handled_special
  br label %when_end_250
when_next_252:
  %527 = icmp eq i64 %479, 1
  br i1 %527, label %when_case_255, label %when_next_256
when_case_255:
  br label %when_end_250
when_next_256:
  %528 = icmp eq i64 %479, 2
  br i1 %528, label %when_case_257, label %when_next_258
when_case_257:
  br label %when_end_250
when_next_258:
  %529 = icmp eq i64 %479, 5
  br i1 %529, label %when_case_259, label %when_next_260
when_case_259:
  br label %when_end_250
when_next_260:
  %530 = icmp eq i64 %479, 3
  br i1 %530, label %when_case_261, label %when_next_262
when_case_261:
  br label %when_end_250
when_next_262:
  %531 = icmp eq i64 %479, 4
  br i1 %531, label %when_case_263, label %when_next_264
when_case_263:
  br label %when_end_250
when_next_264:
  %532 = icmp eq i64 %479, 7
  br i1 %532, label %when_case_265, label %when_next_266
when_case_265:
  br label %when_end_250
when_next_266:
  %533 = icmp eq i64 %479, 6
  br i1 %533, label %when_case_267, label %when_next_268
when_case_267:
  br label %when_end_250
when_next_268:
  %534 = icmp eq i64 %479, 8
  br i1 %534, label %when_case_269, label %when_next_270
when_case_269:
  br label %when_end_250
when_next_270:
  br label %when_end_250
when_end_250:
  br label %when_end_247
when_next_249:
  %535 = icmp eq i64 %470, 3
  br i1 %535, label %when_case_271, label %when_next_272
when_case_271:
  br label %when_end_247
when_next_272:
  %536 = icmp eq i64 %470, 4
  br i1 %536, label %when_case_273, label %when_next_274
when_case_273:
  br label %when_end_247
when_next_274:
  %537 = icmp eq i64 %470, 7
  br i1 %537, label %when_case_275, label %when_next_276
when_case_275:
  br label %when_end_247
when_next_276:
  %538 = icmp eq i64 %470, 8
  br i1 %538, label %when_case_277, label %when_next_278
when_case_277:
  br label %when_end_247
when_next_278:
  %539 = icmp eq i64 %470, 9
  br i1 %539, label %when_case_279, label %when_next_280
when_case_279:
  br label %when_end_247
when_next_280:
  %540 = icmp eq i64 %470, 5
  br i1 %540, label %when_case_281, label %when_next_282
when_case_281:
  br label %when_end_247
when_next_282:
  %541 = icmp eq i64 %470, 15
  br i1 %541, label %when_case_283, label %when_next_284
when_case_283:
  br label %when_end_247
when_next_284:
  %542 = icmp eq i64 %470, 11
  br i1 %542, label %when_case_285, label %when_next_286
when_case_285:
  br label %when_end_247
when_next_286:
  %543 = icmp eq i64 %470, 12
  br i1 %543, label %when_case_287, label %when_next_288
when_case_287:
  br label %when_end_247
when_next_288:
  %544 = icmp eq i64 %470, 13
  br i1 %544, label %when_case_289, label %when_next_290
when_case_289:
  br label %when_end_247
when_next_290:
  %545 = icmp eq i64 %470, 14
  br i1 %545, label %when_case_291, label %when_next_292
when_case_291:
  br label %when_end_247
when_next_292:
  %546 = icmp eq i64 %470, 1
  br i1 %546, label %when_case_293, label %when_next_294
when_case_293:
  br label %when_end_247
when_next_294:
  %547 = icmp eq i64 %470, 0
  br i1 %547, label %when_case_295, label %when_next_296
when_case_295:
  br label %when_end_247
when_next_296:
  %548 = icmp eq i64 %470, 2
  br i1 %548, label %when_case_297, label %when_next_298
when_case_297:
  br label %when_end_247
when_next_298:
  %549 = icmp eq i64 %470, 6
  br i1 %549, label %when_case_299, label %when_next_300
when_case_299:
  br label %when_end_247
when_next_300:
  %550 = icmp eq i64 %470, 10
  br i1 %550, label %when_case_301, label %when_next_302
when_case_301:
  br label %when_end_247
when_next_302:
  br label %when_end_247
when_end_247:
  br label %when_end_244
when_next_246:
  %551 = icmp eq i64 %453, 3
  br i1 %551, label %when_case_303, label %when_next_304
when_case_303:
  br label %when_end_244
when_next_304:
  %552 = icmp eq i64 %453, 4
  br i1 %552, label %when_case_305, label %when_next_306
when_case_305:
  br label %when_end_244
when_next_306:
  %553 = icmp eq i64 %453, 7
  br i1 %553, label %when_case_307, label %when_next_308
when_case_307:
  br label %when_end_244
when_next_308:
  %554 = icmp eq i64 %453, 8
  br i1 %554, label %when_case_309, label %when_next_310
when_case_309:
  br label %when_end_244
when_next_310:
  %555 = icmp eq i64 %453, 9
  br i1 %555, label %when_case_311, label %when_next_312
when_case_311:
  br label %when_end_244
when_next_312:
  %556 = icmp eq i64 %453, 5
  br i1 %556, label %when_case_313, label %when_next_314
when_case_313:
  br label %when_end_244
when_next_314:
  %557 = icmp eq i64 %453, 15
  br i1 %557, label %when_case_315, label %when_next_316
when_case_315:
  br label %when_end_244
when_next_316:
  %558 = icmp eq i64 %453, 11
  br i1 %558, label %when_case_317, label %when_next_318
when_case_317:
  br label %when_end_244
when_next_318:
  %559 = icmp eq i64 %453, 12
  br i1 %559, label %when_case_319, label %when_next_320
when_case_319:
  br label %when_end_244
when_next_320:
  %560 = icmp eq i64 %453, 13
  br i1 %560, label %when_case_321, label %when_next_322
when_case_321:
  br label %when_end_244
when_next_322:
  %561 = icmp eq i64 %453, 14
  br i1 %561, label %when_case_323, label %when_next_324
when_case_323:
  br label %when_end_244
when_next_324:
  %562 = icmp eq i64 %453, 1
  br i1 %562, label %when_case_325, label %when_next_326
when_case_325:
  br label %when_end_244
when_next_326:
  %563 = icmp eq i64 %453, 0
  br i1 %563, label %when_case_327, label %when_next_328
when_case_327:
  br label %when_end_244
when_next_328:
  %564 = icmp eq i64 %453, 16
  br i1 %564, label %when_case_329, label %when_next_330
when_case_329:
  br label %when_end_244
when_next_330:
  %565 = icmp eq i64 %453, 6
  br i1 %565, label %when_case_331, label %when_next_332
when_case_331:
  br label %when_end_244
when_next_332:
  %566 = icmp eq i64 %453, 10
  br i1 %566, label %when_case_333, label %when_next_334
when_case_333:
  br label %when_end_244
when_next_334:
  %567 = icmp eq i64 %453, 2
  br i1 %567, label %when_case_335, label %when_next_336
when_case_335:
  br label %when_end_244
when_next_336:
  br label %when_end_244
when_end_244:
  br label %when_end_11
when_next_243:
  %568 = icmp eq i64 %91, 3
  br i1 %568, label %when_case_337, label %when_next_338
when_case_337:
  br label %when_end_11
when_next_338:
  %569 = icmp eq i64 %91, 4
  br i1 %569, label %when_case_339, label %when_next_340
when_case_339:
  br label %when_end_11
when_next_340:
  %570 = icmp eq i64 %91, 9
  br i1 %570, label %when_case_341, label %when_next_342
when_case_341:
  br label %when_end_11
when_next_342:
  %571 = icmp eq i64 %91, 5
  br i1 %571, label %when_case_343, label %when_next_344
when_case_343:
  br label %when_end_11
when_next_344:
  %572 = icmp eq i64 %91, 15
  br i1 %572, label %when_case_345, label %when_next_346
when_case_345:
  br label %when_end_11
when_next_346:
  %573 = icmp eq i64 %91, 11
  br i1 %573, label %when_case_347, label %when_next_348
when_case_347:
  br label %when_end_11
when_next_348:
  %574 = icmp eq i64 %91, 12
  br i1 %574, label %when_case_349, label %when_next_350
when_case_349:
  br label %when_end_11
when_next_350:
  %575 = icmp eq i64 %91, 13
  br i1 %575, label %when_case_351, label %when_next_352
when_case_351:
  br label %when_end_11
when_next_352:
  %576 = icmp eq i64 %91, 14
  br i1 %576, label %when_case_353, label %when_next_354
when_case_353:
  br label %when_end_11
when_next_354:
  %577 = icmp eq i64 %91, 1
  br i1 %577, label %when_case_355, label %when_next_356
when_case_355:
  br label %when_end_11
when_next_356:
  %578 = icmp eq i64 %91, 0
  br i1 %578, label %when_case_357, label %when_next_358
when_case_357:
  br label %when_end_11
when_next_358:
  %579 = icmp eq i64 %91, 2
  br i1 %579, label %when_case_359, label %when_next_360
when_case_359:
  br label %when_end_11
when_next_360:
  %580 = icmp eq i64 %91, 16
  br i1 %580, label %when_case_361, label %when_next_362
when_case_361:
  br label %when_end_11
when_next_362:
  %581 = icmp eq i64 %91, 6
  br i1 %581, label %when_case_363, label %when_next_364
when_case_363:
  br label %when_end_11
when_next_364:
  %582 = icmp eq i64 %91, 10
  br i1 %582, label %when_case_365, label %when_next_366
when_case_365:
  br label %when_end_11
when_next_366:
  br label %when_end_11
when_end_11:
  %583 = load i1, i1* %ptr_handled_special
  %584 = xor i1 %583, 1
  br i1 %584, label %then_367, label %end_if_368
then_367:
  %585 = bitcast i64** %79 to i64*
  %586 = getelementptr inbounds i64, i64* %585, i64 2
  %587 = bitcast i64* %586 to i8**
  %588 = load i8*, i8** %587, align 8
  %589 = load i64**, i64*** %ptr_gen
  %590 = call i64** @ir_generate_expression(i64** %589, i8* %588)
  store i64** %590, i64*** %ptr_right_val
  %591 = load i64**, i64*** %ptr_right_val
  store i64** %591, i64*** %ptr_final_val
  %592 = bitcast i64** %79 to i64*
  %593 = getelementptr inbounds i64, i64* %592, i64 1
  %594 = bitcast i64* %593 to i8**
  %595 = load i8*, i8** %594, align 8
  store i8* %595, i64** %ptr_op_name
  %596 = load i64*, i64** %ptr_op_name
  %597 = getelementptr inbounds i64, i64* %596, i64 0
  %598 = bitcast i64* %597 to i64*
  %599 = load i64, i64* %598, align 8
  %600 = icmp eq i64 %599, 0
  br i1 %600, label %when_case_370, label %when_next_371
when_case_370:
  br label %when_end_369
when_next_371:
  %601 = icmp eq i64 %599, 1
  br i1 %601, label %when_case_372, label %when_next_373
when_case_372:
  %602 = bitcast i64** %79 to i64*
  %603 = getelementptr inbounds i64, i64* %602, i64 0
  %604 = bitcast i64* %603 to i8**
  %605 = load i8*, i8** %604, align 8
  %606 = load i64**, i64*** %ptr_gen
  %607 = call i64** @ir_generate_expression(i64** %606, i8* %605)
  store i64** %607, i64*** %ptr_left_val
  %608 = load i64**, i64*** %ptr_gen
  %609 = call i64** @ir_new_temp(i64** %608)
  %610 = call i8* @malloc(i64 8)
  %611 = bitcast i8* %610 to i64*
  %612 = getelementptr inbounds i64, i64* %611, i64 0
  store i64 14, i64* %612
  %613 = call i8* @malloc(i64 40)
  %614 = bitcast i8* %613 to i64*
  %615 = getelementptr inbounds i64, i64* %614, i64 0
  store i64 2, i64* %615
  %616 = getelementptr inbounds i64, i64* %614, i64 1
  %617 = bitcast i64* %616 to i64***
  store i64** %609, i64*** %617
  %618 = getelementptr inbounds i64, i64* %614, i64 2
  %619 = bitcast i64* %618 to i64**
  store i64* %611, i64** %619
  %620 = load i64**, i64*** %ptr_left_val
  %621 = getelementptr inbounds i64, i64* %614, i64 3
  %622 = bitcast i64* %621 to i64***
  store i64** %620, i64*** %622
  %623 = load i64**, i64*** %ptr_right_val
  %624 = getelementptr inbounds i64, i64* %614, i64 4
  %625 = bitcast i64* %624 to i64***
  store i64** %623, i64*** %625
  %626 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %626, i64* %614)
  store i64** %609, i64*** %ptr_final_val
  br label %when_end_369
when_next_373:
  %627 = icmp eq i64 %599, 2
  br i1 %627, label %when_case_374, label %when_next_375
when_case_374:
  %628 = bitcast i64** %79 to i64*
  %629 = getelementptr inbounds i64, i64* %628, i64 0
  %630 = bitcast i64* %629 to i8**
  %631 = load i8*, i8** %630, align 8
  %632 = load i64**, i64*** %ptr_gen
  %633 = call i64** @ir_generate_expression(i64** %632, i8* %631)
  store i64** %633, i64*** %ptr_left_val
  %634 = load i64**, i64*** %ptr_gen
  %635 = call i64** @ir_new_temp(i64** %634)
  store i64** %635, i64** %609
  %636 = call i8* @malloc(i64 8)
  %637 = bitcast i8* %636 to i64*
  %638 = getelementptr inbounds i64, i64* %637, i64 0
  store i64 15, i64* %638
  %639 = call i8* @malloc(i64 40)
  %640 = bitcast i8* %639 to i64*
  %641 = getelementptr inbounds i64, i64* %640, i64 0
  store i64 2, i64* %641
  %642 = getelementptr inbounds i64, i64* %640, i64 1
  %643 = bitcast i64* %642 to i64***
  store i64** %609, i64*** %643
  %644 = getelementptr inbounds i64, i64* %640, i64 2
  %645 = bitcast i64* %644 to i64**
  store i64* %637, i64** %645
  %646 = load i64**, i64*** %ptr_left_val
  %647 = getelementptr inbounds i64, i64* %640, i64 3
  %648 = bitcast i64* %647 to i64***
  store i64** %646, i64*** %648
  %649 = load i64**, i64*** %ptr_right_val
  %650 = getelementptr inbounds i64, i64* %640, i64 4
  %651 = bitcast i64* %650 to i64***
  store i64** %649, i64*** %651
  %652 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %652, i64* %640)
  store i64** %609, i64*** %ptr_final_val
  br label %when_end_369
when_next_375:
  %653 = icmp eq i64 %599, 3
  br i1 %653, label %when_case_376, label %when_next_377
when_case_376:
  %654 = bitcast i64** %79 to i64*
  %655 = getelementptr inbounds i64, i64* %654, i64 0
  %656 = bitcast i64* %655 to i8**
  %657 = load i8*, i8** %656, align 8
  %658 = load i64**, i64*** %ptr_gen
  %659 = call i64** @ir_generate_expression(i64** %658, i8* %657)
  store i64** %659, i64*** %ptr_left_val
  %660 = load i64**, i64*** %ptr_gen
  %661 = call i64** @ir_new_temp(i64** %660)
  store i64** %661, i64** %609
  %662 = call i8* @malloc(i64 8)
  %663 = bitcast i8* %662 to i64*
  %664 = getelementptr inbounds i64, i64* %663, i64 0
  store i64 16, i64* %664
  %665 = call i8* @malloc(i64 40)
  %666 = bitcast i8* %665 to i64*
  %667 = getelementptr inbounds i64, i64* %666, i64 0
  store i64 2, i64* %667
  %668 = getelementptr inbounds i64, i64* %666, i64 1
  %669 = bitcast i64* %668 to i64***
  store i64** %609, i64*** %669
  %670 = getelementptr inbounds i64, i64* %666, i64 2
  %671 = bitcast i64* %670 to i64**
  store i64* %663, i64** %671
  %672 = load i64**, i64*** %ptr_left_val
  %673 = getelementptr inbounds i64, i64* %666, i64 3
  %674 = bitcast i64* %673 to i64***
  store i64** %672, i64*** %674
  %675 = load i64**, i64*** %ptr_right_val
  %676 = getelementptr inbounds i64, i64* %666, i64 4
  %677 = bitcast i64* %676 to i64***
  store i64** %675, i64*** %677
  %678 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %678, i64* %666)
  store i64** %609, i64*** %ptr_final_val
  br label %when_end_369
when_next_377:
  %679 = icmp eq i64 %599, 4
  br i1 %679, label %when_case_378, label %when_next_379
when_case_378:
  %680 = bitcast i64** %79 to i64*
  %681 = getelementptr inbounds i64, i64* %680, i64 0
  %682 = bitcast i64* %681 to i8**
  %683 = load i8*, i8** %682, align 8
  %684 = load i64**, i64*** %ptr_gen
  %685 = call i64** @ir_generate_expression(i64** %684, i8* %683)
  store i64** %685, i64*** %ptr_left_val
  %686 = load i64**, i64*** %ptr_gen
  %687 = call i64** @ir_new_temp(i64** %686)
  store i64** %687, i64** %609
  %688 = call i8* @malloc(i64 8)
  %689 = bitcast i8* %688 to i64*
  %690 = getelementptr inbounds i64, i64* %689, i64 0
  store i64 17, i64* %690
  %691 = call i8* @malloc(i64 40)
  %692 = bitcast i8* %691 to i64*
  %693 = getelementptr inbounds i64, i64* %692, i64 0
  store i64 2, i64* %693
  %694 = getelementptr inbounds i64, i64* %692, i64 1
  %695 = bitcast i64* %694 to i64***
  store i64** %609, i64*** %695
  %696 = getelementptr inbounds i64, i64* %692, i64 2
  %697 = bitcast i64* %696 to i64**
  store i64* %689, i64** %697
  %698 = load i64**, i64*** %ptr_left_val
  %699 = getelementptr inbounds i64, i64* %692, i64 3
  %700 = bitcast i64* %699 to i64***
  store i64** %698, i64*** %700
  %701 = load i64**, i64*** %ptr_right_val
  %702 = getelementptr inbounds i64, i64* %692, i64 4
  %703 = bitcast i64* %702 to i64***
  store i64** %701, i64*** %703
  %704 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %704, i64* %692)
  store i64** %609, i64*** %ptr_final_val
  br label %when_end_369
when_next_379:
  br label %when_end_369
when_end_369:
  %705 = bitcast i64** %79 to i64*
  %706 = getelementptr inbounds i64, i64* %705, i64 0
  %707 = bitcast i64* %706 to i8**
  %708 = load i8*, i8** %707, align 8
  %709 = bitcast i8* %708 to i64*
  %710 = getelementptr inbounds i64, i64* %709, i64 0
  %711 = bitcast i64* %710 to i8**
  %712 = load i8*, i8** %711, align 8
  store i8* %712, i64** %ptr_fall_assign_target_node
  %713 = load i64*, i64** %ptr_fall_assign_target_node
  %714 = getelementptr inbounds i64, i64* %713, i64 0
  %715 = bitcast i64* %714 to i64*
  %716 = load i64, i64* %715, align 8
  %717 = icmp eq i64 %716, 10
  br i1 %717, label %when_case_381, label %when_next_382
when_case_381:
  %718 = load i64*, i64** %ptr_fall_assign_target_node
  %719 = getelementptr inbounds i64, i64* %718, i64 1
  %720 = bitcast i64* %719 to i64***
  %721 = load i64**, i64*** %720, align 8
  %722 = bitcast i64** %721 to i64*
  %723 = getelementptr inbounds i64, i64* %722, i64 0
  %724 = bitcast i64* %723 to i8**
  %725 = load i8*, i8** %724, align 8
  %726 = load i64**, i64*** %ptr_gen
  %727 = call i64** @ir_generate_expression(i64** %726, i8* %725)
  store i64** %727, i64*** %ptr_ptr_op
  %728 = bitcast i64** %721 to i64*
  %729 = getelementptr inbounds i64, i64* %728, i64 1
  %730 = bitcast i64* %729 to i64*
  %731 = load i64, i64* %730, align 8
  %732 = call i8* @malloc(i64 32)
  %733 = bitcast i8* %732 to i64*
  %734 = getelementptr inbounds i64, i64* %733, i64 0
  store i64 15, i64* %734
  %735 = load i64**, i64*** %ptr_ptr_op
  %736 = getelementptr inbounds i64, i64* %733, i64 1
  %737 = bitcast i64* %736 to i64***
  store i64** %735, i64*** %737
  %738 = getelementptr inbounds i64, i64* %733, i64 2
  %739 = bitcast i64* %738 to i64*
  store i64 %731, i64* %739
  %740 = load i64**, i64*** %ptr_final_val
  %741 = getelementptr inbounds i64, i64* %733, i64 3
  %742 = bitcast i64* %741 to i64***
  store i64** %740, i64*** %742
  %743 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %743, i64* %733)
  br label %when_end_380
when_next_382:
  %744 = icmp eq i64 %716, 2
  br i1 %744, label %when_case_383, label %when_next_384
when_case_383:
  %745 = load i64*, i64** %ptr_fall_assign_target_node
  %746 = getelementptr inbounds i64, i64* %745, i64 1
  %747 = bitcast i64* %746 to i64***
  %748 = load i64**, i64*** %747, align 8
  store i64** %748, i64** %113
  %749 = bitcast i64** %113 to i64*
  %750 = getelementptr inbounds i64, i64* %749, i64 0
  %751 = bitcast i64* %750 to i8**
  %752 = load i8*, i8** %751, align 8
  %753 = load i64**, i64*** %ptr_gen
  %754 = call i64** @ir_generate_expression(i64** %753, i8* %752)
  store i64** %754, i64*** %ptr_obj_val
  %755 = bitcast i64** %113 to i64*
  %756 = getelementptr inbounds i64, i64* %755, i64 1
  %757 = bitcast i64* %756 to i8**
  %758 = load i8*, i8** %757, align 8
  %759 = call i8* @malloc(i64 32)
  %760 = bitcast i8* %759 to i64*
  %761 = getelementptr inbounds i64, i64* %760, i64 0
  store i64 4, i64* %761
  %762 = load i64**, i64*** %ptr_obj_val
  %763 = getelementptr inbounds i64, i64* %760, i64 1
  %764 = bitcast i64* %763 to i64***
  store i64** %762, i64*** %764
  %765 = getelementptr inbounds i64, i64* %760, i64 2
  %766 = bitcast i64* %765 to i8**
  store i8* %758, i8** %766
  %767 = load i64**, i64*** %ptr_final_val
  %768 = getelementptr inbounds i64, i64* %760, i64 3
  %769 = bitcast i64* %768 to i64***
  store i64** %767, i64*** %769
  %770 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %770, i64* %760)
  br label %when_end_380
when_next_384:
  %771 = icmp eq i64 %716, 6
  br i1 %771, label %when_case_385, label %when_next_386
when_case_385:
  %772 = load i64*, i64** %ptr_fall_assign_target_node
  %773 = getelementptr inbounds i64, i64* %772, i64 1
  %774 = bitcast i64* %773 to i64***
  %775 = load i64**, i64*** %774, align 8
  %776 = load i64**, i64*** %ptr_gen
  %777 = call i64** @ir_generate_expression(i64** %776, i64** %775)
  store i64** %777, i64*** %ptr_ptr_val
  %778 = call i8* @malloc(i64 24)
  %779 = bitcast i8* %778 to i64*
  %780 = getelementptr inbounds i64, i64* %779, i64 0
  store i64 13, i64* %780
  %781 = load i64**, i64*** %ptr_ptr_val
  %782 = getelementptr inbounds i64, i64* %779, i64 1
  %783 = bitcast i64* %782 to i64***
  store i64** %781, i64*** %783
  %784 = load i64**, i64*** %ptr_final_val
  %785 = getelementptr inbounds i64, i64* %779, i64 2
  %786 = bitcast i64* %785 to i64***
  store i64** %784, i64*** %786
  %787 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %787, i64* %779)
  br label %when_end_380
when_next_386:
  %788 = icmp eq i64 %716, 16
  br i1 %788, label %when_case_387, label %when_next_388
when_case_387:
  %789 = load i64*, i64** %ptr_fall_assign_target_node
  %790 = getelementptr inbounds i64, i64* %789, i64 1
  %791 = bitcast i64* %790 to i64***
  %792 = load i64**, i64*** %791, align 8
  store i64** %792, i64** %130
  %793 = load i64*, i64** %130
  %794 = getelementptr inbounds i64, i64* %793, i64 0
  %795 = bitcast i64* %794 to i64*
  %796 = load i64, i64* %795, align 8
  %797 = icmp eq i64 %796, 0
  br i1 %797, label %when_case_390, label %when_next_391
when_case_390:
  %798 = getelementptr inbounds i64, i64* %793, i64 1
  %799 = bitcast i64* %798 to i8**
  %800 = load i8*, i8** %799, align 8
  store i8* %800, i8** %ptr_name
  %801 = call i8* @malloc(i64 8)
  %802 = bitcast i8* %801 to i64*
  store i64* %802, i64* %57
  %803 = call i8* @malloc(i64 16)
  %804 = bitcast i8* %803 to i64*
  %805 = getelementptr inbounds i64, i64* %804, i64 0
  store i64 5, i64* %805
  %806 = load i8*, i8** %ptr_name
  %807 = getelementptr inbounds i64, i64* %804, i64 1
  %808 = bitcast i64* %807 to i8**
  store i8* %806, i8** %808
  store i64* %804, i64* %57
  %809 = call i8* @malloc(i64 24)
  %810 = bitcast i8* %809 to i64*
  %811 = getelementptr inbounds i64, i64* %810, i64 0
  store i64 0, i64* %811
  %812 = getelementptr inbounds i64, i64* %810, i64 1
  %813 = bitcast i64* %812 to i64**
  store i64* %57, i64** %813
  %814 = load i64**, i64*** %ptr_final_val
  %815 = getelementptr inbounds i64, i64* %810, i64 2
  %816 = bitcast i64* %815 to i64***
  store i64** %814, i64*** %816
  %817 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %817, i64* %810)
  br label %when_end_389
when_next_391:
  %818 = icmp eq i64 %796, 1
  br i1 %818, label %when_case_392, label %when_next_393
when_case_392:
  br label %when_end_389
when_next_393:
  %819 = icmp eq i64 %796, 2
  br i1 %819, label %when_case_394, label %when_next_395
when_case_394:
  br label %when_end_389
when_next_395:
  %820 = icmp eq i64 %796, 5
  br i1 %820, label %when_case_396, label %when_next_397
when_case_396:
  br label %when_end_389
when_next_397:
  %821 = icmp eq i64 %796, 3
  br i1 %821, label %when_case_398, label %when_next_399
when_case_398:
  br label %when_end_389
when_next_399:
  %822 = icmp eq i64 %796, 4
  br i1 %822, label %when_case_400, label %when_next_401
when_case_400:
  br label %when_end_389
when_next_401:
  %823 = icmp eq i64 %796, 7
  br i1 %823, label %when_case_402, label %when_next_403
when_case_402:
  br label %when_end_389
when_next_403:
  %824 = icmp eq i64 %796, 6
  br i1 %824, label %when_case_404, label %when_next_405
when_case_404:
  br label %when_end_389
when_next_405:
  %825 = icmp eq i64 %796, 8
  br i1 %825, label %when_case_406, label %when_next_407
when_case_406:
  br label %when_end_389
when_next_407:
  br label %when_end_389
when_end_389:
  br label %when_end_380
when_next_388:
  %826 = icmp eq i64 %716, 3
  br i1 %826, label %when_case_408, label %when_next_409
when_case_408:
  br label %when_end_380
when_next_409:
  %827 = icmp eq i64 %716, 4
  br i1 %827, label %when_case_410, label %when_next_411
when_case_410:
  br label %when_end_380
when_next_411:
  %828 = icmp eq i64 %716, 9
  br i1 %828, label %when_case_412, label %when_next_413
when_case_412:
  br label %when_end_380
when_next_413:
  %829 = icmp eq i64 %716, 5
  br i1 %829, label %when_case_414, label %when_next_415
when_case_414:
  br label %when_end_380
when_next_415:
  %830 = icmp eq i64 %716, 15
  br i1 %830, label %when_case_416, label %when_next_417
when_case_416:
  br label %when_end_380
when_next_417:
  %831 = icmp eq i64 %716, 11
  br i1 %831, label %when_case_418, label %when_next_419
when_case_418:
  br label %when_end_380
when_next_419:
  %832 = icmp eq i64 %716, 12
  br i1 %832, label %when_case_420, label %when_next_421
when_case_420:
  br label %when_end_380
when_next_421:
  %833 = icmp eq i64 %716, 13
  br i1 %833, label %when_case_422, label %when_next_423
when_case_422:
  br label %when_end_380
when_next_423:
  %834 = icmp eq i64 %716, 14
  br i1 %834, label %when_case_424, label %when_next_425
when_case_424:
  br label %when_end_380
when_next_425:
  %835 = icmp eq i64 %716, 1
  br i1 %835, label %when_case_426, label %when_next_427
when_case_426:
  br label %when_end_380
when_next_427:
  %836 = icmp eq i64 %716, 0
  br i1 %836, label %when_case_428, label %when_next_429
when_case_428:
  br label %when_end_380
when_next_429:
  %837 = icmp eq i64 %716, 7
  br i1 %837, label %when_case_430, label %when_next_431
when_case_430:
  br label %when_end_380
when_next_431:
  %838 = icmp eq i64 %716, 8
  br i1 %838, label %when_case_432, label %when_next_433
when_case_432:
  br label %when_end_380
when_next_433:
  br label %when_end_380
when_end_380:
  br label %end_if_368
end_if_368:
  br label %when_end_0
when_next_10:
  %839 = icmp eq i64 %8, 2
  br i1 %839, label %when_case_434, label %when_next_435
when_case_434:
  %840 = getelementptr inbounds i64, i8* %5, i64 1
  %841 = bitcast i64* %840 to i64***
  %842 = load i64**, i64*** %841, align 8
  %843 = bitcast i64** %842 to i64*
  %844 = getelementptr inbounds i64, i64* %843, i64 0
  %845 = bitcast i64* %844 to i8**
  %846 = load i8*, i8** %845, align 8
  %847 = load i64**, i64*** %ptr_gen
  %848 = call i64** @ir_generate_expression(i64** %847, i8* %846)
  store i64** %848, i64*** %ptr_cond
  %849 = load i64**, i64*** %ptr_gen
  %850 = call i8* @ir_new_label(i64** %849, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i64 0, i64 0))
  store i8* %850, i8** %ptr_then_label
  %851 = load i64**, i64*** %ptr_gen
  %852 = call i8* @ir_new_label(i64** %851, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i64 0, i64 0))
  store i8* %852, i8** %ptr_end_label
  %853 = load i8*, i8** %ptr_end_label
  store i8* %853, i8** %ptr_else_label
  %854 = bitcast i64** %842 to i64*
  %855 = getelementptr inbounds i64, i64* %854, i64 2
  %856 = bitcast i64* %855 to i8**
  %857 = load i8*, i8** %856, align 8
  store i8* %857, i64*** %ptr_else_opt
  %858 = load i64**, i64*** %ptr_else_opt
  %859 = icmp ne i64** %858, null
  br i1 %859, label %then_436, label %end_if_437
then_436:
  %860 = load i64**, i64*** %ptr_gen
  %861 = call i8* @ir_new_label(i64** %860, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.10, i64 0, i64 0))
  store i8* %861, i8** %ptr_else_label
  br label %end_if_437
end_if_437:
  %862 = call i8* @malloc(i64 32)
  %863 = bitcast i8* %862 to i64*
  %864 = getelementptr inbounds i64, i64* %863, i64 0
  store i64 1, i64* %864
  %865 = load i64**, i64*** %ptr_cond
  %866 = getelementptr inbounds i64, i64* %863, i64 1
  %867 = bitcast i64* %866 to i64***
  store i64** %865, i64*** %867
  %868 = load i8*, i8** %ptr_then_label
  %869 = getelementptr inbounds i64, i64* %863, i64 2
  %870 = bitcast i64* %869 to i8**
  store i8* %868, i8** %870
  %871 = load i8*, i8** %ptr_else_label
  %872 = getelementptr inbounds i64, i64* %863, i64 3
  %873 = bitcast i64* %872 to i8**
  store i8* %871, i8** %873
  %874 = load i64**, i64*** %ptr_gen
  call void @ir_finish_block(i64** %874, i64* %863)
  %875 = load i64**, i64*** %ptr_gen
  %876 = load i8*, i8** %ptr_then_label
  call void @ir_start_block(i64** %875, i8* %876)
  %877 = bitcast i64** %842 to i64*
  %878 = getelementptr inbounds i64, i64* %877, i64 1
  %879 = bitcast i64* %878 to i8**
  %880 = load i8*, i8** %879, align 8
  %881 = load i64**, i64*** %ptr_gen
  call void @ir_generate_block(i64** %881, i8* %880)
  %882 = call i8* @malloc(i64 16)
  %883 = bitcast i8* %882 to i64*
  %884 = getelementptr inbounds i64, i64* %883, i64 0
  store i64 0, i64* %884
  %885 = load i8*, i8** %ptr_end_label
  %886 = getelementptr inbounds i64, i64* %883, i64 1
  %887 = bitcast i64* %886 to i8**
  store i8* %885, i8** %887
  %888 = load i64**, i64*** %ptr_gen
  call void @ir_finish_block(i64** %888, i64* %883)
  %889 = load i64**, i64*** %ptr_else_opt
  %890 = icmp ne i64** %889, null
  br i1 %890, label %then_438, label %end_if_439
then_438:
  %891 = load i64**, i64*** %ptr_gen
  %892 = load i8*, i8** %ptr_else_label
  call void @ir_start_block(i64** %891, i8* %892)
  %893 = load i64**, i64*** %ptr_else_opt
  store i64** %893, i64*** %ptr_else_br
  %894 = load i64**, i64*** %ptr_else_br
  %895 = bitcast i64** %894 to i64*
  %896 = getelementptr inbounds i64, i64* %895, i64 0
  %897 = bitcast i64* %896 to i8**
  %898 = load i8*, i8** %897, align 8
  %899 = getelementptr inbounds i64, i8* %898, i64 0
  %900 = bitcast i64* %899 to i64*
  %901 = load i64, i64* %900, align 8
  %902 = icmp eq i64 %901, 2
  br i1 %902, label %when_case_441, label %when_next_442
when_case_441:
  %903 = getelementptr inbounds i64, i8* %898, i64 1
  %904 = bitcast i64* %903 to i64***
  %905 = load i64**, i64*** %904, align 8
  %906 = call i8* @malloc(i64 16)
  %907 = bitcast i8* %906 to i64*
  store i64* %907, i64*** %ptr_span_if
  %908 = call i8* @malloc(i64 8)
  %909 = bitcast i8* %908 to i64*
  store i64* %909, i64** %ptr_stmt
  %910 = call i8* @malloc(i64 16)
  %911 = bitcast i8* %910 to i64*
  %912 = getelementptr inbounds i64, i64* %911, i64 0
  store i64 2, i64* %912
  %913 = getelementptr inbounds i64, i64* %911, i64 1
  %914 = bitcast i64* %913 to i64***
  store i64** %905, i64*** %914
  %915 = load i64*, i64** %ptr_stmt
  store i64* %911, i64* %915
  %916 = load i64*, i64** %ptr_stmt
  %917 = load i64, i64* %916
  %918 = load i64**, i64*** %ptr_span_if
  %919 = bitcast i64** %918 to i64*
  %920 = getelementptr inbounds i64, i64* %919, i64 0
  %921 = bitcast i64* %920 to i64*
  store i64 %917, i64* %921, align 8
  %922 = load i64**, i64*** %ptr_else_br
  %923 = bitcast i64** %922 to i64*
  %924 = getelementptr inbounds i64, i64* %923, i64 1
  %925 = bitcast i64* %924 to i8**
  %926 = load i8*, i8** %925, align 8
  %927 = load i64**, i64*** %ptr_span_if
  %928 = bitcast i64** %927 to i64*
  %929 = getelementptr inbounds i64, i64* %928, i64 1
  %930 = bitcast i64* %929 to i8**
  store i8* %926, i8** %930, align 8
  %931 = load i64**, i64*** %ptr_gen
  %932 = load i64**, i64*** %ptr_span_if
  call void @ir_generate_statement(i64** %931, i64** %932)
  br label %when_end_440
when_next_442:
  %933 = icmp eq i64 %901, 1
  br i1 %933, label %when_case_443, label %when_next_444
when_case_443:
  %934 = getelementptr inbounds i64, i8* %898, i64 1
  %935 = bitcast i64* %934 to i64***
  %936 = load i64**, i64*** %935, align 8
  store i64** %936, i64*** %ptr_b
  %937 = call i8* @malloc(i64 16)
  %938 = bitcast i8* %937 to i64*
  store i64* %938, i64*** %ptr_span_b
  %939 = load i64**, i64*** %ptr_b
  %940 = load i64*, i64** %939
  %941 = load i64**, i64*** %ptr_span_b
  %942 = bitcast i64** %941 to i64*
  %943 = getelementptr inbounds i64, i64* %942, i64 0
  %944 = bitcast i64* %943 to i64**
  store i64* %940, i64** %944, align 8
  %945 = load i64**, i64*** %ptr_else_br
  %946 = bitcast i64** %945 to i64*
  %947 = getelementptr inbounds i64, i64* %946, i64 1
  %948 = bitcast i64* %947 to i8**
  %949 = load i8*, i8** %948, align 8
  %950 = load i64**, i64*** %ptr_span_b
  %951 = bitcast i64** %950 to i64*
  %952 = getelementptr inbounds i64, i64* %951, i64 1
  %953 = bitcast i64* %952 to i8**
  store i8* %949, i8** %953, align 8
  %954 = load i64**, i64*** %ptr_gen
  %955 = load i64**, i64*** %ptr_span_b
  call void @ir_generate_block(i64** %954, i64** %955)
  br label %when_end_440
when_next_444:
  br label %when_end_440
when_end_440:
  %956 = call i8* @malloc(i64 16)
  %957 = bitcast i8* %956 to i64*
  %958 = getelementptr inbounds i64, i64* %957, i64 0
  store i64 0, i64* %958
  %959 = load i8*, i8** %ptr_end_label
  %960 = getelementptr inbounds i64, i64* %957, i64 1
  %961 = bitcast i64* %960 to i8**
  store i8* %959, i8** %961
  %962 = load i64**, i64*** %ptr_gen
  call void @ir_finish_block(i64** %962, i64* %957)
  br label %end_if_439
end_if_439:
  %963 = load i64**, i64*** %ptr_gen
  %964 = load i8*, i8** %ptr_end_label
  call void @ir_start_block(i64** %963, i8* %964)
  br label %when_end_0
when_next_435:
  %965 = icmp eq i64 %8, 3
  br i1 %965, label %when_case_445, label %when_next_446
when_case_445:
  %966 = getelementptr inbounds i64, i8* %5, i64 1
  %967 = bitcast i64* %966 to i64***
  %968 = load i64**, i64*** %967, align 8
  %969 = load i64**, i64*** %ptr_gen
  %970 = call i8* @ir_new_label(i64** %969, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.11, i64 0, i64 0))
  store i8* %970, i8** %ptr_cond_label
  %971 = load i64**, i64*** %ptr_gen
  %972 = call i8* @ir_new_label(i64** %971, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.12, i64 0, i64 0))
  store i8* %972, i8** %ptr_body_label
  %973 = load i64**, i64*** %ptr_gen
  %974 = call i8* @ir_new_label(i64** %973, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.13, i64 0, i64 0))
  store i8* %974, i8** %ptr_end_label
  %975 = call i8* @malloc(i64 16)
  %976 = bitcast i8* %975 to i64*
  %977 = getelementptr inbounds i64, i64* %976, i64 0
  store i64 0, i64* %977
  %978 = load i8*, i8** %ptr_cond_label
  %979 = getelementptr inbounds i64, i64* %976, i64 1
  %980 = bitcast i64* %979 to i8**
  store i8* %978, i8** %980
  %981 = load i64**, i64*** %ptr_gen
  call void @ir_finish_block(i64** %981, i64* %976)
  %982 = load i64**, i64*** %ptr_gen
  %983 = load i8*, i8** %ptr_cond_label
  call void @ir_start_block(i64** %982, i8* %983)
  %984 = bitcast i64** %968 to i64*
  %985 = getelementptr inbounds i64, i64* %984, i64 0
  %986 = bitcast i64* %985 to i8**
  %987 = load i8*, i8** %986, align 8
  %988 = load i64**, i64*** %ptr_gen
  %989 = call i64** @ir_generate_expression(i64** %988, i8* %987)
  store i64** %989, i64*** %ptr_cond
  %990 = call i8* @malloc(i64 32)
  %991 = bitcast i8* %990 to i64*
  %992 = getelementptr inbounds i64, i64* %991, i64 0
  store i64 1, i64* %992
  %993 = load i64**, i64*** %ptr_cond
  %994 = getelementptr inbounds i64, i64* %991, i64 1
  %995 = bitcast i64* %994 to i64***
  store i64** %993, i64*** %995
  %996 = load i8*, i8** %ptr_body_label
  %997 = getelementptr inbounds i64, i64* %991, i64 2
  %998 = bitcast i64* %997 to i8**
  store i8* %996, i8** %998
  %999 = load i8*, i8** %ptr_end_label
  %1000 = getelementptr inbounds i64, i64* %991, i64 3
  %1001 = bitcast i64* %1000 to i8**
  store i8* %999, i8** %1001
  %1002 = load i64**, i64*** %ptr_gen
  call void @ir_finish_block(i64** %1002, i64* %991)
  %1003 = load i64**, i64*** %ptr_gen
  %1004 = load i8*, i8** %ptr_body_label
  call void @ir_start_block(i64** %1003, i8* %1004)
  %1005 = bitcast i64** %968 to i64*
  %1006 = getelementptr inbounds i64, i64* %1005, i64 1
  %1007 = bitcast i64* %1006 to i8**
  %1008 = load i8*, i8** %1007, align 8
  %1009 = load i64**, i64*** %ptr_gen
  call void @ir_generate_block(i64** %1009, i8* %1008)
  %1010 = call i8* @malloc(i64 16)
  %1011 = bitcast i8* %1010 to i64*
  %1012 = getelementptr inbounds i64, i64* %1011, i64 0
  store i64 0, i64* %1012
  %1013 = load i8*, i8** %ptr_cond_label
  %1014 = getelementptr inbounds i64, i64* %1011, i64 1
  %1015 = bitcast i64* %1014 to i8**
  store i8* %1013, i8** %1015
  %1016 = load i64**, i64*** %ptr_gen
  call void @ir_finish_block(i64** %1016, i64* %1011)
  %1017 = load i64**, i64*** %ptr_gen
  %1018 = load i8*, i8** %ptr_end_label
  call void @ir_start_block(i64** %1017, i8* %1018)
  br label %when_end_0
when_next_446:
  %1019 = icmp eq i64 %8, 2
  br i1 %1019, label %when_case_447, label %when_next_448
when_case_447:
  %1020 = getelementptr inbounds i64, i8* %5, i64 1
  %1021 = bitcast i64* %1020 to i64***
  %1022 = load i64**, i64*** %1021, align 8
  store i8* null, i64*** %ptr_val_opt
  %1023 = bitcast i64** %1022 to i64*
  %1024 = getelementptr inbounds i64, i64* %1023, i64 0
  %1025 = bitcast i64* %1024 to i8**
  %1026 = load i8*, i8** %1025, align 8
  store i8* %1026, i64*** %ptr_expr_opt
  %1027 = load i64**, i64*** %ptr_expr_opt
  %1028 = icmp ne i64** %1027, null
  br i1 %1028, label %then_449, label %end_if_450
then_449:
  %1029 = load i64**, i64*** %ptr_expr_opt
  store i64** %1029, i64*** %ptr_e
  %1030 = load i64**, i64*** %ptr_gen
  %1031 = load i64**, i64*** %ptr_e
  %1032 = call i64** @ir_generate_expression(i64** %1030, i64** %1031)
  store i64** %1032, i64*** %ptr_val_opt
  br label %end_if_450
end_if_450:
  %1033 = call i8* @malloc(i64 16)
  %1034 = bitcast i8* %1033 to i64*
  %1035 = getelementptr inbounds i64, i64* %1034, i64 0
  store i64 2, i64* %1035
  %1036 = load i64**, i64*** %ptr_val_opt
  %1037 = getelementptr inbounds i64, i64* %1034, i64 1
  %1038 = bitcast i64* %1037 to i64***
  store i64** %1036, i64*** %1038
  %1039 = load i64**, i64*** %ptr_gen
  call void @ir_finish_block(i64** %1039, i64* %1034)
  br label %when_end_0
when_next_448:
  %1040 = icmp eq i64 %8, 5
  br i1 %1040, label %when_case_451, label %when_next_452
when_case_451:
  %1041 = getelementptr inbounds i64, i8* %5, i64 1
  %1042 = bitcast i64* %1041 to i64***
  %1043 = load i64**, i64*** %1042, align 8
  %1044 = load i64**, i64*** %ptr_gen
  %1045 = call i64** @ir_generate_expression(i64** %1044, i64** %1043)
  br label %when_end_0
when_next_452:
  %1046 = icmp eq i64 %8, 11
  br i1 %1046, label %when_case_453, label %when_next_454
when_case_453:
  %1047 = getelementptr inbounds i64, i8* %5, i64 1
  %1048 = bitcast i64* %1047 to i64***
  %1049 = load i64**, i64*** %1048, align 8
  store i64** %1049, i64** %1043
  %1050 = load i64**, i64*** %ptr_gen
  %1051 = call i64** @ir_generate_expression(i64** %1050, i64** %1043)
  %1052 = call i8* @malloc(i64 16)
  %1053 = bitcast i8* %1052 to i64*
  %1054 = getelementptr inbounds i64, i64* %1053, i64 0
  store i64 11, i64* %1054
  %1055 = getelementptr inbounds i64, i64* %1053, i64 1
  %1056 = bitcast i64* %1055 to i64***
  store i64** %1051, i64*** %1056
  %1057 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %1057, i64* %1053)
  br label %when_end_0
when_next_454:
  %1058 = icmp eq i64 %8, 7
  br i1 %1058, label %when_case_455, label %when_next_456
when_case_455:
  br label %when_end_0
when_next_456:
  %1059 = icmp eq i64 %8, 8
  br i1 %1059, label %when_case_457, label %when_next_458
when_case_457:
  br label %when_end_0
when_next_458:
  br label %when_end_0
when_end_0:
  ret void
}

define i64** @ir_generate_expression(i64** noalias %param_gen, i64** noalias %param_expr) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
  store i64** %param_gen, i64*** %ptr_gen
  store i64** %param_expr, i64*** %ptr_expr
  %1 = call i8* @malloc(i64 8)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_ret_op
  %3 = call i8* @malloc(i64 8)
  %4 = bitcast i8* %3 to i64*
  %5 = getelementptr inbounds i64, i64* %4, i64 0
  store i64 7, i64* %5
  %6 = load i64**, i64*** %ptr_ret_op
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
  %27 = call i8* @malloc(i64 16)
  %28 = bitcast i8* %27 to i64*
  %29 = getelementptr inbounds i64, i64* %28, i64 0
  store i64 5, i64* %29
  %30 = load i8*, i8** %ptr_name
  %31 = getelementptr inbounds i64, i64* %28, i64 1
  %32 = bitcast i64* %31 to i8**
  store i8* %30, i8** %32
  %33 = load i64**, i64*** %ptr_ret_op
  store i64* %28, i64** %33
  br label %when_end_3
when_next_5:
  %34 = icmp eq i64 %22, 1
  br i1 %34, label %when_case_6, label %when_next_7
when_case_6:
  %35 = getelementptr inbounds i64, i64* %19, i64 1
  %36 = bitcast i64* %35 to i64***
  %37 = load i64**, i64*** %36, align 8
  store i64** %37, i64*** %ptr_val
  %38 = call i8* @malloc(i64 16)
  %39 = bitcast i8* %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 0
  store i64 0, i64* %40
  %41 = load i64**, i64*** %ptr_val
  %42 = getelementptr inbounds i64, i64* %39, i64 1
  %43 = bitcast i64* %42 to i64***
  store i64** %41, i64*** %43
  %44 = load i64**, i64*** %ptr_ret_op
  store i64* %39, i64** %44
  br label %when_end_3
when_next_7:
  %45 = icmp eq i64 %22, 2
  br i1 %45, label %when_case_8, label %when_next_9
when_case_8:
  %46 = getelementptr inbounds i64, i64* %19, i64 1
  %47 = bitcast i64* %46 to i64***
  %48 = load i64**, i64*** %47, align 8
  store i64** %48, i64*** %ptr_val
  %49 = call i8* @malloc(i64 16)
  %50 = bitcast i8* %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 0
  store i64 1, i64* %51
  %52 = load i64**, i64*** %ptr_val
  %53 = getelementptr inbounds i64, i64* %50, i64 1
  %54 = bitcast i64* %53 to i64***
  store i64** %52, i64*** %54
  %55 = load i64**, i64*** %ptr_ret_op
  store i64* %50, i64** %55
  br label %when_end_3
when_next_9:
  %56 = icmp eq i64 %22, 3
  br i1 %56, label %when_case_10, label %when_next_11
when_case_10:
  %57 = getelementptr inbounds i64, i64* %19, i64 1
  %58 = bitcast i64* %57 to i64***
  %59 = load i64**, i64*** %58, align 8
  store i64** %59, i64*** %ptr_val
  %60 = call i8* @malloc(i64 16)
  %61 = bitcast i8* %60 to i64*
  %62 = getelementptr inbounds i64, i64* %61, i64 0
  store i64 2, i64* %62
  %63 = load i64**, i64*** %ptr_val
  %64 = getelementptr inbounds i64, i64* %61, i64 1
  %65 = bitcast i64* %64 to i64***
  store i64** %63, i64*** %65
  %66 = load i64**, i64*** %ptr_ret_op
  store i64* %61, i64** %66
  br label %when_end_3
when_next_11:
  %67 = icmp eq i64 %22, 4
  br i1 %67, label %when_case_12, label %when_next_13
when_case_12:
  %68 = getelementptr inbounds i64, i64* %19, i64 1
  %69 = bitcast i64* %68 to i64***
  %70 = load i64**, i64*** %69, align 8
  store i64** %70, i64*** %ptr_val
  %71 = call i8* @malloc(i64 16)
  %72 = bitcast i8* %71 to i64*
  %73 = getelementptr inbounds i64, i64* %72, i64 0
  store i64 3, i64* %73
  %74 = load i64**, i64*** %ptr_val
  %75 = getelementptr inbounds i64, i64* %72, i64 1
  %76 = bitcast i64* %75 to i64***
  store i64** %74, i64*** %76
  %77 = load i64**, i64*** %ptr_ret_op
  store i64* %72, i64** %77
  br label %when_end_3
when_next_13:
  %78 = icmp eq i64 %22, 5
  br i1 %78, label %when_case_14, label %when_next_15
when_case_14:
  %79 = getelementptr inbounds i64, i64* %19, i64 1
  %80 = bitcast i64* %79 to i64***
  %81 = load i64**, i64*** %80, align 8
  store i64** %81, i64*** %ptr_val
  %82 = call i8* @malloc(i64 16)
  %83 = bitcast i8* %82 to i64*
  %84 = getelementptr inbounds i64, i64* %83, i64 0
  store i64 4, i64* %84
  %85 = load i64**, i64*** %ptr_val
  %86 = getelementptr inbounds i64, i64* %83, i64 1
  %87 = bitcast i64* %86 to i64***
  store i64** %85, i64*** %87
  %88 = load i64**, i64*** %ptr_ret_op
  store i64* %83, i64** %88
  br label %when_end_3
when_next_15:
  %89 = icmp eq i64 %22, 7
  br i1 %89, label %when_case_16, label %when_next_17
when_case_16:
  %90 = call i8* @malloc(i64 8)
  %91 = bitcast i8* %90 to i64*
  %92 = getelementptr inbounds i64, i64* %91, i64 0
  store i64 7, i64* %92
  %93 = load i64**, i64*** %ptr_ret_op
  store i64* %91, i64** %93
  br label %when_end_3
when_next_17:
  %94 = icmp eq i64 %22, 8
  br i1 %94, label %when_case_18, label %when_next_19
when_case_18:
  %95 = getelementptr inbounds i64, i64* %19, i64 1
  %96 = bitcast i64* %95 to i64***
  %97 = load i64**, i64*** %96, align 8
  %98 = load i64**, i64*** %ptr_gen
  %99 = call i64** @ir_generate_expression(i64** %98, i64** %97)
  ret i64** %99
unreachable_20:
  br label %when_end_3
when_next_19:
  %100 = icmp eq i64 %22, 6
  br i1 %100, label %when_case_21, label %when_next_22
when_case_21:
  br label %when_end_3
when_next_22:
  br label %when_end_3
when_end_3:
  br label %when_end_0
when_next_2:
  %101 = icmp eq i64 %14, 0
  br i1 %101, label %when_case_23, label %when_next_24
when_case_23:
  %102 = getelementptr inbounds i64, i8* %11, i64 1
  %103 = bitcast i64* %102 to i64***
  %104 = load i64**, i64*** %103, align 8
  store i64** %104, i64*** %ptr_u
  %105 = load i64**, i64*** %ptr_u
  %106 = bitcast i64** %105 to i64*
  %107 = getelementptr inbounds i64, i64* %106, i64 1
  %108 = bitcast i64* %107 to i8**
  %109 = load i8*, i8** %108, align 8
  %110 = load i64**, i64*** %ptr_gen
  %111 = call i64** @ir_generate_expression(i64** %110, i8* %109)
  store i64** %111, i64*** %ptr_operand
  %112 = load i64**, i64*** %ptr_gen
  %113 = call i64** @ir_new_temp(i64** %112)
  %114 = load i64**, i64*** %ptr_u
  %115 = bitcast i64** %114 to i64*
  %116 = getelementptr inbounds i64, i64* %115, i64 0
  %117 = bitcast i64* %116 to i8**
  %118 = load i8*, i8** %117, align 8
  %119 = call i8* @malloc(i64 32)
  %120 = bitcast i8* %119 to i64*
  %121 = getelementptr inbounds i64, i64* %120, i64 0
  store i64 1, i64* %121
  %122 = getelementptr inbounds i64, i64* %120, i64 1
  %123 = bitcast i64* %122 to i64***
  store i64** %113, i64*** %123
  %124 = getelementptr inbounds i64, i64* %120, i64 2
  %125 = bitcast i64* %124 to i8**
  store i8* %118, i8** %125
  %126 = load i64**, i64*** %ptr_operand
  %127 = getelementptr inbounds i64, i64* %120, i64 3
  %128 = bitcast i64* %127 to i64***
  store i64** %126, i64*** %128
  %129 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %129, i64* %120)
  ret i64** %113
unreachable_25:
  br label %when_end_0
when_next_24:
  %130 = icmp eq i64 %14, 1
  br i1 %130, label %when_case_26, label %when_next_27
when_case_26:
  %131 = getelementptr inbounds i64, i8* %11, i64 1
  %132 = bitcast i64* %131 to i64***
  %133 = load i64**, i64*** %132, align 8
  store i64** %133, i64*** %ptr_b
  %134 = load i64**, i64*** %ptr_b
  %135 = bitcast i64** %134 to i64*
  %136 = getelementptr inbounds i64, i64* %135, i64 0
  %137 = bitcast i64* %136 to i8**
  %138 = load i8*, i8** %137, align 8
  %139 = load i64**, i64*** %ptr_gen
  %140 = call i64** @ir_generate_expression(i64** %139, i8* %138)
  store i64** %140, i64*** %ptr_left
  %141 = load i64**, i64*** %ptr_b
  %142 = bitcast i64** %141 to i64*
  %143 = getelementptr inbounds i64, i64* %142, i64 2
  %144 = bitcast i64* %143 to i8**
  %145 = load i8*, i8** %144, align 8
  %146 = load i64**, i64*** %ptr_gen
  %147 = call i64** @ir_generate_expression(i64** %146, i8* %145)
  store i64** %147, i64*** %ptr_right
  %148 = load i64**, i64*** %ptr_gen
  %149 = call i64** @ir_new_temp(i64** %148)
  store i64** %149, i64** %113
  %150 = load i64**, i64*** %ptr_b
  %151 = bitcast i64** %150 to i64*
  %152 = getelementptr inbounds i64, i64* %151, i64 1
  %153 = bitcast i64* %152 to i8**
  %154 = load i8*, i8** %153, align 8
  %155 = call i8* @malloc(i64 40)
  %156 = bitcast i8* %155 to i64*
  %157 = getelementptr inbounds i64, i64* %156, i64 0
  store i64 2, i64* %157
  %158 = getelementptr inbounds i64, i64* %156, i64 1
  %159 = bitcast i64* %158 to i64***
  store i64** %113, i64*** %159
  %160 = getelementptr inbounds i64, i64* %156, i64 2
  %161 = bitcast i64* %160 to i8**
  store i8* %154, i8** %161
  %162 = load i64**, i64*** %ptr_left
  %163 = getelementptr inbounds i64, i64* %156, i64 3
  %164 = bitcast i64* %163 to i64***
  store i64** %162, i64*** %164
  %165 = load i64**, i64*** %ptr_right
  %166 = getelementptr inbounds i64, i64* %156, i64 4
  %167 = bitcast i64* %166 to i64***
  store i64** %165, i64*** %167
  %168 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %168, i64* %156)
  ret i64** %113
unreachable_28:
  br label %when_end_0
when_next_27:
  %169 = icmp eq i64 %14, 2
  br i1 %169, label %when_case_29, label %when_next_30
when_case_29:
  %170 = getelementptr inbounds i64, i8* %11, i64 1
  %171 = bitcast i64* %170 to i64***
  %172 = load i64**, i64*** %171, align 8
  store i64** %172, i64*** %ptr_p
  %173 = load i64**, i64*** %ptr_p
  %174 = bitcast i64** %173 to i64*
  %175 = getelementptr inbounds i64, i64* %174, i64 0
  %176 = bitcast i64* %175 to i8**
  %177 = load i8*, i8** %176, align 8
  %178 = load i64**, i64*** %ptr_gen
  %179 = call i64** @ir_generate_expression(i64** %178, i8* %177)
  store i64** %179, i64*** %ptr_obj
  %180 = load i64**, i64*** %ptr_gen
  %181 = call i64** @ir_new_temp(i64** %180)
  store i64** %181, i64** %113
  %182 = load i64**, i64*** %ptr_p
  %183 = bitcast i64** %182 to i64*
  %184 = getelementptr inbounds i64, i64* %183, i64 1
  %185 = bitcast i64* %184 to i8**
  %186 = load i8*, i8** %185, align 8
  %187 = call i8* @malloc(i64 32)
  %188 = bitcast i8* %187 to i64*
  %189 = getelementptr inbounds i64, i64* %188, i64 0
  store i64 3, i64* %189
  %190 = getelementptr inbounds i64, i64* %188, i64 1
  %191 = bitcast i64* %190 to i64***
  store i64** %113, i64*** %191
  %192 = load i64**, i64*** %ptr_obj
  %193 = getelementptr inbounds i64, i64* %188, i64 2
  %194 = bitcast i64* %193 to i64***
  store i64** %192, i64*** %194
  %195 = getelementptr inbounds i64, i64* %188, i64 3
  %196 = bitcast i64* %195 to i8**
  store i8* %186, i8** %196
  %197 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %197, i64* %188)
  ret i64** %113
unreachable_31:
  br label %when_end_0
when_next_30:
  %198 = icmp eq i64 %14, 3
  br i1 %198, label %when_case_32, label %when_next_33
when_case_32:
  %199 = getelementptr inbounds i64, i8* %11, i64 1
  %200 = bitcast i64* %199 to i64***
  %201 = load i64**, i64*** %200, align 8
  store i64** %201, i64*** %ptr_c
  %202 = load i64**, i64*** %ptr_c
  %203 = bitcast i64** %202 to i64*
  %204 = getelementptr inbounds i64, i64* %203, i64 0
  %205 = bitcast i64* %204 to i8**
  %206 = load i8*, i8** %205, align 8
  %207 = load i64**, i64*** %ptr_gen
  %208 = call i64** @ir_generate_expression(i64** %207, i8* %206)
  store i64** %208, i64*** %ptr_callee
  %209 = load i64**, i64*** %ptr_callee
  %210 = call i64** @new_list_IROperand(i64 10, i64** %209)
  store i64** %210, i64*** %ptr_args_list
  br label %while_cond_34
while_cond_34:
  %211 = load i64**, i64*** %ptr_c
  %212 = bitcast i64** %211 to i64*
  %213 = getelementptr inbounds i64, i64* %212, i64 1
  %214 = bitcast i64* %213 to i8**
  %215 = load i8*, i8** %214, align 8
  %216 = bitcast i8* %215 to i64*
  %217 = getelementptr inbounds i64, i64* %216, i64 1
  %218 = bitcast i64* %217 to i64*
  %219 = load i64, i64* %218, align 8
  %220 = icmp slt i64 0, %219
  br i1 %220, label %while_body_35, label %while_end_36
while_body_35:
  %221 = load i64**, i64*** %ptr_c
  %222 = bitcast i64** %221 to i64*
  %223 = getelementptr inbounds i64, i64* %222, i64 1
  %224 = bitcast i64* %223 to i8**
  %225 = load i8*, i8** %224, align 8
  %226 = call i64* @list_get_Spanned_Expression(i8* %225, i64 0)
  store i64* %226, i64** %ptr_arg
  %227 = call i8* @malloc(i64 16)
  %228 = bitcast i8* %227 to i64*
  store i64* %228, i64*** %ptr_arg_ptr
  %229 = load i64**, i64*** %ptr_arg_ptr
  %230 = load i64*, i64** %ptr_arg
  store i64* %230, i64** %229
  %231 = load i64**, i64*** %ptr_gen
  %232 = load i64**, i64*** %ptr_arg_ptr
  %233 = call i64** @ir_generate_expression(i64** %231, i64** %232)
  store i64** %233, i64*** %ptr_arg_op
  %234 = load i64**, i64*** %ptr_arg_op
  %235 = load i64*, i64** %234
  %236 = load i64**, i64*** %ptr_args_list
  call void @list_push_IROperand(i64** %236, i64* %235)
  %237 = add nsw i64 0, 1
  store i64 %237, i64 0
  br label %while_cond_34
while_end_36:
  %238 = load i64**, i64*** %ptr_gen
  %239 = call i64** @ir_new_temp(i64** %238)
  store i64** %239, i64** %113
  store i64** %113, i64*** %ptr_dest_opt
  %240 = call i8* @malloc(i64 32)
  %241 = bitcast i8* %240 to i64*
  %242 = getelementptr inbounds i64, i64* %241, i64 0
  store i64 3, i64* %242
  %243 = load i64**, i64*** %ptr_dest_opt
  %244 = getelementptr inbounds i64, i64* %241, i64 1
  %245 = bitcast i64* %244 to i64***
  store i64** %243, i64*** %245
  %246 = load i64**, i64*** %ptr_callee
  %247 = getelementptr inbounds i64, i64* %241, i64 2
  %248 = bitcast i64* %247 to i64***
  store i64** %246, i64*** %248
  %249 = load i64**, i64*** %ptr_args_list
  %250 = getelementptr inbounds i64, i64* %241, i64 3
  %251 = bitcast i64* %250 to i64***
  store i64** %249, i64*** %251
  %252 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %252, i64* %241)
  ret i64** %113
unreachable_37:
  br label %when_end_0
when_next_33:
  %253 = icmp eq i64 %14, 4
  br i1 %253, label %when_case_38, label %when_next_39
when_case_38:
  %254 = getelementptr inbounds i64, i8* %11, i64 1
  %255 = bitcast i64* %254 to i64***
  %256 = load i64**, i64*** %255, align 8
  store i64** %256, i64*** %ptr_when_expr
  %257 = load i64**, i64*** %ptr_when_expr
  %258 = bitcast i64** %257 to i64*
  %259 = getelementptr inbounds i64, i64* %258, i64 0
  %260 = bitcast i64* %259 to i8**
  %261 = load i8*, i8** %260, align 8
  %262 = load i64**, i64*** %ptr_gen
  %263 = call i64** @ir_generate_expression(i64** %262, i8* %261)
  store i64** %263, i64*** %ptr_target_op
  %264 = load i64**, i64*** %ptr_gen
  %265 = call i64** @ir_new_temp(i64** %264)
  store i64** %265, i64*** %ptr_dest_temp
  %266 = load i64**, i64*** %ptr_gen
  %267 = call i8* @ir_new_label(i64** %266, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.14, i64 0, i64 0))
  store i8* %267, i8** %ptr_end_label
  %268 = load i64**, i64*** %ptr_when_expr
  %269 = bitcast i64** %268 to i64*
  %270 = getelementptr inbounds i64, i64* %269, i64 2
  %271 = bitcast i64* %270 to i1*
  %272 = load i1, i1* %271, align 8
  br i1 %272, label %then_40, label %end_if_41
then_40:
  %273 = load i64**, i64*** %ptr_gen
  %274 = call i64** @ir_new_temp(i64** %273)
  store i64** %274, i64*** %ptr_cmp_res
  %275 = call i8* @malloc(i64 8)
  %276 = bitcast i8* %275 to i64*
  %277 = call i8* @malloc(i64 8)
  %278 = bitcast i8* %277 to i64*
  %279 = getelementptr inbounds i64, i64* %278, i64 0
  store i64 7, i64* %279
  store i64* %278, i64* %276
  %280 = call i8* @malloc(i64 8)
  %281 = bitcast i8* %280 to i64*
  %282 = getelementptr inbounds i64, i64* %281, i64 0
  store i64 8, i64* %282
  %283 = call i8* @malloc(i64 40)
  %284 = bitcast i8* %283 to i64*
  %285 = getelementptr inbounds i64, i64* %284, i64 0
  store i64 2, i64* %285
  %286 = load i64**, i64*** %ptr_cmp_res
  %287 = getelementptr inbounds i64, i64* %284, i64 1
  %288 = bitcast i64* %287 to i64***
  store i64** %286, i64*** %288
  %289 = getelementptr inbounds i64, i64* %284, i64 2
  %290 = bitcast i64* %289 to i64**
  store i64* %281, i64** %290
  %291 = load i64**, i64*** %ptr_target_op
  %292 = getelementptr inbounds i64, i64* %284, i64 3
  %293 = bitcast i64* %292 to i64***
  store i64** %291, i64*** %293
  %294 = getelementptr inbounds i64, i64* %284, i64 4
  %295 = bitcast i64* %294 to i64**
  store i64* %276, i64** %295
  %296 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %296, i64* %284)
  %297 = load i64**, i64*** %ptr_gen
  %298 = call i8* @ir_new_label(i64** %297, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.15, i64 0, i64 0))
  store i8* %298, i8** %ptr_none_label
  %299 = load i64**, i64*** %ptr_gen
  %300 = call i8* @ir_new_label(i64** %299, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.16, i64 0, i64 0))
  store i8* %300, i8** %ptr_val_label
  %301 = call i8* @malloc(i64 32)
  %302 = bitcast i8* %301 to i64*
  %303 = getelementptr inbounds i64, i64* %302, i64 0
  store i64 1, i64* %303
  %304 = load i64**, i64*** %ptr_cmp_res
  %305 = getelementptr inbounds i64, i64* %302, i64 1
  %306 = bitcast i64* %305 to i64***
  store i64** %304, i64*** %306
  %307 = load i8*, i8** %ptr_none_label
  %308 = getelementptr inbounds i64, i64* %302, i64 2
  %309 = bitcast i64* %308 to i8**
  store i8* %307, i8** %309
  %310 = load i8*, i8** %ptr_val_label
  %311 = getelementptr inbounds i64, i64* %302, i64 3
  %312 = bitcast i64* %311 to i8**
  store i8* %310, i8** %312
  %313 = load i64**, i64*** %ptr_gen
  call void @ir_finish_block(i64** %313, i64* %302)
  %314 = load i64**, i64*** %ptr_gen
  %315 = load i8*, i8** %ptr_none_label
  call void @ir_start_block(i64** %314, i8* %315)
  store i64 0, i64 0
  br label %while_cond_42
while_cond_42:
  %316 = load i64**, i64*** %ptr_when_expr
  %317 = bitcast i64** %316 to i64*
  %318 = getelementptr inbounds i64, i64* %317, i64 1
  %319 = bitcast i64* %318 to i8**
  %320 = load i8*, i8** %319, align 8
  %321 = bitcast i8* %320 to i64*
  %322 = getelementptr inbounds i64, i64* %321, i64 1
  %323 = bitcast i64* %322 to i64*
  %324 = load i64, i64* %323, align 8
  %325 = icmp slt i64 0, %324
  br i1 %325, label %while_body_43, label %while_end_44
while_body_43:
  %326 = load i64**, i64*** %ptr_when_expr
  %327 = bitcast i64** %326 to i64*
  %328 = getelementptr inbounds i64, i64* %327, i64 1
  %329 = bitcast i64* %328 to i8**
  %330 = load i8*, i8** %329, align 8
  %331 = call i64* @list_get_WhenCase(i8* %330, i64 0)
  store i64* %331, i64** %ptr_case_node
  %332 = load i64*, i64** %ptr_case_node
  %333 = bitcast i64* %332 to i64*
  %334 = getelementptr inbounds i64, i64* %333, i64 0
  %335 = bitcast i64* %334 to i8**
  %336 = load i8*, i8** %335, align 8
  %337 = call i1 @string_eq(i8* %336, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.17, i64 0, i64 0))
  br i1 %337, label %then_45, label %else_47
then_45:
  store i64 0, i64* %ptr_j
  br label %while_cond_48
while_cond_48:
  %338 = load i64*, i64** %ptr_case_node
  %339 = bitcast i64* %338 to i64*
  %340 = getelementptr inbounds i64, i64* %339, i64 2
  %341 = bitcast i64* %340 to i8**
  %342 = load i8*, i8** %341, align 8
  %343 = bitcast i8* %342 to i64*
  %344 = getelementptr inbounds i64, i64* %343, i64 0
  %345 = bitcast i64* %344 to i8**
  %346 = load i8*, i8** %345, align 8
  %347 = bitcast i8* %346 to i64*
  %348 = getelementptr inbounds i64, i64* %347, i64 0
  %349 = bitcast i64* %348 to i8**
  %350 = load i8*, i8** %349, align 8
  %351 = bitcast i8* %350 to i64*
  %352 = getelementptr inbounds i64, i64* %351, i64 1
  %353 = bitcast i64* %352 to i64*
  %354 = load i64, i64* %353, align 8
  %355 = load i64, i64* %ptr_j
  %356 = icmp slt i64 %355, %354
  br i1 %356, label %while_body_49, label %while_end_50
while_body_49:
  %357 = load i64*, i64** %ptr_case_node
  %358 = bitcast i64* %357 to i64*
  %359 = getelementptr inbounds i64, i64* %358, i64 2
  %360 = bitcast i64* %359 to i8**
  %361 = load i8*, i8** %360, align 8
  %362 = bitcast i8* %361 to i64*
  %363 = getelementptr inbounds i64, i64* %362, i64 0
  %364 = bitcast i64* %363 to i8**
  %365 = load i8*, i8** %364, align 8
  %366 = bitcast i8* %365 to i64*
  %367 = getelementptr inbounds i64, i64* %366, i64 0
  %368 = bitcast i64* %367 to i8**
  %369 = load i8*, i8** %368, align 8
  %370 = load i64, i64* %ptr_j
  %371 = call i64* @list_get_Spanned_Statement(i8* %369, i64 %370)
  store i64* %371, i64** %ptr_stmt
  %372 = call i8* @malloc(i64 16)
  %373 = bitcast i8* %372 to i64*
  store i64* %373, i64*** %ptr_stmt_ptr
  %374 = load i64**, i64*** %ptr_stmt_ptr
  %375 = load i64*, i64** %ptr_stmt
  store i64* %375, i64** %374
  %376 = load i64*, i64** %ptr_case_node
  %377 = bitcast i64* %376 to i64*
  %378 = getelementptr inbounds i64, i64* %377, i64 2
  %379 = bitcast i64* %378 to i8**
  %380 = load i8*, i8** %379, align 8
  %381 = bitcast i8* %380 to i64*
  %382 = getelementptr inbounds i64, i64* %381, i64 0
  %383 = bitcast i64* %382 to i8**
  %384 = load i8*, i8** %383, align 8
  %385 = bitcast i8* %384 to i64*
  %386 = getelementptr inbounds i64, i64* %385, i64 0
  %387 = bitcast i64* %386 to i8**
  %388 = load i8*, i8** %387, align 8
  %389 = bitcast i8* %388 to i64*
  %390 = getelementptr inbounds i64, i64* %389, i64 1
  %391 = bitcast i64* %390 to i64*
  %392 = load i64, i64* %391, align 8
  %393 = sub nsw i64 %392, 1
  %394 = load i64, i64* %ptr_j
  %395 = icmp eq i64 %394, %393
  br i1 %395, label %then_51, label %else_53
then_51:
  %396 = load i64**, i64*** %ptr_stmt_ptr
  %397 = bitcast i64** %396 to i64*
  %398 = getelementptr inbounds i64, i64* %397, i64 0
  %399 = bitcast i64* %398 to i8**
  %400 = load i8*, i8** %399, align 8
  %401 = getelementptr inbounds i64, i8* %400, i64 0
  %402 = bitcast i64* %401 to i64*
  %403 = load i64, i64* %402, align 8
  %404 = icmp eq i64 %403, 5
  br i1 %404, label %when_case_55, label %when_next_56
when_case_55:
  %405 = getelementptr inbounds i64, i8* %400, i64 1
  %406 = bitcast i64* %405 to i64***
  %407 = load i64**, i64*** %406, align 8
  store i64** %407, i64*** %ptr_e
  %408 = load i64**, i64*** %ptr_gen
  %409 = load i64**, i64*** %ptr_e
  %410 = call i64** @ir_generate_expression(i64** %408, i64** %409)
  store i64** %410, i64*** %ptr_val
  %411 = call i8* @malloc(i64 24)
  %412 = bitcast i8* %411 to i64*
  %413 = getelementptr inbounds i64, i64* %412, i64 0
  store i64 0, i64* %413
  %414 = load i64**, i64*** %ptr_dest_temp
  %415 = getelementptr inbounds i64, i64* %412, i64 1
  %416 = bitcast i64* %415 to i64***
  store i64** %414, i64*** %416
  %417 = load i64**, i64*** %ptr_val
  %418 = getelementptr inbounds i64, i64* %412, i64 2
  %419 = bitcast i64* %418 to i64***
  store i64** %417, i64*** %419
  %420 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %420, i64* %412)
  br label %when_end_54
when_next_56:
  %421 = icmp eq i64 %403, 4
  br i1 %421, label %when_case_57, label %when_next_58
when_case_57:
  %422 = load i64**, i64*** %ptr_gen
  %423 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %422, i64** %423)
  br label %when_end_54
when_next_58:
  %424 = icmp eq i64 %403, 1
  br i1 %424, label %when_case_59, label %when_next_60
when_case_59:
  %425 = load i64**, i64*** %ptr_gen
  %426 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %425, i64** %426)
  br label %when_end_54
when_next_60:
  %427 = icmp eq i64 %403, 2
  br i1 %427, label %when_case_61, label %when_next_62
when_case_61:
  %428 = load i64**, i64*** %ptr_gen
  %429 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %428, i64** %429)
  br label %when_end_54
when_next_62:
  %430 = icmp eq i64 %403, 3
  br i1 %430, label %when_case_63, label %when_next_64
when_case_63:
  %431 = load i64**, i64*** %ptr_gen
  %432 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %431, i64** %432)
  br label %when_end_54
when_next_64:
  %433 = icmp eq i64 %403, 2
  br i1 %433, label %when_case_65, label %when_next_66
when_case_65:
  %434 = load i64**, i64*** %ptr_gen
  %435 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %434, i64** %435)
  br label %when_end_54
when_next_66:
  %436 = icmp eq i64 %403, 11
  br i1 %436, label %when_case_67, label %when_next_68
when_case_67:
  %437 = load i64**, i64*** %ptr_gen
  %438 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %437, i64** %438)
  br label %when_end_54
when_next_68:
  %439 = icmp eq i64 %403, 7
  br i1 %439, label %when_case_69, label %when_next_70
when_case_69:
  %440 = load i64**, i64*** %ptr_gen
  %441 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %440, i64** %441)
  br label %when_end_54
when_next_70:
  %442 = icmp eq i64 %403, 8
  br i1 %442, label %when_case_71, label %when_next_72
when_case_71:
  %443 = load i64**, i64*** %ptr_gen
  %444 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %443, i64** %444)
  br label %when_end_54
when_next_72:
  br label %when_end_54
when_end_54:
  br label %end_if_52
else_53:
  %445 = load i64**, i64*** %ptr_gen
  %446 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %445, i64** %446)
  br label %end_if_52
end_if_52:
  %447 = load i64, i64* %ptr_j
  %448 = add nsw i64 %447, 1
  store i64 %448, i64* %ptr_j
  br label %while_cond_48
while_end_50:
  %449 = load i64**, i64*** %ptr_when_expr
  %450 = bitcast i64** %449 to i64*
  %451 = getelementptr inbounds i64, i64* %450, i64 1
  %452 = bitcast i64* %451 to i8**
  %453 = load i8*, i8** %452, align 8
  %454 = bitcast i8* %453 to i64*
  %455 = getelementptr inbounds i64, i64* %454, i64 1
  %456 = bitcast i64* %455 to i64*
  %457 = load i64, i64* %456, align 8
  store i64 %457, i64 0
  br label %end_if_46
else_47:
  %458 = add nsw i64 0, 1
  store i64 %458, i64 0
  br label %end_if_46
end_if_46:
  br label %while_cond_42
while_end_44:
  %459 = call i8* @malloc(i64 16)
  %460 = bitcast i8* %459 to i64*
  %461 = getelementptr inbounds i64, i64* %460, i64 0
  store i64 0, i64* %461
  %462 = load i8*, i8** %ptr_end_label
  %463 = getelementptr inbounds i64, i64* %460, i64 1
  %464 = bitcast i64* %463 to i8**
  store i8* %462, i8** %464
  %465 = load i64**, i64*** %ptr_gen
  call void @ir_finish_block(i64** %465, i64* %460)
  %466 = load i64**, i64*** %ptr_gen
  %467 = load i8*, i8** %ptr_val_label
  call void @ir_start_block(i64** %466, i8* %467)
  store i64 0, i64 0
  br label %while_cond_73
while_cond_73:
  %468 = load i64**, i64*** %ptr_when_expr
  %469 = bitcast i64** %468 to i64*
  %470 = getelementptr inbounds i64, i64* %469, i64 1
  %471 = bitcast i64* %470 to i8**
  %472 = load i8*, i8** %471, align 8
  %473 = bitcast i8* %472 to i64*
  %474 = getelementptr inbounds i64, i64* %473, i64 1
  %475 = bitcast i64* %474 to i64*
  %476 = load i64, i64* %475, align 8
  %477 = icmp slt i64 0, %476
  br i1 %477, label %while_body_74, label %while_end_75
while_body_74:
  %478 = load i64**, i64*** %ptr_when_expr
  %479 = bitcast i64** %478 to i64*
  %480 = getelementptr inbounds i64, i64* %479, i64 1
  %481 = bitcast i64* %480 to i8**
  %482 = load i8*, i8** %481, align 8
  %483 = call i64* @list_get_WhenCase(i8* %482, i64 0)
  store i64* %483, i64** %ptr_case_node
  %484 = load i64*, i64** %ptr_case_node
  %485 = bitcast i64* %484 to i64*
  %486 = getelementptr inbounds i64, i64* %485, i64 0
  %487 = bitcast i64* %486 to i8**
  %488 = load i8*, i8** %487, align 8
  %489 = call i1 @string_eq(i8* %488, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.18, i64 0, i64 0))
  %490 = xor i1 %489, 1
  br i1 %490, label %then_76, label %else_78
then_76:
  %491 = call i8* @malloc(i64 8)
  %492 = bitcast i8* %491 to i64*
  store i64* %492, i64*** %ptr_bind_op
  %493 = load i64*, i64** %ptr_case_node
  %494 = bitcast i64* %493 to i64*
  %495 = getelementptr inbounds i64, i64* %494, i64 0
  %496 = bitcast i64* %495 to i8**
  %497 = load i8*, i8** %496, align 8
  %498 = call i8* @malloc(i64 16)
  %499 = bitcast i8* %498 to i64*
  %500 = getelementptr inbounds i64, i64* %499, i64 0
  store i64 5, i64* %500
  %501 = getelementptr inbounds i64, i64* %499, i64 1
  %502 = bitcast i64* %501 to i8**
  store i8* %497, i8** %502
  %503 = load i64**, i64*** %ptr_bind_op
  store i64* %499, i64** %503
  %504 = call i8* @malloc(i64 24)
  %505 = bitcast i8* %504 to i64*
  %506 = getelementptr inbounds i64, i64* %505, i64 0
  store i64 0, i64* %506
  %507 = load i64**, i64*** %ptr_bind_op
  %508 = getelementptr inbounds i64, i64* %505, i64 1
  %509 = bitcast i64* %508 to i64***
  store i64** %507, i64*** %509
  %510 = load i64**, i64*** %ptr_target_op
  %511 = getelementptr inbounds i64, i64* %505, i64 2
  %512 = bitcast i64* %511 to i64***
  store i64** %510, i64*** %512
  %513 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %513, i64* %505)
  store i64 0, i64* %ptr_j
  br label %while_cond_79
while_cond_79:
  %514 = load i64*, i64** %ptr_case_node
  %515 = bitcast i64* %514 to i64*
  %516 = getelementptr inbounds i64, i64* %515, i64 2
  %517 = bitcast i64* %516 to i8**
  %518 = load i8*, i8** %517, align 8
  %519 = bitcast i8* %518 to i64*
  %520 = getelementptr inbounds i64, i64* %519, i64 0
  %521 = bitcast i64* %520 to i8**
  %522 = load i8*, i8** %521, align 8
  %523 = bitcast i8* %522 to i64*
  %524 = getelementptr inbounds i64, i64* %523, i64 0
  %525 = bitcast i64* %524 to i8**
  %526 = load i8*, i8** %525, align 8
  %527 = bitcast i8* %526 to i64*
  %528 = getelementptr inbounds i64, i64* %527, i64 1
  %529 = bitcast i64* %528 to i64*
  %530 = load i64, i64* %529, align 8
  %531 = load i64, i64* %ptr_j
  %532 = icmp slt i64 %531, %530
  br i1 %532, label %while_body_80, label %while_end_81
while_body_80:
  %533 = load i64*, i64** %ptr_case_node
  %534 = bitcast i64* %533 to i64*
  %535 = getelementptr inbounds i64, i64* %534, i64 2
  %536 = bitcast i64* %535 to i8**
  %537 = load i8*, i8** %536, align 8
  %538 = bitcast i8* %537 to i64*
  %539 = getelementptr inbounds i64, i64* %538, i64 0
  %540 = bitcast i64* %539 to i8**
  %541 = load i8*, i8** %540, align 8
  %542 = bitcast i8* %541 to i64*
  %543 = getelementptr inbounds i64, i64* %542, i64 0
  %544 = bitcast i64* %543 to i8**
  %545 = load i8*, i8** %544, align 8
  %546 = load i64, i64* %ptr_j
  %547 = call i64* @list_get_Spanned_Statement(i8* %545, i64 %546)
  store i64* %547, i64** %ptr_stmt
  %548 = call i8* @malloc(i64 16)
  %549 = bitcast i8* %548 to i64*
  store i64* %549, i64*** %ptr_stmt_ptr
  %550 = load i64**, i64*** %ptr_stmt_ptr
  %551 = load i64*, i64** %ptr_stmt
  store i64* %551, i64** %550
  %552 = load i64*, i64** %ptr_case_node
  %553 = bitcast i64* %552 to i64*
  %554 = getelementptr inbounds i64, i64* %553, i64 2
  %555 = bitcast i64* %554 to i8**
  %556 = load i8*, i8** %555, align 8
  %557 = bitcast i8* %556 to i64*
  %558 = getelementptr inbounds i64, i64* %557, i64 0
  %559 = bitcast i64* %558 to i8**
  %560 = load i8*, i8** %559, align 8
  %561 = bitcast i8* %560 to i64*
  %562 = getelementptr inbounds i64, i64* %561, i64 0
  %563 = bitcast i64* %562 to i8**
  %564 = load i8*, i8** %563, align 8
  %565 = bitcast i8* %564 to i64*
  %566 = getelementptr inbounds i64, i64* %565, i64 1
  %567 = bitcast i64* %566 to i64*
  %568 = load i64, i64* %567, align 8
  %569 = sub nsw i64 %568, 1
  %570 = load i64, i64* %ptr_j
  %571 = icmp eq i64 %570, %569
  br i1 %571, label %then_82, label %else_84
then_82:
  %572 = load i64**, i64*** %ptr_stmt_ptr
  %573 = bitcast i64** %572 to i64*
  %574 = getelementptr inbounds i64, i64* %573, i64 0
  %575 = bitcast i64* %574 to i8**
  %576 = load i8*, i8** %575, align 8
  %577 = getelementptr inbounds i64, i8* %576, i64 0
  %578 = bitcast i64* %577 to i64*
  %579 = load i64, i64* %578, align 8
  %580 = icmp eq i64 %579, 5
  br i1 %580, label %when_case_86, label %when_next_87
when_case_86:
  %581 = getelementptr inbounds i64, i8* %576, i64 1
  %582 = bitcast i64* %581 to i64***
  %583 = load i64**, i64*** %582, align 8
  store i64** %583, i64*** %ptr_e
  %584 = load i64**, i64*** %ptr_gen
  %585 = load i64**, i64*** %ptr_e
  %586 = call i64** @ir_generate_expression(i64** %584, i64** %585)
  store i64** %586, i64*** %ptr_val
  %587 = call i8* @malloc(i64 24)
  %588 = bitcast i8* %587 to i64*
  %589 = getelementptr inbounds i64, i64* %588, i64 0
  store i64 0, i64* %589
  %590 = load i64**, i64*** %ptr_dest_temp
  %591 = getelementptr inbounds i64, i64* %588, i64 1
  %592 = bitcast i64* %591 to i64***
  store i64** %590, i64*** %592
  %593 = load i64**, i64*** %ptr_val
  %594 = getelementptr inbounds i64, i64* %588, i64 2
  %595 = bitcast i64* %594 to i64***
  store i64** %593, i64*** %595
  %596 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %596, i64* %588)
  br label %when_end_85
when_next_87:
  %597 = icmp eq i64 %579, 4
  br i1 %597, label %when_case_88, label %when_next_89
when_case_88:
  %598 = load i64**, i64*** %ptr_gen
  %599 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %598, i64** %599)
  br label %when_end_85
when_next_89:
  %600 = icmp eq i64 %579, 1
  br i1 %600, label %when_case_90, label %when_next_91
when_case_90:
  %601 = load i64**, i64*** %ptr_gen
  %602 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %601, i64** %602)
  br label %when_end_85
when_next_91:
  %603 = icmp eq i64 %579, 2
  br i1 %603, label %when_case_92, label %when_next_93
when_case_92:
  %604 = load i64**, i64*** %ptr_gen
  %605 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %604, i64** %605)
  br label %when_end_85
when_next_93:
  %606 = icmp eq i64 %579, 3
  br i1 %606, label %when_case_94, label %when_next_95
when_case_94:
  %607 = load i64**, i64*** %ptr_gen
  %608 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %607, i64** %608)
  br label %when_end_85
when_next_95:
  %609 = icmp eq i64 %579, 2
  br i1 %609, label %when_case_96, label %when_next_97
when_case_96:
  %610 = load i64**, i64*** %ptr_gen
  %611 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %610, i64** %611)
  br label %when_end_85
when_next_97:
  %612 = icmp eq i64 %579, 11
  br i1 %612, label %when_case_98, label %when_next_99
when_case_98:
  %613 = load i64**, i64*** %ptr_gen
  %614 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %613, i64** %614)
  br label %when_end_85
when_next_99:
  %615 = icmp eq i64 %579, 7
  br i1 %615, label %when_case_100, label %when_next_101
when_case_100:
  %616 = load i64**, i64*** %ptr_gen
  %617 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %616, i64** %617)
  br label %when_end_85
when_next_101:
  %618 = icmp eq i64 %579, 8
  br i1 %618, label %when_case_102, label %when_next_103
when_case_102:
  %619 = load i64**, i64*** %ptr_gen
  %620 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %619, i64** %620)
  br label %when_end_85
when_next_103:
  br label %when_end_85
when_end_85:
  br label %end_if_83
else_84:
  %621 = load i64**, i64*** %ptr_gen
  %622 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %621, i64** %622)
  br label %end_if_83
end_if_83:
  %623 = load i64, i64* %ptr_j
  %624 = add nsw i64 %623, 1
  store i64 %624, i64* %ptr_j
  br label %while_cond_79
while_end_81:
  %625 = load i64**, i64*** %ptr_when_expr
  %626 = bitcast i64** %625 to i64*
  %627 = getelementptr inbounds i64, i64* %626, i64 1
  %628 = bitcast i64* %627 to i8**
  %629 = load i8*, i8** %628, align 8
  %630 = bitcast i8* %629 to i64*
  %631 = getelementptr inbounds i64, i64* %630, i64 1
  %632 = bitcast i64* %631 to i64*
  %633 = load i64, i64* %632, align 8
  store i64 %633, i64 0
  br label %end_if_77
else_78:
  %634 = add nsw i64 0, 1
  store i64 %634, i64 0
  br label %end_if_77
end_if_77:
  br label %while_cond_73
while_end_75:
  %635 = call i8* @malloc(i64 16)
  %636 = bitcast i8* %635 to i64*
  %637 = getelementptr inbounds i64, i64* %636, i64 0
  store i64 0, i64* %637
  %638 = load i8*, i8** %ptr_end_label
  %639 = getelementptr inbounds i64, i64* %636, i64 1
  %640 = bitcast i64* %639 to i8**
  store i8* %638, i8** %640
  %641 = load i64**, i64*** %ptr_gen
  call void @ir_finish_block(i64** %641, i64* %636)
  %642 = load i64**, i64*** %ptr_gen
  %643 = load i8*, i8** %ptr_end_label
  call void @ir_start_block(i64** %642, i8* %643)
  %644 = load i64**, i64*** %ptr_dest_temp
  ret i64** %644
unreachable_104:
  br label %end_if_41
end_if_41:
  %645 = load i64**, i64*** %ptr_gen
  %646 = call i64** @ir_new_temp(i64** %645)
  store i64** %646, i64*** %ptr_tag_temp
  %647 = call i8* @malloc(i64 24)
  %648 = bitcast i8* %647 to i64*
  %649 = getelementptr inbounds i64, i64* %648, i64 0
  store i64 7, i64* %649
  %650 = load i64**, i64*** %ptr_tag_temp
  %651 = getelementptr inbounds i64, i64* %648, i64 1
  %652 = bitcast i64* %651 to i64***
  store i64** %650, i64*** %652
  %653 = load i64**, i64*** %ptr_target_op
  %654 = getelementptr inbounds i64, i64* %648, i64 2
  %655 = bitcast i64* %654 to i64***
  store i64** %653, i64*** %655
  %656 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %656, i64* %648)
  store i64 0, i64 0
  br label %while_cond_105
while_cond_105:
  %657 = load i64**, i64*** %ptr_when_expr
  %658 = bitcast i64** %657 to i64*
  %659 = getelementptr inbounds i64, i64* %658, i64 1
  %660 = bitcast i64* %659 to i8**
  %661 = load i8*, i8** %660, align 8
  %662 = bitcast i8* %661 to i64*
  %663 = getelementptr inbounds i64, i64* %662, i64 1
  %664 = bitcast i64* %663 to i64*
  %665 = load i64, i64* %664, align 8
  %666 = icmp slt i64 0, %665
  br i1 %666, label %while_body_106, label %while_end_107
while_body_106:
  %667 = load i64**, i64*** %ptr_when_expr
  %668 = bitcast i64** %667 to i64*
  %669 = getelementptr inbounds i64, i64* %668, i64 1
  %670 = bitcast i64* %669 to i8**
  %671 = load i8*, i8** %670, align 8
  %672 = call i64* @list_get_WhenCase(i8* %671, i64 0)
  store i64* %672, i64** %ptr_case_node
  %673 = load i64**, i64*** %ptr_gen
  %674 = call i8* @ir_new_label(i64** %673, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.19, i64 0, i64 0))
  store i8* %674, i8** %ptr_case_label
  %675 = load i64**, i64*** %ptr_gen
  %676 = call i8* @ir_new_label(i64** %675, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.20, i64 0, i64 0))
  store i8* %676, i8** %ptr_next_label
  store i64 0, i64* %ptr_expected_tag
  store i64 0, i64* %ptr_map_i
  br label %while_cond_108
while_cond_108:
  %677 = load i64**, i64*** %ptr_gen
  %678 = bitcast i64** %677 to i64*
  %679 = getelementptr inbounds i64, i64* %678, i64 7
  %680 = bitcast i64* %679 to i8**
  %681 = load i8*, i8** %680, align 8
  %682 = bitcast i8* %681 to i64*
  %683 = getelementptr inbounds i64, i64* %682, i64 0
  %684 = bitcast i64* %683 to i8**
  %685 = load i8*, i8** %684, align 8
  %686 = bitcast i8* %685 to i64*
  %687 = getelementptr inbounds i64, i64* %686, i64 1
  %688 = bitcast i64* %687 to i64*
  %689 = load i64, i64* %688, align 8
  %690 = load i64, i64* %ptr_map_i
  %691 = icmp slt i64 %690, %689
  br i1 %691, label %while_body_109, label %while_end_110
while_body_109:
  %692 = load i64**, i64*** %ptr_gen
  %693 = bitcast i64** %692 to i64*
  %694 = getelementptr inbounds i64, i64* %693, i64 7
  %695 = bitcast i64* %694 to i8**
  %696 = load i8*, i8** %695, align 8
  %697 = bitcast i8* %696 to i64*
  %698 = getelementptr inbounds i64, i64* %697, i64 0
  %699 = bitcast i64* %698 to i8**
  %700 = load i8*, i8** %699, align 8
  %701 = load i64, i64* %ptr_map_i
  %702 = call i64* @list_get_StringInnerMapEntry(i8* %700, i64 %701)
  store i64* %702, i64** %ptr_entry
  %703 = load i64*, i64** %ptr_entry
  %704 = bitcast i64* %703 to i64*
  %705 = getelementptr inbounds i64, i64* %704, i64 1
  %706 = bitcast i64* %705 to i8**
  %707 = load i8*, i8** %706, align 8
  store i8* %707, i64*** %ptr_inner_map
  %708 = load i64*, i64** %ptr_case_node
  %709 = bitcast i64* %708 to i64*
  %710 = getelementptr inbounds i64, i64* %709, i64 0
  %711 = bitcast i64* %710 to i8**
  %712 = load i8*, i8** %711, align 8
  %713 = load i64**, i64*** %ptr_inner_map
  %714 = call i64 @string_int_map_get(i64** %713, i8* %712)
  store i64 %714, i64*** %ptr_inner_opt
  %715 = load i64**, i64*** %ptr_inner_opt
  %716 = icmp ne i64** %715, null
  br i1 %716, label %then_111, label %else_113
then_111:
  %717 = load i64**, i64*** %ptr_inner_opt
  store i64** %717, i64* %ptr_tag_val
  %718 = load i64, i64* %ptr_tag_val
  store i64 %718, i64* %ptr_expected_tag
  %719 = load i64**, i64*** %ptr_gen
  %720 = bitcast i64** %719 to i64*
  %721 = getelementptr inbounds i64, i64* %720, i64 7
  %722 = bitcast i64* %721 to i8**
  %723 = load i8*, i8** %722, align 8
  %724 = bitcast i8* %723 to i64*
  %725 = getelementptr inbounds i64, i64* %724, i64 0
  %726 = bitcast i64* %725 to i8**
  %727 = load i8*, i8** %726, align 8
  %728 = bitcast i8* %727 to i64*
  %729 = getelementptr inbounds i64, i64* %728, i64 1
  %730 = bitcast i64* %729 to i64*
  %731 = load i64, i64* %730, align 8
  store i64 %731, i64* %ptr_map_i
  br label %end_if_112
else_113:
  %732 = load i64, i64* %ptr_map_i
  %733 = add nsw i64 %732, 1
  store i64 %733, i64* %ptr_map_i
  br label %end_if_112
end_if_112:
  br label %while_cond_108
while_end_110:
  %734 = load i64**, i64*** %ptr_gen
  %735 = call i64** @ir_new_temp(i64** %734)
  store i64** %735, i64*** %ptr_cmp_res
  %736 = call i8* @malloc(i64 8)
  %737 = bitcast i8* %736 to i64*
  store i64* %737, i64*** %ptr_lit_op
  %738 = call i8* @malloc(i64 16)
  %739 = bitcast i8* %738 to i64*
  %740 = getelementptr inbounds i64, i64* %739, i64 0
  store i64 0, i64* %740
  %741 = load i64, i64* %ptr_expected_tag
  %742 = getelementptr inbounds i64, i64* %739, i64 1
  %743 = bitcast i64* %742 to i64*
  store i64 %741, i64* %743
  %744 = load i64**, i64*** %ptr_lit_op
  store i64* %739, i64** %744
  %745 = call i8* @malloc(i64 8)
  %746 = bitcast i8* %745 to i64*
  %747 = getelementptr inbounds i64, i64* %746, i64 0
  store i64 8, i64* %747
  %748 = call i8* @malloc(i64 40)
  %749 = bitcast i8* %748 to i64*
  %750 = getelementptr inbounds i64, i64* %749, i64 0
  store i64 2, i64* %750
  %751 = load i64**, i64*** %ptr_cmp_res
  %752 = getelementptr inbounds i64, i64* %749, i64 1
  %753 = bitcast i64* %752 to i64***
  store i64** %751, i64*** %753
  %754 = getelementptr inbounds i64, i64* %749, i64 2
  %755 = bitcast i64* %754 to i64**
  store i64* %746, i64** %755
  %756 = load i64**, i64*** %ptr_tag_temp
  %757 = getelementptr inbounds i64, i64* %749, i64 3
  %758 = bitcast i64* %757 to i64***
  store i64** %756, i64*** %758
  %759 = load i64**, i64*** %ptr_lit_op
  %760 = getelementptr inbounds i64, i64* %749, i64 4
  %761 = bitcast i64* %760 to i64***
  store i64** %759, i64*** %761
  %762 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %762, i64* %749)
  %763 = call i8* @malloc(i64 32)
  %764 = bitcast i8* %763 to i64*
  %765 = getelementptr inbounds i64, i64* %764, i64 0
  store i64 1, i64* %765
  %766 = load i64**, i64*** %ptr_cmp_res
  %767 = getelementptr inbounds i64, i64* %764, i64 1
  %768 = bitcast i64* %767 to i64***
  store i64** %766, i64*** %768
  %769 = load i8*, i8** %ptr_case_label
  %770 = getelementptr inbounds i64, i64* %764, i64 2
  %771 = bitcast i64* %770 to i8**
  store i8* %769, i8** %771
  %772 = load i8*, i8** %ptr_next_label
  %773 = getelementptr inbounds i64, i64* %764, i64 3
  %774 = bitcast i64* %773 to i8**
  store i8* %772, i8** %774
  %775 = load i64**, i64*** %ptr_gen
  call void @ir_finish_block(i64** %775, i64* %764)
  %776 = load i64**, i64*** %ptr_gen
  %777 = load i8*, i8** %ptr_case_label
  call void @ir_start_block(i64** %776, i8* %777)
  store i64 0, i64* %ptr_b_idx
  br label %while_cond_114
while_cond_114:
  %778 = load i64*, i64** %ptr_case_node
  %779 = bitcast i64* %778 to i64*
  %780 = getelementptr inbounds i64, i64* %779, i64 1
  %781 = bitcast i64* %780 to i8**
  %782 = load i8*, i8** %781, align 8
  %783 = bitcast i8* %782 to i64*
  %784 = getelementptr inbounds i64, i64* %783, i64 1
  %785 = bitcast i64* %784 to i64*
  %786 = load i64, i64* %785, align 8
  %787 = load i64, i64* %ptr_b_idx
  %788 = icmp slt i64 %787, %786
  br i1 %788, label %while_body_115, label %while_end_116
while_body_115:
  %789 = load i64*, i64** %ptr_case_node
  %790 = bitcast i64* %789 to i64*
  %791 = getelementptr inbounds i64, i64* %790, i64 1
  %792 = bitcast i64* %791 to i8**
  %793 = load i8*, i8** %792, align 8
  %794 = load i64, i64* %ptr_b_idx
  %795 = call i8* @list_get_String(i8* %793, i64 %794)
  store i8* %795, i8** %ptr_b_name
  %796 = call i8* @malloc(i64 8)
  %797 = bitcast i8* %796 to i64*
  store i64* %797, i64*** %ptr_b_op
  %798 = call i8* @malloc(i64 16)
  %799 = bitcast i8* %798 to i64*
  %800 = getelementptr inbounds i64, i64* %799, i64 0
  store i64 5, i64* %800
  %801 = load i8*, i8** %ptr_b_name
  %802 = getelementptr inbounds i64, i64* %799, i64 1
  %803 = bitcast i64* %802 to i8**
  store i8* %801, i8** %803
  %804 = load i64**, i64*** %ptr_b_op
  store i64* %799, i64** %804
  %805 = call i8* @malloc(i64 32)
  %806 = bitcast i8* %805 to i64*
  %807 = getelementptr inbounds i64, i64* %806, i64 0
  store i64 8, i64* %807
  %808 = load i64**, i64*** %ptr_b_op
  %809 = getelementptr inbounds i64, i64* %806, i64 1
  %810 = bitcast i64* %809 to i64***
  store i64** %808, i64*** %810
  %811 = load i64**, i64*** %ptr_target_op
  %812 = getelementptr inbounds i64, i64* %806, i64 2
  %813 = bitcast i64* %812 to i64***
  store i64** %811, i64*** %813
  %814 = load i64, i64* %ptr_b_idx
  %815 = getelementptr inbounds i64, i64* %806, i64 3
  %816 = bitcast i64* %815 to i64*
  store i64 %814, i64* %816
  %817 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %817, i64* %806)
  %818 = load i64, i64* %ptr_b_idx
  %819 = add nsw i64 %818, 1
  store i64 %819, i64* %ptr_b_idx
  br label %while_cond_114
while_end_116:
  store i64 0, i64* %ptr_j
  br label %while_cond_117
while_cond_117:
  %820 = load i64*, i64** %ptr_case_node
  %821 = bitcast i64* %820 to i64*
  %822 = getelementptr inbounds i64, i64* %821, i64 2
  %823 = bitcast i64* %822 to i8**
  %824 = load i8*, i8** %823, align 8
  %825 = bitcast i8* %824 to i64*
  %826 = getelementptr inbounds i64, i64* %825, i64 0
  %827 = bitcast i64* %826 to i8**
  %828 = load i8*, i8** %827, align 8
  %829 = bitcast i8* %828 to i64*
  %830 = getelementptr inbounds i64, i64* %829, i64 0
  %831 = bitcast i64* %830 to i8**
  %832 = load i8*, i8** %831, align 8
  %833 = bitcast i8* %832 to i64*
  %834 = getelementptr inbounds i64, i64* %833, i64 1
  %835 = bitcast i64* %834 to i64*
  %836 = load i64, i64* %835, align 8
  %837 = load i64, i64* %ptr_j
  %838 = icmp slt i64 %837, %836
  br i1 %838, label %while_body_118, label %while_end_119
while_body_118:
  %839 = load i64*, i64** %ptr_case_node
  %840 = bitcast i64* %839 to i64*
  %841 = getelementptr inbounds i64, i64* %840, i64 2
  %842 = bitcast i64* %841 to i8**
  %843 = load i8*, i8** %842, align 8
  %844 = bitcast i8* %843 to i64*
  %845 = getelementptr inbounds i64, i64* %844, i64 0
  %846 = bitcast i64* %845 to i8**
  %847 = load i8*, i8** %846, align 8
  %848 = bitcast i8* %847 to i64*
  %849 = getelementptr inbounds i64, i64* %848, i64 0
  %850 = bitcast i64* %849 to i8**
  %851 = load i8*, i8** %850, align 8
  %852 = load i64, i64* %ptr_j
  %853 = call i64* @list_get_Spanned_Statement(i8* %851, i64 %852)
  store i64* %853, i64** %ptr_stmt
  %854 = call i8* @malloc(i64 16)
  %855 = bitcast i8* %854 to i64*
  store i64* %855, i64*** %ptr_stmt_ptr
  %856 = load i64**, i64*** %ptr_stmt_ptr
  %857 = load i64*, i64** %ptr_stmt
  store i64* %857, i64** %856
  %858 = load i64*, i64** %ptr_case_node
  %859 = bitcast i64* %858 to i64*
  %860 = getelementptr inbounds i64, i64* %859, i64 2
  %861 = bitcast i64* %860 to i8**
  %862 = load i8*, i8** %861, align 8
  %863 = bitcast i8* %862 to i64*
  %864 = getelementptr inbounds i64, i64* %863, i64 0
  %865 = bitcast i64* %864 to i8**
  %866 = load i8*, i8** %865, align 8
  %867 = bitcast i8* %866 to i64*
  %868 = getelementptr inbounds i64, i64* %867, i64 0
  %869 = bitcast i64* %868 to i8**
  %870 = load i8*, i8** %869, align 8
  %871 = bitcast i8* %870 to i64*
  %872 = getelementptr inbounds i64, i64* %871, i64 1
  %873 = bitcast i64* %872 to i64*
  %874 = load i64, i64* %873, align 8
  %875 = sub nsw i64 %874, 1
  %876 = load i64, i64* %ptr_j
  %877 = icmp eq i64 %876, %875
  br i1 %877, label %then_120, label %else_122
then_120:
  %878 = load i64**, i64*** %ptr_stmt_ptr
  %879 = bitcast i64** %878 to i64*
  %880 = getelementptr inbounds i64, i64* %879, i64 0
  %881 = bitcast i64* %880 to i8**
  %882 = load i8*, i8** %881, align 8
  %883 = getelementptr inbounds i64, i8* %882, i64 0
  %884 = bitcast i64* %883 to i64*
  %885 = load i64, i64* %884, align 8
  %886 = icmp eq i64 %885, 5
  br i1 %886, label %when_case_124, label %when_next_125
when_case_124:
  %887 = getelementptr inbounds i64, i8* %882, i64 1
  %888 = bitcast i64* %887 to i64***
  %889 = load i64**, i64*** %888, align 8
  store i64** %889, i64*** %ptr_e
  %890 = load i64**, i64*** %ptr_gen
  %891 = load i64**, i64*** %ptr_e
  %892 = call i64** @ir_generate_expression(i64** %890, i64** %891)
  store i64** %892, i64*** %ptr_val
  %893 = call i8* @malloc(i64 24)
  %894 = bitcast i8* %893 to i64*
  %895 = getelementptr inbounds i64, i64* %894, i64 0
  store i64 0, i64* %895
  %896 = load i64**, i64*** %ptr_dest_temp
  %897 = getelementptr inbounds i64, i64* %894, i64 1
  %898 = bitcast i64* %897 to i64***
  store i64** %896, i64*** %898
  %899 = load i64**, i64*** %ptr_val
  %900 = getelementptr inbounds i64, i64* %894, i64 2
  %901 = bitcast i64* %900 to i64***
  store i64** %899, i64*** %901
  %902 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %902, i64* %894)
  br label %when_end_123
when_next_125:
  %903 = icmp eq i64 %885, 4
  br i1 %903, label %when_case_126, label %when_next_127
when_case_126:
  %904 = load i64**, i64*** %ptr_gen
  %905 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %904, i64** %905)
  br label %when_end_123
when_next_127:
  %906 = icmp eq i64 %885, 1
  br i1 %906, label %when_case_128, label %when_next_129
when_case_128:
  %907 = load i64**, i64*** %ptr_gen
  %908 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %907, i64** %908)
  br label %when_end_123
when_next_129:
  %909 = icmp eq i64 %885, 2
  br i1 %909, label %when_case_130, label %when_next_131
when_case_130:
  %910 = getelementptr inbounds i64, i8* %882, i64 1
  %911 = bitcast i64* %910 to i64*
  %912 = load i64, i64* %911, align 8
  store i64 %912, i64 0
  %913 = load i64**, i64*** %ptr_gen
  %914 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %913, i64** %914)
  br label %when_end_123
when_next_131:
  %915 = icmp eq i64 %885, 3
  br i1 %915, label %when_case_132, label %when_next_133
when_case_132:
  %916 = load i64**, i64*** %ptr_gen
  %917 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %916, i64** %917)
  br label %when_end_123
when_next_133:
  %918 = icmp eq i64 %885, 2
  br i1 %918, label %when_case_134, label %when_next_135
when_case_134:
  %919 = load i64**, i64*** %ptr_gen
  %920 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %919, i64** %920)
  br label %when_end_123
when_next_135:
  %921 = icmp eq i64 %885, 11
  br i1 %921, label %when_case_136, label %when_next_137
when_case_136:
  %922 = load i64**, i64*** %ptr_gen
  %923 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %922, i64** %923)
  br label %when_end_123
when_next_137:
  %924 = icmp eq i64 %885, 7
  br i1 %924, label %when_case_138, label %when_next_139
when_case_138:
  %925 = load i64**, i64*** %ptr_gen
  %926 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %925, i64** %926)
  br label %when_end_123
when_next_139:
  %927 = icmp eq i64 %885, 8
  br i1 %927, label %when_case_140, label %when_next_141
when_case_140:
  %928 = load i64**, i64*** %ptr_gen
  %929 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %928, i64** %929)
  br label %when_end_123
when_next_141:
  br label %when_end_123
when_end_123:
  br label %end_if_121
else_122:
  %930 = load i64**, i64*** %ptr_gen
  %931 = load i64**, i64*** %ptr_stmt_ptr
  call void @ir_generate_statement(i64** %930, i64** %931)
  br label %end_if_121
end_if_121:
  %932 = load i64, i64* %ptr_j
  %933 = add nsw i64 %932, 1
  store i64 %933, i64* %ptr_j
  br label %while_cond_117
while_end_119:
  %934 = call i8* @malloc(i64 16)
  %935 = bitcast i8* %934 to i64*
  %936 = getelementptr inbounds i64, i64* %935, i64 0
  store i64 0, i64* %936
  %937 = load i8*, i8** %ptr_end_label
  %938 = getelementptr inbounds i64, i64* %935, i64 1
  %939 = bitcast i64* %938 to i8**
  store i8* %937, i8** %939
  %940 = load i64**, i64*** %ptr_gen
  call void @ir_finish_block(i64** %940, i64* %935)
  %941 = load i64**, i64*** %ptr_gen
  %942 = load i8*, i8** %ptr_next_label
  call void @ir_start_block(i64** %941, i8* %942)
  %943 = add nsw i64 0, 1
  store i64 %943, i64 0
  br label %while_cond_105
while_end_107:
  %944 = call i8* @malloc(i64 8)
  %945 = bitcast i8* %944 to i64*
  store i64* %945, i64*** %ptr_void_op
  %946 = call i8* @malloc(i64 8)
  %947 = bitcast i8* %946 to i64*
  %948 = getelementptr inbounds i64, i64* %947, i64 0
  store i64 7, i64* %948
  %949 = load i64**, i64*** %ptr_void_op
  store i64* %947, i64** %949
  %950 = call i8* @malloc(i64 24)
  %951 = bitcast i8* %950 to i64*
  %952 = getelementptr inbounds i64, i64* %951, i64 0
  store i64 0, i64* %952
  %953 = load i64**, i64*** %ptr_dest_temp
  %954 = getelementptr inbounds i64, i64* %951, i64 1
  %955 = bitcast i64* %954 to i64***
  store i64** %953, i64*** %955
  %956 = load i64**, i64*** %ptr_void_op
  %957 = getelementptr inbounds i64, i64* %951, i64 2
  %958 = bitcast i64* %957 to i64***
  store i64** %956, i64*** %958
  %959 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %959, i64* %951)
  %960 = call i8* @malloc(i64 16)
  %961 = bitcast i8* %960 to i64*
  %962 = getelementptr inbounds i64, i64* %961, i64 0
  store i64 0, i64* %962
  %963 = load i8*, i8** %ptr_end_label
  %964 = getelementptr inbounds i64, i64* %961, i64 1
  %965 = bitcast i64* %964 to i8**
  store i8* %963, i8** %965
  %966 = load i64**, i64*** %ptr_gen
  call void @ir_finish_block(i64** %966, i64* %961)
  %967 = load i64**, i64*** %ptr_gen
  %968 = load i8*, i8** %ptr_end_label
  call void @ir_start_block(i64** %967, i8* %968)
  %969 = load i64**, i64*** %ptr_dest_temp
  ret i64** %969
unreachable_142:
  br label %when_end_0
when_next_39:
  %970 = icmp eq i64 %14, 5
  br i1 %970, label %when_case_143, label %when_next_144
when_case_143:
  %971 = getelementptr inbounds i64, i8* %11, i64 1
  %972 = bitcast i64* %971 to i64***
  %973 = load i64**, i64*** %972, align 8
  store i64** %973, i64*** %ptr_a
  %974 = load i64**, i64*** %ptr_a
  store i64** %974, i64*** %ptr_al
  %975 = load i64**, i64*** %ptr_gen
  %976 = call i64** @ir_new_temp(i64** %975)
  store i64** %976, i64** %113
  %977 = load i64**, i64*** %ptr_al
  %978 = bitcast i64** %977 to i64*
  %979 = getelementptr inbounds i64, i64* %978, i64 0
  %980 = bitcast i64* %979 to i8**
  %981 = load i8*, i8** %980, align 8
  %982 = bitcast i8* %981 to i64*
  %983 = getelementptr inbounds i64, i64* %982, i64 0
  %984 = bitcast i64* %983 to i8**
  %985 = load i8*, i8** %984, align 8
  %986 = bitcast i8* %985 to i64*
  %987 = getelementptr inbounds i64, i64* %986, i64 0
  %988 = bitcast i64* %987 to i8**
  %989 = load i8*, i8** %988, align 8
  store i8* %989, i8** %ptr_ty_name
  %990 = load i64**, i64*** %ptr_gen
  %991 = bitcast i64** %990 to i64*
  %992 = getelementptr inbounds i64, i64* %991, i64 6
  %993 = bitcast i64* %992 to i8**
  %994 = load i8*, i8** %993, align 8
  %995 = load i8*, i8** %ptr_ty_name
  %996 = call i64** @string_list_map_get(i8* %994, i8* %995)
  store i64** %996, i64*** %ptr_fields_opt
  %997 = load i64**, i64*** %ptr_fields_opt
  %998 = icmp ne i64** %997, null
  br i1 %998, label %then_145, label %end_if_146
then_145:
  %999 = load i64**, i64*** %ptr_fields_opt
  store i64** %999, i64*** %ptr_fields_list
  %1000 = load i64**, i64*** %ptr_fields_list
  %1001 = bitcast i64** %1000 to i64*
  %1002 = getelementptr inbounds i64, i64* %1001, i64 1
  %1003 = bitcast i64* %1002 to i64*
  %1004 = load i64, i64* %1003, align 8
  %1005 = mul nsw i64 %1004, 8
  store i64 %1005, i64 8
  %1006 = icmp eq i64 8, 0
  br i1 %1006, label %then_147, label %end_if_148
then_147:
  store i64 8, i64 8
  br label %end_if_148
end_if_148:
  br label %end_if_146
end_if_146:
  %1007 = call i8* @malloc(i64 32)
  %1008 = bitcast i8* %1007 to i64*
  %1009 = getelementptr inbounds i64, i64* %1008, i64 0
  store i64 5, i64* %1009
  %1010 = getelementptr inbounds i64, i64* %1008, i64 1
  %1011 = bitcast i64* %1010 to i64***
  store i64** %113, i64*** %1011
  %1012 = load i8*, i8** %ptr_ty_name
  %1013 = getelementptr inbounds i64, i64* %1008, i64 2
  %1014 = bitcast i64* %1013 to i8**
  store i8* %1012, i8** %1014
  %1015 = getelementptr inbounds i64, i64* %1008, i64 3
  %1016 = bitcast i64* %1015 to i64*
  store i64 8, i64* %1016
  %1017 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %1017, i64* %1008)
  ret i64** %113
unreachable_149:
  br label %when_end_0
when_next_144:
  %1018 = icmp eq i64 %14, 6
  br i1 %1018, label %when_case_150, label %when_next_151
when_case_150:
  %1019 = getelementptr inbounds i64, i8* %11, i64 1
  %1020 = bitcast i64* %1019 to i64***
  %1021 = load i64**, i64*** %1020, align 8
  store i64** %1021, i64*** %ptr_d
  %1022 = load i64**, i64*** %ptr_gen
  %1023 = load i64**, i64*** %ptr_d
  %1024 = call i64** @ir_generate_expression(i64** %1022, i64** %1023)
  store i64** %1024, i64*** %ptr_ptr
  %1025 = load i64**, i64*** %ptr_gen
  %1026 = call i64** @ir_new_temp(i64** %1025)
  store i64** %1026, i64** %113
  %1027 = call i8* @malloc(i64 24)
  %1028 = bitcast i8* %1027 to i64*
  %1029 = getelementptr inbounds i64, i64* %1028, i64 0
  store i64 12, i64* %1029
  %1030 = getelementptr inbounds i64, i64* %1028, i64 1
  %1031 = bitcast i64* %1030 to i64***
  store i64** %113, i64*** %1031
  %1032 = load i64**, i64*** %ptr_ptr
  %1033 = getelementptr inbounds i64, i64* %1028, i64 2
  %1034 = bitcast i64* %1033 to i64***
  store i64** %1032, i64*** %1034
  %1035 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %1035, i64* %1028)
  ret i64** %113
unreachable_152:
  br label %when_end_0
when_next_151:
  %1036 = icmp eq i64 %14, 7
  br i1 %1036, label %when_case_153, label %when_next_154
when_case_153:
  %1037 = getelementptr inbounds i64, i8* %11, i64 1
  %1038 = bitcast i64* %1037 to i64***
  %1039 = load i64**, i64*** %1038, align 8
  store i64** %1039, i64*** %ptr_vec_expr
  %1040 = load i64**, i64*** %ptr_vec_expr
  %1041 = bitcast i64** %1040 to i64*
  %1042 = getelementptr inbounds i64, i64* %1041, i64 0
  %1043 = bitcast i64* %1042 to i8**
  %1044 = load i8*, i8** %1043, align 8
  %1045 = load i64**, i64*** %ptr_gen
  %1046 = call i64** @ir_generate_expression(i64** %1045, i8* %1044)
  ret i64** %1046
unreachable_155:
  br label %when_end_0
when_next_154:
  %1047 = icmp eq i64 %14, 8
  br i1 %1047, label %when_case_156, label %when_next_157
when_case_156:
  %1048 = getelementptr inbounds i64, i8* %11, i64 1
  %1049 = bitcast i64* %1048 to i64***
  %1050 = load i64**, i64*** %1049, align 8
  store i64** %1050, i64*** %ptr_idx
  %1051 = load i64**, i64*** %ptr_idx
  store i64** %1051, i64*** %ptr_idx_expr
  %1052 = load i64**, i64*** %ptr_gen
  %1053 = call i64** @ir_new_temp(i64** %1052)
  %1054 = load i64**, i64*** %ptr_idx_expr
  %1055 = bitcast i64** %1054 to i64*
  %1056 = getelementptr inbounds i64, i64* %1055, i64 0
  %1057 = bitcast i64* %1056 to i8**
  %1058 = load i8*, i8** %1057, align 8
  %1059 = bitcast i8* %1058 to i64*
  %1060 = getelementptr inbounds i64, i64* %1059, i64 0
  %1061 = bitcast i64* %1060 to i8**
  %1062 = load i8*, i8** %1061, align 8
  store i8* %1062, i64** %ptr_idx_target_node
  %1063 = load i64*, i64** %ptr_idx_target_node
  %1064 = getelementptr inbounds i64, i64* %1063, i64 0
  %1065 = bitcast i64* %1064 to i64*
  %1066 = load i64, i64* %1065, align 8
  %1067 = icmp eq i64 %1066, 2
  br i1 %1067, label %when_case_159, label %when_next_160
when_case_159:
  %1068 = load i64*, i64** %ptr_idx_target_node
  %1069 = getelementptr inbounds i64, i64* %1068, i64 1
  %1070 = bitcast i64* %1069 to i64***
  %1071 = load i64**, i64*** %1070, align 8
  %1072 = bitcast i64** %1071 to i64*
  %1073 = getelementptr inbounds i64, i64* %1072, i64 0
  %1074 = bitcast i64* %1073 to i8**
  %1075 = load i8*, i8** %1074, align 8
  %1076 = bitcast i8* %1075 to i64*
  %1077 = getelementptr inbounds i64, i64* %1076, i64 0
  %1078 = bitcast i64* %1077 to i8**
  %1079 = load i8*, i8** %1078, align 8
  store i8* %1079, i64** %ptr_prop_obj_node
  %1080 = load i64*, i64** %ptr_prop_obj_node
  %1081 = getelementptr inbounds i64, i64* %1080, i64 0
  %1082 = bitcast i64* %1081 to i64*
  %1083 = load i64, i64* %1082, align 8
  %1084 = icmp eq i64 %1083, 16
  br i1 %1084, label %when_case_162, label %when_next_163
when_case_162:
  %1085 = load i64*, i64** %ptr_prop_obj_node
  %1086 = getelementptr inbounds i64, i64* %1085, i64 1
  %1087 = bitcast i64* %1086 to i64***
  %1088 = load i64**, i64*** %1087, align 8
  store i64** %1088, i64** %18
  %1089 = load i64*, i64** %18
  %1090 = getelementptr inbounds i64, i64* %1089, i64 0
  %1091 = bitcast i64* %1090 to i64*
  %1092 = load i64, i64* %1091, align 8
  %1093 = icmp eq i64 %1092, 0
  br i1 %1093, label %when_case_165, label %when_next_166
when_case_165:
  %1094 = getelementptr inbounds i64, i64* %1089, i64 1
  %1095 = bitcast i64* %1094 to i8**
  %1096 = load i8*, i8** %1095, align 8
  %1097 = load i64**, i64*** %ptr_idx_expr
  %1098 = bitcast i64** %1097 to i64*
  %1099 = getelementptr inbounds i64, i64* %1098, i64 1
  %1100 = bitcast i64* %1099 to i8**
  %1101 = load i8*, i8** %1100, align 8
  %1102 = load i64**, i64*** %ptr_gen
  %1103 = call i64** @ir_generate_expression(i64** %1102, i8* %1101)
  store i64** %1103, i64*** %ptr_i_val
  store i64 0, i64* %ptr_size
  %1104 = load i64**, i64*** %ptr_gen
  %1105 = bitcast i64** %1104 to i64*
  %1106 = getelementptr inbounds i64, i64* %1105, i64 8
  %1107 = bitcast i64* %1106 to i8**
  %1108 = load i8*, i8** %1107, align 8
  %1109 = call i64 @string_int_map_get(i8* %1108, i8* %1096)
  store i64 %1109, i64* %ptr_sz_opt
  %1110 = load i64, i64* %ptr_sz_opt
  %1111 = icmp ne i64 %1110, null
  br i1 %1111, label %then_167, label %end_if_168
then_167:
  %1112 = load i64, i64* %ptr_sz_opt
  store i64 %1112, i64*** %ptr_s
  %1113 = load i64**, i64*** %ptr_s
  store i64** %1113, i64* %ptr_size
  br label %end_if_168
end_if_168:
  %1114 = bitcast i64** %1071 to i64*
  %1115 = getelementptr inbounds i64, i64* %1114, i64 1
  %1116 = bitcast i64* %1115 to i8**
  %1117 = load i8*, i8** %1116, align 8
  %1118 = call i8* @malloc(i64 48)
  %1119 = bitcast i8* %1118 to i64*
  %1120 = getelementptr inbounds i64, i64* %1119, i64 0
  store i64 16, i64* %1120
  %1121 = getelementptr inbounds i64, i64* %1119, i64 1
  %1122 = bitcast i64* %1121 to i64***
  store i64** %1053, i64*** %1122
  %1123 = getelementptr inbounds i64, i64* %1119, i64 2
  %1124 = bitcast i64* %1123 to i8**
  store i8* %1096, i8** %1124
  %1125 = getelementptr inbounds i64, i64* %1119, i64 3
  %1126 = bitcast i64* %1125 to i8**
  store i8* %1117, i8** %1126
  %1127 = load i64**, i64*** %ptr_i_val
  %1128 = getelementptr inbounds i64, i64* %1119, i64 4
  %1129 = bitcast i64* %1128 to i64***
  store i64** %1127, i64*** %1129
  %1130 = load i64, i64* %ptr_size
  %1131 = getelementptr inbounds i64, i64* %1119, i64 5
  %1132 = bitcast i64* %1131 to i64*
  store i64 %1130, i64* %1132
  %1133 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %1133, i64* %1119)
  br label %when_end_164
when_next_166:
  %1134 = icmp eq i64 %1092, 1
  br i1 %1134, label %when_case_169, label %when_next_170
when_case_169:
  br label %when_end_164
when_next_170:
  %1135 = icmp eq i64 %1092, 2
  br i1 %1135, label %when_case_171, label %when_next_172
when_case_171:
  br label %when_end_164
when_next_172:
  %1136 = icmp eq i64 %1092, 5
  br i1 %1136, label %when_case_173, label %when_next_174
when_case_173:
  br label %when_end_164
when_next_174:
  %1137 = icmp eq i64 %1092, 3
  br i1 %1137, label %when_case_175, label %when_next_176
when_case_175:
  br label %when_end_164
when_next_176:
  %1138 = icmp eq i64 %1092, 4
  br i1 %1138, label %when_case_177, label %when_next_178
when_case_177:
  br label %when_end_164
when_next_178:
  %1139 = icmp eq i64 %1092, 7
  br i1 %1139, label %when_case_179, label %when_next_180
when_case_179:
  br label %when_end_164
when_next_180:
  %1140 = icmp eq i64 %1092, 6
  br i1 %1140, label %when_case_181, label %when_next_182
when_case_181:
  br label %when_end_164
when_next_182:
  %1141 = icmp eq i64 %1092, 8
  br i1 %1141, label %when_case_183, label %when_next_184
when_case_183:
  br label %when_end_164
when_next_184:
  br label %when_end_164
when_end_164:
  br label %when_end_161
when_next_163:
  %1142 = icmp eq i64 %1083, 3
  br i1 %1142, label %when_case_185, label %when_next_186
when_case_185:
  br label %when_end_161
when_next_186:
  %1143 = icmp eq i64 %1083, 4
  br i1 %1143, label %when_case_187, label %when_next_188
when_case_187:
  br label %when_end_161
when_next_188:
  %1144 = icmp eq i64 %1083, 9
  br i1 %1144, label %when_case_189, label %when_next_190
when_case_189:
  br label %when_end_161
when_next_190:
  %1145 = icmp eq i64 %1083, 5
  br i1 %1145, label %when_case_191, label %when_next_192
when_case_191:
  br label %when_end_161
when_next_192:
  %1146 = icmp eq i64 %1083, 15
  br i1 %1146, label %when_case_193, label %when_next_194
when_case_193:
  br label %when_end_161
when_next_194:
  %1147 = icmp eq i64 %1083, 11
  br i1 %1147, label %when_case_195, label %when_next_196
when_case_195:
  br label %when_end_161
when_next_196:
  %1148 = icmp eq i64 %1083, 12
  br i1 %1148, label %when_case_197, label %when_next_198
when_case_197:
  br label %when_end_161
when_next_198:
  %1149 = icmp eq i64 %1083, 13
  br i1 %1149, label %when_case_199, label %when_next_200
when_case_199:
  br label %when_end_161
when_next_200:
  %1150 = icmp eq i64 %1083, 14
  br i1 %1150, label %when_case_201, label %when_next_202
when_case_201:
  br label %when_end_161
when_next_202:
  %1151 = icmp eq i64 %1083, 1
  br i1 %1151, label %when_case_203, label %when_next_204
when_case_203:
  br label %when_end_161
when_next_204:
  %1152 = icmp eq i64 %1083, 0
  br i1 %1152, label %when_case_205, label %when_next_206
when_case_205:
  br label %when_end_161
when_next_206:
  %1153 = icmp eq i64 %1083, 2
  br i1 %1153, label %when_case_207, label %when_next_208
when_case_207:
  br label %when_end_161
when_next_208:
  %1154 = icmp eq i64 %1083, 6
  br i1 %1154, label %when_case_209, label %when_next_210
when_case_209:
  br label %when_end_161
when_next_210:
  %1155 = icmp eq i64 %1083, 10
  br i1 %1155, label %when_case_211, label %when_next_212
when_case_211:
  br label %when_end_161
when_next_212:
  %1156 = icmp eq i64 %1083, 7
  br i1 %1156, label %when_case_213, label %when_next_214
when_case_213:
  br label %when_end_161
when_next_214:
  %1157 = icmp eq i64 %1083, 8
  br i1 %1157, label %when_case_215, label %when_next_216
when_case_215:
  br label %when_end_161
when_next_216:
  br label %when_end_161
when_end_161:
  br label %when_end_158
when_next_160:
  %1158 = icmp eq i64 %1066, 3
  br i1 %1158, label %when_case_217, label %when_next_218
when_case_217:
  br label %when_end_158
when_next_218:
  %1159 = icmp eq i64 %1066, 4
  br i1 %1159, label %when_case_219, label %when_next_220
when_case_219:
  br label %when_end_158
when_next_220:
  %1160 = icmp eq i64 %1066, 9
  br i1 %1160, label %when_case_221, label %when_next_222
when_case_221:
  br label %when_end_158
when_next_222:
  %1161 = icmp eq i64 %1066, 5
  br i1 %1161, label %when_case_223, label %when_next_224
when_case_223:
  br label %when_end_158
when_next_224:
  %1162 = icmp eq i64 %1066, 15
  br i1 %1162, label %when_case_225, label %when_next_226
when_case_225:
  br label %when_end_158
when_next_226:
  %1163 = icmp eq i64 %1066, 11
  br i1 %1163, label %when_case_227, label %when_next_228
when_case_227:
  br label %when_end_158
when_next_228:
  %1164 = icmp eq i64 %1066, 12
  br i1 %1164, label %when_case_229, label %when_next_230
when_case_229:
  br label %when_end_158
when_next_230:
  %1165 = icmp eq i64 %1066, 13
  br i1 %1165, label %when_case_231, label %when_next_232
when_case_231:
  br label %when_end_158
when_next_232:
  %1166 = icmp eq i64 %1066, 14
  br i1 %1166, label %when_case_233, label %when_next_234
when_case_233:
  br label %when_end_158
when_next_234:
  %1167 = icmp eq i64 %1066, 1
  br i1 %1167, label %when_case_235, label %when_next_236
when_case_235:
  br label %when_end_158
when_next_236:
  %1168 = icmp eq i64 %1066, 0
  br i1 %1168, label %when_case_237, label %when_next_238
when_case_237:
  br label %when_end_158
when_next_238:
  %1169 = icmp eq i64 %1066, 2
  br i1 %1169, label %when_case_239, label %when_next_240
when_case_239:
  br label %when_end_158
when_next_240:
  %1170 = icmp eq i64 %1066, 16
  br i1 %1170, label %when_case_241, label %when_next_242
when_case_241:
  br label %when_end_158
when_next_242:
  %1171 = icmp eq i64 %1066, 6
  br i1 %1171, label %when_case_243, label %when_next_244
when_case_243:
  br label %when_end_158
when_next_244:
  %1172 = icmp eq i64 %1066, 10
  br i1 %1172, label %when_case_245, label %when_next_246
when_case_245:
  br label %when_end_158
when_next_246:
  %1173 = icmp eq i64 %1066, 7
  br i1 %1173, label %when_case_247, label %when_next_248
when_case_247:
  br label %when_end_158
when_next_248:
  %1174 = icmp eq i64 %1066, 8
  br i1 %1174, label %when_case_249, label %when_next_250
when_case_249:
  br label %when_end_158
when_next_250:
  br label %when_end_158
when_end_158:
  ret i64** %1053
unreachable_251:
  br label %when_end_0
when_next_157:
  %1175 = icmp eq i64 %14, 9
  br i1 %1175, label %when_case_252, label %when_next_253
when_case_252:
  %1176 = getelementptr inbounds i64, i8* %11, i64 1
  %1177 = bitcast i64* %1176 to i64***
  %1178 = load i64**, i64*** %1177, align 8
  store i64** %1178, i64** %1039
  store i64** %1039, i64*** %ptr_var_expr
  store i64 0, i64* %ptr_expected_tag
  %1179 = load i64**, i64*** %ptr_gen
  %1180 = bitcast i64** %1179 to i64*
  %1181 = getelementptr inbounds i64, i64* %1180, i64 7
  %1182 = bitcast i64* %1181 to i8**
  %1183 = load i8*, i8** %1182, align 8
  %1184 = load i64**, i64*** %ptr_var_expr
  %1185 = bitcast i64** %1184 to i64*
  %1186 = getelementptr inbounds i64, i64* %1185, i64 0
  %1187 = bitcast i64* %1186 to i8**
  %1188 = load i8*, i8** %1187, align 8
  %1189 = call i64** @string_inner_map_get(i8* %1183, i8* %1188)
  store i64** %1189, i64*** %ptr_inner_opt
  %1190 = load i64**, i64*** %ptr_inner_opt
  %1191 = icmp ne i64** %1190, null
  br i1 %1191, label %then_254, label %end_if_255
then_254:
  %1192 = load i64**, i64*** %ptr_inner_opt
  store i64** %1192, i64*** %ptr_inner_map
  %1193 = load i64**, i64*** %ptr_var_expr
  %1194 = bitcast i64** %1193 to i64*
  %1195 = getelementptr inbounds i64, i64* %1194, i64 1
  %1196 = bitcast i64* %1195 to i8**
  %1197 = load i8*, i8** %1196, align 8
  %1198 = load i64**, i64*** %ptr_inner_map
  %1199 = call i64 @string_int_map_get(i64** %1198, i8* %1197)
  store i64 %1199, i64* %ptr_tag_opt
  %1200 = load i64, i64* %ptr_tag_opt
  %1201 = icmp ne i64 %1200, null
  br i1 %1201, label %then_256, label %end_if_257
then_256:
  %1202 = load i64, i64* %ptr_tag_opt
  store i64 %1202, i64* %ptr_tag_val
  %1203 = load i64, i64* %ptr_tag_val
  store i64 %1203, i64* %ptr_expected_tag
  br label %end_if_257
end_if_257:
  br label %end_if_255
end_if_255:
  %1204 = load i64**, i64*** %ptr_ret_op
  %1205 = call i64** @new_list_IROperand(i64 10, i64** %1204)
  store i64** %1205, i64*** %ptr_args_list
  store i64 0, i64 0
  br label %while_cond_258
while_cond_258:
  %1206 = load i64**, i64*** %ptr_var_expr
  %1207 = bitcast i64** %1206 to i64*
  %1208 = getelementptr inbounds i64, i64* %1207, i64 2
  %1209 = bitcast i64* %1208 to i8**
  %1210 = load i8*, i8** %1209, align 8
  %1211 = bitcast i8* %1210 to i64*
  %1212 = getelementptr inbounds i64, i64* %1211, i64 1
  %1213 = bitcast i64* %1212 to i64*
  %1214 = load i64, i64* %1213, align 8
  %1215 = icmp slt i64 0, %1214
  br i1 %1215, label %while_body_259, label %while_end_260
while_body_259:
  %1216 = load i64**, i64*** %ptr_var_expr
  %1217 = bitcast i64** %1216 to i64*
  %1218 = getelementptr inbounds i64, i64* %1217, i64 2
  %1219 = bitcast i64* %1218 to i8**
  %1220 = load i8*, i8** %1219, align 8
  %1221 = call i64* @list_get_Spanned_Expression(i8* %1220, i64 0)
  store i64* %1221, i64** %ptr_arg
  %1222 = call i8* @malloc(i64 16)
  %1223 = bitcast i8* %1222 to i64*
  store i64* %1223, i64*** %ptr_arg_ptr
  %1224 = load i64**, i64*** %ptr_arg_ptr
  %1225 = load i64*, i64** %ptr_arg
  store i64* %1225, i64** %1224
  %1226 = load i64**, i64*** %ptr_gen
  %1227 = load i64**, i64*** %ptr_arg_ptr
  %1228 = call i64** @ir_generate_expression(i64** %1226, i64** %1227)
  store i64** %1228, i64*** %ptr_arg_op
  %1229 = load i64**, i64*** %ptr_arg_op
  %1230 = load i64*, i64** %1229
  %1231 = load i64**, i64*** %ptr_args_list
  call void @list_push_IROperand(i64** %1231, i64* %1230)
  %1232 = add nsw i64 0, 1
  store i64 %1232, i64 0
  br label %while_cond_258
while_end_260:
  %1233 = load i64**, i64*** %ptr_gen
  %1234 = call i64** @ir_new_temp(i64** %1233)
  store i64** %1234, i64** %113
  %1235 = call i8* @malloc(i64 32)
  %1236 = bitcast i8* %1235 to i64*
  %1237 = getelementptr inbounds i64, i64* %1236, i64 0
  store i64 9, i64* %1237
  %1238 = getelementptr inbounds i64, i64* %1236, i64 1
  %1239 = bitcast i64* %1238 to i64***
  store i64** %113, i64*** %1239
  %1240 = load i64, i64* %ptr_expected_tag
  %1241 = getelementptr inbounds i64, i64* %1236, i64 2
  %1242 = bitcast i64* %1241 to i64*
  store i64 %1240, i64* %1242
  %1243 = load i64**, i64*** %ptr_args_list
  %1244 = getelementptr inbounds i64, i64* %1236, i64 3
  %1245 = bitcast i64* %1244 to i64***
  store i64** %1243, i64*** %1245
  %1246 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %1246, i64* %1236)
  ret i64** %113
unreachable_261:
  br label %when_end_0
when_next_253:
  %1247 = icmp eq i64 %14, 10
  br i1 %1247, label %when_case_262, label %when_next_263
when_case_262:
  %1248 = getelementptr inbounds i64, i8* %11, i64 1
  %1249 = bitcast i64* %1248 to i64***
  %1250 = load i64**, i64*** %1249, align 8
  store i64** %1250, i64*** %ptr_s
  %1251 = load i64**, i64*** %ptr_s
  store i64** %1251, i64*** %ptr_acc
  %1252 = load i64**, i64*** %ptr_acc
  %1253 = bitcast i64** %1252 to i64*
  %1254 = getelementptr inbounds i64, i64* %1253, i64 0
  %1255 = bitcast i64* %1254 to i8**
  %1256 = load i8*, i8** %1255, align 8
  %1257 = load i64**, i64*** %ptr_gen
  %1258 = call i64** @ir_generate_expression(i64** %1257, i8* %1256)
  store i64** %1258, i64*** %ptr_ptr_op
  %1259 = load i64**, i64*** %ptr_gen
  %1260 = call i64** @ir_new_temp(i64** %1259)
  store i64** %1260, i64** %1053
  %1261 = load i64**, i64*** %ptr_acc
  %1262 = bitcast i64** %1261 to i64*
  %1263 = getelementptr inbounds i64, i64* %1262, i64 1
  %1264 = bitcast i64* %1263 to i64*
  %1265 = load i64, i64* %1264, align 8
  %1266 = load i64**, i64*** %ptr_acc
  %1267 = bitcast i64** %1266 to i64*
  %1268 = getelementptr inbounds i64, i64* %1267, i64 2
  %1269 = bitcast i64* %1268 to i8**
  %1270 = load i8*, i8** %1269, align 8
  %1271 = call i8* @malloc(i64 40)
  %1272 = bitcast i8* %1271 to i64*
  %1273 = getelementptr inbounds i64, i64* %1272, i64 0
  store i64 14, i64* %1273
  %1274 = getelementptr inbounds i64, i64* %1272, i64 1
  %1275 = bitcast i64* %1274 to i64***
  store i64** %1053, i64*** %1275
  %1276 = load i64**, i64*** %ptr_ptr_op
  %1277 = getelementptr inbounds i64, i64* %1272, i64 2
  %1278 = bitcast i64* %1277 to i64***
  store i64** %1276, i64*** %1278
  %1279 = getelementptr inbounds i64, i64* %1272, i64 3
  %1280 = bitcast i64* %1279 to i64*
  store i64 %1265, i64* %1280
  %1281 = getelementptr inbounds i64, i64* %1272, i64 4
  %1282 = bitcast i64* %1281 to i8**
  store i8* %1270, i8** %1282
  %1283 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %1283, i64* %1272)
  ret i64** %1053
unreachable_264:
  br label %when_end_0
when_next_263:
  %1284 = icmp eq i64 %14, 11
  br i1 %1284, label %when_case_265, label %when_next_266
when_case_265:
  %1285 = getelementptr inbounds i64, i8* %11, i64 1
  %1286 = bitcast i64* %1285 to i64***
  %1287 = load i64**, i64*** %1286, align 8
  store i64** %1287, i64*** %ptr_s
  %1288 = load i64**, i64*** %ptr_s
  store i64** %1288, i64*** %ptr_s_idx
  %1289 = load i64**, i64*** %ptr_s_idx
  %1290 = bitcast i64** %1289 to i64*
  %1291 = getelementptr inbounds i64, i64* %1290, i64 0
  %1292 = bitcast i64* %1291 to i8**
  %1293 = load i8*, i8** %1292, align 8
  %1294 = load i64**, i64*** %ptr_gen
  %1295 = call i64** @ir_generate_expression(i64** %1294, i8* %1293)
  store i64** %1295, i64*** %ptr_str_op
  %1296 = load i64**, i64*** %ptr_s_idx
  %1297 = bitcast i64** %1296 to i64*
  %1298 = getelementptr inbounds i64, i64* %1297, i64 1
  %1299 = bitcast i64* %1298 to i8**
  %1300 = load i8*, i8** %1299, align 8
  %1301 = load i64**, i64*** %ptr_gen
  %1302 = call i64** @ir_generate_expression(i64** %1301, i8* %1300)
  store i64** %1302, i64*** %ptr_idx_op
  %1303 = load i64**, i64*** %ptr_gen
  %1304 = call i64** @ir_new_temp(i64** %1303)
  store i64** %1304, i64** %1053
  %1305 = call i8* @malloc(i64 32)
  %1306 = bitcast i8* %1305 to i64*
  %1307 = getelementptr inbounds i64, i64* %1306, i64 0
  store i64 18, i64* %1307
  %1308 = getelementptr inbounds i64, i64* %1306, i64 1
  %1309 = bitcast i64* %1308 to i64***
  store i64** %1053, i64*** %1309
  %1310 = load i64**, i64*** %ptr_str_op
  %1311 = getelementptr inbounds i64, i64* %1306, i64 2
  %1312 = bitcast i64* %1311 to i64***
  store i64** %1310, i64*** %1312
  %1313 = load i64**, i64*** %ptr_idx_op
  %1314 = getelementptr inbounds i64, i64* %1306, i64 3
  %1315 = bitcast i64* %1314 to i64***
  store i64** %1313, i64*** %1315
  %1316 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %1316, i64* %1306)
  ret i64** %1053
unreachable_267:
  br label %when_end_0
when_next_266:
  %1317 = icmp eq i64 %14, 12
  br i1 %1317, label %when_case_268, label %when_next_269
when_case_268:
  %1318 = getelementptr inbounds i64, i8* %11, i64 1
  %1319 = bitcast i64* %1318 to i64***
  %1320 = load i64**, i64*** %1319, align 8
  store i64** %1320, i64*** %ptr_s
  %1321 = load i64**, i64*** %ptr_s
  store i64** %1321, i64*** %ptr_s_slice
  %1322 = load i64**, i64*** %ptr_s_slice
  %1323 = bitcast i64** %1322 to i64*
  %1324 = getelementptr inbounds i64, i64* %1323, i64 0
  %1325 = bitcast i64* %1324 to i8**
  %1326 = load i8*, i8** %1325, align 8
  %1327 = load i64**, i64*** %ptr_gen
  %1328 = call i64** @ir_generate_expression(i64** %1327, i8* %1326)
  store i64** %1328, i64*** %ptr_str_op
  %1329 = call i8* @malloc(i64 8)
  %1330 = bitcast i8* %1329 to i64*
  store i64* %1330, i64*** %ptr_start_op
  %1331 = call i8* @malloc(i64 16)
  %1332 = bitcast i8* %1331 to i64*
  %1333 = getelementptr inbounds i64, i64* %1332, i64 0
  store i64 0, i64* %1333
  %1334 = getelementptr inbounds i64, i64* %1332, i64 1
  %1335 = bitcast i64* %1334 to i64*
  store i64 0, i64* %1335
  %1336 = load i64**, i64*** %ptr_start_op
  store i64* %1332, i64** %1336
  %1337 = load i64**, i64*** %ptr_s_slice
  %1338 = bitcast i64** %1337 to i64*
  %1339 = getelementptr inbounds i64, i64* %1338, i64 1
  %1340 = bitcast i64* %1339 to i8**
  %1341 = load i8*, i8** %1340, align 8
  store i8* %1341, i64*** %ptr_start_opt
  %1342 = load i64**, i64*** %ptr_start_opt
  %1343 = icmp ne i64** %1342, null
  br i1 %1343, label %then_270, label %end_if_271
then_270:
  %1344 = load i64**, i64*** %ptr_start_opt
  store i64** %1344, i64*** %ptr_st
  %1345 = load i64**, i64*** %ptr_gen
  %1346 = load i64**, i64*** %ptr_st
  %1347 = call i64** @ir_generate_expression(i64** %1345, i64** %1346)
  store i64** %1347, i64*** %ptr_start_op
  br label %end_if_271
end_if_271:
  %1348 = call i8* @malloc(i64 8)
  %1349 = bitcast i8* %1348 to i64*
  store i64* %1349, i64*** %ptr_end_op
  %1350 = sub nsw i64 0, 1
  %1351 = call i8* @malloc(i64 16)
  %1352 = bitcast i8* %1351 to i64*
  %1353 = getelementptr inbounds i64, i64* %1352, i64 0
  store i64 0, i64* %1353
  %1354 = getelementptr inbounds i64, i64* %1352, i64 1
  %1355 = bitcast i64* %1354 to i64*
  store i64 %1350, i64* %1355
  %1356 = load i64**, i64*** %ptr_end_op
  store i64* %1352, i64** %1356
  %1357 = load i64**, i64*** %ptr_s_slice
  %1358 = bitcast i64** %1357 to i64*
  %1359 = getelementptr inbounds i64, i64* %1358, i64 2
  %1360 = bitcast i64* %1359 to i8**
  %1361 = load i8*, i8** %1360, align 8
  store i8* %1361, i64*** %ptr_end_opt
  %1362 = load i64**, i64*** %ptr_end_opt
  %1363 = icmp ne i64** %1362, null
  br i1 %1363, label %then_272, label %end_if_273
then_272:
  %1364 = load i64**, i64*** %ptr_end_opt
  store i64** %1364, i64*** %ptr_e
  %1365 = load i64**, i64*** %ptr_gen
  %1366 = load i64**, i64*** %ptr_e
  %1367 = call i64** @ir_generate_expression(i64** %1365, i64** %1366)
  store i64** %1367, i64*** %ptr_end_op
  br label %end_if_273
end_if_273:
  %1368 = load i64**, i64*** %ptr_gen
  %1369 = call i64** @ir_new_temp(i64** %1368)
  store i64** %1369, i64** %1053
  %1370 = call i8* @malloc(i64 40)
  %1371 = bitcast i8* %1370 to i64*
  %1372 = getelementptr inbounds i64, i64* %1371, i64 0
  store i64 19, i64* %1372
  %1373 = getelementptr inbounds i64, i64* %1371, i64 1
  %1374 = bitcast i64* %1373 to i64***
  store i64** %1053, i64*** %1374
  %1375 = load i64**, i64*** %ptr_str_op
  %1376 = getelementptr inbounds i64, i64* %1371, i64 2
  %1377 = bitcast i64* %1376 to i64***
  store i64** %1375, i64*** %1377
  %1378 = load i64**, i64*** %ptr_start_op
  %1379 = getelementptr inbounds i64, i64* %1371, i64 3
  %1380 = bitcast i64* %1379 to i64***
  store i64** %1378, i64*** %1380
  %1381 = load i64**, i64*** %ptr_end_op
  %1382 = getelementptr inbounds i64, i64* %1371, i64 4
  %1383 = bitcast i64* %1382 to i64***
  store i64** %1381, i64*** %1383
  %1384 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %1384, i64* %1371)
  ret i64** %1053
unreachable_274:
  br label %when_end_0
when_next_269:
  %1385 = icmp eq i64 %14, 13
  br i1 %1385, label %when_case_275, label %when_next_276
when_case_275:
  %1386 = getelementptr inbounds i64, i8* %11, i64 1
  %1387 = bitcast i64* %1386 to i64***
  %1388 = load i64**, i64*** %1387, align 8
  store i64** %1388, i64*** %ptr_s
  %1389 = load i64**, i64*** %ptr_s
  store i64** %1389, i64*** %ptr_s_eq
  %1390 = load i64**, i64*** %ptr_s_eq
  %1391 = bitcast i64** %1390 to i64*
  %1392 = getelementptr inbounds i64, i64* %1391, i64 0
  %1393 = bitcast i64* %1392 to i8**
  %1394 = load i8*, i8** %1393, align 8
  %1395 = load i64**, i64*** %ptr_gen
  %1396 = call i64** @ir_generate_expression(i64** %1395, i8* %1394)
  store i64** %1396, i64*** %ptr_left_op
  %1397 = load i64**, i64*** %ptr_s_eq
  %1398 = bitcast i64** %1397 to i64*
  %1399 = getelementptr inbounds i64, i64* %1398, i64 1
  %1400 = bitcast i64* %1399 to i8**
  %1401 = load i8*, i8** %1400, align 8
  %1402 = load i64**, i64*** %ptr_gen
  %1403 = call i64** @ir_generate_expression(i64** %1402, i8* %1401)
  store i64** %1403, i64*** %ptr_right_op
  %1404 = load i64**, i64*** %ptr_gen
  %1405 = call i64** @ir_new_temp(i64** %1404)
  store i64** %1405, i64** %1053
  %1406 = call i8* @malloc(i64 40)
  %1407 = bitcast i8* %1406 to i64*
  %1408 = getelementptr inbounds i64, i64* %1407, i64 0
  store i64 20, i64* %1408
  %1409 = getelementptr inbounds i64, i64* %1407, i64 1
  %1410 = bitcast i64* %1409 to i64***
  store i64** %1053, i64*** %1410
  %1411 = load i64**, i64*** %ptr_left_op
  %1412 = getelementptr inbounds i64, i64* %1407, i64 2
  %1413 = bitcast i64* %1412 to i64***
  store i64** %1411, i64*** %1413
  %1414 = load i64**, i64*** %ptr_right_op
  %1415 = getelementptr inbounds i64, i64* %1407, i64 3
  %1416 = bitcast i64* %1415 to i64***
  store i64** %1414, i64*** %1416
  %1417 = getelementptr inbounds i64, i64* %1407, i64 4
  %1418 = bitcast i64* %1417 to i1*
  store i1 1, i1* %1418
  %1419 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %1419, i64* %1407)
  ret i64** %1053
unreachable_277:
  br label %when_end_0
when_next_276:
  %1420 = icmp eq i64 %14, 14
  br i1 %1420, label %when_case_278, label %when_next_279
when_case_278:
  %1421 = getelementptr inbounds i64, i8* %11, i64 1
  %1422 = bitcast i64* %1421 to i64***
  %1423 = load i64**, i64*** %1422, align 8
  store i64** %1423, i64*** %ptr_s
  %1424 = load i64**, i64*** %ptr_s
  store i64** %1424, i64*** %ptr_s_eq
  %1425 = load i64**, i64*** %ptr_s_eq
  %1426 = bitcast i64** %1425 to i64*
  %1427 = getelementptr inbounds i64, i64* %1426, i64 0
  %1428 = bitcast i64* %1427 to i8**
  %1429 = load i8*, i8** %1428, align 8
  %1430 = load i64**, i64*** %ptr_gen
  %1431 = call i64** @ir_generate_expression(i64** %1430, i8* %1429)
  store i64** %1431, i64*** %ptr_left_op
  %1432 = load i64**, i64*** %ptr_s_eq
  %1433 = bitcast i64** %1432 to i64*
  %1434 = getelementptr inbounds i64, i64* %1433, i64 1
  %1435 = bitcast i64* %1434 to i8**
  %1436 = load i8*, i8** %1435, align 8
  %1437 = load i64**, i64*** %ptr_gen
  %1438 = call i64** @ir_generate_expression(i64** %1437, i8* %1436)
  store i64** %1438, i64*** %ptr_right_op
  %1439 = load i64**, i64*** %ptr_gen
  %1440 = call i64** @ir_new_temp(i64** %1439)
  store i64** %1440, i64** %1053
  %1441 = call i8* @malloc(i64 40)
  %1442 = bitcast i8* %1441 to i64*
  %1443 = getelementptr inbounds i64, i64* %1442, i64 0
  store i64 20, i64* %1443
  %1444 = getelementptr inbounds i64, i64* %1442, i64 1
  %1445 = bitcast i64* %1444 to i64***
  store i64** %1053, i64*** %1445
  %1446 = load i64**, i64*** %ptr_left_op
  %1447 = getelementptr inbounds i64, i64* %1442, i64 2
  %1448 = bitcast i64* %1447 to i64***
  store i64** %1446, i64*** %1448
  %1449 = load i64**, i64*** %ptr_right_op
  %1450 = getelementptr inbounds i64, i64* %1442, i64 3
  %1451 = bitcast i64* %1450 to i64***
  store i64** %1449, i64*** %1451
  %1452 = getelementptr inbounds i64, i64* %1442, i64 4
  %1453 = bitcast i64* %1452 to i1*
  store i1 0, i1* %1453
  %1454 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %1454, i64* %1442)
  ret i64** %1053
unreachable_280:
  br label %when_end_0
when_next_279:
  %1455 = icmp eq i64 %14, 15
  br i1 %1455, label %when_case_281, label %when_next_282
when_case_281:
  %1456 = getelementptr inbounds i64, i8* %11, i64 1
  %1457 = bitcast i64* %1456 to i64***
  %1458 = load i64**, i64*** %1457, align 8
  store i64** %1458, i64*** %ptr_c
  %1459 = load i64**, i64*** %ptr_c
  store i64** %1459, i64*** %ptr_cast_expr
  %1460 = load i64**, i64*** %ptr_cast_expr
  %1461 = bitcast i64** %1460 to i64*
  %1462 = getelementptr inbounds i64, i64* %1461, i64 0
  %1463 = bitcast i64* %1462 to i8**
  %1464 = load i8*, i8** %1463, align 8
  %1465 = load i64**, i64*** %ptr_gen
  %1466 = call i64** @ir_generate_expression(i64** %1465, i8* %1464)
  store i64** %1466, i64*** %ptr_expr_op
  %1467 = load i64**, i64*** %ptr_gen
  %1468 = call i64** @ir_new_temp(i64** %1467)
  store i64** %1468, i64** %113
  %1469 = load i64**, i64*** %ptr_cast_expr
  %1470 = bitcast i64** %1469 to i64*
  %1471 = getelementptr inbounds i64, i64* %1470, i64 1
  %1472 = bitcast i64* %1471 to i8**
  %1473 = load i8*, i8** %1472, align 8
  %1474 = bitcast i8* %1473 to i64*
  %1475 = getelementptr inbounds i64, i64* %1474, i64 0
  %1476 = bitcast i64* %1475 to i8**
  %1477 = load i8*, i8** %1476, align 8
  %1478 = bitcast i8* %1477 to i64*
  %1479 = getelementptr inbounds i64, i64* %1478, i64 0
  %1480 = bitcast i64* %1479 to i8**
  %1481 = load i8*, i8** %1480, align 8
  %1482 = call i8* @malloc(i64 32)
  %1483 = bitcast i8* %1482 to i64*
  %1484 = getelementptr inbounds i64, i64* %1483, i64 0
  store i64 15, i64* %1484
  %1485 = getelementptr inbounds i64, i64* %1483, i64 1
  %1486 = bitcast i64* %1485 to i64***
  store i64** %113, i64*** %1486
  %1487 = getelementptr inbounds i64, i64* %1483, i64 2
  %1488 = bitcast i64* %1487 to i8**
  store i8* %1481, i8** %1488
  %1489 = load i64**, i64*** %ptr_expr_op
  %1490 = getelementptr inbounds i64, i64* %1483, i64 3
  %1491 = bitcast i64* %1490 to i64***
  store i64** %1489, i64*** %1491
  %1492 = load i64**, i64*** %ptr_gen
  call void @ir_emit(i64** %1492, i64* %1483)
  ret i64** %113
unreachable_283:
  br label %when_end_0
when_next_282:
  br label %when_end_0
when_end_0:
  %1493 = load i64**, i64*** %ptr_ret_op
  ret i64** %1493
unreachable_284:
  ret i64** null
}

define i64* @list_get_StringListMapEntry(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define void @list_set_StringListMapEntry(i64** noalias %param_list, i64 %param_index, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define void @list_push_StringListMapEntry(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define i64* @list_get_StringInnerMapEntry(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define void @list_set_StringInnerMapEntry(i64** noalias %param_list, i64 %param_index, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define void @list_push_StringInnerMapEntry(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define i64* @list_get_StringIntMapEntry(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define void @list_set_StringIntMapEntry(i64** noalias %param_list, i64 %param_index, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define void @list_push_StringIntMapEntry(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define i64* @list_get_StringStringMapEntry(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define i64** @new_list_IRInstruction(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define i64** @new_list_StringListMapEntry(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define i64** @new_list_StringInnerMapEntry(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define i64** @new_list_StringIntMapEntry(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define i64** @new_list_StringStringMapEntry(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define void @list_push_BasicBlock(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define i64** @new_list_String(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define i64* @list_get_Param(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define void @list_push_String(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define i64** @new_list_BasicBlock(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define i64* @list_get_FieldDecl(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define i64* @list_get_VariantDecl(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define i64** @new_list_FlatVectorApplyOp(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define void @list_push_FlatVectorApplyOp(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define i64** @new_list_IROperand(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define i64* @list_get_Spanned_Expression(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define void @list_push_IROperand(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define i64* @list_get_WhenCase(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

define i8* @list_get_String(i64** noalias %param_list, i64 %param_index) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_program = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_cast_expr = alloca i64**
  %ptr_dest_opt = alloca i64**
  %ptr_left = alloca i64**
  %ptr_b_op = alloca i64**
  %ptr_list = alloca i64**
  %ptr_a = alloca i64**
  %ptr_decl = alloca i64*
  %ptr_updated = alloca i64**
  %ptr_t = alloca i8*
  %ptr_s_expr = alloca i64**
  %ptr_ty_opt = alloca i64**
  %ptr_key = alloca i8*
  %ptr_acc = alloca i64**
  %ptr_callee = alloca i64**
  %ptr_map = alloca i64**
  %ptr_param = alloca i64*
  %ptr_left_val = alloca i64**
  %ptr_op = alloca i64**
  %ptr_start_opt = alloca i64**
  %ptr_s1 = alloca i8*
  %ptr_d = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_expr_opt = alloca i64**
  %ptr_p = alloca i64**
  %ptr_span_b = alloca i64**
  %ptr_target_slice_node = alloca i64*
  %ptr_i_val = alloca i64**
  %ptr_expected_tag = alloca i64
  %ptr_s2 = alloca i8*
  %ptr_index = alloca i64
  %ptr_s = alloca i64**
  %ptr_then_label = alloca i8*
  %ptr_case_label = alloca i8*
  %ptr_next_label = alloca i8*
  %ptr_str_op = alloca i64**
  %ptr_array_sizes = alloca i64**
  %ptr_cond = alloca i64**
  %ptr_span_if = alloca i64**
  %ptr_data_structs = alloca i64**
  %ptr_end_expr_opt = alloca i64**
  %ptr_s_eq = alloca i64**
  %ptr_new_capacity = alloca i64
  %ptr_message = alloca i8*
  %ptr_c = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_tag_temp = alloca i64**
  %ptr_body_label = alloca i8*
  %ptr_cur_fn_opt = alloca i64**
  %ptr_final_val = alloca i64**
  %ptr_end_op = alloca i64**
  %ptr_arg_op = alloca i64**
  %ptr_s_idx = alloca i64**
  %ptr_arg_ptr = alloca i64**
  %ptr_dummy_str = alloca i8**
  %ptr_inner_opt = alloca i64**
  %ptr_rhs_slice_target_node = alloca i64*
  %ptr_end_label = alloca i8*
  %ptr_set_term = alloca i1
  %ptr_scalar_val = alloca i64**
  %ptr_sz_opt = alloca i64
  %ptr_rhs_is_vector = alloca i1
  %ptr_start_op = alloca i64**
  %ptr_fall_assign_target_node = alloca i64*
  %ptr_right = alloca i64**
  %ptr_arg = alloca i64*
  %ptr_target_op = alloca i64**
  %ptr_b_idx = alloca i64
  %ptr_cond_label = alloca i8*
  %ptr_span = alloca i64**
  %ptr_block = alloca i64**
  %ptr_args_list = alloca i64**
  %ptr_source = alloca i8*
  %ptr_fields_opt = alloca i64**
  %ptr_else_label = alloca i8*
  %ptr_right_val = alloca i64**
  %ptr_start_line = alloca i64
  %ptr_s_slice = alloca i64**
  %ptr_stmt = alloca i64*
  %ptr_void_op = alloca i64**
  %ptr_gen = alloca i64**
  %ptr_left_op = alloca i64**
  %ptr_dummy_entry = alloca i64**
  %ptr_tag_val = alloca i64
  %ptr_cur_fn = alloca i64**
  %ptr_params_list = alloca i64**
  %ptr_sz = alloca i64
  %ptr_prop_access_obj_node = alloca i64*
  %ptr_err = alloca i64**
  %ptr_idx_op = alloca i64**
  %ptr_prop_obj_node = alloca i64*
  %ptr_map_i = alloca i64
  %ptr_ret_op = alloca i64**
  %ptr_dummy_instr = alloca i64**
  %ptr_rhs_arr = alloca i8*
  %ptr_target_node = alloca i64*
  %ptr_l = alloca i64**
  %ptr_u = alloca i64**
  %ptr_rhs_prop_name = alloca i8*
  %ptr_al = alloca i64**
  %ptr_st = alloca i64**
  %ptr_value = alloca i64
  %ptr_blk_opt = alloca i64**
  %ptr_vec_expr = alloca i64**
  %ptr_instr = alloca i64*
  %ptr_capacity = alloca i64
  %ptr_var_expr = alloca i64**
  %ptr_cmp_res = alloca i64**
  %ptr_right_op = alloca i64**
  %ptr_rhs_prop_obj_node = alloca i64*
  %ptr_offset = alloca i64
  %ptr_span_decl = alloca i64*
  %ptr_obj_val = alloca i64**
  %ptr_val_label = alloca i8*
  %ptr_has_term = alloca i1
  %ptr_handled_special = alloca i1
  %ptr_idx_target_node = alloca i64*
  %ptr_ty = alloca i64**
  %ptr_term = alloca i64*
  %ptr_fn_opt = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_choice_tags = alloca i64**
  %ptr_when_expr = alloca i64**
  %ptr_tag_map = alloca i64**
  %ptr_j = alloca i64
  %ptr_field = alloca i64*
  %ptr_ty_name = alloca i8*
  %ptr_variant = alloca i64*
  %ptr_stmt_ptr = alloca i64**
  %ptr_apply_op = alloca i64**
  %ptr_else_opt = alloca i64**
  %ptr_tag_opt = alloca i64
  %ptr_blk = alloca i64**
  %ptr_ret = alloca i64
  %ptr_prefix = alloca i8*
  %ptr_size = alloca i64
  %ptr_start_expr_opt = alloca i64**
  %ptr_case_node = alloca i64*
  %ptr_name = alloca i8*
  %ptr_item = alloca i64*
  %ptr_b = alloca i64**
  %ptr_inner_map = alloca i64**
  %ptr_b_name = alloca i8*
  %ptr_bind_op = alloca i64**
  %ptr_e_expr = alloca i64**
  %ptr_dummy_slme = alloca i64**
  %ptr_assign_val_node = alloca i64*
  %ptr_ptr = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_obj = alloca i64**
  %ptr_expr_op = alloca i64**
  %ptr_entry = alloca i64*
  %ptr_ptr_op = alloca i64**
  %ptr_e = alloca i64**
  %ptr_op_name = alloca i64*
  %ptr_lit_op = alloca i64**
  %ptr_ret_val = alloca i64**
  %ptr_fields_list = alloca i64**
  %ptr_ptr_val = alloca i64**
  %ptr_dest_temp = alloca i64**
  %ptr_ops_list = alloca i64**
  %ptr_else_br = alloca i64**
  %ptr_r = alloca i64**
  %ptr_none_label = alloca i8*
  %ptr_index_expr_node = alloca i64*
  %ptr_val_opt = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_val = alloca i64**
  %ptr_end_opt = alloca i64**
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

