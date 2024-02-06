;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_debug_top_main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _memset
	.globl _strcmp
	.globl _cmd_mem
	.globl _DoPrintHelp
	.globl _GetArgs
	.globl _GetCommand
	.globl _mib_printf
	.globl _timIrqInit
	.globl _MibWriteDebugString
	.globl _MibDebugInit
	.globl _debug_main
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
	int _TRAP_IRQHandler ; trap
	int _TLI_IRQHandler ; int0
	int _AWU_IRQHandler ; int1
	int _CLK_IRQHandler ; int2
	int _EXTI_PORTA_IRQHandler ; int3
	int _EXTI_PORTB_IRQHandler ; int4
	int _EXTI_PORTC_IRQHandler ; int5
	int _EXTI_PORTD_IRQHandler ; int6
	int _EXTI_PORTE_IRQHandler ; int7
	int 0x000000 ; int8
	int 0x000000 ; int9
	int _SPI_IRQHandler ; int10
	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
	int _TIM1_CAP_COM_IRQHandler ; int12
	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
	int _TIM2_CAP_COM_IRQHandler ; int14
	int _TIM3_UPD_OVF_BRK_IRQHandler ; int15
	int _TIM3_CAP_COM_IRQHandler ; int16
	int 0x000000 ; int17
	int 0x000000 ; int18
	int _I2C_IRQHandler ; int19
	int _UART2_TX_IRQHandler ; int20
	int _UART2_RX_IRQHandler ; int21
	int _ADC1_IRQHandler ; int22
	int _TIM4_UPD_OVF_IRQHandler ; int23
	int _EEPROM_EEC_IRQHandler ; int24
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
	call	___sdcc_external_startup
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	stm8s_debug_top_main.c: 44: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	stm8s_debug_top_main.c: 50: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);  
	ld	a, 0x50c6
	and	a, #0xe7
	ld	0x50c6, a
;	stm8s_debug_top_main.c: 52: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
	ld	a, 0x50c6
	ld	0x50c6, a
;	stm8s_debug_top_main.c: 55: MibDebugInit(9600);
	push	#0x80
	push	#0x25
	clrw	x
	pushw	x
	call	_MibDebugInit
;	stm8s_debug_top_main.c: 56: timIrqInit();
	call	_timIrqInit
;	stm8s_debug_top_main.c: 65: enableInterrupts();
	rim
;	stm8s_debug_top_main.c: 68: MibWriteDebugStringCheck(1, "\r\n ###################################\r\n");
	ldw	x, #(__str_0+0)
	call	_MibWriteDebugString
;	stm8s_debug_top_main.c: 69: MibWriteDebugStringCheck(1, " file name : " __FILE__ "\r\n");
	ldw	x, #(__str_1+0)
	call	_MibWriteDebugString
;	stm8s_debug_top_main.c: 70: MibWriteDebugStringCheck(1, " date :  "__DATE__"  :  "__TIME__"\r\n");
	ldw	x, #(__str_2+0)
	call	_MibWriteDebugString
;	stm8s_debug_top_main.c: 71: MibWriteDebugStringCheck(1, " webgpio.com by MYMEDIA Co., Ltd.\r\n");
	ldw	x, #(__str_3+0)
	call	_MibWriteDebugString
;	stm8s_debug_top_main.c: 72: MibWriteDebugStringCheck(1, " ###################################\r\n");
	ldw	x, #(__str_4+0)
	call	_MibWriteDebugString
;	stm8s_debug_top_main.c: 74: debug_main();
	call	_debug_main
;	stm8s_debug_top_main.c: 76: while(1);
00102$:
	jra	00102$
;	stm8s_debug_top_main.c: 77: }
	ret
;	stm8s_debug_top_main.c: 82: void debug_main(void)
;	-----------------------------------------
;	 function debug_main
;	-----------------------------------------
_debug_main:
	sub	sp, #80
;	stm8s_debug_top_main.c: 91: cmd[0] = 0;
	clr	(0x01, sp)
;	stm8s_debug_top_main.c: 92: cmd[1] = 0;
	clr	(0x02, sp)
;	stm8s_debug_top_main.c: 93: ccprintf(_DEBUG_TOP_A_, ("\r\n [help or ?] to get a list of commands\r\n\r"));
	push	#<(__str_5+0)
	push	#((__str_5+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_debug_top_main.c: 94: cmd_list.cur = 0;
	mov	_cmd_list+0, #0x00
;	stm8s_debug_top_main.c: 95: cmd_list.next = 0;
	ldw	x, #_cmd_list+0
	mov	_cmd_list+1, #0x00
;	stm8s_debug_top_main.c: 96: memset((void *)(&cmd_list), 0, sizeof(cmd_list));
	push	#0x02
	push	#0x01
	push	#0x00
	push	#0x00
	call	_memset
;	stm8s_debug_top_main.c: 100: cmd_mem();
	call	_cmd_mem
