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
      00A71E                         63 _cmd_mem:
      00A71E 52 0A            [ 2]   64 	sub	sp, #10
                                     65 ;	./../../mib/stm8s_mib_debug_mem.c: 60: for (cptr = cmdTbl;; cptr++) 
      00A720 AE 01 5E         [ 2]   66 	ldw	x, #(_cmdTbl+0)
      00A723 1F 01            [ 2]   67 	ldw	(0x01, sp), x
      00A725 5F               [ 1]   68 	clrw	x
      00A726 1F 07            [ 2]   69 	ldw	(0x07, sp), x
      00A728 1F 05            [ 2]   70 	ldw	(0x05, sp), x
      00A72A 16 01            [ 2]   71 	ldw	y, (0x01, sp)
      00A72C 17 09            [ 2]   72 	ldw	(0x09, sp), y
      00A72E                         73 00106$:
                                     74 ;	./../../mib/stm8s_mib_debug_mem.c: 62: if(cptr->cmd==0)
      00A72E 1E 09            [ 2]   75 	ldw	x, (0x09, sp)
      00A730 FE               [ 2]   76 	ldw	x, (x)
      00A731 1F 03            [ 2]   77 	ldw	(0x03, sp), x
      00A733 26 19            [ 1]   78 	jrne	00102$
                                     79 ;	./../../mib/stm8s_mib_debug_mem.c: 64: ccprintf(1,("INFO:+cmd_mem...\r\n"));
      00A735 4B 5C            [ 1]   80 	push	#<(__str_0+0)
      00A737 4B 86            [ 1]   81 	push	#((__str_0+0) >> 8)
      00A739 CD 9F BD         [ 4]   82 	call	_mib_printf
      00A73C 5B 02            [ 2]   83 	addw	sp, #2
                                     84 ;	./../../mib/stm8s_mib_debug_mem.c: 65: memcpy((void *)&(cptr->cmd),(void *)&(cmdTbl_only[0].cmd),sizeof(CMD_MY));
      00A73E AE 01 82         [ 2]   85 	ldw	x, #_cmdTbl_only+0
      00A741 16 01            [ 2]   86 	ldw	y, (0x01, sp)
      00A743 4B 06            [ 1]   87 	push	#0x06
      00A745 4B 00            [ 1]   88 	push	#0x00
      00A747 89               [ 2]   89 	pushw	x
      00A748 93               [ 1]   90 	ldw	x, y
      00A749 CD B3 44         [ 4]   91 	call	___memcpy
                                     92 ;	./../../mib/stm8s_mib_debug_mem.c: 66: break;
      00A74C 20 2F            [ 2]   93 	jra	00105$
      00A74E                         94 00102$:
                                     95 ;	./../../mib/stm8s_mib_debug_mem.c: 68: index++;
      00A74E 1E 07            [ 2]   96 	ldw	x, (0x07, sp)
      00A750 5C               [ 1]   97 	incw	x
      00A751 1F 07            [ 2]   98 	ldw	(0x07, sp), x
      00A753 26 05            [ 1]   99 	jrne	00126$
      00A755 1E 05            [ 2]  100 	ldw	x, (0x05, sp)
      00A757 5C               [ 1]  101 	incw	x
      00A758 1F 05            [ 2]  102 	ldw	(0x05, sp), x
      00A75A                        103 00126$:
                                    104 ;	./../../mib/stm8s_mib_debug_mem.c: 69: if(index>MAX_COMMANDS)
      00A75A AE 00 06         [ 2]  105 	ldw	x, #0x0006
      00A75D 13 07            [ 2]  106 	cpw	x, (0x07, sp)
      00A75F 4F               [ 1]  107 	clr	a
      00A760 12 06            [ 1]  108 	sbc	a, (0x06, sp)
      00A762 4F               [ 1]  109 	clr	a
      00A763 12 05            [ 1]  110 	sbc	a, (0x05, sp)
      00A765 24 0B            [ 1]  111 	jrnc	00107$
                                    112 ;	./../../mib/stm8s_mib_debug_mem.c: 71: ccprintf(1,("INFO:-cmd_mem...\r\n"));
      00A767 4B 6F            [ 1]  113 	push	#<(__str_1+0)
      00A769 4B 86            [ 1]  114 	push	#((__str_1+0) >> 8)
      00A76B CD 9F BD         [ 4]  115 	call	_mib_printf
      00A76E 5B 02            [ 2]  116 	addw	sp, #2
                                    117 ;	./../../mib/stm8s_mib_debug_mem.c: 72: return;
      00A770 20 0B            [ 2]  118 	jra	00108$
      00A772                        119 00107$:
                                    120 ;	./../../mib/stm8s_mib_debug_mem.c: 60: for (cptr = cmdTbl;; cptr++) 
      00A772 1E 09            [ 2]  121 	ldw	x, (0x09, sp)
      00A774 1C 00 06         [ 2]  122 	addw	x, #0x0006
      00A777 1F 09            [ 2]  123 	ldw	(0x09, sp), x
      00A779 1F 01            [ 2]  124 	ldw	(0x01, sp), x
      00A77B 20 B1            [ 2]  125 	jra	00106$
      00A77D                        126 00105$:
                                    127 ;	./../../mib/stm8s_mib_debug_mem.c: 75: return;
      00A77D                        128 00108$:
                                    129 ;	./../../mib/stm8s_mib_debug_mem.c: 76: }
      00A77D 5B 0A            [ 2]  130 	addw	sp, #10
      00A77F 81               [ 4]  131 	ret
                                    132 ;	./../../mib/stm8s_mib_debug_mem.c: 86: static int DoMem(CMD_MY *cptr, int argc, char **argv)
                                    133 ;	-----------------------------------------
                                    134 ;	 function DoMem
                                    135 ;	-----------------------------------------
      00A780                        136 _DoMem:
      00A780 52 29            [ 2]  137 	sub	sp, #41
      00A782 1F 24            [ 2]  138 	ldw	(0x24, sp), x
                                    139 ;	./../../mib/stm8s_mib_debug_mem.c: 88: uint32_t addr = 0;
      00A784 5F               [ 1]  140 	clrw	x
      00A785 1F 03            [ 2]  141 	ldw	(0x03, sp), x
      00A787 1F 01            [ 2]  142 	ldw	(0x01, sp), x
                                    143 ;	./../../mib/stm8s_mib_debug_mem.c: 100: if (argc < 3)
      00A789 1E 2C            [ 2]  144 	ldw	x, (0x2c, sp)
      00A78B A3 00 03         [ 2]  145 	cpw	x, #0x0003
      00A78E 2E 0B            [ 1]  146 	jrsge	00102$
                                    147 ;	./../../mib/stm8s_mib_debug_mem.c: 102: MibWriteDebugString(cptr->usage);
      00A790 1E 24            [ 2]  148 	ldw	x, (0x24, sp)
      00A792 EE 04            [ 2]  149 	ldw	x, (0x4, x)
      00A794 CD 95 AB         [ 4]  150 	call	_MibWriteDebugString
                                    151 ;	./../../mib/stm8s_mib_debug_mem.c: 103: return FALSE;
      00A797 5F               [ 1]  152 	clrw	x
      00A798 CC AE F5         [ 2]  153 	jp	00235$
      00A79B                        154 00102$:
                                    155 ;	./../../mib/stm8s_mib_debug_mem.c: 105: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      00A79B 1E 2E            [ 2]  156 	ldw	x, (0x2e, sp)
      00A79D 5C               [ 1]  157 	incw	x
      00A79E 5C               [ 1]  158 	incw	x
      00A79F 1F 26            [ 2]  159 	ldw	(0x26, sp), x
      00A7A1 FE               [ 2]  160 	ldw	x, (x)
      00A7A2 4B 82            [ 1]  161 	push	#<(___str_2+0)
      00A7A4 4B 86            [ 1]  162 	push	#((___str_2+0) >> 8)
      00A7A6 CD B3 C8         [ 4]  163 	call	_strcmp
      00A7A9 5D               [ 2]  164 	tnzw	x
      00A7AA 27 03            [ 1]  165 	jreq	00564$
      00A7AC CC A8 82         [ 2]  166 	jp	00215$
      00A7AF                        167 00564$:
                                    168 ;	./../../mib/stm8s_mib_debug_mem.c: 107: if (argc < 5)
      00A7AF 1E 2C            [ 2]  169 	ldw	x, (0x2c, sp)
      00A7B1 A3 00 05         [ 2]  170 	cpw	x, #0x0005
      00A7B4 2E 0B            [ 1]  171 	jrsge	00104$
                                    172 ;	./../../mib/stm8s_mib_debug_mem.c: 109: MibWriteDebugString(cptr->usage);
      00A7B6 1E 24            [ 2]  173 	ldw	x, (0x24, sp)
      00A7B8 EE 04            [ 2]  174 	ldw	x, (0x4, x)
      00A7BA CD 95 AB         [ 4]  175 	call	_MibWriteDebugString
                                    176 ;	./../../mib/stm8s_mib_debug_mem.c: 110: return FALSE;
      00A7BD 5F               [ 1]  177 	clrw	x
      00A7BE CC AE F5         [ 2]  178 	jp	00235$
      00A7C1                        179 00104$:
                                    180 ;	./../../mib/stm8s_mib_debug_mem.c: 112: if (!HexToInt(argv[3], &addr, 32))
      00A7C1 96               [ 1]  181 	ldw	x, sp
      00A7C2 5C               [ 1]  182 	incw	x
      00A7C3 51               [ 1]  183 	exgw	x, y
      00A7C4 1E 2E            [ 2]  184 	ldw	x, (0x2e, sp)
      00A7C6 EE 06            [ 2]  185 	ldw	x, (0x6, x)
      00A7C8 4B 20            [ 1]  186 	push	#0x20
      00A7CA 4B 00            [ 1]  187 	push	#0x00
      00A7CC 90 89            [ 2]  188 	pushw	y
      00A7CE CD A2 C3         [ 4]  189 	call	_HexToInt
      00A7D1 5D               [ 2]  190 	tnzw	x
      00A7D2 26 0D            [ 1]  191 	jrne	00106$
                                    192 ;	./../../mib/stm8s_mib_debug_mem.c: 114: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A7D4 4B 88            [ 1]  193 	push	#<(__str_3+0)
      00A7D6 4B 86            [ 1]  194 	push	#((__str_3+0) >> 8)
      00A7D8 CD 9F BD         [ 4]  195 	call	_mib_printf
      00A7DB 5B 02            [ 2]  196 	addw	sp, #2
                                    197 ;	./../../mib/stm8s_mib_debug_mem.c: 115: return FALSE;
      00A7DD 5F               [ 1]  198 	clrw	x
      00A7DE CC AE F5         [ 2]  199 	jp	00235$
      00A7E1                        200 00106$:
                                    201 ;	./../../mib/stm8s_mib_debug_mem.c: 118: switch (argv[2][0])
      00A7E1 1E 2E            [ 2]  202 	ldw	x, (0x2e, sp)
      00A7E3 EE 04            [ 2]  203 	ldw	x, (0x4, x)
      00A7E5 F6               [ 1]  204 	ld	a, (x)
      00A7E6 A1 63            [ 1]  205 	cp	a, #0x63
      00A7E8 27 0B            [ 1]  206 	jreq	00107$
      00A7EA A1 6C            [ 1]  207 	cp	a, #0x6c
      00A7EC 27 5B            [ 1]  208 	jreq	00113$
      00A7EE A1 73            [ 1]  209 	cp	a, #0x73
      00A7F0 27 2D            [ 1]  210 	jreq	00110$
      00A7F2 CC A8 77         [ 2]  211 	jp	00116$
                                    212 ;	./../../mib/stm8s_mib_debug_mem.c: 120: case 'c':
      00A7F5                        213 00107$:
                                    214 ;	./../../mib/stm8s_mib_debug_mem.c: 121: if (!HexToInt(argv[4], &c, 8))
      00A7F5 96               [ 1]  215 	ldw	x, sp
      00A7F6 1C 00 05         [ 2]  216 	addw	x, #5
      00A7F9 51               [ 1]  217 	exgw	x, y
      00A7FA 1E 2E            [ 2]  218 	ldw	x, (0x2e, sp)
      00A7FC EE 08            [ 2]  219 	ldw	x, (0x8, x)
      00A7FE 4B 08            [ 1]  220 	push	#0x08
      00A800 4B 00            [ 1]  221 	push	#0x00
      00A802 90 89            [ 2]  222 	pushw	y
      00A804 CD A2 C3         [ 4]  223 	call	_HexToInt
      00A807 5D               [ 2]  224 	tnzw	x
      00A808 26 0D            [ 1]  225 	jrne	00109$
                                    226 ;	./../../mib/stm8s_mib_debug_mem.c: 123: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A80A 4B 88            [ 1]  227 	push	#<(__str_3+0)
      00A80C 4B 86            [ 1]  228 	push	#((__str_3+0) >> 8)
      00A80E CD 9F BD         [ 4]  229 	call	_mib_printf
      00A811 5B 02            [ 2]  230 	addw	sp, #2
                                    231 ;	./../../mib/stm8s_mib_debug_mem.c: 124: return FALSE;
      00A813 5F               [ 1]  232 	clrw	x
      00A814 CC AE F5         [ 2]  233 	jp	00235$
      00A817                        234 00109$:
                                    235 ;	./../../mib/stm8s_mib_debug_mem.c: 126: wr_ADDR8(addr, c);
      00A817 1E 03            [ 2]  236 	ldw	x, (0x03, sp)
      00A819 7B 05            [ 1]  237 	ld	a, (0x05, sp)
      00A81B F7               [ 1]  238 	ld	(x), a
                                    239 ;	./../../mib/stm8s_mib_debug_mem.c: 127: break;
      00A81C CC AE F3         [ 2]  240 	jp	00216$
                                    241 ;	./../../mib/stm8s_mib_debug_mem.c: 128: case 's':
      00A81F                        242 00110$:
                                    243 ;	./../../mib/stm8s_mib_debug_mem.c: 129: if (!HexToInt(argv[4], &s, 16))
      00A81F 96               [ 1]  244 	ldw	x, sp
      00A820 1C 00 06         [ 2]  245 	addw	x, #6
      00A823 51               [ 1]  246 	exgw	x, y
      00A824 1E 2E            [ 2]  247 	ldw	x, (0x2e, sp)
      00A826 EE 08            [ 2]  248 	ldw	x, (0x8, x)
      00A828 4B 10            [ 1]  249 	push	#0x10
      00A82A 4B 00            [ 1]  250 	push	#0x00
      00A82C 90 89            [ 2]  251 	pushw	y
      00A82E CD A2 C3         [ 4]  252 	call	_HexToInt
      00A831 5D               [ 2]  253 	tnzw	x
      00A832 26 0D            [ 1]  254 	jrne	00112$
                                    255 ;	./../../mib/stm8s_mib_debug_mem.c: 131: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A834 4B 88            [ 1]  256 	push	#<(__str_3+0)
      00A836 4B 86            [ 1]  257 	push	#((__str_3+0) >> 8)
      00A838 CD 9F BD         [ 4]  258 	call	_mib_printf
      00A83B 5B 02            [ 2]  259 	addw	sp, #2
                                    260 ;	./../../mib/stm8s_mib_debug_mem.c: 132: return FALSE;
      00A83D 5F               [ 1]  261 	clrw	x
      00A83E CC AE F5         [ 2]  262 	jp	00235$
      00A841                        263 00112$:
                                    264 ;	./../../mib/stm8s_mib_debug_mem.c: 134: wr_ADDR16(addr, s);
      00A841 1E 03            [ 2]  265 	ldw	x, (0x03, sp)
      00A843 16 06            [ 2]  266 	ldw	y, (0x06, sp)
      00A845 FF               [ 2]  267 	ldw	(x), y
                                    268 ;	./../../mib/stm8s_mib_debug_mem.c: 135: break;
      00A846 CC AE F3         [ 2]  269 	jp	00216$
                                    270 ;	./../../mib/stm8s_mib_debug_mem.c: 136: case 'l':
      00A849                        271 00113$:
                                    272 ;	./../../mib/stm8s_mib_debug_mem.c: 137: if (!HexToInt(argv[4], &l, 32))
      00A849 96               [ 1]  273 	ldw	x, sp
      00A84A 1C 00 08         [ 2]  274 	addw	x, #8
      00A84D 51               [ 1]  275 	exgw	x, y
      00A84E 1E 2E            [ 2]  276 	ldw	x, (0x2e, sp)
      00A850 EE 08            [ 2]  277 	ldw	x, (0x8, x)
      00A852 4B 20            [ 1]  278 	push	#0x20
      00A854 4B 00            [ 1]  279 	push	#0x00
      00A856 90 89            [ 2]  280 	pushw	y
      00A858 CD A2 C3         [ 4]  281 	call	_HexToInt
      00A85B 5D               [ 2]  282 	tnzw	x
      00A85C 26 0D            [ 1]  283 	jrne	00115$
                                    284 ;	./../../mib/stm8s_mib_debug_mem.c: 139: ccprintf(_DEBUG_CMD_A_, ("Illugal character is useqd.\r\n"));
      00A85E 4B A5            [ 1]  285 	push	#<(__str_4+0)
      00A860 4B 86            [ 1]  286 	push	#((__str_4+0) >> 8)
      00A862 CD 9F BD         [ 4]  287 	call	_mib_printf
      00A865 5B 02            [ 2]  288 	addw	sp, #2
                                    289 ;	./../../mib/stm8s_mib_debug_mem.c: 140: return FALSE;
      00A867 5F               [ 1]  290 	clrw	x
      00A868 CC AE F5         [ 2]  291 	jp	00235$
      00A86B                        292 00115$:
                                    293 ;	./../../mib/stm8s_mib_debug_mem.c: 142: wr_ADDR32(addr, l);
      00A86B 1E 03            [ 2]  294 	ldw	x, (0x03, sp)
      00A86D 16 0A            [ 2]  295 	ldw	y, (0x0a, sp)
      00A86F EF 02            [ 2]  296 	ldw	(0x2, x), y
      00A871 16 08            [ 2]  297 	ldw	y, (0x08, sp)
      00A873 FF               [ 2]  298 	ldw	(x), y
                                    299 ;	./../../mib/stm8s_mib_debug_mem.c: 143: break;
      00A874 CC AE F3         [ 2]  300 	jp	00216$
                                    301 ;	./../../mib/stm8s_mib_debug_mem.c: 144: default:
      00A877                        302 00116$:
                                    303 ;	./../../mib/stm8s_mib_debug_mem.c: 145: MibWriteDebugString(cptr->usage);
      00A877 1E 24            [ 2]  304 	ldw	x, (0x24, sp)
      00A879 EE 04            [ 2]  305 	ldw	x, (0x4, x)
      00A87B CD 95 AB         [ 4]  306 	call	_MibWriteDebugString
                                    307 ;	./../../mib/stm8s_mib_debug_mem.c: 146: return FALSE;
      00A87E 5F               [ 1]  308 	clrw	x
      00A87F CC AE F5         [ 2]  309 	jp	00235$
                                    310 ;	./../../mib/stm8s_mib_debug_mem.c: 147: }		
      00A882                        311 00215$:
                                    312 ;	./../../mib/stm8s_mib_debug_mem.c: 149: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      00A882 1E 26            [ 2]  313 	ldw	x, (0x26, sp)
      00A884 FE               [ 2]  314 	ldw	x, (x)
      00A885 4B C3            [ 1]  315 	push	#<(___str_5+0)
      00A887 4B 86            [ 1]  316 	push	#((___str_5+0) >> 8)
      00A889 CD B3 C8         [ 4]  317 	call	_strcmp
      00A88C 5D               [ 2]  318 	tnzw	x
      00A88D 27 03            [ 1]  319 	jreq	00579$
      00A88F CC A9 46         [ 2]  320 	jp	00212$
      00A892                        321 00579$:
                                    322 ;	./../../mib/stm8s_mib_debug_mem.c: 151: if (argc < 4)
      00A892 1E 2C            [ 2]  323 	ldw	x, (0x2c, sp)
      00A894 A3 00 04         [ 2]  324 	cpw	x, #0x0004
      00A897 2E 0B            [ 1]  325 	jrsge	00119$
                                    326 ;	./../../mib/stm8s_mib_debug_mem.c: 153: MibWriteDebugString(cptr->usage);
      00A899 1E 24            [ 2]  327 	ldw	x, (0x24, sp)
      00A89B EE 04            [ 2]  328 	ldw	x, (0x4, x)
      00A89D CD 95 AB         [ 4]  329 	call	_MibWriteDebugString
                                    330 ;	./../../mib/stm8s_mib_debug_mem.c: 154: return FALSE;
      00A8A0 5F               [ 1]  331 	clrw	x
      00A8A1 CC AE F5         [ 2]  332 	jp	00235$
      00A8A4                        333 00119$:
                                    334 ;	./../../mib/stm8s_mib_debug_mem.c: 156: if (!HexToInt(argv[3], &addr, 32))
      00A8A4 96               [ 1]  335 	ldw	x, sp
      00A8A5 5C               [ 1]  336 	incw	x
      00A8A6 51               [ 1]  337 	exgw	x, y
      00A8A7 1E 2E            [ 2]  338 	ldw	x, (0x2e, sp)
      00A8A9 EE 06            [ 2]  339 	ldw	x, (0x6, x)
      00A8AB 4B 20            [ 1]  340 	push	#0x20
      00A8AD 4B 00            [ 1]  341 	push	#0x00
      00A8AF 90 89            [ 2]  342 	pushw	y
      00A8B1 CD A2 C3         [ 4]  343 	call	_HexToInt
      00A8B4 5D               [ 2]  344 	tnzw	x
      00A8B5 26 0D            [ 1]  345 	jrne	00121$
                                    346 ;	./../../mib/stm8s_mib_debug_mem.c: 158: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A8B7 4B 88            [ 1]  347 	push	#<(__str_3+0)
      00A8B9 4B 86            [ 1]  348 	push	#((__str_3+0) >> 8)
      00A8BB CD 9F BD         [ 4]  349 	call	_mib_printf
      00A8BE 5B 02            [ 2]  350 	addw	sp, #2
                                    351 ;	./../../mib/stm8s_mib_debug_mem.c: 159: return FALSE;
      00A8C0 5F               [ 1]  352 	clrw	x
      00A8C1 CC AE F5         [ 2]  353 	jp	00235$
      00A8C4                        354 00121$:
                                    355 ;	./../../mib/stm8s_mib_debug_mem.c: 161: ccprintf(_DEBUG_CMD_A_,("\taddress : 0x%08lx  ", addr));
      00A8C4 1E 03            [ 2]  356 	ldw	x, (0x03, sp)
      00A8C6 89               [ 2]  357 	pushw	x
      00A8C7 1E 03            [ 2]  358 	ldw	x, (0x03, sp)
      00A8C9 89               [ 2]  359 	pushw	x
      00A8CA 4B C8            [ 1]  360 	push	#<(__str_6+0)
      00A8CC 4B 86            [ 1]  361 	push	#((__str_6+0) >> 8)
      00A8CE CD 9F BD         [ 4]  362 	call	_mib_printf
      00A8D1 5B 06            [ 2]  363 	addw	sp, #6
                                    364 ;	./../../mib/stm8s_mib_debug_mem.c: 162: ccprintf(_DEBUG_CMD_A_, ("\tvalue   : "));
      00A8D3 4B DD            [ 1]  365 	push	#<(__str_7+0)
      00A8D5 4B 86            [ 1]  366 	push	#((__str_7+0) >> 8)
      00A8D7 CD 9F BD         [ 4]  367 	call	_mib_printf
      00A8DA 5B 02            [ 2]  368 	addw	sp, #2
                                    369 ;	./../../mib/stm8s_mib_debug_mem.c: 163: switch (argv[2][0])
      00A8DC 1E 2E            [ 2]  370 	ldw	x, (0x2e, sp)
      00A8DE EE 04            [ 2]  371 	ldw	x, (0x4, x)
      00A8E0 F6               [ 1]  372 	ld	a, (x)
      00A8E1 A1 63            [ 1]  373 	cp	a, #0x63
      00A8E3 27 0A            [ 1]  374 	jreq	00122$
      00A8E5 A1 6C            [ 1]  375 	cp	a, #0x6c
      00A8E7 27 2A            [ 1]  376 	jreq	00124$
      00A8E9 A1 73            [ 1]  377 	cp	a, #0x73
      00A8EB 27 15            [ 1]  378 	jreq	00123$
      00A8ED 20 3E            [ 2]  379 	jra	00125$
                                    380 ;	./../../mib/stm8s_mib_debug_mem.c: 165: case 'c':
      00A8EF                        381 00122$:
                                    382 ;	./../../mib/stm8s_mib_debug_mem.c: 166: c = rd_ADDR8(addr);
      00A8EF 1E 03            [ 2]  383 	ldw	x, (0x03, sp)
      00A8F1 F6               [ 1]  384 	ld	a, (x)
      00A8F2 6B 05            [ 1]  385 	ld	(0x05, sp), a
                                    386 ;	./../../mib/stm8s_mib_debug_mem.c: 167: ccprintf(_DEBUG_CMD_A_,("0x%02x ", c));
      00A8F4 5F               [ 1]  387 	clrw	x
      00A8F5 97               [ 1]  388 	ld	xl, a
      00A8F6 89               [ 2]  389 	pushw	x
      00A8F7 4B E9            [ 1]  390 	push	#<(__str_8+0)
      00A8F9 4B 86            [ 1]  391 	push	#((__str_8+0) >> 8)
      00A8FB CD 9F BD         [ 4]  392 	call	_mib_printf
      00A8FE 5B 04            [ 2]  393 	addw	sp, #4
                                    394 ;	./../../mib/stm8s_mib_debug_mem.c: 168: break;
      00A900 20 38            [ 2]  395 	jra	00126$
                                    396 ;	./../../mib/stm8s_mib_debug_mem.c: 169: case 's':
      00A902                        397 00123$:
                                    398 ;	./../../mib/stm8s_mib_debug_mem.c: 170: s = rd_ADDR16(addr);
      00A902 1E 03            [ 2]  399 	ldw	x, (0x03, sp)
      00A904 FE               [ 2]  400 	ldw	x, (x)
      00A905 1F 06            [ 2]  401 	ldw	(0x06, sp), x
                                    402 ;	./../../mib/stm8s_mib_debug_mem.c: 171: ccprintf(_DEBUG_CMD_A_,("0x%04x", s));
      00A907 89               [ 2]  403 	pushw	x
      00A908 4B F1            [ 1]  404 	push	#<(__str_9+0)
      00A90A 4B 86            [ 1]  405 	push	#((__str_9+0) >> 8)
      00A90C CD 9F BD         [ 4]  406 	call	_mib_printf
      00A90F 5B 04            [ 2]  407 	addw	sp, #4
                                    408 ;	./../../mib/stm8s_mib_debug_mem.c: 172: break;
      00A911 20 27            [ 2]  409 	jra	00126$
                                    410 ;	./../../mib/stm8s_mib_debug_mem.c: 173: case 'l':
      00A913                        411 00124$:
                                    412 ;	./../../mib/stm8s_mib_debug_mem.c: 174: l = rd_ADDR32(addr);
      00A913 1E 03            [ 2]  413 	ldw	x, (0x03, sp)
      00A915 90 93            [ 1]  414 	ldw	y, x
      00A917 90 EE 02         [ 2]  415 	ldw	y, (0x2, y)
      00A91A FE               [ 2]  416 	ldw	x, (x)
      00A91B 17 0A            [ 2]  417 	ldw	(0x0a, sp), y
      00A91D 1F 08            [ 2]  418 	ldw	(0x08, sp), x
                                    419 ;	./../../mib/stm8s_mib_debug_mem.c: 175: ccprintf(_DEBUG_CMD_A_,("0x%08lx", l));
      00A91F 90 89            [ 2]  420 	pushw	y
      00A921 89               [ 2]  421 	pushw	x
      00A922 4B F8            [ 1]  422 	push	#<(__str_10+0)
      00A924 4B 86            [ 1]  423 	push	#((__str_10+0) >> 8)
      00A926 CD 9F BD         [ 4]  424 	call	_mib_printf
      00A929 5B 06            [ 2]  425 	addw	sp, #6
                                    426 ;	./../../mib/stm8s_mib_debug_mem.c: 176: break;
      00A92B 20 0D            [ 2]  427 	jra	00126$
                                    428 ;	./../../mib/stm8s_mib_debug_mem.c: 177: default:
      00A92D                        429 00125$:
                                    430 ;	./../../mib/stm8s_mib_debug_mem.c: 178: ccprintf(_DEBUG_CMD_A_, ("Error.\r\n"));
      00A92D 4B 00            [ 1]  431 	push	#<(__str_11+0)
      00A92F 4B 87            [ 1]  432 	push	#((__str_11+0) >> 8)
      00A931 CD 9F BD         [ 4]  433 	call	_mib_printf
      00A934 5B 02            [ 2]  434 	addw	sp, #2
                                    435 ;	./../../mib/stm8s_mib_debug_mem.c: 179: return FALSE;
      00A936 5F               [ 1]  436 	clrw	x
      00A937 CC AE F5         [ 2]  437 	jp	00235$
                                    438 ;	./../../mib/stm8s_mib_debug_mem.c: 180: }
      00A93A                        439 00126$:
                                    440 ;	./../../mib/stm8s_mib_debug_mem.c: 181: ccprintf(_DEBUG_CMD_A_, (".\r\n"));		
      00A93A 4B 09            [ 1]  441 	push	#<(__str_12+0)
      00A93C 4B 87            [ 1]  442 	push	#((__str_12+0) >> 8)
      00A93E CD 9F BD         [ 4]  443 	call	_mib_printf
      00A941 5B 02            [ 2]  444 	addw	sp, #2
      00A943 CC AE F3         [ 2]  445 	jp	00216$
      00A946                        446 00212$:
                                    447 ;	./../../mib/stm8s_mib_debug_mem.c: 183: else if (!strcmp(argv[1], "wrn")) // _CMD_MY_WRITE_
      00A946 1E 26            [ 2]  448 	ldw	x, (0x26, sp)
      00A948 FE               [ 2]  449 	ldw	x, (x)
      00A949 4B 0D            [ 1]  450 	push	#<(___str_13+0)
      00A94B 4B 87            [ 1]  451 	push	#((___str_13+0) >> 8)
      00A94D CD B3 C8         [ 4]  452 	call	_strcmp
      00A950 5D               [ 2]  453 	tnzw	x
      00A951 27 03            [ 1]  454 	jreq	00591$
      00A953 CC AA DD         [ 2]  455 	jp	00209$
      00A956                        456 00591$:
                                    457 ;	./../../mib/stm8s_mib_debug_mem.c: 186: if (argc < 6)
      00A956 1E 2C            [ 2]  458 	ldw	x, (0x2c, sp)
      00A958 A3 00 06         [ 2]  459 	cpw	x, #0x0006
      00A95B 2E 0B            [ 1]  460 	jrsge	00128$
                                    461 ;	./../../mib/stm8s_mib_debug_mem.c: 188: MibWriteDebugString(cptr->usage);
      00A95D 1E 24            [ 2]  462 	ldw	x, (0x24, sp)
      00A95F EE 04            [ 2]  463 	ldw	x, (0x4, x)
      00A961 CD 95 AB         [ 4]  464 	call	_MibWriteDebugString
                                    465 ;	./../../mib/stm8s_mib_debug_mem.c: 189: return FALSE;
      00A964 5F               [ 1]  466 	clrw	x
      00A965 CC AE F5         [ 2]  467 	jp	00235$
      00A968                        468 00128$:
                                    469 ;	./../../mib/stm8s_mib_debug_mem.c: 191: if (!HexToInt(argv[3], &addr, 32))
      00A968 96               [ 1]  470 	ldw	x, sp
      00A969 5C               [ 1]  471 	incw	x
      00A96A 51               [ 1]  472 	exgw	x, y
      00A96B 1E 2E            [ 2]  473 	ldw	x, (0x2e, sp)
      00A96D EE 06            [ 2]  474 	ldw	x, (0x6, x)
      00A96F 4B 20            [ 1]  475 	push	#0x20
      00A971 4B 00            [ 1]  476 	push	#0x00
      00A973 90 89            [ 2]  477 	pushw	y
      00A975 CD A2 C3         [ 4]  478 	call	_HexToInt
      00A978 5D               [ 2]  479 	tnzw	x
      00A979 26 0D            [ 1]  480 	jrne	00130$
                                    481 ;	./../../mib/stm8s_mib_debug_mem.c: 193: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A97B 4B 88            [ 1]  482 	push	#<(__str_3+0)
      00A97D 4B 86            [ 1]  483 	push	#((__str_3+0) >> 8)
      00A97F CD 9F BD         [ 4]  484 	call	_mib_printf
      00A982 5B 02            [ 2]  485 	addw	sp, #2
                                    486 ;	./../../mib/stm8s_mib_debug_mem.c: 194: return FALSE;
      00A984 5F               [ 1]  487 	clrw	x
      00A985 CC AE F5         [ 2]  488 	jp	00235$
      00A988                        489 00130$:
                                    490 ;	./../../mib/stm8s_mib_debug_mem.c: 196: if (!HexToInt(argv[5], &v_Loop, 32))
      00A988 96               [ 1]  491 	ldw	x, sp
      00A989 1C 00 18         [ 2]  492 	addw	x, #24
      00A98C 51               [ 1]  493 	exgw	x, y
      00A98D 1E 2E            [ 2]  494 	ldw	x, (0x2e, sp)
      00A98F EE 0A            [ 2]  495 	ldw	x, (0xa, x)
      00A991 4B 20            [ 1]  496 	push	#0x20
      00A993 4B 00            [ 1]  497 	push	#0x00
      00A995 90 89            [ 2]  498 	pushw	y
      00A997 CD A2 C3         [ 4]  499 	call	_HexToInt
      00A99A 5D               [ 2]  500 	tnzw	x
      00A99B 26 0D            [ 1]  501 	jrne	00132$
                                    502 ;	./../../mib/stm8s_mib_debug_mem.c: 198: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A99D 4B 88            [ 1]  503 	push	#<(__str_3+0)
      00A99F 4B 86            [ 1]  504 	push	#((__str_3+0) >> 8)
      00A9A1 CD 9F BD         [ 4]  505 	call	_mib_printf
      00A9A4 5B 02            [ 2]  506 	addw	sp, #2
                                    507 ;	./../../mib/stm8s_mib_debug_mem.c: 199: return FALSE;
      00A9A6 5F               [ 1]  508 	clrw	x
      00A9A7 CC AE F5         [ 2]  509 	jp	00235$
      00A9AA                        510 00132$:
                                    511 ;	./../../mib/stm8s_mib_debug_mem.c: 201: switch (argv[2][0])
      00A9AA 1E 2E            [ 2]  512 	ldw	x, (0x2e, sp)
      00A9AC EE 04            [ 2]  513 	ldw	x, (0x4, x)
      00A9AE F6               [ 1]  514 	ld	a, (x)
      00A9AF A1 63            [ 1]  515 	cp	a, #0x63
      00A9B1 27 0E            [ 1]  516 	jreq	00133$
      00A9B3 A1 6C            [ 1]  517 	cp	a, #0x6c
      00A9B5 26 03            [ 1]  518 	jrne	00599$
      00A9B7 CC AA 6E         [ 2]  519 	jp	00141$
      00A9BA                        520 00599$:
      00A9BA A1 73            [ 1]  521 	cp	a, #0x73
      00A9BC 27 55            [ 1]  522 	jreq	00137$
      00A9BE CC AA CD         [ 2]  523 	jp	00145$
                                    524 ;	./../../mib/stm8s_mib_debug_mem.c: 203: case 'c':
      00A9C1                        525 00133$:
                                    526 ;	./../../mib/stm8s_mib_debug_mem.c: 204: if (!HexToInt(argv[4], &c, 8))
      00A9C1 96               [ 1]  527 	ldw	x, sp
      00A9C2 1C 00 05         [ 2]  528 	addw	x, #5
      00A9C5 16 2E            [ 2]  529 	ldw	y, (0x2e, sp)
      00A9C7 90 EE 08         [ 2]  530 	ldw	y, (0x8, y)
      00A9CA 4B 08            [ 1]  531 	push	#0x08
      00A9CC 4B 00            [ 1]  532 	push	#0x00
      00A9CE 89               [ 2]  533 	pushw	x
      00A9CF 93               [ 1]  534 	ldw	x, y
      00A9D0 CD A2 C3         [ 4]  535 	call	_HexToInt
      00A9D3 5D               [ 2]  536 	tnzw	x
      00A9D4 26 0D            [ 1]  537 	jrne	00262$
                                    538 ;	./../../mib/stm8s_mib_debug_mem.c: 206: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00A9D6 4B 88            [ 1]  539 	push	#<(__str_3+0)
      00A9D8 4B 86            [ 1]  540 	push	#((__str_3+0) >> 8)
      00A9DA CD 9F BD         [ 4]  541 	call	_mib_printf
      00A9DD 5B 02            [ 2]  542 	addw	sp, #2
                                    543 ;	./../../mib/stm8s_mib_debug_mem.c: 207: return FALSE;
      00A9DF 5F               [ 1]  544 	clrw	x
      00A9E0 CC AE F5         [ 2]  545 	jp	00235$
      00A9E3                        546 00262$:
      00A9E3 16 1A            [ 2]  547 	ldw	y, (0x1a, sp)
      00A9E5 17 28            [ 2]  548 	ldw	(0x28, sp), y
      00A9E7 16 18            [ 2]  549 	ldw	y, (0x18, sp)
      00A9E9 17 26            [ 2]  550 	ldw	(0x26, sp), y
      00A9EB                        551 00218$:
                                    552 ;	./../../mib/stm8s_mib_debug_mem.c: 209: for (; v_Loop; v_Loop--) wr_ADDR8(addr, c);
      00A9EB 1E 28            [ 2]  553 	ldw	x, (0x28, sp)
      00A9ED 26 07            [ 1]  554 	jrne	00605$
      00A9EF 1E 26            [ 2]  555 	ldw	x, (0x26, sp)
      00A9F1 26 03            [ 1]  556 	jrne	00605$
      00A9F3 CC AE D7         [ 2]  557 	jp	00301$
      00A9F6                        558 00605$:
      00A9F6 1E 03            [ 2]  559 	ldw	x, (0x03, sp)
      00A9F8 7B 05            [ 1]  560 	ld	a, (0x05, sp)
      00A9FA F7               [ 1]  561 	ld	(x), a
      00A9FB 1E 28            [ 2]  562 	ldw	x, (0x28, sp)
      00A9FD 1D 00 01         [ 2]  563 	subw	x, #0x0001
      00AA00 1F 28            [ 2]  564 	ldw	(0x28, sp), x
      00AA02 1E 26            [ 2]  565 	ldw	x, (0x26, sp)
      00AA04 24 01            [ 1]  566 	jrnc	00606$
      00AA06 5A               [ 2]  567 	decw	x
      00AA07                        568 00606$:
      00AA07 1F 26            [ 2]  569 	ldw	(0x26, sp), x
      00AA09 16 28            [ 2]  570 	ldw	y, (0x28, sp)
      00AA0B 17 1A            [ 2]  571 	ldw	(0x1a, sp), y
      00AA0D 16 26            [ 2]  572 	ldw	y, (0x26, sp)
      00AA0F 17 18            [ 2]  573 	ldw	(0x18, sp), y
      00AA11 20 D8            [ 2]  574 	jra	00218$
                                    575 ;	./../../mib/stm8s_mib_debug_mem.c: 211: case 's':
      00AA13                        576 00137$:
                                    577 ;	./../../mib/stm8s_mib_debug_mem.c: 212: if (!HexToInt(argv[4], &s, 16))
      00AA13 16 2E            [ 2]  578 	ldw	y, (0x2e, sp)
      00AA15 17 26            [ 2]  579 	ldw	(0x26, sp), y
      00AA17 93               [ 1]  580 	ldw	x, y
      00AA18 EE 08            [ 2]  581 	ldw	x, (0x8, x)
      00AA1A 1F 28            [ 2]  582 	ldw	(0x28, sp), x
      00AA1C 4B 10            [ 1]  583 	push	#0x10
      00AA1E 4B 00            [ 1]  584 	push	#0x00
      00AA20 96               [ 1]  585 	ldw	x, sp
      00AA21 1C 00 08         [ 2]  586 	addw	x, #8
      00AA24 89               [ 2]  587 	pushw	x
      00AA25 1E 2C            [ 2]  588 	ldw	x, (0x2c, sp)
      00AA27 CD A2 C3         [ 4]  589 	call	_HexToInt
      00AA2A 1F 28            [ 2]  590 	ldw	(0x28, sp), x
      00AA2C 26 0D            [ 1]  591 	jrne	00265$
                                    592 ;	./../../mib/stm8s_mib_debug_mem.c: 214: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00AA2E 4B 88            [ 1]  593 	push	#<(__str_3+0)
      00AA30 4B 86            [ 1]  594 	push	#((__str_3+0) >> 8)
      00AA32 CD 9F BD         [ 4]  595 	call	_mib_printf
      00AA35 5B 02            [ 2]  596 	addw	sp, #2
                                    597 ;	./../../mib/stm8s_mib_debug_mem.c: 215: return FALSE;
      00AA37 5F               [ 1]  598 	clrw	x
      00AA38 CC AE F5         [ 2]  599 	jp	00235$
      00AA3B                        600 00265$:
      00AA3B 16 1A            [ 2]  601 	ldw	y, (0x1a, sp)
      00AA3D 17 28            [ 2]  602 	ldw	(0x28, sp), y
      00AA3F 16 18            [ 2]  603 	ldw	y, (0x18, sp)
      00AA41 17 26            [ 2]  604 	ldw	(0x26, sp), y
      00AA43                        605 00221$:
                                    606 ;	./../../mib/stm8s_mib_debug_mem.c: 217: for (; v_Loop; v_Loop--) wr_ADDR16(addr, s);
      00AA43 1E 28            [ 2]  607 	ldw	x, (0x28, sp)
      00AA45 26 07            [ 1]  608 	jrne	00608$
      00AA47 1E 26            [ 2]  609 	ldw	x, (0x26, sp)
      00AA49 26 03            [ 1]  610 	jrne	00608$
      00AA4B CC AE E1         [ 2]  611 	jp	00302$
      00AA4E                        612 00608$:
      00AA4E 16 03            [ 2]  613 	ldw	y, (0x03, sp)
      00AA50 17 22            [ 2]  614 	ldw	(0x22, sp), y
      00AA52 93               [ 1]  615 	ldw	x, y
      00AA53 16 06            [ 2]  616 	ldw	y, (0x06, sp)
      00AA55 FF               [ 2]  617 	ldw	(x), y
      00AA56 1E 28            [ 2]  618 	ldw	x, (0x28, sp)
      00AA58 1D 00 01         [ 2]  619 	subw	x, #0x0001
      00AA5B 1F 28            [ 2]  620 	ldw	(0x28, sp), x
      00AA5D 1E 26            [ 2]  621 	ldw	x, (0x26, sp)
      00AA5F 24 01            [ 1]  622 	jrnc	00609$
      00AA61 5A               [ 2]  623 	decw	x
      00AA62                        624 00609$:
      00AA62 1F 26            [ 2]  625 	ldw	(0x26, sp), x
      00AA64 16 28            [ 2]  626 	ldw	y, (0x28, sp)
      00AA66 17 1A            [ 2]  627 	ldw	(0x1a, sp), y
      00AA68 16 26            [ 2]  628 	ldw	y, (0x26, sp)
      00AA6A 17 18            [ 2]  629 	ldw	(0x18, sp), y
      00AA6C 20 D5            [ 2]  630 	jra	00221$
                                    631 ;	./../../mib/stm8s_mib_debug_mem.c: 219: case 'l':
      00AA6E                        632 00141$:
                                    633 ;	./../../mib/stm8s_mib_debug_mem.c: 220: if (!HexToInt(argv[4], &l, 32))
      00AA6E 16 2E            [ 2]  634 	ldw	y, (0x2e, sp)
      00AA70 17 26            [ 2]  635 	ldw	(0x26, sp), y
      00AA72 93               [ 1]  636 	ldw	x, y
      00AA73 EE 08            [ 2]  637 	ldw	x, (0x8, x)
      00AA75 1F 28            [ 2]  638 	ldw	(0x28, sp), x
      00AA77 4B 20            [ 1]  639 	push	#0x20
      00AA79 4B 00            [ 1]  640 	push	#0x00
      00AA7B 96               [ 1]  641 	ldw	x, sp
      00AA7C 1C 00 0A         [ 2]  642 	addw	x, #10
      00AA7F 89               [ 2]  643 	pushw	x
      00AA80 1E 2C            [ 2]  644 	ldw	x, (0x2c, sp)
      00AA82 CD A2 C3         [ 4]  645 	call	_HexToInt
      00AA85 1F 28            [ 2]  646 	ldw	(0x28, sp), x
      00AA87 26 0D            [ 1]  647 	jrne	00268$
                                    648 ;	./../../mib/stm8s_mib_debug_mem.c: 222: ccprintf(_DEBUG_CMD_A_, ("Illugal character is useqd.\r\n"));
      00AA89 4B A5            [ 1]  649 	push	#<(__str_4+0)
      00AA8B 4B 86            [ 1]  650 	push	#((__str_4+0) >> 8)
      00AA8D CD 9F BD         [ 4]  651 	call	_mib_printf
      00AA90 5B 02            [ 2]  652 	addw	sp, #2
                                    653 ;	./../../mib/stm8s_mib_debug_mem.c: 223: return FALSE;
      00AA92 5F               [ 1]  654 	clrw	x
      00AA93 CC AE F5         [ 2]  655 	jp	00235$
      00AA96                        656 00268$:
      00AA96 16 1A            [ 2]  657 	ldw	y, (0x1a, sp)
      00AA98 17 28            [ 2]  658 	ldw	(0x28, sp), y
      00AA9A 16 18            [ 2]  659 	ldw	y, (0x18, sp)
      00AA9C 17 26            [ 2]  660 	ldw	(0x26, sp), y
      00AA9E                        661 00224$:
                                    662 ;	./../../mib/stm8s_mib_debug_mem.c: 225: for (; v_Loop; v_Loop--) wr_ADDR32(addr, l);
      00AA9E 1E 28            [ 2]  663 	ldw	x, (0x28, sp)
      00AAA0 26 07            [ 1]  664 	jrne	00611$
      00AAA2 1E 26            [ 2]  665 	ldw	x, (0x26, sp)
      00AAA4 26 03            [ 1]  666 	jrne	00611$
      00AAA6 CC AE EB         [ 2]  667 	jp	00303$
      00AAA9                        668 00611$:
      00AAA9 16 03            [ 2]  669 	ldw	y, (0x03, sp)
      00AAAB 17 22            [ 2]  670 	ldw	(0x22, sp), y
      00AAAD 93               [ 1]  671 	ldw	x, y
      00AAAE 16 0A            [ 2]  672 	ldw	y, (0x0a, sp)
      00AAB0 EF 02            [ 2]  673 	ldw	(0x2, x), y
      00AAB2 16 08            [ 2]  674 	ldw	y, (0x08, sp)
      00AAB4 FF               [ 2]  675 	ldw	(x), y
      00AAB5 1E 28            [ 2]  676 	ldw	x, (0x28, sp)
      00AAB7 1D 00 01         [ 2]  677 	subw	x, #0x0001
      00AABA 1F 28            [ 2]  678 	ldw	(0x28, sp), x
      00AABC 1E 26            [ 2]  679 	ldw	x, (0x26, sp)
      00AABE 24 01            [ 1]  680 	jrnc	00612$
      00AAC0 5A               [ 2]  681 	decw	x
      00AAC1                        682 00612$:
      00AAC1 1F 26            [ 2]  683 	ldw	(0x26, sp), x
      00AAC3 16 28            [ 2]  684 	ldw	y, (0x28, sp)
      00AAC5 17 1A            [ 2]  685 	ldw	(0x1a, sp), y
      00AAC7 16 26            [ 2]  686 	ldw	y, (0x26, sp)
      00AAC9 17 18            [ 2]  687 	ldw	(0x18, sp), y
      00AACB 20 D1            [ 2]  688 	jra	00224$
                                    689 ;	./../../mib/stm8s_mib_debug_mem.c: 227: default:
      00AACD                        690 00145$:
                                    691 ;	./../../mib/stm8s_mib_debug_mem.c: 228: MibWriteDebugString(cptr->usage);
      00AACD 16 24            [ 2]  692 	ldw	y, (0x24, sp)
      00AACF 17 26            [ 2]  693 	ldw	(0x26, sp), y
      00AAD1 93               [ 1]  694 	ldw	x, y
      00AAD2 EE 04            [ 2]  695 	ldw	x, (0x4, x)
      00AAD4 1F 28            [ 2]  696 	ldw	(0x28, sp), x
      00AAD6 CD 95 AB         [ 4]  697 	call	_MibWriteDebugString
                                    698 ;	./../../mib/stm8s_mib_debug_mem.c: 229: return FALSE;
      00AAD9 5F               [ 1]  699 	clrw	x
      00AADA CC AE F5         [ 2]  700 	jp	00235$
                                    701 ;	./../../mib/stm8s_mib_debug_mem.c: 230: }	
      00AADD                        702 00209$:
                                    703 ;	./../../mib/stm8s_mib_debug_mem.c: 232: else if (!strcmp(argv[1], "rdn")) // _CMD_MY_READ_
      00AADD 1E 26            [ 2]  704 	ldw	x, (0x26, sp)
      00AADF FE               [ 2]  705 	ldw	x, (x)
      00AAE0 1F 28            [ 2]  706 	ldw	(0x28, sp), x
      00AAE2 4B 11            [ 1]  707 	push	#<(___str_14+0)
      00AAE4 4B 87            [ 1]  708 	push	#((___str_14+0) >> 8)
      00AAE6 1E 2A            [ 2]  709 	ldw	x, (0x2a, sp)
      00AAE8 CD B3 C8         [ 4]  710 	call	_strcmp
      00AAEB 1F 28            [ 2]  711 	ldw	(0x28, sp), x
      00AAED 27 03            [ 1]  712 	jreq	00613$
      00AAEF CC AC D0         [ 2]  713 	jp	00206$
      00AAF2                        714 00613$:
                                    715 ;	./../../mib/stm8s_mib_debug_mem.c: 235: if (argc < 5)
      00AAF2 1E 2C            [ 2]  716 	ldw	x, (0x2c, sp)
      00AAF4 A3 00 05         [ 2]  717 	cpw	x, #0x0005
      00AAF7 2E 10            [ 1]  718 	jrsge	00148$
                                    719 ;	./../../mib/stm8s_mib_debug_mem.c: 237: MibWriteDebugString(cptr->usage);
      00AAF9 16 24            [ 2]  720 	ldw	y, (0x24, sp)
      00AAFB 17 26            [ 2]  721 	ldw	(0x26, sp), y
      00AAFD 93               [ 1]  722 	ldw	x, y
      00AAFE EE 04            [ 2]  723 	ldw	x, (0x4, x)
      00AB00 1F 28            [ 2]  724 	ldw	(0x28, sp), x
      00AB02 CD 95 AB         [ 4]  725 	call	_MibWriteDebugString
                                    726 ;	./../../mib/stm8s_mib_debug_mem.c: 238: return FALSE;
      00AB05 5F               [ 1]  727 	clrw	x
      00AB06 CC AE F5         [ 2]  728 	jp	00235$
      00AB09                        729 00148$:
                                    730 ;	./../../mib/stm8s_mib_debug_mem.c: 240: if (!HexToInt(argv[3], &addr, 32))
      00AB09 16 2E            [ 2]  731 	ldw	y, (0x2e, sp)
      00AB0B 17 26            [ 2]  732 	ldw	(0x26, sp), y
      00AB0D 93               [ 1]  733 	ldw	x, y
      00AB0E EE 06            [ 2]  734 	ldw	x, (0x6, x)
      00AB10 1F 28            [ 2]  735 	ldw	(0x28, sp), x
      00AB12 4B 20            [ 1]  736 	push	#0x20
      00AB14 4B 00            [ 1]  737 	push	#0x00
      00AB16 96               [ 1]  738 	ldw	x, sp
      00AB17 1C 00 03         [ 2]  739 	addw	x, #3
      00AB1A 89               [ 2]  740 	pushw	x
      00AB1B 1E 2C            [ 2]  741 	ldw	x, (0x2c, sp)
      00AB1D CD A2 C3         [ 4]  742 	call	_HexToInt
      00AB20 1F 28            [ 2]  743 	ldw	(0x28, sp), x
      00AB22 26 0D            [ 1]  744 	jrne	00150$
                                    745 ;	./../../mib/stm8s_mib_debug_mem.c: 242: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00AB24 4B 88            [ 1]  746 	push	#<(__str_3+0)
      00AB26 4B 86            [ 1]  747 	push	#((__str_3+0) >> 8)
      00AB28 CD 9F BD         [ 4]  748 	call	_mib_printf
      00AB2B 5B 02            [ 2]  749 	addw	sp, #2
                                    750 ;	./../../mib/stm8s_mib_debug_mem.c: 243: return FALSE;
      00AB2D 5F               [ 1]  751 	clrw	x
      00AB2E CC AE F5         [ 2]  752 	jp	00235$
      00AB31                        753 00150$:
                                    754 ;	./../../mib/stm8s_mib_debug_mem.c: 245: if (!HexToInt(argv[4], &v_Loop, 32))
      00AB31 16 2E            [ 2]  755 	ldw	y, (0x2e, sp)
      00AB33 17 26            [ 2]  756 	ldw	(0x26, sp), y
      00AB35 93               [ 1]  757 	ldw	x, y
      00AB36 EE 08            [ 2]  758 	ldw	x, (0x8, x)
      00AB38 1F 28            [ 2]  759 	ldw	(0x28, sp), x
      00AB3A 4B 20            [ 1]  760 	push	#0x20
      00AB3C 4B 00            [ 1]  761 	push	#0x00
      00AB3E 96               [ 1]  762 	ldw	x, sp
      00AB3F 1C 00 1A         [ 2]  763 	addw	x, #26
      00AB42 89               [ 2]  764 	pushw	x
      00AB43 1E 2C            [ 2]  765 	ldw	x, (0x2c, sp)
      00AB45 CD A2 C3         [ 4]  766 	call	_HexToInt
      00AB48 1F 28            [ 2]  767 	ldw	(0x28, sp), x
      00AB4A 26 0D            [ 1]  768 	jrne	00152$
                                    769 ;	./../../mib/stm8s_mib_debug_mem.c: 247: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00AB4C 4B 88            [ 1]  770 	push	#<(__str_3+0)
      00AB4E 4B 86            [ 1]  771 	push	#((__str_3+0) >> 8)
      00AB50 CD 9F BD         [ 4]  772 	call	_mib_printf
      00AB53 5B 02            [ 2]  773 	addw	sp, #2
                                    774 ;	./../../mib/stm8s_mib_debug_mem.c: 248: return FALSE;
      00AB55 5F               [ 1]  775 	clrw	x
      00AB56 CC AE F5         [ 2]  776 	jp	00235$
      00AB59                        777 00152$:
                                    778 ;	./../../mib/stm8s_mib_debug_mem.c: 250: ccprintf(_DEBUG_CMD_A_,("\taddress : 0x%08lx  ", addr));
      00AB59 1E 03            [ 2]  779 	ldw	x, (0x03, sp)
      00AB5B 89               [ 2]  780 	pushw	x
      00AB5C 1E 03            [ 2]  781 	ldw	x, (0x03, sp)
      00AB5E 89               [ 2]  782 	pushw	x
      00AB5F 4B C8            [ 1]  783 	push	#<(__str_6+0)
      00AB61 4B 86            [ 1]  784 	push	#((__str_6+0) >> 8)
      00AB63 CD 9F BD         [ 4]  785 	call	_mib_printf
      00AB66 5B 06            [ 2]  786 	addw	sp, #6
                                    787 ;	./../../mib/stm8s_mib_debug_mem.c: 251: ccprintf(_DEBUG_CMD_A_,("loop : 0x%08lx  \r\n", v_Loop));
      00AB68 1E 1A            [ 2]  788 	ldw	x, (0x1a, sp)
      00AB6A 89               [ 2]  789 	pushw	x
      00AB6B 1E 1A            [ 2]  790 	ldw	x, (0x1a, sp)
      00AB6D 89               [ 2]  791 	pushw	x
      00AB6E 4B 15            [ 1]  792 	push	#<(__str_15+0)
      00AB70 4B 87            [ 1]  793 	push	#((__str_15+0) >> 8)
      00AB72 CD 9F BD         [ 4]  794 	call	_mib_printf
      00AB75 5B 06            [ 2]  795 	addw	sp, #6
                                    796 ;	./../../mib/stm8s_mib_debug_mem.c: 252: ccprintf(_DEBUG_CMD_A_, ("value   : "));
      00AB77 4B 28            [ 1]  797 	push	#<(__str_16+0)
      00AB79 4B 87            [ 1]  798 	push	#((__str_16+0) >> 8)
      00AB7B CD 9F BD         [ 4]  799 	call	_mib_printf
      00AB7E 5B 02            [ 2]  800 	addw	sp, #2
                                    801 ;	./../../mib/stm8s_mib_debug_mem.c: 253: switch (argv[2][0])
      00AB80 16 2E            [ 2]  802 	ldw	y, (0x2e, sp)
      00AB82 17 26            [ 2]  803 	ldw	(0x26, sp), y
      00AB84 93               [ 1]  804 	ldw	x, y
      00AB85 EE 04            [ 2]  805 	ldw	x, (0x4, x)
      00AB87 1F 28            [ 2]  806 	ldw	(0x28, sp), x
      00AB89 F6               [ 1]  807 	ld	a, (x)
      00AB8A A1 63            [ 1]  808 	cp	a, #0x63
      00AB8C 27 0E            [ 1]  809 	jreq	00278$
      00AB8E A1 6C            [ 1]  810 	cp	a, #0x6c
      00AB90 26 03            [ 1]  811 	jrne	00621$
      00AB92 CC AC 41         [ 2]  812 	jp	00284$
      00AB95                        813 00621$:
      00AB95 A1 73            [ 1]  814 	cp	a, #0x73
      00AB97 27 59            [ 1]  815 	jreq	00281$
      00AB99 CC AC 9B         [ 2]  816 	jp	00165$
                                    817 ;	./../../mib/stm8s_mib_debug_mem.c: 255: case 'c':
      00AB9C                        818 00278$:
      00AB9C 16 1A            [ 2]  819 	ldw	y, (0x1a, sp)
      00AB9E 17 28            [ 2]  820 	ldw	(0x28, sp), y
      00ABA0 16 18            [ 2]  821 	ldw	y, (0x18, sp)
      00ABA2 17 26            [ 2]  822 	ldw	(0x26, sp), y
      00ABA4                        823 00227$:
                                    824 ;	./../../mib/stm8s_mib_debug_mem.c: 256: for (; v_Loop; v_Loop--)
      00ABA4 1E 28            [ 2]  825 	ldw	x, (0x28, sp)
      00ABA6 26 07            [ 1]  826 	jrne	00626$
      00ABA8 1E 26            [ 2]  827 	ldw	x, (0x26, sp)
      00ABAA 26 03            [ 1]  828 	jrne	00626$
      00ABAC CC AC A8         [ 2]  829 	jp	00304$
      00ABAF                        830 00626$:
                                    831 ;	./../../mib/stm8s_mib_debug_mem.c: 258: c = rd_ADDR8(addr);
      00ABAF 16 03            [ 2]  832 	ldw	y, (0x03, sp)
      00ABB1 17 22            [ 2]  833 	ldw	(0x22, sp), y
      00ABB3 93               [ 1]  834 	ldw	x, y
      00ABB4 F6               [ 1]  835 	ld	a, (x)
      00ABB5 6B 1F            [ 1]  836 	ld	(0x1f, sp), a
      00ABB7 6B 05            [ 1]  837 	ld	(0x05, sp), a
                                    838 ;	./../../mib/stm8s_mib_debug_mem.c: 259: if ((v_Loop & 0xfffff) == 0)
      00ABB9 16 28            [ 2]  839 	ldw	y, (0x28, sp)
      00ABBB 17 22            [ 2]  840 	ldw	(0x22, sp), y
      00ABBD 7B 27            [ 1]  841 	ld	a, (0x27, sp)
      00ABBF A4 0F            [ 1]  842 	and	a, #0x0f
      00ABC1 6B 21            [ 1]  843 	ld	(0x21, sp), a
      00ABC3 0F 20            [ 1]  844 	clr	(0x20, sp)
      00ABC5 1E 22            [ 2]  845 	ldw	x, (0x22, sp)
      00ABC7 26 11            [ 1]  846 	jrne	00228$
                                    847 ;	./../../mib/stm8s_mib_debug_mem.c: 261: ccprintf(_DEBUG_CMD_A_,("0x%02x ", c));
      00ABC9 1E 20            [ 2]  848 	ldw	x, (0x20, sp)
      00ABCB 26 0D            [ 1]  849 	jrne	00228$
      00ABCD 7B 1F            [ 1]  850 	ld	a, (0x1f, sp)
      00ABCF 97               [ 1]  851 	ld	xl, a
      00ABD0 89               [ 2]  852 	pushw	x
      00ABD1 4B E9            [ 1]  853 	push	#<(__str_8+0)
      00ABD3 4B 86            [ 1]  854 	push	#((__str_8+0) >> 8)
      00ABD5 CD 9F BD         [ 4]  855 	call	_mib_printf
      00ABD8 5B 04            [ 2]  856 	addw	sp, #4
      00ABDA                        857 00228$:
                                    858 ;	./../../mib/stm8s_mib_debug_mem.c: 256: for (; v_Loop; v_Loop--)
      00ABDA 1E 28            [ 2]  859 	ldw	x, (0x28, sp)
      00ABDC 1D 00 01         [ 2]  860 	subw	x, #0x0001
      00ABDF 1F 28            [ 2]  861 	ldw	(0x28, sp), x
      00ABE1 1E 26            [ 2]  862 	ldw	x, (0x26, sp)
      00ABE3 24 01            [ 1]  863 	jrnc	00629$
      00ABE5 5A               [ 2]  864 	decw	x
      00ABE6                        865 00629$:
      00ABE6 1F 26            [ 2]  866 	ldw	(0x26, sp), x
      00ABE8 16 28            [ 2]  867 	ldw	y, (0x28, sp)
      00ABEA 17 1A            [ 2]  868 	ldw	(0x1a, sp), y
      00ABEC 16 26            [ 2]  869 	ldw	y, (0x26, sp)
      00ABEE 17 18            [ 2]  870 	ldw	(0x18, sp), y
      00ABF0 20 B2            [ 2]  871 	jra	00227$
                                    872 ;	./../../mib/stm8s_mib_debug_mem.c: 265: case 's':
      00ABF2                        873 00281$:
      00ABF2 16 1A            [ 2]  874 	ldw	y, (0x1a, sp)
      00ABF4 17 28            [ 2]  875 	ldw	(0x28, sp), y
      00ABF6 16 18            [ 2]  876 	ldw	y, (0x18, sp)
      00ABF8 17 26            [ 2]  877 	ldw	(0x26, sp), y
      00ABFA                        878 00230$:
                                    879 ;	./../../mib/stm8s_mib_debug_mem.c: 266: for (; v_Loop; v_Loop--)
      00ABFA 1E 28            [ 2]  880 	ldw	x, (0x28, sp)
      00ABFC 26 07            [ 1]  881 	jrne	00630$
      00ABFE 1E 26            [ 2]  882 	ldw	x, (0x26, sp)
      00AC00 26 03            [ 1]  883 	jrne	00630$
      00AC02 CC AC B2         [ 2]  884 	jp	00305$
      00AC05                        885 00630$:
                                    886 ;	./../../mib/stm8s_mib_debug_mem.c: 268: s = rd_ADDR16(addr);
      00AC05 1E 03            [ 2]  887 	ldw	x, (0x03, sp)
      00AC07 FE               [ 2]  888 	ldw	x, (x)
      00AC08 1F 1E            [ 2]  889 	ldw	(0x1e, sp), x
      00AC0A 1F 06            [ 2]  890 	ldw	(0x06, sp), x
                                    891 ;	./../../mib/stm8s_mib_debug_mem.c: 269: if ((v_Loop & 0xfffff) == 0)
      00AC0C 16 28            [ 2]  892 	ldw	y, (0x28, sp)
      00AC0E 17 22            [ 2]  893 	ldw	(0x22, sp), y
      00AC10 5F               [ 1]  894 	clrw	x
      00AC11 7B 27            [ 1]  895 	ld	a, (0x27, sp)
      00AC13 A4 0F            [ 1]  896 	and	a, #0x0f
      00AC15 97               [ 1]  897 	ld	xl, a
      00AC16 16 22            [ 2]  898 	ldw	y, (0x22, sp)
      00AC18 26 0F            [ 1]  899 	jrne	00231$
      00AC1A 5D               [ 2]  900 	tnzw	x
      00AC1B 26 0C            [ 1]  901 	jrne	00231$
                                    902 ;	./../../mib/stm8s_mib_debug_mem.c: 271: ccprintf(_DEBUG_CMD_A_,("0x%04x ", s));
      00AC1D 1E 1E            [ 2]  903 	ldw	x, (0x1e, sp)
      00AC1F 89               [ 2]  904 	pushw	x
      00AC20 4B 33            [ 1]  905 	push	#<(__str_17+0)
      00AC22 4B 87            [ 1]  906 	push	#((__str_17+0) >> 8)
      00AC24 CD 9F BD         [ 4]  907 	call	_mib_printf
      00AC27 5B 04            [ 2]  908 	addw	sp, #4
      00AC29                        909 00231$:
                                    910 ;	./../../mib/stm8s_mib_debug_mem.c: 266: for (; v_Loop; v_Loop--)
      00AC29 1E 28            [ 2]  911 	ldw	x, (0x28, sp)
      00AC2B 1D 00 01         [ 2]  912 	subw	x, #0x0001
      00AC2E 1F 28            [ 2]  913 	ldw	(0x28, sp), x
      00AC30 1E 26            [ 2]  914 	ldw	x, (0x26, sp)
      00AC32 24 01            [ 1]  915 	jrnc	00633$
      00AC34 5A               [ 2]  916 	decw	x
      00AC35                        917 00633$:
      00AC35 1F 26            [ 2]  918 	ldw	(0x26, sp), x
      00AC37 16 28            [ 2]  919 	ldw	y, (0x28, sp)
      00AC39 17 1A            [ 2]  920 	ldw	(0x1a, sp), y
      00AC3B 16 26            [ 2]  921 	ldw	y, (0x26, sp)
      00AC3D 17 18            [ 2]  922 	ldw	(0x18, sp), y
      00AC3F 20 B9            [ 2]  923 	jra	00230$
                                    924 ;	./../../mib/stm8s_mib_debug_mem.c: 275: case 'l':
      00AC41                        925 00284$:
      00AC41 16 1A            [ 2]  926 	ldw	y, (0x1a, sp)
      00AC43 17 28            [ 2]  927 	ldw	(0x28, sp), y
      00AC45 16 18            [ 2]  928 	ldw	y, (0x18, sp)
      00AC47 17 26            [ 2]  929 	ldw	(0x26, sp), y
      00AC49                        930 00233$:
                                    931 ;	./../../mib/stm8s_mib_debug_mem.c: 276: for (; v_Loop; v_Loop--)
      00AC49 1E 28            [ 2]  932 	ldw	x, (0x28, sp)
      00AC4B 26 04            [ 1]  933 	jrne	00634$
      00AC4D 1E 26            [ 2]  934 	ldw	x, (0x26, sp)
      00AC4F 27 6B            [ 1]  935 	jreq	00306$
      00AC51                        936 00634$:
                                    937 ;	./../../mib/stm8s_mib_debug_mem.c: 278: l = rd_ADDR32(addr);
      00AC51 1E 03            [ 2]  938 	ldw	x, (0x03, sp)
      00AC53 90 93            [ 1]  939 	ldw	y, x
      00AC55 90 EE 02         [ 2]  940 	ldw	y, (0x2, y)
      00AC58 FE               [ 2]  941 	ldw	x, (x)
      00AC59 1F 1C            [ 2]  942 	ldw	(0x1c, sp), x
      00AC5B 17 0A            [ 2]  943 	ldw	(0x0a, sp), y
      00AC5D 1E 1C            [ 2]  944 	ldw	x, (0x1c, sp)
      00AC5F 1F 08            [ 2]  945 	ldw	(0x08, sp), x
                                    946 ;	./../../mib/stm8s_mib_debug_mem.c: 279: if ((v_Loop & 0xfffff) == 0)
      00AC61 1E 28            [ 2]  947 	ldw	x, (0x28, sp)
      00AC63 1F 22            [ 2]  948 	ldw	(0x22, sp), x
      00AC65 7B 27            [ 1]  949 	ld	a, (0x27, sp)
      00AC67 A4 0F            [ 1]  950 	and	a, #0x0f
      00AC69 6B 21            [ 1]  951 	ld	(0x21, sp), a
      00AC6B 0F 20            [ 1]  952 	clr	(0x20, sp)
      00AC6D 1E 22            [ 2]  953 	ldw	x, (0x22, sp)
      00AC6F 26 12            [ 1]  954 	jrne	00234$
      00AC71 1E 20            [ 2]  955 	ldw	x, (0x20, sp)
      00AC73 26 0E            [ 1]  956 	jrne	00234$
                                    957 ;	./../../mib/stm8s_mib_debug_mem.c: 281: ccprintf(_DEBUG_CMD_A_,("0x%08lx ", l));
      00AC75 90 89            [ 2]  958 	pushw	y
      00AC77 1E 1E            [ 2]  959 	ldw	x, (0x1e, sp)
      00AC79 89               [ 2]  960 	pushw	x
      00AC7A 4B 3B            [ 1]  961 	push	#<(__str_18+0)
      00AC7C 4B 87            [ 1]  962 	push	#((__str_18+0) >> 8)
      00AC7E CD 9F BD         [ 4]  963 	call	_mib_printf
      00AC81 5B 06            [ 2]  964 	addw	sp, #6
      00AC83                        965 00234$:
                                    966 ;	./../../mib/stm8s_mib_debug_mem.c: 276: for (; v_Loop; v_Loop--)
      00AC83 1E 28            [ 2]  967 	ldw	x, (0x28, sp)
      00AC85 1D 00 01         [ 2]  968 	subw	x, #0x0001
      00AC88 1F 28            [ 2]  969 	ldw	(0x28, sp), x
      00AC8A 1E 26            [ 2]  970 	ldw	x, (0x26, sp)
      00AC8C 24 01            [ 1]  971 	jrnc	00637$
      00AC8E 5A               [ 2]  972 	decw	x
      00AC8F                        973 00637$:
      00AC8F 1F 26            [ 2]  974 	ldw	(0x26, sp), x
      00AC91 16 28            [ 2]  975 	ldw	y, (0x28, sp)
      00AC93 17 1A            [ 2]  976 	ldw	(0x1a, sp), y
      00AC95 16 26            [ 2]  977 	ldw	y, (0x26, sp)
      00AC97 17 18            [ 2]  978 	ldw	(0x18, sp), y
      00AC99 20 AE            [ 2]  979 	jra	00233$
                                    980 ;	./../../mib/stm8s_mib_debug_mem.c: 285: default:
      00AC9B                        981 00165$:
                                    982 ;	./../../mib/stm8s_mib_debug_mem.c: 286: ccprintf(_DEBUG_CMD_A_, ("Error.\r\n"));
      00AC9B 4B 00            [ 1]  983 	push	#<(__str_11+0)
      00AC9D 4B 87            [ 1]  984 	push	#((__str_11+0) >> 8)
      00AC9F CD 9F BD         [ 4]  985 	call	_mib_printf
      00ACA2 5B 02            [ 2]  986 	addw	sp, #2
                                    987 ;	./../../mib/stm8s_mib_debug_mem.c: 287: return FALSE;
      00ACA4 5F               [ 1]  988 	clrw	x
      00ACA5 CC AE F5         [ 2]  989 	jp	00235$
                                    990 ;	./../../mib/stm8s_mib_debug_mem.c: 288: }
      00ACA8                        991 00304$:
      00ACA8 16 28            [ 2]  992 	ldw	y, (0x28, sp)
      00ACAA 17 1A            [ 2]  993 	ldw	(0x1a, sp), y
      00ACAC 16 26            [ 2]  994 	ldw	y, (0x26, sp)
      00ACAE 17 18            [ 2]  995 	ldw	(0x18, sp), y
                                    996 ;	./../../mib/stm8s_mib_debug_mem.c: 352: return FALSE;
      00ACB0 20 12            [ 2]  997 	jra	00166$
                                    998 ;	./../../mib/stm8s_mib_debug_mem.c: 288: }
      00ACB2                        999 00305$:
      00ACB2 16 28            [ 2] 1000 	ldw	y, (0x28, sp)
      00ACB4 17 1A            [ 2] 1001 	ldw	(0x1a, sp), y
      00ACB6 16 26            [ 2] 1002 	ldw	y, (0x26, sp)
      00ACB8 17 18            [ 2] 1003 	ldw	(0x18, sp), y
                                   1004 ;	./../../mib/stm8s_mib_debug_mem.c: 352: return FALSE;
      00ACBA 20 08            [ 2] 1005 	jra	00166$
                                   1006 ;	./../../mib/stm8s_mib_debug_mem.c: 288: }
      00ACBC                       1007 00306$:
      00ACBC 16 28            [ 2] 1008 	ldw	y, (0x28, sp)
      00ACBE 17 1A            [ 2] 1009 	ldw	(0x1a, sp), y
      00ACC0 16 26            [ 2] 1010 	ldw	y, (0x26, sp)
      00ACC2 17 18            [ 2] 1011 	ldw	(0x18, sp), y
      00ACC4                       1012 00166$:
                                   1013 ;	./../../mib/stm8s_mib_debug_mem.c: 289: ccprintf(_DEBUG_CMD_A_, (".\r\n"));
      00ACC4 4B 09            [ 1] 1014 	push	#<(__str_12+0)
      00ACC6 4B 87            [ 1] 1015 	push	#((__str_12+0) >> 8)
      00ACC8 CD 9F BD         [ 4] 1016 	call	_mib_printf
      00ACCB 5B 02            [ 2] 1017 	addw	sp, #2
      00ACCD CC AE F3         [ 2] 1018 	jp	00216$
      00ACD0                       1019 00206$:
                                   1020 ;	./../../mib/stm8s_mib_debug_mem.c: 291: else if (!strcmp(argv[1], "hdump")) 	// _CMD_MY_HEXDUMP_
      00ACD0 1E 26            [ 2] 1021 	ldw	x, (0x26, sp)
      00ACD2 FE               [ 2] 1022 	ldw	x, (x)
      00ACD3 4B 44            [ 1] 1023 	push	#<(___str_19+0)
      00ACD5 4B 87            [ 1] 1024 	push	#((___str_19+0) >> 8)
      00ACD7 CD B3 C8         [ 4] 1025 	call	_strcmp
      00ACDA 5D               [ 2] 1026 	tnzw	x
      00ACDB 26 5B            [ 1] 1027 	jrne	00203$
                                   1028 ;	./../../mib/stm8s_mib_debug_mem.c: 293: if (argc < 4)
      00ACDD 1E 2C            [ 2] 1029 	ldw	x, (0x2c, sp)
      00ACDF A3 00 04         [ 2] 1030 	cpw	x, #0x0004
      00ACE2 2E 0B            [ 1] 1031 	jrsge	00168$
                                   1032 ;	./../../mib/stm8s_mib_debug_mem.c: 295: MibWriteDebugString(cptr->usage);
      00ACE4 1E 24            [ 2] 1033 	ldw	x, (0x24, sp)
      00ACE6 EE 04            [ 2] 1034 	ldw	x, (0x4, x)
      00ACE8 CD 95 AB         [ 4] 1035 	call	_MibWriteDebugString
                                   1036 ;	./../../mib/stm8s_mib_debug_mem.c: 296: return FALSE;
      00ACEB 5F               [ 1] 1037 	clrw	x
      00ACEC CC AE F5         [ 2] 1038 	jp	00235$
      00ACEF                       1039 00168$:
                                   1040 ;	./../../mib/stm8s_mib_debug_mem.c: 298: if (!HexToInt(argv[2], &addr, 32) || !HexToInt(argv[3], &len, 32))
      00ACEF 16 2E            [ 2] 1041 	ldw	y, (0x2e, sp)
      00ACF1 90 EE 04         [ 2] 1042 	ldw	y, (0x4, y)
      00ACF4 4B 20            [ 1] 1043 	push	#0x20
      00ACF6 4B 00            [ 1] 1044 	push	#0x00
      00ACF8 96               [ 1] 1045 	ldw	x, sp
      00ACF9 1C 00 03         [ 2] 1046 	addw	x, #3
      00ACFC 89               [ 2] 1047 	pushw	x
      00ACFD 93               [ 1] 1048 	ldw	x, y
      00ACFE CD A2 C3         [ 4] 1049 	call	_HexToInt
      00AD01 5D               [ 2] 1050 	tnzw	x
      00AD02 27 15            [ 1] 1051 	jreq	00169$
      00AD04 16 2E            [ 2] 1052 	ldw	y, (0x2e, sp)
      00AD06 90 EE 06         [ 2] 1053 	ldw	y, (0x6, y)
      00AD09 4B 20            [ 1] 1054 	push	#0x20
      00AD0B 4B 00            [ 1] 1055 	push	#0x00
      00AD0D 96               [ 1] 1056 	ldw	x, sp
      00AD0E 1C 00 16         [ 2] 1057 	addw	x, #22
      00AD11 89               [ 2] 1058 	pushw	x
      00AD12 93               [ 1] 1059 	ldw	x, y
      00AD13 CD A2 C3         [ 4] 1060 	call	_HexToInt
      00AD16 5D               [ 2] 1061 	tnzw	x
      00AD17 26 0D            [ 1] 1062 	jrne	00170$
      00AD19                       1063 00169$:
                                   1064 ;	./../../mib/stm8s_mib_debug_mem.c: 300: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00AD19 4B 88            [ 1] 1065 	push	#<(__str_3+0)
      00AD1B 4B 86            [ 1] 1066 	push	#((__str_3+0) >> 8)
      00AD1D CD 9F BD         [ 4] 1067 	call	_mib_printf
      00AD20 5B 02            [ 2] 1068 	addw	sp, #2
                                   1069 ;	./../../mib/stm8s_mib_debug_mem.c: 301: return FALSE;
      00AD22 5F               [ 1] 1070 	clrw	x
      00AD23 CC AE F5         [ 2] 1071 	jp	00235$
      00AD26                       1072 00170$:
                                   1073 ;	./../../mib/stm8s_mib_debug_mem.c: 303: HexDump(addr, len);		
      00AD26 1E 16            [ 2] 1074 	ldw	x, (0x16, sp)
      00AD28 89               [ 2] 1075 	pushw	x
      00AD29 1E 16            [ 2] 1076 	ldw	x, (0x16, sp)
      00AD2B 89               [ 2] 1077 	pushw	x
      00AD2C 1E 07            [ 2] 1078 	ldw	x, (0x07, sp)
      00AD2E 89               [ 2] 1079 	pushw	x
      00AD2F 1E 07            [ 2] 1080 	ldw	x, (0x07, sp)
      00AD31 89               [ 2] 1081 	pushw	x
      00AD32 CD A4 37         [ 4] 1082 	call	_HexDump
      00AD35 CC AE F3         [ 2] 1083 	jp	00216$
      00AD38                       1084 00203$:
                                   1085 ;	./../../mib/stm8s_mib_debug_mem.c: 305: else if (!strcmp(argv[1], "cpy")) // _CMD_MY_MEMCPY_
      00AD38 1E 26            [ 2] 1086 	ldw	x, (0x26, sp)
      00AD3A FE               [ 2] 1087 	ldw	x, (x)
      00AD3B 4B 4A            [ 1] 1088 	push	#<(___str_20+0)
      00AD3D 4B 87            [ 1] 1089 	push	#((___str_20+0) >> 8)
      00AD3F CD B3 C8         [ 4] 1090 	call	_strcmp
      00AD42 5D               [ 2] 1091 	tnzw	x
      00AD43 26 71            [ 1] 1092 	jrne	00200$
                                   1093 ;	./../../mib/stm8s_mib_debug_mem.c: 307: if (argc < 5)
      00AD45 1E 2C            [ 2] 1094 	ldw	x, (0x2c, sp)
      00AD47 A3 00 05         [ 2] 1095 	cpw	x, #0x0005
      00AD4A 2E 0B            [ 1] 1096 	jrsge	00173$
                                   1097 ;	./../../mib/stm8s_mib_debug_mem.c: 309: MibWriteDebugString(cptr->usage);
      00AD4C 1E 24            [ 2] 1098 	ldw	x, (0x24, sp)
      00AD4E EE 04            [ 2] 1099 	ldw	x, (0x4, x)
      00AD50 CD 95 AB         [ 4] 1100 	call	_MibWriteDebugString
                                   1101 ;	./../../mib/stm8s_mib_debug_mem.c: 310: return FALSE;
      00AD53 5F               [ 1] 1102 	clrw	x
      00AD54 CC AE F5         [ 2] 1103 	jp	00235$
      00AD57                       1104 00173$:
                                   1105 ;	./../../mib/stm8s_mib_debug_mem.c: 312: if (!HexToInt(argv[2], &dest, 32) || !HexToInt(argv[3], &src, 32) || !HexToInt(argv[4], &len, 32))
      00AD57 16 2E            [ 2] 1106 	ldw	y, (0x2e, sp)
      00AD59 90 EE 04         [ 2] 1107 	ldw	y, (0x4, y)
      00AD5C 4B 20            [ 1] 1108 	push	#0x20
      00AD5E 4B 00            [ 1] 1109 	push	#0x00
      00AD60 96               [ 1] 1110 	ldw	x, sp
      00AD61 1C 00 0E         [ 2] 1111 	addw	x, #14
      00AD64 89               [ 2] 1112 	pushw	x
      00AD65 93               [ 1] 1113 	ldw	x, y
      00AD66 CD A2 C3         [ 4] 1114 	call	_HexToInt
      00AD69 5D               [ 2] 1115 	tnzw	x
      00AD6A 27 2A            [ 1] 1116 	jreq	00174$
      00AD6C 16 2E            [ 2] 1117 	ldw	y, (0x2e, sp)
      00AD6E 90 EE 06         [ 2] 1118 	ldw	y, (0x6, y)
      00AD71 4B 20            [ 1] 1119 	push	#0x20
      00AD73 4B 00            [ 1] 1120 	push	#0x00
      00AD75 96               [ 1] 1121 	ldw	x, sp
      00AD76 1C 00 12         [ 2] 1122 	addw	x, #18
      00AD79 89               [ 2] 1123 	pushw	x
      00AD7A 93               [ 1] 1124 	ldw	x, y
      00AD7B CD A2 C3         [ 4] 1125 	call	_HexToInt
      00AD7E 5D               [ 2] 1126 	tnzw	x
      00AD7F 27 15            [ 1] 1127 	jreq	00174$
      00AD81 16 2E            [ 2] 1128 	ldw	y, (0x2e, sp)
      00AD83 90 EE 08         [ 2] 1129 	ldw	y, (0x8, y)
      00AD86 4B 20            [ 1] 1130 	push	#0x20
      00AD88 4B 00            [ 1] 1131 	push	#0x00
      00AD8A 96               [ 1] 1132 	ldw	x, sp
      00AD8B 1C 00 16         [ 2] 1133 	addw	x, #22
      00AD8E 89               [ 2] 1134 	pushw	x
      00AD8F 93               [ 1] 1135 	ldw	x, y
      00AD90 CD A2 C3         [ 4] 1136 	call	_HexToInt
      00AD93 5D               [ 2] 1137 	tnzw	x
      00AD94 26 0D            [ 1] 1138 	jrne	00175$
      00AD96                       1139 00174$:
                                   1140 ;	./../../mib/stm8s_mib_debug_mem.c: 314: ccprintf(_DEBUG_CMD_A_, ("Illegal character is used.\r\n"));
      00AD96 4B 4E            [ 1] 1141 	push	#<(__str_21+0)
      00AD98 4B 87            [ 1] 1142 	push	#((__str_21+0) >> 8)
      00AD9A CD 9F BD         [ 4] 1143 	call	_mib_printf
      00AD9D 5B 02            [ 2] 1144 	addw	sp, #2
                                   1145 ;	./../../mib/stm8s_mib_debug_mem.c: 315: return FALSE;
      00AD9F 5F               [ 1] 1146 	clrw	x
      00ADA0 CC AE F5         [ 2] 1147 	jp	00235$
      00ADA3                       1148 00175$:
                                   1149 ;	./../../mib/stm8s_mib_debug_mem.c: 317: memcpy((char *)dest, (char *)src, len);		
      00ADA3 1E 16            [ 2] 1150 	ldw	x, (0x16, sp)
      00ADA5 16 12            [ 2] 1151 	ldw	y, (0x12, sp)
      00ADA7 17 28            [ 2] 1152 	ldw	(0x28, sp), y
      00ADA9 16 0E            [ 2] 1153 	ldw	y, (0x0e, sp)
      00ADAB 89               [ 2] 1154 	pushw	x
      00ADAC 1E 2A            [ 2] 1155 	ldw	x, (0x2a, sp)
      00ADAE 89               [ 2] 1156 	pushw	x
      00ADAF 93               [ 1] 1157 	ldw	x, y
      00ADB0 CD B3 44         [ 4] 1158 	call	___memcpy
      00ADB3 CC AE F3         [ 2] 1159 	jp	00216$
      00ADB6                       1160 00200$:
                                   1161 ;	./../../mib/stm8s_mib_debug_mem.c: 319: else if (!strcmp(argv[1], "cmp")) // _CMD_MY_MEMCMP_
      00ADB6 1E 26            [ 2] 1162 	ldw	x, (0x26, sp)
      00ADB8 FE               [ 2] 1163 	ldw	x, (x)
      00ADB9 4B 6B            [ 1] 1164 	push	#<(___str_22+0)
      00ADBB 4B 87            [ 1] 1165 	push	#((___str_22+0) >> 8)
      00ADBD CD B3 C8         [ 4] 1166 	call	_strcmp
      00ADC0 5D               [ 2] 1167 	tnzw	x
      00ADC1 27 03            [ 1] 1168 	jreq	00647$
      00ADC3 CC AE 4F         [ 2] 1169 	jp	00197$
      00ADC6                       1170 00647$:
                                   1171 ;	./../../mib/stm8s_mib_debug_mem.c: 321: if (argc < 5)
      00ADC6 1E 2C            [ 2] 1172 	ldw	x, (0x2c, sp)
      00ADC8 A3 00 05         [ 2] 1173 	cpw	x, #0x0005
      00ADCB 2E 0B            [ 1] 1174 	jrsge	00179$
                                   1175 ;	./../../mib/stm8s_mib_debug_mem.c: 323: MibWriteDebugString(cptr->usage);
      00ADCD 1E 24            [ 2] 1176 	ldw	x, (0x24, sp)
      00ADCF EE 04            [ 2] 1177 	ldw	x, (0x4, x)
      00ADD1 CD 95 AB         [ 4] 1178 	call	_MibWriteDebugString
                                   1179 ;	./../../mib/stm8s_mib_debug_mem.c: 324: return FALSE;
      00ADD4 5F               [ 1] 1180 	clrw	x
      00ADD5 CC AE F5         [ 2] 1181 	jp	00235$
      00ADD8                       1182 00179$:
                                   1183 ;	./../../mib/stm8s_mib_debug_mem.c: 326: if (!HexToInt(argv[2], &dest, 32) || !HexToInt(argv[3], &src, 32) || !HexToInt(argv[4], &len, 32))
      00ADD8 16 2E            [ 2] 1184 	ldw	y, (0x2e, sp)
      00ADDA 90 EE 04         [ 2] 1185 	ldw	y, (0x4, y)
      00ADDD 4B 20            [ 1] 1186 	push	#0x20
      00ADDF 4B 00            [ 1] 1187 	push	#0x00
      00ADE1 96               [ 1] 1188 	ldw	x, sp
      00ADE2 1C 00 0E         [ 2] 1189 	addw	x, #14
      00ADE5 89               [ 2] 1190 	pushw	x
      00ADE6 93               [ 1] 1191 	ldw	x, y
      00ADE7 CD A2 C3         [ 4] 1192 	call	_HexToInt
      00ADEA 5D               [ 2] 1193 	tnzw	x
      00ADEB 27 2A            [ 1] 1194 	jreq	00180$
      00ADED 16 2E            [ 2] 1195 	ldw	y, (0x2e, sp)
      00ADEF 90 EE 06         [ 2] 1196 	ldw	y, (0x6, y)
      00ADF2 4B 20            [ 1] 1197 	push	#0x20
      00ADF4 4B 00            [ 1] 1198 	push	#0x00
      00ADF6 96               [ 1] 1199 	ldw	x, sp
      00ADF7 1C 00 12         [ 2] 1200 	addw	x, #18
      00ADFA 89               [ 2] 1201 	pushw	x
      00ADFB 93               [ 1] 1202 	ldw	x, y
      00ADFC CD A2 C3         [ 4] 1203 	call	_HexToInt
      00ADFF 5D               [ 2] 1204 	tnzw	x
      00AE00 27 15            [ 1] 1205 	jreq	00180$
      00AE02 16 2E            [ 2] 1206 	ldw	y, (0x2e, sp)
      00AE04 90 EE 08         [ 2] 1207 	ldw	y, (0x8, y)
      00AE07 4B 20            [ 1] 1208 	push	#0x20
      00AE09 4B 00            [ 1] 1209 	push	#0x00
      00AE0B 96               [ 1] 1210 	ldw	x, sp
      00AE0C 1C 00 16         [ 2] 1211 	addw	x, #22
      00AE0F 89               [ 2] 1212 	pushw	x
      00AE10 93               [ 1] 1213 	ldw	x, y
      00AE11 CD A2 C3         [ 4] 1214 	call	_HexToInt
      00AE14 5D               [ 2] 1215 	tnzw	x
      00AE15 26 0D            [ 1] 1216 	jrne	00181$
      00AE17                       1217 00180$:
                                   1218 ;	./../../mib/stm8s_mib_debug_mem.c: 328: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00AE17 4B 88            [ 1] 1219 	push	#<(__str_3+0)
      00AE19 4B 86            [ 1] 1220 	push	#((__str_3+0) >> 8)
      00AE1B CD 9F BD         [ 4] 1221 	call	_mib_printf
      00AE1E 5B 02            [ 2] 1222 	addw	sp, #2
                                   1223 ;	./../../mib/stm8s_mib_debug_mem.c: 329: return FALSE;
      00AE20 5F               [ 1] 1224 	clrw	x
      00AE21 CC AE F5         [ 2] 1225 	jp	00235$
      00AE24                       1226 00181$:
                                   1227 ;	./../../mib/stm8s_mib_debug_mem.c: 332: if (memcmp((char *)dest, (char *)src, (len)) == 0) ccprintf(_DEBUG_CMD_A_, ("equil.\r\n"));
      00AE24 1E 16            [ 2] 1228 	ldw	x, (0x16, sp)
      00AE26 16 12            [ 2] 1229 	ldw	y, (0x12, sp)
      00AE28 17 28            [ 2] 1230 	ldw	(0x28, sp), y
      00AE2A 16 0E            [ 2] 1231 	ldw	y, (0x0e, sp)
      00AE2C 89               [ 2] 1232 	pushw	x
      00AE2D 1E 2A            [ 2] 1233 	ldw	x, (0x2a, sp)
      00AE2F 89               [ 2] 1234 	pushw	x
      00AE30 93               [ 1] 1235 	ldw	x, y
      00AE31 CD B1 F8         [ 4] 1236 	call	_memcmp
      00AE34 5D               [ 2] 1237 	tnzw	x
      00AE35 26 0C            [ 1] 1238 	jrne	00185$
      00AE37 4B 6F            [ 1] 1239 	push	#<(__str_23+0)
      00AE39 4B 87            [ 1] 1240 	push	#((__str_23+0) >> 8)
      00AE3B CD 9F BD         [ 4] 1241 	call	_mib_printf
      00AE3E 5B 02            [ 2] 1242 	addw	sp, #2
      00AE40 CC AE F3         [ 2] 1243 	jp	00216$
      00AE43                       1244 00185$:
                                   1245 ;	./../../mib/stm8s_mib_debug_mem.c: 333: else ccprintf(_DEBUG_CMD_A_, ("not equil.\r\n"));		
      00AE43 4B 78            [ 1] 1246 	push	#<(__str_24+0)
      00AE45 4B 87            [ 1] 1247 	push	#((__str_24+0) >> 8)
      00AE47 CD 9F BD         [ 4] 1248 	call	_mib_printf
      00AE4A 5B 02            [ 2] 1249 	addw	sp, #2
      00AE4C CC AE F3         [ 2] 1250 	jp	00216$
      00AE4F                       1251 00197$:
                                   1252 ;	./../../mib/stm8s_mib_debug_mem.c: 335: else if (!strcmp(argv[1], "set")) // _CMD_MY_MEMSET_
      00AE4F 1E 26            [ 2] 1253 	ldw	x, (0x26, sp)
      00AE51 FE               [ 2] 1254 	ldw	x, (x)
      00AE52 4B 85            [ 1] 1255 	push	#<(___str_25+0)
      00AE54 4B 87            [ 1] 1256 	push	#((___str_25+0) >> 8)
      00AE56 CD B3 C8         [ 4] 1257 	call	_strcmp
      00AE59 5D               [ 2] 1258 	tnzw	x
      00AE5A 26 71            [ 1] 1259 	jrne	00194$
                                   1260 ;	./../../mib/stm8s_mib_debug_mem.c: 337: if (argc < 5)
      00AE5C 1E 2C            [ 2] 1261 	ldw	x, (0x2c, sp)
      00AE5E A3 00 05         [ 2] 1262 	cpw	x, #0x0005
      00AE61 2E 0B            [ 1] 1263 	jrsge	00188$
                                   1264 ;	./../../mib/stm8s_mib_debug_mem.c: 339: MibWriteDebugString(cptr->usage);
      00AE63 1E 24            [ 2] 1265 	ldw	x, (0x24, sp)
      00AE65 EE 04            [ 2] 1266 	ldw	x, (0x4, x)
      00AE67 CD 95 AB         [ 4] 1267 	call	_MibWriteDebugString
                                   1268 ;	./../../mib/stm8s_mib_debug_mem.c: 340: return FALSE;
      00AE6A 5F               [ 1] 1269 	clrw	x
      00AE6B CC AE F5         [ 2] 1270 	jp	00235$
      00AE6E                       1271 00188$:
                                   1272 ;	./../../mib/stm8s_mib_debug_mem.c: 342: if (!HexToInt(argv[2], &addr, 32) || !HexToInt(argv[3], &c, 8) || !HexToInt(argv[4], &len, 32))
      00AE6E 16 2E            [ 2] 1273 	ldw	y, (0x2e, sp)
      00AE70 90 EE 04         [ 2] 1274 	ldw	y, (0x4, y)
      00AE73 4B 20            [ 1] 1275 	push	#0x20
      00AE75 4B 00            [ 1] 1276 	push	#0x00
      00AE77 96               [ 1] 1277 	ldw	x, sp
      00AE78 1C 00 03         [ 2] 1278 	addw	x, #3
      00AE7B 89               [ 2] 1279 	pushw	x
      00AE7C 93               [ 1] 1280 	ldw	x, y
      00AE7D CD A2 C3         [ 4] 1281 	call	_HexToInt
      00AE80 5D               [ 2] 1282 	tnzw	x
      00AE81 27 2A            [ 1] 1283 	jreq	00189$
      00AE83 16 2E            [ 2] 1284 	ldw	y, (0x2e, sp)
      00AE85 90 EE 06         [ 2] 1285 	ldw	y, (0x6, y)
      00AE88 4B 08            [ 1] 1286 	push	#0x08
      00AE8A 4B 00            [ 1] 1287 	push	#0x00
      00AE8C 96               [ 1] 1288 	ldw	x, sp
      00AE8D 1C 00 07         [ 2] 1289 	addw	x, #7
      00AE90 89               [ 2] 1290 	pushw	x
      00AE91 93               [ 1] 1291 	ldw	x, y
      00AE92 CD A2 C3         [ 4] 1292 	call	_HexToInt
      00AE95 5D               [ 2] 1293 	tnzw	x
      00AE96 27 15            [ 1] 1294 	jreq	00189$
      00AE98 16 2E            [ 2] 1295 	ldw	y, (0x2e, sp)
      00AE9A 90 EE 08         [ 2] 1296 	ldw	y, (0x8, y)
      00AE9D 4B 20            [ 1] 1297 	push	#0x20
      00AE9F 4B 00            [ 1] 1298 	push	#0x00
      00AEA1 96               [ 1] 1299 	ldw	x, sp
      00AEA2 1C 00 16         [ 2] 1300 	addw	x, #22
      00AEA5 89               [ 2] 1301 	pushw	x
      00AEA6 93               [ 1] 1302 	ldw	x, y
      00AEA7 CD A2 C3         [ 4] 1303 	call	_HexToInt
      00AEAA 5D               [ 2] 1304 	tnzw	x
      00AEAB 26 0C            [ 1] 1305 	jrne	00190$
      00AEAD                       1306 00189$:
                                   1307 ;	./../../mib/stm8s_mib_debug_mem.c: 344: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00AEAD 4B 88            [ 1] 1308 	push	#<(__str_3+0)
      00AEAF 4B 86            [ 1] 1309 	push	#((__str_3+0) >> 8)
      00AEB1 CD 9F BD         [ 4] 1310 	call	_mib_printf
      00AEB4 5B 02            [ 2] 1311 	addw	sp, #2
                                   1312 ;	./../../mib/stm8s_mib_debug_mem.c: 345: return FALSE;
      00AEB6 5F               [ 1] 1313 	clrw	x
      00AEB7 20 3C            [ 2] 1314 	jra	00235$
      00AEB9                       1315 00190$:
                                   1316 ;	./../../mib/stm8s_mib_debug_mem.c: 347: memset((void *)addr, c, len);
      00AEB9 1E 16            [ 2] 1317 	ldw	x, (0x16, sp)
      00AEBB 7B 05            [ 1] 1318 	ld	a, (0x05, sp)
      00AEBD 6B 29            [ 1] 1319 	ld	(0x29, sp), a
      00AEBF 0F 28            [ 1] 1320 	clr	(0x28, sp)
      00AEC1 16 03            [ 2] 1321 	ldw	y, (0x03, sp)
      00AEC3 89               [ 2] 1322 	pushw	x
      00AEC4 1E 2A            [ 2] 1323 	ldw	x, (0x2a, sp)
      00AEC6 89               [ 2] 1324 	pushw	x
      00AEC7 93               [ 1] 1325 	ldw	x, y
      00AEC8 CD B3 97         [ 4] 1326 	call	_memset
      00AECB 20 26            [ 2] 1327 	jra	00216$
      00AECD                       1328 00194$:
                                   1329 ;	./../../mib/stm8s_mib_debug_mem.c: 351: MibWriteDebugString(cptr->usage);
      00AECD 1E 24            [ 2] 1330 	ldw	x, (0x24, sp)
      00AECF EE 04            [ 2] 1331 	ldw	x, (0x4, x)
      00AED1 CD 95 AB         [ 4] 1332 	call	_MibWriteDebugString
                                   1333 ;	./../../mib/stm8s_mib_debug_mem.c: 352: return FALSE;
      00AED4 5F               [ 1] 1334 	clrw	x
      00AED5 20 1E            [ 2] 1335 	jra	00235$
      00AED7                       1336 00301$:
      00AED7 16 28            [ 2] 1337 	ldw	y, (0x28, sp)
      00AED9 17 1A            [ 2] 1338 	ldw	(0x1a, sp), y
      00AEDB 16 26            [ 2] 1339 	ldw	y, (0x26, sp)
      00AEDD 17 18            [ 2] 1340 	ldw	(0x18, sp), y
      00AEDF 20 12            [ 2] 1341 	jra	00216$
      00AEE1                       1342 00302$:
      00AEE1 16 28            [ 2] 1343 	ldw	y, (0x28, sp)
      00AEE3 17 1A            [ 2] 1344 	ldw	(0x1a, sp), y
      00AEE5 16 26            [ 2] 1345 	ldw	y, (0x26, sp)
      00AEE7 17 18            [ 2] 1346 	ldw	(0x18, sp), y
      00AEE9 20 08            [ 2] 1347 	jra	00216$
      00AEEB                       1348 00303$:
      00AEEB 16 28            [ 2] 1349 	ldw	y, (0x28, sp)
      00AEED 17 1A            [ 2] 1350 	ldw	(0x1a, sp), y
      00AEEF 16 26            [ 2] 1351 	ldw	y, (0x26, sp)
      00AEF1 17 18            [ 2] 1352 	ldw	(0x18, sp), y
      00AEF3                       1353 00216$:
                                   1354 ;	./../../mib/stm8s_mib_debug_mem.c: 354: return TRUE;
      00AEF3 5F               [ 1] 1355 	clrw	x
      00AEF4 5C               [ 1] 1356 	incw	x
      00AEF5                       1357 00235$:
                                   1358 ;	./../../mib/stm8s_mib_debug_mem.c: 355: }
      00AEF5 16 2A            [ 2] 1359 	ldw	y, (42, sp)
      00AEF7 5B 2F            [ 2] 1360 	addw	sp, #47
      00AEF9 90 FC            [ 2] 1361 	jp	(y)
                                   1362 	.area CODE
                                   1363 	.area CONST
                                   1364 	.area CONST
      00865C                       1365 __str_0:
      00865C 49 4E 46 4F 3A 2B 63  1366 	.ascii "INFO:+cmd_mem..."
             6D 64 5F 6D 65 6D 2E
             2E 2E
      00866C 0D                    1367 	.db 0x0d
      00866D 0A                    1368 	.db 0x0a
      00866E 00                    1369 	.db 0x00
                                   1370 	.area CODE
                                   1371 	.area CONST
      00866F                       1372 __str_1:
      00866F 49 4E 46 4F 3A 2D 63  1373 	.ascii "INFO:-cmd_mem..."
             6D 64 5F 6D 65 6D 2E
             2E 2E
      00867F 0D                    1374 	.db 0x0d
      008680 0A                    1375 	.db 0x0a
      008681 00                    1376 	.db 0x00
                                   1377 	.area CODE
                                   1378 	.area CONST
      008682                       1379 ___str_2:
      008682 77 72 69 74 65        1380 	.ascii "write"
      008687 00                    1381 	.db 0x00
                                   1382 	.area CODE
                                   1383 	.area CONST
      008688                       1384 __str_3:
      008688 49 6C 6C 75 67 61 6C  1385 	.ascii "Illugal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      0086A2 0D                    1386 	.db 0x0d
      0086A3 0A                    1387 	.db 0x0a
      0086A4 00                    1388 	.db 0x00
                                   1389 	.area CODE
                                   1390 	.area CONST
      0086A5                       1391 __str_4:
      0086A5 49 6C 6C 75 67 61 6C  1392 	.ascii "Illugal character is useqd."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 71 64 2E
      0086C0 0D                    1393 	.db 0x0d
      0086C1 0A                    1394 	.db 0x0a
      0086C2 00                    1395 	.db 0x00
                                   1396 	.area CODE
                                   1397 	.area CONST
      0086C3                       1398 ___str_5:
      0086C3 72 65 61 64           1399 	.ascii "read"
      0086C7 00                    1400 	.db 0x00
                                   1401 	.area CODE
                                   1402 	.area CONST
      0086C8                       1403 __str_6:
      0086C8 09                    1404 	.db 0x09
      0086C9 61 64 64 72 65 73 73  1405 	.ascii "address : 0x%08lx  "
             20 3A 20 30 78 25 30
             38 6C 78 20 20
      0086DC 00                    1406 	.db 0x00
                                   1407 	.area CODE
                                   1408 	.area CONST
      0086DD                       1409 __str_7:
      0086DD 09                    1410 	.db 0x09
      0086DE 76 61 6C 75 65 20 20  1411 	.ascii "value   : "
             20 3A 20
      0086E8 00                    1412 	.db 0x00
                                   1413 	.area CODE
                                   1414 	.area CONST
      0086E9                       1415 __str_8:
      0086E9 30 78 25 30 32 78 20  1416 	.ascii "0x%02x "
      0086F0 00                    1417 	.db 0x00
                                   1418 	.area CODE
                                   1419 	.area CONST
      0086F1                       1420 __str_9:
      0086F1 30 78 25 30 34 78     1421 	.ascii "0x%04x"
      0086F7 00                    1422 	.db 0x00
                                   1423 	.area CODE
                                   1424 	.area CONST
      0086F8                       1425 __str_10:
      0086F8 30 78 25 30 38 6C 78  1426 	.ascii "0x%08lx"
      0086FF 00                    1427 	.db 0x00
                                   1428 	.area CODE
                                   1429 	.area CONST
      008700                       1430 __str_11:
      008700 45 72 72 6F 72 2E     1431 	.ascii "Error."
      008706 0D                    1432 	.db 0x0d
      008707 0A                    1433 	.db 0x0a
      008708 00                    1434 	.db 0x00
                                   1435 	.area CODE
                                   1436 	.area CONST
      008709                       1437 __str_12:
      008709 2E                    1438 	.ascii "."
      00870A 0D                    1439 	.db 0x0d
      00870B 0A                    1440 	.db 0x0a
      00870C 00                    1441 	.db 0x00
                                   1442 	.area CODE
                                   1443 	.area CONST
      00870D                       1444 ___str_13:
      00870D 77 72 6E              1445 	.ascii "wrn"
      008710 00                    1446 	.db 0x00
                                   1447 	.area CODE
                                   1448 	.area CONST
      008711                       1449 ___str_14:
      008711 72 64 6E              1450 	.ascii "rdn"
      008714 00                    1451 	.db 0x00
                                   1452 	.area CODE
                                   1453 	.area CONST
      008715                       1454 __str_15:
      008715 6C 6F 6F 70 20 3A 20  1455 	.ascii "loop : 0x%08lx  "
             30 78 25 30 38 6C 78
             20 20
      008725 0D                    1456 	.db 0x0d
      008726 0A                    1457 	.db 0x0a
      008727 00                    1458 	.db 0x00
                                   1459 	.area CODE
                                   1460 	.area CONST
      008728                       1461 __str_16:
      008728 76 61 6C 75 65 20 20  1462 	.ascii "value   : "
             20 3A 20
      008732 00                    1463 	.db 0x00
                                   1464 	.area CODE
                                   1465 	.area CONST
      008733                       1466 __str_17:
      008733 30 78 25 30 34 78 20  1467 	.ascii "0x%04x "
      00873A 00                    1468 	.db 0x00
                                   1469 	.area CODE
                                   1470 	.area CONST
      00873B                       1471 __str_18:
      00873B 30 78 25 30 38 6C 78  1472 	.ascii "0x%08lx "
             20
      008743 00                    1473 	.db 0x00
                                   1474 	.area CODE
                                   1475 	.area CONST
      008744                       1476 ___str_19:
      008744 68 64 75 6D 70        1477 	.ascii "hdump"
      008749 00                    1478 	.db 0x00
                                   1479 	.area CODE
                                   1480 	.area CONST
      00874A                       1481 ___str_20:
      00874A 63 70 79              1482 	.ascii "cpy"
      00874D 00                    1483 	.db 0x00
                                   1484 	.area CODE
                                   1485 	.area CONST
      00874E                       1486 __str_21:
      00874E 49 6C 6C 65 67 61 6C  1487 	.ascii "Illegal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      008768 0D                    1488 	.db 0x0d
      008769 0A                    1489 	.db 0x0a
      00876A 00                    1490 	.db 0x00
                                   1491 	.area CODE
                                   1492 	.area CONST
      00876B                       1493 ___str_22:
      00876B 63 6D 70              1494 	.ascii "cmp"
      00876E 00                    1495 	.db 0x00
                                   1496 	.area CODE
                                   1497 	.area CONST
      00876F                       1498 __str_23:
      00876F 65 71 75 69 6C 2E     1499 	.ascii "equil."
      008775 0D                    1500 	.db 0x0d
      008776 0A                    1501 	.db 0x0a
      008777 00                    1502 	.db 0x00
                                   1503 	.area CODE
                                   1504 	.area CONST
      008778                       1505 __str_24:
      008778 6E 6F 74 20 65 71 75  1506 	.ascii "not equil."
             69 6C 2E
      008782 0D                    1507 	.db 0x0d
      008783 0A                    1508 	.db 0x0a
      008784 00                    1509 	.db 0x00
                                   1510 	.area CODE
                                   1511 	.area CONST
      008785                       1512 ___str_25:
      008785 73 65 74              1513 	.ascii "set"
      008788 00                    1514 	.db 0x00
                                   1515 	.area CODE
                                   1516 	.area CONST
      008789                       1517 ___str_26:
      008789 6D 65 6D              1518 	.ascii "mem"
      00878C 00                    1519 	.db 0x00
                                   1520 	.area CODE
                                   1521 	.area CONST
      00878D                       1522 ___str_27:
      00878D 20 20 6D 65 6D 20 7B  1523 	.ascii "  mem {cpy}   [dest] [src]   [len] Copy to SDRAM from Flash "
             63 70 79 7D 20 20 20
             5B 64 65 73 74 5D 20
             5B 73 72 63 5D 20 20
             20 5B 6C 65 6E 5D 20
             43 6F 70 79 20 74 6F
             20 53 44 52 41 4D 20
             66 72 6F 6D 20 46 6C
             61 73 68 20
      0087C9 6F 72 20 53 44 52 41  1524 	.ascii "or SDRAM."
             4D 2E
      0087D2 0D                    1525 	.db 0x0d
      0087D3 0A                    1526 	.db 0x0a
      0087D4 20 20 6D 65 6D 20 7B  1527 	.ascii "  mem {cmp}   [add1] [add2]  [len] Compare data in addr1 and"
             63 6D 70 7D 20 20 20
             5B 61 64 64 31 5D 20
             5B 61 64 64 32 5D 20
             20 5B 6C 65 6E 5D 20
             43 6F 6D 70 61 72 65
             20 64 61 74 61 20 69
             6E 20 61 64 64 72 31
             20 61 6E 64
      008810 20 61 64 64 72 32 2E  1528 	.ascii " addr2."
      008817 0D                    1529 	.db 0x0d
      008818 0A                    1530 	.db 0x0a
      008819 20 20 6D 65 6D 20 7B  1531 	.ascii "  mem {set}   [addr] [value] [len] Fill Memory with value."
             73 65 74 7D 20 20 20
             5B 61 64 64 72 5D 20
             5B 76 61 6C 75 65 5D
             20 5B 6C 65 6E 5D 20
             46 69 6C 6C 20 4D 65
             6D 6F 72 79 20 77 69
             74 68 20 76 61 6C 75
             65 2E
      008853 0D                    1532 	.db 0x0d
      008854 0A                    1533 	.db 0x0a
      008855 20 20 6D 65 6D 20 7B  1534 	.ascii "  mem {hdump} [addr] [len]         Dump Memory."
             68 64 75 6D 70 7D 20
             5B 61 64 64 72 5D 20
             5B 6C 65 6E 5D 20 20
             20 20 20 20 20 20 20
             44 75 6D 70 20 4D 65
             6D 6F 72 79 2E
      008884 0D                    1535 	.db 0x0d
      008885 0A                    1536 	.db 0x0a
      008886 20 20 6D 65 6D 20 7B  1537 	.ascii "  mem {wrn} {c/s/l} [addr] [value] [loop]  Wrn in addr. c:8 "
             77 72 6E 7D 20 7B 63
             2F 73 2F 6C 7D 20 5B
             61 64 64 72 5D 20 5B
             76 61 6C 75 65 5D 20
             5B 6C 6F 6F 70 5D 20
             20 57 72 6E 20 69 6E
             20 61 64 64 72 2E 20
             63 3A 38 20
      0088C2 73 3A 31 36 20 6C 3A  1538 	.ascii "s:16 l:32 bits."
             33 32 20 62 69 74 73
             2E
      0088D1 0D                    1539 	.db 0x0d
      0088D2 0A                    1540 	.db 0x0a
      0088D3 20 20 6D 65 6D 20 7B  1541 	.ascii "  mem {rdn}  {c/s/l} [addr] [loop]   Rdn in addr. c:8 s:16 l"
             72 64 6E 7D 20 20 7B
             63 2F 73 2F 6C 7D 20
             5B 61 64 64 72 5D 20
             5B 6C 6F 6F 70 5D 20
             20 20 52 64 6E 20 69
             6E 20 61 64 64 72 2E
             20 63 3A 38 20 73 3A
             31 36 20 6C
      00890F 3A 33 32 20 62 69 74  1542 	.ascii ":32 bits."
             73 2E
      008918 0D                    1543 	.db 0x0d
      008919 0A                    1544 	.db 0x0a
      00891A 20 20 6D 65 6D 20 7B  1545 	.ascii "  mem {write} {c/s/l} [addr] [value]  Write in addr. c:8 s:1"
             77 72 69 74 65 7D 20
             7B 63 2F 73 2F 6C 7D
             20 5B 61 64 64 72 5D
             20 5B 76 61 6C 75 65
             5D 20 20 57 72 69 74
             65 20 69 6E 20 61 64
             64 72 2E 20 63 3A 38
             20 73 3A 31
      008956 36 20 6C 3A 33 32 20  1546 	.ascii "6 l:32 bits."
             62 69 74 73 2E
      008962 0D                    1547 	.db 0x0d
      008963 0A                    1548 	.db 0x0a
      008964 20 20 6D 65 6D 20 7B  1549 	.ascii "  mem {read}  {c/s/l} [addr]          Read in addr. c:8 s:16"
             72 65 61 64 7D 20 20
             7B 63 2F 73 2F 6C 7D
             20 5B 61 64 64 72 5D
             20 20 20 20 20 20 20
             20 20 20 52 65 61 64
             20 69 6E 20 61 64 64
             72 2E 20 63 3A 38 20
             73 3A 31 36
      0089A0 20 6C 3A 33 32 20 62  1550 	.ascii " l:32 bits."
             69 74 73 2E
      0089AB 0D                    1551 	.db 0x0d
      0089AC 0A                    1552 	.db 0x0a
      0089AD 00                    1553 	.db 0x00
                                   1554 	.area CODE
                                   1555 	.area INITIALIZER
      008BD3                       1556 __xinit__cmdTbl_only:
      008BD3 87 89                 1557 	.dw ___str_26
      008BD5 A7 80                 1558 	.dw _DoMem
      008BD7 87 8D                 1559 	.dw ___str_27
      008BD9 00 00                 1560 	.dw #0x0000
      008BDB 00 00                 1561 	.dw #0x0000
      008BDD 00 00                 1562 	.dw #0x0000
                                   1563 	.area CABS (ABS)
