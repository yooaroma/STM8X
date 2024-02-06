;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_beep_main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cmd_test_init_before_irq_enable
	.globl _cmd_test
	.globl _cmd_beep
	.globl _fnBeepStart
	.globl _DecToLong
	.globl _HexToInt
	.globl _mib_printf
	.globl _MibWriteDebugString
	.globl ___memcpy
	.globl _strcmp
	.globl _FLASH_ProgramOptionByte
	.globl _FLASH_ReadOptionByte
	.globl _FLASH_ReadByte
	.globl _FLASH_Unlock
	.globl _gbDelayData
	.globl _GPIO_Configuration
	.globl _calConfigBEEP_test
	.globl _Delay
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_gbDelayData::
	.ds 1
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
;	stm8s_beep_main.c: 185: void cmd_beep(void)
;	-----------------------------------------
;	 function cmd_beep
;	-----------------------------------------
_cmd_beep:
	sub	sp, #10
;	stm8s_beep_main.c: 191: for (cptr = cmdTbl;; cptr++) 
	ldw	x, #(_cmdTbl+0)
	ldw	(0x01, sp), x
	clrw	x
	ldw	(0x07, sp), x
	ldw	(0x05, sp), x
	ldw	y, (0x01, sp)
	ldw	(0x09, sp), y
00106$:
;	stm8s_beep_main.c: 193: if(cptr->cmd==0)
	ldw	x, (0x09, sp)
	ldw	x, (x)
	ldw	(0x03, sp), x
	jrne	00102$
;	stm8s_beep_main.c: 195: ccprintf(1,("INFO:+cmd_beep...\r\n"));
	push	#<(__str_0+0)
	push	#((__str_0+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_beep_main.c: 196: memcpy((void *)&(cptr->cmd),(void *)&(cmdTbl_only[0].cmd),sizeof(CMD_MY));
	ldw	x, #_cmdTbl_only+0
	ldw	y, (0x01, sp)
	push	#0x06
	push	#0x00
	pushw	x
	ldw	x, y
	call	___memcpy
;	stm8s_beep_main.c: 197: break;
	jra	00105$
00102$:
;	stm8s_beep_main.c: 199: index++;
	ldw	x, (0x07, sp)
	incw	x
	ldw	(0x07, sp), x
	jrne	00126$
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x05, sp), x
00126$:
;	stm8s_beep_main.c: 200: if(index>MAX_COMMANDS)
	ldw	x, #0x0006
	cpw	x, (0x07, sp)
	clr	a
	sbc	a, (0x06, sp)
	clr	a
	sbc	a, (0x05, sp)
	jrnc	00107$
;	stm8s_beep_main.c: 202: ccprintf(1,("INFO:-cmd_beep...\r\n"));
	push	#<(__str_1+0)
	push	#((__str_1+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_beep_main.c: 203: return;
	jra	00108$
00107$:
;	stm8s_beep_main.c: 191: for (cptr = cmdTbl;; cptr++) 
	ldw	x, (0x09, sp)
	addw	x, #0x0006
	ldw	(0x09, sp), x
	ldw	(0x01, sp), x
	jra	00106$
00105$:
;	stm8s_beep_main.c: 206: return;
00108$:
;	stm8s_beep_main.c: 207: }
	addw	sp, #10
	ret
;	stm8s_beep_main.c: 212: void cmd_test(void)
;	-----------------------------------------
;	 function cmd_test
;	-----------------------------------------
_cmd_test:
;	stm8s_beep_main.c: 214: cmd_beep();
;	stm8s_beep_main.c: 215: }
	jp	_cmd_beep
;	stm8s_beep_main.c: 221: void cmd_test_init_before_irq_enable(void)
;	-----------------------------------------
;	 function cmd_test_init_before_irq_enable
;	-----------------------------------------
_cmd_test_init_before_irq_enable:
;	stm8s_beep_main.c: 224: }
	ret
;	stm8s_beep_main.c: 237: static int DoBEEP(CMD_MY *cptr, int argc, char **argv)
;	-----------------------------------------
;	 function DoBEEP
;	-----------------------------------------
_DoBEEP:
	sub	sp, #19
	exgw	x, y
;	stm8s_beep_main.c: 239: uint32_t vdwAddr = 0;
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
;	stm8s_beep_main.c: 240: uint8_t vbData = 0;
	clr	(0x05, sp)
;	stm8s_beep_main.c: 241: uint16_t vwData = 0;
	clrw	x
	ldw	(0x06, sp), x
;	stm8s_beep_main.c: 242: uint16_t vwDataDelay = 0;
	clrw	x
	ldw	(0x08, sp), x
;	stm8s_beep_main.c: 246: MibWriteDebugString(cptr->usage);
	ldw	x, y
	addw	x, #0x0004
	ldw	(0x0a, sp), x
;	stm8s_beep_main.c: 244: if (argc < 2)
	ldw	x, (0x16, sp)
	cpw	x, #0x0002
	jrsge	00102$
;	stm8s_beep_main.c: 246: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0a, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_beep_main.c: 247: return FALSE;
	clrw	x
	jp	00187$