00118$:
;	stm8s_debug_top_main.c: 112: ccprintf(1,("My>"));
	push	#<(__str_6+0)
	push	#((__str_6+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_debug_top_main.c: 114: GetCommand(cmd, CMD_CHAR_MAX - 1, 60);
	push	#0x3c
	push	#0x3f
	push	#0x00
	ldw	x, sp
	addw	x, #4
	call	_GetCommand
;	stm8s_debug_top_main.c: 115: if (!cmd || !cmd[0]) continue;
	ld	a, (0x01, sp)
	jreq	00118$
;	stm8s_debug_top_main.c: 116: cmd_str = (char *)cmd;
;	stm8s_debug_top_main.c: 117: argc = GetArgs(cmd_str, argv);
	ldw	x, sp
	addw	x, #65
	pushw	x
	ldw	x, sp
	addw	x, #3
	call	_GetArgs
	ldw	(0x4b, sp), x
;	stm8s_debug_top_main.c: 118: for (cptr = cmdTbl; cptr->cmd; cptr++)
	ldw	x, #(_cmdTbl+0)
	ldw	(0x4d, sp), x
	ldw	(0x4f, sp), x
00116$:
	ldw	x, (0x4f, sp)
	ldw	x, (x)
	jreq	00106$
;	stm8s_debug_top_main.c: 120: if (!strcmp(argv[0], cptr->cmd))
	ldw	y, (0x41, sp)
	pushw	x
	ldw	x, y
	call	_strcmp
	tnzw	x
	jrne	00117$
;	stm8s_debug_top_main.c: 122: (cptr->run)(cptr, argc, argv);
	ldw	y, (0x4d, sp)
	ldw	y, (0x2, y)
	ldw	x, sp
	addw	x, #65
	pushw	x
	ldw	x, (0x4d, sp)
	pushw	x
	ldw	x, (0x51, sp)
	call	(y)
;	stm8s_debug_top_main.c: 123: break;
	jra	00106$
00117$:
;	stm8s_debug_top_main.c: 118: for (cptr = cmdTbl; cptr->cmd; cptr++)
	ldw	x, (0x4f, sp)
	addw	x, #0x0006
	ldw	(0x4f, sp), x
	ldw	(0x4d, sp), x
	jra	00116$
00106$:
;	stm8s_debug_top_main.c: 126: if (!strcmp(argv[0], "help") || !strcmp(argv[0], "?"))
	ldw	x, (0x41, sp)
	push	#<(___str_7+0)
	push	#((___str_7+0) >> 8)
	call	_strcmp
	ldw	(0x4f, sp), x
	jreq	00107$
	ldw	x, (0x41, sp)
	push	#<(___str_8+0)
	push	#((___str_8+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00108$
00107$:
;	stm8s_debug_top_main.c: 128: DoPrintHelp(argc, argv);
	ldw	x, sp
	addw	x, #65
	pushw	x
	ldw	x, (0x4d, sp)
	call	_DoPrintHelp
00108$:
;	stm8s_debug_top_main.c: 130: if (!strcmp(argv[0], "q") || !strcmp(argv[0], "Q"))
	ldw	x, (0x41, sp)
	push	#<(___str_9+0)
	push	#((___str_9+0) >> 8)
	call	_strcmp
	tnzw	x
	jreq	00110$
	ldw	y, (0x41, sp)
	ldw	(0x4f, sp), y
	push	#<(___str_10+0)
	push	#((___str_10+0) >> 8)
	ldw	x, (0x51, sp)
	call	_strcmp
	ldw	(0x4f, sp), x
	jreq	00168$
	jp	00118$
00168$:
00110$:
;	stm8s_debug_top_main.c: 132: ccprintf(_DEBUG_TOP_A_,("\r\nmonitor program end!!!\r\n"));
	push	#<(__str_11+0)
	push	#((__str_11+0) >> 8)
	call	_mib_printf
;	stm8s_debug_top_main.c: 133: break;
;	stm8s_debug_top_main.c: 137: }
	addw	sp, #82
	ret
	.area CODE
	.area CONST
	.area CONST
__str_0:
	.db 0x0d
	.db 0x0a
	.ascii " ###################################"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_1:
	.ascii " file name : stm8s_debug_top_main.c"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_2:
	.ascii " date :  Feb  9 2023  :  18:25:02"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_3:
	.ascii " webgpio.com by MYMEDIA Co., Ltd."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_4:
	.ascii " ###################################"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_5:
	.db 0x0d
	.db 0x0a
	.ascii " [help or ?] to get a list of commands"
	.db 0x0d
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CODE
	.area CONST
__str_6:
	.ascii "My>"
	.db 0x00
	.area CODE
	.area CONST
___str_7:
	.ascii "help"
	.db 0x00
	.area CODE
	.area CONST
___str_8:
	.ascii "?"
	.db 0x00
	.area CODE
	.area CONST
___str_9:
	.ascii "q"
	.db 0x00
	.area CODE
	.area CONST
___str_10:
	.ascii "Q"
	.db 0x00
	.area CODE
	.area CONST
__str_11:
	.db 0x0d
	.db 0x0a
	.ascii "monitor program end!!!"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
