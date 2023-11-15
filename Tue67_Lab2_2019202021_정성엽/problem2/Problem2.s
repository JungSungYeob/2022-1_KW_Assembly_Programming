	AREA ARMex, CODE, READONLY
	ENTRY
start
	;Set Register value
	MOV r0,#1
	MOV r1,#2
	MOV r2,#3
	MOV r3,#4
	;Load Memory address
	LDR r12, TEMPADDR1
	;store register values for memory sequence by little-endian
	STRB r0, [r12, #0]
	STRB r1, [r12, #1]
	STRB r2, [r12, #2]
	STRB r3, [r12, #3]
	;load from memory to register r5
	LDR r5, [r12]
	;store register values for memory sequence by little-endian
	STRB r0, [r12,#3]
	STRB r1, [r12,#2]
	STRB r2, [r12,#1]
	STRB r3, [r12,#0]
	;load from memory to register r6
	LDR r6, [r12]
	
;set memory address
TEMPADDR1 & &40000000
	;MOV pc,lr
	END