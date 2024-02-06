;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_tim1_main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cmd_test_init_before_irq_enable
	.globl _cmd_test
	.globl _cmd_tim1
	.globl _DecToLong
	.globl _HexToInt
	.globl _mib_printf
	.globl _MibWriteDebugString
	.globl ___memcpy
	.globl _strcmp
	.globl _TIM1_SetCompare4
	.globl _TIM1_SetCompare3
	.globl _TIM1_SetCompare2
	.globl _TIM1_SetCompare1
	.globl _TIM1_SelectOCxM
	.globl _TIM1_CCxNCmd
	.globl _TIM1_CCxCmd
	.globl _TIM1_OC4PolarityConfig
	.globl _TIM1_OC3NPolarityConfig
	.globl _TIM1_OC3PolarityConfig
	.globl _TIM1_OC2NPolarityConfig
	.globl _TIM1_OC2PolarityConfig
	.globl _TIM1_OC1NPolarityConfig
	.globl _TIM1_OC1PolarityConfig
	.globl _TIM1_OC4PreloadConfig
	.globl _TIM1_OC3PreloadConfig
	.globl _TIM1_OC2PreloadConfig
	.globl _TIM1_OC1PreloadConfig
	.globl _TIM1_ARRPreloadConfig
	.globl _TIM1_SelectOnePulseMode
	.globl _TIM1_CtrlPWMOutputs
	.globl _TIM1_Cmd
	.globl _TIM1_TimeBaseInit
	.globl _TIM1_DeInit
	.globl _FLASH_ProgramOptionByte
	.globl _FLASH_ReadOptionByte
	.globl _FLASH_ReadByte
	.globl _FLASH_Unlock
	.globl _irqTim1UpdOvf_CALLBACK
	.globl _irqTim1Cap_CALLBACK
	.globl _mmTim1Onepulse
	.globl _mmTim1PWM
	.globl _mmTim1CalPscrCntr
	.globl _mmTim1GpioInit
	.globl _mmRemapCH1N_CH2N_CH3N_ETR
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_gpbHelp_TIM1_TypeDef:
	.ds 2
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
;	stm8s_tim1_main.c: 115: void cmd_tim1(void)
;	-----------------------------------------
;	 function cmd_tim1
;	-----------------------------------------
_cmd_tim1:
	sub	sp, #10
;	stm8s_tim1_main.c: 121: for (cptr = cmdTbl;; cptr++)
	ldw	x, #(_cmdTbl+0)
	ldw	(0x01, sp), x
	clrw	x
	ldw	(0x07, sp), x
	ldw	(0x05, sp), x
	ldw	y, (0x01, sp)
	ldw	(0x09, sp), y
00106$:
;	stm8s_tim1_main.c: 123: if (cptr->cmd == 0)
	ldw	x, (0x09, sp)
	ldw	x, (x)
	ldw	(0x03, sp), x
	jrne	00102$
;	stm8s_tim1_main.c: 125: ccprintf(1, ("INFO:+cmd_tim1...\r\n"));
	push	#<(__str_0+0)
	push	#((__str_0+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_tim1_main.c: 126: memcpy((void *)&(cptr->cmd), (void *)&(cmdTbl_only[0].cmd), sizeof(CMD_MY));
	ldw	x, #_cmdTbl_only+0
	ldw	y, (0x01, sp)
	push	#0x06
	push	#0x00
	pushw	x
	ldw	x, y
	call	___memcpy
;	stm8s_tim1_main.c: 127: break;
	jra	00105$
00102$:
;	stm8s_tim1_main.c: 129: index++;
	ldw	x, (0x07, sp)
	incw	x
	ldw	(0x07, sp), x
	jrne	00126$
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x05, sp), x
00126$:
;	stm8s_tim1_main.c: 130: if (index > MAX_COMMANDS)
	ldw	x, #0x0006
	cpw	x, (0x07, sp)
	clr	a
	sbc	a, (0x06, sp)
	clr	a
	sbc	a, (0x05, sp)
	jrnc	00107$
;	stm8s_tim1_main.c: 132: ccprintf(1, ("INFO:-cmd_tim1...\r\n"));
	push	#<(__str_1+0)
	push	#((__str_1+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_tim1_main.c: 133: return;
	jra	00108$
00107$:
;	stm8s_tim1_main.c: 121: for (cptr = cmdTbl;; cptr++)
	ldw	x, (0x09, sp)
	addw	x, #0x0006
	ldw	(0x09, sp), x
	ldw	(0x01, sp), x
	jra	00106$
00105$:
;	stm8s_tim1_main.c: 136: return;
00108$:
;	stm8s_tim1_main.c: 137: }
	addw	sp, #10
	ret
;	stm8s_tim1_main.c: 142: void cmd_test(void)
;	-----------------------------------------
;	 function cmd_test
;	-----------------------------------------
_cmd_test:
;	stm8s_tim1_main.c: 144: cmd_tim1();
;	stm8s_tim1_main.c: 145: }
	jp	_cmd_tim1
;	stm8s_tim1_main.c: 151: void cmd_test_init_before_irq_enable(void)
;	-----------------------------------------
;	 function cmd_test_init_before_irq_enable
;	-----------------------------------------
_cmd_test_init_before_irq_enable:
;	stm8s_tim1_main.c: 154: }
	ret
;	stm8s_tim1_main.c: 165: static int DoTIM1(CMD_MY *cptr, int argc, char **argv)
;	-----------------------------------------
;	 function DoTIM1
;	-----------------------------------------
_DoTIM1:
	sub	sp, #26
	exgw	x, y
;	stm8s_tim1_main.c: 167: uint32_t vdwAddr = 0;
	clrw	x
	ldw	(0x07, sp), x
	ldw	(0x05, sp), x
;	stm8s_tim1_main.c: 168: uint8_t vbData = 0;
	clr	(0x09, sp)
;	stm8s_tim1_main.c: 171: MibWriteDebugString(cptr->usage);
	ldw	x, y
	addw	x, #0x0004
	ldw	(0x0f, sp), x
;	stm8s_tim1_main.c: 169: if (argc < 2)
	ldw	x, (0x1d, sp)
	cpw	x, #0x0002
	jrsge	00102$
;	stm8s_tim1_main.c: 171: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0f, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_tim1_main.c: 172: return FALSE;
	clrw	x
	jp	00194$
00102$:
;	stm8s_tim1_main.c: 177: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
	ldw	x, (0x1f, sp)
	incw	x
	incw	x
	ldw	(0x11, sp), x
	ldw	x, (x)
	push	#<(___str_2+0)
	push	#((___str_2+0) >> 8)
	call	_strcmp
	exgw	x, y
;	stm8s_tim1_main.c: 179: if (argc < 4)
	ldw	x, (0x1d, sp)
	cpw	x, #0x0004
	jrslt	00377$
	clr	(0x13, sp)
	jra	00378$
00377$:
	ld	a, #0x01
	ld	(0x13, sp), a
00378$:
;	stm8s_tim1_main.c: 184: if (!HexToInt(argv[2], &vdwAddr, 32))
	ldw	x, (0x1f, sp)
	addw	x, #0x0004
	ldw	(0x14, sp), x
;	stm8s_tim1_main.c: 189: if (!HexToInt(argv[3], &vbData, 8))
	ldw	x, (0x1f, sp)
	addw	x, #0x0006
	ldw	(0x16, sp), x
;	stm8s_tim1_main.c: 177: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
	tnzw	y
	jrne	00192$
;	stm8s_tim1_main.c: 179: if (argc < 4)
	tnz	(0x13, sp)
	jreq	00104$
