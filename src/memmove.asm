section .text
global memmove

; memmove: copies n bytes from memory area src to memory area dest
; Input: rdi - the pointer to the destination memory block
;        rsi - the pointer to the source memory block
;        rdx - the number of bytes to copy
; Output: rax - the pointer to the destination memory block
memmove:
    mov rax, rdi
    xor rcx, rcx
    cmp rdi, rsi
    jge .memmove_loop_inverse
    jmp .memmove_loop

.memmove_loop:
    cmp rcx, rdx
    je end
    mov al, byte [rsi + rcx]
    mov byte [rdi + rcx], al
    inc rcx
    jmp .memmove_loop

.memmove_loop_inverse:
    cmp rdx, 0
    je end
    mov al, byte [rsi + rdx - 1]
    mov byte [rdi + rdx - 1], al
    dec rdx
    jmp .memmove_loop_inverse

end:
    ret
