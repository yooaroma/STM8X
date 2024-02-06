;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_wwdg_main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cmd_test_init_before_irq_enable
	.globl _cmd_test
	.globl _cmd_wwdg
	.globl _calConfigWWDG
	.globl _DecToLong
	.globl _HexToInt
	.globl _mib_printf
	.globl _MibWriteDebugEmptyCheck
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
;	stm8s_wwdg_main.c: 79: void cmd_wwdg(void)
;	-----------------------------------------
;	 function cmd_wwdg
;	-----------------------------------------
_cmd_wwdg:
	sub	sp, #10
;	stm8s_wwdg_main.c: 85: for (cptr = cmdTbl;; cptr++) 
	ldw	x, #(_cmdTbl+0)
	ldw	(0x01, sp), x
	clrw	x
	ldw	(0x07, sp), x
	ldw	(0x05, sp), x
	ldw	y, (0x01, sp)
	ldw	(0x09, sp), y
00106$:
;	stm8s_wwdg_main.c: 87: if(cptr->cmd==0)
	ldw	x, (0x09, sp)
	ldw	x, (x)
	ldw	(0x03, sp), x
	jrne	00102$
;	stm8s_wwdg_main.c: 89: ccprintf(1,("INFO:+cmd_wwdg...\r\n"));
	push	#<(__str_0+0)
	push	#((__str_0+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_wwdg_main.c: 90: memcpy((void *)&(cptr->cmd),(void *)&(cmdTbl_only[0].cmd),sizeof(CMD_MY));
	ldw	x, #_cmdTbl_only+0
	ldw	y, (0x01, sp)
	push	#0x06
	push	#0x00
	pushw	x
	ldw	x, y
	call	___memcpy
;	stm8s_wwdg_main.c: 91: break;
	jra	00105$
00102$:
;	stm8s_wwdg_main.c: 93: index++;
	ldw	x, (0x07, sp)
	incw	x
	ldw	(0x07, sp), x
	jrne	00126$
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x05, sp), x
00126$:
;	stm8s_wwdg_main.c: 94: if(index>MAX_COMMANDS)
	ldw	x, #0x0006
	cpw	x, (0x07, sp)
	clr	a
	sbc	a, (0x06, sp)
	clr	a
	sbc	a, (0x05, sp)
	jrnc	00107$
;	stm8s_wwdg_main.c: 96: ccprintf(1,("INFO:-cmd_wwdg...\r\n"));
	push	#<(__str_1+0)
	push	#((__str_1+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_wwdg_main.c: 97: return;
	jra	00108$
00107$:
;	stm8s_wwdg_main.c: 85: for (cptr = cmdTbl;; cptr++) 
	ldw	x, (0x09, sp)
	addw	x, #0x0006
	ldw	(0x09, sp), x
	ldw	(0x01, sp), x
	jra	00106$
00105$:
;	stm8s_wwdg_main.c: 100: return;
00108$:
;	stm8s_wwdg_main.c: 101: }
	addw	sp, #10
	ret
;	stm8s_wwdg_main.c: 106: void cmd_test(void)
;	-----------------------------------------
;	 function cmd_test
;	-----------------------------------------
_cmd_test:
;	stm8s_wwdg_main.c: 108: cmd_wwdg();
;	stm8s_wwdg_main.c: 109: }
	jp	_cmd_wwdg
;	stm8s_wwdg_main.c: 115: void cmd_test_init_before_irq_enable(void)
;	-----------------------------------------
;	 function cmd_test_init_before_irq_enable
;	-----------------------------------------
_cmd_test_init_before_irq_enable:
;	stm8s_wwdg_main.c: 118: }
	ret
;	stm8s_wwdg_main.c: 129: static int DoWWDG(CMD_MY *cptr, int argc, char **argv)
;	-----------------------------------------
;	 function DoWWDG
;	-----------------------------------------
_DoWWDG:
	sub	sp, #14
	exgw	x, y
;	stm8s_wwdg_main.c: 131: uint32_t vdwAddr = 0;
	clrw	x
	ldw	(0x07, sp), x
	ldw	(0x05, sp), x
;	stm8s_wwdg_main.c: 132: uint8_t vbData = 0;
	clr	(0x09, sp)
