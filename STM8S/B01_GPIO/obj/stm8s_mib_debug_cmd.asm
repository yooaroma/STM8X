;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_mib_debug_cmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _getdec
	.globl _mib_printf
	.globl _MibGetSecs
	.globl _MibReadDebugByte
	.globl _MibWriteDebugString
	.globl _MibWriteDebugByte
	.globl ___memcpy
	.globl _strlen
	.globl _memset
	.globl _strncmp
	.globl _cmdTbl
	.globl _cmd_list
	.globl _GetCommand
	.globl _GetArgs
	.globl _HexToInt
	.globl _DecToLong
	.globl _HexDump
	.globl _DoPrintHelp
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_cmd_list::
	.ds 258
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_cmdTbl::
	.ds 36
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
;	./../../mib/stm8s_mib_debug_cmd.c: 85: int GetCommand(char *cmd, uint16_t len, uint8_t timeout)
;	-----------------------------------------
;	 function GetCommand
;	-----------------------------------------
_GetCommand:
	sub	sp, #16
	ldw	(0x0d, sp), x
;	./../../mib/stm8s_mib_debug_cmd.c: 88: uint16_t vwIndex, rdCnt, rdMax = len - 1;
	ldw	x, (0x13, sp)
	decw	x
	ldw	(0x01, sp), x
;	./../../mib/stm8s_mib_debug_cmd.c: 91: endTime = MibGetSecs() + (uint16_t)timeout;
	call	_MibGetSecs
	ld	a, (0x15, sp)
	ld	(0x10, sp), a
	clr	(0x0f, sp)
	addw	x, (0x0f, sp)
	ldw	(0x03, sp), x
;	./../../mib/stm8s_mib_debug_cmd.c: 92: cmd_list.cur = cmd_list.next;
	ld	a, _cmd_list+1
	ld	_cmd_list+0, a
;	./../../mib/stm8s_mib_debug_cmd.c: 93: for (rdCnt = 0, vwIndex = 0; rdCnt <= rdMax;)
	clrw	x
	ldw	(0x0f, sp), x
00149$:
	ldw	x, (0x0f, sp)
	cpw	x, (0x01, sp)
	jrule	00243$
	jp	00147$
00243$:
;	./../../mib/stm8s_mib_debug_cmd.c: 96: while (1)
00106$:
;	./../../mib/stm8s_mib_debug_cmd.c: 98: vwCh = MibReadDebugByte();
	call	_MibReadDebugByte
;	./../../mib/stm8s_mib_debug_cmd.c: 99: if (vwCh != 0xffff)	break;
	ldw	(0x05, sp), x
	ldw	(0x07, sp), x
;	./../../mib/stm8s_mib_debug_cmd.c: 102: cmd[rdCnt++] = '\0';
	ldw	x, (0x0f, sp)
	incw	x
	ldw	(0x09, sp), x
;	./../../mib/stm8s_mib_debug_cmd.c: 104: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
	ldw	y, (0x0d, sp)
	ldw	(0x0b, sp), y
;	./../../mib/stm8s_mib_debug_cmd.c: 99: if (vwCh != 0xffff)	break;
	ldw	x, (0x07, sp)
	incw	x
	jrne	00107$
;	./../../mib/stm8s_mib_debug_cmd.c: 100: if (MibGetSecs() > endTime)
	call	_MibGetSecs
	cpw	x, (0x03, sp)
	jrule	00106$
;	./../../mib/stm8s_mib_debug_cmd.c: 102: cmd[rdCnt++] = '\0';
	ldw	x, (0x0f, sp)
	ldw	y, (0x09, sp)
	ldw	(0x0f, sp), y
	addw	x, (0x0d, sp)
	clr	(x)
;	./../../mib/stm8s_mib_debug_cmd.c: 103: memset(cmd_list.buf[cmd_list.next], 0, CMD_CHAR_MAX);
	ld	a, _cmd_list+1
	ld	xl, a
	ld	a, #0x40
	mul	x, a
	addw	x, #(_cmd_list+2)
	push	#0x40
	push	#0x00
	push	#0x00
	push	#0x00
	call	_memset
;	./../../mib/stm8s_mib_debug_cmd.c: 104: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
	ldw	x, (0x0d, sp)
	call	_strlen
	exgw	x, y
	ld	a, _cmd_list+1
	ld	xl, a
	ld	a, #0x40
	mul	x, a
	addw	x, #(_cmd_list+2)
	pushw	y
	ldw	y, (0x0d, sp)
	pushw	y
	call	___memcpy
;	./../../mib/stm8s_mib_debug_cmd.c: 105: cmd_list.next = (cmd_list.next + 1) % CMD_LINE_MAX;
	ld	a, _cmd_list+1
	clrw	x
	ld	xl, a
	incw	x
	push	#0x04
	push	#0x00
	call	__modsint
	ld	a, xl
	ld	_cmd_list+1, a
;	./../../mib/stm8s_mib_debug_cmd.c: 106: return rdCnt;
	ldw	x, (0x0f, sp)
	jp	00151$
00107$:
;	./../../mib/stm8s_mib_debug_cmd.c: 112: if ((vwCh == '\r') || (vwCh == '\n') || (vwCh == '@'))
	ldw	x, (0x07, sp)
	cpw	x, #0x000d
	jreq	00142$
	ldw	x, (0x07, sp)
	cpw	x, #0x000a
	jreq	00142$
	ldw	x, (0x07, sp)
	cpw	x, #0x0040
	jrne	00143$
00142$:
;	./../../mib/stm8s_mib_debug_cmd.c: 114: cmd[rdCnt++] = '\0';
	ldw	x, (0x0f, sp)
	ldw	y, (0x09, sp)
	ldw	(0x0f, sp), y
	addw	x, (0x0d, sp)
	clr	(x)
;	./../../mib/stm8s_mib_debug_cmd.c: 115: memset(cmd_list.buf[cmd_list.next], 0, CMD_CHAR_MAX);
	ld	a, _cmd_list+1
	ld	xl, a
	ld	a, #0x40
	mul	x, a
	addw	x, #(_cmd_list+2)
	push	#0x40
	push	#0x00
	push	#0x00
	push	#0x00
	call	_memset
