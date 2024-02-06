                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_blink_main
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
      008007 CD 80 63         [ 4]   53 	call	___sdcc_external_startup
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
                                     86 ;	stm8s_blink_main.c: 53: void main(void)
                                     87 ;	-----------------------------------------
                                     88 ;	 function main
                                     89 ;	-----------------------------------------
      008027                         90 _main:
                                     91 ;	stm8s_blink_main.c: 59: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);    
      008027 C6 50 C6         [ 1]   92 	ld	a, 0x50c6
      00802A A4 E7            [ 1]   93 	and	a, #0xe7
      00802C C7 50 C6         [ 1]   94 	ld	0x50c6, a
                                     95 ;	stm8s_blink_main.c: 61: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
      00802F 55 50 C6 50 C6   [ 1]   96 	mov	0x50c6, 0x50c6
                                     97 ;	stm8s_blink_main.c: 70: UCOM_LED1_GPIO->ODR &= (uint8_t)(~(UCOM_LED1_PIN)); /* Output mode  Low level */
      008034 72 11 50 0F      [ 1]   98 	bres	0x500f, #0
                                     99 ;	stm8s_blink_main.c: 71: UCOM_LED1_GPIO->DDR |= (uint8_t)UCOM_LED1_PIN; /* Set Output mode */
      008038 72 10 50 11      [ 1]  100 	bset	0x5011, #0
                                    101 ;	stm8s_blink_main.c: 72: UCOM_LED1_GPIO->CR1 |= (uint8_t)UCOM_LED1_PIN; /* Push-Pull */
      00803C 72 10 50 12      [ 1]  102 	bset	0x5012, #0
                                    103 ;	stm8s_blink_main.c: 74: UCOM_LED1_GPIO->CR2 |= (uint8_t)UCOM_LED1_PIN; /* 10MHz */
      008040 72 10 50 13      [ 1]  104 	bset	0x5013, #0
                                    105 ;	stm8s_blink_main.c: 79: uint32_t vdwDelay = 0;
      008044 5F               [ 1]  106 	clrw	x
      008045 90 5F            [ 1]  107 	clrw	y
                                    108 ;	stm8s_blink_main.c: 80: do {
      008047                        109 00104$:
                                    110 ;	stm8s_blink_main.c: 81: if(vdwDelay)
      008047 5D               [ 2]  111 	tnzw	x
      008048 26 04            [ 1]  112 	jrne	00119$
      00804A 90 5D            [ 2]  113 	tnzw	y
      00804C 27 09            [ 1]  114 	jreq	00102$
      00804E                        115 00119$:
                                    116 ;	stm8s_blink_main.c: 83: vdwDelay--;
      00804E 1D 00 01         [ 2]  117 	subw	x, #0x0001
      008051 24 F4            [ 1]  118 	jrnc	00104$
      008053 90 5A            [ 2]  119 	decw	y
      008055 20 F0            [ 2]  120 	jra	00104$
      008057                        121 00102$:
                                    122 ;	stm8s_blink_main.c: 87: vdwDelay = 0x20000*5;
      008057 5F               [ 1]  123 	clrw	x
      008058 90 AE 00 0A      [ 2]  124 	ldw	y, #0x000a
                                    125 ;	stm8s_blink_main.c: 89: UCOM_LED1_GPIO->ODR ^= (uint8_t)UCOM_LED1_PIN;
      00805C 90 10 50 0F      [ 1]  126 	bcpl	0x500f, #0
                                    127 ;	stm8s_blink_main.c: 91: } while(1);
      008060 20 E5            [ 2]  128 	jra	00104$
                                    129 ;	stm8s_blink_main.c: 93: }
      008062 81               [ 4]  130 	ret
                                    131 	.area CODE
                                    132 	.area CONST
                                    133 	.area INITIALIZER
                                    134 	.area CABS (ABS)
