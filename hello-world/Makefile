TARGET=hw

hw:
	nasm -g -f elf -F dwarf -l ${TARGET}.lst ${TARGET}.asm
	ld -m elf_i386 -o ${TARGET} ${TARGET}.o

clean:
	rm -f ${TARGET} ${TARGET}.o ${TARGET}.lst