;	./../../mib/stm8s_mib_debug_cmd.c: 116: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
	ldw	x, (0x0d, sp)
	call	_strlen
	exgw	x, y
	ld	a, _cmd_list+1
	ld	xl, a
	ld	a, #0x40
	mul	x, a
	addw	x, #(_cmd_list+2)
	pushw	y
	ldw	y, (0x0d, sp)
	pushw	y
	call	___memcpy
;	./../../mib/stm8s_mib_debug_cmd.c: 117: cmd_list.next = (cmd_list.next + 1) % CMD_LINE_MAX;
	ld	a, _cmd_list+1
	clrw	x
	ld	xl, a
	incw	x
	push	#0x04
	push	#0x00
	call	__modsint
	ld	a, xl
	ld	_cmd_list+1, a
;	./../../mib/stm8s_mib_debug_cmd.c: 119: mib_printf("\r\n");
	push	#<(___str_0+0)
	push	#((___str_0+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_cmd.c: 120: return rdCnt;
	ldw	x, (0x0f, sp)
	jp	00151$
00143$:
;	./../../mib/stm8s_mib_debug_cmd.c: 122: else if (vwCh == '\b')
	ldw	x, (0x07, sp)
	cpw	x, #0x0008
	jrne	00140$
;	./../../mib/stm8s_mib_debug_cmd.c: 124: if (rdCnt > 0)
	ldw	x, (0x0f, sp)
	jrne	00260$
	jp	00149$
00260$:
;	./../../mib/stm8s_mib_debug_cmd.c: 126: rdCnt--;
	ldw	x, (0x0f, sp)
	decw	x
	ldw	(0x0f, sp), x
;	./../../mib/stm8s_mib_debug_cmd.c: 128: mib_printf("\b \b");
	push	#<(___str_1+0)
	push	#((___str_1+0) >> 8)
	call	_mib_printf
	addw	sp, #2
	jp	00149$
00140$:
;	./../../mib/stm8s_mib_debug_cmd.c: 131: else if (vwCh == 0x1b)
	ldw	x, (0x07, sp)
	cpw	x, #0x001b
	jreq	00263$
	jp	00137$
00263$:
;	./../../mib/stm8s_mib_debug_cmd.c: 134: while (1)
00113$:
;	./../../mib/stm8s_mib_debug_cmd.c: 136: vwCh = MibReadDebugByte();
	call	_MibReadDebugByte
;	./../../mib/stm8s_mib_debug_cmd.c: 137: if (vwCh != 0xffff)
	cpw	x, #0xffff
	jreq	00113$
;	./../../mib/stm8s_mib_debug_cmd.c: 140: if (vwCh == '[')
	cpw	x, #0x005b
	jreq	00269$
	jp	00149$
00269$:
;	./../../mib/stm8s_mib_debug_cmd.c: 143: while (1)
00118$:
;	./../../mib/stm8s_mib_debug_cmd.c: 145: vwCh = MibReadDebugByte();
	call	_MibReadDebugByte
;	./../../mib/stm8s_mib_debug_cmd.c: 146: if (vwCh != 0xffff)
	ldw	(0x09, sp), x
	incw	x
	jreq	00118$
;	./../../mib/stm8s_mib_debug_cmd.c: 150: if (vwCh == 'B')
	ldw	x, (0x09, sp)
	cpw	x, #0x0042
	jrne	00132$
;	./../../mib/stm8s_mib_debug_cmd.c: 152: cmd_list.cur++;
	ld	a, _cmd_list+0
	inc	a
	ld	_cmd_list+0, a
;	./../../mib/stm8s_mib_debug_cmd.c: 153: if (cmd_list.cur == CMD_LINE_MAX)
	cp	a, #0x04
	jrne	00121$
;	./../../mib/stm8s_mib_debug_cmd.c: 154: cmd_list.cur = 0;
	mov	_cmd_list+0, #0x00
00121$:
;	./../../mib/stm8s_mib_debug_cmd.c: 155: rdCnt = strlen(cmd_list.buf[cmd_list.cur]);
	ld	a, _cmd_list+0
	ld	xl, a
	ld	a, #0x40
	mul	x, a
	addw	x, #(_cmd_list+2)
	call	_strlen
;	./../../mib/stm8s_mib_debug_cmd.c: 156: if (rdCnt >= rdMax)
	ldw	(0x0f, sp), x
	cpw	x, (0x01, sp)
	jrc	00123$
;	./../../mib/stm8s_mib_debug_cmd.c: 157: rdCnt = rdMax;
	ldw	y, (0x01, sp)
	ldw	(0x0f, sp), y
00123$:
;	./../../mib/stm8s_mib_debug_cmd.c: 158: memcpy(cmd, cmd_list.buf[cmd_list.cur], rdCnt);
	ldw	y, (0x0f, sp)
	ld	a, _cmd_list+0
	ld	xl, a
	ld	a, #0x40
	mul	x, a
	addw	x, #(_cmd_list+2)
	pushw	y
	pushw	x
	ldw	x, (0x0f, sp)
	call	___memcpy
;	./../../mib/stm8s_mib_debug_cmd.c: 159: cmd[rdCnt] = 0;
	ldw	x, (0x0d, sp)
	addw	x, (0x0f, sp)
	clr	(x)
;	./../../mib/stm8s_mib_debug_cmd.c: 161: MibWriteDebugString(cmd);
	ldw	x, (0x0d, sp)
	call	_MibWriteDebugString
	jp	00149$
00132$:
;	./../../mib/stm8s_mib_debug_cmd.c: 163: else if (vwCh == 'A')
	ldw	x, (0x09, sp)
	cpw	x, #0x0041
	jreq	00282$
	jp	00149$
00282$:
;	./../../mib/stm8s_mib_debug_cmd.c: 152: cmd_list.cur++;
;	./../../mib/stm8s_mib_debug_cmd.c: 165: if (cmd_list.cur == 0)
	ld	a, _cmd_list+0
	jrne	00125$
;	./../../mib/stm8s_mib_debug_cmd.c: 166: cmd_list.cur = CMD_LINE_MAX - 1;
	mov	_cmd_list+0, #0x03
	jra	00126$
00125$:
;	./../../mib/stm8s_mib_debug_cmd.c: 168: cmd_list.cur--;
	dec	a
	ld	_cmd_list+0, a
00126$:
;	./../../mib/stm8s_mib_debug_cmd.c: 169: rdCnt = strlen(cmd_list.buf[cmd_list.cur]);
	ld	a, _cmd_list+0
	ld	xl, a
	ld	a, #0x40
	mul	x, a
	addw	x, #(_cmd_list+2)
	call	_strlen
