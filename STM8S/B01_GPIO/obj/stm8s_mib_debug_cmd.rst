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
      00015C                         39 _cmdTbl::
      00015C                         40 	.ds 36
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
      009A3A                         74 _GetCommand:
      009A3A 52 10            [ 2]   75 	sub	sp, #16
      009A3C 1F 0D            [ 2]   76 	ldw	(0x0d, sp), x
                                     77 ;	./../../mib/stm8s_mib_debug_cmd.c: 88: uint16_t vwIndex, rdCnt, rdMax = len - 1;
      009A3E 1E 13            [ 2]   78 	ldw	x, (0x13, sp)
      009A40 5A               [ 2]   79 	decw	x
      009A41 1F 01            [ 2]   80 	ldw	(0x01, sp), x
                                     81 ;	./../../mib/stm8s_mib_debug_cmd.c: 91: endTime = MibGetSecs() + (uint16_t)timeout;
      009A43 CD 9A 2D         [ 4]   82 	call	_MibGetSecs
      009A46 7B 15            [ 1]   83 	ld	a, (0x15, sp)
      009A48 6B 10            [ 1]   84 	ld	(0x10, sp), a
      009A4A 0F 0F            [ 1]   85 	clr	(0x0f, sp)
      009A4C 72 FB 0F         [ 2]   86 	addw	x, (0x0f, sp)
      009A4F 1F 03            [ 2]   87 	ldw	(0x03, sp), x
                                     88 ;	./../../mib/stm8s_mib_debug_cmd.c: 92: cmd_list.cur = cmd_list.next;
      009A51 C6 00 49         [ 1]   89 	ld	a, _cmd_list+1
      009A54 C7 00 48         [ 1]   90 	ld	_cmd_list+0, a
                                     91 ;	./../../mib/stm8s_mib_debug_cmd.c: 93: for (rdCnt = 0, vwIndex = 0; rdCnt <= rdMax;)
      009A57 5F               [ 1]   92 	clrw	x
      009A58 1F 0F            [ 2]   93 	ldw	(0x0f, sp), x
      009A5A                         94 00149$:
      009A5A 1E 0F            [ 2]   95 	ldw	x, (0x0f, sp)
      009A5C 13 01            [ 2]   96 	cpw	x, (0x01, sp)
      009A5E 23 03            [ 2]   97 	jrule	00243$
      009A60 CC 9C 2D         [ 2]   98 	jp	00147$
      009A63                         99 00243$:
                                    100 ;	./../../mib/stm8s_mib_debug_cmd.c: 96: while (1)
      009A63                        101 00106$:
                                    102 ;	./../../mib/stm8s_mib_debug_cmd.c: 98: vwCh = MibReadDebugByte();
      009A63 CD 8F CF         [ 4]  103 	call	_MibReadDebugByte
                                    104 ;	./../../mib/stm8s_mib_debug_cmd.c: 99: if (vwCh != 0xffff)	break;
      009A66 1F 05            [ 2]  105 	ldw	(0x05, sp), x
      009A68 1F 07            [ 2]  106 	ldw	(0x07, sp), x
                                    107 ;	./../../mib/stm8s_mib_debug_cmd.c: 102: cmd[rdCnt++] = '\0';
      009A6A 1E 0F            [ 2]  108 	ldw	x, (0x0f, sp)
      009A6C 5C               [ 1]  109 	incw	x
      009A6D 1F 09            [ 2]  110 	ldw	(0x09, sp), x
                                    111 ;	./../../mib/stm8s_mib_debug_cmd.c: 104: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      009A6F 16 0D            [ 2]  112 	ldw	y, (0x0d, sp)
      009A71 17 0B            [ 2]  113 	ldw	(0x0b, sp), y
                                    114 ;	./../../mib/stm8s_mib_debug_cmd.c: 99: if (vwCh != 0xffff)	break;
      009A73 1E 07            [ 2]  115 	ldw	x, (0x07, sp)
      009A75 5C               [ 1]  116 	incw	x
      009A76 26 55            [ 1]  117 	jrne	00107$
                                    118 ;	./../../mib/stm8s_mib_debug_cmd.c: 100: if (MibGetSecs() > endTime)
      009A78 CD 9A 2D         [ 4]  119 	call	_MibGetSecs
      009A7B 13 03            [ 2]  120 	cpw	x, (0x03, sp)
      009A7D 23 E4            [ 2]  121 	jrule	00106$
                                    122 ;	./../../mib/stm8s_mib_debug_cmd.c: 102: cmd[rdCnt++] = '\0';
      009A7F 1E 0F            [ 2]  123 	ldw	x, (0x0f, sp)
      009A81 16 09            [ 2]  124 	ldw	y, (0x09, sp)
      009A83 17 0F            [ 2]  125 	ldw	(0x0f, sp), y
      009A85 72 FB 0D         [ 2]  126 	addw	x, (0x0d, sp)
      009A88 7F               [ 1]  127 	clr	(x)
                                    128 ;	./../../mib/stm8s_mib_debug_cmd.c: 103: memset(cmd_list.buf[cmd_list.next], 0, CMD_CHAR_MAX);
      009A89 C6 00 49         [ 1]  129 	ld	a, _cmd_list+1
      009A8C 97               [ 1]  130 	ld	xl, a
      009A8D A6 40            [ 1]  131 	ld	a, #0x40
      009A8F 42               [ 4]  132 	mul	x, a
      009A90 1C 00 4A         [ 2]  133 	addw	x, #(_cmd_list+2)
      009A93 4B 40            [ 1]  134 	push	#0x40
      009A95 4B 00            [ 1]  135 	push	#0x00
      009A97 4B 00            [ 1]  136 	push	#0x00
      009A99 4B 00            [ 1]  137 	push	#0x00
      009A9B CD AC 1D         [ 4]  138 	call	_memset
                                    139 ;	./../../mib/stm8s_mib_debug_cmd.c: 104: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      009A9E 1E 0D            [ 2]  140 	ldw	x, (0x0d, sp)
      009AA0 CD AC 41         [ 4]  141 	call	_strlen
      009AA3 51               [ 1]  142 	exgw	x, y
      009AA4 C6 00 49         [ 1]  143 	ld	a, _cmd_list+1
      009AA7 97               [ 1]  144 	ld	xl, a
      009AA8 A6 40            [ 1]  145 	ld	a, #0x40
      009AAA 42               [ 4]  146 	mul	x, a
      009AAB 1C 00 4A         [ 2]  147 	addw	x, #(_cmd_list+2)
      009AAE 90 89            [ 2]  148 	pushw	y
      009AB0 16 0D            [ 2]  149 	ldw	y, (0x0d, sp)
      009AB2 90 89            [ 2]  150 	pushw	y
      009AB4 CD AB CA         [ 4]  151 	call	___memcpy
                                    152 ;	./../../mib/stm8s_mib_debug_cmd.c: 105: cmd_list.next = (cmd_list.next + 1) % CMD_LINE_MAX;
      009AB7 C6 00 49         [ 1]  153 	ld	a, _cmd_list+1
      009ABA 5F               [ 1]  154 	clrw	x
      009ABB 97               [ 1]  155 	ld	xl, a
      009ABC 5C               [ 1]  156 	incw	x
      009ABD 4B 04            [ 1]  157 	push	#0x04
      009ABF 4B 00            [ 1]  158 	push	#0x00
      009AC1 CD AC 8B         [ 4]  159 	call	__modsint
      009AC4 9F               [ 1]  160 	ld	a, xl
      009AC5 C7 00 49         [ 1]  161 	ld	_cmd_list+1, a
                                    162 ;	./../../mib/stm8s_mib_debug_cmd.c: 106: return rdCnt;
      009AC8 1E 0F            [ 2]  163 	ldw	x, (0x0f, sp)
      009ACA CC 9C 2F         [ 2]  164 	jp	00151$
      009ACD                        165 00107$:
                                    166 ;	./../../mib/stm8s_mib_debug_cmd.c: 112: if ((vwCh == '\r') || (vwCh == '\n') || (vwCh == '@'))
      009ACD 1E 07            [ 2]  167 	ldw	x, (0x07, sp)
      009ACF A3 00 0D         [ 2]  168 	cpw	x, #0x000d
      009AD2 27 0E            [ 1]  169 	jreq	00142$
      009AD4 1E 07            [ 2]  170 	ldw	x, (0x07, sp)
      009AD6 A3 00 0A         [ 2]  171 	cpw	x, #0x000a
      009AD9 27 07            [ 1]  172 	jreq	00142$
      009ADB 1E 07            [ 2]  173 	ldw	x, (0x07, sp)
      009ADD A3 00 40         [ 2]  174 	cpw	x, #0x0040
      009AE0 26 57            [ 1]  175 	jrne	00143$
      009AE2                        176 00142$:
                                    177 ;	./../../mib/stm8s_mib_debug_cmd.c: 114: cmd[rdCnt++] = '\0';
      009AE2 1E 0F            [ 2]  178 	ldw	x, (0x0f, sp)
      009AE4 16 09            [ 2]  179 	ldw	y, (0x09, sp)
      009AE6 17 0F            [ 2]  180 	ldw	(0x0f, sp), y
      009AE8 72 FB 0D         [ 2]  181 	addw	x, (0x0d, sp)
      009AEB 7F               [ 1]  182 	clr	(x)
                                    183 ;	./../../mib/stm8s_mib_debug_cmd.c: 115: memset(cmd_list.buf[cmd_list.next], 0, CMD_CHAR_MAX);
      009AEC C6 00 49         [ 1]  184 	ld	a, _cmd_list+1
      009AEF 97               [ 1]  185 	ld	xl, a
      009AF0 A6 40            [ 1]  186 	ld	a, #0x40
      009AF2 42               [ 4]  187 	mul	x, a
      009AF3 1C 00 4A         [ 2]  188 	addw	x, #(_cmd_list+2)
      009AF6 4B 40            [ 1]  189 	push	#0x40
      009AF8 4B 00            [ 1]  190 	push	#0x00
      009AFA 4B 00            [ 1]  191 	push	#0x00
      009AFC 4B 00            [ 1]  192 	push	#0x00
      009AFE CD AC 1D         [ 4]  193 	call	_memset
                                    194 ;	./../../mib/stm8s_mib_debug_cmd.c: 116: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      009B01 1E 0D            [ 2]  195 	ldw	x, (0x0d, sp)
      009B03 CD AC 41         [ 4]  196 	call	_strlen
      009B06 51               [ 1]  197 	exgw	x, y
      009B07 C6 00 49         [ 1]  198 	ld	a, _cmd_list+1
      009B0A 97               [ 1]  199 	ld	xl, a
      009B0B A6 40            [ 1]  200 	ld	a, #0x40
      009B0D 42               [ 4]  201 	mul	x, a
      009B0E 1C 00 4A         [ 2]  202 	addw	x, #(_cmd_list+2)
      009B11 90 89            [ 2]  203 	pushw	y
      009B13 16 0D            [ 2]  204 	ldw	y, (0x0d, sp)
      009B15 90 89            [ 2]  205 	pushw	y
      009B17 CD AB CA         [ 4]  206 	call	___memcpy
                                    207 ;	./../../mib/stm8s_mib_debug_cmd.c: 117: cmd_list.next = (cmd_list.next + 1) % CMD_LINE_MAX;
      009B1A C6 00 49         [ 1]  208 	ld	a, _cmd_list+1
      009B1D 5F               [ 1]  209 	clrw	x
      009B1E 97               [ 1]  210 	ld	xl, a
      009B1F 5C               [ 1]  211 	incw	x
      009B20 4B 04            [ 1]  212 	push	#0x04
      009B22 4B 00            [ 1]  213 	push	#0x00
      009B24 CD AC 8B         [ 4]  214 	call	__modsint
      009B27 9F               [ 1]  215 	ld	a, xl
      009B28 C7 00 49         [ 1]  216 	ld	_cmd_list+1, a
                                    217 ;	./../../mib/stm8s_mib_debug_cmd.c: 119: mib_printf("\r\n");
      009B2B 4B 28            [ 1]  218 	push	#<(___str_0+0)
      009B2D 4B 84            [ 1]  219 	push	#((___str_0+0) >> 8)
      009B2F CD 99 C0         [ 4]  220 	call	_mib_printf
      009B32 5B 02            [ 2]  221 	addw	sp, #2
                                    222 ;	./../../mib/stm8s_mib_debug_cmd.c: 120: return rdCnt;
      009B34 1E 0F            [ 2]  223 	ldw	x, (0x0f, sp)
      009B36 CC 9C 2F         [ 2]  224 	jp	00151$
      009B39                        225 00143$:
                                    226 ;	./../../mib/stm8s_mib_debug_cmd.c: 122: else if (vwCh == '\b')
      009B39 1E 07            [ 2]  227 	ldw	x, (0x07, sp)
      009B3B A3 00 08         [ 2]  228 	cpw	x, #0x0008
      009B3E 26 18            [ 1]  229 	jrne	00140$
                                    230 ;	./../../mib/stm8s_mib_debug_cmd.c: 124: if (rdCnt > 0)
      009B40 1E 0F            [ 2]  231 	ldw	x, (0x0f, sp)
      009B42 26 03            [ 1]  232 	jrne	00260$
      009B44 CC 9A 5A         [ 2]  233 	jp	00149$
      009B47                        234 00260$:
                                    235 ;	./../../mib/stm8s_mib_debug_cmd.c: 126: rdCnt--;
      009B47 1E 0F            [ 2]  236 	ldw	x, (0x0f, sp)
      009B49 5A               [ 2]  237 	decw	x
      009B4A 1F 0F            [ 2]  238 	ldw	(0x0f, sp), x
                                    239 ;	./../../mib/stm8s_mib_debug_cmd.c: 128: mib_printf("\b \b");
      009B4C 4B 2B            [ 1]  240 	push	#<(___str_1+0)
      009B4E 4B 84            [ 1]  241 	push	#((___str_1+0) >> 8)
      009B50 CD 99 C0         [ 4]  242 	call	_mib_printf
      009B53 5B 02            [ 2]  243 	addw	sp, #2
      009B55 CC 9A 5A         [ 2]  244 	jp	00149$
      009B58                        245 00140$:
                                    246 ;	./../../mib/stm8s_mib_debug_cmd.c: 131: else if (vwCh == 0x1b)
      009B58 1E 07            [ 2]  247 	ldw	x, (0x07, sp)
      009B5A A3 00 1B         [ 2]  248 	cpw	x, #0x001b
      009B5D 27 03            [ 1]  249 	jreq	00263$
      009B5F CC 9C 1B         [ 2]  250 	jp	00137$
      009B62                        251 00263$:
                                    252 ;	./../../mib/stm8s_mib_debug_cmd.c: 134: while (1)
      009B62                        253 00113$:
                                    254 ;	./../../mib/stm8s_mib_debug_cmd.c: 136: vwCh = MibReadDebugByte();
      009B62 CD 8F CF         [ 4]  255 	call	_MibReadDebugByte
                                    256 ;	./../../mib/stm8s_mib_debug_cmd.c: 137: if (vwCh != 0xffff)
      009B65 A3 FF FF         [ 2]  257 	cpw	x, #0xffff
      009B68 27 F8            [ 1]  258 	jreq	00113$
                                    259 ;	./../../mib/stm8s_mib_debug_cmd.c: 140: if (vwCh == '[')
      009B6A A3 00 5B         [ 2]  260 	cpw	x, #0x005b
      009B6D 27 03            [ 1]  261 	jreq	00269$
      009B6F CC 9A 5A         [ 2]  262 	jp	00149$
      009B72                        263 00269$:
                                    264 ;	./../../mib/stm8s_mib_debug_cmd.c: 143: while (1)
      009B72                        265 00118$:
                                    266 ;	./../../mib/stm8s_mib_debug_cmd.c: 145: vwCh = MibReadDebugByte();
      009B72 CD 8F CF         [ 4]  267 	call	_MibReadDebugByte
                                    268 ;	./../../mib/stm8s_mib_debug_cmd.c: 146: if (vwCh != 0xffff)
      009B75 1F 09            [ 2]  269 	ldw	(0x09, sp), x
      009B77 5C               [ 1]  270 	incw	x
      009B78 27 F8            [ 1]  271 	jreq	00118$
                                    272 ;	./../../mib/stm8s_mib_debug_cmd.c: 150: if (vwCh == 'B')
      009B7A 1E 09            [ 2]  273 	ldw	x, (0x09, sp)
      009B7C A3 00 42         [ 2]  274 	cpw	x, #0x0042
      009B7F 26 48            [ 1]  275 	jrne	00132$
                                    276 ;	./../../mib/stm8s_mib_debug_cmd.c: 152: cmd_list.cur++;
      009B81 C6 00 48         [ 1]  277 	ld	a, _cmd_list+0
      009B84 4C               [ 1]  278 	inc	a
      009B85 C7 00 48         [ 1]  279 	ld	_cmd_list+0, a
                                    280 ;	./../../mib/stm8s_mib_debug_cmd.c: 153: if (cmd_list.cur == CMD_LINE_MAX)
      009B88 A1 04            [ 1]  281 	cp	a, #0x04
      009B8A 26 04            [ 1]  282 	jrne	00121$
                                    283 ;	./../../mib/stm8s_mib_debug_cmd.c: 154: cmd_list.cur = 0;
      009B8C 35 00 00 48      [ 1]  284 	mov	_cmd_list+0, #0x00
      009B90                        285 00121$:
                                    286 ;	./../../mib/stm8s_mib_debug_cmd.c: 155: rdCnt = strlen(cmd_list.buf[cmd_list.cur]);
      009B90 C6 00 48         [ 1]  287 	ld	a, _cmd_list+0
      009B93 97               [ 1]  288 	ld	xl, a
      009B94 A6 40            [ 1]  289 	ld	a, #0x40
      009B96 42               [ 4]  290 	mul	x, a
      009B97 1C 00 4A         [ 2]  291 	addw	x, #(_cmd_list+2)
      009B9A CD AC 41         [ 4]  292 	call	_strlen
                                    293 ;	./../../mib/stm8s_mib_debug_cmd.c: 156: if (rdCnt >= rdMax)
      009B9D 1F 0F            [ 2]  294 	ldw	(0x0f, sp), x
      009B9F 13 01            [ 2]  295 	cpw	x, (0x01, sp)
      009BA1 25 04            [ 1]  296 	jrc	00123$
                                    297 ;	./../../mib/stm8s_mib_debug_cmd.c: 157: rdCnt = rdMax;
      009BA3 16 01            [ 2]  298 	ldw	y, (0x01, sp)
      009BA5 17 0F            [ 2]  299 	ldw	(0x0f, sp), y
      009BA7                        300 00123$:
                                    301 ;	./../../mib/stm8s_mib_debug_cmd.c: 158: memcpy(cmd, cmd_list.buf[cmd_list.cur], rdCnt);
      009BA7 16 0F            [ 2]  302 	ldw	y, (0x0f, sp)
      009BA9 C6 00 48         [ 1]  303 	ld	a, _cmd_list+0
      009BAC 97               [ 1]  304 	ld	xl, a
      009BAD A6 40            [ 1]  305 	ld	a, #0x40
      009BAF 42               [ 4]  306 	mul	x, a
      009BB0 1C 00 4A         [ 2]  307 	addw	x, #(_cmd_list+2)
      009BB3 90 89            [ 2]  308 	pushw	y
      009BB5 89               [ 2]  309 	pushw	x
      009BB6 1E 0F            [ 2]  310 	ldw	x, (0x0f, sp)
      009BB8 CD AB CA         [ 4]  311 	call	___memcpy
                                    312 ;	./../../mib/stm8s_mib_debug_cmd.c: 159: cmd[rdCnt] = 0;
      009BBB 1E 0D            [ 2]  313 	ldw	x, (0x0d, sp)
      009BBD 72 FB 0F         [ 2]  314 	addw	x, (0x0f, sp)
      009BC0 7F               [ 1]  315 	clr	(x)
                                    316 ;	./../../mib/stm8s_mib_debug_cmd.c: 161: MibWriteDebugString(cmd);
      009BC1 1E 0D            [ 2]  317 	ldw	x, (0x0d, sp)
      009BC3 CD 8F AE         [ 4]  318 	call	_MibWriteDebugString
      009BC6 CC 9A 5A         [ 2]  319 	jp	00149$
      009BC9                        320 00132$:
                                    321 ;	./../../mib/stm8s_mib_debug_cmd.c: 163: else if (vwCh == 'A')
      009BC9 1E 09            [ 2]  322 	ldw	x, (0x09, sp)
      009BCB A3 00 41         [ 2]  323 	cpw	x, #0x0041
      009BCE 27 03            [ 1]  324 	jreq	00282$
      009BD0 CC 9A 5A         [ 2]  325 	jp	00149$
      009BD3                        326 00282$:
                                    327 ;	./../../mib/stm8s_mib_debug_cmd.c: 152: cmd_list.cur++;
                                    328 ;	./../../mib/stm8s_mib_debug_cmd.c: 165: if (cmd_list.cur == 0)
      009BD3 C6 00 48         [ 1]  329 	ld	a, _cmd_list+0
      009BD6 26 06            [ 1]  330 	jrne	00125$
                                    331 ;	./../../mib/stm8s_mib_debug_cmd.c: 166: cmd_list.cur = CMD_LINE_MAX - 1;
      009BD8 35 03 00 48      [ 1]  332 	mov	_cmd_list+0, #0x03
      009BDC 20 04            [ 2]  333 	jra	00126$
      009BDE                        334 00125$:
                                    335 ;	./../../mib/stm8s_mib_debug_cmd.c: 168: cmd_list.cur--;
      009BDE 4A               [ 1]  336 	dec	a
      009BDF C7 00 48         [ 1]  337 	ld	_cmd_list+0, a
      009BE2                        338 00126$:
                                    339 ;	./../../mib/stm8s_mib_debug_cmd.c: 169: rdCnt = strlen(cmd_list.buf[cmd_list.cur]);
      009BE2 C6 00 48         [ 1]  340 	ld	a, _cmd_list+0
      009BE5 97               [ 1]  341 	ld	xl, a
      009BE6 A6 40            [ 1]  342 	ld	a, #0x40
      009BE8 42               [ 4]  343 	mul	x, a
      009BE9 1C 00 4A         [ 2]  344 	addw	x, #(_cmd_list+2)
      009BEC CD AC 41         [ 4]  345 	call	_strlen
                                    346 ;	./../../mib/stm8s_mib_debug_cmd.c: 170: if (rdCnt >= rdMax)
      009BEF 1F 0F            [ 2]  347 	ldw	(0x0f, sp), x
      009BF1 13 01            [ 2]  348 	cpw	x, (0x01, sp)
      009BF3 25 04            [ 1]  349 	jrc	00128$
                                    350 ;	./../../mib/stm8s_mib_debug_cmd.c: 171: rdCnt = rdMax;
      009BF5 16 01            [ 2]  351 	ldw	y, (0x01, sp)
      009BF7 17 0F            [ 2]  352 	ldw	(0x0f, sp), y
      009BF9                        353 00128$:
                                    354 ;	./../../mib/stm8s_mib_debug_cmd.c: 172: memcpy(cmd, cmd_list.buf[cmd_list.cur], rdCnt);
      009BF9 16 0F            [ 2]  355 	ldw	y, (0x0f, sp)
      009BFB C6 00 48         [ 1]  356 	ld	a, _cmd_list+0
      009BFE 97               [ 1]  357 	ld	xl, a
      009BFF A6 40            [ 1]  358 	ld	a, #0x40
      009C01 42               [ 4]  359 	mul	x, a
      009C02 1C 00 4A         [ 2]  360 	addw	x, #(_cmd_list+2)
      009C05 90 89            [ 2]  361 	pushw	y
      009C07 89               [ 2]  362 	pushw	x
      009C08 1E 0F            [ 2]  363 	ldw	x, (0x0f, sp)
      009C0A CD AB CA         [ 4]  364 	call	___memcpy
                                    365 ;	./../../mib/stm8s_mib_debug_cmd.c: 173: cmd[rdCnt] = 0;
      009C0D 1E 0D            [ 2]  366 	ldw	x, (0x0d, sp)
      009C0F 72 FB 0F         [ 2]  367 	addw	x, (0x0f, sp)
      009C12 7F               [ 1]  368 	clr	(x)
                                    369 ;	./../../mib/stm8s_mib_debug_cmd.c: 175: MibWriteDebugString(cmd);
      009C13 1E 0D            [ 2]  370 	ldw	x, (0x0d, sp)
      009C15 CD 8F AE         [ 4]  371 	call	_MibWriteDebugString
      009C18 CC 9A 5A         [ 2]  372 	jp	00149$
      009C1B                        373 00137$:
                                    374 ;	./../../mib/stm8s_mib_debug_cmd.c: 181: cmd[rdCnt++] = vwCh;
      009C1B 1E 0F            [ 2]  375 	ldw	x, (0x0f, sp)
      009C1D 16 09            [ 2]  376 	ldw	y, (0x09, sp)
      009C1F 17 0F            [ 2]  377 	ldw	(0x0f, sp), y
      009C21 72 FB 0D         [ 2]  378 	addw	x, (0x0d, sp)
      009C24 7B 06            [ 1]  379 	ld	a, (0x06, sp)
      009C26 F7               [ 1]  380 	ld	(x), a
                                    381 ;	./../../mib/stm8s_mib_debug_cmd.c: 183: MibWriteDebugByte(vwCh);
      009C27 CD 8F 91         [ 4]  382 	call	_MibWriteDebugByte
      009C2A CC 9A 5A         [ 2]  383 	jp	00149$
      009C2D                        384 00147$:
                                    385 ;	./../../mib/stm8s_mib_debug_cmd.c: 186: return (rdCnt);
      009C2D 1E 0F            [ 2]  386 	ldw	x, (0x0f, sp)
      009C2F                        387 00151$:
                                    388 ;	./../../mib/stm8s_mib_debug_cmd.c: 187: } // GetCommand.
      009C2F 16 11            [ 2]  389 	ldw	y, (17, sp)
      009C31 5B 15            [ 2]  390 	addw	sp, #21
      009C33 90 FC            [ 2]  391 	jp	(y)
                                    392 ;	./../../mib/stm8s_mib_debug_cmd.c: 197: int GetArgs(char *s, char **argv)
                                    393 ;	-----------------------------------------
                                    394 ;	 function GetArgs
                                    395 ;	-----------------------------------------
      009C35                        396 _GetArgs:
      009C35 52 08            [ 2]  397 	sub	sp, #8
      009C37 1F 05            [ 2]  398 	ldw	(0x05, sp), x
                                    399 ;	./../../mib/stm8s_mib_debug_cmd.c: 199: int args = 0;
      009C39 5F               [ 1]  400 	clrw	x
      009C3A 1F 01            [ 2]  401 	ldw	(0x01, sp), x
                                    402 ;	./../../mib/stm8s_mib_debug_cmd.c: 201: if (!s || *s == '\0')
      009C3C 1E 05            [ 2]  403 	ldw	x, (0x05, sp)
      009C3E 27 03            [ 1]  404 	jreq	00101$
      009C40 F6               [ 1]  405 	ld	a, (x)
      009C41 26 03            [ 1]  406 	jrne	00131$
      009C43                        407 00101$:
                                    408 ;	./../../mib/stm8s_mib_debug_cmd.c: 202: return 0;
      009C43 5F               [ 1]  409 	clrw	x
      009C44 20 73            [ 2]  410 	jra	00120$
                                    411 ;	./../../mib/stm8s_mib_debug_cmd.c: 203: while (args < MAX_ARGS)
      009C46                        412 00131$:
      009C46 5F               [ 1]  413 	clrw	x
      009C47 1F 07            [ 2]  414 	ldw	(0x07, sp), x
      009C49                        415 00117$:
      009C49 1E 07            [ 2]  416 	ldw	x, (0x07, sp)
      009C4B A3 00 05         [ 2]  417 	cpw	x, #0x0005
      009C4E 2E 67            [ 1]  418 	jrsge	00119$
                                    419 ;	./../../mib/stm8s_mib_debug_cmd.c: 206: while ((*s == ' ') || (*s == '\t'))
      009C50 1E 05            [ 2]  420 	ldw	x, (0x05, sp)
      009C52                        421 00105$:
      009C52 F6               [ 1]  422 	ld	a, (x)
      009C53 A1 20            [ 1]  423 	cp	a, #0x20
      009C55 27 04            [ 1]  424 	jreq	00106$
      009C57 A1 09            [ 1]  425 	cp	a, #0x09
      009C59 26 03            [ 1]  426 	jrne	00107$
      009C5B                        427 00106$:
                                    428 ;	./../../mib/stm8s_mib_debug_cmd.c: 207: s++;
      009C5B 5C               [ 1]  429 	incw	x
      009C5C 20 F4            [ 2]  430 	jra	00105$
      009C5E                        431 00107$:
                                    432 ;	./../../mib/stm8s_mib_debug_cmd.c: 210: if (*s == '\0')
      009C5E 4D               [ 1]  433 	tnz	a
      009C5F 26 0D            [ 1]  434 	jrne	00109$
                                    435 ;	./../../mib/stm8s_mib_debug_cmd.c: 212: argv[args] = 0;
      009C61 1E 01            [ 2]  436 	ldw	x, (0x01, sp)
      009C63 58               [ 2]  437 	sllw	x
      009C64 72 FB 0B         [ 2]  438 	addw	x, (0x0b, sp)
      009C67 6F 01            [ 1]  439 	clr	(0x1, x)
      009C69 7F               [ 1]  440 	clr	(x)
                                    441 ;	./../../mib/stm8s_mib_debug_cmd.c: 213: return args;
      009C6A 1E 01            [ 2]  442 	ldw	x, (0x01, sp)
      009C6C 20 4B            [ 2]  443 	jra	00120$
      009C6E                        444 00109$:
                                    445 ;	./../../mib/stm8s_mib_debug_cmd.c: 216: argv[args++] = s;
      009C6E 16 07            [ 2]  446 	ldw	y, (0x07, sp)
      009C70 17 03            [ 2]  447 	ldw	(0x03, sp), y
      009C72 16 07            [ 2]  448 	ldw	y, (0x07, sp)
      009C74 90 5C            [ 1]  449 	incw	y
      009C76 17 07            [ 2]  450 	ldw	(0x07, sp), y
      009C78 17 01            [ 2]  451 	ldw	(0x01, sp), y
      009C7A 16 03            [ 2]  452 	ldw	y, (0x03, sp)
      009C7C 90 58            [ 2]  453 	sllw	y
      009C7E 72 F9 0B         [ 2]  454 	addw	y, (0x0b, sp)
      009C81 90 FF            [ 2]  455 	ldw	(y), x
                                    456 ;	./../../mib/stm8s_mib_debug_cmd.c: 219: while (*s && (*s != ' ') && (*s != '\t'))
      009C83 1F 05            [ 2]  457 	ldw	(0x05, sp), x
      009C85                        458 00112$:
      009C85 1E 05            [ 2]  459 	ldw	x, (0x05, sp)
      009C87 F6               [ 1]  460 	ld	a, (x)
                                    461 ;	./../../mib/stm8s_mib_debug_cmd.c: 220: s++;
      009C88 1E 05            [ 2]  462 	ldw	x, (0x05, sp)
      009C8A 5C               [ 1]  463 	incw	x
      009C8B 1F 03            [ 2]  464 	ldw	(0x03, sp), x
                                    465 ;	./../../mib/stm8s_mib_debug_cmd.c: 219: while (*s && (*s != ' ') && (*s != '\t'))
      009C8D 4D               [ 1]  466 	tnz	a
      009C8E 27 0E            [ 1]  467 	jreq	00114$
      009C90 A1 20            [ 1]  468 	cp	a, #0x20
      009C92 27 0A            [ 1]  469 	jreq	00114$
      009C94 A1 09            [ 1]  470 	cp	a, #0x09
      009C96 27 06            [ 1]  471 	jreq	00114$
                                    472 ;	./../../mib/stm8s_mib_debug_cmd.c: 220: s++;
      009C98 16 03            [ 2]  473 	ldw	y, (0x03, sp)
      009C9A 17 05            [ 2]  474 	ldw	(0x05, sp), y
      009C9C 20 E7            [ 2]  475 	jra	00112$
      009C9E                        476 00114$:
                                    477 ;	./../../mib/stm8s_mib_debug_cmd.c: 222: if (*s == '\0')
      009C9E 4D               [ 1]  478 	tnz	a
      009C9F 26 0D            [ 1]  479 	jrne	00116$
                                    480 ;	./../../mib/stm8s_mib_debug_cmd.c: 224: argv[args] = 0;
      009CA1 1E 01            [ 2]  481 	ldw	x, (0x01, sp)
      009CA3 58               [ 2]  482 	sllw	x
      009CA4 72 FB 0B         [ 2]  483 	addw	x, (0x0b, sp)
      009CA7 6F 01            [ 1]  484 	clr	(0x1, x)
      009CA9 7F               [ 1]  485 	clr	(x)
                                    486 ;	./../../mib/stm8s_mib_debug_cmd.c: 225: return args;
      009CAA 1E 01            [ 2]  487 	ldw	x, (0x01, sp)
      009CAC 20 0B            [ 2]  488 	jra	00120$
      009CAE                        489 00116$:
                                    490 ;	./../../mib/stm8s_mib_debug_cmd.c: 227: *s++ = '\0';
      009CAE 1E 05            [ 2]  491 	ldw	x, (0x05, sp)
      009CB0 7F               [ 1]  492 	clr	(x)
      009CB1 16 03            [ 2]  493 	ldw	y, (0x03, sp)
      009CB3 17 05            [ 2]  494 	ldw	(0x05, sp), y
      009CB5 20 92            [ 2]  495 	jra	00117$
      009CB7                        496 00119$:
                                    497 ;	./../../mib/stm8s_mib_debug_cmd.c: 229: return args;
      009CB7 1E 01            [ 2]  498 	ldw	x, (0x01, sp)
      009CB9                        499 00120$:
                                    500 ;	./../../mib/stm8s_mib_debug_cmd.c: 230: } // GetArgs.
      009CB9 5B 08            [ 2]  501 	addw	sp, #8
      009CBB 90 85            [ 2]  502 	popw	y
      009CBD 5B 02            [ 2]  503 	addw	sp, #2
      009CBF 90 FC            [ 2]  504 	jp	(y)
                                    505 ;	./../../mib/stm8s_mib_debug_cmd.c: 241: int HexToInt(char *s, void *retval, uint16_t type)
                                    506 ;	-----------------------------------------
                                    507 ;	 function HexToInt
                                    508 ;	-----------------------------------------
      009CC1                        509 _HexToInt:
      009CC1 52 0E            [ 2]  510 	sub	sp, #14
                                    511 ;	./../../mib/stm8s_mib_debug_cmd.c: 247: if (!s || !retval)
      009CC3 1F 0A            [ 2]  512 	ldw	(0x0a, sp), x
      009CC5 27 04            [ 1]  513 	jreq	00101$
      009CC7 1E 11            [ 2]  514 	ldw	x, (0x11, sp)
      009CC9 26 04            [ 1]  515 	jrne	00102$
      009CCB                        516 00101$:
                                    517 ;	./../../mib/stm8s_mib_debug_cmd.c: 248: return FALSE;
      009CCB 5F               [ 1]  518 	clrw	x
      009CCC CC 9D A7         [ 2]  519 	jp	00132$
      009CCF                        520 00102$:
                                    521 ;	./../../mib/stm8s_mib_debug_cmd.c: 249: if (!strncmp(s, "0x", 2))
      009CCF 4B 02            [ 1]  522 	push	#0x02
      009CD1 4B 00            [ 1]  523 	push	#0x00
      009CD3 4B 2F            [ 1]  524 	push	#<(___str_2+0)
      009CD5 4B 84            [ 1]  525 	push	#((___str_2+0) >> 8)
      009CD7 1E 0E            [ 2]  526 	ldw	x, (0x0e, sp)
      009CD9 CD AB 27         [ 4]  527 	call	_strncmp
      009CDC 5D               [ 2]  528 	tnzw	x
      009CDD 26 06            [ 1]  529 	jrne	00105$
                                    530 ;	./../../mib/stm8s_mib_debug_cmd.c: 250: s += 2;
      009CDF 1E 0A            [ 2]  531 	ldw	x, (0x0a, sp)
      009CE1 5C               [ 1]  532 	incw	x
      009CE2 5C               [ 1]  533 	incw	x
      009CE3 1F 0A            [ 2]  534 	ldw	(0x0a, sp), x
      009CE5                        535 00105$:
                                    536 ;	./../../mib/stm8s_mib_debug_cmd.c: 252: for (i = 0, rval = 0; i < type / 4; i++)
      009CE5 0F 01            [ 1]  537 	clr	(0x01, sp)
      009CE7 5F               [ 1]  538 	clrw	x
      009CE8 1F 04            [ 2]  539 	ldw	(0x04, sp), x
      009CEA 1F 02            [ 2]  540 	ldw	(0x02, sp), x
      009CEC 16 0A            [ 2]  541 	ldw	y, (0x0a, sp)
      009CEE 17 0C            [ 2]  542 	ldw	(0x0c, sp), y
      009CF0 0F 0E            [ 1]  543 	clr	(0x0e, sp)
      009CF2                        544 00130$:
      009CF2 16 13            [ 2]  545 	ldw	y, (0x13, sp)
      009CF4 17 06            [ 2]  546 	ldw	(0x06, sp), y
      009CF6 93               [ 1]  547 	ldw	x, y
      009CF7 54               [ 2]  548 	srlw	x
      009CF8 54               [ 2]  549 	srlw	x
      009CF9 1F 08            [ 2]  550 	ldw	(0x08, sp), x
      009CFB 7B 0E            [ 1]  551 	ld	a, (0x0e, sp)
      009CFD 5F               [ 1]  552 	clrw	x
      009CFE 97               [ 1]  553 	ld	xl, a
      009CFF 13 08            [ 2]  554 	cpw	x, (0x08, sp)
      009D01 24 70            [ 1]  555 	jrnc	00123$
                                    556 ;	./../../mib/stm8s_mib_debug_cmd.c: 254: if (*s == '\0')
      009D03 1E 0C            [ 2]  557 	ldw	x, (0x0c, sp)
      009D05 F6               [ 1]  558 	ld	a, (x)
      009D06 26 08            [ 1]  559 	jrne	00110$
                                    560 ;	./../../mib/stm8s_mib_debug_cmd.c: 256: if (i == 0)
      009D08 0D 01            [ 1]  561 	tnz	(0x01, sp)
      009D0A 26 67            [ 1]  562 	jrne	00123$
                                    563 ;	./../../mib/stm8s_mib_debug_cmd.c: 257: return FALSE;
      009D0C 5F               [ 1]  564 	clrw	x
      009D0D CC 9D A7         [ 2]  565 	jp	00132$
                                    566 ;	./../../mib/stm8s_mib_debug_cmd.c: 259: break;
      009D10                        567 00110$:
                                    568 ;	./../../mib/stm8s_mib_debug_cmd.c: 261: c = *s++;
      009D10 1E 0C            [ 2]  569 	ldw	x, (0x0c, sp)
      009D12 5C               [ 1]  570 	incw	x
      009D13 1F 0C            [ 2]  571 	ldw	(0x0c, sp), x
                                    572 ;	./../../mib/stm8s_mib_debug_cmd.c: 264: c -= '0';
      009D15 97               [ 1]  573 	ld	xl, a
                                    574 ;	./../../mib/stm8s_mib_debug_cmd.c: 263: if (c >= '0' && c <= '9')
      009D16 A1 30            [ 1]  575 	cp	a, #0x30
      009D18 25 09            [ 1]  576 	jrc	00120$
      009D1A A1 39            [ 1]  577 	cp	a, #0x39
      009D1C 22 05            [ 1]  578 	jrugt	00120$
                                    579 ;	./../../mib/stm8s_mib_debug_cmd.c: 264: c -= '0';
      009D1E 9F               [ 1]  580 	ld	a, xl
      009D1F A0 30            [ 1]  581 	sub	a, #0x30
      009D21 20 1D            [ 2]  582 	jra	00121$
      009D23                        583 00120$:
                                    584 ;	./../../mib/stm8s_mib_debug_cmd.c: 265: else if (c >= 'a' && c <= 'f')
      009D23 A1 61            [ 1]  585 	cp	a, #0x61
      009D25 25 09            [ 1]  586 	jrc	00116$
      009D27 A1 66            [ 1]  587 	cp	a, #0x66
      009D29 22 05            [ 1]  588 	jrugt	00116$
                                    589 ;	./../../mib/stm8s_mib_debug_cmd.c: 266: c = c - 'a' + 10;
      009D2B 9F               [ 1]  590 	ld	a, xl
      009D2C AB A9            [ 1]  591 	add	a, #0xa9
      009D2E 20 10            [ 2]  592 	jra	00121$
      009D30                        593 00116$:
                                    594 ;	./../../mib/stm8s_mib_debug_cmd.c: 267: else if (c >= 'A' && c <= 'F')
      009D30 A1 41            [ 1]  595 	cp	a, #0x41
      009D32 25 09            [ 1]  596 	jrc	00112$
      009D34 A1 46            [ 1]  597 	cp	a, #0x46
      009D36 22 05            [ 1]  598 	jrugt	00112$
                                    599 ;	./../../mib/stm8s_mib_debug_cmd.c: 268: c = c - 'A' + 10;
      009D38 9F               [ 1]  600 	ld	a, xl
      009D39 AB C9            [ 1]  601 	add	a, #0xc9
      009D3B 20 03            [ 2]  602 	jra	00121$
      009D3D                        603 00112$:
                                    604 ;	./../../mib/stm8s_mib_debug_cmd.c: 270: return FALSE;
      009D3D 5F               [ 1]  605 	clrw	x
      009D3E 20 67            [ 2]  606 	jra	00132$
      009D40                        607 00121$:
                                    608 ;	./../../mib/stm8s_mib_debug_cmd.c: 272: rval = rval << 4 | c;
      009D40 88               [ 1]  609 	push	a
      009D41 1E 05            [ 2]  610 	ldw	x, (0x05, sp)
      009D43 16 03            [ 2]  611 	ldw	y, (0x03, sp)
      009D45 A6 04            [ 1]  612 	ld	a, #0x04
      009D47                        613 00222$:
      009D47 58               [ 2]  614 	sllw	x
      009D48 90 59            [ 2]  615 	rlcw	y
      009D4A 4A               [ 1]  616 	dec	a
      009D4B 26 FA            [ 1]  617 	jrne	00222$
      009D4D 84               [ 1]  618 	pop	a
      009D4E 0F 08            [ 1]  619 	clr	(0x08, sp)
      009D50 0F 07            [ 1]  620 	clr	(0x07, sp)
      009D52 0F 06            [ 1]  621 	clr	(0x06, sp)
      009D54 89               [ 2]  622 	pushw	x
      009D55 1A 02            [ 1]  623 	or	a, (2, sp)
      009D57 85               [ 2]  624 	popw	x
      009D58 02               [ 1]  625 	rlwa	x
      009D59 1A 08            [ 1]  626 	or	a, (0x08, sp)
      009D5B 95               [ 1]  627 	ld	xh, a
      009D5C 90 9F            [ 1]  628 	ld	a, yl
      009D5E 1A 07            [ 1]  629 	or	a, (0x07, sp)
      009D60 90 02            [ 1]  630 	rlwa	y
      009D62 1A 06            [ 1]  631 	or	a, (0x06, sp)
      009D64 90 95            [ 1]  632 	ld	yh, a
      009D66 1F 04            [ 2]  633 	ldw	(0x04, sp), x
      009D68 17 02            [ 2]  634 	ldw	(0x02, sp), y
                                    635 ;	./../../mib/stm8s_mib_debug_cmd.c: 252: for (i = 0, rval = 0; i < type / 4; i++)
      009D6A 0C 0E            [ 1]  636 	inc	(0x0e, sp)
      009D6C 7B 0E            [ 1]  637 	ld	a, (0x0e, sp)
      009D6E 6B 01            [ 1]  638 	ld	(0x01, sp), a
      009D70 CC 9C F2         [ 2]  639 	jp	00130$
      009D73                        640 00123$:
                                    641 ;	./../../mib/stm8s_mib_debug_cmd.c: 275: switch (type)
      009D73 1E 06            [ 2]  642 	ldw	x, (0x06, sp)
      009D75 A3 00 08         [ 2]  643 	cpw	x, #0x0008
      009D78 27 10            [ 1]  644 	jreq	00124$
      009D7A 1E 06            [ 2]  645 	ldw	x, (0x06, sp)
      009D7C A3 00 10         [ 2]  646 	cpw	x, #0x0010
      009D7F 27 10            [ 1]  647 	jreq	00125$
      009D81 1E 06            [ 2]  648 	ldw	x, (0x06, sp)
      009D83 A3 00 20         [ 2]  649 	cpw	x, #0x0020
      009D86 27 10            [ 1]  650 	jreq	00126$
      009D88 20 19            [ 2]  651 	jra	00127$
                                    652 ;	./../../mib/stm8s_mib_debug_cmd.c: 277: case 8:
      009D8A                        653 00124$:
                                    654 ;	./../../mib/stm8s_mib_debug_cmd.c: 278: *(uint8_t *)retval = (uint8_t)rval;
      009D8A 1E 11            [ 2]  655 	ldw	x, (0x11, sp)
      009D8C 7B 05            [ 1]  656 	ld	a, (0x05, sp)
      009D8E F7               [ 1]  657 	ld	(x), a
                                    658 ;	./../../mib/stm8s_mib_debug_cmd.c: 279: break;
      009D8F 20 14            [ 2]  659 	jra	00128$
                                    660 ;	./../../mib/stm8s_mib_debug_cmd.c: 280: case 16:
      009D91                        661 00125$:
                                    662 ;	./../../mib/stm8s_mib_debug_cmd.c: 281: *(uint16_t *)retval = (uint16_t)rval;
      009D91 1E 11            [ 2]  663 	ldw	x, (0x11, sp)
      009D93 16 04            [ 2]  664 	ldw	y, (0x04, sp)
      009D95 FF               [ 2]  665 	ldw	(x), y
                                    666 ;	./../../mib/stm8s_mib_debug_cmd.c: 282: break;
      009D96 20 0D            [ 2]  667 	jra	00128$
                                    668 ;	./../../mib/stm8s_mib_debug_cmd.c: 283: case 32:
      009D98                        669 00126$:
                                    670 ;	./../../mib/stm8s_mib_debug_cmd.c: 284: *(uint32_t *)retval = (uint32_t)rval;
      009D98 1E 11            [ 2]  671 	ldw	x, (0x11, sp)
      009D9A 16 04            [ 2]  672 	ldw	y, (0x04, sp)
      009D9C EF 02            [ 2]  673 	ldw	(0x2, x), y
      009D9E 16 02            [ 2]  674 	ldw	y, (0x02, sp)
      009DA0 FF               [ 2]  675 	ldw	(x), y
                                    676 ;	./../../mib/stm8s_mib_debug_cmd.c: 285: break;
      009DA1 20 02            [ 2]  677 	jra	00128$
                                    678 ;	./../../mib/stm8s_mib_debug_cmd.c: 286: default:
      009DA3                        679 00127$:
                                    680 ;	./../../mib/stm8s_mib_debug_cmd.c: 287: return FALSE;
      009DA3 5F               [ 1]  681 	clrw	x
                                    682 ;	./../../mib/stm8s_mib_debug_cmd.c: 288: }
                                    683 ;	./../../mib/stm8s_mib_debug_cmd.c: 289: return TRUE;
      009DA4 C5                     684 	.byte 0xc5
      009DA5                        685 00128$:
      009DA5 5F               [ 1]  686 	clrw	x
      009DA6 5C               [ 1]  687 	incw	x
      009DA7                        688 00132$:
                                    689 ;	./../../mib/stm8s_mib_debug_cmd.c: 290: } // HexToInt.
      009DA7 16 0F            [ 2]  690 	ldw	y, (15, sp)
      009DA9 5B 14            [ 2]  691 	addw	sp, #20
      009DAB 90 FC            [ 2]  692 	jp	(y)
                                    693 ;	./../../mib/stm8s_mib_debug_cmd.c: 300: int DecToLong(char *s, void *retval, uint16_t type)
                                    694 ;	-----------------------------------------
                                    695 ;	 function DecToLong
                                    696 ;	-----------------------------------------
      009DAD                        697 _DecToLong:
      009DAD 52 0E            [ 2]  698 	sub	sp, #14
                                    699 ;	./../../mib/stm8s_mib_debug_cmd.c: 305: if (!s || !s[0] || !retval)
      009DAF 5D               [ 2]  700 	tnzw	x
      009DB0 27 07            [ 1]  701 	jreq	00101$
      009DB2 F6               [ 1]  702 	ld	a, (x)
      009DB3 27 04            [ 1]  703 	jreq	00101$
      009DB5 16 11            [ 2]  704 	ldw	y, (0x11, sp)
      009DB7 26 03            [ 1]  705 	jrne	00102$
      009DB9                        706 00101$:
                                    707 ;	./../../mib/stm8s_mib_debug_cmd.c: 306: return FALSE;
      009DB9 5F               [ 1]  708 	clrw	x
      009DBA 20 73            [ 2]  709 	jra	00117$
      009DBC                        710 00102$:
                                    711 ;	./../../mib/stm8s_mib_debug_cmd.c: 308: for (rval= 0; *s; s++)
      009DBC 90 5F            [ 1]  712 	clrw	y
      009DBE 17 09            [ 2]  713 	ldw	(0x09, sp), y
      009DC0 1F 0D            [ 2]  714 	ldw	(0x0d, sp), x
      009DC2                        715 00115$:
      009DC2 1E 0D            [ 2]  716 	ldw	x, (0x0d, sp)
      009DC4 F6               [ 1]  717 	ld	a, (x)
      009DC5 27 3C            [ 1]  718 	jreq	00108$
                                    719 ;	./../../mib/stm8s_mib_debug_cmd.c: 310: if (*s < '0' || *s > '9')
      009DC7 A1 30            [ 1]  720 	cp	a, #0x30
      009DC9 25 04            [ 1]  721 	jrc	00105$
      009DCB A1 39            [ 1]  722 	cp	a, #0x39
      009DCD 23 03            [ 2]  723 	jrule	00106$
      009DCF                        724 00105$:
                                    725 ;	./../../mib/stm8s_mib_debug_cmd.c: 311: return FALSE;
      009DCF 5F               [ 1]  726 	clrw	x
      009DD0 20 5D            [ 2]  727 	jra	00117$
      009DD2                        728 00106$:
                                    729 ;	./../../mib/stm8s_mib_debug_cmd.c: 312: c = *s - '0';
      009DD2 A0 30            [ 1]  730 	sub	a, #0x30
                                    731 ;	./../../mib/stm8s_mib_debug_cmd.c: 313: rval = rval * 10 + c;
      009DD4 88               [ 1]  732 	push	a
      009DD5 90 89            [ 2]  733 	pushw	y
      009DD7 1E 0C            [ 2]  734 	ldw	x, (0x0c, sp)
      009DD9 89               [ 2]  735 	pushw	x
      009DDA 4B 0A            [ 1]  736 	push	#0x0a
      009DDC 5F               [ 1]  737 	clrw	x
      009DDD 89               [ 2]  738 	pushw	x
      009DDE 4B 00            [ 1]  739 	push	#0x00
      009DE0 CD AC A3         [ 4]  740 	call	__mullong
      009DE3 5B 08            [ 2]  741 	addw	sp, #8
      009DE5 1F 04            [ 2]  742 	ldw	(0x04, sp), x
      009DE7 84               [ 1]  743 	pop	a
      009DE8 5F               [ 1]  744 	clrw	x
      009DE9 1F 05            [ 2]  745 	ldw	(0x05, sp), x
      009DEB 97               [ 1]  746 	ld	xl, a
      009DEC 72 FB 03         [ 2]  747 	addw	x, (0x03, sp)
      009DEF 90 9F            [ 1]  748 	ld	a, yl
      009DF1 19 06            [ 1]  749 	adc	a, (0x06, sp)
      009DF3 6B 0A            [ 1]  750 	ld	(0x0a, sp), a
      009DF5 90 9E            [ 1]  751 	ld	a, yh
      009DF7 19 05            [ 1]  752 	adc	a, (0x05, sp)
      009DF9 6B 09            [ 1]  753 	ld	(0x09, sp), a
      009DFB 51               [ 1]  754 	exgw	x, y
                                    755 ;	./../../mib/stm8s_mib_debug_cmd.c: 308: for (rval= 0; *s; s++)
      009DFC 1E 0D            [ 2]  756 	ldw	x, (0x0d, sp)
      009DFE 5C               [ 1]  757 	incw	x
      009DFF 1F 0D            [ 2]  758 	ldw	(0x0d, sp), x
      009E01 20 BF            [ 2]  759 	jra	00115$
      009E03                        760 00108$:
                                    761 ;	./../../mib/stm8s_mib_debug_cmd.c: 316: switch (type)
      009E03 1E 13            [ 2]  762 	ldw	x, (0x13, sp)
      009E05 A3 00 08         [ 2]  763 	cpw	x, #0x0008
      009E08 27 0C            [ 1]  764 	jreq	00109$
      009E0A A3 00 10         [ 2]  765 	cpw	x, #0x0010
      009E0D 27 0E            [ 1]  766 	jreq	00110$
      009E0F A3 00 20         [ 2]  767 	cpw	x, #0x0020
      009E12 27 0E            [ 1]  768 	jreq	00111$
      009E14 20 15            [ 2]  769 	jra	00112$
                                    770 ;	./../../mib/stm8s_mib_debug_cmd.c: 318: case 8:
      009E16                        771 00109$:
                                    772 ;	./../../mib/stm8s_mib_debug_cmd.c: 319: *(uint8_t *)retval = (uint8_t)rval;
      009E16 1E 11            [ 2]  773 	ldw	x, (0x11, sp)
      009E18 90 9F            [ 1]  774 	ld	a, yl
      009E1A F7               [ 1]  775 	ld	(x), a
                                    776 ;	./../../mib/stm8s_mib_debug_cmd.c: 320: break;
      009E1B 20 10            [ 2]  777 	jra	00113$
                                    778 ;	./../../mib/stm8s_mib_debug_cmd.c: 321: case 16:
      009E1D                        779 00110$:
                                    780 ;	./../../mib/stm8s_mib_debug_cmd.c: 322: *(uint16_t *)retval = (uint16_t)rval;
      009E1D 1E 11            [ 2]  781 	ldw	x, (0x11, sp)
      009E1F FF               [ 2]  782 	ldw	(x), y
                                    783 ;	./../../mib/stm8s_mib_debug_cmd.c: 323: break;
      009E20 20 0B            [ 2]  784 	jra	00113$
                                    785 ;	./../../mib/stm8s_mib_debug_cmd.c: 324: case 32:
      009E22                        786 00111$:
                                    787 ;	./../../mib/stm8s_mib_debug_cmd.c: 325: *(uint32_t *)retval = (uint32_t)rval;
      009E22 1E 11            [ 2]  788 	ldw	x, (0x11, sp)
      009E24 EF 02            [ 2]  789 	ldw	(0x2, x), y
      009E26 16 09            [ 2]  790 	ldw	y, (0x09, sp)
      009E28 FF               [ 2]  791 	ldw	(x), y
                                    792 ;	./../../mib/stm8s_mib_debug_cmd.c: 326: break;
      009E29 20 02            [ 2]  793 	jra	00113$
                                    794 ;	./../../mib/stm8s_mib_debug_cmd.c: 327: default:
      009E2B                        795 00112$:
                                    796 ;	./../../mib/stm8s_mib_debug_cmd.c: 328: return FALSE;
      009E2B 5F               [ 1]  797 	clrw	x
                                    798 ;	./../../mib/stm8s_mib_debug_cmd.c: 329: }
                                    799 ;	./../../mib/stm8s_mib_debug_cmd.c: 330: return TRUE;
      009E2C C5                     800 	.byte 0xc5
      009E2D                        801 00113$:
      009E2D 5F               [ 1]  802 	clrw	x
      009E2E 5C               [ 1]  803 	incw	x
      009E2F                        804 00117$:
                                    805 ;	./../../mib/stm8s_mib_debug_cmd.c: 331: } // DecToLong.
      009E2F 16 0F            [ 2]  806 	ldw	y, (15, sp)
      009E31 5B 14            [ 2]  807 	addw	sp, #20
      009E33 90 FC            [ 2]  808 	jp	(y)
                                    809 ;	./../../mib/stm8s_mib_debug_cmd.c: 340: void HexDump(uint32_t addr, uint32_t len)
                                    810 ;	-----------------------------------------
                                    811 ;	 function HexDump
                                    812 ;	-----------------------------------------
      009E35                        813 _HexDump:
      009E35 52 27            [ 2]  814 	sub	sp, #39
                                    815 ;	./../../mib/stm8s_mib_debug_cmd.c: 343: uint32_t endPtr = (addr + len);
      009E37 16 2C            [ 2]  816 	ldw	y, (0x2c, sp)
      009E39 72 F9 30         [ 2]  817 	addw	y, (0x30, sp)
      009E3C 1E 2A            [ 2]  818 	ldw	x, (0x2a, sp)
      009E3E 24 01            [ 1]  819 	jrnc	00240$
      009E40 5C               [ 1]  820 	incw	x
      009E41                        821 00240$:
      009E41 72 FB 2E         [ 2]  822 	addw	x, (0x2e, sp)
      009E44 17 17            [ 2]  823 	ldw	(0x17, sp), y
      009E46 1F 15            [ 2]  824 	ldw	(0x15, sp), x
                                    825 ;	./../../mib/stm8s_mib_debug_cmd.c: 344: int i, remainder = len & 0xf;
      009E48 1E 30            [ 2]  826 	ldw	x, (0x30, sp)
      009E4A 9F               [ 1]  827 	ld	a, xl
      009E4B A4 0F            [ 1]  828 	and	a, #0x0f
      009E4D 6B 1A            [ 1]  829 	ld	(0x1a, sp), a
      009E4F 0F 19            [ 1]  830 	clr	(0x19, sp)
                                    831 ;	./../../mib/stm8s_mib_debug_cmd.c: 350: mib_printf("\r\n");
      009E51 4B 28            [ 1]  832 	push	#<(___str_0+0)
      009E53 4B 84            [ 1]  833 	push	#((___str_0+0) >> 8)
      009E55 CD 99 C0         [ 4]  834 	call	_mib_printf
      009E58 5B 02            [ 2]  835 	addw	sp, #2
                                    836 ;	./../../mib/stm8s_mib_debug_cmd.c: 351: mib_printf("address     Hex Value                                        Ascii value\r\n");
      009E5A 4B 32            [ 1]  837 	push	#<(___str_3+0)
      009E5C 4B 84            [ 1]  838 	push	#((___str_3+0) >> 8)
      009E5E CD 99 C0         [ 4]  839 	call	_mib_printf
      009E61 5B 02            [ 2]  840 	addw	sp, #2
                                    841 ;	./../../mib/stm8s_mib_debug_cmd.c: 354: p_address = (uint32_t)(addr);
      009E63 1E 2C            [ 2]  842 	ldw	x, (0x2c, sp)
      009E65 16 2A            [ 2]  843 	ldw	y, (0x2a, sp)
                                    844 ;	./../../mib/stm8s_mib_debug_cmd.c: 355: p_data_ptr = (uint16_t *)p_data;
                                    845 ;	./../../mib/stm8s_mib_debug_cmd.c: 356: while ((p_address + 16) <= endPtr)
      009E67 1F 1D            [ 2]  846 	ldw	(0x1d, sp), x
      009E69 17 1B            [ 2]  847 	ldw	(0x1b, sp), y
      009E6B                        848 00107$:
      009E6B 1E 1D            [ 2]  849 	ldw	x, (0x1d, sp)
      009E6D 1C 00 10         [ 2]  850 	addw	x, #0x0010
      009E70 1F 21            [ 2]  851 	ldw	(0x21, sp), x
      009E72 7B 1C            [ 1]  852 	ld	a, (0x1c, sp)
      009E74 A9 00            [ 1]  853 	adc	a, #0x00
      009E76 6B 20            [ 1]  854 	ld	(0x20, sp), a
      009E78 7B 1B            [ 1]  855 	ld	a, (0x1b, sp)
      009E7A A9 00            [ 1]  856 	adc	a, #0x00
      009E7C 6B 1F            [ 1]  857 	ld	(0x1f, sp), a
      009E7E 1E 17            [ 2]  858 	ldw	x, (0x17, sp)
      009E80 13 21            [ 2]  859 	cpw	x, (0x21, sp)
      009E82 7B 16            [ 1]  860 	ld	a, (0x16, sp)
      009E84 12 20            [ 1]  861 	sbc	a, (0x20, sp)
      009E86 7B 15            [ 1]  862 	ld	a, (0x15, sp)
      009E88 12 1F            [ 1]  863 	sbc	a, (0x1f, sp)
      009E8A 24 03            [ 1]  864 	jrnc	00241$
      009E8C CC 9F 4F         [ 2]  865 	jp	00163$
      009E8F                        866 00241$:
                                    867 ;	./../../mib/stm8s_mib_debug_cmd.c: 358: mib_printf("0x%08lx : ", p_address);
      009E8F 1E 1D            [ 2]  868 	ldw	x, (0x1d, sp)
      009E91 89               [ 2]  869 	pushw	x
      009E92 1E 1D            [ 2]  870 	ldw	x, (0x1d, sp)
      009E94 89               [ 2]  871 	pushw	x
      009E95 4B 7D            [ 1]  872 	push	#<(___str_4+0)
      009E97 4B 84            [ 1]  873 	push	#((___str_4+0) >> 8)
      009E99 CD 99 C0         [ 4]  874 	call	_mib_printf
      009E9C 5B 06            [ 2]  875 	addw	sp, #6
                                    876 ;	./../../mib/stm8s_mib_debug_cmd.c: 359: for (i = 0; i < 8; i++)
      009E9E 5F               [ 1]  877 	clrw	x
      009E9F 1F 26            [ 2]  878 	ldw	(0x26, sp), x
      009EA1                        879 00120$:
                                    880 ;	./../../mib/stm8s_mib_debug_cmd.c: 361: p_data_ptr[i] = rd_ADDR16(p_address + i * 2);
      009EA1 16 26            [ 2]  881 	ldw	y, (0x26, sp)
      009EA3 90 58            [ 2]  882 	sllw	y
      009EA5 93               [ 1]  883 	ldw	x, y
      009EA6 89               [ 2]  884 	pushw	x
      009EA7 96               [ 1]  885 	ldw	x, sp
      009EA8 1C 00 03         [ 2]  886 	addw	x, #3
      009EAB 72 FB 01         [ 2]  887 	addw	x, (1, sp)
      009EAE 5B 02            [ 2]  888 	addw	sp, #2
      009EB0 17 24            [ 2]  889 	ldw	(0x24, sp), y
      009EB2 16 1D            [ 2]  890 	ldw	y, (0x1d, sp)
      009EB4 72 F9 24         [ 2]  891 	addw	y, (0x24, sp)
      009EB7 90 FE            [ 2]  892 	ldw	y, (y)
      009EB9 FF               [ 2]  893 	ldw	(x), y
                                    894 ;	./../../mib/stm8s_mib_debug_cmd.c: 362: mib_printf("%02x ", p_data[i * 2]);
      009EBA 7B 27            [ 1]  895 	ld	a, (0x27, sp)
      009EBC 48               [ 1]  896 	sll	a
      009EBD 6B 23            [ 1]  897 	ld	(0x23, sp), a
      009EBF 6B 25            [ 1]  898 	ld	(0x25, sp), a
      009EC1 49               [ 1]  899 	rlc	a
      009EC2 4F               [ 1]  900 	clr	a
      009EC3 A2 00            [ 1]  901 	sbc	a, #0x00
      009EC5 6B 24            [ 1]  902 	ld	(0x24, sp), a
      009EC7 96               [ 1]  903 	ldw	x, sp
      009EC8 5C               [ 1]  904 	incw	x
      009EC9 72 FB 24         [ 2]  905 	addw	x, (0x24, sp)
      009ECC F6               [ 1]  906 	ld	a, (x)
      009ECD 5F               [ 1]  907 	clrw	x
      009ECE 97               [ 1]  908 	ld	xl, a
      009ECF 89               [ 2]  909 	pushw	x
      009ED0 4B 88            [ 1]  910 	push	#<(___str_5+0)
      009ED2 4B 84            [ 1]  911 	push	#((___str_5+0) >> 8)
      009ED4 CD 99 C0         [ 4]  912 	call	_mib_printf
      009ED7 5B 04            [ 2]  913 	addw	sp, #4
                                    914 ;	./../../mib/stm8s_mib_debug_cmd.c: 363: mib_printf("%02x ", p_data[i * 2 + 1]);
      009ED9 7B 23            [ 1]  915 	ld	a, (0x23, sp)
      009EDB 4C               [ 1]  916 	inc	a
      009EDC 6B 25            [ 1]  917 	ld	(0x25, sp), a
      009EDE 49               [ 1]  918 	rlc	a
      009EDF 4F               [ 1]  919 	clr	a
      009EE0 A2 00            [ 1]  920 	sbc	a, #0x00
      009EE2 6B 24            [ 1]  921 	ld	(0x24, sp), a
      009EE4 96               [ 1]  922 	ldw	x, sp
      009EE5 5C               [ 1]  923 	incw	x
      009EE6 72 FB 24         [ 2]  924 	addw	x, (0x24, sp)
      009EE9 F6               [ 1]  925 	ld	a, (x)
      009EEA 5F               [ 1]  926 	clrw	x
      009EEB 97               [ 1]  927 	ld	xl, a
      009EEC 89               [ 2]  928 	pushw	x
      009EED 4B 88            [ 1]  929 	push	#<(___str_5+0)
      009EEF 4B 84            [ 1]  930 	push	#((___str_5+0) >> 8)
      009EF1 CD 99 C0         [ 4]  931 	call	_mib_printf
      009EF4 5B 04            [ 2]  932 	addw	sp, #4
                                    933 ;	./../../mib/stm8s_mib_debug_cmd.c: 359: for (i = 0; i < 8; i++)
      009EF6 1E 26            [ 2]  934 	ldw	x, (0x26, sp)
      009EF8 5C               [ 1]  935 	incw	x
      009EF9 1F 26            [ 2]  936 	ldw	(0x26, sp), x
      009EFB A3 00 08         [ 2]  937 	cpw	x, #0x0008
      009EFE 2F A1            [ 1]  938 	jrslt	00120$
                                    939 ;	./../../mib/stm8s_mib_debug_cmd.c: 365: mib_printf(" ");
      009F00 4B 8E            [ 1]  940 	push	#<(___str_6+0)
      009F02 4B 84            [ 1]  941 	push	#((___str_6+0) >> 8)
      009F04 CD 99 C0         [ 4]  942 	call	_mib_printf
      009F07 5B 02            [ 2]  943 	addw	sp, #2
                                    944 ;	./../../mib/stm8s_mib_debug_cmd.c: 366: for (i = 0; i < 16; i++)
      009F09 5F               [ 1]  945 	clrw	x
      009F0A 1F 26            [ 2]  946 	ldw	(0x26, sp), x
      009F0C                        947 00122$:
                                    948 ;	./../../mib/stm8s_mib_debug_cmd.c: 368: c = p_data[i];
      009F0C 96               [ 1]  949 	ldw	x, sp
      009F0D 5C               [ 1]  950 	incw	x
      009F0E 72 FB 26         [ 2]  951 	addw	x, (0x26, sp)
      009F11 F6               [ 1]  952 	ld	a, (x)
                                    953 ;	./../../mib/stm8s_mib_debug_cmd.c: 369: if (c >= 32 && c <= 125)
      009F12 A1 20            [ 1]  954 	cp	a, #0x20
      009F14 25 12            [ 1]  955 	jrc	00103$
      009F16 A1 7D            [ 1]  956 	cp	a, #0x7d
      009F18 22 0E            [ 1]  957 	jrugt	00103$
                                    958 ;	./../../mib/stm8s_mib_debug_cmd.c: 370: mib_printf("%c", c);
      009F1A 5F               [ 1]  959 	clrw	x
      009F1B 97               [ 1]  960 	ld	xl, a
      009F1C 89               [ 2]  961 	pushw	x
      009F1D 4B 90            [ 1]  962 	push	#<(___str_7+0)
      009F1F 4B 84            [ 1]  963 	push	#((___str_7+0) >> 8)
      009F21 CD 99 C0         [ 4]  964 	call	_mib_printf
      009F24 5B 04            [ 2]  965 	addw	sp, #4
      009F26 20 09            [ 2]  966 	jra	00123$
      009F28                        967 00103$:
                                    968 ;	./../../mib/stm8s_mib_debug_cmd.c: 372: mib_printf(".");
      009F28 4B 93            [ 1]  969 	push	#<(___str_8+0)
      009F2A 4B 84            [ 1]  970 	push	#((___str_8+0) >> 8)
      009F2C CD 99 C0         [ 4]  971 	call	_mib_printf
      009F2F 5B 02            [ 2]  972 	addw	sp, #2
      009F31                        973 00123$:
                                    974 ;	./../../mib/stm8s_mib_debug_cmd.c: 366: for (i = 0; i < 16; i++)
      009F31 1E 26            [ 2]  975 	ldw	x, (0x26, sp)
      009F33 5C               [ 1]  976 	incw	x
      009F34 1F 26            [ 2]  977 	ldw	(0x26, sp), x
      009F36 A3 00 10         [ 2]  978 	cpw	x, #0x0010
      009F39 2F D1            [ 1]  979 	jrslt	00122$
                                    980 ;	./../../mib/stm8s_mib_debug_cmd.c: 374: p_address += 16;
      009F3B 16 21            [ 2]  981 	ldw	y, (0x21, sp)
      009F3D 17 1D            [ 2]  982 	ldw	(0x1d, sp), y
      009F3F 16 1F            [ 2]  983 	ldw	y, (0x1f, sp)
      009F41 17 1B            [ 2]  984 	ldw	(0x1b, sp), y
                                    985 ;	./../../mib/stm8s_mib_debug_cmd.c: 376: mib_printf("\r\n");
      009F43 4B 28            [ 1]  986 	push	#<(___str_0+0)
      009F45 4B 84            [ 1]  987 	push	#((___str_0+0) >> 8)
      009F47 CD 99 C0         [ 4]  988 	call	_mib_printf
      009F4A 5B 02            [ 2]  989 	addw	sp, #2
      009F4C CC 9E 6B         [ 2]  990 	jp	00107$
      009F4F                        991 00163$:
      009F4F 16 1D            [ 2]  992 	ldw	y, (0x1d, sp)
      009F51 17 24            [ 2]  993 	ldw	(0x24, sp), y
      009F53 16 1B            [ 2]  994 	ldw	y, (0x1b, sp)
      009F55 17 22            [ 2]  995 	ldw	(0x22, sp), y
                                    996 ;	./../../mib/stm8s_mib_debug_cmd.c: 380: if (remainder)
      009F57 1E 19            [ 2]  997 	ldw	x, (0x19, sp)
      009F59 26 03            [ 1]  998 	jrne	00248$
      009F5B CC A0 6B         [ 2]  999 	jp	00119$
      009F5E                       1000 00248$:
                                   1001 ;	./../../mib/stm8s_mib_debug_cmd.c: 382: mib_printf("0x%08lx  ", p_address);
      009F5E 1E 1D            [ 2] 1002 	ldw	x, (0x1d, sp)
      009F60 89               [ 2] 1003 	pushw	x
      009F61 1E 1D            [ 2] 1004 	ldw	x, (0x1d, sp)
      009F63 89               [ 2] 1005 	pushw	x
      009F64 4B 95            [ 1] 1006 	push	#<(___str_9+0)
      009F66 4B 84            [ 1] 1007 	push	#((___str_9+0) >> 8)
      009F68 CD 99 C0         [ 4] 1008 	call	_mib_printf
      009F6B 5B 06            [ 2] 1009 	addw	sp, #6
                                   1010 ;	./../../mib/stm8s_mib_debug_cmd.c: 383: for (i = 0; i < (remainder >> 1); i++)
      009F6D 1E 19            [ 2] 1011 	ldw	x, (0x19, sp)
      009F6F 57               [ 2] 1012 	sraw	x
      009F70 1F 1D            [ 2] 1013 	ldw	(0x1d, sp), x
      009F72 5F               [ 1] 1014 	clrw	x
      009F73 1F 26            [ 2] 1015 	ldw	(0x26, sp), x
      009F75                       1016 00125$:
      009F75 1E 26            [ 2] 1017 	ldw	x, (0x26, sp)
      009F77 13 1D            [ 2] 1018 	cpw	x, (0x1d, sp)
      009F79 2E 5C            [ 1] 1019 	jrsge	00110$
                                   1020 ;	./../../mib/stm8s_mib_debug_cmd.c: 385: p_data_ptr[i] = rd_ADDR16(p_address + i * 2);
      009F7B 16 26            [ 2] 1021 	ldw	y, (0x26, sp)
      009F7D 90 58            [ 2] 1022 	sllw	y
      009F7F 93               [ 1] 1023 	ldw	x, y
      009F80 89               [ 2] 1024 	pushw	x
      009F81 96               [ 1] 1025 	ldw	x, sp
      009F82 1C 00 03         [ 2] 1026 	addw	x, #3
      009F85 72 FB 01         [ 2] 1027 	addw	x, (1, sp)
      009F88 5B 02            [ 2] 1028 	addw	sp, #2
      009F8A 17 20            [ 2] 1029 	ldw	(0x20, sp), y
      009F8C 16 24            [ 2] 1030 	ldw	y, (0x24, sp)
      009F8E 72 F9 20         [ 2] 1031 	addw	y, (0x20, sp)
      009F91 90 FE            [ 2] 1032 	ldw	y, (y)
      009F93 FF               [ 2] 1033 	ldw	(x), y
                                   1034 ;	./../../mib/stm8s_mib_debug_cmd.c: 386: mib_printf("%02x ", p_data[i * 2]);
      009F94 7B 27            [ 1] 1035 	ld	a, (0x27, sp)
      009F96 48               [ 1] 1036 	sll	a
      009F97 6B 1F            [ 1] 1037 	ld	(0x1f, sp), a
      009F99 6B 21            [ 1] 1038 	ld	(0x21, sp), a
      009F9B 49               [ 1] 1039 	rlc	a
      009F9C 4F               [ 1] 1040 	clr	a
      009F9D A2 00            [ 1] 1041 	sbc	a, #0x00
      009F9F 6B 20            [ 1] 1042 	ld	(0x20, sp), a
      009FA1 96               [ 1] 1043 	ldw	x, sp
      009FA2 5C               [ 1] 1044 	incw	x
      009FA3 72 FB 20         [ 2] 1045 	addw	x, (0x20, sp)
      009FA6 F6               [ 1] 1046 	ld	a, (x)
      009FA7 5F               [ 1] 1047 	clrw	x
      009FA8 97               [ 1] 1048 	ld	xl, a
      009FA9 89               [ 2] 1049 	pushw	x
      009FAA 4B 88            [ 1] 1050 	push	#<(___str_5+0)
      009FAC 4B 84            [ 1] 1051 	push	#((___str_5+0) >> 8)
      009FAE CD 99 C0         [ 4] 1052 	call	_mib_printf
      009FB1 5B 04            [ 2] 1053 	addw	sp, #4
                                   1054 ;	./../../mib/stm8s_mib_debug_cmd.c: 387: mib_printf("%02x ", p_data[i * 2 + 1]);
      009FB3 7B 1F            [ 1] 1055 	ld	a, (0x1f, sp)
      009FB5 4C               [ 1] 1056 	inc	a
      009FB6 6B 21            [ 1] 1057 	ld	(0x21, sp), a
      009FB8 49               [ 1] 1058 	rlc	a
      009FB9 4F               [ 1] 1059 	clr	a
      009FBA A2 00            [ 1] 1060 	sbc	a, #0x00
      009FBC 6B 20            [ 1] 1061 	ld	(0x20, sp), a
      009FBE 96               [ 1] 1062 	ldw	x, sp
      009FBF 5C               [ 1] 1063 	incw	x
      009FC0 72 FB 20         [ 2] 1064 	addw	x, (0x20, sp)
      009FC3 F6               [ 1] 1065 	ld	a, (x)
      009FC4 5F               [ 1] 1066 	clrw	x
      009FC5 97               [ 1] 1067 	ld	xl, a
      009FC6 89               [ 2] 1068 	pushw	x
      009FC7 4B 88            [ 1] 1069 	push	#<(___str_5+0)
      009FC9 4B 84            [ 1] 1070 	push	#((___str_5+0) >> 8)
      009FCB CD 99 C0         [ 4] 1071 	call	_mib_printf
      009FCE 5B 04            [ 2] 1072 	addw	sp, #4
                                   1073 ;	./../../mib/stm8s_mib_debug_cmd.c: 383: for (i = 0; i < (remainder >> 1); i++)
      009FD0 1E 26            [ 2] 1074 	ldw	x, (0x26, sp)
      009FD2 5C               [ 1] 1075 	incw	x
      009FD3 1F 26            [ 2] 1076 	ldw	(0x26, sp), x
      009FD5 20 9E            [ 2] 1077 	jra	00125$
      009FD7                       1078 00110$:
                                   1079 ;	./../../mib/stm8s_mib_debug_cmd.c: 389: for (i = 0; i < (16 - (remainder >> 1) * 2); i++)
      009FD7 1E 1D            [ 2] 1080 	ldw	x, (0x1d, sp)
      009FD9 58               [ 2] 1081 	sllw	x
      009FDA 1F 26            [ 2] 1082 	ldw	(0x26, sp), x
      009FDC A6 10            [ 1] 1083 	ld	a, #0x10
      009FDE 10 27            [ 1] 1084 	sub	a, (0x27, sp)
      009FE0 6B 25            [ 1] 1085 	ld	(0x25, sp), a
      009FE2 4F               [ 1] 1086 	clr	a
      009FE3 12 26            [ 1] 1087 	sbc	a, (0x26, sp)
      009FE5 6B 24            [ 1] 1088 	ld	(0x24, sp), a
      009FE7 5F               [ 1] 1089 	clrw	x
      009FE8 1F 26            [ 2] 1090 	ldw	(0x26, sp), x
      009FEA                       1091 00128$:
      009FEA 1E 26            [ 2] 1092 	ldw	x, (0x26, sp)
      009FEC 13 24            [ 2] 1093 	cpw	x, (0x24, sp)
      009FEE 2E 10            [ 1] 1094 	jrsge	00111$
                                   1095 ;	./../../mib/stm8s_mib_debug_cmd.c: 391: mib_printf("   ");
      009FF0 4B 9F            [ 1] 1096 	push	#<(___str_10+0)
      009FF2 4B 84            [ 1] 1097 	push	#((___str_10+0) >> 8)
      009FF4 CD 99 C0         [ 4] 1098 	call	_mib_printf
      009FF7 5B 02            [ 2] 1099 	addw	sp, #2
                                   1100 ;	./../../mib/stm8s_mib_debug_cmd.c: 389: for (i = 0; i < (16 - (remainder >> 1) * 2); i++)
      009FF9 1E 26            [ 2] 1101 	ldw	x, (0x26, sp)
      009FFB 5C               [ 1] 1102 	incw	x
      009FFC 1F 26            [ 2] 1103 	ldw	(0x26, sp), x
      009FFE 20 EA            [ 2] 1104 	jra	00128$
      00A000                       1105 00111$:
                                   1106 ;	./../../mib/stm8s_mib_debug_cmd.c: 393: mib_printf(" ");
      00A000 4B 8E            [ 1] 1107 	push	#<(___str_6+0)
      00A002 4B 84            [ 1] 1108 	push	#((___str_6+0) >> 8)
      00A004 CD 99 C0         [ 4] 1109 	call	_mib_printf
      00A007 5B 02            [ 2] 1110 	addw	sp, #2
                                   1111 ;	./../../mib/stm8s_mib_debug_cmd.c: 394: for (i = 0; i < remainder; i++)
      00A009 5F               [ 1] 1112 	clrw	x
      00A00A 1F 26            [ 2] 1113 	ldw	(0x26, sp), x
      00A00C                       1114 00131$:
      00A00C 1E 26            [ 2] 1115 	ldw	x, (0x26, sp)
      00A00E 13 19            [ 2] 1116 	cpw	x, (0x19, sp)
      00A010 2E 2C            [ 1] 1117 	jrsge	00116$
                                   1118 ;	./../../mib/stm8s_mib_debug_cmd.c: 396: c = p_data[i];
      00A012 96               [ 1] 1119 	ldw	x, sp
      00A013 5C               [ 1] 1120 	incw	x
      00A014 72 FB 26         [ 2] 1121 	addw	x, (0x26, sp)
      00A017 F6               [ 1] 1122 	ld	a, (x)
                                   1123 ;	./../../mib/stm8s_mib_debug_cmd.c: 397: if (c >= 32 && c <= 125)
      00A018 A1 20            [ 1] 1124 	cp	a, #0x20
      00A01A 25 12            [ 1] 1125 	jrc	00113$
      00A01C A1 7D            [ 1] 1126 	cp	a, #0x7d
      00A01E 22 0E            [ 1] 1127 	jrugt	00113$
                                   1128 ;	./../../mib/stm8s_mib_debug_cmd.c: 398: mib_printf("%c", c);
      00A020 5F               [ 1] 1129 	clrw	x
      00A021 97               [ 1] 1130 	ld	xl, a
      00A022 89               [ 2] 1131 	pushw	x
      00A023 4B 90            [ 1] 1132 	push	#<(___str_7+0)
      00A025 4B 84            [ 1] 1133 	push	#((___str_7+0) >> 8)
      00A027 CD 99 C0         [ 4] 1134 	call	_mib_printf
      00A02A 5B 04            [ 2] 1135 	addw	sp, #4
      00A02C 20 09            [ 2] 1136 	jra	00132$
      00A02E                       1137 00113$:
                                   1138 ;	./../../mib/stm8s_mib_debug_cmd.c: 400: mib_printf(".");
      00A02E 4B 93            [ 1] 1139 	push	#<(___str_8+0)
      00A030 4B 84            [ 1] 1140 	push	#((___str_8+0) >> 8)
      00A032 CD 99 C0         [ 4] 1141 	call	_mib_printf
      00A035 5B 02            [ 2] 1142 	addw	sp, #2
      00A037                       1143 00132$:
                                   1144 ;	./../../mib/stm8s_mib_debug_cmd.c: 394: for (i = 0; i < remainder; i++)
      00A037 1E 26            [ 2] 1145 	ldw	x, (0x26, sp)
      00A039 5C               [ 1] 1146 	incw	x
      00A03A 1F 26            [ 2] 1147 	ldw	(0x26, sp), x
      00A03C 20 CE            [ 2] 1148 	jra	00131$
      00A03E                       1149 00116$:
                                   1150 ;	./../../mib/stm8s_mib_debug_cmd.c: 402: for (i = 0; i < (16 - remainder); i++)
      00A03E A6 10            [ 1] 1151 	ld	a, #0x10
      00A040 10 1A            [ 1] 1152 	sub	a, (0x1a, sp)
      00A042 6B 25            [ 1] 1153 	ld	(0x25, sp), a
      00A044 4F               [ 1] 1154 	clr	a
      00A045 12 19            [ 1] 1155 	sbc	a, (0x19, sp)
      00A047 6B 24            [ 1] 1156 	ld	(0x24, sp), a
      00A049 5F               [ 1] 1157 	clrw	x
      00A04A 1F 26            [ 2] 1158 	ldw	(0x26, sp), x
      00A04C                       1159 00134$:
      00A04C 1E 26            [ 2] 1160 	ldw	x, (0x26, sp)
      00A04E 13 24            [ 2] 1161 	cpw	x, (0x24, sp)
      00A050 2E 10            [ 1] 1162 	jrsge	00117$
                                   1163 ;	./../../mib/stm8s_mib_debug_cmd.c: 404: mib_printf(" ");
      00A052 4B 8E            [ 1] 1164 	push	#<(___str_6+0)
      00A054 4B 84            [ 1] 1165 	push	#((___str_6+0) >> 8)
      00A056 CD 99 C0         [ 4] 1166 	call	_mib_printf
      00A059 5B 02            [ 2] 1167 	addw	sp, #2
                                   1168 ;	./../../mib/stm8s_mib_debug_cmd.c: 402: for (i = 0; i < (16 - remainder); i++)
      00A05B 1E 26            [ 2] 1169 	ldw	x, (0x26, sp)
      00A05D 5C               [ 1] 1170 	incw	x
      00A05E 1F 26            [ 2] 1171 	ldw	(0x26, sp), x
      00A060 20 EA            [ 2] 1172 	jra	00134$
      00A062                       1173 00117$:
                                   1174 ;	./../../mib/stm8s_mib_debug_cmd.c: 407: mib_printf("\r\n");
      00A062 4B 28            [ 1] 1175 	push	#<(___str_0+0)
      00A064 4B 84            [ 1] 1176 	push	#((___str_0+0) >> 8)
      00A066 CD 99 C0         [ 4] 1177 	call	_mib_printf
      00A069 5B 02            [ 2] 1178 	addw	sp, #2
      00A06B                       1179 00119$:
                                   1180 ;	./../../mib/stm8s_mib_debug_cmd.c: 409: return;
                                   1181 ;	./../../mib/stm8s_mib_debug_cmd.c: 410: } // HexDump.
      00A06B 1E 28            [ 2] 1182 	ldw	x, (40, sp)
      00A06D 5B 31            [ 2] 1183 	addw	sp, #49
      00A06F FC               [ 2] 1184 	jp	(x)
                                   1185 ;	./../../mib/stm8s_mib_debug_cmd.c: 419: int DoPrintHelp(int argc, char **argv)
                                   1186 ;	-----------------------------------------
                                   1187 ;	 function DoPrintHelp
                                   1188 ;	-----------------------------------------
      00A070                       1189 _DoPrintHelp:
      00A070 52 02            [ 2] 1190 	sub	sp, #2
                                   1191 ;	./../../mib/stm8s_mib_debug_cmd.c: 423: if (argc == 1)
      00A072 5A               [ 2] 1192 	decw	x
      00A073 26 39            [ 1] 1193 	jrne	00105$
                                   1194 ;	./../../mib/stm8s_mib_debug_cmd.c: 425: mib_printf("*******\r\n");
      00A075 4B A3            [ 1] 1195 	push	#<(___str_11+0)
      00A077 4B 84            [ 1] 1196 	push	#((___str_11+0) >> 8)
      00A079 CD 99 C0         [ 4] 1197 	call	_mib_printf
      00A07C 5B 02            [ 2] 1198 	addw	sp, #2
                                   1199 ;	./../../mib/stm8s_mib_debug_cmd.c: 426: mib_printf("  help  Help for commands.\r\n");
      00A07E 4B AD            [ 1] 1200 	push	#<(___str_12+0)
      00A080 4B 84            [ 1] 1201 	push	#((___str_12+0) >> 8)
      00A082 CD 99 C0         [ 4] 1202 	call	_mib_printf
      00A085 5B 02            [ 2] 1203 	addw	sp, #2
                                   1204 ;	./../../mib/stm8s_mib_debug_cmd.c: 428: for (cptr = cmdTbl; cptr->cmd; cptr++)
      00A087 AE 01 5C         [ 2] 1205 	ldw	x, #(_cmdTbl+0)
      00A08A 1F 01            [ 2] 1206 	ldw	(0x01, sp), x
      00A08C                       1207 00108$:
      00A08C 1E 01            [ 2] 1208 	ldw	x, (0x01, sp)
      00A08E FE               [ 2] 1209 	ldw	x, (x)
      00A08F 27 12            [ 1] 1210 	jreq	00103$
                                   1211 ;	./../../mib/stm8s_mib_debug_cmd.c: 430: if (cptr->usage)
      00A091 1E 01            [ 2] 1212 	ldw	x, (0x01, sp)
      00A093 EE 04            [ 2] 1213 	ldw	x, (0x4, x)
      00A095 27 03            [ 1] 1214 	jreq	00109$
                                   1215 ;	./../../mib/stm8s_mib_debug_cmd.c: 431: MibWriteDebugString(cptr->usage);
      00A097 CD 8F AE         [ 4] 1216 	call	_MibWriteDebugString
      00A09A                       1217 00109$:
                                   1218 ;	./../../mib/stm8s_mib_debug_cmd.c: 428: for (cptr = cmdTbl; cptr->cmd; cptr++)
      00A09A 1E 01            [ 2] 1219 	ldw	x, (0x01, sp)
      00A09C 1C 00 06         [ 2] 1220 	addw	x, #0x0006
      00A09F 1F 01            [ 2] 1221 	ldw	(0x01, sp), x
      00A0A1 20 E9            [ 2] 1222 	jra	00108$
      00A0A3                       1223 00103$:
                                   1224 ;	./../../mib/stm8s_mib_debug_cmd.c: 433: mib_printf("*******\r\n");
      00A0A3 4B A3            [ 1] 1225 	push	#<(___str_11+0)
      00A0A5 4B 84            [ 1] 1226 	push	#((___str_11+0) >> 8)
      00A0A7 CD 99 C0         [ 4] 1227 	call	_mib_printf
      00A0AA 5B 02            [ 2] 1228 	addw	sp, #2
      00A0AC 20 1F            [ 2] 1229 	jra	00106$
      00A0AE                       1230 00105$:
                                   1231 ;	./../../mib/stm8s_mib_debug_cmd.c: 437: mib_printf("\tUnknown command : ");
      00A0AE 4B CA            [ 1] 1232 	push	#<(___str_13+0)
      00A0B0 4B 84            [ 1] 1233 	push	#((___str_13+0) >> 8)
      00A0B2 CD 99 C0         [ 4] 1234 	call	_mib_printf
      00A0B5 5B 02            [ 2] 1235 	addw	sp, #2
                                   1236 ;	./../../mib/stm8s_mib_debug_cmd.c: 438: mib_printf("%s", argv[0]);
      00A0B7 1E 05            [ 2] 1237 	ldw	x, (0x05, sp)
      00A0B9 FE               [ 2] 1238 	ldw	x, (x)
      00A0BA 89               [ 2] 1239 	pushw	x
      00A0BB 4B DE            [ 1] 1240 	push	#<(___str_14+0)
      00A0BD 4B 84            [ 1] 1241 	push	#((___str_14+0) >> 8)
      00A0BF CD 99 C0         [ 4] 1242 	call	_mib_printf
      00A0C2 5B 04            [ 2] 1243 	addw	sp, #4
                                   1244 ;	./../../mib/stm8s_mib_debug_cmd.c: 439: mib_printf("\r\n");
      00A0C4 4B 28            [ 1] 1245 	push	#<(___str_0+0)
      00A0C6 4B 84            [ 1] 1246 	push	#((___str_0+0) >> 8)
      00A0C8 CD 99 C0         [ 4] 1247 	call	_mib_printf
      00A0CB 5B 02            [ 2] 1248 	addw	sp, #2
      00A0CD                       1249 00106$:
                                   1250 ;	./../../mib/stm8s_mib_debug_cmd.c: 441: return TRUE;
      00A0CD 5F               [ 1] 1251 	clrw	x
      00A0CE 5C               [ 1] 1252 	incw	x
                                   1253 ;	./../../mib/stm8s_mib_debug_cmd.c: 442: }
      00A0CF 5B 02            [ 2] 1254 	addw	sp, #2
      00A0D1 90 85            [ 2] 1255 	popw	y
      00A0D3 5B 02            [ 2] 1256 	addw	sp, #2
      00A0D5 90 FC            [ 2] 1257 	jp	(y)
                                   1258 ;	./../../mib/stm8s_mib_debug_cmd.c: 452: int getdec(uint8_t **ptr)
                                   1259 ;	-----------------------------------------
                                   1260 ;	 function getdec
                                   1261 ;	-----------------------------------------
      00A0D7                       1262 _getdec:
      00A0D7 52 06            [ 2] 1263 	sub	sp, #6
                                   1264 ;	./../../mib/stm8s_mib_debug_cmd.c: 454: uint8_t *p = *ptr;
      00A0D9 1F 05            [ 2] 1265 	ldw	(0x05, sp), x
      00A0DB FE               [ 2] 1266 	ldw	x, (x)
      00A0DC 1F 01            [ 2] 1267 	ldw	(0x01, sp), x
                                   1268 ;	./../../mib/stm8s_mib_debug_cmd.c: 455: int ret = 0;
      00A0DE 5F               [ 1] 1269 	clrw	x
      00A0DF 1F 03            [ 2] 1270 	ldw	(0x03, sp), x
                                   1271 ;	./../../mib/stm8s_mib_debug_cmd.c: 456: if ((*p < '0') || (*p > '9'))
      00A0E1 1E 01            [ 2] 1272 	ldw	x, (0x01, sp)
      00A0E3 F6               [ 1] 1273 	ld	a, (x)
      00A0E4 A1 30            [ 1] 1274 	cp	a, #0x30
      00A0E6 25 04            [ 1] 1275 	jrc	00101$
      00A0E8 A1 39            [ 1] 1276 	cp	a, #0x39
      00A0EA 23 04            [ 2] 1277 	jrule	00113$
      00A0EC                       1278 00101$:
                                   1279 ;	./../../mib/stm8s_mib_debug_cmd.c: 457: return (-1);
      00A0EC 5F               [ 1] 1280 	clrw	x
      00A0ED 5A               [ 2] 1281 	decw	x
      00A0EE 20 29            [ 2] 1282 	jra	00108$
                                   1283 ;	./../../mib/stm8s_mib_debug_cmd.c: 458: while ((*p >= '0') && (*p <= '9'))
      00A0F0                       1284 00113$:
      00A0F0 16 01            [ 2] 1285 	ldw	y, (0x01, sp)
      00A0F2                       1286 00105$:
      00A0F2 90 F6            [ 1] 1287 	ld	a, (y)
      00A0F4 A1 30            [ 1] 1288 	cp	a, #0x30
      00A0F6 25 1C            [ 1] 1289 	jrc	00107$
      00A0F8 A1 39            [ 1] 1290 	cp	a, #0x39
      00A0FA 22 18            [ 1] 1291 	jrugt	00107$
                                   1292 ;	./../../mib/stm8s_mib_debug_cmd.c: 460: ret = ret * 10 + (int)(*p - '0');
      00A0FC 1E 03            [ 2] 1293 	ldw	x, (0x03, sp)
      00A0FE 58               [ 2] 1294 	sllw	x
      00A0FF 58               [ 2] 1295 	sllw	x
      00A100 72 FB 03         [ 2] 1296 	addw	x, (0x03, sp)
      00A103 58               [ 2] 1297 	sllw	x
      00A104 1F 03            [ 2] 1298 	ldw	(0x03, sp), x
      00A106 5F               [ 1] 1299 	clrw	x
      00A107 97               [ 1] 1300 	ld	xl, a
      00A108 1D 00 30         [ 2] 1301 	subw	x, #0x0030
      00A10B 72 FB 03         [ 2] 1302 	addw	x, (0x03, sp)
      00A10E 1F 03            [ 2] 1303 	ldw	(0x03, sp), x
                                   1304 ;	./../../mib/stm8s_mib_debug_cmd.c: 461: p++;
      00A110 90 5C            [ 1] 1305 	incw	y
      00A112 20 DE            [ 2] 1306 	jra	00105$
      00A114                       1307 00107$:
                                   1308 ;	./../../mib/stm8s_mib_debug_cmd.c: 463: *ptr = p;
      00A114 1E 05            [ 2] 1309 	ldw	x, (0x05, sp)
      00A116 FF               [ 2] 1310 	ldw	(x), y
                                   1311 ;	./../../mib/stm8s_mib_debug_cmd.c: 464: return (ret);
      00A117 1E 03            [ 2] 1312 	ldw	x, (0x03, sp)
      00A119                       1313 00108$:
                                   1314 ;	./../../mib/stm8s_mib_debug_cmd.c: 465: }
      00A119 5B 06            [ 2] 1315 	addw	sp, #6
      00A11B 81               [ 4] 1316 	ret
                                   1317 	.area CODE
                                   1318 	.area CONST
                                   1319 	.area CONST
      008428                       1320 ___str_0:
      008428 0D                    1321 	.db 0x0d
      008429 0A                    1322 	.db 0x0a
      00842A 00                    1323 	.db 0x00
                                   1324 	.area CODE
                                   1325 	.area CONST
      00842B                       1326 ___str_1:
      00842B 08                    1327 	.db 0x08
      00842C 20                    1328 	.ascii " "
      00842D 08                    1329 	.db 0x08
      00842E 00                    1330 	.db 0x00
                                   1331 	.area CODE
                                   1332 	.area CONST
      00842F                       1333 ___str_2:
      00842F 30 78                 1334 	.ascii "0x"
      008431 00                    1335 	.db 0x00
                                   1336 	.area CODE
                                   1337 	.area CONST
      008432                       1338 ___str_3:
      008432 61 64 64 72 65 73 73  1339 	.ascii "address     Hex Value                                       "
             20 20 20 20 20 48 65
             78 20 56 61 6C 75 65
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      00846E 20 41 73 63 69 69 20  1340 	.ascii " Ascii value"
             76 61 6C 75 65
      00847A 0D                    1341 	.db 0x0d
      00847B 0A                    1342 	.db 0x0a
      00847C 00                    1343 	.db 0x00
                                   1344 	.area CODE
                                   1345 	.area CONST
      00847D                       1346 ___str_4:
      00847D 30 78 25 30 38 6C 78  1347 	.ascii "0x%08lx : "
             20 3A 20
      008487 00                    1348 	.db 0x00
                                   1349 	.area CODE
                                   1350 	.area CONST
      008488                       1351 ___str_5:
      008488 25 30 32 78 20        1352 	.ascii "%02x "
      00848D 00                    1353 	.db 0x00
                                   1354 	.area CODE
                                   1355 	.area CONST
      00848E                       1356 ___str_6:
      00848E 20                    1357 	.ascii " "
      00848F 00                    1358 	.db 0x00
                                   1359 	.area CODE
                                   1360 	.area CONST
      008490                       1361 ___str_7:
      008490 25 63                 1362 	.ascii "%c"
      008492 00                    1363 	.db 0x00
                                   1364 	.area CODE
                                   1365 	.area CONST
      008493                       1366 ___str_8:
      008493 2E                    1367 	.ascii "."
      008494 00                    1368 	.db 0x00
                                   1369 	.area CODE
                                   1370 	.area CONST
      008495                       1371 ___str_9:
      008495 30 78 25 30 38 6C 78  1372 	.ascii "0x%08lx  "
             20 20
      00849E 00                    1373 	.db 0x00
                                   1374 	.area CODE
                                   1375 	.area CONST
      00849F                       1376 ___str_10:
      00849F 20 20 20              1377 	.ascii "   "
      0084A2 00                    1378 	.db 0x00
                                   1379 	.area CODE
                                   1380 	.area CONST
      0084A3                       1381 ___str_11:
      0084A3 2A 2A 2A 2A 2A 2A 2A  1382 	.ascii "*******"
      0084AA 0D                    1383 	.db 0x0d
      0084AB 0A                    1384 	.db 0x0a
      0084AC 00                    1385 	.db 0x00
                                   1386 	.area CODE
                                   1387 	.area CONST
      0084AD                       1388 ___str_12:
      0084AD 20 20 68 65 6C 70 20  1389 	.ascii "  help  Help for commands."
             20 48 65 6C 70 20 66
             6F 72 20 63 6F 6D 6D
             61 6E 64 73 2E
      0084C7 0D                    1390 	.db 0x0d
      0084C8 0A                    1391 	.db 0x0a
      0084C9 00                    1392 	.db 0x00
                                   1393 	.area CODE
                                   1394 	.area CONST
      0084CA                       1395 ___str_13:
      0084CA 09                    1396 	.db 0x09
      0084CB 55 6E 6B 6E 6F 77 6E  1397 	.ascii "Unknown command : "
             20 63 6F 6D 6D 61 6E
             64 20 3A 20
      0084DD 00                    1398 	.db 0x00
                                   1399 	.area CODE
                                   1400 	.area CONST
      0084DE                       1401 ___str_14:
      0084DE 25 73                 1402 	.ascii "%s"
      0084E0 00                    1403 	.db 0x00
                                   1404 	.area CODE
                                   1405 	.area INITIALIZER
      0089EE                       1406 __xinit__cmdTbl:
      0089EE 00 00                 1407 	.dw #0x0000
      0089F0 00 00                 1408 	.dw #0x0000
      0089F2 00 00                 1409 	.dw #0x0000
      0089F4 00 00                 1410 	.dw #0x0000
      0089F6 00 00                 1411 	.dw #0x0000
      0089F8 00 00                 1412 	.dw #0x0000
      0089FA 00 00                 1413 	.dw #0x0000
      0089FC 00 00                 1414 	.dw #0x0000
      0089FE 00 00                 1415 	.dw #0x0000
      008A00 00 00                 1416 	.dw #0x0000
      008A02 00 00                 1417 	.dw #0x0000
      008A04 00 00                 1418 	.dw #0x0000
      008A06 00 00                 1419 	.dw #0x0000
      008A08 00 00                 1420 	.dw #0x0000
      008A0A 00 00                 1421 	.dw #0x0000
      008A0C 00 00                 1422 	.dw #0x0000
      008A0E 00 00                 1423 	.dw #0x0000
      008A10 00 00                 1424 	.dw #0x0000
                                   1425 	.area CABS (ABS)
