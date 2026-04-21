.model small
.stack 100h
.data
    str db "phamuyennhi$"
    crlf db 13,10,'$'
.code
endl proc
    push ax
    push dx
    
    mov ah,9
    lea dx,crlf
    int 21h
    
    pop dx
    pop ax
    ret
endl endp
inso proc
    mov bx,10
    mov ax,cx
    mov cx,0
lapchinh: 
    mov dx,0
    div bx
    
    add dx,'0'
    push dx
    inc cx
    cmp ax,0
    jg lapchinh
pr:
    pop dx
    mov ah,2
    int 21h
    loop pr
ret
inso endp
    

main proc
    mov ax,@data
    mov ds,ax
    
    lea si,str
    mov cx,0
lap:
    mov dl,[si]
    
  
    cmp dl,'$'
    je break2
    
    inc cx
    inc si
    jmp lap
break2:
call inso
     
    
    
    mov ah,4ch
    int 21h
main endp
end main
    