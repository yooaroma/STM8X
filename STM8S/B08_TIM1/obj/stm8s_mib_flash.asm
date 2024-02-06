;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_mib_flash
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _mmFlashUnlock
	.globl _mmFlashLock
	.globl _mmFlashWrite
	.globl _mmFlashRead
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
;	./../../mib/stm8s_mib_flash.c: 64: uint8_t mmFlashUnlock(void) 
;	-----------------------------------------
;	 function mmFlashUnlock
;	-----------------------------------------
_mmFlashUnlock:
	sub	sp, #3
;	./../../mib/stm8s_mib_flash.c: 66: volatile uint16_t vwDelay = 0x7fff;
	ldw	x, #0x7fff
	ldw	(0x01, sp), x
;	./../../mib/stm8s_mib_flash.c: 67: volatile uint8_t DataUnlocked = 0;
	clr	(0x03, sp)
;	./../../mib/stm8s_mib_flash.c: 70: while( DataUnlocked == 0 )
00104$:
	tnz	(0x03, sp)
	jrne	00106$
;	./../../mib/stm8s_mib_flash.c: 72: FLASH->PUKR = 0x56;
	mov	0x5062+0, #0x56
;	./../../mib/stm8s_mib_flash.c: 73: FLASH->PUKR = 0xAE;
	mov	0x5062+0, #0xae
;	./../../mib/stm8s_mib_flash.c: 75: DataUnlocked = (uint8_t)FLASH->IAPSR;	
	ld	a, 0x505f
;	./../../mib/stm8s_mib_flash.c: 76: DataUnlocked &= FLASH_IAPSR_PUL;
	ld	(0x03, sp), a
	and	a, #0x02
	ld	(0x03, sp), a
;	./../../mib/stm8s_mib_flash.c: 77: if(vwDelay) vwDelay--;
	ldw	x, (0x01, sp)
	jreq	00102$
	ldw	x, (0x01, sp)
	decw	x
	ldw	(0x01, sp), x
	jra	00104$
00102$:
;	./../../mib/stm8s_mib_flash.c: 80: return 0;
	clr	a
;	./../../mib/stm8s_mib_flash.c: 83: return 1;
	.byte 0xc5
00106$:
	ld	a, #0x01
00107$:
;	./../../mib/stm8s_mib_flash.c: 84: }
	addw	sp, #3
	ret
;	./../../mib/stm8s_mib_flash.c: 94: void mmFlashLock(void) 
;	-----------------------------------------
;	 function mmFlashLock
;	-----------------------------------------
_mmFlashLock:
;	./../../mib/stm8s_mib_flash.c: 97: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL); 
	bres	0x505f, #1
;	./../../mib/stm8s_mib_flash.c: 98: }
	ret
;	./../../mib/stm8s_mib_flash.c: 109: uint8_t mmFlashWrite(uint16_t vbOffset,uint8_t vbData) 
;	-----------------------------------------
;	 function mmFlashWrite
;	-----------------------------------------
_mmFlashWrite:
	sub	sp, #3
	ld	(0x03, sp), a
;	./../../mib/stm8s_mib_flash.c: 111: volatile uint16_t vwDelay = 0x7fff;
	ldw	y, #0x7fff
	ldw	(0x01, sp), y
;	./../../mib/stm8s_mib_flash.c: 112: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);		// Set Standard programming time (max 6.6 ms)
	bres	0x505a, #0
;	./../../mib/stm8s_mib_flash.c: 113: if(vbOffset > (FLASH_PROG_END_PHYSICAL_ADDRESS - FLASH_PROG_START_PHYSICAL_ADDRESS))
	cpw	x, #0x7fff
	jrule	00102$
;	./../../mib/stm8s_mib_flash.c: 115: return 0; // false...
	clr	a
	jra	00109$
00102$:
;	./../../mib/stm8s_mib_flash.c: 118: *((PointerAttr uint8_t*)(FLASH_PROG_START_PHYSICAL_ADDRESS+vbOffset)) = vbData;
	ld	a, (0x03, sp)
	ld	(0x8000, x), a
;	./../../mib/stm8s_mib_flash.c: 120: while( !(FLASH->IAPSR & FLASH_IAPSR_EOP) )
00106$:
	btjt	0x505f, #2, 00108$
;	./../../mib/stm8s_mib_flash.c: 122: if(vwDelay) vwDelay--;
	ldw	x, (0x01, sp)
	jreq	00104$
	ldw	x, (0x01, sp)
	decw	x
	ldw	(0x01, sp), x
	jra	00106$
00104$:
;	./../../mib/stm8s_mib_flash.c: 125: return 0;
	clr	a
;	./../../mib/stm8s_mib_flash.c: 128: return 1;
	.byte 0xc5
00108$:
	ld	a, #0x01
00109$:
;	./../../mib/stm8s_mib_flash.c: 129: }
	addw	sp, #3
	ret
;	./../../mib/stm8s_mib_flash.c: 142: uint8_t mmFlashRead(uint16_t vbOffset)
;	-----------------------------------------
;	 function mmFlashRead
;	-----------------------------------------
_mmFlashRead:
;	./../../mib/stm8s_mib_flash.c: 145: if(vbOffset > (FLASH_PROG_END_PHYSICAL_ADDRESS - FLASH_PROG_START_PHYSICAL_ADDRESS))
	cpw	x, #0x7fff
	jrule	00102$
;	./../../mib/stm8s_mib_flash.c: 147: return 0; // false...
	clr	a
	ret
00102$:
;	./../../mib/stm8s_mib_flash.c: 150: vbData = *((uint8_t *)(FLASH_PROG_START_PHYSICAL_ADDRESS+vbOffset));
	ld	a, (0x8000, x)
;	./../../mib/stm8s_mib_flash.c: 151: return vbData;
;	./../../mib/stm8s_mib_flash.c: 153: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
