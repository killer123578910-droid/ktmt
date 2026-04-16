.model small
.stack 100h
.data
      crlf db 13,10,"$"
      ex db 10,"nhap sai roi!$"
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
    mov cx,0
lap:
    mov ah,1
    int 21h
    inc cx
    cmp al,"#"
    je retta
    cmp al,"0"
    jl rett                
    cmp al,"1"
    jg rett
    
    mov ah,0
    sub ax,'0'                             
    mov y,ax
  
    mov ax,x
    
    mul bx
    add ax,y
    
    mov x,ax
    cmp cx,8
    je retta
    jmp lap
    
    
retta: 
    mov bx,1
    ret            
rett: 
    mov bx,0
    ret
nhapso endp

inso proc
    mov bx, 16
    mov cx,0
    mov ax,x
lap1:
    mov dx,0
    div bx
  
    cmp dx,10
    jl digit
    
    add dx,"A"
    sub dx,10
    jmp skip
  
  digit:
    add dx,"0"  
  skip:
    push dx
    inc cx                                             
    cmp ax,0
    jg lap1
inre:
    pop dx
    mov ah,2
    int 21h
    loop inre
        
ret
inso endp
    
    
    
    
exec proc
    mov ah,9
    lea dx,ex
    int 21h
    ret
exec endp

main proc
    mov ax,@data
    mov ds,ax
    
    call nhapso
    
    cmp bx,0
    je thoat
    
    call endl
    call inso
    jmp ene
    
    
thoat:
    call exec
 ene: 
    mov ah, 4ch
    int 21h
    
main endp
end main