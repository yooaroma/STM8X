;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_mib_debug_mem
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _HexDump
	.globl _HexToInt
	.globl _mib_printf
	.globl _MibWriteDebugString
	.globl ___memcpy
	.globl _memset
	.globl _strcmp
	.globl _memcmp
	.globl _cmd_mem
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
;	./../../mib/stm8s_mib_debug_mem.c: 53: void cmd_mem(void)
;	-----------------------------------------
;	 function cmd_mem
;	-----------------------------------------
_cmd_mem:
	sub	sp, #10
;	./../../mib/stm8s_mib_debug_mem.c: 59: for (cptr = cmdTbl;; cptr++) 
	ldw	x, #(_cmdTbl+0)
	ldw	(0x01, sp), x
	clrw	x
	ldw	(0x07, sp), x
	ldw	(0x05, sp), x
	ldw	y, (0x01, sp)
	ldw	(0x09, sp), y
00106$:
;	./../../mib/stm8s_mib_debug_mem.c: 61: if(cptr->cmd==0)
	ldw	x, (0x09, sp)
	ldw	x, (x)
	ldw	(0x03, sp), x
	jrne	00102$
;	./../../mib/stm8s_mib_debug_mem.c: 63: ccprintf(1,("INFO:+cmd_mem...\r\n"));
	push	#<(__str_0+0)
	push	#((__str_0+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 64: memcpy((void *)&(cptr->cmd),(void *)&(cmdTbl_only[0].cmd),sizeof(CMD_MY));
	ldw	x, #_cmdTbl_only+0
	ldw	y, (0x01, sp)
	push	#0x06
	push	#0x00
	pushw	x
	ldw	x, y
	call	___memcpy
;	./../../mib/stm8s_mib_debug_mem.c: 65: break;
	jra	00105$
00102$:
;	./../../mib/stm8s_mib_debug_mem.c: 67: index++;
	ldw	x, (0x07, sp)
	incw	x
	ldw	(0x07, sp), x
	jrne	00126$
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x05, sp), x
00126$:
;	./../../mib/stm8s_mib_debug_mem.c: 68: if(index>MAX_COMMANDS)
	ldw	x, #0x0006
	cpw	x, (0x07, sp)
	clr	a
	sbc	a, (0x06, sp)
	clr	a
	sbc	a, (0x05, sp)
	jrnc	00107$
;	./../../mib/stm8s_mib_debug_mem.c: 70: ccprintf(1,("INFO:-cmd_mem...\r\n"));
	push	#<(__str_1+0)
	push	#((__str_1+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 71: return;
	jra	00108$
00107$:
;	./../../mib/stm8s_mib_debug_mem.c: 59: for (cptr = cmdTbl;; cptr++) 
	ldw	x, (0x09, sp)
	addw	x, #0x0006
	ldw	(0x09, sp), x
	ldw	(0x01, sp), x
	jra	00106$
00105$:
;	./../../mib/stm8s_mib_debug_mem.c: 74: return;
00108$:
;	./../../mib/stm8s_mib_debug_mem.c: 75: }
	addw	sp, #10
	ret
;	./../../mib/stm8s_mib_debug_mem.c: 85: static int DoMem(CMD_MY *cptr, int argc, char **argv)
;	-----------------------------------------
;	 function DoMem
;	-----------------------------------------
_DoMem:
	sub	sp, #41
	ldw	(0x24, sp), x
;	./../../mib/stm8s_mib_debug_mem.c: 87: uint32_t addr = 0;
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
;	./../../mib/stm8s_mib_debug_mem.c: 99: if (argc < 3)
	ldw	x, (0x2c, sp)
	cpw	x, #0x0003
	jrsge	00102$
;	./../../mib/stm8s_mib_debug_mem.c: 101: MibWriteDebugString(cptr->usage);
	ldw	x, (0x24, sp)
	ldw	x, (0x4, x)
	call	_MibWriteDebugString
;	./../../mib/stm8s_mib_debug_mem.c: 102: return FALSE;
	clrw	x
	jp	00235$
00102$:
;	./../../mib/stm8s_mib_debug_mem.c: 104: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
	ldw	x, (0x2e, sp)
	incw	x
	incw	x
	ldw	(0x26, sp), x
	ldw	x, (x)
	push	#<(___str_2+0)
	push	#((___str_2+0) >> 8)
	call	_strcmp
	tnzw	x
	jreq	00564$
	jp	00215$
00564$:
;	./../../mib/stm8s_mib_debug_mem.c: 106: if (argc < 5)
	ldw	x, (0x2c, sp)
	cpw	x, #0x0005
	jrsge	00104$
;	./../../mib/stm8s_mib_debug_mem.c: 108: MibWriteDebugString(cptr->usage);
	ldw	x, (0x24, sp)
	ldw	x, (0x4, x)
	call	_MibWriteDebugString
;	./../../mib/stm8s_mib_debug_mem.c: 109: return FALSE;
	clrw	x
	jp	00235$
00104$:
;	./../../mib/stm8s_mib_debug_mem.c: 111: if (!HexToInt(argv[3], &addr, 32))
	ldw	x, sp
	incw	x
	exgw	x, y
	ldw	x, (0x2e, sp)
	ldw	x, (0x6, x)
	push	#0x20
	push	#0x00
	pushw	y
	call	_HexToInt
	tnzw	x
	jrne	00106$
;	./../../mib/stm8s_mib_debug_mem.c: 113: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 114: return FALSE;
	clrw	x
	jp	00235$
00106$:
;	./../../mib/stm8s_mib_debug_mem.c: 117: switch (argv[2][0])
	ldw	x, (0x2e, sp)
	ldw	x, (0x4, x)
	ld	a, (x)
	cp	a, #0x63
	jreq	00107$
	cp	a, #0x6c
	jreq	00113$
	cp	a, #0x73
	jreq	00110$
	jp	00116$
