section .text
global strchr

; strchr: returns the first occurrence of c in the string s
; Input: rdi - the string
;        rsi - the character to search for
; Output: rax - the return value
strchr:
    xor rax, rax
    jmp strchr_loop

strchr_loop:
    cmp byte [rdi + rax], 0
    je return_null
    cmp byte [rdi + rax], sil
    jne increment
    jmp return_ptr

increment:
    inc rax
    jmp strchr_loop

return_null:
    xor rax, rax
    ret

return_ptr:
    lea rax, [rdi + rax]
    ret
