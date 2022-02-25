//Program to check whether its even or odd
//r4 will be the result register where we can store 
//1 --> odd number
//0 --> even number
/*
    LOGIC : And the number with 1 
    if the answer is 0 then the number is even,
    else its ODD
*/
.text
ldr r0 , =a
ldr r1 , =b

ldr r2 , [r0] ;// holds 11
ldr r3 , [r1] ;// holds 10

//testing for even numbers
tst r3,  #1 ;// tst --> r3 && 1 
beq even

tst r2 , #1
mov r4 , #1

even:
    mov r4 , #0
.data
a: .word 11
b: .word 10