;	./../../mib/stm8s_mib_debug_mem.c: 119: case 'c':
00107$:
;	./../../mib/stm8s_mib_debug_mem.c: 120: if (!HexToInt(argv[4], &c, 8))
	ldw	x, sp
	addw	x, #5
	exgw	x, y
	ldw	x, (0x2e, sp)
	ldw	x, (0x8, x)
	push	#0x08
	push	#0x00
	pushw	y
	call	_HexToInt
	tnzw	x
	jrne	00109$
;	./../../mib/stm8s_mib_debug_mem.c: 122: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 123: return FALSE;
	clrw	x
	jp	00235$
00109$:
;	./../../mib/stm8s_mib_debug_mem.c: 125: wr_ADDR8(addr, c);
	ldw	x, (0x03, sp)
	ld	a, (0x05, sp)
	ld	(x), a
;	./../../mib/stm8s_mib_debug_mem.c: 126: break;
	jp	00216$
;	./../../mib/stm8s_mib_debug_mem.c: 127: case 's':
00110$:
;	./../../mib/stm8s_mib_debug_mem.c: 128: if (!HexToInt(argv[4], &s, 16))
	ldw	x, sp
	addw	x, #6
	exgw	x, y
	ldw	x, (0x2e, sp)
	ldw	x, (0x8, x)
	push	#0x10
	push	#0x00
	pushw	y
	call	_HexToInt
	tnzw	x
	jrne	00112$
;	./../../mib/stm8s_mib_debug_mem.c: 130: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 131: return FALSE;
	clrw	x
	jp	00235$
00112$:
;	./../../mib/stm8s_mib_debug_mem.c: 133: wr_ADDR16(addr, s);
	ldw	x, (0x03, sp)
	ldw	y, (0x06, sp)
	ldw	(x), y
;	./../../mib/stm8s_mib_debug_mem.c: 134: break;
	jp	00216$
;	./../../mib/stm8s_mib_debug_mem.c: 135: case 'l':
00113$:
;	./../../mib/stm8s_mib_debug_mem.c: 136: if (!HexToInt(argv[4], &l, 32))
	ldw	x, sp
	addw	x, #8
	exgw	x, y
	ldw	x, (0x2e, sp)
	ldw	x, (0x8, x)
	push	#0x20
	push	#0x00
	pushw	y
	call	_HexToInt
	tnzw	x
	jrne	00115$
;	./../../mib/stm8s_mib_debug_mem.c: 138: ccprintf(_DEBUG_CMD_A_, ("Illugal character is useqd.\r\n"));
	push	#<(__str_4+0)
	push	#((__str_4+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 139: return FALSE;
	clrw	x
	jp	00235$
00115$:
;	./../../mib/stm8s_mib_debug_mem.c: 141: wr_ADDR32(addr, l);
	ldw	x, (0x03, sp)
	ldw	y, (0x0a, sp)
	ldw	(0x2, x), y
	ldw	y, (0x08, sp)
	ldw	(x), y
;	./../../mib/stm8s_mib_debug_mem.c: 142: break;
	jp	00216$
;	./../../mib/stm8s_mib_debug_mem.c: 143: default:
00116$:
;	./../../mib/stm8s_mib_debug_mem.c: 144: MibWriteDebugString(cptr->usage);
	ldw	x, (0x24, sp)
	ldw	x, (0x4, x)
	call	_MibWriteDebugString
;	./../../mib/stm8s_mib_debug_mem.c: 145: return FALSE;
	clrw	x
	jp	00235$
;	./../../mib/stm8s_mib_debug_mem.c: 146: }		
00215$:
;	./../../mib/stm8s_mib_debug_mem.c: 148: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
	ldw	x, (0x26, sp)
	ldw	x, (x)
	push	#<(___str_5+0)
	push	#((___str_5+0) >> 8)
	call	_strcmp
	tnzw	x
	jreq	00579$
	jp	00212$
00579$:
;	./../../mib/stm8s_mib_debug_mem.c: 150: if (argc < 4)
	ldw	x, (0x2c, sp)
	cpw	x, #0x0004
	jrsge	00119$
;	./../../mib/stm8s_mib_debug_mem.c: 152: MibWriteDebugString(cptr->usage);
	ldw	x, (0x24, sp)
	ldw	x, (0x4, x)
	call	_MibWriteDebugString
;	./../../mib/stm8s_mib_debug_mem.c: 153: return FALSE;
	clrw	x
	jp	00235$
00119$:
;	./../../mib/stm8s_mib_debug_mem.c: 155: if (!HexToInt(argv[3], &addr, 32))
	ldw	x, sp
	incw	x
	exgw	x, y
	ldw	x, (0x2e, sp)
	ldw	x, (0x6, x)
	push	#0x20
	push	#0x00
	pushw	y
	call	_HexToInt
	tnzw	x
	jrne	00121$
;	./../../mib/stm8s_mib_debug_mem.c: 157: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 158: return FALSE;
	clrw	x
	jp	00235$
00121$:
;	./../../mib/stm8s_mib_debug_mem.c: 160: ccprintf(_DEBUG_CMD_A_,("\taddress : 0x%08lx  ", addr));
	ldw	x, (0x03, sp)
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	push	#<(__str_6+0)
	push	#((__str_6+0) >> 8)
	call	_mib_printf
	addw	sp, #6
;	./../../mib/stm8s_mib_debug_mem.c: 161: ccprintf(_DEBUG_CMD_A_, ("\tvalue   : "));
	push	#<(__str_7+0)
	push	#((__str_7+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 162: switch (argv[2][0])
	ldw	x, (0x2e, sp)
	ldw	x, (0x4, x)
	ld	a, (x)
	cp	a, #0x63
	jreq	00122$
	cp	a, #0x6c
	jreq	00124$
	cp	a, #0x73
	jreq	00123$
	jra	00125$
;	./../../mib/stm8s_mib_debug_mem.c: 164: case 'c':
00122$:
;	./../../mib/stm8s_mib_debug_mem.c: 165: c = rd_ADDR8(addr);
	ldw	x, (0x03, sp)
	ld	a, (x)
	ld	(0x05, sp), a
;	./../../mib/stm8s_mib_debug_mem.c: 166: ccprintf(_DEBUG_CMD_A_,("0x%02x ", c));
	clrw	x
	ld	xl, a
	pushw	x
	push	#<(__str_8+0)
	push	#((__str_8+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	./../../mib/stm8s_mib_debug_mem.c: 167: break;
	jra	00126$
