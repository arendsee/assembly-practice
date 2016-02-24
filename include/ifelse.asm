%include "global_macros.i"

section	.data

v db 61h,62h,63h,64h,65h ;abcde
newline db 0xa

section	.text
   global _start

_start:

slice v, 0h, 1h
linebreak
slice v, 3h, 2h
linebreak
slice v, 5h, 1h
slice v, 0h, 6h

mov eax, SYS_EXIT
int 0x80
