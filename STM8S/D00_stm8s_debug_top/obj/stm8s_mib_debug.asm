;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_mib_debug
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UART_RX_IRQHandler
	.globl _MibWriteDebugByte
	.globl _MibWriteDebugByte485
	.globl _MibWriteDebugString
	.globl _MibWriteDebugStringN
	.globl _MibReadDebugByte
	.globl _MibDebugInit
	.globl _MibWriteDebugTransmitHex
	.globl _MibWriteDebugTransmitHex2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_rx_buffer:
	.ds 64
_rx_buffer_head:
	.ds 1
_rx_buffer_tail:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_g_TableHex:
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	./../../mib/stm8s_mib_debug.c: 206: void MibWriteDebugByte(uint8_t ch)
;	-----------------------------------------
;	 function MibWriteDebugByte
;	-----------------------------------------
_MibWriteDebugByte:
	push	a
	ld	(0x01, sp), a
;	./../../mib/stm8s_mib_debug.c: 227: while (!(UARTXdebug->SR & UARTX_SR_TXE));
00101$:
	ld	a, 0x5240
	jrpl	00101$
;	./../../mib/stm8s_mib_debug.c: 228: UARTXdebug->DR = ch;
	ldw	x, #0x5241
	ld	a, (0x01, sp)
	ld	(x), a
;	./../../mib/stm8s_mib_debug.c: 231: }
	pop	a
	ret
;	./../../mib/stm8s_mib_debug.c: 240: void MibWriteDebugByte485(uint8_t ch)
;	-----------------------------------------
;	 function MibWriteDebugByte485
;	-----------------------------------------
_MibWriteDebugByte485:
;	./../../mib/stm8s_mib_debug.c: 248: MibWriteDebugByte(ch);
;	./../../mib/stm8s_mib_debug.c: 257: }
	jp	_MibWriteDebugByte
;	./../../mib/stm8s_mib_debug.c: 266: void MibWriteDebugString(uint8_t *v_pStr)
;	-----------------------------------------
;	 function MibWriteDebugString
;	-----------------------------------------
_MibWriteDebugString:
;	./../../mib/stm8s_mib_debug.c: 273: while (*v_pStr)
00101$:
	ld	a, (x)
	jrne	00117$
	ret
00117$:
;	./../../mib/stm8s_mib_debug.c: 275: MibWriteDebugByte(*v_pStr++);
	incw	x
	pushw	x
	call	_MibWriteDebugByte
	popw	x
	jra	00101$
;	./../../mib/stm8s_mib_debug.c: 284: }
	ret
;	./../../mib/stm8s_mib_debug.c: 293: void MibWriteDebugStringN(uint8_t *v_pStr, uint8_t nSize)
;	-----------------------------------------
;	 function MibWriteDebugStringN
;	-----------------------------------------
_MibWriteDebugStringN:
	push	a
	ld	(0x01, sp), a
;	./../../mib/stm8s_mib_debug.c: 300: while (1)
00104$:
;	./../../mib/stm8s_mib_debug.c: 302: if (nSize == 0)	break;		
	tnz	(0x01, sp)
	jreq	00106$
;	./../../mib/stm8s_mib_debug.c: 303: MibWriteDebugByte(*v_pStr++);
	ld	a, (x)
	incw	x
	pushw	x
	call	_MibWriteDebugByte
	popw	x
;	./../../mib/stm8s_mib_debug.c: 304: nSize--;
	dec	(0x01, sp)
	jra	00104$
00106$:
;	./../../mib/stm8s_mib_debug.c: 313: }
	pop	a
	ret
;	./../../mib/stm8s_mib_debug.c: 322: uint16_t MibReadDebugByte( void )
;	-----------------------------------------
;	 function MibReadDebugByte
;	-----------------------------------------
_MibReadDebugByte:
;	./../../mib/stm8s_mib_debug.c: 329: if (rx_buffer_head == rx_buffer_tail) // wait for character
	ld	a, _rx_buffer_tail+0
	cp	a, _rx_buffer_head+0
	jrne	00102$
;	./../../mib/stm8s_mib_debug.c: 331: return MIB_DEBUG_READ_NODATA; // no data
	clrw	x
	decw	x
	ret
