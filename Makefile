all:
	nasm -g -felf64 main.asm -o main.o
	ld -g -I /lib64/ld-linux-x86-64.so.2 -o main main.o -lSDL3

c_comparison:
	gcc -g main_c.c -o main_c -lSDL3
clean:
	rm -f main.o main main_c
