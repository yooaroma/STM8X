                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_mib_debug
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _UART_RX_IRQHandler
                                     12 	.globl _MibWriteDebugByte
                                     13 	.globl _MibWriteDebugByte485
                                     14 	.globl _MibWriteDebugEmptyCheck
                                     15 	.globl _MibWriteDebugString
                                     16 	.globl _MibWriteDebugStringN
                                     17 	.globl _MibReadDebugByte
                                     18 	.globl _MibDebugInit
                                     19 	.globl _MibWriteDebugTransmitHex
                                     20 	.globl _MibWriteDebugTransmitHex2
                                     21 ;--------------------------------------------------------
                                     22 ; ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area DATA
      000001                         25 _rx_buffer:
      000001                         26 	.ds 64
      000041                         27 _rx_buffer_head:
      000041                         28 	.ds 1
      000042                         29 _rx_buffer_tail:
      000042                         30 	.ds 1
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area INITIALIZED
      000156                         35 _g_TableHex:
      000156                         36 	.ds 2
                                     37 ;--------------------------------------------------------
                                     38 ; absolute external ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area DABS (ABS)
                                     41 
                                     42 ; default segment ordering for linker
                                     43 	.area HOME
                                     44 	.area GSINIT
                                     45 	.area GSFINAL
                                     46 	.area CONST
                                     47 	.area INITIALIZER
                                     48 	.area CODE
                                     49 
                                     50 ;--------------------------------------------------------
                                     51 ; global & static initialisations
                                     52 ;--------------------------------------------------------
                                     53 	.area HOME
                                     54 	.area GSINIT
                                     55 	.area GSFINAL
                                     56 	.area GSINIT
                                     57 ;--------------------------------------------------------
                                     58 ; Home
                                     59 ;--------------------------------------------------------
                                     60 	.area HOME
                                     61 	.area HOME
                                     62 ;--------------------------------------------------------
                                     63 ; code
                                     64 ;--------------------------------------------------------
                                     65 	.area CODE
                                     66 ;	./../../mib/stm8s_mib_debug.c: 206: void MibWriteDebugByte(uint8_t ch)
                                     67 ;	-----------------------------------------
                                     68 ;	 function MibWriteDebugByte
                                     69 ;	-----------------------------------------
      009269                         70 _MibWriteDebugByte:
      009269 88               [ 1]   71 	push	a
      00926A 6B 01            [ 1]   72 	ld	(0x01, sp), a
                                     73 ;	./../../mib/stm8s_mib_debug.c: 227: while (!(UARTXdebug->SR & UARTX_SR_TXE));
      00926C                         74 00101$:
      00926C C6 52 40         [ 1]   75 	ld	a, 0x5240
      00926F 2A FB            [ 1]   76 	jrpl	00101$
                                     77 ;	./../../mib/stm8s_mib_debug.c: 228: UARTXdebug->DR = ch;
      009271 AE 52 41         [ 2]   78 	ldw	x, #0x5241
      009274 7B 01            [ 1]   79 	ld	a, (0x01, sp)
      009276 F7               [ 1]   80 	ld	(x), a
                                     81 ;	./../../mib/stm8s_mib_debug.c: 231: }
      009277 84               [ 1]   82 	pop	a
      009278 81               [ 4]   83 	ret
                                     84 ;	./../../mib/stm8s_mib_debug.c: 240: void MibWriteDebugByte485(uint8_t ch)
                                     85 ;	-----------------------------------------
                                     86 ;	 function MibWriteDebugByte485
                                     87 ;	-----------------------------------------
      009279                         88 _MibWriteDebugByte485:
                                     89 ;	./../../mib/stm8s_mib_debug.c: 248: MibWriteDebugByte(ch);
                                     90 ;	./../../mib/stm8s_mib_debug.c: 257: }
      009279 CC 92 69         [ 2]   91 	jp	_MibWriteDebugByte
                                     92 ;	./../../mib/stm8s_mib_debug.c: 266: void MibWriteDebugEmptyCheck(void)
                                     93 ;	-----------------------------------------
                                     94 ;	 function MibWriteDebugEmptyCheck
                                     95 ;	-----------------------------------------
      00927C                         96 _MibWriteDebugEmptyCheck:
                                     97 ;	./../../mib/stm8s_mib_debug.c: 269: while (!(UARTXdebug->SR & UARTX_SR_TC));
      00927C                         98 00101$:
      00927C 72 0D 52 40 FB   [ 2]   99 	btjf	0x5240, #6, 00101$
                                    100 ;	./../../mib/stm8s_mib_debug.c: 270: UARTXdebug->SR &= ~UARTX_SR_TC;
      009281 72 1D 52 40      [ 1]  101 	bres	0x5240, #6
                                    102 ;	./../../mib/stm8s_mib_debug.c: 272: }
      009285 81               [ 4]  103 	ret
                                    104 ;	./../../mib/stm8s_mib_debug.c: 281: void MibWriteDebugString(uint8_t *v_pStr)
                                    105 ;	-----------------------------------------
                                    106 ;	 function MibWriteDebugString
                                    107 ;	-----------------------------------------
      009286                        108 _MibWriteDebugString:
                                    109 ;	./../../mib/stm8s_mib_debug.c: 288: while (*v_pStr)
      009286                        110 00101$:
      009286 F6               [ 1]  111 	ld	a, (x)
      009287 26 01            [ 1]  112 	jrne	00117$
      009289 81               [ 4]  113 	ret
      00928A                        114 00117$:
                                    115 ;	./../../mib/stm8s_mib_debug.c: 290: MibWriteDebugByte(*v_pStr++);
      00928A 5C               [ 1]  116 	incw	x
      00928B 89               [ 2]  117 	pushw	x
      00928C CD 92 69         [ 4]  118 	call	_MibWriteDebugByte
      00928F 85               [ 2]  119 	popw	x
      009290 20 F4            [ 2]  120 	jra	00101$
                                    121 ;	./../../mib/stm8s_mib_debug.c: 299: }
      009292 81               [ 4]  122 	ret
                                    123 ;	./../../mib/stm8s_mib_debug.c: 308: void MibWriteDebugStringN(uint8_t *v_pStr, uint8_t nSize)
                                    124 ;	-----------------------------------------
                                    125 ;	 function MibWriteDebugStringN
                                    126 ;	-----------------------------------------
      009293                        127 _MibWriteDebugStringN:
      009293 88               [ 1]  128 	push	a
      009294 6B 01            [ 1]  129 	ld	(0x01, sp), a
                                    130 ;	./../../mib/stm8s_mib_debug.c: 315: while (1)
      009296                        131 00104$:
                                    132 ;	./../../mib/stm8s_mib_debug.c: 317: if (nSize == 0)	break;		
      009296 0D 01            [ 1]  133 	tnz	(0x01, sp)
      009298 27 0B            [ 1]  134 	jreq	00106$
                                    135 ;	./../../mib/stm8s_mib_debug.c: 318: MibWriteDebugByte(*v_pStr++);
      00929A F6               [ 1]  136 	ld	a, (x)
      00929B 5C               [ 1]  137 	incw	x
      00929C 89               [ 2]  138 	pushw	x
      00929D CD 92 69         [ 4]  139 	call	_MibWriteDebugByte
      0092A0 85               [ 2]  140 	popw	x
                                    141 ;	./../../mib/stm8s_mib_debug.c: 319: nSize--;
      0092A1 0A 01            [ 1]  142 	dec	(0x01, sp)
      0092A3 20 F1            [ 2]  143 	jra	00104$
      0092A5                        144 00106$:
                                    145 ;	./../../mib/stm8s_mib_debug.c: 328: }
      0092A5 84               [ 1]  146 	pop	a
      0092A6 81               [ 4]  147 	ret
                                    148 ;	./../../mib/stm8s_mib_debug.c: 337: uint16_t MibReadDebugByte( void )
                                    149 ;	-----------------------------------------
                                    150 ;	 function MibReadDebugByte
                                    151 ;	-----------------------------------------
      0092A7                        152 _MibReadDebugByte:
                                    153 ;	./../../mib/stm8s_mib_debug.c: 344: if (rx_buffer_head == rx_buffer_tail) // wait for character
      0092A7 C6 00 42         [ 1]  154 	ld	a, _rx_buffer_tail+0
      0092AA C1 00 41         [ 1]  155 	cp	a, _rx_buffer_head+0
      0092AD 26 03            [ 1]  156 	jrne	00102$
                                    157 ;	./../../mib/stm8s_mib_debug.c: 346: return MIB_DEBUG_READ_NODATA; // no data
      0092AF 5F               [ 1]  158 	clrw	x
      0092B0 5A               [ 2]  159 	decw	x
      0092B1 81               [ 4]  160 	ret
      0092B2                        161 00102$:
                                    162 ;	./../../mib/stm8s_mib_debug.c: 348: vbIndex = rx_buffer_tail + 1;
      0092B2 C6 00 42         [ 1]  163 	ld	a, _rx_buffer_tail+0
      0092B5 4C               [ 1]  164 	inc	a
                                    165 ;	./../../mib/stm8s_mib_debug.c: 349: if (vbIndex >= RX_BUFFER_SIZE) vbIndex = 0;
      0092B6 A1 40            [ 1]  166 	cp	a, #0x40
      0092B8 25 01            [ 1]  167 	jrc	00104$
      0092BA 4F               [ 1]  168 	clr	a
      0092BB                        169 00104$:
                                    170 ;	./../../mib/stm8s_mib_debug.c: 350: vbCh = rx_buffer[vbIndex];
      0092BB 5F               [ 1]  171 	clrw	x
      0092BC 97               [ 1]  172 	ld	xl, a
      0092BD 1C 00 01         [ 2]  173 	addw	x, #(_rx_buffer+0)
      0092C0 88               [ 1]  174 	push	a
      0092C1 F6               [ 1]  175 	ld	a, (x)
      0092C2 97               [ 1]  176 	ld	xl, a
      0092C3 84               [ 1]  177 	pop	a
                                    178 ;	./../../mib/stm8s_mib_debug.c: 351: rx_buffer_tail = vbIndex;
      0092C4 C7 00 42         [ 1]  179 	ld	_rx_buffer_tail+0, a
                                    180 ;	./../../mib/stm8s_mib_debug.c: 352: return (uint16_t)vbCh;
      0092C7 4F               [ 1]  181 	clr	a
      0092C8 95               [ 1]  182 	ld	xh, a
                                    183 ;	./../../mib/stm8s_mib_debug.c: 367: }
      0092C9 81               [ 4]  184 	ret
                                    185 ;	./../../mib/stm8s_mib_debug.c: 442: void MibDebugInit(uint32_t baudrate)
                                    186 ;	-----------------------------------------
                                    187 ;	 function MibDebugInit
                                    188 ;	-----------------------------------------
      0092CA                        189 _MibDebugInit:
      0092CA 52 10            [ 2]  190 	sub	sp, #16
                                    191 ;	./../../mib/stm8s_mib_debug.c: 446: rx_buffer_head = 0;
      0092CC 72 5F 00 41      [ 1]  192 	clr	_rx_buffer_head+0
                                    193 ;	./../../mib/stm8s_mib_debug.c: 447: rx_buffer_tail = 0;
      0092D0 72 5F 00 42      [ 1]  194 	clr	_rx_buffer_tail+0
                                    195 ;	./../../mib/stm8s_mib_debug.c: 480: uint32_t BaudRate = baudrate;
      0092D4 1E 15            [ 2]  196 	ldw	x, (0x15, sp)
      0092D6 16 13            [ 2]  197 	ldw	y, (0x13, sp)
                                    198 ;	./../../mib/stm8s_mib_debug.c: 486: UARTXdebug->CR1 &= (uint8_t)(~UARTX_CR1_M);			 /**< Clear the word length bit */
      0092D8 72 19 52 44      [ 1]  199 	bres	0x5244, #4
                                    200 ;	./../../mib/stm8s_mib_debug.c: 487: UARTXdebug->CR1 |= (uint8_t)UARTX_WORDLENGTH_8D; /**< Set the word length bit according to UART1_WordLength value */
      0092DC 55 52 44 52 44   [ 1]  201 	mov	0x5244, 0x5244
                                    202 ;	./../../mib/stm8s_mib_debug.c: 489: UARTXdebug->CR3 &= (uint8_t)(~UARTX_CR3_STOP); /**< Clear the STOP bits */
      0092E1 C6 52 46         [ 1]  203 	ld	a, 0x5246
      0092E4 A4 CF            [ 1]  204 	and	a, #0xcf
      0092E6 C7 52 46         [ 1]  205 	ld	0x5246, a
                                    206 ;	./../../mib/stm8s_mib_debug.c: 490: UARTXdebug->CR3 |= (uint8_t)UARTX_STOPBITS_1;	 /**< Set the STOP bits number according to UART1_StopBits value  */
      0092E9 55 52 46 52 46   [ 1]  207 	mov	0x5246, 0x5246
                                    208 ;	./../../mib/stm8s_mib_debug.c: 492: UARTXdebug->CR1 &= (uint8_t)(~(UARTX_CR1_PCEN | UARTX_CR1_PS)); /**< Clear the Parity Control bit */
      0092EE C6 52 44         [ 1]  209 	ld	a, 0x5244
      0092F1 A4 F9            [ 1]  210 	and	a, #0xf9
      0092F3 C7 52 44         [ 1]  211 	ld	0x5244, a
                                    212 ;	./../../mib/stm8s_mib_debug.c: 493: UARTXdebug->CR1 |= (uint8_t)UARTX_PARITY_NO;										/**< Set the Parity Control bit to UART1_Parity value */
      0092F6 55 52 44 52 44   [ 1]  213 	mov	0x5244, 0x5244
                                    214 ;	./../../mib/stm8s_mib_debug.c: 495: UARTXdebug->BRR1 &= (uint8_t)(~UARTX_BRR1_DIVM); /**< Clear the LSB mantissa of UARTDIV  */
      0092FB C6 52 42         [ 1]  215 	ld	a, 0x5242
      0092FE 35 00 52 42      [ 1]  216 	mov	0x5242+0, #0x00
                                    217 ;	./../../mib/stm8s_mib_debug.c: 496: UARTXdebug->BRR2 &= (uint8_t)(~UARTX_BRR2_DIVM); /**< Clear the MSB mantissa of UARTDIV  */
      009302 C6 52 43         [ 1]  218 	ld	a, 0x5243
      009305 A4 0F            [ 1]  219 	and	a, #0x0f
      009307 C7 52 43         [ 1]  220 	ld	0x5243, a
                                    221 ;	./../../mib/stm8s_mib_debug.c: 497: UARTXdebug->BRR2 &= (uint8_t)(~UARTX_BRR2_DIVF); /**< Clear the Fraction bits of UARTDIV */
      00930A C6 52 43         [ 1]  222 	ld	a, 0x5243
      00930D A4 F0            [ 1]  223 	and	a, #0xf0
      00930F C7 52 43         [ 1]  224 	ld	0x5243, a
                                    225 ;	./../../mib/stm8s_mib_debug.c: 500: BaudRate_Mantissa = ((uint32_t)v_ClkValue / (BaudRate << 4));
      009312 A6 04            [ 1]  226 	ld	a, #0x04
      009314                        227 00103$:
      009314 58               [ 2]  228 	sllw	x
      009315 90 59            [ 2]  229 	rlcw	y
      009317 4A               [ 1]  230 	dec	a
      009318 26 FA            [ 1]  231 	jrne	00103$
      00931A 1F 0F            [ 2]  232 	ldw	(0x0f, sp), x
      00931C 17 0D            [ 2]  233 	ldw	(0x0d, sp), y
      00931E 1E 0F            [ 2]  234 	ldw	x, (0x0f, sp)
      009320 89               [ 2]  235 	pushw	x
      009321 1E 0F            [ 2]  236 	ldw	x, (0x0f, sp)
      009323 89               [ 2]  237 	pushw	x
      009324 4B 00            [ 1]  238 	push	#0x00
      009326 4B 24            [ 1]  239 	push	#0x24
      009328 4B F4            [ 1]  240 	push	#0xf4
      00932A 4B 00            [ 1]  241 	push	#0x00
      00932C CD B0 24         [ 4]  242 	call	__divulong
      00932F 5B 08            [ 2]  243 	addw	sp, #8
      009331 1F 03            [ 2]  244 	ldw	(0x03, sp), x
                                    245 ;	./../../mib/stm8s_mib_debug.c: 501: BaudRate_Mantissa100 = (((uint32_t)v_ClkValue * 100) / (BaudRate << 4));
      009333 90 89            [ 2]  246 	pushw	y
      009335 1E 11            [ 2]  247 	ldw	x, (0x11, sp)
      009337 89               [ 2]  248 	pushw	x
      009338 1E 11            [ 2]  249 	ldw	x, (0x11, sp)
      00933A 89               [ 2]  250 	pushw	x
      00933B 4B 00            [ 1]  251 	push	#0x00
      00933D 4B 10            [ 1]  252 	push	#0x10
      00933F 4B 5E            [ 1]  253 	push	#0x5e
      009341 4B 5F            [ 1]  254 	push	#0x5f
      009343 CD B0 24         [ 4]  255 	call	__divulong
      009346 5B 08            [ 2]  256 	addw	sp, #8
      009348 17 0F            [ 2]  257 	ldw	(0x0f, sp), y
      00934A 90 85            [ 2]  258 	popw	y
      00934C 1F 07            [ 2]  259 	ldw	(0x07, sp), x
      00934E 1E 0D            [ 2]  260 	ldw	x, (0x0d, sp)
      009350 1F 05            [ 2]  261 	ldw	(0x05, sp), x
                                    262 ;	./../../mib/stm8s_mib_debug.c: 503: BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (u8)0x0F); /**< Set the fraction of UARTDIV  */
      009352 90 89            [ 2]  263 	pushw	y
      009354 1E 05            [ 2]  264 	ldw	x, (0x05, sp)
      009356 89               [ 2]  265 	pushw	x
      009357 90 89            [ 2]  266 	pushw	y
      009359 4B 64            [ 1]  267 	push	#0x64
      00935B 5F               [ 1]  268 	clrw	x
      00935C 89               [ 2]  269 	pushw	x
      00935D 4B 00            [ 1]  270 	push	#0x00
      00935F CD B1 56         [ 4]  271 	call	__mullong
      009362 5B 08            [ 2]  272 	addw	sp, #8
      009364 1F 0D            [ 2]  273 	ldw	(0x0d, sp), x
      009366 17 0B            [ 2]  274 	ldw	(0x0b, sp), y
      009368 90 85            [ 2]  275 	popw	y
      00936A 1E 07            [ 2]  276 	ldw	x, (0x07, sp)
      00936C 72 F0 0B         [ 2]  277 	subw	x, (0x0b, sp)
      00936F 1F 0F            [ 2]  278 	ldw	(0x0f, sp), x
      009371 7B 06            [ 1]  279 	ld	a, (0x06, sp)
      009373 12 0A            [ 1]  280 	sbc	a, (0x0a, sp)
      009375 97               [ 1]  281 	ld	xl, a
      009376 7B 05            [ 1]  282 	ld	a, (0x05, sp)
      009378 12 09            [ 1]  283 	sbc	a, (0x09, sp)
      00937A 95               [ 1]  284 	ld	xh, a
      00937B 1F 0D            [ 2]  285 	ldw	(0x0d, sp), x
      00937D 1E 0F            [ 2]  286 	ldw	x, (0x0f, sp)
      00937F A6 04            [ 1]  287 	ld	a, #0x04
      009381                        288 00105$:
      009381 58               [ 2]  289 	sllw	x
      009382 09 0E            [ 1]  290 	rlc	(0x0e, sp)
      009384 09 0D            [ 1]  291 	rlc	(0x0d, sp)
      009386 4A               [ 1]  292 	dec	a
      009387 26 F8            [ 1]  293 	jrne	00105$
      009389 90 89            [ 2]  294 	pushw	y
      00938B 4B 64            [ 1]  295 	push	#0x64
      00938D 4B 00            [ 1]  296 	push	#0x00
      00938F 4B 00            [ 1]  297 	push	#0x00
      009391 4B 00            [ 1]  298 	push	#0x00
      009393 89               [ 2]  299 	pushw	x
      009394 1E 15            [ 2]  300 	ldw	x, (0x15, sp)
      009396 89               [ 2]  301 	pushw	x
      009397 CD B0 24         [ 4]  302 	call	__divulong
      00939A 5B 08            [ 2]  303 	addw	sp, #8
      00939C 17 0F            [ 2]  304 	ldw	(0x0f, sp), y
      00939E 9F               [ 1]  305 	ld	a, xl
      00939F 90 85            [ 2]  306 	popw	y
      0093A1 A4 0F            [ 1]  307 	and	a, #0x0f
      0093A3 6B 0E            [ 1]  308 	ld	(0x0e, sp), a
                                    309 ;	./../../mib/stm8s_mib_debug.c: 504: BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (u8)0xF0);
      0093A5 1E 03            [ 2]  310 	ldw	x, (0x03, sp)
      0093A7 A6 10            [ 1]  311 	ld	a, #0x10
      0093A9 62               [ 2]  312 	div	x, a
      0093AA 02               [ 1]  313 	rlwa	x
      0093AB 6B 0F            [ 1]  314 	ld	(0x0f, sp), a
      0093AD 01               [ 1]  315 	rrwa	x
      0093AE 9F               [ 1]  316 	ld	a, xl
      0093AF A4 F0            [ 1]  317 	and	a, #0xf0
                                    318 ;	./../../mib/stm8s_mib_debug.c: 506: UARTXdebug->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
      0093B1 1A 0E            [ 1]  319 	or	a, (0x0e, sp)
      0093B3 C7 52 43         [ 1]  320 	ld	0x5243, a
                                    321 ;	./../../mib/stm8s_mib_debug.c: 507: UARTXdebug->BRR1 = (uint8_t)BaudRate_Mantissa; /**< Set the LSB mantissa of UARTDIV  */
      0093B6 7B 04            [ 1]  322 	ld	a, (0x04, sp)
      0093B8 C7 52 42         [ 1]  323 	ld	0x5242, a
                                    324 ;	./../../mib/stm8s_mib_debug.c: 509: UARTXdebug->CR2 &= (uint8_t) ~(UARTX_CR2_TEN | UARTX_CR2_REN);																																		 /**< Disable the Transmitter and Receiver before seting the LBCL, CPOL and CPHA bits */
      0093BB C6 52 45         [ 1]  325 	ld	a, 0x5245
      0093BE A4 F3            [ 1]  326 	and	a, #0xf3
      0093C0 C7 52 45         [ 1]  327 	ld	0x5245, a
                                    328 ;	./../../mib/stm8s_mib_debug.c: 510: UARTXdebug->CR3 &= (uint8_t) ~(UARTX_CR3_CPOL | UARTX_CR3_CPHA | UARTX_CR3_LBCL);																									 /**< Clear the Clock Polarity, lock Phase, Last Bit Clock pulse */
      0093C3 C6 52 46         [ 1]  329 	ld	a, 0x5246
      0093C6 A4 F8            [ 1]  330 	and	a, #0xf8
      0093C8 C7 52 46         [ 1]  331 	ld	0x5246, a
                                    332 ;	./../../mib/stm8s_mib_debug.c: 511: UARTXdebug->CR3 |= (uint8_t)((uint8_t)UARTX_SYNCMODE_CLOCK_DISABLE & (uint8_t)(UARTX_CR3_CPOL | UARTX_CR3_CPHA | UARTX_CR3_LBCL)); /**< Set the Clock Polarity, lock Phase, Last Bit Clock pulse */
      0093CB 55 52 46 52 46   [ 1]  333 	mov	0x5246, 0x5246
                                    334 ;	./../../mib/stm8s_mib_debug.c: 513: UARTXdebug->CR2 |= (uint8_t)UARTX_CR2_TEN;									/**< Set the Transmitter Enable bit */
      0093D0 72 16 52 45      [ 1]  335 	bset	0x5245, #3
                                    336 ;	./../../mib/stm8s_mib_debug.c: 517: UARTXdebug->CR2 |= (uint8_t)UARTX_CR2_REN | UARTX_CR2_RIEN; /**< Set the Receiver Enable bit */
      0093D4 C6 52 45         [ 1]  337 	ld	a, 0x5245
      0093D7 AA 24            [ 1]  338 	or	a, #0x24
      0093D9 C7 52 45         [ 1]  339 	ld	0x5245, a
                                    340 ;	./../../mib/stm8s_mib_debug.c: 525: UARTXdebug->CR3 &= (uint8_t)(~UARTX_CR3_CKEN); /**< Clear the Clock Enable bit */
      0093DC 72 17 52 46      [ 1]  341 	bres	0x5246, #3
                                    342 ;	./../../mib/stm8s_mib_debug.c: 531: UCOM_TXD_GPIO->DDR |= (UCOM_TXD_PIN); /* Set Output mode */
      0093E0 72 1A 50 11      [ 1]  343 	bset	0x5011, #5
                                    344 ;	./../../mib/stm8s_mib_debug.c: 532: UCOM_TXD_GPIO->CR1 |= (UCOM_TXD_PIN);	/* Pull-Up or Push-Pull */
      0093E4 72 1A 50 12      [ 1]  345 	bset	0x5012, #5
                                    346 ;	./../../mib/stm8s_mib_debug.c: 533: UCOM_TXD_GPIO->CR2 |= (UCOM_TXD_PIN);	/* Output speed up to 10 MHz */
      0093E8 72 1A 50 13      [ 1]  347 	bset	0x5013, #5
                                    348 ;	./../../mib/stm8s_mib_debug.c: 534: UCOM_TXD_GPIO->ODR |= (UCOM_TXD_PIN); // high... 
      0093EC 72 1A 50 0F      [ 1]  349 	bset	0x500f, #5
                                    350 ;	./../../mib/stm8s_mib_debug.c: 538: UCOM_RXD_GPIO->DDR &= ~(UCOM_RXD_PIN); // Set input mode 
      0093F0 72 1D 50 11      [ 1]  351 	bres	0x5011, #6
                                    352 ;	./../../mib/stm8s_mib_debug.c: 539: UCOM_RXD_GPIO->CR1 |= (UCOM_RXD_PIN);	 /* Pull-Up or Push-Pull */
      0093F4 72 1C 50 12      [ 1]  353 	bset	0x5012, #6
                                    354 ;	./../../mib/stm8s_mib_debug.c: 540: UCOM_RXD_GPIO->CR2 &= ~(UCOM_RXD_PIN); /*  External interrupt disabled */
      0093F8 C6 50 13         [ 1]  355 	ld	a, 0x5013
      0093FB A4 BF            [ 1]  356 	and	a, #0xbf
      0093FD C7 50 13         [ 1]  357 	ld	0x5013, a
                                    358 ;	./../../mib/stm8s_mib_debug.c: 548: }
      009400 1E 11            [ 2]  359 	ldw	x, (17, sp)
      009402 5B 16            [ 2]  360 	addw	sp, #22
      009404 FC               [ 2]  361 	jp	(x)
                                    362 ;	./../../mib/stm8s_mib_debug.c: 554: void MibWriteDebugTransmitHex(uint8_t data)
                                    363 ;	-----------------------------------------
                                    364 ;	 function MibWriteDebugTransmitHex
                                    365 ;	-----------------------------------------
      009405                        366 _MibWriteDebugTransmitHex:
      009405 88               [ 1]  367 	push	a
      009406 6B 01            [ 1]  368 	ld	(0x01, sp), a
                                    369 ;	./../../mib/stm8s_mib_debug.c: 561: MibWriteDebugByte('.');
      009408 A6 2E            [ 1]  370 	ld	a, #0x2e
      00940A CD 92 69         [ 4]  371 	call	_MibWriteDebugByte
                                    372 ;	./../../mib/stm8s_mib_debug.c: 562: if (data > 0xd)	MibWriteDebugByte(data);
      00940D 7B 01            [ 1]  373 	ld	a, (0x01, sp)
      00940F A1 0D            [ 1]  374 	cp	a, #0x0d
      009411 23 05            [ 2]  375 	jrule	00102$
      009413 7B 01            [ 1]  376 	ld	a, (0x01, sp)
      009415 CD 92 69         [ 4]  377 	call	_MibWriteDebugByte
      009418                        378 00102$:
                                    379 ;	./../../mib/stm8s_mib_debug.c: 563: MibWriteDebugByte('[');
      009418 A6 5B            [ 1]  380 	ld	a, #0x5b
      00941A CD 92 69         [ 4]  381 	call	_MibWriteDebugByte
                                    382 ;	./../../mib/stm8s_mib_debug.c: 564: MibWriteDebugByte(g_TableHex[data >> 4]);
      00941D 7B 01            [ 1]  383 	ld	a, (0x01, sp)
      00941F 4E               [ 1]  384 	swap	a
      009420 A4 0F            [ 1]  385 	and	a, #0x0f
      009422 5F               [ 1]  386 	clrw	x
      009423 97               [ 1]  387 	ld	xl, a
      009424 72 BB 01 56      [ 2]  388 	addw	x, _g_TableHex+0
      009428 F6               [ 1]  389 	ld	a, (x)
      009429 CD 92 69         [ 4]  390 	call	_MibWriteDebugByte
                                    391 ;	./../../mib/stm8s_mib_debug.c: 565: MibWriteDebugByte(g_TableHex[data & 0xf]);
      00942C 7B 01            [ 1]  392 	ld	a, (0x01, sp)
      00942E A4 0F            [ 1]  393 	and	a, #0x0f
      009430 97               [ 1]  394 	ld	xl, a
      009431 4F               [ 1]  395 	clr	a
      009432 95               [ 1]  396 	ld	xh, a
      009433 72 BB 01 56      [ 2]  397 	addw	x, _g_TableHex+0
      009437 F6               [ 1]  398 	ld	a, (x)
      009438 CD 92 69         [ 4]  399 	call	_MibWriteDebugByte
                                    400 ;	./../../mib/stm8s_mib_debug.c: 566: MibWriteDebugByte(']');
      00943B A6 5D            [ 1]  401 	ld	a, #0x5d
      00943D CD 92 69         [ 4]  402 	call	_MibWriteDebugByte
                                    403 ;	./../../mib/stm8s_mib_debug.c: 567: while (!(UARTXdebug->SR & UARTX_SR_TC));
      009440                        404 00103$:
      009440 72 0D 52 40 FB   [ 2]  405 	btjf	0x5240, #6, 00103$
                                    406 ;	./../../mib/stm8s_mib_debug.c: 568: UARTXdebug->SR &= ~UARTX_SR_TC;	
      009445 72 1D 52 40      [ 1]  407 	bres	0x5240, #6
                                    408 ;	./../../mib/stm8s_mib_debug.c: 574: }
      009449 84               [ 1]  409 	pop	a
      00944A 81               [ 4]  410 	ret
                                    411 ;	./../../mib/stm8s_mib_debug.c: 579: void MibWriteDebugTransmitHex2(uint8_t data)
                                    412 ;	-----------------------------------------
                                    413 ;	 function MibWriteDebugTransmitHex2
                                    414 ;	-----------------------------------------
      00944B                        415 _MibWriteDebugTransmitHex2:
      00944B 88               [ 1]  416 	push	a
      00944C 6B 01            [ 1]  417 	ld	(0x01, sp), a
                                    418 ;	./../../mib/stm8s_mib_debug.c: 586: MibWriteDebugByte('.');
      00944E A6 2E            [ 1]  419 	ld	a, #0x2e
      009450 CD 92 69         [ 4]  420 	call	_MibWriteDebugByte
                                    421 ;	./../../mib/stm8s_mib_debug.c: 587: MibWriteDebugByte(g_TableHex[data >> 4]);
      009453 7B 01            [ 1]  422 	ld	a, (0x01, sp)
      009455 4E               [ 1]  423 	swap	a
      009456 A4 0F            [ 1]  424 	and	a, #0x0f
      009458 5F               [ 1]  425 	clrw	x
      009459 97               [ 1]  426 	ld	xl, a
      00945A 72 BB 01 56      [ 2]  427 	addw	x, _g_TableHex+0
      00945E F6               [ 1]  428 	ld	a, (x)
      00945F CD 92 69         [ 4]  429 	call	_MibWriteDebugByte
                                    430 ;	./../../mib/stm8s_mib_debug.c: 588: MibWriteDebugByte(g_TableHex[data & 0xf]);
      009462 7B 01            [ 1]  431 	ld	a, (0x01, sp)
      009464 A4 0F            [ 1]  432 	and	a, #0x0f
      009466 97               [ 1]  433 	ld	xl, a
      009467 4F               [ 1]  434 	clr	a
      009468 95               [ 1]  435 	ld	xh, a
      009469 72 BB 01 56      [ 2]  436 	addw	x, _g_TableHex+0
      00946D F6               [ 1]  437 	ld	a, (x)
      00946E CD 92 69         [ 4]  438 	call	_MibWriteDebugByte
                                    439 ;	./../../mib/stm8s_mib_debug.c: 589: while (!(UARTXdebug->SR & UARTX_SR_TC));
      009471                        440 00101$:
      009471 72 0D 52 40 FB   [ 2]  441 	btjf	0x5240, #6, 00101$
                                    442 ;	./../../mib/stm8s_mib_debug.c: 590: UARTXdebug->SR &= ~UARTX_SR_TC;
      009476 72 1D 52 40      [ 1]  443 	bres	0x5240, #6
                                    444 ;	./../../mib/stm8s_mib_debug.c: 596: }
      00947A 84               [ 1]  445 	pop	a
      00947B 81               [ 4]  446 	ret
                                    447 ;	./../../mib/stm8s_mib_debug.c: 602: void UART_RX_IRQHandler(void) /* UART RX */
                                    448 ;	-----------------------------------------
                                    449 ;	 function UART_RX_IRQHandler
                                    450 ;	-----------------------------------------
      00947C                        451 _UART_RX_IRQHandler:
                                    452 ;	./../../mib/stm8s_mib_debug.c: 608: if (UARTXdebug->SR & UARTX_SR_RXNE) // RXNE :  ISR.bit5 // UART1_FLAG_RXNE
      00947C 72 0B 52 40 22   [ 2]  453 	btjf	0x5240, #5, 00108$
                                    454 ;	./../../mib/stm8s_mib_debug.c: 610: vbCh = (uint8_t)(UARTXdebug->DR);
      009481 C6 52 41         [ 1]  455 	ld	a, 0x5241
      009484 90 97            [ 1]  456 	ld	yl, a
                                    457 ;	./../../mib/stm8s_mib_debug.c: 611: vbIndex = rx_buffer_head + 1;
      009486 C6 00 41         [ 1]  458 	ld	a, _rx_buffer_head+0
      009489 4C               [ 1]  459 	inc	a
                                    460 ;	./../../mib/stm8s_mib_debug.c: 612: if (vbIndex >= RX_BUFFER_SIZE)
      00948A A1 40            [ 1]  461 	cp	a, #0x40
      00948C 25 01            [ 1]  462 	jrc	00102$
                                    463 ;	./../../mib/stm8s_mib_debug.c: 613: vbIndex = 0;
      00948E 4F               [ 1]  464 	clr	a
      00948F                        465 00102$:
                                    466 ;	./../../mib/stm8s_mib_debug.c: 614: if (vbIndex != rx_buffer_tail)
      00948F C1 00 42         [ 1]  467 	cp	a, _rx_buffer_tail+0
      009492 26 01            [ 1]  468 	jrne	00135$
      009494 81               [ 4]  469 	ret
      009495                        470 00135$:
                                    471 ;	./../../mib/stm8s_mib_debug.c: 616: rx_buffer[vbIndex] = vbCh;
      009495 5F               [ 1]  472 	clrw	x
      009496 97               [ 1]  473 	ld	xl, a
      009497 1C 00 01         [ 2]  474 	addw	x, #(_rx_buffer+0)
      00949A 88               [ 1]  475 	push	a
      00949B 90 9F            [ 1]  476 	ld	a, yl
      00949D F7               [ 1]  477 	ld	(x), a
      00949E 84               [ 1]  478 	pop	a
                                    479 ;	./../../mib/stm8s_mib_debug.c: 617: rx_buffer_head = vbIndex;
      00949F C7 00 41         [ 1]  480 	ld	_rx_buffer_head+0, a
      0094A2 81               [ 4]  481 	ret
      0094A3                        482 00108$:
                                    483 ;	./../../mib/stm8s_mib_debug.c: 620: else if (UARTXdebug->SR & UARTX_SR_OR) // OE : ISR.bit4 // /*!< OverRun error flag */
      0094A3 72 06 52 40 01   [ 2]  484 	btjt	0x5240, #3, 00137$
      0094A8 81               [ 4]  485 	ret
      0094A9                        486 00137$:
                                    487 ;	./../../mib/stm8s_mib_debug.c: 622: vbCh = (uint8_t)(UARTXdebug->DR);
      0094A9 C6 52 41         [ 1]  488 	ld	a, 0x5241
                                    489 ;	./../../mib/stm8s_mib_debug.c: 625: }
      0094AC 81               [ 4]  490 	ret
                                    491 	.area CODE
                                    492 	.area CONST
                                    493 	.area CONST
      0087E5                        494 ___str_0:
      0087E5 30 31 32 33 34 35 36   495 	.ascii "0123456789ABCDEF"
             37 38 39 41 42 43 44
             45 46
      0087F5 00                     496 	.db 0x00
                                    497 	.area CODE
                                    498 	.area INITIALIZER
      008E00                        499 __xinit__g_TableHex:
      008E00 87 E5                  500 	.dw ___str_0
                                    501 	.area CABS (ABS)
