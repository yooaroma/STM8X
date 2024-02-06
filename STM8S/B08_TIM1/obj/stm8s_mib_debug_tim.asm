;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_mib_debug_tim
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _gbMibMiliSec
	.globl _gwMibSec
	.globl _gwMibMsec
	.globl _timIrqInit
	.globl _timIrqMain
	.globl _MibGetSecs
	.globl _delay_ms
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_gwMibMsec::
	.ds 2
_gwMibSec::
	.ds 2
_gbMibMiliSec::
	.ds 1
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
;	./../../mib/stm8s_mib_debug_tim.c: 34: void timIrqInit(void)
;	-----------------------------------------
;	 function timIrqInit
;	-----------------------------------------
_timIrqInit:
;	./../../mib/stm8s_mib_debug_tim.c: 36: gwMibSec = 0;
	clrw	x
	ldw	_gwMibSec+0, x
;	./../../mib/stm8s_mib_debug_tim.c: 37: gwMibMsec = 0;
	clrw	x
	ldw	_gwMibMsec+0, x
;	./../../mib/stm8s_mib_debug_tim.c: 63: TIM4->PSCR  = TIM4_PRESCALER_128; // 7 : 8 usec...
	mov	0x5345+0, #0x07
;	./../../mib/stm8s_mib_debug_tim.c: 64: TIM4->ARR = (uint8_t)(_MM_UCOM_MSEC_-1); // 8 * 125 = 1000 usec = 1 msec...
	mov	0x5346+0, #0x7c
;	./../../mib/stm8s_mib_debug_tim.c: 66: TIM4->CNTR = TIM4->ARR;
	mov	0x5344, 0x5346
;	./../../mib/stm8s_mib_debug_tim.c: 67: TIM4->SR1 = (uint8_t)(~TIM4_FLAG_UPDATE);
	mov	0x5342+0, #0xfe
;	./../../mib/stm8s_mib_debug_tim.c: 69: TIM4->IER = TIM4_IER_UIE;
	mov	0x5341+0, #0x01
;	./../../mib/stm8s_mib_debug_tim.c: 70: TIM4->CR1 = TIM4_CR1_CEN | TIM4_CR1_ARPE;
	mov	0x5340+0, #0x81
;	./../../mib/stm8s_mib_debug_tim.c: 72: }
	ret
;	./../../mib/stm8s_mib_debug_tim.c: 83: void timIrqMain(void)
;	-----------------------------------------
;	 function timIrqMain
;	-----------------------------------------
_timIrqMain:
;	./../../mib/stm8s_mib_debug_tim.c: 85: if(gwMibMsec) 
	ldw	x, _gwMibMsec+0
	jreq	00102$
;	./../../mib/stm8s_mib_debug_tim.c: 87: gwMibMsec--;
	ldw	x, _gwMibMsec+0
	decw	x
	ldw	_gwMibMsec+0, x
	jra	00103$
00102$:
;	./../../mib/stm8s_mib_debug_tim.c: 92: gwMibMsec = 999; // 시간을 측정하여 조정한다.
	ldw	x, #0x03e7
	ldw	_gwMibMsec+0, x
;	./../../mib/stm8s_mib_debug_tim.c: 93: gwMibSec++;
	ldw	x, _gwMibSec+0
	incw	x
	ldw	_gwMibSec+0, x
00103$:
;	./../../mib/stm8s_mib_debug_tim.c: 95: if(gbMibMiliSec) gbMibMiliSec--;  
	ld	a, _gbMibMiliSec+0
	jrne	00119$
	ret
00119$:
	dec	_gbMibMiliSec+0
;	./../../mib/stm8s_mib_debug_tim.c: 96: }
	ret
;	./../../mib/stm8s_mib_debug_tim.c: 107: uint16_t MibGetSecs(void)
;	-----------------------------------------
;	 function MibGetSecs
;	-----------------------------------------
_MibGetSecs:
;	./../../mib/stm8s_mib_debug_tim.c: 109: return gwMibSec; // gwMibSec;
	ldw	x, _gwMibSec+0
;	./../../mib/stm8s_mib_debug_tim.c: 110: }
	ret
;	./../../mib/stm8s_mib_debug_tim.c: 121: void delay_ms(uint8_t vbDelay)
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
	ld	_gbMibMiliSec+0, a
;	./../../mib/stm8s_mib_debug_tim.c: 124: do {
00103$:
;	./../../mib/stm8s_mib_debug_tim.c: 125: if(gbMibMiliSec==0) break;
	ld	a, _gbMibMiliSec+0
	jrne	00103$
;	./../../mib/stm8s_mib_debug_tim.c: 126: } while (1);
;	./../../mib/stm8s_mib_debug_tim.c: 127: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
