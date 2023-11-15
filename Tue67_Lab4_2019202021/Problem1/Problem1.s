	AREA ARMex, CODE, READONLY
		ENTRY
	
MAIN
	ldr r12, TEMPADDR1;
	
	mov r0, #1; r0=1
	
	add r1,r0,lsl #1; r1=1*2=2
	
	add r2,r1,r1,lsl #1; r2=r1+r1*2=2+2*2=6
	
	add r3,r2,lsl #2;  r3 = r2*4 = 6*4 =24
	
	add r4,r3,r3, lsl #2; r4 = r3+r3*4=24+24*4 = 120
	
	add r5,r4,lsl #1; r5 = r4*2=240
	add r5,r5,r5,lsl #1; r5 = 240+240*2=720
	
	rsb r6,r5,r5,lsl #3; r6 = 720*8-720=5040
	
	mov r7, r6,lsl #3; r7 = r6*8=5040 * 8 = 40320
	
	add r8,r7,r7,lsl #3; r8 = r7+ r7*8 = 40320+40320*8=362880
	
	add r9,r8,lsl #1; r9 = r8 * 2 = 725760
	add R9,r9,r9,lsl #2; r9 = r9+r9*4 = 3628800
	
	str r0, [r12], #4 ;store r0 to r12 memory 0x40000
	str r1, [r12], #4 ;store r1 to r12 memory 0x40004
	str r2, [r12], #4 ;store r2 to r12 memory 0x40008
	str r3, [r12], #4 ;store r3 to r12 memory 0x4000C
	str r4, [r12], #4 ;store r4 to r12 memory 0x40010
	str r5, [r12], #4 ;store r5 to r12 memory 0x40014
	str r6, [r12], #4 ;store r6 to r12 memory 0x40018
	str r7, [r12], #4 ;store r7 to r12 memory 0x4001C
	str r8, [r12], #4 ;store r8 to r12 memory 0x40020
	str r9, [r12], #4 ;store r9 to r12 memory 0x40024
	
	
TEMPADDR1 & &40000
	END