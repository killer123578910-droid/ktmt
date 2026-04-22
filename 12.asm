.model small
.stack 100h
.data
    crlf db 13,10,"$"
    x dw ?
    y dw ?
.code
insau proc
    mov ah,9
    int 21h   
    ret
insau endp
 
endl proc
    push ax
    push dx
    
    lea dx, crlf
    
    call insau
    
    pop dx
    pop ax
    ret
endl endp


inso proc
    mov bx,10
    mov cx,0
lap1:
    mov dx,0
    div bx
    
    add dx,'0'
    
    push dx
    inc cx
    cmp ax,0
    jne lap1      ; ?? s?a ? dây
inre:
    pop dx
    mov ah,2
    int 21h
    loop inre
ret 
inso endp

fib proc
    mov ax,1
lap:
    mul cx
     mov dx,0 
    loop lap
ret
fib endp
       
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    
    sub al,'0'
    mov ah,0
    
    mov cx,ax
    
    call fib
    
    call endl
    xor dx,dx
    call inso
    
    mov ah,4ch
    int 21h
main endp
end main
    
    
    
    
    
    
    