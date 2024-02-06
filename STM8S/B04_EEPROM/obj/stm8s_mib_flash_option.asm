;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_mib_flash_option
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _mmFlashOptionUnlock
	.globl _mmFlashOptionLock
	.globl _mmFlashOptionWrite
	.globl _mmFlashOptionRead
	.globl _mmFlashOptionErase
	.globl _FlashOptionWaitForLastOperation
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
;	./../../mib/stm8s_mib_flash_option.c: 66: uint8_t mmFlashOptionUnlock(void) 
;	-----------------------------------------
;	 function mmFlashOptionUnlock
;	-----------------------------------------
_mmFlashOptionUnlock:
	sub	sp, #3
;	./../../mib/stm8s_mib_flash_option.c: 68: volatile uint16_t vwDelay = 0x7fff;
	ldw	x, #0x7fff
	ldw	(0x01, sp), x
;	./../../mib/stm8s_mib_flash_option.c: 69: volatile uint8_t DataUnlocked = 0;
	clr	(0x03, sp)
;	./../../mib/stm8s_mib_flash_option.c: 72: while( DataUnlocked == 0 )
00104$:
	tnz	(0x03, sp)
	jrne	00106$
;	./../../mib/stm8s_mib_flash_option.c: 74: FLASH->DUKR=0xAE;
	mov	0x5064+0, #0xae
;	./../../mib/stm8s_mib_flash_option.c: 75: FLASH->DUKR=0x56;
	mov	0x5064+0, #0x56
;	./../../mib/stm8s_mib_flash_option.c: 77: DataUnlocked = (uint8_t)FLASH->IAPSR;	
	ld	a, 0x505f
;	./../../mib/stm8s_mib_flash_option.c: 78: DataUnlocked &= FLASH_IAPSR_DUL;
	ld	(0x03, sp), a
	and	a, #0x08
	ld	(0x03, sp), a
;	./../../mib/stm8s_mib_flash_option.c: 79: if(vwDelay) vwDelay--;
	ldw	x, (0x01, sp)
	jreq	00102$
	ldw	x, (0x01, sp)
	decw	x
	ldw	(0x01, sp), x
	jra	00104$
00102$:
;	./../../mib/stm8s_mib_flash_option.c: 82: return 0;
	clr	a
;	./../../mib/stm8s_mib_flash_option.c: 85: return 1;
	.byte 0xc5
00106$:
	ld	a, #0x01
00107$:
;	./../../mib/stm8s_mib_flash_option.c: 86: }
	addw	sp, #3
	ret
;	./../../mib/stm8s_mib_flash_option.c: 96: void mmFlashOptionLock(void) 
;	-----------------------------------------
;	 function mmFlashOptionLock
;	-----------------------------------------
_mmFlashOptionLock:
;	./../../mib/stm8s_mib_flash_option.c: 99: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);  // FLASH_MEMTYPE_DATA      = (uint8_t)0xF7  /*!< Data EEPROM memory */ FLASH_IAPSR_DUL
	bres	0x505f, #3
;	./../../mib/stm8s_mib_flash_option.c: 100: }
	ret
;	./../../mib/stm8s_mib_flash_option.c: 111: uint8_t mmFlashOptionWrite(uint16_t vbAddress,uint8_t vbData) 
;	-----------------------------------------
;	 function mmFlashOptionWrite
;	-----------------------------------------
_mmFlashOptionWrite:
	sub	sp, #5
	ld	(0x05, sp), a
;	./../../mib/stm8s_mib_flash_option.c: 114: if(vbAddress > OPTION_BYTE_END_PHYSICAL_ADDRESS)
	cpw	x, #0x487f
	jrule	00104$
;	./../../mib/stm8s_mib_flash_option.c: 116: return 0; // false...
	clr	a
	jra	00114$
00104$:
;	./../../mib/stm8s_mib_flash_option.c: 118: else if(vbAddress < OPTION_BYTE_START_PHYSICAL_ADDRESS)
	cpw	x, #0x4800
	jrnc	00105$
;	./../../mib/stm8s_mib_flash_option.c: 120: return 0; // false...
	clr	a
	jra	00114$
