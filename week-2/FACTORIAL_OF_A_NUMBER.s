//TO FIND THE FACTORIAL OF A NUMBER
.TEXT
MOV R0,#5 //THE NUMBER WHOSE FACTORIAL NEEDS TO BE FOUND
MOV R1,#1 //RESULT REG
LOOP:
MUL R1,R0,R1
SUB R0,R0,#1
CMP R0,#0
BNE LOOP