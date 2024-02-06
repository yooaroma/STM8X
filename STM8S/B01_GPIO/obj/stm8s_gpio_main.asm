;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_gpio_main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cmd_test_init_before_irq_enable
	.globl _cmd_test
	.globl _cmd_gpio
	.globl _HexToInt
	.globl _mib_printf
	.globl _MibWriteDebugString
	.globl ___memcpy
	.globl _strcmp
	.globl _GPIO_WriteReverse
	.globl _GPIO_Init
	.globl _GPIO_DeInit
	.globl _GPIO_Configuration
	.globl _Toggle
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
;	stm8s_gpio_main.c: 83: void cmd_gpio(void)
;	-----------------------------------------
;	 function cmd_gpio
;	-----------------------------------------
_cmd_gpio:
	sub	sp, #10
;	stm8s_gpio_main.c: 89: for (cptr = cmdTbl;; cptr++) 
	ldw	x, #(_cmdTbl+0)
	ldw	(0x01, sp), x
	clrw	x
	ldw	(0x07, sp), x
	ldw	(0x05, sp), x
	ldw	y, (0x01, sp)
	ldw	(0x09, sp), y
00106$:
;	stm8s_gpio_main.c: 91: if(cptr->cmd==0)
	ldw	x, (0x09, sp)
	ldw	x, (x)
	ldw	(0x03, sp), x
	jrne	00102$
;	stm8s_gpio_main.c: 93: ccprintf(1,("INFO:+cmd_gpio...\r\n"));
	push	#<(__str_0+0)
	push	#((__str_0+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_gpio_main.c: 94: memcpy((void *)&(cptr->cmd),(void *)&(cmdTbl_only[0].cmd),sizeof(CMD_MY));
	ldw	x, #_cmdTbl_only+0
	ldw	y, (0x01, sp)
	push	#0x06
	push	#0x00
	pushw	x
	ldw	x, y
	call	___memcpy
;	stm8s_gpio_main.c: 95: break;
	jra	00105$
00102$:
;	stm8s_gpio_main.c: 97: index++;
	ldw	x, (0x07, sp)
	incw	x
	ldw	(0x07, sp), x
	jrne	00126$
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x05, sp), x
00126$:
;	stm8s_gpio_main.c: 98: if(index>MAX_COMMANDS)
	ldw	x, #0x0006
	cpw	x, (0x07, sp)
	clr	a
	sbc	a, (0x06, sp)
	clr	a
	sbc	a, (0x05, sp)
	jrnc	00107$
;	stm8s_gpio_main.c: 100: ccprintf(1,("INFO:-cmd_gpio...\r\n"));
	push	#<(__str_1+0)
	push	#((__str_1+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_gpio_main.c: 101: return;
	jra	00108$
00107$:
;	stm8s_gpio_main.c: 89: for (cptr = cmdTbl;; cptr++) 
	ldw	x, (0x09, sp)
	addw	x, #0x0006
	ldw	(0x09, sp), x
	ldw	(0x01, sp), x
	jra	00106$
00105$:
;	stm8s_gpio_main.c: 104: return;
00108$:
;	stm8s_gpio_main.c: 105: }
	addw	sp, #10
	ret
;	stm8s_gpio_main.c: 110: void cmd_test(void)
;	-----------------------------------------
;	 function cmd_test
;	-----------------------------------------
_cmd_test:
;	stm8s_gpio_main.c: 112: cmd_gpio();
;	stm8s_gpio_main.c: 113: }
	jp	_cmd_gpio
;	stm8s_gpio_main.c: 119: void cmd_test_init_before_irq_enable(void)
;	-----------------------------------------
;	 function cmd_test_init_before_irq_enable
;	-----------------------------------------
_cmd_test_init_before_irq_enable:
;	stm8s_gpio_main.c: 122: }
	ret
;	stm8s_gpio_main.c: 133: static int DoGPIO(CMD_MY *cptr, int argc, char **argv)
;	-----------------------------------------
;	 function DoGPIO
;	-----------------------------------------
_DoGPIO:
	sub	sp, #14
