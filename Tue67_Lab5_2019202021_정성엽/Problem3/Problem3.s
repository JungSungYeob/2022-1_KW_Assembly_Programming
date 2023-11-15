	AREA ARMex, CODE, READONLY
		ENTRY
start
	MOV R0, #10;R0=10
	MOV R1, #11;R1=11
	MOV R2, #12;R2=12
	MOV R3, #13;R3=13
	MOV R4, #14;R4=14
	MOV R5, #15;R5=15
	MOV R6, #16;R6=16
	MOV R7, #17;R7=17
	MOV R8, #160;R8=160
	MOV R11, R4; R11= R4
	LDR R9, TEMPADDR1;//load TEMPADDR1
	STMIA R9,{R0-R7}; //store first value
	
	BL doRegister; move to doRegister label
	BL doGCD;move to doGCD label
	
	LDR R10, TEMPADDR1; load memory address
	STR R12, [R10], #4; store GCD Value
	ADD R0, R0, R11; ADD num
	ADD R1, R1, R11; ADD num
	ADD R2, R2, R11; ADD num
	ADD R3, R3, R11; ADD num
	ADD R4, R4, R11; ADD num
	ADD R5, R5, R11; ADD num
	ADD R6, R6, R11; ADD num
	ADD R7, R7, R11; ADD num
	STMIA R10!,{R0-R7};//store regiser value
	B Done ; goto Done
	
doRegister
	LDR SP, TEMPADDR2 ; LOAD SP from TEMPADDR2
	
	STMEA SP!,{R2}; Push R2
	STMEA SP!,{R0}; Push R0
	STMEA SP!,{R3}; Push R3
	STMEA SP!,{R5-R7}; Push R5~R7
	STMEA SP!, {R1}; Push R1
	STMEA SP!, {R4}; Push R4
	
	LDR SP, TEMPADDR2 ; LOAD SP from TEMPADDR2
	LDMIA SP, {r0-r7}; POP R0~R7 to memory address TEMPADDR2

	ADD R1, R1, #1;add 1
	ADD R2, R2, #2;add 2
	ADD R3, R3, #3;add 3
	ADD R4, R4, #4;add 4
	ADD R5, R5, #5;add 5
	ADD R6, R6, #6;add 6
	ADD R7, R7, #7;add 7
	
	;sum of R0~R7
	MOV R12, R0;
	ADD R12, R12, R1;
	ADD R12, R12, R2;
	ADD R12, R12, R3;
	ADD R12, R12, R4;
	ADD R12, R12, R5;
	ADD R12, R12, R6;
	ADD R12, R12, R7;
	BX lr; //return lr
	
doGCD
	CMP R8,R12; compare R8 and R12
	SUBLT R12, R12, R8; if R8>R12
	BLT doGCD;
	
	SUBGT R8, R8, R12;if R12>R8
	BGT doGCD;
	
	BXEQ lr; if equal return lr
	
	
	
TEMPADDR1 & &40000
TEMPADDR2 & &40000000

Done
	END