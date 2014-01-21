[org 0x7c00] 

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

jmp $ ; infinite loop

times 510-($-$$) db 0

dw 0xaa55

