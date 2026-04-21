.model small
.stack 100h 
.data
   xd db 13, 10, 'Chieu dai cua xau la:$'
   x dw '?' 
   y dw '?'   
   str db 50 dup('$')
   
.code 
main proc 
    mov ax, @data 
    mov ds, ax  
      
    mov cx, 0 
    lea si, str 
lap: 
    mov ah, 1 
    int 21h 
    
    cmp al, 13
    je nhapxong
    
    inc cx 
    
    mov [si], al
    inc si  
    
    jmp lap
nhapxong: 
    
    mov ah, 9
    lea dx, xd 
    int 21h
    
    mov dl, cl
    add dl, '0' 
    mov ah, 2
    int 21h 
   
    mov ah, 4ch
    int 21h
    
main endp
end main






