.model small 
.stack 100h 
.data
   
    xd db 13, 10, '$'  
   
.code 
main proc 
    mov ax, @data
    mov ds, ax
     
    mov ah, 1 
    int 21h  
      
    push ax
    mov ah, 9 
    lea dx, xd 
    int 21h  
    pop ax
    
    mov dl, al
    mov ah, 2 
    int 21h
     
    mov ah, 4ch 
    int 21h 

main endp
end main