00102$:
;	./../../mib/stm8s_mib_debug.c: 333: vbIndex = rx_buffer_tail + 1;
	ld	a, _rx_buffer_tail+0
	inc	a
;	./../../mib/stm8s_mib_debug.c: 334: if (vbIndex >= RX_BUFFER_SIZE) vbIndex = 0;
	cp	a, #0x40
	jrc	00104$
	clr	a
00104$:
;	./../../mib/stm8s_mib_debug.c: 335: vbCh = rx_buffer[vbIndex];
	clrw	x
	ld	xl, a
	addw	x, #(_rx_buffer+0)
	push	a
	ld	a, (x)
	ld	xl, a
	pop	a
;	./../../mib/stm8s_mib_debug.c: 336: rx_buffer_tail = vbIndex;
	ld	_rx_buffer_tail+0, a
;	./../../mib/stm8s_mib_debug.c: 337: return (uint16_t)vbCh;
	clr	a
	ld	xh, a
;	./../../mib/stm8s_mib_debug.c: 352: }
	ret
;	./../../mib/stm8s_mib_debug.c: 427: void MibDebugInit(uint32_t baudrate)
;	-----------------------------------------
;	 function MibDebugInit
;	-----------------------------------------
_MibDebugInit:
	sub	sp, #16
;	./../../mib/stm8s_mib_debug.c: 431: rx_buffer_head = 0;
	clr	_rx_buffer_head+0
;	./../../mib/stm8s_mib_debug.c: 432: rx_buffer_tail = 0;
	clr	_rx_buffer_tail+0
;	./../../mib/stm8s_mib_debug.c: 465: uint32_t BaudRate = baudrate;
	ldw	x, (0x15, sp)
	ldw	y, (0x13, sp)
;	./../../mib/stm8s_mib_debug.c: 471: UARTXdebug->CR1 &= (uint8_t)(~UARTX_CR1_M);			 /**< Clear the word length bit */
	bres	0x5244, #4
;	./../../mib/stm8s_mib_debug.c: 472: UARTXdebug->CR1 |= (uint8_t)UARTX_WORDLENGTH_8D; /**< Set the word length bit according to UART1_WordLength value */
	mov	0x5244, 0x5244
;	./../../mib/stm8s_mib_debug.c: 474: UARTXdebug->CR3 &= (uint8_t)(~UARTX_CR3_STOP); /**< Clear the STOP bits */
	ld	a, 0x5246
	and	a, #0xcf
	ld	0x5246, a
;	./../../mib/stm8s_mib_debug.c: 475: UARTXdebug->CR3 |= (uint8_t)UARTX_STOPBITS_1;	 /**< Set the STOP bits number according to UART1_StopBits value  */
	mov	0x5246, 0x5246
;	./../../mib/stm8s_mib_debug.c: 477: UARTXdebug->CR1 &= (uint8_t)(~(UARTX_CR1_PCEN | UARTX_CR1_PS)); /**< Clear the Parity Control bit */
	ld	a, 0x5244
	and	a, #0xf9
	ld	0x5244, a
;	./../../mib/stm8s_mib_debug.c: 478: UARTXdebug->CR1 |= (uint8_t)UARTX_PARITY_NO;										/**< Set the Parity Control bit to UART1_Parity value */
	mov	0x5244, 0x5244
;	./../../mib/stm8s_mib_debug.c: 480: UARTXdebug->BRR1 &= (uint8_t)(~UARTX_BRR1_DIVM); /**< Clear the LSB mantissa of UARTDIV  */
	ld	a, 0x5242
	mov	0x5242+0, #0x00
;	./../../mib/stm8s_mib_debug.c: 481: UARTXdebug->BRR2 &= (uint8_t)(~UARTX_BRR2_DIVM); /**< Clear the MSB mantissa of UARTDIV  */
	ld	a, 0x5243
	and	a, #0x0f
	ld	0x5243, a
;	./../../mib/stm8s_mib_debug.c: 482: UARTXdebug->BRR2 &= (uint8_t)(~UARTX_BRR2_DIVF); /**< Clear the Fraction bits of UARTDIV */
	ld	a, 0x5243
	and	a, #0xf0
	ld	0x5243, a
;	./../../mib/stm8s_mib_debug.c: 485: BaudRate_Mantissa = ((uint32_t)v_ClkValue / (BaudRate << 4));
	ld	a, #0x04
