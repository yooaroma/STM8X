;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_blink_key_main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
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
;	stm8s_blink_key_main.c: 60: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	stm8s_blink_key_main.c: 66: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);    
	ld	a, 0x50c6
	and	a, #0xe7
	ld	0x50c6, a
;	stm8s_blink_key_main.c: 68: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
	mov	0x50c6, 0x50c6
;	stm8s_blink_key_main.c: 76: UCOM_LED1_GPIO->ODR &= (uint8_t)(~(UCOM_LED1_PIN)); /* Output mode  Low level */
	bres	0x500f, #0
;	stm8s_blink_key_main.c: 77: UCOM_LED1_GPIO->DDR |= (uint8_t)UCOM_LED1_PIN; /* Set Output mode */
	bset	0x5011, #0
;	stm8s_blink_key_main.c: 78: UCOM_LED1_GPIO->CR1 |= (uint8_t)UCOM_LED1_PIN; /* Push-Pull */
	bset	0x5012, #0
;	stm8s_blink_key_main.c: 80: UCOM_LED1_GPIO->CR2 |= (uint8_t)UCOM_LED1_PIN; /* 10MHz */
	bset	0x5013, #0
;	stm8s_blink_key_main.c: 86: UCOM_KEY1_GPIO->DDR &= (uint8_t)(~(UCOM_KEY1_PIN)); /* Set Input mode */
	bres	0x5007, #5
;	stm8s_blink_key_main.c: 87: UCOM_KEY1_GPIO->CR1 |= (uint8_t)UCOM_KEY1_PIN; /* Pull-up */
	bset	0x5008, #5
;	stm8s_blink_key_main.c: 90: UCOM_KEY1_GPIO->CR2 &= (uint8_t)(~(UCOM_KEY1_PIN)); /* External interrupt disable */
	bres	0x5009, #5
;	stm8s_blink_key_main.c: 94: uint32_t vdwDelay = 0;
	clrw	x
	clrw	y
;	stm8s_blink_key_main.c: 95: do {
00107$:
;	stm8s_blink_key_main.c: 96: if((UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)==0)
	btjt	0x5006, #5, 00105$
;	stm8s_blink_key_main.c: 98: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
	bres	0x500f, #0
	jra	00107$
00105$:
;	stm8s_blink_key_main.c: 103: if(vdwDelay)
	tnzw	x
	jrne	00128$
	tnzw	y
	jreq	00102$
00128$:
;	stm8s_blink_key_main.c: 105: vdwDelay--;
	subw	x, #0x0001
	jrnc	00107$
	decw	y
	jra	00107$
00102$:
;	stm8s_blink_key_main.c: 109: vdwDelay = 0x20000*5;
	clrw	x
	ldw	y, #0x000a
;	stm8s_blink_key_main.c: 111: UCOM_LED1_GPIO->ODR ^= (uint8_t)UCOM_LED1_PIN;
	bcpl	0x500f, #0
;	stm8s_blink_key_main.c: 114: } while(1);
	jra	00107$
;	stm8s_blink_key_main.c: 116: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
