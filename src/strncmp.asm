section .text
global strncmp

; strncmp: compare two strings and return their different
; Input: rdi - the first string
;        rsi - the second string
;        rdx - the maximum number of characters to compare
; Output: rax - the difference between the two strings
strncmp:
    xor rax, rax
    xor rcx, rcx
    push rbx

.strncmp_loop:
    cmp rcx, rdx
    je return_zero
    mov al, [rdi + rcx]
    mov bl, [rsi + rcx]
    cmp al, 0
    je verify_end
    cmp bl, 0
    je verify_end
    cmp al, bl
    je .increase
    jne verify_end

.increase:
    inc rcx
    jmp .strncmp_loop

verify_end:
    movzx eax, byte [rdi + rcx]
    movzx ebx, byte [rsi + rcx]
    sub eax, ebx
    movsx rax, eax
    jmp end

return_zero:
    mov rax, 0
    jmp end

end:
    pop rbx
    ret
