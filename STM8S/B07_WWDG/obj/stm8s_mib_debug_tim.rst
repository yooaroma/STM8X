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
                                     12 	.globl _gbMibMiliSec
                                     13 	.globl _gwMibSec
                                     14 	.globl _gwMibMsec
                                     15 	.globl _timIrqInit
                                     16 	.globl _timIrqMain
                                     17 	.globl _MibGetSecs
                                     18 	.globl _delay_ms
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area DATA
      000043                         23 _gwMibMsec::
      000043                         24 	.ds 2
      000045                         25 _gwMibSec::
      000045                         26 	.ds 2
      000047                         27 _gbMibMiliSec::
      000047                         28 	.ds 1
      000048                         29 _gwMibMiliSec::
      000048                         30 	.ds 2
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area INITIALIZED
                                     35 ;--------------------------------------------------------
                                     36 ; absolute external ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area DABS (ABS)
                                     39 
                                     40 ; default segment ordering for linker
                                     41 	.area HOME
                                     42 	.area GSINIT
                                     43 	.area GSFINAL
                                     44 	.area CONST
                                     45 	.area INITIALIZER
                                     46 	.area CODE
                                     47 
                                     48 ;--------------------------------------------------------
                                     49 ; global & static initialisations
                                     50 ;--------------------------------------------------------
                                     51 	.area HOME
                                     52 	.area GSINIT
                                     53 	.area GSFINAL
                                     54 	.area GSINIT
                                     55 ;--------------------------------------------------------
                                     56 ; Home
                                     57 ;--------------------------------------------------------
                                     58 	.area HOME
                                     59 	.area HOME
                                     60 ;--------------------------------------------------------
                                     61 ; code
                                     62 ;--------------------------------------------------------
                                     63 	.area CODE
                                     64 ;	./../../mib/stm8s_mib_debug_tim.c: 35: void timIrqInit(void)
                                     65 ;	-----------------------------------------
                                     66 ;	 function timIrqInit
                                     67 ;	-----------------------------------------
      00969C                         68 _timIrqInit:
                                     69 ;	./../../mib/stm8s_mib_debug_tim.c: 37: gwMibSec = 0;
      00969C 5F               [ 1]   70 	clrw	x
      00969D CF 00 45         [ 2]   71 	ldw	_gwMibSec+0, x
                                     72 ;	./../../mib/stm8s_mib_debug_tim.c: 38: gwMibMsec = 0;
      0096A0 5F               [ 1]   73 	clrw	x
      0096A1 CF 00 43         [ 2]   74 	ldw	_gwMibMsec+0, x
                                     75 ;	./../../mib/stm8s_mib_debug_tim.c: 68: TIM4->PSCR  = TIM4_PRESCALER_128; // 7 : 8 usec...
      0096A4 35 07 53 45      [ 1]   76 	mov	0x5345+0, #0x07
                                     77 ;	./../../mib/stm8s_mib_debug_tim.c: 69: TIM4->ARR = (uint8_t)(_MM_UCOM_MSEC_-1); // 8 * 125 = 1000 usec = 1 msec...
      0096A8 35 7C 53 46      [ 1]   78 	mov	0x5346+0, #0x7c
                                     79 ;	./../../mib/stm8s_mib_debug_tim.c: 71: TIM4->CNTR = TIM4->ARR;
      0096AC 55 53 46 53 44   [ 1]   80 	mov	0x5344, 0x5346
                                     81 ;	./../../mib/stm8s_mib_debug_tim.c: 72: TIM4->SR1 = (uint8_t)(~TIM4_FLAG_UPDATE);
      0096B1 35 FE 53 42      [ 1]   82 	mov	0x5342+0, #0xfe
                                     83 ;	./../../mib/stm8s_mib_debug_tim.c: 74: TIM4->IER = TIM4_IER_UIE;
      0096B5 35 01 53 41      [ 1]   84 	mov	0x5341+0, #0x01
                                     85 ;	./../../mib/stm8s_mib_debug_tim.c: 75: TIM4->CR1 = TIM4_CR1_CEN | TIM4_CR1_ARPE;
      0096B9 35 81 53 40      [ 1]   86 	mov	0x5340+0, #0x81
                                     87 ;	./../../mib/stm8s_mib_debug_tim.c: 77: }
      0096BD 81               [ 4]   88 	ret
                                     89 ;	./../../mib/stm8s_mib_debug_tim.c: 88: void timIrqMain(void)
                                     90 ;	-----------------------------------------
                                     91 ;	 function timIrqMain
                                     92 ;	-----------------------------------------
      0096BE                         93 _timIrqMain:
                                     94 ;	./../../mib/stm8s_mib_debug_tim.c: 90: if(gwMibMsec) 
      0096BE CE 00 43         [ 2]   95 	ldw	x, _gwMibMsec+0
      0096C1 27 09            [ 1]   96 	jreq	00102$
                                     97 ;	./../../mib/stm8s_mib_debug_tim.c: 92: gwMibMsec--;
      0096C3 CE 00 43         [ 2]   98 	ldw	x, _gwMibMsec+0
      0096C6 5A               [ 2]   99 	decw	x
      0096C7 CF 00 43         [ 2]  100 	ldw	_gwMibMsec+0, x
      0096CA 20 0D            [ 2]  101 	jra	00103$
      0096CC                        102 00102$:
                                    103 ;	./../../mib/stm8s_mib_debug_tim.c: 97: gwMibMsec = 999; // 시간을 측정하여 조정한다.
      0096CC AE 03 E7         [ 2]  104 	ldw	x, #0x03e7
      0096CF CF 00 43         [ 2]  105 	ldw	_gwMibMsec+0, x
                                    106 ;	./../../mib/stm8s_mib_debug_tim.c: 98: gwMibSec++;
      0096D2 CE 00 45         [ 2]  107 	ldw	x, _gwMibSec+0
      0096D5 5C               [ 1]  108 	incw	x
      0096D6 CF 00 45         [ 2]  109 	ldw	_gwMibSec+0, x
      0096D9                        110 00103$:
                                    111 ;	./../../mib/stm8s_mib_debug_tim.c: 100: if(gbMibMiliSec) gbMibMiliSec--;  
      0096D9 C6 00 47         [ 1]  112 	ld	a, _gbMibMiliSec+0
      0096DC 27 04            [ 1]  113 	jreq	00105$
      0096DE 72 5A 00 47      [ 1]  114 	dec	_gbMibMiliSec+0
      0096E2                        115 00105$:
                                    116 ;	./../../mib/stm8s_mib_debug_tim.c: 101: if(gwMibMiliSec) gwMibMiliSec--;  
      0096E2 CE 00 48         [ 2]  117 	ldw	x, _gwMibMiliSec+0
      0096E5 26 01            [ 1]  118 	jrne	00127$
      0096E7 81               [ 4]  119 	ret
      0096E8                        120 00127$:
      0096E8 CE 00 48         [ 2]  121 	ldw	x, _gwMibMiliSec+0
      0096EB 5A               [ 2]  122 	decw	x
      0096EC CF 00 48         [ 2]  123 	ldw	_gwMibMiliSec+0, x
                                    124 ;	./../../mib/stm8s_mib_debug_tim.c: 102: }
      0096EF 81               [ 4]  125 	ret
                                    126 ;	./../../mib/stm8s_mib_debug_tim.c: 113: uint16_t MibGetSecs(void)
                                    127 ;	-----------------------------------------
                                    128 ;	 function MibGetSecs
                                    129 ;	-----------------------------------------
      0096F0                        130 _MibGetSecs:
                                    131 ;	./../../mib/stm8s_mib_debug_tim.c: 115: return gwMibSec; // gwMibSec;
      0096F0 CE 00 45         [ 2]  132 	ldw	x, _gwMibSec+0
                                    133 ;	./../../mib/stm8s_mib_debug_tim.c: 116: }
      0096F3 81               [ 4]  134 	ret
                                    135 ;	./../../mib/stm8s_mib_debug_tim.c: 127: void delay_ms(uint8_t vbDelay)
                                    136 ;	-----------------------------------------
                                    137 ;	 function delay_ms
                                    138 ;	-----------------------------------------
      0096F4                        139 _delay_ms:
                                    140 ;	./../../mib/stm8s_mib_debug_tim.c: 129: gwMibMiliSec = vbDelay;
      0096F4 5F               [ 1]  141 	clrw	x
      0096F5 97               [ 1]  142 	ld	xl, a
      0096F6 CF 00 48         [ 2]  143 	ldw	_gwMibMiliSec+0, x
                                    144 ;	./../../mib/stm8s_mib_debug_tim.c: 130: do {
      0096F9                        145 00103$:
                                    146 ;	./../../mib/stm8s_mib_debug_tim.c: 131: if(gwMibMiliSec==0) break;
      0096F9 CE 00 48         [ 2]  147 	ldw	x, _gwMibMiliSec+0
      0096FC 26 FB            [ 1]  148 	jrne	00103$
                                    149 ;	./../../mib/stm8s_mib_debug_tim.c: 132: } while (1);
                                    150 ;	./../../mib/stm8s_mib_debug_tim.c: 133: }
      0096FE 81               [ 4]  151 	ret
                                    152 	.area CODE
                                    153 	.area CONST
                                    154 	.area INITIALIZER
                                    155 	.area CABS (ABS)
