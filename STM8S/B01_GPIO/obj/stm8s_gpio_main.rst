                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_gpio_main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _cmd_test_init_before_irq_enable
                                     12 	.globl _cmd_test
                                     13 	.globl _cmd_gpio
                                     14 	.globl _HexToInt
                                     15 	.globl _mib_printf
                                     16 	.globl _MibWriteDebugString
                                     17 	.globl ___memcpy
                                     18 	.globl _strcmp
                                     19 	.globl _GPIO_WriteReverse
                                     20 	.globl _GPIO_Init
                                     21 	.globl _GPIO_DeInit
                                     22 	.globl _GPIO_Configuration
                                     23 	.globl _Toggle
                                     24 ;--------------------------------------------------------
                                     25 ; ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area DATA
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area INITIALIZED
      00014A                         32 _cmdTbl_only:
      00014A                         33 	.ds 12
                                     34 ;--------------------------------------------------------
                                     35 ; absolute external ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area DABS (ABS)
                                     38 
                                     39 ; default segment ordering for linker
                                     40 	.area HOME
                                     41 	.area GSINIT
                                     42 	.area GSFINAL
                                     43 	.area CONST
                                     44 	.area INITIALIZER
                                     45 	.area CODE
                                     46 
                                     47 ;--------------------------------------------------------
                                     48 ; global & static initialisations
                                     49 ;--------------------------------------------------------
                                     50 	.area HOME
                                     51 	.area GSINIT
                                     52 	.area GSFINAL
                                     53 	.area GSINIT
                                     54 ;--------------------------------------------------------
                                     55 ; Home
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
                                     58 	.area HOME
                                     59 ;--------------------------------------------------------
                                     60 ; code
                                     61 ;--------------------------------------------------------
                                     62 	.area CODE
                                     63 ;	stm8s_gpio_main.c: 83: void cmd_gpio(void)
                                     64 ;	-----------------------------------------
                                     65 ;	 function cmd_gpio
                                     66 ;	-----------------------------------------
      008A1E                         67 _cmd_gpio:
      008A1E 52 0A            [ 2]   68 	sub	sp, #10
                                     69 ;	stm8s_gpio_main.c: 89: for (cptr = cmdTbl;; cptr++) 
      008A20 AE 01 5C         [ 2]   70 	ldw	x, #(_cmdTbl+0)
      008A23 1F 01            [ 2]   71 	ldw	(0x01, sp), x
      008A25 5F               [ 1]   72 	clrw	x
      008A26 1F 07            [ 2]   73 	ldw	(0x07, sp), x
      008A28 1F 05            [ 2]   74 	ldw	(0x05, sp), x
      008A2A 16 01            [ 2]   75 	ldw	y, (0x01, sp)
      008A2C 17 09            [ 2]   76 	ldw	(0x09, sp), y
      008A2E                         77 00106$:
                                     78 ;	stm8s_gpio_main.c: 91: if(cptr->cmd==0)
      008A2E 1E 09            [ 2]   79 	ldw	x, (0x09, sp)
      008A30 FE               [ 2]   80 	ldw	x, (x)
      008A31 1F 03            [ 2]   81 	ldw	(0x03, sp), x
      008A33 26 19            [ 1]   82 	jrne	00102$
                                     83 ;	stm8s_gpio_main.c: 93: ccprintf(1,("INFO:+cmd_gpio...\r\n"));
      008A35 4B 8F            [ 1]   84 	push	#<(__str_0+0)
      008A37 4B 80            [ 1]   85 	push	#((__str_0+0) >> 8)
      008A39 CD 99 C0         [ 4]   86 	call	_mib_printf
      008A3C 5B 02            [ 2]   87 	addw	sp, #2
                                     88 ;	stm8s_gpio_main.c: 94: memcpy((void *)&(cptr->cmd),(void *)&(cmdTbl_only[0].cmd),sizeof(CMD_MY));
      008A3E AE 01 4A         [ 2]   89 	ldw	x, #_cmdTbl_only+0
      008A41 16 01            [ 2]   90 	ldw	y, (0x01, sp)
      008A43 4B 06            [ 1]   91 	push	#0x06
      008A45 4B 00            [ 1]   92 	push	#0x00
      008A47 89               [ 2]   93 	pushw	x
      008A48 93               [ 1]   94 	ldw	x, y
      008A49 CD AB CA         [ 4]   95 	call	___memcpy
                                     96 ;	stm8s_gpio_main.c: 95: break;
      008A4C 20 2F            [ 2]   97 	jra	00105$
      008A4E                         98 00102$:
                                     99 ;	stm8s_gpio_main.c: 97: index++;
      008A4E 1E 07            [ 2]  100 	ldw	x, (0x07, sp)
      008A50 5C               [ 1]  101 	incw	x
      008A51 1F 07            [ 2]  102 	ldw	(0x07, sp), x
      008A53 26 05            [ 1]  103 	jrne	00126$
      008A55 1E 05            [ 2]  104 	ldw	x, (0x05, sp)
      008A57 5C               [ 1]  105 	incw	x
      008A58 1F 05            [ 2]  106 	ldw	(0x05, sp), x
      008A5A                        107 00126$:
                                    108 ;	stm8s_gpio_main.c: 98: if(index>MAX_COMMANDS)
      008A5A AE 00 06         [ 2]  109 	ldw	x, #0x0006
      008A5D 13 07            [ 2]  110 	cpw	x, (0x07, sp)
      008A5F 4F               [ 1]  111 	clr	a
      008A60 12 06            [ 1]  112 	sbc	a, (0x06, sp)
      008A62 4F               [ 1]  113 	clr	a
      008A63 12 05            [ 1]  114 	sbc	a, (0x05, sp)
      008A65 24 0B            [ 1]  115 	jrnc	00107$
                                    116 ;	stm8s_gpio_main.c: 100: ccprintf(1,("INFO:-cmd_gpio...\r\n"));
      008A67 4B A3            [ 1]  117 	push	#<(__str_1+0)
      008A69 4B 80            [ 1]  118 	push	#((__str_1+0) >> 8)
      008A6B CD 99 C0         [ 4]  119 	call	_mib_printf
      008A6E 5B 02            [ 2]  120 	addw	sp, #2
                                    121 ;	stm8s_gpio_main.c: 101: return;
      008A70 20 0B            [ 2]  122 	jra	00108$
      008A72                        123 00107$:
                                    124 ;	stm8s_gpio_main.c: 89: for (cptr = cmdTbl;; cptr++) 
      008A72 1E 09            [ 2]  125 	ldw	x, (0x09, sp)
      008A74 1C 00 06         [ 2]  126 	addw	x, #0x0006
      008A77 1F 09            [ 2]  127 	ldw	(0x09, sp), x
      008A79 1F 01            [ 2]  128 	ldw	(0x01, sp), x
      008A7B 20 B1            [ 2]  129 	jra	00106$
      008A7D                        130 00105$:
                                    131 ;	stm8s_gpio_main.c: 104: return;
      008A7D                        132 00108$:
                                    133 ;	stm8s_gpio_main.c: 105: }
      008A7D 5B 0A            [ 2]  134 	addw	sp, #10
      008A7F 81               [ 4]  135 	ret
                                    136 ;	stm8s_gpio_main.c: 110: void cmd_test(void)
                                    137 ;	-----------------------------------------
                                    138 ;	 function cmd_test
                                    139 ;	-----------------------------------------
      008A80                        140 _cmd_test:
                                    141 ;	stm8s_gpio_main.c: 112: cmd_gpio();
                                    142 ;	stm8s_gpio_main.c: 113: }
      008A80 CC 8A 1E         [ 2]  143 	jp	_cmd_gpio
                                    144 ;	stm8s_gpio_main.c: 119: void cmd_test_init_before_irq_enable(void)
                                    145 ;	-----------------------------------------
                                    146 ;	 function cmd_test_init_before_irq_enable
                                    147 ;	-----------------------------------------
      008A83                        148 _cmd_test_init_before_irq_enable:
                                    149 ;	stm8s_gpio_main.c: 122: }
      008A83 81               [ 4]  150 	ret
                                    151 ;	stm8s_gpio_main.c: 133: static int DoGPIO(CMD_MY *cptr, int argc, char **argv)
                                    152 ;	-----------------------------------------
                                    153 ;	 function DoGPIO
                                    154 ;	-----------------------------------------
      008A84                        155 _DoGPIO:
      008A84 52 0E            [ 2]  156 	sub	sp, #14
                                    157 ;	stm8s_gpio_main.c: 135: uint16_t vwAddr = 0;
      008A86 0F 02            [ 1]  158 	clr	(0x02, sp)
      008A88 0F 01            [ 1]  159 	clr	(0x01, sp)
                                    160 ;	stm8s_gpio_main.c: 136: uint8_t vbData = 0;
      008A8A 0F 03            [ 1]  161 	clr	(0x03, sp)
                                    162 ;	stm8s_gpio_main.c: 140: MibWriteDebugString(cptr->usage);
      008A8C 1C 00 04         [ 2]  163 	addw	x, #0x0004
      008A8F 1F 0D            [ 2]  164 	ldw	(0x0d, sp), x
                                    165 ;	stm8s_gpio_main.c: 138: if (argc < 2)
      008A91 1E 11            [ 2]  166 	ldw	x, (0x11, sp)
      008A93 A3 00 02         [ 2]  167 	cpw	x, #0x0002
      008A96 2E 0A            [ 1]  168 	jrsge	00102$
                                    169 ;	stm8s_gpio_main.c: 140: MibWriteDebugString(cptr->usage);
      008A98 1E 0D            [ 2]  170 	ldw	x, (0x0d, sp)
      008A9A FE               [ 2]  171 	ldw	x, (x)
      008A9B CD 8F AE         [ 4]  172 	call	_MibWriteDebugString
                                    173 ;	stm8s_gpio_main.c: 141: return FALSE;
      008A9E 5F               [ 1]  174 	clrw	x
      008A9F CC 8E 90         [ 2]  175 	jp	00187$
      008AA2                        176 00102$:
                                    177 ;	stm8s_gpio_main.c: 146: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      008AA2 1E 13            [ 2]  178 	ldw	x, (0x13, sp)
      008AA4 5C               [ 1]  179 	incw	x
      008AA5 5C               [ 1]  180 	incw	x
      008AA6 1F 05            [ 2]  181 	ldw	(0x05, sp), x
      008AA8 FE               [ 2]  182 	ldw	x, (x)
      008AA9 4B B7            [ 1]  183 	push	#<(___str_2+0)
      008AAB 4B 80            [ 1]  184 	push	#((___str_2+0) >> 8)
      008AAD CD AC 4E         [ 4]  185 	call	_strcmp
      008AB0 51               [ 1]  186 	exgw	x, y
                                    187 ;	stm8s_gpio_main.c: 148: if (argc < 4)
      008AB1 1E 11            [ 2]  188 	ldw	x, (0x11, sp)
      008AB3 A3 00 04         [ 2]  189 	cpw	x, #0x0004
      008AB6 2F 04            [ 1]  190 	jrslt	00415$
      008AB8 0F 07            [ 1]  191 	clr	(0x07, sp)
      008ABA 20 04            [ 2]  192 	jra	00416$
      008ABC                        193 00415$:
      008ABC A6 01            [ 1]  194 	ld	a, #0x01
      008ABE 6B 07            [ 1]  195 	ld	(0x07, sp), a
      008AC0                        196 00416$:
                                    197 ;	stm8s_gpio_main.c: 153: if (!HexToInt(argv[2], &vwAddr, 16))
      008AC0 1E 13            [ 2]  198 	ldw	x, (0x13, sp)
      008AC2 1C 00 04         [ 2]  199 	addw	x, #0x0004
      008AC5 1F 08            [ 2]  200 	ldw	(0x08, sp), x
                                    201 ;	stm8s_gpio_main.c: 158: if (!HexToInt(argv[3], &vbData, 8))
      008AC7 1E 13            [ 2]  202 	ldw	x, (0x13, sp)
      008AC9 1C 00 06         [ 2]  203 	addw	x, #0x0006
      008ACC 1F 0B            [ 2]  204 	ldw	(0x0b, sp), x
                                    205 ;	stm8s_gpio_main.c: 146: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      008ACE 90 5D            [ 2]  206 	tnzw	y
      008AD0 26 67            [ 1]  207 	jrne	00185$
                                    208 ;	stm8s_gpio_main.c: 148: if (argc < 4)
      008AD2 0D 07            [ 1]  209 	tnz	(0x07, sp)
      008AD4 27 0A            [ 1]  210 	jreq	00104$
                                    211 ;	stm8s_gpio_main.c: 150: MibWriteDebugString(cptr->usage);
      008AD6 1E 0D            [ 2]  212 	ldw	x, (0x0d, sp)
      008AD8 FE               [ 2]  213 	ldw	x, (x)
      008AD9 CD 8F AE         [ 4]  214 	call	_MibWriteDebugString
                                    215 ;	stm8s_gpio_main.c: 151: return FALSE;
      008ADC 5F               [ 1]  216 	clrw	x
      008ADD CC 8E 90         [ 2]  217 	jp	00187$
      008AE0                        218 00104$:
                                    219 ;	stm8s_gpio_main.c: 153: if (!HexToInt(argv[2], &vwAddr, 16))
      008AE0 96               [ 1]  220 	ldw	x, sp
      008AE1 5C               [ 1]  221 	incw	x
      008AE2 51               [ 1]  222 	exgw	x, y
      008AE3 1E 08            [ 2]  223 	ldw	x, (0x08, sp)
      008AE5 FE               [ 2]  224 	ldw	x, (x)
      008AE6 4B 10            [ 1]  225 	push	#0x10
      008AE8 4B 00            [ 1]  226 	push	#0x00
      008AEA 90 89            [ 2]  227 	pushw	y
      008AEC CD 9C C1         [ 4]  228 	call	_HexToInt
      008AEF 5D               [ 2]  229 	tnzw	x
      008AF0 26 0D            [ 1]  230 	jrne	00106$
                                    231 ;	stm8s_gpio_main.c: 155: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008AF2 4B BD            [ 1]  232 	push	#<(__str_3+0)
      008AF4 4B 80            [ 1]  233 	push	#((__str_3+0) >> 8)
      008AF6 CD 99 C0         [ 4]  234 	call	_mib_printf
      008AF9 5B 02            [ 2]  235 	addw	sp, #2
                                    236 ;	stm8s_gpio_main.c: 156: return FALSE;
      008AFB 5F               [ 1]  237 	clrw	x
      008AFC CC 8E 90         [ 2]  238 	jp	00187$
      008AFF                        239 00106$:
                                    240 ;	stm8s_gpio_main.c: 158: if (!HexToInt(argv[3], &vbData, 8))
      008AFF 96               [ 1]  241 	ldw	x, sp
      008B00 1C 00 03         [ 2]  242 	addw	x, #3
      008B03 51               [ 1]  243 	exgw	x, y
      008B04 1E 0B            [ 2]  244 	ldw	x, (0x0b, sp)
      008B06 FE               [ 2]  245 	ldw	x, (x)
      008B07 4B 08            [ 1]  246 	push	#0x08
      008B09 4B 00            [ 1]  247 	push	#0x00
      008B0B 90 89            [ 2]  248 	pushw	y
      008B0D CD 9C C1         [ 4]  249 	call	_HexToInt
      008B10 5D               [ 2]  250 	tnzw	x
      008B11 26 0D            [ 1]  251 	jrne	00108$
                                    252 ;	stm8s_gpio_main.c: 160: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008B13 4B BD            [ 1]  253 	push	#<(__str_3+0)
      008B15 4B 80            [ 1]  254 	push	#((__str_3+0) >> 8)
      008B17 CD 99 C0         [ 4]  255 	call	_mib_printf
      008B1A 5B 02            [ 2]  256 	addw	sp, #2
                                    257 ;	stm8s_gpio_main.c: 161: return FALSE;
      008B1C 5F               [ 1]  258 	clrw	x
      008B1D CC 8E 90         [ 2]  259 	jp	00187$
      008B20                        260 00108$:
                                    261 ;	stm8s_gpio_main.c: 163: wr_ADDR8(vwAddr, vbData);
      008B20 1E 01            [ 2]  262 	ldw	x, (0x01, sp)
      008B22 7B 03            [ 1]  263 	ld	a, (0x03, sp)
      008B24 F7               [ 1]  264 	ld	(x), a
                                    265 ;	stm8s_gpio_main.c: 164: ccprintf(_DEBUG_CMD_A_,("wr_ADDR8 : 0x%04x[0x%02x]\r\n", vwAddr,vbData));
      008B25 5F               [ 1]  266 	clrw	x
      008B26 7B 03            [ 1]  267 	ld	a, (0x03, sp)
      008B28 97               [ 1]  268 	ld	xl, a
      008B29 89               [ 2]  269 	pushw	x
      008B2A 1E 03            [ 2]  270 	ldw	x, (0x03, sp)
      008B2C 89               [ 2]  271 	pushw	x
      008B2D 4B DA            [ 1]  272 	push	#<(__str_4+0)
      008B2F 4B 80            [ 1]  273 	push	#((__str_4+0) >> 8)
      008B31 CD 99 C0         [ 4]  274 	call	_mib_printf
      008B34 5B 06            [ 2]  275 	addw	sp, #6
      008B36 CC 8E 8E         [ 2]  276 	jp	00186$
      008B39                        277 00185$:
                                    278 ;	stm8s_gpio_main.c: 169: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      008B39 1E 05            [ 2]  279 	ldw	x, (0x05, sp)
      008B3B FE               [ 2]  280 	ldw	x, (x)
      008B3C 4B F6            [ 1]  281 	push	#<(___str_5+0)
      008B3E 4B 80            [ 1]  282 	push	#((___str_5+0) >> 8)
      008B40 CD AC 4E         [ 4]  283 	call	_strcmp
      008B43 51               [ 1]  284 	exgw	x, y
                                    285 ;	stm8s_gpio_main.c: 171: if (argc < 3)
      008B44 1E 11            [ 2]  286 	ldw	x, (0x11, sp)
      008B46 A3 00 03         [ 2]  287 	cpw	x, #0x0003
      008B49 2F 04            [ 1]  288 	jrslt	00421$
      008B4B 0F 0A            [ 1]  289 	clr	(0x0a, sp)
      008B4D 20 04            [ 2]  290 	jra	00422$
      008B4F                        291 00421$:
      008B4F A6 01            [ 1]  292 	ld	a, #0x01
      008B51 6B 0A            [ 1]  293 	ld	(0x0a, sp), a
      008B53                        294 00422$:
                                    295 ;	stm8s_gpio_main.c: 169: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      008B53 90 5D            [ 2]  296 	tnzw	y
      008B55 26 44            [ 1]  297 	jrne	00182$
                                    298 ;	stm8s_gpio_main.c: 171: if (argc < 3)
      008B57 0D 0A            [ 1]  299 	tnz	(0x0a, sp)
      008B59 27 0A            [ 1]  300 	jreq	00110$
                                    301 ;	stm8s_gpio_main.c: 173: MibWriteDebugString(cptr->usage);
      008B5B 1E 0D            [ 2]  302 	ldw	x, (0x0d, sp)
      008B5D FE               [ 2]  303 	ldw	x, (x)
      008B5E CD 8F AE         [ 4]  304 	call	_MibWriteDebugString
                                    305 ;	stm8s_gpio_main.c: 174: return FALSE;
      008B61 5F               [ 1]  306 	clrw	x
      008B62 CC 8E 90         [ 2]  307 	jp	00187$
      008B65                        308 00110$:
                                    309 ;	stm8s_gpio_main.c: 176: if (!HexToInt(argv[2], &vwAddr, 16))
      008B65 96               [ 1]  310 	ldw	x, sp
      008B66 5C               [ 1]  311 	incw	x
      008B67 51               [ 1]  312 	exgw	x, y
      008B68 1E 08            [ 2]  313 	ldw	x, (0x08, sp)
      008B6A FE               [ 2]  314 	ldw	x, (x)
      008B6B 4B 10            [ 1]  315 	push	#0x10
      008B6D 4B 00            [ 1]  316 	push	#0x00
      008B6F 90 89            [ 2]  317 	pushw	y
      008B71 CD 9C C1         [ 4]  318 	call	_HexToInt
      008B74 5D               [ 2]  319 	tnzw	x
      008B75 26 0D            [ 1]  320 	jrne	00112$
                                    321 ;	stm8s_gpio_main.c: 178: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008B77 4B BD            [ 1]  322 	push	#<(__str_3+0)
      008B79 4B 80            [ 1]  323 	push	#((__str_3+0) >> 8)
      008B7B CD 99 C0         [ 4]  324 	call	_mib_printf
      008B7E 5B 02            [ 2]  325 	addw	sp, #2
                                    326 ;	stm8s_gpio_main.c: 179: return FALSE;
      008B80 5F               [ 1]  327 	clrw	x
      008B81 CC 8E 90         [ 2]  328 	jp	00187$
      008B84                        329 00112$:
                                    330 ;	stm8s_gpio_main.c: 182: vbData = rd_ADDR8(vwAddr);
      008B84 1E 01            [ 2]  331 	ldw	x, (0x01, sp)
      008B86 F6               [ 1]  332 	ld	a, (x)
      008B87 6B 03            [ 1]  333 	ld	(0x03, sp), a
                                    334 ;	stm8s_gpio_main.c: 184: ccprintf(_DEBUG_CMD_A_,("rd_ADDR8 : 0x%04x[0x%02x]\r\n", vwAddr,vbData));
      008B89 5F               [ 1]  335 	clrw	x
      008B8A 97               [ 1]  336 	ld	xl, a
      008B8B 89               [ 2]  337 	pushw	x
      008B8C 1E 03            [ 2]  338 	ldw	x, (0x03, sp)
      008B8E 89               [ 2]  339 	pushw	x
      008B8F 4B FB            [ 1]  340 	push	#<(__str_6+0)
      008B91 4B 80            [ 1]  341 	push	#((__str_6+0) >> 8)
      008B93 CD 99 C0         [ 4]  342 	call	_mib_printf
      008B96 5B 06            [ 2]  343 	addw	sp, #6
      008B98 CC 8E 8E         [ 2]  344 	jp	00186$
      008B9B                        345 00182$:
                                    346 ;	stm8s_gpio_main.c: 189: else if (!strcmp(argv[1], "in")) // _CMD_MY_READ_
      008B9B 1E 05            [ 2]  347 	ldw	x, (0x05, sp)
      008B9D FE               [ 2]  348 	ldw	x, (x)
      008B9E 4B 17            [ 1]  349 	push	#<(___str_7+0)
      008BA0 4B 81            [ 1]  350 	push	#((___str_7+0) >> 8)
      008BA2 CD AC 4E         [ 4]  351 	call	_strcmp
      008BA5 5D               [ 2]  352 	tnzw	x
      008BA6 27 03            [ 1]  353 	jreq	00426$
      008BA8 CC 8C 89         [ 2]  354 	jp	00179$
      008BAB                        355 00426$:
                                    356 ;	stm8s_gpio_main.c: 191: char vbPort = *(char *)(argv[2]); // argv[2][0]
      008BAB 1E 08            [ 2]  357 	ldw	x, (0x08, sp)
      008BAD FE               [ 2]  358 	ldw	x, (x)
      008BAE F6               [ 1]  359 	ld	a, (x)
      008BAF 6B 0A            [ 1]  360 	ld	(0x0a, sp), a
                                    361 ;	stm8s_gpio_main.c: 192: char vbNum = *(char *)(argv[3]);
      008BB1 1E 0B            [ 2]  362 	ldw	x, (0x0b, sp)
      008BB3 FE               [ 2]  363 	ldw	x, (x)
      008BB4 F6               [ 1]  364 	ld	a, (x)
      008BB5 6B 09            [ 1]  365 	ld	(0x09, sp), a
                                    366 ;	stm8s_gpio_main.c: 194: GPIO_TypeDef* GPIOx=GPIOA;
      008BB7 AE 50 00         [ 2]  367 	ldw	x, #0x5000
      008BBA 1F 0B            [ 2]  368 	ldw	(0x0b, sp), x
                                    369 ;	stm8s_gpio_main.c: 195: if (argc < 4)
      008BBC 0D 07            [ 1]  370 	tnz	(0x07, sp)
      008BBE 27 0A            [ 1]  371 	jreq	00114$
                                    372 ;	stm8s_gpio_main.c: 197: MibWriteDebugString(cptr->usage);
      008BC0 1E 0D            [ 2]  373 	ldw	x, (0x0d, sp)
      008BC2 FE               [ 2]  374 	ldw	x, (x)
      008BC3 CD 8F AE         [ 4]  375 	call	_MibWriteDebugString
                                    376 ;	stm8s_gpio_main.c: 198: return FALSE;
      008BC6 5F               [ 1]  377 	clrw	x
      008BC7 CC 8E 90         [ 2]  378 	jp	00187$
      008BCA                        379 00114$:
                                    380 ;	stm8s_gpio_main.c: 200: if((vbPort>='a')&&(vbPort<='g'))
      008BCA 7B 0A            [ 1]  381 	ld	a, (0x0a, sp)
      008BCC A1 61            [ 1]  382 	cp	a, #0x61
      008BCE 24 03            [ 1]  383 	jrnc	00428$
      008BD0 CC 8E 8E         [ 2]  384 	jp	00186$
      008BD3                        385 00428$:
      008BD3 7B 0A            [ 1]  386 	ld	a, (0x0a, sp)
      008BD5 A1 67            [ 1]  387 	cp	a, #0x67
      008BD7 23 03            [ 2]  388 	jrule	00429$
      008BD9 CC 8E 8E         [ 2]  389 	jp	00186$
      008BDC                        390 00429$:
                                    391 ;	stm8s_gpio_main.c: 202: switch(vbPort)
      008BDC 7B 0A            [ 1]  392 	ld	a, (0x0a, sp)
      008BDE A1 61            [ 1]  393 	cp	a, #0x61
      008BE0 27 26            [ 1]  394 	jreq	00115$
      008BE2 7B 0A            [ 1]  395 	ld	a, (0x0a, sp)
      008BE4 A1 62            [ 1]  396 	cp	a, #0x62
      008BE6 27 27            [ 1]  397 	jreq	00116$
      008BE8 7B 0A            [ 1]  398 	ld	a, (0x0a, sp)
      008BEA A1 63            [ 1]  399 	cp	a, #0x63
      008BEC 27 28            [ 1]  400 	jreq	00117$
      008BEE 7B 0A            [ 1]  401 	ld	a, (0x0a, sp)
      008BF0 A1 64            [ 1]  402 	cp	a, #0x64
      008BF2 27 29            [ 1]  403 	jreq	00118$
      008BF4 7B 0A            [ 1]  404 	ld	a, (0x0a, sp)
      008BF6 A1 65            [ 1]  405 	cp	a, #0x65
      008BF8 27 2A            [ 1]  406 	jreq	00119$
      008BFA 7B 0A            [ 1]  407 	ld	a, (0x0a, sp)
      008BFC A1 66            [ 1]  408 	cp	a, #0x66
      008BFE 27 2B            [ 1]  409 	jreq	00120$
      008C00 7B 0A            [ 1]  410 	ld	a, (0x0a, sp)
      008C02 A1 67            [ 1]  411 	cp	a, #0x67
      008C04 27 2C            [ 1]  412 	jreq	00121$
      008C06 20 2F            [ 2]  413 	jra	00123$
                                    414 ;	stm8s_gpio_main.c: 204: case 'a': GPIOx = GPIOA; break;
      008C08                        415 00115$:
      008C08 AE 50 00         [ 2]  416 	ldw	x, #0x5000
      008C0B 1F 0B            [ 2]  417 	ldw	(0x0b, sp), x
      008C0D 20 28            [ 2]  418 	jra	00123$
                                    419 ;	stm8s_gpio_main.c: 205: case 'b': GPIOx = GPIOB; break;
      008C0F                        420 00116$:
      008C0F AE 50 05         [ 2]  421 	ldw	x, #0x5005
      008C12 1F 0B            [ 2]  422 	ldw	(0x0b, sp), x
      008C14 20 21            [ 2]  423 	jra	00123$
                                    424 ;	stm8s_gpio_main.c: 206: case 'c': GPIOx = GPIOC; break;
      008C16                        425 00117$:
      008C16 AE 50 0A         [ 2]  426 	ldw	x, #0x500a
      008C19 1F 0B            [ 2]  427 	ldw	(0x0b, sp), x
      008C1B 20 1A            [ 2]  428 	jra	00123$
                                    429 ;	stm8s_gpio_main.c: 207: case 'd': GPIOx = GPIOD; break;
      008C1D                        430 00118$:
      008C1D AE 50 0F         [ 2]  431 	ldw	x, #0x500f
      008C20 1F 0B            [ 2]  432 	ldw	(0x0b, sp), x
      008C22 20 13            [ 2]  433 	jra	00123$
                                    434 ;	stm8s_gpio_main.c: 208: case 'e': GPIOx = GPIOE; break;
      008C24                        435 00119$:
      008C24 AE 50 14         [ 2]  436 	ldw	x, #0x5014
      008C27 1F 0B            [ 2]  437 	ldw	(0x0b, sp), x
      008C29 20 0C            [ 2]  438 	jra	00123$
                                    439 ;	stm8s_gpio_main.c: 209: case 'f': GPIOx = GPIOF; break;
      008C2B                        440 00120$:
      008C2B AE 50 19         [ 2]  441 	ldw	x, #0x5019
      008C2E 1F 0B            [ 2]  442 	ldw	(0x0b, sp), x
      008C30 20 05            [ 2]  443 	jra	00123$
                                    444 ;	stm8s_gpio_main.c: 210: case 'g': GPIOx = GPIOG; break;
      008C32                        445 00121$:
      008C32 AE 50 1E         [ 2]  446 	ldw	x, #0x501e
      008C35 1F 0B            [ 2]  447 	ldw	(0x0b, sp), x
                                    448 ;	stm8s_gpio_main.c: 214: }
      008C37                        449 00123$:
                                    450 ;	stm8s_gpio_main.c: 215: if((vbNum>='0')&&(vbNum<='7'))
      008C37 7B 09            [ 1]  451 	ld	a, (0x09, sp)
      008C39 A1 30            [ 1]  452 	cp	a, #0x30
      008C3B 24 03            [ 1]  453 	jrnc	00451$
      008C3D CC 8E 8E         [ 2]  454 	jp	00186$
      008C40                        455 00451$:
      008C40 7B 09            [ 1]  456 	ld	a, (0x09, sp)
      008C42 A1 37            [ 1]  457 	cp	a, #0x37
      008C44 23 03            [ 2]  458 	jrule	00452$
      008C46 CC 8E 8E         [ 2]  459 	jp	00186$
      008C49                        460 00452$:
                                    461 ;	stm8s_gpio_main.c: 217: vbNum &= 0x07;
      008C49 7B 09            [ 1]  462 	ld	a, (0x09, sp)
      008C4B A4 07            [ 1]  463 	and	a, #0x07
      008C4D 6B 0E            [ 1]  464 	ld	(0x0e, sp), a
                                    465 ;	stm8s_gpio_main.c: 218: GPIO_Init(GPIOx,vbNum,GPIO_MODE_IN_FL_NO_IT);
      008C4F 4B 00            [ 1]  466 	push	#0x00
      008C51 7B 0F            [ 1]  467 	ld	a, (0x0f, sp)
      008C53 1E 0C            [ 2]  468 	ldw	x, (0x0c, sp)
      008C55 CD 8E CD         [ 4]  469 	call	_GPIO_Init
                                    470 ;	stm8s_gpio_main.c: 219: vbBit = GPIOx->IDR >> vbNum;
      008C58 1E 0B            [ 2]  471 	ldw	x, (0x0b, sp)
      008C5A E6 01            [ 1]  472 	ld	a, (0x1, x)
      008C5C 88               [ 1]  473 	push	a
      008C5D 7B 0F            [ 1]  474 	ld	a, (0x0f, sp)
      008C5F 27 05            [ 1]  475 	jreq	00454$
      008C61                        476 00453$:
      008C61 04 01            [ 1]  477 	srl	(1, sp)
      008C63 4A               [ 1]  478 	dec	a
      008C64 26 FB            [ 1]  479 	jrne	00453$
      008C66                        480 00454$:
      008C66 84               [ 1]  481 	pop	a
                                    482 ;	stm8s_gpio_main.c: 220: vbBit &= 1;
      008C67 A4 01            [ 1]  483 	and	a, #0x01
                                    484 ;	stm8s_gpio_main.c: 221: ccprintf(_DEBUG_CMD_A_,("gpio in : port[%c] num[%d] bit[%d]\r\n", vbPort,vbNum,vbBit));
      008C69 5F               [ 1]  485 	clrw	x
      008C6A 97               [ 1]  486 	ld	xl, a
      008C6B 90 5F            [ 1]  487 	clrw	y
      008C6D 7B 0E            [ 1]  488 	ld	a, (0x0e, sp)
      008C6F 90 97            [ 1]  489 	ld	yl, a
      008C71 7B 0A            [ 1]  490 	ld	a, (0x0a, sp)
      008C73 6B 0E            [ 1]  491 	ld	(0x0e, sp), a
      008C75 0F 0D            [ 1]  492 	clr	(0x0d, sp)
      008C77 89               [ 2]  493 	pushw	x
      008C78 90 89            [ 2]  494 	pushw	y
      008C7A 1E 11            [ 2]  495 	ldw	x, (0x11, sp)
      008C7C 89               [ 2]  496 	pushw	x
      008C7D 4B 1A            [ 1]  497 	push	#<(__str_8+0)
      008C7F 4B 81            [ 1]  498 	push	#((__str_8+0) >> 8)
      008C81 CD 99 C0         [ 4]  499 	call	_mib_printf
      008C84 5B 08            [ 2]  500 	addw	sp, #8
      008C86 CC 8E 8E         [ 2]  501 	jp	00186$
      008C89                        502 00179$:
                                    503 ;	stm8s_gpio_main.c: 228: else if (!strcmp(argv[1], "out")) // _CMD_MY_READ_
      008C89 1E 05            [ 2]  504 	ldw	x, (0x05, sp)
      008C8B FE               [ 2]  505 	ldw	x, (x)
      008C8C 4B 3F            [ 1]  506 	push	#<(___str_9+0)
      008C8E 4B 81            [ 1]  507 	push	#((___str_9+0) >> 8)
      008C90 CD AC 4E         [ 4]  508 	call	_strcmp
      008C93 5D               [ 2]  509 	tnzw	x
      008C94 27 03            [ 1]  510 	jreq	00455$
      008C96 CC 8D B7         [ 2]  511 	jp	00176$
      008C99                        512 00455$:
                                    513 ;	stm8s_gpio_main.c: 230: char vbPort = *(char *)(argv[2]); // argv[2][0]
      008C99 1E 08            [ 2]  514 	ldw	x, (0x08, sp)
      008C9B FE               [ 2]  515 	ldw	x, (x)
      008C9C F6               [ 1]  516 	ld	a, (x)
      008C9D 6B 04            [ 1]  517 	ld	(0x04, sp), a
                                    518 ;	stm8s_gpio_main.c: 231: char vbNum = *(char *)(argv[3]);
      008C9F 1E 0B            [ 2]  519 	ldw	x, (0x0b, sp)
      008CA1 FE               [ 2]  520 	ldw	x, (x)
      008CA2 F6               [ 1]  521 	ld	a, (x)
      008CA3 6B 05            [ 1]  522 	ld	(0x05, sp), a
                                    523 ;	stm8s_gpio_main.c: 232: char vbBit = *(char *)(argv[4]);
      008CA5 1E 13            [ 2]  524 	ldw	x, (0x13, sp)
      008CA7 EE 08            [ 2]  525 	ldw	x, (0x8, x)
      008CA9 F6               [ 1]  526 	ld	a, (x)
      008CAA 6B 06            [ 1]  527 	ld	(0x06, sp), a
                                    528 ;	stm8s_gpio_main.c: 233: GPIO_TypeDef* GPIOx=GPIOA;
      008CAC AE 50 00         [ 2]  529 	ldw	x, #0x5000
      008CAF 1F 07            [ 2]  530 	ldw	(0x07, sp), x
                                    531 ;	stm8s_gpio_main.c: 234: if (argc < 5)
      008CB1 1E 11            [ 2]  532 	ldw	x, (0x11, sp)
      008CB3 A3 00 05         [ 2]  533 	cpw	x, #0x0005
      008CB6 2E 0A            [ 1]  534 	jrsge	00131$
                                    535 ;	stm8s_gpio_main.c: 236: MibWriteDebugString(cptr->usage);
      008CB8 1E 0D            [ 2]  536 	ldw	x, (0x0d, sp)
      008CBA FE               [ 2]  537 	ldw	x, (x)
      008CBB CD 8F AE         [ 4]  538 	call	_MibWriteDebugString
                                    539 ;	stm8s_gpio_main.c: 237: return FALSE;
      008CBE 5F               [ 1]  540 	clrw	x
      008CBF CC 8E 90         [ 2]  541 	jp	00187$
      008CC2                        542 00131$:
                                    543 ;	stm8s_gpio_main.c: 239: ccprintf(_DEBUG_CMD_A_,("gpio in : port[%c] num[%c] bit[%c]\r\n", vbPort,vbNum,vbBit));
      008CC2 7B 06            [ 1]  544 	ld	a, (0x06, sp)
      008CC4 6B 0A            [ 1]  545 	ld	(0x0a, sp), a
      008CC6 0F 09            [ 1]  546 	clr	(0x09, sp)
      008CC8 7B 05            [ 1]  547 	ld	a, (0x05, sp)
      008CCA 6B 0C            [ 1]  548 	ld	(0x0c, sp), a
      008CCC 0F 0B            [ 1]  549 	clr	(0x0b, sp)
      008CCE 7B 04            [ 1]  550 	ld	a, (0x04, sp)
      008CD0 6B 0E            [ 1]  551 	ld	(0x0e, sp), a
      008CD2 0F 0D            [ 1]  552 	clr	(0x0d, sp)
      008CD4 1E 09            [ 2]  553 	ldw	x, (0x09, sp)
      008CD6 89               [ 2]  554 	pushw	x
      008CD7 1E 0D            [ 2]  555 	ldw	x, (0x0d, sp)
      008CD9 89               [ 2]  556 	pushw	x
      008CDA 1E 11            [ 2]  557 	ldw	x, (0x11, sp)
      008CDC 89               [ 2]  558 	pushw	x
      008CDD 4B 43            [ 1]  559 	push	#<(__str_10+0)
      008CDF 4B 81            [ 1]  560 	push	#((__str_10+0) >> 8)
      008CE1 CD 99 C0         [ 4]  561 	call	_mib_printf
      008CE4 5B 08            [ 2]  562 	addw	sp, #8
                                    563 ;	stm8s_gpio_main.c: 240: if((vbPort>='a')&&(vbPort<='g'))
      008CE6 7B 04            [ 1]  564 	ld	a, (0x04, sp)
      008CE8 A1 61            [ 1]  565 	cp	a, #0x61
      008CEA 24 03            [ 1]  566 	jrnc	00457$
      008CEC CC 8E 8E         [ 2]  567 	jp	00186$
      008CEF                        568 00457$:
      008CEF 7B 04            [ 1]  569 	ld	a, (0x04, sp)
      008CF1 A1 67            [ 1]  570 	cp	a, #0x67
      008CF3 23 03            [ 2]  571 	jrule	00458$
      008CF5 CC 8E 8E         [ 2]  572 	jp	00186$
      008CF8                        573 00458$:
                                    574 ;	stm8s_gpio_main.c: 242: switch(vbPort)
      008CF8 7B 04            [ 1]  575 	ld	a, (0x04, sp)
      008CFA A1 61            [ 1]  576 	cp	a, #0x61
      008CFC 27 26            [ 1]  577 	jreq	00132$
      008CFE 7B 04            [ 1]  578 	ld	a, (0x04, sp)
      008D00 A1 62            [ 1]  579 	cp	a, #0x62
      008D02 27 27            [ 1]  580 	jreq	00133$
      008D04 7B 04            [ 1]  581 	ld	a, (0x04, sp)
      008D06 A1 63            [ 1]  582 	cp	a, #0x63
      008D08 27 28            [ 1]  583 	jreq	00134$
      008D0A 7B 04            [ 1]  584 	ld	a, (0x04, sp)
      008D0C A1 64            [ 1]  585 	cp	a, #0x64
      008D0E 27 29            [ 1]  586 	jreq	00135$
      008D10 7B 04            [ 1]  587 	ld	a, (0x04, sp)
      008D12 A1 65            [ 1]  588 	cp	a, #0x65
      008D14 27 2A            [ 1]  589 	jreq	00136$
      008D16 7B 04            [ 1]  590 	ld	a, (0x04, sp)
      008D18 A1 66            [ 1]  591 	cp	a, #0x66
      008D1A 27 2B            [ 1]  592 	jreq	00137$
      008D1C 7B 04            [ 1]  593 	ld	a, (0x04, sp)
      008D1E A1 67            [ 1]  594 	cp	a, #0x67
      008D20 27 2C            [ 1]  595 	jreq	00138$
      008D22 20 2F            [ 2]  596 	jra	00140$
                                    597 ;	stm8s_gpio_main.c: 244: case 'a': GPIOx = GPIOA; break;
      008D24                        598 00132$:
      008D24 AE 50 00         [ 2]  599 	ldw	x, #0x5000
      008D27 1F 07            [ 2]  600 	ldw	(0x07, sp), x
      008D29 20 28            [ 2]  601 	jra	00140$
                                    602 ;	stm8s_gpio_main.c: 245: case 'b': GPIOx = GPIOB; break;
      008D2B                        603 00133$:
      008D2B AE 50 05         [ 2]  604 	ldw	x, #0x5005
      008D2E 1F 07            [ 2]  605 	ldw	(0x07, sp), x
      008D30 20 21            [ 2]  606 	jra	00140$
                                    607 ;	stm8s_gpio_main.c: 246: case 'c': GPIOx = GPIOC; break;
      008D32                        608 00134$:
      008D32 AE 50 0A         [ 2]  609 	ldw	x, #0x500a
      008D35 1F 07            [ 2]  610 	ldw	(0x07, sp), x
      008D37 20 1A            [ 2]  611 	jra	00140$
                                    612 ;	stm8s_gpio_main.c: 247: case 'd': GPIOx = GPIOD; break;
      008D39                        613 00135$:
      008D39 AE 50 0F         [ 2]  614 	ldw	x, #0x500f
      008D3C 1F 07            [ 2]  615 	ldw	(0x07, sp), x
      008D3E 20 13            [ 2]  616 	jra	00140$
                                    617 ;	stm8s_gpio_main.c: 248: case 'e': GPIOx = GPIOE; break;
      008D40                        618 00136$:
      008D40 AE 50 14         [ 2]  619 	ldw	x, #0x5014
      008D43 1F 07            [ 2]  620 	ldw	(0x07, sp), x
      008D45 20 0C            [ 2]  621 	jra	00140$
                                    622 ;	stm8s_gpio_main.c: 249: case 'f': GPIOx = GPIOF; break;
      008D47                        623 00137$:
      008D47 AE 50 19         [ 2]  624 	ldw	x, #0x5019
      008D4A 1F 07            [ 2]  625 	ldw	(0x07, sp), x
      008D4C 20 05            [ 2]  626 	jra	00140$
                                    627 ;	stm8s_gpio_main.c: 250: case 'g': GPIOx = GPIOG; break;
      008D4E                        628 00138$:
      008D4E AE 50 1E         [ 2]  629 	ldw	x, #0x501e
      008D51 1F 07            [ 2]  630 	ldw	(0x07, sp), x
                                    631 ;	stm8s_gpio_main.c: 254: }
      008D53                        632 00140$:
                                    633 ;	stm8s_gpio_main.c: 255: if((vbNum>='0')&&(vbNum<='7'))
      008D53 7B 05            [ 1]  634 	ld	a, (0x05, sp)
      008D55 A1 30            [ 1]  635 	cp	a, #0x30
      008D57 24 03            [ 1]  636 	jrnc	00480$
      008D59 CC 8E 8E         [ 2]  637 	jp	00186$
      008D5C                        638 00480$:
      008D5C 7B 05            [ 1]  639 	ld	a, (0x05, sp)
      008D5E A1 37            [ 1]  640 	cp	a, #0x37
      008D60 23 03            [ 2]  641 	jrule	00481$
      008D62 CC 8E 8E         [ 2]  642 	jp	00186$
      008D65                        643 00481$:
                                    644 ;	stm8s_gpio_main.c: 257: vbNum &= 0x07;
      008D65 7B 05            [ 1]  645 	ld	a, (0x05, sp)
      008D67 A4 07            [ 1]  646 	and	a, #0x07
      008D69 97               [ 1]  647 	ld	xl, a
                                    648 ;	stm8s_gpio_main.c: 258: if((vbBit>='0')&&(vbBit<='1'))
      008D6A 7B 06            [ 1]  649 	ld	a, (0x06, sp)
      008D6C A1 30            [ 1]  650 	cp	a, #0x30
      008D6E 24 03            [ 1]  651 	jrnc	00482$
      008D70 CC 8E 8E         [ 2]  652 	jp	00186$
      008D73                        653 00482$:
      008D73 7B 06            [ 1]  654 	ld	a, (0x06, sp)
      008D75 A1 31            [ 1]  655 	cp	a, #0x31
      008D77 23 03            [ 2]  656 	jrule	00483$
      008D79 CC 8E 8E         [ 2]  657 	jp	00186$
      008D7C                        658 00483$:
                                    659 ;	stm8s_gpio_main.c: 260: vbBit &= 0x01;
      008D7C 7B 06            [ 1]  660 	ld	a, (0x06, sp)
      008D7E A4 01            [ 1]  661 	and	a, #0x01
      008D80 6B 0E            [ 1]  662 	ld	(0x0e, sp), a
                                    663 ;	stm8s_gpio_main.c: 261: vbNum = 1 << vbNum;
      008D82 A6 01            [ 1]  664 	ld	a, #0x01
      008D84 6B 0C            [ 1]  665 	ld	(0x0c, sp), a
      008D86 9F               [ 1]  666 	ld	a, xl
      008D87 4D               [ 1]  667 	tnz	a
      008D88 27 05            [ 1]  668 	jreq	00485$
      008D8A                        669 00484$:
      008D8A 08 0C            [ 1]  670 	sll	(0x0c, sp)
      008D8C 4A               [ 1]  671 	dec	a
      008D8D 26 FB            [ 1]  672 	jrne	00484$
      008D8F                        673 00485$:
                                    674 ;	stm8s_gpio_main.c: 262: GPIO_Init(GPIOx,vbNum,GPIO_MODE_OUT_PP_LOW_FAST);
      008D8F 4B E0            [ 1]  675 	push	#0xe0
      008D91 7B 0D            [ 1]  676 	ld	a, (0x0d, sp)
      008D93 1E 08            [ 2]  677 	ldw	x, (0x08, sp)
      008D95 CD 8E CD         [ 4]  678 	call	_GPIO_Init
                                    679 ;	stm8s_gpio_main.c: 265: GPIOx->ODR |= vbNum;
      008D98 1E 07            [ 2]  680 	ldw	x, (0x07, sp)
      008D9A F6               [ 1]  681 	ld	a, (x)
      008D9B 6B 0D            [ 1]  682 	ld	(0x0d, sp), a
                                    683 ;	stm8s_gpio_main.c: 263: if(vbBit==1)
      008D9D 7B 0E            [ 1]  684 	ld	a, (0x0e, sp)
      008D9F 4A               [ 1]  685 	dec	a
      008DA0 26 0A            [ 1]  686 	jrne	00142$
                                    687 ;	stm8s_gpio_main.c: 265: GPIOx->ODR |= vbNum;
      008DA2 7B 0D            [ 1]  688 	ld	a, (0x0d, sp)
      008DA4 1A 0C            [ 1]  689 	or	a, (0x0c, sp)
      008DA6 1E 07            [ 2]  690 	ldw	x, (0x07, sp)
      008DA8 F7               [ 1]  691 	ld	(x), a
      008DA9 CC 8E 8E         [ 2]  692 	jp	00186$
      008DAC                        693 00142$:
                                    694 ;	stm8s_gpio_main.c: 269: GPIOx->ODR &= ~vbNum;
      008DAC 7B 0C            [ 1]  695 	ld	a, (0x0c, sp)
      008DAE 43               [ 1]  696 	cpl	a
      008DAF 14 0D            [ 1]  697 	and	a, (0x0d, sp)
      008DB1 1E 07            [ 2]  698 	ldw	x, (0x07, sp)
      008DB3 F7               [ 1]  699 	ld	(x), a
      008DB4 CC 8E 8E         [ 2]  700 	jp	00186$
      008DB7                        701 00176$:
                                    702 ;	stm8s_gpio_main.c: 278: else if (!strcmp(argv[1], "led")) // _CMD_MY_READ_
      008DB7 1E 05            [ 2]  703 	ldw	x, (0x05, sp)
      008DB9 FE               [ 2]  704 	ldw	x, (x)
      008DBA 4B 68            [ 1]  705 	push	#<(___str_11+0)
      008DBC 4B 81            [ 1]  706 	push	#((___str_11+0) >> 8)
      008DBE CD AC 4E         [ 4]  707 	call	_strcmp
      008DC1 5D               [ 2]  708 	tnzw	x
      008DC2 26 52            [ 1]  709 	jrne	00173$
                                    710 ;	stm8s_gpio_main.c: 280: if (argc < 3)
      008DC4 0D 0A            [ 1]  711 	tnz	(0x0a, sp)
      008DC6 27 0A            [ 1]  712 	jreq	00154$
                                    713 ;	stm8s_gpio_main.c: 282: MibWriteDebugString(cptr->usage);
      008DC8 1E 0D            [ 2]  714 	ldw	x, (0x0d, sp)
      008DCA FE               [ 2]  715 	ldw	x, (x)
      008DCB CD 8F AE         [ 4]  716 	call	_MibWriteDebugString
                                    717 ;	stm8s_gpio_main.c: 283: return FALSE;
      008DCE 5F               [ 1]  718 	clrw	x
      008DCF CC 8E 90         [ 2]  719 	jp	00187$
      008DD2                        720 00154$:
                                    721 ;	stm8s_gpio_main.c: 285: if (!HexToInt(argv[2], &vbData, 8))
      008DD2 96               [ 1]  722 	ldw	x, sp
      008DD3 1C 00 03         [ 2]  723 	addw	x, #3
      008DD6 16 08            [ 2]  724 	ldw	y, (0x08, sp)
      008DD8 90 FE            [ 2]  725 	ldw	y, (y)
      008DDA 4B 08            [ 1]  726 	push	#0x08
      008DDC 4B 00            [ 1]  727 	push	#0x00
      008DDE 89               [ 2]  728 	pushw	x
      008DDF 93               [ 1]  729 	ldw	x, y
      008DE0 CD 9C C1         [ 4]  730 	call	_HexToInt
      008DE3 5D               [ 2]  731 	tnzw	x
      008DE4 26 0D            [ 1]  732 	jrne	00156$
                                    733 ;	stm8s_gpio_main.c: 287: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008DE6 4B BD            [ 1]  734 	push	#<(__str_3+0)
      008DE8 4B 80            [ 1]  735 	push	#((__str_3+0) >> 8)
      008DEA CD 99 C0         [ 4]  736 	call	_mib_printf
      008DED 5B 02            [ 2]  737 	addw	sp, #2
                                    738 ;	stm8s_gpio_main.c: 288: return FALSE;
      008DEF 5F               [ 1]  739 	clrw	x
      008DF0 CC 8E 90         [ 2]  740 	jp	00187$
      008DF3                        741 00156$:
                                    742 ;	stm8s_gpio_main.c: 292: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
      008DF3 C6 50 0F         [ 1]  743 	ld	a, 0x500f
                                    744 ;	stm8s_gpio_main.c: 290: if(vbData)
      008DF6 0D 03            [ 1]  745 	tnz	(0x03, sp)
      008DF8 27 07            [ 1]  746 	jreq	00158$
                                    747 ;	stm8s_gpio_main.c: 292: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
      008DFA A4 FE            [ 1]  748 	and	a, #0xfe
      008DFC C7 50 0F         [ 1]  749 	ld	0x500f, a
      008DFF 20 05            [ 2]  750 	jra	00159$
      008E01                        751 00158$:
                                    752 ;	stm8s_gpio_main.c: 296: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR | UCOM_LED1_PIN;
      008E01 AA 01            [ 1]  753 	or	a, #0x01
      008E03 C7 50 0F         [ 1]  754 	ld	0x500f, a
      008E06                        755 00159$:
                                    756 ;	stm8s_gpio_main.c: 298: ccprintf(_DEBUG_CMD_A_, ("gpio led [%d]\r\n",(vbData)));		
      008E06 5F               [ 1]  757 	clrw	x
      008E07 7B 03            [ 1]  758 	ld	a, (0x03, sp)
      008E09 97               [ 1]  759 	ld	xl, a
      008E0A 89               [ 2]  760 	pushw	x
      008E0B 4B 6C            [ 1]  761 	push	#<(__str_12+0)
      008E0D 4B 81            [ 1]  762 	push	#((__str_12+0) >> 8)
      008E0F CD 99 C0         [ 4]  763 	call	_mib_printf
      008E12 5B 04            [ 2]  764 	addw	sp, #4
      008E14 20 78            [ 2]  765 	jra	00186$
      008E16                        766 00173$:
                                    767 ;	stm8s_gpio_main.c: 303: else if (!strcmp(argv[1], "key")) // _CMD_MY_READ_
      008E16 1E 05            [ 2]  768 	ldw	x, (0x05, sp)
      008E18 FE               [ 2]  769 	ldw	x, (x)
      008E19 4B 7C            [ 1]  770 	push	#<(___str_13+0)
      008E1B 4B 81            [ 1]  771 	push	#((___str_13+0) >> 8)
      008E1D CD AC 4E         [ 4]  772 	call	_strcmp
      008E20 5D               [ 2]  773 	tnzw	x
      008E21 26 2A            [ 1]  774 	jrne	00170$
                                    775 ;	stm8s_gpio_main.c: 305: if((UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)==0)
      008E23 C6 50 06         [ 1]  776 	ld	a, 0x5006
      008E26 6B 0E            [ 1]  777 	ld	(0x0e, sp), a
      008E28 C6 50 06         [ 1]  778 	ld	a, 0x5006
                                    779 ;	stm8s_gpio_main.c: 307: ccprintf(_DEBUG_CMD_A_, ("gpio key on [%d]\r\n",(UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)));		
      008E2B A4 20            [ 1]  780 	and	a, #0x20
      008E2D 5F               [ 1]  781 	clrw	x
      008E2E 97               [ 1]  782 	ld	xl, a
                                    783 ;	stm8s_gpio_main.c: 305: if((UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)==0)
      008E2F 7B 0E            [ 1]  784 	ld	a, (0x0e, sp)
      008E31 A5 20            [ 1]  785 	bcp	a, #0x20
      008E33 26 0C            [ 1]  786 	jrne	00161$
                                    787 ;	stm8s_gpio_main.c: 307: ccprintf(_DEBUG_CMD_A_, ("gpio key on [%d]\r\n",(UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)));		
      008E35 89               [ 2]  788 	pushw	x
      008E36 4B 80            [ 1]  789 	push	#<(__str_14+0)
      008E38 4B 81            [ 1]  790 	push	#((__str_14+0) >> 8)
      008E3A CD 99 C0         [ 4]  791 	call	_mib_printf
      008E3D 5B 04            [ 2]  792 	addw	sp, #4
      008E3F 20 4D            [ 2]  793 	jra	00186$
      008E41                        794 00161$:
                                    795 ;	stm8s_gpio_main.c: 311: ccprintf(_DEBUG_CMD_A_, ("gpio key off [%d]\r\n",(UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)));		
      008E41 89               [ 2]  796 	pushw	x
      008E42 4B 93            [ 1]  797 	push	#<(__str_15+0)
      008E44 4B 81            [ 1]  798 	push	#((__str_15+0) >> 8)
      008E46 CD 99 C0         [ 4]  799 	call	_mib_printf
      008E49 5B 04            [ 2]  800 	addw	sp, #4
      008E4B 20 41            [ 2]  801 	jra	00186$
      008E4D                        802 00170$:
                                    803 ;	stm8s_gpio_main.c: 317: else if (!strcmp(argv[1], "init")) // _CMD_MY_READ_
      008E4D 1E 05            [ 2]  804 	ldw	x, (0x05, sp)
      008E4F FE               [ 2]  805 	ldw	x, (x)
      008E50 4B A7            [ 1]  806 	push	#<(___str_16+0)
      008E52 4B 81            [ 1]  807 	push	#((___str_16+0) >> 8)
      008E54 CD AC 4E         [ 4]  808 	call	_strcmp
      008E57 5D               [ 2]  809 	tnzw	x
      008E58 26 0E            [ 1]  810 	jrne	00167$
                                    811 ;	stm8s_gpio_main.c: 319: ccprintf(_DEBUG_CMD_A_, ("gpio init....GPIO_Configuration()\r\n"));		
      008E5A 4B AC            [ 1]  812 	push	#<(__str_17+0)
      008E5C 4B 81            [ 1]  813 	push	#((__str_17+0) >> 8)
      008E5E CD 99 C0         [ 4]  814 	call	_mib_printf
      008E61 5B 02            [ 2]  815 	addw	sp, #2
                                    816 ;	stm8s_gpio_main.c: 321: GPIO_Configuration();
      008E63 CD 8E 96         [ 4]  817 	call	_GPIO_Configuration
      008E66 20 26            [ 2]  818 	jra	00186$
      008E68                        819 00167$:
                                    820 ;	stm8s_gpio_main.c: 327: else if (!strcmp(argv[1], "help")) // _CMD_MY_READ_
      008E68 1E 05            [ 2]  821 	ldw	x, (0x05, sp)
      008E6A FE               [ 2]  822 	ldw	x, (x)
      008E6B 4B D0            [ 1]  823 	push	#<(___str_18+0)
      008E6D 4B 81            [ 1]  824 	push	#((___str_18+0) >> 8)
      008E6F CD AC 4E         [ 4]  825 	call	_strcmp
      008E72 5D               [ 2]  826 	tnzw	x
      008E73 26 11            [ 1]  827 	jrne	00164$
                                    828 ;	stm8s_gpio_main.c: 329: ccprintf(_DEBUG_CMD_A_, ("gpio help....argc[%x:%d]\r\n",argc,argc));		
      008E75 1E 11            [ 2]  829 	ldw	x, (0x11, sp)
      008E77 89               [ 2]  830 	pushw	x
      008E78 1E 13            [ 2]  831 	ldw	x, (0x13, sp)
      008E7A 89               [ 2]  832 	pushw	x
      008E7B 4B D5            [ 1]  833 	push	#<(__str_19+0)
      008E7D 4B 81            [ 1]  834 	push	#((__str_19+0) >> 8)
      008E7F CD 99 C0         [ 4]  835 	call	_mib_printf
      008E82 5B 06            [ 2]  836 	addw	sp, #6
      008E84 20 08            [ 2]  837 	jra	00186$
      008E86                        838 00164$:
                                    839 ;	stm8s_gpio_main.c: 333: MibWriteDebugString(cptr->usage);
      008E86 1E 0D            [ 2]  840 	ldw	x, (0x0d, sp)
      008E88 FE               [ 2]  841 	ldw	x, (x)
      008E89 CD 8F AE         [ 4]  842 	call	_MibWriteDebugString
                                    843 ;	stm8s_gpio_main.c: 334: return FALSE;
      008E8C 5F               [ 1]  844 	clrw	x
                                    845 ;	stm8s_gpio_main.c: 336: return TRUE;
      008E8D C5                     846 	.byte 0xc5
      008E8E                        847 00186$:
      008E8E 5F               [ 1]  848 	clrw	x
      008E8F 5C               [ 1]  849 	incw	x
      008E90                        850 00187$:
                                    851 ;	stm8s_gpio_main.c: 337: }
      008E90 16 0F            [ 2]  852 	ldw	y, (15, sp)
      008E92 5B 14            [ 2]  853 	addw	sp, #20
      008E94 90 FC            [ 2]  854 	jp	(y)
                                    855 ;	stm8s_gpio_main.c: 385: void GPIO_Configuration(void)
                                    856 ;	-----------------------------------------
                                    857 ;	 function GPIO_Configuration
                                    858 ;	-----------------------------------------
      008E96                        859 _GPIO_Configuration:
                                    860 ;	stm8s_gpio_main.c: 388: GPIO_DeInit(UCOM_LED1_GPIO);
      008E96 AE 50 0F         [ 2]  861 	ldw	x, #0x500f
      008E99 CD 8E BF         [ 4]  862 	call	_GPIO_DeInit
                                    863 ;	stm8s_gpio_main.c: 390: GPIO_Init(UCOM_LED1_GPIO, UCOM_LED1_PIN, UCOM_LED1_MODE);  
      008E9C 4B E0            [ 1]  864 	push	#0xe0
      008E9E A6 01            [ 1]  865 	ld	a, #0x01
      008EA0 AE 50 0F         [ 2]  866 	ldw	x, #0x500f
      008EA3 CD 8E CD         [ 4]  867 	call	_GPIO_Init
                                    868 ;	stm8s_gpio_main.c: 391: GPIO_DeInit(UCOM_KEY1_GPIO);
      008EA6 AE 50 05         [ 2]  869 	ldw	x, #0x5005
      008EA9 CD 8E BF         [ 4]  870 	call	_GPIO_DeInit
                                    871 ;	stm8s_gpio_main.c: 393: GPIO_Init(UCOM_KEY1_GPIO, UCOM_KEY1_PIN, UCOM_KEY1_MODE);
      008EAC 4B 40            [ 1]  872 	push	#0x40
      008EAE A6 20            [ 1]  873 	ld	a, #0x20
      008EB0 AE 50 05         [ 2]  874 	ldw	x, #0x5005
      008EB3 CD 8E CD         [ 4]  875 	call	_GPIO_Init
                                    876 ;	stm8s_gpio_main.c: 394: }
      008EB6 81               [ 4]  877 	ret
                                    878 ;	stm8s_gpio_main.c: 408: void Toggle(void)
                                    879 ;	-----------------------------------------
                                    880 ;	 function Toggle
                                    881 ;	-----------------------------------------
      008EB7                        882 _Toggle:
                                    883 ;	stm8s_gpio_main.c: 410: GPIO_WriteReverse(UCOM_LED1_GPIO, UCOM_LED1_PIN);
      008EB7 A6 01            [ 1]  884 	ld	a, #0x01
      008EB9 AE 50 0F         [ 2]  885 	ldw	x, #0x500f
                                    886 ;	stm8s_gpio_main.c: 411: }
      008EBC CC 8F 5C         [ 2]  887 	jp	_GPIO_WriteReverse
                                    888 	.area CODE
                                    889 	.area CONST
                                    890 	.area CONST
      00808F                        891 __str_0:
      00808F 49 4E 46 4F 3A 2B 63   892 	.ascii "INFO:+cmd_gpio..."
             6D 64 5F 67 70 69 6F
             2E 2E 2E
      0080A0 0D                     893 	.db 0x0d
      0080A1 0A                     894 	.db 0x0a
      0080A2 00                     895 	.db 0x00
                                    896 	.area CODE
                                    897 	.area CONST
      0080A3                        898 __str_1:
      0080A3 49 4E 46 4F 3A 2D 63   899 	.ascii "INFO:-cmd_gpio..."
             6D 64 5F 67 70 69 6F
             2E 2E 2E
      0080B4 0D                     900 	.db 0x0d
      0080B5 0A                     901 	.db 0x0a
      0080B6 00                     902 	.db 0x00
                                    903 	.area CODE
                                    904 	.area CONST
      0080B7                        905 ___str_2:
      0080B7 77 72 69 74 65         906 	.ascii "write"
      0080BC 00                     907 	.db 0x00
                                    908 	.area CODE
                                    909 	.area CONST
      0080BD                        910 __str_3:
      0080BD 49 6C 6C 75 67 61 6C   911 	.ascii "Illugal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      0080D7 0D                     912 	.db 0x0d
      0080D8 0A                     913 	.db 0x0a
      0080D9 00                     914 	.db 0x00
                                    915 	.area CODE
                                    916 	.area CONST
      0080DA                        917 __str_4:
      0080DA 77 72 5F 41 44 44 52   918 	.ascii "wr_ADDR8 : 0x%04x[0x%02x]"
             38 20 3A 20 30 78 25
             30 34 78 5B 30 78 25
             30 32 78 5D
      0080F3 0D                     919 	.db 0x0d
      0080F4 0A                     920 	.db 0x0a
      0080F5 00                     921 	.db 0x00
                                    922 	.area CODE
                                    923 	.area CONST
      0080F6                        924 ___str_5:
      0080F6 72 65 61 64            925 	.ascii "read"
      0080FA 00                     926 	.db 0x00
                                    927 	.area CODE
                                    928 	.area CONST
      0080FB                        929 __str_6:
      0080FB 72 64 5F 41 44 44 52   930 	.ascii "rd_ADDR8 : 0x%04x[0x%02x]"
             38 20 3A 20 30 78 25
             30 34 78 5B 30 78 25
             30 32 78 5D
      008114 0D                     931 	.db 0x0d
      008115 0A                     932 	.db 0x0a
      008116 00                     933 	.db 0x00
                                    934 	.area CODE
                                    935 	.area CONST
      008117                        936 ___str_7:
      008117 69 6E                  937 	.ascii "in"
      008119 00                     938 	.db 0x00
                                    939 	.area CODE
                                    940 	.area CONST
      00811A                        941 __str_8:
      00811A 67 70 69 6F 20 69 6E   942 	.ascii "gpio in : port[%c] num[%d] bit[%d]"
             20 3A 20 70 6F 72 74
             5B 25 63 5D 20 6E 75
             6D 5B 25 64 5D 20 62
             69 74 5B 25 64 5D
      00813C 0D                     943 	.db 0x0d
      00813D 0A                     944 	.db 0x0a
      00813E 00                     945 	.db 0x00
                                    946 	.area CODE
                                    947 	.area CONST
      00813F                        948 ___str_9:
      00813F 6F 75 74               949 	.ascii "out"
      008142 00                     950 	.db 0x00
                                    951 	.area CODE
                                    952 	.area CONST
      008143                        953 __str_10:
      008143 67 70 69 6F 20 69 6E   954 	.ascii "gpio in : port[%c] num[%c] bit[%c]"
             20 3A 20 70 6F 72 74
             5B 25 63 5D 20 6E 75
             6D 5B 25 63 5D 20 62
             69 74 5B 25 63 5D
      008165 0D                     955 	.db 0x0d
      008166 0A                     956 	.db 0x0a
      008167 00                     957 	.db 0x00
                                    958 	.area CODE
                                    959 	.area CONST
      008168                        960 ___str_11:
      008168 6C 65 64               961 	.ascii "led"
      00816B 00                     962 	.db 0x00
                                    963 	.area CODE
                                    964 	.area CONST
      00816C                        965 __str_12:
      00816C 67 70 69 6F 20 6C 65   966 	.ascii "gpio led [%d]"
             64 20 5B 25 64 5D
      008179 0D                     967 	.db 0x0d
      00817A 0A                     968 	.db 0x0a
      00817B 00                     969 	.db 0x00
                                    970 	.area CODE
                                    971 	.area CONST
      00817C                        972 ___str_13:
      00817C 6B 65 79               973 	.ascii "key"
      00817F 00                     974 	.db 0x00
                                    975 	.area CODE
                                    976 	.area CONST
      008180                        977 __str_14:
      008180 67 70 69 6F 20 6B 65   978 	.ascii "gpio key on [%d]"
             79 20 6F 6E 20 5B 25
             64 5D
      008190 0D                     979 	.db 0x0d
      008191 0A                     980 	.db 0x0a
      008192 00                     981 	.db 0x00
                                    982 	.area CODE
                                    983 	.area CONST
      008193                        984 __str_15:
      008193 67 70 69 6F 20 6B 65   985 	.ascii "gpio key off [%d]"
             79 20 6F 66 66 20 5B
             25 64 5D
      0081A4 0D                     986 	.db 0x0d
      0081A5 0A                     987 	.db 0x0a
      0081A6 00                     988 	.db 0x00
                                    989 	.area CODE
                                    990 	.area CONST
      0081A7                        991 ___str_16:
      0081A7 69 6E 69 74            992 	.ascii "init"
      0081AB 00                     993 	.db 0x00
                                    994 	.area CODE
                                    995 	.area CONST
      0081AC                        996 __str_17:
      0081AC 67 70 69 6F 20 69 6E   997 	.ascii "gpio init....GPIO_Configuration()"
             69 74 2E 2E 2E 2E 47
             50 49 4F 5F 43 6F 6E
             66 69 67 75 72 61 74
             69 6F 6E 28 29
      0081CD 0D                     998 	.db 0x0d
      0081CE 0A                     999 	.db 0x0a
      0081CF 00                    1000 	.db 0x00
                                   1001 	.area CODE
                                   1002 	.area CONST
      0081D0                       1003 ___str_18:
      0081D0 68 65 6C 70           1004 	.ascii "help"
      0081D4 00                    1005 	.db 0x00
                                   1006 	.area CODE
                                   1007 	.area CONST
      0081D5                       1008 __str_19:
      0081D5 67 70 69 6F 20 68 65  1009 	.ascii "gpio help....argc[%x:%d]"
             6C 70 2E 2E 2E 2E 61
             72 67 63 5B 25 78 3A
             25 64 5D
      0081ED 0D                    1010 	.db 0x0d
      0081EE 0A                    1011 	.db 0x0a
      0081EF 00                    1012 	.db 0x00
                                   1013 	.area CODE
                                   1014 	.area CONST
      0081F0                       1015 ___str_20:
      0081F0 67 70 69 6F           1016 	.ascii "gpio"
      0081F4 00                    1017 	.db 0x00
                                   1018 	.area CODE
                                   1019 	.area CONST
      0081F5                       1020 ___str_21:
      0081F5 20 20 67 70 69 6F 20  1021 	.ascii "  gpio {init}  : gpio in/out reg init.."
             7B 69 6E 69 74 7D 20
             20 3A 20 67 70 69 6F
             20 69 6E 2F 6F 75 74
             20 72 65 67 20 69 6E
             69 74 2E 2E
      00821C 0D                    1022 	.db 0x0d
      00821D 0A                    1023 	.db 0x0a
      00821E 20 20 67 70 69 6F 20  1024 	.ascii "  gpio {write} [addr] [data] : (addr 16bit) write (data 8bit"
             7B 77 72 69 74 65 7D
             20 5B 61 64 64 72 5D
             20 5B 64 61 74 61 5D
             20 3A 20 28 61 64 64
             72 20 31 36 62 69 74
             29 20 77 72 69 74 65
             20 28 64 61 74 61 20
             38 62 69 74
      00825A 29                    1025 	.ascii ")"
      00825B 0D                    1026 	.db 0x0d
      00825C 0A                    1027 	.db 0x0a
      00825D 20 20 67 70 69 6F 20  1028 	.ascii "  gpio {read} [addr] : (addr 16bit) read (data 8bit)"
             7B 72 65 61 64 7D 20
             5B 61 64 64 72 5D 20
             3A 20 28 61 64 64 72
             20 31 36 62 69 74 29
             20 72 65 61 64 20 28
             64 61 74 61 20 38 62
             69 74 29
      008291 0D                    1029 	.db 0x0d
      008292 0A                    1030 	.db 0x0a
      008293 20 20 67 70 69 6F 20  1031 	.ascii "  gpio {led} [data:on/off(1/0)] : Write 0 or 1 to the PD0"
             7B 6C 65 64 7D 20 5B
             64 61 74 61 3A 6F 6E
             2F 6F 66 66 28 31 2F
             30 29 5D 20 3A 20 57
             72 69 74 65 20 30 20
             6F 72 20 31 20 74 6F
             20 74 68 65 20 50 44
             30
      0082CC 0D                    1032 	.db 0x0d
      0082CD 0A                    1033 	.db 0x0a
      0082CE 20 20 67 70 69 6F 20  1034 	.ascii "  gpio {key} : read to the PB5"
             7B 6B 65 79 7D 20 3A
             20 72 65 61 64 20 74
             6F 20 74 68 65 20 50
             42 35
      0082EC 0D                    1035 	.db 0x0d
      0082ED 0A                    1036 	.db 0x0a
      0082EE 20 20 67 70 69 6F 20  1037 	.ascii "  gpio {in}  {port : a..g} {bit : 0..7} : Read for each bit "
             7B 69 6E 7D 20 20 7B
             70 6F 72 74 20 3A 20
             61 2E 2E 67 7D 20 7B
             62 69 74 20 3A 20 30
             2E 2E 37 7D 20 3A 20
             52 65 61 64 20 66 6F
             72 20 65 61 63 68 20
             62 69 74 20
      00832A 30 20 74 6F 20 37 20  1038 	.ascii "0 to 7 from ports A GPIO to G GPIO. "
             66 72 6F 6D 20 70 6F
             72 74 73 20 41 20 47
             50 49 4F 20 74 6F 20
             47 20 47 50 49 4F 2E
             20
      00834E 0D                    1039 	.db 0x0d
      00834F 0A                    1040 	.db 0x0a
      008350 20 20 67 70 69 6F 20  1041 	.ascii "  gpio {out} {port : a..g} {bit : 0..7} {0/1} : It writes to"
             7B 6F 75 74 7D 20 7B
             70 6F 72 74 20 3A 20
             61 2E 2E 67 7D 20 7B
             62 69 74 20 3A 20 30
             2E 2E 37 7D 20 7B 30
             2F 31 7D 20 3A 20 49
             74 20 77 72 69 74 65
             73 20 74 6F
      00838C 20 65 61 63 68 20 62  1042 	.ascii " each bit 0 to 7 from ports a to g."
             69 74 20 30 20 74 6F
             20 37 20 66 72 6F 6D
             20 70 6F 72 74 73 20
             61 20 74 6F 20 67 2E
      0083AF 0D                    1043 	.db 0x0d
      0083B0 0A                    1044 	.db 0x0a
      0083B1 20 20 67 70 69 6F 20  1045 	.ascii "  gpio {help}  gpio help."
             7B 68 65 6C 70 7D 20
             20 67 70 69 6F 20 68
             65 6C 70 2E
      0083CA 0D                    1046 	.db 0x0d
      0083CB 0A                    1047 	.db 0x0a
      0083CC 00                    1048 	.db 0x00
                                   1049 	.area CODE
                                   1050 	.area INITIALIZER
      0089DC                       1051 __xinit__cmdTbl_only:
      0089DC 81 F0                 1052 	.dw ___str_20
      0089DE 8A 84                 1053 	.dw _DoGPIO
      0089E0 81 F5                 1054 	.dw ___str_21
      0089E2 00 00                 1055 	.dw #0x0000
      0089E4 00 00                 1056 	.dw #0x0000
      0089E6 00 00                 1057 	.dw #0x0000
                                   1058 	.area CABS (ABS)
