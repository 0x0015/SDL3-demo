	.file	"sdl3.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC2:
	.string	"Failed to init SDL3 Video: %s\n"
.LC3:
	.string	"springSim Window"
	.align 8
.LC4:
	.string	"Failed to create SDL3 Window: %s\n"
	.align 8
.LC5:
	.string	"Failed to create SDL3 Renderer: %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB21:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 208
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	BYTE PTR -197[rbp], 1
	movss	xmm0, DWORD PTR .LC0[rip]
	movss	DWORD PTR -168[rbp], xmm0
	movss	xmm0, DWORD PTR .LC1[rip]
	movss	DWORD PTR -164[rbp], xmm0
	mov	edi, 32
	call	SDL_Init@PLT
	xor	eax, 1
	test	al, al
	je	.L2
	call	SDL_GetError@PLT
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, -1
	jmp	.L15
.L2:
	movss	xmm0, DWORD PTR -164[rbp]
	cvttss2si	edx, xmm0
	movss	xmm0, DWORD PTR -168[rbp]
	cvttss2si	eax, xmm0
	mov	ecx, 0
	mov	esi, eax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	SDL_CreateWindow@PLT
	mov	QWORD PTR -184[rbp], rax
	cmp	QWORD PTR -184[rbp], 0
	jne	.L4
	call	SDL_GetError@PLT
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, -1
	jmp	.L15
.L4:
	mov	rax, QWORD PTR -184[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	SDL_CreateRenderer@PLT
	mov	QWORD PTR -176[rbp], rax
	cmp	QWORD PTR -176[rbp], 0
	jne	.L5
	call	SDL_GetError@PLT
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, -1
	jmp	.L15
.L5:
	call	SDL_GetTicks@PLT
	test	rax, rax
	js	.L6
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, rax
	jmp	.L7
.L6:
	mov	rdx, rax
	shr	rdx
	and	eax, 1
	or	rdx, rax
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, rdx
	addss	xmm0, xmm0
.L7:
	movss	xmm1, DWORD PTR .LC6[rip]
	divss	xmm0, xmm1
	movss	DWORD PTR -196[rbp], xmm0
	jmp	.L8
.L11:
	mov	eax, DWORD PTR -144[rbp]
	cmp	eax, 256
	jne	.L10
	mov	BYTE PTR -197[rbp], 0
.L10:
	mov	eax, DWORD PTR -144[rbp]
	cmp	eax, 768
	jne	.L9
	mov	eax, DWORD PTR -116[rbp]
	cmp	eax, 27
	jne	.L9
	mov	BYTE PTR -197[rbp], 0
.L9:
	lea	rax, -144[rbp]
	mov	rdi, rax
	call	SDL_PollEvent@PLT
	test	al, al
	jne	.L11
	call	SDL_GetTicks@PLT
	test	rax, rax
	js	.L12
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, rax
	jmp	.L13
.L12:
	mov	rdx, rax
	shr	rdx
	and	eax, 1
	or	rdx, rax
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, rdx
	addss	xmm0, xmm0
.L13:
	movss	xmm1, DWORD PTR .LC6[rip]
	divss	xmm0, xmm1
	movss	DWORD PTR -192[rbp], xmm0
	movss	xmm0, DWORD PTR -192[rbp]
	subss	xmm0, DWORD PTR -196[rbp]
	movss	DWORD PTR -188[rbp], xmm0
	movss	xmm0, DWORD PTR -192[rbp]
	movss	DWORD PTR -196[rbp], xmm0
	mov	rax, QWORD PTR -176[rbp]
	movss	xmm3, DWORD PTR .LC7[rip]
	pxor	xmm2, xmm2
	pxor	xmm1, xmm1
	mov	edx, DWORD PTR .LC8[rip]
	movd	xmm0, edx
	mov	rdi, rax
	call	SDL_SetRenderDrawColorFloat@PLT
	mov	rax, QWORD PTR -176[rbp]
	mov	rdi, rax
	call	SDL_RenderClear@PLT
	mov	rax, QWORD PTR -176[rbp]
	movss	xmm3, DWORD PTR .LC7[rip]
	pxor	xmm2, xmm2
	pxor	xmm1, xmm1
	mov	edx, DWORD PTR .LC7[rip]
	movd	xmm0, edx
	mov	rdi, rax
	call	SDL_SetRenderDrawColorFloat@PLT
	pxor	xmm0, xmm0
	movss	DWORD PTR -160[rbp], xmm0
	pxor	xmm0, xmm0
	movss	DWORD PTR -156[rbp], xmm0
	movss	xmm0, DWORD PTR .LC9[rip]
	movss	DWORD PTR -152[rbp], xmm0
	movss	xmm0, DWORD PTR .LC9[rip]
	movss	DWORD PTR -148[rbp], xmm0
	lea	rdx, -160[rbp]
	mov	rax, QWORD PTR -176[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	SDL_RenderRect@PLT
	mov	rax, QWORD PTR -176[rbp]
	mov	rdi, rax
	call	SDL_RenderPresent@PLT
.L8:
	cmp	BYTE PTR -197[rbp], 0
	jne	.L9
	mov	rax, QWORD PTR -176[rbp]
	mov	rdi, rax
	call	SDL_DestroyRenderer@PLT
	mov	rax, QWORD PTR -184[rbp]
	mov	rdi, rax
	call	SDL_DestroyWindow@PLT
	call	SDL_Quit@PLT
	mov	eax, 0
.L15:
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1144258560
	.align 4
.LC1:
	.long	1139802112
	.align 4
.LC6:
	.long	1148846080
	.align 4
.LC7:
	.long	1065353216
	.align 4
.LC8:
	.long	0
	.align 4
.LC9:
	.long	1120403456
	.ident	"GCC: (GNU) 14.2.1 20240805"
	.section	.note.GNU-stack,"",@progbits
