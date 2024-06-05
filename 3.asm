
data segment
    a db ?
    x db ?
    y db ?
    y1 db ?
    y2 db ?
    is_a_neg db ?       ; 0 or 1
    is_x_neg db ?       ; 0 or 1
    
    perenos db 13, 10,  "$"
    input_a db 13, 10,  "input a = $"
    input_x db 13, 10,  "input x = $"
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

    mov ax, -5        
    xor ax, ax
    mov dx, offset input_a
    mov ah, 9
    int 21h
    
@input_a:
    mov ah, 1
    int 21h
    cmp al, "-"
    jnz @set_a_start
    mov is_a_neg, 1
    jmp @input_a
    
@set_a_start:            
    sub al, 30h
    mov bl, is_a_neg
    test bl, bl
    mov bl, 0
    jz @set_a_end
    neg al

@set_a_end:
    mov a, al
    
@output_input_x:
    mov ax, 0
    mov bx, 0
    MOV DX, OFFSET input_x
    MOV AH, 9
    INT 21H 

@input_x:
    MOV AH, 1 
    INT 21H 
    CMP AL, "-" 
    JNZ @set_x_start 
    MOV is_x_neg, 1 
    JMP @input_x 

@set_x_start:            
    sub al, 30h
    mov bl, is_x_neg
    test bl, bl
    mov bl, 0
    jz @set_x_end
    neg al

@set_x_end:
    mov x, al          
         
      

      
@start:
    mov ax, 0
    mov bx, 0
    mov cx, 0
    mov dx, 0 
;   bl, bh are used as temporary storages
;   we ain't touch other registers


;-----------------y1-----------------

    
@set_y1:
    cmp x, 7
    jg @set_y1_var1         ; if x > 7 jump
    ; else

    
@set_y1_var2:
    mov y1, 9
    mov bl, is_a_neg
    test bl, bl
    mov bl, 0
    jz @set_y1_var2_a_pos   ; if is_a_neg = 0
    
    ; else
    mov bl, a
    neg bl
    add y1, bl
    mov bl, 0
    
    jmp @set_y2    

    
@set_y1_var2_a_pos:
    mov bl, a
    add y1, bl
    mov bl, 0            
    jmp @set_y2


@set_y1_var1:
    mov bl, 15
    add bl, x
    mov y1, bl
    mov bl, 0
    

;-----------------y2-----------------

    
@set_y2:
    cmp x, 2
    jg @set_y2_var1         ; if x > 2 jump
    ; else
 
        
@set_y2_var2:
    mov y2, -5
    mov bl, is_x_neg
    test bl, bl
    mov bl, 0
    jz @set_y2_var2_x_pos   ; if is_a_neg = 0
    
    ; else
    mov bl, x
    neg bl
    add y2, bl
    mov bl, 0
    
    jmp @set_y    

    
@set_y2_var2_x_pos:
    mov bl, x
    add y2, bl
    mov bl, 0            
    jmp @set_y


@set_y2_var1:
    mov y2, 3


@set_y:
    mov bx, 0
    mov al, y1              ; y1 can never be negative
    idiv y2
    mov ah, 0
    
    mov y, al
    
    
@output_y:
    
    mov ax, 0
    mov dx, offset output_y 
    mov ah, 9
    int 21h
    mov dx, 0
    
    cmp y, 0               ; >= then positive
    jge @output_y_pos
    ; else
          
          
@output_y_neg:    
    mov al, y
    NEG AL 
    MOV BL, AL 
    MOV DL, "-" 
    MOV AH, 2 
    INT 21H
    MOV DL, BL
    ADD DL, 30H 
    INT 21H 
    JMP @end 
           
           
@output_y_pos:
    MOV DL, Y 
    ADD DL, 30H 
    MOV AH, 2 
    INT 21H            


@end:
    









          
ENDS

end start 
