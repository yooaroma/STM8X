                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_blink_key_tli_irq_main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _TLI_IRQHandler
                                     13 ;--------------------------------------------------------
                                     14 ; ram data
                                     15 ;--------------------------------------------------------
                                     16 	.area DATA
                                     17 ;--------------------------------------------------------
                                     18 ; ram data
                                     19 ;--------------------------------------------------------
                                     20 	.area INITIALIZED
                                     21 ;--------------------------------------------------------
                                     22 ; Stack segment in internal ram
                                     23 ;--------------------------------------------------------
                                     24 	.area SSEG
      000001                         25 __start__stack:
      000001                         26 	.ds	1
                                     27 
                                     28 ;--------------------------------------------------------
                                     29 ; absolute external ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DABS (ABS)
                                     32 
                                     33 ; default segment ordering for linker
                                     34 	.area HOME
                                     35 	.area GSINIT
                                     36 	.area GSFINAL
                                     37 	.area CONST
                                     38 	.area INITIALIZER
                                     39 	.area CODE
                                     40 
                                     41 ;--------------------------------------------------------
                                     42 ; interrupt vector
                                     43 ;--------------------------------------------------------
                                     44 	.area HOME
      008000                         45 __interrupt_vect:
      008000 82 00 80 0F             46 	int s_GSINIT ; reset
      008004 82 00 00 00             47 	int 0x000000 ; trap
      008008 82 00 80 2F             48 	int _TLI_IRQHandler ; int0
                                     49 ;--------------------------------------------------------
                                     50 ; global & static initialisations
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area GSINIT
                                     54 	.area GSFINAL
                                     55 	.area GSINIT
      00800F CD 80 8F         [ 4]   56 	call	___sdcc_external_startup
      008012                         57 __sdcc_init_data:
                                     58 ; stm8_genXINIT() start
      008012 AE 00 00         [ 2]   59 	ldw x, #l_DATA
      008015 27 07            [ 1]   60 	jreq	00002$
      008017                         61 00001$:
      008017 72 4F 00 00      [ 1]   62 	clr (s_DATA - 1, x)
      00801B 5A               [ 2]   63 	decw x
      00801C 26 F9            [ 1]   64 	jrne	00001$
      00801E                         65 00002$:
      00801E AE 00 00         [ 2]   66 	ldw	x, #l_INITIALIZER
      008021 27 09            [ 1]   67 	jreq	00004$
      008023                         68 00003$:
      008023 D6 80 2E         [ 1]   69 	ld	a, (s_INITIALIZER - 1, x)
      008026 D7 00 00         [ 1]   70 	ld	(s_INITIALIZED - 1, x), a
      008029 5A               [ 2]   71 	decw	x
      00802A 26 F7            [ 1]   72 	jrne	00003$
      00802C                         73 00004$:
                                     74 ; stm8_genXINIT() end
                                     75 	.area GSFINAL
      00802C CC 80 0C         [ 2]   76 	jp	__sdcc_program_startup
                                     77 ;--------------------------------------------------------
                                     78 ; Home
                                     79 ;--------------------------------------------------------
                                     80 	.area HOME
                                     81 	.area HOME
      00800C                         82 __sdcc_program_startup:
      00800C CC 80 38         [ 2]   83 	jp	_main
                                     84 ;	return from main will return to caller
                                     85 ;--------------------------------------------------------
                                     86 ; code
                                     87 ;--------------------------------------------------------
                                     88 	.area CODE
                                     89 ;	stm8s_blink_key_tli_irq_main.c: 70: void TLI_IRQHandler(void) __interrupt(0)
                                     90 ;	-----------------------------------------
                                     91 ;	 function TLI_IRQHandler
                                     92 ;	-----------------------------------------
      00802F                         93 _TLI_IRQHandler:
                                     94 ;	stm8s_blink_key_tli_irq_main.c: 76: UCOM_LED1_GPIO->ODR ^= (uint8_t)UCOM_LED1_PIN;
      00802F 90 10 50 0F      [ 1]   95 	bcpl	0x500f, #0
                                     96 ;	stm8s_blink_key_tli_irq_main.c: 77: UCOM_KEY_TLI_GPIO->CR2 &= (uint8_t)(~(UCOM_KEY_TLI_PIN)); /* External interrupt disable */
      008033 72 1F 50 13      [ 1]   97 	bres	0x5013, #7
                                     98 ;	stm8s_blink_key_tli_irq_main.c: 79: }
      008037 80               [11]   99 	iret
                                    100 ;	stm8s_blink_key_tli_irq_main.c: 93: void main(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function main
                                    103 ;	-----------------------------------------
      008038                        104 _main:
                                    105 ;	stm8s_blink_key_tli_irq_main.c: 99: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);    
      008038 C6 50 C6         [ 1]  106 	ld	a, 0x50c6
      00803B A4 E7            [ 1]  107 	and	a, #0xe7
      00803D C7 50 C6         [ 1]  108 	ld	0x50c6, a
                                    109 ;	stm8s_blink_key_tli_irq_main.c: 101: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
      008040 55 50 C6 50 C6   [ 1]  110 	mov	0x50c6, 0x50c6
                                    111 ;	stm8s_blink_key_tli_irq_main.c: 109: EXTI->CR2 &= (uint8_t)~(0x04); /* TLI : PD7 */
      008045 72 15 50 A1      [ 1]  112 	bres	0x50a1, #2
                                    113 ;	stm8s_blink_key_tli_irq_main.c: 110: EXTI->CR2 |= (vbData); /* TLI */
      008049 55 50 A1 50 A1   [ 1]  114 	mov	0x50a1, 0x50a1
                                    115 ;	stm8s_blink_key_tli_irq_main.c: 118: UCOM_LED1_GPIO->ODR &= (uint8_t)(~(UCOM_LED1_PIN)); /* Output mode  Low level */
      00804E 72 11 50 0F      [ 1]  116 	bres	0x500f, #0
                                    117 ;	stm8s_blink_key_tli_irq_main.c: 119: UCOM_LED1_GPIO->DDR |= (uint8_t)UCOM_LED1_PIN; /* Set Output mode */
      008052 72 10 50 11      [ 1]  118 	bset	0x5011, #0
                                    119 ;	stm8s_blink_key_tli_irq_main.c: 120: UCOM_LED1_GPIO->CR1 |= (uint8_t)UCOM_LED1_PIN; /* Push-Pull */
      008056 72 10 50 12      [ 1]  120 	bset	0x5012, #0
                                    121 ;	stm8s_blink_key_tli_irq_main.c: 122: UCOM_LED1_GPIO->CR2 |= (uint8_t)UCOM_LED1_PIN; /* 10MHz */
      00805A 72 10 50 13      [ 1]  122 	bset	0x5013, #0
                                    123 ;	stm8s_blink_key_tli_irq_main.c: 128: UCOM_KEY_TLI_GPIO->DDR &= (uint8_t)(~(UCOM_KEY_TLI_PIN)); /* Set Input mode */
      00805E 72 1F 50 11      [ 1]  124 	bres	0x5011, #7
                                    125 ;	stm8s_blink_key_tli_irq_main.c: 129: UCOM_KEY_TLI_GPIO->CR1 |= (uint8_t)UCOM_KEY_TLI_PIN; /* Pull-up */
      008062 72 1E 50 12      [ 1]  126 	bset	0x5012, #7
                                    127 ;	stm8s_blink_key_tli_irq_main.c: 132: UCOM_KEY_TLI_GPIO->CR2 &= (uint8_t)(~(UCOM_KEY_TLI_PIN)); /* External interrupt disable */
      008066 72 1F 50 13      [ 1]  128 	bres	0x5013, #7
                                    129 ;	stm8s_blink_key_tli_irq_main.c: 135: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN; // led on...
      00806A 72 11 50 0F      [ 1]  130 	bres	0x500f, #0
                                    131 ;	stm8s_blink_key_tli_irq_main.c: 143: uint32_t vwDelay = 0;
      00806E 5F               [ 1]  132 	clrw	x
      00806F 90 5F            [ 1]  133 	clrw	y
                                    134 ;	stm8s_blink_key_tli_irq_main.c: 144: do {
      008071                        135 00103$:
                                    136 ;	stm8s_blink_key_tli_irq_main.c: 145: if(vwDelay==0) 
      008071 5D               [ 2]  137 	tnzw	x
      008072 26 11            [ 1]  138 	jrne	00102$
      008074 90 5D            [ 2]  139 	tnzw	y
      008076 26 0D            [ 1]  140 	jrne	00102$
                                    141 ;	stm8s_blink_key_tli_irq_main.c: 147: vwDelay = 0x20000*5*20; // 10sec..
      008078 5F               [ 1]  142 	clrw	x
      008079 90 AE 00 C8      [ 2]  143 	ldw	y, #0x00c8
                                    144 ;	stm8s_blink_key_tli_irq_main.c: 149: UCOM_LED1_GPIO->ODR ^= (uint8_t)UCOM_LED1_PIN;
      00807D 90 10 50 0F      [ 1]  145 	bcpl	0x500f, #0
                                    146 ;	stm8s_blink_key_tli_irq_main.c: 150: UCOM_KEY_TLI_GPIO->CR2 |= (uint8_t)UCOM_KEY_TLI_PIN; /* External interrupt enable */
      008081 72 1E 50 13      [ 1]  147 	bset	0x5013, #7
      008085                        148 00102$:
                                    149 ;	stm8s_blink_key_tli_irq_main.c: 152: vwDelay--;
      008085 1D 00 01         [ 2]  150 	subw	x, #0x0001
      008088 24 E7            [ 1]  151 	jrnc	00103$
      00808A 90 5A            [ 2]  152 	decw	y
                                    153 ;	stm8s_blink_key_tli_irq_main.c: 153: } while(1);
      00808C 20 E3            [ 2]  154 	jra	00103$
                                    155 ;	stm8s_blink_key_tli_irq_main.c: 180: }
      00808E 81               [ 4]  156 	ret
                                    157 	.area CODE
                                    158 	.area CONST
                                    159 	.area INITIALIZER
                                    160 	.area CABS (ABS)
