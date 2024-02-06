;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_mib_vsprintf
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _mib_printf
	.globl _MibWriteDebugByte
	.globl _mib_vsprintf
	.globl _mm_vsprintf
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_digits:
	.ds 2
_upper_digits:
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
;	./../../mib/stm8s_mib_vsprintf.c: 71: static size_t strnlen(const char *s, size_t count)
;	-----------------------------------------
;	 function strnlen
;	-----------------------------------------
_strnlen:
	sub	sp, #6
	ldw	(0x03, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 74: for (sc = s; *sc != '\0' && count--; ++sc);
	ldw	y, (0x09, sp)
	ldw	(0x05, sp), y
	ldw	x, (0x03, sp)
00104$:
	ld	a, (x)
	jreq	00101$
	ldw	y, (0x05, sp)
	ldw	(0x01, sp), y
	ldw	y, (0x05, sp)
	decw	y
	ldw	(0x05, sp), y
	ldw	y, (0x01, sp)
	jreq	00101$
	incw	x
	jra	00104$
00101$:
;	./../../mib/stm8s_mib_vsprintf.c: 75: return sc - s;
	subw	x, (0x03, sp)
;	./../../mib/stm8s_mib_vsprintf.c: 76: }
	addw	sp, #6
	popw	y
	addw	sp, #2
	jp	(y)
;	./../../mib/stm8s_mib_vsprintf.c: 81: static MMINT skip_atoi(const char **s)
;	-----------------------------------------
;	 function skip_atoi
;	-----------------------------------------
_skip_atoi:
	sub	sp, #8
	ldw	(0x07, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 83: MMINT i = 0;
	clrw	x
	ldw	(0x05, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 84: while (is_digit(**s)) i = i*10 + *((*s)++) - '0';
00102$:
	ldw	y, (0x07, sp)
	ldw	y, (y)
	ldw	(0x01, sp), y
	ld	a, (y)
	cp	a, #0x30
	jrc	00104$
	cp	a, #0x39
	jrugt	00104$
	ldw	y, (0x05, sp)
	pushw	y
	pushw	x
	push	#0x0a
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x05, sp), x
	ldw	(0x03, sp), y
	ldw	x, (0x01, sp)
	incw	x
	ldw	y, (0x07, sp)
	ldw	(y), x
	ldw	x, (0x01, sp)
	ld	a, (x)
	clrw	y
	clrw	x
	tnzw	y
	jrpl	00124$
	decw	x
00124$:
	ld	yl, a
	addw	y, (0x05, sp)
	ld	a, xl
	adc	a, (0x04, sp)
	rlwa	x
	adc	a, (0x03, sp)
	ld	xh, a
	subw	y, #0x0030
	ldw	(0x05, sp), y
	jrnc	00102$
	decw	x
	jra	00102$
00104$:
;	./../../mib/stm8s_mib_vsprintf.c: 85: return i;
	exgw	x, y
	ldw	x, (0x05, sp)
;	./../../mib/stm8s_mib_vsprintf.c: 86: }
	addw	sp, #8
	ret
