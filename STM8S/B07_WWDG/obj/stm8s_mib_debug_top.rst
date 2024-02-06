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
      00A9E4                         35 __start__stack:
      00A9E4                         36 	.ds	1
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
      008004 82 00 8E 8C             57 	int _TRAP_IRQHandler ; trap
      008008 82 00 8E 8D             58 	int _TLI_IRQHandler ; int0
      00800C 82 00 8E 8E             59 	int _AWU_IRQHandler ; int1
      008010 82 00 8E 8F             60 	int _CLK_IRQHandler ; int2
      008014 82 00 8E 90             61 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 8E 91             62 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 8E 92             63 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 8E 93             64 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 8E 94             65 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 00 00             66 	int 0x000000 ; int8
      00802C 82 00 00 00             67 	int 0x000000 ; int9
      008030 82 00 8E 95             68 	int _SPI_IRQHandler ; int10
      008034 82 00 8E 96             69 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 8E 97             70 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 8E 98             71 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 8E 99             72 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 8E 9A             73 	int _TIM3_UPD_OVF_BRK_IRQHandler ; int15
      008048 82 00 8E 9B             74 	int _TIM3_CAP_COM_IRQHandler ; int16
      00804C 82 00 00 00             75 	int 0x000000 ; int17
      008050 82 00 00 00             76 	int 0x000000 ; int18
      008054 82 00 8E 9C             77 	int _I2C_IRQHandler ; int19
      008058 82 00 8E 9D             78 	int _UART2_TX_IRQHandler ; int20
      00805C 82 00 8E 9E             79 	int _UART2_RX_IRQHandler ; int21
      008060 82 00 8E A4             80 	int _ADC1_IRQHandler ; int22
      008064 82 00 8E A5             81 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 8E AF             82 	int _EEPROM_EEC_IRQHandler ; int24
                                     83 ;--------------------------------------------------------
                                     84 ; global & static initialisations
                                     85 ;--------------------------------------------------------
                                     86 	.area HOME
                                     87 	.area GSINIT
                                     88 	.area GSFINAL
                                     89 	.area GSINIT
      00806F CD A9 04         [ 4]   90 	call	___sdcc_external_startup
      008072                         91 __sdcc_init_data:
                                     92 ; stm8_genXINIT() start
      008072 AE 01 4B         [ 2]   93 	ldw x, #l_DATA
      008075 27 07            [ 1]   94 	jreq	00002$
      008077                         95 00001$:
      008077 72 4F 00 00      [ 1]   96 	clr (s_DATA - 1, x)
      00807B 5A               [ 2]   97 	decw x
      00807C 26 F9            [ 1]   98 	jrne	00001$
      00807E                         99 00002$:
      00807E AE 00 42         [ 2]  100 	ldw	x, #l_INITIALIZER
      008081 27 09            [ 1]  101 	jreq	00004$
      008083                        102 00003$:
      008083 D6 88 E9         [ 1]  103 	ld	a, (s_INITIALIZER - 1, x)
      008086 D7 01 4B         [ 1]  104 	ld	(s_INITIALIZED - 1, x), a
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
      00806C CC A5 BE         [ 2]  117 	jp	_main
                                    118 ;	return from main will return to caller
                                    119 ;--------------------------------------------------------
                                    120 ; code
                                    121 ;--------------------------------------------------------
                                    122 	.area CODE
                                    123 ;	./../../mib/stm8s_mib_debug_top.c: 45: void main(void)
                                    124 ;	-----------------------------------------
                                    125 ;	 function main
                                    126 ;	-----------------------------------------
      00A5BE                        127 _main:
      00A5BE 52 10            [ 2]  128 	sub	sp, #16
                                    129 ;	./../../mib/stm8s_mib_debug_top.c: 51: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);  
      00A5C0 C6 50 C6         [ 1]  130 	ld	a, 0x50c6
      00A5C3 A4 E7            [ 1]  131 	and	a, #0xe7
      00A5C5 C7 50 C6         [ 1]  132 	ld	0x50c6, a
                                    133 ;	./../../mib/stm8s_mib_debug_top.c: 53: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
      00A5C8 C6 50 C6         [ 1]  134 	ld	a, 0x50c6
      00A5CB C7 50 C6         [ 1]  135 	ld	0x50c6, a
                                    136 ;	./../../mib/stm8s_mib_debug_top.c: 56: MibDebugInit(9600);
      00A5CE 4B 80            [ 1]  137 	push	#0x80
      00A5D0 4B 25            [ 1]  138 	push	#0x25
      00A5D2 5F               [ 1]  139 	clrw	x
      00A5D3 89               [ 2]  140 	pushw	x
      00A5D4 CD 8C A9         [ 4]  141 	call	_MibDebugInit
                                    142 ;	./../../mib/stm8s_mib_debug_top.c: 57: timIrqInit();
      00A5D7 CD 96 9C         [ 4]  143 	call	_timIrqInit
                                    144 ;	./../../mib/stm8s_mib_debug_top.c: 61: cmd_test_init_before_irq_enable();
      00A5DA CD 89 91         [ 4]  145 	call	_cmd_test_init_before_irq_enable
                                    146 ;	./../../mib/stm8s_mib_debug_top.c: 66: enableInterrupts();
      00A5DD 9A               [ 1]  147 	rim
                                    148 ;	./../../mib/stm8s_mib_debug_top.c: 73: for(vbIndexID=0;vbIndexID<12;vbIndexID++)
      00A5DE 90 AE 48 CD      [ 2]  149 	ldw	y, #0x48cd
      00A5E2 0F 10            [ 1]  150 	clr	(0x10, sp)
      00A5E4                        151 00105$:
                                    152 ;	./../../mib/stm8s_mib_debug_top.c: 75: vbBufferID[vbIndexID] = *vpbUniqueID++;
      00A5E4 5F               [ 1]  153 	clrw	x
      00A5E5 7B 10            [ 1]  154 	ld	a, (0x10, sp)
      00A5E7 97               [ 1]  155 	ld	xl, a
      00A5E8 89               [ 2]  156 	pushw	x
      00A5E9 96               [ 1]  157 	ldw	x, sp
      00A5EA 1C 00 05         [ 2]  158 	addw	x, #5
      00A5ED 72 FB 01         [ 2]  159 	addw	x, (1, sp)
      00A5F0 5B 02            [ 2]  160 	addw	sp, #2
      00A5F2 90 F6            [ 1]  161 	ld	a, (y)
      00A5F4 90 5C            [ 1]  162 	incw	y
      00A5F6 F7               [ 1]  163 	ld	(x), a
                                    164 ;	./../../mib/stm8s_mib_debug_top.c: 73: for(vbIndexID=0;vbIndexID<12;vbIndexID++)
      00A5F7 0C 10            [ 1]  165 	inc	(0x10, sp)
      00A5F9 7B 10            [ 1]  166 	ld	a, (0x10, sp)
      00A5FB A1 0C            [ 1]  167 	cp	a, #0x0c
      00A5FD 25 E5            [ 1]  168 	jrc	00105$
                                    169 ;	./../../mib/stm8s_mib_debug_top.c: 77: vbBufferID[12] = 0;
      00A5FF 0F 0F            [ 1]  170 	clr	(0x0f, sp)
                                    171 ;	./../../mib/stm8s_mib_debug_top.c: 78: MibWriteDebugStringCheck(1, "\r\n ###################################\r\n");
      00A601 AE 87 41         [ 2]  172 	ldw	x, #(__str_0+0)
      00A604 CD 8C 65         [ 4]  173 	call	_MibWriteDebugString
                                    174 ;	./../../mib/stm8s_mib_debug_top.c: 79: MibWriteDebugStringCheck(1, " file name : " __FILE__ "\r\n");
      00A607 AE 87 6A         [ 2]  175 	ldw	x, #(__str_1+0)
      00A60A CD 8C 65         [ 4]  176 	call	_MibWriteDebugString
                                    177 ;	./../../mib/stm8s_mib_debug_top.c: 80: MibWriteDebugStringCheck(1, " date :  "__DATE__"  :  "__TIME__"\r\n");
      00A60D AE 87 9B         [ 2]  178 	ldw	x, #(__str_2+0)
      00A610 CD 8C 65         [ 4]  179 	call	_MibWriteDebugString
                                    180 ;	./../../mib/stm8s_mib_debug_top.c: 81: MibWriteDebugStringCheck(1, " webgpio.com by MYMEDIA Co., Ltd.\r\n");
      00A613 AE 87 BF         [ 2]  181 	ldw	x, #(__str_3+0)
      00A616 CD 8C 65         [ 4]  182 	call	_MibWriteDebugString
                                    183 ;	./../../mib/stm8s_mib_debug_top.c: 82: MibWriteDebugStringCheck(1, " ###################################\r\n");    
      00A619 AE 87 E3         [ 2]  184 	ldw	x, #(__str_4+0)
      00A61C CD 8C 65         [ 4]  185 	call	_MibWriteDebugString
                                    186 ;	./../../mib/stm8s_mib_debug_top.c: 83: ccprintf(_DEBUG_TOP_A_, ("X co-ordinate on the wafer [%02X][%02X]\r\n",vbBufferID[0],vbBufferID[1]));
      00A61F 7B 04            [ 1]  187 	ld	a, (0x04, sp)
      00A621 90 5F            [ 1]  188 	clrw	y
      00A623 90 97            [ 1]  189 	ld	yl, a
      00A625 7B 03            [ 1]  190 	ld	a, (0x03, sp)
      00A627 5F               [ 1]  191 	clrw	x
      00A628 97               [ 1]  192 	ld	xl, a
      00A629 90 89            [ 2]  193 	pushw	y
      00A62B 89               [ 2]  194 	pushw	x
      00A62C 4B 0A            [ 1]  195 	push	#<(__str_5+0)
      00A62E 4B 88            [ 1]  196 	push	#((__str_5+0) >> 8)
      00A630 CD 96 77         [ 4]  197 	call	_mib_printf
      00A633 5B 06            [ 2]  198 	addw	sp, #6
                                    199 ;	./../../mib/stm8s_mib_debug_top.c: 84: ccprintf(_DEBUG_TOP_A_, ("Y co-ordinate on the wafer [%02X][%02X]\r\n",vbBufferID[2],vbBufferID[3]));
      00A635 7B 06            [ 1]  200 	ld	a, (0x06, sp)
      00A637 5F               [ 1]  201 	clrw	x
      00A638 97               [ 1]  202 	ld	xl, a
      00A639 7B 05            [ 1]  203 	ld	a, (0x05, sp)
      00A63B 0F 01            [ 1]  204 	clr	(0x01, sp)
      00A63D 89               [ 2]  205 	pushw	x
      00A63E 88               [ 1]  206 	push	a
      00A63F 7B 04            [ 1]  207 	ld	a, (0x04, sp)
      00A641 88               [ 1]  208 	push	a
      00A642 4B 34            [ 1]  209 	push	#<(__str_6+0)
      00A644 4B 88            [ 1]  210 	push	#((__str_6+0) >> 8)
      00A646 CD 96 77         [ 4]  211 	call	_mib_printf
      00A649 5B 06            [ 2]  212 	addw	sp, #6
                                    213 ;	./../../mib/stm8s_mib_debug_top.c: 85: ccprintf(_DEBUG_TOP_A_, ("Wafer number               [%02X]\r\n",vbBufferID[4]));
      00A64B 7B 07            [ 1]  214 	ld	a, (0x07, sp)
      00A64D 5F               [ 1]  215 	clrw	x
      00A64E 97               [ 1]  216 	ld	xl, a
      00A64F 89               [ 2]  217 	pushw	x
      00A650 4B 5E            [ 1]  218 	push	#<(__str_7+0)
      00A652 4B 88            [ 1]  219 	push	#((__str_7+0) >> 8)
      00A654 CD 96 77         [ 4]  220 	call	_mib_printf
      00A657 5B 04            [ 2]  221 	addw	sp, #4
                                    222 ;	./../../mib/stm8s_mib_debug_top.c: 86: ccprintf(_DEBUG_TOP_A_, ("Lot number [%s]\r\n",&(vbBufferID[5])));
      00A659 96               [ 1]  223 	ldw	x, sp
      00A65A 1C 00 08         [ 2]  224 	addw	x, #8
      00A65D 89               [ 2]  225 	pushw	x
      00A65E 4B 82            [ 1]  226 	push	#<(__str_8+0)
      00A660 4B 88            [ 1]  227 	push	#((__str_8+0) >> 8)
      00A662 CD 96 77         [ 4]  228 	call	_mib_printf
      00A665 5B 04            [ 2]  229 	addw	sp, #4
                                    230 ;	./../../mib/stm8s_mib_debug_top.c: 88: debug_main();
      00A667 CD A6 6F         [ 4]  231 	call	_debug_main
                                    232 ;	./../../mib/stm8s_mib_debug_top.c: 90: while(1);
      00A66A                        233 00103$:
      00A66A 20 FE            [ 2]  234 	jra	00103$
                                    235 ;	./../../mib/stm8s_mib_debug_top.c: 91: }
      00A66C 5B 10            [ 2]  236 	addw	sp, #16
      00A66E 81               [ 4]  237 	ret
                                    238 ;	./../../mib/stm8s_mib_debug_top.c: 95: void debug_main(void)
                                    239 ;	-----------------------------------------
                                    240 ;	 function debug_main
                                    241 ;	-----------------------------------------
      00A66F                        242 _debug_main:
      00A66F 52 50            [ 2]  243 	sub	sp, #80
                                    244 ;	./../../mib/stm8s_mib_debug_top.c: 104: cmd[0] = 0;
      00A671 0F 01            [ 1]  245 	clr	(0x01, sp)
                                    246 ;	./../../mib/stm8s_mib_debug_top.c: 105: cmd[1] = 0;
      00A673 0F 02            [ 1]  247 	clr	(0x02, sp)
                                    248 ;	./../../mib/stm8s_mib_debug_top.c: 106: ccprintf(_DEBUG_TOP_A_, ("\r\n [help or ?] to get a list of commands\r\n\r"));
      00A675 4B 94            [ 1]  249 	push	#<(__str_9+0)
      00A677 4B 88            [ 1]  250 	push	#((__str_9+0) >> 8)
      00A679 CD 96 77         [ 4]  251 	call	_mib_printf
      00A67C 5B 02            [ 2]  252 	addw	sp, #2
                                    253 ;	./../../mib/stm8s_mib_debug_top.c: 107: cmd_list.cur = 0;
      00A67E 35 00 00 4A      [ 1]  254 	mov	_cmd_list+0, #0x00
                                    255 ;	./../../mib/stm8s_mib_debug_top.c: 108: cmd_list.next = 0;
      00A682 AE 00 4A         [ 2]  256 	ldw	x, #_cmd_list+0
      00A685 35 00 00 4B      [ 1]  257 	mov	_cmd_list+1, #0x00
                                    258 ;	./../../mib/stm8s_mib_debug_top.c: 109: memset((void *)(&cmd_list), 0, sizeof(cmd_list));
      00A689 4B 02            [ 1]  259 	push	#0x02
      00A68B 4B 01            [ 1]  260 	push	#0x01
      00A68D 4B 00            [ 1]  261 	push	#0x00
      00A68F 4B 00            [ 1]  262 	push	#0x00
      00A691 CD A8 E2         [ 4]  263 	call	_memset
                                    264 ;	./../../mib/stm8s_mib_debug_top.c: 113: cmd_mem();
      00A694 CD 9D E1         [ 4]  265 	call	_cmd_mem
                                    266 ;	./../../mib/stm8s_mib_debug_top.c: 119: cmd_test();
      00A697 CD 89 8E         [ 4]  267 	call	_cmd_test
      00A69A                        268 00118$:
                                    269 ;	./../../mib/stm8s_mib_debug_top.c: 125: ccprintf(1,("My>"));
      00A69A 4B C0            [ 1]  270 	push	#<(__str_10+0)
      00A69C 4B 88            [ 1]  271 	push	#((__str_10+0) >> 8)
      00A69E CD 96 77         [ 4]  272 	call	_mib_printf
      00A6A1 5B 02            [ 2]  273 	addw	sp, #2
                                    274 ;	./../../mib/stm8s_mib_debug_top.c: 127: GetCommand(cmd, CMD_CHAR_MAX - 1, 60*3);
      00A6A3 4B B4            [ 1]  275 	push	#0xb4
      00A6A5 4B 3F            [ 1]  276 	push	#0x3f
      00A6A7 4B 00            [ 1]  277 	push	#0x00
      00A6A9 96               [ 1]  278 	ldw	x, sp
      00A6AA 1C 00 04         [ 2]  279 	addw	x, #4
      00A6AD CD 96 FF         [ 4]  280 	call	_GetCommand
                                    281 ;	./../../mib/stm8s_mib_debug_top.c: 128: if (!cmd || !cmd[0]) continue;
      00A6B0 7B 01            [ 1]  282 	ld	a, (0x01, sp)
      00A6B2 27 E6            [ 1]  283 	jreq	00118$
                                    284 ;	./../../mib/stm8s_mib_debug_top.c: 129: cmd_str = (char *)cmd;
                                    285 ;	./../../mib/stm8s_mib_debug_top.c: 130: argc = GetArgs(cmd_str, argv);
      00A6B4 96               [ 1]  286 	ldw	x, sp
      00A6B5 1C 00 41         [ 2]  287 	addw	x, #65
      00A6B8 89               [ 2]  288 	pushw	x
      00A6B9 96               [ 1]  289 	ldw	x, sp
      00A6BA 1C 00 03         [ 2]  290 	addw	x, #3
      00A6BD CD 98 FA         [ 4]  291 	call	_GetArgs
      00A6C0 1F 4B            [ 2]  292 	ldw	(0x4b, sp), x
                                    293 ;	./../../mib/stm8s_mib_debug_top.c: 131: for (cptr = cmdTbl; cptr->cmd; cptr++)
      00A6C2 AE 01 5E         [ 2]  294 	ldw	x, #(_cmdTbl+0)
      00A6C5 1F 4D            [ 2]  295 	ldw	(0x4d, sp), x
      00A6C7 1F 4F            [ 2]  296 	ldw	(0x4f, sp), x
      00A6C9                        297 00116$:
      00A6C9 1E 4F            [ 2]  298 	ldw	x, (0x4f, sp)
      00A6CB FE               [ 2]  299 	ldw	x, (x)
      00A6CC 27 28            [ 1]  300 	jreq	00106$
                                    301 ;	./../../mib/stm8s_mib_debug_top.c: 133: if (!strcmp(argv[0], cptr->cmd))
      00A6CE 16 41            [ 2]  302 	ldw	y, (0x41, sp)
      00A6D0 89               [ 2]  303 	pushw	x
      00A6D1 93               [ 1]  304 	ldw	x, y
      00A6D2 CD A9 13         [ 4]  305 	call	_strcmp
      00A6D5 5D               [ 2]  306 	tnzw	x
      00A6D6 26 13            [ 1]  307 	jrne	00117$
                                    308 ;	./../../mib/stm8s_mib_debug_top.c: 135: (cptr->run)(cptr, argc, argv);
      00A6D8 16 4D            [ 2]  309 	ldw	y, (0x4d, sp)
      00A6DA 90 EE 02         [ 2]  310 	ldw	y, (0x2, y)
      00A6DD 96               [ 1]  311 	ldw	x, sp
      00A6DE 1C 00 41         [ 2]  312 	addw	x, #65
      00A6E1 89               [ 2]  313 	pushw	x
      00A6E2 1E 4D            [ 2]  314 	ldw	x, (0x4d, sp)
      00A6E4 89               [ 2]  315 	pushw	x
      00A6E5 1E 51            [ 2]  316 	ldw	x, (0x51, sp)
      00A6E7 90 FD            [ 4]  317 	call	(y)
                                    318 ;	./../../mib/stm8s_mib_debug_top.c: 136: break;
      00A6E9 20 0B            [ 2]  319 	jra	00106$
      00A6EB                        320 00117$:
                                    321 ;	./../../mib/stm8s_mib_debug_top.c: 131: for (cptr = cmdTbl; cptr->cmd; cptr++)
      00A6EB 1E 4F            [ 2]  322 	ldw	x, (0x4f, sp)
      00A6ED 1C 00 06         [ 2]  323 	addw	x, #0x0006
      00A6F0 1F 4F            [ 2]  324 	ldw	(0x4f, sp), x
      00A6F2 1F 4D            [ 2]  325 	ldw	(0x4d, sp), x
      00A6F4 20 D3            [ 2]  326 	jra	00116$
      00A6F6                        327 00106$:
                                    328 ;	./../../mib/stm8s_mib_debug_top.c: 139: if (!strcmp(argv[0], "help") || !strcmp(argv[0], "?"))
      00A6F6 1E 41            [ 2]  329 	ldw	x, (0x41, sp)
      00A6F8 4B C4            [ 1]  330 	push	#<(___str_11+0)
      00A6FA 4B 88            [ 1]  331 	push	#((___str_11+0) >> 8)
      00A6FC CD A9 13         [ 4]  332 	call	_strcmp
      00A6FF 1F 4F            [ 2]  333 	ldw	(0x4f, sp), x
      00A701 27 0C            [ 1]  334 	jreq	00107$
      00A703 1E 41            [ 2]  335 	ldw	x, (0x41, sp)
      00A705 4B C9            [ 1]  336 	push	#<(___str_12+0)
      00A707 4B 88            [ 1]  337 	push	#((___str_12+0) >> 8)
      00A709 CD A9 13         [ 4]  338 	call	_strcmp
      00A70C 5D               [ 2]  339 	tnzw	x
      00A70D 26 0A            [ 1]  340 	jrne	00108$
      00A70F                        341 00107$:
                                    342 ;	./../../mib/stm8s_mib_debug_top.c: 141: DoPrintHelp(argc, argv);
      00A70F 96               [ 1]  343 	ldw	x, sp
      00A710 1C 00 41         [ 2]  344 	addw	x, #65
      00A713 89               [ 2]  345 	pushw	x
      00A714 1E 4D            [ 2]  346 	ldw	x, (0x4d, sp)
      00A716 CD 9D 35         [ 4]  347 	call	_DoPrintHelp
      00A719                        348 00108$:
                                    349 ;	./../../mib/stm8s_mib_debug_top.c: 143: if (!strcmp(argv[0], "q") || !strcmp(argv[0], "Q"))
      00A719 1E 41            [ 2]  350 	ldw	x, (0x41, sp)
      00A71B 4B CB            [ 1]  351 	push	#<(___str_13+0)
      00A71D 4B 88            [ 1]  352 	push	#((___str_13+0) >> 8)
      00A71F CD A9 13         [ 4]  353 	call	_strcmp
      00A722 5D               [ 2]  354 	tnzw	x
      00A723 27 14            [ 1]  355 	jreq	00110$
      00A725 16 41            [ 2]  356 	ldw	y, (0x41, sp)
      00A727 17 4F            [ 2]  357 	ldw	(0x4f, sp), y
      00A729 4B CD            [ 1]  358 	push	#<(___str_14+0)
      00A72B 4B 88            [ 1]  359 	push	#((___str_14+0) >> 8)
      00A72D 1E 51            [ 2]  360 	ldw	x, (0x51, sp)
      00A72F CD A9 13         [ 4]  361 	call	_strcmp
      00A732 1F 4F            [ 2]  362 	ldw	(0x4f, sp), x
      00A734 27 03            [ 1]  363 	jreq	00168$
      00A736 CC A6 9A         [ 2]  364 	jp	00118$
      00A739                        365 00168$:
      00A739                        366 00110$:
                                    367 ;	./../../mib/stm8s_mib_debug_top.c: 145: ccprintf(_DEBUG_TOP_A_,("\r\nmonitor program end!!!\r\n"));
      00A739 4B CF            [ 1]  368 	push	#<(__str_15+0)
      00A73B 4B 88            [ 1]  369 	push	#((__str_15+0) >> 8)
      00A73D CD 96 77         [ 4]  370 	call	_mib_printf
                                    371 ;	./../../mib/stm8s_mib_debug_top.c: 146: break;
                                    372 ;	./../../mib/stm8s_mib_debug_top.c: 150: }
      00A740 5B 52            [ 2]  373 	addw	sp, #82
      00A742 81               [ 4]  374 	ret
                                    375 	.area CODE
                                    376 	.area CONST
                                    377 	.area CONST
      008741                        378 __str_0:
      008741 0D                     379 	.db 0x0d
      008742 0A                     380 	.db 0x0a
      008743 20 23 23 23 23 23 23   381 	.ascii " ###################################"
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23
      008767 0D                     382 	.db 0x0d
      008768 0A                     383 	.db 0x0a
      008769 00                     384 	.db 0x00
                                    385 	.area CODE
                                    386 	.area CONST
      00876A                        387 __str_1:
      00876A 20 66 69 6C 65 20 6E   388 	.ascii " file name : ./../../mib/stm8s_mib_debug_top.c"
             61 6D 65 20 3A 20 2E
             2F 2E 2E 2F 2E 2E 2F
             6D 69 62 2F 73 74 6D
             38 73 5F 6D 69 62 5F
             64 65 62 75 67 5F 74
             6F 70 2E 63
      008798 0D                     389 	.db 0x0d
      008799 0A                     390 	.db 0x0a
      00879A 00                     391 	.db 0x00
                                    392 	.area CODE
                                    393 	.area CONST
      00879B                        394 __str_2:
      00879B 20 64 61 74 65 20 3A   395 	.ascii " date :  Jun 20 2023  :  13:09:14"
             20 20 4A 75 6E 20 32
             30 20 32 30 32 33 20
             20 3A 20 20 31 33 3A
             30 39 3A 31 34
      0087BC 0D                     396 	.db 0x0d
      0087BD 0A                     397 	.db 0x0a
      0087BE 00                     398 	.db 0x00
                                    399 	.area CODE
                                    400 	.area CONST
      0087BF                        401 __str_3:
      0087BF 20 77 65 62 67 70 69   402 	.ascii " webgpio.com by MYMEDIA Co., Ltd."
             6F 2E 63 6F 6D 20 62
             79 20 4D 59 4D 45 44
             49 41 20 43 6F 2E 2C
             20 4C 74 64 2E
      0087E0 0D                     403 	.db 0x0d
      0087E1 0A                     404 	.db 0x0a
      0087E2 00                     405 	.db 0x00
                                    406 	.area CODE
                                    407 	.area CONST
      0087E3                        408 __str_4:
      0087E3 20 23 23 23 23 23 23   409 	.ascii " ###################################"
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23
      008807 0D                     410 	.db 0x0d
      008808 0A                     411 	.db 0x0a
      008809 00                     412 	.db 0x00
                                    413 	.area CODE
                                    414 	.area CONST
      00880A                        415 __str_5:
      00880A 58 20 63 6F 2D 6F 72   416 	.ascii "X co-ordinate on the wafer [%02X][%02X]"
             64 69 6E 61 74 65 20
             6F 6E 20 74 68 65 20
             77 61 66 65 72 20 5B
             25 30 32 58 5D 5B 25
             30 32 58 5D
      008831 0D                     417 	.db 0x0d
      008832 0A                     418 	.db 0x0a
      008833 00                     419 	.db 0x00
                                    420 	.area CODE
                                    421 	.area CONST
      008834                        422 __str_6:
      008834 59 20 63 6F 2D 6F 72   423 	.ascii "Y co-ordinate on the wafer [%02X][%02X]"
             64 69 6E 61 74 65 20
             6F 6E 20 74 68 65 20
             77 61 66 65 72 20 5B
             25 30 32 58 5D 5B 25
             30 32 58 5D
      00885B 0D                     424 	.db 0x0d
      00885C 0A                     425 	.db 0x0a
      00885D 00                     426 	.db 0x00
                                    427 	.area CODE
                                    428 	.area CONST
      00885E                        429 __str_7:
      00885E 57 61 66 65 72 20 6E   430 	.ascii "Wafer number               [%02X]"
             75 6D 62 65 72 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 5B
             25 30 32 58 5D
      00887F 0D                     431 	.db 0x0d
      008880 0A                     432 	.db 0x0a
      008881 00                     433 	.db 0x00
                                    434 	.area CODE
                                    435 	.area CONST
      008882                        436 __str_8:
      008882 4C 6F 74 20 6E 75 6D   437 	.ascii "Lot number [%s]"
             62 65 72 20 5B 25 73
             5D
      008891 0D                     438 	.db 0x0d
      008892 0A                     439 	.db 0x0a
      008893 00                     440 	.db 0x00
                                    441 	.area CODE
                                    442 	.area CONST
      008894                        443 __str_9:
      008894 0D                     444 	.db 0x0d
      008895 0A                     445 	.db 0x0a
      008896 20 5B 68 65 6C 70 20   446 	.ascii " [help or ?] to get a list of commands"
             6F 72 20 3F 5D 20 74
             6F 20 67 65 74 20 61
             20 6C 69 73 74 20 6F
             66 20 63 6F 6D 6D 61
             6E 64 73
      0088BC 0D                     447 	.db 0x0d
      0088BD 0A                     448 	.db 0x0a
      0088BE 0D                     449 	.db 0x0d
      0088BF 00                     450 	.db 0x00
                                    451 	.area CODE
                                    452 	.area CONST
      0088C0                        453 __str_10:
      0088C0 4D 79 3E               454 	.ascii "My>"
      0088C3 00                     455 	.db 0x00
                                    456 	.area CODE
                                    457 	.area CONST
      0088C4                        458 ___str_11:
      0088C4 68 65 6C 70            459 	.ascii "help"
      0088C8 00                     460 	.db 0x00
                                    461 	.area CODE
                                    462 	.area CONST
      0088C9                        463 ___str_12:
      0088C9 3F                     464 	.ascii "?"
      0088CA 00                     465 	.db 0x00
                                    466 	.area CODE
                                    467 	.area CONST
      0088CB                        468 ___str_13:
      0088CB 71                     469 	.ascii "q"
      0088CC 00                     470 	.db 0x00
                                    471 	.area CODE
                                    472 	.area CONST
      0088CD                        473 ___str_14:
      0088CD 51                     474 	.ascii "Q"
      0088CE 00                     475 	.db 0x00
                                    476 	.area CODE
                                    477 	.area CONST
      0088CF                        478 __str_15:
      0088CF 0D                     479 	.db 0x0d
      0088D0 0A                     480 	.db 0x0a
      0088D1 6D 6F 6E 69 74 6F 72   481 	.ascii "monitor program end!!!"
             20 70 72 6F 67 72 61
             6D 20 65 6E 64 21 21
             21
      0088E7 0D                     482 	.db 0x0d
      0088E8 0A                     483 	.db 0x0a
      0088E9 00                     484 	.db 0x00
                                    485 	.area CODE
                                    486 	.area INITIALIZER
                                    487 	.area CABS (ABS)