00102$:
;	stm8s_beep_main.c: 252: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
	ldw	x, (0x18, sp)
	incw	x
	incw	x
	ldw	(0x0c, sp), x
	ldw	x, (x)
	push	#<(___str_2+0)
	push	#((___str_2+0) >> 8)
	call	_strcmp
	exgw	x, y
;	stm8s_beep_main.c: 254: if (argc < 4)
	ldw	x, (0x16, sp)
	cpw	x, #0x0004
	jrslt	00365$
	clr	(0x0e, sp)
	jra	00366$
00365$:
	ld	a, #0x01
	ld	(0x0e, sp), a
00366$:
;	stm8s_beep_main.c: 259: if (!HexToInt(argv[2], &vdwAddr, 32))
	ldw	x, (0x18, sp)
	addw	x, #0x0004
	ldw	(0x0f, sp), x
;	stm8s_beep_main.c: 264: if (!HexToInt(argv[3], &vbData, 8))
	ldw	x, (0x18, sp)
	addw	x, #0x0006
	ldw	(0x11, sp), x
;	stm8s_beep_main.c: 252: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
	tnzw	y
	jrne	00185$
;	stm8s_beep_main.c: 254: if (argc < 4)
	tnz	(0x0e, sp)
	jreq	00104$
;	stm8s_beep_main.c: 256: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0a, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_beep_main.c: 257: return FALSE;
	clrw	x
	jp	00187$
00104$:
;	stm8s_beep_main.c: 259: if (!HexToInt(argv[2], &vdwAddr, 32))
	ldw	x, sp
	incw	x
	exgw	x, y
	ldw	x, (0x0f, sp)
	ldw	x, (x)
	push	#0x20
	push	#0x00
	pushw	y
	call	_HexToInt
	tnzw	x
	jrne	00106$
;	stm8s_beep_main.c: 261: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_beep_main.c: 262: return FALSE;
	clrw	x
	jp	00187$
00106$:
;	stm8s_beep_main.c: 264: if (!HexToInt(argv[3], &vbData, 8))
	ldw	x, sp
	addw	x, #5
	exgw	x, y
	ldw	x, (0x11, sp)
	ldw	x, (x)
	push	#0x08
	push	#0x00
	pushw	y
	call	_HexToInt
	tnzw	x
	jrne	00108$
;	stm8s_beep_main.c: 266: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_beep_main.c: 267: return FALSE;
	clrw	x
	jp	00187$
00108$:
;	stm8s_beep_main.c: 269: wr_ADDR8(vdwAddr, vbData);
	ldw	x, (0x03, sp)
	ld	a, (0x05, sp)
	ld	(x), a
;	stm8s_beep_main.c: 270: ccprintf(_DEBUG_CMD_A_,("wr_ADDR8 : 0x%08lx[0x%02x]\r\n", vdwAddr,vbData));
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
	jp	00186$
00185$:
;	stm8s_beep_main.c: 275: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
	ldw	x, (0x0c, sp)
	ldw	x, (x)
	push	#<(___str_5+0)
	push	#((___str_5+0) >> 8)
	call	_strcmp
	exgw	x, y
;	stm8s_beep_main.c: 277: if (argc < 3)
	ldw	x, (0x16, sp)
	cpw	x, #0x0003
	jrslt	00371$
	clr	(0x13, sp)
	jra	00372$
00371$:
	ld	a, #0x01
	ld	(0x13, sp), a
00372$:
;	stm8s_beep_main.c: 275: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
	tnzw	y
	jrne	00182$
;	stm8s_beep_main.c: 277: if (argc < 3)
	tnz	(0x13, sp)
	jreq	00110$
;	stm8s_beep_main.c: 279: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0a, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_beep_main.c: 280: return FALSE;
	clrw	x
	jp	00187$
00110$:
;	stm8s_beep_main.c: 282: if (!HexToInt(argv[2], &vdwAddr, 32))
	ldw	x, sp
	incw	x
	ldw	y, (0x0f, sp)
	ldw	y, (y)
	push	#0x20
	push	#0x00
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00112$
;	stm8s_beep_main.c: 284: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_beep_main.c: 285: return FALSE;
	clrw	x
	jp	00187$
00112$:
;	stm8s_beep_main.c: 288: vbData = rd_ADDR8(vdwAddr);
	ldw	x, (0x03, sp)
	ld	a, (x)
	ld	(0x05, sp), a
;	stm8s_beep_main.c: 290: ccprintf(_DEBUG_CMD_A_,("rd_ADDR8 : 0x%08lx[0x%02x]\r\n", vdwAddr,vbData));
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
	jp	00186$
00182$:
;	stm8s_beep_main.c: 295: else if (!strcmp(argv[1], "freq")) // _CMD_MY_READ_
	ldw	x, (0x0c, sp)
	ldw	x, (x)
	push	#<(___str_7+0)
	push	#((___str_7+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00179$
;	stm8s_beep_main.c: 297: if (argc < 3)
	tnz	(0x13, sp)
	jreq	00114$
;	stm8s_beep_main.c: 299: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0a, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_beep_main.c: 300: return FALSE;
	clrw	x
	jp	00187$