;	./../../mib/stm8s_mib_vsprintf.c: 91: static char *number(char *str, MMLONG num, MMINT base, MMINT size, MMINT precision, MMINT type)
;	-----------------------------------------
;	 function number
;	-----------------------------------------
_number:
	sub	sp, #98
	ldw	(0x5d, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 94: char *dig = digits;
	ldw	x, _digits+0
	ldw	(0x43, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 97: if (type & LARGE)  dig = upper_digits;
	ld	a, (0x78, sp)
	bcp	a, #0x40
	jreq	00102$
	ldw	x, _upper_digits+0
	ldw	(0x43, sp), x
00102$:
;	./../../mib/stm8s_mib_vsprintf.c: 98: if (type & LEFT) type &= ~ZEROPAD;
	ld	a, (0x78, sp)
	bcp	a, #0x10
	jreq	00104$
	ldw	x, (0x77, sp)
	srlw	x
	sllw	x
	ldw	y, (0x75, sp)
	ldw	(0x77, sp), x
	ldw	(0x75, sp), y
00104$:
;	./../../mib/stm8s_mib_vsprintf.c: 99: if (base < 2 || base > 36) return 0;
	ldw	x, (0x6b, sp)
	cpw	x, #0x0002
	ld	a, (0x6a, sp)
	sbc	a, #0x00
	ld	a, (0x69, sp)
	sbc	a, #0x00
	jrslt	00105$
	ldw	x, #0x0024
	cpw	x, (0x6b, sp)
	clr	a
	sbc	a, (0x6a, sp)
	clr	a
	sbc	a, (0x69, sp)
	jrsge	00106$
00105$:
	clrw	x
	jp	00161$
00106$:
;	./../../mib/stm8s_mib_vsprintf.c: 101: c = (type & ZEROPAD) ? '0' : ' ';
	ld	a, (0x78, sp)
	srl	a
	jrnc	00163$
	ld	a, #0x30
	.byte 0xc5
00163$:
	ld	a, #0x20
00164$:
	ld	(0x45, sp), a
;	./../../mib/stm8s_mib_vsprintf.c: 102: sign = 0;
	clr	(0x46, sp)
;	./../../mib/stm8s_mib_vsprintf.c: 103: if (type & SIGN)
	ld	a, (0x78, sp)
	bcp	a, #0x02
	jreq	00117$
;	./../../mib/stm8s_mib_vsprintf.c: 109: size--;
	ldw	y, (0x6f, sp)
	subw	y, #0x0001
	ldw	x, (0x6d, sp)
	jrnc	00330$
	decw	x
00330$:
	ldw	(0x57, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 105: if (num < 0)
	tnz	(0x65, sp)
	jrpl	00114$
;	./../../mib/stm8s_mib_vsprintf.c: 107: sign = '-';
	ld	a, #0x2d
	ld	(0x46, sp), a
;	./../../mib/stm8s_mib_vsprintf.c: 108: num = -num;
	ldw	x, (0x67, sp)
	negw	x
	clr	a
	sbc	a, (0x66, sp)
	ld	(0x60, sp), a
	clr	a
	sbc	a, (0x65, sp)
	ldw	(0x67, sp), x
	ld	(0x65, sp), a
	ld	a, (0x60, sp)
	ld	(0x66, sp), a
;	./../../mib/stm8s_mib_vsprintf.c: 109: size--;
	ldw	(0x6f, sp), y
	ldw	y, (0x57, sp)
	ldw	(0x6d, sp), y
	jra	00117$
00114$:
;	./../../mib/stm8s_mib_vsprintf.c: 111: else if (type & PLUS)
	ld	a, (0x78, sp)
	bcp	a, #0x04
	jreq	00111$
;	./../../mib/stm8s_mib_vsprintf.c: 113: sign = '+';
	ld	a, #0x2b
	ld	(0x46, sp), a
;	./../../mib/stm8s_mib_vsprintf.c: 114: size--;
	ldw	(0x6f, sp), y
	ldw	y, (0x57, sp)
	ldw	(0x6d, sp), y
	jra	00117$
00111$:
;	./../../mib/stm8s_mib_vsprintf.c: 116: else if (type & SPACE)
	ld	a, (0x78, sp)
	bcp	a, #0x08
	jreq	00117$
;	./../../mib/stm8s_mib_vsprintf.c: 118: sign = ' ';
	ld	a, #0x20
	ld	(0x46, sp), a
;	./../../mib/stm8s_mib_vsprintf.c: 119: size--;
	ldw	(0x6f, sp), y
	ldw	y, (0x57, sp)
	ldw	(0x6d, sp), y
00117$:
;	./../../mib/stm8s_mib_vsprintf.c: 123: if (type & SPECIAL)
	ld	a, (0x78, sp)
	and	a, #0x20
	ld	(0x4a, sp), a
	clrw	x
	ldw	(0x48, sp), x
	clr	(0x47, sp)
;	./../../mib/stm8s_mib_vsprintf.c: 125: if (base == 16)
	ldw	x, (0x6b, sp)
	cpw	x, #0x0010
	jrne	00335$
	ldw	x, (0x69, sp)
	jrne	00335$
	ld	a, #0x01
	ld	(0x4b, sp), a
	.byte 0xc5
00335$:
	clr	(0x4b, sp)
00336$:
;	./../../mib/stm8s_mib_vsprintf.c: 127: else if (base == 8)
	ldw	x, (0x6b, sp)
	cpw	x, #0x0008
	jrne	00338$
	ldw	x, (0x69, sp)
	jrne	00338$
	ld	a, #0x01
	ld	(0x4c, sp), a
	.byte 0xc5
00338$:
	clr	(0x4c, sp)
00339$:
;	./../../mib/stm8s_mib_vsprintf.c: 123: if (type & SPECIAL)
	ldw	x, (0x49, sp)
	jrne	00340$
	ldw	x, (0x47, sp)
	jreq	00124$
00340$:
;	./../../mib/stm8s_mib_vsprintf.c: 125: if (base == 16)
	tnz	(0x4b, sp)
	jreq	00121$
;	./../../mib/stm8s_mib_vsprintf.c: 126: size -= 2;
	ldw	x, (0x6f, sp)
	subw	x, #0x0002
	ldw	y, (0x6d, sp)
	jrnc	00342$
	decw	y
00342$:
	ldw	(0x6f, sp), x
	ldw	(0x6d, sp), y
	jra	00124$
00121$:
;	./../../mib/stm8s_mib_vsprintf.c: 127: else if (base == 8)
	tnz	(0x4c, sp)
	jreq	00124$
;	./../../mib/stm8s_mib_vsprintf.c: 128: size--;
	ldw	x, (0x6f, sp)
	subw	x, #0x0001
	ldw	y, (0x6d, sp)
	jrnc	00344$
	decw	y
00344$:
	ldw	(0x6f, sp), x
	ldw	(0x6d, sp), y
00124$:
;	./../../mib/stm8s_mib_vsprintf.c: 133: if (num == 0)
	ldw	x, (0x67, sp)
	jrne	00178$
;	./../../mib/stm8s_mib_vsprintf.c: 134: tmp[i++] = '0';
	ldw	x, (0x65, sp)
	jrne	00178$
	incw	x
	ldw	(0x59, sp), x
	clrw	x
	ldw	(0x57, sp), x
	ld	a, #0x30
	ld	(0x01, sp), a
	jra	00130$
;	./../../mib/stm8s_mib_vsprintf.c: 137: while (num != 0)
00178$:
	clrw	x
	ldw	(0x61, sp), x
	ldw	(0x5f, sp), x
00125$:
	ldw	x, (0x67, sp)
	jrne	00347$
	ldw	x, (0x65, sp)
	jreq	00194$
00347$:
;	./../../mib/stm8s_mib_vsprintf.c: 139: tmp[i++] = dig[((MMULONG) num) % (MMUSIGN) base];
	ldw	y, (0x61, sp)
	ldw	(0x59, sp), y
	ldw	y, (0x5f, sp)
	ldw	(0x57, sp), y
	ldw	x, (0x61, sp)
	incw	x
	ldw	(0x61, sp), x
	jrne	00348$
	ldw	x, (0x5f, sp)
	incw	x
	ldw	(0x5f, sp), x
00348$:
	ldw	x, sp
	incw	x
	addw	x, (0x59, sp)
	ldw	(0x4d, sp), x
	ldw	y, (0x65, sp)
	ldw	(0x4f, sp), y
	ldw	y, (0x67, sp)
	ldw	x, (0x6b, sp)
	ldw	(0x55, sp), x
	clrw	x
	ldw	(0x53, sp), x
	pushw	y
	ldw	x, (0x57, sp)
	pushw	x
	ldw	x, (0x57, sp)
	pushw	x
	pushw	y
	ldw	x, (0x57, sp)
	pushw	x
	call	__modulong
	addw	sp, #8
	ldw	(0x59, sp), y
	popw	y
	addw	x, (0x43, sp)
	ld	a, (x)
	ldw	x, (0x4d, sp)
	ld	(x), a
;	./../../mib/stm8s_mib_vsprintf.c: 140: num = ((MMULONG) num) / (MMUSIGN) base;
	ldw	x, (0x55, sp)
	pushw	x
	ldw	x, (0x55, sp)
	pushw	x
	pushw	y
	ldw	x, (0x55, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x67, sp), x
	ldw	(0x65, sp), y
	jra	00125$
00194$:
	ldw	y, (0x61, sp)
	ldw	(0x59, sp), y
	ldw	y, (0x5f, sp)
	ldw	(0x57, sp), y
00130$:
;	./../../mib/stm8s_mib_vsprintf.c: 144: if (i > precision) precision = i;
	ldw	x, (0x73, sp)
	cpw	x, (0x59, sp)
	ld	a, (0x72, sp)
	sbc	a, (0x58, sp)
	ld	a, (0x71, sp)
	sbc	a, (0x57, sp)
	jrsge	00132$
	ldw	y, (0x59, sp)
	ldw	(0x73, sp), y
	ldw	y, (0x57, sp)
	ldw	(0x71, sp), y
00132$:
;	./../../mib/stm8s_mib_vsprintf.c: 145: size -= precision;
	ldw	y, (0x6f, sp)
	subw	y, (0x73, sp)
	ld	a, (0x6e, sp)
	sbc	a, (0x72, sp)
	ld	xl, a
	ld	a, (0x6d, sp)
	sbc	a, (0x71, sp)
	ld	xh, a
	ldw	(0x6f, sp), y
	ldw	(0x6d, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 146: if (!(type & (ZEROPAD | LEFT))) while (size-- > 0) *str++ = ' ';
	ld	a, (0x78, sp)
	bcp	a, #0x11
	jrne	00137$
	ldw	y, (0x6f, sp)
	ldw	(0x61, sp), y
	ldw	y, (0x6d, sp)
00133$:
	ldw	(0x53, sp), y
	ldw	x, (0x61, sp)
	ldw	(0x55, sp), x
	ldw	x, (0x61, sp)
	subw	x, #0x0001
	ldw	(0x61, sp), x
	jrnc	00351$
	decw	y
00351$:
	clrw	x
	cpw	x, (0x55, sp)
	clr	a
	sbc	a, (0x54, sp)
	clr	a
	sbc	a, (0x53, sp)
	jrsge	00195$
	ldw	x, (0x5d, sp)
	ld	a, #0x20
	ld	(x), a
	ldw	x, (0x5d, sp)
	incw	x
	ldw	(0x5d, sp), x
	jra	00133$
00195$:
	ldw	(0x6d, sp), y
	ldw	y, (0x61, sp)
	ldw	(0x6f, sp), y
00137$:
;	./../../mib/stm8s_mib_vsprintf.c: 147: if (sign) *str++ = sign;
	tnz	(0x46, sp)
	jreq	00139$
	ldw	x, (0x5d, sp)
	ld	a, (0x46, sp)
	ld	(x), a
	ldw	x, (0x5d, sp)
	incw	x
	ldw	(0x5d, sp), x
00139$:
;	./../../mib/stm8s_mib_vsprintf.c: 149: if (type & SPECIAL)
	ldw	x, (0x49, sp)
	jrne	00356$
	ldw	x, (0x47, sp)
	jreq	00146$
00356$:
;	./../../mib/stm8s_mib_vsprintf.c: 147: if (sign) *str++ = sign;
	ldw	x, (0x5d, sp)
	incw	x
;	./../../mib/stm8s_mib_vsprintf.c: 151: if (base == 8)
	tnz	(0x4c, sp)
	jreq	00143$
;	./../../mib/stm8s_mib_vsprintf.c: 152: *str++ = '0';
	ldw	y, (0x5d, sp)
	ld	a, #0x30
	ld	(y), a
	ldw	(0x5d, sp), x
	jra	00146$
00143$:
;	./../../mib/stm8s_mib_vsprintf.c: 153: else if (base == 16)
	tnz	(0x4b, sp)
	jreq	00146$
;	./../../mib/stm8s_mib_vsprintf.c: 155: *str++ = '0';
	ldw	y, (0x5d, sp)
	ld	a, #0x30
	ld	(y), a
;	./../../mib/stm8s_mib_vsprintf.c: 156: *str++ = digits[33];
	ldw	y, _digits+0
	ld	a, (0x21, y)
	ld	(x), a
	incw	x
	ldw	(0x5d, sp), x
00146$:
;	./../../mib/stm8s_mib_vsprintf.c: 160: if (!(type & LEFT)) while (size-- > 0) *str++ = c;
	ld	a, (0x78, sp)
	bcp	a, #0x10
	jrne	00189$
	ldw	y, (0x6f, sp)
	ldw	(0x61, sp), y
	ldw	y, (0x6d, sp)
	ldw	(0x5f, sp), y
00147$:
	ldw	y, (0x61, sp)
	ldw	(0x55, sp), y
	ldw	y, (0x5f, sp)
	ldw	(0x53, sp), y
	ldw	x, (0x61, sp)
	subw	x, #0x0001
	ldw	(0x61, sp), x
	ldw	x, (0x5f, sp)
	jrnc	00360$
	decw	x
00360$:
	ldw	(0x5f, sp), x
	clrw	x
	cpw	x, (0x55, sp)
	clr	a
	sbc	a, (0x54, sp)
	clr	a
	sbc	a, (0x53, sp)
	jrsge	00196$
	ldw	x, (0x5d, sp)
	ld	a, (0x45, sp)
	ld	(x), a
	ldw	x, (0x5d, sp)
	incw	x
	ldw	(0x5d, sp), x
	jra	00147$
;	./../../mib/stm8s_mib_vsprintf.c: 161: while (i < precision--) *str++ = '0';
00196$:
	ldw	y, (0x61, sp)
	ldw	(0x6f, sp), y
	ldw	y, (0x5f, sp)
	ldw	(0x6d, sp), y
00189$:
	ldw	y, (0x5d, sp)
	ldw	x, (0x73, sp)
	ldw	(0x61, sp), x
	ldw	x, (0x71, sp)
	ldw	(0x5f, sp), x
00152$:
	ldw	x, (0x59, sp)
	cpw	x, (0x61, sp)
	ld	a, (0x58, sp)
	sbc	a, (0x60, sp)
	ld	a, (0x57, sp)
	sbc	a, (0x5f, sp)
	jrsge	00191$
	ldw	x, (0x61, sp)
	subw	x, #0x0001
	ldw	(0x61, sp), x
	ldw	x, (0x5f, sp)
	jrnc	00364$
	decw	x
00364$:
	ldw	(0x5f, sp), x
	ld	a, #0x30
	ld	(y), a
	incw	y
	jra	00152$
;	./../../mib/stm8s_mib_vsprintf.c: 162: while (i-- > 0) *str++ = tmp[i];
00191$:
	ldw	(0x5b, sp), y
	ldw	y, (0x59, sp)
	ldw	(0x61, sp), y
	ldw	y, (0x57, sp)
	ldw	(0x5f, sp), y
00155$:
	clrw	x
	cpw	x, (0x61, sp)
	clr	a
	sbc	a, (0x60, sp)
	clr	a
	sbc	a, (0x5f, sp)
	jrsge	00193$
	ldw	x, (0x61, sp)
	subw	x, #0x0001
	ldw	(0x61, sp), x
	ldw	x, (0x5f, sp)
	jrnc	00366$
	decw	x
00366$:
	ldw	(0x5f, sp), x
	ldw	x, sp
	incw	x
	addw	x, (0x61, sp)
	ld	a, (x)
	ldw	x, (0x5b, sp)
	ld	(x), a
	ldw	x, (0x5b, sp)
	incw	x
	ldw	(0x5b, sp), x
	jra	00155$
;	./../../mib/stm8s_mib_vsprintf.c: 163: while (size-- > 0) *str++ = ' ';
00193$:
	ldw	y, (0x5b, sp)
	ldw	x, (0x6f, sp)
	ldw	(0x61, sp), x
	ldw	x, (0x6d, sp)
	ldw	(0x5f, sp), x
00158$:
	clrw	x
	cpw	x, (0x61, sp)
	clr	a
	sbc	a, (0x60, sp)
	clr	a
	sbc	a, (0x5f, sp)
	jrsge	00160$
	ldw	x, (0x61, sp)
	subw	x, #0x0001
	ldw	(0x61, sp), x
	ldw	x, (0x5f, sp)
	jrnc	00369$
	decw	x
00369$:
	ldw	(0x5f, sp), x
	ld	a, #0x20
	ld	(y), a
	incw	y
	jra	00158$
00160$:
;	./../../mib/stm8s_mib_vsprintf.c: 165: return str;
	ldw	x, y
00161$:
;	./../../mib/stm8s_mib_vsprintf.c: 166: }
	ldw	y, (99, sp)
	addw	sp, #120
	jp	(y)
;	./../../mib/stm8s_mib_vsprintf.c: 172: MMRINT mm_vsprintf(char *buf, const char *fmt, va_list args)
;	-----------------------------------------
;	 function mm_vsprintf
;	-----------------------------------------
_mm_vsprintf:
	sub	sp, #33
	ldw	(0x1a, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 186: char vStr[] = "<NULL>";
	ld	a, #0x3c
	ld	(0x0d, sp), a
	ld	a, #0x4e
	ld	(0x0e, sp), a
	ld	a, #0x55
	ld	(0x0f, sp), a
	ld	a, #0x4c
	ld	(0x10, sp), a
	ld	(0x11, sp), a
	ld	a, #0x3e
	ld	(0x12, sp), a
	clr	(0x13, sp)
;	./../../mib/stm8s_mib_vsprintf.c: 188: for (str = buf; *fmt; fmt++)
	ldw	y, (0x1a, sp)
	ldw	(0x1c, sp), y
00185$:
	ldw	y, (0x24, sp)
	ldw	(0x20, sp), y
	ldw	x, y
	ld	a, (x)
	ld	(0x1f, sp), a
	jrne	00437$
	jp	00180$
00437$:
;	./../../mib/stm8s_mib_vsprintf.c: 190: if (*fmt != '%')
	ld	a, (0x1f, sp)
	cp	a, #0x25
	jreq	00102$
;	./../../mib/stm8s_mib_vsprintf.c: 192: *str++ = *fmt;
	ldw	x, (0x1c, sp)
	ld	a, (0x1f, sp)
	ld	(x), a
	ldw	x, (0x1c, sp)
	incw	x
	ldw	(0x1c, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 193: continue;
	jp	00179$
00102$:
;	./../../mib/stm8s_mib_vsprintf.c: 197: flags = 0;
	clrw	x
	ldw	(0x0b, sp), x
	ldw	(0x09, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 198: repeat:
	ldw	x, (0x20, sp)
00103$:
;	./../../mib/stm8s_mib_vsprintf.c: 199: fmt++; // This also skips first '%'
	incw	x
	ldw	(0x24, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 200: switch (*fmt)
	ld	a, (x)
	ld	(0x19, sp), a
	cp	a, #0x20
	jreq	00106$
	ld	a, (0x19, sp)
	cp	a, #0x23
	jreq	00107$
	ld	a, (0x19, sp)
	cp	a, #0x2b
	jreq	00105$
	ld	a, (0x19, sp)
	cp	a, #0x2d
	jreq	00104$
	ld	a, (0x19, sp)
	cp	a, #0x30
	jreq	00108$
	ldw	(0x24, sp), x
	jra	00109$
;	./../../mib/stm8s_mib_vsprintf.c: 202: case '-': flags |= LEFT; goto repeat;
00104$:
	ld	a, (0x0c, sp)
	or	a, #0x10
	ld	(0x0c, sp), a
	jra	00103$
;	./../../mib/stm8s_mib_vsprintf.c: 203: case '+': flags |= PLUS; goto repeat;
00105$:
	ld	a, (0x0c, sp)
	or	a, #0x04
	ld	(0x0c, sp), a
	jra	00103$
;	./../../mib/stm8s_mib_vsprintf.c: 204: case ' ': flags |= SPACE; goto repeat;
00106$:
	ld	a, (0x0c, sp)
	or	a, #0x08
	ld	(0x0c, sp), a
	jra	00103$
;	./../../mib/stm8s_mib_vsprintf.c: 205: case '#': flags |= SPECIAL; goto repeat;
00107$:
	ld	a, (0x0c, sp)
	or	a, #0x20
	ld	(0x0c, sp), a
	jra	00103$
;	./../../mib/stm8s_mib_vsprintf.c: 206: case '0': flags |= ZEROPAD; goto repeat;
00108$:
	srl	(0x0c, sp)
	scf
	rlc	(0x0c, sp)
	jra	00103$
;	./../../mib/stm8s_mib_vsprintf.c: 207: }
00109$:
;	./../../mib/stm8s_mib_vsprintf.c: 210: field_width = -1;
	clrw	x
	decw	x
	ldw	(0x20, sp), x
	ldw	(0x1e, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 211: if (is_digit(*fmt))
	ld	a, (0x19, sp)
	cp	a, #0x30
	jrc	00115$
	cp	a, #0x39
	jrugt	00115$
;	./../../mib/stm8s_mib_vsprintf.c: 212: field_width = skip_atoi(&fmt);
	ldw	x, sp
	addw	x, #36
	call	_skip_atoi
	ldw	(0x20, sp), x
	ldw	(0x1e, sp), y
	jra	00116$
00115$:
;	./../../mib/stm8s_mib_vsprintf.c: 213: else if (*fmt == '*')
	ldw	x, (0x24, sp)
	ld	a, (x)
	cp	a, #0x2a
	jrne	00116$
;	./../../mib/stm8s_mib_vsprintf.c: 215: fmt++;
	incw	x
	ldw	(0x24, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 216: field_width = va_arg(args, MMINT);
	ldw	x, (0x26, sp)
	addw	x, #0x0004
	ldw	(0x26, sp), x
	subw	x, #0x0004
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
	ldw	(0x20, sp), y
	ldw	(0x1e, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 217: if (field_width < 0)
	tnz	(0x1e, sp)
	jrpl	00116$
;	./../../mib/stm8s_mib_vsprintf.c: 219: field_width = -field_width;
	neg	(0x21, sp)
	clr	a
	sbc	a, (0x20, sp)
	ld	(0x20, sp), a
	clr	a
	sbc	a, (0x1f, sp)
	ld	(0x1f, sp), a
	clr	a
	sbc	a, (0x1e, sp)
	ld	(0x1e, sp), a
;	./../../mib/stm8s_mib_vsprintf.c: 220: flags |= LEFT;
	ld	a, (0x0c, sp)
	or	a, #0x10
	ld	(0x0c, sp), a
00116$:
;	./../../mib/stm8s_mib_vsprintf.c: 225: precision = -1;
	clrw	x
	decw	x
	ldw	(0x18, sp), x
	ldw	(0x16, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 226: if (*fmt == '.')
	ldw	y, (0x24, sp)
	ldw	(0x14, sp), y
	ldw	x, y
	ld	a, (x)
	cp	a, #0x2e
	jrne	00127$
;	./../../mib/stm8s_mib_vsprintf.c: 228: ++fmt;    
	ldw	x, (0x14, sp)
	incw	x
;	./../../mib/stm8s_mib_vsprintf.c: 229: if (is_digit(*fmt))
	ldw	(0x24, sp), x
	ld	a, (x)
	cp	a, #0x30
	jrc	00121$
	cp	a, #0x39
	jrugt	00121$
;	./../../mib/stm8s_mib_vsprintf.c: 230: precision = skip_atoi(&fmt);
	ldw	x, sp
	addw	x, #36
	call	_skip_atoi
	ldw	(0x18, sp), x
	ldw	(0x16, sp), y
	jra	00122$
00121$:
;	./../../mib/stm8s_mib_vsprintf.c: 231: else if (*fmt == '*')
	ldw	x, (0x24, sp)
	ld	a, (x)
	cp	a, #0x2a
	jrne	00122$
;	./../../mib/stm8s_mib_vsprintf.c: 233: ++fmt;
	incw	x
	ldw	(0x24, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 234: precision = va_arg(args, MMINT);
	ldw	x, (0x26, sp)
	addw	x, #0x0004
	ldw	(0x26, sp), x
	subw	x, #0x0004
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
	ldw	(0x18, sp), y
	ldw	(0x16, sp), x
00122$:
;	./../../mib/stm8s_mib_vsprintf.c: 236: if (precision < 0) precision = 0;
	tnz	(0x16, sp)
	jrpl	00127$
	clrw	x
	ldw	(0x18, sp), x
	ldw	(0x16, sp), x
00127$:
;	./../../mib/stm8s_mib_vsprintf.c: 240: qualifier = -1;
	clrw	x
	decw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 241: if (*fmt == 'h' || *fmt == 'l' || *fmt == 'L')
	ldw	x, (0x24, sp)
	ld	a, (x)
	ld	(0x15, sp), a
	cp	a, #0x68
	jreq	00128$
	ld	a, (0x15, sp)
	cp	a, #0x6c
	jreq	00128$
	ld	a, (0x15, sp)
	cp	a, #0x4c
	jrne	00129$
00128$:
;	./../../mib/stm8s_mib_vsprintf.c: 243: qualifier = *fmt;
	ldw	x, (0x24, sp)
	ld	a, (x)
	ld	(0x04, sp), a
	clr	(0x03, sp)
	clr	(0x02, sp)
	clr	(0x01, sp)
;	./../../mib/stm8s_mib_vsprintf.c: 244: fmt++;
	incw	x
	ldw	(0x24, sp), x
00129$:
;	./../../mib/stm8s_mib_vsprintf.c: 248: base = 10;
	ldw	x, #0x000a
	ldw	(0x07, sp), x
	clrw	x
	ldw	(0x05, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 250: switch (*fmt)
	ldw	y, (0x24, sp)
	ldw	(0x14, sp), y
	ldw	x, y
	ld	a, (x)
	cp	a, #0x58
	jrne	00482$
	jp	00161$
00482$:
	cp	a, #0x63
	jreq	00132$
	cp	a, #0x64
	jrne	00488$
	jp	00164$
00488$:
	cp	a, #0x69
	jrne	00491$
	jp	00164$
00491$:
	cp	a, #0x6e
	jrne	00494$
	jp	00156$
00494$:
	cp	a, #0x6f
	jrne	00497$
	jp	00160$
00497$:
	cp	a, #0x70
	jrne	00500$
	jp	00153$
00500$:
	cp	a, #0x73
	jreq	00141$
	cp	a, #0x75
	jrne	00506$
	jp	00172$
00506$:
	cp	a, #0x78
	jrne	00509$
	jp	00162$
00509$:
	jp	00166$
;	./../../mib/stm8s_mib_vsprintf.c: 252: case 'c':
00132$:
;	./../../mib/stm8s_mib_vsprintf.c: 253: if (!(flags & LEFT)) while (--field_width > 0) *str++ = ' ';
	ld	a, (0x0c, sp)
	bcp	a, #0x10
	jrne	00137$
	ldw	y, (0x1c, sp)
00133$:
	ldw	x, (0x20, sp)
	subw	x, #0x0001
	ldw	(0x20, sp), x
	ldw	x, (0x1e, sp)
	jrnc	00512$
	decw	x
00512$:
	ldw	(0x1e, sp), x
	clrw	x
	cpw	x, (0x20, sp)
	clr	a
	sbc	a, (0x1f, sp)
	clr	a
	sbc	a, (0x1e, sp)
	jrsge	00236$
	ld	a, #0x20
	ld	(y), a
	incw	y
	jra	00133$
00236$:
	ldw	(0x1c, sp), y
00137$:
;	./../../mib/stm8s_mib_vsprintf.c: 254: *str++ = (MMUCHAR) va_arg(args, MMAINT); // test ok...
	ldw	x, (0x26, sp)
	incw	x
	incw	x
	ldw	(0x26, sp), x
	decw	x
	decw	x
	ld	a, (0x1, x)
	ldw	x, (0x1c, sp)
	ld	(x), a
	ldw	x, (0x1c, sp)
	incw	x
	ldw	(0x18, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 255: while (--field_width > 0) *str++ = ' ';
00138$:
	ldw	x, (0x20, sp)
	subw	x, #0x0001
	ldw	(0x20, sp), x
	ldw	x, (0x1e, sp)
	jrnc	00514$
	decw	x
00514$:
	ldw	(0x1e, sp), x
	clrw	x
	cpw	x, (0x20, sp)
	clr	a
	sbc	a, (0x1f, sp)
	clr	a
	sbc	a, (0x1e, sp)
	jrslt	00515$
	jp	00237$
00515$:
	ldw	x, (0x18, sp)
	ld	a, #0x20
	ld	(x), a
	ldw	x, (0x18, sp)
	incw	x
	ldw	(0x18, sp), x
	jra	00138$
;	./../../mib/stm8s_mib_vsprintf.c: 258: case 's':
00141$:
;	./../../mib/stm8s_mib_vsprintf.c: 259: s = va_arg(args, char *);
	ldw	x, (0x26, sp)
	incw	x
	incw	x
	ldw	(0x26, sp), x
	decw	x
	decw	x
	ldw	x, (x)
;	./../../mib/stm8s_mib_vsprintf.c: 260: if (!s) s = vStr; // "<NULL>";
	ldw	(0x14, sp), x
	jrne	00143$
	ldw	x, sp
	addw	x, #13
	ldw	(0x14, sp), x
00143$:
;	./../../mib/stm8s_mib_vsprintf.c: 261: len = strnlen(s, precision);
	ldw	x, (0x18, sp)
	pushw	x
	ldw	x, (0x16, sp)
	call	_strnlen
	ldw	(0x18, sp), x
	clrw	x
	ldw	(0x16, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 262: if (!(flags & LEFT)) while (len < field_width--) *str++ = ' ';
	ld	a, (0x0c, sp)
	bcp	a, #0x10
	jrne	00225$
00144$:
	ldw	y, (0x20, sp)
	ldw	(0x0b, sp), y
	ldw	y, (0x1e, sp)
	ldw	(0x09, sp), y
	ldw	x, (0x20, sp)
	subw	x, #0x0001
	ldw	(0x20, sp), x
	ldw	x, (0x1e, sp)
	jrnc	00519$
	decw	x
00519$:
	ldw	(0x1e, sp), x
	ldw	x, (0x18, sp)
	cpw	x, (0x0b, sp)
	ld	a, (0x17, sp)
	sbc	a, (0x0a, sp)
	ld	a, (0x16, sp)
	sbc	a, (0x09, sp)
	jrsge	00238$
	ldw	x, (0x1c, sp)
	ld	a, #0x20
	ld	(x), a
	ldw	x, (0x1c, sp)
	incw	x
	ldw	(0x1c, sp), x
	jra	00144$
00238$:
;	./../../mib/stm8s_mib_vsprintf.c: 263: for (i = 0; i < len; ++i) *str++ = *s++;
00225$:
	clrw	x
	ldw	(0x0b, sp), x
	ldw	(0x09, sp), x
00182$:
	ldw	x, (0x0b, sp)
	cpw	x, (0x18, sp)
	ld	a, (0x0a, sp)
	sbc	a, (0x17, sp)
	ld	a, (0x09, sp)
	sbc	a, (0x16, sp)
	jrsge	00227$
	ldw	x, (0x14, sp)
	ld	a, (x)
	ldw	x, (0x14, sp)
	incw	x
	ldw	(0x14, sp), x
	ldw	x, (0x1c, sp)
	ld	(x), a
	ldw	x, (0x1c, sp)
	incw	x
	ldw	(0x1c, sp), x
	ldw	x, (0x0b, sp)
	incw	x
	ldw	(0x0b, sp), x
	jrne	00182$
	ldw	x, (0x09, sp)
	incw	x
	ldw	(0x09, sp), x
	jra	00182$
;	./../../mib/stm8s_mib_vsprintf.c: 264: while (len < field_width--) *str++ = ' ';
00227$:
00150$:
	ldw	x, (0x18, sp)
	cpw	x, (0x20, sp)
	ld	a, (0x17, sp)
	sbc	a, (0x1f, sp)
	ld	a, (0x16, sp)
	sbc	a, (0x1e, sp)
	jrslt	00526$
	jp	00240$
00526$:
	ldw	x, (0x20, sp)
	subw	x, #0x0001
	ldw	(0x20, sp), x
	ldw	x, (0x1e, sp)
	jrnc	00527$
	decw	x
00527$:
	ldw	(0x1e, sp), x
	ldw	x, (0x1c, sp)
	ld	a, #0x20
	ld	(x), a
	ldw	x, (0x1c, sp)
	incw	x
	ldw	(0x1c, sp), x
	jra	00150$
;	./../../mib/stm8s_mib_vsprintf.c: 267: case 'p':
00153$:
;	./../../mib/stm8s_mib_vsprintf.c: 268: if (field_width == -1)
	ldw	x, (0x20, sp)
	incw	x
	jrne	00155$
	ldw	x, (0x1e, sp)
	incw	x
	jrne	00155$
;	./../../mib/stm8s_mib_vsprintf.c: 270: field_width = 2 * sizeof(void *);
	ldw	x, #0x0004
	ldw	(0x20, sp), x
	clrw	x
	ldw	(0x1e, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 271: flags |= ZEROPAD;
	srl	(0x0c, sp)
	scf
	rlc	(0x0c, sp)
00155$:
;	./../../mib/stm8s_mib_vsprintf.c: 273: str = number(str, (MMULONG) va_arg(args, void *), 16, field_width, precision, flags);
	ldw	x, (0x26, sp)
	incw	x
	incw	x
	ldw	(0x26, sp), x
	decw	x
	decw	x
	ldw	x, (x)
	ldw	(0x07, sp), x
	clrw	y
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x1c, sp)
	pushw	x
	ldw	x, (0x1c, sp)
	pushw	x
	ldw	x, (0x28, sp)
	pushw	x
	ldw	x, (0x28, sp)
	pushw	x
	push	#0x10
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, (0x17, sp)
	pushw	x
	pushw	y
	ldw	x, (0x30, sp)
	call	_number
	ldw	(0x1c, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 274: continue;
	jp	00179$
;	./../../mib/stm8s_mib_vsprintf.c: 276: case 'n':
00156$:
;	./../../mib/stm8s_mib_vsprintf.c: 277: if (qualifier == 'l')
	ldw	x, (0x03, sp)
	cpw	x, #0x006c
	jrne	00158$
	ldw	x, (0x01, sp)
	jrne	00158$
;	./../../mib/stm8s_mib_vsprintf.c: 279: MMLONG *ip = va_arg(args, MMLONG *);
	ldw	x, (0x26, sp)
	incw	x
	incw	x
	ldw	(0x26, sp), x
	decw	x
	decw	x
	ldw	x, (x)
;	./../../mib/stm8s_mib_vsprintf.c: 280: *ip = (str - buf);
	ldw	y, (0x1c, sp)
	subw	y, (0x1a, sp)
	ld	a, yh
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x1f, sp), a
	ld	(0x1e, sp), a
	ldw	(0x2, x), y
	ldw	y, (0x1e, sp)
	ldw	(x), y
	jp	00179$
00158$:
;	./../../mib/stm8s_mib_vsprintf.c: 284: MMINT *ip = va_arg(args, MMINT *);
	ldw	x, (0x26, sp)
	incw	x
	incw	x
	ldw	(0x26, sp), x
	decw	x
	decw	x
	ldw	x, (x)
;	./../../mib/stm8s_mib_vsprintf.c: 285: *ip = (str - buf);
	ldw	y, (0x1c, sp)
	subw	y, (0x1a, sp)
	ld	a, yh
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x1f, sp), a
	ld	(0x1e, sp), a
	ldw	(0x2, x), y
	ldw	y, (0x1e, sp)
	ldw	(x), y
;	./../../mib/stm8s_mib_vsprintf.c: 287: continue;
	jp	00179$
;	./../../mib/stm8s_mib_vsprintf.c: 290: case 'o':
00160$:
;	./../../mib/stm8s_mib_vsprintf.c: 291: base = 8;
	ldw	x, #0x0008
	ldw	(0x07, sp), x
	clrw	x
	ldw	(0x05, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 292: break;
	jra	00172$
;	./../../mib/stm8s_mib_vsprintf.c: 294: case 'X':
00161$:
;	./../../mib/stm8s_mib_vsprintf.c: 295: flags |= LARGE;
	ld	a, (0x0c, sp)
	or	a, #0x40
	ld	(0x0c, sp), a
;	./../../mib/stm8s_mib_vsprintf.c: 297: case 'x':
00162$:
;	./../../mib/stm8s_mib_vsprintf.c: 298: base = 16;
	ldw	x, #0x0010
	ldw	(0x07, sp), x
	clrw	x
	ldw	(0x05, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 299: break;
	jra	00172$
;	./../../mib/stm8s_mib_vsprintf.c: 302: case 'i':
00164$:
;	./../../mib/stm8s_mib_vsprintf.c: 303: flags |= SIGN;
	ld	a, (0x0c, sp)
	or	a, #0x02
	ld	(0x0c, sp), a
;	./../../mib/stm8s_mib_vsprintf.c: 306: break;
	jra	00172$
;	./../../mib/stm8s_mib_vsprintf.c: 308: default:
00166$:
;	./../../mib/stm8s_mib_vsprintf.c: 309: if (*fmt != '%') *str++ = '%';
	cp	a, #0x25
	jreq	00168$
	ldw	x, (0x1c, sp)
	ld	a, #0x25
	ld	(x), a
	ldw	x, (0x1c, sp)
	incw	x
	ldw	(0x1c, sp), x
00168$:
;	./../../mib/stm8s_mib_vsprintf.c: 310: if (*fmt)
	ldw	x, (0x24, sp)
	ld	a, (x)
	jreq	00170$
;	./../../mib/stm8s_mib_vsprintf.c: 311: *str++ = *fmt;
	ldw	x, (0x1c, sp)
	ld	(x), a
	ldw	x, (0x1c, sp)
	incw	x
	ldw	(0x1c, sp), x
	jra	00179$
00170$:
;	./../../mib/stm8s_mib_vsprintf.c: 313: --fmt;
	decw	x
	ldw	(0x24, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 314: continue;
	jra	00179$
;	./../../mib/stm8s_mib_vsprintf.c: 315: }
00172$:
;	./../../mib/stm8s_mib_vsprintf.c: 317: if (qualifier == 'l')
	ldw	x, (0x03, sp)
	cpw	x, #0x006c
	jrne	00177$
	ldw	x, (0x01, sp)
	jrne	00177$
;	./../../mib/stm8s_mib_vsprintf.c: 318: num = va_arg(args, MMUINT); // MMULONG); // test ok..
	ldw	x, (0x26, sp)
	addw	x, #0x0004
	ldw	(0x26, sp), x
	subw	x, #0x0004
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
	ldw	(0x03, sp), y
	ldw	(0x01, sp), x
	jra	00178$
00177$:
;	./../../mib/stm8s_mib_vsprintf.c: 328: else if (flags & SIGN)
	ld	a, (0x0c, sp)
	bcp	a, #0x02
	jreq	00174$
;	./../../mib/stm8s_mib_vsprintf.c: 329: num = va_arg(args, MMINT); // test ok...
	ldw	x, (0x26, sp)
	addw	x, #0x0004
	ldw	(0x26, sp), x
	subw	x, #0x0004
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
	ldw	(0x03, sp), y
	ldw	(0x01, sp), x
	jra	00178$
00174$:
;	./../../mib/stm8s_mib_vsprintf.c: 331: num = va_arg(args, MMAUINT);
	ldw	x, (0x26, sp)
	incw	x
	incw	x
	ldw	(0x26, sp), x
	decw	x
	decw	x
	ldw	x, (x)
	ldw	(0x03, sp), x
	clrw	x
	ldw	(0x01, sp), x
00178$:
;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x1c, sp)
	pushw	x
	ldw	x, (0x1c, sp)
	pushw	x
	ldw	x, (0x28, sp)
	pushw	x
	ldw	x, (0x28, sp)
	pushw	x
	ldw	x, (0x13, sp)
	pushw	x
	ldw	x, (0x13, sp)
	pushw	x
	ldw	x, (0x13, sp)
	pushw	x
	ldw	x, (0x13, sp)
	pushw	x
	ldw	x, (0x30, sp)
	call	_number
	ldw	(0x1c, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
	jra	00179$
;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
00237$:
	ldw	y, (0x18, sp)
	ldw	(0x1c, sp), y
;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
00240$:
00179$:
;	./../../mib/stm8s_mib_vsprintf.c: 188: for (str = buf; *fmt; fmt++)
	ldw	x, (0x24, sp)
	incw	x
	ldw	(0x24, sp), x
	jp	00185$
00180$:
;	./../../mib/stm8s_mib_vsprintf.c: 336: *str = '\0';
	ldw	x, (0x1c, sp)
	clr	(x)
;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
	ldw	x, (0x1c, sp)
	subw	x, (0x1a, sp)
;	./../../mib/stm8s_mib_vsprintf.c: 338: }
	ldw	y, (34, sp)
	addw	sp, #39
	jp	(y)
;	./../../mib/stm8s_mib_vsprintf.c: 342: MMRINT mib_vsprintf(char *vpBuffer,char *format, ...)
;	-----------------------------------------
;	 function mib_vsprintf
;	-----------------------------------------
_mib_vsprintf:
;	./../../mib/stm8s_mib_vsprintf.c: 347: va_start(ap, format);
	ldw	x, sp
	addw	x, #7
;	./../../mib/stm8s_mib_vsprintf.c: 348: rc = mm_vsprintf(vpBuffer, format, ap);
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	call	_mm_vsprintf
;	./../../mib/stm8s_mib_vsprintf.c: 351: return (rc);
;	./../../mib/stm8s_mib_vsprintf.c: 352: }
	ret
;	./../../mib/stm8s_mib_vsprintf.c: 363: MMRINT mib_printf(char *format, ...)
;	-----------------------------------------
;	 function mib_printf
;	-----------------------------------------
_mib_printf:
	sub	sp, #130
;	./../../mib/stm8s_mib_vsprintf.c: 370: va_start(ap, format);
;	./../../mib/stm8s_mib_vsprintf.c: 371: rc = mm_vsprintf(buffer, format, ap);
	ldw	x, sp
	addw	x, #135
	pushw	x
	ldw	x, (0x87, sp)
	pushw	x
	ldw	x, sp
	addw	x, #5
	call	_mm_vsprintf
	ldw	(0x81, sp), x
;	./../../mib/stm8s_mib_vsprintf.c: 374: v_pString = (char *)buffer;
	ldw	x, sp
	incw	x
;	./../../mib/stm8s_mib_vsprintf.c: 375: while (*v_pString != 0)	MibWriteDebugByte((uint8_t)*v_pString++);
00101$:
	ld	a, (x)
	jreq	00103$
	incw	x
	pushw	x
	call	_MibWriteDebugByte
	popw	x
	jra	00101$
00103$:
;	./../../mib/stm8s_mib_vsprintf.c: 376: return (rc);
	ldw	x, (0x81, sp)
;	./../../mib/stm8s_mib_vsprintf.c: 377: }
	addw	sp, #130
	ret
	.area CODE
	.area CONST
	.area CONST
___str_1:
	.ascii "0123456789abcdefghijklmnopqrstuvwxyz"
	.db 0x00
	.area CODE
	.area CONST
___str_2:
	.ascii "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	.db 0x00
	.area CODE
	.area INITIALIZER
__xinit__digits:
	.dw ___str_1
__xinit__upper_digits:
	.dw ___str_2
	.area CABS (ABS)
