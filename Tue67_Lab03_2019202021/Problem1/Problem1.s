	AREA ARMex, CODE, READONLY
		ENTRY
MAIN
	LDR R0, =str1 ;load str1
	LDR R1, =str2 ;load str2
	LDR R12, TEMPADDR1 ;load TEMPADDR1
	
	MOV R11,#11 ;set value #11 first if str1 or str2 is null
	
Loop
	LDRB R2, [r0], #1 ; get r0's char
	LDRB R3, [r1], #1 ; get r1's char
	
	CMP R2, R3 ;compare
	MOVNE R11, #11 ;not equal mov #11
	BNE Finish ;Branch Finish
	
	CMP R2, #0 ;compare R2 & #0
	BEQ Finish
	CMP R3, #0 ;Compare R3 &#0
	BEQ Finish
	
	CMP R2, R3 ;Compare
	MOVEQ R11 , #10 ;if equal mov R11, #10
	
	B Loop ;if equal loop
	
Finish
	STRB R11, [R12] ;store R12's address R11's value
	
TEMPADDR1 & &00004000
str1 DCB "hello",0
str2 DCB "ajaja",0

	END