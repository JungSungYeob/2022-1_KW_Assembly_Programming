	AREA ARMex,CODE,READONLY
		ENTRY
	
start
	MOV R0, #1; R0=1
	MOV R1, #2; R1=2
	MOV R2, #3; R2=3
	MOV R3, #4; R3=4
	MOV R4, #5; R4=5
	MOV R5, #6; R5=6
	MOV R6, #7; R6=7
	MOV R7, #8; R7=8
	
	LDR SP, TEMPADDR1 ; LOAD SP from TEMPADDR1
	
	STMEA SP!,{R2}; Push R2
	STMEA SP!,{R0}; Push R0
	STMEA SP!,{R3}; Push R3
	STMEA SP!,{R5-R7}; Push R5~R7
	STMEA SP!, {R1}; Push R1
	STMEA SP!, {R4}; Push R4
	
	LDR SP, TEMPADDR1 ; LOAD SP from TEMPADDR1
	LDMIA SP, {r0-r7}; POP R0~R7 to memory address TEMPADDR1 
	
TEMPADDR1 & &00040000
	END