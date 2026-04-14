.Model Small
.Stack 100H
.Data
    ng1 DB '3$'
    ng2 DB '1$'
.Code
MAIN Proc
    Mov AX,@Data
    Mov DS,AX
    
    Mov AX,0
    CMP AX,0
    JE ng1e
    
    
    Mov AH,9
    Lea DX,ng2
    INT 21H
    JMP ketthuc

ng1e:
    Mov AH,9
    Lea DX,ng1
    INT 21H
    
ketthuc: 
    Mov AH,4CH
    INT 21H
    MAIN Endp