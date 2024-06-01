; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    mov ax, 0
    mov bx, 0
    mov cx, 0
    mov dx, 0
    
    mov ah, 01101101b
    mov al, 00011111b
    
    mov bh, ah
    and bh, 00001111b
    mov bl, al
    and bl, 11110000b
    
    shl bh, 4
    shr bl, 4
    
    and ah, 11110000b
    and al, 00001111b
    
    or ah, bl
    or al, bh
    
    mov bx, 0
    
    or al, ah
    
    mov ah, 0
    shr ax, 3    
ends

end start ; set entry point and stop the assembler.
