section .text
global index

; index: returns the first occurrence of c in the string s
; Input: rdi - the string
;        rsi - the character to search for
; Output: rax - the return value
index:
    xor rax, rax
    jmp index_loop

index_loop:
    cmp byte [rdi + rax], 0
    je special_case
    cmp byte [rdi + rax], sil
    jne increment
    jmp return_ptr

increment:
    inc rax
    jmp index_loop

special_case:
    cmp sil, 0
    je return_ptr
    jmp return_null

return_null:
    xor rax, rax
    ret

return_ptr:
    lea rax, [rdi + rax]
    ret
