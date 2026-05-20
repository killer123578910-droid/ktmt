.model small
.stack 100h
.data
    crlf db 13,10,"$"

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


nhapxau proc
    pop bx          ; l?y d?a ch? return ra tru?c

    xor cx,cx

nhap:
    mov ah,1
    int 21h

    cmp al,13
    je xong

    xor ah,ah
    push ax         ; luu ký t? vào stack
    inc cx
    jmp nhap

xong:
    push bx         ; tr? l?i d?a ch? return
    ret
nhapxau endp


indao proc
    pop bx
lap:
    pop dx          ; ký t? n?m ? DL
    mov ah,2
    int 21h
    loop lap
    push bx
    ret
indao endp



main proc
    mov ax,@data
    mov ds,ax

    call nhapxau
    call endl
    call indao

    mov ah,4ch
    int 21h
main endp

end main