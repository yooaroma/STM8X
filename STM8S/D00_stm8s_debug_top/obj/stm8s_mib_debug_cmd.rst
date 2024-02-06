                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_mib_debug_cmd
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _getdec
                                     12 	.globl _mib_printf
                                     13 	.globl _MibGetSecs
                                     14 	.globl _MibReadDebugByte
                                     15 	.globl _MibWriteDebugString
                                     16 	.globl _MibWriteDebugByte
                                     17 	.globl ___memcpy
                                     18 	.globl _strlen
                                     19 	.globl _memset
                                     20 	.globl _strncmp
                                     21 	.globl _cmdTbl
                                     22 	.globl _cmd_list
                                     23 	.globl _GetCommand
                                     24 	.globl _GetArgs
                                     25 	.globl _HexToInt
                                     26 	.globl _DecToLong
                                     27 	.globl _HexDump
                                     28 	.globl _DoPrintHelp
                                     29 ;--------------------------------------------------------
                                     30 ; ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DATA
      000047                         33 _cmd_list::
      000047                         34 	.ds 258
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area INITIALIZED
      00014F                         39 _cmdTbl::
      00014F                         40 	.ds 36
                                     41 ;--------------------------------------------------------
                                     42 ; absolute external ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area DABS (ABS)
                                     45 
                                     46 ; default segment ordering for linker
                                     47 	.area HOME
                                     48 	.area GSINIT
                                     49 	.area GSFINAL
                                     50 	.area CONST
                                     51 	.area INITIALIZER
                                     52 	.area CODE
                                     53 
                                     54 ;--------------------------------------------------------
                                     55 ; global & static initialisations
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
                                     58 	.area GSINIT
                                     59 	.area GSFINAL
                                     60 	.area GSINIT
                                     61 ;--------------------------------------------------------
                                     62 ; Home
                                     63 ;--------------------------------------------------------
                                     64 	.area HOME
                                     65 	.area HOME
                                     66 ;--------------------------------------------------------
                                     67 ; code
                                     68 ;--------------------------------------------------------
                                     69 	.area CODE
                                     70 ;	./../../mib/stm8s_mib_debug_cmd.c: 57: int GetCommand(char *cmd, uint16_t len, uint8_t timeout)
                                     71 ;	-----------------------------------------
                                     72 ;	 function GetCommand
                                     73 ;	-----------------------------------------
      0091D9                         74 _GetCommand:
      0091D9 52 10            [ 2]   75 	sub	sp, #16
      0091DB 1F 0D            [ 2]   76 	ldw	(0x0d, sp), x
                                     77 ;	./../../mib/stm8s_mib_debug_cmd.c: 60: uint16_t vwIndex, rdCnt, rdMax = len - 1;
      0091DD 1E 13            [ 2]   78 	ldw	x, (0x13, sp)
      0091DF 5A               [ 2]   79 	decw	x
      0091E0 1F 01            [ 2]   80 	ldw	(0x01, sp), x
                                     81 ;	./../../mib/stm8s_mib_debug_cmd.c: 63: endTime = MibGetSecs() + (uint16_t)timeout;
      0091E2 CD 91 D5         [ 4]   82 	call	_MibGetSecs
      0091E5 7B 15            [ 1]   83 	ld	a, (0x15, sp)
      0091E7 6B 10            [ 1]   84 	ld	(0x10, sp), a
      0091E9 0F 0F            [ 1]   85 	clr	(0x0f, sp)
      0091EB 72 FB 0F         [ 2]   86 	addw	x, (0x0f, sp)
      0091EE 1F 03            [ 2]   87 	ldw	(0x03, sp), x
                                     88 ;	./../../mib/stm8s_mib_debug_cmd.c: 64: cmd_list.cur = cmd_list.next;
      0091F0 C6 00 48         [ 1]   89 	ld	a, _cmd_list+1
      0091F3 C7 00 47         [ 1]   90 	ld	_cmd_list+0, a
                                     91 ;	./../../mib/stm8s_mib_debug_cmd.c: 65: for (rdCnt = 0, vwIndex = 0; rdCnt <= rdMax;)
      0091F6 5F               [ 1]   92 	clrw	x
      0091F7 1F 0F            [ 2]   93 	ldw	(0x0f, sp), x
      0091F9                         94 00148$:
      0091F9 1E 0F            [ 2]   95 	ldw	x, (0x0f, sp)
      0091FB 13 01            [ 2]   96 	cpw	x, (0x01, sp)
      0091FD 23 03            [ 2]   97 	jrule	00237$
      0091FF CC 93 C5         [ 2]   98 	jp	00146$
      009202                         99 00237$:
                                    100 ;	./../../mib/stm8s_mib_debug_cmd.c: 68: while (1)
      009202                        101 00106$:
                                    102 ;	./../../mib/stm8s_mib_debug_cmd.c: 70: vwCh = MibReadDebugByte();
      009202 CD 87 83         [ 4]  103 	call	_MibReadDebugByte
                                    104 ;	./../../mib/stm8s_mib_debug_cmd.c: 71: if (vwCh != 0xffff)	break;
      009205 1F 05            [ 2]  105 	ldw	(0x05, sp), x
      009207 1F 07            [ 2]  106 	ldw	(0x07, sp), x
                                    107 ;	./../../mib/stm8s_mib_debug_cmd.c: 74: cmd[rdCnt++] = '\0';
      009209 1E 0F            [ 2]  108 	ldw	x, (0x0f, sp)
      00920B 5C               [ 1]  109 	incw	x
      00920C 1F 09            [ 2]  110 	ldw	(0x09, sp), x
                                    111 ;	./../../mib/stm8s_mib_debug_cmd.c: 76: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      00920E 16 0D            [ 2]  112 	ldw	y, (0x0d, sp)
      009210 17 0B            [ 2]  113 	ldw	(0x0b, sp), y
                                    114 ;	./../../mib/stm8s_mib_debug_cmd.c: 71: if (vwCh != 0xffff)	break;
      009212 1E 07            [ 2]  115 	ldw	x, (0x07, sp)
      009214 5C               [ 1]  116 	incw	x
      009215 26 55            [ 1]  117 	jrne	00107$
                                    118 ;	./../../mib/stm8s_mib_debug_cmd.c: 72: if (MibGetSecs() > endTime)
      009217 CD 91 D5         [ 4]  119 	call	_MibGetSecs
      00921A 13 03            [ 2]  120 	cpw	x, (0x03, sp)
      00921C 23 E4            [ 2]  121 	jrule	00106$
                                    122 ;	./../../mib/stm8s_mib_debug_cmd.c: 74: cmd[rdCnt++] = '\0';
      00921E 1E 0F            [ 2]  123 	ldw	x, (0x0f, sp)
      009220 16 09            [ 2]  124 	ldw	y, (0x09, sp)
      009222 17 0F            [ 2]  125 	ldw	(0x0f, sp), y
      009224 72 FB 0D         [ 2]  126 	addw	x, (0x0d, sp)
      009227 7F               [ 1]  127 	clr	(x)
                                    128 ;	./../../mib/stm8s_mib_debug_cmd.c: 75: memset(cmd_list.buf[cmd_list.next], 0, CMD_CHAR_MAX);
      009228 C6 00 48         [ 1]  129 	ld	a, _cmd_list+1
      00922B 97               [ 1]  130 	ld	xl, a
      00922C A6 40            [ 1]  131 	ld	a, #0x40
      00922E 42               [ 4]  132 	mul	x, a
      00922F 1C 00 49         [ 2]  133 	addw	x, #(_cmd_list+2)
      009232 4B 40            [ 1]  134 	push	#0x40
      009234 4B 00            [ 1]  135 	push	#0x00
      009236 4B 00            [ 1]  136 	push	#0x00
      009238 4B 00            [ 1]  137 	push	#0x00
      00923A CD A2 34         [ 4]  138 	call	_memset
                                    139 ;	./../../mib/stm8s_mib_debug_cmd.c: 76: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      00923D 1E 0D            [ 2]  140 	ldw	x, (0x0d, sp)
      00923F CD A2 58         [ 4]  141 	call	_strlen
      009242 51               [ 1]  142 	exgw	x, y
      009243 C6 00 48         [ 1]  143 	ld	a, _cmd_list+1
      009246 97               [ 1]  144 	ld	xl, a
      009247 A6 40            [ 1]  145 	ld	a, #0x40
      009249 42               [ 4]  146 	mul	x, a
      00924A 1C 00 49         [ 2]  147 	addw	x, #(_cmd_list+2)
      00924D 90 89            [ 2]  148 	pushw	y
      00924F 16 0D            [ 2]  149 	ldw	y, (0x0d, sp)
      009251 90 89            [ 2]  150 	pushw	y
      009253 CD A1 E1         [ 4]  151 	call	___memcpy
                                    152 ;	./../../mib/stm8s_mib_debug_cmd.c: 77: cmd_list.next = (cmd_list.next + 1) % CMD_LINE_MAX;
      009256 C6 00 48         [ 1]  153 	ld	a, _cmd_list+1
      009259 5F               [ 1]  154 	clrw	x
      00925A 97               [ 1]  155 	ld	xl, a
      00925B 5C               [ 1]  156 	incw	x
      00925C 4B 04            [ 1]  157 	push	#0x04
      00925E 4B 00            [ 1]  158 	push	#0x00
      009260 CD A2 A2         [ 4]  159 	call	__modsint
      009263 9F               [ 1]  160 	ld	a, xl
      009264 C7 00 48         [ 1]  161 	ld	_cmd_list+1, a
                                    162 ;	./../../mib/stm8s_mib_debug_cmd.c: 78: return rdCnt;
      009267 1E 0F            [ 2]  163 	ldw	x, (0x0f, sp)
      009269 CC 93 C7         [ 2]  164 	jp	00150$
      00926C                        165 00107$:
                                    166 ;	./../../mib/stm8s_mib_debug_cmd.c: 84: if ((vwCh == '\r') || (vwCh == '\n'))
      00926C 1E 07            [ 2]  167 	ldw	x, (0x07, sp)
      00926E A3 00 0D         [ 2]  168 	cpw	x, #0x000d
      009271 27 07            [ 1]  169 	jreq	00142$
      009273 1E 07            [ 2]  170 	ldw	x, (0x07, sp)
      009275 A3 00 0A         [ 2]  171 	cpw	x, #0x000a
      009278 26 57            [ 1]  172 	jrne	00143$
      00927A                        173 00142$:
                                    174 ;	./../../mib/stm8s_mib_debug_cmd.c: 86: cmd[rdCnt++] = '\0';
      00927A 1E 0F            [ 2]  175 	ldw	x, (0x0f, sp)
      00927C 16 09            [ 2]  176 	ldw	y, (0x09, sp)
      00927E 17 0F            [ 2]  177 	ldw	(0x0f, sp), y
      009280 72 FB 0D         [ 2]  178 	addw	x, (0x0d, sp)
      009283 7F               [ 1]  179 	clr	(x)
                                    180 ;	./../../mib/stm8s_mib_debug_cmd.c: 87: memset(cmd_list.buf[cmd_list.next], 0, CMD_CHAR_MAX);
      009284 C6 00 48         [ 1]  181 	ld	a, _cmd_list+1
      009287 97               [ 1]  182 	ld	xl, a
      009288 A6 40            [ 1]  183 	ld	a, #0x40
      00928A 42               [ 4]  184 	mul	x, a
      00928B 1C 00 49         [ 2]  185 	addw	x, #(_cmd_list+2)
      00928E 4B 40            [ 1]  186 	push	#0x40
      009290 4B 00            [ 1]  187 	push	#0x00
      009292 4B 00            [ 1]  188 	push	#0x00
      009294 4B 00            [ 1]  189 	push	#0x00
      009296 CD A2 34         [ 4]  190 	call	_memset
                                    191 ;	./../../mib/stm8s_mib_debug_cmd.c: 88: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      009299 1E 0D            [ 2]  192 	ldw	x, (0x0d, sp)
      00929B CD A2 58         [ 4]  193 	call	_strlen
      00929E 51               [ 1]  194 	exgw	x, y
      00929F C6 00 48         [ 1]  195 	ld	a, _cmd_list+1
      0092A2 97               [ 1]  196 	ld	xl, a
      0092A3 A6 40            [ 1]  197 	ld	a, #0x40
      0092A5 42               [ 4]  198 	mul	x, a
      0092A6 1C 00 49         [ 2]  199 	addw	x, #(_cmd_list+2)
      0092A9 90 89            [ 2]  200 	pushw	y
      0092AB 16 0D            [ 2]  201 	ldw	y, (0x0d, sp)
      0092AD 90 89            [ 2]  202 	pushw	y
      0092AF CD A1 E1         [ 4]  203 	call	___memcpy
                                    204 ;	./../../mib/stm8s_mib_debug_cmd.c: 89: cmd_list.next = (cmd_list.next + 1) % CMD_LINE_MAX;
      0092B2 C6 00 48         [ 1]  205 	ld	a, _cmd_list+1
      0092B5 5F               [ 1]  206 	clrw	x
      0092B6 97               [ 1]  207 	ld	xl, a
      0092B7 5C               [ 1]  208 	incw	x
      0092B8 4B 04            [ 1]  209 	push	#0x04
      0092BA 4B 00            [ 1]  210 	push	#0x00
      0092BC CD A2 A2         [ 4]  211 	call	__modsint
      0092BF 9F               [ 1]  212 	ld	a, xl
      0092C0 C7 00 48         [ 1]  213 	ld	_cmd_list+1, a
                                    214 ;	./../../mib/stm8s_mib_debug_cmd.c: 91: mib_printf("\r\n");
      0092C3 4B FE            [ 1]  215 	push	#<(___str_0+0)
      0092C5 4B 81            [ 1]  216 	push	#((___str_0+0) >> 8)
      0092C7 CD 91 73         [ 4]  217 	call	_mib_printf
      0092CA 5B 02            [ 2]  218 	addw	sp, #2
                                    219 ;	./../../mib/stm8s_mib_debug_cmd.c: 92: return rdCnt;
      0092CC 1E 0F            [ 2]  220 	ldw	x, (0x0f, sp)
      0092CE CC 93 C7         [ 2]  221 	jp	00150$
      0092D1                        222 00143$:
                                    223 ;	./../../mib/stm8s_mib_debug_cmd.c: 94: else if (vwCh == '\b')
      0092D1 1E 07            [ 2]  224 	ldw	x, (0x07, sp)
      0092D3 A3 00 08         [ 2]  225 	cpw	x, #0x0008
      0092D6 26 18            [ 1]  226 	jrne	00140$
                                    227 ;	./../../mib/stm8s_mib_debug_cmd.c: 96: if (rdCnt > 0)
      0092D8 1E 0F            [ 2]  228 	ldw	x, (0x0f, sp)
      0092DA 26 03            [ 1]  229 	jrne	00251$
      0092DC CC 91 F9         [ 2]  230 	jp	00148$
      0092DF                        231 00251$:
                                    232 ;	./../../mib/stm8s_mib_debug_cmd.c: 98: rdCnt--;
      0092DF 1E 0F            [ 2]  233 	ldw	x, (0x0f, sp)
      0092E1 5A               [ 2]  234 	decw	x
      0092E2 1F 0F            [ 2]  235 	ldw	(0x0f, sp), x
                                    236 ;	./../../mib/stm8s_mib_debug_cmd.c: 100: mib_printf("\b \b");
      0092E4 4B 01            [ 1]  237 	push	#<(___str_1+0)
      0092E6 4B 82            [ 1]  238 	push	#((___str_1+0) >> 8)
      0092E8 CD 91 73         [ 4]  239 	call	_mib_printf
      0092EB 5B 02            [ 2]  240 	addw	sp, #2
      0092ED CC 91 F9         [ 2]  241 	jp	00148$
      0092F0                        242 00140$:
                                    243 ;	./../../mib/stm8s_mib_debug_cmd.c: 103: else if (vwCh == 0x1b)
      0092F0 1E 07            [ 2]  244 	ldw	x, (0x07, sp)
      0092F2 A3 00 1B         [ 2]  245 	cpw	x, #0x001b
      0092F5 27 03            [ 1]  246 	jreq	00254$
      0092F7 CC 93 B3         [ 2]  247 	jp	00137$
      0092FA                        248 00254$:
                                    249 ;	./../../mib/stm8s_mib_debug_cmd.c: 106: while (1)
      0092FA                        250 00113$:
                                    251 ;	./../../mib/stm8s_mib_debug_cmd.c: 108: vwCh = MibReadDebugByte();
      0092FA CD 87 83         [ 4]  252 	call	_MibReadDebugByte
                                    253 ;	./../../mib/stm8s_mib_debug_cmd.c: 109: if (vwCh != 0xffff)
      0092FD A3 FF FF         [ 2]  254 	cpw	x, #0xffff
      009300 27 F8            [ 1]  255 	jreq	00113$
                                    256 ;	./../../mib/stm8s_mib_debug_cmd.c: 112: if (vwCh == '[')
      009302 A3 00 5B         [ 2]  257 	cpw	x, #0x005b
      009305 27 03            [ 1]  258 	jreq	00260$
      009307 CC 91 F9         [ 2]  259 	jp	00148$
      00930A                        260 00260$:
                                    261 ;	./../../mib/stm8s_mib_debug_cmd.c: 115: while (1)
      00930A                        262 00118$:
                                    263 ;	./../../mib/stm8s_mib_debug_cmd.c: 117: vwCh = MibReadDebugByte();
      00930A CD 87 83         [ 4]  264 	call	_MibReadDebugByte
                                    265 ;	./../../mib/stm8s_mib_debug_cmd.c: 118: if (vwCh != 0xffff)
      00930D 1F 09            [ 2]  266 	ldw	(0x09, sp), x
      00930F 5C               [ 1]  267 	incw	x
      009310 27 F8            [ 1]  268 	jreq	00118$
                                    269 ;	./../../mib/stm8s_mib_debug_cmd.c: 122: if (vwCh == 'B')
      009312 1E 09            [ 2]  270 	ldw	x, (0x09, sp)
      009314 A3 00 42         [ 2]  271 	cpw	x, #0x0042
      009317 26 48            [ 1]  272 	jrne	00132$
                                    273 ;	./../../mib/stm8s_mib_debug_cmd.c: 124: cmd_list.cur++;
      009319 C6 00 47         [ 1]  274 	ld	a, _cmd_list+0
      00931C 4C               [ 1]  275 	inc	a
      00931D C7 00 47         [ 1]  276 	ld	_cmd_list+0, a
                                    277 ;	./../../mib/stm8s_mib_debug_cmd.c: 125: if (cmd_list.cur == CMD_LINE_MAX)
      009320 A1 04            [ 1]  278 	cp	a, #0x04
      009322 26 04            [ 1]  279 	jrne	00121$
                                    280 ;	./../../mib/stm8s_mib_debug_cmd.c: 126: cmd_list.cur = 0;
      009324 35 00 00 47      [ 1]  281 	mov	_cmd_list+0, #0x00
      009328                        282 00121$:
                                    283 ;	./../../mib/stm8s_mib_debug_cmd.c: 127: rdCnt = strlen(cmd_list.buf[cmd_list.cur]);
      009328 C6 00 47         [ 1]  284 	ld	a, _cmd_list+0
      00932B 97               [ 1]  285 	ld	xl, a
      00932C A6 40            [ 1]  286 	ld	a, #0x40
      00932E 42               [ 4]  287 	mul	x, a
      00932F 1C 00 49         [ 2]  288 	addw	x, #(_cmd_list+2)
      009332 CD A2 58         [ 4]  289 	call	_strlen
                                    290 ;	./../../mib/stm8s_mib_debug_cmd.c: 128: if (rdCnt >= rdMax)
      009335 1F 0F            [ 2]  291 	ldw	(0x0f, sp), x
      009337 13 01            [ 2]  292 	cpw	x, (0x01, sp)
      009339 25 04            [ 1]  293 	jrc	00123$
                                    294 ;	./../../mib/stm8s_mib_debug_cmd.c: 129: rdCnt = rdMax;
      00933B 16 01            [ 2]  295 	ldw	y, (0x01, sp)
      00933D 17 0F            [ 2]  296 	ldw	(0x0f, sp), y
      00933F                        297 00123$:
                                    298 ;	./../../mib/stm8s_mib_debug_cmd.c: 130: memcpy(cmd, cmd_list.buf[cmd_list.cur], rdCnt);
      00933F 16 0F            [ 2]  299 	ldw	y, (0x0f, sp)
      009341 C6 00 47         [ 1]  300 	ld	a, _cmd_list+0
      009344 97               [ 1]  301 	ld	xl, a
      009345 A6 40            [ 1]  302 	ld	a, #0x40
      009347 42               [ 4]  303 	mul	x, a
      009348 1C 00 49         [ 2]  304 	addw	x, #(_cmd_list+2)
      00934B 90 89            [ 2]  305 	pushw	y
      00934D 89               [ 2]  306 	pushw	x
      00934E 1E 0F            [ 2]  307 	ldw	x, (0x0f, sp)
      009350 CD A1 E1         [ 4]  308 	call	___memcpy
                                    309 ;	./../../mib/stm8s_mib_debug_cmd.c: 131: cmd[rdCnt] = 0;
      009353 1E 0D            [ 2]  310 	ldw	x, (0x0d, sp)
      009355 72 FB 0F         [ 2]  311 	addw	x, (0x0f, sp)
      009358 7F               [ 1]  312 	clr	(x)
                                    313 ;	./../../mib/stm8s_mib_debug_cmd.c: 133: MibWriteDebugString(cmd);
      009359 1E 0D            [ 2]  314 	ldw	x, (0x0d, sp)
      00935B CD 87 62         [ 4]  315 	call	_MibWriteDebugString
      00935E CC 91 F9         [ 2]  316 	jp	00148$
      009361                        317 00132$:
                                    318 ;	./../../mib/stm8s_mib_debug_cmd.c: 135: else if (vwCh == 'A')
      009361 1E 09            [ 2]  319 	ldw	x, (0x09, sp)
      009363 A3 00 41         [ 2]  320 	cpw	x, #0x0041
      009366 27 03            [ 1]  321 	jreq	00273$
      009368 CC 91 F9         [ 2]  322 	jp	00148$
      00936B                        323 00273$:
                                    324 ;	./../../mib/stm8s_mib_debug_cmd.c: 124: cmd_list.cur++;
                                    325 ;	./../../mib/stm8s_mib_debug_cmd.c: 137: if (cmd_list.cur == 0)
      00936B C6 00 47         [ 1]  326 	ld	a, _cmd_list+0
      00936E 26 06            [ 1]  327 	jrne	00125$
                                    328 ;	./../../mib/stm8s_mib_debug_cmd.c: 138: cmd_list.cur = CMD_LINE_MAX - 1;
      009370 35 03 00 47      [ 1]  329 	mov	_cmd_list+0, #0x03
      009374 20 04            [ 2]  330 	jra	00126$
      009376                        331 00125$:
                                    332 ;	./../../mib/stm8s_mib_debug_cmd.c: 140: cmd_list.cur--;
      009376 4A               [ 1]  333 	dec	a
      009377 C7 00 47         [ 1]  334 	ld	_cmd_list+0, a
      00937A                        335 00126$:
                                    336 ;	./../../mib/stm8s_mib_debug_cmd.c: 141: rdCnt = strlen(cmd_list.buf[cmd_list.cur]);
      00937A C6 00 47         [ 1]  337 	ld	a, _cmd_list+0
      00937D 97               [ 1]  338 	ld	xl, a
      00937E A6 40            [ 1]  339 	ld	a, #0x40
      009380 42               [ 4]  340 	mul	x, a
      009381 1C 00 49         [ 2]  341 	addw	x, #(_cmd_list+2)
      009384 CD A2 58         [ 4]  342 	call	_strlen
                                    343 ;	./../../mib/stm8s_mib_debug_cmd.c: 142: if (rdCnt >= rdMax)
      009387 1F 0F            [ 2]  344 	ldw	(0x0f, sp), x
      009389 13 01            [ 2]  345 	cpw	x, (0x01, sp)
      00938B 25 04            [ 1]  346 	jrc	00128$
                                    347 ;	./../../mib/stm8s_mib_debug_cmd.c: 143: rdCnt = rdMax;
      00938D 16 01            [ 2]  348 	ldw	y, (0x01, sp)
      00938F 17 0F            [ 2]  349 	ldw	(0x0f, sp), y
      009391                        350 00128$:
                                    351 ;	./../../mib/stm8s_mib_debug_cmd.c: 144: memcpy(cmd, cmd_list.buf[cmd_list.cur], rdCnt);
      009391 16 0F            [ 2]  352 	ldw	y, (0x0f, sp)
      009393 C6 00 47         [ 1]  353 	ld	a, _cmd_list+0
      009396 97               [ 1]  354 	ld	xl, a
      009397 A6 40            [ 1]  355 	ld	a, #0x40
      009399 42               [ 4]  356 	mul	x, a
      00939A 1C 00 49         [ 2]  357 	addw	x, #(_cmd_list+2)
      00939D 90 89            [ 2]  358 	pushw	y
      00939F 89               [ 2]  359 	pushw	x
      0093A0 1E 0F            [ 2]  360 	ldw	x, (0x0f, sp)
      0093A2 CD A1 E1         [ 4]  361 	call	___memcpy
                                    362 ;	./../../mib/stm8s_mib_debug_cmd.c: 145: cmd[rdCnt] = 0;
      0093A5 1E 0D            [ 2]  363 	ldw	x, (0x0d, sp)
      0093A7 72 FB 0F         [ 2]  364 	addw	x, (0x0f, sp)
      0093AA 7F               [ 1]  365 	clr	(x)
                                    366 ;	./../../mib/stm8s_mib_debug_cmd.c: 147: MibWriteDebugString(cmd);
      0093AB 1E 0D            [ 2]  367 	ldw	x, (0x0d, sp)
      0093AD CD 87 62         [ 4]  368 	call	_MibWriteDebugString
      0093B0 CC 91 F9         [ 2]  369 	jp	00148$
      0093B3                        370 00137$:
                                    371 ;	./../../mib/stm8s_mib_debug_cmd.c: 153: cmd[rdCnt++] = vwCh;
      0093B3 1E 0F            [ 2]  372 	ldw	x, (0x0f, sp)
      0093B5 16 09            [ 2]  373 	ldw	y, (0x09, sp)
      0093B7 17 0F            [ 2]  374 	ldw	(0x0f, sp), y
      0093B9 72 FB 0D         [ 2]  375 	addw	x, (0x0d, sp)
      0093BC 7B 06            [ 1]  376 	ld	a, (0x06, sp)
      0093BE F7               [ 1]  377 	ld	(x), a
                                    378 ;	./../../mib/stm8s_mib_debug_cmd.c: 155: MibWriteDebugByte(vwCh);
      0093BF CD 87 4F         [ 4]  379 	call	_MibWriteDebugByte
      0093C2 CC 91 F9         [ 2]  380 	jp	00148$
      0093C5                        381 00146$:
                                    382 ;	./../../mib/stm8s_mib_debug_cmd.c: 158: return (rdCnt);
      0093C5 1E 0F            [ 2]  383 	ldw	x, (0x0f, sp)
      0093C7                        384 00150$:
                                    385 ;	./../../mib/stm8s_mib_debug_cmd.c: 159: } // GetCommand.
      0093C7 16 11            [ 2]  386 	ldw	y, (17, sp)
      0093C9 5B 15            [ 2]  387 	addw	sp, #21
      0093CB 90 FC            [ 2]  388 	jp	(y)
                                    389 ;	./../../mib/stm8s_mib_debug_cmd.c: 169: int GetArgs(char *s, char **argv)
                                    390 ;	-----------------------------------------
                                    391 ;	 function GetArgs
                                    392 ;	-----------------------------------------
      0093CD                        393 _GetArgs:
      0093CD 52 08            [ 2]  394 	sub	sp, #8
      0093CF 1F 05            [ 2]  395 	ldw	(0x05, sp), x
                                    396 ;	./../../mib/stm8s_mib_debug_cmd.c: 171: int args = 0;
      0093D1 5F               [ 1]  397 	clrw	x
      0093D2 1F 01            [ 2]  398 	ldw	(0x01, sp), x
                                    399 ;	./../../mib/stm8s_mib_debug_cmd.c: 173: if (!s || *s == '\0')
      0093D4 1E 05            [ 2]  400 	ldw	x, (0x05, sp)
      0093D6 27 03            [ 1]  401 	jreq	00101$
      0093D8 F6               [ 1]  402 	ld	a, (x)
      0093D9 26 03            [ 1]  403 	jrne	00131$
      0093DB                        404 00101$:
                                    405 ;	./../../mib/stm8s_mib_debug_cmd.c: 174: return 0;
      0093DB 5F               [ 1]  406 	clrw	x
      0093DC 20 73            [ 2]  407 	jra	00120$
                                    408 ;	./../../mib/stm8s_mib_debug_cmd.c: 175: while (args < MAX_ARGS)
      0093DE                        409 00131$:
      0093DE 5F               [ 1]  410 	clrw	x
      0093DF 1F 07            [ 2]  411 	ldw	(0x07, sp), x
      0093E1                        412 00117$:
      0093E1 1E 07            [ 2]  413 	ldw	x, (0x07, sp)
      0093E3 A3 00 05         [ 2]  414 	cpw	x, #0x0005
      0093E6 2E 67            [ 1]  415 	jrsge	00119$
                                    416 ;	./../../mib/stm8s_mib_debug_cmd.c: 178: while ((*s == ' ') || (*s == '\t'))
      0093E8 1E 05            [ 2]  417 	ldw	x, (0x05, sp)
      0093EA                        418 00105$:
      0093EA F6               [ 1]  419 	ld	a, (x)
      0093EB A1 20            [ 1]  420 	cp	a, #0x20
      0093ED 27 04            [ 1]  421 	jreq	00106$
      0093EF A1 09            [ 1]  422 	cp	a, #0x09
      0093F1 26 03            [ 1]  423 	jrne	00107$
      0093F3                        424 00106$:
                                    425 ;	./../../mib/stm8s_mib_debug_cmd.c: 179: s++;
      0093F3 5C               [ 1]  426 	incw	x
      0093F4 20 F4            [ 2]  427 	jra	00105$
      0093F6                        428 00107$:
                                    429 ;	./../../mib/stm8s_mib_debug_cmd.c: 182: if (*s == '\0')
      0093F6 4D               [ 1]  430 	tnz	a
      0093F7 26 0D            [ 1]  431 	jrne	00109$
                                    432 ;	./../../mib/stm8s_mib_debug_cmd.c: 184: argv[args] = 0;
      0093F9 1E 01            [ 2]  433 	ldw	x, (0x01, sp)
      0093FB 58               [ 2]  434 	sllw	x
      0093FC 72 FB 0B         [ 2]  435 	addw	x, (0x0b, sp)
      0093FF 6F 01            [ 1]  436 	clr	(0x1, x)
      009401 7F               [ 1]  437 	clr	(x)
                                    438 ;	./../../mib/stm8s_mib_debug_cmd.c: 185: return args;
      009402 1E 01            [ 2]  439 	ldw	x, (0x01, sp)
      009404 20 4B            [ 2]  440 	jra	00120$
      009406                        441 00109$:
                                    442 ;	./../../mib/stm8s_mib_debug_cmd.c: 188: argv[args++] = s;
      009406 16 07            [ 2]  443 	ldw	y, (0x07, sp)
      009408 17 03            [ 2]  444 	ldw	(0x03, sp), y
      00940A 16 07            [ 2]  445 	ldw	y, (0x07, sp)
      00940C 90 5C            [ 1]  446 	incw	y
      00940E 17 07            [ 2]  447 	ldw	(0x07, sp), y
      009410 17 01            [ 2]  448 	ldw	(0x01, sp), y
      009412 16 03            [ 2]  449 	ldw	y, (0x03, sp)
      009414 90 58            [ 2]  450 	sllw	y
      009416 72 F9 0B         [ 2]  451 	addw	y, (0x0b, sp)
      009419 90 FF            [ 2]  452 	ldw	(y), x
                                    453 ;	./../../mib/stm8s_mib_debug_cmd.c: 191: while (*s && (*s != ' ') && (*s != '\t'))
      00941B 1F 05            [ 2]  454 	ldw	(0x05, sp), x
      00941D                        455 00112$:
      00941D 1E 05            [ 2]  456 	ldw	x, (0x05, sp)
      00941F F6               [ 1]  457 	ld	a, (x)
                                    458 ;	./../../mib/stm8s_mib_debug_cmd.c: 192: s++;
      009420 1E 05            [ 2]  459 	ldw	x, (0x05, sp)
      009422 5C               [ 1]  460 	incw	x
      009423 1F 03            [ 2]  461 	ldw	(0x03, sp), x
                                    462 ;	./../../mib/stm8s_mib_debug_cmd.c: 191: while (*s && (*s != ' ') && (*s != '\t'))
      009425 4D               [ 1]  463 	tnz	a
      009426 27 0E            [ 1]  464 	jreq	00114$
      009428 A1 20            [ 1]  465 	cp	a, #0x20
      00942A 27 0A            [ 1]  466 	jreq	00114$
      00942C A1 09            [ 1]  467 	cp	a, #0x09
      00942E 27 06            [ 1]  468 	jreq	00114$
                                    469 ;	./../../mib/stm8s_mib_debug_cmd.c: 192: s++;
      009430 16 03            [ 2]  470 	ldw	y, (0x03, sp)
      009432 17 05            [ 2]  471 	ldw	(0x05, sp), y
      009434 20 E7            [ 2]  472 	jra	00112$
      009436                        473 00114$:
                                    474 ;	./../../mib/stm8s_mib_debug_cmd.c: 194: if (*s == '\0')
      009436 4D               [ 1]  475 	tnz	a
      009437 26 0D            [ 1]  476 	jrne	00116$
                                    477 ;	./../../mib/stm8s_mib_debug_cmd.c: 196: argv[args] = 0;
      009439 1E 01            [ 2]  478 	ldw	x, (0x01, sp)
      00943B 58               [ 2]  479 	sllw	x
      00943C 72 FB 0B         [ 2]  480 	addw	x, (0x0b, sp)
      00943F 6F 01            [ 1]  481 	clr	(0x1, x)
      009441 7F               [ 1]  482 	clr	(x)
                                    483 ;	./../../mib/stm8s_mib_debug_cmd.c: 197: return args;
      009442 1E 01            [ 2]  484 	ldw	x, (0x01, sp)
      009444 20 0B            [ 2]  485 	jra	00120$
      009446                        486 00116$:
                                    487 ;	./../../mib/stm8s_mib_debug_cmd.c: 199: *s++ = '\0';
      009446 1E 05            [ 2]  488 	ldw	x, (0x05, sp)
      009448 7F               [ 1]  489 	clr	(x)
      009449 16 03            [ 2]  490 	ldw	y, (0x03, sp)
      00944B 17 05            [ 2]  491 	ldw	(0x05, sp), y
      00944D 20 92            [ 2]  492 	jra	00117$
      00944F                        493 00119$:
                                    494 ;	./../../mib/stm8s_mib_debug_cmd.c: 201: return args;
      00944F 1E 01            [ 2]  495 	ldw	x, (0x01, sp)
      009451                        496 00120$:
                                    497 ;	./../../mib/stm8s_mib_debug_cmd.c: 202: } // GetArgs.
      009451 5B 08            [ 2]  498 	addw	sp, #8
      009453 90 85            [ 2]  499 	popw	y
      009455 5B 02            [ 2]  500 	addw	sp, #2
      009457 90 FC            [ 2]  501 	jp	(y)
                                    502 ;	./../../mib/stm8s_mib_debug_cmd.c: 213: int HexToInt(char *s, void *retval, uint16_t type)
                                    503 ;	-----------------------------------------
                                    504 ;	 function HexToInt
                                    505 ;	-----------------------------------------
      009459                        506 _HexToInt:
      009459 52 0E            [ 2]  507 	sub	sp, #14
                                    508 ;	./../../mib/stm8s_mib_debug_cmd.c: 219: if (!s || !retval)
      00945B 1F 0A            [ 2]  509 	ldw	(0x0a, sp), x
      00945D 27 04            [ 1]  510 	jreq	00101$
      00945F 1E 11            [ 2]  511 	ldw	x, (0x11, sp)
      009461 26 04            [ 1]  512 	jrne	00102$
      009463                        513 00101$:
                                    514 ;	./../../mib/stm8s_mib_debug_cmd.c: 220: return FALSE;
      009463 5F               [ 1]  515 	clrw	x
      009464 CC 95 3F         [ 2]  516 	jp	00132$
      009467                        517 00102$:
                                    518 ;	./../../mib/stm8s_mib_debug_cmd.c: 221: if (!strncmp(s, "0x", 2))
      009467 4B 02            [ 1]  519 	push	#0x02
      009469 4B 00            [ 1]  520 	push	#0x00
      00946B 4B 05            [ 1]  521 	push	#<(___str_2+0)
      00946D 4B 82            [ 1]  522 	push	#((___str_2+0) >> 8)
      00946F 1E 0E            [ 2]  523 	ldw	x, (0x0e, sp)
      009471 CD A1 3E         [ 4]  524 	call	_strncmp
      009474 5D               [ 2]  525 	tnzw	x
      009475 26 06            [ 1]  526 	jrne	00105$
                                    527 ;	./../../mib/stm8s_mib_debug_cmd.c: 222: s += 2;
      009477 1E 0A            [ 2]  528 	ldw	x, (0x0a, sp)
      009479 5C               [ 1]  529 	incw	x
      00947A 5C               [ 1]  530 	incw	x
      00947B 1F 0A            [ 2]  531 	ldw	(0x0a, sp), x
      00947D                        532 00105$:
                                    533 ;	./../../mib/stm8s_mib_debug_cmd.c: 224: for (i = 0, rval = 0; i < type / 4; i++)
      00947D 0F 01            [ 1]  534 	clr	(0x01, sp)
      00947F 5F               [ 1]  535 	clrw	x
      009480 1F 04            [ 2]  536 	ldw	(0x04, sp), x
      009482 1F 02            [ 2]  537 	ldw	(0x02, sp), x
      009484 16 0A            [ 2]  538 	ldw	y, (0x0a, sp)
      009486 17 0C            [ 2]  539 	ldw	(0x0c, sp), y
      009488 0F 0E            [ 1]  540 	clr	(0x0e, sp)
      00948A                        541 00130$:
      00948A 16 13            [ 2]  542 	ldw	y, (0x13, sp)
      00948C 17 06            [ 2]  543 	ldw	(0x06, sp), y
      00948E 93               [ 1]  544 	ldw	x, y
      00948F 54               [ 2]  545 	srlw	x
      009490 54               [ 2]  546 	srlw	x
      009491 1F 08            [ 2]  547 	ldw	(0x08, sp), x
      009493 7B 0E            [ 1]  548 	ld	a, (0x0e, sp)
      009495 5F               [ 1]  549 	clrw	x
      009496 97               [ 1]  550 	ld	xl, a
      009497 13 08            [ 2]  551 	cpw	x, (0x08, sp)
      009499 24 70            [ 1]  552 	jrnc	00123$
                                    553 ;	./../../mib/stm8s_mib_debug_cmd.c: 226: if (*s == '\0')
      00949B 1E 0C            [ 2]  554 	ldw	x, (0x0c, sp)
      00949D F6               [ 1]  555 	ld	a, (x)
      00949E 26 08            [ 1]  556 	jrne	00110$
                                    557 ;	./../../mib/stm8s_mib_debug_cmd.c: 228: if (i == 0)
      0094A0 0D 01            [ 1]  558 	tnz	(0x01, sp)
      0094A2 26 67            [ 1]  559 	jrne	00123$
                                    560 ;	./../../mib/stm8s_mib_debug_cmd.c: 229: return FALSE;
      0094A4 5F               [ 1]  561 	clrw	x
      0094A5 CC 95 3F         [ 2]  562 	jp	00132$
                                    563 ;	./../../mib/stm8s_mib_debug_cmd.c: 231: break;
      0094A8                        564 00110$:
                                    565 ;	./../../mib/stm8s_mib_debug_cmd.c: 233: c = *s++;
      0094A8 1E 0C            [ 2]  566 	ldw	x, (0x0c, sp)
      0094AA 5C               [ 1]  567 	incw	x
      0094AB 1F 0C            [ 2]  568 	ldw	(0x0c, sp), x
                                    569 ;	./../../mib/stm8s_mib_debug_cmd.c: 236: c -= '0';
      0094AD 97               [ 1]  570 	ld	xl, a
                                    571 ;	./../../mib/stm8s_mib_debug_cmd.c: 235: if (c >= '0' && c <= '9')
      0094AE A1 30            [ 1]  572 	cp	a, #0x30
      0094B0 25 09            [ 1]  573 	jrc	00120$
      0094B2 A1 39            [ 1]  574 	cp	a, #0x39
      0094B4 22 05            [ 1]  575 	jrugt	00120$
                                    576 ;	./../../mib/stm8s_mib_debug_cmd.c: 236: c -= '0';
      0094B6 9F               [ 1]  577 	ld	a, xl
      0094B7 A0 30            [ 1]  578 	sub	a, #0x30
      0094B9 20 1D            [ 2]  579 	jra	00121$
      0094BB                        580 00120$:
                                    581 ;	./../../mib/stm8s_mib_debug_cmd.c: 237: else if (c >= 'a' && c <= 'f')
      0094BB A1 61            [ 1]  582 	cp	a, #0x61
      0094BD 25 09            [ 1]  583 	jrc	00116$
      0094BF A1 66            [ 1]  584 	cp	a, #0x66
      0094C1 22 05            [ 1]  585 	jrugt	00116$
                                    586 ;	./../../mib/stm8s_mib_debug_cmd.c: 238: c = c - 'a' + 10;
      0094C3 9F               [ 1]  587 	ld	a, xl
      0094C4 AB A9            [ 1]  588 	add	a, #0xa9
      0094C6 20 10            [ 2]  589 	jra	00121$
      0094C8                        590 00116$:
                                    591 ;	./../../mib/stm8s_mib_debug_cmd.c: 239: else if (c >= 'A' && c <= 'F')
      0094C8 A1 41            [ 1]  592 	cp	a, #0x41
      0094CA 25 09            [ 1]  593 	jrc	00112$
      0094CC A1 46            [ 1]  594 	cp	a, #0x46
      0094CE 22 05            [ 1]  595 	jrugt	00112$
                                    596 ;	./../../mib/stm8s_mib_debug_cmd.c: 240: c = c - 'A' + 10;
      0094D0 9F               [ 1]  597 	ld	a, xl
      0094D1 AB C9            [ 1]  598 	add	a, #0xc9
      0094D3 20 03            [ 2]  599 	jra	00121$
      0094D5                        600 00112$:
                                    601 ;	./../../mib/stm8s_mib_debug_cmd.c: 242: return FALSE;
      0094D5 5F               [ 1]  602 	clrw	x
      0094D6 20 67            [ 2]  603 	jra	00132$
      0094D8                        604 00121$:
                                    605 ;	./../../mib/stm8s_mib_debug_cmd.c: 244: rval = rval << 4 | c;
      0094D8 88               [ 1]  606 	push	a
      0094D9 1E 05            [ 2]  607 	ldw	x, (0x05, sp)
      0094DB 16 03            [ 2]  608 	ldw	y, (0x03, sp)
      0094DD A6 04            [ 1]  609 	ld	a, #0x04
      0094DF                        610 00222$:
      0094DF 58               [ 2]  611 	sllw	x
      0094E0 90 59            [ 2]  612 	rlcw	y
      0094E2 4A               [ 1]  613 	dec	a
      0094E3 26 FA            [ 1]  614 	jrne	00222$
      0094E5 84               [ 1]  615 	pop	a
      0094E6 0F 08            [ 1]  616 	clr	(0x08, sp)
      0094E8 0F 07            [ 1]  617 	clr	(0x07, sp)
      0094EA 0F 06            [ 1]  618 	clr	(0x06, sp)
      0094EC 89               [ 2]  619 	pushw	x
      0094ED 1A 02            [ 1]  620 	or	a, (2, sp)
      0094EF 85               [ 2]  621 	popw	x
      0094F0 02               [ 1]  622 	rlwa	x
      0094F1 1A 08            [ 1]  623 	or	a, (0x08, sp)
      0094F3 95               [ 1]  624 	ld	xh, a
      0094F4 90 9F            [ 1]  625 	ld	a, yl
      0094F6 1A 07            [ 1]  626 	or	a, (0x07, sp)
      0094F8 90 02            [ 1]  627 	rlwa	y
      0094FA 1A 06            [ 1]  628 	or	a, (0x06, sp)
      0094FC 90 95            [ 1]  629 	ld	yh, a
      0094FE 1F 04            [ 2]  630 	ldw	(0x04, sp), x
      009500 17 02            [ 2]  631 	ldw	(0x02, sp), y
                                    632 ;	./../../mib/stm8s_mib_debug_cmd.c: 224: for (i = 0, rval = 0; i < type / 4; i++)
      009502 0C 0E            [ 1]  633 	inc	(0x0e, sp)
      009504 7B 0E            [ 1]  634 	ld	a, (0x0e, sp)
      009506 6B 01            [ 1]  635 	ld	(0x01, sp), a
      009508 CC 94 8A         [ 2]  636 	jp	00130$
      00950B                        637 00123$:
                                    638 ;	./../../mib/stm8s_mib_debug_cmd.c: 247: switch (type)
      00950B 1E 06            [ 2]  639 	ldw	x, (0x06, sp)
      00950D A3 00 08         [ 2]  640 	cpw	x, #0x0008
      009510 27 10            [ 1]  641 	jreq	00124$
      009512 1E 06            [ 2]  642 	ldw	x, (0x06, sp)
      009514 A3 00 10         [ 2]  643 	cpw	x, #0x0010
      009517 27 10            [ 1]  644 	jreq	00125$
      009519 1E 06            [ 2]  645 	ldw	x, (0x06, sp)
      00951B A3 00 20         [ 2]  646 	cpw	x, #0x0020
      00951E 27 10            [ 1]  647 	jreq	00126$
      009520 20 19            [ 2]  648 	jra	00127$
                                    649 ;	./../../mib/stm8s_mib_debug_cmd.c: 249: case 8:
      009522                        650 00124$:
                                    651 ;	./../../mib/stm8s_mib_debug_cmd.c: 250: *(uint8_t *)retval = (uint8_t)rval;
      009522 1E 11            [ 2]  652 	ldw	x, (0x11, sp)
      009524 7B 05            [ 1]  653 	ld	a, (0x05, sp)
      009526 F7               [ 1]  654 	ld	(x), a
                                    655 ;	./../../mib/stm8s_mib_debug_cmd.c: 251: break;
      009527 20 14            [ 2]  656 	jra	00128$
                                    657 ;	./../../mib/stm8s_mib_debug_cmd.c: 252: case 16:
      009529                        658 00125$:
                                    659 ;	./../../mib/stm8s_mib_debug_cmd.c: 253: *(uint16_t *)retval = (uint16_t)rval;
      009529 1E 11            [ 2]  660 	ldw	x, (0x11, sp)
      00952B 16 04            [ 2]  661 	ldw	y, (0x04, sp)
      00952D FF               [ 2]  662 	ldw	(x), y
                                    663 ;	./../../mib/stm8s_mib_debug_cmd.c: 254: break;
      00952E 20 0D            [ 2]  664 	jra	00128$
                                    665 ;	./../../mib/stm8s_mib_debug_cmd.c: 255: case 32:
      009530                        666 00126$:
                                    667 ;	./../../mib/stm8s_mib_debug_cmd.c: 256: *(uint32_t *)retval = (uint32_t)rval;
      009530 1E 11            [ 2]  668 	ldw	x, (0x11, sp)
      009532 16 04            [ 2]  669 	ldw	y, (0x04, sp)
      009534 EF 02            [ 2]  670 	ldw	(0x2, x), y
      009536 16 02            [ 2]  671 	ldw	y, (0x02, sp)
      009538 FF               [ 2]  672 	ldw	(x), y
                                    673 ;	./../../mib/stm8s_mib_debug_cmd.c: 257: break;
      009539 20 02            [ 2]  674 	jra	00128$
                                    675 ;	./../../mib/stm8s_mib_debug_cmd.c: 258: default:
      00953B                        676 00127$:
                                    677 ;	./../../mib/stm8s_mib_debug_cmd.c: 259: return FALSE;
      00953B 5F               [ 1]  678 	clrw	x
                                    679 ;	./../../mib/stm8s_mib_debug_cmd.c: 260: }
                                    680 ;	./../../mib/stm8s_mib_debug_cmd.c: 261: return TRUE;
      00953C C5                     681 	.byte 0xc5
      00953D                        682 00128$:
      00953D 5F               [ 1]  683 	clrw	x
      00953E 5C               [ 1]  684 	incw	x
      00953F                        685 00132$:
                                    686 ;	./../../mib/stm8s_mib_debug_cmd.c: 262: } // HexToInt.
      00953F 16 0F            [ 2]  687 	ldw	y, (15, sp)
      009541 5B 14            [ 2]  688 	addw	sp, #20
      009543 90 FC            [ 2]  689 	jp	(y)
                                    690 ;	./../../mib/stm8s_mib_debug_cmd.c: 272: int DecToLong(char *s, long *retval)
                                    691 ;	-----------------------------------------
                                    692 ;	 function DecToLong
                                    693 ;	-----------------------------------------
      009545                        694 _DecToLong:
      009545 52 0E            [ 2]  695 	sub	sp, #14
      009547 51               [ 1]  696 	exgw	x, y
                                    697 ;	./../../mib/stm8s_mib_debug_cmd.c: 275: if (!s || !s[0])
      009548 90 5D            [ 2]  698 	tnzw	y
      00954A 27 04            [ 1]  699 	jreq	00101$
      00954C 90 F6            [ 1]  700 	ld	a, (y)
      00954E 26 03            [ 1]  701 	jrne	00102$
      009550                        702 00101$:
                                    703 ;	./../../mib/stm8s_mib_debug_cmd.c: 276: return FALSE;
      009550 5F               [ 1]  704 	clrw	x
      009551 20 76            [ 2]  705 	jra	00111$
      009553                        706 00102$:
                                    707 ;	./../../mib/stm8s_mib_debug_cmd.c: 278: for (*retval = 0; *s; s++)
      009553 1E 11            [ 2]  708 	ldw	x, (0x11, sp)
      009555 1F 01            [ 2]  709 	ldw	(0x01, sp), x
      009557 6F 03            [ 1]  710 	clr	(0x3, x)
      009559 6F 02            [ 1]  711 	clr	(0x2, x)
      00955B 6F 01            [ 1]  712 	clr	(0x1, x)
      00955D 7F               [ 1]  713 	clr	(x)
      00955E                        714 00109$:
      00955E 90 F6            [ 1]  715 	ld	a, (y)
      009560 27 65            [ 1]  716 	jreq	00107$
                                    717 ;	./../../mib/stm8s_mib_debug_cmd.c: 280: if (*s < '0' || *s > '9')
      009562 A1 30            [ 1]  718 	cp	a, #0x30
      009564 25 04            [ 1]  719 	jrc	00104$
      009566 A1 39            [ 1]  720 	cp	a, #0x39
      009568 23 03            [ 2]  721 	jrule	00105$
      00956A                        722 00104$:
                                    723 ;	./../../mib/stm8s_mib_debug_cmd.c: 281: return FALSE;
      00956A 5F               [ 1]  724 	clrw	x
      00956B 20 5C            [ 2]  725 	jra	00111$
      00956D                        726 00105$:
                                    727 ;	./../../mib/stm8s_mib_debug_cmd.c: 282: remainder = *s - '0';
      00956D 5F               [ 1]  728 	clrw	x
      00956E 97               [ 1]  729 	ld	xl, a
      00956F 1D 00 30         [ 2]  730 	subw	x, #0x0030
      009572 1F 05            [ 2]  731 	ldw	(0x05, sp), x
      009574 7B 05            [ 1]  732 	ld	a, (0x05, sp)
      009576 49               [ 1]  733 	rlc	a
      009577 4F               [ 1]  734 	clr	a
      009578 A2 00            [ 1]  735 	sbc	a, #0x00
      00957A 6B 04            [ 1]  736 	ld	(0x04, sp), a
      00957C 6B 03            [ 1]  737 	ld	(0x03, sp), a
                                    738 ;	./../../mib/stm8s_mib_debug_cmd.c: 283: *retval = *retval * 10 + remainder;
      00957E 1E 01            [ 2]  739 	ldw	x, (0x01, sp)
      009580 E6 03            [ 1]  740 	ld	a, (0x3, x)
      009582 6B 0E            [ 1]  741 	ld	(0x0e, sp), a
      009584 E6 02            [ 1]  742 	ld	a, (0x2, x)
      009586 6B 0D            [ 1]  743 	ld	(0x0d, sp), a
      009588 FE               [ 2]  744 	ldw	x, (x)
      009589 90 89            [ 2]  745 	pushw	y
      00958B 7B 10            [ 1]  746 	ld	a, (0x10, sp)
      00958D 88               [ 1]  747 	push	a
      00958E 7B 10            [ 1]  748 	ld	a, (0x10, sp)
      009590 88               [ 1]  749 	push	a
      009591 89               [ 2]  750 	pushw	x
      009592 4B 0A            [ 1]  751 	push	#0x0a
      009594 5F               [ 1]  752 	clrw	x
      009595 89               [ 2]  753 	pushw	x
      009596 4B 00            [ 1]  754 	push	#0x00
      009598 CD A2 BA         [ 4]  755 	call	__mullong
      00959B 5B 08            [ 2]  756 	addw	sp, #8
      00959D 17 09            [ 2]  757 	ldw	(0x09, sp), y
      00959F 90 85            [ 2]  758 	popw	y
      0095A1 72 FB 05         [ 2]  759 	addw	x, (0x05, sp)
      0095A4 1F 0D            [ 2]  760 	ldw	(0x0d, sp), x
      0095A6 7B 08            [ 1]  761 	ld	a, (0x08, sp)
      0095A8 19 04            [ 1]  762 	adc	a, (0x04, sp)
      0095AA 6B 0C            [ 1]  763 	ld	(0x0c, sp), a
      0095AC 7B 07            [ 1]  764 	ld	a, (0x07, sp)
      0095AE 19 03            [ 1]  765 	adc	a, (0x03, sp)
      0095B0 6B 0B            [ 1]  766 	ld	(0x0b, sp), a
      0095B2 1E 01            [ 2]  767 	ldw	x, (0x01, sp)
      0095B4 7B 0E            [ 1]  768 	ld	a, (0x0e, sp)
      0095B6 E7 03            [ 1]  769 	ld	(0x3, x), a
      0095B8 7B 0D            [ 1]  770 	ld	a, (0x0d, sp)
      0095BA E7 02            [ 1]  771 	ld	(0x2, x), a
      0095BC 7B 0C            [ 1]  772 	ld	a, (0x0c, sp)
      0095BE E7 01            [ 1]  773 	ld	(0x1, x), a
      0095C0 7B 0B            [ 1]  774 	ld	a, (0x0b, sp)
      0095C2 F7               [ 1]  775 	ld	(x), a
                                    776 ;	./../../mib/stm8s_mib_debug_cmd.c: 278: for (*retval = 0; *s; s++)
      0095C3 90 5C            [ 1]  777 	incw	y
      0095C5 20 97            [ 2]  778 	jra	00109$
      0095C7                        779 00107$:
                                    780 ;	./../../mib/stm8s_mib_debug_cmd.c: 286: return TRUE;
      0095C7 5F               [ 1]  781 	clrw	x
      0095C8 5C               [ 1]  782 	incw	x
      0095C9                        783 00111$:
                                    784 ;	./../../mib/stm8s_mib_debug_cmd.c: 287: } // DecToLong.
      0095C9 5B 0E            [ 2]  785 	addw	sp, #14
      0095CB 90 85            [ 2]  786 	popw	y
      0095CD 5B 02            [ 2]  787 	addw	sp, #2
      0095CF 90 FC            [ 2]  788 	jp	(y)
                                    789 ;	./../../mib/stm8s_mib_debug_cmd.c: 296: void HexDump(uint32_t addr, uint32_t len)
                                    790 ;	-----------------------------------------
                                    791 ;	 function HexDump
                                    792 ;	-----------------------------------------
      0095D1                        793 _HexDump:
      0095D1 52 27            [ 2]  794 	sub	sp, #39
                                    795 ;	./../../mib/stm8s_mib_debug_cmd.c: 299: uint32_t endPtr = (addr + len);
      0095D3 16 2C            [ 2]  796 	ldw	y, (0x2c, sp)
      0095D5 72 F9 30         [ 2]  797 	addw	y, (0x30, sp)
      0095D8 1E 2A            [ 2]  798 	ldw	x, (0x2a, sp)
      0095DA 24 01            [ 1]  799 	jrnc	00240$
      0095DC 5C               [ 1]  800 	incw	x
      0095DD                        801 00240$:
      0095DD 72 FB 2E         [ 2]  802 	addw	x, (0x2e, sp)
      0095E0 17 17            [ 2]  803 	ldw	(0x17, sp), y
      0095E2 1F 15            [ 2]  804 	ldw	(0x15, sp), x
                                    805 ;	./../../mib/stm8s_mib_debug_cmd.c: 300: int i, remainder = len & 0xf;
      0095E4 1E 30            [ 2]  806 	ldw	x, (0x30, sp)
      0095E6 9F               [ 1]  807 	ld	a, xl
      0095E7 A4 0F            [ 1]  808 	and	a, #0x0f
      0095E9 6B 1A            [ 1]  809 	ld	(0x1a, sp), a
      0095EB 0F 19            [ 1]  810 	clr	(0x19, sp)
                                    811 ;	./../../mib/stm8s_mib_debug_cmd.c: 306: mib_printf("\r\n");
      0095ED 4B FE            [ 1]  812 	push	#<(___str_0+0)
      0095EF 4B 81            [ 1]  813 	push	#((___str_0+0) >> 8)
      0095F1 CD 91 73         [ 4]  814 	call	_mib_printf
      0095F4 5B 02            [ 2]  815 	addw	sp, #2
                                    816 ;	./../../mib/stm8s_mib_debug_cmd.c: 307: mib_printf("address     Hex Value                                        Ascii value\r\n");
      0095F6 4B 08            [ 1]  817 	push	#<(___str_3+0)
      0095F8 4B 82            [ 1]  818 	push	#((___str_3+0) >> 8)
      0095FA CD 91 73         [ 4]  819 	call	_mib_printf
      0095FD 5B 02            [ 2]  820 	addw	sp, #2
                                    821 ;	./../../mib/stm8s_mib_debug_cmd.c: 310: p_address = (uint32_t)(addr);
      0095FF 1E 2C            [ 2]  822 	ldw	x, (0x2c, sp)
      009601 16 2A            [ 2]  823 	ldw	y, (0x2a, sp)
                                    824 ;	./../../mib/stm8s_mib_debug_cmd.c: 311: p_data_ptr = (uint16_t *)p_data;
                                    825 ;	./../../mib/stm8s_mib_debug_cmd.c: 312: while ((p_address + 16) <= endPtr)
      009603 1F 1D            [ 2]  826 	ldw	(0x1d, sp), x
      009605 17 1B            [ 2]  827 	ldw	(0x1b, sp), y
      009607                        828 00107$:
      009607 1E 1D            [ 2]  829 	ldw	x, (0x1d, sp)
      009609 1C 00 10         [ 2]  830 	addw	x, #0x0010
      00960C 1F 21            [ 2]  831 	ldw	(0x21, sp), x
      00960E 7B 1C            [ 1]  832 	ld	a, (0x1c, sp)
      009610 A9 00            [ 1]  833 	adc	a, #0x00
      009612 6B 20            [ 1]  834 	ld	(0x20, sp), a
      009614 7B 1B            [ 1]  835 	ld	a, (0x1b, sp)
      009616 A9 00            [ 1]  836 	adc	a, #0x00
      009618 6B 1F            [ 1]  837 	ld	(0x1f, sp), a
      00961A 1E 17            [ 2]  838 	ldw	x, (0x17, sp)
      00961C 13 21            [ 2]  839 	cpw	x, (0x21, sp)
      00961E 7B 16            [ 1]  840 	ld	a, (0x16, sp)
      009620 12 20            [ 1]  841 	sbc	a, (0x20, sp)
      009622 7B 15            [ 1]  842 	ld	a, (0x15, sp)
      009624 12 1F            [ 1]  843 	sbc	a, (0x1f, sp)
      009626 24 03            [ 1]  844 	jrnc	00241$
      009628 CC 96 EB         [ 2]  845 	jp	00163$
      00962B                        846 00241$:
                                    847 ;	./../../mib/stm8s_mib_debug_cmd.c: 314: mib_printf("0x%08lx : ", p_address);
      00962B 1E 1D            [ 2]  848 	ldw	x, (0x1d, sp)
      00962D 89               [ 2]  849 	pushw	x
      00962E 1E 1D            [ 2]  850 	ldw	x, (0x1d, sp)
      009630 89               [ 2]  851 	pushw	x
      009631 4B 53            [ 1]  852 	push	#<(___str_4+0)
      009633 4B 82            [ 1]  853 	push	#((___str_4+0) >> 8)
      009635 CD 91 73         [ 4]  854 	call	_mib_printf
      009638 5B 06            [ 2]  855 	addw	sp, #6
                                    856 ;	./../../mib/stm8s_mib_debug_cmd.c: 315: for (i = 0; i < 8; i++)
      00963A 5F               [ 1]  857 	clrw	x
      00963B 1F 26            [ 2]  858 	ldw	(0x26, sp), x
      00963D                        859 00120$:
                                    860 ;	./../../mib/stm8s_mib_debug_cmd.c: 317: p_data_ptr[i] = rd_ADDR16(p_address + i * 2);
      00963D 16 26            [ 2]  861 	ldw	y, (0x26, sp)
      00963F 90 58            [ 2]  862 	sllw	y
      009641 93               [ 1]  863 	ldw	x, y
      009642 89               [ 2]  864 	pushw	x
      009643 96               [ 1]  865 	ldw	x, sp
      009644 1C 00 03         [ 2]  866 	addw	x, #3
      009647 72 FB 01         [ 2]  867 	addw	x, (1, sp)
      00964A 5B 02            [ 2]  868 	addw	sp, #2
      00964C 17 24            [ 2]  869 	ldw	(0x24, sp), y
      00964E 16 1D            [ 2]  870 	ldw	y, (0x1d, sp)
      009650 72 F9 24         [ 2]  871 	addw	y, (0x24, sp)
      009653 90 FE            [ 2]  872 	ldw	y, (y)
      009655 FF               [ 2]  873 	ldw	(x), y
                                    874 ;	./../../mib/stm8s_mib_debug_cmd.c: 318: mib_printf("%02x ", p_data[i * 2]);
      009656 7B 27            [ 1]  875 	ld	a, (0x27, sp)
      009658 48               [ 1]  876 	sll	a
      009659 6B 23            [ 1]  877 	ld	(0x23, sp), a
      00965B 6B 25            [ 1]  878 	ld	(0x25, sp), a
      00965D 49               [ 1]  879 	rlc	a
      00965E 4F               [ 1]  880 	clr	a
      00965F A2 00            [ 1]  881 	sbc	a, #0x00
      009661 6B 24            [ 1]  882 	ld	(0x24, sp), a
      009663 96               [ 1]  883 	ldw	x, sp
      009664 5C               [ 1]  884 	incw	x
      009665 72 FB 24         [ 2]  885 	addw	x, (0x24, sp)
      009668 F6               [ 1]  886 	ld	a, (x)
      009669 5F               [ 1]  887 	clrw	x
      00966A 97               [ 1]  888 	ld	xl, a
      00966B 89               [ 2]  889 	pushw	x
      00966C 4B 5E            [ 1]  890 	push	#<(___str_5+0)
      00966E 4B 82            [ 1]  891 	push	#((___str_5+0) >> 8)
      009670 CD 91 73         [ 4]  892 	call	_mib_printf
      009673 5B 04            [ 2]  893 	addw	sp, #4
                                    894 ;	./../../mib/stm8s_mib_debug_cmd.c: 319: mib_printf("%02x ", p_data[i * 2 + 1]);
      009675 7B 23            [ 1]  895 	ld	a, (0x23, sp)
      009677 4C               [ 1]  896 	inc	a
      009678 6B 25            [ 1]  897 	ld	(0x25, sp), a
      00967A 49               [ 1]  898 	rlc	a
      00967B 4F               [ 1]  899 	clr	a
      00967C A2 00            [ 1]  900 	sbc	a, #0x00
      00967E 6B 24            [ 1]  901 	ld	(0x24, sp), a
      009680 96               [ 1]  902 	ldw	x, sp
      009681 5C               [ 1]  903 	incw	x
      009682 72 FB 24         [ 2]  904 	addw	x, (0x24, sp)
      009685 F6               [ 1]  905 	ld	a, (x)
      009686 5F               [ 1]  906 	clrw	x
      009687 97               [ 1]  907 	ld	xl, a
      009688 89               [ 2]  908 	pushw	x
      009689 4B 5E            [ 1]  909 	push	#<(___str_5+0)
      00968B 4B 82            [ 1]  910 	push	#((___str_5+0) >> 8)
      00968D CD 91 73         [ 4]  911 	call	_mib_printf
      009690 5B 04            [ 2]  912 	addw	sp, #4
                                    913 ;	./../../mib/stm8s_mib_debug_cmd.c: 315: for (i = 0; i < 8; i++)
      009692 1E 26            [ 2]  914 	ldw	x, (0x26, sp)
      009694 5C               [ 1]  915 	incw	x
      009695 1F 26            [ 2]  916 	ldw	(0x26, sp), x
      009697 A3 00 08         [ 2]  917 	cpw	x, #0x0008
      00969A 2F A1            [ 1]  918 	jrslt	00120$
                                    919 ;	./../../mib/stm8s_mib_debug_cmd.c: 321: mib_printf(" ");
      00969C 4B 64            [ 1]  920 	push	#<(___str_6+0)
      00969E 4B 82            [ 1]  921 	push	#((___str_6+0) >> 8)
      0096A0 CD 91 73         [ 4]  922 	call	_mib_printf
      0096A3 5B 02            [ 2]  923 	addw	sp, #2
                                    924 ;	./../../mib/stm8s_mib_debug_cmd.c: 322: for (i = 0; i < 16; i++)
      0096A5 5F               [ 1]  925 	clrw	x
      0096A6 1F 26            [ 2]  926 	ldw	(0x26, sp), x
      0096A8                        927 00122$:
                                    928 ;	./../../mib/stm8s_mib_debug_cmd.c: 324: c = p_data[i];
      0096A8 96               [ 1]  929 	ldw	x, sp
      0096A9 5C               [ 1]  930 	incw	x
      0096AA 72 FB 26         [ 2]  931 	addw	x, (0x26, sp)
      0096AD F6               [ 1]  932 	ld	a, (x)
                                    933 ;	./../../mib/stm8s_mib_debug_cmd.c: 325: if (c >= 32 && c <= 125)
      0096AE A1 20            [ 1]  934 	cp	a, #0x20
      0096B0 25 12            [ 1]  935 	jrc	00103$
      0096B2 A1 7D            [ 1]  936 	cp	a, #0x7d
      0096B4 22 0E            [ 1]  937 	jrugt	00103$
                                    938 ;	./../../mib/stm8s_mib_debug_cmd.c: 326: mib_printf("%c", c);
      0096B6 5F               [ 1]  939 	clrw	x
      0096B7 97               [ 1]  940 	ld	xl, a
      0096B8 89               [ 2]  941 	pushw	x
      0096B9 4B 66            [ 1]  942 	push	#<(___str_7+0)
      0096BB 4B 82            [ 1]  943 	push	#((___str_7+0) >> 8)
      0096BD CD 91 73         [ 4]  944 	call	_mib_printf
      0096C0 5B 04            [ 2]  945 	addw	sp, #4
      0096C2 20 09            [ 2]  946 	jra	00123$
      0096C4                        947 00103$:
                                    948 ;	./../../mib/stm8s_mib_debug_cmd.c: 328: mib_printf(".");
      0096C4 4B 69            [ 1]  949 	push	#<(___str_8+0)
      0096C6 4B 82            [ 1]  950 	push	#((___str_8+0) >> 8)
      0096C8 CD 91 73         [ 4]  951 	call	_mib_printf
      0096CB 5B 02            [ 2]  952 	addw	sp, #2
      0096CD                        953 00123$:
                                    954 ;	./../../mib/stm8s_mib_debug_cmd.c: 322: for (i = 0; i < 16; i++)
      0096CD 1E 26            [ 2]  955 	ldw	x, (0x26, sp)
      0096CF 5C               [ 1]  956 	incw	x
      0096D0 1F 26            [ 2]  957 	ldw	(0x26, sp), x
      0096D2 A3 00 10         [ 2]  958 	cpw	x, #0x0010
      0096D5 2F D1            [ 1]  959 	jrslt	00122$
                                    960 ;	./../../mib/stm8s_mib_debug_cmd.c: 330: p_address += 16;
      0096D7 16 21            [ 2]  961 	ldw	y, (0x21, sp)
      0096D9 17 1D            [ 2]  962 	ldw	(0x1d, sp), y
      0096DB 16 1F            [ 2]  963 	ldw	y, (0x1f, sp)
      0096DD 17 1B            [ 2]  964 	ldw	(0x1b, sp), y
                                    965 ;	./../../mib/stm8s_mib_debug_cmd.c: 332: mib_printf("\r\n");
      0096DF 4B FE            [ 1]  966 	push	#<(___str_0+0)
      0096E1 4B 81            [ 1]  967 	push	#((___str_0+0) >> 8)
      0096E3 CD 91 73         [ 4]  968 	call	_mib_printf
      0096E6 5B 02            [ 2]  969 	addw	sp, #2
      0096E8 CC 96 07         [ 2]  970 	jp	00107$
      0096EB                        971 00163$:
      0096EB 16 1D            [ 2]  972 	ldw	y, (0x1d, sp)
      0096ED 17 24            [ 2]  973 	ldw	(0x24, sp), y
      0096EF 16 1B            [ 2]  974 	ldw	y, (0x1b, sp)
      0096F1 17 22            [ 2]  975 	ldw	(0x22, sp), y
                                    976 ;	./../../mib/stm8s_mib_debug_cmd.c: 336: if (remainder)
      0096F3 1E 19            [ 2]  977 	ldw	x, (0x19, sp)
      0096F5 26 03            [ 1]  978 	jrne	00248$
      0096F7 CC 98 07         [ 2]  979 	jp	00119$
      0096FA                        980 00248$:
                                    981 ;	./../../mib/stm8s_mib_debug_cmd.c: 338: mib_printf("0x%08lx  ", p_address);
      0096FA 1E 1D            [ 2]  982 	ldw	x, (0x1d, sp)
      0096FC 89               [ 2]  983 	pushw	x
      0096FD 1E 1D            [ 2]  984 	ldw	x, (0x1d, sp)
      0096FF 89               [ 2]  985 	pushw	x
      009700 4B 6B            [ 1]  986 	push	#<(___str_9+0)
      009702 4B 82            [ 1]  987 	push	#((___str_9+0) >> 8)
      009704 CD 91 73         [ 4]  988 	call	_mib_printf
      009707 5B 06            [ 2]  989 	addw	sp, #6
                                    990 ;	./../../mib/stm8s_mib_debug_cmd.c: 339: for (i = 0; i < (remainder >> 1); i++)
      009709 1E 19            [ 2]  991 	ldw	x, (0x19, sp)
      00970B 57               [ 2]  992 	sraw	x
      00970C 1F 1D            [ 2]  993 	ldw	(0x1d, sp), x
      00970E 5F               [ 1]  994 	clrw	x
      00970F 1F 26            [ 2]  995 	ldw	(0x26, sp), x
      009711                        996 00125$:
      009711 1E 26            [ 2]  997 	ldw	x, (0x26, sp)
      009713 13 1D            [ 2]  998 	cpw	x, (0x1d, sp)
      009715 2E 5C            [ 1]  999 	jrsge	00110$
                                   1000 ;	./../../mib/stm8s_mib_debug_cmd.c: 341: p_data_ptr[i] = rd_ADDR16(p_address + i * 2);
      009717 16 26            [ 2] 1001 	ldw	y, (0x26, sp)
      009719 90 58            [ 2] 1002 	sllw	y
      00971B 93               [ 1] 1003 	ldw	x, y
      00971C 89               [ 2] 1004 	pushw	x
      00971D 96               [ 1] 1005 	ldw	x, sp
      00971E 1C 00 03         [ 2] 1006 	addw	x, #3
      009721 72 FB 01         [ 2] 1007 	addw	x, (1, sp)
      009724 5B 02            [ 2] 1008 	addw	sp, #2
      009726 17 20            [ 2] 1009 	ldw	(0x20, sp), y
      009728 16 24            [ 2] 1010 	ldw	y, (0x24, sp)
      00972A 72 F9 20         [ 2] 1011 	addw	y, (0x20, sp)
      00972D 90 FE            [ 2] 1012 	ldw	y, (y)
      00972F FF               [ 2] 1013 	ldw	(x), y
                                   1014 ;	./../../mib/stm8s_mib_debug_cmd.c: 342: mib_printf("%02x ", p_data[i * 2]);
      009730 7B 27            [ 1] 1015 	ld	a, (0x27, sp)
      009732 48               [ 1] 1016 	sll	a
      009733 6B 1F            [ 1] 1017 	ld	(0x1f, sp), a
      009735 6B 21            [ 1] 1018 	ld	(0x21, sp), a
      009737 49               [ 1] 1019 	rlc	a
      009738 4F               [ 1] 1020 	clr	a
      009739 A2 00            [ 1] 1021 	sbc	a, #0x00
      00973B 6B 20            [ 1] 1022 	ld	(0x20, sp), a
      00973D 96               [ 1] 1023 	ldw	x, sp
      00973E 5C               [ 1] 1024 	incw	x
      00973F 72 FB 20         [ 2] 1025 	addw	x, (0x20, sp)
      009742 F6               [ 1] 1026 	ld	a, (x)
      009743 5F               [ 1] 1027 	clrw	x
      009744 97               [ 1] 1028 	ld	xl, a
      009745 89               [ 2] 1029 	pushw	x
      009746 4B 5E            [ 1] 1030 	push	#<(___str_5+0)
      009748 4B 82            [ 1] 1031 	push	#((___str_5+0) >> 8)
      00974A CD 91 73         [ 4] 1032 	call	_mib_printf
      00974D 5B 04            [ 2] 1033 	addw	sp, #4
                                   1034 ;	./../../mib/stm8s_mib_debug_cmd.c: 343: mib_printf("%02x ", p_data[i * 2 + 1]);
      00974F 7B 1F            [ 1] 1035 	ld	a, (0x1f, sp)
      009751 4C               [ 1] 1036 	inc	a
      009752 6B 21            [ 1] 1037 	ld	(0x21, sp), a
      009754 49               [ 1] 1038 	rlc	a
      009755 4F               [ 1] 1039 	clr	a
      009756 A2 00            [ 1] 1040 	sbc	a, #0x00
      009758 6B 20            [ 1] 1041 	ld	(0x20, sp), a
      00975A 96               [ 1] 1042 	ldw	x, sp
      00975B 5C               [ 1] 1043 	incw	x
      00975C 72 FB 20         [ 2] 1044 	addw	x, (0x20, sp)
      00975F F6               [ 1] 1045 	ld	a, (x)
      009760 5F               [ 1] 1046 	clrw	x
      009761 97               [ 1] 1047 	ld	xl, a
      009762 89               [ 2] 1048 	pushw	x
      009763 4B 5E            [ 1] 1049 	push	#<(___str_5+0)
      009765 4B 82            [ 1] 1050 	push	#((___str_5+0) >> 8)
      009767 CD 91 73         [ 4] 1051 	call	_mib_printf
      00976A 5B 04            [ 2] 1052 	addw	sp, #4
                                   1053 ;	./../../mib/stm8s_mib_debug_cmd.c: 339: for (i = 0; i < (remainder >> 1); i++)
      00976C 1E 26            [ 2] 1054 	ldw	x, (0x26, sp)
      00976E 5C               [ 1] 1055 	incw	x
      00976F 1F 26            [ 2] 1056 	ldw	(0x26, sp), x
      009771 20 9E            [ 2] 1057 	jra	00125$
      009773                       1058 00110$:
                                   1059 ;	./../../mib/stm8s_mib_debug_cmd.c: 345: for (i = 0; i < (16 - (remainder >> 1) * 2); i++)
      009773 1E 1D            [ 2] 1060 	ldw	x, (0x1d, sp)
      009775 58               [ 2] 1061 	sllw	x
      009776 1F 26            [ 2] 1062 	ldw	(0x26, sp), x
      009778 A6 10            [ 1] 1063 	ld	a, #0x10
      00977A 10 27            [ 1] 1064 	sub	a, (0x27, sp)
      00977C 6B 25            [ 1] 1065 	ld	(0x25, sp), a
      00977E 4F               [ 1] 1066 	clr	a
      00977F 12 26            [ 1] 1067 	sbc	a, (0x26, sp)
      009781 6B 24            [ 1] 1068 	ld	(0x24, sp), a
      009783 5F               [ 1] 1069 	clrw	x
      009784 1F 26            [ 2] 1070 	ldw	(0x26, sp), x
      009786                       1071 00128$:
      009786 1E 26            [ 2] 1072 	ldw	x, (0x26, sp)
      009788 13 24            [ 2] 1073 	cpw	x, (0x24, sp)
      00978A 2E 10            [ 1] 1074 	jrsge	00111$
                                   1075 ;	./../../mib/stm8s_mib_debug_cmd.c: 347: mib_printf("   ");
      00978C 4B 75            [ 1] 1076 	push	#<(___str_10+0)
      00978E 4B 82            [ 1] 1077 	push	#((___str_10+0) >> 8)
      009790 CD 91 73         [ 4] 1078 	call	_mib_printf
      009793 5B 02            [ 2] 1079 	addw	sp, #2
                                   1080 ;	./../../mib/stm8s_mib_debug_cmd.c: 345: for (i = 0; i < (16 - (remainder >> 1) * 2); i++)
      009795 1E 26            [ 2] 1081 	ldw	x, (0x26, sp)
      009797 5C               [ 1] 1082 	incw	x
      009798 1F 26            [ 2] 1083 	ldw	(0x26, sp), x
      00979A 20 EA            [ 2] 1084 	jra	00128$
      00979C                       1085 00111$:
                                   1086 ;	./../../mib/stm8s_mib_debug_cmd.c: 349: mib_printf(" ");
      00979C 4B 64            [ 1] 1087 	push	#<(___str_6+0)
      00979E 4B 82            [ 1] 1088 	push	#((___str_6+0) >> 8)
      0097A0 CD 91 73         [ 4] 1089 	call	_mib_printf
      0097A3 5B 02            [ 2] 1090 	addw	sp, #2
                                   1091 ;	./../../mib/stm8s_mib_debug_cmd.c: 350: for (i = 0; i < remainder; i++)
      0097A5 5F               [ 1] 1092 	clrw	x
      0097A6 1F 26            [ 2] 1093 	ldw	(0x26, sp), x
      0097A8                       1094 00131$:
      0097A8 1E 26            [ 2] 1095 	ldw	x, (0x26, sp)
      0097AA 13 19            [ 2] 1096 	cpw	x, (0x19, sp)
      0097AC 2E 2C            [ 1] 1097 	jrsge	00116$
                                   1098 ;	./../../mib/stm8s_mib_debug_cmd.c: 352: c = p_data[i];
      0097AE 96               [ 1] 1099 	ldw	x, sp
      0097AF 5C               [ 1] 1100 	incw	x
      0097B0 72 FB 26         [ 2] 1101 	addw	x, (0x26, sp)
      0097B3 F6               [ 1] 1102 	ld	a, (x)
                                   1103 ;	./../../mib/stm8s_mib_debug_cmd.c: 353: if (c >= 32 && c <= 125)
      0097B4 A1 20            [ 1] 1104 	cp	a, #0x20
      0097B6 25 12            [ 1] 1105 	jrc	00113$
      0097B8 A1 7D            [ 1] 1106 	cp	a, #0x7d
      0097BA 22 0E            [ 1] 1107 	jrugt	00113$
                                   1108 ;	./../../mib/stm8s_mib_debug_cmd.c: 354: mib_printf("%c", c);
      0097BC 5F               [ 1] 1109 	clrw	x
      0097BD 97               [ 1] 1110 	ld	xl, a
      0097BE 89               [ 2] 1111 	pushw	x
      0097BF 4B 66            [ 1] 1112 	push	#<(___str_7+0)
      0097C1 4B 82            [ 1] 1113 	push	#((___str_7+0) >> 8)
      0097C3 CD 91 73         [ 4] 1114 	call	_mib_printf
      0097C6 5B 04            [ 2] 1115 	addw	sp, #4
      0097C8 20 09            [ 2] 1116 	jra	00132$
      0097CA                       1117 00113$:
                                   1118 ;	./../../mib/stm8s_mib_debug_cmd.c: 356: mib_printf(".");
      0097CA 4B 69            [ 1] 1119 	push	#<(___str_8+0)
      0097CC 4B 82            [ 1] 1120 	push	#((___str_8+0) >> 8)
      0097CE CD 91 73         [ 4] 1121 	call	_mib_printf
      0097D1 5B 02            [ 2] 1122 	addw	sp, #2
      0097D3                       1123 00132$:
                                   1124 ;	./../../mib/stm8s_mib_debug_cmd.c: 350: for (i = 0; i < remainder; i++)
      0097D3 1E 26            [ 2] 1125 	ldw	x, (0x26, sp)
      0097D5 5C               [ 1] 1126 	incw	x
      0097D6 1F 26            [ 2] 1127 	ldw	(0x26, sp), x
      0097D8 20 CE            [ 2] 1128 	jra	00131$
      0097DA                       1129 00116$:
                                   1130 ;	./../../mib/stm8s_mib_debug_cmd.c: 358: for (i = 0; i < (16 - remainder); i++)
      0097DA A6 10            [ 1] 1131 	ld	a, #0x10
      0097DC 10 1A            [ 1] 1132 	sub	a, (0x1a, sp)
      0097DE 6B 25            [ 1] 1133 	ld	(0x25, sp), a
      0097E0 4F               [ 1] 1134 	clr	a
      0097E1 12 19            [ 1] 1135 	sbc	a, (0x19, sp)
      0097E3 6B 24            [ 1] 1136 	ld	(0x24, sp), a
      0097E5 5F               [ 1] 1137 	clrw	x
      0097E6 1F 26            [ 2] 1138 	ldw	(0x26, sp), x
      0097E8                       1139 00134$:
      0097E8 1E 26            [ 2] 1140 	ldw	x, (0x26, sp)
      0097EA 13 24            [ 2] 1141 	cpw	x, (0x24, sp)
      0097EC 2E 10            [ 1] 1142 	jrsge	00117$
                                   1143 ;	./../../mib/stm8s_mib_debug_cmd.c: 360: mib_printf(" ");
      0097EE 4B 64            [ 1] 1144 	push	#<(___str_6+0)
      0097F0 4B 82            [ 1] 1145 	push	#((___str_6+0) >> 8)
      0097F2 CD 91 73         [ 4] 1146 	call	_mib_printf
      0097F5 5B 02            [ 2] 1147 	addw	sp, #2
                                   1148 ;	./../../mib/stm8s_mib_debug_cmd.c: 358: for (i = 0; i < (16 - remainder); i++)
      0097F7 1E 26            [ 2] 1149 	ldw	x, (0x26, sp)
      0097F9 5C               [ 1] 1150 	incw	x
      0097FA 1F 26            [ 2] 1151 	ldw	(0x26, sp), x
      0097FC 20 EA            [ 2] 1152 	jra	00134$
      0097FE                       1153 00117$:
                                   1154 ;	./../../mib/stm8s_mib_debug_cmd.c: 363: mib_printf("\r\n");
      0097FE 4B FE            [ 1] 1155 	push	#<(___str_0+0)
      009800 4B 81            [ 1] 1156 	push	#((___str_0+0) >> 8)
      009802 CD 91 73         [ 4] 1157 	call	_mib_printf
      009805 5B 02            [ 2] 1158 	addw	sp, #2
      009807                       1159 00119$:
                                   1160 ;	./../../mib/stm8s_mib_debug_cmd.c: 365: return;
                                   1161 ;	./../../mib/stm8s_mib_debug_cmd.c: 366: } // HexDump.
      009807 1E 28            [ 2] 1162 	ldw	x, (40, sp)
      009809 5B 31            [ 2] 1163 	addw	sp, #49
      00980B FC               [ 2] 1164 	jp	(x)
                                   1165 ;	./../../mib/stm8s_mib_debug_cmd.c: 375: int DoPrintHelp(int argc, char **argv)
                                   1166 ;	-----------------------------------------
                                   1167 ;	 function DoPrintHelp
                                   1168 ;	-----------------------------------------
      00980C                       1169 _DoPrintHelp:
      00980C 52 02            [ 2] 1170 	sub	sp, #2
                                   1171 ;	./../../mib/stm8s_mib_debug_cmd.c: 379: if (argc == 1)
      00980E 5A               [ 2] 1172 	decw	x
      00980F 26 39            [ 1] 1173 	jrne	00105$
                                   1174 ;	./../../mib/stm8s_mib_debug_cmd.c: 381: mib_printf("*******\r\n");
      009811 4B 79            [ 1] 1175 	push	#<(___str_11+0)
      009813 4B 82            [ 1] 1176 	push	#((___str_11+0) >> 8)
      009815 CD 91 73         [ 4] 1177 	call	_mib_printf
      009818 5B 02            [ 2] 1178 	addw	sp, #2
                                   1179 ;	./../../mib/stm8s_mib_debug_cmd.c: 382: mib_printf("  help  Help for commands.\r\n");
      00981A 4B 83            [ 1] 1180 	push	#<(___str_12+0)
      00981C 4B 82            [ 1] 1181 	push	#((___str_12+0) >> 8)
      00981E CD 91 73         [ 4] 1182 	call	_mib_printf
      009821 5B 02            [ 2] 1183 	addw	sp, #2
                                   1184 ;	./../../mib/stm8s_mib_debug_cmd.c: 384: for (cptr = cmdTbl; cptr->cmd; cptr++)
      009823 AE 01 4F         [ 2] 1185 	ldw	x, #(_cmdTbl+0)
      009826 1F 01            [ 2] 1186 	ldw	(0x01, sp), x
      009828                       1187 00108$:
      009828 1E 01            [ 2] 1188 	ldw	x, (0x01, sp)
      00982A FE               [ 2] 1189 	ldw	x, (x)
      00982B 27 12            [ 1] 1190 	jreq	00103$
                                   1191 ;	./../../mib/stm8s_mib_debug_cmd.c: 386: if (cptr->usage)
      00982D 1E 01            [ 2] 1192 	ldw	x, (0x01, sp)
      00982F EE 04            [ 2] 1193 	ldw	x, (0x4, x)
      009831 27 03            [ 1] 1194 	jreq	00109$
                                   1195 ;	./../../mib/stm8s_mib_debug_cmd.c: 387: MibWriteDebugString(cptr->usage);
      009833 CD 87 62         [ 4] 1196 	call	_MibWriteDebugString
      009836                       1197 00109$:
                                   1198 ;	./../../mib/stm8s_mib_debug_cmd.c: 384: for (cptr = cmdTbl; cptr->cmd; cptr++)
      009836 1E 01            [ 2] 1199 	ldw	x, (0x01, sp)
      009838 1C 00 06         [ 2] 1200 	addw	x, #0x0006
      00983B 1F 01            [ 2] 1201 	ldw	(0x01, sp), x
      00983D 20 E9            [ 2] 1202 	jra	00108$
      00983F                       1203 00103$:
                                   1204 ;	./../../mib/stm8s_mib_debug_cmd.c: 389: mib_printf("*******\r\n");
      00983F 4B 79            [ 1] 1205 	push	#<(___str_11+0)
      009841 4B 82            [ 1] 1206 	push	#((___str_11+0) >> 8)
      009843 CD 91 73         [ 4] 1207 	call	_mib_printf
      009846 5B 02            [ 2] 1208 	addw	sp, #2
      009848 20 1F            [ 2] 1209 	jra	00106$
      00984A                       1210 00105$:
                                   1211 ;	./../../mib/stm8s_mib_debug_cmd.c: 393: mib_printf("\tUnknown command : ");
      00984A 4B A0            [ 1] 1212 	push	#<(___str_13+0)
      00984C 4B 82            [ 1] 1213 	push	#((___str_13+0) >> 8)
      00984E CD 91 73         [ 4] 1214 	call	_mib_printf
      009851 5B 02            [ 2] 1215 	addw	sp, #2
                                   1216 ;	./../../mib/stm8s_mib_debug_cmd.c: 394: mib_printf("%s", argv[0]);
      009853 1E 05            [ 2] 1217 	ldw	x, (0x05, sp)
      009855 FE               [ 2] 1218 	ldw	x, (x)
      009856 89               [ 2] 1219 	pushw	x
      009857 4B B4            [ 1] 1220 	push	#<(___str_14+0)
      009859 4B 82            [ 1] 1221 	push	#((___str_14+0) >> 8)
      00985B CD 91 73         [ 4] 1222 	call	_mib_printf
      00985E 5B 04            [ 2] 1223 	addw	sp, #4
                                   1224 ;	./../../mib/stm8s_mib_debug_cmd.c: 395: mib_printf("\r\n");
      009860 4B FE            [ 1] 1225 	push	#<(___str_0+0)
      009862 4B 81            [ 1] 1226 	push	#((___str_0+0) >> 8)
      009864 CD 91 73         [ 4] 1227 	call	_mib_printf
      009867 5B 02            [ 2] 1228 	addw	sp, #2
      009869                       1229 00106$:
                                   1230 ;	./../../mib/stm8s_mib_debug_cmd.c: 397: return TRUE;
      009869 5F               [ 1] 1231 	clrw	x
      00986A 5C               [ 1] 1232 	incw	x
                                   1233 ;	./../../mib/stm8s_mib_debug_cmd.c: 398: }
      00986B 5B 02            [ 2] 1234 	addw	sp, #2
      00986D 90 85            [ 2] 1235 	popw	y
      00986F 5B 02            [ 2] 1236 	addw	sp, #2
      009871 90 FC            [ 2] 1237 	jp	(y)
                                   1238 ;	./../../mib/stm8s_mib_debug_cmd.c: 408: int getdec(uint8_t **ptr)
                                   1239 ;	-----------------------------------------
                                   1240 ;	 function getdec
                                   1241 ;	-----------------------------------------
      009873                       1242 _getdec:
      009873 52 06            [ 2] 1243 	sub	sp, #6
                                   1244 ;	./../../mib/stm8s_mib_debug_cmd.c: 410: uint8_t *p = *ptr;
      009875 1F 05            [ 2] 1245 	ldw	(0x05, sp), x
      009877 FE               [ 2] 1246 	ldw	x, (x)
      009878 1F 01            [ 2] 1247 	ldw	(0x01, sp), x
                                   1248 ;	./../../mib/stm8s_mib_debug_cmd.c: 411: int ret = 0;
      00987A 5F               [ 1] 1249 	clrw	x
      00987B 1F 03            [ 2] 1250 	ldw	(0x03, sp), x
                                   1251 ;	./../../mib/stm8s_mib_debug_cmd.c: 412: if ((*p < '0') || (*p > '9'))
      00987D 1E 01            [ 2] 1252 	ldw	x, (0x01, sp)
      00987F F6               [ 1] 1253 	ld	a, (x)
      009880 A1 30            [ 1] 1254 	cp	a, #0x30
      009882 25 04            [ 1] 1255 	jrc	00101$
      009884 A1 39            [ 1] 1256 	cp	a, #0x39
      009886 23 04            [ 2] 1257 	jrule	00113$
      009888                       1258 00101$:
                                   1259 ;	./../../mib/stm8s_mib_debug_cmd.c: 413: return (-1);
      009888 5F               [ 1] 1260 	clrw	x
      009889 5A               [ 2] 1261 	decw	x
      00988A 20 29            [ 2] 1262 	jra	00108$
                                   1263 ;	./../../mib/stm8s_mib_debug_cmd.c: 414: while ((*p >= '0') && (*p <= '9'))
      00988C                       1264 00113$:
      00988C 16 01            [ 2] 1265 	ldw	y, (0x01, sp)
      00988E                       1266 00105$:
      00988E 90 F6            [ 1] 1267 	ld	a, (y)
      009890 A1 30            [ 1] 1268 	cp	a, #0x30
      009892 25 1C            [ 1] 1269 	jrc	00107$
      009894 A1 39            [ 1] 1270 	cp	a, #0x39
      009896 22 18            [ 1] 1271 	jrugt	00107$
                                   1272 ;	./../../mib/stm8s_mib_debug_cmd.c: 416: ret = ret * 10 + (int)(*p - '0');
      009898 1E 03            [ 2] 1273 	ldw	x, (0x03, sp)
      00989A 58               [ 2] 1274 	sllw	x
      00989B 58               [ 2] 1275 	sllw	x
      00989C 72 FB 03         [ 2] 1276 	addw	x, (0x03, sp)
      00989F 58               [ 2] 1277 	sllw	x
      0098A0 1F 03            [ 2] 1278 	ldw	(0x03, sp), x
      0098A2 5F               [ 1] 1279 	clrw	x
      0098A3 97               [ 1] 1280 	ld	xl, a
      0098A4 1D 00 30         [ 2] 1281 	subw	x, #0x0030
      0098A7 72 FB 03         [ 2] 1282 	addw	x, (0x03, sp)
      0098AA 1F 03            [ 2] 1283 	ldw	(0x03, sp), x
                                   1284 ;	./../../mib/stm8s_mib_debug_cmd.c: 417: p++;
      0098AC 90 5C            [ 1] 1285 	incw	y
      0098AE 20 DE            [ 2] 1286 	jra	00105$
      0098B0                       1287 00107$:
                                   1288 ;	./../../mib/stm8s_mib_debug_cmd.c: 419: *ptr = p;
      0098B0 1E 05            [ 2] 1289 	ldw	x, (0x05, sp)
      0098B2 FF               [ 2] 1290 	ldw	(x), y
                                   1291 ;	./../../mib/stm8s_mib_debug_cmd.c: 420: return (ret);
      0098B3 1E 03            [ 2] 1292 	ldw	x, (0x03, sp)
      0098B5                       1293 00108$:
                                   1294 ;	./../../mib/stm8s_mib_debug_cmd.c: 421: }
      0098B5 5B 06            [ 2] 1295 	addw	sp, #6
      0098B7 81               [ 4] 1296 	ret
                                   1297 	.area CODE
                                   1298 	.area CONST
                                   1299 	.area CONST
      0081FE                       1300 ___str_0:
      0081FE 0D                    1301 	.db 0x0d
      0081FF 0A                    1302 	.db 0x0a
      008200 00                    1303 	.db 0x00
                                   1304 	.area CODE
                                   1305 	.area CONST
      008201                       1306 ___str_1:
      008201 08                    1307 	.db 0x08
      008202 20                    1308 	.ascii " "
      008203 08                    1309 	.db 0x08
      008204 00                    1310 	.db 0x00
                                   1311 	.area CODE
                                   1312 	.area CONST
      008205                       1313 ___str_2:
      008205 30 78                 1314 	.ascii "0x"
      008207 00                    1315 	.db 0x00
                                   1316 	.area CODE
                                   1317 	.area CONST
      008208                       1318 ___str_3:
      008208 61 64 64 72 65 73 73  1319 	.ascii "address     Hex Value                                       "
             20 20 20 20 20 48 65
             78 20 56 61 6C 75 65
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      008244 20 41 73 63 69 69 20  1320 	.ascii " Ascii value"
             76 61 6C 75 65
      008250 0D                    1321 	.db 0x0d
      008251 0A                    1322 	.db 0x0a
      008252 00                    1323 	.db 0x00
                                   1324 	.area CODE
                                   1325 	.area CONST
      008253                       1326 ___str_4:
      008253 30 78 25 30 38 6C 78  1327 	.ascii "0x%08lx : "
             20 3A 20
      00825D 00                    1328 	.db 0x00
                                   1329 	.area CODE
                                   1330 	.area CONST
      00825E                       1331 ___str_5:
      00825E 25 30 32 78 20        1332 	.ascii "%02x "
      008263 00                    1333 	.db 0x00
                                   1334 	.area CODE
                                   1335 	.area CONST
      008264                       1336 ___str_6:
      008264 20                    1337 	.ascii " "
      008265 00                    1338 	.db 0x00
                                   1339 	.area CODE
                                   1340 	.area CONST
      008266                       1341 ___str_7:
      008266 25 63                 1342 	.ascii "%c"
      008268 00                    1343 	.db 0x00
                                   1344 	.area CODE
                                   1345 	.area CONST
      008269                       1346 ___str_8:
      008269 2E                    1347 	.ascii "."
      00826A 00                    1348 	.db 0x00
                                   1349 	.area CODE
                                   1350 	.area CONST
      00826B                       1351 ___str_9:
      00826B 30 78 25 30 38 6C 78  1352 	.ascii "0x%08lx  "
             20 20
      008274 00                    1353 	.db 0x00
                                   1354 	.area CODE
                                   1355 	.area CONST
      008275                       1356 ___str_10:
      008275 20 20 20              1357 	.ascii "   "
      008278 00                    1358 	.db 0x00
                                   1359 	.area CODE
                                   1360 	.area CONST
      008279                       1361 ___str_11:
      008279 2A 2A 2A 2A 2A 2A 2A  1362 	.ascii "*******"
      008280 0D                    1363 	.db 0x0d
      008281 0A                    1364 	.db 0x0a
      008282 00                    1365 	.db 0x00
                                   1366 	.area CODE
                                   1367 	.area CONST
      008283                       1368 ___str_12:
      008283 20 20 68 65 6C 70 20  1369 	.ascii "  help  Help for commands."
             20 48 65 6C 70 20 66
             6F 72 20 63 6F 6D 6D
             61 6E 64 73 2E
      00829D 0D                    1370 	.db 0x0d
      00829E 0A                    1371 	.db 0x0a
      00829F 00                    1372 	.db 0x00
                                   1373 	.area CODE
                                   1374 	.area CONST
      0082A0                       1375 ___str_13:
      0082A0 09                    1376 	.db 0x09
      0082A1 55 6E 6B 6E 6F 77 6E  1377 	.ascii "Unknown command : "
             20 63 6F 6D 6D 61 6E
             64 20 3A 20
      0082B3 00                    1378 	.db 0x00
                                   1379 	.area CODE
                                   1380 	.area CONST
      0082B4                       1381 ___str_14:
      0082B4 25 73                 1382 	.ascii "%s"
      0082B6 00                    1383 	.db 0x00
                                   1384 	.area CODE
                                   1385 	.area INITIALIZER
      00860F                       1386 __xinit__cmdTbl:
      00860F 00 00                 1387 	.dw #0x0000
      008611 00 00                 1388 	.dw #0x0000
      008613 00 00                 1389 	.dw #0x0000
      008615 00 00                 1390 	.dw #0x0000
      008617 00 00                 1391 	.dw #0x0000
      008619 00 00                 1392 	.dw #0x0000
      00861B 00 00                 1393 	.dw #0x0000
      00861D 00 00                 1394 	.dw #0x0000
      00861F 00 00                 1395 	.dw #0x0000
      008621 00 00                 1396 	.dw #0x0000
      008623 00 00                 1397 	.dw #0x0000
      008625 00 00                 1398 	.dw #0x0000
      008627 00 00                 1399 	.dw #0x0000
      008629 00 00                 1400 	.dw #0x0000
      00862B 00 00                 1401 	.dw #0x0000
      00862D 00 00                 1402 	.dw #0x0000
      00862F 00 00                 1403 	.dw #0x0000
      008631 00 00                 1404 	.dw #0x0000
                                   1405 	.area CABS (ABS)
