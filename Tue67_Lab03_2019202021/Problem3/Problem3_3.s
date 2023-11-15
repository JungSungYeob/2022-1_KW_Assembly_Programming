	AREA ARMex, CODE, READONLY
		ENTRY

MAIN

	LDR R0, TEMPADDR1 ; LOAD TEMPADDR1
	MOV R1, #1 ;1
	LSL R2, R1, R1;2
	LSL R3, R2, R2;8
	
	ADD R4, R1, R2;3
	ADD R5, R3, R4;11
	
	MOV R6, #1 ;for count 
	
Loop
	ADD R7, R7, R5 ;R7+=R5
	ADD R5, R5, R2 ;R5+=R2
	
	ADD R7, R7, R5;R7+=R5
	ADD R5, R5, R2;R5+=R2
	
	ADD R7, R7, R5;R7+=R5
	ADD R5, R5, R2;R5+=R2
	
	ADD R7, R7, R5;R7+=R5
	ADD R5, R5, R2;R5+=R2
	
	ADD R7, R7, R5;R7+=R5
	ADD R5, R5, R2;R5+=R2
	
	CMP R6, R2 ; compare to loop
	BEQ Finish ;if not equal goto Finish
	ADD R6, R6, R1;R6+=R1
	B Loop;goto Loop
	
Finish
	STR R7, [R0];store R7's value to R0's address
	
TEMPADDR1 & &00004000
	END