;	./../../mib/stm8s_mib_debug_cmd.c: 170: if (rdCnt >= rdMax)
	ldw	(0x0f, sp), x
	cpw	x, (0x01, sp)
	jrc	00128$
;	./../../mib/stm8s_mib_debug_cmd.c: 171: rdCnt = rdMax;
	ldw	y, (0x01, sp)
	ldw	(0x0f, sp), y
00128$:
;	./../../mib/stm8s_mib_debug_cmd.c: 172: memcpy(cmd, cmd_list.buf[cmd_list.cur], rdCnt);
	ldw	y, (0x0f, sp)
	ld	a, _cmd_list+0
	ld	xl, a
	ld	a, #0x40
	mul	x, a
	addw	x, #(_cmd_list+2)
	pushw	y
	pushw	x
	ldw	x, (0x0f, sp)
	call	___memcpy
;	./../../mib/stm8s_mib_debug_cmd.c: 173: cmd[rdCnt] = 0;
	ldw	x, (0x0d, sp)
	addw	x, (0x0f, sp)
	clr	(x)
;	./../../mib/stm8s_mib_debug_cmd.c: 175: MibWriteDebugString(cmd);
	ldw	x, (0x0d, sp)
	call	_MibWriteDebugString
	jp	00149$
00137$:
;	./../../mib/stm8s_mib_debug_cmd.c: 181: cmd[rdCnt++] = vwCh;
	ldw	x, (0x0f, sp)
	ldw	y, (0x09, sp)
	ldw	(0x0f, sp), y
	addw	x, (0x0d, sp)
	ld	a, (0x06, sp)
	ld	(x), a
;	./../../mib/stm8s_mib_debug_cmd.c: 183: MibWriteDebugByte(vwCh);
	call	_MibWriteDebugByte
	jp	00149$
00147$:
;	./../../mib/stm8s_mib_debug_cmd.c: 186: return (rdCnt);
	ldw	x, (0x0f, sp)
00151$:
;	./../../mib/stm8s_mib_debug_cmd.c: 187: } // GetCommand.
	ldw	y, (17, sp)
	addw	sp, #21
	jp	(y)
;	./../../mib/stm8s_mib_debug_cmd.c: 197: int GetArgs(char *s, char **argv)
;	-----------------------------------------
;	 function GetArgs
;	-----------------------------------------
_GetArgs:
	sub	sp, #8
	ldw	(0x05, sp), x
;	./../../mib/stm8s_mib_debug_cmd.c: 199: int args = 0;
	clrw	x
	ldw	(0x01, sp), x
;	./../../mib/stm8s_mib_debug_cmd.c: 201: if (!s || *s == '\0')
	ldw	x, (0x05, sp)
	jreq	00101$
	ld	a, (x)
	jrne	00131$
00101$:
;	./../../mib/stm8s_mib_debug_cmd.c: 202: return 0;
	clrw	x
	jra	00120$
;	./../../mib/stm8s_mib_debug_cmd.c: 203: while (args < MAX_ARGS)
00131$:
	clrw	x
	ldw	(0x07, sp), x
00117$:
	ldw	x, (0x07, sp)
	cpw	x, #0x0005
	jrsge	00119$
;	./../../mib/stm8s_mib_debug_cmd.c: 206: while ((*s == ' ') || (*s == '\t'))
	ldw	x, (0x05, sp)
00105$:
	ld	a, (x)
	cp	a, #0x20
	jreq	00106$
	cp	a, #0x09
	jrne	00107$
00106$:
;	./../../mib/stm8s_mib_debug_cmd.c: 207: s++;
	incw	x
	jra	00105$
00107$:
;	./../../mib/stm8s_mib_debug_cmd.c: 210: if (*s == '\0')
	tnz	a
	jrne	00109$
;	./../../mib/stm8s_mib_debug_cmd.c: 212: argv[args] = 0;
	ldw	x, (0x01, sp)
	sllw	x
	addw	x, (0x0b, sp)
	clr	(0x1, x)
	clr	(x)
;	./../../mib/stm8s_mib_debug_cmd.c: 213: return args;
	ldw	x, (0x01, sp)
	jra	00120$
00109$:
;	./../../mib/stm8s_mib_debug_cmd.c: 216: argv[args++] = s;
	ldw	y, (0x07, sp)
	ldw	(0x03, sp), y
	ldw	y, (0x07, sp)
	incw	y
	ldw	(0x07, sp), y
	ldw	(0x01, sp), y
	ldw	y, (0x03, sp)
	sllw	y
	addw	y, (0x0b, sp)
	ldw	(y), x
;	./../../mib/stm8s_mib_debug_cmd.c: 219: while (*s && (*s != ' ') && (*s != '\t'))
	ldw	(0x05, sp), x
00112$:
	ldw	x, (0x05, sp)
	ld	a, (x)
;	./../../mib/stm8s_mib_debug_cmd.c: 220: s++;
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x03, sp), x
;	./../../mib/stm8s_mib_debug_cmd.c: 219: while (*s && (*s != ' ') && (*s != '\t'))
	tnz	a
	jreq	00114$
	cp	a, #0x20
	jreq	00114$
	cp	a, #0x09
	jreq	00114$
;	./../../mib/stm8s_mib_debug_cmd.c: 220: s++;
	ldw	y, (0x03, sp)
	ldw	(0x05, sp), y
	jra	00112$
00114$:
;	./../../mib/stm8s_mib_debug_cmd.c: 222: if (*s == '\0')
	tnz	a
	jrne	00116$
;	./../../mib/stm8s_mib_debug_cmd.c: 224: argv[args] = 0;
	ldw	x, (0x01, sp)
	sllw	x
	addw	x, (0x0b, sp)
	clr	(0x1, x)
	clr	(x)
;	./../../mib/stm8s_mib_debug_cmd.c: 225: return args;
	ldw	x, (0x01, sp)
	jra	00120$
00116$:
;	./../../mib/stm8s_mib_debug_cmd.c: 227: *s++ = '\0';
	ldw	x, (0x05, sp)
	clr	(x)
	ldw	y, (0x03, sp)
	ldw	(0x05, sp), y
	jra	00117$
00119$:
;	./../../mib/stm8s_mib_debug_cmd.c: 229: return args;
	ldw	x, (0x01, sp)
