                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_mib_debug_top
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
      00B499                         35 __start__stack:
      00B499                         36 	.ds	1
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
      008004 82 00 97 D2             57 	int _TRAP_IRQHandler ; trap
      008008 82 00 97 D3             58 	int _TLI_IRQHandler ; int0
      00800C 82 00 97 D4             59 	int _AWU_IRQHandler ; int1
      008010 82 00 97 D5             60 	int _CLK_IRQHandler ; int2
      008014 82 00 97 D6             61 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 97 D7             62 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 97 D8             63 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 97 D9             64 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 97 DA             65 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 00 00             66 	int 0x000000 ; int8
      00802C 82 00 00 00             67 	int 0x000000 ; int9
      008030 82 00 97 DB             68 	int _SPI_IRQHandler ; int10
      008034 82 00 97 DC             69 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 97 DD             70 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 97 DE             71 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 97 DF             72 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 97 E0             73 	int _TIM3_UPD_OVF_BRK_IRQHandler ; int15
      008048 82 00 97 E1             74 	int _TIM3_CAP_COM_IRQHandler ; int16
      00804C 82 00 00 00             75 	int 0x000000 ; int17
      008050 82 00 00 00             76 	int 0x000000 ; int18
      008054 82 00 97 E2             77 	int _I2C_IRQHandler ; int19
      008058 82 00 97 E3             78 	int _UART2_TX_IRQHandler ; int20
      00805C 82 00 97 E4             79 	int _UART2_RX_IRQHandler ; int21
      008060 82 00 97 EA             80 	int _ADC1_IRQHandler ; int22
      008064 82 00 97 EB             81 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 97 F5             82 	int _EEPROM_EEC_IRQHandler ; int24
                                     83 ;--------------------------------------------------------
                                     84 ; global & static initialisations
                                     85 ;--------------------------------------------------------
                                     86 	.area HOME
                                     87 	.area GSINIT
                                     88 	.area GSFINAL
                                     89 	.area GSINIT
      00806F CD B3 B9         [ 4]   90 	call	___sdcc_external_startup
      008072                         91 __sdcc_init_data:
                                     92 ; stm8_genXINIT() start
      008072 AE 01 4A         [ 2]   93 	ldw x, #l_DATA
      008075 27 07            [ 1]   94 	jreq	00002$
      008077                         95 00001$:
      008077 72 4F 00 00      [ 1]   96 	clr (s_DATA - 1, x)
      00807B 5A               [ 2]   97 	decw x
      00807C 26 F9            [ 1]   98 	jrne	00001$
      00807E                         99 00002$:
      00807E AE 00 43         [ 2]  100 	ldw	x, #l_INITIALIZER
      008081 27 09            [ 1]  101 	jreq	00004$
      008083                        102 00003$:
      008083 D6 8B 9B         [ 1]  103 	ld	a, (s_INITIALIZER - 1, x)
      008086 D7 01 4A         [ 1]  104 	ld	(s_INITIALIZED - 1, x), a
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
      00806C CC AE FB         [ 2]  117 	jp	_main
                                    118 ;	return from main will return to caller
                                    119 ;--------------------------------------------------------
                                    120 ; code
                                    121 ;--------------------------------------------------------
                                    122 	.area CODE
                                    123 ;	./../../mib/stm8s_mib_debug_top.c: 45: void main(void)
                                    124 ;	-----------------------------------------
                                    125 ;	 function main
                                    126 ;	-----------------------------------------
      00AEFB                        127 _main:
      00AEFB 52 10            [ 2]  128 	sub	sp, #16
                                    129 ;	./../../mib/stm8s_mib_debug_top.c: 51: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);  
      00AEFD C6 50 C6         [ 1]  130 	ld	a, 0x50c6
      00AF00 A4 E7            [ 1]  131 	and	a, #0xe7
      00AF02 C7 50 C6         [ 1]  132 	ld	0x50c6, a
                                    133 ;	./../../mib/stm8s_mib_debug_top.c: 53: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
      00AF05 C6 50 C6         [ 1]  134 	ld	a, 0x50c6
      00AF08 C7 50 C6         [ 1]  135 	ld	0x50c6, a
                                    136 ;	./../../mib/stm8s_mib_debug_top.c: 56: MibDebugInit(9600);
      00AF0B 4B 80            [ 1]  137 	push	#0x80
      00AF0D 4B 25            [ 1]  138 	push	#0x25
      00AF0F 5F               [ 1]  139 	clrw	x
      00AF10 89               [ 2]  140 	pushw	x
      00AF11 CD 95 EF         [ 4]  141 	call	_MibDebugInit
                                    142 ;	./../../mib/stm8s_mib_debug_top.c: 57: timIrqInit();
      00AF14 CD 9F E2         [ 4]  143 	call	_timIrqInit
                                    144 ;	./../../mib/stm8s_mib_debug_top.c: 61: cmd_test_init_before_irq_enable();
      00AF17 CD 8C 44         [ 4]  145 	call	_cmd_test_init_before_irq_enable
                                    146 ;	./../../mib/stm8s_mib_debug_top.c: 66: enableInterrupts();
      00AF1A 9A               [ 1]  147 	rim
                                    148 ;	./../../mib/stm8s_mib_debug_top.c: 73: for(vbIndexID=0;vbIndexID<12;vbIndexID++)
      00AF1B 90 AE 48 CD      [ 2]  149 	ldw	y, #0x48cd
      00AF1F 0F 10            [ 1]  150 	clr	(0x10, sp)
      00AF21                        151 00105$:
                                    152 ;	./../../mib/stm8s_mib_debug_top.c: 75: vbBufferID[vbIndexID] = *vpbUniqueID++;
      00AF21 5F               [ 1]  153 	clrw	x
      00AF22 7B 10            [ 1]  154 	ld	a, (0x10, sp)
      00AF24 97               [ 1]  155 	ld	xl, a
      00AF25 89               [ 2]  156 	pushw	x
      00AF26 96               [ 1]  157 	ldw	x, sp
      00AF27 1C 00 05         [ 2]  158 	addw	x, #5
      00AF2A 72 FB 01         [ 2]  159 	addw	x, (1, sp)
      00AF2D 5B 02            [ 2]  160 	addw	sp, #2
      00AF2F 90 F6            [ 1]  161 	ld	a, (y)
      00AF31 90 5C            [ 1]  162 	incw	y
      00AF33 F7               [ 1]  163 	ld	(x), a
                                    164 ;	./../../mib/stm8s_mib_debug_top.c: 73: for(vbIndexID=0;vbIndexID<12;vbIndexID++)
      00AF34 0C 10            [ 1]  165 	inc	(0x10, sp)
      00AF36 7B 10            [ 1]  166 	ld	a, (0x10, sp)
      00AF38 A1 0C            [ 1]  167 	cp	a, #0x0c
      00AF3A 25 E5            [ 1]  168 	jrc	00105$
                                    169 ;	./../../mib/stm8s_mib_debug_top.c: 77: vbBufferID[12] = 0;
      00AF3C 0F 0F            [ 1]  170 	clr	(0x0f, sp)
                                    171 ;	./../../mib/stm8s_mib_debug_top.c: 78: MibWriteDebugStringCheck(1, "\r\n ###################################\r\n");
      00AF3E AE 89 AE         [ 2]  172 	ldw	x, #(__str_0+0)
      00AF41 CD 95 AB         [ 4]  173 	call	_MibWriteDebugString
                                    174 ;	./../../mib/stm8s_mib_debug_top.c: 79: MibWriteDebugStringCheck(1, " file name : " __FILE__ "\r\n");
      00AF44 AE 89 D7         [ 2]  175 	ldw	x, #(__str_1+0)
      00AF47 CD 95 AB         [ 4]  176 	call	_MibWriteDebugString
                                    177 ;	./../../mib/stm8s_mib_debug_top.c: 80: MibWriteDebugStringCheck(1, " date :  "__DATE__"  :  "__TIME__"\r\n");
      00AF4A AE 8A 08         [ 2]  178 	ldw	x, #(__str_2+0)
      00AF4D CD 95 AB         [ 4]  179 	call	_MibWriteDebugString
                                    180 ;	./../../mib/stm8s_mib_debug_top.c: 81: MibWriteDebugStringCheck(1, " webgpio.com by MYMEDIA Co., Ltd.\r\n");
      00AF50 AE 8A 2C         [ 2]  181 	ldw	x, #(__str_3+0)
      00AF53 CD 95 AB         [ 4]  182 	call	_MibWriteDebugString
                                    183 ;	./../../mib/stm8s_mib_debug_top.c: 82: MibWriteDebugStringCheck(1, " ###################################\r\n");    
      00AF56 AE 8A 50         [ 2]  184 	ldw	x, #(__str_4+0)
      00AF59 CD 95 AB         [ 4]  185 	call	_MibWriteDebugString
                                    186 ;	./../../mib/stm8s_mib_debug_top.c: 83: ccprintf(_DEBUG_TOP_A_, ("X co-ordinate on the wafer [%02X][%02X]\r\n",vbBufferID[0],vbBufferID[1]));
      00AF5C 7B 04            [ 1]  187 	ld	a, (0x04, sp)
      00AF5E 90 5F            [ 1]  188 	clrw	y
      00AF60 90 97            [ 1]  189 	ld	yl, a
      00AF62 7B 03            [ 1]  190 	ld	a, (0x03, sp)
      00AF64 5F               [ 1]  191 	clrw	x
      00AF65 97               [ 1]  192 	ld	xl, a
      00AF66 90 89            [ 2]  193 	pushw	y
      00AF68 89               [ 2]  194 	pushw	x
      00AF69 4B 77            [ 1]  195 	push	#<(__str_5+0)
      00AF6B 4B 8A            [ 1]  196 	push	#((__str_5+0) >> 8)
      00AF6D CD 9F BD         [ 4]  197 	call	_mib_printf
      00AF70 5B 06            [ 2]  198 	addw	sp, #6
                                    199 ;	./../../mib/stm8s_mib_debug_top.c: 84: ccprintf(_DEBUG_TOP_A_, ("Y co-ordinate on the wafer [%02X][%02X]\r\n",vbBufferID[2],vbBufferID[3]));
      00AF72 7B 06            [ 1]  200 	ld	a, (0x06, sp)
      00AF74 5F               [ 1]  201 	clrw	x
      00AF75 97               [ 1]  202 	ld	xl, a
      00AF76 7B 05            [ 1]  203 	ld	a, (0x05, sp)
      00AF78 0F 01            [ 1]  204 	clr	(0x01, sp)
      00AF7A 89               [ 2]  205 	pushw	x
      00AF7B 88               [ 1]  206 	push	a
      00AF7C 7B 04            [ 1]  207 	ld	a, (0x04, sp)
      00AF7E 88               [ 1]  208 	push	a
      00AF7F 4B A1            [ 1]  209 	push	#<(__str_6+0)
      00AF81 4B 8A            [ 1]  210 	push	#((__str_6+0) >> 8)
      00AF83 CD 9F BD         [ 4]  211 	call	_mib_printf
      00AF86 5B 06            [ 2]  212 	addw	sp, #6
                                    213 ;	./../../mib/stm8s_mib_debug_top.c: 85: ccprintf(_DEBUG_TOP_A_, ("Wafer number               [%02X]\r\n",vbBufferID[4]));
      00AF88 7B 07            [ 1]  214 	ld	a, (0x07, sp)
      00AF8A 5F               [ 1]  215 	clrw	x
      00AF8B 97               [ 1]  216 	ld	xl, a
      00AF8C 89               [ 2]  217 	pushw	x
      00AF8D 4B CB            [ 1]  218 	push	#<(__str_7+0)
      00AF8F 4B 8A            [ 1]  219 	push	#((__str_7+0) >> 8)
      00AF91 CD 9F BD         [ 4]  220 	call	_mib_printf
      00AF94 5B 04            [ 2]  221 	addw	sp, #4
                                    222 ;	./../../mib/stm8s_mib_debug_top.c: 86: ccprintf(_DEBUG_TOP_A_, ("Lot number [%s]\r\n",&(vbBufferID[5])));
      00AF96 96               [ 1]  223 	ldw	x, sp
      00AF97 1C 00 08         [ 2]  224 	addw	x, #8
      00AF9A 89               [ 2]  225 	pushw	x
      00AF9B 4B EF            [ 1]  226 	push	#<(__str_8+0)
      00AF9D 4B 8A            [ 1]  227 	push	#((__str_8+0) >> 8)
      00AF9F CD 9F BD         [ 4]  228 	call	_mib_printf
      00AFA2 5B 04            [ 2]  229 	addw	sp, #4
                                    230 ;	./../../mib/stm8s_mib_debug_top.c: 88: debug_main();
      00AFA4 CD AF AC         [ 4]  231 	call	_debug_main
                                    232 ;	./../../mib/stm8s_mib_debug_top.c: 90: while(1);
      00AFA7                        233 00103$:
      00AFA7 20 FE            [ 2]  234 	jra	00103$
                                    235 ;	./../../mib/stm8s_mib_debug_top.c: 91: }
      00AFA9 5B 10            [ 2]  236 	addw	sp, #16
      00AFAB 81               [ 4]  237 	ret
                                    238 ;	./../../mib/stm8s_mib_debug_top.c: 95: void debug_main(void)
                                    239 ;	-----------------------------------------
                                    240 ;	 function debug_main
                                    241 ;	-----------------------------------------
      00AFAC                        242 _debug_main:
      00AFAC 52 50            [ 2]  243 	sub	sp, #80
                                    244 ;	./../../mib/stm8s_mib_debug_top.c: 104: cmd[0] = 0;
      00AFAE 0F 01            [ 1]  245 	clr	(0x01, sp)
                                    246 ;	./../../mib/stm8s_mib_debug_top.c: 105: cmd[1] = 0;
      00AFB0 0F 02            [ 1]  247 	clr	(0x02, sp)
                                    248 ;	./../../mib/stm8s_mib_debug_top.c: 106: ccprintf(_DEBUG_TOP_A_, ("\r\n [help or ?] to get a list of commands\r\n\r"));
      00AFB2 4B 01            [ 1]  249 	push	#<(__str_9+0)
      00AFB4 4B 8B            [ 1]  250 	push	#((__str_9+0) >> 8)
      00AFB6 CD 9F BD         [ 4]  251 	call	_mib_printf
      00AFB9 5B 02            [ 2]  252 	addw	sp, #2
                                    253 ;	./../../mib/stm8s_mib_debug_top.c: 107: cmd_list.cur = 0;
      00AFBB 35 00 00 49      [ 1]  254 	mov	_cmd_list+0, #0x00
                                    255 ;	./../../mib/stm8s_mib_debug_top.c: 108: cmd_list.next = 0;
      00AFBF AE 00 49         [ 2]  256 	ldw	x, #_cmd_list+0
      00AFC2 35 00 00 4A      [ 1]  257 	mov	_cmd_list+1, #0x00
                                    258 ;	./../../mib/stm8s_mib_debug_top.c: 109: memset((void *)(&cmd_list), 0, sizeof(cmd_list));
      00AFC6 4B 02            [ 1]  259 	push	#0x02
      00AFC8 4B 01            [ 1]  260 	push	#0x01
      00AFCA 4B 00            [ 1]  261 	push	#0x00
      00AFCC 4B 00            [ 1]  262 	push	#0x00
      00AFCE CD B3 97         [ 4]  263 	call	_memset
                                    264 ;	./../../mib/stm8s_mib_debug_top.c: 113: cmd_mem();
      00AFD1 CD A7 1E         [ 4]  265 	call	_cmd_mem
                                    266 ;	./../../mib/stm8s_mib_debug_top.c: 119: cmd_test();
      00AFD4 CD 8C 41         [ 4]  267 	call	_cmd_test
      00AFD7                        268 00118$:
                                    269 ;	./../../mib/stm8s_mib_debug_top.c: 125: ccprintf(1,("My>"));
      00AFD7 4B 2D            [ 1]  270 	push	#<(__str_10+0)
      00AFD9 4B 8B            [ 1]  271 	push	#((__str_10+0) >> 8)
      00AFDB CD 9F BD         [ 4]  272 	call	_mib_printf
      00AFDE 5B 02            [ 2]  273 	addw	sp, #2
                                    274 ;	./../../mib/stm8s_mib_debug_top.c: 127: GetCommand(cmd, CMD_CHAR_MAX - 1, 60*3);
      00AFE0 4B B4            [ 1]  275 	push	#0xb4
      00AFE2 4B 3F            [ 1]  276 	push	#0x3f
      00AFE4 4B 00            [ 1]  277 	push	#0x00
      00AFE6 96               [ 1]  278 	ldw	x, sp
      00AFE7 1C 00 04         [ 2]  279 	addw	x, #4
      00AFEA CD A0 3C         [ 4]  280 	call	_GetCommand
                                    281 ;	./../../mib/stm8s_mib_debug_top.c: 128: if (!cmd || !cmd[0]) continue;
      00AFED 7B 01            [ 1]  282 	ld	a, (0x01, sp)
      00AFEF 27 E6            [ 1]  283 	jreq	00118$
                                    284 ;	./../../mib/stm8s_mib_debug_top.c: 129: cmd_str = (char *)cmd;
                                    285 ;	./../../mib/stm8s_mib_debug_top.c: 130: argc = GetArgs(cmd_str, argv);
      00AFF1 96               [ 1]  286 	ldw	x, sp
      00AFF2 1C 00 41         [ 2]  287 	addw	x, #65
      00AFF5 89               [ 2]  288 	pushw	x
      00AFF6 96               [ 1]  289 	ldw	x, sp
      00AFF7 1C 00 03         [ 2]  290 	addw	x, #3
      00AFFA CD A2 37         [ 4]  291 	call	_GetArgs
      00AFFD 1F 4B            [ 2]  292 	ldw	(0x4b, sp), x
                                    293 ;	./../../mib/stm8s_mib_debug_top.c: 131: for (cptr = cmdTbl; cptr->cmd; cptr++)
      00AFFF AE 01 5E         [ 2]  294 	ldw	x, #(_cmdTbl+0)
      00B002 1F 4D            [ 2]  295 	ldw	(0x4d, sp), x
      00B004 1F 4F            [ 2]  296 	ldw	(0x4f, sp), x
      00B006                        297 00116$:
      00B006 1E 4F            [ 2]  298 	ldw	x, (0x4f, sp)
      00B008 FE               [ 2]  299 	ldw	x, (x)
      00B009 27 28            [ 1]  300 	jreq	00106$
                                    301 ;	./../../mib/stm8s_mib_debug_top.c: 133: if (!strcmp(argv[0], cptr->cmd))
      00B00B 16 41            [ 2]  302 	ldw	y, (0x41, sp)
      00B00D 89               [ 2]  303 	pushw	x
      00B00E 93               [ 1]  304 	ldw	x, y
      00B00F CD B3 C8         [ 4]  305 	call	_strcmp
      00B012 5D               [ 2]  306 	tnzw	x
      00B013 26 13            [ 1]  307 	jrne	00117$
                                    308 ;	./../../mib/stm8s_mib_debug_top.c: 135: (cptr->run)(cptr, argc, argv);
      00B015 16 4D            [ 2]  309 	ldw	y, (0x4d, sp)
      00B017 90 EE 02         [ 2]  310 	ldw	y, (0x2, y)
      00B01A 96               [ 1]  311 	ldw	x, sp
      00B01B 1C 00 41         [ 2]  312 	addw	x, #65
      00B01E 89               [ 2]  313 	pushw	x
      00B01F 1E 4D            [ 2]  314 	ldw	x, (0x4d, sp)
      00B021 89               [ 2]  315 	pushw	x
      00B022 1E 51            [ 2]  316 	ldw	x, (0x51, sp)
      00B024 90 FD            [ 4]  317 	call	(y)
                                    318 ;	./../../mib/stm8s_mib_debug_top.c: 136: break;
      00B026 20 0B            [ 2]  319 	jra	00106$
      00B028                        320 00117$:
                                    321 ;	./../../mib/stm8s_mib_debug_top.c: 131: for (cptr = cmdTbl; cptr->cmd; cptr++)
      00B028 1E 4F            [ 2]  322 	ldw	x, (0x4f, sp)
      00B02A 1C 00 06         [ 2]  323 	addw	x, #0x0006
      00B02D 1F 4F            [ 2]  324 	ldw	(0x4f, sp), x
      00B02F 1F 4D            [ 2]  325 	ldw	(0x4d, sp), x
      00B031 20 D3            [ 2]  326 	jra	00116$
      00B033                        327 00106$:
                                    328 ;	./../../mib/stm8s_mib_debug_top.c: 139: if (!strcmp(argv[0], "help") || !strcmp(argv[0], "?"))
      00B033 1E 41            [ 2]  329 	ldw	x, (0x41, sp)
      00B035 4B 31            [ 1]  330 	push	#<(___str_11+0)
      00B037 4B 8B            [ 1]  331 	push	#((___str_11+0) >> 8)
      00B039 CD B3 C8         [ 4]  332 	call	_strcmp
      00B03C 1F 4F            [ 2]  333 	ldw	(0x4f, sp), x
      00B03E 27 0C            [ 1]  334 	jreq	00107$
      00B040 1E 41            [ 2]  335 	ldw	x, (0x41, sp)
      00B042 4B 36            [ 1]  336 	push	#<(___str_12+0)
      00B044 4B 8B            [ 1]  337 	push	#((___str_12+0) >> 8)
      00B046 CD B3 C8         [ 4]  338 	call	_strcmp
      00B049 5D               [ 2]  339 	tnzw	x
      00B04A 26 0A            [ 1]  340 	jrne	00108$
      00B04C                        341 00107$:
                                    342 ;	./../../mib/stm8s_mib_debug_top.c: 141: DoPrintHelp(argc, argv);
      00B04C 96               [ 1]  343 	ldw	x, sp
      00B04D 1C 00 41         [ 2]  344 	addw	x, #65
      00B050 89               [ 2]  345 	pushw	x
      00B051 1E 4D            [ 2]  346 	ldw	x, (0x4d, sp)
      00B053 CD A6 72         [ 4]  347 	call	_DoPrintHelp
      00B056                        348 00108$:
                                    349 ;	./../../mib/stm8s_mib_debug_top.c: 143: if (!strcmp(argv[0], "q") || !strcmp(argv[0], "Q"))
      00B056 1E 41            [ 2]  350 	ldw	x, (0x41, sp)
      00B058 4B 38            [ 1]  351 	push	#<(___str_13+0)
      00B05A 4B 8B            [ 1]  352 	push	#((___str_13+0) >> 8)
      00B05C CD B3 C8         [ 4]  353 	call	_strcmp
      00B05F 5D               [ 2]  354 	tnzw	x
      00B060 27 14            [ 1]  355 	jreq	00110$
      00B062 16 41            [ 2]  356 	ldw	y, (0x41, sp)
      00B064 17 4F            [ 2]  357 	ldw	(0x4f, sp), y
      00B066 4B 3A            [ 1]  358 	push	#<(___str_14+0)
      00B068 4B 8B            [ 1]  359 	push	#((___str_14+0) >> 8)
      00B06A 1E 51            [ 2]  360 	ldw	x, (0x51, sp)
      00B06C CD B3 C8         [ 4]  361 	call	_strcmp
      00B06F 1F 4F            [ 2]  362 	ldw	(0x4f, sp), x
      00B071 27 03            [ 1]  363 	jreq	00168$
      00B073 CC AF D7         [ 2]  364 	jp	00118$
      00B076                        365 00168$:
      00B076                        366 00110$:
                                    367 ;	./../../mib/stm8s_mib_debug_top.c: 145: ccprintf(_DEBUG_TOP_A_,("\r\nmonitor program end!!!\r\n"));
      00B076 4B 3C            [ 1]  368 	push	#<(__str_15+0)
      00B078 4B 8B            [ 1]  369 	push	#((__str_15+0) >> 8)
      00B07A CD 9F BD         [ 4]  370 	call	_mib_printf
                                    371 ;	./../../mib/stm8s_mib_debug_top.c: 146: break;
                                    372 ;	./../../mib/stm8s_mib_debug_top.c: 150: }
      00B07D 5B 52            [ 2]  373 	addw	sp, #82
      00B07F 81               [ 4]  374 	ret
                                    375 	.area CODE
                                    376 	.area CONST
                                    377 	.area CONST
      0089AE                        378 __str_0:
      0089AE 0D                     379 	.db 0x0d
      0089AF 0A                     380 	.db 0x0a
      0089B0 20 23 23 23 23 23 23   381 	.ascii " ###################################"
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23
      0089D4 0D                     382 	.db 0x0d
      0089D5 0A                     383 	.db 0x0a
      0089D6 00                     384 	.db 0x00
                                    385 	.area CODE
                                    386 	.area CONST
      0089D7                        387 __str_1:
      0089D7 20 66 69 6C 65 20 6E   388 	.ascii " file name : ./../../mib/stm8s_mib_debug_top.c"
             61 6D 65 20 3A 20 2E
             2F 2E 2E 2F 2E 2E 2F
             6D 69 62 2F 73 74 6D
             38 73 5F 6D 69 62 5F
             64 65 62 75 67 5F 74
             6F 70 2E 63
      008A05 0D                     389 	.db 0x0d
      008A06 0A                     390 	.db 0x0a
      008A07 00                     391 	.db 0x00
                                    392 	.area CODE
                                    393 	.area CONST
      008A08                        394 __str_2:
      008A08 20 64 61 74 65 20 3A   395 	.ascii " date :  Jun 16 2023  :  11:23:52"
             20 20 4A 75 6E 20 31
             36 20 32 30 32 33 20
             20 3A 20 20 31 31 3A
             32 33 3A 35 32
      008A29 0D                     396 	.db 0x0d
      008A2A 0A                     397 	.db 0x0a
      008A2B 00                     398 	.db 0x00
                                    399 	.area CODE
                                    400 	.area CONST
      008A2C                        401 __str_3:
      008A2C 20 77 65 62 67 70 69   402 	.ascii " webgpio.com by MYMEDIA Co., Ltd."
             6F 2E 63 6F 6D 20 62
             79 20 4D 59 4D 45 44
             49 41 20 43 6F 2E 2C
             20 4C 74 64 2E
      008A4D 0D                     403 	.db 0x0d
      008A4E 0A                     404 	.db 0x0a
      008A4F 00                     405 	.db 0x00
                                    406 	.area CODE
                                    407 	.area CONST
      008A50                        408 __str_4:
      008A50 20 23 23 23 23 23 23   409 	.ascii " ###################################"
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23
      008A74 0D                     410 	.db 0x0d
      008A75 0A                     411 	.db 0x0a
      008A76 00                     412 	.db 0x00
                                    413 	.area CODE
                                    414 	.area CONST
      008A77                        415 __str_5:
      008A77 58 20 63 6F 2D 6F 72   416 	.ascii "X co-ordinate on the wafer [%02X][%02X]"
             64 69 6E 61 74 65 20
             6F 6E 20 74 68 65 20
             77 61 66 65 72 20 5B
             25 30 32 58 5D 5B 25
             30 32 58 5D
      008A9E 0D                     417 	.db 0x0d
      008A9F 0A                     418 	.db 0x0a
      008AA0 00                     419 	.db 0x00
                                    420 	.area CODE
                                    421 	.area CONST
      008AA1                        422 __str_6:
      008AA1 59 20 63 6F 2D 6F 72   423 	.ascii "Y co-ordinate on the wafer [%02X][%02X]"
             64 69 6E 61 74 65 20
             6F 6E 20 74 68 65 20
             77 61 66 65 72 20 5B
             25 30 32 58 5D 5B 25
             30 32 58 5D
      008AC8 0D                     424 	.db 0x0d
      008AC9 0A                     425 	.db 0x0a
      008ACA 00                     426 	.db 0x00
                                    427 	.area CODE
                                    428 	.area CONST
      008ACB                        429 __str_7:
      008ACB 57 61 66 65 72 20 6E   430 	.ascii "Wafer number               [%02X]"
             75 6D 62 65 72 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 5B
             25 30 32 58 5D
      008AEC 0D                     431 	.db 0x0d
      008AED 0A                     432 	.db 0x0a
      008AEE 00                     433 	.db 0x00
                                    434 	.area CODE
                                    435 	.area CONST
      008AEF                        436 __str_8:
      008AEF 4C 6F 74 20 6E 75 6D   437 	.ascii "Lot number [%s]"
             62 65 72 20 5B 25 73
             5D
      008AFE 0D                     438 	.db 0x0d
      008AFF 0A                     439 	.db 0x0a
      008B00 00                     440 	.db 0x00
                                    441 	.area CODE
                                    442 	.area CONST
      008B01                        443 __str_9:
      008B01 0D                     444 	.db 0x0d
      008B02 0A                     445 	.db 0x0a
      008B03 20 5B 68 65 6C 70 20   446 	.ascii " [help or ?] to get a list of commands"
             6F 72 20 3F 5D 20 74
             6F 20 67 65 74 20 61
             20 6C 69 73 74 20 6F
             66 20 63 6F 6D 6D 61
             6E 64 73
      008B29 0D                     447 	.db 0x0d
      008B2A 0A                     448 	.db 0x0a
      008B2B 0D                     449 	.db 0x0d
      008B2C 00                     450 	.db 0x00
                                    451 	.area CODE
                                    452 	.area CONST
      008B2D                        453 __str_10:
      008B2D 4D 79 3E               454 	.ascii "My>"
      008B30 00                     455 	.db 0x00
                                    456 	.area CODE
                                    457 	.area CONST
      008B31                        458 ___str_11:
      008B31 68 65 6C 70            459 	.ascii "help"
      008B35 00                     460 	.db 0x00
                                    461 	.area CODE
                                    462 	.area CONST
      008B36                        463 ___str_12:
      008B36 3F                     464 	.ascii "?"
      008B37 00                     465 	.db 0x00
                                    466 	.area CODE
                                    467 	.area CONST
      008B38                        468 ___str_13:
      008B38 71                     469 	.ascii "q"
      008B39 00                     470 	.db 0x00
                                    471 	.area CODE
                                    472 	.area CONST
      008B3A                        473 ___str_14:
      008B3A 51                     474 	.ascii "Q"
      008B3B 00                     475 	.db 0x00
                                    476 	.area CODE
                                    477 	.area CONST
      008B3C                        478 __str_15:
      008B3C 0D                     479 	.db 0x0d
      008B3D 0A                     480 	.db 0x0a
      008B3E 6D 6F 6E 69 74 6F 72   481 	.ascii "monitor program end!!!"
             20 70 72 6F 67 72 61
             6D 20 65 6E 64 21 21
             21
      008B54 0D                     482 	.db 0x0d
      008B55 0A                     483 	.db 0x0a
      008B56 00                     484 	.db 0x00
                                    485 	.area CODE
                                    486 	.area INITIALIZER
                                    487 	.area CABS (ABS)
