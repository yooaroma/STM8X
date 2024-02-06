                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_iwdg_main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _cmd_test_init_before_irq_enable
                                     12 	.globl _cmd_test
                                     13 	.globl _cmd_iwdg
                                     14 	.globl _calConfigIWDG
                                     15 	.globl _DecToLong
                                     16 	.globl _HexToInt
                                     17 	.globl _mib_printf
                                     18 	.globl _MibWriteDebugString
                                     19 	.globl ___memcpy
                                     20 	.globl _strcmp
                                     21 	.globl _GPIO_Configuration
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area DATA
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area INITIALIZED
      00014B                         30 _cmdTbl_only:
      00014B                         31 	.ds 12
                                     32 ;--------------------------------------------------------
                                     33 ; absolute external ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area DABS (ABS)
                                     36 
                                     37 ; default segment ordering for linker
                                     38 	.area HOME
                                     39 	.area GSINIT
                                     40 	.area GSFINAL
                                     41 	.area CONST
                                     42 	.area INITIALIZER
                                     43 	.area CODE
                                     44 
                                     45 ;--------------------------------------------------------
                                     46 ; global & static initialisations
                                     47 ;--------------------------------------------------------
                                     48 	.area HOME
                                     49 	.area GSINIT
                                     50 	.area GSFINAL
                                     51 	.area GSINIT
                                     52 ;--------------------------------------------------------
                                     53 ; Home
                                     54 ;--------------------------------------------------------
                                     55 	.area HOME
                                     56 	.area HOME
                                     57 ;--------------------------------------------------------
                                     58 ; code
                                     59 ;--------------------------------------------------------
                                     60 	.area CODE
                                     61 ;	stm8s_iwdg_main.c: 81: void cmd_iwdg(void)
                                     62 ;	-----------------------------------------
                                     63 ;	 function cmd_iwdg
                                     64 ;	-----------------------------------------
      00894A                         65 _cmd_iwdg:
      00894A 52 0A            [ 2]   66 	sub	sp, #10
                                     67 ;	stm8s_iwdg_main.c: 87: for (cptr = cmdTbl;; cptr++) 
      00894C AE 01 6D         [ 2]   68 	ldw	x, #(_cmdTbl+0)
      00894F 1F 01            [ 2]   69 	ldw	(0x01, sp), x
      008951 5F               [ 1]   70 	clrw	x
      008952 1F 07            [ 2]   71 	ldw	(0x07, sp), x
      008954 1F 05            [ 2]   72 	ldw	(0x05, sp), x
      008956 16 01            [ 2]   73 	ldw	y, (0x01, sp)
      008958 17 09            [ 2]   74 	ldw	(0x09, sp), y
      00895A                         75 00106$:
                                     76 ;	stm8s_iwdg_main.c: 89: if(cptr->cmd==0)
      00895A 1E 09            [ 2]   77 	ldw	x, (0x09, sp)
      00895C FE               [ 2]   78 	ldw	x, (x)
      00895D 1F 03            [ 2]   79 	ldw	(0x03, sp), x
      00895F 26 19            [ 1]   80 	jrne	00102$
                                     81 ;	stm8s_iwdg_main.c: 91: ccprintf(1,("INFO:+cmd_iwdg...\r\n"));
      008961 4B 8F            [ 1]   82 	push	#<(__str_0+0)
      008963 4B 80            [ 1]   83 	push	#((__str_0+0) >> 8)
      008965 CD 96 B4         [ 4]   84 	call	_mib_printf
      008968 5B 02            [ 2]   85 	addw	sp, #2
                                     86 ;	stm8s_iwdg_main.c: 92: memcpy((void *)&(cptr->cmd),(void *)&(cmdTbl_only[0].cmd),sizeof(CMD_MY));
      00896A AE 01 4B         [ 2]   87 	ldw	x, #_cmdTbl_only+0
      00896D 16 01            [ 2]   88 	ldw	y, (0x01, sp)
      00896F 4B 06            [ 1]   89 	push	#0x06
      008971 4B 00            [ 1]   90 	push	#0x00
      008973 89               [ 2]   91 	pushw	x
      008974 93               [ 1]   92 	ldw	x, y
      008975 CD A8 E0         [ 4]   93 	call	___memcpy
                                     94 ;	stm8s_iwdg_main.c: 93: break;
      008978 20 2F            [ 2]   95 	jra	00105$
      00897A                         96 00102$:
                                     97 ;	stm8s_iwdg_main.c: 95: index++;
      00897A 1E 07            [ 2]   98 	ldw	x, (0x07, sp)
      00897C 5C               [ 1]   99 	incw	x
      00897D 1F 07            [ 2]  100 	ldw	(0x07, sp), x
      00897F 26 05            [ 1]  101 	jrne	00126$
      008981 1E 05            [ 2]  102 	ldw	x, (0x05, sp)
      008983 5C               [ 1]  103 	incw	x
      008984 1F 05            [ 2]  104 	ldw	(0x05, sp), x
      008986                        105 00126$:
                                    106 ;	stm8s_iwdg_main.c: 96: if(index>MAX_COMMANDS)
      008986 AE 00 06         [ 2]  107 	ldw	x, #0x0006
      008989 13 07            [ 2]  108 	cpw	x, (0x07, sp)
      00898B 4F               [ 1]  109 	clr	a
      00898C 12 06            [ 1]  110 	sbc	a, (0x06, sp)
      00898E 4F               [ 1]  111 	clr	a
      00898F 12 05            [ 1]  112 	sbc	a, (0x05, sp)
      008991 24 0B            [ 1]  113 	jrnc	00107$
                                    114 ;	stm8s_iwdg_main.c: 98: ccprintf(1,("INFO:-cmd_iwdg...\r\n"));
      008993 4B A3            [ 1]  115 	push	#<(__str_1+0)
      008995 4B 80            [ 1]  116 	push	#((__str_1+0) >> 8)
      008997 CD 96 B4         [ 4]  117 	call	_mib_printf
      00899A 5B 02            [ 2]  118 	addw	sp, #2
                                    119 ;	stm8s_iwdg_main.c: 99: return;
      00899C 20 0B            [ 2]  120 	jra	00108$
      00899E                        121 00107$:
                                    122 ;	stm8s_iwdg_main.c: 87: for (cptr = cmdTbl;; cptr++) 
      00899E 1E 09            [ 2]  123 	ldw	x, (0x09, sp)
      0089A0 1C 00 06         [ 2]  124 	addw	x, #0x0006
      0089A3 1F 09            [ 2]  125 	ldw	(0x09, sp), x
      0089A5 1F 01            [ 2]  126 	ldw	(0x01, sp), x
      0089A7 20 B1            [ 2]  127 	jra	00106$
      0089A9                        128 00105$:
                                    129 ;	stm8s_iwdg_main.c: 102: return;
      0089A9                        130 00108$:
                                    131 ;	stm8s_iwdg_main.c: 103: }
      0089A9 5B 0A            [ 2]  132 	addw	sp, #10
      0089AB 81               [ 4]  133 	ret
                                    134 ;	stm8s_iwdg_main.c: 108: void cmd_test(void)
                                    135 ;	-----------------------------------------
                                    136 ;	 function cmd_test
                                    137 ;	-----------------------------------------
      0089AC                        138 _cmd_test:
                                    139 ;	stm8s_iwdg_main.c: 110: cmd_iwdg();
                                    140 ;	stm8s_iwdg_main.c: 111: }
      0089AC CC 89 4A         [ 2]  141 	jp	_cmd_iwdg
                                    142 ;	stm8s_iwdg_main.c: 117: void cmd_test_init_before_irq_enable(void)
                                    143 ;	-----------------------------------------
                                    144 ;	 function cmd_test_init_before_irq_enable
                                    145 ;	-----------------------------------------
      0089AF                        146 _cmd_test_init_before_irq_enable:
                                    147 ;	stm8s_iwdg_main.c: 120: }
      0089AF 81               [ 4]  148 	ret
                                    149 ;	stm8s_iwdg_main.c: 131: static int DoIWDG(CMD_MY *cptr, int argc, char **argv)
                                    150 ;	-----------------------------------------
                                    151 ;	 function DoIWDG
                                    152 ;	-----------------------------------------
      0089B0                        153 _DoIWDG:
      0089B0 52 0D            [ 2]  154 	sub	sp, #13
      0089B2 51               [ 1]  155 	exgw	x, y
                                    156 ;	stm8s_iwdg_main.c: 133: uint32_t vdwAddr = 0;
      0089B3 5F               [ 1]  157 	clrw	x
      0089B4 1F 03            [ 2]  158 	ldw	(0x03, sp), x
      0089B6 1F 01            [ 2]  159 	ldw	(0x01, sp), x
                                    160 ;	stm8s_iwdg_main.c: 134: uint8_t vbData = 0;
      0089B8 0F 05            [ 1]  161 	clr	(0x05, sp)
                                    162 ;	stm8s_iwdg_main.c: 135: uint16_t vwData = 0;
      0089BA 5F               [ 1]  163 	clrw	x
      0089BB 1F 06            [ 2]  164 	ldw	(0x06, sp), x
                                    165 ;	stm8s_iwdg_main.c: 139: MibWriteDebugString(cptr->usage);
      0089BD 93               [ 1]  166 	ldw	x, y
      0089BE 1C 00 04         [ 2]  167 	addw	x, #0x0004
      0089C1 1F 08            [ 2]  168 	ldw	(0x08, sp), x
                                    169 ;	stm8s_iwdg_main.c: 137: if (argc < 2)
      0089C3 1E 10            [ 2]  170 	ldw	x, (0x10, sp)
      0089C5 A3 00 02         [ 2]  171 	cpw	x, #0x0002
      0089C8 2E 0A            [ 1]  172 	jrsge	00102$
                                    173 ;	stm8s_iwdg_main.c: 139: MibWriteDebugString(cptr->usage);
      0089CA 1E 08            [ 2]  174 	ldw	x, (0x08, sp)
      0089CC FE               [ 2]  175 	ldw	x, (x)
      0089CD CD 8C A2         [ 4]  176 	call	_MibWriteDebugString
                                    177 ;	stm8s_iwdg_main.c: 140: return FALSE;
      0089D0 5F               [ 1]  178 	clrw	x
      0089D1 CC 8B AA         [ 2]  179 	jp	00141$
      0089D4                        180 00102$:
                                    181 ;	stm8s_iwdg_main.c: 145: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      0089D4 1E 12            [ 2]  182 	ldw	x, (0x12, sp)
      0089D6 5C               [ 1]  183 	incw	x
      0089D7 5C               [ 1]  184 	incw	x
      0089D8 1F 0A            [ 2]  185 	ldw	(0x0a, sp), x
      0089DA FE               [ 2]  186 	ldw	x, (x)
      0089DB 4B B7            [ 1]  187 	push	#<(___str_2+0)
      0089DD 4B 80            [ 1]  188 	push	#((___str_2+0) >> 8)
      0089DF CD A9 64         [ 4]  189 	call	_strcmp
                                    190 ;	stm8s_iwdg_main.c: 152: if (!HexToInt(argv[2], &vdwAddr, 32))
      0089E2 16 12            [ 2]  191 	ldw	y, (0x12, sp)
      0089E4 72 A9 00 04      [ 2]  192 	addw	y, #0x0004
      0089E8 17 0C            [ 2]  193 	ldw	(0x0c, sp), y
                                    194 ;	stm8s_iwdg_main.c: 145: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      0089EA 5D               [ 2]  195 	tnzw	x
      0089EB 26 6E            [ 1]  196 	jrne	00139$
                                    197 ;	stm8s_iwdg_main.c: 147: if (argc < 4)
      0089ED 1E 10            [ 2]  198 	ldw	x, (0x10, sp)
      0089EF A3 00 04         [ 2]  199 	cpw	x, #0x0004
      0089F2 2E 0A            [ 1]  200 	jrsge	00104$
                                    201 ;	stm8s_iwdg_main.c: 149: MibWriteDebugString(cptr->usage);
      0089F4 1E 08            [ 2]  202 	ldw	x, (0x08, sp)
      0089F6 FE               [ 2]  203 	ldw	x, (x)
      0089F7 CD 8C A2         [ 4]  204 	call	_MibWriteDebugString
                                    205 ;	stm8s_iwdg_main.c: 150: return FALSE;
      0089FA 5F               [ 1]  206 	clrw	x
      0089FB CC 8B AA         [ 2]  207 	jp	00141$
      0089FE                        208 00104$:
                                    209 ;	stm8s_iwdg_main.c: 152: if (!HexToInt(argv[2], &vdwAddr, 32))
      0089FE 96               [ 1]  210 	ldw	x, sp
      0089FF 5C               [ 1]  211 	incw	x
      008A00 16 0C            [ 2]  212 	ldw	y, (0x0c, sp)
      008A02 90 FE            [ 2]  213 	ldw	y, (y)
      008A04 4B 20            [ 1]  214 	push	#0x20
      008A06 4B 00            [ 1]  215 	push	#0x00
      008A08 89               [ 2]  216 	pushw	x
      008A09 93               [ 1]  217 	ldw	x, y
      008A0A CD 99 BA         [ 4]  218 	call	_HexToInt
      008A0D 5D               [ 2]  219 	tnzw	x
      008A0E 26 0D            [ 1]  220 	jrne	00106$
                                    221 ;	stm8s_iwdg_main.c: 154: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008A10 4B BD            [ 1]  222 	push	#<(__str_3+0)
      008A12 4B 80            [ 1]  223 	push	#((__str_3+0) >> 8)
      008A14 CD 96 B4         [ 4]  224 	call	_mib_printf
      008A17 5B 02            [ 2]  225 	addw	sp, #2
                                    226 ;	stm8s_iwdg_main.c: 155: return FALSE;
      008A19 5F               [ 1]  227 	clrw	x
      008A1A CC 8B AA         [ 2]  228 	jp	00141$
      008A1D                        229 00106$:
                                    230 ;	stm8s_iwdg_main.c: 157: if (!HexToInt(argv[3], &vbData, 8))
      008A1D 16 12            [ 2]  231 	ldw	y, (0x12, sp)
      008A1F 90 EE 06         [ 2]  232 	ldw	y, (0x6, y)
      008A22 4B 08            [ 1]  233 	push	#0x08
      008A24 4B 00            [ 1]  234 	push	#0x00
      008A26 96               [ 1]  235 	ldw	x, sp
      008A27 1C 00 07         [ 2]  236 	addw	x, #7
      008A2A 89               [ 2]  237 	pushw	x
      008A2B 93               [ 1]  238 	ldw	x, y
      008A2C CD 99 BA         [ 4]  239 	call	_HexToInt
      008A2F 5D               [ 2]  240 	tnzw	x
      008A30 26 0D            [ 1]  241 	jrne	00108$
                                    242 ;	stm8s_iwdg_main.c: 159: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008A32 4B BD            [ 1]  243 	push	#<(__str_3+0)
      008A34 4B 80            [ 1]  244 	push	#((__str_3+0) >> 8)
      008A36 CD 96 B4         [ 4]  245 	call	_mib_printf
      008A39 5B 02            [ 2]  246 	addw	sp, #2
                                    247 ;	stm8s_iwdg_main.c: 160: return FALSE;
      008A3B 5F               [ 1]  248 	clrw	x
      008A3C CC 8B AA         [ 2]  249 	jp	00141$
      008A3F                        250 00108$:
                                    251 ;	stm8s_iwdg_main.c: 162: wr_ADDR8(vdwAddr, vbData);
      008A3F 1E 03            [ 2]  252 	ldw	x, (0x03, sp)
      008A41 7B 05            [ 1]  253 	ld	a, (0x05, sp)
      008A43 F7               [ 1]  254 	ld	(x), a
                                    255 ;	stm8s_iwdg_main.c: 163: ccprintf(_DEBUG_CMD_A_,("wr_ADDR8 : 0x%08lx[0x%02x]\r\n", vdwAddr,vbData));
      008A44 5F               [ 1]  256 	clrw	x
      008A45 7B 05            [ 1]  257 	ld	a, (0x05, sp)
      008A47 97               [ 1]  258 	ld	xl, a
      008A48 89               [ 2]  259 	pushw	x
      008A49 1E 05            [ 2]  260 	ldw	x, (0x05, sp)
      008A4B 89               [ 2]  261 	pushw	x
      008A4C 1E 05            [ 2]  262 	ldw	x, (0x05, sp)
      008A4E 89               [ 2]  263 	pushw	x
      008A4F 4B DA            [ 1]  264 	push	#<(__str_4+0)
      008A51 4B 80            [ 1]  265 	push	#((__str_4+0) >> 8)
      008A53 CD 96 B4         [ 4]  266 	call	_mib_printf
      008A56 5B 08            [ 2]  267 	addw	sp, #8
      008A58 CC 8B A8         [ 2]  268 	jp	00140$
      008A5B                        269 00139$:
                                    270 ;	stm8s_iwdg_main.c: 168: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      008A5B 1E 0A            [ 2]  271 	ldw	x, (0x0a, sp)
      008A5D FE               [ 2]  272 	ldw	x, (x)
      008A5E 4B F7            [ 1]  273 	push	#<(___str_5+0)
      008A60 4B 80            [ 1]  274 	push	#((___str_5+0) >> 8)
      008A62 CD A9 64         [ 4]  275 	call	_strcmp
      008A65 51               [ 1]  276 	exgw	x, y
                                    277 ;	stm8s_iwdg_main.c: 170: if (argc < 3)
      008A66 1E 10            [ 2]  278 	ldw	x, (0x10, sp)
      008A68 A3 00 03         [ 2]  279 	cpw	x, #0x0003
      008A6B 2F 02            [ 1]  280 	jrslt	00229$
      008A6D 4F               [ 1]  281 	clr	a
      008A6E C5                     282 	.byte 0xc5
      008A6F                        283 00229$:
      008A6F A6 01            [ 1]  284 	ld	a, #0x01
      008A71                        285 00230$:
                                    286 ;	stm8s_iwdg_main.c: 168: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      008A71 90 5D            [ 2]  287 	tnzw	y
      008A73 26 46            [ 1]  288 	jrne	00136$
                                    289 ;	stm8s_iwdg_main.c: 170: if (argc < 3)
      008A75 4D               [ 1]  290 	tnz	a
      008A76 27 0A            [ 1]  291 	jreq	00110$
                                    292 ;	stm8s_iwdg_main.c: 172: MibWriteDebugString(cptr->usage);
      008A78 1E 08            [ 2]  293 	ldw	x, (0x08, sp)
      008A7A FE               [ 2]  294 	ldw	x, (x)
      008A7B CD 8C A2         [ 4]  295 	call	_MibWriteDebugString
                                    296 ;	stm8s_iwdg_main.c: 173: return FALSE;
      008A7E 5F               [ 1]  297 	clrw	x
      008A7F CC 8B AA         [ 2]  298 	jp	00141$
      008A82                        299 00110$:
                                    300 ;	stm8s_iwdg_main.c: 175: if (!HexToInt(argv[2], &vdwAddr, 32))
      008A82 96               [ 1]  301 	ldw	x, sp
      008A83 5C               [ 1]  302 	incw	x
      008A84 16 0C            [ 2]  303 	ldw	y, (0x0c, sp)
      008A86 90 FE            [ 2]  304 	ldw	y, (y)
      008A88 4B 20            [ 1]  305 	push	#0x20
      008A8A 4B 00            [ 1]  306 	push	#0x00
      008A8C 89               [ 2]  307 	pushw	x
      008A8D 93               [ 1]  308 	ldw	x, y
      008A8E CD 99 BA         [ 4]  309 	call	_HexToInt
      008A91 5D               [ 2]  310 	tnzw	x
      008A92 26 0D            [ 1]  311 	jrne	00112$
                                    312 ;	stm8s_iwdg_main.c: 177: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008A94 4B BD            [ 1]  313 	push	#<(__str_3+0)
      008A96 4B 80            [ 1]  314 	push	#((__str_3+0) >> 8)
      008A98 CD 96 B4         [ 4]  315 	call	_mib_printf
      008A9B 5B 02            [ 2]  316 	addw	sp, #2
                                    317 ;	stm8s_iwdg_main.c: 178: return FALSE;
      008A9D 5F               [ 1]  318 	clrw	x
      008A9E CC 8B AA         [ 2]  319 	jp	00141$
      008AA1                        320 00112$:
                                    321 ;	stm8s_iwdg_main.c: 181: vbData = rd_ADDR8(vdwAddr);
      008AA1 1E 03            [ 2]  322 	ldw	x, (0x03, sp)
      008AA3 F6               [ 1]  323 	ld	a, (x)
      008AA4 6B 05            [ 1]  324 	ld	(0x05, sp), a
                                    325 ;	stm8s_iwdg_main.c: 183: ccprintf(_DEBUG_CMD_A_,("rd_ADDR8 : 0x%08lx[0x%02x]\r\n", vdwAddr,vbData));
      008AA6 5F               [ 1]  326 	clrw	x
      008AA7 97               [ 1]  327 	ld	xl, a
      008AA8 89               [ 2]  328 	pushw	x
      008AA9 1E 05            [ 2]  329 	ldw	x, (0x05, sp)
      008AAB 89               [ 2]  330 	pushw	x
      008AAC 1E 05            [ 2]  331 	ldw	x, (0x05, sp)
      008AAE 89               [ 2]  332 	pushw	x
      008AAF 4B FC            [ 1]  333 	push	#<(__str_6+0)
      008AB1 4B 80            [ 1]  334 	push	#((__str_6+0) >> 8)
      008AB3 CD 96 B4         [ 4]  335 	call	_mib_printf
      008AB6 5B 08            [ 2]  336 	addw	sp, #8
      008AB8 CC 8B A8         [ 2]  337 	jp	00140$
      008ABB                        338 00136$:
                                    339 ;	stm8s_iwdg_main.c: 188: else if (!strcmp(argv[1], "start")) // _CMD_MY_READ_
      008ABB 1E 0A            [ 2]  340 	ldw	x, (0x0a, sp)
      008ABD FE               [ 2]  341 	ldw	x, (x)
      008ABE 88               [ 1]  342 	push	a
      008ABF 4B 19            [ 1]  343 	push	#<(___str_7+0)
      008AC1 4B 81            [ 1]  344 	push	#((___str_7+0) >> 8)
      008AC3 CD A9 64         [ 4]  345 	call	_strcmp
      008AC6 84               [ 1]  346 	pop	a
      008AC7 5D               [ 2]  347 	tnzw	x
      008AC8 27 03            [ 1]  348 	jreq	00234$
      008ACA CC 8B 70         [ 2]  349 	jp	00133$
      008ACD                        350 00234$:
                                    351 ;	stm8s_iwdg_main.c: 191: uint16_t vwDelayWD = 0;
      008ACD 90 5F            [ 1]  352 	clrw	y
                                    353 ;	stm8s_iwdg_main.c: 192: if (argc < 3)
      008ACF 4D               [ 1]  354 	tnz	a
      008AD0 27 0A            [ 1]  355 	jreq	00114$
                                    356 ;	stm8s_iwdg_main.c: 194: MibWriteDebugString(cptr->usage);
      008AD2 1E 08            [ 2]  357 	ldw	x, (0x08, sp)
      008AD4 FE               [ 2]  358 	ldw	x, (x)
      008AD5 CD 8C A2         [ 4]  359 	call	_MibWriteDebugString
                                    360 ;	stm8s_iwdg_main.c: 195: return FALSE;
      008AD8 5F               [ 1]  361 	clrw	x
      008AD9 CC 8B AA         [ 2]  362 	jp	00141$
      008ADC                        363 00114$:
                                    364 ;	stm8s_iwdg_main.c: 197: if (!DecToLong(argv[2], &vwData, 16))
      008ADC 1E 0C            [ 2]  365 	ldw	x, (0x0c, sp)
      008ADE FE               [ 2]  366 	ldw	x, (x)
      008ADF 1F 0A            [ 2]  367 	ldw	(0x0a, sp), x
      008AE1 90 89            [ 2]  368 	pushw	y
      008AE3 4B 10            [ 1]  369 	push	#0x10
      008AE5 4B 00            [ 1]  370 	push	#0x00
      008AE7 96               [ 1]  371 	ldw	x, sp
      008AE8 1C 00 0A         [ 2]  372 	addw	x, #10
      008AEB 89               [ 2]  373 	pushw	x
      008AEC 1E 10            [ 2]  374 	ldw	x, (0x10, sp)
      008AEE CD 9A A6         [ 4]  375 	call	_DecToLong
      008AF1 90 85            [ 2]  376 	popw	y
      008AF3 5D               [ 2]  377 	tnzw	x
      008AF4 26 0D            [ 1]  378 	jrne	00116$
                                    379 ;	stm8s_iwdg_main.c: 199: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008AF6 4B BD            [ 1]  380 	push	#<(__str_3+0)
      008AF8 4B 80            [ 1]  381 	push	#((__str_3+0) >> 8)
      008AFA CD 96 B4         [ 4]  382 	call	_mib_printf
      008AFD 5B 02            [ 2]  383 	addw	sp, #2
                                    384 ;	stm8s_iwdg_main.c: 200: return FALSE;
      008AFF 5F               [ 1]  385 	clrw	x
      008B00 CC 8B AA         [ 2]  386 	jp	00141$
      008B03                        387 00116$:
                                    388 ;	stm8s_iwdg_main.c: 202: GPIO_Configuration();
      008B03 90 89            [ 2]  389 	pushw	y
      008B05 CD 8B B0         [ 4]  390 	call	_GPIO_Configuration
      008B08 1E 08            [ 2]  391 	ldw	x, (0x08, sp)
      008B0A 89               [ 2]  392 	pushw	x
      008B0B 4B 1F            [ 1]  393 	push	#<(__str_8+0)
      008B0D 4B 81            [ 1]  394 	push	#((__str_8+0) >> 8)
      008B0F CD 96 B4         [ 4]  395 	call	_mib_printf
      008B12 5B 04            [ 2]  396 	addw	sp, #4
      008B14 1E 08            [ 2]  397 	ldw	x, (0x08, sp)
      008B16 CD 8B CD         [ 4]  398 	call	_calConfigIWDG
      008B19 90 85            [ 2]  399 	popw	y
                                    400 ;	stm8s_iwdg_main.c: 205: gwMibMiliSec = 0; 
      008B1B 5F               [ 1]  401 	clrw	x
      008B1C CF 00 47         [ 2]  402 	ldw	_gwMibMiliSec+0, x
                                    403 ;	stm8s_iwdg_main.c: 206: do {	
      008B1F 0F 0D            [ 1]  404 	clr	(0x0d, sp)
      008B21                        405 00123$:
                                    406 ;	stm8s_iwdg_main.c: 207: if(gwMibMiliSec==0)
      008B21 CE 00 47         [ 2]  407 	ldw	x, _gwMibMiliSec+0
      008B24 26 FB            [ 1]  408 	jrne	00123$
                                    409 ;	stm8s_iwdg_main.c: 209: IWDG->KR = 0xAA; // KEY_REFRESH
      008B26 35 AA 50 E0      [ 1]  410 	mov	0x50e0+0, #0xaa
                                    411 ;	stm8s_iwdg_main.c: 210: if(vwDelayWD==0)
      008B2A 90 5D            [ 2]  412 	tnzw	y
      008B2C 26 32            [ 1]  413 	jrne	00120$
                                    414 ;	stm8s_iwdg_main.c: 212: vbIndex++;
      008B2E 0C 0D            [ 1]  415 	inc	(0x0d, sp)
                                    416 ;	stm8s_iwdg_main.c: 213: vwDelayWD = 100 * vbIndex;
      008B30 5F               [ 1]  417 	clrw	x
      008B31 7B 0D            [ 1]  418 	ld	a, (0x0d, sp)
      008B33 97               [ 1]  419 	ld	xl, a
      008B34 89               [ 2]  420 	pushw	x
      008B35 89               [ 2]  421 	pushw	x
      008B36 AE 00 64         [ 2]  422 	ldw	x, #0x0064
      008B39 CD A7 77         [ 4]  423 	call	__mulint
      008B3C 51               [ 1]  424 	exgw	x, y
      008B3D 85               [ 2]  425 	popw	x
                                    426 ;	stm8s_iwdg_main.c: 214: ccprintf(_DEBUG_CMD_A_, ("iwdg start....(%d)[%u:%u]\r\n",vbIndex,vwData,vwDelayWD));		
      008B3E 90 89            [ 2]  427 	pushw	y
      008B40 90 89            [ 2]  428 	pushw	y
      008B42 7B 0B            [ 1]  429 	ld	a, (0x0b, sp)
      008B44 88               [ 1]  430 	push	a
      008B45 7B 0B            [ 1]  431 	ld	a, (0x0b, sp)
      008B47 88               [ 1]  432 	push	a
      008B48 89               [ 2]  433 	pushw	x
      008B49 4B 5D            [ 1]  434 	push	#<(__str_9+0)
      008B4B 4B 81            [ 1]  435 	push	#((__str_9+0) >> 8)
      008B4D CD 96 B4         [ 4]  436 	call	_mib_printf
      008B50 5B 08            [ 2]  437 	addw	sp, #8
      008B52 90 85            [ 2]  438 	popw	y
                                    439 ;	stm8s_iwdg_main.c: 215: if(vwDelayWD>=(vwData+100))
      008B54 1E 06            [ 2]  440 	ldw	x, (0x06, sp)
      008B56 1C 00 64         [ 2]  441 	addw	x, #0x0064
      008B59 1F 0B            [ 2]  442 	ldw	(0x0b, sp), x
      008B5B 93               [ 1]  443 	ldw	x, y
      008B5C 13 0B            [ 2]  444 	cpw	x, (0x0b, sp)
      008B5E 24 48            [ 1]  445 	jrnc	00140$
                                    446 ;	stm8s_iwdg_main.c: 217: break;
      008B60                        447 00120$:
                                    448 ;	stm8s_iwdg_main.c: 220: gwMibMiliSec = 100;
      008B60 AE 00 64         [ 2]  449 	ldw	x, #0x0064
      008B63 CF 00 47         [ 2]  450 	ldw	_gwMibMiliSec+0, x
                                    451 ;	stm8s_iwdg_main.c: 221: vwDelayWD -= 100;
      008B66 72 A2 00 64      [ 2]  452 	subw	y, #0x0064
                                    453 ;	stm8s_iwdg_main.c: 223: UCOM_LED1_GPIO->ODR ^= (uint8_t)UCOM_LED1_PIN;
      008B6A 90 10 50 0F      [ 1]  454 	bcpl	0x500f, #0
                                    455 ;	stm8s_iwdg_main.c: 225: } while(1);
      008B6E 20 B1            [ 2]  456 	jra	00123$
      008B70                        457 00133$:
                                    458 ;	stm8s_iwdg_main.c: 231: else if (!strcmp(argv[1], "init")) // _CMD_MY_READ_
      008B70 1E 0A            [ 2]  459 	ldw	x, (0x0a, sp)
      008B72 FE               [ 2]  460 	ldw	x, (x)
      008B73 4B 79            [ 1]  461 	push	#<(___str_10+0)
      008B75 4B 81            [ 1]  462 	push	#((___str_10+0) >> 8)
      008B77 CD A9 64         [ 4]  463 	call	_strcmp
      008B7A 5D               [ 2]  464 	tnzw	x
      008B7B 26 0E            [ 1]  465 	jrne	00130$
                                    466 ;	stm8s_iwdg_main.c: 233: GPIO_Configuration();
      008B7D CD 8B B0         [ 4]  467 	call	_GPIO_Configuration
                                    468 ;	stm8s_iwdg_main.c: 235: ccprintf(_DEBUG_CMD_A_, ("iwdg init....()\r\n"));		
      008B80 4B 7E            [ 1]  469 	push	#<(__str_11+0)
      008B82 4B 81            [ 1]  470 	push	#((__str_11+0) >> 8)
      008B84 CD 96 B4         [ 4]  471 	call	_mib_printf
      008B87 5B 02            [ 2]  472 	addw	sp, #2
      008B89 20 1D            [ 2]  473 	jra	00140$
      008B8B                        474 00130$:
                                    475 ;	stm8s_iwdg_main.c: 240: else if (!strcmp(argv[1], "help")) // _CMD_MY_READ_
      008B8B 1E 0A            [ 2]  476 	ldw	x, (0x0a, sp)
      008B8D FE               [ 2]  477 	ldw	x, (x)
      008B8E 4B 90            [ 1]  478 	push	#<(___str_12+0)
      008B90 4B 81            [ 1]  479 	push	#((___str_12+0) >> 8)
      008B92 CD A9 64         [ 4]  480 	call	_strcmp
      008B95 5D               [ 2]  481 	tnzw	x
      008B96 26 08            [ 1]  482 	jrne	00127$
                                    483 ;	stm8s_iwdg_main.c: 243: "iwdg init // gpio init\r\n"\
      008B98 AE 81 95         [ 2]  484 	ldw	x, #(___str_13+0)
      008B9B CD 8C A2         [ 4]  485 	call	_MibWriteDebugString
      008B9E 20 08            [ 2]  486 	jra	00140$
      008BA0                        487 00127$:
                                    488 ;	stm8s_iwdg_main.c: 249: MibWriteDebugString(cptr->usage);
      008BA0 1E 08            [ 2]  489 	ldw	x, (0x08, sp)
      008BA2 FE               [ 2]  490 	ldw	x, (x)
      008BA3 CD 8C A2         [ 4]  491 	call	_MibWriteDebugString
                                    492 ;	stm8s_iwdg_main.c: 250: return FALSE;
      008BA6 5F               [ 1]  493 	clrw	x
                                    494 ;	stm8s_iwdg_main.c: 252: return TRUE;
      008BA7 C5                     495 	.byte 0xc5
      008BA8                        496 00140$:
      008BA8 5F               [ 1]  497 	clrw	x
      008BA9 5C               [ 1]  498 	incw	x
      008BAA                        499 00141$:
                                    500 ;	stm8s_iwdg_main.c: 253: }
      008BAA 16 0E            [ 2]  501 	ldw	y, (14, sp)
      008BAC 5B 13            [ 2]  502 	addw	sp, #19
      008BAE 90 FC            [ 2]  503 	jp	(y)
                                    504 ;	stm8s_iwdg_main.c: 301: void GPIO_Configuration(void)
                                    505 ;	-----------------------------------------
                                    506 ;	 function GPIO_Configuration
                                    507 ;	-----------------------------------------
      008BB0                        508 _GPIO_Configuration:
                                    509 ;	stm8s_iwdg_main.c: 316: UCOM_LED1_GPIO->DDR |= (UCOM_LED1_PIN); /* Set Output mode */
      008BB0 72 10 50 11      [ 1]  510 	bset	0x5011, #0
                                    511 ;	stm8s_iwdg_main.c: 317: UCOM_LED1_GPIO->CR1 |= (UCOM_LED1_PIN);	/* Pull-Up or Push-Pull */
      008BB4 72 10 50 12      [ 1]  512 	bset	0x5012, #0
                                    513 ;	stm8s_iwdg_main.c: 318: UCOM_LED1_GPIO->CR2 |= (UCOM_LED1_PIN);	/* Output speed up to 10 MHz */
      008BB8 72 10 50 13      [ 1]  514 	bset	0x5013, #0
                                    515 ;	stm8s_iwdg_main.c: 319: UCOM_LED1_GPIO->ODR &= ~(UCOM_LED1_PIN); // low... 
      008BBC 72 11 50 0F      [ 1]  516 	bres	0x500f, #0
                                    517 ;	stm8s_iwdg_main.c: 324: UCOM_KEY1_GPIO->DDR &= ~(UCOM_KEY1_PIN);  /* Set input mode */
      008BC0 72 1B 50 07      [ 1]  518 	bres	0x5007, #5
                                    519 ;	stm8s_iwdg_main.c: 325: UCOM_KEY1_GPIO->CR1 |= (UCOM_KEY1_PIN);	 /* Pull-Up or Push-Pull */
      008BC4 72 1A 50 08      [ 1]  520 	bset	0x5008, #5
                                    521 ;	stm8s_iwdg_main.c: 326: UCOM_KEY1_GPIO->CR2 &= ~(UCOM_KEY1_PIN); /*  External interrupt disabled */
      008BC8 72 1B 50 09      [ 1]  522 	bres	0x5009, #5
                                    523 ;	stm8s_iwdg_main.c: 328: }
      008BCC 81               [ 4]  524 	ret
                                    525 	.area CODE
                                    526 	.area CONST
                                    527 	.area CONST
      00808F                        528 __str_0:
      00808F 49 4E 46 4F 3A 2B 63   529 	.ascii "INFO:+cmd_iwdg..."
             6D 64 5F 69 77 64 67
             2E 2E 2E
      0080A0 0D                     530 	.db 0x0d
      0080A1 0A                     531 	.db 0x0a
      0080A2 00                     532 	.db 0x00
                                    533 	.area CODE
                                    534 	.area CONST
      0080A3                        535 __str_1:
      0080A3 49 4E 46 4F 3A 2D 63   536 	.ascii "INFO:-cmd_iwdg..."
             6D 64 5F 69 77 64 67
             2E 2E 2E
      0080B4 0D                     537 	.db 0x0d
      0080B5 0A                     538 	.db 0x0a
      0080B6 00                     539 	.db 0x00
                                    540 	.area CODE
                                    541 	.area CONST
      0080B7                        542 ___str_2:
      0080B7 77 72 69 74 65         543 	.ascii "write"
      0080BC 00                     544 	.db 0x00
                                    545 	.area CODE
                                    546 	.area CONST
      0080BD                        547 __str_3:
      0080BD 49 6C 6C 75 67 61 6C   548 	.ascii "Illugal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      0080D7 0D                     549 	.db 0x0d
      0080D8 0A                     550 	.db 0x0a
      0080D9 00                     551 	.db 0x00
                                    552 	.area CODE
                                    553 	.area CONST
      0080DA                        554 __str_4:
      0080DA 77 72 5F 41 44 44 52   555 	.ascii "wr_ADDR8 : 0x%08lx[0x%02x]"
             38 20 3A 20 30 78 25
             30 38 6C 78 5B 30 78
             25 30 32 78 5D
      0080F4 0D                     556 	.db 0x0d
      0080F5 0A                     557 	.db 0x0a
      0080F6 00                     558 	.db 0x00
                                    559 	.area CODE
                                    560 	.area CONST
      0080F7                        561 ___str_5:
      0080F7 72 65 61 64            562 	.ascii "read"
      0080FB 00                     563 	.db 0x00
                                    564 	.area CODE
                                    565 	.area CONST
      0080FC                        566 __str_6:
      0080FC 72 64 5F 41 44 44 52   567 	.ascii "rd_ADDR8 : 0x%08lx[0x%02x]"
             38 20 3A 20 30 78 25
             30 38 6C 78 5B 30 78
             25 30 32 78 5D
      008116 0D                     568 	.db 0x0d
      008117 0A                     569 	.db 0x0a
      008118 00                     570 	.db 0x00
                                    571 	.area CODE
                                    572 	.area CONST
      008119                        573 ___str_7:
      008119 73 74 61 72 74         574 	.ascii "start"
      00811E 00                     575 	.db 0x00
                                    576 	.area CODE
                                    577 	.area CONST
      00811F                        578 __str_8:
      00811F 69 77 64 67 20 64 65   579 	.ascii "iwdg delay [%d] msec  100msec inc time watch dog generate.."
             6C 61 79 20 5B 25 64
             5D 20 6D 73 65 63 20
             20 31 30 30 6D 73 65
             63 20 69 6E 63 20 74
             69 6D 65 20 77 61 74
             63 68 20 64 6F 67 20
             67 65 6E 65 72 61 74
             65 2E 2E
      00815A 0D                     580 	.db 0x0d
      00815B 0A                     581 	.db 0x0a
      00815C 00                     582 	.db 0x00
                                    583 	.area CODE
                                    584 	.area CONST
      00815D                        585 __str_9:
      00815D 69 77 64 67 20 73 74   586 	.ascii "iwdg start....(%d)[%u:%u]"
             61 72 74 2E 2E 2E 2E
             28 25 64 29 5B 25 75
             3A 25 75 5D
      008176 0D                     587 	.db 0x0d
      008177 0A                     588 	.db 0x0a
      008178 00                     589 	.db 0x00
                                    590 	.area CODE
                                    591 	.area CONST
      008179                        592 ___str_10:
      008179 69 6E 69 74            593 	.ascii "init"
      00817D 00                     594 	.db 0x00
                                    595 	.area CODE
                                    596 	.area CONST
      00817E                        597 __str_11:
      00817E 69 77 64 67 20 69 6E   598 	.ascii "iwdg init....()"
             69 74 2E 2E 2E 2E 28
             29
      00818D 0D                     599 	.db 0x0d
      00818E 0A                     600 	.db 0x0a
      00818F 00                     601 	.db 0x00
                                    602 	.area CODE
                                    603 	.area CONST
      008190                        604 ___str_12:
      008190 68 65 6C 70            605 	.ascii "help"
      008194 00                     606 	.db 0x00
                                    607 	.area CODE
                                    608 	.area CONST
      008195                        609 ___str_13:
      008195 69 77 64 67 20 68 65   610 	.ascii "iwdg help...."
             6C 70 2E 2E 2E 2E
      0081A2 09                     611 	.db 0x09
      0081A3 0D                     612 	.db 0x0d
      0081A4 0A                     613 	.db 0x0a
      0081A5 69 77 64 67 20 69 6E   614 	.ascii "iwdg init // gpio init"
             69 74 20 2F 2F 20 67
             70 69 6F 20 69 6E 69
             74
      0081BB 0D                     615 	.db 0x0d
      0081BC 0A                     616 	.db 0x0a
      0081BD 69 77 64 67 20 73 74   617 	.ascii "iwdg start 1000 // 1000msec delay "
             61 72 74 20 31 30 30
             30 20 2F 2F 20 31 30
             30 30 6D 73 65 63 20
             64 65 6C 61 79 20
      0081DF 0D                     618 	.db 0x0d
      0081E0 0A                     619 	.db 0x0a
      0081E1 2F 2F 20 31 30 30 6D   620 	.ascii "// 100msec inc after n times watch dog generate.."
             73 65 63 20 69 6E 63
             20 61 66 74 65 72 20
             6E 20 74 69 6D 65 73
             20 77 61 74 63 68 20
             64 6F 67 20 67 65 6E
             65 72 61 74 65 2E 2E
      008212 0D                     621 	.db 0x0d
      008213 0A                     622 	.db 0x0a
      008214 00                     623 	.db 0x00
                                    624 	.area CODE
                                    625 	.area CONST
      008215                        626 ___str_14:
      008215 69 77 64 67            627 	.ascii "iwdg"
      008219 00                     628 	.db 0x00
                                    629 	.area CODE
                                    630 	.area CONST
      00821A                        631 ___str_15:
      00821A 20 20 69 77 64 67 20   632 	.ascii "  iwdg {write} [addr] [data]  "
             7B 77 72 69 74 65 7D
             20 5B 61 64 64 72 5D
             20 5B 64 61 74 61 5D
             20 20
      008238 0D                     633 	.db 0x0d
      008239 0A                     634 	.db 0x0a
      00823A 20 20 69 77 64 67 20   635 	.ascii "  iwdg {read} [addr] "
             7B 72 65 61 64 7D 20
             5B 61 64 64 72 5D 20
      00824F 0D                     636 	.db 0x0d
      008250 0A                     637 	.db 0x0a
      008251 20 20 69 77 64 67 20   638 	.ascii "  iwdg {init} "
             7B 69 6E 69 74 7D 20
      00825F 0D                     639 	.db 0x0d
      008260 0A                     640 	.db 0x0a
      008261 20 20 69 77 64 67 20   641 	.ascii "  iwdg {start} [delay:msec] halt.. 100msec inc check...max 1"
             7B 73 74 61 72 74 7D
             20 5B 64 65 6C 61 79
             3A 6D 73 65 63 5D 20
             68 61 6C 74 2E 2E 20
             31 30 30 6D 73 65 63
             20 69 6E 63 20 63 68
             65 63 6B 2E 2E 2E 6D
             61 78 20 31
      00829D 73 65 63               642 	.ascii "sec"
      0082A0 0D                     643 	.db 0x0d
      0082A1 0A                     644 	.db 0x0a
      0082A2 20 20 69 77 64 67 20   645 	.ascii "  iwdg {help}  iwdg help."
             7B 68 65 6C 70 7D 20
             20 69 77 64 67 20 68
             65 6C 70 2E
      0082BB 0D                     646 	.db 0x0d
      0082BC 0A                     647 	.db 0x0a
      0082BD 00                     648 	.db 0x00
                                    649 	.area CODE
                                    650 	.area INITIALIZER
      0088F8                        651 __xinit__cmdTbl_only:
      0088F8 82 15                  652 	.dw ___str_14
      0088FA 89 B0                  653 	.dw _DoIWDG
      0088FC 82 1A                  654 	.dw ___str_15
      0088FE 00 00                  655 	.dw #0x0000
      008900 00 00                  656 	.dw #0x0000
      008902 00 00                  657 	.dw #0x0000
                                    658 	.area CABS (ABS)
