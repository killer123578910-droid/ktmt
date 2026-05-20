.model small
.stack 100h
.data
    xau db 50 dup("$")
    crlf db 13,10,'$'
.code

; --- TH? T?C NH?P XÂU ---
nhapxau proc
    lea si,xau
lap1:
    mov ah,1
    int 21h
    cmp al,13       ; Ki?m tra n?u là Enter
    je het
    
    mov [si],al
    inc si
    jmp lap1
het:        
    mov [si],'$'   ; K?t thúc xâu b?ng '$'
    ret
nhapxau endp

; --- TH? T?C XU?NG DÒNG ---
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
    
; --- TH? T?C Ð?M T?N SU?T ---
freq proc
    xor cx,cx       ; Kh?i t?o b? d?m CX = 0
    lea si,xau      ; Ðua con tr? SI v? d?u xâu
    
    ; Nh?p ký t? c?n tìm
    mov ah,1
    int 21h
    
    ; Ð?y ký t? v?a nh?p t? AL sang BL d? dành (vì g?i endl s? làm thay d?i AL)
    mov bl, al 
    
    ; Xu?ng dòng d? chu?n b? in k?t qu? d?m
    call endl 
    
lap:
    cmp [si],'$'
    je xong
    cmp bl,[si]     ; So sánh ký t? trong BL v?i ký t? trong xâu
    jne skip
    inc cx          ; N?u gi?ng nhau thì tang CX
skip:
    inc si
    jmp lap
xong:
    
    ; In k?t qu? d?m ra màn hình
    mov dx,cx
    add dx,'0'      ; Chuy?n s? thành ký t? ASCII (Luu ý: Ch? dúng n?u t?n su?t <= 9)
    mov ah,2
    int 21h
    ret
freq endp

; --- HÀM CHÍNH ---
main proc
    mov ax,@data
    mov ds,ax
    
    call nhapxau    ; Bu?c 1: Nh?p xâu
    call endl       ; Bu?c 2: Xu?ng dòng
    
    call freq       ; Bu?c 3: Nh?p ký t? c?n d?m -> T? d?ng xu?ng dòng -> In k?t qu?
    
    mov ah,4ch
    int 21h
main endp
end main