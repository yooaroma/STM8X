                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_mib_flash_option
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _mmFlashOptionUnlock
                                     12 	.globl _mmFlashOptionLock
                                     13 	.globl _mmFlashOptionWrite
                                     14 	.globl _mmFlashOptionRead
                                     15 	.globl _mmFlashOptionErase
                                     16 	.globl _FlashOptionWaitForLastOperation
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
                                     54 ;	./../../mib/stm8s_mib_flash_option.c: 66: uint8_t mmFlashOptionUnlock(void) 
                                     55 ;	-----------------------------------------
                                     56 ;	 function mmFlashOptionUnlock
                                     57 ;	-----------------------------------------
      00ADD0                         58 _mmFlashOptionUnlock:
      00ADD0 52 03            [ 2]   59 	sub	sp, #3
                                     60 ;	./../../mib/stm8s_mib_flash_option.c: 68: volatile uint16_t vwDelay = 0x7fff;
      00ADD2 AE 7F FF         [ 2]   61 	ldw	x, #0x7fff
      00ADD5 1F 01            [ 2]   62 	ldw	(0x01, sp), x
                                     63 ;	./../../mib/stm8s_mib_flash_option.c: 69: volatile uint8_t DataUnlocked = 0;
      00ADD7 0F 03            [ 1]   64 	clr	(0x03, sp)
                                     65 ;	./../../mib/stm8s_mib_flash_option.c: 72: while( DataUnlocked == 0 )
      00ADD9                         66 00104$:
      00ADD9 0D 03            [ 1]   67 	tnz	(0x03, sp)
      00ADDB 26 1E            [ 1]   68 	jrne	00106$
                                     69 ;	./../../mib/stm8s_mib_flash_option.c: 74: FLASH->DUKR=0xAE;
      00ADDD 35 AE 50 64      [ 1]   70 	mov	0x5064+0, #0xae
                                     71 ;	./../../mib/stm8s_mib_flash_option.c: 75: FLASH->DUKR=0x56;
      00ADE1 35 56 50 64      [ 1]   72 	mov	0x5064+0, #0x56
                                     73 ;	./../../mib/stm8s_mib_flash_option.c: 77: DataUnlocked = (uint8_t)FLASH->IAPSR;	
      00ADE5 C6 50 5F         [ 1]   74 	ld	a, 0x505f
                                     75 ;	./../../mib/stm8s_mib_flash_option.c: 78: DataUnlocked &= FLASH_IAPSR_DUL;
      00ADE8 6B 03            [ 1]   76 	ld	(0x03, sp), a
      00ADEA A4 08            [ 1]   77 	and	a, #0x08
      00ADEC 6B 03            [ 1]   78 	ld	(0x03, sp), a
                                     79 ;	./../../mib/stm8s_mib_flash_option.c: 79: if(vwDelay) vwDelay--;
      00ADEE 1E 01            [ 2]   80 	ldw	x, (0x01, sp)
      00ADF0 27 07            [ 1]   81 	jreq	00102$
      00ADF2 1E 01            [ 2]   82 	ldw	x, (0x01, sp)
      00ADF4 5A               [ 2]   83 	decw	x
      00ADF5 1F 01            [ 2]   84 	ldw	(0x01, sp), x
      00ADF7 20 E0            [ 2]   85 	jra	00104$
      00ADF9                         86 00102$:
                                     87 ;	./../../mib/stm8s_mib_flash_option.c: 82: return 0;
      00ADF9 4F               [ 1]   88 	clr	a
                                     89 ;	./../../mib/stm8s_mib_flash_option.c: 85: return 1;
      00ADFA C5                      90 	.byte 0xc5
      00ADFB                         91 00106$:
      00ADFB A6 01            [ 1]   92 	ld	a, #0x01
      00ADFD                         93 00107$:
                                     94 ;	./../../mib/stm8s_mib_flash_option.c: 86: }
      00ADFD 5B 03            [ 2]   95 	addw	sp, #3
      00ADFF 81               [ 4]   96 	ret
                                     97 ;	./../../mib/stm8s_mib_flash_option.c: 96: void mmFlashOptionLock(void) 
                                     98 ;	-----------------------------------------
                                     99 ;	 function mmFlashOptionLock
                                    100 ;	-----------------------------------------
      00AE00                        101 _mmFlashOptionLock:
                                    102 ;	./../../mib/stm8s_mib_flash_option.c: 99: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);  // FLASH_MEMTYPE_DATA      = (uint8_t)0xF7  /*!< Data EEPROM memory */ FLASH_IAPSR_DUL
      00AE00 72 17 50 5F      [ 1]  103 	bres	0x505f, #3
                                    104 ;	./../../mib/stm8s_mib_flash_option.c: 100: }
      00AE04 81               [ 4]  105 	ret
                                    106 ;	./../../mib/stm8s_mib_flash_option.c: 111: uint8_t mmFlashOptionWrite(uint16_t vbAddress,uint8_t vbData) 
                                    107 ;	-----------------------------------------
                                    108 ;	 function mmFlashOptionWrite
                                    109 ;	-----------------------------------------
      00AE05                        110 _mmFlashOptionWrite:
      00AE05 52 05            [ 2]  111 	sub	sp, #5
      00AE07 6B 05            [ 1]  112 	ld	(0x05, sp), a
                                    113 ;	./../../mib/stm8s_mib_flash_option.c: 114: if(vbAddress > OPTION_BYTE_END_PHYSICAL_ADDRESS)
      00AE09 A3 48 7F         [ 2]  114 	cpw	x, #0x487f
      00AE0C 23 03            [ 2]  115 	jrule	00104$
                                    116 ;	./../../mib/stm8s_mib_flash_option.c: 116: return 0; // false...
      00AE0E 4F               [ 1]  117 	clr	a
      00AE0F 20 51            [ 2]  118 	jra	00114$
      00AE11                        119 00104$:
                                    120 ;	./../../mib/stm8s_mib_flash_option.c: 118: else if(vbAddress < OPTION_BYTE_START_PHYSICAL_ADDRESS)
      00AE11 A3 48 00         [ 2]  121 	cpw	x, #0x4800
      00AE14 24 03            [ 1]  122 	jrnc	00105$
                                    123 ;	./../../mib/stm8s_mib_flash_option.c: 120: return 0; // false...
      00AE16 4F               [ 1]  124 	clr	a
      00AE17 20 49            [ 2]  125 	jra	00114$
      00AE19                        126 00105$:
                                    127 ;	./../../mib/stm8s_mib_flash_option.c: 123: if((FLASH->IAPSR & FLASH_IAPSR_DUL)==0)
      00AE19 72 06 50 5F 03   [ 2]  128 	btjt	0x505f, #3, 00107$
                                    129 ;	./../../mib/stm8s_mib_flash_option.c: 125: return 0; // false...
      00AE1E 4F               [ 1]  130 	clr	a
      00AE1F 20 41            [ 2]  131 	jra	00114$
      00AE21                        132 00107$:
                                    133 ;	./../../mib/stm8s_mib_flash_option.c: 129: FLASH->CR2 |= FLASH_CR2_OPT;
      00AE21 72 1E 50 5B      [ 1]  134 	bset	0x505b, #7
                                    135 ;	./../../mib/stm8s_mib_flash_option.c: 130: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
      00AE25 72 1F 50 5C      [ 1]  136 	bres	0x505c, #7
                                    137 ;	./../../mib/stm8s_mib_flash_option.c: 133: if(vbAddress == 0x4800)
      00AE29 1F 01            [ 2]  138 	ldw	(0x01, sp), x
                                    139 ;	./../../mib/stm8s_mib_flash_option.c: 136: *((NEAR uint8_t*)vbAddress) = vbData;
      00AE2B 1F 03            [ 2]  140 	ldw	(0x03, sp), x
                                    141 ;	./../../mib/stm8s_mib_flash_option.c: 133: if(vbAddress == 0x4800)
      00AE2D 1E 01            [ 2]  142 	ldw	x, (0x01, sp)
      00AE2F A3 48 00         [ 2]  143 	cpw	x, #0x4800
      00AE32 26 07            [ 1]  144 	jrne	00109$
                                    145 ;	./../../mib/stm8s_mib_flash_option.c: 136: *((NEAR uint8_t*)vbAddress) = vbData;
      00AE34 1E 03            [ 2]  146 	ldw	x, (0x03, sp)
      00AE36 7B 05            [ 1]  147 	ld	a, (0x05, sp)
      00AE38 F7               [ 1]  148 	ld	(x), a
      00AE39 20 0C            [ 2]  149 	jra	00110$
      00AE3B                        150 00109$:
                                    151 ;	./../../mib/stm8s_mib_flash_option.c: 141: *((NEAR uint8_t*)vbAddress) = vbData;
      00AE3B 1E 03            [ 2]  152 	ldw	x, (0x03, sp)
      00AE3D 7B 05            [ 1]  153 	ld	a, (0x05, sp)
      00AE3F F7               [ 1]  154 	ld	(x), a
                                    155 ;	./../../mib/stm8s_mib_flash_option.c: 142: *((NEAR uint8_t*)((uint16_t)(vbAddress + 1))) = (uint8_t)(~vbData);
      00AE40 1E 01            [ 2]  156 	ldw	x, (0x01, sp)
      00AE42 5C               [ 1]  157 	incw	x
      00AE43 7B 05            [ 1]  158 	ld	a, (0x05, sp)
      00AE45 43               [ 1]  159 	cpl	a
      00AE46 F7               [ 1]  160 	ld	(x), a
      00AE47                        161 00110$:
                                    162 ;	./../../mib/stm8s_mib_flash_option.c: 147: vbRet = FlashOptionWaitForLastOperation(FLASH_MEMTYPE_PROG);
      00AE47 A6 FD            [ 1]  163 	ld	a, #0xfd
      00AE49 CD AF 01         [ 4]  164 	call	_FlashOptionWaitForLastOperation
      00AE4C 97               [ 1]  165 	ld	xl, a
                                    166 ;	./../../mib/stm8s_mib_flash_option.c: 148: if((vbRet==0) || (vbRet==2))
      00AE4D 4D               [ 1]  167 	tnz	a
      00AE4E 27 05            [ 1]  168 	jreq	00111$
      00AE50 9F               [ 1]  169 	ld	a, xl
      00AE51 A1 02            [ 1]  170 	cp	a, #0x02
      00AE53 26 03            [ 1]  171 	jrne	00112$
      00AE55                        172 00111$:
                                    173 ;	./../../mib/stm8s_mib_flash_option.c: 150: return 0; // false...
      00AE55 4F               [ 1]  174 	clr	a
      00AE56 20 0A            [ 2]  175 	jra	00114$
      00AE58                        176 00112$:
                                    177 ;	./../../mib/stm8s_mib_flash_option.c: 155: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
      00AE58 72 1F 50 5B      [ 1]  178 	bres	0x505b, #7
                                    179 ;	./../../mib/stm8s_mib_flash_option.c: 156: FLASH->NCR2 |= FLASH_NCR2_NOPT;
      00AE5C 72 1E 50 5C      [ 1]  180 	bset	0x505c, #7
                                    181 ;	./../../mib/stm8s_mib_flash_option.c: 157: return 1; // true...
      00AE60 A6 01            [ 1]  182 	ld	a, #0x01
      00AE62                        183 00114$:
                                    184 ;	./../../mib/stm8s_mib_flash_option.c: 158: }
      00AE62 5B 05            [ 2]  185 	addw	sp, #5
      00AE64 81               [ 4]  186 	ret
                                    187 ;	./../../mib/stm8s_mib_flash_option.c: 169: uint16_t mmFlashOptionRead(uint16_t vbAddress)
                                    188 ;	-----------------------------------------
                                    189 ;	 function mmFlashOptionRead
                                    190 ;	-----------------------------------------
      00AE65                        191 _mmFlashOptionRead:
      00AE65 52 05            [ 2]  192 	sub	sp, #5
                                    193 ;	./../../mib/stm8s_mib_flash_option.c: 175: if(vbAddress > OPTION_BYTE_END_PHYSICAL_ADDRESS)
      00AE67 A3 48 7F         [ 2]  194 	cpw	x, #0x487f
      00AE6A 23 03            [ 2]  195 	jrule	00104$
                                    196 ;	./../../mib/stm8s_mib_flash_option.c: 177: return 0; // false...
      00AE6C 5F               [ 1]  197 	clrw	x
      00AE6D 20 40            [ 2]  198 	jra	00112$
      00AE6F                        199 00104$:
                                    200 ;	./../../mib/stm8s_mib_flash_option.c: 179: else if(vbAddress < OPTION_BYTE_START_PHYSICAL_ADDRESS)
      00AE6F A3 48 00         [ 2]  201 	cpw	x, #0x4800
      00AE72 24 03            [ 1]  202 	jrnc	00105$
                                    203 ;	./../../mib/stm8s_mib_flash_option.c: 181: return 0; // false...
      00AE74 5F               [ 1]  204 	clrw	x
      00AE75 20 38            [ 2]  205 	jra	00112$
      00AE77                        206 00105$:
                                    207 ;	./../../mib/stm8s_mib_flash_option.c: 184: value_optbyte = *((NEAR uint8_t*)vbAddress); /* Read option byte */
      00AE77 90 93            [ 1]  208 	ldw	y, x
      00AE79 90 F6            [ 1]  209 	ld	a, (y)
      00AE7B 6B 05            [ 1]  210 	ld	(0x05, sp), a
                                    211 ;	./../../mib/stm8s_mib_flash_option.c: 185: value_optbyte_complement = *(((NEAR uint8_t*)vbAddress) + 1); /* Read option byte complement */
      00AE7D 90 E6 01         [ 1]  212 	ld	a, (0x1, y)
      00AE80 6B 01            [ 1]  213 	ld	(0x01, sp), a
                                    214 ;	./../../mib/stm8s_mib_flash_option.c: 188: if(vbAddress == 0x4800)
                                    215 ;	./../../mib/stm8s_mib_flash_option.c: 190: res_value =	 value_optbyte;
      00AE82 7B 05            [ 1]  216 	ld	a, (0x05, sp)
      00AE84 6B 03            [ 1]  217 	ld	(0x03, sp), a
      00AE86 0F 02            [ 1]  218 	clr	(0x02, sp)
                                    219 ;	./../../mib/stm8s_mib_flash_option.c: 188: if(vbAddress == 0x4800)
      00AE88 A3 48 00         [ 2]  220 	cpw	x, #0x4800
      00AE8B 27 20            [ 1]  221 	jreq	00111$
                                    222 ;	./../../mib/stm8s_mib_flash_option.c: 190: res_value =	 value_optbyte;
                                    223 ;	./../../mib/stm8s_mib_flash_option.c: 194: if(value_optbyte == (uint8_t)(~value_optbyte_complement))
      00AE8D 7B 01            [ 1]  224 	ld	a, (0x01, sp)
      00AE8F 43               [ 1]  225 	cpl	a
      00AE90 11 05            [ 1]  226 	cp	a, (0x05, sp)
      00AE92 26 14            [ 1]  227 	jrne	00107$
                                    228 ;	./../../mib/stm8s_mib_flash_option.c: 196: res_value = (uint16_t)((uint16_t)value_optbyte << 8);
      00AE94 7B 03            [ 1]  229 	ld	a, (0x03, sp)
      00AE96 6B 04            [ 1]  230 	ld	(0x04, sp), a
      00AE98 0F 05            [ 1]  231 	clr	(0x05, sp)
                                    232 ;	./../../mib/stm8s_mib_flash_option.c: 197: res_value = res_value | (uint16_t)value_optbyte_complement;
      00AE9A 7B 01            [ 1]  233 	ld	a, (0x01, sp)
      00AE9C 5F               [ 1]  234 	clrw	x
      00AE9D 1A 05            [ 1]  235 	or	a, (0x05, sp)
      00AE9F 6B 03            [ 1]  236 	ld	(0x03, sp), a
      00AEA1 9F               [ 1]  237 	ld	a, xl
      00AEA2 1A 04            [ 1]  238 	or	a, (0x04, sp)
      00AEA4 6B 02            [ 1]  239 	ld	(0x02, sp), a
      00AEA6 20 05            [ 2]  240 	jra	00111$
      00AEA8                        241 00107$:
                                    242 ;	./../../mib/stm8s_mib_flash_option.c: 201: res_value = FLASH_OPTIONBYTE_ERROR;
      00AEA8 AE 55 55         [ 2]  243 	ldw	x, #0x5555
      00AEAB 1F 02            [ 2]  244 	ldw	(0x02, sp), x
      00AEAD                        245 00111$:
                                    246 ;	./../../mib/stm8s_mib_flash_option.c: 204: return(res_value);
      00AEAD 1E 02            [ 2]  247 	ldw	x, (0x02, sp)
      00AEAF                        248 00112$:
                                    249 ;	./../../mib/stm8s_mib_flash_option.c: 205: }
      00AEAF 5B 05            [ 2]  250 	addw	sp, #5
      00AEB1 81               [ 4]  251 	ret
                                    252 ;	./../../mib/stm8s_mib_flash_option.c: 215: uint8_t mmFlashOptionErase(uint16_t vbAddress)
                                    253 ;	-----------------------------------------
                                    254 ;	 function mmFlashOptionErase
                                    255 ;	-----------------------------------------
      00AEB2                        256 _mmFlashOptionErase:
      00AEB2 52 02            [ 2]  257 	sub	sp, #2
                                    258 ;	./../../mib/stm8s_mib_flash_option.c: 218: if(vbAddress > OPTION_BYTE_END_PHYSICAL_ADDRESS)
      00AEB4 A3 48 7F         [ 2]  259 	cpw	x, #0x487f
      00AEB7 23 03            [ 2]  260 	jrule	00104$
                                    261 ;	./../../mib/stm8s_mib_flash_option.c: 220: return 0; // false...
      00AEB9 4F               [ 1]  262 	clr	a
      00AEBA 20 42            [ 2]  263 	jra	00112$
      00AEBC                        264 00104$:
                                    265 ;	./../../mib/stm8s_mib_flash_option.c: 222: else if(vbAddress < OPTION_BYTE_START_PHYSICAL_ADDRESS)
      00AEBC A3 48 00         [ 2]  266 	cpw	x, #0x4800
      00AEBF 24 03            [ 1]  267 	jrnc	00105$
                                    268 ;	./../../mib/stm8s_mib_flash_option.c: 224: return 0; // false...
      00AEC1 4F               [ 1]  269 	clr	a
      00AEC2 20 3A            [ 2]  270 	jra	00112$
      00AEC4                        271 00105$:
                                    272 ;	./../../mib/stm8s_mib_flash_option.c: 228: FLASH->CR2 |= FLASH_CR2_OPT;
      00AEC4 72 1E 50 5B      [ 1]  273 	bset	0x505b, #7
                                    274 ;	./../../mib/stm8s_mib_flash_option.c: 229: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
      00AEC8 72 1F 50 5C      [ 1]  275 	bres	0x505c, #7
                                    276 ;	./../../mib/stm8s_mib_flash_option.c: 232: if(vbAddress == 0x4800)
      00AECC 90 93            [ 1]  277 	ldw	y, x
                                    278 ;	./../../mib/stm8s_mib_flash_option.c: 235: *((NEAR uint8_t*)vbAddress) = 0x00; // FLASH_CLEAR_BYTE;
      00AECE 1F 01            [ 2]  279 	ldw	(0x01, sp), x
                                    280 ;	./../../mib/stm8s_mib_flash_option.c: 232: if(vbAddress == 0x4800)
      00AED0 90 A3 48 00      [ 2]  281 	cpw	y, #0x4800
      00AED4 26 05            [ 1]  282 	jrne	00107$
                                    283 ;	./../../mib/stm8s_mib_flash_option.c: 235: *((NEAR uint8_t*)vbAddress) = 0x00; // FLASH_CLEAR_BYTE;
      00AED6 1E 01            [ 2]  284 	ldw	x, (0x01, sp)
      00AED8 7F               [ 1]  285 	clr	(x)
      00AED9 20 08            [ 2]  286 	jra	00108$
      00AEDB                        287 00107$:
                                    288 ;	./../../mib/stm8s_mib_flash_option.c: 240: *((NEAR uint8_t*)vbAddress) = 0x00; // FLASH_CLEAR_BYTE;
      00AEDB 16 01            [ 2]  289 	ldw	y, (0x01, sp)
      00AEDD 90 7F            [ 1]  290 	clr	(y)
                                    291 ;	./../../mib/stm8s_mib_flash_option.c: 241: *((NEAR uint8_t*)((uint16_t)(vbAddress + (uint16_t)1 ))) = 0xff; // FLASH_SET_BYTE;
      00AEDF 5C               [ 1]  292 	incw	x
      00AEE0 A6 FF            [ 1]  293 	ld	a, #0xff
      00AEE2 F7               [ 1]  294 	ld	(x), a
      00AEE3                        295 00108$:
                                    296 ;	./../../mib/stm8s_mib_flash_option.c: 246: vbRet = FlashOptionWaitForLastOperation(FLASH_MEMTYPE_PROG);
      00AEE3 A6 FD            [ 1]  297 	ld	a, #0xfd
      00AEE5 CD AF 01         [ 4]  298 	call	_FlashOptionWaitForLastOperation
      00AEE8 97               [ 1]  299 	ld	xl, a
                                    300 ;	./../../mib/stm8s_mib_flash_option.c: 247: if((vbRet==0) || (vbRet==2))
      00AEE9 4D               [ 1]  301 	tnz	a
      00AEEA 27 05            [ 1]  302 	jreq	00109$
      00AEEC 9F               [ 1]  303 	ld	a, xl
      00AEED A1 02            [ 1]  304 	cp	a, #0x02
      00AEEF 26 03            [ 1]  305 	jrne	00110$
      00AEF1                        306 00109$:
                                    307 ;	./../../mib/stm8s_mib_flash_option.c: 249: return 0; // false...
      00AEF1 4F               [ 1]  308 	clr	a
      00AEF2 20 0A            [ 2]  309 	jra	00112$
      00AEF4                        310 00110$:
                                    311 ;	./../../mib/stm8s_mib_flash_option.c: 254: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
      00AEF4 72 1F 50 5B      [ 1]  312 	bres	0x505b, #7
                                    313 ;	./../../mib/stm8s_mib_flash_option.c: 255: FLASH->NCR2 |= FLASH_NCR2_NOPT;
      00AEF8 72 1E 50 5C      [ 1]  314 	bset	0x505c, #7
                                    315 ;	./../../mib/stm8s_mib_flash_option.c: 256: return 1; // true...
      00AEFC A6 01            [ 1]  316 	ld	a, #0x01
      00AEFE                        317 00112$:
                                    318 ;	./../../mib/stm8s_mib_flash_option.c: 257: }
      00AEFE 5B 02            [ 2]  319 	addw	sp, #2
      00AF00 81               [ 4]  320 	ret
                                    321 ;	./../../mib/stm8s_mib_flash_option.c: 269: uint8_t FlashOptionWaitForLastOperation(uint8_t FLASH_MemType)
                                    322 ;	-----------------------------------------
                                    323 ;	 function FlashOptionWaitForLastOperation
                                    324 ;	-----------------------------------------
      00AF01                        325 _FlashOptionWaitForLastOperation:
      00AF01 97               [ 1]  326 	ld	xl, a
                                    327 ;	./../../mib/stm8s_mib_flash_option.c: 271: uint8_t flagstatus = 0x00;
      00AF02 4F               [ 1]  328 	clr	a
                                    329 ;	./../../mib/stm8s_mib_flash_option.c: 277: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      00AF03 88               [ 1]  330 	push	a
      00AF04 9F               [ 1]  331 	ld	a, xl
      00AF05 A1 FD            [ 1]  332 	cp	a, #0xfd
      00AF07 84               [ 1]  333 	pop	a
      00AF08 26 10            [ 1]  334 	jrne	00121$
                                    335 ;	./../../mib/stm8s_mib_flash_option.c: 279: while((flagstatus == 0x00) && (timeout != 0x00))
      00AF0A 5F               [ 1]  336 	clrw	x
      00AF0B 5A               [ 2]  337 	decw	x
      00AF0C                        338 00102$:
      00AF0C 4D               [ 1]  339 	tnz	a
      00AF0D 26 1B            [ 1]  340 	jrne	00111$
      00AF0F 5D               [ 2]  341 	tnzw	x
      00AF10 27 18            [ 1]  342 	jreq	00111$
                                    343 ;	./../../mib/stm8s_mib_flash_option.c: 281: flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
      00AF12 C6 50 5F         [ 1]  344 	ld	a, 0x505f
      00AF15 A4 05            [ 1]  345 	and	a, #0x05
                                    346 ;	./../../mib/stm8s_mib_flash_option.c: 283: timeout--;
      00AF17 5A               [ 2]  347 	decw	x
      00AF18 20 F2            [ 2]  348 	jra	00102$
                                    349 ;	./../../mib/stm8s_mib_flash_option.c: 288: while((flagstatus == 0x00) && (timeout != 0x00))
      00AF1A                        350 00121$:
      00AF1A 5F               [ 1]  351 	clrw	x
      00AF1B 5A               [ 2]  352 	decw	x
      00AF1C                        353 00106$:
      00AF1C 4D               [ 1]  354 	tnz	a
      00AF1D 26 0B            [ 1]  355 	jrne	00124$
      00AF1F 5D               [ 2]  356 	tnzw	x
      00AF20 27 08            [ 1]  357 	jreq	00124$
                                    358 ;	./../../mib/stm8s_mib_flash_option.c: 290: flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
      00AF22 C6 50 5F         [ 1]  359 	ld	a, 0x505f
      00AF25 A4 41            [ 1]  360 	and	a, #0x41
                                    361 ;	./../../mib/stm8s_mib_flash_option.c: 292: timeout--;
      00AF27 5A               [ 2]  362 	decw	x
      00AF28 20 F2            [ 2]  363 	jra	00106$
                                    364 ;	./../../mib/stm8s_mib_flash_option.c: 309: return((uint8_t)flagstatus);
                                    365 ;	./../../mib/stm8s_mib_flash_option.c: 292: timeout--;
      00AF2A                        366 00124$:
      00AF2A                        367 00111$:
                                    368 ;	./../../mib/stm8s_mib_flash_option.c: 304: if(timeout == 0x00 )
      00AF2A 5D               [ 2]  369 	tnzw	x
      00AF2B 27 01            [ 1]  370 	jreq	00164$
      00AF2D 81               [ 4]  371 	ret
      00AF2E                        372 00164$:
                                    373 ;	./../../mib/stm8s_mib_flash_option.c: 306: flagstatus = FLASH_STATUS_TIMEOUT;
      00AF2E A6 02            [ 1]  374 	ld	a, #0x02
                                    375 ;	./../../mib/stm8s_mib_flash_option.c: 309: return((uint8_t)flagstatus);
                                    376 ;	./../../mib/stm8s_mib_flash_option.c: 310: }
      00AF30 81               [ 4]  377 	ret
                                    378 	.area CODE
                                    379 	.area CONST
                                    380 	.area INITIALIZER
                                    381 	.area CABS (ABS)
