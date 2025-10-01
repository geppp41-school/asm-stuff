section .data
    num1 db "1", 0x0a
    len1 equ $ - num1
    num0 db "0", 0x0a
    len0 equ $ - num0

section	.text
   global _start 

_start:
    mov ah, 0x1
    int 0x16
    
    mov eax, '0'
    mov ebx, 10
    mov [count], eax
    mov [target], ebx
    jmp loop

loop:
    mov eax, [count]
    sub eax, '0'
    cmp eax, [target]
    je zero
    inc eax
    add eax, '0'
    mov [count], eax


    ; mov eax, 4
    ; mov ebx, 1
    ; mov ecx, count
    ; mov edx, 16
    ; int 80h
    call one

    jmp loop
    


one:
    mov eax, 4
    mov ebx, 1
    mov ecx, num1
    mov edx, len1
    int 80h
    ret

zero:
    mov eax, 4
    mov ebx, 1
    mov ecx, num0
    mov edx, len0
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h

section .bss 
    count resb 16
    target resb 16