00114$:
;	stm8s_beep_main.c: 303: if (!DecToLong(argv[2], &vwData, 16))
	ldw	x, sp
	addw	x, #6
	exgw	x, y
	ldw	x, (0x0f, sp)
	ldw	x, (x)
	push	#0x10
	push	#0x00
	pushw	y
	call	_DecToLong
	tnzw	x
	jrne	00116$
;	stm8s_beep_main.c: 305: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_beep_main.c: 306: return FALSE;
	clrw	x
	jp	00187$
00116$:
;	stm8s_beep_main.c: 308: ccprintf(_DEBUG_CMD_A_, ("beep freq : [%d] Hz\r\n",(vwData)));		
	ldw	x, (0x06, sp)
	pushw	x
	push	#<(__str_8+0)
	push	#((__str_8+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	stm8s_beep_main.c: 309: calConfigBEEP_test(vwData);
	ldw	x, (0x06, sp)
	call	_calConfigBEEP_test
	jp	00186$
00179$:
;	stm8s_beep_main.c: 314: else if (!strcmp(argv[1], "enable")) // _CMD_MY_READ_
	ldw	x, (0x0c, sp)
	ldw	x, (x)
	push	#<(___str_9+0)
	push	#((___str_9+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00176$
;	stm8s_beep_main.c: 317: BEEP->CSR |= BEEP_CSR_BEEPEN;
	bset	0x50f3, #5
;	stm8s_beep_main.c: 318: ccprintf(_DEBUG_CMD_A_, ("beep enable....(0x%x)\r\n",BEEP->CSR));
	ld	a, 0x50f3
	clrw	x
	ld	xl, a
	pushw	x
	push	#<(__str_10+0)
	push	#((__str_10+0) >> 8)
	call	_mib_printf
	addw	sp, #4
	jp	00186$
00176$:
;	stm8s_beep_main.c: 323: else if (!strcmp(argv[1], "disable")) // _CMD_MY_READ_
	ldw	x, (0x0c, sp)
	ldw	x, (x)
	push	#<(___str_11+0)
	push	#((___str_11+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00173$
;	stm8s_beep_main.c: 326: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
	bres	0x50f3, #5
;	stm8s_beep_main.c: 327: ccprintf(_DEBUG_CMD_A_, ("beep disable....(0x%x)\r\n",BEEP->CSR));
	ld	a, 0x50f3
	clrw	x
	ld	xl, a
	pushw	x
	push	#<(__str_12+0)
	push	#((__str_12+0) >> 8)
	call	_mib_printf
	addw	sp, #4
	jp	00186$
00173$:
;	stm8s_beep_main.c: 332: else if (!strcmp(argv[1], "start")) // _CMD_MY_READ_
	ldw	x, (0x0c, sp)
	ldw	x, (x)
	push	#<(___str_13+0)
	push	#((___str_13+0) >> 8)
	call	_strcmp
;	stm8s_beep_main.c: 334: vwDataDelay = 0;
	tnzw	x
	jrne	00170$
	ldw	(0x08, sp), x
;	stm8s_beep_main.c: 335: if (argc < 3)
	tnz	(0x13, sp)
	jreq	00118$
;	stm8s_beep_main.c: 337: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0a, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_beep_main.c: 338: return FALSE;
	clrw	x
	jp	00187$
00118$:
;	stm8s_beep_main.c: 341: if (!DecToLong(argv[2], &vwData, 16))
	ldw	x, sp
	addw	x, #6
	exgw	x, y
	ldw	x, (0x0f, sp)
	ldw	x, (x)
	push	#0x10
	push	#0x00
	pushw	y
	call	_DecToLong
	tnzw	x
	jrne	00120$
;	stm8s_beep_main.c: 343: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_beep_main.c: 344: return FALSE;
	clrw	x
	jp	00187$
00120$:
;	stm8s_beep_main.c: 346: if (argc >= 4)
	ld	a, (0x0e, sp)
	jrne	00124$
;	stm8s_beep_main.c: 348: if (!DecToLong(argv[3], &vwDataDelay, 16))
	ldw	x, sp
	addw	x, #8
	exgw	x, y
	ldw	x, (0x11, sp)
	ldw	x, (x)
	push	#0x10
	push	#0x00
	pushw	y
	call	_DecToLong
	tnzw	x
	jrne	00124$
;	stm8s_beep_main.c: 350: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_beep_main.c: 351: return FALSE;
	clrw	x
	jp	00187$
00124$:
;	stm8s_beep_main.c: 354: ccprintf(_DEBUG_CMD_A_, ("beep freq : [%d]Hz\r\n",(vwData)));		
	ldw	x, (0x06, sp)
	pushw	x
	push	#<(__str_14+0)
	push	#((__str_14+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	stm8s_beep_main.c: 355: ccprintf(_DEBUG_CMD_A_, ("beep delay : [%d]msec\r\n",(vwDataDelay)));		
	ldw	x, (0x08, sp)
	pushw	x
	push	#<(__str_15+0)
	push	#((__str_15+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	stm8s_beep_main.c: 356: fnBeepStart(vwData,vwDataDelay);
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	call	_fnBeepStart
	jp	00186$
