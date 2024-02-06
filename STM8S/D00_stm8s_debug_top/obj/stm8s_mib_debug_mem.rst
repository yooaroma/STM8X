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
      000173                         28 _cmdTbl_only:
      000173                         29 	.ds 12
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
                                     59 ;	./../../mib/stm8s_mib_debug_mem.c: 53: void cmd_mem(void)
                                     60 ;	-----------------------------------------
                                     61 ;	 function cmd_mem
                                     62 ;	-----------------------------------------
      0098B8                         63 _cmd_mem:
      0098B8 52 0A            [ 2]   64 	sub	sp, #10
                                     65 ;	./../../mib/stm8s_mib_debug_mem.c: 59: for (cptr = cmdTbl;; cptr++) 
      0098BA AE 01 4F         [ 2]   66 	ldw	x, #(_cmdTbl+0)
      0098BD 1F 01            [ 2]   67 	ldw	(0x01, sp), x
      0098BF 5F               [ 1]   68 	clrw	x
      0098C0 1F 07            [ 2]   69 	ldw	(0x07, sp), x
      0098C2 1F 05            [ 2]   70 	ldw	(0x05, sp), x
      0098C4 16 01            [ 2]   71 	ldw	y, (0x01, sp)
      0098C6 17 09            [ 2]   72 	ldw	(0x09, sp), y
      0098C8                         73 00106$:
                                     74 ;	./../../mib/stm8s_mib_debug_mem.c: 61: if(cptr->cmd==0)
      0098C8 1E 09            [ 2]   75 	ldw	x, (0x09, sp)
      0098CA FE               [ 2]   76 	ldw	x, (x)
      0098CB 1F 03            [ 2]   77 	ldw	(0x03, sp), x
      0098CD 26 19            [ 1]   78 	jrne	00102$
                                     79 ;	./../../mib/stm8s_mib_debug_mem.c: 63: ccprintf(1,("INFO:+cmd_mem...\r\n"));
      0098CF 4B B7            [ 1]   80 	push	#<(__str_0+0)
      0098D1 4B 82            [ 1]   81 	push	#((__str_0+0) >> 8)
      0098D3 CD 91 73         [ 4]   82 	call	_mib_printf
      0098D6 5B 02            [ 2]   83 	addw	sp, #2
                                     84 ;	./../../mib/stm8s_mib_debug_mem.c: 64: memcpy((void *)&(cptr->cmd),(void *)&(cmdTbl_only[0].cmd),sizeof(CMD_MY));
      0098D8 AE 01 73         [ 2]   85 	ldw	x, #_cmdTbl_only+0
      0098DB 16 01            [ 2]   86 	ldw	y, (0x01, sp)
      0098DD 4B 06            [ 1]   87 	push	#0x06
      0098DF 4B 00            [ 1]   88 	push	#0x00
      0098E1 89               [ 2]   89 	pushw	x
      0098E2 93               [ 1]   90 	ldw	x, y
      0098E3 CD A1 E1         [ 4]   91 	call	___memcpy
                                     92 ;	./../../mib/stm8s_mib_debug_mem.c: 65: break;
      0098E6 20 2F            [ 2]   93 	jra	00105$
      0098E8                         94 00102$:
                                     95 ;	./../../mib/stm8s_mib_debug_mem.c: 67: index++;
      0098E8 1E 07            [ 2]   96 	ldw	x, (0x07, sp)
      0098EA 5C               [ 1]   97 	incw	x
      0098EB 1F 07            [ 2]   98 	ldw	(0x07, sp), x
      0098ED 26 05            [ 1]   99 	jrne	00126$
      0098EF 1E 05            [ 2]  100 	ldw	x, (0x05, sp)
      0098F1 5C               [ 1]  101 	incw	x
      0098F2 1F 05            [ 2]  102 	ldw	(0x05, sp), x
      0098F4                        103 00126$:
                                    104 ;	./../../mib/stm8s_mib_debug_mem.c: 68: if(index>MAX_COMMANDS)
      0098F4 AE 00 06         [ 2]  105 	ldw	x, #0x0006
      0098F7 13 07            [ 2]  106 	cpw	x, (0x07, sp)
      0098F9 4F               [ 1]  107 	clr	a
      0098FA 12 06            [ 1]  108 	sbc	a, (0x06, sp)
      0098FC 4F               [ 1]  109 	clr	a
      0098FD 12 05            [ 1]  110 	sbc	a, (0x05, sp)
      0098FF 24 0B            [ 1]  111 	jrnc	00107$
                                    112 ;	./../../mib/stm8s_mib_debug_mem.c: 70: ccprintf(1,("INFO:-cmd_mem...\r\n"));
      009901 4B CA            [ 1]  113 	push	#<(__str_1+0)
      009903 4B 82            [ 1]  114 	push	#((__str_1+0) >> 8)
      009905 CD 91 73         [ 4]  115 	call	_mib_printf
      009908 5B 02            [ 2]  116 	addw	sp, #2
                                    117 ;	./../../mib/stm8s_mib_debug_mem.c: 71: return;
      00990A 20 0B            [ 2]  118 	jra	00108$
      00990C                        119 00107$:
                                    120 ;	./../../mib/stm8s_mib_debug_mem.c: 59: for (cptr = cmdTbl;; cptr++) 
      00990C 1E 09            [ 2]  121 	ldw	x, (0x09, sp)
      00990E 1C 00 06         [ 2]  122 	addw	x, #0x0006
      009911 1F 09            [ 2]  123 	ldw	(0x09, sp), x
      009913 1F 01            [ 2]  124 	ldw	(0x01, sp), x
      009915 20 B1            [ 2]  125 	jra	00106$
      009917                        126 00105$:
                                    127 ;	./../../mib/stm8s_mib_debug_mem.c: 74: return;
      009917                        128 00108$:
                                    129 ;	./../../mib/stm8s_mib_debug_mem.c: 75: }
      009917 5B 0A            [ 2]  130 	addw	sp, #10
      009919 81               [ 4]  131 	ret
                                    132 ;	./../../mib/stm8s_mib_debug_mem.c: 85: static int DoMem(CMD_MY *cptr, int argc, char **argv)
                                    133 ;	-----------------------------------------
                                    134 ;	 function DoMem
                                    135 ;	-----------------------------------------
      00991A                        136 _DoMem:
      00991A 52 29            [ 2]  137 	sub	sp, #41
      00991C 1F 24            [ 2]  138 	ldw	(0x24, sp), x
                                    139 ;	./../../mib/stm8s_mib_debug_mem.c: 87: uint32_t addr = 0;
      00991E 5F               [ 1]  140 	clrw	x
      00991F 1F 03            [ 2]  141 	ldw	(0x03, sp), x
      009921 1F 01            [ 2]  142 	ldw	(0x01, sp), x
                                    143 ;	./../../mib/stm8s_mib_debug_mem.c: 99: if (argc < 3)
      009923 1E 2C            [ 2]  144 	ldw	x, (0x2c, sp)
      009925 A3 00 03         [ 2]  145 	cpw	x, #0x0003
      009928 2E 0B            [ 1]  146 	jrsge	00102$
                                    147 ;	./../../mib/stm8s_mib_debug_mem.c: 101: MibWriteDebugString(cptr->usage);
      00992A 1E 24            [ 2]  148 	ldw	x, (0x24, sp)
      00992C EE 04            [ 2]  149 	ldw	x, (0x4, x)
      00992E CD 87 62         [ 4]  150 	call	_MibWriteDebugString
                                    151 ;	./../../mib/stm8s_mib_debug_mem.c: 102: return FALSE;
      009931 5F               [ 1]  152 	clrw	x
      009932 CC A0 8F         [ 2]  153 	jp	00235$
      009935                        154 00102$:
                                    155 ;	./../../mib/stm8s_mib_debug_mem.c: 104: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      009935 1E 2E            [ 2]  156 	ldw	x, (0x2e, sp)
      009937 5C               [ 1]  157 	incw	x
      009938 5C               [ 1]  158 	incw	x
      009939 1F 26            [ 2]  159 	ldw	(0x26, sp), x
      00993B FE               [ 2]  160 	ldw	x, (x)
      00993C 4B DD            [ 1]  161 	push	#<(___str_2+0)
      00993E 4B 82            [ 1]  162 	push	#((___str_2+0) >> 8)
      009940 CD A2 65         [ 4]  163 	call	_strcmp
      009943 5D               [ 2]  164 	tnzw	x
      009944 27 03            [ 1]  165 	jreq	00564$
      009946 CC 9A 1C         [ 2]  166 	jp	00215$
      009949                        167 00564$:
                                    168 ;	./../../mib/stm8s_mib_debug_mem.c: 106: if (argc < 5)
      009949 1E 2C            [ 2]  169 	ldw	x, (0x2c, sp)
      00994B A3 00 05         [ 2]  170 	cpw	x, #0x0005
      00994E 2E 0B            [ 1]  171 	jrsge	00104$
                                    172 ;	./../../mib/stm8s_mib_debug_mem.c: 108: MibWriteDebugString(cptr->usage);
      009950 1E 24            [ 2]  173 	ldw	x, (0x24, sp)
      009952 EE 04            [ 2]  174 	ldw	x, (0x4, x)
      009954 CD 87 62         [ 4]  175 	call	_MibWriteDebugString
                                    176 ;	./../../mib/stm8s_mib_debug_mem.c: 109: return FALSE;
      009957 5F               [ 1]  177 	clrw	x
      009958 CC A0 8F         [ 2]  178 	jp	00235$
      00995B                        179 00104$:
                                    180 ;	./../../mib/stm8s_mib_debug_mem.c: 111: if (!HexToInt(argv[3], &addr, 32))
      00995B 96               [ 1]  181 	ldw	x, sp
      00995C 5C               [ 1]  182 	incw	x
      00995D 51               [ 1]  183 	exgw	x, y
      00995E 1E 2E            [ 2]  184 	ldw	x, (0x2e, sp)
      009960 EE 06            [ 2]  185 	ldw	x, (0x6, x)
      009962 4B 20            [ 1]  186 	push	#0x20
      009964 4B 00            [ 1]  187 	push	#0x00
      009966 90 89            [ 2]  188 	pushw	y
      009968 CD 94 59         [ 4]  189 	call	_HexToInt
      00996B 5D               [ 2]  190 	tnzw	x
      00996C 26 0D            [ 1]  191 	jrne	00106$
                                    192 ;	./../../mib/stm8s_mib_debug_mem.c: 113: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00996E 4B E3            [ 1]  193 	push	#<(__str_3+0)
      009970 4B 82            [ 1]  194 	push	#((__str_3+0) >> 8)
      009972 CD 91 73         [ 4]  195 	call	_mib_printf
      009975 5B 02            [ 2]  196 	addw	sp, #2
                                    197 ;	./../../mib/stm8s_mib_debug_mem.c: 114: return FALSE;
      009977 5F               [ 1]  198 	clrw	x
      009978 CC A0 8F         [ 2]  199 	jp	00235$
      00997B                        200 00106$:
                                    201 ;	./../../mib/stm8s_mib_debug_mem.c: 117: switch (argv[2][0])
      00997B 1E 2E            [ 2]  202 	ldw	x, (0x2e, sp)
      00997D EE 04            [ 2]  203 	ldw	x, (0x4, x)
      00997F F6               [ 1]  204 	ld	a, (x)
      009980 A1 63            [ 1]  205 	cp	a, #0x63
      009982 27 0B            [ 1]  206 	jreq	00107$
      009984 A1 6C            [ 1]  207 	cp	a, #0x6c
      009986 27 5B            [ 1]  208 	jreq	00113$
      009988 A1 73            [ 1]  209 	cp	a, #0x73
      00998A 27 2D            [ 1]  210 	jreq	00110$
      00998C CC 9A 11         [ 2]  211 	jp	00116$
                                    212 ;	./../../mib/stm8s_mib_debug_mem.c: 119: case 'c':
      00998F                        213 00107$:
                                    214 ;	./../../mib/stm8s_mib_debug_mem.c: 120: if (!HexToInt(argv[4], &c, 8))
      00998F 96               [ 1]  215 	ldw	x, sp
      009990 1C 00 05         [ 2]  216 	addw	x, #5
      009993 51               [ 1]  217 	exgw	x, y
      009994 1E 2E            [ 2]  218 	ldw	x, (0x2e, sp)
      009996 EE 08            [ 2]  219 	ldw	x, (0x8, x)
      009998 4B 08            [ 1]  220 	push	#0x08
      00999A 4B 00            [ 1]  221 	push	#0x00
      00999C 90 89            [ 2]  222 	pushw	y
      00999E CD 94 59         [ 4]  223 	call	_HexToInt
      0099A1 5D               [ 2]  224 	tnzw	x
      0099A2 26 0D            [ 1]  225 	jrne	00109$
                                    226 ;	./../../mib/stm8s_mib_debug_mem.c: 122: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      0099A4 4B E3            [ 1]  227 	push	#<(__str_3+0)
      0099A6 4B 82            [ 1]  228 	push	#((__str_3+0) >> 8)
      0099A8 CD 91 73         [ 4]  229 	call	_mib_printf
      0099AB 5B 02            [ 2]  230 	addw	sp, #2
                                    231 ;	./../../mib/stm8s_mib_debug_mem.c: 123: return FALSE;
      0099AD 5F               [ 1]  232 	clrw	x
      0099AE CC A0 8F         [ 2]  233 	jp	00235$
      0099B1                        234 00109$:
                                    235 ;	./../../mib/stm8s_mib_debug_mem.c: 125: wr_ADDR8(addr, c);
      0099B1 1E 03            [ 2]  236 	ldw	x, (0x03, sp)
      0099B3 7B 05            [ 1]  237 	ld	a, (0x05, sp)
      0099B5 F7               [ 1]  238 	ld	(x), a
                                    239 ;	./../../mib/stm8s_mib_debug_mem.c: 126: break;
      0099B6 CC A0 8D         [ 2]  240 	jp	00216$
                                    241 ;	./../../mib/stm8s_mib_debug_mem.c: 127: case 's':
      0099B9                        242 00110$:
                                    243 ;	./../../mib/stm8s_mib_debug_mem.c: 128: if (!HexToInt(argv[4], &s, 16))
      0099B9 96               [ 1]  244 	ldw	x, sp
      0099BA 1C 00 06         [ 2]  245 	addw	x, #6
      0099BD 51               [ 1]  246 	exgw	x, y
      0099BE 1E 2E            [ 2]  247 	ldw	x, (0x2e, sp)
      0099C0 EE 08            [ 2]  248 	ldw	x, (0x8, x)
      0099C2 4B 10            [ 1]  249 	push	#0x10
      0099C4 4B 00            [ 1]  250 	push	#0x00
      0099C6 90 89            [ 2]  251 	pushw	y
      0099C8 CD 94 59         [ 4]  252 	call	_HexToInt
      0099CB 5D               [ 2]  253 	tnzw	x
      0099CC 26 0D            [ 1]  254 	jrne	00112$
                                    255 ;	./../../mib/stm8s_mib_debug_mem.c: 130: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      0099CE 4B E3            [ 1]  256 	push	#<(__str_3+0)
      0099D0 4B 82            [ 1]  257 	push	#((__str_3+0) >> 8)
      0099D2 CD 91 73         [ 4]  258 	call	_mib_printf
      0099D5 5B 02            [ 2]  259 	addw	sp, #2
                                    260 ;	./../../mib/stm8s_mib_debug_mem.c: 131: return FALSE;
      0099D7 5F               [ 1]  261 	clrw	x
      0099D8 CC A0 8F         [ 2]  262 	jp	00235$
      0099DB                        263 00112$:
                                    264 ;	./../../mib/stm8s_mib_debug_mem.c: 133: wr_ADDR16(addr, s);
      0099DB 1E 03            [ 2]  265 	ldw	x, (0x03, sp)
      0099DD 16 06            [ 2]  266 	ldw	y, (0x06, sp)
      0099DF FF               [ 2]  267 	ldw	(x), y
                                    268 ;	./../../mib/stm8s_mib_debug_mem.c: 134: break;
      0099E0 CC A0 8D         [ 2]  269 	jp	00216$
                                    270 ;	./../../mib/stm8s_mib_debug_mem.c: 135: case 'l':
      0099E3                        271 00113$:
                                    272 ;	./../../mib/stm8s_mib_debug_mem.c: 136: if (!HexToInt(argv[4], &l, 32))
      0099E3 96               [ 1]  273 	ldw	x, sp
      0099E4 1C 00 08         [ 2]  274 	addw	x, #8
      0099E7 51               [ 1]  275 	exgw	x, y
      0099E8 1E 2E            [ 2]  276 	ldw	x, (0x2e, sp)
      0099EA EE 08            [ 2]  277 	ldw	x, (0x8, x)
      0099EC 4B 20            [ 1]  278 	push	#0x20
      0099EE 4B 00            [ 1]  279 	push	#0x00
      0099F0 90 89            [ 2]  280 	pushw	y
      0099F2 CD 94 59         [ 4]  281 	call	_HexToInt
      0099F5 5D               [ 2]  282 	tnzw	x
      0099F6 26 0D            [ 1]  283 	jrne	00115$
                                    284 ;	./../../mib/stm8s_mib_debug_mem.c: 138: ccprintf(_DEBUG_CMD_A_, ("Illugal character is useqd.\r\n"));
      0099F8 4B 00            [ 1]  285 	push	#<(__str_4+0)
      0099FA 4B 83            [ 1]  286 	push	#((__str_4+0) >> 8)
      0099FC CD 91 73         [ 4]  287 	call	_mib_printf
      0099FF 5B 02            [ 2]  288 	addw	sp, #2
                                    289 ;	./../../mib/stm8s_mib_debug_mem.c: 139: return FALSE;
      009A01 5F               [ 1]  290 	clrw	x
      009A02 CC A0 8F         [ 2]  291 	jp	00235$
      009A05                        292 00115$:
                                    293 ;	./../../mib/stm8s_mib_debug_mem.c: 141: wr_ADDR32(addr, l);
      009A05 1E 03            [ 2]  294 	ldw	x, (0x03, sp)
      009A07 16 0A            [ 2]  295 	ldw	y, (0x0a, sp)
      009A09 EF 02            [ 2]  296 	ldw	(0x2, x), y
      009A0B 16 08            [ 2]  297 	ldw	y, (0x08, sp)
      009A0D FF               [ 2]  298 	ldw	(x), y
                                    299 ;	./../../mib/stm8s_mib_debug_mem.c: 142: break;
      009A0E CC A0 8D         [ 2]  300 	jp	00216$
                                    301 ;	./../../mib/stm8s_mib_debug_mem.c: 143: default:
      009A11                        302 00116$:
                                    303 ;	./../../mib/stm8s_mib_debug_mem.c: 144: MibWriteDebugString(cptr->usage);
      009A11 1E 24            [ 2]  304 	ldw	x, (0x24, sp)
      009A13 EE 04            [ 2]  305 	ldw	x, (0x4, x)
      009A15 CD 87 62         [ 4]  306 	call	_MibWriteDebugString
                                    307 ;	./../../mib/stm8s_mib_debug_mem.c: 145: return FALSE;
      009A18 5F               [ 1]  308 	clrw	x
      009A19 CC A0 8F         [ 2]  309 	jp	00235$
                                    310 ;	./../../mib/stm8s_mib_debug_mem.c: 146: }		
      009A1C                        311 00215$:
                                    312 ;	./../../mib/stm8s_mib_debug_mem.c: 148: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      009A1C 1E 26            [ 2]  313 	ldw	x, (0x26, sp)
      009A1E FE               [ 2]  314 	ldw	x, (x)
      009A1F 4B 1E            [ 1]  315 	push	#<(___str_5+0)
      009A21 4B 83            [ 1]  316 	push	#((___str_5+0) >> 8)
      009A23 CD A2 65         [ 4]  317 	call	_strcmp
      009A26 5D               [ 2]  318 	tnzw	x
      009A27 27 03            [ 1]  319 	jreq	00579$
      009A29 CC 9A E0         [ 2]  320 	jp	00212$
      009A2C                        321 00579$:
                                    322 ;	./../../mib/stm8s_mib_debug_mem.c: 150: if (argc < 4)
      009A2C 1E 2C            [ 2]  323 	ldw	x, (0x2c, sp)
      009A2E A3 00 04         [ 2]  324 	cpw	x, #0x0004
      009A31 2E 0B            [ 1]  325 	jrsge	00119$
                                    326 ;	./../../mib/stm8s_mib_debug_mem.c: 152: MibWriteDebugString(cptr->usage);
      009A33 1E 24            [ 2]  327 	ldw	x, (0x24, sp)
      009A35 EE 04            [ 2]  328 	ldw	x, (0x4, x)
      009A37 CD 87 62         [ 4]  329 	call	_MibWriteDebugString
                                    330 ;	./../../mib/stm8s_mib_debug_mem.c: 153: return FALSE;
      009A3A 5F               [ 1]  331 	clrw	x
      009A3B CC A0 8F         [ 2]  332 	jp	00235$
      009A3E                        333 00119$:
                                    334 ;	./../../mib/stm8s_mib_debug_mem.c: 155: if (!HexToInt(argv[3], &addr, 32))
      009A3E 96               [ 1]  335 	ldw	x, sp
      009A3F 5C               [ 1]  336 	incw	x
      009A40 51               [ 1]  337 	exgw	x, y
      009A41 1E 2E            [ 2]  338 	ldw	x, (0x2e, sp)
      009A43 EE 06            [ 2]  339 	ldw	x, (0x6, x)
      009A45 4B 20            [ 1]  340 	push	#0x20
      009A47 4B 00            [ 1]  341 	push	#0x00
      009A49 90 89            [ 2]  342 	pushw	y
      009A4B CD 94 59         [ 4]  343 	call	_HexToInt
      009A4E 5D               [ 2]  344 	tnzw	x
      009A4F 26 0D            [ 1]  345 	jrne	00121$
                                    346 ;	./../../mib/stm8s_mib_debug_mem.c: 157: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009A51 4B E3            [ 1]  347 	push	#<(__str_3+0)
      009A53 4B 82            [ 1]  348 	push	#((__str_3+0) >> 8)
      009A55 CD 91 73         [ 4]  349 	call	_mib_printf
      009A58 5B 02            [ 2]  350 	addw	sp, #2
                                    351 ;	./../../mib/stm8s_mib_debug_mem.c: 158: return FALSE;
      009A5A 5F               [ 1]  352 	clrw	x
      009A5B CC A0 8F         [ 2]  353 	jp	00235$
      009A5E                        354 00121$:
                                    355 ;	./../../mib/stm8s_mib_debug_mem.c: 160: ccprintf(_DEBUG_CMD_A_,("\taddress : 0x%08lx  ", addr));
      009A5E 1E 03            [ 2]  356 	ldw	x, (0x03, sp)
      009A60 89               [ 2]  357 	pushw	x
      009A61 1E 03            [ 2]  358 	ldw	x, (0x03, sp)
      009A63 89               [ 2]  359 	pushw	x
      009A64 4B 23            [ 1]  360 	push	#<(__str_6+0)
      009A66 4B 83            [ 1]  361 	push	#((__str_6+0) >> 8)
      009A68 CD 91 73         [ 4]  362 	call	_mib_printf
      009A6B 5B 06            [ 2]  363 	addw	sp, #6
                                    364 ;	./../../mib/stm8s_mib_debug_mem.c: 161: ccprintf(_DEBUG_CMD_A_, ("\tvalue   : "));
      009A6D 4B 38            [ 1]  365 	push	#<(__str_7+0)
      009A6F 4B 83            [ 1]  366 	push	#((__str_7+0) >> 8)
      009A71 CD 91 73         [ 4]  367 	call	_mib_printf
      009A74 5B 02            [ 2]  368 	addw	sp, #2
                                    369 ;	./../../mib/stm8s_mib_debug_mem.c: 162: switch (argv[2][0])
      009A76 1E 2E            [ 2]  370 	ldw	x, (0x2e, sp)
      009A78 EE 04            [ 2]  371 	ldw	x, (0x4, x)
      009A7A F6               [ 1]  372 	ld	a, (x)
      009A7B A1 63            [ 1]  373 	cp	a, #0x63
      009A7D 27 0A            [ 1]  374 	jreq	00122$
      009A7F A1 6C            [ 1]  375 	cp	a, #0x6c
      009A81 27 2A            [ 1]  376 	jreq	00124$
      009A83 A1 73            [ 1]  377 	cp	a, #0x73
      009A85 27 15            [ 1]  378 	jreq	00123$
      009A87 20 3E            [ 2]  379 	jra	00125$
                                    380 ;	./../../mib/stm8s_mib_debug_mem.c: 164: case 'c':
      009A89                        381 00122$:
                                    382 ;	./../../mib/stm8s_mib_debug_mem.c: 165: c = rd_ADDR8(addr);
      009A89 1E 03            [ 2]  383 	ldw	x, (0x03, sp)
      009A8B F6               [ 1]  384 	ld	a, (x)
      009A8C 6B 05            [ 1]  385 	ld	(0x05, sp), a
                                    386 ;	./../../mib/stm8s_mib_debug_mem.c: 166: ccprintf(_DEBUG_CMD_A_,("0x%02x ", c));
      009A8E 5F               [ 1]  387 	clrw	x
      009A8F 97               [ 1]  388 	ld	xl, a
      009A90 89               [ 2]  389 	pushw	x
      009A91 4B 44            [ 1]  390 	push	#<(__str_8+0)
      009A93 4B 83            [ 1]  391 	push	#((__str_8+0) >> 8)
      009A95 CD 91 73         [ 4]  392 	call	_mib_printf
      009A98 5B 04            [ 2]  393 	addw	sp, #4
                                    394 ;	./../../mib/stm8s_mib_debug_mem.c: 167: break;
      009A9A 20 38            [ 2]  395 	jra	00126$
                                    396 ;	./../../mib/stm8s_mib_debug_mem.c: 168: case 's':
      009A9C                        397 00123$:
                                    398 ;	./../../mib/stm8s_mib_debug_mem.c: 169: s = rd_ADDR16(addr);
      009A9C 1E 03            [ 2]  399 	ldw	x, (0x03, sp)
      009A9E FE               [ 2]  400 	ldw	x, (x)
      009A9F 1F 06            [ 2]  401 	ldw	(0x06, sp), x
                                    402 ;	./../../mib/stm8s_mib_debug_mem.c: 170: ccprintf(_DEBUG_CMD_A_,("0x%04x", s));
      009AA1 89               [ 2]  403 	pushw	x
      009AA2 4B 4C            [ 1]  404 	push	#<(__str_9+0)
      009AA4 4B 83            [ 1]  405 	push	#((__str_9+0) >> 8)
      009AA6 CD 91 73         [ 4]  406 	call	_mib_printf
      009AA9 5B 04            [ 2]  407 	addw	sp, #4
                                    408 ;	./../../mib/stm8s_mib_debug_mem.c: 171: break;
      009AAB 20 27            [ 2]  409 	jra	00126$
                                    410 ;	./../../mib/stm8s_mib_debug_mem.c: 172: case 'l':
      009AAD                        411 00124$:
                                    412 ;	./../../mib/stm8s_mib_debug_mem.c: 173: l = rd_ADDR32(addr);
      009AAD 1E 03            [ 2]  413 	ldw	x, (0x03, sp)
      009AAF 90 93            [ 1]  414 	ldw	y, x
      009AB1 90 EE 02         [ 2]  415 	ldw	y, (0x2, y)
      009AB4 FE               [ 2]  416 	ldw	x, (x)
      009AB5 17 0A            [ 2]  417 	ldw	(0x0a, sp), y
      009AB7 1F 08            [ 2]  418 	ldw	(0x08, sp), x
                                    419 ;	./../../mib/stm8s_mib_debug_mem.c: 174: ccprintf(_DEBUG_CMD_A_,("0x%08lx", l));
      009AB9 90 89            [ 2]  420 	pushw	y
      009ABB 89               [ 2]  421 	pushw	x
      009ABC 4B 53            [ 1]  422 	push	#<(__str_10+0)
      009ABE 4B 83            [ 1]  423 	push	#((__str_10+0) >> 8)
      009AC0 CD 91 73         [ 4]  424 	call	_mib_printf
      009AC3 5B 06            [ 2]  425 	addw	sp, #6
                                    426 ;	./../../mib/stm8s_mib_debug_mem.c: 175: break;
      009AC5 20 0D            [ 2]  427 	jra	00126$
                                    428 ;	./../../mib/stm8s_mib_debug_mem.c: 176: default:
      009AC7                        429 00125$:
                                    430 ;	./../../mib/stm8s_mib_debug_mem.c: 177: ccprintf(_DEBUG_CMD_A_, ("Error.\r\n"));
      009AC7 4B 5B            [ 1]  431 	push	#<(__str_11+0)
      009AC9 4B 83            [ 1]  432 	push	#((__str_11+0) >> 8)
      009ACB CD 91 73         [ 4]  433 	call	_mib_printf
      009ACE 5B 02            [ 2]  434 	addw	sp, #2
                                    435 ;	./../../mib/stm8s_mib_debug_mem.c: 178: return FALSE;
      009AD0 5F               [ 1]  436 	clrw	x
      009AD1 CC A0 8F         [ 2]  437 	jp	00235$
                                    438 ;	./../../mib/stm8s_mib_debug_mem.c: 179: }
      009AD4                        439 00126$:
                                    440 ;	./../../mib/stm8s_mib_debug_mem.c: 180: ccprintf(_DEBUG_CMD_A_, (".\r\n"));		
      009AD4 4B 64            [ 1]  441 	push	#<(__str_12+0)
      009AD6 4B 83            [ 1]  442 	push	#((__str_12+0) >> 8)
      009AD8 CD 91 73         [ 4]  443 	call	_mib_printf
      009ADB 5B 02            [ 2]  444 	addw	sp, #2
      009ADD CC A0 8D         [ 2]  445 	jp	00216$
      009AE0                        446 00212$:
                                    447 ;	./../../mib/stm8s_mib_debug_mem.c: 182: else if (!strcmp(argv[1], "wrn")) // _CMD_MY_WRITE_
      009AE0 1E 26            [ 2]  448 	ldw	x, (0x26, sp)
      009AE2 FE               [ 2]  449 	ldw	x, (x)
      009AE3 4B 68            [ 1]  450 	push	#<(___str_13+0)
      009AE5 4B 83            [ 1]  451 	push	#((___str_13+0) >> 8)
      009AE7 CD A2 65         [ 4]  452 	call	_strcmp
      009AEA 5D               [ 2]  453 	tnzw	x
      009AEB 27 03            [ 1]  454 	jreq	00591$
      009AED CC 9C 77         [ 2]  455 	jp	00209$
      009AF0                        456 00591$:
                                    457 ;	./../../mib/stm8s_mib_debug_mem.c: 185: if (argc < 6)
      009AF0 1E 2C            [ 2]  458 	ldw	x, (0x2c, sp)
      009AF2 A3 00 06         [ 2]  459 	cpw	x, #0x0006
      009AF5 2E 0B            [ 1]  460 	jrsge	00128$
                                    461 ;	./../../mib/stm8s_mib_debug_mem.c: 187: MibWriteDebugString(cptr->usage);
      009AF7 1E 24            [ 2]  462 	ldw	x, (0x24, sp)
      009AF9 EE 04            [ 2]  463 	ldw	x, (0x4, x)
      009AFB CD 87 62         [ 4]  464 	call	_MibWriteDebugString
                                    465 ;	./../../mib/stm8s_mib_debug_mem.c: 188: return FALSE;
      009AFE 5F               [ 1]  466 	clrw	x
      009AFF CC A0 8F         [ 2]  467 	jp	00235$
      009B02                        468 00128$:
                                    469 ;	./../../mib/stm8s_mib_debug_mem.c: 190: if (!HexToInt(argv[3], &addr, 32))
      009B02 96               [ 1]  470 	ldw	x, sp
      009B03 5C               [ 1]  471 	incw	x
      009B04 51               [ 1]  472 	exgw	x, y
      009B05 1E 2E            [ 2]  473 	ldw	x, (0x2e, sp)
      009B07 EE 06            [ 2]  474 	ldw	x, (0x6, x)
      009B09 4B 20            [ 1]  475 	push	#0x20
      009B0B 4B 00            [ 1]  476 	push	#0x00
      009B0D 90 89            [ 2]  477 	pushw	y
      009B0F CD 94 59         [ 4]  478 	call	_HexToInt
      009B12 5D               [ 2]  479 	tnzw	x
      009B13 26 0D            [ 1]  480 	jrne	00130$
                                    481 ;	./../../mib/stm8s_mib_debug_mem.c: 192: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009B15 4B E3            [ 1]  482 	push	#<(__str_3+0)
      009B17 4B 82            [ 1]  483 	push	#((__str_3+0) >> 8)
      009B19 CD 91 73         [ 4]  484 	call	_mib_printf
      009B1C 5B 02            [ 2]  485 	addw	sp, #2
                                    486 ;	./../../mib/stm8s_mib_debug_mem.c: 193: return FALSE;
      009B1E 5F               [ 1]  487 	clrw	x
      009B1F CC A0 8F         [ 2]  488 	jp	00235$
      009B22                        489 00130$:
                                    490 ;	./../../mib/stm8s_mib_debug_mem.c: 195: if (!HexToInt(argv[5], &v_Loop, 32))
      009B22 96               [ 1]  491 	ldw	x, sp
      009B23 1C 00 18         [ 2]  492 	addw	x, #24
      009B26 51               [ 1]  493 	exgw	x, y
      009B27 1E 2E            [ 2]  494 	ldw	x, (0x2e, sp)
      009B29 EE 0A            [ 2]  495 	ldw	x, (0xa, x)
      009B2B 4B 20            [ 1]  496 	push	#0x20
      009B2D 4B 00            [ 1]  497 	push	#0x00
      009B2F 90 89            [ 2]  498 	pushw	y
      009B31 CD 94 59         [ 4]  499 	call	_HexToInt
      009B34 5D               [ 2]  500 	tnzw	x
      009B35 26 0D            [ 1]  501 	jrne	00132$
                                    502 ;	./../../mib/stm8s_mib_debug_mem.c: 197: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009B37 4B E3            [ 1]  503 	push	#<(__str_3+0)
      009B39 4B 82            [ 1]  504 	push	#((__str_3+0) >> 8)
      009B3B CD 91 73         [ 4]  505 	call	_mib_printf
      009B3E 5B 02            [ 2]  506 	addw	sp, #2
                                    507 ;	./../../mib/stm8s_mib_debug_mem.c: 198: return FALSE;
      009B40 5F               [ 1]  508 	clrw	x
      009B41 CC A0 8F         [ 2]  509 	jp	00235$
      009B44                        510 00132$:
                                    511 ;	./../../mib/stm8s_mib_debug_mem.c: 200: switch (argv[2][0])
      009B44 1E 2E            [ 2]  512 	ldw	x, (0x2e, sp)
      009B46 EE 04            [ 2]  513 	ldw	x, (0x4, x)
      009B48 F6               [ 1]  514 	ld	a, (x)
      009B49 A1 63            [ 1]  515 	cp	a, #0x63
      009B4B 27 0E            [ 1]  516 	jreq	00133$
      009B4D A1 6C            [ 1]  517 	cp	a, #0x6c
      009B4F 26 03            [ 1]  518 	jrne	00599$
      009B51 CC 9C 08         [ 2]  519 	jp	00141$
      009B54                        520 00599$:
      009B54 A1 73            [ 1]  521 	cp	a, #0x73
      009B56 27 55            [ 1]  522 	jreq	00137$
      009B58 CC 9C 67         [ 2]  523 	jp	00145$
                                    524 ;	./../../mib/stm8s_mib_debug_mem.c: 202: case 'c':
      009B5B                        525 00133$:
                                    526 ;	./../../mib/stm8s_mib_debug_mem.c: 203: if (!HexToInt(argv[4], &c, 8))
      009B5B 96               [ 1]  527 	ldw	x, sp
      009B5C 1C 00 05         [ 2]  528 	addw	x, #5
      009B5F 16 2E            [ 2]  529 	ldw	y, (0x2e, sp)
      009B61 90 EE 08         [ 2]  530 	ldw	y, (0x8, y)
      009B64 4B 08            [ 1]  531 	push	#0x08
      009B66 4B 00            [ 1]  532 	push	#0x00
      009B68 89               [ 2]  533 	pushw	x
      009B69 93               [ 1]  534 	ldw	x, y
      009B6A CD 94 59         [ 4]  535 	call	_HexToInt
      009B6D 5D               [ 2]  536 	tnzw	x
      009B6E 26 0D            [ 1]  537 	jrne	00262$
                                    538 ;	./../../mib/stm8s_mib_debug_mem.c: 205: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009B70 4B E3            [ 1]  539 	push	#<(__str_3+0)
      009B72 4B 82            [ 1]  540 	push	#((__str_3+0) >> 8)
      009B74 CD 91 73         [ 4]  541 	call	_mib_printf
      009B77 5B 02            [ 2]  542 	addw	sp, #2
                                    543 ;	./../../mib/stm8s_mib_debug_mem.c: 206: return FALSE;
      009B79 5F               [ 1]  544 	clrw	x
      009B7A CC A0 8F         [ 2]  545 	jp	00235$
      009B7D                        546 00262$:
      009B7D 16 1A            [ 2]  547 	ldw	y, (0x1a, sp)
      009B7F 17 28            [ 2]  548 	ldw	(0x28, sp), y
      009B81 16 18            [ 2]  549 	ldw	y, (0x18, sp)
      009B83 17 26            [ 2]  550 	ldw	(0x26, sp), y
      009B85                        551 00218$:
                                    552 ;	./../../mib/stm8s_mib_debug_mem.c: 208: for (; v_Loop; v_Loop--) wr_ADDR8(addr, c);
      009B85 1E 28            [ 2]  553 	ldw	x, (0x28, sp)
      009B87 26 07            [ 1]  554 	jrne	00605$
      009B89 1E 26            [ 2]  555 	ldw	x, (0x26, sp)
      009B8B 26 03            [ 1]  556 	jrne	00605$
      009B8D CC A0 71         [ 2]  557 	jp	00301$
      009B90                        558 00605$:
      009B90 1E 03            [ 2]  559 	ldw	x, (0x03, sp)
      009B92 7B 05            [ 1]  560 	ld	a, (0x05, sp)
      009B94 F7               [ 1]  561 	ld	(x), a
      009B95 1E 28            [ 2]  562 	ldw	x, (0x28, sp)
      009B97 1D 00 01         [ 2]  563 	subw	x, #0x0001
      009B9A 1F 28            [ 2]  564 	ldw	(0x28, sp), x
      009B9C 1E 26            [ 2]  565 	ldw	x, (0x26, sp)
      009B9E 24 01            [ 1]  566 	jrnc	00606$
      009BA0 5A               [ 2]  567 	decw	x
      009BA1                        568 00606$:
      009BA1 1F 26            [ 2]  569 	ldw	(0x26, sp), x
      009BA3 16 28            [ 2]  570 	ldw	y, (0x28, sp)
      009BA5 17 1A            [ 2]  571 	ldw	(0x1a, sp), y
      009BA7 16 26            [ 2]  572 	ldw	y, (0x26, sp)
      009BA9 17 18            [ 2]  573 	ldw	(0x18, sp), y
      009BAB 20 D8            [ 2]  574 	jra	00218$
                                    575 ;	./../../mib/stm8s_mib_debug_mem.c: 210: case 's':
      009BAD                        576 00137$:
                                    577 ;	./../../mib/stm8s_mib_debug_mem.c: 211: if (!HexToInt(argv[4], &s, 16))
      009BAD 16 2E            [ 2]  578 	ldw	y, (0x2e, sp)
      009BAF 17 26            [ 2]  579 	ldw	(0x26, sp), y
      009BB1 93               [ 1]  580 	ldw	x, y
      009BB2 EE 08            [ 2]  581 	ldw	x, (0x8, x)
      009BB4 1F 28            [ 2]  582 	ldw	(0x28, sp), x
      009BB6 4B 10            [ 1]  583 	push	#0x10
      009BB8 4B 00            [ 1]  584 	push	#0x00
      009BBA 96               [ 1]  585 	ldw	x, sp
      009BBB 1C 00 08         [ 2]  586 	addw	x, #8
      009BBE 89               [ 2]  587 	pushw	x
      009BBF 1E 2C            [ 2]  588 	ldw	x, (0x2c, sp)
      009BC1 CD 94 59         [ 4]  589 	call	_HexToInt
      009BC4 1F 28            [ 2]  590 	ldw	(0x28, sp), x
      009BC6 26 0D            [ 1]  591 	jrne	00265$
                                    592 ;	./../../mib/stm8s_mib_debug_mem.c: 213: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009BC8 4B E3            [ 1]  593 	push	#<(__str_3+0)
      009BCA 4B 82            [ 1]  594 	push	#((__str_3+0) >> 8)
      009BCC CD 91 73         [ 4]  595 	call	_mib_printf
      009BCF 5B 02            [ 2]  596 	addw	sp, #2
                                    597 ;	./../../mib/stm8s_mib_debug_mem.c: 214: return FALSE;
      009BD1 5F               [ 1]  598 	clrw	x
      009BD2 CC A0 8F         [ 2]  599 	jp	00235$
      009BD5                        600 00265$:
      009BD5 16 1A            [ 2]  601 	ldw	y, (0x1a, sp)
      009BD7 17 28            [ 2]  602 	ldw	(0x28, sp), y
      009BD9 16 18            [ 2]  603 	ldw	y, (0x18, sp)
      009BDB 17 26            [ 2]  604 	ldw	(0x26, sp), y
      009BDD                        605 00221$:
                                    606 ;	./../../mib/stm8s_mib_debug_mem.c: 216: for (; v_Loop; v_Loop--) wr_ADDR16(addr, s);
      009BDD 1E 28            [ 2]  607 	ldw	x, (0x28, sp)
      009BDF 26 07            [ 1]  608 	jrne	00608$
      009BE1 1E 26            [ 2]  609 	ldw	x, (0x26, sp)
      009BE3 26 03            [ 1]  610 	jrne	00608$
      009BE5 CC A0 7B         [ 2]  611 	jp	00302$
      009BE8                        612 00608$:
      009BE8 16 03            [ 2]  613 	ldw	y, (0x03, sp)
      009BEA 17 22            [ 2]  614 	ldw	(0x22, sp), y
      009BEC 93               [ 1]  615 	ldw	x, y
      009BED 16 06            [ 2]  616 	ldw	y, (0x06, sp)
      009BEF FF               [ 2]  617 	ldw	(x), y
      009BF0 1E 28            [ 2]  618 	ldw	x, (0x28, sp)
      009BF2 1D 00 01         [ 2]  619 	subw	x, #0x0001
      009BF5 1F 28            [ 2]  620 	ldw	(0x28, sp), x
      009BF7 1E 26            [ 2]  621 	ldw	x, (0x26, sp)
      009BF9 24 01            [ 1]  622 	jrnc	00609$
      009BFB 5A               [ 2]  623 	decw	x
      009BFC                        624 00609$:
      009BFC 1F 26            [ 2]  625 	ldw	(0x26, sp), x
      009BFE 16 28            [ 2]  626 	ldw	y, (0x28, sp)
      009C00 17 1A            [ 2]  627 	ldw	(0x1a, sp), y
      009C02 16 26            [ 2]  628 	ldw	y, (0x26, sp)
      009C04 17 18            [ 2]  629 	ldw	(0x18, sp), y
      009C06 20 D5            [ 2]  630 	jra	00221$
                                    631 ;	./../../mib/stm8s_mib_debug_mem.c: 218: case 'l':
      009C08                        632 00141$:
                                    633 ;	./../../mib/stm8s_mib_debug_mem.c: 219: if (!HexToInt(argv[4], &l, 32))
      009C08 16 2E            [ 2]  634 	ldw	y, (0x2e, sp)
      009C0A 17 26            [ 2]  635 	ldw	(0x26, sp), y
      009C0C 93               [ 1]  636 	ldw	x, y
      009C0D EE 08            [ 2]  637 	ldw	x, (0x8, x)
      009C0F 1F 28            [ 2]  638 	ldw	(0x28, sp), x
      009C11 4B 20            [ 1]  639 	push	#0x20
      009C13 4B 00            [ 1]  640 	push	#0x00
      009C15 96               [ 1]  641 	ldw	x, sp
      009C16 1C 00 0A         [ 2]  642 	addw	x, #10
      009C19 89               [ 2]  643 	pushw	x
      009C1A 1E 2C            [ 2]  644 	ldw	x, (0x2c, sp)
      009C1C CD 94 59         [ 4]  645 	call	_HexToInt
      009C1F 1F 28            [ 2]  646 	ldw	(0x28, sp), x
      009C21 26 0D            [ 1]  647 	jrne	00268$
                                    648 ;	./../../mib/stm8s_mib_debug_mem.c: 221: ccprintf(_DEBUG_CMD_A_, ("Illugal character is useqd.\r\n"));
      009C23 4B 00            [ 1]  649 	push	#<(__str_4+0)
      009C25 4B 83            [ 1]  650 	push	#((__str_4+0) >> 8)
      009C27 CD 91 73         [ 4]  651 	call	_mib_printf
      009C2A 5B 02            [ 2]  652 	addw	sp, #2
                                    653 ;	./../../mib/stm8s_mib_debug_mem.c: 222: return FALSE;
      009C2C 5F               [ 1]  654 	clrw	x
      009C2D CC A0 8F         [ 2]  655 	jp	00235$
      009C30                        656 00268$:
      009C30 16 1A            [ 2]  657 	ldw	y, (0x1a, sp)
      009C32 17 28            [ 2]  658 	ldw	(0x28, sp), y
      009C34 16 18            [ 2]  659 	ldw	y, (0x18, sp)
      009C36 17 26            [ 2]  660 	ldw	(0x26, sp), y
      009C38                        661 00224$:
                                    662 ;	./../../mib/stm8s_mib_debug_mem.c: 224: for (; v_Loop; v_Loop--) wr_ADDR32(addr, l);
      009C38 1E 28            [ 2]  663 	ldw	x, (0x28, sp)
      009C3A 26 07            [ 1]  664 	jrne	00611$
      009C3C 1E 26            [ 2]  665 	ldw	x, (0x26, sp)
      009C3E 26 03            [ 1]  666 	jrne	00611$
      009C40 CC A0 85         [ 2]  667 	jp	00303$
      009C43                        668 00611$:
      009C43 16 03            [ 2]  669 	ldw	y, (0x03, sp)
      009C45 17 22            [ 2]  670 	ldw	(0x22, sp), y
      009C47 93               [ 1]  671 	ldw	x, y
      009C48 16 0A            [ 2]  672 	ldw	y, (0x0a, sp)
      009C4A EF 02            [ 2]  673 	ldw	(0x2, x), y
      009C4C 16 08            [ 2]  674 	ldw	y, (0x08, sp)
      009C4E FF               [ 2]  675 	ldw	(x), y
      009C4F 1E 28            [ 2]  676 	ldw	x, (0x28, sp)
      009C51 1D 00 01         [ 2]  677 	subw	x, #0x0001
      009C54 1F 28            [ 2]  678 	ldw	(0x28, sp), x
      009C56 1E 26            [ 2]  679 	ldw	x, (0x26, sp)
      009C58 24 01            [ 1]  680 	jrnc	00612$
      009C5A 5A               [ 2]  681 	decw	x
      009C5B                        682 00612$:
      009C5B 1F 26            [ 2]  683 	ldw	(0x26, sp), x
      009C5D 16 28            [ 2]  684 	ldw	y, (0x28, sp)
      009C5F 17 1A            [ 2]  685 	ldw	(0x1a, sp), y
      009C61 16 26            [ 2]  686 	ldw	y, (0x26, sp)
      009C63 17 18            [ 2]  687 	ldw	(0x18, sp), y
      009C65 20 D1            [ 2]  688 	jra	00224$
                                    689 ;	./../../mib/stm8s_mib_debug_mem.c: 226: default:
      009C67                        690 00145$:
                                    691 ;	./../../mib/stm8s_mib_debug_mem.c: 227: MibWriteDebugString(cptr->usage);
      009C67 16 24            [ 2]  692 	ldw	y, (0x24, sp)
      009C69 17 26            [ 2]  693 	ldw	(0x26, sp), y
      009C6B 93               [ 1]  694 	ldw	x, y
      009C6C EE 04            [ 2]  695 	ldw	x, (0x4, x)
      009C6E 1F 28            [ 2]  696 	ldw	(0x28, sp), x
      009C70 CD 87 62         [ 4]  697 	call	_MibWriteDebugString
                                    698 ;	./../../mib/stm8s_mib_debug_mem.c: 228: return FALSE;
      009C73 5F               [ 1]  699 	clrw	x
      009C74 CC A0 8F         [ 2]  700 	jp	00235$
                                    701 ;	./../../mib/stm8s_mib_debug_mem.c: 229: }	
      009C77                        702 00209$:
                                    703 ;	./../../mib/stm8s_mib_debug_mem.c: 231: else if (!strcmp(argv[1], "rdn")) // _CMD_MY_READ_
      009C77 1E 26            [ 2]  704 	ldw	x, (0x26, sp)
      009C79 FE               [ 2]  705 	ldw	x, (x)
      009C7A 1F 28            [ 2]  706 	ldw	(0x28, sp), x
      009C7C 4B 6C            [ 1]  707 	push	#<(___str_14+0)
      009C7E 4B 83            [ 1]  708 	push	#((___str_14+0) >> 8)
      009C80 1E 2A            [ 2]  709 	ldw	x, (0x2a, sp)
      009C82 CD A2 65         [ 4]  710 	call	_strcmp
      009C85 1F 28            [ 2]  711 	ldw	(0x28, sp), x
      009C87 27 03            [ 1]  712 	jreq	00613$
      009C89 CC 9E 6A         [ 2]  713 	jp	00206$
      009C8C                        714 00613$:
                                    715 ;	./../../mib/stm8s_mib_debug_mem.c: 234: if (argc < 5)
      009C8C 1E 2C            [ 2]  716 	ldw	x, (0x2c, sp)
      009C8E A3 00 05         [ 2]  717 	cpw	x, #0x0005
      009C91 2E 10            [ 1]  718 	jrsge	00148$
                                    719 ;	./../../mib/stm8s_mib_debug_mem.c: 236: MibWriteDebugString(cptr->usage);
      009C93 16 24            [ 2]  720 	ldw	y, (0x24, sp)
      009C95 17 26            [ 2]  721 	ldw	(0x26, sp), y
      009C97 93               [ 1]  722 	ldw	x, y
      009C98 EE 04            [ 2]  723 	ldw	x, (0x4, x)
      009C9A 1F 28            [ 2]  724 	ldw	(0x28, sp), x
      009C9C CD 87 62         [ 4]  725 	call	_MibWriteDebugString
                                    726 ;	./../../mib/stm8s_mib_debug_mem.c: 237: return FALSE;
      009C9F 5F               [ 1]  727 	clrw	x
      009CA0 CC A0 8F         [ 2]  728 	jp	00235$
      009CA3                        729 00148$:
                                    730 ;	./../../mib/stm8s_mib_debug_mem.c: 239: if (!HexToInt(argv[3], &addr, 32))
      009CA3 16 2E            [ 2]  731 	ldw	y, (0x2e, sp)
      009CA5 17 26            [ 2]  732 	ldw	(0x26, sp), y
      009CA7 93               [ 1]  733 	ldw	x, y
      009CA8 EE 06            [ 2]  734 	ldw	x, (0x6, x)
      009CAA 1F 28            [ 2]  735 	ldw	(0x28, sp), x
      009CAC 4B 20            [ 1]  736 	push	#0x20
      009CAE 4B 00            [ 1]  737 	push	#0x00
      009CB0 96               [ 1]  738 	ldw	x, sp
      009CB1 1C 00 03         [ 2]  739 	addw	x, #3
      009CB4 89               [ 2]  740 	pushw	x
      009CB5 1E 2C            [ 2]  741 	ldw	x, (0x2c, sp)
      009CB7 CD 94 59         [ 4]  742 	call	_HexToInt
      009CBA 1F 28            [ 2]  743 	ldw	(0x28, sp), x
      009CBC 26 0D            [ 1]  744 	jrne	00150$
                                    745 ;	./../../mib/stm8s_mib_debug_mem.c: 241: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009CBE 4B E3            [ 1]  746 	push	#<(__str_3+0)
      009CC0 4B 82            [ 1]  747 	push	#((__str_3+0) >> 8)
      009CC2 CD 91 73         [ 4]  748 	call	_mib_printf
      009CC5 5B 02            [ 2]  749 	addw	sp, #2
                                    750 ;	./../../mib/stm8s_mib_debug_mem.c: 242: return FALSE;
      009CC7 5F               [ 1]  751 	clrw	x
      009CC8 CC A0 8F         [ 2]  752 	jp	00235$
      009CCB                        753 00150$:
                                    754 ;	./../../mib/stm8s_mib_debug_mem.c: 244: if (!HexToInt(argv[4], &v_Loop, 32))
      009CCB 16 2E            [ 2]  755 	ldw	y, (0x2e, sp)
      009CCD 17 26            [ 2]  756 	ldw	(0x26, sp), y
      009CCF 93               [ 1]  757 	ldw	x, y
      009CD0 EE 08            [ 2]  758 	ldw	x, (0x8, x)
      009CD2 1F 28            [ 2]  759 	ldw	(0x28, sp), x
      009CD4 4B 20            [ 1]  760 	push	#0x20
      009CD6 4B 00            [ 1]  761 	push	#0x00
      009CD8 96               [ 1]  762 	ldw	x, sp
      009CD9 1C 00 1A         [ 2]  763 	addw	x, #26
      009CDC 89               [ 2]  764 	pushw	x
      009CDD 1E 2C            [ 2]  765 	ldw	x, (0x2c, sp)
      009CDF CD 94 59         [ 4]  766 	call	_HexToInt
      009CE2 1F 28            [ 2]  767 	ldw	(0x28, sp), x
      009CE4 26 0D            [ 1]  768 	jrne	00152$
                                    769 ;	./../../mib/stm8s_mib_debug_mem.c: 246: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009CE6 4B E3            [ 1]  770 	push	#<(__str_3+0)
      009CE8 4B 82            [ 1]  771 	push	#((__str_3+0) >> 8)
      009CEA CD 91 73         [ 4]  772 	call	_mib_printf
      009CED 5B 02            [ 2]  773 	addw	sp, #2
                                    774 ;	./../../mib/stm8s_mib_debug_mem.c: 247: return FALSE;
      009CEF 5F               [ 1]  775 	clrw	x
      009CF0 CC A0 8F         [ 2]  776 	jp	00235$
      009CF3                        777 00152$:
                                    778 ;	./../../mib/stm8s_mib_debug_mem.c: 249: ccprintf(_DEBUG_CMD_A_,("\taddress : 0x%08lx  ", addr));
      009CF3 1E 03            [ 2]  779 	ldw	x, (0x03, sp)
      009CF5 89               [ 2]  780 	pushw	x
      009CF6 1E 03            [ 2]  781 	ldw	x, (0x03, sp)
      009CF8 89               [ 2]  782 	pushw	x
      009CF9 4B 23            [ 1]  783 	push	#<(__str_6+0)
      009CFB 4B 83            [ 1]  784 	push	#((__str_6+0) >> 8)
      009CFD CD 91 73         [ 4]  785 	call	_mib_printf
      009D00 5B 06            [ 2]  786 	addw	sp, #6
                                    787 ;	./../../mib/stm8s_mib_debug_mem.c: 250: ccprintf(_DEBUG_CMD_A_,("loop : 0x%08lx  \r\n", v_Loop));
      009D02 1E 1A            [ 2]  788 	ldw	x, (0x1a, sp)
      009D04 89               [ 2]  789 	pushw	x
      009D05 1E 1A            [ 2]  790 	ldw	x, (0x1a, sp)
      009D07 89               [ 2]  791 	pushw	x
      009D08 4B 70            [ 1]  792 	push	#<(__str_15+0)
      009D0A 4B 83            [ 1]  793 	push	#((__str_15+0) >> 8)
      009D0C CD 91 73         [ 4]  794 	call	_mib_printf
      009D0F 5B 06            [ 2]  795 	addw	sp, #6
                                    796 ;	./../../mib/stm8s_mib_debug_mem.c: 251: ccprintf(_DEBUG_CMD_A_, ("value   : "));
      009D11 4B 83            [ 1]  797 	push	#<(__str_16+0)
      009D13 4B 83            [ 1]  798 	push	#((__str_16+0) >> 8)
      009D15 CD 91 73         [ 4]  799 	call	_mib_printf
      009D18 5B 02            [ 2]  800 	addw	sp, #2
                                    801 ;	./../../mib/stm8s_mib_debug_mem.c: 252: switch (argv[2][0])
      009D1A 16 2E            [ 2]  802 	ldw	y, (0x2e, sp)
      009D1C 17 26            [ 2]  803 	ldw	(0x26, sp), y
      009D1E 93               [ 1]  804 	ldw	x, y
      009D1F EE 04            [ 2]  805 	ldw	x, (0x4, x)
      009D21 1F 28            [ 2]  806 	ldw	(0x28, sp), x
      009D23 F6               [ 1]  807 	ld	a, (x)
      009D24 A1 63            [ 1]  808 	cp	a, #0x63
      009D26 27 0E            [ 1]  809 	jreq	00278$
      009D28 A1 6C            [ 1]  810 	cp	a, #0x6c
      009D2A 26 03            [ 1]  811 	jrne	00621$
      009D2C CC 9D DB         [ 2]  812 	jp	00284$
      009D2F                        813 00621$:
      009D2F A1 73            [ 1]  814 	cp	a, #0x73
      009D31 27 59            [ 1]  815 	jreq	00281$
      009D33 CC 9E 35         [ 2]  816 	jp	00165$
                                    817 ;	./../../mib/stm8s_mib_debug_mem.c: 254: case 'c':
      009D36                        818 00278$:
      009D36 16 1A            [ 2]  819 	ldw	y, (0x1a, sp)
      009D38 17 28            [ 2]  820 	ldw	(0x28, sp), y
      009D3A 16 18            [ 2]  821 	ldw	y, (0x18, sp)
      009D3C 17 26            [ 2]  822 	ldw	(0x26, sp), y
      009D3E                        823 00227$:
                                    824 ;	./../../mib/stm8s_mib_debug_mem.c: 255: for (; v_Loop; v_Loop--)
      009D3E 1E 28            [ 2]  825 	ldw	x, (0x28, sp)
      009D40 26 07            [ 1]  826 	jrne	00626$
      009D42 1E 26            [ 2]  827 	ldw	x, (0x26, sp)
      009D44 26 03            [ 1]  828 	jrne	00626$
      009D46 CC 9E 42         [ 2]  829 	jp	00304$
      009D49                        830 00626$:
                                    831 ;	./../../mib/stm8s_mib_debug_mem.c: 257: c = rd_ADDR8(addr);
      009D49 16 03            [ 2]  832 	ldw	y, (0x03, sp)
      009D4B 17 22            [ 2]  833 	ldw	(0x22, sp), y
      009D4D 93               [ 1]  834 	ldw	x, y
      009D4E F6               [ 1]  835 	ld	a, (x)
      009D4F 6B 1F            [ 1]  836 	ld	(0x1f, sp), a
      009D51 6B 05            [ 1]  837 	ld	(0x05, sp), a
                                    838 ;	./../../mib/stm8s_mib_debug_mem.c: 258: if ((v_Loop & 0xfffff) == 0)
      009D53 16 28            [ 2]  839 	ldw	y, (0x28, sp)
      009D55 17 22            [ 2]  840 	ldw	(0x22, sp), y
      009D57 7B 27            [ 1]  841 	ld	a, (0x27, sp)
      009D59 A4 0F            [ 1]  842 	and	a, #0x0f
      009D5B 6B 21            [ 1]  843 	ld	(0x21, sp), a
      009D5D 0F 20            [ 1]  844 	clr	(0x20, sp)
      009D5F 1E 22            [ 2]  845 	ldw	x, (0x22, sp)
      009D61 26 11            [ 1]  846 	jrne	00228$
                                    847 ;	./../../mib/stm8s_mib_debug_mem.c: 260: ccprintf(_DEBUG_CMD_A_,("0x%02x ", c));
      009D63 1E 20            [ 2]  848 	ldw	x, (0x20, sp)
      009D65 26 0D            [ 1]  849 	jrne	00228$
      009D67 7B 1F            [ 1]  850 	ld	a, (0x1f, sp)
      009D69 97               [ 1]  851 	ld	xl, a
      009D6A 89               [ 2]  852 	pushw	x
      009D6B 4B 44            [ 1]  853 	push	#<(__str_8+0)
      009D6D 4B 83            [ 1]  854 	push	#((__str_8+0) >> 8)
      009D6F CD 91 73         [ 4]  855 	call	_mib_printf
      009D72 5B 04            [ 2]  856 	addw	sp, #4
      009D74                        857 00228$:
                                    858 ;	./../../mib/stm8s_mib_debug_mem.c: 255: for (; v_Loop; v_Loop--)
      009D74 1E 28            [ 2]  859 	ldw	x, (0x28, sp)
      009D76 1D 00 01         [ 2]  860 	subw	x, #0x0001
      009D79 1F 28            [ 2]  861 	ldw	(0x28, sp), x
      009D7B 1E 26            [ 2]  862 	ldw	x, (0x26, sp)
      009D7D 24 01            [ 1]  863 	jrnc	00629$
      009D7F 5A               [ 2]  864 	decw	x
      009D80                        865 00629$:
      009D80 1F 26            [ 2]  866 	ldw	(0x26, sp), x
      009D82 16 28            [ 2]  867 	ldw	y, (0x28, sp)
      009D84 17 1A            [ 2]  868 	ldw	(0x1a, sp), y
      009D86 16 26            [ 2]  869 	ldw	y, (0x26, sp)
      009D88 17 18            [ 2]  870 	ldw	(0x18, sp), y
      009D8A 20 B2            [ 2]  871 	jra	00227$
                                    872 ;	./../../mib/stm8s_mib_debug_mem.c: 264: case 's':
      009D8C                        873 00281$:
      009D8C 16 1A            [ 2]  874 	ldw	y, (0x1a, sp)
      009D8E 17 28            [ 2]  875 	ldw	(0x28, sp), y
      009D90 16 18            [ 2]  876 	ldw	y, (0x18, sp)
      009D92 17 26            [ 2]  877 	ldw	(0x26, sp), y
      009D94                        878 00230$:
                                    879 ;	./../../mib/stm8s_mib_debug_mem.c: 265: for (; v_Loop; v_Loop--)
      009D94 1E 28            [ 2]  880 	ldw	x, (0x28, sp)
      009D96 26 07            [ 1]  881 	jrne	00630$
      009D98 1E 26            [ 2]  882 	ldw	x, (0x26, sp)
      009D9A 26 03            [ 1]  883 	jrne	00630$
      009D9C CC 9E 4C         [ 2]  884 	jp	00305$
      009D9F                        885 00630$:
                                    886 ;	./../../mib/stm8s_mib_debug_mem.c: 267: s = rd_ADDR16(addr);
      009D9F 1E 03            [ 2]  887 	ldw	x, (0x03, sp)
      009DA1 FE               [ 2]  888 	ldw	x, (x)
      009DA2 1F 1E            [ 2]  889 	ldw	(0x1e, sp), x
      009DA4 1F 06            [ 2]  890 	ldw	(0x06, sp), x
                                    891 ;	./../../mib/stm8s_mib_debug_mem.c: 268: if ((v_Loop & 0xfffff) == 0)
      009DA6 16 28            [ 2]  892 	ldw	y, (0x28, sp)
      009DA8 17 22            [ 2]  893 	ldw	(0x22, sp), y
      009DAA 5F               [ 1]  894 	clrw	x
      009DAB 7B 27            [ 1]  895 	ld	a, (0x27, sp)
      009DAD A4 0F            [ 1]  896 	and	a, #0x0f
      009DAF 97               [ 1]  897 	ld	xl, a
      009DB0 16 22            [ 2]  898 	ldw	y, (0x22, sp)
      009DB2 26 0F            [ 1]  899 	jrne	00231$
      009DB4 5D               [ 2]  900 	tnzw	x
      009DB5 26 0C            [ 1]  901 	jrne	00231$
                                    902 ;	./../../mib/stm8s_mib_debug_mem.c: 270: ccprintf(_DEBUG_CMD_A_,("0x%04x ", s));
      009DB7 1E 1E            [ 2]  903 	ldw	x, (0x1e, sp)
      009DB9 89               [ 2]  904 	pushw	x
      009DBA 4B 8E            [ 1]  905 	push	#<(__str_17+0)
      009DBC 4B 83            [ 1]  906 	push	#((__str_17+0) >> 8)
      009DBE CD 91 73         [ 4]  907 	call	_mib_printf
      009DC1 5B 04            [ 2]  908 	addw	sp, #4
      009DC3                        909 00231$:
                                    910 ;	./../../mib/stm8s_mib_debug_mem.c: 265: for (; v_Loop; v_Loop--)
      009DC3 1E 28            [ 2]  911 	ldw	x, (0x28, sp)
      009DC5 1D 00 01         [ 2]  912 	subw	x, #0x0001
      009DC8 1F 28            [ 2]  913 	ldw	(0x28, sp), x
      009DCA 1E 26            [ 2]  914 	ldw	x, (0x26, sp)
      009DCC 24 01            [ 1]  915 	jrnc	00633$
      009DCE 5A               [ 2]  916 	decw	x
      009DCF                        917 00633$:
      009DCF 1F 26            [ 2]  918 	ldw	(0x26, sp), x
      009DD1 16 28            [ 2]  919 	ldw	y, (0x28, sp)
      009DD3 17 1A            [ 2]  920 	ldw	(0x1a, sp), y
      009DD5 16 26            [ 2]  921 	ldw	y, (0x26, sp)
      009DD7 17 18            [ 2]  922 	ldw	(0x18, sp), y
      009DD9 20 B9            [ 2]  923 	jra	00230$
                                    924 ;	./../../mib/stm8s_mib_debug_mem.c: 274: case 'l':
      009DDB                        925 00284$:
      009DDB 16 1A            [ 2]  926 	ldw	y, (0x1a, sp)
      009DDD 17 28            [ 2]  927 	ldw	(0x28, sp), y
      009DDF 16 18            [ 2]  928 	ldw	y, (0x18, sp)
      009DE1 17 26            [ 2]  929 	ldw	(0x26, sp), y
      009DE3                        930 00233$:
                                    931 ;	./../../mib/stm8s_mib_debug_mem.c: 275: for (; v_Loop; v_Loop--)
      009DE3 1E 28            [ 2]  932 	ldw	x, (0x28, sp)
      009DE5 26 04            [ 1]  933 	jrne	00634$
      009DE7 1E 26            [ 2]  934 	ldw	x, (0x26, sp)
      009DE9 27 6B            [ 1]  935 	jreq	00306$
      009DEB                        936 00634$:
                                    937 ;	./../../mib/stm8s_mib_debug_mem.c: 277: l = rd_ADDR32(addr);
      009DEB 1E 03            [ 2]  938 	ldw	x, (0x03, sp)
      009DED 90 93            [ 1]  939 	ldw	y, x
      009DEF 90 EE 02         [ 2]  940 	ldw	y, (0x2, y)
      009DF2 FE               [ 2]  941 	ldw	x, (x)
      009DF3 1F 1C            [ 2]  942 	ldw	(0x1c, sp), x
      009DF5 17 0A            [ 2]  943 	ldw	(0x0a, sp), y
      009DF7 1E 1C            [ 2]  944 	ldw	x, (0x1c, sp)
      009DF9 1F 08            [ 2]  945 	ldw	(0x08, sp), x
                                    946 ;	./../../mib/stm8s_mib_debug_mem.c: 278: if ((v_Loop & 0xfffff) == 0)
      009DFB 1E 28            [ 2]  947 	ldw	x, (0x28, sp)
      009DFD 1F 22            [ 2]  948 	ldw	(0x22, sp), x
      009DFF 7B 27            [ 1]  949 	ld	a, (0x27, sp)
      009E01 A4 0F            [ 1]  950 	and	a, #0x0f
      009E03 6B 21            [ 1]  951 	ld	(0x21, sp), a
      009E05 0F 20            [ 1]  952 	clr	(0x20, sp)
      009E07 1E 22            [ 2]  953 	ldw	x, (0x22, sp)
      009E09 26 12            [ 1]  954 	jrne	00234$
      009E0B 1E 20            [ 2]  955 	ldw	x, (0x20, sp)
      009E0D 26 0E            [ 1]  956 	jrne	00234$
                                    957 ;	./../../mib/stm8s_mib_debug_mem.c: 280: ccprintf(_DEBUG_CMD_A_,("0x%08lx ", l));
      009E0F 90 89            [ 2]  958 	pushw	y
      009E11 1E 1E            [ 2]  959 	ldw	x, (0x1e, sp)
      009E13 89               [ 2]  960 	pushw	x
      009E14 4B 96            [ 1]  961 	push	#<(__str_18+0)
      009E16 4B 83            [ 1]  962 	push	#((__str_18+0) >> 8)
      009E18 CD 91 73         [ 4]  963 	call	_mib_printf
      009E1B 5B 06            [ 2]  964 	addw	sp, #6
      009E1D                        965 00234$:
                                    966 ;	./../../mib/stm8s_mib_debug_mem.c: 275: for (; v_Loop; v_Loop--)
      009E1D 1E 28            [ 2]  967 	ldw	x, (0x28, sp)
      009E1F 1D 00 01         [ 2]  968 	subw	x, #0x0001
      009E22 1F 28            [ 2]  969 	ldw	(0x28, sp), x
      009E24 1E 26            [ 2]  970 	ldw	x, (0x26, sp)
      009E26 24 01            [ 1]  971 	jrnc	00637$
      009E28 5A               [ 2]  972 	decw	x
      009E29                        973 00637$:
      009E29 1F 26            [ 2]  974 	ldw	(0x26, sp), x
      009E2B 16 28            [ 2]  975 	ldw	y, (0x28, sp)
      009E2D 17 1A            [ 2]  976 	ldw	(0x1a, sp), y
      009E2F 16 26            [ 2]  977 	ldw	y, (0x26, sp)
      009E31 17 18            [ 2]  978 	ldw	(0x18, sp), y
      009E33 20 AE            [ 2]  979 	jra	00233$
                                    980 ;	./../../mib/stm8s_mib_debug_mem.c: 284: default:
      009E35                        981 00165$:
                                    982 ;	./../../mib/stm8s_mib_debug_mem.c: 285: ccprintf(_DEBUG_CMD_A_, ("Error.\r\n"));
      009E35 4B 5B            [ 1]  983 	push	#<(__str_11+0)
      009E37 4B 83            [ 1]  984 	push	#((__str_11+0) >> 8)
      009E39 CD 91 73         [ 4]  985 	call	_mib_printf
      009E3C 5B 02            [ 2]  986 	addw	sp, #2
                                    987 ;	./../../mib/stm8s_mib_debug_mem.c: 286: return FALSE;
      009E3E 5F               [ 1]  988 	clrw	x
      009E3F CC A0 8F         [ 2]  989 	jp	00235$
                                    990 ;	./../../mib/stm8s_mib_debug_mem.c: 287: }
      009E42                        991 00304$:
      009E42 16 28            [ 2]  992 	ldw	y, (0x28, sp)
      009E44 17 1A            [ 2]  993 	ldw	(0x1a, sp), y
      009E46 16 26            [ 2]  994 	ldw	y, (0x26, sp)
      009E48 17 18            [ 2]  995 	ldw	(0x18, sp), y
                                    996 ;	./../../mib/stm8s_mib_debug_mem.c: 351: return FALSE;
      009E4A 20 12            [ 2]  997 	jra	00166$
                                    998 ;	./../../mib/stm8s_mib_debug_mem.c: 287: }
      009E4C                        999 00305$:
      009E4C 16 28            [ 2] 1000 	ldw	y, (0x28, sp)
      009E4E 17 1A            [ 2] 1001 	ldw	(0x1a, sp), y
      009E50 16 26            [ 2] 1002 	ldw	y, (0x26, sp)
      009E52 17 18            [ 2] 1003 	ldw	(0x18, sp), y
                                   1004 ;	./../../mib/stm8s_mib_debug_mem.c: 351: return FALSE;
      009E54 20 08            [ 2] 1005 	jra	00166$
                                   1006 ;	./../../mib/stm8s_mib_debug_mem.c: 287: }
      009E56                       1007 00306$:
      009E56 16 28            [ 2] 1008 	ldw	y, (0x28, sp)
      009E58 17 1A            [ 2] 1009 	ldw	(0x1a, sp), y
      009E5A 16 26            [ 2] 1010 	ldw	y, (0x26, sp)
      009E5C 17 18            [ 2] 1011 	ldw	(0x18, sp), y
      009E5E                       1012 00166$:
                                   1013 ;	./../../mib/stm8s_mib_debug_mem.c: 288: ccprintf(_DEBUG_CMD_A_, (".\r\n"));
      009E5E 4B 64            [ 1] 1014 	push	#<(__str_12+0)
      009E60 4B 83            [ 1] 1015 	push	#((__str_12+0) >> 8)
      009E62 CD 91 73         [ 4] 1016 	call	_mib_printf
      009E65 5B 02            [ 2] 1017 	addw	sp, #2
      009E67 CC A0 8D         [ 2] 1018 	jp	00216$
      009E6A                       1019 00206$:
                                   1020 ;	./../../mib/stm8s_mib_debug_mem.c: 290: else if (!strcmp(argv[1], "hdump")) 	// _CMD_MY_HEXDUMP_
      009E6A 1E 26            [ 2] 1021 	ldw	x, (0x26, sp)
      009E6C FE               [ 2] 1022 	ldw	x, (x)
      009E6D 4B 9F            [ 1] 1023 	push	#<(___str_19+0)
      009E6F 4B 83            [ 1] 1024 	push	#((___str_19+0) >> 8)
      009E71 CD A2 65         [ 4] 1025 	call	_strcmp
      009E74 5D               [ 2] 1026 	tnzw	x
      009E75 26 5B            [ 1] 1027 	jrne	00203$
                                   1028 ;	./../../mib/stm8s_mib_debug_mem.c: 292: if (argc < 4)
      009E77 1E 2C            [ 2] 1029 	ldw	x, (0x2c, sp)
      009E79 A3 00 04         [ 2] 1030 	cpw	x, #0x0004
      009E7C 2E 0B            [ 1] 1031 	jrsge	00168$
                                   1032 ;	./../../mib/stm8s_mib_debug_mem.c: 294: MibWriteDebugString(cptr->usage);
      009E7E 1E 24            [ 2] 1033 	ldw	x, (0x24, sp)
      009E80 EE 04            [ 2] 1034 	ldw	x, (0x4, x)
      009E82 CD 87 62         [ 4] 1035 	call	_MibWriteDebugString
                                   1036 ;	./../../mib/stm8s_mib_debug_mem.c: 295: return FALSE;
      009E85 5F               [ 1] 1037 	clrw	x
      009E86 CC A0 8F         [ 2] 1038 	jp	00235$
      009E89                       1039 00168$:
                                   1040 ;	./../../mib/stm8s_mib_debug_mem.c: 297: if (!HexToInt(argv[2], &addr, 32) || !HexToInt(argv[3], &len, 32))
      009E89 16 2E            [ 2] 1041 	ldw	y, (0x2e, sp)
      009E8B 90 EE 04         [ 2] 1042 	ldw	y, (0x4, y)
      009E8E 4B 20            [ 1] 1043 	push	#0x20
      009E90 4B 00            [ 1] 1044 	push	#0x00
      009E92 96               [ 1] 1045 	ldw	x, sp
      009E93 1C 00 03         [ 2] 1046 	addw	x, #3
      009E96 89               [ 2] 1047 	pushw	x
      009E97 93               [ 1] 1048 	ldw	x, y
      009E98 CD 94 59         [ 4] 1049 	call	_HexToInt
      009E9B 5D               [ 2] 1050 	tnzw	x
      009E9C 27 15            [ 1] 1051 	jreq	00169$
      009E9E 16 2E            [ 2] 1052 	ldw	y, (0x2e, sp)
      009EA0 90 EE 06         [ 2] 1053 	ldw	y, (0x6, y)
      009EA3 4B 20            [ 1] 1054 	push	#0x20
      009EA5 4B 00            [ 1] 1055 	push	#0x00
      009EA7 96               [ 1] 1056 	ldw	x, sp
      009EA8 1C 00 16         [ 2] 1057 	addw	x, #22
      009EAB 89               [ 2] 1058 	pushw	x
      009EAC 93               [ 1] 1059 	ldw	x, y
      009EAD CD 94 59         [ 4] 1060 	call	_HexToInt
      009EB0 5D               [ 2] 1061 	tnzw	x
      009EB1 26 0D            [ 1] 1062 	jrne	00170$
      009EB3                       1063 00169$:
                                   1064 ;	./../../mib/stm8s_mib_debug_mem.c: 299: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009EB3 4B E3            [ 1] 1065 	push	#<(__str_3+0)
      009EB5 4B 82            [ 1] 1066 	push	#((__str_3+0) >> 8)
      009EB7 CD 91 73         [ 4] 1067 	call	_mib_printf
      009EBA 5B 02            [ 2] 1068 	addw	sp, #2
                                   1069 ;	./../../mib/stm8s_mib_debug_mem.c: 300: return FALSE;
      009EBC 5F               [ 1] 1070 	clrw	x
      009EBD CC A0 8F         [ 2] 1071 	jp	00235$
      009EC0                       1072 00170$:
                                   1073 ;	./../../mib/stm8s_mib_debug_mem.c: 302: HexDump(addr, len);		
      009EC0 1E 16            [ 2] 1074 	ldw	x, (0x16, sp)
      009EC2 89               [ 2] 1075 	pushw	x
      009EC3 1E 16            [ 2] 1076 	ldw	x, (0x16, sp)
      009EC5 89               [ 2] 1077 	pushw	x
      009EC6 1E 07            [ 2] 1078 	ldw	x, (0x07, sp)
      009EC8 89               [ 2] 1079 	pushw	x
      009EC9 1E 07            [ 2] 1080 	ldw	x, (0x07, sp)
      009ECB 89               [ 2] 1081 	pushw	x
      009ECC CD 95 D1         [ 4] 1082 	call	_HexDump
      009ECF CC A0 8D         [ 2] 1083 	jp	00216$
      009ED2                       1084 00203$:
                                   1085 ;	./../../mib/stm8s_mib_debug_mem.c: 304: else if (!strcmp(argv[1], "cpy")) // _CMD_MY_MEMCPY_
      009ED2 1E 26            [ 2] 1086 	ldw	x, (0x26, sp)
      009ED4 FE               [ 2] 1087 	ldw	x, (x)
      009ED5 4B A5            [ 1] 1088 	push	#<(___str_20+0)
      009ED7 4B 83            [ 1] 1089 	push	#((___str_20+0) >> 8)
      009ED9 CD A2 65         [ 4] 1090 	call	_strcmp
      009EDC 5D               [ 2] 1091 	tnzw	x
      009EDD 26 71            [ 1] 1092 	jrne	00200$
                                   1093 ;	./../../mib/stm8s_mib_debug_mem.c: 306: if (argc < 5)
      009EDF 1E 2C            [ 2] 1094 	ldw	x, (0x2c, sp)
      009EE1 A3 00 05         [ 2] 1095 	cpw	x, #0x0005
      009EE4 2E 0B            [ 1] 1096 	jrsge	00173$
                                   1097 ;	./../../mib/stm8s_mib_debug_mem.c: 308: MibWriteDebugString(cptr->usage);
      009EE6 1E 24            [ 2] 1098 	ldw	x, (0x24, sp)
      009EE8 EE 04            [ 2] 1099 	ldw	x, (0x4, x)
      009EEA CD 87 62         [ 4] 1100 	call	_MibWriteDebugString
                                   1101 ;	./../../mib/stm8s_mib_debug_mem.c: 309: return FALSE;
      009EED 5F               [ 1] 1102 	clrw	x
      009EEE CC A0 8F         [ 2] 1103 	jp	00235$
      009EF1                       1104 00173$:
                                   1105 ;	./../../mib/stm8s_mib_debug_mem.c: 311: if (!HexToInt(argv[2], &dest, 32) || !HexToInt(argv[3], &src, 32) || !HexToInt(argv[4], &len, 32))
      009EF1 16 2E            [ 2] 1106 	ldw	y, (0x2e, sp)
      009EF3 90 EE 04         [ 2] 1107 	ldw	y, (0x4, y)
      009EF6 4B 20            [ 1] 1108 	push	#0x20
      009EF8 4B 00            [ 1] 1109 	push	#0x00
      009EFA 96               [ 1] 1110 	ldw	x, sp
      009EFB 1C 00 0E         [ 2] 1111 	addw	x, #14
      009EFE 89               [ 2] 1112 	pushw	x
      009EFF 93               [ 1] 1113 	ldw	x, y
      009F00 CD 94 59         [ 4] 1114 	call	_HexToInt
      009F03 5D               [ 2] 1115 	tnzw	x
      009F04 27 2A            [ 1] 1116 	jreq	00174$
      009F06 16 2E            [ 2] 1117 	ldw	y, (0x2e, sp)
      009F08 90 EE 06         [ 2] 1118 	ldw	y, (0x6, y)
      009F0B 4B 20            [ 1] 1119 	push	#0x20
      009F0D 4B 00            [ 1] 1120 	push	#0x00
      009F0F 96               [ 1] 1121 	ldw	x, sp
      009F10 1C 00 12         [ 2] 1122 	addw	x, #18
      009F13 89               [ 2] 1123 	pushw	x
      009F14 93               [ 1] 1124 	ldw	x, y
      009F15 CD 94 59         [ 4] 1125 	call	_HexToInt
      009F18 5D               [ 2] 1126 	tnzw	x
      009F19 27 15            [ 1] 1127 	jreq	00174$
      009F1B 16 2E            [ 2] 1128 	ldw	y, (0x2e, sp)
      009F1D 90 EE 08         [ 2] 1129 	ldw	y, (0x8, y)
      009F20 4B 20            [ 1] 1130 	push	#0x20
      009F22 4B 00            [ 1] 1131 	push	#0x00
      009F24 96               [ 1] 1132 	ldw	x, sp
      009F25 1C 00 16         [ 2] 1133 	addw	x, #22
      009F28 89               [ 2] 1134 	pushw	x
      009F29 93               [ 1] 1135 	ldw	x, y
      009F2A CD 94 59         [ 4] 1136 	call	_HexToInt
      009F2D 5D               [ 2] 1137 	tnzw	x
      009F2E 26 0D            [ 1] 1138 	jrne	00175$
      009F30                       1139 00174$:
                                   1140 ;	./../../mib/stm8s_mib_debug_mem.c: 313: ccprintf(_DEBUG_CMD_A_, ("Illegal character is used.\r\n"));
      009F30 4B A9            [ 1] 1141 	push	#<(__str_21+0)
      009F32 4B 83            [ 1] 1142 	push	#((__str_21+0) >> 8)
      009F34 CD 91 73         [ 4] 1143 	call	_mib_printf
      009F37 5B 02            [ 2] 1144 	addw	sp, #2
                                   1145 ;	./../../mib/stm8s_mib_debug_mem.c: 314: return FALSE;
      009F39 5F               [ 1] 1146 	clrw	x
      009F3A CC A0 8F         [ 2] 1147 	jp	00235$
      009F3D                       1148 00175$:
                                   1149 ;	./../../mib/stm8s_mib_debug_mem.c: 316: memcpy((char *)dest, (char *)src, len);		
      009F3D 1E 16            [ 2] 1150 	ldw	x, (0x16, sp)
      009F3F 16 12            [ 2] 1151 	ldw	y, (0x12, sp)
      009F41 17 28            [ 2] 1152 	ldw	(0x28, sp), y
      009F43 16 0E            [ 2] 1153 	ldw	y, (0x0e, sp)
      009F45 89               [ 2] 1154 	pushw	x
      009F46 1E 2A            [ 2] 1155 	ldw	x, (0x2a, sp)
      009F48 89               [ 2] 1156 	pushw	x
      009F49 93               [ 1] 1157 	ldw	x, y
      009F4A CD A1 E1         [ 4] 1158 	call	___memcpy
      009F4D CC A0 8D         [ 2] 1159 	jp	00216$
      009F50                       1160 00200$:
                                   1161 ;	./../../mib/stm8s_mib_debug_mem.c: 318: else if (!strcmp(argv[1], "cmp")) // _CMD_MY_MEMCMP_
      009F50 1E 26            [ 2] 1162 	ldw	x, (0x26, sp)
      009F52 FE               [ 2] 1163 	ldw	x, (x)
      009F53 4B C6            [ 1] 1164 	push	#<(___str_22+0)
      009F55 4B 83            [ 1] 1165 	push	#((___str_22+0) >> 8)
      009F57 CD A2 65         [ 4] 1166 	call	_strcmp
      009F5A 5D               [ 2] 1167 	tnzw	x
      009F5B 27 03            [ 1] 1168 	jreq	00647$
      009F5D CC 9F E9         [ 2] 1169 	jp	00197$
      009F60                       1170 00647$:
                                   1171 ;	./../../mib/stm8s_mib_debug_mem.c: 320: if (argc < 5)
      009F60 1E 2C            [ 2] 1172 	ldw	x, (0x2c, sp)
      009F62 A3 00 05         [ 2] 1173 	cpw	x, #0x0005
      009F65 2E 0B            [ 1] 1174 	jrsge	00179$
                                   1175 ;	./../../mib/stm8s_mib_debug_mem.c: 322: MibWriteDebugString(cptr->usage);
      009F67 1E 24            [ 2] 1176 	ldw	x, (0x24, sp)
      009F69 EE 04            [ 2] 1177 	ldw	x, (0x4, x)
      009F6B CD 87 62         [ 4] 1178 	call	_MibWriteDebugString
                                   1179 ;	./../../mib/stm8s_mib_debug_mem.c: 323: return FALSE;
      009F6E 5F               [ 1] 1180 	clrw	x
      009F6F CC A0 8F         [ 2] 1181 	jp	00235$
      009F72                       1182 00179$:
                                   1183 ;	./../../mib/stm8s_mib_debug_mem.c: 325: if (!HexToInt(argv[2], &dest, 32) || !HexToInt(argv[3], &src, 32) || !HexToInt(argv[4], &len, 32))
      009F72 16 2E            [ 2] 1184 	ldw	y, (0x2e, sp)
      009F74 90 EE 04         [ 2] 1185 	ldw	y, (0x4, y)
      009F77 4B 20            [ 1] 1186 	push	#0x20
      009F79 4B 00            [ 1] 1187 	push	#0x00
      009F7B 96               [ 1] 1188 	ldw	x, sp
      009F7C 1C 00 0E         [ 2] 1189 	addw	x, #14
      009F7F 89               [ 2] 1190 	pushw	x
      009F80 93               [ 1] 1191 	ldw	x, y
      009F81 CD 94 59         [ 4] 1192 	call	_HexToInt
      009F84 5D               [ 2] 1193 	tnzw	x
      009F85 27 2A            [ 1] 1194 	jreq	00180$
      009F87 16 2E            [ 2] 1195 	ldw	y, (0x2e, sp)
      009F89 90 EE 06         [ 2] 1196 	ldw	y, (0x6, y)
      009F8C 4B 20            [ 1] 1197 	push	#0x20
      009F8E 4B 00            [ 1] 1198 	push	#0x00
      009F90 96               [ 1] 1199 	ldw	x, sp
      009F91 1C 00 12         [ 2] 1200 	addw	x, #18
      009F94 89               [ 2] 1201 	pushw	x
      009F95 93               [ 1] 1202 	ldw	x, y
      009F96 CD 94 59         [ 4] 1203 	call	_HexToInt
      009F99 5D               [ 2] 1204 	tnzw	x
      009F9A 27 15            [ 1] 1205 	jreq	00180$
      009F9C 16 2E            [ 2] 1206 	ldw	y, (0x2e, sp)
      009F9E 90 EE 08         [ 2] 1207 	ldw	y, (0x8, y)
      009FA1 4B 20            [ 1] 1208 	push	#0x20
      009FA3 4B 00            [ 1] 1209 	push	#0x00
      009FA5 96               [ 1] 1210 	ldw	x, sp
      009FA6 1C 00 16         [ 2] 1211 	addw	x, #22
      009FA9 89               [ 2] 1212 	pushw	x
      009FAA 93               [ 1] 1213 	ldw	x, y
      009FAB CD 94 59         [ 4] 1214 	call	_HexToInt
      009FAE 5D               [ 2] 1215 	tnzw	x
      009FAF 26 0D            [ 1] 1216 	jrne	00181$
      009FB1                       1217 00180$:
                                   1218 ;	./../../mib/stm8s_mib_debug_mem.c: 327: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009FB1 4B E3            [ 1] 1219 	push	#<(__str_3+0)
      009FB3 4B 82            [ 1] 1220 	push	#((__str_3+0) >> 8)
      009FB5 CD 91 73         [ 4] 1221 	call	_mib_printf
      009FB8 5B 02            [ 2] 1222 	addw	sp, #2
                                   1223 ;	./../../mib/stm8s_mib_debug_mem.c: 328: return FALSE;
      009FBA 5F               [ 1] 1224 	clrw	x
      009FBB CC A0 8F         [ 2] 1225 	jp	00235$
      009FBE                       1226 00181$:
                                   1227 ;	./../../mib/stm8s_mib_debug_mem.c: 331: if (memcmp((char *)dest, (char *)src, (len)) == 0) ccprintf(_DEBUG_CMD_A_, ("equil.\r\n"));
      009FBE 1E 16            [ 2] 1228 	ldw	x, (0x16, sp)
      009FC0 16 12            [ 2] 1229 	ldw	y, (0x12, sp)
      009FC2 17 28            [ 2] 1230 	ldw	(0x28, sp), y
      009FC4 16 0E            [ 2] 1231 	ldw	y, (0x0e, sp)
      009FC6 89               [ 2] 1232 	pushw	x
      009FC7 1E 2A            [ 2] 1233 	ldw	x, (0x2a, sp)
      009FC9 89               [ 2] 1234 	pushw	x
      009FCA 93               [ 1] 1235 	ldw	x, y
      009FCB CD A0 95         [ 4] 1236 	call	_memcmp
      009FCE 5D               [ 2] 1237 	tnzw	x
      009FCF 26 0C            [ 1] 1238 	jrne	00185$
      009FD1 4B CA            [ 1] 1239 	push	#<(__str_23+0)
      009FD3 4B 83            [ 1] 1240 	push	#((__str_23+0) >> 8)
      009FD5 CD 91 73         [ 4] 1241 	call	_mib_printf
      009FD8 5B 02            [ 2] 1242 	addw	sp, #2
      009FDA CC A0 8D         [ 2] 1243 	jp	00216$
      009FDD                       1244 00185$:
                                   1245 ;	./../../mib/stm8s_mib_debug_mem.c: 332: else ccprintf(_DEBUG_CMD_A_, ("not equil.\r\n"));		
      009FDD 4B D3            [ 1] 1246 	push	#<(__str_24+0)
      009FDF 4B 83            [ 1] 1247 	push	#((__str_24+0) >> 8)
      009FE1 CD 91 73         [ 4] 1248 	call	_mib_printf
      009FE4 5B 02            [ 2] 1249 	addw	sp, #2
      009FE6 CC A0 8D         [ 2] 1250 	jp	00216$
      009FE9                       1251 00197$:
                                   1252 ;	./../../mib/stm8s_mib_debug_mem.c: 334: else if (!strcmp(argv[1], "set")) // _CMD_MY_MEMSET_
      009FE9 1E 26            [ 2] 1253 	ldw	x, (0x26, sp)
      009FEB FE               [ 2] 1254 	ldw	x, (x)
      009FEC 4B E0            [ 1] 1255 	push	#<(___str_25+0)
      009FEE 4B 83            [ 1] 1256 	push	#((___str_25+0) >> 8)
      009FF0 CD A2 65         [ 4] 1257 	call	_strcmp
      009FF3 5D               [ 2] 1258 	tnzw	x
      009FF4 26 71            [ 1] 1259 	jrne	00194$
                                   1260 ;	./../../mib/stm8s_mib_debug_mem.c: 336: if (argc < 5)
      009FF6 1E 2C            [ 2] 1261 	ldw	x, (0x2c, sp)
      009FF8 A3 00 05         [ 2] 1262 	cpw	x, #0x0005
      009FFB 2E 0B            [ 1] 1263 	jrsge	00188$
                                   1264 ;	./../../mib/stm8s_mib_debug_mem.c: 338: MibWriteDebugString(cptr->usage);
      009FFD 1E 24            [ 2] 1265 	ldw	x, (0x24, sp)
      009FFF EE 04            [ 2] 1266 	ldw	x, (0x4, x)
      00A001 CD 87 62         [ 4] 1267 	call	_MibWriteDebugString
                                   1268 ;	./../../mib/stm8s_mib_debug_mem.c: 339: return FALSE;
      00A004 5F               [ 1] 1269 	clrw	x
      00A005 CC A0 8F         [ 2] 1270 	jp	00235$
      00A008                       1271 00188$:
                                   1272 ;	./../../mib/stm8s_mib_debug_mem.c: 341: if (!HexToInt(argv[2], &addr, 32) || !HexToInt(argv[3], &c, 8) || !HexToInt(argv[4], &len, 32))
      00A008 16 2E            [ 2] 1273 	ldw	y, (0x2e, sp)
      00A00A 90 EE 04         [ 2] 1274 	ldw	y, (0x4, y)
      00A00D 4B 20            [ 1] 1275 	push	#0x20
      00A00F 4B 00            [ 1] 1276 	push	#0x00
      00A011 96               [ 1] 1277 	ldw	x, sp
      00A012 1C 00 03         [ 2] 1278 	addw	x, #3
      00A015 89               [ 2] 1279 	pushw	x
      00A016 93               [ 1] 1280 	ldw	x, y
      00A017 CD 94 59         [ 4] 1281 	call	_HexToInt
      00A01A 5D               [ 2] 1282 	tnzw	x
      00A01B 27 2A            [ 1] 1283 	jreq	00189$
      00A01D 16 2E            [ 2] 1284 	ldw	y, (0x2e, sp)
      00A01F 90 EE 06         [ 2] 1285 	ldw	y, (0x6, y)
      00A022 4B 08            [ 1] 1286 	push	#0x08
      00A024 4B 00            [ 1] 1287 	push	#0x00
      00A026 96               [ 1] 1288 	ldw	x, sp
      00A027 1C 00 07         [ 2] 1289 	addw	x, #7
      00A02A 89               [ 2] 1290 	pushw	x
      00A02B 93               [ 1] 1291 	ldw	x, y
      00A02C CD 94 59         [ 4] 1292 	call	_HexToInt
      00A02F 5D               [ 2] 1293 	tnzw	x
      00A030 27 15            [ 1] 1294 	jreq	00189$
      00A032 16 2E            [ 2] 1295 	ldw	y, (0x2e, sp)
      00A034 90 EE 08         [ 2] 1296 	ldw	y, (0x8, y)
      00A037 4B 20            [ 1] 1297 	push	#0x20
      00A039 4B 00            [ 1] 1298 	push	#0x00
      00A03B 96               [ 1] 1299 	ldw	x, sp
      00A03C 1C 00 16         [ 2] 1300 	addw	x, #22
      00A03F 89               [ 2] 1301 	pushw	x
      00A040 93               [ 1] 1302 	ldw	x, y
      00A041 CD 94 59         [ 4] 1303 	call	_HexToInt
      00A044 5D               [ 2] 1304 	tnzw	x
      00A045 26 0C            [ 1] 1305 	jrne	00190$
      00A047                       1306 00189$:
                                   1307 ;	./../../mib/stm8s_mib_debug_mem.c: 343: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A047 4B E3            [ 1] 1308 	push	#<(__str_3+0)
      00A049 4B 82            [ 1] 1309 	push	#((__str_3+0) >> 8)
      00A04B CD 91 73         [ 4] 1310 	call	_mib_printf
      00A04E 5B 02            [ 2] 1311 	addw	sp, #2
                                   1312 ;	./../../mib/stm8s_mib_debug_mem.c: 344: return FALSE;
      00A050 5F               [ 1] 1313 	clrw	x
      00A051 20 3C            [ 2] 1314 	jra	00235$
      00A053                       1315 00190$:
                                   1316 ;	./../../mib/stm8s_mib_debug_mem.c: 346: memset((void *)addr, c, len);
      00A053 1E 16            [ 2] 1317 	ldw	x, (0x16, sp)
      00A055 7B 05            [ 1] 1318 	ld	a, (0x05, sp)
      00A057 6B 29            [ 1] 1319 	ld	(0x29, sp), a
      00A059 0F 28            [ 1] 1320 	clr	(0x28, sp)
      00A05B 16 03            [ 2] 1321 	ldw	y, (0x03, sp)
      00A05D 89               [ 2] 1322 	pushw	x
      00A05E 1E 2A            [ 2] 1323 	ldw	x, (0x2a, sp)
      00A060 89               [ 2] 1324 	pushw	x
      00A061 93               [ 1] 1325 	ldw	x, y
      00A062 CD A2 34         [ 4] 1326 	call	_memset
      00A065 20 26            [ 2] 1327 	jra	00216$
      00A067                       1328 00194$:
                                   1329 ;	./../../mib/stm8s_mib_debug_mem.c: 350: MibWriteDebugString(cptr->usage);
      00A067 1E 24            [ 2] 1330 	ldw	x, (0x24, sp)
      00A069 EE 04            [ 2] 1331 	ldw	x, (0x4, x)
      00A06B CD 87 62         [ 4] 1332 	call	_MibWriteDebugString
                                   1333 ;	./../../mib/stm8s_mib_debug_mem.c: 351: return FALSE;
      00A06E 5F               [ 1] 1334 	clrw	x
      00A06F 20 1E            [ 2] 1335 	jra	00235$
      00A071                       1336 00301$:
      00A071 16 28            [ 2] 1337 	ldw	y, (0x28, sp)
      00A073 17 1A            [ 2] 1338 	ldw	(0x1a, sp), y
      00A075 16 26            [ 2] 1339 	ldw	y, (0x26, sp)
      00A077 17 18            [ 2] 1340 	ldw	(0x18, sp), y
      00A079 20 12            [ 2] 1341 	jra	00216$
      00A07B                       1342 00302$:
      00A07B 16 28            [ 2] 1343 	ldw	y, (0x28, sp)
      00A07D 17 1A            [ 2] 1344 	ldw	(0x1a, sp), y
      00A07F 16 26            [ 2] 1345 	ldw	y, (0x26, sp)
      00A081 17 18            [ 2] 1346 	ldw	(0x18, sp), y
      00A083 20 08            [ 2] 1347 	jra	00216$
      00A085                       1348 00303$:
      00A085 16 28            [ 2] 1349 	ldw	y, (0x28, sp)
      00A087 17 1A            [ 2] 1350 	ldw	(0x1a, sp), y
      00A089 16 26            [ 2] 1351 	ldw	y, (0x26, sp)
      00A08B 17 18            [ 2] 1352 	ldw	(0x18, sp), y
      00A08D                       1353 00216$:
                                   1354 ;	./../../mib/stm8s_mib_debug_mem.c: 353: return TRUE;
      00A08D 5F               [ 1] 1355 	clrw	x
      00A08E 5C               [ 1] 1356 	incw	x
      00A08F                       1357 00235$:
                                   1358 ;	./../../mib/stm8s_mib_debug_mem.c: 354: }
      00A08F 16 2A            [ 2] 1359 	ldw	y, (42, sp)
      00A091 5B 2F            [ 2] 1360 	addw	sp, #47
      00A093 90 FC            [ 2] 1361 	jp	(y)
                                   1362 	.area CODE
                                   1363 	.area CONST
                                   1364 	.area CONST
      0082B7                       1365 __str_0:
      0082B7 49 4E 46 4F 3A 2B 63  1366 	.ascii "INFO:+cmd_mem..."
             6D 64 5F 6D 65 6D 2E
             2E 2E
      0082C7 0D                    1367 	.db 0x0d
      0082C8 0A                    1368 	.db 0x0a
      0082C9 00                    1369 	.db 0x00
                                   1370 	.area CODE
                                   1371 	.area CONST
      0082CA                       1372 __str_1:
      0082CA 49 4E 46 4F 3A 2D 63  1373 	.ascii "INFO:-cmd_mem..."
             6D 64 5F 6D 65 6D 2E
             2E 2E
      0082DA 0D                    1374 	.db 0x0d
      0082DB 0A                    1375 	.db 0x0a
      0082DC 00                    1376 	.db 0x00
                                   1377 	.area CODE
                                   1378 	.area CONST
      0082DD                       1379 ___str_2:
      0082DD 77 72 69 74 65        1380 	.ascii "write"
      0082E2 00                    1381 	.db 0x00
                                   1382 	.area CODE
                                   1383 	.area CONST
      0082E3                       1384 __str_3:
      0082E3 49 6C 6C 75 67 61 6C  1385 	.ascii "Illugal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      0082FD 0D                    1386 	.db 0x0d
      0082FE 0A                    1387 	.db 0x0a
      0082FF 00                    1388 	.db 0x00
                                   1389 	.area CODE
                                   1390 	.area CONST
      008300                       1391 __str_4:
      008300 49 6C 6C 75 67 61 6C  1392 	.ascii "Illugal character is useqd."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 71 64 2E
      00831B 0D                    1393 	.db 0x0d
      00831C 0A                    1394 	.db 0x0a
      00831D 00                    1395 	.db 0x00
                                   1396 	.area CODE
                                   1397 	.area CONST
      00831E                       1398 ___str_5:
      00831E 72 65 61 64           1399 	.ascii "read"
      008322 00                    1400 	.db 0x00
                                   1401 	.area CODE
                                   1402 	.area CONST
      008323                       1403 __str_6:
      008323 09                    1404 	.db 0x09
      008324 61 64 64 72 65 73 73  1405 	.ascii "address : 0x%08lx  "
             20 3A 20 30 78 25 30
             38 6C 78 20 20
      008337 00                    1406 	.db 0x00
                                   1407 	.area CODE
                                   1408 	.area CONST
      008338                       1409 __str_7:
      008338 09                    1410 	.db 0x09
      008339 76 61 6C 75 65 20 20  1411 	.ascii "value   : "
             20 3A 20
      008343 00                    1412 	.db 0x00
                                   1413 	.area CODE
                                   1414 	.area CONST
      008344                       1415 __str_8:
      008344 30 78 25 30 32 78 20  1416 	.ascii "0x%02x "
      00834B 00                    1417 	.db 0x00
                                   1418 	.area CODE
                                   1419 	.area CONST
      00834C                       1420 __str_9:
      00834C 30 78 25 30 34 78     1421 	.ascii "0x%04x"
      008352 00                    1422 	.db 0x00
                                   1423 	.area CODE
                                   1424 	.area CONST
      008353                       1425 __str_10:
      008353 30 78 25 30 38 6C 78  1426 	.ascii "0x%08lx"
      00835A 00                    1427 	.db 0x00
                                   1428 	.area CODE
                                   1429 	.area CONST
      00835B                       1430 __str_11:
      00835B 45 72 72 6F 72 2E     1431 	.ascii "Error."
      008361 0D                    1432 	.db 0x0d
      008362 0A                    1433 	.db 0x0a
      008363 00                    1434 	.db 0x00
                                   1435 	.area CODE
                                   1436 	.area CONST
      008364                       1437 __str_12:
      008364 2E                    1438 	.ascii "."
      008365 0D                    1439 	.db 0x0d
      008366 0A                    1440 	.db 0x0a
      008367 00                    1441 	.db 0x00
                                   1442 	.area CODE
                                   1443 	.area CONST
      008368                       1444 ___str_13:
      008368 77 72 6E              1445 	.ascii "wrn"
      00836B 00                    1446 	.db 0x00
                                   1447 	.area CODE
                                   1448 	.area CONST
      00836C                       1449 ___str_14:
      00836C 72 64 6E              1450 	.ascii "rdn"
      00836F 00                    1451 	.db 0x00
                                   1452 	.area CODE
                                   1453 	.area CONST
      008370                       1454 __str_15:
      008370 6C 6F 6F 70 20 3A 20  1455 	.ascii "loop : 0x%08lx  "
             30 78 25 30 38 6C 78
             20 20
      008380 0D                    1456 	.db 0x0d
      008381 0A                    1457 	.db 0x0a
      008382 00                    1458 	.db 0x00
                                   1459 	.area CODE
                                   1460 	.area CONST
      008383                       1461 __str_16:
      008383 76 61 6C 75 65 20 20  1462 	.ascii "value   : "
             20 3A 20
      00838D 00                    1463 	.db 0x00
                                   1464 	.area CODE
                                   1465 	.area CONST
      00838E                       1466 __str_17:
      00838E 30 78 25 30 34 78 20  1467 	.ascii "0x%04x "
      008395 00                    1468 	.db 0x00
                                   1469 	.area CODE
                                   1470 	.area CONST
      008396                       1471 __str_18:
      008396 30 78 25 30 38 6C 78  1472 	.ascii "0x%08lx "
             20
      00839E 00                    1473 	.db 0x00
                                   1474 	.area CODE
                                   1475 	.area CONST
      00839F                       1476 ___str_19:
      00839F 68 64 75 6D 70        1477 	.ascii "hdump"
      0083A4 00                    1478 	.db 0x00
                                   1479 	.area CODE
                                   1480 	.area CONST
      0083A5                       1481 ___str_20:
      0083A5 63 70 79              1482 	.ascii "cpy"
      0083A8 00                    1483 	.db 0x00
                                   1484 	.area CODE
                                   1485 	.area CONST
      0083A9                       1486 __str_21:
      0083A9 49 6C 6C 65 67 61 6C  1487 	.ascii "Illegal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      0083C3 0D                    1488 	.db 0x0d
      0083C4 0A                    1489 	.db 0x0a
      0083C5 00                    1490 	.db 0x00
                                   1491 	.area CODE
                                   1492 	.area CONST
      0083C6                       1493 ___str_22:
      0083C6 63 6D 70              1494 	.ascii "cmp"
      0083C9 00                    1495 	.db 0x00
                                   1496 	.area CODE
                                   1497 	.area CONST
      0083CA                       1498 __str_23:
      0083CA 65 71 75 69 6C 2E     1499 	.ascii "equil."
      0083D0 0D                    1500 	.db 0x0d
      0083D1 0A                    1501 	.db 0x0a
      0083D2 00                    1502 	.db 0x00
                                   1503 	.area CODE
                                   1504 	.area CONST
      0083D3                       1505 __str_24:
      0083D3 6E 6F 74 20 65 71 75  1506 	.ascii "not equil."
             69 6C 2E
      0083DD 0D                    1507 	.db 0x0d
      0083DE 0A                    1508 	.db 0x0a
      0083DF 00                    1509 	.db 0x00
                                   1510 	.area CODE
                                   1511 	.area CONST
      0083E0                       1512 ___str_25:
      0083E0 73 65 74              1513 	.ascii "set"
      0083E3 00                    1514 	.db 0x00
                                   1515 	.area CODE
                                   1516 	.area CONST
      0083E4                       1517 ___str_26:
      0083E4 6D 65 6D              1518 	.ascii "mem"
      0083E7 00                    1519 	.db 0x00
                                   1520 	.area CODE
                                   1521 	.area CONST
      0083E8                       1522 ___str_27:
      0083E8 20 20 6D 65 6D 20 7B  1523 	.ascii "  mem {cpy}   [dest] [src]   [len] Copy to SDRAM from Flash "
             63 70 79 7D 20 20 20
             5B 64 65 73 74 5D 20
             5B 73 72 63 5D 20 20
             20 5B 6C 65 6E 5D 20
             43 6F 70 79 20 74 6F
             20 53 44 52 41 4D 20
             66 72 6F 6D 20 46 6C
             61 73 68 20
      008424 6F 72 20 53 44 52 41  1524 	.ascii "or SDRAM."
             4D 2E
      00842D 0D                    1525 	.db 0x0d
      00842E 0A                    1526 	.db 0x0a
      00842F 20 20 6D 65 6D 20 7B  1527 	.ascii "  mem {cmp}   [add1] [add2]  [len] Compare data in addr1 and"
             63 6D 70 7D 20 20 20
             5B 61 64 64 31 5D 20
             5B 61 64 64 32 5D 20
             20 5B 6C 65 6E 5D 20
             43 6F 6D 70 61 72 65
             20 64 61 74 61 20 69
             6E 20 61 64 64 72 31
             20 61 6E 64
      00846B 20 61 64 64 72 32 2E  1528 	.ascii " addr2."
      008472 0D                    1529 	.db 0x0d
      008473 0A                    1530 	.db 0x0a
      008474 20 20 6D 65 6D 20 7B  1531 	.ascii "  mem {set}   [addr] [value] [len] Fill Memory with value."
             73 65 74 7D 20 20 20
             5B 61 64 64 72 5D 20
             5B 76 61 6C 75 65 5D
             20 5B 6C 65 6E 5D 20
             46 69 6C 6C 20 4D 65
             6D 6F 72 79 20 77 69
             74 68 20 76 61 6C 75
             65 2E
      0084AE 0D                    1532 	.db 0x0d
      0084AF 0A                    1533 	.db 0x0a
      0084B0 20 20 6D 65 6D 20 7B  1534 	.ascii "  mem {hdump} [addr] [len]         Dump Memory."
             68 64 75 6D 70 7D 20
             5B 61 64 64 72 5D 20
             5B 6C 65 6E 5D 20 20
             20 20 20 20 20 20 20
             44 75 6D 70 20 4D 65
             6D 6F 72 79 2E
      0084DF 0D                    1535 	.db 0x0d
      0084E0 0A                    1536 	.db 0x0a
      0084E1 20 20 6D 65 6D 20 7B  1537 	.ascii "  mem {wrn} {c/s/l} [addr] [value] [loop]  Wrn in addr. c:8 "
             77 72 6E 7D 20 7B 63
             2F 73 2F 6C 7D 20 5B
             61 64 64 72 5D 20 5B
             76 61 6C 75 65 5D 20
             5B 6C 6F 6F 70 5D 20
             20 57 72 6E 20 69 6E
             20 61 64 64 72 2E 20
             63 3A 38 20
      00851D 73 3A 31 36 20 6C 3A  1538 	.ascii "s:16 l:32 bits."
             33 32 20 62 69 74 73
             2E
      00852C 0D                    1539 	.db 0x0d
      00852D 0A                    1540 	.db 0x0a
      00852E 20 20 6D 65 6D 20 7B  1541 	.ascii "  mem {rdn}  {c/s/l} [addr] [loop]   Rdn in addr. c:8 s:16 l"
             72 64 6E 7D 20 20 7B
             63 2F 73 2F 6C 7D 20
             5B 61 64 64 72 5D 20
             5B 6C 6F 6F 70 5D 20
             20 20 52 64 6E 20 69
             6E 20 61 64 64 72 2E
             20 63 3A 38 20 73 3A
             31 36 20 6C
      00856A 3A 33 32 20 62 69 74  1542 	.ascii ":32 bits."
             73 2E
      008573 0D                    1543 	.db 0x0d
      008574 0A                    1544 	.db 0x0a
      008575 20 20 6D 65 6D 20 7B  1545 	.ascii "  mem {write} {c/s/l} [addr] [value]  Write in addr. c:8 s:1"
             77 72 69 74 65 7D 20
             7B 63 2F 73 2F 6C 7D
             20 5B 61 64 64 72 5D
             20 5B 76 61 6C 75 65
             5D 20 20 57 72 69 74
             65 20 69 6E 20 61 64
             64 72 2E 20 63 3A 38
             20 73 3A 31
      0085B1 36 20 6C 3A 33 32 20  1546 	.ascii "6 l:32 bits."
             62 69 74 73 2E
      0085BD 0D                    1547 	.db 0x0d
      0085BE 0A                    1548 	.db 0x0a
      0085BF 20 20 6D 65 6D 20 7B  1549 	.ascii "  mem {read}  {c/s/l} [addr]          Read in addr. c:8 s:16"
             72 65 61 64 7D 20 20
             7B 63 2F 73 2F 6C 7D
             20 5B 61 64 64 72 5D
             20 20 20 20 20 20 20
             20 20 20 52 65 61 64
             20 69 6E 20 61 64 64
             72 2E 20 63 3A 38 20
             73 3A 31 36
      0085FB 20 6C 3A 33 32 20 62  1550 	.ascii " l:32 bits."
             69 74 73 2E
      008606 0D                    1551 	.db 0x0d
      008607 0A                    1552 	.db 0x0a
      008608 00                    1553 	.db 0x00
                                   1554 	.area CODE
                                   1555 	.area INITIALIZER
      008633                       1556 __xinit__cmdTbl_only:
      008633 83 E4                 1557 	.dw ___str_26
      008635 99 1A                 1558 	.dw _DoMem
      008637 83 E8                 1559 	.dw ___str_27
      008639 00 00                 1560 	.dw #0x0000
      00863B 00 00                 1561 	.dw #0x0000
      00863D 00 00                 1562 	.dw #0x0000
                                   1563 	.area CABS (ABS)
