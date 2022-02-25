/*

Write an ALP to compare the value of R0 and R1, add if R0 = R1, else subtract

*/

ldr r0 , =a
ldr r1 , =b

ldr r2 , [r0]
ldr r3 , [r1]

cmp r2 , r3
beq addNum
b subNum;//Not equal case

addNum:
    addeq r4 , r2 , r3 ;//Add if they are equal
    b done

subNum:
    sub r4 , r2 , r3;//Subtract is they are not equal
    b done

done:
    swi 0x11


.data
a: .word 1 ;//change the values here to play around with the code
b: .word 1 ;//change the values here to play around with the code