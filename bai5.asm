.model small 
.stack 100h 
.data
   
    xd db 13, 10, '$' 
    str db 50 dup('$') 
   
.code 
main proc 
    mov ax, @data
    mov ds, ax
     
    lea si, str 
lap:
    mov ah, 1   
    int 21h
    
    cmp al, 13 
    je nhapxong 
    
    mov [si], al
    
    cmp [si], 'A' 
    jl continue 
    
    cmp [si], 'Z'
    jg continue 

    add [si], 32
         
    continue:  
    inc si
    jmp lap
nhapxong: 
    
    mov ah, 9 
    lea dx, xd 
    int 21h 
    
    lea dx, str
    int 21h
     
    mov ah, 4ch 
    int 21h 

main endp
end main


