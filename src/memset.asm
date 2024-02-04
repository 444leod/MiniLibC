section .text
global memset

; memset: fills a block of memory with a specific value
; Input: rdi - the pointer to the memory block
;        rsi - the size of the memory block
;        rdx - the value to fill the memory block with
; Output: rax - the pointer to the memory block
memset:
    mov rax, rdi  ; save the original pointer

.memset_loop:
    cmp rsi, 0
    je end
    mov byte [rdi + rsi - 1], dl
    dec rsi
    jmp .memset_loop

end:
    ret