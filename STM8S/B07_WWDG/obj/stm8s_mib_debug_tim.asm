;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_mib_debug_tim
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _gwMibMiliSec
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
_gwMibMiliSec::
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
;	./../../mib/stm8s_mib_debug_tim.c: 35: void timIrqInit(void)
;	-----------------------------------------
;	 function timIrqInit
;	-----------------------------------------
_timIrqInit:
;	./../../mib/stm8s_mib_debug_tim.c: 37: gwMibSec = 0;
	clrw	x
	ldw	_gwMibSec+0, x
;	./../../mib/stm8s_mib_debug_tim.c: 38: gwMibMsec = 0;
	clrw	x
	ldw	_gwMibMsec+0, x
;	./../../mib/stm8s_mib_debug_tim.c: 68: TIM4->PSCR  = TIM4_PRESCALER_128; // 7 : 8 usec...
	mov	0x5345+0, #0x07
;	./../../mib/stm8s_mib_debug_tim.c: 69: TIM4->ARR = (uint8_t)(_MM_UCOM_MSEC_-1); // 8 * 125 = 1000 usec = 1 msec...
	mov	0x5346+0, #0x7c
;	./../../mib/stm8s_mib_debug_tim.c: 71: TIM4->CNTR = TIM4->ARR;
	mov	0x5344, 0x5346
;	./../../mib/stm8s_mib_debug_tim.c: 72: TIM4->SR1 = (uint8_t)(~TIM4_FLAG_UPDATE);
	mov	0x5342+0, #0xfe
;	./../../mib/stm8s_mib_debug_tim.c: 74: TIM4->IER = TIM4_IER_UIE;
	mov	0x5341+0, #0x01
;	./../../mib/stm8s_mib_debug_tim.c: 75: TIM4->CR1 = TIM4_CR1_CEN | TIM4_CR1_ARPE;
	mov	0x5340+0, #0x81
;	./../../mib/stm8s_mib_debug_tim.c: 77: }
	ret
;	./../../mib/stm8s_mib_debug_tim.c: 88: void timIrqMain(void)
;	-----------------------------------------
;	 function timIrqMain
;	-----------------------------------------
_timIrqMain:
;	./../../mib/stm8s_mib_debug_tim.c: 90: if(gwMibMsec) 
	ldw	x, _gwMibMsec+0
	jreq	00102$
;	./../../mib/stm8s_mib_debug_tim.c: 92: gwMibMsec--;
	ldw	x, _gwMibMsec+0
	decw	x
	ldw	_gwMibMsec+0, x
	jra	00103$
00102$:
;	./../../mib/stm8s_mib_debug_tim.c: 97: gwMibMsec = 999; // 시간을 측정하여 조정한다.
	ldw	x, #0x03e7
	ldw	_gwMibMsec+0, x
;	./../../mib/stm8s_mib_debug_tim.c: 98: gwMibSec++;
	ldw	x, _gwMibSec+0
	incw	x
	ldw	_gwMibSec+0, x
00103$:
;	./../../mib/stm8s_mib_debug_tim.c: 100: if(gbMibMiliSec) gbMibMiliSec--;  
	ld	a, _gbMibMiliSec+0
	jreq	00105$
	dec	_gbMibMiliSec+0
00105$:
;	./../../mib/stm8s_mib_debug_tim.c: 101: if(gwMibMiliSec) gwMibMiliSec--;  
	ldw	x, _gwMibMiliSec+0
	jrne	00127$
	ret
00127$:
	ldw	x, _gwMibMiliSec+0
	decw	x
	ldw	_gwMibMiliSec+0, x
;	./../../mib/stm8s_mib_debug_tim.c: 102: }
	ret
;	./../../mib/stm8s_mib_debug_tim.c: 113: uint16_t MibGetSecs(void)
;	-----------------------------------------
;	 function MibGetSecs
;	-----------------------------------------
_MibGetSecs:
;	./../../mib/stm8s_mib_debug_tim.c: 115: return gwMibSec; // gwMibSec;
	ldw	x, _gwMibSec+0
;	./../../mib/stm8s_mib_debug_tim.c: 116: }
	ret
;	./../../mib/stm8s_mib_debug_tim.c: 127: void delay_ms(uint8_t vbDelay)
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
;	./../../mib/stm8s_mib_debug_tim.c: 129: gwMibMiliSec = vbDelay;
	clrw	x
	ld	xl, a
	ldw	_gwMibMiliSec+0, x
;	./../../mib/stm8s_mib_debug_tim.c: 130: do {
00103$:
;	./../../mib/stm8s_mib_debug_tim.c: 131: if(gwMibMiliSec==0) break;
	ldw	x, _gwMibMiliSec+0
	jrne	00103$
;	./../../mib/stm8s_mib_debug_tim.c: 132: } while (1);
;	./../../mib/stm8s_mib_debug_tim.c: 133: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
