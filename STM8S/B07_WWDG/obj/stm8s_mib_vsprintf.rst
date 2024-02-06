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
      00015A                         23 _digits:
      00015A                         24 	.ds 2
      00015C                         25 _upper_digits:
      00015C                         26 	.ds 2
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
      008EB0                         60 _strnlen:
      008EB0 52 06            [ 2]   61 	sub	sp, #6
      008EB2 1F 03            [ 2]   62 	ldw	(0x03, sp), x
                                     63 ;	./../../mib/stm8s_mib_vsprintf.c: 74: for (sc = s; *sc != '\0' && count--; ++sc);
      008EB4 16 09            [ 2]   64 	ldw	y, (0x09, sp)
      008EB6 17 05            [ 2]   65 	ldw	(0x05, sp), y
      008EB8 1E 03            [ 2]   66 	ldw	x, (0x03, sp)
      008EBA                         67 00104$:
      008EBA F6               [ 1]   68 	ld	a, (x)
      008EBB 27 11            [ 1]   69 	jreq	00101$
      008EBD 16 05            [ 2]   70 	ldw	y, (0x05, sp)
      008EBF 17 01            [ 2]   71 	ldw	(0x01, sp), y
      008EC1 16 05            [ 2]   72 	ldw	y, (0x05, sp)
      008EC3 90 5A            [ 2]   73 	decw	y
      008EC5 17 05            [ 2]   74 	ldw	(0x05, sp), y
      008EC7 16 01            [ 2]   75 	ldw	y, (0x01, sp)
      008EC9 27 03            [ 1]   76 	jreq	00101$
      008ECB 5C               [ 1]   77 	incw	x
      008ECC 20 EC            [ 2]   78 	jra	00104$
      008ECE                         79 00101$:
                                     80 ;	./../../mib/stm8s_mib_vsprintf.c: 75: return sc - s;
      008ECE 72 F0 03         [ 2]   81 	subw	x, (0x03, sp)
                                     82 ;	./../../mib/stm8s_mib_vsprintf.c: 76: }
      008ED1 5B 06            [ 2]   83 	addw	sp, #6
      008ED3 90 85            [ 2]   84 	popw	y
      008ED5 5B 02            [ 2]   85 	addw	sp, #2
      008ED7 90 FC            [ 2]   86 	jp	(y)
                                     87 ;	./../../mib/stm8s_mib_vsprintf.c: 81: static MMINT skip_atoi(const char **s)
                                     88 ;	-----------------------------------------
                                     89 ;	 function skip_atoi
                                     90 ;	-----------------------------------------
      008ED9                         91 _skip_atoi:
      008ED9 52 08            [ 2]   92 	sub	sp, #8
      008EDB 1F 07            [ 2]   93 	ldw	(0x07, sp), x
                                     94 ;	./../../mib/stm8s_mib_vsprintf.c: 83: MMINT i = 0;
      008EDD 5F               [ 1]   95 	clrw	x
      008EDE 1F 05            [ 2]   96 	ldw	(0x05, sp), x
                                     97 ;	./../../mib/stm8s_mib_vsprintf.c: 84: while (is_digit(**s)) i = i*10 + *((*s)++) - '0';
      008EE0                         98 00102$:
      008EE0 16 07            [ 2]   99 	ldw	y, (0x07, sp)
      008EE2 90 FE            [ 2]  100 	ldw	y, (y)
      008EE4 17 01            [ 2]  101 	ldw	(0x01, sp), y
      008EE6 90 F6            [ 1]  102 	ld	a, (y)
      008EE8 A1 30            [ 1]  103 	cp	a, #0x30
      008EEA 25 41            [ 1]  104 	jrc	00104$
      008EEC A1 39            [ 1]  105 	cp	a, #0x39
      008EEE 22 3D            [ 1]  106 	jrugt	00104$
      008EF0 16 05            [ 2]  107 	ldw	y, (0x05, sp)
      008EF2 90 89            [ 2]  108 	pushw	y
      008EF4 89               [ 2]  109 	pushw	x
      008EF5 4B 0A            [ 1]  110 	push	#0x0a
      008EF7 5F               [ 1]  111 	clrw	x
      008EF8 89               [ 2]  112 	pushw	x
      008EF9 4B 00            [ 1]  113 	push	#0x00
      008EFB CD A9 68         [ 4]  114 	call	__mullong
      008EFE 5B 08            [ 2]  115 	addw	sp, #8
      008F00 1F 05            [ 2]  116 	ldw	(0x05, sp), x
      008F02 17 03            [ 2]  117 	ldw	(0x03, sp), y
      008F04 1E 01            [ 2]  118 	ldw	x, (0x01, sp)
      008F06 5C               [ 1]  119 	incw	x
      008F07 16 07            [ 2]  120 	ldw	y, (0x07, sp)
      008F09 90 FF            [ 2]  121 	ldw	(y), x
      008F0B 1E 01            [ 2]  122 	ldw	x, (0x01, sp)
      008F0D F6               [ 1]  123 	ld	a, (x)
      008F0E 90 5F            [ 1]  124 	clrw	y
      008F10 5F               [ 1]  125 	clrw	x
      008F11 90 5D            [ 2]  126 	tnzw	y
      008F13 2A 01            [ 1]  127 	jrpl	00124$
      008F15 5A               [ 2]  128 	decw	x
      008F16                        129 00124$:
      008F16 90 97            [ 1]  130 	ld	yl, a
      008F18 72 F9 05         [ 2]  131 	addw	y, (0x05, sp)
      008F1B 9F               [ 1]  132 	ld	a, xl
      008F1C 19 04            [ 1]  133 	adc	a, (0x04, sp)
      008F1E 02               [ 1]  134 	rlwa	x
      008F1F 19 03            [ 1]  135 	adc	a, (0x03, sp)
      008F21 95               [ 1]  136 	ld	xh, a
      008F22 72 A2 00 30      [ 2]  137 	subw	y, #0x0030
      008F26 17 05            [ 2]  138 	ldw	(0x05, sp), y
      008F28 24 B6            [ 1]  139 	jrnc	00102$
      008F2A 5A               [ 2]  140 	decw	x
      008F2B 20 B3            [ 2]  141 	jra	00102$
      008F2D                        142 00104$:
                                    143 ;	./../../mib/stm8s_mib_vsprintf.c: 85: return i;
      008F2D 51               [ 1]  144 	exgw	x, y
      008F2E 1E 05            [ 2]  145 	ldw	x, (0x05, sp)
                                    146 ;	./../../mib/stm8s_mib_vsprintf.c: 86: }
      008F30 5B 08            [ 2]  147 	addw	sp, #8
      008F32 81               [ 4]  148 	ret
                                    149 ;	./../../mib/stm8s_mib_vsprintf.c: 91: static char *number(char *str, MMLONG num, MMINT base, MMINT size, MMINT precision, MMINT type)
                                    150 ;	-----------------------------------------
                                    151 ;	 function number
                                    152 ;	-----------------------------------------
      008F33                        153 _number:
      008F33 52 62            [ 2]  154 	sub	sp, #98
      008F35 1F 5D            [ 2]  155 	ldw	(0x5d, sp), x
                                    156 ;	./../../mib/stm8s_mib_vsprintf.c: 94: char *dig = digits;
      008F37 CE 01 5A         [ 2]  157 	ldw	x, _digits+0
      008F3A 1F 43            [ 2]  158 	ldw	(0x43, sp), x
                                    159 ;	./../../mib/stm8s_mib_vsprintf.c: 97: if (type & LARGE)  dig = upper_digits;
      008F3C 7B 78            [ 1]  160 	ld	a, (0x78, sp)
      008F3E A5 40            [ 1]  161 	bcp	a, #0x40
      008F40 27 05            [ 1]  162 	jreq	00102$
      008F42 CE 01 5C         [ 2]  163 	ldw	x, _upper_digits+0
      008F45 1F 43            [ 2]  164 	ldw	(0x43, sp), x
      008F47                        165 00102$:
                                    166 ;	./../../mib/stm8s_mib_vsprintf.c: 98: if (type & LEFT) type &= ~ZEROPAD;
      008F47 7B 78            [ 1]  167 	ld	a, (0x78, sp)
      008F49 A5 10            [ 1]  168 	bcp	a, #0x10
      008F4B 27 0A            [ 1]  169 	jreq	00104$
      008F4D 1E 77            [ 2]  170 	ldw	x, (0x77, sp)
      008F4F 54               [ 2]  171 	srlw	x
      008F50 58               [ 2]  172 	sllw	x
      008F51 16 75            [ 2]  173 	ldw	y, (0x75, sp)
      008F53 1F 77            [ 2]  174 	ldw	(0x77, sp), x
      008F55 17 75            [ 2]  175 	ldw	(0x75, sp), y
      008F57                        176 00104$:
                                    177 ;	./../../mib/stm8s_mib_vsprintf.c: 99: if (base < 2 || base > 36) return 0;
      008F57 1E 6B            [ 2]  178 	ldw	x, (0x6b, sp)
      008F59 A3 00 02         [ 2]  179 	cpw	x, #0x0002
      008F5C 7B 6A            [ 1]  180 	ld	a, (0x6a, sp)
      008F5E A2 00            [ 1]  181 	sbc	a, #0x00
      008F60 7B 69            [ 1]  182 	ld	a, (0x69, sp)
      008F62 A2 00            [ 1]  183 	sbc	a, #0x00
      008F64 2F 0D            [ 1]  184 	jrslt	00105$
      008F66 AE 00 24         [ 2]  185 	ldw	x, #0x0024
      008F69 13 6B            [ 2]  186 	cpw	x, (0x6b, sp)
      008F6B 4F               [ 1]  187 	clr	a
      008F6C 12 6A            [ 1]  188 	sbc	a, (0x6a, sp)
      008F6E 4F               [ 1]  189 	clr	a
      008F6F 12 69            [ 1]  190 	sbc	a, (0x69, sp)
      008F71 2E 04            [ 1]  191 	jrsge	00106$
      008F73                        192 00105$:
      008F73 5F               [ 1]  193 	clrw	x
      008F74 CC 92 2F         [ 2]  194 	jp	00161$
      008F77                        195 00106$:
                                    196 ;	./../../mib/stm8s_mib_vsprintf.c: 101: c = (type & ZEROPAD) ? '0' : ' ';
      008F77 7B 78            [ 1]  197 	ld	a, (0x78, sp)
      008F79 44               [ 1]  198 	srl	a
      008F7A 24 03            [ 1]  199 	jrnc	00163$
      008F7C A6 30            [ 1]  200 	ld	a, #0x30
      008F7E C5                     201 	.byte 0xc5
      008F7F                        202 00163$:
      008F7F A6 20            [ 1]  203 	ld	a, #0x20
      008F81                        204 00164$:
      008F81 6B 45            [ 1]  205 	ld	(0x45, sp), a
                                    206 ;	./../../mib/stm8s_mib_vsprintf.c: 102: sign = 0;
      008F83 0F 46            [ 1]  207 	clr	(0x46, sp)
                                    208 ;	./../../mib/stm8s_mib_vsprintf.c: 103: if (type & SIGN)
      008F85 7B 78            [ 1]  209 	ld	a, (0x78, sp)
      008F87 A5 02            [ 1]  210 	bcp	a, #0x02
      008F89 27 52            [ 1]  211 	jreq	00117$
                                    212 ;	./../../mib/stm8s_mib_vsprintf.c: 109: size--;
      008F8B 16 6F            [ 2]  213 	ldw	y, (0x6f, sp)
      008F8D 72 A2 00 01      [ 2]  214 	subw	y, #0x0001
      008F91 1E 6D            [ 2]  215 	ldw	x, (0x6d, sp)
      008F93 24 01            [ 1]  216 	jrnc	00330$
      008F95 5A               [ 2]  217 	decw	x
      008F96                        218 00330$:
      008F96 1F 57            [ 2]  219 	ldw	(0x57, sp), x
                                    220 ;	./../../mib/stm8s_mib_vsprintf.c: 105: if (num < 0)
      008F98 0D 65            [ 1]  221 	tnz	(0x65, sp)
      008F9A 2A 1F            [ 1]  222 	jrpl	00114$
                                    223 ;	./../../mib/stm8s_mib_vsprintf.c: 107: sign = '-';
      008F9C A6 2D            [ 1]  224 	ld	a, #0x2d
      008F9E 6B 46            [ 1]  225 	ld	(0x46, sp), a
                                    226 ;	./../../mib/stm8s_mib_vsprintf.c: 108: num = -num;
      008FA0 1E 67            [ 2]  227 	ldw	x, (0x67, sp)
      008FA2 50               [ 2]  228 	negw	x
      008FA3 4F               [ 1]  229 	clr	a
      008FA4 12 66            [ 1]  230 	sbc	a, (0x66, sp)
      008FA6 6B 60            [ 1]  231 	ld	(0x60, sp), a
      008FA8 4F               [ 1]  232 	clr	a
      008FA9 12 65            [ 1]  233 	sbc	a, (0x65, sp)
      008FAB 1F 67            [ 2]  234 	ldw	(0x67, sp), x
      008FAD 6B 65            [ 1]  235 	ld	(0x65, sp), a
      008FAF 7B 60            [ 1]  236 	ld	a, (0x60, sp)
      008FB1 6B 66            [ 1]  237 	ld	(0x66, sp), a
                                    238 ;	./../../mib/stm8s_mib_vsprintf.c: 109: size--;
      008FB3 17 6F            [ 2]  239 	ldw	(0x6f, sp), y
      008FB5 16 57            [ 2]  240 	ldw	y, (0x57, sp)
      008FB7 17 6D            [ 2]  241 	ldw	(0x6d, sp), y
      008FB9 20 22            [ 2]  242 	jra	00117$
      008FBB                        243 00114$:
                                    244 ;	./../../mib/stm8s_mib_vsprintf.c: 111: else if (type & PLUS)
      008FBB 7B 78            [ 1]  245 	ld	a, (0x78, sp)
      008FBD A5 04            [ 1]  246 	bcp	a, #0x04
      008FBF 27 0C            [ 1]  247 	jreq	00111$
                                    248 ;	./../../mib/stm8s_mib_vsprintf.c: 113: sign = '+';
      008FC1 A6 2B            [ 1]  249 	ld	a, #0x2b
      008FC3 6B 46            [ 1]  250 	ld	(0x46, sp), a
                                    251 ;	./../../mib/stm8s_mib_vsprintf.c: 114: size--;
      008FC5 17 6F            [ 2]  252 	ldw	(0x6f, sp), y
      008FC7 16 57            [ 2]  253 	ldw	y, (0x57, sp)
      008FC9 17 6D            [ 2]  254 	ldw	(0x6d, sp), y
      008FCB 20 10            [ 2]  255 	jra	00117$
      008FCD                        256 00111$:
                                    257 ;	./../../mib/stm8s_mib_vsprintf.c: 116: else if (type & SPACE)
      008FCD 7B 78            [ 1]  258 	ld	a, (0x78, sp)
      008FCF A5 08            [ 1]  259 	bcp	a, #0x08
      008FD1 27 0A            [ 1]  260 	jreq	00117$
                                    261 ;	./../../mib/stm8s_mib_vsprintf.c: 118: sign = ' ';
      008FD3 A6 20            [ 1]  262 	ld	a, #0x20
      008FD5 6B 46            [ 1]  263 	ld	(0x46, sp), a
                                    264 ;	./../../mib/stm8s_mib_vsprintf.c: 119: size--;
      008FD7 17 6F            [ 2]  265 	ldw	(0x6f, sp), y
      008FD9 16 57            [ 2]  266 	ldw	y, (0x57, sp)
      008FDB 17 6D            [ 2]  267 	ldw	(0x6d, sp), y
      008FDD                        268 00117$:
                                    269 ;	./../../mib/stm8s_mib_vsprintf.c: 123: if (type & SPECIAL)
      008FDD 7B 78            [ 1]  270 	ld	a, (0x78, sp)
      008FDF A4 20            [ 1]  271 	and	a, #0x20
      008FE1 6B 4A            [ 1]  272 	ld	(0x4a, sp), a
      008FE3 5F               [ 1]  273 	clrw	x
      008FE4 1F 48            [ 2]  274 	ldw	(0x48, sp), x
      008FE6 0F 47            [ 1]  275 	clr	(0x47, sp)
                                    276 ;	./../../mib/stm8s_mib_vsprintf.c: 125: if (base == 16)
      008FE8 1E 6B            [ 2]  277 	ldw	x, (0x6b, sp)
      008FEA A3 00 10         [ 2]  278 	cpw	x, #0x0010
      008FED 26 09            [ 1]  279 	jrne	00335$
      008FEF 1E 69            [ 2]  280 	ldw	x, (0x69, sp)
      008FF1 26 05            [ 1]  281 	jrne	00335$
      008FF3 A6 01            [ 1]  282 	ld	a, #0x01
      008FF5 6B 4B            [ 1]  283 	ld	(0x4b, sp), a
      008FF7 C5                     284 	.byte 0xc5
      008FF8                        285 00335$:
      008FF8 0F 4B            [ 1]  286 	clr	(0x4b, sp)
      008FFA                        287 00336$:
                                    288 ;	./../../mib/stm8s_mib_vsprintf.c: 127: else if (base == 8)
      008FFA 1E 6B            [ 2]  289 	ldw	x, (0x6b, sp)
      008FFC A3 00 08         [ 2]  290 	cpw	x, #0x0008
      008FFF 26 09            [ 1]  291 	jrne	00338$
      009001 1E 69            [ 2]  292 	ldw	x, (0x69, sp)
      009003 26 05            [ 1]  293 	jrne	00338$
      009005 A6 01            [ 1]  294 	ld	a, #0x01
      009007 6B 4C            [ 1]  295 	ld	(0x4c, sp), a
      009009 C5                     296 	.byte 0xc5
      00900A                        297 00338$:
      00900A 0F 4C            [ 1]  298 	clr	(0x4c, sp)
      00900C                        299 00339$:
                                    300 ;	./../../mib/stm8s_mib_vsprintf.c: 123: if (type & SPECIAL)
      00900C 1E 49            [ 2]  301 	ldw	x, (0x49, sp)
      00900E 26 04            [ 1]  302 	jrne	00340$
      009010 1E 47            [ 2]  303 	ldw	x, (0x47, sp)
      009012 27 28            [ 1]  304 	jreq	00124$
      009014                        305 00340$:
                                    306 ;	./../../mib/stm8s_mib_vsprintf.c: 125: if (base == 16)
      009014 0D 4B            [ 1]  307 	tnz	(0x4b, sp)
      009016 27 11            [ 1]  308 	jreq	00121$
                                    309 ;	./../../mib/stm8s_mib_vsprintf.c: 126: size -= 2;
      009018 1E 6F            [ 2]  310 	ldw	x, (0x6f, sp)
      00901A 1D 00 02         [ 2]  311 	subw	x, #0x0002
      00901D 16 6D            [ 2]  312 	ldw	y, (0x6d, sp)
      00901F 24 02            [ 1]  313 	jrnc	00342$
      009021 90 5A            [ 2]  314 	decw	y
      009023                        315 00342$:
      009023 1F 6F            [ 2]  316 	ldw	(0x6f, sp), x
      009025 17 6D            [ 2]  317 	ldw	(0x6d, sp), y
      009027 20 13            [ 2]  318 	jra	00124$
      009029                        319 00121$:
                                    320 ;	./../../mib/stm8s_mib_vsprintf.c: 127: else if (base == 8)
      009029 0D 4C            [ 1]  321 	tnz	(0x4c, sp)
      00902B 27 0F            [ 1]  322 	jreq	00124$
                                    323 ;	./../../mib/stm8s_mib_vsprintf.c: 128: size--;
      00902D 1E 6F            [ 2]  324 	ldw	x, (0x6f, sp)
      00902F 1D 00 01         [ 2]  325 	subw	x, #0x0001
      009032 16 6D            [ 2]  326 	ldw	y, (0x6d, sp)
      009034 24 02            [ 1]  327 	jrnc	00344$
      009036 90 5A            [ 2]  328 	decw	y
      009038                        329 00344$:
      009038 1F 6F            [ 2]  330 	ldw	(0x6f, sp), x
      00903A 17 6D            [ 2]  331 	ldw	(0x6d, sp), y
      00903C                        332 00124$:
                                    333 ;	./../../mib/stm8s_mib_vsprintf.c: 133: if (num == 0)
      00903C 1E 67            [ 2]  334 	ldw	x, (0x67, sp)
      00903E 26 10            [ 1]  335 	jrne	00178$
                                    336 ;	./../../mib/stm8s_mib_vsprintf.c: 134: tmp[i++] = '0';
      009040 1E 65            [ 2]  337 	ldw	x, (0x65, sp)
      009042 26 0C            [ 1]  338 	jrne	00178$
      009044 5C               [ 1]  339 	incw	x
      009045 1F 59            [ 2]  340 	ldw	(0x59, sp), x
      009047 5F               [ 1]  341 	clrw	x
      009048 1F 57            [ 2]  342 	ldw	(0x57, sp), x
      00904A A6 30            [ 1]  343 	ld	a, #0x30
      00904C 6B 01            [ 1]  344 	ld	(0x01, sp), a
      00904E 20 70            [ 2]  345 	jra	00130$
                                    346 ;	./../../mib/stm8s_mib_vsprintf.c: 137: while (num != 0)
      009050                        347 00178$:
      009050 5F               [ 1]  348 	clrw	x
      009051 1F 61            [ 2]  349 	ldw	(0x61, sp), x
      009053 1F 5F            [ 2]  350 	ldw	(0x5f, sp), x
      009055                        351 00125$:
      009055 1E 67            [ 2]  352 	ldw	x, (0x67, sp)
      009057 26 04            [ 1]  353 	jrne	00347$
      009059 1E 65            [ 2]  354 	ldw	x, (0x65, sp)
      00905B 27 5B            [ 1]  355 	jreq	00194$
      00905D                        356 00347$:
                                    357 ;	./../../mib/stm8s_mib_vsprintf.c: 139: tmp[i++] = dig[((MMULONG) num) % (MMUSIGN) base];
      00905D 16 61            [ 2]  358 	ldw	y, (0x61, sp)
      00905F 17 59            [ 2]  359 	ldw	(0x59, sp), y
      009061 16 5F            [ 2]  360 	ldw	y, (0x5f, sp)
      009063 17 57            [ 2]  361 	ldw	(0x57, sp), y
      009065 1E 61            [ 2]  362 	ldw	x, (0x61, sp)
      009067 5C               [ 1]  363 	incw	x
      009068 1F 61            [ 2]  364 	ldw	(0x61, sp), x
      00906A 26 05            [ 1]  365 	jrne	00348$
      00906C 1E 5F            [ 2]  366 	ldw	x, (0x5f, sp)
      00906E 5C               [ 1]  367 	incw	x
      00906F 1F 5F            [ 2]  368 	ldw	(0x5f, sp), x
      009071                        369 00348$:
      009071 96               [ 1]  370 	ldw	x, sp
      009072 5C               [ 1]  371 	incw	x
      009073 72 FB 59         [ 2]  372 	addw	x, (0x59, sp)
      009076 1F 4D            [ 2]  373 	ldw	(0x4d, sp), x
      009078 16 65            [ 2]  374 	ldw	y, (0x65, sp)
      00907A 17 4F            [ 2]  375 	ldw	(0x4f, sp), y
      00907C 16 67            [ 2]  376 	ldw	y, (0x67, sp)
      00907E 1E 6B            [ 2]  377 	ldw	x, (0x6b, sp)
      009080 1F 55            [ 2]  378 	ldw	(0x55, sp), x
      009082 5F               [ 1]  379 	clrw	x
      009083 1F 53            [ 2]  380 	ldw	(0x53, sp), x
      009085 90 89            [ 2]  381 	pushw	y
      009087 1E 57            [ 2]  382 	ldw	x, (0x57, sp)
      009089 89               [ 2]  383 	pushw	x
      00908A 1E 57            [ 2]  384 	ldw	x, (0x57, sp)
      00908C 89               [ 2]  385 	pushw	x
      00908D 90 89            [ 2]  386 	pushw	y
      00908F 1E 57            [ 2]  387 	ldw	x, (0x57, sp)
      009091 89               [ 2]  388 	pushw	x
      009092 CD A7 86         [ 4]  389 	call	__modulong
      009095 5B 08            [ 2]  390 	addw	sp, #8
      009097 17 59            [ 2]  391 	ldw	(0x59, sp), y
      009099 90 85            [ 2]  392 	popw	y
      00909B 72 FB 43         [ 2]  393 	addw	x, (0x43, sp)
      00909E F6               [ 1]  394 	ld	a, (x)
      00909F 1E 4D            [ 2]  395 	ldw	x, (0x4d, sp)
      0090A1 F7               [ 1]  396 	ld	(x), a
                                    397 ;	./../../mib/stm8s_mib_vsprintf.c: 140: num = ((MMULONG) num) / (MMUSIGN) base;
      0090A2 1E 55            [ 2]  398 	ldw	x, (0x55, sp)
      0090A4 89               [ 2]  399 	pushw	x
      0090A5 1E 55            [ 2]  400 	ldw	x, (0x55, sp)
      0090A7 89               [ 2]  401 	pushw	x
      0090A8 90 89            [ 2]  402 	pushw	y
      0090AA 1E 55            [ 2]  403 	ldw	x, (0x55, sp)
      0090AC 89               [ 2]  404 	pushw	x
      0090AD CD A8 36         [ 4]  405 	call	__divulong
      0090B0 5B 08            [ 2]  406 	addw	sp, #8
      0090B2 1F 67            [ 2]  407 	ldw	(0x67, sp), x
      0090B4 17 65            [ 2]  408 	ldw	(0x65, sp), y
      0090B6 20 9D            [ 2]  409 	jra	00125$
      0090B8                        410 00194$:
      0090B8 16 61            [ 2]  411 	ldw	y, (0x61, sp)
      0090BA 17 59            [ 2]  412 	ldw	(0x59, sp), y
      0090BC 16 5F            [ 2]  413 	ldw	y, (0x5f, sp)
      0090BE 17 57            [ 2]  414 	ldw	(0x57, sp), y
      0090C0                        415 00130$:
                                    416 ;	./../../mib/stm8s_mib_vsprintf.c: 144: if (i > precision) precision = i;
      0090C0 1E 73            [ 2]  417 	ldw	x, (0x73, sp)
      0090C2 13 59            [ 2]  418 	cpw	x, (0x59, sp)
      0090C4 7B 72            [ 1]  419 	ld	a, (0x72, sp)
      0090C6 12 58            [ 1]  420 	sbc	a, (0x58, sp)
      0090C8 7B 71            [ 1]  421 	ld	a, (0x71, sp)
      0090CA 12 57            [ 1]  422 	sbc	a, (0x57, sp)
      0090CC 2E 08            [ 1]  423 	jrsge	00132$
      0090CE 16 59            [ 2]  424 	ldw	y, (0x59, sp)
      0090D0 17 73            [ 2]  425 	ldw	(0x73, sp), y
      0090D2 16 57            [ 2]  426 	ldw	y, (0x57, sp)
      0090D4 17 71            [ 2]  427 	ldw	(0x71, sp), y
      0090D6                        428 00132$:
                                    429 ;	./../../mib/stm8s_mib_vsprintf.c: 145: size -= precision;
      0090D6 16 6F            [ 2]  430 	ldw	y, (0x6f, sp)
      0090D8 72 F2 73         [ 2]  431 	subw	y, (0x73, sp)
      0090DB 7B 6E            [ 1]  432 	ld	a, (0x6e, sp)
      0090DD 12 72            [ 1]  433 	sbc	a, (0x72, sp)
      0090DF 97               [ 1]  434 	ld	xl, a
      0090E0 7B 6D            [ 1]  435 	ld	a, (0x6d, sp)
      0090E2 12 71            [ 1]  436 	sbc	a, (0x71, sp)
      0090E4 95               [ 1]  437 	ld	xh, a
      0090E5 17 6F            [ 2]  438 	ldw	(0x6f, sp), y
      0090E7 1F 6D            [ 2]  439 	ldw	(0x6d, sp), x
                                    440 ;	./../../mib/stm8s_mib_vsprintf.c: 146: if (!(type & (ZEROPAD | LEFT))) while (size-- > 0) *str++ = ' ';
      0090E9 7B 78            [ 1]  441 	ld	a, (0x78, sp)
      0090EB A5 11            [ 1]  442 	bcp	a, #0x11
      0090ED 26 34            [ 1]  443 	jrne	00137$
      0090EF 16 6F            [ 2]  444 	ldw	y, (0x6f, sp)
      0090F1 17 61            [ 2]  445 	ldw	(0x61, sp), y
      0090F3 16 6D            [ 2]  446 	ldw	y, (0x6d, sp)
      0090F5                        447 00133$:
      0090F5 17 53            [ 2]  448 	ldw	(0x53, sp), y
      0090F7 1E 61            [ 2]  449 	ldw	x, (0x61, sp)
      0090F9 1F 55            [ 2]  450 	ldw	(0x55, sp), x
      0090FB 1E 61            [ 2]  451 	ldw	x, (0x61, sp)
      0090FD 1D 00 01         [ 2]  452 	subw	x, #0x0001
      009100 1F 61            [ 2]  453 	ldw	(0x61, sp), x
      009102 24 02            [ 1]  454 	jrnc	00351$
      009104 90 5A            [ 2]  455 	decw	y
      009106                        456 00351$:
      009106 5F               [ 1]  457 	clrw	x
      009107 13 55            [ 2]  458 	cpw	x, (0x55, sp)
      009109 4F               [ 1]  459 	clr	a
      00910A 12 54            [ 1]  460 	sbc	a, (0x54, sp)
      00910C 4F               [ 1]  461 	clr	a
      00910D 12 53            [ 1]  462 	sbc	a, (0x53, sp)
      00910F 2E 0C            [ 1]  463 	jrsge	00195$
      009111 1E 5D            [ 2]  464 	ldw	x, (0x5d, sp)
      009113 A6 20            [ 1]  465 	ld	a, #0x20
      009115 F7               [ 1]  466 	ld	(x), a
      009116 1E 5D            [ 2]  467 	ldw	x, (0x5d, sp)
      009118 5C               [ 1]  468 	incw	x
      009119 1F 5D            [ 2]  469 	ldw	(0x5d, sp), x
      00911B 20 D8            [ 2]  470 	jra	00133$
      00911D                        471 00195$:
      00911D 17 6D            [ 2]  472 	ldw	(0x6d, sp), y
      00911F 16 61            [ 2]  473 	ldw	y, (0x61, sp)
      009121 17 6F            [ 2]  474 	ldw	(0x6f, sp), y
      009123                        475 00137$:
                                    476 ;	./../../mib/stm8s_mib_vsprintf.c: 147: if (sign) *str++ = sign;
      009123 0D 46            [ 1]  477 	tnz	(0x46, sp)
      009125 27 0A            [ 1]  478 	jreq	00139$
      009127 1E 5D            [ 2]  479 	ldw	x, (0x5d, sp)
      009129 7B 46            [ 1]  480 	ld	a, (0x46, sp)
      00912B F7               [ 1]  481 	ld	(x), a
      00912C 1E 5D            [ 2]  482 	ldw	x, (0x5d, sp)
      00912E 5C               [ 1]  483 	incw	x
      00912F 1F 5D            [ 2]  484 	ldw	(0x5d, sp), x
      009131                        485 00139$:
                                    486 ;	./../../mib/stm8s_mib_vsprintf.c: 149: if (type & SPECIAL)
      009131 1E 49            [ 2]  487 	ldw	x, (0x49, sp)
      009133 26 04            [ 1]  488 	jrne	00356$
      009135 1E 47            [ 2]  489 	ldw	x, (0x47, sp)
      009137 27 26            [ 1]  490 	jreq	00146$
      009139                        491 00356$:
                                    492 ;	./../../mib/stm8s_mib_vsprintf.c: 147: if (sign) *str++ = sign;
      009139 1E 5D            [ 2]  493 	ldw	x, (0x5d, sp)
      00913B 5C               [ 1]  494 	incw	x
                                    495 ;	./../../mib/stm8s_mib_vsprintf.c: 151: if (base == 8)
      00913C 0D 4C            [ 1]  496 	tnz	(0x4c, sp)
      00913E 27 0A            [ 1]  497 	jreq	00143$
                                    498 ;	./../../mib/stm8s_mib_vsprintf.c: 152: *str++ = '0';
      009140 16 5D            [ 2]  499 	ldw	y, (0x5d, sp)
      009142 A6 30            [ 1]  500 	ld	a, #0x30
      009144 90 F7            [ 1]  501 	ld	(y), a
      009146 1F 5D            [ 2]  502 	ldw	(0x5d, sp), x
      009148 20 15            [ 2]  503 	jra	00146$
      00914A                        504 00143$:
                                    505 ;	./../../mib/stm8s_mib_vsprintf.c: 153: else if (base == 16)
      00914A 0D 4B            [ 1]  506 	tnz	(0x4b, sp)
      00914C 27 11            [ 1]  507 	jreq	00146$
                                    508 ;	./../../mib/stm8s_mib_vsprintf.c: 155: *str++ = '0';
      00914E 16 5D            [ 2]  509 	ldw	y, (0x5d, sp)
      009150 A6 30            [ 1]  510 	ld	a, #0x30
      009152 90 F7            [ 1]  511 	ld	(y), a
                                    512 ;	./../../mib/stm8s_mib_vsprintf.c: 156: *str++ = digits[33];
      009154 90 CE 01 5A      [ 2]  513 	ldw	y, _digits+0
      009158 90 E6 21         [ 1]  514 	ld	a, (0x21, y)
      00915B F7               [ 1]  515 	ld	(x), a
      00915C 5C               [ 1]  516 	incw	x
      00915D 1F 5D            [ 2]  517 	ldw	(0x5d, sp), x
      00915F                        518 00146$:
                                    519 ;	./../../mib/stm8s_mib_vsprintf.c: 160: if (!(type & LEFT)) while (size-- > 0) *str++ = c;
      00915F 7B 78            [ 1]  520 	ld	a, (0x78, sp)
      009161 A5 10            [ 1]  521 	bcp	a, #0x10
      009163 26 3D            [ 1]  522 	jrne	00189$
      009165 16 6F            [ 2]  523 	ldw	y, (0x6f, sp)
      009167 17 61            [ 2]  524 	ldw	(0x61, sp), y
      009169 16 6D            [ 2]  525 	ldw	y, (0x6d, sp)
      00916B 17 5F            [ 2]  526 	ldw	(0x5f, sp), y
      00916D                        527 00147$:
      00916D 16 61            [ 2]  528 	ldw	y, (0x61, sp)
      00916F 17 55            [ 2]  529 	ldw	(0x55, sp), y
      009171 16 5F            [ 2]  530 	ldw	y, (0x5f, sp)
      009173 17 53            [ 2]  531 	ldw	(0x53, sp), y
      009175 1E 61            [ 2]  532 	ldw	x, (0x61, sp)
      009177 1D 00 01         [ 2]  533 	subw	x, #0x0001
      00917A 1F 61            [ 2]  534 	ldw	(0x61, sp), x
      00917C 1E 5F            [ 2]  535 	ldw	x, (0x5f, sp)
      00917E 24 01            [ 1]  536 	jrnc	00360$
      009180 5A               [ 2]  537 	decw	x
      009181                        538 00360$:
      009181 1F 5F            [ 2]  539 	ldw	(0x5f, sp), x
      009183 5F               [ 1]  540 	clrw	x
      009184 13 55            [ 2]  541 	cpw	x, (0x55, sp)
      009186 4F               [ 1]  542 	clr	a
      009187 12 54            [ 1]  543 	sbc	a, (0x54, sp)
      009189 4F               [ 1]  544 	clr	a
      00918A 12 53            [ 1]  545 	sbc	a, (0x53, sp)
      00918C 2E 0C            [ 1]  546 	jrsge	00196$
      00918E 1E 5D            [ 2]  547 	ldw	x, (0x5d, sp)
      009190 7B 45            [ 1]  548 	ld	a, (0x45, sp)
      009192 F7               [ 1]  549 	ld	(x), a
      009193 1E 5D            [ 2]  550 	ldw	x, (0x5d, sp)
      009195 5C               [ 1]  551 	incw	x
      009196 1F 5D            [ 2]  552 	ldw	(0x5d, sp), x
      009198 20 D3            [ 2]  553 	jra	00147$
                                    554 ;	./../../mib/stm8s_mib_vsprintf.c: 161: while (i < precision--) *str++ = '0';
      00919A                        555 00196$:
      00919A 16 61            [ 2]  556 	ldw	y, (0x61, sp)
      00919C 17 6F            [ 2]  557 	ldw	(0x6f, sp), y
      00919E 16 5F            [ 2]  558 	ldw	y, (0x5f, sp)
      0091A0 17 6D            [ 2]  559 	ldw	(0x6d, sp), y
      0091A2                        560 00189$:
      0091A2 16 5D            [ 2]  561 	ldw	y, (0x5d, sp)
      0091A4 1E 73            [ 2]  562 	ldw	x, (0x73, sp)
      0091A6 1F 61            [ 2]  563 	ldw	(0x61, sp), x
      0091A8 1E 71            [ 2]  564 	ldw	x, (0x71, sp)
      0091AA 1F 5F            [ 2]  565 	ldw	(0x5f, sp), x
      0091AC                        566 00152$:
      0091AC 1E 59            [ 2]  567 	ldw	x, (0x59, sp)
      0091AE 13 61            [ 2]  568 	cpw	x, (0x61, sp)
      0091B0 7B 58            [ 1]  569 	ld	a, (0x58, sp)
      0091B2 12 60            [ 1]  570 	sbc	a, (0x60, sp)
      0091B4 7B 57            [ 1]  571 	ld	a, (0x57, sp)
      0091B6 12 5F            [ 1]  572 	sbc	a, (0x5f, sp)
      0091B8 2E 16            [ 1]  573 	jrsge	00191$
      0091BA 1E 61            [ 2]  574 	ldw	x, (0x61, sp)
      0091BC 1D 00 01         [ 2]  575 	subw	x, #0x0001
      0091BF 1F 61            [ 2]  576 	ldw	(0x61, sp), x
      0091C1 1E 5F            [ 2]  577 	ldw	x, (0x5f, sp)
      0091C3 24 01            [ 1]  578 	jrnc	00364$
      0091C5 5A               [ 2]  579 	decw	x
      0091C6                        580 00364$:
      0091C6 1F 5F            [ 2]  581 	ldw	(0x5f, sp), x
      0091C8 A6 30            [ 1]  582 	ld	a, #0x30
      0091CA 90 F7            [ 1]  583 	ld	(y), a
      0091CC 90 5C            [ 1]  584 	incw	y
      0091CE 20 DC            [ 2]  585 	jra	00152$
                                    586 ;	./../../mib/stm8s_mib_vsprintf.c: 162: while (i-- > 0) *str++ = tmp[i];
      0091D0                        587 00191$:
      0091D0 17 5B            [ 2]  588 	ldw	(0x5b, sp), y
      0091D2 16 59            [ 2]  589 	ldw	y, (0x59, sp)
      0091D4 17 61            [ 2]  590 	ldw	(0x61, sp), y
      0091D6 16 57            [ 2]  591 	ldw	y, (0x57, sp)
      0091D8 17 5F            [ 2]  592 	ldw	(0x5f, sp), y
      0091DA                        593 00155$:
      0091DA 5F               [ 1]  594 	clrw	x
      0091DB 13 61            [ 2]  595 	cpw	x, (0x61, sp)
      0091DD 4F               [ 1]  596 	clr	a
      0091DE 12 60            [ 1]  597 	sbc	a, (0x60, sp)
      0091E0 4F               [ 1]  598 	clr	a
      0091E1 12 5F            [ 1]  599 	sbc	a, (0x5f, sp)
      0091E3 2E 1E            [ 1]  600 	jrsge	00193$
      0091E5 1E 61            [ 2]  601 	ldw	x, (0x61, sp)
      0091E7 1D 00 01         [ 2]  602 	subw	x, #0x0001
      0091EA 1F 61            [ 2]  603 	ldw	(0x61, sp), x
      0091EC 1E 5F            [ 2]  604 	ldw	x, (0x5f, sp)
      0091EE 24 01            [ 1]  605 	jrnc	00366$
      0091F0 5A               [ 2]  606 	decw	x
      0091F1                        607 00366$:
      0091F1 1F 5F            [ 2]  608 	ldw	(0x5f, sp), x
      0091F3 96               [ 1]  609 	ldw	x, sp
      0091F4 5C               [ 1]  610 	incw	x
      0091F5 72 FB 61         [ 2]  611 	addw	x, (0x61, sp)
      0091F8 F6               [ 1]  612 	ld	a, (x)
      0091F9 1E 5B            [ 2]  613 	ldw	x, (0x5b, sp)
      0091FB F7               [ 1]  614 	ld	(x), a
      0091FC 1E 5B            [ 2]  615 	ldw	x, (0x5b, sp)
      0091FE 5C               [ 1]  616 	incw	x
      0091FF 1F 5B            [ 2]  617 	ldw	(0x5b, sp), x
      009201 20 D7            [ 2]  618 	jra	00155$
                                    619 ;	./../../mib/stm8s_mib_vsprintf.c: 163: while (size-- > 0) *str++ = ' ';
      009203                        620 00193$:
      009203 16 5B            [ 2]  621 	ldw	y, (0x5b, sp)
      009205 1E 6F            [ 2]  622 	ldw	x, (0x6f, sp)
      009207 1F 61            [ 2]  623 	ldw	(0x61, sp), x
      009209 1E 6D            [ 2]  624 	ldw	x, (0x6d, sp)
      00920B 1F 5F            [ 2]  625 	ldw	(0x5f, sp), x
      00920D                        626 00158$:
      00920D 5F               [ 1]  627 	clrw	x
      00920E 13 61            [ 2]  628 	cpw	x, (0x61, sp)
      009210 4F               [ 1]  629 	clr	a
      009211 12 60            [ 1]  630 	sbc	a, (0x60, sp)
      009213 4F               [ 1]  631 	clr	a
      009214 12 5F            [ 1]  632 	sbc	a, (0x5f, sp)
      009216 2E 16            [ 1]  633 	jrsge	00160$
      009218 1E 61            [ 2]  634 	ldw	x, (0x61, sp)
      00921A 1D 00 01         [ 2]  635 	subw	x, #0x0001
      00921D 1F 61            [ 2]  636 	ldw	(0x61, sp), x
      00921F 1E 5F            [ 2]  637 	ldw	x, (0x5f, sp)
      009221 24 01            [ 1]  638 	jrnc	00369$
      009223 5A               [ 2]  639 	decw	x
      009224                        640 00369$:
      009224 1F 5F            [ 2]  641 	ldw	(0x5f, sp), x
      009226 A6 20            [ 1]  642 	ld	a, #0x20
      009228 90 F7            [ 1]  643 	ld	(y), a
      00922A 90 5C            [ 1]  644 	incw	y
      00922C 20 DF            [ 2]  645 	jra	00158$
      00922E                        646 00160$:
                                    647 ;	./../../mib/stm8s_mib_vsprintf.c: 165: return str;
      00922E 93               [ 1]  648 	ldw	x, y
      00922F                        649 00161$:
                                    650 ;	./../../mib/stm8s_mib_vsprintf.c: 166: }
      00922F 16 63            [ 2]  651 	ldw	y, (99, sp)
      009231 5B 78            [ 2]  652 	addw	sp, #120
      009233 90 FC            [ 2]  653 	jp	(y)
                                    654 ;	./../../mib/stm8s_mib_vsprintf.c: 172: MMRINT mm_vsprintf(char *buf, const char *fmt, va_list args)
                                    655 ;	-----------------------------------------
                                    656 ;	 function mm_vsprintf
                                    657 ;	-----------------------------------------
      009235                        658 _mm_vsprintf:
      009235 52 21            [ 2]  659 	sub	sp, #33
      009237 1F 1A            [ 2]  660 	ldw	(0x1a, sp), x
                                    661 ;	./../../mib/stm8s_mib_vsprintf.c: 186: char vStr[] = "<NULL>";
      009239 A6 3C            [ 1]  662 	ld	a, #0x3c
      00923B 6B 0D            [ 1]  663 	ld	(0x0d, sp), a
      00923D A6 4E            [ 1]  664 	ld	a, #0x4e
      00923F 6B 0E            [ 1]  665 	ld	(0x0e, sp), a
      009241 A6 55            [ 1]  666 	ld	a, #0x55
      009243 6B 0F            [ 1]  667 	ld	(0x0f, sp), a
      009245 A6 4C            [ 1]  668 	ld	a, #0x4c
      009247 6B 10            [ 1]  669 	ld	(0x10, sp), a
      009249 6B 11            [ 1]  670 	ld	(0x11, sp), a
      00924B A6 3E            [ 1]  671 	ld	a, #0x3e
      00924D 6B 12            [ 1]  672 	ld	(0x12, sp), a
      00924F 0F 13            [ 1]  673 	clr	(0x13, sp)
                                    674 ;	./../../mib/stm8s_mib_vsprintf.c: 188: for (str = buf; *fmt; fmt++)
      009251 16 1A            [ 2]  675 	ldw	y, (0x1a, sp)
      009253 17 1C            [ 2]  676 	ldw	(0x1c, sp), y
      009255                        677 00185$:
      009255 16 24            [ 2]  678 	ldw	y, (0x24, sp)
      009257 17 20            [ 2]  679 	ldw	(0x20, sp), y
      009259 93               [ 1]  680 	ldw	x, y
      00925A F6               [ 1]  681 	ld	a, (x)
      00925B 6B 1F            [ 1]  682 	ld	(0x1f, sp), a
      00925D 26 03            [ 1]  683 	jrne	00437$
      00925F CC 96 5B         [ 2]  684 	jp	00180$
      009262                        685 00437$:
                                    686 ;	./../../mib/stm8s_mib_vsprintf.c: 190: if (*fmt != '%')
      009262 7B 1F            [ 1]  687 	ld	a, (0x1f, sp)
      009264 A1 25            [ 1]  688 	cp	a, #0x25
      009266 27 0D            [ 1]  689 	jreq	00102$
                                    690 ;	./../../mib/stm8s_mib_vsprintf.c: 192: *str++ = *fmt;
      009268 1E 1C            [ 2]  691 	ldw	x, (0x1c, sp)
      00926A 7B 1F            [ 1]  692 	ld	a, (0x1f, sp)
      00926C F7               [ 1]  693 	ld	(x), a
      00926D 1E 1C            [ 2]  694 	ldw	x, (0x1c, sp)
      00926F 5C               [ 1]  695 	incw	x
      009270 1F 1C            [ 2]  696 	ldw	(0x1c, sp), x
                                    697 ;	./../../mib/stm8s_mib_vsprintf.c: 193: continue;
      009272 CC 96 53         [ 2]  698 	jp	00179$
      009275                        699 00102$:
                                    700 ;	./../../mib/stm8s_mib_vsprintf.c: 197: flags = 0;
      009275 5F               [ 1]  701 	clrw	x
      009276 1F 0B            [ 2]  702 	ldw	(0x0b, sp), x
      009278 1F 09            [ 2]  703 	ldw	(0x09, sp), x
                                    704 ;	./../../mib/stm8s_mib_vsprintf.c: 198: repeat:
      00927A 1E 20            [ 2]  705 	ldw	x, (0x20, sp)
      00927C                        706 00103$:
                                    707 ;	./../../mib/stm8s_mib_vsprintf.c: 199: fmt++; // This also skips first '%'
      00927C 5C               [ 1]  708 	incw	x
      00927D 1F 24            [ 2]  709 	ldw	(0x24, sp), x
                                    710 ;	./../../mib/stm8s_mib_vsprintf.c: 200: switch (*fmt)
      00927F F6               [ 1]  711 	ld	a, (x)
      009280 6B 19            [ 1]  712 	ld	(0x19, sp), a
      009282 A1 20            [ 1]  713 	cp	a, #0x20
      009284 27 2C            [ 1]  714 	jreq	00106$
      009286 7B 19            [ 1]  715 	ld	a, (0x19, sp)
      009288 A1 23            [ 1]  716 	cp	a, #0x23
      00928A 27 2E            [ 1]  717 	jreq	00107$
      00928C 7B 19            [ 1]  718 	ld	a, (0x19, sp)
      00928E A1 2B            [ 1]  719 	cp	a, #0x2b
      009290 27 18            [ 1]  720 	jreq	00105$
      009292 7B 19            [ 1]  721 	ld	a, (0x19, sp)
      009294 A1 2D            [ 1]  722 	cp	a, #0x2d
      009296 27 0A            [ 1]  723 	jreq	00104$
      009298 7B 19            [ 1]  724 	ld	a, (0x19, sp)
      00929A A1 30            [ 1]  725 	cp	a, #0x30
      00929C 27 24            [ 1]  726 	jreq	00108$
      00929E 1F 24            [ 2]  727 	ldw	(0x24, sp), x
      0092A0 20 27            [ 2]  728 	jra	00109$
                                    729 ;	./../../mib/stm8s_mib_vsprintf.c: 202: case '-': flags |= LEFT; goto repeat;
      0092A2                        730 00104$:
      0092A2 7B 0C            [ 1]  731 	ld	a, (0x0c, sp)
      0092A4 AA 10            [ 1]  732 	or	a, #0x10
      0092A6 6B 0C            [ 1]  733 	ld	(0x0c, sp), a
      0092A8 20 D2            [ 2]  734 	jra	00103$
                                    735 ;	./../../mib/stm8s_mib_vsprintf.c: 203: case '+': flags |= PLUS; goto repeat;
      0092AA                        736 00105$:
      0092AA 7B 0C            [ 1]  737 	ld	a, (0x0c, sp)
      0092AC AA 04            [ 1]  738 	or	a, #0x04
      0092AE 6B 0C            [ 1]  739 	ld	(0x0c, sp), a
      0092B0 20 CA            [ 2]  740 	jra	00103$
                                    741 ;	./../../mib/stm8s_mib_vsprintf.c: 204: case ' ': flags |= SPACE; goto repeat;
      0092B2                        742 00106$:
      0092B2 7B 0C            [ 1]  743 	ld	a, (0x0c, sp)
      0092B4 AA 08            [ 1]  744 	or	a, #0x08
      0092B6 6B 0C            [ 1]  745 	ld	(0x0c, sp), a
      0092B8 20 C2            [ 2]  746 	jra	00103$
                                    747 ;	./../../mib/stm8s_mib_vsprintf.c: 205: case '#': flags |= SPECIAL; goto repeat;
      0092BA                        748 00107$:
      0092BA 7B 0C            [ 1]  749 	ld	a, (0x0c, sp)
      0092BC AA 20            [ 1]  750 	or	a, #0x20
      0092BE 6B 0C            [ 1]  751 	ld	(0x0c, sp), a
      0092C0 20 BA            [ 2]  752 	jra	00103$
                                    753 ;	./../../mib/stm8s_mib_vsprintf.c: 206: case '0': flags |= ZEROPAD; goto repeat;
      0092C2                        754 00108$:
      0092C2 04 0C            [ 1]  755 	srl	(0x0c, sp)
      0092C4 99               [ 1]  756 	scf
      0092C5 09 0C            [ 1]  757 	rlc	(0x0c, sp)
      0092C7 20 B3            [ 2]  758 	jra	00103$
                                    759 ;	./../../mib/stm8s_mib_vsprintf.c: 207: }
      0092C9                        760 00109$:
                                    761 ;	./../../mib/stm8s_mib_vsprintf.c: 210: field_width = -1;
      0092C9 5F               [ 1]  762 	clrw	x
      0092CA 5A               [ 2]  763 	decw	x
      0092CB 1F 20            [ 2]  764 	ldw	(0x20, sp), x
      0092CD 1F 1E            [ 2]  765 	ldw	(0x1e, sp), x
                                    766 ;	./../../mib/stm8s_mib_vsprintf.c: 211: if (is_digit(*fmt))
      0092CF 7B 19            [ 1]  767 	ld	a, (0x19, sp)
      0092D1 A1 30            [ 1]  768 	cp	a, #0x30
      0092D3 25 11            [ 1]  769 	jrc	00115$
      0092D5 A1 39            [ 1]  770 	cp	a, #0x39
      0092D7 22 0D            [ 1]  771 	jrugt	00115$
                                    772 ;	./../../mib/stm8s_mib_vsprintf.c: 212: field_width = skip_atoi(&fmt);
      0092D9 96               [ 1]  773 	ldw	x, sp
      0092DA 1C 00 24         [ 2]  774 	addw	x, #36
      0092DD CD 8E D9         [ 4]  775 	call	_skip_atoi
      0092E0 1F 20            [ 2]  776 	ldw	(0x20, sp), x
      0092E2 17 1E            [ 2]  777 	ldw	(0x1e, sp), y
      0092E4 20 39            [ 2]  778 	jra	00116$
      0092E6                        779 00115$:
                                    780 ;	./../../mib/stm8s_mib_vsprintf.c: 213: else if (*fmt == '*')
      0092E6 1E 24            [ 2]  781 	ldw	x, (0x24, sp)
      0092E8 F6               [ 1]  782 	ld	a, (x)
      0092E9 A1 2A            [ 1]  783 	cp	a, #0x2a
      0092EB 26 32            [ 1]  784 	jrne	00116$
                                    785 ;	./../../mib/stm8s_mib_vsprintf.c: 215: fmt++;
      0092ED 5C               [ 1]  786 	incw	x
      0092EE 1F 24            [ 2]  787 	ldw	(0x24, sp), x
                                    788 ;	./../../mib/stm8s_mib_vsprintf.c: 216: field_width = va_arg(args, MMINT);
      0092F0 1E 26            [ 2]  789 	ldw	x, (0x26, sp)
      0092F2 1C 00 04         [ 2]  790 	addw	x, #0x0004
      0092F5 1F 26            [ 2]  791 	ldw	(0x26, sp), x
      0092F7 1D 00 04         [ 2]  792 	subw	x, #0x0004
      0092FA 90 93            [ 1]  793 	ldw	y, x
      0092FC 90 EE 02         [ 2]  794 	ldw	y, (0x2, y)
      0092FF FE               [ 2]  795 	ldw	x, (x)
      009300 17 20            [ 2]  796 	ldw	(0x20, sp), y
      009302 1F 1E            [ 2]  797 	ldw	(0x1e, sp), x
                                    798 ;	./../../mib/stm8s_mib_vsprintf.c: 217: if (field_width < 0)
      009304 0D 1E            [ 1]  799 	tnz	(0x1e, sp)
      009306 2A 17            [ 1]  800 	jrpl	00116$
                                    801 ;	./../../mib/stm8s_mib_vsprintf.c: 219: field_width = -field_width;
      009308 00 21            [ 1]  802 	neg	(0x21, sp)
      00930A 4F               [ 1]  803 	clr	a
      00930B 12 20            [ 1]  804 	sbc	a, (0x20, sp)
      00930D 6B 20            [ 1]  805 	ld	(0x20, sp), a
      00930F 4F               [ 1]  806 	clr	a
      009310 12 1F            [ 1]  807 	sbc	a, (0x1f, sp)
      009312 6B 1F            [ 1]  808 	ld	(0x1f, sp), a
      009314 4F               [ 1]  809 	clr	a
      009315 12 1E            [ 1]  810 	sbc	a, (0x1e, sp)
      009317 6B 1E            [ 1]  811 	ld	(0x1e, sp), a
                                    812 ;	./../../mib/stm8s_mib_vsprintf.c: 220: flags |= LEFT;
      009319 7B 0C            [ 1]  813 	ld	a, (0x0c, sp)
      00931B AA 10            [ 1]  814 	or	a, #0x10
      00931D 6B 0C            [ 1]  815 	ld	(0x0c, sp), a
      00931F                        816 00116$:
                                    817 ;	./../../mib/stm8s_mib_vsprintf.c: 225: precision = -1;
      00931F 5F               [ 1]  818 	clrw	x
      009320 5A               [ 2]  819 	decw	x
      009321 1F 18            [ 2]  820 	ldw	(0x18, sp), x
      009323 1F 16            [ 2]  821 	ldw	(0x16, sp), x
                                    822 ;	./../../mib/stm8s_mib_vsprintf.c: 226: if (*fmt == '.')
      009325 16 24            [ 2]  823 	ldw	y, (0x24, sp)
      009327 17 14            [ 2]  824 	ldw	(0x14, sp), y
      009329 93               [ 1]  825 	ldw	x, y
      00932A F6               [ 1]  826 	ld	a, (x)
      00932B A1 2E            [ 1]  827 	cp	a, #0x2e
      00932D 26 42            [ 1]  828 	jrne	00127$
                                    829 ;	./../../mib/stm8s_mib_vsprintf.c: 228: ++fmt;    
      00932F 1E 14            [ 2]  830 	ldw	x, (0x14, sp)
      009331 5C               [ 1]  831 	incw	x
                                    832 ;	./../../mib/stm8s_mib_vsprintf.c: 229: if (is_digit(*fmt))
      009332 1F 24            [ 2]  833 	ldw	(0x24, sp), x
      009334 F6               [ 1]  834 	ld	a, (x)
      009335 A1 30            [ 1]  835 	cp	a, #0x30
      009337 25 11            [ 1]  836 	jrc	00121$
      009339 A1 39            [ 1]  837 	cp	a, #0x39
      00933B 22 0D            [ 1]  838 	jrugt	00121$
                                    839 ;	./../../mib/stm8s_mib_vsprintf.c: 230: precision = skip_atoi(&fmt);
      00933D 96               [ 1]  840 	ldw	x, sp
      00933E 1C 00 24         [ 2]  841 	addw	x, #36
      009341 CD 8E D9         [ 4]  842 	call	_skip_atoi
      009344 1F 18            [ 2]  843 	ldw	(0x18, sp), x
      009346 17 16            [ 2]  844 	ldw	(0x16, sp), y
      009348 20 1E            [ 2]  845 	jra	00122$
      00934A                        846 00121$:
                                    847 ;	./../../mib/stm8s_mib_vsprintf.c: 231: else if (*fmt == '*')
      00934A 1E 24            [ 2]  848 	ldw	x, (0x24, sp)
      00934C F6               [ 1]  849 	ld	a, (x)
      00934D A1 2A            [ 1]  850 	cp	a, #0x2a
      00934F 26 17            [ 1]  851 	jrne	00122$
                                    852 ;	./../../mib/stm8s_mib_vsprintf.c: 233: ++fmt;
      009351 5C               [ 1]  853 	incw	x
      009352 1F 24            [ 2]  854 	ldw	(0x24, sp), x
                                    855 ;	./../../mib/stm8s_mib_vsprintf.c: 234: precision = va_arg(args, MMINT);
      009354 1E 26            [ 2]  856 	ldw	x, (0x26, sp)
      009356 1C 00 04         [ 2]  857 	addw	x, #0x0004
      009359 1F 26            [ 2]  858 	ldw	(0x26, sp), x
      00935B 1D 00 04         [ 2]  859 	subw	x, #0x0004
      00935E 90 93            [ 1]  860 	ldw	y, x
      009360 90 EE 02         [ 2]  861 	ldw	y, (0x2, y)
      009363 FE               [ 2]  862 	ldw	x, (x)
      009364 17 18            [ 2]  863 	ldw	(0x18, sp), y
      009366 1F 16            [ 2]  864 	ldw	(0x16, sp), x
      009368                        865 00122$:
                                    866 ;	./../../mib/stm8s_mib_vsprintf.c: 236: if (precision < 0) precision = 0;
      009368 0D 16            [ 1]  867 	tnz	(0x16, sp)
      00936A 2A 05            [ 1]  868 	jrpl	00127$
      00936C 5F               [ 1]  869 	clrw	x
      00936D 1F 18            [ 2]  870 	ldw	(0x18, sp), x
      00936F 1F 16            [ 2]  871 	ldw	(0x16, sp), x
      009371                        872 00127$:
                                    873 ;	./../../mib/stm8s_mib_vsprintf.c: 240: qualifier = -1;
      009371 5F               [ 1]  874 	clrw	x
      009372 5A               [ 2]  875 	decw	x
      009373 1F 03            [ 2]  876 	ldw	(0x03, sp), x
      009375 1F 01            [ 2]  877 	ldw	(0x01, sp), x
                                    878 ;	./../../mib/stm8s_mib_vsprintf.c: 241: if (*fmt == 'h' || *fmt == 'l' || *fmt == 'L')
      009377 1E 24            [ 2]  879 	ldw	x, (0x24, sp)
      009379 F6               [ 1]  880 	ld	a, (x)
      00937A 6B 15            [ 1]  881 	ld	(0x15, sp), a
      00937C A1 68            [ 1]  882 	cp	a, #0x68
      00937E 27 0C            [ 1]  883 	jreq	00128$
      009380 7B 15            [ 1]  884 	ld	a, (0x15, sp)
      009382 A1 6C            [ 1]  885 	cp	a, #0x6c
      009384 27 06            [ 1]  886 	jreq	00128$
      009386 7B 15            [ 1]  887 	ld	a, (0x15, sp)
      009388 A1 4C            [ 1]  888 	cp	a, #0x4c
      00938A 26 0E            [ 1]  889 	jrne	00129$
      00938C                        890 00128$:
                                    891 ;	./../../mib/stm8s_mib_vsprintf.c: 243: qualifier = *fmt;
      00938C 1E 24            [ 2]  892 	ldw	x, (0x24, sp)
      00938E F6               [ 1]  893 	ld	a, (x)
      00938F 6B 04            [ 1]  894 	ld	(0x04, sp), a
      009391 0F 03            [ 1]  895 	clr	(0x03, sp)
      009393 0F 02            [ 1]  896 	clr	(0x02, sp)
      009395 0F 01            [ 1]  897 	clr	(0x01, sp)
                                    898 ;	./../../mib/stm8s_mib_vsprintf.c: 244: fmt++;
      009397 5C               [ 1]  899 	incw	x
      009398 1F 24            [ 2]  900 	ldw	(0x24, sp), x
      00939A                        901 00129$:
                                    902 ;	./../../mib/stm8s_mib_vsprintf.c: 248: base = 10;
      00939A AE 00 0A         [ 2]  903 	ldw	x, #0x000a
      00939D 1F 07            [ 2]  904 	ldw	(0x07, sp), x
      00939F 5F               [ 1]  905 	clrw	x
      0093A0 1F 05            [ 2]  906 	ldw	(0x05, sp), x
                                    907 ;	./../../mib/stm8s_mib_vsprintf.c: 250: switch (*fmt)
      0093A2 16 24            [ 2]  908 	ldw	y, (0x24, sp)
      0093A4 17 14            [ 2]  909 	ldw	(0x14, sp), y
      0093A6 93               [ 1]  910 	ldw	x, y
      0093A7 F6               [ 1]  911 	ld	a, (x)
      0093A8 A1 58            [ 1]  912 	cp	a, #0x58
      0093AA 26 03            [ 1]  913 	jrne	00482$
      0093AC CC 95 A2         [ 2]  914 	jp	00161$
      0093AF                        915 00482$:
      0093AF A1 63            [ 1]  916 	cp	a, #0x63
      0093B1 27 38            [ 1]  917 	jreq	00132$
      0093B3 A1 64            [ 1]  918 	cp	a, #0x64
      0093B5 26 03            [ 1]  919 	jrne	00488$
      0093B7 CC 95 B2         [ 2]  920 	jp	00164$
      0093BA                        921 00488$:
      0093BA A1 69            [ 1]  922 	cp	a, #0x69
      0093BC 26 03            [ 1]  923 	jrne	00491$
      0093BE CC 95 B2         [ 2]  924 	jp	00164$
      0093C1                        925 00491$:
      0093C1 A1 6E            [ 1]  926 	cp	a, #0x6e
      0093C3 26 03            [ 1]  927 	jrne	00494$
      0093C5 CC 95 4D         [ 2]  928 	jp	00156$
      0093C8                        929 00494$:
      0093C8 A1 6F            [ 1]  930 	cp	a, #0x6f
      0093CA 26 03            [ 1]  931 	jrne	00497$
      0093CC CC 95 98         [ 2]  932 	jp	00160$
      0093CF                        933 00497$:
      0093CF A1 70            [ 1]  934 	cp	a, #0x70
      0093D1 26 03            [ 1]  935 	jrne	00500$
      0093D3 CC 95 02         [ 2]  936 	jp	00153$
      0093D6                        937 00500$:
      0093D6 A1 73            [ 1]  938 	cp	a, #0x73
      0093D8 27 76            [ 1]  939 	jreq	00141$
      0093DA A1 75            [ 1]  940 	cp	a, #0x75
      0093DC 26 03            [ 1]  941 	jrne	00506$
      0093DE CC 95 DC         [ 2]  942 	jp	00172$
      0093E1                        943 00506$:
      0093E1 A1 78            [ 1]  944 	cp	a, #0x78
      0093E3 26 03            [ 1]  945 	jrne	00509$
      0093E5 CC 95 A8         [ 2]  946 	jp	00162$
      0093E8                        947 00509$:
      0093E8 CC 95 BA         [ 2]  948 	jp	00166$
                                    949 ;	./../../mib/stm8s_mib_vsprintf.c: 252: case 'c':
      0093EB                        950 00132$:
                                    951 ;	./../../mib/stm8s_mib_vsprintf.c: 253: if (!(flags & LEFT)) while (--field_width > 0) *str++ = ' ';
      0093EB 7B 0C            [ 1]  952 	ld	a, (0x0c, sp)
      0093ED A5 10            [ 1]  953 	bcp	a, #0x10
      0093EF 26 25            [ 1]  954 	jrne	00137$
      0093F1 16 1C            [ 2]  955 	ldw	y, (0x1c, sp)
      0093F3                        956 00133$:
      0093F3 1E 20            [ 2]  957 	ldw	x, (0x20, sp)
      0093F5 1D 00 01         [ 2]  958 	subw	x, #0x0001
      0093F8 1F 20            [ 2]  959 	ldw	(0x20, sp), x
      0093FA 1E 1E            [ 2]  960 	ldw	x, (0x1e, sp)
      0093FC 24 01            [ 1]  961 	jrnc	00512$
      0093FE 5A               [ 2]  962 	decw	x
      0093FF                        963 00512$:
      0093FF 1F 1E            [ 2]  964 	ldw	(0x1e, sp), x
      009401 5F               [ 1]  965 	clrw	x
      009402 13 20            [ 2]  966 	cpw	x, (0x20, sp)
      009404 4F               [ 1]  967 	clr	a
      009405 12 1F            [ 1]  968 	sbc	a, (0x1f, sp)
      009407 4F               [ 1]  969 	clr	a
      009408 12 1E            [ 1]  970 	sbc	a, (0x1e, sp)
      00940A 2E 08            [ 1]  971 	jrsge	00236$
      00940C A6 20            [ 1]  972 	ld	a, #0x20
      00940E 90 F7            [ 1]  973 	ld	(y), a
      009410 90 5C            [ 1]  974 	incw	y
      009412 20 DF            [ 2]  975 	jra	00133$
      009414                        976 00236$:
      009414 17 1C            [ 2]  977 	ldw	(0x1c, sp), y
      009416                        978 00137$:
                                    979 ;	./../../mib/stm8s_mib_vsprintf.c: 254: *str++ = (MMUCHAR) va_arg(args, MMAINT); // test ok...
      009416 1E 26            [ 2]  980 	ldw	x, (0x26, sp)
      009418 5C               [ 1]  981 	incw	x
      009419 5C               [ 1]  982 	incw	x
      00941A 1F 26            [ 2]  983 	ldw	(0x26, sp), x
      00941C 5A               [ 2]  984 	decw	x
      00941D 5A               [ 2]  985 	decw	x
      00941E E6 01            [ 1]  986 	ld	a, (0x1, x)
      009420 1E 1C            [ 2]  987 	ldw	x, (0x1c, sp)
      009422 F7               [ 1]  988 	ld	(x), a
      009423 1E 1C            [ 2]  989 	ldw	x, (0x1c, sp)
      009425 5C               [ 1]  990 	incw	x
      009426 1F 18            [ 2]  991 	ldw	(0x18, sp), x
                                    992 ;	./../../mib/stm8s_mib_vsprintf.c: 255: while (--field_width > 0) *str++ = ' ';
      009428                        993 00138$:
      009428 1E 20            [ 2]  994 	ldw	x, (0x20, sp)
      00942A 1D 00 01         [ 2]  995 	subw	x, #0x0001
      00942D 1F 20            [ 2]  996 	ldw	(0x20, sp), x
      00942F 1E 1E            [ 2]  997 	ldw	x, (0x1e, sp)
      009431 24 01            [ 1]  998 	jrnc	00514$
      009433 5A               [ 2]  999 	decw	x
      009434                       1000 00514$:
      009434 1F 1E            [ 2] 1001 	ldw	(0x1e, sp), x
      009436 5F               [ 1] 1002 	clrw	x
      009437 13 20            [ 2] 1003 	cpw	x, (0x20, sp)
      009439 4F               [ 1] 1004 	clr	a
      00943A 12 1F            [ 1] 1005 	sbc	a, (0x1f, sp)
      00943C 4F               [ 1] 1006 	clr	a
      00943D 12 1E            [ 1] 1007 	sbc	a, (0x1e, sp)
      00943F 2F 03            [ 1] 1008 	jrslt	00515$
      009441 CC 96 4F         [ 2] 1009 	jp	00237$
      009444                       1010 00515$:
      009444 1E 18            [ 2] 1011 	ldw	x, (0x18, sp)
      009446 A6 20            [ 1] 1012 	ld	a, #0x20
      009448 F7               [ 1] 1013 	ld	(x), a
      009449 1E 18            [ 2] 1014 	ldw	x, (0x18, sp)
      00944B 5C               [ 1] 1015 	incw	x
      00944C 1F 18            [ 2] 1016 	ldw	(0x18, sp), x
      00944E 20 D8            [ 2] 1017 	jra	00138$
                                   1018 ;	./../../mib/stm8s_mib_vsprintf.c: 258: case 's':
      009450                       1019 00141$:
                                   1020 ;	./../../mib/stm8s_mib_vsprintf.c: 259: s = va_arg(args, char *);
      009450 1E 26            [ 2] 1021 	ldw	x, (0x26, sp)
      009452 5C               [ 1] 1022 	incw	x
      009453 5C               [ 1] 1023 	incw	x
      009454 1F 26            [ 2] 1024 	ldw	(0x26, sp), x
      009456 5A               [ 2] 1025 	decw	x
      009457 5A               [ 2] 1026 	decw	x
      009458 FE               [ 2] 1027 	ldw	x, (x)
                                   1028 ;	./../../mib/stm8s_mib_vsprintf.c: 260: if (!s) s = vStr; // "<NULL>";
      009459 1F 14            [ 2] 1029 	ldw	(0x14, sp), x
      00945B 26 06            [ 1] 1030 	jrne	00143$
      00945D 96               [ 1] 1031 	ldw	x, sp
      00945E 1C 00 0D         [ 2] 1032 	addw	x, #13
      009461 1F 14            [ 2] 1033 	ldw	(0x14, sp), x
      009463                       1034 00143$:
                                   1035 ;	./../../mib/stm8s_mib_vsprintf.c: 261: len = strnlen(s, precision);
      009463 1E 18            [ 2] 1036 	ldw	x, (0x18, sp)
      009465 89               [ 2] 1037 	pushw	x
      009466 1E 16            [ 2] 1038 	ldw	x, (0x16, sp)
      009468 CD 8E B0         [ 4] 1039 	call	_strnlen
      00946B 1F 18            [ 2] 1040 	ldw	(0x18, sp), x
      00946D 5F               [ 1] 1041 	clrw	x
      00946E 1F 16            [ 2] 1042 	ldw	(0x16, sp), x
                                   1043 ;	./../../mib/stm8s_mib_vsprintf.c: 262: if (!(flags & LEFT)) while (len < field_width--) *str++ = ' ';
      009470 7B 0C            [ 1] 1044 	ld	a, (0x0c, sp)
      009472 A5 10            [ 1] 1045 	bcp	a, #0x10
      009474 26 30            [ 1] 1046 	jrne	00225$
      009476                       1047 00144$:
      009476 16 20            [ 2] 1048 	ldw	y, (0x20, sp)
      009478 17 0B            [ 2] 1049 	ldw	(0x0b, sp), y
      00947A 16 1E            [ 2] 1050 	ldw	y, (0x1e, sp)
      00947C 17 09            [ 2] 1051 	ldw	(0x09, sp), y
      00947E 1E 20            [ 2] 1052 	ldw	x, (0x20, sp)
      009480 1D 00 01         [ 2] 1053 	subw	x, #0x0001
      009483 1F 20            [ 2] 1054 	ldw	(0x20, sp), x
      009485 1E 1E            [ 2] 1055 	ldw	x, (0x1e, sp)
      009487 24 01            [ 1] 1056 	jrnc	00519$
      009489 5A               [ 2] 1057 	decw	x
      00948A                       1058 00519$:
      00948A 1F 1E            [ 2] 1059 	ldw	(0x1e, sp), x
      00948C 1E 18            [ 2] 1060 	ldw	x, (0x18, sp)
      00948E 13 0B            [ 2] 1061 	cpw	x, (0x0b, sp)
      009490 7B 17            [ 1] 1062 	ld	a, (0x17, sp)
      009492 12 0A            [ 1] 1063 	sbc	a, (0x0a, sp)
      009494 7B 16            [ 1] 1064 	ld	a, (0x16, sp)
      009496 12 09            [ 1] 1065 	sbc	a, (0x09, sp)
      009498 2E 0C            [ 1] 1066 	jrsge	00238$
      00949A 1E 1C            [ 2] 1067 	ldw	x, (0x1c, sp)
      00949C A6 20            [ 1] 1068 	ld	a, #0x20
      00949E F7               [ 1] 1069 	ld	(x), a
      00949F 1E 1C            [ 2] 1070 	ldw	x, (0x1c, sp)
      0094A1 5C               [ 1] 1071 	incw	x
      0094A2 1F 1C            [ 2] 1072 	ldw	(0x1c, sp), x
      0094A4 20 D0            [ 2] 1073 	jra	00144$
      0094A6                       1074 00238$:
                                   1075 ;	./../../mib/stm8s_mib_vsprintf.c: 263: for (i = 0; i < len; ++i) *str++ = *s++;
      0094A6                       1076 00225$:
      0094A6 5F               [ 1] 1077 	clrw	x
      0094A7 1F 0B            [ 2] 1078 	ldw	(0x0b, sp), x
      0094A9 1F 09            [ 2] 1079 	ldw	(0x09, sp), x
      0094AB                       1080 00182$:
      0094AB 1E 0B            [ 2] 1081 	ldw	x, (0x0b, sp)
      0094AD 13 18            [ 2] 1082 	cpw	x, (0x18, sp)
      0094AF 7B 0A            [ 1] 1083 	ld	a, (0x0a, sp)
      0094B1 12 17            [ 1] 1084 	sbc	a, (0x17, sp)
      0094B3 7B 09            [ 1] 1085 	ld	a, (0x09, sp)
      0094B5 12 16            [ 1] 1086 	sbc	a, (0x16, sp)
      0094B7 2E 1E            [ 1] 1087 	jrsge	00227$
      0094B9 1E 14            [ 2] 1088 	ldw	x, (0x14, sp)
      0094BB F6               [ 1] 1089 	ld	a, (x)
      0094BC 1E 14            [ 2] 1090 	ldw	x, (0x14, sp)
      0094BE 5C               [ 1] 1091 	incw	x
      0094BF 1F 14            [ 2] 1092 	ldw	(0x14, sp), x
      0094C1 1E 1C            [ 2] 1093 	ldw	x, (0x1c, sp)
      0094C3 F7               [ 1] 1094 	ld	(x), a
      0094C4 1E 1C            [ 2] 1095 	ldw	x, (0x1c, sp)
      0094C6 5C               [ 1] 1096 	incw	x
      0094C7 1F 1C            [ 2] 1097 	ldw	(0x1c, sp), x
      0094C9 1E 0B            [ 2] 1098 	ldw	x, (0x0b, sp)
      0094CB 5C               [ 1] 1099 	incw	x
      0094CC 1F 0B            [ 2] 1100 	ldw	(0x0b, sp), x
      0094CE 26 DB            [ 1] 1101 	jrne	00182$
      0094D0 1E 09            [ 2] 1102 	ldw	x, (0x09, sp)
      0094D2 5C               [ 1] 1103 	incw	x
      0094D3 1F 09            [ 2] 1104 	ldw	(0x09, sp), x
      0094D5 20 D4            [ 2] 1105 	jra	00182$
                                   1106 ;	./../../mib/stm8s_mib_vsprintf.c: 264: while (len < field_width--) *str++ = ' ';
      0094D7                       1107 00227$:
      0094D7                       1108 00150$:
      0094D7 1E 18            [ 2] 1109 	ldw	x, (0x18, sp)
      0094D9 13 20            [ 2] 1110 	cpw	x, (0x20, sp)
      0094DB 7B 17            [ 1] 1111 	ld	a, (0x17, sp)
      0094DD 12 1F            [ 1] 1112 	sbc	a, (0x1f, sp)
      0094DF 7B 16            [ 1] 1113 	ld	a, (0x16, sp)
      0094E1 12 1E            [ 1] 1114 	sbc	a, (0x1e, sp)
      0094E3 2F 03            [ 1] 1115 	jrslt	00526$
      0094E5 CC 96 53         [ 2] 1116 	jp	00240$
      0094E8                       1117 00526$:
      0094E8 1E 20            [ 2] 1118 	ldw	x, (0x20, sp)
      0094EA 1D 00 01         [ 2] 1119 	subw	x, #0x0001
      0094ED 1F 20            [ 2] 1120 	ldw	(0x20, sp), x
      0094EF 1E 1E            [ 2] 1121 	ldw	x, (0x1e, sp)
      0094F1 24 01            [ 1] 1122 	jrnc	00527$
      0094F3 5A               [ 2] 1123 	decw	x
      0094F4                       1124 00527$:
      0094F4 1F 1E            [ 2] 1125 	ldw	(0x1e, sp), x
      0094F6 1E 1C            [ 2] 1126 	ldw	x, (0x1c, sp)
      0094F8 A6 20            [ 1] 1127 	ld	a, #0x20
      0094FA F7               [ 1] 1128 	ld	(x), a
      0094FB 1E 1C            [ 2] 1129 	ldw	x, (0x1c, sp)
      0094FD 5C               [ 1] 1130 	incw	x
      0094FE 1F 1C            [ 2] 1131 	ldw	(0x1c, sp), x
      009500 20 D5            [ 2] 1132 	jra	00150$
                                   1133 ;	./../../mib/stm8s_mib_vsprintf.c: 267: case 'p':
      009502                       1134 00153$:
                                   1135 ;	./../../mib/stm8s_mib_vsprintf.c: 268: if (field_width == -1)
      009502 1E 20            [ 2] 1136 	ldw	x, (0x20, sp)
      009504 5C               [ 1] 1137 	incw	x
      009505 26 12            [ 1] 1138 	jrne	00155$
      009507 1E 1E            [ 2] 1139 	ldw	x, (0x1e, sp)
      009509 5C               [ 1] 1140 	incw	x
      00950A 26 0D            [ 1] 1141 	jrne	00155$
                                   1142 ;	./../../mib/stm8s_mib_vsprintf.c: 270: field_width = 2 * sizeof(void *);
      00950C AE 00 04         [ 2] 1143 	ldw	x, #0x0004
      00950F 1F 20            [ 2] 1144 	ldw	(0x20, sp), x
      009511 5F               [ 1] 1145 	clrw	x
      009512 1F 1E            [ 2] 1146 	ldw	(0x1e, sp), x
                                   1147 ;	./../../mib/stm8s_mib_vsprintf.c: 271: flags |= ZEROPAD;
      009514 04 0C            [ 1] 1148 	srl	(0x0c, sp)
      009516 99               [ 1] 1149 	scf
      009517 09 0C            [ 1] 1150 	rlc	(0x0c, sp)
      009519                       1151 00155$:
                                   1152 ;	./../../mib/stm8s_mib_vsprintf.c: 273: str = number(str, (MMULONG) va_arg(args, void *), 16, field_width, precision, flags);
      009519 1E 26            [ 2] 1153 	ldw	x, (0x26, sp)
      00951B 5C               [ 1] 1154 	incw	x
      00951C 5C               [ 1] 1155 	incw	x
      00951D 1F 26            [ 2] 1156 	ldw	(0x26, sp), x
      00951F 5A               [ 2] 1157 	decw	x
      009520 5A               [ 2] 1158 	decw	x
      009521 FE               [ 2] 1159 	ldw	x, (x)
      009522 1F 07            [ 2] 1160 	ldw	(0x07, sp), x
      009524 90 5F            [ 1] 1161 	clrw	y
      009526 1E 0B            [ 2] 1162 	ldw	x, (0x0b, sp)
      009528 89               [ 2] 1163 	pushw	x
      009529 1E 0B            [ 2] 1164 	ldw	x, (0x0b, sp)
      00952B 89               [ 2] 1165 	pushw	x
      00952C 1E 1C            [ 2] 1166 	ldw	x, (0x1c, sp)
      00952E 89               [ 2] 1167 	pushw	x
      00952F 1E 1C            [ 2] 1168 	ldw	x, (0x1c, sp)
      009531 89               [ 2] 1169 	pushw	x
      009532 1E 28            [ 2] 1170 	ldw	x, (0x28, sp)
      009534 89               [ 2] 1171 	pushw	x
      009535 1E 28            [ 2] 1172 	ldw	x, (0x28, sp)
      009537 89               [ 2] 1173 	pushw	x
      009538 4B 10            [ 1] 1174 	push	#0x10
      00953A 5F               [ 1] 1175 	clrw	x
      00953B 89               [ 2] 1176 	pushw	x
      00953C 4B 00            [ 1] 1177 	push	#0x00
      00953E 1E 17            [ 2] 1178 	ldw	x, (0x17, sp)
      009540 89               [ 2] 1179 	pushw	x
      009541 90 89            [ 2] 1180 	pushw	y
      009543 1E 30            [ 2] 1181 	ldw	x, (0x30, sp)
      009545 CD 8F 33         [ 4] 1182 	call	_number
      009548 1F 1C            [ 2] 1183 	ldw	(0x1c, sp), x
                                   1184 ;	./../../mib/stm8s_mib_vsprintf.c: 274: continue;
      00954A CC 96 53         [ 2] 1185 	jp	00179$
                                   1186 ;	./../../mib/stm8s_mib_vsprintf.c: 276: case 'n':
      00954D                       1187 00156$:
                                   1188 ;	./../../mib/stm8s_mib_vsprintf.c: 277: if (qualifier == 'l')
      00954D 1E 03            [ 2] 1189 	ldw	x, (0x03, sp)
      00954F A3 00 6C         [ 2] 1190 	cpw	x, #0x006c
      009552 26 24            [ 1] 1191 	jrne	00158$
      009554 1E 01            [ 2] 1192 	ldw	x, (0x01, sp)
      009556 26 20            [ 1] 1193 	jrne	00158$
                                   1194 ;	./../../mib/stm8s_mib_vsprintf.c: 279: MMLONG *ip = va_arg(args, MMLONG *);
      009558 1E 26            [ 2] 1195 	ldw	x, (0x26, sp)
      00955A 5C               [ 1] 1196 	incw	x
      00955B 5C               [ 1] 1197 	incw	x
      00955C 1F 26            [ 2] 1198 	ldw	(0x26, sp), x
      00955E 5A               [ 2] 1199 	decw	x
      00955F 5A               [ 2] 1200 	decw	x
      009560 FE               [ 2] 1201 	ldw	x, (x)
                                   1202 ;	./../../mib/stm8s_mib_vsprintf.c: 280: *ip = (str - buf);
      009561 16 1C            [ 2] 1203 	ldw	y, (0x1c, sp)
      009563 72 F2 1A         [ 2] 1204 	subw	y, (0x1a, sp)
      009566 90 9E            [ 1] 1205 	ld	a, yh
      009568 49               [ 1] 1206 	rlc	a
      009569 4F               [ 1] 1207 	clr	a
      00956A A2 00            [ 1] 1208 	sbc	a, #0x00
      00956C 6B 1F            [ 1] 1209 	ld	(0x1f, sp), a
      00956E 6B 1E            [ 1] 1210 	ld	(0x1e, sp), a
      009570 EF 02            [ 2] 1211 	ldw	(0x2, x), y
      009572 16 1E            [ 2] 1212 	ldw	y, (0x1e, sp)
      009574 FF               [ 2] 1213 	ldw	(x), y
      009575 CC 96 53         [ 2] 1214 	jp	00179$
      009578                       1215 00158$:
                                   1216 ;	./../../mib/stm8s_mib_vsprintf.c: 284: MMINT *ip = va_arg(args, MMINT *);
      009578 1E 26            [ 2] 1217 	ldw	x, (0x26, sp)
      00957A 5C               [ 1] 1218 	incw	x
      00957B 5C               [ 1] 1219 	incw	x
      00957C 1F 26            [ 2] 1220 	ldw	(0x26, sp), x
      00957E 5A               [ 2] 1221 	decw	x
      00957F 5A               [ 2] 1222 	decw	x
      009580 FE               [ 2] 1223 	ldw	x, (x)
                                   1224 ;	./../../mib/stm8s_mib_vsprintf.c: 285: *ip = (str - buf);
      009581 16 1C            [ 2] 1225 	ldw	y, (0x1c, sp)
      009583 72 F2 1A         [ 2] 1226 	subw	y, (0x1a, sp)
      009586 90 9E            [ 1] 1227 	ld	a, yh
      009588 49               [ 1] 1228 	rlc	a
      009589 4F               [ 1] 1229 	clr	a
      00958A A2 00            [ 1] 1230 	sbc	a, #0x00
      00958C 6B 1F            [ 1] 1231 	ld	(0x1f, sp), a
      00958E 6B 1E            [ 1] 1232 	ld	(0x1e, sp), a
      009590 EF 02            [ 2] 1233 	ldw	(0x2, x), y
      009592 16 1E            [ 2] 1234 	ldw	y, (0x1e, sp)
      009594 FF               [ 2] 1235 	ldw	(x), y
                                   1236 ;	./../../mib/stm8s_mib_vsprintf.c: 287: continue;
      009595 CC 96 53         [ 2] 1237 	jp	00179$
                                   1238 ;	./../../mib/stm8s_mib_vsprintf.c: 290: case 'o':
      009598                       1239 00160$:
                                   1240 ;	./../../mib/stm8s_mib_vsprintf.c: 291: base = 8;
      009598 AE 00 08         [ 2] 1241 	ldw	x, #0x0008
      00959B 1F 07            [ 2] 1242 	ldw	(0x07, sp), x
      00959D 5F               [ 1] 1243 	clrw	x
      00959E 1F 05            [ 2] 1244 	ldw	(0x05, sp), x
                                   1245 ;	./../../mib/stm8s_mib_vsprintf.c: 292: break;
      0095A0 20 3A            [ 2] 1246 	jra	00172$
                                   1247 ;	./../../mib/stm8s_mib_vsprintf.c: 294: case 'X':
      0095A2                       1248 00161$:
                                   1249 ;	./../../mib/stm8s_mib_vsprintf.c: 295: flags |= LARGE;
      0095A2 7B 0C            [ 1] 1250 	ld	a, (0x0c, sp)
      0095A4 AA 40            [ 1] 1251 	or	a, #0x40
      0095A6 6B 0C            [ 1] 1252 	ld	(0x0c, sp), a
                                   1253 ;	./../../mib/stm8s_mib_vsprintf.c: 297: case 'x':
      0095A8                       1254 00162$:
                                   1255 ;	./../../mib/stm8s_mib_vsprintf.c: 298: base = 16;
      0095A8 AE 00 10         [ 2] 1256 	ldw	x, #0x0010
      0095AB 1F 07            [ 2] 1257 	ldw	(0x07, sp), x
      0095AD 5F               [ 1] 1258 	clrw	x
      0095AE 1F 05            [ 2] 1259 	ldw	(0x05, sp), x
                                   1260 ;	./../../mib/stm8s_mib_vsprintf.c: 299: break;
      0095B0 20 2A            [ 2] 1261 	jra	00172$
                                   1262 ;	./../../mib/stm8s_mib_vsprintf.c: 302: case 'i':
      0095B2                       1263 00164$:
                                   1264 ;	./../../mib/stm8s_mib_vsprintf.c: 303: flags |= SIGN;
      0095B2 7B 0C            [ 1] 1265 	ld	a, (0x0c, sp)
      0095B4 AA 02            [ 1] 1266 	or	a, #0x02
      0095B6 6B 0C            [ 1] 1267 	ld	(0x0c, sp), a
                                   1268 ;	./../../mib/stm8s_mib_vsprintf.c: 306: break;
      0095B8 20 22            [ 2] 1269 	jra	00172$
                                   1270 ;	./../../mib/stm8s_mib_vsprintf.c: 308: default:
      0095BA                       1271 00166$:
                                   1272 ;	./../../mib/stm8s_mib_vsprintf.c: 309: if (*fmt != '%') *str++ = '%';
      0095BA A1 25            [ 1] 1273 	cp	a, #0x25
      0095BC 27 0A            [ 1] 1274 	jreq	00168$
      0095BE 1E 1C            [ 2] 1275 	ldw	x, (0x1c, sp)
      0095C0 A6 25            [ 1] 1276 	ld	a, #0x25
      0095C2 F7               [ 1] 1277 	ld	(x), a
      0095C3 1E 1C            [ 2] 1278 	ldw	x, (0x1c, sp)
      0095C5 5C               [ 1] 1279 	incw	x
      0095C6 1F 1C            [ 2] 1280 	ldw	(0x1c, sp), x
      0095C8                       1281 00168$:
                                   1282 ;	./../../mib/stm8s_mib_vsprintf.c: 310: if (*fmt)
      0095C8 1E 24            [ 2] 1283 	ldw	x, (0x24, sp)
      0095CA F6               [ 1] 1284 	ld	a, (x)
      0095CB 27 0A            [ 1] 1285 	jreq	00170$
                                   1286 ;	./../../mib/stm8s_mib_vsprintf.c: 311: *str++ = *fmt;
      0095CD 1E 1C            [ 2] 1287 	ldw	x, (0x1c, sp)
      0095CF F7               [ 1] 1288 	ld	(x), a
      0095D0 1E 1C            [ 2] 1289 	ldw	x, (0x1c, sp)
      0095D2 5C               [ 1] 1290 	incw	x
      0095D3 1F 1C            [ 2] 1291 	ldw	(0x1c, sp), x
      0095D5 20 7C            [ 2] 1292 	jra	00179$
      0095D7                       1293 00170$:
                                   1294 ;	./../../mib/stm8s_mib_vsprintf.c: 313: --fmt;
      0095D7 5A               [ 2] 1295 	decw	x
      0095D8 1F 24            [ 2] 1296 	ldw	(0x24, sp), x
                                   1297 ;	./../../mib/stm8s_mib_vsprintf.c: 314: continue;
      0095DA 20 77            [ 2] 1298 	jra	00179$
                                   1299 ;	./../../mib/stm8s_mib_vsprintf.c: 315: }
      0095DC                       1300 00172$:
                                   1301 ;	./../../mib/stm8s_mib_vsprintf.c: 317: if (qualifier == 'l')
      0095DC 1E 03            [ 2] 1302 	ldw	x, (0x03, sp)
      0095DE A3 00 6C         [ 2] 1303 	cpw	x, #0x006c
      0095E1 26 1A            [ 1] 1304 	jrne	00177$
      0095E3 1E 01            [ 2] 1305 	ldw	x, (0x01, sp)
      0095E5 26 16            [ 1] 1306 	jrne	00177$
                                   1307 ;	./../../mib/stm8s_mib_vsprintf.c: 318: num = va_arg(args, MMUINT); // MMULONG); // test ok..
      0095E7 1E 26            [ 2] 1308 	ldw	x, (0x26, sp)
      0095E9 1C 00 04         [ 2] 1309 	addw	x, #0x0004
      0095EC 1F 26            [ 2] 1310 	ldw	(0x26, sp), x
      0095EE 1D 00 04         [ 2] 1311 	subw	x, #0x0004
      0095F1 90 93            [ 1] 1312 	ldw	y, x
      0095F3 90 EE 02         [ 2] 1313 	ldw	y, (0x2, y)
      0095F6 FE               [ 2] 1314 	ldw	x, (x)
      0095F7 17 03            [ 2] 1315 	ldw	(0x03, sp), y
      0095F9 1F 01            [ 2] 1316 	ldw	(0x01, sp), x
      0095FB 20 2B            [ 2] 1317 	jra	00178$
      0095FD                       1318 00177$:
                                   1319 ;	./../../mib/stm8s_mib_vsprintf.c: 328: else if (flags & SIGN)
      0095FD 7B 0C            [ 1] 1320 	ld	a, (0x0c, sp)
      0095FF A5 02            [ 1] 1321 	bcp	a, #0x02
      009601 27 17            [ 1] 1322 	jreq	00174$
                                   1323 ;	./../../mib/stm8s_mib_vsprintf.c: 329: num = va_arg(args, MMAINT); // test ok...
      009603 1E 26            [ 2] 1324 	ldw	x, (0x26, sp)
      009605 5C               [ 1] 1325 	incw	x
      009606 5C               [ 1] 1326 	incw	x
      009607 1F 26            [ 2] 1327 	ldw	(0x26, sp), x
      009609 5A               [ 2] 1328 	decw	x
      00960A 5A               [ 2] 1329 	decw	x
      00960B FE               [ 2] 1330 	ldw	x, (x)
      00960C 1F 03            [ 2] 1331 	ldw	(0x03, sp), x
      00960E 7B 03            [ 1] 1332 	ld	a, (0x03, sp)
      009610 49               [ 1] 1333 	rlc	a
      009611 4F               [ 1] 1334 	clr	a
      009612 A2 00            [ 1] 1335 	sbc	a, #0x00
      009614 6B 02            [ 1] 1336 	ld	(0x02, sp), a
      009616 6B 01            [ 1] 1337 	ld	(0x01, sp), a
      009618 20 0E            [ 2] 1338 	jra	00178$
      00961A                       1339 00174$:
                                   1340 ;	./../../mib/stm8s_mib_vsprintf.c: 331: num = va_arg(args, MMAUINT);
      00961A 1E 26            [ 2] 1341 	ldw	x, (0x26, sp)
      00961C 5C               [ 1] 1342 	incw	x
      00961D 5C               [ 1] 1343 	incw	x
      00961E 1F 26            [ 2] 1344 	ldw	(0x26, sp), x
      009620 5A               [ 2] 1345 	decw	x
      009621 5A               [ 2] 1346 	decw	x
      009622 FE               [ 2] 1347 	ldw	x, (x)
      009623 1F 03            [ 2] 1348 	ldw	(0x03, sp), x
      009625 5F               [ 1] 1349 	clrw	x
      009626 1F 01            [ 2] 1350 	ldw	(0x01, sp), x
      009628                       1351 00178$:
                                   1352 ;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
      009628 1E 0B            [ 2] 1353 	ldw	x, (0x0b, sp)
      00962A 89               [ 2] 1354 	pushw	x
      00962B 1E 0B            [ 2] 1355 	ldw	x, (0x0b, sp)
      00962D 89               [ 2] 1356 	pushw	x
      00962E 1E 1C            [ 2] 1357 	ldw	x, (0x1c, sp)
      009630 89               [ 2] 1358 	pushw	x
      009631 1E 1C            [ 2] 1359 	ldw	x, (0x1c, sp)
      009633 89               [ 2] 1360 	pushw	x
      009634 1E 28            [ 2] 1361 	ldw	x, (0x28, sp)
      009636 89               [ 2] 1362 	pushw	x
      009637 1E 28            [ 2] 1363 	ldw	x, (0x28, sp)
      009639 89               [ 2] 1364 	pushw	x
      00963A 1E 13            [ 2] 1365 	ldw	x, (0x13, sp)
      00963C 89               [ 2] 1366 	pushw	x
      00963D 1E 13            [ 2] 1367 	ldw	x, (0x13, sp)
      00963F 89               [ 2] 1368 	pushw	x
      009640 1E 13            [ 2] 1369 	ldw	x, (0x13, sp)
      009642 89               [ 2] 1370 	pushw	x
      009643 1E 13            [ 2] 1371 	ldw	x, (0x13, sp)
      009645 89               [ 2] 1372 	pushw	x
      009646 1E 30            [ 2] 1373 	ldw	x, (0x30, sp)
      009648 CD 8F 33         [ 4] 1374 	call	_number
      00964B 1F 1C            [ 2] 1375 	ldw	(0x1c, sp), x
                                   1376 ;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
      00964D 20 04            [ 2] 1377 	jra	00179$
                                   1378 ;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
      00964F                       1379 00237$:
      00964F 16 18            [ 2] 1380 	ldw	y, (0x18, sp)
      009651 17 1C            [ 2] 1381 	ldw	(0x1c, sp), y
                                   1382 ;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
                                   1383 ;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
      009653                       1384 00240$:
      009653                       1385 00179$:
                                   1386 ;	./../../mib/stm8s_mib_vsprintf.c: 188: for (str = buf; *fmt; fmt++)
      009653 1E 24            [ 2] 1387 	ldw	x, (0x24, sp)
      009655 5C               [ 1] 1388 	incw	x
      009656 1F 24            [ 2] 1389 	ldw	(0x24, sp), x
      009658 CC 92 55         [ 2] 1390 	jp	00185$
      00965B                       1391 00180$:
                                   1392 ;	./../../mib/stm8s_mib_vsprintf.c: 336: *str = '\0';
      00965B 1E 1C            [ 2] 1393 	ldw	x, (0x1c, sp)
      00965D 7F               [ 1] 1394 	clr	(x)
                                   1395 ;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
      00965E 1E 1C            [ 2] 1396 	ldw	x, (0x1c, sp)
      009660 72 F0 1A         [ 2] 1397 	subw	x, (0x1a, sp)
                                   1398 ;	./../../mib/stm8s_mib_vsprintf.c: 338: }
      009663 16 22            [ 2] 1399 	ldw	y, (34, sp)
      009665 5B 27            [ 2] 1400 	addw	sp, #39
      009667 90 FC            [ 2] 1401 	jp	(y)
                                   1402 ;	./../../mib/stm8s_mib_vsprintf.c: 342: MMRINT mib_vsprintf(char *vpBuffer,char *format, ...)
                                   1403 ;	-----------------------------------------
                                   1404 ;	 function mib_vsprintf
                                   1405 ;	-----------------------------------------
      009669                       1406 _mib_vsprintf:
                                   1407 ;	./../../mib/stm8s_mib_vsprintf.c: 347: va_start(ap, format);
      009669 96               [ 1] 1408 	ldw	x, sp
      00966A 1C 00 07         [ 2] 1409 	addw	x, #7
                                   1410 ;	./../../mib/stm8s_mib_vsprintf.c: 348: rc = mm_vsprintf(vpBuffer, format, ap);
      00966D 89               [ 2] 1411 	pushw	x
      00966E 1E 07            [ 2] 1412 	ldw	x, (0x07, sp)
      009670 89               [ 2] 1413 	pushw	x
      009671 1E 07            [ 2] 1414 	ldw	x, (0x07, sp)
      009673 CD 92 35         [ 4] 1415 	call	_mm_vsprintf
                                   1416 ;	./../../mib/stm8s_mib_vsprintf.c: 351: return (rc);
                                   1417 ;	./../../mib/stm8s_mib_vsprintf.c: 352: }
      009676 81               [ 4] 1418 	ret
                                   1419 ;	./../../mib/stm8s_mib_vsprintf.c: 363: MMRINT mib_printf(char *format, ...)
                                   1420 ;	-----------------------------------------
                                   1421 ;	 function mib_printf
                                   1422 ;	-----------------------------------------
      009677                       1423 _mib_printf:
      009677 52 82            [ 2] 1424 	sub	sp, #130
                                   1425 ;	./../../mib/stm8s_mib_vsprintf.c: 370: va_start(ap, format);
                                   1426 ;	./../../mib/stm8s_mib_vsprintf.c: 371: rc = mm_vsprintf(buffer, format, ap);
      009679 96               [ 1] 1427 	ldw	x, sp
      00967A 1C 00 87         [ 2] 1428 	addw	x, #135
      00967D 89               [ 2] 1429 	pushw	x
      00967E 1E 87            [ 2] 1430 	ldw	x, (0x87, sp)
      009680 89               [ 2] 1431 	pushw	x
      009681 96               [ 1] 1432 	ldw	x, sp
      009682 1C 00 05         [ 2] 1433 	addw	x, #5
      009685 CD 92 35         [ 4] 1434 	call	_mm_vsprintf
      009688 1F 81            [ 2] 1435 	ldw	(0x81, sp), x
                                   1436 ;	./../../mib/stm8s_mib_vsprintf.c: 374: v_pString = (char *)buffer;
      00968A 96               [ 1] 1437 	ldw	x, sp
      00968B 5C               [ 1] 1438 	incw	x
                                   1439 ;	./../../mib/stm8s_mib_vsprintf.c: 375: while (*v_pString != 0)	MibWriteDebugByte((uint8_t)*v_pString++);
      00968C                       1440 00101$:
      00968C F6               [ 1] 1441 	ld	a, (x)
      00968D 27 08            [ 1] 1442 	jreq	00103$
      00968F 5C               [ 1] 1443 	incw	x
      009690 89               [ 2] 1444 	pushw	x
      009691 CD 8C 48         [ 4] 1445 	call	_MibWriteDebugByte
      009694 85               [ 2] 1446 	popw	x
      009695 20 F5            [ 2] 1447 	jra	00101$
      009697                       1448 00103$:
                                   1449 ;	./../../mib/stm8s_mib_vsprintf.c: 376: return (rc);
      009697 1E 81            [ 2] 1450 	ldw	x, (0x81, sp)
                                   1451 ;	./../../mib/stm8s_mib_vsprintf.c: 377: }
      009699 5B 82            [ 2] 1452 	addw	sp, #130
      00969B 81               [ 4] 1453 	ret
                                   1454 	.area CODE
                                   1455 	.area CONST
                                   1456 	.area CONST
      0082EC                       1457 ___str_1:
      0082EC 30 31 32 33 34 35 36  1458 	.ascii "0123456789abcdefghijklmnopqrstuvwxyz"
             37 38 39 61 62 63 64
             65 66 67 68 69 6A 6B
             6C 6D 6E 6F 70 71 72
             73 74 75 76 77 78 79
             7A
      008310 00                    1459 	.db 0x00
                                   1460 	.area CODE
                                   1461 	.area CONST
      008311                       1462 ___str_2:
      008311 30 31 32 33 34 35 36  1463 	.ascii "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
             37 38 39 41 42 43 44
             45 46 47 48 49 4A 4B
             4C 4D 4E 4F 50 51 52
             53 54 55 56 57 58 59
             5A
      008335 00                    1464 	.db 0x00
                                   1465 	.area CODE
                                   1466 	.area INITIALIZER
      0088F8                       1467 __xinit__digits:
      0088F8 82 EC                 1468 	.dw ___str_1
      0088FA                       1469 __xinit__upper_digits:
      0088FA 83 11                 1470 	.dw ___str_2
                                   1471 	.area CABS (ABS)
