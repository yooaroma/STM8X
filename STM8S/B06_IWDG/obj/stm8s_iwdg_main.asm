;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_iwdg_main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cmd_test_init_before_irq_enable
	.globl _cmd_test
	.globl _cmd_iwdg
	.globl _calConfigIWDG
	.globl _DecToLong
	.globl _HexToInt
	.globl _mib_printf
	.globl _MibWriteDebugString
	.globl ___memcpy
	.globl _strcmp
	.globl _GPIO_Configuration
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_cmdTbl_only:
	.ds 12
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	stm8s_iwdg_main.c: 81: void cmd_iwdg(void)
;	-----------------------------------------
;	 function cmd_iwdg
;	-----------------------------------------
_cmd_iwdg:
	sub	sp, #10
;	stm8s_iwdg_main.c: 87: for (cptr = cmdTbl;; cptr++) 
	ldw	x, #(_cmdTbl+0)
	ldw	(0x01, sp), x
	clrw	x
	ldw	(0x07, sp), x
	ldw	(0x05, sp), x
	ldw	y, (0x01, sp)
	ldw	(0x09, sp), y
00106$:
;	stm8s_iwdg_main.c: 89: if(cptr->cmd==0)
	ldw	x, (0x09, sp)
	ldw	x, (x)
	ldw	(0x03, sp), x
	jrne	00102$
;	stm8s_iwdg_main.c: 91: ccprintf(1,("INFO:+cmd_iwdg...\r\n"));
	push	#<(__str_0+0)
	push	#((__str_0+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_iwdg_main.c: 92: memcpy((void *)&(cptr->cmd),(void *)&(cmdTbl_only[0].cmd),sizeof(CMD_MY));
	ldw	x, #_cmdTbl_only+0
	ldw	y, (0x01, sp)
	push	#0x06
	push	#0x00
	pushw	x
	ldw	x, y
	call	___memcpy
;	stm8s_iwdg_main.c: 93: break;
	jra	00105$
00102$:
;	stm8s_iwdg_main.c: 95: index++;
	ldw	x, (0x07, sp)
	incw	x
	ldw	(0x07, sp), x
	jrne	00126$
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x05, sp), x
00126$:
;	stm8s_iwdg_main.c: 96: if(index>MAX_COMMANDS)
	ldw	x, #0x0006
	cpw	x, (0x07, sp)
	clr	a
	sbc	a, (0x06, sp)
	clr	a
	sbc	a, (0x05, sp)
	jrnc	00107$
;	stm8s_iwdg_main.c: 98: ccprintf(1,("INFO:-cmd_iwdg...\r\n"));
	push	#<(__str_1+0)
	push	#((__str_1+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_iwdg_main.c: 99: return;
	jra	00108$
00107$:
;	stm8s_iwdg_main.c: 87: for (cptr = cmdTbl;; cptr++) 
	ldw	x, (0x09, sp)
	addw	x, #0x0006
	ldw	(0x09, sp), x
	ldw	(0x01, sp), x
	jra	00106$
00105$:
;	stm8s_iwdg_main.c: 102: return;
00108$:
;	stm8s_iwdg_main.c: 103: }
	addw	sp, #10
	ret
;	stm8s_iwdg_main.c: 108: void cmd_test(void)
;	-----------------------------------------
;	 function cmd_test
;	-----------------------------------------
_cmd_test:
;	stm8s_iwdg_main.c: 110: cmd_iwdg();
;	stm8s_iwdg_main.c: 111: }
	jp	_cmd_iwdg
;	stm8s_iwdg_main.c: 117: void cmd_test_init_before_irq_enable(void)
;	-----------------------------------------
;	 function cmd_test_init_before_irq_enable
;	-----------------------------------------
_cmd_test_init_before_irq_enable:
;	stm8s_iwdg_main.c: 120: }
	ret
