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
      00C405                         35 __start__stack:
      00C405                         36 	.ds	1
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
      008004 82 00 A8 46             57 	int _TRAP_IRQHandler ; trap
      008008 82 00 A8 47             58 	int _TLI_IRQHandler ; int0
      00800C 82 00 A8 48             59 	int _AWU_IRQHandler ; int1
      008010 82 00 A8 49             60 	int _CLK_IRQHandler ; int2
      008014 82 00 A8 4A             61 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 A8 4B             62 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 A8 4C             63 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 A8 4D             64 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 A8 4E             65 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 00 00             66 	int 0x000000 ; int8
      00802C 82 00 00 00             67 	int 0x000000 ; int9
      008030 82 00 A8 4F             68 	int _SPI_IRQHandler ; int10
      008034 82 00 A8 50             69 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 A8 56             70 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 A8 5C             71 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 A8 5D             72 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 A8 5E             73 	int _TIM3_UPD_OVF_BRK_IRQHandler ; int15
      008048 82 00 A8 5F             74 	int _TIM3_CAP_COM_IRQHandler ; int16
      00804C 82 00 00 00             75 	int 0x000000 ; int17
      008050 82 00 00 00             76 	int 0x000000 ; int18
      008054 82 00 A8 60             77 	int _I2C_IRQHandler ; int19
      008058 82 00 A8 61             78 	int _UART2_TX_IRQHandler ; int20
      00805C 82 00 A8 62             79 	int _UART2_RX_IRQHandler ; int21
      008060 82 00 A8 68             80 	int _ADC1_IRQHandler ; int22
      008064 82 00 A8 69             81 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 A8 73             82 	int _EEPROM_EEC_IRQHandler ; int24
                                     83 ;--------------------------------------------------------
                                     84 ; global & static initialisations
                                     85 ;--------------------------------------------------------
                                     86 	.area HOME
                                     87 	.area GSINIT
                                     88 	.area GSFINAL
                                     89 	.area GSINIT
      00806F CD C3 25         [ 4]   90 	call	___sdcc_external_startup
      008072                         91 __sdcc_init_data:
                                     92 ; stm8_genXINIT() start
      008072 AE 01 49         [ 2]   93 	ldw x, #l_DATA
      008075 27 07            [ 1]   94 	jreq	00002$
      008077                         95 00001$:
      008077 72 4F 00 00      [ 1]   96 	clr (s_DATA - 1, x)
      00807B 5A               [ 2]   97 	decw x
      00807C 26 F9            [ 1]   98 	jrne	00001$
      00807E                         99 00002$:
      00807E AE 00 44         [ 2]  100 	ldw	x, #l_INITIALIZER
      008081 27 09            [ 1]  101 	jreq	00004$
      008083                        102 00003$:
      008083 D6 92 04         [ 1]  103 	ld	a, (s_INITIALIZER - 1, x)
      008086 D7 01 49         [ 1]  104 	ld	(s_INITIALIZED - 1, x), a
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
      00806C CC BF 6D         [ 2]  117 	jp	_main
                                    118 ;	return from main will return to caller
                                    119 ;--------------------------------------------------------
                                    120 ; code
                                    121 ;--------------------------------------------------------
                                    122 	.area CODE
                                    123 ;	./../../mib/stm8s_mib_debug_top.c: 45: void main(void)
                                    124 ;	-----------------------------------------
                                    125 ;	 function main
                                    126 ;	-----------------------------------------
      00BF6D                        127 _main:
      00BF6D 52 10            [ 2]  128 	sub	sp, #16
                                    129 ;	./../../mib/stm8s_mib_debug_top.c: 51: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);  
      00BF6F C6 50 C6         [ 1]  130 	ld	a, 0x50c6
      00BF72 A4 E7            [ 1]  131 	and	a, #0xe7
      00BF74 C7 50 C6         [ 1]  132 	ld	0x50c6, a
                                    133 ;	./../../mib/stm8s_mib_debug_top.c: 53: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
      00BF77 C6 50 C6         [ 1]  134 	ld	a, 0x50c6
      00BF7A C7 50 C6         [ 1]  135 	ld	0x50c6, a
                                    136 ;	./../../mib/stm8s_mib_debug_top.c: 56: MibDebugInit(9600);
      00BF7D 4B 80            [ 1]  137 	push	#0x80
      00BF7F 4B 25            [ 1]  138 	push	#0x25
      00BF81 5F               [ 1]  139 	clrw	x
      00BF82 89               [ 2]  140 	pushw	x
      00BF83 CD A6 63         [ 4]  141 	call	_MibDebugInit
                                    142 ;	./../../mib/stm8s_mib_debug_top.c: 57: timIrqInit();
      00BF86 CD B0 60         [ 4]  143 	call	_timIrqInit
                                    144 ;	./../../mib/stm8s_mib_debug_top.c: 61: cmd_test_init_before_irq_enable();
      00BF89 CD 92 AE         [ 4]  145 	call	_cmd_test_init_before_irq_enable
                                    146 ;	./../../mib/stm8s_mib_debug_top.c: 66: enableInterrupts();
      00BF8C 9A               [ 1]  147 	rim
                                    148 ;	./../../mib/stm8s_mib_debug_top.c: 73: for(vbIndexID=0;vbIndexID<12;vbIndexID++)
      00BF8D 90 AE 48 CD      [ 2]  149 	ldw	y, #0x48cd
      00BF91 0F 10            [ 1]  150 	clr	(0x10, sp)
      00BF93                        151 00105$:
                                    152 ;	./../../mib/stm8s_mib_debug_top.c: 75: vbBufferID[vbIndexID] = *vpbUniqueID++;
      00BF93 5F               [ 1]  153 	clrw	x
      00BF94 7B 10            [ 1]  154 	ld	a, (0x10, sp)
      00BF96 97               [ 1]  155 	ld	xl, a
      00BF97 89               [ 2]  156 	pushw	x
      00BF98 96               [ 1]  157 	ldw	x, sp
      00BF99 1C 00 05         [ 2]  158 	addw	x, #5
      00BF9C 72 FB 01         [ 2]  159 	addw	x, (1, sp)
      00BF9F 5B 02            [ 2]  160 	addw	sp, #2
      00BFA1 90 F6            [ 1]  161 	ld	a, (y)
      00BFA3 90 5C            [ 1]  162 	incw	y
      00BFA5 F7               [ 1]  163 	ld	(x), a
                                    164 ;	./../../mib/stm8s_mib_debug_top.c: 73: for(vbIndexID=0;vbIndexID<12;vbIndexID++)
      00BFA6 0C 10            [ 1]  165 	inc	(0x10, sp)
      00BFA8 7B 10            [ 1]  166 	ld	a, (0x10, sp)
      00BFAA A1 0C            [ 1]  167 	cp	a, #0x0c
      00BFAC 25 E5            [ 1]  168 	jrc	00105$
                                    169 ;	./../../mib/stm8s_mib_debug_top.c: 77: vbBufferID[12] = 0;
      00BFAE 0F 0F            [ 1]  170 	clr	(0x0f, sp)
                                    171 ;	./../../mib/stm8s_mib_debug_top.c: 78: MibWriteDebugStringCheck(1, "\r\n ###################################\r\n");
      00BFB0 AE 90 5C         [ 2]  172 	ldw	x, #(__str_0+0)
      00BFB3 CD A6 1F         [ 4]  173 	call	_MibWriteDebugString
                                    174 ;	./../../mib/stm8s_mib_debug_top.c: 79: MibWriteDebugStringCheck(1, " file name : " __FILE__ "\r\n");
      00BFB6 AE 90 85         [ 2]  175 	ldw	x, #(__str_1+0)
      00BFB9 CD A6 1F         [ 4]  176 	call	_MibWriteDebugString
                                    177 ;	./../../mib/stm8s_mib_debug_top.c: 80: MibWriteDebugStringCheck(1, " date :  "__DATE__"  :  "__TIME__"\r\n");
      00BFBC AE 90 B6         [ 2]  178 	ldw	x, #(__str_2+0)
      00BFBF CD A6 1F         [ 4]  179 	call	_MibWriteDebugString
                                    180 ;	./../../mib/stm8s_mib_debug_top.c: 81: MibWriteDebugStringCheck(1, " webgpio.com by MYMEDIA Co., Ltd.\r\n");
      00BFC2 AE 90 DA         [ 2]  181 	ldw	x, #(__str_3+0)
      00BFC5 CD A6 1F         [ 4]  182 	call	_MibWriteDebugString
                                    183 ;	./../../mib/stm8s_mib_debug_top.c: 82: MibWriteDebugStringCheck(1, " ###################################\r\n");    
      00BFC8 AE 90 FE         [ 2]  184 	ldw	x, #(__str_4+0)
      00BFCB CD A6 1F         [ 4]  185 	call	_MibWriteDebugString
                                    186 ;	./../../mib/stm8s_mib_debug_top.c: 83: ccprintf(_DEBUG_TOP_A_, ("X co-ordinate on the wafer [%02X][%02X]\r\n",vbBufferID[0],vbBufferID[1]));
      00BFCE 7B 04            [ 1]  187 	ld	a, (0x04, sp)
      00BFD0 90 5F            [ 1]  188 	clrw	y
      00BFD2 90 97            [ 1]  189 	ld	yl, a
      00BFD4 7B 03            [ 1]  190 	ld	a, (0x03, sp)
      00BFD6 5F               [ 1]  191 	clrw	x
      00BFD7 97               [ 1]  192 	ld	xl, a
      00BFD8 90 89            [ 2]  193 	pushw	y
      00BFDA 89               [ 2]  194 	pushw	x
      00BFDB 4B 25            [ 1]  195 	push	#<(__str_5+0)
      00BFDD 4B 91            [ 1]  196 	push	#((__str_5+0) >> 8)
      00BFDF CD B0 3B         [ 4]  197 	call	_mib_printf
      00BFE2 5B 06            [ 2]  198 	addw	sp, #6
                                    199 ;	./../../mib/stm8s_mib_debug_top.c: 84: ccprintf(_DEBUG_TOP_A_, ("Y co-ordinate on the wafer [%02X][%02X]\r\n",vbBufferID[2],vbBufferID[3]));
      00BFE4 7B 06            [ 1]  200 	ld	a, (0x06, sp)
      00BFE6 5F               [ 1]  201 	clrw	x
      00BFE7 97               [ 1]  202 	ld	xl, a
      00BFE8 7B 05            [ 1]  203 	ld	a, (0x05, sp)
      00BFEA 0F 01            [ 1]  204 	clr	(0x01, sp)
      00BFEC 89               [ 2]  205 	pushw	x
      00BFED 88               [ 1]  206 	push	a
      00BFEE 7B 04            [ 1]  207 	ld	a, (0x04, sp)
      00BFF0 88               [ 1]  208 	push	a
      00BFF1 4B 4F            [ 1]  209 	push	#<(__str_6+0)
      00BFF3 4B 91            [ 1]  210 	push	#((__str_6+0) >> 8)
      00BFF5 CD B0 3B         [ 4]  211 	call	_mib_printf
      00BFF8 5B 06            [ 2]  212 	addw	sp, #6
                                    213 ;	./../../mib/stm8s_mib_debug_top.c: 85: ccprintf(_DEBUG_TOP_A_, ("Wafer number               [%02X]\r\n",vbBufferID[4]));
      00BFFA 7B 07            [ 1]  214 	ld	a, (0x07, sp)
      00BFFC 5F               [ 1]  215 	clrw	x
      00BFFD 97               [ 1]  216 	ld	xl, a
      00BFFE 89               [ 2]  217 	pushw	x
      00BFFF 4B 79            [ 1]  218 	push	#<(__str_7+0)
      00C001 4B 91            [ 1]  219 	push	#((__str_7+0) >> 8)
      00C003 CD B0 3B         [ 4]  220 	call	_mib_printf
      00C006 5B 04            [ 2]  221 	addw	sp, #4
                                    222 ;	./../../mib/stm8s_mib_debug_top.c: 86: ccprintf(_DEBUG_TOP_A_, ("Lot number [%s]\r\n",&(vbBufferID[5])));
      00C008 96               [ 1]  223 	ldw	x, sp
      00C009 1C 00 08         [ 2]  224 	addw	x, #8
      00C00C 89               [ 2]  225 	pushw	x
      00C00D 4B 9D            [ 1]  226 	push	#<(__str_8+0)
      00C00F 4B 91            [ 1]  227 	push	#((__str_8+0) >> 8)
      00C011 CD B0 3B         [ 4]  228 	call	_mib_printf
      00C014 5B 04            [ 2]  229 	addw	sp, #4
                                    230 ;	./../../mib/stm8s_mib_debug_top.c: 88: debug_main();
      00C016 CD C0 1E         [ 4]  231 	call	_debug_main
                                    232 ;	./../../mib/stm8s_mib_debug_top.c: 90: while(1);
      00C019                        233 00103$:
      00C019 20 FE            [ 2]  234 	jra	00103$
                                    235 ;	./../../mib/stm8s_mib_debug_top.c: 91: }
      00C01B 5B 10            [ 2]  236 	addw	sp, #16
      00C01D 81               [ 4]  237 	ret
                                    238 ;	./../../mib/stm8s_mib_debug_top.c: 95: void debug_main(void)
                                    239 ;	-----------------------------------------
                                    240 ;	 function debug_main
                                    241 ;	-----------------------------------------
      00C01E                        242 _debug_main:
      00C01E 52 50            [ 2]  243 	sub	sp, #80
                                    244 ;	./../../mib/stm8s_mib_debug_top.c: 104: cmd[0] = 0;
      00C020 0F 01            [ 1]  245 	clr	(0x01, sp)
                                    246 ;	./../../mib/stm8s_mib_debug_top.c: 105: cmd[1] = 0;
      00C022 0F 02            [ 1]  247 	clr	(0x02, sp)
                                    248 ;	./../../mib/stm8s_mib_debug_top.c: 106: ccprintf(_DEBUG_TOP_A_, ("\r\n [help or ?] to get a list of commands\r\n\r"));
      00C024 4B AF            [ 1]  249 	push	#<(__str_9+0)
      00C026 4B 91            [ 1]  250 	push	#((__str_9+0) >> 8)
      00C028 CD B0 3B         [ 4]  251 	call	_mib_printf
      00C02B 5B 02            [ 2]  252 	addw	sp, #2
                                    253 ;	./../../mib/stm8s_mib_debug_top.c: 107: cmd_list.cur = 0;
      00C02D 35 00 00 48      [ 1]  254 	mov	_cmd_list+0, #0x00
                                    255 ;	./../../mib/stm8s_mib_debug_top.c: 108: cmd_list.next = 0;
      00C031 AE 00 48         [ 2]  256 	ldw	x, #_cmd_list+0
      00C034 35 00 00 49      [ 1]  257 	mov	_cmd_list+1, #0x00
                                    258 ;	./../../mib/stm8s_mib_debug_top.c: 109: memset((void *)(&cmd_list), 0, sizeof(cmd_list));
      00C038 4B 02            [ 1]  259 	push	#0x02
      00C03A 4B 01            [ 1]  260 	push	#0x01
      00C03C 4B 00            [ 1]  261 	push	#0x00
      00C03E 4B 00            [ 1]  262 	push	#0x00
      00C040 CD C3 03         [ 4]  263 	call	_memset
                                    264 ;	./../../mib/stm8s_mib_debug_top.c: 113: cmd_mem();
      00C043 CD B7 90         [ 4]  265 	call	_cmd_mem
                                    266 ;	./../../mib/stm8s_mib_debug_top.c: 119: cmd_test();
      00C046 CD 92 AB         [ 4]  267 	call	_cmd_test
      00C049                        268 00118$:
                                    269 ;	./../../mib/stm8s_mib_debug_top.c: 125: ccprintf(1,("My>"));
      00C049 4B DB            [ 1]  270 	push	#<(__str_10+0)
      00C04B 4B 91            [ 1]  271 	push	#((__str_10+0) >> 8)
      00C04D CD B0 3B         [ 4]  272 	call	_mib_printf
      00C050 5B 02            [ 2]  273 	addw	sp, #2
                                    274 ;	./../../mib/stm8s_mib_debug_top.c: 127: GetCommand(cmd, CMD_CHAR_MAX - 1, 60);
      00C052 4B 3C            [ 1]  275 	push	#0x3c
      00C054 4B 3F            [ 1]  276 	push	#0x3f
      00C056 4B 00            [ 1]  277 	push	#0x00
      00C058 96               [ 1]  278 	ldw	x, sp
      00C059 1C 00 04         [ 2]  279 	addw	x, #4
      00C05C CD B0 B5         [ 4]  280 	call	_GetCommand
                                    281 ;	./../../mib/stm8s_mib_debug_top.c: 128: if (!cmd || !cmd[0]) continue;
      00C05F 7B 01            [ 1]  282 	ld	a, (0x01, sp)
      00C061 27 E6            [ 1]  283 	jreq	00118$
                                    284 ;	./../../mib/stm8s_mib_debug_top.c: 129: cmd_str = (char *)cmd;
                                    285 ;	./../../mib/stm8s_mib_debug_top.c: 130: argc = GetArgs(cmd_str, argv);
      00C063 96               [ 1]  286 	ldw	x, sp
      00C064 1C 00 41         [ 2]  287 	addw	x, #65
      00C067 89               [ 2]  288 	pushw	x
      00C068 96               [ 1]  289 	ldw	x, sp
      00C069 1C 00 03         [ 2]  290 	addw	x, #3
      00C06C CD B2 A9         [ 4]  291 	call	_GetArgs
      00C06F 1F 4B            [ 2]  292 	ldw	(0x4b, sp), x
                                    293 ;	./../../mib/stm8s_mib_debug_top.c: 131: for (cptr = cmdTbl; cptr->cmd; cptr++)
      00C071 AE 01 5E         [ 2]  294 	ldw	x, #(_cmdTbl+0)
      00C074 1F 4D            [ 2]  295 	ldw	(0x4d, sp), x
      00C076 1F 4F            [ 2]  296 	ldw	(0x4f, sp), x
      00C078                        297 00116$:
      00C078 1E 4F            [ 2]  298 	ldw	x, (0x4f, sp)
      00C07A FE               [ 2]  299 	ldw	x, (x)
      00C07B 27 28            [ 1]  300 	jreq	00106$
                                    301 ;	./../../mib/stm8s_mib_debug_top.c: 133: if (!strcmp(argv[0], cptr->cmd))
      00C07D 16 41            [ 2]  302 	ldw	y, (0x41, sp)
      00C07F 89               [ 2]  303 	pushw	x
      00C080 93               [ 1]  304 	ldw	x, y
      00C081 CD C3 34         [ 4]  305 	call	_strcmp
      00C084 5D               [ 2]  306 	tnzw	x
      00C085 26 13            [ 1]  307 	jrne	00117$
                                    308 ;	./../../mib/stm8s_mib_debug_top.c: 135: (cptr->run)(cptr, argc, argv);
      00C087 16 4D            [ 2]  309 	ldw	y, (0x4d, sp)
      00C089 90 EE 02         [ 2]  310 	ldw	y, (0x2, y)
      00C08C 96               [ 1]  311 	ldw	x, sp
      00C08D 1C 00 41         [ 2]  312 	addw	x, #65
      00C090 89               [ 2]  313 	pushw	x
      00C091 1E 4D            [ 2]  314 	ldw	x, (0x4d, sp)
      00C093 89               [ 2]  315 	pushw	x
      00C094 1E 51            [ 2]  316 	ldw	x, (0x51, sp)
      00C096 90 FD            [ 4]  317 	call	(y)
                                    318 ;	./../../mib/stm8s_mib_debug_top.c: 136: break;
      00C098 20 0B            [ 2]  319 	jra	00106$
      00C09A                        320 00117$:
                                    321 ;	./../../mib/stm8s_mib_debug_top.c: 131: for (cptr = cmdTbl; cptr->cmd; cptr++)
      00C09A 1E 4F            [ 2]  322 	ldw	x, (0x4f, sp)
      00C09C 1C 00 06         [ 2]  323 	addw	x, #0x0006
      00C09F 1F 4F            [ 2]  324 	ldw	(0x4f, sp), x
      00C0A1 1F 4D            [ 2]  325 	ldw	(0x4d, sp), x
      00C0A3 20 D3            [ 2]  326 	jra	00116$
      00C0A5                        327 00106$:
                                    328 ;	./../../mib/stm8s_mib_debug_top.c: 139: if (!strcmp(argv[0], "help") || !strcmp(argv[0], "?"))
      00C0A5 1E 41            [ 2]  329 	ldw	x, (0x41, sp)
      00C0A7 4B DF            [ 1]  330 	push	#<(___str_11+0)
      00C0A9 4B 91            [ 1]  331 	push	#((___str_11+0) >> 8)
      00C0AB CD C3 34         [ 4]  332 	call	_strcmp
      00C0AE 1F 4F            [ 2]  333 	ldw	(0x4f, sp), x
      00C0B0 27 0C            [ 1]  334 	jreq	00107$
      00C0B2 1E 41            [ 2]  335 	ldw	x, (0x41, sp)
      00C0B4 4B E4            [ 1]  336 	push	#<(___str_12+0)
      00C0B6 4B 91            [ 1]  337 	push	#((___str_12+0) >> 8)
      00C0B8 CD C3 34         [ 4]  338 	call	_strcmp
      00C0BB 5D               [ 2]  339 	tnzw	x
      00C0BC 26 0A            [ 1]  340 	jrne	00108$
      00C0BE                        341 00107$:
                                    342 ;	./../../mib/stm8s_mib_debug_top.c: 141: DoPrintHelp(argc, argv);
      00C0BE 96               [ 1]  343 	ldw	x, sp
      00C0BF 1C 00 41         [ 2]  344 	addw	x, #65
      00C0C2 89               [ 2]  345 	pushw	x
      00C0C3 1E 4D            [ 2]  346 	ldw	x, (0x4d, sp)
      00C0C5 CD B6 E4         [ 4]  347 	call	_DoPrintHelp
      00C0C8                        348 00108$:
                                    349 ;	./../../mib/stm8s_mib_debug_top.c: 143: if (!strcmp(argv[0], "q") || !strcmp(argv[0], "Q"))
      00C0C8 1E 41            [ 2]  350 	ldw	x, (0x41, sp)
      00C0CA 4B E6            [ 1]  351 	push	#<(___str_13+0)
      00C0CC 4B 91            [ 1]  352 	push	#((___str_13+0) >> 8)
      00C0CE CD C3 34         [ 4]  353 	call	_strcmp
      00C0D1 5D               [ 2]  354 	tnzw	x
      00C0D2 27 14            [ 1]  355 	jreq	00110$
      00C0D4 16 41            [ 2]  356 	ldw	y, (0x41, sp)
      00C0D6 17 4F            [ 2]  357 	ldw	(0x4f, sp), y
      00C0D8 4B E8            [ 1]  358 	push	#<(___str_14+0)
      00C0DA 4B 91            [ 1]  359 	push	#((___str_14+0) >> 8)
      00C0DC 1E 51            [ 2]  360 	ldw	x, (0x51, sp)
      00C0DE CD C3 34         [ 4]  361 	call	_strcmp
      00C0E1 1F 4F            [ 2]  362 	ldw	(0x4f, sp), x
      00C0E3 27 03            [ 1]  363 	jreq	00168$
      00C0E5 CC C0 49         [ 2]  364 	jp	00118$
      00C0E8                        365 00168$:
      00C0E8                        366 00110$:
                                    367 ;	./../../mib/stm8s_mib_debug_top.c: 145: ccprintf(_DEBUG_TOP_A_,("\r\nmonitor program end!!!\r\n"));
      00C0E8 4B EA            [ 1]  368 	push	#<(__str_15+0)
      00C0EA 4B 91            [ 1]  369 	push	#((__str_15+0) >> 8)
      00C0EC CD B0 3B         [ 4]  370 	call	_mib_printf
                                    371 ;	./../../mib/stm8s_mib_debug_top.c: 146: break;
                                    372 ;	./../../mib/stm8s_mib_debug_top.c: 150: }
      00C0EF 5B 52            [ 2]  373 	addw	sp, #82
      00C0F1 81               [ 4]  374 	ret
                                    375 	.area CODE
                                    376 	.area CONST
                                    377 	.area CONST
      00905C                        378 __str_0:
      00905C 0D                     379 	.db 0x0d
      00905D 0A                     380 	.db 0x0a
      00905E 20 23 23 23 23 23 23   381 	.ascii " ###################################"
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23
      009082 0D                     382 	.db 0x0d
      009083 0A                     383 	.db 0x0a
      009084 00                     384 	.db 0x00
                                    385 	.area CODE
                                    386 	.area CONST
      009085                        387 __str_1:
      009085 20 66 69 6C 65 20 6E   388 	.ascii " file name : ./../../mib/stm8s_mib_debug_top.c"
             61 6D 65 20 3A 20 2E
             2F 2E 2E 2F 2E 2E 2F
             6D 69 62 2F 73 74 6D
             38 73 5F 6D 69 62 5F
             64 65 62 75 67 5F 74
             6F 70 2E 63
      0090B3 0D                     389 	.db 0x0d
      0090B4 0A                     390 	.db 0x0a
      0090B5 00                     391 	.db 0x00
                                    392 	.area CODE
                                    393 	.area CONST
      0090B6                        394 __str_2:
      0090B6 20 64 61 74 65 20 3A   395 	.ascii " date :  Mar 13 2023  :  20:44:16"
             20 20 4D 61 72 20 31
             33 20 32 30 32 33 20
             20 3A 20 20 32 30 3A
             34 34 3A 31 36
      0090D7 0D                     396 	.db 0x0d
      0090D8 0A                     397 	.db 0x0a
      0090D9 00                     398 	.db 0x00
                                    399 	.area CODE
                                    400 	.area CONST
      0090DA                        401 __str_3:
      0090DA 20 77 65 62 67 70 69   402 	.ascii " webgpio.com by MYMEDIA Co., Ltd."
             6F 2E 63 6F 6D 20 62
             79 20 4D 59 4D 45 44
             49 41 20 43 6F 2E 2C
             20 4C 74 64 2E
      0090FB 0D                     403 	.db 0x0d
      0090FC 0A                     404 	.db 0x0a
      0090FD 00                     405 	.db 0x00
                                    406 	.area CODE
                                    407 	.area CONST
      0090FE                        408 __str_4:
      0090FE 20 23 23 23 23 23 23   409 	.ascii " ###################################"
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23
      009122 0D                     410 	.db 0x0d
      009123 0A                     411 	.db 0x0a
      009124 00                     412 	.db 0x00
                                    413 	.area CODE
                                    414 	.area CONST
      009125                        415 __str_5:
      009125 58 20 63 6F 2D 6F 72   416 	.ascii "X co-ordinate on the wafer [%02X][%02X]"
             64 69 6E 61 74 65 20
             6F 6E 20 74 68 65 20
             77 61 66 65 72 20 5B
             25 30 32 58 5D 5B 25
             30 32 58 5D
      00914C 0D                     417 	.db 0x0d
      00914D 0A                     418 	.db 0x0a
      00914E 00                     419 	.db 0x00
                                    420 	.area CODE
                                    421 	.area CONST
      00914F                        422 __str_6:
      00914F 59 20 63 6F 2D 6F 72   423 	.ascii "Y co-ordinate on the wafer [%02X][%02X]"
             64 69 6E 61 74 65 20
             6F 6E 20 74 68 65 20
             77 61 66 65 72 20 5B
             25 30 32 58 5D 5B 25
             30 32 58 5D
      009176 0D                     424 	.db 0x0d
      009177 0A                     425 	.db 0x0a
      009178 00                     426 	.db 0x00
                                    427 	.area CODE
                                    428 	.area CONST
      009179                        429 __str_7:
      009179 57 61 66 65 72 20 6E   430 	.ascii "Wafer number               [%02X]"
             75 6D 62 65 72 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 5B
             25 30 32 58 5D
      00919A 0D                     431 	.db 0x0d
      00919B 0A                     432 	.db 0x0a
      00919C 00                     433 	.db 0x00
                                    434 	.area CODE
                                    435 	.area CONST
      00919D                        436 __str_8:
      00919D 4C 6F 74 20 6E 75 6D   437 	.ascii "Lot number [%s]"
             62 65 72 20 5B 25 73
             5D
      0091AC 0D                     438 	.db 0x0d
      0091AD 0A                     439 	.db 0x0a
      0091AE 00                     440 	.db 0x00
                                    441 	.area CODE
                                    442 	.area CONST
      0091AF                        443 __str_9:
      0091AF 0D                     444 	.db 0x0d
      0091B0 0A                     445 	.db 0x0a
      0091B1 20 5B 68 65 6C 70 20   446 	.ascii " [help or ?] to get a list of commands"
             6F 72 20 3F 5D 20 74
             6F 20 67 65 74 20 61
             20 6C 69 73 74 20 6F
             66 20 63 6F 6D 6D 61
             6E 64 73
      0091D7 0D                     447 	.db 0x0d
      0091D8 0A                     448 	.db 0x0a
      0091D9 0D                     449 	.db 0x0d
      0091DA 00                     450 	.db 0x00
                                    451 	.area CODE
                                    452 	.area CONST
      0091DB                        453 __str_10:
      0091DB 4D 79 3E               454 	.ascii "My>"
      0091DE 00                     455 	.db 0x00
                                    456 	.area CODE
                                    457 	.area CONST
      0091DF                        458 ___str_11:
      0091DF 68 65 6C 70            459 	.ascii "help"
      0091E3 00                     460 	.db 0x00
                                    461 	.area CODE
                                    462 	.area CONST
      0091E4                        463 ___str_12:
      0091E4 3F                     464 	.ascii "?"
      0091E5 00                     465 	.db 0x00
                                    466 	.area CODE
                                    467 	.area CONST
      0091E6                        468 ___str_13:
      0091E6 71                     469 	.ascii "q"
      0091E7 00                     470 	.db 0x00
                                    471 	.area CODE
                                    472 	.area CONST
      0091E8                        473 ___str_14:
      0091E8 51                     474 	.ascii "Q"
      0091E9 00                     475 	.db 0x00
                                    476 	.area CODE
                                    477 	.area CONST
      0091EA                        478 __str_15:
      0091EA 0D                     479 	.db 0x0d
      0091EB 0A                     480 	.db 0x0a
      0091EC 6D 6F 6E 69 74 6F 72   481 	.ascii "monitor program end!!!"
             20 70 72 6F 67 72 61
             6D 20 65 6E 64 21 21
             21
      009202 0D                     482 	.db 0x0d
      009203 0A                     483 	.db 0x0a
      009204 00                     484 	.db 0x00
                                    485 	.area CODE
                                    486 	.area INITIALIZER
                                    487 	.area CABS (ABS)
