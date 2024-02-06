;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_beep
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _BEEP_DeInit
	.globl _BEEP_Init
	.globl _BEEP_Cmd
	.globl _BEEP_LSICalibrationConfig
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	./../../lib/src/stm8s_beep.c: 54: void BEEP_DeInit(void)
;	-----------------------------------------
;	 function BEEP_DeInit
;	-----------------------------------------
_BEEP_DeInit:
;	./../../lib/src/stm8s_beep.c: 56: BEEP->CSR = BEEP_CSR_RESET_VALUE;
	mov	0x50f3+0, #0x1f
;	./../../lib/src/stm8s_beep.c: 57: }
	ret
;	./../../lib/src/stm8s_beep.c: 67: void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
;	-----------------------------------------
;	 function BEEP_Init
;	-----------------------------------------
_BEEP_Init:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_beep.c: 73: if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
	ld	a, 0x50f3
	cpl	a
	bcp	a, #0x1f
	jrne	00102$
;	./../../lib/src/stm8s_beep.c: 75: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
	ld	a, 0x50f3
	and	a, #0xe0
	ld	0x50f3, a
;	./../../lib/src/stm8s_beep.c: 76: BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
	ld	a, 0x50f3
	or	a, #0x0b
	ld	0x50f3, a
00102$:
;	./../../lib/src/stm8s_beep.c: 80: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
	ld	a, 0x50f3
	and	a, #0x3f
	ld	0x50f3, a
;	./../../lib/src/stm8s_beep.c: 81: BEEP->CSR |= (uint8_t)(BEEP_Frequency);
	ld	a, 0x50f3
	or	a, (0x01, sp)
	ld	0x50f3, a
;	./../../lib/src/stm8s_beep.c: 82: }
	pop	a
	ret
;	./../../lib/src/stm8s_beep.c: 91: void BEEP_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function BEEP_Cmd
;	-----------------------------------------
_BEEP_Cmd:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_beep.c: 96: BEEP->CSR |= BEEP_CSR_BEEPEN;
	ld	a, 0x50f3
;	./../../lib/src/stm8s_beep.c: 93: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_beep.c: 96: BEEP->CSR |= BEEP_CSR_BEEPEN;
	or	a, #0x20
	ld	0x50f3, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_beep.c: 101: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
	and	a, #0xdf
	ld	0x50f3, a
00104$:
;	./../../lib/src/stm8s_beep.c: 103: }
	pop	a
	ret
;	./../../lib/src/stm8s_beep.c: 118: void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
;	-----------------------------------------
;	 function BEEP_LSICalibrationConfig
;	-----------------------------------------
_BEEP_LSICalibrationConfig:
	sub	sp, #9
;	./../../lib/src/stm8s_beep.c: 126: lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
	ldw	x, (0x12, sp)
	pushw	x
	ldw	x, (0x12, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x01, sp), x
;	./../../lib/src/stm8s_beep.c: 130: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
	ld	a, 0x50f3
	and	a, #0xe0
	ld	0x50f3, a
;	./../../lib/src/stm8s_beep.c: 132: A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
	ldw	x, (0x01, sp)
	srlw	x
	srlw	x
	srlw	x
;	./../../lib/src/stm8s_beep.c: 134: if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
	ldw	(0x03, sp), x
	ldw	(0x08, sp), x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x05, sp), x
	ldw	y, (0x01, sp)
	subw	y, (0x05, sp)
	ldw	x, (0x08, sp)
	sllw	x
	incw	x
	pushw	x
	ldw	x, y
;	./../../lib/src/stm8s_beep.c: 130: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
	call	__mulint
	ldw	(0x07, sp), x
	ld	a, 0x50f3
	ld	(0x09, sp), a
;	./../../lib/src/stm8s_beep.c: 136: BEEP->CSR |= (uint8_t)(A - 2U);
	ld	a, (0x04, sp)
;	./../../lib/src/stm8s_beep.c: 134: if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
	ldw	x, (0x05, sp)
	cpw	x, (0x07, sp)
	jrc	00102$
;	./../../lib/src/stm8s_beep.c: 136: BEEP->CSR |= (uint8_t)(A - 2U);
	sub	a, #0x02
	or	a, (0x09, sp)
	ld	0x50f3, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_beep.c: 140: BEEP->CSR |= (uint8_t)(A - 1U);
	dec	a
	or	a, (0x09, sp)
	ld	0x50f3, a
00104$:
;	./../../lib/src/stm8s_beep.c: 142: }
	ldw	x, (10, sp)
	addw	sp, #15
	jp	(x)
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
