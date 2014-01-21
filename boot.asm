[org 0x7c00]

jmp 0x0:Start

Start:
cli

mov ax, 0x9000
mov ss, ax
mov sp, 0xfb00 ; setting the stack

xor ax, ax
mov ds, ax ; setting the data segment

mov [BootDevice], dl ; saving the boot device

mov bx, msg

mov al, [bx]
mov ah, 0x0e
l1:
    mov al, [bx]        
        cmp al, 0
        je end_printing
        int 0x10
        inc bx
    jmp l1
end_printing:
    mov al, '!'
    int 0x10
    
msg DB 'This is the bootloader, it will load kernel', 0
BootDevice resb 1

jmp $ ; infinite loop

times 510-($-$$) db 0

dw 0xaa55
