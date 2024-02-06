section .text
global strpbrk

; strpbrk: returns the first occurrence of any of characters in rsi in the string rdi
; Input: rdi - the string
;        rsi - the characters to search for
; Output: rax - the return value
strpbrk:
    xor rax, rax
    jmp strpbrk_loop

strpbrk_loop:
    xor rcx, rcx
    cmp byte [rdi + rax], 0
    je return_null
    jmp check_loop

check_loop:
    cmp byte [rsi + rcx], 0
    je increment
    movzx rdx, byte [rsi + rcx]
    cmp byte [rdi + rax], dl
    je return_ptr
    inc rcx
    jmp check_loop

increment:
    inc rax
    jmp strpbrk_loop

return_null:
    xor rax, rax
    ret

return_ptr:
    lea rax, [rdi + rax]
    ret

section .data
    len db 0
