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
      000158                         23 _digits:
      000158                         24 	.ds 2
      00015A                         25 _upper_digits:
      00015A                         26 	.ds 2
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
      0091F9                         60 _strnlen:
      0091F9 52 06            [ 2]   61 	sub	sp, #6
      0091FB 1F 03            [ 2]   62 	ldw	(0x03, sp), x
                                     63 ;	./../../mib/stm8s_mib_vsprintf.c: 74: for (sc = s; *sc != '\0' && count--; ++sc);
      0091FD 16 09            [ 2]   64 	ldw	y, (0x09, sp)
      0091FF 17 05            [ 2]   65 	ldw	(0x05, sp), y
      009201 1E 03            [ 2]   66 	ldw	x, (0x03, sp)
      009203                         67 00104$:
      009203 F6               [ 1]   68 	ld	a, (x)
      009204 27 11            [ 1]   69 	jreq	00101$
      009206 16 05            [ 2]   70 	ldw	y, (0x05, sp)
      009208 17 01            [ 2]   71 	ldw	(0x01, sp), y
      00920A 16 05            [ 2]   72 	ldw	y, (0x05, sp)
      00920C 90 5A            [ 2]   73 	decw	y
      00920E 17 05            [ 2]   74 	ldw	(0x05, sp), y
      009210 16 01            [ 2]   75 	ldw	y, (0x01, sp)
      009212 27 03            [ 1]   76 	jreq	00101$
      009214 5C               [ 1]   77 	incw	x
      009215 20 EC            [ 2]   78 	jra	00104$
      009217                         79 00101$:
                                     80 ;	./../../mib/stm8s_mib_vsprintf.c: 75: return sc - s;
      009217 72 F0 03         [ 2]   81 	subw	x, (0x03, sp)
                                     82 ;	./../../mib/stm8s_mib_vsprintf.c: 76: }
      00921A 5B 06            [ 2]   83 	addw	sp, #6
      00921C 90 85            [ 2]   84 	popw	y
      00921E 5B 02            [ 2]   85 	addw	sp, #2
      009220 90 FC            [ 2]   86 	jp	(y)
                                     87 ;	./../../mib/stm8s_mib_vsprintf.c: 81: static MMINT skip_atoi(const char **s)
                                     88 ;	-----------------------------------------
                                     89 ;	 function skip_atoi
                                     90 ;	-----------------------------------------
      009222                         91 _skip_atoi:
      009222 52 08            [ 2]   92 	sub	sp, #8
      009224 1F 07            [ 2]   93 	ldw	(0x07, sp), x
                                     94 ;	./../../mib/stm8s_mib_vsprintf.c: 83: MMINT i = 0;
      009226 5F               [ 1]   95 	clrw	x
      009227 1F 05            [ 2]   96 	ldw	(0x05, sp), x
                                     97 ;	./../../mib/stm8s_mib_vsprintf.c: 84: while (is_digit(**s)) i = i*10 + *((*s)++) - '0';
      009229                         98 00102$:
      009229 16 07            [ 2]   99 	ldw	y, (0x07, sp)
      00922B 90 FE            [ 2]  100 	ldw	y, (y)
      00922D 17 01            [ 2]  101 	ldw	(0x01, sp), y
      00922F 90 F6            [ 1]  102 	ld	a, (y)
      009231 A1 30            [ 1]  103 	cp	a, #0x30
      009233 25 41            [ 1]  104 	jrc	00104$
      009235 A1 39            [ 1]  105 	cp	a, #0x39
      009237 22 3D            [ 1]  106 	jrugt	00104$
      009239 16 05            [ 2]  107 	ldw	y, (0x05, sp)
      00923B 90 89            [ 2]  108 	pushw	y
      00923D 89               [ 2]  109 	pushw	x
      00923E 4B 0A            [ 1]  110 	push	#0x0a
      009240 5F               [ 1]  111 	clrw	x
      009241 89               [ 2]  112 	pushw	x
      009242 4B 00            [ 1]  113 	push	#0x00
      009244 CD AC A3         [ 4]  114 	call	__mullong
      009247 5B 08            [ 2]  115 	addw	sp, #8
      009249 1F 05            [ 2]  116 	ldw	(0x05, sp), x
      00924B 17 03            [ 2]  117 	ldw	(0x03, sp), y
      00924D 1E 01            [ 2]  118 	ldw	x, (0x01, sp)
      00924F 5C               [ 1]  119 	incw	x
      009250 16 07            [ 2]  120 	ldw	y, (0x07, sp)
      009252 90 FF            [ 2]  121 	ldw	(y), x
      009254 1E 01            [ 2]  122 	ldw	x, (0x01, sp)
      009256 F6               [ 1]  123 	ld	a, (x)
      009257 90 5F            [ 1]  124 	clrw	y
      009259 5F               [ 1]  125 	clrw	x
      00925A 90 5D            [ 2]  126 	tnzw	y
      00925C 2A 01            [ 1]  127 	jrpl	00124$
      00925E 5A               [ 2]  128 	decw	x
      00925F                        129 00124$:
      00925F 90 97            [ 1]  130 	ld	yl, a
      009261 72 F9 05         [ 2]  131 	addw	y, (0x05, sp)
      009264 9F               [ 1]  132 	ld	a, xl
      009265 19 04            [ 1]  133 	adc	a, (0x04, sp)
      009267 02               [ 1]  134 	rlwa	x
      009268 19 03            [ 1]  135 	adc	a, (0x03, sp)
      00926A 95               [ 1]  136 	ld	xh, a
      00926B 72 A2 00 30      [ 2]  137 	subw	y, #0x0030
      00926F 17 05            [ 2]  138 	ldw	(0x05, sp), y
      009271 24 B6            [ 1]  139 	jrnc	00102$
      009273 5A               [ 2]  140 	decw	x
      009274 20 B3            [ 2]  141 	jra	00102$
      009276                        142 00104$:
                                    143 ;	./../../mib/stm8s_mib_vsprintf.c: 85: return i;
      009276 51               [ 1]  144 	exgw	x, y
      009277 1E 05            [ 2]  145 	ldw	x, (0x05, sp)
                                    146 ;	./../../mib/stm8s_mib_vsprintf.c: 86: }
      009279 5B 08            [ 2]  147 	addw	sp, #8
      00927B 81               [ 4]  148 	ret
                                    149 ;	./../../mib/stm8s_mib_vsprintf.c: 91: static char *number(char *str, MMLONG num, MMINT base, MMINT size, MMINT precision, MMINT type)
                                    150 ;	-----------------------------------------
                                    151 ;	 function number
                                    152 ;	-----------------------------------------
      00927C                        153 _number:
      00927C 52 62            [ 2]  154 	sub	sp, #98
      00927E 1F 5D            [ 2]  155 	ldw	(0x5d, sp), x
                                    156 ;	./../../mib/stm8s_mib_vsprintf.c: 94: char *dig = digits;
      009280 CE 01 58         [ 2]  157 	ldw	x, _digits+0
      009283 1F 43            [ 2]  158 	ldw	(0x43, sp), x
                                    159 ;	./../../mib/stm8s_mib_vsprintf.c: 97: if (type & LARGE)  dig = upper_digits;
      009285 7B 78            [ 1]  160 	ld	a, (0x78, sp)
      009287 A5 40            [ 1]  161 	bcp	a, #0x40
      009289 27 05            [ 1]  162 	jreq	00102$
      00928B CE 01 5A         [ 2]  163 	ldw	x, _upper_digits+0
      00928E 1F 43            [ 2]  164 	ldw	(0x43, sp), x
      009290                        165 00102$:
                                    166 ;	./../../mib/stm8s_mib_vsprintf.c: 98: if (type & LEFT) type &= ~ZEROPAD;
      009290 7B 78            [ 1]  167 	ld	a, (0x78, sp)
      009292 A5 10            [ 1]  168 	bcp	a, #0x10
      009294 27 0A            [ 1]  169 	jreq	00104$
      009296 1E 77            [ 2]  170 	ldw	x, (0x77, sp)
      009298 54               [ 2]  171 	srlw	x
      009299 58               [ 2]  172 	sllw	x
      00929A 16 75            [ 2]  173 	ldw	y, (0x75, sp)
      00929C 1F 77            [ 2]  174 	ldw	(0x77, sp), x
      00929E 17 75            [ 2]  175 	ldw	(0x75, sp), y
      0092A0                        176 00104$:
                                    177 ;	./../../mib/stm8s_mib_vsprintf.c: 99: if (base < 2 || base > 36) return 0;
      0092A0 1E 6B            [ 2]  178 	ldw	x, (0x6b, sp)
      0092A2 A3 00 02         [ 2]  179 	cpw	x, #0x0002
      0092A5 7B 6A            [ 1]  180 	ld	a, (0x6a, sp)
      0092A7 A2 00            [ 1]  181 	sbc	a, #0x00
      0092A9 7B 69            [ 1]  182 	ld	a, (0x69, sp)
      0092AB A2 00            [ 1]  183 	sbc	a, #0x00
      0092AD 2F 0D            [ 1]  184 	jrslt	00105$
      0092AF AE 00 24         [ 2]  185 	ldw	x, #0x0024
      0092B2 13 6B            [ 2]  186 	cpw	x, (0x6b, sp)
      0092B4 4F               [ 1]  187 	clr	a
      0092B5 12 6A            [ 1]  188 	sbc	a, (0x6a, sp)
      0092B7 4F               [ 1]  189 	clr	a
      0092B8 12 69            [ 1]  190 	sbc	a, (0x69, sp)
      0092BA 2E 04            [ 1]  191 	jrsge	00106$
      0092BC                        192 00105$:
      0092BC 5F               [ 1]  193 	clrw	x
      0092BD CC 95 78         [ 2]  194 	jp	00161$
      0092C0                        195 00106$:
                                    196 ;	./../../mib/stm8s_mib_vsprintf.c: 101: c = (type & ZEROPAD) ? '0' : ' ';
      0092C0 7B 78            [ 1]  197 	ld	a, (0x78, sp)
      0092C2 44               [ 1]  198 	srl	a
      0092C3 24 03            [ 1]  199 	jrnc	00163$
      0092C5 A6 30            [ 1]  200 	ld	a, #0x30
      0092C7 C5                     201 	.byte 0xc5
      0092C8                        202 00163$:
      0092C8 A6 20            [ 1]  203 	ld	a, #0x20
      0092CA                        204 00164$:
      0092CA 6B 45            [ 1]  205 	ld	(0x45, sp), a
                                    206 ;	./../../mib/stm8s_mib_vsprintf.c: 102: sign = 0;
      0092CC 0F 46            [ 1]  207 	clr	(0x46, sp)
                                    208 ;	./../../mib/stm8s_mib_vsprintf.c: 103: if (type & SIGN)
      0092CE 7B 78            [ 1]  209 	ld	a, (0x78, sp)
      0092D0 A5 02            [ 1]  210 	bcp	a, #0x02
      0092D2 27 52            [ 1]  211 	jreq	00117$
                                    212 ;	./../../mib/stm8s_mib_vsprintf.c: 109: size--;
      0092D4 16 6F            [ 2]  213 	ldw	y, (0x6f, sp)
      0092D6 72 A2 00 01      [ 2]  214 	subw	y, #0x0001
      0092DA 1E 6D            [ 2]  215 	ldw	x, (0x6d, sp)
      0092DC 24 01            [ 1]  216 	jrnc	00330$
      0092DE 5A               [ 2]  217 	decw	x
      0092DF                        218 00330$:
      0092DF 1F 57            [ 2]  219 	ldw	(0x57, sp), x
                                    220 ;	./../../mib/stm8s_mib_vsprintf.c: 105: if (num < 0)
      0092E1 0D 65            [ 1]  221 	tnz	(0x65, sp)
      0092E3 2A 1F            [ 1]  222 	jrpl	00114$
                                    223 ;	./../../mib/stm8s_mib_vsprintf.c: 107: sign = '-';
      0092E5 A6 2D            [ 1]  224 	ld	a, #0x2d
      0092E7 6B 46            [ 1]  225 	ld	(0x46, sp), a
                                    226 ;	./../../mib/stm8s_mib_vsprintf.c: 108: num = -num;
      0092E9 1E 67            [ 2]  227 	ldw	x, (0x67, sp)
      0092EB 50               [ 2]  228 	negw	x
      0092EC 4F               [ 1]  229 	clr	a
      0092ED 12 66            [ 1]  230 	sbc	a, (0x66, sp)
      0092EF 6B 60            [ 1]  231 	ld	(0x60, sp), a
      0092F1 4F               [ 1]  232 	clr	a
      0092F2 12 65            [ 1]  233 	sbc	a, (0x65, sp)
      0092F4 1F 67            [ 2]  234 	ldw	(0x67, sp), x
      0092F6 6B 65            [ 1]  235 	ld	(0x65, sp), a
      0092F8 7B 60            [ 1]  236 	ld	a, (0x60, sp)
      0092FA 6B 66            [ 1]  237 	ld	(0x66, sp), a
                                    238 ;	./../../mib/stm8s_mib_vsprintf.c: 109: size--;
      0092FC 17 6F            [ 2]  239 	ldw	(0x6f, sp), y
      0092FE 16 57            [ 2]  240 	ldw	y, (0x57, sp)
      009300 17 6D            [ 2]  241 	ldw	(0x6d, sp), y
      009302 20 22            [ 2]  242 	jra	00117$
      009304                        243 00114$:
                                    244 ;	./../../mib/stm8s_mib_vsprintf.c: 111: else if (type & PLUS)
      009304 7B 78            [ 1]  245 	ld	a, (0x78, sp)
      009306 A5 04            [ 1]  246 	bcp	a, #0x04
      009308 27 0C            [ 1]  247 	jreq	00111$
                                    248 ;	./../../mib/stm8s_mib_vsprintf.c: 113: sign = '+';
      00930A A6 2B            [ 1]  249 	ld	a, #0x2b
      00930C 6B 46            [ 1]  250 	ld	(0x46, sp), a
                                    251 ;	./../../mib/stm8s_mib_vsprintf.c: 114: size--;
      00930E 17 6F            [ 2]  252 	ldw	(0x6f, sp), y
      009310 16 57            [ 2]  253 	ldw	y, (0x57, sp)
      009312 17 6D            [ 2]  254 	ldw	(0x6d, sp), y
      009314 20 10            [ 2]  255 	jra	00117$
      009316                        256 00111$:
                                    257 ;	./../../mib/stm8s_mib_vsprintf.c: 116: else if (type & SPACE)
      009316 7B 78            [ 1]  258 	ld	a, (0x78, sp)
      009318 A5 08            [ 1]  259 	bcp	a, #0x08
      00931A 27 0A            [ 1]  260 	jreq	00117$
                                    261 ;	./../../mib/stm8s_mib_vsprintf.c: 118: sign = ' ';
      00931C A6 20            [ 1]  262 	ld	a, #0x20
      00931E 6B 46            [ 1]  263 	ld	(0x46, sp), a
                                    264 ;	./../../mib/stm8s_mib_vsprintf.c: 119: size--;
      009320 17 6F            [ 2]  265 	ldw	(0x6f, sp), y
      009322 16 57            [ 2]  266 	ldw	y, (0x57, sp)
      009324 17 6D            [ 2]  267 	ldw	(0x6d, sp), y
      009326                        268 00117$:
                                    269 ;	./../../mib/stm8s_mib_vsprintf.c: 123: if (type & SPECIAL)
      009326 7B 78            [ 1]  270 	ld	a, (0x78, sp)
      009328 A4 20            [ 1]  271 	and	a, #0x20
      00932A 6B 4A            [ 1]  272 	ld	(0x4a, sp), a
      00932C 5F               [ 1]  273 	clrw	x
      00932D 1F 48            [ 2]  274 	ldw	(0x48, sp), x
      00932F 0F 47            [ 1]  275 	clr	(0x47, sp)
                                    276 ;	./../../mib/stm8s_mib_vsprintf.c: 125: if (base == 16)
      009331 1E 6B            [ 2]  277 	ldw	x, (0x6b, sp)
      009333 A3 00 10         [ 2]  278 	cpw	x, #0x0010
      009336 26 09            [ 1]  279 	jrne	00335$
      009338 1E 69            [ 2]  280 	ldw	x, (0x69, sp)
      00933A 26 05            [ 1]  281 	jrne	00335$
      00933C A6 01            [ 1]  282 	ld	a, #0x01
      00933E 6B 4B            [ 1]  283 	ld	(0x4b, sp), a
      009340 C5                     284 	.byte 0xc5
      009341                        285 00335$:
      009341 0F 4B            [ 1]  286 	clr	(0x4b, sp)
      009343                        287 00336$:
                                    288 ;	./../../mib/stm8s_mib_vsprintf.c: 127: else if (base == 8)
      009343 1E 6B            [ 2]  289 	ldw	x, (0x6b, sp)
      009345 A3 00 08         [ 2]  290 	cpw	x, #0x0008
      009348 26 09            [ 1]  291 	jrne	00338$
      00934A 1E 69            [ 2]  292 	ldw	x, (0x69, sp)
      00934C 26 05            [ 1]  293 	jrne	00338$
      00934E A6 01            [ 1]  294 	ld	a, #0x01
      009350 6B 4C            [ 1]  295 	ld	(0x4c, sp), a
      009352 C5                     296 	.byte 0xc5
      009353                        297 00338$:
      009353 0F 4C            [ 1]  298 	clr	(0x4c, sp)
      009355                        299 00339$:
                                    300 ;	./../../mib/stm8s_mib_vsprintf.c: 123: if (type & SPECIAL)
      009355 1E 49            [ 2]  301 	ldw	x, (0x49, sp)
      009357 26 04            [ 1]  302 	jrne	00340$
      009359 1E 47            [ 2]  303 	ldw	x, (0x47, sp)
      00935B 27 28            [ 1]  304 	jreq	00124$
      00935D                        305 00340$:
                                    306 ;	./../../mib/stm8s_mib_vsprintf.c: 125: if (base == 16)
      00935D 0D 4B            [ 1]  307 	tnz	(0x4b, sp)
      00935F 27 11            [ 1]  308 	jreq	00121$
                                    309 ;	./../../mib/stm8s_mib_vsprintf.c: 126: size -= 2;
      009361 1E 6F            [ 2]  310 	ldw	x, (0x6f, sp)
      009363 1D 00 02         [ 2]  311 	subw	x, #0x0002
      009366 16 6D            [ 2]  312 	ldw	y, (0x6d, sp)
      009368 24 02            [ 1]  313 	jrnc	00342$
      00936A 90 5A            [ 2]  314 	decw	y
      00936C                        315 00342$:
      00936C 1F 6F            [ 2]  316 	ldw	(0x6f, sp), x
      00936E 17 6D            [ 2]  317 	ldw	(0x6d, sp), y
      009370 20 13            [ 2]  318 	jra	00124$
      009372                        319 00121$:
                                    320 ;	./../../mib/stm8s_mib_vsprintf.c: 127: else if (base == 8)
      009372 0D 4C            [ 1]  321 	tnz	(0x4c, sp)
      009374 27 0F            [ 1]  322 	jreq	00124$
                                    323 ;	./../../mib/stm8s_mib_vsprintf.c: 128: size--;
      009376 1E 6F            [ 2]  324 	ldw	x, (0x6f, sp)
      009378 1D 00 01         [ 2]  325 	subw	x, #0x0001
      00937B 16 6D            [ 2]  326 	ldw	y, (0x6d, sp)
      00937D 24 02            [ 1]  327 	jrnc	00344$
      00937F 90 5A            [ 2]  328 	decw	y
      009381                        329 00344$:
      009381 1F 6F            [ 2]  330 	ldw	(0x6f, sp), x
      009383 17 6D            [ 2]  331 	ldw	(0x6d, sp), y
      009385                        332 00124$:
                                    333 ;	./../../mib/stm8s_mib_vsprintf.c: 133: if (num == 0)
      009385 1E 67            [ 2]  334 	ldw	x, (0x67, sp)
      009387 26 10            [ 1]  335 	jrne	00178$
                                    336 ;	./../../mib/stm8s_mib_vsprintf.c: 134: tmp[i++] = '0';
      009389 1E 65            [ 2]  337 	ldw	x, (0x65, sp)
      00938B 26 0C            [ 1]  338 	jrne	00178$
      00938D 5C               [ 1]  339 	incw	x
      00938E 1F 59            [ 2]  340 	ldw	(0x59, sp), x
      009390 5F               [ 1]  341 	clrw	x
      009391 1F 57            [ 2]  342 	ldw	(0x57, sp), x
      009393 A6 30            [ 1]  343 	ld	a, #0x30
      009395 6B 01            [ 1]  344 	ld	(0x01, sp), a
      009397 20 70            [ 2]  345 	jra	00130$
                                    346 ;	./../../mib/stm8s_mib_vsprintf.c: 137: while (num != 0)
      009399                        347 00178$:
      009399 5F               [ 1]  348 	clrw	x
      00939A 1F 61            [ 2]  349 	ldw	(0x61, sp), x
      00939C 1F 5F            [ 2]  350 	ldw	(0x5f, sp), x
      00939E                        351 00125$:
      00939E 1E 67            [ 2]  352 	ldw	x, (0x67, sp)
      0093A0 26 04            [ 1]  353 	jrne	00347$
      0093A2 1E 65            [ 2]  354 	ldw	x, (0x65, sp)
      0093A4 27 5B            [ 1]  355 	jreq	00194$
      0093A6                        356 00347$:
                                    357 ;	./../../mib/stm8s_mib_vsprintf.c: 139: tmp[i++] = dig[((MMULONG) num) % (MMUSIGN) base];
      0093A6 16 61            [ 2]  358 	ldw	y, (0x61, sp)
      0093A8 17 59            [ 2]  359 	ldw	(0x59, sp), y
      0093AA 16 5F            [ 2]  360 	ldw	y, (0x5f, sp)
      0093AC 17 57            [ 2]  361 	ldw	(0x57, sp), y
      0093AE 1E 61            [ 2]  362 	ldw	x, (0x61, sp)
      0093B0 5C               [ 1]  363 	incw	x
      0093B1 1F 61            [ 2]  364 	ldw	(0x61, sp), x
      0093B3 26 05            [ 1]  365 	jrne	00348$
      0093B5 1E 5F            [ 2]  366 	ldw	x, (0x5f, sp)
      0093B7 5C               [ 1]  367 	incw	x
      0093B8 1F 5F            [ 2]  368 	ldw	(0x5f, sp), x
      0093BA                        369 00348$:
      0093BA 96               [ 1]  370 	ldw	x, sp
      0093BB 5C               [ 1]  371 	incw	x
      0093BC 72 FB 59         [ 2]  372 	addw	x, (0x59, sp)
      0093BF 1F 4D            [ 2]  373 	ldw	(0x4d, sp), x
      0093C1 16 65            [ 2]  374 	ldw	y, (0x65, sp)
      0093C3 17 4F            [ 2]  375 	ldw	(0x4f, sp), y
      0093C5 16 67            [ 2]  376 	ldw	y, (0x67, sp)
      0093C7 1E 6B            [ 2]  377 	ldw	x, (0x6b, sp)
      0093C9 1F 55            [ 2]  378 	ldw	(0x55, sp), x
      0093CB 5F               [ 1]  379 	clrw	x
      0093CC 1F 53            [ 2]  380 	ldw	(0x53, sp), x
      0093CE 90 89            [ 2]  381 	pushw	y
      0093D0 1E 57            [ 2]  382 	ldw	x, (0x57, sp)
      0093D2 89               [ 2]  383 	pushw	x
      0093D3 1E 57            [ 2]  384 	ldw	x, (0x57, sp)
      0093D5 89               [ 2]  385 	pushw	x
      0093D6 90 89            [ 2]  386 	pushw	y
      0093D8 1E 57            [ 2]  387 	ldw	x, (0x57, sp)
      0093DA 89               [ 2]  388 	pushw	x
      0093DB CD AA C1         [ 4]  389 	call	__modulong
      0093DE 5B 08            [ 2]  390 	addw	sp, #8
      0093E0 17 59            [ 2]  391 	ldw	(0x59, sp), y
      0093E2 90 85            [ 2]  392 	popw	y
      0093E4 72 FB 43         [ 2]  393 	addw	x, (0x43, sp)
      0093E7 F6               [ 1]  394 	ld	a, (x)
      0093E8 1E 4D            [ 2]  395 	ldw	x, (0x4d, sp)
      0093EA F7               [ 1]  396 	ld	(x), a
                                    397 ;	./../../mib/stm8s_mib_vsprintf.c: 140: num = ((MMULONG) num) / (MMUSIGN) base;
      0093EB 1E 55            [ 2]  398 	ldw	x, (0x55, sp)
      0093ED 89               [ 2]  399 	pushw	x
      0093EE 1E 55            [ 2]  400 	ldw	x, (0x55, sp)
      0093F0 89               [ 2]  401 	pushw	x
      0093F1 90 89            [ 2]  402 	pushw	y
      0093F3 1E 55            [ 2]  403 	ldw	x, (0x55, sp)
      0093F5 89               [ 2]  404 	pushw	x
      0093F6 CD AB 71         [ 4]  405 	call	__divulong
      0093F9 5B 08            [ 2]  406 	addw	sp, #8
      0093FB 1F 67            [ 2]  407 	ldw	(0x67, sp), x
      0093FD 17 65            [ 2]  408 	ldw	(0x65, sp), y
      0093FF 20 9D            [ 2]  409 	jra	00125$
      009401                        410 00194$:
      009401 16 61            [ 2]  411 	ldw	y, (0x61, sp)
      009403 17 59            [ 2]  412 	ldw	(0x59, sp), y
      009405 16 5F            [ 2]  413 	ldw	y, (0x5f, sp)
      009407 17 57            [ 2]  414 	ldw	(0x57, sp), y
      009409                        415 00130$:
                                    416 ;	./../../mib/stm8s_mib_vsprintf.c: 144: if (i > precision) precision = i;
      009409 1E 73            [ 2]  417 	ldw	x, (0x73, sp)
      00940B 13 59            [ 2]  418 	cpw	x, (0x59, sp)
      00940D 7B 72            [ 1]  419 	ld	a, (0x72, sp)
      00940F 12 58            [ 1]  420 	sbc	a, (0x58, sp)
      009411 7B 71            [ 1]  421 	ld	a, (0x71, sp)
      009413 12 57            [ 1]  422 	sbc	a, (0x57, sp)
      009415 2E 08            [ 1]  423 	jrsge	00132$
      009417 16 59            [ 2]  424 	ldw	y, (0x59, sp)
      009419 17 73            [ 2]  425 	ldw	(0x73, sp), y
      00941B 16 57            [ 2]  426 	ldw	y, (0x57, sp)
      00941D 17 71            [ 2]  427 	ldw	(0x71, sp), y
      00941F                        428 00132$:
                                    429 ;	./../../mib/stm8s_mib_vsprintf.c: 145: size -= precision;
      00941F 16 6F            [ 2]  430 	ldw	y, (0x6f, sp)
      009421 72 F2 73         [ 2]  431 	subw	y, (0x73, sp)
      009424 7B 6E            [ 1]  432 	ld	a, (0x6e, sp)
      009426 12 72            [ 1]  433 	sbc	a, (0x72, sp)
      009428 97               [ 1]  434 	ld	xl, a
      009429 7B 6D            [ 1]  435 	ld	a, (0x6d, sp)
      00942B 12 71            [ 1]  436 	sbc	a, (0x71, sp)
      00942D 95               [ 1]  437 	ld	xh, a
      00942E 17 6F            [ 2]  438 	ldw	(0x6f, sp), y
      009430 1F 6D            [ 2]  439 	ldw	(0x6d, sp), x
                                    440 ;	./../../mib/stm8s_mib_vsprintf.c: 146: if (!(type & (ZEROPAD | LEFT))) while (size-- > 0) *str++ = ' ';
      009432 7B 78            [ 1]  441 	ld	a, (0x78, sp)
      009434 A5 11            [ 1]  442 	bcp	a, #0x11
      009436 26 34            [ 1]  443 	jrne	00137$
      009438 16 6F            [ 2]  444 	ldw	y, (0x6f, sp)
      00943A 17 61            [ 2]  445 	ldw	(0x61, sp), y
      00943C 16 6D            [ 2]  446 	ldw	y, (0x6d, sp)
      00943E                        447 00133$:
      00943E 17 53            [ 2]  448 	ldw	(0x53, sp), y
      009440 1E 61            [ 2]  449 	ldw	x, (0x61, sp)
      009442 1F 55            [ 2]  450 	ldw	(0x55, sp), x
      009444 1E 61            [ 2]  451 	ldw	x, (0x61, sp)
      009446 1D 00 01         [ 2]  452 	subw	x, #0x0001
      009449 1F 61            [ 2]  453 	ldw	(0x61, sp), x
      00944B 24 02            [ 1]  454 	jrnc	00351$
      00944D 90 5A            [ 2]  455 	decw	y
      00944F                        456 00351$:
      00944F 5F               [ 1]  457 	clrw	x
      009450 13 55            [ 2]  458 	cpw	x, (0x55, sp)
      009452 4F               [ 1]  459 	clr	a
      009453 12 54            [ 1]  460 	sbc	a, (0x54, sp)
      009455 4F               [ 1]  461 	clr	a
      009456 12 53            [ 1]  462 	sbc	a, (0x53, sp)
      009458 2E 0C            [ 1]  463 	jrsge	00195$
      00945A 1E 5D            [ 2]  464 	ldw	x, (0x5d, sp)
      00945C A6 20            [ 1]  465 	ld	a, #0x20
      00945E F7               [ 1]  466 	ld	(x), a
      00945F 1E 5D            [ 2]  467 	ldw	x, (0x5d, sp)
      009461 5C               [ 1]  468 	incw	x
      009462 1F 5D            [ 2]  469 	ldw	(0x5d, sp), x
      009464 20 D8            [ 2]  470 	jra	00133$
      009466                        471 00195$:
      009466 17 6D            [ 2]  472 	ldw	(0x6d, sp), y
      009468 16 61            [ 2]  473 	ldw	y, (0x61, sp)
      00946A 17 6F            [ 2]  474 	ldw	(0x6f, sp), y
      00946C                        475 00137$:
                                    476 ;	./../../mib/stm8s_mib_vsprintf.c: 147: if (sign) *str++ = sign;
      00946C 0D 46            [ 1]  477 	tnz	(0x46, sp)
      00946E 27 0A            [ 1]  478 	jreq	00139$
      009470 1E 5D            [ 2]  479 	ldw	x, (0x5d, sp)
      009472 7B 46            [ 1]  480 	ld	a, (0x46, sp)
      009474 F7               [ 1]  481 	ld	(x), a
      009475 1E 5D            [ 2]  482 	ldw	x, (0x5d, sp)
      009477 5C               [ 1]  483 	incw	x
      009478 1F 5D            [ 2]  484 	ldw	(0x5d, sp), x
      00947A                        485 00139$:
                                    486 ;	./../../mib/stm8s_mib_vsprintf.c: 149: if (type & SPECIAL)
      00947A 1E 49            [ 2]  487 	ldw	x, (0x49, sp)
      00947C 26 04            [ 1]  488 	jrne	00356$
      00947E 1E 47            [ 2]  489 	ldw	x, (0x47, sp)
      009480 27 26            [ 1]  490 	jreq	00146$
      009482                        491 00356$:
                                    492 ;	./../../mib/stm8s_mib_vsprintf.c: 147: if (sign) *str++ = sign;
      009482 1E 5D            [ 2]  493 	ldw	x, (0x5d, sp)
      009484 5C               [ 1]  494 	incw	x
                                    495 ;	./../../mib/stm8s_mib_vsprintf.c: 151: if (base == 8)
      009485 0D 4C            [ 1]  496 	tnz	(0x4c, sp)
      009487 27 0A            [ 1]  497 	jreq	00143$
                                    498 ;	./../../mib/stm8s_mib_vsprintf.c: 152: *str++ = '0';
      009489 16 5D            [ 2]  499 	ldw	y, (0x5d, sp)
      00948B A6 30            [ 1]  500 	ld	a, #0x30
      00948D 90 F7            [ 1]  501 	ld	(y), a
      00948F 1F 5D            [ 2]  502 	ldw	(0x5d, sp), x
      009491 20 15            [ 2]  503 	jra	00146$
      009493                        504 00143$:
                                    505 ;	./../../mib/stm8s_mib_vsprintf.c: 153: else if (base == 16)
      009493 0D 4B            [ 1]  506 	tnz	(0x4b, sp)
      009495 27 11            [ 1]  507 	jreq	00146$
                                    508 ;	./../../mib/stm8s_mib_vsprintf.c: 155: *str++ = '0';
      009497 16 5D            [ 2]  509 	ldw	y, (0x5d, sp)
      009499 A6 30            [ 1]  510 	ld	a, #0x30
      00949B 90 F7            [ 1]  511 	ld	(y), a
                                    512 ;	./../../mib/stm8s_mib_vsprintf.c: 156: *str++ = digits[33];
      00949D 90 CE 01 58      [ 2]  513 	ldw	y, _digits+0
      0094A1 90 E6 21         [ 1]  514 	ld	a, (0x21, y)
      0094A4 F7               [ 1]  515 	ld	(x), a
      0094A5 5C               [ 1]  516 	incw	x
      0094A6 1F 5D            [ 2]  517 	ldw	(0x5d, sp), x
      0094A8                        518 00146$:
                                    519 ;	./../../mib/stm8s_mib_vsprintf.c: 160: if (!(type & LEFT)) while (size-- > 0) *str++ = c;
      0094A8 7B 78            [ 1]  520 	ld	a, (0x78, sp)
      0094AA A5 10            [ 1]  521 	bcp	a, #0x10
      0094AC 26 3D            [ 1]  522 	jrne	00189$
      0094AE 16 6F            [ 2]  523 	ldw	y, (0x6f, sp)
      0094B0 17 61            [ 2]  524 	ldw	(0x61, sp), y
      0094B2 16 6D            [ 2]  525 	ldw	y, (0x6d, sp)
      0094B4 17 5F            [ 2]  526 	ldw	(0x5f, sp), y
      0094B6                        527 00147$:
      0094B6 16 61            [ 2]  528 	ldw	y, (0x61, sp)
      0094B8 17 55            [ 2]  529 	ldw	(0x55, sp), y
      0094BA 16 5F            [ 2]  530 	ldw	y, (0x5f, sp)
      0094BC 17 53            [ 2]  531 	ldw	(0x53, sp), y
      0094BE 1E 61            [ 2]  532 	ldw	x, (0x61, sp)
      0094C0 1D 00 01         [ 2]  533 	subw	x, #0x0001
      0094C3 1F 61            [ 2]  534 	ldw	(0x61, sp), x
      0094C5 1E 5F            [ 2]  535 	ldw	x, (0x5f, sp)
      0094C7 24 01            [ 1]  536 	jrnc	00360$
      0094C9 5A               [ 2]  537 	decw	x
      0094CA                        538 00360$:
      0094CA 1F 5F            [ 2]  539 	ldw	(0x5f, sp), x
      0094CC 5F               [ 1]  540 	clrw	x
      0094CD 13 55            [ 2]  541 	cpw	x, (0x55, sp)
      0094CF 4F               [ 1]  542 	clr	a
      0094D0 12 54            [ 1]  543 	sbc	a, (0x54, sp)
      0094D2 4F               [ 1]  544 	clr	a
      0094D3 12 53            [ 1]  545 	sbc	a, (0x53, sp)
      0094D5 2E 0C            [ 1]  546 	jrsge	00196$
      0094D7 1E 5D            [ 2]  547 	ldw	x, (0x5d, sp)
      0094D9 7B 45            [ 1]  548 	ld	a, (0x45, sp)
      0094DB F7               [ 1]  549 	ld	(x), a
      0094DC 1E 5D            [ 2]  550 	ldw	x, (0x5d, sp)
      0094DE 5C               [ 1]  551 	incw	x
      0094DF 1F 5D            [ 2]  552 	ldw	(0x5d, sp), x
      0094E1 20 D3            [ 2]  553 	jra	00147$
                                    554 ;	./../../mib/stm8s_mib_vsprintf.c: 161: while (i < precision--) *str++ = '0';
      0094E3                        555 00196$:
      0094E3 16 61            [ 2]  556 	ldw	y, (0x61, sp)
      0094E5 17 6F            [ 2]  557 	ldw	(0x6f, sp), y
      0094E7 16 5F            [ 2]  558 	ldw	y, (0x5f, sp)
      0094E9 17 6D            [ 2]  559 	ldw	(0x6d, sp), y
      0094EB                        560 00189$:
      0094EB 16 5D            [ 2]  561 	ldw	y, (0x5d, sp)
      0094ED 1E 73            [ 2]  562 	ldw	x, (0x73, sp)
      0094EF 1F 61            [ 2]  563 	ldw	(0x61, sp), x
      0094F1 1E 71            [ 2]  564 	ldw	x, (0x71, sp)
      0094F3 1F 5F            [ 2]  565 	ldw	(0x5f, sp), x
      0094F5                        566 00152$:
      0094F5 1E 59            [ 2]  567 	ldw	x, (0x59, sp)
      0094F7 13 61            [ 2]  568 	cpw	x, (0x61, sp)
      0094F9 7B 58            [ 1]  569 	ld	a, (0x58, sp)
      0094FB 12 60            [ 1]  570 	sbc	a, (0x60, sp)
      0094FD 7B 57            [ 1]  571 	ld	a, (0x57, sp)
      0094FF 12 5F            [ 1]  572 	sbc	a, (0x5f, sp)
      009501 2E 16            [ 1]  573 	jrsge	00191$
      009503 1E 61            [ 2]  574 	ldw	x, (0x61, sp)
      009505 1D 00 01         [ 2]  575 	subw	x, #0x0001
      009508 1F 61            [ 2]  576 	ldw	(0x61, sp), x
      00950A 1E 5F            [ 2]  577 	ldw	x, (0x5f, sp)
      00950C 24 01            [ 1]  578 	jrnc	00364$
      00950E 5A               [ 2]  579 	decw	x
      00950F                        580 00364$:
      00950F 1F 5F            [ 2]  581 	ldw	(0x5f, sp), x
      009511 A6 30            [ 1]  582 	ld	a, #0x30
      009513 90 F7            [ 1]  583 	ld	(y), a
      009515 90 5C            [ 1]  584 	incw	y
      009517 20 DC            [ 2]  585 	jra	00152$
                                    586 ;	./../../mib/stm8s_mib_vsprintf.c: 162: while (i-- > 0) *str++ = tmp[i];
      009519                        587 00191$:
      009519 17 5B            [ 2]  588 	ldw	(0x5b, sp), y
      00951B 16 59            [ 2]  589 	ldw	y, (0x59, sp)
      00951D 17 61            [ 2]  590 	ldw	(0x61, sp), y
      00951F 16 57            [ 2]  591 	ldw	y, (0x57, sp)
      009521 17 5F            [ 2]  592 	ldw	(0x5f, sp), y
      009523                        593 00155$:
      009523 5F               [ 1]  594 	clrw	x
      009524 13 61            [ 2]  595 	cpw	x, (0x61, sp)
      009526 4F               [ 1]  596 	clr	a
      009527 12 60            [ 1]  597 	sbc	a, (0x60, sp)
      009529 4F               [ 1]  598 	clr	a
      00952A 12 5F            [ 1]  599 	sbc	a, (0x5f, sp)
      00952C 2E 1E            [ 1]  600 	jrsge	00193$
      00952E 1E 61            [ 2]  601 	ldw	x, (0x61, sp)
      009530 1D 00 01         [ 2]  602 	subw	x, #0x0001
      009533 1F 61            [ 2]  603 	ldw	(0x61, sp), x
      009535 1E 5F            [ 2]  604 	ldw	x, (0x5f, sp)
      009537 24 01            [ 1]  605 	jrnc	00366$
      009539 5A               [ 2]  606 	decw	x
      00953A                        607 00366$:
      00953A 1F 5F            [ 2]  608 	ldw	(0x5f, sp), x
      00953C 96               [ 1]  609 	ldw	x, sp
      00953D 5C               [ 1]  610 	incw	x
      00953E 72 FB 61         [ 2]  611 	addw	x, (0x61, sp)
      009541 F6               [ 1]  612 	ld	a, (x)
      009542 1E 5B            [ 2]  613 	ldw	x, (0x5b, sp)
      009544 F7               [ 1]  614 	ld	(x), a
      009545 1E 5B            [ 2]  615 	ldw	x, (0x5b, sp)
      009547 5C               [ 1]  616 	incw	x
      009548 1F 5B            [ 2]  617 	ldw	(0x5b, sp), x
      00954A 20 D7            [ 2]  618 	jra	00155$
                                    619 ;	./../../mib/stm8s_mib_vsprintf.c: 163: while (size-- > 0) *str++ = ' ';
      00954C                        620 00193$:
      00954C 16 5B            [ 2]  621 	ldw	y, (0x5b, sp)
      00954E 1E 6F            [ 2]  622 	ldw	x, (0x6f, sp)
      009550 1F 61            [ 2]  623 	ldw	(0x61, sp), x
      009552 1E 6D            [ 2]  624 	ldw	x, (0x6d, sp)
      009554 1F 5F            [ 2]  625 	ldw	(0x5f, sp), x
      009556                        626 00158$:
      009556 5F               [ 1]  627 	clrw	x
      009557 13 61            [ 2]  628 	cpw	x, (0x61, sp)
      009559 4F               [ 1]  629 	clr	a
      00955A 12 60            [ 1]  630 	sbc	a, (0x60, sp)
      00955C 4F               [ 1]  631 	clr	a
      00955D 12 5F            [ 1]  632 	sbc	a, (0x5f, sp)
      00955F 2E 16            [ 1]  633 	jrsge	00160$
      009561 1E 61            [ 2]  634 	ldw	x, (0x61, sp)
      009563 1D 00 01         [ 2]  635 	subw	x, #0x0001
      009566 1F 61            [ 2]  636 	ldw	(0x61, sp), x
      009568 1E 5F            [ 2]  637 	ldw	x, (0x5f, sp)
      00956A 24 01            [ 1]  638 	jrnc	00369$
      00956C 5A               [ 2]  639 	decw	x
      00956D                        640 00369$:
      00956D 1F 5F            [ 2]  641 	ldw	(0x5f, sp), x
      00956F A6 20            [ 1]  642 	ld	a, #0x20
      009571 90 F7            [ 1]  643 	ld	(y), a
      009573 90 5C            [ 1]  644 	incw	y
      009575 20 DF            [ 2]  645 	jra	00158$
      009577                        646 00160$:
                                    647 ;	./../../mib/stm8s_mib_vsprintf.c: 165: return str;
      009577 93               [ 1]  648 	ldw	x, y
      009578                        649 00161$:
                                    650 ;	./../../mib/stm8s_mib_vsprintf.c: 166: }
      009578 16 63            [ 2]  651 	ldw	y, (99, sp)
      00957A 5B 78            [ 2]  652 	addw	sp, #120
      00957C 90 FC            [ 2]  653 	jp	(y)
                                    654 ;	./../../mib/stm8s_mib_vsprintf.c: 172: MMRINT mm_vsprintf(char *buf, const char *fmt, va_list args)
                                    655 ;	-----------------------------------------
                                    656 ;	 function mm_vsprintf
                                    657 ;	-----------------------------------------
      00957E                        658 _mm_vsprintf:
      00957E 52 21            [ 2]  659 	sub	sp, #33
      009580 1F 1A            [ 2]  660 	ldw	(0x1a, sp), x
                                    661 ;	./../../mib/stm8s_mib_vsprintf.c: 186: char vStr[] = "<NULL>";
      009582 A6 3C            [ 1]  662 	ld	a, #0x3c
      009584 6B 0D            [ 1]  663 	ld	(0x0d, sp), a
      009586 A6 4E            [ 1]  664 	ld	a, #0x4e
      009588 6B 0E            [ 1]  665 	ld	(0x0e, sp), a
      00958A A6 55            [ 1]  666 	ld	a, #0x55
      00958C 6B 0F            [ 1]  667 	ld	(0x0f, sp), a
      00958E A6 4C            [ 1]  668 	ld	a, #0x4c
      009590 6B 10            [ 1]  669 	ld	(0x10, sp), a
      009592 6B 11            [ 1]  670 	ld	(0x11, sp), a
      009594 A6 3E            [ 1]  671 	ld	a, #0x3e
      009596 6B 12            [ 1]  672 	ld	(0x12, sp), a
      009598 0F 13            [ 1]  673 	clr	(0x13, sp)
                                    674 ;	./../../mib/stm8s_mib_vsprintf.c: 188: for (str = buf; *fmt; fmt++)
      00959A 16 1A            [ 2]  675 	ldw	y, (0x1a, sp)
      00959C 17 1C            [ 2]  676 	ldw	(0x1c, sp), y
      00959E                        677 00185$:
      00959E 16 24            [ 2]  678 	ldw	y, (0x24, sp)
      0095A0 17 20            [ 2]  679 	ldw	(0x20, sp), y
      0095A2 93               [ 1]  680 	ldw	x, y
      0095A3 F6               [ 1]  681 	ld	a, (x)
      0095A4 6B 1F            [ 1]  682 	ld	(0x1f, sp), a
      0095A6 26 03            [ 1]  683 	jrne	00437$
      0095A8 CC 99 A4         [ 2]  684 	jp	00180$
      0095AB                        685 00437$:
                                    686 ;	./../../mib/stm8s_mib_vsprintf.c: 190: if (*fmt != '%')
      0095AB 7B 1F            [ 1]  687 	ld	a, (0x1f, sp)
      0095AD A1 25            [ 1]  688 	cp	a, #0x25
      0095AF 27 0D            [ 1]  689 	jreq	00102$
                                    690 ;	./../../mib/stm8s_mib_vsprintf.c: 192: *str++ = *fmt;
      0095B1 1E 1C            [ 2]  691 	ldw	x, (0x1c, sp)
      0095B3 7B 1F            [ 1]  692 	ld	a, (0x1f, sp)
      0095B5 F7               [ 1]  693 	ld	(x), a
      0095B6 1E 1C            [ 2]  694 	ldw	x, (0x1c, sp)
      0095B8 5C               [ 1]  695 	incw	x
      0095B9 1F 1C            [ 2]  696 	ldw	(0x1c, sp), x
                                    697 ;	./../../mib/stm8s_mib_vsprintf.c: 193: continue;
      0095BB CC 99 9C         [ 2]  698 	jp	00179$
      0095BE                        699 00102$:
                                    700 ;	./../../mib/stm8s_mib_vsprintf.c: 197: flags = 0;
      0095BE 5F               [ 1]  701 	clrw	x
      0095BF 1F 0B            [ 2]  702 	ldw	(0x0b, sp), x
      0095C1 1F 09            [ 2]  703 	ldw	(0x09, sp), x
                                    704 ;	./../../mib/stm8s_mib_vsprintf.c: 198: repeat:
      0095C3 1E 20            [ 2]  705 	ldw	x, (0x20, sp)
      0095C5                        706 00103$:
                                    707 ;	./../../mib/stm8s_mib_vsprintf.c: 199: fmt++; // This also skips first '%'
      0095C5 5C               [ 1]  708 	incw	x
      0095C6 1F 24            [ 2]  709 	ldw	(0x24, sp), x
                                    710 ;	./../../mib/stm8s_mib_vsprintf.c: 200: switch (*fmt)
      0095C8 F6               [ 1]  711 	ld	a, (x)
      0095C9 6B 19            [ 1]  712 	ld	(0x19, sp), a
      0095CB A1 20            [ 1]  713 	cp	a, #0x20
      0095CD 27 2C            [ 1]  714 	jreq	00106$
      0095CF 7B 19            [ 1]  715 	ld	a, (0x19, sp)
      0095D1 A1 23            [ 1]  716 	cp	a, #0x23
      0095D3 27 2E            [ 1]  717 	jreq	00107$
      0095D5 7B 19            [ 1]  718 	ld	a, (0x19, sp)
      0095D7 A1 2B            [ 1]  719 	cp	a, #0x2b
      0095D9 27 18            [ 1]  720 	jreq	00105$
      0095DB 7B 19            [ 1]  721 	ld	a, (0x19, sp)
      0095DD A1 2D            [ 1]  722 	cp	a, #0x2d
      0095DF 27 0A            [ 1]  723 	jreq	00104$
      0095E1 7B 19            [ 1]  724 	ld	a, (0x19, sp)
      0095E3 A1 30            [ 1]  725 	cp	a, #0x30
      0095E5 27 24            [ 1]  726 	jreq	00108$
      0095E7 1F 24            [ 2]  727 	ldw	(0x24, sp), x
      0095E9 20 27            [ 2]  728 	jra	00109$
                                    729 ;	./../../mib/stm8s_mib_vsprintf.c: 202: case '-': flags |= LEFT; goto repeat;
      0095EB                        730 00104$:
      0095EB 7B 0C            [ 1]  731 	ld	a, (0x0c, sp)
      0095ED AA 10            [ 1]  732 	or	a, #0x10
      0095EF 6B 0C            [ 1]  733 	ld	(0x0c, sp), a
      0095F1 20 D2            [ 2]  734 	jra	00103$
                                    735 ;	./../../mib/stm8s_mib_vsprintf.c: 203: case '+': flags |= PLUS; goto repeat;
      0095F3                        736 00105$:
      0095F3 7B 0C            [ 1]  737 	ld	a, (0x0c, sp)
      0095F5 AA 04            [ 1]  738 	or	a, #0x04
      0095F7 6B 0C            [ 1]  739 	ld	(0x0c, sp), a
      0095F9 20 CA            [ 2]  740 	jra	00103$
                                    741 ;	./../../mib/stm8s_mib_vsprintf.c: 204: case ' ': flags |= SPACE; goto repeat;
      0095FB                        742 00106$:
      0095FB 7B 0C            [ 1]  743 	ld	a, (0x0c, sp)
      0095FD AA 08            [ 1]  744 	or	a, #0x08
      0095FF 6B 0C            [ 1]  745 	ld	(0x0c, sp), a
      009601 20 C2            [ 2]  746 	jra	00103$
                                    747 ;	./../../mib/stm8s_mib_vsprintf.c: 205: case '#': flags |= SPECIAL; goto repeat;
      009603                        748 00107$:
      009603 7B 0C            [ 1]  749 	ld	a, (0x0c, sp)
      009605 AA 20            [ 1]  750 	or	a, #0x20
      009607 6B 0C            [ 1]  751 	ld	(0x0c, sp), a
      009609 20 BA            [ 2]  752 	jra	00103$
                                    753 ;	./../../mib/stm8s_mib_vsprintf.c: 206: case '0': flags |= ZEROPAD; goto repeat;
      00960B                        754 00108$:
      00960B 04 0C            [ 1]  755 	srl	(0x0c, sp)
      00960D 99               [ 1]  756 	scf
      00960E 09 0C            [ 1]  757 	rlc	(0x0c, sp)
      009610 20 B3            [ 2]  758 	jra	00103$
                                    759 ;	./../../mib/stm8s_mib_vsprintf.c: 207: }
      009612                        760 00109$:
                                    761 ;	./../../mib/stm8s_mib_vsprintf.c: 210: field_width = -1;
      009612 5F               [ 1]  762 	clrw	x
      009613 5A               [ 2]  763 	decw	x
      009614 1F 20            [ 2]  764 	ldw	(0x20, sp), x
      009616 1F 1E            [ 2]  765 	ldw	(0x1e, sp), x
                                    766 ;	./../../mib/stm8s_mib_vsprintf.c: 211: if (is_digit(*fmt))
      009618 7B 19            [ 1]  767 	ld	a, (0x19, sp)
      00961A A1 30            [ 1]  768 	cp	a, #0x30
      00961C 25 11            [ 1]  769 	jrc	00115$
      00961E A1 39            [ 1]  770 	cp	a, #0x39
      009620 22 0D            [ 1]  771 	jrugt	00115$
                                    772 ;	./../../mib/stm8s_mib_vsprintf.c: 212: field_width = skip_atoi(&fmt);
      009622 96               [ 1]  773 	ldw	x, sp
      009623 1C 00 24         [ 2]  774 	addw	x, #36
      009626 CD 92 22         [ 4]  775 	call	_skip_atoi
      009629 1F 20            [ 2]  776 	ldw	(0x20, sp), x
      00962B 17 1E            [ 2]  777 	ldw	(0x1e, sp), y
      00962D 20 39            [ 2]  778 	jra	00116$
      00962F                        779 00115$:
                                    780 ;	./../../mib/stm8s_mib_vsprintf.c: 213: else if (*fmt == '*')
      00962F 1E 24            [ 2]  781 	ldw	x, (0x24, sp)
      009631 F6               [ 1]  782 	ld	a, (x)
      009632 A1 2A            [ 1]  783 	cp	a, #0x2a
      009634 26 32            [ 1]  784 	jrne	00116$
                                    785 ;	./../../mib/stm8s_mib_vsprintf.c: 215: fmt++;
      009636 5C               [ 1]  786 	incw	x
      009637 1F 24            [ 2]  787 	ldw	(0x24, sp), x
                                    788 ;	./../../mib/stm8s_mib_vsprintf.c: 216: field_width = va_arg(args, MMINT);
      009639 1E 26            [ 2]  789 	ldw	x, (0x26, sp)
      00963B 1C 00 04         [ 2]  790 	addw	x, #0x0004
      00963E 1F 26            [ 2]  791 	ldw	(0x26, sp), x
      009640 1D 00 04         [ 2]  792 	subw	x, #0x0004
      009643 90 93            [ 1]  793 	ldw	y, x
      009645 90 EE 02         [ 2]  794 	ldw	y, (0x2, y)
      009648 FE               [ 2]  795 	ldw	x, (x)
      009649 17 20            [ 2]  796 	ldw	(0x20, sp), y
      00964B 1F 1E            [ 2]  797 	ldw	(0x1e, sp), x
                                    798 ;	./../../mib/stm8s_mib_vsprintf.c: 217: if (field_width < 0)
      00964D 0D 1E            [ 1]  799 	tnz	(0x1e, sp)
      00964F 2A 17            [ 1]  800 	jrpl	00116$
                                    801 ;	./../../mib/stm8s_mib_vsprintf.c: 219: field_width = -field_width;
      009651 00 21            [ 1]  802 	neg	(0x21, sp)
      009653 4F               [ 1]  803 	clr	a
      009654 12 20            [ 1]  804 	sbc	a, (0x20, sp)
      009656 6B 20            [ 1]  805 	ld	(0x20, sp), a
      009658 4F               [ 1]  806 	clr	a
      009659 12 1F            [ 1]  807 	sbc	a, (0x1f, sp)
      00965B 6B 1F            [ 1]  808 	ld	(0x1f, sp), a
      00965D 4F               [ 1]  809 	clr	a
      00965E 12 1E            [ 1]  810 	sbc	a, (0x1e, sp)
      009660 6B 1E            [ 1]  811 	ld	(0x1e, sp), a
                                    812 ;	./../../mib/stm8s_mib_vsprintf.c: 220: flags |= LEFT;
      009662 7B 0C            [ 1]  813 	ld	a, (0x0c, sp)
      009664 AA 10            [ 1]  814 	or	a, #0x10
      009666 6B 0C            [ 1]  815 	ld	(0x0c, sp), a
      009668                        816 00116$:
                                    817 ;	./../../mib/stm8s_mib_vsprintf.c: 225: precision = -1;
      009668 5F               [ 1]  818 	clrw	x
      009669 5A               [ 2]  819 	decw	x
      00966A 1F 18            [ 2]  820 	ldw	(0x18, sp), x
      00966C 1F 16            [ 2]  821 	ldw	(0x16, sp), x
                                    822 ;	./../../mib/stm8s_mib_vsprintf.c: 226: if (*fmt == '.')
      00966E 16 24            [ 2]  823 	ldw	y, (0x24, sp)
      009670 17 14            [ 2]  824 	ldw	(0x14, sp), y
      009672 93               [ 1]  825 	ldw	x, y
      009673 F6               [ 1]  826 	ld	a, (x)
      009674 A1 2E            [ 1]  827 	cp	a, #0x2e
      009676 26 42            [ 1]  828 	jrne	00127$
                                    829 ;	./../../mib/stm8s_mib_vsprintf.c: 228: ++fmt;    
      009678 1E 14            [ 2]  830 	ldw	x, (0x14, sp)
      00967A 5C               [ 1]  831 	incw	x
                                    832 ;	./../../mib/stm8s_mib_vsprintf.c: 229: if (is_digit(*fmt))
      00967B 1F 24            [ 2]  833 	ldw	(0x24, sp), x
      00967D F6               [ 1]  834 	ld	a, (x)
      00967E A1 30            [ 1]  835 	cp	a, #0x30
      009680 25 11            [ 1]  836 	jrc	00121$
      009682 A1 39            [ 1]  837 	cp	a, #0x39
      009684 22 0D            [ 1]  838 	jrugt	00121$
                                    839 ;	./../../mib/stm8s_mib_vsprintf.c: 230: precision = skip_atoi(&fmt);
      009686 96               [ 1]  840 	ldw	x, sp
      009687 1C 00 24         [ 2]  841 	addw	x, #36
      00968A CD 92 22         [ 4]  842 	call	_skip_atoi
      00968D 1F 18            [ 2]  843 	ldw	(0x18, sp), x
      00968F 17 16            [ 2]  844 	ldw	(0x16, sp), y
      009691 20 1E            [ 2]  845 	jra	00122$
      009693                        846 00121$:
                                    847 ;	./../../mib/stm8s_mib_vsprintf.c: 231: else if (*fmt == '*')
      009693 1E 24            [ 2]  848 	ldw	x, (0x24, sp)
      009695 F6               [ 1]  849 	ld	a, (x)
      009696 A1 2A            [ 1]  850 	cp	a, #0x2a
      009698 26 17            [ 1]  851 	jrne	00122$
                                    852 ;	./../../mib/stm8s_mib_vsprintf.c: 233: ++fmt;
      00969A 5C               [ 1]  853 	incw	x
      00969B 1F 24            [ 2]  854 	ldw	(0x24, sp), x
                                    855 ;	./../../mib/stm8s_mib_vsprintf.c: 234: precision = va_arg(args, MMINT);
      00969D 1E 26            [ 2]  856 	ldw	x, (0x26, sp)
      00969F 1C 00 04         [ 2]  857 	addw	x, #0x0004
      0096A2 1F 26            [ 2]  858 	ldw	(0x26, sp), x
      0096A4 1D 00 04         [ 2]  859 	subw	x, #0x0004
      0096A7 90 93            [ 1]  860 	ldw	y, x
      0096A9 90 EE 02         [ 2]  861 	ldw	y, (0x2, y)
      0096AC FE               [ 2]  862 	ldw	x, (x)
      0096AD 17 18            [ 2]  863 	ldw	(0x18, sp), y
      0096AF 1F 16            [ 2]  864 	ldw	(0x16, sp), x
      0096B1                        865 00122$:
                                    866 ;	./../../mib/stm8s_mib_vsprintf.c: 236: if (precision < 0) precision = 0;
      0096B1 0D 16            [ 1]  867 	tnz	(0x16, sp)
      0096B3 2A 05            [ 1]  868 	jrpl	00127$
      0096B5 5F               [ 1]  869 	clrw	x
      0096B6 1F 18            [ 2]  870 	ldw	(0x18, sp), x
      0096B8 1F 16            [ 2]  871 	ldw	(0x16, sp), x
      0096BA                        872 00127$:
                                    873 ;	./../../mib/stm8s_mib_vsprintf.c: 240: qualifier = -1;
      0096BA 5F               [ 1]  874 	clrw	x
      0096BB 5A               [ 2]  875 	decw	x
      0096BC 1F 03            [ 2]  876 	ldw	(0x03, sp), x
      0096BE 1F 01            [ 2]  877 	ldw	(0x01, sp), x
                                    878 ;	./../../mib/stm8s_mib_vsprintf.c: 241: if (*fmt == 'h' || *fmt == 'l' || *fmt == 'L')
      0096C0 1E 24            [ 2]  879 	ldw	x, (0x24, sp)
      0096C2 F6               [ 1]  880 	ld	a, (x)
      0096C3 6B 15            [ 1]  881 	ld	(0x15, sp), a
      0096C5 A1 68            [ 1]  882 	cp	a, #0x68
      0096C7 27 0C            [ 1]  883 	jreq	00128$
      0096C9 7B 15            [ 1]  884 	ld	a, (0x15, sp)
      0096CB A1 6C            [ 1]  885 	cp	a, #0x6c
      0096CD 27 06            [ 1]  886 	jreq	00128$
      0096CF 7B 15            [ 1]  887 	ld	a, (0x15, sp)
      0096D1 A1 4C            [ 1]  888 	cp	a, #0x4c
      0096D3 26 0E            [ 1]  889 	jrne	00129$
      0096D5                        890 00128$:
                                    891 ;	./../../mib/stm8s_mib_vsprintf.c: 243: qualifier = *fmt;
      0096D5 1E 24            [ 2]  892 	ldw	x, (0x24, sp)
      0096D7 F6               [ 1]  893 	ld	a, (x)
      0096D8 6B 04            [ 1]  894 	ld	(0x04, sp), a
      0096DA 0F 03            [ 1]  895 	clr	(0x03, sp)
      0096DC 0F 02            [ 1]  896 	clr	(0x02, sp)
      0096DE 0F 01            [ 1]  897 	clr	(0x01, sp)
                                    898 ;	./../../mib/stm8s_mib_vsprintf.c: 244: fmt++;
      0096E0 5C               [ 1]  899 	incw	x
      0096E1 1F 24            [ 2]  900 	ldw	(0x24, sp), x
      0096E3                        901 00129$:
                                    902 ;	./../../mib/stm8s_mib_vsprintf.c: 248: base = 10;
      0096E3 AE 00 0A         [ 2]  903 	ldw	x, #0x000a
      0096E6 1F 07            [ 2]  904 	ldw	(0x07, sp), x
      0096E8 5F               [ 1]  905 	clrw	x
      0096E9 1F 05            [ 2]  906 	ldw	(0x05, sp), x
                                    907 ;	./../../mib/stm8s_mib_vsprintf.c: 250: switch (*fmt)
      0096EB 16 24            [ 2]  908 	ldw	y, (0x24, sp)
      0096ED 17 14            [ 2]  909 	ldw	(0x14, sp), y
      0096EF 93               [ 1]  910 	ldw	x, y
      0096F0 F6               [ 1]  911 	ld	a, (x)
      0096F1 A1 58            [ 1]  912 	cp	a, #0x58
      0096F3 26 03            [ 1]  913 	jrne	00482$
      0096F5 CC 98 EB         [ 2]  914 	jp	00161$
      0096F8                        915 00482$:
      0096F8 A1 63            [ 1]  916 	cp	a, #0x63
      0096FA 27 38            [ 1]  917 	jreq	00132$
      0096FC A1 64            [ 1]  918 	cp	a, #0x64
      0096FE 26 03            [ 1]  919 	jrne	00488$
      009700 CC 98 FB         [ 2]  920 	jp	00164$
      009703                        921 00488$:
      009703 A1 69            [ 1]  922 	cp	a, #0x69
      009705 26 03            [ 1]  923 	jrne	00491$
      009707 CC 98 FB         [ 2]  924 	jp	00164$
      00970A                        925 00491$:
      00970A A1 6E            [ 1]  926 	cp	a, #0x6e
      00970C 26 03            [ 1]  927 	jrne	00494$
      00970E CC 98 96         [ 2]  928 	jp	00156$
      009711                        929 00494$:
      009711 A1 6F            [ 1]  930 	cp	a, #0x6f
      009713 26 03            [ 1]  931 	jrne	00497$
      009715 CC 98 E1         [ 2]  932 	jp	00160$
      009718                        933 00497$:
      009718 A1 70            [ 1]  934 	cp	a, #0x70
      00971A 26 03            [ 1]  935 	jrne	00500$
      00971C CC 98 4B         [ 2]  936 	jp	00153$
      00971F                        937 00500$:
      00971F A1 73            [ 1]  938 	cp	a, #0x73
      009721 27 76            [ 1]  939 	jreq	00141$
      009723 A1 75            [ 1]  940 	cp	a, #0x75
      009725 26 03            [ 1]  941 	jrne	00506$
      009727 CC 99 25         [ 2]  942 	jp	00172$
      00972A                        943 00506$:
      00972A A1 78            [ 1]  944 	cp	a, #0x78
      00972C 26 03            [ 1]  945 	jrne	00509$
      00972E CC 98 F1         [ 2]  946 	jp	00162$
      009731                        947 00509$:
      009731 CC 99 03         [ 2]  948 	jp	00166$
                                    949 ;	./../../mib/stm8s_mib_vsprintf.c: 252: case 'c':
      009734                        950 00132$:
                                    951 ;	./../../mib/stm8s_mib_vsprintf.c: 253: if (!(flags & LEFT)) while (--field_width > 0) *str++ = ' ';
      009734 7B 0C            [ 1]  952 	ld	a, (0x0c, sp)
      009736 A5 10            [ 1]  953 	bcp	a, #0x10
      009738 26 25            [ 1]  954 	jrne	00137$
      00973A 16 1C            [ 2]  955 	ldw	y, (0x1c, sp)
      00973C                        956 00133$:
      00973C 1E 20            [ 2]  957 	ldw	x, (0x20, sp)
      00973E 1D 00 01         [ 2]  958 	subw	x, #0x0001
      009741 1F 20            [ 2]  959 	ldw	(0x20, sp), x
      009743 1E 1E            [ 2]  960 	ldw	x, (0x1e, sp)
      009745 24 01            [ 1]  961 	jrnc	00512$
      009747 5A               [ 2]  962 	decw	x
      009748                        963 00512$:
      009748 1F 1E            [ 2]  964 	ldw	(0x1e, sp), x
      00974A 5F               [ 1]  965 	clrw	x
      00974B 13 20            [ 2]  966 	cpw	x, (0x20, sp)
      00974D 4F               [ 1]  967 	clr	a
      00974E 12 1F            [ 1]  968 	sbc	a, (0x1f, sp)
      009750 4F               [ 1]  969 	clr	a
      009751 12 1E            [ 1]  970 	sbc	a, (0x1e, sp)
      009753 2E 08            [ 1]  971 	jrsge	00236$
      009755 A6 20            [ 1]  972 	ld	a, #0x20
      009757 90 F7            [ 1]  973 	ld	(y), a
      009759 90 5C            [ 1]  974 	incw	y
      00975B 20 DF            [ 2]  975 	jra	00133$
      00975D                        976 00236$:
      00975D 17 1C            [ 2]  977 	ldw	(0x1c, sp), y
      00975F                        978 00137$:
                                    979 ;	./../../mib/stm8s_mib_vsprintf.c: 254: *str++ = (MMUCHAR) va_arg(args, MMAINT); // test ok...
      00975F 1E 26            [ 2]  980 	ldw	x, (0x26, sp)
      009761 5C               [ 1]  981 	incw	x
      009762 5C               [ 1]  982 	incw	x
      009763 1F 26            [ 2]  983 	ldw	(0x26, sp), x
      009765 5A               [ 2]  984 	decw	x
      009766 5A               [ 2]  985 	decw	x
      009767 E6 01            [ 1]  986 	ld	a, (0x1, x)
      009769 1E 1C            [ 2]  987 	ldw	x, (0x1c, sp)
      00976B F7               [ 1]  988 	ld	(x), a
      00976C 1E 1C            [ 2]  989 	ldw	x, (0x1c, sp)
      00976E 5C               [ 1]  990 	incw	x
      00976F 1F 18            [ 2]  991 	ldw	(0x18, sp), x
                                    992 ;	./../../mib/stm8s_mib_vsprintf.c: 255: while (--field_width > 0) *str++ = ' ';
      009771                        993 00138$:
      009771 1E 20            [ 2]  994 	ldw	x, (0x20, sp)
      009773 1D 00 01         [ 2]  995 	subw	x, #0x0001
      009776 1F 20            [ 2]  996 	ldw	(0x20, sp), x
      009778 1E 1E            [ 2]  997 	ldw	x, (0x1e, sp)
      00977A 24 01            [ 1]  998 	jrnc	00514$
      00977C 5A               [ 2]  999 	decw	x
      00977D                       1000 00514$:
      00977D 1F 1E            [ 2] 1001 	ldw	(0x1e, sp), x
      00977F 5F               [ 1] 1002 	clrw	x
      009780 13 20            [ 2] 1003 	cpw	x, (0x20, sp)
      009782 4F               [ 1] 1004 	clr	a
      009783 12 1F            [ 1] 1005 	sbc	a, (0x1f, sp)
      009785 4F               [ 1] 1006 	clr	a
      009786 12 1E            [ 1] 1007 	sbc	a, (0x1e, sp)
      009788 2F 03            [ 1] 1008 	jrslt	00515$
      00978A CC 99 98         [ 2] 1009 	jp	00237$
      00978D                       1010 00515$:
      00978D 1E 18            [ 2] 1011 	ldw	x, (0x18, sp)
      00978F A6 20            [ 1] 1012 	ld	a, #0x20
      009791 F7               [ 1] 1013 	ld	(x), a
      009792 1E 18            [ 2] 1014 	ldw	x, (0x18, sp)
      009794 5C               [ 1] 1015 	incw	x
      009795 1F 18            [ 2] 1016 	ldw	(0x18, sp), x
      009797 20 D8            [ 2] 1017 	jra	00138$
                                   1018 ;	./../../mib/stm8s_mib_vsprintf.c: 258: case 's':
      009799                       1019 00141$:
                                   1020 ;	./../../mib/stm8s_mib_vsprintf.c: 259: s = va_arg(args, char *);
      009799 1E 26            [ 2] 1021 	ldw	x, (0x26, sp)
      00979B 5C               [ 1] 1022 	incw	x
      00979C 5C               [ 1] 1023 	incw	x
      00979D 1F 26            [ 2] 1024 	ldw	(0x26, sp), x
      00979F 5A               [ 2] 1025 	decw	x
      0097A0 5A               [ 2] 1026 	decw	x
      0097A1 FE               [ 2] 1027 	ldw	x, (x)
                                   1028 ;	./../../mib/stm8s_mib_vsprintf.c: 260: if (!s) s = vStr; // "<NULL>";
      0097A2 1F 14            [ 2] 1029 	ldw	(0x14, sp), x
      0097A4 26 06            [ 1] 1030 	jrne	00143$
      0097A6 96               [ 1] 1031 	ldw	x, sp
      0097A7 1C 00 0D         [ 2] 1032 	addw	x, #13
      0097AA 1F 14            [ 2] 1033 	ldw	(0x14, sp), x
      0097AC                       1034 00143$:
                                   1035 ;	./../../mib/stm8s_mib_vsprintf.c: 261: len = strnlen(s, precision);
      0097AC 1E 18            [ 2] 1036 	ldw	x, (0x18, sp)
      0097AE 89               [ 2] 1037 	pushw	x
      0097AF 1E 16            [ 2] 1038 	ldw	x, (0x16, sp)
      0097B1 CD 91 F9         [ 4] 1039 	call	_strnlen
      0097B4 1F 18            [ 2] 1040 	ldw	(0x18, sp), x
      0097B6 5F               [ 1] 1041 	clrw	x
      0097B7 1F 16            [ 2] 1042 	ldw	(0x16, sp), x
                                   1043 ;	./../../mib/stm8s_mib_vsprintf.c: 262: if (!(flags & LEFT)) while (len < field_width--) *str++ = ' ';
      0097B9 7B 0C            [ 1] 1044 	ld	a, (0x0c, sp)
      0097BB A5 10            [ 1] 1045 	bcp	a, #0x10
      0097BD 26 30            [ 1] 1046 	jrne	00225$
      0097BF                       1047 00144$:
      0097BF 16 20            [ 2] 1048 	ldw	y, (0x20, sp)
      0097C1 17 0B            [ 2] 1049 	ldw	(0x0b, sp), y
      0097C3 16 1E            [ 2] 1050 	ldw	y, (0x1e, sp)
      0097C5 17 09            [ 2] 1051 	ldw	(0x09, sp), y
      0097C7 1E 20            [ 2] 1052 	ldw	x, (0x20, sp)
      0097C9 1D 00 01         [ 2] 1053 	subw	x, #0x0001
      0097CC 1F 20            [ 2] 1054 	ldw	(0x20, sp), x
      0097CE 1E 1E            [ 2] 1055 	ldw	x, (0x1e, sp)
      0097D0 24 01            [ 1] 1056 	jrnc	00519$
      0097D2 5A               [ 2] 1057 	decw	x
      0097D3                       1058 00519$:
      0097D3 1F 1E            [ 2] 1059 	ldw	(0x1e, sp), x
      0097D5 1E 18            [ 2] 1060 	ldw	x, (0x18, sp)
      0097D7 13 0B            [ 2] 1061 	cpw	x, (0x0b, sp)
      0097D9 7B 17            [ 1] 1062 	ld	a, (0x17, sp)
      0097DB 12 0A            [ 1] 1063 	sbc	a, (0x0a, sp)
      0097DD 7B 16            [ 1] 1064 	ld	a, (0x16, sp)
      0097DF 12 09            [ 1] 1065 	sbc	a, (0x09, sp)
      0097E1 2E 0C            [ 1] 1066 	jrsge	00238$
      0097E3 1E 1C            [ 2] 1067 	ldw	x, (0x1c, sp)
      0097E5 A6 20            [ 1] 1068 	ld	a, #0x20
      0097E7 F7               [ 1] 1069 	ld	(x), a
      0097E8 1E 1C            [ 2] 1070 	ldw	x, (0x1c, sp)
      0097EA 5C               [ 1] 1071 	incw	x
      0097EB 1F 1C            [ 2] 1072 	ldw	(0x1c, sp), x
      0097ED 20 D0            [ 2] 1073 	jra	00144$
      0097EF                       1074 00238$:
                                   1075 ;	./../../mib/stm8s_mib_vsprintf.c: 263: for (i = 0; i < len; ++i) *str++ = *s++;
      0097EF                       1076 00225$:
      0097EF 5F               [ 1] 1077 	clrw	x
      0097F0 1F 0B            [ 2] 1078 	ldw	(0x0b, sp), x
      0097F2 1F 09            [ 2] 1079 	ldw	(0x09, sp), x
      0097F4                       1080 00182$:
      0097F4 1E 0B            [ 2] 1081 	ldw	x, (0x0b, sp)
      0097F6 13 18            [ 2] 1082 	cpw	x, (0x18, sp)
      0097F8 7B 0A            [ 1] 1083 	ld	a, (0x0a, sp)
      0097FA 12 17            [ 1] 1084 	sbc	a, (0x17, sp)
      0097FC 7B 09            [ 1] 1085 	ld	a, (0x09, sp)
      0097FE 12 16            [ 1] 1086 	sbc	a, (0x16, sp)
      009800 2E 1E            [ 1] 1087 	jrsge	00227$
      009802 1E 14            [ 2] 1088 	ldw	x, (0x14, sp)
      009804 F6               [ 1] 1089 	ld	a, (x)
      009805 1E 14            [ 2] 1090 	ldw	x, (0x14, sp)
      009807 5C               [ 1] 1091 	incw	x
      009808 1F 14            [ 2] 1092 	ldw	(0x14, sp), x
      00980A 1E 1C            [ 2] 1093 	ldw	x, (0x1c, sp)
      00980C F7               [ 1] 1094 	ld	(x), a
      00980D 1E 1C            [ 2] 1095 	ldw	x, (0x1c, sp)
      00980F 5C               [ 1] 1096 	incw	x
      009810 1F 1C            [ 2] 1097 	ldw	(0x1c, sp), x
      009812 1E 0B            [ 2] 1098 	ldw	x, (0x0b, sp)
      009814 5C               [ 1] 1099 	incw	x
      009815 1F 0B            [ 2] 1100 	ldw	(0x0b, sp), x
      009817 26 DB            [ 1] 1101 	jrne	00182$
      009819 1E 09            [ 2] 1102 	ldw	x, (0x09, sp)
      00981B 5C               [ 1] 1103 	incw	x
      00981C 1F 09            [ 2] 1104 	ldw	(0x09, sp), x
      00981E 20 D4            [ 2] 1105 	jra	00182$
                                   1106 ;	./../../mib/stm8s_mib_vsprintf.c: 264: while (len < field_width--) *str++ = ' ';
      009820                       1107 00227$:
      009820                       1108 00150$:
      009820 1E 18            [ 2] 1109 	ldw	x, (0x18, sp)
      009822 13 20            [ 2] 1110 	cpw	x, (0x20, sp)
      009824 7B 17            [ 1] 1111 	ld	a, (0x17, sp)
      009826 12 1F            [ 1] 1112 	sbc	a, (0x1f, sp)
      009828 7B 16            [ 1] 1113 	ld	a, (0x16, sp)
      00982A 12 1E            [ 1] 1114 	sbc	a, (0x1e, sp)
      00982C 2F 03            [ 1] 1115 	jrslt	00526$
      00982E CC 99 9C         [ 2] 1116 	jp	00240$
      009831                       1117 00526$:
      009831 1E 20            [ 2] 1118 	ldw	x, (0x20, sp)
      009833 1D 00 01         [ 2] 1119 	subw	x, #0x0001
      009836 1F 20            [ 2] 1120 	ldw	(0x20, sp), x
      009838 1E 1E            [ 2] 1121 	ldw	x, (0x1e, sp)
      00983A 24 01            [ 1] 1122 	jrnc	00527$
      00983C 5A               [ 2] 1123 	decw	x
      00983D                       1124 00527$:
      00983D 1F 1E            [ 2] 1125 	ldw	(0x1e, sp), x
      00983F 1E 1C            [ 2] 1126 	ldw	x, (0x1c, sp)
      009841 A6 20            [ 1] 1127 	ld	a, #0x20
      009843 F7               [ 1] 1128 	ld	(x), a
      009844 1E 1C            [ 2] 1129 	ldw	x, (0x1c, sp)
      009846 5C               [ 1] 1130 	incw	x
      009847 1F 1C            [ 2] 1131 	ldw	(0x1c, sp), x
      009849 20 D5            [ 2] 1132 	jra	00150$
                                   1133 ;	./../../mib/stm8s_mib_vsprintf.c: 267: case 'p':
      00984B                       1134 00153$:
                                   1135 ;	./../../mib/stm8s_mib_vsprintf.c: 268: if (field_width == -1)
      00984B 1E 20            [ 2] 1136 	ldw	x, (0x20, sp)
      00984D 5C               [ 1] 1137 	incw	x
      00984E 26 12            [ 1] 1138 	jrne	00155$
      009850 1E 1E            [ 2] 1139 	ldw	x, (0x1e, sp)
      009852 5C               [ 1] 1140 	incw	x
      009853 26 0D            [ 1] 1141 	jrne	00155$
                                   1142 ;	./../../mib/stm8s_mib_vsprintf.c: 270: field_width = 2 * sizeof(void *);
      009855 AE 00 04         [ 2] 1143 	ldw	x, #0x0004
      009858 1F 20            [ 2] 1144 	ldw	(0x20, sp), x
      00985A 5F               [ 1] 1145 	clrw	x
      00985B 1F 1E            [ 2] 1146 	ldw	(0x1e, sp), x
                                   1147 ;	./../../mib/stm8s_mib_vsprintf.c: 271: flags |= ZEROPAD;
      00985D 04 0C            [ 1] 1148 	srl	(0x0c, sp)
      00985F 99               [ 1] 1149 	scf
      009860 09 0C            [ 1] 1150 	rlc	(0x0c, sp)
      009862                       1151 00155$:
                                   1152 ;	./../../mib/stm8s_mib_vsprintf.c: 273: str = number(str, (MMULONG) va_arg(args, void *), 16, field_width, precision, flags);
      009862 1E 26            [ 2] 1153 	ldw	x, (0x26, sp)
      009864 5C               [ 1] 1154 	incw	x
      009865 5C               [ 1] 1155 	incw	x
      009866 1F 26            [ 2] 1156 	ldw	(0x26, sp), x
      009868 5A               [ 2] 1157 	decw	x
      009869 5A               [ 2] 1158 	decw	x
      00986A FE               [ 2] 1159 	ldw	x, (x)
      00986B 1F 07            [ 2] 1160 	ldw	(0x07, sp), x
      00986D 90 5F            [ 1] 1161 	clrw	y
      00986F 1E 0B            [ 2] 1162 	ldw	x, (0x0b, sp)
      009871 89               [ 2] 1163 	pushw	x
      009872 1E 0B            [ 2] 1164 	ldw	x, (0x0b, sp)
      009874 89               [ 2] 1165 	pushw	x
      009875 1E 1C            [ 2] 1166 	ldw	x, (0x1c, sp)
      009877 89               [ 2] 1167 	pushw	x
      009878 1E 1C            [ 2] 1168 	ldw	x, (0x1c, sp)
      00987A 89               [ 2] 1169 	pushw	x
      00987B 1E 28            [ 2] 1170 	ldw	x, (0x28, sp)
      00987D 89               [ 2] 1171 	pushw	x
      00987E 1E 28            [ 2] 1172 	ldw	x, (0x28, sp)
      009880 89               [ 2] 1173 	pushw	x
      009881 4B 10            [ 1] 1174 	push	#0x10
      009883 5F               [ 1] 1175 	clrw	x
      009884 89               [ 2] 1176 	pushw	x
      009885 4B 00            [ 1] 1177 	push	#0x00
      009887 1E 17            [ 2] 1178 	ldw	x, (0x17, sp)
      009889 89               [ 2] 1179 	pushw	x
      00988A 90 89            [ 2] 1180 	pushw	y
      00988C 1E 30            [ 2] 1181 	ldw	x, (0x30, sp)
      00988E CD 92 7C         [ 4] 1182 	call	_number
      009891 1F 1C            [ 2] 1183 	ldw	(0x1c, sp), x
                                   1184 ;	./../../mib/stm8s_mib_vsprintf.c: 274: continue;
      009893 CC 99 9C         [ 2] 1185 	jp	00179$
                                   1186 ;	./../../mib/stm8s_mib_vsprintf.c: 276: case 'n':
      009896                       1187 00156$:
                                   1188 ;	./../../mib/stm8s_mib_vsprintf.c: 277: if (qualifier == 'l')
      009896 1E 03            [ 2] 1189 	ldw	x, (0x03, sp)
      009898 A3 00 6C         [ 2] 1190 	cpw	x, #0x006c
      00989B 26 24            [ 1] 1191 	jrne	00158$
      00989D 1E 01            [ 2] 1192 	ldw	x, (0x01, sp)
      00989F 26 20            [ 1] 1193 	jrne	00158$
                                   1194 ;	./../../mib/stm8s_mib_vsprintf.c: 279: MMLONG *ip = va_arg(args, MMLONG *);
      0098A1 1E 26            [ 2] 1195 	ldw	x, (0x26, sp)
      0098A3 5C               [ 1] 1196 	incw	x
      0098A4 5C               [ 1] 1197 	incw	x
      0098A5 1F 26            [ 2] 1198 	ldw	(0x26, sp), x
      0098A7 5A               [ 2] 1199 	decw	x
      0098A8 5A               [ 2] 1200 	decw	x
      0098A9 FE               [ 2] 1201 	ldw	x, (x)
                                   1202 ;	./../../mib/stm8s_mib_vsprintf.c: 280: *ip = (str - buf);
      0098AA 16 1C            [ 2] 1203 	ldw	y, (0x1c, sp)
      0098AC 72 F2 1A         [ 2] 1204 	subw	y, (0x1a, sp)
      0098AF 90 9E            [ 1] 1205 	ld	a, yh
      0098B1 49               [ 1] 1206 	rlc	a
      0098B2 4F               [ 1] 1207 	clr	a
      0098B3 A2 00            [ 1] 1208 	sbc	a, #0x00
      0098B5 6B 1F            [ 1] 1209 	ld	(0x1f, sp), a
      0098B7 6B 1E            [ 1] 1210 	ld	(0x1e, sp), a
      0098B9 EF 02            [ 2] 1211 	ldw	(0x2, x), y
      0098BB 16 1E            [ 2] 1212 	ldw	y, (0x1e, sp)
      0098BD FF               [ 2] 1213 	ldw	(x), y
      0098BE CC 99 9C         [ 2] 1214 	jp	00179$
      0098C1                       1215 00158$:
                                   1216 ;	./../../mib/stm8s_mib_vsprintf.c: 284: MMINT *ip = va_arg(args, MMINT *);
      0098C1 1E 26            [ 2] 1217 	ldw	x, (0x26, sp)
      0098C3 5C               [ 1] 1218 	incw	x
      0098C4 5C               [ 1] 1219 	incw	x
      0098C5 1F 26            [ 2] 1220 	ldw	(0x26, sp), x
      0098C7 5A               [ 2] 1221 	decw	x
      0098C8 5A               [ 2] 1222 	decw	x
      0098C9 FE               [ 2] 1223 	ldw	x, (x)
                                   1224 ;	./../../mib/stm8s_mib_vsprintf.c: 285: *ip = (str - buf);
      0098CA 16 1C            [ 2] 1225 	ldw	y, (0x1c, sp)
      0098CC 72 F2 1A         [ 2] 1226 	subw	y, (0x1a, sp)
      0098CF 90 9E            [ 1] 1227 	ld	a, yh
      0098D1 49               [ 1] 1228 	rlc	a
      0098D2 4F               [ 1] 1229 	clr	a
      0098D3 A2 00            [ 1] 1230 	sbc	a, #0x00
      0098D5 6B 1F            [ 1] 1231 	ld	(0x1f, sp), a
      0098D7 6B 1E            [ 1] 1232 	ld	(0x1e, sp), a
      0098D9 EF 02            [ 2] 1233 	ldw	(0x2, x), y
      0098DB 16 1E            [ 2] 1234 	ldw	y, (0x1e, sp)
      0098DD FF               [ 2] 1235 	ldw	(x), y
                                   1236 ;	./../../mib/stm8s_mib_vsprintf.c: 287: continue;
      0098DE CC 99 9C         [ 2] 1237 	jp	00179$
                                   1238 ;	./../../mib/stm8s_mib_vsprintf.c: 290: case 'o':
      0098E1                       1239 00160$:
                                   1240 ;	./../../mib/stm8s_mib_vsprintf.c: 291: base = 8;
      0098E1 AE 00 08         [ 2] 1241 	ldw	x, #0x0008
      0098E4 1F 07            [ 2] 1242 	ldw	(0x07, sp), x
      0098E6 5F               [ 1] 1243 	clrw	x
      0098E7 1F 05            [ 2] 1244 	ldw	(0x05, sp), x
                                   1245 ;	./../../mib/stm8s_mib_vsprintf.c: 292: break;
      0098E9 20 3A            [ 2] 1246 	jra	00172$
                                   1247 ;	./../../mib/stm8s_mib_vsprintf.c: 294: case 'X':
      0098EB                       1248 00161$:
                                   1249 ;	./../../mib/stm8s_mib_vsprintf.c: 295: flags |= LARGE;
      0098EB 7B 0C            [ 1] 1250 	ld	a, (0x0c, sp)
      0098ED AA 40            [ 1] 1251 	or	a, #0x40
      0098EF 6B 0C            [ 1] 1252 	ld	(0x0c, sp), a
                                   1253 ;	./../../mib/stm8s_mib_vsprintf.c: 297: case 'x':
      0098F1                       1254 00162$:
                                   1255 ;	./../../mib/stm8s_mib_vsprintf.c: 298: base = 16;
      0098F1 AE 00 10         [ 2] 1256 	ldw	x, #0x0010
      0098F4 1F 07            [ 2] 1257 	ldw	(0x07, sp), x
      0098F6 5F               [ 1] 1258 	clrw	x
      0098F7 1F 05            [ 2] 1259 	ldw	(0x05, sp), x
                                   1260 ;	./../../mib/stm8s_mib_vsprintf.c: 299: break;
      0098F9 20 2A            [ 2] 1261 	jra	00172$
                                   1262 ;	./../../mib/stm8s_mib_vsprintf.c: 302: case 'i':
      0098FB                       1263 00164$:
                                   1264 ;	./../../mib/stm8s_mib_vsprintf.c: 303: flags |= SIGN;
      0098FB 7B 0C            [ 1] 1265 	ld	a, (0x0c, sp)
      0098FD AA 02            [ 1] 1266 	or	a, #0x02
      0098FF 6B 0C            [ 1] 1267 	ld	(0x0c, sp), a
                                   1268 ;	./../../mib/stm8s_mib_vsprintf.c: 306: break;
      009901 20 22            [ 2] 1269 	jra	00172$
                                   1270 ;	./../../mib/stm8s_mib_vsprintf.c: 308: default:
      009903                       1271 00166$:
                                   1272 ;	./../../mib/stm8s_mib_vsprintf.c: 309: if (*fmt != '%') *str++ = '%';
      009903 A1 25            [ 1] 1273 	cp	a, #0x25
      009905 27 0A            [ 1] 1274 	jreq	00168$
      009907 1E 1C            [ 2] 1275 	ldw	x, (0x1c, sp)
      009909 A6 25            [ 1] 1276 	ld	a, #0x25
      00990B F7               [ 1] 1277 	ld	(x), a
      00990C 1E 1C            [ 2] 1278 	ldw	x, (0x1c, sp)
      00990E 5C               [ 1] 1279 	incw	x
      00990F 1F 1C            [ 2] 1280 	ldw	(0x1c, sp), x
      009911                       1281 00168$:
                                   1282 ;	./../../mib/stm8s_mib_vsprintf.c: 310: if (*fmt)
      009911 1E 24            [ 2] 1283 	ldw	x, (0x24, sp)
      009913 F6               [ 1] 1284 	ld	a, (x)
      009914 27 0A            [ 1] 1285 	jreq	00170$
                                   1286 ;	./../../mib/stm8s_mib_vsprintf.c: 311: *str++ = *fmt;
      009916 1E 1C            [ 2] 1287 	ldw	x, (0x1c, sp)
      009918 F7               [ 1] 1288 	ld	(x), a
      009919 1E 1C            [ 2] 1289 	ldw	x, (0x1c, sp)
      00991B 5C               [ 1] 1290 	incw	x
      00991C 1F 1C            [ 2] 1291 	ldw	(0x1c, sp), x
      00991E 20 7C            [ 2] 1292 	jra	00179$
      009920                       1293 00170$:
                                   1294 ;	./../../mib/stm8s_mib_vsprintf.c: 313: --fmt;
      009920 5A               [ 2] 1295 	decw	x
      009921 1F 24            [ 2] 1296 	ldw	(0x24, sp), x
                                   1297 ;	./../../mib/stm8s_mib_vsprintf.c: 314: continue;
      009923 20 77            [ 2] 1298 	jra	00179$
                                   1299 ;	./../../mib/stm8s_mib_vsprintf.c: 315: }
      009925                       1300 00172$:
                                   1301 ;	./../../mib/stm8s_mib_vsprintf.c: 317: if (qualifier == 'l')
      009925 1E 03            [ 2] 1302 	ldw	x, (0x03, sp)
      009927 A3 00 6C         [ 2] 1303 	cpw	x, #0x006c
      00992A 26 1A            [ 1] 1304 	jrne	00177$
      00992C 1E 01            [ 2] 1305 	ldw	x, (0x01, sp)
      00992E 26 16            [ 1] 1306 	jrne	00177$
                                   1307 ;	./../../mib/stm8s_mib_vsprintf.c: 318: num = va_arg(args, MMUINT); // MMULONG); // test ok..
      009930 1E 26            [ 2] 1308 	ldw	x, (0x26, sp)
      009932 1C 00 04         [ 2] 1309 	addw	x, #0x0004
      009935 1F 26            [ 2] 1310 	ldw	(0x26, sp), x
      009937 1D 00 04         [ 2] 1311 	subw	x, #0x0004
      00993A 90 93            [ 1] 1312 	ldw	y, x
      00993C 90 EE 02         [ 2] 1313 	ldw	y, (0x2, y)
      00993F FE               [ 2] 1314 	ldw	x, (x)
      009940 17 03            [ 2] 1315 	ldw	(0x03, sp), y
      009942 1F 01            [ 2] 1316 	ldw	(0x01, sp), x
      009944 20 2B            [ 2] 1317 	jra	00178$
      009946                       1318 00177$:
                                   1319 ;	./../../mib/stm8s_mib_vsprintf.c: 328: else if (flags & SIGN)
      009946 7B 0C            [ 1] 1320 	ld	a, (0x0c, sp)
      009948 A5 02            [ 1] 1321 	bcp	a, #0x02
      00994A 27 17            [ 1] 1322 	jreq	00174$
                                   1323 ;	./../../mib/stm8s_mib_vsprintf.c: 329: num = va_arg(args, MMAINT); // test ok...
      00994C 1E 26            [ 2] 1324 	ldw	x, (0x26, sp)
      00994E 5C               [ 1] 1325 	incw	x
      00994F 5C               [ 1] 1326 	incw	x
      009950 1F 26            [ 2] 1327 	ldw	(0x26, sp), x
      009952 5A               [ 2] 1328 	decw	x
      009953 5A               [ 2] 1329 	decw	x
      009954 FE               [ 2] 1330 	ldw	x, (x)
      009955 1F 03            [ 2] 1331 	ldw	(0x03, sp), x
      009957 7B 03            [ 1] 1332 	ld	a, (0x03, sp)
      009959 49               [ 1] 1333 	rlc	a
      00995A 4F               [ 1] 1334 	clr	a
      00995B A2 00            [ 1] 1335 	sbc	a, #0x00
      00995D 6B 02            [ 1] 1336 	ld	(0x02, sp), a
      00995F 6B 01            [ 1] 1337 	ld	(0x01, sp), a
      009961 20 0E            [ 2] 1338 	jra	00178$
      009963                       1339 00174$:
                                   1340 ;	./../../mib/stm8s_mib_vsprintf.c: 331: num = va_arg(args, MMAUINT);
      009963 1E 26            [ 2] 1341 	ldw	x, (0x26, sp)
      009965 5C               [ 1] 1342 	incw	x
      009966 5C               [ 1] 1343 	incw	x
      009967 1F 26            [ 2] 1344 	ldw	(0x26, sp), x
      009969 5A               [ 2] 1345 	decw	x
      00996A 5A               [ 2] 1346 	decw	x
      00996B FE               [ 2] 1347 	ldw	x, (x)
      00996C 1F 03            [ 2] 1348 	ldw	(0x03, sp), x
      00996E 5F               [ 1] 1349 	clrw	x
      00996F 1F 01            [ 2] 1350 	ldw	(0x01, sp), x
      009971                       1351 00178$:
                                   1352 ;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
      009971 1E 0B            [ 2] 1353 	ldw	x, (0x0b, sp)
      009973 89               [ 2] 1354 	pushw	x
      009974 1E 0B            [ 2] 1355 	ldw	x, (0x0b, sp)
      009976 89               [ 2] 1356 	pushw	x
      009977 1E 1C            [ 2] 1357 	ldw	x, (0x1c, sp)
      009979 89               [ 2] 1358 	pushw	x
      00997A 1E 1C            [ 2] 1359 	ldw	x, (0x1c, sp)
      00997C 89               [ 2] 1360 	pushw	x
      00997D 1E 28            [ 2] 1361 	ldw	x, (0x28, sp)
      00997F 89               [ 2] 1362 	pushw	x
      009980 1E 28            [ 2] 1363 	ldw	x, (0x28, sp)
      009982 89               [ 2] 1364 	pushw	x
      009983 1E 13            [ 2] 1365 	ldw	x, (0x13, sp)
      009985 89               [ 2] 1366 	pushw	x
      009986 1E 13            [ 2] 1367 	ldw	x, (0x13, sp)
      009988 89               [ 2] 1368 	pushw	x
      009989 1E 13            [ 2] 1369 	ldw	x, (0x13, sp)
      00998B 89               [ 2] 1370 	pushw	x
      00998C 1E 13            [ 2] 1371 	ldw	x, (0x13, sp)
      00998E 89               [ 2] 1372 	pushw	x
      00998F 1E 30            [ 2] 1373 	ldw	x, (0x30, sp)
      009991 CD 92 7C         [ 4] 1374 	call	_number
      009994 1F 1C            [ 2] 1375 	ldw	(0x1c, sp), x
                                   1376 ;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
      009996 20 04            [ 2] 1377 	jra	00179$
                                   1378 ;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
      009998                       1379 00237$:
      009998 16 18            [ 2] 1380 	ldw	y, (0x18, sp)
      00999A 17 1C            [ 2] 1381 	ldw	(0x1c, sp), y
                                   1382 ;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
                                   1383 ;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
      00999C                       1384 00240$:
      00999C                       1385 00179$:
                                   1386 ;	./../../mib/stm8s_mib_vsprintf.c: 188: for (str = buf; *fmt; fmt++)
      00999C 1E 24            [ 2] 1387 	ldw	x, (0x24, sp)
      00999E 5C               [ 1] 1388 	incw	x
      00999F 1F 24            [ 2] 1389 	ldw	(0x24, sp), x
      0099A1 CC 95 9E         [ 2] 1390 	jp	00185$
      0099A4                       1391 00180$:
                                   1392 ;	./../../mib/stm8s_mib_vsprintf.c: 336: *str = '\0';
      0099A4 1E 1C            [ 2] 1393 	ldw	x, (0x1c, sp)
      0099A6 7F               [ 1] 1394 	clr	(x)
                                   1395 ;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
      0099A7 1E 1C            [ 2] 1396 	ldw	x, (0x1c, sp)
      0099A9 72 F0 1A         [ 2] 1397 	subw	x, (0x1a, sp)
                                   1398 ;	./../../mib/stm8s_mib_vsprintf.c: 338: }
      0099AC 16 22            [ 2] 1399 	ldw	y, (34, sp)
      0099AE 5B 27            [ 2] 1400 	addw	sp, #39
      0099B0 90 FC            [ 2] 1401 	jp	(y)
                                   1402 ;	./../../mib/stm8s_mib_vsprintf.c: 342: MMRINT mib_vsprintf(char *vpBuffer,char *format, ...)
                                   1403 ;	-----------------------------------------
                                   1404 ;	 function mib_vsprintf
                                   1405 ;	-----------------------------------------
      0099B2                       1406 _mib_vsprintf:
                                   1407 ;	./../../mib/stm8s_mib_vsprintf.c: 347: va_start(ap, format);
      0099B2 96               [ 1] 1408 	ldw	x, sp
      0099B3 1C 00 07         [ 2] 1409 	addw	x, #7
                                   1410 ;	./../../mib/stm8s_mib_vsprintf.c: 348: rc = mm_vsprintf(vpBuffer, format, ap);
      0099B6 89               [ 2] 1411 	pushw	x
      0099B7 1E 07            [ 2] 1412 	ldw	x, (0x07, sp)
      0099B9 89               [ 2] 1413 	pushw	x
      0099BA 1E 07            [ 2] 1414 	ldw	x, (0x07, sp)
      0099BC CD 95 7E         [ 4] 1415 	call	_mm_vsprintf
                                   1416 ;	./../../mib/stm8s_mib_vsprintf.c: 351: return (rc);
                                   1417 ;	./../../mib/stm8s_mib_vsprintf.c: 352: }
      0099BF 81               [ 4] 1418 	ret
                                   1419 ;	./../../mib/stm8s_mib_vsprintf.c: 363: MMRINT mib_printf(char *format, ...)
                                   1420 ;	-----------------------------------------
                                   1421 ;	 function mib_printf
                                   1422 ;	-----------------------------------------
      0099C0                       1423 _mib_printf:
      0099C0 52 82            [ 2] 1424 	sub	sp, #130
                                   1425 ;	./../../mib/stm8s_mib_vsprintf.c: 370: va_start(ap, format);
                                   1426 ;	./../../mib/stm8s_mib_vsprintf.c: 371: rc = mm_vsprintf(buffer, format, ap);
      0099C2 96               [ 1] 1427 	ldw	x, sp
      0099C3 1C 00 87         [ 2] 1428 	addw	x, #135
      0099C6 89               [ 2] 1429 	pushw	x
      0099C7 1E 87            [ 2] 1430 	ldw	x, (0x87, sp)
      0099C9 89               [ 2] 1431 	pushw	x
      0099CA 96               [ 1] 1432 	ldw	x, sp
      0099CB 1C 00 05         [ 2] 1433 	addw	x, #5
      0099CE CD 95 7E         [ 4] 1434 	call	_mm_vsprintf
      0099D1 1F 81            [ 2] 1435 	ldw	(0x81, sp), x
                                   1436 ;	./../../mib/stm8s_mib_vsprintf.c: 374: v_pString = (char *)buffer;
      0099D3 96               [ 1] 1437 	ldw	x, sp
      0099D4 5C               [ 1] 1438 	incw	x
                                   1439 ;	./../../mib/stm8s_mib_vsprintf.c: 375: while (*v_pString != 0)	MibWriteDebugByte((uint8_t)*v_pString++);
      0099D5                       1440 00101$:
      0099D5 F6               [ 1] 1441 	ld	a, (x)
      0099D6 27 08            [ 1] 1442 	jreq	00103$
      0099D8 5C               [ 1] 1443 	incw	x
      0099D9 89               [ 2] 1444 	pushw	x
      0099DA CD 8F 91         [ 4] 1445 	call	_MibWriteDebugByte
      0099DD 85               [ 2] 1446 	popw	x
      0099DE 20 F5            [ 2] 1447 	jra	00101$
      0099E0                       1448 00103$:
                                   1449 ;	./../../mib/stm8s_mib_vsprintf.c: 376: return (rc);
      0099E0 1E 81            [ 2] 1450 	ldw	x, (0x81, sp)
                                   1451 ;	./../../mib/stm8s_mib_vsprintf.c: 377: }
      0099E2 5B 82            [ 2] 1452 	addw	sp, #130
      0099E4 81               [ 4] 1453 	ret
                                   1454 	.area CODE
                                   1455 	.area CONST
                                   1456 	.area CONST
      0083DE                       1457 ___str_1:
      0083DE 30 31 32 33 34 35 36  1458 	.ascii "0123456789abcdefghijklmnopqrstuvwxyz"
             37 38 39 61 62 63 64
             65 66 67 68 69 6A 6B
             6C 6D 6E 6F 70 71 72
             73 74 75 76 77 78 79
             7A
      008402 00                    1459 	.db 0x00
                                   1460 	.area CODE
                                   1461 	.area CONST
      008403                       1462 ___str_2:
      008403 30 31 32 33 34 35 36  1463 	.ascii "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
             37 38 39 41 42 43 44
             45 46 47 48 49 4A 4B
             4C 4D 4E 4F 50 51 52
             53 54 55 56 57 58 59
             5A
      008427 00                    1464 	.db 0x00
                                   1465 	.area CODE
                                   1466 	.area INITIALIZER
      0089EA                       1467 __xinit__digits:
      0089EA 83 DE                 1468 	.dw ___str_1
      0089EC                       1469 __xinit__upper_digits:
      0089EC 84 03                 1470 	.dw ___str_2
                                   1471 	.area CABS (ABS)
