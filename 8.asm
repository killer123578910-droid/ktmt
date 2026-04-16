.model small
.stack 100h
.data
    crlf db 13,10,'$'
    x dw ?
    y dw ?
.code

nhapso proc
    mov bx,10
    mov dx,0
lap:

    mov ah,1
    int 21h 
    
    cmp al,13
    je break
    
    mov ah,0
    sub ax,"0"
    mov y,ax
    mov ax,x
    mul bx
    
    add ax,y
    mov x,ax
    jmp lap
break:
   ret
nhapso endp
inso proc
    mov bx,16
    mov cx,0
    mov ax,x
lap1:
    mov dx,0
    div bx
    
    cmp dx,10
    jle lk
 
    add dx,"A"
    sub dx,10
    sub dx,'0'
    
  lk:
    push dx 
    inc cx
    cmp ax,0
    jg lap1
inre:
    pop dx
    add dx,"0"
    mov ah,2
    int 21h
    loop inre
ret
inso endp 



main proc
    mov ax,@data
    mov ds,ax
    
    call nhapso
    
    mov ah,9
    lea dx,crlf
    int 21h
    
    call inso
    
    mov ah,4ch
    int 21h
    
main endp
end main
    