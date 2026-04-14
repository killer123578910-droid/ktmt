.model small
.stack 100h
.data
    crlf db 13,10,"$"
    sau db 50 dup("$")
.code

main proc
    mov ax,@data
    mov ds,ax
    lea si,sau
 lap:
    mov ah,1
    int 21h
   
    
    
    cmp al,13
    je break
    
    mov [si],al
    inc si
    jmp lap
 break:
    mov ah,9
    lea dx,crlf
    int 21h
    
    mov ah,9
    lea dx,sau
    int 21h
    
    
    mov ah,4ch
    int 21h
main endp
    