00120$:
;	./../../mib/stm8s_mib_debug_cmd.c: 230: } // GetArgs.
	addw	sp, #8
	popw	y
	addw	sp, #2
	jp	(y)
;	./../../mib/stm8s_mib_debug_cmd.c: 241: int HexToInt(char *s, void *retval, uint16_t type)
;	-----------------------------------------
;	 function HexToInt
;	-----------------------------------------
_HexToInt:
	sub	sp, #14
;	./../../mib/stm8s_mib_debug_cmd.c: 247: if (!s || !retval)
	ldw	(0x0a, sp), x
	jreq	00101$
	ldw	x, (0x11, sp)
	jrne	00102$
00101$:
;	./../../mib/stm8s_mib_debug_cmd.c: 248: return FALSE;
	clrw	x
	jp	00132$
00102$:
;	./../../mib/stm8s_mib_debug_cmd.c: 249: if (!strncmp(s, "0x", 2))
	push	#0x02
	push	#0x00
	push	#<(___str_2+0)
	push	#((___str_2+0) >> 8)
	ldw	x, (0x0e, sp)
	call	_strncmp
	tnzw	x
	jrne	00105$
;	./../../mib/stm8s_mib_debug_cmd.c: 250: s += 2;
	ldw	x, (0x0a, sp)
	incw	x
	incw	x
	ldw	(0x0a, sp), x
00105$:
;	./../../mib/stm8s_mib_debug_cmd.c: 252: for (i = 0, rval = 0; i < type / 4; i++)
	clr	(0x01, sp)
	clrw	x
	ldw	(0x04, sp), x
	ldw	(0x02, sp), x
	ldw	y, (0x0a, sp)
	ldw	(0x0c, sp), y
	clr	(0x0e, sp)
00130$:
	ldw	y, (0x13, sp)
	ldw	(0x06, sp), y
	ldw	x, y
	srlw	x
	srlw	x
	ldw	(0x08, sp), x
	ld	a, (0x0e, sp)
	clrw	x
	ld	xl, a
	cpw	x, (0x08, sp)
	jrnc	00123$
;	./../../mib/stm8s_mib_debug_cmd.c: 254: if (*s == '\0')
	ldw	x, (0x0c, sp)
	ld	a, (x)
	jrne	00110$
;	./../../mib/stm8s_mib_debug_cmd.c: 256: if (i == 0)
	tnz	(0x01, sp)
	jrne	00123$
;	./../../mib/stm8s_mib_debug_cmd.c: 257: return FALSE;
	clrw	x
	jp	00132$
;	./../../mib/stm8s_mib_debug_cmd.c: 259: break;
00110$:
;	./../../mib/stm8s_mib_debug_cmd.c: 261: c = *s++;
	ldw	x, (0x0c, sp)
	incw	x
	ldw	(0x0c, sp), x
;	./../../mib/stm8s_mib_debug_cmd.c: 264: c -= '0';
	ld	xl, a
;	./../../mib/stm8s_mib_debug_cmd.c: 263: if (c >= '0' && c <= '9')
	cp	a, #0x30
	jrc	00120$
	cp	a, #0x39
	jrugt	00120$
;	./../../mib/stm8s_mib_debug_cmd.c: 264: c -= '0';
	ld	a, xl
	sub	a, #0x30
	jra	00121$
00120$:
;	./../../mib/stm8s_mib_debug_cmd.c: 265: else if (c >= 'a' && c <= 'f')
	cp	a, #0x61
	jrc	00116$
	cp	a, #0x66
	jrugt	00116$
;	./../../mib/stm8s_mib_debug_cmd.c: 266: c = c - 'a' + 10;
	ld	a, xl
	add	a, #0xa9
	jra	00121$
00116$:
;	./../../mib/stm8s_mib_debug_cmd.c: 267: else if (c >= 'A' && c <= 'F')
	cp	a, #0x41
	jrc	00112$
	cp	a, #0x46
	jrugt	00112$
;	./../../mib/stm8s_mib_debug_cmd.c: 268: c = c - 'A' + 10;
	ld	a, xl
	add	a, #0xc9
	jra	00121$
00112$:
;	./../../mib/stm8s_mib_debug_cmd.c: 270: return FALSE;
	clrw	x
	jra	00132$
00121$:
;	./../../mib/stm8s_mib_debug_cmd.c: 272: rval = rval << 4 | c;
	push	a
	ldw	x, (0x05, sp)
	ldw	y, (0x03, sp)
	ld	a, #0x04
00222$:
	sllw	x
	rlcw	y
	dec	a
	jrne	00222$
	pop	a
	clr	(0x08, sp)
	clr	(0x07, sp)
	clr	(0x06, sp)
	pushw	x
	or	a, (2, sp)
	popw	x
	rlwa	x
	or	a, (0x08, sp)
	ld	xh, a
	ld	a, yl
	or	a, (0x07, sp)
	rlwa	y
	or	a, (0x06, sp)
	ld	yh, a
	ldw	(0x04, sp), x
	ldw	(0x02, sp), y
;	./../../mib/stm8s_mib_debug_cmd.c: 252: for (i = 0, rval = 0; i < type / 4; i++)
	inc	(0x0e, sp)
	ld	a, (0x0e, sp)
	ld	(0x01, sp), a
	jp	00130$
00123$:
;	./../../mib/stm8s_mib_debug_cmd.c: 275: switch (type)
	ldw	x, (0x06, sp)
	cpw	x, #0x0008
	jreq	00124$
	ldw	x, (0x06, sp)
	cpw	x, #0x0010
	jreq	00125$
	ldw	x, (0x06, sp)
	cpw	x, #0x0020
	jreq	00126$
	jra	00127$
;	./../../mib/stm8s_mib_debug_cmd.c: 277: case 8:
00124$:
;	./../../mib/stm8s_mib_debug_cmd.c: 278: *(uint8_t *)retval = (uint8_t)rval;
	ldw	x, (0x11, sp)
	ld	a, (0x05, sp)
	ld	(x), a
;	./../../mib/stm8s_mib_debug_cmd.c: 279: break;
	jra	00128$
;	./../../mib/stm8s_mib_debug_cmd.c: 280: case 16:
00125$:
;	./../../mib/stm8s_mib_debug_cmd.c: 281: *(uint16_t *)retval = (uint16_t)rval;
	ldw	x, (0x11, sp)
	ldw	y, (0x04, sp)
	ldw	(x), y
