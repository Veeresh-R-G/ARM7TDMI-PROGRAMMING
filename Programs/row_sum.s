
/*

    ROW SUM OF A MATRIX
    Just treat like taking sum of 3 - 3 elements together since they are stores in 
    contagious memory

    This can be solved using a single loop too by just incrementing the value of the address
    and setting the sum variable == 0 for every multiple of 3
    Think over this and code it out ! !  


*/


.text

ldr r0 , =b
mov r1 , r0
mov r7 , r0

ldr r6 , =c
mov r2 , #0


b outerLoop

outerLoop:
    add r2 , r2 , #1
    mov r4 , #0
    mov r0 ,r1
    mov r5 , #0
    innerLoop:
        add r5 , r5 , #1        
        ldr r3 , [r0]
        add r4 , r4 , r3
        add r0 , r0 , #4
        cmp r5 , #3
        bne innerLoop

    str r4 , [r6]
    add r4 , r4 ,#0
    add r1 , r1 , #12 
    cmp r2 , #3
    bne outerLoop

done:
  swi 0x011
  
.data
b: .word 1,2,3,4,5,6,7,8,9
c: .word 0,0,0
