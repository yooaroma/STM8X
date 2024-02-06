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
      00A11C                         63 _cmd_mem:
      00A11C 52 0A            [ 2]   64 	sub	sp, #10
                                     65 ;	./../../mib/stm8s_mib_debug_mem.c: 60: for (cptr = cmdTbl;; cptr++) 
      00A11E AE 01 5C         [ 2]   66 	ldw	x, #(_cmdTbl+0)
      00A121 1F 01            [ 2]   67 	ldw	(0x01, sp), x
      00A123 5F               [ 1]   68 	clrw	x
      00A124 1F 07            [ 2]   69 	ldw	(0x07, sp), x
      00A126 1F 05            [ 2]   70 	ldw	(0x05, sp), x
      00A128 16 01            [ 2]   71 	ldw	y, (0x01, sp)
      00A12A 17 09            [ 2]   72 	ldw	(0x09, sp), y
      00A12C                         73 00106$:
                                     74 ;	./../../mib/stm8s_mib_debug_mem.c: 62: if(cptr->cmd==0)
      00A12C 1E 09            [ 2]   75 	ldw	x, (0x09, sp)
      00A12E FE               [ 2]   76 	ldw	x, (x)
      00A12F 1F 03            [ 2]   77 	ldw	(0x03, sp), x
      00A131 26 19            [ 1]   78 	jrne	00102$
                                     79 ;	./../../mib/stm8s_mib_debug_mem.c: 64: ccprintf(1,("INFO:+cmd_mem...\r\n"));
      00A133 4B E1            [ 1]   80 	push	#<(__str_0+0)
      00A135 4B 84            [ 1]   81 	push	#((__str_0+0) >> 8)
      00A137 CD 99 C0         [ 4]   82 	call	_mib_printf
      00A13A 5B 02            [ 2]   83 	addw	sp, #2
                                     84 ;	./../../mib/stm8s_mib_debug_mem.c: 65: memcpy((void *)&(cptr->cmd),(void *)&(cmdTbl_only[0].cmd),sizeof(CMD_MY));
      00A13C AE 01 80         [ 2]   85 	ldw	x, #_cmdTbl_only+0
      00A13F 16 01            [ 2]   86 	ldw	y, (0x01, sp)
      00A141 4B 06            [ 1]   87 	push	#0x06
      00A143 4B 00            [ 1]   88 	push	#0x00
      00A145 89               [ 2]   89 	pushw	x
      00A146 93               [ 1]   90 	ldw	x, y
      00A147 CD AB CA         [ 4]   91 	call	___memcpy
                                     92 ;	./../../mib/stm8s_mib_debug_mem.c: 66: break;
      00A14A 20 2F            [ 2]   93 	jra	00105$
      00A14C                         94 00102$:
                                     95 ;	./../../mib/stm8s_mib_debug_mem.c: 68: index++;
      00A14C 1E 07            [ 2]   96 	ldw	x, (0x07, sp)
      00A14E 5C               [ 1]   97 	incw	x
      00A14F 1F 07            [ 2]   98 	ldw	(0x07, sp), x
      00A151 26 05            [ 1]   99 	jrne	00126$
      00A153 1E 05            [ 2]  100 	ldw	x, (0x05, sp)
      00A155 5C               [ 1]  101 	incw	x
      00A156 1F 05            [ 2]  102 	ldw	(0x05, sp), x
      00A158                        103 00126$:
                                    104 ;	./../../mib/stm8s_mib_debug_mem.c: 69: if(index>MAX_COMMANDS)
      00A158 AE 00 06         [ 2]  105 	ldw	x, #0x0006
      00A15B 13 07            [ 2]  106 	cpw	x, (0x07, sp)
      00A15D 4F               [ 1]  107 	clr	a
      00A15E 12 06            [ 1]  108 	sbc	a, (0x06, sp)
      00A160 4F               [ 1]  109 	clr	a
      00A161 12 05            [ 1]  110 	sbc	a, (0x05, sp)
      00A163 24 0B            [ 1]  111 	jrnc	00107$
                                    112 ;	./../../mib/stm8s_mib_debug_mem.c: 71: ccprintf(1,("INFO:-cmd_mem...\r\n"));
      00A165 4B F4            [ 1]  113 	push	#<(__str_1+0)
      00A167 4B 84            [ 1]  114 	push	#((__str_1+0) >> 8)
      00A169 CD 99 C0         [ 4]  115 	call	_mib_printf
      00A16C 5B 02            [ 2]  116 	addw	sp, #2
                                    117 ;	./../../mib/stm8s_mib_debug_mem.c: 72: return;
      00A16E 20 0B            [ 2]  118 	jra	00108$
      00A170                        119 00107$:
                                    120 ;	./../../mib/stm8s_mib_debug_mem.c: 60: for (cptr = cmdTbl;; cptr++) 
      00A170 1E 09            [ 2]  121 	ldw	x, (0x09, sp)
      00A172 1C 00 06         [ 2]  122 	addw	x, #0x0006
      00A175 1F 09            [ 2]  123 	ldw	(0x09, sp), x
      00A177 1F 01            [ 2]  124 	ldw	(0x01, sp), x
      00A179 20 B1            [ 2]  125 	jra	00106$
      00A17B                        126 00105$:
                                    127 ;	./../../mib/stm8s_mib_debug_mem.c: 75: return;
      00A17B                        128 00108$:
                                    129 ;	./../../mib/stm8s_mib_debug_mem.c: 76: }
      00A17B 5B 0A            [ 2]  130 	addw	sp, #10
      00A17D 81               [ 4]  131 	ret
                                    132 ;	./../../mib/stm8s_mib_debug_mem.c: 86: static int DoMem(CMD_MY *cptr, int argc, char **argv)
                                    133 ;	-----------------------------------------
                                    134 ;	 function DoMem
                                    135 ;	-----------------------------------------
      00A17E                        136 _DoMem:
      00A17E 52 29            [ 2]  137 	sub	sp, #41
      00A180 1F 24            [ 2]  138 	ldw	(0x24, sp), x
                                    139 ;	./../../mib/stm8s_mib_debug_mem.c: 88: uint32_t addr = 0;
      00A182 5F               [ 1]  140 	clrw	x
      00A183 1F 03            [ 2]  141 	ldw	(0x03, sp), x
      00A185 1F 01            [ 2]  142 	ldw	(0x01, sp), x
                                    143 ;	./../../mib/stm8s_mib_debug_mem.c: 100: if (argc < 3)
      00A187 1E 2C            [ 2]  144 	ldw	x, (0x2c, sp)
      00A189 A3 00 03         [ 2]  145 	cpw	x, #0x0003
      00A18C 2E 0B            [ 1]  146 	jrsge	00102$
                                    147 ;	./../../mib/stm8s_mib_debug_mem.c: 102: MibWriteDebugString(cptr->usage);
      00A18E 1E 24            [ 2]  148 	ldw	x, (0x24, sp)
      00A190 EE 04            [ 2]  149 	ldw	x, (0x4, x)
      00A192 CD 8F AE         [ 4]  150 	call	_MibWriteDebugString
                                    151 ;	./../../mib/stm8s_mib_debug_mem.c: 103: return FALSE;
      00A195 5F               [ 1]  152 	clrw	x
      00A196 CC A8 F3         [ 2]  153 	jp	00235$
      00A199                        154 00102$:
                                    155 ;	./../../mib/stm8s_mib_debug_mem.c: 105: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      00A199 1E 2E            [ 2]  156 	ldw	x, (0x2e, sp)
      00A19B 5C               [ 1]  157 	incw	x
      00A19C 5C               [ 1]  158 	incw	x
      00A19D 1F 26            [ 2]  159 	ldw	(0x26, sp), x
      00A19F FE               [ 2]  160 	ldw	x, (x)
      00A1A0 4B 07            [ 1]  161 	push	#<(___str_2+0)
      00A1A2 4B 85            [ 1]  162 	push	#((___str_2+0) >> 8)
      00A1A4 CD AC 4E         [ 4]  163 	call	_strcmp
      00A1A7 5D               [ 2]  164 	tnzw	x
      00A1A8 27 03            [ 1]  165 	jreq	00564$
      00A1AA CC A2 80         [ 2]  166 	jp	00215$
      00A1AD                        167 00564$:
                                    168 ;	./../../mib/stm8s_mib_debug_mem.c: 107: if (argc < 5)
      00A1AD 1E 2C            [ 2]  169 	ldw	x, (0x2c, sp)
      00A1AF A3 00 05         [ 2]  170 	cpw	x, #0x0005
      00A1B2 2E 0B            [ 1]  171 	jrsge	00104$
                                    172 ;	./../../mib/stm8s_mib_debug_mem.c: 109: MibWriteDebugString(cptr->usage);
      00A1B4 1E 24            [ 2]  173 	ldw	x, (0x24, sp)
      00A1B6 EE 04            [ 2]  174 	ldw	x, (0x4, x)
      00A1B8 CD 8F AE         [ 4]  175 	call	_MibWriteDebugString
                                    176 ;	./../../mib/stm8s_mib_debug_mem.c: 110: return FALSE;
      00A1BB 5F               [ 1]  177 	clrw	x
      00A1BC CC A8 F3         [ 2]  178 	jp	00235$
      00A1BF                        179 00104$:
                                    180 ;	./../../mib/stm8s_mib_debug_mem.c: 112: if (!HexToInt(argv[3], &addr, 32))
      00A1BF 96               [ 1]  181 	ldw	x, sp
      00A1C0 5C               [ 1]  182 	incw	x
      00A1C1 51               [ 1]  183 	exgw	x, y
      00A1C2 1E 2E            [ 2]  184 	ldw	x, (0x2e, sp)
      00A1C4 EE 06            [ 2]  185 	ldw	x, (0x6, x)
      00A1C6 4B 20            [ 1]  186 	push	#0x20
      00A1C8 4B 00            [ 1]  187 	push	#0x00
      00A1CA 90 89            [ 2]  188 	pushw	y
      00A1CC CD 9C C1         [ 4]  189 	call	_HexToInt
      00A1CF 5D               [ 2]  190 	tnzw	x
      00A1D0 26 0D            [ 1]  191 	jrne	00106$
                                    192 ;	./../../mib/stm8s_mib_debug_mem.c: 114: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A1D2 4B 0D            [ 1]  193 	push	#<(__str_3+0)
      00A1D4 4B 85            [ 1]  194 	push	#((__str_3+0) >> 8)
      00A1D6 CD 99 C0         [ 4]  195 	call	_mib_printf
      00A1D9 5B 02            [ 2]  196 	addw	sp, #2
                                    197 ;	./../../mib/stm8s_mib_debug_mem.c: 115: return FALSE;
      00A1DB 5F               [ 1]  198 	clrw	x
      00A1DC CC A8 F3         [ 2]  199 	jp	00235$
      00A1DF                        200 00106$:
                                    201 ;	./../../mib/stm8s_mib_debug_mem.c: 118: switch (argv[2][0])
      00A1DF 1E 2E            [ 2]  202 	ldw	x, (0x2e, sp)
      00A1E1 EE 04            [ 2]  203 	ldw	x, (0x4, x)
      00A1E3 F6               [ 1]  204 	ld	a, (x)
      00A1E4 A1 63            [ 1]  205 	cp	a, #0x63
      00A1E6 27 0B            [ 1]  206 	jreq	00107$
      00A1E8 A1 6C            [ 1]  207 	cp	a, #0x6c
      00A1EA 27 5B            [ 1]  208 	jreq	00113$
      00A1EC A1 73            [ 1]  209 	cp	a, #0x73
      00A1EE 27 2D            [ 1]  210 	jreq	00110$
      00A1F0 CC A2 75         [ 2]  211 	jp	00116$
                                    212 ;	./../../mib/stm8s_mib_debug_mem.c: 120: case 'c':
      00A1F3                        213 00107$:
                                    214 ;	./../../mib/stm8s_mib_debug_mem.c: 121: if (!HexToInt(argv[4], &c, 8))
      00A1F3 96               [ 1]  215 	ldw	x, sp
      00A1F4 1C 00 05         [ 2]  216 	addw	x, #5
      00A1F7 51               [ 1]  217 	exgw	x, y
      00A1F8 1E 2E            [ 2]  218 	ldw	x, (0x2e, sp)
      00A1FA EE 08            [ 2]  219 	ldw	x, (0x8, x)
      00A1FC 4B 08            [ 1]  220 	push	#0x08
      00A1FE 4B 00            [ 1]  221 	push	#0x00
      00A200 90 89            [ 2]  222 	pushw	y
      00A202 CD 9C C1         [ 4]  223 	call	_HexToInt
      00A205 5D               [ 2]  224 	tnzw	x
      00A206 26 0D            [ 1]  225 	jrne	00109$
                                    226 ;	./../../mib/stm8s_mib_debug_mem.c: 123: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A208 4B 0D            [ 1]  227 	push	#<(__str_3+0)
      00A20A 4B 85            [ 1]  228 	push	#((__str_3+0) >> 8)
      00A20C CD 99 C0         [ 4]  229 	call	_mib_printf
      00A20F 5B 02            [ 2]  230 	addw	sp, #2
                                    231 ;	./../../mib/stm8s_mib_debug_mem.c: 124: return FALSE;
      00A211 5F               [ 1]  232 	clrw	x
      00A212 CC A8 F3         [ 2]  233 	jp	00235$
      00A215                        234 00109$:
                                    235 ;	./../../mib/stm8s_mib_debug_mem.c: 126: wr_ADDR8(addr, c);
      00A215 1E 03            [ 2]  236 	ldw	x, (0x03, sp)
      00A217 7B 05            [ 1]  237 	ld	a, (0x05, sp)
      00A219 F7               [ 1]  238 	ld	(x), a
                                    239 ;	./../../mib/stm8s_mib_debug_mem.c: 127: break;
      00A21A CC A8 F1         [ 2]  240 	jp	00216$
                                    241 ;	./../../mib/stm8s_mib_debug_mem.c: 128: case 's':
      00A21D                        242 00110$:
                                    243 ;	./../../mib/stm8s_mib_debug_mem.c: 129: if (!HexToInt(argv[4], &s, 16))
      00A21D 96               [ 1]  244 	ldw	x, sp
      00A21E 1C 00 06         [ 2]  245 	addw	x, #6
      00A221 51               [ 1]  246 	exgw	x, y
      00A222 1E 2E            [ 2]  247 	ldw	x, (0x2e, sp)
      00A224 EE 08            [ 2]  248 	ldw	x, (0x8, x)
      00A226 4B 10            [ 1]  249 	push	#0x10
      00A228 4B 00            [ 1]  250 	push	#0x00
      00A22A 90 89            [ 2]  251 	pushw	y
      00A22C CD 9C C1         [ 4]  252 	call	_HexToInt
      00A22F 5D               [ 2]  253 	tnzw	x
      00A230 26 0D            [ 1]  254 	jrne	00112$
                                    255 ;	./../../mib/stm8s_mib_debug_mem.c: 131: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A232 4B 0D            [ 1]  256 	push	#<(__str_3+0)
      00A234 4B 85            [ 1]  257 	push	#((__str_3+0) >> 8)
      00A236 CD 99 C0         [ 4]  258 	call	_mib_printf
      00A239 5B 02            [ 2]  259 	addw	sp, #2
                                    260 ;	./../../mib/stm8s_mib_debug_mem.c: 132: return FALSE;
      00A23B 5F               [ 1]  261 	clrw	x
      00A23C CC A8 F3         [ 2]  262 	jp	00235$
      00A23F                        263 00112$:
                                    264 ;	./../../mib/stm8s_mib_debug_mem.c: 134: wr_ADDR16(addr, s);
      00A23F 1E 03            [ 2]  265 	ldw	x, (0x03, sp)
      00A241 16 06            [ 2]  266 	ldw	y, (0x06, sp)
      00A243 FF               [ 2]  267 	ldw	(x), y
                                    268 ;	./../../mib/stm8s_mib_debug_mem.c: 135: break;
      00A244 CC A8 F1         [ 2]  269 	jp	00216$
                                    270 ;	./../../mib/stm8s_mib_debug_mem.c: 136: case 'l':
      00A247                        271 00113$:
                                    272 ;	./../../mib/stm8s_mib_debug_mem.c: 137: if (!HexToInt(argv[4], &l, 32))
      00A247 96               [ 1]  273 	ldw	x, sp
      00A248 1C 00 08         [ 2]  274 	addw	x, #8
      00A24B 51               [ 1]  275 	exgw	x, y
      00A24C 1E 2E            [ 2]  276 	ldw	x, (0x2e, sp)
      00A24E EE 08            [ 2]  277 	ldw	x, (0x8, x)
      00A250 4B 20            [ 1]  278 	push	#0x20
      00A252 4B 00            [ 1]  279 	push	#0x00
      00A254 90 89            [ 2]  280 	pushw	y
      00A256 CD 9C C1         [ 4]  281 	call	_HexToInt
      00A259 5D               [ 2]  282 	tnzw	x
      00A25A 26 0D            [ 1]  283 	jrne	00115$
                                    284 ;	./../../mib/stm8s_mib_debug_mem.c: 139: ccprintf(_DEBUG_CMD_A_, ("Illugal character is useqd.\r\n"));
      00A25C 4B 2A            [ 1]  285 	push	#<(__str_4+0)
      00A25E 4B 85            [ 1]  286 	push	#((__str_4+0) >> 8)
      00A260 CD 99 C0         [ 4]  287 	call	_mib_printf
      00A263 5B 02            [ 2]  288 	addw	sp, #2
                                    289 ;	./../../mib/stm8s_mib_debug_mem.c: 140: return FALSE;
      00A265 5F               [ 1]  290 	clrw	x
      00A266 CC A8 F3         [ 2]  291 	jp	00235$
      00A269                        292 00115$:
                                    293 ;	./../../mib/stm8s_mib_debug_mem.c: 142: wr_ADDR32(addr, l);
      00A269 1E 03            [ 2]  294 	ldw	x, (0x03, sp)
      00A26B 16 0A            [ 2]  295 	ldw	y, (0x0a, sp)
      00A26D EF 02            [ 2]  296 	ldw	(0x2, x), y
      00A26F 16 08            [ 2]  297 	ldw	y, (0x08, sp)
      00A271 FF               [ 2]  298 	ldw	(x), y
                                    299 ;	./../../mib/stm8s_mib_debug_mem.c: 143: break;
      00A272 CC A8 F1         [ 2]  300 	jp	00216$
                                    301 ;	./../../mib/stm8s_mib_debug_mem.c: 144: default:
      00A275                        302 00116$:
                                    303 ;	./../../mib/stm8s_mib_debug_mem.c: 145: MibWriteDebugString(cptr->usage);
      00A275 1E 24            [ 2]  304 	ldw	x, (0x24, sp)
      00A277 EE 04            [ 2]  305 	ldw	x, (0x4, x)
      00A279 CD 8F AE         [ 4]  306 	call	_MibWriteDebugString
                                    307 ;	./../../mib/stm8s_mib_debug_mem.c: 146: return FALSE;
      00A27C 5F               [ 1]  308 	clrw	x
      00A27D CC A8 F3         [ 2]  309 	jp	00235$
                                    310 ;	./../../mib/stm8s_mib_debug_mem.c: 147: }		
      00A280                        311 00215$:
                                    312 ;	./../../mib/stm8s_mib_debug_mem.c: 149: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      00A280 1E 26            [ 2]  313 	ldw	x, (0x26, sp)
      00A282 FE               [ 2]  314 	ldw	x, (x)
      00A283 4B 48            [ 1]  315 	push	#<(___str_5+0)
      00A285 4B 85            [ 1]  316 	push	#((___str_5+0) >> 8)
      00A287 CD AC 4E         [ 4]  317 	call	_strcmp
      00A28A 5D               [ 2]  318 	tnzw	x
      00A28B 27 03            [ 1]  319 	jreq	00579$
      00A28D CC A3 44         [ 2]  320 	jp	00212$
      00A290                        321 00579$:
                                    322 ;	./../../mib/stm8s_mib_debug_mem.c: 151: if (argc < 4)
      00A290 1E 2C            [ 2]  323 	ldw	x, (0x2c, sp)
      00A292 A3 00 04         [ 2]  324 	cpw	x, #0x0004
      00A295 2E 0B            [ 1]  325 	jrsge	00119$
                                    326 ;	./../../mib/stm8s_mib_debug_mem.c: 153: MibWriteDebugString(cptr->usage);
      00A297 1E 24            [ 2]  327 	ldw	x, (0x24, sp)
      00A299 EE 04            [ 2]  328 	ldw	x, (0x4, x)
      00A29B CD 8F AE         [ 4]  329 	call	_MibWriteDebugString
                                    330 ;	./../../mib/stm8s_mib_debug_mem.c: 154: return FALSE;
      00A29E 5F               [ 1]  331 	clrw	x
      00A29F CC A8 F3         [ 2]  332 	jp	00235$
      00A2A2                        333 00119$:
                                    334 ;	./../../mib/stm8s_mib_debug_mem.c: 156: if (!HexToInt(argv[3], &addr, 32))
      00A2A2 96               [ 1]  335 	ldw	x, sp
      00A2A3 5C               [ 1]  336 	incw	x
      00A2A4 51               [ 1]  337 	exgw	x, y
      00A2A5 1E 2E            [ 2]  338 	ldw	x, (0x2e, sp)
      00A2A7 EE 06            [ 2]  339 	ldw	x, (0x6, x)
      00A2A9 4B 20            [ 1]  340 	push	#0x20
      00A2AB 4B 00            [ 1]  341 	push	#0x00
      00A2AD 90 89            [ 2]  342 	pushw	y
      00A2AF CD 9C C1         [ 4]  343 	call	_HexToInt
      00A2B2 5D               [ 2]  344 	tnzw	x
      00A2B3 26 0D            [ 1]  345 	jrne	00121$
                                    346 ;	./../../mib/stm8s_mib_debug_mem.c: 158: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A2B5 4B 0D            [ 1]  347 	push	#<(__str_3+0)
      00A2B7 4B 85            [ 1]  348 	push	#((__str_3+0) >> 8)
      00A2B9 CD 99 C0         [ 4]  349 	call	_mib_printf
      00A2BC 5B 02            [ 2]  350 	addw	sp, #2
                                    351 ;	./../../mib/stm8s_mib_debug_mem.c: 159: return FALSE;
      00A2BE 5F               [ 1]  352 	clrw	x
      00A2BF CC A8 F3         [ 2]  353 	jp	00235$
      00A2C2                        354 00121$:
                                    355 ;	./../../mib/stm8s_mib_debug_mem.c: 161: ccprintf(_DEBUG_CMD_A_,("\taddress : 0x%08lx  ", addr));
      00A2C2 1E 03            [ 2]  356 	ldw	x, (0x03, sp)
      00A2C4 89               [ 2]  357 	pushw	x
      00A2C5 1E 03            [ 2]  358 	ldw	x, (0x03, sp)
      00A2C7 89               [ 2]  359 	pushw	x
      00A2C8 4B 4D            [ 1]  360 	push	#<(__str_6+0)
      00A2CA 4B 85            [ 1]  361 	push	#((__str_6+0) >> 8)
      00A2CC CD 99 C0         [ 4]  362 	call	_mib_printf
      00A2CF 5B 06            [ 2]  363 	addw	sp, #6
                                    364 ;	./../../mib/stm8s_mib_debug_mem.c: 162: ccprintf(_DEBUG_CMD_A_, ("\tvalue   : "));
      00A2D1 4B 62            [ 1]  365 	push	#<(__str_7+0)
      00A2D3 4B 85            [ 1]  366 	push	#((__str_7+0) >> 8)
      00A2D5 CD 99 C0         [ 4]  367 	call	_mib_printf
      00A2D8 5B 02            [ 2]  368 	addw	sp, #2
                                    369 ;	./../../mib/stm8s_mib_debug_mem.c: 163: switch (argv[2][0])
      00A2DA 1E 2E            [ 2]  370 	ldw	x, (0x2e, sp)
      00A2DC EE 04            [ 2]  371 	ldw	x, (0x4, x)
      00A2DE F6               [ 1]  372 	ld	a, (x)
      00A2DF A1 63            [ 1]  373 	cp	a, #0x63
      00A2E1 27 0A            [ 1]  374 	jreq	00122$
      00A2E3 A1 6C            [ 1]  375 	cp	a, #0x6c
      00A2E5 27 2A            [ 1]  376 	jreq	00124$
      00A2E7 A1 73            [ 1]  377 	cp	a, #0x73
      00A2E9 27 15            [ 1]  378 	jreq	00123$
      00A2EB 20 3E            [ 2]  379 	jra	00125$
                                    380 ;	./../../mib/stm8s_mib_debug_mem.c: 165: case 'c':
      00A2ED                        381 00122$:
                                    382 ;	./../../mib/stm8s_mib_debug_mem.c: 166: c = rd_ADDR8(addr);
      00A2ED 1E 03            [ 2]  383 	ldw	x, (0x03, sp)
      00A2EF F6               [ 1]  384 	ld	a, (x)
      00A2F0 6B 05            [ 1]  385 	ld	(0x05, sp), a
                                    386 ;	./../../mib/stm8s_mib_debug_mem.c: 167: ccprintf(_DEBUG_CMD_A_,("0x%02x ", c));
      00A2F2 5F               [ 1]  387 	clrw	x
      00A2F3 97               [ 1]  388 	ld	xl, a
      00A2F4 89               [ 2]  389 	pushw	x
      00A2F5 4B 6E            [ 1]  390 	push	#<(__str_8+0)
      00A2F7 4B 85            [ 1]  391 	push	#((__str_8+0) >> 8)
      00A2F9 CD 99 C0         [ 4]  392 	call	_mib_printf
      00A2FC 5B 04            [ 2]  393 	addw	sp, #4
                                    394 ;	./../../mib/stm8s_mib_debug_mem.c: 168: break;
      00A2FE 20 38            [ 2]  395 	jra	00126$
                                    396 ;	./../../mib/stm8s_mib_debug_mem.c: 169: case 's':
      00A300                        397 00123$:
                                    398 ;	./../../mib/stm8s_mib_debug_mem.c: 170: s = rd_ADDR16(addr);
      00A300 1E 03            [ 2]  399 	ldw	x, (0x03, sp)
      00A302 FE               [ 2]  400 	ldw	x, (x)
      00A303 1F 06            [ 2]  401 	ldw	(0x06, sp), x
                                    402 ;	./../../mib/stm8s_mib_debug_mem.c: 171: ccprintf(_DEBUG_CMD_A_,("0x%04x", s));
      00A305 89               [ 2]  403 	pushw	x
      00A306 4B 76            [ 1]  404 	push	#<(__str_9+0)
      00A308 4B 85            [ 1]  405 	push	#((__str_9+0) >> 8)
      00A30A CD 99 C0         [ 4]  406 	call	_mib_printf
      00A30D 5B 04            [ 2]  407 	addw	sp, #4
                                    408 ;	./../../mib/stm8s_mib_debug_mem.c: 172: break;
      00A30F 20 27            [ 2]  409 	jra	00126$
                                    410 ;	./../../mib/stm8s_mib_debug_mem.c: 173: case 'l':
      00A311                        411 00124$:
                                    412 ;	./../../mib/stm8s_mib_debug_mem.c: 174: l = rd_ADDR32(addr);
      00A311 1E 03            [ 2]  413 	ldw	x, (0x03, sp)
      00A313 90 93            [ 1]  414 	ldw	y, x
      00A315 90 EE 02         [ 2]  415 	ldw	y, (0x2, y)
      00A318 FE               [ 2]  416 	ldw	x, (x)
      00A319 17 0A            [ 2]  417 	ldw	(0x0a, sp), y
      00A31B 1F 08            [ 2]  418 	ldw	(0x08, sp), x
                                    419 ;	./../../mib/stm8s_mib_debug_mem.c: 175: ccprintf(_DEBUG_CMD_A_,("0x%08lx", l));
      00A31D 90 89            [ 2]  420 	pushw	y
      00A31F 89               [ 2]  421 	pushw	x
      00A320 4B 7D            [ 1]  422 	push	#<(__str_10+0)
      00A322 4B 85            [ 1]  423 	push	#((__str_10+0) >> 8)
      00A324 CD 99 C0         [ 4]  424 	call	_mib_printf
      00A327 5B 06            [ 2]  425 	addw	sp, #6
                                    426 ;	./../../mib/stm8s_mib_debug_mem.c: 176: break;
      00A329 20 0D            [ 2]  427 	jra	00126$
                                    428 ;	./../../mib/stm8s_mib_debug_mem.c: 177: default:
      00A32B                        429 00125$:
                                    430 ;	./../../mib/stm8s_mib_debug_mem.c: 178: ccprintf(_DEBUG_CMD_A_, ("Error.\r\n"));
      00A32B 4B 85            [ 1]  431 	push	#<(__str_11+0)
      00A32D 4B 85            [ 1]  432 	push	#((__str_11+0) >> 8)
      00A32F CD 99 C0         [ 4]  433 	call	_mib_printf
      00A332 5B 02            [ 2]  434 	addw	sp, #2
                                    435 ;	./../../mib/stm8s_mib_debug_mem.c: 179: return FALSE;
      00A334 5F               [ 1]  436 	clrw	x
      00A335 CC A8 F3         [ 2]  437 	jp	00235$
                                    438 ;	./../../mib/stm8s_mib_debug_mem.c: 180: }
      00A338                        439 00126$:
                                    440 ;	./../../mib/stm8s_mib_debug_mem.c: 181: ccprintf(_DEBUG_CMD_A_, (".\r\n"));		
      00A338 4B 8E            [ 1]  441 	push	#<(__str_12+0)
      00A33A 4B 85            [ 1]  442 	push	#((__str_12+0) >> 8)
      00A33C CD 99 C0         [ 4]  443 	call	_mib_printf
      00A33F 5B 02            [ 2]  444 	addw	sp, #2
      00A341 CC A8 F1         [ 2]  445 	jp	00216$
      00A344                        446 00212$:
                                    447 ;	./../../mib/stm8s_mib_debug_mem.c: 183: else if (!strcmp(argv[1], "wrn")) // _CMD_MY_WRITE_
      00A344 1E 26            [ 2]  448 	ldw	x, (0x26, sp)
      00A346 FE               [ 2]  449 	ldw	x, (x)
      00A347 4B 92            [ 1]  450 	push	#<(___str_13+0)
      00A349 4B 85            [ 1]  451 	push	#((___str_13+0) >> 8)
      00A34B CD AC 4E         [ 4]  452 	call	_strcmp
      00A34E 5D               [ 2]  453 	tnzw	x
      00A34F 27 03            [ 1]  454 	jreq	00591$
      00A351 CC A4 DB         [ 2]  455 	jp	00209$
      00A354                        456 00591$:
                                    457 ;	./../../mib/stm8s_mib_debug_mem.c: 186: if (argc < 6)
      00A354 1E 2C            [ 2]  458 	ldw	x, (0x2c, sp)
      00A356 A3 00 06         [ 2]  459 	cpw	x, #0x0006
      00A359 2E 0B            [ 1]  460 	jrsge	00128$
                                    461 ;	./../../mib/stm8s_mib_debug_mem.c: 188: MibWriteDebugString(cptr->usage);
      00A35B 1E 24            [ 2]  462 	ldw	x, (0x24, sp)
      00A35D EE 04            [ 2]  463 	ldw	x, (0x4, x)
      00A35F CD 8F AE         [ 4]  464 	call	_MibWriteDebugString
                                    465 ;	./../../mib/stm8s_mib_debug_mem.c: 189: return FALSE;
      00A362 5F               [ 1]  466 	clrw	x
      00A363 CC A8 F3         [ 2]  467 	jp	00235$
      00A366                        468 00128$:
                                    469 ;	./../../mib/stm8s_mib_debug_mem.c: 191: if (!HexToInt(argv[3], &addr, 32))
      00A366 96               [ 1]  470 	ldw	x, sp
      00A367 5C               [ 1]  471 	incw	x
      00A368 51               [ 1]  472 	exgw	x, y
      00A369 1E 2E            [ 2]  473 	ldw	x, (0x2e, sp)
      00A36B EE 06            [ 2]  474 	ldw	x, (0x6, x)
      00A36D 4B 20            [ 1]  475 	push	#0x20
      00A36F 4B 00            [ 1]  476 	push	#0x00
      00A371 90 89            [ 2]  477 	pushw	y
      00A373 CD 9C C1         [ 4]  478 	call	_HexToInt
      00A376 5D               [ 2]  479 	tnzw	x
      00A377 26 0D            [ 1]  480 	jrne	00130$
                                    481 ;	./../../mib/stm8s_mib_debug_mem.c: 193: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A379 4B 0D            [ 1]  482 	push	#<(__str_3+0)
      00A37B 4B 85            [ 1]  483 	push	#((__str_3+0) >> 8)
      00A37D CD 99 C0         [ 4]  484 	call	_mib_printf
      00A380 5B 02            [ 2]  485 	addw	sp, #2
                                    486 ;	./../../mib/stm8s_mib_debug_mem.c: 194: return FALSE;
      00A382 5F               [ 1]  487 	clrw	x
      00A383 CC A8 F3         [ 2]  488 	jp	00235$
      00A386                        489 00130$:
                                    490 ;	./../../mib/stm8s_mib_debug_mem.c: 196: if (!HexToInt(argv[5], &v_Loop, 32))
      00A386 96               [ 1]  491 	ldw	x, sp
      00A387 1C 00 18         [ 2]  492 	addw	x, #24
      00A38A 51               [ 1]  493 	exgw	x, y
      00A38B 1E 2E            [ 2]  494 	ldw	x, (0x2e, sp)
      00A38D EE 0A            [ 2]  495 	ldw	x, (0xa, x)
      00A38F 4B 20            [ 1]  496 	push	#0x20
      00A391 4B 00            [ 1]  497 	push	#0x00
      00A393 90 89            [ 2]  498 	pushw	y
      00A395 CD 9C C1         [ 4]  499 	call	_HexToInt
      00A398 5D               [ 2]  500 	tnzw	x
      00A399 26 0D            [ 1]  501 	jrne	00132$
                                    502 ;	./../../mib/stm8s_mib_debug_mem.c: 198: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A39B 4B 0D            [ 1]  503 	push	#<(__str_3+0)
      00A39D 4B 85            [ 1]  504 	push	#((__str_3+0) >> 8)
      00A39F CD 99 C0         [ 4]  505 	call	_mib_printf
      00A3A2 5B 02            [ 2]  506 	addw	sp, #2
                                    507 ;	./../../mib/stm8s_mib_debug_mem.c: 199: return FALSE;
      00A3A4 5F               [ 1]  508 	clrw	x
      00A3A5 CC A8 F3         [ 2]  509 	jp	00235$
      00A3A8                        510 00132$:
                                    511 ;	./../../mib/stm8s_mib_debug_mem.c: 201: switch (argv[2][0])
      00A3A8 1E 2E            [ 2]  512 	ldw	x, (0x2e, sp)
      00A3AA EE 04            [ 2]  513 	ldw	x, (0x4, x)
      00A3AC F6               [ 1]  514 	ld	a, (x)
      00A3AD A1 63            [ 1]  515 	cp	a, #0x63
      00A3AF 27 0E            [ 1]  516 	jreq	00133$
      00A3B1 A1 6C            [ 1]  517 	cp	a, #0x6c
      00A3B3 26 03            [ 1]  518 	jrne	00599$
      00A3B5 CC A4 6C         [ 2]  519 	jp	00141$
      00A3B8                        520 00599$:
      00A3B8 A1 73            [ 1]  521 	cp	a, #0x73
      00A3BA 27 55            [ 1]  522 	jreq	00137$
      00A3BC CC A4 CB         [ 2]  523 	jp	00145$
                                    524 ;	./../../mib/stm8s_mib_debug_mem.c: 203: case 'c':
      00A3BF                        525 00133$:
                                    526 ;	./../../mib/stm8s_mib_debug_mem.c: 204: if (!HexToInt(argv[4], &c, 8))
      00A3BF 96               [ 1]  527 	ldw	x, sp
      00A3C0 1C 00 05         [ 2]  528 	addw	x, #5
      00A3C3 16 2E            [ 2]  529 	ldw	y, (0x2e, sp)
      00A3C5 90 EE 08         [ 2]  530 	ldw	y, (0x8, y)
      00A3C8 4B 08            [ 1]  531 	push	#0x08
      00A3CA 4B 00            [ 1]  532 	push	#0x00
      00A3CC 89               [ 2]  533 	pushw	x
      00A3CD 93               [ 1]  534 	ldw	x, y
      00A3CE CD 9C C1         [ 4]  535 	call	_HexToInt
      00A3D1 5D               [ 2]  536 	tnzw	x
      00A3D2 26 0D            [ 1]  537 	jrne	00262$
                                    538 ;	./../../mib/stm8s_mib_debug_mem.c: 206: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A3D4 4B 0D            [ 1]  539 	push	#<(__str_3+0)
      00A3D6 4B 85            [ 1]  540 	push	#((__str_3+0) >> 8)
      00A3D8 CD 99 C0         [ 4]  541 	call	_mib_printf
      00A3DB 5B 02            [ 2]  542 	addw	sp, #2
                                    543 ;	./../../mib/stm8s_mib_debug_mem.c: 207: return FALSE;
      00A3DD 5F               [ 1]  544 	clrw	x
      00A3DE CC A8 F3         [ 2]  545 	jp	00235$
      00A3E1                        546 00262$:
      00A3E1 16 1A            [ 2]  547 	ldw	y, (0x1a, sp)
      00A3E3 17 28            [ 2]  548 	ldw	(0x28, sp), y
      00A3E5 16 18            [ 2]  549 	ldw	y, (0x18, sp)
      00A3E7 17 26            [ 2]  550 	ldw	(0x26, sp), y
      00A3E9                        551 00218$:
                                    552 ;	./../../mib/stm8s_mib_debug_mem.c: 209: for (; v_Loop; v_Loop--) wr_ADDR8(addr, c);
      00A3E9 1E 28            [ 2]  553 	ldw	x, (0x28, sp)
      00A3EB 26 07            [ 1]  554 	jrne	00605$
      00A3ED 1E 26            [ 2]  555 	ldw	x, (0x26, sp)
      00A3EF 26 03            [ 1]  556 	jrne	00605$
      00A3F1 CC A8 D5         [ 2]  557 	jp	00301$
      00A3F4                        558 00605$:
      00A3F4 1E 03            [ 2]  559 	ldw	x, (0x03, sp)
      00A3F6 7B 05            [ 1]  560 	ld	a, (0x05, sp)
      00A3F8 F7               [ 1]  561 	ld	(x), a
      00A3F9 1E 28            [ 2]  562 	ldw	x, (0x28, sp)
      00A3FB 1D 00 01         [ 2]  563 	subw	x, #0x0001
      00A3FE 1F 28            [ 2]  564 	ldw	(0x28, sp), x
      00A400 1E 26            [ 2]  565 	ldw	x, (0x26, sp)
      00A402 24 01            [ 1]  566 	jrnc	00606$
      00A404 5A               [ 2]  567 	decw	x
      00A405                        568 00606$:
      00A405 1F 26            [ 2]  569 	ldw	(0x26, sp), x
      00A407 16 28            [ 2]  570 	ldw	y, (0x28, sp)
      00A409 17 1A            [ 2]  571 	ldw	(0x1a, sp), y
      00A40B 16 26            [ 2]  572 	ldw	y, (0x26, sp)
      00A40D 17 18            [ 2]  573 	ldw	(0x18, sp), y
      00A40F 20 D8            [ 2]  574 	jra	00218$
                                    575 ;	./../../mib/stm8s_mib_debug_mem.c: 211: case 's':
      00A411                        576 00137$:
                                    577 ;	./../../mib/stm8s_mib_debug_mem.c: 212: if (!HexToInt(argv[4], &s, 16))
      00A411 16 2E            [ 2]  578 	ldw	y, (0x2e, sp)
      00A413 17 26            [ 2]  579 	ldw	(0x26, sp), y
      00A415 93               [ 1]  580 	ldw	x, y
      00A416 EE 08            [ 2]  581 	ldw	x, (0x8, x)
      00A418 1F 28            [ 2]  582 	ldw	(0x28, sp), x
      00A41A 4B 10            [ 1]  583 	push	#0x10
      00A41C 4B 00            [ 1]  584 	push	#0x00
      00A41E 96               [ 1]  585 	ldw	x, sp
      00A41F 1C 00 08         [ 2]  586 	addw	x, #8
      00A422 89               [ 2]  587 	pushw	x
      00A423 1E 2C            [ 2]  588 	ldw	x, (0x2c, sp)
      00A425 CD 9C C1         [ 4]  589 	call	_HexToInt
      00A428 1F 28            [ 2]  590 	ldw	(0x28, sp), x
      00A42A 26 0D            [ 1]  591 	jrne	00265$
                                    592 ;	./../../mib/stm8s_mib_debug_mem.c: 214: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A42C 4B 0D            [ 1]  593 	push	#<(__str_3+0)
      00A42E 4B 85            [ 1]  594 	push	#((__str_3+0) >> 8)
      00A430 CD 99 C0         [ 4]  595 	call	_mib_printf
      00A433 5B 02            [ 2]  596 	addw	sp, #2
                                    597 ;	./../../mib/stm8s_mib_debug_mem.c: 215: return FALSE;
      00A435 5F               [ 1]  598 	clrw	x
      00A436 CC A8 F3         [ 2]  599 	jp	00235$
      00A439                        600 00265$:
      00A439 16 1A            [ 2]  601 	ldw	y, (0x1a, sp)
      00A43B 17 28            [ 2]  602 	ldw	(0x28, sp), y
      00A43D 16 18            [ 2]  603 	ldw	y, (0x18, sp)
      00A43F 17 26            [ 2]  604 	ldw	(0x26, sp), y
      00A441                        605 00221$:
                                    606 ;	./../../mib/stm8s_mib_debug_mem.c: 217: for (; v_Loop; v_Loop--) wr_ADDR16(addr, s);
      00A441 1E 28            [ 2]  607 	ldw	x, (0x28, sp)
      00A443 26 07            [ 1]  608 	jrne	00608$
      00A445 1E 26            [ 2]  609 	ldw	x, (0x26, sp)
      00A447 26 03            [ 1]  610 	jrne	00608$
      00A449 CC A8 DF         [ 2]  611 	jp	00302$
      00A44C                        612 00608$:
      00A44C 16 03            [ 2]  613 	ldw	y, (0x03, sp)
      00A44E 17 22            [ 2]  614 	ldw	(0x22, sp), y
      00A450 93               [ 1]  615 	ldw	x, y
      00A451 16 06            [ 2]  616 	ldw	y, (0x06, sp)
      00A453 FF               [ 2]  617 	ldw	(x), y
      00A454 1E 28            [ 2]  618 	ldw	x, (0x28, sp)
      00A456 1D 00 01         [ 2]  619 	subw	x, #0x0001
      00A459 1F 28            [ 2]  620 	ldw	(0x28, sp), x
      00A45B 1E 26            [ 2]  621 	ldw	x, (0x26, sp)
      00A45D 24 01            [ 1]  622 	jrnc	00609$
      00A45F 5A               [ 2]  623 	decw	x
      00A460                        624 00609$:
      00A460 1F 26            [ 2]  625 	ldw	(0x26, sp), x
      00A462 16 28            [ 2]  626 	ldw	y, (0x28, sp)
      00A464 17 1A            [ 2]  627 	ldw	(0x1a, sp), y
      00A466 16 26            [ 2]  628 	ldw	y, (0x26, sp)
      00A468 17 18            [ 2]  629 	ldw	(0x18, sp), y
      00A46A 20 D5            [ 2]  630 	jra	00221$
                                    631 ;	./../../mib/stm8s_mib_debug_mem.c: 219: case 'l':
      00A46C                        632 00141$:
                                    633 ;	./../../mib/stm8s_mib_debug_mem.c: 220: if (!HexToInt(argv[4], &l, 32))
      00A46C 16 2E            [ 2]  634 	ldw	y, (0x2e, sp)
      00A46E 17 26            [ 2]  635 	ldw	(0x26, sp), y
      00A470 93               [ 1]  636 	ldw	x, y
      00A471 EE 08            [ 2]  637 	ldw	x, (0x8, x)
      00A473 1F 28            [ 2]  638 	ldw	(0x28, sp), x
      00A475 4B 20            [ 1]  639 	push	#0x20
      00A477 4B 00            [ 1]  640 	push	#0x00
      00A479 96               [ 1]  641 	ldw	x, sp
      00A47A 1C 00 0A         [ 2]  642 	addw	x, #10
      00A47D 89               [ 2]  643 	pushw	x
      00A47E 1E 2C            [ 2]  644 	ldw	x, (0x2c, sp)
      00A480 CD 9C C1         [ 4]  645 	call	_HexToInt
      00A483 1F 28            [ 2]  646 	ldw	(0x28, sp), x
      00A485 26 0D            [ 1]  647 	jrne	00268$
                                    648 ;	./../../mib/stm8s_mib_debug_mem.c: 222: ccprintf(_DEBUG_CMD_A_, ("Illugal character is useqd.\r\n"));
      00A487 4B 2A            [ 1]  649 	push	#<(__str_4+0)
      00A489 4B 85            [ 1]  650 	push	#((__str_4+0) >> 8)
      00A48B CD 99 C0         [ 4]  651 	call	_mib_printf
      00A48E 5B 02            [ 2]  652 	addw	sp, #2
                                    653 ;	./../../mib/stm8s_mib_debug_mem.c: 223: return FALSE;
      00A490 5F               [ 1]  654 	clrw	x
      00A491 CC A8 F3         [ 2]  655 	jp	00235$
      00A494                        656 00268$:
      00A494 16 1A            [ 2]  657 	ldw	y, (0x1a, sp)
      00A496 17 28            [ 2]  658 	ldw	(0x28, sp), y
      00A498 16 18            [ 2]  659 	ldw	y, (0x18, sp)
      00A49A 17 26            [ 2]  660 	ldw	(0x26, sp), y
      00A49C                        661 00224$:
                                    662 ;	./../../mib/stm8s_mib_debug_mem.c: 225: for (; v_Loop; v_Loop--) wr_ADDR32(addr, l);
      00A49C 1E 28            [ 2]  663 	ldw	x, (0x28, sp)
      00A49E 26 07            [ 1]  664 	jrne	00611$
      00A4A0 1E 26            [ 2]  665 	ldw	x, (0x26, sp)
      00A4A2 26 03            [ 1]  666 	jrne	00611$
      00A4A4 CC A8 E9         [ 2]  667 	jp	00303$
      00A4A7                        668 00611$:
      00A4A7 16 03            [ 2]  669 	ldw	y, (0x03, sp)
      00A4A9 17 22            [ 2]  670 	ldw	(0x22, sp), y
      00A4AB 93               [ 1]  671 	ldw	x, y
      00A4AC 16 0A            [ 2]  672 	ldw	y, (0x0a, sp)
      00A4AE EF 02            [ 2]  673 	ldw	(0x2, x), y
      00A4B0 16 08            [ 2]  674 	ldw	y, (0x08, sp)
      00A4B2 FF               [ 2]  675 	ldw	(x), y
      00A4B3 1E 28            [ 2]  676 	ldw	x, (0x28, sp)
      00A4B5 1D 00 01         [ 2]  677 	subw	x, #0x0001
      00A4B8 1F 28            [ 2]  678 	ldw	(0x28, sp), x
      00A4BA 1E 26            [ 2]  679 	ldw	x, (0x26, sp)
      00A4BC 24 01            [ 1]  680 	jrnc	00612$
      00A4BE 5A               [ 2]  681 	decw	x
      00A4BF                        682 00612$:
      00A4BF 1F 26            [ 2]  683 	ldw	(0x26, sp), x
      00A4C1 16 28            [ 2]  684 	ldw	y, (0x28, sp)
      00A4C3 17 1A            [ 2]  685 	ldw	(0x1a, sp), y
      00A4C5 16 26            [ 2]  686 	ldw	y, (0x26, sp)
      00A4C7 17 18            [ 2]  687 	ldw	(0x18, sp), y
      00A4C9 20 D1            [ 2]  688 	jra	00224$
                                    689 ;	./../../mib/stm8s_mib_debug_mem.c: 227: default:
      00A4CB                        690 00145$:
                                    691 ;	./../../mib/stm8s_mib_debug_mem.c: 228: MibWriteDebugString(cptr->usage);
      00A4CB 16 24            [ 2]  692 	ldw	y, (0x24, sp)
      00A4CD 17 26            [ 2]  693 	ldw	(0x26, sp), y
      00A4CF 93               [ 1]  694 	ldw	x, y
      00A4D0 EE 04            [ 2]  695 	ldw	x, (0x4, x)
      00A4D2 1F 28            [ 2]  696 	ldw	(0x28, sp), x
      00A4D4 CD 8F AE         [ 4]  697 	call	_MibWriteDebugString
                                    698 ;	./../../mib/stm8s_mib_debug_mem.c: 229: return FALSE;
      00A4D7 5F               [ 1]  699 	clrw	x
      00A4D8 CC A8 F3         [ 2]  700 	jp	00235$
                                    701 ;	./../../mib/stm8s_mib_debug_mem.c: 230: }	
      00A4DB                        702 00209$:
                                    703 ;	./../../mib/stm8s_mib_debug_mem.c: 232: else if (!strcmp(argv[1], "rdn")) // _CMD_MY_READ_
      00A4DB 1E 26            [ 2]  704 	ldw	x, (0x26, sp)
      00A4DD FE               [ 2]  705 	ldw	x, (x)
      00A4DE 1F 28            [ 2]  706 	ldw	(0x28, sp), x
      00A4E0 4B 96            [ 1]  707 	push	#<(___str_14+0)
      00A4E2 4B 85            [ 1]  708 	push	#((___str_14+0) >> 8)
      00A4E4 1E 2A            [ 2]  709 	ldw	x, (0x2a, sp)
      00A4E6 CD AC 4E         [ 4]  710 	call	_strcmp
      00A4E9 1F 28            [ 2]  711 	ldw	(0x28, sp), x
      00A4EB 27 03            [ 1]  712 	jreq	00613$
      00A4ED CC A6 CE         [ 2]  713 	jp	00206$
      00A4F0                        714 00613$:
                                    715 ;	./../../mib/stm8s_mib_debug_mem.c: 235: if (argc < 5)
      00A4F0 1E 2C            [ 2]  716 	ldw	x, (0x2c, sp)
      00A4F2 A3 00 05         [ 2]  717 	cpw	x, #0x0005
      00A4F5 2E 10            [ 1]  718 	jrsge	00148$
                                    719 ;	./../../mib/stm8s_mib_debug_mem.c: 237: MibWriteDebugString(cptr->usage);
      00A4F7 16 24            [ 2]  720 	ldw	y, (0x24, sp)
      00A4F9 17 26            [ 2]  721 	ldw	(0x26, sp), y
      00A4FB 93               [ 1]  722 	ldw	x, y
      00A4FC EE 04            [ 2]  723 	ldw	x, (0x4, x)
      00A4FE 1F 28            [ 2]  724 	ldw	(0x28, sp), x
      00A500 CD 8F AE         [ 4]  725 	call	_MibWriteDebugString
                                    726 ;	./../../mib/stm8s_mib_debug_mem.c: 238: return FALSE;
      00A503 5F               [ 1]  727 	clrw	x
      00A504 CC A8 F3         [ 2]  728 	jp	00235$
      00A507                        729 00148$:
                                    730 ;	./../../mib/stm8s_mib_debug_mem.c: 240: if (!HexToInt(argv[3], &addr, 32))
      00A507 16 2E            [ 2]  731 	ldw	y, (0x2e, sp)
      00A509 17 26            [ 2]  732 	ldw	(0x26, sp), y
      00A50B 93               [ 1]  733 	ldw	x, y
      00A50C EE 06            [ 2]  734 	ldw	x, (0x6, x)
      00A50E 1F 28            [ 2]  735 	ldw	(0x28, sp), x
      00A510 4B 20            [ 1]  736 	push	#0x20
      00A512 4B 00            [ 1]  737 	push	#0x00
      00A514 96               [ 1]  738 	ldw	x, sp
      00A515 1C 00 03         [ 2]  739 	addw	x, #3
      00A518 89               [ 2]  740 	pushw	x
      00A519 1E 2C            [ 2]  741 	ldw	x, (0x2c, sp)
      00A51B CD 9C C1         [ 4]  742 	call	_HexToInt
      00A51E 1F 28            [ 2]  743 	ldw	(0x28, sp), x
      00A520 26 0D            [ 1]  744 	jrne	00150$
                                    745 ;	./../../mib/stm8s_mib_debug_mem.c: 242: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A522 4B 0D            [ 1]  746 	push	#<(__str_3+0)
      00A524 4B 85            [ 1]  747 	push	#((__str_3+0) >> 8)
      00A526 CD 99 C0         [ 4]  748 	call	_mib_printf
      00A529 5B 02            [ 2]  749 	addw	sp, #2
                                    750 ;	./../../mib/stm8s_mib_debug_mem.c: 243: return FALSE;
      00A52B 5F               [ 1]  751 	clrw	x
      00A52C CC A8 F3         [ 2]  752 	jp	00235$
      00A52F                        753 00150$:
                                    754 ;	./../../mib/stm8s_mib_debug_mem.c: 245: if (!HexToInt(argv[4], &v_Loop, 32))
      00A52F 16 2E            [ 2]  755 	ldw	y, (0x2e, sp)
      00A531 17 26            [ 2]  756 	ldw	(0x26, sp), y
      00A533 93               [ 1]  757 	ldw	x, y
      00A534 EE 08            [ 2]  758 	ldw	x, (0x8, x)
      00A536 1F 28            [ 2]  759 	ldw	(0x28, sp), x
      00A538 4B 20            [ 1]  760 	push	#0x20
      00A53A 4B 00            [ 1]  761 	push	#0x00
      00A53C 96               [ 1]  762 	ldw	x, sp
      00A53D 1C 00 1A         [ 2]  763 	addw	x, #26
      00A540 89               [ 2]  764 	pushw	x
      00A541 1E 2C            [ 2]  765 	ldw	x, (0x2c, sp)
      00A543 CD 9C C1         [ 4]  766 	call	_HexToInt
      00A546 1F 28            [ 2]  767 	ldw	(0x28, sp), x
      00A548 26 0D            [ 1]  768 	jrne	00152$
                                    769 ;	./../../mib/stm8s_mib_debug_mem.c: 247: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A54A 4B 0D            [ 1]  770 	push	#<(__str_3+0)
      00A54C 4B 85            [ 1]  771 	push	#((__str_3+0) >> 8)
      00A54E CD 99 C0         [ 4]  772 	call	_mib_printf
      00A551 5B 02            [ 2]  773 	addw	sp, #2
                                    774 ;	./../../mib/stm8s_mib_debug_mem.c: 248: return FALSE;
      00A553 5F               [ 1]  775 	clrw	x
      00A554 CC A8 F3         [ 2]  776 	jp	00235$
      00A557                        777 00152$:
                                    778 ;	./../../mib/stm8s_mib_debug_mem.c: 250: ccprintf(_DEBUG_CMD_A_,("\taddress : 0x%08lx  ", addr));
      00A557 1E 03            [ 2]  779 	ldw	x, (0x03, sp)
      00A559 89               [ 2]  780 	pushw	x
      00A55A 1E 03            [ 2]  781 	ldw	x, (0x03, sp)
      00A55C 89               [ 2]  782 	pushw	x
      00A55D 4B 4D            [ 1]  783 	push	#<(__str_6+0)
      00A55F 4B 85            [ 1]  784 	push	#((__str_6+0) >> 8)
      00A561 CD 99 C0         [ 4]  785 	call	_mib_printf
      00A564 5B 06            [ 2]  786 	addw	sp, #6
                                    787 ;	./../../mib/stm8s_mib_debug_mem.c: 251: ccprintf(_DEBUG_CMD_A_,("loop : 0x%08lx  \r\n", v_Loop));
      00A566 1E 1A            [ 2]  788 	ldw	x, (0x1a, sp)
      00A568 89               [ 2]  789 	pushw	x
      00A569 1E 1A            [ 2]  790 	ldw	x, (0x1a, sp)
      00A56B 89               [ 2]  791 	pushw	x
      00A56C 4B 9A            [ 1]  792 	push	#<(__str_15+0)
      00A56E 4B 85            [ 1]  793 	push	#((__str_15+0) >> 8)
      00A570 CD 99 C0         [ 4]  794 	call	_mib_printf
      00A573 5B 06            [ 2]  795 	addw	sp, #6
                                    796 ;	./../../mib/stm8s_mib_debug_mem.c: 252: ccprintf(_DEBUG_CMD_A_, ("value   : "));
      00A575 4B AD            [ 1]  797 	push	#<(__str_16+0)
      00A577 4B 85            [ 1]  798 	push	#((__str_16+0) >> 8)
      00A579 CD 99 C0         [ 4]  799 	call	_mib_printf
      00A57C 5B 02            [ 2]  800 	addw	sp, #2
                                    801 ;	./../../mib/stm8s_mib_debug_mem.c: 253: switch (argv[2][0])
      00A57E 16 2E            [ 2]  802 	ldw	y, (0x2e, sp)
      00A580 17 26            [ 2]  803 	ldw	(0x26, sp), y
      00A582 93               [ 1]  804 	ldw	x, y
      00A583 EE 04            [ 2]  805 	ldw	x, (0x4, x)
      00A585 1F 28            [ 2]  806 	ldw	(0x28, sp), x
      00A587 F6               [ 1]  807 	ld	a, (x)
      00A588 A1 63            [ 1]  808 	cp	a, #0x63
      00A58A 27 0E            [ 1]  809 	jreq	00278$
      00A58C A1 6C            [ 1]  810 	cp	a, #0x6c
      00A58E 26 03            [ 1]  811 	jrne	00621$
      00A590 CC A6 3F         [ 2]  812 	jp	00284$
      00A593                        813 00621$:
      00A593 A1 73            [ 1]  814 	cp	a, #0x73
      00A595 27 59            [ 1]  815 	jreq	00281$
      00A597 CC A6 99         [ 2]  816 	jp	00165$
                                    817 ;	./../../mib/stm8s_mib_debug_mem.c: 255: case 'c':
      00A59A                        818 00278$:
      00A59A 16 1A            [ 2]  819 	ldw	y, (0x1a, sp)
      00A59C 17 28            [ 2]  820 	ldw	(0x28, sp), y
      00A59E 16 18            [ 2]  821 	ldw	y, (0x18, sp)
      00A5A0 17 26            [ 2]  822 	ldw	(0x26, sp), y
      00A5A2                        823 00227$:
                                    824 ;	./../../mib/stm8s_mib_debug_mem.c: 256: for (; v_Loop; v_Loop--)
      00A5A2 1E 28            [ 2]  825 	ldw	x, (0x28, sp)
      00A5A4 26 07            [ 1]  826 	jrne	00626$
      00A5A6 1E 26            [ 2]  827 	ldw	x, (0x26, sp)
      00A5A8 26 03            [ 1]  828 	jrne	00626$
      00A5AA CC A6 A6         [ 2]  829 	jp	00304$
      00A5AD                        830 00626$:
                                    831 ;	./../../mib/stm8s_mib_debug_mem.c: 258: c = rd_ADDR8(addr);
      00A5AD 16 03            [ 2]  832 	ldw	y, (0x03, sp)
      00A5AF 17 22            [ 2]  833 	ldw	(0x22, sp), y
      00A5B1 93               [ 1]  834 	ldw	x, y
      00A5B2 F6               [ 1]  835 	ld	a, (x)
      00A5B3 6B 1F            [ 1]  836 	ld	(0x1f, sp), a
      00A5B5 6B 05            [ 1]  837 	ld	(0x05, sp), a
                                    838 ;	./../../mib/stm8s_mib_debug_mem.c: 259: if ((v_Loop & 0xfffff) == 0)
      00A5B7 16 28            [ 2]  839 	ldw	y, (0x28, sp)
      00A5B9 17 22            [ 2]  840 	ldw	(0x22, sp), y
      00A5BB 7B 27            [ 1]  841 	ld	a, (0x27, sp)
      00A5BD A4 0F            [ 1]  842 	and	a, #0x0f
      00A5BF 6B 21            [ 1]  843 	ld	(0x21, sp), a
      00A5C1 0F 20            [ 1]  844 	clr	(0x20, sp)
      00A5C3 1E 22            [ 2]  845 	ldw	x, (0x22, sp)
      00A5C5 26 11            [ 1]  846 	jrne	00228$
                                    847 ;	./../../mib/stm8s_mib_debug_mem.c: 261: ccprintf(_DEBUG_CMD_A_,("0x%02x ", c));
      00A5C7 1E 20            [ 2]  848 	ldw	x, (0x20, sp)
      00A5C9 26 0D            [ 1]  849 	jrne	00228$
      00A5CB 7B 1F            [ 1]  850 	ld	a, (0x1f, sp)
      00A5CD 97               [ 1]  851 	ld	xl, a
      00A5CE 89               [ 2]  852 	pushw	x
      00A5CF 4B 6E            [ 1]  853 	push	#<(__str_8+0)
      00A5D1 4B 85            [ 1]  854 	push	#((__str_8+0) >> 8)
      00A5D3 CD 99 C0         [ 4]  855 	call	_mib_printf
      00A5D6 5B 04            [ 2]  856 	addw	sp, #4
      00A5D8                        857 00228$:
                                    858 ;	./../../mib/stm8s_mib_debug_mem.c: 256: for (; v_Loop; v_Loop--)
      00A5D8 1E 28            [ 2]  859 	ldw	x, (0x28, sp)
      00A5DA 1D 00 01         [ 2]  860 	subw	x, #0x0001
      00A5DD 1F 28            [ 2]  861 	ldw	(0x28, sp), x
      00A5DF 1E 26            [ 2]  862 	ldw	x, (0x26, sp)
      00A5E1 24 01            [ 1]  863 	jrnc	00629$
      00A5E3 5A               [ 2]  864 	decw	x
      00A5E4                        865 00629$:
      00A5E4 1F 26            [ 2]  866 	ldw	(0x26, sp), x
      00A5E6 16 28            [ 2]  867 	ldw	y, (0x28, sp)
      00A5E8 17 1A            [ 2]  868 	ldw	(0x1a, sp), y
      00A5EA 16 26            [ 2]  869 	ldw	y, (0x26, sp)
      00A5EC 17 18            [ 2]  870 	ldw	(0x18, sp), y
      00A5EE 20 B2            [ 2]  871 	jra	00227$
                                    872 ;	./../../mib/stm8s_mib_debug_mem.c: 265: case 's':
      00A5F0                        873 00281$:
      00A5F0 16 1A            [ 2]  874 	ldw	y, (0x1a, sp)
      00A5F2 17 28            [ 2]  875 	ldw	(0x28, sp), y
      00A5F4 16 18            [ 2]  876 	ldw	y, (0x18, sp)
      00A5F6 17 26            [ 2]  877 	ldw	(0x26, sp), y
      00A5F8                        878 00230$:
                                    879 ;	./../../mib/stm8s_mib_debug_mem.c: 266: for (; v_Loop; v_Loop--)
      00A5F8 1E 28            [ 2]  880 	ldw	x, (0x28, sp)
      00A5FA 26 07            [ 1]  881 	jrne	00630$
      00A5FC 1E 26            [ 2]  882 	ldw	x, (0x26, sp)
      00A5FE 26 03            [ 1]  883 	jrne	00630$
      00A600 CC A6 B0         [ 2]  884 	jp	00305$
      00A603                        885 00630$:
                                    886 ;	./../../mib/stm8s_mib_debug_mem.c: 268: s = rd_ADDR16(addr);
      00A603 1E 03            [ 2]  887 	ldw	x, (0x03, sp)
      00A605 FE               [ 2]  888 	ldw	x, (x)
      00A606 1F 1E            [ 2]  889 	ldw	(0x1e, sp), x
      00A608 1F 06            [ 2]  890 	ldw	(0x06, sp), x
                                    891 ;	./../../mib/stm8s_mib_debug_mem.c: 269: if ((v_Loop & 0xfffff) == 0)
      00A60A 16 28            [ 2]  892 	ldw	y, (0x28, sp)
      00A60C 17 22            [ 2]  893 	ldw	(0x22, sp), y
      00A60E 5F               [ 1]  894 	clrw	x
      00A60F 7B 27            [ 1]  895 	ld	a, (0x27, sp)
      00A611 A4 0F            [ 1]  896 	and	a, #0x0f
      00A613 97               [ 1]  897 	ld	xl, a
      00A614 16 22            [ 2]  898 	ldw	y, (0x22, sp)
      00A616 26 0F            [ 1]  899 	jrne	00231$
      00A618 5D               [ 2]  900 	tnzw	x
      00A619 26 0C            [ 1]  901 	jrne	00231$
                                    902 ;	./../../mib/stm8s_mib_debug_mem.c: 271: ccprintf(_DEBUG_CMD_A_,("0x%04x ", s));
      00A61B 1E 1E            [ 2]  903 	ldw	x, (0x1e, sp)
      00A61D 89               [ 2]  904 	pushw	x
      00A61E 4B B8            [ 1]  905 	push	#<(__str_17+0)
      00A620 4B 85            [ 1]  906 	push	#((__str_17+0) >> 8)
      00A622 CD 99 C0         [ 4]  907 	call	_mib_printf
      00A625 5B 04            [ 2]  908 	addw	sp, #4
      00A627                        909 00231$:
                                    910 ;	./../../mib/stm8s_mib_debug_mem.c: 266: for (; v_Loop; v_Loop--)
      00A627 1E 28            [ 2]  911 	ldw	x, (0x28, sp)
      00A629 1D 00 01         [ 2]  912 	subw	x, #0x0001
      00A62C 1F 28            [ 2]  913 	ldw	(0x28, sp), x
      00A62E 1E 26            [ 2]  914 	ldw	x, (0x26, sp)
      00A630 24 01            [ 1]  915 	jrnc	00633$
      00A632 5A               [ 2]  916 	decw	x
      00A633                        917 00633$:
      00A633 1F 26            [ 2]  918 	ldw	(0x26, sp), x
      00A635 16 28            [ 2]  919 	ldw	y, (0x28, sp)
      00A637 17 1A            [ 2]  920 	ldw	(0x1a, sp), y
      00A639 16 26            [ 2]  921 	ldw	y, (0x26, sp)
      00A63B 17 18            [ 2]  922 	ldw	(0x18, sp), y
      00A63D 20 B9            [ 2]  923 	jra	00230$
                                    924 ;	./../../mib/stm8s_mib_debug_mem.c: 275: case 'l':
      00A63F                        925 00284$:
      00A63F 16 1A            [ 2]  926 	ldw	y, (0x1a, sp)
      00A641 17 28            [ 2]  927 	ldw	(0x28, sp), y
      00A643 16 18            [ 2]  928 	ldw	y, (0x18, sp)
      00A645 17 26            [ 2]  929 	ldw	(0x26, sp), y
      00A647                        930 00233$:
                                    931 ;	./../../mib/stm8s_mib_debug_mem.c: 276: for (; v_Loop; v_Loop--)
      00A647 1E 28            [ 2]  932 	ldw	x, (0x28, sp)
      00A649 26 04            [ 1]  933 	jrne	00634$
      00A64B 1E 26            [ 2]  934 	ldw	x, (0x26, sp)
      00A64D 27 6B            [ 1]  935 	jreq	00306$
      00A64F                        936 00634$:
                                    937 ;	./../../mib/stm8s_mib_debug_mem.c: 278: l = rd_ADDR32(addr);
      00A64F 1E 03            [ 2]  938 	ldw	x, (0x03, sp)
      00A651 90 93            [ 1]  939 	ldw	y, x
      00A653 90 EE 02         [ 2]  940 	ldw	y, (0x2, y)
      00A656 FE               [ 2]  941 	ldw	x, (x)
      00A657 1F 1C            [ 2]  942 	ldw	(0x1c, sp), x
      00A659 17 0A            [ 2]  943 	ldw	(0x0a, sp), y
      00A65B 1E 1C            [ 2]  944 	ldw	x, (0x1c, sp)
      00A65D 1F 08            [ 2]  945 	ldw	(0x08, sp), x
                                    946 ;	./../../mib/stm8s_mib_debug_mem.c: 279: if ((v_Loop & 0xfffff) == 0)
      00A65F 1E 28            [ 2]  947 	ldw	x, (0x28, sp)
      00A661 1F 22            [ 2]  948 	ldw	(0x22, sp), x
      00A663 7B 27            [ 1]  949 	ld	a, (0x27, sp)
      00A665 A4 0F            [ 1]  950 	and	a, #0x0f
      00A667 6B 21            [ 1]  951 	ld	(0x21, sp), a
      00A669 0F 20            [ 1]  952 	clr	(0x20, sp)
      00A66B 1E 22            [ 2]  953 	ldw	x, (0x22, sp)
      00A66D 26 12            [ 1]  954 	jrne	00234$
      00A66F 1E 20            [ 2]  955 	ldw	x, (0x20, sp)
      00A671 26 0E            [ 1]  956 	jrne	00234$
                                    957 ;	./../../mib/stm8s_mib_debug_mem.c: 281: ccprintf(_DEBUG_CMD_A_,("0x%08lx ", l));
      00A673 90 89            [ 2]  958 	pushw	y
      00A675 1E 1E            [ 2]  959 	ldw	x, (0x1e, sp)
      00A677 89               [ 2]  960 	pushw	x
      00A678 4B C0            [ 1]  961 	push	#<(__str_18+0)
      00A67A 4B 85            [ 1]  962 	push	#((__str_18+0) >> 8)
      00A67C CD 99 C0         [ 4]  963 	call	_mib_printf
      00A67F 5B 06            [ 2]  964 	addw	sp, #6
      00A681                        965 00234$:
                                    966 ;	./../../mib/stm8s_mib_debug_mem.c: 276: for (; v_Loop; v_Loop--)
      00A681 1E 28            [ 2]  967 	ldw	x, (0x28, sp)
      00A683 1D 00 01         [ 2]  968 	subw	x, #0x0001
      00A686 1F 28            [ 2]  969 	ldw	(0x28, sp), x
      00A688 1E 26            [ 2]  970 	ldw	x, (0x26, sp)
      00A68A 24 01            [ 1]  971 	jrnc	00637$
      00A68C 5A               [ 2]  972 	decw	x
      00A68D                        973 00637$:
      00A68D 1F 26            [ 2]  974 	ldw	(0x26, sp), x
      00A68F 16 28            [ 2]  975 	ldw	y, (0x28, sp)
      00A691 17 1A            [ 2]  976 	ldw	(0x1a, sp), y
      00A693 16 26            [ 2]  977 	ldw	y, (0x26, sp)
      00A695 17 18            [ 2]  978 	ldw	(0x18, sp), y
      00A697 20 AE            [ 2]  979 	jra	00233$
                                    980 ;	./../../mib/stm8s_mib_debug_mem.c: 285: default:
      00A699                        981 00165$:
                                    982 ;	./../../mib/stm8s_mib_debug_mem.c: 286: ccprintf(_DEBUG_CMD_A_, ("Error.\r\n"));
      00A699 4B 85            [ 1]  983 	push	#<(__str_11+0)
      00A69B 4B 85            [ 1]  984 	push	#((__str_11+0) >> 8)
      00A69D CD 99 C0         [ 4]  985 	call	_mib_printf
      00A6A0 5B 02            [ 2]  986 	addw	sp, #2
                                    987 ;	./../../mib/stm8s_mib_debug_mem.c: 287: return FALSE;
      00A6A2 5F               [ 1]  988 	clrw	x
      00A6A3 CC A8 F3         [ 2]  989 	jp	00235$
                                    990 ;	./../../mib/stm8s_mib_debug_mem.c: 288: }
      00A6A6                        991 00304$:
      00A6A6 16 28            [ 2]  992 	ldw	y, (0x28, sp)
      00A6A8 17 1A            [ 2]  993 	ldw	(0x1a, sp), y
      00A6AA 16 26            [ 2]  994 	ldw	y, (0x26, sp)
      00A6AC 17 18            [ 2]  995 	ldw	(0x18, sp), y
                                    996 ;	./../../mib/stm8s_mib_debug_mem.c: 352: return FALSE;
      00A6AE 20 12            [ 2]  997 	jra	00166$
                                    998 ;	./../../mib/stm8s_mib_debug_mem.c: 288: }
      00A6B0                        999 00305$:
      00A6B0 16 28            [ 2] 1000 	ldw	y, (0x28, sp)
      00A6B2 17 1A            [ 2] 1001 	ldw	(0x1a, sp), y
      00A6B4 16 26            [ 2] 1002 	ldw	y, (0x26, sp)
      00A6B6 17 18            [ 2] 1003 	ldw	(0x18, sp), y
                                   1004 ;	./../../mib/stm8s_mib_debug_mem.c: 352: return FALSE;
      00A6B8 20 08            [ 2] 1005 	jra	00166$
                                   1006 ;	./../../mib/stm8s_mib_debug_mem.c: 288: }
      00A6BA                       1007 00306$:
      00A6BA 16 28            [ 2] 1008 	ldw	y, (0x28, sp)
      00A6BC 17 1A            [ 2] 1009 	ldw	(0x1a, sp), y
      00A6BE 16 26            [ 2] 1010 	ldw	y, (0x26, sp)
      00A6C0 17 18            [ 2] 1011 	ldw	(0x18, sp), y
      00A6C2                       1012 00166$:
                                   1013 ;	./../../mib/stm8s_mib_debug_mem.c: 289: ccprintf(_DEBUG_CMD_A_, (".\r\n"));
      00A6C2 4B 8E            [ 1] 1014 	push	#<(__str_12+0)
      00A6C4 4B 85            [ 1] 1015 	push	#((__str_12+0) >> 8)
      00A6C6 CD 99 C0         [ 4] 1016 	call	_mib_printf
      00A6C9 5B 02            [ 2] 1017 	addw	sp, #2
      00A6CB CC A8 F1         [ 2] 1018 	jp	00216$
      00A6CE                       1019 00206$:
                                   1020 ;	./../../mib/stm8s_mib_debug_mem.c: 291: else if (!strcmp(argv[1], "hdump")) 	// _CMD_MY_HEXDUMP_
      00A6CE 1E 26            [ 2] 1021 	ldw	x, (0x26, sp)
      00A6D0 FE               [ 2] 1022 	ldw	x, (x)
      00A6D1 4B C9            [ 1] 1023 	push	#<(___str_19+0)
      00A6D3 4B 85            [ 1] 1024 	push	#((___str_19+0) >> 8)
      00A6D5 CD AC 4E         [ 4] 1025 	call	_strcmp
      00A6D8 5D               [ 2] 1026 	tnzw	x
      00A6D9 26 5B            [ 1] 1027 	jrne	00203$
                                   1028 ;	./../../mib/stm8s_mib_debug_mem.c: 293: if (argc < 4)
      00A6DB 1E 2C            [ 2] 1029 	ldw	x, (0x2c, sp)
      00A6DD A3 00 04         [ 2] 1030 	cpw	x, #0x0004
      00A6E0 2E 0B            [ 1] 1031 	jrsge	00168$
                                   1032 ;	./../../mib/stm8s_mib_debug_mem.c: 295: MibWriteDebugString(cptr->usage);
      00A6E2 1E 24            [ 2] 1033 	ldw	x, (0x24, sp)
      00A6E4 EE 04            [ 2] 1034 	ldw	x, (0x4, x)
      00A6E6 CD 8F AE         [ 4] 1035 	call	_MibWriteDebugString
                                   1036 ;	./../../mib/stm8s_mib_debug_mem.c: 296: return FALSE;
      00A6E9 5F               [ 1] 1037 	clrw	x
      00A6EA CC A8 F3         [ 2] 1038 	jp	00235$
      00A6ED                       1039 00168$:
                                   1040 ;	./../../mib/stm8s_mib_debug_mem.c: 298: if (!HexToInt(argv[2], &addr, 32) || !HexToInt(argv[3], &len, 32))
      00A6ED 16 2E            [ 2] 1041 	ldw	y, (0x2e, sp)
      00A6EF 90 EE 04         [ 2] 1042 	ldw	y, (0x4, y)
      00A6F2 4B 20            [ 1] 1043 	push	#0x20
      00A6F4 4B 00            [ 1] 1044 	push	#0x00
      00A6F6 96               [ 1] 1045 	ldw	x, sp
      00A6F7 1C 00 03         [ 2] 1046 	addw	x, #3
      00A6FA 89               [ 2] 1047 	pushw	x
      00A6FB 93               [ 1] 1048 	ldw	x, y
      00A6FC CD 9C C1         [ 4] 1049 	call	_HexToInt
      00A6FF 5D               [ 2] 1050 	tnzw	x
      00A700 27 15            [ 1] 1051 	jreq	00169$
      00A702 16 2E            [ 2] 1052 	ldw	y, (0x2e, sp)
      00A704 90 EE 06         [ 2] 1053 	ldw	y, (0x6, y)
      00A707 4B 20            [ 1] 1054 	push	#0x20
      00A709 4B 00            [ 1] 1055 	push	#0x00
      00A70B 96               [ 1] 1056 	ldw	x, sp
      00A70C 1C 00 16         [ 2] 1057 	addw	x, #22
      00A70F 89               [ 2] 1058 	pushw	x
      00A710 93               [ 1] 1059 	ldw	x, y
      00A711 CD 9C C1         [ 4] 1060 	call	_HexToInt
      00A714 5D               [ 2] 1061 	tnzw	x
      00A715 26 0D            [ 1] 1062 	jrne	00170$
      00A717                       1063 00169$:
                                   1064 ;	./../../mib/stm8s_mib_debug_mem.c: 300: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A717 4B 0D            [ 1] 1065 	push	#<(__str_3+0)
      00A719 4B 85            [ 1] 1066 	push	#((__str_3+0) >> 8)
      00A71B CD 99 C0         [ 4] 1067 	call	_mib_printf
      00A71E 5B 02            [ 2] 1068 	addw	sp, #2
                                   1069 ;	./../../mib/stm8s_mib_debug_mem.c: 301: return FALSE;
      00A720 5F               [ 1] 1070 	clrw	x
      00A721 CC A8 F3         [ 2] 1071 	jp	00235$
      00A724                       1072 00170$:
                                   1073 ;	./../../mib/stm8s_mib_debug_mem.c: 303: HexDump(addr, len);		
      00A724 1E 16            [ 2] 1074 	ldw	x, (0x16, sp)
      00A726 89               [ 2] 1075 	pushw	x
      00A727 1E 16            [ 2] 1076 	ldw	x, (0x16, sp)
      00A729 89               [ 2] 1077 	pushw	x
      00A72A 1E 07            [ 2] 1078 	ldw	x, (0x07, sp)
      00A72C 89               [ 2] 1079 	pushw	x
      00A72D 1E 07            [ 2] 1080 	ldw	x, (0x07, sp)
      00A72F 89               [ 2] 1081 	pushw	x
      00A730 CD 9E 35         [ 4] 1082 	call	_HexDump
      00A733 CC A8 F1         [ 2] 1083 	jp	00216$
      00A736                       1084 00203$:
                                   1085 ;	./../../mib/stm8s_mib_debug_mem.c: 305: else if (!strcmp(argv[1], "cpy")) // _CMD_MY_MEMCPY_
      00A736 1E 26            [ 2] 1086 	ldw	x, (0x26, sp)
      00A738 FE               [ 2] 1087 	ldw	x, (x)
      00A739 4B CF            [ 1] 1088 	push	#<(___str_20+0)
      00A73B 4B 85            [ 1] 1089 	push	#((___str_20+0) >> 8)
      00A73D CD AC 4E         [ 4] 1090 	call	_strcmp
      00A740 5D               [ 2] 1091 	tnzw	x
      00A741 26 71            [ 1] 1092 	jrne	00200$
                                   1093 ;	./../../mib/stm8s_mib_debug_mem.c: 307: if (argc < 5)
      00A743 1E 2C            [ 2] 1094 	ldw	x, (0x2c, sp)
      00A745 A3 00 05         [ 2] 1095 	cpw	x, #0x0005
      00A748 2E 0B            [ 1] 1096 	jrsge	00173$
                                   1097 ;	./../../mib/stm8s_mib_debug_mem.c: 309: MibWriteDebugString(cptr->usage);
      00A74A 1E 24            [ 2] 1098 	ldw	x, (0x24, sp)
      00A74C EE 04            [ 2] 1099 	ldw	x, (0x4, x)
      00A74E CD 8F AE         [ 4] 1100 	call	_MibWriteDebugString
                                   1101 ;	./../../mib/stm8s_mib_debug_mem.c: 310: return FALSE;
      00A751 5F               [ 1] 1102 	clrw	x
      00A752 CC A8 F3         [ 2] 1103 	jp	00235$
      00A755                       1104 00173$:
                                   1105 ;	./../../mib/stm8s_mib_debug_mem.c: 312: if (!HexToInt(argv[2], &dest, 32) || !HexToInt(argv[3], &src, 32) || !HexToInt(argv[4], &len, 32))
      00A755 16 2E            [ 2] 1106 	ldw	y, (0x2e, sp)
      00A757 90 EE 04         [ 2] 1107 	ldw	y, (0x4, y)
      00A75A 4B 20            [ 1] 1108 	push	#0x20
      00A75C 4B 00            [ 1] 1109 	push	#0x00
      00A75E 96               [ 1] 1110 	ldw	x, sp
      00A75F 1C 00 0E         [ 2] 1111 	addw	x, #14
      00A762 89               [ 2] 1112 	pushw	x
      00A763 93               [ 1] 1113 	ldw	x, y
      00A764 CD 9C C1         [ 4] 1114 	call	_HexToInt
      00A767 5D               [ 2] 1115 	tnzw	x
      00A768 27 2A            [ 1] 1116 	jreq	00174$
      00A76A 16 2E            [ 2] 1117 	ldw	y, (0x2e, sp)
      00A76C 90 EE 06         [ 2] 1118 	ldw	y, (0x6, y)
      00A76F 4B 20            [ 1] 1119 	push	#0x20
      00A771 4B 00            [ 1] 1120 	push	#0x00
      00A773 96               [ 1] 1121 	ldw	x, sp
      00A774 1C 00 12         [ 2] 1122 	addw	x, #18
      00A777 89               [ 2] 1123 	pushw	x
      00A778 93               [ 1] 1124 	ldw	x, y
      00A779 CD 9C C1         [ 4] 1125 	call	_HexToInt
      00A77C 5D               [ 2] 1126 	tnzw	x
      00A77D 27 15            [ 1] 1127 	jreq	00174$
      00A77F 16 2E            [ 2] 1128 	ldw	y, (0x2e, sp)
      00A781 90 EE 08         [ 2] 1129 	ldw	y, (0x8, y)
      00A784 4B 20            [ 1] 1130 	push	#0x20
      00A786 4B 00            [ 1] 1131 	push	#0x00
      00A788 96               [ 1] 1132 	ldw	x, sp
      00A789 1C 00 16         [ 2] 1133 	addw	x, #22
      00A78C 89               [ 2] 1134 	pushw	x
      00A78D 93               [ 1] 1135 	ldw	x, y
      00A78E CD 9C C1         [ 4] 1136 	call	_HexToInt
      00A791 5D               [ 2] 1137 	tnzw	x
      00A792 26 0D            [ 1] 1138 	jrne	00175$
      00A794                       1139 00174$:
                                   1140 ;	./../../mib/stm8s_mib_debug_mem.c: 314: ccprintf(_DEBUG_CMD_A_, ("Illegal character is used.\r\n"));
      00A794 4B D3            [ 1] 1141 	push	#<(__str_21+0)
      00A796 4B 85            [ 1] 1142 	push	#((__str_21+0) >> 8)
      00A798 CD 99 C0         [ 4] 1143 	call	_mib_printf
      00A79B 5B 02            [ 2] 1144 	addw	sp, #2
                                   1145 ;	./../../mib/stm8s_mib_debug_mem.c: 315: return FALSE;
      00A79D 5F               [ 1] 1146 	clrw	x
      00A79E CC A8 F3         [ 2] 1147 	jp	00235$
      00A7A1                       1148 00175$:
                                   1149 ;	./../../mib/stm8s_mib_debug_mem.c: 317: memcpy((char *)dest, (char *)src, len);		
      00A7A1 1E 16            [ 2] 1150 	ldw	x, (0x16, sp)
      00A7A3 16 12            [ 2] 1151 	ldw	y, (0x12, sp)
      00A7A5 17 28            [ 2] 1152 	ldw	(0x28, sp), y
      00A7A7 16 0E            [ 2] 1153 	ldw	y, (0x0e, sp)
      00A7A9 89               [ 2] 1154 	pushw	x
      00A7AA 1E 2A            [ 2] 1155 	ldw	x, (0x2a, sp)
      00A7AC 89               [ 2] 1156 	pushw	x
      00A7AD 93               [ 1] 1157 	ldw	x, y
      00A7AE CD AB CA         [ 4] 1158 	call	___memcpy
      00A7B1 CC A8 F1         [ 2] 1159 	jp	00216$
      00A7B4                       1160 00200$:
                                   1161 ;	./../../mib/stm8s_mib_debug_mem.c: 319: else if (!strcmp(argv[1], "cmp")) // _CMD_MY_MEMCMP_
      00A7B4 1E 26            [ 2] 1162 	ldw	x, (0x26, sp)
      00A7B6 FE               [ 2] 1163 	ldw	x, (x)
      00A7B7 4B F0            [ 1] 1164 	push	#<(___str_22+0)
      00A7B9 4B 85            [ 1] 1165 	push	#((___str_22+0) >> 8)
      00A7BB CD AC 4E         [ 4] 1166 	call	_strcmp
      00A7BE 5D               [ 2] 1167 	tnzw	x
      00A7BF 27 03            [ 1] 1168 	jreq	00647$
      00A7C1 CC A8 4D         [ 2] 1169 	jp	00197$
      00A7C4                       1170 00647$:
                                   1171 ;	./../../mib/stm8s_mib_debug_mem.c: 321: if (argc < 5)
      00A7C4 1E 2C            [ 2] 1172 	ldw	x, (0x2c, sp)
      00A7C6 A3 00 05         [ 2] 1173 	cpw	x, #0x0005
      00A7C9 2E 0B            [ 1] 1174 	jrsge	00179$
                                   1175 ;	./../../mib/stm8s_mib_debug_mem.c: 323: MibWriteDebugString(cptr->usage);
      00A7CB 1E 24            [ 2] 1176 	ldw	x, (0x24, sp)
      00A7CD EE 04            [ 2] 1177 	ldw	x, (0x4, x)
      00A7CF CD 8F AE         [ 4] 1178 	call	_MibWriteDebugString
                                   1179 ;	./../../mib/stm8s_mib_debug_mem.c: 324: return FALSE;
      00A7D2 5F               [ 1] 1180 	clrw	x
      00A7D3 CC A8 F3         [ 2] 1181 	jp	00235$
      00A7D6                       1182 00179$:
                                   1183 ;	./../../mib/stm8s_mib_debug_mem.c: 326: if (!HexToInt(argv[2], &dest, 32) || !HexToInt(argv[3], &src, 32) || !HexToInt(argv[4], &len, 32))
      00A7D6 16 2E            [ 2] 1184 	ldw	y, (0x2e, sp)
      00A7D8 90 EE 04         [ 2] 1185 	ldw	y, (0x4, y)
      00A7DB 4B 20            [ 1] 1186 	push	#0x20
      00A7DD 4B 00            [ 1] 1187 	push	#0x00
      00A7DF 96               [ 1] 1188 	ldw	x, sp
      00A7E0 1C 00 0E         [ 2] 1189 	addw	x, #14
      00A7E3 89               [ 2] 1190 	pushw	x
      00A7E4 93               [ 1] 1191 	ldw	x, y
      00A7E5 CD 9C C1         [ 4] 1192 	call	_HexToInt
      00A7E8 5D               [ 2] 1193 	tnzw	x
      00A7E9 27 2A            [ 1] 1194 	jreq	00180$
      00A7EB 16 2E            [ 2] 1195 	ldw	y, (0x2e, sp)
      00A7ED 90 EE 06         [ 2] 1196 	ldw	y, (0x6, y)
      00A7F0 4B 20            [ 1] 1197 	push	#0x20
      00A7F2 4B 00            [ 1] 1198 	push	#0x00
      00A7F4 96               [ 1] 1199 	ldw	x, sp
      00A7F5 1C 00 12         [ 2] 1200 	addw	x, #18
      00A7F8 89               [ 2] 1201 	pushw	x
      00A7F9 93               [ 1] 1202 	ldw	x, y
      00A7FA CD 9C C1         [ 4] 1203 	call	_HexToInt
      00A7FD 5D               [ 2] 1204 	tnzw	x
      00A7FE 27 15            [ 1] 1205 	jreq	00180$
      00A800 16 2E            [ 2] 1206 	ldw	y, (0x2e, sp)
      00A802 90 EE 08         [ 2] 1207 	ldw	y, (0x8, y)
      00A805 4B 20            [ 1] 1208 	push	#0x20
      00A807 4B 00            [ 1] 1209 	push	#0x00
      00A809 96               [ 1] 1210 	ldw	x, sp
      00A80A 1C 00 16         [ 2] 1211 	addw	x, #22
      00A80D 89               [ 2] 1212 	pushw	x
      00A80E 93               [ 1] 1213 	ldw	x, y
      00A80F CD 9C C1         [ 4] 1214 	call	_HexToInt
      00A812 5D               [ 2] 1215 	tnzw	x
      00A813 26 0D            [ 1] 1216 	jrne	00181$
      00A815                       1217 00180$:
                                   1218 ;	./../../mib/stm8s_mib_debug_mem.c: 328: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A815 4B 0D            [ 1] 1219 	push	#<(__str_3+0)
      00A817 4B 85            [ 1] 1220 	push	#((__str_3+0) >> 8)
      00A819 CD 99 C0         [ 4] 1221 	call	_mib_printf
      00A81C 5B 02            [ 2] 1222 	addw	sp, #2
                                   1223 ;	./../../mib/stm8s_mib_debug_mem.c: 329: return FALSE;
      00A81E 5F               [ 1] 1224 	clrw	x
      00A81F CC A8 F3         [ 2] 1225 	jp	00235$
      00A822                       1226 00181$:
                                   1227 ;	./../../mib/stm8s_mib_debug_mem.c: 332: if (memcmp((char *)dest, (char *)src, (len)) == 0) ccprintf(_DEBUG_CMD_A_, ("equil.\r\n"));
      00A822 1E 16            [ 2] 1228 	ldw	x, (0x16, sp)
      00A824 16 12            [ 2] 1229 	ldw	y, (0x12, sp)
      00A826 17 28            [ 2] 1230 	ldw	(0x28, sp), y
      00A828 16 0E            [ 2] 1231 	ldw	y, (0x0e, sp)
      00A82A 89               [ 2] 1232 	pushw	x
      00A82B 1E 2A            [ 2] 1233 	ldw	x, (0x2a, sp)
      00A82D 89               [ 2] 1234 	pushw	x
      00A82E 93               [ 1] 1235 	ldw	x, y
      00A82F CD AA 7E         [ 4] 1236 	call	_memcmp
      00A832 5D               [ 2] 1237 	tnzw	x
      00A833 26 0C            [ 1] 1238 	jrne	00185$
      00A835 4B F4            [ 1] 1239 	push	#<(__str_23+0)
      00A837 4B 85            [ 1] 1240 	push	#((__str_23+0) >> 8)
      00A839 CD 99 C0         [ 4] 1241 	call	_mib_printf
      00A83C 5B 02            [ 2] 1242 	addw	sp, #2
      00A83E CC A8 F1         [ 2] 1243 	jp	00216$
      00A841                       1244 00185$:
                                   1245 ;	./../../mib/stm8s_mib_debug_mem.c: 333: else ccprintf(_DEBUG_CMD_A_, ("not equil.\r\n"));		
      00A841 4B FD            [ 1] 1246 	push	#<(__str_24+0)
      00A843 4B 85            [ 1] 1247 	push	#((__str_24+0) >> 8)
      00A845 CD 99 C0         [ 4] 1248 	call	_mib_printf
      00A848 5B 02            [ 2] 1249 	addw	sp, #2
      00A84A CC A8 F1         [ 2] 1250 	jp	00216$
      00A84D                       1251 00197$:
                                   1252 ;	./../../mib/stm8s_mib_debug_mem.c: 335: else if (!strcmp(argv[1], "set")) // _CMD_MY_MEMSET_
      00A84D 1E 26            [ 2] 1253 	ldw	x, (0x26, sp)
      00A84F FE               [ 2] 1254 	ldw	x, (x)
      00A850 4B 0A            [ 1] 1255 	push	#<(___str_25+0)
      00A852 4B 86            [ 1] 1256 	push	#((___str_25+0) >> 8)
      00A854 CD AC 4E         [ 4] 1257 	call	_strcmp
      00A857 5D               [ 2] 1258 	tnzw	x
      00A858 26 71            [ 1] 1259 	jrne	00194$
                                   1260 ;	./../../mib/stm8s_mib_debug_mem.c: 337: if (argc < 5)
      00A85A 1E 2C            [ 2] 1261 	ldw	x, (0x2c, sp)
      00A85C A3 00 05         [ 2] 1262 	cpw	x, #0x0005
      00A85F 2E 0B            [ 1] 1263 	jrsge	00188$
                                   1264 ;	./../../mib/stm8s_mib_debug_mem.c: 339: MibWriteDebugString(cptr->usage);
      00A861 1E 24            [ 2] 1265 	ldw	x, (0x24, sp)
      00A863 EE 04            [ 2] 1266 	ldw	x, (0x4, x)
      00A865 CD 8F AE         [ 4] 1267 	call	_MibWriteDebugString
                                   1268 ;	./../../mib/stm8s_mib_debug_mem.c: 340: return FALSE;
      00A868 5F               [ 1] 1269 	clrw	x
      00A869 CC A8 F3         [ 2] 1270 	jp	00235$
      00A86C                       1271 00188$:
                                   1272 ;	./../../mib/stm8s_mib_debug_mem.c: 342: if (!HexToInt(argv[2], &addr, 32) || !HexToInt(argv[3], &c, 8) || !HexToInt(argv[4], &len, 32))
      00A86C 16 2E            [ 2] 1273 	ldw	y, (0x2e, sp)
      00A86E 90 EE 04         [ 2] 1274 	ldw	y, (0x4, y)
      00A871 4B 20            [ 1] 1275 	push	#0x20
      00A873 4B 00            [ 1] 1276 	push	#0x00
      00A875 96               [ 1] 1277 	ldw	x, sp
      00A876 1C 00 03         [ 2] 1278 	addw	x, #3
      00A879 89               [ 2] 1279 	pushw	x
      00A87A 93               [ 1] 1280 	ldw	x, y
      00A87B CD 9C C1         [ 4] 1281 	call	_HexToInt
      00A87E 5D               [ 2] 1282 	tnzw	x
      00A87F 27 2A            [ 1] 1283 	jreq	00189$
      00A881 16 2E            [ 2] 1284 	ldw	y, (0x2e, sp)
      00A883 90 EE 06         [ 2] 1285 	ldw	y, (0x6, y)
      00A886 4B 08            [ 1] 1286 	push	#0x08
      00A888 4B 00            [ 1] 1287 	push	#0x00
      00A88A 96               [ 1] 1288 	ldw	x, sp
      00A88B 1C 00 07         [ 2] 1289 	addw	x, #7
      00A88E 89               [ 2] 1290 	pushw	x
      00A88F 93               [ 1] 1291 	ldw	x, y
      00A890 CD 9C C1         [ 4] 1292 	call	_HexToInt
      00A893 5D               [ 2] 1293 	tnzw	x
      00A894 27 15            [ 1] 1294 	jreq	00189$
      00A896 16 2E            [ 2] 1295 	ldw	y, (0x2e, sp)
      00A898 90 EE 08         [ 2] 1296 	ldw	y, (0x8, y)
      00A89B 4B 20            [ 1] 1297 	push	#0x20
      00A89D 4B 00            [ 1] 1298 	push	#0x00
      00A89F 96               [ 1] 1299 	ldw	x, sp
      00A8A0 1C 00 16         [ 2] 1300 	addw	x, #22
      00A8A3 89               [ 2] 1301 	pushw	x
      00A8A4 93               [ 1] 1302 	ldw	x, y
      00A8A5 CD 9C C1         [ 4] 1303 	call	_HexToInt
      00A8A8 5D               [ 2] 1304 	tnzw	x
      00A8A9 26 0C            [ 1] 1305 	jrne	00190$
      00A8AB                       1306 00189$:
                                   1307 ;	./../../mib/stm8s_mib_debug_mem.c: 344: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A8AB 4B 0D            [ 1] 1308 	push	#<(__str_3+0)
      00A8AD 4B 85            [ 1] 1309 	push	#((__str_3+0) >> 8)
      00A8AF CD 99 C0         [ 4] 1310 	call	_mib_printf
      00A8B2 5B 02            [ 2] 1311 	addw	sp, #2
                                   1312 ;	./../../mib/stm8s_mib_debug_mem.c: 345: return FALSE;
      00A8B4 5F               [ 1] 1313 	clrw	x
      00A8B5 20 3C            [ 2] 1314 	jra	00235$
      00A8B7                       1315 00190$:
                                   1316 ;	./../../mib/stm8s_mib_debug_mem.c: 347: memset((void *)addr, c, len);
      00A8B7 1E 16            [ 2] 1317 	ldw	x, (0x16, sp)
      00A8B9 7B 05            [ 1] 1318 	ld	a, (0x05, sp)
      00A8BB 6B 29            [ 1] 1319 	ld	(0x29, sp), a
      00A8BD 0F 28            [ 1] 1320 	clr	(0x28, sp)
      00A8BF 16 03            [ 2] 1321 	ldw	y, (0x03, sp)
      00A8C1 89               [ 2] 1322 	pushw	x
      00A8C2 1E 2A            [ 2] 1323 	ldw	x, (0x2a, sp)
      00A8C4 89               [ 2] 1324 	pushw	x
      00A8C5 93               [ 1] 1325 	ldw	x, y
      00A8C6 CD AC 1D         [ 4] 1326 	call	_memset
      00A8C9 20 26            [ 2] 1327 	jra	00216$
      00A8CB                       1328 00194$:
                                   1329 ;	./../../mib/stm8s_mib_debug_mem.c: 351: MibWriteDebugString(cptr->usage);
      00A8CB 1E 24            [ 2] 1330 	ldw	x, (0x24, sp)
      00A8CD EE 04            [ 2] 1331 	ldw	x, (0x4, x)
      00A8CF CD 8F AE         [ 4] 1332 	call	_MibWriteDebugString
                                   1333 ;	./../../mib/stm8s_mib_debug_mem.c: 352: return FALSE;
      00A8D2 5F               [ 1] 1334 	clrw	x
      00A8D3 20 1E            [ 2] 1335 	jra	00235$
      00A8D5                       1336 00301$:
      00A8D5 16 28            [ 2] 1337 	ldw	y, (0x28, sp)
      00A8D7 17 1A            [ 2] 1338 	ldw	(0x1a, sp), y
      00A8D9 16 26            [ 2] 1339 	ldw	y, (0x26, sp)
      00A8DB 17 18            [ 2] 1340 	ldw	(0x18, sp), y
      00A8DD 20 12            [ 2] 1341 	jra	00216$
      00A8DF                       1342 00302$:
      00A8DF 16 28            [ 2] 1343 	ldw	y, (0x28, sp)
      00A8E1 17 1A            [ 2] 1344 	ldw	(0x1a, sp), y
      00A8E3 16 26            [ 2] 1345 	ldw	y, (0x26, sp)
      00A8E5 17 18            [ 2] 1346 	ldw	(0x18, sp), y
      00A8E7 20 08            [ 2] 1347 	jra	00216$
      00A8E9                       1348 00303$:
      00A8E9 16 28            [ 2] 1349 	ldw	y, (0x28, sp)
      00A8EB 17 1A            [ 2] 1350 	ldw	(0x1a, sp), y
      00A8ED 16 26            [ 2] 1351 	ldw	y, (0x26, sp)
      00A8EF 17 18            [ 2] 1352 	ldw	(0x18, sp), y
      00A8F1                       1353 00216$:
                                   1354 ;	./../../mib/stm8s_mib_debug_mem.c: 354: return TRUE;
      00A8F1 5F               [ 1] 1355 	clrw	x
      00A8F2 5C               [ 1] 1356 	incw	x
      00A8F3                       1357 00235$:
                                   1358 ;	./../../mib/stm8s_mib_debug_mem.c: 355: }
      00A8F3 16 2A            [ 2] 1359 	ldw	y, (42, sp)
      00A8F5 5B 2F            [ 2] 1360 	addw	sp, #47
      00A8F7 90 FC            [ 2] 1361 	jp	(y)
                                   1362 	.area CODE
                                   1363 	.area CONST
                                   1364 	.area CONST
      0084E1                       1365 __str_0:
      0084E1 49 4E 46 4F 3A 2B 63  1366 	.ascii "INFO:+cmd_mem..."
             6D 64 5F 6D 65 6D 2E
             2E 2E
      0084F1 0D                    1367 	.db 0x0d
      0084F2 0A                    1368 	.db 0x0a
      0084F3 00                    1369 	.db 0x00
                                   1370 	.area CODE
                                   1371 	.area CONST
      0084F4                       1372 __str_1:
      0084F4 49 4E 46 4F 3A 2D 63  1373 	.ascii "INFO:-cmd_mem..."
             6D 64 5F 6D 65 6D 2E
             2E 2E
      008504 0D                    1374 	.db 0x0d
      008505 0A                    1375 	.db 0x0a
      008506 00                    1376 	.db 0x00
                                   1377 	.area CODE
                                   1378 	.area CONST
      008507                       1379 ___str_2:
      008507 77 72 69 74 65        1380 	.ascii "write"
      00850C 00                    1381 	.db 0x00
                                   1382 	.area CODE
                                   1383 	.area CONST
      00850D                       1384 __str_3:
      00850D 49 6C 6C 75 67 61 6C  1385 	.ascii "Illugal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      008527 0D                    1386 	.db 0x0d
      008528 0A                    1387 	.db 0x0a
      008529 00                    1388 	.db 0x00
                                   1389 	.area CODE
                                   1390 	.area CONST
      00852A                       1391 __str_4:
      00852A 49 6C 6C 75 67 61 6C  1392 	.ascii "Illugal character is useqd."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 71 64 2E
      008545 0D                    1393 	.db 0x0d
      008546 0A                    1394 	.db 0x0a
      008547 00                    1395 	.db 0x00
                                   1396 	.area CODE
                                   1397 	.area CONST
      008548                       1398 ___str_5:
      008548 72 65 61 64           1399 	.ascii "read"
      00854C 00                    1400 	.db 0x00
                                   1401 	.area CODE
                                   1402 	.area CONST
      00854D                       1403 __str_6:
      00854D 09                    1404 	.db 0x09
      00854E 61 64 64 72 65 73 73  1405 	.ascii "address : 0x%08lx  "
             20 3A 20 30 78 25 30
             38 6C 78 20 20
      008561 00                    1406 	.db 0x00
                                   1407 	.area CODE
                                   1408 	.area CONST
      008562                       1409 __str_7:
      008562 09                    1410 	.db 0x09
      008563 76 61 6C 75 65 20 20  1411 	.ascii "value   : "
             20 3A 20
      00856D 00                    1412 	.db 0x00
                                   1413 	.area CODE
                                   1414 	.area CONST
      00856E                       1415 __str_8:
      00856E 30 78 25 30 32 78 20  1416 	.ascii "0x%02x "
      008575 00                    1417 	.db 0x00
                                   1418 	.area CODE
                                   1419 	.area CONST
      008576                       1420 __str_9:
      008576 30 78 25 30 34 78     1421 	.ascii "0x%04x"
      00857C 00                    1422 	.db 0x00
                                   1423 	.area CODE
                                   1424 	.area CONST
      00857D                       1425 __str_10:
      00857D 30 78 25 30 38 6C 78  1426 	.ascii "0x%08lx"
      008584 00                    1427 	.db 0x00
                                   1428 	.area CODE
                                   1429 	.area CONST
      008585                       1430 __str_11:
      008585 45 72 72 6F 72 2E     1431 	.ascii "Error."
      00858B 0D                    1432 	.db 0x0d
      00858C 0A                    1433 	.db 0x0a
      00858D 00                    1434 	.db 0x00
                                   1435 	.area CODE
                                   1436 	.area CONST
      00858E                       1437 __str_12:
      00858E 2E                    1438 	.ascii "."
      00858F 0D                    1439 	.db 0x0d
      008590 0A                    1440 	.db 0x0a
      008591 00                    1441 	.db 0x00
                                   1442 	.area CODE
                                   1443 	.area CONST
      008592                       1444 ___str_13:
      008592 77 72 6E              1445 	.ascii "wrn"
      008595 00                    1446 	.db 0x00
                                   1447 	.area CODE
                                   1448 	.area CONST
      008596                       1449 ___str_14:
      008596 72 64 6E              1450 	.ascii "rdn"
      008599 00                    1451 	.db 0x00
                                   1452 	.area CODE
                                   1453 	.area CONST
      00859A                       1454 __str_15:
      00859A 6C 6F 6F 70 20 3A 20  1455 	.ascii "loop : 0x%08lx  "
             30 78 25 30 38 6C 78
             20 20
      0085AA 0D                    1456 	.db 0x0d
      0085AB 0A                    1457 	.db 0x0a
      0085AC 00                    1458 	.db 0x00
                                   1459 	.area CODE
                                   1460 	.area CONST
      0085AD                       1461 __str_16:
      0085AD 76 61 6C 75 65 20 20  1462 	.ascii "value   : "
             20 3A 20
      0085B7 00                    1463 	.db 0x00
                                   1464 	.area CODE
                                   1465 	.area CONST
      0085B8                       1466 __str_17:
      0085B8 30 78 25 30 34 78 20  1467 	.ascii "0x%04x "
      0085BF 00                    1468 	.db 0x00
                                   1469 	.area CODE
                                   1470 	.area CONST
      0085C0                       1471 __str_18:
      0085C0 30 78 25 30 38 6C 78  1472 	.ascii "0x%08lx "
             20
      0085C8 00                    1473 	.db 0x00
                                   1474 	.area CODE
                                   1475 	.area CONST
      0085C9                       1476 ___str_19:
      0085C9 68 64 75 6D 70        1477 	.ascii "hdump"
      0085CE 00                    1478 	.db 0x00
                                   1479 	.area CODE
                                   1480 	.area CONST
      0085CF                       1481 ___str_20:
      0085CF 63 70 79              1482 	.ascii "cpy"
      0085D2 00                    1483 	.db 0x00
                                   1484 	.area CODE
                                   1485 	.area CONST
      0085D3                       1486 __str_21:
      0085D3 49 6C 6C 65 67 61 6C  1487 	.ascii "Illegal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      0085ED 0D                    1488 	.db 0x0d
      0085EE 0A                    1489 	.db 0x0a
      0085EF 00                    1490 	.db 0x00
                                   1491 	.area CODE
                                   1492 	.area CONST
      0085F0                       1493 ___str_22:
      0085F0 63 6D 70              1494 	.ascii "cmp"
      0085F3 00                    1495 	.db 0x00
                                   1496 	.area CODE
                                   1497 	.area CONST
      0085F4                       1498 __str_23:
      0085F4 65 71 75 69 6C 2E     1499 	.ascii "equil."
      0085FA 0D                    1500 	.db 0x0d
      0085FB 0A                    1501 	.db 0x0a
      0085FC 00                    1502 	.db 0x00
                                   1503 	.area CODE
                                   1504 	.area CONST
      0085FD                       1505 __str_24:
      0085FD 6E 6F 74 20 65 71 75  1506 	.ascii "not equil."
             69 6C 2E
      008607 0D                    1507 	.db 0x0d
      008608 0A                    1508 	.db 0x0a
      008609 00                    1509 	.db 0x00
                                   1510 	.area CODE
                                   1511 	.area CONST
      00860A                       1512 ___str_25:
      00860A 73 65 74              1513 	.ascii "set"
      00860D 00                    1514 	.db 0x00
                                   1515 	.area CODE
                                   1516 	.area CONST
      00860E                       1517 ___str_26:
      00860E 6D 65 6D              1518 	.ascii "mem"
      008611 00                    1519 	.db 0x00
                                   1520 	.area CODE
                                   1521 	.area CONST
      008612                       1522 ___str_27:
      008612 20 20 6D 65 6D 20 7B  1523 	.ascii "  mem {cpy}   [dest] [src]   [len] Copy to SDRAM from Flash "
             63 70 79 7D 20 20 20
             5B 64 65 73 74 5D 20
             5B 73 72 63 5D 20 20
             20 5B 6C 65 6E 5D 20
             43 6F 70 79 20 74 6F
             20 53 44 52 41 4D 20
             66 72 6F 6D 20 46 6C
             61 73 68 20
      00864E 6F 72 20 53 44 52 41  1524 	.ascii "or SDRAM."
             4D 2E
      008657 0D                    1525 	.db 0x0d
      008658 0A                    1526 	.db 0x0a
      008659 20 20 6D 65 6D 20 7B  1527 	.ascii "  mem {cmp}   [add1] [add2]  [len] Compare data in addr1 and"
             63 6D 70 7D 20 20 20
             5B 61 64 64 31 5D 20
             5B 61 64 64 32 5D 20
             20 5B 6C 65 6E 5D 20
             43 6F 6D 70 61 72 65
             20 64 61 74 61 20 69
             6E 20 61 64 64 72 31
             20 61 6E 64
      008695 20 61 64 64 72 32 2E  1528 	.ascii " addr2."
      00869C 0D                    1529 	.db 0x0d
      00869D 0A                    1530 	.db 0x0a
      00869E 20 20 6D 65 6D 20 7B  1531 	.ascii "  mem {set}   [addr] [value] [len] Fill Memory with value."
             73 65 74 7D 20 20 20
             5B 61 64 64 72 5D 20
             5B 76 61 6C 75 65 5D
             20 5B 6C 65 6E 5D 20
             46 69 6C 6C 20 4D 65
             6D 6F 72 79 20 77 69
             74 68 20 76 61 6C 75
             65 2E
      0086D8 0D                    1532 	.db 0x0d
      0086D9 0A                    1533 	.db 0x0a
      0086DA 20 20 6D 65 6D 20 7B  1534 	.ascii "  mem {hdump} [addr] [len]         Dump Memory."
             68 64 75 6D 70 7D 20
             5B 61 64 64 72 5D 20
             5B 6C 65 6E 5D 20 20
             20 20 20 20 20 20 20
             44 75 6D 70 20 4D 65
             6D 6F 72 79 2E
      008709 0D                    1535 	.db 0x0d
      00870A 0A                    1536 	.db 0x0a
      00870B 20 20 6D 65 6D 20 7B  1537 	.ascii "  mem {wrn} {c/s/l} [addr] [value] [loop]  Wrn in addr. c:8 "
             77 72 6E 7D 20 7B 63
             2F 73 2F 6C 7D 20 5B
             61 64 64 72 5D 20 5B
             76 61 6C 75 65 5D 20
             5B 6C 6F 6F 70 5D 20
             20 57 72 6E 20 69 6E
             20 61 64 64 72 2E 20
             63 3A 38 20
      008747 73 3A 31 36 20 6C 3A  1538 	.ascii "s:16 l:32 bits."
             33 32 20 62 69 74 73
             2E
      008756 0D                    1539 	.db 0x0d
      008757 0A                    1540 	.db 0x0a
      008758 20 20 6D 65 6D 20 7B  1541 	.ascii "  mem {rdn}  {c/s/l} [addr] [loop]   Rdn in addr. c:8 s:16 l"
             72 64 6E 7D 20 20 7B
             63 2F 73 2F 6C 7D 20
             5B 61 64 64 72 5D 20
             5B 6C 6F 6F 70 5D 20
             20 20 52 64 6E 20 69
             6E 20 61 64 64 72 2E
             20 63 3A 38 20 73 3A
             31 36 20 6C
      008794 3A 33 32 20 62 69 74  1542 	.ascii ":32 bits."
             73 2E
      00879D 0D                    1543 	.db 0x0d
      00879E 0A                    1544 	.db 0x0a
      00879F 20 20 6D 65 6D 20 7B  1545 	.ascii "  mem {write} {c/s/l} [addr] [value]  Write in addr. c:8 s:1"
             77 72 69 74 65 7D 20
             7B 63 2F 73 2F 6C 7D
             20 5B 61 64 64 72 5D
             20 5B 76 61 6C 75 65
             5D 20 20 57 72 69 74
             65 20 69 6E 20 61 64
             64 72 2E 20 63 3A 38
             20 73 3A 31
      0087DB 36 20 6C 3A 33 32 20  1546 	.ascii "6 l:32 bits."
             62 69 74 73 2E
      0087E7 0D                    1547 	.db 0x0d
      0087E8 0A                    1548 	.db 0x0a
      0087E9 20 20 6D 65 6D 20 7B  1549 	.ascii "  mem {read}  {c/s/l} [addr]          Read in addr. c:8 s:16"
             72 65 61 64 7D 20 20
             7B 63 2F 73 2F 6C 7D
             20 5B 61 64 64 72 5D
             20 20 20 20 20 20 20
             20 20 20 52 65 61 64
             20 69 6E 20 61 64 64
             72 2E 20 63 3A 38 20
             73 3A 31 36
      008825 20 6C 3A 33 32 20 62  1550 	.ascii " l:32 bits."
             69 74 73 2E
      008830 0D                    1551 	.db 0x0d
      008831 0A                    1552 	.db 0x0a
      008832 00                    1553 	.db 0x00
                                   1554 	.area CODE
                                   1555 	.area INITIALIZER
      008A12                       1556 __xinit__cmdTbl_only:
      008A12 86 0E                 1557 	.dw ___str_26
      008A14 A1 7E                 1558 	.dw _DoMem
      008A16 86 12                 1559 	.dw ___str_27
      008A18 00 00                 1560 	.dw #0x0000
      008A1A 00 00                 1561 	.dw #0x0000
      008A1C 00 00                 1562 	.dw #0x0000
                                   1563 	.area CABS (ABS)
