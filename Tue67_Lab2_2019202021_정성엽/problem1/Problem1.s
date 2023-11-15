	AREA ARMex, CODE, READONLY
	ENTRY
start
	;set random value
	MOV r0, #15
	MOV r1, #10
	MOV r2, #1
	;set memory address and set initial value
	LDR r12,TEMPADDR1
	MOV r3, #17
	STRB r3,[r12,#0]
	;store r0~r2 register value to each byte
	STRB r0,[r12,#0]
	STRB r1,[r12,#1]
	STRB r2,[r12,#2]
	;load from memory into register r4
	LDRB r4,[r12],#1
	;compare r4 and decimal 10
	CMP r4,#10
	MOVEQ R5, #3;if equal, r5=3
	MOVLT R5, #2;if "<", r5=2
	MOVGT R5, #1;if ">", r5=1
	;load from memory into register r4
	LDRB r4,[r12],#1
	;compare r4 and decimal 10
	CMP r4,#10
	MOVEQ R5, #3;if equal, r5=3
	MOVLT R5, #2;if "<", r5=2
	MOVGT R5, #1;if ">", r5=1
	;load from memory into register r4
	LDRB r4,[r12]
	;compare r4 and decimal 10
	CMP r4,#10
	MOVEQ R5, #3;if equal, r5=3
	MOVLT R5, #2;if "<", r5=2
	MOVGT R5, #1;if ">", r5=1
;set TEMPADDR1's address
TEMPADDR1 & &00001000

	;MOV pc,lr

	END