;	./../../mib/stm8s_mib_debug_mem.c: 168: case 's':
00123$:
;	./../../mib/stm8s_mib_debug_mem.c: 169: s = rd_ADDR16(addr);
	ldw	x, (0x03, sp)
	ldw	x, (x)
	ldw	(0x06, sp), x
;	./../../mib/stm8s_mib_debug_mem.c: 170: ccprintf(_DEBUG_CMD_A_,("0x%04x", s));
	pushw	x
	push	#<(__str_9+0)
	push	#((__str_9+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	./../../mib/stm8s_mib_debug_mem.c: 171: break;
	jra	00126$
;	./../../mib/stm8s_mib_debug_mem.c: 172: case 'l':
00124$:
;	./../../mib/stm8s_mib_debug_mem.c: 173: l = rd_ADDR32(addr);
	ldw	x, (0x03, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
	ldw	(0x0a, sp), y
	ldw	(0x08, sp), x
;	./../../mib/stm8s_mib_debug_mem.c: 174: ccprintf(_DEBUG_CMD_A_,("0x%08lx", l));
	pushw	y
	pushw	x
	push	#<(__str_10+0)
	push	#((__str_10+0) >> 8)
	call	_mib_printf
	addw	sp, #6
;	./../../mib/stm8s_mib_debug_mem.c: 175: break;
	jra	00126$
;	./../../mib/stm8s_mib_debug_mem.c: 176: default:
00125$:
;	./../../mib/stm8s_mib_debug_mem.c: 177: ccprintf(_DEBUG_CMD_A_, ("Error.\r\n"));
	push	#<(__str_11+0)
	push	#((__str_11+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 178: return FALSE;
	clrw	x
	jp	00235$
;	./../../mib/stm8s_mib_debug_mem.c: 179: }
00126$:
;	./../../mib/stm8s_mib_debug_mem.c: 180: ccprintf(_DEBUG_CMD_A_, (".\r\n"));		
	push	#<(__str_12+0)
	push	#((__str_12+0) >> 8)
	call	_mib_printf
	addw	sp, #2
	jp	00216$
00212$:
;	./../../mib/stm8s_mib_debug_mem.c: 182: else if (!strcmp(argv[1], "wrn")) // _CMD_MY_WRITE_
	ldw	x, (0x26, sp)
	ldw	x, (x)
	push	#<(___str_13+0)
	push	#((___str_13+0) >> 8)
	call	_strcmp
	tnzw	x
	jreq	00591$
	jp	00209$
00591$:
;	./../../mib/stm8s_mib_debug_mem.c: 185: if (argc < 6)
	ldw	x, (0x2c, sp)
	cpw	x, #0x0006
	jrsge	00128$
;	./../../mib/stm8s_mib_debug_mem.c: 187: MibWriteDebugString(cptr->usage);
	ldw	x, (0x24, sp)
	ldw	x, (0x4, x)
	call	_MibWriteDebugString
;	./../../mib/stm8s_mib_debug_mem.c: 188: return FALSE;
	clrw	x
	jp	00235$
00128$:
;	./../../mib/stm8s_mib_debug_mem.c: 190: if (!HexToInt(argv[3], &addr, 32))
	ldw	x, sp
	incw	x
	exgw	x, y
	ldw	x, (0x2e, sp)
	ldw	x, (0x6, x)
	push	#0x20
	push	#0x00
	pushw	y
	call	_HexToInt
	tnzw	x
	jrne	00130$
;	./../../mib/stm8s_mib_debug_mem.c: 192: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 193: return FALSE;
	clrw	x
	jp	00235$
00130$:
;	./../../mib/stm8s_mib_debug_mem.c: 195: if (!HexToInt(argv[5], &v_Loop, 32))
	ldw	x, sp
	addw	x, #24
	exgw	x, y
	ldw	x, (0x2e, sp)
	ldw	x, (0xa, x)
	push	#0x20
	push	#0x00
	pushw	y
	call	_HexToInt
	tnzw	x
	jrne	00132$
;	./../../mib/stm8s_mib_debug_mem.c: 197: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 198: return FALSE;
	clrw	x
	jp	00235$
00132$:
;	./../../mib/stm8s_mib_debug_mem.c: 200: switch (argv[2][0])
	ldw	x, (0x2e, sp)
	ldw	x, (0x4, x)
	ld	a, (x)
	cp	a, #0x63
	jreq	00133$
	cp	a, #0x6c
	jrne	00599$
	jp	00141$
00599$:
	cp	a, #0x73
	jreq	00137$
	jp	00145$
;	./../../mib/stm8s_mib_debug_mem.c: 202: case 'c':
00133$:
;	./../../mib/stm8s_mib_debug_mem.c: 203: if (!HexToInt(argv[4], &c, 8))
	ldw	x, sp
	addw	x, #5
	ldw	y, (0x2e, sp)
	ldw	y, (0x8, y)
	push	#0x08
	push	#0x00
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00262$
;	./../../mib/stm8s_mib_debug_mem.c: 205: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 206: return FALSE;
	clrw	x
	jp	00235$
00262$:
	ldw	y, (0x1a, sp)
	ldw	(0x28, sp), y
	ldw	y, (0x18, sp)
	ldw	(0x26, sp), y
00218$:
;	./../../mib/stm8s_mib_debug_mem.c: 208: for (; v_Loop; v_Loop--) wr_ADDR8(addr, c);
	ldw	x, (0x28, sp)
	jrne	00605$
	ldw	x, (0x26, sp)
	jrne	00605$
	jp	00301$
00605$:
	ldw	x, (0x03, sp)
	ld	a, (0x05, sp)
	ld	(x), a
	ldw	x, (0x28, sp)
	subw	x, #0x0001
	ldw	(0x28, sp), x
	ldw	x, (0x26, sp)
	jrnc	00606$
	decw	x
00606$:
	ldw	(0x26, sp), x
	ldw	y, (0x28, sp)
	ldw	(0x1a, sp), y
	ldw	y, (0x26, sp)
	ldw	(0x18, sp), y
	jra	00218$