;	stm8s_tim1_main.c: 181: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0f, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_tim1_main.c: 182: return FALSE;
	clrw	x
	jp	00194$
00104$:
;	stm8s_tim1_main.c: 184: if (!HexToInt(argv[2], &vdwAddr, 32))
	ldw	x, sp
	addw	x, #5
	exgw	x, y
	ldw	x, (0x14, sp)
	ldw	x, (x)
	push	#0x20
	push	#0x00
	pushw	y
	call	_HexToInt
	tnzw	x
	jrne	00106$
;	stm8s_tim1_main.c: 186: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_tim1_main.c: 187: return FALSE;
	clrw	x
	jp	00194$
00106$:
;	stm8s_tim1_main.c: 189: if (!HexToInt(argv[3], &vbData, 8))
	ldw	x, sp
	addw	x, #9
	exgw	x, y
	ldw	x, (0x16, sp)
	ldw	x, (x)
	push	#0x08
	push	#0x00
	pushw	y
	call	_HexToInt
	tnzw	x
	jrne	00108$
;	stm8s_tim1_main.c: 191: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_tim1_main.c: 192: return FALSE;
	clrw	x
	jp	00194$
00108$:
;	stm8s_tim1_main.c: 194: wr_ADDR8(vdwAddr, vbData);
	ldw	x, (0x07, sp)
	ld	a, (0x09, sp)
	ld	(x), a
;	stm8s_tim1_main.c: 195: ccprintf(_DEBUG_CMD_A_, ("wr_ADDR8 : 0x%08lx[0x%02x]\r\n", vdwAddr, vbData));
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
	jp	00193$
00192$:
;	stm8s_tim1_main.c: 200: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
	ldw	x, (0x11, sp)
	ldw	x, (x)
	push	#<(___str_5+0)
	push	#((___str_5+0) >> 8)
	call	_strcmp
	exgw	x, y
;	stm8s_tim1_main.c: 202: if (argc < 3)
	ldw	x, (0x1d, sp)
	cpw	x, #0x0003
	jrslt	00383$
	clr	(0x18, sp)
	jra	00384$
00383$:
	ld	a, #0x01
	ld	(0x18, sp), a
00384$:
;	stm8s_tim1_main.c: 200: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
	tnzw	y
	jrne	00189$
;	stm8s_tim1_main.c: 202: if (argc < 3)
	tnz	(0x18, sp)
	jreq	00110$
;	stm8s_tim1_main.c: 204: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0f, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_tim1_main.c: 205: return FALSE;
	clrw	x
	jp	00194$
00110$:
;	stm8s_tim1_main.c: 207: if (!HexToInt(argv[2], &vdwAddr, 32))
	ldw	x, sp
	addw	x, #5
	exgw	x, y
	ldw	x, (0x14, sp)
	ldw	x, (x)
	push	#0x20
	push	#0x00
	pushw	y
	call	_HexToInt
	tnzw	x
	jrne	00112$
;	stm8s_tim1_main.c: 209: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_tim1_main.c: 210: return FALSE;
	clrw	x
	jp	00194$
00112$:
;	stm8s_tim1_main.c: 213: vbData = rd_ADDR8(vdwAddr);
	ldw	x, (0x07, sp)
	ld	a, (x)
	ld	(0x09, sp), a
;	stm8s_tim1_main.c: 215: ccprintf(_DEBUG_CMD_A_, ("rd_ADDR8 : 0x%08lx[0x%02x]\r\n", vdwAddr, vbData));
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
	jp	00193$
00189$:
;	stm8s_tim1_main.c: 220: else if (!strcmp(argv[1], "onepulse"))
	ldw	x, (0x11, sp)
	ldw	x, (x)
	push	#<(___str_7+0)
	push	#((___str_7+0) >> 8)
	call	_strcmp
;	stm8s_tim1_main.c: 243: if (!DecToLong(argv[4], &vdwDataWidth, 32))
	ldw	y, (0x1f, sp)
	addw	y, #0x0008
	ldw	(0x19, sp), y
;	stm8s_tim1_main.c: 220: else if (!strcmp(argv[1], "onepulse"))
	tnzw	x
	jreq	00388$
	jp	00186$
00388$:
;	stm8s_tim1_main.c: 223: uint32_t vdwDataDelay = 0;
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
;	stm8s_tim1_main.c: 224: uint32_t vdwDataWidth = 0;
	clrw	x
	ldw	(0x0d, sp), x
	ldw	(0x0b, sp), x
;	stm8s_tim1_main.c: 225: if (argc < 5)
	ldw	x, (0x1d, sp)
	cpw	x, #0x0005
	jrsge	00114$
;	stm8s_tim1_main.c: 227: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0f, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_tim1_main.c: 228: return FALSE;
	clrw	x
	jp	00194$
00114$:
;	stm8s_tim1_main.c: 230: if (!strcmp(argv[2], "low"))
	ldw	x, (0x14, sp)
	ldw	x, (x)
	push	#<(___str_8+0)
	push	#((___str_8+0) >> 8)
	call	_strcmp
	ldw	(0x14, sp), x
	jrne	00116$
;	stm8s_tim1_main.c: 232: vbPulseState = 0;
	clr	(0x18, sp)
	jra	00117$
00116$:
;	stm8s_tim1_main.c: 236: vbPulseState = 1;
	ld	a, #0x01
	ld	(0x18, sp), a
00117$:
;	stm8s_tim1_main.c: 238: if (!DecToLong(argv[3], &vdwDataDelay, 32))
	ldw	x, sp
	incw	x
	exgw	x, y
	ldw	x, (0x16, sp)
	ldw	x, (x)
	push	#0x20
	push	#0x00
	pushw	y
	call	_DecToLong
	tnzw	x
	jrne	00119$
;	stm8s_tim1_main.c: 240: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_tim1_main.c: 241: return FALSE;
	clrw	x
	jp	00194$
00119$:
;	stm8s_tim1_main.c: 243: if (!DecToLong(argv[4], &vdwDataWidth, 32))
	ldw	x, sp
	addw	x, #11
	exgw	x, y
	ldw	x, (0x19, sp)
	ldw	x, (x)
	push	#0x20
	push	#0x00
	pushw	y
	call	_DecToLong
	tnzw	x
	jrne	00121$
;	stm8s_tim1_main.c: 245: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_tim1_main.c: 246: return FALSE;
	clrw	x
	jp	00194$
00121$:
;	stm8s_tim1_main.c: 248: mmTim1GpioInit();
	call	_mmTim1GpioInit
;	stm8s_tim1_main.c: 249: mmRemapCH1N_CH2N_CH3N_ETR();
	call	_mmRemapCH1N_CH2N_CH3N_ETR
;	stm8s_tim1_main.c: 250: mmTim1Onepulse(vbPulseState, vdwDataDelay, vdwDataWidth);
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	ld	a, (0x20, sp)
	call	_mmTim1Onepulse
	jp	00193$
00186$:
;	stm8s_tim1_main.c: 255: else if (!strcmp(argv[1], "pwm"))
	ldw	x, (0x11, sp)
	ldw	x, (x)
	push	#<(___str_9+0)
	push	#((___str_9+0) >> 8)
	call	_strcmp
	tnzw	x
	jreq	00393$
	jp	00183$
00393$:
;	stm8s_tim1_main.c: 257: uint32_t vdwDataPeriod = 0;
	clrw	x
	ldw	(0x0c, sp), x
	ldw	(0x0a, sp), x
