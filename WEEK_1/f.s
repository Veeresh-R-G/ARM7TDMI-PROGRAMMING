/*

Based on the value of the number in R0, 
Write an ALP to store 1 in R1 if R0 is zero, 
Store 2 in R1 if R0 is positive, Store 3 in R1 if R0 is negative. 

*/

.text

mov r0 , #-1 ;// change this value for accessing various labels(+ve / -ve)
cmp r0 , #0

beq zero ;//branch to zero label if r0 == 0
bpl positive ;//branch to positive label if r0 > 1
bmi negative ;//branch to negative label if r0 < 0

zero:
    mov r1 , #1
    b done

positive:
    mov r1 , #2
    b done

negative:
    mov r1 , #3
    b done

done:
    swi 0x011
