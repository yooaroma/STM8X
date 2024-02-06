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
                                     11 	.globl _gbMibMiliSec
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
      000047                         26 _gbMibMiliSec::
      000047                         27 	.ds 1
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
      00B060                         65 _timIrqInit:
                                     66 ;	./../../mib/stm8s_mib_debug_tim.c: 36: gwMibSec = 0;
      00B060 5F               [ 1]   67 	clrw	x
      00B061 CF 00 45         [ 2]   68 	ldw	_gwMibSec+0, x
                                     69 ;	./../../mib/stm8s_mib_debug_tim.c: 37: gwMibMsec = 0;
      00B064 5F               [ 1]   70 	clrw	x
      00B065 CF 00 43         [ 2]   71 	ldw	_gwMibMsec+0, x
                                     72 ;	./../../mib/stm8s_mib_debug_tim.c: 63: TIM4->PSCR  = TIM4_PRESCALER_128; // 7 : 8 usec...
      00B068 35 07 53 45      [ 1]   73 	mov	0x5345+0, #0x07
                                     74 ;	./../../mib/stm8s_mib_debug_tim.c: 64: TIM4->ARR = (uint8_t)(_MM_UCOM_MSEC_-1); // 8 * 125 = 1000 usec = 1 msec...
      00B06C 35 7C 53 46      [ 1]   75 	mov	0x5346+0, #0x7c
                                     76 ;	./../../mib/stm8s_mib_debug_tim.c: 66: TIM4->CNTR = TIM4->ARR;
      00B070 55 53 46 53 44   [ 1]   77 	mov	0x5344, 0x5346
                                     78 ;	./../../mib/stm8s_mib_debug_tim.c: 67: TIM4->SR1 = (uint8_t)(~TIM4_FLAG_UPDATE);
      00B075 35 FE 53 42      [ 1]   79 	mov	0x5342+0, #0xfe
                                     80 ;	./../../mib/stm8s_mib_debug_tim.c: 69: TIM4->IER = TIM4_IER_UIE;
      00B079 35 01 53 41      [ 1]   81 	mov	0x5341+0, #0x01
                                     82 ;	./../../mib/stm8s_mib_debug_tim.c: 70: TIM4->CR1 = TIM4_CR1_CEN | TIM4_CR1_ARPE;
      00B07D 35 81 53 40      [ 1]   83 	mov	0x5340+0, #0x81
                                     84 ;	./../../mib/stm8s_mib_debug_tim.c: 72: }
      00B081 81               [ 4]   85 	ret
                                     86 ;	./../../mib/stm8s_mib_debug_tim.c: 83: void timIrqMain(void)
                                     87 ;	-----------------------------------------
                                     88 ;	 function timIrqMain
                                     89 ;	-----------------------------------------
      00B082                         90 _timIrqMain:
                                     91 ;	./../../mib/stm8s_mib_debug_tim.c: 85: if(gwMibMsec) 
      00B082 CE 00 43         [ 2]   92 	ldw	x, _gwMibMsec+0
      00B085 27 09            [ 1]   93 	jreq	00102$
                                     94 ;	./../../mib/stm8s_mib_debug_tim.c: 87: gwMibMsec--;
      00B087 CE 00 43         [ 2]   95 	ldw	x, _gwMibMsec+0
      00B08A 5A               [ 2]   96 	decw	x
      00B08B CF 00 43         [ 2]   97 	ldw	_gwMibMsec+0, x
      00B08E 20 0D            [ 2]   98 	jra	00103$
      00B090                         99 00102$:
                                    100 ;	./../../mib/stm8s_mib_debug_tim.c: 92: gwMibMsec = 999; // 시간을 측정하여 조정한다.
      00B090 AE 03 E7         [ 2]  101 	ldw	x, #0x03e7
      00B093 CF 00 43         [ 2]  102 	ldw	_gwMibMsec+0, x
                                    103 ;	./../../mib/stm8s_mib_debug_tim.c: 93: gwMibSec++;
      00B096 CE 00 45         [ 2]  104 	ldw	x, _gwMibSec+0
      00B099 5C               [ 1]  105 	incw	x
      00B09A CF 00 45         [ 2]  106 	ldw	_gwMibSec+0, x
      00B09D                        107 00103$:
                                    108 ;	./../../mib/stm8s_mib_debug_tim.c: 95: if(gbMibMiliSec) gbMibMiliSec--;  
      00B09D C6 00 47         [ 1]  109 	ld	a, _gbMibMiliSec+0
      00B0A0 26 01            [ 1]  110 	jrne	00119$
      00B0A2 81               [ 4]  111 	ret
      00B0A3                        112 00119$:
      00B0A3 72 5A 00 47      [ 1]  113 	dec	_gbMibMiliSec+0
                                    114 ;	./../../mib/stm8s_mib_debug_tim.c: 96: }
      00B0A7 81               [ 4]  115 	ret
                                    116 ;	./../../mib/stm8s_mib_debug_tim.c: 107: uint16_t MibGetSecs(void)
                                    117 ;	-----------------------------------------
                                    118 ;	 function MibGetSecs
                                    119 ;	-----------------------------------------
      00B0A8                        120 _MibGetSecs:
                                    121 ;	./../../mib/stm8s_mib_debug_tim.c: 109: return gwMibSec; // gwMibSec;
      00B0A8 CE 00 45         [ 2]  122 	ldw	x, _gwMibSec+0
                                    123 ;	./../../mib/stm8s_mib_debug_tim.c: 110: }
      00B0AB 81               [ 4]  124 	ret
                                    125 ;	./../../mib/stm8s_mib_debug_tim.c: 121: void delay_ms(uint8_t vbDelay)
                                    126 ;	-----------------------------------------
                                    127 ;	 function delay_ms
                                    128 ;	-----------------------------------------
      00B0AC                        129 _delay_ms:
      00B0AC C7 00 47         [ 1]  130 	ld	_gbMibMiliSec+0, a
                                    131 ;	./../../mib/stm8s_mib_debug_tim.c: 124: do {
      00B0AF                        132 00103$:
                                    133 ;	./../../mib/stm8s_mib_debug_tim.c: 125: if(gbMibMiliSec==0) break;
      00B0AF C6 00 47         [ 1]  134 	ld	a, _gbMibMiliSec+0
      00B0B2 26 FB            [ 1]  135 	jrne	00103$
                                    136 ;	./../../mib/stm8s_mib_debug_tim.c: 126: } while (1);
                                    137 ;	./../../mib/stm8s_mib_debug_tim.c: 127: }
      00B0B4 81               [ 4]  138 	ret
                                    139 	.area CODE
                                    140 	.area CONST
                                    141 	.area INITIALIZER
                                    142 	.area CABS (ABS)
