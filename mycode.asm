.Model small
.Stack 100H
.Data
.Code
MAIN proc
    mov ax,@data
    mov ds,ax
    
    mov bx,600
    mov ax,0x4240
    
    mov dx,0xF
    div bx
    
    
    
    
    mov ah,4ch
    int 21h
   MAIN endp



