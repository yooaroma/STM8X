;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_blink_key_tli_irq_main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _TLI_IRQHandler
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

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
; interrupt vector
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
	int 0x000000 ; trap
	int _TLI_IRQHandler ; int0
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
	call	___sdcc_external_startup
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	stm8s_blink_key_tli_irq_main.c: 70: void TLI_IRQHandler(void) __interrupt(0)
;	-----------------------------------------
;	 function TLI_IRQHandler
;	-----------------------------------------
_TLI_IRQHandler:
;	stm8s_blink_key_tli_irq_main.c: 76: UCOM_LED1_GPIO->ODR ^= (uint8_t)UCOM_LED1_PIN;
	bcpl	0x500f, #0
;	stm8s_blink_key_tli_irq_main.c: 77: UCOM_KEY_TLI_GPIO->CR2 &= (uint8_t)(~(UCOM_KEY_TLI_PIN)); /* External interrupt disable */
	bres	0x5013, #7
;	stm8s_blink_key_tli_irq_main.c: 79: }
	iret
;	stm8s_blink_key_tli_irq_main.c: 93: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	stm8s_blink_key_tli_irq_main.c: 99: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);    
	ld	a, 0x50c6
	and	a, #0xe7
	ld	0x50c6, a
;	stm8s_blink_key_tli_irq_main.c: 101: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
	mov	0x50c6, 0x50c6
;	stm8s_blink_key_tli_irq_main.c: 109: EXTI->CR2 &= (uint8_t)~(0x04); /* TLI : PD7 */
	bres	0x50a1, #2
;	stm8s_blink_key_tli_irq_main.c: 110: EXTI->CR2 |= (vbData); /* TLI */
	mov	0x50a1, 0x50a1
;	stm8s_blink_key_tli_irq_main.c: 118: UCOM_LED1_GPIO->ODR &= (uint8_t)(~(UCOM_LED1_PIN)); /* Output mode  Low level */
	bres	0x500f, #0
;	stm8s_blink_key_tli_irq_main.c: 119: UCOM_LED1_GPIO->DDR |= (uint8_t)UCOM_LED1_PIN; /* Set Output mode */
	bset	0x5011, #0
;	stm8s_blink_key_tli_irq_main.c: 120: UCOM_LED1_GPIO->CR1 |= (uint8_t)UCOM_LED1_PIN; /* Push-Pull */
	bset	0x5012, #0
;	stm8s_blink_key_tli_irq_main.c: 122: UCOM_LED1_GPIO->CR2 |= (uint8_t)UCOM_LED1_PIN; /* 10MHz */
	bset	0x5013, #0
;	stm8s_blink_key_tli_irq_main.c: 128: UCOM_KEY_TLI_GPIO->DDR &= (uint8_t)(~(UCOM_KEY_TLI_PIN)); /* Set Input mode */
	bres	0x5011, #7
;	stm8s_blink_key_tli_irq_main.c: 129: UCOM_KEY_TLI_GPIO->CR1 |= (uint8_t)UCOM_KEY_TLI_PIN; /* Pull-up */
	bset	0x5012, #7
;	stm8s_blink_key_tli_irq_main.c: 132: UCOM_KEY_TLI_GPIO->CR2 &= (uint8_t)(~(UCOM_KEY_TLI_PIN)); /* External interrupt disable */
	bres	0x5013, #7
;	stm8s_blink_key_tli_irq_main.c: 135: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN; // led on...
	bres	0x500f, #0
;	stm8s_blink_key_tli_irq_main.c: 143: uint32_t vwDelay = 0;
	clrw	x
	clrw	y
;	stm8s_blink_key_tli_irq_main.c: 144: do {
00103$:
;	stm8s_blink_key_tli_irq_main.c: 145: if(vwDelay==0) 
	tnzw	x
	jrne	00102$
	tnzw	y
	jrne	00102$
;	stm8s_blink_key_tli_irq_main.c: 147: vwDelay = 0x20000*5*20; // 10sec..
	clrw	x
	ldw	y, #0x00c8
;	stm8s_blink_key_tli_irq_main.c: 149: UCOM_LED1_GPIO->ODR ^= (uint8_t)UCOM_LED1_PIN;
	bcpl	0x500f, #0
;	stm8s_blink_key_tli_irq_main.c: 150: UCOM_KEY_TLI_GPIO->CR2 |= (uint8_t)UCOM_KEY_TLI_PIN; /* External interrupt enable */
	bset	0x5013, #7
00102$:
;	stm8s_blink_key_tli_irq_main.c: 152: vwDelay--;
	subw	x, #0x0001
	jrnc	00103$
	decw	y
;	stm8s_blink_key_tli_irq_main.c: 153: } while(1);
	jra	00103$
;	stm8s_blink_key_tli_irq_main.c: 180: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