00170$:
;	stm8s_beep_main.c: 380: else if (!strcmp(argv[1], "toggle")) // _CMD_MY_READ_
	ldw	x, (0x0c, sp)
	ldw	x, (x)
	push	#<(___str_16+0)
	push	#((___str_16+0) >> 8)
	call	_strcmp
	tnzw	x
	jreq	00386$
	jp	00167$
00386$:
;	stm8s_beep_main.c: 382: if (argc < 3)
	tnz	(0x13, sp)
	jreq	00126$
;	stm8s_beep_main.c: 384: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0a, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_beep_main.c: 385: return FALSE;
	clrw	x
	jp	00187$
00126$:
;	stm8s_beep_main.c: 388: if (!DecToLong(argv[2], &vwData, 16))
	ldw	x, sp
	addw	x, #6
	exgw	x, y
	ldw	x, (0x0f, sp)
	ldw	x, (x)
	push	#0x10
	push	#0x00
	pushw	y
	call	_DecToLong
	tnzw	x
	jrne	00128$
;	stm8s_beep_main.c: 390: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_beep_main.c: 391: return FALSE;
	clrw	x
	jp	00187$
00128$:
;	stm8s_beep_main.c: 393: ccprintf(_DEBUG_CMD_A_, ("beep toggle : [%d] msec\r\n",(vwData)));		
	ldw	x, (0x06, sp)
	pushw	x
	push	#<(__str_17+0)
	push	#((__str_17+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	stm8s_beep_main.c: 394: gbDelayData = vwData;
	ld	a, (0x07, sp)
	ld	_gbDelayData+0, a
;	stm8s_beep_main.c: 396: GPIO_Configuration();		
	call	_GPIO_Configuration
;	stm8s_beep_main.c: 397: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
	bres	0x50f3, #5
;	stm8s_beep_main.c: 398: ccprintf(_DEBUG_CMD_A_, ("beep toggle....(0x%x)\r\n",BEEP->CSR));		
	ld	a, 0x50f3
	clrw	x
	ld	xl, a
	pushw	x
	push	#<(__str_18+0)
	push	#((__str_18+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	stm8s_beep_main.c: 400: if(UCOM_LED1_GPIO->IDR & UCOM_LED1_PIN)
	ld	a, 0x5010
	ld	xl, a
;	stm8s_beep_main.c: 402: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
	ld	a, 0x500f
;	stm8s_beep_main.c: 400: if(UCOM_LED1_GPIO->IDR & UCOM_LED1_PIN)
	srlw	x
	jrnc	00130$
;	stm8s_beep_main.c: 402: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
	and	a, #0xfe
	ld	0x500f, a
	jra	00131$
00130$:
;	stm8s_beep_main.c: 406: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR | UCOM_LED1_PIN;
	or	a, #0x01
	ld	0x500f, a
00131$:
;	stm8s_beep_main.c: 409: if(gbDelayData==0) gbDelayData = 10;
	ld	a, _gbDelayData+0
	jrne	00133$
	mov	_gbDelayData+0, #0x0a
00133$:
;	stm8s_beep_main.c: 410: gwMibMiliSec = gbDelayData;
	clrw	x
	ld	a, _gbDelayData+0
	ld	xl, a
	ldw	_gwMibMiliSec+0, x
;	stm8s_beep_main.c: 411: ccprintf(_DEBUG_CMD_A_, ("beep delay [%d]msec\r\n",gbDelayData));		
	clrw	x
	ld	a, _gbDelayData+0
	ld	xl, a
	pushw	x
	push	#<(__str_19+0)
	push	#((__str_19+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	stm8s_beep_main.c: 412: ccprintf(_DEBUG_CMD_A_, ("stop gpio key push : [%d]\r\n",(UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)));		
	ld	a, 0x5006
	and	a, #0x20
	clrw	x
	ld	xl, a
	pushw	x
	push	#<(__str_20+0)
	push	#((__str_20+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	stm8s_beep_main.c: 413: do {
00144$:
;	stm8s_beep_main.c: 414: if(gwMibMiliSec==0)
	ldw	x, _gwMibMiliSec+0
	jrne	00138$
;	stm8s_beep_main.c: 416: gwMibMiliSec = gbDelayData;
	clrw	x
	ld	a, _gbDelayData+0
	ld	xl, a
	ldw	_gwMibMiliSec+0, x
;	stm8s_beep_main.c: 417: if(UCOM_BEEP_GPIO->IDR & UCOM_BEEP_PIN)
	ld	a, 0x5010
	ld	xl, a
;	stm8s_beep_main.c: 402: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
	ld	a, 0x500f
;	stm8s_beep_main.c: 417: if(UCOM_BEEP_GPIO->IDR & UCOM_BEEP_PIN)
	push	a
	ld	a, xl
	bcp	a, #0x10
	pop	a
	jreq	00135$
;	stm8s_beep_main.c: 419: UCOM_BEEP_GPIO->ODR = UCOM_BEEP_GPIO->ODR & ~UCOM_BEEP_PIN;
	and	a, #0xef
	ld	0x500f, a
	jra	00138$
