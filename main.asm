section .data
message: db "Hello World!",10, 0

global _start

	section .text

_start:
	mov rax, 1 ;write syscall
	mov rdi, 1 ;file handel 1 = stdout
	mov rsi, message
	mov rdx, 13 ;message length
	syscall

	mov rax, 60 ;syscall for exit
	xor rdi, rdi
	syscall
