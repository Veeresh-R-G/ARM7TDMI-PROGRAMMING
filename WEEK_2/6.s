/*
    Write a program in ARM7TDMI-ISA to find the factorial of a number.
*/

.text
ldr r0 , =a
ldr r1 , =b

ldr r2 , [r0]
mov r3 , #0;//counter variable
mov r4 , #1 ;//answer variable
b factorial
    
factorial:
    add r3 , r3 , #1
    
    mul r4 , r4 , r3
    cmp r3 , r2
    bne factorial

str r4 , [r1]

swi 0x011
.data
a: .word 5
b: .word 0 ;//result here