00105$:
;	./../../mib/stm8s_mib_flash_option.c: 123: if((FLASH->IAPSR & FLASH_IAPSR_DUL)==0)
	btjt	0x505f, #3, 00107$
;	./../../mib/stm8s_mib_flash_option.c: 125: return 0; // false...
	clr	a
	jra	00114$
00107$:
;	./../../mib/stm8s_mib_flash_option.c: 129: FLASH->CR2 |= FLASH_CR2_OPT;
	bset	0x505b, #7
;	./../../mib/stm8s_mib_flash_option.c: 130: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
	bres	0x505c, #7
;	./../../mib/stm8s_mib_flash_option.c: 133: if(vbAddress == 0x4800)
	ldw	(0x01, sp), x
;	./../../mib/stm8s_mib_flash_option.c: 136: *((NEAR uint8_t*)vbAddress) = vbData;
	ldw	(0x03, sp), x
;	./../../mib/stm8s_mib_flash_option.c: 133: if(vbAddress == 0x4800)
	ldw	x, (0x01, sp)
	cpw	x, #0x4800
	jrne	00109$
;	./../../mib/stm8s_mib_flash_option.c: 136: *((NEAR uint8_t*)vbAddress) = vbData;
	ldw	x, (0x03, sp)
	ld	a, (0x05, sp)
	ld	(x), a
	jra	00110$
00109$:
;	./../../mib/stm8s_mib_flash_option.c: 141: *((NEAR uint8_t*)vbAddress) = vbData;
	ldw	x, (0x03, sp)
	ld	a, (0x05, sp)
	ld	(x), a
;	./../../mib/stm8s_mib_flash_option.c: 142: *((NEAR uint8_t*)((uint16_t)(vbAddress + 1))) = (uint8_t)(~vbData);
	ldw	x, (0x01, sp)
	incw	x
	ld	a, (0x05, sp)
	cpl	a
	ld	(x), a
00110$:
;	./../../mib/stm8s_mib_flash_option.c: 147: vbRet = FlashOptionWaitForLastOperation(FLASH_MEMTYPE_PROG);
	ld	a, #0xfd
	call	_FlashOptionWaitForLastOperation
	ld	xl, a
;	./../../mib/stm8s_mib_flash_option.c: 148: if((vbRet==0) || (vbRet==2))
	tnz	a
	jreq	00111$
	ld	a, xl
	cp	a, #0x02
	jrne	00112$
00111$:
;	./../../mib/stm8s_mib_flash_option.c: 150: return 0; // false...
	clr	a
	jra	00114$
00112$:
;	./../../mib/stm8s_mib_flash_option.c: 155: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
	bres	0x505b, #7
;	./../../mib/stm8s_mib_flash_option.c: 156: FLASH->NCR2 |= FLASH_NCR2_NOPT;
	bset	0x505c, #7
;	./../../mib/stm8s_mib_flash_option.c: 157: return 1; // true...
	ld	a, #0x01
00114$:
;	./../../mib/stm8s_mib_flash_option.c: 158: }
	addw	sp, #5
	ret
;	./../../mib/stm8s_mib_flash_option.c: 169: uint16_t mmFlashOptionRead(uint16_t vbAddress)
;	-----------------------------------------
;	 function mmFlashOptionRead
;	-----------------------------------------
_mmFlashOptionRead:
	sub	sp, #5
;	./../../mib/stm8s_mib_flash_option.c: 175: if(vbAddress > OPTION_BYTE_END_PHYSICAL_ADDRESS)
	cpw	x, #0x487f
	jrule	00104$
;	./../../mib/stm8s_mib_flash_option.c: 177: return 0; // false...
	clrw	x
	jra	00112$
00104$:
;	./../../mib/stm8s_mib_flash_option.c: 179: else if(vbAddress < OPTION_BYTE_START_PHYSICAL_ADDRESS)
	cpw	x, #0x4800
	jrnc	00105$
;	./../../mib/stm8s_mib_flash_option.c: 181: return 0; // false...
	clrw	x
	jra	00112$
00105$:
;	./../../mib/stm8s_mib_flash_option.c: 184: value_optbyte = *((NEAR uint8_t*)vbAddress); /* Read option byte */
	ldw	y, x
	ld	a, (y)
	ld	(0x05, sp), a
