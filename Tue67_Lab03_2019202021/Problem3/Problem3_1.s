	AREA ARMex, CODE, READONLY
		ENTRY

MAIN
	
	LDR R0, TEMPADDR1 ;load TEMPADDR1
	MOV R1, #1 ;1
	LSL R2, R1, R1;2
	LSL R3, R2, R1;4
	LSL R4, R3, R1;8
	
	ADD R5, R1, R2;3
	
	ADD R6, R4,R5;11
	
	MOV R7, #1
	ADD R8, R2, R4 ; 10
	
Loop
	ADD R9, R9, R6; R9+=R6
	ADD R6, R6, R2; R6+=2 
	
	CMP R7, R8; compare
	BEQ Finish ;if equal finish
	
	ADD R7, R7, R1;R7+=1
	B Loop ;goto loop
	
Finish
	STR R9,[R0]
	
TEMPADDR1 & &00004000
	END
	