00135$:
;	stm8s_beep_main.c: 423: UCOM_BEEP_GPIO->ODR = UCOM_BEEP_GPIO->ODR | UCOM_BEEP_PIN;
	or	a, #0x10
	ld	0x500f, a
00138$:
;	stm8s_beep_main.c: 426: if(UCOM_LED1_GPIO->IDR & UCOM_LED1_PIN)
	ld	a, 0x5010
	ld	xl, a
;	stm8s_beep_main.c: 402: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
	ld	a, 0x500f
;	stm8s_beep_main.c: 426: if(UCOM_LED1_GPIO->IDR & UCOM_LED1_PIN)
	srlw	x
	jrnc	00140$
;	stm8s_beep_main.c: 428: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
	and	a, #0xfe
	ld	0x500f, a
	jra	00141$
00140$:
;	stm8s_beep_main.c: 432: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR | UCOM_LED1_PIN;
	or	a, #0x01
	ld	0x500f, a
00141$:
;	stm8s_beep_main.c: 434: if((UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)==0)
	btjt	0x5006, #5, 00144$
;	stm8s_beep_main.c: 436: ccprintf(_DEBUG_CMD_A_, ("gpio key on [%d]\r\n",(UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)));		
	ld	a, 0x5006
	and	a, #0x20
	clrw	x
	ld	xl, a
	pushw	x
	push	#<(__str_21+0)
	push	#((__str_21+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	stm8s_beep_main.c: 437: break;
	jp	00186$
;	stm8s_beep_main.c: 443: } while(1);
00167$:
;	stm8s_beep_main.c: 448: else if (!strcmp(argv[1], "remap")) // _CMD_MY_READ_
	ldw	x, (0x0c, sp)
	ldw	x, (x)
	push	#<(___str_22+0)
	push	#((___str_22+0) >> 8)
	call	_strcmp
	tnzw	x
	jreq	00395$
	jp	00164$
00395$:
;	stm8s_beep_main.c: 450: if (!strcmp(argv[2], "set"))
	ldw	x, (0x0f, sp)
	ldw	x, (x)
	push	#<(___str_23+0)
	push	#((___str_23+0) >> 8)
	call	_strcmp
	ldw	(0x12, sp), x
	jrne	00155$
;	stm8s_beep_main.c: 453: if(FLASH_ReadByte(OPT2_REG)!=AFR7_BIT) 
	push	#0x03
	push	#0x48
	clrw	x
	pushw	x
	call	_FLASH_ReadByte
	cp	a, #0x80
	jreq	00148$
;	stm8s_beep_main.c: 455: FLASH_Unlock(FLASH_MEMTYPE_DATA); 
	ld	a, #0xf7
	call	_FLASH_Unlock
;	stm8s_beep_main.c: 457: FLASH_ProgramOptionByte(OPT2_REG,AFR7_BIT); 
	ld	a, #0x80
	ldw	x, #0x4803
	call	_FLASH_ProgramOptionByte
00148$:
;	stm8s_beep_main.c: 459: vbData=FLASH_ReadOptionByte(OPT2_REG); 
	ldw	x, #0x4803
	call	_FLASH_ReadOptionByte
	ld	a, xl
	ld	(0x05, sp), a
	jra	00156$
00155$:
;	stm8s_beep_main.c: 461: else if (!strcmp(argv[2], "reset"))
	ldw	x, (0x0f, sp)
	ldw	x, (x)
	push	#<(___str_24+0)
	push	#((___str_24+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00152$
;	stm8s_beep_main.c: 464: if(FLASH_ReadByte(OPT2_REG)!=0x00) 
	push	#0x03
	push	#0x48
	clrw	x
	pushw	x
	call	_FLASH_ReadByte
	tnz	a
	jreq	00150$
;	stm8s_beep_main.c: 466: FLASH_Unlock(FLASH_MEMTYPE_DATA); 
	ld	a, #0xf7
	call	_FLASH_Unlock
;	stm8s_beep_main.c: 468: FLASH_ProgramOptionByte(OPT2_REG,0x00); 
	clr	a
	ldw	x, #0x4803
	call	_FLASH_ProgramOptionByte
00150$:
;	stm8s_beep_main.c: 470: vbData=FLASH_ReadOptionByte(OPT2_REG); 
	ldw	x, #0x4803
	call	_FLASH_ReadOptionByte
	ld	a, xl
	ld	(0x05, sp), a
	jra	00156$
00152$:
;	stm8s_beep_main.c: 474: ccprintf(_DEBUG_CMD_A_, ("beep init....error !!!\r\n"));		
	push	#<(__str_25+0)
	push	#((__str_25+0) >> 8)
	call	_mib_printf
	addw	sp, #2
00156$:
;	stm8s_beep_main.c: 477: ccprintf(_DEBUG_CMD_A_, ("beep init....(0x%02X)\r\n",vbData));		
	clrw	x
	ld	a, (0x05, sp)
	ld	xl, a
	pushw	x
	push	#<(__str_26+0)
	push	#((__str_26+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	stm8s_beep_main.c: 478: ccprintf(_DEBUG_CMD_A_, ("beep AFR7....(0x%x)\r\n",rd_ADDR8(OPT2_REG)));		
	ld	a, 0x4803
	clrw	x
	ld	xl, a
	pushw	x
	push	#<(__str_27+0)
	push	#((__str_27+0) >> 8)
	call	_mib_printf
	addw	sp, #4
	jra	00186$
