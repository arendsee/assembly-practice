%include "global_macros.i"

section	.text
   global _start
_start:

mov eax, 0
.while:
cmp eax, 10
je .done
push eax
print_byte '.'
pop eax
add eax, 1
jmp .while
.done:

exit
