%include "global_macros.i"

section	.data

newline db 0xa

true  db 'T'
false db 'F'

section	.text
   global _start

_start:

mov ecx, 1
mov edx, 2
cmp ecx, edx
je .if
jmp .else
.if:
    print_byte true
    jmp .fi
.else:
    print_byte false
.fi:

print_byte newline

exit
