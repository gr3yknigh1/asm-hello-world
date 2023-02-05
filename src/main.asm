
section .text
    global _start

_start:  ; tells linker entry point
    mov edx, MESSAGE_LEN  ; message length
    mov ecx, message  ; message to write
    mov ebx, 1  ; file descriptor (stdout)
    mov eax, 4  ; system call number (sys_write)
    int 0x80  ; call kernel
    mov eax, 1  ; system call number (sys_exit)
    mov ebx, 0  ; return value
    int 0x80   ; call kernel
    ret

section .data
    message db 'Hello, world!', 0

    MESSAGE_LEN equ $ - message

