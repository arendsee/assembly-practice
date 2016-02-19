; This is a hello world program adapted from TutorialPoint

; the relative positions of the sections doesn't matter, they both produce
; identical code

; initialize variables
section	.data
msg db 'Hey', 0xa  ;initialize the msg variable
len equ $ - msg    ;initialize the len variable

; program code
section	.text
   global_start   ;required in all programs, must be declared for linker (ld)

_start:	          ;tells linker entry point

;OPCODE REGISTER, VAR
; executable instructions
; each opcode runs one machine code


; 3 arguments for write system call, in C: write(1, msg, len);
; The order of these declarations don't matter
; The registers just must be loaded before the kernel call
; ARGV 0, function name
   mov	eax,4     ;system call number (sys_write)
; ARGV 1
   mov	ebx,1     ;file descriptor (stdout)
; ARGV 2
   mov	ecx,msg   ;message to write
; ARGV 3
   mov	edx,len   ;message length, variables declared in .data section
; execute whatever is in eax
   int	0x80      ;call kernel
	
; set eax to a new command (sys_exit)
   mov	eax,1     ;system call number (sys_exit)
   int	0x80      ;call kernel
