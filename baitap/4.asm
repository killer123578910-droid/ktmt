.model small
.stack 100h
.data
    x dw ?
    y dw ?
    crlf db 13,10,'$'
.code
nhapso proc
    mov bx,10
nhap:
    mov ah,1
    int 21h
    
    cmp al,13
    je xong
    
    xor ah,ah
    sub ax,48
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    
    jmp nhap
xong:
    ret
nhapso endp

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

indoi proc
    mov bx,2
    xor cx,cx
    
    mov ax,x
inR:
    xor dx,dx
    div bx
    push dx
    inc cx
    cmp ax,0
    jne inR
inre:
    pop dx
    add dx,48
    mov ah,2
    int 21h
    loop inre
ret
indoi endp

in16 proc
    mov bx,16
    xor cx,cx
    
    mov ax,x
inR16:
    xor dx,dx
    div bx 
    cmp dx,10
    jl skip
    add dx,55
    sub dx,48
skip:
    push dx
    inc cx
    cmp ax,0
    jne inR16
inre16:
    pop dx
    add dx,48
    mov ah,2
    int 21h
    loop inre16
ret
in16 endp


main proc
    mov ax,@data
    mov ds,ax
    
    call nhapso
    call endl
    call indoi
    call endl
    call in16
    
    mov ah,4ch
    int 21h
    main endp
end main
    

    
    
  
    


   

    
   