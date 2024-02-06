;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_mib_iwdg
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _mib_printf
	.globl _gwTableDataIWDG
	.globl _calConfigIWDG
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_gwTableDataIWDG::
	.ds 16
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
;	./../../mib/stm8s_mib_iwdg.c: 40: void calConfigIWDG(uint16_t vwDelay) // msec... 
;	-----------------------------------------
;	 function calConfigIWDG
;	-----------------------------------------
_calConfigIWDG:
	sub	sp, #11
;	./../../mib/stm8s_mib_iwdg.c: 42: uint32_t vdwData = vwDelay;
	ldw	(0x09, sp), x
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	./../../mib/stm8s_mib_iwdg.c: 46: for(vbIndex=0;;vbIndex++)
	clr	(0x06, sp)
	clr	(0x0b, sp)
00110$:
;	./../../mib/stm8s_mib_iwdg.c: 48: if(gwTableDataIWDG[vbIndex]==0)
	ld	a, (0x0b, sp)
	clrw	x
	ld	xl, a
	sllw	x
	ldw	x, (_gwTableDataIWDG+0, x)
	ldw	(0x07, sp), x
	jrne	00104$
;	./../../mib/stm8s_mib_iwdg.c: 51: vbPRBIT = vbIndex - 1;
	ld	a, (0x06, sp)
	dec	a
	ld	(0x0b, sp), a
;	./../../mib/stm8s_mib_iwdg.c: 52: break;
	jra	00106$
00104$:
;	./../../mib/stm8s_mib_iwdg.c: 54: else if(vwDelay <= gwTableDataIWDG[vbIndex])
	ldw	x, (0x09, sp)
	cpw	x, (0x07, sp)
	jrugt	00111$
;	./../../mib/stm8s_mib_iwdg.c: 56: vbPRBIT = vbIndex;
	ld	a, (0x06, sp)
	ld	(0x0b, sp), a
;	./../../mib/stm8s_mib_iwdg.c: 57: break;
	jra	00106$
00111$:
;	./../../mib/stm8s_mib_iwdg.c: 46: for(vbIndex=0;;vbIndex++)
	inc	(0x0b, sp)
	ld	a, (0x0b, sp)
	ld	(0x06, sp), a
	jra	00110$
00106$:
;	./../../mib/stm8s_mib_iwdg.c: 61: vdwData = (vdwData * 128) / 2;
	ldw	x, (0x04, sp)
	ldw	y, (0x02, sp)
	ld	a, #0x07
00136$:
	sllw	x
	rlcw	y
	dec	a
	jrne	00136$
	srlw	y
	rrcw	x
	ldw	(0x03, sp), x
;	./../../mib/stm8s_mib_iwdg.c: 62: vdwData = vdwData / (1<<(vbPRBIT+2));
	ld	a, (0x0b, sp)
	add	a, #0x02
	clrw	x
	incw	x
	tnz	a
	jreq	00139$
00138$:
	sllw	x
	dec	a
	jrne	00138$
00139$:
	ld	a, xh
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x06, sp), a
	ld	(0x05, sp), a
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
;	./../../mib/stm8s_mib_iwdg.c: 63: if(vdwData > 255)
	ldw	x, #0x00ff
	cpw	x, (0x03, sp)
	clr	a
	sbc	a, (0x02, sp)
	clr	a
	sbc	a, (0x01, sp)
	jrnc	00108$
;	./../../mib/stm8s_mib_iwdg.c: 65: vbRLRBIT = 0xff;
	ld	a, #0xff
	ld	(0x06, sp), a
	jra	00109$
00108$:
;	./../../mib/stm8s_mib_iwdg.c: 69: vbRLRBIT = (uint8_t)(vdwData&0xff);
	ld	a, (0x04, sp)
	ld	(0x06, sp), a
00109$:
;	./../../mib/stm8s_mib_iwdg.c: 71: ccprintf(_DEBUG_IWDG_A_, ("calConfigIWDG...vbPRBIT[%u]/vbRLRBIT[%u]\r\n",vbPRBIT,vbRLRBIT));		
	clrw	x
	ld	a, (0x06, sp)
	ld	xl, a
	ld	a, (0x0b, sp)
	clr	(0x07, sp)
	pushw	x
	push	a
	ld	a, (0x0a, sp)
	push	a
	push	#<(__str_0+0)
	push	#((__str_0+0) >> 8)
	call	_mib_printf
	addw	sp, #6
;	./../../mib/stm8s_mib_iwdg.c: 72: MibWriteDebugEmptyCheck();
	call	_MibWriteDebugEmptyCheck
;	./../../mib/stm8s_mib_iwdg.c: 73: IWDG->KR = 0xCC; // KEY_START , enable...
	mov	0x50e0+0, #0xcc
;	./../../mib/stm8s_mib_iwdg.c: 74: IWDG->KR = 0x55; // KEY_ACCESS
	mov	0x50e0+0, #0x55
;	./../../mib/stm8s_mib_iwdg.c: 75: IWDG->PR = (uint8_t)vbPRBIT; 
	ldw	x, #0x50e1
	ld	a, (0x0b, sp)
	ld	(x), a
;	./../../mib/stm8s_mib_iwdg.c: 76: IWDG->RLR = vbRLRBIT;
	ldw	x, #0x50e2
	ld	a, (0x06, sp)
	ld	(x), a
;	./../../mib/stm8s_mib_iwdg.c: 77: IWDG->KR = 0xAA; // KEY_REFRESH
	mov	0x50e0+0, #0xaa
;	./../../mib/stm8s_mib_iwdg.c: 79: }
	addw	sp, #11
	ret
	.area CODE
	.area CONST
	.area CONST
__str_0:
	.ascii "calConfigIWDG...vbPRBIT[%u]/vbRLRBIT[%u]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area INITIALIZER
__xinit__gwTableDataIWDG:
	.dw #0x000f
	.dw #0x001f
	.dw #0x003f
	.dw #0x007f
	.dw #0x00ff
	.dw #0x01fe
	.dw #0x03e8
	.dw #0x0000
	.area CABS (ABS)
