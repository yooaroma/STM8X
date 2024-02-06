;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_mib_debug_tim
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _gwMibSec
	.globl _gwMibMsec
	.globl _timIrqInit
	.globl _timIrqMain
	.globl _MibGetSecs
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_gwMibMsec::
	.ds 2
_gwMibSec::
	.ds 2
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
;	./../../mib/stm8s_mib_debug_tim.c: 33: void timIrqInit(void)
;	-----------------------------------------
;	 function timIrqInit
;	-----------------------------------------
_timIrqInit:
;	./../../mib/stm8s_mib_debug_tim.c: 35: gwMibSec = 0;
	clrw	x
	ldw	_gwMibSec+0, x
;	./../../mib/stm8s_mib_debug_tim.c: 36: gwMibMsec = 0;
	clrw	x
	ldw	_gwMibMsec+0, x
;	./../../mib/stm8s_mib_debug_tim.c: 62: TIM4->PSCR  = TIM4_PRESCALER_128; // 7
	mov	0x5345+0, #0x07
;	./../../mib/stm8s_mib_debug_tim.c: 63: TIM4->ARR = (uint8_t)~(_MM_UCOM_MSEC_-1);
	mov	0x5346+0, #0xb8
;	./../../mib/stm8s_mib_debug_tim.c: 64: TIM4->CNTR = TIM4->ARR;
	mov	0x5344, 0x5346
;	./../../mib/stm8s_mib_debug_tim.c: 65: TIM4->SR1 = (uint8_t)(~TIM4_FLAG_UPDATE);
	mov	0x5342+0, #0xfe
;	./../../mib/stm8s_mib_debug_tim.c: 67: TIM4->IER = TIM4_IER_UIE;
	mov	0x5341+0, #0x01
;	./../../mib/stm8s_mib_debug_tim.c: 68: TIM4->CR1 = TIM4_CR1_CEN | TIM4_CR1_ARPE;
	mov	0x5340+0, #0x81
;	./../../mib/stm8s_mib_debug_tim.c: 70: }
	ret
;	./../../mib/stm8s_mib_debug_tim.c: 81: void timIrqMain(void)
;	-----------------------------------------
;	 function timIrqMain
;	-----------------------------------------
_timIrqMain:
;	./../../mib/stm8s_mib_debug_tim.c: 83: if(gwMibMsec) 
	ldw	x, _gwMibMsec+0
	jreq	00102$
;	./../../mib/stm8s_mib_debug_tim.c: 85: gwMibMsec--;
	ldw	x, _gwMibMsec+0
	decw	x
	ldw	_gwMibMsec+0, x
	ret
00102$:
;	./../../mib/stm8s_mib_debug_tim.c: 90: gwMibMsec = 680; // 시간을 측정하여 조정한다.
	ldw	x, #0x02a8
	ldw	_gwMibMsec+0, x
;	./../../mib/stm8s_mib_debug_tim.c: 91: gwMibSec++;
	ldw	x, _gwMibSec+0
	incw	x
	ldw	_gwMibSec+0, x
;	./../../mib/stm8s_mib_debug_tim.c: 93: }
	ret
;	./../../mib/stm8s_mib_debug_tim.c: 104: uint16_t MibGetSecs(void)
;	-----------------------------------------
;	 function MibGetSecs
;	-----------------------------------------
_MibGetSecs:
;	./../../mib/stm8s_mib_debug_tim.c: 106: return gwMibSec; // gwMibSec;
	ldw	x, _gwMibSec+0
;	./../../mib/stm8s_mib_debug_tim.c: 107: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
