.Model Small
.Stack 100H
.Data
    CRLF DB 13,10,'$'
    MSG1 DB 'fuck you!$'
    MSG2 DB 'you suck$'
    word DB 'k'

.Code
MAIN Proc
    Mov AX,@Data
    Mov DS,AX
    
    
    Mov AH,8
    INT 21H
    
    
    Mov DL,AL  
    Mov AH,2
    INT 21H
    
    
    Mov AH,9
    Lea DX,CRLF
    INT 21H
    
    
    Mov AH,9
    Lea DX,MSG2
    INT 21H
    
    Mov AH,4CH
    INT 21H
  MAIN Endp
   