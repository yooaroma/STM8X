                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_tim1_main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _cmd_test_init_before_irq_enable
                                     12 	.globl _cmd_test
                                     13 	.globl _cmd_tim1
                                     14 	.globl _DecToLong
                                     15 	.globl _HexToInt
                                     16 	.globl _mib_printf
                                     17 	.globl _MibWriteDebugString
                                     18 	.globl ___memcpy
                                     19 	.globl _strcmp
                                     20 	.globl _TIM1_SetCompare4
                                     21 	.globl _TIM1_SetCompare3
                                     22 	.globl _TIM1_SetCompare2
                                     23 	.globl _TIM1_SetCompare1
                                     24 	.globl _TIM1_SelectOCxM
                                     25 	.globl _TIM1_CCxNCmd
                                     26 	.globl _TIM1_CCxCmd
                                     27 	.globl _TIM1_OC4PolarityConfig
                                     28 	.globl _TIM1_OC3NPolarityConfig
                                     29 	.globl _TIM1_OC3PolarityConfig
                                     30 	.globl _TIM1_OC2NPolarityConfig
                                     31 	.globl _TIM1_OC2PolarityConfig
                                     32 	.globl _TIM1_OC1NPolarityConfig
                                     33 	.globl _TIM1_OC1PolarityConfig
                                     34 	.globl _TIM1_OC4PreloadConfig
                                     35 	.globl _TIM1_OC3PreloadConfig
                                     36 	.globl _TIM1_OC2PreloadConfig
                                     37 	.globl _TIM1_OC1PreloadConfig
                                     38 	.globl _TIM1_ARRPreloadConfig
                                     39 	.globl _TIM1_SelectOnePulseMode
                                     40 	.globl _TIM1_CtrlPWMOutputs
                                     41 	.globl _TIM1_Cmd
                                     42 	.globl _TIM1_TimeBaseInit
                                     43 	.globl _TIM1_DeInit
                                     44 	.globl _FLASH_ProgramOptionByte
                                     45 	.globl _FLASH_ReadOptionByte
                                     46 	.globl _FLASH_ReadByte
                                     47 	.globl _FLASH_Unlock
                                     48 	.globl _irqTim1UpdOvf_CALLBACK
                                     49 	.globl _irqTim1Cap_CALLBACK
                                     50 	.globl _mmTim1Onepulse
                                     51 	.globl _mmTim1PWM
                                     52 	.globl _mmTim1CalPscrCntr
                                     53 	.globl _mmTim1GpioInit
                                     54 	.globl _mmRemapCH1N_CH2N_CH3N_ETR
                                     55 ;--------------------------------------------------------
                                     56 ; ram data
                                     57 ;--------------------------------------------------------
                                     58 	.area DATA
                                     59 ;--------------------------------------------------------
                                     60 ; ram data
                                     61 ;--------------------------------------------------------
                                     62 	.area INITIALIZED
      00014A                         63 _gpbHelp_TIM1_TypeDef:
      00014A                         64 	.ds 2
      00014C                         65 _cmdTbl_only:
      00014C                         66 	.ds 12
                                     67 ;--------------------------------------------------------
                                     68 ; absolute external ram data
                                     69 ;--------------------------------------------------------
                                     70 	.area DABS (ABS)
                                     71 
                                     72 ; default segment ordering for linker
                                     73 	.area HOME
                                     74 	.area GSINIT
                                     75 	.area GSFINAL
                                     76 	.area CONST
                                     77 	.area INITIALIZER
                                     78 	.area CODE
                                     79 
                                     80 ;--------------------------------------------------------
                                     81 ; global & static initialisations
                                     82 ;--------------------------------------------------------
                                     83 	.area HOME
                                     84 	.area GSINIT
                                     85 	.area GSFINAL
                                     86 	.area GSINIT
                                     87 ;--------------------------------------------------------
                                     88 ; Home
                                     89 ;--------------------------------------------------------
                                     90 	.area HOME
                                     91 	.area HOME
                                     92 ;--------------------------------------------------------
                                     93 ; code
                                     94 ;--------------------------------------------------------
                                     95 	.area CODE
                                     96 ;	stm8s_tim1_main.c: 115: void cmd_tim1(void)
                                     97 ;	-----------------------------------------
                                     98 ;	 function cmd_tim1
                                     99 ;	-----------------------------------------
      009249                        100 _cmd_tim1:
      009249 52 0A            [ 2]  101 	sub	sp, #10
                                    102 ;	stm8s_tim1_main.c: 121: for (cptr = cmdTbl;; cptr++)
      00924B AE 01 5E         [ 2]  103 	ldw	x, #(_cmdTbl+0)
      00924E 1F 01            [ 2]  104 	ldw	(0x01, sp), x
      009250 5F               [ 1]  105 	clrw	x
      009251 1F 07            [ 2]  106 	ldw	(0x07, sp), x
      009253 1F 05            [ 2]  107 	ldw	(0x05, sp), x
      009255 16 01            [ 2]  108 	ldw	y, (0x01, sp)
      009257 17 09            [ 2]  109 	ldw	(0x09, sp), y
      009259                        110 00106$:
                                    111 ;	stm8s_tim1_main.c: 123: if (cptr->cmd == 0)
      009259 1E 09            [ 2]  112 	ldw	x, (0x09, sp)
      00925B FE               [ 2]  113 	ldw	x, (x)
      00925C 1F 03            [ 2]  114 	ldw	(0x03, sp), x
      00925E 26 19            [ 1]  115 	jrne	00102$
                                    116 ;	stm8s_tim1_main.c: 125: ccprintf(1, ("INFO:+cmd_tim1...\r\n"));
      009260 4B 8F            [ 1]  117 	push	#<(__str_0+0)
      009262 4B 80            [ 1]  118 	push	#((__str_0+0) >> 8)
      009264 CD B0 3B         [ 4]  119 	call	_mib_printf
      009267 5B 02            [ 2]  120 	addw	sp, #2
                                    121 ;	stm8s_tim1_main.c: 126: memcpy((void *)&(cptr->cmd), (void *)&(cmdTbl_only[0].cmd), sizeof(CMD_MY));
      009269 AE 01 4C         [ 2]  122 	ldw	x, #_cmdTbl_only+0
      00926C 16 01            [ 2]  123 	ldw	y, (0x01, sp)
      00926E 4B 06            [ 1]  124 	push	#0x06
      009270 4B 00            [ 1]  125 	push	#0x00
      009272 89               [ 2]  126 	pushw	x
      009273 93               [ 1]  127 	ldw	x, y
      009274 CD C2 B0         [ 4]  128 	call	___memcpy
                                    129 ;	stm8s_tim1_main.c: 127: break;
      009277 20 2F            [ 2]  130 	jra	00105$
      009279                        131 00102$:
                                    132 ;	stm8s_tim1_main.c: 129: index++;
      009279 1E 07            [ 2]  133 	ldw	x, (0x07, sp)
      00927B 5C               [ 1]  134 	incw	x
      00927C 1F 07            [ 2]  135 	ldw	(0x07, sp), x
      00927E 26 05            [ 1]  136 	jrne	00126$
      009280 1E 05            [ 2]  137 	ldw	x, (0x05, sp)
      009282 5C               [ 1]  138 	incw	x
      009283 1F 05            [ 2]  139 	ldw	(0x05, sp), x
      009285                        140 00126$:
                                    141 ;	stm8s_tim1_main.c: 130: if (index > MAX_COMMANDS)
      009285 AE 00 06         [ 2]  142 	ldw	x, #0x0006
      009288 13 07            [ 2]  143 	cpw	x, (0x07, sp)
      00928A 4F               [ 1]  144 	clr	a
      00928B 12 06            [ 1]  145 	sbc	a, (0x06, sp)
      00928D 4F               [ 1]  146 	clr	a
      00928E 12 05            [ 1]  147 	sbc	a, (0x05, sp)
      009290 24 0B            [ 1]  148 	jrnc	00107$
                                    149 ;	stm8s_tim1_main.c: 132: ccprintf(1, ("INFO:-cmd_tim1...\r\n"));
      009292 4B A3            [ 1]  150 	push	#<(__str_1+0)
      009294 4B 80            [ 1]  151 	push	#((__str_1+0) >> 8)
      009296 CD B0 3B         [ 4]  152 	call	_mib_printf
      009299 5B 02            [ 2]  153 	addw	sp, #2
                                    154 ;	stm8s_tim1_main.c: 133: return;
      00929B 20 0B            [ 2]  155 	jra	00108$
      00929D                        156 00107$:
                                    157 ;	stm8s_tim1_main.c: 121: for (cptr = cmdTbl;; cptr++)
      00929D 1E 09            [ 2]  158 	ldw	x, (0x09, sp)
      00929F 1C 00 06         [ 2]  159 	addw	x, #0x0006
      0092A2 1F 09            [ 2]  160 	ldw	(0x09, sp), x
      0092A4 1F 01            [ 2]  161 	ldw	(0x01, sp), x
      0092A6 20 B1            [ 2]  162 	jra	00106$
      0092A8                        163 00105$:
                                    164 ;	stm8s_tim1_main.c: 136: return;
      0092A8                        165 00108$:
                                    166 ;	stm8s_tim1_main.c: 137: }
      0092A8 5B 0A            [ 2]  167 	addw	sp, #10
      0092AA 81               [ 4]  168 	ret
                                    169 ;	stm8s_tim1_main.c: 142: void cmd_test(void)
                                    170 ;	-----------------------------------------
                                    171 ;	 function cmd_test
                                    172 ;	-----------------------------------------
      0092AB                        173 _cmd_test:
                                    174 ;	stm8s_tim1_main.c: 144: cmd_tim1();
                                    175 ;	stm8s_tim1_main.c: 145: }
      0092AB CC 92 49         [ 2]  176 	jp	_cmd_tim1
                                    177 ;	stm8s_tim1_main.c: 151: void cmd_test_init_before_irq_enable(void)
                                    178 ;	-----------------------------------------
                                    179 ;	 function cmd_test_init_before_irq_enable
                                    180 ;	-----------------------------------------
      0092AE                        181 _cmd_test_init_before_irq_enable:
                                    182 ;	stm8s_tim1_main.c: 154: }
      0092AE 81               [ 4]  183 	ret
                                    184 ;	stm8s_tim1_main.c: 165: static int DoTIM1(CMD_MY *cptr, int argc, char **argv)
                                    185 ;	-----------------------------------------
                                    186 ;	 function DoTIM1
                                    187 ;	-----------------------------------------
      0092AF                        188 _DoTIM1:
      0092AF 52 1A            [ 2]  189 	sub	sp, #26
      0092B1 51               [ 1]  190 	exgw	x, y
                                    191 ;	stm8s_tim1_main.c: 167: uint32_t vdwAddr = 0;
      0092B2 5F               [ 1]  192 	clrw	x
      0092B3 1F 07            [ 2]  193 	ldw	(0x07, sp), x
      0092B5 1F 05            [ 2]  194 	ldw	(0x05, sp), x
                                    195 ;	stm8s_tim1_main.c: 168: uint8_t vbData = 0;
      0092B7 0F 09            [ 1]  196 	clr	(0x09, sp)
                                    197 ;	stm8s_tim1_main.c: 171: MibWriteDebugString(cptr->usage);
      0092B9 93               [ 1]  198 	ldw	x, y
      0092BA 1C 00 04         [ 2]  199 	addw	x, #0x0004
      0092BD 1F 0F            [ 2]  200 	ldw	(0x0f, sp), x
                                    201 ;	stm8s_tim1_main.c: 169: if (argc < 2)
      0092BF 1E 1D            [ 2]  202 	ldw	x, (0x1d, sp)
      0092C1 A3 00 02         [ 2]  203 	cpw	x, #0x0002
      0092C4 2E 0A            [ 1]  204 	jrsge	00102$
                                    205 ;	stm8s_tim1_main.c: 171: MibWriteDebugString(cptr->usage);
      0092C6 1E 0F            [ 2]  206 	ldw	x, (0x0f, sp)
      0092C8 FE               [ 2]  207 	ldw	x, (x)
      0092C9 CD A6 1F         [ 4]  208 	call	_MibWriteDebugString
                                    209 ;	stm8s_tim1_main.c: 172: return FALSE;
      0092CC 5F               [ 1]  210 	clrw	x
      0092CD CC 96 D5         [ 2]  211 	jp	00194$
      0092D0                        212 00102$:
                                    213 ;	stm8s_tim1_main.c: 177: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      0092D0 1E 1F            [ 2]  214 	ldw	x, (0x1f, sp)
      0092D2 5C               [ 1]  215 	incw	x
      0092D3 5C               [ 1]  216 	incw	x
      0092D4 1F 11            [ 2]  217 	ldw	(0x11, sp), x
      0092D6 FE               [ 2]  218 	ldw	x, (x)
      0092D7 4B B7            [ 1]  219 	push	#<(___str_2+0)
      0092D9 4B 80            [ 1]  220 	push	#((___str_2+0) >> 8)
      0092DB CD C3 34         [ 4]  221 	call	_strcmp
      0092DE 51               [ 1]  222 	exgw	x, y
                                    223 ;	stm8s_tim1_main.c: 179: if (argc < 4)
      0092DF 1E 1D            [ 2]  224 	ldw	x, (0x1d, sp)
      0092E1 A3 00 04         [ 2]  225 	cpw	x, #0x0004
      0092E4 2F 04            [ 1]  226 	jrslt	00377$
      0092E6 0F 13            [ 1]  227 	clr	(0x13, sp)
      0092E8 20 04            [ 2]  228 	jra	00378$
      0092EA                        229 00377$:
      0092EA A6 01            [ 1]  230 	ld	a, #0x01
      0092EC 6B 13            [ 1]  231 	ld	(0x13, sp), a
      0092EE                        232 00378$:
                                    233 ;	stm8s_tim1_main.c: 184: if (!HexToInt(argv[2], &vdwAddr, 32))
      0092EE 1E 1F            [ 2]  234 	ldw	x, (0x1f, sp)
      0092F0 1C 00 04         [ 2]  235 	addw	x, #0x0004
      0092F3 1F 14            [ 2]  236 	ldw	(0x14, sp), x
                                    237 ;	stm8s_tim1_main.c: 189: if (!HexToInt(argv[3], &vbData, 8))
      0092F5 1E 1F            [ 2]  238 	ldw	x, (0x1f, sp)
      0092F7 1C 00 06         [ 2]  239 	addw	x, #0x0006
      0092FA 1F 16            [ 2]  240 	ldw	(0x16, sp), x
                                    241 ;	stm8s_tim1_main.c: 177: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      0092FC 90 5D            [ 2]  242 	tnzw	y
      0092FE 26 6C            [ 1]  243 	jrne	00192$
                                    244 ;	stm8s_tim1_main.c: 179: if (argc < 4)
      009300 0D 13            [ 1]  245 	tnz	(0x13, sp)
      009302 27 0A            [ 1]  246 	jreq	00104$
                                    247 ;	stm8s_tim1_main.c: 181: MibWriteDebugString(cptr->usage);
      009304 1E 0F            [ 2]  248 	ldw	x, (0x0f, sp)
      009306 FE               [ 2]  249 	ldw	x, (x)
      009307 CD A6 1F         [ 4]  250 	call	_MibWriteDebugString
                                    251 ;	stm8s_tim1_main.c: 182: return FALSE;
      00930A 5F               [ 1]  252 	clrw	x
      00930B CC 96 D5         [ 2]  253 	jp	00194$
      00930E                        254 00104$:
                                    255 ;	stm8s_tim1_main.c: 184: if (!HexToInt(argv[2], &vdwAddr, 32))
      00930E 96               [ 1]  256 	ldw	x, sp
      00930F 1C 00 05         [ 2]  257 	addw	x, #5
      009312 51               [ 1]  258 	exgw	x, y
      009313 1E 14            [ 2]  259 	ldw	x, (0x14, sp)
      009315 FE               [ 2]  260 	ldw	x, (x)
      009316 4B 20            [ 1]  261 	push	#0x20
      009318 4B 00            [ 1]  262 	push	#0x00
      00931A 90 89            [ 2]  263 	pushw	y
      00931C CD B3 35         [ 4]  264 	call	_HexToInt
      00931F 5D               [ 2]  265 	tnzw	x
      009320 26 0D            [ 1]  266 	jrne	00106$
                                    267 ;	stm8s_tim1_main.c: 186: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009322 4B BD            [ 1]  268 	push	#<(__str_3+0)
      009324 4B 80            [ 1]  269 	push	#((__str_3+0) >> 8)
      009326 CD B0 3B         [ 4]  270 	call	_mib_printf
      009329 5B 02            [ 2]  271 	addw	sp, #2
                                    272 ;	stm8s_tim1_main.c: 187: return FALSE;
      00932B 5F               [ 1]  273 	clrw	x
      00932C CC 96 D5         [ 2]  274 	jp	00194$
      00932F                        275 00106$:
                                    276 ;	stm8s_tim1_main.c: 189: if (!HexToInt(argv[3], &vbData, 8))
      00932F 96               [ 1]  277 	ldw	x, sp
      009330 1C 00 09         [ 2]  278 	addw	x, #9
      009333 51               [ 1]  279 	exgw	x, y
      009334 1E 16            [ 2]  280 	ldw	x, (0x16, sp)
      009336 FE               [ 2]  281 	ldw	x, (x)
      009337 4B 08            [ 1]  282 	push	#0x08
      009339 4B 00            [ 1]  283 	push	#0x00
      00933B 90 89            [ 2]  284 	pushw	y
      00933D CD B3 35         [ 4]  285 	call	_HexToInt
      009340 5D               [ 2]  286 	tnzw	x
      009341 26 0D            [ 1]  287 	jrne	00108$
                                    288 ;	stm8s_tim1_main.c: 191: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009343 4B BD            [ 1]  289 	push	#<(__str_3+0)
      009345 4B 80            [ 1]  290 	push	#((__str_3+0) >> 8)
      009347 CD B0 3B         [ 4]  291 	call	_mib_printf
      00934A 5B 02            [ 2]  292 	addw	sp, #2
                                    293 ;	stm8s_tim1_main.c: 192: return FALSE;
      00934C 5F               [ 1]  294 	clrw	x
      00934D CC 96 D5         [ 2]  295 	jp	00194$
      009350                        296 00108$:
                                    297 ;	stm8s_tim1_main.c: 194: wr_ADDR8(vdwAddr, vbData);
      009350 1E 07            [ 2]  298 	ldw	x, (0x07, sp)
      009352 7B 09            [ 1]  299 	ld	a, (0x09, sp)
      009354 F7               [ 1]  300 	ld	(x), a
                                    301 ;	stm8s_tim1_main.c: 195: ccprintf(_DEBUG_CMD_A_, ("wr_ADDR8 : 0x%08lx[0x%02x]\r\n", vdwAddr, vbData));
      009355 5F               [ 1]  302 	clrw	x
      009356 7B 09            [ 1]  303 	ld	a, (0x09, sp)
      009358 97               [ 1]  304 	ld	xl, a
      009359 89               [ 2]  305 	pushw	x
      00935A 1E 09            [ 2]  306 	ldw	x, (0x09, sp)
      00935C 89               [ 2]  307 	pushw	x
      00935D 1E 09            [ 2]  308 	ldw	x, (0x09, sp)
      00935F 89               [ 2]  309 	pushw	x
      009360 4B DA            [ 1]  310 	push	#<(__str_4+0)
      009362 4B 80            [ 1]  311 	push	#((__str_4+0) >> 8)
      009364 CD B0 3B         [ 4]  312 	call	_mib_printf
      009367 5B 08            [ 2]  313 	addw	sp, #8
      009369 CC 96 D3         [ 2]  314 	jp	00193$
      00936C                        315 00192$:
                                    316 ;	stm8s_tim1_main.c: 200: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      00936C 1E 11            [ 2]  317 	ldw	x, (0x11, sp)
      00936E FE               [ 2]  318 	ldw	x, (x)
      00936F 4B F7            [ 1]  319 	push	#<(___str_5+0)
      009371 4B 80            [ 1]  320 	push	#((___str_5+0) >> 8)
      009373 CD C3 34         [ 4]  321 	call	_strcmp
      009376 51               [ 1]  322 	exgw	x, y
                                    323 ;	stm8s_tim1_main.c: 202: if (argc < 3)
      009377 1E 1D            [ 2]  324 	ldw	x, (0x1d, sp)
      009379 A3 00 03         [ 2]  325 	cpw	x, #0x0003
      00937C 2F 04            [ 1]  326 	jrslt	00383$
      00937E 0F 18            [ 1]  327 	clr	(0x18, sp)
      009380 20 04            [ 2]  328 	jra	00384$
      009382                        329 00383$:
      009382 A6 01            [ 1]  330 	ld	a, #0x01
      009384 6B 18            [ 1]  331 	ld	(0x18, sp), a
      009386                        332 00384$:
                                    333 ;	stm8s_tim1_main.c: 200: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      009386 90 5D            [ 2]  334 	tnzw	y
      009388 26 49            [ 1]  335 	jrne	00189$
                                    336 ;	stm8s_tim1_main.c: 202: if (argc < 3)
      00938A 0D 18            [ 1]  337 	tnz	(0x18, sp)
      00938C 27 0A            [ 1]  338 	jreq	00110$
                                    339 ;	stm8s_tim1_main.c: 204: MibWriteDebugString(cptr->usage);
      00938E 1E 0F            [ 2]  340 	ldw	x, (0x0f, sp)
      009390 FE               [ 2]  341 	ldw	x, (x)
      009391 CD A6 1F         [ 4]  342 	call	_MibWriteDebugString
                                    343 ;	stm8s_tim1_main.c: 205: return FALSE;
      009394 5F               [ 1]  344 	clrw	x
      009395 CC 96 D5         [ 2]  345 	jp	00194$
      009398                        346 00110$:
                                    347 ;	stm8s_tim1_main.c: 207: if (!HexToInt(argv[2], &vdwAddr, 32))
      009398 96               [ 1]  348 	ldw	x, sp
      009399 1C 00 05         [ 2]  349 	addw	x, #5
      00939C 51               [ 1]  350 	exgw	x, y
      00939D 1E 14            [ 2]  351 	ldw	x, (0x14, sp)
      00939F FE               [ 2]  352 	ldw	x, (x)
      0093A0 4B 20            [ 1]  353 	push	#0x20
      0093A2 4B 00            [ 1]  354 	push	#0x00
      0093A4 90 89            [ 2]  355 	pushw	y
      0093A6 CD B3 35         [ 4]  356 	call	_HexToInt
      0093A9 5D               [ 2]  357 	tnzw	x
      0093AA 26 0D            [ 1]  358 	jrne	00112$
                                    359 ;	stm8s_tim1_main.c: 209: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      0093AC 4B BD            [ 1]  360 	push	#<(__str_3+0)
      0093AE 4B 80            [ 1]  361 	push	#((__str_3+0) >> 8)
      0093B0 CD B0 3B         [ 4]  362 	call	_mib_printf
      0093B3 5B 02            [ 2]  363 	addw	sp, #2
                                    364 ;	stm8s_tim1_main.c: 210: return FALSE;
      0093B5 5F               [ 1]  365 	clrw	x
      0093B6 CC 96 D5         [ 2]  366 	jp	00194$
      0093B9                        367 00112$:
                                    368 ;	stm8s_tim1_main.c: 213: vbData = rd_ADDR8(vdwAddr);
      0093B9 1E 07            [ 2]  369 	ldw	x, (0x07, sp)
      0093BB F6               [ 1]  370 	ld	a, (x)
      0093BC 6B 09            [ 1]  371 	ld	(0x09, sp), a
                                    372 ;	stm8s_tim1_main.c: 215: ccprintf(_DEBUG_CMD_A_, ("rd_ADDR8 : 0x%08lx[0x%02x]\r\n", vdwAddr, vbData));
      0093BE 5F               [ 1]  373 	clrw	x
      0093BF 97               [ 1]  374 	ld	xl, a
      0093C0 89               [ 2]  375 	pushw	x
      0093C1 1E 09            [ 2]  376 	ldw	x, (0x09, sp)
      0093C3 89               [ 2]  377 	pushw	x
      0093C4 1E 09            [ 2]  378 	ldw	x, (0x09, sp)
      0093C6 89               [ 2]  379 	pushw	x
      0093C7 4B FC            [ 1]  380 	push	#<(__str_6+0)
      0093C9 4B 80            [ 1]  381 	push	#((__str_6+0) >> 8)
      0093CB CD B0 3B         [ 4]  382 	call	_mib_printf
      0093CE 5B 08            [ 2]  383 	addw	sp, #8
      0093D0 CC 96 D3         [ 2]  384 	jp	00193$
      0093D3                        385 00189$:
                                    386 ;	stm8s_tim1_main.c: 220: else if (!strcmp(argv[1], "onepulse"))
      0093D3 1E 11            [ 2]  387 	ldw	x, (0x11, sp)
      0093D5 FE               [ 2]  388 	ldw	x, (x)
      0093D6 4B 19            [ 1]  389 	push	#<(___str_7+0)
      0093D8 4B 81            [ 1]  390 	push	#((___str_7+0) >> 8)
      0093DA CD C3 34         [ 4]  391 	call	_strcmp
                                    392 ;	stm8s_tim1_main.c: 243: if (!DecToLong(argv[4], &vdwDataWidth, 32))
      0093DD 16 1F            [ 2]  393 	ldw	y, (0x1f, sp)
      0093DF 72 A9 00 08      [ 2]  394 	addw	y, #0x0008
      0093E3 17 19            [ 2]  395 	ldw	(0x19, sp), y
                                    396 ;	stm8s_tim1_main.c: 220: else if (!strcmp(argv[1], "onepulse"))
      0093E5 5D               [ 2]  397 	tnzw	x
      0093E6 27 03            [ 1]  398 	jreq	00388$
      0093E8 CC 94 76         [ 2]  399 	jp	00186$
      0093EB                        400 00388$:
                                    401 ;	stm8s_tim1_main.c: 223: uint32_t vdwDataDelay = 0;
      0093EB 5F               [ 1]  402 	clrw	x
      0093EC 1F 03            [ 2]  403 	ldw	(0x03, sp), x
      0093EE 1F 01            [ 2]  404 	ldw	(0x01, sp), x
                                    405 ;	stm8s_tim1_main.c: 224: uint32_t vdwDataWidth = 0;
      0093F0 5F               [ 1]  406 	clrw	x
      0093F1 1F 0D            [ 2]  407 	ldw	(0x0d, sp), x
      0093F3 1F 0B            [ 2]  408 	ldw	(0x0b, sp), x
                                    409 ;	stm8s_tim1_main.c: 225: if (argc < 5)
      0093F5 1E 1D            [ 2]  410 	ldw	x, (0x1d, sp)
      0093F7 A3 00 05         [ 2]  411 	cpw	x, #0x0005
      0093FA 2E 0A            [ 1]  412 	jrsge	00114$
                                    413 ;	stm8s_tim1_main.c: 227: MibWriteDebugString(cptr->usage);
      0093FC 1E 0F            [ 2]  414 	ldw	x, (0x0f, sp)
      0093FE FE               [ 2]  415 	ldw	x, (x)
      0093FF CD A6 1F         [ 4]  416 	call	_MibWriteDebugString
                                    417 ;	stm8s_tim1_main.c: 228: return FALSE;
      009402 5F               [ 1]  418 	clrw	x
      009403 CC 96 D5         [ 2]  419 	jp	00194$
      009406                        420 00114$:
                                    421 ;	stm8s_tim1_main.c: 230: if (!strcmp(argv[2], "low"))
      009406 1E 14            [ 2]  422 	ldw	x, (0x14, sp)
      009408 FE               [ 2]  423 	ldw	x, (x)
      009409 4B 22            [ 1]  424 	push	#<(___str_8+0)
      00940B 4B 81            [ 1]  425 	push	#((___str_8+0) >> 8)
      00940D CD C3 34         [ 4]  426 	call	_strcmp
      009410 1F 14            [ 2]  427 	ldw	(0x14, sp), x
      009412 26 04            [ 1]  428 	jrne	00116$
                                    429 ;	stm8s_tim1_main.c: 232: vbPulseState = 0;
      009414 0F 18            [ 1]  430 	clr	(0x18, sp)
      009416 20 04            [ 2]  431 	jra	00117$
      009418                        432 00116$:
                                    433 ;	stm8s_tim1_main.c: 236: vbPulseState = 1;
      009418 A6 01            [ 1]  434 	ld	a, #0x01
      00941A 6B 18            [ 1]  435 	ld	(0x18, sp), a
      00941C                        436 00117$:
                                    437 ;	stm8s_tim1_main.c: 238: if (!DecToLong(argv[3], &vdwDataDelay, 32))
      00941C 96               [ 1]  438 	ldw	x, sp
      00941D 5C               [ 1]  439 	incw	x
      00941E 51               [ 1]  440 	exgw	x, y
      00941F 1E 16            [ 2]  441 	ldw	x, (0x16, sp)
      009421 FE               [ 2]  442 	ldw	x, (x)
      009422 4B 20            [ 1]  443 	push	#0x20
      009424 4B 00            [ 1]  444 	push	#0x00
      009426 90 89            [ 2]  445 	pushw	y
      009428 CD B4 21         [ 4]  446 	call	_DecToLong
      00942B 5D               [ 2]  447 	tnzw	x
      00942C 26 0D            [ 1]  448 	jrne	00119$
                                    449 ;	stm8s_tim1_main.c: 240: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00942E 4B BD            [ 1]  450 	push	#<(__str_3+0)
      009430 4B 80            [ 1]  451 	push	#((__str_3+0) >> 8)
      009432 CD B0 3B         [ 4]  452 	call	_mib_printf
      009435 5B 02            [ 2]  453 	addw	sp, #2
                                    454 ;	stm8s_tim1_main.c: 241: return FALSE;
      009437 5F               [ 1]  455 	clrw	x
      009438 CC 96 D5         [ 2]  456 	jp	00194$
      00943B                        457 00119$:
                                    458 ;	stm8s_tim1_main.c: 243: if (!DecToLong(argv[4], &vdwDataWidth, 32))
      00943B 96               [ 1]  459 	ldw	x, sp
      00943C 1C 00 0B         [ 2]  460 	addw	x, #11
      00943F 51               [ 1]  461 	exgw	x, y
      009440 1E 19            [ 2]  462 	ldw	x, (0x19, sp)
      009442 FE               [ 2]  463 	ldw	x, (x)
      009443 4B 20            [ 1]  464 	push	#0x20
      009445 4B 00            [ 1]  465 	push	#0x00
      009447 90 89            [ 2]  466 	pushw	y
      009449 CD B4 21         [ 4]  467 	call	_DecToLong
      00944C 5D               [ 2]  468 	tnzw	x
      00944D 26 0D            [ 1]  469 	jrne	00121$
                                    470 ;	stm8s_tim1_main.c: 245: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00944F 4B BD            [ 1]  471 	push	#<(__str_3+0)
      009451 4B 80            [ 1]  472 	push	#((__str_3+0) >> 8)
      009453 CD B0 3B         [ 4]  473 	call	_mib_printf
      009456 5B 02            [ 2]  474 	addw	sp, #2
                                    475 ;	stm8s_tim1_main.c: 246: return FALSE;
      009458 5F               [ 1]  476 	clrw	x
      009459 CC 96 D5         [ 2]  477 	jp	00194$
      00945C                        478 00121$:
                                    479 ;	stm8s_tim1_main.c: 248: mmTim1GpioInit();
      00945C CD 99 08         [ 4]  480 	call	_mmTim1GpioInit
                                    481 ;	stm8s_tim1_main.c: 249: mmRemapCH1N_CH2N_CH3N_ETR();
      00945F CD 99 27         [ 4]  482 	call	_mmRemapCH1N_CH2N_CH3N_ETR
                                    483 ;	stm8s_tim1_main.c: 250: mmTim1Onepulse(vbPulseState, vdwDataDelay, vdwDataWidth);
      009462 1E 0D            [ 2]  484 	ldw	x, (0x0d, sp)
      009464 89               [ 2]  485 	pushw	x
      009465 1E 0D            [ 2]  486 	ldw	x, (0x0d, sp)
      009467 89               [ 2]  487 	pushw	x
      009468 1E 07            [ 2]  488 	ldw	x, (0x07, sp)
      00946A 89               [ 2]  489 	pushw	x
      00946B 1E 07            [ 2]  490 	ldw	x, (0x07, sp)
      00946D 89               [ 2]  491 	pushw	x
      00946E 7B 20            [ 1]  492 	ld	a, (0x20, sp)
      009470 CD 96 DD         [ 4]  493 	call	_mmTim1Onepulse
      009473 CC 96 D3         [ 2]  494 	jp	00193$
      009476                        495 00186$:
                                    496 ;	stm8s_tim1_main.c: 255: else if (!strcmp(argv[1], "pwm"))
      009476 1E 11            [ 2]  497 	ldw	x, (0x11, sp)
      009478 FE               [ 2]  498 	ldw	x, (x)
      009479 4B 26            [ 1]  499 	push	#<(___str_9+0)
      00947B 4B 81            [ 1]  500 	push	#((___str_9+0) >> 8)
      00947D CD C3 34         [ 4]  501 	call	_strcmp
      009480 5D               [ 2]  502 	tnzw	x
      009481 27 03            [ 1]  503 	jreq	00393$
      009483 CC 95 AD         [ 2]  504 	jp	00183$
      009486                        505 00393$:
                                    506 ;	stm8s_tim1_main.c: 257: uint32_t vdwDataPeriod = 0;
      009486 5F               [ 1]  507 	clrw	x
      009487 1F 0C            [ 2]  508 	ldw	(0x0c, sp), x
      009489 1F 0A            [ 2]  509 	ldw	(0x0a, sp), x
                                    510 ;	stm8s_tim1_main.c: 258: uint8_t vbDataRatio = 0;
      00948B 0F 0E            [ 1]  511 	clr	(0x0e, sp)
                                    512 ;	stm8s_tim1_main.c: 263: if (argc < 3)
      00948D 0D 18            [ 1]  513 	tnz	(0x18, sp)
      00948F 27 0A            [ 1]  514 	jreq	00123$
                                    515 ;	stm8s_tim1_main.c: 265: MibWriteDebugString(cptr->usage);
      009491 1E 0F            [ 2]  516 	ldw	x, (0x0f, sp)
      009493 FE               [ 2]  517 	ldw	x, (x)
      009494 CD A6 1F         [ 4]  518 	call	_MibWriteDebugString
                                    519 ;	stm8s_tim1_main.c: 266: return FALSE;
      009497 5F               [ 1]  520 	clrw	x
      009498 CC 96 D5         [ 2]  521 	jp	00194$
      00949B                        522 00123$:
                                    523 ;	stm8s_tim1_main.c: 268: if(argc < 4)
      00949B 0D 13            [ 1]  524 	tnz	(0x13, sp)
      00949D 27 0C            [ 1]  525 	jreq	00152$
                                    526 ;	stm8s_tim1_main.c: 270: vbChannelNumber = 1; // ch1
                                    527 ;	stm8s_tim1_main.c: 271: vbPinUseFlag = 1; // Plus
      00949F A6 01            [ 1]  528 	ld	a, #0x01
      0094A1 6B 19            [ 1]  529 	ld	(0x19, sp), a
      0094A3 6B 1A            [ 1]  530 	ld	(0x1a, sp), a
                                    531 ;	stm8s_tim1_main.c: 272: vbLevelState = TIM1_OCPOLARITY_LOW;
      0094A5 A6 22            [ 1]  532 	ld	a, #0x22
      0094A7 6B 18            [ 1]  533 	ld	(0x18, sp), a
      0094A9 20 6D            [ 2]  534 	jra	00153$
      0094AB                        535 00152$:
                                    536 ;	stm8s_tim1_main.c: 276: if (argv[4][0]=='1')
      0094AB 1E 19            [ 2]  537 	ldw	x, (0x19, sp)
      0094AD FE               [ 2]  538 	ldw	x, (x)
      0094AE 1F 12            [ 2]  539 	ldw	(0x12, sp), x
      0094B0 F6               [ 1]  540 	ld	a, (x)
      0094B1 A1 31            [ 1]  541 	cp	a, #0x31
      0094B3 26 04            [ 1]  542 	jrne	00134$
                                    543 ;	stm8s_tim1_main.c: 278: vbChannelNumber = TIM1_CHANNEL_1;
      0094B5 0F 19            [ 1]  544 	clr	(0x19, sp)
      0094B7 20 1F            [ 2]  545 	jra	00135$
      0094B9                        546 00134$:
                                    547 ;	stm8s_tim1_main.c: 280: else if (argv[4][0]=='2')
      0094B9 A1 32            [ 1]  548 	cp	a, #0x32
      0094BB 26 06            [ 1]  549 	jrne	00131$
                                    550 ;	stm8s_tim1_main.c: 282: vbChannelNumber = TIM1_CHANNEL_2;
      0094BD A6 01            [ 1]  551 	ld	a, #0x01
      0094BF 6B 19            [ 1]  552 	ld	(0x19, sp), a
      0094C1 20 15            [ 2]  553 	jra	00135$
      0094C3                        554 00131$:
                                    555 ;	stm8s_tim1_main.c: 284: else if (argv[4][0]=='3')
      0094C3 A1 33            [ 1]  556 	cp	a, #0x33
      0094C5 26 06            [ 1]  557 	jrne	00128$
                                    558 ;	stm8s_tim1_main.c: 286: vbChannelNumber = TIM1_CHANNEL_3;
      0094C7 A6 02            [ 1]  559 	ld	a, #0x02
      0094C9 6B 19            [ 1]  560 	ld	(0x19, sp), a
      0094CB 20 0B            [ 2]  561 	jra	00135$
      0094CD                        562 00128$:
                                    563 ;	stm8s_tim1_main.c: 288: else if (argv[4][0]=='4')
      0094CD A1 34            [ 1]  564 	cp	a, #0x34
      0094CF 26 05            [ 1]  565 	jrne	00125$
                                    566 ;	stm8s_tim1_main.c: 290: vbChannelNumber = TIM1_CHANNEL_4;
      0094D1 A6 03            [ 1]  567 	ld	a, #0x03
      0094D3 6B 19            [ 1]  568 	ld	(0x19, sp), a
                                    569 ;	stm8s_tim1_main.c: 294: vbChannelNumber = TIM1_CHANNEL_1;
      0094D5 C5                     570 	.byte 0xc5
      0094D6                        571 00125$:
      0094D6 0F 19            [ 1]  572 	clr	(0x19, sp)
      0094D8                        573 00135$:
                                    574 ;	stm8s_tim1_main.c: 297: if (argv[4][1]=='p')
      0094D8 1E 12            [ 2]  575 	ldw	x, (0x12, sp)
      0094DA E6 01            [ 1]  576 	ld	a, (0x1, x)
      0094DC A1 70            [ 1]  577 	cp	a, #0x70
      0094DE 26 06            [ 1]  578 	jrne	00143$
                                    579 ;	stm8s_tim1_main.c: 299: vbPinUseFlag = 1;
      0094E0 A6 01            [ 1]  580 	ld	a, #0x01
      0094E2 6B 1A            [ 1]  581 	ld	(0x1a, sp), a
      0094E4 20 18            [ 2]  582 	jra	00144$
      0094E6                        583 00143$:
                                    584 ;	stm8s_tim1_main.c: 301: else if (argv[4][1]=='n')
      0094E6 A1 6E            [ 1]  585 	cp	a, #0x6e
      0094E8 26 06            [ 1]  586 	jrne	00140$
                                    587 ;	stm8s_tim1_main.c: 303: vbPinUseFlag = 2;
      0094EA A6 02            [ 1]  588 	ld	a, #0x02
      0094EC 6B 1A            [ 1]  589 	ld	(0x1a, sp), a
      0094EE 20 0E            [ 2]  590 	jra	00144$
      0094F0                        591 00140$:
                                    592 ;	stm8s_tim1_main.c: 305: else if (argv[4][1]=='b')
      0094F0 A1 62            [ 1]  593 	cp	a, #0x62
      0094F2 26 06            [ 1]  594 	jrne	00137$
                                    595 ;	stm8s_tim1_main.c: 307: vbPinUseFlag = 3;
      0094F4 A6 03            [ 1]  596 	ld	a, #0x03
      0094F6 6B 1A            [ 1]  597 	ld	(0x1a, sp), a
      0094F8 20 04            [ 2]  598 	jra	00144$
      0094FA                        599 00137$:
                                    600 ;	stm8s_tim1_main.c: 311: vbPinUseFlag = 1;
      0094FA A6 01            [ 1]  601 	ld	a, #0x01
      0094FC 6B 1A            [ 1]  602 	ld	(0x1a, sp), a
      0094FE                        603 00144$:
                                    604 ;	stm8s_tim1_main.c: 314: if (argv[4][2]=='h')
      0094FE 1E 12            [ 2]  605 	ldw	x, (0x12, sp)
      009500 E6 02            [ 1]  606 	ld	a, (0x2, x)
      009502 A1 68            [ 1]  607 	cp	a, #0x68
      009504 26 04            [ 1]  608 	jrne	00149$
                                    609 ;	stm8s_tim1_main.c: 316: vbLevelState = TIM1_OCPOLARITY_HIGH;
      009506 0F 18            [ 1]  610 	clr	(0x18, sp)
      009508 20 0E            [ 2]  611 	jra	00153$
      00950A                        612 00149$:
                                    613 ;	stm8s_tim1_main.c: 318: else if (argv[4][2]=='l')
      00950A A1 6C            [ 1]  614 	cp	a, #0x6c
      00950C 26 06            [ 1]  615 	jrne	00146$
                                    616 ;	stm8s_tim1_main.c: 320: vbLevelState = TIM1_OCPOLARITY_LOW;
      00950E A6 22            [ 1]  617 	ld	a, #0x22
      009510 6B 18            [ 1]  618 	ld	(0x18, sp), a
      009512 20 04            [ 2]  619 	jra	00153$
      009514                        620 00146$:
                                    621 ;	stm8s_tim1_main.c: 324: vbLevelState = TIM1_OCPOLARITY_LOW;
      009514 A6 22            [ 1]  622 	ld	a, #0x22
      009516 6B 18            [ 1]  623 	ld	(0x18, sp), a
      009518                        624 00153$:
                                    625 ;	stm8s_tim1_main.c: 327: if (!DecToLong(argv[2], &vdwDataPeriod, 32))
      009518 96               [ 1]  626 	ldw	x, sp
      009519 1C 00 0A         [ 2]  627 	addw	x, #10
      00951C 16 14            [ 2]  628 	ldw	y, (0x14, sp)
      00951E 90 FE            [ 2]  629 	ldw	y, (y)
      009520 4B 20            [ 1]  630 	push	#0x20
      009522 4B 00            [ 1]  631 	push	#0x00
      009524 89               [ 2]  632 	pushw	x
      009525 93               [ 1]  633 	ldw	x, y
      009526 CD B4 21         [ 4]  634 	call	_DecToLong
      009529 5D               [ 2]  635 	tnzw	x
      00952A 26 0D            [ 1]  636 	jrne	00155$
                                    637 ;	stm8s_tim1_main.c: 329: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00952C 4B BD            [ 1]  638 	push	#<(__str_3+0)
      00952E 4B 80            [ 1]  639 	push	#((__str_3+0) >> 8)
      009530 CD B0 3B         [ 4]  640 	call	_mib_printf
      009533 5B 02            [ 2]  641 	addw	sp, #2
                                    642 ;	stm8s_tim1_main.c: 330: return FALSE;
      009535 5F               [ 1]  643 	clrw	x
      009536 CC 96 D5         [ 2]  644 	jp	00194$
      009539                        645 00155$:
                                    646 ;	stm8s_tim1_main.c: 332: if (!DecToLong(argv[3], &vbDataRatio, 8))
      009539 96               [ 1]  647 	ldw	x, sp
      00953A 1C 00 0E         [ 2]  648 	addw	x, #14
      00953D 16 16            [ 2]  649 	ldw	y, (0x16, sp)
      00953F 90 FE            [ 2]  650 	ldw	y, (y)
      009541 4B 08            [ 1]  651 	push	#0x08
      009543 4B 00            [ 1]  652 	push	#0x00
      009545 89               [ 2]  653 	pushw	x
      009546 93               [ 1]  654 	ldw	x, y
      009547 CD B4 21         [ 4]  655 	call	_DecToLong
      00954A 5D               [ 2]  656 	tnzw	x
      00954B 26 0D            [ 1]  657 	jrne	00157$
                                    658 ;	stm8s_tim1_main.c: 334: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      00954D 4B BD            [ 1]  659 	push	#<(__str_3+0)
      00954F 4B 80            [ 1]  660 	push	#((__str_3+0) >> 8)
      009551 CD B0 3B         [ 4]  661 	call	_mib_printf
      009554 5B 02            [ 2]  662 	addw	sp, #2
                                    663 ;	stm8s_tim1_main.c: 335: return FALSE;
      009556 5F               [ 1]  664 	clrw	x
      009557 CC 96 D5         [ 2]  665 	jp	00194$
      00955A                        666 00157$:
                                    667 ;	stm8s_tim1_main.c: 337: ccprintf(_DEBUG_CMD_A_, ("mmTim1 : vdwDataPeriod (0x%08lx) vbDataRatio (%d)\r\n", vdwDataPeriod, vbDataRatio));
      00955A 5F               [ 1]  668 	clrw	x
      00955B 7B 0E            [ 1]  669 	ld	a, (0x0e, sp)
      00955D 97               [ 1]  670 	ld	xl, a
      00955E 89               [ 2]  671 	pushw	x
      00955F 1E 0E            [ 2]  672 	ldw	x, (0x0e, sp)
      009561 89               [ 2]  673 	pushw	x
      009562 1E 0E            [ 2]  674 	ldw	x, (0x0e, sp)
      009564 89               [ 2]  675 	pushw	x
      009565 4B 2A            [ 1]  676 	push	#<(__str_10+0)
      009567 4B 81            [ 1]  677 	push	#((__str_10+0) >> 8)
      009569 CD B0 3B         [ 4]  678 	call	_mib_printf
      00956C 5B 08            [ 2]  679 	addw	sp, #8
                                    680 ;	stm8s_tim1_main.c: 338: ccprintf(_DEBUG_CMD_A_, ("mmTim1 : vbChannelNumber (%d) vbPinUseFlag (%d) vbLevelState (%d)\r\n", vbChannelNumber, vbPinUseFlag, vbLevelState));
      00956E 5F               [ 1]  681 	clrw	x
      00956F 7B 18            [ 1]  682 	ld	a, (0x18, sp)
      009571 97               [ 1]  683 	ld	xl, a
      009572 7B 1A            [ 1]  684 	ld	a, (0x1a, sp)
      009574 6B 15            [ 1]  685 	ld	(0x15, sp), a
      009576 0F 14            [ 1]  686 	clr	(0x14, sp)
      009578 7B 19            [ 1]  687 	ld	a, (0x19, sp)
      00957A 0F 16            [ 1]  688 	clr	(0x16, sp)
      00957C 89               [ 2]  689 	pushw	x
      00957D 1E 16            [ 2]  690 	ldw	x, (0x16, sp)
      00957F 89               [ 2]  691 	pushw	x
      009580 88               [ 1]  692 	push	a
      009581 7B 1B            [ 1]  693 	ld	a, (0x1b, sp)
      009583 88               [ 1]  694 	push	a
      009584 4B 5E            [ 1]  695 	push	#<(__str_11+0)
      009586 4B 81            [ 1]  696 	push	#((__str_11+0) >> 8)
      009588 CD B0 3B         [ 4]  697 	call	_mib_printf
      00958B 5B 08            [ 2]  698 	addw	sp, #8
                                    699 ;	stm8s_tim1_main.c: 339: mmTim1GpioInit();
      00958D CD 99 08         [ 4]  700 	call	_mmTim1GpioInit
                                    701 ;	stm8s_tim1_main.c: 340: mmRemapCH1N_CH2N_CH3N_ETR();
      009590 CD 99 27         [ 4]  702 	call	_mmRemapCH1N_CH2N_CH3N_ETR
                                    703 ;	stm8s_tim1_main.c: 341: mmTim1PWM(vdwDataPeriod, vbDataRatio, vbChannelNumber, vbPinUseFlag,vbLevelState,0);
      009593 4B 00            [ 1]  704 	push	#0x00
      009595 7B 19            [ 1]  705 	ld	a, (0x19, sp)
      009597 88               [ 1]  706 	push	a
      009598 7B 1C            [ 1]  707 	ld	a, (0x1c, sp)
      00959A 88               [ 1]  708 	push	a
      00959B 7B 1C            [ 1]  709 	ld	a, (0x1c, sp)
      00959D 88               [ 1]  710 	push	a
      00959E 7B 12            [ 1]  711 	ld	a, (0x12, sp)
      0095A0 88               [ 1]  712 	push	a
      0095A1 1E 11            [ 2]  713 	ldw	x, (0x11, sp)
      0095A3 89               [ 2]  714 	pushw	x
      0095A4 1E 11            [ 2]  715 	ldw	x, (0x11, sp)
      0095A6 89               [ 2]  716 	pushw	x
      0095A7 CD 97 64         [ 4]  717 	call	_mmTim1PWM
      0095AA CC 96 D3         [ 2]  718 	jp	00193$
      0095AD                        719 00183$:
                                    720 ;	stm8s_tim1_main.c: 346: else if (!strcmp(argv[1], "remap")) // _CMD_MY_READ_
      0095AD 1E 11            [ 2]  721 	ldw	x, (0x11, sp)
      0095AF FE               [ 2]  722 	ldw	x, (x)
      0095B0 4B A2            [ 1]  723 	push	#<(___str_12+0)
      0095B2 4B 81            [ 1]  724 	push	#((___str_12+0) >> 8)
      0095B4 CD C3 34         [ 4]  725 	call	_strcmp
      0095B7 5D               [ 2]  726 	tnzw	x
      0095B8 27 03            [ 1]  727 	jreq	00425$
      0095BA CC 96 49         [ 2]  728 	jp	00180$
      0095BD                        729 00425$:
                                    730 ;	stm8s_tim1_main.c: 355: if (!strcmp(argv[2], "set"))
      0095BD 1E 14            [ 2]  731 	ldw	x, (0x14, sp)
      0095BF FE               [ 2]  732 	ldw	x, (x)
      0095C0 4B A8            [ 1]  733 	push	#<(___str_13+0)
      0095C2 4B 81            [ 1]  734 	push	#((___str_13+0) >> 8)
      0095C4 CD C3 34         [ 4]  735 	call	_strcmp
      0095C7 1F 19            [ 2]  736 	ldw	(0x19, sp), x
      0095C9 26 25            [ 1]  737 	jrne	00166$
                                    738 ;	stm8s_tim1_main.c: 358: if(FLASH_ReadByte(OPT2_REG)!=AFR5_BIT) 
      0095CB 4B 03            [ 1]  739 	push	#0x03
      0095CD 4B 48            [ 1]  740 	push	#0x48
      0095CF 5F               [ 1]  741 	clrw	x
      0095D0 89               [ 2]  742 	pushw	x
      0095D1 CD A3 E3         [ 4]  743 	call	_FLASH_ReadByte
      0095D4 A1 20            [ 1]  744 	cp	a, #0x20
      0095D6 27 0D            [ 1]  745 	jreq	00159$
                                    746 ;	stm8s_tim1_main.c: 360: FLASH_Unlock(FLASH_MEMTYPE_DATA); 
      0095D8 A6 F7            [ 1]  747 	ld	a, #0xf7
      0095DA CD A3 7E         [ 4]  748 	call	_FLASH_Unlock
                                    749 ;	stm8s_tim1_main.c: 362: FLASH_ProgramOptionByte(OPT2_REG,AFR5_BIT); 
      0095DD A6 20            [ 1]  750 	ld	a, #0x20
      0095DF AE 48 03         [ 2]  751 	ldw	x, #0x4803
      0095E2 CD A4 27         [ 4]  752 	call	_FLASH_ProgramOptionByte
      0095E5                        753 00159$:
                                    754 ;	stm8s_tim1_main.c: 364: vbData=FLASH_ReadOptionByte(OPT2_REG); 
      0095E5 AE 48 03         [ 2]  755 	ldw	x, #0x4803
      0095E8 CD A4 91         [ 4]  756 	call	_FLASH_ReadOptionByte
      0095EB 9F               [ 1]  757 	ld	a, xl
      0095EC 6B 09            [ 1]  758 	ld	(0x09, sp), a
      0095EE 20 39            [ 2]  759 	jra	00167$
      0095F0                        760 00166$:
                                    761 ;	stm8s_tim1_main.c: 366: else if (!strcmp(argv[2], "reset"))
      0095F0 1E 14            [ 2]  762 	ldw	x, (0x14, sp)
      0095F2 FE               [ 2]  763 	ldw	x, (x)
      0095F3 4B AC            [ 1]  764 	push	#<(___str_14+0)
      0095F5 4B 81            [ 1]  765 	push	#((___str_14+0) >> 8)
      0095F7 CD C3 34         [ 4]  766 	call	_strcmp
      0095FA 5D               [ 2]  767 	tnzw	x
      0095FB 26 23            [ 1]  768 	jrne	00163$
                                    769 ;	stm8s_tim1_main.c: 369: if(FLASH_ReadByte(OPT2_REG)!=0x00) 
      0095FD 4B 03            [ 1]  770 	push	#0x03
      0095FF 4B 48            [ 1]  771 	push	#0x48
      009601 5F               [ 1]  772 	clrw	x
      009602 89               [ 2]  773 	pushw	x
      009603 CD A3 E3         [ 4]  774 	call	_FLASH_ReadByte
      009606 4D               [ 1]  775 	tnz	a
      009607 27 0C            [ 1]  776 	jreq	00161$
                                    777 ;	stm8s_tim1_main.c: 371: FLASH_Unlock(FLASH_MEMTYPE_DATA); 
      009609 A6 F7            [ 1]  778 	ld	a, #0xf7
      00960B CD A3 7E         [ 4]  779 	call	_FLASH_Unlock
                                    780 ;	stm8s_tim1_main.c: 373: FLASH_ProgramOptionByte(OPT2_REG,0x00); 
      00960E 4F               [ 1]  781 	clr	a
      00960F AE 48 03         [ 2]  782 	ldw	x, #0x4803
      009612 CD A4 27         [ 4]  783 	call	_FLASH_ProgramOptionByte
      009615                        784 00161$:
                                    785 ;	stm8s_tim1_main.c: 375: vbData=FLASH_ReadOptionByte(OPT2_REG); 
      009615 AE 48 03         [ 2]  786 	ldw	x, #0x4803
      009618 CD A4 91         [ 4]  787 	call	_FLASH_ReadOptionByte
      00961B 9F               [ 1]  788 	ld	a, xl
      00961C 6B 09            [ 1]  789 	ld	(0x09, sp), a
      00961E 20 09            [ 2]  790 	jra	00167$
      009620                        791 00163$:
                                    792 ;	stm8s_tim1_main.c: 379: ccprintf(_DEBUG_CMD_A_, ("tim1 init....error !!!\r\n"));		
      009620 4B B2            [ 1]  793 	push	#<(__str_15+0)
      009622 4B 81            [ 1]  794 	push	#((__str_15+0) >> 8)
      009624 CD B0 3B         [ 4]  795 	call	_mib_printf
      009627 5B 02            [ 2]  796 	addw	sp, #2
      009629                        797 00167$:
                                    798 ;	stm8s_tim1_main.c: 382: ccprintf(_DEBUG_CMD_A_, ("tim1 init....(0x%02X)\r\n",vbData));		
      009629 5F               [ 1]  799 	clrw	x
      00962A 7B 09            [ 1]  800 	ld	a, (0x09, sp)
      00962C 97               [ 1]  801 	ld	xl, a
      00962D 89               [ 2]  802 	pushw	x
      00962E 4B CB            [ 1]  803 	push	#<(__str_16+0)
      009630 4B 81            [ 1]  804 	push	#((__str_16+0) >> 8)
      009632 CD B0 3B         [ 4]  805 	call	_mib_printf
      009635 5B 04            [ 2]  806 	addw	sp, #4
                                    807 ;	stm8s_tim1_main.c: 383: ccprintf(_DEBUG_CMD_A_, ("tim1 AFR5....(0x%x)\r\n",rd_ADDR8(OPT2_REG)));		
      009637 C6 48 03         [ 1]  808 	ld	a, 0x4803
      00963A 5F               [ 1]  809 	clrw	x
      00963B 97               [ 1]  810 	ld	xl, a
      00963C 89               [ 2]  811 	pushw	x
      00963D 4B E3            [ 1]  812 	push	#<(__str_17+0)
      00963F 4B 81            [ 1]  813 	push	#((__str_17+0) >> 8)
      009641 CD B0 3B         [ 4]  814 	call	_mib_printf
      009644 5B 04            [ 2]  815 	addw	sp, #4
      009646 CC 96 D3         [ 2]  816 	jp	00193$
      009649                        817 00180$:
                                    818 ;	stm8s_tim1_main.c: 388: else if (!strcmp(argv[1], "init")) // _CMD_MY_READ_
      009649 1E 11            [ 2]  819 	ldw	x, (0x11, sp)
      00964B FE               [ 2]  820 	ldw	x, (x)
      00964C 4B F9            [ 1]  821 	push	#<(___str_18+0)
      00964E 4B 81            [ 1]  822 	push	#((___str_18+0) >> 8)
      009650 CD C3 34         [ 4]  823 	call	_strcmp
      009653 5D               [ 2]  824 	tnzw	x
      009654 26 05            [ 1]  825 	jrne	00177$
                                    826 ;	stm8s_tim1_main.c: 390: mmTim1GpioInit();
      009656 CD 99 08         [ 4]  827 	call	_mmTim1GpioInit
      009659 20 78            [ 2]  828 	jra	00193$
      00965B                        829 00177$:
                                    830 ;	stm8s_tim1_main.c: 395: else if (!strcmp(argv[1], "reset")) // _CMD_MY_READ_
      00965B 1E 11            [ 2]  831 	ldw	x, (0x11, sp)
      00965D FE               [ 2]  832 	ldw	x, (x)
      00965E 4B AC            [ 1]  833 	push	#<(___str_14+0)
      009660 4B 81            [ 1]  834 	push	#((___str_14+0) >> 8)
      009662 CD C3 34         [ 4]  835 	call	_strcmp
      009665 5D               [ 2]  836 	tnzw	x
      009666 26 41            [ 1]  837 	jrne	00174$
                                    838 ;	stm8s_tim1_main.c: 397: TIM1_DeInit();
      009668 CD 99 42         [ 4]  839 	call	_TIM1_DeInit
                                    840 ;	stm8s_tim1_main.c: 400: if(FLASH_ReadByte(OPT2_REG)!=0x00) 
      00966B 4B 03            [ 1]  841 	push	#0x03
      00966D 4B 48            [ 1]  842 	push	#0x48
      00966F 5F               [ 1]  843 	clrw	x
      009670 89               [ 2]  844 	pushw	x
      009671 CD A3 E3         [ 4]  845 	call	_FLASH_ReadByte
      009674 4D               [ 1]  846 	tnz	a
      009675 27 0C            [ 1]  847 	jreq	00169$
                                    848 ;	stm8s_tim1_main.c: 402: FLASH_Unlock(FLASH_MEMTYPE_DATA); 
      009677 A6 F7            [ 1]  849 	ld	a, #0xf7
      009679 CD A3 7E         [ 4]  850 	call	_FLASH_Unlock
                                    851 ;	stm8s_tim1_main.c: 404: FLASH_ProgramOptionByte(OPT2_REG,0x00); 
      00967C 4F               [ 1]  852 	clr	a
      00967D AE 48 03         [ 2]  853 	ldw	x, #0x4803
      009680 CD A4 27         [ 4]  854 	call	_FLASH_ProgramOptionByte
      009683                        855 00169$:
                                    856 ;	stm8s_tim1_main.c: 406: vbData=FLASH_ReadOptionByte(OPT2_REG); 
      009683 AE 48 03         [ 2]  857 	ldw	x, #0x4803
      009686 CD A4 91         [ 4]  858 	call	_FLASH_ReadOptionByte
      009689 9F               [ 1]  859 	ld	a, xl
      00968A 6B 09            [ 1]  860 	ld	(0x09, sp), a
                                    861 ;	stm8s_tim1_main.c: 407: ccprintf(_DEBUG_CMD_A_, ("tim1 reset....(0x%02X)\r\n",vbData));		
      00968C 5F               [ 1]  862 	clrw	x
      00968D 97               [ 1]  863 	ld	xl, a
      00968E 89               [ 2]  864 	pushw	x
      00968F 4B FE            [ 1]  865 	push	#<(__str_19+0)
      009691 4B 81            [ 1]  866 	push	#((__str_19+0) >> 8)
      009693 CD B0 3B         [ 4]  867 	call	_mib_printf
      009696 5B 04            [ 2]  868 	addw	sp, #4
                                    869 ;	stm8s_tim1_main.c: 408: ccprintf(_DEBUG_CMD_A_, ("tim1 AFR5....(0x%x)\r\n",rd_ADDR8(OPT2_REG)));		
      009698 C6 48 03         [ 1]  870 	ld	a, 0x4803
      00969B 5F               [ 1]  871 	clrw	x
      00969C 97               [ 1]  872 	ld	xl, a
      00969D 89               [ 2]  873 	pushw	x
      00969E 4B E3            [ 1]  874 	push	#<(__str_17+0)
      0096A0 4B 81            [ 1]  875 	push	#((__str_17+0) >> 8)
      0096A2 CD B0 3B         [ 4]  876 	call	_mib_printf
      0096A5 5B 04            [ 2]  877 	addw	sp, #4
      0096A7 20 2A            [ 2]  878 	jra	00193$
      0096A9                        879 00174$:
                                    880 ;	stm8s_tim1_main.c: 414: else if (!strcmp(argv[1], "help")) // _CMD_MY_READ_
      0096A9 1E 11            [ 2]  881 	ldw	x, (0x11, sp)
      0096AB FE               [ 2]  882 	ldw	x, (x)
      0096AC 4B 17            [ 1]  883 	push	#<(___str_20+0)
      0096AE 4B 82            [ 1]  884 	push	#((___str_20+0) >> 8)
      0096B0 CD C3 34         [ 4]  885 	call	_strcmp
      0096B3 5D               [ 2]  886 	tnzw	x
      0096B4 26 15            [ 1]  887 	jrne	00171$
                                    888 ;	stm8s_tim1_main.c: 417: ccprintf(_DEBUG_CMD_A_, ("TIM1_BaseAddress : 0x%04x\r\n", TIM1_BaseAddress));
      0096B6 4B 50            [ 1]  889 	push	#0x50
      0096B8 4B 52            [ 1]  890 	push	#0x52
      0096BA 4B 1C            [ 1]  891 	push	#<(__str_21+0)
      0096BC 4B 82            [ 1]  892 	push	#((__str_21+0) >> 8)
      0096BE CD B0 3B         [ 4]  893 	call	_mib_printf
      0096C1 5B 04            [ 2]  894 	addw	sp, #4
                                    895 ;	stm8s_tim1_main.c: 418: MibWriteDebugString((uint8_t *)gpbHelp_TIM1_TypeDef);
      0096C3 CE 01 4A         [ 2]  896 	ldw	x, _gpbHelp_TIM1_TypeDef+0
      0096C6 CD A6 1F         [ 4]  897 	call	_MibWriteDebugString
      0096C9 20 08            [ 2]  898 	jra	00193$
      0096CB                        899 00171$:
                                    900 ;	stm8s_tim1_main.c: 422: MibWriteDebugString(cptr->usage);
      0096CB 1E 0F            [ 2]  901 	ldw	x, (0x0f, sp)
      0096CD FE               [ 2]  902 	ldw	x, (x)
      0096CE CD A6 1F         [ 4]  903 	call	_MibWriteDebugString
                                    904 ;	stm8s_tim1_main.c: 423: return FALSE;
      0096D1 5F               [ 1]  905 	clrw	x
                                    906 ;	stm8s_tim1_main.c: 425: return TRUE;
      0096D2 C5                     907 	.byte 0xc5
      0096D3                        908 00193$:
      0096D3 5F               [ 1]  909 	clrw	x
      0096D4 5C               [ 1]  910 	incw	x
      0096D5                        911 00194$:
                                    912 ;	stm8s_tim1_main.c: 426: }
      0096D5 16 1B            [ 2]  913 	ldw	y, (27, sp)
      0096D7 5B 20            [ 2]  914 	addw	sp, #32
      0096D9 90 FC            [ 2]  915 	jp	(y)
                                    916 ;	stm8s_tim1_main.c: 437: void irqTim1UpdOvf_CALLBACK(void)
                                    917 ;	-----------------------------------------
                                    918 ;	 function irqTim1UpdOvf_CALLBACK
                                    919 ;	-----------------------------------------
      0096DB                        920 _irqTim1UpdOvf_CALLBACK:
                                    921 ;	stm8s_tim1_main.c: 439: }
      0096DB 81               [ 4]  922 	ret
                                    923 ;	stm8s_tim1_main.c: 445: void irqTim1Cap_CALLBACK(void)
                                    924 ;	-----------------------------------------
                                    925 ;	 function irqTim1Cap_CALLBACK
                                    926 ;	-----------------------------------------
      0096DC                        927 _irqTim1Cap_CALLBACK:
                                    928 ;	stm8s_tim1_main.c: 447: }
      0096DC 81               [ 4]  929 	ret
                                    930 ;	stm8s_tim1_main.c: 458: int mmTim1Onepulse(uint8_t vbPulseState, uint32_t vdwDataDelay, uint32_t vdwDataWidth)
                                    931 ;	-----------------------------------------
                                    932 ;	 function mmTim1Onepulse
                                    933 ;	-----------------------------------------
      0096DD                        934 _mmTim1Onepulse:
      0096DD 52 0C            [ 2]  935 	sub	sp, #12
      0096DF 6B 05            [ 1]  936 	ld	(0x05, sp), a
                                    937 ;	stm8s_tim1_main.c: 464: UCOM_LED1_GPIO->ODR &= (uint8_t)(~(UCOM_LED1_PIN)); /* Output mode  Low level */
      0096E1 72 11 50 0F      [ 1]  938 	bres	0x500f, #0
                                    939 ;	stm8s_tim1_main.c: 468: vdwPeriod = vdwDataDelay + vdwDataWidth;
      0096E5 16 11            [ 2]  940 	ldw	y, (0x11, sp)
      0096E7 72 F9 15         [ 2]  941 	addw	y, (0x15, sp)
      0096EA 1E 0F            [ 2]  942 	ldw	x, (0x0f, sp)
      0096EC 24 01            [ 1]  943 	jrnc	00111$
      0096EE 5C               [ 1]  944 	incw	x
      0096EF                        945 00111$:
      0096EF 72 FB 13         [ 2]  946 	addw	x, (0x13, sp)
      0096F2 17 08            [ 2]  947 	ldw	(0x08, sp), y
      0096F4 1F 06            [ 2]  948 	ldw	(0x06, sp), x
                                    949 ;	stm8s_tim1_main.c: 469: vbDataRatio = (vdwDataWidth * 100) / vdwPeriod;
      0096F6 1E 15            [ 2]  950 	ldw	x, (0x15, sp)
      0096F8 89               [ 2]  951 	pushw	x
      0096F9 1E 15            [ 2]  952 	ldw	x, (0x15, sp)
      0096FB 89               [ 2]  953 	pushw	x
      0096FC 4B 64            [ 1]  954 	push	#0x64
      0096FE 5F               [ 1]  955 	clrw	x
      0096FF 89               [ 2]  956 	pushw	x
      009700 4B 00            [ 1]  957 	push	#0x00
      009702 CD C3 89         [ 4]  958 	call	__mullong
      009705 5B 08            [ 2]  959 	addw	sp, #8
      009707 1F 03            [ 2]  960 	ldw	(0x03, sp), x
      009709 1E 08            [ 2]  961 	ldw	x, (0x08, sp)
      00970B 89               [ 2]  962 	pushw	x
      00970C 1E 08            [ 2]  963 	ldw	x, (0x08, sp)
      00970E 89               [ 2]  964 	pushw	x
      00970F 1E 07            [ 2]  965 	ldw	x, (0x07, sp)
      009711 89               [ 2]  966 	pushw	x
      009712 90 89            [ 2]  967 	pushw	y
      009714 CD C2 57         [ 4]  968 	call	__divulong
      009717 5B 08            [ 2]  969 	addw	sp, #8
      009719 9F               [ 1]  970 	ld	a, xl
      00971A 6B 0A            [ 1]  971 	ld	(0x0a, sp), a
                                    972 ;	stm8s_tim1_main.c: 475: if(vbPulseState)
      00971C 0D 05            [ 1]  973 	tnz	(0x05, sp)
      00971E 27 04            [ 1]  974 	jreq	00102$
                                    975 ;	stm8s_tim1_main.c: 477: vbLevelState = TIM1_OCPOLARITY_HIGH;
      009720 0F 0B            [ 1]  976 	clr	(0x0b, sp)
      009722 20 04            [ 2]  977 	jra	00103$
      009724                        978 00102$:
                                    979 ;	stm8s_tim1_main.c: 481: vbLevelState = TIM1_OCPOLARITY_LOW;
      009724 A6 22            [ 1]  980 	ld	a, #0x22
      009726 6B 0B            [ 1]  981 	ld	(0x0b, sp), a
      009728                        982 00103$:
                                    983 ;	stm8s_tim1_main.c: 483: vbPulseState = (vbPulseState<<1) | 0x1;
      009728 7B 05            [ 1]  984 	ld	a, (0x05, sp)
      00972A 48               [ 1]  985 	sll	a
      00972B AA 01            [ 1]  986 	or	a, #0x01
      00972D 6B 0C            [ 1]  987 	ld	(0x0c, sp), a
                                    988 ;	stm8s_tim1_main.c: 484: ccprintf(_DEBUG_CMD_A_, ("mmTim1Onepulse : vdwPeriod (0x%08lx) vbDataRatio (%d)\r\n", vdwPeriod, vbDataRatio));
      00972F 5F               [ 1]  989 	clrw	x
      009730 7B 0A            [ 1]  990 	ld	a, (0x0a, sp)
      009732 97               [ 1]  991 	ld	xl, a
      009733 89               [ 2]  992 	pushw	x
      009734 1E 0A            [ 2]  993 	ldw	x, (0x0a, sp)
      009736 89               [ 2]  994 	pushw	x
      009737 1E 0A            [ 2]  995 	ldw	x, (0x0a, sp)
      009739 89               [ 2]  996 	pushw	x
      00973A 4B 38            [ 1]  997 	push	#<(__str_22+0)
      00973C 4B 82            [ 1]  998 	push	#((__str_22+0) >> 8)
      00973E CD B0 3B         [ 4]  999 	call	_mib_printf
      009741 5B 08            [ 2] 1000 	addw	sp, #8
                                   1001 ;	stm8s_tim1_main.c: 488: UCOM_LED1_GPIO->ODR |= (uint8_t)((UCOM_LED1_PIN)); /* Output mode  high level */
      009743 72 10 50 0F      [ 1] 1002 	bset	0x500f, #0
                                   1003 ;	stm8s_tim1_main.c: 490: mmTim1PWM(vdwPeriod, vbDataRatio, vbChannelNumber, vbPinUseFlag,vbLevelState,vbPulseState);
      009747 7B 0C            [ 1] 1004 	ld	a, (0x0c, sp)
      009749 88               [ 1] 1005 	push	a
      00974A 7B 0C            [ 1] 1006 	ld	a, (0x0c, sp)
      00974C 88               [ 1] 1007 	push	a
      00974D 4B 03            [ 1] 1008 	push	#0x03
      00974F 4B 00            [ 1] 1009 	push	#0x00
      009751 7B 0E            [ 1] 1010 	ld	a, (0x0e, sp)
      009753 88               [ 1] 1011 	push	a
      009754 1E 0D            [ 2] 1012 	ldw	x, (0x0d, sp)
      009756 89               [ 2] 1013 	pushw	x
      009757 1E 0D            [ 2] 1014 	ldw	x, (0x0d, sp)
      009759 89               [ 2] 1015 	pushw	x
      00975A CD 97 64         [ 4] 1016 	call	_mmTim1PWM
                                   1017 ;	stm8s_tim1_main.c: 492: return 0;
      00975D 5F               [ 1] 1018 	clrw	x
                                   1019 ;	stm8s_tim1_main.c: 493: }
      00975E 16 0D            [ 2] 1020 	ldw	y, (13, sp)
      009760 5B 16            [ 2] 1021 	addw	sp, #22
      009762 90 FC            [ 2] 1022 	jp	(y)
                                   1023 ;	stm8s_tim1_main.c: 497: int mmTim1PWM(uint32_t vdwDataPeriod, uint8_t vbDataRatio, uint8_t vbChannelNumber, uint8_t vbPinUseFlag, uint8_t vbLevelState, uint8_t vbPulseState)
                                   1024 ;	-----------------------------------------
                                   1025 ;	 function mmTim1PWM
                                   1026 ;	-----------------------------------------
      009764                       1027 _mmTim1PWM:
      009764 52 0C            [ 2] 1028 	sub	sp, #12
                                   1029 ;	stm8s_tim1_main.c: 499: uint16_t vwPSCR = 0;
      009766 5F               [ 1] 1030 	clrw	x
      009767 1F 01            [ 2] 1031 	ldw	(0x01, sp), x
                                   1032 ;	stm8s_tim1_main.c: 500: uint16_t vwCNTR = 0;
      009769 5F               [ 1] 1033 	clrw	x
      00976A 1F 03            [ 2] 1034 	ldw	(0x03, sp), x
                                   1035 ;	stm8s_tim1_main.c: 504: mmTim1CalPscrCntr(vdwDataPeriod, (uint16_t *)&vwPSCR, (uint16_t *)&vwCNTR);
      00976C 96               [ 1] 1036 	ldw	x, sp
      00976D 1C 00 03         [ 2] 1037 	addw	x, #3
      009770 89               [ 2] 1038 	pushw	x
      009771 96               [ 1] 1039 	ldw	x, sp
      009772 1C 00 03         [ 2] 1040 	addw	x, #3
      009775 89               [ 2] 1041 	pushw	x
      009776 1E 15            [ 2] 1042 	ldw	x, (0x15, sp)
      009778 89               [ 2] 1043 	pushw	x
      009779 1E 15            [ 2] 1044 	ldw	x, (0x15, sp)
      00977B 89               [ 2] 1045 	pushw	x
      00977C CD 98 8A         [ 4] 1046 	call	_mmTim1CalPscrCntr
                                   1047 ;	stm8s_tim1_main.c: 505: vdwRatioTemp = vwCNTR;
      00977F 16 03            [ 2] 1048 	ldw	y, (0x03, sp)
      009781 5F               [ 1] 1049 	clrw	x
      009782 1F 05            [ 2] 1050 	ldw	(0x05, sp), x
                                   1051 ;	stm8s_tim1_main.c: 506: vdwRatioTemp = vdwRatioTemp * vbDataRatio;
      009784 7B 13            [ 1] 1052 	ld	a, (0x13, sp)
      009786 5F               [ 1] 1053 	clrw	x
      009787 1F 09            [ 2] 1054 	ldw	(0x09, sp), x
      009789 88               [ 1] 1055 	push	a
      00978A 9E               [ 1] 1056 	ld	a, xh
      00978B 88               [ 1] 1057 	push	a
      00978C 1E 0B            [ 2] 1058 	ldw	x, (0x0b, sp)
      00978E 89               [ 2] 1059 	pushw	x
      00978F 90 89            [ 2] 1060 	pushw	y
      009791 1E 0B            [ 2] 1061 	ldw	x, (0x0b, sp)
      009793 89               [ 2] 1062 	pushw	x
      009794 CD C3 89         [ 4] 1063 	call	__mullong
      009797 5B 08            [ 2] 1064 	addw	sp, #8
                                   1065 ;	stm8s_tim1_main.c: 507: vdwRatioTemp = vdwRatioTemp / 100;
      009799 4B 64            [ 1] 1066 	push	#0x64
      00979B 4B 00            [ 1] 1067 	push	#0x00
      00979D 4B 00            [ 1] 1068 	push	#0x00
      00979F 4B 00            [ 1] 1069 	push	#0x00
      0097A1 89               [ 2] 1070 	pushw	x
      0097A2 90 89            [ 2] 1071 	pushw	y
      0097A4 CD C2 57         [ 4] 1072 	call	__divulong
      0097A7 5B 08            [ 2] 1073 	addw	sp, #8
                                   1074 ;	stm8s_tim1_main.c: 508: vwRatioReg = (uint16_t)vdwRatioTemp;
      0097A9 1F 0B            [ 2] 1075 	ldw	(0x0b, sp), x
                                   1076 ;	stm8s_tim1_main.c: 509: ccprintf(_DEBUG_CMD_A_, ("mmTim1PWM : vdwDataPeriod (0x%08lx) vbDataRatio (%d)\r\n", vdwDataPeriod, vbDataRatio));
      0097AB 5F               [ 1] 1077 	clrw	x
      0097AC 7B 13            [ 1] 1078 	ld	a, (0x13, sp)
      0097AE 97               [ 1] 1079 	ld	xl, a
      0097AF 89               [ 2] 1080 	pushw	x
      0097B0 1E 13            [ 2] 1081 	ldw	x, (0x13, sp)
      0097B2 89               [ 2] 1082 	pushw	x
      0097B3 1E 13            [ 2] 1083 	ldw	x, (0x13, sp)
      0097B5 89               [ 2] 1084 	pushw	x
      0097B6 4B 70            [ 1] 1085 	push	#<(__str_23+0)
      0097B8 4B 82            [ 1] 1086 	push	#((__str_23+0) >> 8)
      0097BA CD B0 3B         [ 4] 1087 	call	_mib_printf
      0097BD 5B 08            [ 2] 1088 	addw	sp, #8
                                   1089 ;	stm8s_tim1_main.c: 510: ccprintf(_DEBUG_CMD_A_, ("mmTim1PWM : vwPSCR (0x%04x) vwCNTR (0x%04x) vwRatioReg (0x%04x)\r\n", vwPSCR, vwCNTR,vwRatioReg));
      0097BF 1E 0B            [ 2] 1090 	ldw	x, (0x0b, sp)
      0097C1 89               [ 2] 1091 	pushw	x
      0097C2 1E 05            [ 2] 1092 	ldw	x, (0x05, sp)
      0097C4 89               [ 2] 1093 	pushw	x
      0097C5 1E 05            [ 2] 1094 	ldw	x, (0x05, sp)
      0097C7 89               [ 2] 1095 	pushw	x
      0097C8 4B A7            [ 1] 1096 	push	#<(__str_24+0)
      0097CA 4B 82            [ 1] 1097 	push	#((__str_24+0) >> 8)
      0097CC CD B0 3B         [ 4] 1098 	call	_mib_printf
      0097CF 5B 08            [ 2] 1099 	addw	sp, #8
                                   1100 ;	stm8s_tim1_main.c: 535: TIM1_DeInit();
      0097D1 CD 99 42         [ 4] 1101 	call	_TIM1_DeInit
                                   1102 ;	stm8s_tim1_main.c: 536: TIM1_TimeBaseInit(vwPSCR, TIM1_COUNTERMODE_UP, vwCNTR, 0);
      0097D4 4B 00            [ 1] 1103 	push	#0x00
      0097D6 1E 04            [ 2] 1104 	ldw	x, (0x04, sp)
      0097D8 89               [ 2] 1105 	pushw	x
      0097D9 4F               [ 1] 1106 	clr	a
      0097DA 1E 04            [ 2] 1107 	ldw	x, (0x04, sp)
      0097DC CD 99 DB         [ 4] 1108 	call	_TIM1_TimeBaseInit
                                   1109 ;	stm8s_tim1_main.c: 549: TIM1_SelectOCxM(vbChannelNumber, TIM1_OCMODE_PWM2);
      0097DF 4B 70            [ 1] 1110 	push	#0x70
      0097E1 7B 15            [ 1] 1111 	ld	a, (0x15, sp)
      0097E3 CD A0 F6         [ 4] 1112 	call	_TIM1_SelectOCxM
                                   1113 ;	stm8s_tim1_main.c: 559: if(vbChannelNumber==TIM1_CHANNEL_1) // ch1
      0097E6 0D 14            [ 1] 1114 	tnz	(0x14, sp)
      0097E8 26 16            [ 1] 1115 	jrne	00122$
                                   1116 ;	stm8s_tim1_main.c: 561: TIM1_SetCompare1(vwRatioReg);
      0097EA 1E 0B            [ 2] 1117 	ldw	x, (0x0b, sp)
      0097EC CD A1 5D         [ 4] 1118 	call	_TIM1_SetCompare1
                                   1119 ;	stm8s_tim1_main.c: 568: TIM1_OC1PolarityConfig(vbLevelState);
      0097EF 7B 16            [ 1] 1120 	ld	a, (0x16, sp)
      0097F1 CD 9F A7         [ 4] 1121 	call	_TIM1_OC1PolarityConfig
                                   1122 ;	stm8s_tim1_main.c: 573: TIM1_OC1NPolarityConfig(vbLevelState);
      0097F4 7B 16            [ 1] 1123 	ld	a, (0x16, sp)
      0097F6 CD 9F BF         [ 4] 1124 	call	_TIM1_OC1NPolarityConfig
                                   1125 ;	stm8s_tim1_main.c: 578: TIM1_OC1PreloadConfig(ENABLE);
      0097F9 A6 01            [ 1] 1126 	ld	a, #0x01
      0097FB CD 9E E3         [ 4] 1127 	call	_TIM1_OC1PreloadConfig
                                   1128 ;	stm8s_tim1_main.c: 579: if(0)
      0097FE 20 4C            [ 2] 1129 	jra	00123$
                                   1130 ;	stm8s_tim1_main.c: 581: TIM1->CCMR1 |= TIM1_CCMR_OCxPE; // : Preload register on TIM1_CCR1 enabled
      009800                       1131 00122$:
                                   1132 ;	stm8s_tim1_main.c: 584: else if(vbChannelNumber==TIM1_CHANNEL_2) // ch2
      009800 7B 14            [ 1] 1133 	ld	a, (0x14, sp)
      009802 4A               [ 1] 1134 	dec	a
      009803 26 16            [ 1] 1135 	jrne	00119$
                                   1136 ;	stm8s_tim1_main.c: 586: TIM1_SetCompare2(vwRatioReg);
      009805 1E 0B            [ 2] 1137 	ldw	x, (0x0b, sp)
      009807 CD A1 66         [ 4] 1138 	call	_TIM1_SetCompare2
                                   1139 ;	stm8s_tim1_main.c: 587: TIM1_OC2PolarityConfig(vbLevelState);
      00980A 7B 16            [ 1] 1140 	ld	a, (0x16, sp)
      00980C CD 9F D7         [ 4] 1141 	call	_TIM1_OC2PolarityConfig
                                   1142 ;	stm8s_tim1_main.c: 588: TIM1_OC2NPolarityConfig(vbLevelState);
      00980F 7B 16            [ 1] 1143 	ld	a, (0x16, sp)
      009811 CD 9F EF         [ 4] 1144 	call	_TIM1_OC2NPolarityConfig
                                   1145 ;	stm8s_tim1_main.c: 589: TIM1_OC2PreloadConfig(ENABLE);
      009814 A6 01            [ 1] 1146 	ld	a, #0x01
      009816 CD 9E FB         [ 4] 1147 	call	_TIM1_OC2PreloadConfig
      009819 20 31            [ 2] 1148 	jra	00123$
      00981B                       1149 00119$:
                                   1150 ;	stm8s_tim1_main.c: 591: else if(vbChannelNumber==TIM1_CHANNEL_3) // ch3
      00981B 7B 14            [ 1] 1151 	ld	a, (0x14, sp)
      00981D A1 02            [ 1] 1152 	cp	a, #0x02
      00981F 26 16            [ 1] 1153 	jrne	00116$
                                   1154 ;	stm8s_tim1_main.c: 593: TIM1_SetCompare3(vwRatioReg);
      009821 1E 0B            [ 2] 1155 	ldw	x, (0x0b, sp)
      009823 CD A1 6F         [ 4] 1156 	call	_TIM1_SetCompare3
                                   1157 ;	stm8s_tim1_main.c: 594: TIM1_OC3PolarityConfig(vbLevelState);
      009826 7B 16            [ 1] 1158 	ld	a, (0x16, sp)
      009828 CD A0 07         [ 4] 1159 	call	_TIM1_OC3PolarityConfig
                                   1160 ;	stm8s_tim1_main.c: 595: TIM1_OC3NPolarityConfig(vbLevelState);
      00982B 7B 16            [ 1] 1161 	ld	a, (0x16, sp)
      00982D CD A0 1F         [ 4] 1162 	call	_TIM1_OC3NPolarityConfig
                                   1163 ;	stm8s_tim1_main.c: 596: TIM1_OC3PreloadConfig(ENABLE);
      009830 A6 01            [ 1] 1164 	ld	a, #0x01
      009832 CD 9F 13         [ 4] 1165 	call	_TIM1_OC3PreloadConfig
      009835 20 15            [ 2] 1166 	jra	00123$
      009837                       1167 00116$:
                                   1168 ;	stm8s_tim1_main.c: 598: else if(vbChannelNumber==TIM1_CHANNEL_4) // ch4
      009837 7B 14            [ 1] 1169 	ld	a, (0x14, sp)
      009839 A1 03            [ 1] 1170 	cp	a, #0x03
      00983B 26 0F            [ 1] 1171 	jrne	00123$
                                   1172 ;	stm8s_tim1_main.c: 600: TIM1_SetCompare4(vwRatioReg);
      00983D 1E 0B            [ 2] 1173 	ldw	x, (0x0b, sp)
      00983F CD A1 78         [ 4] 1174 	call	_TIM1_SetCompare4
                                   1175 ;	stm8s_tim1_main.c: 601: TIM1_OC4PolarityConfig(vbLevelState);
      009842 7B 16            [ 1] 1176 	ld	a, (0x16, sp)
      009844 CD A0 37         [ 4] 1177 	call	_TIM1_OC4PolarityConfig
                                   1178 ;	stm8s_tim1_main.c: 603: TIM1_OC4PreloadConfig(ENABLE);
      009847 A6 01            [ 1] 1179 	ld	a, #0x01
      009849 CD 9F 2B         [ 4] 1180 	call	_TIM1_OC4PreloadConfig
      00984C                       1181 00123$:
                                   1182 ;	stm8s_tim1_main.c: 605: if(vbPinUseFlag&0x1)
      00984C 7B 15            [ 1] 1183 	ld	a, (0x15, sp)
      00984E A5 01            [ 1] 1184 	bcp	a, #0x01
      009850 27 09            [ 1] 1185 	jreq	00127$
                                   1186 ;	stm8s_tim1_main.c: 607: TIM1_CCxCmd(vbChannelNumber, ENABLE);
      009852 88               [ 1] 1187 	push	a
      009853 4B 01            [ 1] 1188 	push	#0x01
      009855 7B 16            [ 1] 1189 	ld	a, (0x16, sp)
      009857 CD A0 4F         [ 4] 1190 	call	_TIM1_CCxCmd
      00985A 84               [ 1] 1191 	pop	a
                                   1192 ;	stm8s_tim1_main.c: 610: TIM1->CCER1 |= TIM1_CCER1_CC1E; // On - OC1 signal is output on the corresponding output pin depending on the MOE, OSSI, OSSR, OIS1, OIS1N and CC1NE bits
      00985B                       1193 00127$:
                                   1194 ;	stm8s_tim1_main.c: 613: if(vbPinUseFlag&0x2)
      00985B A5 02            [ 1] 1195 	bcp	a, #0x02
      00985D 27 07            [ 1] 1196 	jreq	00131$
                                   1197 ;	stm8s_tim1_main.c: 615: TIM1_CCxNCmd(vbChannelNumber, ENABLE);
      00985F 4B 01            [ 1] 1198 	push	#0x01
      009861 7B 15            [ 1] 1199 	ld	a, (0x15, sp)
      009863 CD A0 B0         [ 4] 1200 	call	_TIM1_CCxNCmd
                                   1201 ;	stm8s_tim1_main.c: 618: TIM1->CCER1 |= TIM1_CCER1_CC1NE;
      009866                       1202 00131$:
                                   1203 ;	stm8s_tim1_main.c: 621: TIM1_ARRPreloadConfig(ENABLE);
      009866 A6 01            [ 1] 1204 	ld	a, #0x01
      009868 CD 9E 9B         [ 4] 1205 	call	_TIM1_ARRPreloadConfig
                                   1206 ;	stm8s_tim1_main.c: 626: if(vbPulseState)
      00986B 0D 17            [ 1] 1207 	tnz	(0x17, sp)
      00986D 27 09            [ 1] 1208 	jreq	00135$
                                   1209 ;	stm8s_tim1_main.c: 628: TIM1_SelectOnePulseMode(TIM1_OPMODE_SINGLE);
      00986F A6 01            [ 1] 1210 	ld	a, #0x01
      009871 CD 9D A4         [ 4] 1211 	call	_TIM1_SelectOnePulseMode
                                   1212 ;	stm8s_tim1_main.c: 630: TIM1->EGR = 0xFF;
      009874 35 FF 52 57      [ 1] 1213 	mov	0x5257+0, #0xff
      009878                       1214 00135$:
                                   1215 ;	stm8s_tim1_main.c: 633: TIM1_CtrlPWMOutputs(ENABLE);
      009878 A6 01            [ 1] 1216 	ld	a, #0x01
      00987A CD 9C 94         [ 4] 1217 	call	_TIM1_CtrlPWMOutputs
                                   1218 ;	stm8s_tim1_main.c: 639: TIM1_Cmd(ENABLE);
      00987D A6 01            [ 1] 1219 	ld	a, #0x01
      00987F CD 9C 7C         [ 4] 1220 	call	_TIM1_Cmd
                                   1221 ;	stm8s_tim1_main.c: 647: return 1;
      009882 5F               [ 1] 1222 	clrw	x
      009883 5C               [ 1] 1223 	incw	x
                                   1224 ;	stm8s_tim1_main.c: 648: }
      009884 16 0D            [ 2] 1225 	ldw	y, (13, sp)
      009886 5B 17            [ 2] 1226 	addw	sp, #23
      009888 90 FC            [ 2] 1227 	jp	(y)
                                   1228 ;	stm8s_tim1_main.c: 667: int mmTim1CalPscrCntr(uint32_t vdwDelayUsec, uint16_t *pvwPSCR, uint16_t *pvwCNTR)
                                   1229 ;	-----------------------------------------
                                   1230 ;	 function mmTim1CalPscrCntr
                                   1231 ;	-----------------------------------------
      00988A                       1232 _mmTim1CalPscrCntr:
      00988A 52 04            [ 2] 1233 	sub	sp, #4
                                   1234 ;	stm8s_tim1_main.c: 669: uint32_t vdwMask = vdwDelayUsec;
      00988C 16 09            [ 2] 1235 	ldw	y, (0x09, sp)
      00988E 1E 07            [ 2] 1236 	ldw	x, (0x07, sp)
                                   1237 ;	stm8s_tim1_main.c: 674: for (vbIndex = 0; vbIndex < 32; vbIndex++)
      009890 4F               [ 1] 1238 	clr	a
      009891                       1239 00109$:
                                   1240 ;	stm8s_tim1_main.c: 676: if (vdwMask & 0x80000000)
      009891 5D               [ 2] 1241 	tnzw	x
      009892 2B 08            [ 1] 1242 	jrmi	00103$
                                   1243 ;	stm8s_tim1_main.c: 680: vdwMask <<= 1;
      009894 90 58            [ 2] 1244 	sllw	y
      009896 59               [ 2] 1245 	rlcw	x
                                   1246 ;	stm8s_tim1_main.c: 674: for (vbIndex = 0; vbIndex < 32; vbIndex++)
      009897 4C               [ 1] 1247 	inc	a
      009898 A1 20            [ 1] 1248 	cp	a, #0x20
      00989A 25 F5            [ 1] 1249 	jrc	00109$
      00989C                       1250 00103$:
                                   1251 ;	stm8s_tim1_main.c: 682: vbMaxBitDelay = 31 - vbIndex;
      00989C 6B 04            [ 1] 1252 	ld	(0x04, sp), a
      00989E A6 1F            [ 1] 1253 	ld	a, #0x1f
      0098A0 10 04            [ 1] 1254 	sub	a, (0x04, sp)
                                   1255 ;	stm8s_tim1_main.c: 683: ccprintf(_DEBUG_CMD_A_, ("mmTim1CalPscrCntr : vbMaxBitDelay : %d\r\n", vbMaxBitDelay));
      0098A2 5F               [ 1] 1256 	clrw	x
      0098A3 97               [ 1] 1257 	ld	xl, a
      0098A4 88               [ 1] 1258 	push	a
      0098A5 89               [ 2] 1259 	pushw	x
      0098A6 4B E9            [ 1] 1260 	push	#<(__str_25+0)
      0098A8 4B 82            [ 1] 1261 	push	#((__str_25+0) >> 8)
      0098AA CD B0 3B         [ 4] 1262 	call	_mib_printf
      0098AD 5B 04            [ 2] 1263 	addw	sp, #4
      0098AF 84               [ 1] 1264 	pop	a
                                   1265 ;	stm8s_tim1_main.c: 684: if (vbMaxBitDelay <= 15)
      0098B0 A1 0F            [ 1] 1266 	cp	a, #0x0f
      0098B2 22 04            [ 1] 1267 	jrugt	00107$
                                   1268 ;	stm8s_tim1_main.c: 686: vbMaxBitDelay = 15;
      0098B4 A6 0F            [ 1] 1269 	ld	a, #0x0f
      0098B6 20 06            [ 2] 1270 	jra	00108$
      0098B8                       1271 00107$:
                                   1272 ;	stm8s_tim1_main.c: 688: else if(vbMaxBitDelay >= (31-5)) // 2 ^ 5 = 32 > (_MM_CK_PSC_/1000000) =  16
      0098B8 A1 1A            [ 1] 1273 	cp	a, #0x1a
      0098BA 25 02            [ 1] 1274 	jrc	00108$
                                   1275 ;	stm8s_tim1_main.c: 690: vbMaxBitDelay = 31-5;
      0098BC A6 1A            [ 1] 1276 	ld	a, #0x1a
      0098BE                       1277 00108$:
                                   1278 ;	stm8s_tim1_main.c: 692: vbPscrBitData = vbMaxBitDelay - 15;
      0098BE A0 0F            [ 1] 1279 	sub	a, #0x0f
                                   1280 ;	stm8s_tim1_main.c: 693: *pvwPSCR = (1 << vbPscrBitData) * (_MM_CK_PSC_/1000000) - 1;
      0098C0 16 0B            [ 2] 1281 	ldw	y, (0x0b, sp)
      0098C2 88               [ 1] 1282 	push	a
      0098C3 5F               [ 1] 1283 	clrw	x
      0098C4 5C               [ 1] 1284 	incw	x
      0098C5 4D               [ 1] 1285 	tnz	a
      0098C6 27 04            [ 1] 1286 	jreq	00139$
      0098C8                       1287 00138$:
      0098C8 58               [ 2] 1288 	sllw	x
      0098C9 4A               [ 1] 1289 	dec	a
      0098CA 26 FC            [ 1] 1290 	jrne	00138$
      0098CC                       1291 00139$:
      0098CC 84               [ 1] 1292 	pop	a
      0098CD 58               [ 2] 1293 	sllw	x
      0098CE 58               [ 2] 1294 	sllw	x
      0098CF 58               [ 2] 1295 	sllw	x
      0098D0 58               [ 2] 1296 	sllw	x
      0098D1 5A               [ 2] 1297 	decw	x
      0098D2 1F 01            [ 2] 1298 	ldw	(0x01, sp), x
      0098D4 93               [ 1] 1299 	ldw	x, y
      0098D5 16 01            [ 2] 1300 	ldw	y, (0x01, sp)
      0098D7 FF               [ 2] 1301 	ldw	(x), y
                                   1302 ;	stm8s_tim1_main.c: 694: *pvwCNTR = vdwDelayUsec >> vbPscrBitData;
      0098D8 16 0D            [ 2] 1303 	ldw	y, (0x0d, sp)
      0098DA 17 03            [ 2] 1304 	ldw	(0x03, sp), y
      0098DC 16 09            [ 2] 1305 	ldw	y, (0x09, sp)
      0098DE 1E 07            [ 2] 1306 	ldw	x, (0x07, sp)
      0098E0 4D               [ 1] 1307 	tnz	a
      0098E1 27 06            [ 1] 1308 	jreq	00141$
      0098E3                       1309 00140$:
      0098E3 54               [ 2] 1310 	srlw	x
      0098E4 90 56            [ 2] 1311 	rrcw	y
      0098E6 4A               [ 1] 1312 	dec	a
      0098E7 26 FA            [ 1] 1313 	jrne	00140$
      0098E9                       1314 00141$:
      0098E9 1E 03            [ 2] 1315 	ldw	x, (0x03, sp)
      0098EB FF               [ 2] 1316 	ldw	(x), y
                                   1317 ;	stm8s_tim1_main.c: 695: ccprintf(_DEBUG_CMD_A_, ("mmTim1CalPscrCntr : vwPSCR (0x%04x) vwCNTR (0x%04x) vdwDelayUsec [0x%08lx]\r\n", *pvwPSCR, *pvwCNTR, vdwDelayUsec));
      0098EC 1E 09            [ 2] 1318 	ldw	x, (0x09, sp)
      0098EE 89               [ 2] 1319 	pushw	x
      0098EF 1E 09            [ 2] 1320 	ldw	x, (0x09, sp)
      0098F1 89               [ 2] 1321 	pushw	x
      0098F2 90 89            [ 2] 1322 	pushw	y
      0098F4 1E 07            [ 2] 1323 	ldw	x, (0x07, sp)
      0098F6 89               [ 2] 1324 	pushw	x
      0098F7 4B 12            [ 1] 1325 	push	#<(__str_26+0)
      0098F9 4B 83            [ 1] 1326 	push	#((__str_26+0) >> 8)
      0098FB CD B0 3B         [ 4] 1327 	call	_mib_printf
      0098FE 5B 0A            [ 2] 1328 	addw	sp, #10
                                   1329 ;	stm8s_tim1_main.c: 697: return 1;
      009900 5F               [ 1] 1330 	clrw	x
      009901 5C               [ 1] 1331 	incw	x
                                   1332 ;	stm8s_tim1_main.c: 698: }
      009902 16 05            [ 2] 1333 	ldw	y, (5, sp)
      009904 5B 0E            [ 2] 1334 	addw	sp, #14
      009906 90 FC            [ 2] 1335 	jp	(y)
                                   1336 ;	stm8s_tim1_main.c: 702: int mmTim1GpioInit(void)
                                   1337 ;	-----------------------------------------
                                   1338 ;	 function mmTim1GpioInit
                                   1339 ;	-----------------------------------------
      009908                       1340 _mmTim1GpioInit:
                                   1341 ;	stm8s_tim1_main.c: 710: UCOM_LED1_GPIO->ODR &= (uint8_t)(~(UCOM_LED1_PIN)); /* Output mode  Low level */
      009908 72 11 50 0F      [ 1] 1342 	bres	0x500f, #0
                                   1343 ;	stm8s_tim1_main.c: 711: UCOM_LED1_GPIO->DDR |= (uint8_t)UCOM_LED1_PIN;      /* Set Output mode */
      00990C 72 10 50 11      [ 1] 1344 	bset	0x5011, #0
                                   1345 ;	stm8s_tim1_main.c: 712: UCOM_LED1_GPIO->CR1 |= (uint8_t)UCOM_LED1_PIN;      /* Push-Pull */
      009910 72 10 50 12      [ 1] 1346 	bset	0x5012, #0
                                   1347 ;	stm8s_tim1_main.c: 714: UCOM_LED1_GPIO->CR2 |= (uint8_t)UCOM_LED1_PIN; /* 10MHz */
      009914 72 10 50 13      [ 1] 1348 	bset	0x5013, #0
                                   1349 ;	stm8s_tim1_main.c: 720: UCOM_KEY1_GPIO->DDR &= (uint8_t)(~(UCOM_KEY1_PIN)); /* Set Input mode */
      009918 72 17 50 02      [ 1] 1350 	bres	0x5002, #3
                                   1351 ;	stm8s_tim1_main.c: 722: UCOM_KEY1_GPIO->CR1 &= (uint8_t)(~(UCOM_KEY1_PIN)); /* Float */
      00991C 72 17 50 03      [ 1] 1352 	bres	0x5003, #3
                                   1353 ;	stm8s_tim1_main.c: 724: UCOM_KEY1_GPIO->CR2 &= (uint8_t)(~(UCOM_KEY1_PIN)); /* External interrupt disable */
      009920 72 17 50 04      [ 1] 1354 	bres	0x5004, #3
                                   1355 ;	stm8s_tim1_main.c: 727: return 1;
      009924 5F               [ 1] 1356 	clrw	x
      009925 5C               [ 1] 1357 	incw	x
                                   1358 ;	stm8s_tim1_main.c: 728: }
      009926 81               [ 4] 1359 	ret
                                   1360 ;	stm8s_tim1_main.c: 732: void mmRemapCH1N_CH2N_CH3N_ETR(void)
                                   1361 ;	-----------------------------------------
                                   1362 ;	 function mmRemapCH1N_CH2N_CH3N_ETR
                                   1363 ;	-----------------------------------------
      009927                       1364 _mmRemapCH1N_CH2N_CH3N_ETR:
                                   1365 ;	stm8s_tim1_main.c: 739: if(FLASH_ReadByte(OPT2_REG)!=AFR5_BIT) 
      009927 4B 03            [ 1] 1366 	push	#0x03
      009929 4B 48            [ 1] 1367 	push	#0x48
      00992B 5F               [ 1] 1368 	clrw	x
      00992C 89               [ 2] 1369 	pushw	x
      00992D CD A3 E3         [ 4] 1370 	call	_FLASH_ReadByte
      009930 A1 20            [ 1] 1371 	cp	a, #0x20
      009932 26 01            [ 1] 1372 	jrne	00111$
      009934 81               [ 4] 1373 	ret
      009935                       1374 00111$:
                                   1375 ;	stm8s_tim1_main.c: 741: FLASH_Unlock(FLASH_MEMTYPE_DATA); 
      009935 A6 F7            [ 1] 1376 	ld	a, #0xf7
      009937 CD A3 7E         [ 4] 1377 	call	_FLASH_Unlock
                                   1378 ;	stm8s_tim1_main.c: 743: FLASH_ProgramOptionByte(OPT2_REG,AFR5_BIT); 
      00993A A6 20            [ 1] 1379 	ld	a, #0x20
      00993C AE 48 03         [ 2] 1380 	ldw	x, #0x4803
                                   1381 ;	stm8s_tim1_main.c: 747: }
      00993F CC A4 27         [ 2] 1382 	jp	_FLASH_ProgramOptionByte
                                   1383 	.area CODE
                                   1384 	.area CONST
                                   1385 	.area CONST
      00808F                       1386 __str_0:
      00808F 49 4E 46 4F 3A 2B 63  1387 	.ascii "INFO:+cmd_tim1..."
             6D 64 5F 74 69 6D 31
             2E 2E 2E
      0080A0 0D                    1388 	.db 0x0d
      0080A1 0A                    1389 	.db 0x0a
      0080A2 00                    1390 	.db 0x00
                                   1391 	.area CODE
                                   1392 	.area CONST
      0080A3                       1393 __str_1:
      0080A3 49 4E 46 4F 3A 2D 63  1394 	.ascii "INFO:-cmd_tim1..."
             6D 64 5F 74 69 6D 31
             2E 2E 2E
      0080B4 0D                    1395 	.db 0x0d
      0080B5 0A                    1396 	.db 0x0a
      0080B6 00                    1397 	.db 0x00
                                   1398 	.area CODE
                                   1399 	.area CONST
      0080B7                       1400 ___str_2:
      0080B7 77 72 69 74 65        1401 	.ascii "write"
      0080BC 00                    1402 	.db 0x00
                                   1403 	.area CODE
                                   1404 	.area CONST
      0080BD                       1405 __str_3:
      0080BD 49 6C 6C 75 67 61 6C  1406 	.ascii "Illugal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      0080D7 0D                    1407 	.db 0x0d
      0080D8 0A                    1408 	.db 0x0a
      0080D9 00                    1409 	.db 0x00
                                   1410 	.area CODE
                                   1411 	.area CONST
      0080DA                       1412 __str_4:
      0080DA 77 72 5F 41 44 44 52  1413 	.ascii "wr_ADDR8 : 0x%08lx[0x%02x]"
             38 20 3A 20 30 78 25
             30 38 6C 78 5B 30 78
             25 30 32 78 5D
      0080F4 0D                    1414 	.db 0x0d
      0080F5 0A                    1415 	.db 0x0a
      0080F6 00                    1416 	.db 0x00
                                   1417 	.area CODE
                                   1418 	.area CONST
      0080F7                       1419 ___str_5:
      0080F7 72 65 61 64           1420 	.ascii "read"
      0080FB 00                    1421 	.db 0x00
                                   1422 	.area CODE
                                   1423 	.area CONST
      0080FC                       1424 __str_6:
      0080FC 72 64 5F 41 44 44 52  1425 	.ascii "rd_ADDR8 : 0x%08lx[0x%02x]"
             38 20 3A 20 30 78 25
             30 38 6C 78 5B 30 78
             25 30 32 78 5D
      008116 0D                    1426 	.db 0x0d
      008117 0A                    1427 	.db 0x0a
      008118 00                    1428 	.db 0x00
                                   1429 	.area CODE
                                   1430 	.area CONST
      008119                       1431 ___str_7:
      008119 6F 6E 65 70 75 6C 73  1432 	.ascii "onepulse"
             65
      008121 00                    1433 	.db 0x00
                                   1434 	.area CODE
                                   1435 	.area CONST
      008122                       1436 ___str_8:
      008122 6C 6F 77              1437 	.ascii "low"
      008125 00                    1438 	.db 0x00
                                   1439 	.area CODE
                                   1440 	.area CONST
      008126                       1441 ___str_9:
      008126 70 77 6D              1442 	.ascii "pwm"
      008129 00                    1443 	.db 0x00
                                   1444 	.area CODE
                                   1445 	.area CONST
      00812A                       1446 __str_10:
      00812A 6D 6D 54 69 6D 31 20  1447 	.ascii "mmTim1 : vdwDataPeriod (0x%08lx) vbDataRatio (%d)"
             3A 20 76 64 77 44 61
             74 61 50 65 72 69 6F
             64 20 28 30 78 25 30
             38 6C 78 29 20 76 62
             44 61 74 61 52 61 74
             69 6F 20 28 25 64 29
      00815B 0D                    1448 	.db 0x0d
      00815C 0A                    1449 	.db 0x0a
      00815D 00                    1450 	.db 0x00
                                   1451 	.area CODE
                                   1452 	.area CONST
      00815E                       1453 __str_11:
      00815E 6D 6D 54 69 6D 31 20  1454 	.ascii "mmTim1 : vbChannelNumber (%d) vbPinUseFlag (%d) vbLevelState"
             3A 20 76 62 43 68 61
             6E 6E 65 6C 4E 75 6D
             62 65 72 20 28 25 64
             29 20 76 62 50 69 6E
             55 73 65 46 6C 61 67
             20 28 25 64 29 20 76
             62 4C 65 76 65 6C 53
             74 61 74 65
      00819A 20 28 25 64 29        1455 	.ascii " (%d)"
      00819F 0D                    1456 	.db 0x0d
      0081A0 0A                    1457 	.db 0x0a
      0081A1 00                    1458 	.db 0x00
                                   1459 	.area CODE
                                   1460 	.area CONST
      0081A2                       1461 ___str_12:
      0081A2 72 65 6D 61 70        1462 	.ascii "remap"
      0081A7 00                    1463 	.db 0x00
                                   1464 	.area CODE
                                   1465 	.area CONST
      0081A8                       1466 ___str_13:
      0081A8 73 65 74              1467 	.ascii "set"
      0081AB 00                    1468 	.db 0x00
                                   1469 	.area CODE
                                   1470 	.area CONST
      0081AC                       1471 ___str_14:
      0081AC 72 65 73 65 74        1472 	.ascii "reset"
      0081B1 00                    1473 	.db 0x00
                                   1474 	.area CODE
                                   1475 	.area CONST
      0081B2                       1476 __str_15:
      0081B2 74 69 6D 31 20 69 6E  1477 	.ascii "tim1 init....error !!!"
             69 74 2E 2E 2E 2E 65
             72 72 6F 72 20 21 21
             21
      0081C8 0D                    1478 	.db 0x0d
      0081C9 0A                    1479 	.db 0x0a
      0081CA 00                    1480 	.db 0x00
                                   1481 	.area CODE
                                   1482 	.area CONST
      0081CB                       1483 __str_16:
      0081CB 74 69 6D 31 20 69 6E  1484 	.ascii "tim1 init....(0x%02X)"
             69 74 2E 2E 2E 2E 28
             30 78 25 30 32 58 29
      0081E0 0D                    1485 	.db 0x0d
      0081E1 0A                    1486 	.db 0x0a
      0081E2 00                    1487 	.db 0x00
                                   1488 	.area CODE
                                   1489 	.area CONST
      0081E3                       1490 __str_17:
      0081E3 74 69 6D 31 20 41 46  1491 	.ascii "tim1 AFR5....(0x%x)"
             52 35 2E 2E 2E 2E 28
             30 78 25 78 29
      0081F6 0D                    1492 	.db 0x0d
      0081F7 0A                    1493 	.db 0x0a
      0081F8 00                    1494 	.db 0x00
                                   1495 	.area CODE
                                   1496 	.area CONST
      0081F9                       1497 ___str_18:
      0081F9 69 6E 69 74           1498 	.ascii "init"
      0081FD 00                    1499 	.db 0x00
                                   1500 	.area CODE
                                   1501 	.area CONST
      0081FE                       1502 __str_19:
      0081FE 74 69 6D 31 20 72 65  1503 	.ascii "tim1 reset....(0x%02X)"
             73 65 74 2E 2E 2E 2E
             28 30 78 25 30 32 58
             29
      008214 0D                    1504 	.db 0x0d
      008215 0A                    1505 	.db 0x0a
      008216 00                    1506 	.db 0x00
                                   1507 	.area CODE
                                   1508 	.area CONST
      008217                       1509 ___str_20:
      008217 68 65 6C 70           1510 	.ascii "help"
      00821B 00                    1511 	.db 0x00
                                   1512 	.area CODE
                                   1513 	.area CONST
      00821C                       1514 __str_21:
      00821C 54 49 4D 31 5F 42 61  1515 	.ascii "TIM1_BaseAddress : 0x%04x"
             73 65 41 64 64 72 65
             73 73 20 3A 20 30 78
             25 30 34 78
      008235 0D                    1516 	.db 0x0d
      008236 0A                    1517 	.db 0x0a
      008237 00                    1518 	.db 0x00
                                   1519 	.area CODE
                                   1520 	.area CONST
      008238                       1521 __str_22:
      008238 6D 6D 54 69 6D 31 4F  1522 	.ascii "mmTim1Onepulse : vdwPeriod (0x%08lx) vbDataRatio (%d)"
             6E 65 70 75 6C 73 65
             20 3A 20 76 64 77 50
             65 72 69 6F 64 20 28
             30 78 25 30 38 6C 78
             29 20 76 62 44 61 74
             61 52 61 74 69 6F 20
             28 25 64 29
      00826D 0D                    1523 	.db 0x0d
      00826E 0A                    1524 	.db 0x0a
      00826F 00                    1525 	.db 0x00
                                   1526 	.area CODE
                                   1527 	.area CONST
      008270                       1528 __str_23:
      008270 6D 6D 54 69 6D 31 50  1529 	.ascii "mmTim1PWM : vdwDataPeriod (0x%08lx) vbDataRatio (%d)"
             57 4D 20 3A 20 76 64
             77 44 61 74 61 50 65
             72 69 6F 64 20 28 30
             78 25 30 38 6C 78 29
             20 76 62 44 61 74 61
             52 61 74 69 6F 20 28
             25 64 29
      0082A4 0D                    1530 	.db 0x0d
      0082A5 0A                    1531 	.db 0x0a
      0082A6 00                    1532 	.db 0x00
                                   1533 	.area CODE
                                   1534 	.area CONST
      0082A7                       1535 __str_24:
      0082A7 6D 6D 54 69 6D 31 50  1536 	.ascii "mmTim1PWM : vwPSCR (0x%04x) vwCNTR (0x%04x) vwRatioReg (0x%0"
             57 4D 20 3A 20 76 77
             50 53 43 52 20 28 30
             78 25 30 34 78 29 20
             76 77 43 4E 54 52 20
             28 30 78 25 30 34 78
             29 20 76 77 52 61 74
             69 6F 52 65 67 20 28
             30 78 25 30
      0082E3 34 78 29              1537 	.ascii "4x)"
      0082E6 0D                    1538 	.db 0x0d
      0082E7 0A                    1539 	.db 0x0a
      0082E8 00                    1540 	.db 0x00
                                   1541 	.area CODE
                                   1542 	.area CONST
      0082E9                       1543 __str_25:
      0082E9 6D 6D 54 69 6D 31 43  1544 	.ascii "mmTim1CalPscrCntr : vbMaxBitDelay : %d"
             61 6C 50 73 63 72 43
             6E 74 72 20 3A 20 76
             62 4D 61 78 42 69 74
             44 65 6C 61 79 20 3A
             20 25 64
      00830F 0D                    1545 	.db 0x0d
      008310 0A                    1546 	.db 0x0a
      008311 00                    1547 	.db 0x00
                                   1548 	.area CODE
                                   1549 	.area CONST
      008312                       1550 __str_26:
      008312 6D 6D 54 69 6D 31 43  1551 	.ascii "mmTim1CalPscrCntr : vwPSCR (0x%04x) vwCNTR (0x%04x) vdwDelay"
             61 6C 50 73 63 72 43
             6E 74 72 20 3A 20 76
             77 50 53 43 52 20 28
             30 78 25 30 34 78 29
             20 76 77 43 4E 54 52
             20 28 30 78 25 30 34
             78 29 20 76 64 77 44
             65 6C 61 79
      00834E 55 73 65 63 20 5B 30  1552 	.ascii "Usec [0x%08lx]"
             78 25 30 38 6C 78 5D
      00835C 0D                    1553 	.db 0x0d
      00835D 0A                    1554 	.db 0x0a
      00835E 00                    1555 	.db 0x00
                                   1556 	.area CODE
                                   1557 	.area CONST
      00835F                       1558 ___str_27:
      00835F 74 79 70 65 64 65 66  1559 	.ascii "typedef struct TIM1_struct"
             20 73 74 72 75 63 74
             20 54 49 4D 31 5F 73
             74 72 75 63 74
      008379 0D                    1560 	.db 0x0d
      00837A 0A                    1561 	.db 0x0a
      00837B 7B                    1562 	.ascii "{"
      00837C 0D                    1563 	.db 0x0d
      00837D 0A                    1564 	.db 0x0a
      00837E 30 78 30 30 3A 5F 5F  1565 	.ascii "0x00:__IO uint8_t CR1;   /*!< control register 1 */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 43 52 31
             3B 20 20 20 2F 2A 21
             3C 20 63 6F 6E 74 72
             6F 6C 20 72 65 67 69
             73 74 65 72 20 31 20
             2A 2F
      0083B1 0D                    1566 	.db 0x0d
      0083B2 0A                    1567 	.db 0x0a
      0083B3 30 78 30 31 3A 5F 5F  1568 	.ascii "0x01:__IO uint8_t CR2;   /*!< control register 2 */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 43 52 32
             3B 20 20 20 2F 2A 21
             3C 20 63 6F 6E 74 72
             6F 6C 20 72 65 67 69
             73 74 65 72 20 32 20
             2A 2F
      0083E6 0D                    1569 	.db 0x0d
      0083E7 0A                    1570 	.db 0x0a
      0083E8 30 78 30 32 3A 5F 5F  1571 	.ascii "0x02:__IO uint8_t SMCR;  /*!< Synchro mode control register "
             49 4F 20 75 69 6E 74
             38 5F 74 20 53 4D 43
             52 3B 20 20 2F 2A 21
             3C 20 53 79 6E 63 68
             72 6F 20 6D 6F 64 65
             20 63 6F 6E 74 72 6F
             6C 20 72 65 67 69 73
             74 65 72 20
      008424 2A 2F                 1572 	.ascii "*/"
      008426 0D                    1573 	.db 0x0d
      008427 0A                    1574 	.db 0x0a
      008428 30 78 30 33 3A 5F 5F  1575 	.ascii "0x03:__IO uint8_t ETR;   /*!< external trigger register */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 45 54 52
             3B 20 20 20 2F 2A 21
             3C 20 65 78 74 65 72
             6E 61 6C 20 74 72 69
             67 67 65 72 20 72 65
             67 69 73 74 65 72 20
             2A 2F
      008462 0D                    1576 	.db 0x0d
      008463 0A                    1577 	.db 0x0a
      008464 30 78 30 34 3A 5F 5F  1578 	.ascii "0x04:__IO uint8_t IER;   /*!< interrupt enable register*/"
             49 4F 20 75 69 6E 74
             38 5F 74 20 49 45 52
             3B 20 20 20 2F 2A 21
             3C 20 69 6E 74 65 72
             72 75 70 74 20 65 6E
             61 62 6C 65 20 72 65
             67 69 73 74 65 72 2A
             2F
      00849D 0D                    1579 	.db 0x0d
      00849E 0A                    1580 	.db 0x0a
      00849F 30 78 30 35 3A 5F 5F  1581 	.ascii "0x05:__IO uint8_t SR1;   /*!< status register 1 */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 53 52 31
             3B 20 20 20 2F 2A 21
             3C 20 73 74 61 74 75
             73 20 72 65 67 69 73
             74 65 72 20 31 20 2A
             2F
      0084D1 0D                    1582 	.db 0x0d
      0084D2 0A                    1583 	.db 0x0a
      0084D3 30 78 30 36 3A 5F 5F  1584 	.ascii "0x06:__IO uint8_t SR2;   /*!< status register 2 */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 53 52 32
             3B 20 20 20 2F 2A 21
             3C 20 73 74 61 74 75
             73 20 72 65 67 69 73
             74 65 72 20 32 20 2A
             2F
      008505 0D                    1585 	.db 0x0d
      008506 0A                    1586 	.db 0x0a
      008507 30 78 30 37 3A 5F 5F  1587 	.ascii "0x07:__IO uint8_t EGR;   /*!< event generation register */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 45 47 52
             3B 20 20 20 2F 2A 21
             3C 20 65 76 65 6E 74
             20 67 65 6E 65 72 61
             74 69 6F 6E 20 72 65
             67 69 73 74 65 72 20
             2A 2F
      008541 0D                    1588 	.db 0x0d
      008542 0A                    1589 	.db 0x0a
      008543 30 78 30 38 3A 5F 5F  1590 	.ascii "0x08:__IO uint8_t CCMR1; /*!< CC mode register 1 */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 43 43 4D
             52 31 3B 20 2F 2A 21
             3C 20 43 43 20 6D 6F
             64 65 20 72 65 67 69
             73 74 65 72 20 31 20
             2A 2F
      008576 0D                    1591 	.db 0x0d
      008577 0A                    1592 	.db 0x0a
      008578 30 78 30 39 3A 5F 5F  1593 	.ascii "0x09:__IO uint8_t CCMR2; /*!< CC mode register 2 */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 43 43 4D
             52 32 3B 20 2F 2A 21
             3C 20 43 43 20 6D 6F
             64 65 20 72 65 67 69
             73 74 65 72 20 32 20
             2A 2F
      0085AB 0D                    1594 	.db 0x0d
      0085AC 0A                    1595 	.db 0x0a
      0085AD 30 78 30 61 3A 5F 5F  1596 	.ascii "0x0a:__IO uint8_t CCMR3; /*!< CC mode register 3 */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 43 43 4D
             52 33 3B 20 2F 2A 21
             3C 20 43 43 20 6D 6F
             64 65 20 72 65 67 69
             73 74 65 72 20 33 20
             2A 2F
      0085E0 0D                    1597 	.db 0x0d
      0085E1 0A                    1598 	.db 0x0a
      0085E2 30 78 30 62 3A 5F 5F  1599 	.ascii "0x0b:__IO uint8_t CCMR4; /*!< CC mode register 4 */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 43 43 4D
             52 34 3B 20 2F 2A 21
             3C 20 43 43 20 6D 6F
             64 65 20 72 65 67 69
             73 74 65 72 20 34 20
             2A 2F
      008615 0D                    1600 	.db 0x0d
      008616 0A                    1601 	.db 0x0a
      008617 30 78 30 63 3A 5F 5F  1602 	.ascii "0x0c:__IO uint8_t CCER1; /*!< CC enable register 1 */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 43 43 45
             52 31 3B 20 2F 2A 21
             3C 20 43 43 20 65 6E
             61 62 6C 65 20 72 65
             67 69 73 74 65 72 20
             31 20 2A 2F
      00864C 0D                    1603 	.db 0x0d
      00864D 0A                    1604 	.db 0x0a
      00864E 30 78 30 64 3A 5F 5F  1605 	.ascii "0x0d:__IO uint8_t CCER2; /*!< CC enable register 2 */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 43 43 45
             52 32 3B 20 2F 2A 21
             3C 20 43 43 20 65 6E
             61 62 6C 65 20 72 65
             67 69 73 74 65 72 20
             32 20 2A 2F
      008683 0D                    1606 	.db 0x0d
      008684 0A                    1607 	.db 0x0a
      008685 30 78 30 65 3A 5F 5F  1608 	.ascii "0x0e:__IO uint8_t CNTRH; /*!< counter high */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 43 4E 54
             52 48 3B 20 2F 2A 21
             3C 20 63 6F 75 6E 74
             65 72 20 68 69 67 68
             20 2A 2F
      0086B2 0D                    1609 	.db 0x0d
      0086B3 0A                    1610 	.db 0x0a
      0086B4 30 78 30 66 3A 5F 5F  1611 	.ascii "0x0f:__IO uint8_t CNTRL; /*!< counter low */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 43 4E 54
             52 4C 3B 20 2F 2A 21
             3C 20 63 6F 75 6E 74
             65 72 20 6C 6F 77 20
             2A 2F
      0086E0 0D                    1612 	.db 0x0d
      0086E1 0A                    1613 	.db 0x0a
      0086E2 30 78 31 30 3A 5F 5F  1614 	.ascii "0x10:__IO uint8_t PSCRH; /*!< prescaler high */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 50 53 43
             52 48 3B 20 2F 2A 21
             3C 20 70 72 65 73 63
             61 6C 65 72 20 68 69
             67 68 20 2A 2F
      008711 0D                    1615 	.db 0x0d
      008712 0A                    1616 	.db 0x0a
      008713 30 78 31 31 3A 5F 5F  1617 	.ascii "0x11:__IO uint8_t PSCRL; /*!< prescaler low */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 50 53 43
             52 4C 3B 20 2F 2A 21
             3C 20 70 72 65 73 63
             61 6C 65 72 20 6C 6F
             77 20 2A 2F
      008741 0D                    1618 	.db 0x0d
      008742 0A                    1619 	.db 0x0a
      008743 30 78 31 32 3A 5F 5F  1620 	.ascii "0x12:__IO uint8_t ARRH;  /*!< auto-reload register high */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 41 52 52
             48 3B 20 20 2F 2A 21
             3C 20 61 75 74 6F 2D
             72 65 6C 6F 61 64 20
             72 65 67 69 73 74 65
             72 20 68 69 67 68 20
             2A 2F
      00877D 0D                    1621 	.db 0x0d
      00877E 0A                    1622 	.db 0x0a
      00877F 30 78 31 33 3A 5F 5F  1623 	.ascii "0x13:__IO uint8_t ARRL;  /*!< auto-reload register low */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 41 52 52
             4C 3B 20 20 2F 2A 21
             3C 20 61 75 74 6F 2D
             72 65 6C 6F 61 64 20
             72 65 67 69 73 74 65
             72 20 6C 6F 77 20 2A
             2F
      0087B8 0D                    1624 	.db 0x0d
      0087B9 0A                    1625 	.db 0x0a
      0087BA 30 78 31 34 3A 5F 5F  1626 	.ascii "0x14:__IO uint8_t RCR;   /*!< Repetition Counter register */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 52 43 52
             3B 20 20 20 2F 2A 21
             3C 20 52 65 70 65 74
             69 74 69 6F 6E 20 43
             6F 75 6E 74 65 72 20
             72 65 67 69 73 74 65
             72 20 2A 2F
      0087F6 0D                    1627 	.db 0x0d
      0087F7 0A                    1628 	.db 0x0a
      0087F8 30 78 31 35 3A 5F 5F  1629 	.ascii "0x15:__IO uint8_t CCR1H; /*!< capture/compare register 1 hig"
             49 4F 20 75 69 6E 74
             38 5F 74 20 43 43 52
             31 48 3B 20 2F 2A 21
             3C 20 63 61 70 74 75
             72 65 2F 63 6F 6D 70
             61 72 65 20 72 65 67
             69 73 74 65 72 20 31
             20 68 69 67
      008834 68 20 2A 2F           1630 	.ascii "h */"
      008838 0D                    1631 	.db 0x0d
      008839 0A                    1632 	.db 0x0a
      00883A 30 78 31 36 3A 5F 5F  1633 	.ascii "0x16:__IO uint8_t CCR1L; /*!< capture/compare register 1 low"
             49 4F 20 75 69 6E 74
             38 5F 74 20 43 43 52
             31 4C 3B 20 2F 2A 21
             3C 20 63 61 70 74 75
             72 65 2F 63 6F 6D 70
             61 72 65 20 72 65 67
             69 73 74 65 72 20 31
             20 6C 6F 77
      008876 20 2A 2F              1634 	.ascii " */"
      008879 0D                    1635 	.db 0x0d
      00887A 0A                    1636 	.db 0x0a
      00887B 30 78 31 37 3A 5F 5F  1637 	.ascii "0x17:__IO uint8_t CCR2H; /*!< capture/compare register 2 hig"
             49 4F 20 75 69 6E 74
             38 5F 74 20 43 43 52
             32 48 3B 20 2F 2A 21
             3C 20 63 61 70 74 75
             72 65 2F 63 6F 6D 70
             61 72 65 20 72 65 67
             69 73 74 65 72 20 32
             20 68 69 67
      0088B7 68 20 2A 2F           1638 	.ascii "h */"
      0088BB 0D                    1639 	.db 0x0d
      0088BC 0A                    1640 	.db 0x0a
      0088BD 30 78 31 38 3A 5F 5F  1641 	.ascii "0x18:__IO uint8_t CCR2L; /*!< capture/compare register 2 low"
             49 4F 20 75 69 6E 74
             38 5F 74 20 43 43 52
             32 4C 3B 20 2F 2A 21
             3C 20 63 61 70 74 75
             72 65 2F 63 6F 6D 70
             61 72 65 20 72 65 67
             69 73 74 65 72 20 32
             20 6C 6F 77
      0088F9 20 2A 2F              1642 	.ascii " */"
      0088FC 0D                    1643 	.db 0x0d
      0088FD 0A                    1644 	.db 0x0a
      0088FE 30 78 31 39 3A 5F 5F  1645 	.ascii "0x19:__IO uint8_t CCR3H; /*!< capture/compare register 3 hig"
             49 4F 20 75 69 6E 74
             38 5F 74 20 43 43 52
             33 48 3B 20 2F 2A 21
             3C 20 63 61 70 74 75
             72 65 2F 63 6F 6D 70
             61 72 65 20 72 65 67
             69 73 74 65 72 20 33
             20 68 69 67
      00893A 68 20 2A 2F           1646 	.ascii "h */"
      00893E 0D                    1647 	.db 0x0d
      00893F 0A                    1648 	.db 0x0a
      008940 30 78 31 61 3A 5F 5F  1649 	.ascii "0x1a:__IO uint8_t CCR3L; /*!< capture/compare register 3 low"
             49 4F 20 75 69 6E 74
             38 5F 74 20 43 43 52
             33 4C 3B 20 2F 2A 21
             3C 20 63 61 70 74 75
             72 65 2F 63 6F 6D 70
             61 72 65 20 72 65 67
             69 73 74 65 72 20 33
             20 6C 6F 77
      00897C 20 2A 2F              1650 	.ascii " */"
      00897F 0D                    1651 	.db 0x0d
      008980 0A                    1652 	.db 0x0a
      008981 30 78 31 62 3A 5F 5F  1653 	.ascii "0x1b:__IO uint8_t CCR4H; /*!< capture/compare register 3 hig"
             49 4F 20 75 69 6E 74
             38 5F 74 20 43 43 52
             34 48 3B 20 2F 2A 21
             3C 20 63 61 70 74 75
             72 65 2F 63 6F 6D 70
             61 72 65 20 72 65 67
             69 73 74 65 72 20 33
             20 68 69 67
      0089BD 68 20 2A 2F           1654 	.ascii "h */"
      0089C1 0D                    1655 	.db 0x0d
      0089C2 0A                    1656 	.db 0x0a
      0089C3 30 78 31 63 3A 5F 5F  1657 	.ascii "0x1c:__IO uint8_t CCR4L; /*!< capture/compare register 3 low"
             49 4F 20 75 69 6E 74
             38 5F 74 20 43 43 52
             34 4C 3B 20 2F 2A 21
             3C 20 63 61 70 74 75
             72 65 2F 63 6F 6D 70
             61 72 65 20 72 65 67
             69 73 74 65 72 20 33
             20 6C 6F 77
      0089FF 20 2A 2F              1658 	.ascii " */"
      008A02 0D                    1659 	.db 0x0d
      008A03 0A                    1660 	.db 0x0a
      008A04 30 78 31 64 3A 5F 5F  1661 	.ascii "0x1d:__IO uint8_t BKR;   /*!< Break Register */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 42 4B 52
             3B 20 20 20 2F 2A 21
             3C 20 42 72 65 61 6B
             20 52 65 67 69 73 74
             65 72 20 2A 2F
      008A33 0D                    1662 	.db 0x0d
      008A34 0A                    1663 	.db 0x0a
      008A35 30 78 31 65 3A 5F 5F  1664 	.ascii "0x1e:__IO uint8_t DTR;   /*!< dead-time register */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 44 54 52
             3B 20 20 20 2F 2A 21
             3C 20 64 65 61 64 2D
             74 69 6D 65 20 72 65
             67 69 73 74 65 72 20
             2A 2F
      008A68 0D                    1665 	.db 0x0d
      008A69 0A                    1666 	.db 0x0a
      008A6A 30 78 31 66 3A 5F 5F  1667 	.ascii "0x1f:__IO uint8_t OISR;  /*!< Output idle register */"
             49 4F 20 75 69 6E 74
             38 5F 74 20 4F 49 53
             52 3B 20 20 2F 2A 21
             3C 20 4F 75 74 70 75
             74 20 69 64 6C 65 20
             72 65 67 69 73 74 65
             72 20 2A 2F
      008A9F 0D                    1668 	.db 0x0d
      008AA0 0A                    1669 	.db 0x0a
      008AA1 7D                    1670 	.ascii "}"
      008AA2 0D                    1671 	.db 0x0d
      008AA3 0A                    1672 	.db 0x0a
      008AA4 54 49 4D 31 5F 54 79  1673 	.ascii "TIM1_TypeDef;"
             70 65 44 65 66 3B
      008AB1 0D                    1674 	.db 0x0d
      008AB2 0A                    1675 	.db 0x0a
      008AB3 00                    1676 	.db 0x00
                                   1677 	.area CODE
                                   1678 	.area CONST
      008AB4                       1679 ___str_28:
      008AB4 74 69 6D 31           1680 	.ascii "tim1"
      008AB8 00                    1681 	.db 0x00
                                   1682 	.area CODE
                                   1683 	.area CONST
      008AB9                       1684 ___str_29:
      008AB9 20 20 74 69 6D 31 20  1685 	.ascii "  tim1 {init} "
             7B 69 6E 69 74 7D 20
      008AC7 0D                    1686 	.db 0x0d
      008AC8 0A                    1687 	.db 0x0a
      008AC9 20 20 74 69 6D 31 20  1688 	.ascii "  tim1 {write} [addr] [data]  "
             7B 77 72 69 74 65 7D
             20 5B 61 64 64 72 5D
             20 5B 64 61 74 61 5D
             20 20
      008AE7 0D                    1689 	.db 0x0d
      008AE8 0A                    1690 	.db 0x0a
      008AE9 20 20 74 69 6D 31 20  1691 	.ascii "  tim1 {read} [addr] "
             7B 72 65 61 64 7D 20
             5B 61 64 64 72 5D 20
      008AFE 0D                    1692 	.db 0x0d
      008AFF 0A                    1693 	.db 0x0a
      008B00 20 20 74 69 6D 31 20  1694 	.ascii "  tim1 {onepulse} {high/low} [delay] [width] usec.."
             7B 6F 6E 65 70 75 6C
             73 65 7D 20 7B 68 69
             67 68 2F 6C 6F 77 7D
             20 5B 64 65 6C 61 79
             5D 20 5B 77 69 64 74
             68 5D 20 75 73 65 63
             2E 2E
      008B33 0D                    1695 	.db 0x0d
      008B34 0A                    1696 	.db 0x0a
      008B35 20 20 74 69 6D 31 20  1697 	.ascii "  tim1 {pwm} [period] [ratio] {N(1/2/3/4):Pin(p/n/b):(h/l)}}"
             7B 70 77 6D 7D 20 5B
             70 65 72 69 6F 64 5D
             20 5B 72 61 74 69 6F
             5D 20 7B 4E 28 31 2F
             32 2F 33 2F 34 29 3A
             50 69 6E 28 70 2F 6E
             2F 62 29 3A 28 68 2F
             6C 29 7D 7D
      008B71 20 75 73 65 63 20     1698 	.ascii " usec "
      008B77 0D                    1699 	.db 0x0d
      008B78 0A                    1700 	.db 0x0a
      008B79 20 20 74 69 6D 31 20  1701 	.ascii "  tim1 {compare} [period] usec "
             7B 63 6F 6D 70 61 72
             65 7D 20 5B 70 65 72
             69 6F 64 5D 20 75 73
             65 63 20
      008B98 0D                    1702 	.db 0x0d
      008B99 0A                    1703 	.db 0x0a
      008B9A 20 20 74 69 6D 31 20  1704 	.ascii "  tim1 {capture} "
             7B 63 61 70 74 75 72
             65 7D 20
      008BAB 0D                    1705 	.db 0x0d
      008BAC 0A                    1706 	.db 0x0a
      008BAD 20 20 74 69 6D 31 20  1707 	.ascii "  tim1 {remap} {set/reset} "
             7B 72 65 6D 61 70 7D
             20 7B 73 65 74 2F 72
             65 73 65 74 7D 20
      008BC8 0D                    1708 	.db 0x0d
      008BC9 0A                    1709 	.db 0x0a
      008BCA 20 20 74 69 6D 31 20  1710 	.ascii "  tim1 {reset}"
             7B 72 65 73 65 74 7D
      008BD8 0D                    1711 	.db 0x0d
      008BD9 0A                    1712 	.db 0x0a
      008BDA 20 20 74 69 6D 31 20  1713 	.ascii "  tim1 {help}  tim1 help."
             7B 68 65 6C 70 7D 20
             20 74 69 6D 31 20 68
             65 6C 70 2E
      008BF3 0D                    1714 	.db 0x0d
      008BF4 0A                    1715 	.db 0x0a
      008BF5 00                    1716 	.db 0x00
                                   1717 	.area CODE
                                   1718 	.area INITIALIZER
      009205                       1719 __xinit__gpbHelp_TIM1_TypeDef:
      009205 83 5F                 1720 	.dw ___str_27
      009207                       1721 __xinit__cmdTbl_only:
      009207 8A B4                 1722 	.dw ___str_28
      009209 92 AF                 1723 	.dw _DoTIM1
      00920B 8A B9                 1724 	.dw ___str_29
      00920D 00 00                 1725 	.dw #0x0000
      00920F 00 00                 1726 	.dw #0x0000
      009211 00 00                 1727 	.dw #0x0000
                                   1728 	.area CABS (ABS)
