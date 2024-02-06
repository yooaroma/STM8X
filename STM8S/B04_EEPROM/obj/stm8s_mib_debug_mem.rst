                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_mib_debug_mem
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _HexDump
                                     12 	.globl _HexToInt
                                     13 	.globl _mib_printf
                                     14 	.globl _MibWriteDebugString
                                     15 	.globl ___memcpy
                                     16 	.globl _memset
                                     17 	.globl _strcmp
                                     18 	.globl _memcmp
                                     19 	.globl _cmd_mem
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DATA
                                     24 ;--------------------------------------------------------
                                     25 ; ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area INITIALIZED
      000180                         28 _cmdTbl_only:
      000180                         29 	.ds 12
                                     30 ;--------------------------------------------------------
                                     31 ; absolute external ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area DABS (ABS)
                                     34 
                                     35 ; default segment ordering for linker
                                     36 	.area HOME
                                     37 	.area GSINIT
                                     38 	.area GSFINAL
                                     39 	.area CONST
                                     40 	.area INITIALIZER
                                     41 	.area CODE
                                     42 
                                     43 ;--------------------------------------------------------
                                     44 ; global & static initialisations
                                     45 ;--------------------------------------------------------
                                     46 	.area HOME
                                     47 	.area GSINIT
                                     48 	.area GSFINAL
                                     49 	.area GSINIT
                                     50 ;--------------------------------------------------------
                                     51 ; Home
                                     52 ;--------------------------------------------------------
                                     53 	.area HOME
                                     54 	.area HOME
                                     55 ;--------------------------------------------------------
                                     56 ; code
                                     57 ;--------------------------------------------------------
                                     58 	.area CODE
                                     59 ;	./../../mib/stm8s_mib_debug_mem.c: 54: void cmd_mem(void)
                                     60 ;	-----------------------------------------
                                     61 ;	 function cmd_mem
                                     62 ;	-----------------------------------------
      00A3F4                         63 _cmd_mem:
      00A3F4 52 0A            [ 2]   64 	sub	sp, #10
                                     65 ;	./../../mib/stm8s_mib_debug_mem.c: 60: for (cptr = cmdTbl;; cptr++) 
      00A3F6 AE 01 5C         [ 2]   66 	ldw	x, #(_cmdTbl+0)
      00A3F9 1F 01            [ 2]   67 	ldw	(0x01, sp), x
      00A3FB 5F               [ 1]   68 	clrw	x
      00A3FC 1F 07            [ 2]   69 	ldw	(0x07, sp), x
      00A3FE 1F 05            [ 2]   70 	ldw	(0x05, sp), x
      00A400 16 01            [ 2]   71 	ldw	y, (0x01, sp)
      00A402 17 09            [ 2]   72 	ldw	(0x09, sp), y
      00A404                         73 00106$:
                                     74 ;	./../../mib/stm8s_mib_debug_mem.c: 62: if(cptr->cmd==0)
      00A404 1E 09            [ 2]   75 	ldw	x, (0x09, sp)
      00A406 FE               [ 2]   76 	ldw	x, (x)
      00A407 1F 03            [ 2]   77 	ldw	(0x03, sp), x
      00A409 26 19            [ 1]   78 	jrne	00102$
                                     79 ;	./../../mib/stm8s_mib_debug_mem.c: 64: ccprintf(1,("INFO:+cmd_mem...\r\n"));
      00A40B 4B F9            [ 1]   80 	push	#<(__str_0+0)
      00A40D 4B 88            [ 1]   81 	push	#((__str_0+0) >> 8)
      00A40F CD 9C 98         [ 4]   82 	call	_mib_printf
      00A412 5B 02            [ 2]   83 	addw	sp, #2
                                     84 ;	./../../mib/stm8s_mib_debug_mem.c: 65: memcpy((void *)&(cptr->cmd),(void *)&(cmdTbl_only[0].cmd),sizeof(CMD_MY));
      00A414 AE 01 80         [ 2]   85 	ldw	x, #_cmdTbl_only+0
      00A417 16 01            [ 2]   86 	ldw	y, (0x01, sp)
      00A419 4B 06            [ 1]   87 	push	#0x06
      00A41B 4B 00            [ 1]   88 	push	#0x00
      00A41D 89               [ 2]   89 	pushw	x
      00A41E 93               [ 1]   90 	ldw	x, y
      00A41F CD B0 7D         [ 4]   91 	call	___memcpy
                                     92 ;	./../../mib/stm8s_mib_debug_mem.c: 66: break;
      00A422 20 2F            [ 2]   93 	jra	00105$
      00A424                         94 00102$:
                                     95 ;	./../../mib/stm8s_mib_debug_mem.c: 68: index++;
      00A424 1E 07            [ 2]   96 	ldw	x, (0x07, sp)
      00A426 5C               [ 1]   97 	incw	x
      00A427 1F 07            [ 2]   98 	ldw	(0x07, sp), x
      00A429 26 05            [ 1]   99 	jrne	00126$
      00A42B 1E 05            [ 2]  100 	ldw	x, (0x05, sp)
      00A42D 5C               [ 1]  101 	incw	x
      00A42E 1F 05            [ 2]  102 	ldw	(0x05, sp), x
      00A430                        103 00126$:
                                    104 ;	./../../mib/stm8s_mib_debug_mem.c: 69: if(index>MAX_COMMANDS)
      00A430 AE 00 06         [ 2]  105 	ldw	x, #0x0006
      00A433 13 07            [ 2]  106 	cpw	x, (0x07, sp)
      00A435 4F               [ 1]  107 	clr	a
      00A436 12 06            [ 1]  108 	sbc	a, (0x06, sp)
      00A438 4F               [ 1]  109 	clr	a
      00A439 12 05            [ 1]  110 	sbc	a, (0x05, sp)
      00A43B 24 0B            [ 1]  111 	jrnc	00107$
                                    112 ;	./../../mib/stm8s_mib_debug_mem.c: 71: ccprintf(1,("INFO:-cmd_mem...\r\n"));
      00A43D 4B 0C            [ 1]  113 	push	#<(__str_1+0)
      00A43F 4B 89            [ 1]  114 	push	#((__str_1+0) >> 8)
      00A441 CD 9C 98         [ 4]  115 	call	_mib_printf
      00A444 5B 02            [ 2]  116 	addw	sp, #2
                                    117 ;	./../../mib/stm8s_mib_debug_mem.c: 72: return;
      00A446 20 0B            [ 2]  118 	jra	00108$
      00A448                        119 00107$:
                                    120 ;	./../../mib/stm8s_mib_debug_mem.c: 60: for (cptr = cmdTbl;; cptr++) 
      00A448 1E 09            [ 2]  121 	ldw	x, (0x09, sp)
      00A44A 1C 00 06         [ 2]  122 	addw	x, #0x0006
      00A44D 1F 09            [ 2]  123 	ldw	(0x09, sp), x
      00A44F 1F 01            [ 2]  124 	ldw	(0x01, sp), x
      00A451 20 B1            [ 2]  125 	jra	00106$
      00A453                        126 00105$:
                                    127 ;	./../../mib/stm8s_mib_debug_mem.c: 75: return;
      00A453                        128 00108$:
                                    129 ;	./../../mib/stm8s_mib_debug_mem.c: 76: }
      00A453 5B 0A            [ 2]  130 	addw	sp, #10
      00A455 81               [ 4]  131 	ret
                                    132 ;	./../../mib/stm8s_mib_debug_mem.c: 86: static int DoMem(CMD_MY *cptr, int argc, char **argv)
                                    133 ;	-----------------------------------------
                                    134 ;	 function DoMem
                                    135 ;	-----------------------------------------
      00A456                        136 _DoMem:
      00A456 52 29            [ 2]  137 	sub	sp, #41
      00A458 1F 24            [ 2]  138 	ldw	(0x24, sp), x
                                    139 ;	./../../mib/stm8s_mib_debug_mem.c: 88: uint32_t addr = 0;
      00A45A 5F               [ 1]  140 	clrw	x
      00A45B 1F 03            [ 2]  141 	ldw	(0x03, sp), x
      00A45D 1F 01            [ 2]  142 	ldw	(0x01, sp), x
                                    143 ;	./../../mib/stm8s_mib_debug_mem.c: 100: if (argc < 3)
      00A45F 1E 2C            [ 2]  144 	ldw	x, (0x2c, sp)
      00A461 A3 00 03         [ 2]  145 	cpw	x, #0x0003
      00A464 2E 0B            [ 1]  146 	jrsge	00102$
                                    147 ;	./../../mib/stm8s_mib_debug_mem.c: 102: MibWriteDebugString(cptr->usage);
      00A466 1E 24            [ 2]  148 	ldw	x, (0x24, sp)
      00A468 EE 04            [ 2]  149 	ldw	x, (0x4, x)
      00A46A CD 92 86         [ 4]  150 	call	_MibWriteDebugString
                                    151 ;	./../../mib/stm8s_mib_debug_mem.c: 103: return FALSE;
      00A46D 5F               [ 1]  152 	clrw	x
      00A46E CC AB CB         [ 2]  153 	jp	00235$
      00A471                        154 00102$:
                                    155 ;	./../../mib/stm8s_mib_debug_mem.c: 105: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      00A471 1E 2E            [ 2]  156 	ldw	x, (0x2e, sp)
      00A473 5C               [ 1]  157 	incw	x
      00A474 5C               [ 1]  158 	incw	x
      00A475 1F 26            [ 2]  159 	ldw	(0x26, sp), x
      00A477 FE               [ 2]  160 	ldw	x, (x)
      00A478 4B 1F            [ 1]  161 	push	#<(___str_2+0)
      00A47A 4B 89            [ 1]  162 	push	#((___str_2+0) >> 8)
      00A47C CD B1 01         [ 4]  163 	call	_strcmp
      00A47F 5D               [ 2]  164 	tnzw	x
      00A480 27 03            [ 1]  165 	jreq	00564$
      00A482 CC A5 58         [ 2]  166 	jp	00215$
      00A485                        167 00564$:
                                    168 ;	./../../mib/stm8s_mib_debug_mem.c: 107: if (argc < 5)
      00A485 1E 2C            [ 2]  169 	ldw	x, (0x2c, sp)
      00A487 A3 00 05         [ 2]  170 	cpw	x, #0x0005
      00A48A 2E 0B            [ 1]  171 	jrsge	00104$
                                    172 ;	./../../mib/stm8s_mib_debug_mem.c: 109: MibWriteDebugString(cptr->usage);
      00A48C 1E 24            [ 2]  173 	ldw	x, (0x24, sp)
      00A48E EE 04            [ 2]  174 	ldw	x, (0x4, x)
      00A490 CD 92 86         [ 4]  175 	call	_MibWriteDebugString
                                    176 ;	./../../mib/stm8s_mib_debug_mem.c: 110: return FALSE;
      00A493 5F               [ 1]  177 	clrw	x
      00A494 CC AB CB         [ 2]  178 	jp	00235$
      00A497                        179 00104$:
                                    180 ;	./../../mib/stm8s_mib_debug_mem.c: 112: if (!HexToInt(argv[3], &addr, 32))
      00A497 96               [ 1]  181 	ldw	x, sp
      00A498 5C               [ 1]  182 	incw	x
      00A499 51               [ 1]  183 	exgw	x, y
      00A49A 1E 2E            [ 2]  184 	ldw	x, (0x2e, sp)
      00A49C EE 06            [ 2]  185 	ldw	x, (0x6, x)
      00A49E 4B 20            [ 1]  186 	push	#0x20
      00A4A0 4B 00            [ 1]  187 	push	#0x00
      00A4A2 90 89            [ 2]  188 	pushw	y
      00A4A4 CD 9F 99         [ 4]  189 	call	_HexToInt
      00A4A7 5D               [ 2]  190 	tnzw	x
      00A4A8 26 0D            [ 1]  191 	jrne	00106$
                                    192 ;	./../../mib/stm8s_mib_debug_mem.c: 114: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A4AA 4B 25            [ 1]  193 	push	#<(__str_3+0)
      00A4AC 4B 89            [ 1]  194 	push	#((__str_3+0) >> 8)
      00A4AE CD 9C 98         [ 4]  195 	call	_mib_printf
      00A4B1 5B 02            [ 2]  196 	addw	sp, #2
                                    197 ;	./../../mib/stm8s_mib_debug_mem.c: 115: return FALSE;
      00A4B3 5F               [ 1]  198 	clrw	x
      00A4B4 CC AB CB         [ 2]  199 	jp	00235$
      00A4B7                        200 00106$:
                                    201 ;	./../../mib/stm8s_mib_debug_mem.c: 118: switch (argv[2][0])
      00A4B7 1E 2E            [ 2]  202 	ldw	x, (0x2e, sp)
      00A4B9 EE 04            [ 2]  203 	ldw	x, (0x4, x)
      00A4BB F6               [ 1]  204 	ld	a, (x)
      00A4BC A1 63            [ 1]  205 	cp	a, #0x63
      00A4BE 27 0B            [ 1]  206 	jreq	00107$
      00A4C0 A1 6C            [ 1]  207 	cp	a, #0x6c
      00A4C2 27 5B            [ 1]  208 	jreq	00113$
      00A4C4 A1 73            [ 1]  209 	cp	a, #0x73
      00A4C6 27 2D            [ 1]  210 	jreq	00110$
      00A4C8 CC A5 4D         [ 2]  211 	jp	00116$
                                    212 ;	./../../mib/stm8s_mib_debug_mem.c: 120: case 'c':
      00A4CB                        213 00107$:
                                    214 ;	./../../mib/stm8s_mib_debug_mem.c: 121: if (!HexToInt(argv[4], &c, 8))
      00A4CB 96               [ 1]  215 	ldw	x, sp
      00A4CC 1C 00 05         [ 2]  216 	addw	x, #5
      00A4CF 51               [ 1]  217 	exgw	x, y
      00A4D0 1E 2E            [ 2]  218 	ldw	x, (0x2e, sp)
      00A4D2 EE 08            [ 2]  219 	ldw	x, (0x8, x)
      00A4D4 4B 08            [ 1]  220 	push	#0x08
      00A4D6 4B 00            [ 1]  221 	push	#0x00
      00A4D8 90 89            [ 2]  222 	pushw	y
      00A4DA CD 9F 99         [ 4]  223 	call	_HexToInt
      00A4DD 5D               [ 2]  224 	tnzw	x
      00A4DE 26 0D            [ 1]  225 	jrne	00109$
                                    226 ;	./../../mib/stm8s_mib_debug_mem.c: 123: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A4E0 4B 25            [ 1]  227 	push	#<(__str_3+0)
      00A4E2 4B 89            [ 1]  228 	push	#((__str_3+0) >> 8)
      00A4E4 CD 9C 98         [ 4]  229 	call	_mib_printf
      00A4E7 5B 02            [ 2]  230 	addw	sp, #2
                                    231 ;	./../../mib/stm8s_mib_debug_mem.c: 124: return FALSE;
      00A4E9 5F               [ 1]  232 	clrw	x
      00A4EA CC AB CB         [ 2]  233 	jp	00235$
      00A4ED                        234 00109$:
                                    235 ;	./../../mib/stm8s_mib_debug_mem.c: 126: wr_ADDR8(addr, c);
      00A4ED 1E 03            [ 2]  236 	ldw	x, (0x03, sp)
      00A4EF 7B 05            [ 1]  237 	ld	a, (0x05, sp)
      00A4F1 F7               [ 1]  238 	ld	(x), a
                                    239 ;	./../../mib/stm8s_mib_debug_mem.c: 127: break;
      00A4F2 CC AB C9         [ 2]  240 	jp	00216$
                                    241 ;	./../../mib/stm8s_mib_debug_mem.c: 128: case 's':
      00A4F5                        242 00110$:
                                    243 ;	./../../mib/stm8s_mib_debug_mem.c: 129: if (!HexToInt(argv[4], &s, 16))
      00A4F5 96               [ 1]  244 	ldw	x, sp
      00A4F6 1C 00 06         [ 2]  245 	addw	x, #6
      00A4F9 51               [ 1]  246 	exgw	x, y
      00A4FA 1E 2E            [ 2]  247 	ldw	x, (0x2e, sp)
      00A4FC EE 08            [ 2]  248 	ldw	x, (0x8, x)
      00A4FE 4B 10            [ 1]  249 	push	#0x10
      00A500 4B 00            [ 1]  250 	push	#0x00
      00A502 90 89            [ 2]  251 	pushw	y
      00A504 CD 9F 99         [ 4]  252 	call	_HexToInt
      00A507 5D               [ 2]  253 	tnzw	x
      00A508 26 0D            [ 1]  254 	jrne	00112$
                                    255 ;	./../../mib/stm8s_mib_debug_mem.c: 131: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A50A 4B 25            [ 1]  256 	push	#<(__str_3+0)
      00A50C 4B 89            [ 1]  257 	push	#((__str_3+0) >> 8)
      00A50E CD 9C 98         [ 4]  258 	call	_mib_printf
      00A511 5B 02            [ 2]  259 	addw	sp, #2
                                    260 ;	./../../mib/stm8s_mib_debug_mem.c: 132: return FALSE;
      00A513 5F               [ 1]  261 	clrw	x
      00A514 CC AB CB         [ 2]  262 	jp	00235$
      00A517                        263 00112$:
                                    264 ;	./../../mib/stm8s_mib_debug_mem.c: 134: wr_ADDR16(addr, s);
      00A517 1E 03            [ 2]  265 	ldw	x, (0x03, sp)
      00A519 16 06            [ 2]  266 	ldw	y, (0x06, sp)
      00A51B FF               [ 2]  267 	ldw	(x), y
                                    268 ;	./../../mib/stm8s_mib_debug_mem.c: 135: break;
      00A51C CC AB C9         [ 2]  269 	jp	00216$
                                    270 ;	./../../mib/stm8s_mib_debug_mem.c: 136: case 'l':
      00A51F                        271 00113$:
                                    272 ;	./../../mib/stm8s_mib_debug_mem.c: 137: if (!HexToInt(argv[4], &l, 32))
      00A51F 96               [ 1]  273 	ldw	x, sp
      00A520 1C 00 08         [ 2]  274 	addw	x, #8
      00A523 51               [ 1]  275 	exgw	x, y
      00A524 1E 2E            [ 2]  276 	ldw	x, (0x2e, sp)
      00A526 EE 08            [ 2]  277 	ldw	x, (0x8, x)
      00A528 4B 20            [ 1]  278 	push	#0x20
      00A52A 4B 00            [ 1]  279 	push	#0x00
      00A52C 90 89            [ 2]  280 	pushw	y
      00A52E CD 9F 99         [ 4]  281 	call	_HexToInt
      00A531 5D               [ 2]  282 	tnzw	x
      00A532 26 0D            [ 1]  283 	jrne	00115$
                                    284 ;	./../../mib/stm8s_mib_debug_mem.c: 139: ccprintf(_DEBUG_CMD_A_, ("Illugal character is useqd.\r\n"));
      00A534 4B 42            [ 1]  285 	push	#<(__str_4+0)
      00A536 4B 89            [ 1]  286 	push	#((__str_4+0) >> 8)
      00A538 CD 9C 98         [ 4]  287 	call	_mib_printf
      00A53B 5B 02            [ 2]  288 	addw	sp, #2
                                    289 ;	./../../mib/stm8s_mib_debug_mem.c: 140: return FALSE;
      00A53D 5F               [ 1]  290 	clrw	x
      00A53E CC AB CB         [ 2]  291 	jp	00235$
      00A541                        292 00115$:
                                    293 ;	./../../mib/stm8s_mib_debug_mem.c: 142: wr_ADDR32(addr, l);
      00A541 1E 03            [ 2]  294 	ldw	x, (0x03, sp)
      00A543 16 0A            [ 2]  295 	ldw	y, (0x0a, sp)
      00A545 EF 02            [ 2]  296 	ldw	(0x2, x), y
      00A547 16 08            [ 2]  297 	ldw	y, (0x08, sp)
      00A549 FF               [ 2]  298 	ldw	(x), y
                                    299 ;	./../../mib/stm8s_mib_debug_mem.c: 143: break;
      00A54A CC AB C9         [ 2]  300 	jp	00216$
                                    301 ;	./../../mib/stm8s_mib_debug_mem.c: 144: default:
      00A54D                        302 00116$:
                                    303 ;	./../../mib/stm8s_mib_debug_mem.c: 145: MibWriteDebugString(cptr->usage);
      00A54D 1E 24            [ 2]  304 	ldw	x, (0x24, sp)
      00A54F EE 04            [ 2]  305 	ldw	x, (0x4, x)
      00A551 CD 92 86         [ 4]  306 	call	_MibWriteDebugString
                                    307 ;	./../../mib/stm8s_mib_debug_mem.c: 146: return FALSE;
      00A554 5F               [ 1]  308 	clrw	x
      00A555 CC AB CB         [ 2]  309 	jp	00235$
                                    310 ;	./../../mib/stm8s_mib_debug_mem.c: 147: }		
      00A558                        311 00215$:
                                    312 ;	./../../mib/stm8s_mib_debug_mem.c: 149: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      00A558 1E 26            [ 2]  313 	ldw	x, (0x26, sp)
      00A55A FE               [ 2]  314 	ldw	x, (x)
      00A55B 4B 60            [ 1]  315 	push	#<(___str_5+0)
      00A55D 4B 89            [ 1]  316 	push	#((___str_5+0) >> 8)
      00A55F CD B1 01         [ 4]  317 	call	_strcmp
      00A562 5D               [ 2]  318 	tnzw	x
      00A563 27 03            [ 1]  319 	jreq	00579$
      00A565 CC A6 1C         [ 2]  320 	jp	00212$
      00A568                        321 00579$:
                                    322 ;	./../../mib/stm8s_mib_debug_mem.c: 151: if (argc < 4)
      00A568 1E 2C            [ 2]  323 	ldw	x, (0x2c, sp)
      00A56A A3 00 04         [ 2]  324 	cpw	x, #0x0004
      00A56D 2E 0B            [ 1]  325 	jrsge	00119$
                                    326 ;	./../../mib/stm8s_mib_debug_mem.c: 153: MibWriteDebugString(cptr->usage);
      00A56F 1E 24            [ 2]  327 	ldw	x, (0x24, sp)
      00A571 EE 04            [ 2]  328 	ldw	x, (0x4, x)
      00A573 CD 92 86         [ 4]  329 	call	_MibWriteDebugString
                                    330 ;	./../../mib/stm8s_mib_debug_mem.c: 154: return FALSE;
      00A576 5F               [ 1]  331 	clrw	x
      00A577 CC AB CB         [ 2]  332 	jp	00235$
      00A57A                        333 00119$:
                                    334 ;	./../../mib/stm8s_mib_debug_mem.c: 156: if (!HexToInt(argv[3], &addr, 32))
      00A57A 96               [ 1]  335 	ldw	x, sp
      00A57B 5C               [ 1]  336 	incw	x
      00A57C 51               [ 1]  337 	exgw	x, y
      00A57D 1E 2E            [ 2]  338 	ldw	x, (0x2e, sp)
      00A57F EE 06            [ 2]  339 	ldw	x, (0x6, x)
      00A581 4B 20            [ 1]  340 	push	#0x20
      00A583 4B 00            [ 1]  341 	push	#0x00
      00A585 90 89            [ 2]  342 	pushw	y
      00A587 CD 9F 99         [ 4]  343 	call	_HexToInt
      00A58A 5D               [ 2]  344 	tnzw	x
      00A58B 26 0D            [ 1]  345 	jrne	00121$
                                    346 ;	./../../mib/stm8s_mib_debug_mem.c: 158: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A58D 4B 25            [ 1]  347 	push	#<(__str_3+0)
      00A58F 4B 89            [ 1]  348 	push	#((__str_3+0) >> 8)
      00A591 CD 9C 98         [ 4]  349 	call	_mib_printf
      00A594 5B 02            [ 2]  350 	addw	sp, #2
                                    351 ;	./../../mib/stm8s_mib_debug_mem.c: 159: return FALSE;
      00A596 5F               [ 1]  352 	clrw	x
      00A597 CC AB CB         [ 2]  353 	jp	00235$
      00A59A                        354 00121$:
                                    355 ;	./../../mib/stm8s_mib_debug_mem.c: 161: ccprintf(_DEBUG_CMD_A_,("\taddress : 0x%08lx  ", addr));
      00A59A 1E 03            [ 2]  356 	ldw	x, (0x03, sp)
      00A59C 89               [ 2]  357 	pushw	x
      00A59D 1E 03            [ 2]  358 	ldw	x, (0x03, sp)
      00A59F 89               [ 2]  359 	pushw	x
      00A5A0 4B 65            [ 1]  360 	push	#<(__str_6+0)
      00A5A2 4B 89            [ 1]  361 	push	#((__str_6+0) >> 8)
      00A5A4 CD 9C 98         [ 4]  362 	call	_mib_printf
      00A5A7 5B 06            [ 2]  363 	addw	sp, #6
                                    364 ;	./../../mib/stm8s_mib_debug_mem.c: 162: ccprintf(_DEBUG_CMD_A_, ("\tvalue   : "));
      00A5A9 4B 7A            [ 1]  365 	push	#<(__str_7+0)
      00A5AB 4B 89            [ 1]  366 	push	#((__str_7+0) >> 8)
      00A5AD CD 9C 98         [ 4]  367 	call	_mib_printf
      00A5B0 5B 02            [ 2]  368 	addw	sp, #2
                                    369 ;	./../../mib/stm8s_mib_debug_mem.c: 163: switch (argv[2][0])
      00A5B2 1E 2E            [ 2]  370 	ldw	x, (0x2e, sp)
      00A5B4 EE 04            [ 2]  371 	ldw	x, (0x4, x)
      00A5B6 F6               [ 1]  372 	ld	a, (x)
      00A5B7 A1 63            [ 1]  373 	cp	a, #0x63
      00A5B9 27 0A            [ 1]  374 	jreq	00122$
      00A5BB A1 6C            [ 1]  375 	cp	a, #0x6c
      00A5BD 27 2A            [ 1]  376 	jreq	00124$
      00A5BF A1 73            [ 1]  377 	cp	a, #0x73
      00A5C1 27 15            [ 1]  378 	jreq	00123$
      00A5C3 20 3E            [ 2]  379 	jra	00125$
                                    380 ;	./../../mib/stm8s_mib_debug_mem.c: 165: case 'c':
      00A5C5                        381 00122$:
                                    382 ;	./../../mib/stm8s_mib_debug_mem.c: 166: c = rd_ADDR8(addr);
      00A5C5 1E 03            [ 2]  383 	ldw	x, (0x03, sp)
      00A5C7 F6               [ 1]  384 	ld	a, (x)
      00A5C8 6B 05            [ 1]  385 	ld	(0x05, sp), a
                                    386 ;	./../../mib/stm8s_mib_debug_mem.c: 167: ccprintf(_DEBUG_CMD_A_,("0x%02x ", c));
      00A5CA 5F               [ 1]  387 	clrw	x
      00A5CB 97               [ 1]  388 	ld	xl, a
      00A5CC 89               [ 2]  389 	pushw	x
      00A5CD 4B 86            [ 1]  390 	push	#<(__str_8+0)
      00A5CF 4B 89            [ 1]  391 	push	#((__str_8+0) >> 8)
      00A5D1 CD 9C 98         [ 4]  392 	call	_mib_printf
      00A5D4 5B 04            [ 2]  393 	addw	sp, #4
                                    394 ;	./../../mib/stm8s_mib_debug_mem.c: 168: break;
      00A5D6 20 38            [ 2]  395 	jra	00126$
                                    396 ;	./../../mib/stm8s_mib_debug_mem.c: 169: case 's':
      00A5D8                        397 00123$:
                                    398 ;	./../../mib/stm8s_mib_debug_mem.c: 170: s = rd_ADDR16(addr);
      00A5D8 1E 03            [ 2]  399 	ldw	x, (0x03, sp)
      00A5DA FE               [ 2]  400 	ldw	x, (x)
      00A5DB 1F 06            [ 2]  401 	ldw	(0x06, sp), x
                                    402 ;	./../../mib/stm8s_mib_debug_mem.c: 171: ccprintf(_DEBUG_CMD_A_,("0x%04x", s));
      00A5DD 89               [ 2]  403 	pushw	x
      00A5DE 4B 8E            [ 1]  404 	push	#<(__str_9+0)
      00A5E0 4B 89            [ 1]  405 	push	#((__str_9+0) >> 8)
      00A5E2 CD 9C 98         [ 4]  406 	call	_mib_printf
      00A5E5 5B 04            [ 2]  407 	addw	sp, #4
                                    408 ;	./../../mib/stm8s_mib_debug_mem.c: 172: break;
      00A5E7 20 27            [ 2]  409 	jra	00126$
                                    410 ;	./../../mib/stm8s_mib_debug_mem.c: 173: case 'l':
      00A5E9                        411 00124$:
                                    412 ;	./../../mib/stm8s_mib_debug_mem.c: 174: l = rd_ADDR32(addr);
      00A5E9 1E 03            [ 2]  413 	ldw	x, (0x03, sp)
      00A5EB 90 93            [ 1]  414 	ldw	y, x
      00A5ED 90 EE 02         [ 2]  415 	ldw	y, (0x2, y)
      00A5F0 FE               [ 2]  416 	ldw	x, (x)
      00A5F1 17 0A            [ 2]  417 	ldw	(0x0a, sp), y
      00A5F3 1F 08            [ 2]  418 	ldw	(0x08, sp), x
                                    419 ;	./../../mib/stm8s_mib_debug_mem.c: 175: ccprintf(_DEBUG_CMD_A_,("0x%08lx", l));
      00A5F5 90 89            [ 2]  420 	pushw	y
      00A5F7 89               [ 2]  421 	pushw	x
      00A5F8 4B 95            [ 1]  422 	push	#<(__str_10+0)
      00A5FA 4B 89            [ 1]  423 	push	#((__str_10+0) >> 8)
      00A5FC CD 9C 98         [ 4]  424 	call	_mib_printf
      00A5FF 5B 06            [ 2]  425 	addw	sp, #6
                                    426 ;	./../../mib/stm8s_mib_debug_mem.c: 176: break;
      00A601 20 0D            [ 2]  427 	jra	00126$
                                    428 ;	./../../mib/stm8s_mib_debug_mem.c: 177: default:
      00A603                        429 00125$:
                                    430 ;	./../../mib/stm8s_mib_debug_mem.c: 178: ccprintf(_DEBUG_CMD_A_, ("Error.\r\n"));
      00A603 4B 9D            [ 1]  431 	push	#<(__str_11+0)
      00A605 4B 89            [ 1]  432 	push	#((__str_11+0) >> 8)
      00A607 CD 9C 98         [ 4]  433 	call	_mib_printf
      00A60A 5B 02            [ 2]  434 	addw	sp, #2
                                    435 ;	./../../mib/stm8s_mib_debug_mem.c: 179: return FALSE;
      00A60C 5F               [ 1]  436 	clrw	x
      00A60D CC AB CB         [ 2]  437 	jp	00235$
                                    438 ;	./../../mib/stm8s_mib_debug_mem.c: 180: }
      00A610                        439 00126$:
                                    440 ;	./../../mib/stm8s_mib_debug_mem.c: 181: ccprintf(_DEBUG_CMD_A_, (".\r\n"));		
      00A610 4B A6            [ 1]  441 	push	#<(__str_12+0)
      00A612 4B 89            [ 1]  442 	push	#((__str_12+0) >> 8)
      00A614 CD 9C 98         [ 4]  443 	call	_mib_printf
      00A617 5B 02            [ 2]  444 	addw	sp, #2
      00A619 CC AB C9         [ 2]  445 	jp	00216$
      00A61C                        446 00212$:
                                    447 ;	./../../mib/stm8s_mib_debug_mem.c: 183: else if (!strcmp(argv[1], "wrn")) // _CMD_MY_WRITE_
      00A61C 1E 26            [ 2]  448 	ldw	x, (0x26, sp)
      00A61E FE               [ 2]  449 	ldw	x, (x)
      00A61F 4B AA            [ 1]  450 	push	#<(___str_13+0)
      00A621 4B 89            [ 1]  451 	push	#((___str_13+0) >> 8)
      00A623 CD B1 01         [ 4]  452 	call	_strcmp
      00A626 5D               [ 2]  453 	tnzw	x
      00A627 27 03            [ 1]  454 	jreq	00591$
      00A629 CC A7 B3         [ 2]  455 	jp	00209$
      00A62C                        456 00591$:
                                    457 ;	./../../mib/stm8s_mib_debug_mem.c: 186: if (argc < 6)
      00A62C 1E 2C            [ 2]  458 	ldw	x, (0x2c, sp)
      00A62E A3 00 06         [ 2]  459 	cpw	x, #0x0006
      00A631 2E 0B            [ 1]  460 	jrsge	00128$
                                    461 ;	./../../mib/stm8s_mib_debug_mem.c: 188: MibWriteDebugString(cptr->usage);
      00A633 1E 24            [ 2]  462 	ldw	x, (0x24, sp)
      00A635 EE 04            [ 2]  463 	ldw	x, (0x4, x)
      00A637 CD 92 86         [ 4]  464 	call	_MibWriteDebugString
                                    465 ;	./../../mib/stm8s_mib_debug_mem.c: 189: return FALSE;
      00A63A 5F               [ 1]  466 	clrw	x
      00A63B CC AB CB         [ 2]  467 	jp	00235$
      00A63E                        468 00128$:
                                    469 ;	./../../mib/stm8s_mib_debug_mem.c: 191: if (!HexToInt(argv[3], &addr, 32))
      00A63E 96               [ 1]  470 	ldw	x, sp
      00A63F 5C               [ 1]  471 	incw	x
      00A640 51               [ 1]  472 	exgw	x, y
      00A641 1E 2E            [ 2]  473 	ldw	x, (0x2e, sp)
      00A643 EE 06            [ 2]  474 	ldw	x, (0x6, x)
      00A645 4B 20            [ 1]  475 	push	#0x20
      00A647 4B 00            [ 1]  476 	push	#0x00
      00A649 90 89            [ 2]  477 	pushw	y
      00A64B CD 9F 99         [ 4]  478 	call	_HexToInt
      00A64E 5D               [ 2]  479 	tnzw	x
      00A64F 26 0D            [ 1]  480 	jrne	00130$
                                    481 ;	./../../mib/stm8s_mib_debug_mem.c: 193: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A651 4B 25            [ 1]  482 	push	#<(__str_3+0)
      00A653 4B 89            [ 1]  483 	push	#((__str_3+0) >> 8)
      00A655 CD 9C 98         [ 4]  484 	call	_mib_printf
      00A658 5B 02            [ 2]  485 	addw	sp, #2
                                    486 ;	./../../mib/stm8s_mib_debug_mem.c: 194: return FALSE;
      00A65A 5F               [ 1]  487 	clrw	x
      00A65B CC AB CB         [ 2]  488 	jp	00235$
      00A65E                        489 00130$:
                                    490 ;	./../../mib/stm8s_mib_debug_mem.c: 196: if (!HexToInt(argv[5], &v_Loop, 32))
      00A65E 96               [ 1]  491 	ldw	x, sp
      00A65F 1C 00 18         [ 2]  492 	addw	x, #24
      00A662 51               [ 1]  493 	exgw	x, y
      00A663 1E 2E            [ 2]  494 	ldw	x, (0x2e, sp)
      00A665 EE 0A            [ 2]  495 	ldw	x, (0xa, x)
      00A667 4B 20            [ 1]  496 	push	#0x20
      00A669 4B 00            [ 1]  497 	push	#0x00
      00A66B 90 89            [ 2]  498 	pushw	y
      00A66D CD 9F 99         [ 4]  499 	call	_HexToInt
      00A670 5D               [ 2]  500 	tnzw	x
      00A671 26 0D            [ 1]  501 	jrne	00132$
                                    502 ;	./../../mib/stm8s_mib_debug_mem.c: 198: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A673 4B 25            [ 1]  503 	push	#<(__str_3+0)
      00A675 4B 89            [ 1]  504 	push	#((__str_3+0) >> 8)
      00A677 CD 9C 98         [ 4]  505 	call	_mib_printf
      00A67A 5B 02            [ 2]  506 	addw	sp, #2
                                    507 ;	./../../mib/stm8s_mib_debug_mem.c: 199: return FALSE;
      00A67C 5F               [ 1]  508 	clrw	x
      00A67D CC AB CB         [ 2]  509 	jp	00235$
      00A680                        510 00132$:
                                    511 ;	./../../mib/stm8s_mib_debug_mem.c: 201: switch (argv[2][0])
      00A680 1E 2E            [ 2]  512 	ldw	x, (0x2e, sp)
      00A682 EE 04            [ 2]  513 	ldw	x, (0x4, x)
      00A684 F6               [ 1]  514 	ld	a, (x)
      00A685 A1 63            [ 1]  515 	cp	a, #0x63
      00A687 27 0E            [ 1]  516 	jreq	00133$
      00A689 A1 6C            [ 1]  517 	cp	a, #0x6c
      00A68B 26 03            [ 1]  518 	jrne	00599$
      00A68D CC A7 44         [ 2]  519 	jp	00141$
      00A690                        520 00599$:
      00A690 A1 73            [ 1]  521 	cp	a, #0x73
      00A692 27 55            [ 1]  522 	jreq	00137$
      00A694 CC A7 A3         [ 2]  523 	jp	00145$
                                    524 ;	./../../mib/stm8s_mib_debug_mem.c: 203: case 'c':
      00A697                        525 00133$:
                                    526 ;	./../../mib/stm8s_mib_debug_mem.c: 204: if (!HexToInt(argv[4], &c, 8))
      00A697 96               [ 1]  527 	ldw	x, sp
      00A698 1C 00 05         [ 2]  528 	addw	x, #5
      00A69B 16 2E            [ 2]  529 	ldw	y, (0x2e, sp)
      00A69D 90 EE 08         [ 2]  530 	ldw	y, (0x8, y)
      00A6A0 4B 08            [ 1]  531 	push	#0x08
      00A6A2 4B 00            [ 1]  532 	push	#0x00
      00A6A4 89               [ 2]  533 	pushw	x
      00A6A5 93               [ 1]  534 	ldw	x, y
      00A6A6 CD 9F 99         [ 4]  535 	call	_HexToInt
      00A6A9 5D               [ 2]  536 	tnzw	x
      00A6AA 26 0D            [ 1]  537 	jrne	00262$
                                    538 ;	./../../mib/stm8s_mib_debug_mem.c: 206: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A6AC 4B 25            [ 1]  539 	push	#<(__str_3+0)
      00A6AE 4B 89            [ 1]  540 	push	#((__str_3+0) >> 8)
      00A6B0 CD 9C 98         [ 4]  541 	call	_mib_printf
      00A6B3 5B 02            [ 2]  542 	addw	sp, #2
                                    543 ;	./../../mib/stm8s_mib_debug_mem.c: 207: return FALSE;
      00A6B5 5F               [ 1]  544 	clrw	x
      00A6B6 CC AB CB         [ 2]  545 	jp	00235$
      00A6B9                        546 00262$:
      00A6B9 16 1A            [ 2]  547 	ldw	y, (0x1a, sp)
      00A6BB 17 28            [ 2]  548 	ldw	(0x28, sp), y
      00A6BD 16 18            [ 2]  549 	ldw	y, (0x18, sp)
      00A6BF 17 26            [ 2]  550 	ldw	(0x26, sp), y
      00A6C1                        551 00218$:
                                    552 ;	./../../mib/stm8s_mib_debug_mem.c: 209: for (; v_Loop; v_Loop--) wr_ADDR8(addr, c);
      00A6C1 1E 28            [ 2]  553 	ldw	x, (0x28, sp)
      00A6C3 26 07            [ 1]  554 	jrne	00605$
      00A6C5 1E 26            [ 2]  555 	ldw	x, (0x26, sp)
      00A6C7 26 03            [ 1]  556 	jrne	00605$
      00A6C9 CC AB AD         [ 2]  557 	jp	00301$
      00A6CC                        558 00605$:
      00A6CC 1E 03            [ 2]  559 	ldw	x, (0x03, sp)
      00A6CE 7B 05            [ 1]  560 	ld	a, (0x05, sp)
      00A6D0 F7               [ 1]  561 	ld	(x), a
      00A6D1 1E 28            [ 2]  562 	ldw	x, (0x28, sp)
      00A6D3 1D 00 01         [ 2]  563 	subw	x, #0x0001
      00A6D6 1F 28            [ 2]  564 	ldw	(0x28, sp), x
      00A6D8 1E 26            [ 2]  565 	ldw	x, (0x26, sp)
      00A6DA 24 01            [ 1]  566 	jrnc	00606$
      00A6DC 5A               [ 2]  567 	decw	x
      00A6DD                        568 00606$:
      00A6DD 1F 26            [ 2]  569 	ldw	(0x26, sp), x
      00A6DF 16 28            [ 2]  570 	ldw	y, (0x28, sp)
      00A6E1 17 1A            [ 2]  571 	ldw	(0x1a, sp), y
      00A6E3 16 26            [ 2]  572 	ldw	y, (0x26, sp)
      00A6E5 17 18            [ 2]  573 	ldw	(0x18, sp), y
      00A6E7 20 D8            [ 2]  574 	jra	00218$
                                    575 ;	./../../mib/stm8s_mib_debug_mem.c: 211: case 's':
      00A6E9                        576 00137$:
                                    577 ;	./../../mib/stm8s_mib_debug_mem.c: 212: if (!HexToInt(argv[4], &s, 16))
      00A6E9 16 2E            [ 2]  578 	ldw	y, (0x2e, sp)
      00A6EB 17 26            [ 2]  579 	ldw	(0x26, sp), y
      00A6ED 93               [ 1]  580 	ldw	x, y
      00A6EE EE 08            [ 2]  581 	ldw	x, (0x8, x)
      00A6F0 1F 28            [ 2]  582 	ldw	(0x28, sp), x
      00A6F2 4B 10            [ 1]  583 	push	#0x10
      00A6F4 4B 00            [ 1]  584 	push	#0x00
      00A6F6 96               [ 1]  585 	ldw	x, sp
      00A6F7 1C 00 08         [ 2]  586 	addw	x, #8
      00A6FA 89               [ 2]  587 	pushw	x
      00A6FB 1E 2C            [ 2]  588 	ldw	x, (0x2c, sp)
      00A6FD CD 9F 99         [ 4]  589 	call	_HexToInt
      00A700 1F 28            [ 2]  590 	ldw	(0x28, sp), x
      00A702 26 0D            [ 1]  591 	jrne	00265$
                                    592 ;	./../../mib/stm8s_mib_debug_mem.c: 214: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A704 4B 25            [ 1]  593 	push	#<(__str_3+0)
      00A706 4B 89            [ 1]  594 	push	#((__str_3+0) >> 8)
      00A708 CD 9C 98         [ 4]  595 	call	_mib_printf
      00A70B 5B 02            [ 2]  596 	addw	sp, #2
                                    597 ;	./../../mib/stm8s_mib_debug_mem.c: 215: return FALSE;
      00A70D 5F               [ 1]  598 	clrw	x
      00A70E CC AB CB         [ 2]  599 	jp	00235$
      00A711                        600 00265$:
      00A711 16 1A            [ 2]  601 	ldw	y, (0x1a, sp)
      00A713 17 28            [ 2]  602 	ldw	(0x28, sp), y
      00A715 16 18            [ 2]  603 	ldw	y, (0x18, sp)
      00A717 17 26            [ 2]  604 	ldw	(0x26, sp), y
      00A719                        605 00221$:
                                    606 ;	./../../mib/stm8s_mib_debug_mem.c: 217: for (; v_Loop; v_Loop--) wr_ADDR16(addr, s);
      00A719 1E 28            [ 2]  607 	ldw	x, (0x28, sp)
      00A71B 26 07            [ 1]  608 	jrne	00608$
      00A71D 1E 26            [ 2]  609 	ldw	x, (0x26, sp)
      00A71F 26 03            [ 1]  610 	jrne	00608$
      00A721 CC AB B7         [ 2]  611 	jp	00302$
      00A724                        612 00608$:
      00A724 16 03            [ 2]  613 	ldw	y, (0x03, sp)
      00A726 17 22            [ 2]  614 	ldw	(0x22, sp), y
      00A728 93               [ 1]  615 	ldw	x, y
      00A729 16 06            [ 2]  616 	ldw	y, (0x06, sp)
      00A72B FF               [ 2]  617 	ldw	(x), y
      00A72C 1E 28            [ 2]  618 	ldw	x, (0x28, sp)
      00A72E 1D 00 01         [ 2]  619 	subw	x, #0x0001
      00A731 1F 28            [ 2]  620 	ldw	(0x28, sp), x
      00A733 1E 26            [ 2]  621 	ldw	x, (0x26, sp)
      00A735 24 01            [ 1]  622 	jrnc	00609$
      00A737 5A               [ 2]  623 	decw	x
      00A738                        624 00609$:
      00A738 1F 26            [ 2]  625 	ldw	(0x26, sp), x
      00A73A 16 28            [ 2]  626 	ldw	y, (0x28, sp)
      00A73C 17 1A            [ 2]  627 	ldw	(0x1a, sp), y
      00A73E 16 26            [ 2]  628 	ldw	y, (0x26, sp)
      00A740 17 18            [ 2]  629 	ldw	(0x18, sp), y
      00A742 20 D5            [ 2]  630 	jra	00221$
                                    631 ;	./../../mib/stm8s_mib_debug_mem.c: 219: case 'l':
      00A744                        632 00141$:
                                    633 ;	./../../mib/stm8s_mib_debug_mem.c: 220: if (!HexToInt(argv[4], &l, 32))
      00A744 16 2E            [ 2]  634 	ldw	y, (0x2e, sp)
      00A746 17 26            [ 2]  635 	ldw	(0x26, sp), y
      00A748 93               [ 1]  636 	ldw	x, y
      00A749 EE 08            [ 2]  637 	ldw	x, (0x8, x)
      00A74B 1F 28            [ 2]  638 	ldw	(0x28, sp), x
      00A74D 4B 20            [ 1]  639 	push	#0x20
      00A74F 4B 00            [ 1]  640 	push	#0x00
      00A751 96               [ 1]  641 	ldw	x, sp
      00A752 1C 00 0A         [ 2]  642 	addw	x, #10
      00A755 89               [ 2]  643 	pushw	x
      00A756 1E 2C            [ 2]  644 	ldw	x, (0x2c, sp)
      00A758 CD 9F 99         [ 4]  645 	call	_HexToInt
      00A75B 1F 28            [ 2]  646 	ldw	(0x28, sp), x
      00A75D 26 0D            [ 1]  647 	jrne	00268$
                                    648 ;	./../../mib/stm8s_mib_debug_mem.c: 222: ccprintf(_DEBUG_CMD_A_, ("Illugal character is useqd.\r\n"));
      00A75F 4B 42            [ 1]  649 	push	#<(__str_4+0)
      00A761 4B 89            [ 1]  650 	push	#((__str_4+0) >> 8)
      00A763 CD 9C 98         [ 4]  651 	call	_mib_printf
      00A766 5B 02            [ 2]  652 	addw	sp, #2
                                    653 ;	./../../mib/stm8s_mib_debug_mem.c: 223: return FALSE;
      00A768 5F               [ 1]  654 	clrw	x
      00A769 CC AB CB         [ 2]  655 	jp	00235$
      00A76C                        656 00268$:
      00A76C 16 1A            [ 2]  657 	ldw	y, (0x1a, sp)
      00A76E 17 28            [ 2]  658 	ldw	(0x28, sp), y
      00A770 16 18            [ 2]  659 	ldw	y, (0x18, sp)
      00A772 17 26            [ 2]  660 	ldw	(0x26, sp), y
      00A774                        661 00224$:
                                    662 ;	./../../mib/stm8s_mib_debug_mem.c: 225: for (; v_Loop; v_Loop--) wr_ADDR32(addr, l);
      00A774 1E 28            [ 2]  663 	ldw	x, (0x28, sp)
      00A776 26 07            [ 1]  664 	jrne	00611$
      00A778 1E 26            [ 2]  665 	ldw	x, (0x26, sp)
      00A77A 26 03            [ 1]  666 	jrne	00611$
      00A77C CC AB C1         [ 2]  667 	jp	00303$
      00A77F                        668 00611$:
      00A77F 16 03            [ 2]  669 	ldw	y, (0x03, sp)
      00A781 17 22            [ 2]  670 	ldw	(0x22, sp), y
      00A783 93               [ 1]  671 	ldw	x, y
      00A784 16 0A            [ 2]  672 	ldw	y, (0x0a, sp)
      00A786 EF 02            [ 2]  673 	ldw	(0x2, x), y
      00A788 16 08            [ 2]  674 	ldw	y, (0x08, sp)
      00A78A FF               [ 2]  675 	ldw	(x), y
      00A78B 1E 28            [ 2]  676 	ldw	x, (0x28, sp)
      00A78D 1D 00 01         [ 2]  677 	subw	x, #0x0001
      00A790 1F 28            [ 2]  678 	ldw	(0x28, sp), x
      00A792 1E 26            [ 2]  679 	ldw	x, (0x26, sp)
      00A794 24 01            [ 1]  680 	jrnc	00612$
      00A796 5A               [ 2]  681 	decw	x
      00A797                        682 00612$:
      00A797 1F 26            [ 2]  683 	ldw	(0x26, sp), x
      00A799 16 28            [ 2]  684 	ldw	y, (0x28, sp)
      00A79B 17 1A            [ 2]  685 	ldw	(0x1a, sp), y
      00A79D 16 26            [ 2]  686 	ldw	y, (0x26, sp)
      00A79F 17 18            [ 2]  687 	ldw	(0x18, sp), y
      00A7A1 20 D1            [ 2]  688 	jra	00224$
                                    689 ;	./../../mib/stm8s_mib_debug_mem.c: 227: default:
      00A7A3                        690 00145$:
                                    691 ;	./../../mib/stm8s_mib_debug_mem.c: 228: MibWriteDebugString(cptr->usage);
      00A7A3 16 24            [ 2]  692 	ldw	y, (0x24, sp)
      00A7A5 17 26            [ 2]  693 	ldw	(0x26, sp), y
      00A7A7 93               [ 1]  694 	ldw	x, y
      00A7A8 EE 04            [ 2]  695 	ldw	x, (0x4, x)
      00A7AA 1F 28            [ 2]  696 	ldw	(0x28, sp), x
      00A7AC CD 92 86         [ 4]  697 	call	_MibWriteDebugString
                                    698 ;	./../../mib/stm8s_mib_debug_mem.c: 229: return FALSE;
      00A7AF 5F               [ 1]  699 	clrw	x
      00A7B0 CC AB CB         [ 2]  700 	jp	00235$
                                    701 ;	./../../mib/stm8s_mib_debug_mem.c: 230: }	
      00A7B3                        702 00209$:
                                    703 ;	./../../mib/stm8s_mib_debug_mem.c: 232: else if (!strcmp(argv[1], "rdn")) // _CMD_MY_READ_
      00A7B3 1E 26            [ 2]  704 	ldw	x, (0x26, sp)
      00A7B5 FE               [ 2]  705 	ldw	x, (x)
      00A7B6 1F 28            [ 2]  706 	ldw	(0x28, sp), x
      00A7B8 4B AE            [ 1]  707 	push	#<(___str_14+0)
      00A7BA 4B 89            [ 1]  708 	push	#((___str_14+0) >> 8)
      00A7BC 1E 2A            [ 2]  709 	ldw	x, (0x2a, sp)
      00A7BE CD B1 01         [ 4]  710 	call	_strcmp
      00A7C1 1F 28            [ 2]  711 	ldw	(0x28, sp), x
      00A7C3 27 03            [ 1]  712 	jreq	00613$
      00A7C5 CC A9 A6         [ 2]  713 	jp	00206$
      00A7C8                        714 00613$:
                                    715 ;	./../../mib/stm8s_mib_debug_mem.c: 235: if (argc < 5)
      00A7C8 1E 2C            [ 2]  716 	ldw	x, (0x2c, sp)
      00A7CA A3 00 05         [ 2]  717 	cpw	x, #0x0005
      00A7CD 2E 10            [ 1]  718 	jrsge	00148$
                                    719 ;	./../../mib/stm8s_mib_debug_mem.c: 237: MibWriteDebugString(cptr->usage);
      00A7CF 16 24            [ 2]  720 	ldw	y, (0x24, sp)
      00A7D1 17 26            [ 2]  721 	ldw	(0x26, sp), y
      00A7D3 93               [ 1]  722 	ldw	x, y
      00A7D4 EE 04            [ 2]  723 	ldw	x, (0x4, x)
      00A7D6 1F 28            [ 2]  724 	ldw	(0x28, sp), x
      00A7D8 CD 92 86         [ 4]  725 	call	_MibWriteDebugString
                                    726 ;	./../../mib/stm8s_mib_debug_mem.c: 238: return FALSE;
      00A7DB 5F               [ 1]  727 	clrw	x
      00A7DC CC AB CB         [ 2]  728 	jp	00235$
      00A7DF                        729 00148$:
                                    730 ;	./../../mib/stm8s_mib_debug_mem.c: 240: if (!HexToInt(argv[3], &addr, 32))
      00A7DF 16 2E            [ 2]  731 	ldw	y, (0x2e, sp)
      00A7E1 17 26            [ 2]  732 	ldw	(0x26, sp), y
      00A7E3 93               [ 1]  733 	ldw	x, y
      00A7E4 EE 06            [ 2]  734 	ldw	x, (0x6, x)
      00A7E6 1F 28            [ 2]  735 	ldw	(0x28, sp), x
      00A7E8 4B 20            [ 1]  736 	push	#0x20
      00A7EA 4B 00            [ 1]  737 	push	#0x00
      00A7EC 96               [ 1]  738 	ldw	x, sp
      00A7ED 1C 00 03         [ 2]  739 	addw	x, #3
      00A7F0 89               [ 2]  740 	pushw	x
      00A7F1 1E 2C            [ 2]  741 	ldw	x, (0x2c, sp)
      00A7F3 CD 9F 99         [ 4]  742 	call	_HexToInt
      00A7F6 1F 28            [ 2]  743 	ldw	(0x28, sp), x
      00A7F8 26 0D            [ 1]  744 	jrne	00150$
                                    745 ;	./../../mib/stm8s_mib_debug_mem.c: 242: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A7FA 4B 25            [ 1]  746 	push	#<(__str_3+0)
      00A7FC 4B 89            [ 1]  747 	push	#((__str_3+0) >> 8)
      00A7FE CD 9C 98         [ 4]  748 	call	_mib_printf
      00A801 5B 02            [ 2]  749 	addw	sp, #2
                                    750 ;	./../../mib/stm8s_mib_debug_mem.c: 243: return FALSE;
      00A803 5F               [ 1]  751 	clrw	x
      00A804 CC AB CB         [ 2]  752 	jp	00235$
      00A807                        753 00150$:
                                    754 ;	./../../mib/stm8s_mib_debug_mem.c: 245: if (!HexToInt(argv[4], &v_Loop, 32))
      00A807 16 2E            [ 2]  755 	ldw	y, (0x2e, sp)
      00A809 17 26            [ 2]  756 	ldw	(0x26, sp), y
      00A80B 93               [ 1]  757 	ldw	x, y
      00A80C EE 08            [ 2]  758 	ldw	x, (0x8, x)
      00A80E 1F 28            [ 2]  759 	ldw	(0x28, sp), x
      00A810 4B 20            [ 1]  760 	push	#0x20
      00A812 4B 00            [ 1]  761 	push	#0x00
      00A814 96               [ 1]  762 	ldw	x, sp
      00A815 1C 00 1A         [ 2]  763 	addw	x, #26
      00A818 89               [ 2]  764 	pushw	x
      00A819 1E 2C            [ 2]  765 	ldw	x, (0x2c, sp)
      00A81B CD 9F 99         [ 4]  766 	call	_HexToInt
      00A81E 1F 28            [ 2]  767 	ldw	(0x28, sp), x
      00A820 26 0D            [ 1]  768 	jrne	00152$
                                    769 ;	./../../mib/stm8s_mib_debug_mem.c: 247: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A822 4B 25            [ 1]  770 	push	#<(__str_3+0)
      00A824 4B 89            [ 1]  771 	push	#((__str_3+0) >> 8)
      00A826 CD 9C 98         [ 4]  772 	call	_mib_printf
      00A829 5B 02            [ 2]  773 	addw	sp, #2
                                    774 ;	./../../mib/stm8s_mib_debug_mem.c: 248: return FALSE;
      00A82B 5F               [ 1]  775 	clrw	x
      00A82C CC AB CB         [ 2]  776 	jp	00235$
      00A82F                        777 00152$:
                                    778 ;	./../../mib/stm8s_mib_debug_mem.c: 250: ccprintf(_DEBUG_CMD_A_,("\taddress : 0x%08lx  ", addr));
      00A82F 1E 03            [ 2]  779 	ldw	x, (0x03, sp)
      00A831 89               [ 2]  780 	pushw	x
      00A832 1E 03            [ 2]  781 	ldw	x, (0x03, sp)
      00A834 89               [ 2]  782 	pushw	x
      00A835 4B 65            [ 1]  783 	push	#<(__str_6+0)
      00A837 4B 89            [ 1]  784 	push	#((__str_6+0) >> 8)
      00A839 CD 9C 98         [ 4]  785 	call	_mib_printf
      00A83C 5B 06            [ 2]  786 	addw	sp, #6
                                    787 ;	./../../mib/stm8s_mib_debug_mem.c: 251: ccprintf(_DEBUG_CMD_A_,("loop : 0x%08lx  \r\n", v_Loop));
      00A83E 1E 1A            [ 2]  788 	ldw	x, (0x1a, sp)
      00A840 89               [ 2]  789 	pushw	x
      00A841 1E 1A            [ 2]  790 	ldw	x, (0x1a, sp)
      00A843 89               [ 2]  791 	pushw	x
      00A844 4B B2            [ 1]  792 	push	#<(__str_15+0)
      00A846 4B 89            [ 1]  793 	push	#((__str_15+0) >> 8)
      00A848 CD 9C 98         [ 4]  794 	call	_mib_printf
      00A84B 5B 06            [ 2]  795 	addw	sp, #6
                                    796 ;	./../../mib/stm8s_mib_debug_mem.c: 252: ccprintf(_DEBUG_CMD_A_, ("value   : "));
      00A84D 4B C5            [ 1]  797 	push	#<(__str_16+0)
      00A84F 4B 89            [ 1]  798 	push	#((__str_16+0) >> 8)
      00A851 CD 9C 98         [ 4]  799 	call	_mib_printf
      00A854 5B 02            [ 2]  800 	addw	sp, #2
                                    801 ;	./../../mib/stm8s_mib_debug_mem.c: 253: switch (argv[2][0])
      00A856 16 2E            [ 2]  802 	ldw	y, (0x2e, sp)
      00A858 17 26            [ 2]  803 	ldw	(0x26, sp), y
      00A85A 93               [ 1]  804 	ldw	x, y
      00A85B EE 04            [ 2]  805 	ldw	x, (0x4, x)
      00A85D 1F 28            [ 2]  806 	ldw	(0x28, sp), x
      00A85F F6               [ 1]  807 	ld	a, (x)
      00A860 A1 63            [ 1]  808 	cp	a, #0x63
      00A862 27 0E            [ 1]  809 	jreq	00278$
      00A864 A1 6C            [ 1]  810 	cp	a, #0x6c
      00A866 26 03            [ 1]  811 	jrne	00621$
      00A868 CC A9 17         [ 2]  812 	jp	00284$
      00A86B                        813 00621$:
      00A86B A1 73            [ 1]  814 	cp	a, #0x73
      00A86D 27 59            [ 1]  815 	jreq	00281$
      00A86F CC A9 71         [ 2]  816 	jp	00165$
                                    817 ;	./../../mib/stm8s_mib_debug_mem.c: 255: case 'c':
      00A872                        818 00278$:
      00A872 16 1A            [ 2]  819 	ldw	y, (0x1a, sp)
      00A874 17 28            [ 2]  820 	ldw	(0x28, sp), y
      00A876 16 18            [ 2]  821 	ldw	y, (0x18, sp)
      00A878 17 26            [ 2]  822 	ldw	(0x26, sp), y
      00A87A                        823 00227$:
                                    824 ;	./../../mib/stm8s_mib_debug_mem.c: 256: for (; v_Loop; v_Loop--)
      00A87A 1E 28            [ 2]  825 	ldw	x, (0x28, sp)
      00A87C 26 07            [ 1]  826 	jrne	00626$
      00A87E 1E 26            [ 2]  827 	ldw	x, (0x26, sp)
      00A880 26 03            [ 1]  828 	jrne	00626$
      00A882 CC A9 7E         [ 2]  829 	jp	00304$
      00A885                        830 00626$:
                                    831 ;	./../../mib/stm8s_mib_debug_mem.c: 258: c = rd_ADDR8(addr);
      00A885 16 03            [ 2]  832 	ldw	y, (0x03, sp)
      00A887 17 22            [ 2]  833 	ldw	(0x22, sp), y
      00A889 93               [ 1]  834 	ldw	x, y
      00A88A F6               [ 1]  835 	ld	a, (x)
      00A88B 6B 1F            [ 1]  836 	ld	(0x1f, sp), a
      00A88D 6B 05            [ 1]  837 	ld	(0x05, sp), a
                                    838 ;	./../../mib/stm8s_mib_debug_mem.c: 259: if ((v_Loop & 0xfffff) == 0)
      00A88F 16 28            [ 2]  839 	ldw	y, (0x28, sp)
      00A891 17 22            [ 2]  840 	ldw	(0x22, sp), y
      00A893 7B 27            [ 1]  841 	ld	a, (0x27, sp)
      00A895 A4 0F            [ 1]  842 	and	a, #0x0f
      00A897 6B 21            [ 1]  843 	ld	(0x21, sp), a
      00A899 0F 20            [ 1]  844 	clr	(0x20, sp)
      00A89B 1E 22            [ 2]  845 	ldw	x, (0x22, sp)
      00A89D 26 11            [ 1]  846 	jrne	00228$
                                    847 ;	./../../mib/stm8s_mib_debug_mem.c: 261: ccprintf(_DEBUG_CMD_A_,("0x%02x ", c));
      00A89F 1E 20            [ 2]  848 	ldw	x, (0x20, sp)
      00A8A1 26 0D            [ 1]  849 	jrne	00228$
      00A8A3 7B 1F            [ 1]  850 	ld	a, (0x1f, sp)
      00A8A5 97               [ 1]  851 	ld	xl, a
      00A8A6 89               [ 2]  852 	pushw	x
      00A8A7 4B 86            [ 1]  853 	push	#<(__str_8+0)
      00A8A9 4B 89            [ 1]  854 	push	#((__str_8+0) >> 8)
      00A8AB CD 9C 98         [ 4]  855 	call	_mib_printf
      00A8AE 5B 04            [ 2]  856 	addw	sp, #4
      00A8B0                        857 00228$:
                                    858 ;	./../../mib/stm8s_mib_debug_mem.c: 256: for (; v_Loop; v_Loop--)
      00A8B0 1E 28            [ 2]  859 	ldw	x, (0x28, sp)
      00A8B2 1D 00 01         [ 2]  860 	subw	x, #0x0001
      00A8B5 1F 28            [ 2]  861 	ldw	(0x28, sp), x
      00A8B7 1E 26            [ 2]  862 	ldw	x, (0x26, sp)
      00A8B9 24 01            [ 1]  863 	jrnc	00629$
      00A8BB 5A               [ 2]  864 	decw	x
      00A8BC                        865 00629$:
      00A8BC 1F 26            [ 2]  866 	ldw	(0x26, sp), x
      00A8BE 16 28            [ 2]  867 	ldw	y, (0x28, sp)
      00A8C0 17 1A            [ 2]  868 	ldw	(0x1a, sp), y
      00A8C2 16 26            [ 2]  869 	ldw	y, (0x26, sp)
      00A8C4 17 18            [ 2]  870 	ldw	(0x18, sp), y
      00A8C6 20 B2            [ 2]  871 	jra	00227$
                                    872 ;	./../../mib/stm8s_mib_debug_mem.c: 265: case 's':
      00A8C8                        873 00281$:
      00A8C8 16 1A            [ 2]  874 	ldw	y, (0x1a, sp)
      00A8CA 17 28            [ 2]  875 	ldw	(0x28, sp), y
      00A8CC 16 18            [ 2]  876 	ldw	y, (0x18, sp)
      00A8CE 17 26            [ 2]  877 	ldw	(0x26, sp), y
      00A8D0                        878 00230$:
                                    879 ;	./../../mib/stm8s_mib_debug_mem.c: 266: for (; v_Loop; v_Loop--)
      00A8D0 1E 28            [ 2]  880 	ldw	x, (0x28, sp)
      00A8D2 26 07            [ 1]  881 	jrne	00630$
      00A8D4 1E 26            [ 2]  882 	ldw	x, (0x26, sp)
      00A8D6 26 03            [ 1]  883 	jrne	00630$
      00A8D8 CC A9 88         [ 2]  884 	jp	00305$
      00A8DB                        885 00630$:
                                    886 ;	./../../mib/stm8s_mib_debug_mem.c: 268: s = rd_ADDR16(addr);
      00A8DB 1E 03            [ 2]  887 	ldw	x, (0x03, sp)
      00A8DD FE               [ 2]  888 	ldw	x, (x)
      00A8DE 1F 1E            [ 2]  889 	ldw	(0x1e, sp), x
      00A8E0 1F 06            [ 2]  890 	ldw	(0x06, sp), x
                                    891 ;	./../../mib/stm8s_mib_debug_mem.c: 269: if ((v_Loop & 0xfffff) == 0)
      00A8E2 16 28            [ 2]  892 	ldw	y, (0x28, sp)
      00A8E4 17 22            [ 2]  893 	ldw	(0x22, sp), y
      00A8E6 5F               [ 1]  894 	clrw	x
      00A8E7 7B 27            [ 1]  895 	ld	a, (0x27, sp)
      00A8E9 A4 0F            [ 1]  896 	and	a, #0x0f
      00A8EB 97               [ 1]  897 	ld	xl, a
      00A8EC 16 22            [ 2]  898 	ldw	y, (0x22, sp)
      00A8EE 26 0F            [ 1]  899 	jrne	00231$
      00A8F0 5D               [ 2]  900 	tnzw	x
      00A8F1 26 0C            [ 1]  901 	jrne	00231$
                                    902 ;	./../../mib/stm8s_mib_debug_mem.c: 271: ccprintf(_DEBUG_CMD_A_,("0x%04x ", s));
      00A8F3 1E 1E            [ 2]  903 	ldw	x, (0x1e, sp)
      00A8F5 89               [ 2]  904 	pushw	x
      00A8F6 4B D0            [ 1]  905 	push	#<(__str_17+0)
      00A8F8 4B 89            [ 1]  906 	push	#((__str_17+0) >> 8)
      00A8FA CD 9C 98         [ 4]  907 	call	_mib_printf
      00A8FD 5B 04            [ 2]  908 	addw	sp, #4
      00A8FF                        909 00231$:
                                    910 ;	./../../mib/stm8s_mib_debug_mem.c: 266: for (; v_Loop; v_Loop--)
      00A8FF 1E 28            [ 2]  911 	ldw	x, (0x28, sp)
      00A901 1D 00 01         [ 2]  912 	subw	x, #0x0001
      00A904 1F 28            [ 2]  913 	ldw	(0x28, sp), x
      00A906 1E 26            [ 2]  914 	ldw	x, (0x26, sp)
      00A908 24 01            [ 1]  915 	jrnc	00633$
      00A90A 5A               [ 2]  916 	decw	x
      00A90B                        917 00633$:
      00A90B 1F 26            [ 2]  918 	ldw	(0x26, sp), x
      00A90D 16 28            [ 2]  919 	ldw	y, (0x28, sp)
      00A90F 17 1A            [ 2]  920 	ldw	(0x1a, sp), y
      00A911 16 26            [ 2]  921 	ldw	y, (0x26, sp)
      00A913 17 18            [ 2]  922 	ldw	(0x18, sp), y
      00A915 20 B9            [ 2]  923 	jra	00230$
                                    924 ;	./../../mib/stm8s_mib_debug_mem.c: 275: case 'l':
      00A917                        925 00284$:
      00A917 16 1A            [ 2]  926 	ldw	y, (0x1a, sp)
      00A919 17 28            [ 2]  927 	ldw	(0x28, sp), y
      00A91B 16 18            [ 2]  928 	ldw	y, (0x18, sp)
      00A91D 17 26            [ 2]  929 	ldw	(0x26, sp), y
      00A91F                        930 00233$:
                                    931 ;	./../../mib/stm8s_mib_debug_mem.c: 276: for (; v_Loop; v_Loop--)
      00A91F 1E 28            [ 2]  932 	ldw	x, (0x28, sp)
      00A921 26 04            [ 1]  933 	jrne	00634$
      00A923 1E 26            [ 2]  934 	ldw	x, (0x26, sp)
      00A925 27 6B            [ 1]  935 	jreq	00306$
      00A927                        936 00634$:
                                    937 ;	./../../mib/stm8s_mib_debug_mem.c: 278: l = rd_ADDR32(addr);
      00A927 1E 03            [ 2]  938 	ldw	x, (0x03, sp)
      00A929 90 93            [ 1]  939 	ldw	y, x
      00A92B 90 EE 02         [ 2]  940 	ldw	y, (0x2, y)
      00A92E FE               [ 2]  941 	ldw	x, (x)
      00A92F 1F 1C            [ 2]  942 	ldw	(0x1c, sp), x
      00A931 17 0A            [ 2]  943 	ldw	(0x0a, sp), y
      00A933 1E 1C            [ 2]  944 	ldw	x, (0x1c, sp)
      00A935 1F 08            [ 2]  945 	ldw	(0x08, sp), x
                                    946 ;	./../../mib/stm8s_mib_debug_mem.c: 279: if ((v_Loop & 0xfffff) == 0)
      00A937 1E 28            [ 2]  947 	ldw	x, (0x28, sp)
      00A939 1F 22            [ 2]  948 	ldw	(0x22, sp), x
      00A93B 7B 27            [ 1]  949 	ld	a, (0x27, sp)
      00A93D A4 0F            [ 1]  950 	and	a, #0x0f
      00A93F 6B 21            [ 1]  951 	ld	(0x21, sp), a
      00A941 0F 20            [ 1]  952 	clr	(0x20, sp)
      00A943 1E 22            [ 2]  953 	ldw	x, (0x22, sp)
      00A945 26 12            [ 1]  954 	jrne	00234$
      00A947 1E 20            [ 2]  955 	ldw	x, (0x20, sp)
      00A949 26 0E            [ 1]  956 	jrne	00234$
                                    957 ;	./../../mib/stm8s_mib_debug_mem.c: 281: ccprintf(_DEBUG_CMD_A_,("0x%08lx ", l));
      00A94B 90 89            [ 2]  958 	pushw	y
      00A94D 1E 1E            [ 2]  959 	ldw	x, (0x1e, sp)
      00A94F 89               [ 2]  960 	pushw	x
      00A950 4B D8            [ 1]  961 	push	#<(__str_18+0)
      00A952 4B 89            [ 1]  962 	push	#((__str_18+0) >> 8)
      00A954 CD 9C 98         [ 4]  963 	call	_mib_printf
      00A957 5B 06            [ 2]  964 	addw	sp, #6
      00A959                        965 00234$:
                                    966 ;	./../../mib/stm8s_mib_debug_mem.c: 276: for (; v_Loop; v_Loop--)
      00A959 1E 28            [ 2]  967 	ldw	x, (0x28, sp)
      00A95B 1D 00 01         [ 2]  968 	subw	x, #0x0001
      00A95E 1F 28            [ 2]  969 	ldw	(0x28, sp), x
      00A960 1E 26            [ 2]  970 	ldw	x, (0x26, sp)
      00A962 24 01            [ 1]  971 	jrnc	00637$
      00A964 5A               [ 2]  972 	decw	x
      00A965                        973 00637$:
      00A965 1F 26            [ 2]  974 	ldw	(0x26, sp), x
      00A967 16 28            [ 2]  975 	ldw	y, (0x28, sp)
      00A969 17 1A            [ 2]  976 	ldw	(0x1a, sp), y
      00A96B 16 26            [ 2]  977 	ldw	y, (0x26, sp)
      00A96D 17 18            [ 2]  978 	ldw	(0x18, sp), y
      00A96F 20 AE            [ 2]  979 	jra	00233$
                                    980 ;	./../../mib/stm8s_mib_debug_mem.c: 285: default:
      00A971                        981 00165$:
                                    982 ;	./../../mib/stm8s_mib_debug_mem.c: 286: ccprintf(_DEBUG_CMD_A_, ("Error.\r\n"));
      00A971 4B 9D            [ 1]  983 	push	#<(__str_11+0)
      00A973 4B 89            [ 1]  984 	push	#((__str_11+0) >> 8)
      00A975 CD 9C 98         [ 4]  985 	call	_mib_printf
      00A978 5B 02            [ 2]  986 	addw	sp, #2
                                    987 ;	./../../mib/stm8s_mib_debug_mem.c: 287: return FALSE;
      00A97A 5F               [ 1]  988 	clrw	x
      00A97B CC AB CB         [ 2]  989 	jp	00235$
                                    990 ;	./../../mib/stm8s_mib_debug_mem.c: 288: }
      00A97E                        991 00304$:
      00A97E 16 28            [ 2]  992 	ldw	y, (0x28, sp)
      00A980 17 1A            [ 2]  993 	ldw	(0x1a, sp), y
      00A982 16 26            [ 2]  994 	ldw	y, (0x26, sp)
      00A984 17 18            [ 2]  995 	ldw	(0x18, sp), y
                                    996 ;	./../../mib/stm8s_mib_debug_mem.c: 352: return FALSE;
      00A986 20 12            [ 2]  997 	jra	00166$
                                    998 ;	./../../mib/stm8s_mib_debug_mem.c: 288: }
      00A988                        999 00305$:
      00A988 16 28            [ 2] 1000 	ldw	y, (0x28, sp)
      00A98A 17 1A            [ 2] 1001 	ldw	(0x1a, sp), y
      00A98C 16 26            [ 2] 1002 	ldw	y, (0x26, sp)
      00A98E 17 18            [ 2] 1003 	ldw	(0x18, sp), y
                                   1004 ;	./../../mib/stm8s_mib_debug_mem.c: 352: return FALSE;
      00A990 20 08            [ 2] 1005 	jra	00166$
                                   1006 ;	./../../mib/stm8s_mib_debug_mem.c: 288: }
      00A992                       1007 00306$:
      00A992 16 28            [ 2] 1008 	ldw	y, (0x28, sp)
      00A994 17 1A            [ 2] 1009 	ldw	(0x1a, sp), y
      00A996 16 26            [ 2] 1010 	ldw	y, (0x26, sp)
      00A998 17 18            [ 2] 1011 	ldw	(0x18, sp), y
      00A99A                       1012 00166$:
                                   1013 ;	./../../mib/stm8s_mib_debug_mem.c: 289: ccprintf(_DEBUG_CMD_A_, (".\r\n"));
      00A99A 4B A6            [ 1] 1014 	push	#<(__str_12+0)
      00A99C 4B 89            [ 1] 1015 	push	#((__str_12+0) >> 8)
      00A99E CD 9C 98         [ 4] 1016 	call	_mib_printf
      00A9A1 5B 02            [ 2] 1017 	addw	sp, #2
      00A9A3 CC AB C9         [ 2] 1018 	jp	00216$
      00A9A6                       1019 00206$:
                                   1020 ;	./../../mib/stm8s_mib_debug_mem.c: 291: else if (!strcmp(argv[1], "hdump")) 	// _CMD_MY_HEXDUMP_
      00A9A6 1E 26            [ 2] 1021 	ldw	x, (0x26, sp)
      00A9A8 FE               [ 2] 1022 	ldw	x, (x)
      00A9A9 4B E1            [ 1] 1023 	push	#<(___str_19+0)
      00A9AB 4B 89            [ 1] 1024 	push	#((___str_19+0) >> 8)
      00A9AD CD B1 01         [ 4] 1025 	call	_strcmp
      00A9B0 5D               [ 2] 1026 	tnzw	x
      00A9B1 26 5B            [ 1] 1027 	jrne	00203$
                                   1028 ;	./../../mib/stm8s_mib_debug_mem.c: 293: if (argc < 4)
      00A9B3 1E 2C            [ 2] 1029 	ldw	x, (0x2c, sp)
      00A9B5 A3 00 04         [ 2] 1030 	cpw	x, #0x0004
      00A9B8 2E 0B            [ 1] 1031 	jrsge	00168$
                                   1032 ;	./../../mib/stm8s_mib_debug_mem.c: 295: MibWriteDebugString(cptr->usage);
      00A9BA 1E 24            [ 2] 1033 	ldw	x, (0x24, sp)
      00A9BC EE 04            [ 2] 1034 	ldw	x, (0x4, x)
      00A9BE CD 92 86         [ 4] 1035 	call	_MibWriteDebugString
                                   1036 ;	./../../mib/stm8s_mib_debug_mem.c: 296: return FALSE;
      00A9C1 5F               [ 1] 1037 	clrw	x
      00A9C2 CC AB CB         [ 2] 1038 	jp	00235$
      00A9C5                       1039 00168$:
                                   1040 ;	./../../mib/stm8s_mib_debug_mem.c: 298: if (!HexToInt(argv[2], &addr, 32) || !HexToInt(argv[3], &len, 32))
      00A9C5 16 2E            [ 2] 1041 	ldw	y, (0x2e, sp)
      00A9C7 90 EE 04         [ 2] 1042 	ldw	y, (0x4, y)
      00A9CA 4B 20            [ 1] 1043 	push	#0x20
      00A9CC 4B 00            [ 1] 1044 	push	#0x00
      00A9CE 96               [ 1] 1045 	ldw	x, sp
      00A9CF 1C 00 03         [ 2] 1046 	addw	x, #3
      00A9D2 89               [ 2] 1047 	pushw	x
      00A9D3 93               [ 1] 1048 	ldw	x, y
      00A9D4 CD 9F 99         [ 4] 1049 	call	_HexToInt
      00A9D7 5D               [ 2] 1050 	tnzw	x
      00A9D8 27 15            [ 1] 1051 	jreq	00169$
      00A9DA 16 2E            [ 2] 1052 	ldw	y, (0x2e, sp)
      00A9DC 90 EE 06         [ 2] 1053 	ldw	y, (0x6, y)
      00A9DF 4B 20            [ 1] 1054 	push	#0x20
      00A9E1 4B 00            [ 1] 1055 	push	#0x00
      00A9E3 96               [ 1] 1056 	ldw	x, sp
      00A9E4 1C 00 16         [ 2] 1057 	addw	x, #22
      00A9E7 89               [ 2] 1058 	pushw	x
      00A9E8 93               [ 1] 1059 	ldw	x, y
      00A9E9 CD 9F 99         [ 4] 1060 	call	_HexToInt
      00A9EC 5D               [ 2] 1061 	tnzw	x
      00A9ED 26 0D            [ 1] 1062 	jrne	00170$
      00A9EF                       1063 00169$:
                                   1064 ;	./../../mib/stm8s_mib_debug_mem.c: 300: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A9EF 4B 25            [ 1] 1065 	push	#<(__str_3+0)
      00A9F1 4B 89            [ 1] 1066 	push	#((__str_3+0) >> 8)
      00A9F3 CD 9C 98         [ 4] 1067 	call	_mib_printf
      00A9F6 5B 02            [ 2] 1068 	addw	sp, #2
                                   1069 ;	./../../mib/stm8s_mib_debug_mem.c: 301: return FALSE;
      00A9F8 5F               [ 1] 1070 	clrw	x
      00A9F9 CC AB CB         [ 2] 1071 	jp	00235$
      00A9FC                       1072 00170$:
                                   1073 ;	./../../mib/stm8s_mib_debug_mem.c: 303: HexDump(addr, len);		
      00A9FC 1E 16            [ 2] 1074 	ldw	x, (0x16, sp)
      00A9FE 89               [ 2] 1075 	pushw	x
      00A9FF 1E 16            [ 2] 1076 	ldw	x, (0x16, sp)
      00AA01 89               [ 2] 1077 	pushw	x
      00AA02 1E 07            [ 2] 1078 	ldw	x, (0x07, sp)
      00AA04 89               [ 2] 1079 	pushw	x
      00AA05 1E 07            [ 2] 1080 	ldw	x, (0x07, sp)
      00AA07 89               [ 2] 1081 	pushw	x
      00AA08 CD A1 0D         [ 4] 1082 	call	_HexDump
      00AA0B CC AB C9         [ 2] 1083 	jp	00216$
      00AA0E                       1084 00203$:
                                   1085 ;	./../../mib/stm8s_mib_debug_mem.c: 305: else if (!strcmp(argv[1], "cpy")) // _CMD_MY_MEMCPY_
      00AA0E 1E 26            [ 2] 1086 	ldw	x, (0x26, sp)
      00AA10 FE               [ 2] 1087 	ldw	x, (x)
      00AA11 4B E7            [ 1] 1088 	push	#<(___str_20+0)
      00AA13 4B 89            [ 1] 1089 	push	#((___str_20+0) >> 8)
      00AA15 CD B1 01         [ 4] 1090 	call	_strcmp
      00AA18 5D               [ 2] 1091 	tnzw	x
      00AA19 26 71            [ 1] 1092 	jrne	00200$
                                   1093 ;	./../../mib/stm8s_mib_debug_mem.c: 307: if (argc < 5)
      00AA1B 1E 2C            [ 2] 1094 	ldw	x, (0x2c, sp)
      00AA1D A3 00 05         [ 2] 1095 	cpw	x, #0x0005
      00AA20 2E 0B            [ 1] 1096 	jrsge	00173$
                                   1097 ;	./../../mib/stm8s_mib_debug_mem.c: 309: MibWriteDebugString(cptr->usage);
      00AA22 1E 24            [ 2] 1098 	ldw	x, (0x24, sp)
      00AA24 EE 04            [ 2] 1099 	ldw	x, (0x4, x)
      00AA26 CD 92 86         [ 4] 1100 	call	_MibWriteDebugString
                                   1101 ;	./../../mib/stm8s_mib_debug_mem.c: 310: return FALSE;
      00AA29 5F               [ 1] 1102 	clrw	x
      00AA2A CC AB CB         [ 2] 1103 	jp	00235$
      00AA2D                       1104 00173$:
                                   1105 ;	./../../mib/stm8s_mib_debug_mem.c: 312: if (!HexToInt(argv[2], &dest, 32) || !HexToInt(argv[3], &src, 32) || !HexToInt(argv[4], &len, 32))
      00AA2D 16 2E            [ 2] 1106 	ldw	y, (0x2e, sp)
      00AA2F 90 EE 04         [ 2] 1107 	ldw	y, (0x4, y)
      00AA32 4B 20            [ 1] 1108 	push	#0x20
      00AA34 4B 00            [ 1] 1109 	push	#0x00
      00AA36 96               [ 1] 1110 	ldw	x, sp
      00AA37 1C 00 0E         [ 2] 1111 	addw	x, #14
      00AA3A 89               [ 2] 1112 	pushw	x
      00AA3B 93               [ 1] 1113 	ldw	x, y
      00AA3C CD 9F 99         [ 4] 1114 	call	_HexToInt
      00AA3F 5D               [ 2] 1115 	tnzw	x
      00AA40 27 2A            [ 1] 1116 	jreq	00174$
      00AA42 16 2E            [ 2] 1117 	ldw	y, (0x2e, sp)
      00AA44 90 EE 06         [ 2] 1118 	ldw	y, (0x6, y)
      00AA47 4B 20            [ 1] 1119 	push	#0x20
      00AA49 4B 00            [ 1] 1120 	push	#0x00
      00AA4B 96               [ 1] 1121 	ldw	x, sp
      00AA4C 1C 00 12         [ 2] 1122 	addw	x, #18
      00AA4F 89               [ 2] 1123 	pushw	x
      00AA50 93               [ 1] 1124 	ldw	x, y
      00AA51 CD 9F 99         [ 4] 1125 	call	_HexToInt
      00AA54 5D               [ 2] 1126 	tnzw	x
      00AA55 27 15            [ 1] 1127 	jreq	00174$
      00AA57 16 2E            [ 2] 1128 	ldw	y, (0x2e, sp)
      00AA59 90 EE 08         [ 2] 1129 	ldw	y, (0x8, y)
      00AA5C 4B 20            [ 1] 1130 	push	#0x20
      00AA5E 4B 00            [ 1] 1131 	push	#0x00
      00AA60 96               [ 1] 1132 	ldw	x, sp
      00AA61 1C 00 16         [ 2] 1133 	addw	x, #22
      00AA64 89               [ 2] 1134 	pushw	x
      00AA65 93               [ 1] 1135 	ldw	x, y
      00AA66 CD 9F 99         [ 4] 1136 	call	_HexToInt
      00AA69 5D               [ 2] 1137 	tnzw	x
      00AA6A 26 0D            [ 1] 1138 	jrne	00175$
      00AA6C                       1139 00174$:
                                   1140 ;	./../../mib/stm8s_mib_debug_mem.c: 314: ccprintf(_DEBUG_CMD_A_, ("Illegal character is used.\r\n"));
      00AA6C 4B EB            [ 1] 1141 	push	#<(__str_21+0)
      00AA6E 4B 89            [ 1] 1142 	push	#((__str_21+0) >> 8)
      00AA70 CD 9C 98         [ 4] 1143 	call	_mib_printf
      00AA73 5B 02            [ 2] 1144 	addw	sp, #2
                                   1145 ;	./../../mib/stm8s_mib_debug_mem.c: 315: return FALSE;
      00AA75 5F               [ 1] 1146 	clrw	x
      00AA76 CC AB CB         [ 2] 1147 	jp	00235$
      00AA79                       1148 00175$:
                                   1149 ;	./../../mib/stm8s_mib_debug_mem.c: 317: memcpy((char *)dest, (char *)src, len);		
      00AA79 1E 16            [ 2] 1150 	ldw	x, (0x16, sp)
      00AA7B 16 12            [ 2] 1151 	ldw	y, (0x12, sp)
      00AA7D 17 28            [ 2] 1152 	ldw	(0x28, sp), y
      00AA7F 16 0E            [ 2] 1153 	ldw	y, (0x0e, sp)
      00AA81 89               [ 2] 1154 	pushw	x
      00AA82 1E 2A            [ 2] 1155 	ldw	x, (0x2a, sp)
      00AA84 89               [ 2] 1156 	pushw	x
      00AA85 93               [ 1] 1157 	ldw	x, y
      00AA86 CD B0 7D         [ 4] 1158 	call	___memcpy
      00AA89 CC AB C9         [ 2] 1159 	jp	00216$
      00AA8C                       1160 00200$:
                                   1161 ;	./../../mib/stm8s_mib_debug_mem.c: 319: else if (!strcmp(argv[1], "cmp")) // _CMD_MY_MEMCMP_
      00AA8C 1E 26            [ 2] 1162 	ldw	x, (0x26, sp)
      00AA8E FE               [ 2] 1163 	ldw	x, (x)
      00AA8F 4B 08            [ 1] 1164 	push	#<(___str_22+0)
      00AA91 4B 8A            [ 1] 1165 	push	#((___str_22+0) >> 8)
      00AA93 CD B1 01         [ 4] 1166 	call	_strcmp
      00AA96 5D               [ 2] 1167 	tnzw	x
      00AA97 27 03            [ 1] 1168 	jreq	00647$
      00AA99 CC AB 25         [ 2] 1169 	jp	00197$
      00AA9C                       1170 00647$:
                                   1171 ;	./../../mib/stm8s_mib_debug_mem.c: 321: if (argc < 5)
      00AA9C 1E 2C            [ 2] 1172 	ldw	x, (0x2c, sp)
      00AA9E A3 00 05         [ 2] 1173 	cpw	x, #0x0005
      00AAA1 2E 0B            [ 1] 1174 	jrsge	00179$
                                   1175 ;	./../../mib/stm8s_mib_debug_mem.c: 323: MibWriteDebugString(cptr->usage);
      00AAA3 1E 24            [ 2] 1176 	ldw	x, (0x24, sp)
      00AAA5 EE 04            [ 2] 1177 	ldw	x, (0x4, x)
      00AAA7 CD 92 86         [ 4] 1178 	call	_MibWriteDebugString
                                   1179 ;	./../../mib/stm8s_mib_debug_mem.c: 324: return FALSE;
      00AAAA 5F               [ 1] 1180 	clrw	x
      00AAAB CC AB CB         [ 2] 1181 	jp	00235$
      00AAAE                       1182 00179$:
                                   1183 ;	./../../mib/stm8s_mib_debug_mem.c: 326: if (!HexToInt(argv[2], &dest, 32) || !HexToInt(argv[3], &src, 32) || !HexToInt(argv[4], &len, 32))
      00AAAE 16 2E            [ 2] 1184 	ldw	y, (0x2e, sp)
      00AAB0 90 EE 04         [ 2] 1185 	ldw	y, (0x4, y)
      00AAB3 4B 20            [ 1] 1186 	push	#0x20
      00AAB5 4B 00            [ 1] 1187 	push	#0x00
      00AAB7 96               [ 1] 1188 	ldw	x, sp
      00AAB8 1C 00 0E         [ 2] 1189 	addw	x, #14
      00AABB 89               [ 2] 1190 	pushw	x
      00AABC 93               [ 1] 1191 	ldw	x, y
      00AABD CD 9F 99         [ 4] 1192 	call	_HexToInt
      00AAC0 5D               [ 2] 1193 	tnzw	x
      00AAC1 27 2A            [ 1] 1194 	jreq	00180$
      00AAC3 16 2E            [ 2] 1195 	ldw	y, (0x2e, sp)
      00AAC5 90 EE 06         [ 2] 1196 	ldw	y, (0x6, y)
      00AAC8 4B 20            [ 1] 1197 	push	#0x20
      00AACA 4B 00            [ 1] 1198 	push	#0x00
      00AACC 96               [ 1] 1199 	ldw	x, sp
      00AACD 1C 00 12         [ 2] 1200 	addw	x, #18
      00AAD0 89               [ 2] 1201 	pushw	x
      00AAD1 93               [ 1] 1202 	ldw	x, y
      00AAD2 CD 9F 99         [ 4] 1203 	call	_HexToInt
      00AAD5 5D               [ 2] 1204 	tnzw	x
      00AAD6 27 15            [ 1] 1205 	jreq	00180$
      00AAD8 16 2E            [ 2] 1206 	ldw	y, (0x2e, sp)
      00AADA 90 EE 08         [ 2] 1207 	ldw	y, (0x8, y)
      00AADD 4B 20            [ 1] 1208 	push	#0x20
      00AADF 4B 00            [ 1] 1209 	push	#0x00
      00AAE1 96               [ 1] 1210 	ldw	x, sp
      00AAE2 1C 00 16         [ 2] 1211 	addw	x, #22
      00AAE5 89               [ 2] 1212 	pushw	x
      00AAE6 93               [ 1] 1213 	ldw	x, y
      00AAE7 CD 9F 99         [ 4] 1214 	call	_HexToInt
      00AAEA 5D               [ 2] 1215 	tnzw	x
      00AAEB 26 0D            [ 1] 1216 	jrne	00181$
      00AAED                       1217 00180$:
                                   1218 ;	./../../mib/stm8s_mib_debug_mem.c: 328: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00AAED 4B 25            [ 1] 1219 	push	#<(__str_3+0)
      00AAEF 4B 89            [ 1] 1220 	push	#((__str_3+0) >> 8)
      00AAF1 CD 9C 98         [ 4] 1221 	call	_mib_printf
      00AAF4 5B 02            [ 2] 1222 	addw	sp, #2
                                   1223 ;	./../../mib/stm8s_mib_debug_mem.c: 329: return FALSE;
      00AAF6 5F               [ 1] 1224 	clrw	x
      00AAF7 CC AB CB         [ 2] 1225 	jp	00235$
      00AAFA                       1226 00181$:
                                   1227 ;	./../../mib/stm8s_mib_debug_mem.c: 332: if (memcmp((char *)dest, (char *)src, (len)) == 0) ccprintf(_DEBUG_CMD_A_, ("equil.\r\n"));
      00AAFA 1E 16            [ 2] 1228 	ldw	x, (0x16, sp)
      00AAFC 16 12            [ 2] 1229 	ldw	y, (0x12, sp)
      00AAFE 17 28            [ 2] 1230 	ldw	(0x28, sp), y
      00AB00 16 0E            [ 2] 1231 	ldw	y, (0x0e, sp)
      00AB02 89               [ 2] 1232 	pushw	x
      00AB03 1E 2A            [ 2] 1233 	ldw	x, (0x2a, sp)
      00AB05 89               [ 2] 1234 	pushw	x
      00AB06 93               [ 1] 1235 	ldw	x, y
      00AB07 CD AF 31         [ 4] 1236 	call	_memcmp
      00AB0A 5D               [ 2] 1237 	tnzw	x
      00AB0B 26 0C            [ 1] 1238 	jrne	00185$
      00AB0D 4B 0C            [ 1] 1239 	push	#<(__str_23+0)
      00AB0F 4B 8A            [ 1] 1240 	push	#((__str_23+0) >> 8)
      00AB11 CD 9C 98         [ 4] 1241 	call	_mib_printf
      00AB14 5B 02            [ 2] 1242 	addw	sp, #2
      00AB16 CC AB C9         [ 2] 1243 	jp	00216$
      00AB19                       1244 00185$:
                                   1245 ;	./../../mib/stm8s_mib_debug_mem.c: 333: else ccprintf(_DEBUG_CMD_A_, ("not equil.\r\n"));		
      00AB19 4B 15            [ 1] 1246 	push	#<(__str_24+0)
      00AB1B 4B 8A            [ 1] 1247 	push	#((__str_24+0) >> 8)
      00AB1D CD 9C 98         [ 4] 1248 	call	_mib_printf
      00AB20 5B 02            [ 2] 1249 	addw	sp, #2
      00AB22 CC AB C9         [ 2] 1250 	jp	00216$
      00AB25                       1251 00197$:
                                   1252 ;	./../../mib/stm8s_mib_debug_mem.c: 335: else if (!strcmp(argv[1], "set")) // _CMD_MY_MEMSET_
      00AB25 1E 26            [ 2] 1253 	ldw	x, (0x26, sp)
      00AB27 FE               [ 2] 1254 	ldw	x, (x)
      00AB28 4B 22            [ 1] 1255 	push	#<(___str_25+0)
      00AB2A 4B 8A            [ 1] 1256 	push	#((___str_25+0) >> 8)
      00AB2C CD B1 01         [ 4] 1257 	call	_strcmp
      00AB2F 5D               [ 2] 1258 	tnzw	x
      00AB30 26 71            [ 1] 1259 	jrne	00194$
                                   1260 ;	./../../mib/stm8s_mib_debug_mem.c: 337: if (argc < 5)
      00AB32 1E 2C            [ 2] 1261 	ldw	x, (0x2c, sp)
      00AB34 A3 00 05         [ 2] 1262 	cpw	x, #0x0005
      00AB37 2E 0B            [ 1] 1263 	jrsge	00188$
                                   1264 ;	./../../mib/stm8s_mib_debug_mem.c: 339: MibWriteDebugString(cptr->usage);
      00AB39 1E 24            [ 2] 1265 	ldw	x, (0x24, sp)
      00AB3B EE 04            [ 2] 1266 	ldw	x, (0x4, x)
      00AB3D CD 92 86         [ 4] 1267 	call	_MibWriteDebugString
                                   1268 ;	./../../mib/stm8s_mib_debug_mem.c: 340: return FALSE;
      00AB40 5F               [ 1] 1269 	clrw	x
      00AB41 CC AB CB         [ 2] 1270 	jp	00235$
      00AB44                       1271 00188$:
                                   1272 ;	./../../mib/stm8s_mib_debug_mem.c: 342: if (!HexToInt(argv[2], &addr, 32) || !HexToInt(argv[3], &c, 8) || !HexToInt(argv[4], &len, 32))
      00AB44 16 2E            [ 2] 1273 	ldw	y, (0x2e, sp)
      00AB46 90 EE 04         [ 2] 1274 	ldw	y, (0x4, y)
      00AB49 4B 20            [ 1] 1275 	push	#0x20
      00AB4B 4B 00            [ 1] 1276 	push	#0x00
      00AB4D 96               [ 1] 1277 	ldw	x, sp
      00AB4E 1C 00 03         [ 2] 1278 	addw	x, #3
      00AB51 89               [ 2] 1279 	pushw	x
      00AB52 93               [ 1] 1280 	ldw	x, y
      00AB53 CD 9F 99         [ 4] 1281 	call	_HexToInt
      00AB56 5D               [ 2] 1282 	tnzw	x
      00AB57 27 2A            [ 1] 1283 	jreq	00189$
      00AB59 16 2E            [ 2] 1284 	ldw	y, (0x2e, sp)
      00AB5B 90 EE 06         [ 2] 1285 	ldw	y, (0x6, y)
      00AB5E 4B 08            [ 1] 1286 	push	#0x08
      00AB60 4B 00            [ 1] 1287 	push	#0x00
      00AB62 96               [ 1] 1288 	ldw	x, sp
      00AB63 1C 00 07         [ 2] 1289 	addw	x, #7
      00AB66 89               [ 2] 1290 	pushw	x
      00AB67 93               [ 1] 1291 	ldw	x, y
      00AB68 CD 9F 99         [ 4] 1292 	call	_HexToInt
      00AB6B 5D               [ 2] 1293 	tnzw	x
      00AB6C 27 15            [ 1] 1294 	jreq	00189$
      00AB6E 16 2E            [ 2] 1295 	ldw	y, (0x2e, sp)
      00AB70 90 EE 08         [ 2] 1296 	ldw	y, (0x8, y)
      00AB73 4B 20            [ 1] 1297 	push	#0x20
      00AB75 4B 00            [ 1] 1298 	push	#0x00
      00AB77 96               [ 1] 1299 	ldw	x, sp
      00AB78 1C 00 16         [ 2] 1300 	addw	x, #22
      00AB7B 89               [ 2] 1301 	pushw	x
      00AB7C 93               [ 1] 1302 	ldw	x, y
      00AB7D CD 9F 99         [ 4] 1303 	call	_HexToInt
      00AB80 5D               [ 2] 1304 	tnzw	x
      00AB81 26 0C            [ 1] 1305 	jrne	00190$
      00AB83                       1306 00189$:
                                   1307 ;	./../../mib/stm8s_mib_debug_mem.c: 344: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00AB83 4B 25            [ 1] 1308 	push	#<(__str_3+0)
      00AB85 4B 89            [ 1] 1309 	push	#((__str_3+0) >> 8)
      00AB87 CD 9C 98         [ 4] 1310 	call	_mib_printf
      00AB8A 5B 02            [ 2] 1311 	addw	sp, #2
                                   1312 ;	./../../mib/stm8s_mib_debug_mem.c: 345: return FALSE;
      00AB8C 5F               [ 1] 1313 	clrw	x
      00AB8D 20 3C            [ 2] 1314 	jra	00235$
      00AB8F                       1315 00190$:
                                   1316 ;	./../../mib/stm8s_mib_debug_mem.c: 347: memset((void *)addr, c, len);
      00AB8F 1E 16            [ 2] 1317 	ldw	x, (0x16, sp)
      00AB91 7B 05            [ 1] 1318 	ld	a, (0x05, sp)
      00AB93 6B 29            [ 1] 1319 	ld	(0x29, sp), a
      00AB95 0F 28            [ 1] 1320 	clr	(0x28, sp)
      00AB97 16 03            [ 2] 1321 	ldw	y, (0x03, sp)
      00AB99 89               [ 2] 1322 	pushw	x
      00AB9A 1E 2A            [ 2] 1323 	ldw	x, (0x2a, sp)
      00AB9C 89               [ 2] 1324 	pushw	x
      00AB9D 93               [ 1] 1325 	ldw	x, y
      00AB9E CD B0 D0         [ 4] 1326 	call	_memset
      00ABA1 20 26            [ 2] 1327 	jra	00216$
      00ABA3                       1328 00194$:
                                   1329 ;	./../../mib/stm8s_mib_debug_mem.c: 351: MibWriteDebugString(cptr->usage);
      00ABA3 1E 24            [ 2] 1330 	ldw	x, (0x24, sp)
      00ABA5 EE 04            [ 2] 1331 	ldw	x, (0x4, x)
      00ABA7 CD 92 86         [ 4] 1332 	call	_MibWriteDebugString
                                   1333 ;	./../../mib/stm8s_mib_debug_mem.c: 352: return FALSE;
      00ABAA 5F               [ 1] 1334 	clrw	x
      00ABAB 20 1E            [ 2] 1335 	jra	00235$
      00ABAD                       1336 00301$:
      00ABAD 16 28            [ 2] 1337 	ldw	y, (0x28, sp)
      00ABAF 17 1A            [ 2] 1338 	ldw	(0x1a, sp), y
      00ABB1 16 26            [ 2] 1339 	ldw	y, (0x26, sp)
      00ABB3 17 18            [ 2] 1340 	ldw	(0x18, sp), y
      00ABB5 20 12            [ 2] 1341 	jra	00216$
      00ABB7                       1342 00302$:
      00ABB7 16 28            [ 2] 1343 	ldw	y, (0x28, sp)
      00ABB9 17 1A            [ 2] 1344 	ldw	(0x1a, sp), y
      00ABBB 16 26            [ 2] 1345 	ldw	y, (0x26, sp)
      00ABBD 17 18            [ 2] 1346 	ldw	(0x18, sp), y
      00ABBF 20 08            [ 2] 1347 	jra	00216$
      00ABC1                       1348 00303$:
      00ABC1 16 28            [ 2] 1349 	ldw	y, (0x28, sp)
      00ABC3 17 1A            [ 2] 1350 	ldw	(0x1a, sp), y
      00ABC5 16 26            [ 2] 1351 	ldw	y, (0x26, sp)
      00ABC7 17 18            [ 2] 1352 	ldw	(0x18, sp), y
      00ABC9                       1353 00216$:
                                   1354 ;	./../../mib/stm8s_mib_debug_mem.c: 354: return TRUE;
      00ABC9 5F               [ 1] 1355 	clrw	x
      00ABCA 5C               [ 1] 1356 	incw	x
      00ABCB                       1357 00235$:
                                   1358 ;	./../../mib/stm8s_mib_debug_mem.c: 355: }
      00ABCB 16 2A            [ 2] 1359 	ldw	y, (42, sp)
      00ABCD 5B 2F            [ 2] 1360 	addw	sp, #47
      00ABCF 90 FC            [ 2] 1361 	jp	(y)
                                   1362 	.area CODE
                                   1363 	.area CONST
                                   1364 	.area CONST
      0088F9                       1365 __str_0:
      0088F9 49 4E 46 4F 3A 2B 63  1366 	.ascii "INFO:+cmd_mem..."
             6D 64 5F 6D 65 6D 2E
             2E 2E
      008909 0D                    1367 	.db 0x0d
      00890A 0A                    1368 	.db 0x0a
      00890B 00                    1369 	.db 0x00
                                   1370 	.area CODE
                                   1371 	.area CONST
      00890C                       1372 __str_1:
      00890C 49 4E 46 4F 3A 2D 63  1373 	.ascii "INFO:-cmd_mem..."
             6D 64 5F 6D 65 6D 2E
             2E 2E
      00891C 0D                    1374 	.db 0x0d
      00891D 0A                    1375 	.db 0x0a
      00891E 00                    1376 	.db 0x00
                                   1377 	.area CODE
                                   1378 	.area CONST
      00891F                       1379 ___str_2:
      00891F 77 72 69 74 65        1380 	.ascii "write"
      008924 00                    1381 	.db 0x00
                                   1382 	.area CODE
                                   1383 	.area CONST
      008925                       1384 __str_3:
      008925 49 6C 6C 75 67 61 6C  1385 	.ascii "Illugal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      00893F 0D                    1386 	.db 0x0d
      008940 0A                    1387 	.db 0x0a
      008941 00                    1388 	.db 0x00
                                   1389 	.area CODE
                                   1390 	.area CONST
      008942                       1391 __str_4:
      008942 49 6C 6C 75 67 61 6C  1392 	.ascii "Illugal character is useqd."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 71 64 2E
      00895D 0D                    1393 	.db 0x0d
      00895E 0A                    1394 	.db 0x0a
      00895F 00                    1395 	.db 0x00
                                   1396 	.area CODE
                                   1397 	.area CONST
      008960                       1398 ___str_5:
      008960 72 65 61 64           1399 	.ascii "read"
      008964 00                    1400 	.db 0x00
                                   1401 	.area CODE
                                   1402 	.area CONST
      008965                       1403 __str_6:
      008965 09                    1404 	.db 0x09
      008966 61 64 64 72 65 73 73  1405 	.ascii "address : 0x%08lx  "
             20 3A 20 30 78 25 30
             38 6C 78 20 20
      008979 00                    1406 	.db 0x00
                                   1407 	.area CODE
                                   1408 	.area CONST
      00897A                       1409 __str_7:
      00897A 09                    1410 	.db 0x09
      00897B 76 61 6C 75 65 20 20  1411 	.ascii "value   : "
             20 3A 20
      008985 00                    1412 	.db 0x00
                                   1413 	.area CODE
                                   1414 	.area CONST
      008986                       1415 __str_8:
      008986 30 78 25 30 32 78 20  1416 	.ascii "0x%02x "
      00898D 00                    1417 	.db 0x00
                                   1418 	.area CODE
                                   1419 	.area CONST
      00898E                       1420 __str_9:
      00898E 30 78 25 30 34 78     1421 	.ascii "0x%04x"
      008994 00                    1422 	.db 0x00
                                   1423 	.area CODE
                                   1424 	.area CONST
      008995                       1425 __str_10:
      008995 30 78 25 30 38 6C 78  1426 	.ascii "0x%08lx"
      00899C 00                    1427 	.db 0x00
                                   1428 	.area CODE
                                   1429 	.area CONST
      00899D                       1430 __str_11:
      00899D 45 72 72 6F 72 2E     1431 	.ascii "Error."
      0089A3 0D                    1432 	.db 0x0d
      0089A4 0A                    1433 	.db 0x0a
      0089A5 00                    1434 	.db 0x00
                                   1435 	.area CODE
                                   1436 	.area CONST
      0089A6                       1437 __str_12:
      0089A6 2E                    1438 	.ascii "."
      0089A7 0D                    1439 	.db 0x0d
      0089A8 0A                    1440 	.db 0x0a
      0089A9 00                    1441 	.db 0x00
                                   1442 	.area CODE
                                   1443 	.area CONST
      0089AA                       1444 ___str_13:
      0089AA 77 72 6E              1445 	.ascii "wrn"
      0089AD 00                    1446 	.db 0x00
                                   1447 	.area CODE
                                   1448 	.area CONST
      0089AE                       1449 ___str_14:
      0089AE 72 64 6E              1450 	.ascii "rdn"
      0089B1 00                    1451 	.db 0x00
                                   1452 	.area CODE
                                   1453 	.area CONST
      0089B2                       1454 __str_15:
      0089B2 6C 6F 6F 70 20 3A 20  1455 	.ascii "loop : 0x%08lx  "
             30 78 25 30 38 6C 78
             20 20
      0089C2 0D                    1456 	.db 0x0d
      0089C3 0A                    1457 	.db 0x0a
      0089C4 00                    1458 	.db 0x00
                                   1459 	.area CODE
                                   1460 	.area CONST
      0089C5                       1461 __str_16:
      0089C5 76 61 6C 75 65 20 20  1462 	.ascii "value   : "
             20 3A 20
      0089CF 00                    1463 	.db 0x00
                                   1464 	.area CODE
                                   1465 	.area CONST
      0089D0                       1466 __str_17:
      0089D0 30 78 25 30 34 78 20  1467 	.ascii "0x%04x "
      0089D7 00                    1468 	.db 0x00
                                   1469 	.area CODE
                                   1470 	.area CONST
      0089D8                       1471 __str_18:
      0089D8 30 78 25 30 38 6C 78  1472 	.ascii "0x%08lx "
             20
      0089E0 00                    1473 	.db 0x00
                                   1474 	.area CODE
                                   1475 	.area CONST
      0089E1                       1476 ___str_19:
      0089E1 68 64 75 6D 70        1477 	.ascii "hdump"
      0089E6 00                    1478 	.db 0x00
                                   1479 	.area CODE
                                   1480 	.area CONST
      0089E7                       1481 ___str_20:
      0089E7 63 70 79              1482 	.ascii "cpy"
      0089EA 00                    1483 	.db 0x00
                                   1484 	.area CODE
                                   1485 	.area CONST
      0089EB                       1486 __str_21:
      0089EB 49 6C 6C 65 67 61 6C  1487 	.ascii "Illegal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      008A05 0D                    1488 	.db 0x0d
      008A06 0A                    1489 	.db 0x0a
      008A07 00                    1490 	.db 0x00
                                   1491 	.area CODE
                                   1492 	.area CONST
      008A08                       1493 ___str_22:
      008A08 63 6D 70              1494 	.ascii "cmp"
      008A0B 00                    1495 	.db 0x00
                                   1496 	.area CODE
                                   1497 	.area CONST
      008A0C                       1498 __str_23:
      008A0C 65 71 75 69 6C 2E     1499 	.ascii "equil."
      008A12 0D                    1500 	.db 0x0d
      008A13 0A                    1501 	.db 0x0a
      008A14 00                    1502 	.db 0x00
                                   1503 	.area CODE
                                   1504 	.area CONST
      008A15                       1505 __str_24:
      008A15 6E 6F 74 20 65 71 75  1506 	.ascii "not equil."
             69 6C 2E
      008A1F 0D                    1507 	.db 0x0d
      008A20 0A                    1508 	.db 0x0a
      008A21 00                    1509 	.db 0x00
                                   1510 	.area CODE
                                   1511 	.area CONST
      008A22                       1512 ___str_25:
      008A22 73 65 74              1513 	.ascii "set"
      008A25 00                    1514 	.db 0x00
                                   1515 	.area CODE
                                   1516 	.area CONST
      008A26                       1517 ___str_26:
      008A26 6D 65 6D              1518 	.ascii "mem"
      008A29 00                    1519 	.db 0x00
                                   1520 	.area CODE
                                   1521 	.area CONST
      008A2A                       1522 ___str_27:
      008A2A 20 20 6D 65 6D 20 7B  1523 	.ascii "  mem {cpy}   [dest] [src]   [len] Copy to SDRAM from Flash "
             63 70 79 7D 20 20 20
             5B 64 65 73 74 5D 20
             5B 73 72 63 5D 20 20
             20 5B 6C 65 6E 5D 20
             43 6F 70 79 20 74 6F
             20 53 44 52 41 4D 20
             66 72 6F 6D 20 46 6C
             61 73 68 20
      008A66 6F 72 20 53 44 52 41  1524 	.ascii "or SDRAM."
             4D 2E
      008A6F 0D                    1525 	.db 0x0d
      008A70 0A                    1526 	.db 0x0a
      008A71 20 20 6D 65 6D 20 7B  1527 	.ascii "  mem {cmp}   [add1] [add2]  [len] Compare data in addr1 and"
             63 6D 70 7D 20 20 20
             5B 61 64 64 31 5D 20
             5B 61 64 64 32 5D 20
             20 5B 6C 65 6E 5D 20
             43 6F 6D 70 61 72 65
             20 64 61 74 61 20 69
             6E 20 61 64 64 72 31
             20 61 6E 64
      008AAD 20 61 64 64 72 32 2E  1528 	.ascii " addr2."
      008AB4 0D                    1529 	.db 0x0d
      008AB5 0A                    1530 	.db 0x0a
      008AB6 20 20 6D 65 6D 20 7B  1531 	.ascii "  mem {set}   [addr] [value] [len] Fill Memory with value."
             73 65 74 7D 20 20 20
             5B 61 64 64 72 5D 20
             5B 76 61 6C 75 65 5D
             20 5B 6C 65 6E 5D 20
             46 69 6C 6C 20 4D 65
             6D 6F 72 79 20 77 69
             74 68 20 76 61 6C 75
             65 2E
      008AF0 0D                    1532 	.db 0x0d
      008AF1 0A                    1533 	.db 0x0a
      008AF2 20 20 6D 65 6D 20 7B  1534 	.ascii "  mem {hdump} [addr] [len]         Dump Memory."
             68 64 75 6D 70 7D 20
             5B 61 64 64 72 5D 20
             5B 6C 65 6E 5D 20 20
             20 20 20 20 20 20 20
             44 75 6D 70 20 4D 65
             6D 6F 72 79 2E
      008B21 0D                    1535 	.db 0x0d
      008B22 0A                    1536 	.db 0x0a
      008B23 20 20 6D 65 6D 20 7B  1537 	.ascii "  mem {wrn} {c/s/l} [addr] [value] [loop]  Wrn in addr. c:8 "
             77 72 6E 7D 20 7B 63
             2F 73 2F 6C 7D 20 5B
             61 64 64 72 5D 20 5B
             76 61 6C 75 65 5D 20
             5B 6C 6F 6F 70 5D 20
             20 57 72 6E 20 69 6E
             20 61 64 64 72 2E 20
             63 3A 38 20
      008B5F 73 3A 31 36 20 6C 3A  1538 	.ascii "s:16 l:32 bits."
             33 32 20 62 69 74 73
             2E
      008B6E 0D                    1539 	.db 0x0d
      008B6F 0A                    1540 	.db 0x0a
      008B70 20 20 6D 65 6D 20 7B  1541 	.ascii "  mem {rdn}  {c/s/l} [addr] [loop]   Rdn in addr. c:8 s:16 l"
             72 64 6E 7D 20 20 7B
             63 2F 73 2F 6C 7D 20
             5B 61 64 64 72 5D 20
             5B 6C 6F 6F 70 5D 20
             20 20 52 64 6E 20 69
             6E 20 61 64 64 72 2E
             20 63 3A 38 20 73 3A
             31 36 20 6C
      008BAC 3A 33 32 20 62 69 74  1542 	.ascii ":32 bits."
             73 2E
      008BB5 0D                    1543 	.db 0x0d
      008BB6 0A                    1544 	.db 0x0a
      008BB7 20 20 6D 65 6D 20 7B  1545 	.ascii "  mem {write} {c/s/l} [addr] [value]  Write in addr. c:8 s:1"
             77 72 69 74 65 7D 20
             7B 63 2F 73 2F 6C 7D
             20 5B 61 64 64 72 5D
             20 5B 76 61 6C 75 65
             5D 20 20 57 72 69 74
             65 20 69 6E 20 61 64
             64 72 2E 20 63 3A 38
             20 73 3A 31
      008BF3 36 20 6C 3A 33 32 20  1546 	.ascii "6 l:32 bits."
             62 69 74 73 2E
      008BFF 0D                    1547 	.db 0x0d
      008C00 0A                    1548 	.db 0x0a
      008C01 20 20 6D 65 6D 20 7B  1549 	.ascii "  mem {read}  {c/s/l} [addr]          Read in addr. c:8 s:16"
             72 65 61 64 7D 20 20
             7B 63 2F 73 2F 6C 7D
             20 5B 61 64 64 72 5D
             20 20 20 20 20 20 20
             20 20 20 52 65 61 64
             20 69 6E 20 61 64 64
             72 2E 20 63 3A 38 20
             73 3A 31 36
      008C3D 20 6C 3A 33 32 20 62  1550 	.ascii " l:32 bits."
             69 74 73 2E
      008C48 0D                    1551 	.db 0x0d
      008C49 0A                    1552 	.db 0x0a
      008C4A 00                    1553 	.db 0x00
                                   1554 	.area CODE
                                   1555 	.area INITIALIZER
      008E2A                       1556 __xinit__cmdTbl_only:
      008E2A 8A 26                 1557 	.dw ___str_26
      008E2C A4 56                 1558 	.dw _DoMem
      008E2E 8A 2A                 1559 	.dw ___str_27
      008E30 00 00                 1560 	.dw #0x0000
      008E32 00 00                 1561 	.dw #0x0000
      008E34 00 00                 1562 	.dw #0x0000
                                   1563 	.area CABS (ABS)
