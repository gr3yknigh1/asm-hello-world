default rel

section .rodata
    message db 'Hello, world!', 10
    MESSAGE_LEN equ $ - message

section .text
    global _start

print_message:
    mov edx, MESSAGE_LEN  ; message length
    mov ecx, message  ; message to write
    mov eax, 4  ; system call number (sys_write)
    mov ebx, 1  ; file descriptor (stdout)
    int 0x80  ; call kernel
    ret

_start:
    call print_message
    call _exit

_exit:
    ; mov eax, 1  ; system call number (sys_exit)
    ; mov ebx, 0  ; return value
    ; int 0x80   ; call kernel
    mov eax, 60  ; __NR_exit call number (x86_64)
    xor edi, edi ; status = 0 (exit normally)
    syscall      ; _exit(0)

