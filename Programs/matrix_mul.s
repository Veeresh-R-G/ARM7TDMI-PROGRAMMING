/*

Program for Matrix Multiplication

Just for reference :
    Available registers -- r0 to r12
*/


.text

ldr r0 , =a ;//A matrix address
ldr r1 , =b ;//B matrix address


ldr r7 , =c ;// Resultant matrix

mov r2,  r0 ;// Storing A matrix address
mov r3,  r1 ; //Storing B matrix address


mov r10,  r0 ; //Storing A matrix address
mov r12,  r1 ; //Storing B matrix address

mov r4 , #0 ; //Temp Variable

mov r5 , #0 ; //counter variable for outerLoop
mov r6 , #0 ; //counter variable for innerLoop
mov r11 , #0 ; //counter variable for MulLoop

b outerLoop

outerLoop:
    add r5 , r5 , #1 ; //incrementing counter variable
    
    innerLoop:
        mov r0 , r2; //copying address of r2 for mat-1
        mov r1 , r3; //copying address of r3 for mat-2
        add r6 ,r6 , #1

        mulLoop:
            ; //mov r0 , r2;
            ; //mov r1 , r3
            
            add r11 ,r11 , #1 ; //incrementing counter for innerLoop
            
            ldr r8 ,[r0] ; //value of mat - 1 element 
            ldr r9 ,[r1]  ; //value of mat - 2 element

            add r0 , r0 , #4; // incrementing r1 address
            add r1 , r1 , #12; // incrementing r1 address        

            mla r4 , r8 , r9 , r4 ; // r4 = r4 + r8 * r9 + r4
            cmp r11 , #3 ;
            bne mulLoop

        mov r11 , #0
        str r4 , [r7]
        add r7 , r7 , #4


        mov r0 , r2
        add r3 , r3 , #4
        mov r1 , r3 
        cmp r6 , #3
        mov r4 , #0
        bne innerLoop

    add r10 , r10 , #12
    mov r2 , r10 
    mov r3 , r12
    cmp r5 , #3
    mov r6 ,#0
    bne outerLoop
    b done



done:
    swi 0x011



.data
a: .word 1,2,3,4,5,6,7,8,9
b: .word 1,2,3,4,5,6,7,8,9
c: .word 0,0,0,0,0,0,0,0,0