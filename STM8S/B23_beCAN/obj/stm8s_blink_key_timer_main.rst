                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_blink_key_timer_main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _TIM4_ClearFlag
                                     13 	.globl _TIM4_GetFlagStatus
                                     14 	.globl _TIM4_SetCounter
                                     15 	.globl _TIM4_Cmd
                                     16 	.globl _TIM4_TimeBaseInit
                                     17 	.globl _GPIO_WriteReverse
                                     18 	.globl _GPIO_Init
                                     19 	.globl _GPIO_DeInit
                                     20 	.globl _CLK_HSIPrescalerConfig
                                     21 	.globl _CLK_Configuration
                                     22 	.globl _GPIO_Configuration
                                     23 	.globl _Toggle
                                     24 ;--------------------------------------------------------
                                     25 ; ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area DATA
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area INITIALIZED
                                     32 ;--------------------------------------------------------
                                     33 ; Stack segment in internal ram
                                     34 ;--------------------------------------------------------
                                     35 	.area SSEG
      000001                         36 __start__stack:
      000001                         37 	.ds	1
                                     38 
                                     39 ;--------------------------------------------------------
                                     40 ; absolute external ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area DABS (ABS)
                                     43 
                                     44 ; default segment ordering for linker
                                     45 	.area HOME
                                     46 	.area GSINIT
                                     47 	.area GSFINAL
                                     48 	.area CONST
                                     49 	.area INITIALIZER
                                     50 	.area CODE
                                     51 
                                     52 ;--------------------------------------------------------
                                     53 ; interrupt vector
                                     54 ;--------------------------------------------------------
                                     55 	.area HOME
      008000                         56 __interrupt_vect:
      008000 82 00 80 07             57 	int s_GSINIT ; reset
                                     58 ;--------------------------------------------------------
                                     59 ; global & static initialisations
                                     60 ;--------------------------------------------------------
                                     61 	.area HOME
                                     62 	.area GSINIT
                                     63 	.area GSFINAL
                                     64 	.area GSINIT
      008007 CD 86 2F         [ 4]   65 	call	___sdcc_external_startup
      00800A                         66 __sdcc_init_data:
                                     67 ; stm8_genXINIT() start
      00800A AE 00 00         [ 2]   68 	ldw x, #l_DATA
      00800D 27 07            [ 1]   69 	jreq	00002$
      00800F                         70 00001$:
      00800F 72 4F 00 00      [ 1]   71 	clr (s_DATA - 1, x)
      008013 5A               [ 2]   72 	decw x
      008014 26 F9            [ 1]   73 	jrne	00001$
      008016                         74 00002$:
      008016 AE 00 00         [ 2]   75 	ldw	x, #l_INITIALIZER
      008019 27 09            [ 1]   76 	jreq	00004$
      00801B                         77 00003$:
      00801B D6 80 32         [ 1]   78 	ld	a, (s_INITIALIZER - 1, x)
      00801E D7 00 00         [ 1]   79 	ld	(s_INITIALIZED - 1, x), a
      008021 5A               [ 2]   80 	decw	x
      008022 26 F7            [ 1]   81 	jrne	00003$
      008024                         82 00004$:
                                     83 ; stm8_genXINIT() end
                                     84 	.area GSFINAL
      008024 CC 80 04         [ 2]   85 	jp	__sdcc_program_startup
                                     86 ;--------------------------------------------------------
                                     87 ; Home
                                     88 ;--------------------------------------------------------
                                     89 	.area HOME
                                     90 	.area HOME
      008004                         91 __sdcc_program_startup:
      008004 CC 80 33         [ 2]   92 	jp	_main
                                     93 ;	return from main will return to caller
                                     94 ;--------------------------------------------------------
                                     95 ; code
                                     96 ;--------------------------------------------------------
                                     97 	.area CODE
                                     98 ;	stm8s_blink_key_timer_main.c: 58: void main(void)
                                     99 ;	-----------------------------------------
                                    100 ;	 function main
                                    101 ;	-----------------------------------------
      008033                        102 _main:
      008033 52 04            [ 2]  103 	sub	sp, #4
                                    104 ;	stm8s_blink_key_timer_main.c: 62: CLK_Configuration();
      008035 CD 80 9C         [ 4]  105 	call	_CLK_Configuration
                                    106 ;	stm8s_blink_key_timer_main.c: 65: GPIO_Configuration();
      008038 CD 80 A0         [ 4]  107 	call	_GPIO_Configuration
                                    108 ;	stm8s_blink_key_timer_main.c: 68: TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
      00803B 4B 7C            [ 1]  109 	push	#0x7c
      00803D A6 07            [ 1]  110 	ld	a, #0x07
      00803F CD 81 B4         [ 4]  111 	call	_TIM4_TimeBaseInit
                                    112 ;	stm8s_blink_key_timer_main.c: 69: TIM4_Cmd(ENABLE);
      008042 A6 01            [ 1]  113 	ld	a, #0x01
      008044 CD 81 C0         [ 4]  114 	call	_TIM4_Cmd
                                    115 ;	stm8s_blink_key_timer_main.c: 72: uint32_t vdwDelay = 500; // 500msec
      008047 AE 01 F4         [ 2]  116 	ldw	x, #0x01f4
      00804A 1F 03            [ 2]  117 	ldw	(0x03, sp), x
      00804C 5F               [ 1]  118 	clrw	x
                                    119 ;	stm8s_blink_key_timer_main.c: 73: do {
      00804D                        120 00110$:
                                    121 ;	stm8s_blink_key_timer_main.c: 74: if(UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)
      00804D 72 07 50 01 0C   [ 2]  122 	btjf	0x5001, #3, 00108$
                                    123 ;	stm8s_blink_key_timer_main.c: 76: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
      008052 72 11 50 0F      [ 1]  124 	bres	0x500f, #0
                                    125 ;	stm8s_blink_key_timer_main.c: 77: vdwDelay = 500; // 500msec
      008056 AE 01 F4         [ 2]  126 	ldw	x, #0x01f4
      008059 1F 03            [ 2]  127 	ldw	(0x03, sp), x
      00805B 5F               [ 1]  128 	clrw	x
      00805C 20 EF            [ 2]  129 	jra	00110$
      00805E                        130 00108$:
                                    131 ;	stm8s_blink_key_timer_main.c: 82: if(TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == SET)
      00805E 89               [ 2]  132 	pushw	x
      00805F A6 01            [ 1]  133 	ld	a, #0x01
      008061 CD 82 75         [ 4]  134 	call	_TIM4_GetFlagStatus
      008064 85               [ 2]  135 	popw	x
      008065 4D               [ 1]  136 	tnz	a
      008066 27 1D            [ 1]  137 	jreq	00104$
                                    138 ;	stm8s_blink_key_timer_main.c: 84: TIM4_SetCounter(0);
      008068 89               [ 2]  139 	pushw	x
      008069 4F               [ 1]  140 	clr	a
      00806A CD 82 65         [ 4]  141 	call	_TIM4_SetCounter
      00806D A6 01            [ 1]  142 	ld	a, #0x01
      00806F CD 82 85         [ 4]  143 	call	_TIM4_ClearFlag
      008072 85               [ 2]  144 	popw	x
                                    145 ;	stm8s_blink_key_timer_main.c: 86: if(vdwDelay) vdwDelay--;
      008073 16 03            [ 2]  146 	ldw	y, (0x03, sp)
      008075 26 03            [ 1]  147 	jrne	00142$
      008077 5D               [ 2]  148 	tnzw	x
      008078 27 0B            [ 1]  149 	jreq	00104$
      00807A                        150 00142$:
      00807A 16 03            [ 2]  151 	ldw	y, (0x03, sp)
      00807C 72 A2 00 01      [ 2]  152 	subw	y, #0x0001
      008080 17 03            [ 2]  153 	ldw	(0x03, sp), y
      008082 24 01            [ 1]  154 	jrnc	00143$
      008084 5A               [ 2]  155 	decw	x
      008085                        156 00143$:
      008085                        157 00104$:
                                    158 ;	stm8s_blink_key_timer_main.c: 88: if(vdwDelay==0)
      008085 16 03            [ 2]  159 	ldw	y, (0x03, sp)
      008087 26 C4            [ 1]  160 	jrne	00110$
      008089 5D               [ 2]  161 	tnzw	x
      00808A 26 C1            [ 1]  162 	jrne	00110$
                                    163 ;	stm8s_blink_key_timer_main.c: 90: vdwDelay = 500; // 500msec
      00808C AE 01 F4         [ 2]  164 	ldw	x, #0x01f4
      00808F 1F 03            [ 2]  165 	ldw	(0x03, sp), x
      008091 5F               [ 1]  166 	clrw	x
                                    167 ;	stm8s_blink_key_timer_main.c: 91: Toggle();
      008092 89               [ 2]  168 	pushw	x
      008093 CD 80 C1         [ 4]  169 	call	_Toggle
      008096 85               [ 2]  170 	popw	x
                                    171 ;	stm8s_blink_key_timer_main.c: 94: } while(1);
      008097 20 B4            [ 2]  172 	jra	00110$
                                    173 ;	stm8s_blink_key_timer_main.c: 96: }
      008099 5B 04            [ 2]  174 	addw	sp, #4
      00809B 81               [ 4]  175 	ret
                                    176 ;	stm8s_blink_key_timer_main.c: 108: void CLK_Configuration(void)
                                    177 ;	-----------------------------------------
                                    178 ;	 function CLK_Configuration
                                    179 ;	-----------------------------------------
      00809C                        180 _CLK_Configuration:
                                    181 ;	stm8s_blink_key_timer_main.c: 112: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      00809C 4F               [ 1]  182 	clr	a
                                    183 ;	stm8s_blink_key_timer_main.c: 114: }
      00809D CC 84 84         [ 2]  184 	jp	_CLK_HSIPrescalerConfig
                                    185 ;	stm8s_blink_key_timer_main.c: 126: void GPIO_Configuration(void)
                                    186 ;	-----------------------------------------
                                    187 ;	 function GPIO_Configuration
                                    188 ;	-----------------------------------------
      0080A0                        189 _GPIO_Configuration:
                                    190 ;	stm8s_blink_key_timer_main.c: 129: GPIO_DeInit(UCOM_LED1_GPIO);
      0080A0 AE 50 0F         [ 2]  191 	ldw	x, #0x500f
      0080A3 CD 80 C9         [ 4]  192 	call	_GPIO_DeInit
                                    193 ;	stm8s_blink_key_timer_main.c: 132: GPIO_Init(UCOM_LED1_GPIO, UCOM_LED1_PIN, UCOM_LED1_MODE);
      0080A6 4B E0            [ 1]  194 	push	#0xe0
      0080A8 A6 01            [ 1]  195 	ld	a, #0x01
      0080AA AE 50 0F         [ 2]  196 	ldw	x, #0x500f
      0080AD CD 80 D7         [ 4]  197 	call	_GPIO_Init
                                    198 ;	stm8s_blink_key_timer_main.c: 135: GPIO_DeInit(UCOM_KEY1_GPIO);
      0080B0 AE 50 00         [ 2]  199 	ldw	x, #0x5000
      0080B3 CD 80 C9         [ 4]  200 	call	_GPIO_DeInit
                                    201 ;	stm8s_blink_key_timer_main.c: 137: GPIO_Init(UCOM_KEY1_GPIO, UCOM_KEY1_PIN, UCOM_KEY1_MODE);
      0080B6 4B 00            [ 1]  202 	push	#0x00
      0080B8 A6 08            [ 1]  203 	ld	a, #0x08
      0080BA AE 50 00         [ 2]  204 	ldw	x, #0x5000
      0080BD CD 80 D7         [ 4]  205 	call	_GPIO_Init
                                    206 ;	stm8s_blink_key_timer_main.c: 139: }
      0080C0 81               [ 4]  207 	ret
                                    208 ;	stm8s_blink_key_timer_main.c: 151: void Toggle(void)
                                    209 ;	-----------------------------------------
                                    210 ;	 function Toggle
                                    211 ;	-----------------------------------------
      0080C1                        212 _Toggle:
                                    213 ;	stm8s_blink_key_timer_main.c: 153: GPIO_WriteReverse(UCOM_LED1_GPIO, UCOM_LED1_PIN);
      0080C1 A6 01            [ 1]  214 	ld	a, #0x01
      0080C3 AE 50 0F         [ 2]  215 	ldw	x, #0x500f
                                    216 ;	stm8s_blink_key_timer_main.c: 154: }
      0080C6 CC 81 66         [ 2]  217 	jp	_GPIO_WriteReverse
                                    218 	.area CODE
                                    219 	.area CONST
                                    220 	.area INITIALIZER
                                    221 	.area CABS (ABS)
