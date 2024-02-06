                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_flash
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _FLASH_Unlock
                                     12 	.globl _FLASH_Lock
                                     13 	.globl _FLASH_DeInit
                                     14 	.globl _FLASH_ITConfig
                                     15 	.globl _FLASH_EraseByte
                                     16 	.globl _FLASH_ProgramByte
                                     17 	.globl _FLASH_ReadByte
                                     18 	.globl _FLASH_ProgramWord
                                     19 	.globl _FLASH_ProgramOptionByte
                                     20 	.globl _FLASH_EraseOptionByte
                                     21 	.globl _FLASH_ReadOptionByte
                                     22 	.globl _FLASH_SetLowPowerMode
                                     23 	.globl _FLASH_SetProgrammingTime
                                     24 	.globl _FLASH_GetLowPowerMode
                                     25 	.globl _FLASH_GetProgrammingTime
                                     26 	.globl _FLASH_GetBootSize
                                     27 	.globl _FLASH_GetFlagStatus
                                     28 	.globl _FLASH_WaitForLastOperation
                                     29 	.globl _FLASH_EraseBlock
                                     30 	.globl _FLASH_ProgramBlock
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DATA
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area INITIALIZED
                                     39 ;--------------------------------------------------------
                                     40 ; absolute external ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area DABS (ABS)
                                     43 
                                     44 ; default segment ordering for linker
                                     45 	.area HOME
                                     46 	.area GSINIT
                                     47 	.area GSFINAL
                                     48 	.area CONST
                                     49 	.area INITIALIZER
                                     50 	.area CODE
                                     51 
                                     52 ;--------------------------------------------------------
                                     53 ; global & static initialisations
                                     54 ;--------------------------------------------------------
                                     55 	.area HOME
                                     56 	.area GSINIT
                                     57 	.area GSFINAL
                                     58 	.area GSINIT
                                     59 ;--------------------------------------------------------
                                     60 ; Home
                                     61 ;--------------------------------------------------------
                                     62 	.area HOME
                                     63 	.area HOME
                                     64 ;--------------------------------------------------------
                                     65 ; code
                                     66 ;--------------------------------------------------------
                                     67 	.area CODE
                                     68 ;	./../../lib/src/stm8s_flash.c: 87: void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
                                     69 ;	-----------------------------------------
                                     70 ;	 function FLASH_Unlock
                                     71 ;	-----------------------------------------
      00930A                         72 _FLASH_Unlock:
                                     73 ;	./../../lib/src/stm8s_flash.c: 93: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      00930A A1 FD            [ 1]   74 	cp	a, #0xfd
      00930C 26 09            [ 1]   75 	jrne	00102$
                                     76 ;	./../../lib/src/stm8s_flash.c: 95: FLASH->PUKR = FLASH_RASS_KEY1;
      00930E 35 56 50 62      [ 1]   77 	mov	0x5062+0, #0x56
                                     78 ;	./../../lib/src/stm8s_flash.c: 96: FLASH->PUKR = FLASH_RASS_KEY2;
      009312 35 AE 50 62      [ 1]   79 	mov	0x5062+0, #0xae
      009316 81               [ 4]   80 	ret
      009317                         81 00102$:
                                     82 ;	./../../lib/src/stm8s_flash.c: 101: FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
      009317 35 AE 50 64      [ 1]   83 	mov	0x5064+0, #0xae
                                     84 ;	./../../lib/src/stm8s_flash.c: 102: FLASH->DUKR = FLASH_RASS_KEY1;
      00931B 35 56 50 64      [ 1]   85 	mov	0x5064+0, #0x56
                                     86 ;	./../../lib/src/stm8s_flash.c: 104: }
      00931F 81               [ 4]   87 	ret
                                     88 ;	./../../lib/src/stm8s_flash.c: 112: void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
                                     89 ;	-----------------------------------------
                                     90 ;	 function FLASH_Lock
                                     91 ;	-----------------------------------------
      009320                         92 _FLASH_Lock:
      009320 88               [ 1]   93 	push	a
      009321 6B 01            [ 1]   94 	ld	(0x01, sp), a
                                     95 ;	./../../lib/src/stm8s_flash.c: 118: FLASH->IAPSR &= (uint8_t)FLASH_MemType;
      009323 C6 50 5F         [ 1]   96 	ld	a, 0x505f
      009326 14 01            [ 1]   97 	and	a, (0x01, sp)
      009328 C7 50 5F         [ 1]   98 	ld	0x505f, a
                                     99 ;	./../../lib/src/stm8s_flash.c: 119: }
      00932B 84               [ 1]  100 	pop	a
      00932C 81               [ 4]  101 	ret
                                    102 ;	./../../lib/src/stm8s_flash.c: 126: void FLASH_DeInit(void)
                                    103 ;	-----------------------------------------
                                    104 ;	 function FLASH_DeInit
                                    105 ;	-----------------------------------------
      00932D                        106 _FLASH_DeInit:
                                    107 ;	./../../lib/src/stm8s_flash.c: 128: FLASH->CR1 = FLASH_CR1_RESET_VALUE;
      00932D 35 00 50 5A      [ 1]  108 	mov	0x505a+0, #0x00
                                    109 ;	./../../lib/src/stm8s_flash.c: 129: FLASH->CR2 = FLASH_CR2_RESET_VALUE;
      009331 35 00 50 5B      [ 1]  110 	mov	0x505b+0, #0x00
                                    111 ;	./../../lib/src/stm8s_flash.c: 130: FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
      009335 35 FF 50 5C      [ 1]  112 	mov	0x505c+0, #0xff
                                    113 ;	./../../lib/src/stm8s_flash.c: 131: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
      009339 72 17 50 5F      [ 1]  114 	bres	0x505f, #3
                                    115 ;	./../../lib/src/stm8s_flash.c: 132: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
      00933D 72 13 50 5F      [ 1]  116 	bres	0x505f, #1
                                    117 ;	./../../lib/src/stm8s_flash.c: 133: (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
      009341 C6 50 5F         [ 1]  118 	ld	a, 0x505f
                                    119 ;	./../../lib/src/stm8s_flash.c: 134: }
      009344 81               [ 4]  120 	ret
                                    121 ;	./../../lib/src/stm8s_flash.c: 142: void FLASH_ITConfig(FunctionalState NewState)
                                    122 ;	-----------------------------------------
                                    123 ;	 function FLASH_ITConfig
                                    124 ;	-----------------------------------------
      009345                        125 _FLASH_ITConfig:
      009345 88               [ 1]  126 	push	a
      009346 6B 01            [ 1]  127 	ld	(0x01, sp), a
                                    128 ;	./../../lib/src/stm8s_flash.c: 149: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
      009348 C6 50 5A         [ 1]  129 	ld	a, 0x505a
                                    130 ;	./../../lib/src/stm8s_flash.c: 147: if(NewState != DISABLE)
      00934B 0D 01            [ 1]  131 	tnz	(0x01, sp)
      00934D 27 07            [ 1]  132 	jreq	00102$
                                    133 ;	./../../lib/src/stm8s_flash.c: 149: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
      00934F AA 02            [ 1]  134 	or	a, #0x02
      009351 C7 50 5A         [ 1]  135 	ld	0x505a, a
      009354 20 05            [ 2]  136 	jra	00104$
      009356                        137 00102$:
                                    138 ;	./../../lib/src/stm8s_flash.c: 153: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
      009356 A4 FD            [ 1]  139 	and	a, #0xfd
      009358 C7 50 5A         [ 1]  140 	ld	0x505a, a
      00935B                        141 00104$:
                                    142 ;	./../../lib/src/stm8s_flash.c: 155: }
      00935B 84               [ 1]  143 	pop	a
      00935C 81               [ 4]  144 	ret
                                    145 ;	./../../lib/src/stm8s_flash.c: 164: void FLASH_EraseByte(uint32_t Address)
                                    146 ;	-----------------------------------------
                                    147 ;	 function FLASH_EraseByte
                                    148 ;	-----------------------------------------
      00935D                        149 _FLASH_EraseByte:
                                    150 ;	./../../lib/src/stm8s_flash.c: 170: *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE;
      00935D 1E 05            [ 2]  151 	ldw	x, (0x05, sp)
      00935F 7F               [ 1]  152 	clr	(x)
                                    153 ;	./../../lib/src/stm8s_flash.c: 171: }
      009360 1E 01            [ 2]  154 	ldw	x, (1, sp)
      009362 5B 06            [ 2]  155 	addw	sp, #6
      009364 FC               [ 2]  156 	jp	(x)
                                    157 ;	./../../lib/src/stm8s_flash.c: 181: void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
                                    158 ;	-----------------------------------------
                                    159 ;	 function FLASH_ProgramByte
                                    160 ;	-----------------------------------------
      009365                        161 _FLASH_ProgramByte:
                                    162 ;	./../../lib/src/stm8s_flash.c: 185: *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
      009365 1E 05            [ 2]  163 	ldw	x, (0x05, sp)
      009367 7B 07            [ 1]  164 	ld	a, (0x07, sp)
      009369 F7               [ 1]  165 	ld	(x), a
                                    166 ;	./../../lib/src/stm8s_flash.c: 186: }
      00936A 1E 01            [ 2]  167 	ldw	x, (1, sp)
      00936C 5B 07            [ 2]  168 	addw	sp, #7
      00936E FC               [ 2]  169 	jp	(x)
                                    170 ;	./../../lib/src/stm8s_flash.c: 195: uint8_t FLASH_ReadByte(uint32_t Address)
                                    171 ;	-----------------------------------------
                                    172 ;	 function FLASH_ReadByte
                                    173 ;	-----------------------------------------
      00936F                        174 _FLASH_ReadByte:
                                    175 ;	./../../lib/src/stm8s_flash.c: 201: return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
      00936F 1E 05            [ 2]  176 	ldw	x, (0x05, sp)
      009371 F6               [ 1]  177 	ld	a, (x)
                                    178 ;	./../../lib/src/stm8s_flash.c: 202: }
      009372 1E 01            [ 2]  179 	ldw	x, (1, sp)
      009374 5B 06            [ 2]  180 	addw	sp, #6
      009376 FC               [ 2]  181 	jp	(x)
                                    182 ;	./../../lib/src/stm8s_flash.c: 212: void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
                                    183 ;	-----------------------------------------
                                    184 ;	 function FLASH_ProgramWord
                                    185 ;	-----------------------------------------
      009377                        186 _FLASH_ProgramWord:
      009377 52 04            [ 2]  187 	sub	sp, #4
                                    188 ;	./../../lib/src/stm8s_flash.c: 218: FLASH->CR2 |= FLASH_CR2_WPRG;
      009379 72 1C 50 5B      [ 1]  189 	bset	0x505b, #6
                                    190 ;	./../../lib/src/stm8s_flash.c: 219: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
      00937D 72 1D 50 5C      [ 1]  191 	bres	0x505c, #6
                                    192 ;	./../../lib/src/stm8s_flash.c: 222: *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
      009381 1E 09            [ 2]  193 	ldw	x, (0x09, sp)
      009383 1F 01            [ 2]  194 	ldw	(0x01, sp), x
      009385 90 96            [ 1]  195 	ldw	y, sp
      009387 72 A9 00 0B      [ 2]  196 	addw	y, #11
      00938B 93               [ 1]  197 	ldw	x, y
      00938C F6               [ 1]  198 	ld	a, (x)
      00938D 1E 01            [ 2]  199 	ldw	x, (0x01, sp)
      00938F F7               [ 1]  200 	ld	(x), a
                                    201 ;	./../../lib/src/stm8s_flash.c: 224: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1);
      009390 1E 01            [ 2]  202 	ldw	x, (0x01, sp)
      009392 5C               [ 1]  203 	incw	x
      009393 1F 03            [ 2]  204 	ldw	(0x03, sp), x
      009395 93               [ 1]  205 	ldw	x, y
      009396 E6 01            [ 1]  206 	ld	a, (0x1, x)
      009398 1E 03            [ 2]  207 	ldw	x, (0x03, sp)
      00939A F7               [ 1]  208 	ld	(x), a
                                    209 ;	./../../lib/src/stm8s_flash.c: 226: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2);
      00939B 1E 01            [ 2]  210 	ldw	x, (0x01, sp)
      00939D 5C               [ 1]  211 	incw	x
      00939E 5C               [ 1]  212 	incw	x
      00939F 1F 03            [ 2]  213 	ldw	(0x03, sp), x
      0093A1 93               [ 1]  214 	ldw	x, y
      0093A2 E6 02            [ 1]  215 	ld	a, (0x2, x)
      0093A4 1E 03            [ 2]  216 	ldw	x, (0x03, sp)
      0093A6 F7               [ 1]  217 	ld	(x), a
                                    218 ;	./../../lib/src/stm8s_flash.c: 228: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3);
      0093A7 1E 01            [ 2]  219 	ldw	x, (0x01, sp)
      0093A9 90 E6 03         [ 1]  220 	ld	a, (0x3, y)
      0093AC E7 03            [ 1]  221 	ld	(0x0003, x), a
                                    222 ;	./../../lib/src/stm8s_flash.c: 229: }
      0093AE 1E 05            [ 2]  223 	ldw	x, (5, sp)
      0093B0 5B 0E            [ 2]  224 	addw	sp, #14
      0093B2 FC               [ 2]  225 	jp	(x)
                                    226 ;	./../../lib/src/stm8s_flash.c: 237: void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
                                    227 ;	-----------------------------------------
                                    228 ;	 function FLASH_ProgramOptionByte
                                    229 ;	-----------------------------------------
      0093B3                        230 _FLASH_ProgramOptionByte:
      0093B3 52 05            [ 2]  231 	sub	sp, #5
      0093B5 6B 05            [ 1]  232 	ld	(0x05, sp), a
                                    233 ;	./../../lib/src/stm8s_flash.c: 243: FLASH->CR2 |= FLASH_CR2_OPT;
      0093B7 72 1E 50 5B      [ 1]  234 	bset	0x505b, #7
                                    235 ;	./../../lib/src/stm8s_flash.c: 244: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
      0093BB 72 1F 50 5C      [ 1]  236 	bres	0x505c, #7
                                    237 ;	./../../lib/src/stm8s_flash.c: 247: if(Address == 0x4800)
      0093BF 1F 01            [ 2]  238 	ldw	(0x01, sp), x
                                    239 ;	./../../lib/src/stm8s_flash.c: 250: *((NEAR uint8_t*)Address) = Data;
      0093C1 1F 03            [ 2]  240 	ldw	(0x03, sp), x
                                    241 ;	./../../lib/src/stm8s_flash.c: 247: if(Address == 0x4800)
      0093C3 1E 01            [ 2]  242 	ldw	x, (0x01, sp)
      0093C5 A3 48 00         [ 2]  243 	cpw	x, #0x4800
      0093C8 26 07            [ 1]  244 	jrne	00102$
                                    245 ;	./../../lib/src/stm8s_flash.c: 250: *((NEAR uint8_t*)Address) = Data;
      0093CA 1E 03            [ 2]  246 	ldw	x, (0x03, sp)
      0093CC 7B 05            [ 1]  247 	ld	a, (0x05, sp)
      0093CE F7               [ 1]  248 	ld	(x), a
      0093CF 20 0C            [ 2]  249 	jra	00103$
      0093D1                        250 00102$:
                                    251 ;	./../../lib/src/stm8s_flash.c: 255: *((NEAR uint8_t*)Address) = Data;
      0093D1 1E 03            [ 2]  252 	ldw	x, (0x03, sp)
      0093D3 7B 05            [ 1]  253 	ld	a, (0x05, sp)
      0093D5 F7               [ 1]  254 	ld	(x), a
                                    255 ;	./../../lib/src/stm8s_flash.c: 256: *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
      0093D6 1E 01            [ 2]  256 	ldw	x, (0x01, sp)
      0093D8 5C               [ 1]  257 	incw	x
      0093D9 7B 05            [ 1]  258 	ld	a, (0x05, sp)
      0093DB 43               [ 1]  259 	cpl	a
      0093DC F7               [ 1]  260 	ld	(x), a
      0093DD                        261 00103$:
                                    262 ;	./../../lib/src/stm8s_flash.c: 258: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
      0093DD A6 FD            [ 1]  263 	ld	a, #0xfd
      0093DF CD 94 B4         [ 4]  264 	call	_FLASH_WaitForLastOperation
                                    265 ;	./../../lib/src/stm8s_flash.c: 261: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
      0093E2 72 1F 50 5B      [ 1]  266 	bres	0x505b, #7
                                    267 ;	./../../lib/src/stm8s_flash.c: 262: FLASH->NCR2 |= FLASH_NCR2_NOPT;
      0093E6 72 1E 50 5C      [ 1]  268 	bset	0x505c, #7
                                    269 ;	./../../lib/src/stm8s_flash.c: 263: }
      0093EA 5B 05            [ 2]  270 	addw	sp, #5
      0093EC 81               [ 4]  271 	ret
                                    272 ;	./../../lib/src/stm8s_flash.c: 270: void FLASH_EraseOptionByte(uint16_t Address)
                                    273 ;	-----------------------------------------
                                    274 ;	 function FLASH_EraseOptionByte
                                    275 ;	-----------------------------------------
      0093ED                        276 _FLASH_EraseOptionByte:
      0093ED 52 02            [ 2]  277 	sub	sp, #2
      0093EF 51               [ 1]  278 	exgw	x, y
                                    279 ;	./../../lib/src/stm8s_flash.c: 276: FLASH->CR2 |= FLASH_CR2_OPT;
      0093F0 72 1E 50 5B      [ 1]  280 	bset	0x505b, #7
                                    281 ;	./../../lib/src/stm8s_flash.c: 277: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
      0093F4 72 1F 50 5C      [ 1]  282 	bres	0x505c, #7
                                    283 ;	./../../lib/src/stm8s_flash.c: 280: if(Address == 0x4800)
      0093F8 93               [ 1]  284 	ldw	x, y
                                    285 ;	./../../lib/src/stm8s_flash.c: 283: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      0093F9 17 01            [ 2]  286 	ldw	(0x01, sp), y
                                    287 ;	./../../lib/src/stm8s_flash.c: 280: if(Address == 0x4800)
      0093FB A3 48 00         [ 2]  288 	cpw	x, #0x4800
      0093FE 26 05            [ 1]  289 	jrne	00102$
                                    290 ;	./../../lib/src/stm8s_flash.c: 283: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      009400 1E 01            [ 2]  291 	ldw	x, (0x01, sp)
      009402 7F               [ 1]  292 	clr	(x)
      009403 20 08            [ 2]  293 	jra	00103$
      009405                        294 00102$:
                                    295 ;	./../../lib/src/stm8s_flash.c: 288: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      009405 1E 01            [ 2]  296 	ldw	x, (0x01, sp)
      009407 7F               [ 1]  297 	clr	(x)
                                    298 ;	./../../lib/src/stm8s_flash.c: 289: *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
      009408 93               [ 1]  299 	ldw	x, y
      009409 5C               [ 1]  300 	incw	x
      00940A A6 FF            [ 1]  301 	ld	a, #0xff
      00940C F7               [ 1]  302 	ld	(x), a
      00940D                        303 00103$:
                                    304 ;	./../../lib/src/stm8s_flash.c: 291: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
      00940D A6 FD            [ 1]  305 	ld	a, #0xfd
      00940F CD 94 B4         [ 4]  306 	call	_FLASH_WaitForLastOperation
                                    307 ;	./../../lib/src/stm8s_flash.c: 294: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
      009412 72 1F 50 5B      [ 1]  308 	bres	0x505b, #7
                                    309 ;	./../../lib/src/stm8s_flash.c: 295: FLASH->NCR2 |= FLASH_NCR2_NOPT;
      009416 72 1E 50 5C      [ 1]  310 	bset	0x505c, #7
                                    311 ;	./../../lib/src/stm8s_flash.c: 296: }
      00941A 5B 02            [ 2]  312 	addw	sp, #2
      00941C 81               [ 4]  313 	ret
                                    314 ;	./../../lib/src/stm8s_flash.c: 303: uint16_t FLASH_ReadOptionByte(uint16_t Address)
                                    315 ;	-----------------------------------------
                                    316 ;	 function FLASH_ReadOptionByte
                                    317 ;	-----------------------------------------
      00941D                        318 _FLASH_ReadOptionByte:
      00941D 52 02            [ 2]  319 	sub	sp, #2
                                    320 ;	./../../lib/src/stm8s_flash.c: 311: value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
      00941F 90 93            [ 1]  321 	ldw	y, x
      009421 F6               [ 1]  322 	ld	a, (x)
      009422 6B 01            [ 1]  323 	ld	(0x01, sp), a
                                    324 ;	./../../lib/src/stm8s_flash.c: 312: value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
      009424 E6 01            [ 1]  325 	ld	a, (0x1, x)
      009426 6B 02            [ 1]  326 	ld	(0x02, sp), a
                                    327 ;	./../../lib/src/stm8s_flash.c: 315: if(Address == 0x4800)
                                    328 ;	./../../lib/src/stm8s_flash.c: 317: res_value =	 value_optbyte;
      009428 5F               [ 1]  329 	clrw	x
      009429 7B 01            [ 1]  330 	ld	a, (0x01, sp)
      00942B 97               [ 1]  331 	ld	xl, a
                                    332 ;	./../../lib/src/stm8s_flash.c: 315: if(Address == 0x4800)
      00942C 90 A3 48 00      [ 2]  333 	cpw	y, #0x4800
      009430 27 19            [ 1]  334 	jreq	00106$
                                    335 ;	./../../lib/src/stm8s_flash.c: 317: res_value =	 value_optbyte;
                                    336 ;	./../../lib/src/stm8s_flash.c: 321: if(value_optbyte == (uint8_t)(~value_optbyte_complement))
      009432 7B 02            [ 1]  337 	ld	a, (0x02, sp)
      009434 43               [ 1]  338 	cpl	a
      009435 11 01            [ 1]  339 	cp	a, (0x01, sp)
      009437 26 0F            [ 1]  340 	jrne	00102$
                                    341 ;	./../../lib/src/stm8s_flash.c: 323: res_value = (uint16_t)((uint16_t)value_optbyte << 8);
      009439 4F               [ 1]  342 	clr	a
      00943A 02               [ 1]  343 	rlwa	x
                                    344 ;	./../../lib/src/stm8s_flash.c: 324: res_value = res_value | (uint16_t)value_optbyte_complement;
      00943B 7B 02            [ 1]  345 	ld	a, (0x02, sp)
      00943D 0F 01            [ 1]  346 	clr	(0x01, sp)
      00943F 89               [ 2]  347 	pushw	x
      009440 1A 02            [ 1]  348 	or	a, (2, sp)
      009442 85               [ 2]  349 	popw	x
      009443 02               [ 1]  350 	rlwa	x
      009444 1A 01            [ 1]  351 	or	a, (0x01, sp)
      009446 95               [ 1]  352 	ld	xh, a
                                    353 ;	./../../lib/src/stm8s_flash.c: 328: res_value = FLASH_OPTIONBYTE_ERROR;
      009447 BC                     354 	.byte 0xbc
      009448                        355 00102$:
      009448 AE 55 55         [ 2]  356 	ldw	x, #0x5555
      00944B                        357 00106$:
                                    358 ;	./../../lib/src/stm8s_flash.c: 331: return(res_value);
                                    359 ;	./../../lib/src/stm8s_flash.c: 332: }
      00944B 5B 02            [ 2]  360 	addw	sp, #2
      00944D 81               [ 4]  361 	ret
                                    362 ;	./../../lib/src/stm8s_flash.c: 340: void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
                                    363 ;	-----------------------------------------
                                    364 ;	 function FLASH_SetLowPowerMode
                                    365 ;	-----------------------------------------
      00944E                        366 _FLASH_SetLowPowerMode:
      00944E 88               [ 1]  367 	push	a
      00944F 6B 01            [ 1]  368 	ld	(0x01, sp), a
                                    369 ;	./../../lib/src/stm8s_flash.c: 346: FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT));
      009451 C6 50 5A         [ 1]  370 	ld	a, 0x505a
      009454 A4 F3            [ 1]  371 	and	a, #0xf3
      009456 C7 50 5A         [ 1]  372 	ld	0x505a, a
                                    373 ;	./../../lib/src/stm8s_flash.c: 349: FLASH->CR1 |= (uint8_t)FLASH_LPMode;
      009459 C6 50 5A         [ 1]  374 	ld	a, 0x505a
      00945C 1A 01            [ 1]  375 	or	a, (0x01, sp)
      00945E C7 50 5A         [ 1]  376 	ld	0x505a, a
                                    377 ;	./../../lib/src/stm8s_flash.c: 350: }
      009461 84               [ 1]  378 	pop	a
      009462 81               [ 4]  379 	ret
                                    380 ;	./../../lib/src/stm8s_flash.c: 358: void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
                                    381 ;	-----------------------------------------
                                    382 ;	 function FLASH_SetProgrammingTime
                                    383 ;	-----------------------------------------
      009463                        384 _FLASH_SetProgrammingTime:
      009463 97               [ 1]  385 	ld	xl, a
                                    386 ;	./../../lib/src/stm8s_flash.c: 363: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
      009464 C6 50 5A         [ 1]  387 	ld	a, 0x505a
      009467 A4 FE            [ 1]  388 	and	a, #0xfe
      009469 C7 50 5A         [ 1]  389 	ld	0x505a, a
                                    390 ;	./../../lib/src/stm8s_flash.c: 364: FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
      00946C C6 50 5A         [ 1]  391 	ld	a, 0x505a
      00946F 89               [ 2]  392 	pushw	x
      009470 1A 02            [ 1]  393 	or	a, (2, sp)
      009472 85               [ 2]  394 	popw	x
      009473 C7 50 5A         [ 1]  395 	ld	0x505a, a
                                    396 ;	./../../lib/src/stm8s_flash.c: 365: }
      009476 81               [ 4]  397 	ret
                                    398 ;	./../../lib/src/stm8s_flash.c: 372: FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
                                    399 ;	-----------------------------------------
                                    400 ;	 function FLASH_GetLowPowerMode
                                    401 ;	-----------------------------------------
      009477                        402 _FLASH_GetLowPowerMode:
                                    403 ;	./../../lib/src/stm8s_flash.c: 374: return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
      009477 C6 50 5A         [ 1]  404 	ld	a, 0x505a
      00947A A4 0C            [ 1]  405 	and	a, #0x0c
                                    406 ;	./../../lib/src/stm8s_flash.c: 375: }
      00947C 81               [ 4]  407 	ret
                                    408 ;	./../../lib/src/stm8s_flash.c: 382: FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
                                    409 ;	-----------------------------------------
                                    410 ;	 function FLASH_GetProgrammingTime
                                    411 ;	-----------------------------------------
      00947D                        412 _FLASH_GetProgrammingTime:
                                    413 ;	./../../lib/src/stm8s_flash.c: 384: return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
      00947D C6 50 5A         [ 1]  414 	ld	a, 0x505a
      009480 A4 01            [ 1]  415 	and	a, #0x01
                                    416 ;	./../../lib/src/stm8s_flash.c: 385: }
      009482 81               [ 4]  417 	ret
                                    418 ;	./../../lib/src/stm8s_flash.c: 392: uint32_t FLASH_GetBootSize(void)
                                    419 ;	-----------------------------------------
                                    420 ;	 function FLASH_GetBootSize
                                    421 ;	-----------------------------------------
      009483                        422 _FLASH_GetBootSize:
                                    423 ;	./../../lib/src/stm8s_flash.c: 397: temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
      009483 C6 50 5D         [ 1]  424 	ld	a, 0x505d
      009486 5F               [ 1]  425 	clrw	x
      009487 5E               [ 1]  426 	swapw	x
      009488 90 95            [ 1]  427 	ld	yh, a
      00948A 4F               [ 1]  428 	clr	a
      00948B 90 97            [ 1]  429 	ld	yl, a
      00948D 90 58            [ 2]  430 	sllw	y
      00948F 59               [ 2]  431 	rlcw	x
                                    432 ;	./../../lib/src/stm8s_flash.c: 400: if(FLASH->FPR == 0xFF)
      009490 C6 50 5D         [ 1]  433 	ld	a, 0x505d
      009493 4C               [ 1]  434 	inc	a
      009494 26 0B            [ 1]  435 	jrne	00102$
                                    436 ;	./../../lib/src/stm8s_flash.c: 402: temp += 512;
      009496 72 A9 02 00      [ 2]  437 	addw	y, #0x0200
      00949A 9F               [ 1]  438 	ld	a, xl
      00949B A9 00            [ 1]  439 	adc	a, #0x00
      00949D 02               [ 1]  440 	rlwa	x
      00949E A9 00            [ 1]  441 	adc	a, #0x00
      0094A0 95               [ 1]  442 	ld	xh, a
      0094A1                        443 00102$:
                                    444 ;	./../../lib/src/stm8s_flash.c: 406: return(temp);
      0094A1 51               [ 1]  445 	exgw	x, y
                                    446 ;	./../../lib/src/stm8s_flash.c: 407: }
      0094A2 81               [ 4]  447 	ret
                                    448 ;	./../../lib/src/stm8s_flash.c: 417: FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
                                    449 ;	-----------------------------------------
                                    450 ;	 function FLASH_GetFlagStatus
                                    451 ;	-----------------------------------------
      0094A3                        452 _FLASH_GetFlagStatus:
      0094A3 88               [ 1]  453 	push	a
      0094A4 6B 01            [ 1]  454 	ld	(0x01, sp), a
                                    455 ;	./../../lib/src/stm8s_flash.c: 424: if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
      0094A6 C6 50 5F         [ 1]  456 	ld	a, 0x505f
      0094A9 14 01            [ 1]  457 	and	a, (0x01, sp)
      0094AB 27 03            [ 1]  458 	jreq	00102$
                                    459 ;	./../../lib/src/stm8s_flash.c: 426: status = SET; /* FLASH_FLAG is set */
      0094AD A6 01            [ 1]  460 	ld	a, #0x01
                                    461 ;	./../../lib/src/stm8s_flash.c: 430: status = RESET; /* FLASH_FLAG is reset*/
      0094AF 21                     462 	.byte 0x21
      0094B0                        463 00102$:
      0094B0 4F               [ 1]  464 	clr	a
      0094B1                        465 00103$:
                                    466 ;	./../../lib/src/stm8s_flash.c: 434: return status;
                                    467 ;	./../../lib/src/stm8s_flash.c: 435: }
      0094B1 5B 01            [ 2]  468 	addw	sp, #1
      0094B3 81               [ 4]  469 	ret
                                    470 ;	./../../lib/src/stm8s_flash.c: 549: IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
                                    471 ;	-----------------------------------------
                                    472 ;	 function FLASH_WaitForLastOperation
                                    473 ;	-----------------------------------------
      0094B4                        474 _FLASH_WaitForLastOperation:
      0094B4 97               [ 1]  475 	ld	xl, a
                                    476 ;	./../../lib/src/stm8s_flash.c: 551: uint8_t flagstatus = 0x00;
      0094B5 4F               [ 1]  477 	clr	a
                                    478 ;	./../../lib/src/stm8s_flash.c: 557: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      0094B6 88               [ 1]  479 	push	a
      0094B7 9F               [ 1]  480 	ld	a, xl
      0094B8 A1 FD            [ 1]  481 	cp	a, #0xfd
      0094BA 84               [ 1]  482 	pop	a
      0094BB 26 10            [ 1]  483 	jrne	00121$
                                    484 ;	./../../lib/src/stm8s_flash.c: 559: while((flagstatus == 0x00) && (timeout != 0x00))
      0094BD 5F               [ 1]  485 	clrw	x
      0094BE 5A               [ 2]  486 	decw	x
      0094BF                        487 00102$:
      0094BF 4D               [ 1]  488 	tnz	a
      0094C0 26 1B            [ 1]  489 	jrne	00111$
      0094C2 5D               [ 2]  490 	tnzw	x
      0094C3 27 18            [ 1]  491 	jreq	00111$
                                    492 ;	./../../lib/src/stm8s_flash.c: 561: flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
      0094C5 C6 50 5F         [ 1]  493 	ld	a, 0x505f
      0094C8 A4 05            [ 1]  494 	and	a, #0x05
                                    495 ;	./../../lib/src/stm8s_flash.c: 563: timeout--;
      0094CA 5A               [ 2]  496 	decw	x
      0094CB 20 F2            [ 2]  497 	jra	00102$
                                    498 ;	./../../lib/src/stm8s_flash.c: 568: while((flagstatus == 0x00) && (timeout != 0x00))
      0094CD                        499 00121$:
      0094CD 5F               [ 1]  500 	clrw	x
      0094CE 5A               [ 2]  501 	decw	x
      0094CF                        502 00106$:
      0094CF 4D               [ 1]  503 	tnz	a
      0094D0 26 0B            [ 1]  504 	jrne	00124$
      0094D2 5D               [ 2]  505 	tnzw	x
      0094D3 27 08            [ 1]  506 	jreq	00124$
                                    507 ;	./../../lib/src/stm8s_flash.c: 570: flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
      0094D5 C6 50 5F         [ 1]  508 	ld	a, 0x505f
      0094D8 A4 41            [ 1]  509 	and	a, #0x41
                                    510 ;	./../../lib/src/stm8s_flash.c: 572: timeout--;
      0094DA 5A               [ 2]  511 	decw	x
      0094DB 20 F2            [ 2]  512 	jra	00106$
                                    513 ;	./../../lib/src/stm8s_flash.c: 589: return((FLASH_Status_TypeDef)flagstatus);
                                    514 ;	./../../lib/src/stm8s_flash.c: 572: timeout--;
      0094DD                        515 00124$:
      0094DD                        516 00111$:
                                    517 ;	./../../lib/src/stm8s_flash.c: 584: if(timeout == 0x00 )
      0094DD 5D               [ 2]  518 	tnzw	x
      0094DE 27 01            [ 1]  519 	jreq	00164$
      0094E0 81               [ 4]  520 	ret
      0094E1                        521 00164$:
                                    522 ;	./../../lib/src/stm8s_flash.c: 586: flagstatus = FLASH_STATUS_TIMEOUT;
      0094E1 A6 02            [ 1]  523 	ld	a, #0x02
                                    524 ;	./../../lib/src/stm8s_flash.c: 589: return((FLASH_Status_TypeDef)flagstatus);
                                    525 ;	./../../lib/src/stm8s_flash.c: 590: }
      0094E3 81               [ 4]  526 	ret
                                    527 ;	./../../lib/src/stm8s_flash.c: 599: IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
                                    528 ;	-----------------------------------------
                                    529 ;	 function FLASH_EraseBlock
                                    530 ;	-----------------------------------------
      0094E4                        531 _FLASH_EraseBlock:
      0094E4 52 04            [ 2]  532 	sub	sp, #4
      0094E6 51               [ 1]  533 	exgw	x, y
                                    534 ;	./../../lib/src/stm8s_flash.c: 612: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      0094E7 A1 FD            [ 1]  535 	cp	a, #0xfd
      0094E9 26 0A            [ 1]  536 	jrne	00102$
                                    537 ;	./../../lib/src/stm8s_flash.c: 615: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
      0094EB AE 80 00         [ 2]  538 	ldw	x, #0x8000
      0094EE 1F 03            [ 2]  539 	ldw	(0x03, sp), x
      0094F0 5F               [ 1]  540 	clrw	x
      0094F1 1F 01            [ 2]  541 	ldw	(0x01, sp), x
      0094F3 20 08            [ 2]  542 	jra	00103$
      0094F5                        543 00102$:
                                    544 ;	./../../lib/src/stm8s_flash.c: 620: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
      0094F5 AE 40 00         [ 2]  545 	ldw	x, #0x4000
      0094F8 1F 03            [ 2]  546 	ldw	(0x03, sp), x
      0094FA 5F               [ 1]  547 	clrw	x
      0094FB 1F 01            [ 2]  548 	ldw	(0x01, sp), x
      0094FD                        549 00103$:
                                    550 ;	./../../lib/src/stm8s_flash.c: 628: pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
      0094FD 93               [ 1]  551 	ldw	x, y
      0094FE 58               [ 2]  552 	sllw	x
      0094FF 58               [ 2]  553 	sllw	x
      009500 58               [ 2]  554 	sllw	x
      009501 58               [ 2]  555 	sllw	x
      009502 58               [ 2]  556 	sllw	x
      009503 58               [ 2]  557 	sllw	x
      009504 58               [ 2]  558 	sllw	x
      009505 72 FB 03         [ 2]  559 	addw	x, (0x03, sp)
                                    560 ;	./../../lib/src/stm8s_flash.c: 632: FLASH->CR2 |= FLASH_CR2_ERASE;
      009508 72 1A 50 5B      [ 1]  561 	bset	0x505b, #5
                                    562 ;	./../../lib/src/stm8s_flash.c: 633: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
      00950C 72 1B 50 5C      [ 1]  563 	bres	0x505c, #5
                                    564 ;	./../../lib/src/stm8s_flash.c: 637: *pwFlash = (uint32_t)0;
      009510 6F 03            [ 1]  565 	clr	(0x3, x)
      009512 6F 02            [ 1]  566 	clr	(0x2, x)
      009514 6F 01            [ 1]  567 	clr	(0x1, x)
      009516 7F               [ 1]  568 	clr	(x)
                                    569 ;	./../../lib/src/stm8s_flash.c: 645: }
      009517 5B 04            [ 2]  570 	addw	sp, #4
      009519 81               [ 4]  571 	ret
                                    572 ;	./../../lib/src/stm8s_flash.c: 656: IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
                                    573 ;	-----------------------------------------
                                    574 ;	 function FLASH_ProgramBlock
                                    575 ;	-----------------------------------------
      00951A                        576 _FLASH_ProgramBlock:
      00951A 52 08            [ 2]  577 	sub	sp, #8
      00951C 51               [ 1]  578 	exgw	x, y
                                    579 ;	./../../lib/src/stm8s_flash.c: 665: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      00951D A1 FD            [ 1]  580 	cp	a, #0xfd
      00951F 26 09            [ 1]  581 	jrne	00102$
                                    582 ;	./../../lib/src/stm8s_flash.c: 668: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
      009521 0F 04            [ 1]  583 	clr	(0x04, sp)
      009523 A6 80            [ 1]  584 	ld	a, #0x80
      009525 5F               [ 1]  585 	clrw	x
      009526 1F 01            [ 2]  586 	ldw	(0x01, sp), x
      009528 20 07            [ 2]  587 	jra	00103$
      00952A                        588 00102$:
                                    589 ;	./../../lib/src/stm8s_flash.c: 673: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
      00952A 0F 04            [ 1]  590 	clr	(0x04, sp)
      00952C A6 40            [ 1]  591 	ld	a, #0x40
      00952E 5F               [ 1]  592 	clrw	x
      00952F 1F 01            [ 2]  593 	ldw	(0x01, sp), x
      009531                        594 00103$:
                                    595 ;	./../../lib/src/stm8s_flash.c: 677: startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
      009531 5F               [ 1]  596 	clrw	x
      009532 88               [ 1]  597 	push	a
      009533 A6 07            [ 1]  598 	ld	a, #0x07
      009535                        599 00131$:
      009535 90 58            [ 2]  600 	sllw	y
      009537 59               [ 2]  601 	rlcw	x
      009538 4A               [ 1]  602 	dec	a
      009539 26 FA            [ 1]  603 	jrne	00131$
      00953B 17 08            [ 2]  604 	ldw	(0x08, sp), y
      00953D 84               [ 1]  605 	pop	a
      00953E 90 95            [ 1]  606 	ld	yh, a
      009540 61               [ 1]  607 	exg	a, yl
      009541 7B 04            [ 1]  608 	ld	a, (0x04, sp)
      009543 61               [ 1]  609 	exg	a, yl
      009544 72 F9 07         [ 2]  610 	addw	y, (0x07, sp)
      009547 9F               [ 1]  611 	ld	a, xl
      009548 19 02            [ 1]  612 	adc	a, (0x02, sp)
      00954A 02               [ 1]  613 	rlwa	x
      00954B 19 01            [ 1]  614 	adc	a, (0x01, sp)
      00954D 95               [ 1]  615 	ld	xh, a
      00954E 17 03            [ 2]  616 	ldw	(0x03, sp), y
      009550 1F 01            [ 2]  617 	ldw	(0x01, sp), x
                                    618 ;	./../../lib/src/stm8s_flash.c: 683: FLASH->CR2 |= FLASH_CR2_PRG;
      009552 C6 50 5B         [ 1]  619 	ld	a, 0x505b
                                    620 ;	./../../lib/src/stm8s_flash.c: 680: if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
      009555 0D 0B            [ 1]  621 	tnz	(0x0b, sp)
      009557 26 0B            [ 1]  622 	jrne	00105$
                                    623 ;	./../../lib/src/stm8s_flash.c: 683: FLASH->CR2 |= FLASH_CR2_PRG;
      009559 AA 01            [ 1]  624 	or	a, #0x01
      00955B C7 50 5B         [ 1]  625 	ld	0x505b, a
                                    626 ;	./../../lib/src/stm8s_flash.c: 684: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
      00955E 72 11 50 5C      [ 1]  627 	bres	0x505c, #0
      009562 20 09            [ 2]  628 	jra	00114$
      009564                        629 00105$:
                                    630 ;	./../../lib/src/stm8s_flash.c: 689: FLASH->CR2 |= FLASH_CR2_FPRG;
      009564 AA 10            [ 1]  631 	or	a, #0x10
      009566 C7 50 5B         [ 1]  632 	ld	0x505b, a
                                    633 ;	./../../lib/src/stm8s_flash.c: 690: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
      009569 72 19 50 5C      [ 1]  634 	bres	0x505c, #4
                                    635 ;	./../../lib/src/stm8s_flash.c: 694: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
      00956D                        636 00114$:
      00956D 90 5F            [ 1]  637 	clrw	y
      00956F                        638 00108$:
                                    639 ;	./../../lib/src/stm8s_flash.c: 696: *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
      00956F 1E 03            [ 2]  640 	ldw	x, (0x03, sp)
      009571 1F 05            [ 2]  641 	ldw	(0x05, sp), x
      009573 93               [ 1]  642 	ldw	x, y
      009574 72 FB 05         [ 2]  643 	addw	x, (0x05, sp)
      009577 1F 07            [ 2]  644 	ldw	(0x07, sp), x
      009579 93               [ 1]  645 	ldw	x, y
      00957A 72 FB 0C         [ 2]  646 	addw	x, (0x0c, sp)
      00957D F6               [ 1]  647 	ld	a, (x)
      00957E 1E 07            [ 2]  648 	ldw	x, (0x07, sp)
      009580 F7               [ 1]  649 	ld	(x), a
                                    650 ;	./../../lib/src/stm8s_flash.c: 694: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
      009581 90 5C            [ 1]  651 	incw	y
      009583 90 A3 00 80      [ 2]  652 	cpw	y, #0x0080
      009587 25 E6            [ 1]  653 	jrc	00108$
                                    654 ;	./../../lib/src/stm8s_flash.c: 698: }
      009589 1E 09            [ 2]  655 	ldw	x, (9, sp)
      00958B 5B 0D            [ 2]  656 	addw	sp, #13
      00958D FC               [ 2]  657 	jp	(x)
                                    658 	.area CODE
                                    659 	.area CONST
                                    660 	.area INITIALIZER
                                    661 	.area CABS (ABS)