;	./../../mib/stm8s_mib_debug_mem.c: 210: case 's':
00137$:
;	./../../mib/stm8s_mib_debug_mem.c: 211: if (!HexToInt(argv[4], &s, 16))
	ldw	y, (0x2e, sp)
	ldw	(0x26, sp), y
	ldw	x, y
	ldw	x, (0x8, x)
	ldw	(0x28, sp), x
	push	#0x10
	push	#0x00
	ldw	x, sp
	addw	x, #8
	pushw	x
	ldw	x, (0x2c, sp)
	call	_HexToInt
	ldw	(0x28, sp), x
	jrne	00265$
;	./../../mib/stm8s_mib_debug_mem.c: 213: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 214: return FALSE;
	clrw	x
	jp	00235$
00265$:
	ldw	y, (0x1a, sp)
	ldw	(0x28, sp), y
	ldw	y, (0x18, sp)
	ldw	(0x26, sp), y
00221$:
;	./../../mib/stm8s_mib_debug_mem.c: 216: for (; v_Loop; v_Loop--) wr_ADDR16(addr, s);
	ldw	x, (0x28, sp)
	jrne	00608$
	ldw	x, (0x26, sp)
	jrne	00608$
	jp	00302$
00608$:
	ldw	y, (0x03, sp)
	ldw	(0x22, sp), y
	ldw	x, y
	ldw	y, (0x06, sp)
	ldw	(x), y
	ldw	x, (0x28, sp)
	subw	x, #0x0001
	ldw	(0x28, sp), x
	ldw	x, (0x26, sp)
	jrnc	00609$
	decw	x
00609$:
	ldw	(0x26, sp), x
	ldw	y, (0x28, sp)
	ldw	(0x1a, sp), y
	ldw	y, (0x26, sp)
	ldw	(0x18, sp), y
	jra	00221$
;	./../../mib/stm8s_mib_debug_mem.c: 218: case 'l':
00141$:
;	./../../mib/stm8s_mib_debug_mem.c: 219: if (!HexToInt(argv[4], &l, 32))
	ldw	y, (0x2e, sp)
	ldw	(0x26, sp), y
	ldw	x, y
	ldw	x, (0x8, x)
	ldw	(0x28, sp), x
	push	#0x20
	push	#0x00
	ldw	x, sp
	addw	x, #10
	pushw	x
	ldw	x, (0x2c, sp)
	call	_HexToInt
	ldw	(0x28, sp), x
	jrne	00268$
;	./../../mib/stm8s_mib_debug_mem.c: 221: ccprintf(_DEBUG_CMD_A_, ("Illugal character is useqd.\r\n"));
	push	#<(__str_4+0)
	push	#((__str_4+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 222: return FALSE;
	clrw	x
	jp	00235$
00268$:
	ldw	y, (0x1a, sp)
	ldw	(0x28, sp), y
	ldw	y, (0x18, sp)
	ldw	(0x26, sp), y
00224$:
;	./../../mib/stm8s_mib_debug_mem.c: 224: for (; v_Loop; v_Loop--) wr_ADDR32(addr, l);
	ldw	x, (0x28, sp)
	jrne	00611$
	ldw	x, (0x26, sp)
	jrne	00611$
	jp	00303$
00611$:
	ldw	y, (0x03, sp)
	ldw	(0x22, sp), y
	ldw	x, y
	ldw	y, (0x0a, sp)
	ldw	(0x2, x), y
	ldw	y, (0x08, sp)
	ldw	(x), y
	ldw	x, (0x28, sp)
	subw	x, #0x0001
	ldw	(0x28, sp), x
	ldw	x, (0x26, sp)
	jrnc	00612$
	decw	x
00612$:
	ldw	(0x26, sp), x
	ldw	y, (0x28, sp)
	ldw	(0x1a, sp), y
	ldw	y, (0x26, sp)
	ldw	(0x18, sp), y
	jra	00224$
;	./../../mib/stm8s_mib_debug_mem.c: 226: default:
00145$:
;	./../../mib/stm8s_mib_debug_mem.c: 227: MibWriteDebugString(cptr->usage);
	ldw	y, (0x24, sp)
	ldw	(0x26, sp), y
	ldw	x, y
	ldw	x, (0x4, x)
	ldw	(0x28, sp), x
	call	_MibWriteDebugString
;	./../../mib/stm8s_mib_debug_mem.c: 228: return FALSE;
	clrw	x
	jp	00235$
;	./../../mib/stm8s_mib_debug_mem.c: 229: }	
00209$:
;	./../../mib/stm8s_mib_debug_mem.c: 231: else if (!strcmp(argv[1], "rdn")) // _CMD_MY_READ_
	ldw	x, (0x26, sp)
	ldw	x, (x)
	ldw	(0x28, sp), x
	push	#<(___str_14+0)
	push	#((___str_14+0) >> 8)
	ldw	x, (0x2a, sp)
	call	_strcmp
	ldw	(0x28, sp), x
	jreq	00613$
	jp	00206$
00613$:
;	./../../mib/stm8s_mib_debug_mem.c: 234: if (argc < 5)
	ldw	x, (0x2c, sp)
	cpw	x, #0x0005
	jrsge	00148$
;	./../../mib/stm8s_mib_debug_mem.c: 236: MibWriteDebugString(cptr->usage);
	ldw	y, (0x24, sp)
	ldw	(0x26, sp), y
	ldw	x, y
	ldw	x, (0x4, x)
	ldw	(0x28, sp), x
	call	_MibWriteDebugString
;	./../../mib/stm8s_mib_debug_mem.c: 237: return FALSE;
	clrw	x
	jp	00235$
00148$:
;	./../../mib/stm8s_mib_debug_mem.c: 239: if (!HexToInt(argv[3], &addr, 32))
	ldw	y, (0x2e, sp)
	ldw	(0x26, sp), y
	ldw	x, y
	ldw	x, (0x6, x)
	ldw	(0x28, sp), x
	push	#0x20
	push	#0x00
	ldw	x, sp
	addw	x, #3
	pushw	x
	ldw	x, (0x2c, sp)
	call	_HexToInt
	ldw	(0x28, sp), x
	jrne	00150$
