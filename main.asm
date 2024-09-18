default rel

global _start
extern SDL_Init
extern SDL_CreateWindow
extern SDL_CreateRenderer
extern SDL_PollEvent
extern SDL_SetRenderDrawColor
extern SDL_RenderClear
extern SDL_RenderRect
extern SDL_RenderPresent
extern SDL_DestroyRenderer
extern SDL_DestroyWindow
extern SDL_Quit

section .data
;strings
initFailMessage db "Failed to init SDL3 video", 10, 0
initFailMessageLen equ $ -initFailMessage
windowFailMessage db "Failed to create SDL3 window", 10, 0
windowFailMessageLen equ $ -windowFailMessage
rendererFailMessage db "Failed to create SDL3 renderer", 10, 0
rendererFailMessageLen equ $ -rendererFailMessage
windowTitle db "SDL3 demo window", 0
windowTitleLen equ $ -windowTitle
startMessage db "Starting demo!", 10, 0
startMessageLen equ $ -startMessage
;datastructs
resolutionX dq 720
resolutionY dq 480
windowPtr dq 0
rendererPtr dq 0

section .bss
event resb 128

section .text
_start:
	mov rax, 1 ;write syscall
	mov rdi, 1 ;file handel 1 = stdout
	mov rsi, startMessage
	mov rdx, startMessageLen
	syscall

	mov rdi, 0x20 ;sdl init video
	call SDL_Init wrt ..plt
	cmp rax, 0
	je initFailed

	mov rdi, windowTitle
	mov rsi, [resolutionX]
	mov rdx, [resolutionY]
	xor rcx, rcx
	call SDL_CreateWindow wrt ..plt
	cmp rax, 0
	je windowCreateFailed
	mov [windowPtr], rax
	
	mov rdi, rax
	xor rsi, rsi
	call SDL_CreateRenderer wrt ..plt
	cmp rax, 0
	je rendererCreateFailed
	mov [rendererPtr], rax

mainLoop:
	mov rdi, event
pollEventLoop:
	call SDL_PollEvent wrt ..plt
	mov esi, [event]
	cmp esi, 0x100; quit event type
	je cleanup
	cmp rax, 0 ;check if the event poll returned false -> no more events to poll
	jne pollEventLoop

	mov rdi, [rendererPtr]
	call SDL_RenderClear wrt ..plt

	mov rdi, [rendererPtr]
	call SDL_RenderPresent wrt ..plt

	jmp mainLoop

cleanup:
	mov rdi, [rendererPtr]
	call SDL_DestroyRenderer wrt ..plt
	mov rdi, [windowPtr]
	call SDL_DestroyWindow wrt ..plt
	call SDL_Quit wrt ..plt

	mov rax, 60 ;exit syscall
	xor rdi, rdi ;exit code 0
	syscall

initFailed:
	mov rax, 1
	mov rdi, 1
	mov rsi, initFailMessage
	mov rdx, initFailMessageLen
	syscall
	mov rax, 60
	mov rdi, 1
	syscall

windowCreateFailed:
	mov rax, 1
	mov rdi, 1
	mov rsi, windowFailMessage
	mov rdx, windowFailMessageLen
	syscall
	mov rax, 60
	mov rdi, 1
	syscall

rendererCreateFailed:
	mov rax, 1
	mov rdi, 1
	mov rsi, rendererFailMessage
	mov rdx, rendererFailMessageLen
	syscall
	mov rax, 60
	mov rdi, 1
	syscall
