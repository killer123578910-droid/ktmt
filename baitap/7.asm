.Model Tiny
.Code
org 100h

JMP Bdau

Bdau: 
    IN AL, 125      ; Read temperature from EMU8086's built-in Thermometer (Port 125)
    
    CMP AL, 30
    JB NH30         ; If Temp < 30, turn OFF
    
    CMP AL, 40
    JA LH40         ; If Temp > 40, turn ON
    
    JMP Xong1lan    

NH30: 
    MOV AL, 1      
    OUT 127, AL     ; Send 0 to Port 127 (Turns Thermometer heater OFF)
    JMP Xong1lan

LH40: 
    XOR AL, AL       
    OUT 127, AL     ; Send 1 to Port 127 (Turns Thermometer heater ON)
    JMP Xong1lan    

Xong1lan:
    MOV CX, 50    
Delay: 
    NOP             
    LOOP Delay      

    JMP Bdau        

END Bdau