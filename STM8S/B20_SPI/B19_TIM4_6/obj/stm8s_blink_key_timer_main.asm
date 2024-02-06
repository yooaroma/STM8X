;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_blink_key_timer_main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _TIM4_ClearFlag
	.globl _TIM4_GetFlagStatus
	.globl _TIM4_SetCounter
	.globl _TIM4_Cmd
	.globl _TIM4_TimeBaseInit
	.globl _GPIO_WriteReverse
	.globl _GPIO_Init
	.globl _GPIO_DeInit
	.globl _CLK_HSIPrescalerConfig
	.globl _CLK_Configuration
	.globl _GPIO_Configuration
	.globl _Toggle
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
;	stm8s_blink_key_timer_main.c: 58: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #4
;	stm8s_blink_key_timer_main.c: 62: CLK_Configuration();
	call	_CLK_Configuration
;	stm8s_blink_key_timer_main.c: 65: GPIO_Configuration();
	call	_GPIO_Configuration
;	stm8s_blink_key_timer_main.c: 68: TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
	push	#0x7c
	ld	a, #0x07
	call	_TIM4_TimeBaseInit
;	stm8s_blink_key_timer_main.c: 69: TIM4_Cmd(ENABLE);
	ld	a, #0x01
	call	_TIM4_Cmd
;	stm8s_blink_key_timer_main.c: 72: uint32_t vdwDelay = 500; // 500msec
	ldw	x, #0x01f4
	ldw	(0x03, sp), x
	clrw	x
;	stm8s_blink_key_timer_main.c: 73: do {
00110$:
;	stm8s_blink_key_timer_main.c: 74: if(UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)
	btjf	0x5001, #3, 00108$
;	stm8s_blink_key_timer_main.c: 76: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
	bres	0x500f, #0
;	stm8s_blink_key_timer_main.c: 77: vdwDelay = 500; // 500msec
	ldw	x, #0x01f4
	ldw	(0x03, sp), x
	clrw	x
	jra	00110$
00108$:
;	stm8s_blink_key_timer_main.c: 82: if(TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == SET)
	pushw	x
	ld	a, #0x01
	call	_TIM4_GetFlagStatus
	popw	x
	tnz	a
	jreq	00104$
;	stm8s_blink_key_timer_main.c: 84: TIM4_SetCounter(0);
	pushw	x
	clr	a
	call	_TIM4_SetCounter
	ld	a, #0x01
	call	_TIM4_ClearFlag
	popw	x
;	stm8s_blink_key_timer_main.c: 86: if(vdwDelay) vdwDelay--;
	ldw	y, (0x03, sp)
	jrne	00142$
	tnzw	x
	jreq	00104$
00142$:
	ldw	y, (0x03, sp)
	subw	y, #0x0001
	ldw	(0x03, sp), y
	jrnc	00143$
	decw	x
00143$:
00104$:
;	stm8s_blink_key_timer_main.c: 88: if(vdwDelay==0)
	ldw	y, (0x03, sp)
	jrne	00110$
	tnzw	x
	jrne	00110$
;	stm8s_blink_key_timer_main.c: 90: vdwDelay = 500; // 500msec
	ldw	x, #0x01f4
	ldw	(0x03, sp), x
	clrw	x
;	stm8s_blink_key_timer_main.c: 91: Toggle();
	pushw	x
	call	_Toggle
	popw	x
;	stm8s_blink_key_timer_main.c: 94: } while(1);
	jra	00110$
;	stm8s_blink_key_timer_main.c: 96: }
	addw	sp, #4
	ret
;	stm8s_blink_key_timer_main.c: 108: void CLK_Configuration(void)
;	-----------------------------------------
;	 function CLK_Configuration
;	-----------------------------------------
_CLK_Configuration:
;	stm8s_blink_key_timer_main.c: 112: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	clr	a
;	stm8s_blink_key_timer_main.c: 114: }
	jp	_CLK_HSIPrescalerConfig
;	stm8s_blink_key_timer_main.c: 126: void GPIO_Configuration(void)
;	-----------------------------------------
;	 function GPIO_Configuration
;	-----------------------------------------
_GPIO_Configuration:
;	stm8s_blink_key_timer_main.c: 129: GPIO_DeInit(UCOM_LED1_GPIO);
	ldw	x, #0x500f
	call	_GPIO_DeInit
;	stm8s_blink_key_timer_main.c: 132: GPIO_Init(UCOM_LED1_GPIO, UCOM_LED1_PIN, UCOM_LED1_MODE);
	push	#0xe0
	ld	a, #0x01
	ldw	x, #0x500f
	call	_GPIO_Init
;	stm8s_blink_key_timer_main.c: 135: GPIO_DeInit(UCOM_KEY1_GPIO);
	ldw	x, #0x5000
	call	_GPIO_DeInit
;	stm8s_blink_key_timer_main.c: 137: GPIO_Init(UCOM_KEY1_GPIO, UCOM_KEY1_PIN, UCOM_KEY1_MODE);
	push	#0x00
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_Init
;	stm8s_blink_key_timer_main.c: 139: }
	ret
;	stm8s_blink_key_timer_main.c: 151: void Toggle(void)
;	-----------------------------------------
;	 function Toggle
;	-----------------------------------------
_Toggle:
;	stm8s_blink_key_timer_main.c: 153: GPIO_WriteReverse(UCOM_LED1_GPIO, UCOM_LED1_PIN);
	ld	a, #0x01
	ldw	x, #0x500f
;	stm8s_blink_key_timer_main.c: 154: }
	jp	_GPIO_WriteReverse
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
