.model small
.stack 100h
.data
      crlf db 13,10,"$"
      ex db "nhap sai roi!$"
      x dw ?
      y dw ?
      
.code   
endl proc
    push dx
    push ax
    
    mov ah,9
    lea dx, crlf
    int 21h
    
    pop dx
    pop ax
    ret
endl endp

nhapso proc
    mov bx,2
lap:
    mov ah,1
    int 21h
    
    cmp al,"#"
    je retta
    cmp al,"0"
    jl rett                
    cmp al,"1"
    jg rett
    
    sub ah,'0'                             
    mov ah,0
    mov y,ax
    
    mov ax,x
    
    mul bx
    add ax,y
    
    mov x,ax
    jmp lap
    
    
retta: 
    mov bx,1
    ret            
rett: 
    mov bx,0
    ret
nhapso endp

inso proc
    
    
    
    
    
    
    
exec proc
    mov ah,9
    lea dx,ex
    int 21h
    ret
exec endp

main proc
    mov ax,@data
    mov ds,ax
    
    
    
    mov ah, 4ch
    int 21h
    
main endp
end main