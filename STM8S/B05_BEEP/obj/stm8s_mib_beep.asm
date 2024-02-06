;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_mib_beep
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _mib_printf
	.globl _FLASH_ProgramOptionByte
	.globl _FLASH_ReadByte
	.globl _FLASH_Unlock
	.globl _fnBeepStart
	.globl _calConfigBEEP
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
;	./../../mib/stm8s_mib_beep.c: 45: void fnBeepStart(uint16_t vwFreq,uint16_t vwDelay) // msec... 
;	-----------------------------------------
;	 function fnBeepStart
;	-----------------------------------------
_fnBeepStart:
	sub	sp, #2
	ldw	(0x01, sp), x
;	./../../mib/stm8s_mib_beep.c: 58: UCOM_BEEP_GPIO->DDR |= (UCOM_BEEP_PIN); /* Set Output mode */
	bset	0x5011, #4
;	./../../mib/stm8s_mib_beep.c: 59: UCOM_BEEP_GPIO->CR1 |= (UCOM_BEEP_PIN);	/* Pull-Up or Push-Pull */
	bset	0x5012, #4
;	./../../mib/stm8s_mib_beep.c: 60: UCOM_BEEP_GPIO->CR2 |= (UCOM_BEEP_PIN);	/* Output speed up to 10 MHz */
	bset	0x5013, #4
;	./../../mib/stm8s_mib_beep.c: 61: UCOM_BEEP_GPIO->ODR &= ~(UCOM_BEEP_PIN); // low... 
	ld	a, 0x500f
	and	a, #0xef
	ld	0x500f, a
;	./../../mib/stm8s_mib_beep.c: 66: if(FLASH_ReadByte(OPT2_REG)!=AFR7_BIT) 
	push	#0x03
	push	#0x48
	clrw	x
	pushw	x
	call	_FLASH_ReadByte
	cp	a, #0x80
	jreq	00102$
;	./../../mib/stm8s_mib_beep.c: 68: FLASH_Unlock(FLASH_MEMTYPE_DATA); 
	ld	a, #0xf7
	call	_FLASH_Unlock
;	./../../mib/stm8s_mib_beep.c: 70: FLASH_ProgramOptionByte(OPT2_REG,AFR7_BIT); 
	ld	a, #0x80
	ldw	x, #0x4803
	call	_FLASH_ProgramOptionByte
00102$:
;	./../../mib/stm8s_mib_beep.c: 78: calConfigBEEP(vwFreq);
	ldw	x, (0x01, sp)
	call	_calConfigBEEP
;	./../../mib/stm8s_mib_beep.c: 83: BEEP->CSR |= BEEP_CSR_BEEPEN;
	ld	a, 0x50f3
	or	a, #0x20
	ld	0x50f3, a
;	./../../mib/stm8s_mib_beep.c: 87: if(vwDelay!=0)
	ldw	x, (0x05, sp)
	jreq	00110$
;	./../../mib/stm8s_mib_beep.c: 90: gwMibMiliSec = vwDelay;
	ldw	x, (0x05, sp)
	ldw	_gwMibMiliSec+0, x
;	./../../mib/stm8s_mib_beep.c: 91: do {
00105$:
;	./../../mib/stm8s_mib_beep.c: 92: if(gwMibMiliSec==0)
	ldw	x, _gwMibMiliSec+0
	jrne	00105$
;	./../../mib/stm8s_mib_beep.c: 95: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
	ld	a, 0x50f3
	and	a, #0xdf
	ld	0x50f3, a
;	./../../mib/stm8s_mib_beep.c: 98: } while(1);
00110$:
;	./../../mib/stm8s_mib_beep.c: 100: }
	ldw	x, (3, sp)
	addw	sp, #6
	jp	(x)
;	./../../mib/stm8s_mib_beep.c: 114: void calConfigBEEP(uint16_t vwFreq) // msec... 
;	-----------------------------------------
;	 function calConfigBEEP
;	-----------------------------------------
_calConfigBEEP:
	sub	sp, #7
	exgw	x, y
;	./../../mib/stm8s_mib_beep.c: 117: uint8_t vbBEEPDIV = 0;
	clr	(0x05, sp)
;	./../../mib/stm8s_mib_beep.c: 118: uint32_t vdwData = vwFreq;
	ldw	(0x03, sp), y
	clrw	x
	ldw	(0x01, sp), x
;	./../../mib/stm8s_mib_beep.c: 121: if(vwFreq<500)
	ldw	(0x06, sp), y
	ldw	x, y
	cpw	x, #0x01f4
	jrnc	00111$
;	./../../mib/stm8s_mib_beep.c: 124: vbBEEPSEL = 0xFF;
	ld	a, #0xff
	ld	(0x06, sp), a
	jp	00112$
00111$:
;	./../../mib/stm8s_mib_beep.c: 126: else if(vwFreq<1000)
	ldw	x, (0x06, sp)
	cpw	x, #0x03e8
	jrnc	00108$
;	./../../mib/stm8s_mib_beep.c: 128: vbBEEPSEL = 0x00; // f / (8 * div) khz
	clr	(0x06, sp)
;	./../../mib/stm8s_mib_beep.c: 129: vdwDiv = (128000 / 8) / vdwData;
	pushw	y
	ldw	x, (0x05, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	push	#0x80
	push	#0x3e
	clrw	x
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x04, sp), y
	ld	a, xl
	popw	y