;	stm8s_tim1_main.c: 258: uint8_t vbDataRatio = 0;
	clr	(0x0e, sp)
;	stm8s_tim1_main.c: 263: if (argc < 3)
	tnz	(0x18, sp)
	jreq	00123$
;	stm8s_tim1_main.c: 265: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0f, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_tim1_main.c: 266: return FALSE;
	clrw	x
	jp	00194$
00123$:
;	stm8s_tim1_main.c: 268: if(argc < 4)
	tnz	(0x13, sp)
	jreq	00152$
;	stm8s_tim1_main.c: 270: vbChannelNumber = 1; // ch1
;	stm8s_tim1_main.c: 271: vbPinUseFlag = 1; // Plus
	ld	a, #0x01
	ld	(0x19, sp), a
	ld	(0x1a, sp), a
;	stm8s_tim1_main.c: 272: vbLevelState = TIM1_OCPOLARITY_LOW;
	ld	a, #0x22
	ld	(0x18, sp), a
	jra	00153$
00152$:
;	stm8s_tim1_main.c: 276: if (argv[4][0]=='1')
	ldw	x, (0x19, sp)
	ldw	x, (x)
	ldw	(0x12, sp), x
	ld	a, (x)
	cp	a, #0x31
	jrne	00134$
;	stm8s_tim1_main.c: 278: vbChannelNumber = TIM1_CHANNEL_1;
	clr	(0x19, sp)
	jra	00135$
00134$:
;	stm8s_tim1_main.c: 280: else if (argv[4][0]=='2')
	cp	a, #0x32
	jrne	00131$
;	stm8s_tim1_main.c: 282: vbChannelNumber = TIM1_CHANNEL_2;
	ld	a, #0x01
	ld	(0x19, sp), a
	jra	00135$
00131$:
;	stm8s_tim1_main.c: 284: else if (argv[4][0]=='3')
	cp	a, #0x33
	jrne	00128$
;	stm8s_tim1_main.c: 286: vbChannelNumber = TIM1_CHANNEL_3;
	ld	a, #0x02
	ld	(0x19, sp), a
	jra	00135$
00128$:
;	stm8s_tim1_main.c: 288: else if (argv[4][0]=='4')
	cp	a, #0x34
	jrne	00125$
;	stm8s_tim1_main.c: 290: vbChannelNumber = TIM1_CHANNEL_4;
	ld	a, #0x03
	ld	(0x19, sp), a
;	stm8s_tim1_main.c: 294: vbChannelNumber = TIM1_CHANNEL_1;
	.byte 0xc5
00125$:
	clr	(0x19, sp)
00135$:
;	stm8s_tim1_main.c: 297: if (argv[4][1]=='p')
	ldw	x, (0x12, sp)
	ld	a, (0x1, x)
	cp	a, #0x70
	jrne	00143$
;	stm8s_tim1_main.c: 299: vbPinUseFlag = 1;
	ld	a, #0x01
	ld	(0x1a, sp), a
	jra	00144$
00143$:
;	stm8s_tim1_main.c: 301: else if (argv[4][1]=='n')
	cp	a, #0x6e
	jrne	00140$
;	stm8s_tim1_main.c: 303: vbPinUseFlag = 2;
	ld	a, #0x02
	ld	(0x1a, sp), a
	jra	00144$
00140$:
;	stm8s_tim1_main.c: 305: else if (argv[4][1]=='b')
	cp	a, #0x62
	jrne	00137$
;	stm8s_tim1_main.c: 307: vbPinUseFlag = 3;
	ld	a, #0x03
	ld	(0x1a, sp), a
	jra	00144$
00137$:
;	stm8s_tim1_main.c: 311: vbPinUseFlag = 1;
	ld	a, #0x01
	ld	(0x1a, sp), a
00144$:
;	stm8s_tim1_main.c: 314: if (argv[4][2]=='h')
	ldw	x, (0x12, sp)
	ld	a, (0x2, x)
	cp	a, #0x68
	jrne	00149$
;	stm8s_tim1_main.c: 316: vbLevelState = TIM1_OCPOLARITY_HIGH;
	clr	(0x18, sp)
	jra	00153$
00149$:
;	stm8s_tim1_main.c: 318: else if (argv[4][2]=='l')
	cp	a, #0x6c
	jrne	00146$
;	stm8s_tim1_main.c: 320: vbLevelState = TIM1_OCPOLARITY_LOW;
	ld	a, #0x22
	ld	(0x18, sp), a
	jra	00153$
00146$:
;	stm8s_tim1_main.c: 324: vbLevelState = TIM1_OCPOLARITY_LOW;
	ld	a, #0x22
	ld	(0x18, sp), a
00153$:
;	stm8s_tim1_main.c: 327: if (!DecToLong(argv[2], &vdwDataPeriod, 32))
	ldw	x, sp
	addw	x, #10
	ldw	y, (0x14, sp)
	ldw	y, (y)
	push	#0x20
	push	#0x00
	pushw	x
	ldw	x, y
	call	_DecToLong
	tnzw	x
	jrne	00155$
;	stm8s_tim1_main.c: 329: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_tim1_main.c: 330: return FALSE;
	clrw	x
	jp	00194$
00155$:
;	stm8s_tim1_main.c: 332: if (!DecToLong(argv[3], &vbDataRatio, 8))
	ldw	x, sp
	addw	x, #14
	ldw	y, (0x16, sp)
	ldw	y, (y)
	push	#0x08
	push	#0x00
	pushw	x
	ldw	x, y
	call	_DecToLong
	tnzw	x
	jrne	00157$
;	stm8s_tim1_main.c: 334: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_tim1_main.c: 335: return FALSE;
	clrw	x
	jp	00194$
00157$:
;	stm8s_tim1_main.c: 337: ccprintf(_DEBUG_CMD_A_, ("mmTim1 : vdwDataPeriod (0x%08lx) vbDataRatio (%d)\r\n", vdwDataPeriod, vbDataRatio));
	clrw	x
	ld	a, (0x0e, sp)
	ld	xl, a
	pushw	x
	ldw	x, (0x0e, sp)
	pushw	x
	ldw	x, (0x0e, sp)
	pushw	x
	push	#<(__str_10+0)
	push	#((__str_10+0) >> 8)
	call	_mib_printf
	addw	sp, #8
;	stm8s_tim1_main.c: 338: ccprintf(_DEBUG_CMD_A_, ("mmTim1 : vbChannelNumber (%d) vbPinUseFlag (%d) vbLevelState (%d)\r\n", vbChannelNumber, vbPinUseFlag, vbLevelState));
	clrw	x
	ld	a, (0x18, sp)
	ld	xl, a
	ld	a, (0x1a, sp)
	ld	(0x15, sp), a
	clr	(0x14, sp)
	ld	a, (0x19, sp)
	clr	(0x16, sp)
	pushw	x
	ldw	x, (0x16, sp)
	pushw	x
	push	a
	ld	a, (0x1b, sp)
	push	a
	push	#<(__str_11+0)
	push	#((__str_11+0) >> 8)
	call	_mib_printf
	addw	sp, #8
;	stm8s_tim1_main.c: 339: mmTim1GpioInit();
	call	_mmTim1GpioInit
;	stm8s_tim1_main.c: 340: mmRemapCH1N_CH2N_CH3N_ETR();
	call	_mmRemapCH1N_CH2N_CH3N_ETR
