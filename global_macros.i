%define SYS_EXIT    1
%define SYS_FORK    2
%define SYS_READ    3 ; read(unsigned int FILE_DESCRIPTOR, char * STR, size_t size)
%define SYS_WRITE   4 ; write(unsigned int FILE_DESCRIPTOR, char * STR, size_t size)
%define SYS_OPEN    5 ; open(char * filename, int oflag, int mode)
%define SYS_CLOSE   6 ; close(int FILE_DESCRIPTOR)

%define STDIN       0
%define STDOUT      1
%define STDERR      2

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
