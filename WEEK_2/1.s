/*

Write a program in ARM7TDMI-ISA to copy a block of N data items from Location A to Location B.

*/

.text
ldr r0 , =a
ldr r1 , =b
mov r2 , #0 ;// Counter variable
mov r3 , #5

b transfer

/*

Incrementing the address depends on the mode of operations
1. .word --> +4
2. .hword --> +2
3. .byte --> +1

*/

/*

Codes for transfer block
1) .word
 add r2 , r2 , #1
    ldr r4 , [r0]
    add r0 , r0 , #4
    str r4 , [r1]
    add r1 , r1 , #4
    cmp r2 , r3
    bne transfer

2) .hword
    add r2 , r2 , #1
    ldrh r4 , [r0]
    add r0 , r0 , #2
    strh r4 , [r1]
    add r1 , r1 , #2
    cmp r2 , r3
    bne transfer

3) .byte
    add r2 , r2 , #1
    ldrb r4 , [r0]
    add r0 , r0 , #1
    strb r4 , [r1]
    add r1 , r1 , #1
    cmp r2 , r3
    bne transfer

*/
transfer:
    add r2 , r2 , #1
    ldrb r4 , [r0]
    add r0 , r0 , #1
    strb r4 , [r1]
    add r1 , r1 , #1
    cmp r2 , r3
    bne transfer

done:
    swi 0x011


.data
a: .byte 10 , 20 ,30 ,40 ,50
b: .byte 0

/*

1) word
a: .word 10 , 20 ,30 ,40 ,50
b: .word 0


2)Half Word 
a: .hword 10 , 20 ,30 ,40 ,50
b: .hword 0

3)Byte
a: .byte 10 , 20 ,30 ,40 ,50
b: .byte 0

*/