00164$:
;	stm8s_beep_main.c: 483: else if (!strcmp(argv[1], "init")) // _CMD_MY_READ_
	ldw	x, (0x0c, sp)
	ldw	x, (x)
	push	#<(___str_28+0)
	push	#((___str_28+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00161$
;	stm8s_beep_main.c: 485: GPIO_Configuration();		
	call	_GPIO_Configuration
	jra	00186$
00161$:
;	stm8s_beep_main.c: 490: else if (!strcmp(argv[1], "help")) // _CMD_MY_READ_
	ldw	x, (0x0c, sp)
	ldw	x, (x)
	push	#<(___str_29+0)
	push	#((___str_29+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00158$
;	stm8s_beep_main.c: 493: "beep init // gpio init\r\n"\
	ldw	x, #(___str_30+0)
	call	_MibWriteDebugString
	jra	00186$
00158$:
;	stm8s_beep_main.c: 506: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0a, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_beep_main.c: 507: return FALSE;
	clrw	x
;	stm8s_beep_main.c: 509: return TRUE;
	.byte 0xc5
00186$:
	clrw	x
	incw	x
00187$:
;	stm8s_beep_main.c: 510: }
	ldw	y, (20, sp)
	addw	sp, #25
	jp	(y)
;	stm8s_beep_main.c: 534: void GPIO_Configuration(void)
;	-----------------------------------------
;	 function GPIO_Configuration
;	-----------------------------------------
_GPIO_Configuration:
;	stm8s_beep_main.c: 549: UCOM_LED1_GPIO->DDR |= (UCOM_LED1_PIN); /* Set Output mode */
	bset	0x5011, #0
;	stm8s_beep_main.c: 550: UCOM_LED1_GPIO->CR1 |= (UCOM_LED1_PIN);	/* Pull-Up or Push-Pull */
	bset	0x5012, #0
;	stm8s_beep_main.c: 551: UCOM_LED1_GPIO->CR2 |= (UCOM_LED1_PIN);	/* Output speed up to 10 MHz */
	bset	0x5013, #0
;	stm8s_beep_main.c: 552: UCOM_LED1_GPIO->ODR &= ~(UCOM_LED1_PIN); // low... 
	bres	0x500f, #0
;	stm8s_beep_main.c: 557: UCOM_KEY1_GPIO->DDR &= ~(UCOM_KEY1_PIN);  /* Set input mode */
	bres	0x5007, #5
;	stm8s_beep_main.c: 558: UCOM_KEY1_GPIO->CR1 |= (UCOM_KEY1_PIN);	 /* Pull-Up or Push-Pull */
	bset	0x5008, #5
;	stm8s_beep_main.c: 559: UCOM_KEY1_GPIO->CR2 &= ~(UCOM_KEY1_PIN); /*  External interrupt disabled */
	bres	0x5009, #5
;	stm8s_beep_main.c: 567: UCOM_BEEP_GPIO->DDR |= (UCOM_BEEP_PIN); /* Set Output mode */
	bset	0x5011, #4
;	stm8s_beep_main.c: 568: UCOM_BEEP_GPIO->CR1 |= (UCOM_BEEP_PIN);	/* Pull-Up or Push-Pull */
	bset	0x5012, #4
;	stm8s_beep_main.c: 569: UCOM_BEEP_GPIO->CR2 |= (UCOM_BEEP_PIN);	/* Output speed up to 10 MHz */
	bset	0x5013, #4
;	stm8s_beep_main.c: 570: UCOM_BEEP_GPIO->ODR &= ~(UCOM_BEEP_PIN); // low... 
	bres	0x500f, #4
;	stm8s_beep_main.c: 572: }
	ret
;	stm8s_beep_main.c: 576: void calConfigBEEP_test(uint16_t vwFreq) // msec... 
;	-----------------------------------------
;	 function calConfigBEEP_test
;	-----------------------------------------
_calConfigBEEP_test:
	sub	sp, #7
	exgw	x, y
;	stm8s_beep_main.c: 579: uint8_t vbBEEPDIV = 0;
	clr	(0x05, sp)
;	stm8s_beep_main.c: 580: uint32_t vdwData = vwFreq;
	ldw	(0x03, sp), y
	clrw	x
	ldw	(0x01, sp), x
;	stm8s_beep_main.c: 583: if(vwFreq<500)
	ldw	(0x06, sp), y
	ldw	x, y
	cpw	x, #0x01f4
	jrnc	00111$
;	stm8s_beep_main.c: 586: vbBEEPSEL = 0xFF;
	ld	a, #0xff
	ld	(0x06, sp), a
	jp	00112$
00111$:
;	stm8s_beep_main.c: 588: else if(vwFreq<1000)
	ldw	x, (0x06, sp)
	cpw	x, #0x03e8
	jrnc	00108$
