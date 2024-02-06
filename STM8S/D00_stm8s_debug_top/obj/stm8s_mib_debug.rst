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
                                     14 	.globl _MibWriteDebugString
                                     15 	.globl _MibWriteDebugStringN
                                     16 	.globl _MibReadDebugByte
                                     17 	.globl _MibDebugInit
                                     18 	.globl _MibWriteDebugTransmitHex
                                     19 	.globl _MibWriteDebugTransmitHex2
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DATA
      000001                         24 _rx_buffer:
      000001                         25 	.ds 64
      000041                         26 _rx_buffer_head:
      000041                         27 	.ds 1
      000042                         28 _rx_buffer_tail:
      000042                         29 	.ds 1
                                     30 ;--------------------------------------------------------
                                     31 ; ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area INITIALIZED
      000149                         34 _g_TableHex:
      000149                         35 	.ds 2
                                     36 ;--------------------------------------------------------
                                     37 ; absolute external ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area DABS (ABS)
                                     40 
                                     41 ; default segment ordering for linker
                                     42 	.area HOME
                                     43 	.area GSINIT
                                     44 	.area GSFINAL
                                     45 	.area CONST
                                     46 	.area INITIALIZER
                                     47 	.area CODE
                                     48 
                                     49 ;--------------------------------------------------------
                                     50 ; global & static initialisations
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area GSINIT
                                     54 	.area GSFINAL
                                     55 	.area GSINIT
                                     56 ;--------------------------------------------------------
                                     57 ; Home
                                     58 ;--------------------------------------------------------
                                     59 	.area HOME
                                     60 	.area HOME
                                     61 ;--------------------------------------------------------
                                     62 ; code
                                     63 ;--------------------------------------------------------
                                     64 	.area CODE
                                     65 ;	./../../mib/stm8s_mib_debug.c: 206: void MibWriteDebugByte(uint8_t ch)
                                     66 ;	-----------------------------------------
                                     67 ;	 function MibWriteDebugByte
                                     68 ;	-----------------------------------------
      00874F                         69 _MibWriteDebugByte:
      00874F 88               [ 1]   70 	push	a
      008750 6B 01            [ 1]   71 	ld	(0x01, sp), a
                                     72 ;	./../../mib/stm8s_mib_debug.c: 227: while (!(UARTXdebug->SR & UARTX_SR_TXE));
      008752                         73 00101$:
      008752 C6 52 40         [ 1]   74 	ld	a, 0x5240
      008755 2A FB            [ 1]   75 	jrpl	00101$
                                     76 ;	./../../mib/stm8s_mib_debug.c: 228: UARTXdebug->DR = ch;
      008757 AE 52 41         [ 2]   77 	ldw	x, #0x5241
      00875A 7B 01            [ 1]   78 	ld	a, (0x01, sp)
      00875C F7               [ 1]   79 	ld	(x), a
                                     80 ;	./../../mib/stm8s_mib_debug.c: 231: }
      00875D 84               [ 1]   81 	pop	a
      00875E 81               [ 4]   82 	ret
                                     83 ;	./../../mib/stm8s_mib_debug.c: 240: void MibWriteDebugByte485(uint8_t ch)
                                     84 ;	-----------------------------------------
                                     85 ;	 function MibWriteDebugByte485
                                     86 ;	-----------------------------------------
      00875F                         87 _MibWriteDebugByte485:
                                     88 ;	./../../mib/stm8s_mib_debug.c: 248: MibWriteDebugByte(ch);
                                     89 ;	./../../mib/stm8s_mib_debug.c: 257: }
      00875F CC 87 4F         [ 2]   90 	jp	_MibWriteDebugByte
                                     91 ;	./../../mib/stm8s_mib_debug.c: 266: void MibWriteDebugString(uint8_t *v_pStr)
                                     92 ;	-----------------------------------------
                                     93 ;	 function MibWriteDebugString
                                     94 ;	-----------------------------------------
      008762                         95 _MibWriteDebugString:
                                     96 ;	./../../mib/stm8s_mib_debug.c: 273: while (*v_pStr)
      008762                         97 00101$:
      008762 F6               [ 1]   98 	ld	a, (x)
      008763 26 01            [ 1]   99 	jrne	00117$
      008765 81               [ 4]  100 	ret
      008766                        101 00117$:
                                    102 ;	./../../mib/stm8s_mib_debug.c: 275: MibWriteDebugByte(*v_pStr++);
      008766 5C               [ 1]  103 	incw	x
      008767 89               [ 2]  104 	pushw	x
      008768 CD 87 4F         [ 4]  105 	call	_MibWriteDebugByte
      00876B 85               [ 2]  106 	popw	x
      00876C 20 F4            [ 2]  107 	jra	00101$
                                    108 ;	./../../mib/stm8s_mib_debug.c: 284: }
      00876E 81               [ 4]  109 	ret
                                    110 ;	./../../mib/stm8s_mib_debug.c: 293: void MibWriteDebugStringN(uint8_t *v_pStr, uint8_t nSize)
                                    111 ;	-----------------------------------------
                                    112 ;	 function MibWriteDebugStringN
                                    113 ;	-----------------------------------------
      00876F                        114 _MibWriteDebugStringN:
      00876F 88               [ 1]  115 	push	a
      008770 6B 01            [ 1]  116 	ld	(0x01, sp), a
                                    117 ;	./../../mib/stm8s_mib_debug.c: 300: while (1)
      008772                        118 00104$:
                                    119 ;	./../../mib/stm8s_mib_debug.c: 302: if (nSize == 0)	break;		
      008772 0D 01            [ 1]  120 	tnz	(0x01, sp)
      008774 27 0B            [ 1]  121 	jreq	00106$
                                    122 ;	./../../mib/stm8s_mib_debug.c: 303: MibWriteDebugByte(*v_pStr++);
      008776 F6               [ 1]  123 	ld	a, (x)
      008777 5C               [ 1]  124 	incw	x
      008778 89               [ 2]  125 	pushw	x
      008779 CD 87 4F         [ 4]  126 	call	_MibWriteDebugByte
      00877C 85               [ 2]  127 	popw	x
                                    128 ;	./../../mib/stm8s_mib_debug.c: 304: nSize--;
      00877D 0A 01            [ 1]  129 	dec	(0x01, sp)
      00877F 20 F1            [ 2]  130 	jra	00104$
      008781                        131 00106$:
                                    132 ;	./../../mib/stm8s_mib_debug.c: 313: }
      008781 84               [ 1]  133 	pop	a
      008782 81               [ 4]  134 	ret
                                    135 ;	./../../mib/stm8s_mib_debug.c: 322: uint16_t MibReadDebugByte( void )
                                    136 ;	-----------------------------------------
                                    137 ;	 function MibReadDebugByte
                                    138 ;	-----------------------------------------
      008783                        139 _MibReadDebugByte:
                                    140 ;	./../../mib/stm8s_mib_debug.c: 329: if (rx_buffer_head == rx_buffer_tail) // wait for character
      008783 C6 00 42         [ 1]  141 	ld	a, _rx_buffer_tail+0
      008786 C1 00 41         [ 1]  142 	cp	a, _rx_buffer_head+0
      008789 26 03            [ 1]  143 	jrne	00102$
                                    144 ;	./../../mib/stm8s_mib_debug.c: 331: return MIB_DEBUG_READ_NODATA; // no data
      00878B 5F               [ 1]  145 	clrw	x
      00878C 5A               [ 2]  146 	decw	x
      00878D 81               [ 4]  147 	ret
      00878E                        148 00102$:
                                    149 ;	./../../mib/stm8s_mib_debug.c: 333: vbIndex = rx_buffer_tail + 1;
      00878E C6 00 42         [ 1]  150 	ld	a, _rx_buffer_tail+0
      008791 4C               [ 1]  151 	inc	a
                                    152 ;	./../../mib/stm8s_mib_debug.c: 334: if (vbIndex >= RX_BUFFER_SIZE) vbIndex = 0;
      008792 A1 40            [ 1]  153 	cp	a, #0x40
      008794 25 01            [ 1]  154 	jrc	00104$
      008796 4F               [ 1]  155 	clr	a
      008797                        156 00104$:
                                    157 ;	./../../mib/stm8s_mib_debug.c: 335: vbCh = rx_buffer[vbIndex];
      008797 5F               [ 1]  158 	clrw	x
      008798 97               [ 1]  159 	ld	xl, a
      008799 1C 00 01         [ 2]  160 	addw	x, #(_rx_buffer+0)
      00879C 88               [ 1]  161 	push	a
      00879D F6               [ 1]  162 	ld	a, (x)
      00879E 97               [ 1]  163 	ld	xl, a
      00879F 84               [ 1]  164 	pop	a
                                    165 ;	./../../mib/stm8s_mib_debug.c: 336: rx_buffer_tail = vbIndex;
      0087A0 C7 00 42         [ 1]  166 	ld	_rx_buffer_tail+0, a
                                    167 ;	./../../mib/stm8s_mib_debug.c: 337: return (uint16_t)vbCh;
      0087A3 4F               [ 1]  168 	clr	a
      0087A4 95               [ 1]  169 	ld	xh, a
                                    170 ;	./../../mib/stm8s_mib_debug.c: 352: }
      0087A5 81               [ 4]  171 	ret
                                    172 ;	./../../mib/stm8s_mib_debug.c: 427: void MibDebugInit(uint32_t baudrate)
                                    173 ;	-----------------------------------------
                                    174 ;	 function MibDebugInit
                                    175 ;	-----------------------------------------
      0087A6                        176 _MibDebugInit:
      0087A6 52 10            [ 2]  177 	sub	sp, #16
                                    178 ;	./../../mib/stm8s_mib_debug.c: 431: rx_buffer_head = 0;
      0087A8 72 5F 00 41      [ 1]  179 	clr	_rx_buffer_head+0
                                    180 ;	./../../mib/stm8s_mib_debug.c: 432: rx_buffer_tail = 0;
      0087AC 72 5F 00 42      [ 1]  181 	clr	_rx_buffer_tail+0
                                    182 ;	./../../mib/stm8s_mib_debug.c: 465: uint32_t BaudRate = baudrate;
      0087B0 1E 15            [ 2]  183 	ldw	x, (0x15, sp)
      0087B2 16 13            [ 2]  184 	ldw	y, (0x13, sp)
                                    185 ;	./../../mib/stm8s_mib_debug.c: 471: UARTXdebug->CR1 &= (uint8_t)(~UARTX_CR1_M);			 /**< Clear the word length bit */
      0087B4 72 19 52 44      [ 1]  186 	bres	0x5244, #4
                                    187 ;	./../../mib/stm8s_mib_debug.c: 472: UARTXdebug->CR1 |= (uint8_t)UARTX_WORDLENGTH_8D; /**< Set the word length bit according to UART1_WordLength value */
      0087B8 55 52 44 52 44   [ 1]  188 	mov	0x5244, 0x5244
                                    189 ;	./../../mib/stm8s_mib_debug.c: 474: UARTXdebug->CR3 &= (uint8_t)(~UARTX_CR3_STOP); /**< Clear the STOP bits */
      0087BD C6 52 46         [ 1]  190 	ld	a, 0x5246
      0087C0 A4 CF            [ 1]  191 	and	a, #0xcf
      0087C2 C7 52 46         [ 1]  192 	ld	0x5246, a
                                    193 ;	./../../mib/stm8s_mib_debug.c: 475: UARTXdebug->CR3 |= (uint8_t)UARTX_STOPBITS_1;	 /**< Set the STOP bits number according to UART1_StopBits value  */
      0087C5 55 52 46 52 46   [ 1]  194 	mov	0x5246, 0x5246
                                    195 ;	./../../mib/stm8s_mib_debug.c: 477: UARTXdebug->CR1 &= (uint8_t)(~(UARTX_CR1_PCEN | UARTX_CR1_PS)); /**< Clear the Parity Control bit */
      0087CA C6 52 44         [ 1]  196 	ld	a, 0x5244
      0087CD A4 F9            [ 1]  197 	and	a, #0xf9
      0087CF C7 52 44         [ 1]  198 	ld	0x5244, a
                                    199 ;	./../../mib/stm8s_mib_debug.c: 478: UARTXdebug->CR1 |= (uint8_t)UARTX_PARITY_NO;										/**< Set the Parity Control bit to UART1_Parity value */
      0087D2 55 52 44 52 44   [ 1]  200 	mov	0x5244, 0x5244
                                    201 ;	./../../mib/stm8s_mib_debug.c: 480: UARTXdebug->BRR1 &= (uint8_t)(~UARTX_BRR1_DIVM); /**< Clear the LSB mantissa of UARTDIV  */
      0087D7 C6 52 42         [ 1]  202 	ld	a, 0x5242
      0087DA 35 00 52 42      [ 1]  203 	mov	0x5242+0, #0x00
                                    204 ;	./../../mib/stm8s_mib_debug.c: 481: UARTXdebug->BRR2 &= (uint8_t)(~UARTX_BRR2_DIVM); /**< Clear the MSB mantissa of UARTDIV  */
      0087DE C6 52 43         [ 1]  205 	ld	a, 0x5243
      0087E1 A4 0F            [ 1]  206 	and	a, #0x0f
      0087E3 C7 52 43         [ 1]  207 	ld	0x5243, a
                                    208 ;	./../../mib/stm8s_mib_debug.c: 482: UARTXdebug->BRR2 &= (uint8_t)(~UARTX_BRR2_DIVF); /**< Clear the Fraction bits of UARTDIV */
      0087E6 C6 52 43         [ 1]  209 	ld	a, 0x5243
      0087E9 A4 F0            [ 1]  210 	and	a, #0xf0
      0087EB C7 52 43         [ 1]  211 	ld	0x5243, a
                                    212 ;	./../../mib/stm8s_mib_debug.c: 485: BaudRate_Mantissa = ((uint32_t)v_ClkValue / (BaudRate << 4));
      0087EE A6 04            [ 1]  213 	ld	a, #0x04
      0087F0                        214 00103$:
      0087F0 58               [ 2]  215 	sllw	x
      0087F1 90 59            [ 2]  216 	rlcw	y
      0087F3 4A               [ 1]  217 	dec	a
      0087F4 26 FA            [ 1]  218 	jrne	00103$
      0087F6 1F 0F            [ 2]  219 	ldw	(0x0f, sp), x
      0087F8 17 0D            [ 2]  220 	ldw	(0x0d, sp), y
      0087FA 1E 0F            [ 2]  221 	ldw	x, (0x0f, sp)
      0087FC 89               [ 2]  222 	pushw	x
      0087FD 1E 0F            [ 2]  223 	ldw	x, (0x0f, sp)
      0087FF 89               [ 2]  224 	pushw	x
      008800 4B 00            [ 1]  225 	push	#0x00
      008802 4B 24            [ 1]  226 	push	#0x24
      008804 4B F4            [ 1]  227 	push	#0xf4
      008806 4B 00            [ 1]  228 	push	#0x00
      008808 CD A1 88         [ 4]  229 	call	__divulong
      00880B 5B 08            [ 2]  230 	addw	sp, #8
      00880D 1F 03            [ 2]  231 	ldw	(0x03, sp), x
                                    232 ;	./../../mib/stm8s_mib_debug.c: 486: BaudRate_Mantissa100 = (((uint32_t)v_ClkValue * 100) / (BaudRate << 4));
      00880F 90 89            [ 2]  233 	pushw	y
      008811 1E 11            [ 2]  234 	ldw	x, (0x11, sp)
      008813 89               [ 2]  235 	pushw	x
      008814 1E 11            [ 2]  236 	ldw	x, (0x11, sp)
      008816 89               [ 2]  237 	pushw	x
      008817 4B 00            [ 1]  238 	push	#0x00
      008819 4B 10            [ 1]  239 	push	#0x10
      00881B 4B 5E            [ 1]  240 	push	#0x5e
      00881D 4B 5F            [ 1]  241 	push	#0x5f
      00881F CD A1 88         [ 4]  242 	call	__divulong
      008822 5B 08            [ 2]  243 	addw	sp, #8
      008824 17 0F            [ 2]  244 	ldw	(0x0f, sp), y
      008826 90 85            [ 2]  245 	popw	y
      008828 1F 07            [ 2]  246 	ldw	(0x07, sp), x
      00882A 1E 0D            [ 2]  247 	ldw	x, (0x0d, sp)
      00882C 1F 05            [ 2]  248 	ldw	(0x05, sp), x
                                    249 ;	./../../mib/stm8s_mib_debug.c: 488: BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (u8)0x0F); /**< Set the fraction of UARTDIV  */
      00882E 90 89            [ 2]  250 	pushw	y
      008830 1E 05            [ 2]  251 	ldw	x, (0x05, sp)
      008832 89               [ 2]  252 	pushw	x
      008833 90 89            [ 2]  253 	pushw	y
      008835 4B 64            [ 1]  254 	push	#0x64
      008837 5F               [ 1]  255 	clrw	x
      008838 89               [ 2]  256 	pushw	x
      008839 4B 00            [ 1]  257 	push	#0x00
      00883B CD A2 BA         [ 4]  258 	call	__mullong
      00883E 5B 08            [ 2]  259 	addw	sp, #8
      008840 1F 0D            [ 2]  260 	ldw	(0x0d, sp), x
      008842 17 0B            [ 2]  261 	ldw	(0x0b, sp), y
      008844 90 85            [ 2]  262 	popw	y
      008846 1E 07            [ 2]  263 	ldw	x, (0x07, sp)
      008848 72 F0 0B         [ 2]  264 	subw	x, (0x0b, sp)
      00884B 1F 0F            [ 2]  265 	ldw	(0x0f, sp), x
      00884D 7B 06            [ 1]  266 	ld	a, (0x06, sp)
      00884F 12 0A            [ 1]  267 	sbc	a, (0x0a, sp)
      008851 97               [ 1]  268 	ld	xl, a
      008852 7B 05            [ 1]  269 	ld	a, (0x05, sp)
      008854 12 09            [ 1]  270 	sbc	a, (0x09, sp)
      008856 95               [ 1]  271 	ld	xh, a
      008857 1F 0D            [ 2]  272 	ldw	(0x0d, sp), x
      008859 1E 0F            [ 2]  273 	ldw	x, (0x0f, sp)
      00885B A6 04            [ 1]  274 	ld	a, #0x04
      00885D                        275 00105$:
      00885D 58               [ 2]  276 	sllw	x
      00885E 09 0E            [ 1]  277 	rlc	(0x0e, sp)
      008860 09 0D            [ 1]  278 	rlc	(0x0d, sp)
      008862 4A               [ 1]  279 	dec	a
      008863 26 F8            [ 1]  280 	jrne	00105$
      008865 90 89            [ 2]  281 	pushw	y
      008867 4B 64            [ 1]  282 	push	#0x64
      008869 4B 00            [ 1]  283 	push	#0x00
      00886B 4B 00            [ 1]  284 	push	#0x00
      00886D 4B 00            [ 1]  285 	push	#0x00
      00886F 89               [ 2]  286 	pushw	x
      008870 1E 15            [ 2]  287 	ldw	x, (0x15, sp)
      008872 89               [ 2]  288 	pushw	x
      008873 CD A1 88         [ 4]  289 	call	__divulong
      008876 5B 08            [ 2]  290 	addw	sp, #8
      008878 17 0F            [ 2]  291 	ldw	(0x0f, sp), y
      00887A 9F               [ 1]  292 	ld	a, xl
      00887B 90 85            [ 2]  293 	popw	y
      00887D A4 0F            [ 1]  294 	and	a, #0x0f
      00887F 6B 0E            [ 1]  295 	ld	(0x0e, sp), a
                                    296 ;	./../../mib/stm8s_mib_debug.c: 489: BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (u8)0xF0);
      008881 1E 03            [ 2]  297 	ldw	x, (0x03, sp)
      008883 A6 10            [ 1]  298 	ld	a, #0x10
      008885 62               [ 2]  299 	div	x, a
      008886 02               [ 1]  300 	rlwa	x
      008887 6B 0F            [ 1]  301 	ld	(0x0f, sp), a
      008889 01               [ 1]  302 	rrwa	x
      00888A 9F               [ 1]  303 	ld	a, xl
      00888B A4 F0            [ 1]  304 	and	a, #0xf0
                                    305 ;	./../../mib/stm8s_mib_debug.c: 491: UARTXdebug->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
      00888D 1A 0E            [ 1]  306 	or	a, (0x0e, sp)
      00888F C7 52 43         [ 1]  307 	ld	0x5243, a
                                    308 ;	./../../mib/stm8s_mib_debug.c: 492: UARTXdebug->BRR1 = (uint8_t)BaudRate_Mantissa; /**< Set the LSB mantissa of UARTDIV  */
      008892 7B 04            [ 1]  309 	ld	a, (0x04, sp)
      008894 C7 52 42         [ 1]  310 	ld	0x5242, a
                                    311 ;	./../../mib/stm8s_mib_debug.c: 494: UARTXdebug->CR2 &= (uint8_t) ~(UARTX_CR2_TEN | UARTX_CR2_REN);																																		 /**< Disable the Transmitter and Receiver before seting the LBCL, CPOL and CPHA bits */
      008897 C6 52 45         [ 1]  312 	ld	a, 0x5245
      00889A A4 F3            [ 1]  313 	and	a, #0xf3
      00889C C7 52 45         [ 1]  314 	ld	0x5245, a
                                    315 ;	./../../mib/stm8s_mib_debug.c: 495: UARTXdebug->CR3 &= (uint8_t) ~(UARTX_CR3_CPOL | UARTX_CR3_CPHA | UARTX_CR3_LBCL);																									 /**< Clear the Clock Polarity, lock Phase, Last Bit Clock pulse */
      00889F C6 52 46         [ 1]  316 	ld	a, 0x5246
      0088A2 A4 F8            [ 1]  317 	and	a, #0xf8
      0088A4 C7 52 46         [ 1]  318 	ld	0x5246, a
                                    319 ;	./../../mib/stm8s_mib_debug.c: 496: UARTXdebug->CR3 |= (uint8_t)((uint8_t)UARTX_SYNCMODE_CLOCK_DISABLE & (uint8_t)(UARTX_CR3_CPOL | UARTX_CR3_CPHA | UARTX_CR3_LBCL)); /**< Set the Clock Polarity, lock Phase, Last Bit Clock pulse */
      0088A7 55 52 46 52 46   [ 1]  320 	mov	0x5246, 0x5246
                                    321 ;	./../../mib/stm8s_mib_debug.c: 498: UARTXdebug->CR2 |= (uint8_t)UARTX_CR2_TEN;									/**< Set the Transmitter Enable bit */
      0088AC 72 16 52 45      [ 1]  322 	bset	0x5245, #3
                                    323 ;	./../../mib/stm8s_mib_debug.c: 502: UARTXdebug->CR2 |= (uint8_t)UARTX_CR2_REN | UARTX_CR2_RIEN; /**< Set the Receiver Enable bit */
      0088B0 C6 52 45         [ 1]  324 	ld	a, 0x5245
      0088B3 AA 24            [ 1]  325 	or	a, #0x24
      0088B5 C7 52 45         [ 1]  326 	ld	0x5245, a
                                    327 ;	./../../mib/stm8s_mib_debug.c: 510: UARTXdebug->CR3 &= (uint8_t)(~UARTX_CR3_CKEN); /**< Clear the Clock Enable bit */
      0088B8 72 17 52 46      [ 1]  328 	bres	0x5246, #3
                                    329 ;	./../../mib/stm8s_mib_debug.c: 516: UCOM_TXD_GPIO->DDR |= (UCOM_TXD_PIN); /* Set Output mode */
      0088BC 72 1A 50 11      [ 1]  330 	bset	0x5011, #5
                                    331 ;	./../../mib/stm8s_mib_debug.c: 517: UCOM_TXD_GPIO->CR1 |= (UCOM_TXD_PIN);	/* Pull-Up or Push-Pull */
      0088C0 72 1A 50 12      [ 1]  332 	bset	0x5012, #5
                                    333 ;	./../../mib/stm8s_mib_debug.c: 518: UCOM_TXD_GPIO->CR2 |= (UCOM_TXD_PIN);	/* Output speed up to 10 MHz */
      0088C4 72 1A 50 13      [ 1]  334 	bset	0x5013, #5
                                    335 ;	./../../mib/stm8s_mib_debug.c: 519: UCOM_TXD_GPIO->ODR |= (UCOM_TXD_PIN); // high... 
      0088C8 72 1A 50 0F      [ 1]  336 	bset	0x500f, #5
                                    337 ;	./../../mib/stm8s_mib_debug.c: 523: UCOM_RXD_GPIO->DDR &= ~(UCOM_RXD_PIN); // Set input mode 
      0088CC 72 1D 50 11      [ 1]  338 	bres	0x5011, #6
                                    339 ;	./../../mib/stm8s_mib_debug.c: 524: UCOM_RXD_GPIO->CR1 |= (UCOM_RXD_PIN);	 /* Pull-Up or Push-Pull */
      0088D0 72 1C 50 12      [ 1]  340 	bset	0x5012, #6
                                    341 ;	./../../mib/stm8s_mib_debug.c: 525: UCOM_RXD_GPIO->CR2 &= ~(UCOM_RXD_PIN); /*  External interrupt disabled */
      0088D4 C6 50 13         [ 1]  342 	ld	a, 0x5013
      0088D7 A4 BF            [ 1]  343 	and	a, #0xbf
      0088D9 C7 50 13         [ 1]  344 	ld	0x5013, a
                                    345 ;	./../../mib/stm8s_mib_debug.c: 533: }
      0088DC 1E 11            [ 2]  346 	ldw	x, (17, sp)
      0088DE 5B 16            [ 2]  347 	addw	sp, #22
      0088E0 FC               [ 2]  348 	jp	(x)
                                    349 ;	./../../mib/stm8s_mib_debug.c: 539: void MibWriteDebugTransmitHex(uint8_t data)
                                    350 ;	-----------------------------------------
                                    351 ;	 function MibWriteDebugTransmitHex
                                    352 ;	-----------------------------------------
      0088E1                        353 _MibWriteDebugTransmitHex:
      0088E1 88               [ 1]  354 	push	a
      0088E2 6B 01            [ 1]  355 	ld	(0x01, sp), a
                                    356 ;	./../../mib/stm8s_mib_debug.c: 546: MibWriteDebugByte('.');
      0088E4 A6 2E            [ 1]  357 	ld	a, #0x2e
      0088E6 CD 87 4F         [ 4]  358 	call	_MibWriteDebugByte
                                    359 ;	./../../mib/stm8s_mib_debug.c: 547: if (data > 0xd)	MibWriteDebugByte(data);
      0088E9 7B 01            [ 1]  360 	ld	a, (0x01, sp)
      0088EB A1 0D            [ 1]  361 	cp	a, #0x0d
      0088ED 23 05            [ 2]  362 	jrule	00102$
      0088EF 7B 01            [ 1]  363 	ld	a, (0x01, sp)
      0088F1 CD 87 4F         [ 4]  364 	call	_MibWriteDebugByte
      0088F4                        365 00102$:
                                    366 ;	./../../mib/stm8s_mib_debug.c: 548: MibWriteDebugByte('[');
      0088F4 A6 5B            [ 1]  367 	ld	a, #0x5b
      0088F6 CD 87 4F         [ 4]  368 	call	_MibWriteDebugByte
                                    369 ;	./../../mib/stm8s_mib_debug.c: 549: MibWriteDebugByte(g_TableHex[data >> 4]);
      0088F9 7B 01            [ 1]  370 	ld	a, (0x01, sp)
      0088FB 4E               [ 1]  371 	swap	a
      0088FC A4 0F            [ 1]  372 	and	a, #0x0f
      0088FE 5F               [ 1]  373 	clrw	x
      0088FF 97               [ 1]  374 	ld	xl, a
      008900 72 BB 01 49      [ 2]  375 	addw	x, _g_TableHex+0
      008904 F6               [ 1]  376 	ld	a, (x)
      008905 CD 87 4F         [ 4]  377 	call	_MibWriteDebugByte
                                    378 ;	./../../mib/stm8s_mib_debug.c: 550: MibWriteDebugByte(g_TableHex[data & 0xf]);
      008908 7B 01            [ 1]  379 	ld	a, (0x01, sp)
      00890A A4 0F            [ 1]  380 	and	a, #0x0f
      00890C 97               [ 1]  381 	ld	xl, a
      00890D 4F               [ 1]  382 	clr	a
      00890E 95               [ 1]  383 	ld	xh, a
      00890F 72 BB 01 49      [ 2]  384 	addw	x, _g_TableHex+0
      008913 F6               [ 1]  385 	ld	a, (x)
      008914 CD 87 4F         [ 4]  386 	call	_MibWriteDebugByte
                                    387 ;	./../../mib/stm8s_mib_debug.c: 551: MibWriteDebugByte(']');
      008917 A6 5D            [ 1]  388 	ld	a, #0x5d
      008919 CD 87 4F         [ 4]  389 	call	_MibWriteDebugByte
                                    390 ;	./../../mib/stm8s_mib_debug.c: 552: while (!(UARTXdebug->SR & UARTX_SR_TC));
      00891C                        391 00103$:
      00891C 72 0D 52 40 FB   [ 2]  392 	btjf	0x5240, #6, 00103$
                                    393 ;	./../../mib/stm8s_mib_debug.c: 553: UARTXdebug->SR &= ~UARTX_SR_TC;	
      008921 72 1D 52 40      [ 1]  394 	bres	0x5240, #6
                                    395 ;	./../../mib/stm8s_mib_debug.c: 559: }
      008925 84               [ 1]  396 	pop	a
      008926 81               [ 4]  397 	ret
                                    398 ;	./../../mib/stm8s_mib_debug.c: 564: void MibWriteDebugTransmitHex2(uint8_t data)
                                    399 ;	-----------------------------------------
                                    400 ;	 function MibWriteDebugTransmitHex2
                                    401 ;	-----------------------------------------
      008927                        402 _MibWriteDebugTransmitHex2:
      008927 88               [ 1]  403 	push	a
      008928 6B 01            [ 1]  404 	ld	(0x01, sp), a
                                    405 ;	./../../mib/stm8s_mib_debug.c: 571: MibWriteDebugByte('.');
      00892A A6 2E            [ 1]  406 	ld	a, #0x2e
      00892C CD 87 4F         [ 4]  407 	call	_MibWriteDebugByte
                                    408 ;	./../../mib/stm8s_mib_debug.c: 572: MibWriteDebugByte(g_TableHex[data >> 4]);
      00892F 7B 01            [ 1]  409 	ld	a, (0x01, sp)
      008931 4E               [ 1]  410 	swap	a
      008932 A4 0F            [ 1]  411 	and	a, #0x0f
      008934 5F               [ 1]  412 	clrw	x
      008935 97               [ 1]  413 	ld	xl, a
      008936 72 BB 01 49      [ 2]  414 	addw	x, _g_TableHex+0
      00893A F6               [ 1]  415 	ld	a, (x)
      00893B CD 87 4F         [ 4]  416 	call	_MibWriteDebugByte
                                    417 ;	./../../mib/stm8s_mib_debug.c: 573: MibWriteDebugByte(g_TableHex[data & 0xf]);
      00893E 7B 01            [ 1]  418 	ld	a, (0x01, sp)
      008940 A4 0F            [ 1]  419 	and	a, #0x0f
      008942 97               [ 1]  420 	ld	xl, a
      008943 4F               [ 1]  421 	clr	a
      008944 95               [ 1]  422 	ld	xh, a
      008945 72 BB 01 49      [ 2]  423 	addw	x, _g_TableHex+0
      008949 F6               [ 1]  424 	ld	a, (x)
      00894A CD 87 4F         [ 4]  425 	call	_MibWriteDebugByte
                                    426 ;	./../../mib/stm8s_mib_debug.c: 574: while (!(UARTXdebug->SR & UARTX_SR_TC));
      00894D                        427 00101$:
      00894D 72 0D 52 40 FB   [ 2]  428 	btjf	0x5240, #6, 00101$
                                    429 ;	./../../mib/stm8s_mib_debug.c: 575: UARTXdebug->SR &= ~UARTX_SR_TC;
      008952 72 1D 52 40      [ 1]  430 	bres	0x5240, #6
                                    431 ;	./../../mib/stm8s_mib_debug.c: 581: }
      008956 84               [ 1]  432 	pop	a
      008957 81               [ 4]  433 	ret
                                    434 ;	./../../mib/stm8s_mib_debug.c: 587: void UART_RX_IRQHandler(void) /* UART RX */
                                    435 ;	-----------------------------------------
                                    436 ;	 function UART_RX_IRQHandler
                                    437 ;	-----------------------------------------
      008958                        438 _UART_RX_IRQHandler:
                                    439 ;	./../../mib/stm8s_mib_debug.c: 593: if (UARTXdebug->SR & UARTX_SR_RXNE) // RXNE :  ISR.bit5 // UART1_FLAG_RXNE
      008958 72 0B 52 40 22   [ 2]  440 	btjf	0x5240, #5, 00108$
                                    441 ;	./../../mib/stm8s_mib_debug.c: 595: vbCh = (uint8_t)(UARTXdebug->DR);
      00895D C6 52 41         [ 1]  442 	ld	a, 0x5241
      008960 90 97            [ 1]  443 	ld	yl, a
                                    444 ;	./../../mib/stm8s_mib_debug.c: 596: vbIndex = rx_buffer_head + 1;
      008962 C6 00 41         [ 1]  445 	ld	a, _rx_buffer_head+0
      008965 4C               [ 1]  446 	inc	a
                                    447 ;	./../../mib/stm8s_mib_debug.c: 597: if (vbIndex >= RX_BUFFER_SIZE)
      008966 A1 40            [ 1]  448 	cp	a, #0x40
      008968 25 01            [ 1]  449 	jrc	00102$
                                    450 ;	./../../mib/stm8s_mib_debug.c: 598: vbIndex = 0;
      00896A 4F               [ 1]  451 	clr	a
      00896B                        452 00102$:
                                    453 ;	./../../mib/stm8s_mib_debug.c: 599: if (vbIndex != rx_buffer_tail)
      00896B C1 00 42         [ 1]  454 	cp	a, _rx_buffer_tail+0
      00896E 26 01            [ 1]  455 	jrne	00135$
      008970 81               [ 4]  456 	ret
      008971                        457 00135$:
                                    458 ;	./../../mib/stm8s_mib_debug.c: 601: rx_buffer[vbIndex] = vbCh;
      008971 5F               [ 1]  459 	clrw	x
      008972 97               [ 1]  460 	ld	xl, a
      008973 1C 00 01         [ 2]  461 	addw	x, #(_rx_buffer+0)
      008976 88               [ 1]  462 	push	a
      008977 90 9F            [ 1]  463 	ld	a, yl
      008979 F7               [ 1]  464 	ld	(x), a
      00897A 84               [ 1]  465 	pop	a
                                    466 ;	./../../mib/stm8s_mib_debug.c: 602: rx_buffer_head = vbIndex;
      00897B C7 00 41         [ 1]  467 	ld	_rx_buffer_head+0, a
      00897E 81               [ 4]  468 	ret
      00897F                        469 00108$:
                                    470 ;	./../../mib/stm8s_mib_debug.c: 605: else if (UARTXdebug->SR & UARTX_SR_OR) // OE : ISR.bit4 // /*!< OverRun error flag */
      00897F 72 06 52 40 01   [ 2]  471 	btjt	0x5240, #3, 00137$
      008984 81               [ 4]  472 	ret
      008985                        473 00137$:
                                    474 ;	./../../mib/stm8s_mib_debug.c: 607: vbCh = (uint8_t)(UARTXdebug->DR);
      008985 C6 52 41         [ 1]  475 	ld	a, 0x5241
                                    476 ;	./../../mib/stm8s_mib_debug.c: 610: }
      008988 81               [ 4]  477 	ret
                                    478 	.area CODE
                                    479 	.area CONST
                                    480 	.area CONST
      0081A3                        481 ___str_0:
      0081A3 30 31 32 33 34 35 36   482 	.ascii "0123456789ABCDEF"
             37 38 39 41 42 43 44
             45 46
      0081B3 00                     483 	.db 0x00
                                    484 	.area CODE
                                    485 	.area INITIALIZER
      008609                        486 __xinit__g_TableHex:
      008609 81 A3                  487 	.dw ___str_0
                                    488 	.area CABS (ABS)
