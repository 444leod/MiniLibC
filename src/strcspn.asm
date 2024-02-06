section .text
global strcspn

; strcspn: calculates the length of the initial segment of rdi which consists entirely of characters not in rsi
; Input: rdi - the string
;        rsi - the string of characters to avoid
; Output: rax - the length of the segment
strcspn:
    xor rax, rax
    jmp strcspn_loop

strcspn_loop:
    cmp byte [rdi + rax], 0
    je end

    xor rcx, rcx
    jmp analyse_char

analyse_char:
    cmp byte [rsi + rcx], 0
    je increment

    movzx r8, byte [rsi + rcx]
    cmp byte [rdi + rax], r8b
    je end
    inc rcx
    jmp analyse_char

increment:
    inc rax
    jmp strcspn_loop

end:
    ret