;	./../../mib/stm8s_mib_debug_cmd.c: 282: break;
	jra	00128$
;	./../../mib/stm8s_mib_debug_cmd.c: 283: case 32:
00126$:
;	./../../mib/stm8s_mib_debug_cmd.c: 284: *(uint32_t *)retval = (uint32_t)rval;
	ldw	x, (0x11, sp)
	ldw	y, (0x04, sp)
	ldw	(0x2, x), y
	ldw	y, (0x02, sp)
	ldw	(x), y
;	./../../mib/stm8s_mib_debug_cmd.c: 285: break;
	jra	00128$
;	./../../mib/stm8s_mib_debug_cmd.c: 286: default:
00127$:
;	./../../mib/stm8s_mib_debug_cmd.c: 287: return FALSE;
	clrw	x
;	./../../mib/stm8s_mib_debug_cmd.c: 288: }
;	./../../mib/stm8s_mib_debug_cmd.c: 289: return TRUE;
	.byte 0xc5
00128$:
	clrw	x
	incw	x
00132$:
;	./../../mib/stm8s_mib_debug_cmd.c: 290: } // HexToInt.
	ldw	y, (15, sp)
	addw	sp, #20
	jp	(y)
;	./../../mib/stm8s_mib_debug_cmd.c: 300: int DecToLong(char *s, void *retval, uint16_t type)
;	-----------------------------------------
;	 function DecToLong
;	-----------------------------------------
_DecToLong:
	sub	sp, #14
;	./../../mib/stm8s_mib_debug_cmd.c: 305: if (!s || !s[0] || !retval)
	tnzw	x
	jreq	00101$
	ld	a, (x)
	jreq	00101$
	ldw	y, (0x11, sp)
	jrne	00102$
00101$:
;	./../../mib/stm8s_mib_debug_cmd.c: 306: return FALSE;
	clrw	x
	jra	00117$
00102$:
;	./../../mib/stm8s_mib_debug_cmd.c: 308: for (rval= 0; *s; s++)
	clrw	y
	ldw	(0x09, sp), y
	ldw	(0x0d, sp), x
00115$:
	ldw	x, (0x0d, sp)
	ld	a, (x)
	jreq	00108$
;	./../../mib/stm8s_mib_debug_cmd.c: 310: if (*s < '0' || *s > '9')
	cp	a, #0x30
	jrc	00105$
	cp	a, #0x39
	jrule	00106$
00105$:
;	./../../mib/stm8s_mib_debug_cmd.c: 311: return FALSE;
	clrw	x
	jra	00117$
00106$:
;	./../../mib/stm8s_mib_debug_cmd.c: 312: c = *s - '0';
	sub	a, #0x30
;	./../../mib/stm8s_mib_debug_cmd.c: 313: rval = rval * 10 + c;
	push	a
	pushw	y
	ldw	x, (0x0c, sp)
	pushw	x
	push	#0x0a
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x04, sp), x
	pop	a
	clrw	x
	ldw	(0x05, sp), x
	ld	xl, a
	addw	x, (0x03, sp)
	ld	a, yl
	adc	a, (0x06, sp)
	ld	(0x0a, sp), a
	ld	a, yh
	adc	a, (0x05, sp)
	ld	(0x09, sp), a
	exgw	x, y
;	./../../mib/stm8s_mib_debug_cmd.c: 308: for (rval= 0; *s; s++)
	ldw	x, (0x0d, sp)
	incw	x
	ldw	(0x0d, sp), x
	jra	00115$
00108$:
;	./../../mib/stm8s_mib_debug_cmd.c: 316: switch (type)
	ldw	x, (0x13, sp)
	cpw	x, #0x0008
	jreq	00109$
	cpw	x, #0x0010
	jreq	00110$
	cpw	x, #0x0020
	jreq	00111$
	jra	00112$
;	./../../mib/stm8s_mib_debug_cmd.c: 318: case 8:
00109$:
;	./../../mib/stm8s_mib_debug_cmd.c: 319: *(uint8_t *)retval = (uint8_t)rval;
	ldw	x, (0x11, sp)
	ld	a, yl
	ld	(x), a
;	./../../mib/stm8s_mib_debug_cmd.c: 320: break;
	jra	00113$
;	./../../mib/stm8s_mib_debug_cmd.c: 321: case 16:
00110$:
;	./../../mib/stm8s_mib_debug_cmd.c: 322: *(uint16_t *)retval = (uint16_t)rval;
	ldw	x, (0x11, sp)
	ldw	(x), y
;	./../../mib/stm8s_mib_debug_cmd.c: 323: break;
	jra	00113$
;	./../../mib/stm8s_mib_debug_cmd.c: 324: case 32:
00111$:
;	./../../mib/stm8s_mib_debug_cmd.c: 325: *(uint32_t *)retval = (uint32_t)rval;
	ldw	x, (0x11, sp)
	ldw	(0x2, x), y
	ldw	y, (0x09, sp)
	ldw	(x), y
;	./../../mib/stm8s_mib_debug_cmd.c: 326: break;
	jra	00113$
;	./../../mib/stm8s_mib_debug_cmd.c: 327: default:
00112$:
;	./../../mib/stm8s_mib_debug_cmd.c: 328: return FALSE;
	clrw	x
;	./../../mib/stm8s_mib_debug_cmd.c: 329: }
;	./../../mib/stm8s_mib_debug_cmd.c: 330: return TRUE;
	.byte 0xc5
00113$:
	clrw	x
	incw	x
00117$:
;	./../../mib/stm8s_mib_debug_cmd.c: 331: } // DecToLong.
	ldw	y, (15, sp)
	addw	sp, #20
	jp	(y)
;	./../../mib/stm8s_mib_debug_cmd.c: 340: void HexDump(uint32_t addr, uint32_t len)
;	-----------------------------------------
;	 function HexDump
;	-----------------------------------------
_HexDump:
	sub	sp, #39
;	./../../mib/stm8s_mib_debug_cmd.c: 343: uint32_t endPtr = (addr + len);
	ldw	y, (0x2c, sp)
	addw	y, (0x30, sp)
	ldw	x, (0x2a, sp)
	jrnc	00240$
	incw	x
00240$:
	addw	x, (0x2e, sp)
	ldw	(0x17, sp), y
	ldw	(0x15, sp), x
