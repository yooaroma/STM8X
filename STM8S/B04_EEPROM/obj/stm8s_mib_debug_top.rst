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
      00B1D2                         35 __start__stack:
      00B1D2                         36 	.ds	1
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
      008004 82 00 94 AD             57 	int _TRAP_IRQHandler ; trap
      008008 82 00 94 AE             58 	int _TLI_IRQHandler ; int0
      00800C 82 00 94 AF             59 	int _AWU_IRQHandler ; int1
      008010 82 00 94 B0             60 	int _CLK_IRQHandler ; int2
      008014 82 00 94 B1             61 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 94 B2             62 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 94 B3             63 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 94 B4             64 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 94 B5             65 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 00 00             66 	int 0x000000 ; int8
      00802C 82 00 00 00             67 	int 0x000000 ; int9
      008030 82 00 94 B6             68 	int _SPI_IRQHandler ; int10
      008034 82 00 94 B7             69 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 94 B8             70 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 94 B9             71 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 94 BA             72 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 94 BB             73 	int _TIM3_UPD_OVF_BRK_IRQHandler ; int15
      008048 82 00 94 BC             74 	int _TIM3_CAP_COM_IRQHandler ; int16
      00804C 82 00 00 00             75 	int 0x000000 ; int17
      008050 82 00 00 00             76 	int 0x000000 ; int18
      008054 82 00 94 BD             77 	int _I2C_IRQHandler ; int19
      008058 82 00 94 BE             78 	int _UART2_TX_IRQHandler ; int20
      00805C 82 00 94 BF             79 	int _UART2_RX_IRQHandler ; int21
      008060 82 00 94 C5             80 	int _ADC1_IRQHandler ; int22
      008064 82 00 94 C6             81 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 94 D0             82 	int _EEPROM_EEC_IRQHandler ; int24
                                     83 ;--------------------------------------------------------
                                     84 ; global & static initialisations
                                     85 ;--------------------------------------------------------
                                     86 	.area HOME
                                     87 	.area GSINIT
                                     88 	.area GSFINAL
                                     89 	.area GSINIT
      00806F CD B0 F2         [ 4]   90 	call	___sdcc_external_startup
      008072                         91 __sdcc_init_data:
                                     92 ; stm8_genXINIT() start
      008072 AE 01 49         [ 2]   93 	ldw x, #l_DATA
      008075 27 07            [ 1]   94 	jreq	00002$
      008077                         95 00001$:
      008077 72 4F 00 00      [ 1]   96 	clr (s_DATA - 1, x)
      00807B 5A               [ 2]   97 	decw x
      00807C 26 F9            [ 1]   98 	jrne	00001$
      00807E                         99 00002$:
      00807E AE 00 42         [ 2]  100 	ldw	x, #l_INITIALIZER
      008081 27 09            [ 1]  101 	jreq	00004$
      008083                        102 00003$:
      008083 D6 8D F3         [ 1]  103 	ld	a, (s_INITIALIZER - 1, x)
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
      00806C CC AB D1         [ 2]  117 	jp	_main
                                    118 ;	return from main will return to caller
                                    119 ;--------------------------------------------------------
                                    120 ; code
                                    121 ;--------------------------------------------------------
                                    122 	.area CODE
                                    123 ;	./../../mib/stm8s_mib_debug_top.c: 45: void main(void)
                                    124 ;	-----------------------------------------
                                    125 ;	 function main
                                    126 ;	-----------------------------------------
      00ABD1                        127 _main:
      00ABD1 52 10            [ 2]  128 	sub	sp, #16
                                    129 ;	./../../mib/stm8s_mib_debug_top.c: 51: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);  
      00ABD3 C6 50 C6         [ 1]  130 	ld	a, 0x50c6
      00ABD6 A4 E7            [ 1]  131 	and	a, #0xe7
      00ABD8 C7 50 C6         [ 1]  132 	ld	0x50c6, a
                                    133 ;	./../../mib/stm8s_mib_debug_top.c: 53: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
      00ABDB C6 50 C6         [ 1]  134 	ld	a, 0x50c6
      00ABDE C7 50 C6         [ 1]  135 	ld	0x50c6, a
                                    136 ;	./../../mib/stm8s_mib_debug_top.c: 56: MibDebugInit(9600);
      00ABE1 4B 80            [ 1]  137 	push	#0x80
      00ABE3 4B 25            [ 1]  138 	push	#0x25
      00ABE5 5F               [ 1]  139 	clrw	x
      00ABE6 89               [ 2]  140 	pushw	x
      00ABE7 CD 92 CA         [ 4]  141 	call	_MibDebugInit
                                    142 ;	./../../mib/stm8s_mib_debug_top.c: 57: timIrqInit();
      00ABEA CD 9C BD         [ 4]  143 	call	_timIrqInit
                                    144 ;	./../../mib/stm8s_mib_debug_top.c: 61: cmd_test_init_before_irq_enable();
      00ABED CD 8E 9B         [ 4]  145 	call	_cmd_test_init_before_irq_enable
                                    146 ;	./../../mib/stm8s_mib_debug_top.c: 66: enableInterrupts();
      00ABF0 9A               [ 1]  147 	rim
                                    148 ;	./../../mib/stm8s_mib_debug_top.c: 73: for(vbIndexID=0;vbIndexID<12;vbIndexID++)
      00ABF1 90 AE 48 CD      [ 2]  149 	ldw	y, #0x48cd
      00ABF5 0F 10            [ 1]  150 	clr	(0x10, sp)
      00ABF7                        151 00105$:
                                    152 ;	./../../mib/stm8s_mib_debug_top.c: 75: vbBufferID[vbIndexID] = *vpbUniqueID++;
      00ABF7 5F               [ 1]  153 	clrw	x
      00ABF8 7B 10            [ 1]  154 	ld	a, (0x10, sp)
      00ABFA 97               [ 1]  155 	ld	xl, a
      00ABFB 89               [ 2]  156 	pushw	x
      00ABFC 96               [ 1]  157 	ldw	x, sp
      00ABFD 1C 00 05         [ 2]  158 	addw	x, #5
      00AC00 72 FB 01         [ 2]  159 	addw	x, (1, sp)
      00AC03 5B 02            [ 2]  160 	addw	sp, #2
      00AC05 90 F6            [ 1]  161 	ld	a, (y)
      00AC07 90 5C            [ 1]  162 	incw	y
      00AC09 F7               [ 1]  163 	ld	(x), a
                                    164 ;	./../../mib/stm8s_mib_debug_top.c: 73: for(vbIndexID=0;vbIndexID<12;vbIndexID++)
      00AC0A 0C 10            [ 1]  165 	inc	(0x10, sp)
      00AC0C 7B 10            [ 1]  166 	ld	a, (0x10, sp)
      00AC0E A1 0C            [ 1]  167 	cp	a, #0x0c
      00AC10 25 E5            [ 1]  168 	jrc	00105$
                                    169 ;	./../../mib/stm8s_mib_debug_top.c: 77: vbBufferID[12] = 0;
      00AC12 0F 0F            [ 1]  170 	clr	(0x0f, sp)
                                    171 ;	./../../mib/stm8s_mib_debug_top.c: 78: MibWriteDebugStringCheck(1, "\r\n ###################################\r\n");
      00AC14 AE 8C 4B         [ 2]  172 	ldw	x, #(__str_0+0)
      00AC17 CD 92 86         [ 4]  173 	call	_MibWriteDebugString
                                    174 ;	./../../mib/stm8s_mib_debug_top.c: 79: MibWriteDebugStringCheck(1, " file name : " __FILE__ "\r\n");
      00AC1A AE 8C 74         [ 2]  175 	ldw	x, #(__str_1+0)
      00AC1D CD 92 86         [ 4]  176 	call	_MibWriteDebugString
                                    177 ;	./../../mib/stm8s_mib_debug_top.c: 80: MibWriteDebugStringCheck(1, " date :  "__DATE__"  :  "__TIME__"\r\n");
      00AC20 AE 8C A5         [ 2]  178 	ldw	x, #(__str_2+0)
      00AC23 CD 92 86         [ 4]  179 	call	_MibWriteDebugString
                                    180 ;	./../../mib/stm8s_mib_debug_top.c: 81: MibWriteDebugStringCheck(1, " webgpio.com by MYMEDIA Co., Ltd.\r\n");
      00AC26 AE 8C C9         [ 2]  181 	ldw	x, #(__str_3+0)
      00AC29 CD 92 86         [ 4]  182 	call	_MibWriteDebugString
                                    183 ;	./../../mib/stm8s_mib_debug_top.c: 82: MibWriteDebugStringCheck(1, " ###################################\r\n");    
      00AC2C AE 8C ED         [ 2]  184 	ldw	x, #(__str_4+0)
      00AC2F CD 92 86         [ 4]  185 	call	_MibWriteDebugString
                                    186 ;	./../../mib/stm8s_mib_debug_top.c: 83: ccprintf(_DEBUG_TOP_A_, ("X co-ordinate on the wafer [%02X][%02X]\r\n",vbBufferID[0],vbBufferID[1]));
      00AC32 7B 04            [ 1]  187 	ld	a, (0x04, sp)
      00AC34 90 5F            [ 1]  188 	clrw	y
      00AC36 90 97            [ 1]  189 	ld	yl, a
      00AC38 7B 03            [ 1]  190 	ld	a, (0x03, sp)
      00AC3A 5F               [ 1]  191 	clrw	x
      00AC3B 97               [ 1]  192 	ld	xl, a
      00AC3C 90 89            [ 2]  193 	pushw	y
      00AC3E 89               [ 2]  194 	pushw	x
      00AC3F 4B 14            [ 1]  195 	push	#<(__str_5+0)
      00AC41 4B 8D            [ 1]  196 	push	#((__str_5+0) >> 8)
      00AC43 CD 9C 98         [ 4]  197 	call	_mib_printf
      00AC46 5B 06            [ 2]  198 	addw	sp, #6
                                    199 ;	./../../mib/stm8s_mib_debug_top.c: 84: ccprintf(_DEBUG_TOP_A_, ("Y co-ordinate on the wafer [%02X][%02X]\r\n",vbBufferID[2],vbBufferID[3]));
      00AC48 7B 06            [ 1]  200 	ld	a, (0x06, sp)
      00AC4A 5F               [ 1]  201 	clrw	x
      00AC4B 97               [ 1]  202 	ld	xl, a
      00AC4C 7B 05            [ 1]  203 	ld	a, (0x05, sp)
      00AC4E 0F 01            [ 1]  204 	clr	(0x01, sp)
      00AC50 89               [ 2]  205 	pushw	x
      00AC51 88               [ 1]  206 	push	a
      00AC52 7B 04            [ 1]  207 	ld	a, (0x04, sp)
      00AC54 88               [ 1]  208 	push	a
      00AC55 4B 3E            [ 1]  209 	push	#<(__str_6+0)
      00AC57 4B 8D            [ 1]  210 	push	#((__str_6+0) >> 8)
      00AC59 CD 9C 98         [ 4]  211 	call	_mib_printf
      00AC5C 5B 06            [ 2]  212 	addw	sp, #6
                                    213 ;	./../../mib/stm8s_mib_debug_top.c: 85: ccprintf(_DEBUG_TOP_A_, ("Wafer number               [%02X]\r\n",vbBufferID[4]));
      00AC5E 7B 07            [ 1]  214 	ld	a, (0x07, sp)
      00AC60 5F               [ 1]  215 	clrw	x
      00AC61 97               [ 1]  216 	ld	xl, a
      00AC62 89               [ 2]  217 	pushw	x
      00AC63 4B 68            [ 1]  218 	push	#<(__str_7+0)
      00AC65 4B 8D            [ 1]  219 	push	#((__str_7+0) >> 8)
      00AC67 CD 9C 98         [ 4]  220 	call	_mib_printf
      00AC6A 5B 04            [ 2]  221 	addw	sp, #4
                                    222 ;	./../../mib/stm8s_mib_debug_top.c: 86: ccprintf(_DEBUG_TOP_A_, ("Lot number [%s]\r\n",&(vbBufferID[5])));
      00AC6C 96               [ 1]  223 	ldw	x, sp
      00AC6D 1C 00 08         [ 2]  224 	addw	x, #8
      00AC70 89               [ 2]  225 	pushw	x
      00AC71 4B 8C            [ 1]  226 	push	#<(__str_8+0)
      00AC73 4B 8D            [ 1]  227 	push	#((__str_8+0) >> 8)
      00AC75 CD 9C 98         [ 4]  228 	call	_mib_printf
      00AC78 5B 04            [ 2]  229 	addw	sp, #4
                                    230 ;	./../../mib/stm8s_mib_debug_top.c: 88: debug_main();
      00AC7A CD AC 82         [ 4]  231 	call	_debug_main
                                    232 ;	./../../mib/stm8s_mib_debug_top.c: 90: while(1);
      00AC7D                        233 00103$:
      00AC7D 20 FE            [ 2]  234 	jra	00103$
                                    235 ;	./../../mib/stm8s_mib_debug_top.c: 91: }
      00AC7F 5B 10            [ 2]  236 	addw	sp, #16
      00AC81 81               [ 4]  237 	ret
                                    238 ;	./../../mib/stm8s_mib_debug_top.c: 95: void debug_main(void)
                                    239 ;	-----------------------------------------
                                    240 ;	 function debug_main
                                    241 ;	-----------------------------------------
      00AC82                        242 _debug_main:
      00AC82 52 50            [ 2]  243 	sub	sp, #80
                                    244 ;	./../../mib/stm8s_mib_debug_top.c: 104: cmd[0] = 0;
      00AC84 0F 01            [ 1]  245 	clr	(0x01, sp)
                                    246 ;	./../../mib/stm8s_mib_debug_top.c: 105: cmd[1] = 0;
      00AC86 0F 02            [ 1]  247 	clr	(0x02, sp)
                                    248 ;	./../../mib/stm8s_mib_debug_top.c: 106: ccprintf(_DEBUG_TOP_A_, ("\r\n [help or ?] to get a list of commands\r\n\r"));
      00AC88 4B 9E            [ 1]  249 	push	#<(__str_9+0)
      00AC8A 4B 8D            [ 1]  250 	push	#((__str_9+0) >> 8)
      00AC8C CD 9C 98         [ 4]  251 	call	_mib_printf
      00AC8F 5B 02            [ 2]  252 	addw	sp, #2
                                    253 ;	./../../mib/stm8s_mib_debug_top.c: 107: cmd_list.cur = 0;
      00AC91 35 00 00 48      [ 1]  254 	mov	_cmd_list+0, #0x00
                                    255 ;	./../../mib/stm8s_mib_debug_top.c: 108: cmd_list.next = 0;
      00AC95 AE 00 48         [ 2]  256 	ldw	x, #_cmd_list+0
      00AC98 35 00 00 49      [ 1]  257 	mov	_cmd_list+1, #0x00
                                    258 ;	./../../mib/stm8s_mib_debug_top.c: 109: memset((void *)(&cmd_list), 0, sizeof(cmd_list));
      00AC9C 4B 02            [ 1]  259 	push	#0x02
      00AC9E 4B 01            [ 1]  260 	push	#0x01
      00ACA0 4B 00            [ 1]  261 	push	#0x00
      00ACA2 4B 00            [ 1]  262 	push	#0x00
      00ACA4 CD B0 D0         [ 4]  263 	call	_memset
                                    264 ;	./../../mib/stm8s_mib_debug_top.c: 113: cmd_mem();
      00ACA7 CD A3 F4         [ 4]  265 	call	_cmd_mem
                                    266 ;	./../../mib/stm8s_mib_debug_top.c: 119: cmd_test();
      00ACAA CD 8E 98         [ 4]  267 	call	_cmd_test
      00ACAD                        268 00118$:
                                    269 ;	./../../mib/stm8s_mib_debug_top.c: 125: ccprintf(1,("My>"));
      00ACAD 4B CA            [ 1]  270 	push	#<(__str_10+0)
      00ACAF 4B 8D            [ 1]  271 	push	#((__str_10+0) >> 8)
      00ACB1 CD 9C 98         [ 4]  272 	call	_mib_printf
      00ACB4 5B 02            [ 2]  273 	addw	sp, #2
                                    274 ;	./../../mib/stm8s_mib_debug_top.c: 127: GetCommand(cmd, CMD_CHAR_MAX - 1, 60*3);
      00ACB6 4B B4            [ 1]  275 	push	#0xb4
      00ACB8 4B 3F            [ 1]  276 	push	#0x3f
      00ACBA 4B 00            [ 1]  277 	push	#0x00
      00ACBC 96               [ 1]  278 	ldw	x, sp
      00ACBD 1C 00 04         [ 2]  279 	addw	x, #4
      00ACC0 CD 9D 12         [ 4]  280 	call	_GetCommand
                                    281 ;	./../../mib/stm8s_mib_debug_top.c: 128: if (!cmd || !cmd[0]) continue;
      00ACC3 7B 01            [ 1]  282 	ld	a, (0x01, sp)
      00ACC5 27 E6            [ 1]  283 	jreq	00118$
                                    284 ;	./../../mib/stm8s_mib_debug_top.c: 129: cmd_str = (char *)cmd;
                                    285 ;	./../../mib/stm8s_mib_debug_top.c: 130: argc = GetArgs(cmd_str, argv);
      00ACC7 96               [ 1]  286 	ldw	x, sp
      00ACC8 1C 00 41         [ 2]  287 	addw	x, #65
      00ACCB 89               [ 2]  288 	pushw	x
      00ACCC 96               [ 1]  289 	ldw	x, sp
      00ACCD 1C 00 03         [ 2]  290 	addw	x, #3
      00ACD0 CD 9F 0D         [ 4]  291 	call	_GetArgs
      00ACD3 1F 4B            [ 2]  292 	ldw	(0x4b, sp), x
                                    293 ;	./../../mib/stm8s_mib_debug_top.c: 131: for (cptr = cmdTbl; cptr->cmd; cptr++)
      00ACD5 AE 01 5C         [ 2]  294 	ldw	x, #(_cmdTbl+0)
      00ACD8 1F 4D            [ 2]  295 	ldw	(0x4d, sp), x
      00ACDA 1F 4F            [ 2]  296 	ldw	(0x4f, sp), x
      00ACDC                        297 00116$:
      00ACDC 1E 4F            [ 2]  298 	ldw	x, (0x4f, sp)
      00ACDE FE               [ 2]  299 	ldw	x, (x)
      00ACDF 27 28            [ 1]  300 	jreq	00106$
                                    301 ;	./../../mib/stm8s_mib_debug_top.c: 133: if (!strcmp(argv[0], cptr->cmd))
      00ACE1 16 41            [ 2]  302 	ldw	y, (0x41, sp)
      00ACE3 89               [ 2]  303 	pushw	x
      00ACE4 93               [ 1]  304 	ldw	x, y
      00ACE5 CD B1 01         [ 4]  305 	call	_strcmp
      00ACE8 5D               [ 2]  306 	tnzw	x
      00ACE9 26 13            [ 1]  307 	jrne	00117$
                                    308 ;	./../../mib/stm8s_mib_debug_top.c: 135: (cptr->run)(cptr, argc, argv);
      00ACEB 16 4D            [ 2]  309 	ldw	y, (0x4d, sp)
      00ACED 90 EE 02         [ 2]  310 	ldw	y, (0x2, y)
      00ACF0 96               [ 1]  311 	ldw	x, sp
      00ACF1 1C 00 41         [ 2]  312 	addw	x, #65
      00ACF4 89               [ 2]  313 	pushw	x
      00ACF5 1E 4D            [ 2]  314 	ldw	x, (0x4d, sp)
      00ACF7 89               [ 2]  315 	pushw	x
      00ACF8 1E 51            [ 2]  316 	ldw	x, (0x51, sp)
      00ACFA 90 FD            [ 4]  317 	call	(y)
                                    318 ;	./../../mib/stm8s_mib_debug_top.c: 136: break;
      00ACFC 20 0B            [ 2]  319 	jra	00106$
      00ACFE                        320 00117$:
                                    321 ;	./../../mib/stm8s_mib_debug_top.c: 131: for (cptr = cmdTbl; cptr->cmd; cptr++)
      00ACFE 1E 4F            [ 2]  322 	ldw	x, (0x4f, sp)
      00AD00 1C 00 06         [ 2]  323 	addw	x, #0x0006
      00AD03 1F 4F            [ 2]  324 	ldw	(0x4f, sp), x
      00AD05 1F 4D            [ 2]  325 	ldw	(0x4d, sp), x
      00AD07 20 D3            [ 2]  326 	jra	00116$
      00AD09                        327 00106$:
                                    328 ;	./../../mib/stm8s_mib_debug_top.c: 139: if (!strcmp(argv[0], "help") || !strcmp(argv[0], "?"))
      00AD09 1E 41            [ 2]  329 	ldw	x, (0x41, sp)
      00AD0B 4B CE            [ 1]  330 	push	#<(___str_11+0)
      00AD0D 4B 8D            [ 1]  331 	push	#((___str_11+0) >> 8)
      00AD0F CD B1 01         [ 4]  332 	call	_strcmp
      00AD12 1F 4F            [ 2]  333 	ldw	(0x4f, sp), x
      00AD14 27 0C            [ 1]  334 	jreq	00107$
      00AD16 1E 41            [ 2]  335 	ldw	x, (0x41, sp)
      00AD18 4B D3            [ 1]  336 	push	#<(___str_12+0)
      00AD1A 4B 8D            [ 1]  337 	push	#((___str_12+0) >> 8)
      00AD1C CD B1 01         [ 4]  338 	call	_strcmp
      00AD1F 5D               [ 2]  339 	tnzw	x
      00AD20 26 0A            [ 1]  340 	jrne	00108$
      00AD22                        341 00107$:
                                    342 ;	./../../mib/stm8s_mib_debug_top.c: 141: DoPrintHelp(argc, argv);
      00AD22 96               [ 1]  343 	ldw	x, sp
      00AD23 1C 00 41         [ 2]  344 	addw	x, #65
      00AD26 89               [ 2]  345 	pushw	x
      00AD27 1E 4D            [ 2]  346 	ldw	x, (0x4d, sp)
      00AD29 CD A3 48         [ 4]  347 	call	_DoPrintHelp
      00AD2C                        348 00108$:
                                    349 ;	./../../mib/stm8s_mib_debug_top.c: 143: if (!strcmp(argv[0], "q") || !strcmp(argv[0], "Q"))
      00AD2C 1E 41            [ 2]  350 	ldw	x, (0x41, sp)
      00AD2E 4B D5            [ 1]  351 	push	#<(___str_13+0)
      00AD30 4B 8D            [ 1]  352 	push	#((___str_13+0) >> 8)
      00AD32 CD B1 01         [ 4]  353 	call	_strcmp
      00AD35 5D               [ 2]  354 	tnzw	x
      00AD36 27 14            [ 1]  355 	jreq	00110$
      00AD38 16 41            [ 2]  356 	ldw	y, (0x41, sp)
      00AD3A 17 4F            [ 2]  357 	ldw	(0x4f, sp), y
      00AD3C 4B D7            [ 1]  358 	push	#<(___str_14+0)
      00AD3E 4B 8D            [ 1]  359 	push	#((___str_14+0) >> 8)
      00AD40 1E 51            [ 2]  360 	ldw	x, (0x51, sp)
      00AD42 CD B1 01         [ 4]  361 	call	_strcmp
      00AD45 1F 4F            [ 2]  362 	ldw	(0x4f, sp), x
      00AD47 27 03            [ 1]  363 	jreq	00168$
      00AD49 CC AC AD         [ 2]  364 	jp	00118$
      00AD4C                        365 00168$:
      00AD4C                        366 00110$:
                                    367 ;	./../../mib/stm8s_mib_debug_top.c: 145: ccprintf(_DEBUG_TOP_A_,("\r\nmonitor program end!!!\r\n"));
      00AD4C 4B D9            [ 1]  368 	push	#<(__str_15+0)
      00AD4E 4B 8D            [ 1]  369 	push	#((__str_15+0) >> 8)
      00AD50 CD 9C 98         [ 4]  370 	call	_mib_printf
                                    371 ;	./../../mib/stm8s_mib_debug_top.c: 146: break;
                                    372 ;	./../../mib/stm8s_mib_debug_top.c: 150: }
      00AD53 5B 52            [ 2]  373 	addw	sp, #82
      00AD55 81               [ 4]  374 	ret
                                    375 	.area CODE
                                    376 	.area CONST
                                    377 	.area CONST
      008C4B                        378 __str_0:
      008C4B 0D                     379 	.db 0x0d
      008C4C 0A                     380 	.db 0x0a
      008C4D 20 23 23 23 23 23 23   381 	.ascii " ###################################"
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23
      008C71 0D                     382 	.db 0x0d
      008C72 0A                     383 	.db 0x0a
      008C73 00                     384 	.db 0x00
                                    385 	.area CODE
                                    386 	.area CONST
      008C74                        387 __str_1:
      008C74 20 66 69 6C 65 20 6E   388 	.ascii " file name : ./../../mib/stm8s_mib_debug_top.c"
             61 6D 65 20 3A 20 2E
             2F 2E 2E 2F 2E 2E 2F
             6D 69 62 2F 73 74 6D
             38 73 5F 6D 69 62 5F
             64 65 62 75 67 5F 74
             6F 70 2E 63
      008CA2 0D                     389 	.db 0x0d
      008CA3 0A                     390 	.db 0x0a
      008CA4 00                     391 	.db 0x00
                                    392 	.area CODE
                                    393 	.area CONST
      008CA5                        394 __str_2:
      008CA5 20 64 61 74 65 20 3A   395 	.ascii " date :  Jun 15 2023  :  19:01:04"
             20 20 4A 75 6E 20 31
             35 20 32 30 32 33 20
             20 3A 20 20 31 39 3A
             30 31 3A 30 34
      008CC6 0D                     396 	.db 0x0d
      008CC7 0A                     397 	.db 0x0a
      008CC8 00                     398 	.db 0x00
                                    399 	.area CODE
                                    400 	.area CONST
      008CC9                        401 __str_3:
      008CC9 20 77 65 62 67 70 69   402 	.ascii " webgpio.com by MYMEDIA Co., Ltd."
             6F 2E 63 6F 6D 20 62
             79 20 4D 59 4D 45 44
             49 41 20 43 6F 2E 2C
             20 4C 74 64 2E
      008CEA 0D                     403 	.db 0x0d
      008CEB 0A                     404 	.db 0x0a
      008CEC 00                     405 	.db 0x00
                                    406 	.area CODE
                                    407 	.area CONST
      008CED                        408 __str_4:
      008CED 20 23 23 23 23 23 23   409 	.ascii " ###################################"
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23 23 23 23 23 23 23
             23
      008D11 0D                     410 	.db 0x0d
      008D12 0A                     411 	.db 0x0a
      008D13 00                     412 	.db 0x00
                                    413 	.area CODE
                                    414 	.area CONST
      008D14                        415 __str_5:
      008D14 58 20 63 6F 2D 6F 72   416 	.ascii "X co-ordinate on the wafer [%02X][%02X]"
             64 69 6E 61 74 65 20
             6F 6E 20 74 68 65 20
             77 61 66 65 72 20 5B
             25 30 32 58 5D 5B 25
             30 32 58 5D
      008D3B 0D                     417 	.db 0x0d
      008D3C 0A                     418 	.db 0x0a
      008D3D 00                     419 	.db 0x00
                                    420 	.area CODE
                                    421 	.area CONST
      008D3E                        422 __str_6:
      008D3E 59 20 63 6F 2D 6F 72   423 	.ascii "Y co-ordinate on the wafer [%02X][%02X]"
             64 69 6E 61 74 65 20
             6F 6E 20 74 68 65 20
             77 61 66 65 72 20 5B
             25 30 32 58 5D 5B 25
             30 32 58 5D
      008D65 0D                     424 	.db 0x0d
      008D66 0A                     425 	.db 0x0a
      008D67 00                     426 	.db 0x00
                                    427 	.area CODE
                                    428 	.area CONST
      008D68                        429 __str_7:
      008D68 57 61 66 65 72 20 6E   430 	.ascii "Wafer number               [%02X]"
             75 6D 62 65 72 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 5B
             25 30 32 58 5D
      008D89 0D                     431 	.db 0x0d
      008D8A 0A                     432 	.db 0x0a
      008D8B 00                     433 	.db 0x00
                                    434 	.area CODE
                                    435 	.area CONST
      008D8C                        436 __str_8:
      008D8C 4C 6F 74 20 6E 75 6D   437 	.ascii "Lot number [%s]"
             62 65 72 20 5B 25 73
             5D
      008D9B 0D                     438 	.db 0x0d
      008D9C 0A                     439 	.db 0x0a
      008D9D 00                     440 	.db 0x00
                                    441 	.area CODE
                                    442 	.area CONST
      008D9E                        443 __str_9:
      008D9E 0D                     444 	.db 0x0d
      008D9F 0A                     445 	.db 0x0a
      008DA0 20 5B 68 65 6C 70 20   446 	.ascii " [help or ?] to get a list of commands"
             6F 72 20 3F 5D 20 74
             6F 20 67 65 74 20 61
             20 6C 69 73 74 20 6F
             66 20 63 6F 6D 6D 61
             6E 64 73
      008DC6 0D                     447 	.db 0x0d
      008DC7 0A                     448 	.db 0x0a
      008DC8 0D                     449 	.db 0x0d
      008DC9 00                     450 	.db 0x00
                                    451 	.area CODE
                                    452 	.area CONST
      008DCA                        453 __str_10:
      008DCA 4D 79 3E               454 	.ascii "My>"
      008DCD 00                     455 	.db 0x00
                                    456 	.area CODE
                                    457 	.area CONST
      008DCE                        458 ___str_11:
      008DCE 68 65 6C 70            459 	.ascii "help"
      008DD2 00                     460 	.db 0x00
                                    461 	.area CODE
                                    462 	.area CONST
      008DD3                        463 ___str_12:
      008DD3 3F                     464 	.ascii "?"
      008DD4 00                     465 	.db 0x00
                                    466 	.area CODE
                                    467 	.area CONST
      008DD5                        468 ___str_13:
      008DD5 71                     469 	.ascii "q"
      008DD6 00                     470 	.db 0x00
                                    471 	.area CODE
                                    472 	.area CONST
      008DD7                        473 ___str_14:
      008DD7 51                     474 	.ascii "Q"
      008DD8 00                     475 	.db 0x00
                                    476 	.area CODE
                                    477 	.area CONST
      008DD9                        478 __str_15:
      008DD9 0D                     479 	.db 0x0d
      008DDA 0A                     480 	.db 0x0a
      008DDB 6D 6F 6E 69 74 6F 72   481 	.ascii "monitor program end!!!"
             20 70 72 6F 67 72 61
             6D 20 65 6E 64 21 21
             21
      008DF1 0D                     482 	.db 0x0d
      008DF2 0A                     483 	.db 0x0a
      008DF3 00                     484 	.db 0x00
                                    485 	.area CODE
                                    486 	.area INITIALIZER
                                    487 	.area CABS (ABS)
