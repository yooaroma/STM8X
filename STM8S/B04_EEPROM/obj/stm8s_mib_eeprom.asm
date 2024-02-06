;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_mib_eeprom
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _mmEepromUnlock
	.globl _mmEepromLock
	.globl _mmEepromWrite
	.globl _mmEepromRead
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
;	./../../mib/stm8s_mib_eeprom.c: 64: uint8_t mmEepromUnlock(void) 
;	-----------------------------------------
;	 function mmEepromUnlock
;	-----------------------------------------
_mmEepromUnlock:
	sub	sp, #3
;	./../../mib/stm8s_mib_eeprom.c: 66: volatile uint16_t vwDelay = 0x7fff;
	ldw	x, #0x7fff
	ldw	(0x01, sp), x
;	./../../mib/stm8s_mib_eeprom.c: 67: volatile uint8_t DataUnlocked = 0;
	clr	(0x03, sp)
;	./../../mib/stm8s_mib_eeprom.c: 70: while( DataUnlocked == 0 )
00104$:
	tnz	(0x03, sp)
	jrne	00106$
;	./../../mib/stm8s_mib_eeprom.c: 72: FLASH->DUKR=0xAE;
	mov	0x5064+0, #0xae
;	./../../mib/stm8s_mib_eeprom.c: 73: FLASH->DUKR=0x56;
	mov	0x5064+0, #0x56
;	./../../mib/stm8s_mib_eeprom.c: 75: DataUnlocked = (uint8_t)FLASH->IAPSR;	
	ld	a, 0x505f
;	./../../mib/stm8s_mib_eeprom.c: 76: DataUnlocked &= FLASH_IAPSR_DUL;
	ld	(0x03, sp), a
	and	a, #0x08
	ld	(0x03, sp), a
;	./../../mib/stm8s_mib_eeprom.c: 77: if(vwDelay) vwDelay--;
	ldw	x, (0x01, sp)
	jreq	00102$
	ldw	x, (0x01, sp)
	decw	x
	ldw	(0x01, sp), x
	jra	00104$
00102$:
;	./../../mib/stm8s_mib_eeprom.c: 80: return 0;
	clr	a
;	./../../mib/stm8s_mib_eeprom.c: 83: return 1;
	.byte 0xc5
00106$:
	ld	a, #0x01
00107$:
;	./../../mib/stm8s_mib_eeprom.c: 84: }
	addw	sp, #3
	ret
;	./../../mib/stm8s_mib_eeprom.c: 94: void mmEepromLock(void) 
;	-----------------------------------------
;	 function mmEepromLock
;	-----------------------------------------
_mmEepromLock:
;	./../../mib/stm8s_mib_eeprom.c: 97: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);  // FLASH_MEMTYPE_DATA      = (uint8_t)0xF7  /*!< Data EEPROM memory */ FLASH_IAPSR_DUL
	bres	0x505f, #3
;	./../../mib/stm8s_mib_eeprom.c: 98: }
	ret
;	./../../mib/stm8s_mib_eeprom.c: 109: uint8_t mmEepromWrite(uint16_t vbOffset,uint8_t vbData) 
;	-----------------------------------------
;	 function mmEepromWrite
;	-----------------------------------------
_mmEepromWrite:
	sub	sp, #3
	ld	(0x03, sp), a
;	./../../mib/stm8s_mib_eeprom.c: 111: volatile uint16_t vwDelay = 0x7fff;
	ldw	y, #0x7fff
	ldw	(0x01, sp), y
;	./../../mib/stm8s_mib_eeprom.c: 112: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);		// Set Standard programming time (max 6.6 ms)
	bres	0x505a, #0
;	./../../mib/stm8s_mib_eeprom.c: 113: if(vbOffset > (FLASH_DATA_END_PHYSICAL_ADDRESS - FLASH_DATA_START_PHYSICAL_ADDRESS))
	cpw	x, #0x03ff
	jrule	00102$
;	./../../mib/stm8s_mib_eeprom.c: 115: return 0; // false...
	clr	a
	jra	00111$
00102$:
;	./../../mib/stm8s_mib_eeprom.c: 117: if((FLASH->IAPSR & FLASH_IAPSR_DUL)==0)
	btjt	0x505f, #3, 00104$
;	./../../mib/stm8s_mib_eeprom.c: 119: return 0; // false...
	clr	a
	jra	00111$
00104$:
;	./../../mib/stm8s_mib_eeprom.c: 122: *((PointerAttr uint8_t*)(FLASH_DATA_START_PHYSICAL_ADDRESS+vbOffset)) = vbData;
	ld	a, (0x03, sp)
	ld	(0x4000, x), a
;	./../../mib/stm8s_mib_eeprom.c: 124: while( !(FLASH->IAPSR & FLASH_IAPSR_EOP) )
00108$:
	btjt	0x505f, #2, 00110$
;	./../../mib/stm8s_mib_eeprom.c: 126: if(vwDelay) vwDelay--;
	ldw	x, (0x01, sp)
	jreq	00106$
	ldw	x, (0x01, sp)
	decw	x
	ldw	(0x01, sp), x
	jra	00108$
00106$:
;	./../../mib/stm8s_mib_eeprom.c: 129: return 0; // false...
	clr	a
;	./../../mib/stm8s_mib_eeprom.c: 132: return 1; // true...
	.byte 0xc5
00110$:
	ld	a, #0x01
00111$:
;	./../../mib/stm8s_mib_eeprom.c: 133: }
	addw	sp, #3
	ret
;	./../../mib/stm8s_mib_eeprom.c: 146: uint8_t mmEepromRead(uint16_t vbOffset)
;	-----------------------------------------
;	 function mmEepromRead
;	-----------------------------------------
_mmEepromRead:
;	./../../mib/stm8s_mib_eeprom.c: 149: if(vbOffset > (FLASH_DATA_END_PHYSICAL_ADDRESS - FLASH_DATA_START_PHYSICAL_ADDRESS))
	cpw	x, #0x03ff
	jrule	00102$
;	./../../mib/stm8s_mib_eeprom.c: 151: return 0; // false...
	clr	a
	ret
00102$:
;	./../../mib/stm8s_mib_eeprom.c: 154: vbData = *((uint8_t *)(FLASH_DATA_START_PHYSICAL_ADDRESS+vbOffset));
	ld	a, (0x4000, x)
;	./../../mib/stm8s_mib_eeprom.c: 155: return vbData;
;	./../../mib/stm8s_mib_eeprom.c: 157: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
