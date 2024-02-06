                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_debug_top_main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _memset
                                     13 	.globl _strcmp
                                     14 	.globl _cmd_mem
                                     15 	.globl _DoPrintHelp
                                     16 	.globl _GetArgs
                                     17 	.globl _GetCommand
                                     18 	.globl _mib_printf
                                     19 	.globl _timIrqInit
                                     20 	.globl _MibWriteDebugString
                                     21 	.globl _MibDebugInit
                                     22 	.globl _debug_main
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area DATA
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area INITIALIZED
                                     31 ;--------------------------------------------------------
                                     32 ; Stack segment in internal ram
                                     33 ;--------------------------------------------------------
                                     34 	.area SSEG
      00017F                         35 __start__stack:
      00017F                         36 	.ds	1
                                     37 
                                     38 ;--------------------------------------------------------
                                     39 ; absolute external ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area DABS (ABS)
                                     42 
                                     43 ; default segment ordering for linker
                                     44 	.area HOME
                                     45 	.area GSINIT
                                     46 	.area GSFINAL
                                     47 	.area CONST
                                     48 	.area INITIALIZER
                                     49 	.area CODE
                                     50 
                                     51 ;--------------------------------------------------------
                                     52 ; interrupt vector
                                     53 ;--------------------------------------------------------
                                     54 	.area HOME
      008000                         55 __interrupt_vect:
      008000 82 00 80 6F             56 	int s_GSINIT ; reset
      008004 82 00 89 89             57 	int _TRAP_IRQHandler ; trap
      008008 82 00 89 8A             58 	int _TLI_IRQHandler ; int0
      00800C 82 00 89 8B             59 	int _AWU_IRQHandler ; int1
      008010 82 00 89 8C             60 	int _CLK_IRQHandler ; int2
      008014 82 00 89 8D             61 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 89 8E             62 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 89 8F             63 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 89 90             64 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 89 91             65 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 00 00             66 	int 0x000000 ; int8
      00802C 82 00 00 00             67 	int 0x000000 ; int9
      008030 82 00 89 92             68 	int _SPI_IRQHandler ; int10
      008034 82 00 89 93             69 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 89 94             70 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 89 95             71 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 89 96             72 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 89 97             73 	int _TIM3_UPD_OVF_BRK_IRQHandler ; int15
      008048 82 00 89 98             74 	int _TIM3_CAP_COM_IRQHandler ; int16
      00804C 82 00 00 00             75 	int 0x000000 ; int17
      008050 82 00 00 00             76 	int 0x000000 ; int18
      008054 82 00 89 99             77 	int _I2C_IRQHandler ; int19
      008058 82 00 89 9A             78 	int _UART2_TX_IRQHandler ; int20
      00805C 82 00 89 9B             79 	int _UART2_RX_IRQHandler ; int21
      008060 82 00 89 A1             80 	int _ADC1_IRQHandler ; int22
      008064 82 00 89 A2             81 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 89 AC             82 	int _EEPROM_EEC_IRQHandler ; int24
                                     83 ;--------------------------------------------------------
                                     84 ; global & static initialisations
                                     85 ;--------------------------------------------------------
                                     86 	.area HOME
                                     87 	.area GSINIT
                                     88 	.area GSFINAL
                                     89 	.area GSINIT
      00806F CD A2 56         [ 4]   90 	call	___sdcc_external_startup
      008072                         91 __sdcc_init_data:
                                     92 ; stm8_genXINIT() start
      008072 AE 01 48         [ 2]   93 	ldw x, #l_DATA
      008075 27 07            [ 1]   94 	jreq	00002$
      008077                         95 00001$:
      008077 72 4F 00 00      [ 1]   96 	clr (s_DATA - 1, x)
      00807B 5A               [ 2]   97 	decw x
      00807C 26 F9            [ 1]   98 	jrne	00001$
      00807E                         99 00002$:
      00807E AE 00 36         [ 2]  100 	ldw	x, #l_INITIALIZER
      008081 27 09            [ 1]  101 	jreq	00004$
      008083                        102 00003$:
      008083 D6 86 08         [ 1]  103 	ld	a, (s_INITIALIZER - 1, x)
      008086 D7 01 48         [ 1]  104 	ld	(s_INITIALIZED - 1, x), a
      008089 5A               [ 2]  105 	decw	x
      00808A 26 F7            [ 1]  106 	jrne	00003$
      00808C                        107 00004$:
                                    108 ; stm8_genXINIT() end
                                    109 	.area GSFINAL
      00808C CC 80 6C         [ 2]  110 	jp	__sdcc_program_startup
                                    111 ;--------------------------------------------------------
                                    112 ; Home
                                    113 ;--------------------------------------------------------
                                    114 	.area HOME
                                    115 	.area HOME
      00806C                        116 __sdcc_program_startup:
      00806C CC 86 3F         [ 2]  117 	jp	_main
                                    118 ;	return from main will return to caller
                                    119 ;--------------------------------------------------------
                                    120 ; code
                                    121 ;--------------------------------------------------------
                                    122 	.area CODE
                                    123 ;	stm8s_debug_top_main.c: 44: void main(void)
                                    124 ;	-----------------------------------------
                                    125 ;	 function main
                                    126 ;	-----------------------------------------
      00863F                        127 _main:
                                    128 ;	stm8s_debug_top_main.c: 50: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);  
      00863F C6 50 C6         [ 1]  129 	ld	a, 0x50c6
      008642 A4 E7            [ 1]  130 	and	a, #0xe7
      008644 C7 50 C6         [ 1]  131 	ld	0x50c6, a
                                    132 ;	stm8s_debug_top_main.c: 52: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
      008647 C6 50 C6         [ 1]  133 	ld	a, 0x50c6
      00864A C7 50 C6         [ 1]  134 	ld	0x50c6, a
                                    135 ;	stm8s_debug_top_main.c: 55: MibDebugInit(9600);
      00864D 4B 80            [ 1]  136 	push	#0x80
      00864F 4B 25            [ 1]  137 	push	#0x25
      008651 5F               [ 1]  138 	clrw	x
      008652 89               [ 2]  139 	pushw	x
      008653 CD 87 A6         [ 4]  140 	call	_MibDebugInit
                                    141 ;	stm8s_debug_top_main.c: 56: timIrqInit();
      008656 CD 91 98         [ 4]  142 	call	_timIrqInit
                                    143 ;	stm8s_debug_top_main.c: 65: enableInterrupts();
      008659 9A               [ 1]  144 	rim
                                    145 ;	stm8s_debug_top_main.c: 68: MibWriteDebugStringCheck(1, "\r\n ###################################\r\n");
      00865A AE 80 8F         [ 2]  146 	ldw	x, #(__str_0+0)
      00865D CD 87 62         [ 4]  147 	call	_MibWriteDebugString
                                    148 ;	stm8s_debug_top_main.c: 69: MibWriteDebugStringCheck(1, " file name : " __FILE__ "\r\n");
      008660 AE 80 B8         [ 2]  149 	ldw	x, #(__str_1+0)
      008663 CD 87 62         [ 4]  150 	call	_MibWriteDebugString
                                    151 ;	stm8s_debug_top_main.c: 70: MibWriteDebugStringCheck(1, " date :  "__DATE__"  :  "__TIME__"\r\n");
      008666 AE 80 DE         [ 2]  152 	ldw	x, #(__str_2+0)
      008669 CD 87 62         [ 4]  153 	call	_MibWriteDebugString
                                    154 ;	stm8s_debug_top_main.c: 71: MibWriteDebugStringCheck(1, " webgpio.com by MYMEDIA Co., Ltd.\r\n");
      00866C AE 81 02         [ 2]  155 	ldw	x, #(__str_3+0)
      00866F CD 87 62         [ 4]  156 	call	_MibWriteDebugString
                                    157 ;	stm8s_debug_top_main.c: 72: MibWriteDebugStringCheck(1, " ###################################\r\n");
      008672 AE 81 26         [ 2]  158 	ldw	x, #(__str_4+0)
      008675 CD 87 62         [ 4]  159 	call	_MibWriteDebugString
                                    160 ;	stm8s_debug_top_main.c: 74: debug_main();
      008678 CD 86 7E         [ 4]  161 	call	_debug_main
                                    162 ;	stm8s_debug_top_main.c: 76: while(1);
      00867B                        163 00102$:
      00867B 20 FE            [ 2]  164 	jra	00102$
                                    165 ;	stm8s_debug_top_main.c: 77: }
      00867D 81               [ 4]  166 	ret
                                    167 ;	stm8s_debug_top_main.c: 82: void debug_main(void)
                                    168 ;	-----------------------------------------
                                    169 ;	 function debug_main
                                    170 ;	-----------------------------------------
      00867E                        171 _debug_main:
      00867E 52 50            [ 2]  172 	sub	sp, #80
                                    173 ;	stm8s_debug_top_main.c: 91: cmd[0] = 0;
      008680 0F 01            [ 1]  174 	clr	(0x01, sp)
                                    175 ;	stm8s_debug_top_main.c: 92: cmd[1] = 0;
      008682 0F 02            [ 1]  176 	clr	(0x02, sp)
                                    177 ;	stm8s_debug_top_main.c: 93: ccprintf(_DEBUG_TOP_A_, ("\r\n [help or ?] to get a list of commands\r\n\r"));
      008684 4B 4D            [ 1]  178 	push	#<(__str_5+0)
      008686 4B 81            [ 1]  179 	push	#((__str_5+0) >> 8)
      008688 CD 91 73         [ 4]  180 	call	_mib_printf
      00868B 5B 02            [ 2]  181 	addw	sp, #2
                                    182 ;	stm8s_debug_top_main.c: 94: cmd_list.cur = 0;
      00868D 35 00 00 47      [ 1]  183 	mov	_cmd_list+0, #0x00
                                    184 ;	stm8s_debug_top_main.c: 95: cmd_list.next = 0;
      008691 AE 00 47         [ 2]  185 	ldw	x, #_cmd_list+0
      008694 35 00 00 48      [ 1]  186 	mov	_cmd_list+1, #0x00
                                    187 ;	stm8s_debug_top_main.c: 96: memset((void *)(&cmd_list), 0, sizeof(cmd_list));
      008698 4B 02            [ 1]  188 	push	#0x02
      00869A 4B 01            [ 1]  189 	push	#0x01
      00869C 4B 00            [ 1]  190 	push	#0x00
      00869E 4B 00            [ 1]  191 	push	#0x00
      0086A0 CD A2 34         [ 4]  192 	call	_memset
                                    193 ;	stm8s_debug_top_main.c: 100: cmd_mem();
      0086A3 CD 98 B8         [ 4]  194 	call	_cmd_mem
      0086A6                        195 00118$:
                                    196 ;	stm8s_debug_top_main.c: 112: ccprintf(1,("My>"));
      0086A6 4B 79            [ 1]  197 	push	#<(__str_6+0)
      0086A8 4B 81            [ 1]  198 	push	#((__str_6+0) >> 8)
      0086AA CD 91 73         [ 4]  199 	call	_mib_printf
      0086AD 5B 02            [ 2]  200 	addw	sp, #2
                                    201 ;	stm8s_debug_top_main.c: 114: GetCommand(cmd, CMD_CHAR_MAX - 1, 60);
      0086AF 4B 3C            [ 1]  202 	push	#0x3c
      0086B1 4B 3F            [ 1]  203 	push	#0x3f
      0086B3 4B 00            [ 1]  204 	push	#0x00
      0086B5 96               [ 1]  205 	ldw	x, sp
      0086B6 1C 00 04         [ 2]  206 	addw	x, #4
      0086B9 CD 91 D9         [ 4]  207 	call	_GetCommand
                                    208 ;	stm8s_debug_top_main.c: 115: if (!cmd || !cmd[0]) continue;
      0086BC 7B 01            [ 1]  209 	ld	a, (0x01, sp)
      0086BE 27 E6            [ 1]  210 	jreq	00118$
                                    211 ;	stm8s_debug_top_main.c: 116: cmd_str = (char *)cmd;
                                    212 ;	stm8s_debug_top_main.c: 117: argc = GetArgs(cmd_str, argv);
      0086C0 96               [ 1]  213 	ldw	x, sp
      0086C1 1C 00 41         [ 2]  214 	addw	x, #65
      0086C4 89               [ 2]  215 	pushw	x
      0086C5 96               [ 1]  216 	ldw	x, sp
      0086C6 1C 00 03         [ 2]  217 	addw	x, #3
      0086C9 CD 93 CD         [ 4]  218 	call	_GetArgs
      0086CC 1F 4B            [ 2]  219 	ldw	(0x4b, sp), x
                                    220 ;	stm8s_debug_top_main.c: 118: for (cptr = cmdTbl; cptr->cmd; cptr++)
      0086CE AE 01 4F         [ 2]  221 	ldw	x, #(_cmdTbl+0)
      0086D1 1F 4D            [ 2]  222 	ldw	(0x4d, sp), x
      0086D3 1F 4F            [ 2]  223 	ldw	(0x4f, sp), x
      0086D5                        224 00116$:
      0086D5 1E 4F            [ 2]  225 	ldw	x, (0x4f, sp)
      0086D7 FE               [ 2]  226 	ldw	x, (x)
      0086D8 27 28            [ 1]  227 	jreq	00106$
                                    228 ;	stm8s_debug_top_main.c: 120: if (!strcmp(argv[0], cptr->cmd))
      0086DA 16 41            [ 2]  229 	ldw	y, (0x41, sp)
      0086DC 89               [ 2]  230 	pushw	x
      0086DD 93               [ 1]  231 	ldw	x, y
      0086DE CD A2 65         [ 4]  232 	call	_strcmp
      0086E1 5D               [ 2]  233 	tnzw	x
      0086E2 26 13            [ 1]  234 	jrne	00117$
                                    235 ;	stm8s_debug_top_main.c: 122: (cptr->run)(cptr, argc, argv);
      0086E4 16 4D            [ 2]  236 	ldw	y, (0x4d, sp)
      0086E6 90 EE 02         [ 2]  237 	ldw	y, (0x2, y)
      0086E9 96               [ 1]  238 	ldw	x, sp
      0086EA 1C 00 41         [ 2]  239 	addw	x, #65
      0086ED 89               [ 2]  240 	pushw	x
      0086EE 1E 4D            [ 2]  241 	ldw	x, (0x4d, sp)
      0086F0 89               [ 2]  242 	pushw	x
      0086F1 1E 51            [ 2]  243 	ldw	x, (0x51, sp)
      0086F3 90 FD            [ 4]  244 	call	(y)
                                    245 ;	stm8s_debug_top_main.c: 123: break;
      0086F5 20 0B            [ 2]  246 	jra	00106$
      0086F7                        247 00117$:
                                    248 ;	stm8s_debug_top_main.c: 118: for (cptr = cmdTbl; cptr->cmd; cptr++)
      0086F7 1E 4F            [ 2]  249 	ldw	x, (0x4f, sp)
      0086F9 1C 00 06         [ 2]  250 	addw	x, #0x0006
      0086FC 1F 4F            [ 2]  251 	ldw	(0x4f, sp), x
      0086FE 1F 4D            [ 2]  252 	ldw	(0x4d, sp), x
      008700 20 D3            [ 2]  253 	jra	00116$
      008702                        254 00106$:
                                    255 ;	stm8s_debug_top_main.c: 126: if (!strcmp(argv[0], "help") || !strcmp(argv[0], "?"))
      008702 1E 41            [ 2]  256 	ldw	x, (0x41, sp)
      008704 4B 7D            [ 1]  257 	push	#<(___str_7+0)
      008706 4B 81            [ 1]  258 	push	#((___str_7+0) >> 8)
      008708 CD A2 65         [ 4]  259 	call	_strcmp
      00870B 1F 4F            [ 2]  260 	ldw	(0x4f, sp), x
      00870D 27 0C            [ 1]  261 	jreq	00107$
      00870F 1E 41            [ 2]  262 	ldw	x, (0x41, sp)
      008711 4B 82            [ 1]  263 	push	#<(___str_8+0)
      008713 4B 81            [ 1]  264 	push	#((___str_8+0) >> 8)
      008715 CD A2 65         [ 4]  265 	call	_strcmp
      008718 5D               [ 2]  266 	tnzw	x
      008719 26 0A            [ 1]  267 	jrne	00108$
      00871B                        268 00107$:
                                    269 ;	stm8s_debug_top_main.c: 128: DoPrintHelp(argc, argv);
      00871B 96               [ 1]  270 	ldw	x, sp
      00871C 1C 00 41         [ 2]  271 	addw	x, #65
      00871F 89               [ 2]  272 	pushw	x
      008720 1E 4D            [ 2]  273 	ldw	x, (0x4d, sp)
      008722 CD 98 0C         [ 4]  274 	call	_DoPrintHelp
      008725                        275 00108$:
                                    276 ;	stm8s_debug_top_main.c: 130: if (!strcmp(argv[0], "q") || !strcmp(argv[0], "Q"))
      008725 1E 41            [ 2]  277 	ldw	x, (0x41, sp)
      008727 4B 84            [ 1]  278 	push	#<(___str_9+0)
      008729 4B 81            [ 1]  279 	push	#((___str_9+0) >> 8)
      00872B CD A2 65         [ 4]  280 	call	_strcmp
      00872E 5D               [ 2]  281 	tnzw	x
      00872F 27 14            [ 1]  282 	jreq	00110$
      008731 16 41            [ 2]  283 	ldw	y, (0x41, sp)
      008733 17 4F            [ 2]  284 	ldw	(0x4f, sp), y
      008735 4B 86            [ 1]  285 	push	#<(___str_10+0)
      008737 4B 81            [ 1]  286 	push	#((___str_10+0) >> 8)
      008739 1E 51            [ 2]  287 	ldw	x, (0x51, sp)
      00873B CD A2 65         [ 4]  288 	call	_strcmp
      00873E 1F 4F            [ 2]  289 	ldw	(0x4f, sp), x
      008740 27 03            [ 1]  290 	jreq	00168$
      008742 CC 86 A6         [ 2]  291 	jp	00118$
      008745                        292 00168$:
      008745                        293 00110$:
                                    294 ;	stm8s_debug_top_main.c: 132: ccprintf(_DEBUG_TOP_A_,("\r\nmonitor program end!!!\r\n"));
      008745 4B 88            [ 1]  295 	push	#<(__str_11+0)
      008747 4B 81            [ 1]  296 	push	#((__str_11+0) >> 8)
      008749 CD 91 73         [ 4]  297 	call	_mib_printf
                                    298 ;	stm8s_debug_top_main.c: 133: break;
                                    299 ;	stm8s_debug_top_main.c: 137: }
      00874C 5B 52            [ 2]  300 	addw	sp, #82
      00874E 81               [ 4]  301 	ret
                                    302 	.area CODE
                                    303 	.area CONST
                                    304 	.area CONST
      00808F                        305 __str_0:
      00808F 0D                     306 	.db 0x0d
      008090 0A                     307 	.db 0x0a
      008091 20 23 23 23 23 23 23   308 	.ascii " ###################################"
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23
      0080B5 0D                     309 	.db 0x0d
      0080B6 0A                     310 	.db 0x0a
      0080B7 00                     311 	.db 0x00
                                    312 	.area CODE
                                    313 	.area CONST
      0080B8                        314 __str_1:
      0080B8 20 66 69 6C 65 20 6E   315 	.ascii " file name : stm8s_debug_top_main.c"
             61 6D 65 20 3A 20 73
             74 6D 38 73 5F 64 65
             62 75 67 5F 74 6F 70
             5F 6D 61 69 6E 2E 63
      0080DB 0D                     316 	.db 0x0d
      0080DC 0A                     317 	.db 0x0a
      0080DD 00                     318 	.db 0x00
                                    319 	.area CODE
                                    320 	.area CONST
      0080DE                        321 __str_2:
      0080DE 20 64 61 74 65 20 3A   322 	.ascii " date :  Feb  9 2023  :  18:25:02"
             20 20 46 65 62 20 20
             39 20 32 30 32 33 20
             20 3A 20 20 31 38 3A
             32 35 3A 30 32
      0080FF 0D                     323 	.db 0x0d
      008100 0A                     324 	.db 0x0a
      008101 00                     325 	.db 0x00
                                    326 	.area CODE
                                    327 	.area CONST
      008102                        328 __str_3:
      008102 20 77 65 62 67 70 69   329 	.ascii " webgpio.com by MYMEDIA Co., Ltd."
             6F 2E 63 6F 6D 20 62
             79 20 4D 59 4D 45 44
             49 41 20 43 6F 2E 2C
             20 4C 74 64 2E
      008123 0D                     330 	.db 0x0d
      008124 0A                     331 	.db 0x0a
      008125 00                     332 	.db 0x00
                                    333 	.area CODE
                                    334 	.area CONST
      008126                        335 __str_4:
      008126 20 23 23 23 23 23 23   336 	.ascii " ###################################"
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23
      00814A 0D                     337 	.db 0x0d
      00814B 0A                     338 	.db 0x0a
      00814C 00                     339 	.db 0x00
                                    340 	.area CODE
                                    341 	.area CONST
      00814D                        342 __str_5:
      00814D 0D                     343 	.db 0x0d
      00814E 0A                     344 	.db 0x0a
      00814F 20 5B 68 65 6C 70 20   345 	.ascii " [help or ?] to get a list of commands"
             6F 72 20 3F 5D 20 74
             6F 20 67 65 74 20 61
             20 6C 69 73 74 20 6F
             66 20 63 6F 6D 6D 61
             6E 64 73
      008175 0D                     346 	.db 0x0d
      008176 0A                     347 	.db 0x0a
      008177 0D                     348 	.db 0x0d
      008178 00                     349 	.db 0x00
                                    350 	.area CODE
                                    351 	.area CONST
      008179                        352 __str_6:
      008179 4D 79 3E               353 	.ascii "My>"
      00817C 00                     354 	.db 0x00
                                    355 	.area CODE
                                    356 	.area CONST
      00817D                        357 ___str_7:
      00817D 68 65 6C 70            358 	.ascii "help"
      008181 00                     359 	.db 0x00
                                    360 	.area CODE
                                    361 	.area CONST
      008182                        362 ___str_8:
      008182 3F                     363 	.ascii "?"
      008183 00                     364 	.db 0x00
                                    365 	.area CODE
                                    366 	.area CONST
      008184                        367 ___str_9:
      008184 71                     368 	.ascii "q"
      008185 00                     369 	.db 0x00
                                    370 	.area CODE
                                    371 	.area CONST
      008186                        372 ___str_10:
      008186 51                     373 	.ascii "Q"
      008187 00                     374 	.db 0x00
                                    375 	.area CODE
                                    376 	.area CONST
      008188                        377 __str_11:
      008188 0D                     378 	.db 0x0d
      008189 0A                     379 	.db 0x0a
      00818A 6D 6F 6E 69 74 6F 72   380 	.ascii "monitor program end!!!"
             20 70 72 6F 67 72 61
             6D 20 65 6E 64 21 21
             21
      0081A0 0D                     381 	.db 0x0d
      0081A1 0A                     382 	.db 0x0a
      0081A2 00                     383 	.db 0x00
                                    384 	.area CODE
                                    385 	.area INITIALIZER
                                    386 	.area CABS (ABS)