;	./../../mib/stm8s_mib_debug_mem.c: 241: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 242: return FALSE;
	clrw	x
	jp	00235$
00150$:
;	./../../mib/stm8s_mib_debug_mem.c: 244: if (!HexToInt(argv[4], &v_Loop, 32))
	ldw	y, (0x2e, sp)
	ldw	(0x26, sp), y
	ldw	x, y
	ldw	x, (0x8, x)
	ldw	(0x28, sp), x
	push	#0x20
	push	#0x00
	ldw	x, sp
	addw	x, #26
	pushw	x
	ldw	x, (0x2c, sp)
	call	_HexToInt
	ldw	(0x28, sp), x
	jrne	00152$
;	./../../mib/stm8s_mib_debug_mem.c: 246: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 247: return FALSE;
	clrw	x
	jp	00235$
00152$:
;	./../../mib/stm8s_mib_debug_mem.c: 249: ccprintf(_DEBUG_CMD_A_,("\taddress : 0x%08lx  ", addr));
	ldw	x, (0x03, sp)
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	push	#<(__str_6+0)
	push	#((__str_6+0) >> 8)
	call	_mib_printf
	addw	sp, #6
;	./../../mib/stm8s_mib_debug_mem.c: 250: ccprintf(_DEBUG_CMD_A_,("loop : 0x%08lx  \r\n", v_Loop));
	ldw	x, (0x1a, sp)
	pushw	x
	ldw	x, (0x1a, sp)
	pushw	x
	push	#<(__str_15+0)
	push	#((__str_15+0) >> 8)
	call	_mib_printf
	addw	sp, #6
;	./../../mib/stm8s_mib_debug_mem.c: 251: ccprintf(_DEBUG_CMD_A_, ("value   : "));
	push	#<(__str_16+0)
	push	#((__str_16+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 252: switch (argv[2][0])
	ldw	y, (0x2e, sp)
	ldw	(0x26, sp), y
	ldw	x, y
	ldw	x, (0x4, x)
	ldw	(0x28, sp), x
	ld	a, (x)
	cp	a, #0x63
	jreq	00278$
	cp	a, #0x6c
	jrne	00621$
	jp	00284$
00621$:
	cp	a, #0x73
	jreq	00281$
	jp	00165$
;	./../../mib/stm8s_mib_debug_mem.c: 254: case 'c':
00278$:
	ldw	y, (0x1a, sp)
	ldw	(0x28, sp), y
	ldw	y, (0x18, sp)
	ldw	(0x26, sp), y
00227$:
;	./../../mib/stm8s_mib_debug_mem.c: 255: for (; v_Loop; v_Loop--)
	ldw	x, (0x28, sp)
	jrne	00626$
	ldw	x, (0x26, sp)
	jrne	00626$
	jp	00304$
00626$:
;	./../../mib/stm8s_mib_debug_mem.c: 257: c = rd_ADDR8(addr);
	ldw	y, (0x03, sp)
	ldw	(0x22, sp), y
	ldw	x, y
	ld	a, (x)
	ld	(0x1f, sp), a
	ld	(0x05, sp), a
;	./../../mib/stm8s_mib_debug_mem.c: 258: if ((v_Loop & 0xfffff) == 0)
	ldw	y, (0x28, sp)
	ldw	(0x22, sp), y
	ld	a, (0x27, sp)
	and	a, #0x0f
	ld	(0x21, sp), a
	clr	(0x20, sp)
	ldw	x, (0x22, sp)
	jrne	00228$
;	./../../mib/stm8s_mib_debug_mem.c: 260: ccprintf(_DEBUG_CMD_A_,("0x%02x ", c));
	ldw	x, (0x20, sp)
	jrne	00228$
	ld	a, (0x1f, sp)
	ld	xl, a
	pushw	x
	push	#<(__str_8+0)
	push	#((__str_8+0) >> 8)
	call	_mib_printf
	addw	sp, #4
00228$:
;	./../../mib/stm8s_mib_debug_mem.c: 255: for (; v_Loop; v_Loop--)
	ldw	x, (0x28, sp)
	subw	x, #0x0001
	ldw	(0x28, sp), x
	ldw	x, (0x26, sp)
	jrnc	00629$
	decw	x
00629$:
	ldw	(0x26, sp), x
	ldw	y, (0x28, sp)
	ldw	(0x1a, sp), y
	ldw	y, (0x26, sp)
	ldw	(0x18, sp), y
	jra	00227$
;	./../../mib/stm8s_mib_debug_mem.c: 264: case 's':
00281$:
	ldw	y, (0x1a, sp)
	ldw	(0x28, sp), y
	ldw	y, (0x18, sp)
	ldw	(0x26, sp), y
00230$:
;	./../../mib/stm8s_mib_debug_mem.c: 265: for (; v_Loop; v_Loop--)
	ldw	x, (0x28, sp)
	jrne	00630$
	ldw	x, (0x26, sp)
	jrne	00630$
	jp	00305$
00630$:
;	./../../mib/stm8s_mib_debug_mem.c: 267: s = rd_ADDR16(addr);
	ldw	x, (0x03, sp)
	ldw	x, (x)
	ldw	(0x1e, sp), x
	ldw	(0x06, sp), x
;	./../../mib/stm8s_mib_debug_mem.c: 268: if ((v_Loop & 0xfffff) == 0)
	ldw	y, (0x28, sp)
	ldw	(0x22, sp), y
	clrw	x
	ld	a, (0x27, sp)
	and	a, #0x0f
	ld	xl, a
	ldw	y, (0x22, sp)
	jrne	00231$
	tnzw	x
	jrne	00231$
;	./../../mib/stm8s_mib_debug_mem.c: 270: ccprintf(_DEBUG_CMD_A_,("0x%04x ", s));
	ldw	x, (0x1e, sp)
	pushw	x
	push	#<(__str_17+0)
	push	#((__str_17+0) >> 8)
	call	_mib_printf
	addw	sp, #4
