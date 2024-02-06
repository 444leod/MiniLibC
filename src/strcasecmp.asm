section .text
global strcasecmp

; strcasecmp: compare two strings and return their different
; Input: rdi - the first string
;        rsi - the second string
; Output: rax - the difference between the two strings
strcasecmp:
    xor rax, rax
    xor rcx, rcx

.strcasecmp_loop:
    mov al, [rdi + rcx]
    mov bl, [rsi + rcx]

    cmp al, 0
    je verify_end
    cmp bl, 0
    je verify_end

    cmp al, 91
    jl .tolower
    cmp bl, 91
    jl .tolower1


    cmp al, bl
    je .increase


    jne verify_end

.tolower:
    cmp al, 65
    jl .increase
    cmp al, 90
    jg .increase
    add al, 32
    jmp .increase

.tolower1:
    cmp bl, 65
    jl .increase
    cmp bl, 90
    jg .increase
    add bl, 32
    jmp .increase

.increase:
    inc rcx
    jmp .strcasecmp_loop

verify_end:
    movzx eax, byte [rdi + rcx]
    movzx ebx, byte [rsi + rcx]
    sub eax, ebx
    movsx rax, eax
    jmp end

end:
    ret

