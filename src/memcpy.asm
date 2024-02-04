section .text
global memcpy

; memcpy: fills a block of memory with a specific value
; Input: rdi - the pointer to the memory block
;        rsi - the size of the memory block
;        rdx - the value to fill the memory block with
; Output: rax - the pointer to the memory block
//TODO: modify doc
memcpy:
    mov rax, rdi  ; save the original pointer
    xor rcx, rcx

.memcpy_loop:
    cmp rcx, rdx 
    je end
    mov al, byte [rsi + rcx]
    mov byte [rdi + rcx], al
    inc rcx
    jmp .memcpy_loop

end:
    ret