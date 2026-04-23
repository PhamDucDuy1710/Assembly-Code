.model small 
.data
    
    str db 'KTMT KTMT la mon kien truc may tinh KTMT va KTMT$'
    str2 db 'KTMT$'
    x dw '?'
    y dw '?'  
    xd db 13, 10, '$' 
    
.code 
main proc 
    mov ax, @data
    mov ds, ax 
     
    lea si, str 
    mov cx, 0
    lapI:
        cmp [si], '$' 
        je xong 
        
        mov bx, si
        lea di, str2
        lapJ:
            cmp [di], '$'
            je Co
            
            mov al, [bx]
            cmp [di], al
            jne Khong
            inc di
            inc bx
            jmp lapJ
        Co:
            inc cx
        Khong:
        inc si
        jmp lapI
    xong:
    
    mov ax, cx
    call inso  
    
    mov ah, 4ch 
    int 21h
main endp
nhapso proc 
    mov x, 0 
    mov y, 0 
    mov bx, 10
lap:
    mov ah, 1 
    int 21h 
    
    cmp al, 13
    je nhapxong
    
    sub al, '0'
    
    mov ah, 0 
    mov y, ax 
    mov ax, x 
    mul bx
    add ax, y 
    mov x, ax 
    jmp lap
nhapxong:
    mov ax, x    
    ret
    
nhapso endp 
  
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



