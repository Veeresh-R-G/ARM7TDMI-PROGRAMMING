/*

Convert the following statement in C language into an ALP using ARM7TDMI – ISA.
      IF([A]==[B]) then C=[A]+[B];
      ELSE IF ([B]==[C]) D=[A]-[B];
      ELSE E=[A]*[B]


*/
.text
ldr r0 ,=a
ldr r1 ,=b
ldr r2 ,=c
ldr r7 ,=d


ldr r3 , [r0]
ldr r4 , [r1]
ldr r5 , [r2]

b IF

IF:
    cmp r3 , r4
    bne ELSEIF
    add r6 , r3 , r4
    str r6 , [r7]
    b done

ELSEIF:
    cmp r4 ,r5
    bne ELSE
    sub r6 , r3 , r4
    str r6 , [r7]
    b done

ELSE:
    mul r6 , r3 , r4
    str r6 , [r7]
    b done

done:
    swi 0x001
.data
;//change values of a , b to see the variations in the program executions
a: .word 10
b: .word 10
c: .word 20
d: .word 0 ;// storing in D only