;	stm8s_tim1_main.c: 341: mmTim1PWM(vdwDataPeriod, vbDataRatio, vbChannelNumber, vbPinUseFlag,vbLevelState,0);
	push	#0x00
	ld	a, (0x19, sp)
	push	a
	ld	a, (0x1c, sp)
	push	a
	ld	a, (0x1c, sp)
	push	a
	ld	a, (0x12, sp)
	push	a
	ldw	x, (0x11, sp)
	pushw	x
	ldw	x, (0x11, sp)
	pushw	x
	call	_mmTim1PWM
	jp	00193$
00183$:
;	stm8s_tim1_main.c: 346: else if (!strcmp(argv[1], "remap")) // _CMD_MY_READ_
	ldw	x, (0x11, sp)
	ldw	x, (x)
	push	#<(___str_12+0)
	push	#((___str_12+0) >> 8)
	call	_strcmp
	tnzw	x
	jreq	00425$
	jp	00180$
00425$:
;	stm8s_tim1_main.c: 355: if (!strcmp(argv[2], "set"))
	ldw	x, (0x14, sp)
	ldw	x, (x)
	push	#<(___str_13+0)
	push	#((___str_13+0) >> 8)
	call	_strcmp
	ldw	(0x19, sp), x
	jrne	00166$
;	stm8s_tim1_main.c: 358: if(FLASH_ReadByte(OPT2_REG)!=AFR5_BIT) 
	push	#0x03
	push	#0x48
	clrw	x
	pushw	x
	call	_FLASH_ReadByte
	cp	a, #0x20
	jreq	00159$
;	stm8s_tim1_main.c: 360: FLASH_Unlock(FLASH_MEMTYPE_DATA); 
	ld	a, #0xf7
	call	_FLASH_Unlock
;	stm8s_tim1_main.c: 362: FLASH_ProgramOptionByte(OPT2_REG,AFR5_BIT); 
	ld	a, #0x20
	ldw	x, #0x4803
	call	_FLASH_ProgramOptionByte
00159$:
;	stm8s_tim1_main.c: 364: vbData=FLASH_ReadOptionByte(OPT2_REG); 
	ldw	x, #0x4803
	call	_FLASH_ReadOptionByte
	ld	a, xl
	ld	(0x09, sp), a
	jra	00167$
00166$:
;	stm8s_tim1_main.c: 366: else if (!strcmp(argv[2], "reset"))
	ldw	x, (0x14, sp)
	ldw	x, (x)
	push	#<(___str_14+0)
	push	#((___str_14+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00163$
;	stm8s_tim1_main.c: 369: if(FLASH_ReadByte(OPT2_REG)!=0x00) 
	push	#0x03
	push	#0x48
	clrw	x
	pushw	x
	call	_FLASH_ReadByte
	tnz	a
	jreq	00161$
;	stm8s_tim1_main.c: 371: FLASH_Unlock(FLASH_MEMTYPE_DATA); 
	ld	a, #0xf7
	call	_FLASH_Unlock
;	stm8s_tim1_main.c: 373: FLASH_ProgramOptionByte(OPT2_REG,0x00); 
	clr	a
	ldw	x, #0x4803
	call	_FLASH_ProgramOptionByte
00161$:
;	stm8s_tim1_main.c: 375: vbData=FLASH_ReadOptionByte(OPT2_REG); 
	ldw	x, #0x4803
	call	_FLASH_ReadOptionByte
	ld	a, xl
	ld	(0x09, sp), a
	jra	00167$
00163$:
;	stm8s_tim1_main.c: 379: ccprintf(_DEBUG_CMD_A_, ("tim1 init....error !!!\r\n"));		
	push	#<(__str_15+0)
	push	#((__str_15+0) >> 8)
	call	_mib_printf
	addw	sp, #2
00167$:
;	stm8s_tim1_main.c: 382: ccprintf(_DEBUG_CMD_A_, ("tim1 init....(0x%02X)\r\n",vbData));		
	clrw	x
	ld	a, (0x09, sp)
	ld	xl, a
	pushw	x
	push	#<(__str_16+0)
	push	#((__str_16+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	stm8s_tim1_main.c: 383: ccprintf(_DEBUG_CMD_A_, ("tim1 AFR5....(0x%x)\r\n",rd_ADDR8(OPT2_REG)));		
	ld	a, 0x4803
	clrw	x
	ld	xl, a
	pushw	x
	push	#<(__str_17+0)
	push	#((__str_17+0) >> 8)
	call	_mib_printf
	addw	sp, #4
	jp	00193$
00180$:
;	stm8s_tim1_main.c: 388: else if (!strcmp(argv[1], "init")) // _CMD_MY_READ_
	ldw	x, (0x11, sp)
	ldw	x, (x)
	push	#<(___str_18+0)
	push	#((___str_18+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00177$
;	stm8s_tim1_main.c: 390: mmTim1GpioInit();
	call	_mmTim1GpioInit
	jra	00193$
00177$:
;	stm8s_tim1_main.c: 395: else if (!strcmp(argv[1], "reset")) // _CMD_MY_READ_
	ldw	x, (0x11, sp)
	ldw	x, (x)
	push	#<(___str_14+0)
	push	#((___str_14+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00174$
;	stm8s_tim1_main.c: 397: TIM1_DeInit();
	call	_TIM1_DeInit
;	stm8s_tim1_main.c: 400: if(FLASH_ReadByte(OPT2_REG)!=0x00) 
	push	#0x03
	push	#0x48
	clrw	x
	pushw	x
	call	_FLASH_ReadByte
	tnz	a
	jreq	00169$
;	stm8s_tim1_main.c: 402: FLASH_Unlock(FLASH_MEMTYPE_DATA); 
	ld	a, #0xf7
	call	_FLASH_Unlock
;	stm8s_tim1_main.c: 404: FLASH_ProgramOptionByte(OPT2_REG,0x00); 
	clr	a
	ldw	x, #0x4803
	call	_FLASH_ProgramOptionByte
00169$:
;	stm8s_tim1_main.c: 406: vbData=FLASH_ReadOptionByte(OPT2_REG); 
	ldw	x, #0x4803
	call	_FLASH_ReadOptionByte
	ld	a, xl
	ld	(0x09, sp), a
;	stm8s_tim1_main.c: 407: ccprintf(_DEBUG_CMD_A_, ("tim1 reset....(0x%02X)\r\n",vbData));		
	clrw	x
	ld	xl, a
	pushw	x
	push	#<(__str_19+0)
	push	#((__str_19+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	stm8s_tim1_main.c: 408: ccprintf(_DEBUG_CMD_A_, ("tim1 AFR5....(0x%x)\r\n",rd_ADDR8(OPT2_REG)));		
	ld	a, 0x4803
	clrw	x
	ld	xl, a
	pushw	x
	push	#<(__str_17+0)
	push	#((__str_17+0) >> 8)
	call	_mib_printf
	addw	sp, #4
	jra	00193$
00174$:
;	stm8s_tim1_main.c: 414: else if (!strcmp(argv[1], "help")) // _CMD_MY_READ_
	ldw	x, (0x11, sp)
	ldw	x, (x)
	push	#<(___str_20+0)
	push	#((___str_20+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00171$
;	stm8s_tim1_main.c: 417: ccprintf(_DEBUG_CMD_A_, ("TIM1_BaseAddress : 0x%04x\r\n", TIM1_BaseAddress));
	push	#0x50
	push	#0x52
	push	#<(__str_21+0)
	push	#((__str_21+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	stm8s_tim1_main.c: 418: MibWriteDebugString((uint8_t *)gpbHelp_TIM1_TypeDef);
	ldw	x, _gpbHelp_TIM1_TypeDef+0
	call	_MibWriteDebugString
	jra	00193$
