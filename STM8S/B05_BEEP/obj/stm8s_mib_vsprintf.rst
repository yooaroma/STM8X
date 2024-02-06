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
      0097F6                         60 _strnlen:
      0097F6 52 06            [ 2]   61 	sub	sp, #6
      0097F8 1F 03            [ 2]   62 	ldw	(0x03, sp), x
                                     63 ;	./../../mib/stm8s_mib_vsprintf.c: 74: for (sc = s; *sc != '\0' && count--; ++sc);
      0097FA 16 09            [ 2]   64 	ldw	y, (0x09, sp)
      0097FC 17 05            [ 2]   65 	ldw	(0x05, sp), y
      0097FE 1E 03            [ 2]   66 	ldw	x, (0x03, sp)
      009800                         67 00104$:
      009800 F6               [ 1]   68 	ld	a, (x)
      009801 27 11            [ 1]   69 	jreq	00101$
      009803 16 05            [ 2]   70 	ldw	y, (0x05, sp)
      009805 17 01            [ 2]   71 	ldw	(0x01, sp), y
      009807 16 05            [ 2]   72 	ldw	y, (0x05, sp)
      009809 90 5A            [ 2]   73 	decw	y
      00980B 17 05            [ 2]   74 	ldw	(0x05, sp), y
      00980D 16 01            [ 2]   75 	ldw	y, (0x01, sp)
      00980F 27 03            [ 1]   76 	jreq	00101$
      009811 5C               [ 1]   77 	incw	x
      009812 20 EC            [ 2]   78 	jra	00104$
      009814                         79 00101$:
                                     80 ;	./../../mib/stm8s_mib_vsprintf.c: 75: return sc - s;
      009814 72 F0 03         [ 2]   81 	subw	x, (0x03, sp)
                                     82 ;	./../../mib/stm8s_mib_vsprintf.c: 76: }
      009817 5B 06            [ 2]   83 	addw	sp, #6
      009819 90 85            [ 2]   84 	popw	y
      00981B 5B 02            [ 2]   85 	addw	sp, #2
      00981D 90 FC            [ 2]   86 	jp	(y)
                                     87 ;	./../../mib/stm8s_mib_vsprintf.c: 81: static MMINT skip_atoi(const char **s)
                                     88 ;	-----------------------------------------
                                     89 ;	 function skip_atoi
                                     90 ;	-----------------------------------------
      00981F                         91 _skip_atoi:
      00981F 52 08            [ 2]   92 	sub	sp, #8
      009821 1F 07            [ 2]   93 	ldw	(0x07, sp), x
                                     94 ;	./../../mib/stm8s_mib_vsprintf.c: 83: MMINT i = 0;
      009823 5F               [ 1]   95 	clrw	x
      009824 1F 05            [ 2]   96 	ldw	(0x05, sp), x
                                     97 ;	./../../mib/stm8s_mib_vsprintf.c: 84: while (is_digit(**s)) i = i*10 + *((*s)++) - '0';
      009826                         98 00102$:
      009826 16 07            [ 2]   99 	ldw	y, (0x07, sp)
      009828 90 FE            [ 2]  100 	ldw	y, (y)
      00982A 17 01            [ 2]  101 	ldw	(0x01, sp), y
      00982C 90 F6            [ 1]  102 	ld	a, (y)
      00982E A1 30            [ 1]  103 	cp	a, #0x30
      009830 25 41            [ 1]  104 	jrc	00104$
      009832 A1 39            [ 1]  105 	cp	a, #0x39
      009834 22 3D            [ 1]  106 	jrugt	00104$
      009836 16 05            [ 2]  107 	ldw	y, (0x05, sp)
      009838 90 89            [ 2]  108 	pushw	y
      00983A 89               [ 2]  109 	pushw	x
      00983B 4B 0A            [ 1]  110 	push	#0x0a
      00983D 5F               [ 1]  111 	clrw	x
      00983E 89               [ 2]  112 	pushw	x
      00983F 4B 00            [ 1]  113 	push	#0x00
      009841 CD B4 1D         [ 4]  114 	call	__mullong
      009844 5B 08            [ 2]  115 	addw	sp, #8
      009846 1F 05            [ 2]  116 	ldw	(0x05, sp), x
      009848 17 03            [ 2]  117 	ldw	(0x03, sp), y
      00984A 1E 01            [ 2]  118 	ldw	x, (0x01, sp)
      00984C 5C               [ 1]  119 	incw	x
      00984D 16 07            [ 2]  120 	ldw	y, (0x07, sp)
      00984F 90 FF            [ 2]  121 	ldw	(y), x
      009851 1E 01            [ 2]  122 	ldw	x, (0x01, sp)
      009853 F6               [ 1]  123 	ld	a, (x)
      009854 90 5F            [ 1]  124 	clrw	y
      009856 5F               [ 1]  125 	clrw	x
      009857 90 5D            [ 2]  126 	tnzw	y
      009859 2A 01            [ 1]  127 	jrpl	00124$
      00985B 5A               [ 2]  128 	decw	x
      00985C                        129 00124$:
      00985C 90 97            [ 1]  130 	ld	yl, a
      00985E 72 F9 05         [ 2]  131 	addw	y, (0x05, sp)
      009861 9F               [ 1]  132 	ld	a, xl
      009862 19 04            [ 1]  133 	adc	a, (0x04, sp)
      009864 02               [ 1]  134 	rlwa	x
      009865 19 03            [ 1]  135 	adc	a, (0x03, sp)
      009867 95               [ 1]  136 	ld	xh, a
      009868 72 A2 00 30      [ 2]  137 	subw	y, #0x0030
      00986C 17 05            [ 2]  138 	ldw	(0x05, sp), y
      00986E 24 B6            [ 1]  139 	jrnc	00102$
      009870 5A               [ 2]  140 	decw	x
      009871 20 B3            [ 2]  141 	jra	00102$
      009873                        142 00104$:
                                    143 ;	./../../mib/stm8s_mib_vsprintf.c: 85: return i;
      009873 51               [ 1]  144 	exgw	x, y
      009874 1E 05            [ 2]  145 	ldw	x, (0x05, sp)
                                    146 ;	./../../mib/stm8s_mib_vsprintf.c: 86: }
      009876 5B 08            [ 2]  147 	addw	sp, #8
      009878 81               [ 4]  148 	ret
                                    149 ;	./../../mib/stm8s_mib_vsprintf.c: 91: static char *number(char *str, MMLONG num, MMINT base, MMINT size, MMINT precision, MMINT type)
                                    150 ;	-----------------------------------------
                                    151 ;	 function number
                                    152 ;	-----------------------------------------
      009879                        153 _number:
      009879 52 62            [ 2]  154 	sub	sp, #98
      00987B 1F 5D            [ 2]  155 	ldw	(0x5d, sp), x
                                    156 ;	./../../mib/stm8s_mib_vsprintf.c: 94: char *dig = digits;
      00987D CE 01 5A         [ 2]  157 	ldw	x, _digits+0
      009880 1F 43            [ 2]  158 	ldw	(0x43, sp), x
                                    159 ;	./../../mib/stm8s_mib_vsprintf.c: 97: if (type & LARGE)  dig = upper_digits;
      009882 7B 78            [ 1]  160 	ld	a, (0x78, sp)
      009884 A5 40            [ 1]  161 	bcp	a, #0x40
      009886 27 05            [ 1]  162 	jreq	00102$
      009888 CE 01 5C         [ 2]  163 	ldw	x, _upper_digits+0
      00988B 1F 43            [ 2]  164 	ldw	(0x43, sp), x
      00988D                        165 00102$:
                                    166 ;	./../../mib/stm8s_mib_vsprintf.c: 98: if (type & LEFT) type &= ~ZEROPAD;
      00988D 7B 78            [ 1]  167 	ld	a, (0x78, sp)
      00988F A5 10            [ 1]  168 	bcp	a, #0x10
      009891 27 0A            [ 1]  169 	jreq	00104$
      009893 1E 77            [ 2]  170 	ldw	x, (0x77, sp)
      009895 54               [ 2]  171 	srlw	x
      009896 58               [ 2]  172 	sllw	x
      009897 16 75            [ 2]  173 	ldw	y, (0x75, sp)
      009899 1F 77            [ 2]  174 	ldw	(0x77, sp), x
      00989B 17 75            [ 2]  175 	ldw	(0x75, sp), y
      00989D                        176 00104$:
                                    177 ;	./../../mib/stm8s_mib_vsprintf.c: 99: if (base < 2 || base > 36) return 0;
      00989D 1E 6B            [ 2]  178 	ldw	x, (0x6b, sp)
      00989F A3 00 02         [ 2]  179 	cpw	x, #0x0002
      0098A2 7B 6A            [ 1]  180 	ld	a, (0x6a, sp)
      0098A4 A2 00            [ 1]  181 	sbc	a, #0x00
      0098A6 7B 69            [ 1]  182 	ld	a, (0x69, sp)
      0098A8 A2 00            [ 1]  183 	sbc	a, #0x00
      0098AA 2F 0D            [ 1]  184 	jrslt	00105$
      0098AC AE 00 24         [ 2]  185 	ldw	x, #0x0024
      0098AF 13 6B            [ 2]  186 	cpw	x, (0x6b, sp)
      0098B1 4F               [ 1]  187 	clr	a
      0098B2 12 6A            [ 1]  188 	sbc	a, (0x6a, sp)
      0098B4 4F               [ 1]  189 	clr	a
      0098B5 12 69            [ 1]  190 	sbc	a, (0x69, sp)
      0098B7 2E 04            [ 1]  191 	jrsge	00106$
      0098B9                        192 00105$:
      0098B9 5F               [ 1]  193 	clrw	x
      0098BA CC 9B 75         [ 2]  194 	jp	00161$
      0098BD                        195 00106$:
                                    196 ;	./../../mib/stm8s_mib_vsprintf.c: 101: c = (type & ZEROPAD) ? '0' : ' ';
      0098BD 7B 78            [ 1]  197 	ld	a, (0x78, sp)
      0098BF 44               [ 1]  198 	srl	a
      0098C0 24 03            [ 1]  199 	jrnc	00163$
      0098C2 A6 30            [ 1]  200 	ld	a, #0x30
      0098C4 C5                     201 	.byte 0xc5
      0098C5                        202 00163$:
      0098C5 A6 20            [ 1]  203 	ld	a, #0x20
      0098C7                        204 00164$:
      0098C7 6B 45            [ 1]  205 	ld	(0x45, sp), a
                                    206 ;	./../../mib/stm8s_mib_vsprintf.c: 102: sign = 0;
      0098C9 0F 46            [ 1]  207 	clr	(0x46, sp)
                                    208 ;	./../../mib/stm8s_mib_vsprintf.c: 103: if (type & SIGN)
      0098CB 7B 78            [ 1]  209 	ld	a, (0x78, sp)
      0098CD A5 02            [ 1]  210 	bcp	a, #0x02
      0098CF 27 52            [ 1]  211 	jreq	00117$
                                    212 ;	./../../mib/stm8s_mib_vsprintf.c: 109: size--;
      0098D1 16 6F            [ 2]  213 	ldw	y, (0x6f, sp)
      0098D3 72 A2 00 01      [ 2]  214 	subw	y, #0x0001
      0098D7 1E 6D            [ 2]  215 	ldw	x, (0x6d, sp)
      0098D9 24 01            [ 1]  216 	jrnc	00330$
      0098DB 5A               [ 2]  217 	decw	x
      0098DC                        218 00330$:
      0098DC 1F 57            [ 2]  219 	ldw	(0x57, sp), x
                                    220 ;	./../../mib/stm8s_mib_vsprintf.c: 105: if (num < 0)
      0098DE 0D 65            [ 1]  221 	tnz	(0x65, sp)
      0098E0 2A 1F            [ 1]  222 	jrpl	00114$
                                    223 ;	./../../mib/stm8s_mib_vsprintf.c: 107: sign = '-';
      0098E2 A6 2D            [ 1]  224 	ld	a, #0x2d
      0098E4 6B 46            [ 1]  225 	ld	(0x46, sp), a
                                    226 ;	./../../mib/stm8s_mib_vsprintf.c: 108: num = -num;
      0098E6 1E 67            [ 2]  227 	ldw	x, (0x67, sp)
      0098E8 50               [ 2]  228 	negw	x
      0098E9 4F               [ 1]  229 	clr	a
      0098EA 12 66            [ 1]  230 	sbc	a, (0x66, sp)
      0098EC 6B 60            [ 1]  231 	ld	(0x60, sp), a
      0098EE 4F               [ 1]  232 	clr	a
      0098EF 12 65            [ 1]  233 	sbc	a, (0x65, sp)
      0098F1 1F 67            [ 2]  234 	ldw	(0x67, sp), x
      0098F3 6B 65            [ 1]  235 	ld	(0x65, sp), a
      0098F5 7B 60            [ 1]  236 	ld	a, (0x60, sp)
      0098F7 6B 66            [ 1]  237 	ld	(0x66, sp), a
                                    238 ;	./../../mib/stm8s_mib_vsprintf.c: 109: size--;
      0098F9 17 6F            [ 2]  239 	ldw	(0x6f, sp), y
      0098FB 16 57            [ 2]  240 	ldw	y, (0x57, sp)
      0098FD 17 6D            [ 2]  241 	ldw	(0x6d, sp), y
      0098FF 20 22            [ 2]  242 	jra	00117$
      009901                        243 00114$:
                                    244 ;	./../../mib/stm8s_mib_vsprintf.c: 111: else if (type & PLUS)
      009901 7B 78            [ 1]  245 	ld	a, (0x78, sp)
      009903 A5 04            [ 1]  246 	bcp	a, #0x04
      009905 27 0C            [ 1]  247 	jreq	00111$
                                    248 ;	./../../mib/stm8s_mib_vsprintf.c: 113: sign = '+';
      009907 A6 2B            [ 1]  249 	ld	a, #0x2b
      009909 6B 46            [ 1]  250 	ld	(0x46, sp), a
                                    251 ;	./../../mib/stm8s_mib_vsprintf.c: 114: size--;
      00990B 17 6F            [ 2]  252 	ldw	(0x6f, sp), y
      00990D 16 57            [ 2]  253 	ldw	y, (0x57, sp)
      00990F 17 6D            [ 2]  254 	ldw	(0x6d, sp), y
      009911 20 10            [ 2]  255 	jra	00117$
      009913                        256 00111$:
                                    257 ;	./../../mib/stm8s_mib_vsprintf.c: 116: else if (type & SPACE)
      009913 7B 78            [ 1]  258 	ld	a, (0x78, sp)
      009915 A5 08            [ 1]  259 	bcp	a, #0x08
      009917 27 0A            [ 1]  260 	jreq	00117$
                                    261 ;	./../../mib/stm8s_mib_vsprintf.c: 118: sign = ' ';
      009919 A6 20            [ 1]  262 	ld	a, #0x20
      00991B 6B 46            [ 1]  263 	ld	(0x46, sp), a
                                    264 ;	./../../mib/stm8s_mib_vsprintf.c: 119: size--;
      00991D 17 6F            [ 2]  265 	ldw	(0x6f, sp), y
      00991F 16 57            [ 2]  266 	ldw	y, (0x57, sp)
      009921 17 6D            [ 2]  267 	ldw	(0x6d, sp), y
      009923                        268 00117$:
                                    269 ;	./../../mib/stm8s_mib_vsprintf.c: 123: if (type & SPECIAL)
      009923 7B 78            [ 1]  270 	ld	a, (0x78, sp)
      009925 A4 20            [ 1]  271 	and	a, #0x20
      009927 6B 4A            [ 1]  272 	ld	(0x4a, sp), a
      009929 5F               [ 1]  273 	clrw	x
      00992A 1F 48            [ 2]  274 	ldw	(0x48, sp), x
      00992C 0F 47            [ 1]  275 	clr	(0x47, sp)
                                    276 ;	./../../mib/stm8s_mib_vsprintf.c: 125: if (base == 16)
      00992E 1E 6B            [ 2]  277 	ldw	x, (0x6b, sp)
      009930 A3 00 10         [ 2]  278 	cpw	x, #0x0010
      009933 26 09            [ 1]  279 	jrne	00335$
      009935 1E 69            [ 2]  280 	ldw	x, (0x69, sp)
      009937 26 05            [ 1]  281 	jrne	00335$
      009939 A6 01            [ 1]  282 	ld	a, #0x01
      00993B 6B 4B            [ 1]  283 	ld	(0x4b, sp), a
      00993D C5                     284 	.byte 0xc5
      00993E                        285 00335$:
      00993E 0F 4B            [ 1]  286 	clr	(0x4b, sp)
      009940                        287 00336$:
                                    288 ;	./../../mib/stm8s_mib_vsprintf.c: 127: else if (base == 8)
      009940 1E 6B            [ 2]  289 	ldw	x, (0x6b, sp)
      009942 A3 00 08         [ 2]  290 	cpw	x, #0x0008
      009945 26 09            [ 1]  291 	jrne	00338$
      009947 1E 69            [ 2]  292 	ldw	x, (0x69, sp)
      009949 26 05            [ 1]  293 	jrne	00338$
      00994B A6 01            [ 1]  294 	ld	a, #0x01
      00994D 6B 4C            [ 1]  295 	ld	(0x4c, sp), a
      00994F C5                     296 	.byte 0xc5
      009950                        297 00338$:
      009950 0F 4C            [ 1]  298 	clr	(0x4c, sp)
      009952                        299 00339$:
                                    300 ;	./../../mib/stm8s_mib_vsprintf.c: 123: if (type & SPECIAL)
      009952 1E 49            [ 2]  301 	ldw	x, (0x49, sp)
      009954 26 04            [ 1]  302 	jrne	00340$
      009956 1E 47            [ 2]  303 	ldw	x, (0x47, sp)
      009958 27 28            [ 1]  304 	jreq	00124$
      00995A                        305 00340$:
                                    306 ;	./../../mib/stm8s_mib_vsprintf.c: 125: if (base == 16)
      00995A 0D 4B            [ 1]  307 	tnz	(0x4b, sp)
      00995C 27 11            [ 1]  308 	jreq	00121$
                                    309 ;	./../../mib/stm8s_mib_vsprintf.c: 126: size -= 2;
      00995E 1E 6F            [ 2]  310 	ldw	x, (0x6f, sp)
      009960 1D 00 02         [ 2]  311 	subw	x, #0x0002
      009963 16 6D            [ 2]  312 	ldw	y, (0x6d, sp)
      009965 24 02            [ 1]  313 	jrnc	00342$
      009967 90 5A            [ 2]  314 	decw	y
      009969                        315 00342$:
      009969 1F 6F            [ 2]  316 	ldw	(0x6f, sp), x
      00996B 17 6D            [ 2]  317 	ldw	(0x6d, sp), y
      00996D 20 13            [ 2]  318 	jra	00124$
      00996F                        319 00121$:
                                    320 ;	./../../mib/stm8s_mib_vsprintf.c: 127: else if (base == 8)
      00996F 0D 4C            [ 1]  321 	tnz	(0x4c, sp)
      009971 27 0F            [ 1]  322 	jreq	00124$
                                    323 ;	./../../mib/stm8s_mib_vsprintf.c: 128: size--;
      009973 1E 6F            [ 2]  324 	ldw	x, (0x6f, sp)
      009975 1D 00 01         [ 2]  325 	subw	x, #0x0001
      009978 16 6D            [ 2]  326 	ldw	y, (0x6d, sp)
      00997A 24 02            [ 1]  327 	jrnc	00344$
      00997C 90 5A            [ 2]  328 	decw	y
      00997E                        329 00344$:
      00997E 1F 6F            [ 2]  330 	ldw	(0x6f, sp), x
      009980 17 6D            [ 2]  331 	ldw	(0x6d, sp), y
      009982                        332 00124$:
                                    333 ;	./../../mib/stm8s_mib_vsprintf.c: 133: if (num == 0)
      009982 1E 67            [ 2]  334 	ldw	x, (0x67, sp)
      009984 26 10            [ 1]  335 	jrne	00178$
                                    336 ;	./../../mib/stm8s_mib_vsprintf.c: 134: tmp[i++] = '0';
      009986 1E 65            [ 2]  337 	ldw	x, (0x65, sp)
      009988 26 0C            [ 1]  338 	jrne	00178$
      00998A 5C               [ 1]  339 	incw	x
      00998B 1F 59            [ 2]  340 	ldw	(0x59, sp), x
      00998D 5F               [ 1]  341 	clrw	x
      00998E 1F 57            [ 2]  342 	ldw	(0x57, sp), x
      009990 A6 30            [ 1]  343 	ld	a, #0x30
      009992 6B 01            [ 1]  344 	ld	(0x01, sp), a
      009994 20 70            [ 2]  345 	jra	00130$
                                    346 ;	./../../mib/stm8s_mib_vsprintf.c: 137: while (num != 0)
      009996                        347 00178$:
      009996 5F               [ 1]  348 	clrw	x
      009997 1F 61            [ 2]  349 	ldw	(0x61, sp), x
      009999 1F 5F            [ 2]  350 	ldw	(0x5f, sp), x
      00999B                        351 00125$:
      00999B 1E 67            [ 2]  352 	ldw	x, (0x67, sp)
      00999D 26 04            [ 1]  353 	jrne	00347$
      00999F 1E 65            [ 2]  354 	ldw	x, (0x65, sp)
      0099A1 27 5B            [ 1]  355 	jreq	00194$
      0099A3                        356 00347$:
                                    357 ;	./../../mib/stm8s_mib_vsprintf.c: 139: tmp[i++] = dig[((MMULONG) num) % (MMUSIGN) base];
      0099A3 16 61            [ 2]  358 	ldw	y, (0x61, sp)
      0099A5 17 59            [ 2]  359 	ldw	(0x59, sp), y
      0099A7 16 5F            [ 2]  360 	ldw	y, (0x5f, sp)
      0099A9 17 57            [ 2]  361 	ldw	(0x57, sp), y
      0099AB 1E 61            [ 2]  362 	ldw	x, (0x61, sp)
      0099AD 5C               [ 1]  363 	incw	x
      0099AE 1F 61            [ 2]  364 	ldw	(0x61, sp), x
      0099B0 26 05            [ 1]  365 	jrne	00348$
      0099B2 1E 5F            [ 2]  366 	ldw	x, (0x5f, sp)
      0099B4 5C               [ 1]  367 	incw	x
      0099B5 1F 5F            [ 2]  368 	ldw	(0x5f, sp), x
      0099B7                        369 00348$:
      0099B7 96               [ 1]  370 	ldw	x, sp
      0099B8 5C               [ 1]  371 	incw	x
      0099B9 72 FB 59         [ 2]  372 	addw	x, (0x59, sp)
      0099BC 1F 4D            [ 2]  373 	ldw	(0x4d, sp), x
      0099BE 16 65            [ 2]  374 	ldw	y, (0x65, sp)
      0099C0 17 4F            [ 2]  375 	ldw	(0x4f, sp), y
      0099C2 16 67            [ 2]  376 	ldw	y, (0x67, sp)
      0099C4 1E 6B            [ 2]  377 	ldw	x, (0x6b, sp)
      0099C6 1F 55            [ 2]  378 	ldw	(0x55, sp), x
      0099C8 5F               [ 1]  379 	clrw	x
      0099C9 1F 53            [ 2]  380 	ldw	(0x53, sp), x
      0099CB 90 89            [ 2]  381 	pushw	y
      0099CD 1E 57            [ 2]  382 	ldw	x, (0x57, sp)
      0099CF 89               [ 2]  383 	pushw	x
      0099D0 1E 57            [ 2]  384 	ldw	x, (0x57, sp)
      0099D2 89               [ 2]  385 	pushw	x
      0099D3 90 89            [ 2]  386 	pushw	y
      0099D5 1E 57            [ 2]  387 	ldw	x, (0x57, sp)
      0099D7 89               [ 2]  388 	pushw	x
      0099D8 CD B2 3B         [ 4]  389 	call	__modulong
      0099DB 5B 08            [ 2]  390 	addw	sp, #8
      0099DD 17 59            [ 2]  391 	ldw	(0x59, sp), y
      0099DF 90 85            [ 2]  392 	popw	y
      0099E1 72 FB 43         [ 2]  393 	addw	x, (0x43, sp)
      0099E4 F6               [ 1]  394 	ld	a, (x)
      0099E5 1E 4D            [ 2]  395 	ldw	x, (0x4d, sp)
      0099E7 F7               [ 1]  396 	ld	(x), a
                                    397 ;	./../../mib/stm8s_mib_vsprintf.c: 140: num = ((MMULONG) num) / (MMUSIGN) base;
      0099E8 1E 55            [ 2]  398 	ldw	x, (0x55, sp)
      0099EA 89               [ 2]  399 	pushw	x
      0099EB 1E 55            [ 2]  400 	ldw	x, (0x55, sp)
      0099ED 89               [ 2]  401 	pushw	x
      0099EE 90 89            [ 2]  402 	pushw	y
      0099F0 1E 55            [ 2]  403 	ldw	x, (0x55, sp)
      0099F2 89               [ 2]  404 	pushw	x
      0099F3 CD B2 EB         [ 4]  405 	call	__divulong
      0099F6 5B 08            [ 2]  406 	addw	sp, #8
      0099F8 1F 67            [ 2]  407 	ldw	(0x67, sp), x
      0099FA 17 65            [ 2]  408 	ldw	(0x65, sp), y
      0099FC 20 9D            [ 2]  409 	jra	00125$
      0099FE                        410 00194$:
      0099FE 16 61            [ 2]  411 	ldw	y, (0x61, sp)
      009A00 17 59            [ 2]  412 	ldw	(0x59, sp), y
      009A02 16 5F            [ 2]  413 	ldw	y, (0x5f, sp)
      009A04 17 57            [ 2]  414 	ldw	(0x57, sp), y
      009A06                        415 00130$:
                                    416 ;	./../../mib/stm8s_mib_vsprintf.c: 144: if (i > precision) precision = i;
      009A06 1E 73            [ 2]  417 	ldw	x, (0x73, sp)
      009A08 13 59            [ 2]  418 	cpw	x, (0x59, sp)
      009A0A 7B 72            [ 1]  419 	ld	a, (0x72, sp)
      009A0C 12 58            [ 1]  420 	sbc	a, (0x58, sp)
      009A0E 7B 71            [ 1]  421 	ld	a, (0x71, sp)
      009A10 12 57            [ 1]  422 	sbc	a, (0x57, sp)
      009A12 2E 08            [ 1]  423 	jrsge	00132$
      009A14 16 59            [ 2]  424 	ldw	y, (0x59, sp)
      009A16 17 73            [ 2]  425 	ldw	(0x73, sp), y
      009A18 16 57            [ 2]  426 	ldw	y, (0x57, sp)
      009A1A 17 71            [ 2]  427 	ldw	(0x71, sp), y
      009A1C                        428 00132$:
                                    429 ;	./../../mib/stm8s_mib_vsprintf.c: 145: size -= precision;
      009A1C 16 6F            [ 2]  430 	ldw	y, (0x6f, sp)
      009A1E 72 F2 73         [ 2]  431 	subw	y, (0x73, sp)
      009A21 7B 6E            [ 1]  432 	ld	a, (0x6e, sp)
      009A23 12 72            [ 1]  433 	sbc	a, (0x72, sp)
      009A25 97               [ 1]  434 	ld	xl, a
      009A26 7B 6D            [ 1]  435 	ld	a, (0x6d, sp)
      009A28 12 71            [ 1]  436 	sbc	a, (0x71, sp)
      009A2A 95               [ 1]  437 	ld	xh, a
      009A2B 17 6F            [ 2]  438 	ldw	(0x6f, sp), y
      009A2D 1F 6D            [ 2]  439 	ldw	(0x6d, sp), x
                                    440 ;	./../../mib/stm8s_mib_vsprintf.c: 146: if (!(type & (ZEROPAD | LEFT))) while (size-- > 0) *str++ = ' ';
      009A2F 7B 78            [ 1]  441 	ld	a, (0x78, sp)
      009A31 A5 11            [ 1]  442 	bcp	a, #0x11
      009A33 26 34            [ 1]  443 	jrne	00137$
      009A35 16 6F            [ 2]  444 	ldw	y, (0x6f, sp)
      009A37 17 61            [ 2]  445 	ldw	(0x61, sp), y
      009A39 16 6D            [ 2]  446 	ldw	y, (0x6d, sp)
      009A3B                        447 00133$:
      009A3B 17 53            [ 2]  448 	ldw	(0x53, sp), y
      009A3D 1E 61            [ 2]  449 	ldw	x, (0x61, sp)
      009A3F 1F 55            [ 2]  450 	ldw	(0x55, sp), x
      009A41 1E 61            [ 2]  451 	ldw	x, (0x61, sp)
      009A43 1D 00 01         [ 2]  452 	subw	x, #0x0001
      009A46 1F 61            [ 2]  453 	ldw	(0x61, sp), x
      009A48 24 02            [ 1]  454 	jrnc	00351$
      009A4A 90 5A            [ 2]  455 	decw	y
      009A4C                        456 00351$:
      009A4C 5F               [ 1]  457 	clrw	x
      009A4D 13 55            [ 2]  458 	cpw	x, (0x55, sp)
      009A4F 4F               [ 1]  459 	clr	a
      009A50 12 54            [ 1]  460 	sbc	a, (0x54, sp)
      009A52 4F               [ 1]  461 	clr	a
      009A53 12 53            [ 1]  462 	sbc	a, (0x53, sp)
      009A55 2E 0C            [ 1]  463 	jrsge	00195$
      009A57 1E 5D            [ 2]  464 	ldw	x, (0x5d, sp)
      009A59 A6 20            [ 1]  465 	ld	a, #0x20
      009A5B F7               [ 1]  466 	ld	(x), a
      009A5C 1E 5D            [ 2]  467 	ldw	x, (0x5d, sp)
      009A5E 5C               [ 1]  468 	incw	x
      009A5F 1F 5D            [ 2]  469 	ldw	(0x5d, sp), x
      009A61 20 D8            [ 2]  470 	jra	00133$
      009A63                        471 00195$:
      009A63 17 6D            [ 2]  472 	ldw	(0x6d, sp), y
      009A65 16 61            [ 2]  473 	ldw	y, (0x61, sp)
      009A67 17 6F            [ 2]  474 	ldw	(0x6f, sp), y
      009A69                        475 00137$:
                                    476 ;	./../../mib/stm8s_mib_vsprintf.c: 147: if (sign) *str++ = sign;
      009A69 0D 46            [ 1]  477 	tnz	(0x46, sp)
      009A6B 27 0A            [ 1]  478 	jreq	00139$
      009A6D 1E 5D            [ 2]  479 	ldw	x, (0x5d, sp)
      009A6F 7B 46            [ 1]  480 	ld	a, (0x46, sp)
      009A71 F7               [ 1]  481 	ld	(x), a
      009A72 1E 5D            [ 2]  482 	ldw	x, (0x5d, sp)
      009A74 5C               [ 1]  483 	incw	x
      009A75 1F 5D            [ 2]  484 	ldw	(0x5d, sp), x
      009A77                        485 00139$:
                                    486 ;	./../../mib/stm8s_mib_vsprintf.c: 149: if (type & SPECIAL)
      009A77 1E 49            [ 2]  487 	ldw	x, (0x49, sp)
      009A79 26 04            [ 1]  488 	jrne	00356$
      009A7B 1E 47            [ 2]  489 	ldw	x, (0x47, sp)
      009A7D 27 26            [ 1]  490 	jreq	00146$
      009A7F                        491 00356$:
                                    492 ;	./../../mib/stm8s_mib_vsprintf.c: 147: if (sign) *str++ = sign;
      009A7F 1E 5D            [ 2]  493 	ldw	x, (0x5d, sp)
      009A81 5C               [ 1]  494 	incw	x
                                    495 ;	./../../mib/stm8s_mib_vsprintf.c: 151: if (base == 8)
      009A82 0D 4C            [ 1]  496 	tnz	(0x4c, sp)
      009A84 27 0A            [ 1]  497 	jreq	00143$
                                    498 ;	./../../mib/stm8s_mib_vsprintf.c: 152: *str++ = '0';
      009A86 16 5D            [ 2]  499 	ldw	y, (0x5d, sp)
      009A88 A6 30            [ 1]  500 	ld	a, #0x30
      009A8A 90 F7            [ 1]  501 	ld	(y), a
      009A8C 1F 5D            [ 2]  502 	ldw	(0x5d, sp), x
      009A8E 20 15            [ 2]  503 	jra	00146$
      009A90                        504 00143$:
                                    505 ;	./../../mib/stm8s_mib_vsprintf.c: 153: else if (base == 16)
      009A90 0D 4B            [ 1]  506 	tnz	(0x4b, sp)
      009A92 27 11            [ 1]  507 	jreq	00146$
                                    508 ;	./../../mib/stm8s_mib_vsprintf.c: 155: *str++ = '0';
      009A94 16 5D            [ 2]  509 	ldw	y, (0x5d, sp)
      009A96 A6 30            [ 1]  510 	ld	a, #0x30
      009A98 90 F7            [ 1]  511 	ld	(y), a
                                    512 ;	./../../mib/stm8s_mib_vsprintf.c: 156: *str++ = digits[33];
      009A9A 90 CE 01 5A      [ 2]  513 	ldw	y, _digits+0
      009A9E 90 E6 21         [ 1]  514 	ld	a, (0x21, y)
      009AA1 F7               [ 1]  515 	ld	(x), a
      009AA2 5C               [ 1]  516 	incw	x
      009AA3 1F 5D            [ 2]  517 	ldw	(0x5d, sp), x
      009AA5                        518 00146$:
                                    519 ;	./../../mib/stm8s_mib_vsprintf.c: 160: if (!(type & LEFT)) while (size-- > 0) *str++ = c;
      009AA5 7B 78            [ 1]  520 	ld	a, (0x78, sp)
      009AA7 A5 10            [ 1]  521 	bcp	a, #0x10
      009AA9 26 3D            [ 1]  522 	jrne	00189$
      009AAB 16 6F            [ 2]  523 	ldw	y, (0x6f, sp)
      009AAD 17 61            [ 2]  524 	ldw	(0x61, sp), y
      009AAF 16 6D            [ 2]  525 	ldw	y, (0x6d, sp)
      009AB1 17 5F            [ 2]  526 	ldw	(0x5f, sp), y
      009AB3                        527 00147$:
      009AB3 16 61            [ 2]  528 	ldw	y, (0x61, sp)
      009AB5 17 55            [ 2]  529 	ldw	(0x55, sp), y
      009AB7 16 5F            [ 2]  530 	ldw	y, (0x5f, sp)
      009AB9 17 53            [ 2]  531 	ldw	(0x53, sp), y
      009ABB 1E 61            [ 2]  532 	ldw	x, (0x61, sp)
      009ABD 1D 00 01         [ 2]  533 	subw	x, #0x0001
      009AC0 1F 61            [ 2]  534 	ldw	(0x61, sp), x
      009AC2 1E 5F            [ 2]  535 	ldw	x, (0x5f, sp)
      009AC4 24 01            [ 1]  536 	jrnc	00360$
      009AC6 5A               [ 2]  537 	decw	x
      009AC7                        538 00360$:
      009AC7 1F 5F            [ 2]  539 	ldw	(0x5f, sp), x
      009AC9 5F               [ 1]  540 	clrw	x
      009ACA 13 55            [ 2]  541 	cpw	x, (0x55, sp)
      009ACC 4F               [ 1]  542 	clr	a
      009ACD 12 54            [ 1]  543 	sbc	a, (0x54, sp)
      009ACF 4F               [ 1]  544 	clr	a
      009AD0 12 53            [ 1]  545 	sbc	a, (0x53, sp)
      009AD2 2E 0C            [ 1]  546 	jrsge	00196$
      009AD4 1E 5D            [ 2]  547 	ldw	x, (0x5d, sp)
      009AD6 7B 45            [ 1]  548 	ld	a, (0x45, sp)
      009AD8 F7               [ 1]  549 	ld	(x), a
      009AD9 1E 5D            [ 2]  550 	ldw	x, (0x5d, sp)
      009ADB 5C               [ 1]  551 	incw	x
      009ADC 1F 5D            [ 2]  552 	ldw	(0x5d, sp), x
      009ADE 20 D3            [ 2]  553 	jra	00147$
                                    554 ;	./../../mib/stm8s_mib_vsprintf.c: 161: while (i < precision--) *str++ = '0';
      009AE0                        555 00196$:
      009AE0 16 61            [ 2]  556 	ldw	y, (0x61, sp)
      009AE2 17 6F            [ 2]  557 	ldw	(0x6f, sp), y
      009AE4 16 5F            [ 2]  558 	ldw	y, (0x5f, sp)
      009AE6 17 6D            [ 2]  559 	ldw	(0x6d, sp), y
      009AE8                        560 00189$:
      009AE8 16 5D            [ 2]  561 	ldw	y, (0x5d, sp)
      009AEA 1E 73            [ 2]  562 	ldw	x, (0x73, sp)
      009AEC 1F 61            [ 2]  563 	ldw	(0x61, sp), x
      009AEE 1E 71            [ 2]  564 	ldw	x, (0x71, sp)
      009AF0 1F 5F            [ 2]  565 	ldw	(0x5f, sp), x
      009AF2                        566 00152$:
      009AF2 1E 59            [ 2]  567 	ldw	x, (0x59, sp)
      009AF4 13 61            [ 2]  568 	cpw	x, (0x61, sp)
      009AF6 7B 58            [ 1]  569 	ld	a, (0x58, sp)
      009AF8 12 60            [ 1]  570 	sbc	a, (0x60, sp)
      009AFA 7B 57            [ 1]  571 	ld	a, (0x57, sp)
      009AFC 12 5F            [ 1]  572 	sbc	a, (0x5f, sp)
      009AFE 2E 16            [ 1]  573 	jrsge	00191$
      009B00 1E 61            [ 2]  574 	ldw	x, (0x61, sp)
      009B02 1D 00 01         [ 2]  575 	subw	x, #0x0001
      009B05 1F 61            [ 2]  576 	ldw	(0x61, sp), x
      009B07 1E 5F            [ 2]  577 	ldw	x, (0x5f, sp)
      009B09 24 01            [ 1]  578 	jrnc	00364$
      009B0B 5A               [ 2]  579 	decw	x
      009B0C                        580 00364$:
      009B0C 1F 5F            [ 2]  581 	ldw	(0x5f, sp), x
      009B0E A6 30            [ 1]  582 	ld	a, #0x30
      009B10 90 F7            [ 1]  583 	ld	(y), a
      009B12 90 5C            [ 1]  584 	incw	y
      009B14 20 DC            [ 2]  585 	jra	00152$
                                    586 ;	./../../mib/stm8s_mib_vsprintf.c: 162: while (i-- > 0) *str++ = tmp[i];
      009B16                        587 00191$:
      009B16 17 5B            [ 2]  588 	ldw	(0x5b, sp), y
      009B18 16 59            [ 2]  589 	ldw	y, (0x59, sp)
      009B1A 17 61            [ 2]  590 	ldw	(0x61, sp), y
      009B1C 16 57            [ 2]  591 	ldw	y, (0x57, sp)
      009B1E 17 5F            [ 2]  592 	ldw	(0x5f, sp), y
      009B20                        593 00155$:
      009B20 5F               [ 1]  594 	clrw	x
      009B21 13 61            [ 2]  595 	cpw	x, (0x61, sp)
      009B23 4F               [ 1]  596 	clr	a
      009B24 12 60            [ 1]  597 	sbc	a, (0x60, sp)
      009B26 4F               [ 1]  598 	clr	a
      009B27 12 5F            [ 1]  599 	sbc	a, (0x5f, sp)
      009B29 2E 1E            [ 1]  600 	jrsge	00193$
      009B2B 1E 61            [ 2]  601 	ldw	x, (0x61, sp)
      009B2D 1D 00 01         [ 2]  602 	subw	x, #0x0001
      009B30 1F 61            [ 2]  603 	ldw	(0x61, sp), x
      009B32 1E 5F            [ 2]  604 	ldw	x, (0x5f, sp)
      009B34 24 01            [ 1]  605 	jrnc	00366$
      009B36 5A               [ 2]  606 	decw	x
      009B37                        607 00366$:
      009B37 1F 5F            [ 2]  608 	ldw	(0x5f, sp), x
      009B39 96               [ 1]  609 	ldw	x, sp
      009B3A 5C               [ 1]  610 	incw	x
      009B3B 72 FB 61         [ 2]  611 	addw	x, (0x61, sp)
      009B3E F6               [ 1]  612 	ld	a, (x)
      009B3F 1E 5B            [ 2]  613 	ldw	x, (0x5b, sp)
      009B41 F7               [ 1]  614 	ld	(x), a
      009B42 1E 5B            [ 2]  615 	ldw	x, (0x5b, sp)
      009B44 5C               [ 1]  616 	incw	x
      009B45 1F 5B            [ 2]  617 	ldw	(0x5b, sp), x
      009B47 20 D7            [ 2]  618 	jra	00155$
                                    619 ;	./../../mib/stm8s_mib_vsprintf.c: 163: while (size-- > 0) *str++ = ' ';
      009B49                        620 00193$:
      009B49 16 5B            [ 2]  621 	ldw	y, (0x5b, sp)
      009B4B 1E 6F            [ 2]  622 	ldw	x, (0x6f, sp)
      009B4D 1F 61            [ 2]  623 	ldw	(0x61, sp), x
      009B4F 1E 6D            [ 2]  624 	ldw	x, (0x6d, sp)
      009B51 1F 5F            [ 2]  625 	ldw	(0x5f, sp), x
      009B53                        626 00158$:
      009B53 5F               [ 1]  627 	clrw	x
      009B54 13 61            [ 2]  628 	cpw	x, (0x61, sp)
      009B56 4F               [ 1]  629 	clr	a
      009B57 12 60            [ 1]  630 	sbc	a, (0x60, sp)
      009B59 4F               [ 1]  631 	clr	a
      009B5A 12 5F            [ 1]  632 	sbc	a, (0x5f, sp)
      009B5C 2E 16            [ 1]  633 	jrsge	00160$
      009B5E 1E 61            [ 2]  634 	ldw	x, (0x61, sp)
      009B60 1D 00 01         [ 2]  635 	subw	x, #0x0001
      009B63 1F 61            [ 2]  636 	ldw	(0x61, sp), x
      009B65 1E 5F            [ 2]  637 	ldw	x, (0x5f, sp)
      009B67 24 01            [ 1]  638 	jrnc	00369$
      009B69 5A               [ 2]  639 	decw	x
      009B6A                        640 00369$:
      009B6A 1F 5F            [ 2]  641 	ldw	(0x5f, sp), x
      009B6C A6 20            [ 1]  642 	ld	a, #0x20
      009B6E 90 F7            [ 1]  643 	ld	(y), a
      009B70 90 5C            [ 1]  644 	incw	y
      009B72 20 DF            [ 2]  645 	jra	00158$
      009B74                        646 00160$:
                                    647 ;	./../../mib/stm8s_mib_vsprintf.c: 165: return str;
      009B74 93               [ 1]  648 	ldw	x, y
      009B75                        649 00161$:
                                    650 ;	./../../mib/stm8s_mib_vsprintf.c: 166: }
      009B75 16 63            [ 2]  651 	ldw	y, (99, sp)
      009B77 5B 78            [ 2]  652 	addw	sp, #120
      009B79 90 FC            [ 2]  653 	jp	(y)
                                    654 ;	./../../mib/stm8s_mib_vsprintf.c: 172: MMRINT mm_vsprintf(char *buf, const char *fmt, va_list args)
                                    655 ;	-----------------------------------------
                                    656 ;	 function mm_vsprintf
                                    657 ;	-----------------------------------------
      009B7B                        658 _mm_vsprintf:
      009B7B 52 21            [ 2]  659 	sub	sp, #33
      009B7D 1F 1A            [ 2]  660 	ldw	(0x1a, sp), x
                                    661 ;	./../../mib/stm8s_mib_vsprintf.c: 186: char vStr[] = "<NULL>";
      009B7F A6 3C            [ 1]  662 	ld	a, #0x3c
      009B81 6B 0D            [ 1]  663 	ld	(0x0d, sp), a
      009B83 A6 4E            [ 1]  664 	ld	a, #0x4e
      009B85 6B 0E            [ 1]  665 	ld	(0x0e, sp), a
      009B87 A6 55            [ 1]  666 	ld	a, #0x55
      009B89 6B 0F            [ 1]  667 	ld	(0x0f, sp), a
      009B8B A6 4C            [ 1]  668 	ld	a, #0x4c
      009B8D 6B 10            [ 1]  669 	ld	(0x10, sp), a
      009B8F 6B 11            [ 1]  670 	ld	(0x11, sp), a
      009B91 A6 3E            [ 1]  671 	ld	a, #0x3e
      009B93 6B 12            [ 1]  672 	ld	(0x12, sp), a
      009B95 0F 13            [ 1]  673 	clr	(0x13, sp)
                                    674 ;	./../../mib/stm8s_mib_vsprintf.c: 188: for (str = buf; *fmt; fmt++)
      009B97 16 1A            [ 2]  675 	ldw	y, (0x1a, sp)
      009B99 17 1C            [ 2]  676 	ldw	(0x1c, sp), y
      009B9B                        677 00185$:
      009B9B 16 24            [ 2]  678 	ldw	y, (0x24, sp)
      009B9D 17 20            [ 2]  679 	ldw	(0x20, sp), y
      009B9F 93               [ 1]  680 	ldw	x, y
      009BA0 F6               [ 1]  681 	ld	a, (x)
      009BA1 6B 1F            [ 1]  682 	ld	(0x1f, sp), a
      009BA3 26 03            [ 1]  683 	jrne	00437$
      009BA5 CC 9F A1         [ 2]  684 	jp	00180$
      009BA8                        685 00437$:
                                    686 ;	./../../mib/stm8s_mib_vsprintf.c: 190: if (*fmt != '%')
      009BA8 7B 1F            [ 1]  687 	ld	a, (0x1f, sp)
      009BAA A1 25            [ 1]  688 	cp	a, #0x25
      009BAC 27 0D            [ 1]  689 	jreq	00102$
                                    690 ;	./../../mib/stm8s_mib_vsprintf.c: 192: *str++ = *fmt;
      009BAE 1E 1C            [ 2]  691 	ldw	x, (0x1c, sp)
      009BB0 7B 1F            [ 1]  692 	ld	a, (0x1f, sp)
      009BB2 F7               [ 1]  693 	ld	(x), a
      009BB3 1E 1C            [ 2]  694 	ldw	x, (0x1c, sp)
      009BB5 5C               [ 1]  695 	incw	x
      009BB6 1F 1C            [ 2]  696 	ldw	(0x1c, sp), x
                                    697 ;	./../../mib/stm8s_mib_vsprintf.c: 193: continue;
      009BB8 CC 9F 99         [ 2]  698 	jp	00179$
      009BBB                        699 00102$:
                                    700 ;	./../../mib/stm8s_mib_vsprintf.c: 197: flags = 0;
      009BBB 5F               [ 1]  701 	clrw	x
      009BBC 1F 0B            [ 2]  702 	ldw	(0x0b, sp), x
      009BBE 1F 09            [ 2]  703 	ldw	(0x09, sp), x
                                    704 ;	./../../mib/stm8s_mib_vsprintf.c: 198: repeat:
      009BC0 1E 20            [ 2]  705 	ldw	x, (0x20, sp)
      009BC2                        706 00103$:
                                    707 ;	./../../mib/stm8s_mib_vsprintf.c: 199: fmt++; // This also skips first '%'
      009BC2 5C               [ 1]  708 	incw	x
      009BC3 1F 24            [ 2]  709 	ldw	(0x24, sp), x
                                    710 ;	./../../mib/stm8s_mib_vsprintf.c: 200: switch (*fmt)
      009BC5 F6               [ 1]  711 	ld	a, (x)
      009BC6 6B 19            [ 1]  712 	ld	(0x19, sp), a
      009BC8 A1 20            [ 1]  713 	cp	a, #0x20
      009BCA 27 2C            [ 1]  714 	jreq	00106$
      009BCC 7B 19            [ 1]  715 	ld	a, (0x19, sp)
      009BCE A1 23            [ 1]  716 	cp	a, #0x23
      009BD0 27 2E            [ 1]  717 	jreq	00107$
      009BD2 7B 19            [ 1]  718 	ld	a, (0x19, sp)
      009BD4 A1 2B            [ 1]  719 	cp	a, #0x2b
      009BD6 27 18            [ 1]  720 	jreq	00105$
      009BD8 7B 19            [ 1]  721 	ld	a, (0x19, sp)
      009BDA A1 2D            [ 1]  722 	cp	a, #0x2d
      009BDC 27 0A            [ 1]  723 	jreq	00104$
      009BDE 7B 19            [ 1]  724 	ld	a, (0x19, sp)
      009BE0 A1 30            [ 1]  725 	cp	a, #0x30
      009BE2 27 24            [ 1]  726 	jreq	00108$
      009BE4 1F 24            [ 2]  727 	ldw	(0x24, sp), x
      009BE6 20 27            [ 2]  728 	jra	00109$
                                    729 ;	./../../mib/stm8s_mib_vsprintf.c: 202: case '-': flags |= LEFT; goto repeat;
      009BE8                        730 00104$:
      009BE8 7B 0C            [ 1]  731 	ld	a, (0x0c, sp)
      009BEA AA 10            [ 1]  732 	or	a, #0x10
      009BEC 6B 0C            [ 1]  733 	ld	(0x0c, sp), a
      009BEE 20 D2            [ 2]  734 	jra	00103$
                                    735 ;	./../../mib/stm8s_mib_vsprintf.c: 203: case '+': flags |= PLUS; goto repeat;
      009BF0                        736 00105$:
      009BF0 7B 0C            [ 1]  737 	ld	a, (0x0c, sp)
      009BF2 AA 04            [ 1]  738 	or	a, #0x04
      009BF4 6B 0C            [ 1]  739 	ld	(0x0c, sp), a
      009BF6 20 CA            [ 2]  740 	jra	00103$
                                    741 ;	./../../mib/stm8s_mib_vsprintf.c: 204: case ' ': flags |= SPACE; goto repeat;
      009BF8                        742 00106$:
      009BF8 7B 0C            [ 1]  743 	ld	a, (0x0c, sp)
      009BFA AA 08            [ 1]  744 	or	a, #0x08
      009BFC 6B 0C            [ 1]  745 	ld	(0x0c, sp), a
      009BFE 20 C2            [ 2]  746 	jra	00103$
                                    747 ;	./../../mib/stm8s_mib_vsprintf.c: 205: case '#': flags |= SPECIAL; goto repeat;
      009C00                        748 00107$:
      009C00 7B 0C            [ 1]  749 	ld	a, (0x0c, sp)
      009C02 AA 20            [ 1]  750 	or	a, #0x20
      009C04 6B 0C            [ 1]  751 	ld	(0x0c, sp), a
      009C06 20 BA            [ 2]  752 	jra	00103$
                                    753 ;	./../../mib/stm8s_mib_vsprintf.c: 206: case '0': flags |= ZEROPAD; goto repeat;
      009C08                        754 00108$:
      009C08 04 0C            [ 1]  755 	srl	(0x0c, sp)
      009C0A 99               [ 1]  756 	scf
      009C0B 09 0C            [ 1]  757 	rlc	(0x0c, sp)
      009C0D 20 B3            [ 2]  758 	jra	00103$
                                    759 ;	./../../mib/stm8s_mib_vsprintf.c: 207: }
      009C0F                        760 00109$:
                                    761 ;	./../../mib/stm8s_mib_vsprintf.c: 210: field_width = -1;
      009C0F 5F               [ 1]  762 	clrw	x
      009C10 5A               [ 2]  763 	decw	x
      009C11 1F 20            [ 2]  764 	ldw	(0x20, sp), x
      009C13 1F 1E            [ 2]  765 	ldw	(0x1e, sp), x
                                    766 ;	./../../mib/stm8s_mib_vsprintf.c: 211: if (is_digit(*fmt))
      009C15 7B 19            [ 1]  767 	ld	a, (0x19, sp)
      009C17 A1 30            [ 1]  768 	cp	a, #0x30
      009C19 25 11            [ 1]  769 	jrc	00115$
      009C1B A1 39            [ 1]  770 	cp	a, #0x39
      009C1D 22 0D            [ 1]  771 	jrugt	00115$
                                    772 ;	./../../mib/stm8s_mib_vsprintf.c: 212: field_width = skip_atoi(&fmt);
      009C1F 96               [ 1]  773 	ldw	x, sp
      009C20 1C 00 24         [ 2]  774 	addw	x, #36
      009C23 CD 98 1F         [ 4]  775 	call	_skip_atoi
      009C26 1F 20            [ 2]  776 	ldw	(0x20, sp), x
      009C28 17 1E            [ 2]  777 	ldw	(0x1e, sp), y
      009C2A 20 39            [ 2]  778 	jra	00116$
      009C2C                        779 00115$:
                                    780 ;	./../../mib/stm8s_mib_vsprintf.c: 213: else if (*fmt == '*')
      009C2C 1E 24            [ 2]  781 	ldw	x, (0x24, sp)
      009C2E F6               [ 1]  782 	ld	a, (x)
      009C2F A1 2A            [ 1]  783 	cp	a, #0x2a
      009C31 26 32            [ 1]  784 	jrne	00116$
                                    785 ;	./../../mib/stm8s_mib_vsprintf.c: 215: fmt++;
      009C33 5C               [ 1]  786 	incw	x
      009C34 1F 24            [ 2]  787 	ldw	(0x24, sp), x
                                    788 ;	./../../mib/stm8s_mib_vsprintf.c: 216: field_width = va_arg(args, MMINT);
      009C36 1E 26            [ 2]  789 	ldw	x, (0x26, sp)
      009C38 1C 00 04         [ 2]  790 	addw	x, #0x0004
      009C3B 1F 26            [ 2]  791 	ldw	(0x26, sp), x
      009C3D 1D 00 04         [ 2]  792 	subw	x, #0x0004
      009C40 90 93            [ 1]  793 	ldw	y, x
      009C42 90 EE 02         [ 2]  794 	ldw	y, (0x2, y)
      009C45 FE               [ 2]  795 	ldw	x, (x)
      009C46 17 20            [ 2]  796 	ldw	(0x20, sp), y
      009C48 1F 1E            [ 2]  797 	ldw	(0x1e, sp), x
                                    798 ;	./../../mib/stm8s_mib_vsprintf.c: 217: if (field_width < 0)
      009C4A 0D 1E            [ 1]  799 	tnz	(0x1e, sp)
      009C4C 2A 17            [ 1]  800 	jrpl	00116$
                                    801 ;	./../../mib/stm8s_mib_vsprintf.c: 219: field_width = -field_width;
      009C4E 00 21            [ 1]  802 	neg	(0x21, sp)
      009C50 4F               [ 1]  803 	clr	a
      009C51 12 20            [ 1]  804 	sbc	a, (0x20, sp)
      009C53 6B 20            [ 1]  805 	ld	(0x20, sp), a
      009C55 4F               [ 1]  806 	clr	a
      009C56 12 1F            [ 1]  807 	sbc	a, (0x1f, sp)
      009C58 6B 1F            [ 1]  808 	ld	(0x1f, sp), a
      009C5A 4F               [ 1]  809 	clr	a
      009C5B 12 1E            [ 1]  810 	sbc	a, (0x1e, sp)
      009C5D 6B 1E            [ 1]  811 	ld	(0x1e, sp), a
                                    812 ;	./../../mib/stm8s_mib_vsprintf.c: 220: flags |= LEFT;
      009C5F 7B 0C            [ 1]  813 	ld	a, (0x0c, sp)
      009C61 AA 10            [ 1]  814 	or	a, #0x10
      009C63 6B 0C            [ 1]  815 	ld	(0x0c, sp), a
      009C65                        816 00116$:
                                    817 ;	./../../mib/stm8s_mib_vsprintf.c: 225: precision = -1;
      009C65 5F               [ 1]  818 	clrw	x
      009C66 5A               [ 2]  819 	decw	x
      009C67 1F 18            [ 2]  820 	ldw	(0x18, sp), x
      009C69 1F 16            [ 2]  821 	ldw	(0x16, sp), x
                                    822 ;	./../../mib/stm8s_mib_vsprintf.c: 226: if (*fmt == '.')
      009C6B 16 24            [ 2]  823 	ldw	y, (0x24, sp)
      009C6D 17 14            [ 2]  824 	ldw	(0x14, sp), y
      009C6F 93               [ 1]  825 	ldw	x, y
      009C70 F6               [ 1]  826 	ld	a, (x)
      009C71 A1 2E            [ 1]  827 	cp	a, #0x2e
      009C73 26 42            [ 1]  828 	jrne	00127$
                                    829 ;	./../../mib/stm8s_mib_vsprintf.c: 228: ++fmt;    
      009C75 1E 14            [ 2]  830 	ldw	x, (0x14, sp)
      009C77 5C               [ 1]  831 	incw	x
                                    832 ;	./../../mib/stm8s_mib_vsprintf.c: 229: if (is_digit(*fmt))
      009C78 1F 24            [ 2]  833 	ldw	(0x24, sp), x
      009C7A F6               [ 1]  834 	ld	a, (x)
      009C7B A1 30            [ 1]  835 	cp	a, #0x30
      009C7D 25 11            [ 1]  836 	jrc	00121$
      009C7F A1 39            [ 1]  837 	cp	a, #0x39
      009C81 22 0D            [ 1]  838 	jrugt	00121$
                                    839 ;	./../../mib/stm8s_mib_vsprintf.c: 230: precision = skip_atoi(&fmt);
      009C83 96               [ 1]  840 	ldw	x, sp
      009C84 1C 00 24         [ 2]  841 	addw	x, #36
      009C87 CD 98 1F         [ 4]  842 	call	_skip_atoi
      009C8A 1F 18            [ 2]  843 	ldw	(0x18, sp), x
      009C8C 17 16            [ 2]  844 	ldw	(0x16, sp), y
      009C8E 20 1E            [ 2]  845 	jra	00122$
      009C90                        846 00121$:
                                    847 ;	./../../mib/stm8s_mib_vsprintf.c: 231: else if (*fmt == '*')
      009C90 1E 24            [ 2]  848 	ldw	x, (0x24, sp)
      009C92 F6               [ 1]  849 	ld	a, (x)
      009C93 A1 2A            [ 1]  850 	cp	a, #0x2a
      009C95 26 17            [ 1]  851 	jrne	00122$
                                    852 ;	./../../mib/stm8s_mib_vsprintf.c: 233: ++fmt;
      009C97 5C               [ 1]  853 	incw	x
      009C98 1F 24            [ 2]  854 	ldw	(0x24, sp), x
                                    855 ;	./../../mib/stm8s_mib_vsprintf.c: 234: precision = va_arg(args, MMINT);
      009C9A 1E 26            [ 2]  856 	ldw	x, (0x26, sp)
      009C9C 1C 00 04         [ 2]  857 	addw	x, #0x0004
      009C9F 1F 26            [ 2]  858 	ldw	(0x26, sp), x
      009CA1 1D 00 04         [ 2]  859 	subw	x, #0x0004
      009CA4 90 93            [ 1]  860 	ldw	y, x
      009CA6 90 EE 02         [ 2]  861 	ldw	y, (0x2, y)
      009CA9 FE               [ 2]  862 	ldw	x, (x)
      009CAA 17 18            [ 2]  863 	ldw	(0x18, sp), y
      009CAC 1F 16            [ 2]  864 	ldw	(0x16, sp), x
      009CAE                        865 00122$:
                                    866 ;	./../../mib/stm8s_mib_vsprintf.c: 236: if (precision < 0) precision = 0;
      009CAE 0D 16            [ 1]  867 	tnz	(0x16, sp)
      009CB0 2A 05            [ 1]  868 	jrpl	00127$
      009CB2 5F               [ 1]  869 	clrw	x
      009CB3 1F 18            [ 2]  870 	ldw	(0x18, sp), x
      009CB5 1F 16            [ 2]  871 	ldw	(0x16, sp), x
      009CB7                        872 00127$:
                                    873 ;	./../../mib/stm8s_mib_vsprintf.c: 240: qualifier = -1;
      009CB7 5F               [ 1]  874 	clrw	x
      009CB8 5A               [ 2]  875 	decw	x
      009CB9 1F 03            [ 2]  876 	ldw	(0x03, sp), x
      009CBB 1F 01            [ 2]  877 	ldw	(0x01, sp), x
                                    878 ;	./../../mib/stm8s_mib_vsprintf.c: 241: if (*fmt == 'h' || *fmt == 'l' || *fmt == 'L')
      009CBD 1E 24            [ 2]  879 	ldw	x, (0x24, sp)
      009CBF F6               [ 1]  880 	ld	a, (x)
      009CC0 6B 15            [ 1]  881 	ld	(0x15, sp), a
      009CC2 A1 68            [ 1]  882 	cp	a, #0x68
      009CC4 27 0C            [ 1]  883 	jreq	00128$
      009CC6 7B 15            [ 1]  884 	ld	a, (0x15, sp)
      009CC8 A1 6C            [ 1]  885 	cp	a, #0x6c
      009CCA 27 06            [ 1]  886 	jreq	00128$
      009CCC 7B 15            [ 1]  887 	ld	a, (0x15, sp)
      009CCE A1 4C            [ 1]  888 	cp	a, #0x4c
      009CD0 26 0E            [ 1]  889 	jrne	00129$
      009CD2                        890 00128$:
                                    891 ;	./../../mib/stm8s_mib_vsprintf.c: 243: qualifier = *fmt;
      009CD2 1E 24            [ 2]  892 	ldw	x, (0x24, sp)
      009CD4 F6               [ 1]  893 	ld	a, (x)
      009CD5 6B 04            [ 1]  894 	ld	(0x04, sp), a
      009CD7 0F 03            [ 1]  895 	clr	(0x03, sp)
      009CD9 0F 02            [ 1]  896 	clr	(0x02, sp)
      009CDB 0F 01            [ 1]  897 	clr	(0x01, sp)
                                    898 ;	./../../mib/stm8s_mib_vsprintf.c: 244: fmt++;
      009CDD 5C               [ 1]  899 	incw	x
      009CDE 1F 24            [ 2]  900 	ldw	(0x24, sp), x
      009CE0                        901 00129$:
                                    902 ;	./../../mib/stm8s_mib_vsprintf.c: 248: base = 10;
      009CE0 AE 00 0A         [ 2]  903 	ldw	x, #0x000a
      009CE3 1F 07            [ 2]  904 	ldw	(0x07, sp), x
      009CE5 5F               [ 1]  905 	clrw	x
      009CE6 1F 05            [ 2]  906 	ldw	(0x05, sp), x
                                    907 ;	./../../mib/stm8s_mib_vsprintf.c: 250: switch (*fmt)
      009CE8 16 24            [ 2]  908 	ldw	y, (0x24, sp)
      009CEA 17 14            [ 2]  909 	ldw	(0x14, sp), y
      009CEC 93               [ 1]  910 	ldw	x, y
      009CED F6               [ 1]  911 	ld	a, (x)
      009CEE A1 58            [ 1]  912 	cp	a, #0x58
      009CF0 26 03            [ 1]  913 	jrne	00482$
      009CF2 CC 9E E8         [ 2]  914 	jp	00161$
      009CF5                        915 00482$:
      009CF5 A1 63            [ 1]  916 	cp	a, #0x63
      009CF7 27 38            [ 1]  917 	jreq	00132$
      009CF9 A1 64            [ 1]  918 	cp	a, #0x64
      009CFB 26 03            [ 1]  919 	jrne	00488$
      009CFD CC 9E F8         [ 2]  920 	jp	00164$
      009D00                        921 00488$:
      009D00 A1 69            [ 1]  922 	cp	a, #0x69
      009D02 26 03            [ 1]  923 	jrne	00491$
      009D04 CC 9E F8         [ 2]  924 	jp	00164$
      009D07                        925 00491$:
      009D07 A1 6E            [ 1]  926 	cp	a, #0x6e
      009D09 26 03            [ 1]  927 	jrne	00494$
      009D0B CC 9E 93         [ 2]  928 	jp	00156$
      009D0E                        929 00494$:
      009D0E A1 6F            [ 1]  930 	cp	a, #0x6f
      009D10 26 03            [ 1]  931 	jrne	00497$
      009D12 CC 9E DE         [ 2]  932 	jp	00160$
      009D15                        933 00497$:
      009D15 A1 70            [ 1]  934 	cp	a, #0x70
      009D17 26 03            [ 1]  935 	jrne	00500$
      009D19 CC 9E 48         [ 2]  936 	jp	00153$
      009D1C                        937 00500$:
      009D1C A1 73            [ 1]  938 	cp	a, #0x73
      009D1E 27 76            [ 1]  939 	jreq	00141$
      009D20 A1 75            [ 1]  940 	cp	a, #0x75
      009D22 26 03            [ 1]  941 	jrne	00506$
      009D24 CC 9F 22         [ 2]  942 	jp	00172$
      009D27                        943 00506$:
      009D27 A1 78            [ 1]  944 	cp	a, #0x78
      009D29 26 03            [ 1]  945 	jrne	00509$
      009D2B CC 9E EE         [ 2]  946 	jp	00162$
      009D2E                        947 00509$:
      009D2E CC 9F 00         [ 2]  948 	jp	00166$
                                    949 ;	./../../mib/stm8s_mib_vsprintf.c: 252: case 'c':
      009D31                        950 00132$:
                                    951 ;	./../../mib/stm8s_mib_vsprintf.c: 253: if (!(flags & LEFT)) while (--field_width > 0) *str++ = ' ';
      009D31 7B 0C            [ 1]  952 	ld	a, (0x0c, sp)
      009D33 A5 10            [ 1]  953 	bcp	a, #0x10
      009D35 26 25            [ 1]  954 	jrne	00137$
      009D37 16 1C            [ 2]  955 	ldw	y, (0x1c, sp)
      009D39                        956 00133$:
      009D39 1E 20            [ 2]  957 	ldw	x, (0x20, sp)
      009D3B 1D 00 01         [ 2]  958 	subw	x, #0x0001
      009D3E 1F 20            [ 2]  959 	ldw	(0x20, sp), x
      009D40 1E 1E            [ 2]  960 	ldw	x, (0x1e, sp)
      009D42 24 01            [ 1]  961 	jrnc	00512$
      009D44 5A               [ 2]  962 	decw	x
      009D45                        963 00512$:
      009D45 1F 1E            [ 2]  964 	ldw	(0x1e, sp), x
      009D47 5F               [ 1]  965 	clrw	x
      009D48 13 20            [ 2]  966 	cpw	x, (0x20, sp)
      009D4A 4F               [ 1]  967 	clr	a
      009D4B 12 1F            [ 1]  968 	sbc	a, (0x1f, sp)
      009D4D 4F               [ 1]  969 	clr	a
      009D4E 12 1E            [ 1]  970 	sbc	a, (0x1e, sp)
      009D50 2E 08            [ 1]  971 	jrsge	00236$
      009D52 A6 20            [ 1]  972 	ld	a, #0x20
      009D54 90 F7            [ 1]  973 	ld	(y), a
      009D56 90 5C            [ 1]  974 	incw	y
      009D58 20 DF            [ 2]  975 	jra	00133$
      009D5A                        976 00236$:
      009D5A 17 1C            [ 2]  977 	ldw	(0x1c, sp), y
      009D5C                        978 00137$:
                                    979 ;	./../../mib/stm8s_mib_vsprintf.c: 254: *str++ = (MMUCHAR) va_arg(args, MMAINT); // test ok...
      009D5C 1E 26            [ 2]  980 	ldw	x, (0x26, sp)
      009D5E 5C               [ 1]  981 	incw	x
      009D5F 5C               [ 1]  982 	incw	x
      009D60 1F 26            [ 2]  983 	ldw	(0x26, sp), x
      009D62 5A               [ 2]  984 	decw	x
      009D63 5A               [ 2]  985 	decw	x
      009D64 E6 01            [ 1]  986 	ld	a, (0x1, x)
      009D66 1E 1C            [ 2]  987 	ldw	x, (0x1c, sp)
      009D68 F7               [ 1]  988 	ld	(x), a
      009D69 1E 1C            [ 2]  989 	ldw	x, (0x1c, sp)
      009D6B 5C               [ 1]  990 	incw	x
      009D6C 1F 18            [ 2]  991 	ldw	(0x18, sp), x
                                    992 ;	./../../mib/stm8s_mib_vsprintf.c: 255: while (--field_width > 0) *str++ = ' ';
      009D6E                        993 00138$:
      009D6E 1E 20            [ 2]  994 	ldw	x, (0x20, sp)
      009D70 1D 00 01         [ 2]  995 	subw	x, #0x0001
      009D73 1F 20            [ 2]  996 	ldw	(0x20, sp), x
      009D75 1E 1E            [ 2]  997 	ldw	x, (0x1e, sp)
      009D77 24 01            [ 1]  998 	jrnc	00514$
      009D79 5A               [ 2]  999 	decw	x
      009D7A                       1000 00514$:
      009D7A 1F 1E            [ 2] 1001 	ldw	(0x1e, sp), x
      009D7C 5F               [ 1] 1002 	clrw	x
      009D7D 13 20            [ 2] 1003 	cpw	x, (0x20, sp)
      009D7F 4F               [ 1] 1004 	clr	a
      009D80 12 1F            [ 1] 1005 	sbc	a, (0x1f, sp)
      009D82 4F               [ 1] 1006 	clr	a
      009D83 12 1E            [ 1] 1007 	sbc	a, (0x1e, sp)
      009D85 2F 03            [ 1] 1008 	jrslt	00515$
      009D87 CC 9F 95         [ 2] 1009 	jp	00237$
      009D8A                       1010 00515$:
      009D8A 1E 18            [ 2] 1011 	ldw	x, (0x18, sp)
      009D8C A6 20            [ 1] 1012 	ld	a, #0x20
      009D8E F7               [ 1] 1013 	ld	(x), a
      009D8F 1E 18            [ 2] 1014 	ldw	x, (0x18, sp)
      009D91 5C               [ 1] 1015 	incw	x
      009D92 1F 18            [ 2] 1016 	ldw	(0x18, sp), x
      009D94 20 D8            [ 2] 1017 	jra	00138$
                                   1018 ;	./../../mib/stm8s_mib_vsprintf.c: 258: case 's':
      009D96                       1019 00141$:
                                   1020 ;	./../../mib/stm8s_mib_vsprintf.c: 259: s = va_arg(args, char *);
      009D96 1E 26            [ 2] 1021 	ldw	x, (0x26, sp)
      009D98 5C               [ 1] 1022 	incw	x
      009D99 5C               [ 1] 1023 	incw	x
      009D9A 1F 26            [ 2] 1024 	ldw	(0x26, sp), x
      009D9C 5A               [ 2] 1025 	decw	x
      009D9D 5A               [ 2] 1026 	decw	x
      009D9E FE               [ 2] 1027 	ldw	x, (x)
                                   1028 ;	./../../mib/stm8s_mib_vsprintf.c: 260: if (!s) s = vStr; // "<NULL>";
      009D9F 1F 14            [ 2] 1029 	ldw	(0x14, sp), x
      009DA1 26 06            [ 1] 1030 	jrne	00143$
      009DA3 96               [ 1] 1031 	ldw	x, sp
      009DA4 1C 00 0D         [ 2] 1032 	addw	x, #13
      009DA7 1F 14            [ 2] 1033 	ldw	(0x14, sp), x
      009DA9                       1034 00143$:
                                   1035 ;	./../../mib/stm8s_mib_vsprintf.c: 261: len = strnlen(s, precision);
      009DA9 1E 18            [ 2] 1036 	ldw	x, (0x18, sp)
      009DAB 89               [ 2] 1037 	pushw	x
      009DAC 1E 16            [ 2] 1038 	ldw	x, (0x16, sp)
      009DAE CD 97 F6         [ 4] 1039 	call	_strnlen
      009DB1 1F 18            [ 2] 1040 	ldw	(0x18, sp), x
      009DB3 5F               [ 1] 1041 	clrw	x
      009DB4 1F 16            [ 2] 1042 	ldw	(0x16, sp), x
                                   1043 ;	./../../mib/stm8s_mib_vsprintf.c: 262: if (!(flags & LEFT)) while (len < field_width--) *str++ = ' ';
      009DB6 7B 0C            [ 1] 1044 	ld	a, (0x0c, sp)
      009DB8 A5 10            [ 1] 1045 	bcp	a, #0x10
      009DBA 26 30            [ 1] 1046 	jrne	00225$
      009DBC                       1047 00144$:
      009DBC 16 20            [ 2] 1048 	ldw	y, (0x20, sp)
      009DBE 17 0B            [ 2] 1049 	ldw	(0x0b, sp), y
      009DC0 16 1E            [ 2] 1050 	ldw	y, (0x1e, sp)
      009DC2 17 09            [ 2] 1051 	ldw	(0x09, sp), y
      009DC4 1E 20            [ 2] 1052 	ldw	x, (0x20, sp)
      009DC6 1D 00 01         [ 2] 1053 	subw	x, #0x0001
      009DC9 1F 20            [ 2] 1054 	ldw	(0x20, sp), x
      009DCB 1E 1E            [ 2] 1055 	ldw	x, (0x1e, sp)
      009DCD 24 01            [ 1] 1056 	jrnc	00519$
      009DCF 5A               [ 2] 1057 	decw	x
      009DD0                       1058 00519$:
      009DD0 1F 1E            [ 2] 1059 	ldw	(0x1e, sp), x
      009DD2 1E 18            [ 2] 1060 	ldw	x, (0x18, sp)
      009DD4 13 0B            [ 2] 1061 	cpw	x, (0x0b, sp)
      009DD6 7B 17            [ 1] 1062 	ld	a, (0x17, sp)
      009DD8 12 0A            [ 1] 1063 	sbc	a, (0x0a, sp)
      009DDA 7B 16            [ 1] 1064 	ld	a, (0x16, sp)
      009DDC 12 09            [ 1] 1065 	sbc	a, (0x09, sp)
      009DDE 2E 0C            [ 1] 1066 	jrsge	00238$
      009DE0 1E 1C            [ 2] 1067 	ldw	x, (0x1c, sp)
      009DE2 A6 20            [ 1] 1068 	ld	a, #0x20
      009DE4 F7               [ 1] 1069 	ld	(x), a
      009DE5 1E 1C            [ 2] 1070 	ldw	x, (0x1c, sp)
      009DE7 5C               [ 1] 1071 	incw	x
      009DE8 1F 1C            [ 2] 1072 	ldw	(0x1c, sp), x
      009DEA 20 D0            [ 2] 1073 	jra	00144$
      009DEC                       1074 00238$:
                                   1075 ;	./../../mib/stm8s_mib_vsprintf.c: 263: for (i = 0; i < len; ++i) *str++ = *s++;
      009DEC                       1076 00225$:
      009DEC 5F               [ 1] 1077 	clrw	x
      009DED 1F 0B            [ 2] 1078 	ldw	(0x0b, sp), x
      009DEF 1F 09            [ 2] 1079 	ldw	(0x09, sp), x
      009DF1                       1080 00182$:
      009DF1 1E 0B            [ 2] 1081 	ldw	x, (0x0b, sp)
      009DF3 13 18            [ 2] 1082 	cpw	x, (0x18, sp)
      009DF5 7B 0A            [ 1] 1083 	ld	a, (0x0a, sp)
      009DF7 12 17            [ 1] 1084 	sbc	a, (0x17, sp)
      009DF9 7B 09            [ 1] 1085 	ld	a, (0x09, sp)
      009DFB 12 16            [ 1] 1086 	sbc	a, (0x16, sp)
      009DFD 2E 1E            [ 1] 1087 	jrsge	00227$
      009DFF 1E 14            [ 2] 1088 	ldw	x, (0x14, sp)
      009E01 F6               [ 1] 1089 	ld	a, (x)
      009E02 1E 14            [ 2] 1090 	ldw	x, (0x14, sp)
      009E04 5C               [ 1] 1091 	incw	x
      009E05 1F 14            [ 2] 1092 	ldw	(0x14, sp), x
      009E07 1E 1C            [ 2] 1093 	ldw	x, (0x1c, sp)
      009E09 F7               [ 1] 1094 	ld	(x), a
      009E0A 1E 1C            [ 2] 1095 	ldw	x, (0x1c, sp)
      009E0C 5C               [ 1] 1096 	incw	x
      009E0D 1F 1C            [ 2] 1097 	ldw	(0x1c, sp), x
      009E0F 1E 0B            [ 2] 1098 	ldw	x, (0x0b, sp)
      009E11 5C               [ 1] 1099 	incw	x
      009E12 1F 0B            [ 2] 1100 	ldw	(0x0b, sp), x
      009E14 26 DB            [ 1] 1101 	jrne	00182$
      009E16 1E 09            [ 2] 1102 	ldw	x, (0x09, sp)
      009E18 5C               [ 1] 1103 	incw	x
      009E19 1F 09            [ 2] 1104 	ldw	(0x09, sp), x
      009E1B 20 D4            [ 2] 1105 	jra	00182$
                                   1106 ;	./../../mib/stm8s_mib_vsprintf.c: 264: while (len < field_width--) *str++ = ' ';
      009E1D                       1107 00227$:
      009E1D                       1108 00150$:
      009E1D 1E 18            [ 2] 1109 	ldw	x, (0x18, sp)
      009E1F 13 20            [ 2] 1110 	cpw	x, (0x20, sp)
      009E21 7B 17            [ 1] 1111 	ld	a, (0x17, sp)
      009E23 12 1F            [ 1] 1112 	sbc	a, (0x1f, sp)
      009E25 7B 16            [ 1] 1113 	ld	a, (0x16, sp)
      009E27 12 1E            [ 1] 1114 	sbc	a, (0x1e, sp)
      009E29 2F 03            [ 1] 1115 	jrslt	00526$
      009E2B CC 9F 99         [ 2] 1116 	jp	00240$
      009E2E                       1117 00526$:
      009E2E 1E 20            [ 2] 1118 	ldw	x, (0x20, sp)
      009E30 1D 00 01         [ 2] 1119 	subw	x, #0x0001
      009E33 1F 20            [ 2] 1120 	ldw	(0x20, sp), x
      009E35 1E 1E            [ 2] 1121 	ldw	x, (0x1e, sp)
      009E37 24 01            [ 1] 1122 	jrnc	00527$
      009E39 5A               [ 2] 1123 	decw	x
      009E3A                       1124 00527$:
      009E3A 1F 1E            [ 2] 1125 	ldw	(0x1e, sp), x
      009E3C 1E 1C            [ 2] 1126 	ldw	x, (0x1c, sp)
      009E3E A6 20            [ 1] 1127 	ld	a, #0x20
      009E40 F7               [ 1] 1128 	ld	(x), a
      009E41 1E 1C            [ 2] 1129 	ldw	x, (0x1c, sp)
      009E43 5C               [ 1] 1130 	incw	x
      009E44 1F 1C            [ 2] 1131 	ldw	(0x1c, sp), x
      009E46 20 D5            [ 2] 1132 	jra	00150$
                                   1133 ;	./../../mib/stm8s_mib_vsprintf.c: 267: case 'p':
      009E48                       1134 00153$:
                                   1135 ;	./../../mib/stm8s_mib_vsprintf.c: 268: if (field_width == -1)
      009E48 1E 20            [ 2] 1136 	ldw	x, (0x20, sp)
      009E4A 5C               [ 1] 1137 	incw	x
      009E4B 26 12            [ 1] 1138 	jrne	00155$
      009E4D 1E 1E            [ 2] 1139 	ldw	x, (0x1e, sp)
      009E4F 5C               [ 1] 1140 	incw	x
      009E50 26 0D            [ 1] 1141 	jrne	00155$
                                   1142 ;	./../../mib/stm8s_mib_vsprintf.c: 270: field_width = 2 * sizeof(void *);
      009E52 AE 00 04         [ 2] 1143 	ldw	x, #0x0004
      009E55 1F 20            [ 2] 1144 	ldw	(0x20, sp), x
      009E57 5F               [ 1] 1145 	clrw	x
      009E58 1F 1E            [ 2] 1146 	ldw	(0x1e, sp), x
                                   1147 ;	./../../mib/stm8s_mib_vsprintf.c: 271: flags |= ZEROPAD;
      009E5A 04 0C            [ 1] 1148 	srl	(0x0c, sp)
      009E5C 99               [ 1] 1149 	scf
      009E5D 09 0C            [ 1] 1150 	rlc	(0x0c, sp)
      009E5F                       1151 00155$:
                                   1152 ;	./../../mib/stm8s_mib_vsprintf.c: 273: str = number(str, (MMULONG) va_arg(args, void *), 16, field_width, precision, flags);
      009E5F 1E 26            [ 2] 1153 	ldw	x, (0x26, sp)
      009E61 5C               [ 1] 1154 	incw	x
      009E62 5C               [ 1] 1155 	incw	x
      009E63 1F 26            [ 2] 1156 	ldw	(0x26, sp), x
      009E65 5A               [ 2] 1157 	decw	x
      009E66 5A               [ 2] 1158 	decw	x
      009E67 FE               [ 2] 1159 	ldw	x, (x)
      009E68 1F 07            [ 2] 1160 	ldw	(0x07, sp), x
      009E6A 90 5F            [ 1] 1161 	clrw	y
      009E6C 1E 0B            [ 2] 1162 	ldw	x, (0x0b, sp)
      009E6E 89               [ 2] 1163 	pushw	x
      009E6F 1E 0B            [ 2] 1164 	ldw	x, (0x0b, sp)
      009E71 89               [ 2] 1165 	pushw	x
      009E72 1E 1C            [ 2] 1166 	ldw	x, (0x1c, sp)
      009E74 89               [ 2] 1167 	pushw	x
      009E75 1E 1C            [ 2] 1168 	ldw	x, (0x1c, sp)
      009E77 89               [ 2] 1169 	pushw	x
      009E78 1E 28            [ 2] 1170 	ldw	x, (0x28, sp)
      009E7A 89               [ 2] 1171 	pushw	x
      009E7B 1E 28            [ 2] 1172 	ldw	x, (0x28, sp)
      009E7D 89               [ 2] 1173 	pushw	x
      009E7E 4B 10            [ 1] 1174 	push	#0x10
      009E80 5F               [ 1] 1175 	clrw	x
      009E81 89               [ 2] 1176 	pushw	x
      009E82 4B 00            [ 1] 1177 	push	#0x00
      009E84 1E 17            [ 2] 1178 	ldw	x, (0x17, sp)
      009E86 89               [ 2] 1179 	pushw	x
      009E87 90 89            [ 2] 1180 	pushw	y
      009E89 1E 30            [ 2] 1181 	ldw	x, (0x30, sp)
      009E8B CD 98 79         [ 4] 1182 	call	_number
      009E8E 1F 1C            [ 2] 1183 	ldw	(0x1c, sp), x
                                   1184 ;	./../../mib/stm8s_mib_vsprintf.c: 274: continue;
      009E90 CC 9F 99         [ 2] 1185 	jp	00179$
                                   1186 ;	./../../mib/stm8s_mib_vsprintf.c: 276: case 'n':
      009E93                       1187 00156$:
                                   1188 ;	./../../mib/stm8s_mib_vsprintf.c: 277: if (qualifier == 'l')
      009E93 1E 03            [ 2] 1189 	ldw	x, (0x03, sp)
      009E95 A3 00 6C         [ 2] 1190 	cpw	x, #0x006c
      009E98 26 24            [ 1] 1191 	jrne	00158$
      009E9A 1E 01            [ 2] 1192 	ldw	x, (0x01, sp)
      009E9C 26 20            [ 1] 1193 	jrne	00158$
                                   1194 ;	./../../mib/stm8s_mib_vsprintf.c: 279: MMLONG *ip = va_arg(args, MMLONG *);
      009E9E 1E 26            [ 2] 1195 	ldw	x, (0x26, sp)
      009EA0 5C               [ 1] 1196 	incw	x
      009EA1 5C               [ 1] 1197 	incw	x
      009EA2 1F 26            [ 2] 1198 	ldw	(0x26, sp), x
      009EA4 5A               [ 2] 1199 	decw	x
      009EA5 5A               [ 2] 1200 	decw	x
      009EA6 FE               [ 2] 1201 	ldw	x, (x)
                                   1202 ;	./../../mib/stm8s_mib_vsprintf.c: 280: *ip = (str - buf);
      009EA7 16 1C            [ 2] 1203 	ldw	y, (0x1c, sp)
      009EA9 72 F2 1A         [ 2] 1204 	subw	y, (0x1a, sp)
      009EAC 90 9E            [ 1] 1205 	ld	a, yh
      009EAE 49               [ 1] 1206 	rlc	a
      009EAF 4F               [ 1] 1207 	clr	a
      009EB0 A2 00            [ 1] 1208 	sbc	a, #0x00
      009EB2 6B 1F            [ 1] 1209 	ld	(0x1f, sp), a
      009EB4 6B 1E            [ 1] 1210 	ld	(0x1e, sp), a
      009EB6 EF 02            [ 2] 1211 	ldw	(0x2, x), y
      009EB8 16 1E            [ 2] 1212 	ldw	y, (0x1e, sp)
      009EBA FF               [ 2] 1213 	ldw	(x), y
      009EBB CC 9F 99         [ 2] 1214 	jp	00179$
      009EBE                       1215 00158$:
                                   1216 ;	./../../mib/stm8s_mib_vsprintf.c: 284: MMINT *ip = va_arg(args, MMINT *);
      009EBE 1E 26            [ 2] 1217 	ldw	x, (0x26, sp)
      009EC0 5C               [ 1] 1218 	incw	x
      009EC1 5C               [ 1] 1219 	incw	x
      009EC2 1F 26            [ 2] 1220 	ldw	(0x26, sp), x
      009EC4 5A               [ 2] 1221 	decw	x
      009EC5 5A               [ 2] 1222 	decw	x
      009EC6 FE               [ 2] 1223 	ldw	x, (x)
                                   1224 ;	./../../mib/stm8s_mib_vsprintf.c: 285: *ip = (str - buf);
      009EC7 16 1C            [ 2] 1225 	ldw	y, (0x1c, sp)
      009EC9 72 F2 1A         [ 2] 1226 	subw	y, (0x1a, sp)
      009ECC 90 9E            [ 1] 1227 	ld	a, yh
      009ECE 49               [ 1] 1228 	rlc	a
      009ECF 4F               [ 1] 1229 	clr	a
      009ED0 A2 00            [ 1] 1230 	sbc	a, #0x00
      009ED2 6B 1F            [ 1] 1231 	ld	(0x1f, sp), a
      009ED4 6B 1E            [ 1] 1232 	ld	(0x1e, sp), a
      009ED6 EF 02            [ 2] 1233 	ldw	(0x2, x), y
      009ED8 16 1E            [ 2] 1234 	ldw	y, (0x1e, sp)
      009EDA FF               [ 2] 1235 	ldw	(x), y
                                   1236 ;	./../../mib/stm8s_mib_vsprintf.c: 287: continue;
      009EDB CC 9F 99         [ 2] 1237 	jp	00179$
                                   1238 ;	./../../mib/stm8s_mib_vsprintf.c: 290: case 'o':
      009EDE                       1239 00160$:
                                   1240 ;	./../../mib/stm8s_mib_vsprintf.c: 291: base = 8;
      009EDE AE 00 08         [ 2] 1241 	ldw	x, #0x0008
      009EE1 1F 07            [ 2] 1242 	ldw	(0x07, sp), x
      009EE3 5F               [ 1] 1243 	clrw	x
      009EE4 1F 05            [ 2] 1244 	ldw	(0x05, sp), x
                                   1245 ;	./../../mib/stm8s_mib_vsprintf.c: 292: break;
      009EE6 20 3A            [ 2] 1246 	jra	00172$
                                   1247 ;	./../../mib/stm8s_mib_vsprintf.c: 294: case 'X':
      009EE8                       1248 00161$:
                                   1249 ;	./../../mib/stm8s_mib_vsprintf.c: 295: flags |= LARGE;
      009EE8 7B 0C            [ 1] 1250 	ld	a, (0x0c, sp)
      009EEA AA 40            [ 1] 1251 	or	a, #0x40
      009EEC 6B 0C            [ 1] 1252 	ld	(0x0c, sp), a
                                   1253 ;	./../../mib/stm8s_mib_vsprintf.c: 297: case 'x':
      009EEE                       1254 00162$:
                                   1255 ;	./../../mib/stm8s_mib_vsprintf.c: 298: base = 16;
      009EEE AE 00 10         [ 2] 1256 	ldw	x, #0x0010
      009EF1 1F 07            [ 2] 1257 	ldw	(0x07, sp), x
      009EF3 5F               [ 1] 1258 	clrw	x
      009EF4 1F 05            [ 2] 1259 	ldw	(0x05, sp), x
                                   1260 ;	./../../mib/stm8s_mib_vsprintf.c: 299: break;
      009EF6 20 2A            [ 2] 1261 	jra	00172$
                                   1262 ;	./../../mib/stm8s_mib_vsprintf.c: 302: case 'i':
      009EF8                       1263 00164$:
                                   1264 ;	./../../mib/stm8s_mib_vsprintf.c: 303: flags |= SIGN;
      009EF8 7B 0C            [ 1] 1265 	ld	a, (0x0c, sp)
      009EFA AA 02            [ 1] 1266 	or	a, #0x02
      009EFC 6B 0C            [ 1] 1267 	ld	(0x0c, sp), a
                                   1268 ;	./../../mib/stm8s_mib_vsprintf.c: 306: break;
      009EFE 20 22            [ 2] 1269 	jra	00172$
                                   1270 ;	./../../mib/stm8s_mib_vsprintf.c: 308: default:
      009F00                       1271 00166$:
                                   1272 ;	./../../mib/stm8s_mib_vsprintf.c: 309: if (*fmt != '%') *str++ = '%';
      009F00 A1 25            [ 1] 1273 	cp	a, #0x25
      009F02 27 0A            [ 1] 1274 	jreq	00168$
      009F04 1E 1C            [ 2] 1275 	ldw	x, (0x1c, sp)
      009F06 A6 25            [ 1] 1276 	ld	a, #0x25
      009F08 F7               [ 1] 1277 	ld	(x), a
      009F09 1E 1C            [ 2] 1278 	ldw	x, (0x1c, sp)
      009F0B 5C               [ 1] 1279 	incw	x
      009F0C 1F 1C            [ 2] 1280 	ldw	(0x1c, sp), x
      009F0E                       1281 00168$:
                                   1282 ;	./../../mib/stm8s_mib_vsprintf.c: 310: if (*fmt)
      009F0E 1E 24            [ 2] 1283 	ldw	x, (0x24, sp)
      009F10 F6               [ 1] 1284 	ld	a, (x)
      009F11 27 0A            [ 1] 1285 	jreq	00170$
                                   1286 ;	./../../mib/stm8s_mib_vsprintf.c: 311: *str++ = *fmt;
      009F13 1E 1C            [ 2] 1287 	ldw	x, (0x1c, sp)
      009F15 F7               [ 1] 1288 	ld	(x), a
      009F16 1E 1C            [ 2] 1289 	ldw	x, (0x1c, sp)
      009F18 5C               [ 1] 1290 	incw	x
      009F19 1F 1C            [ 2] 1291 	ldw	(0x1c, sp), x
      009F1B 20 7C            [ 2] 1292 	jra	00179$
      009F1D                       1293 00170$:
                                   1294 ;	./../../mib/stm8s_mib_vsprintf.c: 313: --fmt;
      009F1D 5A               [ 2] 1295 	decw	x
      009F1E 1F 24            [ 2] 1296 	ldw	(0x24, sp), x
                                   1297 ;	./../../mib/stm8s_mib_vsprintf.c: 314: continue;
      009F20 20 77            [ 2] 1298 	jra	00179$
                                   1299 ;	./../../mib/stm8s_mib_vsprintf.c: 315: }
      009F22                       1300 00172$:
                                   1301 ;	./../../mib/stm8s_mib_vsprintf.c: 317: if (qualifier == 'l')
      009F22 1E 03            [ 2] 1302 	ldw	x, (0x03, sp)
      009F24 A3 00 6C         [ 2] 1303 	cpw	x, #0x006c
      009F27 26 1A            [ 1] 1304 	jrne	00177$
      009F29 1E 01            [ 2] 1305 	ldw	x, (0x01, sp)
      009F2B 26 16            [ 1] 1306 	jrne	00177$
                                   1307 ;	./../../mib/stm8s_mib_vsprintf.c: 318: num = va_arg(args, MMUINT); // MMULONG); // test ok..
      009F2D 1E 26            [ 2] 1308 	ldw	x, (0x26, sp)
      009F2F 1C 00 04         [ 2] 1309 	addw	x, #0x0004
      009F32 1F 26            [ 2] 1310 	ldw	(0x26, sp), x
      009F34 1D 00 04         [ 2] 1311 	subw	x, #0x0004
      009F37 90 93            [ 1] 1312 	ldw	y, x
      009F39 90 EE 02         [ 2] 1313 	ldw	y, (0x2, y)
      009F3C FE               [ 2] 1314 	ldw	x, (x)
      009F3D 17 03            [ 2] 1315 	ldw	(0x03, sp), y
      009F3F 1F 01            [ 2] 1316 	ldw	(0x01, sp), x
      009F41 20 2B            [ 2] 1317 	jra	00178$
      009F43                       1318 00177$:
                                   1319 ;	./../../mib/stm8s_mib_vsprintf.c: 328: else if (flags & SIGN)
      009F43 7B 0C            [ 1] 1320 	ld	a, (0x0c, sp)
      009F45 A5 02            [ 1] 1321 	bcp	a, #0x02
      009F47 27 17            [ 1] 1322 	jreq	00174$
                                   1323 ;	./../../mib/stm8s_mib_vsprintf.c: 329: num = va_arg(args, MMAINT); // test ok...
      009F49 1E 26            [ 2] 1324 	ldw	x, (0x26, sp)
      009F4B 5C               [ 1] 1325 	incw	x
      009F4C 5C               [ 1] 1326 	incw	x
      009F4D 1F 26            [ 2] 1327 	ldw	(0x26, sp), x
      009F4F 5A               [ 2] 1328 	decw	x
      009F50 5A               [ 2] 1329 	decw	x
      009F51 FE               [ 2] 1330 	ldw	x, (x)
      009F52 1F 03            [ 2] 1331 	ldw	(0x03, sp), x
      009F54 7B 03            [ 1] 1332 	ld	a, (0x03, sp)
      009F56 49               [ 1] 1333 	rlc	a
      009F57 4F               [ 1] 1334 	clr	a
      009F58 A2 00            [ 1] 1335 	sbc	a, #0x00
      009F5A 6B 02            [ 1] 1336 	ld	(0x02, sp), a
      009F5C 6B 01            [ 1] 1337 	ld	(0x01, sp), a
      009F5E 20 0E            [ 2] 1338 	jra	00178$
      009F60                       1339 00174$:
                                   1340 ;	./../../mib/stm8s_mib_vsprintf.c: 331: num = va_arg(args, MMAUINT);
      009F60 1E 26            [ 2] 1341 	ldw	x, (0x26, sp)
      009F62 5C               [ 1] 1342 	incw	x
      009F63 5C               [ 1] 1343 	incw	x
      009F64 1F 26            [ 2] 1344 	ldw	(0x26, sp), x
      009F66 5A               [ 2] 1345 	decw	x
      009F67 5A               [ 2] 1346 	decw	x
      009F68 FE               [ 2] 1347 	ldw	x, (x)
      009F69 1F 03            [ 2] 1348 	ldw	(0x03, sp), x
      009F6B 5F               [ 1] 1349 	clrw	x
      009F6C 1F 01            [ 2] 1350 	ldw	(0x01, sp), x
      009F6E                       1351 00178$:
                                   1352 ;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
      009F6E 1E 0B            [ 2] 1353 	ldw	x, (0x0b, sp)
      009F70 89               [ 2] 1354 	pushw	x
      009F71 1E 0B            [ 2] 1355 	ldw	x, (0x0b, sp)
      009F73 89               [ 2] 1356 	pushw	x
      009F74 1E 1C            [ 2] 1357 	ldw	x, (0x1c, sp)
      009F76 89               [ 2] 1358 	pushw	x
      009F77 1E 1C            [ 2] 1359 	ldw	x, (0x1c, sp)
      009F79 89               [ 2] 1360 	pushw	x
      009F7A 1E 28            [ 2] 1361 	ldw	x, (0x28, sp)
      009F7C 89               [ 2] 1362 	pushw	x
      009F7D 1E 28            [ 2] 1363 	ldw	x, (0x28, sp)
      009F7F 89               [ 2] 1364 	pushw	x
      009F80 1E 13            [ 2] 1365 	ldw	x, (0x13, sp)
      009F82 89               [ 2] 1366 	pushw	x
      009F83 1E 13            [ 2] 1367 	ldw	x, (0x13, sp)
      009F85 89               [ 2] 1368 	pushw	x
      009F86 1E 13            [ 2] 1369 	ldw	x, (0x13, sp)
      009F88 89               [ 2] 1370 	pushw	x
      009F89 1E 13            [ 2] 1371 	ldw	x, (0x13, sp)
      009F8B 89               [ 2] 1372 	pushw	x
      009F8C 1E 30            [ 2] 1373 	ldw	x, (0x30, sp)
      009F8E CD 98 79         [ 4] 1374 	call	_number
      009F91 1F 1C            [ 2] 1375 	ldw	(0x1c, sp), x
                                   1376 ;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
      009F93 20 04            [ 2] 1377 	jra	00179$
                                   1378 ;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
      009F95                       1379 00237$:
      009F95 16 18            [ 2] 1380 	ldw	y, (0x18, sp)
      009F97 17 1C            [ 2] 1381 	ldw	(0x1c, sp), y
                                   1382 ;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
                                   1383 ;	./../../mib/stm8s_mib_vsprintf.c: 333: str = number(str, num, base, field_width, precision, flags);
      009F99                       1384 00240$:
      009F99                       1385 00179$:
                                   1386 ;	./../../mib/stm8s_mib_vsprintf.c: 188: for (str = buf; *fmt; fmt++)
      009F99 1E 24            [ 2] 1387 	ldw	x, (0x24, sp)
      009F9B 5C               [ 1] 1388 	incw	x
      009F9C 1F 24            [ 2] 1389 	ldw	(0x24, sp), x
      009F9E CC 9B 9B         [ 2] 1390 	jp	00185$
      009FA1                       1391 00180$:
                                   1392 ;	./../../mib/stm8s_mib_vsprintf.c: 336: *str = '\0';
      009FA1 1E 1C            [ 2] 1393 	ldw	x, (0x1c, sp)
      009FA3 7F               [ 1] 1394 	clr	(x)
                                   1395 ;	./../../mib/stm8s_mib_vsprintf.c: 337: return str - buf;
      009FA4 1E 1C            [ 2] 1396 	ldw	x, (0x1c, sp)
      009FA6 72 F0 1A         [ 2] 1397 	subw	x, (0x1a, sp)
                                   1398 ;	./../../mib/stm8s_mib_vsprintf.c: 338: }
      009FA9 16 22            [ 2] 1399 	ldw	y, (34, sp)
      009FAB 5B 27            [ 2] 1400 	addw	sp, #39
      009FAD 90 FC            [ 2] 1401 	jp	(y)
                                   1402 ;	./../../mib/stm8s_mib_vsprintf.c: 342: MMRINT mib_vsprintf(char *vpBuffer,char *format, ...)
                                   1403 ;	-----------------------------------------
                                   1404 ;	 function mib_vsprintf
                                   1405 ;	-----------------------------------------
      009FAF                       1406 _mib_vsprintf:
                                   1407 ;	./../../mib/stm8s_mib_vsprintf.c: 347: va_start(ap, format);
      009FAF 96               [ 1] 1408 	ldw	x, sp
      009FB0 1C 00 07         [ 2] 1409 	addw	x, #7
                                   1410 ;	./../../mib/stm8s_mib_vsprintf.c: 348: rc = mm_vsprintf(vpBuffer, format, ap);
      009FB3 89               [ 2] 1411 	pushw	x
      009FB4 1E 07            [ 2] 1412 	ldw	x, (0x07, sp)
      009FB6 89               [ 2] 1413 	pushw	x
      009FB7 1E 07            [ 2] 1414 	ldw	x, (0x07, sp)
      009FB9 CD 9B 7B         [ 4] 1415 	call	_mm_vsprintf
                                   1416 ;	./../../mib/stm8s_mib_vsprintf.c: 351: return (rc);
                                   1417 ;	./../../mib/stm8s_mib_vsprintf.c: 352: }
      009FBC 81               [ 4] 1418 	ret
                                   1419 ;	./../../mib/stm8s_mib_vsprintf.c: 363: MMRINT mib_printf(char *format, ...)
                                   1420 ;	-----------------------------------------
                                   1421 ;	 function mib_printf
                                   1422 ;	-----------------------------------------
      009FBD                       1423 _mib_printf:
      009FBD 52 82            [ 2] 1424 	sub	sp, #130
                                   1425 ;	./../../mib/stm8s_mib_vsprintf.c: 370: va_start(ap, format);
                                   1426 ;	./../../mib/stm8s_mib_vsprintf.c: 371: rc = mm_vsprintf(buffer, format, ap);
      009FBF 96               [ 1] 1427 	ldw	x, sp
      009FC0 1C 00 87         [ 2] 1428 	addw	x, #135
      009FC3 89               [ 2] 1429 	pushw	x
      009FC4 1E 87            [ 2] 1430 	ldw	x, (0x87, sp)
      009FC6 89               [ 2] 1431 	pushw	x
      009FC7 96               [ 1] 1432 	ldw	x, sp
      009FC8 1C 00 05         [ 2] 1433 	addw	x, #5
      009FCB CD 9B 7B         [ 4] 1434 	call	_mm_vsprintf
      009FCE 1F 81            [ 2] 1435 	ldw	(0x81, sp), x
                                   1436 ;	./../../mib/stm8s_mib_vsprintf.c: 374: v_pString = (char *)buffer;
      009FD0 96               [ 1] 1437 	ldw	x, sp
      009FD1 5C               [ 1] 1438 	incw	x
                                   1439 ;	./../../mib/stm8s_mib_vsprintf.c: 375: while (*v_pString != 0)	MibWriteDebugByte((uint8_t)*v_pString++);
      009FD2                       1440 00101$:
      009FD2 F6               [ 1] 1441 	ld	a, (x)
      009FD3 27 08            [ 1] 1442 	jreq	00103$
      009FD5 5C               [ 1] 1443 	incw	x
      009FD6 89               [ 2] 1444 	pushw	x
      009FD7 CD 95 8E         [ 4] 1445 	call	_MibWriteDebugByte
      009FDA 85               [ 2] 1446 	popw	x
      009FDB 20 F5            [ 2] 1447 	jra	00101$
      009FDD                       1448 00103$:
                                   1449 ;	./../../mib/stm8s_mib_vsprintf.c: 376: return (rc);
      009FDD 1E 81            [ 2] 1450 	ldw	x, (0x81, sp)
                                   1451 ;	./../../mib/stm8s_mib_vsprintf.c: 377: }
      009FDF 5B 82            [ 2] 1452 	addw	sp, #130
      009FE1 81               [ 4] 1453 	ret
                                   1454 	.area CODE
                                   1455 	.area CONST
                                   1456 	.area CONST
      008559                       1457 ___str_1:
      008559 30 31 32 33 34 35 36  1458 	.ascii "0123456789abcdefghijklmnopqrstuvwxyz"
             37 38 39 61 62 63 64
             65 66 67 68 69 6A 6B
             6C 6D 6E 6F 70 71 72
             73 74 75 76 77 78 79
             7A
      00857D 00                    1459 	.db 0x00
                                   1460 	.area CODE
                                   1461 	.area CONST
      00857E                       1462 ___str_2:
      00857E 30 31 32 33 34 35 36  1463 	.ascii "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
             37 38 39 41 42 43 44
             45 46 47 48 49 4A 4B
             4C 4D 4E 4F 50 51 52
             53 54 55 56 57 58 59
             5A
      0085A2 00                    1464 	.db 0x00
                                   1465 	.area CODE
                                   1466 	.area INITIALIZER
      008BAB                       1467 __xinit__digits:
      008BAB 85 59                 1468 	.dw ___str_1
      008BAD                       1469 __xinit__upper_digits:
      008BAD 85 7E                 1470 	.dw ___str_2
                                   1471 	.area CABS (ABS)