;	stm8s_gpio_main.c: 135: uint16_t vwAddr = 0;
	clr	(0x02, sp)
	clr	(0x01, sp)
;	stm8s_gpio_main.c: 136: uint8_t vbData = 0;
	clr	(0x03, sp)
;	stm8s_gpio_main.c: 140: MibWriteDebugString(cptr->usage);
	addw	x, #0x0004
	ldw	(0x0d, sp), x
;	stm8s_gpio_main.c: 138: if (argc < 2)
	ldw	x, (0x11, sp)
	cpw	x, #0x0002
	jrsge	00102$
;	stm8s_gpio_main.c: 140: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0d, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_gpio_main.c: 141: return FALSE;
	clrw	x
	jp	00187$
00102$:
;	stm8s_gpio_main.c: 146: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
	ldw	x, (0x13, sp)
	incw	x
	incw	x
	ldw	(0x05, sp), x
	ldw	x, (x)
	push	#<(___str_2+0)
	push	#((___str_2+0) >> 8)
	call	_strcmp
	exgw	x, y
;	stm8s_gpio_main.c: 148: if (argc < 4)
	ldw	x, (0x11, sp)
	cpw	x, #0x0004
	jrslt	00415$
	clr	(0x07, sp)
	jra	00416$
00415$:
	ld	a, #0x01
	ld	(0x07, sp), a
00416$:
;	stm8s_gpio_main.c: 153: if (!HexToInt(argv[2], &vwAddr, 16))
	ldw	x, (0x13, sp)
	addw	x, #0x0004
	ldw	(0x08, sp), x
;	stm8s_gpio_main.c: 158: if (!HexToInt(argv[3], &vbData, 8))
	ldw	x, (0x13, sp)
	addw	x, #0x0006
	ldw	(0x0b, sp), x
;	stm8s_gpio_main.c: 146: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
	tnzw	y
	jrne	00185$
;	stm8s_gpio_main.c: 148: if (argc < 4)
	tnz	(0x07, sp)
	jreq	00104$
;	stm8s_gpio_main.c: 150: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0d, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_gpio_main.c: 151: return FALSE;
	clrw	x
	jp	00187$
00104$:
;	stm8s_gpio_main.c: 153: if (!HexToInt(argv[2], &vwAddr, 16))
	ldw	x, sp
	incw	x
	exgw	x, y
	ldw	x, (0x08, sp)
	ldw	x, (x)
	push	#0x10
	push	#0x00
	pushw	y
	call	_HexToInt
	tnzw	x
	jrne	00106$
;	stm8s_gpio_main.c: 155: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_gpio_main.c: 156: return FALSE;
	clrw	x
	jp	00187$
00106$:
;	stm8s_gpio_main.c: 158: if (!HexToInt(argv[3], &vbData, 8))
	ldw	x, sp
	addw	x, #3
	exgw	x, y
	ldw	x, (0x0b, sp)
	ldw	x, (x)
	push	#0x08
	push	#0x00
	pushw	y
	call	_HexToInt
	tnzw	x
	jrne	00108$
;	stm8s_gpio_main.c: 160: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_gpio_main.c: 161: return FALSE;
	clrw	x
	jp	00187$
00108$:
;	stm8s_gpio_main.c: 163: wr_ADDR8(vwAddr, vbData);
	ldw	x, (0x01, sp)
	ld	a, (0x03, sp)
	ld	(x), a
;	stm8s_gpio_main.c: 164: ccprintf(_DEBUG_CMD_A_,("wr_ADDR8 : 0x%04x[0x%02x]\r\n", vwAddr,vbData));
	clrw	x
	ld	a, (0x03, sp)
	ld	xl, a
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	push	#<(__str_4+0)
	push	#((__str_4+0) >> 8)
	call	_mib_printf
	addw	sp, #6
	jp	00186$
00185$:
;	stm8s_gpio_main.c: 169: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
	ldw	x, (0x05, sp)
	ldw	x, (x)
	push	#<(___str_5+0)
	push	#((___str_5+0) >> 8)
	call	_strcmp
	exgw	x, y
