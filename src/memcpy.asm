section .text
global memcpy

; memcpy: copies n bytes from memory area src to memory area dest
; Input: rdi - the pointer to the destination memory block
;        rsi - the pointer to the source memory block
;        rdx - the number of bytes to copy
; Output: rax - the pointer to the destination memory block
memcpy:
    xor rcx, rcx

.memcpy_loop:
    cmp rcx, rdx
    je end
    mov al, byte [rsi + rcx]
    mov byte [rdi + rcx], al
    inc rcx
    jmp .memcpy_loop

end:
    mov rax, rdi
    ret
