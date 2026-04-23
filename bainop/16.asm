.model small
.stack 100h
.data
    crlf db 13,10,"$"
    x dw ?
    y dw ?
    sum dd 0
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
    xor dx,dx
    mov x,0
    mov y,0
nhap:
    mov ah,1
    int 21h
    cmp al,13
    je skipnhap
    xor ah,ah
    sub ax,"0"
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp nhap
skipnhap:
    ret
nhapso endp

addso proc
    mov ax,x
    mov dx,0
    add ax,word ptr sum
    adc dx,word ptr sum+2
    mov word ptr sum,ax
    mov word ptr sum+2,dx
    ret
addso endp

inso proc
    mov bx,10
    xor cx,cx
    mov ax,word ptr sum
    mov dx,word ptr sum+2
inlap:
    div bx
    push dx
    inc cx
    xor dx,dx
    cmp ax,0
    jne inlap
inre:
    pop dx
    add dl,'0'
    mov ah,2
    int 21h
    loop inre
    ret
inso endp

main proc
    mov ax,@data
    mov ds,ax
    mov cx,2
congso:
    call nhapso
    call endl
    call addso
    loop congso
    call endl
    call inso
    mov ah,4ch
    int 21h
main endp
end main