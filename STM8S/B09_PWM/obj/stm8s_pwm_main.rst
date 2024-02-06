                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_pwm_main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _TIM2_OC3PreloadConfig
                                     13 	.globl _TIM2_OC2PreloadConfig
                                     14 	.globl _TIM2_OC1PreloadConfig
                                     15 	.globl _TIM2_ARRPreloadConfig
                                     16 	.globl _TIM2_Cmd
                                     17 	.globl _TIM2_OC3Init
                                     18 	.globl _TIM2_OC2Init
                                     19 	.globl _TIM2_OC1Init
                                     20 	.globl _TIM2_TimeBaseInit
                                     21 	.globl _TIM2_DeInit
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area DATA
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area INITIALIZED
                                     30 ;--------------------------------------------------------
                                     31 ; Stack segment in internal ram
                                     32 ;--------------------------------------------------------
                                     33 	.area SSEG
      000001                         34 __start__stack:
      000001                         35 	.ds	1
                                     36 
                                     37 ;--------------------------------------------------------
                                     38 ; absolute external ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area DABS (ABS)
                                     41 
                                     42 ; default segment ordering for linker
                                     43 	.area HOME
                                     44 	.area GSINIT
                                     45 	.area GSFINAL
                                     46 	.area CONST
                                     47 	.area INITIALIZER
                                     48 	.area CODE
                                     49 
                                     50 ;--------------------------------------------------------
                                     51 ; interrupt vector
                                     52 ;--------------------------------------------------------
                                     53 	.area HOME
      008000                         54 __interrupt_vect:
      008000 82 00 80 07             55 	int s_GSINIT ; reset
                                     56 ;--------------------------------------------------------
                                     57 ; global & static initialisations
                                     58 ;--------------------------------------------------------
                                     59 	.area HOME
                                     60 	.area GSINIT
                                     61 	.area GSFINAL
                                     62 	.area GSINIT
      008007 CD 85 E8         [ 4]   63 	call	___sdcc_external_startup
      00800A                         64 __sdcc_init_data:
                                     65 ; stm8_genXINIT() start
      00800A AE 00 00         [ 2]   66 	ldw x, #l_DATA
      00800D 27 07            [ 1]   67 	jreq	00002$
      00800F                         68 00001$:
      00800F 72 4F 00 00      [ 1]   69 	clr (s_DATA - 1, x)
      008013 5A               [ 2]   70 	decw x
      008014 26 F9            [ 1]   71 	jrne	00001$
      008016                         72 00002$:
      008016 AE 00 00         [ 2]   73 	ldw	x, #l_INITIALIZER
      008019 27 09            [ 1]   74 	jreq	00004$
      00801B                         75 00003$:
      00801B D6 80 26         [ 1]   76 	ld	a, (s_INITIALIZER - 1, x)
      00801E D7 00 00         [ 1]   77 	ld	(s_INITIALIZED - 1, x), a
      008021 5A               [ 2]   78 	decw	x
      008022 26 F7            [ 1]   79 	jrne	00003$
      008024                         80 00004$:
                                     81 ; stm8_genXINIT() end
                                     82 	.area GSFINAL
      008024 CC 80 04         [ 2]   83 	jp	__sdcc_program_startup
                                     84 ;--------------------------------------------------------
                                     85 ; Home
                                     86 ;--------------------------------------------------------
                                     87 	.area HOME
                                     88 	.area HOME
      008004                         89 __sdcc_program_startup:
      008004 CC 80 27         [ 2]   90 	jp	_main
                                     91 ;	return from main will return to caller
                                     92 ;--------------------------------------------------------
                                     93 ; code
                                     94 ;--------------------------------------------------------
                                     95 	.area CODE
                                     96 ;	stm8s_pwm_main.c: 50: void main(void)
                                     97 ;	-----------------------------------------
                                     98 ;	 function main
                                     99 ;	-----------------------------------------
      008027                        100 _main:
                                    101 ;	stm8s_pwm_main.c: 54: TIM2_DeInit();
      008027 CD 80 74         [ 4]  102 	call	_TIM2_DeInit
                                    103 ;	stm8s_pwm_main.c: 57: TIM2_TimeBaseInit(TIM2_PRESCALER_1, 999);
      00802A AE 03 E7         [ 2]  104 	ldw	x, #0x03e7
      00802D 4F               [ 1]  105 	clr	a
      00802E CD 80 CD         [ 4]  106 	call	_TIM2_TimeBaseInit
                                    107 ;	stm8s_pwm_main.c: 61: TIM2_OC1Init(TIM2_OCMODE_PWM2, TIM2_OUTPUTSTATE_ENABLE,CCR1_Val, TIM2_OCPOLARITY_LOW ); 
      008031 4B 22            [ 1]  108 	push	#0x22
      008033 4B F4            [ 1]  109 	push	#0xf4
      008035 4B 01            [ 1]  110 	push	#0x01
      008037 4B 11            [ 1]  111 	push	#0x11
      008039 A6 70            [ 1]  112 	ld	a, #0x70
      00803B CD 80 D9         [ 4]  113 	call	_TIM2_OC1Init
                                    114 ;	stm8s_pwm_main.c: 62: TIM2_OC1PreloadConfig(ENABLE);
      00803E A6 01            [ 1]  115 	ld	a, #0x01
      008040 CD 83 0F         [ 4]  116 	call	_TIM2_OC1PreloadConfig
                                    117 ;	stm8s_pwm_main.c: 65: TIM2_OC2Init(TIM2_OCMODE_PWM2, TIM2_OUTPUTSTATE_ENABLE,CCR2_Val, TIM2_OCPOLARITY_LOW );
      008043 4B 22            [ 1]  118 	push	#0x22
      008045 4B FA            [ 1]  119 	push	#0xfa
      008047 4B 00            [ 1]  120 	push	#0x00
      008049 4B 11            [ 1]  121 	push	#0x11
      00804B A6 70            [ 1]  122 	ld	a, #0x70
      00804D CD 81 14         [ 4]  123 	call	_TIM2_OC2Init
                                    124 ;	stm8s_pwm_main.c: 66: TIM2_OC2PreloadConfig(ENABLE);
      008050 A6 01            [ 1]  125 	ld	a, #0x01
      008052 CD 83 27         [ 4]  126 	call	_TIM2_OC2PreloadConfig
                                    127 ;	stm8s_pwm_main.c: 69: TIM2_OC3Init(TIM2_OCMODE_PWM2, TIM2_OUTPUTSTATE_ENABLE,CCR3_Val, TIM2_OCPOLARITY_LOW );
      008055 4B 22            [ 1]  128 	push	#0x22
      008057 4B EE            [ 1]  129 	push	#0xee
      008059 4B 02            [ 1]  130 	push	#0x02
      00805B 4B 11            [ 1]  131 	push	#0x11
      00805D A6 70            [ 1]  132 	ld	a, #0x70
      00805F CD 81 4F         [ 4]  133 	call	_TIM2_OC3Init
                                    134 ;	stm8s_pwm_main.c: 70: TIM2_OC3PreloadConfig(ENABLE);
      008062 A6 01            [ 1]  135 	ld	a, #0x01
      008064 CD 83 3F         [ 4]  136 	call	_TIM2_OC3PreloadConfig
                                    137 ;	stm8s_pwm_main.c: 73: TIM2_ARRPreloadConfig(ENABLE);
      008067 A6 01            [ 1]  138 	ld	a, #0x01
      008069 CD 82 F7         [ 4]  139 	call	_TIM2_ARRPreloadConfig
                                    140 ;	stm8s_pwm_main.c: 76: TIM2_Cmd(ENABLE);
      00806C A6 01            [ 1]  141 	ld	a, #0x01
      00806E CD 82 41         [ 4]  142 	call	_TIM2_Cmd
                                    143 ;	stm8s_pwm_main.c: 79: while (1); 
      008071                        144 00102$:
      008071 20 FE            [ 2]  145 	jra	00102$
                                    146 ;	stm8s_pwm_main.c: 80: }
      008073 81               [ 4]  147 	ret
                                    148 	.area CODE
                                    149 	.area CONST
                                    150 	.area INITIALIZER
                                    151 	.area CABS (ABS)
