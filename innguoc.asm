.model small
.stack 100h
.data
    crlf db 13,10,"$"
    str db 50dup("$")
    nguoc db "nguoc: $"
.code
    




main proc
    mov ax,@data
    mov ds,ax
    
    mov cx,0
    lea si,str
lap:    
    mov ah,1
    int 21h 
    
    cmp al,"#"
    je break
    
    mov [si],al
    inc si
    inc cx
    
    jmp lap
break:
    mov ah,9
    lea dx, crlf
    int 21h
    
    
    lea si,str
    add si,cx
    dec si
    
innguoc:
    mov dl,[si]
    mov ah,2
    int 21h
    dec si
    loop innguoc 
   



    mov ah,4ch
    int 21h
main endp
end main