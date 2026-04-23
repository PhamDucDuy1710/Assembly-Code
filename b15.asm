.model small 
.data
    xd db 13, 10, '$'
    list db 1, 2, 3, 4, 6, 7, 22, 14, 13, 11    
    x dw '?'
    y dw '?'
    cnt dw '?'
.code 
main proc 
    mov ax, @data
    mov ds, ax 
     
    mov cnt, 0 
    lea si, list 
    mov bl, 11 
    mov bh, 0
    mov cx, 10
    
lap3: 
    mov al, [si]
    mov ah, 0 
    
    div bl  
    
    cmp ah, 0 
    jne continue 
    
    inc cnt
    add bh, [si]
    
    continue:
    inc si
    loop lap3   
    
    mov al, bh
    mov ah, 0
    call inso 
    
    call endl 
    mov ax, cnt 
    
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

