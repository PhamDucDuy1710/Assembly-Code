.model small
.stack 100h 
.data
    xd db 13, 10, '$'  
    x dw '?'
    y dw '?'   
      
.code
main proc 
   mov ax, @data
   mov ds, ax
    
   call nhapso
    
   push ax
   push dx
   
   mov ah, 9 
   lea dx, xd
   int 21h
   
   pop dx
   pop ax
    
   call inso  
  
   mov ah, 4ch 
   int 21h
main endp  

nhapso proc 
     
    mov x, 0 
    mov y, 0 
    mov bx, 2 
    mov cl, 0  
lap:          
    mov ah, 1 
    int 21h 
    
    cmp al, '#' 
    je break 
    
    cmp al, '0'
    je hople
    
    cmp al, '1' 
    je hople
    
    jmp lap
    
    hople:
        sub al, '0' 
        mov ah, 0 
        mov y, ax
        
        mov ax, x 
        mul bx
        add ax, y
        mov x, ax
        
        inc cl 
        cmp cl, 8
        jl lap
    
break: 
    mov ax, x   
    ret
nhapso endp  


inso proc 
    mov bx, 16
    mov cx, 0
lap2: 
    mov dx, 0
    div bx
    push dx
    inc cx
    
    cmp ax, 0
    jg lap2
hienthi: 
    pop dx
    cmp dl, 10
    jl xuly1
    jge xuly2
    
    xuly1:
        add dl, '0'
        jmp ra:  
    xuly2:
        sub dl, 10
        add dl, 'A'
    ra:
    mov ah, 2 
    int 21h
    loop hienthi
    
    ret
inso endp

end main