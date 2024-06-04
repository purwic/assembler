
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
         
      
; tut nachinaetsa
      
@start:
    mov ax, 0
    mov bx, 0
    mov cx, 0
    mov dx, 0
    
@set_y1:
    cmp x, 7
    jg @set_y1_var1    ; if x > 7 jump
    
    ; var2
    
@set_y1_var2:
    mov y1, 9
    mov bl, is_a_neg
    test bl, bl
    mov bl, 0
    jz @set_y1_var2_a_pos    ; if is_a_neg = 0
    

    
    
@set_y1_var1:
        
          
ENDS

end start 
