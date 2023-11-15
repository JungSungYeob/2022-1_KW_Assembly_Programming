	AREA ARMex, CODE, READONLY
		ENTRY

MAIN
	LDR R0, =Array ;load Array
	LDR R1, TEMPADDR1;load TEMPADDR1
	
	MOV R12, #9 ;MOV R12 #9 for count
	
Loop

	LDRB R2, [R0,R12] ;load R0~R0+9 to R2
	
	STRB R2, [R1], #1 ; store R2's char to R1 and move 1
	
	SUB R12, R12, #1 ; R12-=1
	
	CMP R12, #0;compare r12 #0 to finish
	BLT Finish ;goto Finish
	
	B Loop ;goto loop
	
Finish

	
TEMPADDR1 & &00004000

Array DCB 10,9,8,7,6,5,4,3,2,1,0

	END
		