;	stm8s_gpio_main.c: 171: if (argc < 3)
	ldw	x, (0x11, sp)
	cpw	x, #0x0003
	jrslt	00421$
	clr	(0x0a, sp)
	jra	00422$
00421$:
	ld	a, #0x01
	ld	(0x0a, sp), a
00422$:
;	stm8s_gpio_main.c: 169: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
	tnzw	y
	jrne	00182$
;	stm8s_gpio_main.c: 171: if (argc < 3)
	tnz	(0x0a, sp)
	jreq	00110$
;	stm8s_gpio_main.c: 173: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0d, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_gpio_main.c: 174: return FALSE;
	clrw	x
	jp	00187$
00110$:
;	stm8s_gpio_main.c: 176: if (!HexToInt(argv[2], &vwAddr, 16))
	ldw	x, sp
	incw	x
	exgw	x, y
	ldw	x, (0x08, sp)
	ldw	x, (x)
	push	#0x10
	push	#0x00
	pushw	y
	call	_HexToInt
	tnzw	x
	jrne	00112$
;	stm8s_gpio_main.c: 178: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_gpio_main.c: 179: return FALSE;
	clrw	x
	jp	00187$
00112$:
;	stm8s_gpio_main.c: 182: vbData = rd_ADDR8(vwAddr);
	ldw	x, (0x01, sp)
	ld	a, (x)
	ld	(0x03, sp), a
;	stm8s_gpio_main.c: 184: ccprintf(_DEBUG_CMD_A_,("rd_ADDR8 : 0x%04x[0x%02x]\r\n", vwAddr,vbData));
	clrw	x
	ld	xl, a
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	push	#<(__str_6+0)
	push	#((__str_6+0) >> 8)
	call	_mib_printf
	addw	sp, #6
	jp	00186$
00182$:
;	stm8s_gpio_main.c: 189: else if (!strcmp(argv[1], "in")) // _CMD_MY_READ_
	ldw	x, (0x05, sp)
	ldw	x, (x)
	push	#<(___str_7+0)
	push	#((___str_7+0) >> 8)
	call	_strcmp
	tnzw	x
	jreq	00426$
	jp	00179$
00426$:
;	stm8s_gpio_main.c: 191: char vbPort = *(char *)(argv[2]); // argv[2][0]
	ldw	x, (0x08, sp)
	ldw	x, (x)
	ld	a, (x)
	ld	(0x0a, sp), a
;	stm8s_gpio_main.c: 192: char vbNum = *(char *)(argv[3]);
	ldw	x, (0x0b, sp)
	ldw	x, (x)
	ld	a, (x)
	ld	(0x09, sp), a
;	stm8s_gpio_main.c: 194: GPIO_TypeDef* GPIOx=GPIOA;
	ldw	x, #0x5000
	ldw	(0x0b, sp), x
;	stm8s_gpio_main.c: 195: if (argc < 4)
	tnz	(0x07, sp)
	jreq	00114$
;	stm8s_gpio_main.c: 197: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0d, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_gpio_main.c: 198: return FALSE;
	clrw	x
	jp	00187$
00114$:
;	stm8s_gpio_main.c: 200: if((vbPort>='a')&&(vbPort<='g'))
	ld	a, (0x0a, sp)
	cp	a, #0x61
	jrnc	00428$
	jp	00186$
00428$:
	ld	a, (0x0a, sp)
	cp	a, #0x67
	jrule	00429$
	jp	00186$
00429$:
;	stm8s_gpio_main.c: 202: switch(vbPort)
	ld	a, (0x0a, sp)
	cp	a, #0x61
	jreq	00115$
	ld	a, (0x0a, sp)
	cp	a, #0x62
	jreq	00116$
	ld	a, (0x0a, sp)
	cp	a, #0x63
	jreq	00117$
	ld	a, (0x0a, sp)
	cp	a, #0x64
	jreq	00118$
	ld	a, (0x0a, sp)
	cp	a, #0x65
	jreq	00119$
	ld	a, (0x0a, sp)
	cp	a, #0x66
	jreq	00120$
	ld	a, (0x0a, sp)
	cp	a, #0x67
	jreq	00121$
	jra	00123$
