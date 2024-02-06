                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_mib_debug_tim
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _gwMibMiliSec
                                     12 	.globl _gwMibSec
                                     13 	.globl _gwMibMsec
                                     14 	.globl _timIrqInit
                                     15 	.globl _timIrqMain
                                     16 	.globl _MibGetSecs
                                     17 	.globl _delay_ms
                                     18 ;--------------------------------------------------------
                                     19 ; ram data
                                     20 ;--------------------------------------------------------
                                     21 	.area DATA
      000043                         22 _gwMibMsec::
      000043                         23 	.ds 2
      000045                         24 _gwMibSec::
      000045                         25 	.ds 2
      000047                         26 _gwMibMiliSec::
      000047                         27 	.ds 2
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area INITIALIZED
                                     32 ;--------------------------------------------------------
                                     33 ; absolute external ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area DABS (ABS)
                                     36 
                                     37 ; default segment ordering for linker
                                     38 	.area HOME
                                     39 	.area GSINIT
                                     40 	.area GSFINAL
                                     41 	.area CONST
                                     42 	.area INITIALIZER
                                     43 	.area CODE
                                     44 
                                     45 ;--------------------------------------------------------
                                     46 ; global & static initialisations
                                     47 ;--------------------------------------------------------
                                     48 	.area HOME
                                     49 	.area GSINIT
                                     50 	.area GSFINAL
                                     51 	.area GSINIT
                                     52 ;--------------------------------------------------------
                                     53 ; Home
                                     54 ;--------------------------------------------------------
                                     55 	.area HOME
                                     56 	.area HOME
                                     57 ;--------------------------------------------------------
                                     58 ; code
                                     59 ;--------------------------------------------------------
                                     60 	.area CODE
                                     61 ;	./../../mib/stm8s_mib_debug_tim.c: 34: void timIrqInit(void)
                                     62 ;	-----------------------------------------
                                     63 ;	 function timIrqInit
                                     64 ;	-----------------------------------------
      009FE2                         65 _timIrqInit:
                                     66 ;	./../../mib/stm8s_mib_debug_tim.c: 36: gwMibSec = 0;
      009FE2 5F               [ 1]   67 	clrw	x
      009FE3 CF 00 45         [ 2]   68 	ldw	_gwMibSec+0, x
                                     69 ;	./../../mib/stm8s_mib_debug_tim.c: 37: gwMibMsec = 0;
      009FE6 5F               [ 1]   70 	clrw	x
      009FE7 CF 00 43         [ 2]   71 	ldw	_gwMibMsec+0, x
                                     72 ;	./../../mib/stm8s_mib_debug_tim.c: 67: TIM4->PSCR  = TIM4_PRESCALER_128; // 7 : 8 usec...
      009FEA 35 07 53 45      [ 1]   73 	mov	0x5345+0, #0x07
                                     74 ;	./../../mib/stm8s_mib_debug_tim.c: 68: TIM4->ARR = (uint8_t)(_MM_UCOM_MSEC_-1); // 8 * 125 = 1000 usec = 1 msec...
      009FEE 35 7C 53 46      [ 1]   75 	mov	0x5346+0, #0x7c
                                     76 ;	./../../mib/stm8s_mib_debug_tim.c: 70: TIM4->CNTR = TIM4->ARR;
      009FF2 55 53 46 53 44   [ 1]   77 	mov	0x5344, 0x5346
                                     78 ;	./../../mib/stm8s_mib_debug_tim.c: 71: TIM4->SR1 = (uint8_t)(~TIM4_FLAG_UPDATE);
      009FF7 35 FE 53 42      [ 1]   79 	mov	0x5342+0, #0xfe
                                     80 ;	./../../mib/stm8s_mib_debug_tim.c: 73: TIM4->IER = TIM4_IER_UIE;
      009FFB 35 01 53 41      [ 1]   81 	mov	0x5341+0, #0x01
                                     82 ;	./../../mib/stm8s_mib_debug_tim.c: 74: TIM4->CR1 = TIM4_CR1_CEN | TIM4_CR1_ARPE;
      009FFF 35 81 53 40      [ 1]   83 	mov	0x5340+0, #0x81
                                     84 ;	./../../mib/stm8s_mib_debug_tim.c: 76: }
      00A003 81               [ 4]   85 	ret
                                     86 ;	./../../mib/stm8s_mib_debug_tim.c: 87: void timIrqMain(void)
                                     87 ;	-----------------------------------------
                                     88 ;	 function timIrqMain
                                     89 ;	-----------------------------------------
      00A004                         90 _timIrqMain:
                                     91 ;	./../../mib/stm8s_mib_debug_tim.c: 89: if(gwMibMsec) 
      00A004 CE 00 43         [ 2]   92 	ldw	x, _gwMibMsec+0
      00A007 27 09            [ 1]   93 	jreq	00102$
                                     94 ;	./../../mib/stm8s_mib_debug_tim.c: 91: gwMibMsec--;
      00A009 CE 00 43         [ 2]   95 	ldw	x, _gwMibMsec+0
      00A00C 5A               [ 2]   96 	decw	x
      00A00D CF 00 43         [ 2]   97 	ldw	_gwMibMsec+0, x
      00A010 20 0D            [ 2]   98 	jra	00103$
      00A012                         99 00102$:
                                    100 ;	./../../mib/stm8s_mib_debug_tim.c: 96: gwMibMsec = 999; // 시간을 측정하여 조정한다.
      00A012 AE 03 E7         [ 2]  101 	ldw	x, #0x03e7
      00A015 CF 00 43         [ 2]  102 	ldw	_gwMibMsec+0, x
                                    103 ;	./../../mib/stm8s_mib_debug_tim.c: 97: gwMibSec++;
      00A018 CE 00 45         [ 2]  104 	ldw	x, _gwMibSec+0
      00A01B 5C               [ 1]  105 	incw	x
      00A01C CF 00 45         [ 2]  106 	ldw	_gwMibSec+0, x
      00A01F                        107 00103$:
                                    108 ;	./../../mib/stm8s_mib_debug_tim.c: 99: if(gwMibMiliSec) gwMibMiliSec--;  
      00A01F CE 00 47         [ 2]  109 	ldw	x, _gwMibMiliSec+0
      00A022 26 01            [ 1]  110 	jrne	00119$
      00A024 81               [ 4]  111 	ret
      00A025                        112 00119$:
      00A025 CE 00 47         [ 2]  113 	ldw	x, _gwMibMiliSec+0
      00A028 5A               [ 2]  114 	decw	x
      00A029 CF 00 47         [ 2]  115 	ldw	_gwMibMiliSec+0, x
                                    116 ;	./../../mib/stm8s_mib_debug_tim.c: 100: }
      00A02C 81               [ 4]  117 	ret
                                    118 ;	./../../mib/stm8s_mib_debug_tim.c: 111: uint16_t MibGetSecs(void)
                                    119 ;	-----------------------------------------
                                    120 ;	 function MibGetSecs
                                    121 ;	-----------------------------------------
      00A02D                        122 _MibGetSecs:
                                    123 ;	./../../mib/stm8s_mib_debug_tim.c: 113: return gwMibSec; // gwMibSec;
      00A02D CE 00 45         [ 2]  124 	ldw	x, _gwMibSec+0
                                    125 ;	./../../mib/stm8s_mib_debug_tim.c: 114: }
      00A030 81               [ 4]  126 	ret
                                    127 ;	./../../mib/stm8s_mib_debug_tim.c: 125: void delay_ms(uint8_t vbDelay)
                                    128 ;	-----------------------------------------
                                    129 ;	 function delay_ms
                                    130 ;	-----------------------------------------
      00A031                        131 _delay_ms:
                                    132 ;	./../../mib/stm8s_mib_debug_tim.c: 127: gwMibMiliSec = vbDelay;
      00A031 5F               [ 1]  133 	clrw	x
      00A032 97               [ 1]  134 	ld	xl, a
      00A033 CF 00 47         [ 2]  135 	ldw	_gwMibMiliSec+0, x
                                    136 ;	./../../mib/stm8s_mib_debug_tim.c: 128: do {
      00A036                        137 00103$:
                                    138 ;	./../../mib/stm8s_mib_debug_tim.c: 129: if(gwMibMiliSec==0) break;
      00A036 CE 00 47         [ 2]  139 	ldw	x, _gwMibMiliSec+0
      00A039 26 FB            [ 1]  140 	jrne	00103$
                                    141 ;	./../../mib/stm8s_mib_debug_tim.c: 130: } while (1);
                                    142 ;	./../../mib/stm8s_mib_debug_tim.c: 131: }
      00A03B 81               [ 4]  143 	ret
                                    144 	.area CODE
                                    145 	.area CONST
                                    146 	.area INITIALIZER
                                    147 	.area CABS (ABS)
