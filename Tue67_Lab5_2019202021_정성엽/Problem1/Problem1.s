	AREA ARMex, CODE, READONLY
		ENTRY
		
start
	LDR SP, TEMPADDR1; //load address
	MOV R0,#10; R0=10
LOOP
	MOV R1, R0; R1=R1
	STMEA SP!,{R1};push data r1
	SUB R0, R0, #1;r0=r0-1
	CMP R0, #1;compare r0 and 0
	BEQ Done ;if equal move to Done
	B LOOP;else loop(recursion)
	
Done
	LDR SP, TEMPADDR1;load address
	LDMIA SP!, {r0};load data
	MOV R1, R0;
	
	LDMIA SP!, {r0}
	MUL R2, R1, R0;
	
	LDMIA SP!, {r0}
	MUL R3, R2, R0;
	
	LDMIA SP!, {r0}
	MUL R4, R3, R0;
	
	LDMIA SP!, {r0}
	MUL R5, R4, R0;
	
	LDMIA SP!, {r0}
	MUL R6, R5, R0;
	
	LDMIA SP!, {r0}
	MUL R7, R6, R0;
	
	LDMIA SP!, {r0}
	MUL R8, R7, R0;
	
	LDMIA SP!, {r0}
	MUL R9, R8, R0;
	
	 
	LDR R11, TEMPADDR2;
	STR R9, [R11];
	MOV pc,#0;

TEMPADDR1 & &40000000;
TEMPADDR2 & &40000
	
	END