;	./../../mib/stm8s_mib_debug_cmd.c: 344: int i, remainder = len & 0xf;
	ldw	x, (0x30, sp)
	ld	a, xl
	and	a, #0x0f
	ld	(0x1a, sp), a
	clr	(0x19, sp)
;	./../../mib/stm8s_mib_debug_cmd.c: 350: mib_printf("\r\n");
	push	#<(___str_0+0)
	push	#((___str_0+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_cmd.c: 351: mib_printf("address     Hex Value                                        Ascii value\r\n");
	push	#<(___str_3+0)
	push	#((___str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_cmd.c: 354: p_address = (uint32_t)(addr);
	ldw	x, (0x2c, sp)
	ldw	y, (0x2a, sp)
;	./../../mib/stm8s_mib_debug_cmd.c: 355: p_data_ptr = (uint16_t *)p_data;
;	./../../mib/stm8s_mib_debug_cmd.c: 356: while ((p_address + 16) <= endPtr)
	ldw	(0x1d, sp), x
	ldw	(0x1b, sp), y
00107$:
	ldw	x, (0x1d, sp)
	addw	x, #0x0010
	ldw	(0x21, sp), x
	ld	a, (0x1c, sp)
	adc	a, #0x00
	ld	(0x20, sp), a
	ld	a, (0x1b, sp)
	adc	a, #0x00
	ld	(0x1f, sp), a
	ldw	x, (0x17, sp)
	cpw	x, (0x21, sp)
	ld	a, (0x16, sp)
	sbc	a, (0x20, sp)
	ld	a, (0x15, sp)
	sbc	a, (0x1f, sp)
	jrnc	00241$
	jp	00163$
00241$:
;	./../../mib/stm8s_mib_debug_cmd.c: 358: mib_printf("0x%08lx : ", p_address);
	ldw	x, (0x1d, sp)
	pushw	x
	ldw	x, (0x1d, sp)
	pushw	x
	push	#<(___str_4+0)
	push	#((___str_4+0) >> 8)
	call	_mib_printf
	addw	sp, #6
;	./../../mib/stm8s_mib_debug_cmd.c: 359: for (i = 0; i < 8; i++)
	clrw	x
	ldw	(0x26, sp), x
00120$:
;	./../../mib/stm8s_mib_debug_cmd.c: 361: p_data_ptr[i] = rd_ADDR16(p_address + i * 2);
	ldw	y, (0x26, sp)
	sllw	y
	ldw	x, y
	pushw	x
	ldw	x, sp
	addw	x, #3
	addw	x, (1, sp)
	addw	sp, #2
	ldw	(0x24, sp), y
	ldw	y, (0x1d, sp)
	addw	y, (0x24, sp)
	ldw	y, (y)
	ldw	(x), y
;	./../../mib/stm8s_mib_debug_cmd.c: 362: mib_printf("%02x ", p_data[i * 2]);
	ld	a, (0x27, sp)
	sll	a
	ld	(0x23, sp), a
	ld	(0x25, sp), a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x24, sp), a
	ldw	x, sp
	incw	x
	addw	x, (0x24, sp)
	ld	a, (x)
	clrw	x
	ld	xl, a
	pushw	x
	push	#<(___str_5+0)
	push	#((___str_5+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	./../../mib/stm8s_mib_debug_cmd.c: 363: mib_printf("%02x ", p_data[i * 2 + 1]);
	ld	a, (0x23, sp)
	inc	a
	ld	(0x25, sp), a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x24, sp), a
	ldw	x, sp
	incw	x
	addw	x, (0x24, sp)
	ld	a, (x)
	clrw	x
	ld	xl, a
	pushw	x
	push	#<(___str_5+0)
	push	#((___str_5+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	./../../mib/stm8s_mib_debug_cmd.c: 359: for (i = 0; i < 8; i++)
	ldw	x, (0x26, sp)
	incw	x
	ldw	(0x26, sp), x
	cpw	x, #0x0008
	jrslt	00120$
;	./../../mib/stm8s_mib_debug_cmd.c: 365: mib_printf(" ");
	push	#<(___str_6+0)
	push	#((___str_6+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_cmd.c: 366: for (i = 0; i < 16; i++)
	clrw	x
	ldw	(0x26, sp), x
00122$:
;	./../../mib/stm8s_mib_debug_cmd.c: 368: c = p_data[i];
	ldw	x, sp
	incw	x
	addw	x, (0x26, sp)
	ld	a, (x)
;	./../../mib/stm8s_mib_debug_cmd.c: 369: if (c >= 32 && c <= 125)
	cp	a, #0x20
	jrc	00103$
	cp	a, #0x7d
	jrugt	00103$
;	./../../mib/stm8s_mib_debug_cmd.c: 370: mib_printf("%c", c);
	clrw	x
	ld	xl, a
	pushw	x
	push	#<(___str_7+0)
	push	#((___str_7+0) >> 8)
	call	_mib_printf
	addw	sp, #4
	jra	00123$
00103$:
;	./../../mib/stm8s_mib_debug_cmd.c: 372: mib_printf(".");
	push	#<(___str_8+0)
	push	#((___str_8+0) >> 8)
	call	_mib_printf
	addw	sp, #2
00123$:
;	./../../mib/stm8s_mib_debug_cmd.c: 366: for (i = 0; i < 16; i++)
	ldw	x, (0x26, sp)
	incw	x
	ldw	(0x26, sp), x
	cpw	x, #0x0010
	jrslt	00122$
;	./../../mib/stm8s_mib_debug_cmd.c: 374: p_address += 16;
	ldw	y, (0x21, sp)
	ldw	(0x1d, sp), y
	ldw	y, (0x1f, sp)
	ldw	(0x1b, sp), y
;	./../../mib/stm8s_mib_debug_cmd.c: 376: mib_printf("\r\n");
	push	#<(___str_0+0)
	push	#((___str_0+0) >> 8)
	call	_mib_printf
	addw	sp, #2
	jp	00107$
00163$:
	ldw	y, (0x1d, sp)
	ldw	(0x24, sp), y
	ldw	y, (0x1b, sp)
	ldw	(0x22, sp), y
;	./../../mib/stm8s_mib_debug_cmd.c: 380: if (remainder)
	ldw	x, (0x19, sp)
	jrne	00248$
	jp	00119$