00171$:
;	stm8s_tim1_main.c: 422: MibWriteDebugString(cptr->usage);
	ldw	x, (0x0f, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_tim1_main.c: 423: return FALSE;
	clrw	x
;	stm8s_tim1_main.c: 425: return TRUE;
	.byte 0xc5
00193$:
	clrw	x
	incw	x
00194$:
;	stm8s_tim1_main.c: 426: }
	ldw	y, (27, sp)
	addw	sp, #32
	jp	(y)
;	stm8s_tim1_main.c: 437: void irqTim1UpdOvf_CALLBACK(void)
;	-----------------------------------------
;	 function irqTim1UpdOvf_CALLBACK
;	-----------------------------------------
_irqTim1UpdOvf_CALLBACK:
;	stm8s_tim1_main.c: 439: }
	ret
;	stm8s_tim1_main.c: 445: void irqTim1Cap_CALLBACK(void)
;	-----------------------------------------
;	 function irqTim1Cap_CALLBACK
;	-----------------------------------------
_irqTim1Cap_CALLBACK:
;	stm8s_tim1_main.c: 447: }
	ret
;	stm8s_tim1_main.c: 458: int mmTim1Onepulse(uint8_t vbPulseState, uint32_t vdwDataDelay, uint32_t vdwDataWidth)
;	-----------------------------------------
;	 function mmTim1Onepulse
;	-----------------------------------------
_mmTim1Onepulse:
	sub	sp, #12
	ld	(0x05, sp), a
;	stm8s_tim1_main.c: 464: UCOM_LED1_GPIO->ODR &= (uint8_t)(~(UCOM_LED1_PIN)); /* Output mode  Low level */
	bres	0x500f, #0
;	stm8s_tim1_main.c: 468: vdwPeriod = vdwDataDelay + vdwDataWidth;
	ldw	y, (0x11, sp)
	addw	y, (0x15, sp)
	ldw	x, (0x0f, sp)
	jrnc	00111$
	incw	x
00111$:
	addw	x, (0x13, sp)
	ldw	(0x08, sp), y
	ldw	(0x06, sp), x
;	stm8s_tim1_main.c: 469: vbDataRatio = (vdwDataWidth * 100) / vdwPeriod;
	ldw	x, (0x15, sp)
	pushw	x
	ldw	x, (0x15, sp)
	pushw	x
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x03, sp), x
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ld	a, xl
	ld	(0x0a, sp), a
;	stm8s_tim1_main.c: 475: if(vbPulseState)
	tnz	(0x05, sp)
	jreq	00102$
;	stm8s_tim1_main.c: 477: vbLevelState = TIM1_OCPOLARITY_HIGH;
	clr	(0x0b, sp)
	jra	00103$
00102$:
;	stm8s_tim1_main.c: 481: vbLevelState = TIM1_OCPOLARITY_LOW;
	ld	a, #0x22
	ld	(0x0b, sp), a
00103$:
;	stm8s_tim1_main.c: 483: vbPulseState = (vbPulseState<<1) | 0x1;
	ld	a, (0x05, sp)
	sll	a
	or	a, #0x01
	ld	(0x0c, sp), a
;	stm8s_tim1_main.c: 484: ccprintf(_DEBUG_CMD_A_, ("mmTim1Onepulse : vdwPeriod (0x%08lx) vbDataRatio (%d)\r\n", vdwPeriod, vbDataRatio));
	clrw	x
	ld	a, (0x0a, sp)
	ld	xl, a
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	push	#<(__str_22+0)
	push	#((__str_22+0) >> 8)
	call	_mib_printf
	addw	sp, #8
;	stm8s_tim1_main.c: 488: UCOM_LED1_GPIO->ODR |= (uint8_t)((UCOM_LED1_PIN)); /* Output mode  high level */
	bset	0x500f, #0
;	stm8s_tim1_main.c: 490: mmTim1PWM(vdwPeriod, vbDataRatio, vbChannelNumber, vbPinUseFlag,vbLevelState,vbPulseState);
	ld	a, (0x0c, sp)
	push	a
	ld	a, (0x0c, sp)
	push	a
	push	#0x03
	push	#0x00
	ld	a, (0x0e, sp)
	push	a
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	call	_mmTim1PWM
;	stm8s_tim1_main.c: 492: return 0;
	clrw	x
;	stm8s_tim1_main.c: 493: }
	ldw	y, (13, sp)
	addw	sp, #22
	jp	(y)
;	stm8s_tim1_main.c: 497: int mmTim1PWM(uint32_t vdwDataPeriod, uint8_t vbDataRatio, uint8_t vbChannelNumber, uint8_t vbPinUseFlag, uint8_t vbLevelState, uint8_t vbPulseState)
;	-----------------------------------------
;	 function mmTim1PWM
;	-----------------------------------------
_mmTim1PWM:
	sub	sp, #12
;	stm8s_tim1_main.c: 499: uint16_t vwPSCR = 0;
	clrw	x
	ldw	(0x01, sp), x
;	stm8s_tim1_main.c: 500: uint16_t vwCNTR = 0;
	clrw	x
	ldw	(0x03, sp), x
;	stm8s_tim1_main.c: 504: mmTim1CalPscrCntr(vdwDataPeriod, (uint16_t *)&vwPSCR, (uint16_t *)&vwCNTR);
	ldw	x, sp
	addw	x, #3
	pushw	x
	ldw	x, sp
	addw	x, #3
	pushw	x
	ldw	x, (0x15, sp)
	pushw	x
	ldw	x, (0x15, sp)
	pushw	x
	call	_mmTim1CalPscrCntr
;	stm8s_tim1_main.c: 505: vdwRatioTemp = vwCNTR;
	ldw	y, (0x03, sp)
	clrw	x
	ldw	(0x05, sp), x
;	stm8s_tim1_main.c: 506: vdwRatioTemp = vdwRatioTemp * vbDataRatio;
	ld	a, (0x13, sp)
	clrw	x
	ldw	(0x09, sp), x
	push	a
	ld	a, xh
	push	a
	ldw	x, (0x0b, sp)
	pushw	x
	pushw	y
	ldw	x, (0x0b, sp)
	pushw	x
	call	__mullong
	addw	sp, #8
;	stm8s_tim1_main.c: 507: vdwRatioTemp = vdwRatioTemp / 100;
	push	#0x64
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
;	stm8s_tim1_main.c: 508: vwRatioReg = (uint16_t)vdwRatioTemp;
	ldw	(0x0b, sp), x
;	stm8s_tim1_main.c: 509: ccprintf(_DEBUG_CMD_A_, ("mmTim1PWM : vdwDataPeriod (0x%08lx) vbDataRatio (%d)\r\n", vdwDataPeriod, vbDataRatio));
	clrw	x
	ld	a, (0x13, sp)
	ld	xl, a
	pushw	x
	ldw	x, (0x13, sp)
	pushw	x
	ldw	x, (0x13, sp)
	pushw	x
	push	#<(__str_23+0)
	push	#((__str_23+0) >> 8)
	call	_mib_printf
	addw	sp, #8
;	stm8s_tim1_main.c: 510: ccprintf(_DEBUG_CMD_A_, ("mmTim1PWM : vwPSCR (0x%04x) vwCNTR (0x%04x) vwRatioReg (0x%04x)\r\n", vwPSCR, vwCNTR,vwRatioReg));
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	push	#<(__str_24+0)
	push	#((__str_24+0) >> 8)
	call	_mib_printf
	addw	sp, #8
;	stm8s_tim1_main.c: 535: TIM1_DeInit();
	call	_TIM1_DeInit
