/*
    Write a program in ARM7TDMI-ISA to 
    find the sum of  N natural numbers.  
    Store the result in the memory location.
*/

.text


b approach1

//better since it takes less time 
//although it won't make much of a difference since we are implementing on hardware level
b approach2
approach1:
    ldr r0 , =a ;//resultant register
    ldr r6,[r0];
    ldr r5 , =b
    mov r2 , #0; //counter variable
    mov r3 , r1;
    mov r4 , #0;//ans variable
    sum:
        add r2 , r2 , #1
        add r4 , r4 , r2;
        cmp r2 , r6
        bne sum
    str r4 , [r5]
    b done

        
approach2:
    ldr r0 , =a
    ldr r4 , =b
    ldr r1 , [r0];//contains N
    add r2 , r1 , #1;// contains N+1
    mul r3 , r2 , r1 ;//r3 will pacca be even
    mov r3 , r3 , lsr#1
    str r3 , [r4]
    b done

done:
    swi 0x011
.data
a: .word 10 ;//change here to calculate various values of N
b: .word 0