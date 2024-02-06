;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_mib_wwdg
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _mib_printf
	.globl _calConfigWWDG
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
;	./../../mib/stm8s_mib_wwdg.c: 41: uint16_t calConfigWWDG(uint16_t vwDelay) // msec... 
;	-----------------------------------------
;	 function calConfigWWDG
;	-----------------------------------------
_calConfigWWDG:
	sub	sp, #4
;	./../../mib/stm8s_mib_wwdg.c: 43: uint32_t vdwData = vwDelay;
	ldw	(0x03, sp), x
	clrw	y
;	./../../mib/stm8s_mib_wwdg.c: 44: if(vwDelay>50)
	cpw	x, #0x0032
	jrule	00102$
;	./../../mib/stm8s_mib_wwdg.c: 46: vdwData = 0x3F;
	ldw	x, #0x003f
	ldw	(0x03, sp), x
	jra	00103$
00102$:
;	./../../mib/stm8s_mib_wwdg.c: 50: vdwData = vdwData * 16000000;
	ldw	x, (0x03, sp)
	pushw	x
	pushw	y
	push	#0x00
	push	#0x24
	push	#0xf4
	push	#0x00
	call	__mullong
	addw	sp, #8
;	./../../mib/stm8s_mib_wwdg.c: 51: vdwData = vdwData / 12288;
	push	#0x00
	push	#0x30
	push	#0x00
	push	#0x00
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
;	./../../mib/stm8s_mib_wwdg.c: 52: vdwData = vdwData / 1000;
	push	#0xe8
	push	#0x03
	push	#0x00
	push	#0x00
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ldw	(0x03, sp), x
00103$:
;	./../../mib/stm8s_mib_wwdg.c: 54: vwDelay = vdwData;
	ldw	x, (0x03, sp)
;	./../../mib/stm8s_mib_wwdg.c: 55: ccprintf(_DEBUG_WWDG_A_, ("calConfigWWDG : [%u][0x%x]\r\n",vwDelay));		 
	pushw	x
	pushw	x
	push	#<(__str_0+0)
	push	#((__str_0+0) >> 8)
	call	_mib_printf
	addw	sp, #4
	popw	x
;	./../../mib/stm8s_mib_wwdg.c: 56: return vwDelay;
;	./../../mib/stm8s_mib_wwdg.c: 57: }
	addw	sp, #4
	ret
	.area CODE
	.area CONST
	.area CONST
__str_0:
	.ascii "calConfigWWDG : [%u][0x%x]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
