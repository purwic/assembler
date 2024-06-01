; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    y dw 0h
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    
     
    mov ax, 0h
    mov bx, 0h
    mov cx, 0h
    mov dx, 0h
    
    mov al, 0eh;  al = 14
    mov bl, 3h;   bl = 3
    mul bl;       ax = al * bl
    mov bx, ax;   bx = ax
    mov ax, 0h;   ax = 0
    
    mov ax, 10h;  ax = 16
    mov cl, 5h;   cl = 5
    div cl;       al = ax / cl
    mov ah, 0h;   ah = 0
    mov cl, al;   cl = al
    
    mov al, 2h;   al = 2
    mov dl, 3h;   dl = 3
    mul dl;       ax = al * dl
    mov dx, ax;   dx = ax
    mov ax, 0h;   ax = 0
    
    sub cx, dx;   cx = cx - dx
    mov ax, bx;   ax = bx
    mov bx, dx;   bx = dx
    mov dx, 0h;   dx = 0
    idiv cx;      ax = dx:ax / cx
    mov bx, ax;   bx = ax
    
    ;             bx = (14 * 3) / ((16 / 5) - (2 * 3))
        
    mov ax, 0h;   ax = 0
    mov cx, 0h;   cx = 0
    mov dx, 0h;   dx = 0
    
    mov ax, 0eh;  ax = 14
    mov cl, 4h;   cl = 4
    div cl;       al = ax / cl
    mov ah, 0h;   ah = 0
    mov cx, ax;   cx = ax (cx = 14 / 4)
    
    mov ax, 3h;   ax = 3
    mov dx, 5h;   dx = 5
    sub dx, ax;   dx = dx - ax
    
    mov ax, cx;   ax = cx (cx = 14 / 4)
    div dl;       al = ax / dl
    mov ah, 0h;   ah = 0
    
    ;             ax = (14 / 4) / (5 - 3)
    
    sub bx, ax;   bx = bx - ax
    
    mov y, bx;    y = (14 * 3) / ((16 / 5) - (2 * 3)) - (14 / 4) / (5 - 3)
    
    
    
    
            
ends

end start ; set entry point and stop the assembler.