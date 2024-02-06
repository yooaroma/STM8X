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
                                     11 	.globl _gwMibSec
                                     12 	.globl _gwMibMsec
                                     13 	.globl _timIrqInit
                                     14 	.globl _timIrqMain
                                     15 	.globl _MibGetSecs
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area DATA
      000043                         20 _gwMibMsec::
      000043                         21 	.ds 2
      000045                         22 _gwMibSec::
      000045                         23 	.ds 2
                                     24 ;--------------------------------------------------------
                                     25 ; ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area INITIALIZED
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
                                     42 ; global & static initialisations
                                     43 ;--------------------------------------------------------
                                     44 	.area HOME
                                     45 	.area GSINIT
                                     46 	.area GSFINAL
                                     47 	.area GSINIT
                                     48 ;--------------------------------------------------------
                                     49 ; Home
                                     50 ;--------------------------------------------------------
                                     51 	.area HOME
                                     52 	.area HOME
                                     53 ;--------------------------------------------------------
                                     54 ; code
                                     55 ;--------------------------------------------------------
                                     56 	.area CODE
                                     57 ;	./../../mib/stm8s_mib_debug_tim.c: 33: void timIrqInit(void)
                                     58 ;	-----------------------------------------
                                     59 ;	 function timIrqInit
                                     60 ;	-----------------------------------------
      009198                         61 _timIrqInit:
                                     62 ;	./../../mib/stm8s_mib_debug_tim.c: 35: gwMibSec = 0;
      009198 5F               [ 1]   63 	clrw	x
      009199 CF 00 45         [ 2]   64 	ldw	_gwMibSec+0, x
                                     65 ;	./../../mib/stm8s_mib_debug_tim.c: 36: gwMibMsec = 0;
      00919C 5F               [ 1]   66 	clrw	x
      00919D CF 00 43         [ 2]   67 	ldw	_gwMibMsec+0, x
                                     68 ;	./../../mib/stm8s_mib_debug_tim.c: 62: TIM4->PSCR  = TIM4_PRESCALER_128; // 7
      0091A0 35 07 53 45      [ 1]   69 	mov	0x5345+0, #0x07
                                     70 ;	./../../mib/stm8s_mib_debug_tim.c: 63: TIM4->ARR = (uint8_t)~(_MM_UCOM_MSEC_-1);
      0091A4 35 B8 53 46      [ 1]   71 	mov	0x5346+0, #0xb8
                                     72 ;	./../../mib/stm8s_mib_debug_tim.c: 64: TIM4->CNTR = TIM4->ARR;
      0091A8 55 53 46 53 44   [ 1]   73 	mov	0x5344, 0x5346
                                     74 ;	./../../mib/stm8s_mib_debug_tim.c: 65: TIM4->SR1 = (uint8_t)(~TIM4_FLAG_UPDATE);
      0091AD 35 FE 53 42      [ 1]   75 	mov	0x5342+0, #0xfe
                                     76 ;	./../../mib/stm8s_mib_debug_tim.c: 67: TIM4->IER = TIM4_IER_UIE;
      0091B1 35 01 53 41      [ 1]   77 	mov	0x5341+0, #0x01
                                     78 ;	./../../mib/stm8s_mib_debug_tim.c: 68: TIM4->CR1 = TIM4_CR1_CEN | TIM4_CR1_ARPE;
      0091B5 35 81 53 40      [ 1]   79 	mov	0x5340+0, #0x81
                                     80 ;	./../../mib/stm8s_mib_debug_tim.c: 70: }
      0091B9 81               [ 4]   81 	ret
                                     82 ;	./../../mib/stm8s_mib_debug_tim.c: 81: void timIrqMain(void)
                                     83 ;	-----------------------------------------
                                     84 ;	 function timIrqMain
                                     85 ;	-----------------------------------------
      0091BA                         86 _timIrqMain:
                                     87 ;	./../../mib/stm8s_mib_debug_tim.c: 83: if(gwMibMsec) 
      0091BA CE 00 43         [ 2]   88 	ldw	x, _gwMibMsec+0
      0091BD 27 08            [ 1]   89 	jreq	00102$
                                     90 ;	./../../mib/stm8s_mib_debug_tim.c: 85: gwMibMsec--;
      0091BF CE 00 43         [ 2]   91 	ldw	x, _gwMibMsec+0
      0091C2 5A               [ 2]   92 	decw	x
      0091C3 CF 00 43         [ 2]   93 	ldw	_gwMibMsec+0, x
      0091C6 81               [ 4]   94 	ret
      0091C7                         95 00102$:
                                     96 ;	./../../mib/stm8s_mib_debug_tim.c: 90: gwMibMsec = 680; // 시간을 측정하여 조정한다.
      0091C7 AE 02 A8         [ 2]   97 	ldw	x, #0x02a8
      0091CA CF 00 43         [ 2]   98 	ldw	_gwMibMsec+0, x
                                     99 ;	./../../mib/stm8s_mib_debug_tim.c: 91: gwMibSec++;
      0091CD CE 00 45         [ 2]  100 	ldw	x, _gwMibSec+0
      0091D0 5C               [ 1]  101 	incw	x
      0091D1 CF 00 45         [ 2]  102 	ldw	_gwMibSec+0, x
                                    103 ;	./../../mib/stm8s_mib_debug_tim.c: 93: }
      0091D4 81               [ 4]  104 	ret
                                    105 ;	./../../mib/stm8s_mib_debug_tim.c: 104: uint16_t MibGetSecs(void)
                                    106 ;	-----------------------------------------
                                    107 ;	 function MibGetSecs
                                    108 ;	-----------------------------------------
      0091D5                        109 _MibGetSecs:
                                    110 ;	./../../mib/stm8s_mib_debug_tim.c: 106: return gwMibSec; // gwMibSec;
      0091D5 CE 00 45         [ 2]  111 	ldw	x, _gwMibSec+0
                                    112 ;	./../../mib/stm8s_mib_debug_tim.c: 107: }
      0091D8 81               [ 4]  113 	ret
                                    114 	.area CODE
                                    115 	.area CONST
                                    116 	.area INITIALIZER
                                    117 	.area CABS (ABS)
