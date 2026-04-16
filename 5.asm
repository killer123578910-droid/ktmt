.model small
.stack 100h
.data
    crlf db 13,10,"$"
    sau db 50 dup("$")
    vh db "lower: $"
    vl db "upper: $"
.code
viethoa proc
    lea si,sau
  lap1:
    mov bl,[si] 
    cmp bl,"$"
    je break1
    
    cmp bl,"a"
    jl next1
    cmp bl,"z"
    jg next1
    sub bl,32
  next1:  
    mov [si],bl
    inc si
    jmp lap1
  break1:
    ret
viethoa endp


vietthuong proc
    lea si,sau
  lap2:
    mov bl,[si]
    cmp bl,"$"
    je break2
    cmp bl,"A"
    jl next2
    cmp bl,"Z"
    jg next2
    add bl,32
    
next2:  
    mov [si],bl
    inc si
    jmp lap2
break2:
    ret
vietthuong endp

main proc
    mov ax,@data
    mov ds,ax
    lea si,sau
 lap3:
    mov ah,1
    int 21h
   
    cmp al,13
    je break3
    
    mov [si],al
    inc si
    jmp lap3
 break3:
    
    mov ah,9
    lea dx,crlf
    int 21h
    
    call vietthuong
    
    mov ah,9
    lea dx,vl
    int 21h
    
    mov ah,9
    lea dx,sau
    int 21h
    
    mov ah,9
    lea dx,crlf
    int 21h
    
    call viethoa
    mov ah,9
    lea dx,vh
    int 21h
    
    mov ah,9
    lea dx,sau
    int 21h
 
    
    mov ah,4ch
    int 21h
main endp
end main
    