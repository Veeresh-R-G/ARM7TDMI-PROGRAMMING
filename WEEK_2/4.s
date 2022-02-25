/*

Write a program in ARM7TDMI-ISA to find the product 
of two 32bit numbers using barrel shifter

There is not as such standard procedure 
In this we have to split the multiplier as :

 2^n + i (OR) 2^n - i ; where i = 0 , 1, 2, 3 ..
 Then apply appropriate lsl operation

 Lets perform 10 * 7
 7 = 8 - 1
   = 2^3 - 1

   ==> 10 * ( 8 - 1) === (80 - 10) => 70 which is the required answer
*/


.text
ldr r0 , =a ;//operand - 1
ldr r1 , =b ;//operand - 2
ldr r2 , =c

ldr r3 , [r0]
ldr r4 , [r1]

mov r5 , r3 , lsl#3 ;//multiply by 8
nop
sub r6 , r5 , r3

str r6 , [r2]

swi 0x011

.data
a: .word 10
b: .word 7
c: .word 0