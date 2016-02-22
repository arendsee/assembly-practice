TARGET=mem

${TARGET}: ${TARGET}.o
	ld -m elf_i386 -s -o ${TARGET} ${TARGET}.o

${TARGET}.o: ${TARGET}.asm
	nasm -f elf ${TARGET}.asm

clean:
	rm -f ${TARGET} ${TARGET}.o
