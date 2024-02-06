;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_pwm_main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _TIM2_OC3PreloadConfig
	.globl _TIM2_OC2PreloadConfig
	.globl _TIM2_OC1PreloadConfig
	.globl _TIM2_ARRPreloadConfig
	.globl _TIM2_Cmd
	.globl _TIM2_OC3Init
	.globl _TIM2_OC2Init
	.globl _TIM2_OC1Init
	.globl _TIM2_TimeBaseInit
	.globl _TIM2_DeInit
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
;	stm8s_pwm_main.c: 50: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	stm8s_pwm_main.c: 54: TIM2_DeInit();
	call	_TIM2_DeInit
;	stm8s_pwm_main.c: 57: TIM2_TimeBaseInit(TIM2_PRESCALER_1, 999);
	ldw	x, #0x03e7
	clr	a
	call	_TIM2_TimeBaseInit
;	stm8s_pwm_main.c: 61: TIM2_OC1Init(TIM2_OCMODE_PWM2, TIM2_OUTPUTSTATE_ENABLE,CCR1_Val, TIM2_OCPOLARITY_LOW ); 
	push	#0x22
	push	#0xf4
	push	#0x01
	push	#0x11
	ld	a, #0x70
	call	_TIM2_OC1Init
;	stm8s_pwm_main.c: 62: TIM2_OC1PreloadConfig(ENABLE);
	ld	a, #0x01
	call	_TIM2_OC1PreloadConfig
;	stm8s_pwm_main.c: 65: TIM2_OC2Init(TIM2_OCMODE_PWM2, TIM2_OUTPUTSTATE_ENABLE,CCR2_Val, TIM2_OCPOLARITY_LOW );
	push	#0x22
	push	#0xfa
	push	#0x00
	push	#0x11
	ld	a, #0x70
	call	_TIM2_OC2Init
;	stm8s_pwm_main.c: 66: TIM2_OC2PreloadConfig(ENABLE);
	ld	a, #0x01
	call	_TIM2_OC2PreloadConfig
;	stm8s_pwm_main.c: 69: TIM2_OC3Init(TIM2_OCMODE_PWM2, TIM2_OUTPUTSTATE_ENABLE,CCR3_Val, TIM2_OCPOLARITY_LOW );
	push	#0x22
	push	#0xee
	push	#0x02
	push	#0x11
	ld	a, #0x70
	call	_TIM2_OC3Init
;	stm8s_pwm_main.c: 70: TIM2_OC3PreloadConfig(ENABLE);
	ld	a, #0x01
	call	_TIM2_OC3PreloadConfig
;	stm8s_pwm_main.c: 73: TIM2_ARRPreloadConfig(ENABLE);
	ld	a, #0x01
	call	_TIM2_ARRPreloadConfig
;	stm8s_pwm_main.c: 76: TIM2_Cmd(ENABLE);
	ld	a, #0x01
	call	_TIM2_Cmd
;	stm8s_pwm_main.c: 79: while (1); 
00102$:
	jra	00102$
;	stm8s_pwm_main.c: 80: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
