.model small 
.stack 100h 
.data        
   xd db 13, 10, '$'
   list db 1 ,3, 30, 40, 49, 5, 6, 7, 9, 10     
   x dw '?'
   y dw '?'
   tmp1 dw '?' 
   tmp2 dw '?' 
   m dw '?'

.code 
main proc 
    mov ax, @data
    mov ds, ax 
     
    call nhapso 
mov tmp1, ax 

call endl 

call nhapso
mov tmp2, ax

mov bx, tmp1

lap:
    cmp ax, bx
    je xong 
    jl xuly1 
    jg xuly2
    
xuly1: 
    sub bx, ax
    jmp lap

xuly2: 
    sub ax, bx
    jmp lap

xong:   
    mov m, ax   
    call endl 
    call inso   ; gcd
    
    ; ===== LCM =====
    mov ax, tmp1 
    mov bx, tmp2 
    
    mov dx, 0
    mul bx 
    
    mov bx, m 
    div bx 
    
    call endl
    call inso 
    
    mov ah, 4ch 
    int 21h 
main endp 

nhapso proc 
     
    mov x, 0 
    mov y, 0
    mov bx, 10
lap3: 
    mov ah, 1 
    int 21h 
    
    cmp al, 13
    je break
    
    sub al, '0'
    mov ah, 0 
    
    mov y, ax    
    mov ax, x
    mul bx    
    add ax, y 
    
    mov x, ax
    jmp lap3
break: 
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



