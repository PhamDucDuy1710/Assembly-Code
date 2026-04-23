.model small 
.stack 100h 
.data        
   xd db 13, 10, '$'
   list db 1 ,3, 30, 40, 49, 5, 6, 7, 9, 10 

.code 
main proc 
    mov ax, @data
    mov ds, ax 
     
    mov cx, 10
    lea si, list 
    mov bl, [si]
    inc si
lap: 
    cmp bl, [si]
    jg continue 
    
    mov bl, [si]
    continue: 
    inc si 
    loop lap  
    
    mov bh, 0 
    mov ax, bx  
    
    
    call inso
    
    mov ah, 4ch 
    int 21h 
main endp   

    inso proc 
        
        mov cx, 0
        mov bx, 10 
    lap2: 
        mov dx, 0 
        div bx
        push dx
        inc cx 
        
        cmp ax, 0
        jg lap2
    hienthi: 
        pop dx
        add dl, '0' 
        mov ah, 2 
        int 21h 
        
        loop hienthi
        
        ret 
    inso endp   
    
    
    endl proc 
       
       push ax
       push dx
       
       mov ah, 9
       lea dx, xd
       int 21h
       
       pop dx
       pop ax
       
       ret
    endl endp 
end main