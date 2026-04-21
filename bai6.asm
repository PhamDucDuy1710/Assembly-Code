.model small
.stack 100h 
.data
   
   str db 50 dup('$')
   xd db 13, 10, '$' 
   str2 db 50 dup('$')
   
.code 
main proc 
    mov ax, @data 
    mov ds, ax
    
    lea si, str 
    mov cx, 0
lap: 
    mov ah, 1 
    int 21h 
    
    cmp al, '#' 
    je xuly 
    
    mov [si], al 
    
    mov ah, 0 
    push ax 
    
    inc si
    inc cx
     
    jmp lap
xuly: 
    dec si
    
    lea di, str2 
lap2:  
   i], al
    inc di
    loop lap pop ax  
    mov [d2
    
    mov ah, 9 
    lea dx, xd
    int 21h  
     
    pop dx         
    lea dx, str2 
    int 21h
    
    mov ah, 4ch 
    int 21h 
main endp 
end main



