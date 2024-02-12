section .text
global strstr

; strstr: returns the first occurrence of the substring rsi in the string rdi
; Input: rdi - the string
;        rsi - the substring to search for
; Output: rax - pointer to the first occurrence of the substring in the string, or NULL if the substring is not found
strstr:
    xor rax, rax
    jmp special_case

special_case:
    mov r8b, byte [rdi]
    cmp byte [rsi], r8b
    jne strstr_loop
    cmp r8b, 0
    je return_ptr

strstr_loop:
    xor rcx, rcx
    cmp byte [rdi + rax], 0
    je return_null
    jmp check_loop

check_loop:
    cmp byte [rsi + rcx], 0
    je return_ptr
    mov r8, rcx
    add r8, rax
    cmp byte [rdi + r8], 0
    je return_null
    movzx rdx, byte [rsi + rcx]
    cmp byte [rdi + r8], dl
    jne increment
    inc rcx
    jmp check_loop

increment:
    inc rax
    jmp strstr_loop

return_null:
    xor rax, rax
    ret

return_ptr:
    lea rax, [rdi + rax]
    ret
