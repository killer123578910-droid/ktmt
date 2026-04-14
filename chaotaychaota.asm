.Model Small
.Stack 100H
.Data
    chaota DB "Xin Chao!$"
    chaotay DB "HELLO!$"
    CRLF DB 13,10,"$"
.code
MAIN proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,chaota
    int 21h
    
    mov ah,9
    lea dx,CRLF
    int 21h
    
    mov ah,9
    lea dx,chaotay
    int 21h
    
    mov ah,4ch
    int 21h
    
    MAIN endp