00248$:
;	./../../mib/stm8s_mib_debug_cmd.c: 382: mib_printf("0x%08lx  ", p_address);
	ldw	x, (0x1d, sp)
	pushw	x
	ldw	x, (0x1d, sp)
	pushw	x
	push	#<(___str_9+0)
	push	#((___str_9+0) >> 8)
	call	_mib_printf
	addw	sp, #6
;	./../../mib/stm8s_mib_debug_cmd.c: 383: for (i = 0; i < (remainder >> 1); i++)
	ldw	x, (0x19, sp)
	sraw	x
	ldw	(0x1d, sp), x
	clrw	x
	ldw	(0x26, sp), x
00125$:
	ldw	x, (0x26, sp)
	cpw	x, (0x1d, sp)
	jrsge	00110$
;	./../../mib/stm8s_mib_debug_cmd.c: 385: p_data_ptr[i] = rd_ADDR16(p_address + i * 2);
	ldw	y, (0x26, sp)
	sllw	y
	ldw	x, y
	pushw	x
	ldw	x, sp
	addw	x, #3
	addw	x, (1, sp)
	addw	sp, #2
	ldw	(0x20, sp), y
	ldw	y, (0x24, sp)
	addw	y, (0x20, sp)
	ldw	y, (y)
	ldw	(x), y
;	./../../mib/stm8s_mib_debug_cmd.c: 386: mib_printf("%02x ", p_data[i * 2]);
	ld	a, (0x27, sp)
	sll	a
	ld	(0x1f, sp), a
	ld	(0x21, sp), a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x20, sp), a
	ldw	x, sp
	incw	x
	addw	x, (0x20, sp)
	ld	a, (x)
	clrw	x
	ld	xl, a
	pushw	x
	push	#<(___str_5+0)
	push	#((___str_5+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	./../../mib/stm8s_mib_debug_cmd.c: 387: mib_printf("%02x ", p_data[i * 2 + 1]);
	ld	a, (0x1f, sp)
	inc	a
	ld	(0x21, sp), a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x20, sp), a
	ldw	x, sp
	incw	x
	addw	x, (0x20, sp)
	ld	a, (x)
	clrw	x
	ld	xl, a
	pushw	x
	push	#<(___str_5+0)
	push	#((___str_5+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	./../../mib/stm8s_mib_debug_cmd.c: 383: for (i = 0; i < (remainder >> 1); i++)
	ldw	x, (0x26, sp)
	incw	x
	ldw	(0x26, sp), x
	jra	00125$
00110$:
;	./../../mib/stm8s_mib_debug_cmd.c: 389: for (i = 0; i < (16 - (remainder >> 1) * 2); i++)
	ldw	x, (0x1d, sp)
	sllw	x
	ldw	(0x26, sp), x
	ld	a, #0x10
	sub	a, (0x27, sp)
	ld	(0x25, sp), a
	clr	a
	sbc	a, (0x26, sp)
	ld	(0x24, sp), a
	clrw	x
	ldw	(0x26, sp), x
00128$:
	ldw	x, (0x26, sp)
	cpw	x, (0x24, sp)
	jrsge	00111$
;	./../../mib/stm8s_mib_debug_cmd.c: 391: mib_printf("   ");
	push	#<(___str_10+0)
	push	#((___str_10+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_cmd.c: 389: for (i = 0; i < (16 - (remainder >> 1) * 2); i++)
	ldw	x, (0x26, sp)
	incw	x
	ldw	(0x26, sp), x
	jra	00128$
00111$:
;	./../../mib/stm8s_mib_debug_cmd.c: 393: mib_printf(" ");
	push	#<(___str_6+0)
	push	#((___str_6+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_cmd.c: 394: for (i = 0; i < remainder; i++)
	clrw	x
	ldw	(0x26, sp), x
00131$:
	ldw	x, (0x26, sp)
	cpw	x, (0x19, sp)
	jrsge	00116$
;	./../../mib/stm8s_mib_debug_cmd.c: 396: c = p_data[i];
	ldw	x, sp
	incw	x
	addw	x, (0x26, sp)
	ld	a, (x)
;	./../../mib/stm8s_mib_debug_cmd.c: 397: if (c >= 32 && c <= 125)
	cp	a, #0x20
	jrc	00113$
	cp	a, #0x7d
	jrugt	00113$
;	./../../mib/stm8s_mib_debug_cmd.c: 398: mib_printf("%c", c);
	clrw	x
	ld	xl, a
	pushw	x
	push	#<(___str_7+0)
	push	#((___str_7+0) >> 8)
	call	_mib_printf
	addw	sp, #4
	jra	00132$
00113$:
;	./../../mib/stm8s_mib_debug_cmd.c: 400: mib_printf(".");
	push	#<(___str_8+0)
	push	#((___str_8+0) >> 8)
	call	_mib_printf
	addw	sp, #2
00132$:
;	./../../mib/stm8s_mib_debug_cmd.c: 394: for (i = 0; i < remainder; i++)
	ldw	x, (0x26, sp)
	incw	x
	ldw	(0x26, sp), x
	jra	00131$
00116$:
;	./../../mib/stm8s_mib_debug_cmd.c: 402: for (i = 0; i < (16 - remainder); i++)
	ld	a, #0x10
	sub	a, (0x1a, sp)
	ld	(0x25, sp), a
	clr	a
	sbc	a, (0x19, sp)
	ld	(0x24, sp), a
	clrw	x
	ldw	(0x26, sp), x
00134$:
	ldw	x, (0x26, sp)
	cpw	x, (0x24, sp)
	jrsge	00117$
;	./../../mib/stm8s_mib_debug_cmd.c: 404: mib_printf(" ");
	push	#<(___str_6+0)
	push	#((___str_6+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_cmd.c: 402: for (i = 0; i < (16 - remainder); i++)
	ldw	x, (0x26, sp)
	incw	x
	ldw	(0x26, sp), x
	jra	00134$
00117$:
;	./../../mib/stm8s_mib_debug_cmd.c: 407: mib_printf("\r\n");
	push	#<(___str_0+0)
	push	#((___str_0+0) >> 8)
	call	_mib_printf
	addw	sp, #2
00119$:
;	./../../mib/stm8s_mib_debug_cmd.c: 409: return;
;	./../../mib/stm8s_mib_debug_cmd.c: 410: } // HexDump.
	ldw	x, (40, sp)
	addw	sp, #49
	jp	(x)
