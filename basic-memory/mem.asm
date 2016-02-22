%define SYS_EXIT  1
%define SYS_WRITE 4

%define STDOUT    1

section	.data

x db 31h
newline db 0xa

section	.text
   global _start

_start:

mov eax, SYS_WRITE
mov ebx, STDOUT
mov ecx, x
mov edx, 1
int 0x80

mov eax, SYS_WRITE
mov ebx, STDOUT
mov ecx, newline
; NOTE: this doesn't work, since 0xa is interpreted as an address
; mov ecx, 0xa
mov edx, 1
int 0x80

mov eax, SYS_EXIT
int 0x80
