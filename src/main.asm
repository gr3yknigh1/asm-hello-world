section .data
    digit db 9, 10

section .rodata

    message dw 'Hello, world!', 10
    MESSAGE_LEN equ $ - message

    FD_STDIN dd 0x00
    FD_STDOUT dd 0x01
    FD_STDERR dd 0x02

    SYS_WRITE dd 1
    SYS_EXIT dd 60

    ASCII_0 dd 48

section .text
    global _start

print_digit:
    add rax, ASCII_0
    mov [digit], al

    mov rax, [SYS_WRITE]
    mov rdi, [FD_STDOUT]
    mov rsi, digit 
    mov rdx, 2 
    syscall
    ret

_start:
    ; Printing 'Hello world!\n'
    mov rax, [SYS_WRITE]
    mov rdi, [FD_STDOUT]
    mov rsi, message
    mov rdx, MESSAGE_LEN
    syscall

    call print_digit

    ; Exiting
    mov rax, [SYS_EXIT]
    xor rdi, rdi
    syscall

