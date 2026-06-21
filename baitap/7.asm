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
      jmp Bdau 
NH30: 
    MOV AL, 1      
    OUT 127, AL     ; Send 0 to Port 127 (Turns Thermometer heater OFF)
    jmp Bdau 

LH40: 
    XOR AL, AL       
    OUT 127, AL     ; Send 1 to Port 127 (Turns Thermometer heater ON)
    jmp Bdau     

      

END Bdau