section .text
global strlen

; strlen: returns the length of a string
; Input: rdi - the string
; Output: rax - the return value
strlen:
    xor rax, rax
    .strlen_loop:
        cmp byte [rdi + rax], 0
        je .strlen_ret
        inc rax
        jmp .strlen_loop
    .strlen_ret:
        ret
