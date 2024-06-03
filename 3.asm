
data segment
    a db ?
    x db ?
    y db ?
    y1 db ?
    y2 db ?
    perenos db 13, 10, "$"
    input_a db 13, 10, "input a = $"
    input_x db 13, 10, "input x = $"
    output_y db 13, 10, "y = $"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    mov ax, data
    mov ds, ax
    mov es, ax

            
    xor ax, ax
    mov dx, offset input_a
    mov ah, 9
    int 21h
    
step2:
    mov ah, 1
    int 21h
    cmp al, "-"
    jnz step1
    mov bx, 1
    jmp step2
    
step1:            
    sub al, 30h
    test bx, bx
    jz step3
    neg al

step3:
    MOV a, AL
    XOR AX, AX 
    XOR BX, BX
    MOV DX, OFFSET input_x
    MOV AH, 9
    INT 21H 

step4:
    MOV AH, 1 
    INT 21H 
    CMP AL, "-" 
    JNZ step5 
    MOV BX, 1 
    JMP step4 

step5:
    SUB AL, 30H 
    TEST BX, BX 
    JZ step6 
    NEG AL
      
; tut nachinaetsa
      
step6:
    mov x, al
    
    mov ax, 0
     
    cmp x, 7d
    jg @x_much_than_7
    jle @x_less_or_equal_to_7
    
    cmp x, 2d
    jg @x_much_than_2
    jle @x_less_or_equal_to_2
    
    mov al, y1
    idiv y2
    mov ah, 0
    
    mov y, al
     
    JMP SHORT @VIXOD


@x_much_than_7:
    mov y1, 15d
    mov dl, x
    add y1, dl
    
@x_less_or_equal_to_7:
    cmp a, 0
    jge @x_le_a_pos
    jl @x_le_a_neg
   
    
@x_le_a_pos:
    mov dl, a
    mov y1, 9
    add y1, dl 
 
@x_le_a_neg:
    neg a
    mov dl, a
    mov y1, 9
    add y1, dl
    neg a 


@x_much_than_2:
    mov y1, 3d
    
@x_less_or_equal_to_2:
    mov y2, -5d
    cmp x, 0
    jge @x_le_x_pos
    jl @x_le_x_neg
   
    
@x_le_x_pos:
    mov dl, x
    add y2, dl 
 
@x_le_x_neg:
    neg x
    mov dl, x
    add y2, dl
    neg x       
                
     
@VIXOD:

    mov ax, 0
    mov bx, 0
    mov cx, 0
    mov dx, 0
    
    mov al, y

          
ENDS

end start 
