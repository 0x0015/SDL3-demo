default rel

%macro print 2
	mov rax, 1 ;write syscall
	mov rdi, 1 ;file handel 1 = stdout
	mov rsi, %1
	mov rdx, %2 ;message length
	syscall
%endmacro