;	stm8s_gpio_main.c: 204: case 'a': GPIOx = GPIOA; break;
00115$:
	ldw	x, #0x5000
	ldw	(0x0b, sp), x
	jra	00123$
;	stm8s_gpio_main.c: 205: case 'b': GPIOx = GPIOB; break;
00116$:
	ldw	x, #0x5005
	ldw	(0x0b, sp), x
	jra	00123$
;	stm8s_gpio_main.c: 206: case 'c': GPIOx = GPIOC; break;
00117$:
	ldw	x, #0x500a
	ldw	(0x0b, sp), x
	jra	00123$
;	stm8s_gpio_main.c: 207: case 'd': GPIOx = GPIOD; break;
00118$:
	ldw	x, #0x500f
	ldw	(0x0b, sp), x
	jra	00123$
;	stm8s_gpio_main.c: 208: case 'e': GPIOx = GPIOE; break;
00119$:
	ldw	x, #0x5014
	ldw	(0x0b, sp), x
	jra	00123$
;	stm8s_gpio_main.c: 209: case 'f': GPIOx = GPIOF; break;
00120$:
	ldw	x, #0x5019
	ldw	(0x0b, sp), x
	jra	00123$
;	stm8s_gpio_main.c: 210: case 'g': GPIOx = GPIOG; break;
00121$:
	ldw	x, #0x501e
	ldw	(0x0b, sp), x
;	stm8s_gpio_main.c: 214: }
00123$:
;	stm8s_gpio_main.c: 215: if((vbNum>='0')&&(vbNum<='7'))
	ld	a, (0x09, sp)
	cp	a, #0x30
	jrnc	00451$
	jp	00186$
00451$:
	ld	a, (0x09, sp)
	cp	a, #0x37
	jrule	00452$
	jp	00186$
00452$:
;	stm8s_gpio_main.c: 217: vbNum &= 0x07;
	ld	a, (0x09, sp)
	and	a, #0x07
	ld	(0x0e, sp), a
;	stm8s_gpio_main.c: 218: GPIO_Init(GPIOx,vbNum,GPIO_MODE_IN_FL_NO_IT);
	push	#0x00
	ld	a, (0x0f, sp)
	ldw	x, (0x0c, sp)
	call	_GPIO_Init
;	stm8s_gpio_main.c: 219: vbBit = GPIOx->IDR >> vbNum;
	ldw	x, (0x0b, sp)
	ld	a, (0x1, x)
	push	a
	ld	a, (0x0f, sp)
	jreq	00454$
00453$:
	srl	(1, sp)
	dec	a
	jrne	00453$
00454$:
	pop	a
;	stm8s_gpio_main.c: 220: vbBit &= 1;
	and	a, #0x01
;	stm8s_gpio_main.c: 221: ccprintf(_DEBUG_CMD_A_,("gpio in : port[%c] num[%d] bit[%d]\r\n", vbPort,vbNum,vbBit));
	clrw	x
	ld	xl, a
	clrw	y
	ld	a, (0x0e, sp)
	ld	yl, a
	ld	a, (0x0a, sp)
	ld	(0x0e, sp), a
	clr	(0x0d, sp)
	pushw	x
	pushw	y
	ldw	x, (0x11, sp)
	pushw	x
	push	#<(__str_8+0)
	push	#((__str_8+0) >> 8)
	call	_mib_printf
	addw	sp, #8
	jp	00186$
00179$:
;	stm8s_gpio_main.c: 228: else if (!strcmp(argv[1], "out")) // _CMD_MY_READ_
	ldw	x, (0x05, sp)
	ldw	x, (x)
	push	#<(___str_9+0)
	push	#((___str_9+0) >> 8)
	call	_strcmp
	tnzw	x
	jreq	00455$
	jp	00176$
00455$:
;	stm8s_gpio_main.c: 230: char vbPort = *(char *)(argv[2]); // argv[2][0]
	ldw	x, (0x08, sp)
	ldw	x, (x)
	ld	a, (x)
	ld	(0x04, sp), a
