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
      00A874                         60 _strnlen:
      00A874 52 06            [ 2]   61 	sub	sp, #6
      00A876 1F 03            [ 2]   62 	ldw	(0x03, sp), x
                                     63 ;	./../../mib/stm8s_mib_vsprintf.c: 74: for (sc = s; *sc != '\0' && count--; ++sc);
      00A878 16 09            [ 2]   64 	ldw	y, (0x09, sp)
      00A87A 17 05            [ 2]   65 	ldw	(0x05, sp), y
      00A87C 1E 03            [ 2]   66 	ldw	x, (0x03, sp)
      00A87E                         67 00104$:
      00A87E F6               [ 1]   68 	ld	a, (x)
      00A87F 27 11            [ 1]   69 	jreq	00101$
      00A881 16 05            [ 2]   70 	ldw	y, (0x05, sp)
      00A883 17 01            [ 2]   71 	ldw	(0x01, sp), y
      00A885 16 05            [ 2]   72 	ldw	y, (0x05, sp)
      00A887 90 5A            [ 2]   73 	decw	y
      00A889 17 05            [ 2]   74 	ldw	(0x05, sp), y
      00A88B 16 01            [ 2]   75 	ldw	y, (0x01, sp)
      00A88D 27 03            [ 1]   76 	jreq	00101$
      00A88F 5C               [ 1]   77 	incw	x
      00A890 20 EC            [ 2]   78 	jra	00104$
      00A892                         79 00101$:
                                     80 ;	./../../mib/stm8s_mib_vsprintf.c: 75: return sc - s;
      00A892 72 F0 03         [ 2]   81 	subw	x, (0x03, sp)
                                     82 ;	./../../mib/stm8s_mib_vsprintf.c: 76: }
      00A895 5B 06            [ 2]   83 	addw	sp, #6
      00A897 90 85            [ 2]   84 	popw	y
      00A899 5B 02            [ 2]   85 	addw	sp, #2
      00A89B 90 FC            [ 2]   86 	jp	(y)
                                     87 ;	./../../mib/stm8s_mib_vsprintf.c: 81: static MMINT skip_atoi(const char **s)
                                     88 ;	-----------------------------------------
                                     89 ;	 function skip_atoi
                                     90 ;	-----------------------------------------
      00A89D                         91 _skip_atoi:
      00A89D 52 08            [ 2]   92 	sub	sp, #8
      00A89F 1F 07            [ 2]   93 	ldw	(0x07, sp), x
                                     94 ;	./../../mib/stm8s_mib_vsprintf.c: 83: MMINT i = 0;
      00A8A1 5F               [ 1]   95 	clrw	x
      00A8A2 1F 05            [ 2]   96 	ldw	(0x05, sp), x
                                     97 ;	./../../mib/stm8s_mib_vsprintf.c: 84: while (is_digit(**s)) i = i*10 + *((*s)++) - '0';
      00A8A4                         98 00102$:
      00A8A4 16 07            [ 2]   99 	ldw	y, (0x07, sp)
      00A8A6 90 FE            [ 2]  100 	ldw	y, (y)
      00A8A8 17 01            [ 2]  101 	ldw	(0x01, sp), y
      00A8AA 90 F6            [ 1]  102 	ld	a, (y)
      00A8AC A1 30            [ 1]  103 	cp	a, #0x30
      00A8AE 25 41            [ 1]  104 	jrc	00104$
      00A8B0 A1 39            [ 1]  105 	cp	a, #0x39
      00A8B2 22 3D            [ 1]  106 	jrugt	00104$
      00A8B4 16 05            [ 2]  107 	ldw	y, (0x05, sp)
      00A8B6 90 89            [ 2]  108 	pushw	y
      00A8B8 89               [ 2]  109 	pushw	x
      00A8B9 4B 0A            [ 1]  110 	push	#0x0a
      00A8BB 5F               [ 1]  111 	clrw	x
      00A8BC 89               [ 2]  112 	pushw	x
      00A8BD 4B 00            [ 1]  113 	push	#0x00
      00A8BF CD C3 89         [ 4]  114 	call	__mullong
      00A8C2 5B 08            [ 2]  115 	addw	sp, #8
      00A8C4 1F 05            [ 2]  116 	ldw	(0x05, sp), x
      00A8C6 17 03            [ 2]  117 	ldw	(0x03, sp), y
      00A8C8 1E 01            [ 2]  118 	ldw	x, (0x01, sp)
      00A8CA 5C               [ 1]  119 	incw	x
      00A8CB 16 07            [ 2]  120 	ldw	y, (0x07, sp)
      00A8CD 90 FF            [ 2]  121 	ldw	(y), x
      00A8CF 1E 01            [ 2]  122 	ldw	x, (0x01, sp)
      00A8D1 F6               [ 1]  123 	ld	a, (x)
      00A8D2 90 5F            [ 1]  124 	clrw	y
      00A8D4 5F               [ 1]  125 	clrw	x
      00A8D5 90 5D            [ 2]  126 	tnzw	y
      00A8D7 2A 01            [ 1]  127 	jrpl	00124$
      00A8D9 5A               [ 2]  128 	decw	x
      00A8DA                        129 00124$:
      00A8DA 90 97            [ 1]  130 	ld	yl, a
      00A8DC 72 F9 05         [ 2]  131 	addw	y, (0x05, sp)
      00A8DF 9F               [ 1]  132 	ld	a, xl
      00A8E0 19 04            [ 1]  133 	adc	a, (0x04, sp)
      00A8E2 02               [ 1]  134 	rlwa	x
      00A8E3 19 03            [ 1]  135 	adc	a, (0x03, sp)
      00A8E5 95               [ 1]  136 	ld	xh, a
      00A8E6 72 A2 00 30      [ 2]  137 	subw	y, #0x0030
      00A8EA 17 05            [ 2]  138 	ldw	(0x05, sp), y
      00A8EC 24 B6            [ 1]  139 	jrnc	00102$
      00A8EE 5A               [ 2]  140 	decw	x
      00A8EF 20 B3            [ 2]  141 	jra	00102$
      00A8F1                        142 00104$:
                                    143 ;	./../../mib/stm8s_mib_vsprintf.c: 85: return i;
      00A8F1 51               [ 1]  144 	exgw	x, y
      00A8F2 1E 05            [ 2]  145 	ldw	x, (0x05, sp)
                                    146 ;	./../../mib/stm8s_mib_vsprintf.c: 86: }
      00A8F4 5B 08            [ 2]  147 	addw	sp, #8
      00A8F6 81               [ 4]  148 	ret
                                    149 ;	./../../mib/stm8s_mib_vsprintf.c: 91: static char *number(char *str, MMLONG num, MMINT base, MMINT size, MMINT precision, MMINT type)
                                    150 ;	-----------------------------------------
                                    151 ;	 function number
                                    152 ;	-----------------------------------------
      00A8F7                        153 _number:
      00A8F7 52 62            [ 2]  154 	sub	sp, #98
      00A8F9 1F 5D            [ 2]  155 	ldw	(0x5d, sp), x
                                    156 ;	./../../mib/stm8s_mib_vsprintf.c: 94: char *dig = digits;
      00A8FB CE 01 5A         [ 2]  157 	ldw	x, _digits+0
      00A8FE 1F 43            [ 2]  158 	ldw	(0x43, sp), x
                                    159 ;	./../../mib/stm8s_mib_vsprintf.c: 97: if (type & LARGE)  dig = upper_digits;
      00A900 7B 78            [ 1]  160 	ld	a, (0x78, sp)
      00A902 A5 40            [ 1]  161 	bcp	a, #0x40
      00A904 27 05            [ 1]  162 	jreq	00102$
      00A906 CE 01 5C         [ 2]  163 	ldw	x, _upper_digits+0
      00A909 1F 43            [ 2]  164 	ldw	(0x43, sp), x
      00A90B                        165 00102$:
                                    166 ;	./../../mib/stm8s_mib_vsprintf.c: 98: if (type & LEFT) type &= ~ZEROPAD;
      00A90B 7B 78            [ 1]  167 	ld	a, (0x78, sp)
      00A90D A5 10            [ 1]  168 	bcp	a, #0x10
      00A90F 27 0A            [ 1]  169 	jreq	00104$
      00A911 1E 77            [ 2]  170 	ldw	x, (0x77, sp)
      00A913 54               [ 2]  171 	srlw	x
      00A914 58               [ 2]  172 	sllw	x
      00A915 16 75            [ 2]  173 	ldw	y, (0x75, sp)
      00A917 1F 77            [ 2]  174 	ldw	(0x77, sp), x
      00A919 17 75            [ 2]  175 	ldw	(0x75, sp), y
      00A91B                        176 00104$:
                                    177 ;	./../../mib/stm8s_mib_vsprintf.c: 99: if (base < 2 || base > 36) return 0;
      00A91B 1E 6B            [ 2]  178 	ldw	x, (0x6b, sp)
      00A91D A3 00 02         [ 2]  179 	cpw	x, #0x0002
      00A920 7B 6A            [ 1]  180 	ld	a, (0x6a, sp)
      00A922 A2 00            [ 1]  181 	sbc	a, #0x00
      00A924 7B 69            [ 1]  182 	ld	a, (0x69, sp)
      00A926 A2 00            [ 1]  183 	sbc	a, #0x00
      00A928 2F 0D            [ 1]  184 	jrslt	00105$
      00A92A AE 00 24         [ 2]  185 	ldw	x, #0x0024
      00A92D 13 6B            [ 2]  186 	cpw	x, (0x6b, sp)
      00A92F 4F               [ 1]  187 	clr	a
      00A930 12 6A            [ 1]  188 	sbc	a, (0x6a, sp)
      00A932 4F               [ 1]  189 	clr	a
      00A933 12 69            [ 1]  190 	sbc	a, (0x69, sp)
      00A935 2E 04            [ 1]  191 	jrsge	00106$
      00A937                        192 00105$:
      00A937 5F               [ 1]  193 	clrw	x
      00A938 CC AB F3         [ 2]  194 	jp	00161$
      00A93B                        195 00106$:
                                    196 ;	./../../mib/stm8s_mib_vsprintf.c: 101: c = (type & ZEROPAD) ? '0' : ' ';
      00A93B 7B 78            [ 1]  197 	ld	a, (0x78, sp)
      00A93D 44               [ 1]  198 	srl	a
      00A93E 24 03            [ 1]  199 	jrnc	00163$
      00A940 A6 30            [ 1]  200 	ld	a, #0x30
      00A942 C5                     201 	.byte 0xc5
      00A943                        202 00163$:
      00A943 A6 20            [ 1]  203 	ld	a, #0x20
      00A945                        204 00164$:
      00A945 6B 45            [ 1]  205 	ld	(0x45, sp), a
                                    206 ;	./../../mib/stm8s_mib_vsprintf.c: 102: sign = 0;
      00A947 0F 46            [ 1]  207 	clr	(0x46, sp)
                                    208 ;	./../../mib/stm8s_mib_vsprintf.c: 103: if (type & SIGN)
      00A949 7B 78            [ 1]  209 	ld	a, (0x78, sp)
      00A94B A5 02            [ 1]  210 	bcp	a, #0x02
      00A94D 27 52            [ 1]  211 	jreq	00117$
                                    212 ;	./../../mib/stm8s_mib_vsprintf.c: 109: size--;
      00A94F 16 6F            [ 2]  213 	ldw	y, (0x6f, sp)
      00A951 72 A2 00 01      [ 2]  214 	subw	y, #0x0001
      00A955 1E 6D            [ 2]  215 	ldw	x, (0x6d, sp)
      00A957 24 01            [ 1]  216 	jrnc	00330$
      00A959 5A               [ 2]  217 	decw	x
      00A95A                        218 00330$:
      00A95A 1F 57            [ 2]  219 	ldw	(0x57, sp), x
                                    220 ;	./../../mib/stm8s_mib_vsprintf.c: 105: if (num < 0)
      00A95C 0D 65            [ 1]  221 	tnz	(0x65, sp)
      00A95E 2A 1F            [ 1]  222 	jrpl	00114$
                                    223 ;	./../../mib/stm8s_mib_vsprintf.c: 107: sign = '-';
      00A960 A6 2D            [ 1]  224 	ld	a, #0x2d
      00A962 6B 46            [ 1]  225 	ld	(0x46, sp), a
                                    226 ;	./../../mib/stm8s_mib_vsprintf.c: 108: num = -num;
      00A964 1E 67            [ 2]  227 	ldw	x, (0x67, sp)
      00A966 50               [ 2]  228 	negw	x
      00A967 4F               [ 1]  229 	clr	a
      00A968 12 66            [ 1]  230 	sbc	a, (0x66, sp)
      00A96A 6B 60            [ 1]  231 	ld	(0x60, sp), a
      00A96C 4F               [ 1]  232 	clr	a
      00A96D 12 65            [ 1]  233 	sbc	a, (0x65, sp)
      00A96F 1F 67            [ 2]  234 	ldw	(0x67, sp), x
      00A971 6B 65            [ 1]  235 	ld	(0x65, sp), a
      00A973 7B 60            [ 1]  236 	ld	a, (0x60, sp)
      00A975 6B 66            [ 1]  237 	ld	(0x66, sp), a
                                    238 ;	./../../mib/stm8s_mib_vsprintf.c: 109: size--;
      00A977 17 6F            [ 2]  239 	ldw	(0x6f, sp), y
      00A979 16 57            [ 2]  240 	ldw	y, (0x57, sp)
      00A97B 17 6D            [ 2]  241 	ldw	(0x6d, sp), y
      00A97D 20 22            [ 2]  242 	jra	00117$
      00A97F                        243 00114$:
                                    244 ;	./../../mib/stm8s_mib_vsprintf.c: 111: else if (type & PLUS)
      00A97F 7B 78            [ 1]  245 	ld	a, (0x78, sp)
      00A981 A5 04            [ 1]  246 	bcp	a, #0x04
      00A983 27 0C            [ 1]  247 	jreq	00111$
                                    248 ;	./../../mib/stm8s_mib_vsprintf.c: 113: sign = '+';
      00A985 A6 2B            [ 1]  249 	ld	a, #0x2b
      00A987 6B 46            [ 1]  250 	ld	(0x46, sp), a
                                    251 ;	./../../mib/stm8s_mib_vsprintf.c: 114: size--;
      00A989 17 6F            [ 2]  252 	ldw	(0x6f, sp), y
      00A98B 16 57            [ 2]  253 	ldw	y, (0x57, sp)
      00A98D 17 6D            [ 2]  254 	ldw	(0x6d, sp), y
      00A98F 20 10            [ 2]  255 	jra	00117$
      00A991                        256 00111$:
                                    257 ;	./../../mib/stm8s_mib_vsprintf.c: 116: else if (type & SPACE)
      00A991 7B 78            [ 1]  258 	ld	a, (0x78, sp)
      00A993 A5 08            [ 1]  259 	bcp	a, #0x08
      00A995 27 0A            [ 1]  260 	jreq	00117$
                                    261 ;	./../../mib/stm8s_mib_vsprintf.c: 118: sign = ' ';
      00A997 A6 20            [ 1]  262 	ld	a, #0x20
      00A999 6B 46            [ 1]  263 	ld	(0x46, sp), a
                                    264 ;	./../../mib/stm8s_mib_vsprintf.c: 119: size--;
      00A99B 17 6F            [ 2]  265 	ldw	(0x6f, sp), y
      00A99D 16 57            [ 2]  266 	ldw	y, (0x57, sp)
      00A99F 17 6D            [ 2]  267 	ldw	(0x6d, sp), y
      00A9A1                        268 00117$:
                                    269 ;	./../../mib/stm8s_mib_vsprintf.c: 123: if (type & SPECIAL)
      00A9A1 7B 78            [ 1]  270 	ld	a, (0x78, sp)
      00A9A3 A4 20            [ 1]  271 	and	a, #0x20
      00A9A5 6B 4A            [ 1]  272 	ld	(0x4a, sp), a
      00A9A7 5F               [ 1]  273 	clrw	x
      00A9A8 1F 48            [ 2]  274 	ldw	(0x48, sp), x
      00A9AA 0F 47            [ 1]  275 	clr	(0x47, sp)
                                    276 ;	./../../mib/stm8s_mib_vsprintf.c: 125: if (base == 16)
      00A9AC 1E 6B            [ 2]  277 	ldw	x, (0x6b, sp)
      00A9AE A3 00 10         [ 2]  278 	cpw	x, #0x0010
      00A9B1 26 09            [ 1]  279 	jrne	00335$
      00A9B3 1E 69            [ 2]  280 	ldw	x, (0x69, sp)
      00A9B5 26 05            [ 1]  281 	jrne	00335$
      00A9B7 A6 01            [ 1]  282 	ld	a, #0x01
      00A9B9 6B 4B            [ 1]  283 	ld	(0x4b, sp), a
      00A9BB C5                     284 	.byte 0xc5
      00A9BC                        285 00335$:
      00A9BC 0F 4B            [ 1]  286 	clr	(0x4b, sp)
      00A9BE                        287 00336$:
                                    288 ;	./../../mib/stm8s_mib_vsprintf.c: 127: else if (base == 8)
      00A9BE 1E 6B            [ 2]  289 	ldw	x, (0x6b, sp)
      00A9C0 A3 00 08         [ 2]  290 	cpw	x, #0x0008
      00A9C3 26 09            [ 1]  291 	jrne	00338$
      00A9C5 1E 69            [ 2]  292 	ldw	x, (0x69, sp)
      00A9C7 26 05            [ 1]  293 	jrne	00338$
      00A9C9 A6 01            [ 1]  294 	ld	a, #0x01
      00A9CB 6B 4C            [ 1]  295 	ld	(0x4c, sp), a
      00A9CD C5                     296 	.byte 0xc5
      00A9CE                        297 00338$:
      00A9CE 0F 4C            [ 1]  298 	clr	(0x4c, sp)
      00A9D0                        299 00339$:
                                    300 ;	./../../mib/stm8s_mib_vsprintf.c: 123: if (type & SPECIAL)
      00A9D0 1E 49            [ 2]  301 	ldw	x, (0x49, sp)
      00A9D2 26 04            [ 1]  302 	jrne	00340$
      00A9D4 1E 47            [ 2]  303 	ldw	x, (0x47, sp)
      00A9D6 27 28            [ 1]  304 	jreq	00124$
      00A9D8                        305 00340$:
                                    306 ;	./../../mib/stm8s_mib_vsprintf.c: 125: if (base == 16)
      00A9D8 0D 4B            [ 1]  307 	tnz	(0x4b, sp)
      00A9DA 27 11            [ 1]  308 	jreq	00121$
                                    309 ;	./../../mib/stm8s_mib_vsprintf.c: 126: size -= 2;
      00A9DC 1E 6F            [ 2]  310 	ldw	x, (0x6f, sp)
      00A9DE 1D 00 02         [ 2]  311 	subw	x, #0x0002
      00A9E1 16 6D            [ 2]  312 	ldw	y, (0x6d, sp)
      00A9E3 24 02            [ 1]  313 	jrnc	00342$
      00A9E5 90 5A            [ 2]  314 	decw	y
      00A9E7                        315 00342$:
      00A9E7 1F 6F            [ 2]  316 	ldw	(0x6f, sp), x
      00A9E9 17 6D            [ 2]  317 	ldw	(0x6d, sp), y
      00A9EB 20 13            [ 2]  318 	jra	00124$
      00A9ED                        319 00121$:
                                    320 ;	./../../mib/stm8s_mib_vsprintf.c: 127: else if (base == 8)
      00A9ED 0D 4C            [ 1]  321 	tnz	(0x4c, sp)
      00A9EF 27 0F            [ 1]  322 	jreq	00124$
                                    323 ;	./../../mib/stm8s_mib_vsprintf.c: 128: size--;
      00A9F1 1E 6F            [ 2]  324 	ldw	x, (0x6f, sp)
      00A9F3 1D 00 01         [ 2]  325 	subw	x, #0x0001
      00A9F6 16 6D            [ 2]  326 	ldw	y, (0x6d, sp)
      00A9F8 24 02            [ 1]  327 	jrnc	00344$
      00A9FA 90 5A            [ 2]  328 	decw	y
      00A9FC                        329 00344$:
      00A9FC 1F 6F            [ 2]  330 	ldw	(0x6f, sp), x
      00A9FE 17 6D            [ 2]  331 	ldw	(0x6d, sp), y
      00AA00                        332 00124$:
                                    333 ;	./../../mib/stm8s_mib_vsprintf.c: 133: if (num == 0)
      00AA00 1E 67            [ 2]  334 	ldw	x, (0x67, sp)
      00AA02 26 10            [ 1]  335 	jrne	00178$
                                    336 ;	./../../mib/stm8s_mib_vsprintf.c: 134: tmp[i++] = '0';
      00AA04 1E 65            [ 2]  337 	ldw	x, (0x65, sp)
      00AA06 26 0C            [ 1]  338 	jrne	00178$
      00AA08 5C               [ 1]  339 	incw	x
      00AA09 1F 59            [ 2]  340 	ldw	(0x59, sp), x
      00AA0B 5F               [ 1]  341 	clrw	x
      00AA0C 1F 57            [ 2]  342 	ldw	(0x57, sp), x
      00AA0E A6 30            [ 1]  343 	ld	a, #0x30
      00AA10 6B 01            [ 1]  344 	ld	(0x01, sp), a
      00AA12 20 70            [ 2]  345 	jra	00130$
                                    346 ;	./../../mib/stm8s_mib_vsprintf.c: 137: while (num != 0)
      00AA14                        347 00178$:
      00AA14 5F               [ 1]  348 	clrw	x
      00AA15 1F 61            [ 2]  349 	ldw	(0x61, sp), x
      00AA17 1F 5F            [ 2]  350 	ldw	(0x5f, sp), x
      00AA19                        351 00125$:
      00AA19 1E 67            [ 2]  352 	ldw	x, (0x67, sp)
      00AA1B 26 04            [ 1]  353 	jrne	00347$
      00AA1D 1E 65            [ 2]  354 	ldw	x, (0x65, sp)
      00AA1F 27 5B            [ 1]  355 	jreq	00194$
      00AA21                        356 00347$:
                                    357 ;	./../../mib/stm8s_mib_vsprintf.c: 139: tmp[i++] = dig[((MMULONG) num) % (MMUSIGN) base];
      00AA21 16 61            [ 2]  358 	ldw	y, (0x61, sp)
      00AA23 17 59            [ 2]  359 	ldw	(0x59, sp), y
      00AA25 16 5F            [ 2]  360 	ldw	y, (0x5f, sp)
      00AA27 17 57            [ 2]  361 	ldw	(0x57, sp), y
      00AA29 1E 61            [ 2]  362 	ldw	x, (0x61, sp)
      00AA2B 5C               [ 1]  363 	incw	x
      00AA2C 1F 61            [ 2]  364 	ldw	(0x61, sp), x
      00AA2E 26 05            [ 1]  365 	jrne	00348$
      00AA30 1E 5F            [ 2]  366 	ldw	x, (0x5f, sp)
      00AA32 5C               [ 1]  367 	incw	x
      00AA33 1F 5F            [ 2]  368 	ldw	(0x5f, sp), x
      00AA35                        369 00348$:
      00AA35 96               [ 1]  370 	ldw	x, sp
      00AA36 5C               [ 1]  371 	incw	x
      00AA37 72 FB 59         [ 2]  372 	addw	x, (0x59, sp)
      00AA3A 1F 4D            [ 2]  373 	ldw	(0x4d, sp), x
      00AA3C 16 65            [ 2]  374 	ldw	y, (0x65, sp)
      00AA3E 17 4F            [ 2]  375 	ldw	(0x4f, sp), y
      00AA40 16 67            [ 2]  376 	ldw	y, (0x67, sp)
      00AA42 1E 6B            [ 2]  377 	ldw	x, (0x6b, sp)
      00AA44 1F 55            [ 2]  378 	ldw	(0x55, sp), x
      00AA46 5F               [ 1]  379 	clrw	x
      00AA47 1F 53            [ 2]  380 	ldw	(0x53, sp), x
      00AA49 90 89            [ 2]  381 	pushw	y
      00AA4B 1E 57            [ 2]  382 	ldw	x, (0x57, sp)
      00AA4D 89               [ 2]  383 	pushw	x
      00AA4E 1E 57            [ 2]  384 	ldw	x, (0x57, sp)
      00AA50 89               [ 2]  385 	pushw	x
      00AA51 90 89            [ 2]  386 	pushw	y
      00AA53 1E 57            [ 2]  387 	ldw	x, (0x57, sp)
      00AA55 89               [ 2]  388 	pushw	x
      00AA56 CD C1 A7         [ 4]  389 	call	__modulong
      00AA59 5B 08            [ 2]  390 	addw	sp, #8
      00AA5B 17 59            [ 2]  391 	ldw	(0x59, sp), y
      00AA5D 90 85            [ 2]  392 	popw	y
      00AA5F 72 FB 43         [ 2]  393 	addw	x, (0x43, sp)
      00AA62 F6               [ 1]  394 	ld	a, (x)
      00AA63 1E 4D            [ 2]  395 	ldw	x, (0x4d, sp)
      00AA65 F7               [ 1]  396 	ld	(x), a
                                    397 ;	./../../mib/stm8s_mib_vsprintf.c: 140: num = ((MMULONG) num) / (MMUSIGN) base;
      00AA66 1E 55            [ 2]  398 	ldw	x, (0x55, sp)
      00AA68 89               [ 2]  399 	pushw	x
      00AA69 1E 55            [ 2]  400 	ldw	x, (0x55, sp)
      00AA6B 89               [ 2]  401 	pushw	x
      00AA6C 90 89            [ 2]  402 	pushw	y
      00AA6E 1E 55            [ 2]  403 	ldw	x, (0x55, sp)
      00AA70 89               [ 2]  404 	pushw	x
      00AA71 CD C2 57         [ 4]  405 	call	__divulong
      00AA74 5B 08            [ 2]  406 	addw	sp, #8
      00AA76 1F 67            [ 2]  407 	ldw	(0x67, sp), x
      00AA78 17 65            [ 2]  408 	ldw	(0x65, sp), y
      00AA7A 20 9D            [ 2]  409 	jra	00125$
      00AA7C                        410 00194$:
      00AA7C 16 61            [ 2]  411 	ldw	y, (0x61, sp)
      00AA7E 17 59            [ 2]  412 	ldw	(0x59, sp), y
      00AA80 16 5F            [ 2]  413 	ldw	y, (0x5f, sp)
      00AA82 17 57            [ 2]  414 	ldw	(0x57, sp), y
      00AA84                        415 00130$:
                                    416 ;	./../../mib/stm8s_mib_vsprintf.c: 144: if (i > precision) precision = i;
      00AA84 1E 73            [ 2]  417 	ldw	x, (0x73, sp)
      00AA86 13 59            [ 2]  418 	cpw	x, (0x59, sp)
      00AA88 7B 72            [ 1]  419 	ld	a, (0x72, sp)
      00AA8A 12 58            [ 1]  420 	sbc	a, (0x58, sp)
      00AA8C 7B 71            [ 1]  421 	ld	a, (0x71, sp)
      00AA8E 12 57            [ 1]  422 	sbc	a, (0x57, sp)
      00AA90 2E 08            [ 1]  423 	jrsge	00132$
      00AA92 16 59            [ 2]  424 	ldw	y, (0x59, sp)
      00AA94 17 73            [ 2]  425 	ldw	(0x73, sp), y
      00AA96 16 57            [ 2]  426 	ldw	y, (0x57, sp)
      00AA98 17 71            [ 2]  427 	ldw	(0x71, sp), y
      00AA9A                        428 00132$:
                                    429 ;	./../../mib/stm8s_mib_vsprintf.c: 145: size -= precision;
      00AA9A 16 6F            [ 2]  430 	ldw	y, (0x6f, sp)
      00AA9C 72 F2 73         [ 2]  431 	subw	y, (0x73, sp)
      00AA9F 7B 6E            [ 1]  432 	ld	a, (0x6e, sp)
      00AAA1 12 72            [ 1]  433 	sbc	a, (0x72, sp)
      00AAA3 97               [ 1]  434 	ld	xl, a
      00AAA4 7B 6D            [ 1]  435 	ld	a, (0x6d, sp)
      00AAA6 12 71            [ 1]  436 	sbc	a, (0x71, sp)
      00AAA8 95               [ 1]  437 	ld	xh, a
      00AAA9 17 6F            [ 2]  438 	ldw	(0x6f, sp), y
      00AAAB 1F 6D            [ 2]  439 	ldw	(0x6d, sp), x
                                    440 ;	./../../mib/stm8s_mib_vsprintf.c: 146: if (!(type & (ZEROPAD | LEFT))) while (size-- > 0) *str++ = ' ';
      00AAAD 7B 78            [ 1]  441 	ld	a, (0x78, sp)
      00AAAF A5 11            [ 1]  442 	bcp	a, #0x11
      00AAB1 26 34            [ 1]  443 	jrne	00137$
      00AAB3 16 6F            [ 2]  444 	ldw	y, (0x6f, sp)
      00AAB5 17 61            [ 2]  445 	ldw	(0x61, sp), y
      00AAB7 16 6D            [ 2]  446 	ldw	y, (0x6d, sp)
      00AAB9                        447 00133$:
      00AAB9 17 53            [ 2]  448 	ldw	(0x53, sp), y
      00AABB 1E 61            [ 2]  449 	ldw	x, (0x61, sp)
      00AABD 1F 55            [ 2]  450 	ldw	(0x55, sp), x
      00AABF 1E 61            [ 2]  451 	ldw	x, (0x61, sp)
      00AAC1 1D 00 01         [ 2]  452 	subw	x, #0x0001
      00AAC4 1F 61            [ 2]  453 	ldw	(0x61, sp), x
      00AAC6 24 02            [ 1]  454 	jrnc	00351$
      00AAC8 90 5A            [ 2]  455 	decw	y
      00AACA                        456 00351$:
      00AACA 5F               [ 1]  457 	clrw	x
      00AACB 13 55            [ 2]  458 	cpw	x, (0x55, sp)
      00AACD 4F               [ 1]  459 	clr	a
      00AACE 12 54            [ 1]  460 	sbc	a, (0x54, sp)
      00AAD0 4F               [ 1]  461 	clr	a
      00AAD1 12 53            [ 1]  462 	sbc	a, (0x53, sp)
      00AAD3 2E 0C            [ 1]  463 	jrsge	00195$
      00AAD5 1E 5D            [ 2]  464 	ldw	x, (0x5d, sp)
      00AAD7 A6 20            [ 1]  465 	ld	a, #0x20
      00AAD9 F7               [ 1]  466 	ld	(x), a
      00AADA 1E 5D            [ 2]  467 	ldw	x, (0x5d, sp)
      00AADC 5C               [ 1]  468 	incw	x
      00AADD 1F 5D            [ 2]  469 	ldw	(0x5d, sp), x
      00AADF 20 D8            [ 2]  470 	jra	00133$
      00AAE1                        471 00195$:
      00AAE1 17 6D            [ 2]  472 	ldw	(0x6d, sp), y
      00AAE3 16 61            [ 2]  473 	ldw	y, (0x61, sp)
      00AAE5 17 6F            [ 2]  474 	ldw	(0x6f, sp), y
      00AAE7                        475 00137$:
                                    476 ;	./../../mib/stm8s_mib_vsprintf.c: 147: if (sign) *str++ = sign;
      00AAE7 0D 46            [ 1]  477 	tnz	(0x46, sp)
      00AAE9 27 0A            [ 1]  478 	jreq	00139$
      00AAEB 1E 5D            [ 2]  479 	ldw	x, (0x5d, sp)
      00AAED 7B 46            [ 1]  480 	ld	a, (0x46, sp)
      00AAEF F7               [ 1]  481 	ld	(x), a
      00AAF0 1E 5D            [ 2]  482 	ldw	x, (0x5d, sp)
      00AAF2 5C               [ 1]  483 	incw	x
      00AAF3 1F 5D            [ 2]  484 	ldw	(0x5d, sp), x
      00AAF5                        485 00139$:
                                    486 ;	./../../mib/stm8s_mib_vsprintf.c: 149: if (type & SPECIAL)
      00AAF5 1E 49            [ 2]  487 	ldw	x, (0x49, sp)
      00AAF7 26 04            [ 1]  488 	jrne	00356$
      00AAF9 1E 47            [ 2]  489 	ldw	x, (0x47, sp)
      00AAFB 27 26            [ 1]  490 	jreq	00146$
      00AAFD                        491 00356$:
                                    492 ;	./../../mib/stm8s_mib_vsprintf.c: 147: if (sign) *str++ = sign;
      00AAFD 1E 5D            [ 2]  493 	ldw	x, (0x5d, sp)
      00AAFF 5C               [ 1]  494 	incw	x
                                    495 ;	./../../mib/stm8s_mib_vsprintf.c: 151: if (base == 8)
      00AB00 0D 4C            [ 1]  496 	tnz	(0x4c, sp)
      00AB02 27 0A            [ 1]  497 	jreq	00143$
                                    498 ;	./../../mib/stm8s_mib_vsprintf.c: 152: *str++ = '0';
      00AB04 16 5D            [ 2]  499 	ldw	y, (0x5d, sp)
      00AB06 A6 30            [ 1]  500 	ld	a, #0x30
      00AB08 90 F7            [ 1]  501 	ld	(y), a
      00AB0A 1F 5D            [ 2]  502 	ldw	(0x5d, sp), x
      00AB0C 20 15            [ 2]  503 	jra	00146$
      00AB0E                        504 00143$:
                                    505 ;	./../../mib/stm8s_mib_vsprintf.c: 153: else if (base == 16)
      00AB0E 0D 4B            [ 1]  506 	tnz	(0x4b, sp)
      00AB10 27 11            [ 1]  507 	jreq	00146$
                                    508 ;	./../../mib/stm8s_mib_vsprintf.c: 155: *str++ = '0';
      00AB12 16 5D            [ 2]  509 	ldw	y, (0x5d, sp)
      00AB14 A6 30            [ 1]  510 	ld	a, #0x30
      00AB16 90 F7            [ 1]  511 	ld	(y), a
                                    512 ;	./../../mib/stm8s_mib_vsprintf.c: 156: *str++ = digits[33];
      00AB18 90 CE 01 5A      [ 2]  513 	ldw	y, _digits+0
      00AB1C 90 E6 21         [ 1]  514 	ld	a, (0x21, y)
      00AB1F F7               [ 1]  515 	ld	(x), a
      00AB20 5C               [ 1]  516 	incw	x
      00AB21 1F 5D            [ 2]  517 	ldw	(0x5d, sp), x
      00AB23                        518 00146$:
                                    519 ;	./../../mib/stm8s_mib_vsprintf.c: 160: if (!(type & LEFT)) while (size-- > 0) *str++ = c;
      00AB23 7B 78            [ 1]  520 	ld	a, (0x78, sp)
      00AB25 A5 10            [ 1]  521 	bcp	a, #0x10
      00AB27 26 3D            [ 1]  522 	jrne	00189$
      00AB29 16 6F            [ 2]  523 	ldw	y, (0x6f, sp)
      00AB2B 17 61            [ 2]  524 	ldw	(0x61, sp), y
      00AB2D 16 6D            [ 2]  525 	ldw	y, (0x6d, sp)
      00AB2F 17 5F            [ 2]  526 	ldw	(0x5f, sp), y
      00AB31                        527 00147$:
      00AB31 16 61            [ 2]  528 	ldw	y, (0x61, sp)
      00AB33 17 55            [ 2]  529 	ldw	(0x55, sp), y
      00AB35 16 5F            [ 2]  530 	ldw	y, (0x5f, sp)
      00AB37 17 53            [ 2]  531 	ldw	(0x53, sp), y
      00AB39 1E 61            [ 2]  532 	ldw	x, (0x61, sp)
      00AB3B 1D 00 01         [ 2]  533 	subw	x, #0x0001
      00AB3E 1F 61            [ 2]  534 	ldw	(0x61, sp), x
      00AB40 1E 5F            [ 2]  535 	ldw	x, (0x5f, sp)
      00AB42 24 01            [ 1]  536 	jrnc	00360$
      00AB44 5A               [ 2]  537 	decw	x
      00AB45                        538 00360$:
      00AB45 1F 5F            [ 2]  539 	ldw	(0x5f, sp), x
      00AB47 5F               [ 1]  540 	clrw	x
      00AB48 13 55            [ 2]  541 	cpw	x, (0x55, sp)
      00AB4A 4F               [ 1]  542 	clr	a
      00AB4B 12 54            [ 1]  543 	sbc	a, (0x54, sp)
      00AB4D 4F               [ 1]  544 	clr	a
      00AB4E 12 53            [ 1]  545 	sbc	a, (0x53, sp)
      00AB50 2E 0C            [ 1]  546 	jrsge	00196$
      00AB52 1E 5D            [ 2]  547 	ldw	x, (0x5d, sp)
      00AB54 7B 45            [ 1]  548 	ld	a, (0x45, sp)
      00AB56 F7               [ 1]  549 	ld	(x), a
      00AB57 1E 5D            [ 2]  550 	ldw	x, (0x5d, sp)
      00AB59 5C               [ 1]  551 	incw	x
      00AB5A 1F 5D            [ 2]  552 	ldw	(0x5d, sp), x
      00AB5C 20 D3            [ 2]  553 	jra	00147$
                                    554 ;	./../../mib/stm8s_mib_vsprintf.c: 161: while (i < precision--) *str++ = '0';
      00AB5E                        555 00196$:
      00AB5E 16 61            [ 2]  556 	ldw	y, (0x61, sp)
      00AB60 17 6F            [ 2]  557 	ldw	(0x6f, sp), y
      00AB62 16 5F            [ 2]  558 	ldw	y, (0x5f, sp)
      00AB64 17 6D            [ 2]  559 	ldw	(0x6d, sp), y
      00AB66                        560 00189$:
      00AB66 16 5D            [ 2]  561 	ldw	y, (0x5d, sp)
      00AB68 1E 73            [ 2]  562 	ldw	x, (0x73, sp)
      00AB6A 1F 61            [ 2]  563 	ldw	(0x61, sp), x
      00AB6C 1E 71            [ 2]  564 	ldw	x, (0x71, sp)
      00AB6E 1F 5F            [ 2]  565 	ldw	(0x5f, sp), x
      00AB70                        566 00152$:
      00AB70 1E 59            [ 2]  567 	ldw	x, (0x59, sp)
      00AB72 13 61            [ 2]  568 	cpw	x, (0x61, sp)
      00AB74 7B 58            [ 1]  569 	ld	a, (0x58, sp)
      00AB76 12 60            [ 1]  570 	sbc	a, (0x60, sp)
      00AB78 7B 57            [ 1]  571 	ld	a, (0x57, sp)
      00AB7A 12 5F            [ 1]  572 	sbc	a, (0x5f, sp)
      00AB7C 2E 16            [ 1]  573 	jrsge	00191$
      00AB7E 1E 61            [ 2]  574 	ldw	x, (0x61, sp)
      00AB80 1D 00 01         [ 2]  575 	subw	x, #0x0001
      00AB83 1F 61            [ 2]  576 	ldw	(0x61, sp), x
      00AB85 1E 5F            [ 2]  577 	ldw	x, (0x5f, sp)
      00AB87 24 01            [ 1]  578 	jrnc	00364$
      00AB89 5A               [ 2]  579 	decw	x
      00AB8A                        580 00364$:
      00AB8A 1F 5F            [ 2]  581 	ldw	(0x5f, sp), x
      00AB8C A6 30            [ 1]  582 	ld	a, #0x30
      00AB8E 90 F7            [ 1]  583 	ld	(y), a
      00AB90 90 5C            [ 1]  584 	incw	y
      00AB92 20 DC            [ 2]  585 	jra	00152$
                                    586 ;	./../../mib/stm8s_mib_vsprintf.c: 162: while (i-- > 0) *str++ = tmp[i];
      00AB94                        587 00191$:
      00AB94 17 5B            [ 2]  588 	ldw	(0x5b, sp), y
      00AB96 16 59            [ 2]  589 	ldw	y, (0x59, sp)
      00AB98 17 61            [ 2]  590 	ldw	(0x61, sp), y
      00AB9A 16 57            [ 2]  591 	ldw	y, (0x57, sp)
      00AB9C 17 5F            [ 2]  592 	ldw	(0x5f, sp), y
      00AB9E                        593 00155$:
      00AB9E 5F               [ 1]  594 	clrw	x
      00AB9F 13 61            [ 2]  595 	cpw	x, (0x61, sp)
      00ABA1 4F               [ 1]  596 	clr	a
      00ABA2 12 60            [ 1]  597 	sbc	a, (0x60, sp)
      00ABA4 4F               [ 1]  598 	clr	a
      00ABA5 12 5F            [ 1]  599 	sbc	a, (0x5f, sp)
      00ABA7 2E 1E            [ 1]  600 	jrsge	00193$
      00ABA9 1E 61            [ 2]  601 	ldw	x, (0x61, sp)
      00ABAB 1D 00 01         [ 2]  602 	subw	x, #0x0001
      00ABAE 1F 61            [ 2]  603 	ldw	(0x61, sp), x
      00ABB0 1E 5F            [ 2]  604 	ldw	x, (0x5f, sp)
      00ABB2 24 01            [ 1]  605 	jrnc	00366$
      00ABB4 5A               [ 2]  606 	decw	x
      00ABB5                        607 00366$:
      00ABB5 1F 5F            [ 2]  608 	ldw	(0x5f, sp), x
      00ABB7 96               [ 1]  609 	ldw	x, sp
      00ABB8 5C               [ 1]  610 	incw	x
      00ABB9 72 FB 61         [ 2]  611 	addw	x, (0x61, sp)
      00ABBC F6               [ 1]  612 	ld	a, (x)
      00ABBD 1E 5B            [ 2]  613 	ldw	x, (0x5b, sp)
      00ABBF F7               [ 1]  614 	ld	(x), a
      00ABC0 1E 5B            [ 2]  615 	ldw	x, (0x5b, sp)
      00ABC2 5C               [ 1]  616 	incw	x
      00ABC3 1F 5B            [ 2]  617 	ldw	(0x5b, sp), x
      00ABC5 20 D7            [ 2]  618 	jra	00155$
                                    619 ;	./../../mib/stm8s_mib_vsprintf.c: 163: while (size-- > 0) *str++ = ' ';
      00ABC7                        620 00193$:
      00ABC7 16 5B            [ 2]  621 	ldw	y, (0x5b, sp)
      00ABC9 1E 6F            [ 2]  622 	ldw	x, (0x6f, sp)
      00ABCB 1F 61            [ 2]  623 	ldw	(0x61, sp), x
      00ABCD 1E 6D            [ 2]  624 	ldw	x, (0x6d, sp)
      00ABCF 1F 5F            [ 2]  625 	ldw	(0x5f, sp), x
      00ABD1                        626 00158$:
      00ABD1 5F               [ 1]  627 	clrw	x
      00ABD2 13 61            [ 2]  628 	cpw	x, (0x61, sp)
      00ABD4 4F               [ 1]  629 	clr	a
      00ABD5 12 60            [ 1]  630 	sbc	a, (0x60, sp)
      00ABD7 4F               [ 1]  631 	clr	a
      00ABD8 12 5F            [ 1]  632 	sbc	a, (0x5f, sp)
      00ABDA 2E 16            [ 1]  633 	jrsge	00160$
      00ABDC 1E 61            [ 2]  634 	ldw	x, (0x61, sp)
      00ABDE 1D 00 01         [ 2]  635 	subw	x, #0x0001
      00ABE1 1F 61            [ 2]  636 	ldw	(0x61, sp), x
      00ABE3 1E 5F            [ 2]  637 	ldw	x, (0x5f, sp)
      00ABE5 24 01            [ 1]  638 	jrnc	00369$
      00ABE7 5A               [ 2]  639 	decw	x
      00ABE8                        640 00369$:
      00ABE8 1F 5F            [ 2]  641 	ldw	(0x5f, sp), x
      00ABEA A6 20            [ 1]  642 	ld	a, #0x20
      00ABEC 90 F7            [ 1]  643 	ld	(y), a
      00ABEE 90 5C            [ 1]  644 	incw	y
      00ABF0 20 DF            [ 2]  645 	jra	00158$
      00ABF2                        646 00160$:
                                    647 ;	./../../mib/stm8s_mib_vsprintf.c: 165: return str;
      00ABF2 93               [ 1]  648 	ldw	x, y
      00ABF3                        649 00161$:
                                    650 ;	./../../mib/stm8s_mib_vsprintf.c: 166: }
      00ABF3 16 63            [ 2]  651 	ldw	y, (99, sp)
      00ABF5 5B 78            [ 2]  652 	addw	sp, #120
      00ABF7 90 FC            [ 2]  653 	jp	(y)
                                    654 ;	./../../mib/stm8s_mib_vsprintf.c: 172: MMRINT mm_vsprintf(char *buf, const char *fmt, va_list args)
                                    655 ;	-----------------------------------------
                                    656 ;	 function mm_vsprintf
                                    657 ;	-----------------------------------------
      00ABF9                        658 _mm_vsprintf:
      00ABF9 52 21            [ 2]  659 	sub	sp, #33
      00ABFB 1F 1A            [ 2]  660 	ldw	(0x1a, sp), x
                                    661 ;	./../../mib/stm8s_mib_vsprintf.c: 186: char vStr[] = "<NULL>";
      00ABFD A6 3C            [ 1]  662 	ld	a, #0x3c
      00ABFF 6B 0D            [ 1]  663 	ld	(0x0d, sp), a
      00AC01 A6 4E            [ 1]  664 	ld	a, #0x4e
      00AC03 6B 0E            [ 1]  665 	ld	(0x0e, sp), a
      00AC05 A6 55            [ 1]  666 	ld	a, #0x55
      00AC07 6B 0F            [ 1]  667 	ld	(0x0f, sp), a
      00AC09 A6 4C            [ 1]  668 	ld	a, #0x4c
      00AC0B 6B 10            [ 1]  669 	ld	(0x10, sp), a
      00AC0D 6B 11            [ 1]  670 	ld	(0x11, sp), a
      00AC0F A6 3E            [ 1]  671 	ld	a, #0x3e
      00AC11 6B 12            [ 1]  672 	ld	(0x12, sp), a
      00AC13 0F 13            [ 1]  673 	clr	(0x13, sp)
                                    674 ;	./../../mib/stm8s_mib_vsprintf.c: 188: for (str = buf; *fmt; fmt++)
      00AC15 16 1A            [ 2]  675 	ldw	y, (0x1a, sp)
      00AC17 17 1C            [ 2]  676 	ldw	(0x1c, sp), y
      00AC19                        677 00185$:
      00AC19 16 24            [ 2]  678 	ldw	y, (0x24, sp)
      00AC1B 17 20            [ 2]  679 	ldw	(0x20, sp), y
      00AC1D 93               [ 1]  680 	ldw	x, y
      00AC1E F6               [ 1]  681 	ld	a, (x)
      00AC1F 6B 1F            [ 1]  682 	ld	(0x1f, sp), a
      00AC21 26 03            [ 1]  683 	jrne	00437$
      00AC23 CC B0 1F         [ 2]  684 	jp	00180$
      00AC26                        685 00437$:
                                    686 ;	./../../mib/stm8s_mib_vsprintf.c: 190: if (*fmt != '%')
      00AC26 7B 1F            [ 1]  687 	ld	a, (0x1f, sp)
      00AC28 A1 25            [ 1]  688 	cp	a, #0x25
      00AC2A 27 0D            [ 1]  689 	jreq	00102$
                                    690 ;	./../../mib/stm8s_mib_vsprintf.c: 192: *str++ = *fmt;
      00AC2C 1E 1C            [ 2]  691 	ldw	x, (0x1c, sp)
      00AC2E 7B 1F            [ 1]  692 	ld	a, (0x1f, sp)
      00AC30 F7               [ 1]  693 	ld	(x), a
      00AC31 1E 1C            [ 2]  694 	ldw	x, (0x1c, sp)
      00AC33 5C               [ 1]  695 	incw	x
      00AC34 1F 1C            [ 2]  696 	ldw	(0x1c, sp), x
                                    697 ;	./../../mib/stm8s_mib_vsprintf.c: 193: continue;
      00AC36 CC B0 17         [ 2]  698 	jp	00179$
      00AC39                        699 00102$:
                                    700 ;	./../../mib/stm8s_mib_vsprintf.c: 197: flags = 0;
      00AC39 5F               [ 1]  701 	clrw	x
      00AC3A 1F 0B            [ 2]  702 	ldw	(0x0b, sp), x
      00AC3C 1F 09            [ 2]  703 	ldw	(0x09, sp), x
                                    704 ;	./../../mib/stm8s_mib_vsprintf.c: 198: repeat:
      00AC3E 1E 20            [ 2]  705 	ldw	x, (0x20, sp)
      00AC40                        706 00103$:
                                    707 ;	./../../mib/stm8s_mib_vsprintf.c: 199: fmt++; // This also skips first '%'
      00AC40 5C               [ 1]  708 	incw	x
      00AC41 1F 24            [ 2]  709 	ldw	(0x24, sp), x
                                    710 ;	./../../mib/stm8s_mib_vsprintf.c: 200: switch (*fmt)
      00AC43 F6               [ 1]  711 	ld	a, (x)
      00AC44 6B 19            [ 1]  712 	ld	(0x19, sp), a
      00AC46 A1 20            [ 1]  713 	cp	a, #0x20
      00AC48 27 2C            [ 1]  714 	jreq	00106$
      00AC4A 7B 19            [ 1]  715 	ld	a, (0x19, sp)
      00AC4C A1 23            [ 1]  716 	cp	a, #0x23
      00AC4E 27 2E            [ 1]  717 	jreq	00107$
      00AC50 7B 19            [ 1]  718 	ld	a, (0x19, sp)
      00AC52 A1 2B            [ 1]  719 	cp	a, #0x2b
      00AC54 27 18            [ 1]  720 	jreq	00105$
      00AC56 7B 19            [ 1]  721 	ld	a, (0x19, sp)
      00AC58 A1 2D            [ 1]  722 	cp	a, #0x2d
      00AC5A 27 0A            [ 1]  723 	jreq	00104$
      00AC5C 7B 19            [ 1]  724 	ld	a, (0x19, sp)
      00AC5E A1 30            [ 1]  725 	cp	a, #0x30
      00AC60 27 24            [ 1]  726 	jreq	00108$
      00AC62 1F 24            [ 2]  727 	ldw	(0x24, sp), x
      00AC64 20 27            [ 2]  728 	jra	00109$
                                    729 ;	./../../mib/stm8s_mib_vsprintf.c: 202: case '-': flags |= LEFT; goto repeat;
      00AC66                        730 00104$:
      00AC66 7B 0C            [ 1]  731 	ld	a, (0x0c, sp)
      00AC68 AA 10            [ 1]  732 	or	a, #0x10
      00AC6A 6B 0C            [ 1]  733 	ld	(0x0c, sp), a
      00AC6C 20 D2            [ 2]  734 	jra	00103$
                                    735 ;	./../../mib/stm8s_mib_vsprintf.c: 203: case '+': flags |= PLUS; goto repeat;
      00AC6E                        736 00105$:
      00AC6E 7B 0C            [ 1]  737 	ld	a, (0x0c, sp)
      00AC70 AA 04            [ 1]  738 	or	a, #0x04
      00AC72 6B 0C            [ 1]  739 	ld	(0x0c, sp), a
      00AC74 20 CA            [ 2]  740 	jra	00103$
                                    741 ;	./../../mib/stm8s_mib_vsprintf.c: 204: case ' ': flags |= SPACE; goto repeat;
      00AC76                        742 00106$:
      00AC76 7B 0C            [ 1]  743 	ld	a, (0x0c, sp)
      00AC78 AA 08            [ 1]  744 	or	a, #0x08
      00AC7A 6B 0C            [ 1]  745 	ld	(0x0c, sp), a
      00AC7C 20 C2            [ 2]  746 	jra	00103$
                                    747 ;	./../../mib/stm8s_mib_vsprintf.c: 205: case '#': flags |= SPECIAL; goto repeat;
      00AC7E                        748 00107$:
      00AC7E 7B 0C            [ 1]  749 	ld	a, (0x0c, sp)
      00AC80 AA 20            [ 1]  750 	or	a, #0x20
      00AC82 6B 0C            [ 1]  751 	ld	(0x0c, sp), a
      00AC84 20 BA            [ 2]  752 	jra	00103$
                                    753 ;	./../../mib/stm8s_mib_vsprintf.c: 206: case '0': flags |= ZEROPAD; goto repeat;
      00AC86                        754 00108$:
      00AC86 04 0C            [ 1]  755 	srl	(0x0c, sp)
      00AC88 99               [ 1]  756 	scf
      00AC89 09 0C            [ 1]  757 	rlc	(0x0c, sp)
      00AC8B 20 B3            [ 2]  758 	jra	00103$
                                    759 ;	./../../mib/stm8s_mib_vsprintf.c: 207: }
      00AC8D                        760 00109$:
                                    761 ;	./../../mib/stm8s_mib_vsprintf.c: 210: field_width = -1;
      00AC8D 5F               [ 1]  762 	clrw	x
      00AC8E 5A               [ 2]  763 	decw	x
      00AC8F 1F 20            [ 2]  764 	ldw	(0x20, sp), x
      00AC91 1F 1E            [ 2]  765 	ldw	(0x1e, sp), x
                                    766 ;	./../../mib/stm8s_mib_vsprintf.c: 211: if (is_digit(*fmt))
      00AC93 7B 19            [ 1]  767 	ld	a, (0x19, sp)
      00AC95 A1 30            [ 1]  768 	cp	a, #0x30
      00AC97 25 11            [ 1]  769 	jrc	00115$
      00AC99 A1 39            [ 1]  770 	cp	a, #0x39
      00AC9B 22 0D            [ 1]  771 	jrugt	00115$
                                    772 ;	./../../mib/stm8s_mib_vsprintf.c: 212: field_width = skip_atoi(&fmt);
      00AC9D 96               [ 1]  773 	ldw	x, sp
      00AC9E 1C 00 24         [ 2]  774 	addw	x, #36
      00ACA1 CD A8 9D         [ 4]  775 	call	_skip_atoi
      00ACA4 1F 20            [ 2]  776 	ldw	(0x20, sp), x
      00ACA6 17 1E            [ 2]  777 	ldw	(0x1e, sp), y
      00ACA8 20 39            [ 2]  778 	jra	00116$
      00ACAA                        779 00115$:
                                    780 ;	./../../mib/stm8s_mib_vsprintf.c: 213: else if (*fmt == '*')
      00ACAA 1E 24            [ 2]  781 	ldw	x, (0x24, sp)
      00ACAC F6               [ 1]  782 	ld	a, (x)
      00ACAD A1 2A            [ 1]  783 	cp	a, #0x2a
      00ACAF 26 32            [ 1]  784 	jrne	00116$
                                    785 ;	./../../mib/stm8s_mib_vsprintf.c: 215: fmt++;
      00ACB1 5C               [ 1]  786 	incw	x
      00ACB2 1F 24            [ 2]  787 	ldw	(0x24, sp), x
                                    788 ;	./../../mib/stm8s_mib_vsprintf.c: 216: field_width = va_arg(args, MMINT);
      00ACB4 1E 26            [ 2]  789 	ldw	x, (0x26, sp)
      00ACB6 1C 00 04         [ 2]  790 	addw	x, #0x0004
      00ACB9 1F 26            [ 2]  791 	ldw	(0x26, sp), x
      00ACBB 1D 00 04         [ 2]  792 	subw	x, #0x0004
      00ACBE 90 93            [ 1]  793 	ldw	y, x
      00ACC0 90 EE 02         [ 2]  794 	ldw	y, (0x2, y)
      00ACC3 FE               [ 2]  795 	ldw	x, (x)
      00ACC4 17 20            [ 2]  796 	ldw	(0x20, sp), y
      00ACC6 1F 1E            [ 2]  797 	ldw	(0x1e, sp), x
                                    798 ;	./../../mib/stm8s_mib_vsprintf.c: 217: if (field_width < 0)
      00ACC8 0D 1E            [ 1]  799 	tnz	(0x1e, sp)
      00ACCA 2A 17            [ 1]  800 	jrpl	00116$
                                    801 ;	./../../mib/stm8s_mib_vsprintf.c: 219: field_width = -field_width;
      00ACCC 00 21            [ 1]  802 	neg	(0x21, sp)
      00ACCE 4F               [ 1]  803 	clr	a
      00ACCF 12 20            [ 1]  804 	sbc	a, (0x20, sp)
      00ACD1 6B 20            [ 1]  805 	ld	(0x20, sp), a
      00ACD3 4F               [ 1]  806 	clr	a
      00ACD4 12 1F            [ 1]  807 	sbc	a, (0x1f, sp)
      00ACD6 6B 1F            [ 1]  808 	ld	(0x1f, sp), a
      00ACD8 4F               [ 1]  809 	clr	a
      00ACD9 12 1E            [ 1]  810 	sbc	a, (0x1e, sp)
      00ACDB 6B 1E            [ 1]  811 	ld	(0x1e, sp), a
                                    812 ;	./../../mib/stm8s_mib_vsprintf.c: 220: flags |= LEFT;
      00ACDD 7B 0C            [ 1]  813 	ld	a, (0x0c, sp)
      00ACDF AA 10            [ 1]  814 	or	a, #0x10
      00ACE1 6B 0C            [ 1]  815 	ld	(0x0c, sp), a
      00ACE3                        816 00116$:
                                    817 ;	./../../mib/stm8s_mib_vsprintf.c: 225: precision = -1;
      00ACE3 5F               [ 1]  818 	clrw	x
      00ACE4 5A               [ 2]  819 	decw	x
      00ACE5 1F 18            [ 2]  820 	ldw	(0x18, sp), x
      00ACE7 1F 16            [ 2]  821 	ldw	(0x16, sp), x
                                    822 ;	./../../mib/stm8s_mib_vsprintf.c: 226: if (*fmt == '.')
      00ACE9 16 24            [ 2]  823 	ldw	y, (0x24, sp)
      00ACEB 17 14            [ 2]  824 	ldw	(0x14, sp), y
      00ACED 93               [ 1]  825 	ldw	x, y
      00ACEE F6               [ 1]  826 	ld	a, (x)
      00ACEF A1 2E            [ 1]  827 	cp	a, #0x2e
      00ACF1 26 42            [ 1]  828 	jrne	00127$
                                    829 ;	./../../mib/stm8s_mib_vsprintf.c: 228: ++fmt;    
      00ACF3 1E 14            [ 2]  830 	ldw	x, (0x14, sp)
      00ACF5 5C               [ 1]  831 	incw	x
                                    832 ;	./../../mib/stm8s_mib_vsprintf.c: 229: if (is_digit(*fmt))
      00ACF6 1F 24            [ 2]  833 	ldw	(0x24, sp), x
      00ACF8 F6               [ 1]  834 	ld	a, (x)
      00ACF9 A1 30            [ 1]  835 	cp	a, #0x30
      00ACFB 25 11            [ 1]  836 	jrc	00121$
      00ACFD A1 39            [ 1]  837 	cp	a, #0x39
      00ACFF 22 0D            [ 1]  838 	jrugt	00121$
                                    839 ;	./../../mib/stm8s_mib_vsprintf.c: 230: precision = skip_atoi(&fmt);
      00AD01 96               [ 1]  840 	ldw	x, sp
      00AD02 1C 00 24         [ 2]  841 	addw	x, #36
      00AD05 CD A8 9D         [ 4]  842 	call	_skip_atoi
      00AD08 1F 18            [ 2]  843 	ldw	(0x18, sp), x
      00AD0A 17 16            [ 2]  844 	ldw	(0x16, sp), y
      00AD0C 20 1E            [ 2]  845 	jra	00122$
      00AD0E                        846 00121$:
                                    847 ;	./../../mib/stm8s_mib_vsprintf.c: 231: else if (*fmt == '*')
      00AD0E 1E 24            [ 2]  848 	ldw	x, (0x24, sp)
      00AD10 F6               [ 1]  849 	ld	a, (x)
      00AD11 A1 2A            [ 1]  850 	cp	a, #0x2a
      00AD13 26 17            [ 1]  851 	jrne	00122$
                                    852 ;	./../../mib/stm8s_mib_vsprintf.c: 233: ++fmt;
      00AD15 5C               [ 1]  853 	incw	x
      00AD16 1F 24            [ 2]  854 	ldw	(0x24, sp), x
                                    855 ;	./../../mib/stm8s_mib_vsprintf.c: 234: precision = va_arg(args, MMINT);
      00AD18 1E 26            [ 2]  856 	ldw	x, (0x26, sp)
      00AD1A 1C 00 04         [ 2]  857 	addw	x, #0x0004
      00AD1D 1F 26            [ 2]  858 	ldw	(0x26, sp), x
      00AD1F 1D 00 04         [ 2]  859 	subw	x, #0x0004
      00AD22 90 93            [ 1]  860 	ldw	y, x
      00AD24 90 EE 02         [ 2]  861 	ldw	y, (0x2, y)
      00AD27 FE               [ 2]  862 	ldw	x, (x)
      00AD28 17 18            [ 2]  863 	ldw	(0x18, sp), y
      00AD2A 1F 16            [ 2]  864 	ldw	(0x16, sp), x
      00AD2C                        865 00122$:
                                    866 ;	./../../mib/stm8s_mib_vsprintf.c: 236: if (precision < 0) precision = 0;
      00AD2C 0D 16            [ 1]  867 	tnz	(0x16, sp)
      00AD2E 2A 05            [ 1]  868 	jrpl	00127$
      00AD30 5F               [ 1]  869 	clrw	x
      00AD31 1F 18            [ 2]  870 	ldw	(0x18, sp), x
      00AD33 1F 16            [ 2]  871 	ldw	(0x16, sp), x
      00AD35                        872 00127$:
                                    873 ;	./../../mib/stm8s_mib_vsprintf.c: 240: qualifier = -1;
      00AD35 5F               [ 1]  874 	clrw	x
      00AD36 5A               [ 2]  875 	decw	x
      00AD37 1F 03            [ 2]  876 	ldw	(0x03, sp), x
      00AD39 1F 01            [ 2]  877 	ldw	(0x01, sp), x
                                    878 ;	./../../mib/stm8s_mib_vsprintf.c: 241: if (*fmt == 'h' || *fmt == 'l' || *fmt == 'L')
      00AD3B 1E 24            [ 2]  879 	ldw	x, (0x24, sp)
      00AD3D F6               [ 1]  880 	ld	a, (x)
      00AD3E 6B 15            [ 1]  881 	ld	(0x15, sp), a
      00AD40 A1 68            [ 1]  882 	cp	a, #0x68
      00AD42 27 0C            [ 1]  883 	jreq	00128$
      00AD44 7B 15            [ 1]  884 	ld	a, (0x15, sp)
      00AD46 A1 6C            [ 1]  885 	cp	a, #0x6c
      00AD48 27 06            [ 1]  886 	jreq	00128$
      00AD4A 7B 15            [ 1]  887 	ld	a, (0x15, sp)
      00AD4C A1 4C            [ 1]  888 	cp	a, #0x4c
      00AD4E 26 0E            [ 1]  889 	jrne	00129$
      00AD50                        890 00128$:
                                    891 ;	./../../mib/stm8s_mib_vsprintf.c: 243: qualifier = *fmt;
      00AD50 1E 24            [ 2]  892 	ldw	x, (0x24, sp)
      00AD52 F6               [ 1]  893 	ld	a, (x)
      00AD53 6B 04            [ 1]  894 	ld	(0x04, sp), a
      00AD55 0F 03            [ 1]  895 	clr	(0x03, sp)
      00AD57 0F 02            [ 1]  896 	clr	(0x02, sp)
      00AD59 0F 01            [ 1]  897 	clr	(0x01, sp)
                                    898 ;	./../../mib/stm8s_mib_vsprintf.c: 244: fmt++;
      00AD5B 5C               [ 1]  899 	incw	x
      00AD5C 1F 24            [ 2]  900 	ldw	(0x24, sp), x
      00AD5E                        901 00129$:
                                    902 ;	./../../mib/stm8s_mib_vsprintf.c: 248: base = 10;
      00AD5E AE 00 0A         [ 2]  903 	ldw	x, #0x000a
      00AD61 1F 07            [ 2]  904 	ldw	(0x07, sp), x
      00AD63 5F               [ 1]  905 	clrw	x
      00AD64 1F 05            [ 2]  906 	ldw	(0x05, sp), x
                                    907 ;	./../../mib/stm8s_mib_vsprintf.c: 250: switch (*fmt)
      00AD66 16 24            [ 2]  908 	ldw	y, (0x24, sp)
      00AD68 17 14            [ 2]  909 	ldw	(0x14, sp), y
      00AD6A 93               [ 1]  910 	ldw	x, y
      00AD6B F6               [ 1]  911 	ld	a, (x)
      00AD6C A1 58            [ 1]  912 	cp	a, #0x58
      00AD6E 26 03            [ 1]  913 	jrne	00482$
      00AD70 CC AF 66         [ 2]  914 	jp	00161$
      00AD73                        915 00482$:
      00AD73 A1 63            [ 1]  916 	cp	a, #0x63
      00AD75 27 38            [ 1]  917 	jreq	00132$
      00AD77 A1 64            [ 1]  918 	cp	a, #0x64
      00AD79 26 03            [ 1]  919 	jrne	00488$
      00AD7B CC AF 76         [ 2]  920 	jp	00164$
      00AD7E                        921 00488$:
      00AD7E A1 69            [ 1]  922 	cp	a, #0x69
      00AD80 26 03            [ 1]  923 	jrne	00491$
      00AD82 CC AF 76         [ 2]  924 	jp	00164$
      00AD85                        925 00491$:
      00AD85 A1 6E            [ 1]  926 	cp	a, #0x6e
      00AD87 26 03            [ 1]  927 	jrne	00494$
      00AD89 CC AF 11         [ 2]  928 	jp	00156$
      00AD8C                        929 00494$:
      00AD8C A1 6F            [ 1]  930 	cp	a, #0x6f
      00AD8E 26 03            [ 1]  931 	jrne	00497$
      00AD90 CC AF 5C         [ 2]  932 	jp	00160$
      00AD93                        933 00497$:
      00AD93 A1 70            [ 1]  934 	cp	a, #0x70
      00AD95 26 03            [ 1]  935 	jrne	00500$
      00AD97 CC AE C6         [ 2]  936 	jp	00153$
      00AD9A                        937 00500$:
      00AD9A A1 73            [ 1]  938 	cp	a, #0x73
      00AD9C 27 76            [ 1]  939 	jreq	00141$
      00AD9E A1 75            [ 1]  940 	cp	a, #0x75
      00ADA0 26 03            [ 1]  941 	jrne	00506$
      00ADA2 CC AF A0         [ 2]  942 	jp	00172$
      00ADA5                        943 00506$:
      00ADA5 A1 78            [ 1]  944 	cp	a, #0x78
      00ADA7 26 03            [ 1]  945 	jrne	00509$
      00ADA9 CC AF 6C         [ 2]  946 	jp	00162$
      00ADAC                        947 00509$:
      00ADAC CC AF 7E         [ 2]  948 	jp	00166$
                                    949 ;	./../../mib/stm8s_mib_vsprintf.c: 252: case 'c':
      00ADAF                        950 00132$:
                                    951 ;	./../../mib/stm8s_mib_vsprintf.c: 253: if (!(flags & LEFT)) while (--field_width > 0) *str++ = ' ';
      00ADAF 7B 0C            [ 1]  952 	ld	a, (0x0c, sp)
      00ADB1 A5 10            [ 1]  953 	bcp	a, #0x10
      00ADB3 26 25            [ 1]  954 	jrne	00137$
      00ADB5 16 1C            [ 2]  955 	ldw	y, (0x1c, sp)
      00ADB7                        956 00133$:
      00ADB7 1E 20            [ 2]  957 	ldw	x, (0x20, sp)
      00ADB9 1D 00 01         [ 2]  958 	subw	x, #0x0001
      00ADBC 1F 20            [ 2]  959 	ldw	(0x20, sp), x
      00ADBE 1E 1E            [ 2]  960 	ldw	x, (0x1e, sp)
      00ADC0 24 01            [ 1]  961 	jrnc	00512$
      00ADC2 5A               [ 2]  962 	decw	x
      00ADC3                        963 00512$:
      00ADC3 1F 1E            [ 2]  964 	ldw	(0x1e, sp), x
      00ADC5 5F               [ 1]  965 	clrw	x
      00ADC6 13 20            [ 2]  966 	cpw	x, (0x20, sp)
      00ADC8 4F               [ 1]  967 	clr	a
      00ADC9 12 1F            [ 1]  968 	sbc	a, (0x1f, sp)
      00ADCB 4F               [ 1]  969 	clr	a
      00ADCC 12 1E            [ 1]  970 	sbc	a, (0x1e, sp)
      00ADCE 2E 08            [ 1]  971 	jrsge	00236$
      00ADD0 A6 20            [ 1]  972 	ld	a, #0x20
      00ADD2 90 F7            [ 1]  973 	ld	(y), a
      00ADD4 90 5C            [ 1]  974 	incw	y
      00ADD6 20 DF            [ 2]  975 	jra	00133$
      00ADD8                        976 00236$:
      00ADD8 17 1C            [ 2]  977 	ldw	(0x1c, sp), y
      00ADDA                        978 00137$:
                                    979 ;	./../../mib/stm8s_mib_vsprintf.c: 254: *str++ = (MMUCHAR) va_arg(args, MMAINT); // test ok...
      00ADDA 1E 26            [ 2]  980 	ldw	x, (0x26, sp)
      00ADDC 5C               [ 1]  981 	incw	x
      00ADDD 5C               [ 1]  982 	incw	x
      00ADDE 1F 26            [ 2]  983 	ldw	(0x26, sp), x
      00ADE0 5A               [ 2]  984 	decw	x
      00ADE1 5A               [ 2]  985 	decw	x
      00ADE2 E6 01            [ 1]  986 	ld	a, (0x1, x)
      00ADE4 1E 1C            [ 2]  987 	ldw	x, (0x1c, sp)
      00ADE6 F7               [ 1]  988 	ld	(x), a
      00ADE7 1E 1C            [ 2]  989 	ldw	x, (0x1c, sp)
      00ADE9 5C               [ 1]  990 	incw	x
      00ADEA 1F 18            [ 2]  991 	ldw	(0x18, sp), x
                                    992 ;	./../../mib/stm8s_mib_vsprintf.c: 255: while (--field_width > 0) *str++ = ' ';
      00ADEC                        993 00138$:
      00ADEC 1E 20            [ 2]  994 	ldw	x, (0x20, sp)
      00ADEE 1D 00 01         [ 2]  995 	subw	x, #0x0001
      00ADF1 1F 20            [ 2]  996 	ldw	(0x20, sp), x
      00ADF3 1E 1E            [ 2]  997 	ldw	x, (0x1e, sp)
      00ADF5 24 01            [ 1]  998 	jrnc	00514$
      00ADF7 5A               [ 2]  999 	decw	x
      00ADF8                       1000 00514$:
      00ADF8 1F 1E            [ 2] 1001 	ldw	(0x1e, sp), x
      00ADFA 5F               [ 1] 1002 	clrw	x
      00ADFB 13 20            [ 2] 1003 	cpw	x, (0x20, sp)
      00ADFD 4F               [ 1] 1004 	clr	a
      00ADFE 12 1F            [ 1] 1005 	sbc	a, (0x1f, sp)
      00AE00 4F               [ 1] 1006 	clr	a
      00AE01 12 1E            [ 1] 1007 	sbc	a, (0x1e, sp)
      00AE03 2F 03            [ 1] 1008 	jrslt	00515$
      00AE05 CC B0 13         [ 2] 1009 	jp	00237$
      00AE08                       1010 00515$:
      00AE08 1E 18            [ 2] 1011 	ldw	x, (0x18, sp)
      00AE0A A6 20            [ 1] 1012 	ld	a, #0x20
      00AE0C F7               [ 1] 1013 	ld	(x), a
      00AE0D 1E 18            [ 2] 1014 	ldw	x, (0x18, sp)
      00AE0F 5C               [ 1] 1015 	incw	x
      00AE10 1F 18            [ 2] 1016 	ldw	(0x18, sp), x
      00AE12 20 D8            [ 2] 1017 	jra	00138$
                                   1018 ;	./../../mib/stm8s_mib_vsprintf.c: 258: case 's':
      00AE14                       1019 00141$:
                                   1020 ;	./../../mib/stm8s_mib_vsprintf.c: 259: s = va_arg(args, char *);
      00AE14 1E 26            [ 2] 1021 	ldw	x, (0x26, sp)
      00AE16 5C               [ 1] 1022 	incw	x
      00AE17 5C               [ 1] 1023 	incw	x
      00AE18 1F 26            [ 2] 1024 	ldw	(0x26, sp), x
      00AE1A 5A               [ 2] 1025 	decw	x
      00AE1B 5A               [ 2] 1026 	decw	x
      00AE1C FE               [ 2] 1027 	ldw	x, (x)
                                   1028 ;	./../../mib/stm8s_mib_vsprintf.c: 260: if (!s) s = vStr; // "<NULL>";
      00AE1D 1F 14            [ 2] 1029 	ldw	(0x14, sp), x
      00AE1F 26 06            [ 1] 1030 	jrne	00143$
      00AE21 96               [ 1] 1031 	ldw	x, sp
      00AE22 1C 00 0D         [ 2] 1032 	addw	x, #13
      00AE25 1F 14            [ 2] 1033 	ldw	(0x14, sp), x
      00AE27                       1034 00143$:
                                   1035 ;	./../../mib/stm8s_mib_vsprintf.c: 261: len = strnlen(s, precision);
      00AE27 1E 18            [ 2] 1036 	ldw	x, (0x18, sp)
      00AE29 89               [ 2] 1037 	pushw	x
      00AE2A 1E 16            [ 2] 1038 	ldw	x, (0x16, sp)
      00AE2C CD A8 74         [ 4] 1039 	call	_strnlen
      00AE2F 1F 18            [ 2] 1040 	ldw	(0x18, sp), x
      00AE31 5F               [ 1] 1041 	clrw	x
      00AE32 1F 16            [ 2] 1042 	ldw	(0x16, sp), x
                                   1043 ;	./../../mib/stm8s_mib_vsprintf.c: 262: if (!(flags & LEFT)) while (len < field_width--) *str++ = ' ';
      00AE34 7B 0C            [ 1] 1044 	ld	a, (0x0c, sp)
      00AE36 A5 10            [ 1] 1045 	bcp	a, #0x10
      00AE38 26 30            [ 1] 1046 	jrne	00225$
      00AE3A                       1047 00144$:
      00AE3A 16 20            [ 2] 1048 	ldw	y, (0x20, sp)
      00AE3C 17 0B            [ 2] 1049 	ldw	(0x0b, sp), y
      00AE3E 16 1E            [ 2] 1050 	ldw	y, (0x1e, sp)
      00AE40 17 09            [ 2] 1051 	ldw	(0x09, sp), y
      00AE42 1E 20            [ 2] 1052 	ldw	x, (0x20, sp)
      00AE44 1D 00 01         [ 2] 1053 	subw	x, #0x0001
      00AE47 1F 20            [ 2] 1054 	ldw	(0x20, sp), x
      00AE49 1E 1E            [ 2] 1055 	ldw	x, (0x1e, sp)
      00AE4B 24 01            [ 1] 1056 	jrnc	00519$
      00AE4D 5A               [ 2] 1057 	decw	x
      00AE4E                       1058 00519$:
      00AE4E 1F 1E            [ 2] 1059 	ldw	(0x1e, sp), x
      00AE50 1E 18            [ 2] 1060 	ldw	x, (0x18, sp)
      00AE52 13 0B            [ 2] 1061 	cpw	x, (0x0b, sp)
      00AE54 7B 17            [ 1] 1062 	ld	a, (0x17, sp)
      00AE56 12 0A            [ 1] 1063 	sbc	a, (0x0a, sp)
      00AE58 7B 16            [ 1] 1064 	ld	a, (0x16, sp)
      00AE5A 12 09            [ 1] 1065 	sbc	a, (0x09, sp)
      00AE5C 2E 0C            [ 1] 1066 	jrsge	00238$
      00AE5E 1E 1C            [ 2] 1067 	ldw	x, (0x1c, sp)
      00AE60 A6 20            [ 1] 1068 	ld	a, #0x20
      00AE62 F7               [ 1] 1069 	ld	(x), a
      00AE63 1E 1C            [ 2] 1070 	ldw	x, (0x1c, sp)
      00AE65 5C               [ 1] 1071 	incw	x
      00AE66 1F 1C            [ 2] 1072 	ldw	(0x1c, sp), x
      00AE68 20 D0            [ 2] 1073 	jra	00144$
      00AE6A                       1074 00238$:
                                   1075 ;	./../../mib/stm8s_mib_vsprintf.c: 263: for (i = 0; i < len; ++i) *str++ = *s++;
      00AE6A                       1076 00225$:
      00AE6A 5F               [ 1] 1077 	clrw	x
      00AE6B 1F 0B            [ 2] 1078 	ldw	(0x0b, sp), x
      00AE6D 1F 09            [ 2] 1079 	ldw	(0x09, sp), x
      00AE6F                       1080 00182$:
      00AE6F 1E 0B            [ 2] 1081 	ldw	x, (0x0b, sp)
      00AE71 13 18            [ 2] 1082 	cpw	x, (0x18, sp)
      00AE73 7B 0A            [ 1] 1083 	ld	a, (0x0a, sp)
      00AE75 12 17            [ 1] 1084 	sbc	a, (0x17, sp)
      00AE77 7B 09            [ 1] 1085 	ld	a, (0x09, sp)
      00AE79 12 16            [ 1] 1086 	sbc	a, (0x16, sp)
      00AE7B 2E 1E            [ 1] 1087 	jrsge	00227$
      00AE7D 1E 14            [ 2] 1088 	ldw	x, (0x14, sp)
      00AE7F F6               [ 1] 1089 	ld	a, (x)
      00AE80 1E 14            [ 2] 1090 	ldw	x, (0x14, sp)
      00AE82 5C               [ 1] 1091 	incw	x
      00AE83 1F 14            [ 2] 1092 	ldw	(0x14, sp), x
      00AE85 1E 1C            [ 2] 1093 	ldw	x, (0x1c, sp)
      00AE87 F7               [ 1] 1094 	ld	(x), a
      00AE88 1E 1C            [ 2] 1095 	ldw	x, (0x1c, sp)
      00AE8A 5C               [ 1] 1096 	incw	x
      00AE8B 1F 1C            [ 2] 1097 	ldw	(0x1c, sp), x
      00AE8D 1E 0B            [ 2] 1098 	ldw	x, (0x0b, sp)
      00AE8F 5C               [ 1] 1099 	incw	x
      00AE90 1F 0B            [ 2] 1100 	ldw	(0x0b, sp), x
      00AE92 26 DB            [ 1] 1101 	jrne	00182$
      00AE94 1E 09            [ 2] 1102 	ldw	x, (0x09, sp)
      00AE96 5C               [ 1] 1103 	incw	x
      00AE97 1F 09            [ 2] 1104 	ldw	(0x09, sp), x
      00AE99 20 D4            [ 2] 1105 	jra	00182$
                                   1106 ;	./../../mib/stm8s_mib_vsprintf.c: 264: while (len < field_width--) *str++ = ' ';
      00AE9B                       1107 00227$:
      00AE9B                       1108 00150$:
      00AE9B 1E 18            [ 2] 1109 	ldw	x, (0x18, sp)
      00AE9D 13 20            [ 2] 1110 	cpw	x, (0x20, sp)
      00AE9F 7B 17            [ 1] 1111 	ld	a, (0x17, sp)
      00AEA1 12 1F            [ 1] 1112 	sbc	a, (0x1f, sp)
      00AEA3 7B 16            [ 1] 1113 	ld	a, (0x16, sp)
      00AEA5 12 1E            [ 1] 1114 	sbc	a, (0x1e, sp)
      00AEA7 2F 03            [ 1] 1115 	jrslt	00526$
      00AEA9 CC B0 17         [ 2] 1116 	jp	00240$
      00AEAC                       1117 00526$:
      00AEAC 1E 20            [ 2] 1118 	ldw	x, (0x20, sp)
      00AEAE 1D 00 01         [ 2] 1119 	subw	x, #0x0001
      00AEB1 1F 20            [ 2] 1120 	ldw	(0x20, sp), x
      00AEB3 1E 1E            [ 2] 1121 	ldw	x, (0x1e, sp)
      00AEB5 24 01            [ 1] 1122 	jrnc	00527$
      00AEB7 5A               [ 2] 1123 	decw	x
      00AEB8                       1124 00527$:
      00AEB8 1F 1E            [ 2] 1125 	ldw	(0x1e, sp), x
      00AEBA 1E 1C            [ 2] 1126 	ldw	x, (0x1c, sp)
      00AEBC A6 20            [ 1] 1127 	ld	a, #0x20
      00AEBE F7               [ 1] 1128 	ld	(x), a
      00AEBF 1E 1C            [ 2] 1129 	ldw	x, (0x1c, sp)
      00AEC1 5C               [ 1] 1130 	incw	x
      00AEC2 1F 1C            [ 2] 1131 	ldw	(0x1c, sp), x
      00AEC4 20 D5            [ 2] 1132 	jra	00150$
                                   1133 ;	./../../mib/stm8s_mib_vsprintf.c: 267: case 'p':
      00AEC6                       1134 00153$:
                                   1135 ;	./../../mib/stm8s_mib_vsprintf.c: 268: if (field_width == -1)
      00AEC6 1E 20            [ 2] 1136 	ldw	x, (0x20, sp)
      00AEC8 5C               [ 1] 1137 	incw	x
      00AEC9 26 12            [ 1] 1138 	jrne	00155$
      00AECB 1E 1E            [ 2] 1139 	ldw	x, (0x1e, sp)
      00AECD 5C               [ 1] 1140 	incw	x
      00AECE 26 0D            [ 1] 1141 	jrne	00155$
                                   1142 ;	./../../mib/stm8s_mib_vsprintf.c: 270: field_width = 2 * sizeof(void *);
      00AED0 AE 00 04         [ 2] 1143 	ldw	x, #0x0004
      00AED3 1F 20            [ 2] 1144 	ldw	(0x20, sp), x
      00AED5 5F               [ 1] 1145 	clrw	x
      00AED6 1F 1E            [ 2] 1146 	ldw	(0x1e, sp), x
                                   1147 ;	./../../mib/stm8s_mib_vsprintf.c: 271: flags |= ZEROPAD;
      00AED8 04 0C            [ 1] 1148 	srl	(0x0c, sp)
      00AEDA 99               [ 1] 1149 	scf
      00AEDB 09 0C            [ 1] 1150 	rlc	(0x0c, sp)
      00AEDD                       1151 00155$:
                                   1152 ;	./../../mib/stm8s_mib_vsprintf.c: 273: str = number(str, (MMULONG) va_arg(args, void *), 16, field_width, precision, flags);
      00AEDD 1E 26            [ 2] 1153 	ldw	x, (0x26, sp)
      00AEDF 5C               [ 1] 1154 	incw	x
      00AEE0 5C               [ 1] 1155 	incw	x
      00AEE1 1F 26            [ 2] 1156 	ldw	(0x26, sp), x
      00AEE3 5A               [ 2] 1157 	decw	x
      00AEE4 5A               [ 2] 1158 	decw	x
      00AEE5 FE               [ 2] 1159 	ldw	x, (x)
      00AEE6 1F 07            [ 2] 1160 	ldw	(0x07, sp), x
      00AEE8 90 5F            [ 1] 1161 	clrw	y
      00AEEA 1E 0B            [ 2] 1162 	ldw	x, (0x0b, sp)
      00AEEC 89               [ 2] 1163 	pushw	x
      00AEED 1E 0B            [ 2] 1164 	ldw	x, (0x0b, sp)
      00AEEF 89               [ 2] 1165 	pushw	x
      00AEF0 1E 1C            [ 2] 1166 	ldw	x, (0x1c, sp)
      00AEF2 89               [ 2] 1167 	pushw	x
      00AEF3 1E 1C            [ 2] 1168 	ldw	x, (0x1c, sp)
      00AEF5 89               [ 2] 1169 	pushw	x
      00AEF6 1E 28            [ 2] 1170 	ldw	x, (0x28, sp)
      00AEF8 89               [ 2] 1171 	pushw	x
      00AEF9 1E 28            [ 2] 1172 	ldw	x, (0x28, sp)
      00AEFB 89               [ 2] 1173 	pushw	x
      00AEFC 4B 10            [ 1] 1174 	push	#0x10
      00AEFE 5F               [ 1] 1175 	clrw	x
      00AEFF 89               [ 2] 1176 	pushw	x
      00AF00 4B 00            [ 1] 1177 	push	#0x00
      00AF02 1E 17            [ 2] 1178 	ldw	x, (0x17, sp)
      00AF04 89               [ 2] 1179 	pushw	x
      00AF05 90 89            [ 2] 1180 	pushw	y
      00AF07 1E 30            [ 2] 1181 	ldw	x, (0x30, sp)
      00AF09 CD A8 F7         [ 4] 1182 	call	_number
      00AF0C 1F 1C            [ 2] 1183 	ldw	(0x1c, sp), x
                                   1184 ;	./../../mib/stm8s_mib_vsprintf.c: 274: continue;
      00AF0E CC B0 17         [ 2] 1185 	jp	00179$
                                   1186 ;	./../../mib/stm8s_mib_vsprintf.c: 276: case 'n':
      00AF11                       1187 00156$:
                                   1188 ;	./../../mib/stm8s_mib_vsprintf.c: 277: if (qualifier == 'l')
      00AF11 1E 03            [ 2] 1189 	ldw	x, (0x03, sp)
      00AF13 A3 00 6C         [ 2] 1190 	cpw	x, #0x006c
      00AF16 26 24            [ 1] 1191 	jrne	00158$
      00AF18 1E 01            [ 2] 1192 	ldw	x, (0x01, sp)
      00AF1A 26 20            [ 1] 1193 	jrne	00158$
                                   1194 ;	./../../mib/stm8s_mib_vsprintf.c: 279: MMLONG *ip = va_arg(args, MMLONG *);
      00AF1C 1E 26            [ 2] 1195 	ldw	x, (0x26, sp)
      00AF1E 5C               [ 1] 1196 	incw	x
      00AF1F 5C               [ 1] 1197 	incw	x
      00AF20 1F 26            [ 2] 1198 	ldw	(0x26, sp), x
      00AF22 5A               [ 2] 1199 	decw	x
      00AF23 5A               [ 2] 1200 	decw	x
      00AF24 FE               [ 2] 1201 	ldw	x, (x)
                                   1202 ;	./../../mib/stm8s_mib_vsprintf.c: 280: *ip = (str - buf);
      00AF25 16 1C            [ 2] 1203 	ldw	y, (0x1c, sp)
      00AF27 72 F2 1A         [ 2] 1204 	subw	y, (0x1a, sp)
      00AF2A 90 9E            [ 1] 1205 	ld	a, yh
      00AF2C 49               [ 1] 1206 	rlc	a
      00AF2D 4F               [ 1] 1207 	clr	a
      00AF2E A2 00            [ 1] 1208 	sbc	a, #0x00
      00AF30 6B 1F            [ 1] 1209 	ld	(0x1f, sp), a
      00AF32 6B 1E            [ 1] 1210 	ld	(0x1e, sp), a
      00AF34 EF 02            [ 2] 1211 	ldw	(0x2, x), y
      00AF36 16 1E            [ 2] 1212 	ldw	y, (0x1e, sp)
      00AF38 FF               [ 2] 1213 	ldw	(x), y
      00AF39 CC B0 17         [ 2] 1214 	jp	00179$
      00AF3C                       1215 00158$:
                                   1216 ;	./../../mib/stm8s_mib_vsprintf.c: 284: MMINT *ip = va_arg(args, MMINT *);
      00AF3C 1E 26            [ 2] 1217 	ldw	x, (0x26, sp)
      00AF3E 5C               [ 1] 1218 	incw	x
      00AF3F 5C               [ 1] 1219 	incw	x
      00AF40 1F 26            [ 2] 1220 	ldw	(0x26, sp), x
      00AF42 5A               [ 2] 1221 	decw	x
      00AF43 5A               [ 2] 1222 	decw	x
      00AF44 FE               [ 2] 1223 	ldw	x, (x)
                                   1224 ;	./../../mib/stm8s_mib_vsprintf.c: 285: *ip = (str - buf);
      00AF45 16 1C            [ 2] 1225 	ldw	y, (0x1c, sp)
      00AF47 72 F2 1A         [ 2] 1226 	subw	y, (0x1a, sp)
      00AF4A 90 9E            [ 1] 1227 	ld	a, yh
      00AF4C 49               [ 1] 1228 	rlc	a
      00AF4D 4F               [ 1] 1229 	clr	a
      00AF4E A2 00            [ 1] 1230 	sbc	a, #0x00
      00AF50 6B 1F            [ 1] 1231 	ld	(0x1f, sp), a
      00AF52 6B 1E            [ 1] 1232 	ld	(0x1e, sp), a
      00AF54 EF 02            [ 2] 1233 	ldw	(0x2, x), y
      00AF56 16 1E            [ 2] 1234 	ldw	y, (0x1e, sp)
      00AF58 FF               [ 2] 1235 	ldw	(x), y
                                   1236 ;	./../../mib/stm8s_mib_vsprintf.c: 287: continue;
      00AF59 CC B0 17         [ 2] 1237 	jp	00179$
                                   1238 ;	./../../mib/stm8s_mib_vsprintf.c: 290: case 'o':
      00AF5C                       1239 00160$:
                                   1240 ;	./../../mib/stm8s_mib_vsprintf.c: 291: base = 8;
      00AF5C AE 00 08         [ 2] 1241 	ldw	x, #0x0008
      00AF5F 1F 07            [ 2] 1242 	ldw	(0x07, sp), x
      00AF61 5F               [ 1] 1243 	clrw	x
      00AF62 1F 05            [ 2] 1244 	ldw	(0x05, sp), x
                                   1245 ;	./../../mib/stm8s_mib_vsprintf.c: 292: break;
      00AF64 20 3A            [ 2] 1246 	jra	00172$
                                   1247 ;	./../../mib/stm8s_mib_vsprintf.c: 294: case 'X':
      00AF66                       1248 00161$:
                                   1249 ;	./../../mib/stm8s_mib_vsprintf.c: 295: flags |= LARGE;
      00AF66 7B 0C            [ 1] 1250 	ld	a, (0x0c, sp)
      00AF68 AA 40            [ 1] 1251 	or	a, #0x40
      00AF6A 6B 0C            [ 1] 1252 	ld	(0x0c, sp), a
                                   1253 ;	./../../mib/stm8s_mib_vsprintf.c: 297: case 'x':
      00AF6C                       1254 00162$:
                                   1255 ;	./../../mib/stm8s_mib_vsprintf.c: 298: base = 16;
      00AF6C AE 00 10         [ 2] 1256 	ldw	x, #0x0010
      00AF6F 1F 07            [ 2] 1257 	ldw	(0x07, sp), x
      00AF71 5F               [ 1] 1258 	clrw	x
      00AF72 1F 05            [ 2] 1259 	ldw	(0x05, sp), x
                                   1260 ;	./../../mib/stm8s_mib_vsprintf.c: 299: break;
      00AF74 20 2A            [ 2] 1261 	jra	00172$
                                   1262 ;	./../../mib/stm8s_mib_vsprintf.c: 302: case 'i':
      00AF76                       1263 00164$:
                                   1264 ;	./../../mib/stm8s_mib_vsprintf.c: 303: flags |= SIGN;
      00AF76 7B 0C            [ 1] 1265 	ld	a, (0x0c, sp)
      00AF78 AA 02            [ 1] 1266 	or	a, #0x02
      00AF7A 6B 0C            [ 1] 1267 	ld	(0x0c, sp), a
                                   1268 ;	./../../mib/stm8s_mib_vsprintf.c: 306: break;
      00AF7C 20 22            [ 2] 1269 	jra	00172$
                                   1270 ;	./../../mib/stm8s_mib_vsprintf.c: 308: default:
      00AF7E                       1271 00166$:
                                   1272 ;	./../../mib/stm8s_mib_vsprintf.c: 309: if (*fmt != '%') *str++ = '%';
      00AF7E A1 25            [ 1] 1273 	cp	a, #0x25
      00AF80 27 0A            [ 1] 1274 	jreq	00168$
      00AF82 1E 1C            [ 2] 1275 	ldw	x, (0x1c, sp)
      00AF84 A6 25            [ 1] 1276 	ld	a, #0x25
      00AF86 F7               [ 1] 1277 	ld	(x), a
      00AF87 1E 1C            [ 2] 1278 	ldw	x, (0x1c, sp)
      00AF89 5C               [ 1] 1279 	incw	x
      00AF8A 1F 1C            [ 2] 1280 	ldw	(0x1c, sp), x
      00AF8C                       1281 00168$:
                                   1282 ;	./../../mib/stm8s_mib_vsprintf.c: 310: if (*fmt)
      00AF8C 1E 24            [ 2] 1283 	ldw	x, (0x24, sp)
      00AF8E F6               [ 1] 1284 	ld	a, (x)
      00AF8F 27 0A            [ 1] 1285 	jreq	00170$
                                   1286 ;	./../../mib/stm8s_mib_vsprintf.c: 311: *str++ = *fmt;
      00AF91 1E 1C            [ 2] 1287 	ldw	x, (0x1c, sp)
      00AF93 F7               [ 1] 1288 	ld	(x), a
      00AF94 1E 1C            [ 2] 1289 	ldw	x, (0x1c, sp)
      00AF96 5C               [ 1] 1290 	incw	x
      00AF97 1F 1C            [ 2] 1291 	ldw	(0x1c, sp), x
      00AF99 20 7C            [ 2] 1292 	jra	00179$
      00AF9B                       1293 00170$:
                                   1294 ;	./../../mib/stm8s_mib_vsprintf.c: 313: --fmt;
      00AF9B 5A               [ 2] 1295 	decw	x
      00AF9C 1F 24            [ 2] 1296 	ldw	(0x24, sp), x
                                   1297 ;	./../../mib/stm8s_mib_vsprintf.c: 314: continue;
      00AF9E 20 77            [ 2] 1298 	jra	00179$
                                   1299 ;	./../../mib/stm8s_mib_vsprintf.c: 315: }
      00AFA0                       1300 00172$:
                                   1301 ;	./../../mib/stm8s_mib_vsprintf.c: 317: if (qualifier == 'l')
      00AFA0 1E 03            [ 2] 1302 	ldw	x, (0x03, sp)
      00AFA2 A3 00 6C         [ 2] 1303 	cpw	x, #0x006c
      00AFA5 26 1A            [ 1] 1304 	jrne	00177$
      00AFA7 1E 01            [ 2] 1305 	ldw	x, (0x01, sp)
      00AFA9 26 16            [ 1] 1306 	jrne	00177$
                                   1307 ;	./../../mib/stm8s_mib_vsprintf.c: 318: num = va_arg(args, MMUINT); // MMULONG); // test ok..
      00AFAB 1E 26            [ 2] 1308 	ldw	x, (0x26, sp)
      00AFAD 1C 00 04         [ 2] 1309 	addw	x, #0x0004
      00AFB0 1F 26            [ 2] 1310 	ldw	(0x26, sp), x
      00AFB2 1D 00 04         [ 2] 1311 	subw	x, #0x0004
      00AFB5 90 93            [ 1] 1312 	ldw	y, x
      00AFB7 90 EE 02         [ 2] 1313 	ldw	y, (0x2, y)
      00AFBA FE               [ 2] 1314 	ldw	x, (x)
      00AFBB 17 03            [ 2] 1315 	ldw	(0x03, sp), y
      00AFBD 1F 01            [ 2] 1316 	ldw	(0x01, sp), x
      00AFBF 20 2B            [ 2] 1317 	jra	00178$
      00AFC1                       1318 00177$:
                                   1319 ;	./../../mib/stm8s_mib_vsprintf.c: 328: else if (flags & SIGN)
      00AFC1 7B 0C            [ 1] 1320 	ld	a, (0x0c, sp)
      00AFC3 A5 02            [ 1] 1321 	bcp	a, #0x02
      00AFC5 27 17            [ 1] 1322 	jreq	00174$
                                   1323 ;	./../../mib/stm8s_mib_vsprintf.c: 329: num = va_arg(args, MMAINT); // test ok...
      00AFC7 1E 26            [ 2] 1324 	ldw	x, (0x26, sp)
      00AFC9 5C               [ 1] 1325 	incw	x
      00AFCA 5C               [ 1] 1326 	incw	x
      00AFCB 1F 26            [ 2] 1327 	ldw	(0x26, sp), x
      00AFCD 5A               [ 2] 1328 	decw	x
      00AFCE 5A               [ 2] 1329 	decw	x
      00AFCF FE               [ 2] 1330 	ldw	x, (x)
      00AFD0 1F 03            [ 2] 1331 	ldw	(0x03, sp), x
      00AFD2 7B 03            [ 1] 1332 	ld	a, (0x03, sp)
      00AFD4 49               [ 1] 1333 	rlc	a
      00AFD5 4F               [ 1] 1334 	clr	a
      00AFD6 A2 00            [ 1] 1335 	sbc	a, #0x00
      00AFD8 6B 02            [ 1] 1336 	ld	(0x02, sp), a
      00AFDA 6B 01            [ 1] 1337 	ld	(0x01, sp), a
      00AFDC 20 0E            [ 2] 1338 	jra	00178$
      00AFDE                       1339 00174$:
                                   1340 ;	./../../mib/stm8s_mib_vsprintf.c: 331: num = va_arg(args, MMAUINT);
      00AFDE 1E 26            [ 2] 1341 	ldw	x, (0x26, sp)
      00AFE0 5C               [ 1] 1342 	incw	x
      00AFE1 5C               [ 1] 1343 	incw	x
      00AFE2 1F 26            [ 2] 1344 	ldw	(0x26, sp), x
      00AFE4 5A               [ 2] 1345 	decw	x
      00AFE5 5A               [ 2] 1346 	decw	x
      00AFE6 FE               [ 2] 1347 	ldw	x, (x)
      00AFE7 1F 03            [ 2] 1348 	ldw	(0x03, sp), x
      00AFE9 5F               [ 1] 1349 	clrw	x
      00AFEA 1F 01            [ 2] 1350 	ldw	(0x01, sp), x
      00AFEC                       1351 00178$:
                                   1352 ;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
      00AFEC 1E 0B            [ 2] 1353 	ldw	x, (0x0b, sp)
      00AFEE 89               [ 2] 1354 	pushw	x
      00AFEF 1E 0B            [ 2] 1355 	ldw	x, (0x0b, sp)
      00AFF1 89               [ 2] 1356 	pushw	x
      00AFF2 1E 1C            [ 2] 1357 	ldw	x, (0x1c, sp)
      00AFF4 89               [ 2] 1358 	pushw	x
      00AFF5 1E 1C            [ 2] 1359 	ldw	x, (0x1c, sp)
      00AFF7 89               [ 2] 1360 	pushw	x
      00AFF8 1E 28            [ 2] 1361 	ldw	x, (0x28, sp)
      00AFFA 89               [ 2] 1362 	pushw	x
      00AFFB 1E 28            [ 2] 1363 	ldw	x, (0x28, sp)
      00AFFD 89               [ 2] 1364 	pushw	x
      00AFFE 1E 13            [ 2] 1365 	ldw	x, (0x13, sp)
      00B000 89               [ 2] 1366 	pushw	x
      00B001 1E 13            [ 2] 1367 	ldw	x, (0x13, sp)
      00B003 89               [ 2] 1368 	pushw	x
      00B004 1E 13            [ 2] 1369 	ldw	x, (0x13, sp)
      00B006 89               [ 2] 1370 	pushw	x
      00B007 1E 13            [ 2] 1371 	ldw	x, (0x13, sp)
      00B009 89               [ 2] 1372 	pushw	x
      00B00A 1E 30            [ 2] 1373 	ldw	x, (0x30, sp)
      00B00C CD A8 F7         [ 4] 1374 	call	_number
      00B00F 1F 1C            [ 2] 1375 	ldw	(0x1c, sp), x
                                   1376 ;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
      00B011 20 04            [ 2] 1377 	jra	00179$
                                   1378 ;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
      00B013                       1379 00237$:
      00B013 16 18            [ 2] 1380 	ldw	y, (0x18, sp)
      00B015 17 1C            [ 2] 1381 	ldw	(0x1c, sp), y
                                   1382 ;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
                                   1383 ;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
      00B017                       1384 00240$:
      00B017                       1385 00179$:
                                   1386 ;	./../../mib/stm8s_mib_vsprintf.c: 188: for (str = buf; *fmt; fmt++)
      00B017 1E 24            [ 2] 1387 	ldw	x, (0x24, sp)
      00B019 5C               [ 1] 1388 	incw	x
      00B01A 1F 24            [ 2] 1389 	ldw	(0x24, sp), x
      00B01C CC AC 19         [ 2] 1390 	jp	00185$
      00B01F                       1391 00180$:
                                   1392 ;	./../../mib/stm8s_mib_vsprintf.c: 336: *str = '\0';
      00B01F 1E 1C            [ 2] 1393 	ldw	x, (0x1c, sp)
      00B021 7F               [ 1] 1394 	clr	(x)
                                   1395 ;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
      00B022 1E 1C            [ 2] 1396 	ldw	x, (0x1c, sp)
      00B024 72 F0 1A         [ 2] 1397 	subw	x, (0x1a, sp)
                                   1398 ;	./../../mib/stm8s_mib_vsprintf.c: 338: }
      00B027 16 22            [ 2] 1399 	ldw	y, (34, sp)
      00B029 5B 27            [ 2] 1400 	addw	sp, #39
      00B02B 90 FC            [ 2] 1401 	jp	(y)
                                   1402 ;	./../../mib/stm8s_mib_vsprintf.c: 342: MMRINT mib_vsprintf(char *vpBuffer,char *format, ...)
                                   1403 ;	-----------------------------------------
                                   1404 ;	 function mib_vsprintf
                                   1405 ;	-----------------------------------------
      00B02D                       1406 _mib_vsprintf:
                                   1407 ;	./../../mib/stm8s_mib_vsprintf.c: 347: va_start(ap, format);
      00B02D 96               [ 1] 1408 	ldw	x, sp
      00B02E 1C 00 07         [ 2] 1409 	addw	x, #7
                                   1410 ;	./../../mib/stm8s_mib_vsprintf.c: 348: rc = mm_vsprintf(vpBuffer, format, ap);
      00B031 89               [ 2] 1411 	pushw	x
      00B032 1E 07            [ 2] 1412 	ldw	x, (0x07, sp)
      00B034 89               [ 2] 1413 	pushw	x
      00B035 1E 07            [ 2] 1414 	ldw	x, (0x07, sp)
      00B037 CD AB F9         [ 4] 1415 	call	_mm_vsprintf
                                   1416 ;	./../../mib/stm8s_mib_vsprintf.c: 351: return (rc);
                                   1417 ;	./../../mib/stm8s_mib_vsprintf.c: 352: }
      00B03A 81               [ 4] 1418 	ret
                                   1419 ;	./../../mib/stm8s_mib_vsprintf.c: 363: MMRINT mib_printf(char *format, ...)
                                   1420 ;	-----------------------------------------
                                   1421 ;	 function mib_printf
                                   1422 ;	-----------------------------------------
      00B03B                       1423 _mib_printf:
      00B03B 52 82            [ 2] 1424 	sub	sp, #130
                                   1425 ;	./../../mib/stm8s_mib_vsprintf.c: 370: va_start(ap, format);
                                   1426 ;	./../../mib/stm8s_mib_vsprintf.c: 371: rc = mm_vsprintf(buffer, format, ap);
      00B03D 96               [ 1] 1427 	ldw	x, sp
      00B03E 1C 00 87         [ 2] 1428 	addw	x, #135
      00B041 89               [ 2] 1429 	pushw	x
      00B042 1E 87            [ 2] 1430 	ldw	x, (0x87, sp)
      00B044 89               [ 2] 1431 	pushw	x
      00B045 96               [ 1] 1432 	ldw	x, sp
      00B046 1C 00 05         [ 2] 1433 	addw	x, #5
      00B049 CD AB F9         [ 4] 1434 	call	_mm_vsprintf
      00B04C 1F 81            [ 2] 1435 	ldw	(0x81, sp), x
                                   1436 ;	./../../mib/stm8s_mib_vsprintf.c: 374: v_pString = (char *)buffer;
      00B04E 96               [ 1] 1437 	ldw	x, sp
      00B04F 5C               [ 1] 1438 	incw	x
                                   1439 ;	./../../mib/stm8s_mib_vsprintf.c: 375: while (*v_pString != 0)	MibWriteDebugByte((uint8_t)*v_pString++);
      00B050                       1440 00101$:
      00B050 F6               [ 1] 1441 	ld	a, (x)
      00B051 27 08            [ 1] 1442 	jreq	00103$
      00B053 5C               [ 1] 1443 	incw	x
      00B054 89               [ 2] 1444 	pushw	x
      00B055 CD A6 02         [ 4] 1445 	call	_MibWriteDebugByte
      00B058 85               [ 2] 1446 	popw	x
      00B059 20 F5            [ 2] 1447 	jra	00101$
      00B05B                       1448 00103$:
                                   1449 ;	./../../mib/stm8s_mib_vsprintf.c: 376: return (rc);
      00B05B 1E 81            [ 2] 1450 	ldw	x, (0x81, sp)
                                   1451 ;	./../../mib/stm8s_mib_vsprintf.c: 377: }
      00B05D 5B 82            [ 2] 1452 	addw	sp, #130
      00B05F 81               [ 4] 1453 	ret
                                   1454 	.area CODE
                                   1455 	.area CONST
                                   1456 	.area CONST
      008C07                       1457 ___str_1:
      008C07 30 31 32 33 34 35 36  1458 	.ascii "0123456789abcdefghijklmnopqrstuvwxyz"
             37 38 39 61 62 63 64
             65 66 67 68 69 6A 6B
             6C 6D 6E 6F 70 71 72
             73 74 75 76 77 78 79
             7A
      008C2B 00                    1459 	.db 0x00
                                   1460 	.area CODE
                                   1461 	.area CONST
      008C2C                       1462 ___str_2:
      008C2C 30 31 32 33 34 35 36  1463 	.ascii "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
             37 38 39 41 42 43 44
             45 46 47 48 49 4A 4B
             4C 4D 4E 4F 50 51 52
             53 54 55 56 57 58 59
             5A
      008C50 00                    1464 	.db 0x00
                                   1465 	.area CODE
                                   1466 	.area INITIALIZER
      009215                       1467 __xinit__digits:
      009215 8C 07                 1468 	.dw ___str_1
      009217                       1469 __xinit__upper_digits:
      009217 8C 2C                 1470 	.dw ___str_2
                                   1471 	.area CABS (ABS)
