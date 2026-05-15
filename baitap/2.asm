.model small
.stack 100h
.data
    xau db 50dup("$")
    check db 0
    
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

main proc
    mov ax,@data
    mov ds,ax
    
    lea si,xau
    
nhap:
    mov ah,1
    int 21h
    
    
    
    
    
    
    
    mov ah,4ch
    int 21h
main endp
end main
    
    