;	stm8s_gpio_main.c: 231: char vbNum = *(char *)(argv[3]);
	ldw	x, (0x0b, sp)
	ldw	x, (x)
	ld	a, (x)
	ld	(0x05, sp), a
;	stm8s_gpio_main.c: 232: char vbBit = *(char *)(argv[4]);
	ldw	x, (0x13, sp)
	ldw	x, (0x8, x)
	ld	a, (x)
	ld	(0x06, sp), a
;	stm8s_gpio_main.c: 233: GPIO_TypeDef* GPIOx=GPIOA;
	ldw	x, #0x5000
	ldw	(0x07, sp), x
;	stm8s_gpio_main.c: 234: if (argc < 5)
	ldw	x, (0x11, sp)
	cpw	x, #0x0005
	jrsge	00131$
;	stm8s_gpio_main.c: 236: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0d, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_gpio_main.c: 237: return FALSE;
	clrw	x
	jp	00187$
00131$:
;	stm8s_gpio_main.c: 239: ccprintf(_DEBUG_CMD_A_,("gpio in : port[%c] num[%c] bit[%c]\r\n", vbPort,vbNum,vbBit));
	ld	a, (0x06, sp)
	ld	(0x0a, sp), a
	clr	(0x09, sp)
	ld	a, (0x05, sp)
	ld	(0x0c, sp), a
	clr	(0x0b, sp)
	ld	a, (0x04, sp)
	ld	(0x0e, sp), a
	clr	(0x0d, sp)
	ldw	x, (0x09, sp)
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x11, sp)
	pushw	x
	push	#<(__str_10+0)
	push	#((__str_10+0) >> 8)
	call	_mib_printf
	addw	sp, #8
;	stm8s_gpio_main.c: 240: if((vbPort>='a')&&(vbPort<='g'))
	ld	a, (0x04, sp)
	cp	a, #0x61
	jrnc	00457$
	jp	00186$
00457$:
	ld	a, (0x04, sp)
	cp	a, #0x67
	jrule	00458$
	jp	00186$
00458$:
;	stm8s_gpio_main.c: 242: switch(vbPort)
	ld	a, (0x04, sp)
	cp	a, #0x61
	jreq	00132$
	ld	a, (0x04, sp)
	cp	a, #0x62
	jreq	00133$
	ld	a, (0x04, sp)
	cp	a, #0x63
	jreq	00134$
	ld	a, (0x04, sp)
	cp	a, #0x64
	jreq	00135$
	ld	a, (0x04, sp)
	cp	a, #0x65
	jreq	00136$
	ld	a, (0x04, sp)
	cp	a, #0x66
	jreq	00137$
	ld	a, (0x04, sp)
	cp	a, #0x67
	jreq	00138$
	jra	00140$
;	stm8s_gpio_main.c: 244: case 'a': GPIOx = GPIOA; break;
00132$:
	ldw	x, #0x5000
	ldw	(0x07, sp), x
	jra	00140$
;	stm8s_gpio_main.c: 245: case 'b': GPIOx = GPIOB; break;
00133$:
	ldw	x, #0x5005
	ldw	(0x07, sp), x
	jra	00140$
;	stm8s_gpio_main.c: 246: case 'c': GPIOx = GPIOC; break;
00134$:
	ldw	x, #0x500a
	ldw	(0x07, sp), x
	jra	00140$
;	stm8s_gpio_main.c: 247: case 'd': GPIOx = GPIOD; break;
00135$:
	ldw	x, #0x500f
	ldw	(0x07, sp), x
	jra	00140$
;	stm8s_gpio_main.c: 248: case 'e': GPIOx = GPIOE; break;
00136$:
	ldw	x, #0x5014
	ldw	(0x07, sp), x
	jra	00140$
;	stm8s_gpio_main.c: 249: case 'f': GPIOx = GPIOF; break;
00137$:
	ldw	x, #0x5019
	ldw	(0x07, sp), x
	jra	00140$