00231$:
;	./../../mib/stm8s_mib_debug_mem.c: 265: for (; v_Loop; v_Loop--)
	ldw	x, (0x28, sp)
	subw	x, #0x0001
	ldw	(0x28, sp), x
	ldw	x, (0x26, sp)
	jrnc	00633$
	decw	x
00633$:
	ldw	(0x26, sp), x
	ldw	y, (0x28, sp)
	ldw	(0x1a, sp), y
	ldw	y, (0x26, sp)
	ldw	(0x18, sp), y
	jra	00230$
;	./../../mib/stm8s_mib_debug_mem.c: 274: case 'l':
00284$:
	ldw	y, (0x1a, sp)
	ldw	(0x28, sp), y
	ldw	y, (0x18, sp)
	ldw	(0x26, sp), y
00233$:
;	./../../mib/stm8s_mib_debug_mem.c: 275: for (; v_Loop; v_Loop--)
	ldw	x, (0x28, sp)
	jrne	00634$
	ldw	x, (0x26, sp)
	jreq	00306$
00634$:
;	./../../mib/stm8s_mib_debug_mem.c: 277: l = rd_ADDR32(addr);
	ldw	x, (0x03, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
	ldw	(0x1c, sp), x
	ldw	(0x0a, sp), y
	ldw	x, (0x1c, sp)
	ldw	(0x08, sp), x
;	./../../mib/stm8s_mib_debug_mem.c: 278: if ((v_Loop & 0xfffff) == 0)
	ldw	x, (0x28, sp)
	ldw	(0x22, sp), x
	ld	a, (0x27, sp)
	and	a, #0x0f
	ld	(0x21, sp), a
	clr	(0x20, sp)
	ldw	x, (0x22, sp)
	jrne	00234$
	ldw	x, (0x20, sp)
	jrne	00234$
;	./../../mib/stm8s_mib_debug_mem.c: 280: ccprintf(_DEBUG_CMD_A_,("0x%08lx ", l));
	pushw	y
	ldw	x, (0x1e, sp)
	pushw	x
	push	#<(__str_18+0)
	push	#((__str_18+0) >> 8)
	call	_mib_printf
	addw	sp, #6
00234$:
;	./../../mib/stm8s_mib_debug_mem.c: 275: for (; v_Loop; v_Loop--)
	ldw	x, (0x28, sp)
	subw	x, #0x0001
	ldw	(0x28, sp), x
	ldw	x, (0x26, sp)
	jrnc	00637$
	decw	x
00637$:
	ldw	(0x26, sp), x
	ldw	y, (0x28, sp)
	ldw	(0x1a, sp), y
	ldw	y, (0x26, sp)
	ldw	(0x18, sp), y
	jra	00233$
;	./../../mib/stm8s_mib_debug_mem.c: 284: default:
00165$:
;	./../../mib/stm8s_mib_debug_mem.c: 285: ccprintf(_DEBUG_CMD_A_, ("Error.\r\n"));
	push	#<(__str_11+0)
	push	#((__str_11+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 286: return FALSE;
	clrw	x
	jp	00235$
;	./../../mib/stm8s_mib_debug_mem.c: 287: }
00304$:
	ldw	y, (0x28, sp)
	ldw	(0x1a, sp), y
	ldw	y, (0x26, sp)
	ldw	(0x18, sp), y
;	./../../mib/stm8s_mib_debug_mem.c: 351: return FALSE;
	jra	00166$
;	./../../mib/stm8s_mib_debug_mem.c: 287: }
00305$:
	ldw	y, (0x28, sp)
	ldw	(0x1a, sp), y
	ldw	y, (0x26, sp)
	ldw	(0x18, sp), y
;	./../../mib/stm8s_mib_debug_mem.c: 351: return FALSE;
	jra	00166$
;	./../../mib/stm8s_mib_debug_mem.c: 287: }
00306$:
	ldw	y, (0x28, sp)
	ldw	(0x1a, sp), y
	ldw	y, (0x26, sp)
	ldw	(0x18, sp), y
00166$:
;	./../../mib/stm8s_mib_debug_mem.c: 288: ccprintf(_DEBUG_CMD_A_, (".\r\n"));
	push	#<(__str_12+0)
	push	#((__str_12+0) >> 8)
	call	_mib_printf
	addw	sp, #2
	jp	00216$
00206$:
;	./../../mib/stm8s_mib_debug_mem.c: 290: else if (!strcmp(argv[1], "hdump")) 	// _CMD_MY_HEXDUMP_
	ldw	x, (0x26, sp)
	ldw	x, (x)
	push	#<(___str_19+0)
	push	#((___str_19+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00203$
;	./../../mib/stm8s_mib_debug_mem.c: 292: if (argc < 4)
	ldw	x, (0x2c, sp)
	cpw	x, #0x0004
	jrsge	00168$
;	./../../mib/stm8s_mib_debug_mem.c: 294: MibWriteDebugString(cptr->usage);
	ldw	x, (0x24, sp)
	ldw	x, (0x4, x)
	call	_MibWriteDebugString
;	./../../mib/stm8s_mib_debug_mem.c: 295: return FALSE;
	clrw	x
	jp	00235$
00168$:
;	./../../mib/stm8s_mib_debug_mem.c: 297: if (!HexToInt(argv[2], &addr, 32) || !HexToInt(argv[3], &len, 32))
	ldw	y, (0x2e, sp)
	ldw	y, (0x4, y)
	push	#0x20
	push	#0x00
	ldw	x, sp
	addw	x, #3
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jreq	00169$
	ldw	y, (0x2e, sp)
	ldw	y, (0x6, y)
	push	#0x20
	push	#0x00
	ldw	x, sp
	addw	x, #22
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00170$
00169$:
;	./../../mib/stm8s_mib_debug_mem.c: 299: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 300: return FALSE;
	clrw	x
	jp	00235$