;	./../../mib/stm8s_mib_beep.c: 130: vbBEEPDIV =  vdwDiv - 2;
	sub	a, #0x02
	ld	(0x05, sp), a
;	./../../mib/stm8s_mib_beep.c: 131: vdwDataLast = (128000 / 8) / vdwDiv;
	jra	00112$
00108$:
;	./../../mib/stm8s_mib_beep.c: 133: else if(vwFreq<2000)
	ldw	x, (0x06, sp)
	cpw	x, #0x07d0
	jrnc	00105$
;	./../../mib/stm8s_mib_beep.c: 135: vbBEEPSEL = 0x01; // f / (4 * div) khz
	ld	a, #0x01
	ld	(0x06, sp), a
;	./../../mib/stm8s_mib_beep.c: 136: vdwDiv = (128000 / 4) / vdwData;
	pushw	y
	ldw	x, (0x05, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	push	#0x00
	push	#0x7d
	clrw	x
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x04, sp), y
	ld	a, xl
	popw	y
;	./../../mib/stm8s_mib_beep.c: 137: vbBEEPDIV =  vdwDiv - 2;
	sub	a, #0x02
	ld	(0x05, sp), a
;	./../../mib/stm8s_mib_beep.c: 138: vdwDataLast = (128000 / 8) / vdwDiv;
	jra	00112$
00105$:
;	./../../mib/stm8s_mib_beep.c: 140: else if(vwFreq<32000)
	ldw	x, (0x06, sp)
	cpw	x, #0x7d00
	jrnc	00102$
;	./../../mib/stm8s_mib_beep.c: 142: vbBEEPSEL = 0x02; // f / (2 * div) khz
	ld	a, #0x02
	ld	(0x06, sp), a
;	./../../mib/stm8s_mib_beep.c: 143: vdwDiv = (128000 / 2) / vdwData;
	pushw	y
	ldw	x, (0x05, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	push	#0x00
	push	#0xfa
	clrw	x
	pushw	x
	call	__divulong
	addw	sp, #8
	rlwa	x
	ld	(0x06, sp), a
	rrwa	x
	ldw	(0x04, sp), y
	ld	a, xl
	popw	y
;	./../../mib/stm8s_mib_beep.c: 144: vbBEEPDIV =  vdwDiv - 2;
	sub	a, #0x02
	ld	(0x05, sp), a
;	./../../mib/stm8s_mib_beep.c: 145: vdwDataLast = (128000 / 8) / vdwDiv;
	jra	00112$
00102$:
;	./../../mib/stm8s_mib_beep.c: 150: vbBEEPSEL = 0xFF;
	ld	a, #0xff
	ld	(0x06, sp), a
00112$:
;	./../../mib/stm8s_mib_beep.c: 152: if(vbBEEPSEL!=0xFF)
	ld	a, (0x06, sp)
	inc	a
	jreq	00114$
;	./../../mib/stm8s_mib_beep.c: 154: ccprintf(_DEBUG_BEEP_A_, ("beep init [%d : SEL(%d) : DIV(%d)] Hz\r\n",vwFreq,vbBEEPSEL,vbBEEPDIV));		
	clrw	x
	ld	a, (0x05, sp)
	ld	xl, a
	ld	a, (0x06, sp)
	ld	(0x04, sp), a
	clr	(0x03, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	pushw	y
	push	#<(__str_0+0)
	push	#((__str_0+0) >> 8)
	call	_mib_printf
	addw	sp, #8
;	./../../mib/stm8s_mib_beep.c: 157: BEEP->CSR  = BEEP_CSR_BEEPDIV;
	mov	0x50f3+0, #0x1f
;	./../../mib/stm8s_mib_beep.c: 159: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
	ld	a, 0x50f3
	and	a, #0xe0
	ld	0x50f3, a
;	./../../mib/stm8s_mib_beep.c: 160: BEEP->CSR |= (vbBEEPDIV & BEEP_CSR_BEEPDIV);
	ld	a, 0x50f3
	ld	(0x07, sp), a
	ld	a, (0x05, sp)
	and	a, #0x1f
	or	a, (0x07, sp)
	ld	0x50f3, a
;	./../../mib/stm8s_mib_beep.c: 164: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
	ld	a, 0x50f3
	and	a, #0x3f
	ld	0x50f3, a
;	./../../mib/stm8s_mib_beep.c: 165: BEEP->CSR |= (uint8_t)((vbBEEPSEL&0x03)<<6);
	ld	a, 0x50f3
	ld	(0x07, sp), a
	ld	a, (0x06, sp)
	and	a, #0x03
	swap	a
	and	a, #0xf0
	sll	a
	sll	a
	or	a, (0x07, sp)
	ld	0x50f3, a
	jra	00116$
00114$:
;	./../../mib/stm8s_mib_beep.c: 170: BEEP->CSR  = BEEP_CSR_BEEPDIV;
	mov	0x50f3+0, #0x1f
;	./../../mib/stm8s_mib_beep.c: 171: ccprintf(_DEBUG_BEEP_A_, ("beep init error... [%d] Hz\r\n",vwFreq));		
	pushw	y
	push	#<(__str_1+0)
	push	#((__str_1+0) >> 8)
	call	_mib_printf
	addw	sp, #4
00116$:
;	./../../mib/stm8s_mib_beep.c: 173: }
	addw	sp, #7
	ret
	.area CODE
	.area CONST
	.area CONST
__str_0:
	.ascii "beep init [%d : SEL(%d) : DIV(%d)] Hz"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_1:
	.ascii "beep init error... [%d] Hz"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