;	stm8s_gpio_main.c: 250: case 'g': GPIOx = GPIOG; break;
00138$:
	ldw	x, #0x501e
	ldw	(0x07, sp), x
;	stm8s_gpio_main.c: 254: }
00140$:
;	stm8s_gpio_main.c: 255: if((vbNum>='0')&&(vbNum<='7'))
	ld	a, (0x05, sp)
	cp	a, #0x30
	jrnc	00480$
	jp	00186$
00480$:
	ld	a, (0x05, sp)
	cp	a, #0x37
	jrule	00481$
	jp	00186$
00481$:
;	stm8s_gpio_main.c: 257: vbNum &= 0x07;
	ld	a, (0x05, sp)
	and	a, #0x07
	ld	xl, a
;	stm8s_gpio_main.c: 258: if((vbBit>='0')&&(vbBit<='1'))
	ld	a, (0x06, sp)
	cp	a, #0x30
	jrnc	00482$
	jp	00186$
00482$:
	ld	a, (0x06, sp)
	cp	a, #0x31
	jrule	00483$
	jp	00186$
00483$:
;	stm8s_gpio_main.c: 260: vbBit &= 0x01;
	ld	a, (0x06, sp)
	and	a, #0x01
	ld	(0x0e, sp), a
;	stm8s_gpio_main.c: 261: vbNum = 1 << vbNum;
	ld	a, #0x01
	ld	(0x0c, sp), a
	ld	a, xl
	tnz	a
	jreq	00485$
00484$:
	sll	(0x0c, sp)
	dec	a
	jrne	00484$
00485$:
;	stm8s_gpio_main.c: 262: GPIO_Init(GPIOx,vbNum,GPIO_MODE_OUT_PP_LOW_FAST);
	push	#0xe0
	ld	a, (0x0d, sp)
	ldw	x, (0x08, sp)
	call	_GPIO_Init
;	stm8s_gpio_main.c: 265: GPIOx->ODR |= vbNum;
	ldw	x, (0x07, sp)
	ld	a, (x)
	ld	(0x0d, sp), a
;	stm8s_gpio_main.c: 263: if(vbBit==1)
	ld	a, (0x0e, sp)
	dec	a
	jrne	00142$
;	stm8s_gpio_main.c: 265: GPIOx->ODR |= vbNum;
	ld	a, (0x0d, sp)
	or	a, (0x0c, sp)
	ldw	x, (0x07, sp)
	ld	(x), a
	jp	00186$
00142$:
;	stm8s_gpio_main.c: 269: GPIOx->ODR &= ~vbNum;
	ld	a, (0x0c, sp)
	cpl	a
	and	a, (0x0d, sp)
	ldw	x, (0x07, sp)
	ld	(x), a
	jp	00186$
00176$:
;	stm8s_gpio_main.c: 278: else if (!strcmp(argv[1], "led")) // _CMD_MY_READ_
	ldw	x, (0x05, sp)
	ldw	x, (x)
	push	#<(___str_11+0)
	push	#((___str_11+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00173$
;	stm8s_gpio_main.c: 280: if (argc < 3)
	tnz	(0x0a, sp)
	jreq	00154$
;	stm8s_gpio_main.c: 282: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0d, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_gpio_main.c: 283: return FALSE;
	clrw	x
	jp	00187$
00154$:
;	stm8s_gpio_main.c: 285: if (!HexToInt(argv[2], &vbData, 8))
	ldw	x, sp
	addw	x, #3
	ldw	y, (0x08, sp)
	ldw	y, (y)
	push	#0x08
	push	#0x00
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00156$
;	stm8s_gpio_main.c: 287: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_gpio_main.c: 288: return FALSE;
	clrw	x
	jp	00187$
00156$:
;	stm8s_gpio_main.c: 292: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
	ld	a, 0x500f
;	stm8s_gpio_main.c: 290: if(vbData)
	tnz	(0x03, sp)
	jreq	00158$
;	stm8s_gpio_main.c: 292: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
	and	a, #0xfe
	ld	0x500f, a
	jra	00159$
