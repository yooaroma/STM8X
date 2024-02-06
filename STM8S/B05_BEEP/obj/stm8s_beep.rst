                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_beep
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _BEEP_DeInit
                                     12 	.globl _BEEP_Init
                                     13 	.globl _BEEP_Cmd
                                     14 	.globl _BEEP_LSICalibrationConfig
                                     15 ;--------------------------------------------------------
                                     16 ; ram data
                                     17 ;--------------------------------------------------------
                                     18 	.area DATA
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area INITIALIZED
                                     23 ;--------------------------------------------------------
                                     24 ; absolute external ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area DABS (ABS)
                                     27 
                                     28 ; default segment ordering for linker
                                     29 	.area HOME
                                     30 	.area GSINIT
                                     31 	.area GSFINAL
                                     32 	.area CONST
                                     33 	.area INITIALIZER
                                     34 	.area CODE
                                     35 
                                     36 ;--------------------------------------------------------
                                     37 ; global & static initialisations
                                     38 ;--------------------------------------------------------
                                     39 	.area HOME
                                     40 	.area GSINIT
                                     41 	.area GSFINAL
                                     42 	.area GSINIT
                                     43 ;--------------------------------------------------------
                                     44 ; Home
                                     45 ;--------------------------------------------------------
                                     46 	.area HOME
                                     47 	.area HOME
                                     48 ;--------------------------------------------------------
                                     49 ; code
                                     50 ;--------------------------------------------------------
                                     51 	.area CODE
                                     52 ;	./../../lib/src/stm8s_beep.c: 54: void BEEP_DeInit(void)
                                     53 ;	-----------------------------------------
                                     54 ;	 function BEEP_DeInit
                                     55 ;	-----------------------------------------
      009264                         56 _BEEP_DeInit:
                                     57 ;	./../../lib/src/stm8s_beep.c: 56: BEEP->CSR = BEEP_CSR_RESET_VALUE;
      009264 35 1F 50 F3      [ 1]   58 	mov	0x50f3+0, #0x1f
                                     59 ;	./../../lib/src/stm8s_beep.c: 57: }
      009268 81               [ 4]   60 	ret
                                     61 ;	./../../lib/src/stm8s_beep.c: 67: void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
                                     62 ;	-----------------------------------------
                                     63 ;	 function BEEP_Init
                                     64 ;	-----------------------------------------
      009269                         65 _BEEP_Init:
      009269 88               [ 1]   66 	push	a
      00926A 6B 01            [ 1]   67 	ld	(0x01, sp), a
                                     68 ;	./../../lib/src/stm8s_beep.c: 73: if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
      00926C C6 50 F3         [ 1]   69 	ld	a, 0x50f3
      00926F 43               [ 1]   70 	cpl	a
      009270 A5 1F            [ 1]   71 	bcp	a, #0x1f
      009272 26 10            [ 1]   72 	jrne	00102$
                                     73 ;	./../../lib/src/stm8s_beep.c: 75: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
      009274 C6 50 F3         [ 1]   74 	ld	a, 0x50f3
      009277 A4 E0            [ 1]   75 	and	a, #0xe0
      009279 C7 50 F3         [ 1]   76 	ld	0x50f3, a
                                     77 ;	./../../lib/src/stm8s_beep.c: 76: BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
      00927C C6 50 F3         [ 1]   78 	ld	a, 0x50f3
      00927F AA 0B            [ 1]   79 	or	a, #0x0b
      009281 C7 50 F3         [ 1]   80 	ld	0x50f3, a
      009284                         81 00102$:
                                     82 ;	./../../lib/src/stm8s_beep.c: 80: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
      009284 C6 50 F3         [ 1]   83 	ld	a, 0x50f3
      009287 A4 3F            [ 1]   84 	and	a, #0x3f
      009289 C7 50 F3         [ 1]   85 	ld	0x50f3, a
                                     86 ;	./../../lib/src/stm8s_beep.c: 81: BEEP->CSR |= (uint8_t)(BEEP_Frequency);
      00928C C6 50 F3         [ 1]   87 	ld	a, 0x50f3
      00928F 1A 01            [ 1]   88 	or	a, (0x01, sp)
      009291 C7 50 F3         [ 1]   89 	ld	0x50f3, a
                                     90 ;	./../../lib/src/stm8s_beep.c: 82: }
      009294 84               [ 1]   91 	pop	a
      009295 81               [ 4]   92 	ret
                                     93 ;	./../../lib/src/stm8s_beep.c: 91: void BEEP_Cmd(FunctionalState NewState)
                                     94 ;	-----------------------------------------
                                     95 ;	 function BEEP_Cmd
                                     96 ;	-----------------------------------------
      009296                         97 _BEEP_Cmd:
      009296 88               [ 1]   98 	push	a
      009297 6B 01            [ 1]   99 	ld	(0x01, sp), a
                                    100 ;	./../../lib/src/stm8s_beep.c: 96: BEEP->CSR |= BEEP_CSR_BEEPEN;
      009299 C6 50 F3         [ 1]  101 	ld	a, 0x50f3
                                    102 ;	./../../lib/src/stm8s_beep.c: 93: if (NewState != DISABLE)
      00929C 0D 01            [ 1]  103 	tnz	(0x01, sp)
      00929E 27 07            [ 1]  104 	jreq	00102$
                                    105 ;	./../../lib/src/stm8s_beep.c: 96: BEEP->CSR |= BEEP_CSR_BEEPEN;
      0092A0 AA 20            [ 1]  106 	or	a, #0x20
      0092A2 C7 50 F3         [ 1]  107 	ld	0x50f3, a
      0092A5 20 05            [ 2]  108 	jra	00104$
      0092A7                        109 00102$:
                                    110 ;	./../../lib/src/stm8s_beep.c: 101: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
      0092A7 A4 DF            [ 1]  111 	and	a, #0xdf
      0092A9 C7 50 F3         [ 1]  112 	ld	0x50f3, a
      0092AC                        113 00104$:
                                    114 ;	./../../lib/src/stm8s_beep.c: 103: }
      0092AC 84               [ 1]  115 	pop	a
      0092AD 81               [ 4]  116 	ret
                                    117 ;	./../../lib/src/stm8s_beep.c: 118: void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
                                    118 ;	-----------------------------------------
                                    119 ;	 function BEEP_LSICalibrationConfig
                                    120 ;	-----------------------------------------
      0092AE                        121 _BEEP_LSICalibrationConfig:
      0092AE 52 09            [ 2]  122 	sub	sp, #9
                                    123 ;	./../../lib/src/stm8s_beep.c: 126: lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
      0092B0 4B E8            [ 1]  124 	push	#0xe8
      0092B2 4B 03            [ 1]  125 	push	#0x03
      0092B4 5F               [ 1]  126 	clrw	x
      0092B5 89               [ 2]  127 	pushw	x
      0092B6 1E 12            [ 2]  128 	ldw	x, (0x12, sp)
      0092B8 89               [ 2]  129 	pushw	x
      0092B9 1E 12            [ 2]  130 	ldw	x, (0x12, sp)
      0092BB 89               [ 2]  131 	pushw	x
      0092BC CD B2 EB         [ 4]  132 	call	__divulong
      0092BF 5B 08            [ 2]  133 	addw	sp, #8
      0092C1 1F 01            [ 2]  134 	ldw	(0x01, sp), x
                                    135 ;	./../../lib/src/stm8s_beep.c: 130: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
      0092C3 C6 50 F3         [ 1]  136 	ld	a, 0x50f3
      0092C6 A4 E0            [ 1]  137 	and	a, #0xe0
      0092C8 C7 50 F3         [ 1]  138 	ld	0x50f3, a
                                    139 ;	./../../lib/src/stm8s_beep.c: 132: A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
      0092CB 1E 01            [ 2]  140 	ldw	x, (0x01, sp)
      0092CD 54               [ 2]  141 	srlw	x
      0092CE 54               [ 2]  142 	srlw	x
      0092CF 54               [ 2]  143 	srlw	x
                                    144 ;	./../../lib/src/stm8s_beep.c: 134: if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
      0092D0 1F 03            [ 2]  145 	ldw	(0x03, sp), x
      0092D2 1F 08            [ 2]  146 	ldw	(0x08, sp), x
      0092D4 58               [ 2]  147 	sllw	x
      0092D5 58               [ 2]  148 	sllw	x
      0092D6 58               [ 2]  149 	sllw	x
      0092D7 1F 05            [ 2]  150 	ldw	(0x05, sp), x
      0092D9 16 01            [ 2]  151 	ldw	y, (0x01, sp)
      0092DB 72 F2 05         [ 2]  152 	subw	y, (0x05, sp)
      0092DE 1E 08            [ 2]  153 	ldw	x, (0x08, sp)
      0092E0 58               [ 2]  154 	sllw	x
      0092E1 5C               [ 1]  155 	incw	x
      0092E2 89               [ 2]  156 	pushw	x
      0092E3 93               [ 1]  157 	ldw	x, y
                                    158 ;	./../../lib/src/stm8s_beep.c: 130: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
      0092E4 CD B1 DB         [ 4]  159 	call	__mulint
      0092E7 1F 07            [ 2]  160 	ldw	(0x07, sp), x
      0092E9 C6 50 F3         [ 1]  161 	ld	a, 0x50f3
      0092EC 6B 09            [ 1]  162 	ld	(0x09, sp), a
                                    163 ;	./../../lib/src/stm8s_beep.c: 136: BEEP->CSR |= (uint8_t)(A - 2U);
      0092EE 7B 04            [ 1]  164 	ld	a, (0x04, sp)
                                    165 ;	./../../lib/src/stm8s_beep.c: 134: if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
      0092F0 1E 05            [ 2]  166 	ldw	x, (0x05, sp)
      0092F2 13 07            [ 2]  167 	cpw	x, (0x07, sp)
      0092F4 25 09            [ 1]  168 	jrc	00102$
                                    169 ;	./../../lib/src/stm8s_beep.c: 136: BEEP->CSR |= (uint8_t)(A - 2U);
      0092F6 A0 02            [ 1]  170 	sub	a, #0x02
      0092F8 1A 09            [ 1]  171 	or	a, (0x09, sp)
      0092FA C7 50 F3         [ 1]  172 	ld	0x50f3, a
      0092FD 20 06            [ 2]  173 	jra	00104$
      0092FF                        174 00102$:
                                    175 ;	./../../lib/src/stm8s_beep.c: 140: BEEP->CSR |= (uint8_t)(A - 1U);
      0092FF 4A               [ 1]  176 	dec	a
      009300 1A 09            [ 1]  177 	or	a, (0x09, sp)
      009302 C7 50 F3         [ 1]  178 	ld	0x50f3, a
      009305                        179 00104$:
                                    180 ;	./../../lib/src/stm8s_beep.c: 142: }
      009305 1E 0A            [ 2]  181 	ldw	x, (10, sp)
      009307 5B 0F            [ 2]  182 	addw	sp, #15
      009309 FC               [ 2]  183 	jp	(x)
                                    184 	.area CODE
                                    185 	.area CONST
                                    186 	.area INITIALIZER
                                    187 	.area CABS (ABS)
