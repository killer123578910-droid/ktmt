.model small
.stack 100h
.data
    crlf DB 13,10,"$"
    A db "A"
    ;buffer db 100
           ;db ?
           ;db 100 dup(?)
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov bl,al
    
    sub bl,32; tru 32 khi chuyen tu thuong ->hoa va cong neu nguoc lai
    
    mov ah,9
    lea dx,crlf
    int 21h
    
    mov dl,bl
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
main endp
    
    
    