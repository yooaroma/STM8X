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
      00A37E                         72 _FLASH_Unlock:
                                     73 ;	./../../lib/src/stm8s_flash.c: 93: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      00A37E A1 FD            [ 1]   74 	cp	a, #0xfd
      00A380 26 09            [ 1]   75 	jrne	00102$
                                     76 ;	./../../lib/src/stm8s_flash.c: 95: FLASH->PUKR = FLASH_RASS_KEY1;
      00A382 35 56 50 62      [ 1]   77 	mov	0x5062+0, #0x56
                                     78 ;	./../../lib/src/stm8s_flash.c: 96: FLASH->PUKR = FLASH_RASS_KEY2;
      00A386 35 AE 50 62      [ 1]   79 	mov	0x5062+0, #0xae
      00A38A 81               [ 4]   80 	ret
      00A38B                         81 00102$:
                                     82 ;	./../../lib/src/stm8s_flash.c: 101: FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
      00A38B 35 AE 50 64      [ 1]   83 	mov	0x5064+0, #0xae
                                     84 ;	./../../lib/src/stm8s_flash.c: 102: FLASH->DUKR = FLASH_RASS_KEY1;
      00A38F 35 56 50 64      [ 1]   85 	mov	0x5064+0, #0x56
                                     86 ;	./../../lib/src/stm8s_flash.c: 104: }
      00A393 81               [ 4]   87 	ret
                                     88 ;	./../../lib/src/stm8s_flash.c: 112: void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
                                     89 ;	-----------------------------------------
                                     90 ;	 function FLASH_Lock
                                     91 ;	-----------------------------------------
      00A394                         92 _FLASH_Lock:
      00A394 88               [ 1]   93 	push	a
      00A395 6B 01            [ 1]   94 	ld	(0x01, sp), a
                                     95 ;	./../../lib/src/stm8s_flash.c: 118: FLASH->IAPSR &= (uint8_t)FLASH_MemType;
      00A397 C6 50 5F         [ 1]   96 	ld	a, 0x505f
      00A39A 14 01            [ 1]   97 	and	a, (0x01, sp)
      00A39C C7 50 5F         [ 1]   98 	ld	0x505f, a
                                     99 ;	./../../lib/src/stm8s_flash.c: 119: }
      00A39F 84               [ 1]  100 	pop	a
      00A3A0 81               [ 4]  101 	ret
                                    102 ;	./../../lib/src/stm8s_flash.c: 126: void FLASH_DeInit(void)
                                    103 ;	-----------------------------------------
                                    104 ;	 function FLASH_DeInit
                                    105 ;	-----------------------------------------
      00A3A1                        106 _FLASH_DeInit:
                                    107 ;	./../../lib/src/stm8s_flash.c: 128: FLASH->CR1 = FLASH_CR1_RESET_VALUE;
      00A3A1 35 00 50 5A      [ 1]  108 	mov	0x505a+0, #0x00
                                    109 ;	./../../lib/src/stm8s_flash.c: 129: FLASH->CR2 = FLASH_CR2_RESET_VALUE;
      00A3A5 35 00 50 5B      [ 1]  110 	mov	0x505b+0, #0x00
                                    111 ;	./../../lib/src/stm8s_flash.c: 130: FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
      00A3A9 35 FF 50 5C      [ 1]  112 	mov	0x505c+0, #0xff
                                    113 ;	./../../lib/src/stm8s_flash.c: 131: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
      00A3AD 72 17 50 5F      [ 1]  114 	bres	0x505f, #3
                                    115 ;	./../../lib/src/stm8s_flash.c: 132: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
      00A3B1 72 13 50 5F      [ 1]  116 	bres	0x505f, #1
                                    117 ;	./../../lib/src/stm8s_flash.c: 133: (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
      00A3B5 C6 50 5F         [ 1]  118 	ld	a, 0x505f
                                    119 ;	./../../lib/src/stm8s_flash.c: 134: }
      00A3B8 81               [ 4]  120 	ret
                                    121 ;	./../../lib/src/stm8s_flash.c: 142: void FLASH_ITConfig(FunctionalState NewState)
                                    122 ;	-----------------------------------------
                                    123 ;	 function FLASH_ITConfig
                                    124 ;	-----------------------------------------
      00A3B9                        125 _FLASH_ITConfig:
      00A3B9 88               [ 1]  126 	push	a
      00A3BA 6B 01            [ 1]  127 	ld	(0x01, sp), a
                                    128 ;	./../../lib/src/stm8s_flash.c: 149: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
      00A3BC C6 50 5A         [ 1]  129 	ld	a, 0x505a
                                    130 ;	./../../lib/src/stm8s_flash.c: 147: if(NewState != DISABLE)
      00A3BF 0D 01            [ 1]  131 	tnz	(0x01, sp)
      00A3C1 27 07            [ 1]  132 	jreq	00102$
                                    133 ;	./../../lib/src/stm8s_flash.c: 149: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
      00A3C3 AA 02            [ 1]  134 	or	a, #0x02
      00A3C5 C7 50 5A         [ 1]  135 	ld	0x505a, a
      00A3C8 20 05            [ 2]  136 	jra	00104$
      00A3CA                        137 00102$:
                                    138 ;	./../../lib/src/stm8s_flash.c: 153: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
      00A3CA A4 FD            [ 1]  139 	and	a, #0xfd
      00A3CC C7 50 5A         [ 1]  140 	ld	0x505a, a
      00A3CF                        141 00104$:
                                    142 ;	./../../lib/src/stm8s_flash.c: 155: }
      00A3CF 84               [ 1]  143 	pop	a
      00A3D0 81               [ 4]  144 	ret
                                    145 ;	./../../lib/src/stm8s_flash.c: 164: void FLASH_EraseByte(uint32_t Address)
                                    146 ;	-----------------------------------------
                                    147 ;	 function FLASH_EraseByte
                                    148 ;	-----------------------------------------
      00A3D1                        149 _FLASH_EraseByte:
                                    150 ;	./../../lib/src/stm8s_flash.c: 170: *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE;
      00A3D1 1E 05            [ 2]  151 	ldw	x, (0x05, sp)
      00A3D3 7F               [ 1]  152 	clr	(x)
                                    153 ;	./../../lib/src/stm8s_flash.c: 171: }
      00A3D4 1E 01            [ 2]  154 	ldw	x, (1, sp)
      00A3D6 5B 06            [ 2]  155 	addw	sp, #6
      00A3D8 FC               [ 2]  156 	jp	(x)
                                    157 ;	./../../lib/src/stm8s_flash.c: 181: void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
                                    158 ;	-----------------------------------------
                                    159 ;	 function FLASH_ProgramByte
                                    160 ;	-----------------------------------------
      00A3D9                        161 _FLASH_ProgramByte:
                                    162 ;	./../../lib/src/stm8s_flash.c: 185: *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
      00A3D9 1E 05            [ 2]  163 	ldw	x, (0x05, sp)
      00A3DB 7B 07            [ 1]  164 	ld	a, (0x07, sp)
      00A3DD F7               [ 1]  165 	ld	(x), a
                                    166 ;	./../../lib/src/stm8s_flash.c: 186: }
      00A3DE 1E 01            [ 2]  167 	ldw	x, (1, sp)
      00A3E0 5B 07            [ 2]  168 	addw	sp, #7
      00A3E2 FC               [ 2]  169 	jp	(x)
                                    170 ;	./../../lib/src/stm8s_flash.c: 195: uint8_t FLASH_ReadByte(uint32_t Address)
                                    171 ;	-----------------------------------------
                                    172 ;	 function FLASH_ReadByte
                                    173 ;	-----------------------------------------
      00A3E3                        174 _FLASH_ReadByte:
                                    175 ;	./../../lib/src/stm8s_flash.c: 201: return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
      00A3E3 1E 05            [ 2]  176 	ldw	x, (0x05, sp)
      00A3E5 F6               [ 1]  177 	ld	a, (x)
                                    178 ;	./../../lib/src/stm8s_flash.c: 202: }
      00A3E6 1E 01            [ 2]  179 	ldw	x, (1, sp)
      00A3E8 5B 06            [ 2]  180 	addw	sp, #6
      00A3EA FC               [ 2]  181 	jp	(x)
                                    182 ;	./../../lib/src/stm8s_flash.c: 212: void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
                                    183 ;	-----------------------------------------
                                    184 ;	 function FLASH_ProgramWord
                                    185 ;	-----------------------------------------
      00A3EB                        186 _FLASH_ProgramWord:
      00A3EB 52 04            [ 2]  187 	sub	sp, #4
                                    188 ;	./../../lib/src/stm8s_flash.c: 218: FLASH->CR2 |= FLASH_CR2_WPRG;
      00A3ED 72 1C 50 5B      [ 1]  189 	bset	0x505b, #6
                                    190 ;	./../../lib/src/stm8s_flash.c: 219: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
      00A3F1 72 1D 50 5C      [ 1]  191 	bres	0x505c, #6
                                    192 ;	./../../lib/src/stm8s_flash.c: 222: *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
      00A3F5 1E 09            [ 2]  193 	ldw	x, (0x09, sp)
      00A3F7 1F 01            [ 2]  194 	ldw	(0x01, sp), x
      00A3F9 90 96            [ 1]  195 	ldw	y, sp
      00A3FB 72 A9 00 0B      [ 2]  196 	addw	y, #11
      00A3FF 93               [ 1]  197 	ldw	x, y
      00A400 F6               [ 1]  198 	ld	a, (x)
      00A401 1E 01            [ 2]  199 	ldw	x, (0x01, sp)
      00A403 F7               [ 1]  200 	ld	(x), a
                                    201 ;	./../../lib/src/stm8s_flash.c: 224: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1);
      00A404 1E 01            [ 2]  202 	ldw	x, (0x01, sp)
      00A406 5C               [ 1]  203 	incw	x
      00A407 1F 03            [ 2]  204 	ldw	(0x03, sp), x
      00A409 93               [ 1]  205 	ldw	x, y
      00A40A E6 01            [ 1]  206 	ld	a, (0x1, x)
      00A40C 1E 03            [ 2]  207 	ldw	x, (0x03, sp)
      00A40E F7               [ 1]  208 	ld	(x), a
                                    209 ;	./../../lib/src/stm8s_flash.c: 226: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2);
      00A40F 1E 01            [ 2]  210 	ldw	x, (0x01, sp)
      00A411 5C               [ 1]  211 	incw	x
      00A412 5C               [ 1]  212 	incw	x
      00A413 1F 03            [ 2]  213 	ldw	(0x03, sp), x
      00A415 93               [ 1]  214 	ldw	x, y
      00A416 E6 02            [ 1]  215 	ld	a, (0x2, x)
      00A418 1E 03            [ 2]  216 	ldw	x, (0x03, sp)
      00A41A F7               [ 1]  217 	ld	(x), a
                                    218 ;	./../../lib/src/stm8s_flash.c: 228: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3);
      00A41B 1E 01            [ 2]  219 	ldw	x, (0x01, sp)
      00A41D 90 E6 03         [ 1]  220 	ld	a, (0x3, y)
      00A420 E7 03            [ 1]  221 	ld	(0x0003, x), a
                                    222 ;	./../../lib/src/stm8s_flash.c: 229: }
      00A422 1E 05            [ 2]  223 	ldw	x, (5, sp)
      00A424 5B 0E            [ 2]  224 	addw	sp, #14
      00A426 FC               [ 2]  225 	jp	(x)
                                    226 ;	./../../lib/src/stm8s_flash.c: 237: void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
                                    227 ;	-----------------------------------------
                                    228 ;	 function FLASH_ProgramOptionByte
                                    229 ;	-----------------------------------------
      00A427                        230 _FLASH_ProgramOptionByte:
      00A427 52 05            [ 2]  231 	sub	sp, #5
      00A429 6B 05            [ 1]  232 	ld	(0x05, sp), a
                                    233 ;	./../../lib/src/stm8s_flash.c: 243: FLASH->CR2 |= FLASH_CR2_OPT;
      00A42B 72 1E 50 5B      [ 1]  234 	bset	0x505b, #7
                                    235 ;	./../../lib/src/stm8s_flash.c: 244: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
      00A42F 72 1F 50 5C      [ 1]  236 	bres	0x505c, #7
                                    237 ;	./../../lib/src/stm8s_flash.c: 247: if(Address == 0x4800)
      00A433 1F 01            [ 2]  238 	ldw	(0x01, sp), x
                                    239 ;	./../../lib/src/stm8s_flash.c: 250: *((NEAR uint8_t*)Address) = Data;
      00A435 1F 03            [ 2]  240 	ldw	(0x03, sp), x
                                    241 ;	./../../lib/src/stm8s_flash.c: 247: if(Address == 0x4800)
      00A437 1E 01            [ 2]  242 	ldw	x, (0x01, sp)
      00A439 A3 48 00         [ 2]  243 	cpw	x, #0x4800
      00A43C 26 07            [ 1]  244 	jrne	00102$
                                    245 ;	./../../lib/src/stm8s_flash.c: 250: *((NEAR uint8_t*)Address) = Data;
      00A43E 1E 03            [ 2]  246 	ldw	x, (0x03, sp)
      00A440 7B 05            [ 1]  247 	ld	a, (0x05, sp)
      00A442 F7               [ 1]  248 	ld	(x), a
      00A443 20 0C            [ 2]  249 	jra	00103$
      00A445                        250 00102$:
                                    251 ;	./../../lib/src/stm8s_flash.c: 255: *((NEAR uint8_t*)Address) = Data;
      00A445 1E 03            [ 2]  252 	ldw	x, (0x03, sp)
      00A447 7B 05            [ 1]  253 	ld	a, (0x05, sp)
      00A449 F7               [ 1]  254 	ld	(x), a
                                    255 ;	./../../lib/src/stm8s_flash.c: 256: *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
      00A44A 1E 01            [ 2]  256 	ldw	x, (0x01, sp)
      00A44C 5C               [ 1]  257 	incw	x
      00A44D 7B 05            [ 1]  258 	ld	a, (0x05, sp)
      00A44F 43               [ 1]  259 	cpl	a
      00A450 F7               [ 1]  260 	ld	(x), a
      00A451                        261 00103$:
                                    262 ;	./../../lib/src/stm8s_flash.c: 258: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
      00A451 A6 FD            [ 1]  263 	ld	a, #0xfd
      00A453 CD A5 28         [ 4]  264 	call	_FLASH_WaitForLastOperation
                                    265 ;	./../../lib/src/stm8s_flash.c: 261: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
      00A456 72 1F 50 5B      [ 1]  266 	bres	0x505b, #7
                                    267 ;	./../../lib/src/stm8s_flash.c: 262: FLASH->NCR2 |= FLASH_NCR2_NOPT;
      00A45A 72 1E 50 5C      [ 1]  268 	bset	0x505c, #7
                                    269 ;	./../../lib/src/stm8s_flash.c: 263: }
      00A45E 5B 05            [ 2]  270 	addw	sp, #5
      00A460 81               [ 4]  271 	ret
                                    272 ;	./../../lib/src/stm8s_flash.c: 270: void FLASH_EraseOptionByte(uint16_t Address)
                                    273 ;	-----------------------------------------
                                    274 ;	 function FLASH_EraseOptionByte
                                    275 ;	-----------------------------------------
      00A461                        276 _FLASH_EraseOptionByte:
      00A461 52 02            [ 2]  277 	sub	sp, #2
      00A463 51               [ 1]  278 	exgw	x, y
                                    279 ;	./../../lib/src/stm8s_flash.c: 276: FLASH->CR2 |= FLASH_CR2_OPT;
      00A464 72 1E 50 5B      [ 1]  280 	bset	0x505b, #7
                                    281 ;	./../../lib/src/stm8s_flash.c: 277: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
      00A468 72 1F 50 5C      [ 1]  282 	bres	0x505c, #7
                                    283 ;	./../../lib/src/stm8s_flash.c: 280: if(Address == 0x4800)
      00A46C 93               [ 1]  284 	ldw	x, y
                                    285 ;	./../../lib/src/stm8s_flash.c: 283: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      00A46D 17 01            [ 2]  286 	ldw	(0x01, sp), y
                                    287 ;	./../../lib/src/stm8s_flash.c: 280: if(Address == 0x4800)
      00A46F A3 48 00         [ 2]  288 	cpw	x, #0x4800
      00A472 26 05            [ 1]  289 	jrne	00102$
                                    290 ;	./../../lib/src/stm8s_flash.c: 283: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      00A474 1E 01            [ 2]  291 	ldw	x, (0x01, sp)
      00A476 7F               [ 1]  292 	clr	(x)
      00A477 20 08            [ 2]  293 	jra	00103$
      00A479                        294 00102$:
                                    295 ;	./../../lib/src/stm8s_flash.c: 288: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      00A479 1E 01            [ 2]  296 	ldw	x, (0x01, sp)
      00A47B 7F               [ 1]  297 	clr	(x)
                                    298 ;	./../../lib/src/stm8s_flash.c: 289: *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
      00A47C 93               [ 1]  299 	ldw	x, y
      00A47D 5C               [ 1]  300 	incw	x
      00A47E A6 FF            [ 1]  301 	ld	a, #0xff
      00A480 F7               [ 1]  302 	ld	(x), a
      00A481                        303 00103$:
                                    304 ;	./../../lib/src/stm8s_flash.c: 291: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
      00A481 A6 FD            [ 1]  305 	ld	a, #0xfd
      00A483 CD A5 28         [ 4]  306 	call	_FLASH_WaitForLastOperation
                                    307 ;	./../../lib/src/stm8s_flash.c: 294: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
      00A486 72 1F 50 5B      [ 1]  308 	bres	0x505b, #7
                                    309 ;	./../../lib/src/stm8s_flash.c: 295: FLASH->NCR2 |= FLASH_NCR2_NOPT;
      00A48A 72 1E 50 5C      [ 1]  310 	bset	0x505c, #7
                                    311 ;	./../../lib/src/stm8s_flash.c: 296: }
      00A48E 5B 02            [ 2]  312 	addw	sp, #2
      00A490 81               [ 4]  313 	ret
                                    314 ;	./../../lib/src/stm8s_flash.c: 303: uint16_t FLASH_ReadOptionByte(uint16_t Address)
                                    315 ;	-----------------------------------------
                                    316 ;	 function FLASH_ReadOptionByte
                                    317 ;	-----------------------------------------
      00A491                        318 _FLASH_ReadOptionByte:
      00A491 52 02            [ 2]  319 	sub	sp, #2
                                    320 ;	./../../lib/src/stm8s_flash.c: 311: value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
      00A493 90 93            [ 1]  321 	ldw	y, x
      00A495 F6               [ 1]  322 	ld	a, (x)
      00A496 6B 01            [ 1]  323 	ld	(0x01, sp), a
                                    324 ;	./../../lib/src/stm8s_flash.c: 312: value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
      00A498 E6 01            [ 1]  325 	ld	a, (0x1, x)
      00A49A 6B 02            [ 1]  326 	ld	(0x02, sp), a
                                    327 ;	./../../lib/src/stm8s_flash.c: 315: if(Address == 0x4800)
                                    328 ;	./../../lib/src/stm8s_flash.c: 317: res_value =	 value_optbyte;
      00A49C 5F               [ 1]  329 	clrw	x
      00A49D 7B 01            [ 1]  330 	ld	a, (0x01, sp)
      00A49F 97               [ 1]  331 	ld	xl, a
                                    332 ;	./../../lib/src/stm8s_flash.c: 315: if(Address == 0x4800)
      00A4A0 90 A3 48 00      [ 2]  333 	cpw	y, #0x4800
      00A4A4 27 19            [ 1]  334 	jreq	00106$
                                    335 ;	./../../lib/src/stm8s_flash.c: 317: res_value =	 value_optbyte;
                                    336 ;	./../../lib/src/stm8s_flash.c: 321: if(value_optbyte == (uint8_t)(~value_optbyte_complement))
      00A4A6 7B 02            [ 1]  337 	ld	a, (0x02, sp)
      00A4A8 43               [ 1]  338 	cpl	a
      00A4A9 11 01            [ 1]  339 	cp	a, (0x01, sp)
      00A4AB 26 0F            [ 1]  340 	jrne	00102$
                                    341 ;	./../../lib/src/stm8s_flash.c: 323: res_value = (uint16_t)((uint16_t)value_optbyte << 8);
      00A4AD 4F               [ 1]  342 	clr	a
      00A4AE 02               [ 1]  343 	rlwa	x
                                    344 ;	./../../lib/src/stm8s_flash.c: 324: res_value = res_value | (uint16_t)value_optbyte_complement;
      00A4AF 7B 02            [ 1]  345 	ld	a, (0x02, sp)
      00A4B1 0F 01            [ 1]  346 	clr	(0x01, sp)
      00A4B3 89               [ 2]  347 	pushw	x
      00A4B4 1A 02            [ 1]  348 	or	a, (2, sp)
      00A4B6 85               [ 2]  349 	popw	x
      00A4B7 02               [ 1]  350 	rlwa	x
      00A4B8 1A 01            [ 1]  351 	or	a, (0x01, sp)
      00A4BA 95               [ 1]  352 	ld	xh, a
                                    353 ;	./../../lib/src/stm8s_flash.c: 328: res_value = FLASH_OPTIONBYTE_ERROR;
      00A4BB BC                     354 	.byte 0xbc
      00A4BC                        355 00102$:
      00A4BC AE 55 55         [ 2]  356 	ldw	x, #0x5555
      00A4BF                        357 00106$:
                                    358 ;	./../../lib/src/stm8s_flash.c: 331: return(res_value);
                                    359 ;	./../../lib/src/stm8s_flash.c: 332: }
      00A4BF 5B 02            [ 2]  360 	addw	sp, #2
      00A4C1 81               [ 4]  361 	ret
                                    362 ;	./../../lib/src/stm8s_flash.c: 340: void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
                                    363 ;	-----------------------------------------
                                    364 ;	 function FLASH_SetLowPowerMode
                                    365 ;	-----------------------------------------
      00A4C2                        366 _FLASH_SetLowPowerMode:
      00A4C2 88               [ 1]  367 	push	a
      00A4C3 6B 01            [ 1]  368 	ld	(0x01, sp), a
                                    369 ;	./../../lib/src/stm8s_flash.c: 346: FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT));
      00A4C5 C6 50 5A         [ 1]  370 	ld	a, 0x505a
      00A4C8 A4 F3            [ 1]  371 	and	a, #0xf3
      00A4CA C7 50 5A         [ 1]  372 	ld	0x505a, a
                                    373 ;	./../../lib/src/stm8s_flash.c: 349: FLASH->CR1 |= (uint8_t)FLASH_LPMode;
      00A4CD C6 50 5A         [ 1]  374 	ld	a, 0x505a
      00A4D0 1A 01            [ 1]  375 	or	a, (0x01, sp)
      00A4D2 C7 50 5A         [ 1]  376 	ld	0x505a, a
                                    377 ;	./../../lib/src/stm8s_flash.c: 350: }
      00A4D5 84               [ 1]  378 	pop	a
      00A4D6 81               [ 4]  379 	ret
                                    380 ;	./../../lib/src/stm8s_flash.c: 358: void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
                                    381 ;	-----------------------------------------
                                    382 ;	 function FLASH_SetProgrammingTime
                                    383 ;	-----------------------------------------
      00A4D7                        384 _FLASH_SetProgrammingTime:
      00A4D7 97               [ 1]  385 	ld	xl, a
                                    386 ;	./../../lib/src/stm8s_flash.c: 363: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
      00A4D8 C6 50 5A         [ 1]  387 	ld	a, 0x505a
      00A4DB A4 FE            [ 1]  388 	and	a, #0xfe
      00A4DD C7 50 5A         [ 1]  389 	ld	0x505a, a
                                    390 ;	./../../lib/src/stm8s_flash.c: 364: FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
      00A4E0 C6 50 5A         [ 1]  391 	ld	a, 0x505a
      00A4E3 89               [ 2]  392 	pushw	x
      00A4E4 1A 02            [ 1]  393 	or	a, (2, sp)
      00A4E6 85               [ 2]  394 	popw	x
      00A4E7 C7 50 5A         [ 1]  395 	ld	0x505a, a
                                    396 ;	./../../lib/src/stm8s_flash.c: 365: }
      00A4EA 81               [ 4]  397 	ret
                                    398 ;	./../../lib/src/stm8s_flash.c: 372: FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
                                    399 ;	-----------------------------------------
                                    400 ;	 function FLASH_GetLowPowerMode
                                    401 ;	-----------------------------------------
      00A4EB                        402 _FLASH_GetLowPowerMode:
                                    403 ;	./../../lib/src/stm8s_flash.c: 374: return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
      00A4EB C6 50 5A         [ 1]  404 	ld	a, 0x505a
      00A4EE A4 0C            [ 1]  405 	and	a, #0x0c
                                    406 ;	./../../lib/src/stm8s_flash.c: 375: }
      00A4F0 81               [ 4]  407 	ret
                                    408 ;	./../../lib/src/stm8s_flash.c: 382: FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
                                    409 ;	-----------------------------------------
                                    410 ;	 function FLASH_GetProgrammingTime
                                    411 ;	-----------------------------------------
      00A4F1                        412 _FLASH_GetProgrammingTime:
                                    413 ;	./../../lib/src/stm8s_flash.c: 384: return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
      00A4F1 C6 50 5A         [ 1]  414 	ld	a, 0x505a
      00A4F4 A4 01            [ 1]  415 	and	a, #0x01
                                    416 ;	./../../lib/src/stm8s_flash.c: 385: }
      00A4F6 81               [ 4]  417 	ret
                                    418 ;	./../../lib/src/stm8s_flash.c: 392: uint32_t FLASH_GetBootSize(void)
                                    419 ;	-----------------------------------------
                                    420 ;	 function FLASH_GetBootSize
                                    421 ;	-----------------------------------------
      00A4F7                        422 _FLASH_GetBootSize:
                                    423 ;	./../../lib/src/stm8s_flash.c: 397: temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
      00A4F7 C6 50 5D         [ 1]  424 	ld	a, 0x505d
      00A4FA 5F               [ 1]  425 	clrw	x
      00A4FB 5E               [ 1]  426 	swapw	x
      00A4FC 90 95            [ 1]  427 	ld	yh, a
      00A4FE 4F               [ 1]  428 	clr	a
      00A4FF 90 97            [ 1]  429 	ld	yl, a
      00A501 90 58            [ 2]  430 	sllw	y
      00A503 59               [ 2]  431 	rlcw	x
                                    432 ;	./../../lib/src/stm8s_flash.c: 400: if(FLASH->FPR == 0xFF)
      00A504 C6 50 5D         [ 1]  433 	ld	a, 0x505d
      00A507 4C               [ 1]  434 	inc	a
      00A508 26 0B            [ 1]  435 	jrne	00102$
                                    436 ;	./../../lib/src/stm8s_flash.c: 402: temp += 512;
      00A50A 72 A9 02 00      [ 2]  437 	addw	y, #0x0200
      00A50E 9F               [ 1]  438 	ld	a, xl
      00A50F A9 00            [ 1]  439 	adc	a, #0x00
      00A511 02               [ 1]  440 	rlwa	x
      00A512 A9 00            [ 1]  441 	adc	a, #0x00
      00A514 95               [ 1]  442 	ld	xh, a
      00A515                        443 00102$:
                                    444 ;	./../../lib/src/stm8s_flash.c: 406: return(temp);
      00A515 51               [ 1]  445 	exgw	x, y
                                    446 ;	./../../lib/src/stm8s_flash.c: 407: }
      00A516 81               [ 4]  447 	ret
                                    448 ;	./../../lib/src/stm8s_flash.c: 417: FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
                                    449 ;	-----------------------------------------
                                    450 ;	 function FLASH_GetFlagStatus
                                    451 ;	-----------------------------------------
      00A517                        452 _FLASH_GetFlagStatus:
      00A517 88               [ 1]  453 	push	a
      00A518 6B 01            [ 1]  454 	ld	(0x01, sp), a
                                    455 ;	./../../lib/src/stm8s_flash.c: 424: if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
      00A51A C6 50 5F         [ 1]  456 	ld	a, 0x505f
      00A51D 14 01            [ 1]  457 	and	a, (0x01, sp)
      00A51F 27 03            [ 1]  458 	jreq	00102$
                                    459 ;	./../../lib/src/stm8s_flash.c: 426: status = SET; /* FLASH_FLAG is set */
      00A521 A6 01            [ 1]  460 	ld	a, #0x01
                                    461 ;	./../../lib/src/stm8s_flash.c: 430: status = RESET; /* FLASH_FLAG is reset*/
      00A523 21                     462 	.byte 0x21
      00A524                        463 00102$:
      00A524 4F               [ 1]  464 	clr	a
      00A525                        465 00103$:
                                    466 ;	./../../lib/src/stm8s_flash.c: 434: return status;
                                    467 ;	./../../lib/src/stm8s_flash.c: 435: }
      00A525 5B 01            [ 2]  468 	addw	sp, #1
      00A527 81               [ 4]  469 	ret
                                    470 ;	./../../lib/src/stm8s_flash.c: 549: IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
                                    471 ;	-----------------------------------------
                                    472 ;	 function FLASH_WaitForLastOperation
                                    473 ;	-----------------------------------------
      00A528                        474 _FLASH_WaitForLastOperation:
      00A528 97               [ 1]  475 	ld	xl, a
                                    476 ;	./../../lib/src/stm8s_flash.c: 551: uint8_t flagstatus = 0x00;
      00A529 4F               [ 1]  477 	clr	a
                                    478 ;	./../../lib/src/stm8s_flash.c: 557: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      00A52A 88               [ 1]  479 	push	a
      00A52B 9F               [ 1]  480 	ld	a, xl
      00A52C A1 FD            [ 1]  481 	cp	a, #0xfd
      00A52E 84               [ 1]  482 	pop	a
      00A52F 26 10            [ 1]  483 	jrne	00121$
                                    484 ;	./../../lib/src/stm8s_flash.c: 559: while((flagstatus == 0x00) && (timeout != 0x00))
      00A531 5F               [ 1]  485 	clrw	x
      00A532 5A               [ 2]  486 	decw	x
      00A533                        487 00102$:
      00A533 4D               [ 1]  488 	tnz	a
      00A534 26 1B            [ 1]  489 	jrne	00111$
      00A536 5D               [ 2]  490 	tnzw	x
      00A537 27 18            [ 1]  491 	jreq	00111$
                                    492 ;	./../../lib/src/stm8s_flash.c: 561: flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
      00A539 C6 50 5F         [ 1]  493 	ld	a, 0x505f
      00A53C A4 05            [ 1]  494 	and	a, #0x05
                                    495 ;	./../../lib/src/stm8s_flash.c: 563: timeout--;
      00A53E 5A               [ 2]  496 	decw	x
      00A53F 20 F2            [ 2]  497 	jra	00102$
                                    498 ;	./../../lib/src/stm8s_flash.c: 568: while((flagstatus == 0x00) && (timeout != 0x00))
      00A541                        499 00121$:
      00A541 5F               [ 1]  500 	clrw	x
      00A542 5A               [ 2]  501 	decw	x
      00A543                        502 00106$:
      00A543 4D               [ 1]  503 	tnz	a
      00A544 26 0B            [ 1]  504 	jrne	00124$
      00A546 5D               [ 2]  505 	tnzw	x
      00A547 27 08            [ 1]  506 	jreq	00124$
                                    507 ;	./../../lib/src/stm8s_flash.c: 570: flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
      00A549 C6 50 5F         [ 1]  508 	ld	a, 0x505f
      00A54C A4 41            [ 1]  509 	and	a, #0x41
                                    510 ;	./../../lib/src/stm8s_flash.c: 572: timeout--;
      00A54E 5A               [ 2]  511 	decw	x
      00A54F 20 F2            [ 2]  512 	jra	00106$
                                    513 ;	./../../lib/src/stm8s_flash.c: 589: return((FLASH_Status_TypeDef)flagstatus);
                                    514 ;	./../../lib/src/stm8s_flash.c: 572: timeout--;
      00A551                        515 00124$:
      00A551                        516 00111$:
                                    517 ;	./../../lib/src/stm8s_flash.c: 584: if(timeout == 0x00 )
      00A551 5D               [ 2]  518 	tnzw	x
      00A552 27 01            [ 1]  519 	jreq	00164$
      00A554 81               [ 4]  520 	ret
      00A555                        521 00164$:
                                    522 ;	./../../lib/src/stm8s_flash.c: 586: flagstatus = FLASH_STATUS_TIMEOUT;
      00A555 A6 02            [ 1]  523 	ld	a, #0x02
                                    524 ;	./../../lib/src/stm8s_flash.c: 589: return((FLASH_Status_TypeDef)flagstatus);
                                    525 ;	./../../lib/src/stm8s_flash.c: 590: }
      00A557 81               [ 4]  526 	ret
                                    527 ;	./../../lib/src/stm8s_flash.c: 599: IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
                                    528 ;	-----------------------------------------
                                    529 ;	 function FLASH_EraseBlock
                                    530 ;	-----------------------------------------
      00A558                        531 _FLASH_EraseBlock:
      00A558 52 04            [ 2]  532 	sub	sp, #4
      00A55A 51               [ 1]  533 	exgw	x, y
                                    534 ;	./../../lib/src/stm8s_flash.c: 612: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      00A55B A1 FD            [ 1]  535 	cp	a, #0xfd
      00A55D 26 0A            [ 1]  536 	jrne	00102$
                                    537 ;	./../../lib/src/stm8s_flash.c: 615: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
      00A55F AE 80 00         [ 2]  538 	ldw	x, #0x8000
      00A562 1F 03            [ 2]  539 	ldw	(0x03, sp), x
      00A564 5F               [ 1]  540 	clrw	x
      00A565 1F 01            [ 2]  541 	ldw	(0x01, sp), x
      00A567 20 08            [ 2]  542 	jra	00103$
      00A569                        543 00102$:
                                    544 ;	./../../lib/src/stm8s_flash.c: 620: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
      00A569 AE 40 00         [ 2]  545 	ldw	x, #0x4000
      00A56C 1F 03            [ 2]  546 	ldw	(0x03, sp), x
      00A56E 5F               [ 1]  547 	clrw	x
      00A56F 1F 01            [ 2]  548 	ldw	(0x01, sp), x
      00A571                        549 00103$:
                                    550 ;	./../../lib/src/stm8s_flash.c: 628: pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
      00A571 93               [ 1]  551 	ldw	x, y
      00A572 58               [ 2]  552 	sllw	x
      00A573 58               [ 2]  553 	sllw	x
      00A574 58               [ 2]  554 	sllw	x
      00A575 58               [ 2]  555 	sllw	x
      00A576 58               [ 2]  556 	sllw	x
      00A577 58               [ 2]  557 	sllw	x
      00A578 58               [ 2]  558 	sllw	x
      00A579 72 FB 03         [ 2]  559 	addw	x, (0x03, sp)
                                    560 ;	./../../lib/src/stm8s_flash.c: 632: FLASH->CR2 |= FLASH_CR2_ERASE;
      00A57C 72 1A 50 5B      [ 1]  561 	bset	0x505b, #5
                                    562 ;	./../../lib/src/stm8s_flash.c: 633: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
      00A580 72 1B 50 5C      [ 1]  563 	bres	0x505c, #5
                                    564 ;	./../../lib/src/stm8s_flash.c: 637: *pwFlash = (uint32_t)0;
      00A584 6F 03            [ 1]  565 	clr	(0x3, x)
      00A586 6F 02            [ 1]  566 	clr	(0x2, x)
      00A588 6F 01            [ 1]  567 	clr	(0x1, x)
      00A58A 7F               [ 1]  568 	clr	(x)
                                    569 ;	./../../lib/src/stm8s_flash.c: 645: }
      00A58B 5B 04            [ 2]  570 	addw	sp, #4
      00A58D 81               [ 4]  571 	ret
                                    572 ;	./../../lib/src/stm8s_flash.c: 656: IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
                                    573 ;	-----------------------------------------
                                    574 ;	 function FLASH_ProgramBlock
                                    575 ;	-----------------------------------------
      00A58E                        576 _FLASH_ProgramBlock:
      00A58E 52 08            [ 2]  577 	sub	sp, #8
      00A590 51               [ 1]  578 	exgw	x, y
                                    579 ;	./../../lib/src/stm8s_flash.c: 665: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      00A591 A1 FD            [ 1]  580 	cp	a, #0xfd
      00A593 26 09            [ 1]  581 	jrne	00102$
                                    582 ;	./../../lib/src/stm8s_flash.c: 668: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
      00A595 0F 04            [ 1]  583 	clr	(0x04, sp)
      00A597 A6 80            [ 1]  584 	ld	a, #0x80
      00A599 5F               [ 1]  585 	clrw	x
      00A59A 1F 01            [ 2]  586 	ldw	(0x01, sp), x
      00A59C 20 07            [ 2]  587 	jra	00103$
      00A59E                        588 00102$:
                                    589 ;	./../../lib/src/stm8s_flash.c: 673: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
      00A59E 0F 04            [ 1]  590 	clr	(0x04, sp)
      00A5A0 A6 40            [ 1]  591 	ld	a, #0x40
      00A5A2 5F               [ 1]  592 	clrw	x
      00A5A3 1F 01            [ 2]  593 	ldw	(0x01, sp), x
      00A5A5                        594 00103$:
                                    595 ;	./../../lib/src/stm8s_flash.c: 677: startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
      00A5A5 5F               [ 1]  596 	clrw	x
      00A5A6 88               [ 1]  597 	push	a
      00A5A7 A6 07            [ 1]  598 	ld	a, #0x07
      00A5A9                        599 00131$:
      00A5A9 90 58            [ 2]  600 	sllw	y
      00A5AB 59               [ 2]  601 	rlcw	x
      00A5AC 4A               [ 1]  602 	dec	a
      00A5AD 26 FA            [ 1]  603 	jrne	00131$
      00A5AF 17 08            [ 2]  604 	ldw	(0x08, sp), y
      00A5B1 84               [ 1]  605 	pop	a
      00A5B2 90 95            [ 1]  606 	ld	yh, a
      00A5B4 61               [ 1]  607 	exg	a, yl
      00A5B5 7B 04            [ 1]  608 	ld	a, (0x04, sp)
      00A5B7 61               [ 1]  609 	exg	a, yl
      00A5B8 72 F9 07         [ 2]  610 	addw	y, (0x07, sp)
      00A5BB 9F               [ 1]  611 	ld	a, xl
      00A5BC 19 02            [ 1]  612 	adc	a, (0x02, sp)
      00A5BE 02               [ 1]  613 	rlwa	x
      00A5BF 19 01            [ 1]  614 	adc	a, (0x01, sp)
      00A5C1 95               [ 1]  615 	ld	xh, a
      00A5C2 17 03            [ 2]  616 	ldw	(0x03, sp), y
      00A5C4 1F 01            [ 2]  617 	ldw	(0x01, sp), x
                                    618 ;	./../../lib/src/stm8s_flash.c: 683: FLASH->CR2 |= FLASH_CR2_PRG;
      00A5C6 C6 50 5B         [ 1]  619 	ld	a, 0x505b
                                    620 ;	./../../lib/src/stm8s_flash.c: 680: if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
      00A5C9 0D 0B            [ 1]  621 	tnz	(0x0b, sp)
      00A5CB 26 0B            [ 1]  622 	jrne	00105$
                                    623 ;	./../../lib/src/stm8s_flash.c: 683: FLASH->CR2 |= FLASH_CR2_PRG;
      00A5CD AA 01            [ 1]  624 	or	a, #0x01
      00A5CF C7 50 5B         [ 1]  625 	ld	0x505b, a
                                    626 ;	./../../lib/src/stm8s_flash.c: 684: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
      00A5D2 72 11 50 5C      [ 1]  627 	bres	0x505c, #0
      00A5D6 20 09            [ 2]  628 	jra	00114$
      00A5D8                        629 00105$:
                                    630 ;	./../../lib/src/stm8s_flash.c: 689: FLASH->CR2 |= FLASH_CR2_FPRG;
      00A5D8 AA 10            [ 1]  631 	or	a, #0x10
      00A5DA C7 50 5B         [ 1]  632 	ld	0x505b, a
                                    633 ;	./../../lib/src/stm8s_flash.c: 690: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
      00A5DD 72 19 50 5C      [ 1]  634 	bres	0x505c, #4
                                    635 ;	./../../lib/src/stm8s_flash.c: 694: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
      00A5E1                        636 00114$:
      00A5E1 90 5F            [ 1]  637 	clrw	y
      00A5E3                        638 00108$:
                                    639 ;	./../../lib/src/stm8s_flash.c: 696: *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
      00A5E3 1E 03            [ 2]  640 	ldw	x, (0x03, sp)
      00A5E5 1F 05            [ 2]  641 	ldw	(0x05, sp), x
      00A5E7 93               [ 1]  642 	ldw	x, y
      00A5E8 72 FB 05         [ 2]  643 	addw	x, (0x05, sp)
      00A5EB 1F 07            [ 2]  644 	ldw	(0x07, sp), x
      00A5ED 93               [ 1]  645 	ldw	x, y
      00A5EE 72 FB 0C         [ 2]  646 	addw	x, (0x0c, sp)
      00A5F1 F6               [ 1]  647 	ld	a, (x)
      00A5F2 1E 07            [ 2]  648 	ldw	x, (0x07, sp)
      00A5F4 F7               [ 1]  649 	ld	(x), a
                                    650 ;	./../../lib/src/stm8s_flash.c: 694: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
      00A5F5 90 5C            [ 1]  651 	incw	y
      00A5F7 90 A3 00 80      [ 2]  652 	cpw	y, #0x0080
      00A5FB 25 E6            [ 1]  653 	jrc	00108$
                                    654 ;	./../../lib/src/stm8s_flash.c: 698: }
      00A5FD 1E 09            [ 2]  655 	ldw	x, (9, sp)
      00A5FF 5B 0D            [ 2]  656 	addw	sp, #13
      00A601 FC               [ 2]  657 	jp	(x)
                                    658 	.area CODE
                                    659 	.area CONST
                                    660 	.area INITIALIZER
                                    661 	.area CABS (ABS)
