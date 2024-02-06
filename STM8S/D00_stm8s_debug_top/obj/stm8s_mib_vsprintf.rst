                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_mib_vsprintf
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _mib_printf
                                     12 	.globl _MibWriteDebugByte
                                     13 	.globl _mib_vsprintf
                                     14 	.globl _mm_vsprintf
                                     15 ;--------------------------------------------------------
                                     16 ; ram data
                                     17 ;--------------------------------------------------------
                                     18 	.area DATA
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area INITIALIZED
      00014B                         23 _digits:
      00014B                         24 	.ds 2
      00014D                         25 _upper_digits:
      00014D                         26 	.ds 2
                                     27 ;--------------------------------------------------------
                                     28 ; absolute external ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DABS (ABS)
                                     31 
                                     32 ; default segment ordering for linker
                                     33 	.area HOME
                                     34 	.area GSINIT
                                     35 	.area GSFINAL
                                     36 	.area CONST
                                     37 	.area INITIALIZER
                                     38 	.area CODE
                                     39 
                                     40 ;--------------------------------------------------------
                                     41 ; global & static initialisations
                                     42 ;--------------------------------------------------------
                                     43 	.area HOME
                                     44 	.area GSINIT
                                     45 	.area GSFINAL
                                     46 	.area GSINIT
                                     47 ;--------------------------------------------------------
                                     48 ; Home
                                     49 ;--------------------------------------------------------
                                     50 	.area HOME
                                     51 	.area HOME
                                     52 ;--------------------------------------------------------
                                     53 ; code
                                     54 ;--------------------------------------------------------
                                     55 	.area CODE
                                     56 ;	./../../mib/stm8s_mib_vsprintf.c: 71: static size_t strnlen(const char *s, size_t count)
                                     57 ;	-----------------------------------------
                                     58 ;	 function strnlen
                                     59 ;	-----------------------------------------
      0089AD                         60 _strnlen:
      0089AD 52 06            [ 2]   61 	sub	sp, #6
      0089AF 1F 03            [ 2]   62 	ldw	(0x03, sp), x
                                     63 ;	./../../mib/stm8s_mib_vsprintf.c: 74: for (sc = s; *sc != '\0' && count--; ++sc);
      0089B1 16 09            [ 2]   64 	ldw	y, (0x09, sp)
      0089B3 17 05            [ 2]   65 	ldw	(0x05, sp), y
      0089B5 1E 03            [ 2]   66 	ldw	x, (0x03, sp)
      0089B7                         67 00104$:
      0089B7 F6               [ 1]   68 	ld	a, (x)
      0089B8 27 11            [ 1]   69 	jreq	00101$
      0089BA 16 05            [ 2]   70 	ldw	y, (0x05, sp)
      0089BC 17 01            [ 2]   71 	ldw	(0x01, sp), y
      0089BE 16 05            [ 2]   72 	ldw	y, (0x05, sp)
      0089C0 90 5A            [ 2]   73 	decw	y
      0089C2 17 05            [ 2]   74 	ldw	(0x05, sp), y
      0089C4 16 01            [ 2]   75 	ldw	y, (0x01, sp)
      0089C6 27 03            [ 1]   76 	jreq	00101$
      0089C8 5C               [ 1]   77 	incw	x
      0089C9 20 EC            [ 2]   78 	jra	00104$
      0089CB                         79 00101$:
                                     80 ;	./../../mib/stm8s_mib_vsprintf.c: 75: return sc - s;
      0089CB 72 F0 03         [ 2]   81 	subw	x, (0x03, sp)
                                     82 ;	./../../mib/stm8s_mib_vsprintf.c: 76: }
      0089CE 5B 06            [ 2]   83 	addw	sp, #6
      0089D0 90 85            [ 2]   84 	popw	y
      0089D2 5B 02            [ 2]   85 	addw	sp, #2
      0089D4 90 FC            [ 2]   86 	jp	(y)
                                     87 ;	./../../mib/stm8s_mib_vsprintf.c: 81: static MMINT skip_atoi(const char **s)
                                     88 ;	-----------------------------------------
                                     89 ;	 function skip_atoi
                                     90 ;	-----------------------------------------
      0089D6                         91 _skip_atoi:
      0089D6 52 08            [ 2]   92 	sub	sp, #8
      0089D8 1F 07            [ 2]   93 	ldw	(0x07, sp), x
                                     94 ;	./../../mib/stm8s_mib_vsprintf.c: 83: MMINT i = 0;
      0089DA 5F               [ 1]   95 	clrw	x
      0089DB 1F 05            [ 2]   96 	ldw	(0x05, sp), x
                                     97 ;	./../../mib/stm8s_mib_vsprintf.c: 84: while (is_digit(**s)) i = i*10 + *((*s)++) - '0';
      0089DD                         98 00102$:
      0089DD 16 07            [ 2]   99 	ldw	y, (0x07, sp)
      0089DF 90 FE            [ 2]  100 	ldw	y, (y)
      0089E1 17 01            [ 2]  101 	ldw	(0x01, sp), y
      0089E3 90 F6            [ 1]  102 	ld	a, (y)
      0089E5 A1 30            [ 1]  103 	cp	a, #0x30
      0089E7 25 41            [ 1]  104 	jrc	00104$
      0089E9 A1 39            [ 1]  105 	cp	a, #0x39
      0089EB 22 3D            [ 1]  106 	jrugt	00104$
      0089ED 16 05            [ 2]  107 	ldw	y, (0x05, sp)
      0089EF 90 89            [ 2]  108 	pushw	y
      0089F1 89               [ 2]  109 	pushw	x
      0089F2 4B 0A            [ 1]  110 	push	#0x0a
      0089F4 5F               [ 1]  111 	clrw	x
      0089F5 89               [ 2]  112 	pushw	x
      0089F6 4B 00            [ 1]  113 	push	#0x00
      0089F8 CD A2 BA         [ 4]  114 	call	__mullong
      0089FB 5B 08            [ 2]  115 	addw	sp, #8
      0089FD 1F 05            [ 2]  116 	ldw	(0x05, sp), x
      0089FF 17 03            [ 2]  117 	ldw	(0x03, sp), y
      008A01 1E 01            [ 2]  118 	ldw	x, (0x01, sp)
      008A03 5C               [ 1]  119 	incw	x
      008A04 16 07            [ 2]  120 	ldw	y, (0x07, sp)
      008A06 90 FF            [ 2]  121 	ldw	(y), x
      008A08 1E 01            [ 2]  122 	ldw	x, (0x01, sp)
      008A0A F6               [ 1]  123 	ld	a, (x)
      008A0B 90 5F            [ 1]  124 	clrw	y
      008A0D 5F               [ 1]  125 	clrw	x
      008A0E 90 5D            [ 2]  126 	tnzw	y
      008A10 2A 01            [ 1]  127 	jrpl	00124$
      008A12 5A               [ 2]  128 	decw	x
      008A13                        129 00124$:
      008A13 90 97            [ 1]  130 	ld	yl, a
      008A15 72 F9 05         [ 2]  131 	addw	y, (0x05, sp)
      008A18 9F               [ 1]  132 	ld	a, xl
      008A19 19 04            [ 1]  133 	adc	a, (0x04, sp)
      008A1B 02               [ 1]  134 	rlwa	x
      008A1C 19 03            [ 1]  135 	adc	a, (0x03, sp)
      008A1E 95               [ 1]  136 	ld	xh, a
      008A1F 72 A2 00 30      [ 2]  137 	subw	y, #0x0030
      008A23 17 05            [ 2]  138 	ldw	(0x05, sp), y
      008A25 24 B6            [ 1]  139 	jrnc	00102$
      008A27 5A               [ 2]  140 	decw	x
      008A28 20 B3            [ 2]  141 	jra	00102$
      008A2A                        142 00104$:
                                    143 ;	./../../mib/stm8s_mib_vsprintf.c: 85: return i;
      008A2A 51               [ 1]  144 	exgw	x, y
      008A2B 1E 05            [ 2]  145 	ldw	x, (0x05, sp)
                                    146 ;	./../../mib/stm8s_mib_vsprintf.c: 86: }
      008A2D 5B 08            [ 2]  147 	addw	sp, #8
      008A2F 81               [ 4]  148 	ret
                                    149 ;	./../../mib/stm8s_mib_vsprintf.c: 91: static char *number(char *str, MMLONG num, MMINT base, MMINT size, MMINT precision, MMINT type)
                                    150 ;	-----------------------------------------
                                    151 ;	 function number
                                    152 ;	-----------------------------------------
      008A30                        153 _number:
      008A30 52 62            [ 2]  154 	sub	sp, #98
      008A32 1F 5D            [ 2]  155 	ldw	(0x5d, sp), x
                                    156 ;	./../../mib/stm8s_mib_vsprintf.c: 94: char *dig = digits;
      008A34 CE 01 4B         [ 2]  157 	ldw	x, _digits+0
      008A37 1F 43            [ 2]  158 	ldw	(0x43, sp), x
                                    159 ;	./../../mib/stm8s_mib_vsprintf.c: 97: if (type & LARGE)  dig = upper_digits;
      008A39 7B 78            [ 1]  160 	ld	a, (0x78, sp)
      008A3B A5 40            [ 1]  161 	bcp	a, #0x40
      008A3D 27 05            [ 1]  162 	jreq	00102$
      008A3F CE 01 4D         [ 2]  163 	ldw	x, _upper_digits+0
      008A42 1F 43            [ 2]  164 	ldw	(0x43, sp), x
      008A44                        165 00102$:
                                    166 ;	./../../mib/stm8s_mib_vsprintf.c: 98: if (type & LEFT) type &= ~ZEROPAD;
      008A44 7B 78            [ 1]  167 	ld	a, (0x78, sp)
      008A46 A5 10            [ 1]  168 	bcp	a, #0x10
      008A48 27 0A            [ 1]  169 	jreq	00104$
      008A4A 1E 77            [ 2]  170 	ldw	x, (0x77, sp)
      008A4C 54               [ 2]  171 	srlw	x
      008A4D 58               [ 2]  172 	sllw	x
      008A4E 16 75            [ 2]  173 	ldw	y, (0x75, sp)
      008A50 1F 77            [ 2]  174 	ldw	(0x77, sp), x
      008A52 17 75            [ 2]  175 	ldw	(0x75, sp), y
      008A54                        176 00104$:
                                    177 ;	./../../mib/stm8s_mib_vsprintf.c: 99: if (base < 2 || base > 36) return 0;
      008A54 1E 6B            [ 2]  178 	ldw	x, (0x6b, sp)
      008A56 A3 00 02         [ 2]  179 	cpw	x, #0x0002
      008A59 7B 6A            [ 1]  180 	ld	a, (0x6a, sp)
      008A5B A2 00            [ 1]  181 	sbc	a, #0x00
      008A5D 7B 69            [ 1]  182 	ld	a, (0x69, sp)
      008A5F A2 00            [ 1]  183 	sbc	a, #0x00
      008A61 2F 0D            [ 1]  184 	jrslt	00105$
      008A63 AE 00 24         [ 2]  185 	ldw	x, #0x0024
      008A66 13 6B            [ 2]  186 	cpw	x, (0x6b, sp)
      008A68 4F               [ 1]  187 	clr	a
      008A69 12 6A            [ 1]  188 	sbc	a, (0x6a, sp)
      008A6B 4F               [ 1]  189 	clr	a
      008A6C 12 69            [ 1]  190 	sbc	a, (0x69, sp)
      008A6E 2E 04            [ 1]  191 	jrsge	00106$
      008A70                        192 00105$:
      008A70 5F               [ 1]  193 	clrw	x
      008A71 CC 8D 2C         [ 2]  194 	jp	00161$
      008A74                        195 00106$:
                                    196 ;	./../../mib/stm8s_mib_vsprintf.c: 101: c = (type & ZEROPAD) ? '0' : ' ';
      008A74 7B 78            [ 1]  197 	ld	a, (0x78, sp)
      008A76 44               [ 1]  198 	srl	a
      008A77 24 03            [ 1]  199 	jrnc	00163$
      008A79 A6 30            [ 1]  200 	ld	a, #0x30
      008A7B C5                     201 	.byte 0xc5
      008A7C                        202 00163$:
      008A7C A6 20            [ 1]  203 	ld	a, #0x20
      008A7E                        204 00164$:
      008A7E 6B 45            [ 1]  205 	ld	(0x45, sp), a
                                    206 ;	./../../mib/stm8s_mib_vsprintf.c: 102: sign = 0;
      008A80 0F 46            [ 1]  207 	clr	(0x46, sp)
                                    208 ;	./../../mib/stm8s_mib_vsprintf.c: 103: if (type & SIGN)
      008A82 7B 78            [ 1]  209 	ld	a, (0x78, sp)
      008A84 A5 02            [ 1]  210 	bcp	a, #0x02
      008A86 27 52            [ 1]  211 	jreq	00117$
                                    212 ;	./../../mib/stm8s_mib_vsprintf.c: 109: size--;
      008A88 16 6F            [ 2]  213 	ldw	y, (0x6f, sp)
      008A8A 72 A2 00 01      [ 2]  214 	subw	y, #0x0001
      008A8E 1E 6D            [ 2]  215 	ldw	x, (0x6d, sp)
      008A90 24 01            [ 1]  216 	jrnc	00330$
      008A92 5A               [ 2]  217 	decw	x
      008A93                        218 00330$:
      008A93 1F 57            [ 2]  219 	ldw	(0x57, sp), x
                                    220 ;	./../../mib/stm8s_mib_vsprintf.c: 105: if (num < 0)
      008A95 0D 65            [ 1]  221 	tnz	(0x65, sp)
      008A97 2A 1F            [ 1]  222 	jrpl	00114$
                                    223 ;	./../../mib/stm8s_mib_vsprintf.c: 107: sign = '-';
      008A99 A6 2D            [ 1]  224 	ld	a, #0x2d
      008A9B 6B 46            [ 1]  225 	ld	(0x46, sp), a
                                    226 ;	./../../mib/stm8s_mib_vsprintf.c: 108: num = -num;
      008A9D 1E 67            [ 2]  227 	ldw	x, (0x67, sp)
      008A9F 50               [ 2]  228 	negw	x
      008AA0 4F               [ 1]  229 	clr	a
      008AA1 12 66            [ 1]  230 	sbc	a, (0x66, sp)
      008AA3 6B 60            [ 1]  231 	ld	(0x60, sp), a
      008AA5 4F               [ 1]  232 	clr	a
      008AA6 12 65            [ 1]  233 	sbc	a, (0x65, sp)
      008AA8 1F 67            [ 2]  234 	ldw	(0x67, sp), x
      008AAA 6B 65            [ 1]  235 	ld	(0x65, sp), a
      008AAC 7B 60            [ 1]  236 	ld	a, (0x60, sp)
      008AAE 6B 66            [ 1]  237 	ld	(0x66, sp), a
                                    238 ;	./../../mib/stm8s_mib_vsprintf.c: 109: size--;
      008AB0 17 6F            [ 2]  239 	ldw	(0x6f, sp), y
      008AB2 16 57            [ 2]  240 	ldw	y, (0x57, sp)
      008AB4 17 6D            [ 2]  241 	ldw	(0x6d, sp), y
      008AB6 20 22            [ 2]  242 	jra	00117$
      008AB8                        243 00114$:
                                    244 ;	./../../mib/stm8s_mib_vsprintf.c: 111: else if (type & PLUS)
      008AB8 7B 78            [ 1]  245 	ld	a, (0x78, sp)
      008ABA A5 04            [ 1]  246 	bcp	a, #0x04
      008ABC 27 0C            [ 1]  247 	jreq	00111$
                                    248 ;	./../../mib/stm8s_mib_vsprintf.c: 113: sign = '+';
      008ABE A6 2B            [ 1]  249 	ld	a, #0x2b
      008AC0 6B 46            [ 1]  250 	ld	(0x46, sp), a
                                    251 ;	./../../mib/stm8s_mib_vsprintf.c: 114: size--;
      008AC2 17 6F            [ 2]  252 	ldw	(0x6f, sp), y
      008AC4 16 57            [ 2]  253 	ldw	y, (0x57, sp)
      008AC6 17 6D            [ 2]  254 	ldw	(0x6d, sp), y
      008AC8 20 10            [ 2]  255 	jra	00117$
      008ACA                        256 00111$:
                                    257 ;	./../../mib/stm8s_mib_vsprintf.c: 116: else if (type & SPACE)
      008ACA 7B 78            [ 1]  258 	ld	a, (0x78, sp)
      008ACC A5 08            [ 1]  259 	bcp	a, #0x08
      008ACE 27 0A            [ 1]  260 	jreq	00117$
                                    261 ;	./../../mib/stm8s_mib_vsprintf.c: 118: sign = ' ';
      008AD0 A6 20            [ 1]  262 	ld	a, #0x20
      008AD2 6B 46            [ 1]  263 	ld	(0x46, sp), a
                                    264 ;	./../../mib/stm8s_mib_vsprintf.c: 119: size--;
      008AD4 17 6F            [ 2]  265 	ldw	(0x6f, sp), y
      008AD6 16 57            [ 2]  266 	ldw	y, (0x57, sp)
      008AD8 17 6D            [ 2]  267 	ldw	(0x6d, sp), y
      008ADA                        268 00117$:
                                    269 ;	./../../mib/stm8s_mib_vsprintf.c: 123: if (type & SPECIAL)
      008ADA 7B 78            [ 1]  270 	ld	a, (0x78, sp)
      008ADC A4 20            [ 1]  271 	and	a, #0x20
      008ADE 6B 4A            [ 1]  272 	ld	(0x4a, sp), a
      008AE0 5F               [ 1]  273 	clrw	x
      008AE1 1F 48            [ 2]  274 	ldw	(0x48, sp), x
      008AE3 0F 47            [ 1]  275 	clr	(0x47, sp)
                                    276 ;	./../../mib/stm8s_mib_vsprintf.c: 125: if (base == 16)
      008AE5 1E 6B            [ 2]  277 	ldw	x, (0x6b, sp)
      008AE7 A3 00 10         [ 2]  278 	cpw	x, #0x0010
      008AEA 26 09            [ 1]  279 	jrne	00335$
      008AEC 1E 69            [ 2]  280 	ldw	x, (0x69, sp)
      008AEE 26 05            [ 1]  281 	jrne	00335$
      008AF0 A6 01            [ 1]  282 	ld	a, #0x01
      008AF2 6B 4B            [ 1]  283 	ld	(0x4b, sp), a
      008AF4 C5                     284 	.byte 0xc5
      008AF5                        285 00335$:
      008AF5 0F 4B            [ 1]  286 	clr	(0x4b, sp)
      008AF7                        287 00336$:
                                    288 ;	./../../mib/stm8s_mib_vsprintf.c: 127: else if (base == 8)
      008AF7 1E 6B            [ 2]  289 	ldw	x, (0x6b, sp)
      008AF9 A3 00 08         [ 2]  290 	cpw	x, #0x0008
      008AFC 26 09            [ 1]  291 	jrne	00338$
      008AFE 1E 69            [ 2]  292 	ldw	x, (0x69, sp)
      008B00 26 05            [ 1]  293 	jrne	00338$
      008B02 A6 01            [ 1]  294 	ld	a, #0x01
      008B04 6B 4C            [ 1]  295 	ld	(0x4c, sp), a
      008B06 C5                     296 	.byte 0xc5
      008B07                        297 00338$:
      008B07 0F 4C            [ 1]  298 	clr	(0x4c, sp)
      008B09                        299 00339$:
                                    300 ;	./../../mib/stm8s_mib_vsprintf.c: 123: if (type & SPECIAL)
      008B09 1E 49            [ 2]  301 	ldw	x, (0x49, sp)
      008B0B 26 04            [ 1]  302 	jrne	00340$
      008B0D 1E 47            [ 2]  303 	ldw	x, (0x47, sp)
      008B0F 27 28            [ 1]  304 	jreq	00124$
      008B11                        305 00340$:
                                    306 ;	./../../mib/stm8s_mib_vsprintf.c: 125: if (base == 16)
      008B11 0D 4B            [ 1]  307 	tnz	(0x4b, sp)
      008B13 27 11            [ 1]  308 	jreq	00121$
                                    309 ;	./../../mib/stm8s_mib_vsprintf.c: 126: size -= 2;
      008B15 1E 6F            [ 2]  310 	ldw	x, (0x6f, sp)
      008B17 1D 00 02         [ 2]  311 	subw	x, #0x0002
      008B1A 16 6D            [ 2]  312 	ldw	y, (0x6d, sp)
      008B1C 24 02            [ 1]  313 	jrnc	00342$
      008B1E 90 5A            [ 2]  314 	decw	y
      008B20                        315 00342$:
      008B20 1F 6F            [ 2]  316 	ldw	(0x6f, sp), x
      008B22 17 6D            [ 2]  317 	ldw	(0x6d, sp), y
      008B24 20 13            [ 2]  318 	jra	00124$
      008B26                        319 00121$:
                                    320 ;	./../../mib/stm8s_mib_vsprintf.c: 127: else if (base == 8)
      008B26 0D 4C            [ 1]  321 	tnz	(0x4c, sp)
      008B28 27 0F            [ 1]  322 	jreq	00124$
                                    323 ;	./../../mib/stm8s_mib_vsprintf.c: 128: size--;
      008B2A 1E 6F            [ 2]  324 	ldw	x, (0x6f, sp)
      008B2C 1D 00 01         [ 2]  325 	subw	x, #0x0001
      008B2F 16 6D            [ 2]  326 	ldw	y, (0x6d, sp)
      008B31 24 02            [ 1]  327 	jrnc	00344$
      008B33 90 5A            [ 2]  328 	decw	y
      008B35                        329 00344$:
      008B35 1F 6F            [ 2]  330 	ldw	(0x6f, sp), x
      008B37 17 6D            [ 2]  331 	ldw	(0x6d, sp), y
      008B39                        332 00124$:
                                    333 ;	./../../mib/stm8s_mib_vsprintf.c: 133: if (num == 0)
      008B39 1E 67            [ 2]  334 	ldw	x, (0x67, sp)
      008B3B 26 10            [ 1]  335 	jrne	00178$
                                    336 ;	./../../mib/stm8s_mib_vsprintf.c: 134: tmp[i++] = '0';
      008B3D 1E 65            [ 2]  337 	ldw	x, (0x65, sp)
      008B3F 26 0C            [ 1]  338 	jrne	00178$
      008B41 5C               [ 1]  339 	incw	x
      008B42 1F 59            [ 2]  340 	ldw	(0x59, sp), x
      008B44 5F               [ 1]  341 	clrw	x
      008B45 1F 57            [ 2]  342 	ldw	(0x57, sp), x
      008B47 A6 30            [ 1]  343 	ld	a, #0x30
      008B49 6B 01            [ 1]  344 	ld	(0x01, sp), a
      008B4B 20 70            [ 2]  345 	jra	00130$
                                    346 ;	./../../mib/stm8s_mib_vsprintf.c: 137: while (num != 0)
      008B4D                        347 00178$:
      008B4D 5F               [ 1]  348 	clrw	x
      008B4E 1F 61            [ 2]  349 	ldw	(0x61, sp), x
      008B50 1F 5F            [ 2]  350 	ldw	(0x5f, sp), x
      008B52                        351 00125$:
      008B52 1E 67            [ 2]  352 	ldw	x, (0x67, sp)
      008B54 26 04            [ 1]  353 	jrne	00347$
      008B56 1E 65            [ 2]  354 	ldw	x, (0x65, sp)
      008B58 27 5B            [ 1]  355 	jreq	00194$
      008B5A                        356 00347$:
                                    357 ;	./../../mib/stm8s_mib_vsprintf.c: 139: tmp[i++] = dig[((MMULONG) num) % (MMUSIGN) base];
      008B5A 16 61            [ 2]  358 	ldw	y, (0x61, sp)
      008B5C 17 59            [ 2]  359 	ldw	(0x59, sp), y
      008B5E 16 5F            [ 2]  360 	ldw	y, (0x5f, sp)
      008B60 17 57            [ 2]  361 	ldw	(0x57, sp), y
      008B62 1E 61            [ 2]  362 	ldw	x, (0x61, sp)
      008B64 5C               [ 1]  363 	incw	x
      008B65 1F 61            [ 2]  364 	ldw	(0x61, sp), x
      008B67 26 05            [ 1]  365 	jrne	00348$
      008B69 1E 5F            [ 2]  366 	ldw	x, (0x5f, sp)
      008B6B 5C               [ 1]  367 	incw	x
      008B6C 1F 5F            [ 2]  368 	ldw	(0x5f, sp), x
      008B6E                        369 00348$:
      008B6E 96               [ 1]  370 	ldw	x, sp
      008B6F 5C               [ 1]  371 	incw	x
      008B70 72 FB 59         [ 2]  372 	addw	x, (0x59, sp)
      008B73 1F 4D            [ 2]  373 	ldw	(0x4d, sp), x
      008B75 16 65            [ 2]  374 	ldw	y, (0x65, sp)
      008B77 17 4F            [ 2]  375 	ldw	(0x4f, sp), y
      008B79 16 67            [ 2]  376 	ldw	y, (0x67, sp)
      008B7B 1E 6B            [ 2]  377 	ldw	x, (0x6b, sp)
      008B7D 1F 55            [ 2]  378 	ldw	(0x55, sp), x
      008B7F 5F               [ 1]  379 	clrw	x
      008B80 1F 53            [ 2]  380 	ldw	(0x53, sp), x
      008B82 90 89            [ 2]  381 	pushw	y
      008B84 1E 57            [ 2]  382 	ldw	x, (0x57, sp)
      008B86 89               [ 2]  383 	pushw	x
      008B87 1E 57            [ 2]  384 	ldw	x, (0x57, sp)
      008B89 89               [ 2]  385 	pushw	x
      008B8A 90 89            [ 2]  386 	pushw	y
      008B8C 1E 57            [ 2]  387 	ldw	x, (0x57, sp)
      008B8E 89               [ 2]  388 	pushw	x
      008B8F CD A0 D8         [ 4]  389 	call	__modulong
      008B92 5B 08            [ 2]  390 	addw	sp, #8
      008B94 17 59            [ 2]  391 	ldw	(0x59, sp), y
      008B96 90 85            [ 2]  392 	popw	y
      008B98 72 FB 43         [ 2]  393 	addw	x, (0x43, sp)
      008B9B F6               [ 1]  394 	ld	a, (x)
      008B9C 1E 4D            [ 2]  395 	ldw	x, (0x4d, sp)
      008B9E F7               [ 1]  396 	ld	(x), a
                                    397 ;	./../../mib/stm8s_mib_vsprintf.c: 140: num = ((MMULONG) num) / (MMUSIGN) base;
      008B9F 1E 55            [ 2]  398 	ldw	x, (0x55, sp)
      008BA1 89               [ 2]  399 	pushw	x
      008BA2 1E 55            [ 2]  400 	ldw	x, (0x55, sp)
      008BA4 89               [ 2]  401 	pushw	x
      008BA5 90 89            [ 2]  402 	pushw	y
      008BA7 1E 55            [ 2]  403 	ldw	x, (0x55, sp)
      008BA9 89               [ 2]  404 	pushw	x
      008BAA CD A1 88         [ 4]  405 	call	__divulong
      008BAD 5B 08            [ 2]  406 	addw	sp, #8
      008BAF 1F 67            [ 2]  407 	ldw	(0x67, sp), x
      008BB1 17 65            [ 2]  408 	ldw	(0x65, sp), y
      008BB3 20 9D            [ 2]  409 	jra	00125$
      008BB5                        410 00194$:
      008BB5 16 61            [ 2]  411 	ldw	y, (0x61, sp)
      008BB7 17 59            [ 2]  412 	ldw	(0x59, sp), y
      008BB9 16 5F            [ 2]  413 	ldw	y, (0x5f, sp)
      008BBB 17 57            [ 2]  414 	ldw	(0x57, sp), y
      008BBD                        415 00130$:
                                    416 ;	./../../mib/stm8s_mib_vsprintf.c: 144: if (i > precision) precision = i;
      008BBD 1E 73            [ 2]  417 	ldw	x, (0x73, sp)
      008BBF 13 59            [ 2]  418 	cpw	x, (0x59, sp)
      008BC1 7B 72            [ 1]  419 	ld	a, (0x72, sp)
      008BC3 12 58            [ 1]  420 	sbc	a, (0x58, sp)
      008BC5 7B 71            [ 1]  421 	ld	a, (0x71, sp)
      008BC7 12 57            [ 1]  422 	sbc	a, (0x57, sp)
      008BC9 2E 08            [ 1]  423 	jrsge	00132$
      008BCB 16 59            [ 2]  424 	ldw	y, (0x59, sp)
      008BCD 17 73            [ 2]  425 	ldw	(0x73, sp), y
      008BCF 16 57            [ 2]  426 	ldw	y, (0x57, sp)
      008BD1 17 71            [ 2]  427 	ldw	(0x71, sp), y
      008BD3                        428 00132$:
                                    429 ;	./../../mib/stm8s_mib_vsprintf.c: 145: size -= precision;
      008BD3 16 6F            [ 2]  430 	ldw	y, (0x6f, sp)
      008BD5 72 F2 73         [ 2]  431 	subw	y, (0x73, sp)
      008BD8 7B 6E            [ 1]  432 	ld	a, (0x6e, sp)
      008BDA 12 72            [ 1]  433 	sbc	a, (0x72, sp)
      008BDC 97               [ 1]  434 	ld	xl, a
      008BDD 7B 6D            [ 1]  435 	ld	a, (0x6d, sp)
      008BDF 12 71            [ 1]  436 	sbc	a, (0x71, sp)
      008BE1 95               [ 1]  437 	ld	xh, a
      008BE2 17 6F            [ 2]  438 	ldw	(0x6f, sp), y
      008BE4 1F 6D            [ 2]  439 	ldw	(0x6d, sp), x
                                    440 ;	./../../mib/stm8s_mib_vsprintf.c: 146: if (!(type & (ZEROPAD | LEFT))) while (size-- > 0) *str++ = ' ';
      008BE6 7B 78            [ 1]  441 	ld	a, (0x78, sp)
      008BE8 A5 11            [ 1]  442 	bcp	a, #0x11
      008BEA 26 34            [ 1]  443 	jrne	00137$
      008BEC 16 6F            [ 2]  444 	ldw	y, (0x6f, sp)
      008BEE 17 61            [ 2]  445 	ldw	(0x61, sp), y
      008BF0 16 6D            [ 2]  446 	ldw	y, (0x6d, sp)
      008BF2                        447 00133$:
      008BF2 17 53            [ 2]  448 	ldw	(0x53, sp), y
      008BF4 1E 61            [ 2]  449 	ldw	x, (0x61, sp)
      008BF6 1F 55            [ 2]  450 	ldw	(0x55, sp), x
      008BF8 1E 61            [ 2]  451 	ldw	x, (0x61, sp)
      008BFA 1D 00 01         [ 2]  452 	subw	x, #0x0001
      008BFD 1F 61            [ 2]  453 	ldw	(0x61, sp), x
      008BFF 24 02            [ 1]  454 	jrnc	00351$
      008C01 90 5A            [ 2]  455 	decw	y
      008C03                        456 00351$:
      008C03 5F               [ 1]  457 	clrw	x
      008C04 13 55            [ 2]  458 	cpw	x, (0x55, sp)
      008C06 4F               [ 1]  459 	clr	a
      008C07 12 54            [ 1]  460 	sbc	a, (0x54, sp)
      008C09 4F               [ 1]  461 	clr	a
      008C0A 12 53            [ 1]  462 	sbc	a, (0x53, sp)
      008C0C 2E 0C            [ 1]  463 	jrsge	00195$
      008C0E 1E 5D            [ 2]  464 	ldw	x, (0x5d, sp)
      008C10 A6 20            [ 1]  465 	ld	a, #0x20
      008C12 F7               [ 1]  466 	ld	(x), a
      008C13 1E 5D            [ 2]  467 	ldw	x, (0x5d, sp)
      008C15 5C               [ 1]  468 	incw	x
      008C16 1F 5D            [ 2]  469 	ldw	(0x5d, sp), x
      008C18 20 D8            [ 2]  470 	jra	00133$
      008C1A                        471 00195$:
      008C1A 17 6D            [ 2]  472 	ldw	(0x6d, sp), y
      008C1C 16 61            [ 2]  473 	ldw	y, (0x61, sp)
      008C1E 17 6F            [ 2]  474 	ldw	(0x6f, sp), y
      008C20                        475 00137$:
                                    476 ;	./../../mib/stm8s_mib_vsprintf.c: 147: if (sign) *str++ = sign;
      008C20 0D 46            [ 1]  477 	tnz	(0x46, sp)
      008C22 27 0A            [ 1]  478 	jreq	00139$
      008C24 1E 5D            [ 2]  479 	ldw	x, (0x5d, sp)
      008C26 7B 46            [ 1]  480 	ld	a, (0x46, sp)
      008C28 F7               [ 1]  481 	ld	(x), a
      008C29 1E 5D            [ 2]  482 	ldw	x, (0x5d, sp)
      008C2B 5C               [ 1]  483 	incw	x
      008C2C 1F 5D            [ 2]  484 	ldw	(0x5d, sp), x
      008C2E                        485 00139$:
                                    486 ;	./../../mib/stm8s_mib_vsprintf.c: 149: if (type & SPECIAL)
      008C2E 1E 49            [ 2]  487 	ldw	x, (0x49, sp)
      008C30 26 04            [ 1]  488 	jrne	00356$
      008C32 1E 47            [ 2]  489 	ldw	x, (0x47, sp)
      008C34 27 26            [ 1]  490 	jreq	00146$
      008C36                        491 00356$:
                                    492 ;	./../../mib/stm8s_mib_vsprintf.c: 147: if (sign) *str++ = sign;
      008C36 1E 5D            [ 2]  493 	ldw	x, (0x5d, sp)
      008C38 5C               [ 1]  494 	incw	x
                                    495 ;	./../../mib/stm8s_mib_vsprintf.c: 151: if (base == 8)
      008C39 0D 4C            [ 1]  496 	tnz	(0x4c, sp)
      008C3B 27 0A            [ 1]  497 	jreq	00143$
                                    498 ;	./../../mib/stm8s_mib_vsprintf.c: 152: *str++ = '0';
      008C3D 16 5D            [ 2]  499 	ldw	y, (0x5d, sp)
      008C3F A6 30            [ 1]  500 	ld	a, #0x30
      008C41 90 F7            [ 1]  501 	ld	(y), a
      008C43 1F 5D            [ 2]  502 	ldw	(0x5d, sp), x
      008C45 20 15            [ 2]  503 	jra	00146$
      008C47                        504 00143$:
                                    505 ;	./../../mib/stm8s_mib_vsprintf.c: 153: else if (base == 16)
      008C47 0D 4B            [ 1]  506 	tnz	(0x4b, sp)
      008C49 27 11            [ 1]  507 	jreq	00146$
                                    508 ;	./../../mib/stm8s_mib_vsprintf.c: 155: *str++ = '0';
      008C4B 16 5D            [ 2]  509 	ldw	y, (0x5d, sp)
      008C4D A6 30            [ 1]  510 	ld	a, #0x30
      008C4F 90 F7            [ 1]  511 	ld	(y), a
                                    512 ;	./../../mib/stm8s_mib_vsprintf.c: 156: *str++ = digits[33];
      008C51 90 CE 01 4B      [ 2]  513 	ldw	y, _digits+0
      008C55 90 E6 21         [ 1]  514 	ld	a, (0x21, y)
      008C58 F7               [ 1]  515 	ld	(x), a
      008C59 5C               [ 1]  516 	incw	x
      008C5A 1F 5D            [ 2]  517 	ldw	(0x5d, sp), x
      008C5C                        518 00146$:
                                    519 ;	./../../mib/stm8s_mib_vsprintf.c: 160: if (!(type & LEFT)) while (size-- > 0) *str++ = c;
      008C5C 7B 78            [ 1]  520 	ld	a, (0x78, sp)
      008C5E A5 10            [ 1]  521 	bcp	a, #0x10
      008C60 26 3D            [ 1]  522 	jrne	00189$
      008C62 16 6F            [ 2]  523 	ldw	y, (0x6f, sp)
      008C64 17 61            [ 2]  524 	ldw	(0x61, sp), y
      008C66 16 6D            [ 2]  525 	ldw	y, (0x6d, sp)
      008C68 17 5F            [ 2]  526 	ldw	(0x5f, sp), y
      008C6A                        527 00147$:
      008C6A 16 61            [ 2]  528 	ldw	y, (0x61, sp)
      008C6C 17 55            [ 2]  529 	ldw	(0x55, sp), y
      008C6E 16 5F            [ 2]  530 	ldw	y, (0x5f, sp)
      008C70 17 53            [ 2]  531 	ldw	(0x53, sp), y
      008C72 1E 61            [ 2]  532 	ldw	x, (0x61, sp)
      008C74 1D 00 01         [ 2]  533 	subw	x, #0x0001
      008C77 1F 61            [ 2]  534 	ldw	(0x61, sp), x
      008C79 1E 5F            [ 2]  535 	ldw	x, (0x5f, sp)
      008C7B 24 01            [ 1]  536 	jrnc	00360$
      008C7D 5A               [ 2]  537 	decw	x
      008C7E                        538 00360$:
      008C7E 1F 5F            [ 2]  539 	ldw	(0x5f, sp), x
      008C80 5F               [ 1]  540 	clrw	x
      008C81 13 55            [ 2]  541 	cpw	x, (0x55, sp)
      008C83 4F               [ 1]  542 	clr	a
      008C84 12 54            [ 1]  543 	sbc	a, (0x54, sp)
      008C86 4F               [ 1]  544 	clr	a
      008C87 12 53            [ 1]  545 	sbc	a, (0x53, sp)
      008C89 2E 0C            [ 1]  546 	jrsge	00196$
      008C8B 1E 5D            [ 2]  547 	ldw	x, (0x5d, sp)
      008C8D 7B 45            [ 1]  548 	ld	a, (0x45, sp)
      008C8F F7               [ 1]  549 	ld	(x), a
      008C90 1E 5D            [ 2]  550 	ldw	x, (0x5d, sp)
      008C92 5C               [ 1]  551 	incw	x
      008C93 1F 5D            [ 2]  552 	ldw	(0x5d, sp), x
      008C95 20 D3            [ 2]  553 	jra	00147$
                                    554 ;	./../../mib/stm8s_mib_vsprintf.c: 161: while (i < precision--) *str++ = '0';
      008C97                        555 00196$:
      008C97 16 61            [ 2]  556 	ldw	y, (0x61, sp)
      008C99 17 6F            [ 2]  557 	ldw	(0x6f, sp), y
      008C9B 16 5F            [ 2]  558 	ldw	y, (0x5f, sp)
      008C9D 17 6D            [ 2]  559 	ldw	(0x6d, sp), y
      008C9F                        560 00189$:
      008C9F 16 5D            [ 2]  561 	ldw	y, (0x5d, sp)
      008CA1 1E 73            [ 2]  562 	ldw	x, (0x73, sp)
      008CA3 1F 61            [ 2]  563 	ldw	(0x61, sp), x
      008CA5 1E 71            [ 2]  564 	ldw	x, (0x71, sp)
      008CA7 1F 5F            [ 2]  565 	ldw	(0x5f, sp), x
      008CA9                        566 00152$:
      008CA9 1E 59            [ 2]  567 	ldw	x, (0x59, sp)
      008CAB 13 61            [ 2]  568 	cpw	x, (0x61, sp)
      008CAD 7B 58            [ 1]  569 	ld	a, (0x58, sp)
      008CAF 12 60            [ 1]  570 	sbc	a, (0x60, sp)
      008CB1 7B 57            [ 1]  571 	ld	a, (0x57, sp)
      008CB3 12 5F            [ 1]  572 	sbc	a, (0x5f, sp)
      008CB5 2E 16            [ 1]  573 	jrsge	00191$
      008CB7 1E 61            [ 2]  574 	ldw	x, (0x61, sp)
      008CB9 1D 00 01         [ 2]  575 	subw	x, #0x0001
      008CBC 1F 61            [ 2]  576 	ldw	(0x61, sp), x
      008CBE 1E 5F            [ 2]  577 	ldw	x, (0x5f, sp)
      008CC0 24 01            [ 1]  578 	jrnc	00364$
      008CC2 5A               [ 2]  579 	decw	x
      008CC3                        580 00364$:
      008CC3 1F 5F            [ 2]  581 	ldw	(0x5f, sp), x
      008CC5 A6 30            [ 1]  582 	ld	a, #0x30
      008CC7 90 F7            [ 1]  583 	ld	(y), a
      008CC9 90 5C            [ 1]  584 	incw	y
      008CCB 20 DC            [ 2]  585 	jra	00152$
                                    586 ;	./../../mib/stm8s_mib_vsprintf.c: 162: while (i-- > 0) *str++ = tmp[i];
      008CCD                        587 00191$:
      008CCD 17 5B            [ 2]  588 	ldw	(0x5b, sp), y
      008CCF 16 59            [ 2]  589 	ldw	y, (0x59, sp)
      008CD1 17 61            [ 2]  590 	ldw	(0x61, sp), y
      008CD3 16 57            [ 2]  591 	ldw	y, (0x57, sp)
      008CD5 17 5F            [ 2]  592 	ldw	(0x5f, sp), y
      008CD7                        593 00155$:
      008CD7 5F               [ 1]  594 	clrw	x
      008CD8 13 61            [ 2]  595 	cpw	x, (0x61, sp)
      008CDA 4F               [ 1]  596 	clr	a
      008CDB 12 60            [ 1]  597 	sbc	a, (0x60, sp)
      008CDD 4F               [ 1]  598 	clr	a
      008CDE 12 5F            [ 1]  599 	sbc	a, (0x5f, sp)
      008CE0 2E 1E            [ 1]  600 	jrsge	00193$
      008CE2 1E 61            [ 2]  601 	ldw	x, (0x61, sp)
      008CE4 1D 00 01         [ 2]  602 	subw	x, #0x0001
      008CE7 1F 61            [ 2]  603 	ldw	(0x61, sp), x
      008CE9 1E 5F            [ 2]  604 	ldw	x, (0x5f, sp)
      008CEB 24 01            [ 1]  605 	jrnc	00366$
      008CED 5A               [ 2]  606 	decw	x
      008CEE                        607 00366$:
      008CEE 1F 5F            [ 2]  608 	ldw	(0x5f, sp), x
      008CF0 96               [ 1]  609 	ldw	x, sp
      008CF1 5C               [ 1]  610 	incw	x
      008CF2 72 FB 61         [ 2]  611 	addw	x, (0x61, sp)
      008CF5 F6               [ 1]  612 	ld	a, (x)
      008CF6 1E 5B            [ 2]  613 	ldw	x, (0x5b, sp)
      008CF8 F7               [ 1]  614 	ld	(x), a
      008CF9 1E 5B            [ 2]  615 	ldw	x, (0x5b, sp)
      008CFB 5C               [ 1]  616 	incw	x
      008CFC 1F 5B            [ 2]  617 	ldw	(0x5b, sp), x
      008CFE 20 D7            [ 2]  618 	jra	00155$
                                    619 ;	./../../mib/stm8s_mib_vsprintf.c: 163: while (size-- > 0) *str++ = ' ';
      008D00                        620 00193$:
      008D00 16 5B            [ 2]  621 	ldw	y, (0x5b, sp)
      008D02 1E 6F            [ 2]  622 	ldw	x, (0x6f, sp)
      008D04 1F 61            [ 2]  623 	ldw	(0x61, sp), x
      008D06 1E 6D            [ 2]  624 	ldw	x, (0x6d, sp)
      008D08 1F 5F            [ 2]  625 	ldw	(0x5f, sp), x
      008D0A                        626 00158$:
      008D0A 5F               [ 1]  627 	clrw	x
      008D0B 13 61            [ 2]  628 	cpw	x, (0x61, sp)
      008D0D 4F               [ 1]  629 	clr	a
      008D0E 12 60            [ 1]  630 	sbc	a, (0x60, sp)
      008D10 4F               [ 1]  631 	clr	a
      008D11 12 5F            [ 1]  632 	sbc	a, (0x5f, sp)
      008D13 2E 16            [ 1]  633 	jrsge	00160$
      008D15 1E 61            [ 2]  634 	ldw	x, (0x61, sp)
      008D17 1D 00 01         [ 2]  635 	subw	x, #0x0001
      008D1A 1F 61            [ 2]  636 	ldw	(0x61, sp), x
      008D1C 1E 5F            [ 2]  637 	ldw	x, (0x5f, sp)
      008D1E 24 01            [ 1]  638 	jrnc	00369$
      008D20 5A               [ 2]  639 	decw	x
      008D21                        640 00369$:
      008D21 1F 5F            [ 2]  641 	ldw	(0x5f, sp), x
      008D23 A6 20            [ 1]  642 	ld	a, #0x20
      008D25 90 F7            [ 1]  643 	ld	(y), a
      008D27 90 5C            [ 1]  644 	incw	y
      008D29 20 DF            [ 2]  645 	jra	00158$
      008D2B                        646 00160$:
                                    647 ;	./../../mib/stm8s_mib_vsprintf.c: 165: return str;
      008D2B 93               [ 1]  648 	ldw	x, y
      008D2C                        649 00161$:
                                    650 ;	./../../mib/stm8s_mib_vsprintf.c: 166: }
      008D2C 16 63            [ 2]  651 	ldw	y, (99, sp)
      008D2E 5B 78            [ 2]  652 	addw	sp, #120
      008D30 90 FC            [ 2]  653 	jp	(y)
                                    654 ;	./../../mib/stm8s_mib_vsprintf.c: 172: MMRINT mm_vsprintf(char *buf, const char *fmt, va_list args)
                                    655 ;	-----------------------------------------
                                    656 ;	 function mm_vsprintf
                                    657 ;	-----------------------------------------
      008D32                        658 _mm_vsprintf:
      008D32 52 21            [ 2]  659 	sub	sp, #33
      008D34 1F 1A            [ 2]  660 	ldw	(0x1a, sp), x
                                    661 ;	./../../mib/stm8s_mib_vsprintf.c: 186: char vStr[] = "<NULL>";
      008D36 A6 3C            [ 1]  662 	ld	a, #0x3c
      008D38 6B 0D            [ 1]  663 	ld	(0x0d, sp), a
      008D3A A6 4E            [ 1]  664 	ld	a, #0x4e
      008D3C 6B 0E            [ 1]  665 	ld	(0x0e, sp), a
      008D3E A6 55            [ 1]  666 	ld	a, #0x55
      008D40 6B 0F            [ 1]  667 	ld	(0x0f, sp), a
      008D42 A6 4C            [ 1]  668 	ld	a, #0x4c
      008D44 6B 10            [ 1]  669 	ld	(0x10, sp), a
      008D46 6B 11            [ 1]  670 	ld	(0x11, sp), a
      008D48 A6 3E            [ 1]  671 	ld	a, #0x3e
      008D4A 6B 12            [ 1]  672 	ld	(0x12, sp), a
      008D4C 0F 13            [ 1]  673 	clr	(0x13, sp)
                                    674 ;	./../../mib/stm8s_mib_vsprintf.c: 188: for (str = buf; *fmt; fmt++)
      008D4E 16 1A            [ 2]  675 	ldw	y, (0x1a, sp)
      008D50 17 1C            [ 2]  676 	ldw	(0x1c, sp), y
      008D52                        677 00185$:
      008D52 16 24            [ 2]  678 	ldw	y, (0x24, sp)
      008D54 17 20            [ 2]  679 	ldw	(0x20, sp), y
      008D56 93               [ 1]  680 	ldw	x, y
      008D57 F6               [ 1]  681 	ld	a, (x)
      008D58 6B 1F            [ 1]  682 	ld	(0x1f, sp), a
      008D5A 26 03            [ 1]  683 	jrne	00437$
      008D5C CC 91 57         [ 2]  684 	jp	00180$
      008D5F                        685 00437$:
                                    686 ;	./../../mib/stm8s_mib_vsprintf.c: 190: if (*fmt != '%')
      008D5F 7B 1F            [ 1]  687 	ld	a, (0x1f, sp)
      008D61 A1 25            [ 1]  688 	cp	a, #0x25
      008D63 27 0D            [ 1]  689 	jreq	00102$
                                    690 ;	./../../mib/stm8s_mib_vsprintf.c: 192: *str++ = *fmt;
      008D65 1E 1C            [ 2]  691 	ldw	x, (0x1c, sp)
      008D67 7B 1F            [ 1]  692 	ld	a, (0x1f, sp)
      008D69 F7               [ 1]  693 	ld	(x), a
      008D6A 1E 1C            [ 2]  694 	ldw	x, (0x1c, sp)
      008D6C 5C               [ 1]  695 	incw	x
      008D6D 1F 1C            [ 2]  696 	ldw	(0x1c, sp), x
                                    697 ;	./../../mib/stm8s_mib_vsprintf.c: 193: continue;
      008D6F CC 91 4F         [ 2]  698 	jp	00179$
      008D72                        699 00102$:
                                    700 ;	./../../mib/stm8s_mib_vsprintf.c: 197: flags = 0;
      008D72 5F               [ 1]  701 	clrw	x
      008D73 1F 0B            [ 2]  702 	ldw	(0x0b, sp), x
      008D75 1F 09            [ 2]  703 	ldw	(0x09, sp), x
                                    704 ;	./../../mib/stm8s_mib_vsprintf.c: 198: repeat:
      008D77 1E 20            [ 2]  705 	ldw	x, (0x20, sp)
      008D79                        706 00103$:
                                    707 ;	./../../mib/stm8s_mib_vsprintf.c: 199: fmt++; // This also skips first '%'
      008D79 5C               [ 1]  708 	incw	x
      008D7A 1F 24            [ 2]  709 	ldw	(0x24, sp), x
                                    710 ;	./../../mib/stm8s_mib_vsprintf.c: 200: switch (*fmt)
      008D7C F6               [ 1]  711 	ld	a, (x)
      008D7D 6B 19            [ 1]  712 	ld	(0x19, sp), a
      008D7F A1 20            [ 1]  713 	cp	a, #0x20
      008D81 27 2C            [ 1]  714 	jreq	00106$
      008D83 7B 19            [ 1]  715 	ld	a, (0x19, sp)
      008D85 A1 23            [ 1]  716 	cp	a, #0x23
      008D87 27 2E            [ 1]  717 	jreq	00107$
      008D89 7B 19            [ 1]  718 	ld	a, (0x19, sp)
      008D8B A1 2B            [ 1]  719 	cp	a, #0x2b
      008D8D 27 18            [ 1]  720 	jreq	00105$
      008D8F 7B 19            [ 1]  721 	ld	a, (0x19, sp)
      008D91 A1 2D            [ 1]  722 	cp	a, #0x2d
      008D93 27 0A            [ 1]  723 	jreq	00104$
      008D95 7B 19            [ 1]  724 	ld	a, (0x19, sp)
      008D97 A1 30            [ 1]  725 	cp	a, #0x30
      008D99 27 24            [ 1]  726 	jreq	00108$
      008D9B 1F 24            [ 2]  727 	ldw	(0x24, sp), x
      008D9D 20 27            [ 2]  728 	jra	00109$
                                    729 ;	./../../mib/stm8s_mib_vsprintf.c: 202: case '-': flags |= LEFT; goto repeat;
      008D9F                        730 00104$:
      008D9F 7B 0C            [ 1]  731 	ld	a, (0x0c, sp)
      008DA1 AA 10            [ 1]  732 	or	a, #0x10
      008DA3 6B 0C            [ 1]  733 	ld	(0x0c, sp), a
      008DA5 20 D2            [ 2]  734 	jra	00103$
                                    735 ;	./../../mib/stm8s_mib_vsprintf.c: 203: case '+': flags |= PLUS; goto repeat;
      008DA7                        736 00105$:
      008DA7 7B 0C            [ 1]  737 	ld	a, (0x0c, sp)
      008DA9 AA 04            [ 1]  738 	or	a, #0x04
      008DAB 6B 0C            [ 1]  739 	ld	(0x0c, sp), a
      008DAD 20 CA            [ 2]  740 	jra	00103$
                                    741 ;	./../../mib/stm8s_mib_vsprintf.c: 204: case ' ': flags |= SPACE; goto repeat;
      008DAF                        742 00106$:
      008DAF 7B 0C            [ 1]  743 	ld	a, (0x0c, sp)
      008DB1 AA 08            [ 1]  744 	or	a, #0x08
      008DB3 6B 0C            [ 1]  745 	ld	(0x0c, sp), a
      008DB5 20 C2            [ 2]  746 	jra	00103$
                                    747 ;	./../../mib/stm8s_mib_vsprintf.c: 205: case '#': flags |= SPECIAL; goto repeat;
      008DB7                        748 00107$:
      008DB7 7B 0C            [ 1]  749 	ld	a, (0x0c, sp)
      008DB9 AA 20            [ 1]  750 	or	a, #0x20
      008DBB 6B 0C            [ 1]  751 	ld	(0x0c, sp), a
      008DBD 20 BA            [ 2]  752 	jra	00103$
                                    753 ;	./../../mib/stm8s_mib_vsprintf.c: 206: case '0': flags |= ZEROPAD; goto repeat;
      008DBF                        754 00108$:
      008DBF 04 0C            [ 1]  755 	srl	(0x0c, sp)
      008DC1 99               [ 1]  756 	scf
      008DC2 09 0C            [ 1]  757 	rlc	(0x0c, sp)
      008DC4 20 B3            [ 2]  758 	jra	00103$
                                    759 ;	./../../mib/stm8s_mib_vsprintf.c: 207: }
      008DC6                        760 00109$:
                                    761 ;	./../../mib/stm8s_mib_vsprintf.c: 210: field_width = -1;
      008DC6 5F               [ 1]  762 	clrw	x
      008DC7 5A               [ 2]  763 	decw	x
      008DC8 1F 20            [ 2]  764 	ldw	(0x20, sp), x
      008DCA 1F 1E            [ 2]  765 	ldw	(0x1e, sp), x
                                    766 ;	./../../mib/stm8s_mib_vsprintf.c: 211: if (is_digit(*fmt))
      008DCC 7B 19            [ 1]  767 	ld	a, (0x19, sp)
      008DCE A1 30            [ 1]  768 	cp	a, #0x30
      008DD0 25 11            [ 1]  769 	jrc	00115$
      008DD2 A1 39            [ 1]  770 	cp	a, #0x39
      008DD4 22 0D            [ 1]  771 	jrugt	00115$
                                    772 ;	./../../mib/stm8s_mib_vsprintf.c: 212: field_width = skip_atoi(&fmt);
      008DD6 96               [ 1]  773 	ldw	x, sp
      008DD7 1C 00 24         [ 2]  774 	addw	x, #36
      008DDA CD 89 D6         [ 4]  775 	call	_skip_atoi
      008DDD 1F 20            [ 2]  776 	ldw	(0x20, sp), x
      008DDF 17 1E            [ 2]  777 	ldw	(0x1e, sp), y
      008DE1 20 39            [ 2]  778 	jra	00116$
      008DE3                        779 00115$:
                                    780 ;	./../../mib/stm8s_mib_vsprintf.c: 213: else if (*fmt == '*')
      008DE3 1E 24            [ 2]  781 	ldw	x, (0x24, sp)
      008DE5 F6               [ 1]  782 	ld	a, (x)
      008DE6 A1 2A            [ 1]  783 	cp	a, #0x2a
      008DE8 26 32            [ 1]  784 	jrne	00116$
                                    785 ;	./../../mib/stm8s_mib_vsprintf.c: 215: fmt++;
      008DEA 5C               [ 1]  786 	incw	x
      008DEB 1F 24            [ 2]  787 	ldw	(0x24, sp), x
                                    788 ;	./../../mib/stm8s_mib_vsprintf.c: 216: field_width = va_arg(args, MMINT);
      008DED 1E 26            [ 2]  789 	ldw	x, (0x26, sp)
      008DEF 1C 00 04         [ 2]  790 	addw	x, #0x0004
      008DF2 1F 26            [ 2]  791 	ldw	(0x26, sp), x
      008DF4 1D 00 04         [ 2]  792 	subw	x, #0x0004
      008DF7 90 93            [ 1]  793 	ldw	y, x
      008DF9 90 EE 02         [ 2]  794 	ldw	y, (0x2, y)
      008DFC FE               [ 2]  795 	ldw	x, (x)
      008DFD 17 20            [ 2]  796 	ldw	(0x20, sp), y
      008DFF 1F 1E            [ 2]  797 	ldw	(0x1e, sp), x
                                    798 ;	./../../mib/stm8s_mib_vsprintf.c: 217: if (field_width < 0)
      008E01 0D 1E            [ 1]  799 	tnz	(0x1e, sp)
      008E03 2A 17            [ 1]  800 	jrpl	00116$
                                    801 ;	./../../mib/stm8s_mib_vsprintf.c: 219: field_width = -field_width;
      008E05 00 21            [ 1]  802 	neg	(0x21, sp)
      008E07 4F               [ 1]  803 	clr	a
      008E08 12 20            [ 1]  804 	sbc	a, (0x20, sp)
      008E0A 6B 20            [ 1]  805 	ld	(0x20, sp), a
      008E0C 4F               [ 1]  806 	clr	a
      008E0D 12 1F            [ 1]  807 	sbc	a, (0x1f, sp)
      008E0F 6B 1F            [ 1]  808 	ld	(0x1f, sp), a
      008E11 4F               [ 1]  809 	clr	a
      008E12 12 1E            [ 1]  810 	sbc	a, (0x1e, sp)
      008E14 6B 1E            [ 1]  811 	ld	(0x1e, sp), a
                                    812 ;	./../../mib/stm8s_mib_vsprintf.c: 220: flags |= LEFT;
      008E16 7B 0C            [ 1]  813 	ld	a, (0x0c, sp)
      008E18 AA 10            [ 1]  814 	or	a, #0x10
      008E1A 6B 0C            [ 1]  815 	ld	(0x0c, sp), a
      008E1C                        816 00116$:
                                    817 ;	./../../mib/stm8s_mib_vsprintf.c: 225: precision = -1;
      008E1C 5F               [ 1]  818 	clrw	x
      008E1D 5A               [ 2]  819 	decw	x
      008E1E 1F 18            [ 2]  820 	ldw	(0x18, sp), x
      008E20 1F 16            [ 2]  821 	ldw	(0x16, sp), x
                                    822 ;	./../../mib/stm8s_mib_vsprintf.c: 226: if (*fmt == '.')
      008E22 16 24            [ 2]  823 	ldw	y, (0x24, sp)
      008E24 17 14            [ 2]  824 	ldw	(0x14, sp), y
      008E26 93               [ 1]  825 	ldw	x, y
      008E27 F6               [ 1]  826 	ld	a, (x)
      008E28 A1 2E            [ 1]  827 	cp	a, #0x2e
      008E2A 26 42            [ 1]  828 	jrne	00127$
                                    829 ;	./../../mib/stm8s_mib_vsprintf.c: 228: ++fmt;    
      008E2C 1E 14            [ 2]  830 	ldw	x, (0x14, sp)
      008E2E 5C               [ 1]  831 	incw	x
                                    832 ;	./../../mib/stm8s_mib_vsprintf.c: 229: if (is_digit(*fmt))
      008E2F 1F 24            [ 2]  833 	ldw	(0x24, sp), x
      008E31 F6               [ 1]  834 	ld	a, (x)
      008E32 A1 30            [ 1]  835 	cp	a, #0x30
      008E34 25 11            [ 1]  836 	jrc	00121$
      008E36 A1 39            [ 1]  837 	cp	a, #0x39
      008E38 22 0D            [ 1]  838 	jrugt	00121$
                                    839 ;	./../../mib/stm8s_mib_vsprintf.c: 230: precision = skip_atoi(&fmt);
      008E3A 96               [ 1]  840 	ldw	x, sp
      008E3B 1C 00 24         [ 2]  841 	addw	x, #36
      008E3E CD 89 D6         [ 4]  842 	call	_skip_atoi
      008E41 1F 18            [ 2]  843 	ldw	(0x18, sp), x
      008E43 17 16            [ 2]  844 	ldw	(0x16, sp), y
      008E45 20 1E            [ 2]  845 	jra	00122$
      008E47                        846 00121$:
                                    847 ;	./../../mib/stm8s_mib_vsprintf.c: 231: else if (*fmt == '*')
      008E47 1E 24            [ 2]  848 	ldw	x, (0x24, sp)
      008E49 F6               [ 1]  849 	ld	a, (x)
      008E4A A1 2A            [ 1]  850 	cp	a, #0x2a
      008E4C 26 17            [ 1]  851 	jrne	00122$
                                    852 ;	./../../mib/stm8s_mib_vsprintf.c: 233: ++fmt;
      008E4E 5C               [ 1]  853 	incw	x
      008E4F 1F 24            [ 2]  854 	ldw	(0x24, sp), x
                                    855 ;	./../../mib/stm8s_mib_vsprintf.c: 234: precision = va_arg(args, MMINT);
      008E51 1E 26            [ 2]  856 	ldw	x, (0x26, sp)
      008E53 1C 00 04         [ 2]  857 	addw	x, #0x0004
      008E56 1F 26            [ 2]  858 	ldw	(0x26, sp), x
      008E58 1D 00 04         [ 2]  859 	subw	x, #0x0004
      008E5B 90 93            [ 1]  860 	ldw	y, x
      008E5D 90 EE 02         [ 2]  861 	ldw	y, (0x2, y)
      008E60 FE               [ 2]  862 	ldw	x, (x)
      008E61 17 18            [ 2]  863 	ldw	(0x18, sp), y
      008E63 1F 16            [ 2]  864 	ldw	(0x16, sp), x
      008E65                        865 00122$:
                                    866 ;	./../../mib/stm8s_mib_vsprintf.c: 236: if (precision < 0) precision = 0;
      008E65 0D 16            [ 1]  867 	tnz	(0x16, sp)
      008E67 2A 05            [ 1]  868 	jrpl	00127$
      008E69 5F               [ 1]  869 	clrw	x
      008E6A 1F 18            [ 2]  870 	ldw	(0x18, sp), x
      008E6C 1F 16            [ 2]  871 	ldw	(0x16, sp), x
      008E6E                        872 00127$:
                                    873 ;	./../../mib/stm8s_mib_vsprintf.c: 240: qualifier = -1;
      008E6E 5F               [ 1]  874 	clrw	x
      008E6F 5A               [ 2]  875 	decw	x
      008E70 1F 03            [ 2]  876 	ldw	(0x03, sp), x
      008E72 1F 01            [ 2]  877 	ldw	(0x01, sp), x
                                    878 ;	./../../mib/stm8s_mib_vsprintf.c: 241: if (*fmt == 'h' || *fmt == 'l' || *fmt == 'L')
      008E74 1E 24            [ 2]  879 	ldw	x, (0x24, sp)
      008E76 F6               [ 1]  880 	ld	a, (x)
      008E77 6B 15            [ 1]  881 	ld	(0x15, sp), a
      008E79 A1 68            [ 1]  882 	cp	a, #0x68
      008E7B 27 0C            [ 1]  883 	jreq	00128$
      008E7D 7B 15            [ 1]  884 	ld	a, (0x15, sp)
      008E7F A1 6C            [ 1]  885 	cp	a, #0x6c
      008E81 27 06            [ 1]  886 	jreq	00128$
      008E83 7B 15            [ 1]  887 	ld	a, (0x15, sp)
      008E85 A1 4C            [ 1]  888 	cp	a, #0x4c
      008E87 26 0E            [ 1]  889 	jrne	00129$
      008E89                        890 00128$:
                                    891 ;	./../../mib/stm8s_mib_vsprintf.c: 243: qualifier = *fmt;
      008E89 1E 24            [ 2]  892 	ldw	x, (0x24, sp)
      008E8B F6               [ 1]  893 	ld	a, (x)
      008E8C 6B 04            [ 1]  894 	ld	(0x04, sp), a
      008E8E 0F 03            [ 1]  895 	clr	(0x03, sp)
      008E90 0F 02            [ 1]  896 	clr	(0x02, sp)
      008E92 0F 01            [ 1]  897 	clr	(0x01, sp)
                                    898 ;	./../../mib/stm8s_mib_vsprintf.c: 244: fmt++;
      008E94 5C               [ 1]  899 	incw	x
      008E95 1F 24            [ 2]  900 	ldw	(0x24, sp), x
      008E97                        901 00129$:
                                    902 ;	./../../mib/stm8s_mib_vsprintf.c: 248: base = 10;
      008E97 AE 00 0A         [ 2]  903 	ldw	x, #0x000a
      008E9A 1F 07            [ 2]  904 	ldw	(0x07, sp), x
      008E9C 5F               [ 1]  905 	clrw	x
      008E9D 1F 05            [ 2]  906 	ldw	(0x05, sp), x
                                    907 ;	./../../mib/stm8s_mib_vsprintf.c: 250: switch (*fmt)
      008E9F 16 24            [ 2]  908 	ldw	y, (0x24, sp)
      008EA1 17 14            [ 2]  909 	ldw	(0x14, sp), y
      008EA3 93               [ 1]  910 	ldw	x, y
      008EA4 F6               [ 1]  911 	ld	a, (x)
      008EA5 A1 58            [ 1]  912 	cp	a, #0x58
      008EA7 26 03            [ 1]  913 	jrne	00482$
      008EA9 CC 90 9F         [ 2]  914 	jp	00161$
      008EAC                        915 00482$:
      008EAC A1 63            [ 1]  916 	cp	a, #0x63
      008EAE 27 38            [ 1]  917 	jreq	00132$
      008EB0 A1 64            [ 1]  918 	cp	a, #0x64
      008EB2 26 03            [ 1]  919 	jrne	00488$
      008EB4 CC 90 AF         [ 2]  920 	jp	00164$
      008EB7                        921 00488$:
      008EB7 A1 69            [ 1]  922 	cp	a, #0x69
      008EB9 26 03            [ 1]  923 	jrne	00491$
      008EBB CC 90 AF         [ 2]  924 	jp	00164$
      008EBE                        925 00491$:
      008EBE A1 6E            [ 1]  926 	cp	a, #0x6e
      008EC0 26 03            [ 1]  927 	jrne	00494$
      008EC2 CC 90 4A         [ 2]  928 	jp	00156$
      008EC5                        929 00494$:
      008EC5 A1 6F            [ 1]  930 	cp	a, #0x6f
      008EC7 26 03            [ 1]  931 	jrne	00497$
      008EC9 CC 90 95         [ 2]  932 	jp	00160$
      008ECC                        933 00497$:
      008ECC A1 70            [ 1]  934 	cp	a, #0x70
      008ECE 26 03            [ 1]  935 	jrne	00500$
      008ED0 CC 8F FF         [ 2]  936 	jp	00153$
      008ED3                        937 00500$:
      008ED3 A1 73            [ 1]  938 	cp	a, #0x73
      008ED5 27 76            [ 1]  939 	jreq	00141$
      008ED7 A1 75            [ 1]  940 	cp	a, #0x75
      008ED9 26 03            [ 1]  941 	jrne	00506$
      008EDB CC 90 D9         [ 2]  942 	jp	00172$
      008EDE                        943 00506$:
      008EDE A1 78            [ 1]  944 	cp	a, #0x78
      008EE0 26 03            [ 1]  945 	jrne	00509$
      008EE2 CC 90 A5         [ 2]  946 	jp	00162$
      008EE5                        947 00509$:
      008EE5 CC 90 B7         [ 2]  948 	jp	00166$
                                    949 ;	./../../mib/stm8s_mib_vsprintf.c: 252: case 'c':
      008EE8                        950 00132$:
                                    951 ;	./../../mib/stm8s_mib_vsprintf.c: 253: if (!(flags & LEFT)) while (--field_width > 0) *str++ = ' ';
      008EE8 7B 0C            [ 1]  952 	ld	a, (0x0c, sp)
      008EEA A5 10            [ 1]  953 	bcp	a, #0x10
      008EEC 26 25            [ 1]  954 	jrne	00137$
      008EEE 16 1C            [ 2]  955 	ldw	y, (0x1c, sp)
      008EF0                        956 00133$:
      008EF0 1E 20            [ 2]  957 	ldw	x, (0x20, sp)
      008EF2 1D 00 01         [ 2]  958 	subw	x, #0x0001
      008EF5 1F 20            [ 2]  959 	ldw	(0x20, sp), x
      008EF7 1E 1E            [ 2]  960 	ldw	x, (0x1e, sp)
      008EF9 24 01            [ 1]  961 	jrnc	00512$
      008EFB 5A               [ 2]  962 	decw	x
      008EFC                        963 00512$:
      008EFC 1F 1E            [ 2]  964 	ldw	(0x1e, sp), x
      008EFE 5F               [ 1]  965 	clrw	x
      008EFF 13 20            [ 2]  966 	cpw	x, (0x20, sp)
      008F01 4F               [ 1]  967 	clr	a
      008F02 12 1F            [ 1]  968 	sbc	a, (0x1f, sp)
      008F04 4F               [ 1]  969 	clr	a
      008F05 12 1E            [ 1]  970 	sbc	a, (0x1e, sp)
      008F07 2E 08            [ 1]  971 	jrsge	00236$
      008F09 A6 20            [ 1]  972 	ld	a, #0x20
      008F0B 90 F7            [ 1]  973 	ld	(y), a
      008F0D 90 5C            [ 1]  974 	incw	y
      008F0F 20 DF            [ 2]  975 	jra	00133$
      008F11                        976 00236$:
      008F11 17 1C            [ 2]  977 	ldw	(0x1c, sp), y
      008F13                        978 00137$:
                                    979 ;	./../../mib/stm8s_mib_vsprintf.c: 254: *str++ = (MMUCHAR) va_arg(args, MMAINT); // test ok...
      008F13 1E 26            [ 2]  980 	ldw	x, (0x26, sp)
      008F15 5C               [ 1]  981 	incw	x
      008F16 5C               [ 1]  982 	incw	x
      008F17 1F 26            [ 2]  983 	ldw	(0x26, sp), x
      008F19 5A               [ 2]  984 	decw	x
      008F1A 5A               [ 2]  985 	decw	x
      008F1B E6 01            [ 1]  986 	ld	a, (0x1, x)
      008F1D 1E 1C            [ 2]  987 	ldw	x, (0x1c, sp)
      008F1F F7               [ 1]  988 	ld	(x), a
      008F20 1E 1C            [ 2]  989 	ldw	x, (0x1c, sp)
      008F22 5C               [ 1]  990 	incw	x
      008F23 1F 18            [ 2]  991 	ldw	(0x18, sp), x
                                    992 ;	./../../mib/stm8s_mib_vsprintf.c: 255: while (--field_width > 0) *str++ = ' ';
      008F25                        993 00138$:
      008F25 1E 20            [ 2]  994 	ldw	x, (0x20, sp)
      008F27 1D 00 01         [ 2]  995 	subw	x, #0x0001
      008F2A 1F 20            [ 2]  996 	ldw	(0x20, sp), x
      008F2C 1E 1E            [ 2]  997 	ldw	x, (0x1e, sp)
      008F2E 24 01            [ 1]  998 	jrnc	00514$
      008F30 5A               [ 2]  999 	decw	x
      008F31                       1000 00514$:
      008F31 1F 1E            [ 2] 1001 	ldw	(0x1e, sp), x
      008F33 5F               [ 1] 1002 	clrw	x
      008F34 13 20            [ 2] 1003 	cpw	x, (0x20, sp)
      008F36 4F               [ 1] 1004 	clr	a
      008F37 12 1F            [ 1] 1005 	sbc	a, (0x1f, sp)
      008F39 4F               [ 1] 1006 	clr	a
      008F3A 12 1E            [ 1] 1007 	sbc	a, (0x1e, sp)
      008F3C 2F 03            [ 1] 1008 	jrslt	00515$
      008F3E CC 91 4B         [ 2] 1009 	jp	00237$
      008F41                       1010 00515$:
      008F41 1E 18            [ 2] 1011 	ldw	x, (0x18, sp)
      008F43 A6 20            [ 1] 1012 	ld	a, #0x20
      008F45 F7               [ 1] 1013 	ld	(x), a
      008F46 1E 18            [ 2] 1014 	ldw	x, (0x18, sp)
      008F48 5C               [ 1] 1015 	incw	x
      008F49 1F 18            [ 2] 1016 	ldw	(0x18, sp), x
      008F4B 20 D8            [ 2] 1017 	jra	00138$
                                   1018 ;	./../../mib/stm8s_mib_vsprintf.c: 258: case 's':
      008F4D                       1019 00141$:
                                   1020 ;	./../../mib/stm8s_mib_vsprintf.c: 259: s = va_arg(args, char *);
      008F4D 1E 26            [ 2] 1021 	ldw	x, (0x26, sp)
      008F4F 5C               [ 1] 1022 	incw	x
      008F50 5C               [ 1] 1023 	incw	x
      008F51 1F 26            [ 2] 1024 	ldw	(0x26, sp), x
      008F53 5A               [ 2] 1025 	decw	x
      008F54 5A               [ 2] 1026 	decw	x
      008F55 FE               [ 2] 1027 	ldw	x, (x)
                                   1028 ;	./../../mib/stm8s_mib_vsprintf.c: 260: if (!s) s = vStr; // "<NULL>";
      008F56 1F 14            [ 2] 1029 	ldw	(0x14, sp), x
      008F58 26 06            [ 1] 1030 	jrne	00143$
      008F5A 96               [ 1] 1031 	ldw	x, sp
      008F5B 1C 00 0D         [ 2] 1032 	addw	x, #13
      008F5E 1F 14            [ 2] 1033 	ldw	(0x14, sp), x
      008F60                       1034 00143$:
                                   1035 ;	./../../mib/stm8s_mib_vsprintf.c: 261: len = strnlen(s, precision);
      008F60 1E 18            [ 2] 1036 	ldw	x, (0x18, sp)
      008F62 89               [ 2] 1037 	pushw	x
      008F63 1E 16            [ 2] 1038 	ldw	x, (0x16, sp)
      008F65 CD 89 AD         [ 4] 1039 	call	_strnlen
      008F68 1F 18            [ 2] 1040 	ldw	(0x18, sp), x
      008F6A 5F               [ 1] 1041 	clrw	x
      008F6B 1F 16            [ 2] 1042 	ldw	(0x16, sp), x
                                   1043 ;	./../../mib/stm8s_mib_vsprintf.c: 262: if (!(flags & LEFT)) while (len < field_width--) *str++ = ' ';
      008F6D 7B 0C            [ 1] 1044 	ld	a, (0x0c, sp)
      008F6F A5 10            [ 1] 1045 	bcp	a, #0x10
      008F71 26 30            [ 1] 1046 	jrne	00225$
      008F73                       1047 00144$:
      008F73 16 20            [ 2] 1048 	ldw	y, (0x20, sp)
      008F75 17 0B            [ 2] 1049 	ldw	(0x0b, sp), y
      008F77 16 1E            [ 2] 1050 	ldw	y, (0x1e, sp)
      008F79 17 09            [ 2] 1051 	ldw	(0x09, sp), y
      008F7B 1E 20            [ 2] 1052 	ldw	x, (0x20, sp)
      008F7D 1D 00 01         [ 2] 1053 	subw	x, #0x0001
      008F80 1F 20            [ 2] 1054 	ldw	(0x20, sp), x
      008F82 1E 1E            [ 2] 1055 	ldw	x, (0x1e, sp)
      008F84 24 01            [ 1] 1056 	jrnc	00519$
      008F86 5A               [ 2] 1057 	decw	x
      008F87                       1058 00519$:
      008F87 1F 1E            [ 2] 1059 	ldw	(0x1e, sp), x
      008F89 1E 18            [ 2] 1060 	ldw	x, (0x18, sp)
      008F8B 13 0B            [ 2] 1061 	cpw	x, (0x0b, sp)
      008F8D 7B 17            [ 1] 1062 	ld	a, (0x17, sp)
      008F8F 12 0A            [ 1] 1063 	sbc	a, (0x0a, sp)
      008F91 7B 16            [ 1] 1064 	ld	a, (0x16, sp)
      008F93 12 09            [ 1] 1065 	sbc	a, (0x09, sp)
      008F95 2E 0C            [ 1] 1066 	jrsge	00238$
      008F97 1E 1C            [ 2] 1067 	ldw	x, (0x1c, sp)
      008F99 A6 20            [ 1] 1068 	ld	a, #0x20
      008F9B F7               [ 1] 1069 	ld	(x), a
      008F9C 1E 1C            [ 2] 1070 	ldw	x, (0x1c, sp)
      008F9E 5C               [ 1] 1071 	incw	x
      008F9F 1F 1C            [ 2] 1072 	ldw	(0x1c, sp), x
      008FA1 20 D0            [ 2] 1073 	jra	00144$
      008FA3                       1074 00238$:
                                   1075 ;	./../../mib/stm8s_mib_vsprintf.c: 263: for (i = 0; i < len; ++i) *str++ = *s++;
      008FA3                       1076 00225$:
      008FA3 5F               [ 1] 1077 	clrw	x
      008FA4 1F 0B            [ 2] 1078 	ldw	(0x0b, sp), x
      008FA6 1F 09            [ 2] 1079 	ldw	(0x09, sp), x
      008FA8                       1080 00182$:
      008FA8 1E 0B            [ 2] 1081 	ldw	x, (0x0b, sp)
      008FAA 13 18            [ 2] 1082 	cpw	x, (0x18, sp)
      008FAC 7B 0A            [ 1] 1083 	ld	a, (0x0a, sp)
      008FAE 12 17            [ 1] 1084 	sbc	a, (0x17, sp)
      008FB0 7B 09            [ 1] 1085 	ld	a, (0x09, sp)
      008FB2 12 16            [ 1] 1086 	sbc	a, (0x16, sp)
      008FB4 2E 1E            [ 1] 1087 	jrsge	00227$
      008FB6 1E 14            [ 2] 1088 	ldw	x, (0x14, sp)
      008FB8 F6               [ 1] 1089 	ld	a, (x)
      008FB9 1E 14            [ 2] 1090 	ldw	x, (0x14, sp)
      008FBB 5C               [ 1] 1091 	incw	x
      008FBC 1F 14            [ 2] 1092 	ldw	(0x14, sp), x
      008FBE 1E 1C            [ 2] 1093 	ldw	x, (0x1c, sp)
      008FC0 F7               [ 1] 1094 	ld	(x), a
      008FC1 1E 1C            [ 2] 1095 	ldw	x, (0x1c, sp)
      008FC3 5C               [ 1] 1096 	incw	x
      008FC4 1F 1C            [ 2] 1097 	ldw	(0x1c, sp), x
      008FC6 1E 0B            [ 2] 1098 	ldw	x, (0x0b, sp)
      008FC8 5C               [ 1] 1099 	incw	x
      008FC9 1F 0B            [ 2] 1100 	ldw	(0x0b, sp), x
      008FCB 26 DB            [ 1] 1101 	jrne	00182$
      008FCD 1E 09            [ 2] 1102 	ldw	x, (0x09, sp)
      008FCF 5C               [ 1] 1103 	incw	x
      008FD0 1F 09            [ 2] 1104 	ldw	(0x09, sp), x
      008FD2 20 D4            [ 2] 1105 	jra	00182$
                                   1106 ;	./../../mib/stm8s_mib_vsprintf.c: 264: while (len < field_width--) *str++ = ' ';
      008FD4                       1107 00227$:
      008FD4                       1108 00150$:
      008FD4 1E 18            [ 2] 1109 	ldw	x, (0x18, sp)
      008FD6 13 20            [ 2] 1110 	cpw	x, (0x20, sp)
      008FD8 7B 17            [ 1] 1111 	ld	a, (0x17, sp)
      008FDA 12 1F            [ 1] 1112 	sbc	a, (0x1f, sp)
      008FDC 7B 16            [ 1] 1113 	ld	a, (0x16, sp)
      008FDE 12 1E            [ 1] 1114 	sbc	a, (0x1e, sp)
      008FE0 2F 03            [ 1] 1115 	jrslt	00526$
      008FE2 CC 91 4F         [ 2] 1116 	jp	00240$
      008FE5                       1117 00526$:
      008FE5 1E 20            [ 2] 1118 	ldw	x, (0x20, sp)
      008FE7 1D 00 01         [ 2] 1119 	subw	x, #0x0001
      008FEA 1F 20            [ 2] 1120 	ldw	(0x20, sp), x
      008FEC 1E 1E            [ 2] 1121 	ldw	x, (0x1e, sp)
      008FEE 24 01            [ 1] 1122 	jrnc	00527$
      008FF0 5A               [ 2] 1123 	decw	x
      008FF1                       1124 00527$:
      008FF1 1F 1E            [ 2] 1125 	ldw	(0x1e, sp), x
      008FF3 1E 1C            [ 2] 1126 	ldw	x, (0x1c, sp)
      008FF5 A6 20            [ 1] 1127 	ld	a, #0x20
      008FF7 F7               [ 1] 1128 	ld	(x), a
      008FF8 1E 1C            [ 2] 1129 	ldw	x, (0x1c, sp)
      008FFA 5C               [ 1] 1130 	incw	x
      008FFB 1F 1C            [ 2] 1131 	ldw	(0x1c, sp), x
      008FFD 20 D5            [ 2] 1132 	jra	00150$
                                   1133 ;	./../../mib/stm8s_mib_vsprintf.c: 267: case 'p':
      008FFF                       1134 00153$:
                                   1135 ;	./../../mib/stm8s_mib_vsprintf.c: 268: if (field_width == -1)
      008FFF 1E 20            [ 2] 1136 	ldw	x, (0x20, sp)
      009001 5C               [ 1] 1137 	incw	x
      009002 26 12            [ 1] 1138 	jrne	00155$
      009004 1E 1E            [ 2] 1139 	ldw	x, (0x1e, sp)
      009006 5C               [ 1] 1140 	incw	x
      009007 26 0D            [ 1] 1141 	jrne	00155$
                                   1142 ;	./../../mib/stm8s_mib_vsprintf.c: 270: field_width = 2 * sizeof(void *);
      009009 AE 00 04         [ 2] 1143 	ldw	x, #0x0004
      00900C 1F 20            [ 2] 1144 	ldw	(0x20, sp), x
      00900E 5F               [ 1] 1145 	clrw	x
      00900F 1F 1E            [ 2] 1146 	ldw	(0x1e, sp), x
                                   1147 ;	./../../mib/stm8s_mib_vsprintf.c: 271: flags |= ZEROPAD;
      009011 04 0C            [ 1] 1148 	srl	(0x0c, sp)
      009013 99               [ 1] 1149 	scf
      009014 09 0C            [ 1] 1150 	rlc	(0x0c, sp)
      009016                       1151 00155$:
                                   1152 ;	./../../mib/stm8s_mib_vsprintf.c: 273: str = number(str, (MMULONG) va_arg(args, void *), 16, field_width, precision, flags);
      009016 1E 26            [ 2] 1153 	ldw	x, (0x26, sp)
      009018 5C               [ 1] 1154 	incw	x
      009019 5C               [ 1] 1155 	incw	x
      00901A 1F 26            [ 2] 1156 	ldw	(0x26, sp), x
      00901C 5A               [ 2] 1157 	decw	x
      00901D 5A               [ 2] 1158 	decw	x
      00901E FE               [ 2] 1159 	ldw	x, (x)
      00901F 1F 07            [ 2] 1160 	ldw	(0x07, sp), x
      009021 90 5F            [ 1] 1161 	clrw	y
      009023 1E 0B            [ 2] 1162 	ldw	x, (0x0b, sp)
      009025 89               [ 2] 1163 	pushw	x
      009026 1E 0B            [ 2] 1164 	ldw	x, (0x0b, sp)
      009028 89               [ 2] 1165 	pushw	x
      009029 1E 1C            [ 2] 1166 	ldw	x, (0x1c, sp)
      00902B 89               [ 2] 1167 	pushw	x
      00902C 1E 1C            [ 2] 1168 	ldw	x, (0x1c, sp)
      00902E 89               [ 2] 1169 	pushw	x
      00902F 1E 28            [ 2] 1170 	ldw	x, (0x28, sp)
      009031 89               [ 2] 1171 	pushw	x
      009032 1E 28            [ 2] 1172 	ldw	x, (0x28, sp)
      009034 89               [ 2] 1173 	pushw	x
      009035 4B 10            [ 1] 1174 	push	#0x10
      009037 5F               [ 1] 1175 	clrw	x
      009038 89               [ 2] 1176 	pushw	x
      009039 4B 00            [ 1] 1177 	push	#0x00
      00903B 1E 17            [ 2] 1178 	ldw	x, (0x17, sp)
      00903D 89               [ 2] 1179 	pushw	x
      00903E 90 89            [ 2] 1180 	pushw	y
      009040 1E 30            [ 2] 1181 	ldw	x, (0x30, sp)
      009042 CD 8A 30         [ 4] 1182 	call	_number
      009045 1F 1C            [ 2] 1183 	ldw	(0x1c, sp), x
                                   1184 ;	./../../mib/stm8s_mib_vsprintf.c: 274: continue;
      009047 CC 91 4F         [ 2] 1185 	jp	00179$
                                   1186 ;	./../../mib/stm8s_mib_vsprintf.c: 276: case 'n':
      00904A                       1187 00156$:
                                   1188 ;	./../../mib/stm8s_mib_vsprintf.c: 277: if (qualifier == 'l')
      00904A 1E 03            [ 2] 1189 	ldw	x, (0x03, sp)
      00904C A3 00 6C         [ 2] 1190 	cpw	x, #0x006c
      00904F 26 24            [ 1] 1191 	jrne	00158$
      009051 1E 01            [ 2] 1192 	ldw	x, (0x01, sp)
      009053 26 20            [ 1] 1193 	jrne	00158$
                                   1194 ;	./../../mib/stm8s_mib_vsprintf.c: 279: MMLONG *ip = va_arg(args, MMLONG *);
      009055 1E 26            [ 2] 1195 	ldw	x, (0x26, sp)
      009057 5C               [ 1] 1196 	incw	x
      009058 5C               [ 1] 1197 	incw	x
      009059 1F 26            [ 2] 1198 	ldw	(0x26, sp), x
      00905B 5A               [ 2] 1199 	decw	x
      00905C 5A               [ 2] 1200 	decw	x
      00905D FE               [ 2] 1201 	ldw	x, (x)
                                   1202 ;	./../../mib/stm8s_mib_vsprintf.c: 280: *ip = (str - buf);
      00905E 16 1C            [ 2] 1203 	ldw	y, (0x1c, sp)
      009060 72 F2 1A         [ 2] 1204 	subw	y, (0x1a, sp)
      009063 90 9E            [ 1] 1205 	ld	a, yh
      009065 49               [ 1] 1206 	rlc	a
      009066 4F               [ 1] 1207 	clr	a
      009067 A2 00            [ 1] 1208 	sbc	a, #0x00
      009069 6B 1F            [ 1] 1209 	ld	(0x1f, sp), a
      00906B 6B 1E            [ 1] 1210 	ld	(0x1e, sp), a
      00906D EF 02            [ 2] 1211 	ldw	(0x2, x), y
      00906F 16 1E            [ 2] 1212 	ldw	y, (0x1e, sp)
      009071 FF               [ 2] 1213 	ldw	(x), y
      009072 CC 91 4F         [ 2] 1214 	jp	00179$
      009075                       1215 00158$:
                                   1216 ;	./../../mib/stm8s_mib_vsprintf.c: 284: MMINT *ip = va_arg(args, MMINT *);
      009075 1E 26            [ 2] 1217 	ldw	x, (0x26, sp)
      009077 5C               [ 1] 1218 	incw	x
      009078 5C               [ 1] 1219 	incw	x
      009079 1F 26            [ 2] 1220 	ldw	(0x26, sp), x
      00907B 5A               [ 2] 1221 	decw	x
      00907C 5A               [ 2] 1222 	decw	x
      00907D FE               [ 2] 1223 	ldw	x, (x)
                                   1224 ;	./../../mib/stm8s_mib_vsprintf.c: 285: *ip = (str - buf);
      00907E 16 1C            [ 2] 1225 	ldw	y, (0x1c, sp)
      009080 72 F2 1A         [ 2] 1226 	subw	y, (0x1a, sp)
      009083 90 9E            [ 1] 1227 	ld	a, yh
      009085 49               [ 1] 1228 	rlc	a
      009086 4F               [ 1] 1229 	clr	a
      009087 A2 00            [ 1] 1230 	sbc	a, #0x00
      009089 6B 1F            [ 1] 1231 	ld	(0x1f, sp), a
      00908B 6B 1E            [ 1] 1232 	ld	(0x1e, sp), a
      00908D EF 02            [ 2] 1233 	ldw	(0x2, x), y
      00908F 16 1E            [ 2] 1234 	ldw	y, (0x1e, sp)
      009091 FF               [ 2] 1235 	ldw	(x), y
                                   1236 ;	./../../mib/stm8s_mib_vsprintf.c: 287: continue;
      009092 CC 91 4F         [ 2] 1237 	jp	00179$
                                   1238 ;	./../../mib/stm8s_mib_vsprintf.c: 290: case 'o':
      009095                       1239 00160$:
                                   1240 ;	./../../mib/stm8s_mib_vsprintf.c: 291: base = 8;
      009095 AE 00 08         [ 2] 1241 	ldw	x, #0x0008
      009098 1F 07            [ 2] 1242 	ldw	(0x07, sp), x
      00909A 5F               [ 1] 1243 	clrw	x
      00909B 1F 05            [ 2] 1244 	ldw	(0x05, sp), x
                                   1245 ;	./../../mib/stm8s_mib_vsprintf.c: 292: break;
      00909D 20 3A            [ 2] 1246 	jra	00172$
                                   1247 ;	./../../mib/stm8s_mib_vsprintf.c: 294: case 'X':
      00909F                       1248 00161$:
                                   1249 ;	./../../mib/stm8s_mib_vsprintf.c: 295: flags |= LARGE;
      00909F 7B 0C            [ 1] 1250 	ld	a, (0x0c, sp)
      0090A1 AA 40            [ 1] 1251 	or	a, #0x40
      0090A3 6B 0C            [ 1] 1252 	ld	(0x0c, sp), a
                                   1253 ;	./../../mib/stm8s_mib_vsprintf.c: 297: case 'x':
      0090A5                       1254 00162$:
                                   1255 ;	./../../mib/stm8s_mib_vsprintf.c: 298: base = 16;
      0090A5 AE 00 10         [ 2] 1256 	ldw	x, #0x0010
      0090A8 1F 07            [ 2] 1257 	ldw	(0x07, sp), x
      0090AA 5F               [ 1] 1258 	clrw	x
      0090AB 1F 05            [ 2] 1259 	ldw	(0x05, sp), x
                                   1260 ;	./../../mib/stm8s_mib_vsprintf.c: 299: break;
      0090AD 20 2A            [ 2] 1261 	jra	00172$
                                   1262 ;	./../../mib/stm8s_mib_vsprintf.c: 302: case 'i':
      0090AF                       1263 00164$:
                                   1264 ;	./../../mib/stm8s_mib_vsprintf.c: 303: flags |= SIGN;
      0090AF 7B 0C            [ 1] 1265 	ld	a, (0x0c, sp)
      0090B1 AA 02            [ 1] 1266 	or	a, #0x02
      0090B3 6B 0C            [ 1] 1267 	ld	(0x0c, sp), a
                                   1268 ;	./../../mib/stm8s_mib_vsprintf.c: 306: break;
      0090B5 20 22            [ 2] 1269 	jra	00172$
                                   1270 ;	./../../mib/stm8s_mib_vsprintf.c: 308: default:
      0090B7                       1271 00166$:
                                   1272 ;	./../../mib/stm8s_mib_vsprintf.c: 309: if (*fmt != '%') *str++ = '%';
      0090B7 A1 25            [ 1] 1273 	cp	a, #0x25
      0090B9 27 0A            [ 1] 1274 	jreq	00168$
      0090BB 1E 1C            [ 2] 1275 	ldw	x, (0x1c, sp)
      0090BD A6 25            [ 1] 1276 	ld	a, #0x25
      0090BF F7               [ 1] 1277 	ld	(x), a
      0090C0 1E 1C            [ 2] 1278 	ldw	x, (0x1c, sp)
      0090C2 5C               [ 1] 1279 	incw	x
      0090C3 1F 1C            [ 2] 1280 	ldw	(0x1c, sp), x
      0090C5                       1281 00168$:
                                   1282 ;	./../../mib/stm8s_mib_vsprintf.c: 310: if (*fmt)
      0090C5 1E 24            [ 2] 1283 	ldw	x, (0x24, sp)
      0090C7 F6               [ 1] 1284 	ld	a, (x)
      0090C8 27 0A            [ 1] 1285 	jreq	00170$
                                   1286 ;	./../../mib/stm8s_mib_vsprintf.c: 311: *str++ = *fmt;
      0090CA 1E 1C            [ 2] 1287 	ldw	x, (0x1c, sp)
      0090CC F7               [ 1] 1288 	ld	(x), a
      0090CD 1E 1C            [ 2] 1289 	ldw	x, (0x1c, sp)
      0090CF 5C               [ 1] 1290 	incw	x
      0090D0 1F 1C            [ 2] 1291 	ldw	(0x1c, sp), x
      0090D2 20 7B            [ 2] 1292 	jra	00179$
      0090D4                       1293 00170$:
                                   1294 ;	./../../mib/stm8s_mib_vsprintf.c: 313: --fmt;
      0090D4 5A               [ 2] 1295 	decw	x
      0090D5 1F 24            [ 2] 1296 	ldw	(0x24, sp), x
                                   1297 ;	./../../mib/stm8s_mib_vsprintf.c: 314: continue;
      0090D7 20 76            [ 2] 1298 	jra	00179$
                                   1299 ;	./../../mib/stm8s_mib_vsprintf.c: 315: }
      0090D9                       1300 00172$:
                                   1301 ;	./../../mib/stm8s_mib_vsprintf.c: 317: if (qualifier == 'l')
      0090D9 1E 03            [ 2] 1302 	ldw	x, (0x03, sp)
      0090DB A3 00 6C         [ 2] 1303 	cpw	x, #0x006c
      0090DE 26 1A            [ 1] 1304 	jrne	00177$
      0090E0 1E 01            [ 2] 1305 	ldw	x, (0x01, sp)
      0090E2 26 16            [ 1] 1306 	jrne	00177$
                                   1307 ;	./../../mib/stm8s_mib_vsprintf.c: 318: num = va_arg(args, MMUINT); // MMULONG); // test ok..
      0090E4 1E 26            [ 2] 1308 	ldw	x, (0x26, sp)
      0090E6 1C 00 04         [ 2] 1309 	addw	x, #0x0004
      0090E9 1F 26            [ 2] 1310 	ldw	(0x26, sp), x
      0090EB 1D 00 04         [ 2] 1311 	subw	x, #0x0004
      0090EE 90 93            [ 1] 1312 	ldw	y, x
      0090F0 90 EE 02         [ 2] 1313 	ldw	y, (0x2, y)
      0090F3 FE               [ 2] 1314 	ldw	x, (x)
      0090F4 17 03            [ 2] 1315 	ldw	(0x03, sp), y
      0090F6 1F 01            [ 2] 1316 	ldw	(0x01, sp), x
      0090F8 20 2A            [ 2] 1317 	jra	00178$
      0090FA                       1318 00177$:
                                   1319 ;	./../../mib/stm8s_mib_vsprintf.c: 328: else if (flags & SIGN)
      0090FA 7B 0C            [ 1] 1320 	ld	a, (0x0c, sp)
      0090FC A5 02            [ 1] 1321 	bcp	a, #0x02
      0090FE 27 16            [ 1] 1322 	jreq	00174$
                                   1323 ;	./../../mib/stm8s_mib_vsprintf.c: 329: num = va_arg(args, MMINT); // test ok...
      009100 1E 26            [ 2] 1324 	ldw	x, (0x26, sp)
      009102 1C 00 04         [ 2] 1325 	addw	x, #0x0004
      009105 1F 26            [ 2] 1326 	ldw	(0x26, sp), x
      009107 1D 00 04         [ 2] 1327 	subw	x, #0x0004
      00910A 90 93            [ 1] 1328 	ldw	y, x
      00910C 90 EE 02         [ 2] 1329 	ldw	y, (0x2, y)
      00910F FE               [ 2] 1330 	ldw	x, (x)
      009110 17 03            [ 2] 1331 	ldw	(0x03, sp), y
      009112 1F 01            [ 2] 1332 	ldw	(0x01, sp), x
      009114 20 0E            [ 2] 1333 	jra	00178$
      009116                       1334 00174$:
                                   1335 ;	./../../mib/stm8s_mib_vsprintf.c: 331: num = va_arg(args, MMAUINT);
      009116 1E 26            [ 2] 1336 	ldw	x, (0x26, sp)
      009118 5C               [ 1] 1337 	incw	x
      009119 5C               [ 1] 1338 	incw	x
      00911A 1F 26            [ 2] 1339 	ldw	(0x26, sp), x
      00911C 5A               [ 2] 1340 	decw	x
      00911D 5A               [ 2] 1341 	decw	x
      00911E FE               [ 2] 1342 	ldw	x, (x)
      00911F 1F 03            [ 2] 1343 	ldw	(0x03, sp), x
      009121 5F               [ 1] 1344 	clrw	x
      009122 1F 01            [ 2] 1345 	ldw	(0x01, sp), x
      009124                       1346 00178$:
                                   1347 ;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
      009124 1E 0B            [ 2] 1348 	ldw	x, (0x0b, sp)
      009126 89               [ 2] 1349 	pushw	x
      009127 1E 0B            [ 2] 1350 	ldw	x, (0x0b, sp)
      009129 89               [ 2] 1351 	pushw	x
      00912A 1E 1C            [ 2] 1352 	ldw	x, (0x1c, sp)
      00912C 89               [ 2] 1353 	pushw	x
      00912D 1E 1C            [ 2] 1354 	ldw	x, (0x1c, sp)
      00912F 89               [ 2] 1355 	pushw	x
      009130 1E 28            [ 2] 1356 	ldw	x, (0x28, sp)
      009132 89               [ 2] 1357 	pushw	x
      009133 1E 28            [ 2] 1358 	ldw	x, (0x28, sp)
      009135 89               [ 2] 1359 	pushw	x
      009136 1E 13            [ 2] 1360 	ldw	x, (0x13, sp)
      009138 89               [ 2] 1361 	pushw	x
      009139 1E 13            [ 2] 1362 	ldw	x, (0x13, sp)
      00913B 89               [ 2] 1363 	pushw	x
      00913C 1E 13            [ 2] 1364 	ldw	x, (0x13, sp)
      00913E 89               [ 2] 1365 	pushw	x
      00913F 1E 13            [ 2] 1366 	ldw	x, (0x13, sp)
      009141 89               [ 2] 1367 	pushw	x
      009142 1E 30            [ 2] 1368 	ldw	x, (0x30, sp)
      009144 CD 8A 30         [ 4] 1369 	call	_number
      009147 1F 1C            [ 2] 1370 	ldw	(0x1c, sp), x
                                   1371 ;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
      009149 20 04            [ 2] 1372 	jra	00179$
                                   1373 ;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
      00914B                       1374 00237$:
      00914B 16 18            [ 2] 1375 	ldw	y, (0x18, sp)
      00914D 17 1C            [ 2] 1376 	ldw	(0x1c, sp), y
                                   1377 ;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
                                   1378 ;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
      00914F                       1379 00240$:
      00914F                       1380 00179$:
                                   1381 ;	./../../mib/stm8s_mib_vsprintf.c: 188: for (str = buf; *fmt; fmt++)
      00914F 1E 24            [ 2] 1382 	ldw	x, (0x24, sp)
      009151 5C               [ 1] 1383 	incw	x
      009152 1F 24            [ 2] 1384 	ldw	(0x24, sp), x
      009154 CC 8D 52         [ 2] 1385 	jp	00185$
      009157                       1386 00180$:
                                   1387 ;	./../../mib/stm8s_mib_vsprintf.c: 336: *str = '\0';
      009157 1E 1C            [ 2] 1388 	ldw	x, (0x1c, sp)
      009159 7F               [ 1] 1389 	clr	(x)
                                   1390 ;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
      00915A 1E 1C            [ 2] 1391 	ldw	x, (0x1c, sp)
      00915C 72 F0 1A         [ 2] 1392 	subw	x, (0x1a, sp)
                                   1393 ;	./../../mib/stm8s_mib_vsprintf.c: 338: }
      00915F 16 22            [ 2] 1394 	ldw	y, (34, sp)
      009161 5B 27            [ 2] 1395 	addw	sp, #39
      009163 90 FC            [ 2] 1396 	jp	(y)
                                   1397 ;	./../../mib/stm8s_mib_vsprintf.c: 342: MMRINT mib_vsprintf(char *vpBuffer,char *format, ...)
                                   1398 ;	-----------------------------------------
                                   1399 ;	 function mib_vsprintf
                                   1400 ;	-----------------------------------------
      009165                       1401 _mib_vsprintf:
                                   1402 ;	./../../mib/stm8s_mib_vsprintf.c: 347: va_start(ap, format);
      009165 96               [ 1] 1403 	ldw	x, sp
      009166 1C 00 07         [ 2] 1404 	addw	x, #7
                                   1405 ;	./../../mib/stm8s_mib_vsprintf.c: 348: rc = mm_vsprintf(vpBuffer, format, ap);
      009169 89               [ 2] 1406 	pushw	x
      00916A 1E 07            [ 2] 1407 	ldw	x, (0x07, sp)
      00916C 89               [ 2] 1408 	pushw	x
      00916D 1E 07            [ 2] 1409 	ldw	x, (0x07, sp)
      00916F CD 8D 32         [ 4] 1410 	call	_mm_vsprintf
                                   1411 ;	./../../mib/stm8s_mib_vsprintf.c: 351: return (rc);
                                   1412 ;	./../../mib/stm8s_mib_vsprintf.c: 352: }
      009172 81               [ 4] 1413 	ret
                                   1414 ;	./../../mib/stm8s_mib_vsprintf.c: 363: MMRINT mib_printf(char *format, ...)
                                   1415 ;	-----------------------------------------
                                   1416 ;	 function mib_printf
                                   1417 ;	-----------------------------------------
      009173                       1418 _mib_printf:
      009173 52 82            [ 2] 1419 	sub	sp, #130
                                   1420 ;	./../../mib/stm8s_mib_vsprintf.c: 370: va_start(ap, format);
                                   1421 ;	./../../mib/stm8s_mib_vsprintf.c: 371: rc = mm_vsprintf(buffer, format, ap);
      009175 96               [ 1] 1422 	ldw	x, sp
      009176 1C 00 87         [ 2] 1423 	addw	x, #135
      009179 89               [ 2] 1424 	pushw	x
      00917A 1E 87            [ 2] 1425 	ldw	x, (0x87, sp)
      00917C 89               [ 2] 1426 	pushw	x
      00917D 96               [ 1] 1427 	ldw	x, sp
      00917E 1C 00 05         [ 2] 1428 	addw	x, #5
      009181 CD 8D 32         [ 4] 1429 	call	_mm_vsprintf
      009184 1F 81            [ 2] 1430 	ldw	(0x81, sp), x
                                   1431 ;	./../../mib/stm8s_mib_vsprintf.c: 374: v_pString = (char *)buffer;
      009186 96               [ 1] 1432 	ldw	x, sp
      009187 5C               [ 1] 1433 	incw	x
                                   1434 ;	./../../mib/stm8s_mib_vsprintf.c: 375: while (*v_pString != 0)	MibWriteDebugByte((uint8_t)*v_pString++);
      009188                       1435 00101$:
      009188 F6               [ 1] 1436 	ld	a, (x)
      009189 27 08            [ 1] 1437 	jreq	00103$
      00918B 5C               [ 1] 1438 	incw	x
      00918C 89               [ 2] 1439 	pushw	x
      00918D CD 87 4F         [ 4] 1440 	call	_MibWriteDebugByte
      009190 85               [ 2] 1441 	popw	x
      009191 20 F5            [ 2] 1442 	jra	00101$
      009193                       1443 00103$:
                                   1444 ;	./../../mib/stm8s_mib_vsprintf.c: 376: return (rc);
      009193 1E 81            [ 2] 1445 	ldw	x, (0x81, sp)
                                   1446 ;	./../../mib/stm8s_mib_vsprintf.c: 377: }
      009195 5B 82            [ 2] 1447 	addw	sp, #130
      009197 81               [ 4] 1448 	ret
                                   1449 	.area CODE
                                   1450 	.area CONST
                                   1451 	.area CONST
      0081B4                       1452 ___str_1:
      0081B4 30 31 32 33 34 35 36  1453 	.ascii "0123456789abcdefghijklmnopqrstuvwxyz"
             37 38 39 61 62 63 64
             65 66 67 68 69 6A 6B
             6C 6D 6E 6F 70 71 72
             73 74 75 76 77 78 79
             7A
      0081D8 00                    1454 	.db 0x00
                                   1455 	.area CODE
                                   1456 	.area CONST
      0081D9                       1457 ___str_2:
      0081D9 30 31 32 33 34 35 36  1458 	.ascii "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
             37 38 39 41 42 43 44
             45 46 47 48 49 4A 4B
             4C 4D 4E 4F 50 51 52
             53 54 55 56 57 58 59
             5A
      0081FD 00                    1459 	.db 0x00
                                   1460 	.area CODE
                                   1461 	.area INITIALIZER
      00860B                       1462 __xinit__digits:
      00860B 81 B4                 1463 	.dw ___str_1
      00860D                       1464 __xinit__upper_digits:
      00860D 81 D9                 1465 	.dw ___str_2
                                   1466 	.area CABS (ABS)
