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
      000048                         33 _cmd_list::
      000048                         34 	.ds 258
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area INITIALIZED
      00015E                         39 _cmdTbl::
      00015E                         40 	.ds 36
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
      00B0B5                         74 _GetCommand:
      00B0B5 52 10            [ 2]   75 	sub	sp, #16
      00B0B7 1F 0D            [ 2]   76 	ldw	(0x0d, sp), x
                                     77 ;	./../../mib/stm8s_mib_debug_cmd.c: 60: uint16_t vwIndex, rdCnt, rdMax = len - 1;
      00B0B9 1E 13            [ 2]   78 	ldw	x, (0x13, sp)
      00B0BB 5A               [ 2]   79 	decw	x
      00B0BC 1F 01            [ 2]   80 	ldw	(0x01, sp), x
                                     81 ;	./../../mib/stm8s_mib_debug_cmd.c: 63: endTime = MibGetSecs() + (uint16_t)timeout;
      00B0BE CD B0 A8         [ 4]   82 	call	_MibGetSecs
      00B0C1 7B 15            [ 1]   83 	ld	a, (0x15, sp)
      00B0C3 6B 10            [ 1]   84 	ld	(0x10, sp), a
      00B0C5 0F 0F            [ 1]   85 	clr	(0x0f, sp)
      00B0C7 72 FB 0F         [ 2]   86 	addw	x, (0x0f, sp)
      00B0CA 1F 03            [ 2]   87 	ldw	(0x03, sp), x
                                     88 ;	./../../mib/stm8s_mib_debug_cmd.c: 64: cmd_list.cur = cmd_list.next;
      00B0CC C6 00 49         [ 1]   89 	ld	a, _cmd_list+1
      00B0CF C7 00 48         [ 1]   90 	ld	_cmd_list+0, a
                                     91 ;	./../../mib/stm8s_mib_debug_cmd.c: 65: for (rdCnt = 0, vwIndex = 0; rdCnt <= rdMax;)
      00B0D2 5F               [ 1]   92 	clrw	x
      00B0D3 1F 0F            [ 2]   93 	ldw	(0x0f, sp), x
      00B0D5                         94 00148$:
      00B0D5 1E 0F            [ 2]   95 	ldw	x, (0x0f, sp)
      00B0D7 13 01            [ 2]   96 	cpw	x, (0x01, sp)
      00B0D9 23 03            [ 2]   97 	jrule	00237$
      00B0DB CC B2 A1         [ 2]   98 	jp	00146$
      00B0DE                         99 00237$:
                                    100 ;	./../../mib/stm8s_mib_debug_cmd.c: 68: while (1)
      00B0DE                        101 00106$:
                                    102 ;	./../../mib/stm8s_mib_debug_cmd.c: 70: vwCh = MibReadDebugByte();
      00B0DE CD A6 40         [ 4]  103 	call	_MibReadDebugByte
                                    104 ;	./../../mib/stm8s_mib_debug_cmd.c: 71: if (vwCh != 0xffff)	break;
      00B0E1 1F 05            [ 2]  105 	ldw	(0x05, sp), x
      00B0E3 1F 07            [ 2]  106 	ldw	(0x07, sp), x
                                    107 ;	./../../mib/stm8s_mib_debug_cmd.c: 74: cmd[rdCnt++] = '\0';
      00B0E5 1E 0F            [ 2]  108 	ldw	x, (0x0f, sp)
      00B0E7 5C               [ 1]  109 	incw	x
      00B0E8 1F 09            [ 2]  110 	ldw	(0x09, sp), x
                                    111 ;	./../../mib/stm8s_mib_debug_cmd.c: 76: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      00B0EA 16 0D            [ 2]  112 	ldw	y, (0x0d, sp)
      00B0EC 17 0B            [ 2]  113 	ldw	(0x0b, sp), y
                                    114 ;	./../../mib/stm8s_mib_debug_cmd.c: 71: if (vwCh != 0xffff)	break;
      00B0EE 1E 07            [ 2]  115 	ldw	x, (0x07, sp)
      00B0F0 5C               [ 1]  116 	incw	x
      00B0F1 26 55            [ 1]  117 	jrne	00107$
                                    118 ;	./../../mib/stm8s_mib_debug_cmd.c: 72: if (MibGetSecs() > endTime)
      00B0F3 CD B0 A8         [ 4]  119 	call	_MibGetSecs
      00B0F6 13 03            [ 2]  120 	cpw	x, (0x03, sp)
      00B0F8 23 E4            [ 2]  121 	jrule	00106$
                                    122 ;	./../../mib/stm8s_mib_debug_cmd.c: 74: cmd[rdCnt++] = '\0';
      00B0FA 1E 0F            [ 2]  123 	ldw	x, (0x0f, sp)
      00B0FC 16 09            [ 2]  124 	ldw	y, (0x09, sp)
      00B0FE 17 0F            [ 2]  125 	ldw	(0x0f, sp), y
      00B100 72 FB 0D         [ 2]  126 	addw	x, (0x0d, sp)
      00B103 7F               [ 1]  127 	clr	(x)
                                    128 ;	./../../mib/stm8s_mib_debug_cmd.c: 75: memset(cmd_list.buf[cmd_list.next], 0, CMD_CHAR_MAX);
      00B104 C6 00 49         [ 1]  129 	ld	a, _cmd_list+1
      00B107 97               [ 1]  130 	ld	xl, a
      00B108 A6 40            [ 1]  131 	ld	a, #0x40
      00B10A 42               [ 4]  132 	mul	x, a
      00B10B 1C 00 4A         [ 2]  133 	addw	x, #(_cmd_list+2)
      00B10E 4B 40            [ 1]  134 	push	#0x40
      00B110 4B 00            [ 1]  135 	push	#0x00
      00B112 4B 00            [ 1]  136 	push	#0x00
      00B114 4B 00            [ 1]  137 	push	#0x00
      00B116 CD C3 03         [ 4]  138 	call	_memset
                                    139 ;	./../../mib/stm8s_mib_debug_cmd.c: 76: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      00B119 1E 0D            [ 2]  140 	ldw	x, (0x0d, sp)
      00B11B CD C3 27         [ 4]  141 	call	_strlen
      00B11E 51               [ 1]  142 	exgw	x, y
      00B11F C6 00 49         [ 1]  143 	ld	a, _cmd_list+1
      00B122 97               [ 1]  144 	ld	xl, a
      00B123 A6 40            [ 1]  145 	ld	a, #0x40
      00B125 42               [ 4]  146 	mul	x, a
      00B126 1C 00 4A         [ 2]  147 	addw	x, #(_cmd_list+2)
      00B129 90 89            [ 2]  148 	pushw	y
      00B12B 16 0D            [ 2]  149 	ldw	y, (0x0d, sp)
      00B12D 90 89            [ 2]  150 	pushw	y
      00B12F CD C2 B0         [ 4]  151 	call	___memcpy
                                    152 ;	./../../mib/stm8s_mib_debug_cmd.c: 77: cmd_list.next = (cmd_list.next + 1) % CMD_LINE_MAX;
      00B132 C6 00 49         [ 1]  153 	ld	a, _cmd_list+1
      00B135 5F               [ 1]  154 	clrw	x
      00B136 97               [ 1]  155 	ld	xl, a
      00B137 5C               [ 1]  156 	incw	x
      00B138 4B 04            [ 1]  157 	push	#0x04
      00B13A 4B 00            [ 1]  158 	push	#0x00
      00B13C CD C3 71         [ 4]  159 	call	__modsint
      00B13F 9F               [ 1]  160 	ld	a, xl
      00B140 C7 00 49         [ 1]  161 	ld	_cmd_list+1, a
                                    162 ;	./../../mib/stm8s_mib_debug_cmd.c: 78: return rdCnt;
      00B143 1E 0F            [ 2]  163 	ldw	x, (0x0f, sp)
      00B145 CC B2 A3         [ 2]  164 	jp	00150$
      00B148                        165 00107$:
                                    166 ;	./../../mib/stm8s_mib_debug_cmd.c: 84: if ((vwCh == '\r') || (vwCh == '\n'))
      00B148 1E 07            [ 2]  167 	ldw	x, (0x07, sp)
      00B14A A3 00 0D         [ 2]  168 	cpw	x, #0x000d
      00B14D 27 07            [ 1]  169 	jreq	00142$
      00B14F 1E 07            [ 2]  170 	ldw	x, (0x07, sp)
      00B151 A3 00 0A         [ 2]  171 	cpw	x, #0x000a
      00B154 26 57            [ 1]  172 	jrne	00143$
      00B156                        173 00142$:
                                    174 ;	./../../mib/stm8s_mib_debug_cmd.c: 86: cmd[rdCnt++] = '\0';
      00B156 1E 0F            [ 2]  175 	ldw	x, (0x0f, sp)
      00B158 16 09            [ 2]  176 	ldw	y, (0x09, sp)
      00B15A 17 0F            [ 2]  177 	ldw	(0x0f, sp), y
      00B15C 72 FB 0D         [ 2]  178 	addw	x, (0x0d, sp)
      00B15F 7F               [ 1]  179 	clr	(x)
                                    180 ;	./../../mib/stm8s_mib_debug_cmd.c: 87: memset(cmd_list.buf[cmd_list.next], 0, CMD_CHAR_MAX);
      00B160 C6 00 49         [ 1]  181 	ld	a, _cmd_list+1
      00B163 97               [ 1]  182 	ld	xl, a
      00B164 A6 40            [ 1]  183 	ld	a, #0x40
      00B166 42               [ 4]  184 	mul	x, a
      00B167 1C 00 4A         [ 2]  185 	addw	x, #(_cmd_list+2)
      00B16A 4B 40            [ 1]  186 	push	#0x40
      00B16C 4B 00            [ 1]  187 	push	#0x00
      00B16E 4B 00            [ 1]  188 	push	#0x00
      00B170 4B 00            [ 1]  189 	push	#0x00
      00B172 CD C3 03         [ 4]  190 	call	_memset
                                    191 ;	./../../mib/stm8s_mib_debug_cmd.c: 88: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      00B175 1E 0D            [ 2]  192 	ldw	x, (0x0d, sp)
      00B177 CD C3 27         [ 4]  193 	call	_strlen
      00B17A 51               [ 1]  194 	exgw	x, y
      00B17B C6 00 49         [ 1]  195 	ld	a, _cmd_list+1
      00B17E 97               [ 1]  196 	ld	xl, a
      00B17F A6 40            [ 1]  197 	ld	a, #0x40
      00B181 42               [ 4]  198 	mul	x, a
      00B182 1C 00 4A         [ 2]  199 	addw	x, #(_cmd_list+2)
      00B185 90 89            [ 2]  200 	pushw	y
      00B187 16 0D            [ 2]  201 	ldw	y, (0x0d, sp)
      00B189 90 89            [ 2]  202 	pushw	y
      00B18B CD C2 B0         [ 4]  203 	call	___memcpy
                                    204 ;	./../../mib/stm8s_mib_debug_cmd.c: 89: cmd_list.next = (cmd_list.next + 1) % CMD_LINE_MAX;
      00B18E C6 00 49         [ 1]  205 	ld	a, _cmd_list+1
      00B191 5F               [ 1]  206 	clrw	x
      00B192 97               [ 1]  207 	ld	xl, a
      00B193 5C               [ 1]  208 	incw	x
      00B194 4B 04            [ 1]  209 	push	#0x04
      00B196 4B 00            [ 1]  210 	push	#0x00
      00B198 CD C3 71         [ 4]  211 	call	__modsint
      00B19B 9F               [ 1]  212 	ld	a, xl
      00B19C C7 00 49         [ 1]  213 	ld	_cmd_list+1, a
                                    214 ;	./../../mib/stm8s_mib_debug_cmd.c: 91: mib_printf("\r\n");
      00B19F 4B 51            [ 1]  215 	push	#<(___str_0+0)
      00B1A1 4B 8C            [ 1]  216 	push	#((___str_0+0) >> 8)
      00B1A3 CD B0 3B         [ 4]  217 	call	_mib_printf
      00B1A6 5B 02            [ 2]  218 	addw	sp, #2
                                    219 ;	./../../mib/stm8s_mib_debug_cmd.c: 92: return rdCnt;
      00B1A8 1E 0F            [ 2]  220 	ldw	x, (0x0f, sp)
      00B1AA CC B2 A3         [ 2]  221 	jp	00150$
      00B1AD                        222 00143$:
                                    223 ;	./../../mib/stm8s_mib_debug_cmd.c: 94: else if (vwCh == '\b')
      00B1AD 1E 07            [ 2]  224 	ldw	x, (0x07, sp)
      00B1AF A3 00 08         [ 2]  225 	cpw	x, #0x0008
      00B1B2 26 18            [ 1]  226 	jrne	00140$
                                    227 ;	./../../mib/stm8s_mib_debug_cmd.c: 96: if (rdCnt > 0)
      00B1B4 1E 0F            [ 2]  228 	ldw	x, (0x0f, sp)
      00B1B6 26 03            [ 1]  229 	jrne	00251$
      00B1B8 CC B0 D5         [ 2]  230 	jp	00148$
      00B1BB                        231 00251$:
                                    232 ;	./../../mib/stm8s_mib_debug_cmd.c: 98: rdCnt--;
      00B1BB 1E 0F            [ 2]  233 	ldw	x, (0x0f, sp)
      00B1BD 5A               [ 2]  234 	decw	x
      00B1BE 1F 0F            [ 2]  235 	ldw	(0x0f, sp), x
                                    236 ;	./../../mib/stm8s_mib_debug_cmd.c: 100: mib_printf("\b \b");
      00B1C0 4B 54            [ 1]  237 	push	#<(___str_1+0)
      00B1C2 4B 8C            [ 1]  238 	push	#((___str_1+0) >> 8)
      00B1C4 CD B0 3B         [ 4]  239 	call	_mib_printf
      00B1C7 5B 02            [ 2]  240 	addw	sp, #2
      00B1C9 CC B0 D5         [ 2]  241 	jp	00148$
      00B1CC                        242 00140$:
                                    243 ;	./../../mib/stm8s_mib_debug_cmd.c: 103: else if (vwCh == 0x1b)
      00B1CC 1E 07            [ 2]  244 	ldw	x, (0x07, sp)
      00B1CE A3 00 1B         [ 2]  245 	cpw	x, #0x001b
      00B1D1 27 03            [ 1]  246 	jreq	00254$
      00B1D3 CC B2 8F         [ 2]  247 	jp	00137$
      00B1D6                        248 00254$:
                                    249 ;	./../../mib/stm8s_mib_debug_cmd.c: 106: while (1)
      00B1D6                        250 00113$:
                                    251 ;	./../../mib/stm8s_mib_debug_cmd.c: 108: vwCh = MibReadDebugByte();
      00B1D6 CD A6 40         [ 4]  252 	call	_MibReadDebugByte
                                    253 ;	./../../mib/stm8s_mib_debug_cmd.c: 109: if (vwCh != 0xffff)
      00B1D9 A3 FF FF         [ 2]  254 	cpw	x, #0xffff
      00B1DC 27 F8            [ 1]  255 	jreq	00113$
                                    256 ;	./../../mib/stm8s_mib_debug_cmd.c: 112: if (vwCh == '[')
      00B1DE A3 00 5B         [ 2]  257 	cpw	x, #0x005b
      00B1E1 27 03            [ 1]  258 	jreq	00260$
      00B1E3 CC B0 D5         [ 2]  259 	jp	00148$
      00B1E6                        260 00260$:
                                    261 ;	./../../mib/stm8s_mib_debug_cmd.c: 115: while (1)
      00B1E6                        262 00118$:
                                    263 ;	./../../mib/stm8s_mib_debug_cmd.c: 117: vwCh = MibReadDebugByte();
      00B1E6 CD A6 40         [ 4]  264 	call	_MibReadDebugByte
                                    265 ;	./../../mib/stm8s_mib_debug_cmd.c: 118: if (vwCh != 0xffff)
      00B1E9 1F 09            [ 2]  266 	ldw	(0x09, sp), x
      00B1EB 5C               [ 1]  267 	incw	x
      00B1EC 27 F8            [ 1]  268 	jreq	00118$
                                    269 ;	./../../mib/stm8s_mib_debug_cmd.c: 122: if (vwCh == 'B')
      00B1EE 1E 09            [ 2]  270 	ldw	x, (0x09, sp)
      00B1F0 A3 00 42         [ 2]  271 	cpw	x, #0x0042
      00B1F3 26 48            [ 1]  272 	jrne	00132$
                                    273 ;	./../../mib/stm8s_mib_debug_cmd.c: 124: cmd_list.cur++;
      00B1F5 C6 00 48         [ 1]  274 	ld	a, _cmd_list+0
      00B1F8 4C               [ 1]  275 	inc	a
      00B1F9 C7 00 48         [ 1]  276 	ld	_cmd_list+0, a
                                    277 ;	./../../mib/stm8s_mib_debug_cmd.c: 125: if (cmd_list.cur == CMD_LINE_MAX)
      00B1FC A1 04            [ 1]  278 	cp	a, #0x04
      00B1FE 26 04            [ 1]  279 	jrne	00121$
                                    280 ;	./../../mib/stm8s_mib_debug_cmd.c: 126: cmd_list.cur = 0;
      00B200 35 00 00 48      [ 1]  281 	mov	_cmd_list+0, #0x00
      00B204                        282 00121$:
                                    283 ;	./../../mib/stm8s_mib_debug_cmd.c: 127: rdCnt = strlen(cmd_list.buf[cmd_list.cur]);
      00B204 C6 00 48         [ 1]  284 	ld	a, _cmd_list+0
      00B207 97               [ 1]  285 	ld	xl, a
      00B208 A6 40            [ 1]  286 	ld	a, #0x40
      00B20A 42               [ 4]  287 	mul	x, a
      00B20B 1C 00 4A         [ 2]  288 	addw	x, #(_cmd_list+2)
      00B20E CD C3 27         [ 4]  289 	call	_strlen
                                    290 ;	./../../mib/stm8s_mib_debug_cmd.c: 128: if (rdCnt >= rdMax)
      00B211 1F 0F            [ 2]  291 	ldw	(0x0f, sp), x
      00B213 13 01            [ 2]  292 	cpw	x, (0x01, sp)
      00B215 25 04            [ 1]  293 	jrc	00123$
                                    294 ;	./../../mib/stm8s_mib_debug_cmd.c: 129: rdCnt = rdMax;
      00B217 16 01            [ 2]  295 	ldw	y, (0x01, sp)
      00B219 17 0F            [ 2]  296 	ldw	(0x0f, sp), y
      00B21B                        297 00123$:
                                    298 ;	./../../mib/stm8s_mib_debug_cmd.c: 130: memcpy(cmd, cmd_list.buf[cmd_list.cur], rdCnt);
      00B21B 16 0F            [ 2]  299 	ldw	y, (0x0f, sp)
      00B21D C6 00 48         [ 1]  300 	ld	a, _cmd_list+0
      00B220 97               [ 1]  301 	ld	xl, a
      00B221 A6 40            [ 1]  302 	ld	a, #0x40
      00B223 42               [ 4]  303 	mul	x, a
      00B224 1C 00 4A         [ 2]  304 	addw	x, #(_cmd_list+2)
      00B227 90 89            [ 2]  305 	pushw	y
      00B229 89               [ 2]  306 	pushw	x
      00B22A 1E 0F            [ 2]  307 	ldw	x, (0x0f, sp)
      00B22C CD C2 B0         [ 4]  308 	call	___memcpy
                                    309 ;	./../../mib/stm8s_mib_debug_cmd.c: 131: cmd[rdCnt] = 0;
      00B22F 1E 0D            [ 2]  310 	ldw	x, (0x0d, sp)
      00B231 72 FB 0F         [ 2]  311 	addw	x, (0x0f, sp)
      00B234 7F               [ 1]  312 	clr	(x)
                                    313 ;	./../../mib/stm8s_mib_debug_cmd.c: 133: MibWriteDebugString(cmd);
      00B235 1E 0D            [ 2]  314 	ldw	x, (0x0d, sp)
      00B237 CD A6 1F         [ 4]  315 	call	_MibWriteDebugString
      00B23A CC B0 D5         [ 2]  316 	jp	00148$
      00B23D                        317 00132$:
                                    318 ;	./../../mib/stm8s_mib_debug_cmd.c: 135: else if (vwCh == 'A')
      00B23D 1E 09            [ 2]  319 	ldw	x, (0x09, sp)
      00B23F A3 00 41         [ 2]  320 	cpw	x, #0x0041
      00B242 27 03            [ 1]  321 	jreq	00273$
      00B244 CC B0 D5         [ 2]  322 	jp	00148$
      00B247                        323 00273$:
                                    324 ;	./../../mib/stm8s_mib_debug_cmd.c: 124: cmd_list.cur++;
                                    325 ;	./../../mib/stm8s_mib_debug_cmd.c: 137: if (cmd_list.cur == 0)
      00B247 C6 00 48         [ 1]  326 	ld	a, _cmd_list+0
      00B24A 26 06            [ 1]  327 	jrne	00125$
                                    328 ;	./../../mib/stm8s_mib_debug_cmd.c: 138: cmd_list.cur = CMD_LINE_MAX - 1;
      00B24C 35 03 00 48      [ 1]  329 	mov	_cmd_list+0, #0x03
      00B250 20 04            [ 2]  330 	jra	00126$
      00B252                        331 00125$:
                                    332 ;	./../../mib/stm8s_mib_debug_cmd.c: 140: cmd_list.cur--;
      00B252 4A               [ 1]  333 	dec	a
      00B253 C7 00 48         [ 1]  334 	ld	_cmd_list+0, a
      00B256                        335 00126$:
                                    336 ;	./../../mib/stm8s_mib_debug_cmd.c: 141: rdCnt = strlen(cmd_list.buf[cmd_list.cur]);
      00B256 C6 00 48         [ 1]  337 	ld	a, _cmd_list+0
      00B259 97               [ 1]  338 	ld	xl, a
      00B25A A6 40            [ 1]  339 	ld	a, #0x40
      00B25C 42               [ 4]  340 	mul	x, a
      00B25D 1C 00 4A         [ 2]  341 	addw	x, #(_cmd_list+2)
      00B260 CD C3 27         [ 4]  342 	call	_strlen
                                    343 ;	./../../mib/stm8s_mib_debug_cmd.c: 142: if (rdCnt >= rdMax)
      00B263 1F 0F            [ 2]  344 	ldw	(0x0f, sp), x
      00B265 13 01            [ 2]  345 	cpw	x, (0x01, sp)
      00B267 25 04            [ 1]  346 	jrc	00128$
                                    347 ;	./../../mib/stm8s_mib_debug_cmd.c: 143: rdCnt = rdMax;
      00B269 16 01            [ 2]  348 	ldw	y, (0x01, sp)
      00B26B 17 0F            [ 2]  349 	ldw	(0x0f, sp), y
      00B26D                        350 00128$:
                                    351 ;	./../../mib/stm8s_mib_debug_cmd.c: 144: memcpy(cmd, cmd_list.buf[cmd_list.cur], rdCnt);
      00B26D 16 0F            [ 2]  352 	ldw	y, (0x0f, sp)
      00B26F C6 00 48         [ 1]  353 	ld	a, _cmd_list+0
      00B272 97               [ 1]  354 	ld	xl, a
      00B273 A6 40            [ 1]  355 	ld	a, #0x40
      00B275 42               [ 4]  356 	mul	x, a
      00B276 1C 00 4A         [ 2]  357 	addw	x, #(_cmd_list+2)
      00B279 90 89            [ 2]  358 	pushw	y
      00B27B 89               [ 2]  359 	pushw	x
      00B27C 1E 0F            [ 2]  360 	ldw	x, (0x0f, sp)
      00B27E CD C2 B0         [ 4]  361 	call	___memcpy
                                    362 ;	./../../mib/stm8s_mib_debug_cmd.c: 145: cmd[rdCnt] = 0;
      00B281 1E 0D            [ 2]  363 	ldw	x, (0x0d, sp)
      00B283 72 FB 0F         [ 2]  364 	addw	x, (0x0f, sp)
      00B286 7F               [ 1]  365 	clr	(x)
                                    366 ;	./../../mib/stm8s_mib_debug_cmd.c: 147: MibWriteDebugString(cmd);
      00B287 1E 0D            [ 2]  367 	ldw	x, (0x0d, sp)
      00B289 CD A6 1F         [ 4]  368 	call	_MibWriteDebugString
      00B28C CC B0 D5         [ 2]  369 	jp	00148$
      00B28F                        370 00137$:
                                    371 ;	./../../mib/stm8s_mib_debug_cmd.c: 153: cmd[rdCnt++] = vwCh;
      00B28F 1E 0F            [ 2]  372 	ldw	x, (0x0f, sp)
      00B291 16 09            [ 2]  373 	ldw	y, (0x09, sp)
      00B293 17 0F            [ 2]  374 	ldw	(0x0f, sp), y
      00B295 72 FB 0D         [ 2]  375 	addw	x, (0x0d, sp)
      00B298 7B 06            [ 1]  376 	ld	a, (0x06, sp)
      00B29A F7               [ 1]  377 	ld	(x), a
                                    378 ;	./../../mib/stm8s_mib_debug_cmd.c: 155: MibWriteDebugByte(vwCh);
      00B29B CD A6 02         [ 4]  379 	call	_MibWriteDebugByte
      00B29E CC B0 D5         [ 2]  380 	jp	00148$
      00B2A1                        381 00146$:
                                    382 ;	./../../mib/stm8s_mib_debug_cmd.c: 158: return (rdCnt);
      00B2A1 1E 0F            [ 2]  383 	ldw	x, (0x0f, sp)
      00B2A3                        384 00150$:
                                    385 ;	./../../mib/stm8s_mib_debug_cmd.c: 159: } // GetCommand.
      00B2A3 16 11            [ 2]  386 	ldw	y, (17, sp)
      00B2A5 5B 15            [ 2]  387 	addw	sp, #21
      00B2A7 90 FC            [ 2]  388 	jp	(y)
                                    389 ;	./../../mib/stm8s_mib_debug_cmd.c: 169: int GetArgs(char *s, char **argv)
                                    390 ;	-----------------------------------------
                                    391 ;	 function GetArgs
                                    392 ;	-----------------------------------------
      00B2A9                        393 _GetArgs:
      00B2A9 52 08            [ 2]  394 	sub	sp, #8
      00B2AB 1F 05            [ 2]  395 	ldw	(0x05, sp), x
                                    396 ;	./../../mib/stm8s_mib_debug_cmd.c: 171: int args = 0;
      00B2AD 5F               [ 1]  397 	clrw	x
      00B2AE 1F 01            [ 2]  398 	ldw	(0x01, sp), x
                                    399 ;	./../../mib/stm8s_mib_debug_cmd.c: 173: if (!s || *s == '\0')
      00B2B0 1E 05            [ 2]  400 	ldw	x, (0x05, sp)
      00B2B2 27 03            [ 1]  401 	jreq	00101$
      00B2B4 F6               [ 1]  402 	ld	a, (x)
      00B2B5 26 03            [ 1]  403 	jrne	00131$
      00B2B7                        404 00101$:
                                    405 ;	./../../mib/stm8s_mib_debug_cmd.c: 174: return 0;
      00B2B7 5F               [ 1]  406 	clrw	x
      00B2B8 20 73            [ 2]  407 	jra	00120$
                                    408 ;	./../../mib/stm8s_mib_debug_cmd.c: 175: while (args < MAX_ARGS)
      00B2BA                        409 00131$:
      00B2BA 5F               [ 1]  410 	clrw	x
      00B2BB 1F 07            [ 2]  411 	ldw	(0x07, sp), x
      00B2BD                        412 00117$:
      00B2BD 1E 07            [ 2]  413 	ldw	x, (0x07, sp)
      00B2BF A3 00 05         [ 2]  414 	cpw	x, #0x0005
      00B2C2 2E 67            [ 1]  415 	jrsge	00119$
                                    416 ;	./../../mib/stm8s_mib_debug_cmd.c: 178: while ((*s == ' ') || (*s == '\t'))
      00B2C4 1E 05            [ 2]  417 	ldw	x, (0x05, sp)
      00B2C6                        418 00105$:
      00B2C6 F6               [ 1]  419 	ld	a, (x)
      00B2C7 A1 20            [ 1]  420 	cp	a, #0x20
      00B2C9 27 04            [ 1]  421 	jreq	00106$
      00B2CB A1 09            [ 1]  422 	cp	a, #0x09
      00B2CD 26 03            [ 1]  423 	jrne	00107$
      00B2CF                        424 00106$:
                                    425 ;	./../../mib/stm8s_mib_debug_cmd.c: 179: s++;
      00B2CF 5C               [ 1]  426 	incw	x
      00B2D0 20 F4            [ 2]  427 	jra	00105$
      00B2D2                        428 00107$:
                                    429 ;	./../../mib/stm8s_mib_debug_cmd.c: 182: if (*s == '\0')
      00B2D2 4D               [ 1]  430 	tnz	a
      00B2D3 26 0D            [ 1]  431 	jrne	00109$
                                    432 ;	./../../mib/stm8s_mib_debug_cmd.c: 184: argv[args] = 0;
      00B2D5 1E 01            [ 2]  433 	ldw	x, (0x01, sp)
      00B2D7 58               [ 2]  434 	sllw	x
      00B2D8 72 FB 0B         [ 2]  435 	addw	x, (0x0b, sp)
      00B2DB 6F 01            [ 1]  436 	clr	(0x1, x)
      00B2DD 7F               [ 1]  437 	clr	(x)
                                    438 ;	./../../mib/stm8s_mib_debug_cmd.c: 185: return args;
      00B2DE 1E 01            [ 2]  439 	ldw	x, (0x01, sp)
      00B2E0 20 4B            [ 2]  440 	jra	00120$
      00B2E2                        441 00109$:
                                    442 ;	./../../mib/stm8s_mib_debug_cmd.c: 188: argv[args++] = s;
      00B2E2 16 07            [ 2]  443 	ldw	y, (0x07, sp)
      00B2E4 17 03            [ 2]  444 	ldw	(0x03, sp), y
      00B2E6 16 07            [ 2]  445 	ldw	y, (0x07, sp)
      00B2E8 90 5C            [ 1]  446 	incw	y
      00B2EA 17 07            [ 2]  447 	ldw	(0x07, sp), y
      00B2EC 17 01            [ 2]  448 	ldw	(0x01, sp), y
      00B2EE 16 03            [ 2]  449 	ldw	y, (0x03, sp)
      00B2F0 90 58            [ 2]  450 	sllw	y
      00B2F2 72 F9 0B         [ 2]  451 	addw	y, (0x0b, sp)
      00B2F5 90 FF            [ 2]  452 	ldw	(y), x
                                    453 ;	./../../mib/stm8s_mib_debug_cmd.c: 191: while (*s && (*s != ' ') && (*s != '\t'))
      00B2F7 1F 05            [ 2]  454 	ldw	(0x05, sp), x
      00B2F9                        455 00112$:
      00B2F9 1E 05            [ 2]  456 	ldw	x, (0x05, sp)
      00B2FB F6               [ 1]  457 	ld	a, (x)
                                    458 ;	./../../mib/stm8s_mib_debug_cmd.c: 192: s++;
      00B2FC 1E 05            [ 2]  459 	ldw	x, (0x05, sp)
      00B2FE 5C               [ 1]  460 	incw	x
      00B2FF 1F 03            [ 2]  461 	ldw	(0x03, sp), x
                                    462 ;	./../../mib/stm8s_mib_debug_cmd.c: 191: while (*s && (*s != ' ') && (*s != '\t'))
      00B301 4D               [ 1]  463 	tnz	a
      00B302 27 0E            [ 1]  464 	jreq	00114$
      00B304 A1 20            [ 1]  465 	cp	a, #0x20
      00B306 27 0A            [ 1]  466 	jreq	00114$
      00B308 A1 09            [ 1]  467 	cp	a, #0x09
      00B30A 27 06            [ 1]  468 	jreq	00114$
                                    469 ;	./../../mib/stm8s_mib_debug_cmd.c: 192: s++;
      00B30C 16 03            [ 2]  470 	ldw	y, (0x03, sp)
      00B30E 17 05            [ 2]  471 	ldw	(0x05, sp), y
      00B310 20 E7            [ 2]  472 	jra	00112$
      00B312                        473 00114$:
                                    474 ;	./../../mib/stm8s_mib_debug_cmd.c: 194: if (*s == '\0')
      00B312 4D               [ 1]  475 	tnz	a
      00B313 26 0D            [ 1]  476 	jrne	00116$
                                    477 ;	./../../mib/stm8s_mib_debug_cmd.c: 196: argv[args] = 0;
      00B315 1E 01            [ 2]  478 	ldw	x, (0x01, sp)
      00B317 58               [ 2]  479 	sllw	x
      00B318 72 FB 0B         [ 2]  480 	addw	x, (0x0b, sp)
      00B31B 6F 01            [ 1]  481 	clr	(0x1, x)
      00B31D 7F               [ 1]  482 	clr	(x)
                                    483 ;	./../../mib/stm8s_mib_debug_cmd.c: 197: return args;
      00B31E 1E 01            [ 2]  484 	ldw	x, (0x01, sp)
      00B320 20 0B            [ 2]  485 	jra	00120$
      00B322                        486 00116$:
                                    487 ;	./../../mib/stm8s_mib_debug_cmd.c: 199: *s++ = '\0';
      00B322 1E 05            [ 2]  488 	ldw	x, (0x05, sp)
      00B324 7F               [ 1]  489 	clr	(x)
      00B325 16 03            [ 2]  490 	ldw	y, (0x03, sp)
      00B327 17 05            [ 2]  491 	ldw	(0x05, sp), y
      00B329 20 92            [ 2]  492 	jra	00117$
      00B32B                        493 00119$:
                                    494 ;	./../../mib/stm8s_mib_debug_cmd.c: 201: return args;
      00B32B 1E 01            [ 2]  495 	ldw	x, (0x01, sp)
      00B32D                        496 00120$:
                                    497 ;	./../../mib/stm8s_mib_debug_cmd.c: 202: } // GetArgs.
      00B32D 5B 08            [ 2]  498 	addw	sp, #8
      00B32F 90 85            [ 2]  499 	popw	y
      00B331 5B 02            [ 2]  500 	addw	sp, #2
      00B333 90 FC            [ 2]  501 	jp	(y)
                                    502 ;	./../../mib/stm8s_mib_debug_cmd.c: 213: int HexToInt(char *s, void *retval, uint16_t type)
                                    503 ;	-----------------------------------------
                                    504 ;	 function HexToInt
                                    505 ;	-----------------------------------------
      00B335                        506 _HexToInt:
      00B335 52 0E            [ 2]  507 	sub	sp, #14
                                    508 ;	./../../mib/stm8s_mib_debug_cmd.c: 219: if (!s || !retval)
      00B337 1F 0A            [ 2]  509 	ldw	(0x0a, sp), x
      00B339 27 04            [ 1]  510 	jreq	00101$
      00B33B 1E 11            [ 2]  511 	ldw	x, (0x11, sp)
      00B33D 26 04            [ 1]  512 	jrne	00102$
      00B33F                        513 00101$:
                                    514 ;	./../../mib/stm8s_mib_debug_cmd.c: 220: return FALSE;
      00B33F 5F               [ 1]  515 	clrw	x
      00B340 CC B4 1B         [ 2]  516 	jp	00132$
      00B343                        517 00102$:
                                    518 ;	./../../mib/stm8s_mib_debug_cmd.c: 221: if (!strncmp(s, "0x", 2))
      00B343 4B 02            [ 1]  519 	push	#0x02
      00B345 4B 00            [ 1]  520 	push	#0x00
      00B347 4B 58            [ 1]  521 	push	#<(___str_2+0)
      00B349 4B 8C            [ 1]  522 	push	#((___str_2+0) >> 8)
      00B34B 1E 0E            [ 2]  523 	ldw	x, (0x0e, sp)
      00B34D CD C2 0D         [ 4]  524 	call	_strncmp
      00B350 5D               [ 2]  525 	tnzw	x
      00B351 26 06            [ 1]  526 	jrne	00105$
                                    527 ;	./../../mib/stm8s_mib_debug_cmd.c: 222: s += 2;
      00B353 1E 0A            [ 2]  528 	ldw	x, (0x0a, sp)
      00B355 5C               [ 1]  529 	incw	x
      00B356 5C               [ 1]  530 	incw	x
      00B357 1F 0A            [ 2]  531 	ldw	(0x0a, sp), x
      00B359                        532 00105$:
                                    533 ;	./../../mib/stm8s_mib_debug_cmd.c: 224: for (i = 0, rval = 0; i < type / 4; i++)
      00B359 0F 01            [ 1]  534 	clr	(0x01, sp)
      00B35B 5F               [ 1]  535 	clrw	x
      00B35C 1F 04            [ 2]  536 	ldw	(0x04, sp), x
      00B35E 1F 02            [ 2]  537 	ldw	(0x02, sp), x
      00B360 16 0A            [ 2]  538 	ldw	y, (0x0a, sp)
      00B362 17 0C            [ 2]  539 	ldw	(0x0c, sp), y
      00B364 0F 0E            [ 1]  540 	clr	(0x0e, sp)
      00B366                        541 00130$:
      00B366 16 13            [ 2]  542 	ldw	y, (0x13, sp)
      00B368 17 06            [ 2]  543 	ldw	(0x06, sp), y
      00B36A 93               [ 1]  544 	ldw	x, y
      00B36B 54               [ 2]  545 	srlw	x
      00B36C 54               [ 2]  546 	srlw	x
      00B36D 1F 08            [ 2]  547 	ldw	(0x08, sp), x
      00B36F 7B 0E            [ 1]  548 	ld	a, (0x0e, sp)
      00B371 5F               [ 1]  549 	clrw	x
      00B372 97               [ 1]  550 	ld	xl, a
      00B373 13 08            [ 2]  551 	cpw	x, (0x08, sp)
      00B375 24 70            [ 1]  552 	jrnc	00123$
                                    553 ;	./../../mib/stm8s_mib_debug_cmd.c: 226: if (*s == '\0')
      00B377 1E 0C            [ 2]  554 	ldw	x, (0x0c, sp)
      00B379 F6               [ 1]  555 	ld	a, (x)
      00B37A 26 08            [ 1]  556 	jrne	00110$
                                    557 ;	./../../mib/stm8s_mib_debug_cmd.c: 228: if (i == 0)
      00B37C 0D 01            [ 1]  558 	tnz	(0x01, sp)
      00B37E 26 67            [ 1]  559 	jrne	00123$
                                    560 ;	./../../mib/stm8s_mib_debug_cmd.c: 229: return FALSE;
      00B380 5F               [ 1]  561 	clrw	x
      00B381 CC B4 1B         [ 2]  562 	jp	00132$
                                    563 ;	./../../mib/stm8s_mib_debug_cmd.c: 231: break;
      00B384                        564 00110$:
                                    565 ;	./../../mib/stm8s_mib_debug_cmd.c: 233: c = *s++;
      00B384 1E 0C            [ 2]  566 	ldw	x, (0x0c, sp)
      00B386 5C               [ 1]  567 	incw	x
      00B387 1F 0C            [ 2]  568 	ldw	(0x0c, sp), x
                                    569 ;	./../../mib/stm8s_mib_debug_cmd.c: 236: c -= '0';
      00B389 97               [ 1]  570 	ld	xl, a
                                    571 ;	./../../mib/stm8s_mib_debug_cmd.c: 235: if (c >= '0' && c <= '9')
      00B38A A1 30            [ 1]  572 	cp	a, #0x30
      00B38C 25 09            [ 1]  573 	jrc	00120$
      00B38E A1 39            [ 1]  574 	cp	a, #0x39
      00B390 22 05            [ 1]  575 	jrugt	00120$
                                    576 ;	./../../mib/stm8s_mib_debug_cmd.c: 236: c -= '0';
      00B392 9F               [ 1]  577 	ld	a, xl
      00B393 A0 30            [ 1]  578 	sub	a, #0x30
      00B395 20 1D            [ 2]  579 	jra	00121$
      00B397                        580 00120$:
                                    581 ;	./../../mib/stm8s_mib_debug_cmd.c: 237: else if (c >= 'a' && c <= 'f')
      00B397 A1 61            [ 1]  582 	cp	a, #0x61
      00B399 25 09            [ 1]  583 	jrc	00116$
      00B39B A1 66            [ 1]  584 	cp	a, #0x66
      00B39D 22 05            [ 1]  585 	jrugt	00116$
                                    586 ;	./../../mib/stm8s_mib_debug_cmd.c: 238: c = c - 'a' + 10;
      00B39F 9F               [ 1]  587 	ld	a, xl
      00B3A0 AB A9            [ 1]  588 	add	a, #0xa9
      00B3A2 20 10            [ 2]  589 	jra	00121$
      00B3A4                        590 00116$:
                                    591 ;	./../../mib/stm8s_mib_debug_cmd.c: 239: else if (c >= 'A' && c <= 'F')
      00B3A4 A1 41            [ 1]  592 	cp	a, #0x41
      00B3A6 25 09            [ 1]  593 	jrc	00112$
      00B3A8 A1 46            [ 1]  594 	cp	a, #0x46
      00B3AA 22 05            [ 1]  595 	jrugt	00112$
                                    596 ;	./../../mib/stm8s_mib_debug_cmd.c: 240: c = c - 'A' + 10;
      00B3AC 9F               [ 1]  597 	ld	a, xl
      00B3AD AB C9            [ 1]  598 	add	a, #0xc9
      00B3AF 20 03            [ 2]  599 	jra	00121$
      00B3B1                        600 00112$:
                                    601 ;	./../../mib/stm8s_mib_debug_cmd.c: 242: return FALSE;
      00B3B1 5F               [ 1]  602 	clrw	x
      00B3B2 20 67            [ 2]  603 	jra	00132$
      00B3B4                        604 00121$:
                                    605 ;	./../../mib/stm8s_mib_debug_cmd.c: 244: rval = rval << 4 | c;
      00B3B4 88               [ 1]  606 	push	a
      00B3B5 1E 05            [ 2]  607 	ldw	x, (0x05, sp)
      00B3B7 16 03            [ 2]  608 	ldw	y, (0x03, sp)
      00B3B9 A6 04            [ 1]  609 	ld	a, #0x04
      00B3BB                        610 00222$:
      00B3BB 58               [ 2]  611 	sllw	x
      00B3BC 90 59            [ 2]  612 	rlcw	y
      00B3BE 4A               [ 1]  613 	dec	a
      00B3BF 26 FA            [ 1]  614 	jrne	00222$
      00B3C1 84               [ 1]  615 	pop	a
      00B3C2 0F 08            [ 1]  616 	clr	(0x08, sp)
      00B3C4 0F 07            [ 1]  617 	clr	(0x07, sp)
      00B3C6 0F 06            [ 1]  618 	clr	(0x06, sp)
      00B3C8 89               [ 2]  619 	pushw	x
      00B3C9 1A 02            [ 1]  620 	or	a, (2, sp)
      00B3CB 85               [ 2]  621 	popw	x
      00B3CC 02               [ 1]  622 	rlwa	x
      00B3CD 1A 08            [ 1]  623 	or	a, (0x08, sp)
      00B3CF 95               [ 1]  624 	ld	xh, a
      00B3D0 90 9F            [ 1]  625 	ld	a, yl
      00B3D2 1A 07            [ 1]  626 	or	a, (0x07, sp)
      00B3D4 90 02            [ 1]  627 	rlwa	y
      00B3D6 1A 06            [ 1]  628 	or	a, (0x06, sp)
      00B3D8 90 95            [ 1]  629 	ld	yh, a
      00B3DA 1F 04            [ 2]  630 	ldw	(0x04, sp), x
      00B3DC 17 02            [ 2]  631 	ldw	(0x02, sp), y
                                    632 ;	./../../mib/stm8s_mib_debug_cmd.c: 224: for (i = 0, rval = 0; i < type / 4; i++)
      00B3DE 0C 0E            [ 1]  633 	inc	(0x0e, sp)
      00B3E0 7B 0E            [ 1]  634 	ld	a, (0x0e, sp)
      00B3E2 6B 01            [ 1]  635 	ld	(0x01, sp), a
      00B3E4 CC B3 66         [ 2]  636 	jp	00130$
      00B3E7                        637 00123$:
                                    638 ;	./../../mib/stm8s_mib_debug_cmd.c: 247: switch (type)
      00B3E7 1E 06            [ 2]  639 	ldw	x, (0x06, sp)
      00B3E9 A3 00 08         [ 2]  640 	cpw	x, #0x0008
      00B3EC 27 10            [ 1]  641 	jreq	00124$
      00B3EE 1E 06            [ 2]  642 	ldw	x, (0x06, sp)
      00B3F0 A3 00 10         [ 2]  643 	cpw	x, #0x0010
      00B3F3 27 10            [ 1]  644 	jreq	00125$
      00B3F5 1E 06            [ 2]  645 	ldw	x, (0x06, sp)
      00B3F7 A3 00 20         [ 2]  646 	cpw	x, #0x0020
      00B3FA 27 10            [ 1]  647 	jreq	00126$
      00B3FC 20 19            [ 2]  648 	jra	00127$
                                    649 ;	./../../mib/stm8s_mib_debug_cmd.c: 249: case 8:
      00B3FE                        650 00124$:
                                    651 ;	./../../mib/stm8s_mib_debug_cmd.c: 250: *(uint8_t *)retval = (uint8_t)rval;
      00B3FE 1E 11            [ 2]  652 	ldw	x, (0x11, sp)
      00B400 7B 05            [ 1]  653 	ld	a, (0x05, sp)
      00B402 F7               [ 1]  654 	ld	(x), a
                                    655 ;	./../../mib/stm8s_mib_debug_cmd.c: 251: break;
      00B403 20 14            [ 2]  656 	jra	00128$
                                    657 ;	./../../mib/stm8s_mib_debug_cmd.c: 252: case 16:
      00B405                        658 00125$:
                                    659 ;	./../../mib/stm8s_mib_debug_cmd.c: 253: *(uint16_t *)retval = (uint16_t)rval;
      00B405 1E 11            [ 2]  660 	ldw	x, (0x11, sp)
      00B407 16 04            [ 2]  661 	ldw	y, (0x04, sp)
      00B409 FF               [ 2]  662 	ldw	(x), y
                                    663 ;	./../../mib/stm8s_mib_debug_cmd.c: 254: break;
      00B40A 20 0D            [ 2]  664 	jra	00128$
                                    665 ;	./../../mib/stm8s_mib_debug_cmd.c: 255: case 32:
      00B40C                        666 00126$:
                                    667 ;	./../../mib/stm8s_mib_debug_cmd.c: 256: *(uint32_t *)retval = (uint32_t)rval;
      00B40C 1E 11            [ 2]  668 	ldw	x, (0x11, sp)
      00B40E 16 04            [ 2]  669 	ldw	y, (0x04, sp)
      00B410 EF 02            [ 2]  670 	ldw	(0x2, x), y
      00B412 16 02            [ 2]  671 	ldw	y, (0x02, sp)
      00B414 FF               [ 2]  672 	ldw	(x), y
                                    673 ;	./../../mib/stm8s_mib_debug_cmd.c: 257: break;
      00B415 20 02            [ 2]  674 	jra	00128$
                                    675 ;	./../../mib/stm8s_mib_debug_cmd.c: 258: default:
      00B417                        676 00127$:
                                    677 ;	./../../mib/stm8s_mib_debug_cmd.c: 259: return FALSE;
      00B417 5F               [ 1]  678 	clrw	x
                                    679 ;	./../../mib/stm8s_mib_debug_cmd.c: 260: }
                                    680 ;	./../../mib/stm8s_mib_debug_cmd.c: 261: return TRUE;
      00B418 C5                     681 	.byte 0xc5
      00B419                        682 00128$:
      00B419 5F               [ 1]  683 	clrw	x
      00B41A 5C               [ 1]  684 	incw	x
      00B41B                        685 00132$:
                                    686 ;	./../../mib/stm8s_mib_debug_cmd.c: 262: } // HexToInt.
      00B41B 16 0F            [ 2]  687 	ldw	y, (15, sp)
      00B41D 5B 14            [ 2]  688 	addw	sp, #20
      00B41F 90 FC            [ 2]  689 	jp	(y)
                                    690 ;	./../../mib/stm8s_mib_debug_cmd.c: 272: int DecToLong(char *s, void *retval, uint16_t type)
                                    691 ;	-----------------------------------------
                                    692 ;	 function DecToLong
                                    693 ;	-----------------------------------------
      00B421                        694 _DecToLong:
      00B421 52 0E            [ 2]  695 	sub	sp, #14
                                    696 ;	./../../mib/stm8s_mib_debug_cmd.c: 277: if (!s || !s[0] || !retval)
      00B423 5D               [ 2]  697 	tnzw	x
      00B424 27 07            [ 1]  698 	jreq	00101$
      00B426 F6               [ 1]  699 	ld	a, (x)
      00B427 27 04            [ 1]  700 	jreq	00101$
      00B429 16 11            [ 2]  701 	ldw	y, (0x11, sp)
      00B42B 26 03            [ 1]  702 	jrne	00102$
      00B42D                        703 00101$:
                                    704 ;	./../../mib/stm8s_mib_debug_cmd.c: 278: return FALSE;
      00B42D 5F               [ 1]  705 	clrw	x
      00B42E 20 73            [ 2]  706 	jra	00117$
      00B430                        707 00102$:
                                    708 ;	./../../mib/stm8s_mib_debug_cmd.c: 280: for (rval= 0; *s; s++)
      00B430 90 5F            [ 1]  709 	clrw	y
      00B432 17 09            [ 2]  710 	ldw	(0x09, sp), y
      00B434 1F 0D            [ 2]  711 	ldw	(0x0d, sp), x
      00B436                        712 00115$:
      00B436 1E 0D            [ 2]  713 	ldw	x, (0x0d, sp)
      00B438 F6               [ 1]  714 	ld	a, (x)
      00B439 27 3C            [ 1]  715 	jreq	00108$
                                    716 ;	./../../mib/stm8s_mib_debug_cmd.c: 282: if (*s < '0' || *s > '9')
      00B43B A1 30            [ 1]  717 	cp	a, #0x30
      00B43D 25 04            [ 1]  718 	jrc	00105$
      00B43F A1 39            [ 1]  719 	cp	a, #0x39
      00B441 23 03            [ 2]  720 	jrule	00106$
      00B443                        721 00105$:
                                    722 ;	./../../mib/stm8s_mib_debug_cmd.c: 283: return FALSE;
      00B443 5F               [ 1]  723 	clrw	x
      00B444 20 5D            [ 2]  724 	jra	00117$
      00B446                        725 00106$:
                                    726 ;	./../../mib/stm8s_mib_debug_cmd.c: 284: c = *s - '0';
      00B446 A0 30            [ 1]  727 	sub	a, #0x30
                                    728 ;	./../../mib/stm8s_mib_debug_cmd.c: 285: rval = rval * 10 + c;
      00B448 88               [ 1]  729 	push	a
      00B449 90 89            [ 2]  730 	pushw	y
      00B44B 1E 0C            [ 2]  731 	ldw	x, (0x0c, sp)
      00B44D 89               [ 2]  732 	pushw	x
      00B44E 4B 0A            [ 1]  733 	push	#0x0a
      00B450 5F               [ 1]  734 	clrw	x
      00B451 89               [ 2]  735 	pushw	x
      00B452 4B 00            [ 1]  736 	push	#0x00
      00B454 CD C3 89         [ 4]  737 	call	__mullong
      00B457 5B 08            [ 2]  738 	addw	sp, #8
      00B459 1F 04            [ 2]  739 	ldw	(0x04, sp), x
      00B45B 84               [ 1]  740 	pop	a
      00B45C 5F               [ 1]  741 	clrw	x
      00B45D 1F 05            [ 2]  742 	ldw	(0x05, sp), x
      00B45F 97               [ 1]  743 	ld	xl, a
      00B460 72 FB 03         [ 2]  744 	addw	x, (0x03, sp)
      00B463 90 9F            [ 1]  745 	ld	a, yl
      00B465 19 06            [ 1]  746 	adc	a, (0x06, sp)
      00B467 6B 0A            [ 1]  747 	ld	(0x0a, sp), a
      00B469 90 9E            [ 1]  748 	ld	a, yh
      00B46B 19 05            [ 1]  749 	adc	a, (0x05, sp)
      00B46D 6B 09            [ 1]  750 	ld	(0x09, sp), a
      00B46F 51               [ 1]  751 	exgw	x, y
                                    752 ;	./../../mib/stm8s_mib_debug_cmd.c: 280: for (rval= 0; *s; s++)
      00B470 1E 0D            [ 2]  753 	ldw	x, (0x0d, sp)
      00B472 5C               [ 1]  754 	incw	x
      00B473 1F 0D            [ 2]  755 	ldw	(0x0d, sp), x
      00B475 20 BF            [ 2]  756 	jra	00115$
      00B477                        757 00108$:
                                    758 ;	./../../mib/stm8s_mib_debug_cmd.c: 288: switch (type)
      00B477 1E 13            [ 2]  759 	ldw	x, (0x13, sp)
      00B479 A3 00 08         [ 2]  760 	cpw	x, #0x0008
      00B47C 27 0C            [ 1]  761 	jreq	00109$
      00B47E A3 00 10         [ 2]  762 	cpw	x, #0x0010
      00B481 27 0E            [ 1]  763 	jreq	00110$
      00B483 A3 00 20         [ 2]  764 	cpw	x, #0x0020
      00B486 27 0E            [ 1]  765 	jreq	00111$
      00B488 20 15            [ 2]  766 	jra	00112$
                                    767 ;	./../../mib/stm8s_mib_debug_cmd.c: 290: case 8:
      00B48A                        768 00109$:
                                    769 ;	./../../mib/stm8s_mib_debug_cmd.c: 291: *(uint8_t *)retval = (uint8_t)rval;
      00B48A 1E 11            [ 2]  770 	ldw	x, (0x11, sp)
      00B48C 90 9F            [ 1]  771 	ld	a, yl
      00B48E F7               [ 1]  772 	ld	(x), a
                                    773 ;	./../../mib/stm8s_mib_debug_cmd.c: 292: break;
      00B48F 20 10            [ 2]  774 	jra	00113$
                                    775 ;	./../../mib/stm8s_mib_debug_cmd.c: 293: case 16:
      00B491                        776 00110$:
                                    777 ;	./../../mib/stm8s_mib_debug_cmd.c: 294: *(uint16_t *)retval = (uint16_t)rval;
      00B491 1E 11            [ 2]  778 	ldw	x, (0x11, sp)
      00B493 FF               [ 2]  779 	ldw	(x), y
                                    780 ;	./../../mib/stm8s_mib_debug_cmd.c: 295: break;
      00B494 20 0B            [ 2]  781 	jra	00113$
                                    782 ;	./../../mib/stm8s_mib_debug_cmd.c: 296: case 32:
      00B496                        783 00111$:
                                    784 ;	./../../mib/stm8s_mib_debug_cmd.c: 297: *(uint32_t *)retval = (uint32_t)rval;
      00B496 1E 11            [ 2]  785 	ldw	x, (0x11, sp)
      00B498 EF 02            [ 2]  786 	ldw	(0x2, x), y
      00B49A 16 09            [ 2]  787 	ldw	y, (0x09, sp)
      00B49C FF               [ 2]  788 	ldw	(x), y
                                    789 ;	./../../mib/stm8s_mib_debug_cmd.c: 298: break;
      00B49D 20 02            [ 2]  790 	jra	00113$
                                    791 ;	./../../mib/stm8s_mib_debug_cmd.c: 299: default:
      00B49F                        792 00112$:
                                    793 ;	./../../mib/stm8s_mib_debug_cmd.c: 300: return FALSE;
      00B49F 5F               [ 1]  794 	clrw	x
                                    795 ;	./../../mib/stm8s_mib_debug_cmd.c: 301: }
                                    796 ;	./../../mib/stm8s_mib_debug_cmd.c: 302: return TRUE;
      00B4A0 C5                     797 	.byte 0xc5
      00B4A1                        798 00113$:
      00B4A1 5F               [ 1]  799 	clrw	x
      00B4A2 5C               [ 1]  800 	incw	x
      00B4A3                        801 00117$:
                                    802 ;	./../../mib/stm8s_mib_debug_cmd.c: 303: } // DecToLong.
      00B4A3 16 0F            [ 2]  803 	ldw	y, (15, sp)
      00B4A5 5B 14            [ 2]  804 	addw	sp, #20
      00B4A7 90 FC            [ 2]  805 	jp	(y)
                                    806 ;	./../../mib/stm8s_mib_debug_cmd.c: 312: void HexDump(uint32_t addr, uint32_t len)
                                    807 ;	-----------------------------------------
                                    808 ;	 function HexDump
                                    809 ;	-----------------------------------------
      00B4A9                        810 _HexDump:
      00B4A9 52 27            [ 2]  811 	sub	sp, #39
                                    812 ;	./../../mib/stm8s_mib_debug_cmd.c: 315: uint32_t endPtr = (addr + len);
      00B4AB 16 2C            [ 2]  813 	ldw	y, (0x2c, sp)
      00B4AD 72 F9 30         [ 2]  814 	addw	y, (0x30, sp)
      00B4B0 1E 2A            [ 2]  815 	ldw	x, (0x2a, sp)
      00B4B2 24 01            [ 1]  816 	jrnc	00240$
      00B4B4 5C               [ 1]  817 	incw	x
      00B4B5                        818 00240$:
      00B4B5 72 FB 2E         [ 2]  819 	addw	x, (0x2e, sp)
      00B4B8 17 17            [ 2]  820 	ldw	(0x17, sp), y
      00B4BA 1F 15            [ 2]  821 	ldw	(0x15, sp), x
                                    822 ;	./../../mib/stm8s_mib_debug_cmd.c: 316: int i, remainder = len & 0xf;
      00B4BC 1E 30            [ 2]  823 	ldw	x, (0x30, sp)
      00B4BE 9F               [ 1]  824 	ld	a, xl
      00B4BF A4 0F            [ 1]  825 	and	a, #0x0f
      00B4C1 6B 1A            [ 1]  826 	ld	(0x1a, sp), a
      00B4C3 0F 19            [ 1]  827 	clr	(0x19, sp)
                                    828 ;	./../../mib/stm8s_mib_debug_cmd.c: 322: mib_printf("\r\n");
      00B4C5 4B 51            [ 1]  829 	push	#<(___str_0+0)
      00B4C7 4B 8C            [ 1]  830 	push	#((___str_0+0) >> 8)
      00B4C9 CD B0 3B         [ 4]  831 	call	_mib_printf
      00B4CC 5B 02            [ 2]  832 	addw	sp, #2
                                    833 ;	./../../mib/stm8s_mib_debug_cmd.c: 323: mib_printf("address     Hex Value                                        Ascii value\r\n");
      00B4CE 4B 5B            [ 1]  834 	push	#<(___str_3+0)
      00B4D0 4B 8C            [ 1]  835 	push	#((___str_3+0) >> 8)
      00B4D2 CD B0 3B         [ 4]  836 	call	_mib_printf
      00B4D5 5B 02            [ 2]  837 	addw	sp, #2
                                    838 ;	./../../mib/stm8s_mib_debug_cmd.c: 326: p_address = (uint32_t)(addr);
      00B4D7 1E 2C            [ 2]  839 	ldw	x, (0x2c, sp)
      00B4D9 16 2A            [ 2]  840 	ldw	y, (0x2a, sp)
                                    841 ;	./../../mib/stm8s_mib_debug_cmd.c: 327: p_data_ptr = (uint16_t *)p_data;
                                    842 ;	./../../mib/stm8s_mib_debug_cmd.c: 328: while ((p_address + 16) <= endPtr)
      00B4DB 1F 1D            [ 2]  843 	ldw	(0x1d, sp), x
      00B4DD 17 1B            [ 2]  844 	ldw	(0x1b, sp), y
      00B4DF                        845 00107$:
      00B4DF 1E 1D            [ 2]  846 	ldw	x, (0x1d, sp)
      00B4E1 1C 00 10         [ 2]  847 	addw	x, #0x0010
      00B4E4 1F 21            [ 2]  848 	ldw	(0x21, sp), x
      00B4E6 7B 1C            [ 1]  849 	ld	a, (0x1c, sp)
      00B4E8 A9 00            [ 1]  850 	adc	a, #0x00
      00B4EA 6B 20            [ 1]  851 	ld	(0x20, sp), a
      00B4EC 7B 1B            [ 1]  852 	ld	a, (0x1b, sp)
      00B4EE A9 00            [ 1]  853 	adc	a, #0x00
      00B4F0 6B 1F            [ 1]  854 	ld	(0x1f, sp), a
      00B4F2 1E 17            [ 2]  855 	ldw	x, (0x17, sp)
      00B4F4 13 21            [ 2]  856 	cpw	x, (0x21, sp)
      00B4F6 7B 16            [ 1]  857 	ld	a, (0x16, sp)
      00B4F8 12 20            [ 1]  858 	sbc	a, (0x20, sp)
      00B4FA 7B 15            [ 1]  859 	ld	a, (0x15, sp)
      00B4FC 12 1F            [ 1]  860 	sbc	a, (0x1f, sp)
      00B4FE 24 03            [ 1]  861 	jrnc	00241$
      00B500 CC B5 C3         [ 2]  862 	jp	00163$
      00B503                        863 00241$:
                                    864 ;	./../../mib/stm8s_mib_debug_cmd.c: 330: mib_printf("0x%08lx : ", p_address);
      00B503 1E 1D            [ 2]  865 	ldw	x, (0x1d, sp)
      00B505 89               [ 2]  866 	pushw	x
      00B506 1E 1D            [ 2]  867 	ldw	x, (0x1d, sp)
      00B508 89               [ 2]  868 	pushw	x
      00B509 4B A6            [ 1]  869 	push	#<(___str_4+0)
      00B50B 4B 8C            [ 1]  870 	push	#((___str_4+0) >> 8)
      00B50D CD B0 3B         [ 4]  871 	call	_mib_printf
      00B510 5B 06            [ 2]  872 	addw	sp, #6
                                    873 ;	./../../mib/stm8s_mib_debug_cmd.c: 331: for (i = 0; i < 8; i++)
      00B512 5F               [ 1]  874 	clrw	x
      00B513 1F 26            [ 2]  875 	ldw	(0x26, sp), x
      00B515                        876 00120$:
                                    877 ;	./../../mib/stm8s_mib_debug_cmd.c: 333: p_data_ptr[i] = rd_ADDR16(p_address + i * 2);
      00B515 16 26            [ 2]  878 	ldw	y, (0x26, sp)
      00B517 90 58            [ 2]  879 	sllw	y
      00B519 93               [ 1]  880 	ldw	x, y
      00B51A 89               [ 2]  881 	pushw	x
      00B51B 96               [ 1]  882 	ldw	x, sp
      00B51C 1C 00 03         [ 2]  883 	addw	x, #3
      00B51F 72 FB 01         [ 2]  884 	addw	x, (1, sp)
      00B522 5B 02            [ 2]  885 	addw	sp, #2
      00B524 17 24            [ 2]  886 	ldw	(0x24, sp), y
      00B526 16 1D            [ 2]  887 	ldw	y, (0x1d, sp)
      00B528 72 F9 24         [ 2]  888 	addw	y, (0x24, sp)
      00B52B 90 FE            [ 2]  889 	ldw	y, (y)
      00B52D FF               [ 2]  890 	ldw	(x), y
                                    891 ;	./../../mib/stm8s_mib_debug_cmd.c: 334: mib_printf("%02x ", p_data[i * 2]);
      00B52E 7B 27            [ 1]  892 	ld	a, (0x27, sp)
      00B530 48               [ 1]  893 	sll	a
      00B531 6B 23            [ 1]  894 	ld	(0x23, sp), a
      00B533 6B 25            [ 1]  895 	ld	(0x25, sp), a
      00B535 49               [ 1]  896 	rlc	a
      00B536 4F               [ 1]  897 	clr	a
      00B537 A2 00            [ 1]  898 	sbc	a, #0x00
      00B539 6B 24            [ 1]  899 	ld	(0x24, sp), a
      00B53B 96               [ 1]  900 	ldw	x, sp
      00B53C 5C               [ 1]  901 	incw	x
      00B53D 72 FB 24         [ 2]  902 	addw	x, (0x24, sp)
      00B540 F6               [ 1]  903 	ld	a, (x)
      00B541 5F               [ 1]  904 	clrw	x
      00B542 97               [ 1]  905 	ld	xl, a
      00B543 89               [ 2]  906 	pushw	x
      00B544 4B B1            [ 1]  907 	push	#<(___str_5+0)
      00B546 4B 8C            [ 1]  908 	push	#((___str_5+0) >> 8)
      00B548 CD B0 3B         [ 4]  909 	call	_mib_printf
      00B54B 5B 04            [ 2]  910 	addw	sp, #4
                                    911 ;	./../../mib/stm8s_mib_debug_cmd.c: 335: mib_printf("%02x ", p_data[i * 2 + 1]);
      00B54D 7B 23            [ 1]  912 	ld	a, (0x23, sp)
      00B54F 4C               [ 1]  913 	inc	a
      00B550 6B 25            [ 1]  914 	ld	(0x25, sp), a
      00B552 49               [ 1]  915 	rlc	a
      00B553 4F               [ 1]  916 	clr	a
      00B554 A2 00            [ 1]  917 	sbc	a, #0x00
      00B556 6B 24            [ 1]  918 	ld	(0x24, sp), a
      00B558 96               [ 1]  919 	ldw	x, sp
      00B559 5C               [ 1]  920 	incw	x
      00B55A 72 FB 24         [ 2]  921 	addw	x, (0x24, sp)
      00B55D F6               [ 1]  922 	ld	a, (x)
      00B55E 5F               [ 1]  923 	clrw	x
      00B55F 97               [ 1]  924 	ld	xl, a
      00B560 89               [ 2]  925 	pushw	x
      00B561 4B B1            [ 1]  926 	push	#<(___str_5+0)
      00B563 4B 8C            [ 1]  927 	push	#((___str_5+0) >> 8)
      00B565 CD B0 3B         [ 4]  928 	call	_mib_printf
      00B568 5B 04            [ 2]  929 	addw	sp, #4
                                    930 ;	./../../mib/stm8s_mib_debug_cmd.c: 331: for (i = 0; i < 8; i++)
      00B56A 1E 26            [ 2]  931 	ldw	x, (0x26, sp)
      00B56C 5C               [ 1]  932 	incw	x
      00B56D 1F 26            [ 2]  933 	ldw	(0x26, sp), x
      00B56F A3 00 08         [ 2]  934 	cpw	x, #0x0008
      00B572 2F A1            [ 1]  935 	jrslt	00120$
                                    936 ;	./../../mib/stm8s_mib_debug_cmd.c: 337: mib_printf(" ");
      00B574 4B B7            [ 1]  937 	push	#<(___str_6+0)
      00B576 4B 8C            [ 1]  938 	push	#((___str_6+0) >> 8)
      00B578 CD B0 3B         [ 4]  939 	call	_mib_printf
      00B57B 5B 02            [ 2]  940 	addw	sp, #2
                                    941 ;	./../../mib/stm8s_mib_debug_cmd.c: 338: for (i = 0; i < 16; i++)
      00B57D 5F               [ 1]  942 	clrw	x
      00B57E 1F 26            [ 2]  943 	ldw	(0x26, sp), x
      00B580                        944 00122$:
                                    945 ;	./../../mib/stm8s_mib_debug_cmd.c: 340: c = p_data[i];
      00B580 96               [ 1]  946 	ldw	x, sp
      00B581 5C               [ 1]  947 	incw	x
      00B582 72 FB 26         [ 2]  948 	addw	x, (0x26, sp)
      00B585 F6               [ 1]  949 	ld	a, (x)
                                    950 ;	./../../mib/stm8s_mib_debug_cmd.c: 341: if (c >= 32 && c <= 125)
      00B586 A1 20            [ 1]  951 	cp	a, #0x20
      00B588 25 12            [ 1]  952 	jrc	00103$
      00B58A A1 7D            [ 1]  953 	cp	a, #0x7d
      00B58C 22 0E            [ 1]  954 	jrugt	00103$
                                    955 ;	./../../mib/stm8s_mib_debug_cmd.c: 342: mib_printf("%c", c);
      00B58E 5F               [ 1]  956 	clrw	x
      00B58F 97               [ 1]  957 	ld	xl, a
      00B590 89               [ 2]  958 	pushw	x
      00B591 4B B9            [ 1]  959 	push	#<(___str_7+0)
      00B593 4B 8C            [ 1]  960 	push	#((___str_7+0) >> 8)
      00B595 CD B0 3B         [ 4]  961 	call	_mib_printf
      00B598 5B 04            [ 2]  962 	addw	sp, #4
      00B59A 20 09            [ 2]  963 	jra	00123$
      00B59C                        964 00103$:
                                    965 ;	./../../mib/stm8s_mib_debug_cmd.c: 344: mib_printf(".");
      00B59C 4B BC            [ 1]  966 	push	#<(___str_8+0)
      00B59E 4B 8C            [ 1]  967 	push	#((___str_8+0) >> 8)
      00B5A0 CD B0 3B         [ 4]  968 	call	_mib_printf
      00B5A3 5B 02            [ 2]  969 	addw	sp, #2
      00B5A5                        970 00123$:
                                    971 ;	./../../mib/stm8s_mib_debug_cmd.c: 338: for (i = 0; i < 16; i++)
      00B5A5 1E 26            [ 2]  972 	ldw	x, (0x26, sp)
      00B5A7 5C               [ 1]  973 	incw	x
      00B5A8 1F 26            [ 2]  974 	ldw	(0x26, sp), x
      00B5AA A3 00 10         [ 2]  975 	cpw	x, #0x0010
      00B5AD 2F D1            [ 1]  976 	jrslt	00122$
                                    977 ;	./../../mib/stm8s_mib_debug_cmd.c: 346: p_address += 16;
      00B5AF 16 21            [ 2]  978 	ldw	y, (0x21, sp)
      00B5B1 17 1D            [ 2]  979 	ldw	(0x1d, sp), y
      00B5B3 16 1F            [ 2]  980 	ldw	y, (0x1f, sp)
      00B5B5 17 1B            [ 2]  981 	ldw	(0x1b, sp), y
                                    982 ;	./../../mib/stm8s_mib_debug_cmd.c: 348: mib_printf("\r\n");
      00B5B7 4B 51            [ 1]  983 	push	#<(___str_0+0)
      00B5B9 4B 8C            [ 1]  984 	push	#((___str_0+0) >> 8)
      00B5BB CD B0 3B         [ 4]  985 	call	_mib_printf
      00B5BE 5B 02            [ 2]  986 	addw	sp, #2
      00B5C0 CC B4 DF         [ 2]  987 	jp	00107$
      00B5C3                        988 00163$:
      00B5C3 16 1D            [ 2]  989 	ldw	y, (0x1d, sp)
      00B5C5 17 24            [ 2]  990 	ldw	(0x24, sp), y
      00B5C7 16 1B            [ 2]  991 	ldw	y, (0x1b, sp)
      00B5C9 17 22            [ 2]  992 	ldw	(0x22, sp), y
                                    993 ;	./../../mib/stm8s_mib_debug_cmd.c: 352: if (remainder)
      00B5CB 1E 19            [ 2]  994 	ldw	x, (0x19, sp)
      00B5CD 26 03            [ 1]  995 	jrne	00248$
      00B5CF CC B6 DF         [ 2]  996 	jp	00119$
      00B5D2                        997 00248$:
                                    998 ;	./../../mib/stm8s_mib_debug_cmd.c: 354: mib_printf("0x%08lx  ", p_address);
      00B5D2 1E 1D            [ 2]  999 	ldw	x, (0x1d, sp)
      00B5D4 89               [ 2] 1000 	pushw	x
      00B5D5 1E 1D            [ 2] 1001 	ldw	x, (0x1d, sp)
      00B5D7 89               [ 2] 1002 	pushw	x
      00B5D8 4B BE            [ 1] 1003 	push	#<(___str_9+0)
      00B5DA 4B 8C            [ 1] 1004 	push	#((___str_9+0) >> 8)
      00B5DC CD B0 3B         [ 4] 1005 	call	_mib_printf
      00B5DF 5B 06            [ 2] 1006 	addw	sp, #6
                                   1007 ;	./../../mib/stm8s_mib_debug_cmd.c: 355: for (i = 0; i < (remainder >> 1); i++)
      00B5E1 1E 19            [ 2] 1008 	ldw	x, (0x19, sp)
      00B5E3 57               [ 2] 1009 	sraw	x
      00B5E4 1F 1D            [ 2] 1010 	ldw	(0x1d, sp), x
      00B5E6 5F               [ 1] 1011 	clrw	x
      00B5E7 1F 26            [ 2] 1012 	ldw	(0x26, sp), x
      00B5E9                       1013 00125$:
      00B5E9 1E 26            [ 2] 1014 	ldw	x, (0x26, sp)
      00B5EB 13 1D            [ 2] 1015 	cpw	x, (0x1d, sp)
      00B5ED 2E 5C            [ 1] 1016 	jrsge	00110$
                                   1017 ;	./../../mib/stm8s_mib_debug_cmd.c: 357: p_data_ptr[i] = rd_ADDR16(p_address + i * 2);
      00B5EF 16 26            [ 2] 1018 	ldw	y, (0x26, sp)
      00B5F1 90 58            [ 2] 1019 	sllw	y
      00B5F3 93               [ 1] 1020 	ldw	x, y
      00B5F4 89               [ 2] 1021 	pushw	x
      00B5F5 96               [ 1] 1022 	ldw	x, sp
      00B5F6 1C 00 03         [ 2] 1023 	addw	x, #3
      00B5F9 72 FB 01         [ 2] 1024 	addw	x, (1, sp)
      00B5FC 5B 02            [ 2] 1025 	addw	sp, #2
      00B5FE 17 20            [ 2] 1026 	ldw	(0x20, sp), y
      00B600 16 24            [ 2] 1027 	ldw	y, (0x24, sp)
      00B602 72 F9 20         [ 2] 1028 	addw	y, (0x20, sp)
      00B605 90 FE            [ 2] 1029 	ldw	y, (y)
      00B607 FF               [ 2] 1030 	ldw	(x), y
                                   1031 ;	./../../mib/stm8s_mib_debug_cmd.c: 358: mib_printf("%02x ", p_data[i * 2]);
      00B608 7B 27            [ 1] 1032 	ld	a, (0x27, sp)
      00B60A 48               [ 1] 1033 	sll	a
      00B60B 6B 1F            [ 1] 1034 	ld	(0x1f, sp), a
      00B60D 6B 21            [ 1] 1035 	ld	(0x21, sp), a
      00B60F 49               [ 1] 1036 	rlc	a
      00B610 4F               [ 1] 1037 	clr	a
      00B611 A2 00            [ 1] 1038 	sbc	a, #0x00
      00B613 6B 20            [ 1] 1039 	ld	(0x20, sp), a
      00B615 96               [ 1] 1040 	ldw	x, sp
      00B616 5C               [ 1] 1041 	incw	x
      00B617 72 FB 20         [ 2] 1042 	addw	x, (0x20, sp)
      00B61A F6               [ 1] 1043 	ld	a, (x)
      00B61B 5F               [ 1] 1044 	clrw	x
      00B61C 97               [ 1] 1045 	ld	xl, a
      00B61D 89               [ 2] 1046 	pushw	x
      00B61E 4B B1            [ 1] 1047 	push	#<(___str_5+0)
      00B620 4B 8C            [ 1] 1048 	push	#((___str_5+0) >> 8)
      00B622 CD B0 3B         [ 4] 1049 	call	_mib_printf
      00B625 5B 04            [ 2] 1050 	addw	sp, #4
                                   1051 ;	./../../mib/stm8s_mib_debug_cmd.c: 359: mib_printf("%02x ", p_data[i * 2 + 1]);
      00B627 7B 1F            [ 1] 1052 	ld	a, (0x1f, sp)
      00B629 4C               [ 1] 1053 	inc	a
      00B62A 6B 21            [ 1] 1054 	ld	(0x21, sp), a
      00B62C 49               [ 1] 1055 	rlc	a
      00B62D 4F               [ 1] 1056 	clr	a
      00B62E A2 00            [ 1] 1057 	sbc	a, #0x00
      00B630 6B 20            [ 1] 1058 	ld	(0x20, sp), a
      00B632 96               [ 1] 1059 	ldw	x, sp
      00B633 5C               [ 1] 1060 	incw	x
      00B634 72 FB 20         [ 2] 1061 	addw	x, (0x20, sp)
      00B637 F6               [ 1] 1062 	ld	a, (x)
      00B638 5F               [ 1] 1063 	clrw	x
      00B639 97               [ 1] 1064 	ld	xl, a
      00B63A 89               [ 2] 1065 	pushw	x
      00B63B 4B B1            [ 1] 1066 	push	#<(___str_5+0)
      00B63D 4B 8C            [ 1] 1067 	push	#((___str_5+0) >> 8)
      00B63F CD B0 3B         [ 4] 1068 	call	_mib_printf
      00B642 5B 04            [ 2] 1069 	addw	sp, #4
                                   1070 ;	./../../mib/stm8s_mib_debug_cmd.c: 355: for (i = 0; i < (remainder >> 1); i++)
      00B644 1E 26            [ 2] 1071 	ldw	x, (0x26, sp)
      00B646 5C               [ 1] 1072 	incw	x
      00B647 1F 26            [ 2] 1073 	ldw	(0x26, sp), x
      00B649 20 9E            [ 2] 1074 	jra	00125$
      00B64B                       1075 00110$:
                                   1076 ;	./../../mib/stm8s_mib_debug_cmd.c: 361: for (i = 0; i < (16 - (remainder >> 1) * 2); i++)
      00B64B 1E 1D            [ 2] 1077 	ldw	x, (0x1d, sp)
      00B64D 58               [ 2] 1078 	sllw	x
      00B64E 1F 26            [ 2] 1079 	ldw	(0x26, sp), x
      00B650 A6 10            [ 1] 1080 	ld	a, #0x10
      00B652 10 27            [ 1] 1081 	sub	a, (0x27, sp)
      00B654 6B 25            [ 1] 1082 	ld	(0x25, sp), a
      00B656 4F               [ 1] 1083 	clr	a
      00B657 12 26            [ 1] 1084 	sbc	a, (0x26, sp)
      00B659 6B 24            [ 1] 1085 	ld	(0x24, sp), a
      00B65B 5F               [ 1] 1086 	clrw	x
      00B65C 1F 26            [ 2] 1087 	ldw	(0x26, sp), x
      00B65E                       1088 00128$:
      00B65E 1E 26            [ 2] 1089 	ldw	x, (0x26, sp)
      00B660 13 24            [ 2] 1090 	cpw	x, (0x24, sp)
      00B662 2E 10            [ 1] 1091 	jrsge	00111$
                                   1092 ;	./../../mib/stm8s_mib_debug_cmd.c: 363: mib_printf("   ");
      00B664 4B C8            [ 1] 1093 	push	#<(___str_10+0)
      00B666 4B 8C            [ 1] 1094 	push	#((___str_10+0) >> 8)
      00B668 CD B0 3B         [ 4] 1095 	call	_mib_printf
      00B66B 5B 02            [ 2] 1096 	addw	sp, #2
                                   1097 ;	./../../mib/stm8s_mib_debug_cmd.c: 361: for (i = 0; i < (16 - (remainder >> 1) * 2); i++)
      00B66D 1E 26            [ 2] 1098 	ldw	x, (0x26, sp)
      00B66F 5C               [ 1] 1099 	incw	x
      00B670 1F 26            [ 2] 1100 	ldw	(0x26, sp), x
      00B672 20 EA            [ 2] 1101 	jra	00128$
      00B674                       1102 00111$:
                                   1103 ;	./../../mib/stm8s_mib_debug_cmd.c: 365: mib_printf(" ");
      00B674 4B B7            [ 1] 1104 	push	#<(___str_6+0)
      00B676 4B 8C            [ 1] 1105 	push	#((___str_6+0) >> 8)
      00B678 CD B0 3B         [ 4] 1106 	call	_mib_printf
      00B67B 5B 02            [ 2] 1107 	addw	sp, #2
                                   1108 ;	./../../mib/stm8s_mib_debug_cmd.c: 366: for (i = 0; i < remainder; i++)
      00B67D 5F               [ 1] 1109 	clrw	x
      00B67E 1F 26            [ 2] 1110 	ldw	(0x26, sp), x
      00B680                       1111 00131$:
      00B680 1E 26            [ 2] 1112 	ldw	x, (0x26, sp)
      00B682 13 19            [ 2] 1113 	cpw	x, (0x19, sp)
      00B684 2E 2C            [ 1] 1114 	jrsge	00116$
                                   1115 ;	./../../mib/stm8s_mib_debug_cmd.c: 368: c = p_data[i];
      00B686 96               [ 1] 1116 	ldw	x, sp
      00B687 5C               [ 1] 1117 	incw	x
      00B688 72 FB 26         [ 2] 1118 	addw	x, (0x26, sp)
      00B68B F6               [ 1] 1119 	ld	a, (x)
                                   1120 ;	./../../mib/stm8s_mib_debug_cmd.c: 369: if (c >= 32 && c <= 125)
      00B68C A1 20            [ 1] 1121 	cp	a, #0x20
      00B68E 25 12            [ 1] 1122 	jrc	00113$
      00B690 A1 7D            [ 1] 1123 	cp	a, #0x7d
      00B692 22 0E            [ 1] 1124 	jrugt	00113$
                                   1125 ;	./../../mib/stm8s_mib_debug_cmd.c: 370: mib_printf("%c", c);
      00B694 5F               [ 1] 1126 	clrw	x
      00B695 97               [ 1] 1127 	ld	xl, a
      00B696 89               [ 2] 1128 	pushw	x
      00B697 4B B9            [ 1] 1129 	push	#<(___str_7+0)
      00B699 4B 8C            [ 1] 1130 	push	#((___str_7+0) >> 8)
      00B69B CD B0 3B         [ 4] 1131 	call	_mib_printf
      00B69E 5B 04            [ 2] 1132 	addw	sp, #4
      00B6A0 20 09            [ 2] 1133 	jra	00132$
      00B6A2                       1134 00113$:
                                   1135 ;	./../../mib/stm8s_mib_debug_cmd.c: 372: mib_printf(".");
      00B6A2 4B BC            [ 1] 1136 	push	#<(___str_8+0)
      00B6A4 4B 8C            [ 1] 1137 	push	#((___str_8+0) >> 8)
      00B6A6 CD B0 3B         [ 4] 1138 	call	_mib_printf
      00B6A9 5B 02            [ 2] 1139 	addw	sp, #2
      00B6AB                       1140 00132$:
                                   1141 ;	./../../mib/stm8s_mib_debug_cmd.c: 366: for (i = 0; i < remainder; i++)
      00B6AB 1E 26            [ 2] 1142 	ldw	x, (0x26, sp)
      00B6AD 5C               [ 1] 1143 	incw	x
      00B6AE 1F 26            [ 2] 1144 	ldw	(0x26, sp), x
      00B6B0 20 CE            [ 2] 1145 	jra	00131$
      00B6B2                       1146 00116$:
                                   1147 ;	./../../mib/stm8s_mib_debug_cmd.c: 374: for (i = 0; i < (16 - remainder); i++)
      00B6B2 A6 10            [ 1] 1148 	ld	a, #0x10
      00B6B4 10 1A            [ 1] 1149 	sub	a, (0x1a, sp)
      00B6B6 6B 25            [ 1] 1150 	ld	(0x25, sp), a
      00B6B8 4F               [ 1] 1151 	clr	a
      00B6B9 12 19            [ 1] 1152 	sbc	a, (0x19, sp)
      00B6BB 6B 24            [ 1] 1153 	ld	(0x24, sp), a
      00B6BD 5F               [ 1] 1154 	clrw	x
      00B6BE 1F 26            [ 2] 1155 	ldw	(0x26, sp), x
      00B6C0                       1156 00134$:
      00B6C0 1E 26            [ 2] 1157 	ldw	x, (0x26, sp)
      00B6C2 13 24            [ 2] 1158 	cpw	x, (0x24, sp)
      00B6C4 2E 10            [ 1] 1159 	jrsge	00117$
                                   1160 ;	./../../mib/stm8s_mib_debug_cmd.c: 376: mib_printf(" ");
      00B6C6 4B B7            [ 1] 1161 	push	#<(___str_6+0)
      00B6C8 4B 8C            [ 1] 1162 	push	#((___str_6+0) >> 8)
      00B6CA CD B0 3B         [ 4] 1163 	call	_mib_printf
      00B6CD 5B 02            [ 2] 1164 	addw	sp, #2
                                   1165 ;	./../../mib/stm8s_mib_debug_cmd.c: 374: for (i = 0; i < (16 - remainder); i++)
      00B6CF 1E 26            [ 2] 1166 	ldw	x, (0x26, sp)
      00B6D1 5C               [ 1] 1167 	incw	x
      00B6D2 1F 26            [ 2] 1168 	ldw	(0x26, sp), x
      00B6D4 20 EA            [ 2] 1169 	jra	00134$
      00B6D6                       1170 00117$:
                                   1171 ;	./../../mib/stm8s_mib_debug_cmd.c: 379: mib_printf("\r\n");
      00B6D6 4B 51            [ 1] 1172 	push	#<(___str_0+0)
      00B6D8 4B 8C            [ 1] 1173 	push	#((___str_0+0) >> 8)
      00B6DA CD B0 3B         [ 4] 1174 	call	_mib_printf
      00B6DD 5B 02            [ 2] 1175 	addw	sp, #2
      00B6DF                       1176 00119$:
                                   1177 ;	./../../mib/stm8s_mib_debug_cmd.c: 381: return;
                                   1178 ;	./../../mib/stm8s_mib_debug_cmd.c: 382: } // HexDump.
      00B6DF 1E 28            [ 2] 1179 	ldw	x, (40, sp)
      00B6E1 5B 31            [ 2] 1180 	addw	sp, #49
      00B6E3 FC               [ 2] 1181 	jp	(x)
                                   1182 ;	./../../mib/stm8s_mib_debug_cmd.c: 391: int DoPrintHelp(int argc, char **argv)
                                   1183 ;	-----------------------------------------
                                   1184 ;	 function DoPrintHelp
                                   1185 ;	-----------------------------------------
      00B6E4                       1186 _DoPrintHelp:
      00B6E4 52 02            [ 2] 1187 	sub	sp, #2
                                   1188 ;	./../../mib/stm8s_mib_debug_cmd.c: 395: if (argc == 1)
      00B6E6 5A               [ 2] 1189 	decw	x
      00B6E7 26 39            [ 1] 1190 	jrne	00105$
                                   1191 ;	./../../mib/stm8s_mib_debug_cmd.c: 397: mib_printf("*******\r\n");
      00B6E9 4B CC            [ 1] 1192 	push	#<(___str_11+0)
      00B6EB 4B 8C            [ 1] 1193 	push	#((___str_11+0) >> 8)
      00B6ED CD B0 3B         [ 4] 1194 	call	_mib_printf
      00B6F0 5B 02            [ 2] 1195 	addw	sp, #2
                                   1196 ;	./../../mib/stm8s_mib_debug_cmd.c: 398: mib_printf("  help  Help for commands.\r\n");
      00B6F2 4B D6            [ 1] 1197 	push	#<(___str_12+0)
      00B6F4 4B 8C            [ 1] 1198 	push	#((___str_12+0) >> 8)
      00B6F6 CD B0 3B         [ 4] 1199 	call	_mib_printf
      00B6F9 5B 02            [ 2] 1200 	addw	sp, #2
                                   1201 ;	./../../mib/stm8s_mib_debug_cmd.c: 400: for (cptr = cmdTbl; cptr->cmd; cptr++)
      00B6FB AE 01 5E         [ 2] 1202 	ldw	x, #(_cmdTbl+0)
      00B6FE 1F 01            [ 2] 1203 	ldw	(0x01, sp), x
      00B700                       1204 00108$:
      00B700 1E 01            [ 2] 1205 	ldw	x, (0x01, sp)
      00B702 FE               [ 2] 1206 	ldw	x, (x)
      00B703 27 12            [ 1] 1207 	jreq	00103$
                                   1208 ;	./../../mib/stm8s_mib_debug_cmd.c: 402: if (cptr->usage)
      00B705 1E 01            [ 2] 1209 	ldw	x, (0x01, sp)
      00B707 EE 04            [ 2] 1210 	ldw	x, (0x4, x)
      00B709 27 03            [ 1] 1211 	jreq	00109$
                                   1212 ;	./../../mib/stm8s_mib_debug_cmd.c: 403: MibWriteDebugString(cptr->usage);
      00B70B CD A6 1F         [ 4] 1213 	call	_MibWriteDebugString
      00B70E                       1214 00109$:
                                   1215 ;	./../../mib/stm8s_mib_debug_cmd.c: 400: for (cptr = cmdTbl; cptr->cmd; cptr++)
      00B70E 1E 01            [ 2] 1216 	ldw	x, (0x01, sp)
      00B710 1C 00 06         [ 2] 1217 	addw	x, #0x0006
      00B713 1F 01            [ 2] 1218 	ldw	(0x01, sp), x
      00B715 20 E9            [ 2] 1219 	jra	00108$
      00B717                       1220 00103$:
                                   1221 ;	./../../mib/stm8s_mib_debug_cmd.c: 405: mib_printf("*******\r\n");
      00B717 4B CC            [ 1] 1222 	push	#<(___str_11+0)
      00B719 4B 8C            [ 1] 1223 	push	#((___str_11+0) >> 8)
      00B71B CD B0 3B         [ 4] 1224 	call	_mib_printf
      00B71E 5B 02            [ 2] 1225 	addw	sp, #2
      00B720 20 1F            [ 2] 1226 	jra	00106$
      00B722                       1227 00105$:
                                   1228 ;	./../../mib/stm8s_mib_debug_cmd.c: 409: mib_printf("\tUnknown command : ");
      00B722 4B F3            [ 1] 1229 	push	#<(___str_13+0)
      00B724 4B 8C            [ 1] 1230 	push	#((___str_13+0) >> 8)
      00B726 CD B0 3B         [ 4] 1231 	call	_mib_printf
      00B729 5B 02            [ 2] 1232 	addw	sp, #2
                                   1233 ;	./../../mib/stm8s_mib_debug_cmd.c: 410: mib_printf("%s", argv[0]);
      00B72B 1E 05            [ 2] 1234 	ldw	x, (0x05, sp)
      00B72D FE               [ 2] 1235 	ldw	x, (x)
      00B72E 89               [ 2] 1236 	pushw	x
      00B72F 4B 07            [ 1] 1237 	push	#<(___str_14+0)
      00B731 4B 8D            [ 1] 1238 	push	#((___str_14+0) >> 8)
      00B733 CD B0 3B         [ 4] 1239 	call	_mib_printf
      00B736 5B 04            [ 2] 1240 	addw	sp, #4
                                   1241 ;	./../../mib/stm8s_mib_debug_cmd.c: 411: mib_printf("\r\n");
      00B738 4B 51            [ 1] 1242 	push	#<(___str_0+0)
      00B73A 4B 8C            [ 1] 1243 	push	#((___str_0+0) >> 8)
      00B73C CD B0 3B         [ 4] 1244 	call	_mib_printf
      00B73F 5B 02            [ 2] 1245 	addw	sp, #2
      00B741                       1246 00106$:
                                   1247 ;	./../../mib/stm8s_mib_debug_cmd.c: 413: return TRUE;
      00B741 5F               [ 1] 1248 	clrw	x
      00B742 5C               [ 1] 1249 	incw	x
                                   1250 ;	./../../mib/stm8s_mib_debug_cmd.c: 414: }
      00B743 5B 02            [ 2] 1251 	addw	sp, #2
      00B745 90 85            [ 2] 1252 	popw	y
      00B747 5B 02            [ 2] 1253 	addw	sp, #2
      00B749 90 FC            [ 2] 1254 	jp	(y)
                                   1255 ;	./../../mib/stm8s_mib_debug_cmd.c: 424: int getdec(uint8_t **ptr)
                                   1256 ;	-----------------------------------------
                                   1257 ;	 function getdec
                                   1258 ;	-----------------------------------------
      00B74B                       1259 _getdec:
      00B74B 52 06            [ 2] 1260 	sub	sp, #6
                                   1261 ;	./../../mib/stm8s_mib_debug_cmd.c: 426: uint8_t *p = *ptr;
      00B74D 1F 05            [ 2] 1262 	ldw	(0x05, sp), x
      00B74F FE               [ 2] 1263 	ldw	x, (x)
      00B750 1F 01            [ 2] 1264 	ldw	(0x01, sp), x
                                   1265 ;	./../../mib/stm8s_mib_debug_cmd.c: 427: int ret = 0;
      00B752 5F               [ 1] 1266 	clrw	x
      00B753 1F 03            [ 2] 1267 	ldw	(0x03, sp), x
                                   1268 ;	./../../mib/stm8s_mib_debug_cmd.c: 428: if ((*p < '0') || (*p > '9'))
      00B755 1E 01            [ 2] 1269 	ldw	x, (0x01, sp)
      00B757 F6               [ 1] 1270 	ld	a, (x)
      00B758 A1 30            [ 1] 1271 	cp	a, #0x30
      00B75A 25 04            [ 1] 1272 	jrc	00101$
      00B75C A1 39            [ 1] 1273 	cp	a, #0x39
      00B75E 23 04            [ 2] 1274 	jrule	00113$
      00B760                       1275 00101$:
                                   1276 ;	./../../mib/stm8s_mib_debug_cmd.c: 429: return (-1);
      00B760 5F               [ 1] 1277 	clrw	x
      00B761 5A               [ 2] 1278 	decw	x
      00B762 20 29            [ 2] 1279 	jra	00108$
                                   1280 ;	./../../mib/stm8s_mib_debug_cmd.c: 430: while ((*p >= '0') && (*p <= '9'))
      00B764                       1281 00113$:
      00B764 16 01            [ 2] 1282 	ldw	y, (0x01, sp)
      00B766                       1283 00105$:
      00B766 90 F6            [ 1] 1284 	ld	a, (y)
      00B768 A1 30            [ 1] 1285 	cp	a, #0x30
      00B76A 25 1C            [ 1] 1286 	jrc	00107$
      00B76C A1 39            [ 1] 1287 	cp	a, #0x39
      00B76E 22 18            [ 1] 1288 	jrugt	00107$
                                   1289 ;	./../../mib/stm8s_mib_debug_cmd.c: 432: ret = ret * 10 + (int)(*p - '0');
      00B770 1E 03            [ 2] 1290 	ldw	x, (0x03, sp)
      00B772 58               [ 2] 1291 	sllw	x
      00B773 58               [ 2] 1292 	sllw	x
      00B774 72 FB 03         [ 2] 1293 	addw	x, (0x03, sp)
      00B777 58               [ 2] 1294 	sllw	x
      00B778 1F 03            [ 2] 1295 	ldw	(0x03, sp), x
      00B77A 5F               [ 1] 1296 	clrw	x
      00B77B 97               [ 1] 1297 	ld	xl, a
      00B77C 1D 00 30         [ 2] 1298 	subw	x, #0x0030
      00B77F 72 FB 03         [ 2] 1299 	addw	x, (0x03, sp)
      00B782 1F 03            [ 2] 1300 	ldw	(0x03, sp), x
                                   1301 ;	./../../mib/stm8s_mib_debug_cmd.c: 433: p++;
      00B784 90 5C            [ 1] 1302 	incw	y
      00B786 20 DE            [ 2] 1303 	jra	00105$
      00B788                       1304 00107$:
                                   1305 ;	./../../mib/stm8s_mib_debug_cmd.c: 435: *ptr = p;
      00B788 1E 05            [ 2] 1306 	ldw	x, (0x05, sp)
      00B78A FF               [ 2] 1307 	ldw	(x), y
                                   1308 ;	./../../mib/stm8s_mib_debug_cmd.c: 436: return (ret);
      00B78B 1E 03            [ 2] 1309 	ldw	x, (0x03, sp)
      00B78D                       1310 00108$:
                                   1311 ;	./../../mib/stm8s_mib_debug_cmd.c: 437: }
      00B78D 5B 06            [ 2] 1312 	addw	sp, #6
      00B78F 81               [ 4] 1313 	ret
                                   1314 	.area CODE
                                   1315 	.area CONST
                                   1316 	.area CONST
      008C51                       1317 ___str_0:
      008C51 0D                    1318 	.db 0x0d
      008C52 0A                    1319 	.db 0x0a
      008C53 00                    1320 	.db 0x00
                                   1321 	.area CODE
                                   1322 	.area CONST
      008C54                       1323 ___str_1:
      008C54 08                    1324 	.db 0x08
      008C55 20                    1325 	.ascii " "
      008C56 08                    1326 	.db 0x08
      008C57 00                    1327 	.db 0x00
                                   1328 	.area CODE
                                   1329 	.area CONST
      008C58                       1330 ___str_2:
      008C58 30 78                 1331 	.ascii "0x"
      008C5A 00                    1332 	.db 0x00
                                   1333 	.area CODE
                                   1334 	.area CONST
      008C5B                       1335 ___str_3:
      008C5B 61 64 64 72 65 73 73  1336 	.ascii "address     Hex Value                                       "
             20 20 20 20 20 48 65
             78 20 56 61 6C 75 65
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      008C97 20 41 73 63 69 69 20  1337 	.ascii " Ascii value"
             76 61 6C 75 65
      008CA3 0D                    1338 	.db 0x0d
      008CA4 0A                    1339 	.db 0x0a
      008CA5 00                    1340 	.db 0x00
                                   1341 	.area CODE
                                   1342 	.area CONST
      008CA6                       1343 ___str_4:
      008CA6 30 78 25 30 38 6C 78  1344 	.ascii "0x%08lx : "
             20 3A 20
      008CB0 00                    1345 	.db 0x00
                                   1346 	.area CODE
                                   1347 	.area CONST
      008CB1                       1348 ___str_5:
      008CB1 25 30 32 78 20        1349 	.ascii "%02x "
      008CB6 00                    1350 	.db 0x00
                                   1351 	.area CODE
                                   1352 	.area CONST
      008CB7                       1353 ___str_6:
      008CB7 20                    1354 	.ascii " "
      008CB8 00                    1355 	.db 0x00
                                   1356 	.area CODE
                                   1357 	.area CONST
      008CB9                       1358 ___str_7:
      008CB9 25 63                 1359 	.ascii "%c"
      008CBB 00                    1360 	.db 0x00
                                   1361 	.area CODE
                                   1362 	.area CONST
      008CBC                       1363 ___str_8:
      008CBC 2E                    1364 	.ascii "."
      008CBD 00                    1365 	.db 0x00
                                   1366 	.area CODE
                                   1367 	.area CONST
      008CBE                       1368 ___str_9:
      008CBE 30 78 25 30 38 6C 78  1369 	.ascii "0x%08lx  "
             20 20
      008CC7 00                    1370 	.db 0x00
                                   1371 	.area CODE
                                   1372 	.area CONST
      008CC8                       1373 ___str_10:
      008CC8 20 20 20              1374 	.ascii "   "
      008CCB 00                    1375 	.db 0x00
                                   1376 	.area CODE
                                   1377 	.area CONST
      008CCC                       1378 ___str_11:
      008CCC 2A 2A 2A 2A 2A 2A 2A  1379 	.ascii "*******"
      008CD3 0D                    1380 	.db 0x0d
      008CD4 0A                    1381 	.db 0x0a
      008CD5 00                    1382 	.db 0x00
                                   1383 	.area CODE
                                   1384 	.area CONST
      008CD6                       1385 ___str_12:
      008CD6 20 20 68 65 6C 70 20  1386 	.ascii "  help  Help for commands."
             20 48 65 6C 70 20 66
             6F 72 20 63 6F 6D 6D
             61 6E 64 73 2E
      008CF0 0D                    1387 	.db 0x0d
      008CF1 0A                    1388 	.db 0x0a
      008CF2 00                    1389 	.db 0x00
                                   1390 	.area CODE
                                   1391 	.area CONST
      008CF3                       1392 ___str_13:
      008CF3 09                    1393 	.db 0x09
      008CF4 55 6E 6B 6E 6F 77 6E  1394 	.ascii "Unknown command : "
             20 63 6F 6D 6D 61 6E
             64 20 3A 20
      008D06 00                    1395 	.db 0x00
                                   1396 	.area CODE
                                   1397 	.area CONST
      008D07                       1398 ___str_14:
      008D07 25 73                 1399 	.ascii "%s"
      008D09 00                    1400 	.db 0x00
                                   1401 	.area CODE
                                   1402 	.area INITIALIZER
      009219                       1403 __xinit__cmdTbl:
      009219 00 00                 1404 	.dw #0x0000
      00921B 00 00                 1405 	.dw #0x0000
      00921D 00 00                 1406 	.dw #0x0000
      00921F 00 00                 1407 	.dw #0x0000
      009221 00 00                 1408 	.dw #0x0000
      009223 00 00                 1409 	.dw #0x0000
      009225 00 00                 1410 	.dw #0x0000
      009227 00 00                 1411 	.dw #0x0000
      009229 00 00                 1412 	.dw #0x0000
      00922B 00 00                 1413 	.dw #0x0000
      00922D 00 00                 1414 	.dw #0x0000
      00922F 00 00                 1415 	.dw #0x0000
      009231 00 00                 1416 	.dw #0x0000
      009233 00 00                 1417 	.dw #0x0000
      009235 00 00                 1418 	.dw #0x0000
      009237 00 00                 1419 	.dw #0x0000
      009239 00 00                 1420 	.dw #0x0000
      00923B 00 00                 1421 	.dw #0x0000
                                   1422 	.area CABS (ABS)
