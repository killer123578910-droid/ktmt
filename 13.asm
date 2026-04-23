.model small
.stack 100h
.data
    crlf db 13,10,"$"
    x dw ?
    y dw ?
    sum dw 0
    flag dw 1
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

nhapso proc
    mov bx,10
    mov dx,0
    mov x,0
    mov y,0
nhap:
    mov ah,1
    int 21h
    
    cmp al,'#'
    je cut
    
    cmp al,13
    je skipnhap
    
     
    mov ah,0
    sub ax,"0"
   
    
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    
    mov x,ax
    jmp nhap
skipnhap:
    mov flag,1
    ret
cut:
    mov flag,0
    ret
nhapso endp

addso proc
    mov ax,x
    
    add ax,sum
    
    mov sum,ax
    ret
addso endp

inso proc
    mov bx,10
    mov cx,0
    mov ax,sum
    
inlap:
    mov dx,0
    div bx
    
    add dx,"0"
    push dx
    inc cx
    
    cmp ax,0
    jg inlap
    
inre:
    pop dx
    mov ah,2
    int 21h
    loop inre
ret
inso endp

main proc
    mov ax,@data
    mov ds,ax
    
congso:
    call nhapso
    call endl
    call addso
    
    push bx
    mov bx,flag
    cmp bx,0
    je congsong  
    pop bx
    
    
   
    jmp congso
congsong:
call endl
call inso

mov ah,4ch
int 21h

main endp
end main
    
    
    
    
    
    
    
    