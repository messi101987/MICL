; 01_open_exercice.asm

global    main

section .text
main:
    mov     rsi, 0110101b

    mov     rax, 1          ;write
    mov     rdi, 1          ; stdout, sortie standard
    mov     rdx, 1           ;nombre de car
    syscall

    mov     rax, 60
    mov     rdi,0
    syscall

;fonctionne pas