;	stm8s_wwdg_main.c: 133: uint16_t vwData = 0;
	clrw	x
	ldw	(0x0a, sp), x
;	stm8s_wwdg_main.c: 137: MibWriteDebugString(cptr->usage);
	ldw	x, y
	addw	x, #0x0004
	ldw	(0x03, sp), x
;	stm8s_wwdg_main.c: 135: if (argc < 2)
	ldw	x, (0x11, sp)
	cpw	x, #0x0002
	jrsge	00102$
;	stm8s_wwdg_main.c: 137: MibWriteDebugString(cptr->usage);
	ldw	x, (0x03, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_wwdg_main.c: 138: return FALSE;
	clrw	x
	jp	00147$
00102$:
;	stm8s_wwdg_main.c: 143: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
	ldw	x, (0x13, sp)
	incw	x
	incw	x
	ldw	(0x01, sp), x
	ldw	x, (x)
	push	#<(___str_2+0)
	push	#((___str_2+0) >> 8)
	call	_strcmp
;	stm8s_wwdg_main.c: 150: if (!HexToInt(argv[2], &vdwAddr, 32))
	ldw	y, (0x13, sp)
	addw	y, #0x0004
	ldw	(0x0d, sp), y
;	stm8s_wwdg_main.c: 143: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
	tnzw	x
	jrne	00145$
;	stm8s_wwdg_main.c: 145: if (argc < 4)
	ldw	x, (0x11, sp)
	cpw	x, #0x0004
	jrsge	00104$
;	stm8s_wwdg_main.c: 147: MibWriteDebugString(cptr->usage);
	ldw	x, (0x03, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_wwdg_main.c: 148: return FALSE;
	clrw	x
	jp	00147$
00104$:
;	stm8s_wwdg_main.c: 150: if (!HexToInt(argv[2], &vdwAddr, 32))
	ldw	x, sp
	addw	x, #5
	ldw	y, (0x0d, sp)
	ldw	y, (y)
	push	#0x20
	push	#0x00
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00106$
;	stm8s_wwdg_main.c: 152: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_wwdg_main.c: 153: return FALSE;
	clrw	x
	jp	00147$
00106$:
;	stm8s_wwdg_main.c: 155: if (!HexToInt(argv[3], &vbData, 8))
	ldw	y, (0x13, sp)
	ldw	y, (0x6, y)
	push	#0x08
	push	#0x00
	ldw	x, sp
	addw	x, #11
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00108$
;	stm8s_wwdg_main.c: 157: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_wwdg_main.c: 158: return FALSE;
	clrw	x
	jp	00147$
00108$:
;	stm8s_wwdg_main.c: 160: wr_ADDR8(vdwAddr, vbData);
	ldw	x, (0x07, sp)
	ld	a, (0x09, sp)
	ld	(x), a
;	stm8s_wwdg_main.c: 161: ccprintf(_DEBUG_CMD_A_,("wr_ADDR8 : 0x%08lx[0x%02x]\r\n", vdwAddr,vbData));
	clrw	x
	ld	a, (0x09, sp)
	ld	xl, a
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	push	#<(__str_4+0)
	push	#((__str_4+0) >> 8)
	call	_mib_printf
	addw	sp, #8
	jp	00146$
00145$:
;	stm8s_wwdg_main.c: 166: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
	ldw	x, (0x01, sp)
	ldw	x, (x)
	push	#<(___str_5+0)
	push	#((___str_5+0) >> 8)
	call	_strcmp
	exgw	x, y
;	stm8s_wwdg_main.c: 168: if (argc < 3)
	ldw	x, (0x11, sp)
	cpw	x, #0x0003
	jrslt	00249$
	clr	a
	.byte 0xc5
00249$:
	ld	a, #0x01
00250$:
;	stm8s_wwdg_main.c: 166: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
	tnzw	y
	jrne	00142$
;	stm8s_wwdg_main.c: 168: if (argc < 3)
	tnz	a
	jreq	00110$
;	stm8s_wwdg_main.c: 170: MibWriteDebugString(cptr->usage);
	ldw	x, (0x03, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_wwdg_main.c: 171: return FALSE;
	clrw	x
	jp	00147$
00110$:
;	stm8s_wwdg_main.c: 173: if (!HexToInt(argv[2], &vdwAddr, 32))
	ldw	x, sp
	addw	x, #5
	ldw	y, (0x0d, sp)
	ldw	y, (y)
	push	#0x20
	push	#0x00
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00112$
;	stm8s_wwdg_main.c: 175: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_wwdg_main.c: 176: return FALSE;
	clrw	x
	jp	00147$
00112$:
;	stm8s_wwdg_main.c: 179: vbData = rd_ADDR8(vdwAddr);
	ldw	x, (0x07, sp)
	ld	a, (x)
	ld	(0x09, sp), a
;	stm8s_wwdg_main.c: 181: ccprintf(_DEBUG_CMD_A_,("rd_ADDR8 : 0x%08lx[0x%02x]\r\n", vdwAddr,vbData));
	clrw	x
	ld	xl, a
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	push	#<(__str_6+0)
	push	#((__str_6+0) >> 8)
	call	_mib_printf
	addw	sp, #8
	jp	00146$
00142$:
;	stm8s_wwdg_main.c: 186: else if (!strcmp(argv[1], "start")) // _CMD_MY_READ_
	ldw	x, (0x01, sp)
	ldw	x, (x)
	push	a
	push	#<(___str_7+0)
	push	#((___str_7+0) >> 8)
	call	_strcmp
	pop	a
	tnzw	x
	jreq	00254$
	jp	00139$
00254$:
;	stm8s_wwdg_main.c: 188: uint8_t vbIndex = 0;
	clr	(0x0c, sp)
;	stm8s_wwdg_main.c: 190: if (argc < 3)
	tnz	a
	jreq	00114$
;	stm8s_wwdg_main.c: 192: MibWriteDebugString(cptr->usage);
	ldw	x, (0x03, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_wwdg_main.c: 193: return FALSE;
	clrw	x
	jp	00147$
00114$:
;	stm8s_wwdg_main.c: 195: if (!DecToLong(argv[2], &vwData, 16))
	ldw	x, sp
	addw	x, #10
	ldw	y, (0x0d, sp)
	ldw	y, (y)
	push	#0x10
	push	#0x00
	pushw	x
	ldw	x, y
	call	_DecToLong
	tnzw	x
	jrne	00116$
;	stm8s_wwdg_main.c: 197: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_wwdg_main.c: 198: return FALSE;
	clrw	x
	jp	00147$
00116$:
;	stm8s_wwdg_main.c: 200: GPIO_Configuration();
	call	_GPIO_Configuration
;	stm8s_wwdg_main.c: 201: ccprintf(_DEBUG_CMD_A_, ("wwdg delay [%d] msec  fcpu : 16MHz delay (1 to 49)msec\r\n",(vwData)));		
	ldw	x, (0x0a, sp)
	pushw	x
	push	#<(__str_8+0)
	push	#((__str_8+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	stm8s_wwdg_main.c: 202: if(vwData<10) vwData = 10;
	ldw	x, (0x0a, sp)
	cpw	x, #0x000a
	jrnc	00120$
	ldw	x, #0x000a
	ldw	(0x0a, sp), x
	jra	00121$
00120$:
;	stm8s_wwdg_main.c: 203: else if(vwData>49) vwData = 49;
	cpw	x, #0x0031
	jrule	00121$
	ldw	x, #0x0031
	ldw	(0x0a, sp), x
00121$:
;	stm8s_wwdg_main.c: 204: vbDelayCR = (calConfigWWDG(vwData) & 0x3F) | 0xC0;
	ldw	x, (0x0a, sp)
	call	_calConfigWWDG
	ld	a, xl
	and	a, #0x3f
	or	a, #0xc0
	ld	(0x0d, sp), a
;	stm8s_wwdg_main.c: 205: gwMibMiliSec = 0; 
	clrw	x
	ldw	_gwMibMiliSec+0, x
;	stm8s_wwdg_main.c: 206: WWDG->WR = 0x7F;
	mov	0x50d2+0, #0x7f
;	stm8s_wwdg_main.c: 207: WWDG->CR = vbDelayCR; 
	ldw	x, #0x50d1
	ld	a, (0x0d, sp)
	ld	(x), a
;	stm8s_wwdg_main.c: 208: do {				
	clr	(0x0e, sp)
00129$:
;	stm8s_wwdg_main.c: 209: if(gwMibMiliSec==0)
	ldw	x, _gwMibMiliSec+0
	jrne	00126$
;	stm8s_wwdg_main.c: 211: vbIndex++;
	inc	(0x0e, sp)
	ld	a, (0x0e, sp)
	ld	(0x0c, sp), a
;	stm8s_wwdg_main.c: 212: if(vbIndex==100)
	ld	a, (0x0e, sp)
	cp	a, #0x64
	jrne	00123$
;	stm8s_wwdg_main.c: 214: WWDG->CR = 0xFF; // vbDelayCR; 
	mov	0x50d1+0, #0xff
;	stm8s_wwdg_main.c: 215: ccprintf(_DEBUG_CMD_A_, ("wwdg start....(%d)[%u:%d]\r\n",vbIndex,vwData,vwData));		
	clrw	x
	ld	a, (0x0e, sp)
	ld	xl, a
	ldw	y, (0x0a, sp)
	pushw	y
	ldw	y, (0x0c, sp)
	pushw	y
	pushw	x
	push	#<(__str_9+0)
	push	#((__str_9+0) >> 8)
	call	_mib_printf
	addw	sp, #8
;	stm8s_wwdg_main.c: 216: MibWriteDebugEmptyCheck();
	call	_MibWriteDebugEmptyCheck
;	stm8s_wwdg_main.c: 217: WWDG->CR = 0x0; 
	mov	0x50d1+0, #0x00
;	stm8s_wwdg_main.c: 218: break;
	jra	00146$
00123$:
;	stm8s_wwdg_main.c: 222: WWDG->CR = vbDelayCR; 
	ldw	x, #0x50d1
	ld	a, (0x0d, sp)
	ld	(x), a
;	stm8s_wwdg_main.c: 224: gwMibMiliSec = vwData-10; 
	ldw	x, (0x0a, sp)
	subw	x, #0x000a
	ldw	_gwMibMiliSec+0, x
;	stm8s_wwdg_main.c: 226: UCOM_LED1_GPIO->ODR ^= (uint8_t)UCOM_LED1_PIN;
	bcpl	0x500f, #0
00126$:
;	stm8s_wwdg_main.c: 228: if((UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)==0)
	btjt	0x5006, #5, 00129$
;	stm8s_wwdg_main.c: 230: WWDG->CR = 0xFF; // vbDelayCR; 
	mov	0x50d1+0, #0xff
;	stm8s_wwdg_main.c: 231: ccprintf(_DEBUG_CMD_A_, ("wwdg start....(%d)[%u:%d]\r\n",vbIndex,vwData,vwData));		
	clrw	x
	ld	a, (0x0c, sp)
	ld	xl, a
	ldw	y, (0x0a, sp)
	pushw	y
	ldw	y, (0x0c, sp)
	pushw	y
	pushw	x
	push	#<(__str_9+0)
	push	#((__str_9+0) >> 8)
	call	_mib_printf
	addw	sp, #8
;	stm8s_wwdg_main.c: 232: MibWriteDebugEmptyCheck();
	call	_MibWriteDebugEmptyCheck
;	stm8s_wwdg_main.c: 233: WWDG->CR = 0x0; 
	mov	0x50d1+0, #0x00
;	stm8s_wwdg_main.c: 234: break;
	jra	00146$
;	stm8s_wwdg_main.c: 236: } while(1);
00139$:
;	stm8s_wwdg_main.c: 242: else if (!strcmp(argv[1], "init")) // _CMD_MY_READ_
	ldw	x, (0x01, sp)
	ldw	x, (x)
	push	#<(___str_10+0)
	push	#((___str_10+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00136$
;	stm8s_wwdg_main.c: 244: GPIO_Configuration();
	call	_GPIO_Configuration
;	stm8s_wwdg_main.c: 246: ccprintf(_DEBUG_CMD_A_, ("wwdg init....()\r\n"));		
	push	#<(__str_11+0)
	push	#((__str_11+0) >> 8)
	call	_mib_printf
	addw	sp, #2
	jra	00146$
00136$:
;	stm8s_wwdg_main.c: 251: else if (!strcmp(argv[1], "help")) // _CMD_MY_READ_
	ldw	x, (0x01, sp)
	ldw	x, (x)
	push	#<(___str_12+0)
	push	#((___str_12+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00133$
;	stm8s_wwdg_main.c: 255: "wwdg init // gpio init\r\n"\
	ldw	x, #(___str_13+0)
	call	_MibWriteDebugString
	jra	00146$
00133$:
;	stm8s_wwdg_main.c: 261: MibWriteDebugString(cptr->usage);
	ldw	x, (0x03, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_wwdg_main.c: 262: return FALSE;
	clrw	x
;	stm8s_wwdg_main.c: 264: return TRUE;
	.byte 0xc5
00146$:
	clrw	x
	incw	x
00147$:
;	stm8s_wwdg_main.c: 265: }
	ldw	y, (15, sp)
	addw	sp, #20
	jp	(y)
;	stm8s_wwdg_main.c: 313: void GPIO_Configuration(void)
;	-----------------------------------------
;	 function GPIO_Configuration
;	-----------------------------------------
_GPIO_Configuration:
;	stm8s_wwdg_main.c: 328: UCOM_LED1_GPIO->DDR |= (UCOM_LED1_PIN); /* Set Output mode */
	bset	0x5011, #0
;	stm8s_wwdg_main.c: 329: UCOM_LED1_GPIO->CR1 |= (UCOM_LED1_PIN);	/* Pull-Up or Push-Pull */
	bset	0x5012, #0
;	stm8s_wwdg_main.c: 330: UCOM_LED1_GPIO->CR2 |= (UCOM_LED1_PIN);	/* Output speed up to 10 MHz */
	bset	0x5013, #0
;	stm8s_wwdg_main.c: 331: UCOM_LED1_GPIO->ODR &= ~(UCOM_LED1_PIN); // low... 
	bres	0x500f, #0
;	stm8s_wwdg_main.c: 336: UCOM_KEY1_GPIO->DDR &= ~(UCOM_KEY1_PIN);  /* Set input mode */
	bres	0x5007, #5
;	stm8s_wwdg_main.c: 337: UCOM_KEY1_GPIO->CR1 |= (UCOM_KEY1_PIN);	 /* Pull-Up or Push-Pull */
	bset	0x5008, #5
;	stm8s_wwdg_main.c: 338: UCOM_KEY1_GPIO->CR2 &= ~(UCOM_KEY1_PIN); /*  External interrupt disabled */
	bres	0x5009, #5
;	stm8s_wwdg_main.c: 340: }
	ret
	.area CODE
	.area CONST
	.area CONST
__str_0:
	.ascii "INFO:+cmd_wwdg..."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_1:
	.ascii "INFO:-cmd_wwdg..."
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
	.ascii "wwdg delay [%d] msec  fcpu : 16MHz delay (1 to 49)msec"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_9:
	.ascii "wwdg start....(%d)[%u:%d]"
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
	.ascii "wwdg init....()"
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
	.ascii "wwdg help...."
	.db 0x09
	.db 0x0d
	.db 0x0a
	.ascii "wwdg init // gpio init"
	.db 0x0d
	.db 0x0a
	.ascii "wwdg start 49 // It should refresh within 49 miliseconds.  "
	.db 0x0d
	.db 0x0a
	.ascii "// fcpu : 16MHz delay (1 to 49)msec"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_14:
	.ascii "wwdg"
	.db 0x00
	.area CODE
	.area CONST
___str_15:
	.ascii "  wwdg {init} "
	.db 0x0d
	.db 0x0a
	.ascii "  wwdg {write} [addr] [data]  "
	.db 0x0d
	.db 0x0a
	.ascii "  wwdg {read} [addr] "
	.db 0x0d
	.db 0x0a
	.ascii "  wwdg {start} [delay:msec] fcpu : 16MHz delay (1 to 49) "
	.db 0x0d
	.db 0x0a
	.ascii "  wwdg {help}  iwdg help."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area INITIALIZER
__xinit__cmdTbl_only:
	.dw ___str_14
	.dw _DoWWDG
	.dw ___str_15
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.area CABS (ABS)