;	stm8s_beep_main.c: 590: vbBEEPSEL = 0x00; // f / (8 * div) khz
	clr	(0x06, sp)
;	stm8s_beep_main.c: 591: vdwDiv = (128000 / 8) / vdwData;
	pushw	y
	ldw	x, (0x05, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	push	#0x80
	push	#0x3e
	clrw	x
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x04, sp), y
	ld	a, xl
	popw	y
;	stm8s_beep_main.c: 592: vbBEEPDIV =  vdwDiv - 2;
	sub	a, #0x02
	ld	(0x05, sp), a
;	stm8s_beep_main.c: 593: vdwDataLast = (128000 / 8) / vdwDiv;
	jra	00112$
00108$:
;	stm8s_beep_main.c: 595: else if(vwFreq<2000)
	ldw	x, (0x06, sp)
	cpw	x, #0x07d0
	jrnc	00105$
;	stm8s_beep_main.c: 597: vbBEEPSEL = 0x01; // f / (4 * div) khz
	ld	a, #0x01
	ld	(0x06, sp), a
;	stm8s_beep_main.c: 598: vdwDiv = (128000 / 4) / vdwData;
	pushw	y
	ldw	x, (0x05, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	push	#0x00
	push	#0x7d
	clrw	x
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x04, sp), y
	ld	a, xl
	popw	y
;	stm8s_beep_main.c: 599: vbBEEPDIV =  vdwDiv - 2;
	sub	a, #0x02
	ld	(0x05, sp), a
;	stm8s_beep_main.c: 600: vdwDataLast = (128000 / 8) / vdwDiv;
	jra	00112$
00105$:
;	stm8s_beep_main.c: 602: else if(vwFreq<32000)
	ldw	x, (0x06, sp)
	cpw	x, #0x7d00
	jrnc	00102$
;	stm8s_beep_main.c: 604: vbBEEPSEL = 0x02; // f / (2 * div) khz
	ld	a, #0x02
	ld	(0x06, sp), a
;	stm8s_beep_main.c: 605: vdwDiv = (128000 / 2) / vdwData;
	pushw	y
	ldw	x, (0x05, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	push	#0x00
	push	#0xfa
	clrw	x
	pushw	x
	call	__divulong
	addw	sp, #8
	rlwa	x
	ld	(0x06, sp), a
	rrwa	x
	ldw	(0x04, sp), y
	ld	a, xl
	popw	y
;	stm8s_beep_main.c: 606: vbBEEPDIV =  vdwDiv - 2;
	sub	a, #0x02
	ld	(0x05, sp), a
;	stm8s_beep_main.c: 607: vdwDataLast = (128000 / 8) / vdwDiv;
	jra	00112$
00102$:
;	stm8s_beep_main.c: 612: vbBEEPSEL = 0xFF;
	ld	a, #0xff
	ld	(0x06, sp), a
00112$:
;	stm8s_beep_main.c: 614: if(vbBEEPSEL!=0xFF)
	ld	a, (0x06, sp)
	inc	a
	jreq	00114$
;	stm8s_beep_main.c: 616: ccprintf(_DEBUG_CMD_A_, ("beep init [%d : SEL(%d) : DIV(%d)] Hz\r\n",vwFreq,vbBEEPSEL,vbBEEPDIV));		
	clrw	x
	ld	a, (0x05, sp)
	ld	xl, a
	ld	a, (0x06, sp)
	ld	(0x04, sp), a
	clr	(0x03, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	pushw	y
	push	#<(__str_31+0)
	push	#((__str_31+0) >> 8)
	call	_mib_printf
	addw	sp, #8
;	stm8s_beep_main.c: 619: BEEP->CSR  = BEEP_CSR_BEEPDIV;
	mov	0x50f3+0, #0x1f
;	stm8s_beep_main.c: 621: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
	ld	a, 0x50f3
	and	a, #0xe0
	ld	0x50f3, a
;	stm8s_beep_main.c: 622: BEEP->CSR |= (vbBEEPDIV & BEEP_CSR_BEEPDIV);
	ld	a, 0x50f3
	ld	(0x07, sp), a
	ld	a, (0x05, sp)
	and	a, #0x1f
	or	a, (0x07, sp)
	ld	0x50f3, a
;	stm8s_beep_main.c: 626: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
	ld	a, 0x50f3
	and	a, #0x3f
	ld	0x50f3, a
;	stm8s_beep_main.c: 627: BEEP->CSR |= (uint8_t)((vbBEEPSEL&0x03)<<6);
	ld	a, 0x50f3
	ld	(0x07, sp), a
	ld	a, (0x06, sp)
	and	a, #0x03
	swap	a
	and	a, #0xf0
	sll	a
	sll	a
	or	a, (0x07, sp)
	ld	0x50f3, a
	jra	00116$
00114$:
;	stm8s_beep_main.c: 632: BEEP->CSR  = BEEP_CSR_BEEPDIV;
	mov	0x50f3+0, #0x1f
;	stm8s_beep_main.c: 633: ccprintf(_DEBUG_CMD_A_, ("beep init error... [%d] Hz\r\n",vwFreq));		
	pushw	y
	push	#<(__str_32+0)
	push	#((__str_32+0) >> 8)
	call	_mib_printf
	addw	sp, #4
00116$:
;	stm8s_beep_main.c: 635: }
	addw	sp, #7
	ret
;	stm8s_beep_main.c: 645: void Delay(u16 nCount)
;	-----------------------------------------
;	 function Delay
;	-----------------------------------------
_Delay:
;	stm8s_beep_main.c: 648: while (nCount != 0)
00101$:
	tnzw	x
	jrne	00117$
	ret
00117$:
;	stm8s_beep_main.c: 650: nCount--;
	decw	x
	jra	00101$
;	stm8s_beep_main.c: 652: }
	ret
	.area CODE
	.area CONST
	.area CONST
