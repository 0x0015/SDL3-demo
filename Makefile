all:
	nasm -felf64 main.asm -o main.o
	ld main.o -o main

clean:
	rm -f main.o main