00103$:
	sllw	x
	rlcw	y
	dec	a
	jrne	00103$
	ldw	(0x0f, sp), x
	ldw	(0x0d, sp), y
	ldw	x, (0x0f, sp)
	pushw	x
	ldw	x, (0x0f, sp)
	pushw	x
	push	#0x00
	push	#0x24
	push	#0xf4
	push	#0x00
	call	__divulong
	addw	sp, #8
	ldw	(0x03, sp), x
;	./../../mib/stm8s_mib_debug.c: 486: BaudRate_Mantissa100 = (((uint32_t)v_ClkValue * 100) / (BaudRate << 4));
	pushw	y
	ldw	x, (0x11, sp)
	pushw	x
	ldw	x, (0x11, sp)
	pushw	x
	push	#0x00
	push	#0x10
	push	#0x5e
	push	#0x5f
	call	__divulong
	addw	sp, #8
	ldw	(0x0f, sp), y
	popw	y
	ldw	(0x07, sp), x
	ldw	x, (0x0d, sp)
	ldw	(0x05, sp), x
;	./../../mib/stm8s_mib_debug.c: 488: BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (u8)0x0F); /**< Set the fraction of UARTDIV  */
	pushw	y
	ldw	x, (0x05, sp)
	pushw	x
	pushw	y
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x0d, sp), x
	ldw	(0x0b, sp), y
	popw	y
	ldw	x, (0x07, sp)
	subw	x, (0x0b, sp)
	ldw	(0x0f, sp), x
	ld	a, (0x06, sp)
	sbc	a, (0x0a, sp)
	ld	xl, a
	ld	a, (0x05, sp)
	sbc	a, (0x09, sp)
	ld	xh, a
	ldw	(0x0d, sp), x
	ldw	x, (0x0f, sp)
	ld	a, #0x04
00105$:
	sllw	x
	rlc	(0x0e, sp)
	rlc	(0x0d, sp)
	dec	a
	jrne	00105$
	pushw	y
	push	#0x64
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	ldw	x, (0x15, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x0f, sp), y
	ld	a, xl
	popw	y
	and	a, #0x0f
	ld	(0x0e, sp), a
;	./../../mib/stm8s_mib_debug.c: 489: BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (u8)0xF0);
	ldw	x, (0x03, sp)
	ld	a, #0x10
	div	x, a
	rlwa	x
	ld	(0x0f, sp), a
	rrwa	x
	ld	a, xl
	and	a, #0xf0
;	./../../mib/stm8s_mib_debug.c: 491: UARTXdebug->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
	or	a, (0x0e, sp)
	ld	0x5243, a
;	./../../mib/stm8s_mib_debug.c: 492: UARTXdebug->BRR1 = (uint8_t)BaudRate_Mantissa; /**< Set the LSB mantissa of UARTDIV  */
	ld	a, (0x04, sp)
	ld	0x5242, a
;	./../../mib/stm8s_mib_debug.c: 494: UARTXdebug->CR2 &= (uint8_t) ~(UARTX_CR2_TEN | UARTX_CR2_REN);																																		 /**< Disable the Transmitter and Receiver before seting the LBCL, CPOL and CPHA bits */
	ld	a, 0x5245
	and	a, #0xf3
	ld	0x5245, a
;	./../../mib/stm8s_mib_debug.c: 495: UARTXdebug->CR3 &= (uint8_t) ~(UARTX_CR3_CPOL | UARTX_CR3_CPHA | UARTX_CR3_LBCL);																									 /**< Clear the Clock Polarity, lock Phase, Last Bit Clock pulse */
	ld	a, 0x5246
	and	a, #0xf8
	ld	0x5246, a
;	./../../mib/stm8s_mib_debug.c: 496: UARTXdebug->CR3 |= (uint8_t)((uint8_t)UARTX_SYNCMODE_CLOCK_DISABLE & (uint8_t)(UARTX_CR3_CPOL | UARTX_CR3_CPHA | UARTX_CR3_LBCL)); /**< Set the Clock Polarity, lock Phase, Last Bit Clock pulse */
	mov	0x5246, 0x5246
;	./../../mib/stm8s_mib_debug.c: 498: UARTXdebug->CR2 |= (uint8_t)UARTX_CR2_TEN;									/**< Set the Transmitter Enable bit */
	bset	0x5245, #3
