                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_wwdg_main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _cmd_test_init_before_irq_enable
                                     12 	.globl _cmd_test
                                     13 	.globl _cmd_wwdg
                                     14 	.globl _calConfigWWDG
                                     15 	.globl _DecToLong
                                     16 	.globl _HexToInt
                                     17 	.globl _mib_printf
                                     18 	.globl _MibWriteDebugEmptyCheck
                                     19 	.globl _MibWriteDebugString
                                     20 	.globl ___memcpy
                                     21 	.globl _strcmp
                                     22 	.globl _GPIO_Configuration
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area DATA
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area INITIALIZED
      00014C                         31 _cmdTbl_only:
      00014C                         32 	.ds 12
                                     33 ;--------------------------------------------------------
                                     34 ; absolute external ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area DABS (ABS)
                                     37 
                                     38 ; default segment ordering for linker
                                     39 	.area HOME
                                     40 	.area GSINIT
                                     41 	.area GSFINAL
                                     42 	.area CONST
                                     43 	.area INITIALIZER
                                     44 	.area CODE
                                     45 
                                     46 ;--------------------------------------------------------
                                     47 ; global & static initialisations
                                     48 ;--------------------------------------------------------
                                     49 	.area HOME
                                     50 	.area GSINIT
                                     51 	.area GSFINAL
                                     52 	.area GSINIT
                                     53 ;--------------------------------------------------------
                                     54 ; Home
                                     55 ;--------------------------------------------------------
                                     56 	.area HOME
                                     57 	.area HOME
                                     58 ;--------------------------------------------------------
                                     59 ; code
                                     60 ;--------------------------------------------------------
                                     61 	.area CODE
                                     62 ;	stm8s_wwdg_main.c: 79: void cmd_wwdg(void)
                                     63 ;	-----------------------------------------
                                     64 ;	 function cmd_wwdg
                                     65 ;	-----------------------------------------
      00892C                         66 _cmd_wwdg:
      00892C 52 0A            [ 2]   67 	sub	sp, #10
                                     68 ;	stm8s_wwdg_main.c: 85: for (cptr = cmdTbl;; cptr++) 
      00892E AE 01 5E         [ 2]   69 	ldw	x, #(_cmdTbl+0)
      008931 1F 01            [ 2]   70 	ldw	(0x01, sp), x
      008933 5F               [ 1]   71 	clrw	x
      008934 1F 07            [ 2]   72 	ldw	(0x07, sp), x
      008936 1F 05            [ 2]   73 	ldw	(0x05, sp), x
      008938 16 01            [ 2]   74 	ldw	y, (0x01, sp)
      00893A 17 09            [ 2]   75 	ldw	(0x09, sp), y
      00893C                         76 00106$:
                                     77 ;	stm8s_wwdg_main.c: 87: if(cptr->cmd==0)
      00893C 1E 09            [ 2]   78 	ldw	x, (0x09, sp)
      00893E FE               [ 2]   79 	ldw	x, (x)
      00893F 1F 03            [ 2]   80 	ldw	(0x03, sp), x
      008941 26 19            [ 1]   81 	jrne	00102$
                                     82 ;	stm8s_wwdg_main.c: 89: ccprintf(1,("INFO:+cmd_wwdg...\r\n"));
      008943 4B 8F            [ 1]   83 	push	#<(__str_0+0)
      008945 4B 80            [ 1]   84 	push	#((__str_0+0) >> 8)
      008947 CD 96 77         [ 4]   85 	call	_mib_printf
      00894A 5B 02            [ 2]   86 	addw	sp, #2
                                     87 ;	stm8s_wwdg_main.c: 90: memcpy((void *)&(cptr->cmd),(void *)&(cmdTbl_only[0].cmd),sizeof(CMD_MY));
      00894C AE 01 4C         [ 2]   88 	ldw	x, #_cmdTbl_only+0
      00894F 16 01            [ 2]   89 	ldw	y, (0x01, sp)
      008951 4B 06            [ 1]   90 	push	#0x06
      008953 4B 00            [ 1]   91 	push	#0x00
      008955 89               [ 2]   92 	pushw	x
      008956 93               [ 1]   93 	ldw	x, y
      008957 CD A8 8F         [ 4]   94 	call	___memcpy
                                     95 ;	stm8s_wwdg_main.c: 91: break;
      00895A 20 2F            [ 2]   96 	jra	00105$
      00895C                         97 00102$:
                                     98 ;	stm8s_wwdg_main.c: 93: index++;
      00895C 1E 07            [ 2]   99 	ldw	x, (0x07, sp)
      00895E 5C               [ 1]  100 	incw	x
      00895F 1F 07            [ 2]  101 	ldw	(0x07, sp), x
      008961 26 05            [ 1]  102 	jrne	00126$
      008963 1E 05            [ 2]  103 	ldw	x, (0x05, sp)
      008965 5C               [ 1]  104 	incw	x
      008966 1F 05            [ 2]  105 	ldw	(0x05, sp), x
      008968                        106 00126$:
                                    107 ;	stm8s_wwdg_main.c: 94: if(index>MAX_COMMANDS)
      008968 AE 00 06         [ 2]  108 	ldw	x, #0x0006
      00896B 13 07            [ 2]  109 	cpw	x, (0x07, sp)
      00896D 4F               [ 1]  110 	clr	a
      00896E 12 06            [ 1]  111 	sbc	a, (0x06, sp)
      008970 4F               [ 1]  112 	clr	a
      008971 12 05            [ 1]  113 	sbc	a, (0x05, sp)
      008973 24 0B            [ 1]  114 	jrnc	00107$
                                    115 ;	stm8s_wwdg_main.c: 96: ccprintf(1,("INFO:-cmd_wwdg...\r\n"));
      008975 4B A3            [ 1]  116 	push	#<(__str_1+0)
      008977 4B 80            [ 1]  117 	push	#((__str_1+0) >> 8)
      008979 CD 96 77         [ 4]  118 	call	_mib_printf
      00897C 5B 02            [ 2]  119 	addw	sp, #2
                                    120 ;	stm8s_wwdg_main.c: 97: return;
      00897E 20 0B            [ 2]  121 	jra	00108$
      008980                        122 00107$:
                                    123 ;	stm8s_wwdg_main.c: 85: for (cptr = cmdTbl;; cptr++) 
      008980 1E 09            [ 2]  124 	ldw	x, (0x09, sp)
      008982 1C 00 06         [ 2]  125 	addw	x, #0x0006
      008985 1F 09            [ 2]  126 	ldw	(0x09, sp), x
      008987 1F 01            [ 2]  127 	ldw	(0x01, sp), x
      008989 20 B1            [ 2]  128 	jra	00106$
      00898B                        129 00105$:
                                    130 ;	stm8s_wwdg_main.c: 100: return;
      00898B                        131 00108$:
                                    132 ;	stm8s_wwdg_main.c: 101: }
      00898B 5B 0A            [ 2]  133 	addw	sp, #10
      00898D 81               [ 4]  134 	ret
                                    135 ;	stm8s_wwdg_main.c: 106: void cmd_test(void)
                                    136 ;	-----------------------------------------
                                    137 ;	 function cmd_test
                                    138 ;	-----------------------------------------
      00898E                        139 _cmd_test:
                                    140 ;	stm8s_wwdg_main.c: 108: cmd_wwdg();
                                    141 ;	stm8s_wwdg_main.c: 109: }
      00898E CC 89 2C         [ 2]  142 	jp	_cmd_wwdg
                                    143 ;	stm8s_wwdg_main.c: 115: void cmd_test_init_before_irq_enable(void)
                                    144 ;	-----------------------------------------
                                    145 ;	 function cmd_test_init_before_irq_enable
                                    146 ;	-----------------------------------------
      008991                        147 _cmd_test_init_before_irq_enable:
                                    148 ;	stm8s_wwdg_main.c: 118: }
      008991 81               [ 4]  149 	ret
                                    150 ;	stm8s_wwdg_main.c: 129: static int DoWWDG(CMD_MY *cptr, int argc, char **argv)
                                    151 ;	-----------------------------------------
                                    152 ;	 function DoWWDG
                                    153 ;	-----------------------------------------
      008992                        154 _DoWWDG:
      008992 52 0E            [ 2]  155 	sub	sp, #14
      008994 51               [ 1]  156 	exgw	x, y
                                    157 ;	stm8s_wwdg_main.c: 131: uint32_t vdwAddr = 0;
      008995 5F               [ 1]  158 	clrw	x
      008996 1F 07            [ 2]  159 	ldw	(0x07, sp), x
      008998 1F 05            [ 2]  160 	ldw	(0x05, sp), x
                                    161 ;	stm8s_wwdg_main.c: 132: uint8_t vbData = 0;
      00899A 0F 09            [ 1]  162 	clr	(0x09, sp)
                                    163 ;	stm8s_wwdg_main.c: 133: uint16_t vwData = 0;
      00899C 5F               [ 1]  164 	clrw	x
      00899D 1F 0A            [ 2]  165 	ldw	(0x0a, sp), x
                                    166 ;	stm8s_wwdg_main.c: 137: MibWriteDebugString(cptr->usage);
      00899F 93               [ 1]  167 	ldw	x, y
      0089A0 1C 00 04         [ 2]  168 	addw	x, #0x0004
      0089A3 1F 03            [ 2]  169 	ldw	(0x03, sp), x
                                    170 ;	stm8s_wwdg_main.c: 135: if (argc < 2)
      0089A5 1E 11            [ 2]  171 	ldw	x, (0x11, sp)
      0089A7 A3 00 02         [ 2]  172 	cpw	x, #0x0002
      0089AA 2E 0A            [ 1]  173 	jrsge	00102$
                                    174 ;	stm8s_wwdg_main.c: 137: MibWriteDebugString(cptr->usage);
      0089AC 1E 03            [ 2]  175 	ldw	x, (0x03, sp)
      0089AE FE               [ 2]  176 	ldw	x, (x)
      0089AF CD 8C 65         [ 4]  177 	call	_MibWriteDebugString
                                    178 ;	stm8s_wwdg_main.c: 138: return FALSE;
      0089B2 5F               [ 1]  179 	clrw	x
      0089B3 CC 8B CE         [ 2]  180 	jp	00147$
      0089B6                        181 00102$:
                                    182 ;	stm8s_wwdg_main.c: 143: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      0089B6 1E 13            [ 2]  183 	ldw	x, (0x13, sp)
      0089B8 5C               [ 1]  184 	incw	x
      0089B9 5C               [ 1]  185 	incw	x
      0089BA 1F 01            [ 2]  186 	ldw	(0x01, sp), x
      0089BC FE               [ 2]  187 	ldw	x, (x)
      0089BD 4B B7            [ 1]  188 	push	#<(___str_2+0)
      0089BF 4B 80            [ 1]  189 	push	#((___str_2+0) >> 8)
      0089C1 CD A9 13         [ 4]  190 	call	_strcmp
                                    191 ;	stm8s_wwdg_main.c: 150: if (!HexToInt(argv[2], &vdwAddr, 32))
      0089C4 16 13            [ 2]  192 	ldw	y, (0x13, sp)
      0089C6 72 A9 00 04      [ 2]  193 	addw	y, #0x0004
      0089CA 17 0D            [ 2]  194 	ldw	(0x0d, sp), y
                                    195 ;	stm8s_wwdg_main.c: 143: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      0089CC 5D               [ 2]  196 	tnzw	x
      0089CD 26 70            [ 1]  197 	jrne	00145$
                                    198 ;	stm8s_wwdg_main.c: 145: if (argc < 4)
      0089CF 1E 11            [ 2]  199 	ldw	x, (0x11, sp)
      0089D1 A3 00 04         [ 2]  200 	cpw	x, #0x0004
      0089D4 2E 0A            [ 1]  201 	jrsge	00104$
                                    202 ;	stm8s_wwdg_main.c: 147: MibWriteDebugString(cptr->usage);
      0089D6 1E 03            [ 2]  203 	ldw	x, (0x03, sp)
      0089D8 FE               [ 2]  204 	ldw	x, (x)
      0089D9 CD 8C 65         [ 4]  205 	call	_MibWriteDebugString
                                    206 ;	stm8s_wwdg_main.c: 148: return FALSE;
      0089DC 5F               [ 1]  207 	clrw	x
      0089DD CC 8B CE         [ 2]  208 	jp	00147$
      0089E0                        209 00104$:
                                    210 ;	stm8s_wwdg_main.c: 150: if (!HexToInt(argv[2], &vdwAddr, 32))
      0089E0 96               [ 1]  211 	ldw	x, sp
      0089E1 1C 00 05         [ 2]  212 	addw	x, #5
      0089E4 16 0D            [ 2]  213 	ldw	y, (0x0d, sp)
      0089E6 90 FE            [ 2]  214 	ldw	y, (y)
      0089E8 4B 20            [ 1]  215 	push	#0x20
      0089EA 4B 00            [ 1]  216 	push	#0x00
      0089EC 89               [ 2]  217 	pushw	x
      0089ED 93               [ 1]  218 	ldw	x, y
      0089EE CD 99 86         [ 4]  219 	call	_HexToInt
      0089F1 5D               [ 2]  220 	tnzw	x
      0089F2 26 0D            [ 1]  221 	jrne	00106$
                                    222 ;	stm8s_wwdg_main.c: 152: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      0089F4 4B BD            [ 1]  223 	push	#<(__str_3+0)
      0089F6 4B 80            [ 1]  224 	push	#((__str_3+0) >> 8)
      0089F8 CD 96 77         [ 4]  225 	call	_mib_printf
      0089FB 5B 02            [ 2]  226 	addw	sp, #2
                                    227 ;	stm8s_wwdg_main.c: 153: return FALSE;
      0089FD 5F               [ 1]  228 	clrw	x
      0089FE CC 8B CE         [ 2]  229 	jp	00147$
      008A01                        230 00106$:
                                    231 ;	stm8s_wwdg_main.c: 155: if (!HexToInt(argv[3], &vbData, 8))
      008A01 16 13            [ 2]  232 	ldw	y, (0x13, sp)
      008A03 90 EE 06         [ 2]  233 	ldw	y, (0x6, y)
      008A06 4B 08            [ 1]  234 	push	#0x08
      008A08 4B 00            [ 1]  235 	push	#0x00
      008A0A 96               [ 1]  236 	ldw	x, sp
      008A0B 1C 00 0B         [ 2]  237 	addw	x, #11
      008A0E 89               [ 2]  238 	pushw	x
      008A0F 93               [ 1]  239 	ldw	x, y
      008A10 CD 99 86         [ 4]  240 	call	_HexToInt
      008A13 5D               [ 2]  241 	tnzw	x
      008A14 26 0D            [ 1]  242 	jrne	00108$
                                    243 ;	stm8s_wwdg_main.c: 157: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008A16 4B BD            [ 1]  244 	push	#<(__str_3+0)
      008A18 4B 80            [ 1]  245 	push	#((__str_3+0) >> 8)
      008A1A CD 96 77         [ 4]  246 	call	_mib_printf
      008A1D 5B 02            [ 2]  247 	addw	sp, #2
                                    248 ;	stm8s_wwdg_main.c: 158: return FALSE;
      008A1F 5F               [ 1]  249 	clrw	x
      008A20 CC 8B CE         [ 2]  250 	jp	00147$
      008A23                        251 00108$:
                                    252 ;	stm8s_wwdg_main.c: 160: wr_ADDR8(vdwAddr, vbData);
      008A23 1E 07            [ 2]  253 	ldw	x, (0x07, sp)
      008A25 7B 09            [ 1]  254 	ld	a, (0x09, sp)
      008A27 F7               [ 1]  255 	ld	(x), a
                                    256 ;	stm8s_wwdg_main.c: 161: ccprintf(_DEBUG_CMD_A_,("wr_ADDR8 : 0x%08lx[0x%02x]\r\n", vdwAddr,vbData));
      008A28 5F               [ 1]  257 	clrw	x
      008A29 7B 09            [ 1]  258 	ld	a, (0x09, sp)
      008A2B 97               [ 1]  259 	ld	xl, a
      008A2C 89               [ 2]  260 	pushw	x
      008A2D 1E 09            [ 2]  261 	ldw	x, (0x09, sp)
      008A2F 89               [ 2]  262 	pushw	x
      008A30 1E 09            [ 2]  263 	ldw	x, (0x09, sp)
      008A32 89               [ 2]  264 	pushw	x
      008A33 4B DA            [ 1]  265 	push	#<(__str_4+0)
      008A35 4B 80            [ 1]  266 	push	#((__str_4+0) >> 8)
      008A37 CD 96 77         [ 4]  267 	call	_mib_printf
      008A3A 5B 08            [ 2]  268 	addw	sp, #8
      008A3C CC 8B CC         [ 2]  269 	jp	00146$
      008A3F                        270 00145$:
                                    271 ;	stm8s_wwdg_main.c: 166: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      008A3F 1E 01            [ 2]  272 	ldw	x, (0x01, sp)
      008A41 FE               [ 2]  273 	ldw	x, (x)
      008A42 4B F7            [ 1]  274 	push	#<(___str_5+0)
      008A44 4B 80            [ 1]  275 	push	#((___str_5+0) >> 8)
      008A46 CD A9 13         [ 4]  276 	call	_strcmp
      008A49 51               [ 1]  277 	exgw	x, y
                                    278 ;	stm8s_wwdg_main.c: 168: if (argc < 3)
      008A4A 1E 11            [ 2]  279 	ldw	x, (0x11, sp)
      008A4C A3 00 03         [ 2]  280 	cpw	x, #0x0003
      008A4F 2F 02            [ 1]  281 	jrslt	00249$
      008A51 4F               [ 1]  282 	clr	a
      008A52 C5                     283 	.byte 0xc5
      008A53                        284 00249$:
      008A53 A6 01            [ 1]  285 	ld	a, #0x01
      008A55                        286 00250$:
                                    287 ;	stm8s_wwdg_main.c: 166: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      008A55 90 5D            [ 2]  288 	tnzw	y
      008A57 26 48            [ 1]  289 	jrne	00142$
                                    290 ;	stm8s_wwdg_main.c: 168: if (argc < 3)
      008A59 4D               [ 1]  291 	tnz	a
      008A5A 27 0A            [ 1]  292 	jreq	00110$
                                    293 ;	stm8s_wwdg_main.c: 170: MibWriteDebugString(cptr->usage);
      008A5C 1E 03            [ 2]  294 	ldw	x, (0x03, sp)
      008A5E FE               [ 2]  295 	ldw	x, (x)
      008A5F CD 8C 65         [ 4]  296 	call	_MibWriteDebugString
                                    297 ;	stm8s_wwdg_main.c: 171: return FALSE;
      008A62 5F               [ 1]  298 	clrw	x
      008A63 CC 8B CE         [ 2]  299 	jp	00147$
      008A66                        300 00110$:
                                    301 ;	stm8s_wwdg_main.c: 173: if (!HexToInt(argv[2], &vdwAddr, 32))
      008A66 96               [ 1]  302 	ldw	x, sp
      008A67 1C 00 05         [ 2]  303 	addw	x, #5
      008A6A 16 0D            [ 2]  304 	ldw	y, (0x0d, sp)
      008A6C 90 FE            [ 2]  305 	ldw	y, (y)
      008A6E 4B 20            [ 1]  306 	push	#0x20
      008A70 4B 00            [ 1]  307 	push	#0x00
      008A72 89               [ 2]  308 	pushw	x
      008A73 93               [ 1]  309 	ldw	x, y
      008A74 CD 99 86         [ 4]  310 	call	_HexToInt
      008A77 5D               [ 2]  311 	tnzw	x
      008A78 26 0D            [ 1]  312 	jrne	00112$
                                    313 ;	stm8s_wwdg_main.c: 175: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008A7A 4B BD            [ 1]  314 	push	#<(__str_3+0)
      008A7C 4B 80            [ 1]  315 	push	#((__str_3+0) >> 8)
      008A7E CD 96 77         [ 4]  316 	call	_mib_printf
      008A81 5B 02            [ 2]  317 	addw	sp, #2
                                    318 ;	stm8s_wwdg_main.c: 176: return FALSE;
      008A83 5F               [ 1]  319 	clrw	x
      008A84 CC 8B CE         [ 2]  320 	jp	00147$
      008A87                        321 00112$:
                                    322 ;	stm8s_wwdg_main.c: 179: vbData = rd_ADDR8(vdwAddr);
      008A87 1E 07            [ 2]  323 	ldw	x, (0x07, sp)
      008A89 F6               [ 1]  324 	ld	a, (x)
      008A8A 6B 09            [ 1]  325 	ld	(0x09, sp), a
                                    326 ;	stm8s_wwdg_main.c: 181: ccprintf(_DEBUG_CMD_A_,("rd_ADDR8 : 0x%08lx[0x%02x]\r\n", vdwAddr,vbData));
      008A8C 5F               [ 1]  327 	clrw	x
      008A8D 97               [ 1]  328 	ld	xl, a
      008A8E 89               [ 2]  329 	pushw	x
      008A8F 1E 09            [ 2]  330 	ldw	x, (0x09, sp)
      008A91 89               [ 2]  331 	pushw	x
      008A92 1E 09            [ 2]  332 	ldw	x, (0x09, sp)
      008A94 89               [ 2]  333 	pushw	x
      008A95 4B FC            [ 1]  334 	push	#<(__str_6+0)
      008A97 4B 80            [ 1]  335 	push	#((__str_6+0) >> 8)
      008A99 CD 96 77         [ 4]  336 	call	_mib_printf
      008A9C 5B 08            [ 2]  337 	addw	sp, #8
      008A9E CC 8B CC         [ 2]  338 	jp	00146$
      008AA1                        339 00142$:
                                    340 ;	stm8s_wwdg_main.c: 186: else if (!strcmp(argv[1], "start")) // _CMD_MY_READ_
      008AA1 1E 01            [ 2]  341 	ldw	x, (0x01, sp)
      008AA3 FE               [ 2]  342 	ldw	x, (x)
      008AA4 88               [ 1]  343 	push	a
      008AA5 4B 19            [ 1]  344 	push	#<(___str_7+0)
      008AA7 4B 81            [ 1]  345 	push	#((___str_7+0) >> 8)
      008AA9 CD A9 13         [ 4]  346 	call	_strcmp
      008AAC 84               [ 1]  347 	pop	a
      008AAD 5D               [ 2]  348 	tnzw	x
      008AAE 27 03            [ 1]  349 	jreq	00254$
      008AB0 CC 8B 94         [ 2]  350 	jp	00139$
      008AB3                        351 00254$:
                                    352 ;	stm8s_wwdg_main.c: 188: uint8_t vbIndex = 0;
      008AB3 0F 0C            [ 1]  353 	clr	(0x0c, sp)
                                    354 ;	stm8s_wwdg_main.c: 190: if (argc < 3)
      008AB5 4D               [ 1]  355 	tnz	a
      008AB6 27 0A            [ 1]  356 	jreq	00114$
                                    357 ;	stm8s_wwdg_main.c: 192: MibWriteDebugString(cptr->usage);
      008AB8 1E 03            [ 2]  358 	ldw	x, (0x03, sp)
      008ABA FE               [ 2]  359 	ldw	x, (x)
      008ABB CD 8C 65         [ 4]  360 	call	_MibWriteDebugString
                                    361 ;	stm8s_wwdg_main.c: 193: return FALSE;
      008ABE 5F               [ 1]  362 	clrw	x
      008ABF CC 8B CE         [ 2]  363 	jp	00147$
      008AC2                        364 00114$:
                                    365 ;	stm8s_wwdg_main.c: 195: if (!DecToLong(argv[2], &vwData, 16))
      008AC2 96               [ 1]  366 	ldw	x, sp
      008AC3 1C 00 0A         [ 2]  367 	addw	x, #10
      008AC6 16 0D            [ 2]  368 	ldw	y, (0x0d, sp)
      008AC8 90 FE            [ 2]  369 	ldw	y, (y)
      008ACA 4B 10            [ 1]  370 	push	#0x10
      008ACC 4B 00            [ 1]  371 	push	#0x00
      008ACE 89               [ 2]  372 	pushw	x
      008ACF 93               [ 1]  373 	ldw	x, y
      008AD0 CD 9A 72         [ 4]  374 	call	_DecToLong
      008AD3 5D               [ 2]  375 	tnzw	x
      008AD4 26 0D            [ 1]  376 	jrne	00116$
                                    377 ;	stm8s_wwdg_main.c: 197: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008AD6 4B BD            [ 1]  378 	push	#<(__str_3+0)
      008AD8 4B 80            [ 1]  379 	push	#((__str_3+0) >> 8)
      008ADA CD 96 77         [ 4]  380 	call	_mib_printf
      008ADD 5B 02            [ 2]  381 	addw	sp, #2
                                    382 ;	stm8s_wwdg_main.c: 198: return FALSE;
      008ADF 5F               [ 1]  383 	clrw	x
      008AE0 CC 8B CE         [ 2]  384 	jp	00147$
      008AE3                        385 00116$:
                                    386 ;	stm8s_wwdg_main.c: 200: GPIO_Configuration();
      008AE3 CD 8B D4         [ 4]  387 	call	_GPIO_Configuration
                                    388 ;	stm8s_wwdg_main.c: 201: ccprintf(_DEBUG_CMD_A_, ("wwdg delay [%d] msec  fcpu : 16MHz delay (1 to 49)msec\r\n",(vwData)));		
      008AE6 1E 0A            [ 2]  389 	ldw	x, (0x0a, sp)
      008AE8 89               [ 2]  390 	pushw	x
      008AE9 4B 1F            [ 1]  391 	push	#<(__str_8+0)
      008AEB 4B 81            [ 1]  392 	push	#((__str_8+0) >> 8)
      008AED CD 96 77         [ 4]  393 	call	_mib_printf
      008AF0 5B 04            [ 2]  394 	addw	sp, #4
                                    395 ;	stm8s_wwdg_main.c: 202: if(vwData<10) vwData = 10;
      008AF2 1E 0A            [ 2]  396 	ldw	x, (0x0a, sp)
      008AF4 A3 00 0A         [ 2]  397 	cpw	x, #0x000a
      008AF7 24 07            [ 1]  398 	jrnc	00120$
      008AF9 AE 00 0A         [ 2]  399 	ldw	x, #0x000a
      008AFC 1F 0A            [ 2]  400 	ldw	(0x0a, sp), x
      008AFE 20 0A            [ 2]  401 	jra	00121$
      008B00                        402 00120$:
                                    403 ;	stm8s_wwdg_main.c: 203: else if(vwData>49) vwData = 49;
      008B00 A3 00 31         [ 2]  404 	cpw	x, #0x0031
      008B03 23 05            [ 2]  405 	jrule	00121$
      008B05 AE 00 31         [ 2]  406 	ldw	x, #0x0031
      008B08 1F 0A            [ 2]  407 	ldw	(0x0a, sp), x
      008B0A                        408 00121$:
                                    409 ;	stm8s_wwdg_main.c: 204: vbDelayCR = (calConfigWWDG(vwData) & 0x3F) | 0xC0;
      008B0A 1E 0A            [ 2]  410 	ldw	x, (0x0a, sp)
      008B0C CD 8B F1         [ 4]  411 	call	_calConfigWWDG
      008B0F 9F               [ 1]  412 	ld	a, xl
      008B10 A4 3F            [ 1]  413 	and	a, #0x3f
      008B12 AA C0            [ 1]  414 	or	a, #0xc0
      008B14 6B 0D            [ 1]  415 	ld	(0x0d, sp), a
                                    416 ;	stm8s_wwdg_main.c: 205: gwMibMiliSec = 0; 
      008B16 5F               [ 1]  417 	clrw	x
      008B17 CF 00 48         [ 2]  418 	ldw	_gwMibMiliSec+0, x
                                    419 ;	stm8s_wwdg_main.c: 206: WWDG->WR = 0x7F;
      008B1A 35 7F 50 D2      [ 1]  420 	mov	0x50d2+0, #0x7f
                                    421 ;	stm8s_wwdg_main.c: 207: WWDG->CR = vbDelayCR; 
      008B1E AE 50 D1         [ 2]  422 	ldw	x, #0x50d1
      008B21 7B 0D            [ 1]  423 	ld	a, (0x0d, sp)
      008B23 F7               [ 1]  424 	ld	(x), a
                                    425 ;	stm8s_wwdg_main.c: 208: do {				
      008B24 0F 0E            [ 1]  426 	clr	(0x0e, sp)
      008B26                        427 00129$:
                                    428 ;	stm8s_wwdg_main.c: 209: if(gwMibMiliSec==0)
      008B26 CE 00 48         [ 2]  429 	ldw	x, _gwMibMiliSec+0
      008B29 26 41            [ 1]  430 	jrne	00126$
                                    431 ;	stm8s_wwdg_main.c: 211: vbIndex++;
      008B2B 0C 0E            [ 1]  432 	inc	(0x0e, sp)
      008B2D 7B 0E            [ 1]  433 	ld	a, (0x0e, sp)
      008B2F 6B 0C            [ 1]  434 	ld	(0x0c, sp), a
                                    435 ;	stm8s_wwdg_main.c: 212: if(vbIndex==100)
      008B31 7B 0E            [ 1]  436 	ld	a, (0x0e, sp)
      008B33 A1 64            [ 1]  437 	cp	a, #0x64
      008B35 26 23            [ 1]  438 	jrne	00123$
                                    439 ;	stm8s_wwdg_main.c: 214: WWDG->CR = 0xFF; // vbDelayCR; 
      008B37 35 FF 50 D1      [ 1]  440 	mov	0x50d1+0, #0xff
                                    441 ;	stm8s_wwdg_main.c: 215: ccprintf(_DEBUG_CMD_A_, ("wwdg start....(%d)[%u:%d]\r\n",vbIndex,vwData,vwData));		
      008B3B 5F               [ 1]  442 	clrw	x
      008B3C 7B 0E            [ 1]  443 	ld	a, (0x0e, sp)
      008B3E 97               [ 1]  444 	ld	xl, a
      008B3F 16 0A            [ 2]  445 	ldw	y, (0x0a, sp)
      008B41 90 89            [ 2]  446 	pushw	y
      008B43 16 0C            [ 2]  447 	ldw	y, (0x0c, sp)
      008B45 90 89            [ 2]  448 	pushw	y
      008B47 89               [ 2]  449 	pushw	x
      008B48 4B 58            [ 1]  450 	push	#<(__str_9+0)
      008B4A 4B 81            [ 1]  451 	push	#((__str_9+0) >> 8)
      008B4C CD 96 77         [ 4]  452 	call	_mib_printf
      008B4F 5B 08            [ 2]  453 	addw	sp, #8
                                    454 ;	stm8s_wwdg_main.c: 216: MibWriteDebugEmptyCheck();
      008B51 CD 8C 5B         [ 4]  455 	call	_MibWriteDebugEmptyCheck
                                    456 ;	stm8s_wwdg_main.c: 217: WWDG->CR = 0x0; 
      008B54 35 00 50 D1      [ 1]  457 	mov	0x50d1+0, #0x00
                                    458 ;	stm8s_wwdg_main.c: 218: break;
      008B58 20 72            [ 2]  459 	jra	00146$
      008B5A                        460 00123$:
                                    461 ;	stm8s_wwdg_main.c: 222: WWDG->CR = vbDelayCR; 
      008B5A AE 50 D1         [ 2]  462 	ldw	x, #0x50d1
      008B5D 7B 0D            [ 1]  463 	ld	a, (0x0d, sp)
      008B5F F7               [ 1]  464 	ld	(x), a
                                    465 ;	stm8s_wwdg_main.c: 224: gwMibMiliSec = vwData-10; 
      008B60 1E 0A            [ 2]  466 	ldw	x, (0x0a, sp)
      008B62 1D 00 0A         [ 2]  467 	subw	x, #0x000a
      008B65 CF 00 48         [ 2]  468 	ldw	_gwMibMiliSec+0, x
                                    469 ;	stm8s_wwdg_main.c: 226: UCOM_LED1_GPIO->ODR ^= (uint8_t)UCOM_LED1_PIN;
      008B68 90 10 50 0F      [ 1]  470 	bcpl	0x500f, #0
      008B6C                        471 00126$:
                                    472 ;	stm8s_wwdg_main.c: 228: if((UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)==0)
      008B6C 72 0A 50 06 B5   [ 2]  473 	btjt	0x5006, #5, 00129$
                                    474 ;	stm8s_wwdg_main.c: 230: WWDG->CR = 0xFF; // vbDelayCR; 
      008B71 35 FF 50 D1      [ 1]  475 	mov	0x50d1+0, #0xff
                                    476 ;	stm8s_wwdg_main.c: 231: ccprintf(_DEBUG_CMD_A_, ("wwdg start....(%d)[%u:%d]\r\n",vbIndex,vwData,vwData));		
      008B75 5F               [ 1]  477 	clrw	x
      008B76 7B 0C            [ 1]  478 	ld	a, (0x0c, sp)
      008B78 97               [ 1]  479 	ld	xl, a
      008B79 16 0A            [ 2]  480 	ldw	y, (0x0a, sp)
      008B7B 90 89            [ 2]  481 	pushw	y
      008B7D 16 0C            [ 2]  482 	ldw	y, (0x0c, sp)
      008B7F 90 89            [ 2]  483 	pushw	y
      008B81 89               [ 2]  484 	pushw	x
      008B82 4B 58            [ 1]  485 	push	#<(__str_9+0)
      008B84 4B 81            [ 1]  486 	push	#((__str_9+0) >> 8)
      008B86 CD 96 77         [ 4]  487 	call	_mib_printf
      008B89 5B 08            [ 2]  488 	addw	sp, #8
                                    489 ;	stm8s_wwdg_main.c: 232: MibWriteDebugEmptyCheck();
      008B8B CD 8C 5B         [ 4]  490 	call	_MibWriteDebugEmptyCheck
                                    491 ;	stm8s_wwdg_main.c: 233: WWDG->CR = 0x0; 
      008B8E 35 00 50 D1      [ 1]  492 	mov	0x50d1+0, #0x00
                                    493 ;	stm8s_wwdg_main.c: 234: break;
      008B92 20 38            [ 2]  494 	jra	00146$
                                    495 ;	stm8s_wwdg_main.c: 236: } while(1);
      008B94                        496 00139$:
                                    497 ;	stm8s_wwdg_main.c: 242: else if (!strcmp(argv[1], "init")) // _CMD_MY_READ_
      008B94 1E 01            [ 2]  498 	ldw	x, (0x01, sp)
      008B96 FE               [ 2]  499 	ldw	x, (x)
      008B97 4B 74            [ 1]  500 	push	#<(___str_10+0)
      008B99 4B 81            [ 1]  501 	push	#((___str_10+0) >> 8)
      008B9B CD A9 13         [ 4]  502 	call	_strcmp
      008B9E 5D               [ 2]  503 	tnzw	x
      008B9F 26 0E            [ 1]  504 	jrne	00136$
                                    505 ;	stm8s_wwdg_main.c: 244: GPIO_Configuration();
      008BA1 CD 8B D4         [ 4]  506 	call	_GPIO_Configuration
                                    507 ;	stm8s_wwdg_main.c: 246: ccprintf(_DEBUG_CMD_A_, ("wwdg init....()\r\n"));		
      008BA4 4B 79            [ 1]  508 	push	#<(__str_11+0)
      008BA6 4B 81            [ 1]  509 	push	#((__str_11+0) >> 8)
      008BA8 CD 96 77         [ 4]  510 	call	_mib_printf
      008BAB 5B 02            [ 2]  511 	addw	sp, #2
      008BAD 20 1D            [ 2]  512 	jra	00146$
      008BAF                        513 00136$:
                                    514 ;	stm8s_wwdg_main.c: 251: else if (!strcmp(argv[1], "help")) // _CMD_MY_READ_
      008BAF 1E 01            [ 2]  515 	ldw	x, (0x01, sp)
      008BB1 FE               [ 2]  516 	ldw	x, (x)
      008BB2 4B 8B            [ 1]  517 	push	#<(___str_12+0)
      008BB4 4B 81            [ 1]  518 	push	#((___str_12+0) >> 8)
      008BB6 CD A9 13         [ 4]  519 	call	_strcmp
      008BB9 5D               [ 2]  520 	tnzw	x
      008BBA 26 08            [ 1]  521 	jrne	00133$
                                    522 ;	stm8s_wwdg_main.c: 255: "wwdg init // gpio init\r\n"\
      008BBC AE 81 90         [ 2]  523 	ldw	x, #(___str_13+0)
      008BBF CD 8C 65         [ 4]  524 	call	_MibWriteDebugString
      008BC2 20 08            [ 2]  525 	jra	00146$
      008BC4                        526 00133$:
                                    527 ;	stm8s_wwdg_main.c: 261: MibWriteDebugString(cptr->usage);
      008BC4 1E 03            [ 2]  528 	ldw	x, (0x03, sp)
      008BC6 FE               [ 2]  529 	ldw	x, (x)
      008BC7 CD 8C 65         [ 4]  530 	call	_MibWriteDebugString
                                    531 ;	stm8s_wwdg_main.c: 262: return FALSE;
      008BCA 5F               [ 1]  532 	clrw	x
                                    533 ;	stm8s_wwdg_main.c: 264: return TRUE;
      008BCB C5                     534 	.byte 0xc5
      008BCC                        535 00146$:
      008BCC 5F               [ 1]  536 	clrw	x
      008BCD 5C               [ 1]  537 	incw	x
      008BCE                        538 00147$:
                                    539 ;	stm8s_wwdg_main.c: 265: }
      008BCE 16 0F            [ 2]  540 	ldw	y, (15, sp)
      008BD0 5B 14            [ 2]  541 	addw	sp, #20
      008BD2 90 FC            [ 2]  542 	jp	(y)
                                    543 ;	stm8s_wwdg_main.c: 313: void GPIO_Configuration(void)
                                    544 ;	-----------------------------------------
                                    545 ;	 function GPIO_Configuration
                                    546 ;	-----------------------------------------
      008BD4                        547 _GPIO_Configuration:
                                    548 ;	stm8s_wwdg_main.c: 328: UCOM_LED1_GPIO->DDR |= (UCOM_LED1_PIN); /* Set Output mode */
      008BD4 72 10 50 11      [ 1]  549 	bset	0x5011, #0
                                    550 ;	stm8s_wwdg_main.c: 329: UCOM_LED1_GPIO->CR1 |= (UCOM_LED1_PIN);	/* Pull-Up or Push-Pull */
      008BD8 72 10 50 12      [ 1]  551 	bset	0x5012, #0
                                    552 ;	stm8s_wwdg_main.c: 330: UCOM_LED1_GPIO->CR2 |= (UCOM_LED1_PIN);	/* Output speed up to 10 MHz */
      008BDC 72 10 50 13      [ 1]  553 	bset	0x5013, #0
                                    554 ;	stm8s_wwdg_main.c: 331: UCOM_LED1_GPIO->ODR &= ~(UCOM_LED1_PIN); // low... 
      008BE0 72 11 50 0F      [ 1]  555 	bres	0x500f, #0
                                    556 ;	stm8s_wwdg_main.c: 336: UCOM_KEY1_GPIO->DDR &= ~(UCOM_KEY1_PIN);  /* Set input mode */
      008BE4 72 1B 50 07      [ 1]  557 	bres	0x5007, #5
                                    558 ;	stm8s_wwdg_main.c: 337: UCOM_KEY1_GPIO->CR1 |= (UCOM_KEY1_PIN);	 /* Pull-Up or Push-Pull */
      008BE8 72 1A 50 08      [ 1]  559 	bset	0x5008, #5
                                    560 ;	stm8s_wwdg_main.c: 338: UCOM_KEY1_GPIO->CR2 &= ~(UCOM_KEY1_PIN); /*  External interrupt disabled */
      008BEC 72 1B 50 09      [ 1]  561 	bres	0x5009, #5
                                    562 ;	stm8s_wwdg_main.c: 340: }
      008BF0 81               [ 4]  563 	ret
                                    564 	.area CODE
                                    565 	.area CONST
                                    566 	.area CONST
      00808F                        567 __str_0:
      00808F 49 4E 46 4F 3A 2B 63   568 	.ascii "INFO:+cmd_wwdg..."
             6D 64 5F 77 77 64 67
             2E 2E 2E
      0080A0 0D                     569 	.db 0x0d
      0080A1 0A                     570 	.db 0x0a
      0080A2 00                     571 	.db 0x00
                                    572 	.area CODE
                                    573 	.area CONST
      0080A3                        574 __str_1:
      0080A3 49 4E 46 4F 3A 2D 63   575 	.ascii "INFO:-cmd_wwdg..."
             6D 64 5F 77 77 64 67
             2E 2E 2E
      0080B4 0D                     576 	.db 0x0d
      0080B5 0A                     577 	.db 0x0a
      0080B6 00                     578 	.db 0x00
                                    579 	.area CODE
                                    580 	.area CONST
      0080B7                        581 ___str_2:
      0080B7 77 72 69 74 65         582 	.ascii "write"
      0080BC 00                     583 	.db 0x00
                                    584 	.area CODE
                                    585 	.area CONST
      0080BD                        586 __str_3:
      0080BD 49 6C 6C 75 67 61 6C   587 	.ascii "Illugal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      0080D7 0D                     588 	.db 0x0d
      0080D8 0A                     589 	.db 0x0a
      0080D9 00                     590 	.db 0x00
                                    591 	.area CODE
                                    592 	.area CONST
      0080DA                        593 __str_4:
      0080DA 77 72 5F 41 44 44 52   594 	.ascii "wr_ADDR8 : 0x%08lx[0x%02x]"
             38 20 3A 20 30 78 25
             30 38 6C 78 5B 30 78
             25 30 32 78 5D
      0080F4 0D                     595 	.db 0x0d
      0080F5 0A                     596 	.db 0x0a
      0080F6 00                     597 	.db 0x00
                                    598 	.area CODE
                                    599 	.area CONST
      0080F7                        600 ___str_5:
      0080F7 72 65 61 64            601 	.ascii "read"
      0080FB 00                     602 	.db 0x00
                                    603 	.area CODE
                                    604 	.area CONST
      0080FC                        605 __str_6:
      0080FC 72 64 5F 41 44 44 52   606 	.ascii "rd_ADDR8 : 0x%08lx[0x%02x]"
             38 20 3A 20 30 78 25
             30 38 6C 78 5B 30 78
             25 30 32 78 5D
      008116 0D                     607 	.db 0x0d
      008117 0A                     608 	.db 0x0a
      008118 00                     609 	.db 0x00
                                    610 	.area CODE
                                    611 	.area CONST
      008119                        612 ___str_7:
      008119 73 74 61 72 74         613 	.ascii "start"
      00811E 00                     614 	.db 0x00
                                    615 	.area CODE
                                    616 	.area CONST
      00811F                        617 __str_8:
      00811F 77 77 64 67 20 64 65   618 	.ascii "wwdg delay [%d] msec  fcpu : 16MHz delay (1 to 49)msec"
             6C 61 79 20 5B 25 64
             5D 20 6D 73 65 63 20
             20 66 63 70 75 20 3A
             20 31 36 4D 48 7A 20
             64 65 6C 61 79 20 28
             31 20 74 6F 20 34 39
             29 6D 73 65 63
      008155 0D                     619 	.db 0x0d
      008156 0A                     620 	.db 0x0a
      008157 00                     621 	.db 0x00
                                    622 	.area CODE
                                    623 	.area CONST
      008158                        624 __str_9:
      008158 77 77 64 67 20 73 74   625 	.ascii "wwdg start....(%d)[%u:%d]"
             61 72 74 2E 2E 2E 2E
             28 25 64 29 5B 25 75
             3A 25 64 5D
      008171 0D                     626 	.db 0x0d
      008172 0A                     627 	.db 0x0a
      008173 00                     628 	.db 0x00
                                    629 	.area CODE
                                    630 	.area CONST
      008174                        631 ___str_10:
      008174 69 6E 69 74            632 	.ascii "init"
      008178 00                     633 	.db 0x00
                                    634 	.area CODE
                                    635 	.area CONST
      008179                        636 __str_11:
      008179 77 77 64 67 20 69 6E   637 	.ascii "wwdg init....()"
             69 74 2E 2E 2E 2E 28
             29
      008188 0D                     638 	.db 0x0d
      008189 0A                     639 	.db 0x0a
      00818A 00                     640 	.db 0x00
                                    641 	.area CODE
                                    642 	.area CONST
      00818B                        643 ___str_12:
      00818B 68 65 6C 70            644 	.ascii "help"
      00818F 00                     645 	.db 0x00
                                    646 	.area CODE
                                    647 	.area CONST
      008190                        648 ___str_13:
      008190 77 77 64 67 20 68 65   649 	.ascii "wwdg help...."
             6C 70 2E 2E 2E 2E
      00819D 09                     650 	.db 0x09
      00819E 0D                     651 	.db 0x0d
      00819F 0A                     652 	.db 0x0a
      0081A0 77 77 64 67 20 69 6E   653 	.ascii "wwdg init // gpio init"
             69 74 20 2F 2F 20 67
             70 69 6F 20 69 6E 69
             74
      0081B6 0D                     654 	.db 0x0d
      0081B7 0A                     655 	.db 0x0a
      0081B8 77 77 64 67 20 73 74   656 	.ascii "wwdg start 49 // It should refresh within 49 miliseconds.  "
             61 72 74 20 34 39 20
             2F 2F 20 49 74 20 73
             68 6F 75 6C 64 20 72
             65 66 72 65 73 68 20
             77 69 74 68 69 6E 20
             34 39 20 6D 69 6C 69
             73 65 63 6F 6E 64 73
             2E 20 20
      0081F3 0D                     657 	.db 0x0d
      0081F4 0A                     658 	.db 0x0a
      0081F5 2F 2F 20 66 63 70 75   659 	.ascii "// fcpu : 16MHz delay (1 to 49)msec"
             20 3A 20 31 36 4D 48
             7A 20 64 65 6C 61 79
             20 28 31 20 74 6F 20
             34 39 29 6D 73 65 63
      008218 0D                     660 	.db 0x0d
      008219 0A                     661 	.db 0x0a
      00821A 00                     662 	.db 0x00
                                    663 	.area CODE
                                    664 	.area CONST
      00821B                        665 ___str_14:
      00821B 77 77 64 67            666 	.ascii "wwdg"
      00821F 00                     667 	.db 0x00
                                    668 	.area CODE
                                    669 	.area CONST
      008220                        670 ___str_15:
      008220 20 20 77 77 64 67 20   671 	.ascii "  wwdg {init} "
             7B 69 6E 69 74 7D 20
      00822E 0D                     672 	.db 0x0d
      00822F 0A                     673 	.db 0x0a
      008230 20 20 77 77 64 67 20   674 	.ascii "  wwdg {write} [addr] [data]  "
             7B 77 72 69 74 65 7D
             20 5B 61 64 64 72 5D
             20 5B 64 61 74 61 5D
             20 20
      00824E 0D                     675 	.db 0x0d
      00824F 0A                     676 	.db 0x0a
      008250 20 20 77 77 64 67 20   677 	.ascii "  wwdg {read} [addr] "
             7B 72 65 61 64 7D 20
             5B 61 64 64 72 5D 20
      008265 0D                     678 	.db 0x0d
      008266 0A                     679 	.db 0x0a
      008267 20 20 77 77 64 67 20   680 	.ascii "  wwdg {start} [delay:msec] fcpu : 16MHz delay (1 to 49) "
             7B 73 74 61 72 74 7D
             20 5B 64 65 6C 61 79
             3A 6D 73 65 63 5D 20
             66 63 70 75 20 3A 20
             31 36 4D 48 7A 20 64
             65 6C 61 79 20 28 31
             20 74 6F 20 34 39 29
             20
      0082A0 0D                     681 	.db 0x0d
      0082A1 0A                     682 	.db 0x0a
      0082A2 20 20 77 77 64 67 20   683 	.ascii "  wwdg {help}  iwdg help."
             7B 68 65 6C 70 7D 20
             20 69 77 64 67 20 68
             65 6C 70 2E
      0082BB 0D                     684 	.db 0x0d
      0082BC 0A                     685 	.db 0x0a
      0082BD 00                     686 	.db 0x00
                                    687 	.area CODE
                                    688 	.area INITIALIZER
      0088EA                        689 __xinit__cmdTbl_only:
      0088EA 82 1B                  690 	.dw ___str_14
      0088EC 89 92                  691 	.dw _DoWWDG
      0088EE 82 20                  692 	.dw ___str_15
      0088F0 00 00                  693 	.dw #0x0000
      0088F2 00 00                  694 	.dw #0x0000
      0088F4 00 00                  695 	.dw #0x0000
                                    696 	.area CABS (ABS)