__str_0:
	.ascii "INFO:+cmd_beep..."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_1:
	.ascii "INFO:-cmd_beep..."
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
	.ascii "freq"
	.db 0x00
	.area CODE
	.area CONST
__str_8:
	.ascii "beep freq : [%d] Hz"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_9:
	.ascii "enable"
	.db 0x00
	.area CODE
	.area CONST
__str_10:
	.ascii "beep enable....(0x%x)"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_11:
	.ascii "disable"
	.db 0x00
	.area CODE
	.area CONST
__str_12:
	.ascii "beep disable....(0x%x)"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_13:
	.ascii "start"
	.db 0x00
	.area CODE
	.area CONST
__str_14:
	.ascii "beep freq : [%d]Hz"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_15:
	.ascii "beep delay : [%d]msec"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_16:
	.ascii "toggle"
	.db 0x00
	.area CODE
	.area CONST
__str_17:
	.ascii "beep toggle : [%d] msec"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_18:
	.ascii "beep toggle....(0x%x)"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_19:
	.ascii "beep delay [%d]msec"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_20:
	.ascii "stop gpio key push : [%d]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_21:
	.ascii "gpio key on [%d]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_22:
	.ascii "remap"
	.db 0x00
	.area CODE
	.area CONST
___str_23:
	.ascii "set"
	.db 0x00
	.area CODE
	.area CONST
___str_24:
	.ascii "reset"
	.db 0x00
	.area CODE
	.area CONST
__str_25:
	.ascii "beep init....error !!!"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_26:
	.ascii "beep init....(0x%02X)"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_27:
	.ascii "beep AFR7....(0x%x)"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_28:
	.ascii "init"
	.db 0x00
	.area CODE
	.area CONST
___str_29:
	.ascii "help"
	.db 0x00
	.area CODE
	.area CONST
___str_30:
	.ascii "beep help...."
	.db 0x09
	.db 0x0d
	.db 0x0a
	.ascii "beep init // gpio init"
	.db 0x0d
	.db 0x0a
	.ascii "beep remap set // beep pin remap"
	.db 0x0d
	.db 0x0a
	.ascii "beep freq 1000 // 1000Hz pulse generator.."
	.db 0x0d
	.db 0x0a
	.ascii "beep enable"
	.db 0x0d
	.db 0x0a
	.ascii "beep disable"
	.db 0x0d
	.db 0x0a
	.ascii "beep remap  reset // reset"
	.db 0x0d
	.db 0x0a
	.ascii "ex2)"
	.db 0x0d
	.db 0x0a
	.ascii "beep start  4000  200// 4KHz freq 200 msec delay"
	.db 0x0d
	.db 0x0a
	.ascii "beep toggle 1000 /// 500msec per on/off, gpio beep pin test."
	.ascii ".."
	.db 0x0d
	.db 0x0a
	.ascii "// gpio beep pin toggle... per 1000 msec.."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_31:
	.ascii "beep init [%d : SEL(%d) : DIV(%d)] Hz"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_32:
	.ascii "beep init error... [%d] Hz"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_33:
	.ascii "beep"
	.db 0x00
	.area CODE
	.area CONST
___str_34:
	.ascii "  beep {write} [addr] [data]  "
	.db 0x0d
	.db 0x0a
	.ascii "  beep {read} [addr] "
	.db 0x0d
	.db 0x0a
	.ascii "  beep {init} "
	.db 0x0d
	.db 0x0a
	.ascii "  beep {remap} {set/reset}"
	.db 0x0d
	.db 0x0a
	.ascii "  beep {freq} [data:(?)Hz] "
	.db 0x0d
	.db 0x0a
	.ascii "  beep {enable} "
	.db 0x0d
	.db 0x0a
	.ascii "  beep {disable} "
	.db 0x0d
	.db 0x0a
	.ascii "  beep {start} [data:(?)Hz] [delay:(?)msec] 0:continous"
	.db 0x0d
	.db 0x0a
	.ascii "  beep {toggle} [data:(?)msec] GPIO toggle"
	.db 0x0d
	.db 0x0a
	.ascii "  beep {help}  beep help."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area INITIALIZER
__xinit__gbDelayData:
	.db #0x00	; 0
__xinit__cmdTbl_only:
	.dw ___str_33
	.dw _DoBEEP
	.dw ___str_34
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.area CABS (ABS)