00170$:
;	./../../mib/stm8s_mib_debug_mem.c: 302: HexDump(addr, len);		
	ldw	x, (0x16, sp)
	pushw	x
	ldw	x, (0x16, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	call	_HexDump
	jp	00216$
00203$:
;	./../../mib/stm8s_mib_debug_mem.c: 304: else if (!strcmp(argv[1], "cpy")) // _CMD_MY_MEMCPY_
	ldw	x, (0x26, sp)
	ldw	x, (x)
	push	#<(___str_20+0)
	push	#((___str_20+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00200$
;	./../../mib/stm8s_mib_debug_mem.c: 306: if (argc < 5)
	ldw	x, (0x2c, sp)
	cpw	x, #0x0005
	jrsge	00173$
;	./../../mib/stm8s_mib_debug_mem.c: 308: MibWriteDebugString(cptr->usage);
	ldw	x, (0x24, sp)
	ldw	x, (0x4, x)
	call	_MibWriteDebugString
;	./../../mib/stm8s_mib_debug_mem.c: 309: return FALSE;
	clrw	x
	jp	00235$
00173$:
;	./../../mib/stm8s_mib_debug_mem.c: 311: if (!HexToInt(argv[2], &dest, 32) || !HexToInt(argv[3], &src, 32) || !HexToInt(argv[4], &len, 32))
	ldw	y, (0x2e, sp)
	ldw	y, (0x4, y)
	push	#0x20
	push	#0x00
	ldw	x, sp
	addw	x, #14
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jreq	00174$
	ldw	y, (0x2e, sp)
	ldw	y, (0x6, y)
	push	#0x20
	push	#0x00
	ldw	x, sp
	addw	x, #18
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jreq	00174$
	ldw	y, (0x2e, sp)
	ldw	y, (0x8, y)
	push	#0x20
	push	#0x00
	ldw	x, sp
	addw	x, #22
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00175$
00174$:
;	./../../mib/stm8s_mib_debug_mem.c: 313: ccprintf(_DEBUG_CMD_A_, ("Illegal character is used.\r\n"));
	push	#<(__str_21+0)
	push	#((__str_21+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 314: return FALSE;
	clrw	x
	jp	00235$
00175$:
;	./../../mib/stm8s_mib_debug_mem.c: 316: memcpy((char *)dest, (char *)src, len);		
	ldw	x, (0x16, sp)
	ldw	y, (0x12, sp)
	ldw	(0x28, sp), y
	ldw	y, (0x0e, sp)
	pushw	x
	ldw	x, (0x2a, sp)
	pushw	x
	ldw	x, y
	call	___memcpy
	jp	00216$
00200$:
;	./../../mib/stm8s_mib_debug_mem.c: 318: else if (!strcmp(argv[1], "cmp")) // _CMD_MY_MEMCMP_
	ldw	x, (0x26, sp)
	ldw	x, (x)
	push	#<(___str_22+0)
	push	#((___str_22+0) >> 8)
	call	_strcmp
	tnzw	x
	jreq	00647$
	jp	00197$
00647$:
;	./../../mib/stm8s_mib_debug_mem.c: 320: if (argc < 5)
	ldw	x, (0x2c, sp)
	cpw	x, #0x0005
	jrsge	00179$
;	./../../mib/stm8s_mib_debug_mem.c: 322: MibWriteDebugString(cptr->usage);
	ldw	x, (0x24, sp)
	ldw	x, (0x4, x)
	call	_MibWriteDebugString
;	./../../mib/stm8s_mib_debug_mem.c: 323: return FALSE;
	clrw	x
	jp	00235$
00179$:
;	./../../mib/stm8s_mib_debug_mem.c: 325: if (!HexToInt(argv[2], &dest, 32) || !HexToInt(argv[3], &src, 32) || !HexToInt(argv[4], &len, 32))
	ldw	y, (0x2e, sp)
	ldw	y, (0x4, y)
	push	#0x20
	push	#0x00
	ldw	x, sp
	addw	x, #14
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jreq	00180$
	ldw	y, (0x2e, sp)
	ldw	y, (0x6, y)
	push	#0x20
	push	#0x00
	ldw	x, sp
	addw	x, #18
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jreq	00180$
	ldw	y, (0x2e, sp)
	ldw	y, (0x8, y)
	push	#0x20
	push	#0x00
	ldw	x, sp
	addw	x, #22
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00181$
00180$:
;	./../../mib/stm8s_mib_debug_mem.c: 327: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 328: return FALSE;
	clrw	x
	jp	00235$
00181$:
;	./../../mib/stm8s_mib_debug_mem.c: 331: if (memcmp((char *)dest, (char *)src, (len)) == 0) ccprintf(_DEBUG_CMD_A_, ("equil.\r\n"));
	ldw	x, (0x16, sp)
	ldw	y, (0x12, sp)
	ldw	(0x28, sp), y
	ldw	y, (0x0e, sp)
	pushw	x
	ldw	x, (0x2a, sp)
	pushw	x
	ldw	x, y
	call	_memcmp
	tnzw	x
	jrne	00185$
	push	#<(__str_23+0)
	push	#((__str_23+0) >> 8)
	call	_mib_printf
	addw	sp, #2
	jp	00216$
00185$:
;	./../../mib/stm8s_mib_debug_mem.c: 332: else ccprintf(_DEBUG_CMD_A_, ("not equil.\r\n"));		
	push	#<(__str_24+0)
	push	#((__str_24+0) >> 8)
	call	_mib_printf
	addw	sp, #2
	jp	00216$
00197$:
;	./../../mib/stm8s_mib_debug_mem.c: 334: else if (!strcmp(argv[1], "set")) // _CMD_MY_MEMSET_
	ldw	x, (0x26, sp)
	ldw	x, (x)
	push	#<(___str_25+0)
	push	#((___str_25+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00194$
;	./../../mib/stm8s_mib_debug_mem.c: 336: if (argc < 5)
	ldw	x, (0x2c, sp)
	cpw	x, #0x0005
	jrsge	00188$
;	./../../mib/stm8s_mib_debug_mem.c: 338: MibWriteDebugString(cptr->usage);
	ldw	x, (0x24, sp)
	ldw	x, (0x4, x)
	call	_MibWriteDebugString
;	./../../mib/stm8s_mib_debug_mem.c: 339: return FALSE;
	clrw	x
	jp	00235$
00188$:
;	./../../mib/stm8s_mib_debug_mem.c: 341: if (!HexToInt(argv[2], &addr, 32) || !HexToInt(argv[3], &c, 8) || !HexToInt(argv[4], &len, 32))
	ldw	y, (0x2e, sp)
	ldw	y, (0x4, y)
	push	#0x20
	push	#0x00
	ldw	x, sp
	addw	x, #3
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jreq	00189$
	ldw	y, (0x2e, sp)
	ldw	y, (0x6, y)
	push	#0x08
	push	#0x00
	ldw	x, sp
	addw	x, #7
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jreq	00189$
	ldw	y, (0x2e, sp)
	ldw	y, (0x8, y)
	push	#0x20
	push	#0x00
	ldw	x, sp
	addw	x, #22
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00190$
00189$:
;	./../../mib/stm8s_mib_debug_mem.c: 343: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_mem.c: 344: return FALSE;
	clrw	x
	jra	00235$
00190$:
;	./../../mib/stm8s_mib_debug_mem.c: 346: memset((void *)addr, c, len);
	ldw	x, (0x16, sp)
	ld	a, (0x05, sp)
	ld	(0x29, sp), a
	clr	(0x28, sp)
	ldw	y, (0x03, sp)
	pushw	x
	ldw	x, (0x2a, sp)
	pushw	x
	ldw	x, y
	call	_memset
	jra	00216$
00194$:
;	./../../mib/stm8s_mib_debug_mem.c: 350: MibWriteDebugString(cptr->usage);
	ldw	x, (0x24, sp)
	ldw	x, (0x4, x)
	call	_MibWriteDebugString
;	./../../mib/stm8s_mib_debug_mem.c: 351: return FALSE;
	clrw	x
	jra	00235$
00301$:
	ldw	y, (0x28, sp)
	ldw	(0x1a, sp), y
	ldw	y, (0x26, sp)
	ldw	(0x18, sp), y
	jra	00216$
00302$:
	ldw	y, (0x28, sp)
	ldw	(0x1a, sp), y
	ldw	y, (0x26, sp)
	ldw	(0x18, sp), y
	jra	00216$
00303$:
	ldw	y, (0x28, sp)
	ldw	(0x1a, sp), y
	ldw	y, (0x26, sp)
	ldw	(0x18, sp), y
00216$:
;	./../../mib/stm8s_mib_debug_mem.c: 353: return TRUE;
	clrw	x
	incw	x
00235$:
;	./../../mib/stm8s_mib_debug_mem.c: 354: }
	ldw	y, (42, sp)
	addw	sp, #47
	jp	(y)
	.area CODE
	.area CONST
	.area CONST
