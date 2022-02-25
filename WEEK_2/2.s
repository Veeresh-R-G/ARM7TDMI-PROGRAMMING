/*

Write a program in ARM7TDMI-ISA to find the sum of  N data items in the memory. 
Store the result in the memory location.

*/

.text
ldr r0 , =a
ldr r1 , =b ;// resultant memory 

mov r2 , #0 ;// Counter variable
mov r3 , #5
mov r4 , #0; // Sum variable

b addN

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
addN:
    add r2 , r2 , #1
    ldrb r5 , [r0]
    add r0 , r0 ,#1
    add r4 , r4 , r5
    cmp r2 , r3
    bne addN

;//storing the final result
strb r4, [r1]
done:
    swi 0x011


.data
a: .byte 10 , 20 ,30 ,40 ,50
b: .byte 0

/*

Variations in the .data segment
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
