//This program demonstrates adding and subtracting of 32 bit numbers

.text

ldr r0 , =a
ldr r1 , =b

ldr r0 , [r0]
ldr r1 , [r1]

add r2 , r1 , r0
sub r3 , r1 , r0
swi 0x011
.data
a: .word 0x00000456
b: .word 0x00000123