;	./../../mib/stm8s_mib_debug.c: 502: UARTXdebug->CR2 |= (uint8_t)UARTX_CR2_REN | UARTX_CR2_RIEN; /**< Set the Receiver Enable bit */
	ld	a, 0x5245
	or	a, #0x24
	ld	0x5245, a
;	./../../mib/stm8s_mib_debug.c: 510: UARTXdebug->CR3 &= (uint8_t)(~UARTX_CR3_CKEN); /**< Clear the Clock Enable bit */
	bres	0x5246, #3
;	./../../mib/stm8s_mib_debug.c: 516: UCOM_TXD_GPIO->DDR |= (UCOM_TXD_PIN); /* Set Output mode */
	bset	0x5011, #5
;	./../../mib/stm8s_mib_debug.c: 517: UCOM_TXD_GPIO->CR1 |= (UCOM_TXD_PIN);	/* Pull-Up or Push-Pull */
	bset	0x5012, #5
;	./../../mib/stm8s_mib_debug.c: 518: UCOM_TXD_GPIO->CR2 |= (UCOM_TXD_PIN);	/* Output speed up to 10 MHz */
	bset	0x5013, #5
;	./../../mib/stm8s_mib_debug.c: 519: UCOM_TXD_GPIO->ODR |= (UCOM_TXD_PIN); // high... 
	bset	0x500f, #5
;	./../../mib/stm8s_mib_debug.c: 523: UCOM_RXD_GPIO->DDR &= ~(UCOM_RXD_PIN); // Set input mode 
	bres	0x5011, #6
;	./../../mib/stm8s_mib_debug.c: 524: UCOM_RXD_GPIO->CR1 |= (UCOM_RXD_PIN);	 /* Pull-Up or Push-Pull */
	bset	0x5012, #6
;	./../../mib/stm8s_mib_debug.c: 525: UCOM_RXD_GPIO->CR2 &= ~(UCOM_RXD_PIN); /*  External interrupt disabled */
	ld	a, 0x5013
	and	a, #0xbf
	ld	0x5013, a
;	./../../mib/stm8s_mib_debug.c: 533: }
	ldw	x, (17, sp)
	addw	sp, #22
	jp	(x)
;	./../../mib/stm8s_mib_debug.c: 539: void MibWriteDebugTransmitHex(uint8_t data)
;	-----------------------------------------
;	 function MibWriteDebugTransmitHex
;	-----------------------------------------
_MibWriteDebugTransmitHex:
	push	a
	ld	(0x01, sp), a
;	./../../mib/stm8s_mib_debug.c: 546: MibWriteDebugByte('.');
	ld	a, #0x2e
	call	_MibWriteDebugByte
;	./../../mib/stm8s_mib_debug.c: 547: if (data > 0xd)	MibWriteDebugByte(data);
	ld	a, (0x01, sp)
	cp	a, #0x0d
	jrule	00102$
	ld	a, (0x01, sp)
	call	_MibWriteDebugByte
00102$:
;	./../../mib/stm8s_mib_debug.c: 548: MibWriteDebugByte('[');
	ld	a, #0x5b
	call	_MibWriteDebugByte
;	./../../mib/stm8s_mib_debug.c: 549: MibWriteDebugByte(g_TableHex[data >> 4]);
	ld	a, (0x01, sp)
	swap	a
	and	a, #0x0f
	clrw	x
	ld	xl, a
	addw	x, _g_TableHex+0
	ld	a, (x)
	call	_MibWriteDebugByte
;	./../../mib/stm8s_mib_debug.c: 550: MibWriteDebugByte(g_TableHex[data & 0xf]);
	ld	a, (0x01, sp)
	and	a, #0x0f
	ld	xl, a
	clr	a
	ld	xh, a
	addw	x, _g_TableHex+0
	ld	a, (x)
	call	_MibWriteDebugByte
;	./../../mib/stm8s_mib_debug.c: 551: MibWriteDebugByte(']');
	ld	a, #0x5d
	call	_MibWriteDebugByte
;	./../../mib/stm8s_mib_debug.c: 552: while (!(UARTXdebug->SR & UARTX_SR_TC));
00103$:
	btjf	0x5240, #6, 00103$
