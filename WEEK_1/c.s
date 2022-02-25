//This program demonstrates addition of 5 numbers 


.text

ldr r0 , =a


mov r1 , #0 ;//--> r1 will store the result
mov r2 , #0 ;// --> counter variable
mov r3 , #5


sumLoop:
    ldr r5 , [r0]    
    add r1 , r1 ,r5
    add r0 , r0 , #4
    add r2 , r2 , #1
    cmp r2 , r3
    bne sumLoop

swi 0x11
.data
a: .word 1 , 2 ,3 ,4 ,5