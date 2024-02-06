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
      000169                         23 _digits:
      000169                         24 	.ds 2
      00016B                         25 _upper_digits:
      00016B                         26 	.ds 2
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
      008EED                         60 _strnlen:
      008EED 52 06            [ 2]   61 	sub	sp, #6
      008EEF 1F 03            [ 2]   62 	ldw	(0x03, sp), x
                                     63 ;	./../../mib/stm8s_mib_vsprintf.c: 74: for (sc = s; *sc != '\0' && count--; ++sc);
      008EF1 16 09            [ 2]   64 	ldw	y, (0x09, sp)
      008EF3 17 05            [ 2]   65 	ldw	(0x05, sp), y
      008EF5 1E 03            [ 2]   66 	ldw	x, (0x03, sp)
      008EF7                         67 00104$:
      008EF7 F6               [ 1]   68 	ld	a, (x)
      008EF8 27 11            [ 1]   69 	jreq	00101$
      008EFA 16 05            [ 2]   70 	ldw	y, (0x05, sp)
      008EFC 17 01            [ 2]   71 	ldw	(0x01, sp), y
      008EFE 16 05            [ 2]   72 	ldw	y, (0x05, sp)
      008F00 90 5A            [ 2]   73 	decw	y
      008F02 17 05            [ 2]   74 	ldw	(0x05, sp), y
      008F04 16 01            [ 2]   75 	ldw	y, (0x01, sp)
      008F06 27 03            [ 1]   76 	jreq	00101$
      008F08 5C               [ 1]   77 	incw	x
      008F09 20 EC            [ 2]   78 	jra	00104$
      008F0B                         79 00101$:
                                     80 ;	./../../mib/stm8s_mib_vsprintf.c: 75: return sc - s;
      008F0B 72 F0 03         [ 2]   81 	subw	x, (0x03, sp)
                                     82 ;	./../../mib/stm8s_mib_vsprintf.c: 76: }
      008F0E 5B 06            [ 2]   83 	addw	sp, #6
      008F10 90 85            [ 2]   84 	popw	y
      008F12 5B 02            [ 2]   85 	addw	sp, #2
      008F14 90 FC            [ 2]   86 	jp	(y)
                                     87 ;	./../../mib/stm8s_mib_vsprintf.c: 81: static MMINT skip_atoi(const char **s)
                                     88 ;	-----------------------------------------
                                     89 ;	 function skip_atoi
                                     90 ;	-----------------------------------------
      008F16                         91 _skip_atoi:
      008F16 52 08            [ 2]   92 	sub	sp, #8
      008F18 1F 07            [ 2]   93 	ldw	(0x07, sp), x
                                     94 ;	./../../mib/stm8s_mib_vsprintf.c: 83: MMINT i = 0;
      008F1A 5F               [ 1]   95 	clrw	x
      008F1B 1F 05            [ 2]   96 	ldw	(0x05, sp), x
                                     97 ;	./../../mib/stm8s_mib_vsprintf.c: 84: while (is_digit(**s)) i = i*10 + *((*s)++) - '0';
      008F1D                         98 00102$:
      008F1D 16 07            [ 2]   99 	ldw	y, (0x07, sp)
      008F1F 90 FE            [ 2]  100 	ldw	y, (y)
      008F21 17 01            [ 2]  101 	ldw	(0x01, sp), y
      008F23 90 F6            [ 1]  102 	ld	a, (y)
      008F25 A1 30            [ 1]  103 	cp	a, #0x30
      008F27 25 41            [ 1]  104 	jrc	00104$
      008F29 A1 39            [ 1]  105 	cp	a, #0x39
      008F2B 22 3D            [ 1]  106 	jrugt	00104$
      008F2D 16 05            [ 2]  107 	ldw	y, (0x05, sp)
      008F2F 90 89            [ 2]  108 	pushw	y
      008F31 89               [ 2]  109 	pushw	x
      008F32 4B 0A            [ 1]  110 	push	#0x0a
      008F34 5F               [ 1]  111 	clrw	x
      008F35 89               [ 2]  112 	pushw	x
      008F36 4B 00            [ 1]  113 	push	#0x00
      008F38 CD A9 B9         [ 4]  114 	call	__mullong
      008F3B 5B 08            [ 2]  115 	addw	sp, #8
      008F3D 1F 05            [ 2]  116 	ldw	(0x05, sp), x
      008F3F 17 03            [ 2]  117 	ldw	(0x03, sp), y
      008F41 1E 01            [ 2]  118 	ldw	x, (0x01, sp)
      008F43 5C               [ 1]  119 	incw	x
      008F44 16 07            [ 2]  120 	ldw	y, (0x07, sp)
      008F46 90 FF            [ 2]  121 	ldw	(y), x
      008F48 1E 01            [ 2]  122 	ldw	x, (0x01, sp)
      008F4A F6               [ 1]  123 	ld	a, (x)
      008F4B 90 5F            [ 1]  124 	clrw	y
      008F4D 5F               [ 1]  125 	clrw	x
      008F4E 90 5D            [ 2]  126 	tnzw	y
      008F50 2A 01            [ 1]  127 	jrpl	00124$
      008F52 5A               [ 2]  128 	decw	x
      008F53                        129 00124$:
      008F53 90 97            [ 1]  130 	ld	yl, a
      008F55 72 F9 05         [ 2]  131 	addw	y, (0x05, sp)
      008F58 9F               [ 1]  132 	ld	a, xl
      008F59 19 04            [ 1]  133 	adc	a, (0x04, sp)
      008F5B 02               [ 1]  134 	rlwa	x
      008F5C 19 03            [ 1]  135 	adc	a, (0x03, sp)
      008F5E 95               [ 1]  136 	ld	xh, a
      008F5F 72 A2 00 30      [ 2]  137 	subw	y, #0x0030
      008F63 17 05            [ 2]  138 	ldw	(0x05, sp), y
      008F65 24 B6            [ 1]  139 	jrnc	00102$
      008F67 5A               [ 2]  140 	decw	x
      008F68 20 B3            [ 2]  141 	jra	00102$
      008F6A                        142 00104$:
                                    143 ;	./../../mib/stm8s_mib_vsprintf.c: 85: return i;
      008F6A 51               [ 1]  144 	exgw	x, y
      008F6B 1E 05            [ 2]  145 	ldw	x, (0x05, sp)
                                    146 ;	./../../mib/stm8s_mib_vsprintf.c: 86: }
      008F6D 5B 08            [ 2]  147 	addw	sp, #8
      008F6F 81               [ 4]  148 	ret
                                    149 ;	./../../mib/stm8s_mib_vsprintf.c: 91: static char *number(char *str, MMLONG num, MMINT base, MMINT size, MMINT precision, MMINT type)
                                    150 ;	-----------------------------------------
                                    151 ;	 function number
                                    152 ;	-----------------------------------------
      008F70                        153 _number:
      008F70 52 62            [ 2]  154 	sub	sp, #98
      008F72 1F 5D            [ 2]  155 	ldw	(0x5d, sp), x
                                    156 ;	./../../mib/stm8s_mib_vsprintf.c: 94: char *dig = digits;
      008F74 CE 01 69         [ 2]  157 	ldw	x, _digits+0
      008F77 1F 43            [ 2]  158 	ldw	(0x43, sp), x
                                    159 ;	./../../mib/stm8s_mib_vsprintf.c: 97: if (type & LARGE)  dig = upper_digits;
      008F79 7B 78            [ 1]  160 	ld	a, (0x78, sp)
      008F7B A5 40            [ 1]  161 	bcp	a, #0x40
      008F7D 27 05            [ 1]  162 	jreq	00102$
      008F7F CE 01 6B         [ 2]  163 	ldw	x, _upper_digits+0
      008F82 1F 43            [ 2]  164 	ldw	(0x43, sp), x
      008F84                        165 00102$:
                                    166 ;	./../../mib/stm8s_mib_vsprintf.c: 98: if (type & LEFT) type &= ~ZEROPAD;
      008F84 7B 78            [ 1]  167 	ld	a, (0x78, sp)
      008F86 A5 10            [ 1]  168 	bcp	a, #0x10
      008F88 27 0A            [ 1]  169 	jreq	00104$
      008F8A 1E 77            [ 2]  170 	ldw	x, (0x77, sp)
      008F8C 54               [ 2]  171 	srlw	x
      008F8D 58               [ 2]  172 	sllw	x
      008F8E 16 75            [ 2]  173 	ldw	y, (0x75, sp)
      008F90 1F 77            [ 2]  174 	ldw	(0x77, sp), x
      008F92 17 75            [ 2]  175 	ldw	(0x75, sp), y
      008F94                        176 00104$:
                                    177 ;	./../../mib/stm8s_mib_vsprintf.c: 99: if (base < 2 || base > 36) return 0;
      008F94 1E 6B            [ 2]  178 	ldw	x, (0x6b, sp)
      008F96 A3 00 02         [ 2]  179 	cpw	x, #0x0002
      008F99 7B 6A            [ 1]  180 	ld	a, (0x6a, sp)
      008F9B A2 00            [ 1]  181 	sbc	a, #0x00
      008F9D 7B 69            [ 1]  182 	ld	a, (0x69, sp)
      008F9F A2 00            [ 1]  183 	sbc	a, #0x00
      008FA1 2F 0D            [ 1]  184 	jrslt	00105$
      008FA3 AE 00 24         [ 2]  185 	ldw	x, #0x0024
      008FA6 13 6B            [ 2]  186 	cpw	x, (0x6b, sp)
      008FA8 4F               [ 1]  187 	clr	a
      008FA9 12 6A            [ 1]  188 	sbc	a, (0x6a, sp)
      008FAB 4F               [ 1]  189 	clr	a
      008FAC 12 69            [ 1]  190 	sbc	a, (0x69, sp)
      008FAE 2E 04            [ 1]  191 	jrsge	00106$
      008FB0                        192 00105$:
      008FB0 5F               [ 1]  193 	clrw	x
      008FB1 CC 92 6C         [ 2]  194 	jp	00161$
      008FB4                        195 00106$:
                                    196 ;	./../../mib/stm8s_mib_vsprintf.c: 101: c = (type & ZEROPAD) ? '0' : ' ';
      008FB4 7B 78            [ 1]  197 	ld	a, (0x78, sp)
      008FB6 44               [ 1]  198 	srl	a
      008FB7 24 03            [ 1]  199 	jrnc	00163$
      008FB9 A6 30            [ 1]  200 	ld	a, #0x30
      008FBB C5                     201 	.byte 0xc5
      008FBC                        202 00163$:
      008FBC A6 20            [ 1]  203 	ld	a, #0x20
      008FBE                        204 00164$:
      008FBE 6B 45            [ 1]  205 	ld	(0x45, sp), a
                                    206 ;	./../../mib/stm8s_mib_vsprintf.c: 102: sign = 0;
      008FC0 0F 46            [ 1]  207 	clr	(0x46, sp)
                                    208 ;	./../../mib/stm8s_mib_vsprintf.c: 103: if (type & SIGN)
      008FC2 7B 78            [ 1]  209 	ld	a, (0x78, sp)
      008FC4 A5 02            [ 1]  210 	bcp	a, #0x02
      008FC6 27 52            [ 1]  211 	jreq	00117$
                                    212 ;	./../../mib/stm8s_mib_vsprintf.c: 109: size--;
      008FC8 16 6F            [ 2]  213 	ldw	y, (0x6f, sp)
      008FCA 72 A2 00 01      [ 2]  214 	subw	y, #0x0001
      008FCE 1E 6D            [ 2]  215 	ldw	x, (0x6d, sp)
      008FD0 24 01            [ 1]  216 	jrnc	00330$
      008FD2 5A               [ 2]  217 	decw	x
      008FD3                        218 00330$:
      008FD3 1F 57            [ 2]  219 	ldw	(0x57, sp), x
                                    220 ;	./../../mib/stm8s_mib_vsprintf.c: 105: if (num < 0)
      008FD5 0D 65            [ 1]  221 	tnz	(0x65, sp)
      008FD7 2A 1F            [ 1]  222 	jrpl	00114$
                                    223 ;	./../../mib/stm8s_mib_vsprintf.c: 107: sign = '-';
      008FD9 A6 2D            [ 1]  224 	ld	a, #0x2d
      008FDB 6B 46            [ 1]  225 	ld	(0x46, sp), a
                                    226 ;	./../../mib/stm8s_mib_vsprintf.c: 108: num = -num;
      008FDD 1E 67            [ 2]  227 	ldw	x, (0x67, sp)
      008FDF 50               [ 2]  228 	negw	x
      008FE0 4F               [ 1]  229 	clr	a
      008FE1 12 66            [ 1]  230 	sbc	a, (0x66, sp)
      008FE3 6B 60            [ 1]  231 	ld	(0x60, sp), a
      008FE5 4F               [ 1]  232 	clr	a
      008FE6 12 65            [ 1]  233 	sbc	a, (0x65, sp)
      008FE8 1F 67            [ 2]  234 	ldw	(0x67, sp), x
      008FEA 6B 65            [ 1]  235 	ld	(0x65, sp), a
      008FEC 7B 60            [ 1]  236 	ld	a, (0x60, sp)
      008FEE 6B 66            [ 1]  237 	ld	(0x66, sp), a
                                    238 ;	./../../mib/stm8s_mib_vsprintf.c: 109: size--;
      008FF0 17 6F            [ 2]  239 	ldw	(0x6f, sp), y
      008FF2 16 57            [ 2]  240 	ldw	y, (0x57, sp)
      008FF4 17 6D            [ 2]  241 	ldw	(0x6d, sp), y
      008FF6 20 22            [ 2]  242 	jra	00117$
      008FF8                        243 00114$:
                                    244 ;	./../../mib/stm8s_mib_vsprintf.c: 111: else if (type & PLUS)
      008FF8 7B 78            [ 1]  245 	ld	a, (0x78, sp)
      008FFA A5 04            [ 1]  246 	bcp	a, #0x04
      008FFC 27 0C            [ 1]  247 	jreq	00111$
                                    248 ;	./../../mib/stm8s_mib_vsprintf.c: 113: sign = '+';
      008FFE A6 2B            [ 1]  249 	ld	a, #0x2b
      009000 6B 46            [ 1]  250 	ld	(0x46, sp), a
                                    251 ;	./../../mib/stm8s_mib_vsprintf.c: 114: size--;
      009002 17 6F            [ 2]  252 	ldw	(0x6f, sp), y
      009004 16 57            [ 2]  253 	ldw	y, (0x57, sp)
      009006 17 6D            [ 2]  254 	ldw	(0x6d, sp), y
      009008 20 10            [ 2]  255 	jra	00117$
      00900A                        256 00111$:
                                    257 ;	./../../mib/stm8s_mib_vsprintf.c: 116: else if (type & SPACE)
      00900A 7B 78            [ 1]  258 	ld	a, (0x78, sp)
      00900C A5 08            [ 1]  259 	bcp	a, #0x08
      00900E 27 0A            [ 1]  260 	jreq	00117$
                                    261 ;	./../../mib/stm8s_mib_vsprintf.c: 118: sign = ' ';
      009010 A6 20            [ 1]  262 	ld	a, #0x20
      009012 6B 46            [ 1]  263 	ld	(0x46, sp), a
                                    264 ;	./../../mib/stm8s_mib_vsprintf.c: 119: size--;
      009014 17 6F            [ 2]  265 	ldw	(0x6f, sp), y
      009016 16 57            [ 2]  266 	ldw	y, (0x57, sp)
      009018 17 6D            [ 2]  267 	ldw	(0x6d, sp), y
      00901A                        268 00117$:
                                    269 ;	./../../mib/stm8s_mib_vsprintf.c: 123: if (type & SPECIAL)
      00901A 7B 78            [ 1]  270 	ld	a, (0x78, sp)
      00901C A4 20            [ 1]  271 	and	a, #0x20
      00901E 6B 4A            [ 1]  272 	ld	(0x4a, sp), a
      009020 5F               [ 1]  273 	clrw	x
      009021 1F 48            [ 2]  274 	ldw	(0x48, sp), x
      009023 0F 47            [ 1]  275 	clr	(0x47, sp)
                                    276 ;	./../../mib/stm8s_mib_vsprintf.c: 125: if (base == 16)
      009025 1E 6B            [ 2]  277 	ldw	x, (0x6b, sp)
      009027 A3 00 10         [ 2]  278 	cpw	x, #0x0010
      00902A 26 09            [ 1]  279 	jrne	00335$
      00902C 1E 69            [ 2]  280 	ldw	x, (0x69, sp)
      00902E 26 05            [ 1]  281 	jrne	00335$
      009030 A6 01            [ 1]  282 	ld	a, #0x01
      009032 6B 4B            [ 1]  283 	ld	(0x4b, sp), a
      009034 C5                     284 	.byte 0xc5
      009035                        285 00335$:
      009035 0F 4B            [ 1]  286 	clr	(0x4b, sp)
      009037                        287 00336$:
                                    288 ;	./../../mib/stm8s_mib_vsprintf.c: 127: else if (base == 8)
      009037 1E 6B            [ 2]  289 	ldw	x, (0x6b, sp)
      009039 A3 00 08         [ 2]  290 	cpw	x, #0x0008
      00903C 26 09            [ 1]  291 	jrne	00338$
      00903E 1E 69            [ 2]  292 	ldw	x, (0x69, sp)
      009040 26 05            [ 1]  293 	jrne	00338$
      009042 A6 01            [ 1]  294 	ld	a, #0x01
      009044 6B 4C            [ 1]  295 	ld	(0x4c, sp), a
      009046 C5                     296 	.byte 0xc5
      009047                        297 00338$:
      009047 0F 4C            [ 1]  298 	clr	(0x4c, sp)
      009049                        299 00339$:
                                    300 ;	./../../mib/stm8s_mib_vsprintf.c: 123: if (type & SPECIAL)
      009049 1E 49            [ 2]  301 	ldw	x, (0x49, sp)
      00904B 26 04            [ 1]  302 	jrne	00340$
      00904D 1E 47            [ 2]  303 	ldw	x, (0x47, sp)
      00904F 27 28            [ 1]  304 	jreq	00124$
      009051                        305 00340$:
                                    306 ;	./../../mib/stm8s_mib_vsprintf.c: 125: if (base == 16)
      009051 0D 4B            [ 1]  307 	tnz	(0x4b, sp)
      009053 27 11            [ 1]  308 	jreq	00121$
                                    309 ;	./../../mib/stm8s_mib_vsprintf.c: 126: size -= 2;
      009055 1E 6F            [ 2]  310 	ldw	x, (0x6f, sp)
      009057 1D 00 02         [ 2]  311 	subw	x, #0x0002
      00905A 16 6D            [ 2]  312 	ldw	y, (0x6d, sp)
      00905C 24 02            [ 1]  313 	jrnc	00342$
      00905E 90 5A            [ 2]  314 	decw	y
      009060                        315 00342$:
      009060 1F 6F            [ 2]  316 	ldw	(0x6f, sp), x
      009062 17 6D            [ 2]  317 	ldw	(0x6d, sp), y
      009064 20 13            [ 2]  318 	jra	00124$
      009066                        319 00121$:
                                    320 ;	./../../mib/stm8s_mib_vsprintf.c: 127: else if (base == 8)
      009066 0D 4C            [ 1]  321 	tnz	(0x4c, sp)
      009068 27 0F            [ 1]  322 	jreq	00124$
                                    323 ;	./../../mib/stm8s_mib_vsprintf.c: 128: size--;
      00906A 1E 6F            [ 2]  324 	ldw	x, (0x6f, sp)
      00906C 1D 00 01         [ 2]  325 	subw	x, #0x0001
      00906F 16 6D            [ 2]  326 	ldw	y, (0x6d, sp)
      009071 24 02            [ 1]  327 	jrnc	00344$
      009073 90 5A            [ 2]  328 	decw	y
      009075                        329 00344$:
      009075 1F 6F            [ 2]  330 	ldw	(0x6f, sp), x
      009077 17 6D            [ 2]  331 	ldw	(0x6d, sp), y
      009079                        332 00124$:
                                    333 ;	./../../mib/stm8s_mib_vsprintf.c: 133: if (num == 0)
      009079 1E 67            [ 2]  334 	ldw	x, (0x67, sp)
      00907B 26 10            [ 1]  335 	jrne	00178$
                                    336 ;	./../../mib/stm8s_mib_vsprintf.c: 134: tmp[i++] = '0';
      00907D 1E 65            [ 2]  337 	ldw	x, (0x65, sp)
      00907F 26 0C            [ 1]  338 	jrne	00178$
      009081 5C               [ 1]  339 	incw	x
      009082 1F 59            [ 2]  340 	ldw	(0x59, sp), x
      009084 5F               [ 1]  341 	clrw	x
      009085 1F 57            [ 2]  342 	ldw	(0x57, sp), x
      009087 A6 30            [ 1]  343 	ld	a, #0x30
      009089 6B 01            [ 1]  344 	ld	(0x01, sp), a
      00908B 20 70            [ 2]  345 	jra	00130$
                                    346 ;	./../../mib/stm8s_mib_vsprintf.c: 137: while (num != 0)
      00908D                        347 00178$:
      00908D 5F               [ 1]  348 	clrw	x
      00908E 1F 61            [ 2]  349 	ldw	(0x61, sp), x
      009090 1F 5F            [ 2]  350 	ldw	(0x5f, sp), x
      009092                        351 00125$:
      009092 1E 67            [ 2]  352 	ldw	x, (0x67, sp)
      009094 26 04            [ 1]  353 	jrne	00347$
      009096 1E 65            [ 2]  354 	ldw	x, (0x65, sp)
      009098 27 5B            [ 1]  355 	jreq	00194$
      00909A                        356 00347$:
                                    357 ;	./../../mib/stm8s_mib_vsprintf.c: 139: tmp[i++] = dig[((MMULONG) num) % (MMUSIGN) base];
      00909A 16 61            [ 2]  358 	ldw	y, (0x61, sp)
      00909C 17 59            [ 2]  359 	ldw	(0x59, sp), y
      00909E 16 5F            [ 2]  360 	ldw	y, (0x5f, sp)
      0090A0 17 57            [ 2]  361 	ldw	(0x57, sp), y
      0090A2 1E 61            [ 2]  362 	ldw	x, (0x61, sp)
      0090A4 5C               [ 1]  363 	incw	x
      0090A5 1F 61            [ 2]  364 	ldw	(0x61, sp), x
      0090A7 26 05            [ 1]  365 	jrne	00348$
      0090A9 1E 5F            [ 2]  366 	ldw	x, (0x5f, sp)
      0090AB 5C               [ 1]  367 	incw	x
      0090AC 1F 5F            [ 2]  368 	ldw	(0x5f, sp), x
      0090AE                        369 00348$:
      0090AE 96               [ 1]  370 	ldw	x, sp
      0090AF 5C               [ 1]  371 	incw	x
      0090B0 72 FB 59         [ 2]  372 	addw	x, (0x59, sp)
      0090B3 1F 4D            [ 2]  373 	ldw	(0x4d, sp), x
      0090B5 16 65            [ 2]  374 	ldw	y, (0x65, sp)
      0090B7 17 4F            [ 2]  375 	ldw	(0x4f, sp), y
      0090B9 16 67            [ 2]  376 	ldw	y, (0x67, sp)
      0090BB 1E 6B            [ 2]  377 	ldw	x, (0x6b, sp)
      0090BD 1F 55            [ 2]  378 	ldw	(0x55, sp), x
      0090BF 5F               [ 1]  379 	clrw	x
      0090C0 1F 53            [ 2]  380 	ldw	(0x53, sp), x
      0090C2 90 89            [ 2]  381 	pushw	y
      0090C4 1E 57            [ 2]  382 	ldw	x, (0x57, sp)
      0090C6 89               [ 2]  383 	pushw	x
      0090C7 1E 57            [ 2]  384 	ldw	x, (0x57, sp)
      0090C9 89               [ 2]  385 	pushw	x
      0090CA 90 89            [ 2]  386 	pushw	y
      0090CC 1E 57            [ 2]  387 	ldw	x, (0x57, sp)
      0090CE 89               [ 2]  388 	pushw	x
      0090CF CD A7 D7         [ 4]  389 	call	__modulong
      0090D2 5B 08            [ 2]  390 	addw	sp, #8
      0090D4 17 59            [ 2]  391 	ldw	(0x59, sp), y
      0090D6 90 85            [ 2]  392 	popw	y
      0090D8 72 FB 43         [ 2]  393 	addw	x, (0x43, sp)
      0090DB F6               [ 1]  394 	ld	a, (x)
      0090DC 1E 4D            [ 2]  395 	ldw	x, (0x4d, sp)
      0090DE F7               [ 1]  396 	ld	(x), a
                                    397 ;	./../../mib/stm8s_mib_vsprintf.c: 140: num = ((MMULONG) num) / (MMUSIGN) base;
      0090DF 1E 55            [ 2]  398 	ldw	x, (0x55, sp)
      0090E1 89               [ 2]  399 	pushw	x
      0090E2 1E 55            [ 2]  400 	ldw	x, (0x55, sp)
      0090E4 89               [ 2]  401 	pushw	x
      0090E5 90 89            [ 2]  402 	pushw	y
      0090E7 1E 55            [ 2]  403 	ldw	x, (0x55, sp)
      0090E9 89               [ 2]  404 	pushw	x
      0090EA CD A8 87         [ 4]  405 	call	__divulong
      0090ED 5B 08            [ 2]  406 	addw	sp, #8
      0090EF 1F 67            [ 2]  407 	ldw	(0x67, sp), x
      0090F1 17 65            [ 2]  408 	ldw	(0x65, sp), y
      0090F3 20 9D            [ 2]  409 	jra	00125$
      0090F5                        410 00194$:
      0090F5 16 61            [ 2]  411 	ldw	y, (0x61, sp)
      0090F7 17 59            [ 2]  412 	ldw	(0x59, sp), y
      0090F9 16 5F            [ 2]  413 	ldw	y, (0x5f, sp)
      0090FB 17 57            [ 2]  414 	ldw	(0x57, sp), y
      0090FD                        415 00130$:
                                    416 ;	./../../mib/stm8s_mib_vsprintf.c: 144: if (i > precision) precision = i;
      0090FD 1E 73            [ 2]  417 	ldw	x, (0x73, sp)
      0090FF 13 59            [ 2]  418 	cpw	x, (0x59, sp)
      009101 7B 72            [ 1]  419 	ld	a, (0x72, sp)
      009103 12 58            [ 1]  420 	sbc	a, (0x58, sp)
      009105 7B 71            [ 1]  421 	ld	a, (0x71, sp)
      009107 12 57            [ 1]  422 	sbc	a, (0x57, sp)
      009109 2E 08            [ 1]  423 	jrsge	00132$
      00910B 16 59            [ 2]  424 	ldw	y, (0x59, sp)
      00910D 17 73            [ 2]  425 	ldw	(0x73, sp), y
      00910F 16 57            [ 2]  426 	ldw	y, (0x57, sp)
      009111 17 71            [ 2]  427 	ldw	(0x71, sp), y
      009113                        428 00132$:
                                    429 ;	./../../mib/stm8s_mib_vsprintf.c: 145: size -= precision;
      009113 16 6F            [ 2]  430 	ldw	y, (0x6f, sp)
      009115 72 F2 73         [ 2]  431 	subw	y, (0x73, sp)
      009118 7B 6E            [ 1]  432 	ld	a, (0x6e, sp)
      00911A 12 72            [ 1]  433 	sbc	a, (0x72, sp)
      00911C 97               [ 1]  434 	ld	xl, a
      00911D 7B 6D            [ 1]  435 	ld	a, (0x6d, sp)
      00911F 12 71            [ 1]  436 	sbc	a, (0x71, sp)
      009121 95               [ 1]  437 	ld	xh, a
      009122 17 6F            [ 2]  438 	ldw	(0x6f, sp), y
      009124 1F 6D            [ 2]  439 	ldw	(0x6d, sp), x
                                    440 ;	./../../mib/stm8s_mib_vsprintf.c: 146: if (!(type & (ZEROPAD | LEFT))) while (size-- > 0) *str++ = ' ';
      009126 7B 78            [ 1]  441 	ld	a, (0x78, sp)
      009128 A5 11            [ 1]  442 	bcp	a, #0x11
      00912A 26 34            [ 1]  443 	jrne	00137$
      00912C 16 6F            [ 2]  444 	ldw	y, (0x6f, sp)
      00912E 17 61            [ 2]  445 	ldw	(0x61, sp), y
      009130 16 6D            [ 2]  446 	ldw	y, (0x6d, sp)
      009132                        447 00133$:
      009132 17 53            [ 2]  448 	ldw	(0x53, sp), y
      009134 1E 61            [ 2]  449 	ldw	x, (0x61, sp)
      009136 1F 55            [ 2]  450 	ldw	(0x55, sp), x
      009138 1E 61            [ 2]  451 	ldw	x, (0x61, sp)
      00913A 1D 00 01         [ 2]  452 	subw	x, #0x0001
      00913D 1F 61            [ 2]  453 	ldw	(0x61, sp), x
      00913F 24 02            [ 1]  454 	jrnc	00351$
      009141 90 5A            [ 2]  455 	decw	y
      009143                        456 00351$:
      009143 5F               [ 1]  457 	clrw	x
      009144 13 55            [ 2]  458 	cpw	x, (0x55, sp)
      009146 4F               [ 1]  459 	clr	a
      009147 12 54            [ 1]  460 	sbc	a, (0x54, sp)
      009149 4F               [ 1]  461 	clr	a
      00914A 12 53            [ 1]  462 	sbc	a, (0x53, sp)
      00914C 2E 0C            [ 1]  463 	jrsge	00195$
      00914E 1E 5D            [ 2]  464 	ldw	x, (0x5d, sp)
      009150 A6 20            [ 1]  465 	ld	a, #0x20
      009152 F7               [ 1]  466 	ld	(x), a
      009153 1E 5D            [ 2]  467 	ldw	x, (0x5d, sp)
      009155 5C               [ 1]  468 	incw	x
      009156 1F 5D            [ 2]  469 	ldw	(0x5d, sp), x
      009158 20 D8            [ 2]  470 	jra	00133$
      00915A                        471 00195$:
      00915A 17 6D            [ 2]  472 	ldw	(0x6d, sp), y
      00915C 16 61            [ 2]  473 	ldw	y, (0x61, sp)
      00915E 17 6F            [ 2]  474 	ldw	(0x6f, sp), y
      009160                        475 00137$:
                                    476 ;	./../../mib/stm8s_mib_vsprintf.c: 147: if (sign) *str++ = sign;
      009160 0D 46            [ 1]  477 	tnz	(0x46, sp)
      009162 27 0A            [ 1]  478 	jreq	00139$
      009164 1E 5D            [ 2]  479 	ldw	x, (0x5d, sp)
      009166 7B 46            [ 1]  480 	ld	a, (0x46, sp)
      009168 F7               [ 1]  481 	ld	(x), a
      009169 1E 5D            [ 2]  482 	ldw	x, (0x5d, sp)
      00916B 5C               [ 1]  483 	incw	x
      00916C 1F 5D            [ 2]  484 	ldw	(0x5d, sp), x
      00916E                        485 00139$:
                                    486 ;	./../../mib/stm8s_mib_vsprintf.c: 149: if (type & SPECIAL)
      00916E 1E 49            [ 2]  487 	ldw	x, (0x49, sp)
      009170 26 04            [ 1]  488 	jrne	00356$
      009172 1E 47            [ 2]  489 	ldw	x, (0x47, sp)
      009174 27 26            [ 1]  490 	jreq	00146$
      009176                        491 00356$:
                                    492 ;	./../../mib/stm8s_mib_vsprintf.c: 147: if (sign) *str++ = sign;
      009176 1E 5D            [ 2]  493 	ldw	x, (0x5d, sp)
      009178 5C               [ 1]  494 	incw	x
                                    495 ;	./../../mib/stm8s_mib_vsprintf.c: 151: if (base == 8)
      009179 0D 4C            [ 1]  496 	tnz	(0x4c, sp)
      00917B 27 0A            [ 1]  497 	jreq	00143$
                                    498 ;	./../../mib/stm8s_mib_vsprintf.c: 152: *str++ = '0';
      00917D 16 5D            [ 2]  499 	ldw	y, (0x5d, sp)
      00917F A6 30            [ 1]  500 	ld	a, #0x30
      009181 90 F7            [ 1]  501 	ld	(y), a
      009183 1F 5D            [ 2]  502 	ldw	(0x5d, sp), x
      009185 20 15            [ 2]  503 	jra	00146$
      009187                        504 00143$:
                                    505 ;	./../../mib/stm8s_mib_vsprintf.c: 153: else if (base == 16)
      009187 0D 4B            [ 1]  506 	tnz	(0x4b, sp)
      009189 27 11            [ 1]  507 	jreq	00146$
                                    508 ;	./../../mib/stm8s_mib_vsprintf.c: 155: *str++ = '0';
      00918B 16 5D            [ 2]  509 	ldw	y, (0x5d, sp)
      00918D A6 30            [ 1]  510 	ld	a, #0x30
      00918F 90 F7            [ 1]  511 	ld	(y), a
                                    512 ;	./../../mib/stm8s_mib_vsprintf.c: 156: *str++ = digits[33];
      009191 90 CE 01 69      [ 2]  513 	ldw	y, _digits+0
      009195 90 E6 21         [ 1]  514 	ld	a, (0x21, y)
      009198 F7               [ 1]  515 	ld	(x), a
      009199 5C               [ 1]  516 	incw	x
      00919A 1F 5D            [ 2]  517 	ldw	(0x5d, sp), x
      00919C                        518 00146$:
                                    519 ;	./../../mib/stm8s_mib_vsprintf.c: 160: if (!(type & LEFT)) while (size-- > 0) *str++ = c;
      00919C 7B 78            [ 1]  520 	ld	a, (0x78, sp)
      00919E A5 10            [ 1]  521 	bcp	a, #0x10
      0091A0 26 3D            [ 1]  522 	jrne	00189$
      0091A2 16 6F            [ 2]  523 	ldw	y, (0x6f, sp)
      0091A4 17 61            [ 2]  524 	ldw	(0x61, sp), y
      0091A6 16 6D            [ 2]  525 	ldw	y, (0x6d, sp)
      0091A8 17 5F            [ 2]  526 	ldw	(0x5f, sp), y
      0091AA                        527 00147$:
      0091AA 16 61            [ 2]  528 	ldw	y, (0x61, sp)
      0091AC 17 55            [ 2]  529 	ldw	(0x55, sp), y
      0091AE 16 5F            [ 2]  530 	ldw	y, (0x5f, sp)
      0091B0 17 53            [ 2]  531 	ldw	(0x53, sp), y
      0091B2 1E 61            [ 2]  532 	ldw	x, (0x61, sp)
      0091B4 1D 00 01         [ 2]  533 	subw	x, #0x0001
      0091B7 1F 61            [ 2]  534 	ldw	(0x61, sp), x
      0091B9 1E 5F            [ 2]  535 	ldw	x, (0x5f, sp)
      0091BB 24 01            [ 1]  536 	jrnc	00360$
      0091BD 5A               [ 2]  537 	decw	x
      0091BE                        538 00360$:
      0091BE 1F 5F            [ 2]  539 	ldw	(0x5f, sp), x
      0091C0 5F               [ 1]  540 	clrw	x
      0091C1 13 55            [ 2]  541 	cpw	x, (0x55, sp)
      0091C3 4F               [ 1]  542 	clr	a
      0091C4 12 54            [ 1]  543 	sbc	a, (0x54, sp)
      0091C6 4F               [ 1]  544 	clr	a
      0091C7 12 53            [ 1]  545 	sbc	a, (0x53, sp)
      0091C9 2E 0C            [ 1]  546 	jrsge	00196$
      0091CB 1E 5D            [ 2]  547 	ldw	x, (0x5d, sp)
      0091CD 7B 45            [ 1]  548 	ld	a, (0x45, sp)
      0091CF F7               [ 1]  549 	ld	(x), a
      0091D0 1E 5D            [ 2]  550 	ldw	x, (0x5d, sp)
      0091D2 5C               [ 1]  551 	incw	x
      0091D3 1F 5D            [ 2]  552 	ldw	(0x5d, sp), x
      0091D5 20 D3            [ 2]  553 	jra	00147$
                                    554 ;	./../../mib/stm8s_mib_vsprintf.c: 161: while (i < precision--) *str++ = '0';
      0091D7                        555 00196$:
      0091D7 16 61            [ 2]  556 	ldw	y, (0x61, sp)
      0091D9 17 6F            [ 2]  557 	ldw	(0x6f, sp), y
      0091DB 16 5F            [ 2]  558 	ldw	y, (0x5f, sp)
      0091DD 17 6D            [ 2]  559 	ldw	(0x6d, sp), y
      0091DF                        560 00189$:
      0091DF 16 5D            [ 2]  561 	ldw	y, (0x5d, sp)
      0091E1 1E 73            [ 2]  562 	ldw	x, (0x73, sp)
      0091E3 1F 61            [ 2]  563 	ldw	(0x61, sp), x
      0091E5 1E 71            [ 2]  564 	ldw	x, (0x71, sp)
      0091E7 1F 5F            [ 2]  565 	ldw	(0x5f, sp), x
      0091E9                        566 00152$:
      0091E9 1E 59            [ 2]  567 	ldw	x, (0x59, sp)
      0091EB 13 61            [ 2]  568 	cpw	x, (0x61, sp)
      0091ED 7B 58            [ 1]  569 	ld	a, (0x58, sp)
      0091EF 12 60            [ 1]  570 	sbc	a, (0x60, sp)
      0091F1 7B 57            [ 1]  571 	ld	a, (0x57, sp)
      0091F3 12 5F            [ 1]  572 	sbc	a, (0x5f, sp)
      0091F5 2E 16            [ 1]  573 	jrsge	00191$
      0091F7 1E 61            [ 2]  574 	ldw	x, (0x61, sp)
      0091F9 1D 00 01         [ 2]  575 	subw	x, #0x0001
      0091FC 1F 61            [ 2]  576 	ldw	(0x61, sp), x
      0091FE 1E 5F            [ 2]  577 	ldw	x, (0x5f, sp)
      009200 24 01            [ 1]  578 	jrnc	00364$
      009202 5A               [ 2]  579 	decw	x
      009203                        580 00364$:
      009203 1F 5F            [ 2]  581 	ldw	(0x5f, sp), x
      009205 A6 30            [ 1]  582 	ld	a, #0x30
      009207 90 F7            [ 1]  583 	ld	(y), a
      009209 90 5C            [ 1]  584 	incw	y
      00920B 20 DC            [ 2]  585 	jra	00152$
                                    586 ;	./../../mib/stm8s_mib_vsprintf.c: 162: while (i-- > 0) *str++ = tmp[i];
      00920D                        587 00191$:
      00920D 17 5B            [ 2]  588 	ldw	(0x5b, sp), y
      00920F 16 59            [ 2]  589 	ldw	y, (0x59, sp)
      009211 17 61            [ 2]  590 	ldw	(0x61, sp), y
      009213 16 57            [ 2]  591 	ldw	y, (0x57, sp)
      009215 17 5F            [ 2]  592 	ldw	(0x5f, sp), y
      009217                        593 00155$:
      009217 5F               [ 1]  594 	clrw	x
      009218 13 61            [ 2]  595 	cpw	x, (0x61, sp)
      00921A 4F               [ 1]  596 	clr	a
      00921B 12 60            [ 1]  597 	sbc	a, (0x60, sp)
      00921D 4F               [ 1]  598 	clr	a
      00921E 12 5F            [ 1]  599 	sbc	a, (0x5f, sp)
      009220 2E 1E            [ 1]  600 	jrsge	00193$
      009222 1E 61            [ 2]  601 	ldw	x, (0x61, sp)
      009224 1D 00 01         [ 2]  602 	subw	x, #0x0001
      009227 1F 61            [ 2]  603 	ldw	(0x61, sp), x
      009229 1E 5F            [ 2]  604 	ldw	x, (0x5f, sp)
      00922B 24 01            [ 1]  605 	jrnc	00366$
      00922D 5A               [ 2]  606 	decw	x
      00922E                        607 00366$:
      00922E 1F 5F            [ 2]  608 	ldw	(0x5f, sp), x
      009230 96               [ 1]  609 	ldw	x, sp
      009231 5C               [ 1]  610 	incw	x
      009232 72 FB 61         [ 2]  611 	addw	x, (0x61, sp)
      009235 F6               [ 1]  612 	ld	a, (x)
      009236 1E 5B            [ 2]  613 	ldw	x, (0x5b, sp)
      009238 F7               [ 1]  614 	ld	(x), a
      009239 1E 5B            [ 2]  615 	ldw	x, (0x5b, sp)
      00923B 5C               [ 1]  616 	incw	x
      00923C 1F 5B            [ 2]  617 	ldw	(0x5b, sp), x
      00923E 20 D7            [ 2]  618 	jra	00155$
                                    619 ;	./../../mib/stm8s_mib_vsprintf.c: 163: while (size-- > 0) *str++ = ' ';
      009240                        620 00193$:
      009240 16 5B            [ 2]  621 	ldw	y, (0x5b, sp)
      009242 1E 6F            [ 2]  622 	ldw	x, (0x6f, sp)
      009244 1F 61            [ 2]  623 	ldw	(0x61, sp), x
      009246 1E 6D            [ 2]  624 	ldw	x, (0x6d, sp)
      009248 1F 5F            [ 2]  625 	ldw	(0x5f, sp), x
      00924A                        626 00158$:
      00924A 5F               [ 1]  627 	clrw	x
      00924B 13 61            [ 2]  628 	cpw	x, (0x61, sp)
      00924D 4F               [ 1]  629 	clr	a
      00924E 12 60            [ 1]  630 	sbc	a, (0x60, sp)
      009250 4F               [ 1]  631 	clr	a
      009251 12 5F            [ 1]  632 	sbc	a, (0x5f, sp)
      009253 2E 16            [ 1]  633 	jrsge	00160$
      009255 1E 61            [ 2]  634 	ldw	x, (0x61, sp)
      009257 1D 00 01         [ 2]  635 	subw	x, #0x0001
      00925A 1F 61            [ 2]  636 	ldw	(0x61, sp), x
      00925C 1E 5F            [ 2]  637 	ldw	x, (0x5f, sp)
      00925E 24 01            [ 1]  638 	jrnc	00369$
      009260 5A               [ 2]  639 	decw	x
      009261                        640 00369$:
      009261 1F 5F            [ 2]  641 	ldw	(0x5f, sp), x
      009263 A6 20            [ 1]  642 	ld	a, #0x20
      009265 90 F7            [ 1]  643 	ld	(y), a
      009267 90 5C            [ 1]  644 	incw	y
      009269 20 DF            [ 2]  645 	jra	00158$
      00926B                        646 00160$:
                                    647 ;	./../../mib/stm8s_mib_vsprintf.c: 165: return str;
      00926B 93               [ 1]  648 	ldw	x, y
      00926C                        649 00161$:
                                    650 ;	./../../mib/stm8s_mib_vsprintf.c: 166: }
      00926C 16 63            [ 2]  651 	ldw	y, (99, sp)
      00926E 5B 78            [ 2]  652 	addw	sp, #120
      009270 90 FC            [ 2]  653 	jp	(y)
                                    654 ;	./../../mib/stm8s_mib_vsprintf.c: 172: MMRINT mm_vsprintf(char *buf, const char *fmt, va_list args)
                                    655 ;	-----------------------------------------
                                    656 ;	 function mm_vsprintf
                                    657 ;	-----------------------------------------
      009272                        658 _mm_vsprintf:
      009272 52 21            [ 2]  659 	sub	sp, #33
      009274 1F 1A            [ 2]  660 	ldw	(0x1a, sp), x
                                    661 ;	./../../mib/stm8s_mib_vsprintf.c: 186: char vStr[] = "<NULL>";
      009276 A6 3C            [ 1]  662 	ld	a, #0x3c
      009278 6B 0D            [ 1]  663 	ld	(0x0d, sp), a
      00927A A6 4E            [ 1]  664 	ld	a, #0x4e
      00927C 6B 0E            [ 1]  665 	ld	(0x0e, sp), a
      00927E A6 55            [ 1]  666 	ld	a, #0x55
      009280 6B 0F            [ 1]  667 	ld	(0x0f, sp), a
      009282 A6 4C            [ 1]  668 	ld	a, #0x4c
      009284 6B 10            [ 1]  669 	ld	(0x10, sp), a
      009286 6B 11            [ 1]  670 	ld	(0x11, sp), a
      009288 A6 3E            [ 1]  671 	ld	a, #0x3e
      00928A 6B 12            [ 1]  672 	ld	(0x12, sp), a
      00928C 0F 13            [ 1]  673 	clr	(0x13, sp)
                                    674 ;	./../../mib/stm8s_mib_vsprintf.c: 188: for (str = buf; *fmt; fmt++)
      00928E 16 1A            [ 2]  675 	ldw	y, (0x1a, sp)
      009290 17 1C            [ 2]  676 	ldw	(0x1c, sp), y
      009292                        677 00185$:
      009292 16 24            [ 2]  678 	ldw	y, (0x24, sp)
      009294 17 20            [ 2]  679 	ldw	(0x20, sp), y
      009296 93               [ 1]  680 	ldw	x, y
      009297 F6               [ 1]  681 	ld	a, (x)
      009298 6B 1F            [ 1]  682 	ld	(0x1f, sp), a
      00929A 26 03            [ 1]  683 	jrne	00437$
      00929C CC 96 98         [ 2]  684 	jp	00180$
      00929F                        685 00437$:
                                    686 ;	./../../mib/stm8s_mib_vsprintf.c: 190: if (*fmt != '%')
      00929F 7B 1F            [ 1]  687 	ld	a, (0x1f, sp)
      0092A1 A1 25            [ 1]  688 	cp	a, #0x25
      0092A3 27 0D            [ 1]  689 	jreq	00102$
                                    690 ;	./../../mib/stm8s_mib_vsprintf.c: 192: *str++ = *fmt;
      0092A5 1E 1C            [ 2]  691 	ldw	x, (0x1c, sp)
      0092A7 7B 1F            [ 1]  692 	ld	a, (0x1f, sp)
      0092A9 F7               [ 1]  693 	ld	(x), a
      0092AA 1E 1C            [ 2]  694 	ldw	x, (0x1c, sp)
      0092AC 5C               [ 1]  695 	incw	x
      0092AD 1F 1C            [ 2]  696 	ldw	(0x1c, sp), x
                                    697 ;	./../../mib/stm8s_mib_vsprintf.c: 193: continue;
      0092AF CC 96 90         [ 2]  698 	jp	00179$
      0092B2                        699 00102$:
                                    700 ;	./../../mib/stm8s_mib_vsprintf.c: 197: flags = 0;
      0092B2 5F               [ 1]  701 	clrw	x
      0092B3 1F 0B            [ 2]  702 	ldw	(0x0b, sp), x
      0092B5 1F 09            [ 2]  703 	ldw	(0x09, sp), x
                                    704 ;	./../../mib/stm8s_mib_vsprintf.c: 198: repeat:
      0092B7 1E 20            [ 2]  705 	ldw	x, (0x20, sp)
      0092B9                        706 00103$:
                                    707 ;	./../../mib/stm8s_mib_vsprintf.c: 199: fmt++; // This also skips first '%'
      0092B9 5C               [ 1]  708 	incw	x
      0092BA 1F 24            [ 2]  709 	ldw	(0x24, sp), x
                                    710 ;	./../../mib/stm8s_mib_vsprintf.c: 200: switch (*fmt)
      0092BC F6               [ 1]  711 	ld	a, (x)
      0092BD 6B 19            [ 1]  712 	ld	(0x19, sp), a
      0092BF A1 20            [ 1]  713 	cp	a, #0x20
      0092C1 27 2C            [ 1]  714 	jreq	00106$
      0092C3 7B 19            [ 1]  715 	ld	a, (0x19, sp)
      0092C5 A1 23            [ 1]  716 	cp	a, #0x23
      0092C7 27 2E            [ 1]  717 	jreq	00107$
      0092C9 7B 19            [ 1]  718 	ld	a, (0x19, sp)
      0092CB A1 2B            [ 1]  719 	cp	a, #0x2b
      0092CD 27 18            [ 1]  720 	jreq	00105$
      0092CF 7B 19            [ 1]  721 	ld	a, (0x19, sp)
      0092D1 A1 2D            [ 1]  722 	cp	a, #0x2d
      0092D3 27 0A            [ 1]  723 	jreq	00104$
      0092D5 7B 19            [ 1]  724 	ld	a, (0x19, sp)
      0092D7 A1 30            [ 1]  725 	cp	a, #0x30
      0092D9 27 24            [ 1]  726 	jreq	00108$
      0092DB 1F 24            [ 2]  727 	ldw	(0x24, sp), x
      0092DD 20 27            [ 2]  728 	jra	00109$
                                    729 ;	./../../mib/stm8s_mib_vsprintf.c: 202: case '-': flags |= LEFT; goto repeat;
      0092DF                        730 00104$:
      0092DF 7B 0C            [ 1]  731 	ld	a, (0x0c, sp)
      0092E1 AA 10            [ 1]  732 	or	a, #0x10
      0092E3 6B 0C            [ 1]  733 	ld	(0x0c, sp), a
      0092E5 20 D2            [ 2]  734 	jra	00103$
                                    735 ;	./../../mib/stm8s_mib_vsprintf.c: 203: case '+': flags |= PLUS; goto repeat;
      0092E7                        736 00105$:
      0092E7 7B 0C            [ 1]  737 	ld	a, (0x0c, sp)
      0092E9 AA 04            [ 1]  738 	or	a, #0x04
      0092EB 6B 0C            [ 1]  739 	ld	(0x0c, sp), a
      0092ED 20 CA            [ 2]  740 	jra	00103$
                                    741 ;	./../../mib/stm8s_mib_vsprintf.c: 204: case ' ': flags |= SPACE; goto repeat;
      0092EF                        742 00106$:
      0092EF 7B 0C            [ 1]  743 	ld	a, (0x0c, sp)
      0092F1 AA 08            [ 1]  744 	or	a, #0x08
      0092F3 6B 0C            [ 1]  745 	ld	(0x0c, sp), a
      0092F5 20 C2            [ 2]  746 	jra	00103$
                                    747 ;	./../../mib/stm8s_mib_vsprintf.c: 205: case '#': flags |= SPECIAL; goto repeat;
      0092F7                        748 00107$:
      0092F7 7B 0C            [ 1]  749 	ld	a, (0x0c, sp)
      0092F9 AA 20            [ 1]  750 	or	a, #0x20
      0092FB 6B 0C            [ 1]  751 	ld	(0x0c, sp), a
      0092FD 20 BA            [ 2]  752 	jra	00103$
                                    753 ;	./../../mib/stm8s_mib_vsprintf.c: 206: case '0': flags |= ZEROPAD; goto repeat;
      0092FF                        754 00108$:
      0092FF 04 0C            [ 1]  755 	srl	(0x0c, sp)
      009301 99               [ 1]  756 	scf
      009302 09 0C            [ 1]  757 	rlc	(0x0c, sp)
      009304 20 B3            [ 2]  758 	jra	00103$
                                    759 ;	./../../mib/stm8s_mib_vsprintf.c: 207: }
      009306                        760 00109$:
                                    761 ;	./../../mib/stm8s_mib_vsprintf.c: 210: field_width = -1;
      009306 5F               [ 1]  762 	clrw	x
      009307 5A               [ 2]  763 	decw	x
      009308 1F 20            [ 2]  764 	ldw	(0x20, sp), x
      00930A 1F 1E            [ 2]  765 	ldw	(0x1e, sp), x
                                    766 ;	./../../mib/stm8s_mib_vsprintf.c: 211: if (is_digit(*fmt))
      00930C 7B 19            [ 1]  767 	ld	a, (0x19, sp)
      00930E A1 30            [ 1]  768 	cp	a, #0x30
      009310 25 11            [ 1]  769 	jrc	00115$
      009312 A1 39            [ 1]  770 	cp	a, #0x39
      009314 22 0D            [ 1]  771 	jrugt	00115$
                                    772 ;	./../../mib/stm8s_mib_vsprintf.c: 212: field_width = skip_atoi(&fmt);
      009316 96               [ 1]  773 	ldw	x, sp
      009317 1C 00 24         [ 2]  774 	addw	x, #36
      00931A CD 8F 16         [ 4]  775 	call	_skip_atoi
      00931D 1F 20            [ 2]  776 	ldw	(0x20, sp), x
      00931F 17 1E            [ 2]  777 	ldw	(0x1e, sp), y
      009321 20 39            [ 2]  778 	jra	00116$
      009323                        779 00115$:
                                    780 ;	./../../mib/stm8s_mib_vsprintf.c: 213: else if (*fmt == '*')
      009323 1E 24            [ 2]  781 	ldw	x, (0x24, sp)
      009325 F6               [ 1]  782 	ld	a, (x)
      009326 A1 2A            [ 1]  783 	cp	a, #0x2a
      009328 26 32            [ 1]  784 	jrne	00116$
                                    785 ;	./../../mib/stm8s_mib_vsprintf.c: 215: fmt++;
      00932A 5C               [ 1]  786 	incw	x
      00932B 1F 24            [ 2]  787 	ldw	(0x24, sp), x
                                    788 ;	./../../mib/stm8s_mib_vsprintf.c: 216: field_width = va_arg(args, MMINT);
      00932D 1E 26            [ 2]  789 	ldw	x, (0x26, sp)
      00932F 1C 00 04         [ 2]  790 	addw	x, #0x0004
      009332 1F 26            [ 2]  791 	ldw	(0x26, sp), x
      009334 1D 00 04         [ 2]  792 	subw	x, #0x0004
      009337 90 93            [ 1]  793 	ldw	y, x
      009339 90 EE 02         [ 2]  794 	ldw	y, (0x2, y)
      00933C FE               [ 2]  795 	ldw	x, (x)
      00933D 17 20            [ 2]  796 	ldw	(0x20, sp), y
      00933F 1F 1E            [ 2]  797 	ldw	(0x1e, sp), x
                                    798 ;	./../../mib/stm8s_mib_vsprintf.c: 217: if (field_width < 0)
      009341 0D 1E            [ 1]  799 	tnz	(0x1e, sp)
      009343 2A 17            [ 1]  800 	jrpl	00116$
                                    801 ;	./../../mib/stm8s_mib_vsprintf.c: 219: field_width = -field_width;
      009345 00 21            [ 1]  802 	neg	(0x21, sp)
      009347 4F               [ 1]  803 	clr	a
      009348 12 20            [ 1]  804 	sbc	a, (0x20, sp)
      00934A 6B 20            [ 1]  805 	ld	(0x20, sp), a
      00934C 4F               [ 1]  806 	clr	a
      00934D 12 1F            [ 1]  807 	sbc	a, (0x1f, sp)
      00934F 6B 1F            [ 1]  808 	ld	(0x1f, sp), a
      009351 4F               [ 1]  809 	clr	a
      009352 12 1E            [ 1]  810 	sbc	a, (0x1e, sp)
      009354 6B 1E            [ 1]  811 	ld	(0x1e, sp), a
                                    812 ;	./../../mib/stm8s_mib_vsprintf.c: 220: flags |= LEFT;
      009356 7B 0C            [ 1]  813 	ld	a, (0x0c, sp)
      009358 AA 10            [ 1]  814 	or	a, #0x10
      00935A 6B 0C            [ 1]  815 	ld	(0x0c, sp), a
      00935C                        816 00116$:
                                    817 ;	./../../mib/stm8s_mib_vsprintf.c: 225: precision = -1;
      00935C 5F               [ 1]  818 	clrw	x
      00935D 5A               [ 2]  819 	decw	x
      00935E 1F 18            [ 2]  820 	ldw	(0x18, sp), x
      009360 1F 16            [ 2]  821 	ldw	(0x16, sp), x
                                    822 ;	./../../mib/stm8s_mib_vsprintf.c: 226: if (*fmt == '.')
      009362 16 24            [ 2]  823 	ldw	y, (0x24, sp)
      009364 17 14            [ 2]  824 	ldw	(0x14, sp), y
      009366 93               [ 1]  825 	ldw	x, y
      009367 F6               [ 1]  826 	ld	a, (x)
      009368 A1 2E            [ 1]  827 	cp	a, #0x2e
      00936A 26 42            [ 1]  828 	jrne	00127$
                                    829 ;	./../../mib/stm8s_mib_vsprintf.c: 228: ++fmt;    
      00936C 1E 14            [ 2]  830 	ldw	x, (0x14, sp)
      00936E 5C               [ 1]  831 	incw	x
                                    832 ;	./../../mib/stm8s_mib_vsprintf.c: 229: if (is_digit(*fmt))
      00936F 1F 24            [ 2]  833 	ldw	(0x24, sp), x
      009371 F6               [ 1]  834 	ld	a, (x)
      009372 A1 30            [ 1]  835 	cp	a, #0x30
      009374 25 11            [ 1]  836 	jrc	00121$
      009376 A1 39            [ 1]  837 	cp	a, #0x39
      009378 22 0D            [ 1]  838 	jrugt	00121$
                                    839 ;	./../../mib/stm8s_mib_vsprintf.c: 230: precision = skip_atoi(&fmt);
      00937A 96               [ 1]  840 	ldw	x, sp
      00937B 1C 00 24         [ 2]  841 	addw	x, #36
      00937E CD 8F 16         [ 4]  842 	call	_skip_atoi
      009381 1F 18            [ 2]  843 	ldw	(0x18, sp), x
      009383 17 16            [ 2]  844 	ldw	(0x16, sp), y
      009385 20 1E            [ 2]  845 	jra	00122$
      009387                        846 00121$:
                                    847 ;	./../../mib/stm8s_mib_vsprintf.c: 231: else if (*fmt == '*')
      009387 1E 24            [ 2]  848 	ldw	x, (0x24, sp)
      009389 F6               [ 1]  849 	ld	a, (x)
      00938A A1 2A            [ 1]  850 	cp	a, #0x2a
      00938C 26 17            [ 1]  851 	jrne	00122$
                                    852 ;	./../../mib/stm8s_mib_vsprintf.c: 233: ++fmt;
      00938E 5C               [ 1]  853 	incw	x
      00938F 1F 24            [ 2]  854 	ldw	(0x24, sp), x
                                    855 ;	./../../mib/stm8s_mib_vsprintf.c: 234: precision = va_arg(args, MMINT);
      009391 1E 26            [ 2]  856 	ldw	x, (0x26, sp)
      009393 1C 00 04         [ 2]  857 	addw	x, #0x0004
      009396 1F 26            [ 2]  858 	ldw	(0x26, sp), x
      009398 1D 00 04         [ 2]  859 	subw	x, #0x0004
      00939B 90 93            [ 1]  860 	ldw	y, x
      00939D 90 EE 02         [ 2]  861 	ldw	y, (0x2, y)
      0093A0 FE               [ 2]  862 	ldw	x, (x)
      0093A1 17 18            [ 2]  863 	ldw	(0x18, sp), y
      0093A3 1F 16            [ 2]  864 	ldw	(0x16, sp), x
      0093A5                        865 00122$:
                                    866 ;	./../../mib/stm8s_mib_vsprintf.c: 236: if (precision < 0) precision = 0;
      0093A5 0D 16            [ 1]  867 	tnz	(0x16, sp)
      0093A7 2A 05            [ 1]  868 	jrpl	00127$
      0093A9 5F               [ 1]  869 	clrw	x
      0093AA 1F 18            [ 2]  870 	ldw	(0x18, sp), x
      0093AC 1F 16            [ 2]  871 	ldw	(0x16, sp), x
      0093AE                        872 00127$:
                                    873 ;	./../../mib/stm8s_mib_vsprintf.c: 240: qualifier = -1;
      0093AE 5F               [ 1]  874 	clrw	x
      0093AF 5A               [ 2]  875 	decw	x
      0093B0 1F 03            [ 2]  876 	ldw	(0x03, sp), x
      0093B2 1F 01            [ 2]  877 	ldw	(0x01, sp), x
                                    878 ;	./../../mib/stm8s_mib_vsprintf.c: 241: if (*fmt == 'h' || *fmt == 'l' || *fmt == 'L')
      0093B4 1E 24            [ 2]  879 	ldw	x, (0x24, sp)
      0093B6 F6               [ 1]  880 	ld	a, (x)
      0093B7 6B 15            [ 1]  881 	ld	(0x15, sp), a
      0093B9 A1 68            [ 1]  882 	cp	a, #0x68
      0093BB 27 0C            [ 1]  883 	jreq	00128$
      0093BD 7B 15            [ 1]  884 	ld	a, (0x15, sp)
      0093BF A1 6C            [ 1]  885 	cp	a, #0x6c
      0093C1 27 06            [ 1]  886 	jreq	00128$
      0093C3 7B 15            [ 1]  887 	ld	a, (0x15, sp)
      0093C5 A1 4C            [ 1]  888 	cp	a, #0x4c
      0093C7 26 0E            [ 1]  889 	jrne	00129$
      0093C9                        890 00128$:
                                    891 ;	./../../mib/stm8s_mib_vsprintf.c: 243: qualifier = *fmt;
      0093C9 1E 24            [ 2]  892 	ldw	x, (0x24, sp)
      0093CB F6               [ 1]  893 	ld	a, (x)
      0093CC 6B 04            [ 1]  894 	ld	(0x04, sp), a
      0093CE 0F 03            [ 1]  895 	clr	(0x03, sp)
      0093D0 0F 02            [ 1]  896 	clr	(0x02, sp)
      0093D2 0F 01            [ 1]  897 	clr	(0x01, sp)
                                    898 ;	./../../mib/stm8s_mib_vsprintf.c: 244: fmt++;
      0093D4 5C               [ 1]  899 	incw	x
      0093D5 1F 24            [ 2]  900 	ldw	(0x24, sp), x
      0093D7                        901 00129$:
                                    902 ;	./../../mib/stm8s_mib_vsprintf.c: 248: base = 10;
      0093D7 AE 00 0A         [ 2]  903 	ldw	x, #0x000a
      0093DA 1F 07            [ 2]  904 	ldw	(0x07, sp), x
      0093DC 5F               [ 1]  905 	clrw	x
      0093DD 1F 05            [ 2]  906 	ldw	(0x05, sp), x
                                    907 ;	./../../mib/stm8s_mib_vsprintf.c: 250: switch (*fmt)
      0093DF 16 24            [ 2]  908 	ldw	y, (0x24, sp)
      0093E1 17 14            [ 2]  909 	ldw	(0x14, sp), y
      0093E3 93               [ 1]  910 	ldw	x, y
      0093E4 F6               [ 1]  911 	ld	a, (x)
      0093E5 A1 58            [ 1]  912 	cp	a, #0x58
      0093E7 26 03            [ 1]  913 	jrne	00482$
      0093E9 CC 95 DF         [ 2]  914 	jp	00161$
      0093EC                        915 00482$:
      0093EC A1 63            [ 1]  916 	cp	a, #0x63
      0093EE 27 38            [ 1]  917 	jreq	00132$
      0093F0 A1 64            [ 1]  918 	cp	a, #0x64
      0093F2 26 03            [ 1]  919 	jrne	00488$
      0093F4 CC 95 EF         [ 2]  920 	jp	00164$
      0093F7                        921 00488$:
      0093F7 A1 69            [ 1]  922 	cp	a, #0x69
      0093F9 26 03            [ 1]  923 	jrne	00491$
      0093FB CC 95 EF         [ 2]  924 	jp	00164$
      0093FE                        925 00491$:
      0093FE A1 6E            [ 1]  926 	cp	a, #0x6e
      009400 26 03            [ 1]  927 	jrne	00494$
      009402 CC 95 8A         [ 2]  928 	jp	00156$
      009405                        929 00494$:
      009405 A1 6F            [ 1]  930 	cp	a, #0x6f
      009407 26 03            [ 1]  931 	jrne	00497$
      009409 CC 95 D5         [ 2]  932 	jp	00160$
      00940C                        933 00497$:
      00940C A1 70            [ 1]  934 	cp	a, #0x70
      00940E 26 03            [ 1]  935 	jrne	00500$
      009410 CC 95 3F         [ 2]  936 	jp	00153$
      009413                        937 00500$:
      009413 A1 73            [ 1]  938 	cp	a, #0x73
      009415 27 76            [ 1]  939 	jreq	00141$
      009417 A1 75            [ 1]  940 	cp	a, #0x75
      009419 26 03            [ 1]  941 	jrne	00506$
      00941B CC 96 19         [ 2]  942 	jp	00172$
      00941E                        943 00506$:
      00941E A1 78            [ 1]  944 	cp	a, #0x78
      009420 26 03            [ 1]  945 	jrne	00509$
      009422 CC 95 E5         [ 2]  946 	jp	00162$
      009425                        947 00509$:
      009425 CC 95 F7         [ 2]  948 	jp	00166$
                                    949 ;	./../../mib/stm8s_mib_vsprintf.c: 252: case 'c':
      009428                        950 00132$:
                                    951 ;	./../../mib/stm8s_mib_vsprintf.c: 253: if (!(flags & LEFT)) while (--field_width > 0) *str++ = ' ';
      009428 7B 0C            [ 1]  952 	ld	a, (0x0c, sp)
      00942A A5 10            [ 1]  953 	bcp	a, #0x10
      00942C 26 25            [ 1]  954 	jrne	00137$
      00942E 16 1C            [ 2]  955 	ldw	y, (0x1c, sp)
      009430                        956 00133$:
      009430 1E 20            [ 2]  957 	ldw	x, (0x20, sp)
      009432 1D 00 01         [ 2]  958 	subw	x, #0x0001
      009435 1F 20            [ 2]  959 	ldw	(0x20, sp), x
      009437 1E 1E            [ 2]  960 	ldw	x, (0x1e, sp)
      009439 24 01            [ 1]  961 	jrnc	00512$
      00943B 5A               [ 2]  962 	decw	x
      00943C                        963 00512$:
      00943C 1F 1E            [ 2]  964 	ldw	(0x1e, sp), x
      00943E 5F               [ 1]  965 	clrw	x
      00943F 13 20            [ 2]  966 	cpw	x, (0x20, sp)
      009441 4F               [ 1]  967 	clr	a
      009442 12 1F            [ 1]  968 	sbc	a, (0x1f, sp)
      009444 4F               [ 1]  969 	clr	a
      009445 12 1E            [ 1]  970 	sbc	a, (0x1e, sp)
      009447 2E 08            [ 1]  971 	jrsge	00236$
      009449 A6 20            [ 1]  972 	ld	a, #0x20
      00944B 90 F7            [ 1]  973 	ld	(y), a
      00944D 90 5C            [ 1]  974 	incw	y
      00944F 20 DF            [ 2]  975 	jra	00133$
      009451                        976 00236$:
      009451 17 1C            [ 2]  977 	ldw	(0x1c, sp), y
      009453                        978 00137$:
                                    979 ;	./../../mib/stm8s_mib_vsprintf.c: 254: *str++ = (MMUCHAR) va_arg(args, MMAINT); // test ok...
      009453 1E 26            [ 2]  980 	ldw	x, (0x26, sp)
      009455 5C               [ 1]  981 	incw	x
      009456 5C               [ 1]  982 	incw	x
      009457 1F 26            [ 2]  983 	ldw	(0x26, sp), x
      009459 5A               [ 2]  984 	decw	x
      00945A 5A               [ 2]  985 	decw	x
      00945B E6 01            [ 1]  986 	ld	a, (0x1, x)
      00945D 1E 1C            [ 2]  987 	ldw	x, (0x1c, sp)
      00945F F7               [ 1]  988 	ld	(x), a
      009460 1E 1C            [ 2]  989 	ldw	x, (0x1c, sp)
      009462 5C               [ 1]  990 	incw	x
      009463 1F 18            [ 2]  991 	ldw	(0x18, sp), x
                                    992 ;	./../../mib/stm8s_mib_vsprintf.c: 255: while (--field_width > 0) *str++ = ' ';
      009465                        993 00138$:
      009465 1E 20            [ 2]  994 	ldw	x, (0x20, sp)
      009467 1D 00 01         [ 2]  995 	subw	x, #0x0001
      00946A 1F 20            [ 2]  996 	ldw	(0x20, sp), x
      00946C 1E 1E            [ 2]  997 	ldw	x, (0x1e, sp)
      00946E 24 01            [ 1]  998 	jrnc	00514$
      009470 5A               [ 2]  999 	decw	x
      009471                       1000 00514$:
      009471 1F 1E            [ 2] 1001 	ldw	(0x1e, sp), x
      009473 5F               [ 1] 1002 	clrw	x
      009474 13 20            [ 2] 1003 	cpw	x, (0x20, sp)
      009476 4F               [ 1] 1004 	clr	a
      009477 12 1F            [ 1] 1005 	sbc	a, (0x1f, sp)
      009479 4F               [ 1] 1006 	clr	a
      00947A 12 1E            [ 1] 1007 	sbc	a, (0x1e, sp)
      00947C 2F 03            [ 1] 1008 	jrslt	00515$
      00947E CC 96 8C         [ 2] 1009 	jp	00237$
      009481                       1010 00515$:
      009481 1E 18            [ 2] 1011 	ldw	x, (0x18, sp)
      009483 A6 20            [ 1] 1012 	ld	a, #0x20
      009485 F7               [ 1] 1013 	ld	(x), a
      009486 1E 18            [ 2] 1014 	ldw	x, (0x18, sp)
      009488 5C               [ 1] 1015 	incw	x
      009489 1F 18            [ 2] 1016 	ldw	(0x18, sp), x
      00948B 20 D8            [ 2] 1017 	jra	00138$
                                   1018 ;	./../../mib/stm8s_mib_vsprintf.c: 258: case 's':
      00948D                       1019 00141$:
                                   1020 ;	./../../mib/stm8s_mib_vsprintf.c: 259: s = va_arg(args, char *);
      00948D 1E 26            [ 2] 1021 	ldw	x, (0x26, sp)
      00948F 5C               [ 1] 1022 	incw	x
      009490 5C               [ 1] 1023 	incw	x
      009491 1F 26            [ 2] 1024 	ldw	(0x26, sp), x
      009493 5A               [ 2] 1025 	decw	x
      009494 5A               [ 2] 1026 	decw	x
      009495 FE               [ 2] 1027 	ldw	x, (x)
                                   1028 ;	./../../mib/stm8s_mib_vsprintf.c: 260: if (!s) s = vStr; // "<NULL>";
      009496 1F 14            [ 2] 1029 	ldw	(0x14, sp), x
      009498 26 06            [ 1] 1030 	jrne	00143$
      00949A 96               [ 1] 1031 	ldw	x, sp
      00949B 1C 00 0D         [ 2] 1032 	addw	x, #13
      00949E 1F 14            [ 2] 1033 	ldw	(0x14, sp), x
      0094A0                       1034 00143$:
                                   1035 ;	./../../mib/stm8s_mib_vsprintf.c: 261: len = strnlen(s, precision);
      0094A0 1E 18            [ 2] 1036 	ldw	x, (0x18, sp)
      0094A2 89               [ 2] 1037 	pushw	x
      0094A3 1E 16            [ 2] 1038 	ldw	x, (0x16, sp)
      0094A5 CD 8E ED         [ 4] 1039 	call	_strnlen
      0094A8 1F 18            [ 2] 1040 	ldw	(0x18, sp), x
      0094AA 5F               [ 1] 1041 	clrw	x
      0094AB 1F 16            [ 2] 1042 	ldw	(0x16, sp), x
                                   1043 ;	./../../mib/stm8s_mib_vsprintf.c: 262: if (!(flags & LEFT)) while (len < field_width--) *str++ = ' ';
      0094AD 7B 0C            [ 1] 1044 	ld	a, (0x0c, sp)
      0094AF A5 10            [ 1] 1045 	bcp	a, #0x10
      0094B1 26 30            [ 1] 1046 	jrne	00225$
      0094B3                       1047 00144$:
      0094B3 16 20            [ 2] 1048 	ldw	y, (0x20, sp)
      0094B5 17 0B            [ 2] 1049 	ldw	(0x0b, sp), y
      0094B7 16 1E            [ 2] 1050 	ldw	y, (0x1e, sp)
      0094B9 17 09            [ 2] 1051 	ldw	(0x09, sp), y
      0094BB 1E 20            [ 2] 1052 	ldw	x, (0x20, sp)
      0094BD 1D 00 01         [ 2] 1053 	subw	x, #0x0001
      0094C0 1F 20            [ 2] 1054 	ldw	(0x20, sp), x
      0094C2 1E 1E            [ 2] 1055 	ldw	x, (0x1e, sp)
      0094C4 24 01            [ 1] 1056 	jrnc	00519$
      0094C6 5A               [ 2] 1057 	decw	x
      0094C7                       1058 00519$:
      0094C7 1F 1E            [ 2] 1059 	ldw	(0x1e, sp), x
      0094C9 1E 18            [ 2] 1060 	ldw	x, (0x18, sp)
      0094CB 13 0B            [ 2] 1061 	cpw	x, (0x0b, sp)
      0094CD 7B 17            [ 1] 1062 	ld	a, (0x17, sp)
      0094CF 12 0A            [ 1] 1063 	sbc	a, (0x0a, sp)
      0094D1 7B 16            [ 1] 1064 	ld	a, (0x16, sp)
      0094D3 12 09            [ 1] 1065 	sbc	a, (0x09, sp)
      0094D5 2E 0C            [ 1] 1066 	jrsge	00238$
      0094D7 1E 1C            [ 2] 1067 	ldw	x, (0x1c, sp)
      0094D9 A6 20            [ 1] 1068 	ld	a, #0x20
      0094DB F7               [ 1] 1069 	ld	(x), a
      0094DC 1E 1C            [ 2] 1070 	ldw	x, (0x1c, sp)
      0094DE 5C               [ 1] 1071 	incw	x
      0094DF 1F 1C            [ 2] 1072 	ldw	(0x1c, sp), x
      0094E1 20 D0            [ 2] 1073 	jra	00144$
      0094E3                       1074 00238$:
                                   1075 ;	./../../mib/stm8s_mib_vsprintf.c: 263: for (i = 0; i < len; ++i) *str++ = *s++;
      0094E3                       1076 00225$:
      0094E3 5F               [ 1] 1077 	clrw	x
      0094E4 1F 0B            [ 2] 1078 	ldw	(0x0b, sp), x
      0094E6 1F 09            [ 2] 1079 	ldw	(0x09, sp), x
      0094E8                       1080 00182$:
      0094E8 1E 0B            [ 2] 1081 	ldw	x, (0x0b, sp)
      0094EA 13 18            [ 2] 1082 	cpw	x, (0x18, sp)
      0094EC 7B 0A            [ 1] 1083 	ld	a, (0x0a, sp)
      0094EE 12 17            [ 1] 1084 	sbc	a, (0x17, sp)
      0094F0 7B 09            [ 1] 1085 	ld	a, (0x09, sp)
      0094F2 12 16            [ 1] 1086 	sbc	a, (0x16, sp)
      0094F4 2E 1E            [ 1] 1087 	jrsge	00227$
      0094F6 1E 14            [ 2] 1088 	ldw	x, (0x14, sp)
      0094F8 F6               [ 1] 1089 	ld	a, (x)
      0094F9 1E 14            [ 2] 1090 	ldw	x, (0x14, sp)
      0094FB 5C               [ 1] 1091 	incw	x
      0094FC 1F 14            [ 2] 1092 	ldw	(0x14, sp), x
      0094FE 1E 1C            [ 2] 1093 	ldw	x, (0x1c, sp)
      009500 F7               [ 1] 1094 	ld	(x), a
      009501 1E 1C            [ 2] 1095 	ldw	x, (0x1c, sp)
      009503 5C               [ 1] 1096 	incw	x
      009504 1F 1C            [ 2] 1097 	ldw	(0x1c, sp), x
      009506 1E 0B            [ 2] 1098 	ldw	x, (0x0b, sp)
      009508 5C               [ 1] 1099 	incw	x
      009509 1F 0B            [ 2] 1100 	ldw	(0x0b, sp), x
      00950B 26 DB            [ 1] 1101 	jrne	00182$
      00950D 1E 09            [ 2] 1102 	ldw	x, (0x09, sp)
      00950F 5C               [ 1] 1103 	incw	x
      009510 1F 09            [ 2] 1104 	ldw	(0x09, sp), x
      009512 20 D4            [ 2] 1105 	jra	00182$
                                   1106 ;	./../../mib/stm8s_mib_vsprintf.c: 264: while (len < field_width--) *str++ = ' ';
      009514                       1107 00227$:
      009514                       1108 00150$:
      009514 1E 18            [ 2] 1109 	ldw	x, (0x18, sp)
      009516 13 20            [ 2] 1110 	cpw	x, (0x20, sp)
      009518 7B 17            [ 1] 1111 	ld	a, (0x17, sp)
      00951A 12 1F            [ 1] 1112 	sbc	a, (0x1f, sp)
      00951C 7B 16            [ 1] 1113 	ld	a, (0x16, sp)
      00951E 12 1E            [ 1] 1114 	sbc	a, (0x1e, sp)
      009520 2F 03            [ 1] 1115 	jrslt	00526$
      009522 CC 96 90         [ 2] 1116 	jp	00240$
      009525                       1117 00526$:
      009525 1E 20            [ 2] 1118 	ldw	x, (0x20, sp)
      009527 1D 00 01         [ 2] 1119 	subw	x, #0x0001
      00952A 1F 20            [ 2] 1120 	ldw	(0x20, sp), x
      00952C 1E 1E            [ 2] 1121 	ldw	x, (0x1e, sp)
      00952E 24 01            [ 1] 1122 	jrnc	00527$
      009530 5A               [ 2] 1123 	decw	x
      009531                       1124 00527$:
      009531 1F 1E            [ 2] 1125 	ldw	(0x1e, sp), x
      009533 1E 1C            [ 2] 1126 	ldw	x, (0x1c, sp)
      009535 A6 20            [ 1] 1127 	ld	a, #0x20
      009537 F7               [ 1] 1128 	ld	(x), a
      009538 1E 1C            [ 2] 1129 	ldw	x, (0x1c, sp)
      00953A 5C               [ 1] 1130 	incw	x
      00953B 1F 1C            [ 2] 1131 	ldw	(0x1c, sp), x
      00953D 20 D5            [ 2] 1132 	jra	00150$
                                   1133 ;	./../../mib/stm8s_mib_vsprintf.c: 267: case 'p':
      00953F                       1134 00153$:
                                   1135 ;	./../../mib/stm8s_mib_vsprintf.c: 268: if (field_width == -1)
      00953F 1E 20            [ 2] 1136 	ldw	x, (0x20, sp)
      009541 5C               [ 1] 1137 	incw	x
      009542 26 12            [ 1] 1138 	jrne	00155$
      009544 1E 1E            [ 2] 1139 	ldw	x, (0x1e, sp)
      009546 5C               [ 1] 1140 	incw	x
      009547 26 0D            [ 1] 1141 	jrne	00155$
                                   1142 ;	./../../mib/stm8s_mib_vsprintf.c: 270: field_width = 2 * sizeof(void *);
      009549 AE 00 04         [ 2] 1143 	ldw	x, #0x0004
      00954C 1F 20            [ 2] 1144 	ldw	(0x20, sp), x
      00954E 5F               [ 1] 1145 	clrw	x
      00954F 1F 1E            [ 2] 1146 	ldw	(0x1e, sp), x
                                   1147 ;	./../../mib/stm8s_mib_vsprintf.c: 271: flags |= ZEROPAD;
      009551 04 0C            [ 1] 1148 	srl	(0x0c, sp)
      009553 99               [ 1] 1149 	scf
      009554 09 0C            [ 1] 1150 	rlc	(0x0c, sp)
      009556                       1151 00155$:
                                   1152 ;	./../../mib/stm8s_mib_vsprintf.c: 273: str = number(str, (MMULONG) va_arg(args, void *), 16, field_width, precision, flags);
      009556 1E 26            [ 2] 1153 	ldw	x, (0x26, sp)
      009558 5C               [ 1] 1154 	incw	x
      009559 5C               [ 1] 1155 	incw	x
      00955A 1F 26            [ 2] 1156 	ldw	(0x26, sp), x
      00955C 5A               [ 2] 1157 	decw	x
      00955D 5A               [ 2] 1158 	decw	x
      00955E FE               [ 2] 1159 	ldw	x, (x)
      00955F 1F 07            [ 2] 1160 	ldw	(0x07, sp), x
      009561 90 5F            [ 1] 1161 	clrw	y
      009563 1E 0B            [ 2] 1162 	ldw	x, (0x0b, sp)
      009565 89               [ 2] 1163 	pushw	x
      009566 1E 0B            [ 2] 1164 	ldw	x, (0x0b, sp)
      009568 89               [ 2] 1165 	pushw	x
      009569 1E 1C            [ 2] 1166 	ldw	x, (0x1c, sp)
      00956B 89               [ 2] 1167 	pushw	x
      00956C 1E 1C            [ 2] 1168 	ldw	x, (0x1c, sp)
      00956E 89               [ 2] 1169 	pushw	x
      00956F 1E 28            [ 2] 1170 	ldw	x, (0x28, sp)
      009571 89               [ 2] 1171 	pushw	x
      009572 1E 28            [ 2] 1172 	ldw	x, (0x28, sp)
      009574 89               [ 2] 1173 	pushw	x
      009575 4B 10            [ 1] 1174 	push	#0x10
      009577 5F               [ 1] 1175 	clrw	x
      009578 89               [ 2] 1176 	pushw	x
      009579 4B 00            [ 1] 1177 	push	#0x00
      00957B 1E 17            [ 2] 1178 	ldw	x, (0x17, sp)
      00957D 89               [ 2] 1179 	pushw	x
      00957E 90 89            [ 2] 1180 	pushw	y
      009580 1E 30            [ 2] 1181 	ldw	x, (0x30, sp)
      009582 CD 8F 70         [ 4] 1182 	call	_number
      009585 1F 1C            [ 2] 1183 	ldw	(0x1c, sp), x
                                   1184 ;	./../../mib/stm8s_mib_vsprintf.c: 274: continue;
      009587 CC 96 90         [ 2] 1185 	jp	00179$
                                   1186 ;	./../../mib/stm8s_mib_vsprintf.c: 276: case 'n':
      00958A                       1187 00156$:
                                   1188 ;	./../../mib/stm8s_mib_vsprintf.c: 277: if (qualifier == 'l')
      00958A 1E 03            [ 2] 1189 	ldw	x, (0x03, sp)
      00958C A3 00 6C         [ 2] 1190 	cpw	x, #0x006c
      00958F 26 24            [ 1] 1191 	jrne	00158$
      009591 1E 01            [ 2] 1192 	ldw	x, (0x01, sp)
      009593 26 20            [ 1] 1193 	jrne	00158$
                                   1194 ;	./../../mib/stm8s_mib_vsprintf.c: 279: MMLONG *ip = va_arg(args, MMLONG *);
      009595 1E 26            [ 2] 1195 	ldw	x, (0x26, sp)
      009597 5C               [ 1] 1196 	incw	x
      009598 5C               [ 1] 1197 	incw	x
      009599 1F 26            [ 2] 1198 	ldw	(0x26, sp), x
      00959B 5A               [ 2] 1199 	decw	x
      00959C 5A               [ 2] 1200 	decw	x
      00959D FE               [ 2] 1201 	ldw	x, (x)
                                   1202 ;	./../../mib/stm8s_mib_vsprintf.c: 280: *ip = (str - buf);
      00959E 16 1C            [ 2] 1203 	ldw	y, (0x1c, sp)
      0095A0 72 F2 1A         [ 2] 1204 	subw	y, (0x1a, sp)
      0095A3 90 9E            [ 1] 1205 	ld	a, yh
      0095A5 49               [ 1] 1206 	rlc	a
      0095A6 4F               [ 1] 1207 	clr	a
      0095A7 A2 00            [ 1] 1208 	sbc	a, #0x00
      0095A9 6B 1F            [ 1] 1209 	ld	(0x1f, sp), a
      0095AB 6B 1E            [ 1] 1210 	ld	(0x1e, sp), a
      0095AD EF 02            [ 2] 1211 	ldw	(0x2, x), y
      0095AF 16 1E            [ 2] 1212 	ldw	y, (0x1e, sp)
      0095B1 FF               [ 2] 1213 	ldw	(x), y
      0095B2 CC 96 90         [ 2] 1214 	jp	00179$
      0095B5                       1215 00158$:
                                   1216 ;	./../../mib/stm8s_mib_vsprintf.c: 284: MMINT *ip = va_arg(args, MMINT *);
      0095B5 1E 26            [ 2] 1217 	ldw	x, (0x26, sp)
      0095B7 5C               [ 1] 1218 	incw	x
      0095B8 5C               [ 1] 1219 	incw	x
      0095B9 1F 26            [ 2] 1220 	ldw	(0x26, sp), x
      0095BB 5A               [ 2] 1221 	decw	x
      0095BC 5A               [ 2] 1222 	decw	x
      0095BD FE               [ 2] 1223 	ldw	x, (x)
                                   1224 ;	./../../mib/stm8s_mib_vsprintf.c: 285: *ip = (str - buf);
      0095BE 16 1C            [ 2] 1225 	ldw	y, (0x1c, sp)
      0095C0 72 F2 1A         [ 2] 1226 	subw	y, (0x1a, sp)
      0095C3 90 9E            [ 1] 1227 	ld	a, yh
      0095C5 49               [ 1] 1228 	rlc	a
      0095C6 4F               [ 1] 1229 	clr	a
      0095C7 A2 00            [ 1] 1230 	sbc	a, #0x00
      0095C9 6B 1F            [ 1] 1231 	ld	(0x1f, sp), a
      0095CB 6B 1E            [ 1] 1232 	ld	(0x1e, sp), a
      0095CD EF 02            [ 2] 1233 	ldw	(0x2, x), y
      0095CF 16 1E            [ 2] 1234 	ldw	y, (0x1e, sp)
      0095D1 FF               [ 2] 1235 	ldw	(x), y
                                   1236 ;	./../../mib/stm8s_mib_vsprintf.c: 287: continue;
      0095D2 CC 96 90         [ 2] 1237 	jp	00179$
                                   1238 ;	./../../mib/stm8s_mib_vsprintf.c: 290: case 'o':
      0095D5                       1239 00160$:
                                   1240 ;	./../../mib/stm8s_mib_vsprintf.c: 291: base = 8;
      0095D5 AE 00 08         [ 2] 1241 	ldw	x, #0x0008
      0095D8 1F 07            [ 2] 1242 	ldw	(0x07, sp), x
      0095DA 5F               [ 1] 1243 	clrw	x
      0095DB 1F 05            [ 2] 1244 	ldw	(0x05, sp), x
                                   1245 ;	./../../mib/stm8s_mib_vsprintf.c: 292: break;
      0095DD 20 3A            [ 2] 1246 	jra	00172$
                                   1247 ;	./../../mib/stm8s_mib_vsprintf.c: 294: case 'X':
      0095DF                       1248 00161$:
                                   1249 ;	./../../mib/stm8s_mib_vsprintf.c: 295: flags |= LARGE;
      0095DF 7B 0C            [ 1] 1250 	ld	a, (0x0c, sp)
      0095E1 AA 40            [ 1] 1251 	or	a, #0x40
      0095E3 6B 0C            [ 1] 1252 	ld	(0x0c, sp), a
                                   1253 ;	./../../mib/stm8s_mib_vsprintf.c: 297: case 'x':
      0095E5                       1254 00162$:
                                   1255 ;	./../../mib/stm8s_mib_vsprintf.c: 298: base = 16;
      0095E5 AE 00 10         [ 2] 1256 	ldw	x, #0x0010
      0095E8 1F 07            [ 2] 1257 	ldw	(0x07, sp), x
      0095EA 5F               [ 1] 1258 	clrw	x
      0095EB 1F 05            [ 2] 1259 	ldw	(0x05, sp), x
                                   1260 ;	./../../mib/stm8s_mib_vsprintf.c: 299: break;
      0095ED 20 2A            [ 2] 1261 	jra	00172$
                                   1262 ;	./../../mib/stm8s_mib_vsprintf.c: 302: case 'i':
      0095EF                       1263 00164$:
                                   1264 ;	./../../mib/stm8s_mib_vsprintf.c: 303: flags |= SIGN;
      0095EF 7B 0C            [ 1] 1265 	ld	a, (0x0c, sp)
      0095F1 AA 02            [ 1] 1266 	or	a, #0x02
      0095F3 6B 0C            [ 1] 1267 	ld	(0x0c, sp), a
                                   1268 ;	./../../mib/stm8s_mib_vsprintf.c: 306: break;
      0095F5 20 22            [ 2] 1269 	jra	00172$
                                   1270 ;	./../../mib/stm8s_mib_vsprintf.c: 308: default:
      0095F7                       1271 00166$:
                                   1272 ;	./../../mib/stm8s_mib_vsprintf.c: 309: if (*fmt != '%') *str++ = '%';
      0095F7 A1 25            [ 1] 1273 	cp	a, #0x25
      0095F9 27 0A            [ 1] 1274 	jreq	00168$
      0095FB 1E 1C            [ 2] 1275 	ldw	x, (0x1c, sp)
      0095FD A6 25            [ 1] 1276 	ld	a, #0x25
      0095FF F7               [ 1] 1277 	ld	(x), a
      009600 1E 1C            [ 2] 1278 	ldw	x, (0x1c, sp)
      009602 5C               [ 1] 1279 	incw	x
      009603 1F 1C            [ 2] 1280 	ldw	(0x1c, sp), x
      009605                       1281 00168$:
                                   1282 ;	./../../mib/stm8s_mib_vsprintf.c: 310: if (*fmt)
      009605 1E 24            [ 2] 1283 	ldw	x, (0x24, sp)
      009607 F6               [ 1] 1284 	ld	a, (x)
      009608 27 0A            [ 1] 1285 	jreq	00170$
                                   1286 ;	./../../mib/stm8s_mib_vsprintf.c: 311: *str++ = *fmt;
      00960A 1E 1C            [ 2] 1287 	ldw	x, (0x1c, sp)
      00960C F7               [ 1] 1288 	ld	(x), a
      00960D 1E 1C            [ 2] 1289 	ldw	x, (0x1c, sp)
      00960F 5C               [ 1] 1290 	incw	x
      009610 1F 1C            [ 2] 1291 	ldw	(0x1c, sp), x
      009612 20 7C            [ 2] 1292 	jra	00179$
      009614                       1293 00170$:
                                   1294 ;	./../../mib/stm8s_mib_vsprintf.c: 313: --fmt;
      009614 5A               [ 2] 1295 	decw	x
      009615 1F 24            [ 2] 1296 	ldw	(0x24, sp), x
                                   1297 ;	./../../mib/stm8s_mib_vsprintf.c: 314: continue;
      009617 20 77            [ 2] 1298 	jra	00179$
                                   1299 ;	./../../mib/stm8s_mib_vsprintf.c: 315: }
      009619                       1300 00172$:
                                   1301 ;	./../../mib/stm8s_mib_vsprintf.c: 317: if (qualifier == 'l')
      009619 1E 03            [ 2] 1302 	ldw	x, (0x03, sp)
      00961B A3 00 6C         [ 2] 1303 	cpw	x, #0x006c
      00961E 26 1A            [ 1] 1304 	jrne	00177$
      009620 1E 01            [ 2] 1305 	ldw	x, (0x01, sp)
      009622 26 16            [ 1] 1306 	jrne	00177$
                                   1307 ;	./../../mib/stm8s_mib_vsprintf.c: 318: num = va_arg(args, MMUINT); // MMULONG); // test ok..
      009624 1E 26            [ 2] 1308 	ldw	x, (0x26, sp)
      009626 1C 00 04         [ 2] 1309 	addw	x, #0x0004
      009629 1F 26            [ 2] 1310 	ldw	(0x26, sp), x
      00962B 1D 00 04         [ 2] 1311 	subw	x, #0x0004
      00962E 90 93            [ 1] 1312 	ldw	y, x
      009630 90 EE 02         [ 2] 1313 	ldw	y, (0x2, y)
      009633 FE               [ 2] 1314 	ldw	x, (x)
      009634 17 03            [ 2] 1315 	ldw	(0x03, sp), y
      009636 1F 01            [ 2] 1316 	ldw	(0x01, sp), x
      009638 20 2B            [ 2] 1317 	jra	00178$
      00963A                       1318 00177$:
                                   1319 ;	./../../mib/stm8s_mib_vsprintf.c: 328: else if (flags & SIGN)
      00963A 7B 0C            [ 1] 1320 	ld	a, (0x0c, sp)
      00963C A5 02            [ 1] 1321 	bcp	a, #0x02
      00963E 27 17            [ 1] 1322 	jreq	00174$
                                   1323 ;	./../../mib/stm8s_mib_vsprintf.c: 329: num = va_arg(args, MMAINT); // test ok...
      009640 1E 26            [ 2] 1324 	ldw	x, (0x26, sp)
      009642 5C               [ 1] 1325 	incw	x
      009643 5C               [ 1] 1326 	incw	x
      009644 1F 26            [ 2] 1327 	ldw	(0x26, sp), x
      009646 5A               [ 2] 1328 	decw	x
      009647 5A               [ 2] 1329 	decw	x
      009648 FE               [ 2] 1330 	ldw	x, (x)
      009649 1F 03            [ 2] 1331 	ldw	(0x03, sp), x
      00964B 7B 03            [ 1] 1332 	ld	a, (0x03, sp)
      00964D 49               [ 1] 1333 	rlc	a
      00964E 4F               [ 1] 1334 	clr	a
      00964F A2 00            [ 1] 1335 	sbc	a, #0x00
      009651 6B 02            [ 1] 1336 	ld	(0x02, sp), a
      009653 6B 01            [ 1] 1337 	ld	(0x01, sp), a
      009655 20 0E            [ 2] 1338 	jra	00178$
      009657                       1339 00174$:
                                   1340 ;	./../../mib/stm8s_mib_vsprintf.c: 331: num = va_arg(args, MMAUINT);
      009657 1E 26            [ 2] 1341 	ldw	x, (0x26, sp)
      009659 5C               [ 1] 1342 	incw	x
      00965A 5C               [ 1] 1343 	incw	x
      00965B 1F 26            [ 2] 1344 	ldw	(0x26, sp), x
      00965D 5A               [ 2] 1345 	decw	x
      00965E 5A               [ 2] 1346 	decw	x
      00965F FE               [ 2] 1347 	ldw	x, (x)
      009660 1F 03            [ 2] 1348 	ldw	(0x03, sp), x
      009662 5F               [ 1] 1349 	clrw	x
      009663 1F 01            [ 2] 1350 	ldw	(0x01, sp), x
      009665                       1351 00178$:
                                   1352 ;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
      009665 1E 0B            [ 2] 1353 	ldw	x, (0x0b, sp)
      009667 89               [ 2] 1354 	pushw	x
      009668 1E 0B            [ 2] 1355 	ldw	x, (0x0b, sp)
      00966A 89               [ 2] 1356 	pushw	x
      00966B 1E 1C            [ 2] 1357 	ldw	x, (0x1c, sp)
      00966D 89               [ 2] 1358 	pushw	x
      00966E 1E 1C            [ 2] 1359 	ldw	x, (0x1c, sp)
      009670 89               [ 2] 1360 	pushw	x
      009671 1E 28            [ 2] 1361 	ldw	x, (0x28, sp)
      009673 89               [ 2] 1362 	pushw	x
      009674 1E 28            [ 2] 1363 	ldw	x, (0x28, sp)
      009676 89               [ 2] 1364 	pushw	x
      009677 1E 13            [ 2] 1365 	ldw	x, (0x13, sp)
      009679 89               [ 2] 1366 	pushw	x
      00967A 1E 13            [ 2] 1367 	ldw	x, (0x13, sp)
      00967C 89               [ 2] 1368 	pushw	x
      00967D 1E 13            [ 2] 1369 	ldw	x, (0x13, sp)
      00967F 89               [ 2] 1370 	pushw	x
      009680 1E 13            [ 2] 1371 	ldw	x, (0x13, sp)
      009682 89               [ 2] 1372 	pushw	x
      009683 1E 30            [ 2] 1373 	ldw	x, (0x30, sp)
      009685 CD 8F 70         [ 4] 1374 	call	_number
      009688 1F 1C            [ 2] 1375 	ldw	(0x1c, sp), x
                                   1376 ;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
      00968A 20 04            [ 2] 1377 	jra	00179$
                                   1378 ;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
      00968C                       1379 00237$:
      00968C 16 18            [ 2] 1380 	ldw	y, (0x18, sp)
      00968E 17 1C            [ 2] 1381 	ldw	(0x1c, sp), y
                                   1382 ;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
                                   1383 ;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
      009690                       1384 00240$:
      009690                       1385 00179$:
                                   1386 ;	./../../mib/stm8s_mib_vsprintf.c: 188: for (str = buf; *fmt; fmt++)
      009690 1E 24            [ 2] 1387 	ldw	x, (0x24, sp)
      009692 5C               [ 1] 1388 	incw	x
      009693 1F 24            [ 2] 1389 	ldw	(0x24, sp), x
      009695 CC 92 92         [ 2] 1390 	jp	00185$
      009698                       1391 00180$:
                                   1392 ;	./../../mib/stm8s_mib_vsprintf.c: 336: *str = '\0';
      009698 1E 1C            [ 2] 1393 	ldw	x, (0x1c, sp)
      00969A 7F               [ 1] 1394 	clr	(x)
                                   1395 ;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
      00969B 1E 1C            [ 2] 1396 	ldw	x, (0x1c, sp)
      00969D 72 F0 1A         [ 2] 1397 	subw	x, (0x1a, sp)
                                   1398 ;	./../../mib/stm8s_mib_vsprintf.c: 338: }
      0096A0 16 22            [ 2] 1399 	ldw	y, (34, sp)
      0096A2 5B 27            [ 2] 1400 	addw	sp, #39
      0096A4 90 FC            [ 2] 1401 	jp	(y)
                                   1402 ;	./../../mib/stm8s_mib_vsprintf.c: 342: MMRINT mib_vsprintf(char *vpBuffer,char *format, ...)
                                   1403 ;	-----------------------------------------
                                   1404 ;	 function mib_vsprintf
                                   1405 ;	-----------------------------------------
      0096A6                       1406 _mib_vsprintf:
                                   1407 ;	./../../mib/stm8s_mib_vsprintf.c: 347: va_start(ap, format);
      0096A6 96               [ 1] 1408 	ldw	x, sp
      0096A7 1C 00 07         [ 2] 1409 	addw	x, #7
                                   1410 ;	./../../mib/stm8s_mib_vsprintf.c: 348: rc = mm_vsprintf(vpBuffer, format, ap);
      0096AA 89               [ 2] 1411 	pushw	x
      0096AB 1E 07            [ 2] 1412 	ldw	x, (0x07, sp)
      0096AD 89               [ 2] 1413 	pushw	x
      0096AE 1E 07            [ 2] 1414 	ldw	x, (0x07, sp)
      0096B0 CD 92 72         [ 4] 1415 	call	_mm_vsprintf
                                   1416 ;	./../../mib/stm8s_mib_vsprintf.c: 351: return (rc);
                                   1417 ;	./../../mib/stm8s_mib_vsprintf.c: 352: }
      0096B3 81               [ 4] 1418 	ret
                                   1419 ;	./../../mib/stm8s_mib_vsprintf.c: 363: MMRINT mib_printf(char *format, ...)
                                   1420 ;	-----------------------------------------
                                   1421 ;	 function mib_printf
                                   1422 ;	-----------------------------------------
      0096B4                       1423 _mib_printf:
      0096B4 52 82            [ 2] 1424 	sub	sp, #130
                                   1425 ;	./../../mib/stm8s_mib_vsprintf.c: 370: va_start(ap, format);
                                   1426 ;	./../../mib/stm8s_mib_vsprintf.c: 371: rc = mm_vsprintf(buffer, format, ap);
      0096B6 96               [ 1] 1427 	ldw	x, sp
      0096B7 1C 00 87         [ 2] 1428 	addw	x, #135
      0096BA 89               [ 2] 1429 	pushw	x
      0096BB 1E 87            [ 2] 1430 	ldw	x, (0x87, sp)
      0096BD 89               [ 2] 1431 	pushw	x
      0096BE 96               [ 1] 1432 	ldw	x, sp
      0096BF 1C 00 05         [ 2] 1433 	addw	x, #5
      0096C2 CD 92 72         [ 4] 1434 	call	_mm_vsprintf
      0096C5 1F 81            [ 2] 1435 	ldw	(0x81, sp), x
                                   1436 ;	./../../mib/stm8s_mib_vsprintf.c: 374: v_pString = (char *)buffer;
      0096C7 96               [ 1] 1437 	ldw	x, sp
      0096C8 5C               [ 1] 1438 	incw	x
                                   1439 ;	./../../mib/stm8s_mib_vsprintf.c: 375: while (*v_pString != 0)	MibWriteDebugByte((uint8_t)*v_pString++);
      0096C9                       1440 00101$:
      0096C9 F6               [ 1] 1441 	ld	a, (x)
      0096CA 27 08            [ 1] 1442 	jreq	00103$
      0096CC 5C               [ 1] 1443 	incw	x
      0096CD 89               [ 2] 1444 	pushw	x
      0096CE CD 8C 85         [ 4] 1445 	call	_MibWriteDebugByte
      0096D1 85               [ 2] 1446 	popw	x
      0096D2 20 F5            [ 2] 1447 	jra	00101$
      0096D4                       1448 00103$:
                                   1449 ;	./../../mib/stm8s_mib_vsprintf.c: 376: return (rc);
      0096D4 1E 81            [ 2] 1450 	ldw	x, (0x81, sp)
                                   1451 ;	./../../mib/stm8s_mib_vsprintf.c: 377: }
      0096D6 5B 82            [ 2] 1452 	addw	sp, #130
      0096D8 81               [ 4] 1453 	ret
                                   1454 	.area CODE
                                   1455 	.area CONST
                                   1456 	.area CONST
      0082FA                       1457 ___str_1:
      0082FA 30 31 32 33 34 35 36  1458 	.ascii "0123456789abcdefghijklmnopqrstuvwxyz"
             37 38 39 61 62 63 64
             65 66 67 68 69 6A 6B
             6C 6D 6E 6F 70 71 72
             73 74 75 76 77 78 79
             7A
      00831E 00                    1459 	.db 0x00
                                   1460 	.area CODE
                                   1461 	.area CONST
      00831F                       1462 ___str_2:
      00831F 30 31 32 33 34 35 36  1463 	.ascii "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
             37 38 39 41 42 43 44
             45 46 47 48 49 4A 4B
             4C 4D 4E 4F 50 51 52
             53 54 55 56 57 58 59
             5A
      008343 00                    1464 	.db 0x00
                                   1465 	.area CODE
                                   1466 	.area INITIALIZER
      008916                       1467 __xinit__digits:
      008916 82 FA                 1468 	.dw ___str_1
      008918                       1469 __xinit__upper_digits:
      008918 83 1F                 1470 	.dw ___str_2
                                   1471 	.area CABS (ABS)
