; a basic hello world program

; macros can be defined just like in C
; unlike symbols, they can be redefined and hold arbitrary entities
; system calls are numbered
%define SYS_EXIT  1
%define SYS_WRITE 4

; the file descriptors are numbered as expected
%define STDOUT 1

; the relative positions of the sections doesn't matter, they both produce
; identical code

; initialize variables
section	.data
msg db 'Hello', 0xa  ;initialize the msg variable

; equ is a directive that indicates the declaration of a constant (symbol).
len equ $ - msg    ;initialize the len variable

; program code
section	.text
   global _start   ;required in all programs, must be declared for linker (ld)

_start:	          ;tells linker entry point

;OPCODE REGISTER, VAR
; executable instructions
; each opcode runs one machine code


; 3 arguments for write system call, in C: write(1, msg, len);
; The order of these declarations don't matter
; The registers just must be loaded before the kernel call
; ARGV 0, function name
   mov	eax, SYS_WRITE
; ARGV 1
   mov	ebx, STDOUT ;file descriptor (stdout)
; ARGV 2
   mov	ecx, msg ;message to write
; ARGV 3
   mov	edx, len ;message length, variables declared in .data section
; execute whatever is in eax
   int	0x80 ;call kernel
	
; set eax to a new command (sys_exit)
   mov	eax, SYS_EXIT
   int	0x80 ;call kernel
