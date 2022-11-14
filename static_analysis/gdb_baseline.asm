	.text
	.intel_syntax noprefix
	.file	"gdb_baseline.cpp"
	.section	.text.startup,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function __cxx_global_var_init
	.type	__cxx_global_var_init,@function
__cxx_global_var_init:                  # @__cxx_global_var_init
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	lea	rdi, [rip + _ZStL8__ioinit]
	call	_ZNSt8ios_base4InitC1Ev@PLT
	mov	rdi, qword ptr [rip + _ZNSt8ios_base4InitD1Ev@GOTPCREL]
	lea	rsi, [rip + _ZStL8__ioinit]
	lea	rdx, [rip + __dso_handle]
	call	__cxa_atexit@PLT
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	__cxx_global_var_init, .Lfunc_end0-__cxx_global_var_init
	.cfi_endproc
                                        # -- End function
	.text
	.globl	_Z3logv                         # -- Begin function _Z3logv
	.p2align	4, 0x90
	.type	_Z3logv,@function
_Z3logv:                                # @_Z3logv
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	#APP
	# LLVM-MCA-BEGIN log
	#NO_APP
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end1:
	.size	_Z3logv, .Lfunc_end1-_Z3logv
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	dword ptr [rbp - 4], edi
	mov	qword ptr [rbp - 16], rsi
	call	_Z3logv
	xor	eax, eax
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.section	.text.startup,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function _GLOBAL__sub_I_gdb_baseline.cpp
	.type	_GLOBAL__sub_I_gdb_baseline.cpp,@function
_GLOBAL__sub_I_gdb_baseline.cpp:        # @_GLOBAL__sub_I_gdb_baseline.cpp
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	call	__cxx_global_var_init
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end3:
	.size	_GLOBAL__sub_I_gdb_baseline.cpp, .Lfunc_end3-_GLOBAL__sub_I_gdb_baseline.cpp
	.cfi_endproc
                                        # -- End function
	.type	_ZStL8__ioinit,@object          # @_ZStL8__ioinit
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.section	.init_array,"aw",@init_array
	.p2align	3
	.quad	_GLOBAL__sub_I_gdb_baseline.cpp
	.ident	"Ubuntu clang version 14.0.0-1ubuntu1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __cxx_global_var_init
	.addrsig_sym __cxa_atexit
	.addrsig_sym _Z3logv
	.addrsig_sym _GLOBAL__sub_I_gdb_baseline.cpp
	.addrsig_sym _ZStL8__ioinit
	.addrsig_sym __dso_handle
