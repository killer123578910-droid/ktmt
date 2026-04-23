.model small
.stack 100h
.data
    crlf db 13,10,"$"
    ng db "nguoc: $"
    
    
    str db 50dup("$")
    
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
    
    push ax
    
    
    jmp lap
break:
    mov ah,9
    lea dx, crlf
    int 21h
    
    mov ah,9
    lea dx, ng
    int 21h
   
delop:
    pop ax
    ;mov dh,0
    mov dl,al
    mov ah,2
    int 21h
    loop delop


    mov ah,4ch
    int 21h
main endp
end main