;	./../../mib/stm8s_mib_flash_option.c: 185: value_optbyte_complement = *(((NEAR uint8_t*)vbAddress) + 1); /* Read option byte complement */
	ld	a, (0x1, y)
	ld	(0x01, sp), a
;	./../../mib/stm8s_mib_flash_option.c: 188: if(vbAddress == 0x4800)
;	./../../mib/stm8s_mib_flash_option.c: 190: res_value =	 value_optbyte;
	ld	a, (0x05, sp)
	ld	(0x03, sp), a
	clr	(0x02, sp)
;	./../../mib/stm8s_mib_flash_option.c: 188: if(vbAddress == 0x4800)
	cpw	x, #0x4800
	jreq	00111$
;	./../../mib/stm8s_mib_flash_option.c: 190: res_value =	 value_optbyte;
;	./../../mib/stm8s_mib_flash_option.c: 194: if(value_optbyte == (uint8_t)(~value_optbyte_complement))
	ld	a, (0x01, sp)
	cpl	a
	cp	a, (0x05, sp)
	jrne	00107$
;	./../../mib/stm8s_mib_flash_option.c: 196: res_value = (uint16_t)((uint16_t)value_optbyte << 8);
	ld	a, (0x03, sp)
	ld	(0x04, sp), a
	clr	(0x05, sp)
;	./../../mib/stm8s_mib_flash_option.c: 197: res_value = res_value | (uint16_t)value_optbyte_complement;
	ld	a, (0x01, sp)
	clrw	x
	or	a, (0x05, sp)
	ld	(0x03, sp), a
	ld	a, xl
	or	a, (0x04, sp)
	ld	(0x02, sp), a
	jra	00111$
00107$:
;	./../../mib/stm8s_mib_flash_option.c: 201: res_value = FLASH_OPTIONBYTE_ERROR;
	ldw	x, #0x5555
	ldw	(0x02, sp), x
00111$:
;	./../../mib/stm8s_mib_flash_option.c: 204: return(res_value);
	ldw	x, (0x02, sp)
00112$:
;	./../../mib/stm8s_mib_flash_option.c: 205: }
	addw	sp, #5
	ret
;	./../../mib/stm8s_mib_flash_option.c: 215: uint8_t mmFlashOptionErase(uint16_t vbAddress)
;	-----------------------------------------
;	 function mmFlashOptionErase
;	-----------------------------------------
_mmFlashOptionErase:
	sub	sp, #2
;	./../../mib/stm8s_mib_flash_option.c: 218: if(vbAddress > OPTION_BYTE_END_PHYSICAL_ADDRESS)
	cpw	x, #0x487f
	jrule	00104$
;	./../../mib/stm8s_mib_flash_option.c: 220: return 0; // false...
	clr	a
	jra	00112$
00104$:
;	./../../mib/stm8s_mib_flash_option.c: 222: else if(vbAddress < OPTION_BYTE_START_PHYSICAL_ADDRESS)
	cpw	x, #0x4800
	jrnc	00105$
;	./../../mib/stm8s_mib_flash_option.c: 224: return 0; // false...
	clr	a
	jra	00112$
00105$:
;	./../../mib/stm8s_mib_flash_option.c: 228: FLASH->CR2 |= FLASH_CR2_OPT;
	bset	0x505b, #7
;	./../../mib/stm8s_mib_flash_option.c: 229: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
	bres	0x505c, #7
;	./../../mib/stm8s_mib_flash_option.c: 232: if(vbAddress == 0x4800)
	ldw	y, x
;	./../../mib/stm8s_mib_flash_option.c: 235: *((NEAR uint8_t*)vbAddress) = 0x00; // FLASH_CLEAR_BYTE;
	ldw	(0x01, sp), x
;	./../../mib/stm8s_mib_flash_option.c: 232: if(vbAddress == 0x4800)
	cpw	y, #0x4800
	jrne	00107$
;	./../../mib/stm8s_mib_flash_option.c: 235: *((NEAR uint8_t*)vbAddress) = 0x00; // FLASH_CLEAR_BYTE;
	ldw	x, (0x01, sp)
	clr	(x)
	jra	00108$