;	stm8s_tim1_main.c: 536: TIM1_TimeBaseInit(vwPSCR, TIM1_COUNTERMODE_UP, vwCNTR, 0);
	push	#0x00
	ldw	x, (0x04, sp)
	pushw	x
	clr	a
	ldw	x, (0x04, sp)
	call	_TIM1_TimeBaseInit
;	stm8s_tim1_main.c: 549: TIM1_SelectOCxM(vbChannelNumber, TIM1_OCMODE_PWM2);
	push	#0x70
	ld	a, (0x15, sp)
	call	_TIM1_SelectOCxM
;	stm8s_tim1_main.c: 559: if(vbChannelNumber==TIM1_CHANNEL_1) // ch1
	tnz	(0x14, sp)
	jrne	00122$
;	stm8s_tim1_main.c: 561: TIM1_SetCompare1(vwRatioReg);
	ldw	x, (0x0b, sp)
	call	_TIM1_SetCompare1
;	stm8s_tim1_main.c: 568: TIM1_OC1PolarityConfig(vbLevelState);
	ld	a, (0x16, sp)
	call	_TIM1_OC1PolarityConfig
;	stm8s_tim1_main.c: 573: TIM1_OC1NPolarityConfig(vbLevelState);
	ld	a, (0x16, sp)
	call	_TIM1_OC1NPolarityConfig
;	stm8s_tim1_main.c: 578: TIM1_OC1PreloadConfig(ENABLE);
	ld	a, #0x01
	call	_TIM1_OC1PreloadConfig
;	stm8s_tim1_main.c: 579: if(0)
	jra	00123$
;	stm8s_tim1_main.c: 581: TIM1->CCMR1 |= TIM1_CCMR_OCxPE; // : Preload register on TIM1_CCR1 enabled
00122$:
;	stm8s_tim1_main.c: 584: else if(vbChannelNumber==TIM1_CHANNEL_2) // ch2
	ld	a, (0x14, sp)
	dec	a
	jrne	00119$
;	stm8s_tim1_main.c: 586: TIM1_SetCompare2(vwRatioReg);
	ldw	x, (0x0b, sp)
	call	_TIM1_SetCompare2
;	stm8s_tim1_main.c: 587: TIM1_OC2PolarityConfig(vbLevelState);
	ld	a, (0x16, sp)
	call	_TIM1_OC2PolarityConfig
;	stm8s_tim1_main.c: 588: TIM1_OC2NPolarityConfig(vbLevelState);
	ld	a, (0x16, sp)
	call	_TIM1_OC2NPolarityConfig
;	stm8s_tim1_main.c: 589: TIM1_OC2PreloadConfig(ENABLE);
	ld	a, #0x01
	call	_TIM1_OC2PreloadConfig
	jra	00123$
00119$:
;	stm8s_tim1_main.c: 591: else if(vbChannelNumber==TIM1_CHANNEL_3) // ch3
	ld	a, (0x14, sp)
	cp	a, #0x02
	jrne	00116$
;	stm8s_tim1_main.c: 593: TIM1_SetCompare3(vwRatioReg);
	ldw	x, (0x0b, sp)
	call	_TIM1_SetCompare3
;	stm8s_tim1_main.c: 594: TIM1_OC3PolarityConfig(vbLevelState);
	ld	a, (0x16, sp)
	call	_TIM1_OC3PolarityConfig
;	stm8s_tim1_main.c: 595: TIM1_OC3NPolarityConfig(vbLevelState);
	ld	a, (0x16, sp)
	call	_TIM1_OC3NPolarityConfig
;	stm8s_tim1_main.c: 596: TIM1_OC3PreloadConfig(ENABLE);
	ld	a, #0x01
	call	_TIM1_OC3PreloadConfig
	jra	00123$
00116$:
;	stm8s_tim1_main.c: 598: else if(vbChannelNumber==TIM1_CHANNEL_4) // ch4
	ld	a, (0x14, sp)
	cp	a, #0x03
	jrne	00123$
;	stm8s_tim1_main.c: 600: TIM1_SetCompare4(vwRatioReg);
	ldw	x, (0x0b, sp)
	call	_TIM1_SetCompare4
;	stm8s_tim1_main.c: 601: TIM1_OC4PolarityConfig(vbLevelState);
	ld	a, (0x16, sp)
	call	_TIM1_OC4PolarityConfig
;	stm8s_tim1_main.c: 603: TIM1_OC4PreloadConfig(ENABLE);
	ld	a, #0x01
	call	_TIM1_OC4PreloadConfig
00123$:
;	stm8s_tim1_main.c: 605: if(vbPinUseFlag&0x1)
	ld	a, (0x15, sp)
	bcp	a, #0x01
	jreq	00127$
;	stm8s_tim1_main.c: 607: TIM1_CCxCmd(vbChannelNumber, ENABLE);
	push	a
	push	#0x01
	ld	a, (0x16, sp)
	call	_TIM1_CCxCmd
	pop	a
;	stm8s_tim1_main.c: 610: TIM1->CCER1 |= TIM1_CCER1_CC1E; // On - OC1 signal is output on the corresponding output pin depending on the MOE, OSSI, OSSR, OIS1, OIS1N and CC1NE bits
00127$:
;	stm8s_tim1_main.c: 613: if(vbPinUseFlag&0x2)
	bcp	a, #0x02
	jreq	00131$
;	stm8s_tim1_main.c: 615: TIM1_CCxNCmd(vbChannelNumber, ENABLE);
	push	#0x01
	ld	a, (0x15, sp)
	call	_TIM1_CCxNCmd
;	stm8s_tim1_main.c: 618: TIM1->CCER1 |= TIM1_CCER1_CC1NE;
00131$:
;	stm8s_tim1_main.c: 621: TIM1_ARRPreloadConfig(ENABLE);
	ld	a, #0x01
	call	_TIM1_ARRPreloadConfig
;	stm8s_tim1_main.c: 626: if(vbPulseState)
	tnz	(0x17, sp)
	jreq	00135$
;	stm8s_tim1_main.c: 628: TIM1_SelectOnePulseMode(TIM1_OPMODE_SINGLE);
	ld	a, #0x01
	call	_TIM1_SelectOnePulseMode
;	stm8s_tim1_main.c: 630: TIM1->EGR = 0xFF;
	mov	0x5257+0, #0xff
00135$:
;	stm8s_tim1_main.c: 633: TIM1_CtrlPWMOutputs(ENABLE);
	ld	a, #0x01
	call	_TIM1_CtrlPWMOutputs
;	stm8s_tim1_main.c: 639: TIM1_Cmd(ENABLE);
	ld	a, #0x01
	call	_TIM1_Cmd
;	stm8s_tim1_main.c: 647: return 1;
	clrw	x
	incw	x
;	stm8s_tim1_main.c: 648: }
	ldw	y, (13, sp)
	addw	sp, #23
	jp	(y)
;	stm8s_tim1_main.c: 667: int mmTim1CalPscrCntr(uint32_t vdwDelayUsec, uint16_t *pvwPSCR, uint16_t *pvwCNTR)
;	-----------------------------------------
;	 function mmTim1CalPscrCntr
;	-----------------------------------------
_mmTim1CalPscrCntr:
	sub	sp, #4
;	stm8s_tim1_main.c: 669: uint32_t vdwMask = vdwDelayUsec;
	ldw	y, (0x09, sp)
	ldw	x, (0x07, sp)
;	stm8s_tim1_main.c: 674: for (vbIndex = 0; vbIndex < 32; vbIndex++)
	clr	a