00158$:
;	stm8s_gpio_main.c: 296: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR | UCOM_LED1_PIN;
	or	a, #0x01
	ld	0x500f, a
00159$:
;	stm8s_gpio_main.c: 298: ccprintf(_DEBUG_CMD_A_, ("gpio led [%d]\r\n",(vbData)));		
	clrw	x
	ld	a, (0x03, sp)
	ld	xl, a
	pushw	x
	push	#<(__str_12+0)
	push	#((__str_12+0) >> 8)
	call	_mib_printf
	addw	sp, #4
	jra	00186$
00173$:
;	stm8s_gpio_main.c: 303: else if (!strcmp(argv[1], "key")) // _CMD_MY_READ_
	ldw	x, (0x05, sp)
	ldw	x, (x)
	push	#<(___str_13+0)
	push	#((___str_13+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00170$
;	stm8s_gpio_main.c: 305: if((UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)==0)
	ld	a, 0x5006
	ld	(0x0e, sp), a
	ld	a, 0x5006
;	stm8s_gpio_main.c: 307: ccprintf(_DEBUG_CMD_A_, ("gpio key on [%d]\r\n",(UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)));		
	and	a, #0x20
	clrw	x
	ld	xl, a
;	stm8s_gpio_main.c: 305: if((UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)==0)
	ld	a, (0x0e, sp)
	bcp	a, #0x20
	jrne	00161$
;	stm8s_gpio_main.c: 307: ccprintf(_DEBUG_CMD_A_, ("gpio key on [%d]\r\n",(UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)));		
	pushw	x
	push	#<(__str_14+0)
	push	#((__str_14+0) >> 8)
	call	_mib_printf
	addw	sp, #4
	jra	00186$
00161$:
;	stm8s_gpio_main.c: 311: ccprintf(_DEBUG_CMD_A_, ("gpio key off [%d]\r\n",(UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)));		
	pushw	x
	push	#<(__str_15+0)
	push	#((__str_15+0) >> 8)
	call	_mib_printf
	addw	sp, #4
	jra	00186$
00170$:
;	stm8s_gpio_main.c: 317: else if (!strcmp(argv[1], "init")) // _CMD_MY_READ_
	ldw	x, (0x05, sp)
	ldw	x, (x)
	push	#<(___str_16+0)
	push	#((___str_16+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00167$
;	stm8s_gpio_main.c: 319: ccprintf(_DEBUG_CMD_A_, ("gpio init....GPIO_Configuration()\r\n"));		
	push	#<(__str_17+0)
	push	#((__str_17+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_gpio_main.c: 321: GPIO_Configuration();
	call	_GPIO_Configuration
	jra	00186$
00167$:
;	stm8s_gpio_main.c: 327: else if (!strcmp(argv[1], "help")) // _CMD_MY_READ_
	ldw	x, (0x05, sp)
	ldw	x, (x)
	push	#<(___str_18+0)
	push	#((___str_18+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00164$
;	stm8s_gpio_main.c: 329: ccprintf(_DEBUG_CMD_A_, ("gpio help....argc[%x:%d]\r\n",argc,argc));		
	ldw	x, (0x11, sp)
	pushw	x
	ldw	x, (0x13, sp)
	pushw	x
	push	#<(__str_19+0)
	push	#((__str_19+0) >> 8)
	call	_mib_printf
	addw	sp, #6
	jra	00186$
00164$:
;	stm8s_gpio_main.c: 333: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0d, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_gpio_main.c: 334: return FALSE;
	clrw	x
;	stm8s_gpio_main.c: 336: return TRUE;
	.byte 0xc5
00186$:
	clrw	x
	incw	x
00187$:
;	stm8s_gpio_main.c: 337: }
	ldw	y, (15, sp)
	addw	sp, #20
	jp	(y)
;	stm8s_gpio_main.c: 385: void GPIO_Configuration(void)
;	-----------------------------------------
;	 function GPIO_Configuration
;	-----------------------------------------
_GPIO_Configuration:
;	stm8s_gpio_main.c: 388: GPIO_DeInit(UCOM_LED1_GPIO);
	ldw	x, #0x500f
	call	_GPIO_DeInit
