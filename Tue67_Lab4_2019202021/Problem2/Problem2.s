	AREA ARMex, CODE, READONLY
		ENTRY

MAIN
	ldr r12, TEMPADDR1
	
	mov r0,#1;
	mov r10, #1;
	
	add r10, r10,#1; 2
	mul r1, r0, r10; 1*2 =2
	
	add r10, r10,#1; 3
	mul r2, r1, r10; 2*3=6
	
	add r10, r10,#1; 4
	mul r3, r2, r10; 6*4=24
	
	add r10, r10,#1; 5
	mul r4, r3, r10; 24*5 =120
	
	add r10, r10,#1; 6
	mul r5, r4, r10; 120*6=720
	
	add r10, r10,#1; 7
	mul r6, r5, r10; 720*7=5040
	
	add r10, r10,#1; 8
	mul r7, r6, r10; 5040*8=40320
	
	add r10, r10,#1; 9
	mul r8, r7, r10; 40320*9=362880
	
	add r10, r10,#1; 10
	mul r9, r8, r10; 362880 * 10 = 3628800
	
	
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