00109$:
;	stm8s_tim1_main.c: 676: if (vdwMask & 0x80000000)
	tnzw	x
	jrmi	00103$
;	stm8s_tim1_main.c: 680: vdwMask <<= 1;
	sllw	y
	rlcw	x
;	stm8s_tim1_main.c: 674: for (vbIndex = 0; vbIndex < 32; vbIndex++)
	inc	a
	cp	a, #0x20
	jrc	00109$
00103$:
;	stm8s_tim1_main.c: 682: vbMaxBitDelay = 31 - vbIndex;
	ld	(0x04, sp), a
	ld	a, #0x1f
	sub	a, (0x04, sp)
;	stm8s_tim1_main.c: 683: ccprintf(_DEBUG_CMD_A_, ("mmTim1CalPscrCntr : vbMaxBitDelay : %d\r\n", vbMaxBitDelay));
	clrw	x
	ld	xl, a
	push	a
	pushw	x
	push	#<(__str_25+0)
	push	#((__str_25+0) >> 8)
	call	_mib_printf
	addw	sp, #4
	pop	a
;	stm8s_tim1_main.c: 684: if (vbMaxBitDelay <= 15)
	cp	a, #0x0f
	jrugt	00107$
;	stm8s_tim1_main.c: 686: vbMaxBitDelay = 15;
	ld	a, #0x0f
	jra	00108$
00107$:
;	stm8s_tim1_main.c: 688: else if(vbMaxBitDelay >= (31-5)) // 2 ^ 5 = 32 > (_MM_CK_PSC_/1000000) =  16
	cp	a, #0x1a
	jrc	00108$
;	stm8s_tim1_main.c: 690: vbMaxBitDelay = 31-5;
	ld	a, #0x1a
00108$:
;	stm8s_tim1_main.c: 692: vbPscrBitData = vbMaxBitDelay - 15;
	sub	a, #0x0f
;	stm8s_tim1_main.c: 693: *pvwPSCR = (1 << vbPscrBitData) * (_MM_CK_PSC_/1000000) - 1;
	ldw	y, (0x0b, sp)
	push	a
	clrw	x
	incw	x
	tnz	a
	jreq	00139$
00138$:
	sllw	x
	dec	a
	jrne	00138$
00139$:
	pop	a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	decw	x
	ldw	(0x01, sp), x
	ldw	x, y
	ldw	y, (0x01, sp)
	ldw	(x), y
;	stm8s_tim1_main.c: 694: *pvwCNTR = vdwDelayUsec >> vbPscrBitData;
	ldw	y, (0x0d, sp)
	ldw	(0x03, sp), y
	ldw	y, (0x09, sp)
	ldw	x, (0x07, sp)
	tnz	a
	jreq	00141$
00140$:
	srlw	x
	rrcw	y
	dec	a
	jrne	00140$
00141$:
	ldw	x, (0x03, sp)
	ldw	(x), y
;	stm8s_tim1_main.c: 695: ccprintf(_DEBUG_CMD_A_, ("mmTim1CalPscrCntr : vwPSCR (0x%04x) vwCNTR (0x%04x) vdwDelayUsec [0x%08lx]\r\n", *pvwPSCR, *pvwCNTR, vdwDelayUsec));
	ldw	x, (0x09, sp)
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	pushw	y
	ldw	x, (0x07, sp)
	pushw	x
	push	#<(__str_26+0)
	push	#((__str_26+0) >> 8)
	call	_mib_printf
	addw	sp, #10
;	stm8s_tim1_main.c: 697: return 1;
	clrw	x
	incw	x
;	stm8s_tim1_main.c: 698: }
	ldw	y, (5, sp)
	addw	sp, #14
	jp	(y)
;	stm8s_tim1_main.c: 702: int mmTim1GpioInit(void)
;	-----------------------------------------
;	 function mmTim1GpioInit
;	-----------------------------------------
_mmTim1GpioInit:
;	stm8s_tim1_main.c: 710: UCOM_LED1_GPIO->ODR &= (uint8_t)(~(UCOM_LED1_PIN)); /* Output mode  Low level */
	bres	0x500f, #0
;	stm8s_tim1_main.c: 711: UCOM_LED1_GPIO->DDR |= (uint8_t)UCOM_LED1_PIN;      /* Set Output mode */
	bset	0x5011, #0
;	stm8s_tim1_main.c: 712: UCOM_LED1_GPIO->CR1 |= (uint8_t)UCOM_LED1_PIN;      /* Push-Pull */
	bset	0x5012, #0
;	stm8s_tim1_main.c: 714: UCOM_LED1_GPIO->CR2 |= (uint8_t)UCOM_LED1_PIN; /* 10MHz */
	bset	0x5013, #0
;	stm8s_tim1_main.c: 720: UCOM_KEY1_GPIO->DDR &= (uint8_t)(~(UCOM_KEY1_PIN)); /* Set Input mode */
	bres	0x5002, #3
;	stm8s_tim1_main.c: 722: UCOM_KEY1_GPIO->CR1 &= (uint8_t)(~(UCOM_KEY1_PIN)); /* Float */
	bres	0x5003, #3
;	stm8s_tim1_main.c: 724: UCOM_KEY1_GPIO->CR2 &= (uint8_t)(~(UCOM_KEY1_PIN)); /* External interrupt disable */
	bres	0x5004, #3
;	stm8s_tim1_main.c: 727: return 1;
	clrw	x
	incw	x
;	stm8s_tim1_main.c: 728: }
	ret
;	stm8s_tim1_main.c: 732: void mmRemapCH1N_CH2N_CH3N_ETR(void)
;	-----------------------------------------
;	 function mmRemapCH1N_CH2N_CH3N_ETR
;	-----------------------------------------
_mmRemapCH1N_CH2N_CH3N_ETR:
;	stm8s_tim1_main.c: 739: if(FLASH_ReadByte(OPT2_REG)!=AFR5_BIT) 
	push	#0x03
	push	#0x48
	clrw	x
	pushw	x
	call	_FLASH_ReadByte
	cp	a, #0x20
	jrne	00111$
	ret
00111$:
;	stm8s_tim1_main.c: 741: FLASH_Unlock(FLASH_MEMTYPE_DATA); 
	ld	a, #0xf7
	call	_FLASH_Unlock
;	stm8s_tim1_main.c: 743: FLASH_ProgramOptionByte(OPT2_REG,AFR5_BIT); 
	ld	a, #0x20
	ldw	x, #0x4803
;	stm8s_tim1_main.c: 747: }
	jp	_FLASH_ProgramOptionByte
	.area CODE
	.area CONST
	.area CONST
__str_0:
	.ascii "INFO:+cmd_tim1..."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_1:
	.ascii "INFO:-cmd_tim1..."
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
	.ascii "onepulse"
	.db 0x00
	.area CODE
	.area CONST
___str_8:
	.ascii "low"
	.db 0x00
	.area CODE
	.area CONST
___str_9:
	.ascii "pwm"
	.db 0x00
	.area CODE
	.area CONST
__str_10:
	.ascii "mmTim1 : vdwDataPeriod (0x%08lx) vbDataRatio (%d)"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_11:
	.ascii "mmTim1 : vbChannelNumber (%d) vbPinUseFlag (%d) vbLevelState"
	.ascii " (%d)"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_12:
	.ascii "remap"
	.db 0x00
	.area CODE
	.area CONST
___str_13:
	.ascii "set"
	.db 0x00
	.area CODE
	.area CONST
___str_14:
	.ascii "reset"
	.db 0x00
	.area CODE
	.area CONST