;	stm8s_gpio_main.c: 390: GPIO_Init(UCOM_LED1_GPIO, UCOM_LED1_PIN, UCOM_LED1_MODE);  
	push	#0xe0
	ld	a, #0x01
	ldw	x, #0x500f
	call	_GPIO_Init
;	stm8s_gpio_main.c: 391: GPIO_DeInit(UCOM_KEY1_GPIO);
	ldw	x, #0x5005
	call	_GPIO_DeInit
;	stm8s_gpio_main.c: 393: GPIO_Init(UCOM_KEY1_GPIO, UCOM_KEY1_PIN, UCOM_KEY1_MODE);
	push	#0x40
	ld	a, #0x20
	ldw	x, #0x5005
	call	_GPIO_Init
;	stm8s_gpio_main.c: 394: }
	ret
;	stm8s_gpio_main.c: 408: void Toggle(void)
;	-----------------------------------------
;	 function Toggle
;	-----------------------------------------
_Toggle:
;	stm8s_gpio_main.c: 410: GPIO_WriteReverse(UCOM_LED1_GPIO, UCOM_LED1_PIN);
	ld	a, #0x01
	ldw	x, #0x500f
;	stm8s_gpio_main.c: 411: }
	jp	_GPIO_WriteReverse
	.area CODE
	.area CONST
	.area CONST
__str_0:
	.ascii "INFO:+cmd_gpio..."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_1:
	.ascii "INFO:-cmd_gpio..."
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
	.ascii "wr_ADDR8 : 0x%04x[0x%02x]"
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
	.ascii "rd_ADDR8 : 0x%04x[0x%02x]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_7:
	.ascii "in"
	.db 0x00
	.area CODE
	.area CONST
__str_8:
	.ascii "gpio in : port[%c] num[%d] bit[%d]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_9:
	.ascii "out"
	.db 0x00
	.area CODE
	.area CONST
__str_10:
	.ascii "gpio in : port[%c] num[%c] bit[%c]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_11:
	.ascii "led"
	.db 0x00
	.area CODE
	.area CONST
__str_12:
	.ascii "gpio led [%d]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_13:
	.ascii "key"
	.db 0x00
	.area CODE
	.area CONST
__str_14:
	.ascii "gpio key on [%d]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_15:
	.ascii "gpio key off [%d]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_16:
	.ascii "init"
	.db 0x00
	.area CODE
	.area CONST
__str_17:
	.ascii "gpio init....GPIO_Configuration()"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_18:
	.ascii "help"
	.db 0x00
	.area CODE
	.area CONST
__str_19:
	.ascii "gpio help....argc[%x:%d]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_20:
	.ascii "gpio"
	.db 0x00
	.area CODE
	.area CONST
___str_21:
	.ascii "  gpio {init}  : gpio in/out reg init.."
	.db 0x0d
	.db 0x0a
	.ascii "  gpio {write} [addr] [data] : (addr 16bit) write (data 8bit"
	.ascii ")"
	.db 0x0d
	.db 0x0a
	.ascii "  gpio {read} [addr] : (addr 16bit) read (data 8bit)"
	.db 0x0d
	.db 0x0a
	.ascii "  gpio {led} [data:on/off(1/0)] : Write 0 or 1 to the PD0"
	.db 0x0d
	.db 0x0a
	.ascii "  gpio {key} : read to the PB5"
	.db 0x0d
	.db 0x0a
	.ascii "  gpio {in}  {port : a..g} {bit : 0..7} : Read for each bit "
	.ascii "0 to 7 from ports A GPIO to G GPIO. "
	.db 0x0d
	.db 0x0a
	.ascii "  gpio {out} {port : a..g} {bit : 0..7} {0/1} : It writes to"
	.ascii " each bit 0 to 7 from ports a to g."
	.db 0x0d
	.db 0x0a
	.ascii "  gpio {help}  gpio help."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area INITIALIZER
__xinit__cmdTbl_only:
	.dw ___str_20
	.dw _DoGPIO
	.dw ___str_21
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.area CABS (ABS)
