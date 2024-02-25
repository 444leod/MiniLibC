section .text
global rindex

; rindex: returns the last occurrence of c in the string s
; Input: rdi - the string
;        rsi - the character to search for
; Output: rax - the return value
rindex:
    xor rax, rax
    jmp get_strlen

get_strlen:
    cmp byte [rdi + rax], 0
    je start_rindex_loop
    inc rax
    jmp get_strlen

start_rindex_loop:
    cmp sil, 0
    je return_ptr
    dec rax
    jmp rindex_loop

rindex_loop:
    cmp rax, 0
    jl return_null
    cmp byte [rdi + rax], sil
    jne decrease
    jmp return_ptr

decrease:
    dec rax
    jmp rindex_loop

return_null:
    xor rax, rax
    ret

return_ptr:
    lea rax, [rdi + rax]
    ret
