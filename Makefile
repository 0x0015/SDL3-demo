all:
	nasm -g -felf64 main.asm -o main.o
	ld -I /lib64/ld-linux-x86-64.so.2 -o main main.o -lSDL3
clean:
	rm -f main.o main
