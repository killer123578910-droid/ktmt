.model small
.stack 100h
.data
    list db 1,2,3,4,3,2,5,6,7,"$"
    crlf db 13,10,'$'
    maxx db "max: $"
    minn db "min: $"
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


insau proc
    mov ah,9
    int 21h
    ret
insau endp


inso proc
    mov ax,dx
    mov bx,10
    mov cx,0
lapin: 
    mov dx,0
    div bx
    
    add dx,"0"
    push dx
    inc cx 
    
    cmp ax,0
    jg lapin
popo:
    pop dx
    mov ah,2
    int 21h
    loop popo
ret
inso endp
    
    
timmax proc
    lea si,list
    mov dl,0

lap:
    cmp [si],"$"
    je break
    
    mov al,[si]
    
    cmp al,dl
    jle skip
    
    mov dl,al
    
skip:
    inc si
    jmp lap
    
break:
    mov dh,0
    call inso
    ret
timmax endp



timmin proc
    lea si,list
    mov dl,[si]     
    inc si

lapmin:
    cmp [si],"$"
    je breakmin
    
    mov al,[si]
    
    cmp al,dl
    jge skipmin
    
    mov dl,al

skipmin:
    inc si
    jmp lapmin

breakmin:
    mov dh,0
    call inso
    ret
timmin endp
    

main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,maxx
    call insau
    call endl
    
    call timmax
    call endl
    
    lea dx,minn
    call insau
    call timmin
    
    mov ah,4ch
    int 21h
main endp
end main