	.file	"test_methods.ll"
	.text
	.globl	accelerar                       # -- Begin function accelerar
	.p2align	4
	.type	accelerar,@function
accelerar:                              # @accelerar
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -16(%rsp)
	movq	$500, (%rdi)                    # imm = 0x1F4
	retq
.Lfunc_end0:
	.size	accelerar, .Lfunc_end0-accelerar
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movl	$8000, %edi                     # imm = 0x1F40
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	accelerar@PLT
	movq	(%rbx), %rdi
	callq	print_int@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	xorl	%eax, %eax
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.globl	print_string                    # -- Begin function print_string
	.p2align	4
	.type	print_string,@function
print_string:                           # @print_string
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, (%rsp)
	callq	puts@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	print_string, .Lfunc_end2-print_string
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
