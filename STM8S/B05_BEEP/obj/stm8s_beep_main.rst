                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_beep_main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _cmd_test_init_before_irq_enable
                                     12 	.globl _cmd_test
                                     13 	.globl _cmd_beep
                                     14 	.globl _fnBeepStart
                                     15 	.globl _DecToLong
                                     16 	.globl _HexToInt
                                     17 	.globl _mib_printf
                                     18 	.globl _MibWriteDebugString
                                     19 	.globl ___memcpy
                                     20 	.globl _strcmp
                                     21 	.globl _FLASH_ProgramOptionByte
                                     22 	.globl _FLASH_ReadOptionByte
                                     23 	.globl _FLASH_ReadByte
                                     24 	.globl _FLASH_Unlock
                                     25 	.globl _gbDelayData
                                     26 	.globl _GPIO_Configuration
                                     27 	.globl _calConfigBEEP_test
                                     28 	.globl _Delay
                                     29 ;--------------------------------------------------------
                                     30 ; ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DATA
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area INITIALIZED
      00014B                         37 _gbDelayData::
      00014B                         38 	.ds 1
      00014C                         39 _cmdTbl_only:
      00014C                         40 	.ds 12
                                     41 ;--------------------------------------------------------
                                     42 ; absolute external ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area DABS (ABS)
                                     45 
                                     46 ; default segment ordering for linker
                                     47 	.area HOME
                                     48 	.area GSINIT
                                     49 	.area GSFINAL
                                     50 	.area CONST
                                     51 	.area INITIALIZER
                                     52 	.area CODE
                                     53 
                                     54 ;--------------------------------------------------------
                                     55 ; global & static initialisations
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
                                     58 	.area GSINIT
                                     59 	.area GSFINAL
                                     60 	.area GSINIT
                                     61 ;--------------------------------------------------------
                                     62 ; Home
                                     63 ;--------------------------------------------------------
                                     64 	.area HOME
                                     65 	.area HOME
                                     66 ;--------------------------------------------------------
                                     67 ; code
                                     68 ;--------------------------------------------------------
                                     69 	.area CODE
                                     70 ;	stm8s_beep_main.c: 185: void cmd_beep(void)
                                     71 ;	-----------------------------------------
                                     72 ;	 function cmd_beep
                                     73 ;	-----------------------------------------
      008BDF                         74 _cmd_beep:
      008BDF 52 0A            [ 2]   75 	sub	sp, #10
                                     76 ;	stm8s_beep_main.c: 191: for (cptr = cmdTbl;; cptr++) 
      008BE1 AE 01 5E         [ 2]   77 	ldw	x, #(_cmdTbl+0)
      008BE4 1F 01            [ 2]   78 	ldw	(0x01, sp), x
      008BE6 5F               [ 1]   79 	clrw	x
      008BE7 1F 07            [ 2]   80 	ldw	(0x07, sp), x
      008BE9 1F 05            [ 2]   81 	ldw	(0x05, sp), x
      008BEB 16 01            [ 2]   82 	ldw	y, (0x01, sp)
      008BED 17 09            [ 2]   83 	ldw	(0x09, sp), y
      008BEF                         84 00106$:
                                     85 ;	stm8s_beep_main.c: 193: if(cptr->cmd==0)
      008BEF 1E 09            [ 2]   86 	ldw	x, (0x09, sp)
      008BF1 FE               [ 2]   87 	ldw	x, (x)
      008BF2 1F 03            [ 2]   88 	ldw	(0x03, sp), x
      008BF4 26 19            [ 1]   89 	jrne	00102$
                                     90 ;	stm8s_beep_main.c: 195: ccprintf(1,("INFO:+cmd_beep...\r\n"));
      008BF6 4B 8F            [ 1]   91 	push	#<(__str_0+0)
      008BF8 4B 80            [ 1]   92 	push	#((__str_0+0) >> 8)
      008BFA CD 9F BD         [ 4]   93 	call	_mib_printf
      008BFD 5B 02            [ 2]   94 	addw	sp, #2
                                     95 ;	stm8s_beep_main.c: 196: memcpy((void *)&(cptr->cmd),(void *)&(cmdTbl_only[0].cmd),sizeof(CMD_MY));
      008BFF AE 01 4C         [ 2]   96 	ldw	x, #_cmdTbl_only+0
      008C02 16 01            [ 2]   97 	ldw	y, (0x01, sp)
      008C04 4B 06            [ 1]   98 	push	#0x06
      008C06 4B 00            [ 1]   99 	push	#0x00
      008C08 89               [ 2]  100 	pushw	x
      008C09 93               [ 1]  101 	ldw	x, y
      008C0A CD B3 44         [ 4]  102 	call	___memcpy
                                    103 ;	stm8s_beep_main.c: 197: break;
      008C0D 20 2F            [ 2]  104 	jra	00105$
      008C0F                        105 00102$:
                                    106 ;	stm8s_beep_main.c: 199: index++;
      008C0F 1E 07            [ 2]  107 	ldw	x, (0x07, sp)
      008C11 5C               [ 1]  108 	incw	x
      008C12 1F 07            [ 2]  109 	ldw	(0x07, sp), x
      008C14 26 05            [ 1]  110 	jrne	00126$
      008C16 1E 05            [ 2]  111 	ldw	x, (0x05, sp)
      008C18 5C               [ 1]  112 	incw	x
      008C19 1F 05            [ 2]  113 	ldw	(0x05, sp), x
      008C1B                        114 00126$:
                                    115 ;	stm8s_beep_main.c: 200: if(index>MAX_COMMANDS)
      008C1B AE 00 06         [ 2]  116 	ldw	x, #0x0006
      008C1E 13 07            [ 2]  117 	cpw	x, (0x07, sp)
      008C20 4F               [ 1]  118 	clr	a
      008C21 12 06            [ 1]  119 	sbc	a, (0x06, sp)
      008C23 4F               [ 1]  120 	clr	a
      008C24 12 05            [ 1]  121 	sbc	a, (0x05, sp)
      008C26 24 0B            [ 1]  122 	jrnc	00107$
                                    123 ;	stm8s_beep_main.c: 202: ccprintf(1,("INFO:-cmd_beep...\r\n"));
      008C28 4B A3            [ 1]  124 	push	#<(__str_1+0)
      008C2A 4B 80            [ 1]  125 	push	#((__str_1+0) >> 8)
      008C2C CD 9F BD         [ 4]  126 	call	_mib_printf
      008C2F 5B 02            [ 2]  127 	addw	sp, #2
                                    128 ;	stm8s_beep_main.c: 203: return;
      008C31 20 0B            [ 2]  129 	jra	00108$
      008C33                        130 00107$:
                                    131 ;	stm8s_beep_main.c: 191: for (cptr = cmdTbl;; cptr++) 
      008C33 1E 09            [ 2]  132 	ldw	x, (0x09, sp)
      008C35 1C 00 06         [ 2]  133 	addw	x, #0x0006
      008C38 1F 09            [ 2]  134 	ldw	(0x09, sp), x
      008C3A 1F 01            [ 2]  135 	ldw	(0x01, sp), x
      008C3C 20 B1            [ 2]  136 	jra	00106$
      008C3E                        137 00105$:
                                    138 ;	stm8s_beep_main.c: 206: return;
      008C3E                        139 00108$:
                                    140 ;	stm8s_beep_main.c: 207: }
      008C3E 5B 0A            [ 2]  141 	addw	sp, #10
      008C40 81               [ 4]  142 	ret
                                    143 ;	stm8s_beep_main.c: 212: void cmd_test(void)
                                    144 ;	-----------------------------------------
                                    145 ;	 function cmd_test
                                    146 ;	-----------------------------------------
      008C41                        147 _cmd_test:
                                    148 ;	stm8s_beep_main.c: 214: cmd_beep();
                                    149 ;	stm8s_beep_main.c: 215: }
      008C41 CC 8B DF         [ 2]  150 	jp	_cmd_beep
                                    151 ;	stm8s_beep_main.c: 221: void cmd_test_init_before_irq_enable(void)
                                    152 ;	-----------------------------------------
                                    153 ;	 function cmd_test_init_before_irq_enable
                                    154 ;	-----------------------------------------
      008C44                        155 _cmd_test_init_before_irq_enable:
                                    156 ;	stm8s_beep_main.c: 224: }
      008C44 81               [ 4]  157 	ret
                                    158 ;	stm8s_beep_main.c: 237: static int DoBEEP(CMD_MY *cptr, int argc, char **argv)
                                    159 ;	-----------------------------------------
                                    160 ;	 function DoBEEP
                                    161 ;	-----------------------------------------
      008C45                        162 _DoBEEP:
      008C45 52 13            [ 2]  163 	sub	sp, #19
      008C47 51               [ 1]  164 	exgw	x, y
                                    165 ;	stm8s_beep_main.c: 239: uint32_t vdwAddr = 0;
      008C48 5F               [ 1]  166 	clrw	x
      008C49 1F 03            [ 2]  167 	ldw	(0x03, sp), x
      008C4B 1F 01            [ 2]  168 	ldw	(0x01, sp), x
                                    169 ;	stm8s_beep_main.c: 240: uint8_t vbData = 0;
      008C4D 0F 05            [ 1]  170 	clr	(0x05, sp)
                                    171 ;	stm8s_beep_main.c: 241: uint16_t vwData = 0;
      008C4F 5F               [ 1]  172 	clrw	x
      008C50 1F 06            [ 2]  173 	ldw	(0x06, sp), x
                                    174 ;	stm8s_beep_main.c: 242: uint16_t vwDataDelay = 0;
      008C52 5F               [ 1]  175 	clrw	x
      008C53 1F 08            [ 2]  176 	ldw	(0x08, sp), x
                                    177 ;	stm8s_beep_main.c: 246: MibWriteDebugString(cptr->usage);
      008C55 93               [ 1]  178 	ldw	x, y
      008C56 1C 00 04         [ 2]  179 	addw	x, #0x0004
      008C59 1F 0A            [ 2]  180 	ldw	(0x0a, sp), x
                                    181 ;	stm8s_beep_main.c: 244: if (argc < 2)
      008C5B 1E 16            [ 2]  182 	ldw	x, (0x16, sp)
      008C5D A3 00 02         [ 2]  183 	cpw	x, #0x0002
      008C60 2E 0A            [ 1]  184 	jrsge	00102$
                                    185 ;	stm8s_beep_main.c: 246: MibWriteDebugString(cptr->usage);
      008C62 1E 0A            [ 2]  186 	ldw	x, (0x0a, sp)
      008C64 FE               [ 2]  187 	ldw	x, (x)
      008C65 CD 95 AB         [ 4]  188 	call	_MibWriteDebugString
                                    189 ;	stm8s_beep_main.c: 247: return FALSE;
      008C68 5F               [ 1]  190 	clrw	x
      008C69 CC 90 56         [ 2]  191 	jp	00187$
      008C6C                        192 00102$:
                                    193 ;	stm8s_beep_main.c: 252: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      008C6C 1E 18            [ 2]  194 	ldw	x, (0x18, sp)
      008C6E 5C               [ 1]  195 	incw	x
      008C6F 5C               [ 1]  196 	incw	x
      008C70 1F 0C            [ 2]  197 	ldw	(0x0c, sp), x
      008C72 FE               [ 2]  198 	ldw	x, (x)
      008C73 4B B7            [ 1]  199 	push	#<(___str_2+0)
      008C75 4B 80            [ 1]  200 	push	#((___str_2+0) >> 8)
      008C77 CD B3 C8         [ 4]  201 	call	_strcmp
      008C7A 51               [ 1]  202 	exgw	x, y
                                    203 ;	stm8s_beep_main.c: 254: if (argc < 4)
      008C7B 1E 16            [ 2]  204 	ldw	x, (0x16, sp)
      008C7D A3 00 04         [ 2]  205 	cpw	x, #0x0004
      008C80 2F 04            [ 1]  206 	jrslt	00365$
      008C82 0F 0E            [ 1]  207 	clr	(0x0e, sp)
      008C84 20 04            [ 2]  208 	jra	00366$
      008C86                        209 00365$:
      008C86 A6 01            [ 1]  210 	ld	a, #0x01
      008C88 6B 0E            [ 1]  211 	ld	(0x0e, sp), a
      008C8A                        212 00366$:
                                    213 ;	stm8s_beep_main.c: 259: if (!HexToInt(argv[2], &vdwAddr, 32))
      008C8A 1E 18            [ 2]  214 	ldw	x, (0x18, sp)
      008C8C 1C 00 04         [ 2]  215 	addw	x, #0x0004
      008C8F 1F 0F            [ 2]  216 	ldw	(0x0f, sp), x
                                    217 ;	stm8s_beep_main.c: 264: if (!HexToInt(argv[3], &vbData, 8))
      008C91 1E 18            [ 2]  218 	ldw	x, (0x18, sp)
      008C93 1C 00 06         [ 2]  219 	addw	x, #0x0006
      008C96 1F 11            [ 2]  220 	ldw	(0x11, sp), x
                                    221 ;	stm8s_beep_main.c: 252: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      008C98 90 5D            [ 2]  222 	tnzw	y
      008C9A 26 6A            [ 1]  223 	jrne	00185$
                                    224 ;	stm8s_beep_main.c: 254: if (argc < 4)
      008C9C 0D 0E            [ 1]  225 	tnz	(0x0e, sp)
      008C9E 27 0A            [ 1]  226 	jreq	00104$
                                    227 ;	stm8s_beep_main.c: 256: MibWriteDebugString(cptr->usage);
      008CA0 1E 0A            [ 2]  228 	ldw	x, (0x0a, sp)
      008CA2 FE               [ 2]  229 	ldw	x, (x)
      008CA3 CD 95 AB         [ 4]  230 	call	_MibWriteDebugString
                                    231 ;	stm8s_beep_main.c: 257: return FALSE;
      008CA6 5F               [ 1]  232 	clrw	x
      008CA7 CC 90 56         [ 2]  233 	jp	00187$
      008CAA                        234 00104$:
                                    235 ;	stm8s_beep_main.c: 259: if (!HexToInt(argv[2], &vdwAddr, 32))
      008CAA 96               [ 1]  236 	ldw	x, sp
      008CAB 5C               [ 1]  237 	incw	x
      008CAC 51               [ 1]  238 	exgw	x, y
      008CAD 1E 0F            [ 2]  239 	ldw	x, (0x0f, sp)
      008CAF FE               [ 2]  240 	ldw	x, (x)
      008CB0 4B 20            [ 1]  241 	push	#0x20
      008CB2 4B 00            [ 1]  242 	push	#0x00
      008CB4 90 89            [ 2]  243 	pushw	y
      008CB6 CD A2 C3         [ 4]  244 	call	_HexToInt
      008CB9 5D               [ 2]  245 	tnzw	x
      008CBA 26 0D            [ 1]  246 	jrne	00106$
                                    247 ;	stm8s_beep_main.c: 261: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008CBC 4B BD            [ 1]  248 	push	#<(__str_3+0)
      008CBE 4B 80            [ 1]  249 	push	#((__str_3+0) >> 8)
      008CC0 CD 9F BD         [ 4]  250 	call	_mib_printf
      008CC3 5B 02            [ 2]  251 	addw	sp, #2
                                    252 ;	stm8s_beep_main.c: 262: return FALSE;
      008CC5 5F               [ 1]  253 	clrw	x
      008CC6 CC 90 56         [ 2]  254 	jp	00187$
      008CC9                        255 00106$:
                                    256 ;	stm8s_beep_main.c: 264: if (!HexToInt(argv[3], &vbData, 8))
      008CC9 96               [ 1]  257 	ldw	x, sp
      008CCA 1C 00 05         [ 2]  258 	addw	x, #5
      008CCD 51               [ 1]  259 	exgw	x, y
      008CCE 1E 11            [ 2]  260 	ldw	x, (0x11, sp)
      008CD0 FE               [ 2]  261 	ldw	x, (x)
      008CD1 4B 08            [ 1]  262 	push	#0x08
      008CD3 4B 00            [ 1]  263 	push	#0x00
      008CD5 90 89            [ 2]  264 	pushw	y
      008CD7 CD A2 C3         [ 4]  265 	call	_HexToInt
      008CDA 5D               [ 2]  266 	tnzw	x
      008CDB 26 0D            [ 1]  267 	jrne	00108$
                                    268 ;	stm8s_beep_main.c: 266: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008CDD 4B BD            [ 1]  269 	push	#<(__str_3+0)
      008CDF 4B 80            [ 1]  270 	push	#((__str_3+0) >> 8)
      008CE1 CD 9F BD         [ 4]  271 	call	_mib_printf
      008CE4 5B 02            [ 2]  272 	addw	sp, #2
                                    273 ;	stm8s_beep_main.c: 267: return FALSE;
      008CE6 5F               [ 1]  274 	clrw	x
      008CE7 CC 90 56         [ 2]  275 	jp	00187$
      008CEA                        276 00108$:
                                    277 ;	stm8s_beep_main.c: 269: wr_ADDR8(vdwAddr, vbData);
      008CEA 1E 03            [ 2]  278 	ldw	x, (0x03, sp)
      008CEC 7B 05            [ 1]  279 	ld	a, (0x05, sp)
      008CEE F7               [ 1]  280 	ld	(x), a
                                    281 ;	stm8s_beep_main.c: 270: ccprintf(_DEBUG_CMD_A_,("wr_ADDR8 : 0x%08lx[0x%02x]\r\n", vdwAddr,vbData));
      008CEF 5F               [ 1]  282 	clrw	x
      008CF0 7B 05            [ 1]  283 	ld	a, (0x05, sp)
      008CF2 97               [ 1]  284 	ld	xl, a
      008CF3 89               [ 2]  285 	pushw	x
      008CF4 1E 05            [ 2]  286 	ldw	x, (0x05, sp)
      008CF6 89               [ 2]  287 	pushw	x
      008CF7 1E 05            [ 2]  288 	ldw	x, (0x05, sp)
      008CF9 89               [ 2]  289 	pushw	x
      008CFA 4B DA            [ 1]  290 	push	#<(__str_4+0)
      008CFC 4B 80            [ 1]  291 	push	#((__str_4+0) >> 8)
      008CFE CD 9F BD         [ 4]  292 	call	_mib_printf
      008D01 5B 08            [ 2]  293 	addw	sp, #8
      008D03 CC 90 54         [ 2]  294 	jp	00186$
      008D06                        295 00185$:
                                    296 ;	stm8s_beep_main.c: 275: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      008D06 1E 0C            [ 2]  297 	ldw	x, (0x0c, sp)
      008D08 FE               [ 2]  298 	ldw	x, (x)
      008D09 4B F7            [ 1]  299 	push	#<(___str_5+0)
      008D0B 4B 80            [ 1]  300 	push	#((___str_5+0) >> 8)
      008D0D CD B3 C8         [ 4]  301 	call	_strcmp
      008D10 51               [ 1]  302 	exgw	x, y
                                    303 ;	stm8s_beep_main.c: 277: if (argc < 3)
      008D11 1E 16            [ 2]  304 	ldw	x, (0x16, sp)
      008D13 A3 00 03         [ 2]  305 	cpw	x, #0x0003
      008D16 2F 04            [ 1]  306 	jrslt	00371$
      008D18 0F 13            [ 1]  307 	clr	(0x13, sp)
      008D1A 20 04            [ 2]  308 	jra	00372$
      008D1C                        309 00371$:
      008D1C A6 01            [ 1]  310 	ld	a, #0x01
      008D1E 6B 13            [ 1]  311 	ld	(0x13, sp), a
      008D20                        312 00372$:
                                    313 ;	stm8s_beep_main.c: 275: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      008D20 90 5D            [ 2]  314 	tnzw	y
      008D22 26 47            [ 1]  315 	jrne	00182$
                                    316 ;	stm8s_beep_main.c: 277: if (argc < 3)
      008D24 0D 13            [ 1]  317 	tnz	(0x13, sp)
      008D26 27 0A            [ 1]  318 	jreq	00110$
                                    319 ;	stm8s_beep_main.c: 279: MibWriteDebugString(cptr->usage);
      008D28 1E 0A            [ 2]  320 	ldw	x, (0x0a, sp)
      008D2A FE               [ 2]  321 	ldw	x, (x)
      008D2B CD 95 AB         [ 4]  322 	call	_MibWriteDebugString
                                    323 ;	stm8s_beep_main.c: 280: return FALSE;
      008D2E 5F               [ 1]  324 	clrw	x
      008D2F CC 90 56         [ 2]  325 	jp	00187$
      008D32                        326 00110$:
                                    327 ;	stm8s_beep_main.c: 282: if (!HexToInt(argv[2], &vdwAddr, 32))
      008D32 96               [ 1]  328 	ldw	x, sp
      008D33 5C               [ 1]  329 	incw	x
      008D34 16 0F            [ 2]  330 	ldw	y, (0x0f, sp)
      008D36 90 FE            [ 2]  331 	ldw	y, (y)
      008D38 4B 20            [ 1]  332 	push	#0x20
      008D3A 4B 00            [ 1]  333 	push	#0x00
      008D3C 89               [ 2]  334 	pushw	x
      008D3D 93               [ 1]  335 	ldw	x, y
      008D3E CD A2 C3         [ 4]  336 	call	_HexToInt
      008D41 5D               [ 2]  337 	tnzw	x
      008D42 26 0D            [ 1]  338 	jrne	00112$
                                    339 ;	stm8s_beep_main.c: 284: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008D44 4B BD            [ 1]  340 	push	#<(__str_3+0)
      008D46 4B 80            [ 1]  341 	push	#((__str_3+0) >> 8)
      008D48 CD 9F BD         [ 4]  342 	call	_mib_printf
      008D4B 5B 02            [ 2]  343 	addw	sp, #2
                                    344 ;	stm8s_beep_main.c: 285: return FALSE;
      008D4D 5F               [ 1]  345 	clrw	x
      008D4E CC 90 56         [ 2]  346 	jp	00187$
      008D51                        347 00112$:
                                    348 ;	stm8s_beep_main.c: 288: vbData = rd_ADDR8(vdwAddr);
      008D51 1E 03            [ 2]  349 	ldw	x, (0x03, sp)
      008D53 F6               [ 1]  350 	ld	a, (x)
      008D54 6B 05            [ 1]  351 	ld	(0x05, sp), a
                                    352 ;	stm8s_beep_main.c: 290: ccprintf(_DEBUG_CMD_A_,("rd_ADDR8 : 0x%08lx[0x%02x]\r\n", vdwAddr,vbData));
      008D56 5F               [ 1]  353 	clrw	x
      008D57 97               [ 1]  354 	ld	xl, a
      008D58 89               [ 2]  355 	pushw	x
      008D59 1E 05            [ 2]  356 	ldw	x, (0x05, sp)
      008D5B 89               [ 2]  357 	pushw	x
      008D5C 1E 05            [ 2]  358 	ldw	x, (0x05, sp)
      008D5E 89               [ 2]  359 	pushw	x
      008D5F 4B FC            [ 1]  360 	push	#<(__str_6+0)
      008D61 4B 80            [ 1]  361 	push	#((__str_6+0) >> 8)
      008D63 CD 9F BD         [ 4]  362 	call	_mib_printf
      008D66 5B 08            [ 2]  363 	addw	sp, #8
      008D68 CC 90 54         [ 2]  364 	jp	00186$
      008D6B                        365 00182$:
                                    366 ;	stm8s_beep_main.c: 295: else if (!strcmp(argv[1], "freq")) // _CMD_MY_READ_
      008D6B 1E 0C            [ 2]  367 	ldw	x, (0x0c, sp)
      008D6D FE               [ 2]  368 	ldw	x, (x)
      008D6E 4B 19            [ 1]  369 	push	#<(___str_7+0)
      008D70 4B 81            [ 1]  370 	push	#((___str_7+0) >> 8)
      008D72 CD B3 C8         [ 4]  371 	call	_strcmp
      008D75 5D               [ 2]  372 	tnzw	x
      008D76 26 43            [ 1]  373 	jrne	00179$
                                    374 ;	stm8s_beep_main.c: 297: if (argc < 3)
      008D78 0D 13            [ 1]  375 	tnz	(0x13, sp)
      008D7A 27 0A            [ 1]  376 	jreq	00114$
                                    377 ;	stm8s_beep_main.c: 299: MibWriteDebugString(cptr->usage);
      008D7C 1E 0A            [ 2]  378 	ldw	x, (0x0a, sp)
      008D7E FE               [ 2]  379 	ldw	x, (x)
      008D7F CD 95 AB         [ 4]  380 	call	_MibWriteDebugString
                                    381 ;	stm8s_beep_main.c: 300: return FALSE;
      008D82 5F               [ 1]  382 	clrw	x
      008D83 CC 90 56         [ 2]  383 	jp	00187$
      008D86                        384 00114$:
                                    385 ;	stm8s_beep_main.c: 303: if (!DecToLong(argv[2], &vwData, 16))
      008D86 96               [ 1]  386 	ldw	x, sp
      008D87 1C 00 06         [ 2]  387 	addw	x, #6
      008D8A 51               [ 1]  388 	exgw	x, y
      008D8B 1E 0F            [ 2]  389 	ldw	x, (0x0f, sp)
      008D8D FE               [ 2]  390 	ldw	x, (x)
      008D8E 4B 10            [ 1]  391 	push	#0x10
      008D90 4B 00            [ 1]  392 	push	#0x00
      008D92 90 89            [ 2]  393 	pushw	y
      008D94 CD A3 AF         [ 4]  394 	call	_DecToLong
      008D97 5D               [ 2]  395 	tnzw	x
      008D98 26 0D            [ 1]  396 	jrne	00116$
                                    397 ;	stm8s_beep_main.c: 305: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008D9A 4B BD            [ 1]  398 	push	#<(__str_3+0)
      008D9C 4B 80            [ 1]  399 	push	#((__str_3+0) >> 8)
      008D9E CD 9F BD         [ 4]  400 	call	_mib_printf
      008DA1 5B 02            [ 2]  401 	addw	sp, #2
                                    402 ;	stm8s_beep_main.c: 306: return FALSE;
      008DA3 5F               [ 1]  403 	clrw	x
      008DA4 CC 90 56         [ 2]  404 	jp	00187$
      008DA7                        405 00116$:
                                    406 ;	stm8s_beep_main.c: 308: ccprintf(_DEBUG_CMD_A_, ("beep freq : [%d] Hz\r\n",(vwData)));		
      008DA7 1E 06            [ 2]  407 	ldw	x, (0x06, sp)
      008DA9 89               [ 2]  408 	pushw	x
      008DAA 4B 1E            [ 1]  409 	push	#<(__str_8+0)
      008DAC 4B 81            [ 1]  410 	push	#((__str_8+0) >> 8)
      008DAE CD 9F BD         [ 4]  411 	call	_mib_printf
      008DB1 5B 04            [ 2]  412 	addw	sp, #4
                                    413 ;	stm8s_beep_main.c: 309: calConfigBEEP_test(vwData);
      008DB3 1E 06            [ 2]  414 	ldw	x, (0x06, sp)
      008DB5 CD 90 89         [ 4]  415 	call	_calConfigBEEP_test
      008DB8 CC 90 54         [ 2]  416 	jp	00186$
      008DBB                        417 00179$:
                                    418 ;	stm8s_beep_main.c: 314: else if (!strcmp(argv[1], "enable")) // _CMD_MY_READ_
      008DBB 1E 0C            [ 2]  419 	ldw	x, (0x0c, sp)
      008DBD FE               [ 2]  420 	ldw	x, (x)
      008DBE 4B 34            [ 1]  421 	push	#<(___str_9+0)
      008DC0 4B 81            [ 1]  422 	push	#((___str_9+0) >> 8)
      008DC2 CD B3 C8         [ 4]  423 	call	_strcmp
      008DC5 5D               [ 2]  424 	tnzw	x
      008DC6 26 16            [ 1]  425 	jrne	00176$
                                    426 ;	stm8s_beep_main.c: 317: BEEP->CSR |= BEEP_CSR_BEEPEN;
      008DC8 72 1A 50 F3      [ 1]  427 	bset	0x50f3, #5
                                    428 ;	stm8s_beep_main.c: 318: ccprintf(_DEBUG_CMD_A_, ("beep enable....(0x%x)\r\n",BEEP->CSR));
      008DCC C6 50 F3         [ 1]  429 	ld	a, 0x50f3
      008DCF 5F               [ 1]  430 	clrw	x
      008DD0 97               [ 1]  431 	ld	xl, a
      008DD1 89               [ 2]  432 	pushw	x
      008DD2 4B 3B            [ 1]  433 	push	#<(__str_10+0)
      008DD4 4B 81            [ 1]  434 	push	#((__str_10+0) >> 8)
      008DD6 CD 9F BD         [ 4]  435 	call	_mib_printf
      008DD9 5B 04            [ 2]  436 	addw	sp, #4
      008DDB CC 90 54         [ 2]  437 	jp	00186$
      008DDE                        438 00176$:
                                    439 ;	stm8s_beep_main.c: 323: else if (!strcmp(argv[1], "disable")) // _CMD_MY_READ_
      008DDE 1E 0C            [ 2]  440 	ldw	x, (0x0c, sp)
      008DE0 FE               [ 2]  441 	ldw	x, (x)
      008DE1 4B 53            [ 1]  442 	push	#<(___str_11+0)
      008DE3 4B 81            [ 1]  443 	push	#((___str_11+0) >> 8)
      008DE5 CD B3 C8         [ 4]  444 	call	_strcmp
      008DE8 5D               [ 2]  445 	tnzw	x
      008DE9 26 16            [ 1]  446 	jrne	00173$
                                    447 ;	stm8s_beep_main.c: 326: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
      008DEB 72 1B 50 F3      [ 1]  448 	bres	0x50f3, #5
                                    449 ;	stm8s_beep_main.c: 327: ccprintf(_DEBUG_CMD_A_, ("beep disable....(0x%x)\r\n",BEEP->CSR));
      008DEF C6 50 F3         [ 1]  450 	ld	a, 0x50f3
      008DF2 5F               [ 1]  451 	clrw	x
      008DF3 97               [ 1]  452 	ld	xl, a
      008DF4 89               [ 2]  453 	pushw	x
      008DF5 4B 5B            [ 1]  454 	push	#<(__str_12+0)
      008DF7 4B 81            [ 1]  455 	push	#((__str_12+0) >> 8)
      008DF9 CD 9F BD         [ 4]  456 	call	_mib_printf
      008DFC 5B 04            [ 2]  457 	addw	sp, #4
      008DFE CC 90 54         [ 2]  458 	jp	00186$
      008E01                        459 00173$:
                                    460 ;	stm8s_beep_main.c: 332: else if (!strcmp(argv[1], "start")) // _CMD_MY_READ_
      008E01 1E 0C            [ 2]  461 	ldw	x, (0x0c, sp)
      008E03 FE               [ 2]  462 	ldw	x, (x)
      008E04 4B 74            [ 1]  463 	push	#<(___str_13+0)
      008E06 4B 81            [ 1]  464 	push	#((___str_13+0) >> 8)
      008E08 CD B3 C8         [ 4]  465 	call	_strcmp
                                    466 ;	stm8s_beep_main.c: 334: vwDataDelay = 0;
      008E0B 5D               [ 2]  467 	tnzw	x
      008E0C 26 79            [ 1]  468 	jrne	00170$
      008E0E 1F 08            [ 2]  469 	ldw	(0x08, sp), x
                                    470 ;	stm8s_beep_main.c: 335: if (argc < 3)
      008E10 0D 13            [ 1]  471 	tnz	(0x13, sp)
      008E12 27 0A            [ 1]  472 	jreq	00118$
                                    473 ;	stm8s_beep_main.c: 337: MibWriteDebugString(cptr->usage);
      008E14 1E 0A            [ 2]  474 	ldw	x, (0x0a, sp)
      008E16 FE               [ 2]  475 	ldw	x, (x)
      008E17 CD 95 AB         [ 4]  476 	call	_MibWriteDebugString
                                    477 ;	stm8s_beep_main.c: 338: return FALSE;
      008E1A 5F               [ 1]  478 	clrw	x
      008E1B CC 90 56         [ 2]  479 	jp	00187$
      008E1E                        480 00118$:
                                    481 ;	stm8s_beep_main.c: 341: if (!DecToLong(argv[2], &vwData, 16))
      008E1E 96               [ 1]  482 	ldw	x, sp
      008E1F 1C 00 06         [ 2]  483 	addw	x, #6
      008E22 51               [ 1]  484 	exgw	x, y
      008E23 1E 0F            [ 2]  485 	ldw	x, (0x0f, sp)
      008E25 FE               [ 2]  486 	ldw	x, (x)
      008E26 4B 10            [ 1]  487 	push	#0x10
      008E28 4B 00            [ 1]  488 	push	#0x00
      008E2A 90 89            [ 2]  489 	pushw	y
      008E2C CD A3 AF         [ 4]  490 	call	_DecToLong
      008E2F 5D               [ 2]  491 	tnzw	x
      008E30 26 0D            [ 1]  492 	jrne	00120$
                                    493 ;	stm8s_beep_main.c: 343: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008E32 4B BD            [ 1]  494 	push	#<(__str_3+0)
      008E34 4B 80            [ 1]  495 	push	#((__str_3+0) >> 8)
      008E36 CD 9F BD         [ 4]  496 	call	_mib_printf
      008E39 5B 02            [ 2]  497 	addw	sp, #2
                                    498 ;	stm8s_beep_main.c: 344: return FALSE;
      008E3B 5F               [ 1]  499 	clrw	x
      008E3C CC 90 56         [ 2]  500 	jp	00187$
      008E3F                        501 00120$:
                                    502 ;	stm8s_beep_main.c: 346: if (argc >= 4)
      008E3F 7B 0E            [ 1]  503 	ld	a, (0x0e, sp)
      008E41 26 21            [ 1]  504 	jrne	00124$
                                    505 ;	stm8s_beep_main.c: 348: if (!DecToLong(argv[3], &vwDataDelay, 16))
      008E43 96               [ 1]  506 	ldw	x, sp
      008E44 1C 00 08         [ 2]  507 	addw	x, #8
      008E47 51               [ 1]  508 	exgw	x, y
      008E48 1E 11            [ 2]  509 	ldw	x, (0x11, sp)
      008E4A FE               [ 2]  510 	ldw	x, (x)
      008E4B 4B 10            [ 1]  511 	push	#0x10
      008E4D 4B 00            [ 1]  512 	push	#0x00
      008E4F 90 89            [ 2]  513 	pushw	y
      008E51 CD A3 AF         [ 4]  514 	call	_DecToLong
      008E54 5D               [ 2]  515 	tnzw	x
      008E55 26 0D            [ 1]  516 	jrne	00124$
                                    517 ;	stm8s_beep_main.c: 350: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008E57 4B BD            [ 1]  518 	push	#<(__str_3+0)
      008E59 4B 80            [ 1]  519 	push	#((__str_3+0) >> 8)
      008E5B CD 9F BD         [ 4]  520 	call	_mib_printf
      008E5E 5B 02            [ 2]  521 	addw	sp, #2
                                    522 ;	stm8s_beep_main.c: 351: return FALSE;
      008E60 5F               [ 1]  523 	clrw	x
      008E61 CC 90 56         [ 2]  524 	jp	00187$
      008E64                        525 00124$:
                                    526 ;	stm8s_beep_main.c: 354: ccprintf(_DEBUG_CMD_A_, ("beep freq : [%d]Hz\r\n",(vwData)));		
      008E64 1E 06            [ 2]  527 	ldw	x, (0x06, sp)
      008E66 89               [ 2]  528 	pushw	x
      008E67 4B 7A            [ 1]  529 	push	#<(__str_14+0)
      008E69 4B 81            [ 1]  530 	push	#((__str_14+0) >> 8)
      008E6B CD 9F BD         [ 4]  531 	call	_mib_printf
      008E6E 5B 04            [ 2]  532 	addw	sp, #4
                                    533 ;	stm8s_beep_main.c: 355: ccprintf(_DEBUG_CMD_A_, ("beep delay : [%d]msec\r\n",(vwDataDelay)));		
      008E70 1E 08            [ 2]  534 	ldw	x, (0x08, sp)
      008E72 89               [ 2]  535 	pushw	x
      008E73 4B 8F            [ 1]  536 	push	#<(__str_15+0)
      008E75 4B 81            [ 1]  537 	push	#((__str_15+0) >> 8)
      008E77 CD 9F BD         [ 4]  538 	call	_mib_printf
      008E7A 5B 04            [ 2]  539 	addw	sp, #4
                                    540 ;	stm8s_beep_main.c: 356: fnBeepStart(vwData,vwDataDelay);
      008E7C 1E 08            [ 2]  541 	ldw	x, (0x08, sp)
      008E7E 89               [ 2]  542 	pushw	x
      008E7F 1E 08            [ 2]  543 	ldw	x, (0x08, sp)
      008E81 CD B0 80         [ 4]  544 	call	_fnBeepStart
      008E84 CC 90 54         [ 2]  545 	jp	00186$
      008E87                        546 00170$:
                                    547 ;	stm8s_beep_main.c: 380: else if (!strcmp(argv[1], "toggle")) // _CMD_MY_READ_
      008E87 1E 0C            [ 2]  548 	ldw	x, (0x0c, sp)
      008E89 FE               [ 2]  549 	ldw	x, (x)
      008E8A 4B A7            [ 1]  550 	push	#<(___str_16+0)
      008E8C 4B 81            [ 1]  551 	push	#((___str_16+0) >> 8)
      008E8E CD B3 C8         [ 4]  552 	call	_strcmp
      008E91 5D               [ 2]  553 	tnzw	x
      008E92 27 03            [ 1]  554 	jreq	00386$
      008E94 CC 8F 8A         [ 2]  555 	jp	00167$
      008E97                        556 00386$:
                                    557 ;	stm8s_beep_main.c: 382: if (argc < 3)
      008E97 0D 13            [ 1]  558 	tnz	(0x13, sp)
      008E99 27 0A            [ 1]  559 	jreq	00126$
                                    560 ;	stm8s_beep_main.c: 384: MibWriteDebugString(cptr->usage);
      008E9B 1E 0A            [ 2]  561 	ldw	x, (0x0a, sp)
      008E9D FE               [ 2]  562 	ldw	x, (x)
      008E9E CD 95 AB         [ 4]  563 	call	_MibWriteDebugString
                                    564 ;	stm8s_beep_main.c: 385: return FALSE;
      008EA1 5F               [ 1]  565 	clrw	x
      008EA2 CC 90 56         [ 2]  566 	jp	00187$
      008EA5                        567 00126$:
                                    568 ;	stm8s_beep_main.c: 388: if (!DecToLong(argv[2], &vwData, 16))
      008EA5 96               [ 1]  569 	ldw	x, sp
      008EA6 1C 00 06         [ 2]  570 	addw	x, #6
      008EA9 51               [ 1]  571 	exgw	x, y
      008EAA 1E 0F            [ 2]  572 	ldw	x, (0x0f, sp)
      008EAC FE               [ 2]  573 	ldw	x, (x)
      008EAD 4B 10            [ 1]  574 	push	#0x10
      008EAF 4B 00            [ 1]  575 	push	#0x00
      008EB1 90 89            [ 2]  576 	pushw	y
      008EB3 CD A3 AF         [ 4]  577 	call	_DecToLong
      008EB6 5D               [ 2]  578 	tnzw	x
      008EB7 26 0D            [ 1]  579 	jrne	00128$
                                    580 ;	stm8s_beep_main.c: 390: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008EB9 4B BD            [ 1]  581 	push	#<(__str_3+0)
      008EBB 4B 80            [ 1]  582 	push	#((__str_3+0) >> 8)
      008EBD CD 9F BD         [ 4]  583 	call	_mib_printf
      008EC0 5B 02            [ 2]  584 	addw	sp, #2
                                    585 ;	stm8s_beep_main.c: 391: return FALSE;
      008EC2 5F               [ 1]  586 	clrw	x
      008EC3 CC 90 56         [ 2]  587 	jp	00187$
      008EC6                        588 00128$:
                                    589 ;	stm8s_beep_main.c: 393: ccprintf(_DEBUG_CMD_A_, ("beep toggle : [%d] msec\r\n",(vwData)));		
      008EC6 1E 06            [ 2]  590 	ldw	x, (0x06, sp)
      008EC8 89               [ 2]  591 	pushw	x
      008EC9 4B AE            [ 1]  592 	push	#<(__str_17+0)
      008ECB 4B 81            [ 1]  593 	push	#((__str_17+0) >> 8)
      008ECD CD 9F BD         [ 4]  594 	call	_mib_printf
      008ED0 5B 04            [ 2]  595 	addw	sp, #4
                                    596 ;	stm8s_beep_main.c: 394: gbDelayData = vwData;
      008ED2 7B 07            [ 1]  597 	ld	a, (0x07, sp)
      008ED4 C7 01 4B         [ 1]  598 	ld	_gbDelayData+0, a
                                    599 ;	stm8s_beep_main.c: 396: GPIO_Configuration();		
      008ED7 CD 90 5C         [ 4]  600 	call	_GPIO_Configuration
                                    601 ;	stm8s_beep_main.c: 397: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
      008EDA 72 1B 50 F3      [ 1]  602 	bres	0x50f3, #5
                                    603 ;	stm8s_beep_main.c: 398: ccprintf(_DEBUG_CMD_A_, ("beep toggle....(0x%x)\r\n",BEEP->CSR));		
      008EDE C6 50 F3         [ 1]  604 	ld	a, 0x50f3
      008EE1 5F               [ 1]  605 	clrw	x
      008EE2 97               [ 1]  606 	ld	xl, a
      008EE3 89               [ 2]  607 	pushw	x
      008EE4 4B C8            [ 1]  608 	push	#<(__str_18+0)
      008EE6 4B 81            [ 1]  609 	push	#((__str_18+0) >> 8)
      008EE8 CD 9F BD         [ 4]  610 	call	_mib_printf
      008EEB 5B 04            [ 2]  611 	addw	sp, #4
                                    612 ;	stm8s_beep_main.c: 400: if(UCOM_LED1_GPIO->IDR & UCOM_LED1_PIN)
      008EED C6 50 10         [ 1]  613 	ld	a, 0x5010
      008EF0 97               [ 1]  614 	ld	xl, a
                                    615 ;	stm8s_beep_main.c: 402: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
      008EF1 C6 50 0F         [ 1]  616 	ld	a, 0x500f
                                    617 ;	stm8s_beep_main.c: 400: if(UCOM_LED1_GPIO->IDR & UCOM_LED1_PIN)
      008EF4 54               [ 2]  618 	srlw	x
      008EF5 24 07            [ 1]  619 	jrnc	00130$
                                    620 ;	stm8s_beep_main.c: 402: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
      008EF7 A4 FE            [ 1]  621 	and	a, #0xfe
      008EF9 C7 50 0F         [ 1]  622 	ld	0x500f, a
      008EFC 20 05            [ 2]  623 	jra	00131$
      008EFE                        624 00130$:
                                    625 ;	stm8s_beep_main.c: 406: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR | UCOM_LED1_PIN;
      008EFE AA 01            [ 1]  626 	or	a, #0x01
      008F00 C7 50 0F         [ 1]  627 	ld	0x500f, a
      008F03                        628 00131$:
                                    629 ;	stm8s_beep_main.c: 409: if(gbDelayData==0) gbDelayData = 10;
      008F03 C6 01 4B         [ 1]  630 	ld	a, _gbDelayData+0
      008F06 26 04            [ 1]  631 	jrne	00133$
      008F08 35 0A 01 4B      [ 1]  632 	mov	_gbDelayData+0, #0x0a
      008F0C                        633 00133$:
                                    634 ;	stm8s_beep_main.c: 410: gwMibMiliSec = gbDelayData;
      008F0C 5F               [ 1]  635 	clrw	x
      008F0D C6 01 4B         [ 1]  636 	ld	a, _gbDelayData+0
      008F10 97               [ 1]  637 	ld	xl, a
      008F11 CF 00 47         [ 2]  638 	ldw	_gwMibMiliSec+0, x
                                    639 ;	stm8s_beep_main.c: 411: ccprintf(_DEBUG_CMD_A_, ("beep delay [%d]msec\r\n",gbDelayData));		
      008F14 5F               [ 1]  640 	clrw	x
      008F15 C6 01 4B         [ 1]  641 	ld	a, _gbDelayData+0
      008F18 97               [ 1]  642 	ld	xl, a
      008F19 89               [ 2]  643 	pushw	x
      008F1A 4B E0            [ 1]  644 	push	#<(__str_19+0)
      008F1C 4B 81            [ 1]  645 	push	#((__str_19+0) >> 8)
      008F1E CD 9F BD         [ 4]  646 	call	_mib_printf
      008F21 5B 04            [ 2]  647 	addw	sp, #4
                                    648 ;	stm8s_beep_main.c: 412: ccprintf(_DEBUG_CMD_A_, ("stop gpio key push : [%d]\r\n",(UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)));		
      008F23 C6 50 06         [ 1]  649 	ld	a, 0x5006
      008F26 A4 20            [ 1]  650 	and	a, #0x20
      008F28 5F               [ 1]  651 	clrw	x
      008F29 97               [ 1]  652 	ld	xl, a
      008F2A 89               [ 2]  653 	pushw	x
      008F2B 4B F6            [ 1]  654 	push	#<(__str_20+0)
      008F2D 4B 81            [ 1]  655 	push	#((__str_20+0) >> 8)
      008F2F CD 9F BD         [ 4]  656 	call	_mib_printf
      008F32 5B 04            [ 2]  657 	addw	sp, #4
                                    658 ;	stm8s_beep_main.c: 413: do {
      008F34                        659 00144$:
                                    660 ;	stm8s_beep_main.c: 414: if(gwMibMiliSec==0)
      008F34 CE 00 47         [ 2]  661 	ldw	x, _gwMibMiliSec+0
      008F37 26 22            [ 1]  662 	jrne	00138$
                                    663 ;	stm8s_beep_main.c: 416: gwMibMiliSec = gbDelayData;
      008F39 5F               [ 1]  664 	clrw	x
      008F3A C6 01 4B         [ 1]  665 	ld	a, _gbDelayData+0
      008F3D 97               [ 1]  666 	ld	xl, a
      008F3E CF 00 47         [ 2]  667 	ldw	_gwMibMiliSec+0, x
                                    668 ;	stm8s_beep_main.c: 417: if(UCOM_BEEP_GPIO->IDR & UCOM_BEEP_PIN)
      008F41 C6 50 10         [ 1]  669 	ld	a, 0x5010
      008F44 97               [ 1]  670 	ld	xl, a
                                    671 ;	stm8s_beep_main.c: 402: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
      008F45 C6 50 0F         [ 1]  672 	ld	a, 0x500f
                                    673 ;	stm8s_beep_main.c: 417: if(UCOM_BEEP_GPIO->IDR & UCOM_BEEP_PIN)
      008F48 88               [ 1]  674 	push	a
      008F49 9F               [ 1]  675 	ld	a, xl
      008F4A A5 10            [ 1]  676 	bcp	a, #0x10
      008F4C 84               [ 1]  677 	pop	a
      008F4D 27 07            [ 1]  678 	jreq	00135$
                                    679 ;	stm8s_beep_main.c: 419: UCOM_BEEP_GPIO->ODR = UCOM_BEEP_GPIO->ODR & ~UCOM_BEEP_PIN;
      008F4F A4 EF            [ 1]  680 	and	a, #0xef
      008F51 C7 50 0F         [ 1]  681 	ld	0x500f, a
      008F54 20 05            [ 2]  682 	jra	00138$
      008F56                        683 00135$:
                                    684 ;	stm8s_beep_main.c: 423: UCOM_BEEP_GPIO->ODR = UCOM_BEEP_GPIO->ODR | UCOM_BEEP_PIN;
      008F56 AA 10            [ 1]  685 	or	a, #0x10
      008F58 C7 50 0F         [ 1]  686 	ld	0x500f, a
      008F5B                        687 00138$:
                                    688 ;	stm8s_beep_main.c: 426: if(UCOM_LED1_GPIO->IDR & UCOM_LED1_PIN)
      008F5B C6 50 10         [ 1]  689 	ld	a, 0x5010
      008F5E 97               [ 1]  690 	ld	xl, a
                                    691 ;	stm8s_beep_main.c: 402: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
      008F5F C6 50 0F         [ 1]  692 	ld	a, 0x500f
                                    693 ;	stm8s_beep_main.c: 426: if(UCOM_LED1_GPIO->IDR & UCOM_LED1_PIN)
      008F62 54               [ 2]  694 	srlw	x
      008F63 24 07            [ 1]  695 	jrnc	00140$
                                    696 ;	stm8s_beep_main.c: 428: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
      008F65 A4 FE            [ 1]  697 	and	a, #0xfe
      008F67 C7 50 0F         [ 1]  698 	ld	0x500f, a
      008F6A 20 05            [ 2]  699 	jra	00141$
      008F6C                        700 00140$:
                                    701 ;	stm8s_beep_main.c: 432: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR | UCOM_LED1_PIN;
      008F6C AA 01            [ 1]  702 	or	a, #0x01
      008F6E C7 50 0F         [ 1]  703 	ld	0x500f, a
      008F71                        704 00141$:
                                    705 ;	stm8s_beep_main.c: 434: if((UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)==0)
      008F71 72 0A 50 06 BE   [ 2]  706 	btjt	0x5006, #5, 00144$
                                    707 ;	stm8s_beep_main.c: 436: ccprintf(_DEBUG_CMD_A_, ("gpio key on [%d]\r\n",(UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)));		
      008F76 C6 50 06         [ 1]  708 	ld	a, 0x5006
      008F79 A4 20            [ 1]  709 	and	a, #0x20
      008F7B 5F               [ 1]  710 	clrw	x
      008F7C 97               [ 1]  711 	ld	xl, a
      008F7D 89               [ 2]  712 	pushw	x
      008F7E 4B 12            [ 1]  713 	push	#<(__str_21+0)
      008F80 4B 82            [ 1]  714 	push	#((__str_21+0) >> 8)
      008F82 CD 9F BD         [ 4]  715 	call	_mib_printf
      008F85 5B 04            [ 2]  716 	addw	sp, #4
                                    717 ;	stm8s_beep_main.c: 437: break;
      008F87 CC 90 54         [ 2]  718 	jp	00186$
                                    719 ;	stm8s_beep_main.c: 443: } while(1);
      008F8A                        720 00167$:
                                    721 ;	stm8s_beep_main.c: 448: else if (!strcmp(argv[1], "remap")) // _CMD_MY_READ_
      008F8A 1E 0C            [ 2]  722 	ldw	x, (0x0c, sp)
      008F8C FE               [ 2]  723 	ldw	x, (x)
      008F8D 4B 25            [ 1]  724 	push	#<(___str_22+0)
      008F8F 4B 82            [ 1]  725 	push	#((___str_22+0) >> 8)
      008F91 CD B3 C8         [ 4]  726 	call	_strcmp
      008F94 5D               [ 2]  727 	tnzw	x
      008F95 27 03            [ 1]  728 	jreq	00395$
      008F97 CC 90 25         [ 2]  729 	jp	00164$
      008F9A                        730 00395$:
                                    731 ;	stm8s_beep_main.c: 450: if (!strcmp(argv[2], "set"))
      008F9A 1E 0F            [ 2]  732 	ldw	x, (0x0f, sp)
      008F9C FE               [ 2]  733 	ldw	x, (x)
      008F9D 4B 2B            [ 1]  734 	push	#<(___str_23+0)
      008F9F 4B 82            [ 1]  735 	push	#((___str_23+0) >> 8)
      008FA1 CD B3 C8         [ 4]  736 	call	_strcmp
      008FA4 1F 12            [ 2]  737 	ldw	(0x12, sp), x
      008FA6 26 25            [ 1]  738 	jrne	00155$
                                    739 ;	stm8s_beep_main.c: 453: if(FLASH_ReadByte(OPT2_REG)!=AFR7_BIT) 
      008FA8 4B 03            [ 1]  740 	push	#0x03
      008FAA 4B 48            [ 1]  741 	push	#0x48
      008FAC 5F               [ 1]  742 	clrw	x
      008FAD 89               [ 2]  743 	pushw	x
      008FAE CD 93 6F         [ 4]  744 	call	_FLASH_ReadByte
      008FB1 A1 80            [ 1]  745 	cp	a, #0x80
      008FB3 27 0D            [ 1]  746 	jreq	00148$
                                    747 ;	stm8s_beep_main.c: 455: FLASH_Unlock(FLASH_MEMTYPE_DATA); 
      008FB5 A6 F7            [ 1]  748 	ld	a, #0xf7
      008FB7 CD 93 0A         [ 4]  749 	call	_FLASH_Unlock
                                    750 ;	stm8s_beep_main.c: 457: FLASH_ProgramOptionByte(OPT2_REG,AFR7_BIT); 
      008FBA A6 80            [ 1]  751 	ld	a, #0x80
      008FBC AE 48 03         [ 2]  752 	ldw	x, #0x4803
      008FBF CD 93 B3         [ 4]  753 	call	_FLASH_ProgramOptionByte
      008FC2                        754 00148$:
                                    755 ;	stm8s_beep_main.c: 459: vbData=FLASH_ReadOptionByte(OPT2_REG); 
      008FC2 AE 48 03         [ 2]  756 	ldw	x, #0x4803
      008FC5 CD 94 1D         [ 4]  757 	call	_FLASH_ReadOptionByte
      008FC8 9F               [ 1]  758 	ld	a, xl
      008FC9 6B 05            [ 1]  759 	ld	(0x05, sp), a
      008FCB 20 39            [ 2]  760 	jra	00156$
      008FCD                        761 00155$:
                                    762 ;	stm8s_beep_main.c: 461: else if (!strcmp(argv[2], "reset"))
      008FCD 1E 0F            [ 2]  763 	ldw	x, (0x0f, sp)
      008FCF FE               [ 2]  764 	ldw	x, (x)
      008FD0 4B 2F            [ 1]  765 	push	#<(___str_24+0)
      008FD2 4B 82            [ 1]  766 	push	#((___str_24+0) >> 8)
      008FD4 CD B3 C8         [ 4]  767 	call	_strcmp
      008FD7 5D               [ 2]  768 	tnzw	x
      008FD8 26 23            [ 1]  769 	jrne	00152$
                                    770 ;	stm8s_beep_main.c: 464: if(FLASH_ReadByte(OPT2_REG)!=0x00) 
      008FDA 4B 03            [ 1]  771 	push	#0x03
      008FDC 4B 48            [ 1]  772 	push	#0x48
      008FDE 5F               [ 1]  773 	clrw	x
      008FDF 89               [ 2]  774 	pushw	x
      008FE0 CD 93 6F         [ 4]  775 	call	_FLASH_ReadByte
      008FE3 4D               [ 1]  776 	tnz	a
      008FE4 27 0C            [ 1]  777 	jreq	00150$
                                    778 ;	stm8s_beep_main.c: 466: FLASH_Unlock(FLASH_MEMTYPE_DATA); 
      008FE6 A6 F7            [ 1]  779 	ld	a, #0xf7
      008FE8 CD 93 0A         [ 4]  780 	call	_FLASH_Unlock
                                    781 ;	stm8s_beep_main.c: 468: FLASH_ProgramOptionByte(OPT2_REG,0x00); 
      008FEB 4F               [ 1]  782 	clr	a
      008FEC AE 48 03         [ 2]  783 	ldw	x, #0x4803
      008FEF CD 93 B3         [ 4]  784 	call	_FLASH_ProgramOptionByte
      008FF2                        785 00150$:
                                    786 ;	stm8s_beep_main.c: 470: vbData=FLASH_ReadOptionByte(OPT2_REG); 
      008FF2 AE 48 03         [ 2]  787 	ldw	x, #0x4803
      008FF5 CD 94 1D         [ 4]  788 	call	_FLASH_ReadOptionByte
      008FF8 9F               [ 1]  789 	ld	a, xl
      008FF9 6B 05            [ 1]  790 	ld	(0x05, sp), a
      008FFB 20 09            [ 2]  791 	jra	00156$
      008FFD                        792 00152$:
                                    793 ;	stm8s_beep_main.c: 474: ccprintf(_DEBUG_CMD_A_, ("beep init....error !!!\r\n"));		
      008FFD 4B 35            [ 1]  794 	push	#<(__str_25+0)
      008FFF 4B 82            [ 1]  795 	push	#((__str_25+0) >> 8)
      009001 CD 9F BD         [ 4]  796 	call	_mib_printf
      009004 5B 02            [ 2]  797 	addw	sp, #2
      009006                        798 00156$:
                                    799 ;	stm8s_beep_main.c: 477: ccprintf(_DEBUG_CMD_A_, ("beep init....(0x%02X)\r\n",vbData));		
      009006 5F               [ 1]  800 	clrw	x
      009007 7B 05            [ 1]  801 	ld	a, (0x05, sp)
      009009 97               [ 1]  802 	ld	xl, a
      00900A 89               [ 2]  803 	pushw	x
      00900B 4B 4E            [ 1]  804 	push	#<(__str_26+0)
      00900D 4B 82            [ 1]  805 	push	#((__str_26+0) >> 8)
      00900F CD 9F BD         [ 4]  806 	call	_mib_printf
      009012 5B 04            [ 2]  807 	addw	sp, #4
                                    808 ;	stm8s_beep_main.c: 478: ccprintf(_DEBUG_CMD_A_, ("beep AFR7....(0x%x)\r\n",rd_ADDR8(OPT2_REG)));		
      009014 C6 48 03         [ 1]  809 	ld	a, 0x4803
      009017 5F               [ 1]  810 	clrw	x
      009018 97               [ 1]  811 	ld	xl, a
      009019 89               [ 2]  812 	pushw	x
      00901A 4B 66            [ 1]  813 	push	#<(__str_27+0)
      00901C 4B 82            [ 1]  814 	push	#((__str_27+0) >> 8)
      00901E CD 9F BD         [ 4]  815 	call	_mib_printf
      009021 5B 04            [ 2]  816 	addw	sp, #4
      009023 20 2F            [ 2]  817 	jra	00186$
      009025                        818 00164$:
                                    819 ;	stm8s_beep_main.c: 483: else if (!strcmp(argv[1], "init")) // _CMD_MY_READ_
      009025 1E 0C            [ 2]  820 	ldw	x, (0x0c, sp)
      009027 FE               [ 2]  821 	ldw	x, (x)
      009028 4B 7C            [ 1]  822 	push	#<(___str_28+0)
      00902A 4B 82            [ 1]  823 	push	#((___str_28+0) >> 8)
      00902C CD B3 C8         [ 4]  824 	call	_strcmp
      00902F 5D               [ 2]  825 	tnzw	x
      009030 26 05            [ 1]  826 	jrne	00161$
                                    827 ;	stm8s_beep_main.c: 485: GPIO_Configuration();		
      009032 CD 90 5C         [ 4]  828 	call	_GPIO_Configuration
      009035 20 1D            [ 2]  829 	jra	00186$
      009037                        830 00161$:
                                    831 ;	stm8s_beep_main.c: 490: else if (!strcmp(argv[1], "help")) // _CMD_MY_READ_
      009037 1E 0C            [ 2]  832 	ldw	x, (0x0c, sp)
      009039 FE               [ 2]  833 	ldw	x, (x)
      00903A 4B 81            [ 1]  834 	push	#<(___str_29+0)
      00903C 4B 82            [ 1]  835 	push	#((___str_29+0) >> 8)
      00903E CD B3 C8         [ 4]  836 	call	_strcmp
      009041 5D               [ 2]  837 	tnzw	x
      009042 26 08            [ 1]  838 	jrne	00158$
                                    839 ;	stm8s_beep_main.c: 493: "beep init // gpio init\r\n"\
      009044 AE 82 86         [ 2]  840 	ldw	x, #(___str_30+0)
      009047 CD 95 AB         [ 4]  841 	call	_MibWriteDebugString
      00904A 20 08            [ 2]  842 	jra	00186$
      00904C                        843 00158$:
                                    844 ;	stm8s_beep_main.c: 506: MibWriteDebugString(cptr->usage);
      00904C 1E 0A            [ 2]  845 	ldw	x, (0x0a, sp)
      00904E FE               [ 2]  846 	ldw	x, (x)
      00904F CD 95 AB         [ 4]  847 	call	_MibWriteDebugString
                                    848 ;	stm8s_beep_main.c: 507: return FALSE;
      009052 5F               [ 1]  849 	clrw	x
                                    850 ;	stm8s_beep_main.c: 509: return TRUE;
      009053 C5                     851 	.byte 0xc5
      009054                        852 00186$:
      009054 5F               [ 1]  853 	clrw	x
      009055 5C               [ 1]  854 	incw	x
      009056                        855 00187$:
                                    856 ;	stm8s_beep_main.c: 510: }
      009056 16 14            [ 2]  857 	ldw	y, (20, sp)
      009058 5B 19            [ 2]  858 	addw	sp, #25
      00905A 90 FC            [ 2]  859 	jp	(y)
                                    860 ;	stm8s_beep_main.c: 534: void GPIO_Configuration(void)
                                    861 ;	-----------------------------------------
                                    862 ;	 function GPIO_Configuration
                                    863 ;	-----------------------------------------
      00905C                        864 _GPIO_Configuration:
                                    865 ;	stm8s_beep_main.c: 549: UCOM_LED1_GPIO->DDR |= (UCOM_LED1_PIN); /* Set Output mode */
      00905C 72 10 50 11      [ 1]  866 	bset	0x5011, #0
                                    867 ;	stm8s_beep_main.c: 550: UCOM_LED1_GPIO->CR1 |= (UCOM_LED1_PIN);	/* Pull-Up or Push-Pull */
      009060 72 10 50 12      [ 1]  868 	bset	0x5012, #0
                                    869 ;	stm8s_beep_main.c: 551: UCOM_LED1_GPIO->CR2 |= (UCOM_LED1_PIN);	/* Output speed up to 10 MHz */
      009064 72 10 50 13      [ 1]  870 	bset	0x5013, #0
                                    871 ;	stm8s_beep_main.c: 552: UCOM_LED1_GPIO->ODR &= ~(UCOM_LED1_PIN); // low... 
      009068 72 11 50 0F      [ 1]  872 	bres	0x500f, #0
                                    873 ;	stm8s_beep_main.c: 557: UCOM_KEY1_GPIO->DDR &= ~(UCOM_KEY1_PIN);  /* Set input mode */
      00906C 72 1B 50 07      [ 1]  874 	bres	0x5007, #5
                                    875 ;	stm8s_beep_main.c: 558: UCOM_KEY1_GPIO->CR1 |= (UCOM_KEY1_PIN);	 /* Pull-Up or Push-Pull */
      009070 72 1A 50 08      [ 1]  876 	bset	0x5008, #5
                                    877 ;	stm8s_beep_main.c: 559: UCOM_KEY1_GPIO->CR2 &= ~(UCOM_KEY1_PIN); /*  External interrupt disabled */
      009074 72 1B 50 09      [ 1]  878 	bres	0x5009, #5
                                    879 ;	stm8s_beep_main.c: 567: UCOM_BEEP_GPIO->DDR |= (UCOM_BEEP_PIN); /* Set Output mode */
      009078 72 18 50 11      [ 1]  880 	bset	0x5011, #4
                                    881 ;	stm8s_beep_main.c: 568: UCOM_BEEP_GPIO->CR1 |= (UCOM_BEEP_PIN);	/* Pull-Up or Push-Pull */
      00907C 72 18 50 12      [ 1]  882 	bset	0x5012, #4
                                    883 ;	stm8s_beep_main.c: 569: UCOM_BEEP_GPIO->CR2 |= (UCOM_BEEP_PIN);	/* Output speed up to 10 MHz */
      009080 72 18 50 13      [ 1]  884 	bset	0x5013, #4
                                    885 ;	stm8s_beep_main.c: 570: UCOM_BEEP_GPIO->ODR &= ~(UCOM_BEEP_PIN); // low... 
      009084 72 19 50 0F      [ 1]  886 	bres	0x500f, #4
                                    887 ;	stm8s_beep_main.c: 572: }
      009088 81               [ 4]  888 	ret
                                    889 ;	stm8s_beep_main.c: 576: void calConfigBEEP_test(uint16_t vwFreq) // msec... 
                                    890 ;	-----------------------------------------
                                    891 ;	 function calConfigBEEP_test
                                    892 ;	-----------------------------------------
      009089                        893 _calConfigBEEP_test:
      009089 52 07            [ 2]  894 	sub	sp, #7
      00908B 51               [ 1]  895 	exgw	x, y
                                    896 ;	stm8s_beep_main.c: 579: uint8_t vbBEEPDIV = 0;
      00908C 0F 05            [ 1]  897 	clr	(0x05, sp)
                                    898 ;	stm8s_beep_main.c: 580: uint32_t vdwData = vwFreq;
      00908E 17 03            [ 2]  899 	ldw	(0x03, sp), y
      009090 5F               [ 1]  900 	clrw	x
      009091 1F 01            [ 2]  901 	ldw	(0x01, sp), x
                                    902 ;	stm8s_beep_main.c: 583: if(vwFreq<500)
      009093 17 06            [ 2]  903 	ldw	(0x06, sp), y
      009095 93               [ 1]  904 	ldw	x, y
      009096 A3 01 F4         [ 2]  905 	cpw	x, #0x01f4
      009099 24 07            [ 1]  906 	jrnc	00111$
                                    907 ;	stm8s_beep_main.c: 586: vbBEEPSEL = 0xFF;
      00909B A6 FF            [ 1]  908 	ld	a, #0xff
      00909D 6B 06            [ 1]  909 	ld	(0x06, sp), a
      00909F CC 91 23         [ 2]  910 	jp	00112$
      0090A2                        911 00111$:
                                    912 ;	stm8s_beep_main.c: 588: else if(vwFreq<1000)
      0090A2 1E 06            [ 2]  913 	ldw	x, (0x06, sp)
      0090A4 A3 03 E8         [ 2]  914 	cpw	x, #0x03e8
      0090A7 24 20            [ 1]  915 	jrnc	00108$
                                    916 ;	stm8s_beep_main.c: 590: vbBEEPSEL = 0x00; // f / (8 * div) khz
      0090A9 0F 06            [ 1]  917 	clr	(0x06, sp)
                                    918 ;	stm8s_beep_main.c: 591: vdwDiv = (128000 / 8) / vdwData;
      0090AB 90 89            [ 2]  919 	pushw	y
      0090AD 1E 05            [ 2]  920 	ldw	x, (0x05, sp)
      0090AF 89               [ 2]  921 	pushw	x
      0090B0 1E 05            [ 2]  922 	ldw	x, (0x05, sp)
      0090B2 89               [ 2]  923 	pushw	x
      0090B3 4B 80            [ 1]  924 	push	#0x80
      0090B5 4B 3E            [ 1]  925 	push	#0x3e
      0090B7 5F               [ 1]  926 	clrw	x
      0090B8 89               [ 2]  927 	pushw	x
      0090B9 CD B2 EB         [ 4]  928 	call	__divulong
      0090BC 5B 08            [ 2]  929 	addw	sp, #8
      0090BE 17 04            [ 2]  930 	ldw	(0x04, sp), y
      0090C0 9F               [ 1]  931 	ld	a, xl
      0090C1 90 85            [ 2]  932 	popw	y
                                    933 ;	stm8s_beep_main.c: 592: vbBEEPDIV =  vdwDiv - 2;
      0090C3 A0 02            [ 1]  934 	sub	a, #0x02
      0090C5 6B 05            [ 1]  935 	ld	(0x05, sp), a
                                    936 ;	stm8s_beep_main.c: 593: vdwDataLast = (128000 / 8) / vdwDiv;
      0090C7 20 5A            [ 2]  937 	jra	00112$
      0090C9                        938 00108$:
                                    939 ;	stm8s_beep_main.c: 595: else if(vwFreq<2000)
      0090C9 1E 06            [ 2]  940 	ldw	x, (0x06, sp)
      0090CB A3 07 D0         [ 2]  941 	cpw	x, #0x07d0
      0090CE 24 22            [ 1]  942 	jrnc	00105$
                                    943 ;	stm8s_beep_main.c: 597: vbBEEPSEL = 0x01; // f / (4 * div) khz
      0090D0 A6 01            [ 1]  944 	ld	a, #0x01
      0090D2 6B 06            [ 1]  945 	ld	(0x06, sp), a
                                    946 ;	stm8s_beep_main.c: 598: vdwDiv = (128000 / 4) / vdwData;
      0090D4 90 89            [ 2]  947 	pushw	y
      0090D6 1E 05            [ 2]  948 	ldw	x, (0x05, sp)
      0090D8 89               [ 2]  949 	pushw	x
      0090D9 1E 05            [ 2]  950 	ldw	x, (0x05, sp)
      0090DB 89               [ 2]  951 	pushw	x
      0090DC 4B 00            [ 1]  952 	push	#0x00
      0090DE 4B 7D            [ 1]  953 	push	#0x7d
      0090E0 5F               [ 1]  954 	clrw	x
      0090E1 89               [ 2]  955 	pushw	x
      0090E2 CD B2 EB         [ 4]  956 	call	__divulong
      0090E5 5B 08            [ 2]  957 	addw	sp, #8
      0090E7 17 04            [ 2]  958 	ldw	(0x04, sp), y
      0090E9 9F               [ 1]  959 	ld	a, xl
      0090EA 90 85            [ 2]  960 	popw	y
                                    961 ;	stm8s_beep_main.c: 599: vbBEEPDIV =  vdwDiv - 2;
      0090EC A0 02            [ 1]  962 	sub	a, #0x02
      0090EE 6B 05            [ 1]  963 	ld	(0x05, sp), a
                                    964 ;	stm8s_beep_main.c: 600: vdwDataLast = (128000 / 8) / vdwDiv;
      0090F0 20 31            [ 2]  965 	jra	00112$
      0090F2                        966 00105$:
                                    967 ;	stm8s_beep_main.c: 602: else if(vwFreq<32000)
      0090F2 1E 06            [ 2]  968 	ldw	x, (0x06, sp)
      0090F4 A3 7D 00         [ 2]  969 	cpw	x, #0x7d00
      0090F7 24 26            [ 1]  970 	jrnc	00102$
                                    971 ;	stm8s_beep_main.c: 604: vbBEEPSEL = 0x02; // f / (2 * div) khz
      0090F9 A6 02            [ 1]  972 	ld	a, #0x02
      0090FB 6B 06            [ 1]  973 	ld	(0x06, sp), a
                                    974 ;	stm8s_beep_main.c: 605: vdwDiv = (128000 / 2) / vdwData;
      0090FD 90 89            [ 2]  975 	pushw	y
      0090FF 1E 05            [ 2]  976 	ldw	x, (0x05, sp)
      009101 89               [ 2]  977 	pushw	x
      009102 1E 05            [ 2]  978 	ldw	x, (0x05, sp)
      009104 89               [ 2]  979 	pushw	x
      009105 4B 00            [ 1]  980 	push	#0x00
      009107 4B FA            [ 1]  981 	push	#0xfa
      009109 5F               [ 1]  982 	clrw	x
      00910A 89               [ 2]  983 	pushw	x
      00910B CD B2 EB         [ 4]  984 	call	__divulong
      00910E 5B 08            [ 2]  985 	addw	sp, #8
      009110 02               [ 1]  986 	rlwa	x
      009111 6B 06            [ 1]  987 	ld	(0x06, sp), a
      009113 01               [ 1]  988 	rrwa	x
      009114 17 04            [ 2]  989 	ldw	(0x04, sp), y
      009116 9F               [ 1]  990 	ld	a, xl
      009117 90 85            [ 2]  991 	popw	y
                                    992 ;	stm8s_beep_main.c: 606: vbBEEPDIV =  vdwDiv - 2;
      009119 A0 02            [ 1]  993 	sub	a, #0x02
      00911B 6B 05            [ 1]  994 	ld	(0x05, sp), a
                                    995 ;	stm8s_beep_main.c: 607: vdwDataLast = (128000 / 8) / vdwDiv;
      00911D 20 04            [ 2]  996 	jra	00112$
      00911F                        997 00102$:
                                    998 ;	stm8s_beep_main.c: 612: vbBEEPSEL = 0xFF;
      00911F A6 FF            [ 1]  999 	ld	a, #0xff
      009121 6B 06            [ 1] 1000 	ld	(0x06, sp), a
      009123                       1001 00112$:
                                   1002 ;	stm8s_beep_main.c: 614: if(vbBEEPSEL!=0xFF)
      009123 7B 06            [ 1] 1003 	ld	a, (0x06, sp)
      009125 4C               [ 1] 1004 	inc	a
      009126 27 50            [ 1] 1005 	jreq	00114$
                                   1006 ;	stm8s_beep_main.c: 616: ccprintf(_DEBUG_CMD_A_, ("beep init [%d : SEL(%d) : DIV(%d)] Hz\r\n",vwFreq,vbBEEPSEL,vbBEEPDIV));		
      009128 5F               [ 1] 1007 	clrw	x
      009129 7B 05            [ 1] 1008 	ld	a, (0x05, sp)
      00912B 97               [ 1] 1009 	ld	xl, a
      00912C 7B 06            [ 1] 1010 	ld	a, (0x06, sp)
      00912E 6B 04            [ 1] 1011 	ld	(0x04, sp), a
      009130 0F 03            [ 1] 1012 	clr	(0x03, sp)
      009132 89               [ 2] 1013 	pushw	x
      009133 1E 05            [ 2] 1014 	ldw	x, (0x05, sp)
      009135 89               [ 2] 1015 	pushw	x
      009136 90 89            [ 2] 1016 	pushw	y
      009138 4B D8            [ 1] 1017 	push	#<(__str_31+0)
      00913A 4B 83            [ 1] 1018 	push	#((__str_31+0) >> 8)
      00913C CD 9F BD         [ 4] 1019 	call	_mib_printf
      00913F 5B 08            [ 2] 1020 	addw	sp, #8
                                   1021 ;	stm8s_beep_main.c: 619: BEEP->CSR  = BEEP_CSR_BEEPDIV;
      009141 35 1F 50 F3      [ 1] 1022 	mov	0x50f3+0, #0x1f
                                   1023 ;	stm8s_beep_main.c: 621: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
      009145 C6 50 F3         [ 1] 1024 	ld	a, 0x50f3
      009148 A4 E0            [ 1] 1025 	and	a, #0xe0
      00914A C7 50 F3         [ 1] 1026 	ld	0x50f3, a
                                   1027 ;	stm8s_beep_main.c: 622: BEEP->CSR |= (vbBEEPDIV & BEEP_CSR_BEEPDIV);
      00914D C6 50 F3         [ 1] 1028 	ld	a, 0x50f3
      009150 6B 07            [ 1] 1029 	ld	(0x07, sp), a
      009152 7B 05            [ 1] 1030 	ld	a, (0x05, sp)
      009154 A4 1F            [ 1] 1031 	and	a, #0x1f
      009156 1A 07            [ 1] 1032 	or	a, (0x07, sp)
      009158 C7 50 F3         [ 1] 1033 	ld	0x50f3, a
                                   1034 ;	stm8s_beep_main.c: 626: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
      00915B C6 50 F3         [ 1] 1035 	ld	a, 0x50f3
      00915E A4 3F            [ 1] 1036 	and	a, #0x3f
      009160 C7 50 F3         [ 1] 1037 	ld	0x50f3, a
                                   1038 ;	stm8s_beep_main.c: 627: BEEP->CSR |= (uint8_t)((vbBEEPSEL&0x03)<<6);
      009163 C6 50 F3         [ 1] 1039 	ld	a, 0x50f3
      009166 6B 07            [ 1] 1040 	ld	(0x07, sp), a
      009168 7B 06            [ 1] 1041 	ld	a, (0x06, sp)
      00916A A4 03            [ 1] 1042 	and	a, #0x03
      00916C 4E               [ 1] 1043 	swap	a
      00916D A4 F0            [ 1] 1044 	and	a, #0xf0
      00916F 48               [ 1] 1045 	sll	a
      009170 48               [ 1] 1046 	sll	a
      009171 1A 07            [ 1] 1047 	or	a, (0x07, sp)
      009173 C7 50 F3         [ 1] 1048 	ld	0x50f3, a
      009176 20 0F            [ 2] 1049 	jra	00116$
      009178                       1050 00114$:
                                   1051 ;	stm8s_beep_main.c: 632: BEEP->CSR  = BEEP_CSR_BEEPDIV;
      009178 35 1F 50 F3      [ 1] 1052 	mov	0x50f3+0, #0x1f
                                   1053 ;	stm8s_beep_main.c: 633: ccprintf(_DEBUG_CMD_A_, ("beep init error... [%d] Hz\r\n",vwFreq));		
      00917C 90 89            [ 2] 1054 	pushw	y
      00917E 4B 00            [ 1] 1055 	push	#<(__str_32+0)
      009180 4B 84            [ 1] 1056 	push	#((__str_32+0) >> 8)
      009182 CD 9F BD         [ 4] 1057 	call	_mib_printf
      009185 5B 04            [ 2] 1058 	addw	sp, #4
      009187                       1059 00116$:
                                   1060 ;	stm8s_beep_main.c: 635: }
      009187 5B 07            [ 2] 1061 	addw	sp, #7
      009189 81               [ 4] 1062 	ret
                                   1063 ;	stm8s_beep_main.c: 645: void Delay(u16 nCount)
                                   1064 ;	-----------------------------------------
                                   1065 ;	 function Delay
                                   1066 ;	-----------------------------------------
      00918A                       1067 _Delay:
                                   1068 ;	stm8s_beep_main.c: 648: while (nCount != 0)
      00918A                       1069 00101$:
      00918A 5D               [ 2] 1070 	tnzw	x
      00918B 26 01            [ 1] 1071 	jrne	00117$
      00918D 81               [ 4] 1072 	ret
      00918E                       1073 00117$:
                                   1074 ;	stm8s_beep_main.c: 650: nCount--;
      00918E 5A               [ 2] 1075 	decw	x
      00918F 20 F9            [ 2] 1076 	jra	00101$
                                   1077 ;	stm8s_beep_main.c: 652: }
      009191 81               [ 4] 1078 	ret
                                   1079 	.area CODE
                                   1080 	.area CONST
                                   1081 	.area CONST
      00808F                       1082 __str_0:
      00808F 49 4E 46 4F 3A 2B 63  1083 	.ascii "INFO:+cmd_beep..."
             6D 64 5F 62 65 65 70
             2E 2E 2E
      0080A0 0D                    1084 	.db 0x0d
      0080A1 0A                    1085 	.db 0x0a
      0080A2 00                    1086 	.db 0x00
                                   1087 	.area CODE
                                   1088 	.area CONST
      0080A3                       1089 __str_1:
      0080A3 49 4E 46 4F 3A 2D 63  1090 	.ascii "INFO:-cmd_beep..."
             6D 64 5F 62 65 65 70
             2E 2E 2E
      0080B4 0D                    1091 	.db 0x0d
      0080B5 0A                    1092 	.db 0x0a
      0080B6 00                    1093 	.db 0x00
                                   1094 	.area CODE
                                   1095 	.area CONST
      0080B7                       1096 ___str_2:
      0080B7 77 72 69 74 65        1097 	.ascii "write"
      0080BC 00                    1098 	.db 0x00
                                   1099 	.area CODE
                                   1100 	.area CONST
      0080BD                       1101 __str_3:
      0080BD 49 6C 6C 75 67 61 6C  1102 	.ascii "Illugal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      0080D7 0D                    1103 	.db 0x0d
      0080D8 0A                    1104 	.db 0x0a
      0080D9 00                    1105 	.db 0x00
                                   1106 	.area CODE
                                   1107 	.area CONST
      0080DA                       1108 __str_4:
      0080DA 77 72 5F 41 44 44 52  1109 	.ascii "wr_ADDR8 : 0x%08lx[0x%02x]"
             38 20 3A 20 30 78 25
             30 38 6C 78 5B 30 78
             25 30 32 78 5D
      0080F4 0D                    1110 	.db 0x0d
      0080F5 0A                    1111 	.db 0x0a
      0080F6 00                    1112 	.db 0x00
                                   1113 	.area CODE
                                   1114 	.area CONST
      0080F7                       1115 ___str_5:
      0080F7 72 65 61 64           1116 	.ascii "read"
      0080FB 00                    1117 	.db 0x00
                                   1118 	.area CODE
                                   1119 	.area CONST
      0080FC                       1120 __str_6:
      0080FC 72 64 5F 41 44 44 52  1121 	.ascii "rd_ADDR8 : 0x%08lx[0x%02x]"
             38 20 3A 20 30 78 25
             30 38 6C 78 5B 30 78
             25 30 32 78 5D
      008116 0D                    1122 	.db 0x0d
      008117 0A                    1123 	.db 0x0a
      008118 00                    1124 	.db 0x00
                                   1125 	.area CODE
                                   1126 	.area CONST
      008119                       1127 ___str_7:
      008119 66 72 65 71           1128 	.ascii "freq"
      00811D 00                    1129 	.db 0x00
                                   1130 	.area CODE
                                   1131 	.area CONST
      00811E                       1132 __str_8:
      00811E 62 65 65 70 20 66 72  1133 	.ascii "beep freq : [%d] Hz"
             65 71 20 3A 20 5B 25
             64 5D 20 48 7A
      008131 0D                    1134 	.db 0x0d
      008132 0A                    1135 	.db 0x0a
      008133 00                    1136 	.db 0x00
                                   1137 	.area CODE
                                   1138 	.area CONST
      008134                       1139 ___str_9:
      008134 65 6E 61 62 6C 65     1140 	.ascii "enable"
      00813A 00                    1141 	.db 0x00
                                   1142 	.area CODE
                                   1143 	.area CONST
      00813B                       1144 __str_10:
      00813B 62 65 65 70 20 65 6E  1145 	.ascii "beep enable....(0x%x)"
             61 62 6C 65 2E 2E 2E
             2E 28 30 78 25 78 29
      008150 0D                    1146 	.db 0x0d
      008151 0A                    1147 	.db 0x0a
      008152 00                    1148 	.db 0x00
                                   1149 	.area CODE
                                   1150 	.area CONST
      008153                       1151 ___str_11:
      008153 64 69 73 61 62 6C 65  1152 	.ascii "disable"
      00815A 00                    1153 	.db 0x00
                                   1154 	.area CODE
                                   1155 	.area CONST
      00815B                       1156 __str_12:
      00815B 62 65 65 70 20 64 69  1157 	.ascii "beep disable....(0x%x)"
             73 61 62 6C 65 2E 2E
             2E 2E 28 30 78 25 78
             29
      008171 0D                    1158 	.db 0x0d
      008172 0A                    1159 	.db 0x0a
      008173 00                    1160 	.db 0x00
                                   1161 	.area CODE
                                   1162 	.area CONST
      008174                       1163 ___str_13:
      008174 73 74 61 72 74        1164 	.ascii "start"
      008179 00                    1165 	.db 0x00
                                   1166 	.area CODE
                                   1167 	.area CONST
      00817A                       1168 __str_14:
      00817A 62 65 65 70 20 66 72  1169 	.ascii "beep freq : [%d]Hz"
             65 71 20 3A 20 5B 25
             64 5D 48 7A
      00818C 0D                    1170 	.db 0x0d
      00818D 0A                    1171 	.db 0x0a
      00818E 00                    1172 	.db 0x00
                                   1173 	.area CODE
                                   1174 	.area CONST
      00818F                       1175 __str_15:
      00818F 62 65 65 70 20 64 65  1176 	.ascii "beep delay : [%d]msec"
             6C 61 79 20 3A 20 5B
             25 64 5D 6D 73 65 63
      0081A4 0D                    1177 	.db 0x0d
      0081A5 0A                    1178 	.db 0x0a
      0081A6 00                    1179 	.db 0x00
                                   1180 	.area CODE
                                   1181 	.area CONST
      0081A7                       1182 ___str_16:
      0081A7 74 6F 67 67 6C 65     1183 	.ascii "toggle"
      0081AD 00                    1184 	.db 0x00
                                   1185 	.area CODE
                                   1186 	.area CONST
      0081AE                       1187 __str_17:
      0081AE 62 65 65 70 20 74 6F  1188 	.ascii "beep toggle : [%d] msec"
             67 67 6C 65 20 3A 20
             5B 25 64 5D 20 6D 73
             65 63
      0081C5 0D                    1189 	.db 0x0d
      0081C6 0A                    1190 	.db 0x0a
      0081C7 00                    1191 	.db 0x00
                                   1192 	.area CODE
                                   1193 	.area CONST
      0081C8                       1194 __str_18:
      0081C8 62 65 65 70 20 74 6F  1195 	.ascii "beep toggle....(0x%x)"
             67 67 6C 65 2E 2E 2E
             2E 28 30 78 25 78 29
      0081DD 0D                    1196 	.db 0x0d
      0081DE 0A                    1197 	.db 0x0a
      0081DF 00                    1198 	.db 0x00
                                   1199 	.area CODE
                                   1200 	.area CONST
      0081E0                       1201 __str_19:
      0081E0 62 65 65 70 20 64 65  1202 	.ascii "beep delay [%d]msec"
             6C 61 79 20 5B 25 64
             5D 6D 73 65 63
      0081F3 0D                    1203 	.db 0x0d
      0081F4 0A                    1204 	.db 0x0a
      0081F5 00                    1205 	.db 0x00
                                   1206 	.area CODE
                                   1207 	.area CONST
      0081F6                       1208 __str_20:
      0081F6 73 74 6F 70 20 67 70  1209 	.ascii "stop gpio key push : [%d]"
             69 6F 20 6B 65 79 20
             70 75 73 68 20 3A 20
             5B 25 64 5D
      00820F 0D                    1210 	.db 0x0d
      008210 0A                    1211 	.db 0x0a
      008211 00                    1212 	.db 0x00
                                   1213 	.area CODE
                                   1214 	.area CONST
      008212                       1215 __str_21:
      008212 67 70 69 6F 20 6B 65  1216 	.ascii "gpio key on [%d]"
             79 20 6F 6E 20 5B 25
             64 5D
      008222 0D                    1217 	.db 0x0d
      008223 0A                    1218 	.db 0x0a
      008224 00                    1219 	.db 0x00
                                   1220 	.area CODE
                                   1221 	.area CONST
      008225                       1222 ___str_22:
      008225 72 65 6D 61 70        1223 	.ascii "remap"
      00822A 00                    1224 	.db 0x00
                                   1225 	.area CODE
                                   1226 	.area CONST
      00822B                       1227 ___str_23:
      00822B 73 65 74              1228 	.ascii "set"
      00822E 00                    1229 	.db 0x00
                                   1230 	.area CODE
                                   1231 	.area CONST
      00822F                       1232 ___str_24:
      00822F 72 65 73 65 74        1233 	.ascii "reset"
      008234 00                    1234 	.db 0x00
                                   1235 	.area CODE
                                   1236 	.area CONST
      008235                       1237 __str_25:
      008235 62 65 65 70 20 69 6E  1238 	.ascii "beep init....error !!!"
             69 74 2E 2E 2E 2E 65
             72 72 6F 72 20 21 21
             21
      00824B 0D                    1239 	.db 0x0d
      00824C 0A                    1240 	.db 0x0a
      00824D 00                    1241 	.db 0x00
                                   1242 	.area CODE
                                   1243 	.area CONST
      00824E                       1244 __str_26:
      00824E 62 65 65 70 20 69 6E  1245 	.ascii "beep init....(0x%02X)"
             69 74 2E 2E 2E 2E 28
             30 78 25 30 32 58 29
      008263 0D                    1246 	.db 0x0d
      008264 0A                    1247 	.db 0x0a
      008265 00                    1248 	.db 0x00
                                   1249 	.area CODE
                                   1250 	.area CONST
      008266                       1251 __str_27:
      008266 62 65 65 70 20 41 46  1252 	.ascii "beep AFR7....(0x%x)"
             52 37 2E 2E 2E 2E 28
             30 78 25 78 29
      008279 0D                    1253 	.db 0x0d
      00827A 0A                    1254 	.db 0x0a
      00827B 00                    1255 	.db 0x00
                                   1256 	.area CODE
                                   1257 	.area CONST
      00827C                       1258 ___str_28:
      00827C 69 6E 69 74           1259 	.ascii "init"
      008280 00                    1260 	.db 0x00
                                   1261 	.area CODE
                                   1262 	.area CONST
      008281                       1263 ___str_29:
      008281 68 65 6C 70           1264 	.ascii "help"
      008285 00                    1265 	.db 0x00
                                   1266 	.area CODE
                                   1267 	.area CONST
      008286                       1268 ___str_30:
      008286 62 65 65 70 20 68 65  1269 	.ascii "beep help...."
             6C 70 2E 2E 2E 2E
      008293 09                    1270 	.db 0x09
      008294 0D                    1271 	.db 0x0d
      008295 0A                    1272 	.db 0x0a
      008296 62 65 65 70 20 69 6E  1273 	.ascii "beep init // gpio init"
             69 74 20 2F 2F 20 67
             70 69 6F 20 69 6E 69
             74
      0082AC 0D                    1274 	.db 0x0d
      0082AD 0A                    1275 	.db 0x0a
      0082AE 62 65 65 70 20 72 65  1276 	.ascii "beep remap set // beep pin remap"
             6D 61 70 20 73 65 74
             20 2F 2F 20 62 65 65
             70 20 70 69 6E 20 72
             65 6D 61 70
      0082CE 0D                    1277 	.db 0x0d
      0082CF 0A                    1278 	.db 0x0a
      0082D0 62 65 65 70 20 66 72  1279 	.ascii "beep freq 1000 // 1000Hz pulse generator.."
             65 71 20 31 30 30 30
             20 2F 2F 20 31 30 30
             30 48 7A 20 70 75 6C
             73 65 20 67 65 6E 65
             72 61 74 6F 72 2E 2E
      0082FA 0D                    1280 	.db 0x0d
      0082FB 0A                    1281 	.db 0x0a
      0082FC 62 65 65 70 20 65 6E  1282 	.ascii "beep enable"
             61 62 6C 65
      008307 0D                    1283 	.db 0x0d
      008308 0A                    1284 	.db 0x0a
      008309 62 65 65 70 20 64 69  1285 	.ascii "beep disable"
             73 61 62 6C 65
      008315 0D                    1286 	.db 0x0d
      008316 0A                    1287 	.db 0x0a
      008317 62 65 65 70 20 72 65  1288 	.ascii "beep remap  reset // reset"
             6D 61 70 20 20 72 65
             73 65 74 20 2F 2F 20
             72 65 73 65 74
      008331 0D                    1289 	.db 0x0d
      008332 0A                    1290 	.db 0x0a
      008333 65 78 32 29           1291 	.ascii "ex2)"
      008337 0D                    1292 	.db 0x0d
      008338 0A                    1293 	.db 0x0a
      008339 62 65 65 70 20 73 74  1294 	.ascii "beep start  4000  200// 4KHz freq 200 msec delay"
             61 72 74 20 20 34 30
             30 30 20 20 32 30 30
             2F 2F 20 34 4B 48 7A
             20 66 72 65 71 20 32
             30 30 20 6D 73 65 63
             20 64 65 6C 61 79
      008369 0D                    1295 	.db 0x0d
      00836A 0A                    1296 	.db 0x0a
      00836B 62 65 65 70 20 74 6F  1297 	.ascii "beep toggle 1000 /// 500msec per on/off, gpio beep pin test."
             67 67 6C 65 20 31 30
             30 30 20 2F 2F 2F 20
             35 30 30 6D 73 65 63
             20 70 65 72 20 6F 6E
             2F 6F 66 66 2C 20 67
             70 69 6F 20 62 65 65
             70 20 70 69 6E 20 74
             65 73 74 2E
      0083A7 2E 2E                 1298 	.ascii ".."
      0083A9 0D                    1299 	.db 0x0d
      0083AA 0A                    1300 	.db 0x0a
      0083AB 2F 2F 20 67 70 69 6F  1301 	.ascii "// gpio beep pin toggle... per 1000 msec.."
             20 62 65 65 70 20 70
             69 6E 20 74 6F 67 67
             6C 65 2E 2E 2E 20 70
             65 72 20 31 30 30 30
             20 6D 73 65 63 2E 2E
      0083D5 0D                    1302 	.db 0x0d
      0083D6 0A                    1303 	.db 0x0a
      0083D7 00                    1304 	.db 0x00
                                   1305 	.area CODE
                                   1306 	.area CONST
      0083D8                       1307 __str_31:
      0083D8 62 65 65 70 20 69 6E  1308 	.ascii "beep init [%d : SEL(%d) : DIV(%d)] Hz"
             69 74 20 5B 25 64 20
             3A 20 53 45 4C 28 25
             64 29 20 3A 20 44 49
             56 28 25 64 29 5D 20
             48 7A
      0083FD 0D                    1309 	.db 0x0d
      0083FE 0A                    1310 	.db 0x0a
      0083FF 00                    1311 	.db 0x00
                                   1312 	.area CODE
                                   1313 	.area CONST
      008400                       1314 __str_32:
      008400 62 65 65 70 20 69 6E  1315 	.ascii "beep init error... [%d] Hz"
             69 74 20 65 72 72 6F
             72 2E 2E 2E 20 5B 25
             64 5D 20 48 7A
      00841A 0D                    1316 	.db 0x0d
      00841B 0A                    1317 	.db 0x0a
      00841C 00                    1318 	.db 0x00
                                   1319 	.area CODE
                                   1320 	.area CONST
      00841D                       1321 ___str_33:
      00841D 62 65 65 70           1322 	.ascii "beep"
      008421 00                    1323 	.db 0x00
                                   1324 	.area CODE
                                   1325 	.area CONST
      008422                       1326 ___str_34:
      008422 20 20 62 65 65 70 20  1327 	.ascii "  beep {write} [addr] [data]  "
             7B 77 72 69 74 65 7D
             20 5B 61 64 64 72 5D
             20 5B 64 61 74 61 5D
             20 20
      008440 0D                    1328 	.db 0x0d
      008441 0A                    1329 	.db 0x0a
      008442 20 20 62 65 65 70 20  1330 	.ascii "  beep {read} [addr] "
             7B 72 65 61 64 7D 20
             5B 61 64 64 72 5D 20
      008457 0D                    1331 	.db 0x0d
      008458 0A                    1332 	.db 0x0a
      008459 20 20 62 65 65 70 20  1333 	.ascii "  beep {init} "
             7B 69 6E 69 74 7D 20
      008467 0D                    1334 	.db 0x0d
      008468 0A                    1335 	.db 0x0a
      008469 20 20 62 65 65 70 20  1336 	.ascii "  beep {remap} {set/reset}"
             7B 72 65 6D 61 70 7D
             20 7B 73 65 74 2F 72
             65 73 65 74 7D
      008483 0D                    1337 	.db 0x0d
      008484 0A                    1338 	.db 0x0a
      008485 20 20 62 65 65 70 20  1339 	.ascii "  beep {freq} [data:(?)Hz] "
             7B 66 72 65 71 7D 20
             5B 64 61 74 61 3A 28
             3F 29 48 7A 5D 20
      0084A0 0D                    1340 	.db 0x0d
      0084A1 0A                    1341 	.db 0x0a
      0084A2 20 20 62 65 65 70 20  1342 	.ascii "  beep {enable} "
             7B 65 6E 61 62 6C 65
             7D 20
      0084B2 0D                    1343 	.db 0x0d
      0084B3 0A                    1344 	.db 0x0a
      0084B4 20 20 62 65 65 70 20  1345 	.ascii "  beep {disable} "
             7B 64 69 73 61 62 6C
             65 7D 20
      0084C5 0D                    1346 	.db 0x0d
      0084C6 0A                    1347 	.db 0x0a
      0084C7 20 20 62 65 65 70 20  1348 	.ascii "  beep {start} [data:(?)Hz] [delay:(?)msec] 0:continous"
             7B 73 74 61 72 74 7D
             20 5B 64 61 74 61 3A
             28 3F 29 48 7A 5D 20
             5B 64 65 6C 61 79 3A
             28 3F 29 6D 73 65 63
             5D 20 30 3A 63 6F 6E
             74 69 6E 6F 75 73
      0084FE 0D                    1349 	.db 0x0d
      0084FF 0A                    1350 	.db 0x0a
      008500 20 20 62 65 65 70 20  1351 	.ascii "  beep {toggle} [data:(?)msec] GPIO toggle"
             7B 74 6F 67 67 6C 65
             7D 20 5B 64 61 74 61
             3A 28 3F 29 6D 73 65
             63 5D 20 47 50 49 4F
             20 74 6F 67 67 6C 65
      00852A 0D                    1352 	.db 0x0d
      00852B 0A                    1353 	.db 0x0a
      00852C 20 20 62 65 65 70 20  1354 	.ascii "  beep {help}  beep help."
             7B 68 65 6C 70 7D 20
             20 62 65 65 70 20 68
             65 6C 70 2E
      008545 0D                    1355 	.db 0x0d
      008546 0A                    1356 	.db 0x0a
      008547 00                    1357 	.db 0x00
                                   1358 	.area CODE
                                   1359 	.area INITIALIZER
      008B9C                       1360 __xinit__gbDelayData:
      008B9C 00                    1361 	.db #0x00	; 0
      008B9D                       1362 __xinit__cmdTbl_only:
      008B9D 84 1D                 1363 	.dw ___str_33
      008B9F 8C 45                 1364 	.dw _DoBEEP
      008BA1 84 22                 1365 	.dw ___str_34
      008BA3 00 00                 1366 	.dw #0x0000
      008BA5 00 00                 1367 	.dw #0x0000
      008BA7 00 00                 1368 	.dw #0x0000
                                   1369 	.area CABS (ABS)
