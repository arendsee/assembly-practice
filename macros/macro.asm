%define SYS_EXIT  1
%define SYS_WRITE 4

%define STDOUT    1

%macro linebreak 0
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, newline
    mov edx, 1
    int 0x80
%endmacro

%macro slice 3
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, %1 ; array variable name
    add ecx, %2 ; index
    mov edx, %3 ; number of elements to print
    int 0x80
%endmacro

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
slice v, 5h, 1h ; NOTE: this overflows, writes \n symbol, newline
slice v, 0h, 6h ; again, I cheat by grabbing the newline symbol

mov eax, SYS_EXIT
int 0x80
