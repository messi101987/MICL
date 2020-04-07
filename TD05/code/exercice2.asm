; 01_open_exercice.asm

global    main

section .rodata
    nomFichier      DB      `fichierEx2`, 0   ; ne pas oublier le 0
    msgErreur       DB      `échec lors de l’ouverture du fichier \n`
    lgrMsgErreur    DQ      lgrMsgErreur - msgErreur
    msgReussite     DB      `fichier ouvert avec succès \n`
    lgrMsgReussite  DQ      lgrMsgReussite - msgReussite

section .text
main:
    ; ouverture de fichierEx2 en écriture seule avec placement
    ; de la tête d'écriture en fin de fichier
    mov     rax, 2          ; open
    mov     rdi, nomFichier ; /adresse/ du 1er caractère du noms
    mov     rsi, 1q | 2000q ; WRONLY + O_APPEND
    syscall
    cmp     rax, 3
    jz reussite

echec:
    mov     rax, 1          ;write
    mov     rdi, 1          ; stdout, sortie standard
    mov     rsi, msgErreur  ;adresse du 1er caractere
    mov     rdx, [lgrMsgErreur] ;nombre de car
    syscall
    mov     rax, 1
    jmp fin

reussite:
    mov     rax, 1          ;write
    mov     rdi, 1          ; stdout, sortie standard
    mov     rsi, msgReussite  ;adresse du 1er caractere
    mov     rdx, [lgrMsgReussite] ;nombre de car
    syscall
    mov     rax, 3         ; close
    mov     rdi, nomFichier ; /adresse/ du 1er caractère du noms
    syscall
    mov     rax, 0


fin:

    mov     rax, 60
    mov     rdi,0
    syscall
