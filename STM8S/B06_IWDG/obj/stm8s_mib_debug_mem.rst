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
      000191                         28 _cmdTbl_only:
      000191                         29 	.ds 12
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
      009E15                         63 _cmd_mem:
      009E15 52 0A            [ 2]   64 	sub	sp, #10
                                     65 ;	./../../mib/stm8s_mib_debug_mem.c: 60: for (cptr = cmdTbl;; cptr++) 
      009E17 AE 01 6D         [ 2]   66 	ldw	x, #(_cmdTbl+0)
      009E1A 1F 01            [ 2]   67 	ldw	(0x01, sp), x
      009E1C 5F               [ 1]   68 	clrw	x
      009E1D 1F 07            [ 2]   69 	ldw	(0x07, sp), x
      009E1F 1F 05            [ 2]   70 	ldw	(0x05, sp), x
      009E21 16 01            [ 2]   71 	ldw	y, (0x01, sp)
      009E23 17 09            [ 2]   72 	ldw	(0x09, sp), y
      009E25                         73 00106$:
                                     74 ;	./../../mib/stm8s_mib_debug_mem.c: 62: if(cptr->cmd==0)
      009E25 1E 09            [ 2]   75 	ldw	x, (0x09, sp)
      009E27 FE               [ 2]   76 	ldw	x, (x)
      009E28 1F 03            [ 2]   77 	ldw	(0x03, sp), x
      009E2A 26 19            [ 1]   78 	jrne	00102$
                                     79 ;	./../../mib/stm8s_mib_debug_mem.c: 64: ccprintf(1,("INFO:+cmd_mem...\r\n"));
      009E2C 4B FD            [ 1]   80 	push	#<(__str_0+0)
      009E2E 4B 83            [ 1]   81 	push	#((__str_0+0) >> 8)
      009E30 CD 96 B4         [ 4]   82 	call	_mib_printf
      009E33 5B 02            [ 2]   83 	addw	sp, #2
                                     84 ;	./../../mib/stm8s_mib_debug_mem.c: 65: memcpy((void *)&(cptr->cmd),(void *)&(cmdTbl_only[0].cmd),sizeof(CMD_MY));
      009E35 AE 01 91         [ 2]   85 	ldw	x, #_cmdTbl_only+0
      009E38 16 01            [ 2]   86 	ldw	y, (0x01, sp)
      009E3A 4B 06            [ 1]   87 	push	#0x06
      009E3C 4B 00            [ 1]   88 	push	#0x00
      009E3E 89               [ 2]   89 	pushw	x
      009E3F 93               [ 1]   90 	ldw	x, y
      009E40 CD A8 E0         [ 4]   91 	call	___memcpy
                                     92 ;	./../../mib/stm8s_mib_debug_mem.c: 66: break;
      009E43 20 2F            [ 2]   93 	jra	00105$
      009E45                         94 00102$:
                                     95 ;	./../../mib/stm8s_mib_debug_mem.c: 68: index++;
      009E45 1E 07            [ 2]   96 	ldw	x, (0x07, sp)
      009E47 5C               [ 1]   97 	incw	x
      009E48 1F 07            [ 2]   98 	ldw	(0x07, sp), x
      009E4A 26 05            [ 1]   99 	jrne	00126$
      009E4C 1E 05            [ 2]  100 	ldw	x, (0x05, sp)
      009E4E 5C               [ 1]  101 	incw	x
      009E4F 1F 05            [ 2]  102 	ldw	(0x05, sp), x
      009E51                        103 00126$:
                                    104 ;	./../../mib/stm8s_mib_debug_mem.c: 69: if(index>MAX_COMMANDS)
      009E51 AE 00 06         [ 2]  105 	ldw	x, #0x0006
      009E54 13 07            [ 2]  106 	cpw	x, (0x07, sp)
      009E56 4F               [ 1]  107 	clr	a
      009E57 12 06            [ 1]  108 	sbc	a, (0x06, sp)
      009E59 4F               [ 1]  109 	clr	a
      009E5A 12 05            [ 1]  110 	sbc	a, (0x05, sp)
      009E5C 24 0B            [ 1]  111 	jrnc	00107$
                                    112 ;	./../../mib/stm8s_mib_debug_mem.c: 71: ccprintf(1,("INFO:-cmd_mem...\r\n"));
      009E5E 4B 10            [ 1]  113 	push	#<(__str_1+0)
      009E60 4B 84            [ 1]  114 	push	#((__str_1+0) >> 8)
      009E62 CD 96 B4         [ 4]  115 	call	_mib_printf
      009E65 5B 02            [ 2]  116 	addw	sp, #2
                                    117 ;	./../../mib/stm8s_mib_debug_mem.c: 72: return;
      009E67 20 0B            [ 2]  118 	jra	00108$
      009E69                        119 00107$:
                                    120 ;	./../../mib/stm8s_mib_debug_mem.c: 60: for (cptr = cmdTbl;; cptr++) 
      009E69 1E 09            [ 2]  121 	ldw	x, (0x09, sp)
      009E6B 1C 00 06         [ 2]  122 	addw	x, #0x0006
      009E6E 1F 09            [ 2]  123 	ldw	(0x09, sp), x
      009E70 1F 01            [ 2]  124 	ldw	(0x01, sp), x
      009E72 20 B1            [ 2]  125 	jra	00106$
      009E74                        126 00105$:
                                    127 ;	./../../mib/stm8s_mib_debug_mem.c: 75: return;
      009E74                        128 00108$:
                                    129 ;	./../../mib/stm8s_mib_debug_mem.c: 76: }
      009E74 5B 0A            [ 2]  130 	addw	sp, #10
      009E76 81               [ 4]  131 	ret
                                    132 ;	./../../mib/stm8s_mib_debug_mem.c: 86: static int DoMem(CMD_MY *cptr, int argc, char **argv)
                                    133 ;	-----------------------------------------
                                    134 ;	 function DoMem
                                    135 ;	-----------------------------------------
      009E77                        136 _DoMem:
      009E77 52 29            [ 2]  137 	sub	sp, #41
      009E79 1F 24            [ 2]  138 	ldw	(0x24, sp), x
                                    139 ;	./../../mib/stm8s_mib_debug_mem.c: 88: uint32_t addr = 0;
      009E7B 5F               [ 1]  140 	clrw	x
      009E7C 1F 03            [ 2]  141 	ldw	(0x03, sp), x
      009E7E 1F 01            [ 2]  142 	ldw	(0x01, sp), x
                                    143 ;	./../../mib/stm8s_mib_debug_mem.c: 100: if (argc < 3)
      009E80 1E 2C            [ 2]  144 	ldw	x, (0x2c, sp)
      009E82 A3 00 03         [ 2]  145 	cpw	x, #0x0003
      009E85 2E 0B            [ 1]  146 	jrsge	00102$
                                    147 ;	./../../mib/stm8s_mib_debug_mem.c: 102: MibWriteDebugString(cptr->usage);
      009E87 1E 24            [ 2]  148 	ldw	x, (0x24, sp)
      009E89 EE 04            [ 2]  149 	ldw	x, (0x4, x)
      009E8B CD 8C A2         [ 4]  150 	call	_MibWriteDebugString
                                    151 ;	./../../mib/stm8s_mib_debug_mem.c: 103: return FALSE;
      009E8E 5F               [ 1]  152 	clrw	x
      009E8F CC A5 EC         [ 2]  153 	jp	00235$
      009E92                        154 00102$:
                                    155 ;	./../../mib/stm8s_mib_debug_mem.c: 105: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      009E92 1E 2E            [ 2]  156 	ldw	x, (0x2e, sp)
      009E94 5C               [ 1]  157 	incw	x
      009E95 5C               [ 1]  158 	incw	x
      009E96 1F 26            [ 2]  159 	ldw	(0x26, sp), x
      009E98 FE               [ 2]  160 	ldw	x, (x)
      009E99 4B 23            [ 1]  161 	push	#<(___str_2+0)
      009E9B 4B 84            [ 1]  162 	push	#((___str_2+0) >> 8)
      009E9D CD A9 64         [ 4]  163 	call	_strcmp
      009EA0 5D               [ 2]  164 	tnzw	x
      009EA1 27 03            [ 1]  165 	jreq	00564$
      009EA3 CC 9F 79         [ 2]  166 	jp	00215$
      009EA6                        167 00564$:
                                    168 ;	./../../mib/stm8s_mib_debug_mem.c: 107: if (argc < 5)
      009EA6 1E 2C            [ 2]  169 	ldw	x, (0x2c, sp)
      009EA8 A3 00 05         [ 2]  170 	cpw	x, #0x0005
      009EAB 2E 0B            [ 1]  171 	jrsge	00104$
                                    172 ;	./../../mib/stm8s_mib_debug_mem.c: 109: MibWriteDebugString(cptr->usage);
      009EAD 1E 24            [ 2]  173 	ldw	x, (0x24, sp)
      009EAF EE 04            [ 2]  174 	ldw	x, (0x4, x)
      009EB1 CD 8C A2         [ 4]  175 	call	_MibWriteDebugString
                                    176 ;	./../../mib/stm8s_mib_debug_mem.c: 110: return FALSE;
      009EB4 5F               [ 1]  177 	clrw	x
      009EB5 CC A5 EC         [ 2]  178 	jp	00235$
      009EB8                        179 00104$:
                                    180 ;	./../../mib/stm8s_mib_debug_mem.c: 112: if (!HexToInt(argv[3], &addr, 32))
      009EB8 96               [ 1]  181 	ldw	x, sp
      009EB9 5C               [ 1]  182 	incw	x
      009EBA 51               [ 1]  183 	exgw	x, y
      009EBB 1E 2E            [ 2]  184 	ldw	x, (0x2e, sp)
      009EBD EE 06            [ 2]  185 	ldw	x, (0x6, x)
      009EBF 4B 20            [ 1]  186 	push	#0x20
      009EC1 4B 00            [ 1]  187 	push	#0x00
      009EC3 90 89            [ 2]  188 	pushw	y
      009EC5 CD 99 BA         [ 4]  189 	call	_HexToInt
      009EC8 5D               [ 2]  190 	tnzw	x
      009EC9 26 0D            [ 1]  191 	jrne	00106$
                                    192 ;	./../../mib/stm8s_mib_debug_mem.c: 114: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009ECB 4B 29            [ 1]  193 	push	#<(__str_3+0)
      009ECD 4B 84            [ 1]  194 	push	#((__str_3+0) >> 8)
      009ECF CD 96 B4         [ 4]  195 	call	_mib_printf
      009ED2 5B 02            [ 2]  196 	addw	sp, #2
                                    197 ;	./../../mib/stm8s_mib_debug_mem.c: 115: return FALSE;
      009ED4 5F               [ 1]  198 	clrw	x
      009ED5 CC A5 EC         [ 2]  199 	jp	00235$
      009ED8                        200 00106$:
                                    201 ;	./../../mib/stm8s_mib_debug_mem.c: 118: switch (argv[2][0])
      009ED8 1E 2E            [ 2]  202 	ldw	x, (0x2e, sp)
      009EDA EE 04            [ 2]  203 	ldw	x, (0x4, x)
      009EDC F6               [ 1]  204 	ld	a, (x)
      009EDD A1 63            [ 1]  205 	cp	a, #0x63
      009EDF 27 0B            [ 1]  206 	jreq	00107$
      009EE1 A1 6C            [ 1]  207 	cp	a, #0x6c
      009EE3 27 5B            [ 1]  208 	jreq	00113$
      009EE5 A1 73            [ 1]  209 	cp	a, #0x73
      009EE7 27 2D            [ 1]  210 	jreq	00110$
      009EE9 CC 9F 6E         [ 2]  211 	jp	00116$
                                    212 ;	./../../mib/stm8s_mib_debug_mem.c: 120: case 'c':
      009EEC                        213 00107$:
                                    214 ;	./../../mib/stm8s_mib_debug_mem.c: 121: if (!HexToInt(argv[4], &c, 8))
      009EEC 96               [ 1]  215 	ldw	x, sp
      009EED 1C 00 05         [ 2]  216 	addw	x, #5
      009EF0 51               [ 1]  217 	exgw	x, y
      009EF1 1E 2E            [ 2]  218 	ldw	x, (0x2e, sp)
      009EF3 EE 08            [ 2]  219 	ldw	x, (0x8, x)
      009EF5 4B 08            [ 1]  220 	push	#0x08
      009EF7 4B 00            [ 1]  221 	push	#0x00
      009EF9 90 89            [ 2]  222 	pushw	y
      009EFB CD 99 BA         [ 4]  223 	call	_HexToInt
      009EFE 5D               [ 2]  224 	tnzw	x
      009EFF 26 0D            [ 1]  225 	jrne	00109$
                                    226 ;	./../../mib/stm8s_mib_debug_mem.c: 123: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009F01 4B 29            [ 1]  227 	push	#<(__str_3+0)
      009F03 4B 84            [ 1]  228 	push	#((__str_3+0) >> 8)
      009F05 CD 96 B4         [ 4]  229 	call	_mib_printf
      009F08 5B 02            [ 2]  230 	addw	sp, #2
                                    231 ;	./../../mib/stm8s_mib_debug_mem.c: 124: return FALSE;
      009F0A 5F               [ 1]  232 	clrw	x
      009F0B CC A5 EC         [ 2]  233 	jp	00235$
      009F0E                        234 00109$:
                                    235 ;	./../../mib/stm8s_mib_debug_mem.c: 126: wr_ADDR8(addr, c);
      009F0E 1E 03            [ 2]  236 	ldw	x, (0x03, sp)
      009F10 7B 05            [ 1]  237 	ld	a, (0x05, sp)
      009F12 F7               [ 1]  238 	ld	(x), a
                                    239 ;	./../../mib/stm8s_mib_debug_mem.c: 127: break;
      009F13 CC A5 EA         [ 2]  240 	jp	00216$
                                    241 ;	./../../mib/stm8s_mib_debug_mem.c: 128: case 's':
      009F16                        242 00110$:
                                    243 ;	./../../mib/stm8s_mib_debug_mem.c: 129: if (!HexToInt(argv[4], &s, 16))
      009F16 96               [ 1]  244 	ldw	x, sp
      009F17 1C 00 06         [ 2]  245 	addw	x, #6
      009F1A 51               [ 1]  246 	exgw	x, y
      009F1B 1E 2E            [ 2]  247 	ldw	x, (0x2e, sp)
      009F1D EE 08            [ 2]  248 	ldw	x, (0x8, x)
      009F1F 4B 10            [ 1]  249 	push	#0x10
      009F21 4B 00            [ 1]  250 	push	#0x00
      009F23 90 89            [ 2]  251 	pushw	y
      009F25 CD 99 BA         [ 4]  252 	call	_HexToInt
      009F28 5D               [ 2]  253 	tnzw	x
      009F29 26 0D            [ 1]  254 	jrne	00112$
                                    255 ;	./../../mib/stm8s_mib_debug_mem.c: 131: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009F2B 4B 29            [ 1]  256 	push	#<(__str_3+0)
      009F2D 4B 84            [ 1]  257 	push	#((__str_3+0) >> 8)
      009F2F CD 96 B4         [ 4]  258 	call	_mib_printf
      009F32 5B 02            [ 2]  259 	addw	sp, #2
                                    260 ;	./../../mib/stm8s_mib_debug_mem.c: 132: return FALSE;
      009F34 5F               [ 1]  261 	clrw	x
      009F35 CC A5 EC         [ 2]  262 	jp	00235$
      009F38                        263 00112$:
                                    264 ;	./../../mib/stm8s_mib_debug_mem.c: 134: wr_ADDR16(addr, s);
      009F38 1E 03            [ 2]  265 	ldw	x, (0x03, sp)
      009F3A 16 06            [ 2]  266 	ldw	y, (0x06, sp)
      009F3C FF               [ 2]  267 	ldw	(x), y
                                    268 ;	./../../mib/stm8s_mib_debug_mem.c: 135: break;
      009F3D CC A5 EA         [ 2]  269 	jp	00216$
                                    270 ;	./../../mib/stm8s_mib_debug_mem.c: 136: case 'l':
      009F40                        271 00113$:
                                    272 ;	./../../mib/stm8s_mib_debug_mem.c: 137: if (!HexToInt(argv[4], &l, 32))
      009F40 96               [ 1]  273 	ldw	x, sp
      009F41 1C 00 08         [ 2]  274 	addw	x, #8
      009F44 51               [ 1]  275 	exgw	x, y
      009F45 1E 2E            [ 2]  276 	ldw	x, (0x2e, sp)
      009F47 EE 08            [ 2]  277 	ldw	x, (0x8, x)
      009F49 4B 20            [ 1]  278 	push	#0x20
      009F4B 4B 00            [ 1]  279 	push	#0x00
      009F4D 90 89            [ 2]  280 	pushw	y
      009F4F CD 99 BA         [ 4]  281 	call	_HexToInt
      009F52 5D               [ 2]  282 	tnzw	x
      009F53 26 0D            [ 1]  283 	jrne	00115$
                                    284 ;	./../../mib/stm8s_mib_debug_mem.c: 139: ccprintf(_DEBUG_CMD_A_, ("Illugal character is useqd.\r\n"));
      009F55 4B 46            [ 1]  285 	push	#<(__str_4+0)
      009F57 4B 84            [ 1]  286 	push	#((__str_4+0) >> 8)
      009F59 CD 96 B4         [ 4]  287 	call	_mib_printf
      009F5C 5B 02            [ 2]  288 	addw	sp, #2
                                    289 ;	./../../mib/stm8s_mib_debug_mem.c: 140: return FALSE;
      009F5E 5F               [ 1]  290 	clrw	x
      009F5F CC A5 EC         [ 2]  291 	jp	00235$
      009F62                        292 00115$:
                                    293 ;	./../../mib/stm8s_mib_debug_mem.c: 142: wr_ADDR32(addr, l);
      009F62 1E 03            [ 2]  294 	ldw	x, (0x03, sp)
      009F64 16 0A            [ 2]  295 	ldw	y, (0x0a, sp)
      009F66 EF 02            [ 2]  296 	ldw	(0x2, x), y
      009F68 16 08            [ 2]  297 	ldw	y, (0x08, sp)
      009F6A FF               [ 2]  298 	ldw	(x), y
                                    299 ;	./../../mib/stm8s_mib_debug_mem.c: 143: break;
      009F6B CC A5 EA         [ 2]  300 	jp	00216$
                                    301 ;	./../../mib/stm8s_mib_debug_mem.c: 144: default:
      009F6E                        302 00116$:
                                    303 ;	./../../mib/stm8s_mib_debug_mem.c: 145: MibWriteDebugString(cptr->usage);
      009F6E 1E 24            [ 2]  304 	ldw	x, (0x24, sp)
      009F70 EE 04            [ 2]  305 	ldw	x, (0x4, x)
      009F72 CD 8C A2         [ 4]  306 	call	_MibWriteDebugString
                                    307 ;	./../../mib/stm8s_mib_debug_mem.c: 146: return FALSE;
      009F75 5F               [ 1]  308 	clrw	x
      009F76 CC A5 EC         [ 2]  309 	jp	00235$
                                    310 ;	./../../mib/stm8s_mib_debug_mem.c: 147: }		
      009F79                        311 00215$:
                                    312 ;	./../../mib/stm8s_mib_debug_mem.c: 149: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      009F79 1E 26            [ 2]  313 	ldw	x, (0x26, sp)
      009F7B FE               [ 2]  314 	ldw	x, (x)
      009F7C 4B 64            [ 1]  315 	push	#<(___str_5+0)
      009F7E 4B 84            [ 1]  316 	push	#((___str_5+0) >> 8)
      009F80 CD A9 64         [ 4]  317 	call	_strcmp
      009F83 5D               [ 2]  318 	tnzw	x
      009F84 27 03            [ 1]  319 	jreq	00579$
      009F86 CC A0 3D         [ 2]  320 	jp	00212$
      009F89                        321 00579$:
                                    322 ;	./../../mib/stm8s_mib_debug_mem.c: 151: if (argc < 4)
      009F89 1E 2C            [ 2]  323 	ldw	x, (0x2c, sp)
      009F8B A3 00 04         [ 2]  324 	cpw	x, #0x0004
      009F8E 2E 0B            [ 1]  325 	jrsge	00119$
                                    326 ;	./../../mib/stm8s_mib_debug_mem.c: 153: MibWriteDebugString(cptr->usage);
      009F90 1E 24            [ 2]  327 	ldw	x, (0x24, sp)
      009F92 EE 04            [ 2]  328 	ldw	x, (0x4, x)
      009F94 CD 8C A2         [ 4]  329 	call	_MibWriteDebugString
                                    330 ;	./../../mib/stm8s_mib_debug_mem.c: 154: return FALSE;
      009F97 5F               [ 1]  331 	clrw	x
      009F98 CC A5 EC         [ 2]  332 	jp	00235$
      009F9B                        333 00119$:
                                    334 ;	./../../mib/stm8s_mib_debug_mem.c: 156: if (!HexToInt(argv[3], &addr, 32))
      009F9B 96               [ 1]  335 	ldw	x, sp
      009F9C 5C               [ 1]  336 	incw	x
      009F9D 51               [ 1]  337 	exgw	x, y
      009F9E 1E 2E            [ 2]  338 	ldw	x, (0x2e, sp)
      009FA0 EE 06            [ 2]  339 	ldw	x, (0x6, x)
      009FA2 4B 20            [ 1]  340 	push	#0x20
      009FA4 4B 00            [ 1]  341 	push	#0x00
      009FA6 90 89            [ 2]  342 	pushw	y
      009FA8 CD 99 BA         [ 4]  343 	call	_HexToInt
      009FAB 5D               [ 2]  344 	tnzw	x
      009FAC 26 0D            [ 1]  345 	jrne	00121$
                                    346 ;	./../../mib/stm8s_mib_debug_mem.c: 158: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009FAE 4B 29            [ 1]  347 	push	#<(__str_3+0)
      009FB0 4B 84            [ 1]  348 	push	#((__str_3+0) >> 8)
      009FB2 CD 96 B4         [ 4]  349 	call	_mib_printf
      009FB5 5B 02            [ 2]  350 	addw	sp, #2
                                    351 ;	./../../mib/stm8s_mib_debug_mem.c: 159: return FALSE;
      009FB7 5F               [ 1]  352 	clrw	x
      009FB8 CC A5 EC         [ 2]  353 	jp	00235$
      009FBB                        354 00121$:
                                    355 ;	./../../mib/stm8s_mib_debug_mem.c: 161: ccprintf(_DEBUG_CMD_A_,("\taddress : 0x%08lx  ", addr));
      009FBB 1E 03            [ 2]  356 	ldw	x, (0x03, sp)
      009FBD 89               [ 2]  357 	pushw	x
      009FBE 1E 03            [ 2]  358 	ldw	x, (0x03, sp)
      009FC0 89               [ 2]  359 	pushw	x
      009FC1 4B 69            [ 1]  360 	push	#<(__str_6+0)
      009FC3 4B 84            [ 1]  361 	push	#((__str_6+0) >> 8)
      009FC5 CD 96 B4         [ 4]  362 	call	_mib_printf
      009FC8 5B 06            [ 2]  363 	addw	sp, #6
                                    364 ;	./../../mib/stm8s_mib_debug_mem.c: 162: ccprintf(_DEBUG_CMD_A_, ("\tvalue   : "));
      009FCA 4B 7E            [ 1]  365 	push	#<(__str_7+0)
      009FCC 4B 84            [ 1]  366 	push	#((__str_7+0) >> 8)
      009FCE CD 96 B4         [ 4]  367 	call	_mib_printf
      009FD1 5B 02            [ 2]  368 	addw	sp, #2
                                    369 ;	./../../mib/stm8s_mib_debug_mem.c: 163: switch (argv[2][0])
      009FD3 1E 2E            [ 2]  370 	ldw	x, (0x2e, sp)
      009FD5 EE 04            [ 2]  371 	ldw	x, (0x4, x)
      009FD7 F6               [ 1]  372 	ld	a, (x)
      009FD8 A1 63            [ 1]  373 	cp	a, #0x63
      009FDA 27 0A            [ 1]  374 	jreq	00122$
      009FDC A1 6C            [ 1]  375 	cp	a, #0x6c
      009FDE 27 2A            [ 1]  376 	jreq	00124$
      009FE0 A1 73            [ 1]  377 	cp	a, #0x73
      009FE2 27 15            [ 1]  378 	jreq	00123$
      009FE4 20 3E            [ 2]  379 	jra	00125$
                                    380 ;	./../../mib/stm8s_mib_debug_mem.c: 165: case 'c':
      009FE6                        381 00122$:
                                    382 ;	./../../mib/stm8s_mib_debug_mem.c: 166: c = rd_ADDR8(addr);
      009FE6 1E 03            [ 2]  383 	ldw	x, (0x03, sp)
      009FE8 F6               [ 1]  384 	ld	a, (x)
      009FE9 6B 05            [ 1]  385 	ld	(0x05, sp), a
                                    386 ;	./../../mib/stm8s_mib_debug_mem.c: 167: ccprintf(_DEBUG_CMD_A_,("0x%02x ", c));
      009FEB 5F               [ 1]  387 	clrw	x
      009FEC 97               [ 1]  388 	ld	xl, a
      009FED 89               [ 2]  389 	pushw	x
      009FEE 4B 8A            [ 1]  390 	push	#<(__str_8+0)
      009FF0 4B 84            [ 1]  391 	push	#((__str_8+0) >> 8)
      009FF2 CD 96 B4         [ 4]  392 	call	_mib_printf
      009FF5 5B 04            [ 2]  393 	addw	sp, #4
                                    394 ;	./../../mib/stm8s_mib_debug_mem.c: 168: break;
      009FF7 20 38            [ 2]  395 	jra	00126$
                                    396 ;	./../../mib/stm8s_mib_debug_mem.c: 169: case 's':
      009FF9                        397 00123$:
                                    398 ;	./../../mib/stm8s_mib_debug_mem.c: 170: s = rd_ADDR16(addr);
      009FF9 1E 03            [ 2]  399 	ldw	x, (0x03, sp)
      009FFB FE               [ 2]  400 	ldw	x, (x)
      009FFC 1F 06            [ 2]  401 	ldw	(0x06, sp), x
                                    402 ;	./../../mib/stm8s_mib_debug_mem.c: 171: ccprintf(_DEBUG_CMD_A_,("0x%04x", s));
      009FFE 89               [ 2]  403 	pushw	x
      009FFF 4B 92            [ 1]  404 	push	#<(__str_9+0)
      00A001 4B 84            [ 1]  405 	push	#((__str_9+0) >> 8)
      00A003 CD 96 B4         [ 4]  406 	call	_mib_printf
      00A006 5B 04            [ 2]  407 	addw	sp, #4
                                    408 ;	./../../mib/stm8s_mib_debug_mem.c: 172: break;
      00A008 20 27            [ 2]  409 	jra	00126$
                                    410 ;	./../../mib/stm8s_mib_debug_mem.c: 173: case 'l':
      00A00A                        411 00124$:
                                    412 ;	./../../mib/stm8s_mib_debug_mem.c: 174: l = rd_ADDR32(addr);
      00A00A 1E 03            [ 2]  413 	ldw	x, (0x03, sp)
      00A00C 90 93            [ 1]  414 	ldw	y, x
      00A00E 90 EE 02         [ 2]  415 	ldw	y, (0x2, y)
      00A011 FE               [ 2]  416 	ldw	x, (x)
      00A012 17 0A            [ 2]  417 	ldw	(0x0a, sp), y
      00A014 1F 08            [ 2]  418 	ldw	(0x08, sp), x
                                    419 ;	./../../mib/stm8s_mib_debug_mem.c: 175: ccprintf(_DEBUG_CMD_A_,("0x%08lx", l));
      00A016 90 89            [ 2]  420 	pushw	y
      00A018 89               [ 2]  421 	pushw	x
      00A019 4B 99            [ 1]  422 	push	#<(__str_10+0)
      00A01B 4B 84            [ 1]  423 	push	#((__str_10+0) >> 8)
      00A01D CD 96 B4         [ 4]  424 	call	_mib_printf
      00A020 5B 06            [ 2]  425 	addw	sp, #6
                                    426 ;	./../../mib/stm8s_mib_debug_mem.c: 176: break;
      00A022 20 0D            [ 2]  427 	jra	00126$
                                    428 ;	./../../mib/stm8s_mib_debug_mem.c: 177: default:
      00A024                        429 00125$:
                                    430 ;	./../../mib/stm8s_mib_debug_mem.c: 178: ccprintf(_DEBUG_CMD_A_, ("Error.\r\n"));
      00A024 4B A1            [ 1]  431 	push	#<(__str_11+0)
      00A026 4B 84            [ 1]  432 	push	#((__str_11+0) >> 8)
      00A028 CD 96 B4         [ 4]  433 	call	_mib_printf
      00A02B 5B 02            [ 2]  434 	addw	sp, #2
                                    435 ;	./../../mib/stm8s_mib_debug_mem.c: 179: return FALSE;
      00A02D 5F               [ 1]  436 	clrw	x
      00A02E CC A5 EC         [ 2]  437 	jp	00235$
                                    438 ;	./../../mib/stm8s_mib_debug_mem.c: 180: }
      00A031                        439 00126$:
                                    440 ;	./../../mib/stm8s_mib_debug_mem.c: 181: ccprintf(_DEBUG_CMD_A_, (".\r\n"));		
      00A031 4B AA            [ 1]  441 	push	#<(__str_12+0)
      00A033 4B 84            [ 1]  442 	push	#((__str_12+0) >> 8)
      00A035 CD 96 B4         [ 4]  443 	call	_mib_printf
      00A038 5B 02            [ 2]  444 	addw	sp, #2
      00A03A CC A5 EA         [ 2]  445 	jp	00216$
      00A03D                        446 00212$:
                                    447 ;	./../../mib/stm8s_mib_debug_mem.c: 183: else if (!strcmp(argv[1], "wrn")) // _CMD_MY_WRITE_
      00A03D 1E 26            [ 2]  448 	ldw	x, (0x26, sp)
      00A03F FE               [ 2]  449 	ldw	x, (x)
      00A040 4B AE            [ 1]  450 	push	#<(___str_13+0)
      00A042 4B 84            [ 1]  451 	push	#((___str_13+0) >> 8)
      00A044 CD A9 64         [ 4]  452 	call	_strcmp
      00A047 5D               [ 2]  453 	tnzw	x
      00A048 27 03            [ 1]  454 	jreq	00591$
      00A04A CC A1 D4         [ 2]  455 	jp	00209$
      00A04D                        456 00591$:
                                    457 ;	./../../mib/stm8s_mib_debug_mem.c: 186: if (argc < 6)
      00A04D 1E 2C            [ 2]  458 	ldw	x, (0x2c, sp)
      00A04F A3 00 06         [ 2]  459 	cpw	x, #0x0006
      00A052 2E 0B            [ 1]  460 	jrsge	00128$
                                    461 ;	./../../mib/stm8s_mib_debug_mem.c: 188: MibWriteDebugString(cptr->usage);
      00A054 1E 24            [ 2]  462 	ldw	x, (0x24, sp)
      00A056 EE 04            [ 2]  463 	ldw	x, (0x4, x)
      00A058 CD 8C A2         [ 4]  464 	call	_MibWriteDebugString
                                    465 ;	./../../mib/stm8s_mib_debug_mem.c: 189: return FALSE;
      00A05B 5F               [ 1]  466 	clrw	x
      00A05C CC A5 EC         [ 2]  467 	jp	00235$
      00A05F                        468 00128$:
                                    469 ;	./../../mib/stm8s_mib_debug_mem.c: 191: if (!HexToInt(argv[3], &addr, 32))
      00A05F 96               [ 1]  470 	ldw	x, sp
      00A060 5C               [ 1]  471 	incw	x
      00A061 51               [ 1]  472 	exgw	x, y
      00A062 1E 2E            [ 2]  473 	ldw	x, (0x2e, sp)
      00A064 EE 06            [ 2]  474 	ldw	x, (0x6, x)
      00A066 4B 20            [ 1]  475 	push	#0x20
      00A068 4B 00            [ 1]  476 	push	#0x00
      00A06A 90 89            [ 2]  477 	pushw	y
      00A06C CD 99 BA         [ 4]  478 	call	_HexToInt
      00A06F 5D               [ 2]  479 	tnzw	x
      00A070 26 0D            [ 1]  480 	jrne	00130$
                                    481 ;	./../../mib/stm8s_mib_debug_mem.c: 193: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A072 4B 29            [ 1]  482 	push	#<(__str_3+0)
      00A074 4B 84            [ 1]  483 	push	#((__str_3+0) >> 8)
      00A076 CD 96 B4         [ 4]  484 	call	_mib_printf
      00A079 5B 02            [ 2]  485 	addw	sp, #2
                                    486 ;	./../../mib/stm8s_mib_debug_mem.c: 194: return FALSE;
      00A07B 5F               [ 1]  487 	clrw	x
      00A07C CC A5 EC         [ 2]  488 	jp	00235$
      00A07F                        489 00130$:
                                    490 ;	./../../mib/stm8s_mib_debug_mem.c: 196: if (!HexToInt(argv[5], &v_Loop, 32))
      00A07F 96               [ 1]  491 	ldw	x, sp
      00A080 1C 00 18         [ 2]  492 	addw	x, #24
      00A083 51               [ 1]  493 	exgw	x, y
      00A084 1E 2E            [ 2]  494 	ldw	x, (0x2e, sp)
      00A086 EE 0A            [ 2]  495 	ldw	x, (0xa, x)
      00A088 4B 20            [ 1]  496 	push	#0x20
      00A08A 4B 00            [ 1]  497 	push	#0x00
      00A08C 90 89            [ 2]  498 	pushw	y
      00A08E CD 99 BA         [ 4]  499 	call	_HexToInt
      00A091 5D               [ 2]  500 	tnzw	x
      00A092 26 0D            [ 1]  501 	jrne	00132$
                                    502 ;	./../../mib/stm8s_mib_debug_mem.c: 198: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A094 4B 29            [ 1]  503 	push	#<(__str_3+0)
      00A096 4B 84            [ 1]  504 	push	#((__str_3+0) >> 8)
      00A098 CD 96 B4         [ 4]  505 	call	_mib_printf
      00A09B 5B 02            [ 2]  506 	addw	sp, #2
                                    507 ;	./../../mib/stm8s_mib_debug_mem.c: 199: return FALSE;
      00A09D 5F               [ 1]  508 	clrw	x
      00A09E CC A5 EC         [ 2]  509 	jp	00235$
      00A0A1                        510 00132$:
                                    511 ;	./../../mib/stm8s_mib_debug_mem.c: 201: switch (argv[2][0])
      00A0A1 1E 2E            [ 2]  512 	ldw	x, (0x2e, sp)
      00A0A3 EE 04            [ 2]  513 	ldw	x, (0x4, x)
      00A0A5 F6               [ 1]  514 	ld	a, (x)
      00A0A6 A1 63            [ 1]  515 	cp	a, #0x63
      00A0A8 27 0E            [ 1]  516 	jreq	00133$
      00A0AA A1 6C            [ 1]  517 	cp	a, #0x6c
      00A0AC 26 03            [ 1]  518 	jrne	00599$
      00A0AE CC A1 65         [ 2]  519 	jp	00141$
      00A0B1                        520 00599$:
      00A0B1 A1 73            [ 1]  521 	cp	a, #0x73
      00A0B3 27 55            [ 1]  522 	jreq	00137$
      00A0B5 CC A1 C4         [ 2]  523 	jp	00145$
                                    524 ;	./../../mib/stm8s_mib_debug_mem.c: 203: case 'c':
      00A0B8                        525 00133$:
                                    526 ;	./../../mib/stm8s_mib_debug_mem.c: 204: if (!HexToInt(argv[4], &c, 8))
      00A0B8 96               [ 1]  527 	ldw	x, sp
      00A0B9 1C 00 05         [ 2]  528 	addw	x, #5
      00A0BC 16 2E            [ 2]  529 	ldw	y, (0x2e, sp)
      00A0BE 90 EE 08         [ 2]  530 	ldw	y, (0x8, y)
      00A0C1 4B 08            [ 1]  531 	push	#0x08
      00A0C3 4B 00            [ 1]  532 	push	#0x00
      00A0C5 89               [ 2]  533 	pushw	x
      00A0C6 93               [ 1]  534 	ldw	x, y
      00A0C7 CD 99 BA         [ 4]  535 	call	_HexToInt
      00A0CA 5D               [ 2]  536 	tnzw	x
      00A0CB 26 0D            [ 1]  537 	jrne	00262$
                                    538 ;	./../../mib/stm8s_mib_debug_mem.c: 206: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A0CD 4B 29            [ 1]  539 	push	#<(__str_3+0)
      00A0CF 4B 84            [ 1]  540 	push	#((__str_3+0) >> 8)
      00A0D1 CD 96 B4         [ 4]  541 	call	_mib_printf
      00A0D4 5B 02            [ 2]  542 	addw	sp, #2
                                    543 ;	./../../mib/stm8s_mib_debug_mem.c: 207: return FALSE;
      00A0D6 5F               [ 1]  544 	clrw	x
      00A0D7 CC A5 EC         [ 2]  545 	jp	00235$
      00A0DA                        546 00262$:
      00A0DA 16 1A            [ 2]  547 	ldw	y, (0x1a, sp)
      00A0DC 17 28            [ 2]  548 	ldw	(0x28, sp), y
      00A0DE 16 18            [ 2]  549 	ldw	y, (0x18, sp)
      00A0E0 17 26            [ 2]  550 	ldw	(0x26, sp), y
      00A0E2                        551 00218$:
                                    552 ;	./../../mib/stm8s_mib_debug_mem.c: 209: for (; v_Loop; v_Loop--) wr_ADDR8(addr, c);
      00A0E2 1E 28            [ 2]  553 	ldw	x, (0x28, sp)
      00A0E4 26 07            [ 1]  554 	jrne	00605$
      00A0E6 1E 26            [ 2]  555 	ldw	x, (0x26, sp)
      00A0E8 26 03            [ 1]  556 	jrne	00605$
      00A0EA CC A5 CE         [ 2]  557 	jp	00301$
      00A0ED                        558 00605$:
      00A0ED 1E 03            [ 2]  559 	ldw	x, (0x03, sp)
      00A0EF 7B 05            [ 1]  560 	ld	a, (0x05, sp)
      00A0F1 F7               [ 1]  561 	ld	(x), a
      00A0F2 1E 28            [ 2]  562 	ldw	x, (0x28, sp)
      00A0F4 1D 00 01         [ 2]  563 	subw	x, #0x0001
      00A0F7 1F 28            [ 2]  564 	ldw	(0x28, sp), x
      00A0F9 1E 26            [ 2]  565 	ldw	x, (0x26, sp)
      00A0FB 24 01            [ 1]  566 	jrnc	00606$
      00A0FD 5A               [ 2]  567 	decw	x
      00A0FE                        568 00606$:
      00A0FE 1F 26            [ 2]  569 	ldw	(0x26, sp), x
      00A100 16 28            [ 2]  570 	ldw	y, (0x28, sp)
      00A102 17 1A            [ 2]  571 	ldw	(0x1a, sp), y
      00A104 16 26            [ 2]  572 	ldw	y, (0x26, sp)
      00A106 17 18            [ 2]  573 	ldw	(0x18, sp), y
      00A108 20 D8            [ 2]  574 	jra	00218$
                                    575 ;	./../../mib/stm8s_mib_debug_mem.c: 211: case 's':
      00A10A                        576 00137$:
                                    577 ;	./../../mib/stm8s_mib_debug_mem.c: 212: if (!HexToInt(argv[4], &s, 16))
      00A10A 16 2E            [ 2]  578 	ldw	y, (0x2e, sp)
      00A10C 17 26            [ 2]  579 	ldw	(0x26, sp), y
      00A10E 93               [ 1]  580 	ldw	x, y
      00A10F EE 08            [ 2]  581 	ldw	x, (0x8, x)
      00A111 1F 28            [ 2]  582 	ldw	(0x28, sp), x
      00A113 4B 10            [ 1]  583 	push	#0x10
      00A115 4B 00            [ 1]  584 	push	#0x00
      00A117 96               [ 1]  585 	ldw	x, sp
      00A118 1C 00 08         [ 2]  586 	addw	x, #8
      00A11B 89               [ 2]  587 	pushw	x
      00A11C 1E 2C            [ 2]  588 	ldw	x, (0x2c, sp)
      00A11E CD 99 BA         [ 4]  589 	call	_HexToInt
      00A121 1F 28            [ 2]  590 	ldw	(0x28, sp), x
      00A123 26 0D            [ 1]  591 	jrne	00265$
                                    592 ;	./../../mib/stm8s_mib_debug_mem.c: 214: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A125 4B 29            [ 1]  593 	push	#<(__str_3+0)
      00A127 4B 84            [ 1]  594 	push	#((__str_3+0) >> 8)
      00A129 CD 96 B4         [ 4]  595 	call	_mib_printf
      00A12C 5B 02            [ 2]  596 	addw	sp, #2
                                    597 ;	./../../mib/stm8s_mib_debug_mem.c: 215: return FALSE;
      00A12E 5F               [ 1]  598 	clrw	x
      00A12F CC A5 EC         [ 2]  599 	jp	00235$
      00A132                        600 00265$:
      00A132 16 1A            [ 2]  601 	ldw	y, (0x1a, sp)
      00A134 17 28            [ 2]  602 	ldw	(0x28, sp), y
      00A136 16 18            [ 2]  603 	ldw	y, (0x18, sp)
      00A138 17 26            [ 2]  604 	ldw	(0x26, sp), y
      00A13A                        605 00221$:
                                    606 ;	./../../mib/stm8s_mib_debug_mem.c: 217: for (; v_Loop; v_Loop--) wr_ADDR16(addr, s);
      00A13A 1E 28            [ 2]  607 	ldw	x, (0x28, sp)
      00A13C 26 07            [ 1]  608 	jrne	00608$
      00A13E 1E 26            [ 2]  609 	ldw	x, (0x26, sp)
      00A140 26 03            [ 1]  610 	jrne	00608$
      00A142 CC A5 D8         [ 2]  611 	jp	00302$
      00A145                        612 00608$:
      00A145 16 03            [ 2]  613 	ldw	y, (0x03, sp)
      00A147 17 22            [ 2]  614 	ldw	(0x22, sp), y
      00A149 93               [ 1]  615 	ldw	x, y
      00A14A 16 06            [ 2]  616 	ldw	y, (0x06, sp)
      00A14C FF               [ 2]  617 	ldw	(x), y
      00A14D 1E 28            [ 2]  618 	ldw	x, (0x28, sp)
      00A14F 1D 00 01         [ 2]  619 	subw	x, #0x0001
      00A152 1F 28            [ 2]  620 	ldw	(0x28, sp), x
      00A154 1E 26            [ 2]  621 	ldw	x, (0x26, sp)
      00A156 24 01            [ 1]  622 	jrnc	00609$
      00A158 5A               [ 2]  623 	decw	x
      00A159                        624 00609$:
      00A159 1F 26            [ 2]  625 	ldw	(0x26, sp), x
      00A15B 16 28            [ 2]  626 	ldw	y, (0x28, sp)
      00A15D 17 1A            [ 2]  627 	ldw	(0x1a, sp), y
      00A15F 16 26            [ 2]  628 	ldw	y, (0x26, sp)
      00A161 17 18            [ 2]  629 	ldw	(0x18, sp), y
      00A163 20 D5            [ 2]  630 	jra	00221$
                                    631 ;	./../../mib/stm8s_mib_debug_mem.c: 219: case 'l':
      00A165                        632 00141$:
                                    633 ;	./../../mib/stm8s_mib_debug_mem.c: 220: if (!HexToInt(argv[4], &l, 32))
      00A165 16 2E            [ 2]  634 	ldw	y, (0x2e, sp)
      00A167 17 26            [ 2]  635 	ldw	(0x26, sp), y
      00A169 93               [ 1]  636 	ldw	x, y
      00A16A EE 08            [ 2]  637 	ldw	x, (0x8, x)
      00A16C 1F 28            [ 2]  638 	ldw	(0x28, sp), x
      00A16E 4B 20            [ 1]  639 	push	#0x20
      00A170 4B 00            [ 1]  640 	push	#0x00
      00A172 96               [ 1]  641 	ldw	x, sp
      00A173 1C 00 0A         [ 2]  642 	addw	x, #10
      00A176 89               [ 2]  643 	pushw	x
      00A177 1E 2C            [ 2]  644 	ldw	x, (0x2c, sp)
      00A179 CD 99 BA         [ 4]  645 	call	_HexToInt
      00A17C 1F 28            [ 2]  646 	ldw	(0x28, sp), x
      00A17E 26 0D            [ 1]  647 	jrne	00268$
                                    648 ;	./../../mib/stm8s_mib_debug_mem.c: 222: ccprintf(_DEBUG_CMD_A_, ("Illugal character is useqd.\r\n"));
      00A180 4B 46            [ 1]  649 	push	#<(__str_4+0)
      00A182 4B 84            [ 1]  650 	push	#((__str_4+0) >> 8)
      00A184 CD 96 B4         [ 4]  651 	call	_mib_printf
      00A187 5B 02            [ 2]  652 	addw	sp, #2
                                    653 ;	./../../mib/stm8s_mib_debug_mem.c: 223: return FALSE;
      00A189 5F               [ 1]  654 	clrw	x
      00A18A CC A5 EC         [ 2]  655 	jp	00235$
      00A18D                        656 00268$:
      00A18D 16 1A            [ 2]  657 	ldw	y, (0x1a, sp)
      00A18F 17 28            [ 2]  658 	ldw	(0x28, sp), y
      00A191 16 18            [ 2]  659 	ldw	y, (0x18, sp)
      00A193 17 26            [ 2]  660 	ldw	(0x26, sp), y
      00A195                        661 00224$:
                                    662 ;	./../../mib/stm8s_mib_debug_mem.c: 225: for (; v_Loop; v_Loop--) wr_ADDR32(addr, l);
      00A195 1E 28            [ 2]  663 	ldw	x, (0x28, sp)
      00A197 26 07            [ 1]  664 	jrne	00611$
      00A199 1E 26            [ 2]  665 	ldw	x, (0x26, sp)
      00A19B 26 03            [ 1]  666 	jrne	00611$
      00A19D CC A5 E2         [ 2]  667 	jp	00303$
      00A1A0                        668 00611$:
      00A1A0 16 03            [ 2]  669 	ldw	y, (0x03, sp)
      00A1A2 17 22            [ 2]  670 	ldw	(0x22, sp), y
      00A1A4 93               [ 1]  671 	ldw	x, y
      00A1A5 16 0A            [ 2]  672 	ldw	y, (0x0a, sp)
      00A1A7 EF 02            [ 2]  673 	ldw	(0x2, x), y
      00A1A9 16 08            [ 2]  674 	ldw	y, (0x08, sp)
      00A1AB FF               [ 2]  675 	ldw	(x), y
      00A1AC 1E 28            [ 2]  676 	ldw	x, (0x28, sp)
      00A1AE 1D 00 01         [ 2]  677 	subw	x, #0x0001
      00A1B1 1F 28            [ 2]  678 	ldw	(0x28, sp), x
      00A1B3 1E 26            [ 2]  679 	ldw	x, (0x26, sp)
      00A1B5 24 01            [ 1]  680 	jrnc	00612$
      00A1B7 5A               [ 2]  681 	decw	x
      00A1B8                        682 00612$:
      00A1B8 1F 26            [ 2]  683 	ldw	(0x26, sp), x
      00A1BA 16 28            [ 2]  684 	ldw	y, (0x28, sp)
      00A1BC 17 1A            [ 2]  685 	ldw	(0x1a, sp), y
      00A1BE 16 26            [ 2]  686 	ldw	y, (0x26, sp)
      00A1C0 17 18            [ 2]  687 	ldw	(0x18, sp), y
      00A1C2 20 D1            [ 2]  688 	jra	00224$
                                    689 ;	./../../mib/stm8s_mib_debug_mem.c: 227: default:
      00A1C4                        690 00145$:
                                    691 ;	./../../mib/stm8s_mib_debug_mem.c: 228: MibWriteDebugString(cptr->usage);
      00A1C4 16 24            [ 2]  692 	ldw	y, (0x24, sp)
      00A1C6 17 26            [ 2]  693 	ldw	(0x26, sp), y
      00A1C8 93               [ 1]  694 	ldw	x, y
      00A1C9 EE 04            [ 2]  695 	ldw	x, (0x4, x)
      00A1CB 1F 28            [ 2]  696 	ldw	(0x28, sp), x
      00A1CD CD 8C A2         [ 4]  697 	call	_MibWriteDebugString
                                    698 ;	./../../mib/stm8s_mib_debug_mem.c: 229: return FALSE;
      00A1D0 5F               [ 1]  699 	clrw	x
      00A1D1 CC A5 EC         [ 2]  700 	jp	00235$
                                    701 ;	./../../mib/stm8s_mib_debug_mem.c: 230: }	
      00A1D4                        702 00209$:
                                    703 ;	./../../mib/stm8s_mib_debug_mem.c: 232: else if (!strcmp(argv[1], "rdn")) // _CMD_MY_READ_
      00A1D4 1E 26            [ 2]  704 	ldw	x, (0x26, sp)
      00A1D6 FE               [ 2]  705 	ldw	x, (x)
      00A1D7 1F 28            [ 2]  706 	ldw	(0x28, sp), x
      00A1D9 4B B2            [ 1]  707 	push	#<(___str_14+0)
      00A1DB 4B 84            [ 1]  708 	push	#((___str_14+0) >> 8)
      00A1DD 1E 2A            [ 2]  709 	ldw	x, (0x2a, sp)
      00A1DF CD A9 64         [ 4]  710 	call	_strcmp
      00A1E2 1F 28            [ 2]  711 	ldw	(0x28, sp), x
      00A1E4 27 03            [ 1]  712 	jreq	00613$
      00A1E6 CC A3 C7         [ 2]  713 	jp	00206$
      00A1E9                        714 00613$:
                                    715 ;	./../../mib/stm8s_mib_debug_mem.c: 235: if (argc < 5)
      00A1E9 1E 2C            [ 2]  716 	ldw	x, (0x2c, sp)
      00A1EB A3 00 05         [ 2]  717 	cpw	x, #0x0005
      00A1EE 2E 10            [ 1]  718 	jrsge	00148$
                                    719 ;	./../../mib/stm8s_mib_debug_mem.c: 237: MibWriteDebugString(cptr->usage);
      00A1F0 16 24            [ 2]  720 	ldw	y, (0x24, sp)
      00A1F2 17 26            [ 2]  721 	ldw	(0x26, sp), y
      00A1F4 93               [ 1]  722 	ldw	x, y
      00A1F5 EE 04            [ 2]  723 	ldw	x, (0x4, x)
      00A1F7 1F 28            [ 2]  724 	ldw	(0x28, sp), x
      00A1F9 CD 8C A2         [ 4]  725 	call	_MibWriteDebugString
                                    726 ;	./../../mib/stm8s_mib_debug_mem.c: 238: return FALSE;
      00A1FC 5F               [ 1]  727 	clrw	x
      00A1FD CC A5 EC         [ 2]  728 	jp	00235$
      00A200                        729 00148$:
                                    730 ;	./../../mib/stm8s_mib_debug_mem.c: 240: if (!HexToInt(argv[3], &addr, 32))
      00A200 16 2E            [ 2]  731 	ldw	y, (0x2e, sp)
      00A202 17 26            [ 2]  732 	ldw	(0x26, sp), y
      00A204 93               [ 1]  733 	ldw	x, y
      00A205 EE 06            [ 2]  734 	ldw	x, (0x6, x)
      00A207 1F 28            [ 2]  735 	ldw	(0x28, sp), x
      00A209 4B 20            [ 1]  736 	push	#0x20
      00A20B 4B 00            [ 1]  737 	push	#0x00
      00A20D 96               [ 1]  738 	ldw	x, sp
      00A20E 1C 00 03         [ 2]  739 	addw	x, #3
      00A211 89               [ 2]  740 	pushw	x
      00A212 1E 2C            [ 2]  741 	ldw	x, (0x2c, sp)
      00A214 CD 99 BA         [ 4]  742 	call	_HexToInt
      00A217 1F 28            [ 2]  743 	ldw	(0x28, sp), x
      00A219 26 0D            [ 1]  744 	jrne	00150$
                                    745 ;	./../../mib/stm8s_mib_debug_mem.c: 242: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A21B 4B 29            [ 1]  746 	push	#<(__str_3+0)
      00A21D 4B 84            [ 1]  747 	push	#((__str_3+0) >> 8)
      00A21F CD 96 B4         [ 4]  748 	call	_mib_printf
      00A222 5B 02            [ 2]  749 	addw	sp, #2
                                    750 ;	./../../mib/stm8s_mib_debug_mem.c: 243: return FALSE;
      00A224 5F               [ 1]  751 	clrw	x
      00A225 CC A5 EC         [ 2]  752 	jp	00235$
      00A228                        753 00150$:
                                    754 ;	./../../mib/stm8s_mib_debug_mem.c: 245: if (!HexToInt(argv[4], &v_Loop, 32))
      00A228 16 2E            [ 2]  755 	ldw	y, (0x2e, sp)
      00A22A 17 26            [ 2]  756 	ldw	(0x26, sp), y
      00A22C 93               [ 1]  757 	ldw	x, y
      00A22D EE 08            [ 2]  758 	ldw	x, (0x8, x)
      00A22F 1F 28            [ 2]  759 	ldw	(0x28, sp), x
      00A231 4B 20            [ 1]  760 	push	#0x20
      00A233 4B 00            [ 1]  761 	push	#0x00
      00A235 96               [ 1]  762 	ldw	x, sp
      00A236 1C 00 1A         [ 2]  763 	addw	x, #26
      00A239 89               [ 2]  764 	pushw	x
      00A23A 1E 2C            [ 2]  765 	ldw	x, (0x2c, sp)
      00A23C CD 99 BA         [ 4]  766 	call	_HexToInt
      00A23F 1F 28            [ 2]  767 	ldw	(0x28, sp), x
      00A241 26 0D            [ 1]  768 	jrne	00152$
                                    769 ;	./../../mib/stm8s_mib_debug_mem.c: 247: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A243 4B 29            [ 1]  770 	push	#<(__str_3+0)
      00A245 4B 84            [ 1]  771 	push	#((__str_3+0) >> 8)
      00A247 CD 96 B4         [ 4]  772 	call	_mib_printf
      00A24A 5B 02            [ 2]  773 	addw	sp, #2
                                    774 ;	./../../mib/stm8s_mib_debug_mem.c: 248: return FALSE;
      00A24C 5F               [ 1]  775 	clrw	x
      00A24D CC A5 EC         [ 2]  776 	jp	00235$
      00A250                        777 00152$:
                                    778 ;	./../../mib/stm8s_mib_debug_mem.c: 250: ccprintf(_DEBUG_CMD_A_,("\taddress : 0x%08lx  ", addr));
      00A250 1E 03            [ 2]  779 	ldw	x, (0x03, sp)
      00A252 89               [ 2]  780 	pushw	x
      00A253 1E 03            [ 2]  781 	ldw	x, (0x03, sp)
      00A255 89               [ 2]  782 	pushw	x
      00A256 4B 69            [ 1]  783 	push	#<(__str_6+0)
      00A258 4B 84            [ 1]  784 	push	#((__str_6+0) >> 8)
      00A25A CD 96 B4         [ 4]  785 	call	_mib_printf
      00A25D 5B 06            [ 2]  786 	addw	sp, #6
                                    787 ;	./../../mib/stm8s_mib_debug_mem.c: 251: ccprintf(_DEBUG_CMD_A_,("loop : 0x%08lx  \r\n", v_Loop));
      00A25F 1E 1A            [ 2]  788 	ldw	x, (0x1a, sp)
      00A261 89               [ 2]  789 	pushw	x
      00A262 1E 1A            [ 2]  790 	ldw	x, (0x1a, sp)
      00A264 89               [ 2]  791 	pushw	x
      00A265 4B B6            [ 1]  792 	push	#<(__str_15+0)
      00A267 4B 84            [ 1]  793 	push	#((__str_15+0) >> 8)
      00A269 CD 96 B4         [ 4]  794 	call	_mib_printf
      00A26C 5B 06            [ 2]  795 	addw	sp, #6
                                    796 ;	./../../mib/stm8s_mib_debug_mem.c: 252: ccprintf(_DEBUG_CMD_A_, ("value   : "));
      00A26E 4B C9            [ 1]  797 	push	#<(__str_16+0)
      00A270 4B 84            [ 1]  798 	push	#((__str_16+0) >> 8)
      00A272 CD 96 B4         [ 4]  799 	call	_mib_printf
      00A275 5B 02            [ 2]  800 	addw	sp, #2
                                    801 ;	./../../mib/stm8s_mib_debug_mem.c: 253: switch (argv[2][0])
      00A277 16 2E            [ 2]  802 	ldw	y, (0x2e, sp)
      00A279 17 26            [ 2]  803 	ldw	(0x26, sp), y
      00A27B 93               [ 1]  804 	ldw	x, y
      00A27C EE 04            [ 2]  805 	ldw	x, (0x4, x)
      00A27E 1F 28            [ 2]  806 	ldw	(0x28, sp), x
      00A280 F6               [ 1]  807 	ld	a, (x)
      00A281 A1 63            [ 1]  808 	cp	a, #0x63
      00A283 27 0E            [ 1]  809 	jreq	00278$
      00A285 A1 6C            [ 1]  810 	cp	a, #0x6c
      00A287 26 03            [ 1]  811 	jrne	00621$
      00A289 CC A3 38         [ 2]  812 	jp	00284$
      00A28C                        813 00621$:
      00A28C A1 73            [ 1]  814 	cp	a, #0x73
      00A28E 27 59            [ 1]  815 	jreq	00281$
      00A290 CC A3 92         [ 2]  816 	jp	00165$
                                    817 ;	./../../mib/stm8s_mib_debug_mem.c: 255: case 'c':
      00A293                        818 00278$:
      00A293 16 1A            [ 2]  819 	ldw	y, (0x1a, sp)
      00A295 17 28            [ 2]  820 	ldw	(0x28, sp), y
      00A297 16 18            [ 2]  821 	ldw	y, (0x18, sp)
      00A299 17 26            [ 2]  822 	ldw	(0x26, sp), y
      00A29B                        823 00227$:
                                    824 ;	./../../mib/stm8s_mib_debug_mem.c: 256: for (; v_Loop; v_Loop--)
      00A29B 1E 28            [ 2]  825 	ldw	x, (0x28, sp)
      00A29D 26 07            [ 1]  826 	jrne	00626$
      00A29F 1E 26            [ 2]  827 	ldw	x, (0x26, sp)
      00A2A1 26 03            [ 1]  828 	jrne	00626$
      00A2A3 CC A3 9F         [ 2]  829 	jp	00304$
      00A2A6                        830 00626$:
                                    831 ;	./../../mib/stm8s_mib_debug_mem.c: 258: c = rd_ADDR8(addr);
      00A2A6 16 03            [ 2]  832 	ldw	y, (0x03, sp)
      00A2A8 17 22            [ 2]  833 	ldw	(0x22, sp), y
      00A2AA 93               [ 1]  834 	ldw	x, y
      00A2AB F6               [ 1]  835 	ld	a, (x)
      00A2AC 6B 1F            [ 1]  836 	ld	(0x1f, sp), a
      00A2AE 6B 05            [ 1]  837 	ld	(0x05, sp), a
                                    838 ;	./../../mib/stm8s_mib_debug_mem.c: 259: if ((v_Loop & 0xfffff) == 0)
      00A2B0 16 28            [ 2]  839 	ldw	y, (0x28, sp)
      00A2B2 17 22            [ 2]  840 	ldw	(0x22, sp), y
      00A2B4 7B 27            [ 1]  841 	ld	a, (0x27, sp)
      00A2B6 A4 0F            [ 1]  842 	and	a, #0x0f
      00A2B8 6B 21            [ 1]  843 	ld	(0x21, sp), a
      00A2BA 0F 20            [ 1]  844 	clr	(0x20, sp)
      00A2BC 1E 22            [ 2]  845 	ldw	x, (0x22, sp)
      00A2BE 26 11            [ 1]  846 	jrne	00228$
                                    847 ;	./../../mib/stm8s_mib_debug_mem.c: 261: ccprintf(_DEBUG_CMD_A_,("0x%02x ", c));
      00A2C0 1E 20            [ 2]  848 	ldw	x, (0x20, sp)
      00A2C2 26 0D            [ 1]  849 	jrne	00228$
      00A2C4 7B 1F            [ 1]  850 	ld	a, (0x1f, sp)
      00A2C6 97               [ 1]  851 	ld	xl, a
      00A2C7 89               [ 2]  852 	pushw	x
      00A2C8 4B 8A            [ 1]  853 	push	#<(__str_8+0)
      00A2CA 4B 84            [ 1]  854 	push	#((__str_8+0) >> 8)
      00A2CC CD 96 B4         [ 4]  855 	call	_mib_printf
      00A2CF 5B 04            [ 2]  856 	addw	sp, #4
      00A2D1                        857 00228$:
                                    858 ;	./../../mib/stm8s_mib_debug_mem.c: 256: for (; v_Loop; v_Loop--)
      00A2D1 1E 28            [ 2]  859 	ldw	x, (0x28, sp)
      00A2D3 1D 00 01         [ 2]  860 	subw	x, #0x0001
      00A2D6 1F 28            [ 2]  861 	ldw	(0x28, sp), x
      00A2D8 1E 26            [ 2]  862 	ldw	x, (0x26, sp)
      00A2DA 24 01            [ 1]  863 	jrnc	00629$
      00A2DC 5A               [ 2]  864 	decw	x
      00A2DD                        865 00629$:
      00A2DD 1F 26            [ 2]  866 	ldw	(0x26, sp), x
      00A2DF 16 28            [ 2]  867 	ldw	y, (0x28, sp)
      00A2E1 17 1A            [ 2]  868 	ldw	(0x1a, sp), y
      00A2E3 16 26            [ 2]  869 	ldw	y, (0x26, sp)
      00A2E5 17 18            [ 2]  870 	ldw	(0x18, sp), y
      00A2E7 20 B2            [ 2]  871 	jra	00227$
                                    872 ;	./../../mib/stm8s_mib_debug_mem.c: 265: case 's':
      00A2E9                        873 00281$:
      00A2E9 16 1A            [ 2]  874 	ldw	y, (0x1a, sp)
      00A2EB 17 28            [ 2]  875 	ldw	(0x28, sp), y
      00A2ED 16 18            [ 2]  876 	ldw	y, (0x18, sp)
      00A2EF 17 26            [ 2]  877 	ldw	(0x26, sp), y
      00A2F1                        878 00230$:
                                    879 ;	./../../mib/stm8s_mib_debug_mem.c: 266: for (; v_Loop; v_Loop--)
      00A2F1 1E 28            [ 2]  880 	ldw	x, (0x28, sp)
      00A2F3 26 07            [ 1]  881 	jrne	00630$
      00A2F5 1E 26            [ 2]  882 	ldw	x, (0x26, sp)
      00A2F7 26 03            [ 1]  883 	jrne	00630$
      00A2F9 CC A3 A9         [ 2]  884 	jp	00305$
      00A2FC                        885 00630$:
                                    886 ;	./../../mib/stm8s_mib_debug_mem.c: 268: s = rd_ADDR16(addr);
      00A2FC 1E 03            [ 2]  887 	ldw	x, (0x03, sp)
      00A2FE FE               [ 2]  888 	ldw	x, (x)
      00A2FF 1F 1E            [ 2]  889 	ldw	(0x1e, sp), x
      00A301 1F 06            [ 2]  890 	ldw	(0x06, sp), x
                                    891 ;	./../../mib/stm8s_mib_debug_mem.c: 269: if ((v_Loop & 0xfffff) == 0)
      00A303 16 28            [ 2]  892 	ldw	y, (0x28, sp)
      00A305 17 22            [ 2]  893 	ldw	(0x22, sp), y
      00A307 5F               [ 1]  894 	clrw	x
      00A308 7B 27            [ 1]  895 	ld	a, (0x27, sp)
      00A30A A4 0F            [ 1]  896 	and	a, #0x0f
      00A30C 97               [ 1]  897 	ld	xl, a
      00A30D 16 22            [ 2]  898 	ldw	y, (0x22, sp)
      00A30F 26 0F            [ 1]  899 	jrne	00231$
      00A311 5D               [ 2]  900 	tnzw	x
      00A312 26 0C            [ 1]  901 	jrne	00231$
                                    902 ;	./../../mib/stm8s_mib_debug_mem.c: 271: ccprintf(_DEBUG_CMD_A_,("0x%04x ", s));
      00A314 1E 1E            [ 2]  903 	ldw	x, (0x1e, sp)
      00A316 89               [ 2]  904 	pushw	x
      00A317 4B D4            [ 1]  905 	push	#<(__str_17+0)
      00A319 4B 84            [ 1]  906 	push	#((__str_17+0) >> 8)
      00A31B CD 96 B4         [ 4]  907 	call	_mib_printf
      00A31E 5B 04            [ 2]  908 	addw	sp, #4
      00A320                        909 00231$:
                                    910 ;	./../../mib/stm8s_mib_debug_mem.c: 266: for (; v_Loop; v_Loop--)
      00A320 1E 28            [ 2]  911 	ldw	x, (0x28, sp)
      00A322 1D 00 01         [ 2]  912 	subw	x, #0x0001
      00A325 1F 28            [ 2]  913 	ldw	(0x28, sp), x
      00A327 1E 26            [ 2]  914 	ldw	x, (0x26, sp)
      00A329 24 01            [ 1]  915 	jrnc	00633$
      00A32B 5A               [ 2]  916 	decw	x
      00A32C                        917 00633$:
      00A32C 1F 26            [ 2]  918 	ldw	(0x26, sp), x
      00A32E 16 28            [ 2]  919 	ldw	y, (0x28, sp)
      00A330 17 1A            [ 2]  920 	ldw	(0x1a, sp), y
      00A332 16 26            [ 2]  921 	ldw	y, (0x26, sp)
      00A334 17 18            [ 2]  922 	ldw	(0x18, sp), y
      00A336 20 B9            [ 2]  923 	jra	00230$
                                    924 ;	./../../mib/stm8s_mib_debug_mem.c: 275: case 'l':
      00A338                        925 00284$:
      00A338 16 1A            [ 2]  926 	ldw	y, (0x1a, sp)
      00A33A 17 28            [ 2]  927 	ldw	(0x28, sp), y
      00A33C 16 18            [ 2]  928 	ldw	y, (0x18, sp)
      00A33E 17 26            [ 2]  929 	ldw	(0x26, sp), y
      00A340                        930 00233$:
                                    931 ;	./../../mib/stm8s_mib_debug_mem.c: 276: for (; v_Loop; v_Loop--)
      00A340 1E 28            [ 2]  932 	ldw	x, (0x28, sp)
      00A342 26 04            [ 1]  933 	jrne	00634$
      00A344 1E 26            [ 2]  934 	ldw	x, (0x26, sp)
      00A346 27 6B            [ 1]  935 	jreq	00306$
      00A348                        936 00634$:
                                    937 ;	./../../mib/stm8s_mib_debug_mem.c: 278: l = rd_ADDR32(addr);
      00A348 1E 03            [ 2]  938 	ldw	x, (0x03, sp)
      00A34A 90 93            [ 1]  939 	ldw	y, x
      00A34C 90 EE 02         [ 2]  940 	ldw	y, (0x2, y)
      00A34F FE               [ 2]  941 	ldw	x, (x)
      00A350 1F 1C            [ 2]  942 	ldw	(0x1c, sp), x
      00A352 17 0A            [ 2]  943 	ldw	(0x0a, sp), y
      00A354 1E 1C            [ 2]  944 	ldw	x, (0x1c, sp)
      00A356 1F 08            [ 2]  945 	ldw	(0x08, sp), x
                                    946 ;	./../../mib/stm8s_mib_debug_mem.c: 279: if ((v_Loop & 0xfffff) == 0)
      00A358 1E 28            [ 2]  947 	ldw	x, (0x28, sp)
      00A35A 1F 22            [ 2]  948 	ldw	(0x22, sp), x
      00A35C 7B 27            [ 1]  949 	ld	a, (0x27, sp)
      00A35E A4 0F            [ 1]  950 	and	a, #0x0f
      00A360 6B 21            [ 1]  951 	ld	(0x21, sp), a
      00A362 0F 20            [ 1]  952 	clr	(0x20, sp)
      00A364 1E 22            [ 2]  953 	ldw	x, (0x22, sp)
      00A366 26 12            [ 1]  954 	jrne	00234$
      00A368 1E 20            [ 2]  955 	ldw	x, (0x20, sp)
      00A36A 26 0E            [ 1]  956 	jrne	00234$
                                    957 ;	./../../mib/stm8s_mib_debug_mem.c: 281: ccprintf(_DEBUG_CMD_A_,("0x%08lx ", l));
      00A36C 90 89            [ 2]  958 	pushw	y
      00A36E 1E 1E            [ 2]  959 	ldw	x, (0x1e, sp)
      00A370 89               [ 2]  960 	pushw	x
      00A371 4B DC            [ 1]  961 	push	#<(__str_18+0)
      00A373 4B 84            [ 1]  962 	push	#((__str_18+0) >> 8)
      00A375 CD 96 B4         [ 4]  963 	call	_mib_printf
      00A378 5B 06            [ 2]  964 	addw	sp, #6
      00A37A                        965 00234$:
                                    966 ;	./../../mib/stm8s_mib_debug_mem.c: 276: for (; v_Loop; v_Loop--)
      00A37A 1E 28            [ 2]  967 	ldw	x, (0x28, sp)
      00A37C 1D 00 01         [ 2]  968 	subw	x, #0x0001
      00A37F 1F 28            [ 2]  969 	ldw	(0x28, sp), x
      00A381 1E 26            [ 2]  970 	ldw	x, (0x26, sp)
      00A383 24 01            [ 1]  971 	jrnc	00637$
      00A385 5A               [ 2]  972 	decw	x
      00A386                        973 00637$:
      00A386 1F 26            [ 2]  974 	ldw	(0x26, sp), x
      00A388 16 28            [ 2]  975 	ldw	y, (0x28, sp)
      00A38A 17 1A            [ 2]  976 	ldw	(0x1a, sp), y
      00A38C 16 26            [ 2]  977 	ldw	y, (0x26, sp)
      00A38E 17 18            [ 2]  978 	ldw	(0x18, sp), y
      00A390 20 AE            [ 2]  979 	jra	00233$
                                    980 ;	./../../mib/stm8s_mib_debug_mem.c: 285: default:
      00A392                        981 00165$:
                                    982 ;	./../../mib/stm8s_mib_debug_mem.c: 286: ccprintf(_DEBUG_CMD_A_, ("Error.\r\n"));
      00A392 4B A1            [ 1]  983 	push	#<(__str_11+0)
      00A394 4B 84            [ 1]  984 	push	#((__str_11+0) >> 8)
      00A396 CD 96 B4         [ 4]  985 	call	_mib_printf
      00A399 5B 02            [ 2]  986 	addw	sp, #2
                                    987 ;	./../../mib/stm8s_mib_debug_mem.c: 287: return FALSE;
      00A39B 5F               [ 1]  988 	clrw	x
      00A39C CC A5 EC         [ 2]  989 	jp	00235$
                                    990 ;	./../../mib/stm8s_mib_debug_mem.c: 288: }
      00A39F                        991 00304$:
      00A39F 16 28            [ 2]  992 	ldw	y, (0x28, sp)
      00A3A1 17 1A            [ 2]  993 	ldw	(0x1a, sp), y
      00A3A3 16 26            [ 2]  994 	ldw	y, (0x26, sp)
      00A3A5 17 18            [ 2]  995 	ldw	(0x18, sp), y
                                    996 ;	./../../mib/stm8s_mib_debug_mem.c: 352: return FALSE;
      00A3A7 20 12            [ 2]  997 	jra	00166$
                                    998 ;	./../../mib/stm8s_mib_debug_mem.c: 288: }
      00A3A9                        999 00305$:
      00A3A9 16 28            [ 2] 1000 	ldw	y, (0x28, sp)
      00A3AB 17 1A            [ 2] 1001 	ldw	(0x1a, sp), y
      00A3AD 16 26            [ 2] 1002 	ldw	y, (0x26, sp)
      00A3AF 17 18            [ 2] 1003 	ldw	(0x18, sp), y
                                   1004 ;	./../../mib/stm8s_mib_debug_mem.c: 352: return FALSE;
      00A3B1 20 08            [ 2] 1005 	jra	00166$
                                   1006 ;	./../../mib/stm8s_mib_debug_mem.c: 288: }
      00A3B3                       1007 00306$:
      00A3B3 16 28            [ 2] 1008 	ldw	y, (0x28, sp)
      00A3B5 17 1A            [ 2] 1009 	ldw	(0x1a, sp), y
      00A3B7 16 26            [ 2] 1010 	ldw	y, (0x26, sp)
      00A3B9 17 18            [ 2] 1011 	ldw	(0x18, sp), y
      00A3BB                       1012 00166$:
                                   1013 ;	./../../mib/stm8s_mib_debug_mem.c: 289: ccprintf(_DEBUG_CMD_A_, (".\r\n"));
      00A3BB 4B AA            [ 1] 1014 	push	#<(__str_12+0)
      00A3BD 4B 84            [ 1] 1015 	push	#((__str_12+0) >> 8)
      00A3BF CD 96 B4         [ 4] 1016 	call	_mib_printf
      00A3C2 5B 02            [ 2] 1017 	addw	sp, #2
      00A3C4 CC A5 EA         [ 2] 1018 	jp	00216$
      00A3C7                       1019 00206$:
                                   1020 ;	./../../mib/stm8s_mib_debug_mem.c: 291: else if (!strcmp(argv[1], "hdump")) 	// _CMD_MY_HEXDUMP_
      00A3C7 1E 26            [ 2] 1021 	ldw	x, (0x26, sp)
      00A3C9 FE               [ 2] 1022 	ldw	x, (x)
      00A3CA 4B E5            [ 1] 1023 	push	#<(___str_19+0)
      00A3CC 4B 84            [ 1] 1024 	push	#((___str_19+0) >> 8)
      00A3CE CD A9 64         [ 4] 1025 	call	_strcmp
      00A3D1 5D               [ 2] 1026 	tnzw	x
      00A3D2 26 5B            [ 1] 1027 	jrne	00203$
                                   1028 ;	./../../mib/stm8s_mib_debug_mem.c: 293: if (argc < 4)
      00A3D4 1E 2C            [ 2] 1029 	ldw	x, (0x2c, sp)
      00A3D6 A3 00 04         [ 2] 1030 	cpw	x, #0x0004
      00A3D9 2E 0B            [ 1] 1031 	jrsge	00168$
                                   1032 ;	./../../mib/stm8s_mib_debug_mem.c: 295: MibWriteDebugString(cptr->usage);
      00A3DB 1E 24            [ 2] 1033 	ldw	x, (0x24, sp)
      00A3DD EE 04            [ 2] 1034 	ldw	x, (0x4, x)
      00A3DF CD 8C A2         [ 4] 1035 	call	_MibWriteDebugString
                                   1036 ;	./../../mib/stm8s_mib_debug_mem.c: 296: return FALSE;
      00A3E2 5F               [ 1] 1037 	clrw	x
      00A3E3 CC A5 EC         [ 2] 1038 	jp	00235$
      00A3E6                       1039 00168$:
                                   1040 ;	./../../mib/stm8s_mib_debug_mem.c: 298: if (!HexToInt(argv[2], &addr, 32) || !HexToInt(argv[3], &len, 32))
      00A3E6 16 2E            [ 2] 1041 	ldw	y, (0x2e, sp)
      00A3E8 90 EE 04         [ 2] 1042 	ldw	y, (0x4, y)
      00A3EB 4B 20            [ 1] 1043 	push	#0x20
      00A3ED 4B 00            [ 1] 1044 	push	#0x00
      00A3EF 96               [ 1] 1045 	ldw	x, sp
      00A3F0 1C 00 03         [ 2] 1046 	addw	x, #3
      00A3F3 89               [ 2] 1047 	pushw	x
      00A3F4 93               [ 1] 1048 	ldw	x, y
      00A3F5 CD 99 BA         [ 4] 1049 	call	_HexToInt
      00A3F8 5D               [ 2] 1050 	tnzw	x
      00A3F9 27 15            [ 1] 1051 	jreq	00169$
      00A3FB 16 2E            [ 2] 1052 	ldw	y, (0x2e, sp)
      00A3FD 90 EE 06         [ 2] 1053 	ldw	y, (0x6, y)
      00A400 4B 20            [ 1] 1054 	push	#0x20
      00A402 4B 00            [ 1] 1055 	push	#0x00
      00A404 96               [ 1] 1056 	ldw	x, sp
      00A405 1C 00 16         [ 2] 1057 	addw	x, #22
      00A408 89               [ 2] 1058 	pushw	x
      00A409 93               [ 1] 1059 	ldw	x, y
      00A40A CD 99 BA         [ 4] 1060 	call	_HexToInt
      00A40D 5D               [ 2] 1061 	tnzw	x
      00A40E 26 0D            [ 1] 1062 	jrne	00170$
      00A410                       1063 00169$:
                                   1064 ;	./../../mib/stm8s_mib_debug_mem.c: 300: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A410 4B 29            [ 1] 1065 	push	#<(__str_3+0)
      00A412 4B 84            [ 1] 1066 	push	#((__str_3+0) >> 8)
      00A414 CD 96 B4         [ 4] 1067 	call	_mib_printf
      00A417 5B 02            [ 2] 1068 	addw	sp, #2
                                   1069 ;	./../../mib/stm8s_mib_debug_mem.c: 301: return FALSE;
      00A419 5F               [ 1] 1070 	clrw	x
      00A41A CC A5 EC         [ 2] 1071 	jp	00235$
      00A41D                       1072 00170$:
                                   1073 ;	./../../mib/stm8s_mib_debug_mem.c: 303: HexDump(addr, len);		
      00A41D 1E 16            [ 2] 1074 	ldw	x, (0x16, sp)
      00A41F 89               [ 2] 1075 	pushw	x
      00A420 1E 16            [ 2] 1076 	ldw	x, (0x16, sp)
      00A422 89               [ 2] 1077 	pushw	x
      00A423 1E 07            [ 2] 1078 	ldw	x, (0x07, sp)
      00A425 89               [ 2] 1079 	pushw	x
      00A426 1E 07            [ 2] 1080 	ldw	x, (0x07, sp)
      00A428 89               [ 2] 1081 	pushw	x
      00A429 CD 9B 2E         [ 4] 1082 	call	_HexDump
      00A42C CC A5 EA         [ 2] 1083 	jp	00216$
      00A42F                       1084 00203$:
                                   1085 ;	./../../mib/stm8s_mib_debug_mem.c: 305: else if (!strcmp(argv[1], "cpy")) // _CMD_MY_MEMCPY_
      00A42F 1E 26            [ 2] 1086 	ldw	x, (0x26, sp)
      00A431 FE               [ 2] 1087 	ldw	x, (x)
      00A432 4B EB            [ 1] 1088 	push	#<(___str_20+0)
      00A434 4B 84            [ 1] 1089 	push	#((___str_20+0) >> 8)
      00A436 CD A9 64         [ 4] 1090 	call	_strcmp
      00A439 5D               [ 2] 1091 	tnzw	x
      00A43A 26 71            [ 1] 1092 	jrne	00200$
                                   1093 ;	./../../mib/stm8s_mib_debug_mem.c: 307: if (argc < 5)
      00A43C 1E 2C            [ 2] 1094 	ldw	x, (0x2c, sp)
      00A43E A3 00 05         [ 2] 1095 	cpw	x, #0x0005
      00A441 2E 0B            [ 1] 1096 	jrsge	00173$
                                   1097 ;	./../../mib/stm8s_mib_debug_mem.c: 309: MibWriteDebugString(cptr->usage);
      00A443 1E 24            [ 2] 1098 	ldw	x, (0x24, sp)
      00A445 EE 04            [ 2] 1099 	ldw	x, (0x4, x)
      00A447 CD 8C A2         [ 4] 1100 	call	_MibWriteDebugString
                                   1101 ;	./../../mib/stm8s_mib_debug_mem.c: 310: return FALSE;
      00A44A 5F               [ 1] 1102 	clrw	x
      00A44B CC A5 EC         [ 2] 1103 	jp	00235$
      00A44E                       1104 00173$:
                                   1105 ;	./../../mib/stm8s_mib_debug_mem.c: 312: if (!HexToInt(argv[2], &dest, 32) || !HexToInt(argv[3], &src, 32) || !HexToInt(argv[4], &len, 32))
      00A44E 16 2E            [ 2] 1106 	ldw	y, (0x2e, sp)
      00A450 90 EE 04         [ 2] 1107 	ldw	y, (0x4, y)
      00A453 4B 20            [ 1] 1108 	push	#0x20
      00A455 4B 00            [ 1] 1109 	push	#0x00
      00A457 96               [ 1] 1110 	ldw	x, sp
      00A458 1C 00 0E         [ 2] 1111 	addw	x, #14
      00A45B 89               [ 2] 1112 	pushw	x
      00A45C 93               [ 1] 1113 	ldw	x, y
      00A45D CD 99 BA         [ 4] 1114 	call	_HexToInt
      00A460 5D               [ 2] 1115 	tnzw	x
      00A461 27 2A            [ 1] 1116 	jreq	00174$
      00A463 16 2E            [ 2] 1117 	ldw	y, (0x2e, sp)
      00A465 90 EE 06         [ 2] 1118 	ldw	y, (0x6, y)
      00A468 4B 20            [ 1] 1119 	push	#0x20
      00A46A 4B 00            [ 1] 1120 	push	#0x00
      00A46C 96               [ 1] 1121 	ldw	x, sp
      00A46D 1C 00 12         [ 2] 1122 	addw	x, #18
      00A470 89               [ 2] 1123 	pushw	x
      00A471 93               [ 1] 1124 	ldw	x, y
      00A472 CD 99 BA         [ 4] 1125 	call	_HexToInt
      00A475 5D               [ 2] 1126 	tnzw	x
      00A476 27 15            [ 1] 1127 	jreq	00174$
      00A478 16 2E            [ 2] 1128 	ldw	y, (0x2e, sp)
      00A47A 90 EE 08         [ 2] 1129 	ldw	y, (0x8, y)
      00A47D 4B 20            [ 1] 1130 	push	#0x20
      00A47F 4B 00            [ 1] 1131 	push	#0x00
      00A481 96               [ 1] 1132 	ldw	x, sp
      00A482 1C 00 16         [ 2] 1133 	addw	x, #22
      00A485 89               [ 2] 1134 	pushw	x
      00A486 93               [ 1] 1135 	ldw	x, y
      00A487 CD 99 BA         [ 4] 1136 	call	_HexToInt
      00A48A 5D               [ 2] 1137 	tnzw	x
      00A48B 26 0D            [ 1] 1138 	jrne	00175$
      00A48D                       1139 00174$:
                                   1140 ;	./../../mib/stm8s_mib_debug_mem.c: 314: ccprintf(_DEBUG_CMD_A_, ("Illegal character is used.\r\n"));
      00A48D 4B EF            [ 1] 1141 	push	#<(__str_21+0)
      00A48F 4B 84            [ 1] 1142 	push	#((__str_21+0) >> 8)
      00A491 CD 96 B4         [ 4] 1143 	call	_mib_printf
      00A494 5B 02            [ 2] 1144 	addw	sp, #2
                                   1145 ;	./../../mib/stm8s_mib_debug_mem.c: 315: return FALSE;
      00A496 5F               [ 1] 1146 	clrw	x
      00A497 CC A5 EC         [ 2] 1147 	jp	00235$
      00A49A                       1148 00175$:
                                   1149 ;	./../../mib/stm8s_mib_debug_mem.c: 317: memcpy((char *)dest, (char *)src, len);		
      00A49A 1E 16            [ 2] 1150 	ldw	x, (0x16, sp)
      00A49C 16 12            [ 2] 1151 	ldw	y, (0x12, sp)
      00A49E 17 28            [ 2] 1152 	ldw	(0x28, sp), y
      00A4A0 16 0E            [ 2] 1153 	ldw	y, (0x0e, sp)
      00A4A2 89               [ 2] 1154 	pushw	x
      00A4A3 1E 2A            [ 2] 1155 	ldw	x, (0x2a, sp)
      00A4A5 89               [ 2] 1156 	pushw	x
      00A4A6 93               [ 1] 1157 	ldw	x, y
      00A4A7 CD A8 E0         [ 4] 1158 	call	___memcpy
      00A4AA CC A5 EA         [ 2] 1159 	jp	00216$
      00A4AD                       1160 00200$:
                                   1161 ;	./../../mib/stm8s_mib_debug_mem.c: 319: else if (!strcmp(argv[1], "cmp")) // _CMD_MY_MEMCMP_
      00A4AD 1E 26            [ 2] 1162 	ldw	x, (0x26, sp)
      00A4AF FE               [ 2] 1163 	ldw	x, (x)
      00A4B0 4B 0C            [ 1] 1164 	push	#<(___str_22+0)
      00A4B2 4B 85            [ 1] 1165 	push	#((___str_22+0) >> 8)
      00A4B4 CD A9 64         [ 4] 1166 	call	_strcmp
      00A4B7 5D               [ 2] 1167 	tnzw	x
      00A4B8 27 03            [ 1] 1168 	jreq	00647$
      00A4BA CC A5 46         [ 2] 1169 	jp	00197$
      00A4BD                       1170 00647$:
                                   1171 ;	./../../mib/stm8s_mib_debug_mem.c: 321: if (argc < 5)
      00A4BD 1E 2C            [ 2] 1172 	ldw	x, (0x2c, sp)
      00A4BF A3 00 05         [ 2] 1173 	cpw	x, #0x0005
      00A4C2 2E 0B            [ 1] 1174 	jrsge	00179$
                                   1175 ;	./../../mib/stm8s_mib_debug_mem.c: 323: MibWriteDebugString(cptr->usage);
      00A4C4 1E 24            [ 2] 1176 	ldw	x, (0x24, sp)
      00A4C6 EE 04            [ 2] 1177 	ldw	x, (0x4, x)
      00A4C8 CD 8C A2         [ 4] 1178 	call	_MibWriteDebugString
                                   1179 ;	./../../mib/stm8s_mib_debug_mem.c: 324: return FALSE;
      00A4CB 5F               [ 1] 1180 	clrw	x
      00A4CC CC A5 EC         [ 2] 1181 	jp	00235$
      00A4CF                       1182 00179$:
                                   1183 ;	./../../mib/stm8s_mib_debug_mem.c: 326: if (!HexToInt(argv[2], &dest, 32) || !HexToInt(argv[3], &src, 32) || !HexToInt(argv[4], &len, 32))
      00A4CF 16 2E            [ 2] 1184 	ldw	y, (0x2e, sp)
      00A4D1 90 EE 04         [ 2] 1185 	ldw	y, (0x4, y)
      00A4D4 4B 20            [ 1] 1186 	push	#0x20
      00A4D6 4B 00            [ 1] 1187 	push	#0x00
      00A4D8 96               [ 1] 1188 	ldw	x, sp
      00A4D9 1C 00 0E         [ 2] 1189 	addw	x, #14
      00A4DC 89               [ 2] 1190 	pushw	x
      00A4DD 93               [ 1] 1191 	ldw	x, y
      00A4DE CD 99 BA         [ 4] 1192 	call	_HexToInt
      00A4E1 5D               [ 2] 1193 	tnzw	x
      00A4E2 27 2A            [ 1] 1194 	jreq	00180$
      00A4E4 16 2E            [ 2] 1195 	ldw	y, (0x2e, sp)
      00A4E6 90 EE 06         [ 2] 1196 	ldw	y, (0x6, y)
      00A4E9 4B 20            [ 1] 1197 	push	#0x20
      00A4EB 4B 00            [ 1] 1198 	push	#0x00
      00A4ED 96               [ 1] 1199 	ldw	x, sp
      00A4EE 1C 00 12         [ 2] 1200 	addw	x, #18
      00A4F1 89               [ 2] 1201 	pushw	x
      00A4F2 93               [ 1] 1202 	ldw	x, y
      00A4F3 CD 99 BA         [ 4] 1203 	call	_HexToInt
      00A4F6 5D               [ 2] 1204 	tnzw	x
      00A4F7 27 15            [ 1] 1205 	jreq	00180$
      00A4F9 16 2E            [ 2] 1206 	ldw	y, (0x2e, sp)
      00A4FB 90 EE 08         [ 2] 1207 	ldw	y, (0x8, y)
      00A4FE 4B 20            [ 1] 1208 	push	#0x20
      00A500 4B 00            [ 1] 1209 	push	#0x00
      00A502 96               [ 1] 1210 	ldw	x, sp
      00A503 1C 00 16         [ 2] 1211 	addw	x, #22
      00A506 89               [ 2] 1212 	pushw	x
      00A507 93               [ 1] 1213 	ldw	x, y
      00A508 CD 99 BA         [ 4] 1214 	call	_HexToInt
      00A50B 5D               [ 2] 1215 	tnzw	x
      00A50C 26 0D            [ 1] 1216 	jrne	00181$
      00A50E                       1217 00180$:
                                   1218 ;	./../../mib/stm8s_mib_debug_mem.c: 328: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A50E 4B 29            [ 1] 1219 	push	#<(__str_3+0)
      00A510 4B 84            [ 1] 1220 	push	#((__str_3+0) >> 8)
      00A512 CD 96 B4         [ 4] 1221 	call	_mib_printf
      00A515 5B 02            [ 2] 1222 	addw	sp, #2
                                   1223 ;	./../../mib/stm8s_mib_debug_mem.c: 329: return FALSE;
      00A517 5F               [ 1] 1224 	clrw	x
      00A518 CC A5 EC         [ 2] 1225 	jp	00235$
      00A51B                       1226 00181$:
                                   1227 ;	./../../mib/stm8s_mib_debug_mem.c: 332: if (memcmp((char *)dest, (char *)src, (len)) == 0) ccprintf(_DEBUG_CMD_A_, ("equil.\r\n"));
      00A51B 1E 16            [ 2] 1228 	ldw	x, (0x16, sp)
      00A51D 16 12            [ 2] 1229 	ldw	y, (0x12, sp)
      00A51F 17 28            [ 2] 1230 	ldw	(0x28, sp), y
      00A521 16 0E            [ 2] 1231 	ldw	y, (0x0e, sp)
      00A523 89               [ 2] 1232 	pushw	x
      00A524 1E 2A            [ 2] 1233 	ldw	x, (0x2a, sp)
      00A526 89               [ 2] 1234 	pushw	x
      00A527 93               [ 1] 1235 	ldw	x, y
      00A528 CD A7 94         [ 4] 1236 	call	_memcmp
      00A52B 5D               [ 2] 1237 	tnzw	x
      00A52C 26 0C            [ 1] 1238 	jrne	00185$
      00A52E 4B 10            [ 1] 1239 	push	#<(__str_23+0)
      00A530 4B 85            [ 1] 1240 	push	#((__str_23+0) >> 8)
      00A532 CD 96 B4         [ 4] 1241 	call	_mib_printf
      00A535 5B 02            [ 2] 1242 	addw	sp, #2
      00A537 CC A5 EA         [ 2] 1243 	jp	00216$
      00A53A                       1244 00185$:
                                   1245 ;	./../../mib/stm8s_mib_debug_mem.c: 333: else ccprintf(_DEBUG_CMD_A_, ("not equil.\r\n"));		
      00A53A 4B 19            [ 1] 1246 	push	#<(__str_24+0)
      00A53C 4B 85            [ 1] 1247 	push	#((__str_24+0) >> 8)
      00A53E CD 96 B4         [ 4] 1248 	call	_mib_printf
      00A541 5B 02            [ 2] 1249 	addw	sp, #2
      00A543 CC A5 EA         [ 2] 1250 	jp	00216$
      00A546                       1251 00197$:
                                   1252 ;	./../../mib/stm8s_mib_debug_mem.c: 335: else if (!strcmp(argv[1], "set")) // _CMD_MY_MEMSET_
      00A546 1E 26            [ 2] 1253 	ldw	x, (0x26, sp)
      00A548 FE               [ 2] 1254 	ldw	x, (x)
      00A549 4B 26            [ 1] 1255 	push	#<(___str_25+0)
      00A54B 4B 85            [ 1] 1256 	push	#((___str_25+0) >> 8)
      00A54D CD A9 64         [ 4] 1257 	call	_strcmp
      00A550 5D               [ 2] 1258 	tnzw	x
      00A551 26 71            [ 1] 1259 	jrne	00194$
                                   1260 ;	./../../mib/stm8s_mib_debug_mem.c: 337: if (argc < 5)
      00A553 1E 2C            [ 2] 1261 	ldw	x, (0x2c, sp)
      00A555 A3 00 05         [ 2] 1262 	cpw	x, #0x0005
      00A558 2E 0B            [ 1] 1263 	jrsge	00188$
                                   1264 ;	./../../mib/stm8s_mib_debug_mem.c: 339: MibWriteDebugString(cptr->usage);
      00A55A 1E 24            [ 2] 1265 	ldw	x, (0x24, sp)
      00A55C EE 04            [ 2] 1266 	ldw	x, (0x4, x)
      00A55E CD 8C A2         [ 4] 1267 	call	_MibWriteDebugString
                                   1268 ;	./../../mib/stm8s_mib_debug_mem.c: 340: return FALSE;
      00A561 5F               [ 1] 1269 	clrw	x
      00A562 CC A5 EC         [ 2] 1270 	jp	00235$
      00A565                       1271 00188$:
                                   1272 ;	./../../mib/stm8s_mib_debug_mem.c: 342: if (!HexToInt(argv[2], &addr, 32) || !HexToInt(argv[3], &c, 8) || !HexToInt(argv[4], &len, 32))
      00A565 16 2E            [ 2] 1273 	ldw	y, (0x2e, sp)
      00A567 90 EE 04         [ 2] 1274 	ldw	y, (0x4, y)
      00A56A 4B 20            [ 1] 1275 	push	#0x20
      00A56C 4B 00            [ 1] 1276 	push	#0x00
      00A56E 96               [ 1] 1277 	ldw	x, sp
      00A56F 1C 00 03         [ 2] 1278 	addw	x, #3
      00A572 89               [ 2] 1279 	pushw	x
      00A573 93               [ 1] 1280 	ldw	x, y
      00A574 CD 99 BA         [ 4] 1281 	call	_HexToInt
      00A577 5D               [ 2] 1282 	tnzw	x
      00A578 27 2A            [ 1] 1283 	jreq	00189$
      00A57A 16 2E            [ 2] 1284 	ldw	y, (0x2e, sp)
      00A57C 90 EE 06         [ 2] 1285 	ldw	y, (0x6, y)
      00A57F 4B 08            [ 1] 1286 	push	#0x08
      00A581 4B 00            [ 1] 1287 	push	#0x00
      00A583 96               [ 1] 1288 	ldw	x, sp
      00A584 1C 00 07         [ 2] 1289 	addw	x, #7
      00A587 89               [ 2] 1290 	pushw	x
      00A588 93               [ 1] 1291 	ldw	x, y
      00A589 CD 99 BA         [ 4] 1292 	call	_HexToInt
      00A58C 5D               [ 2] 1293 	tnzw	x
      00A58D 27 15            [ 1] 1294 	jreq	00189$
      00A58F 16 2E            [ 2] 1295 	ldw	y, (0x2e, sp)
      00A591 90 EE 08         [ 2] 1296 	ldw	y, (0x8, y)
      00A594 4B 20            [ 1] 1297 	push	#0x20
      00A596 4B 00            [ 1] 1298 	push	#0x00
      00A598 96               [ 1] 1299 	ldw	x, sp
      00A599 1C 00 16         [ 2] 1300 	addw	x, #22
      00A59C 89               [ 2] 1301 	pushw	x
      00A59D 93               [ 1] 1302 	ldw	x, y
      00A59E CD 99 BA         [ 4] 1303 	call	_HexToInt
      00A5A1 5D               [ 2] 1304 	tnzw	x
      00A5A2 26 0C            [ 1] 1305 	jrne	00190$
      00A5A4                       1306 00189$:
                                   1307 ;	./../../mib/stm8s_mib_debug_mem.c: 344: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A5A4 4B 29            [ 1] 1308 	push	#<(__str_3+0)
      00A5A6 4B 84            [ 1] 1309 	push	#((__str_3+0) >> 8)
      00A5A8 CD 96 B4         [ 4] 1310 	call	_mib_printf
      00A5AB 5B 02            [ 2] 1311 	addw	sp, #2
                                   1312 ;	./../../mib/stm8s_mib_debug_mem.c: 345: return FALSE;
      00A5AD 5F               [ 1] 1313 	clrw	x
      00A5AE 20 3C            [ 2] 1314 	jra	00235$
      00A5B0                       1315 00190$:
                                   1316 ;	./../../mib/stm8s_mib_debug_mem.c: 347: memset((void *)addr, c, len);
      00A5B0 1E 16            [ 2] 1317 	ldw	x, (0x16, sp)
      00A5B2 7B 05            [ 1] 1318 	ld	a, (0x05, sp)
      00A5B4 6B 29            [ 1] 1319 	ld	(0x29, sp), a
      00A5B6 0F 28            [ 1] 1320 	clr	(0x28, sp)
      00A5B8 16 03            [ 2] 1321 	ldw	y, (0x03, sp)
      00A5BA 89               [ 2] 1322 	pushw	x
      00A5BB 1E 2A            [ 2] 1323 	ldw	x, (0x2a, sp)
      00A5BD 89               [ 2] 1324 	pushw	x
      00A5BE 93               [ 1] 1325 	ldw	x, y
      00A5BF CD A9 33         [ 4] 1326 	call	_memset
      00A5C2 20 26            [ 2] 1327 	jra	00216$
      00A5C4                       1328 00194$:
                                   1329 ;	./../../mib/stm8s_mib_debug_mem.c: 351: MibWriteDebugString(cptr->usage);
      00A5C4 1E 24            [ 2] 1330 	ldw	x, (0x24, sp)
      00A5C6 EE 04            [ 2] 1331 	ldw	x, (0x4, x)
      00A5C8 CD 8C A2         [ 4] 1332 	call	_MibWriteDebugString
                                   1333 ;	./../../mib/stm8s_mib_debug_mem.c: 352: return FALSE;
      00A5CB 5F               [ 1] 1334 	clrw	x
      00A5CC 20 1E            [ 2] 1335 	jra	00235$
      00A5CE                       1336 00301$:
      00A5CE 16 28            [ 2] 1337 	ldw	y, (0x28, sp)
      00A5D0 17 1A            [ 2] 1338 	ldw	(0x1a, sp), y
      00A5D2 16 26            [ 2] 1339 	ldw	y, (0x26, sp)
      00A5D4 17 18            [ 2] 1340 	ldw	(0x18, sp), y
      00A5D6 20 12            [ 2] 1341 	jra	00216$
      00A5D8                       1342 00302$:
      00A5D8 16 28            [ 2] 1343 	ldw	y, (0x28, sp)
      00A5DA 17 1A            [ 2] 1344 	ldw	(0x1a, sp), y
      00A5DC 16 26            [ 2] 1345 	ldw	y, (0x26, sp)
      00A5DE 17 18            [ 2] 1346 	ldw	(0x18, sp), y
      00A5E0 20 08            [ 2] 1347 	jra	00216$
      00A5E2                       1348 00303$:
      00A5E2 16 28            [ 2] 1349 	ldw	y, (0x28, sp)
      00A5E4 17 1A            [ 2] 1350 	ldw	(0x1a, sp), y
      00A5E6 16 26            [ 2] 1351 	ldw	y, (0x26, sp)
      00A5E8 17 18            [ 2] 1352 	ldw	(0x18, sp), y
      00A5EA                       1353 00216$:
                                   1354 ;	./../../mib/stm8s_mib_debug_mem.c: 354: return TRUE;
      00A5EA 5F               [ 1] 1355 	clrw	x
      00A5EB 5C               [ 1] 1356 	incw	x
      00A5EC                       1357 00235$:
                                   1358 ;	./../../mib/stm8s_mib_debug_mem.c: 355: }
      00A5EC 16 2A            [ 2] 1359 	ldw	y, (42, sp)
      00A5EE 5B 2F            [ 2] 1360 	addw	sp, #47
      00A5F0 90 FC            [ 2] 1361 	jp	(y)
                                   1362 	.area CODE
                                   1363 	.area CONST
                                   1364 	.area CONST
      0083FD                       1365 __str_0:
      0083FD 49 4E 46 4F 3A 2B 63  1366 	.ascii "INFO:+cmd_mem..."
             6D 64 5F 6D 65 6D 2E
             2E 2E
      00840D 0D                    1367 	.db 0x0d
      00840E 0A                    1368 	.db 0x0a
      00840F 00                    1369 	.db 0x00
                                   1370 	.area CODE
                                   1371 	.area CONST
      008410                       1372 __str_1:
      008410 49 4E 46 4F 3A 2D 63  1373 	.ascii "INFO:-cmd_mem..."
             6D 64 5F 6D 65 6D 2E
             2E 2E
      008420 0D                    1374 	.db 0x0d
      008421 0A                    1375 	.db 0x0a
      008422 00                    1376 	.db 0x00
                                   1377 	.area CODE
                                   1378 	.area CONST
      008423                       1379 ___str_2:
      008423 77 72 69 74 65        1380 	.ascii "write"
      008428 00                    1381 	.db 0x00
                                   1382 	.area CODE
                                   1383 	.area CONST
      008429                       1384 __str_3:
      008429 49 6C 6C 75 67 61 6C  1385 	.ascii "Illugal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      008443 0D                    1386 	.db 0x0d
      008444 0A                    1387 	.db 0x0a
      008445 00                    1388 	.db 0x00
                                   1389 	.area CODE
                                   1390 	.area CONST
      008446                       1391 __str_4:
      008446 49 6C 6C 75 67 61 6C  1392 	.ascii "Illugal character is useqd."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 71 64 2E
      008461 0D                    1393 	.db 0x0d
      008462 0A                    1394 	.db 0x0a
      008463 00                    1395 	.db 0x00
                                   1396 	.area CODE
                                   1397 	.area CONST
      008464                       1398 ___str_5:
      008464 72 65 61 64           1399 	.ascii "read"
      008468 00                    1400 	.db 0x00
                                   1401 	.area CODE
                                   1402 	.area CONST
      008469                       1403 __str_6:
      008469 09                    1404 	.db 0x09
      00846A 61 64 64 72 65 73 73  1405 	.ascii "address : 0x%08lx  "
             20 3A 20 30 78 25 30
             38 6C 78 20 20
      00847D 00                    1406 	.db 0x00
                                   1407 	.area CODE
                                   1408 	.area CONST
      00847E                       1409 __str_7:
      00847E 09                    1410 	.db 0x09
      00847F 76 61 6C 75 65 20 20  1411 	.ascii "value   : "
             20 3A 20
      008489 00                    1412 	.db 0x00
                                   1413 	.area CODE
                                   1414 	.area CONST
      00848A                       1415 __str_8:
      00848A 30 78 25 30 32 78 20  1416 	.ascii "0x%02x "
      008491 00                    1417 	.db 0x00
                                   1418 	.area CODE
                                   1419 	.area CONST
      008492                       1420 __str_9:
      008492 30 78 25 30 34 78     1421 	.ascii "0x%04x"
      008498 00                    1422 	.db 0x00
                                   1423 	.area CODE
                                   1424 	.area CONST
      008499                       1425 __str_10:
      008499 30 78 25 30 38 6C 78  1426 	.ascii "0x%08lx"
      0084A0 00                    1427 	.db 0x00
                                   1428 	.area CODE
                                   1429 	.area CONST
      0084A1                       1430 __str_11:
      0084A1 45 72 72 6F 72 2E     1431 	.ascii "Error."
      0084A7 0D                    1432 	.db 0x0d
      0084A8 0A                    1433 	.db 0x0a
      0084A9 00                    1434 	.db 0x00
                                   1435 	.area CODE
                                   1436 	.area CONST
      0084AA                       1437 __str_12:
      0084AA 2E                    1438 	.ascii "."
      0084AB 0D                    1439 	.db 0x0d
      0084AC 0A                    1440 	.db 0x0a
      0084AD 00                    1441 	.db 0x00
                                   1442 	.area CODE
                                   1443 	.area CONST
      0084AE                       1444 ___str_13:
      0084AE 77 72 6E              1445 	.ascii "wrn"
      0084B1 00                    1446 	.db 0x00
                                   1447 	.area CODE
                                   1448 	.area CONST
      0084B2                       1449 ___str_14:
      0084B2 72 64 6E              1450 	.ascii "rdn"
      0084B5 00                    1451 	.db 0x00
                                   1452 	.area CODE
                                   1453 	.area CONST
      0084B6                       1454 __str_15:
      0084B6 6C 6F 6F 70 20 3A 20  1455 	.ascii "loop : 0x%08lx  "
             30 78 25 30 38 6C 78
             20 20
      0084C6 0D                    1456 	.db 0x0d
      0084C7 0A                    1457 	.db 0x0a
      0084C8 00                    1458 	.db 0x00
                                   1459 	.area CODE
                                   1460 	.area CONST
      0084C9                       1461 __str_16:
      0084C9 76 61 6C 75 65 20 20  1462 	.ascii "value   : "
             20 3A 20
      0084D3 00                    1463 	.db 0x00
                                   1464 	.area CODE
                                   1465 	.area CONST
      0084D4                       1466 __str_17:
      0084D4 30 78 25 30 34 78 20  1467 	.ascii "0x%04x "
      0084DB 00                    1468 	.db 0x00
                                   1469 	.area CODE
                                   1470 	.area CONST
      0084DC                       1471 __str_18:
      0084DC 30 78 25 30 38 6C 78  1472 	.ascii "0x%08lx "
             20
      0084E4 00                    1473 	.db 0x00
                                   1474 	.area CODE
                                   1475 	.area CONST
      0084E5                       1476 ___str_19:
      0084E5 68 64 75 6D 70        1477 	.ascii "hdump"
      0084EA 00                    1478 	.db 0x00
                                   1479 	.area CODE
                                   1480 	.area CONST
      0084EB                       1481 ___str_20:
      0084EB 63 70 79              1482 	.ascii "cpy"
      0084EE 00                    1483 	.db 0x00
                                   1484 	.area CODE
                                   1485 	.area CONST
      0084EF                       1486 __str_21:
      0084EF 49 6C 6C 65 67 61 6C  1487 	.ascii "Illegal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      008509 0D                    1488 	.db 0x0d
      00850A 0A                    1489 	.db 0x0a
      00850B 00                    1490 	.db 0x00
                                   1491 	.area CODE
                                   1492 	.area CONST
      00850C                       1493 ___str_22:
      00850C 63 6D 70              1494 	.ascii "cmp"
      00850F 00                    1495 	.db 0x00
                                   1496 	.area CODE
                                   1497 	.area CONST
      008510                       1498 __str_23:
      008510 65 71 75 69 6C 2E     1499 	.ascii "equil."
      008516 0D                    1500 	.db 0x0d
      008517 0A                    1501 	.db 0x0a
      008518 00                    1502 	.db 0x00
                                   1503 	.area CODE
                                   1504 	.area CONST
      008519                       1505 __str_24:
      008519 6E 6F 74 20 65 71 75  1506 	.ascii "not equil."
             69 6C 2E
      008523 0D                    1507 	.db 0x0d
      008524 0A                    1508 	.db 0x0a
      008525 00                    1509 	.db 0x00
                                   1510 	.area CODE
                                   1511 	.area CONST
      008526                       1512 ___str_25:
      008526 73 65 74              1513 	.ascii "set"
      008529 00                    1514 	.db 0x00
                                   1515 	.area CODE
                                   1516 	.area CONST
      00852A                       1517 ___str_26:
      00852A 6D 65 6D              1518 	.ascii "mem"
      00852D 00                    1519 	.db 0x00
                                   1520 	.area CODE
                                   1521 	.area CONST
      00852E                       1522 ___str_27:
      00852E 20 20 6D 65 6D 20 7B  1523 	.ascii "  mem {cpy}   [dest] [src]   [len] Copy to SDRAM from Flash "
             63 70 79 7D 20 20 20
             5B 64 65 73 74 5D 20
             5B 73 72 63 5D 20 20
             20 5B 6C 65 6E 5D 20
             43 6F 70 79 20 74 6F
             20 53 44 52 41 4D 20
             66 72 6F 6D 20 46 6C
             61 73 68 20
      00856A 6F 72 20 53 44 52 41  1524 	.ascii "or SDRAM."
             4D 2E
      008573 0D                    1525 	.db 0x0d
      008574 0A                    1526 	.db 0x0a
      008575 20 20 6D 65 6D 20 7B  1527 	.ascii "  mem {cmp}   [add1] [add2]  [len] Compare data in addr1 and"
             63 6D 70 7D 20 20 20
             5B 61 64 64 31 5D 20
             5B 61 64 64 32 5D 20
             20 5B 6C 65 6E 5D 20
             43 6F 6D 70 61 72 65
             20 64 61 74 61 20 69
             6E 20 61 64 64 72 31
             20 61 6E 64
      0085B1 20 61 64 64 72 32 2E  1528 	.ascii " addr2."
      0085B8 0D                    1529 	.db 0x0d
      0085B9 0A                    1530 	.db 0x0a
      0085BA 20 20 6D 65 6D 20 7B  1531 	.ascii "  mem {set}   [addr] [value] [len] Fill Memory with value."
             73 65 74 7D 20 20 20
             5B 61 64 64 72 5D 20
             5B 76 61 6C 75 65 5D
             20 5B 6C 65 6E 5D 20
             46 69 6C 6C 20 4D 65
             6D 6F 72 79 20 77 69
             74 68 20 76 61 6C 75
             65 2E
      0085F4 0D                    1532 	.db 0x0d
      0085F5 0A                    1533 	.db 0x0a
      0085F6 20 20 6D 65 6D 20 7B  1534 	.ascii "  mem {hdump} [addr] [len]         Dump Memory."
             68 64 75 6D 70 7D 20
             5B 61 64 64 72 5D 20
             5B 6C 65 6E 5D 20 20
             20 20 20 20 20 20 20
             44 75 6D 70 20 4D 65
             6D 6F 72 79 2E
      008625 0D                    1535 	.db 0x0d
      008626 0A                    1536 	.db 0x0a
      008627 20 20 6D 65 6D 20 7B  1537 	.ascii "  mem {wrn} {c/s/l} [addr] [value] [loop]  Wrn in addr. c:8 "
             77 72 6E 7D 20 7B 63
             2F 73 2F 6C 7D 20 5B
             61 64 64 72 5D 20 5B
             76 61 6C 75 65 5D 20
             5B 6C 6F 6F 70 5D 20
             20 57 72 6E 20 69 6E
             20 61 64 64 72 2E 20
             63 3A 38 20
      008663 73 3A 31 36 20 6C 3A  1538 	.ascii "s:16 l:32 bits."
             33 32 20 62 69 74 73
             2E
      008672 0D                    1539 	.db 0x0d
      008673 0A                    1540 	.db 0x0a
      008674 20 20 6D 65 6D 20 7B  1541 	.ascii "  mem {rdn}  {c/s/l} [addr] [loop]   Rdn in addr. c:8 s:16 l"
             72 64 6E 7D 20 20 7B
             63 2F 73 2F 6C 7D 20
             5B 61 64 64 72 5D 20
             5B 6C 6F 6F 70 5D 20
             20 20 52 64 6E 20 69
             6E 20 61 64 64 72 2E
             20 63 3A 38 20 73 3A
             31 36 20 6C
      0086B0 3A 33 32 20 62 69 74  1542 	.ascii ":32 bits."
             73 2E
      0086B9 0D                    1543 	.db 0x0d
      0086BA 0A                    1544 	.db 0x0a
      0086BB 20 20 6D 65 6D 20 7B  1545 	.ascii "  mem {write} {c/s/l} [addr] [value]  Write in addr. c:8 s:1"
             77 72 69 74 65 7D 20
             7B 63 2F 73 2F 6C 7D
             20 5B 61 64 64 72 5D
             20 5B 76 61 6C 75 65
             5D 20 20 57 72 69 74
             65 20 69 6E 20 61 64
             64 72 2E 20 63 3A 38
             20 73 3A 31
      0086F7 36 20 6C 3A 33 32 20  1546 	.ascii "6 l:32 bits."
             62 69 74 73 2E
      008703 0D                    1547 	.db 0x0d
      008704 0A                    1548 	.db 0x0a
      008705 20 20 6D 65 6D 20 7B  1549 	.ascii "  mem {read}  {c/s/l} [addr]          Read in addr. c:8 s:16"
             72 65 61 64 7D 20 20
             7B 63 2F 73 2F 6C 7D
             20 5B 61 64 64 72 5D
             20 20 20 20 20 20 20
             20 20 20 52 65 61 64
             20 69 6E 20 61 64 64
             72 2E 20 63 3A 38 20
             73 3A 31 36
      008741 20 6C 3A 33 32 20 62  1550 	.ascii " l:32 bits."
             69 74 73 2E
      00874C 0D                    1551 	.db 0x0d
      00874D 0A                    1552 	.db 0x0a
      00874E 00                    1553 	.db 0x00
                                   1554 	.area CODE
                                   1555 	.area INITIALIZER
      00893E                       1556 __xinit__cmdTbl_only:
      00893E 85 2A                 1557 	.dw ___str_26
      008940 9E 77                 1558 	.dw _DoMem
      008942 85 2E                 1559 	.dw ___str_27
      008944 00 00                 1560 	.dw #0x0000
      008946 00 00                 1561 	.dw #0x0000
      008948 00 00                 1562 	.dw #0x0000
                                   1563 	.area CABS (ABS)