;	./../../mib/stm8s_mib_debug_cmd.c: 419: int DoPrintHelp(int argc, char **argv)
;	-----------------------------------------
;	 function DoPrintHelp
;	-----------------------------------------
_DoPrintHelp:
	sub	sp, #2
;	./../../mib/stm8s_mib_debug_cmd.c: 423: if (argc == 1)
	decw	x
	jrne	00105$
;	./../../mib/stm8s_mib_debug_cmd.c: 425: mib_printf("*******\r\n");
	push	#<(___str_11+0)
	push	#((___str_11+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_cmd.c: 426: mib_printf("  help  Help for commands.\r\n");
	push	#<(___str_12+0)
	push	#((___str_12+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_cmd.c: 428: for (cptr = cmdTbl; cptr->cmd; cptr++)
	ldw	x, #(_cmdTbl+0)
	ldw	(0x01, sp), x
00108$:
	ldw	x, (0x01, sp)
	ldw	x, (x)
	jreq	00103$
;	./../../mib/stm8s_mib_debug_cmd.c: 430: if (cptr->usage)
	ldw	x, (0x01, sp)
	ldw	x, (0x4, x)
	jreq	00109$
;	./../../mib/stm8s_mib_debug_cmd.c: 431: MibWriteDebugString(cptr->usage);
	call	_MibWriteDebugString
00109$:
;	./../../mib/stm8s_mib_debug_cmd.c: 428: for (cptr = cmdTbl; cptr->cmd; cptr++)
	ldw	x, (0x01, sp)
	addw	x, #0x0006
	ldw	(0x01, sp), x
	jra	00108$
00103$:
;	./../../mib/stm8s_mib_debug_cmd.c: 433: mib_printf("*******\r\n");
	push	#<(___str_11+0)
	push	#((___str_11+0) >> 8)
	call	_mib_printf
	addw	sp, #2
	jra	00106$
00105$:
;	./../../mib/stm8s_mib_debug_cmd.c: 437: mib_printf("\tUnknown command : ");
	push	#<(___str_13+0)
	push	#((___str_13+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	./../../mib/stm8s_mib_debug_cmd.c: 438: mib_printf("%s", argv[0]);
	ldw	x, (0x05, sp)
	ldw	x, (x)
	pushw	x
	push	#<(___str_14+0)
	push	#((___str_14+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	./../../mib/stm8s_mib_debug_cmd.c: 439: mib_printf("\r\n");
	push	#<(___str_0+0)
	push	#((___str_0+0) >> 8)
	call	_mib_printf
	addw	sp, #2
00106$:
;	./../../mib/stm8s_mib_debug_cmd.c: 441: return TRUE;
	clrw	x
	incw	x
;	./../../mib/stm8s_mib_debug_cmd.c: 442: }
	addw	sp, #2
	popw	y
	addw	sp, #2
	jp	(y)
;	./../../mib/stm8s_mib_debug_cmd.c: 452: int getdec(uint8_t **ptr)
;	-----------------------------------------
;	 function getdec
;	-----------------------------------------
_getdec:
	sub	sp, #6
;	./../../mib/stm8s_mib_debug_cmd.c: 454: uint8_t *p = *ptr;
	ldw	(0x05, sp), x
	ldw	x, (x)
	ldw	(0x01, sp), x
;	./../../mib/stm8s_mib_debug_cmd.c: 455: int ret = 0;
	clrw	x
	ldw	(0x03, sp), x
;	./../../mib/stm8s_mib_debug_cmd.c: 456: if ((*p < '0') || (*p > '9'))
	ldw	x, (0x01, sp)
	ld	a, (x)
	cp	a, #0x30
	jrc	00101$
	cp	a, #0x39
	jrule	00113$
00101$:
;	./../../mib/stm8s_mib_debug_cmd.c: 457: return (-1);
	clrw	x
	decw	x
	jra	00108$
;	./../../mib/stm8s_mib_debug_cmd.c: 458: while ((*p >= '0') && (*p <= '9'))
00113$:
	ldw	y, (0x01, sp)
00105$:
	ld	a, (y)
	cp	a, #0x30
	jrc	00107$
	cp	a, #0x39
	jrugt	00107$
;	./../../mib/stm8s_mib_debug_cmd.c: 460: ret = ret * 10 + (int)(*p - '0');
	ldw	x, (0x03, sp)
	sllw	x
	sllw	x
	addw	x, (0x03, sp)
	sllw	x
	ldw	(0x03, sp), x
	clrw	x
	ld	xl, a
	subw	x, #0x0030
	addw	x, (0x03, sp)
	ldw	(0x03, sp), x
;	./../../mib/stm8s_mib_debug_cmd.c: 461: p++;
	incw	y
	jra	00105$
00107$:
;	./../../mib/stm8s_mib_debug_cmd.c: 463: *ptr = p;
	ldw	x, (0x05, sp)
	ldw	(x), y
;	./../../mib/stm8s_mib_debug_cmd.c: 464: return (ret);
	ldw	x, (0x03, sp)
00108$:
;	./../../mib/stm8s_mib_debug_cmd.c: 465: }
	addw	sp, #6
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_1:
	.db 0x08
	.ascii " "
	.db 0x08
	.db 0x00
	.area CODE
	.area CONST
___str_2:
	.ascii "0x"
	.db 0x00
	.area CODE
	.area CONST
___str_3:
	.ascii "address     Hex Value                                       "
	.ascii " Ascii value"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_4:
	.ascii "0x%08lx : "
	.db 0x00
	.area CODE
	.area CONST
___str_5:
	.ascii "%02x "
	.db 0x00
	.area CODE
	.area CONST
___str_6:
	.ascii " "
	.db 0x00
	.area CODE
	.area CONST
___str_7:
	.ascii "%c"
	.db 0x00
	.area CODE
	.area CONST
___str_8:
	.ascii "."
	.db 0x00
	.area CODE
	.area CONST
___str_9:
	.ascii "0x%08lx  "
	.db 0x00
	.area CODE
	.area CONST
___str_10:
	.ascii "   "
	.db 0x00
	.area CODE
	.area CONST
___str_11:
	.ascii "*******"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_12:
	.ascii "  help  Help for commands."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_13:
	.db 0x09
	.ascii "Unknown command : "
	.db 0x00
	.area CODE
	.area CONST
___str_14:
	.ascii "%s"
	.db 0x00
	.area CODE
	.area INITIALIZER
__xinit__cmdTbl:
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.area CABS (ABS)
