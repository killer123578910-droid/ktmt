.model small
.stack 100h
.data
    crlf DB 13,10,"$"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,9
    lea dx,crlf
    int 21h
    
    mov dl,bl
    mov ah,2 
    int 21h
    
    mov ah,4ch
    int 21h
main endp
    
    
    