.model small
.stack 100h
.data
    crlf db 13,10,'$'
    a db 50 dup('$')
    b db 50 dup('$')
    tb1 db 'Nhap chuoi A: $'
    tb2 db 13,10,'Nhap chuoi B: $'
    yes db 13,10,'Co tai vi tri: $'
    no db 13,10,'Khong co$'
.code

endl proc
    mov ah,9
    int 21h
    ret
endl endp

inso proc
    mov bx,10
    mov cx,0
lap1:
    xor dx,dx
    div bx
    push dx
    inc cx
    cmp ax,0
    ja lap1
lap2:
    pop dx
    add dl,'0'
    mov ah,2
    int 21h
    loop lap2
    ret
inso endp

nhapxau proc
    lapnhap:
        mov ah,1
        int 21h
        
        cmp al,13
        je ende
        
        mov [si],al
        inc cx
        inc si
        jmp lapnhap
  ende:
    mov [si],'$'
    ret
nhapxau endp

main proc
    mov ax,@data
    mov ds,ax
    
    lea si,a
    xor cx,cx
    call nhapxau
    
    lea dx,crlf
    call endl
    
    lea si,b
    xor cx,cx
    call nhapxau

    mov bx,0

ngoai:
    lea si,a
    add si,bx
    lea di,b

trong:
    mov al,[di]
    cmp al,'$'
    je found
    
    mov ah,[si]
    cmp ah,'$'
    je notfound
    
    cmp ah,al
    jne next
    
    inc si
    inc di
    jmp trong

found:
    lea dx,yes
    call endl
    mov ax,bx
    call inso
    jmp exit

next:
    inc bx
    cmp byte ptr a[bx],'$'
    je notfound
    jmp ngoai

notfound:
    lea dx,no
    call endl

exit:
    mov ah,4ch
    int 21h
main endp
end main