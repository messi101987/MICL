; 01_open_exercice.asm

global    main

section .rodata
    msgPair         DB      `rcx est pair \n`
    lgrMsgPair      DQ       lgrMsgPair - msgPair
    msgImpair       DB      `rcx est impair \n`
    lgrMsgImpair      DQ     lgrMsgImpair - msgImpair

section .text
main:
    mov     rcx, 0111110b
    bt     rcx, 0
    jc impair

pair:
    mov     rax, 1          ;write
    mov     rdi, 1          ; stdout, sortie standard
    mov     rsi, msgPair  ;adresse du 1er caractere
    mov     rdx, [lgrMsgPair] ;nombre de car
    syscall
    jmp fin

impair:
    mov     rax, 1          ;write
    mov     rdi, 1          ; stdout, sortie standard
    mov     rsi, msgImpair  ;adresse du 1er caractere
    mov     rdx, [lgrMsgImpair] ;nombre de car
    syscall

fin:

    mov     rax, 60
    mov     rdi,0
    syscall
