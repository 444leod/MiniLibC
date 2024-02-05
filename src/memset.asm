section .text
global memset

; memset: fills a block of memory with a specific value
; Input: rdi - the pointer to the memory block
;        rdx - the number of bytes to fill in the memory block
;        rsi - the value to fill the memory block with
; Output: rax - the pointer to the memory block
memset:
    mov rax, rdi
    xor rcx, rcx

.memset_loop:
    cmp rcx, rdx
    je end
    mov byte [rax + rcx], sil

    inc rcx
    jmp .memset_loop

end:
    ret
