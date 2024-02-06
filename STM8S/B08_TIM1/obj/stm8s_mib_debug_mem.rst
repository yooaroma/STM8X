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
                                     59 ;	./../../mib/stm8s_mib_debug_mem.c: 53: void cmd_mem(void)
                                     60 ;	-----------------------------------------
                                     61 ;	 function cmd_mem
                                     62 ;	-----------------------------------------
      00B790                         63 _cmd_mem:
      00B790 52 0A            [ 2]   64 	sub	sp, #10
                                     65 ;	./../../mib/stm8s_mib_debug_mem.c: 59: for (cptr = cmdTbl;; cptr++) 
      00B792 AE 01 5E         [ 2]   66 	ldw	x, #(_cmdTbl+0)
      00B795 1F 01            [ 2]   67 	ldw	(0x01, sp), x
      00B797 5F               [ 1]   68 	clrw	x
      00B798 1F 07            [ 2]   69 	ldw	(0x07, sp), x
      00B79A 1F 05            [ 2]   70 	ldw	(0x05, sp), x
      00B79C 16 01            [ 2]   71 	ldw	y, (0x01, sp)
      00B79E 17 09            [ 2]   72 	ldw	(0x09, sp), y
      00B7A0                         73 00106$:
                                     74 ;	./../../mib/stm8s_mib_debug_mem.c: 61: if(cptr->cmd==0)
      00B7A0 1E 09            [ 2]   75 	ldw	x, (0x09, sp)
      00B7A2 FE               [ 2]   76 	ldw	x, (x)
      00B7A3 1F 03            [ 2]   77 	ldw	(0x03, sp), x
      00B7A5 26 19            [ 1]   78 	jrne	00102$
                                     79 ;	./../../mib/stm8s_mib_debug_mem.c: 63: ccprintf(1,("INFO:+cmd_mem...\r\n"));
      00B7A7 4B 0A            [ 1]   80 	push	#<(__str_0+0)
      00B7A9 4B 8D            [ 1]   81 	push	#((__str_0+0) >> 8)
      00B7AB CD B0 3B         [ 4]   82 	call	_mib_printf
      00B7AE 5B 02            [ 2]   83 	addw	sp, #2
                                     84 ;	./../../mib/stm8s_mib_debug_mem.c: 64: memcpy((void *)&(cptr->cmd),(void *)&(cmdTbl_only[0].cmd),sizeof(CMD_MY));
      00B7B0 AE 01 82         [ 2]   85 	ldw	x, #_cmdTbl_only+0
      00B7B3 16 01            [ 2]   86 	ldw	y, (0x01, sp)
      00B7B5 4B 06            [ 1]   87 	push	#0x06
      00B7B7 4B 00            [ 1]   88 	push	#0x00
      00B7B9 89               [ 2]   89 	pushw	x
      00B7BA 93               [ 1]   90 	ldw	x, y
      00B7BB CD C2 B0         [ 4]   91 	call	___memcpy
                                     92 ;	./../../mib/stm8s_mib_debug_mem.c: 65: break;
      00B7BE 20 2F            [ 2]   93 	jra	00105$
      00B7C0                         94 00102$:
                                     95 ;	./../../mib/stm8s_mib_debug_mem.c: 67: index++;
      00B7C0 1E 07            [ 2]   96 	ldw	x, (0x07, sp)
      00B7C2 5C               [ 1]   97 	incw	x
      00B7C3 1F 07            [ 2]   98 	ldw	(0x07, sp), x
      00B7C5 26 05            [ 1]   99 	jrne	00126$
      00B7C7 1E 05            [ 2]  100 	ldw	x, (0x05, sp)
      00B7C9 5C               [ 1]  101 	incw	x
      00B7CA 1F 05            [ 2]  102 	ldw	(0x05, sp), x
      00B7CC                        103 00126$:
                                    104 ;	./../../mib/stm8s_mib_debug_mem.c: 68: if(index>MAX_COMMANDS)
      00B7CC AE 00 06         [ 2]  105 	ldw	x, #0x0006
      00B7CF 13 07            [ 2]  106 	cpw	x, (0x07, sp)
      00B7D1 4F               [ 1]  107 	clr	a
      00B7D2 12 06            [ 1]  108 	sbc	a, (0x06, sp)
      00B7D4 4F               [ 1]  109 	clr	a
      00B7D5 12 05            [ 1]  110 	sbc	a, (0x05, sp)
      00B7D7 24 0B            [ 1]  111 	jrnc	00107$
                                    112 ;	./../../mib/stm8s_mib_debug_mem.c: 70: ccprintf(1,("INFO:-cmd_mem...\r\n"));
      00B7D9 4B 1D            [ 1]  113 	push	#<(__str_1+0)
      00B7DB 4B 8D            [ 1]  114 	push	#((__str_1+0) >> 8)
      00B7DD CD B0 3B         [ 4]  115 	call	_mib_printf
      00B7E0 5B 02            [ 2]  116 	addw	sp, #2
                                    117 ;	./../../mib/stm8s_mib_debug_mem.c: 71: return;
      00B7E2 20 0B            [ 2]  118 	jra	00108$
      00B7E4                        119 00107$:
                                    120 ;	./../../mib/stm8s_mib_debug_mem.c: 59: for (cptr = cmdTbl;; cptr++) 
      00B7E4 1E 09            [ 2]  121 	ldw	x, (0x09, sp)
      00B7E6 1C 00 06         [ 2]  122 	addw	x, #0x0006
      00B7E9 1F 09            [ 2]  123 	ldw	(0x09, sp), x
      00B7EB 1F 01            [ 2]  124 	ldw	(0x01, sp), x
      00B7ED 20 B1            [ 2]  125 	jra	00106$
      00B7EF                        126 00105$:
                                    127 ;	./../../mib/stm8s_mib_debug_mem.c: 74: return;
      00B7EF                        128 00108$:
                                    129 ;	./../../mib/stm8s_mib_debug_mem.c: 75: }
      00B7EF 5B 0A            [ 2]  130 	addw	sp, #10
      00B7F1 81               [ 4]  131 	ret
                                    132 ;	./../../mib/stm8s_mib_debug_mem.c: 85: static int DoMem(CMD_MY *cptr, int argc, char **argv)
                                    133 ;	-----------------------------------------
                                    134 ;	 function DoMem
                                    135 ;	-----------------------------------------
      00B7F2                        136 _DoMem:
      00B7F2 52 29            [ 2]  137 	sub	sp, #41
      00B7F4 1F 24            [ 2]  138 	ldw	(0x24, sp), x
                                    139 ;	./../../mib/stm8s_mib_debug_mem.c: 87: uint32_t addr = 0;
      00B7F6 5F               [ 1]  140 	clrw	x
      00B7F7 1F 03            [ 2]  141 	ldw	(0x03, sp), x
      00B7F9 1F 01            [ 2]  142 	ldw	(0x01, sp), x
                                    143 ;	./../../mib/stm8s_mib_debug_mem.c: 99: if (argc < 3)
      00B7FB 1E 2C            [ 2]  144 	ldw	x, (0x2c, sp)
      00B7FD A3 00 03         [ 2]  145 	cpw	x, #0x0003
      00B800 2E 0B            [ 1]  146 	jrsge	00102$
                                    147 ;	./../../mib/stm8s_mib_debug_mem.c: 101: MibWriteDebugString(cptr->usage);
      00B802 1E 24            [ 2]  148 	ldw	x, (0x24, sp)
      00B804 EE 04            [ 2]  149 	ldw	x, (0x4, x)
      00B806 CD A6 1F         [ 4]  150 	call	_MibWriteDebugString
                                    151 ;	./../../mib/stm8s_mib_debug_mem.c: 102: return FALSE;
      00B809 5F               [ 1]  152 	clrw	x
      00B80A CC BF 67         [ 2]  153 	jp	00235$
      00B80D                        154 00102$:
                                    155 ;	./../../mib/stm8s_mib_debug_mem.c: 104: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      00B80D 1E 2E            [ 2]  156 	ldw	x, (0x2e, sp)
      00B80F 5C               [ 1]  157 	incw	x
      00B810 5C               [ 1]  158 	incw	x
      00B811 1F 26            [ 2]  159 	ldw	(0x26, sp), x
      00B813 FE               [ 2]  160 	ldw	x, (x)
      00B814 4B 30            [ 1]  161 	push	#<(___str_2+0)
      00B816 4B 8D            [ 1]  162 	push	#((___str_2+0) >> 8)
      00B818 CD C3 34         [ 4]  163 	call	_strcmp
      00B81B 5D               [ 2]  164 	tnzw	x
      00B81C 27 03            [ 1]  165 	jreq	00564$
      00B81E CC B8 F4         [ 2]  166 	jp	00215$
      00B821                        167 00564$:
                                    168 ;	./../../mib/stm8s_mib_debug_mem.c: 106: if (argc < 5)
      00B821 1E 2C            [ 2]  169 	ldw	x, (0x2c, sp)
      00B823 A3 00 05         [ 2]  170 	cpw	x, #0x0005
      00B826 2E 0B            [ 1]  171 	jrsge	00104$
                                    172 ;	./../../mib/stm8s_mib_debug_mem.c: 108: MibWriteDebugString(cptr->usage);
      00B828 1E 24            [ 2]  173 	ldw	x, (0x24, sp)
      00B82A EE 04            [ 2]  174 	ldw	x, (0x4, x)
      00B82C CD A6 1F         [ 4]  175 	call	_MibWriteDebugString
                                    176 ;	./../../mib/stm8s_mib_debug_mem.c: 109: return FALSE;
      00B82F 5F               [ 1]  177 	clrw	x
      00B830 CC BF 67         [ 2]  178 	jp	00235$
      00B833                        179 00104$:
                                    180 ;	./../../mib/stm8s_mib_debug_mem.c: 111: if (!HexToInt(argv[3], &addr, 32))
      00B833 96               [ 1]  181 	ldw	x, sp
      00B834 5C               [ 1]  182 	incw	x
      00B835 51               [ 1]  183 	exgw	x, y
      00B836 1E 2E            [ 2]  184 	ldw	x, (0x2e, sp)
      00B838 EE 06            [ 2]  185 	ldw	x, (0x6, x)
      00B83A 4B 20            [ 1]  186 	push	#0x20
      00B83C 4B 00            [ 1]  187 	push	#0x00
      00B83E 90 89            [ 2]  188 	pushw	y
      00B840 CD B3 35         [ 4]  189 	call	_HexToInt
      00B843 5D               [ 2]  190 	tnzw	x
      00B844 26 0D            [ 1]  191 	jrne	00106$
                                    192 ;	./../../mib/stm8s_mib_debug_mem.c: 113: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00B846 4B 36            [ 1]  193 	push	#<(__str_3+0)
      00B848 4B 8D            [ 1]  194 	push	#((__str_3+0) >> 8)
      00B84A CD B0 3B         [ 4]  195 	call	_mib_printf
      00B84D 5B 02            [ 2]  196 	addw	sp, #2
                                    197 ;	./../../mib/stm8s_mib_debug_mem.c: 114: return FALSE;
      00B84F 5F               [ 1]  198 	clrw	x
      00B850 CC BF 67         [ 2]  199 	jp	00235$
      00B853                        200 00106$:
                                    201 ;	./../../mib/stm8s_mib_debug_mem.c: 117: switch (argv[2][0])
      00B853 1E 2E            [ 2]  202 	ldw	x, (0x2e, sp)
      00B855 EE 04            [ 2]  203 	ldw	x, (0x4, x)
      00B857 F6               [ 1]  204 	ld	a, (x)
      00B858 A1 63            [ 1]  205 	cp	a, #0x63
      00B85A 27 0B            [ 1]  206 	jreq	00107$
      00B85C A1 6C            [ 1]  207 	cp	a, #0x6c
      00B85E 27 5B            [ 1]  208 	jreq	00113$
      00B860 A1 73            [ 1]  209 	cp	a, #0x73
      00B862 27 2D            [ 1]  210 	jreq	00110$
      00B864 CC B8 E9         [ 2]  211 	jp	00116$
                                    212 ;	./../../mib/stm8s_mib_debug_mem.c: 119: case 'c':
      00B867                        213 00107$:
                                    214 ;	./../../mib/stm8s_mib_debug_mem.c: 120: if (!HexToInt(argv[4], &c, 8))
      00B867 96               [ 1]  215 	ldw	x, sp
      00B868 1C 00 05         [ 2]  216 	addw	x, #5
      00B86B 51               [ 1]  217 	exgw	x, y
      00B86C 1E 2E            [ 2]  218 	ldw	x, (0x2e, sp)
      00B86E EE 08            [ 2]  219 	ldw	x, (0x8, x)
      00B870 4B 08            [ 1]  220 	push	#0x08
      00B872 4B 00            [ 1]  221 	push	#0x00
      00B874 90 89            [ 2]  222 	pushw	y
      00B876 CD B3 35         [ 4]  223 	call	_HexToInt
      00B879 5D               [ 2]  224 	tnzw	x
      00B87A 26 0D            [ 1]  225 	jrne	00109$
                                    226 ;	./../../mib/stm8s_mib_debug_mem.c: 122: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00B87C 4B 36            [ 1]  227 	push	#<(__str_3+0)
      00B87E 4B 8D            [ 1]  228 	push	#((__str_3+0) >> 8)
      00B880 CD B0 3B         [ 4]  229 	call	_mib_printf
      00B883 5B 02            [ 2]  230 	addw	sp, #2
                                    231 ;	./../../mib/stm8s_mib_debug_mem.c: 123: return FALSE;
      00B885 5F               [ 1]  232 	clrw	x
      00B886 CC BF 67         [ 2]  233 	jp	00235$
      00B889                        234 00109$:
                                    235 ;	./../../mib/stm8s_mib_debug_mem.c: 125: wr_ADDR8(addr, c);
      00B889 1E 03            [ 2]  236 	ldw	x, (0x03, sp)
      00B88B 7B 05            [ 1]  237 	ld	a, (0x05, sp)
      00B88D F7               [ 1]  238 	ld	(x), a
                                    239 ;	./../../mib/stm8s_mib_debug_mem.c: 126: break;
      00B88E CC BF 65         [ 2]  240 	jp	00216$
                                    241 ;	./../../mib/stm8s_mib_debug_mem.c: 127: case 's':
      00B891                        242 00110$:
                                    243 ;	./../../mib/stm8s_mib_debug_mem.c: 128: if (!HexToInt(argv[4], &s, 16))
      00B891 96               [ 1]  244 	ldw	x, sp
      00B892 1C 00 06         [ 2]  245 	addw	x, #6
      00B895 51               [ 1]  246 	exgw	x, y
      00B896 1E 2E            [ 2]  247 	ldw	x, (0x2e, sp)
      00B898 EE 08            [ 2]  248 	ldw	x, (0x8, x)
      00B89A 4B 10            [ 1]  249 	push	#0x10
      00B89C 4B 00            [ 1]  250 	push	#0x00
      00B89E 90 89            [ 2]  251 	pushw	y
      00B8A0 CD B3 35         [ 4]  252 	call	_HexToInt
      00B8A3 5D               [ 2]  253 	tnzw	x
      00B8A4 26 0D            [ 1]  254 	jrne	00112$
                                    255 ;	./../../mib/stm8s_mib_debug_mem.c: 130: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00B8A6 4B 36            [ 1]  256 	push	#<(__str_3+0)
      00B8A8 4B 8D            [ 1]  257 	push	#((__str_3+0) >> 8)
      00B8AA CD B0 3B         [ 4]  258 	call	_mib_printf
      00B8AD 5B 02            [ 2]  259 	addw	sp, #2
                                    260 ;	./../../mib/stm8s_mib_debug_mem.c: 131: return FALSE;
      00B8AF 5F               [ 1]  261 	clrw	x
      00B8B0 CC BF 67         [ 2]  262 	jp	00235$
      00B8B3                        263 00112$:
                                    264 ;	./../../mib/stm8s_mib_debug_mem.c: 133: wr_ADDR16(addr, s);
      00B8B3 1E 03            [ 2]  265 	ldw	x, (0x03, sp)
      00B8B5 16 06            [ 2]  266 	ldw	y, (0x06, sp)
      00B8B7 FF               [ 2]  267 	ldw	(x), y
                                    268 ;	./../../mib/stm8s_mib_debug_mem.c: 134: break;
      00B8B8 CC BF 65         [ 2]  269 	jp	00216$
                                    270 ;	./../../mib/stm8s_mib_debug_mem.c: 135: case 'l':
      00B8BB                        271 00113$:
                                    272 ;	./../../mib/stm8s_mib_debug_mem.c: 136: if (!HexToInt(argv[4], &l, 32))
      00B8BB 96               [ 1]  273 	ldw	x, sp
      00B8BC 1C 00 08         [ 2]  274 	addw	x, #8
      00B8BF 51               [ 1]  275 	exgw	x, y
      00B8C0 1E 2E            [ 2]  276 	ldw	x, (0x2e, sp)
      00B8C2 EE 08            [ 2]  277 	ldw	x, (0x8, x)
      00B8C4 4B 20            [ 1]  278 	push	#0x20
      00B8C6 4B 00            [ 1]  279 	push	#0x00
      00B8C8 90 89            [ 2]  280 	pushw	y
      00B8CA CD B3 35         [ 4]  281 	call	_HexToInt
      00B8CD 5D               [ 2]  282 	tnzw	x
      00B8CE 26 0D            [ 1]  283 	jrne	00115$
                                    284 ;	./../../mib/stm8s_mib_debug_mem.c: 138: ccprintf(_DEBUG_CMD_A_, ("Illugal character is useqd.\r\n"));
      00B8D0 4B 53            [ 1]  285 	push	#<(__str_4+0)
      00B8D2 4B 8D            [ 1]  286 	push	#((__str_4+0) >> 8)
      00B8D4 CD B0 3B         [ 4]  287 	call	_mib_printf
      00B8D7 5B 02            [ 2]  288 	addw	sp, #2
                                    289 ;	./../../mib/stm8s_mib_debug_mem.c: 139: return FALSE;
      00B8D9 5F               [ 1]  290 	clrw	x
      00B8DA CC BF 67         [ 2]  291 	jp	00235$
      00B8DD                        292 00115$:
                                    293 ;	./../../mib/stm8s_mib_debug_mem.c: 141: wr_ADDR32(addr, l);
      00B8DD 1E 03            [ 2]  294 	ldw	x, (0x03, sp)
      00B8DF 16 0A            [ 2]  295 	ldw	y, (0x0a, sp)
      00B8E1 EF 02            [ 2]  296 	ldw	(0x2, x), y
      00B8E3 16 08            [ 2]  297 	ldw	y, (0x08, sp)
      00B8E5 FF               [ 2]  298 	ldw	(x), y
                                    299 ;	./../../mib/stm8s_mib_debug_mem.c: 142: break;
      00B8E6 CC BF 65         [ 2]  300 	jp	00216$
                                    301 ;	./../../mib/stm8s_mib_debug_mem.c: 143: default:
      00B8E9                        302 00116$:
                                    303 ;	./../../mib/stm8s_mib_debug_mem.c: 144: MibWriteDebugString(cptr->usage);
      00B8E9 1E 24            [ 2]  304 	ldw	x, (0x24, sp)
      00B8EB EE 04            [ 2]  305 	ldw	x, (0x4, x)
      00B8ED CD A6 1F         [ 4]  306 	call	_MibWriteDebugString
                                    307 ;	./../../mib/stm8s_mib_debug_mem.c: 145: return FALSE;
      00B8F0 5F               [ 1]  308 	clrw	x
      00B8F1 CC BF 67         [ 2]  309 	jp	00235$
                                    310 ;	./../../mib/stm8s_mib_debug_mem.c: 146: }		
      00B8F4                        311 00215$:
                                    312 ;	./../../mib/stm8s_mib_debug_mem.c: 148: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      00B8F4 1E 26            [ 2]  313 	ldw	x, (0x26, sp)
      00B8F6 FE               [ 2]  314 	ldw	x, (x)
      00B8F7 4B 71            [ 1]  315 	push	#<(___str_5+0)
      00B8F9 4B 8D            [ 1]  316 	push	#((___str_5+0) >> 8)
      00B8FB CD C3 34         [ 4]  317 	call	_strcmp
      00B8FE 5D               [ 2]  318 	tnzw	x
      00B8FF 27 03            [ 1]  319 	jreq	00579$
      00B901 CC B9 B8         [ 2]  320 	jp	00212$
      00B904                        321 00579$:
                                    322 ;	./../../mib/stm8s_mib_debug_mem.c: 150: if (argc < 4)
      00B904 1E 2C            [ 2]  323 	ldw	x, (0x2c, sp)
      00B906 A3 00 04         [ 2]  324 	cpw	x, #0x0004
      00B909 2E 0B            [ 1]  325 	jrsge	00119$
                                    326 ;	./../../mib/stm8s_mib_debug_mem.c: 152: MibWriteDebugString(cptr->usage);
      00B90B 1E 24            [ 2]  327 	ldw	x, (0x24, sp)
      00B90D EE 04            [ 2]  328 	ldw	x, (0x4, x)
      00B90F CD A6 1F         [ 4]  329 	call	_MibWriteDebugString
                                    330 ;	./../../mib/stm8s_mib_debug_mem.c: 153: return FALSE;
      00B912 5F               [ 1]  331 	clrw	x
      00B913 CC BF 67         [ 2]  332 	jp	00235$
      00B916                        333 00119$:
                                    334 ;	./../../mib/stm8s_mib_debug_mem.c: 155: if (!HexToInt(argv[3], &addr, 32))
      00B916 96               [ 1]  335 	ldw	x, sp
      00B917 5C               [ 1]  336 	incw	x
      00B918 51               [ 1]  337 	exgw	x, y
      00B919 1E 2E            [ 2]  338 	ldw	x, (0x2e, sp)
      00B91B EE 06            [ 2]  339 	ldw	x, (0x6, x)
      00B91D 4B 20            [ 1]  340 	push	#0x20
      00B91F 4B 00            [ 1]  341 	push	#0x00
      00B921 90 89            [ 2]  342 	pushw	y
      00B923 CD B3 35         [ 4]  343 	call	_HexToInt
      00B926 5D               [ 2]  344 	tnzw	x
      00B927 26 0D            [ 1]  345 	jrne	00121$
                                    346 ;	./../../mib/stm8s_mib_debug_mem.c: 157: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00B929 4B 36            [ 1]  347 	push	#<(__str_3+0)
      00B92B 4B 8D            [ 1]  348 	push	#((__str_3+0) >> 8)
      00B92D CD B0 3B         [ 4]  349 	call	_mib_printf
      00B930 5B 02            [ 2]  350 	addw	sp, #2
                                    351 ;	./../../mib/stm8s_mib_debug_mem.c: 158: return FALSE;
      00B932 5F               [ 1]  352 	clrw	x
      00B933 CC BF 67         [ 2]  353 	jp	00235$
      00B936                        354 00121$:
                                    355 ;	./../../mib/stm8s_mib_debug_mem.c: 160: ccprintf(_DEBUG_CMD_A_,("\taddress : 0x%08lx  ", addr));
      00B936 1E 03            [ 2]  356 	ldw	x, (0x03, sp)
      00B938 89               [ 2]  357 	pushw	x
      00B939 1E 03            [ 2]  358 	ldw	x, (0x03, sp)
      00B93B 89               [ 2]  359 	pushw	x
      00B93C 4B 76            [ 1]  360 	push	#<(__str_6+0)
      00B93E 4B 8D            [ 1]  361 	push	#((__str_6+0) >> 8)
      00B940 CD B0 3B         [ 4]  362 	call	_mib_printf
      00B943 5B 06            [ 2]  363 	addw	sp, #6
                                    364 ;	./../../mib/stm8s_mib_debug_mem.c: 161: ccprintf(_DEBUG_CMD_A_, ("\tvalue   : "));
      00B945 4B 8B            [ 1]  365 	push	#<(__str_7+0)
      00B947 4B 8D            [ 1]  366 	push	#((__str_7+0) >> 8)
      00B949 CD B0 3B         [ 4]  367 	call	_mib_printf
      00B94C 5B 02            [ 2]  368 	addw	sp, #2
                                    369 ;	./../../mib/stm8s_mib_debug_mem.c: 162: switch (argv[2][0])
      00B94E 1E 2E            [ 2]  370 	ldw	x, (0x2e, sp)
      00B950 EE 04            [ 2]  371 	ldw	x, (0x4, x)
      00B952 F6               [ 1]  372 	ld	a, (x)
      00B953 A1 63            [ 1]  373 	cp	a, #0x63
      00B955 27 0A            [ 1]  374 	jreq	00122$
      00B957 A1 6C            [ 1]  375 	cp	a, #0x6c
      00B959 27 2A            [ 1]  376 	jreq	00124$
      00B95B A1 73            [ 1]  377 	cp	a, #0x73
      00B95D 27 15            [ 1]  378 	jreq	00123$
      00B95F 20 3E            [ 2]  379 	jra	00125$
                                    380 ;	./../../mib/stm8s_mib_debug_mem.c: 164: case 'c':
      00B961                        381 00122$:
                                    382 ;	./../../mib/stm8s_mib_debug_mem.c: 165: c = rd_ADDR8(addr);
      00B961 1E 03            [ 2]  383 	ldw	x, (0x03, sp)
      00B963 F6               [ 1]  384 	ld	a, (x)
      00B964 6B 05            [ 1]  385 	ld	(0x05, sp), a
                                    386 ;	./../../mib/stm8s_mib_debug_mem.c: 166: ccprintf(_DEBUG_CMD_A_,("0x%02x ", c));
      00B966 5F               [ 1]  387 	clrw	x
      00B967 97               [ 1]  388 	ld	xl, a
      00B968 89               [ 2]  389 	pushw	x
      00B969 4B 97            [ 1]  390 	push	#<(__str_8+0)
      00B96B 4B 8D            [ 1]  391 	push	#((__str_8+0) >> 8)
      00B96D CD B0 3B         [ 4]  392 	call	_mib_printf
      00B970 5B 04            [ 2]  393 	addw	sp, #4
                                    394 ;	./../../mib/stm8s_mib_debug_mem.c: 167: break;
      00B972 20 38            [ 2]  395 	jra	00126$
                                    396 ;	./../../mib/stm8s_mib_debug_mem.c: 168: case 's':
      00B974                        397 00123$:
                                    398 ;	./../../mib/stm8s_mib_debug_mem.c: 169: s = rd_ADDR16(addr);
      00B974 1E 03            [ 2]  399 	ldw	x, (0x03, sp)
      00B976 FE               [ 2]  400 	ldw	x, (x)
      00B977 1F 06            [ 2]  401 	ldw	(0x06, sp), x
                                    402 ;	./../../mib/stm8s_mib_debug_mem.c: 170: ccprintf(_DEBUG_CMD_A_,("0x%04x", s));
      00B979 89               [ 2]  403 	pushw	x
      00B97A 4B 9F            [ 1]  404 	push	#<(__str_9+0)
      00B97C 4B 8D            [ 1]  405 	push	#((__str_9+0) >> 8)
      00B97E CD B0 3B         [ 4]  406 	call	_mib_printf
      00B981 5B 04            [ 2]  407 	addw	sp, #4
                                    408 ;	./../../mib/stm8s_mib_debug_mem.c: 171: break;
      00B983 20 27            [ 2]  409 	jra	00126$
                                    410 ;	./../../mib/stm8s_mib_debug_mem.c: 172: case 'l':
      00B985                        411 00124$:
                                    412 ;	./../../mib/stm8s_mib_debug_mem.c: 173: l = rd_ADDR32(addr);
      00B985 1E 03            [ 2]  413 	ldw	x, (0x03, sp)
      00B987 90 93            [ 1]  414 	ldw	y, x
      00B989 90 EE 02         [ 2]  415 	ldw	y, (0x2, y)
      00B98C FE               [ 2]  416 	ldw	x, (x)
      00B98D 17 0A            [ 2]  417 	ldw	(0x0a, sp), y
      00B98F 1F 08            [ 2]  418 	ldw	(0x08, sp), x
                                    419 ;	./../../mib/stm8s_mib_debug_mem.c: 174: ccprintf(_DEBUG_CMD_A_,("0x%08lx", l));
      00B991 90 89            [ 2]  420 	pushw	y
      00B993 89               [ 2]  421 	pushw	x
      00B994 4B A6            [ 1]  422 	push	#<(__str_10+0)
      00B996 4B 8D            [ 1]  423 	push	#((__str_10+0) >> 8)
      00B998 CD B0 3B         [ 4]  424 	call	_mib_printf
      00B99B 5B 06            [ 2]  425 	addw	sp, #6
                                    426 ;	./../../mib/stm8s_mib_debug_mem.c: 175: break;
      00B99D 20 0D            [ 2]  427 	jra	00126$
                                    428 ;	./../../mib/stm8s_mib_debug_mem.c: 176: default:
      00B99F                        429 00125$:
                                    430 ;	./../../mib/stm8s_mib_debug_mem.c: 177: ccprintf(_DEBUG_CMD_A_, ("Error.\r\n"));
      00B99F 4B AE            [ 1]  431 	push	#<(__str_11+0)
      00B9A1 4B 8D            [ 1]  432 	push	#((__str_11+0) >> 8)
      00B9A3 CD B0 3B         [ 4]  433 	call	_mib_printf
      00B9A6 5B 02            [ 2]  434 	addw	sp, #2
                                    435 ;	./../../mib/stm8s_mib_debug_mem.c: 178: return FALSE;
      00B9A8 5F               [ 1]  436 	clrw	x
      00B9A9 CC BF 67         [ 2]  437 	jp	00235$
                                    438 ;	./../../mib/stm8s_mib_debug_mem.c: 179: }
      00B9AC                        439 00126$:
                                    440 ;	./../../mib/stm8s_mib_debug_mem.c: 180: ccprintf(_DEBUG_CMD_A_, (".\r\n"));		
      00B9AC 4B B7            [ 1]  441 	push	#<(__str_12+0)
      00B9AE 4B 8D            [ 1]  442 	push	#((__str_12+0) >> 8)
      00B9B0 CD B0 3B         [ 4]  443 	call	_mib_printf
      00B9B3 5B 02            [ 2]  444 	addw	sp, #2
      00B9B5 CC BF 65         [ 2]  445 	jp	00216$
      00B9B8                        446 00212$:
                                    447 ;	./../../mib/stm8s_mib_debug_mem.c: 182: else if (!strcmp(argv[1], "wrn")) // _CMD_MY_WRITE_
      00B9B8 1E 26            [ 2]  448 	ldw	x, (0x26, sp)
      00B9BA FE               [ 2]  449 	ldw	x, (x)
      00B9BB 4B BB            [ 1]  450 	push	#<(___str_13+0)
      00B9BD 4B 8D            [ 1]  451 	push	#((___str_13+0) >> 8)
      00B9BF CD C3 34         [ 4]  452 	call	_strcmp
      00B9C2 5D               [ 2]  453 	tnzw	x
      00B9C3 27 03            [ 1]  454 	jreq	00591$
      00B9C5 CC BB 4F         [ 2]  455 	jp	00209$
      00B9C8                        456 00591$:
                                    457 ;	./../../mib/stm8s_mib_debug_mem.c: 185: if (argc < 6)
      00B9C8 1E 2C            [ 2]  458 	ldw	x, (0x2c, sp)
      00B9CA A3 00 06         [ 2]  459 	cpw	x, #0x0006
      00B9CD 2E 0B            [ 1]  460 	jrsge	00128$
                                    461 ;	./../../mib/stm8s_mib_debug_mem.c: 187: MibWriteDebugString(cptr->usage);
      00B9CF 1E 24            [ 2]  462 	ldw	x, (0x24, sp)
      00B9D1 EE 04            [ 2]  463 	ldw	x, (0x4, x)
      00B9D3 CD A6 1F         [ 4]  464 	call	_MibWriteDebugString
                                    465 ;	./../../mib/stm8s_mib_debug_mem.c: 188: return FALSE;
      00B9D6 5F               [ 1]  466 	clrw	x
      00B9D7 CC BF 67         [ 2]  467 	jp	00235$
      00B9DA                        468 00128$:
                                    469 ;	./../../mib/stm8s_mib_debug_mem.c: 190: if (!HexToInt(argv[3], &addr, 32))
      00B9DA 96               [ 1]  470 	ldw	x, sp
      00B9DB 5C               [ 1]  471 	incw	x
      00B9DC 51               [ 1]  472 	exgw	x, y
      00B9DD 1E 2E            [ 2]  473 	ldw	x, (0x2e, sp)
      00B9DF EE 06            [ 2]  474 	ldw	x, (0x6, x)
      00B9E1 4B 20            [ 1]  475 	push	#0x20
      00B9E3 4B 00            [ 1]  476 	push	#0x00
      00B9E5 90 89            [ 2]  477 	pushw	y
      00B9E7 CD B3 35         [ 4]  478 	call	_HexToInt
      00B9EA 5D               [ 2]  479 	tnzw	x
      00B9EB 26 0D            [ 1]  480 	jrne	00130$
                                    481 ;	./../../mib/stm8s_mib_debug_mem.c: 192: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00B9ED 4B 36            [ 1]  482 	push	#<(__str_3+0)
      00B9EF 4B 8D            [ 1]  483 	push	#((__str_3+0) >> 8)
      00B9F1 CD B0 3B         [ 4]  484 	call	_mib_printf
      00B9F4 5B 02            [ 2]  485 	addw	sp, #2
                                    486 ;	./../../mib/stm8s_mib_debug_mem.c: 193: return FALSE;
      00B9F6 5F               [ 1]  487 	clrw	x
      00B9F7 CC BF 67         [ 2]  488 	jp	00235$
      00B9FA                        489 00130$:
                                    490 ;	./../../mib/stm8s_mib_debug_mem.c: 195: if (!HexToInt(argv[5], &v_Loop, 32))
      00B9FA 96               [ 1]  491 	ldw	x, sp
      00B9FB 1C 00 18         [ 2]  492 	addw	x, #24
      00B9FE 51               [ 1]  493 	exgw	x, y
      00B9FF 1E 2E            [ 2]  494 	ldw	x, (0x2e, sp)
      00BA01 EE 0A            [ 2]  495 	ldw	x, (0xa, x)
      00BA03 4B 20            [ 1]  496 	push	#0x20
      00BA05 4B 00            [ 1]  497 	push	#0x00
      00BA07 90 89            [ 2]  498 	pushw	y
      00BA09 CD B3 35         [ 4]  499 	call	_HexToInt
      00BA0C 5D               [ 2]  500 	tnzw	x
      00BA0D 26 0D            [ 1]  501 	jrne	00132$
                                    502 ;	./../../mib/stm8s_mib_debug_mem.c: 197: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00BA0F 4B 36            [ 1]  503 	push	#<(__str_3+0)
      00BA11 4B 8D            [ 1]  504 	push	#((__str_3+0) >> 8)
      00BA13 CD B0 3B         [ 4]  505 	call	_mib_printf
      00BA16 5B 02            [ 2]  506 	addw	sp, #2
                                    507 ;	./../../mib/stm8s_mib_debug_mem.c: 198: return FALSE;
      00BA18 5F               [ 1]  508 	clrw	x
      00BA19 CC BF 67         [ 2]  509 	jp	00235$
      00BA1C                        510 00132$:
                                    511 ;	./../../mib/stm8s_mib_debug_mem.c: 200: switch (argv[2][0])
      00BA1C 1E 2E            [ 2]  512 	ldw	x, (0x2e, sp)
      00BA1E EE 04            [ 2]  513 	ldw	x, (0x4, x)
      00BA20 F6               [ 1]  514 	ld	a, (x)
      00BA21 A1 63            [ 1]  515 	cp	a, #0x63
      00BA23 27 0E            [ 1]  516 	jreq	00133$
      00BA25 A1 6C            [ 1]  517 	cp	a, #0x6c
      00BA27 26 03            [ 1]  518 	jrne	00599$
      00BA29 CC BA E0         [ 2]  519 	jp	00141$
      00BA2C                        520 00599$:
      00BA2C A1 73            [ 1]  521 	cp	a, #0x73
      00BA2E 27 55            [ 1]  522 	jreq	00137$
      00BA30 CC BB 3F         [ 2]  523 	jp	00145$
                                    524 ;	./../../mib/stm8s_mib_debug_mem.c: 202: case 'c':
      00BA33                        525 00133$:
                                    526 ;	./../../mib/stm8s_mib_debug_mem.c: 203: if (!HexToInt(argv[4], &c, 8))
      00BA33 96               [ 1]  527 	ldw	x, sp
      00BA34 1C 00 05         [ 2]  528 	addw	x, #5
      00BA37 16 2E            [ 2]  529 	ldw	y, (0x2e, sp)
      00BA39 90 EE 08         [ 2]  530 	ldw	y, (0x8, y)
      00BA3C 4B 08            [ 1]  531 	push	#0x08
      00BA3E 4B 00            [ 1]  532 	push	#0x00
      00BA40 89               [ 2]  533 	pushw	x
      00BA41 93               [ 1]  534 	ldw	x, y
      00BA42 CD B3 35         [ 4]  535 	call	_HexToInt
      00BA45 5D               [ 2]  536 	tnzw	x
      00BA46 26 0D            [ 1]  537 	jrne	00262$
                                    538 ;	./../../mib/stm8s_mib_debug_mem.c: 205: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00BA48 4B 36            [ 1]  539 	push	#<(__str_3+0)
      00BA4A 4B 8D            [ 1]  540 	push	#((__str_3+0) >> 8)
      00BA4C CD B0 3B         [ 4]  541 	call	_mib_printf
      00BA4F 5B 02            [ 2]  542 	addw	sp, #2
                                    543 ;	./../../mib/stm8s_mib_debug_mem.c: 206: return FALSE;
      00BA51 5F               [ 1]  544 	clrw	x
      00BA52 CC BF 67         [ 2]  545 	jp	00235$
      00BA55                        546 00262$:
      00BA55 16 1A            [ 2]  547 	ldw	y, (0x1a, sp)
      00BA57 17 28            [ 2]  548 	ldw	(0x28, sp), y
      00BA59 16 18            [ 2]  549 	ldw	y, (0x18, sp)
      00BA5B 17 26            [ 2]  550 	ldw	(0x26, sp), y
      00BA5D                        551 00218$:
                                    552 ;	./../../mib/stm8s_mib_debug_mem.c: 208: for (; v_Loop; v_Loop--) wr_ADDR8(addr, c);
      00BA5D 1E 28            [ 2]  553 	ldw	x, (0x28, sp)
      00BA5F 26 07            [ 1]  554 	jrne	00605$
      00BA61 1E 26            [ 2]  555 	ldw	x, (0x26, sp)
      00BA63 26 03            [ 1]  556 	jrne	00605$
      00BA65 CC BF 49         [ 2]  557 	jp	00301$
      00BA68                        558 00605$:
      00BA68 1E 03            [ 2]  559 	ldw	x, (0x03, sp)
      00BA6A 7B 05            [ 1]  560 	ld	a, (0x05, sp)
      00BA6C F7               [ 1]  561 	ld	(x), a
      00BA6D 1E 28            [ 2]  562 	ldw	x, (0x28, sp)
      00BA6F 1D 00 01         [ 2]  563 	subw	x, #0x0001
      00BA72 1F 28            [ 2]  564 	ldw	(0x28, sp), x
      00BA74 1E 26            [ 2]  565 	ldw	x, (0x26, sp)
      00BA76 24 01            [ 1]  566 	jrnc	00606$
      00BA78 5A               [ 2]  567 	decw	x
      00BA79                        568 00606$:
      00BA79 1F 26            [ 2]  569 	ldw	(0x26, sp), x
      00BA7B 16 28            [ 2]  570 	ldw	y, (0x28, sp)
      00BA7D 17 1A            [ 2]  571 	ldw	(0x1a, sp), y
      00BA7F 16 26            [ 2]  572 	ldw	y, (0x26, sp)
      00BA81 17 18            [ 2]  573 	ldw	(0x18, sp), y
      00BA83 20 D8            [ 2]  574 	jra	00218$
                                    575 ;	./../../mib/stm8s_mib_debug_mem.c: 210: case 's':
      00BA85                        576 00137$:
                                    577 ;	./../../mib/stm8s_mib_debug_mem.c: 211: if (!HexToInt(argv[4], &s, 16))
      00BA85 16 2E            [ 2]  578 	ldw	y, (0x2e, sp)
      00BA87 17 26            [ 2]  579 	ldw	(0x26, sp), y
      00BA89 93               [ 1]  580 	ldw	x, y
      00BA8A EE 08            [ 2]  581 	ldw	x, (0x8, x)
      00BA8C 1F 28            [ 2]  582 	ldw	(0x28, sp), x
      00BA8E 4B 10            [ 1]  583 	push	#0x10
      00BA90 4B 00            [ 1]  584 	push	#0x00
      00BA92 96               [ 1]  585 	ldw	x, sp
      00BA93 1C 00 08         [ 2]  586 	addw	x, #8
      00BA96 89               [ 2]  587 	pushw	x
      00BA97 1E 2C            [ 2]  588 	ldw	x, (0x2c, sp)
      00BA99 CD B3 35         [ 4]  589 	call	_HexToInt
      00BA9C 1F 28            [ 2]  590 	ldw	(0x28, sp), x
      00BA9E 26 0D            [ 1]  591 	jrne	00265$
                                    592 ;	./../../mib/stm8s_mib_debug_mem.c: 213: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00BAA0 4B 36            [ 1]  593 	push	#<(__str_3+0)
      00BAA2 4B 8D            [ 1]  594 	push	#((__str_3+0) >> 8)
      00BAA4 CD B0 3B         [ 4]  595 	call	_mib_printf
      00BAA7 5B 02            [ 2]  596 	addw	sp, #2
                                    597 ;	./../../mib/stm8s_mib_debug_mem.c: 214: return FALSE;
      00BAA9 5F               [ 1]  598 	clrw	x
      00BAAA CC BF 67         [ 2]  599 	jp	00235$
      00BAAD                        600 00265$:
      00BAAD 16 1A            [ 2]  601 	ldw	y, (0x1a, sp)
      00BAAF 17 28            [ 2]  602 	ldw	(0x28, sp), y
      00BAB1 16 18            [ 2]  603 	ldw	y, (0x18, sp)
      00BAB3 17 26            [ 2]  604 	ldw	(0x26, sp), y
      00BAB5                        605 00221$:
                                    606 ;	./../../mib/stm8s_mib_debug_mem.c: 216: for (; v_Loop; v_Loop--) wr_ADDR16(addr, s);
      00BAB5 1E 28            [ 2]  607 	ldw	x, (0x28, sp)
      00BAB7 26 07            [ 1]  608 	jrne	00608$
      00BAB9 1E 26            [ 2]  609 	ldw	x, (0x26, sp)
      00BABB 26 03            [ 1]  610 	jrne	00608$
      00BABD CC BF 53         [ 2]  611 	jp	00302$
      00BAC0                        612 00608$:
      00BAC0 16 03            [ 2]  613 	ldw	y, (0x03, sp)
      00BAC2 17 22            [ 2]  614 	ldw	(0x22, sp), y
      00BAC4 93               [ 1]  615 	ldw	x, y
      00BAC5 16 06            [ 2]  616 	ldw	y, (0x06, sp)
      00BAC7 FF               [ 2]  617 	ldw	(x), y
      00BAC8 1E 28            [ 2]  618 	ldw	x, (0x28, sp)
      00BACA 1D 00 01         [ 2]  619 	subw	x, #0x0001
      00BACD 1F 28            [ 2]  620 	ldw	(0x28, sp), x
      00BACF 1E 26            [ 2]  621 	ldw	x, (0x26, sp)
      00BAD1 24 01            [ 1]  622 	jrnc	00609$
      00BAD3 5A               [ 2]  623 	decw	x
      00BAD4                        624 00609$:
      00BAD4 1F 26            [ 2]  625 	ldw	(0x26, sp), x
      00BAD6 16 28            [ 2]  626 	ldw	y, (0x28, sp)
      00BAD8 17 1A            [ 2]  627 	ldw	(0x1a, sp), y
      00BADA 16 26            [ 2]  628 	ldw	y, (0x26, sp)
      00BADC 17 18            [ 2]  629 	ldw	(0x18, sp), y
      00BADE 20 D5            [ 2]  630 	jra	00221$
                                    631 ;	./../../mib/stm8s_mib_debug_mem.c: 218: case 'l':
      00BAE0                        632 00141$:
                                    633 ;	./../../mib/stm8s_mib_debug_mem.c: 219: if (!HexToInt(argv[4], &l, 32))
      00BAE0 16 2E            [ 2]  634 	ldw	y, (0x2e, sp)
      00BAE2 17 26            [ 2]  635 	ldw	(0x26, sp), y
      00BAE4 93               [ 1]  636 	ldw	x, y
      00BAE5 EE 08            [ 2]  637 	ldw	x, (0x8, x)
      00BAE7 1F 28            [ 2]  638 	ldw	(0x28, sp), x
      00BAE9 4B 20            [ 1]  639 	push	#0x20
      00BAEB 4B 00            [ 1]  640 	push	#0x00
      00BAED 96               [ 1]  641 	ldw	x, sp
      00BAEE 1C 00 0A         [ 2]  642 	addw	x, #10
      00BAF1 89               [ 2]  643 	pushw	x
      00BAF2 1E 2C            [ 2]  644 	ldw	x, (0x2c, sp)
      00BAF4 CD B3 35         [ 4]  645 	call	_HexToInt
      00BAF7 1F 28            [ 2]  646 	ldw	(0x28, sp), x
      00BAF9 26 0D            [ 1]  647 	jrne	00268$
                                    648 ;	./../../mib/stm8s_mib_debug_mem.c: 221: ccprintf(_DEBUG_CMD_A_, ("Illugal character is useqd.\r\n"));
      00BAFB 4B 53            [ 1]  649 	push	#<(__str_4+0)
      00BAFD 4B 8D            [ 1]  650 	push	#((__str_4+0) >> 8)
      00BAFF CD B0 3B         [ 4]  651 	call	_mib_printf
      00BB02 5B 02            [ 2]  652 	addw	sp, #2
                                    653 ;	./../../mib/stm8s_mib_debug_mem.c: 222: return FALSE;
      00BB04 5F               [ 1]  654 	clrw	x
      00BB05 CC BF 67         [ 2]  655 	jp	00235$
      00BB08                        656 00268$:
      00BB08 16 1A            [ 2]  657 	ldw	y, (0x1a, sp)
      00BB0A 17 28            [ 2]  658 	ldw	(0x28, sp), y
      00BB0C 16 18            [ 2]  659 	ldw	y, (0x18, sp)
      00BB0E 17 26            [ 2]  660 	ldw	(0x26, sp), y
      00BB10                        661 00224$:
                                    662 ;	./../../mib/stm8s_mib_debug_mem.c: 224: for (; v_Loop; v_Loop--) wr_ADDR32(addr, l);
      00BB10 1E 28            [ 2]  663 	ldw	x, (0x28, sp)
      00BB12 26 07            [ 1]  664 	jrne	00611$
      00BB14 1E 26            [ 2]  665 	ldw	x, (0x26, sp)
      00BB16 26 03            [ 1]  666 	jrne	00611$
      00BB18 CC BF 5D         [ 2]  667 	jp	00303$
      00BB1B                        668 00611$:
      00BB1B 16 03            [ 2]  669 	ldw	y, (0x03, sp)
      00BB1D 17 22            [ 2]  670 	ldw	(0x22, sp), y
      00BB1F 93               [ 1]  671 	ldw	x, y
      00BB20 16 0A            [ 2]  672 	ldw	y, (0x0a, sp)
      00BB22 EF 02            [ 2]  673 	ldw	(0x2, x), y
      00BB24 16 08            [ 2]  674 	ldw	y, (0x08, sp)
      00BB26 FF               [ 2]  675 	ldw	(x), y
      00BB27 1E 28            [ 2]  676 	ldw	x, (0x28, sp)
      00BB29 1D 00 01         [ 2]  677 	subw	x, #0x0001
      00BB2C 1F 28            [ 2]  678 	ldw	(0x28, sp), x
      00BB2E 1E 26            [ 2]  679 	ldw	x, (0x26, sp)
      00BB30 24 01            [ 1]  680 	jrnc	00612$
      00BB32 5A               [ 2]  681 	decw	x
      00BB33                        682 00612$:
      00BB33 1F 26            [ 2]  683 	ldw	(0x26, sp), x
      00BB35 16 28            [ 2]  684 	ldw	y, (0x28, sp)
      00BB37 17 1A            [ 2]  685 	ldw	(0x1a, sp), y
      00BB39 16 26            [ 2]  686 	ldw	y, (0x26, sp)
      00BB3B 17 18            [ 2]  687 	ldw	(0x18, sp), y
      00BB3D 20 D1            [ 2]  688 	jra	00224$
                                    689 ;	./../../mib/stm8s_mib_debug_mem.c: 226: default:
      00BB3F                        690 00145$:
                                    691 ;	./../../mib/stm8s_mib_debug_mem.c: 227: MibWriteDebugString(cptr->usage);
      00BB3F 16 24            [ 2]  692 	ldw	y, (0x24, sp)
      00BB41 17 26            [ 2]  693 	ldw	(0x26, sp), y
      00BB43 93               [ 1]  694 	ldw	x, y
      00BB44 EE 04            [ 2]  695 	ldw	x, (0x4, x)
      00BB46 1F 28            [ 2]  696 	ldw	(0x28, sp), x
      00BB48 CD A6 1F         [ 4]  697 	call	_MibWriteDebugString
                                    698 ;	./../../mib/stm8s_mib_debug_mem.c: 228: return FALSE;
      00BB4B 5F               [ 1]  699 	clrw	x
      00BB4C CC BF 67         [ 2]  700 	jp	00235$
                                    701 ;	./../../mib/stm8s_mib_debug_mem.c: 229: }	
      00BB4F                        702 00209$:
                                    703 ;	./../../mib/stm8s_mib_debug_mem.c: 231: else if (!strcmp(argv[1], "rdn")) // _CMD_MY_READ_
      00BB4F 1E 26            [ 2]  704 	ldw	x, (0x26, sp)
      00BB51 FE               [ 2]  705 	ldw	x, (x)
      00BB52 1F 28            [ 2]  706 	ldw	(0x28, sp), x
      00BB54 4B BF            [ 1]  707 	push	#<(___str_14+0)
      00BB56 4B 8D            [ 1]  708 	push	#((___str_14+0) >> 8)
      00BB58 1E 2A            [ 2]  709 	ldw	x, (0x2a, sp)
      00BB5A CD C3 34         [ 4]  710 	call	_strcmp
      00BB5D 1F 28            [ 2]  711 	ldw	(0x28, sp), x
      00BB5F 27 03            [ 1]  712 	jreq	00613$
      00BB61 CC BD 42         [ 2]  713 	jp	00206$
      00BB64                        714 00613$:
                                    715 ;	./../../mib/stm8s_mib_debug_mem.c: 234: if (argc < 5)
      00BB64 1E 2C            [ 2]  716 	ldw	x, (0x2c, sp)
      00BB66 A3 00 05         [ 2]  717 	cpw	x, #0x0005
      00BB69 2E 10            [ 1]  718 	jrsge	00148$
                                    719 ;	./../../mib/stm8s_mib_debug_mem.c: 236: MibWriteDebugString(cptr->usage);
      00BB6B 16 24            [ 2]  720 	ldw	y, (0x24, sp)
      00BB6D 17 26            [ 2]  721 	ldw	(0x26, sp), y
      00BB6F 93               [ 1]  722 	ldw	x, y
      00BB70 EE 04            [ 2]  723 	ldw	x, (0x4, x)
      00BB72 1F 28            [ 2]  724 	ldw	(0x28, sp), x
      00BB74 CD A6 1F         [ 4]  725 	call	_MibWriteDebugString
                                    726 ;	./../../mib/stm8s_mib_debug_mem.c: 237: return FALSE;
      00BB77 5F               [ 1]  727 	clrw	x
      00BB78 CC BF 67         [ 2]  728 	jp	00235$
      00BB7B                        729 00148$:
                                    730 ;	./../../mib/stm8s_mib_debug_mem.c: 239: if (!HexToInt(argv[3], &addr, 32))
      00BB7B 16 2E            [ 2]  731 	ldw	y, (0x2e, sp)
      00BB7D 17 26            [ 2]  732 	ldw	(0x26, sp), y
      00BB7F 93               [ 1]  733 	ldw	x, y
      00BB80 EE 06            [ 2]  734 	ldw	x, (0x6, x)
      00BB82 1F 28            [ 2]  735 	ldw	(0x28, sp), x
      00BB84 4B 20            [ 1]  736 	push	#0x20
      00BB86 4B 00            [ 1]  737 	push	#0x00
      00BB88 96               [ 1]  738 	ldw	x, sp
      00BB89 1C 00 03         [ 2]  739 	addw	x, #3
      00BB8C 89               [ 2]  740 	pushw	x
      00BB8D 1E 2C            [ 2]  741 	ldw	x, (0x2c, sp)
      00BB8F CD B3 35         [ 4]  742 	call	_HexToInt
      00BB92 1F 28            [ 2]  743 	ldw	(0x28, sp), x
      00BB94 26 0D            [ 1]  744 	jrne	00150$
                                    745 ;	./../../mib/stm8s_mib_debug_mem.c: 241: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00BB96 4B 36            [ 1]  746 	push	#<(__str_3+0)
      00BB98 4B 8D            [ 1]  747 	push	#((__str_3+0) >> 8)
      00BB9A CD B0 3B         [ 4]  748 	call	_mib_printf
      00BB9D 5B 02            [ 2]  749 	addw	sp, #2
                                    750 ;	./../../mib/stm8s_mib_debug_mem.c: 242: return FALSE;
      00BB9F 5F               [ 1]  751 	clrw	x
      00BBA0 CC BF 67         [ 2]  752 	jp	00235$
      00BBA3                        753 00150$:
                                    754 ;	./../../mib/stm8s_mib_debug_mem.c: 244: if (!HexToInt(argv[4], &v_Loop, 32))
      00BBA3 16 2E            [ 2]  755 	ldw	y, (0x2e, sp)
      00BBA5 17 26            [ 2]  756 	ldw	(0x26, sp), y
      00BBA7 93               [ 1]  757 	ldw	x, y
      00BBA8 EE 08            [ 2]  758 	ldw	x, (0x8, x)
      00BBAA 1F 28            [ 2]  759 	ldw	(0x28, sp), x
      00BBAC 4B 20            [ 1]  760 	push	#0x20
      00BBAE 4B 00            [ 1]  761 	push	#0x00
      00BBB0 96               [ 1]  762 	ldw	x, sp
      00BBB1 1C 00 1A         [ 2]  763 	addw	x, #26
      00BBB4 89               [ 2]  764 	pushw	x
      00BBB5 1E 2C            [ 2]  765 	ldw	x, (0x2c, sp)
      00BBB7 CD B3 35         [ 4]  766 	call	_HexToInt
      00BBBA 1F 28            [ 2]  767 	ldw	(0x28, sp), x
      00BBBC 26 0D            [ 1]  768 	jrne	00152$
                                    769 ;	./../../mib/stm8s_mib_debug_mem.c: 246: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00BBBE 4B 36            [ 1]  770 	push	#<(__str_3+0)
      00BBC0 4B 8D            [ 1]  771 	push	#((__str_3+0) >> 8)
      00BBC2 CD B0 3B         [ 4]  772 	call	_mib_printf
      00BBC5 5B 02            [ 2]  773 	addw	sp, #2
                                    774 ;	./../../mib/stm8s_mib_debug_mem.c: 247: return FALSE;
      00BBC7 5F               [ 1]  775 	clrw	x
      00BBC8 CC BF 67         [ 2]  776 	jp	00235$
      00BBCB                        777 00152$:
                                    778 ;	./../../mib/stm8s_mib_debug_mem.c: 249: ccprintf(_DEBUG_CMD_A_,("\taddress : 0x%08lx  ", addr));
      00BBCB 1E 03            [ 2]  779 	ldw	x, (0x03, sp)
      00BBCD 89               [ 2]  780 	pushw	x
      00BBCE 1E 03            [ 2]  781 	ldw	x, (0x03, sp)
      00BBD0 89               [ 2]  782 	pushw	x
      00BBD1 4B 76            [ 1]  783 	push	#<(__str_6+0)
      00BBD3 4B 8D            [ 1]  784 	push	#((__str_6+0) >> 8)
      00BBD5 CD B0 3B         [ 4]  785 	call	_mib_printf
      00BBD8 5B 06            [ 2]  786 	addw	sp, #6
                                    787 ;	./../../mib/stm8s_mib_debug_mem.c: 250: ccprintf(_DEBUG_CMD_A_,("loop : 0x%08lx  \r\n", v_Loop));
      00BBDA 1E 1A            [ 2]  788 	ldw	x, (0x1a, sp)
      00BBDC 89               [ 2]  789 	pushw	x
      00BBDD 1E 1A            [ 2]  790 	ldw	x, (0x1a, sp)
      00BBDF 89               [ 2]  791 	pushw	x
      00BBE0 4B C3            [ 1]  792 	push	#<(__str_15+0)
      00BBE2 4B 8D            [ 1]  793 	push	#((__str_15+0) >> 8)
      00BBE4 CD B0 3B         [ 4]  794 	call	_mib_printf
      00BBE7 5B 06            [ 2]  795 	addw	sp, #6
                                    796 ;	./../../mib/stm8s_mib_debug_mem.c: 251: ccprintf(_DEBUG_CMD_A_, ("value   : "));
      00BBE9 4B D6            [ 1]  797 	push	#<(__str_16+0)
      00BBEB 4B 8D            [ 1]  798 	push	#((__str_16+0) >> 8)
      00BBED CD B0 3B         [ 4]  799 	call	_mib_printf
      00BBF0 5B 02            [ 2]  800 	addw	sp, #2
                                    801 ;	./../../mib/stm8s_mib_debug_mem.c: 252: switch (argv[2][0])
      00BBF2 16 2E            [ 2]  802 	ldw	y, (0x2e, sp)
      00BBF4 17 26            [ 2]  803 	ldw	(0x26, sp), y
      00BBF6 93               [ 1]  804 	ldw	x, y
      00BBF7 EE 04            [ 2]  805 	ldw	x, (0x4, x)
      00BBF9 1F 28            [ 2]  806 	ldw	(0x28, sp), x
      00BBFB F6               [ 1]  807 	ld	a, (x)
      00BBFC A1 63            [ 1]  808 	cp	a, #0x63
      00BBFE 27 0E            [ 1]  809 	jreq	00278$
      00BC00 A1 6C            [ 1]  810 	cp	a, #0x6c
      00BC02 26 03            [ 1]  811 	jrne	00621$
      00BC04 CC BC B3         [ 2]  812 	jp	00284$
      00BC07                        813 00621$:
      00BC07 A1 73            [ 1]  814 	cp	a, #0x73
      00BC09 27 59            [ 1]  815 	jreq	00281$
      00BC0B CC BD 0D         [ 2]  816 	jp	00165$
                                    817 ;	./../../mib/stm8s_mib_debug_mem.c: 254: case 'c':
      00BC0E                        818 00278$:
      00BC0E 16 1A            [ 2]  819 	ldw	y, (0x1a, sp)
      00BC10 17 28            [ 2]  820 	ldw	(0x28, sp), y
      00BC12 16 18            [ 2]  821 	ldw	y, (0x18, sp)
      00BC14 17 26            [ 2]  822 	ldw	(0x26, sp), y
      00BC16                        823 00227$:
                                    824 ;	./../../mib/stm8s_mib_debug_mem.c: 255: for (; v_Loop; v_Loop--)
      00BC16 1E 28            [ 2]  825 	ldw	x, (0x28, sp)
      00BC18 26 07            [ 1]  826 	jrne	00626$
      00BC1A 1E 26            [ 2]  827 	ldw	x, (0x26, sp)
      00BC1C 26 03            [ 1]  828 	jrne	00626$
      00BC1E CC BD 1A         [ 2]  829 	jp	00304$
      00BC21                        830 00626$:
                                    831 ;	./../../mib/stm8s_mib_debug_mem.c: 257: c = rd_ADDR8(addr);
      00BC21 16 03            [ 2]  832 	ldw	y, (0x03, sp)
      00BC23 17 22            [ 2]  833 	ldw	(0x22, sp), y
      00BC25 93               [ 1]  834 	ldw	x, y
      00BC26 F6               [ 1]  835 	ld	a, (x)
      00BC27 6B 1F            [ 1]  836 	ld	(0x1f, sp), a
      00BC29 6B 05            [ 1]  837 	ld	(0x05, sp), a
                                    838 ;	./../../mib/stm8s_mib_debug_mem.c: 258: if ((v_Loop & 0xfffff) == 0)
      00BC2B 16 28            [ 2]  839 	ldw	y, (0x28, sp)
      00BC2D 17 22            [ 2]  840 	ldw	(0x22, sp), y
      00BC2F 7B 27            [ 1]  841 	ld	a, (0x27, sp)
      00BC31 A4 0F            [ 1]  842 	and	a, #0x0f
      00BC33 6B 21            [ 1]  843 	ld	(0x21, sp), a
      00BC35 0F 20            [ 1]  844 	clr	(0x20, sp)
      00BC37 1E 22            [ 2]  845 	ldw	x, (0x22, sp)
      00BC39 26 11            [ 1]  846 	jrne	00228$
                                    847 ;	./../../mib/stm8s_mib_debug_mem.c: 260: ccprintf(_DEBUG_CMD_A_,("0x%02x ", c));
      00BC3B 1E 20            [ 2]  848 	ldw	x, (0x20, sp)
      00BC3D 26 0D            [ 1]  849 	jrne	00228$
      00BC3F 7B 1F            [ 1]  850 	ld	a, (0x1f, sp)
      00BC41 97               [ 1]  851 	ld	xl, a
      00BC42 89               [ 2]  852 	pushw	x
      00BC43 4B 97            [ 1]  853 	push	#<(__str_8+0)
      00BC45 4B 8D            [ 1]  854 	push	#((__str_8+0) >> 8)
      00BC47 CD B0 3B         [ 4]  855 	call	_mib_printf
      00BC4A 5B 04            [ 2]  856 	addw	sp, #4
      00BC4C                        857 00228$:
                                    858 ;	./../../mib/stm8s_mib_debug_mem.c: 255: for (; v_Loop; v_Loop--)
      00BC4C 1E 28            [ 2]  859 	ldw	x, (0x28, sp)
      00BC4E 1D 00 01         [ 2]  860 	subw	x, #0x0001
      00BC51 1F 28            [ 2]  861 	ldw	(0x28, sp), x
      00BC53 1E 26            [ 2]  862 	ldw	x, (0x26, sp)
      00BC55 24 01            [ 1]  863 	jrnc	00629$
      00BC57 5A               [ 2]  864 	decw	x
      00BC58                        865 00629$:
      00BC58 1F 26            [ 2]  866 	ldw	(0x26, sp), x
      00BC5A 16 28            [ 2]  867 	ldw	y, (0x28, sp)
      00BC5C 17 1A            [ 2]  868 	ldw	(0x1a, sp), y
      00BC5E 16 26            [ 2]  869 	ldw	y, (0x26, sp)
      00BC60 17 18            [ 2]  870 	ldw	(0x18, sp), y
      00BC62 20 B2            [ 2]  871 	jra	00227$
                                    872 ;	./../../mib/stm8s_mib_debug_mem.c: 264: case 's':
      00BC64                        873 00281$:
      00BC64 16 1A            [ 2]  874 	ldw	y, (0x1a, sp)
      00BC66 17 28            [ 2]  875 	ldw	(0x28, sp), y
      00BC68 16 18            [ 2]  876 	ldw	y, (0x18, sp)
      00BC6A 17 26            [ 2]  877 	ldw	(0x26, sp), y
      00BC6C                        878 00230$:
                                    879 ;	./../../mib/stm8s_mib_debug_mem.c: 265: for (; v_Loop; v_Loop--)
      00BC6C 1E 28            [ 2]  880 	ldw	x, (0x28, sp)
      00BC6E 26 07            [ 1]  881 	jrne	00630$
      00BC70 1E 26            [ 2]  882 	ldw	x, (0x26, sp)
      00BC72 26 03            [ 1]  883 	jrne	00630$
      00BC74 CC BD 24         [ 2]  884 	jp	00305$
      00BC77                        885 00630$:
                                    886 ;	./../../mib/stm8s_mib_debug_mem.c: 267: s = rd_ADDR16(addr);
      00BC77 1E 03            [ 2]  887 	ldw	x, (0x03, sp)
      00BC79 FE               [ 2]  888 	ldw	x, (x)
      00BC7A 1F 1E            [ 2]  889 	ldw	(0x1e, sp), x
      00BC7C 1F 06            [ 2]  890 	ldw	(0x06, sp), x
                                    891 ;	./../../mib/stm8s_mib_debug_mem.c: 268: if ((v_Loop & 0xfffff) == 0)
      00BC7E 16 28            [ 2]  892 	ldw	y, (0x28, sp)
      00BC80 17 22            [ 2]  893 	ldw	(0x22, sp), y
      00BC82 5F               [ 1]  894 	clrw	x
      00BC83 7B 27            [ 1]  895 	ld	a, (0x27, sp)
      00BC85 A4 0F            [ 1]  896 	and	a, #0x0f
      00BC87 97               [ 1]  897 	ld	xl, a
      00BC88 16 22            [ 2]  898 	ldw	y, (0x22, sp)
      00BC8A 26 0F            [ 1]  899 	jrne	00231$
      00BC8C 5D               [ 2]  900 	tnzw	x
      00BC8D 26 0C            [ 1]  901 	jrne	00231$
                                    902 ;	./../../mib/stm8s_mib_debug_mem.c: 270: ccprintf(_DEBUG_CMD_A_,("0x%04x ", s));
      00BC8F 1E 1E            [ 2]  903 	ldw	x, (0x1e, sp)
      00BC91 89               [ 2]  904 	pushw	x
      00BC92 4B E1            [ 1]  905 	push	#<(__str_17+0)
      00BC94 4B 8D            [ 1]  906 	push	#((__str_17+0) >> 8)
      00BC96 CD B0 3B         [ 4]  907 	call	_mib_printf
      00BC99 5B 04            [ 2]  908 	addw	sp, #4
      00BC9B                        909 00231$:
                                    910 ;	./../../mib/stm8s_mib_debug_mem.c: 265: for (; v_Loop; v_Loop--)
      00BC9B 1E 28            [ 2]  911 	ldw	x, (0x28, sp)
      00BC9D 1D 00 01         [ 2]  912 	subw	x, #0x0001
      00BCA0 1F 28            [ 2]  913 	ldw	(0x28, sp), x
      00BCA2 1E 26            [ 2]  914 	ldw	x, (0x26, sp)
      00BCA4 24 01            [ 1]  915 	jrnc	00633$
      00BCA6 5A               [ 2]  916 	decw	x
      00BCA7                        917 00633$:
      00BCA7 1F 26            [ 2]  918 	ldw	(0x26, sp), x
      00BCA9 16 28            [ 2]  919 	ldw	y, (0x28, sp)
      00BCAB 17 1A            [ 2]  920 	ldw	(0x1a, sp), y
      00BCAD 16 26            [ 2]  921 	ldw	y, (0x26, sp)
      00BCAF 17 18            [ 2]  922 	ldw	(0x18, sp), y
      00BCB1 20 B9            [ 2]  923 	jra	00230$
                                    924 ;	./../../mib/stm8s_mib_debug_mem.c: 274: case 'l':
      00BCB3                        925 00284$:
      00BCB3 16 1A            [ 2]  926 	ldw	y, (0x1a, sp)
      00BCB5 17 28            [ 2]  927 	ldw	(0x28, sp), y
      00BCB7 16 18            [ 2]  928 	ldw	y, (0x18, sp)
      00BCB9 17 26            [ 2]  929 	ldw	(0x26, sp), y
      00BCBB                        930 00233$:
                                    931 ;	./../../mib/stm8s_mib_debug_mem.c: 275: for (; v_Loop; v_Loop--)
      00BCBB 1E 28            [ 2]  932 	ldw	x, (0x28, sp)
      00BCBD 26 04            [ 1]  933 	jrne	00634$
      00BCBF 1E 26            [ 2]  934 	ldw	x, (0x26, sp)
      00BCC1 27 6B            [ 1]  935 	jreq	00306$
      00BCC3                        936 00634$:
                                    937 ;	./../../mib/stm8s_mib_debug_mem.c: 277: l = rd_ADDR32(addr);
      00BCC3 1E 03            [ 2]  938 	ldw	x, (0x03, sp)
      00BCC5 90 93            [ 1]  939 	ldw	y, x
      00BCC7 90 EE 02         [ 2]  940 	ldw	y, (0x2, y)
      00BCCA FE               [ 2]  941 	ldw	x, (x)
      00BCCB 1F 1C            [ 2]  942 	ldw	(0x1c, sp), x
      00BCCD 17 0A            [ 2]  943 	ldw	(0x0a, sp), y
      00BCCF 1E 1C            [ 2]  944 	ldw	x, (0x1c, sp)
      00BCD1 1F 08            [ 2]  945 	ldw	(0x08, sp), x
                                    946 ;	./../../mib/stm8s_mib_debug_mem.c: 278: if ((v_Loop & 0xfffff) == 0)
      00BCD3 1E 28            [ 2]  947 	ldw	x, (0x28, sp)
      00BCD5 1F 22            [ 2]  948 	ldw	(0x22, sp), x
      00BCD7 7B 27            [ 1]  949 	ld	a, (0x27, sp)
      00BCD9 A4 0F            [ 1]  950 	and	a, #0x0f
      00BCDB 6B 21            [ 1]  951 	ld	(0x21, sp), a
      00BCDD 0F 20            [ 1]  952 	clr	(0x20, sp)
      00BCDF 1E 22            [ 2]  953 	ldw	x, (0x22, sp)
      00BCE1 26 12            [ 1]  954 	jrne	00234$
      00BCE3 1E 20            [ 2]  955 	ldw	x, (0x20, sp)
      00BCE5 26 0E            [ 1]  956 	jrne	00234$
                                    957 ;	./../../mib/stm8s_mib_debug_mem.c: 280: ccprintf(_DEBUG_CMD_A_,("0x%08lx ", l));
      00BCE7 90 89            [ 2]  958 	pushw	y
      00BCE9 1E 1E            [ 2]  959 	ldw	x, (0x1e, sp)
      00BCEB 89               [ 2]  960 	pushw	x
      00BCEC 4B E9            [ 1]  961 	push	#<(__str_18+0)
      00BCEE 4B 8D            [ 1]  962 	push	#((__str_18+0) >> 8)
      00BCF0 CD B0 3B         [ 4]  963 	call	_mib_printf
      00BCF3 5B 06            [ 2]  964 	addw	sp, #6
      00BCF5                        965 00234$:
                                    966 ;	./../../mib/stm8s_mib_debug_mem.c: 275: for (; v_Loop; v_Loop--)
      00BCF5 1E 28            [ 2]  967 	ldw	x, (0x28, sp)
      00BCF7 1D 00 01         [ 2]  968 	subw	x, #0x0001
      00BCFA 1F 28            [ 2]  969 	ldw	(0x28, sp), x
      00BCFC 1E 26            [ 2]  970 	ldw	x, (0x26, sp)
      00BCFE 24 01            [ 1]  971 	jrnc	00637$
      00BD00 5A               [ 2]  972 	decw	x
      00BD01                        973 00637$:
      00BD01 1F 26            [ 2]  974 	ldw	(0x26, sp), x
      00BD03 16 28            [ 2]  975 	ldw	y, (0x28, sp)
      00BD05 17 1A            [ 2]  976 	ldw	(0x1a, sp), y
      00BD07 16 26            [ 2]  977 	ldw	y, (0x26, sp)
      00BD09 17 18            [ 2]  978 	ldw	(0x18, sp), y
      00BD0B 20 AE            [ 2]  979 	jra	00233$
                                    980 ;	./../../mib/stm8s_mib_debug_mem.c: 284: default:
      00BD0D                        981 00165$:
                                    982 ;	./../../mib/stm8s_mib_debug_mem.c: 285: ccprintf(_DEBUG_CMD_A_, ("Error.\r\n"));
      00BD0D 4B AE            [ 1]  983 	push	#<(__str_11+0)
      00BD0F 4B 8D            [ 1]  984 	push	#((__str_11+0) >> 8)
      00BD11 CD B0 3B         [ 4]  985 	call	_mib_printf
      00BD14 5B 02            [ 2]  986 	addw	sp, #2
                                    987 ;	./../../mib/stm8s_mib_debug_mem.c: 286: return FALSE;
      00BD16 5F               [ 1]  988 	clrw	x
      00BD17 CC BF 67         [ 2]  989 	jp	00235$
                                    990 ;	./../../mib/stm8s_mib_debug_mem.c: 287: }
      00BD1A                        991 00304$:
      00BD1A 16 28            [ 2]  992 	ldw	y, (0x28, sp)
      00BD1C 17 1A            [ 2]  993 	ldw	(0x1a, sp), y
      00BD1E 16 26            [ 2]  994 	ldw	y, (0x26, sp)
      00BD20 17 18            [ 2]  995 	ldw	(0x18, sp), y
                                    996 ;	./../../mib/stm8s_mib_debug_mem.c: 351: return FALSE;
      00BD22 20 12            [ 2]  997 	jra	00166$
                                    998 ;	./../../mib/stm8s_mib_debug_mem.c: 287: }
      00BD24                        999 00305$:
      00BD24 16 28            [ 2] 1000 	ldw	y, (0x28, sp)
      00BD26 17 1A            [ 2] 1001 	ldw	(0x1a, sp), y
      00BD28 16 26            [ 2] 1002 	ldw	y, (0x26, sp)
      00BD2A 17 18            [ 2] 1003 	ldw	(0x18, sp), y
                                   1004 ;	./../../mib/stm8s_mib_debug_mem.c: 351: return FALSE;
      00BD2C 20 08            [ 2] 1005 	jra	00166$
                                   1006 ;	./../../mib/stm8s_mib_debug_mem.c: 287: }
      00BD2E                       1007 00306$:
      00BD2E 16 28            [ 2] 1008 	ldw	y, (0x28, sp)
      00BD30 17 1A            [ 2] 1009 	ldw	(0x1a, sp), y
      00BD32 16 26            [ 2] 1010 	ldw	y, (0x26, sp)
      00BD34 17 18            [ 2] 1011 	ldw	(0x18, sp), y
      00BD36                       1012 00166$:
                                   1013 ;	./../../mib/stm8s_mib_debug_mem.c: 288: ccprintf(_DEBUG_CMD_A_, (".\r\n"));
      00BD36 4B B7            [ 1] 1014 	push	#<(__str_12+0)
      00BD38 4B 8D            [ 1] 1015 	push	#((__str_12+0) >> 8)
      00BD3A CD B0 3B         [ 4] 1016 	call	_mib_printf
      00BD3D 5B 02            [ 2] 1017 	addw	sp, #2
      00BD3F CC BF 65         [ 2] 1018 	jp	00216$
      00BD42                       1019 00206$:
                                   1020 ;	./../../mib/stm8s_mib_debug_mem.c: 290: else if (!strcmp(argv[1], "hdump")) 	// _CMD_MY_HEXDUMP_
      00BD42 1E 26            [ 2] 1021 	ldw	x, (0x26, sp)
      00BD44 FE               [ 2] 1022 	ldw	x, (x)
      00BD45 4B F2            [ 1] 1023 	push	#<(___str_19+0)
      00BD47 4B 8D            [ 1] 1024 	push	#((___str_19+0) >> 8)
      00BD49 CD C3 34         [ 4] 1025 	call	_strcmp
      00BD4C 5D               [ 2] 1026 	tnzw	x
      00BD4D 26 5B            [ 1] 1027 	jrne	00203$
                                   1028 ;	./../../mib/stm8s_mib_debug_mem.c: 292: if (argc < 4)
      00BD4F 1E 2C            [ 2] 1029 	ldw	x, (0x2c, sp)
      00BD51 A3 00 04         [ 2] 1030 	cpw	x, #0x0004
      00BD54 2E 0B            [ 1] 1031 	jrsge	00168$
                                   1032 ;	./../../mib/stm8s_mib_debug_mem.c: 294: MibWriteDebugString(cptr->usage);
      00BD56 1E 24            [ 2] 1033 	ldw	x, (0x24, sp)
      00BD58 EE 04            [ 2] 1034 	ldw	x, (0x4, x)
      00BD5A CD A6 1F         [ 4] 1035 	call	_MibWriteDebugString
                                   1036 ;	./../../mib/stm8s_mib_debug_mem.c: 295: return FALSE;
      00BD5D 5F               [ 1] 1037 	clrw	x
      00BD5E CC BF 67         [ 2] 1038 	jp	00235$
      00BD61                       1039 00168$:
                                   1040 ;	./../../mib/stm8s_mib_debug_mem.c: 297: if (!HexToInt(argv[2], &addr, 32) || !HexToInt(argv[3], &len, 32))
      00BD61 16 2E            [ 2] 1041 	ldw	y, (0x2e, sp)
      00BD63 90 EE 04         [ 2] 1042 	ldw	y, (0x4, y)
      00BD66 4B 20            [ 1] 1043 	push	#0x20
      00BD68 4B 00            [ 1] 1044 	push	#0x00
      00BD6A 96               [ 1] 1045 	ldw	x, sp
      00BD6B 1C 00 03         [ 2] 1046 	addw	x, #3
      00BD6E 89               [ 2] 1047 	pushw	x
      00BD6F 93               [ 1] 1048 	ldw	x, y
      00BD70 CD B3 35         [ 4] 1049 	call	_HexToInt
      00BD73 5D               [ 2] 1050 	tnzw	x
      00BD74 27 15            [ 1] 1051 	jreq	00169$
      00BD76 16 2E            [ 2] 1052 	ldw	y, (0x2e, sp)
      00BD78 90 EE 06         [ 2] 1053 	ldw	y, (0x6, y)
      00BD7B 4B 20            [ 1] 1054 	push	#0x20
      00BD7D 4B 00            [ 1] 1055 	push	#0x00
      00BD7F 96               [ 1] 1056 	ldw	x, sp
      00BD80 1C 00 16         [ 2] 1057 	addw	x, #22
      00BD83 89               [ 2] 1058 	pushw	x
      00BD84 93               [ 1] 1059 	ldw	x, y
      00BD85 CD B3 35         [ 4] 1060 	call	_HexToInt
      00BD88 5D               [ 2] 1061 	tnzw	x
      00BD89 26 0D            [ 1] 1062 	jrne	00170$
      00BD8B                       1063 00169$:
                                   1064 ;	./../../mib/stm8s_mib_debug_mem.c: 299: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00BD8B 4B 36            [ 1] 1065 	push	#<(__str_3+0)
      00BD8D 4B 8D            [ 1] 1066 	push	#((__str_3+0) >> 8)
      00BD8F CD B0 3B         [ 4] 1067 	call	_mib_printf
      00BD92 5B 02            [ 2] 1068 	addw	sp, #2
                                   1069 ;	./../../mib/stm8s_mib_debug_mem.c: 300: return FALSE;
      00BD94 5F               [ 1] 1070 	clrw	x
      00BD95 CC BF 67         [ 2] 1071 	jp	00235$
      00BD98                       1072 00170$:
                                   1073 ;	./../../mib/stm8s_mib_debug_mem.c: 302: HexDump(addr, len);		
      00BD98 1E 16            [ 2] 1074 	ldw	x, (0x16, sp)
      00BD9A 89               [ 2] 1075 	pushw	x
      00BD9B 1E 16            [ 2] 1076 	ldw	x, (0x16, sp)
      00BD9D 89               [ 2] 1077 	pushw	x
      00BD9E 1E 07            [ 2] 1078 	ldw	x, (0x07, sp)
      00BDA0 89               [ 2] 1079 	pushw	x
      00BDA1 1E 07            [ 2] 1080 	ldw	x, (0x07, sp)
      00BDA3 89               [ 2] 1081 	pushw	x
      00BDA4 CD B4 A9         [ 4] 1082 	call	_HexDump
      00BDA7 CC BF 65         [ 2] 1083 	jp	00216$
      00BDAA                       1084 00203$:
                                   1085 ;	./../../mib/stm8s_mib_debug_mem.c: 304: else if (!strcmp(argv[1], "cpy")) // _CMD_MY_MEMCPY_
      00BDAA 1E 26            [ 2] 1086 	ldw	x, (0x26, sp)
      00BDAC FE               [ 2] 1087 	ldw	x, (x)
      00BDAD 4B F8            [ 1] 1088 	push	#<(___str_20+0)
      00BDAF 4B 8D            [ 1] 1089 	push	#((___str_20+0) >> 8)
      00BDB1 CD C3 34         [ 4] 1090 	call	_strcmp
      00BDB4 5D               [ 2] 1091 	tnzw	x
      00BDB5 26 71            [ 1] 1092 	jrne	00200$
                                   1093 ;	./../../mib/stm8s_mib_debug_mem.c: 306: if (argc < 5)
      00BDB7 1E 2C            [ 2] 1094 	ldw	x, (0x2c, sp)
      00BDB9 A3 00 05         [ 2] 1095 	cpw	x, #0x0005
      00BDBC 2E 0B            [ 1] 1096 	jrsge	00173$
                                   1097 ;	./../../mib/stm8s_mib_debug_mem.c: 308: MibWriteDebugString(cptr->usage);
      00BDBE 1E 24            [ 2] 1098 	ldw	x, (0x24, sp)
      00BDC0 EE 04            [ 2] 1099 	ldw	x, (0x4, x)
      00BDC2 CD A6 1F         [ 4] 1100 	call	_MibWriteDebugString
                                   1101 ;	./../../mib/stm8s_mib_debug_mem.c: 309: return FALSE;
      00BDC5 5F               [ 1] 1102 	clrw	x
      00BDC6 CC BF 67         [ 2] 1103 	jp	00235$
      00BDC9                       1104 00173$:
                                   1105 ;	./../../mib/stm8s_mib_debug_mem.c: 311: if (!HexToInt(argv[2], &dest, 32) || !HexToInt(argv[3], &src, 32) || !HexToInt(argv[4], &len, 32))
      00BDC9 16 2E            [ 2] 1106 	ldw	y, (0x2e, sp)
      00BDCB 90 EE 04         [ 2] 1107 	ldw	y, (0x4, y)
      00BDCE 4B 20            [ 1] 1108 	push	#0x20
      00BDD0 4B 00            [ 1] 1109 	push	#0x00
      00BDD2 96               [ 1] 1110 	ldw	x, sp
      00BDD3 1C 00 0E         [ 2] 1111 	addw	x, #14
      00BDD6 89               [ 2] 1112 	pushw	x
      00BDD7 93               [ 1] 1113 	ldw	x, y
      00BDD8 CD B3 35         [ 4] 1114 	call	_HexToInt
      00BDDB 5D               [ 2] 1115 	tnzw	x
      00BDDC 27 2A            [ 1] 1116 	jreq	00174$
      00BDDE 16 2E            [ 2] 1117 	ldw	y, (0x2e, sp)
      00BDE0 90 EE 06         [ 2] 1118 	ldw	y, (0x6, y)
      00BDE3 4B 20            [ 1] 1119 	push	#0x20
      00BDE5 4B 00            [ 1] 1120 	push	#0x00
      00BDE7 96               [ 1] 1121 	ldw	x, sp
      00BDE8 1C 00 12         [ 2] 1122 	addw	x, #18
      00BDEB 89               [ 2] 1123 	pushw	x
      00BDEC 93               [ 1] 1124 	ldw	x, y
      00BDED CD B3 35         [ 4] 1125 	call	_HexToInt
      00BDF0 5D               [ 2] 1126 	tnzw	x
      00BDF1 27 15            [ 1] 1127 	jreq	00174$
      00BDF3 16 2E            [ 2] 1128 	ldw	y, (0x2e, sp)
      00BDF5 90 EE 08         [ 2] 1129 	ldw	y, (0x8, y)
      00BDF8 4B 20            [ 1] 1130 	push	#0x20
      00BDFA 4B 00            [ 1] 1131 	push	#0x00
      00BDFC 96               [ 1] 1132 	ldw	x, sp
      00BDFD 1C 00 16         [ 2] 1133 	addw	x, #22
      00BE00 89               [ 2] 1134 	pushw	x
      00BE01 93               [ 1] 1135 	ldw	x, y
      00BE02 CD B3 35         [ 4] 1136 	call	_HexToInt
      00BE05 5D               [ 2] 1137 	tnzw	x
      00BE06 26 0D            [ 1] 1138 	jrne	00175$
      00BE08                       1139 00174$:
                                   1140 ;	./../../mib/stm8s_mib_debug_mem.c: 313: ccprintf(_DEBUG_CMD_A_, ("Illegal character is used.\r\n"));
      00BE08 4B FC            [ 1] 1141 	push	#<(__str_21+0)
      00BE0A 4B 8D            [ 1] 1142 	push	#((__str_21+0) >> 8)
      00BE0C CD B0 3B         [ 4] 1143 	call	_mib_printf
      00BE0F 5B 02            [ 2] 1144 	addw	sp, #2
                                   1145 ;	./../../mib/stm8s_mib_debug_mem.c: 314: return FALSE;
      00BE11 5F               [ 1] 1146 	clrw	x
      00BE12 CC BF 67         [ 2] 1147 	jp	00235$
      00BE15                       1148 00175$:
                                   1149 ;	./../../mib/stm8s_mib_debug_mem.c: 316: memcpy((char *)dest, (char *)src, len);		
      00BE15 1E 16            [ 2] 1150 	ldw	x, (0x16, sp)
      00BE17 16 12            [ 2] 1151 	ldw	y, (0x12, sp)
      00BE19 17 28            [ 2] 1152 	ldw	(0x28, sp), y
      00BE1B 16 0E            [ 2] 1153 	ldw	y, (0x0e, sp)
      00BE1D 89               [ 2] 1154 	pushw	x
      00BE1E 1E 2A            [ 2] 1155 	ldw	x, (0x2a, sp)
      00BE20 89               [ 2] 1156 	pushw	x
      00BE21 93               [ 1] 1157 	ldw	x, y
      00BE22 CD C2 B0         [ 4] 1158 	call	___memcpy
      00BE25 CC BF 65         [ 2] 1159 	jp	00216$
      00BE28                       1160 00200$:
                                   1161 ;	./../../mib/stm8s_mib_debug_mem.c: 318: else if (!strcmp(argv[1], "cmp")) // _CMD_MY_MEMCMP_
      00BE28 1E 26            [ 2] 1162 	ldw	x, (0x26, sp)
      00BE2A FE               [ 2] 1163 	ldw	x, (x)
      00BE2B 4B 19            [ 1] 1164 	push	#<(___str_22+0)
      00BE2D 4B 8E            [ 1] 1165 	push	#((___str_22+0) >> 8)
      00BE2F CD C3 34         [ 4] 1166 	call	_strcmp
      00BE32 5D               [ 2] 1167 	tnzw	x
      00BE33 27 03            [ 1] 1168 	jreq	00647$
      00BE35 CC BE C1         [ 2] 1169 	jp	00197$
      00BE38                       1170 00647$:
                                   1171 ;	./../../mib/stm8s_mib_debug_mem.c: 320: if (argc < 5)
      00BE38 1E 2C            [ 2] 1172 	ldw	x, (0x2c, sp)
      00BE3A A3 00 05         [ 2] 1173 	cpw	x, #0x0005
      00BE3D 2E 0B            [ 1] 1174 	jrsge	00179$
                                   1175 ;	./../../mib/stm8s_mib_debug_mem.c: 322: MibWriteDebugString(cptr->usage);
      00BE3F 1E 24            [ 2] 1176 	ldw	x, (0x24, sp)
      00BE41 EE 04            [ 2] 1177 	ldw	x, (0x4, x)
      00BE43 CD A6 1F         [ 4] 1178 	call	_MibWriteDebugString
                                   1179 ;	./../../mib/stm8s_mib_debug_mem.c: 323: return FALSE;
      00BE46 5F               [ 1] 1180 	clrw	x
      00BE47 CC BF 67         [ 2] 1181 	jp	00235$
      00BE4A                       1182 00179$:
                                   1183 ;	./../../mib/stm8s_mib_debug_mem.c: 325: if (!HexToInt(argv[2], &dest, 32) || !HexToInt(argv[3], &src, 32) || !HexToInt(argv[4], &len, 32))
      00BE4A 16 2E            [ 2] 1184 	ldw	y, (0x2e, sp)
      00BE4C 90 EE 04         [ 2] 1185 	ldw	y, (0x4, y)
      00BE4F 4B 20            [ 1] 1186 	push	#0x20
      00BE51 4B 00            [ 1] 1187 	push	#0x00
      00BE53 96               [ 1] 1188 	ldw	x, sp
      00BE54 1C 00 0E         [ 2] 1189 	addw	x, #14
      00BE57 89               [ 2] 1190 	pushw	x
      00BE58 93               [ 1] 1191 	ldw	x, y
      00BE59 CD B3 35         [ 4] 1192 	call	_HexToInt
      00BE5C 5D               [ 2] 1193 	tnzw	x
      00BE5D 27 2A            [ 1] 1194 	jreq	00180$
      00BE5F 16 2E            [ 2] 1195 	ldw	y, (0x2e, sp)
      00BE61 90 EE 06         [ 2] 1196 	ldw	y, (0x6, y)
      00BE64 4B 20            [ 1] 1197 	push	#0x20
      00BE66 4B 00            [ 1] 1198 	push	#0x00
      00BE68 96               [ 1] 1199 	ldw	x, sp
      00BE69 1C 00 12         [ 2] 1200 	addw	x, #18
      00BE6C 89               [ 2] 1201 	pushw	x
      00BE6D 93               [ 1] 1202 	ldw	x, y
      00BE6E CD B3 35         [ 4] 1203 	call	_HexToInt
      00BE71 5D               [ 2] 1204 	tnzw	x
      00BE72 27 15            [ 1] 1205 	jreq	00180$
      00BE74 16 2E            [ 2] 1206 	ldw	y, (0x2e, sp)
      00BE76 90 EE 08         [ 2] 1207 	ldw	y, (0x8, y)
      00BE79 4B 20            [ 1] 1208 	push	#0x20
      00BE7B 4B 00            [ 1] 1209 	push	#0x00
      00BE7D 96               [ 1] 1210 	ldw	x, sp
      00BE7E 1C 00 16         [ 2] 1211 	addw	x, #22
      00BE81 89               [ 2] 1212 	pushw	x
      00BE82 93               [ 1] 1213 	ldw	x, y
      00BE83 CD B3 35         [ 4] 1214 	call	_HexToInt
      00BE86 5D               [ 2] 1215 	tnzw	x
      00BE87 26 0D            [ 1] 1216 	jrne	00181$
      00BE89                       1217 00180$:
                                   1218 ;	./../../mib/stm8s_mib_debug_mem.c: 327: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00BE89 4B 36            [ 1] 1219 	push	#<(__str_3+0)
      00BE8B 4B 8D            [ 1] 1220 	push	#((__str_3+0) >> 8)
      00BE8D CD B0 3B         [ 4] 1221 	call	_mib_printf
      00BE90 5B 02            [ 2] 1222 	addw	sp, #2
                                   1223 ;	./../../mib/stm8s_mib_debug_mem.c: 328: return FALSE;
      00BE92 5F               [ 1] 1224 	clrw	x
      00BE93 CC BF 67         [ 2] 1225 	jp	00235$
      00BE96                       1226 00181$:
                                   1227 ;	./../../mib/stm8s_mib_debug_mem.c: 331: if (memcmp((char *)dest, (char *)src, (len)) == 0) ccprintf(_DEBUG_CMD_A_, ("equil.\r\n"));
      00BE96 1E 16            [ 2] 1228 	ldw	x, (0x16, sp)
      00BE98 16 12            [ 2] 1229 	ldw	y, (0x12, sp)
      00BE9A 17 28            [ 2] 1230 	ldw	(0x28, sp), y
      00BE9C 16 0E            [ 2] 1231 	ldw	y, (0x0e, sp)
      00BE9E 89               [ 2] 1232 	pushw	x
      00BE9F 1E 2A            [ 2] 1233 	ldw	x, (0x2a, sp)
      00BEA1 89               [ 2] 1234 	pushw	x
      00BEA2 93               [ 1] 1235 	ldw	x, y
      00BEA3 CD C1 64         [ 4] 1236 	call	_memcmp
      00BEA6 5D               [ 2] 1237 	tnzw	x
      00BEA7 26 0C            [ 1] 1238 	jrne	00185$
      00BEA9 4B 1D            [ 1] 1239 	push	#<(__str_23+0)
      00BEAB 4B 8E            [ 1] 1240 	push	#((__str_23+0) >> 8)
      00BEAD CD B0 3B         [ 4] 1241 	call	_mib_printf
      00BEB0 5B 02            [ 2] 1242 	addw	sp, #2
      00BEB2 CC BF 65         [ 2] 1243 	jp	00216$
      00BEB5                       1244 00185$:
                                   1245 ;	./../../mib/stm8s_mib_debug_mem.c: 332: else ccprintf(_DEBUG_CMD_A_, ("not equil.\r\n"));		
      00BEB5 4B 26            [ 1] 1246 	push	#<(__str_24+0)
      00BEB7 4B 8E            [ 1] 1247 	push	#((__str_24+0) >> 8)
      00BEB9 CD B0 3B         [ 4] 1248 	call	_mib_printf
      00BEBC 5B 02            [ 2] 1249 	addw	sp, #2
      00BEBE CC BF 65         [ 2] 1250 	jp	00216$
      00BEC1                       1251 00197$:
                                   1252 ;	./../../mib/stm8s_mib_debug_mem.c: 334: else if (!strcmp(argv[1], "set")) // _CMD_MY_MEMSET_
      00BEC1 1E 26            [ 2] 1253 	ldw	x, (0x26, sp)
      00BEC3 FE               [ 2] 1254 	ldw	x, (x)
      00BEC4 4B 33            [ 1] 1255 	push	#<(___str_25+0)
      00BEC6 4B 8E            [ 1] 1256 	push	#((___str_25+0) >> 8)
      00BEC8 CD C3 34         [ 4] 1257 	call	_strcmp
      00BECB 5D               [ 2] 1258 	tnzw	x
      00BECC 26 71            [ 1] 1259 	jrne	00194$
                                   1260 ;	./../../mib/stm8s_mib_debug_mem.c: 336: if (argc < 5)
      00BECE 1E 2C            [ 2] 1261 	ldw	x, (0x2c, sp)
      00BED0 A3 00 05         [ 2] 1262 	cpw	x, #0x0005
      00BED3 2E 0B            [ 1] 1263 	jrsge	00188$
                                   1264 ;	./../../mib/stm8s_mib_debug_mem.c: 338: MibWriteDebugString(cptr->usage);
      00BED5 1E 24            [ 2] 1265 	ldw	x, (0x24, sp)
      00BED7 EE 04            [ 2] 1266 	ldw	x, (0x4, x)
      00BED9 CD A6 1F         [ 4] 1267 	call	_MibWriteDebugString
                                   1268 ;	./../../mib/stm8s_mib_debug_mem.c: 339: return FALSE;
      00BEDC 5F               [ 1] 1269 	clrw	x
      00BEDD CC BF 67         [ 2] 1270 	jp	00235$
      00BEE0                       1271 00188$:
                                   1272 ;	./../../mib/stm8s_mib_debug_mem.c: 341: if (!HexToInt(argv[2], &addr, 32) || !HexToInt(argv[3], &c, 8) || !HexToInt(argv[4], &len, 32))
      00BEE0 16 2E            [ 2] 1273 	ldw	y, (0x2e, sp)
      00BEE2 90 EE 04         [ 2] 1274 	ldw	y, (0x4, y)
      00BEE5 4B 20            [ 1] 1275 	push	#0x20
      00BEE7 4B 00            [ 1] 1276 	push	#0x00
      00BEE9 96               [ 1] 1277 	ldw	x, sp
      00BEEA 1C 00 03         [ 2] 1278 	addw	x, #3
      00BEED 89               [ 2] 1279 	pushw	x
      00BEEE 93               [ 1] 1280 	ldw	x, y
      00BEEF CD B3 35         [ 4] 1281 	call	_HexToInt
      00BEF2 5D               [ 2] 1282 	tnzw	x
      00BEF3 27 2A            [ 1] 1283 	jreq	00189$
      00BEF5 16 2E            [ 2] 1284 	ldw	y, (0x2e, sp)
      00BEF7 90 EE 06         [ 2] 1285 	ldw	y, (0x6, y)
      00BEFA 4B 08            [ 1] 1286 	push	#0x08
      00BEFC 4B 00            [ 1] 1287 	push	#0x00
      00BEFE 96               [ 1] 1288 	ldw	x, sp
      00BEFF 1C 00 07         [ 2] 1289 	addw	x, #7
      00BF02 89               [ 2] 1290 	pushw	x
      00BF03 93               [ 1] 1291 	ldw	x, y
      00BF04 CD B3 35         [ 4] 1292 	call	_HexToInt
      00BF07 5D               [ 2] 1293 	tnzw	x
      00BF08 27 15            [ 1] 1294 	jreq	00189$
      00BF0A 16 2E            [ 2] 1295 	ldw	y, (0x2e, sp)
      00BF0C 90 EE 08         [ 2] 1296 	ldw	y, (0x8, y)
      00BF0F 4B 20            [ 1] 1297 	push	#0x20
      00BF11 4B 00            [ 1] 1298 	push	#0x00
      00BF13 96               [ 1] 1299 	ldw	x, sp
      00BF14 1C 00 16         [ 2] 1300 	addw	x, #22
      00BF17 89               [ 2] 1301 	pushw	x
      00BF18 93               [ 1] 1302 	ldw	x, y
      00BF19 CD B3 35         [ 4] 1303 	call	_HexToInt
      00BF1C 5D               [ 2] 1304 	tnzw	x
      00BF1D 26 0C            [ 1] 1305 	jrne	00190$
      00BF1F                       1306 00189$:
                                   1307 ;	./../../mib/stm8s_mib_debug_mem.c: 343: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00BF1F 4B 36            [ 1] 1308 	push	#<(__str_3+0)
      00BF21 4B 8D            [ 1] 1309 	push	#((__str_3+0) >> 8)
      00BF23 CD B0 3B         [ 4] 1310 	call	_mib_printf
      00BF26 5B 02            [ 2] 1311 	addw	sp, #2
                                   1312 ;	./../../mib/stm8s_mib_debug_mem.c: 344: return FALSE;
      00BF28 5F               [ 1] 1313 	clrw	x
      00BF29 20 3C            [ 2] 1314 	jra	00235$
      00BF2B                       1315 00190$:
                                   1316 ;	./../../mib/stm8s_mib_debug_mem.c: 346: memset((void *)addr, c, len);
      00BF2B 1E 16            [ 2] 1317 	ldw	x, (0x16, sp)
      00BF2D 7B 05            [ 1] 1318 	ld	a, (0x05, sp)
      00BF2F 6B 29            [ 1] 1319 	ld	(0x29, sp), a
      00BF31 0F 28            [ 1] 1320 	clr	(0x28, sp)
      00BF33 16 03            [ 2] 1321 	ldw	y, (0x03, sp)
      00BF35 89               [ 2] 1322 	pushw	x
      00BF36 1E 2A            [ 2] 1323 	ldw	x, (0x2a, sp)
      00BF38 89               [ 2] 1324 	pushw	x
      00BF39 93               [ 1] 1325 	ldw	x, y
      00BF3A CD C3 03         [ 4] 1326 	call	_memset
      00BF3D 20 26            [ 2] 1327 	jra	00216$
      00BF3F                       1328 00194$:
                                   1329 ;	./../../mib/stm8s_mib_debug_mem.c: 350: MibWriteDebugString(cptr->usage);
      00BF3F 1E 24            [ 2] 1330 	ldw	x, (0x24, sp)
      00BF41 EE 04            [ 2] 1331 	ldw	x, (0x4, x)
      00BF43 CD A6 1F         [ 4] 1332 	call	_MibWriteDebugString
                                   1333 ;	./../../mib/stm8s_mib_debug_mem.c: 351: return FALSE;
      00BF46 5F               [ 1] 1334 	clrw	x
      00BF47 20 1E            [ 2] 1335 	jra	00235$
      00BF49                       1336 00301$:
      00BF49 16 28            [ 2] 1337 	ldw	y, (0x28, sp)
      00BF4B 17 1A            [ 2] 1338 	ldw	(0x1a, sp), y
      00BF4D 16 26            [ 2] 1339 	ldw	y, (0x26, sp)
      00BF4F 17 18            [ 2] 1340 	ldw	(0x18, sp), y
      00BF51 20 12            [ 2] 1341 	jra	00216$
      00BF53                       1342 00302$:
      00BF53 16 28            [ 2] 1343 	ldw	y, (0x28, sp)
      00BF55 17 1A            [ 2] 1344 	ldw	(0x1a, sp), y
      00BF57 16 26            [ 2] 1345 	ldw	y, (0x26, sp)
      00BF59 17 18            [ 2] 1346 	ldw	(0x18, sp), y
      00BF5B 20 08            [ 2] 1347 	jra	00216$
      00BF5D                       1348 00303$:
      00BF5D 16 28            [ 2] 1349 	ldw	y, (0x28, sp)
      00BF5F 17 1A            [ 2] 1350 	ldw	(0x1a, sp), y
      00BF61 16 26            [ 2] 1351 	ldw	y, (0x26, sp)
      00BF63 17 18            [ 2] 1352 	ldw	(0x18, sp), y
      00BF65                       1353 00216$:
                                   1354 ;	./../../mib/stm8s_mib_debug_mem.c: 353: return TRUE;
      00BF65 5F               [ 1] 1355 	clrw	x
      00BF66 5C               [ 1] 1356 	incw	x
      00BF67                       1357 00235$:
                                   1358 ;	./../../mib/stm8s_mib_debug_mem.c: 354: }
      00BF67 16 2A            [ 2] 1359 	ldw	y, (42, sp)
      00BF69 5B 2F            [ 2] 1360 	addw	sp, #47
      00BF6B 90 FC            [ 2] 1361 	jp	(y)
                                   1362 	.area CODE
                                   1363 	.area CONST
                                   1364 	.area CONST
      008D0A                       1365 __str_0:
      008D0A 49 4E 46 4F 3A 2B 63  1366 	.ascii "INFO:+cmd_mem..."
             6D 64 5F 6D 65 6D 2E
             2E 2E
      008D1A 0D                    1367 	.db 0x0d
      008D1B 0A                    1368 	.db 0x0a
      008D1C 00                    1369 	.db 0x00
                                   1370 	.area CODE
                                   1371 	.area CONST
      008D1D                       1372 __str_1:
      008D1D 49 4E 46 4F 3A 2D 63  1373 	.ascii "INFO:-cmd_mem..."
             6D 64 5F 6D 65 6D 2E
             2E 2E
      008D2D 0D                    1374 	.db 0x0d
      008D2E 0A                    1375 	.db 0x0a
      008D2F 00                    1376 	.db 0x00
                                   1377 	.area CODE
                                   1378 	.area CONST
      008D30                       1379 ___str_2:
      008D30 77 72 69 74 65        1380 	.ascii "write"
      008D35 00                    1381 	.db 0x00
                                   1382 	.area CODE
                                   1383 	.area CONST
      008D36                       1384 __str_3:
      008D36 49 6C 6C 75 67 61 6C  1385 	.ascii "Illugal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      008D50 0D                    1386 	.db 0x0d
      008D51 0A                    1387 	.db 0x0a
      008D52 00                    1388 	.db 0x00
                                   1389 	.area CODE
                                   1390 	.area CONST
      008D53                       1391 __str_4:
      008D53 49 6C 6C 75 67 61 6C  1392 	.ascii "Illugal character is useqd."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 71 64 2E
      008D6E 0D                    1393 	.db 0x0d
      008D6F 0A                    1394 	.db 0x0a
      008D70 00                    1395 	.db 0x00
                                   1396 	.area CODE
                                   1397 	.area CONST
      008D71                       1398 ___str_5:
      008D71 72 65 61 64           1399 	.ascii "read"
      008D75 00                    1400 	.db 0x00
                                   1401 	.area CODE
                                   1402 	.area CONST
      008D76                       1403 __str_6:
      008D76 09                    1404 	.db 0x09
      008D77 61 64 64 72 65 73 73  1405 	.ascii "address : 0x%08lx  "
             20 3A 20 30 78 25 30
             38 6C 78 20 20
      008D8A 00                    1406 	.db 0x00
                                   1407 	.area CODE
                                   1408 	.area CONST
      008D8B                       1409 __str_7:
      008D8B 09                    1410 	.db 0x09
      008D8C 76 61 6C 75 65 20 20  1411 	.ascii "value   : "
             20 3A 20
      008D96 00                    1412 	.db 0x00
                                   1413 	.area CODE
                                   1414 	.area CONST
      008D97                       1415 __str_8:
      008D97 30 78 25 30 32 78 20  1416 	.ascii "0x%02x "
      008D9E 00                    1417 	.db 0x00
                                   1418 	.area CODE
                                   1419 	.area CONST
      008D9F                       1420 __str_9:
      008D9F 30 78 25 30 34 78     1421 	.ascii "0x%04x"
      008DA5 00                    1422 	.db 0x00
                                   1423 	.area CODE
                                   1424 	.area CONST
      008DA6                       1425 __str_10:
      008DA6 30 78 25 30 38 6C 78  1426 	.ascii "0x%08lx"
      008DAD 00                    1427 	.db 0x00
                                   1428 	.area CODE
                                   1429 	.area CONST
      008DAE                       1430 __str_11:
      008DAE 45 72 72 6F 72 2E     1431 	.ascii "Error."
      008DB4 0D                    1432 	.db 0x0d
      008DB5 0A                    1433 	.db 0x0a
      008DB6 00                    1434 	.db 0x00
                                   1435 	.area CODE
                                   1436 	.area CONST
      008DB7                       1437 __str_12:
      008DB7 2E                    1438 	.ascii "."
      008DB8 0D                    1439 	.db 0x0d
      008DB9 0A                    1440 	.db 0x0a
      008DBA 00                    1441 	.db 0x00
                                   1442 	.area CODE
                                   1443 	.area CONST
      008DBB                       1444 ___str_13:
      008DBB 77 72 6E              1445 	.ascii "wrn"
      008DBE 00                    1446 	.db 0x00
                                   1447 	.area CODE
                                   1448 	.area CONST
      008DBF                       1449 ___str_14:
      008DBF 72 64 6E              1450 	.ascii "rdn"
      008DC2 00                    1451 	.db 0x00
                                   1452 	.area CODE
                                   1453 	.area CONST
      008DC3                       1454 __str_15:
      008DC3 6C 6F 6F 70 20 3A 20  1455 	.ascii "loop : 0x%08lx  "
             30 78 25 30 38 6C 78
             20 20
      008DD3 0D                    1456 	.db 0x0d
      008DD4 0A                    1457 	.db 0x0a
      008DD5 00                    1458 	.db 0x00
                                   1459 	.area CODE
                                   1460 	.area CONST
      008DD6                       1461 __str_16:
      008DD6 76 61 6C 75 65 20 20  1462 	.ascii "value   : "
             20 3A 20
      008DE0 00                    1463 	.db 0x00
                                   1464 	.area CODE
                                   1465 	.area CONST
      008DE1                       1466 __str_17:
      008DE1 30 78 25 30 34 78 20  1467 	.ascii "0x%04x "
      008DE8 00                    1468 	.db 0x00
                                   1469 	.area CODE
                                   1470 	.area CONST
      008DE9                       1471 __str_18:
      008DE9 30 78 25 30 38 6C 78  1472 	.ascii "0x%08lx "
             20
      008DF1 00                    1473 	.db 0x00
                                   1474 	.area CODE
                                   1475 	.area CONST
      008DF2                       1476 ___str_19:
      008DF2 68 64 75 6D 70        1477 	.ascii "hdump"
      008DF7 00                    1478 	.db 0x00
                                   1479 	.area CODE
                                   1480 	.area CONST
      008DF8                       1481 ___str_20:
      008DF8 63 70 79              1482 	.ascii "cpy"
      008DFB 00                    1483 	.db 0x00
                                   1484 	.area CODE
                                   1485 	.area CONST
      008DFC                       1486 __str_21:
      008DFC 49 6C 6C 65 67 61 6C  1487 	.ascii "Illegal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      008E16 0D                    1488 	.db 0x0d
      008E17 0A                    1489 	.db 0x0a
      008E18 00                    1490 	.db 0x00
                                   1491 	.area CODE
                                   1492 	.area CONST
      008E19                       1493 ___str_22:
      008E19 63 6D 70              1494 	.ascii "cmp"
      008E1C 00                    1495 	.db 0x00
                                   1496 	.area CODE
                                   1497 	.area CONST
      008E1D                       1498 __str_23:
      008E1D 65 71 75 69 6C 2E     1499 	.ascii "equil."
      008E23 0D                    1500 	.db 0x0d
      008E24 0A                    1501 	.db 0x0a
      008E25 00                    1502 	.db 0x00
                                   1503 	.area CODE
                                   1504 	.area CONST
      008E26                       1505 __str_24:
      008E26 6E 6F 74 20 65 71 75  1506 	.ascii "not equil."
             69 6C 2E
      008E30 0D                    1507 	.db 0x0d
      008E31 0A                    1508 	.db 0x0a
      008E32 00                    1509 	.db 0x00
                                   1510 	.area CODE
                                   1511 	.area CONST
      008E33                       1512 ___str_25:
      008E33 73 65 74              1513 	.ascii "set"
      008E36 00                    1514 	.db 0x00
                                   1515 	.area CODE
                                   1516 	.area CONST
      008E37                       1517 ___str_26:
      008E37 6D 65 6D              1518 	.ascii "mem"
      008E3A 00                    1519 	.db 0x00
                                   1520 	.area CODE
                                   1521 	.area CONST
      008E3B                       1522 ___str_27:
      008E3B 20 20 6D 65 6D 20 7B  1523 	.ascii "  mem {cpy}   [dest] [src]   [len] Copy to SDRAM from Flash "
             63 70 79 7D 20 20 20
             5B 64 65 73 74 5D 20
             5B 73 72 63 5D 20 20
             20 5B 6C 65 6E 5D 20
             43 6F 70 79 20 74 6F
             20 53 44 52 41 4D 20
             66 72 6F 6D 20 46 6C
             61 73 68 20
      008E77 6F 72 20 53 44 52 41  1524 	.ascii "or SDRAM."
             4D 2E
      008E80 0D                    1525 	.db 0x0d
      008E81 0A                    1526 	.db 0x0a
      008E82 20 20 6D 65 6D 20 7B  1527 	.ascii "  mem {cmp}   [add1] [add2]  [len] Compare data in addr1 and"
             63 6D 70 7D 20 20 20
             5B 61 64 64 31 5D 20
             5B 61 64 64 32 5D 20
             20 5B 6C 65 6E 5D 20
             43 6F 6D 70 61 72 65
             20 64 61 74 61 20 69
             6E 20 61 64 64 72 31
             20 61 6E 64
      008EBE 20 61 64 64 72 32 2E  1528 	.ascii " addr2."
      008EC5 0D                    1529 	.db 0x0d
      008EC6 0A                    1530 	.db 0x0a
      008EC7 20 20 6D 65 6D 20 7B  1531 	.ascii "  mem {set}   [addr] [value] [len] Fill Memory with value."
             73 65 74 7D 20 20 20
             5B 61 64 64 72 5D 20
             5B 76 61 6C 75 65 5D
             20 5B 6C 65 6E 5D 20
             46 69 6C 6C 20 4D 65
             6D 6F 72 79 20 77 69
             74 68 20 76 61 6C 75
             65 2E
      008F01 0D                    1532 	.db 0x0d
      008F02 0A                    1533 	.db 0x0a
      008F03 20 20 6D 65 6D 20 7B  1534 	.ascii "  mem {hdump} [addr] [len]         Dump Memory."
             68 64 75 6D 70 7D 20
             5B 61 64 64 72 5D 20
             5B 6C 65 6E 5D 20 20
             20 20 20 20 20 20 20
             44 75 6D 70 20 4D 65
             6D 6F 72 79 2E
      008F32 0D                    1535 	.db 0x0d
      008F33 0A                    1536 	.db 0x0a
      008F34 20 20 6D 65 6D 20 7B  1537 	.ascii "  mem {wrn} {c/s/l} [addr] [value] [loop]  Wrn in addr. c:8 "
             77 72 6E 7D 20 7B 63
             2F 73 2F 6C 7D 20 5B
             61 64 64 72 5D 20 5B
             76 61 6C 75 65 5D 20
             5B 6C 6F 6F 70 5D 20
             20 57 72 6E 20 69 6E
             20 61 64 64 72 2E 20
             63 3A 38 20
      008F70 73 3A 31 36 20 6C 3A  1538 	.ascii "s:16 l:32 bits."
             33 32 20 62 69 74 73
             2E
      008F7F 0D                    1539 	.db 0x0d
      008F80 0A                    1540 	.db 0x0a
      008F81 20 20 6D 65 6D 20 7B  1541 	.ascii "  mem {rdn}  {c/s/l} [addr] [loop]   Rdn in addr. c:8 s:16 l"
             72 64 6E 7D 20 20 7B
             63 2F 73 2F 6C 7D 20
             5B 61 64 64 72 5D 20
             5B 6C 6F 6F 70 5D 20
             20 20 52 64 6E 20 69
             6E 20 61 64 64 72 2E
             20 63 3A 38 20 73 3A
             31 36 20 6C
      008FBD 3A 33 32 20 62 69 74  1542 	.ascii ":32 bits."
             73 2E
      008FC6 0D                    1543 	.db 0x0d
      008FC7 0A                    1544 	.db 0x0a
      008FC8 20 20 6D 65 6D 20 7B  1545 	.ascii "  mem {write} {c/s/l} [addr] [value]  Write in addr. c:8 s:1"
             77 72 69 74 65 7D 20
             7B 63 2F 73 2F 6C 7D
             20 5B 61 64 64 72 5D
             20 5B 76 61 6C 75 65
             5D 20 20 57 72 69 74
             65 20 69 6E 20 61 64
             64 72 2E 20 63 3A 38
             20 73 3A 31
      009004 36 20 6C 3A 33 32 20  1546 	.ascii "6 l:32 bits."
             62 69 74 73 2E
      009010 0D                    1547 	.db 0x0d
      009011 0A                    1548 	.db 0x0a
      009012 20 20 6D 65 6D 20 7B  1549 	.ascii "  mem {read}  {c/s/l} [addr]          Read in addr. c:8 s:16"
             72 65 61 64 7D 20 20
             7B 63 2F 73 2F 6C 7D
             20 5B 61 64 64 72 5D
             20 20 20 20 20 20 20
             20 20 20 52 65 61 64
             20 69 6E 20 61 64 64
             72 2E 20 63 3A 38 20
             73 3A 31 36
      00904E 20 6C 3A 33 32 20 62  1550 	.ascii " l:32 bits."
             69 74 73 2E
      009059 0D                    1551 	.db 0x0d
      00905A 0A                    1552 	.db 0x0a
      00905B 00                    1553 	.db 0x00
                                   1554 	.area CODE
                                   1555 	.area INITIALIZER
      00923D                       1556 __xinit__cmdTbl_only:
      00923D 8E 37                 1557 	.dw ___str_26
      00923F B7 F2                 1558 	.dw _DoMem
      009241 8E 3B                 1559 	.dw ___str_27
      009243 00 00                 1560 	.dw #0x0000
      009245 00 00                 1561 	.dw #0x0000
      009247 00 00                 1562 	.dw #0x0000
                                   1563 	.area CABS (ABS)