;	./../../mib/stm8s_mib_debug.c: 553: UARTXdebug->SR &= ~UARTX_SR_TC;	
	bres	0x5240, #6
;	./../../mib/stm8s_mib_debug.c: 559: }
	pop	a
	ret
;	./../../mib/stm8s_mib_debug.c: 564: void MibWriteDebugTransmitHex2(uint8_t data)
;	-----------------------------------------
;	 function MibWriteDebugTransmitHex2
;	-----------------------------------------
_MibWriteDebugTransmitHex2:
	push	a
	ld	(0x01, sp), a
;	./../../mib/stm8s_mib_debug.c: 571: MibWriteDebugByte('.');
	ld	a, #0x2e
	call	_MibWriteDebugByte
;	./../../mib/stm8s_mib_debug.c: 572: MibWriteDebugByte(g_TableHex[data >> 4]);
	ld	a, (0x01, sp)
	swap	a
	and	a, #0x0f
	clrw	x
	ld	xl, a
	addw	x, _g_TableHex+0
	ld	a, (x)
	call	_MibWriteDebugByte
;	./../../mib/stm8s_mib_debug.c: 573: MibWriteDebugByte(g_TableHex[data & 0xf]);
	ld	a, (0x01, sp)
	and	a, #0x0f
	ld	xl, a
	clr	a
	ld	xh, a
	addw	x, _g_TableHex+0
	ld	a, (x)
	call	_MibWriteDebugByte
;	./../../mib/stm8s_mib_debug.c: 574: while (!(UARTXdebug->SR & UARTX_SR_TC));
00101$:
	btjf	0x5240, #6, 00101$
;	./../../mib/stm8s_mib_debug.c: 575: UARTXdebug->SR &= ~UARTX_SR_TC;
	bres	0x5240, #6
;	./../../mib/stm8s_mib_debug.c: 581: }
	pop	a
	ret
;	./../../mib/stm8s_mib_debug.c: 587: void UART_RX_IRQHandler(void) /* UART RX */
;	-----------------------------------------
;	 function UART_RX_IRQHandler
;	-----------------------------------------
_UART_RX_IRQHandler:
;	./../../mib/stm8s_mib_debug.c: 593: if (UARTXdebug->SR & UARTX_SR_RXNE) // RXNE :  ISR.bit5 // UART1_FLAG_RXNE
	btjf	0x5240, #5, 00108$
;	./../../mib/stm8s_mib_debug.c: 595: vbCh = (uint8_t)(UARTXdebug->DR);
	ld	a, 0x5241
	ld	yl, a
;	./../../mib/stm8s_mib_debug.c: 596: vbIndex = rx_buffer_head + 1;
	ld	a, _rx_buffer_head+0
	inc	a
;	./../../mib/stm8s_mib_debug.c: 597: if (vbIndex >= RX_BUFFER_SIZE)
	cp	a, #0x40
	jrc	00102$
;	./../../mib/stm8s_mib_debug.c: 598: vbIndex = 0;
	clr	a
00102$:
;	./../../mib/stm8s_mib_debug.c: 599: if (vbIndex != rx_buffer_tail)
	cp	a, _rx_buffer_tail+0
	jrne	00135$
	ret
00135$:
;	./../../mib/stm8s_mib_debug.c: 601: rx_buffer[vbIndex] = vbCh;
	clrw	x
	ld	xl, a
	addw	x, #(_rx_buffer+0)
	push	a
	ld	a, yl
	ld	(x), a
	pop	a
;	./../../mib/stm8s_mib_debug.c: 602: rx_buffer_head = vbIndex;
	ld	_rx_buffer_head+0, a
	ret
00108$:
;	./../../mib/stm8s_mib_debug.c: 605: else if (UARTXdebug->SR & UARTX_SR_OR) // OE : ISR.bit4 // /*!< OverRun error flag */
	btjt	0x5240, #3, 00137$
	ret
00137$:
;	./../../mib/stm8s_mib_debug.c: 607: vbCh = (uint8_t)(UARTXdebug->DR);
	ld	a, 0x5241
;	./../../mib/stm8s_mib_debug.c: 610: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "0123456789ABCDEF"
	.db 0x00
	.area CODE
	.area INITIALIZER
__xinit__g_TableHex:
	.dw ___str_0
	.area CABS (ABS)
