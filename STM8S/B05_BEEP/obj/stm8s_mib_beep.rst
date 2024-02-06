                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_mib_beep
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _mib_printf
                                     12 	.globl _FLASH_ProgramOptionByte
                                     13 	.globl _FLASH_ReadByte
                                     14 	.globl _FLASH_Unlock
                                     15 	.globl _fnBeepStart
                                     16 	.globl _calConfigBEEP
                                     17 ;--------------------------------------------------------
                                     18 ; ram data
                                     19 ;--------------------------------------------------------
                                     20 	.area DATA
                                     21 ;--------------------------------------------------------
                                     22 ; ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area INITIALIZED
                                     25 ;--------------------------------------------------------
                                     26 ; absolute external ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area DABS (ABS)
                                     29 
                                     30 ; default segment ordering for linker
                                     31 	.area HOME
                                     32 	.area GSINIT
                                     33 	.area GSFINAL
                                     34 	.area CONST
                                     35 	.area INITIALIZER
                                     36 	.area CODE
                                     37 
                                     38 ;--------------------------------------------------------
                                     39 ; global & static initialisations
                                     40 ;--------------------------------------------------------
                                     41 	.area HOME
                                     42 	.area GSINIT
                                     43 	.area GSFINAL
                                     44 	.area GSINIT
                                     45 ;--------------------------------------------------------
                                     46 ; Home
                                     47 ;--------------------------------------------------------
                                     48 	.area HOME
                                     49 	.area HOME
                                     50 ;--------------------------------------------------------
                                     51 ; code
                                     52 ;--------------------------------------------------------
                                     53 	.area CODE
                                     54 ;	./../../mib/stm8s_mib_beep.c: 45: void fnBeepStart(uint16_t vwFreq,uint16_t vwDelay) // msec... 
                                     55 ;	-----------------------------------------
                                     56 ;	 function fnBeepStart
                                     57 ;	-----------------------------------------
      00B080                         58 _fnBeepStart:
      00B080 52 02            [ 2]   59 	sub	sp, #2
      00B082 1F 01            [ 2]   60 	ldw	(0x01, sp), x
                                     61 ;	./../../mib/stm8s_mib_beep.c: 58: UCOM_BEEP_GPIO->DDR |= (UCOM_BEEP_PIN); /* Set Output mode */
      00B084 72 18 50 11      [ 1]   62 	bset	0x5011, #4
                                     63 ;	./../../mib/stm8s_mib_beep.c: 59: UCOM_BEEP_GPIO->CR1 |= (UCOM_BEEP_PIN);	/* Pull-Up or Push-Pull */
      00B088 72 18 50 12      [ 1]   64 	bset	0x5012, #4
                                     65 ;	./../../mib/stm8s_mib_beep.c: 60: UCOM_BEEP_GPIO->CR2 |= (UCOM_BEEP_PIN);	/* Output speed up to 10 MHz */
      00B08C 72 18 50 13      [ 1]   66 	bset	0x5013, #4
                                     67 ;	./../../mib/stm8s_mib_beep.c: 61: UCOM_BEEP_GPIO->ODR &= ~(UCOM_BEEP_PIN); // low... 
      00B090 C6 50 0F         [ 1]   68 	ld	a, 0x500f
      00B093 A4 EF            [ 1]   69 	and	a, #0xef
      00B095 C7 50 0F         [ 1]   70 	ld	0x500f, a
                                     71 ;	./../../mib/stm8s_mib_beep.c: 66: if(FLASH_ReadByte(OPT2_REG)!=AFR7_BIT) 
      00B098 4B 03            [ 1]   72 	push	#0x03
      00B09A 4B 48            [ 1]   73 	push	#0x48
      00B09C 5F               [ 1]   74 	clrw	x
      00B09D 89               [ 2]   75 	pushw	x
      00B09E CD 93 6F         [ 4]   76 	call	_FLASH_ReadByte
      00B0A1 A1 80            [ 1]   77 	cp	a, #0x80
      00B0A3 27 0D            [ 1]   78 	jreq	00102$
                                     79 ;	./../../mib/stm8s_mib_beep.c: 68: FLASH_Unlock(FLASH_MEMTYPE_DATA); 
      00B0A5 A6 F7            [ 1]   80 	ld	a, #0xf7
      00B0A7 CD 93 0A         [ 4]   81 	call	_FLASH_Unlock
                                     82 ;	./../../mib/stm8s_mib_beep.c: 70: FLASH_ProgramOptionByte(OPT2_REG,AFR7_BIT); 
      00B0AA A6 80            [ 1]   83 	ld	a, #0x80
      00B0AC AE 48 03         [ 2]   84 	ldw	x, #0x4803
      00B0AF CD 93 B3         [ 4]   85 	call	_FLASH_ProgramOptionByte
      00B0B2                         86 00102$:
                                     87 ;	./../../mib/stm8s_mib_beep.c: 78: calConfigBEEP(vwFreq);
      00B0B2 1E 01            [ 2]   88 	ldw	x, (0x01, sp)
      00B0B4 CD B0 DA         [ 4]   89 	call	_calConfigBEEP
                                     90 ;	./../../mib/stm8s_mib_beep.c: 83: BEEP->CSR |= BEEP_CSR_BEEPEN;
      00B0B7 C6 50 F3         [ 1]   91 	ld	a, 0x50f3
      00B0BA AA 20            [ 1]   92 	or	a, #0x20
      00B0BC C7 50 F3         [ 1]   93 	ld	0x50f3, a
                                     94 ;	./../../mib/stm8s_mib_beep.c: 87: if(vwDelay!=0)
      00B0BF 1E 05            [ 2]   95 	ldw	x, (0x05, sp)
      00B0C1 27 12            [ 1]   96 	jreq	00110$
                                     97 ;	./../../mib/stm8s_mib_beep.c: 90: gwMibMiliSec = vwDelay;
      00B0C3 1E 05            [ 2]   98 	ldw	x, (0x05, sp)
      00B0C5 CF 00 47         [ 2]   99 	ldw	_gwMibMiliSec+0, x
                                    100 ;	./../../mib/stm8s_mib_beep.c: 91: do {
      00B0C8                        101 00105$:
                                    102 ;	./../../mib/stm8s_mib_beep.c: 92: if(gwMibMiliSec==0)
      00B0C8 CE 00 47         [ 2]  103 	ldw	x, _gwMibMiliSec+0
      00B0CB 26 FB            [ 1]  104 	jrne	00105$
                                    105 ;	./../../mib/stm8s_mib_beep.c: 95: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
      00B0CD C6 50 F3         [ 1]  106 	ld	a, 0x50f3
      00B0D0 A4 DF            [ 1]  107 	and	a, #0xdf
      00B0D2 C7 50 F3         [ 1]  108 	ld	0x50f3, a
                                    109 ;	./../../mib/stm8s_mib_beep.c: 98: } while(1);
      00B0D5                        110 00110$:
                                    111 ;	./../../mib/stm8s_mib_beep.c: 100: }
      00B0D5 1E 03            [ 2]  112 	ldw	x, (3, sp)
      00B0D7 5B 06            [ 2]  113 	addw	sp, #6
      00B0D9 FC               [ 2]  114 	jp	(x)
                                    115 ;	./../../mib/stm8s_mib_beep.c: 114: void calConfigBEEP(uint16_t vwFreq) // msec... 
                                    116 ;	-----------------------------------------
                                    117 ;	 function calConfigBEEP
                                    118 ;	-----------------------------------------
      00B0DA                        119 _calConfigBEEP:
      00B0DA 52 07            [ 2]  120 	sub	sp, #7
      00B0DC 51               [ 1]  121 	exgw	x, y
                                    122 ;	./../../mib/stm8s_mib_beep.c: 117: uint8_t vbBEEPDIV = 0;
      00B0DD 0F 05            [ 1]  123 	clr	(0x05, sp)
                                    124 ;	./../../mib/stm8s_mib_beep.c: 118: uint32_t vdwData = vwFreq;
      00B0DF 17 03            [ 2]  125 	ldw	(0x03, sp), y
      00B0E1 5F               [ 1]  126 	clrw	x
      00B0E2 1F 01            [ 2]  127 	ldw	(0x01, sp), x
                                    128 ;	./../../mib/stm8s_mib_beep.c: 121: if(vwFreq<500)
      00B0E4 17 06            [ 2]  129 	ldw	(0x06, sp), y
      00B0E6 93               [ 1]  130 	ldw	x, y
      00B0E7 A3 01 F4         [ 2]  131 	cpw	x, #0x01f4
      00B0EA 24 07            [ 1]  132 	jrnc	00111$
                                    133 ;	./../../mib/stm8s_mib_beep.c: 124: vbBEEPSEL = 0xFF;
      00B0EC A6 FF            [ 1]  134 	ld	a, #0xff
      00B0EE 6B 06            [ 1]  135 	ld	(0x06, sp), a
      00B0F0 CC B1 74         [ 2]  136 	jp	00112$
      00B0F3                        137 00111$:
                                    138 ;	./../../mib/stm8s_mib_beep.c: 126: else if(vwFreq<1000)
      00B0F3 1E 06            [ 2]  139 	ldw	x, (0x06, sp)
      00B0F5 A3 03 E8         [ 2]  140 	cpw	x, #0x03e8
      00B0F8 24 20            [ 1]  141 	jrnc	00108$
                                    142 ;	./../../mib/stm8s_mib_beep.c: 128: vbBEEPSEL = 0x00; // f / (8 * div) khz
      00B0FA 0F 06            [ 1]  143 	clr	(0x06, sp)
                                    144 ;	./../../mib/stm8s_mib_beep.c: 129: vdwDiv = (128000 / 8) / vdwData;
      00B0FC 90 89            [ 2]  145 	pushw	y
      00B0FE 1E 05            [ 2]  146 	ldw	x, (0x05, sp)
      00B100 89               [ 2]  147 	pushw	x
      00B101 1E 05            [ 2]  148 	ldw	x, (0x05, sp)
      00B103 89               [ 2]  149 	pushw	x
      00B104 4B 80            [ 1]  150 	push	#0x80
      00B106 4B 3E            [ 1]  151 	push	#0x3e
      00B108 5F               [ 1]  152 	clrw	x
      00B109 89               [ 2]  153 	pushw	x
      00B10A CD B2 EB         [ 4]  154 	call	__divulong
      00B10D 5B 08            [ 2]  155 	addw	sp, #8
      00B10F 17 04            [ 2]  156 	ldw	(0x04, sp), y
      00B111 9F               [ 1]  157 	ld	a, xl
      00B112 90 85            [ 2]  158 	popw	y
                                    159 ;	./../../mib/stm8s_mib_beep.c: 130: vbBEEPDIV =  vdwDiv - 2;
      00B114 A0 02            [ 1]  160 	sub	a, #0x02
      00B116 6B 05            [ 1]  161 	ld	(0x05, sp), a
                                    162 ;	./../../mib/stm8s_mib_beep.c: 131: vdwDataLast = (128000 / 8) / vdwDiv;
      00B118 20 5A            [ 2]  163 	jra	00112$
      00B11A                        164 00108$:
                                    165 ;	./../../mib/stm8s_mib_beep.c: 133: else if(vwFreq<2000)
      00B11A 1E 06            [ 2]  166 	ldw	x, (0x06, sp)
      00B11C A3 07 D0         [ 2]  167 	cpw	x, #0x07d0
      00B11F 24 22            [ 1]  168 	jrnc	00105$
                                    169 ;	./../../mib/stm8s_mib_beep.c: 135: vbBEEPSEL = 0x01; // f / (4 * div) khz
      00B121 A6 01            [ 1]  170 	ld	a, #0x01
      00B123 6B 06            [ 1]  171 	ld	(0x06, sp), a
                                    172 ;	./../../mib/stm8s_mib_beep.c: 136: vdwDiv = (128000 / 4) / vdwData;
      00B125 90 89            [ 2]  173 	pushw	y
      00B127 1E 05            [ 2]  174 	ldw	x, (0x05, sp)
      00B129 89               [ 2]  175 	pushw	x
      00B12A 1E 05            [ 2]  176 	ldw	x, (0x05, sp)
      00B12C 89               [ 2]  177 	pushw	x
      00B12D 4B 00            [ 1]  178 	push	#0x00
      00B12F 4B 7D            [ 1]  179 	push	#0x7d
      00B131 5F               [ 1]  180 	clrw	x
      00B132 89               [ 2]  181 	pushw	x
      00B133 CD B2 EB         [ 4]  182 	call	__divulong
      00B136 5B 08            [ 2]  183 	addw	sp, #8
      00B138 17 04            [ 2]  184 	ldw	(0x04, sp), y
      00B13A 9F               [ 1]  185 	ld	a, xl
      00B13B 90 85            [ 2]  186 	popw	y
                                    187 ;	./../../mib/stm8s_mib_beep.c: 137: vbBEEPDIV =  vdwDiv - 2;
      00B13D A0 02            [ 1]  188 	sub	a, #0x02
      00B13F 6B 05            [ 1]  189 	ld	(0x05, sp), a
                                    190 ;	./../../mib/stm8s_mib_beep.c: 138: vdwDataLast = (128000 / 8) / vdwDiv;
      00B141 20 31            [ 2]  191 	jra	00112$
      00B143                        192 00105$:
                                    193 ;	./../../mib/stm8s_mib_beep.c: 140: else if(vwFreq<32000)
      00B143 1E 06            [ 2]  194 	ldw	x, (0x06, sp)
      00B145 A3 7D 00         [ 2]  195 	cpw	x, #0x7d00
      00B148 24 26            [ 1]  196 	jrnc	00102$
                                    197 ;	./../../mib/stm8s_mib_beep.c: 142: vbBEEPSEL = 0x02; // f / (2 * div) khz
      00B14A A6 02            [ 1]  198 	ld	a, #0x02
      00B14C 6B 06            [ 1]  199 	ld	(0x06, sp), a
                                    200 ;	./../../mib/stm8s_mib_beep.c: 143: vdwDiv = (128000 / 2) / vdwData;
      00B14E 90 89            [ 2]  201 	pushw	y
      00B150 1E 05            [ 2]  202 	ldw	x, (0x05, sp)
      00B152 89               [ 2]  203 	pushw	x
      00B153 1E 05            [ 2]  204 	ldw	x, (0x05, sp)
      00B155 89               [ 2]  205 	pushw	x
      00B156 4B 00            [ 1]  206 	push	#0x00
      00B158 4B FA            [ 1]  207 	push	#0xfa
      00B15A 5F               [ 1]  208 	clrw	x
      00B15B 89               [ 2]  209 	pushw	x
      00B15C CD B2 EB         [ 4]  210 	call	__divulong
      00B15F 5B 08            [ 2]  211 	addw	sp, #8
      00B161 02               [ 1]  212 	rlwa	x
      00B162 6B 06            [ 1]  213 	ld	(0x06, sp), a
      00B164 01               [ 1]  214 	rrwa	x
      00B165 17 04            [ 2]  215 	ldw	(0x04, sp), y
      00B167 9F               [ 1]  216 	ld	a, xl
      00B168 90 85            [ 2]  217 	popw	y
                                    218 ;	./../../mib/stm8s_mib_beep.c: 144: vbBEEPDIV =  vdwDiv - 2;
      00B16A A0 02            [ 1]  219 	sub	a, #0x02
      00B16C 6B 05            [ 1]  220 	ld	(0x05, sp), a
                                    221 ;	./../../mib/stm8s_mib_beep.c: 145: vdwDataLast = (128000 / 8) / vdwDiv;
      00B16E 20 04            [ 2]  222 	jra	00112$
      00B170                        223 00102$:
                                    224 ;	./../../mib/stm8s_mib_beep.c: 150: vbBEEPSEL = 0xFF;
      00B170 A6 FF            [ 1]  225 	ld	a, #0xff
      00B172 6B 06            [ 1]  226 	ld	(0x06, sp), a
      00B174                        227 00112$:
                                    228 ;	./../../mib/stm8s_mib_beep.c: 152: if(vbBEEPSEL!=0xFF)
      00B174 7B 06            [ 1]  229 	ld	a, (0x06, sp)
      00B176 4C               [ 1]  230 	inc	a
      00B177 27 50            [ 1]  231 	jreq	00114$
                                    232 ;	./../../mib/stm8s_mib_beep.c: 154: ccprintf(_DEBUG_BEEP_A_, ("beep init [%d : SEL(%d) : DIV(%d)] Hz\r\n",vwFreq,vbBEEPSEL,vbBEEPDIV));		
      00B179 5F               [ 1]  233 	clrw	x
      00B17A 7B 05            [ 1]  234 	ld	a, (0x05, sp)
      00B17C 97               [ 1]  235 	ld	xl, a
      00B17D 7B 06            [ 1]  236 	ld	a, (0x06, sp)
      00B17F 6B 04            [ 1]  237 	ld	(0x04, sp), a
      00B181 0F 03            [ 1]  238 	clr	(0x03, sp)
      00B183 89               [ 2]  239 	pushw	x
      00B184 1E 05            [ 2]  240 	ldw	x, (0x05, sp)
      00B186 89               [ 2]  241 	pushw	x
      00B187 90 89            [ 2]  242 	pushw	y
      00B189 4B 57            [ 1]  243 	push	#<(__str_0+0)
      00B18B 4B 8B            [ 1]  244 	push	#((__str_0+0) >> 8)
      00B18D CD 9F BD         [ 4]  245 	call	_mib_printf
      00B190 5B 08            [ 2]  246 	addw	sp, #8
                                    247 ;	./../../mib/stm8s_mib_beep.c: 157: BEEP->CSR  = BEEP_CSR_BEEPDIV;
      00B192 35 1F 50 F3      [ 1]  248 	mov	0x50f3+0, #0x1f
                                    249 ;	./../../mib/stm8s_mib_beep.c: 159: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
      00B196 C6 50 F3         [ 1]  250 	ld	a, 0x50f3
      00B199 A4 E0            [ 1]  251 	and	a, #0xe0
      00B19B C7 50 F3         [ 1]  252 	ld	0x50f3, a
                                    253 ;	./../../mib/stm8s_mib_beep.c: 160: BEEP->CSR |= (vbBEEPDIV & BEEP_CSR_BEEPDIV);
      00B19E C6 50 F3         [ 1]  254 	ld	a, 0x50f3
      00B1A1 6B 07            [ 1]  255 	ld	(0x07, sp), a
      00B1A3 7B 05            [ 1]  256 	ld	a, (0x05, sp)
      00B1A5 A4 1F            [ 1]  257 	and	a, #0x1f
      00B1A7 1A 07            [ 1]  258 	or	a, (0x07, sp)
      00B1A9 C7 50 F3         [ 1]  259 	ld	0x50f3, a
                                    260 ;	./../../mib/stm8s_mib_beep.c: 164: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
      00B1AC C6 50 F3         [ 1]  261 	ld	a, 0x50f3
      00B1AF A4 3F            [ 1]  262 	and	a, #0x3f
      00B1B1 C7 50 F3         [ 1]  263 	ld	0x50f3, a
                                    264 ;	./../../mib/stm8s_mib_beep.c: 165: BEEP->CSR |= (uint8_t)((vbBEEPSEL&0x03)<<6);
      00B1B4 C6 50 F3         [ 1]  265 	ld	a, 0x50f3
      00B1B7 6B 07            [ 1]  266 	ld	(0x07, sp), a
      00B1B9 7B 06            [ 1]  267 	ld	a, (0x06, sp)
      00B1BB A4 03            [ 1]  268 	and	a, #0x03
      00B1BD 4E               [ 1]  269 	swap	a
      00B1BE A4 F0            [ 1]  270 	and	a, #0xf0
      00B1C0 48               [ 1]  271 	sll	a
      00B1C1 48               [ 1]  272 	sll	a
      00B1C2 1A 07            [ 1]  273 	or	a, (0x07, sp)
      00B1C4 C7 50 F3         [ 1]  274 	ld	0x50f3, a
      00B1C7 20 0F            [ 2]  275 	jra	00116$
      00B1C9                        276 00114$:
                                    277 ;	./../../mib/stm8s_mib_beep.c: 170: BEEP->CSR  = BEEP_CSR_BEEPDIV;
      00B1C9 35 1F 50 F3      [ 1]  278 	mov	0x50f3+0, #0x1f
                                    279 ;	./../../mib/stm8s_mib_beep.c: 171: ccprintf(_DEBUG_BEEP_A_, ("beep init error... [%d] Hz\r\n",vwFreq));		
      00B1CD 90 89            [ 2]  280 	pushw	y
      00B1CF 4B 7F            [ 1]  281 	push	#<(__str_1+0)
      00B1D1 4B 8B            [ 1]  282 	push	#((__str_1+0) >> 8)
      00B1D3 CD 9F BD         [ 4]  283 	call	_mib_printf
      00B1D6 5B 04            [ 2]  284 	addw	sp, #4
      00B1D8                        285 00116$:
                                    286 ;	./../../mib/stm8s_mib_beep.c: 173: }
      00B1D8 5B 07            [ 2]  287 	addw	sp, #7
      00B1DA 81               [ 4]  288 	ret
                                    289 	.area CODE
                                    290 	.area CONST
                                    291 	.area CONST
      008B57                        292 __str_0:
      008B57 62 65 65 70 20 69 6E   293 	.ascii "beep init [%d : SEL(%d) : DIV(%d)] Hz"
             69 74 20 5B 25 64 20
             3A 20 53 45 4C 28 25
             64 29 20 3A 20 44 49
             56 28 25 64 29 5D 20
             48 7A
      008B7C 0D                     294 	.db 0x0d
      008B7D 0A                     295 	.db 0x0a
      008B7E 00                     296 	.db 0x00
                                    297 	.area CODE
                                    298 	.area CONST
      008B7F                        299 __str_1:
      008B7F 62 65 65 70 20 69 6E   300 	.ascii "beep init error... [%d] Hz"
             69 74 20 65 72 72 6F
             72 2E 2E 2E 20 5B 25
             64 5D 20 48 7A
      008B99 0D                     301 	.db 0x0d
      008B9A 0A                     302 	.db 0x0a
      008B9B 00                     303 	.db 0x00
                                    304 	.area CODE
                                    305 	.area INITIALIZER
                                    306 	.area CABS (ABS)
