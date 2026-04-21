.model small
.stack 100h 
.data
   
   chaota db 'xin chao$'
   chaotay db 'hello'
   xd db 13, 10, '$' 
   
.code 
main proc 
    mov ax, @data
    mov ds, ax 
    
    mov ah, 9
    lea dx, chaota
    int 21h 
    
    lea dx, xd 
    int 21h 
    
    lea dx, chaotay
    int 21h
    
    mov ah, 4ch 
    int 21h 
    
main endp
end main