//This program demonstrates basic logic Operations 
//AND
//OR
//XOR
//NOT
.text

;//All the below instructions contain the addresses of a,b,c variables
ldr r0 , =a
ldr r1 , =b
ldr r2 , =c

ldr r0 , [r0]
ldr r1 , [r1]
ldr r2 , [r2]

and r3 , r1 , r0 ;// Performs logical AND
orr r4 , r1 , r0 ;// Performs logical OR
eor r5 , r1 , r0 ;// Performs logical XOR
bic r6 , r2 , r0 ;// Performs BIC : r5 = r2 & ~(r0) --> bit masking
mvn r7 , r2 ;// r6 = ~r2

swi 0x011

.data
a: .word 1
b: .word 0
c: .word 0xffffffff
