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
      000049                         33 _cmd_list::
      000049                         34 	.ds 258
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
                                     70 ;	./../../mib/stm8s_mib_debug_cmd.c: 85: int GetCommand(char *cmd, uint16_t len, uint8_t timeout)
                                     71 ;	-----------------------------------------
                                     72 ;	 function GetCommand
                                     73 ;	-----------------------------------------
      00A03C                         74 _GetCommand:
      00A03C 52 10            [ 2]   75 	sub	sp, #16
      00A03E 1F 0D            [ 2]   76 	ldw	(0x0d, sp), x
                                     77 ;	./../../mib/stm8s_mib_debug_cmd.c: 88: uint16_t vwIndex, rdCnt, rdMax = len - 1;
      00A040 1E 13            [ 2]   78 	ldw	x, (0x13, sp)
      00A042 5A               [ 2]   79 	decw	x
      00A043 1F 01            [ 2]   80 	ldw	(0x01, sp), x
                                     81 ;	./../../mib/stm8s_mib_debug_cmd.c: 91: endTime = MibGetSecs() + (uint16_t)timeout;
      00A045 CD A0 2D         [ 4]   82 	call	_MibGetSecs
      00A048 7B 15            [ 1]   83 	ld	a, (0x15, sp)
      00A04A 6B 10            [ 1]   84 	ld	(0x10, sp), a
      00A04C 0F 0F            [ 1]   85 	clr	(0x0f, sp)
      00A04E 72 FB 0F         [ 2]   86 	addw	x, (0x0f, sp)
      00A051 1F 03            [ 2]   87 	ldw	(0x03, sp), x
                                     88 ;	./../../mib/stm8s_mib_debug_cmd.c: 92: cmd_list.cur = cmd_list.next;
      00A053 C6 00 4A         [ 1]   89 	ld	a, _cmd_list+1
      00A056 C7 00 49         [ 1]   90 	ld	_cmd_list+0, a
                                     91 ;	./../../mib/stm8s_mib_debug_cmd.c: 93: for (rdCnt = 0, vwIndex = 0; rdCnt <= rdMax;)
      00A059 5F               [ 1]   92 	clrw	x
      00A05A 1F 0F            [ 2]   93 	ldw	(0x0f, sp), x
      00A05C                         94 00149$:
      00A05C 1E 0F            [ 2]   95 	ldw	x, (0x0f, sp)
      00A05E 13 01            [ 2]   96 	cpw	x, (0x01, sp)
      00A060 23 03            [ 2]   97 	jrule	00243$
      00A062 CC A2 2F         [ 2]   98 	jp	00147$
      00A065                         99 00243$:
                                    100 ;	./../../mib/stm8s_mib_debug_cmd.c: 96: while (1)
      00A065                        101 00106$:
                                    102 ;	./../../mib/stm8s_mib_debug_cmd.c: 98: vwCh = MibReadDebugByte();
      00A065 CD 95 CC         [ 4]  103 	call	_MibReadDebugByte
                                    104 ;	./../../mib/stm8s_mib_debug_cmd.c: 99: if (vwCh != 0xffff)	break;
      00A068 1F 05            [ 2]  105 	ldw	(0x05, sp), x
      00A06A 1F 07            [ 2]  106 	ldw	(0x07, sp), x
                                    107 ;	./../../mib/stm8s_mib_debug_cmd.c: 102: cmd[rdCnt++] = '\0';
      00A06C 1E 0F            [ 2]  108 	ldw	x, (0x0f, sp)
      00A06E 5C               [ 1]  109 	incw	x
      00A06F 1F 09            [ 2]  110 	ldw	(0x09, sp), x
                                    111 ;	./../../mib/stm8s_mib_debug_cmd.c: 104: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      00A071 16 0D            [ 2]  112 	ldw	y, (0x0d, sp)
      00A073 17 0B            [ 2]  113 	ldw	(0x0b, sp), y
                                    114 ;	./../../mib/stm8s_mib_debug_cmd.c: 99: if (vwCh != 0xffff)	break;
      00A075 1E 07            [ 2]  115 	ldw	x, (0x07, sp)
      00A077 5C               [ 1]  116 	incw	x
      00A078 26 55            [ 1]  117 	jrne	00107$
                                    118 ;	./../../mib/stm8s_mib_debug_cmd.c: 100: if (MibGetSecs() > endTime)
      00A07A CD A0 2D         [ 4]  119 	call	_MibGetSecs
      00A07D 13 03            [ 2]  120 	cpw	x, (0x03, sp)
      00A07F 23 E4            [ 2]  121 	jrule	00106$
                                    122 ;	./../../mib/stm8s_mib_debug_cmd.c: 102: cmd[rdCnt++] = '\0';
      00A081 1E 0F            [ 2]  123 	ldw	x, (0x0f, sp)
      00A083 16 09            [ 2]  124 	ldw	y, (0x09, sp)
      00A085 17 0F            [ 2]  125 	ldw	(0x0f, sp), y
      00A087 72 FB 0D         [ 2]  126 	addw	x, (0x0d, sp)
      00A08A 7F               [ 1]  127 	clr	(x)
                                    128 ;	./../../mib/stm8s_mib_debug_cmd.c: 103: memset(cmd_list.buf[cmd_list.next], 0, CMD_CHAR_MAX);
      00A08B C6 00 4A         [ 1]  129 	ld	a, _cmd_list+1
      00A08E 97               [ 1]  130 	ld	xl, a
      00A08F A6 40            [ 1]  131 	ld	a, #0x40
      00A091 42               [ 4]  132 	mul	x, a
      00A092 1C 00 4B         [ 2]  133 	addw	x, #(_cmd_list+2)
      00A095 4B 40            [ 1]  134 	push	#0x40
      00A097 4B 00            [ 1]  135 	push	#0x00
      00A099 4B 00            [ 1]  136 	push	#0x00
      00A09B 4B 00            [ 1]  137 	push	#0x00
      00A09D CD B3 97         [ 4]  138 	call	_memset
                                    139 ;	./../../mib/stm8s_mib_debug_cmd.c: 104: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      00A0A0 1E 0D            [ 2]  140 	ldw	x, (0x0d, sp)
      00A0A2 CD B3 BB         [ 4]  141 	call	_strlen
      00A0A5 51               [ 1]  142 	exgw	x, y
      00A0A6 C6 00 4A         [ 1]  143 	ld	a, _cmd_list+1
      00A0A9 97               [ 1]  144 	ld	xl, a
      00A0AA A6 40            [ 1]  145 	ld	a, #0x40
      00A0AC 42               [ 4]  146 	mul	x, a
      00A0AD 1C 00 4B         [ 2]  147 	addw	x, #(_cmd_list+2)
      00A0B0 90 89            [ 2]  148 	pushw	y
      00A0B2 16 0D            [ 2]  149 	ldw	y, (0x0d, sp)
      00A0B4 90 89            [ 2]  150 	pushw	y
      00A0B6 CD B3 44         [ 4]  151 	call	___memcpy
                                    152 ;	./../../mib/stm8s_mib_debug_cmd.c: 105: cmd_list.next = (cmd_list.next + 1) % CMD_LINE_MAX;
      00A0B9 C6 00 4A         [ 1]  153 	ld	a, _cmd_list+1
      00A0BC 5F               [ 1]  154 	clrw	x
      00A0BD 97               [ 1]  155 	ld	xl, a
      00A0BE 5C               [ 1]  156 	incw	x
      00A0BF 4B 04            [ 1]  157 	push	#0x04
      00A0C1 4B 00            [ 1]  158 	push	#0x00
      00A0C3 CD B4 05         [ 4]  159 	call	__modsint
      00A0C6 9F               [ 1]  160 	ld	a, xl
      00A0C7 C7 00 4A         [ 1]  161 	ld	_cmd_list+1, a
                                    162 ;	./../../mib/stm8s_mib_debug_cmd.c: 106: return rdCnt;
      00A0CA 1E 0F            [ 2]  163 	ldw	x, (0x0f, sp)
      00A0CC CC A2 31         [ 2]  164 	jp	00151$
      00A0CF                        165 00107$:
                                    166 ;	./../../mib/stm8s_mib_debug_cmd.c: 112: if ((vwCh == '@') || (vwCh == '\n') || (vwCh == 0x03))
      00A0CF 1E 07            [ 2]  167 	ldw	x, (0x07, sp)
      00A0D1 A3 00 40         [ 2]  168 	cpw	x, #0x0040
      00A0D4 27 0E            [ 1]  169 	jreq	00142$
      00A0D6 1E 07            [ 2]  170 	ldw	x, (0x07, sp)
      00A0D8 A3 00 0A         [ 2]  171 	cpw	x, #0x000a
      00A0DB 27 07            [ 1]  172 	jreq	00142$
      00A0DD 1E 07            [ 2]  173 	ldw	x, (0x07, sp)
      00A0DF A3 00 03         [ 2]  174 	cpw	x, #0x0003
      00A0E2 26 57            [ 1]  175 	jrne	00143$
      00A0E4                        176 00142$:
                                    177 ;	./../../mib/stm8s_mib_debug_cmd.c: 114: cmd[rdCnt++] = '\0';
      00A0E4 1E 0F            [ 2]  178 	ldw	x, (0x0f, sp)
      00A0E6 16 09            [ 2]  179 	ldw	y, (0x09, sp)
      00A0E8 17 0F            [ 2]  180 	ldw	(0x0f, sp), y
      00A0EA 72 FB 0D         [ 2]  181 	addw	x, (0x0d, sp)
      00A0ED 7F               [ 1]  182 	clr	(x)
                                    183 ;	./../../mib/stm8s_mib_debug_cmd.c: 115: memset(cmd_list.buf[cmd_list.next], 0, CMD_CHAR_MAX);
      00A0EE C6 00 4A         [ 1]  184 	ld	a, _cmd_list+1
      00A0F1 97               [ 1]  185 	ld	xl, a
      00A0F2 A6 40            [ 1]  186 	ld	a, #0x40
      00A0F4 42               [ 4]  187 	mul	x, a
      00A0F5 1C 00 4B         [ 2]  188 	addw	x, #(_cmd_list+2)
      00A0F8 4B 40            [ 1]  189 	push	#0x40
      00A0FA 4B 00            [ 1]  190 	push	#0x00
      00A0FC 4B 00            [ 1]  191 	push	#0x00
      00A0FE 4B 00            [ 1]  192 	push	#0x00
      00A100 CD B3 97         [ 4]  193 	call	_memset
                                    194 ;	./../../mib/stm8s_mib_debug_cmd.c: 116: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      00A103 1E 0D            [ 2]  195 	ldw	x, (0x0d, sp)
      00A105 CD B3 BB         [ 4]  196 	call	_strlen
      00A108 51               [ 1]  197 	exgw	x, y
      00A109 C6 00 4A         [ 1]  198 	ld	a, _cmd_list+1
      00A10C 97               [ 1]  199 	ld	xl, a
      00A10D A6 40            [ 1]  200 	ld	a, #0x40
      00A10F 42               [ 4]  201 	mul	x, a
      00A110 1C 00 4B         [ 2]  202 	addw	x, #(_cmd_list+2)
      00A113 90 89            [ 2]  203 	pushw	y
      00A115 16 0D            [ 2]  204 	ldw	y, (0x0d, sp)
      00A117 90 89            [ 2]  205 	pushw	y
      00A119 CD B3 44         [ 4]  206 	call	___memcpy
                                    207 ;	./../../mib/stm8s_mib_debug_cmd.c: 117: cmd_list.next = (cmd_list.next + 1) % CMD_LINE_MAX;
      00A11C C6 00 4A         [ 1]  208 	ld	a, _cmd_list+1
      00A11F 5F               [ 1]  209 	clrw	x
      00A120 97               [ 1]  210 	ld	xl, a
      00A121 5C               [ 1]  211 	incw	x
      00A122 4B 04            [ 1]  212 	push	#0x04
      00A124 4B 00            [ 1]  213 	push	#0x00
      00A126 CD B4 05         [ 4]  214 	call	__modsint
      00A129 9F               [ 1]  215 	ld	a, xl
      00A12A C7 00 4A         [ 1]  216 	ld	_cmd_list+1, a
                                    217 ;	./../../mib/stm8s_mib_debug_cmd.c: 119: mib_printf("\r\n");
      00A12D 4B A3            [ 1]  218 	push	#<(___str_0+0)
      00A12F 4B 85            [ 1]  219 	push	#((___str_0+0) >> 8)
      00A131 CD 9F BD         [ 4]  220 	call	_mib_printf
      00A134 5B 02            [ 2]  221 	addw	sp, #2
                                    222 ;	./../../mib/stm8s_mib_debug_cmd.c: 120: return rdCnt;
      00A136 1E 0F            [ 2]  223 	ldw	x, (0x0f, sp)
      00A138 CC A2 31         [ 2]  224 	jp	00151$
      00A13B                        225 00143$:
                                    226 ;	./../../mib/stm8s_mib_debug_cmd.c: 122: else if (vwCh == '\b')
      00A13B 1E 07            [ 2]  227 	ldw	x, (0x07, sp)
      00A13D A3 00 08         [ 2]  228 	cpw	x, #0x0008
      00A140 26 18            [ 1]  229 	jrne	00140$
                                    230 ;	./../../mib/stm8s_mib_debug_cmd.c: 124: if (rdCnt > 0)
      00A142 1E 0F            [ 2]  231 	ldw	x, (0x0f, sp)
      00A144 26 03            [ 1]  232 	jrne	00260$
      00A146 CC A0 5C         [ 2]  233 	jp	00149$
      00A149                        234 00260$:
                                    235 ;	./../../mib/stm8s_mib_debug_cmd.c: 126: rdCnt--;
      00A149 1E 0F            [ 2]  236 	ldw	x, (0x0f, sp)
      00A14B 5A               [ 2]  237 	decw	x
      00A14C 1F 0F            [ 2]  238 	ldw	(0x0f, sp), x
                                    239 ;	./../../mib/stm8s_mib_debug_cmd.c: 128: mib_printf("\b \b");
      00A14E 4B A6            [ 1]  240 	push	#<(___str_1+0)
      00A150 4B 85            [ 1]  241 	push	#((___str_1+0) >> 8)
      00A152 CD 9F BD         [ 4]  242 	call	_mib_printf
      00A155 5B 02            [ 2]  243 	addw	sp, #2
      00A157 CC A0 5C         [ 2]  244 	jp	00149$
      00A15A                        245 00140$:
                                    246 ;	./../../mib/stm8s_mib_debug_cmd.c: 131: else if (vwCh == 0x1b)
      00A15A 1E 07            [ 2]  247 	ldw	x, (0x07, sp)
      00A15C A3 00 1B         [ 2]  248 	cpw	x, #0x001b
      00A15F 27 03            [ 1]  249 	jreq	00263$
      00A161 CC A2 1D         [ 2]  250 	jp	00137$
      00A164                        251 00263$:
                                    252 ;	./../../mib/stm8s_mib_debug_cmd.c: 134: while (1)
      00A164                        253 00113$:
                                    254 ;	./../../mib/stm8s_mib_debug_cmd.c: 136: vwCh = MibReadDebugByte();
      00A164 CD 95 CC         [ 4]  255 	call	_MibReadDebugByte
                                    256 ;	./../../mib/stm8s_mib_debug_cmd.c: 137: if (vwCh != 0xffff)
      00A167 A3 FF FF         [ 2]  257 	cpw	x, #0xffff
      00A16A 27 F8            [ 1]  258 	jreq	00113$
                                    259 ;	./../../mib/stm8s_mib_debug_cmd.c: 140: if (vwCh == '[')
      00A16C A3 00 5B         [ 2]  260 	cpw	x, #0x005b
      00A16F 27 03            [ 1]  261 	jreq	00269$
      00A171 CC A0 5C         [ 2]  262 	jp	00149$
      00A174                        263 00269$:
                                    264 ;	./../../mib/stm8s_mib_debug_cmd.c: 143: while (1)
      00A174                        265 00118$:
                                    266 ;	./../../mib/stm8s_mib_debug_cmd.c: 145: vwCh = MibReadDebugByte();
      00A174 CD 95 CC         [ 4]  267 	call	_MibReadDebugByte
                                    268 ;	./../../mib/stm8s_mib_debug_cmd.c: 146: if (vwCh != 0xffff)
      00A177 1F 09            [ 2]  269 	ldw	(0x09, sp), x
      00A179 5C               [ 1]  270 	incw	x
      00A17A 27 F8            [ 1]  271 	jreq	00118$
                                    272 ;	./../../mib/stm8s_mib_debug_cmd.c: 150: if (vwCh == 'B')
      00A17C 1E 09            [ 2]  273 	ldw	x, (0x09, sp)
      00A17E A3 00 42         [ 2]  274 	cpw	x, #0x0042
      00A181 26 48            [ 1]  275 	jrne	00132$
                                    276 ;	./../../mib/stm8s_mib_debug_cmd.c: 152: cmd_list.cur++;
      00A183 C6 00 49         [ 1]  277 	ld	a, _cmd_list+0
      00A186 4C               [ 1]  278 	inc	a
      00A187 C7 00 49         [ 1]  279 	ld	_cmd_list+0, a
                                    280 ;	./../../mib/stm8s_mib_debug_cmd.c: 153: if (cmd_list.cur == CMD_LINE_MAX)
      00A18A A1 04            [ 1]  281 	cp	a, #0x04
      00A18C 26 04            [ 1]  282 	jrne	00121$
                                    283 ;	./../../mib/stm8s_mib_debug_cmd.c: 154: cmd_list.cur = 0;
      00A18E 35 00 00 49      [ 1]  284 	mov	_cmd_list+0, #0x00
      00A192                        285 00121$:
                                    286 ;	./../../mib/stm8s_mib_debug_cmd.c: 155: rdCnt = strlen(cmd_list.buf[cmd_list.cur]);
      00A192 C6 00 49         [ 1]  287 	ld	a, _cmd_list+0
      00A195 97               [ 1]  288 	ld	xl, a
      00A196 A6 40            [ 1]  289 	ld	a, #0x40
      00A198 42               [ 4]  290 	mul	x, a
      00A199 1C 00 4B         [ 2]  291 	addw	x, #(_cmd_list+2)
      00A19C CD B3 BB         [ 4]  292 	call	_strlen
                                    293 ;	./../../mib/stm8s_mib_debug_cmd.c: 156: if (rdCnt >= rdMax)
      00A19F 1F 0F            [ 2]  294 	ldw	(0x0f, sp), x
      00A1A1 13 01            [ 2]  295 	cpw	x, (0x01, sp)
      00A1A3 25 04            [ 1]  296 	jrc	00123$
                                    297 ;	./../../mib/stm8s_mib_debug_cmd.c: 157: rdCnt = rdMax;
      00A1A5 16 01            [ 2]  298 	ldw	y, (0x01, sp)
      00A1A7 17 0F            [ 2]  299 	ldw	(0x0f, sp), y
      00A1A9                        300 00123$:
                                    301 ;	./../../mib/stm8s_mib_debug_cmd.c: 158: memcpy(cmd, cmd_list.buf[cmd_list.cur], rdCnt);
      00A1A9 16 0F            [ 2]  302 	ldw	y, (0x0f, sp)
      00A1AB C6 00 49         [ 1]  303 	ld	a, _cmd_list+0
      00A1AE 97               [ 1]  304 	ld	xl, a
      00A1AF A6 40            [ 1]  305 	ld	a, #0x40
      00A1B1 42               [ 4]  306 	mul	x, a
      00A1B2 1C 00 4B         [ 2]  307 	addw	x, #(_cmd_list+2)
      00A1B5 90 89            [ 2]  308 	pushw	y
      00A1B7 89               [ 2]  309 	pushw	x
      00A1B8 1E 0F            [ 2]  310 	ldw	x, (0x0f, sp)
      00A1BA CD B3 44         [ 4]  311 	call	___memcpy
                                    312 ;	./../../mib/stm8s_mib_debug_cmd.c: 159: cmd[rdCnt] = 0;
      00A1BD 1E 0D            [ 2]  313 	ldw	x, (0x0d, sp)
      00A1BF 72 FB 0F         [ 2]  314 	addw	x, (0x0f, sp)
      00A1C2 7F               [ 1]  315 	clr	(x)
                                    316 ;	./../../mib/stm8s_mib_debug_cmd.c: 161: MibWriteDebugString(cmd);
      00A1C3 1E 0D            [ 2]  317 	ldw	x, (0x0d, sp)
      00A1C5 CD 95 AB         [ 4]  318 	call	_MibWriteDebugString
      00A1C8 CC A0 5C         [ 2]  319 	jp	00149$
      00A1CB                        320 00132$:
                                    321 ;	./../../mib/stm8s_mib_debug_cmd.c: 163: else if (vwCh == 'A')
      00A1CB 1E 09            [ 2]  322 	ldw	x, (0x09, sp)
      00A1CD A3 00 41         [ 2]  323 	cpw	x, #0x0041
      00A1D0 27 03            [ 1]  324 	jreq	00282$
      00A1D2 CC A0 5C         [ 2]  325 	jp	00149$
      00A1D5                        326 00282$:
                                    327 ;	./../../mib/stm8s_mib_debug_cmd.c: 152: cmd_list.cur++;
                                    328 ;	./../../mib/stm8s_mib_debug_cmd.c: 165: if (cmd_list.cur == 0)
      00A1D5 C6 00 49         [ 1]  329 	ld	a, _cmd_list+0
      00A1D8 26 06            [ 1]  330 	jrne	00125$
                                    331 ;	./../../mib/stm8s_mib_debug_cmd.c: 166: cmd_list.cur = CMD_LINE_MAX - 1;
      00A1DA 35 03 00 49      [ 1]  332 	mov	_cmd_list+0, #0x03
      00A1DE 20 04            [ 2]  333 	jra	00126$
      00A1E0                        334 00125$:
                                    335 ;	./../../mib/stm8s_mib_debug_cmd.c: 168: cmd_list.cur--;
      00A1E0 4A               [ 1]  336 	dec	a
      00A1E1 C7 00 49         [ 1]  337 	ld	_cmd_list+0, a
      00A1E4                        338 00126$:
                                    339 ;	./../../mib/stm8s_mib_debug_cmd.c: 169: rdCnt = strlen(cmd_list.buf[cmd_list.cur]);
      00A1E4 C6 00 49         [ 1]  340 	ld	a, _cmd_list+0
      00A1E7 97               [ 1]  341 	ld	xl, a
      00A1E8 A6 40            [ 1]  342 	ld	a, #0x40
      00A1EA 42               [ 4]  343 	mul	x, a
      00A1EB 1C 00 4B         [ 2]  344 	addw	x, #(_cmd_list+2)
      00A1EE CD B3 BB         [ 4]  345 	call	_strlen
                                    346 ;	./../../mib/stm8s_mib_debug_cmd.c: 170: if (rdCnt >= rdMax)
      00A1F1 1F 0F            [ 2]  347 	ldw	(0x0f, sp), x
      00A1F3 13 01            [ 2]  348 	cpw	x, (0x01, sp)
      00A1F5 25 04            [ 1]  349 	jrc	00128$
                                    350 ;	./../../mib/stm8s_mib_debug_cmd.c: 171: rdCnt = rdMax;
      00A1F7 16 01            [ 2]  351 	ldw	y, (0x01, sp)
      00A1F9 17 0F            [ 2]  352 	ldw	(0x0f, sp), y
      00A1FB                        353 00128$:
                                    354 ;	./../../mib/stm8s_mib_debug_cmd.c: 172: memcpy(cmd, cmd_list.buf[cmd_list.cur], rdCnt);
      00A1FB 16 0F            [ 2]  355 	ldw	y, (0x0f, sp)
      00A1FD C6 00 49         [ 1]  356 	ld	a, _cmd_list+0
      00A200 97               [ 1]  357 	ld	xl, a
      00A201 A6 40            [ 1]  358 	ld	a, #0x40
      00A203 42               [ 4]  359 	mul	x, a
      00A204 1C 00 4B         [ 2]  360 	addw	x, #(_cmd_list+2)
      00A207 90 89            [ 2]  361 	pushw	y
      00A209 89               [ 2]  362 	pushw	x
      00A20A 1E 0F            [ 2]  363 	ldw	x, (0x0f, sp)
      00A20C CD B3 44         [ 4]  364 	call	___memcpy
                                    365 ;	./../../mib/stm8s_mib_debug_cmd.c: 173: cmd[rdCnt] = 0;
      00A20F 1E 0D            [ 2]  366 	ldw	x, (0x0d, sp)
      00A211 72 FB 0F         [ 2]  367 	addw	x, (0x0f, sp)
      00A214 7F               [ 1]  368 	clr	(x)
                                    369 ;	./../../mib/stm8s_mib_debug_cmd.c: 175: MibWriteDebugString(cmd);
      00A215 1E 0D            [ 2]  370 	ldw	x, (0x0d, sp)
      00A217 CD 95 AB         [ 4]  371 	call	_MibWriteDebugString
      00A21A CC A0 5C         [ 2]  372 	jp	00149$
      00A21D                        373 00137$:
                                    374 ;	./../../mib/stm8s_mib_debug_cmd.c: 181: cmd[rdCnt++] = vwCh;
      00A21D 1E 0F            [ 2]  375 	ldw	x, (0x0f, sp)
      00A21F 16 09            [ 2]  376 	ldw	y, (0x09, sp)
      00A221 17 0F            [ 2]  377 	ldw	(0x0f, sp), y
      00A223 72 FB 0D         [ 2]  378 	addw	x, (0x0d, sp)
      00A226 7B 06            [ 1]  379 	ld	a, (0x06, sp)
      00A228 F7               [ 1]  380 	ld	(x), a
                                    381 ;	./../../mib/stm8s_mib_debug_cmd.c: 183: MibWriteDebugByte(vwCh);
      00A229 CD 95 8E         [ 4]  382 	call	_MibWriteDebugByte
      00A22C CC A0 5C         [ 2]  383 	jp	00149$
      00A22F                        384 00147$:
                                    385 ;	./../../mib/stm8s_mib_debug_cmd.c: 186: return (rdCnt);
      00A22F 1E 0F            [ 2]  386 	ldw	x, (0x0f, sp)
      00A231                        387 00151$:
                                    388 ;	./../../mib/stm8s_mib_debug_cmd.c: 187: } // GetCommand.
      00A231 16 11            [ 2]  389 	ldw	y, (17, sp)
      00A233 5B 15            [ 2]  390 	addw	sp, #21
      00A235 90 FC            [ 2]  391 	jp	(y)
                                    392 ;	./../../mib/stm8s_mib_debug_cmd.c: 197: int GetArgs(char *s, char **argv)
                                    393 ;	-----------------------------------------
                                    394 ;	 function GetArgs
                                    395 ;	-----------------------------------------
      00A237                        396 _GetArgs:
      00A237 52 08            [ 2]  397 	sub	sp, #8
      00A239 1F 05            [ 2]  398 	ldw	(0x05, sp), x
                                    399 ;	./../../mib/stm8s_mib_debug_cmd.c: 199: int args = 0;
      00A23B 5F               [ 1]  400 	clrw	x
      00A23C 1F 01            [ 2]  401 	ldw	(0x01, sp), x
                                    402 ;	./../../mib/stm8s_mib_debug_cmd.c: 201: if (!s || *s == '\0')
      00A23E 1E 05            [ 2]  403 	ldw	x, (0x05, sp)
      00A240 27 03            [ 1]  404 	jreq	00101$
      00A242 F6               [ 1]  405 	ld	a, (x)
      00A243 26 03            [ 1]  406 	jrne	00131$
      00A245                        407 00101$:
                                    408 ;	./../../mib/stm8s_mib_debug_cmd.c: 202: return 0;
      00A245 5F               [ 1]  409 	clrw	x
      00A246 20 73            [ 2]  410 	jra	00120$
                                    411 ;	./../../mib/stm8s_mib_debug_cmd.c: 203: while (args < MAX_ARGS)
      00A248                        412 00131$:
      00A248 5F               [ 1]  413 	clrw	x
      00A249 1F 07            [ 2]  414 	ldw	(0x07, sp), x
      00A24B                        415 00117$:
      00A24B 1E 07            [ 2]  416 	ldw	x, (0x07, sp)
      00A24D A3 00 05         [ 2]  417 	cpw	x, #0x0005
      00A250 2E 67            [ 1]  418 	jrsge	00119$
                                    419 ;	./../../mib/stm8s_mib_debug_cmd.c: 206: while ((*s == ' ') || (*s == '\t'))
      00A252 1E 05            [ 2]  420 	ldw	x, (0x05, sp)
      00A254                        421 00105$:
      00A254 F6               [ 1]  422 	ld	a, (x)
      00A255 A1 20            [ 1]  423 	cp	a, #0x20
      00A257 27 04            [ 1]  424 	jreq	00106$
      00A259 A1 09            [ 1]  425 	cp	a, #0x09
      00A25B 26 03            [ 1]  426 	jrne	00107$
      00A25D                        427 00106$:
                                    428 ;	./../../mib/stm8s_mib_debug_cmd.c: 207: s++;
      00A25D 5C               [ 1]  429 	incw	x
      00A25E 20 F4            [ 2]  430 	jra	00105$
      00A260                        431 00107$:
                                    432 ;	./../../mib/stm8s_mib_debug_cmd.c: 210: if (*s == '\0')
      00A260 4D               [ 1]  433 	tnz	a
      00A261 26 0D            [ 1]  434 	jrne	00109$
                                    435 ;	./../../mib/stm8s_mib_debug_cmd.c: 212: argv[args] = 0;
      00A263 1E 01            [ 2]  436 	ldw	x, (0x01, sp)
      00A265 58               [ 2]  437 	sllw	x
      00A266 72 FB 0B         [ 2]  438 	addw	x, (0x0b, sp)
      00A269 6F 01            [ 1]  439 	clr	(0x1, x)
      00A26B 7F               [ 1]  440 	clr	(x)
                                    441 ;	./../../mib/stm8s_mib_debug_cmd.c: 213: return args;
      00A26C 1E 01            [ 2]  442 	ldw	x, (0x01, sp)
      00A26E 20 4B            [ 2]  443 	jra	00120$
      00A270                        444 00109$:
                                    445 ;	./../../mib/stm8s_mib_debug_cmd.c: 216: argv[args++] = s;
      00A270 16 07            [ 2]  446 	ldw	y, (0x07, sp)
      00A272 17 03            [ 2]  447 	ldw	(0x03, sp), y
      00A274 16 07            [ 2]  448 	ldw	y, (0x07, sp)
      00A276 90 5C            [ 1]  449 	incw	y
      00A278 17 07            [ 2]  450 	ldw	(0x07, sp), y
      00A27A 17 01            [ 2]  451 	ldw	(0x01, sp), y
      00A27C 16 03            [ 2]  452 	ldw	y, (0x03, sp)
      00A27E 90 58            [ 2]  453 	sllw	y
      00A280 72 F9 0B         [ 2]  454 	addw	y, (0x0b, sp)
      00A283 90 FF            [ 2]  455 	ldw	(y), x
                                    456 ;	./../../mib/stm8s_mib_debug_cmd.c: 219: while (*s && (*s != ' ') && (*s != '\t'))
      00A285 1F 05            [ 2]  457 	ldw	(0x05, sp), x
      00A287                        458 00112$:
      00A287 1E 05            [ 2]  459 	ldw	x, (0x05, sp)
      00A289 F6               [ 1]  460 	ld	a, (x)
                                    461 ;	./../../mib/stm8s_mib_debug_cmd.c: 220: s++;
      00A28A 1E 05            [ 2]  462 	ldw	x, (0x05, sp)
      00A28C 5C               [ 1]  463 	incw	x
      00A28D 1F 03            [ 2]  464 	ldw	(0x03, sp), x
                                    465 ;	./../../mib/stm8s_mib_debug_cmd.c: 219: while (*s && (*s != ' ') && (*s != '\t'))
      00A28F 4D               [ 1]  466 	tnz	a
      00A290 27 0E            [ 1]  467 	jreq	00114$
      00A292 A1 20            [ 1]  468 	cp	a, #0x20
      00A294 27 0A            [ 1]  469 	jreq	00114$
      00A296 A1 09            [ 1]  470 	cp	a, #0x09
      00A298 27 06            [ 1]  471 	jreq	00114$
                                    472 ;	./../../mib/stm8s_mib_debug_cmd.c: 220: s++;
      00A29A 16 03            [ 2]  473 	ldw	y, (0x03, sp)
      00A29C 17 05            [ 2]  474 	ldw	(0x05, sp), y
      00A29E 20 E7            [ 2]  475 	jra	00112$
      00A2A0                        476 00114$:
                                    477 ;	./../../mib/stm8s_mib_debug_cmd.c: 222: if (*s == '\0')
      00A2A0 4D               [ 1]  478 	tnz	a
      00A2A1 26 0D            [ 1]  479 	jrne	00116$
                                    480 ;	./../../mib/stm8s_mib_debug_cmd.c: 224: argv[args] = 0;
      00A2A3 1E 01            [ 2]  481 	ldw	x, (0x01, sp)
      00A2A5 58               [ 2]  482 	sllw	x
      00A2A6 72 FB 0B         [ 2]  483 	addw	x, (0x0b, sp)
      00A2A9 6F 01            [ 1]  484 	clr	(0x1, x)
      00A2AB 7F               [ 1]  485 	clr	(x)
                                    486 ;	./../../mib/stm8s_mib_debug_cmd.c: 225: return args;
      00A2AC 1E 01            [ 2]  487 	ldw	x, (0x01, sp)
      00A2AE 20 0B            [ 2]  488 	jra	00120$
      00A2B0                        489 00116$:
                                    490 ;	./../../mib/stm8s_mib_debug_cmd.c: 227: *s++ = '\0';
      00A2B0 1E 05            [ 2]  491 	ldw	x, (0x05, sp)
      00A2B2 7F               [ 1]  492 	clr	(x)
      00A2B3 16 03            [ 2]  493 	ldw	y, (0x03, sp)
      00A2B5 17 05            [ 2]  494 	ldw	(0x05, sp), y
      00A2B7 20 92            [ 2]  495 	jra	00117$
      00A2B9                        496 00119$:
                                    497 ;	./../../mib/stm8s_mib_debug_cmd.c: 229: return args;
      00A2B9 1E 01            [ 2]  498 	ldw	x, (0x01, sp)
      00A2BB                        499 00120$:
                                    500 ;	./../../mib/stm8s_mib_debug_cmd.c: 230: } // GetArgs.
      00A2BB 5B 08            [ 2]  501 	addw	sp, #8
      00A2BD 90 85            [ 2]  502 	popw	y
      00A2BF 5B 02            [ 2]  503 	addw	sp, #2
      00A2C1 90 FC            [ 2]  504 	jp	(y)
                                    505 ;	./../../mib/stm8s_mib_debug_cmd.c: 241: int HexToInt(char *s, void *retval, uint16_t type)
                                    506 ;	-----------------------------------------
                                    507 ;	 function HexToInt
                                    508 ;	-----------------------------------------
      00A2C3                        509 _HexToInt:
      00A2C3 52 0E            [ 2]  510 	sub	sp, #14
                                    511 ;	./../../mib/stm8s_mib_debug_cmd.c: 247: if (!s || !retval)
      00A2C5 1F 0A            [ 2]  512 	ldw	(0x0a, sp), x
      00A2C7 27 04            [ 1]  513 	jreq	00101$
      00A2C9 1E 11            [ 2]  514 	ldw	x, (0x11, sp)
      00A2CB 26 04            [ 1]  515 	jrne	00102$
      00A2CD                        516 00101$:
                                    517 ;	./../../mib/stm8s_mib_debug_cmd.c: 248: return FALSE;
      00A2CD 5F               [ 1]  518 	clrw	x
      00A2CE CC A3 A9         [ 2]  519 	jp	00132$
      00A2D1                        520 00102$:
                                    521 ;	./../../mib/stm8s_mib_debug_cmd.c: 249: if (!strncmp(s, "0x", 2))
      00A2D1 4B 02            [ 1]  522 	push	#0x02
      00A2D3 4B 00            [ 1]  523 	push	#0x00
      00A2D5 4B AA            [ 1]  524 	push	#<(___str_2+0)
      00A2D7 4B 85            [ 1]  525 	push	#((___str_2+0) >> 8)
      00A2D9 1E 0E            [ 2]  526 	ldw	x, (0x0e, sp)
      00A2DB CD B2 A1         [ 4]  527 	call	_strncmp
      00A2DE 5D               [ 2]  528 	tnzw	x
      00A2DF 26 06            [ 1]  529 	jrne	00105$
                                    530 ;	./../../mib/stm8s_mib_debug_cmd.c: 250: s += 2;
      00A2E1 1E 0A            [ 2]  531 	ldw	x, (0x0a, sp)
      00A2E3 5C               [ 1]  532 	incw	x
      00A2E4 5C               [ 1]  533 	incw	x
      00A2E5 1F 0A            [ 2]  534 	ldw	(0x0a, sp), x
      00A2E7                        535 00105$:
                                    536 ;	./../../mib/stm8s_mib_debug_cmd.c: 252: for (i = 0, rval = 0; i < type / 4; i++)
      00A2E7 0F 01            [ 1]  537 	clr	(0x01, sp)
      00A2E9 5F               [ 1]  538 	clrw	x
      00A2EA 1F 04            [ 2]  539 	ldw	(0x04, sp), x
      00A2EC 1F 02            [ 2]  540 	ldw	(0x02, sp), x
      00A2EE 16 0A            [ 2]  541 	ldw	y, (0x0a, sp)
      00A2F0 17 0C            [ 2]  542 	ldw	(0x0c, sp), y
      00A2F2 0F 0E            [ 1]  543 	clr	(0x0e, sp)
      00A2F4                        544 00130$:
      00A2F4 16 13            [ 2]  545 	ldw	y, (0x13, sp)
      00A2F6 17 06            [ 2]  546 	ldw	(0x06, sp), y
      00A2F8 93               [ 1]  547 	ldw	x, y
      00A2F9 54               [ 2]  548 	srlw	x
      00A2FA 54               [ 2]  549 	srlw	x
      00A2FB 1F 08            [ 2]  550 	ldw	(0x08, sp), x
      00A2FD 7B 0E            [ 1]  551 	ld	a, (0x0e, sp)
      00A2FF 5F               [ 1]  552 	clrw	x
      00A300 97               [ 1]  553 	ld	xl, a
      00A301 13 08            [ 2]  554 	cpw	x, (0x08, sp)
      00A303 24 70            [ 1]  555 	jrnc	00123$
                                    556 ;	./../../mib/stm8s_mib_debug_cmd.c: 254: if (*s == '\0')
      00A305 1E 0C            [ 2]  557 	ldw	x, (0x0c, sp)
      00A307 F6               [ 1]  558 	ld	a, (x)
      00A308 26 08            [ 1]  559 	jrne	00110$
                                    560 ;	./../../mib/stm8s_mib_debug_cmd.c: 256: if (i == 0)
      00A30A 0D 01            [ 1]  561 	tnz	(0x01, sp)
      00A30C 26 67            [ 1]  562 	jrne	00123$
                                    563 ;	./../../mib/stm8s_mib_debug_cmd.c: 257: return FALSE;
      00A30E 5F               [ 1]  564 	clrw	x
      00A30F CC A3 A9         [ 2]  565 	jp	00132$
                                    566 ;	./../../mib/stm8s_mib_debug_cmd.c: 259: break;
      00A312                        567 00110$:
                                    568 ;	./../../mib/stm8s_mib_debug_cmd.c: 261: c = *s++;
      00A312 1E 0C            [ 2]  569 	ldw	x, (0x0c, sp)
      00A314 5C               [ 1]  570 	incw	x
      00A315 1F 0C            [ 2]  571 	ldw	(0x0c, sp), x
                                    572 ;	./../../mib/stm8s_mib_debug_cmd.c: 264: c -= '0';
      00A317 97               [ 1]  573 	ld	xl, a
                                    574 ;	./../../mib/stm8s_mib_debug_cmd.c: 263: if (c >= '0' && c <= '9')
      00A318 A1 30            [ 1]  575 	cp	a, #0x30
      00A31A 25 09            [ 1]  576 	jrc	00120$
      00A31C A1 39            [ 1]  577 	cp	a, #0x39
      00A31E 22 05            [ 1]  578 	jrugt	00120$
                                    579 ;	./../../mib/stm8s_mib_debug_cmd.c: 264: c -= '0';
      00A320 9F               [ 1]  580 	ld	a, xl
      00A321 A0 30            [ 1]  581 	sub	a, #0x30
      00A323 20 1D            [ 2]  582 	jra	00121$
      00A325                        583 00120$:
                                    584 ;	./../../mib/stm8s_mib_debug_cmd.c: 265: else if (c >= 'a' && c <= 'f')
      00A325 A1 61            [ 1]  585 	cp	a, #0x61
      00A327 25 09            [ 1]  586 	jrc	00116$
      00A329 A1 66            [ 1]  587 	cp	a, #0x66
      00A32B 22 05            [ 1]  588 	jrugt	00116$
                                    589 ;	./../../mib/stm8s_mib_debug_cmd.c: 266: c = c - 'a' + 10;
      00A32D 9F               [ 1]  590 	ld	a, xl
      00A32E AB A9            [ 1]  591 	add	a, #0xa9
      00A330 20 10            [ 2]  592 	jra	00121$
      00A332                        593 00116$:
                                    594 ;	./../../mib/stm8s_mib_debug_cmd.c: 267: else if (c >= 'A' && c <= 'F')
      00A332 A1 41            [ 1]  595 	cp	a, #0x41
      00A334 25 09            [ 1]  596 	jrc	00112$
      00A336 A1 46            [ 1]  597 	cp	a, #0x46
      00A338 22 05            [ 1]  598 	jrugt	00112$
                                    599 ;	./../../mib/stm8s_mib_debug_cmd.c: 268: c = c - 'A' + 10;
      00A33A 9F               [ 1]  600 	ld	a, xl
      00A33B AB C9            [ 1]  601 	add	a, #0xc9
      00A33D 20 03            [ 2]  602 	jra	00121$
      00A33F                        603 00112$:
                                    604 ;	./../../mib/stm8s_mib_debug_cmd.c: 270: return FALSE;
      00A33F 5F               [ 1]  605 	clrw	x
      00A340 20 67            [ 2]  606 	jra	00132$
      00A342                        607 00121$:
                                    608 ;	./../../mib/stm8s_mib_debug_cmd.c: 272: rval = rval << 4 | c;
      00A342 88               [ 1]  609 	push	a
      00A343 1E 05            [ 2]  610 	ldw	x, (0x05, sp)
      00A345 16 03            [ 2]  611 	ldw	y, (0x03, sp)
      00A347 A6 04            [ 1]  612 	ld	a, #0x04
      00A349                        613 00222$:
      00A349 58               [ 2]  614 	sllw	x
      00A34A 90 59            [ 2]  615 	rlcw	y
      00A34C 4A               [ 1]  616 	dec	a
      00A34D 26 FA            [ 1]  617 	jrne	00222$
      00A34F 84               [ 1]  618 	pop	a
      00A350 0F 08            [ 1]  619 	clr	(0x08, sp)
      00A352 0F 07            [ 1]  620 	clr	(0x07, sp)
      00A354 0F 06            [ 1]  621 	clr	(0x06, sp)
      00A356 89               [ 2]  622 	pushw	x
      00A357 1A 02            [ 1]  623 	or	a, (2, sp)
      00A359 85               [ 2]  624 	popw	x
      00A35A 02               [ 1]  625 	rlwa	x
      00A35B 1A 08            [ 1]  626 	or	a, (0x08, sp)
      00A35D 95               [ 1]  627 	ld	xh, a
      00A35E 90 9F            [ 1]  628 	ld	a, yl
      00A360 1A 07            [ 1]  629 	or	a, (0x07, sp)
      00A362 90 02            [ 1]  630 	rlwa	y
      00A364 1A 06            [ 1]  631 	or	a, (0x06, sp)
      00A366 90 95            [ 1]  632 	ld	yh, a
      00A368 1F 04            [ 2]  633 	ldw	(0x04, sp), x
      00A36A 17 02            [ 2]  634 	ldw	(0x02, sp), y
                                    635 ;	./../../mib/stm8s_mib_debug_cmd.c: 252: for (i = 0, rval = 0; i < type / 4; i++)
      00A36C 0C 0E            [ 1]  636 	inc	(0x0e, sp)
      00A36E 7B 0E            [ 1]  637 	ld	a, (0x0e, sp)
      00A370 6B 01            [ 1]  638 	ld	(0x01, sp), a
      00A372 CC A2 F4         [ 2]  639 	jp	00130$
      00A375                        640 00123$:
                                    641 ;	./../../mib/stm8s_mib_debug_cmd.c: 275: switch (type)
      00A375 1E 06            [ 2]  642 	ldw	x, (0x06, sp)
      00A377 A3 00 08         [ 2]  643 	cpw	x, #0x0008
      00A37A 27 10            [ 1]  644 	jreq	00124$
      00A37C 1E 06            [ 2]  645 	ldw	x, (0x06, sp)
      00A37E A3 00 10         [ 2]  646 	cpw	x, #0x0010
      00A381 27 10            [ 1]  647 	jreq	00125$
      00A383 1E 06            [ 2]  648 	ldw	x, (0x06, sp)
      00A385 A3 00 20         [ 2]  649 	cpw	x, #0x0020
      00A388 27 10            [ 1]  650 	jreq	00126$
      00A38A 20 19            [ 2]  651 	jra	00127$
                                    652 ;	./../../mib/stm8s_mib_debug_cmd.c: 277: case 8:
      00A38C                        653 00124$:
                                    654 ;	./../../mib/stm8s_mib_debug_cmd.c: 278: *(uint8_t *)retval = (uint8_t)rval;
      00A38C 1E 11            [ 2]  655 	ldw	x, (0x11, sp)
      00A38E 7B 05            [ 1]  656 	ld	a, (0x05, sp)
      00A390 F7               [ 1]  657 	ld	(x), a
                                    658 ;	./../../mib/stm8s_mib_debug_cmd.c: 279: break;
      00A391 20 14            [ 2]  659 	jra	00128$
                                    660 ;	./../../mib/stm8s_mib_debug_cmd.c: 280: case 16:
      00A393                        661 00125$:
                                    662 ;	./../../mib/stm8s_mib_debug_cmd.c: 281: *(uint16_t *)retval = (uint16_t)rval;
      00A393 1E 11            [ 2]  663 	ldw	x, (0x11, sp)
      00A395 16 04            [ 2]  664 	ldw	y, (0x04, sp)
      00A397 FF               [ 2]  665 	ldw	(x), y
                                    666 ;	./../../mib/stm8s_mib_debug_cmd.c: 282: break;
      00A398 20 0D            [ 2]  667 	jra	00128$
                                    668 ;	./../../mib/stm8s_mib_debug_cmd.c: 283: case 32:
      00A39A                        669 00126$:
                                    670 ;	./../../mib/stm8s_mib_debug_cmd.c: 284: *(uint32_t *)retval = (uint32_t)rval;
      00A39A 1E 11            [ 2]  671 	ldw	x, (0x11, sp)
      00A39C 16 04            [ 2]  672 	ldw	y, (0x04, sp)
      00A39E EF 02            [ 2]  673 	ldw	(0x2, x), y
      00A3A0 16 02            [ 2]  674 	ldw	y, (0x02, sp)
      00A3A2 FF               [ 2]  675 	ldw	(x), y
                                    676 ;	./../../mib/stm8s_mib_debug_cmd.c: 285: break;
      00A3A3 20 02            [ 2]  677 	jra	00128$
                                    678 ;	./../../mib/stm8s_mib_debug_cmd.c: 286: default:
      00A3A5                        679 00127$:
                                    680 ;	./../../mib/stm8s_mib_debug_cmd.c: 287: return FALSE;
      00A3A5 5F               [ 1]  681 	clrw	x
                                    682 ;	./../../mib/stm8s_mib_debug_cmd.c: 288: }
                                    683 ;	./../../mib/stm8s_mib_debug_cmd.c: 289: return TRUE;
      00A3A6 C5                     684 	.byte 0xc5
      00A3A7                        685 00128$:
      00A3A7 5F               [ 1]  686 	clrw	x
      00A3A8 5C               [ 1]  687 	incw	x
      00A3A9                        688 00132$:
                                    689 ;	./../../mib/stm8s_mib_debug_cmd.c: 290: } // HexToInt.
      00A3A9 16 0F            [ 2]  690 	ldw	y, (15, sp)
      00A3AB 5B 14            [ 2]  691 	addw	sp, #20
      00A3AD 90 FC            [ 2]  692 	jp	(y)
                                    693 ;	./../../mib/stm8s_mib_debug_cmd.c: 300: int DecToLong(char *s, void *retval, uint16_t type)
                                    694 ;	-----------------------------------------
                                    695 ;	 function DecToLong
                                    696 ;	-----------------------------------------
      00A3AF                        697 _DecToLong:
      00A3AF 52 0E            [ 2]  698 	sub	sp, #14
                                    699 ;	./../../mib/stm8s_mib_debug_cmd.c: 305: if (!s || !s[0] || !retval)
      00A3B1 5D               [ 2]  700 	tnzw	x
      00A3B2 27 07            [ 1]  701 	jreq	00101$
      00A3B4 F6               [ 1]  702 	ld	a, (x)
      00A3B5 27 04            [ 1]  703 	jreq	00101$
      00A3B7 16 11            [ 2]  704 	ldw	y, (0x11, sp)
      00A3B9 26 03            [ 1]  705 	jrne	00102$
      00A3BB                        706 00101$:
                                    707 ;	./../../mib/stm8s_mib_debug_cmd.c: 306: return FALSE;
      00A3BB 5F               [ 1]  708 	clrw	x
      00A3BC 20 73            [ 2]  709 	jra	00117$
      00A3BE                        710 00102$:
                                    711 ;	./../../mib/stm8s_mib_debug_cmd.c: 308: for (rval= 0; *s; s++)
      00A3BE 90 5F            [ 1]  712 	clrw	y
      00A3C0 17 09            [ 2]  713 	ldw	(0x09, sp), y
      00A3C2 1F 0D            [ 2]  714 	ldw	(0x0d, sp), x
      00A3C4                        715 00115$:
      00A3C4 1E 0D            [ 2]  716 	ldw	x, (0x0d, sp)
      00A3C6 F6               [ 1]  717 	ld	a, (x)
      00A3C7 27 3C            [ 1]  718 	jreq	00108$
                                    719 ;	./../../mib/stm8s_mib_debug_cmd.c: 310: if (*s < '0' || *s > '9')
      00A3C9 A1 30            [ 1]  720 	cp	a, #0x30
      00A3CB 25 04            [ 1]  721 	jrc	00105$
      00A3CD A1 39            [ 1]  722 	cp	a, #0x39
      00A3CF 23 03            [ 2]  723 	jrule	00106$
      00A3D1                        724 00105$:
                                    725 ;	./../../mib/stm8s_mib_debug_cmd.c: 311: return FALSE;
      00A3D1 5F               [ 1]  726 	clrw	x
      00A3D2 20 5D            [ 2]  727 	jra	00117$
      00A3D4                        728 00106$:
                                    729 ;	./../../mib/stm8s_mib_debug_cmd.c: 312: c = *s - '0';
      00A3D4 A0 30            [ 1]  730 	sub	a, #0x30
                                    731 ;	./../../mib/stm8s_mib_debug_cmd.c: 313: rval = rval * 10 + c;
      00A3D6 88               [ 1]  732 	push	a
      00A3D7 90 89            [ 2]  733 	pushw	y
      00A3D9 1E 0C            [ 2]  734 	ldw	x, (0x0c, sp)
      00A3DB 89               [ 2]  735 	pushw	x
      00A3DC 4B 0A            [ 1]  736 	push	#0x0a
      00A3DE 5F               [ 1]  737 	clrw	x
      00A3DF 89               [ 2]  738 	pushw	x
      00A3E0 4B 00            [ 1]  739 	push	#0x00
      00A3E2 CD B4 1D         [ 4]  740 	call	__mullong
      00A3E5 5B 08            [ 2]  741 	addw	sp, #8
      00A3E7 1F 04            [ 2]  742 	ldw	(0x04, sp), x
      00A3E9 84               [ 1]  743 	pop	a
      00A3EA 5F               [ 1]  744 	clrw	x
      00A3EB 1F 05            [ 2]  745 	ldw	(0x05, sp), x
      00A3ED 97               [ 1]  746 	ld	xl, a
      00A3EE 72 FB 03         [ 2]  747 	addw	x, (0x03, sp)
      00A3F1 90 9F            [ 1]  748 	ld	a, yl
      00A3F3 19 06            [ 1]  749 	adc	a, (0x06, sp)
      00A3F5 6B 0A            [ 1]  750 	ld	(0x0a, sp), a
      00A3F7 90 9E            [ 1]  751 	ld	a, yh
      00A3F9 19 05            [ 1]  752 	adc	a, (0x05, sp)
      00A3FB 6B 09            [ 1]  753 	ld	(0x09, sp), a
      00A3FD 51               [ 1]  754 	exgw	x, y
                                    755 ;	./../../mib/stm8s_mib_debug_cmd.c: 308: for (rval= 0; *s; s++)
      00A3FE 1E 0D            [ 2]  756 	ldw	x, (0x0d, sp)
      00A400 5C               [ 1]  757 	incw	x
      00A401 1F 0D            [ 2]  758 	ldw	(0x0d, sp), x
      00A403 20 BF            [ 2]  759 	jra	00115$
      00A405                        760 00108$:
                                    761 ;	./../../mib/stm8s_mib_debug_cmd.c: 316: switch (type)
      00A405 1E 13            [ 2]  762 	ldw	x, (0x13, sp)
      00A407 A3 00 08         [ 2]  763 	cpw	x, #0x0008
      00A40A 27 0C            [ 1]  764 	jreq	00109$
      00A40C A3 00 10         [ 2]  765 	cpw	x, #0x0010
      00A40F 27 0E            [ 1]  766 	jreq	00110$
      00A411 A3 00 20         [ 2]  767 	cpw	x, #0x0020
      00A414 27 0E            [ 1]  768 	jreq	00111$
      00A416 20 15            [ 2]  769 	jra	00112$
                                    770 ;	./../../mib/stm8s_mib_debug_cmd.c: 318: case 8:
      00A418                        771 00109$:
                                    772 ;	./../../mib/stm8s_mib_debug_cmd.c: 319: *(uint8_t *)retval = (uint8_t)rval;
      00A418 1E 11            [ 2]  773 	ldw	x, (0x11, sp)
      00A41A 90 9F            [ 1]  774 	ld	a, yl
      00A41C F7               [ 1]  775 	ld	(x), a
                                    776 ;	./../../mib/stm8s_mib_debug_cmd.c: 320: break;
      00A41D 20 10            [ 2]  777 	jra	00113$
                                    778 ;	./../../mib/stm8s_mib_debug_cmd.c: 321: case 16:
      00A41F                        779 00110$:
                                    780 ;	./../../mib/stm8s_mib_debug_cmd.c: 322: *(uint16_t *)retval = (uint16_t)rval;
      00A41F 1E 11            [ 2]  781 	ldw	x, (0x11, sp)
      00A421 FF               [ 2]  782 	ldw	(x), y
                                    783 ;	./../../mib/stm8s_mib_debug_cmd.c: 323: break;
      00A422 20 0B            [ 2]  784 	jra	00113$
                                    785 ;	./../../mib/stm8s_mib_debug_cmd.c: 324: case 32:
      00A424                        786 00111$:
                                    787 ;	./../../mib/stm8s_mib_debug_cmd.c: 325: *(uint32_t *)retval = (uint32_t)rval;
      00A424 1E 11            [ 2]  788 	ldw	x, (0x11, sp)
      00A426 EF 02            [ 2]  789 	ldw	(0x2, x), y
      00A428 16 09            [ 2]  790 	ldw	y, (0x09, sp)
      00A42A FF               [ 2]  791 	ldw	(x), y
                                    792 ;	./../../mib/stm8s_mib_debug_cmd.c: 326: break;
      00A42B 20 02            [ 2]  793 	jra	00113$
                                    794 ;	./../../mib/stm8s_mib_debug_cmd.c: 327: default:
      00A42D                        795 00112$:
                                    796 ;	./../../mib/stm8s_mib_debug_cmd.c: 328: return FALSE;
      00A42D 5F               [ 1]  797 	clrw	x
                                    798 ;	./../../mib/stm8s_mib_debug_cmd.c: 329: }
                                    799 ;	./../../mib/stm8s_mib_debug_cmd.c: 330: return TRUE;
      00A42E C5                     800 	.byte 0xc5
      00A42F                        801 00113$:
      00A42F 5F               [ 1]  802 	clrw	x
      00A430 5C               [ 1]  803 	incw	x
      00A431                        804 00117$:
                                    805 ;	./../../mib/stm8s_mib_debug_cmd.c: 331: } // DecToLong.
      00A431 16 0F            [ 2]  806 	ldw	y, (15, sp)
      00A433 5B 14            [ 2]  807 	addw	sp, #20
      00A435 90 FC            [ 2]  808 	jp	(y)
                                    809 ;	./../../mib/stm8s_mib_debug_cmd.c: 340: void HexDump(uint32_t addr, uint32_t len)
                                    810 ;	-----------------------------------------
                                    811 ;	 function HexDump
                                    812 ;	-----------------------------------------
      00A437                        813 _HexDump:
      00A437 52 27            [ 2]  814 	sub	sp, #39
                                    815 ;	./../../mib/stm8s_mib_debug_cmd.c: 343: uint32_t endPtr = (addr + len);
      00A439 16 2C            [ 2]  816 	ldw	y, (0x2c, sp)
      00A43B 72 F9 30         [ 2]  817 	addw	y, (0x30, sp)
      00A43E 1E 2A            [ 2]  818 	ldw	x, (0x2a, sp)
      00A440 24 01            [ 1]  819 	jrnc	00240$
      00A442 5C               [ 1]  820 	incw	x
      00A443                        821 00240$:
      00A443 72 FB 2E         [ 2]  822 	addw	x, (0x2e, sp)
      00A446 17 17            [ 2]  823 	ldw	(0x17, sp), y
      00A448 1F 15            [ 2]  824 	ldw	(0x15, sp), x
                                    825 ;	./../../mib/stm8s_mib_debug_cmd.c: 344: int i, remainder = len & 0xf;
      00A44A 1E 30            [ 2]  826 	ldw	x, (0x30, sp)
      00A44C 9F               [ 1]  827 	ld	a, xl
      00A44D A4 0F            [ 1]  828 	and	a, #0x0f
      00A44F 6B 1A            [ 1]  829 	ld	(0x1a, sp), a
      00A451 0F 19            [ 1]  830 	clr	(0x19, sp)
                                    831 ;	./../../mib/stm8s_mib_debug_cmd.c: 350: mib_printf("\r\n");
      00A453 4B A3            [ 1]  832 	push	#<(___str_0+0)
      00A455 4B 85            [ 1]  833 	push	#((___str_0+0) >> 8)
      00A457 CD 9F BD         [ 4]  834 	call	_mib_printf
      00A45A 5B 02            [ 2]  835 	addw	sp, #2
                                    836 ;	./../../mib/stm8s_mib_debug_cmd.c: 351: mib_printf("address     Hex Value                                        Ascii value\r\n");
      00A45C 4B AD            [ 1]  837 	push	#<(___str_3+0)
      00A45E 4B 85            [ 1]  838 	push	#((___str_3+0) >> 8)
      00A460 CD 9F BD         [ 4]  839 	call	_mib_printf
      00A463 5B 02            [ 2]  840 	addw	sp, #2
                                    841 ;	./../../mib/stm8s_mib_debug_cmd.c: 354: p_address = (uint32_t)(addr);
      00A465 1E 2C            [ 2]  842 	ldw	x, (0x2c, sp)
      00A467 16 2A            [ 2]  843 	ldw	y, (0x2a, sp)
                                    844 ;	./../../mib/stm8s_mib_debug_cmd.c: 355: p_data_ptr = (uint16_t *)p_data;
                                    845 ;	./../../mib/stm8s_mib_debug_cmd.c: 356: while ((p_address + 16) <= endPtr)
      00A469 1F 1D            [ 2]  846 	ldw	(0x1d, sp), x
      00A46B 17 1B            [ 2]  847 	ldw	(0x1b, sp), y
      00A46D                        848 00107$:
      00A46D 1E 1D            [ 2]  849 	ldw	x, (0x1d, sp)
      00A46F 1C 00 10         [ 2]  850 	addw	x, #0x0010
      00A472 1F 21            [ 2]  851 	ldw	(0x21, sp), x
      00A474 7B 1C            [ 1]  852 	ld	a, (0x1c, sp)
      00A476 A9 00            [ 1]  853 	adc	a, #0x00
      00A478 6B 20            [ 1]  854 	ld	(0x20, sp), a
      00A47A 7B 1B            [ 1]  855 	ld	a, (0x1b, sp)
      00A47C A9 00            [ 1]  856 	adc	a, #0x00
      00A47E 6B 1F            [ 1]  857 	ld	(0x1f, sp), a
      00A480 1E 17            [ 2]  858 	ldw	x, (0x17, sp)
      00A482 13 21            [ 2]  859 	cpw	x, (0x21, sp)
      00A484 7B 16            [ 1]  860 	ld	a, (0x16, sp)
      00A486 12 20            [ 1]  861 	sbc	a, (0x20, sp)
      00A488 7B 15            [ 1]  862 	ld	a, (0x15, sp)
      00A48A 12 1F            [ 1]  863 	sbc	a, (0x1f, sp)
      00A48C 24 03            [ 1]  864 	jrnc	00241$
      00A48E CC A5 51         [ 2]  865 	jp	00163$
      00A491                        866 00241$:
                                    867 ;	./../../mib/stm8s_mib_debug_cmd.c: 358: mib_printf("0x%08lx : ", p_address);
      00A491 1E 1D            [ 2]  868 	ldw	x, (0x1d, sp)
      00A493 89               [ 2]  869 	pushw	x
      00A494 1E 1D            [ 2]  870 	ldw	x, (0x1d, sp)
      00A496 89               [ 2]  871 	pushw	x
      00A497 4B F8            [ 1]  872 	push	#<(___str_4+0)
      00A499 4B 85            [ 1]  873 	push	#((___str_4+0) >> 8)
      00A49B CD 9F BD         [ 4]  874 	call	_mib_printf
      00A49E 5B 06            [ 2]  875 	addw	sp, #6
                                    876 ;	./../../mib/stm8s_mib_debug_cmd.c: 359: for (i = 0; i < 8; i++)
      00A4A0 5F               [ 1]  877 	clrw	x
      00A4A1 1F 26            [ 2]  878 	ldw	(0x26, sp), x
      00A4A3                        879 00120$:
                                    880 ;	./../../mib/stm8s_mib_debug_cmd.c: 361: p_data_ptr[i] = rd_ADDR16(p_address + i * 2);
      00A4A3 16 26            [ 2]  881 	ldw	y, (0x26, sp)
      00A4A5 90 58            [ 2]  882 	sllw	y
      00A4A7 93               [ 1]  883 	ldw	x, y
      00A4A8 89               [ 2]  884 	pushw	x
      00A4A9 96               [ 1]  885 	ldw	x, sp
      00A4AA 1C 00 03         [ 2]  886 	addw	x, #3
      00A4AD 72 FB 01         [ 2]  887 	addw	x, (1, sp)
      00A4B0 5B 02            [ 2]  888 	addw	sp, #2
      00A4B2 17 24            [ 2]  889 	ldw	(0x24, sp), y
      00A4B4 16 1D            [ 2]  890 	ldw	y, (0x1d, sp)
      00A4B6 72 F9 24         [ 2]  891 	addw	y, (0x24, sp)
      00A4B9 90 FE            [ 2]  892 	ldw	y, (y)
      00A4BB FF               [ 2]  893 	ldw	(x), y
                                    894 ;	./../../mib/stm8s_mib_debug_cmd.c: 362: mib_printf("%02x ", p_data[i * 2]);
      00A4BC 7B 27            [ 1]  895 	ld	a, (0x27, sp)
      00A4BE 48               [ 1]  896 	sll	a
      00A4BF 6B 23            [ 1]  897 	ld	(0x23, sp), a
      00A4C1 6B 25            [ 1]  898 	ld	(0x25, sp), a
      00A4C3 49               [ 1]  899 	rlc	a
      00A4C4 4F               [ 1]  900 	clr	a
      00A4C5 A2 00            [ 1]  901 	sbc	a, #0x00
      00A4C7 6B 24            [ 1]  902 	ld	(0x24, sp), a
      00A4C9 96               [ 1]  903 	ldw	x, sp
      00A4CA 5C               [ 1]  904 	incw	x
      00A4CB 72 FB 24         [ 2]  905 	addw	x, (0x24, sp)
      00A4CE F6               [ 1]  906 	ld	a, (x)
      00A4CF 5F               [ 1]  907 	clrw	x
      00A4D0 97               [ 1]  908 	ld	xl, a
      00A4D1 89               [ 2]  909 	pushw	x
      00A4D2 4B 03            [ 1]  910 	push	#<(___str_5+0)
      00A4D4 4B 86            [ 1]  911 	push	#((___str_5+0) >> 8)
      00A4D6 CD 9F BD         [ 4]  912 	call	_mib_printf
      00A4D9 5B 04            [ 2]  913 	addw	sp, #4
                                    914 ;	./../../mib/stm8s_mib_debug_cmd.c: 363: mib_printf("%02x ", p_data[i * 2 + 1]);
      00A4DB 7B 23            [ 1]  915 	ld	a, (0x23, sp)
      00A4DD 4C               [ 1]  916 	inc	a
      00A4DE 6B 25            [ 1]  917 	ld	(0x25, sp), a
      00A4E0 49               [ 1]  918 	rlc	a
      00A4E1 4F               [ 1]  919 	clr	a
      00A4E2 A2 00            [ 1]  920 	sbc	a, #0x00
      00A4E4 6B 24            [ 1]  921 	ld	(0x24, sp), a
      00A4E6 96               [ 1]  922 	ldw	x, sp
      00A4E7 5C               [ 1]  923 	incw	x
      00A4E8 72 FB 24         [ 2]  924 	addw	x, (0x24, sp)
      00A4EB F6               [ 1]  925 	ld	a, (x)
      00A4EC 5F               [ 1]  926 	clrw	x
      00A4ED 97               [ 1]  927 	ld	xl, a
      00A4EE 89               [ 2]  928 	pushw	x
      00A4EF 4B 03            [ 1]  929 	push	#<(___str_5+0)
      00A4F1 4B 86            [ 1]  930 	push	#((___str_5+0) >> 8)
      00A4F3 CD 9F BD         [ 4]  931 	call	_mib_printf
      00A4F6 5B 04            [ 2]  932 	addw	sp, #4
                                    933 ;	./../../mib/stm8s_mib_debug_cmd.c: 359: for (i = 0; i < 8; i++)
      00A4F8 1E 26            [ 2]  934 	ldw	x, (0x26, sp)
      00A4FA 5C               [ 1]  935 	incw	x
      00A4FB 1F 26            [ 2]  936 	ldw	(0x26, sp), x
      00A4FD A3 00 08         [ 2]  937 	cpw	x, #0x0008
      00A500 2F A1            [ 1]  938 	jrslt	00120$
                                    939 ;	./../../mib/stm8s_mib_debug_cmd.c: 365: mib_printf(" ");
      00A502 4B 09            [ 1]  940 	push	#<(___str_6+0)
      00A504 4B 86            [ 1]  941 	push	#((___str_6+0) >> 8)
      00A506 CD 9F BD         [ 4]  942 	call	_mib_printf
      00A509 5B 02            [ 2]  943 	addw	sp, #2
                                    944 ;	./../../mib/stm8s_mib_debug_cmd.c: 366: for (i = 0; i < 16; i++)
      00A50B 5F               [ 1]  945 	clrw	x
      00A50C 1F 26            [ 2]  946 	ldw	(0x26, sp), x
      00A50E                        947 00122$:
                                    948 ;	./../../mib/stm8s_mib_debug_cmd.c: 368: c = p_data[i];
      00A50E 96               [ 1]  949 	ldw	x, sp
      00A50F 5C               [ 1]  950 	incw	x
      00A510 72 FB 26         [ 2]  951 	addw	x, (0x26, sp)
      00A513 F6               [ 1]  952 	ld	a, (x)
                                    953 ;	./../../mib/stm8s_mib_debug_cmd.c: 369: if (c >= 32 && c <= 125)
      00A514 A1 20            [ 1]  954 	cp	a, #0x20
      00A516 25 12            [ 1]  955 	jrc	00103$
      00A518 A1 7D            [ 1]  956 	cp	a, #0x7d
      00A51A 22 0E            [ 1]  957 	jrugt	00103$
                                    958 ;	./../../mib/stm8s_mib_debug_cmd.c: 370: mib_printf("%c", c);
      00A51C 5F               [ 1]  959 	clrw	x
      00A51D 97               [ 1]  960 	ld	xl, a
      00A51E 89               [ 2]  961 	pushw	x
      00A51F 4B 0B            [ 1]  962 	push	#<(___str_7+0)
      00A521 4B 86            [ 1]  963 	push	#((___str_7+0) >> 8)
      00A523 CD 9F BD         [ 4]  964 	call	_mib_printf
      00A526 5B 04            [ 2]  965 	addw	sp, #4
      00A528 20 09            [ 2]  966 	jra	00123$
      00A52A                        967 00103$:
                                    968 ;	./../../mib/stm8s_mib_debug_cmd.c: 372: mib_printf(".");
      00A52A 4B 0E            [ 1]  969 	push	#<(___str_8+0)
      00A52C 4B 86            [ 1]  970 	push	#((___str_8+0) >> 8)
      00A52E CD 9F BD         [ 4]  971 	call	_mib_printf
      00A531 5B 02            [ 2]  972 	addw	sp, #2
      00A533                        973 00123$:
                                    974 ;	./../../mib/stm8s_mib_debug_cmd.c: 366: for (i = 0; i < 16; i++)
      00A533 1E 26            [ 2]  975 	ldw	x, (0x26, sp)
      00A535 5C               [ 1]  976 	incw	x
      00A536 1F 26            [ 2]  977 	ldw	(0x26, sp), x
      00A538 A3 00 10         [ 2]  978 	cpw	x, #0x0010
      00A53B 2F D1            [ 1]  979 	jrslt	00122$
                                    980 ;	./../../mib/stm8s_mib_debug_cmd.c: 374: p_address += 16;
      00A53D 16 21            [ 2]  981 	ldw	y, (0x21, sp)
      00A53F 17 1D            [ 2]  982 	ldw	(0x1d, sp), y
      00A541 16 1F            [ 2]  983 	ldw	y, (0x1f, sp)
      00A543 17 1B            [ 2]  984 	ldw	(0x1b, sp), y
                                    985 ;	./../../mib/stm8s_mib_debug_cmd.c: 376: mib_printf("\r\n");
      00A545 4B A3            [ 1]  986 	push	#<(___str_0+0)
      00A547 4B 85            [ 1]  987 	push	#((___str_0+0) >> 8)
      00A549 CD 9F BD         [ 4]  988 	call	_mib_printf
      00A54C 5B 02            [ 2]  989 	addw	sp, #2
      00A54E CC A4 6D         [ 2]  990 	jp	00107$
      00A551                        991 00163$:
      00A551 16 1D            [ 2]  992 	ldw	y, (0x1d, sp)
      00A553 17 24            [ 2]  993 	ldw	(0x24, sp), y
      00A555 16 1B            [ 2]  994 	ldw	y, (0x1b, sp)
      00A557 17 22            [ 2]  995 	ldw	(0x22, sp), y
                                    996 ;	./../../mib/stm8s_mib_debug_cmd.c: 380: if (remainder)
      00A559 1E 19            [ 2]  997 	ldw	x, (0x19, sp)
      00A55B 26 03            [ 1]  998 	jrne	00248$
      00A55D CC A6 6D         [ 2]  999 	jp	00119$
      00A560                       1000 00248$:
                                   1001 ;	./../../mib/stm8s_mib_debug_cmd.c: 382: mib_printf("0x%08lx  ", p_address);
      00A560 1E 1D            [ 2] 1002 	ldw	x, (0x1d, sp)
      00A562 89               [ 2] 1003 	pushw	x
      00A563 1E 1D            [ 2] 1004 	ldw	x, (0x1d, sp)
      00A565 89               [ 2] 1005 	pushw	x
      00A566 4B 10            [ 1] 1006 	push	#<(___str_9+0)
      00A568 4B 86            [ 1] 1007 	push	#((___str_9+0) >> 8)
      00A56A CD 9F BD         [ 4] 1008 	call	_mib_printf
      00A56D 5B 06            [ 2] 1009 	addw	sp, #6
                                   1010 ;	./../../mib/stm8s_mib_debug_cmd.c: 383: for (i = 0; i < (remainder >> 1); i++)
      00A56F 1E 19            [ 2] 1011 	ldw	x, (0x19, sp)
      00A571 57               [ 2] 1012 	sraw	x
      00A572 1F 1D            [ 2] 1013 	ldw	(0x1d, sp), x
      00A574 5F               [ 1] 1014 	clrw	x
      00A575 1F 26            [ 2] 1015 	ldw	(0x26, sp), x
      00A577                       1016 00125$:
      00A577 1E 26            [ 2] 1017 	ldw	x, (0x26, sp)
      00A579 13 1D            [ 2] 1018 	cpw	x, (0x1d, sp)
      00A57B 2E 5C            [ 1] 1019 	jrsge	00110$
                                   1020 ;	./../../mib/stm8s_mib_debug_cmd.c: 385: p_data_ptr[i] = rd_ADDR16(p_address + i * 2);
      00A57D 16 26            [ 2] 1021 	ldw	y, (0x26, sp)
      00A57F 90 58            [ 2] 1022 	sllw	y
      00A581 93               [ 1] 1023 	ldw	x, y
      00A582 89               [ 2] 1024 	pushw	x
      00A583 96               [ 1] 1025 	ldw	x, sp
      00A584 1C 00 03         [ 2] 1026 	addw	x, #3
      00A587 72 FB 01         [ 2] 1027 	addw	x, (1, sp)
      00A58A 5B 02            [ 2] 1028 	addw	sp, #2
      00A58C 17 20            [ 2] 1029 	ldw	(0x20, sp), y
      00A58E 16 24            [ 2] 1030 	ldw	y, (0x24, sp)
      00A590 72 F9 20         [ 2] 1031 	addw	y, (0x20, sp)
      00A593 90 FE            [ 2] 1032 	ldw	y, (y)
      00A595 FF               [ 2] 1033 	ldw	(x), y
                                   1034 ;	./../../mib/stm8s_mib_debug_cmd.c: 386: mib_printf("%02x ", p_data[i * 2]);
      00A596 7B 27            [ 1] 1035 	ld	a, (0x27, sp)
      00A598 48               [ 1] 1036 	sll	a
      00A599 6B 1F            [ 1] 1037 	ld	(0x1f, sp), a
      00A59B 6B 21            [ 1] 1038 	ld	(0x21, sp), a
      00A59D 49               [ 1] 1039 	rlc	a
      00A59E 4F               [ 1] 1040 	clr	a
      00A59F A2 00            [ 1] 1041 	sbc	a, #0x00
      00A5A1 6B 20            [ 1] 1042 	ld	(0x20, sp), a
      00A5A3 96               [ 1] 1043 	ldw	x, sp
      00A5A4 5C               [ 1] 1044 	incw	x
      00A5A5 72 FB 20         [ 2] 1045 	addw	x, (0x20, sp)
      00A5A8 F6               [ 1] 1046 	ld	a, (x)
      00A5A9 5F               [ 1] 1047 	clrw	x
      00A5AA 97               [ 1] 1048 	ld	xl, a
      00A5AB 89               [ 2] 1049 	pushw	x
      00A5AC 4B 03            [ 1] 1050 	push	#<(___str_5+0)
      00A5AE 4B 86            [ 1] 1051 	push	#((___str_5+0) >> 8)
      00A5B0 CD 9F BD         [ 4] 1052 	call	_mib_printf
      00A5B3 5B 04            [ 2] 1053 	addw	sp, #4
                                   1054 ;	./../../mib/stm8s_mib_debug_cmd.c: 387: mib_printf("%02x ", p_data[i * 2 + 1]);
      00A5B5 7B 1F            [ 1] 1055 	ld	a, (0x1f, sp)
      00A5B7 4C               [ 1] 1056 	inc	a
      00A5B8 6B 21            [ 1] 1057 	ld	(0x21, sp), a
      00A5BA 49               [ 1] 1058 	rlc	a
      00A5BB 4F               [ 1] 1059 	clr	a
      00A5BC A2 00            [ 1] 1060 	sbc	a, #0x00
      00A5BE 6B 20            [ 1] 1061 	ld	(0x20, sp), a
      00A5C0 96               [ 1] 1062 	ldw	x, sp
      00A5C1 5C               [ 1] 1063 	incw	x
      00A5C2 72 FB 20         [ 2] 1064 	addw	x, (0x20, sp)
      00A5C5 F6               [ 1] 1065 	ld	a, (x)
      00A5C6 5F               [ 1] 1066 	clrw	x
      00A5C7 97               [ 1] 1067 	ld	xl, a
      00A5C8 89               [ 2] 1068 	pushw	x
      00A5C9 4B 03            [ 1] 1069 	push	#<(___str_5+0)
      00A5CB 4B 86            [ 1] 1070 	push	#((___str_5+0) >> 8)
      00A5CD CD 9F BD         [ 4] 1071 	call	_mib_printf
      00A5D0 5B 04            [ 2] 1072 	addw	sp, #4
                                   1073 ;	./../../mib/stm8s_mib_debug_cmd.c: 383: for (i = 0; i < (remainder >> 1); i++)
      00A5D2 1E 26            [ 2] 1074 	ldw	x, (0x26, sp)
      00A5D4 5C               [ 1] 1075 	incw	x
      00A5D5 1F 26            [ 2] 1076 	ldw	(0x26, sp), x
      00A5D7 20 9E            [ 2] 1077 	jra	00125$
      00A5D9                       1078 00110$:
                                   1079 ;	./../../mib/stm8s_mib_debug_cmd.c: 389: for (i = 0; i < (16 - (remainder >> 1) * 2); i++)
      00A5D9 1E 1D            [ 2] 1080 	ldw	x, (0x1d, sp)
      00A5DB 58               [ 2] 1081 	sllw	x
      00A5DC 1F 26            [ 2] 1082 	ldw	(0x26, sp), x
      00A5DE A6 10            [ 1] 1083 	ld	a, #0x10
      00A5E0 10 27            [ 1] 1084 	sub	a, (0x27, sp)
      00A5E2 6B 25            [ 1] 1085 	ld	(0x25, sp), a
      00A5E4 4F               [ 1] 1086 	clr	a
      00A5E5 12 26            [ 1] 1087 	sbc	a, (0x26, sp)
      00A5E7 6B 24            [ 1] 1088 	ld	(0x24, sp), a
      00A5E9 5F               [ 1] 1089 	clrw	x
      00A5EA 1F 26            [ 2] 1090 	ldw	(0x26, sp), x
      00A5EC                       1091 00128$:
      00A5EC 1E 26            [ 2] 1092 	ldw	x, (0x26, sp)
      00A5EE 13 24            [ 2] 1093 	cpw	x, (0x24, sp)
      00A5F0 2E 10            [ 1] 1094 	jrsge	00111$
                                   1095 ;	./../../mib/stm8s_mib_debug_cmd.c: 391: mib_printf("   ");
      00A5F2 4B 1A            [ 1] 1096 	push	#<(___str_10+0)
      00A5F4 4B 86            [ 1] 1097 	push	#((___str_10+0) >> 8)
      00A5F6 CD 9F BD         [ 4] 1098 	call	_mib_printf
      00A5F9 5B 02            [ 2] 1099 	addw	sp, #2
                                   1100 ;	./../../mib/stm8s_mib_debug_cmd.c: 389: for (i = 0; i < (16 - (remainder >> 1) * 2); i++)
      00A5FB 1E 26            [ 2] 1101 	ldw	x, (0x26, sp)
      00A5FD 5C               [ 1] 1102 	incw	x
      00A5FE 1F 26            [ 2] 1103 	ldw	(0x26, sp), x
      00A600 20 EA            [ 2] 1104 	jra	00128$
      00A602                       1105 00111$:
                                   1106 ;	./../../mib/stm8s_mib_debug_cmd.c: 393: mib_printf(" ");
      00A602 4B 09            [ 1] 1107 	push	#<(___str_6+0)
      00A604 4B 86            [ 1] 1108 	push	#((___str_6+0) >> 8)
      00A606 CD 9F BD         [ 4] 1109 	call	_mib_printf
      00A609 5B 02            [ 2] 1110 	addw	sp, #2
                                   1111 ;	./../../mib/stm8s_mib_debug_cmd.c: 394: for (i = 0; i < remainder; i++)
      00A60B 5F               [ 1] 1112 	clrw	x
      00A60C 1F 26            [ 2] 1113 	ldw	(0x26, sp), x
      00A60E                       1114 00131$:
      00A60E 1E 26            [ 2] 1115 	ldw	x, (0x26, sp)
      00A610 13 19            [ 2] 1116 	cpw	x, (0x19, sp)
      00A612 2E 2C            [ 1] 1117 	jrsge	00116$
                                   1118 ;	./../../mib/stm8s_mib_debug_cmd.c: 396: c = p_data[i];
      00A614 96               [ 1] 1119 	ldw	x, sp
      00A615 5C               [ 1] 1120 	incw	x
      00A616 72 FB 26         [ 2] 1121 	addw	x, (0x26, sp)
      00A619 F6               [ 1] 1122 	ld	a, (x)
                                   1123 ;	./../../mib/stm8s_mib_debug_cmd.c: 397: if (c >= 32 && c <= 125)
      00A61A A1 20            [ 1] 1124 	cp	a, #0x20
      00A61C 25 12            [ 1] 1125 	jrc	00113$
      00A61E A1 7D            [ 1] 1126 	cp	a, #0x7d
      00A620 22 0E            [ 1] 1127 	jrugt	00113$
                                   1128 ;	./../../mib/stm8s_mib_debug_cmd.c: 398: mib_printf("%c", c);
      00A622 5F               [ 1] 1129 	clrw	x
      00A623 97               [ 1] 1130 	ld	xl, a
      00A624 89               [ 2] 1131 	pushw	x
      00A625 4B 0B            [ 1] 1132 	push	#<(___str_7+0)
      00A627 4B 86            [ 1] 1133 	push	#((___str_7+0) >> 8)
      00A629 CD 9F BD         [ 4] 1134 	call	_mib_printf
      00A62C 5B 04            [ 2] 1135 	addw	sp, #4
      00A62E 20 09            [ 2] 1136 	jra	00132$
      00A630                       1137 00113$:
                                   1138 ;	./../../mib/stm8s_mib_debug_cmd.c: 400: mib_printf(".");
      00A630 4B 0E            [ 1] 1139 	push	#<(___str_8+0)
      00A632 4B 86            [ 1] 1140 	push	#((___str_8+0) >> 8)
      00A634 CD 9F BD         [ 4] 1141 	call	_mib_printf
      00A637 5B 02            [ 2] 1142 	addw	sp, #2
      00A639                       1143 00132$:
                                   1144 ;	./../../mib/stm8s_mib_debug_cmd.c: 394: for (i = 0; i < remainder; i++)
      00A639 1E 26            [ 2] 1145 	ldw	x, (0x26, sp)
      00A63B 5C               [ 1] 1146 	incw	x
      00A63C 1F 26            [ 2] 1147 	ldw	(0x26, sp), x
      00A63E 20 CE            [ 2] 1148 	jra	00131$
      00A640                       1149 00116$:
                                   1150 ;	./../../mib/stm8s_mib_debug_cmd.c: 402: for (i = 0; i < (16 - remainder); i++)
      00A640 A6 10            [ 1] 1151 	ld	a, #0x10
      00A642 10 1A            [ 1] 1152 	sub	a, (0x1a, sp)
      00A644 6B 25            [ 1] 1153 	ld	(0x25, sp), a
      00A646 4F               [ 1] 1154 	clr	a
      00A647 12 19            [ 1] 1155 	sbc	a, (0x19, sp)
      00A649 6B 24            [ 1] 1156 	ld	(0x24, sp), a
      00A64B 5F               [ 1] 1157 	clrw	x
      00A64C 1F 26            [ 2] 1158 	ldw	(0x26, sp), x
      00A64E                       1159 00134$:
      00A64E 1E 26            [ 2] 1160 	ldw	x, (0x26, sp)
      00A650 13 24            [ 2] 1161 	cpw	x, (0x24, sp)
      00A652 2E 10            [ 1] 1162 	jrsge	00117$
                                   1163 ;	./../../mib/stm8s_mib_debug_cmd.c: 404: mib_printf(" ");
      00A654 4B 09            [ 1] 1164 	push	#<(___str_6+0)
      00A656 4B 86            [ 1] 1165 	push	#((___str_6+0) >> 8)
      00A658 CD 9F BD         [ 4] 1166 	call	_mib_printf
      00A65B 5B 02            [ 2] 1167 	addw	sp, #2
                                   1168 ;	./../../mib/stm8s_mib_debug_cmd.c: 402: for (i = 0; i < (16 - remainder); i++)
      00A65D 1E 26            [ 2] 1169 	ldw	x, (0x26, sp)
      00A65F 5C               [ 1] 1170 	incw	x
      00A660 1F 26            [ 2] 1171 	ldw	(0x26, sp), x
      00A662 20 EA            [ 2] 1172 	jra	00134$
      00A664                       1173 00117$:
                                   1174 ;	./../../mib/stm8s_mib_debug_cmd.c: 407: mib_printf("\r\n");
      00A664 4B A3            [ 1] 1175 	push	#<(___str_0+0)
      00A666 4B 85            [ 1] 1176 	push	#((___str_0+0) >> 8)
      00A668 CD 9F BD         [ 4] 1177 	call	_mib_printf
      00A66B 5B 02            [ 2] 1178 	addw	sp, #2
      00A66D                       1179 00119$:
                                   1180 ;	./../../mib/stm8s_mib_debug_cmd.c: 409: return;
                                   1181 ;	./../../mib/stm8s_mib_debug_cmd.c: 410: } // HexDump.
      00A66D 1E 28            [ 2] 1182 	ldw	x, (40, sp)
      00A66F 5B 31            [ 2] 1183 	addw	sp, #49
      00A671 FC               [ 2] 1184 	jp	(x)
                                   1185 ;	./../../mib/stm8s_mib_debug_cmd.c: 419: int DoPrintHelp(int argc, char **argv)
                                   1186 ;	-----------------------------------------
                                   1187 ;	 function DoPrintHelp
                                   1188 ;	-----------------------------------------
      00A672                       1189 _DoPrintHelp:
      00A672 52 02            [ 2] 1190 	sub	sp, #2
                                   1191 ;	./../../mib/stm8s_mib_debug_cmd.c: 423: if (argc == 1)
      00A674 5A               [ 2] 1192 	decw	x
      00A675 26 39            [ 1] 1193 	jrne	00105$
                                   1194 ;	./../../mib/stm8s_mib_debug_cmd.c: 425: mib_printf("*******\r\n");
      00A677 4B 1E            [ 1] 1195 	push	#<(___str_11+0)
      00A679 4B 86            [ 1] 1196 	push	#((___str_11+0) >> 8)
      00A67B CD 9F BD         [ 4] 1197 	call	_mib_printf
      00A67E 5B 02            [ 2] 1198 	addw	sp, #2
                                   1199 ;	./../../mib/stm8s_mib_debug_cmd.c: 426: mib_printf("  help  Help for commands.\r\n");
      00A680 4B 28            [ 1] 1200 	push	#<(___str_12+0)
      00A682 4B 86            [ 1] 1201 	push	#((___str_12+0) >> 8)
      00A684 CD 9F BD         [ 4] 1202 	call	_mib_printf
      00A687 5B 02            [ 2] 1203 	addw	sp, #2
                                   1204 ;	./../../mib/stm8s_mib_debug_cmd.c: 428: for (cptr = cmdTbl; cptr->cmd; cptr++)
      00A689 AE 01 5E         [ 2] 1205 	ldw	x, #(_cmdTbl+0)
      00A68C 1F 01            [ 2] 1206 	ldw	(0x01, sp), x
      00A68E                       1207 00108$:
      00A68E 1E 01            [ 2] 1208 	ldw	x, (0x01, sp)
      00A690 FE               [ 2] 1209 	ldw	x, (x)
      00A691 27 12            [ 1] 1210 	jreq	00103$
                                   1211 ;	./../../mib/stm8s_mib_debug_cmd.c: 430: if (cptr->usage)
      00A693 1E 01            [ 2] 1212 	ldw	x, (0x01, sp)
      00A695 EE 04            [ 2] 1213 	ldw	x, (0x4, x)
      00A697 27 03            [ 1] 1214 	jreq	00109$
                                   1215 ;	./../../mib/stm8s_mib_debug_cmd.c: 431: MibWriteDebugString(cptr->usage);
      00A699 CD 95 AB         [ 4] 1216 	call	_MibWriteDebugString
      00A69C                       1217 00109$:
                                   1218 ;	./../../mib/stm8s_mib_debug_cmd.c: 428: for (cptr = cmdTbl; cptr->cmd; cptr++)
      00A69C 1E 01            [ 2] 1219 	ldw	x, (0x01, sp)
      00A69E 1C 00 06         [ 2] 1220 	addw	x, #0x0006
      00A6A1 1F 01            [ 2] 1221 	ldw	(0x01, sp), x
      00A6A3 20 E9            [ 2] 1222 	jra	00108$
      00A6A5                       1223 00103$:
                                   1224 ;	./../../mib/stm8s_mib_debug_cmd.c: 433: mib_printf("*******\r\n");
      00A6A5 4B 1E            [ 1] 1225 	push	#<(___str_11+0)
      00A6A7 4B 86            [ 1] 1226 	push	#((___str_11+0) >> 8)
      00A6A9 CD 9F BD         [ 4] 1227 	call	_mib_printf
      00A6AC 5B 02            [ 2] 1228 	addw	sp, #2
      00A6AE 20 1F            [ 2] 1229 	jra	00106$
      00A6B0                       1230 00105$:
                                   1231 ;	./../../mib/stm8s_mib_debug_cmd.c: 437: mib_printf("\tUnknown command : ");
      00A6B0 4B 45            [ 1] 1232 	push	#<(___str_13+0)
      00A6B2 4B 86            [ 1] 1233 	push	#((___str_13+0) >> 8)
      00A6B4 CD 9F BD         [ 4] 1234 	call	_mib_printf
      00A6B7 5B 02            [ 2] 1235 	addw	sp, #2
                                   1236 ;	./../../mib/stm8s_mib_debug_cmd.c: 438: mib_printf("%s", argv[0]);
      00A6B9 1E 05            [ 2] 1237 	ldw	x, (0x05, sp)
      00A6BB FE               [ 2] 1238 	ldw	x, (x)
      00A6BC 89               [ 2] 1239 	pushw	x
      00A6BD 4B 59            [ 1] 1240 	push	#<(___str_14+0)
      00A6BF 4B 86            [ 1] 1241 	push	#((___str_14+0) >> 8)
      00A6C1 CD 9F BD         [ 4] 1242 	call	_mib_printf
      00A6C4 5B 04            [ 2] 1243 	addw	sp, #4
                                   1244 ;	./../../mib/stm8s_mib_debug_cmd.c: 439: mib_printf("\r\n");
      00A6C6 4B A3            [ 1] 1245 	push	#<(___str_0+0)
      00A6C8 4B 85            [ 1] 1246 	push	#((___str_0+0) >> 8)
      00A6CA CD 9F BD         [ 4] 1247 	call	_mib_printf
      00A6CD 5B 02            [ 2] 1248 	addw	sp, #2
      00A6CF                       1249 00106$:
                                   1250 ;	./../../mib/stm8s_mib_debug_cmd.c: 441: return TRUE;
      00A6CF 5F               [ 1] 1251 	clrw	x
      00A6D0 5C               [ 1] 1252 	incw	x
                                   1253 ;	./../../mib/stm8s_mib_debug_cmd.c: 442: }
      00A6D1 5B 02            [ 2] 1254 	addw	sp, #2
      00A6D3 90 85            [ 2] 1255 	popw	y
      00A6D5 5B 02            [ 2] 1256 	addw	sp, #2
      00A6D7 90 FC            [ 2] 1257 	jp	(y)
                                   1258 ;	./../../mib/stm8s_mib_debug_cmd.c: 452: int getdec(uint8_t **ptr)
                                   1259 ;	-----------------------------------------
                                   1260 ;	 function getdec
                                   1261 ;	-----------------------------------------
      00A6D9                       1262 _getdec:
      00A6D9 52 06            [ 2] 1263 	sub	sp, #6
                                   1264 ;	./../../mib/stm8s_mib_debug_cmd.c: 454: uint8_t *p = *ptr;
      00A6DB 1F 05            [ 2] 1265 	ldw	(0x05, sp), x
      00A6DD FE               [ 2] 1266 	ldw	x, (x)
      00A6DE 1F 01            [ 2] 1267 	ldw	(0x01, sp), x
                                   1268 ;	./../../mib/stm8s_mib_debug_cmd.c: 455: int ret = 0;
      00A6E0 5F               [ 1] 1269 	clrw	x
      00A6E1 1F 03            [ 2] 1270 	ldw	(0x03, sp), x
                                   1271 ;	./../../mib/stm8s_mib_debug_cmd.c: 456: if ((*p < '0') || (*p > '9'))
      00A6E3 1E 01            [ 2] 1272 	ldw	x, (0x01, sp)
      00A6E5 F6               [ 1] 1273 	ld	a, (x)
      00A6E6 A1 30            [ 1] 1274 	cp	a, #0x30
      00A6E8 25 04            [ 1] 1275 	jrc	00101$
      00A6EA A1 39            [ 1] 1276 	cp	a, #0x39
      00A6EC 23 04            [ 2] 1277 	jrule	00113$
      00A6EE                       1278 00101$:
                                   1279 ;	./../../mib/stm8s_mib_debug_cmd.c: 457: return (-1);
      00A6EE 5F               [ 1] 1280 	clrw	x
      00A6EF 5A               [ 2] 1281 	decw	x
      00A6F0 20 29            [ 2] 1282 	jra	00108$
                                   1283 ;	./../../mib/stm8s_mib_debug_cmd.c: 458: while ((*p >= '0') && (*p <= '9'))
      00A6F2                       1284 00113$:
      00A6F2 16 01            [ 2] 1285 	ldw	y, (0x01, sp)
      00A6F4                       1286 00105$:
      00A6F4 90 F6            [ 1] 1287 	ld	a, (y)
      00A6F6 A1 30            [ 1] 1288 	cp	a, #0x30
      00A6F8 25 1C            [ 1] 1289 	jrc	00107$
      00A6FA A1 39            [ 1] 1290 	cp	a, #0x39
      00A6FC 22 18            [ 1] 1291 	jrugt	00107$
                                   1292 ;	./../../mib/stm8s_mib_debug_cmd.c: 460: ret = ret * 10 + (int)(*p - '0');
      00A6FE 1E 03            [ 2] 1293 	ldw	x, (0x03, sp)
      00A700 58               [ 2] 1294 	sllw	x
      00A701 58               [ 2] 1295 	sllw	x
      00A702 72 FB 03         [ 2] 1296 	addw	x, (0x03, sp)
      00A705 58               [ 2] 1297 	sllw	x
      00A706 1F 03            [ 2] 1298 	ldw	(0x03, sp), x
      00A708 5F               [ 1] 1299 	clrw	x
      00A709 97               [ 1] 1300 	ld	xl, a
      00A70A 1D 00 30         [ 2] 1301 	subw	x, #0x0030
      00A70D 72 FB 03         [ 2] 1302 	addw	x, (0x03, sp)
      00A710 1F 03            [ 2] 1303 	ldw	(0x03, sp), x
                                   1304 ;	./../../mib/stm8s_mib_debug_cmd.c: 461: p++;
      00A712 90 5C            [ 1] 1305 	incw	y
      00A714 20 DE            [ 2] 1306 	jra	00105$
      00A716                       1307 00107$:
                                   1308 ;	./../../mib/stm8s_mib_debug_cmd.c: 463: *ptr = p;
      00A716 1E 05            [ 2] 1309 	ldw	x, (0x05, sp)
      00A718 FF               [ 2] 1310 	ldw	(x), y
                                   1311 ;	./../../mib/stm8s_mib_debug_cmd.c: 464: return (ret);
      00A719 1E 03            [ 2] 1312 	ldw	x, (0x03, sp)
      00A71B                       1313 00108$:
                                   1314 ;	./../../mib/stm8s_mib_debug_cmd.c: 465: }
      00A71B 5B 06            [ 2] 1315 	addw	sp, #6
      00A71D 81               [ 4] 1316 	ret
                                   1317 	.area CODE
                                   1318 	.area CONST
                                   1319 	.area CONST
      0085A3                       1320 ___str_0:
      0085A3 0D                    1321 	.db 0x0d
      0085A4 0A                    1322 	.db 0x0a
      0085A5 00                    1323 	.db 0x00
                                   1324 	.area CODE
                                   1325 	.area CONST
      0085A6                       1326 ___str_1:
      0085A6 08                    1327 	.db 0x08
      0085A7 20                    1328 	.ascii " "
      0085A8 08                    1329 	.db 0x08
      0085A9 00                    1330 	.db 0x00
                                   1331 	.area CODE
                                   1332 	.area CONST
      0085AA                       1333 ___str_2:
      0085AA 30 78                 1334 	.ascii "0x"
      0085AC 00                    1335 	.db 0x00
                                   1336 	.area CODE
                                   1337 	.area CONST
      0085AD                       1338 ___str_3:
      0085AD 61 64 64 72 65 73 73  1339 	.ascii "address     Hex Value                                       "
             20 20 20 20 20 48 65
             78 20 56 61 6C 75 65
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      0085E9 20 41 73 63 69 69 20  1340 	.ascii " Ascii value"
             76 61 6C 75 65
      0085F5 0D                    1341 	.db 0x0d
      0085F6 0A                    1342 	.db 0x0a
      0085F7 00                    1343 	.db 0x00
                                   1344 	.area CODE
                                   1345 	.area CONST
      0085F8                       1346 ___str_4:
      0085F8 30 78 25 30 38 6C 78  1347 	.ascii "0x%08lx : "
             20 3A 20
      008602 00                    1348 	.db 0x00
                                   1349 	.area CODE
                                   1350 	.area CONST
      008603                       1351 ___str_5:
      008603 25 30 32 78 20        1352 	.ascii "%02x "
      008608 00                    1353 	.db 0x00
                                   1354 	.area CODE
                                   1355 	.area CONST
      008609                       1356 ___str_6:
      008609 20                    1357 	.ascii " "
      00860A 00                    1358 	.db 0x00
                                   1359 	.area CODE
                                   1360 	.area CONST
      00860B                       1361 ___str_7:
      00860B 25 63                 1362 	.ascii "%c"
      00860D 00                    1363 	.db 0x00
                                   1364 	.area CODE
                                   1365 	.area CONST
      00860E                       1366 ___str_8:
      00860E 2E                    1367 	.ascii "."
      00860F 00                    1368 	.db 0x00
                                   1369 	.area CODE
                                   1370 	.area CONST
      008610                       1371 ___str_9:
      008610 30 78 25 30 38 6C 78  1372 	.ascii "0x%08lx  "
             20 20
      008619 00                    1373 	.db 0x00
                                   1374 	.area CODE
                                   1375 	.area CONST
      00861A                       1376 ___str_10:
      00861A 20 20 20              1377 	.ascii "   "
      00861D 00                    1378 	.db 0x00
                                   1379 	.area CODE
                                   1380 	.area CONST
      00861E                       1381 ___str_11:
      00861E 2A 2A 2A 2A 2A 2A 2A  1382 	.ascii "*******"
      008625 0D                    1383 	.db 0x0d
      008626 0A                    1384 	.db 0x0a
      008627 00                    1385 	.db 0x00
                                   1386 	.area CODE
                                   1387 	.area CONST
      008628                       1388 ___str_12:
      008628 20 20 68 65 6C 70 20  1389 	.ascii "  help  Help for commands."
             20 48 65 6C 70 20 66
             6F 72 20 63 6F 6D 6D
             61 6E 64 73 2E
      008642 0D                    1390 	.db 0x0d
      008643 0A                    1391 	.db 0x0a
      008644 00                    1392 	.db 0x00
                                   1393 	.area CODE
                                   1394 	.area CONST
      008645                       1395 ___str_13:
      008645 09                    1396 	.db 0x09
      008646 55 6E 6B 6E 6F 77 6E  1397 	.ascii "Unknown command : "
             20 63 6F 6D 6D 61 6E
             64 20 3A 20
      008658 00                    1398 	.db 0x00
                                   1399 	.area CODE
                                   1400 	.area CONST
      008659                       1401 ___str_14:
      008659 25 73                 1402 	.ascii "%s"
      00865B 00                    1403 	.db 0x00
                                   1404 	.area CODE
                                   1405 	.area INITIALIZER
      008BAF                       1406 __xinit__cmdTbl:
      008BAF 00 00                 1407 	.dw #0x0000
      008BB1 00 00                 1408 	.dw #0x0000
      008BB3 00 00                 1409 	.dw #0x0000
      008BB5 00 00                 1410 	.dw #0x0000
      008BB7 00 00                 1411 	.dw #0x0000
      008BB9 00 00                 1412 	.dw #0x0000
      008BBB 00 00                 1413 	.dw #0x0000
      008BBD 00 00                 1414 	.dw #0x0000
      008BBF 00 00                 1415 	.dw #0x0000
      008BC1 00 00                 1416 	.dw #0x0000
      008BC3 00 00                 1417 	.dw #0x0000
      008BC5 00 00                 1418 	.dw #0x0000
      008BC7 00 00                 1419 	.dw #0x0000
      008BC9 00 00                 1420 	.dw #0x0000
      008BCB 00 00                 1421 	.dw #0x0000
      008BCD 00 00                 1422 	.dw #0x0000
      008BCF 00 00                 1423 	.dw #0x0000
      008BD1 00 00                 1424 	.dw #0x0000
                                   1425 	.area CABS (ABS)
