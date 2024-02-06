                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_blink_key_irq_main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _EXTI_PORTB_IRQHandler
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
      008000 82 00 80 1F             46 	int s_GSINIT ; reset
      008004 82 00 00 00             47 	int 0x000000 ; trap
      008008 82 00 00 00             48 	int 0x000000 ; int0
      00800C 82 00 00 00             49 	int 0x000000 ; int1
      008010 82 00 00 00             50 	int 0x000000 ; int2
      008014 82 00 00 00             51 	int 0x000000 ; int3
      008018 82 00 80 3F             52 	int _EXTI_PORTB_IRQHandler ; int4
                                     53 ;--------------------------------------------------------
                                     54 ; global & static initialisations
                                     55 ;--------------------------------------------------------
                                     56 	.area HOME
                                     57 	.area GSINIT
                                     58 	.area GSFINAL
                                     59 	.area GSINIT
      00801F CD 80 A8         [ 4]   60 	call	___sdcc_external_startup
      008022                         61 __sdcc_init_data:
                                     62 ; stm8_genXINIT() start
      008022 AE 00 00         [ 2]   63 	ldw x, #l_DATA
      008025 27 07            [ 1]   64 	jreq	00002$
      008027                         65 00001$:
      008027 72 4F 00 00      [ 1]   66 	clr (s_DATA - 1, x)
      00802B 5A               [ 2]   67 	decw x
      00802C 26 F9            [ 1]   68 	jrne	00001$
      00802E                         69 00002$:
      00802E AE 00 00         [ 2]   70 	ldw	x, #l_INITIALIZER
      008031 27 09            [ 1]   71 	jreq	00004$
      008033                         72 00003$:
      008033 D6 80 3E         [ 1]   73 	ld	a, (s_INITIALIZER - 1, x)
      008036 D7 00 00         [ 1]   74 	ld	(s_INITIALIZED - 1, x), a
      008039 5A               [ 2]   75 	decw	x
      00803A 26 F7            [ 1]   76 	jrne	00003$
      00803C                         77 00004$:
                                     78 ; stm8_genXINIT() end
                                     79 	.area GSFINAL
      00803C CC 80 1C         [ 2]   80 	jp	__sdcc_program_startup
                                     81 ;--------------------------------------------------------
                                     82 ; Home
                                     83 ;--------------------------------------------------------
                                     84 	.area HOME
                                     85 	.area HOME
      00801C                         86 __sdcc_program_startup:
      00801C CC 80 48         [ 2]   87 	jp	_main
                                     88 ;	return from main will return to caller
                                     89 ;--------------------------------------------------------
                                     90 ; code
                                     91 ;--------------------------------------------------------
                                     92 	.area CODE
                                     93 ;	stm8s_blink_key_irq_main.c: 63: void EXTI_PORTB_IRQHandler(void) __interrupt(4)
                                     94 ;	-----------------------------------------
                                     95 ;	 function EXTI_PORTB_IRQHandler
                                     96 ;	-----------------------------------------
      00803F                         97 _EXTI_PORTB_IRQHandler:
                                     98 ;	stm8s_blink_key_irq_main.c: 69: UCOM_LED1_GPIO->ODR ^= (uint8_t)UCOM_LED1_PIN;
      00803F 90 10 50 0F      [ 1]   99 	bcpl	0x500f, #0
                                    100 ;	stm8s_blink_key_irq_main.c: 70: UCOM_KEY1_GPIO->CR2 &= (uint8_t)(~(UCOM_KEY1_PIN)); /* External interrupt disable */
      008043 72 1B 50 09      [ 1]  101 	bres	0x5009, #5
                                    102 ;	stm8s_blink_key_irq_main.c: 72: }
      008047 80               [11]  103 	iret
                                    104 ;	stm8s_blink_key_irq_main.c: 86: void main(void)
                                    105 ;	-----------------------------------------
                                    106 ;	 function main
                                    107 ;	-----------------------------------------
      008048                        108 _main:
                                    109 ;	stm8s_blink_key_irq_main.c: 92: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);    
      008048 C6 50 C6         [ 1]  110 	ld	a, 0x50c6
      00804B A4 E7            [ 1]  111 	and	a, #0xe7
      00804D C7 50 C6         [ 1]  112 	ld	0x50c6, a
                                    113 ;	stm8s_blink_key_irq_main.c: 94: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
      008050 C6 50 C6         [ 1]  114 	ld	a, 0x50c6
      008053 C7 50 C6         [ 1]  115 	ld	0x50c6, a
                                    116 ;	stm8s_blink_key_irq_main.c: 111: EXTI->CR1 &= (uint8_t)~(0x03<<EXTI_SHIFT_PORT); /* PB5 : UCOM_KEY1_GPIO */
      008056 C6 50 A0         [ 1]  117 	ld	a, 0x50a0
      008059 A4 F3            [ 1]  118 	and	a, #0xf3
      00805B C7 50 A0         [ 1]  119 	ld	0x50a0, a
                                    120 ;	stm8s_blink_key_irq_main.c: 112: EXTI->CR1 |= (vbData<<EXTI_SHIFT_PORT); /* PORT B */
      00805E 72 14 50 A0      [ 1]  121 	bset	0x50a0, #2
                                    122 ;	stm8s_blink_key_irq_main.c: 122: UCOM_LED1_GPIO->ODR &= (uint8_t)(~(UCOM_LED1_PIN)); /* Output mode  Low level */
      008062 72 11 50 0F      [ 1]  123 	bres	0x500f, #0
                                    124 ;	stm8s_blink_key_irq_main.c: 123: UCOM_LED1_GPIO->DDR |= (uint8_t)UCOM_LED1_PIN; /* Set Output mode */
      008066 72 10 50 11      [ 1]  125 	bset	0x5011, #0
                                    126 ;	stm8s_blink_key_irq_main.c: 124: UCOM_LED1_GPIO->CR1 |= (uint8_t)UCOM_LED1_PIN; /* Push-Pull */
      00806A 72 10 50 12      [ 1]  127 	bset	0x5012, #0
                                    128 ;	stm8s_blink_key_irq_main.c: 126: UCOM_LED1_GPIO->CR2 |= (uint8_t)UCOM_LED1_PIN; /* 10MHz */
      00806E 72 10 50 13      [ 1]  129 	bset	0x5013, #0
                                    130 ;	stm8s_blink_key_irq_main.c: 132: UCOM_KEY1_GPIO->DDR &= (uint8_t)(~(UCOM_KEY1_PIN)); /* Set Input mode */
      008072 72 1B 50 07      [ 1]  131 	bres	0x5007, #5
                                    132 ;	stm8s_blink_key_irq_main.c: 133: UCOM_KEY1_GPIO->CR1 |= (uint8_t)UCOM_KEY1_PIN; /* Pull-up */
      008076 72 1A 50 08      [ 1]  133 	bset	0x5008, #5
                                    134 ;	stm8s_blink_key_irq_main.c: 136: UCOM_KEY1_GPIO->CR2 &= (uint8_t)(~(UCOM_KEY1_PIN)); /* External interrupt disable */
      00807A 72 1B 50 09      [ 1]  135 	bres	0x5009, #5
                                    136 ;	stm8s_blink_key_irq_main.c: 139: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN; // led on...
      00807E C6 50 0F         [ 1]  137 	ld	a, 0x500f
      008081 A4 FE            [ 1]  138 	and	a, #0xfe
      008083 C7 50 0F         [ 1]  139 	ld	0x500f, a
                                    140 ;	stm8s_blink_key_irq_main.c: 144: enableInterrupts();
      008086 9A               [ 1]  141 	rim
                                    142 ;	stm8s_blink_key_irq_main.c: 147: uint32_t vwDelay = 0;
      008087 5F               [ 1]  143 	clrw	x
      008088 90 5F            [ 1]  144 	clrw	y
                                    145 ;	stm8s_blink_key_irq_main.c: 148: do {
      00808A                        146 00103$:
                                    147 ;	stm8s_blink_key_irq_main.c: 149: if(vwDelay==0) 
      00808A 5D               [ 2]  148 	tnzw	x
      00808B 26 11            [ 1]  149 	jrne	00102$
      00808D 90 5D            [ 2]  150 	tnzw	y
      00808F 26 0D            [ 1]  151 	jrne	00102$
                                    152 ;	stm8s_blink_key_irq_main.c: 151: vwDelay = 0x20000*5*20; // 10sec..
      008091 5F               [ 1]  153 	clrw	x
      008092 90 AE 00 C8      [ 2]  154 	ldw	y, #0x00c8
                                    155 ;	stm8s_blink_key_irq_main.c: 153: UCOM_LED1_GPIO->ODR ^= (uint8_t)UCOM_LED1_PIN;
      008096 90 10 50 0F      [ 1]  156 	bcpl	0x500f, #0
                                    157 ;	stm8s_blink_key_irq_main.c: 154: UCOM_KEY1_GPIO->CR2 |= (uint8_t)UCOM_KEY1_PIN; /* External interrupt enable */
      00809A 72 1A 50 09      [ 1]  158 	bset	0x5009, #5
      00809E                        159 00102$:
                                    160 ;	stm8s_blink_key_irq_main.c: 156: vwDelay--;
      00809E 1D 00 01         [ 2]  161 	subw	x, #0x0001
      0080A1 24 E7            [ 1]  162 	jrnc	00103$
      0080A3 90 5A            [ 2]  163 	decw	y
                                    164 ;	stm8s_blink_key_irq_main.c: 157: } while(1);
      0080A5 20 E3            [ 2]  165 	jra	00103$
                                    166 ;	stm8s_blink_key_irq_main.c: 184: }
      0080A7 81               [ 4]  167 	ret
                                    168 	.area CODE
                                    169 	.area CONST
                                    170 	.area INITIALIZER
                                    171 	.area CABS (ABS)
