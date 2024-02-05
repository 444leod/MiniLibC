section .text
global strcmp

; strcmp: compare two strings and return their different
; Input: rdi - the first string
;        rsi - the second string
; Output: rax - the difference between the two strings
strcmp:
    xor rax, rax
    xor rcx, rcx

.strcmp_loop:
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
    jmp .strcmp_loop

verify_end:
    movzx eax, byte [rdi + rcx]
    movzx ebx, byte [rsi + rcx]
    sub eax, ebx
    movsx rax, eax
    jmp end

end:
    ret