__str_15:
	.ascii "tim1 init....error !!!"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_16:
	.ascii "tim1 init....(0x%02X)"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_17:
	.ascii "tim1 AFR5....(0x%x)"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_18:
	.ascii "init"
	.db 0x00
	.area CODE
	.area CONST
__str_19:
	.ascii "tim1 reset....(0x%02X)"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_20:
	.ascii "help"
	.db 0x00
	.area CODE
	.area CONST
__str_21:
	.ascii "TIM1_BaseAddress : 0x%04x"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_22:
	.ascii "mmTim1Onepulse : vdwPeriod (0x%08lx) vbDataRatio (%d)"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_23:
	.ascii "mmTim1PWM : vdwDataPeriod (0x%08lx) vbDataRatio (%d)"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_24:
	.ascii "mmTim1PWM : vwPSCR (0x%04x) vwCNTR (0x%04x) vwRatioReg (0x%0"
	.ascii "4x)"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_25:
	.ascii "mmTim1CalPscrCntr : vbMaxBitDelay : %d"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_26:
	.ascii "mmTim1CalPscrCntr : vwPSCR (0x%04x) vwCNTR (0x%04x) vdwDelay"
	.ascii "Usec [0x%08lx]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_27:
	.ascii "typedef struct TIM1_struct"
	.db 0x0d
	.db 0x0a
	.ascii "{"
	.db 0x0d
	.db 0x0a
	.ascii "0x00:__IO uint8_t CR1;   /*!< control register 1 */"
	.db 0x0d
	.db 0x0a
	.ascii "0x01:__IO uint8_t CR2;   /*!< control register 2 */"
	.db 0x0d
	.db 0x0a
	.ascii "0x02:__IO uint8_t SMCR;  /*!< Synchro mode control register "
	.ascii "*/"
	.db 0x0d
	.db 0x0a
	.ascii "0x03:__IO uint8_t ETR;   /*!< external trigger register */"
	.db 0x0d
	.db 0x0a
	.ascii "0x04:__IO uint8_t IER;   /*!< interrupt enable register*/"
	.db 0x0d
	.db 0x0a
	.ascii "0x05:__IO uint8_t SR1;   /*!< status register 1 */"
	.db 0x0d
	.db 0x0a
	.ascii "0x06:__IO uint8_t SR2;   /*!< status register 2 */"
	.db 0x0d
	.db 0x0a
	.ascii "0x07:__IO uint8_t EGR;   /*!< event generation register */"
	.db 0x0d
	.db 0x0a
	.ascii "0x08:__IO uint8_t CCMR1; /*!< CC mode register 1 */"
	.db 0x0d
	.db 0x0a
	.ascii "0x09:__IO uint8_t CCMR2; /*!< CC mode register 2 */"
	.db 0x0d
	.db 0x0a
	.ascii "0x0a:__IO uint8_t CCMR3; /*!< CC mode register 3 */"
	.db 0x0d
	.db 0x0a
	.ascii "0x0b:__IO uint8_t CCMR4; /*!< CC mode register 4 */"
	.db 0x0d
	.db 0x0a
	.ascii "0x0c:__IO uint8_t CCER1; /*!< CC enable register 1 */"
	.db 0x0d
	.db 0x0a
	.ascii "0x0d:__IO uint8_t CCER2; /*!< CC enable register 2 */"
	.db 0x0d
	.db 0x0a
	.ascii "0x0e:__IO uint8_t CNTRH; /*!< counter high */"
	.db 0x0d
	.db 0x0a
	.ascii "0x0f:__IO uint8_t CNTRL; /*!< counter low */"
	.db 0x0d
	.db 0x0a
	.ascii "0x10:__IO uint8_t PSCRH; /*!< prescaler high */"
	.db 0x0d
	.db 0x0a
	.ascii "0x11:__IO uint8_t PSCRL; /*!< prescaler low */"
	.db 0x0d
	.db 0x0a
	.ascii "0x12:__IO uint8_t ARRH;  /*!< auto-reload register high */"
	.db 0x0d
	.db 0x0a
	.ascii "0x13:__IO uint8_t ARRL;  /*!< auto-reload register low */"
	.db 0x0d
	.db 0x0a
	.ascii "0x14:__IO uint8_t RCR;   /*!< Repetition Counter register */"
	.db 0x0d
	.db 0x0a
	.ascii "0x15:__IO uint8_t CCR1H; /*!< capture/compare register 1 hig"
	.ascii "h */"
	.db 0x0d
	.db 0x0a
	.ascii "0x16:__IO uint8_t CCR1L; /*!< capture/compare register 1 low"
	.ascii " */"
	.db 0x0d
	.db 0x0a
	.ascii "0x17:__IO uint8_t CCR2H; /*!< capture/compare register 2 hig"
	.ascii "h */"
	.db 0x0d
	.db 0x0a
	.ascii "0x18:__IO uint8_t CCR2L; /*!< capture/compare register 2 low"
	.ascii " */"
	.db 0x0d
	.db 0x0a
	.ascii "0x19:__IO uint8_t CCR3H; /*!< capture/compare register 3 hig"
	.ascii "h */"
	.db 0x0d
	.db 0x0a
	.ascii "0x1a:__IO uint8_t CCR3L; /*!< capture/compare register 3 low"
	.ascii " */"
	.db 0x0d
	.db 0x0a
	.ascii "0x1b:__IO uint8_t CCR4H; /*!< capture/compare register 3 hig"
	.ascii "h */"
	.db 0x0d
	.db 0x0a
	.ascii "0x1c:__IO uint8_t CCR4L; /*!< capture/compare register 3 low"
	.ascii " */"
	.db 0x0d
	.db 0x0a
	.ascii "0x1d:__IO uint8_t BKR;   /*!< Break Register */"
	.db 0x0d
	.db 0x0a
	.ascii "0x1e:__IO uint8_t DTR;   /*!< dead-time register */"
	.db 0x0d
	.db 0x0a
	.ascii "0x1f:__IO uint8_t OISR;  /*!< Output idle register */"
	.db 0x0d
	.db 0x0a
	.ascii "}"
	.db 0x0d
	.db 0x0a
	.ascii "TIM1_TypeDef;"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_28:
	.ascii "tim1"
	.db 0x00
	.area CODE
	.area CONST
___str_29:
	.ascii "  tim1 {init} "
	.db 0x0d
	.db 0x0a
	.ascii "  tim1 {write} [addr] [data]  "
	.db 0x0d
	.db 0x0a
	.ascii "  tim1 {read} [addr] "
	.db 0x0d
	.db 0x0a
	.ascii "  tim1 {onepulse} {high/low} [delay] [width] usec.."
	.db 0x0d
	.db 0x0a
	.ascii "  tim1 {pwm} [period] [ratio] {N(1/2/3/4):Pin(p/n/b):(h/l)}}"
	.ascii " usec "
	.db 0x0d
	.db 0x0a
	.ascii "  tim1 {compare} [period] usec "
	.db 0x0d
	.db 0x0a
	.ascii "  tim1 {capture} "
	.db 0x0d
	.db 0x0a
	.ascii "  tim1 {remap} {set/reset} "
	.db 0x0d
	.db 0x0a
	.ascii "  tim1 {reset}"
	.db 0x0d
	.db 0x0a
	.ascii "  tim1 {help}  tim1 help."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area INITIALIZER
__xinit__gpbHelp_TIM1_TypeDef:
	.dw ___str_27
__xinit__cmdTbl_only:
	.dw ___str_28
	.dw _DoTIM1
	.dw ___str_29
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.area CABS (ABS)
