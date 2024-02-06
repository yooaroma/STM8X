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
      000182                         28 _cmdTbl_only:
      000182                         29 	.ds 12
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
      009DE1                         63 _cmd_mem:
      009DE1 52 0A            [ 2]   64 	sub	sp, #10
                                     65 ;	./../../mib/stm8s_mib_debug_mem.c: 60: for (cptr = cmdTbl;; cptr++) 
      009DE3 AE 01 5E         [ 2]   66 	ldw	x, #(_cmdTbl+0)
      009DE6 1F 01            [ 2]   67 	ldw	(0x01, sp), x
      009DE8 5F               [ 1]   68 	clrw	x
      009DE9 1F 07            [ 2]   69 	ldw	(0x07, sp), x
      009DEB 1F 05            [ 2]   70 	ldw	(0x05, sp), x
      009DED 16 01            [ 2]   71 	ldw	y, (0x01, sp)
      009DEF 17 09            [ 2]   72 	ldw	(0x09, sp), y
      009DF1                         73 00106$:
                                     74 ;	./../../mib/stm8s_mib_debug_mem.c: 62: if(cptr->cmd==0)
      009DF1 1E 09            [ 2]   75 	ldw	x, (0x09, sp)
      009DF3 FE               [ 2]   76 	ldw	x, (x)
      009DF4 1F 03            [ 2]   77 	ldw	(0x03, sp), x
      009DF6 26 19            [ 1]   78 	jrne	00102$
                                     79 ;	./../../mib/stm8s_mib_debug_mem.c: 64: ccprintf(1,("INFO:+cmd_mem...\r\n"));
      009DF8 4B EF            [ 1]   80 	push	#<(__str_0+0)
      009DFA 4B 83            [ 1]   81 	push	#((__str_0+0) >> 8)
      009DFC CD 96 77         [ 4]   82 	call	_mib_printf
      009DFF 5B 02            [ 2]   83 	addw	sp, #2
                                     84 ;	./../../mib/stm8s_mib_debug_mem.c: 65: memcpy((void *)&(cptr->cmd),(void *)&(cmdTbl_only[0].cmd),sizeof(CMD_MY));
      009E01 AE 01 82         [ 2]   85 	ldw	x, #_cmdTbl_only+0
      009E04 16 01            [ 2]   86 	ldw	y, (0x01, sp)
      009E06 4B 06            [ 1]   87 	push	#0x06
      009E08 4B 00            [ 1]   88 	push	#0x00
      009E0A 89               [ 2]   89 	pushw	x
      009E0B 93               [ 1]   90 	ldw	x, y
      009E0C CD A8 8F         [ 4]   91 	call	___memcpy
                                     92 ;	./../../mib/stm8s_mib_debug_mem.c: 66: break;
      009E0F 20 2F            [ 2]   93 	jra	00105$
      009E11                         94 00102$:
                                     95 ;	./../../mib/stm8s_mib_debug_mem.c: 68: index++;
      009E11 1E 07            [ 2]   96 	ldw	x, (0x07, sp)
      009E13 5C               [ 1]   97 	incw	x
      009E14 1F 07            [ 2]   98 	ldw	(0x07, sp), x
      009E16 26 05            [ 1]   99 	jrne	00126$
      009E18 1E 05            [ 2]  100 	ldw	x, (0x05, sp)
      009E1A 5C               [ 1]  101 	incw	x
      009E1B 1F 05            [ 2]  102 	ldw	(0x05, sp), x
      009E1D                        103 00126$:
                                    104 ;	./../../mib/stm8s_mib_debug_mem.c: 69: if(index>MAX_COMMANDS)
      009E1D AE 00 06         [ 2]  105 	ldw	x, #0x0006
      009E20 13 07            [ 2]  106 	cpw	x, (0x07, sp)
      009E22 4F               [ 1]  107 	clr	a
      009E23 12 06            [ 1]  108 	sbc	a, (0x06, sp)
      009E25 4F               [ 1]  109 	clr	a
      009E26 12 05            [ 1]  110 	sbc	a, (0x05, sp)
      009E28 24 0B            [ 1]  111 	jrnc	00107$
                                    112 ;	./../../mib/stm8s_mib_debug_mem.c: 71: ccprintf(1,("INFO:-cmd_mem...\r\n"));
      009E2A 4B 02            [ 1]  113 	push	#<(__str_1+0)
      009E2C 4B 84            [ 1]  114 	push	#((__str_1+0) >> 8)
      009E2E CD 96 77         [ 4]  115 	call	_mib_printf
      009E31 5B 02            [ 2]  116 	addw	sp, #2
                                    117 ;	./../../mib/stm8s_mib_debug_mem.c: 72: return;
      009E33 20 0B            [ 2]  118 	jra	00108$
      009E35                        119 00107$:
                                    120 ;	./../../mib/stm8s_mib_debug_mem.c: 60: for (cptr = cmdTbl;; cptr++) 
      009E35 1E 09            [ 2]  121 	ldw	x, (0x09, sp)
      009E37 1C 00 06         [ 2]  122 	addw	x, #0x0006
      009E3A 1F 09            [ 2]  123 	ldw	(0x09, sp), x
      009E3C 1F 01            [ 2]  124 	ldw	(0x01, sp), x
      009E3E 20 B1            [ 2]  125 	jra	00106$
      009E40                        126 00105$:
                                    127 ;	./../../mib/stm8s_mib_debug_mem.c: 75: return;
      009E40                        128 00108$:
                                    129 ;	./../../mib/stm8s_mib_debug_mem.c: 76: }
      009E40 5B 0A            [ 2]  130 	addw	sp, #10
      009E42 81               [ 4]  131 	ret
                                    132 ;	./../../mib/stm8s_mib_debug_mem.c: 86: static int DoMem(CMD_MY *cptr, int argc, char **argv)
                                    133 ;	-----------------------------------------
                                    134 ;	 function DoMem
                                    135 ;	-----------------------------------------
      009E43                        136 _DoMem:
      009E43 52 29            [ 2]  137 	sub	sp, #41
      009E45 1F 24            [ 2]  138 	ldw	(0x24, sp), x
                                    139 ;	./../../mib/stm8s_mib_debug_mem.c: 88: uint32_t addr = 0;
      009E47 5F               [ 1]  140 	clrw	x
      009E48 1F 03            [ 2]  141 	ldw	(0x03, sp), x
      009E4A 1F 01            [ 2]  142 	ldw	(0x01, sp), x
                                    143 ;	./../../mib/stm8s_mib_debug_mem.c: 100: if (argc < 3)
      009E4C 1E 2C            [ 2]  144 	ldw	x, (0x2c, sp)
      009E4E A3 00 03         [ 2]  145 	cpw	x, #0x0003
      009E51 2E 0B            [ 1]  146 	jrsge	00102$
                                    147 ;	./../../mib/stm8s_mib_debug_mem.c: 102: MibWriteDebugString(cptr->usage);
      009E53 1E 24            [ 2]  148 	ldw	x, (0x24, sp)
      009E55 EE 04            [ 2]  149 	ldw	x, (0x4, x)
      009E57 CD 8C 65         [ 4]  150 	call	_MibWriteDebugString
                                    151 ;	./../../mib/stm8s_mib_debug_mem.c: 103: return FALSE;
      009E5A 5F               [ 1]  152 	clrw	x
      009E5B CC A5 B8         [ 2]  153 	jp	00235$
      009E5E                        154 00102$:
                                    155 ;	./../../mib/stm8s_mib_debug_mem.c: 105: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      009E5E 1E 2E            [ 2]  156 	ldw	x, (0x2e, sp)
      009E60 5C               [ 1]  157 	incw	x
      009E61 5C               [ 1]  158 	incw	x
      009E62 1F 26            [ 2]  159 	ldw	(0x26, sp), x
      009E64 FE               [ 2]  160 	ldw	x, (x)
      009E65 4B 15            [ 1]  161 	push	#<(___str_2+0)
      009E67 4B 84            [ 1]  162 	push	#((___str_2+0) >> 8)
      009E69 CD A9 13         [ 4]  163 	call	_strcmp
      009E6C 5D               [ 2]  164 	tnzw	x
      009E6D 27 03            [ 1]  165 	jreq	00564$
      009E6F CC 9F 45         [ 2]  166 	jp	00215$
      009E72                        167 00564$:
                                    168 ;	./../../mib/stm8s_mib_debug_mem.c: 107: if (argc < 5)
      009E72 1E 2C            [ 2]  169 	ldw	x, (0x2c, sp)
      009E74 A3 00 05         [ 2]  170 	cpw	x, #0x0005
      009E77 2E 0B            [ 1]  171 	jrsge	00104$
                                    172 ;	./../../mib/stm8s_mib_debug_mem.c: 109: MibWriteDebugString(cptr->usage);
      009E79 1E 24            [ 2]  173 	ldw	x, (0x24, sp)
      009E7B EE 04            [ 2]  174 	ldw	x, (0x4, x)
      009E7D CD 8C 65         [ 4]  175 	call	_MibWriteDebugString
                                    176 ;	./../../mib/stm8s_mib_debug_mem.c: 110: return FALSE;
      009E80 5F               [ 1]  177 	clrw	x
      009E81 CC A5 B8         [ 2]  178 	jp	00235$
      009E84                        179 00104$:
                                    180 ;	./../../mib/stm8s_mib_debug_mem.c: 112: if (!HexToInt(argv[3], &addr, 32))
      009E84 96               [ 1]  181 	ldw	x, sp
      009E85 5C               [ 1]  182 	incw	x
      009E86 51               [ 1]  183 	exgw	x, y
      009E87 1E 2E            [ 2]  184 	ldw	x, (0x2e, sp)
      009E89 EE 06            [ 2]  185 	ldw	x, (0x6, x)
      009E8B 4B 20            [ 1]  186 	push	#0x20
      009E8D 4B 00            [ 1]  187 	push	#0x00
      009E8F 90 89            [ 2]  188 	pushw	y
      009E91 CD 99 86         [ 4]  189 	call	_HexToInt
      009E94 5D               [ 2]  190 	tnzw	x
      009E95 26 0D            [ 1]  191 	jrne	00106$
                                    192 ;	./../../mib/stm8s_mib_debug_mem.c: 114: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009E97 4B 1B            [ 1]  193 	push	#<(__str_3+0)
      009E99 4B 84            [ 1]  194 	push	#((__str_3+0) >> 8)
      009E9B CD 96 77         [ 4]  195 	call	_mib_printf
      009E9E 5B 02            [ 2]  196 	addw	sp, #2
                                    197 ;	./../../mib/stm8s_mib_debug_mem.c: 115: return FALSE;
      009EA0 5F               [ 1]  198 	clrw	x
      009EA1 CC A5 B8         [ 2]  199 	jp	00235$
      009EA4                        200 00106$:
                                    201 ;	./../../mib/stm8s_mib_debug_mem.c: 118: switch (argv[2][0])
      009EA4 1E 2E            [ 2]  202 	ldw	x, (0x2e, sp)
      009EA6 EE 04            [ 2]  203 	ldw	x, (0x4, x)
      009EA8 F6               [ 1]  204 	ld	a, (x)
      009EA9 A1 63            [ 1]  205 	cp	a, #0x63
      009EAB 27 0B            [ 1]  206 	jreq	00107$
      009EAD A1 6C            [ 1]  207 	cp	a, #0x6c
      009EAF 27 5B            [ 1]  208 	jreq	00113$
      009EB1 A1 73            [ 1]  209 	cp	a, #0x73
      009EB3 27 2D            [ 1]  210 	jreq	00110$
      009EB5 CC 9F 3A         [ 2]  211 	jp	00116$
                                    212 ;	./../../mib/stm8s_mib_debug_mem.c: 120: case 'c':
      009EB8                        213 00107$:
                                    214 ;	./../../mib/stm8s_mib_debug_mem.c: 121: if (!HexToInt(argv[4], &c, 8))
      009EB8 96               [ 1]  215 	ldw	x, sp
      009EB9 1C 00 05         [ 2]  216 	addw	x, #5
      009EBC 51               [ 1]  217 	exgw	x, y
      009EBD 1E 2E            [ 2]  218 	ldw	x, (0x2e, sp)
      009EBF EE 08            [ 2]  219 	ldw	x, (0x8, x)
      009EC1 4B 08            [ 1]  220 	push	#0x08
      009EC3 4B 00            [ 1]  221 	push	#0x00
      009EC5 90 89            [ 2]  222 	pushw	y
      009EC7 CD 99 86         [ 4]  223 	call	_HexToInt
      009ECA 5D               [ 2]  224 	tnzw	x
      009ECB 26 0D            [ 1]  225 	jrne	00109$
                                    226 ;	./../../mib/stm8s_mib_debug_mem.c: 123: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009ECD 4B 1B            [ 1]  227 	push	#<(__str_3+0)
      009ECF 4B 84            [ 1]  228 	push	#((__str_3+0) >> 8)
      009ED1 CD 96 77         [ 4]  229 	call	_mib_printf
      009ED4 5B 02            [ 2]  230 	addw	sp, #2
                                    231 ;	./../../mib/stm8s_mib_debug_mem.c: 124: return FALSE;
      009ED6 5F               [ 1]  232 	clrw	x
      009ED7 CC A5 B8         [ 2]  233 	jp	00235$
      009EDA                        234 00109$:
                                    235 ;	./../../mib/stm8s_mib_debug_mem.c: 126: wr_ADDR8(addr, c);
      009EDA 1E 03            [ 2]  236 	ldw	x, (0x03, sp)
      009EDC 7B 05            [ 1]  237 	ld	a, (0x05, sp)
      009EDE F7               [ 1]  238 	ld	(x), a
                                    239 ;	./../../mib/stm8s_mib_debug_mem.c: 127: break;
      009EDF CC A5 B6         [ 2]  240 	jp	00216$
                                    241 ;	./../../mib/stm8s_mib_debug_mem.c: 128: case 's':
      009EE2                        242 00110$:
                                    243 ;	./../../mib/stm8s_mib_debug_mem.c: 129: if (!HexToInt(argv[4], &s, 16))
      009EE2 96               [ 1]  244 	ldw	x, sp
      009EE3 1C 00 06         [ 2]  245 	addw	x, #6
      009EE6 51               [ 1]  246 	exgw	x, y
      009EE7 1E 2E            [ 2]  247 	ldw	x, (0x2e, sp)
      009EE9 EE 08            [ 2]  248 	ldw	x, (0x8, x)
      009EEB 4B 10            [ 1]  249 	push	#0x10
      009EED 4B 00            [ 1]  250 	push	#0x00
      009EEF 90 89            [ 2]  251 	pushw	y
      009EF1 CD 99 86         [ 4]  252 	call	_HexToInt
      009EF4 5D               [ 2]  253 	tnzw	x
      009EF5 26 0D            [ 1]  254 	jrne	00112$
                                    255 ;	./../../mib/stm8s_mib_debug_mem.c: 131: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009EF7 4B 1B            [ 1]  256 	push	#<(__str_3+0)
      009EF9 4B 84            [ 1]  257 	push	#((__str_3+0) >> 8)
      009EFB CD 96 77         [ 4]  258 	call	_mib_printf
      009EFE 5B 02            [ 2]  259 	addw	sp, #2
                                    260 ;	./../../mib/stm8s_mib_debug_mem.c: 132: return FALSE;
      009F00 5F               [ 1]  261 	clrw	x
      009F01 CC A5 B8         [ 2]  262 	jp	00235$
      009F04                        263 00112$:
                                    264 ;	./../../mib/stm8s_mib_debug_mem.c: 134: wr_ADDR16(addr, s);
      009F04 1E 03            [ 2]  265 	ldw	x, (0x03, sp)
      009F06 16 06            [ 2]  266 	ldw	y, (0x06, sp)
      009F08 FF               [ 2]  267 	ldw	(x), y
                                    268 ;	./../../mib/stm8s_mib_debug_mem.c: 135: break;
      009F09 CC A5 B6         [ 2]  269 	jp	00216$
                                    270 ;	./../../mib/stm8s_mib_debug_mem.c: 136: case 'l':
      009F0C                        271 00113$:
                                    272 ;	./../../mib/stm8s_mib_debug_mem.c: 137: if (!HexToInt(argv[4], &l, 32))
      009F0C 96               [ 1]  273 	ldw	x, sp
      009F0D 1C 00 08         [ 2]  274 	addw	x, #8
      009F10 51               [ 1]  275 	exgw	x, y
      009F11 1E 2E            [ 2]  276 	ldw	x, (0x2e, sp)
      009F13 EE 08            [ 2]  277 	ldw	x, (0x8, x)
      009F15 4B 20            [ 1]  278 	push	#0x20
      009F17 4B 00            [ 1]  279 	push	#0x00
      009F19 90 89            [ 2]  280 	pushw	y
      009F1B CD 99 86         [ 4]  281 	call	_HexToInt
      009F1E 5D               [ 2]  282 	tnzw	x
      009F1F 26 0D            [ 1]  283 	jrne	00115$
                                    284 ;	./../../mib/stm8s_mib_debug_mem.c: 139: ccprintf(_DEBUG_CMD_A_, ("Illugal character is useqd.\r\n"));
      009F21 4B 38            [ 1]  285 	push	#<(__str_4+0)
      009F23 4B 84            [ 1]  286 	push	#((__str_4+0) >> 8)
      009F25 CD 96 77         [ 4]  287 	call	_mib_printf
      009F28 5B 02            [ 2]  288 	addw	sp, #2
                                    289 ;	./../../mib/stm8s_mib_debug_mem.c: 140: return FALSE;
      009F2A 5F               [ 1]  290 	clrw	x
      009F2B CC A5 B8         [ 2]  291 	jp	00235$
      009F2E                        292 00115$:
                                    293 ;	./../../mib/stm8s_mib_debug_mem.c: 142: wr_ADDR32(addr, l);
      009F2E 1E 03            [ 2]  294 	ldw	x, (0x03, sp)
      009F30 16 0A            [ 2]  295 	ldw	y, (0x0a, sp)
      009F32 EF 02            [ 2]  296 	ldw	(0x2, x), y
      009F34 16 08            [ 2]  297 	ldw	y, (0x08, sp)
      009F36 FF               [ 2]  298 	ldw	(x), y
                                    299 ;	./../../mib/stm8s_mib_debug_mem.c: 143: break;
      009F37 CC A5 B6         [ 2]  300 	jp	00216$
                                    301 ;	./../../mib/stm8s_mib_debug_mem.c: 144: default:
      009F3A                        302 00116$:
                                    303 ;	./../../mib/stm8s_mib_debug_mem.c: 145: MibWriteDebugString(cptr->usage);
      009F3A 1E 24            [ 2]  304 	ldw	x, (0x24, sp)
      009F3C EE 04            [ 2]  305 	ldw	x, (0x4, x)
      009F3E CD 8C 65         [ 4]  306 	call	_MibWriteDebugString
                                    307 ;	./../../mib/stm8s_mib_debug_mem.c: 146: return FALSE;
      009F41 5F               [ 1]  308 	clrw	x
      009F42 CC A5 B8         [ 2]  309 	jp	00235$
                                    310 ;	./../../mib/stm8s_mib_debug_mem.c: 147: }		
      009F45                        311 00215$:
                                    312 ;	./../../mib/stm8s_mib_debug_mem.c: 149: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      009F45 1E 26            [ 2]  313 	ldw	x, (0x26, sp)
      009F47 FE               [ 2]  314 	ldw	x, (x)
      009F48 4B 56            [ 1]  315 	push	#<(___str_5+0)
      009F4A 4B 84            [ 1]  316 	push	#((___str_5+0) >> 8)
      009F4C CD A9 13         [ 4]  317 	call	_strcmp
      009F4F 5D               [ 2]  318 	tnzw	x
      009F50 27 03            [ 1]  319 	jreq	00579$
      009F52 CC A0 09         [ 2]  320 	jp	00212$
      009F55                        321 00579$:
                                    322 ;	./../../mib/stm8s_mib_debug_mem.c: 151: if (argc < 4)
      009F55 1E 2C            [ 2]  323 	ldw	x, (0x2c, sp)
      009F57 A3 00 04         [ 2]  324 	cpw	x, #0x0004
      009F5A 2E 0B            [ 1]  325 	jrsge	00119$
                                    326 ;	./../../mib/stm8s_mib_debug_mem.c: 153: MibWriteDebugString(cptr->usage);
      009F5C 1E 24            [ 2]  327 	ldw	x, (0x24, sp)
      009F5E EE 04            [ 2]  328 	ldw	x, (0x4, x)
      009F60 CD 8C 65         [ 4]  329 	call	_MibWriteDebugString
                                    330 ;	./../../mib/stm8s_mib_debug_mem.c: 154: return FALSE;
      009F63 5F               [ 1]  331 	clrw	x
      009F64 CC A5 B8         [ 2]  332 	jp	00235$
      009F67                        333 00119$:
                                    334 ;	./../../mib/stm8s_mib_debug_mem.c: 156: if (!HexToInt(argv[3], &addr, 32))
      009F67 96               [ 1]  335 	ldw	x, sp
      009F68 5C               [ 1]  336 	incw	x
      009F69 51               [ 1]  337 	exgw	x, y
      009F6A 1E 2E            [ 2]  338 	ldw	x, (0x2e, sp)
      009F6C EE 06            [ 2]  339 	ldw	x, (0x6, x)
      009F6E 4B 20            [ 1]  340 	push	#0x20
      009F70 4B 00            [ 1]  341 	push	#0x00
      009F72 90 89            [ 2]  342 	pushw	y
      009F74 CD 99 86         [ 4]  343 	call	_HexToInt
      009F77 5D               [ 2]  344 	tnzw	x
      009F78 26 0D            [ 1]  345 	jrne	00121$
                                    346 ;	./../../mib/stm8s_mib_debug_mem.c: 158: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009F7A 4B 1B            [ 1]  347 	push	#<(__str_3+0)
      009F7C 4B 84            [ 1]  348 	push	#((__str_3+0) >> 8)
      009F7E CD 96 77         [ 4]  349 	call	_mib_printf
      009F81 5B 02            [ 2]  350 	addw	sp, #2
                                    351 ;	./../../mib/stm8s_mib_debug_mem.c: 159: return FALSE;
      009F83 5F               [ 1]  352 	clrw	x
      009F84 CC A5 B8         [ 2]  353 	jp	00235$
      009F87                        354 00121$:
                                    355 ;	./../../mib/stm8s_mib_debug_mem.c: 161: ccprintf(_DEBUG_CMD_A_,("\taddress : 0x%08lx  ", addr));
      009F87 1E 03            [ 2]  356 	ldw	x, (0x03, sp)
      009F89 89               [ 2]  357 	pushw	x
      009F8A 1E 03            [ 2]  358 	ldw	x, (0x03, sp)
      009F8C 89               [ 2]  359 	pushw	x
      009F8D 4B 5B            [ 1]  360 	push	#<(__str_6+0)
      009F8F 4B 84            [ 1]  361 	push	#((__str_6+0) >> 8)
      009F91 CD 96 77         [ 4]  362 	call	_mib_printf
      009F94 5B 06            [ 2]  363 	addw	sp, #6
                                    364 ;	./../../mib/stm8s_mib_debug_mem.c: 162: ccprintf(_DEBUG_CMD_A_, ("\tvalue   : "));
      009F96 4B 70            [ 1]  365 	push	#<(__str_7+0)
      009F98 4B 84            [ 1]  366 	push	#((__str_7+0) >> 8)
      009F9A CD 96 77         [ 4]  367 	call	_mib_printf
      009F9D 5B 02            [ 2]  368 	addw	sp, #2
                                    369 ;	./../../mib/stm8s_mib_debug_mem.c: 163: switch (argv[2][0])
      009F9F 1E 2E            [ 2]  370 	ldw	x, (0x2e, sp)
      009FA1 EE 04            [ 2]  371 	ldw	x, (0x4, x)
      009FA3 F6               [ 1]  372 	ld	a, (x)
      009FA4 A1 63            [ 1]  373 	cp	a, #0x63
      009FA6 27 0A            [ 1]  374 	jreq	00122$
      009FA8 A1 6C            [ 1]  375 	cp	a, #0x6c
      009FAA 27 2A            [ 1]  376 	jreq	00124$
      009FAC A1 73            [ 1]  377 	cp	a, #0x73
      009FAE 27 15            [ 1]  378 	jreq	00123$
      009FB0 20 3E            [ 2]  379 	jra	00125$
                                    380 ;	./../../mib/stm8s_mib_debug_mem.c: 165: case 'c':
      009FB2                        381 00122$:
                                    382 ;	./../../mib/stm8s_mib_debug_mem.c: 166: c = rd_ADDR8(addr);
      009FB2 1E 03            [ 2]  383 	ldw	x, (0x03, sp)
      009FB4 F6               [ 1]  384 	ld	a, (x)
      009FB5 6B 05            [ 1]  385 	ld	(0x05, sp), a
                                    386 ;	./../../mib/stm8s_mib_debug_mem.c: 167: ccprintf(_DEBUG_CMD_A_,("0x%02x ", c));
      009FB7 5F               [ 1]  387 	clrw	x
      009FB8 97               [ 1]  388 	ld	xl, a
      009FB9 89               [ 2]  389 	pushw	x
      009FBA 4B 7C            [ 1]  390 	push	#<(__str_8+0)
      009FBC 4B 84            [ 1]  391 	push	#((__str_8+0) >> 8)
      009FBE CD 96 77         [ 4]  392 	call	_mib_printf
      009FC1 5B 04            [ 2]  393 	addw	sp, #4
                                    394 ;	./../../mib/stm8s_mib_debug_mem.c: 168: break;
      009FC3 20 38            [ 2]  395 	jra	00126$
                                    396 ;	./../../mib/stm8s_mib_debug_mem.c: 169: case 's':
      009FC5                        397 00123$:
                                    398 ;	./../../mib/stm8s_mib_debug_mem.c: 170: s = rd_ADDR16(addr);
      009FC5 1E 03            [ 2]  399 	ldw	x, (0x03, sp)
      009FC7 FE               [ 2]  400 	ldw	x, (x)
      009FC8 1F 06            [ 2]  401 	ldw	(0x06, sp), x
                                    402 ;	./../../mib/stm8s_mib_debug_mem.c: 171: ccprintf(_DEBUG_CMD_A_,("0x%04x", s));
      009FCA 89               [ 2]  403 	pushw	x
      009FCB 4B 84            [ 1]  404 	push	#<(__str_9+0)
      009FCD 4B 84            [ 1]  405 	push	#((__str_9+0) >> 8)
      009FCF CD 96 77         [ 4]  406 	call	_mib_printf
      009FD2 5B 04            [ 2]  407 	addw	sp, #4
                                    408 ;	./../../mib/stm8s_mib_debug_mem.c: 172: break;
      009FD4 20 27            [ 2]  409 	jra	00126$
                                    410 ;	./../../mib/stm8s_mib_debug_mem.c: 173: case 'l':
      009FD6                        411 00124$:
                                    412 ;	./../../mib/stm8s_mib_debug_mem.c: 174: l = rd_ADDR32(addr);
      009FD6 1E 03            [ 2]  413 	ldw	x, (0x03, sp)
      009FD8 90 93            [ 1]  414 	ldw	y, x
      009FDA 90 EE 02         [ 2]  415 	ldw	y, (0x2, y)
      009FDD FE               [ 2]  416 	ldw	x, (x)
      009FDE 17 0A            [ 2]  417 	ldw	(0x0a, sp), y
      009FE0 1F 08            [ 2]  418 	ldw	(0x08, sp), x
                                    419 ;	./../../mib/stm8s_mib_debug_mem.c: 175: ccprintf(_DEBUG_CMD_A_,("0x%08lx", l));
      009FE2 90 89            [ 2]  420 	pushw	y
      009FE4 89               [ 2]  421 	pushw	x
      009FE5 4B 8B            [ 1]  422 	push	#<(__str_10+0)
      009FE7 4B 84            [ 1]  423 	push	#((__str_10+0) >> 8)
      009FE9 CD 96 77         [ 4]  424 	call	_mib_printf
      009FEC 5B 06            [ 2]  425 	addw	sp, #6
                                    426 ;	./../../mib/stm8s_mib_debug_mem.c: 176: break;
      009FEE 20 0D            [ 2]  427 	jra	00126$
                                    428 ;	./../../mib/stm8s_mib_debug_mem.c: 177: default:
      009FF0                        429 00125$:
                                    430 ;	./../../mib/stm8s_mib_debug_mem.c: 178: ccprintf(_DEBUG_CMD_A_, ("Error.\r\n"));
      009FF0 4B 93            [ 1]  431 	push	#<(__str_11+0)
      009FF2 4B 84            [ 1]  432 	push	#((__str_11+0) >> 8)
      009FF4 CD 96 77         [ 4]  433 	call	_mib_printf
      009FF7 5B 02            [ 2]  434 	addw	sp, #2
                                    435 ;	./../../mib/stm8s_mib_debug_mem.c: 179: return FALSE;
      009FF9 5F               [ 1]  436 	clrw	x
      009FFA CC A5 B8         [ 2]  437 	jp	00235$
                                    438 ;	./../../mib/stm8s_mib_debug_mem.c: 180: }
      009FFD                        439 00126$:
                                    440 ;	./../../mib/stm8s_mib_debug_mem.c: 181: ccprintf(_DEBUG_CMD_A_, (".\r\n"));		
      009FFD 4B 9C            [ 1]  441 	push	#<(__str_12+0)
      009FFF 4B 84            [ 1]  442 	push	#((__str_12+0) >> 8)
      00A001 CD 96 77         [ 4]  443 	call	_mib_printf
      00A004 5B 02            [ 2]  444 	addw	sp, #2
      00A006 CC A5 B6         [ 2]  445 	jp	00216$
      00A009                        446 00212$:
                                    447 ;	./../../mib/stm8s_mib_debug_mem.c: 183: else if (!strcmp(argv[1], "wrn")) // _CMD_MY_WRITE_
      00A009 1E 26            [ 2]  448 	ldw	x, (0x26, sp)
      00A00B FE               [ 2]  449 	ldw	x, (x)
      00A00C 4B A0            [ 1]  450 	push	#<(___str_13+0)
      00A00E 4B 84            [ 1]  451 	push	#((___str_13+0) >> 8)
      00A010 CD A9 13         [ 4]  452 	call	_strcmp
      00A013 5D               [ 2]  453 	tnzw	x
      00A014 27 03            [ 1]  454 	jreq	00591$
      00A016 CC A1 A0         [ 2]  455 	jp	00209$
      00A019                        456 00591$:
                                    457 ;	./../../mib/stm8s_mib_debug_mem.c: 186: if (argc < 6)
      00A019 1E 2C            [ 2]  458 	ldw	x, (0x2c, sp)
      00A01B A3 00 06         [ 2]  459 	cpw	x, #0x0006
      00A01E 2E 0B            [ 1]  460 	jrsge	00128$
                                    461 ;	./../../mib/stm8s_mib_debug_mem.c: 188: MibWriteDebugString(cptr->usage);
      00A020 1E 24            [ 2]  462 	ldw	x, (0x24, sp)
      00A022 EE 04            [ 2]  463 	ldw	x, (0x4, x)
      00A024 CD 8C 65         [ 4]  464 	call	_MibWriteDebugString
                                    465 ;	./../../mib/stm8s_mib_debug_mem.c: 189: return FALSE;
      00A027 5F               [ 1]  466 	clrw	x
      00A028 CC A5 B8         [ 2]  467 	jp	00235$
      00A02B                        468 00128$:
                                    469 ;	./../../mib/stm8s_mib_debug_mem.c: 191: if (!HexToInt(argv[3], &addr, 32))
      00A02B 96               [ 1]  470 	ldw	x, sp
      00A02C 5C               [ 1]  471 	incw	x
      00A02D 51               [ 1]  472 	exgw	x, y
      00A02E 1E 2E            [ 2]  473 	ldw	x, (0x2e, sp)
      00A030 EE 06            [ 2]  474 	ldw	x, (0x6, x)
      00A032 4B 20            [ 1]  475 	push	#0x20
      00A034 4B 00            [ 1]  476 	push	#0x00
      00A036 90 89            [ 2]  477 	pushw	y
      00A038 CD 99 86         [ 4]  478 	call	_HexToInt
      00A03B 5D               [ 2]  479 	tnzw	x
      00A03C 26 0D            [ 1]  480 	jrne	00130$
                                    481 ;	./../../mib/stm8s_mib_debug_mem.c: 193: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A03E 4B 1B            [ 1]  482 	push	#<(__str_3+0)
      00A040 4B 84            [ 1]  483 	push	#((__str_3+0) >> 8)
      00A042 CD 96 77         [ 4]  484 	call	_mib_printf
      00A045 5B 02            [ 2]  485 	addw	sp, #2
                                    486 ;	./../../mib/stm8s_mib_debug_mem.c: 194: return FALSE;
      00A047 5F               [ 1]  487 	clrw	x
      00A048 CC A5 B8         [ 2]  488 	jp	00235$
      00A04B                        489 00130$:
                                    490 ;	./../../mib/stm8s_mib_debug_mem.c: 196: if (!HexToInt(argv[5], &v_Loop, 32))
      00A04B 96               [ 1]  491 	ldw	x, sp
      00A04C 1C 00 18         [ 2]  492 	addw	x, #24
      00A04F 51               [ 1]  493 	exgw	x, y
      00A050 1E 2E            [ 2]  494 	ldw	x, (0x2e, sp)
      00A052 EE 0A            [ 2]  495 	ldw	x, (0xa, x)
      00A054 4B 20            [ 1]  496 	push	#0x20
      00A056 4B 00            [ 1]  497 	push	#0x00
      00A058 90 89            [ 2]  498 	pushw	y
      00A05A CD 99 86         [ 4]  499 	call	_HexToInt
      00A05D 5D               [ 2]  500 	tnzw	x
      00A05E 26 0D            [ 1]  501 	jrne	00132$
                                    502 ;	./../../mib/stm8s_mib_debug_mem.c: 198: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A060 4B 1B            [ 1]  503 	push	#<(__str_3+0)
      00A062 4B 84            [ 1]  504 	push	#((__str_3+0) >> 8)
      00A064 CD 96 77         [ 4]  505 	call	_mib_printf
      00A067 5B 02            [ 2]  506 	addw	sp, #2
                                    507 ;	./../../mib/stm8s_mib_debug_mem.c: 199: return FALSE;
      00A069 5F               [ 1]  508 	clrw	x
      00A06A CC A5 B8         [ 2]  509 	jp	00235$
      00A06D                        510 00132$:
                                    511 ;	./../../mib/stm8s_mib_debug_mem.c: 201: switch (argv[2][0])
      00A06D 1E 2E            [ 2]  512 	ldw	x, (0x2e, sp)
      00A06F EE 04            [ 2]  513 	ldw	x, (0x4, x)
      00A071 F6               [ 1]  514 	ld	a, (x)
      00A072 A1 63            [ 1]  515 	cp	a, #0x63
      00A074 27 0E            [ 1]  516 	jreq	00133$
      00A076 A1 6C            [ 1]  517 	cp	a, #0x6c
      00A078 26 03            [ 1]  518 	jrne	00599$
      00A07A CC A1 31         [ 2]  519 	jp	00141$
      00A07D                        520 00599$:
      00A07D A1 73            [ 1]  521 	cp	a, #0x73
      00A07F 27 55            [ 1]  522 	jreq	00137$
      00A081 CC A1 90         [ 2]  523 	jp	00145$
                                    524 ;	./../../mib/stm8s_mib_debug_mem.c: 203: case 'c':
      00A084                        525 00133$:
                                    526 ;	./../../mib/stm8s_mib_debug_mem.c: 204: if (!HexToInt(argv[4], &c, 8))
      00A084 96               [ 1]  527 	ldw	x, sp
      00A085 1C 00 05         [ 2]  528 	addw	x, #5
      00A088 16 2E            [ 2]  529 	ldw	y, (0x2e, sp)
      00A08A 90 EE 08         [ 2]  530 	ldw	y, (0x8, y)
      00A08D 4B 08            [ 1]  531 	push	#0x08
      00A08F 4B 00            [ 1]  532 	push	#0x00
      00A091 89               [ 2]  533 	pushw	x
      00A092 93               [ 1]  534 	ldw	x, y
      00A093 CD 99 86         [ 4]  535 	call	_HexToInt
      00A096 5D               [ 2]  536 	tnzw	x
      00A097 26 0D            [ 1]  537 	jrne	00262$
                                    538 ;	./../../mib/stm8s_mib_debug_mem.c: 206: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A099 4B 1B            [ 1]  539 	push	#<(__str_3+0)
      00A09B 4B 84            [ 1]  540 	push	#((__str_3+0) >> 8)
      00A09D CD 96 77         [ 4]  541 	call	_mib_printf
      00A0A0 5B 02            [ 2]  542 	addw	sp, #2
                                    543 ;	./../../mib/stm8s_mib_debug_mem.c: 207: return FALSE;
      00A0A2 5F               [ 1]  544 	clrw	x
      00A0A3 CC A5 B8         [ 2]  545 	jp	00235$
      00A0A6                        546 00262$:
      00A0A6 16 1A            [ 2]  547 	ldw	y, (0x1a, sp)
      00A0A8 17 28            [ 2]  548 	ldw	(0x28, sp), y
      00A0AA 16 18            [ 2]  549 	ldw	y, (0x18, sp)
      00A0AC 17 26            [ 2]  550 	ldw	(0x26, sp), y
      00A0AE                        551 00218$:
                                    552 ;	./../../mib/stm8s_mib_debug_mem.c: 209: for (; v_Loop; v_Loop--) wr_ADDR8(addr, c);
      00A0AE 1E 28            [ 2]  553 	ldw	x, (0x28, sp)
      00A0B0 26 07            [ 1]  554 	jrne	00605$
      00A0B2 1E 26            [ 2]  555 	ldw	x, (0x26, sp)
      00A0B4 26 03            [ 1]  556 	jrne	00605$
      00A0B6 CC A5 9A         [ 2]  557 	jp	00301$
      00A0B9                        558 00605$:
      00A0B9 1E 03            [ 2]  559 	ldw	x, (0x03, sp)
      00A0BB 7B 05            [ 1]  560 	ld	a, (0x05, sp)
      00A0BD F7               [ 1]  561 	ld	(x), a
      00A0BE 1E 28            [ 2]  562 	ldw	x, (0x28, sp)
      00A0C0 1D 00 01         [ 2]  563 	subw	x, #0x0001
      00A0C3 1F 28            [ 2]  564 	ldw	(0x28, sp), x
      00A0C5 1E 26            [ 2]  565 	ldw	x, (0x26, sp)
      00A0C7 24 01            [ 1]  566 	jrnc	00606$
      00A0C9 5A               [ 2]  567 	decw	x
      00A0CA                        568 00606$:
      00A0CA 1F 26            [ 2]  569 	ldw	(0x26, sp), x
      00A0CC 16 28            [ 2]  570 	ldw	y, (0x28, sp)
      00A0CE 17 1A            [ 2]  571 	ldw	(0x1a, sp), y
      00A0D0 16 26            [ 2]  572 	ldw	y, (0x26, sp)
      00A0D2 17 18            [ 2]  573 	ldw	(0x18, sp), y
      00A0D4 20 D8            [ 2]  574 	jra	00218$
                                    575 ;	./../../mib/stm8s_mib_debug_mem.c: 211: case 's':
      00A0D6                        576 00137$:
                                    577 ;	./../../mib/stm8s_mib_debug_mem.c: 212: if (!HexToInt(argv[4], &s, 16))
      00A0D6 16 2E            [ 2]  578 	ldw	y, (0x2e, sp)
      00A0D8 17 26            [ 2]  579 	ldw	(0x26, sp), y
      00A0DA 93               [ 1]  580 	ldw	x, y
      00A0DB EE 08            [ 2]  581 	ldw	x, (0x8, x)
      00A0DD 1F 28            [ 2]  582 	ldw	(0x28, sp), x
      00A0DF 4B 10            [ 1]  583 	push	#0x10
      00A0E1 4B 00            [ 1]  584 	push	#0x00
      00A0E3 96               [ 1]  585 	ldw	x, sp
      00A0E4 1C 00 08         [ 2]  586 	addw	x, #8
      00A0E7 89               [ 2]  587 	pushw	x
      00A0E8 1E 2C            [ 2]  588 	ldw	x, (0x2c, sp)
      00A0EA CD 99 86         [ 4]  589 	call	_HexToInt
      00A0ED 1F 28            [ 2]  590 	ldw	(0x28, sp), x
      00A0EF 26 0D            [ 1]  591 	jrne	00265$
                                    592 ;	./../../mib/stm8s_mib_debug_mem.c: 214: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A0F1 4B 1B            [ 1]  593 	push	#<(__str_3+0)
      00A0F3 4B 84            [ 1]  594 	push	#((__str_3+0) >> 8)
      00A0F5 CD 96 77         [ 4]  595 	call	_mib_printf
      00A0F8 5B 02            [ 2]  596 	addw	sp, #2
                                    597 ;	./../../mib/stm8s_mib_debug_mem.c: 215: return FALSE;
      00A0FA 5F               [ 1]  598 	clrw	x
      00A0FB CC A5 B8         [ 2]  599 	jp	00235$
      00A0FE                        600 00265$:
      00A0FE 16 1A            [ 2]  601 	ldw	y, (0x1a, sp)
      00A100 17 28            [ 2]  602 	ldw	(0x28, sp), y
      00A102 16 18            [ 2]  603 	ldw	y, (0x18, sp)
      00A104 17 26            [ 2]  604 	ldw	(0x26, sp), y
      00A106                        605 00221$:
                                    606 ;	./../../mib/stm8s_mib_debug_mem.c: 217: for (; v_Loop; v_Loop--) wr_ADDR16(addr, s);
      00A106 1E 28            [ 2]  607 	ldw	x, (0x28, sp)
      00A108 26 07            [ 1]  608 	jrne	00608$
      00A10A 1E 26            [ 2]  609 	ldw	x, (0x26, sp)
      00A10C 26 03            [ 1]  610 	jrne	00608$
      00A10E CC A5 A4         [ 2]  611 	jp	00302$
      00A111                        612 00608$:
      00A111 16 03            [ 2]  613 	ldw	y, (0x03, sp)
      00A113 17 22            [ 2]  614 	ldw	(0x22, sp), y
      00A115 93               [ 1]  615 	ldw	x, y
      00A116 16 06            [ 2]  616 	ldw	y, (0x06, sp)
      00A118 FF               [ 2]  617 	ldw	(x), y
      00A119 1E 28            [ 2]  618 	ldw	x, (0x28, sp)
      00A11B 1D 00 01         [ 2]  619 	subw	x, #0x0001
      00A11E 1F 28            [ 2]  620 	ldw	(0x28, sp), x
      00A120 1E 26            [ 2]  621 	ldw	x, (0x26, sp)
      00A122 24 01            [ 1]  622 	jrnc	00609$
      00A124 5A               [ 2]  623 	decw	x
      00A125                        624 00609$:
      00A125 1F 26            [ 2]  625 	ldw	(0x26, sp), x
      00A127 16 28            [ 2]  626 	ldw	y, (0x28, sp)
      00A129 17 1A            [ 2]  627 	ldw	(0x1a, sp), y
      00A12B 16 26            [ 2]  628 	ldw	y, (0x26, sp)
      00A12D 17 18            [ 2]  629 	ldw	(0x18, sp), y
      00A12F 20 D5            [ 2]  630 	jra	00221$
                                    631 ;	./../../mib/stm8s_mib_debug_mem.c: 219: case 'l':
      00A131                        632 00141$:
                                    633 ;	./../../mib/stm8s_mib_debug_mem.c: 220: if (!HexToInt(argv[4], &l, 32))
      00A131 16 2E            [ 2]  634 	ldw	y, (0x2e, sp)
      00A133 17 26            [ 2]  635 	ldw	(0x26, sp), y
      00A135 93               [ 1]  636 	ldw	x, y
      00A136 EE 08            [ 2]  637 	ldw	x, (0x8, x)
      00A138 1F 28            [ 2]  638 	ldw	(0x28, sp), x
      00A13A 4B 20            [ 1]  639 	push	#0x20
      00A13C 4B 00            [ 1]  640 	push	#0x00
      00A13E 96               [ 1]  641 	ldw	x, sp
      00A13F 1C 00 0A         [ 2]  642 	addw	x, #10
      00A142 89               [ 2]  643 	pushw	x
      00A143 1E 2C            [ 2]  644 	ldw	x, (0x2c, sp)
      00A145 CD 99 86         [ 4]  645 	call	_HexToInt
      00A148 1F 28            [ 2]  646 	ldw	(0x28, sp), x
      00A14A 26 0D            [ 1]  647 	jrne	00268$
                                    648 ;	./../../mib/stm8s_mib_debug_mem.c: 222: ccprintf(_DEBUG_CMD_A_, ("Illugal character is useqd.\r\n"));
      00A14C 4B 38            [ 1]  649 	push	#<(__str_4+0)
      00A14E 4B 84            [ 1]  650 	push	#((__str_4+0) >> 8)
      00A150 CD 96 77         [ 4]  651 	call	_mib_printf
      00A153 5B 02            [ 2]  652 	addw	sp, #2
                                    653 ;	./../../mib/stm8s_mib_debug_mem.c: 223: return FALSE;
      00A155 5F               [ 1]  654 	clrw	x
      00A156 CC A5 B8         [ 2]  655 	jp	00235$
      00A159                        656 00268$:
      00A159 16 1A            [ 2]  657 	ldw	y, (0x1a, sp)
      00A15B 17 28            [ 2]  658 	ldw	(0x28, sp), y
      00A15D 16 18            [ 2]  659 	ldw	y, (0x18, sp)
      00A15F 17 26            [ 2]  660 	ldw	(0x26, sp), y
      00A161                        661 00224$:
                                    662 ;	./../../mib/stm8s_mib_debug_mem.c: 225: for (; v_Loop; v_Loop--) wr_ADDR32(addr, l);
      00A161 1E 28            [ 2]  663 	ldw	x, (0x28, sp)
      00A163 26 07            [ 1]  664 	jrne	00611$
      00A165 1E 26            [ 2]  665 	ldw	x, (0x26, sp)
      00A167 26 03            [ 1]  666 	jrne	00611$
      00A169 CC A5 AE         [ 2]  667 	jp	00303$
      00A16C                        668 00611$:
      00A16C 16 03            [ 2]  669 	ldw	y, (0x03, sp)
      00A16E 17 22            [ 2]  670 	ldw	(0x22, sp), y
      00A170 93               [ 1]  671 	ldw	x, y
      00A171 16 0A            [ 2]  672 	ldw	y, (0x0a, sp)
      00A173 EF 02            [ 2]  673 	ldw	(0x2, x), y
      00A175 16 08            [ 2]  674 	ldw	y, (0x08, sp)
      00A177 FF               [ 2]  675 	ldw	(x), y
      00A178 1E 28            [ 2]  676 	ldw	x, (0x28, sp)
      00A17A 1D 00 01         [ 2]  677 	subw	x, #0x0001
      00A17D 1F 28            [ 2]  678 	ldw	(0x28, sp), x
      00A17F 1E 26            [ 2]  679 	ldw	x, (0x26, sp)
      00A181 24 01            [ 1]  680 	jrnc	00612$
      00A183 5A               [ 2]  681 	decw	x
      00A184                        682 00612$:
      00A184 1F 26            [ 2]  683 	ldw	(0x26, sp), x
      00A186 16 28            [ 2]  684 	ldw	y, (0x28, sp)
      00A188 17 1A            [ 2]  685 	ldw	(0x1a, sp), y
      00A18A 16 26            [ 2]  686 	ldw	y, (0x26, sp)
      00A18C 17 18            [ 2]  687 	ldw	(0x18, sp), y
      00A18E 20 D1            [ 2]  688 	jra	00224$
                                    689 ;	./../../mib/stm8s_mib_debug_mem.c: 227: default:
      00A190                        690 00145$:
                                    691 ;	./../../mib/stm8s_mib_debug_mem.c: 228: MibWriteDebugString(cptr->usage);
      00A190 16 24            [ 2]  692 	ldw	y, (0x24, sp)
      00A192 17 26            [ 2]  693 	ldw	(0x26, sp), y
      00A194 93               [ 1]  694 	ldw	x, y
      00A195 EE 04            [ 2]  695 	ldw	x, (0x4, x)
      00A197 1F 28            [ 2]  696 	ldw	(0x28, sp), x
      00A199 CD 8C 65         [ 4]  697 	call	_MibWriteDebugString
                                    698 ;	./../../mib/stm8s_mib_debug_mem.c: 229: return FALSE;
      00A19C 5F               [ 1]  699 	clrw	x
      00A19D CC A5 B8         [ 2]  700 	jp	00235$
                                    701 ;	./../../mib/stm8s_mib_debug_mem.c: 230: }	
      00A1A0                        702 00209$:
                                    703 ;	./../../mib/stm8s_mib_debug_mem.c: 232: else if (!strcmp(argv[1], "rdn")) // _CMD_MY_READ_
      00A1A0 1E 26            [ 2]  704 	ldw	x, (0x26, sp)
      00A1A2 FE               [ 2]  705 	ldw	x, (x)
      00A1A3 1F 28            [ 2]  706 	ldw	(0x28, sp), x
      00A1A5 4B A4            [ 1]  707 	push	#<(___str_14+0)
      00A1A7 4B 84            [ 1]  708 	push	#((___str_14+0) >> 8)
      00A1A9 1E 2A            [ 2]  709 	ldw	x, (0x2a, sp)
      00A1AB CD A9 13         [ 4]  710 	call	_strcmp
      00A1AE 1F 28            [ 2]  711 	ldw	(0x28, sp), x
      00A1B0 27 03            [ 1]  712 	jreq	00613$
      00A1B2 CC A3 93         [ 2]  713 	jp	00206$
      00A1B5                        714 00613$:
                                    715 ;	./../../mib/stm8s_mib_debug_mem.c: 235: if (argc < 5)
      00A1B5 1E 2C            [ 2]  716 	ldw	x, (0x2c, sp)
      00A1B7 A3 00 05         [ 2]  717 	cpw	x, #0x0005
      00A1BA 2E 10            [ 1]  718 	jrsge	00148$
                                    719 ;	./../../mib/stm8s_mib_debug_mem.c: 237: MibWriteDebugString(cptr->usage);
      00A1BC 16 24            [ 2]  720 	ldw	y, (0x24, sp)
      00A1BE 17 26            [ 2]  721 	ldw	(0x26, sp), y
      00A1C0 93               [ 1]  722 	ldw	x, y
      00A1C1 EE 04            [ 2]  723 	ldw	x, (0x4, x)
      00A1C3 1F 28            [ 2]  724 	ldw	(0x28, sp), x
      00A1C5 CD 8C 65         [ 4]  725 	call	_MibWriteDebugString
                                    726 ;	./../../mib/stm8s_mib_debug_mem.c: 238: return FALSE;
      00A1C8 5F               [ 1]  727 	clrw	x
      00A1C9 CC A5 B8         [ 2]  728 	jp	00235$
      00A1CC                        729 00148$:
                                    730 ;	./../../mib/stm8s_mib_debug_mem.c: 240: if (!HexToInt(argv[3], &addr, 32))
      00A1CC 16 2E            [ 2]  731 	ldw	y, (0x2e, sp)
      00A1CE 17 26            [ 2]  732 	ldw	(0x26, sp), y
      00A1D0 93               [ 1]  733 	ldw	x, y
      00A1D1 EE 06            [ 2]  734 	ldw	x, (0x6, x)
      00A1D3 1F 28            [ 2]  735 	ldw	(0x28, sp), x
      00A1D5 4B 20            [ 1]  736 	push	#0x20
      00A1D7 4B 00            [ 1]  737 	push	#0x00
      00A1D9 96               [ 1]  738 	ldw	x, sp
      00A1DA 1C 00 03         [ 2]  739 	addw	x, #3
      00A1DD 89               [ 2]  740 	pushw	x
      00A1DE 1E 2C            [ 2]  741 	ldw	x, (0x2c, sp)
      00A1E0 CD 99 86         [ 4]  742 	call	_HexToInt
      00A1E3 1F 28            [ 2]  743 	ldw	(0x28, sp), x
      00A1E5 26 0D            [ 1]  744 	jrne	00150$
                                    745 ;	./../../mib/stm8s_mib_debug_mem.c: 242: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A1E7 4B 1B            [ 1]  746 	push	#<(__str_3+0)
      00A1E9 4B 84            [ 1]  747 	push	#((__str_3+0) >> 8)
      00A1EB CD 96 77         [ 4]  748 	call	_mib_printf
      00A1EE 5B 02            [ 2]  749 	addw	sp, #2
                                    750 ;	./../../mib/stm8s_mib_debug_mem.c: 243: return FALSE;
      00A1F0 5F               [ 1]  751 	clrw	x
      00A1F1 CC A5 B8         [ 2]  752 	jp	00235$
      00A1F4                        753 00150$:
                                    754 ;	./../../mib/stm8s_mib_debug_mem.c: 245: if (!HexToInt(argv[4], &v_Loop, 32))
      00A1F4 16 2E            [ 2]  755 	ldw	y, (0x2e, sp)
      00A1F6 17 26            [ 2]  756 	ldw	(0x26, sp), y
      00A1F8 93               [ 1]  757 	ldw	x, y
      00A1F9 EE 08            [ 2]  758 	ldw	x, (0x8, x)
      00A1FB 1F 28            [ 2]  759 	ldw	(0x28, sp), x
      00A1FD 4B 20            [ 1]  760 	push	#0x20
      00A1FF 4B 00            [ 1]  761 	push	#0x00
      00A201 96               [ 1]  762 	ldw	x, sp
      00A202 1C 00 1A         [ 2]  763 	addw	x, #26
      00A205 89               [ 2]  764 	pushw	x
      00A206 1E 2C            [ 2]  765 	ldw	x, (0x2c, sp)
      00A208 CD 99 86         [ 4]  766 	call	_HexToInt
      00A20B 1F 28            [ 2]  767 	ldw	(0x28, sp), x
      00A20D 26 0D            [ 1]  768 	jrne	00152$
                                    769 ;	./../../mib/stm8s_mib_debug_mem.c: 247: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A20F 4B 1B            [ 1]  770 	push	#<(__str_3+0)
      00A211 4B 84            [ 1]  771 	push	#((__str_3+0) >> 8)
      00A213 CD 96 77         [ 4]  772 	call	_mib_printf
      00A216 5B 02            [ 2]  773 	addw	sp, #2
                                    774 ;	./../../mib/stm8s_mib_debug_mem.c: 248: return FALSE;
      00A218 5F               [ 1]  775 	clrw	x
      00A219 CC A5 B8         [ 2]  776 	jp	00235$
      00A21C                        777 00152$:
                                    778 ;	./../../mib/stm8s_mib_debug_mem.c: 250: ccprintf(_DEBUG_CMD_A_,("\taddress : 0x%08lx  ", addr));
      00A21C 1E 03            [ 2]  779 	ldw	x, (0x03, sp)
      00A21E 89               [ 2]  780 	pushw	x
      00A21F 1E 03            [ 2]  781 	ldw	x, (0x03, sp)
      00A221 89               [ 2]  782 	pushw	x
      00A222 4B 5B            [ 1]  783 	push	#<(__str_6+0)
      00A224 4B 84            [ 1]  784 	push	#((__str_6+0) >> 8)
      00A226 CD 96 77         [ 4]  785 	call	_mib_printf
      00A229 5B 06            [ 2]  786 	addw	sp, #6
                                    787 ;	./../../mib/stm8s_mib_debug_mem.c: 251: ccprintf(_DEBUG_CMD_A_,("loop : 0x%08lx  \r\n", v_Loop));
      00A22B 1E 1A            [ 2]  788 	ldw	x, (0x1a, sp)
      00A22D 89               [ 2]  789 	pushw	x
      00A22E 1E 1A            [ 2]  790 	ldw	x, (0x1a, sp)
      00A230 89               [ 2]  791 	pushw	x
      00A231 4B A8            [ 1]  792 	push	#<(__str_15+0)
      00A233 4B 84            [ 1]  793 	push	#((__str_15+0) >> 8)
      00A235 CD 96 77         [ 4]  794 	call	_mib_printf
      00A238 5B 06            [ 2]  795 	addw	sp, #6
                                    796 ;	./../../mib/stm8s_mib_debug_mem.c: 252: ccprintf(_DEBUG_CMD_A_, ("value   : "));
      00A23A 4B BB            [ 1]  797 	push	#<(__str_16+0)
      00A23C 4B 84            [ 1]  798 	push	#((__str_16+0) >> 8)
      00A23E CD 96 77         [ 4]  799 	call	_mib_printf
      00A241 5B 02            [ 2]  800 	addw	sp, #2
                                    801 ;	./../../mib/stm8s_mib_debug_mem.c: 253: switch (argv[2][0])
      00A243 16 2E            [ 2]  802 	ldw	y, (0x2e, sp)
      00A245 17 26            [ 2]  803 	ldw	(0x26, sp), y
      00A247 93               [ 1]  804 	ldw	x, y
      00A248 EE 04            [ 2]  805 	ldw	x, (0x4, x)
      00A24A 1F 28            [ 2]  806 	ldw	(0x28, sp), x
      00A24C F6               [ 1]  807 	ld	a, (x)
      00A24D A1 63            [ 1]  808 	cp	a, #0x63
      00A24F 27 0E            [ 1]  809 	jreq	00278$
      00A251 A1 6C            [ 1]  810 	cp	a, #0x6c
      00A253 26 03            [ 1]  811 	jrne	00621$
      00A255 CC A3 04         [ 2]  812 	jp	00284$
      00A258                        813 00621$:
      00A258 A1 73            [ 1]  814 	cp	a, #0x73
      00A25A 27 59            [ 1]  815 	jreq	00281$
      00A25C CC A3 5E         [ 2]  816 	jp	00165$
                                    817 ;	./../../mib/stm8s_mib_debug_mem.c: 255: case 'c':
      00A25F                        818 00278$:
      00A25F 16 1A            [ 2]  819 	ldw	y, (0x1a, sp)
      00A261 17 28            [ 2]  820 	ldw	(0x28, sp), y
      00A263 16 18            [ 2]  821 	ldw	y, (0x18, sp)
      00A265 17 26            [ 2]  822 	ldw	(0x26, sp), y
      00A267                        823 00227$:
                                    824 ;	./../../mib/stm8s_mib_debug_mem.c: 256: for (; v_Loop; v_Loop--)
      00A267 1E 28            [ 2]  825 	ldw	x, (0x28, sp)
      00A269 26 07            [ 1]  826 	jrne	00626$
      00A26B 1E 26            [ 2]  827 	ldw	x, (0x26, sp)
      00A26D 26 03            [ 1]  828 	jrne	00626$
      00A26F CC A3 6B         [ 2]  829 	jp	00304$
      00A272                        830 00626$:
                                    831 ;	./../../mib/stm8s_mib_debug_mem.c: 258: c = rd_ADDR8(addr);
      00A272 16 03            [ 2]  832 	ldw	y, (0x03, sp)
      00A274 17 22            [ 2]  833 	ldw	(0x22, sp), y
      00A276 93               [ 1]  834 	ldw	x, y
      00A277 F6               [ 1]  835 	ld	a, (x)
      00A278 6B 1F            [ 1]  836 	ld	(0x1f, sp), a
      00A27A 6B 05            [ 1]  837 	ld	(0x05, sp), a
                                    838 ;	./../../mib/stm8s_mib_debug_mem.c: 259: if ((v_Loop & 0xfffff) == 0)
      00A27C 16 28            [ 2]  839 	ldw	y, (0x28, sp)
      00A27E 17 22            [ 2]  840 	ldw	(0x22, sp), y
      00A280 7B 27            [ 1]  841 	ld	a, (0x27, sp)
      00A282 A4 0F            [ 1]  842 	and	a, #0x0f
      00A284 6B 21            [ 1]  843 	ld	(0x21, sp), a
      00A286 0F 20            [ 1]  844 	clr	(0x20, sp)
      00A288 1E 22            [ 2]  845 	ldw	x, (0x22, sp)
      00A28A 26 11            [ 1]  846 	jrne	00228$
                                    847 ;	./../../mib/stm8s_mib_debug_mem.c: 261: ccprintf(_DEBUG_CMD_A_,("0x%02x ", c));
      00A28C 1E 20            [ 2]  848 	ldw	x, (0x20, sp)
      00A28E 26 0D            [ 1]  849 	jrne	00228$
      00A290 7B 1F            [ 1]  850 	ld	a, (0x1f, sp)
      00A292 97               [ 1]  851 	ld	xl, a
      00A293 89               [ 2]  852 	pushw	x
      00A294 4B 7C            [ 1]  853 	push	#<(__str_8+0)
      00A296 4B 84            [ 1]  854 	push	#((__str_8+0) >> 8)
      00A298 CD 96 77         [ 4]  855 	call	_mib_printf
      00A29B 5B 04            [ 2]  856 	addw	sp, #4
      00A29D                        857 00228$:
                                    858 ;	./../../mib/stm8s_mib_debug_mem.c: 256: for (; v_Loop; v_Loop--)
      00A29D 1E 28            [ 2]  859 	ldw	x, (0x28, sp)
      00A29F 1D 00 01         [ 2]  860 	subw	x, #0x0001
      00A2A2 1F 28            [ 2]  861 	ldw	(0x28, sp), x
      00A2A4 1E 26            [ 2]  862 	ldw	x, (0x26, sp)
      00A2A6 24 01            [ 1]  863 	jrnc	00629$
      00A2A8 5A               [ 2]  864 	decw	x
      00A2A9                        865 00629$:
      00A2A9 1F 26            [ 2]  866 	ldw	(0x26, sp), x
      00A2AB 16 28            [ 2]  867 	ldw	y, (0x28, sp)
      00A2AD 17 1A            [ 2]  868 	ldw	(0x1a, sp), y
      00A2AF 16 26            [ 2]  869 	ldw	y, (0x26, sp)
      00A2B1 17 18            [ 2]  870 	ldw	(0x18, sp), y
      00A2B3 20 B2            [ 2]  871 	jra	00227$
                                    872 ;	./../../mib/stm8s_mib_debug_mem.c: 265: case 's':
      00A2B5                        873 00281$:
      00A2B5 16 1A            [ 2]  874 	ldw	y, (0x1a, sp)
      00A2B7 17 28            [ 2]  875 	ldw	(0x28, sp), y
      00A2B9 16 18            [ 2]  876 	ldw	y, (0x18, sp)
      00A2BB 17 26            [ 2]  877 	ldw	(0x26, sp), y
      00A2BD                        878 00230$:
                                    879 ;	./../../mib/stm8s_mib_debug_mem.c: 266: for (; v_Loop; v_Loop--)
      00A2BD 1E 28            [ 2]  880 	ldw	x, (0x28, sp)
      00A2BF 26 07            [ 1]  881 	jrne	00630$
      00A2C1 1E 26            [ 2]  882 	ldw	x, (0x26, sp)
      00A2C3 26 03            [ 1]  883 	jrne	00630$
      00A2C5 CC A3 75         [ 2]  884 	jp	00305$
      00A2C8                        885 00630$:
                                    886 ;	./../../mib/stm8s_mib_debug_mem.c: 268: s = rd_ADDR16(addr);
      00A2C8 1E 03            [ 2]  887 	ldw	x, (0x03, sp)
      00A2CA FE               [ 2]  888 	ldw	x, (x)
      00A2CB 1F 1E            [ 2]  889 	ldw	(0x1e, sp), x
      00A2CD 1F 06            [ 2]  890 	ldw	(0x06, sp), x
                                    891 ;	./../../mib/stm8s_mib_debug_mem.c: 269: if ((v_Loop & 0xfffff) == 0)
      00A2CF 16 28            [ 2]  892 	ldw	y, (0x28, sp)
      00A2D1 17 22            [ 2]  893 	ldw	(0x22, sp), y
      00A2D3 5F               [ 1]  894 	clrw	x
      00A2D4 7B 27            [ 1]  895 	ld	a, (0x27, sp)
      00A2D6 A4 0F            [ 1]  896 	and	a, #0x0f
      00A2D8 97               [ 1]  897 	ld	xl, a
      00A2D9 16 22            [ 2]  898 	ldw	y, (0x22, sp)
      00A2DB 26 0F            [ 1]  899 	jrne	00231$
      00A2DD 5D               [ 2]  900 	tnzw	x
      00A2DE 26 0C            [ 1]  901 	jrne	00231$
                                    902 ;	./../../mib/stm8s_mib_debug_mem.c: 271: ccprintf(_DEBUG_CMD_A_,("0x%04x ", s));
      00A2E0 1E 1E            [ 2]  903 	ldw	x, (0x1e, sp)
      00A2E2 89               [ 2]  904 	pushw	x
      00A2E3 4B C6            [ 1]  905 	push	#<(__str_17+0)
      00A2E5 4B 84            [ 1]  906 	push	#((__str_17+0) >> 8)
      00A2E7 CD 96 77         [ 4]  907 	call	_mib_printf
      00A2EA 5B 04            [ 2]  908 	addw	sp, #4
      00A2EC                        909 00231$:
                                    910 ;	./../../mib/stm8s_mib_debug_mem.c: 266: for (; v_Loop; v_Loop--)
      00A2EC 1E 28            [ 2]  911 	ldw	x, (0x28, sp)
      00A2EE 1D 00 01         [ 2]  912 	subw	x, #0x0001
      00A2F1 1F 28            [ 2]  913 	ldw	(0x28, sp), x
      00A2F3 1E 26            [ 2]  914 	ldw	x, (0x26, sp)
      00A2F5 24 01            [ 1]  915 	jrnc	00633$
      00A2F7 5A               [ 2]  916 	decw	x
      00A2F8                        917 00633$:
      00A2F8 1F 26            [ 2]  918 	ldw	(0x26, sp), x
      00A2FA 16 28            [ 2]  919 	ldw	y, (0x28, sp)
      00A2FC 17 1A            [ 2]  920 	ldw	(0x1a, sp), y
      00A2FE 16 26            [ 2]  921 	ldw	y, (0x26, sp)
      00A300 17 18            [ 2]  922 	ldw	(0x18, sp), y
      00A302 20 B9            [ 2]  923 	jra	00230$
                                    924 ;	./../../mib/stm8s_mib_debug_mem.c: 275: case 'l':
      00A304                        925 00284$:
      00A304 16 1A            [ 2]  926 	ldw	y, (0x1a, sp)
      00A306 17 28            [ 2]  927 	ldw	(0x28, sp), y
      00A308 16 18            [ 2]  928 	ldw	y, (0x18, sp)
      00A30A 17 26            [ 2]  929 	ldw	(0x26, sp), y
      00A30C                        930 00233$:
                                    931 ;	./../../mib/stm8s_mib_debug_mem.c: 276: for (; v_Loop; v_Loop--)
      00A30C 1E 28            [ 2]  932 	ldw	x, (0x28, sp)
      00A30E 26 04            [ 1]  933 	jrne	00634$
      00A310 1E 26            [ 2]  934 	ldw	x, (0x26, sp)
      00A312 27 6B            [ 1]  935 	jreq	00306$
      00A314                        936 00634$:
                                    937 ;	./../../mib/stm8s_mib_debug_mem.c: 278: l = rd_ADDR32(addr);
      00A314 1E 03            [ 2]  938 	ldw	x, (0x03, sp)
      00A316 90 93            [ 1]  939 	ldw	y, x
      00A318 90 EE 02         [ 2]  940 	ldw	y, (0x2, y)
      00A31B FE               [ 2]  941 	ldw	x, (x)
      00A31C 1F 1C            [ 2]  942 	ldw	(0x1c, sp), x
      00A31E 17 0A            [ 2]  943 	ldw	(0x0a, sp), y
      00A320 1E 1C            [ 2]  944 	ldw	x, (0x1c, sp)
      00A322 1F 08            [ 2]  945 	ldw	(0x08, sp), x
                                    946 ;	./../../mib/stm8s_mib_debug_mem.c: 279: if ((v_Loop & 0xfffff) == 0)
      00A324 1E 28            [ 2]  947 	ldw	x, (0x28, sp)
      00A326 1F 22            [ 2]  948 	ldw	(0x22, sp), x
      00A328 7B 27            [ 1]  949 	ld	a, (0x27, sp)
      00A32A A4 0F            [ 1]  950 	and	a, #0x0f
      00A32C 6B 21            [ 1]  951 	ld	(0x21, sp), a
      00A32E 0F 20            [ 1]  952 	clr	(0x20, sp)
      00A330 1E 22            [ 2]  953 	ldw	x, (0x22, sp)
      00A332 26 12            [ 1]  954 	jrne	00234$
      00A334 1E 20            [ 2]  955 	ldw	x, (0x20, sp)
      00A336 26 0E            [ 1]  956 	jrne	00234$
                                    957 ;	./../../mib/stm8s_mib_debug_mem.c: 281: ccprintf(_DEBUG_CMD_A_,("0x%08lx ", l));
      00A338 90 89            [ 2]  958 	pushw	y
      00A33A 1E 1E            [ 2]  959 	ldw	x, (0x1e, sp)
      00A33C 89               [ 2]  960 	pushw	x
      00A33D 4B CE            [ 1]  961 	push	#<(__str_18+0)
      00A33F 4B 84            [ 1]  962 	push	#((__str_18+0) >> 8)
      00A341 CD 96 77         [ 4]  963 	call	_mib_printf
      00A344 5B 06            [ 2]  964 	addw	sp, #6
      00A346                        965 00234$:
                                    966 ;	./../../mib/stm8s_mib_debug_mem.c: 276: for (; v_Loop; v_Loop--)
      00A346 1E 28            [ 2]  967 	ldw	x, (0x28, sp)
      00A348 1D 00 01         [ 2]  968 	subw	x, #0x0001
      00A34B 1F 28            [ 2]  969 	ldw	(0x28, sp), x
      00A34D 1E 26            [ 2]  970 	ldw	x, (0x26, sp)
      00A34F 24 01            [ 1]  971 	jrnc	00637$
      00A351 5A               [ 2]  972 	decw	x
      00A352                        973 00637$:
      00A352 1F 26            [ 2]  974 	ldw	(0x26, sp), x
      00A354 16 28            [ 2]  975 	ldw	y, (0x28, sp)
      00A356 17 1A            [ 2]  976 	ldw	(0x1a, sp), y
      00A358 16 26            [ 2]  977 	ldw	y, (0x26, sp)
      00A35A 17 18            [ 2]  978 	ldw	(0x18, sp), y
      00A35C 20 AE            [ 2]  979 	jra	00233$
                                    980 ;	./../../mib/stm8s_mib_debug_mem.c: 285: default:
      00A35E                        981 00165$:
                                    982 ;	./../../mib/stm8s_mib_debug_mem.c: 286: ccprintf(_DEBUG_CMD_A_, ("Error.\r\n"));
      00A35E 4B 93            [ 1]  983 	push	#<(__str_11+0)
      00A360 4B 84            [ 1]  984 	push	#((__str_11+0) >> 8)
      00A362 CD 96 77         [ 4]  985 	call	_mib_printf
      00A365 5B 02            [ 2]  986 	addw	sp, #2
                                    987 ;	./../../mib/stm8s_mib_debug_mem.c: 287: return FALSE;
      00A367 5F               [ 1]  988 	clrw	x
      00A368 CC A5 B8         [ 2]  989 	jp	00235$
                                    990 ;	./../../mib/stm8s_mib_debug_mem.c: 288: }
      00A36B                        991 00304$:
      00A36B 16 28            [ 2]  992 	ldw	y, (0x28, sp)
      00A36D 17 1A            [ 2]  993 	ldw	(0x1a, sp), y
      00A36F 16 26            [ 2]  994 	ldw	y, (0x26, sp)
      00A371 17 18            [ 2]  995 	ldw	(0x18, sp), y
                                    996 ;	./../../mib/stm8s_mib_debug_mem.c: 352: return FALSE;
      00A373 20 12            [ 2]  997 	jra	00166$
                                    998 ;	./../../mib/stm8s_mib_debug_mem.c: 288: }
      00A375                        999 00305$:
      00A375 16 28            [ 2] 1000 	ldw	y, (0x28, sp)
      00A377 17 1A            [ 2] 1001 	ldw	(0x1a, sp), y
      00A379 16 26            [ 2] 1002 	ldw	y, (0x26, sp)
      00A37B 17 18            [ 2] 1003 	ldw	(0x18, sp), y
                                   1004 ;	./../../mib/stm8s_mib_debug_mem.c: 352: return FALSE;
      00A37D 20 08            [ 2] 1005 	jra	00166$
                                   1006 ;	./../../mib/stm8s_mib_debug_mem.c: 288: }
      00A37F                       1007 00306$:
      00A37F 16 28            [ 2] 1008 	ldw	y, (0x28, sp)
      00A381 17 1A            [ 2] 1009 	ldw	(0x1a, sp), y
      00A383 16 26            [ 2] 1010 	ldw	y, (0x26, sp)
      00A385 17 18            [ 2] 1011 	ldw	(0x18, sp), y
      00A387                       1012 00166$:
                                   1013 ;	./../../mib/stm8s_mib_debug_mem.c: 289: ccprintf(_DEBUG_CMD_A_, (".\r\n"));
      00A387 4B 9C            [ 1] 1014 	push	#<(__str_12+0)
      00A389 4B 84            [ 1] 1015 	push	#((__str_12+0) >> 8)
      00A38B CD 96 77         [ 4] 1016 	call	_mib_printf
      00A38E 5B 02            [ 2] 1017 	addw	sp, #2
      00A390 CC A5 B6         [ 2] 1018 	jp	00216$
      00A393                       1019 00206$:
                                   1020 ;	./../../mib/stm8s_mib_debug_mem.c: 291: else if (!strcmp(argv[1], "hdump")) 	// _CMD_MY_HEXDUMP_
      00A393 1E 26            [ 2] 1021 	ldw	x, (0x26, sp)
      00A395 FE               [ 2] 1022 	ldw	x, (x)
      00A396 4B D7            [ 1] 1023 	push	#<(___str_19+0)
      00A398 4B 84            [ 1] 1024 	push	#((___str_19+0) >> 8)
      00A39A CD A9 13         [ 4] 1025 	call	_strcmp
      00A39D 5D               [ 2] 1026 	tnzw	x
      00A39E 26 5B            [ 1] 1027 	jrne	00203$
                                   1028 ;	./../../mib/stm8s_mib_debug_mem.c: 293: if (argc < 4)
      00A3A0 1E 2C            [ 2] 1029 	ldw	x, (0x2c, sp)
      00A3A2 A3 00 04         [ 2] 1030 	cpw	x, #0x0004
      00A3A5 2E 0B            [ 1] 1031 	jrsge	00168$
                                   1032 ;	./../../mib/stm8s_mib_debug_mem.c: 295: MibWriteDebugString(cptr->usage);
      00A3A7 1E 24            [ 2] 1033 	ldw	x, (0x24, sp)
      00A3A9 EE 04            [ 2] 1034 	ldw	x, (0x4, x)
      00A3AB CD 8C 65         [ 4] 1035 	call	_MibWriteDebugString
                                   1036 ;	./../../mib/stm8s_mib_debug_mem.c: 296: return FALSE;
      00A3AE 5F               [ 1] 1037 	clrw	x
      00A3AF CC A5 B8         [ 2] 1038 	jp	00235$
      00A3B2                       1039 00168$:
                                   1040 ;	./../../mib/stm8s_mib_debug_mem.c: 298: if (!HexToInt(argv[2], &addr, 32) || !HexToInt(argv[3], &len, 32))
      00A3B2 16 2E            [ 2] 1041 	ldw	y, (0x2e, sp)
      00A3B4 90 EE 04         [ 2] 1042 	ldw	y, (0x4, y)
      00A3B7 4B 20            [ 1] 1043 	push	#0x20
      00A3B9 4B 00            [ 1] 1044 	push	#0x00
      00A3BB 96               [ 1] 1045 	ldw	x, sp
      00A3BC 1C 00 03         [ 2] 1046 	addw	x, #3
      00A3BF 89               [ 2] 1047 	pushw	x
      00A3C0 93               [ 1] 1048 	ldw	x, y
      00A3C1 CD 99 86         [ 4] 1049 	call	_HexToInt
      00A3C4 5D               [ 2] 1050 	tnzw	x
      00A3C5 27 15            [ 1] 1051 	jreq	00169$
      00A3C7 16 2E            [ 2] 1052 	ldw	y, (0x2e, sp)
      00A3C9 90 EE 06         [ 2] 1053 	ldw	y, (0x6, y)
      00A3CC 4B 20            [ 1] 1054 	push	#0x20
      00A3CE 4B 00            [ 1] 1055 	push	#0x00
      00A3D0 96               [ 1] 1056 	ldw	x, sp
      00A3D1 1C 00 16         [ 2] 1057 	addw	x, #22
      00A3D4 89               [ 2] 1058 	pushw	x
      00A3D5 93               [ 1] 1059 	ldw	x, y
      00A3D6 CD 99 86         [ 4] 1060 	call	_HexToInt
      00A3D9 5D               [ 2] 1061 	tnzw	x
      00A3DA 26 0D            [ 1] 1062 	jrne	00170$
      00A3DC                       1063 00169$:
                                   1064 ;	./../../mib/stm8s_mib_debug_mem.c: 300: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A3DC 4B 1B            [ 1] 1065 	push	#<(__str_3+0)
      00A3DE 4B 84            [ 1] 1066 	push	#((__str_3+0) >> 8)
      00A3E0 CD 96 77         [ 4] 1067 	call	_mib_printf
      00A3E3 5B 02            [ 2] 1068 	addw	sp, #2
                                   1069 ;	./../../mib/stm8s_mib_debug_mem.c: 301: return FALSE;
      00A3E5 5F               [ 1] 1070 	clrw	x
      00A3E6 CC A5 B8         [ 2] 1071 	jp	00235$
      00A3E9                       1072 00170$:
                                   1073 ;	./../../mib/stm8s_mib_debug_mem.c: 303: HexDump(addr, len);		
      00A3E9 1E 16            [ 2] 1074 	ldw	x, (0x16, sp)
      00A3EB 89               [ 2] 1075 	pushw	x
      00A3EC 1E 16            [ 2] 1076 	ldw	x, (0x16, sp)
      00A3EE 89               [ 2] 1077 	pushw	x
      00A3EF 1E 07            [ 2] 1078 	ldw	x, (0x07, sp)
      00A3F1 89               [ 2] 1079 	pushw	x
      00A3F2 1E 07            [ 2] 1080 	ldw	x, (0x07, sp)
      00A3F4 89               [ 2] 1081 	pushw	x
      00A3F5 CD 9A FA         [ 4] 1082 	call	_HexDump
      00A3F8 CC A5 B6         [ 2] 1083 	jp	00216$
      00A3FB                       1084 00203$:
                                   1085 ;	./../../mib/stm8s_mib_debug_mem.c: 305: else if (!strcmp(argv[1], "cpy")) // _CMD_MY_MEMCPY_
      00A3FB 1E 26            [ 2] 1086 	ldw	x, (0x26, sp)
      00A3FD FE               [ 2] 1087 	ldw	x, (x)
      00A3FE 4B DD            [ 1] 1088 	push	#<(___str_20+0)
      00A400 4B 84            [ 1] 1089 	push	#((___str_20+0) >> 8)
      00A402 CD A9 13         [ 4] 1090 	call	_strcmp
      00A405 5D               [ 2] 1091 	tnzw	x
      00A406 26 71            [ 1] 1092 	jrne	00200$
                                   1093 ;	./../../mib/stm8s_mib_debug_mem.c: 307: if (argc < 5)
      00A408 1E 2C            [ 2] 1094 	ldw	x, (0x2c, sp)
      00A40A A3 00 05         [ 2] 1095 	cpw	x, #0x0005
      00A40D 2E 0B            [ 1] 1096 	jrsge	00173$
                                   1097 ;	./../../mib/stm8s_mib_debug_mem.c: 309: MibWriteDebugString(cptr->usage);
      00A40F 1E 24            [ 2] 1098 	ldw	x, (0x24, sp)
      00A411 EE 04            [ 2] 1099 	ldw	x, (0x4, x)
      00A413 CD 8C 65         [ 4] 1100 	call	_MibWriteDebugString
                                   1101 ;	./../../mib/stm8s_mib_debug_mem.c: 310: return FALSE;
      00A416 5F               [ 1] 1102 	clrw	x
      00A417 CC A5 B8         [ 2] 1103 	jp	00235$
      00A41A                       1104 00173$:
                                   1105 ;	./../../mib/stm8s_mib_debug_mem.c: 312: if (!HexToInt(argv[2], &dest, 32) || !HexToInt(argv[3], &src, 32) || !HexToInt(argv[4], &len, 32))
      00A41A 16 2E            [ 2] 1106 	ldw	y, (0x2e, sp)
      00A41C 90 EE 04         [ 2] 1107 	ldw	y, (0x4, y)
      00A41F 4B 20            [ 1] 1108 	push	#0x20
      00A421 4B 00            [ 1] 1109 	push	#0x00
      00A423 96               [ 1] 1110 	ldw	x, sp
      00A424 1C 00 0E         [ 2] 1111 	addw	x, #14
      00A427 89               [ 2] 1112 	pushw	x
      00A428 93               [ 1] 1113 	ldw	x, y
      00A429 CD 99 86         [ 4] 1114 	call	_HexToInt
      00A42C 5D               [ 2] 1115 	tnzw	x
      00A42D 27 2A            [ 1] 1116 	jreq	00174$
      00A42F 16 2E            [ 2] 1117 	ldw	y, (0x2e, sp)
      00A431 90 EE 06         [ 2] 1118 	ldw	y, (0x6, y)
      00A434 4B 20            [ 1] 1119 	push	#0x20
      00A436 4B 00            [ 1] 1120 	push	#0x00
      00A438 96               [ 1] 1121 	ldw	x, sp
      00A439 1C 00 12         [ 2] 1122 	addw	x, #18
      00A43C 89               [ 2] 1123 	pushw	x
      00A43D 93               [ 1] 1124 	ldw	x, y
      00A43E CD 99 86         [ 4] 1125 	call	_HexToInt
      00A441 5D               [ 2] 1126 	tnzw	x
      00A442 27 15            [ 1] 1127 	jreq	00174$
      00A444 16 2E            [ 2] 1128 	ldw	y, (0x2e, sp)
      00A446 90 EE 08         [ 2] 1129 	ldw	y, (0x8, y)
      00A449 4B 20            [ 1] 1130 	push	#0x20
      00A44B 4B 00            [ 1] 1131 	push	#0x00
      00A44D 96               [ 1] 1132 	ldw	x, sp
      00A44E 1C 00 16         [ 2] 1133 	addw	x, #22
      00A451 89               [ 2] 1134 	pushw	x
      00A452 93               [ 1] 1135 	ldw	x, y
      00A453 CD 99 86         [ 4] 1136 	call	_HexToInt
      00A456 5D               [ 2] 1137 	tnzw	x
      00A457 26 0D            [ 1] 1138 	jrne	00175$
      00A459                       1139 00174$:
                                   1140 ;	./../../mib/stm8s_mib_debug_mem.c: 314: ccprintf(_DEBUG_CMD_A_, ("Illegal character is used.\r\n"));
      00A459 4B E1            [ 1] 1141 	push	#<(__str_21+0)
      00A45B 4B 84            [ 1] 1142 	push	#((__str_21+0) >> 8)
      00A45D CD 96 77         [ 4] 1143 	call	_mib_printf
      00A460 5B 02            [ 2] 1144 	addw	sp, #2
                                   1145 ;	./../../mib/stm8s_mib_debug_mem.c: 315: return FALSE;
      00A462 5F               [ 1] 1146 	clrw	x
      00A463 CC A5 B8         [ 2] 1147 	jp	00235$
      00A466                       1148 00175$:
                                   1149 ;	./../../mib/stm8s_mib_debug_mem.c: 317: memcpy((char *)dest, (char *)src, len);		
      00A466 1E 16            [ 2] 1150 	ldw	x, (0x16, sp)
      00A468 16 12            [ 2] 1151 	ldw	y, (0x12, sp)
      00A46A 17 28            [ 2] 1152 	ldw	(0x28, sp), y
      00A46C 16 0E            [ 2] 1153 	ldw	y, (0x0e, sp)
      00A46E 89               [ 2] 1154 	pushw	x
      00A46F 1E 2A            [ 2] 1155 	ldw	x, (0x2a, sp)
      00A471 89               [ 2] 1156 	pushw	x
      00A472 93               [ 1] 1157 	ldw	x, y
      00A473 CD A8 8F         [ 4] 1158 	call	___memcpy
      00A476 CC A5 B6         [ 2] 1159 	jp	00216$
      00A479                       1160 00200$:
                                   1161 ;	./../../mib/stm8s_mib_debug_mem.c: 319: else if (!strcmp(argv[1], "cmp")) // _CMD_MY_MEMCMP_
      00A479 1E 26            [ 2] 1162 	ldw	x, (0x26, sp)
      00A47B FE               [ 2] 1163 	ldw	x, (x)
      00A47C 4B FE            [ 1] 1164 	push	#<(___str_22+0)
      00A47E 4B 84            [ 1] 1165 	push	#((___str_22+0) >> 8)
      00A480 CD A9 13         [ 4] 1166 	call	_strcmp
      00A483 5D               [ 2] 1167 	tnzw	x
      00A484 27 03            [ 1] 1168 	jreq	00647$
      00A486 CC A5 12         [ 2] 1169 	jp	00197$
      00A489                       1170 00647$:
                                   1171 ;	./../../mib/stm8s_mib_debug_mem.c: 321: if (argc < 5)
      00A489 1E 2C            [ 2] 1172 	ldw	x, (0x2c, sp)
      00A48B A3 00 05         [ 2] 1173 	cpw	x, #0x0005
      00A48E 2E 0B            [ 1] 1174 	jrsge	00179$
                                   1175 ;	./../../mib/stm8s_mib_debug_mem.c: 323: MibWriteDebugString(cptr->usage);
      00A490 1E 24            [ 2] 1176 	ldw	x, (0x24, sp)
      00A492 EE 04            [ 2] 1177 	ldw	x, (0x4, x)
      00A494 CD 8C 65         [ 4] 1178 	call	_MibWriteDebugString
                                   1179 ;	./../../mib/stm8s_mib_debug_mem.c: 324: return FALSE;
      00A497 5F               [ 1] 1180 	clrw	x
      00A498 CC A5 B8         [ 2] 1181 	jp	00235$
      00A49B                       1182 00179$:
                                   1183 ;	./../../mib/stm8s_mib_debug_mem.c: 326: if (!HexToInt(argv[2], &dest, 32) || !HexToInt(argv[3], &src, 32) || !HexToInt(argv[4], &len, 32))
      00A49B 16 2E            [ 2] 1184 	ldw	y, (0x2e, sp)
      00A49D 90 EE 04         [ 2] 1185 	ldw	y, (0x4, y)
      00A4A0 4B 20            [ 1] 1186 	push	#0x20
      00A4A2 4B 00            [ 1] 1187 	push	#0x00
      00A4A4 96               [ 1] 1188 	ldw	x, sp
      00A4A5 1C 00 0E         [ 2] 1189 	addw	x, #14
      00A4A8 89               [ 2] 1190 	pushw	x
      00A4A9 93               [ 1] 1191 	ldw	x, y
      00A4AA CD 99 86         [ 4] 1192 	call	_HexToInt
      00A4AD 5D               [ 2] 1193 	tnzw	x
      00A4AE 27 2A            [ 1] 1194 	jreq	00180$
      00A4B0 16 2E            [ 2] 1195 	ldw	y, (0x2e, sp)
      00A4B2 90 EE 06         [ 2] 1196 	ldw	y, (0x6, y)
      00A4B5 4B 20            [ 1] 1197 	push	#0x20
      00A4B7 4B 00            [ 1] 1198 	push	#0x00
      00A4B9 96               [ 1] 1199 	ldw	x, sp
      00A4BA 1C 00 12         [ 2] 1200 	addw	x, #18
      00A4BD 89               [ 2] 1201 	pushw	x
      00A4BE 93               [ 1] 1202 	ldw	x, y
      00A4BF CD 99 86         [ 4] 1203 	call	_HexToInt
      00A4C2 5D               [ 2] 1204 	tnzw	x
      00A4C3 27 15            [ 1] 1205 	jreq	00180$
      00A4C5 16 2E            [ 2] 1206 	ldw	y, (0x2e, sp)
      00A4C7 90 EE 08         [ 2] 1207 	ldw	y, (0x8, y)
      00A4CA 4B 20            [ 1] 1208 	push	#0x20
      00A4CC 4B 00            [ 1] 1209 	push	#0x00
      00A4CE 96               [ 1] 1210 	ldw	x, sp
      00A4CF 1C 00 16         [ 2] 1211 	addw	x, #22
      00A4D2 89               [ 2] 1212 	pushw	x
      00A4D3 93               [ 1] 1213 	ldw	x, y
      00A4D4 CD 99 86         [ 4] 1214 	call	_HexToInt
      00A4D7 5D               [ 2] 1215 	tnzw	x
      00A4D8 26 0D            [ 1] 1216 	jrne	00181$
      00A4DA                       1217 00180$:
                                   1218 ;	./../../mib/stm8s_mib_debug_mem.c: 328: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A4DA 4B 1B            [ 1] 1219 	push	#<(__str_3+0)
      00A4DC 4B 84            [ 1] 1220 	push	#((__str_3+0) >> 8)
      00A4DE CD 96 77         [ 4] 1221 	call	_mib_printf
      00A4E1 5B 02            [ 2] 1222 	addw	sp, #2
                                   1223 ;	./../../mib/stm8s_mib_debug_mem.c: 329: return FALSE;
      00A4E3 5F               [ 1] 1224 	clrw	x
      00A4E4 CC A5 B8         [ 2] 1225 	jp	00235$
      00A4E7                       1226 00181$:
                                   1227 ;	./../../mib/stm8s_mib_debug_mem.c: 332: if (memcmp((char *)dest, (char *)src, (len)) == 0) ccprintf(_DEBUG_CMD_A_, ("equil.\r\n"));
      00A4E7 1E 16            [ 2] 1228 	ldw	x, (0x16, sp)
      00A4E9 16 12            [ 2] 1229 	ldw	y, (0x12, sp)
      00A4EB 17 28            [ 2] 1230 	ldw	(0x28, sp), y
      00A4ED 16 0E            [ 2] 1231 	ldw	y, (0x0e, sp)
      00A4EF 89               [ 2] 1232 	pushw	x
      00A4F0 1E 2A            [ 2] 1233 	ldw	x, (0x2a, sp)
      00A4F2 89               [ 2] 1234 	pushw	x
      00A4F3 93               [ 1] 1235 	ldw	x, y
      00A4F4 CD A7 43         [ 4] 1236 	call	_memcmp
      00A4F7 5D               [ 2] 1237 	tnzw	x
      00A4F8 26 0C            [ 1] 1238 	jrne	00185$
      00A4FA 4B 02            [ 1] 1239 	push	#<(__str_23+0)
      00A4FC 4B 85            [ 1] 1240 	push	#((__str_23+0) >> 8)
      00A4FE CD 96 77         [ 4] 1241 	call	_mib_printf
      00A501 5B 02            [ 2] 1242 	addw	sp, #2
      00A503 CC A5 B6         [ 2] 1243 	jp	00216$
      00A506                       1244 00185$:
                                   1245 ;	./../../mib/stm8s_mib_debug_mem.c: 333: else ccprintf(_DEBUG_CMD_A_, ("not equil.\r\n"));		
      00A506 4B 0B            [ 1] 1246 	push	#<(__str_24+0)
      00A508 4B 85            [ 1] 1247 	push	#((__str_24+0) >> 8)
      00A50A CD 96 77         [ 4] 1248 	call	_mib_printf
      00A50D 5B 02            [ 2] 1249 	addw	sp, #2
      00A50F CC A5 B6         [ 2] 1250 	jp	00216$
      00A512                       1251 00197$:
                                   1252 ;	./../../mib/stm8s_mib_debug_mem.c: 335: else if (!strcmp(argv[1], "set")) // _CMD_MY_MEMSET_
      00A512 1E 26            [ 2] 1253 	ldw	x, (0x26, sp)
      00A514 FE               [ 2] 1254 	ldw	x, (x)
      00A515 4B 18            [ 1] 1255 	push	#<(___str_25+0)
      00A517 4B 85            [ 1] 1256 	push	#((___str_25+0) >> 8)
      00A519 CD A9 13         [ 4] 1257 	call	_strcmp
      00A51C 5D               [ 2] 1258 	tnzw	x
      00A51D 26 71            [ 1] 1259 	jrne	00194$
                                   1260 ;	./../../mib/stm8s_mib_debug_mem.c: 337: if (argc < 5)
      00A51F 1E 2C            [ 2] 1261 	ldw	x, (0x2c, sp)
      00A521 A3 00 05         [ 2] 1262 	cpw	x, #0x0005
      00A524 2E 0B            [ 1] 1263 	jrsge	00188$
                                   1264 ;	./../../mib/stm8s_mib_debug_mem.c: 339: MibWriteDebugString(cptr->usage);
      00A526 1E 24            [ 2] 1265 	ldw	x, (0x24, sp)
      00A528 EE 04            [ 2] 1266 	ldw	x, (0x4, x)
      00A52A CD 8C 65         [ 4] 1267 	call	_MibWriteDebugString
                                   1268 ;	./../../mib/stm8s_mib_debug_mem.c: 340: return FALSE;
      00A52D 5F               [ 1] 1269 	clrw	x
      00A52E CC A5 B8         [ 2] 1270 	jp	00235$
      00A531                       1271 00188$:
                                   1272 ;	./../../mib/stm8s_mib_debug_mem.c: 342: if (!HexToInt(argv[2], &addr, 32) || !HexToInt(argv[3], &c, 8) || !HexToInt(argv[4], &len, 32))
      00A531 16 2E            [ 2] 1273 	ldw	y, (0x2e, sp)
      00A533 90 EE 04         [ 2] 1274 	ldw	y, (0x4, y)
      00A536 4B 20            [ 1] 1275 	push	#0x20
      00A538 4B 00            [ 1] 1276 	push	#0x00
      00A53A 96               [ 1] 1277 	ldw	x, sp
      00A53B 1C 00 03         [ 2] 1278 	addw	x, #3
      00A53E 89               [ 2] 1279 	pushw	x
      00A53F 93               [ 1] 1280 	ldw	x, y
      00A540 CD 99 86         [ 4] 1281 	call	_HexToInt
      00A543 5D               [ 2] 1282 	tnzw	x
      00A544 27 2A            [ 1] 1283 	jreq	00189$
      00A546 16 2E            [ 2] 1284 	ldw	y, (0x2e, sp)
      00A548 90 EE 06         [ 2] 1285 	ldw	y, (0x6, y)
      00A54B 4B 08            [ 1] 1286 	push	#0x08
      00A54D 4B 00            [ 1] 1287 	push	#0x00
      00A54F 96               [ 1] 1288 	ldw	x, sp
      00A550 1C 00 07         [ 2] 1289 	addw	x, #7
      00A553 89               [ 2] 1290 	pushw	x
      00A554 93               [ 1] 1291 	ldw	x, y
      00A555 CD 99 86         [ 4] 1292 	call	_HexToInt
      00A558 5D               [ 2] 1293 	tnzw	x
      00A559 27 15            [ 1] 1294 	jreq	00189$
      00A55B 16 2E            [ 2] 1295 	ldw	y, (0x2e, sp)
      00A55D 90 EE 08         [ 2] 1296 	ldw	y, (0x8, y)
      00A560 4B 20            [ 1] 1297 	push	#0x20
      00A562 4B 00            [ 1] 1298 	push	#0x00
      00A564 96               [ 1] 1299 	ldw	x, sp
      00A565 1C 00 16         [ 2] 1300 	addw	x, #22
      00A568 89               [ 2] 1301 	pushw	x
      00A569 93               [ 1] 1302 	ldw	x, y
      00A56A CD 99 86         [ 4] 1303 	call	_HexToInt
      00A56D 5D               [ 2] 1304 	tnzw	x
      00A56E 26 0C            [ 1] 1305 	jrne	00190$
      00A570                       1306 00189$:
                                   1307 ;	./../../mib/stm8s_mib_debug_mem.c: 344: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A570 4B 1B            [ 1] 1308 	push	#<(__str_3+0)
      00A572 4B 84            [ 1] 1309 	push	#((__str_3+0) >> 8)
      00A574 CD 96 77         [ 4] 1310 	call	_mib_printf
      00A577 5B 02            [ 2] 1311 	addw	sp, #2
                                   1312 ;	./../../mib/stm8s_mib_debug_mem.c: 345: return FALSE;
      00A579 5F               [ 1] 1313 	clrw	x
      00A57A 20 3C            [ 2] 1314 	jra	00235$
      00A57C                       1315 00190$:
                                   1316 ;	./../../mib/stm8s_mib_debug_mem.c: 347: memset((void *)addr, c, len);
      00A57C 1E 16            [ 2] 1317 	ldw	x, (0x16, sp)
      00A57E 7B 05            [ 1] 1318 	ld	a, (0x05, sp)
      00A580 6B 29            [ 1] 1319 	ld	(0x29, sp), a
      00A582 0F 28            [ 1] 1320 	clr	(0x28, sp)
      00A584 16 03            [ 2] 1321 	ldw	y, (0x03, sp)
      00A586 89               [ 2] 1322 	pushw	x
      00A587 1E 2A            [ 2] 1323 	ldw	x, (0x2a, sp)
      00A589 89               [ 2] 1324 	pushw	x
      00A58A 93               [ 1] 1325 	ldw	x, y
      00A58B CD A8 E2         [ 4] 1326 	call	_memset
      00A58E 20 26            [ 2] 1327 	jra	00216$
      00A590                       1328 00194$:
                                   1329 ;	./../../mib/stm8s_mib_debug_mem.c: 351: MibWriteDebugString(cptr->usage);
      00A590 1E 24            [ 2] 1330 	ldw	x, (0x24, sp)
      00A592 EE 04            [ 2] 1331 	ldw	x, (0x4, x)
      00A594 CD 8C 65         [ 4] 1332 	call	_MibWriteDebugString
                                   1333 ;	./../../mib/stm8s_mib_debug_mem.c: 352: return FALSE;
      00A597 5F               [ 1] 1334 	clrw	x
      00A598 20 1E            [ 2] 1335 	jra	00235$
      00A59A                       1336 00301$:
      00A59A 16 28            [ 2] 1337 	ldw	y, (0x28, sp)
      00A59C 17 1A            [ 2] 1338 	ldw	(0x1a, sp), y
      00A59E 16 26            [ 2] 1339 	ldw	y, (0x26, sp)
      00A5A0 17 18            [ 2] 1340 	ldw	(0x18, sp), y
      00A5A2 20 12            [ 2] 1341 	jra	00216$
      00A5A4                       1342 00302$:
      00A5A4 16 28            [ 2] 1343 	ldw	y, (0x28, sp)
      00A5A6 17 1A            [ 2] 1344 	ldw	(0x1a, sp), y
      00A5A8 16 26            [ 2] 1345 	ldw	y, (0x26, sp)
      00A5AA 17 18            [ 2] 1346 	ldw	(0x18, sp), y
      00A5AC 20 08            [ 2] 1347 	jra	00216$
      00A5AE                       1348 00303$:
      00A5AE 16 28            [ 2] 1349 	ldw	y, (0x28, sp)
      00A5B0 17 1A            [ 2] 1350 	ldw	(0x1a, sp), y
      00A5B2 16 26            [ 2] 1351 	ldw	y, (0x26, sp)
      00A5B4 17 18            [ 2] 1352 	ldw	(0x18, sp), y
      00A5B6                       1353 00216$:
                                   1354 ;	./../../mib/stm8s_mib_debug_mem.c: 354: return TRUE;
      00A5B6 5F               [ 1] 1355 	clrw	x
      00A5B7 5C               [ 1] 1356 	incw	x
      00A5B8                       1357 00235$:
                                   1358 ;	./../../mib/stm8s_mib_debug_mem.c: 355: }
      00A5B8 16 2A            [ 2] 1359 	ldw	y, (42, sp)
      00A5BA 5B 2F            [ 2] 1360 	addw	sp, #47
      00A5BC 90 FC            [ 2] 1361 	jp	(y)
                                   1362 	.area CODE
                                   1363 	.area CONST
                                   1364 	.area CONST
      0083EF                       1365 __str_0:
      0083EF 49 4E 46 4F 3A 2B 63  1366 	.ascii "INFO:+cmd_mem..."
             6D 64 5F 6D 65 6D 2E
             2E 2E
      0083FF 0D                    1367 	.db 0x0d
      008400 0A                    1368 	.db 0x0a
      008401 00                    1369 	.db 0x00
                                   1370 	.area CODE
                                   1371 	.area CONST
      008402                       1372 __str_1:
      008402 49 4E 46 4F 3A 2D 63  1373 	.ascii "INFO:-cmd_mem..."
             6D 64 5F 6D 65 6D 2E
             2E 2E
      008412 0D                    1374 	.db 0x0d
      008413 0A                    1375 	.db 0x0a
      008414 00                    1376 	.db 0x00
                                   1377 	.area CODE
                                   1378 	.area CONST
      008415                       1379 ___str_2:
      008415 77 72 69 74 65        1380 	.ascii "write"
      00841A 00                    1381 	.db 0x00
                                   1382 	.area CODE
                                   1383 	.area CONST
      00841B                       1384 __str_3:
      00841B 49 6C 6C 75 67 61 6C  1385 	.ascii "Illugal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      008435 0D                    1386 	.db 0x0d
      008436 0A                    1387 	.db 0x0a
      008437 00                    1388 	.db 0x00
                                   1389 	.area CODE
                                   1390 	.area CONST
      008438                       1391 __str_4:
      008438 49 6C 6C 75 67 61 6C  1392 	.ascii "Illugal character is useqd."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 71 64 2E
      008453 0D                    1393 	.db 0x0d
      008454 0A                    1394 	.db 0x0a
      008455 00                    1395 	.db 0x00
                                   1396 	.area CODE
                                   1397 	.area CONST
      008456                       1398 ___str_5:
      008456 72 65 61 64           1399 	.ascii "read"
      00845A 00                    1400 	.db 0x00
                                   1401 	.area CODE
                                   1402 	.area CONST
      00845B                       1403 __str_6:
      00845B 09                    1404 	.db 0x09
      00845C 61 64 64 72 65 73 73  1405 	.ascii "address : 0x%08lx  "
             20 3A 20 30 78 25 30
             38 6C 78 20 20
      00846F 00                    1406 	.db 0x00
                                   1407 	.area CODE
                                   1408 	.area CONST
      008470                       1409 __str_7:
      008470 09                    1410 	.db 0x09
      008471 76 61 6C 75 65 20 20  1411 	.ascii "value   : "
             20 3A 20
      00847B 00                    1412 	.db 0x00
                                   1413 	.area CODE
                                   1414 	.area CONST
      00847C                       1415 __str_8:
      00847C 30 78 25 30 32 78 20  1416 	.ascii "0x%02x "
      008483 00                    1417 	.db 0x00
                                   1418 	.area CODE
                                   1419 	.area CONST
      008484                       1420 __str_9:
      008484 30 78 25 30 34 78     1421 	.ascii "0x%04x"
      00848A 00                    1422 	.db 0x00
                                   1423 	.area CODE
                                   1424 	.area CONST
      00848B                       1425 __str_10:
      00848B 30 78 25 30 38 6C 78  1426 	.ascii "0x%08lx"
      008492 00                    1427 	.db 0x00
                                   1428 	.area CODE
                                   1429 	.area CONST
      008493                       1430 __str_11:
      008493 45 72 72 6F 72 2E     1431 	.ascii "Error."
      008499 0D                    1432 	.db 0x0d
      00849A 0A                    1433 	.db 0x0a
      00849B 00                    1434 	.db 0x00
                                   1435 	.area CODE
                                   1436 	.area CONST
      00849C                       1437 __str_12:
      00849C 2E                    1438 	.ascii "."
      00849D 0D                    1439 	.db 0x0d
      00849E 0A                    1440 	.db 0x0a
      00849F 00                    1441 	.db 0x00
                                   1442 	.area CODE
                                   1443 	.area CONST
      0084A0                       1444 ___str_13:
      0084A0 77 72 6E              1445 	.ascii "wrn"
      0084A3 00                    1446 	.db 0x00
                                   1447 	.area CODE
                                   1448 	.area CONST
      0084A4                       1449 ___str_14:
      0084A4 72 64 6E              1450 	.ascii "rdn"
      0084A7 00                    1451 	.db 0x00
                                   1452 	.area CODE
                                   1453 	.area CONST
      0084A8                       1454 __str_15:
      0084A8 6C 6F 6F 70 20 3A 20  1455 	.ascii "loop : 0x%08lx  "
             30 78 25 30 38 6C 78
             20 20
      0084B8 0D                    1456 	.db 0x0d
      0084B9 0A                    1457 	.db 0x0a
      0084BA 00                    1458 	.db 0x00
                                   1459 	.area CODE
                                   1460 	.area CONST
      0084BB                       1461 __str_16:
      0084BB 76 61 6C 75 65 20 20  1462 	.ascii "value   : "
             20 3A 20
      0084C5 00                    1463 	.db 0x00
                                   1464 	.area CODE
                                   1465 	.area CONST
      0084C6                       1466 __str_17:
      0084C6 30 78 25 30 34 78 20  1467 	.ascii "0x%04x "
      0084CD 00                    1468 	.db 0x00
                                   1469 	.area CODE
                                   1470 	.area CONST
      0084CE                       1471 __str_18:
      0084CE 30 78 25 30 38 6C 78  1472 	.ascii "0x%08lx "
             20
      0084D6 00                    1473 	.db 0x00
                                   1474 	.area CODE
                                   1475 	.area CONST
      0084D7                       1476 ___str_19:
      0084D7 68 64 75 6D 70        1477 	.ascii "hdump"
      0084DC 00                    1478 	.db 0x00
                                   1479 	.area CODE
                                   1480 	.area CONST
      0084DD                       1481 ___str_20:
      0084DD 63 70 79              1482 	.ascii "cpy"
      0084E0 00                    1483 	.db 0x00
                                   1484 	.area CODE
                                   1485 	.area CONST
      0084E1                       1486 __str_21:
      0084E1 49 6C 6C 65 67 61 6C  1487 	.ascii "Illegal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      0084FB 0D                    1488 	.db 0x0d
      0084FC 0A                    1489 	.db 0x0a
      0084FD 00                    1490 	.db 0x00
                                   1491 	.area CODE
                                   1492 	.area CONST
      0084FE                       1493 ___str_22:
      0084FE 63 6D 70              1494 	.ascii "cmp"
      008501 00                    1495 	.db 0x00
                                   1496 	.area CODE
                                   1497 	.area CONST
      008502                       1498 __str_23:
      008502 65 71 75 69 6C 2E     1499 	.ascii "equil."
      008508 0D                    1500 	.db 0x0d
      008509 0A                    1501 	.db 0x0a
      00850A 00                    1502 	.db 0x00
                                   1503 	.area CODE
                                   1504 	.area CONST
      00850B                       1505 __str_24:
      00850B 6E 6F 74 20 65 71 75  1506 	.ascii "not equil."
             69 6C 2E
      008515 0D                    1507 	.db 0x0d
      008516 0A                    1508 	.db 0x0a
      008517 00                    1509 	.db 0x00
                                   1510 	.area CODE
                                   1511 	.area CONST
      008518                       1512 ___str_25:
      008518 73 65 74              1513 	.ascii "set"
      00851B 00                    1514 	.db 0x00
                                   1515 	.area CODE
                                   1516 	.area CONST
      00851C                       1517 ___str_26:
      00851C 6D 65 6D              1518 	.ascii "mem"
      00851F 00                    1519 	.db 0x00
                                   1520 	.area CODE
                                   1521 	.area CONST
      008520                       1522 ___str_27:
      008520 20 20 6D 65 6D 20 7B  1523 	.ascii "  mem {cpy}   [dest] [src]   [len] Copy to SDRAM from Flash "
             63 70 79 7D 20 20 20
             5B 64 65 73 74 5D 20
             5B 73 72 63 5D 20 20
             20 5B 6C 65 6E 5D 20
             43 6F 70 79 20 74 6F
             20 53 44 52 41 4D 20
             66 72 6F 6D 20 46 6C
             61 73 68 20
      00855C 6F 72 20 53 44 52 41  1524 	.ascii "or SDRAM."
             4D 2E
      008565 0D                    1525 	.db 0x0d
      008566 0A                    1526 	.db 0x0a
      008567 20 20 6D 65 6D 20 7B  1527 	.ascii "  mem {cmp}   [add1] [add2]  [len] Compare data in addr1 and"
             63 6D 70 7D 20 20 20
             5B 61 64 64 31 5D 20
             5B 61 64 64 32 5D 20
             20 5B 6C 65 6E 5D 20
             43 6F 6D 70 61 72 65
             20 64 61 74 61 20 69
             6E 20 61 64 64 72 31
             20 61 6E 64
      0085A3 20 61 64 64 72 32 2E  1528 	.ascii " addr2."
      0085AA 0D                    1529 	.db 0x0d
      0085AB 0A                    1530 	.db 0x0a
      0085AC 20 20 6D 65 6D 20 7B  1531 	.ascii "  mem {set}   [addr] [value] [len] Fill Memory with value."
             73 65 74 7D 20 20 20
             5B 61 64 64 72 5D 20
             5B 76 61 6C 75 65 5D
             20 5B 6C 65 6E 5D 20
             46 69 6C 6C 20 4D 65
             6D 6F 72 79 20 77 69
             74 68 20 76 61 6C 75
             65 2E
      0085E6 0D                    1532 	.db 0x0d
      0085E7 0A                    1533 	.db 0x0a
      0085E8 20 20 6D 65 6D 20 7B  1534 	.ascii "  mem {hdump} [addr] [len]         Dump Memory."
             68 64 75 6D 70 7D 20
             5B 61 64 64 72 5D 20
             5B 6C 65 6E 5D 20 20
             20 20 20 20 20 20 20
             44 75 6D 70 20 4D 65
             6D 6F 72 79 2E
      008617 0D                    1535 	.db 0x0d
      008618 0A                    1536 	.db 0x0a
      008619 20 20 6D 65 6D 20 7B  1537 	.ascii "  mem {wrn} {c/s/l} [addr] [value] [loop]  Wrn in addr. c:8 "
             77 72 6E 7D 20 7B 63
             2F 73 2F 6C 7D 20 5B
             61 64 64 72 5D 20 5B
             76 61 6C 75 65 5D 20
             5B 6C 6F 6F 70 5D 20
             20 57 72 6E 20 69 6E
             20 61 64 64 72 2E 20
             63 3A 38 20
      008655 73 3A 31 36 20 6C 3A  1538 	.ascii "s:16 l:32 bits."
             33 32 20 62 69 74 73
             2E
      008664 0D                    1539 	.db 0x0d
      008665 0A                    1540 	.db 0x0a
      008666 20 20 6D 65 6D 20 7B  1541 	.ascii "  mem {rdn}  {c/s/l} [addr] [loop]   Rdn in addr. c:8 s:16 l"
             72 64 6E 7D 20 20 7B
             63 2F 73 2F 6C 7D 20
             5B 61 64 64 72 5D 20
             5B 6C 6F 6F 70 5D 20
             20 20 52 64 6E 20 69
             6E 20 61 64 64 72 2E
             20 63 3A 38 20 73 3A
             31 36 20 6C
      0086A2 3A 33 32 20 62 69 74  1542 	.ascii ":32 bits."
             73 2E
      0086AB 0D                    1543 	.db 0x0d
      0086AC 0A                    1544 	.db 0x0a
      0086AD 20 20 6D 65 6D 20 7B  1545 	.ascii "  mem {write} {c/s/l} [addr] [value]  Write in addr. c:8 s:1"
             77 72 69 74 65 7D 20
             7B 63 2F 73 2F 6C 7D
             20 5B 61 64 64 72 5D
             20 5B 76 61 6C 75 65
             5D 20 20 57 72 69 74
             65 20 69 6E 20 61 64
             64 72 2E 20 63 3A 38
             20 73 3A 31
      0086E9 36 20 6C 3A 33 32 20  1546 	.ascii "6 l:32 bits."
             62 69 74 73 2E
      0086F5 0D                    1547 	.db 0x0d
      0086F6 0A                    1548 	.db 0x0a
      0086F7 20 20 6D 65 6D 20 7B  1549 	.ascii "  mem {read}  {c/s/l} [addr]          Read in addr. c:8 s:16"
             72 65 61 64 7D 20 20
             7B 63 2F 73 2F 6C 7D
             20 5B 61 64 64 72 5D
             20 20 20 20 20 20 20
             20 20 20 52 65 61 64
             20 69 6E 20 61 64 64
             72 2E 20 63 3A 38 20
             73 3A 31 36
      008733 20 6C 3A 33 32 20 62  1550 	.ascii " l:32 bits."
             69 74 73 2E
      00873E 0D                    1551 	.db 0x0d
      00873F 0A                    1552 	.db 0x0a
      008740 00                    1553 	.db 0x00
                                   1554 	.area CODE
                                   1555 	.area INITIALIZER
      008920                       1556 __xinit__cmdTbl_only:
      008920 85 1C                 1557 	.dw ___str_26
      008922 9E 43                 1558 	.dw _DoMem
      008924 85 20                 1559 	.dw ___str_27
      008926 00 00                 1560 	.dw #0x0000
      008928 00 00                 1561 	.dw #0x0000
      00892A 00 00                 1562 	.dw #0x0000
                                   1563 	.area CABS (ABS)
