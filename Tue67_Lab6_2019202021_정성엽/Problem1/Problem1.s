	AREA ARMex,CODE,READONLY
		ENTRY
start
	LDR R0, FLTPT1; 32bit hexadecimal floating point number1
	LDR R1, FLTPT2; 32bit hexadecimal floating point number2
	
	mov r2,r0,lsl #1; remove sign bit
	mov r2,r2,lsr #24; get exponent bit
	
	mov r3,r1,lsl #1; remove sign bit
	mov r3,r3,lsr #24; get exponent bit
	
	mov r4,r0,lsl #9; remove sign and exponent bit
	mov r4,r4,lsr #9; get Mantissa bit
	add r4,r4,#8388608; add 1 first of  mantissa bit 
	
	mov r5,r1,lsl #9; remove sign and exponent bit
	mov r5,r5,lsr #9; get Mantissa bit
	add r5,r5,#8388608; add 1 fisrt of mantissa bit
	
	cmp r2,r3; compare exponent bit
	BEQ CHECK; if equal goto check
	BGT LEFT; if r2>r3 goto left
	BLT RIGHT; if r2<r3 goto right

CHECK
	MOV R6, R0, LSR #31; get sign bit
	MOV R7, R1, LSR #31; get sign bit
	cmp R6, R7;compare 2 sign bit
	BEQ EQUAL; if equal goto equal
	B NOTEQUAL;else goto noteqaul

EQUAL
	ADD R12, R4, R5;sum of mantissa
	B NORMAL;goto normalize

NOTEQUAL
	cmp r4,r5; compare mantissa
	SUBGT R12, r4,r5; if r4>r5 r12=r4-r5
	MOVLT R6, R7; if r4<r5 change sign bit like r7
	SUBLT R12, r5,r4; if r4<r5 r12=r5-r4
	B NORMAL; goto normalize
	
LEFT
	sub r10, r2,r3; r10=r2-r3
	LSR r5, r10;shift to right 
	MOV R13, r2;R13=r2 exponent
	B CHECK;goto check

RIGHT
	sub r10, r3,r2; r10=r3-r2
	LSR r4,r10;shift to right
	MOV R13, r3;R13=r3 exponent
	B CHECK;goto check
	
NORMAL
	cmp R12, #0; compare R12 and 0
	BEQ FINISH; if equal goto finish
	
	cmp R12, #15728640;if over
	LSRGT R12, #1;shift to right 
	ADDGT r13, r13, #1;plus 1 to exponent
	BGT NORMAL;return to normalize
	
	cmp R12, #8388608;if under
	LSLLT R12, #1;shift to left
	SUBLT r13, r13, #1;minus 1 to exponent
	BLT NORMAL;return to normalize
	
FINISH
	LSL r13, #23;shift to left exponent
	cmp R12, #0;check exponent zero
	BEQ RESULT;if equal goto result
	
	SUBNE R12, #8388608;minus 1 first of mantissa bit
	
	ADD R12, R12, r13;add mantissa and exponent
	
	cmp R12, #0;chech exception
	BEQ RESULT;if equal goto result
	
	cmp R6, #0; if R6>0 check sign bit
	ADDGT R12, 0x80000000; minus bit
	
RESULT
	LDR R11, TEMPADDR1;load tempaddr1 address
	STR R12,[R11];store result
	
	
	
	
	
	
TEMPADDR1 & &00040000
;+ +
;FLTPT1 DCD 0x3FC00000;1.5
;FLTPT2 DCD 0x40500000;3.25

;- - 
;FLTPT1 DCD 0xC1240000;-10.25
;FLTPT2 DCD 0xC26C0000; -59
	
;+ -
;FLTPT1 DCD 0x3FC00000;1.5
;FLTPT2 DCD 0xC1240000; -10.25

;- +
;FLTPT1 DCD 0xC26C0000; -59
;FLTPT2 DCD 0x40500000;3.25

;same num
FLTPT1 DCD 0x426C0000; 59
FLTPT2 DCD 0xC26C0000; -59
	END