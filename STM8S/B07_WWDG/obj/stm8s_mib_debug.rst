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
      000158                         35 _g_TableHex:
      000158                         36 	.ds 2
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
      008C48                         70 _MibWriteDebugByte:
      008C48 88               [ 1]   71 	push	a
      008C49 6B 01            [ 1]   72 	ld	(0x01, sp), a
                                     73 ;	./../../mib/stm8s_mib_debug.c: 227: while (!(UARTXdebug->SR & UARTX_SR_TXE));
      008C4B                         74 00101$:
      008C4B C6 52 40         [ 1]   75 	ld	a, 0x5240
      008C4E 2A FB            [ 1]   76 	jrpl	00101$
                                     77 ;	./../../mib/stm8s_mib_debug.c: 228: UARTXdebug->DR = ch;
      008C50 AE 52 41         [ 2]   78 	ldw	x, #0x5241
      008C53 7B 01            [ 1]   79 	ld	a, (0x01, sp)
      008C55 F7               [ 1]   80 	ld	(x), a
                                     81 ;	./../../mib/stm8s_mib_debug.c: 231: }
      008C56 84               [ 1]   82 	pop	a
      008C57 81               [ 4]   83 	ret
                                     84 ;	./../../mib/stm8s_mib_debug.c: 240: void MibWriteDebugByte485(uint8_t ch)
                                     85 ;	-----------------------------------------
                                     86 ;	 function MibWriteDebugByte485
                                     87 ;	-----------------------------------------
      008C58                         88 _MibWriteDebugByte485:
                                     89 ;	./../../mib/stm8s_mib_debug.c: 248: MibWriteDebugByte(ch);
                                     90 ;	./../../mib/stm8s_mib_debug.c: 257: }
      008C58 CC 8C 48         [ 2]   91 	jp	_MibWriteDebugByte
                                     92 ;	./../../mib/stm8s_mib_debug.c: 266: void MibWriteDebugEmptyCheck(void)
                                     93 ;	-----------------------------------------
                                     94 ;	 function MibWriteDebugEmptyCheck
                                     95 ;	-----------------------------------------
      008C5B                         96 _MibWriteDebugEmptyCheck:
                                     97 ;	./../../mib/stm8s_mib_debug.c: 269: while (!(UARTXdebug->SR & UARTX_SR_TC));
      008C5B                         98 00101$:
      008C5B 72 0D 52 40 FB   [ 2]   99 	btjf	0x5240, #6, 00101$
                                    100 ;	./../../mib/stm8s_mib_debug.c: 270: UARTXdebug->SR &= ~UARTX_SR_TC;
      008C60 72 1D 52 40      [ 1]  101 	bres	0x5240, #6
                                    102 ;	./../../mib/stm8s_mib_debug.c: 272: }
      008C64 81               [ 4]  103 	ret
                                    104 ;	./../../mib/stm8s_mib_debug.c: 281: void MibWriteDebugString(uint8_t *v_pStr)
                                    105 ;	-----------------------------------------
                                    106 ;	 function MibWriteDebugString
                                    107 ;	-----------------------------------------
      008C65                        108 _MibWriteDebugString:
                                    109 ;	./../../mib/stm8s_mib_debug.c: 288: while (*v_pStr)
      008C65                        110 00101$:
      008C65 F6               [ 1]  111 	ld	a, (x)
      008C66 26 01            [ 1]  112 	jrne	00117$
      008C68 81               [ 4]  113 	ret
      008C69                        114 00117$:
                                    115 ;	./../../mib/stm8s_mib_debug.c: 290: MibWriteDebugByte(*v_pStr++);
      008C69 5C               [ 1]  116 	incw	x
      008C6A 89               [ 2]  117 	pushw	x
      008C6B CD 8C 48         [ 4]  118 	call	_MibWriteDebugByte
      008C6E 85               [ 2]  119 	popw	x
      008C6F 20 F4            [ 2]  120 	jra	00101$
                                    121 ;	./../../mib/stm8s_mib_debug.c: 299: }
      008C71 81               [ 4]  122 	ret
                                    123 ;	./../../mib/stm8s_mib_debug.c: 308: void MibWriteDebugStringN(uint8_t *v_pStr, uint8_t nSize)
                                    124 ;	-----------------------------------------
                                    125 ;	 function MibWriteDebugStringN
                                    126 ;	-----------------------------------------
      008C72                        127 _MibWriteDebugStringN:
      008C72 88               [ 1]  128 	push	a
      008C73 6B 01            [ 1]  129 	ld	(0x01, sp), a
                                    130 ;	./../../mib/stm8s_mib_debug.c: 315: while (1)
      008C75                        131 00104$:
                                    132 ;	./../../mib/stm8s_mib_debug.c: 317: if (nSize == 0)	break;		
      008C75 0D 01            [ 1]  133 	tnz	(0x01, sp)
      008C77 27 0B            [ 1]  134 	jreq	00106$
                                    135 ;	./../../mib/stm8s_mib_debug.c: 318: MibWriteDebugByte(*v_pStr++);
      008C79 F6               [ 1]  136 	ld	a, (x)
      008C7A 5C               [ 1]  137 	incw	x
      008C7B 89               [ 2]  138 	pushw	x
      008C7C CD 8C 48         [ 4]  139 	call	_MibWriteDebugByte
      008C7F 85               [ 2]  140 	popw	x
                                    141 ;	./../../mib/stm8s_mib_debug.c: 319: nSize--;
      008C80 0A 01            [ 1]  142 	dec	(0x01, sp)
      008C82 20 F1            [ 2]  143 	jra	00104$
      008C84                        144 00106$:
                                    145 ;	./../../mib/stm8s_mib_debug.c: 328: }
      008C84 84               [ 1]  146 	pop	a
      008C85 81               [ 4]  147 	ret
                                    148 ;	./../../mib/stm8s_mib_debug.c: 337: uint16_t MibReadDebugByte( void )
                                    149 ;	-----------------------------------------
                                    150 ;	 function MibReadDebugByte
                                    151 ;	-----------------------------------------
      008C86                        152 _MibReadDebugByte:
                                    153 ;	./../../mib/stm8s_mib_debug.c: 344: if (rx_buffer_head == rx_buffer_tail) // wait for character
      008C86 C6 00 42         [ 1]  154 	ld	a, _rx_buffer_tail+0
      008C89 C1 00 41         [ 1]  155 	cp	a, _rx_buffer_head+0
      008C8C 26 03            [ 1]  156 	jrne	00102$
                                    157 ;	./../../mib/stm8s_mib_debug.c: 346: return MIB_DEBUG_READ_NODATA; // no data
      008C8E 5F               [ 1]  158 	clrw	x
      008C8F 5A               [ 2]  159 	decw	x
      008C90 81               [ 4]  160 	ret
      008C91                        161 00102$:
                                    162 ;	./../../mib/stm8s_mib_debug.c: 348: vbIndex = rx_buffer_tail + 1;
      008C91 C6 00 42         [ 1]  163 	ld	a, _rx_buffer_tail+0
      008C94 4C               [ 1]  164 	inc	a
                                    165 ;	./../../mib/stm8s_mib_debug.c: 349: if (vbIndex >= RX_BUFFER_SIZE) vbIndex = 0;
      008C95 A1 40            [ 1]  166 	cp	a, #0x40
      008C97 25 01            [ 1]  167 	jrc	00104$
      008C99 4F               [ 1]  168 	clr	a
      008C9A                        169 00104$:
                                    170 ;	./../../mib/stm8s_mib_debug.c: 350: vbCh = rx_buffer[vbIndex];
      008C9A 5F               [ 1]  171 	clrw	x
      008C9B 97               [ 1]  172 	ld	xl, a
      008C9C 1C 00 01         [ 2]  173 	addw	x, #(_rx_buffer+0)
      008C9F 88               [ 1]  174 	push	a
      008CA0 F6               [ 1]  175 	ld	a, (x)
      008CA1 97               [ 1]  176 	ld	xl, a
      008CA2 84               [ 1]  177 	pop	a
                                    178 ;	./../../mib/stm8s_mib_debug.c: 351: rx_buffer_tail = vbIndex;
      008CA3 C7 00 42         [ 1]  179 	ld	_rx_buffer_tail+0, a
                                    180 ;	./../../mib/stm8s_mib_debug.c: 352: return (uint16_t)vbCh;
      008CA6 4F               [ 1]  181 	clr	a
      008CA7 95               [ 1]  182 	ld	xh, a
                                    183 ;	./../../mib/stm8s_mib_debug.c: 367: }
      008CA8 81               [ 4]  184 	ret
                                    185 ;	./../../mib/stm8s_mib_debug.c: 442: void MibDebugInit(uint32_t baudrate)
                                    186 ;	-----------------------------------------
                                    187 ;	 function MibDebugInit
                                    188 ;	-----------------------------------------
      008CA9                        189 _MibDebugInit:
      008CA9 52 10            [ 2]  190 	sub	sp, #16
                                    191 ;	./../../mib/stm8s_mib_debug.c: 446: rx_buffer_head = 0;
      008CAB 72 5F 00 41      [ 1]  192 	clr	_rx_buffer_head+0
                                    193 ;	./../../mib/stm8s_mib_debug.c: 447: rx_buffer_tail = 0;
      008CAF 72 5F 00 42      [ 1]  194 	clr	_rx_buffer_tail+0
                                    195 ;	./../../mib/stm8s_mib_debug.c: 480: uint32_t BaudRate = baudrate;
      008CB3 1E 15            [ 2]  196 	ldw	x, (0x15, sp)
      008CB5 16 13            [ 2]  197 	ldw	y, (0x13, sp)
                                    198 ;	./../../mib/stm8s_mib_debug.c: 486: UARTXdebug->CR1 &= (uint8_t)(~UARTX_CR1_M);			 /**< Clear the word length bit */
      008CB7 72 19 52 44      [ 1]  199 	bres	0x5244, #4
                                    200 ;	./../../mib/stm8s_mib_debug.c: 487: UARTXdebug->CR1 |= (uint8_t)UARTX_WORDLENGTH_8D; /**< Set the word length bit according to UART1_WordLength value */
      008CBB 55 52 44 52 44   [ 1]  201 	mov	0x5244, 0x5244
                                    202 ;	./../../mib/stm8s_mib_debug.c: 489: UARTXdebug->CR3 &= (uint8_t)(~UARTX_CR3_STOP); /**< Clear the STOP bits */
      008CC0 C6 52 46         [ 1]  203 	ld	a, 0x5246
      008CC3 A4 CF            [ 1]  204 	and	a, #0xcf
      008CC5 C7 52 46         [ 1]  205 	ld	0x5246, a
                                    206 ;	./../../mib/stm8s_mib_debug.c: 490: UARTXdebug->CR3 |= (uint8_t)UARTX_STOPBITS_1;	 /**< Set the STOP bits number according to UART1_StopBits value  */
      008CC8 55 52 46 52 46   [ 1]  207 	mov	0x5246, 0x5246
                                    208 ;	./../../mib/stm8s_mib_debug.c: 492: UARTXdebug->CR1 &= (uint8_t)(~(UARTX_CR1_PCEN | UARTX_CR1_PS)); /**< Clear the Parity Control bit */
      008CCD C6 52 44         [ 1]  209 	ld	a, 0x5244
      008CD0 A4 F9            [ 1]  210 	and	a, #0xf9
      008CD2 C7 52 44         [ 1]  211 	ld	0x5244, a
                                    212 ;	./../../mib/stm8s_mib_debug.c: 493: UARTXdebug->CR1 |= (uint8_t)UARTX_PARITY_NO;										/**< Set the Parity Control bit to UART1_Parity value */
      008CD5 55 52 44 52 44   [ 1]  213 	mov	0x5244, 0x5244
                                    214 ;	./../../mib/stm8s_mib_debug.c: 495: UARTXdebug->BRR1 &= (uint8_t)(~UARTX_BRR1_DIVM); /**< Clear the LSB mantissa of UARTDIV  */
      008CDA C6 52 42         [ 1]  215 	ld	a, 0x5242
      008CDD 35 00 52 42      [ 1]  216 	mov	0x5242+0, #0x00
                                    217 ;	./../../mib/stm8s_mib_debug.c: 496: UARTXdebug->BRR2 &= (uint8_t)(~UARTX_BRR2_DIVM); /**< Clear the MSB mantissa of UARTDIV  */
      008CE1 C6 52 43         [ 1]  218 	ld	a, 0x5243
      008CE4 A4 0F            [ 1]  219 	and	a, #0x0f
      008CE6 C7 52 43         [ 1]  220 	ld	0x5243, a
                                    221 ;	./../../mib/stm8s_mib_debug.c: 497: UARTXdebug->BRR2 &= (uint8_t)(~UARTX_BRR2_DIVF); /**< Clear the Fraction bits of UARTDIV */
      008CE9 C6 52 43         [ 1]  222 	ld	a, 0x5243
      008CEC A4 F0            [ 1]  223 	and	a, #0xf0
      008CEE C7 52 43         [ 1]  224 	ld	0x5243, a
                                    225 ;	./../../mib/stm8s_mib_debug.c: 500: BaudRate_Mantissa = ((uint32_t)v_ClkValue / (BaudRate << 4));
      008CF1 A6 04            [ 1]  226 	ld	a, #0x04
      008CF3                        227 00103$:
      008CF3 58               [ 2]  228 	sllw	x
      008CF4 90 59            [ 2]  229 	rlcw	y
      008CF6 4A               [ 1]  230 	dec	a
      008CF7 26 FA            [ 1]  231 	jrne	00103$
      008CF9 1F 0F            [ 2]  232 	ldw	(0x0f, sp), x
      008CFB 17 0D            [ 2]  233 	ldw	(0x0d, sp), y
      008CFD 1E 0F            [ 2]  234 	ldw	x, (0x0f, sp)
      008CFF 89               [ 2]  235 	pushw	x
      008D00 1E 0F            [ 2]  236 	ldw	x, (0x0f, sp)
      008D02 89               [ 2]  237 	pushw	x
      008D03 4B 00            [ 1]  238 	push	#0x00
      008D05 4B 24            [ 1]  239 	push	#0x24
      008D07 4B F4            [ 1]  240 	push	#0xf4
      008D09 4B 00            [ 1]  241 	push	#0x00
      008D0B CD A8 36         [ 4]  242 	call	__divulong
      008D0E 5B 08            [ 2]  243 	addw	sp, #8
      008D10 1F 03            [ 2]  244 	ldw	(0x03, sp), x
                                    245 ;	./../../mib/stm8s_mib_debug.c: 501: BaudRate_Mantissa100 = (((uint32_t)v_ClkValue * 100) / (BaudRate << 4));
      008D12 90 89            [ 2]  246 	pushw	y
      008D14 1E 11            [ 2]  247 	ldw	x, (0x11, sp)
      008D16 89               [ 2]  248 	pushw	x
      008D17 1E 11            [ 2]  249 	ldw	x, (0x11, sp)
      008D19 89               [ 2]  250 	pushw	x
      008D1A 4B 00            [ 1]  251 	push	#0x00
      008D1C 4B 10            [ 1]  252 	push	#0x10
      008D1E 4B 5E            [ 1]  253 	push	#0x5e
      008D20 4B 5F            [ 1]  254 	push	#0x5f
      008D22 CD A8 36         [ 4]  255 	call	__divulong
      008D25 5B 08            [ 2]  256 	addw	sp, #8
      008D27 17 0F            [ 2]  257 	ldw	(0x0f, sp), y
      008D29 90 85            [ 2]  258 	popw	y
      008D2B 1F 07            [ 2]  259 	ldw	(0x07, sp), x
      008D2D 1E 0D            [ 2]  260 	ldw	x, (0x0d, sp)
      008D2F 1F 05            [ 2]  261 	ldw	(0x05, sp), x
                                    262 ;	./../../mib/stm8s_mib_debug.c: 503: BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (u8)0x0F); /**< Set the fraction of UARTDIV  */
      008D31 90 89            [ 2]  263 	pushw	y
      008D33 1E 05            [ 2]  264 	ldw	x, (0x05, sp)
      008D35 89               [ 2]  265 	pushw	x
      008D36 90 89            [ 2]  266 	pushw	y
      008D38 4B 64            [ 1]  267 	push	#0x64
      008D3A 5F               [ 1]  268 	clrw	x
      008D3B 89               [ 2]  269 	pushw	x
      008D3C 4B 00            [ 1]  270 	push	#0x00
      008D3E CD A9 68         [ 4]  271 	call	__mullong
      008D41 5B 08            [ 2]  272 	addw	sp, #8
      008D43 1F 0D            [ 2]  273 	ldw	(0x0d, sp), x
      008D45 17 0B            [ 2]  274 	ldw	(0x0b, sp), y
      008D47 90 85            [ 2]  275 	popw	y
      008D49 1E 07            [ 2]  276 	ldw	x, (0x07, sp)
      008D4B 72 F0 0B         [ 2]  277 	subw	x, (0x0b, sp)
      008D4E 1F 0F            [ 2]  278 	ldw	(0x0f, sp), x
      008D50 7B 06            [ 1]  279 	ld	a, (0x06, sp)
      008D52 12 0A            [ 1]  280 	sbc	a, (0x0a, sp)
      008D54 97               [ 1]  281 	ld	xl, a
      008D55 7B 05            [ 1]  282 	ld	a, (0x05, sp)
      008D57 12 09            [ 1]  283 	sbc	a, (0x09, sp)
      008D59 95               [ 1]  284 	ld	xh, a
      008D5A 1F 0D            [ 2]  285 	ldw	(0x0d, sp), x
      008D5C 1E 0F            [ 2]  286 	ldw	x, (0x0f, sp)
      008D5E A6 04            [ 1]  287 	ld	a, #0x04
      008D60                        288 00105$:
      008D60 58               [ 2]  289 	sllw	x
      008D61 09 0E            [ 1]  290 	rlc	(0x0e, sp)
      008D63 09 0D            [ 1]  291 	rlc	(0x0d, sp)
      008D65 4A               [ 1]  292 	dec	a
      008D66 26 F8            [ 1]  293 	jrne	00105$
      008D68 90 89            [ 2]  294 	pushw	y
      008D6A 4B 64            [ 1]  295 	push	#0x64
      008D6C 4B 00            [ 1]  296 	push	#0x00
      008D6E 4B 00            [ 1]  297 	push	#0x00
      008D70 4B 00            [ 1]  298 	push	#0x00
      008D72 89               [ 2]  299 	pushw	x
      008D73 1E 15            [ 2]  300 	ldw	x, (0x15, sp)
      008D75 89               [ 2]  301 	pushw	x
      008D76 CD A8 36         [ 4]  302 	call	__divulong
      008D79 5B 08            [ 2]  303 	addw	sp, #8
      008D7B 17 0F            [ 2]  304 	ldw	(0x0f, sp), y
      008D7D 9F               [ 1]  305 	ld	a, xl
      008D7E 90 85            [ 2]  306 	popw	y
      008D80 A4 0F            [ 1]  307 	and	a, #0x0f
      008D82 6B 0E            [ 1]  308 	ld	(0x0e, sp), a
                                    309 ;	./../../mib/stm8s_mib_debug.c: 504: BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (u8)0xF0);
      008D84 1E 03            [ 2]  310 	ldw	x, (0x03, sp)
      008D86 A6 10            [ 1]  311 	ld	a, #0x10
      008D88 62               [ 2]  312 	div	x, a
      008D89 02               [ 1]  313 	rlwa	x
      008D8A 6B 0F            [ 1]  314 	ld	(0x0f, sp), a
      008D8C 01               [ 1]  315 	rrwa	x
      008D8D 9F               [ 1]  316 	ld	a, xl
      008D8E A4 F0            [ 1]  317 	and	a, #0xf0
                                    318 ;	./../../mib/stm8s_mib_debug.c: 506: UARTXdebug->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
      008D90 1A 0E            [ 1]  319 	or	a, (0x0e, sp)
      008D92 C7 52 43         [ 1]  320 	ld	0x5243, a
                                    321 ;	./../../mib/stm8s_mib_debug.c: 507: UARTXdebug->BRR1 = (uint8_t)BaudRate_Mantissa; /**< Set the LSB mantissa of UARTDIV  */
      008D95 7B 04            [ 1]  322 	ld	a, (0x04, sp)
      008D97 C7 52 42         [ 1]  323 	ld	0x5242, a
                                    324 ;	./../../mib/stm8s_mib_debug.c: 509: UARTXdebug->CR2 &= (uint8_t) ~(UARTX_CR2_TEN | UARTX_CR2_REN);																																		 /**< Disable the Transmitter and Receiver before seting the LBCL, CPOL and CPHA bits */
      008D9A C6 52 45         [ 1]  325 	ld	a, 0x5245
      008D9D A4 F3            [ 1]  326 	and	a, #0xf3
      008D9F C7 52 45         [ 1]  327 	ld	0x5245, a
                                    328 ;	./../../mib/stm8s_mib_debug.c: 510: UARTXdebug->CR3 &= (uint8_t) ~(UARTX_CR3_CPOL | UARTX_CR3_CPHA | UARTX_CR3_LBCL);																									 /**< Clear the Clock Polarity, lock Phase, Last Bit Clock pulse */
      008DA2 C6 52 46         [ 1]  329 	ld	a, 0x5246
      008DA5 A4 F8            [ 1]  330 	and	a, #0xf8
      008DA7 C7 52 46         [ 1]  331 	ld	0x5246, a
                                    332 ;	./../../mib/stm8s_mib_debug.c: 511: UARTXdebug->CR3 |= (uint8_t)((uint8_t)UARTX_SYNCMODE_CLOCK_DISABLE & (uint8_t)(UARTX_CR3_CPOL | UARTX_CR3_CPHA | UARTX_CR3_LBCL)); /**< Set the Clock Polarity, lock Phase, Last Bit Clock pulse */
      008DAA 55 52 46 52 46   [ 1]  333 	mov	0x5246, 0x5246
                                    334 ;	./../../mib/stm8s_mib_debug.c: 513: UARTXdebug->CR2 |= (uint8_t)UARTX_CR2_TEN;									/**< Set the Transmitter Enable bit */
      008DAF 72 16 52 45      [ 1]  335 	bset	0x5245, #3
                                    336 ;	./../../mib/stm8s_mib_debug.c: 517: UARTXdebug->CR2 |= (uint8_t)UARTX_CR2_REN | UARTX_CR2_RIEN; /**< Set the Receiver Enable bit */
      008DB3 C6 52 45         [ 1]  337 	ld	a, 0x5245
      008DB6 AA 24            [ 1]  338 	or	a, #0x24
      008DB8 C7 52 45         [ 1]  339 	ld	0x5245, a
                                    340 ;	./../../mib/stm8s_mib_debug.c: 525: UARTXdebug->CR3 &= (uint8_t)(~UARTX_CR3_CKEN); /**< Clear the Clock Enable bit */
      008DBB 72 17 52 46      [ 1]  341 	bres	0x5246, #3
                                    342 ;	./../../mib/stm8s_mib_debug.c: 531: UCOM_TXD_GPIO->DDR |= (UCOM_TXD_PIN); /* Set Output mode */
      008DBF 72 1A 50 11      [ 1]  343 	bset	0x5011, #5
                                    344 ;	./../../mib/stm8s_mib_debug.c: 532: UCOM_TXD_GPIO->CR1 |= (UCOM_TXD_PIN);	/* Pull-Up or Push-Pull */
      008DC3 72 1A 50 12      [ 1]  345 	bset	0x5012, #5
                                    346 ;	./../../mib/stm8s_mib_debug.c: 533: UCOM_TXD_GPIO->CR2 |= (UCOM_TXD_PIN);	/* Output speed up to 10 MHz */
      008DC7 72 1A 50 13      [ 1]  347 	bset	0x5013, #5
                                    348 ;	./../../mib/stm8s_mib_debug.c: 534: UCOM_TXD_GPIO->ODR |= (UCOM_TXD_PIN); // high... 
      008DCB 72 1A 50 0F      [ 1]  349 	bset	0x500f, #5
                                    350 ;	./../../mib/stm8s_mib_debug.c: 538: UCOM_RXD_GPIO->DDR &= ~(UCOM_RXD_PIN); // Set input mode 
      008DCF 72 1D 50 11      [ 1]  351 	bres	0x5011, #6
                                    352 ;	./../../mib/stm8s_mib_debug.c: 539: UCOM_RXD_GPIO->CR1 |= (UCOM_RXD_PIN);	 /* Pull-Up or Push-Pull */
      008DD3 72 1C 50 12      [ 1]  353 	bset	0x5012, #6
                                    354 ;	./../../mib/stm8s_mib_debug.c: 540: UCOM_RXD_GPIO->CR2 &= ~(UCOM_RXD_PIN); /*  External interrupt disabled */
      008DD7 C6 50 13         [ 1]  355 	ld	a, 0x5013
      008DDA A4 BF            [ 1]  356 	and	a, #0xbf
      008DDC C7 50 13         [ 1]  357 	ld	0x5013, a
                                    358 ;	./../../mib/stm8s_mib_debug.c: 548: }
      008DDF 1E 11            [ 2]  359 	ldw	x, (17, sp)
      008DE1 5B 16            [ 2]  360 	addw	sp, #22
      008DE3 FC               [ 2]  361 	jp	(x)
                                    362 ;	./../../mib/stm8s_mib_debug.c: 554: void MibWriteDebugTransmitHex(uint8_t data)
                                    363 ;	-----------------------------------------
                                    364 ;	 function MibWriteDebugTransmitHex
                                    365 ;	-----------------------------------------
      008DE4                        366 _MibWriteDebugTransmitHex:
      008DE4 88               [ 1]  367 	push	a
      008DE5 6B 01            [ 1]  368 	ld	(0x01, sp), a
                                    369 ;	./../../mib/stm8s_mib_debug.c: 561: MibWriteDebugByte('.');
      008DE7 A6 2E            [ 1]  370 	ld	a, #0x2e
      008DE9 CD 8C 48         [ 4]  371 	call	_MibWriteDebugByte
                                    372 ;	./../../mib/stm8s_mib_debug.c: 562: if (data > 0xd)	MibWriteDebugByte(data);
      008DEC 7B 01            [ 1]  373 	ld	a, (0x01, sp)
      008DEE A1 0D            [ 1]  374 	cp	a, #0x0d
      008DF0 23 05            [ 2]  375 	jrule	00102$
      008DF2 7B 01            [ 1]  376 	ld	a, (0x01, sp)
      008DF4 CD 8C 48         [ 4]  377 	call	_MibWriteDebugByte
      008DF7                        378 00102$:
                                    379 ;	./../../mib/stm8s_mib_debug.c: 563: MibWriteDebugByte('[');
      008DF7 A6 5B            [ 1]  380 	ld	a, #0x5b
      008DF9 CD 8C 48         [ 4]  381 	call	_MibWriteDebugByte
                                    382 ;	./../../mib/stm8s_mib_debug.c: 564: MibWriteDebugByte(g_TableHex[data >> 4]);
      008DFC 7B 01            [ 1]  383 	ld	a, (0x01, sp)
      008DFE 4E               [ 1]  384 	swap	a
      008DFF A4 0F            [ 1]  385 	and	a, #0x0f
      008E01 5F               [ 1]  386 	clrw	x
      008E02 97               [ 1]  387 	ld	xl, a
      008E03 72 BB 01 58      [ 2]  388 	addw	x, _g_TableHex+0
      008E07 F6               [ 1]  389 	ld	a, (x)
      008E08 CD 8C 48         [ 4]  390 	call	_MibWriteDebugByte
                                    391 ;	./../../mib/stm8s_mib_debug.c: 565: MibWriteDebugByte(g_TableHex[data & 0xf]);
      008E0B 7B 01            [ 1]  392 	ld	a, (0x01, sp)
      008E0D A4 0F            [ 1]  393 	and	a, #0x0f
      008E0F 97               [ 1]  394 	ld	xl, a
      008E10 4F               [ 1]  395 	clr	a
      008E11 95               [ 1]  396 	ld	xh, a
      008E12 72 BB 01 58      [ 2]  397 	addw	x, _g_TableHex+0
      008E16 F6               [ 1]  398 	ld	a, (x)
      008E17 CD 8C 48         [ 4]  399 	call	_MibWriteDebugByte
                                    400 ;	./../../mib/stm8s_mib_debug.c: 566: MibWriteDebugByte(']');
      008E1A A6 5D            [ 1]  401 	ld	a, #0x5d
      008E1C CD 8C 48         [ 4]  402 	call	_MibWriteDebugByte
                                    403 ;	./../../mib/stm8s_mib_debug.c: 567: while (!(UARTXdebug->SR & UARTX_SR_TC));
      008E1F                        404 00103$:
      008E1F 72 0D 52 40 FB   [ 2]  405 	btjf	0x5240, #6, 00103$
                                    406 ;	./../../mib/stm8s_mib_debug.c: 568: UARTXdebug->SR &= ~UARTX_SR_TC;	
      008E24 72 1D 52 40      [ 1]  407 	bres	0x5240, #6
                                    408 ;	./../../mib/stm8s_mib_debug.c: 574: }
      008E28 84               [ 1]  409 	pop	a
      008E29 81               [ 4]  410 	ret
                                    411 ;	./../../mib/stm8s_mib_debug.c: 579: void MibWriteDebugTransmitHex2(uint8_t data)
                                    412 ;	-----------------------------------------
                                    413 ;	 function MibWriteDebugTransmitHex2
                                    414 ;	-----------------------------------------
      008E2A                        415 _MibWriteDebugTransmitHex2:
      008E2A 88               [ 1]  416 	push	a
      008E2B 6B 01            [ 1]  417 	ld	(0x01, sp), a
                                    418 ;	./../../mib/stm8s_mib_debug.c: 586: MibWriteDebugByte('.');
      008E2D A6 2E            [ 1]  419 	ld	a, #0x2e
      008E2F CD 8C 48         [ 4]  420 	call	_MibWriteDebugByte
                                    421 ;	./../../mib/stm8s_mib_debug.c: 587: MibWriteDebugByte(g_TableHex[data >> 4]);
      008E32 7B 01            [ 1]  422 	ld	a, (0x01, sp)
      008E34 4E               [ 1]  423 	swap	a
      008E35 A4 0F            [ 1]  424 	and	a, #0x0f
      008E37 5F               [ 1]  425 	clrw	x
      008E38 97               [ 1]  426 	ld	xl, a
      008E39 72 BB 01 58      [ 2]  427 	addw	x, _g_TableHex+0
      008E3D F6               [ 1]  428 	ld	a, (x)
      008E3E CD 8C 48         [ 4]  429 	call	_MibWriteDebugByte
                                    430 ;	./../../mib/stm8s_mib_debug.c: 588: MibWriteDebugByte(g_TableHex[data & 0xf]);
      008E41 7B 01            [ 1]  431 	ld	a, (0x01, sp)
      008E43 A4 0F            [ 1]  432 	and	a, #0x0f
      008E45 97               [ 1]  433 	ld	xl, a
      008E46 4F               [ 1]  434 	clr	a
      008E47 95               [ 1]  435 	ld	xh, a
      008E48 72 BB 01 58      [ 2]  436 	addw	x, _g_TableHex+0
      008E4C F6               [ 1]  437 	ld	a, (x)
      008E4D CD 8C 48         [ 4]  438 	call	_MibWriteDebugByte
                                    439 ;	./../../mib/stm8s_mib_debug.c: 589: while (!(UARTXdebug->SR & UARTX_SR_TC));
      008E50                        440 00101$:
      008E50 72 0D 52 40 FB   [ 2]  441 	btjf	0x5240, #6, 00101$
                                    442 ;	./../../mib/stm8s_mib_debug.c: 590: UARTXdebug->SR &= ~UARTX_SR_TC;
      008E55 72 1D 52 40      [ 1]  443 	bres	0x5240, #6
                                    444 ;	./../../mib/stm8s_mib_debug.c: 596: }
      008E59 84               [ 1]  445 	pop	a
      008E5A 81               [ 4]  446 	ret
                                    447 ;	./../../mib/stm8s_mib_debug.c: 602: void UART_RX_IRQHandler(void) /* UART RX */
                                    448 ;	-----------------------------------------
                                    449 ;	 function UART_RX_IRQHandler
                                    450 ;	-----------------------------------------
      008E5B                        451 _UART_RX_IRQHandler:
                                    452 ;	./../../mib/stm8s_mib_debug.c: 608: if (UARTXdebug->SR & UARTX_SR_RXNE) // RXNE :  ISR.bit5 // UART1_FLAG_RXNE
      008E5B 72 0B 52 40 22   [ 2]  453 	btjf	0x5240, #5, 00108$
                                    454 ;	./../../mib/stm8s_mib_debug.c: 610: vbCh = (uint8_t)(UARTXdebug->DR);
      008E60 C6 52 41         [ 1]  455 	ld	a, 0x5241
      008E63 90 97            [ 1]  456 	ld	yl, a
                                    457 ;	./../../mib/stm8s_mib_debug.c: 611: vbIndex = rx_buffer_head + 1;
      008E65 C6 00 41         [ 1]  458 	ld	a, _rx_buffer_head+0
      008E68 4C               [ 1]  459 	inc	a
                                    460 ;	./../../mib/stm8s_mib_debug.c: 612: if (vbIndex >= RX_BUFFER_SIZE)
      008E69 A1 40            [ 1]  461 	cp	a, #0x40
      008E6B 25 01            [ 1]  462 	jrc	00102$
                                    463 ;	./../../mib/stm8s_mib_debug.c: 613: vbIndex = 0;
      008E6D 4F               [ 1]  464 	clr	a
      008E6E                        465 00102$:
                                    466 ;	./../../mib/stm8s_mib_debug.c: 614: if (vbIndex != rx_buffer_tail)
      008E6E C1 00 42         [ 1]  467 	cp	a, _rx_buffer_tail+0
      008E71 26 01            [ 1]  468 	jrne	00135$
      008E73 81               [ 4]  469 	ret
      008E74                        470 00135$:
                                    471 ;	./../../mib/stm8s_mib_debug.c: 616: rx_buffer[vbIndex] = vbCh;
      008E74 5F               [ 1]  472 	clrw	x
      008E75 97               [ 1]  473 	ld	xl, a
      008E76 1C 00 01         [ 2]  474 	addw	x, #(_rx_buffer+0)
      008E79 88               [ 1]  475 	push	a
      008E7A 90 9F            [ 1]  476 	ld	a, yl
      008E7C F7               [ 1]  477 	ld	(x), a
      008E7D 84               [ 1]  478 	pop	a
                                    479 ;	./../../mib/stm8s_mib_debug.c: 617: rx_buffer_head = vbIndex;
      008E7E C7 00 41         [ 1]  480 	ld	_rx_buffer_head+0, a
      008E81 81               [ 4]  481 	ret
      008E82                        482 00108$:
                                    483 ;	./../../mib/stm8s_mib_debug.c: 620: else if (UARTXdebug->SR & UARTX_SR_OR) // OE : ISR.bit4 // /*!< OverRun error flag */
      008E82 72 06 52 40 01   [ 2]  484 	btjt	0x5240, #3, 00137$
      008E87 81               [ 4]  485 	ret
      008E88                        486 00137$:
                                    487 ;	./../../mib/stm8s_mib_debug.c: 622: vbCh = (uint8_t)(UARTXdebug->DR);
      008E88 C6 52 41         [ 1]  488 	ld	a, 0x5241
                                    489 ;	./../../mib/stm8s_mib_debug.c: 625: }
      008E8B 81               [ 4]  490 	ret
                                    491 	.area CODE
                                    492 	.area CONST
                                    493 	.area CONST
      0082DB                        494 ___str_0:
      0082DB 30 31 32 33 34 35 36   495 	.ascii "0123456789ABCDEF"
             37 38 39 41 42 43 44
             45 46
      0082EB 00                     496 	.db 0x00
                                    497 	.area CODE
                                    498 	.area INITIALIZER
      0088F6                        499 __xinit__g_TableHex:
      0088F6 82 DB                  500 	.dw ___str_0
                                    501 	.area CABS (ABS)
