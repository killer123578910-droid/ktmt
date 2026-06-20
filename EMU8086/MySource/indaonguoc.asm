.model small
.stack 100h
.data
     crlf db 13,10,"$"
     ditconmemay db "
     buffer db 50
            db ?
            db 50 dup("?")
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    
    
    
    mov ah,4ch
    int 21h
main endp
end main