;	stm8s_iwdg_main.c: 131: static int DoIWDG(CMD_MY *cptr, int argc, char **argv)
;	-----------------------------------------
;	 function DoIWDG
;	-----------------------------------------
_DoIWDG:
	sub	sp, #13
	exgw	x, y
;	stm8s_iwdg_main.c: 133: uint32_t vdwAddr = 0;
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
;	stm8s_iwdg_main.c: 134: uint8_t vbData = 0;
	clr	(0x05, sp)
;	stm8s_iwdg_main.c: 135: uint16_t vwData = 0;
	clrw	x
	ldw	(0x06, sp), x
;	stm8s_iwdg_main.c: 139: MibWriteDebugString(cptr->usage);
	ldw	x, y
	addw	x, #0x0004
	ldw	(0x08, sp), x
;	stm8s_iwdg_main.c: 137: if (argc < 2)
	ldw	x, (0x10, sp)
	cpw	x, #0x0002
	jrsge	00102$
;	stm8s_iwdg_main.c: 139: MibWriteDebugString(cptr->usage);
	ldw	x, (0x08, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_iwdg_main.c: 140: return FALSE;
	clrw	x
	jp	00141$
00102$:
;	stm8s_iwdg_main.c: 145: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
	ldw	x, (0x12, sp)
	incw	x
	incw	x
	ldw	(0x0a, sp), x
	ldw	x, (x)
	push	#<(___str_2+0)
	push	#((___str_2+0) >> 8)
	call	_strcmp
;	stm8s_iwdg_main.c: 152: if (!HexToInt(argv[2], &vdwAddr, 32))
	ldw	y, (0x12, sp)
	addw	y, #0x0004
	ldw	(0x0c, sp), y
;	stm8s_iwdg_main.c: 145: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
	tnzw	x
	jrne	00139$
;	stm8s_iwdg_main.c: 147: if (argc < 4)
	ldw	x, (0x10, sp)
	cpw	x, #0x0004
	jrsge	00104$
;	stm8s_iwdg_main.c: 149: MibWriteDebugString(cptr->usage);
	ldw	x, (0x08, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_iwdg_main.c: 150: return FALSE;
	clrw	x
	jp	00141$
00104$:
;	stm8s_iwdg_main.c: 152: if (!HexToInt(argv[2], &vdwAddr, 32))
	ldw	x, sp
	incw	x
	ldw	y, (0x0c, sp)
	ldw	y, (y)
	push	#0x20
	push	#0x00
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00106$
;	stm8s_iwdg_main.c: 154: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_iwdg_main.c: 155: return FALSE;
	clrw	x
	jp	00141$
00106$:
;	stm8s_iwdg_main.c: 157: if (!HexToInt(argv[3], &vbData, 8))
	ldw	y, (0x12, sp)
	ldw	y, (0x6, y)
	push	#0x08
	push	#0x00
	ldw	x, sp
	addw	x, #7
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00108$
;	stm8s_iwdg_main.c: 159: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_iwdg_main.c: 160: return FALSE;
	clrw	x
	jp	00141$
00108$:
;	stm8s_iwdg_main.c: 162: wr_ADDR8(vdwAddr, vbData);
	ldw	x, (0x03, sp)
	ld	a, (0x05, sp)
	ld	(x), a
;	stm8s_iwdg_main.c: 163: ccprintf(_DEBUG_CMD_A_,("wr_ADDR8 : 0x%08lx[0x%02x]\r\n", vdwAddr,vbData));
	clrw	x
	ld	a, (0x05, sp)
	ld	xl, a
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	push	#<(__str_4+0)
	push	#((__str_4+0) >> 8)
	call	_mib_printf
	addw	sp, #8
	jp	00140$
00139$:
;	stm8s_iwdg_main.c: 168: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
	ldw	x, (0x0a, sp)
	ldw	x, (x)
	push	#<(___str_5+0)
	push	#((___str_5+0) >> 8)
	call	_strcmp
	exgw	x, y
;	stm8s_iwdg_main.c: 170: if (argc < 3)
	ldw	x, (0x10, sp)
	cpw	x, #0x0003
	jrslt	00229$
	clr	a
	.byte 0xc5
00229$:
	ld	a, #0x01
00230$:
;	stm8s_iwdg_main.c: 168: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
	tnzw	y
	jrne	00136$
;	stm8s_iwdg_main.c: 170: if (argc < 3)
	tnz	a
	jreq	00110$
;	stm8s_iwdg_main.c: 172: MibWriteDebugString(cptr->usage);
	ldw	x, (0x08, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_iwdg_main.c: 173: return FALSE;
	clrw	x
	jp	00141$
00110$:
;	stm8s_iwdg_main.c: 175: if (!HexToInt(argv[2], &vdwAddr, 32))
	ldw	x, sp
	incw	x
	ldw	y, (0x0c, sp)
	ldw	y, (y)
	push	#0x20
	push	#0x00
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00112$
;	stm8s_iwdg_main.c: 177: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_iwdg_main.c: 178: return FALSE;
	clrw	x
	jp	00141$
00112$:
;	stm8s_iwdg_main.c: 181: vbData = rd_ADDR8(vdwAddr);
	ldw	x, (0x03, sp)
	ld	a, (x)
	ld	(0x05, sp), a
;	stm8s_iwdg_main.c: 183: ccprintf(_DEBUG_CMD_A_,("rd_ADDR8 : 0x%08lx[0x%02x]\r\n", vdwAddr,vbData));
	clrw	x
	ld	xl, a
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	push	#<(__str_6+0)
	push	#((__str_6+0) >> 8)
	call	_mib_printf
	addw	sp, #8
	jp	00140$
00136$:
;	stm8s_iwdg_main.c: 188: else if (!strcmp(argv[1], "start")) // _CMD_MY_READ_
	ldw	x, (0x0a, sp)
	ldw	x, (x)
	push	a
	push	#<(___str_7+0)
	push	#((___str_7+0) >> 8)
	call	_strcmp
	pop	a
	tnzw	x
	jreq	00234$
	jp	00133$
00234$:
;	stm8s_iwdg_main.c: 191: uint16_t vwDelayWD = 0;
	clrw	y
;	stm8s_iwdg_main.c: 192: if (argc < 3)
	tnz	a
	jreq	00114$
;	stm8s_iwdg_main.c: 194: MibWriteDebugString(cptr->usage);
	ldw	x, (0x08, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_iwdg_main.c: 195: return FALSE;
	clrw	x
	jp	00141$
00114$:
;	stm8s_iwdg_main.c: 197: if (!DecToLong(argv[2], &vwData, 16))
	ldw	x, (0x0c, sp)
	ldw	x, (x)
	ldw	(0x0a, sp), x
	pushw	y
	push	#0x10
	push	#0x00
	ldw	x, sp
	addw	x, #10
	pushw	x
	ldw	x, (0x10, sp)
	call	_DecToLong
	popw	y
	tnzw	x
	jrne	00116$
;	stm8s_iwdg_main.c: 199: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_iwdg_main.c: 200: return FALSE;
	clrw	x
	jp	00141$
00116$:
;	stm8s_iwdg_main.c: 202: GPIO_Configuration();
	pushw	y
	call	_GPIO_Configuration
	ldw	x, (0x08, sp)
	pushw	x
	push	#<(__str_8+0)
	push	#((__str_8+0) >> 8)
	call	_mib_printf
	addw	sp, #4
	ldw	x, (0x08, sp)
	call	_calConfigIWDG
	popw	y
;	stm8s_iwdg_main.c: 205: gwMibMiliSec = 0; 
	clrw	x
	ldw	_gwMibMiliSec+0, x
;	stm8s_iwdg_main.c: 206: do {	
	clr	(0x0d, sp)
00123$:
;	stm8s_iwdg_main.c: 207: if(gwMibMiliSec==0)
	ldw	x, _gwMibMiliSec+0
	jrne	00123$
;	stm8s_iwdg_main.c: 209: IWDG->KR = 0xAA; // KEY_REFRESH
	mov	0x50e0+0, #0xaa
;	stm8s_iwdg_main.c: 210: if(vwDelayWD==0)
	tnzw	y
	jrne	00120$
;	stm8s_iwdg_main.c: 212: vbIndex++;
	inc	(0x0d, sp)
;	stm8s_iwdg_main.c: 213: vwDelayWD = 100 * vbIndex;
	clrw	x
	ld	a, (0x0d, sp)
	ld	xl, a
	pushw	x
	pushw	x
	ldw	x, #0x0064
	call	__mulint
	exgw	x, y
	popw	x
;	stm8s_iwdg_main.c: 214: ccprintf(_DEBUG_CMD_A_, ("iwdg start....(%d)[%u:%u]\r\n",vbIndex,vwData,vwDelayWD));		
	pushw	y
	pushw	y
	ld	a, (0x0b, sp)
	push	a
	ld	a, (0x0b, sp)
	push	a
	pushw	x
	push	#<(__str_9+0)
	push	#((__str_9+0) >> 8)
	call	_mib_printf
	addw	sp, #8
	popw	y
;	stm8s_iwdg_main.c: 215: if(vwDelayWD>=(vwData+100))
	ldw	x, (0x06, sp)
	addw	x, #0x0064
	ldw	(0x0b, sp), x
	ldw	x, y
	cpw	x, (0x0b, sp)
	jrnc	00140$
;	stm8s_iwdg_main.c: 217: break;
00120$:
;	stm8s_iwdg_main.c: 220: gwMibMiliSec = 100;
	ldw	x, #0x0064
	ldw	_gwMibMiliSec+0, x
;	stm8s_iwdg_main.c: 221: vwDelayWD -= 100;
	subw	y, #0x0064
;	stm8s_iwdg_main.c: 223: UCOM_LED1_GPIO->ODR ^= (uint8_t)UCOM_LED1_PIN;
	bcpl	0x500f, #0
;	stm8s_iwdg_main.c: 225: } while(1);
	jra	00123$
00133$:
;	stm8s_iwdg_main.c: 231: else if (!strcmp(argv[1], "init")) // _CMD_MY_READ_
	ldw	x, (0x0a, sp)
	ldw	x, (x)
	push	#<(___str_10+0)
	push	#((___str_10+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00130$
;	stm8s_iwdg_main.c: 233: GPIO_Configuration();
	call	_GPIO_Configuration
;	stm8s_iwdg_main.c: 235: ccprintf(_DEBUG_CMD_A_, ("iwdg init....()\r\n"));		
	push	#<(__str_11+0)
	push	#((__str_11+0) >> 8)
	call	_mib_printf
	addw	sp, #2
	jra	00140$
00130$:
;	stm8s_iwdg_main.c: 240: else if (!strcmp(argv[1], "help")) // _CMD_MY_READ_
	ldw	x, (0x0a, sp)
	ldw	x, (x)
	push	#<(___str_12+0)
	push	#((___str_12+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00127$
;	stm8s_iwdg_main.c: 243: "iwdg init // gpio init\r\n"\
	ldw	x, #(___str_13+0)
	call	_MibWriteDebugString
	jra	00140$
00127$:
;	stm8s_iwdg_main.c: 249: MibWriteDebugString(cptr->usage);
	ldw	x, (0x08, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_iwdg_main.c: 250: return FALSE;
	clrw	x
;	stm8s_iwdg_main.c: 252: return TRUE;
	.byte 0xc5
00140$:
	clrw	x
	incw	x
00141$:
;	stm8s_iwdg_main.c: 253: }
	ldw	y, (14, sp)
	addw	sp, #19
	jp	(y)
;	stm8s_iwdg_main.c: 301: void GPIO_Configuration(void)
;	-----------------------------------------
;	 function GPIO_Configuration
;	-----------------------------------------
_GPIO_Configuration:
;	stm8s_iwdg_main.c: 316: UCOM_LED1_GPIO->DDR |= (UCOM_LED1_PIN); /* Set Output mode */
	bset	0x5011, #0
;	stm8s_iwdg_main.c: 317: UCOM_LED1_GPIO->CR1 |= (UCOM_LED1_PIN);	/* Pull-Up or Push-Pull */
	bset	0x5012, #0
;	stm8s_iwdg_main.c: 318: UCOM_LED1_GPIO->CR2 |= (UCOM_LED1_PIN);	/* Output speed up to 10 MHz */
	bset	0x5013, #0
;	stm8s_iwdg_main.c: 319: UCOM_LED1_GPIO->ODR &= ~(UCOM_LED1_PIN); // low... 
	bres	0x500f, #0
;	stm8s_iwdg_main.c: 324: UCOM_KEY1_GPIO->DDR &= ~(UCOM_KEY1_PIN);  /* Set input mode */
	bres	0x5007, #5
;	stm8s_iwdg_main.c: 325: UCOM_KEY1_GPIO->CR1 |= (UCOM_KEY1_PIN);	 /* Pull-Up or Push-Pull */
	bset	0x5008, #5
;	stm8s_iwdg_main.c: 326: UCOM_KEY1_GPIO->CR2 &= ~(UCOM_KEY1_PIN); /*  External interrupt disabled */
	bres	0x5009, #5
;	stm8s_iwdg_main.c: 328: }
	ret
	.area CODE
	.area CONST
	.area CONST
__str_0:
	.ascii "INFO:+cmd_iwdg..."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_1:
	.ascii "INFO:-cmd_iwdg..."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_2:
	.ascii "write"
	.db 0x00
	.area CODE
	.area CONST
__str_3:
	.ascii "Illugal character is used."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_4:
	.ascii "wr_ADDR8 : 0x%08lx[0x%02x]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_5:
	.ascii "read"
	.db 0x00
	.area CODE
	.area CONST
__str_6:
	.ascii "rd_ADDR8 : 0x%08lx[0x%02x]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_7:
	.ascii "start"
	.db 0x00
	.area CODE
	.area CONST
__str_8:
	.ascii "iwdg delay [%d] msec  100msec inc time watch dog generate.."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_9:
	.ascii "iwdg start....(%d)[%u:%u]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_10:
	.ascii "init"
	.db 0x00
	.area CODE
	.area CONST
__str_11:
	.ascii "iwdg init....()"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_12:
	.ascii "help"
	.db 0x00
	.area CODE
	.area CONST
___str_13:
	.ascii "iwdg help...."
	.db 0x09
	.db 0x0d
	.db 0x0a
	.ascii "iwdg init // gpio init"
	.db 0x0d
	.db 0x0a
	.ascii "iwdg start 1000 // 1000msec delay "
	.db 0x0d
	.db 0x0a
	.ascii "// 100msec inc after n times watch dog generate.."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_14:
	.ascii "iwdg"
	.db 0x00
	.area CODE
	.area CONST
___str_15:
	.ascii "  iwdg {write} [addr] [data]  "
	.db 0x0d
	.db 0x0a
	.ascii "  iwdg {read} [addr] "
	.db 0x0d
	.db 0x0a
	.ascii "  iwdg {init} "
	.db 0x0d
	.db 0x0a
	.ascii "  iwdg {start} [delay:msec] halt.. 100msec inc check...max 1"
	.ascii "sec"
	.db 0x0d
	.db 0x0a
	.ascii "  iwdg {help}  iwdg help."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area INITIALIZER
__xinit__cmdTbl_only:
	.dw ___str_14
	.dw _DoIWDG
	.dw ___str_15
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.area CABS (ABS)
