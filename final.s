     PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION
		VMOV.F32 S10, #6		; S10 = x = 6
        VMOV.F32 S0, S10		; numerator
		VMOV.F32 S1, #1			; denominator
		VMOV.F32 S14, #1		; to calculate factorial
		VMOV.F32 S2, #1			; answer will be stored here
		MOV R1, #1 				; initial value of counter
		MOV R2, #20				; number of iteration
		VMOV.F32 S4, #1			; used to increment S14 by 1
		
while	CMP R1, R2
		IT GT
		BGT loop				; in loop
		VDIV.F32 S3, S0, S1 	; S3 = S0 / S1
		VADD.F32 S2, S2, S3 	; S2 = S2 + S3
		VMUL.F32 S0, S0, S10 	; S0 = S0 * S10
		VADD.F32 S14, S14, S4 	; increment s14
		VMUL.F32 S1, S1, S14	; S1 = S1 * S14
		ADD R1, R1, #1 			; increment iteration
		B while
loop	B loop 					
	ENDFUNC

	END