00107$:
;	./../../mib/stm8s_mib_flash_option.c: 240: *((NEAR uint8_t*)vbAddress) = 0x00; // FLASH_CLEAR_BYTE;
	ldw	y, (0x01, sp)
	clr	(y)
;	./../../mib/stm8s_mib_flash_option.c: 241: *((NEAR uint8_t*)((uint16_t)(vbAddress + (uint16_t)1 ))) = 0xff; // FLASH_SET_BYTE;
	incw	x
	ld	a, #0xff
	ld	(x), a
00108$:
;	./../../mib/stm8s_mib_flash_option.c: 246: vbRet = FlashOptionWaitForLastOperation(FLASH_MEMTYPE_PROG);
	ld	a, #0xfd
	call	_FlashOptionWaitForLastOperation
	ld	xl, a
;	./../../mib/stm8s_mib_flash_option.c: 247: if((vbRet==0) || (vbRet==2))
	tnz	a
	jreq	00109$
	ld	a, xl
	cp	a, #0x02
	jrne	00110$
00109$:
;	./../../mib/stm8s_mib_flash_option.c: 249: return 0; // false...
	clr	a
	jra	00112$
00110$:
;	./../../mib/stm8s_mib_flash_option.c: 254: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
	bres	0x505b, #7
;	./../../mib/stm8s_mib_flash_option.c: 255: FLASH->NCR2 |= FLASH_NCR2_NOPT;
	bset	0x505c, #7
;	./../../mib/stm8s_mib_flash_option.c: 256: return 1; // true...
	ld	a, #0x01
00112$:
;	./../../mib/stm8s_mib_flash_option.c: 257: }
	addw	sp, #2
	ret
;	./../../mib/stm8s_mib_flash_option.c: 269: uint8_t FlashOptionWaitForLastOperation(uint8_t FLASH_MemType)
;	-----------------------------------------
;	 function FlashOptionWaitForLastOperation
;	-----------------------------------------
_FlashOptionWaitForLastOperation:
	ld	xl, a
;	./../../mib/stm8s_mib_flash_option.c: 271: uint8_t flagstatus = 0x00;
	clr	a
;	./../../mib/stm8s_mib_flash_option.c: 277: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
	push	a
	ld	a, xl
	cp	a, #0xfd
	pop	a
	jrne	00121$
;	./../../mib/stm8s_mib_flash_option.c: 279: while((flagstatus == 0x00) && (timeout != 0x00))
	clrw	x
	decw	x
00102$:
	tnz	a
	jrne	00111$
	tnzw	x
	jreq	00111$
;	./../../mib/stm8s_mib_flash_option.c: 281: flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
	ld	a, 0x505f
	and	a, #0x05
;	./../../mib/stm8s_mib_flash_option.c: 283: timeout--;
	decw	x
	jra	00102$
;	./../../mib/stm8s_mib_flash_option.c: 288: while((flagstatus == 0x00) && (timeout != 0x00))
00121$:
	clrw	x
	decw	x
00106$:
	tnz	a
	jrne	00124$
	tnzw	x
	jreq	00124$
;	./../../mib/stm8s_mib_flash_option.c: 290: flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
	ld	a, 0x505f
	and	a, #0x41
;	./../../mib/stm8s_mib_flash_option.c: 292: timeout--;
	decw	x
	jra	00106$
;	./../../mib/stm8s_mib_flash_option.c: 309: return((uint8_t)flagstatus);
;	./../../mib/stm8s_mib_flash_option.c: 292: timeout--;
00124$:
00111$:
;	./../../mib/stm8s_mib_flash_option.c: 304: if(timeout == 0x00 )
	tnzw	x
	jreq	00164$
	ret
00164$:
;	./../../mib/stm8s_mib_flash_option.c: 306: flagstatus = FLASH_STATUS_TIMEOUT;
	ld	a, #0x02
;	./../../mib/stm8s_mib_flash_option.c: 309: return((uint8_t)flagstatus);
;	./../../mib/stm8s_mib_flash_option.c: 310: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
