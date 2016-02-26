TARGET=whileloop

${TARGET}: ${TARGET}.asm
	nasm  -i../ -f elf ${TARGET}.asm
	ld -m elf_i386 -s -o ${TARGET} ${TARGET}.o

clean:
	rm -f ${TARGET} ${TARGET}.o