__str_0:
	.ascii "INFO:+cmd_mem..."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_1:
	.ascii "INFO:-cmd_mem..."
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
	.ascii "Illugal character is useqd."
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
	.db 0x09
	.ascii "address : 0x%08lx  "
	.db 0x00
	.area CODE
	.area CONST
__str_7:
	.db 0x09
	.ascii "value   : "
	.db 0x00
	.area CODE
	.area CONST
__str_8:
	.ascii "0x%02x "
	.db 0x00
	.area CODE
	.area CONST
__str_9:
	.ascii "0x%04x"
	.db 0x00
	.area CODE
	.area CONST
__str_10:
	.ascii "0x%08lx"
	.db 0x00
	.area CODE
	.area CONST
__str_11:
	.ascii "Error."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_12:
	.ascii "."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_13:
	.ascii "wrn"
	.db 0x00
	.area CODE
	.area CONST
___str_14:
	.ascii "rdn"
	.db 0x00
	.area CODE
	.area CONST
__str_15:
	.ascii "loop : 0x%08lx  "
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_16:
	.ascii "value   : "
	.db 0x00
	.area CODE
	.area CONST
__str_17:
	.ascii "0x%04x "
	.db 0x00
	.area CODE
	.area CONST
__str_18:
	.ascii "0x%08lx "
	.db 0x00
	.area CODE
	.area CONST
___str_19:
	.ascii "hdump"
	.db 0x00
	.area CODE
	.area CONST
___str_20:
	.ascii "cpy"
	.db 0x00
	.area CODE
	.area CONST
__str_21:
	.ascii "Illegal character is used."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_22:
	.ascii "cmp"
	.db 0x00
	.area CODE
	.area CONST
__str_23:
	.ascii "equil."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_24:
	.ascii "not equil."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_25:
	.ascii "set"
	.db 0x00
	.area CODE
	.area CONST
___str_26:
	.ascii "mem"
	.db 0x00
	.area CODE
	.area CONST
___str_27:
	.ascii "  mem {cpy}   [dest] [src]   [len] Copy to SDRAM from Flash "
	.ascii "or SDRAM."
	.db 0x0d
	.db 0x0a
	.ascii "  mem {cmp}   [add1] [add2]  [len] Compare data in addr1 and"
	.ascii " addr2."
	.db 0x0d
	.db 0x0a
	.ascii "  mem {set}   [addr] [value] [len] Fill Memory with value."
	.db 0x0d
	.db 0x0a
	.ascii "  mem {hdump} [addr] [len]         Dump Memory."
	.db 0x0d
	.db 0x0a
	.ascii "  mem {wrn} {c/s/l} [addr] [value] [loop]  Wrn in addr. c:8 "
	.ascii "s:16 l:32 bits."
	.db 0x0d
	.db 0x0a
	.ascii "  mem {rdn}  {c/s/l} [addr] [loop]   Rdn in addr. c:8 s:16 l"
	.ascii ":32 bits."
	.db 0x0d
	.db 0x0a
	.ascii "  mem {write} {c/s/l} [addr] [value]  Write in addr. c:8 s:1"
	.ascii "6 l:32 bits."
	.db 0x0d
	.db 0x0a
	.ascii "  mem {read}  {c/s/l} [addr]          Read in addr. c:8 s:16"
	.ascii " l:32 bits."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area INITIALIZER
__xinit__cmdTbl_only:
	.dw ___str_26
	.dw _DoMem
	.dw ___str_27
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.area CABS (ABS)
