                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_blink_key_main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 ;--------------------------------------------------------
                                     13 ; ram data
                                     14 ;--------------------------------------------------------
                                     15 	.area DATA
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area INITIALIZED
                                     20 ;--------------------------------------------------------
                                     21 ; Stack segment in internal ram
                                     22 ;--------------------------------------------------------
                                     23 	.area SSEG
      000001                         24 __start__stack:
      000001                         25 	.ds	1
                                     26 
                                     27 ;--------------------------------------------------------
                                     28 ; absolute external ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DABS (ABS)
                                     31 
                                     32 ; default segment ordering for linker
                                     33 	.area HOME
                                     34 	.area GSINIT
                                     35 	.area GSFINAL
                                     36 	.area CONST
                                     37 	.area INITIALIZER
                                     38 	.area CODE
                                     39 
                                     40 ;--------------------------------------------------------
                                     41 ; interrupt vector
                                     42 ;--------------------------------------------------------
                                     43 	.area HOME
      008000                         44 __interrupt_vect:
      008000 82 00 80 07             45 	int s_GSINIT ; reset
                                     46 ;--------------------------------------------------------
                                     47 ; global & static initialisations
                                     48 ;--------------------------------------------------------
                                     49 	.area HOME
                                     50 	.area GSINIT
                                     51 	.area GSFINAL
                                     52 	.area GSINIT
      008007 CD 80 7A         [ 4]   53 	call	___sdcc_external_startup
      00800A                         54 __sdcc_init_data:
                                     55 ; stm8_genXINIT() start
      00800A AE 00 00         [ 2]   56 	ldw x, #l_DATA
      00800D 27 07            [ 1]   57 	jreq	00002$
      00800F                         58 00001$:
      00800F 72 4F 00 00      [ 1]   59 	clr (s_DATA - 1, x)
      008013 5A               [ 2]   60 	decw x
      008014 26 F9            [ 1]   61 	jrne	00001$
      008016                         62 00002$:
      008016 AE 00 00         [ 2]   63 	ldw	x, #l_INITIALIZER
      008019 27 09            [ 1]   64 	jreq	00004$
      00801B                         65 00003$:
      00801B D6 80 26         [ 1]   66 	ld	a, (s_INITIALIZER - 1, x)
      00801E D7 00 00         [ 1]   67 	ld	(s_INITIALIZED - 1, x), a
      008021 5A               [ 2]   68 	decw	x
      008022 26 F7            [ 1]   69 	jrne	00003$
      008024                         70 00004$:
                                     71 ; stm8_genXINIT() end
                                     72 	.area GSFINAL
      008024 CC 80 04         [ 2]   73 	jp	__sdcc_program_startup
                                     74 ;--------------------------------------------------------
                                     75 ; Home
                                     76 ;--------------------------------------------------------
                                     77 	.area HOME
                                     78 	.area HOME
      008004                         79 __sdcc_program_startup:
      008004 CC 80 27         [ 2]   80 	jp	_main
                                     81 ;	return from main will return to caller
                                     82 ;--------------------------------------------------------
                                     83 ; code
                                     84 ;--------------------------------------------------------
                                     85 	.area CODE
                                     86 ;	stm8s_blink_key_main.c: 60: void main(void)
                                     87 ;	-----------------------------------------
                                     88 ;	 function main
                                     89 ;	-----------------------------------------
      008027                         90 _main:
                                     91 ;	stm8s_blink_key_main.c: 66: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);    
      008027 C6 50 C6         [ 1]   92 	ld	a, 0x50c6
      00802A A4 E7            [ 1]   93 	and	a, #0xe7
      00802C C7 50 C6         [ 1]   94 	ld	0x50c6, a
                                     95 ;	stm8s_blink_key_main.c: 68: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
      00802F 55 50 C6 50 C6   [ 1]   96 	mov	0x50c6, 0x50c6
                                     97 ;	stm8s_blink_key_main.c: 76: UCOM_LED1_GPIO->ODR &= (uint8_t)(~(UCOM_LED1_PIN)); /* Output mode  Low level */
      008034 72 11 50 0F      [ 1]   98 	bres	0x500f, #0
                                     99 ;	stm8s_blink_key_main.c: 77: UCOM_LED1_GPIO->DDR |= (uint8_t)UCOM_LED1_PIN; /* Set Output mode */
      008038 72 10 50 11      [ 1]  100 	bset	0x5011, #0
                                    101 ;	stm8s_blink_key_main.c: 78: UCOM_LED1_GPIO->CR1 |= (uint8_t)UCOM_LED1_PIN; /* Push-Pull */
      00803C 72 10 50 12      [ 1]  102 	bset	0x5012, #0
                                    103 ;	stm8s_blink_key_main.c: 80: UCOM_LED1_GPIO->CR2 |= (uint8_t)UCOM_LED1_PIN; /* 10MHz */
      008040 72 10 50 13      [ 1]  104 	bset	0x5013, #0
                                    105 ;	stm8s_blink_key_main.c: 86: UCOM_KEY1_GPIO->DDR &= (uint8_t)(~(UCOM_KEY1_PIN)); /* Set Input mode */
      008044 72 1B 50 07      [ 1]  106 	bres	0x5007, #5
                                    107 ;	stm8s_blink_key_main.c: 87: UCOM_KEY1_GPIO->CR1 |= (uint8_t)UCOM_KEY1_PIN; /* Pull-up */
      008048 72 1A 50 08      [ 1]  108 	bset	0x5008, #5
                                    109 ;	stm8s_blink_key_main.c: 90: UCOM_KEY1_GPIO->CR2 &= (uint8_t)(~(UCOM_KEY1_PIN)); /* External interrupt disable */
      00804C 72 1B 50 09      [ 1]  110 	bres	0x5009, #5
                                    111 ;	stm8s_blink_key_main.c: 94: uint32_t vdwDelay = 0;
      008050 5F               [ 1]  112 	clrw	x
      008051 90 5F            [ 1]  113 	clrw	y
                                    114 ;	stm8s_blink_key_main.c: 95: do {
      008053                        115 00107$:
                                    116 ;	stm8s_blink_key_main.c: 96: if((UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)==0)
      008053 72 0A 50 06 06   [ 2]  117 	btjt	0x5006, #5, 00105$
                                    118 ;	stm8s_blink_key_main.c: 98: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
      008058 72 11 50 0F      [ 1]  119 	bres	0x500f, #0
      00805C 20 F5            [ 2]  120 	jra	00107$
      00805E                        121 00105$:
                                    122 ;	stm8s_blink_key_main.c: 103: if(vdwDelay)
      00805E 5D               [ 2]  123 	tnzw	x
      00805F 26 04            [ 1]  124 	jrne	00128$
      008061 90 5D            [ 2]  125 	tnzw	y
      008063 27 09            [ 1]  126 	jreq	00102$
      008065                        127 00128$:
                                    128 ;	stm8s_blink_key_main.c: 105: vdwDelay--;
      008065 1D 00 01         [ 2]  129 	subw	x, #0x0001
      008068 24 E9            [ 1]  130 	jrnc	00107$
      00806A 90 5A            [ 2]  131 	decw	y
      00806C 20 E5            [ 2]  132 	jra	00107$
      00806E                        133 00102$:
                                    134 ;	stm8s_blink_key_main.c: 109: vdwDelay = 0x20000*5;
      00806E 5F               [ 1]  135 	clrw	x
      00806F 90 AE 00 0A      [ 2]  136 	ldw	y, #0x000a
                                    137 ;	stm8s_blink_key_main.c: 111: UCOM_LED1_GPIO->ODR ^= (uint8_t)UCOM_LED1_PIN;
      008073 90 10 50 0F      [ 1]  138 	bcpl	0x500f, #0
                                    139 ;	stm8s_blink_key_main.c: 114: } while(1);
      008077 20 DA            [ 2]  140 	jra	00107$
                                    141 ;	stm8s_blink_key_main.c: 116: }
      008079 81               [ 4]  142 	ret
                                    143 	.area CODE
                                    144 	.area CONST
                                    145 	.area INITIALIZER
                                    146 	.area CABS (ABS)
