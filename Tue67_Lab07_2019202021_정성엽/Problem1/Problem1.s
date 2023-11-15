cr equ 0x0d ; typedef cr = 0x0d
	
	area ARMex, CODE, READONLY
		entry

start
	NOP
	ADR R0, STR1; get STR1's address to get value
	LDR R1, STR2; save to STR2's address
	NOP
	
LOOP
	LDRB R2, [R0], #1;get R0's 1byte to R2
	CMP R2, #cr; compare R2 and cr(0x0d)
	BEQ Finish;goto Finish
	
	STRB R2, [R1], #1; //store R2's 1byte to R1 address
	B LOOP;goto Loop


Finish
	MOV R2, #cr; ; R2 = cr(0x0d)
	STRB R2,[R1],#1 ; store cr 0x0d R3 
	;mov pc,#0

STR1
	ALIGN
	DCB "ASSEMBLY",cr ;  source in cpy
			
		
STR2 & &00040000; save copy data in address
	END
