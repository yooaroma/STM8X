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
      009D12                         74 _GetCommand:
      009D12 52 10            [ 2]   75 	sub	sp, #16
      009D14 1F 0D            [ 2]   76 	ldw	(0x0d, sp), x
                                     77 ;	./../../mib/stm8s_mib_debug_cmd.c: 88: uint16_t vwIndex, rdCnt, rdMax = len - 1;
      009D16 1E 13            [ 2]   78 	ldw	x, (0x13, sp)
      009D18 5A               [ 2]   79 	decw	x
      009D19 1F 01            [ 2]   80 	ldw	(0x01, sp), x
                                     81 ;	./../../mib/stm8s_mib_debug_cmd.c: 91: endTime = MibGetSecs() + (uint16_t)timeout;
      009D1B CD 9D 05         [ 4]   82 	call	_MibGetSecs
      009D1E 7B 15            [ 1]   83 	ld	a, (0x15, sp)
      009D20 6B 10            [ 1]   84 	ld	(0x10, sp), a
      009D22 0F 0F            [ 1]   85 	clr	(0x0f, sp)
      009D24 72 FB 0F         [ 2]   86 	addw	x, (0x0f, sp)
      009D27 1F 03            [ 2]   87 	ldw	(0x03, sp), x
                                     88 ;	./../../mib/stm8s_mib_debug_cmd.c: 92: cmd_list.cur = cmd_list.next;
      009D29 C6 00 49         [ 1]   89 	ld	a, _cmd_list+1
      009D2C C7 00 48         [ 1]   90 	ld	_cmd_list+0, a
                                     91 ;	./../../mib/stm8s_mib_debug_cmd.c: 93: for (rdCnt = 0, vwIndex = 0; rdCnt <= rdMax;)
      009D2F 5F               [ 1]   92 	clrw	x
      009D30 1F 0F            [ 2]   93 	ldw	(0x0f, sp), x
      009D32                         94 00149$:
      009D32 1E 0F            [ 2]   95 	ldw	x, (0x0f, sp)
      009D34 13 01            [ 2]   96 	cpw	x, (0x01, sp)
      009D36 23 03            [ 2]   97 	jrule	00243$
      009D38 CC 9F 05         [ 2]   98 	jp	00147$
      009D3B                         99 00243$:
                                    100 ;	./../../mib/stm8s_mib_debug_cmd.c: 96: while (1)
      009D3B                        101 00106$:
                                    102 ;	./../../mib/stm8s_mib_debug_cmd.c: 98: vwCh = MibReadDebugByte();
      009D3B CD 92 A7         [ 4]  103 	call	_MibReadDebugByte
                                    104 ;	./../../mib/stm8s_mib_debug_cmd.c: 99: if (vwCh != 0xffff)	break;
      009D3E 1F 05            [ 2]  105 	ldw	(0x05, sp), x
      009D40 1F 07            [ 2]  106 	ldw	(0x07, sp), x
                                    107 ;	./../../mib/stm8s_mib_debug_cmd.c: 102: cmd[rdCnt++] = '\0';
      009D42 1E 0F            [ 2]  108 	ldw	x, (0x0f, sp)
      009D44 5C               [ 1]  109 	incw	x
      009D45 1F 09            [ 2]  110 	ldw	(0x09, sp), x
                                    111 ;	./../../mib/stm8s_mib_debug_cmd.c: 104: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      009D47 16 0D            [ 2]  112 	ldw	y, (0x0d, sp)
      009D49 17 0B            [ 2]  113 	ldw	(0x0b, sp), y
                                    114 ;	./../../mib/stm8s_mib_debug_cmd.c: 99: if (vwCh != 0xffff)	break;
      009D4B 1E 07            [ 2]  115 	ldw	x, (0x07, sp)
      009D4D 5C               [ 1]  116 	incw	x
      009D4E 26 55            [ 1]  117 	jrne	00107$
                                    118 ;	./../../mib/stm8s_mib_debug_cmd.c: 100: if (MibGetSecs() > endTime)
      009D50 CD 9D 05         [ 4]  119 	call	_MibGetSecs
      009D53 13 03            [ 2]  120 	cpw	x, (0x03, sp)
      009D55 23 E4            [ 2]  121 	jrule	00106$
                                    122 ;	./../../mib/stm8s_mib_debug_cmd.c: 102: cmd[rdCnt++] = '\0';
      009D57 1E 0F            [ 2]  123 	ldw	x, (0x0f, sp)
      009D59 16 09            [ 2]  124 	ldw	y, (0x09, sp)
      009D5B 17 0F            [ 2]  125 	ldw	(0x0f, sp), y
      009D5D 72 FB 0D         [ 2]  126 	addw	x, (0x0d, sp)
      009D60 7F               [ 1]  127 	clr	(x)
                                    128 ;	./../../mib/stm8s_mib_debug_cmd.c: 103: memset(cmd_list.buf[cmd_list.next], 0, CMD_CHAR_MAX);
      009D61 C6 00 49         [ 1]  129 	ld	a, _cmd_list+1
      009D64 97               [ 1]  130 	ld	xl, a
      009D65 A6 40            [ 1]  131 	ld	a, #0x40
      009D67 42               [ 4]  132 	mul	x, a
      009D68 1C 00 4A         [ 2]  133 	addw	x, #(_cmd_list+2)
      009D6B 4B 40            [ 1]  134 	push	#0x40
      009D6D 4B 00            [ 1]  135 	push	#0x00
      009D6F 4B 00            [ 1]  136 	push	#0x00
      009D71 4B 00            [ 1]  137 	push	#0x00
      009D73 CD B0 D0         [ 4]  138 	call	_memset
                                    139 ;	./../../mib/stm8s_mib_debug_cmd.c: 104: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      009D76 1E 0D            [ 2]  140 	ldw	x, (0x0d, sp)
      009D78 CD B0 F4         [ 4]  141 	call	_strlen
      009D7B 51               [ 1]  142 	exgw	x, y
      009D7C C6 00 49         [ 1]  143 	ld	a, _cmd_list+1
      009D7F 97               [ 1]  144 	ld	xl, a
      009D80 A6 40            [ 1]  145 	ld	a, #0x40
      009D82 42               [ 4]  146 	mul	x, a
      009D83 1C 00 4A         [ 2]  147 	addw	x, #(_cmd_list+2)
      009D86 90 89            [ 2]  148 	pushw	y
      009D88 16 0D            [ 2]  149 	ldw	y, (0x0d, sp)
      009D8A 90 89            [ 2]  150 	pushw	y
      009D8C CD B0 7D         [ 4]  151 	call	___memcpy
                                    152 ;	./../../mib/stm8s_mib_debug_cmd.c: 105: cmd_list.next = (cmd_list.next + 1) % CMD_LINE_MAX;
      009D8F C6 00 49         [ 1]  153 	ld	a, _cmd_list+1
      009D92 5F               [ 1]  154 	clrw	x
      009D93 97               [ 1]  155 	ld	xl, a
      009D94 5C               [ 1]  156 	incw	x
      009D95 4B 04            [ 1]  157 	push	#0x04
      009D97 4B 00            [ 1]  158 	push	#0x00
      009D99 CD B1 3E         [ 4]  159 	call	__modsint
      009D9C 9F               [ 1]  160 	ld	a, xl
      009D9D C7 00 49         [ 1]  161 	ld	_cmd_list+1, a
                                    162 ;	./../../mib/stm8s_mib_debug_cmd.c: 106: return rdCnt;
      009DA0 1E 0F            [ 2]  163 	ldw	x, (0x0f, sp)
      009DA2 CC 9F 07         [ 2]  164 	jp	00151$
      009DA5                        165 00107$:
                                    166 ;	./../../mib/stm8s_mib_debug_cmd.c: 112: if ((vwCh == '@') || (vwCh == '\n') || (vwCh == 0x03))
      009DA5 1E 07            [ 2]  167 	ldw	x, (0x07, sp)
      009DA7 A3 00 40         [ 2]  168 	cpw	x, #0x0040
      009DAA 27 0E            [ 1]  169 	jreq	00142$
      009DAC 1E 07            [ 2]  170 	ldw	x, (0x07, sp)
      009DAE A3 00 0A         [ 2]  171 	cpw	x, #0x000a
      009DB1 27 07            [ 1]  172 	jreq	00142$
      009DB3 1E 07            [ 2]  173 	ldw	x, (0x07, sp)
      009DB5 A3 00 03         [ 2]  174 	cpw	x, #0x0003
      009DB8 26 57            [ 1]  175 	jrne	00143$
      009DBA                        176 00142$:
                                    177 ;	./../../mib/stm8s_mib_debug_cmd.c: 114: cmd[rdCnt++] = '\0';
      009DBA 1E 0F            [ 2]  178 	ldw	x, (0x0f, sp)
      009DBC 16 09            [ 2]  179 	ldw	y, (0x09, sp)
      009DBE 17 0F            [ 2]  180 	ldw	(0x0f, sp), y
      009DC0 72 FB 0D         [ 2]  181 	addw	x, (0x0d, sp)
      009DC3 7F               [ 1]  182 	clr	(x)
                                    183 ;	./../../mib/stm8s_mib_debug_cmd.c: 115: memset(cmd_list.buf[cmd_list.next], 0, CMD_CHAR_MAX);
      009DC4 C6 00 49         [ 1]  184 	ld	a, _cmd_list+1
      009DC7 97               [ 1]  185 	ld	xl, a
      009DC8 A6 40            [ 1]  186 	ld	a, #0x40
      009DCA 42               [ 4]  187 	mul	x, a
      009DCB 1C 00 4A         [ 2]  188 	addw	x, #(_cmd_list+2)
      009DCE 4B 40            [ 1]  189 	push	#0x40
      009DD0 4B 00            [ 1]  190 	push	#0x00
      009DD2 4B 00            [ 1]  191 	push	#0x00
      009DD4 4B 00            [ 1]  192 	push	#0x00
      009DD6 CD B0 D0         [ 4]  193 	call	_memset
                                    194 ;	./../../mib/stm8s_mib_debug_cmd.c: 116: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      009DD9 1E 0D            [ 2]  195 	ldw	x, (0x0d, sp)
      009DDB CD B0 F4         [ 4]  196 	call	_strlen
      009DDE 51               [ 1]  197 	exgw	x, y
      009DDF C6 00 49         [ 1]  198 	ld	a, _cmd_list+1
      009DE2 97               [ 1]  199 	ld	xl, a
      009DE3 A6 40            [ 1]  200 	ld	a, #0x40
      009DE5 42               [ 4]  201 	mul	x, a
      009DE6 1C 00 4A         [ 2]  202 	addw	x, #(_cmd_list+2)
      009DE9 90 89            [ 2]  203 	pushw	y
      009DEB 16 0D            [ 2]  204 	ldw	y, (0x0d, sp)
      009DED 90 89            [ 2]  205 	pushw	y
      009DEF CD B0 7D         [ 4]  206 	call	___memcpy
                                    207 ;	./../../mib/stm8s_mib_debug_cmd.c: 117: cmd_list.next = (cmd_list.next + 1) % CMD_LINE_MAX;
      009DF2 C6 00 49         [ 1]  208 	ld	a, _cmd_list+1
      009DF5 5F               [ 1]  209 	clrw	x
      009DF6 97               [ 1]  210 	ld	xl, a
      009DF7 5C               [ 1]  211 	incw	x
      009DF8 4B 04            [ 1]  212 	push	#0x04
      009DFA 4B 00            [ 1]  213 	push	#0x00
      009DFC CD B1 3E         [ 4]  214 	call	__modsint
      009DFF 9F               [ 1]  215 	ld	a, xl
      009E00 C7 00 49         [ 1]  216 	ld	_cmd_list+1, a
                                    217 ;	./../../mib/stm8s_mib_debug_cmd.c: 119: mib_printf("\r\n");
      009E03 4B 40            [ 1]  218 	push	#<(___str_0+0)
      009E05 4B 88            [ 1]  219 	push	#((___str_0+0) >> 8)
      009E07 CD 9C 98         [ 4]  220 	call	_mib_printf
      009E0A 5B 02            [ 2]  221 	addw	sp, #2
                                    222 ;	./../../mib/stm8s_mib_debug_cmd.c: 120: return rdCnt;
      009E0C 1E 0F            [ 2]  223 	ldw	x, (0x0f, sp)
      009E0E CC 9F 07         [ 2]  224 	jp	00151$
      009E11                        225 00143$:
                                    226 ;	./../../mib/stm8s_mib_debug_cmd.c: 122: else if (vwCh == '\b')
      009E11 1E 07            [ 2]  227 	ldw	x, (0x07, sp)
      009E13 A3 00 08         [ 2]  228 	cpw	x, #0x0008
      009E16 26 18            [ 1]  229 	jrne	00140$
                                    230 ;	./../../mib/stm8s_mib_debug_cmd.c: 124: if (rdCnt > 0)
      009E18 1E 0F            [ 2]  231 	ldw	x, (0x0f, sp)
      009E1A 26 03            [ 1]  232 	jrne	00260$
      009E1C CC 9D 32         [ 2]  233 	jp	00149$
      009E1F                        234 00260$:
                                    235 ;	./../../mib/stm8s_mib_debug_cmd.c: 126: rdCnt--;
      009E1F 1E 0F            [ 2]  236 	ldw	x, (0x0f, sp)
      009E21 5A               [ 2]  237 	decw	x
      009E22 1F 0F            [ 2]  238 	ldw	(0x0f, sp), x
                                    239 ;	./../../mib/stm8s_mib_debug_cmd.c: 128: mib_printf("\b \b");
      009E24 4B 43            [ 1]  240 	push	#<(___str_1+0)
      009E26 4B 88            [ 1]  241 	push	#((___str_1+0) >> 8)
      009E28 CD 9C 98         [ 4]  242 	call	_mib_printf
      009E2B 5B 02            [ 2]  243 	addw	sp, #2
      009E2D CC 9D 32         [ 2]  244 	jp	00149$
      009E30                        245 00140$:
                                    246 ;	./../../mib/stm8s_mib_debug_cmd.c: 131: else if (vwCh == 0x1b)
      009E30 1E 07            [ 2]  247 	ldw	x, (0x07, sp)
      009E32 A3 00 1B         [ 2]  248 	cpw	x, #0x001b
      009E35 27 03            [ 1]  249 	jreq	00263$
      009E37 CC 9E F3         [ 2]  250 	jp	00137$
      009E3A                        251 00263$:
                                    252 ;	./../../mib/stm8s_mib_debug_cmd.c: 134: while (1)
      009E3A                        253 00113$:
                                    254 ;	./../../mib/stm8s_mib_debug_cmd.c: 136: vwCh = MibReadDebugByte();
      009E3A CD 92 A7         [ 4]  255 	call	_MibReadDebugByte
                                    256 ;	./../../mib/stm8s_mib_debug_cmd.c: 137: if (vwCh != 0xffff)
      009E3D A3 FF FF         [ 2]  257 	cpw	x, #0xffff
      009E40 27 F8            [ 1]  258 	jreq	00113$
                                    259 ;	./../../mib/stm8s_mib_debug_cmd.c: 140: if (vwCh == '[')
      009E42 A3 00 5B         [ 2]  260 	cpw	x, #0x005b
      009E45 27 03            [ 1]  261 	jreq	00269$
      009E47 CC 9D 32         [ 2]  262 	jp	00149$
      009E4A                        263 00269$:
                                    264 ;	./../../mib/stm8s_mib_debug_cmd.c: 143: while (1)
      009E4A                        265 00118$:
                                    266 ;	./../../mib/stm8s_mib_debug_cmd.c: 145: vwCh = MibReadDebugByte();
      009E4A CD 92 A7         [ 4]  267 	call	_MibReadDebugByte
                                    268 ;	./../../mib/stm8s_mib_debug_cmd.c: 146: if (vwCh != 0xffff)
      009E4D 1F 09            [ 2]  269 	ldw	(0x09, sp), x
      009E4F 5C               [ 1]  270 	incw	x
      009E50 27 F8            [ 1]  271 	jreq	00118$
                                    272 ;	./../../mib/stm8s_mib_debug_cmd.c: 150: if (vwCh == 'B')
      009E52 1E 09            [ 2]  273 	ldw	x, (0x09, sp)
      009E54 A3 00 42         [ 2]  274 	cpw	x, #0x0042
      009E57 26 48            [ 1]  275 	jrne	00132$
                                    276 ;	./../../mib/stm8s_mib_debug_cmd.c: 152: cmd_list.cur++;
      009E59 C6 00 48         [ 1]  277 	ld	a, _cmd_list+0
      009E5C 4C               [ 1]  278 	inc	a
      009E5D C7 00 48         [ 1]  279 	ld	_cmd_list+0, a
                                    280 ;	./../../mib/stm8s_mib_debug_cmd.c: 153: if (cmd_list.cur == CMD_LINE_MAX)
      009E60 A1 04            [ 1]  281 	cp	a, #0x04
      009E62 26 04            [ 1]  282 	jrne	00121$
                                    283 ;	./../../mib/stm8s_mib_debug_cmd.c: 154: cmd_list.cur = 0;
      009E64 35 00 00 48      [ 1]  284 	mov	_cmd_list+0, #0x00
      009E68                        285 00121$:
                                    286 ;	./../../mib/stm8s_mib_debug_cmd.c: 155: rdCnt = strlen(cmd_list.buf[cmd_list.cur]);
      009E68 C6 00 48         [ 1]  287 	ld	a, _cmd_list+0
      009E6B 97               [ 1]  288 	ld	xl, a
      009E6C A6 40            [ 1]  289 	ld	a, #0x40
      009E6E 42               [ 4]  290 	mul	x, a
      009E6F 1C 00 4A         [ 2]  291 	addw	x, #(_cmd_list+2)
      009E72 CD B0 F4         [ 4]  292 	call	_strlen
                                    293 ;	./../../mib/stm8s_mib_debug_cmd.c: 156: if (rdCnt >= rdMax)
      009E75 1F 0F            [ 2]  294 	ldw	(0x0f, sp), x
      009E77 13 01            [ 2]  295 	cpw	x, (0x01, sp)
      009E79 25 04            [ 1]  296 	jrc	00123$
                                    297 ;	./../../mib/stm8s_mib_debug_cmd.c: 157: rdCnt = rdMax;
      009E7B 16 01            [ 2]  298 	ldw	y, (0x01, sp)
      009E7D 17 0F            [ 2]  299 	ldw	(0x0f, sp), y
      009E7F                        300 00123$:
                                    301 ;	./../../mib/stm8s_mib_debug_cmd.c: 158: memcpy(cmd, cmd_list.buf[cmd_list.cur], rdCnt);
      009E7F 16 0F            [ 2]  302 	ldw	y, (0x0f, sp)
      009E81 C6 00 48         [ 1]  303 	ld	a, _cmd_list+0
      009E84 97               [ 1]  304 	ld	xl, a
      009E85 A6 40            [ 1]  305 	ld	a, #0x40
      009E87 42               [ 4]  306 	mul	x, a
      009E88 1C 00 4A         [ 2]  307 	addw	x, #(_cmd_list+2)
      009E8B 90 89            [ 2]  308 	pushw	y
      009E8D 89               [ 2]  309 	pushw	x
      009E8E 1E 0F            [ 2]  310 	ldw	x, (0x0f, sp)
      009E90 CD B0 7D         [ 4]  311 	call	___memcpy
                                    312 ;	./../../mib/stm8s_mib_debug_cmd.c: 159: cmd[rdCnt] = 0;
      009E93 1E 0D            [ 2]  313 	ldw	x, (0x0d, sp)
      009E95 72 FB 0F         [ 2]  314 	addw	x, (0x0f, sp)
      009E98 7F               [ 1]  315 	clr	(x)
                                    316 ;	./../../mib/stm8s_mib_debug_cmd.c: 161: MibWriteDebugString(cmd);
      009E99 1E 0D            [ 2]  317 	ldw	x, (0x0d, sp)
      009E9B CD 92 86         [ 4]  318 	call	_MibWriteDebugString
      009E9E CC 9D 32         [ 2]  319 	jp	00149$
      009EA1                        320 00132$:
                                    321 ;	./../../mib/stm8s_mib_debug_cmd.c: 163: else if (vwCh == 'A')
      009EA1 1E 09            [ 2]  322 	ldw	x, (0x09, sp)
      009EA3 A3 00 41         [ 2]  323 	cpw	x, #0x0041
      009EA6 27 03            [ 1]  324 	jreq	00282$
      009EA8 CC 9D 32         [ 2]  325 	jp	00149$
      009EAB                        326 00282$:
                                    327 ;	./../../mib/stm8s_mib_debug_cmd.c: 152: cmd_list.cur++;
                                    328 ;	./../../mib/stm8s_mib_debug_cmd.c: 165: if (cmd_list.cur == 0)
      009EAB C6 00 48         [ 1]  329 	ld	a, _cmd_list+0
      009EAE 26 06            [ 1]  330 	jrne	00125$
                                    331 ;	./../../mib/stm8s_mib_debug_cmd.c: 166: cmd_list.cur = CMD_LINE_MAX - 1;
      009EB0 35 03 00 48      [ 1]  332 	mov	_cmd_list+0, #0x03
      009EB4 20 04            [ 2]  333 	jra	00126$
      009EB6                        334 00125$:
                                    335 ;	./../../mib/stm8s_mib_debug_cmd.c: 168: cmd_list.cur--;
      009EB6 4A               [ 1]  336 	dec	a
      009EB7 C7 00 48         [ 1]  337 	ld	_cmd_list+0, a
      009EBA                        338 00126$:
                                    339 ;	./../../mib/stm8s_mib_debug_cmd.c: 169: rdCnt = strlen(cmd_list.buf[cmd_list.cur]);
      009EBA C6 00 48         [ 1]  340 	ld	a, _cmd_list+0
      009EBD 97               [ 1]  341 	ld	xl, a
      009EBE A6 40            [ 1]  342 	ld	a, #0x40
      009EC0 42               [ 4]  343 	mul	x, a
      009EC1 1C 00 4A         [ 2]  344 	addw	x, #(_cmd_list+2)
      009EC4 CD B0 F4         [ 4]  345 	call	_strlen
                                    346 ;	./../../mib/stm8s_mib_debug_cmd.c: 170: if (rdCnt >= rdMax)
      009EC7 1F 0F            [ 2]  347 	ldw	(0x0f, sp), x
      009EC9 13 01            [ 2]  348 	cpw	x, (0x01, sp)
      009ECB 25 04            [ 1]  349 	jrc	00128$
                                    350 ;	./../../mib/stm8s_mib_debug_cmd.c: 171: rdCnt = rdMax;
      009ECD 16 01            [ 2]  351 	ldw	y, (0x01, sp)
      009ECF 17 0F            [ 2]  352 	ldw	(0x0f, sp), y
      009ED1                        353 00128$:
                                    354 ;	./../../mib/stm8s_mib_debug_cmd.c: 172: memcpy(cmd, cmd_list.buf[cmd_list.cur], rdCnt);
      009ED1 16 0F            [ 2]  355 	ldw	y, (0x0f, sp)
      009ED3 C6 00 48         [ 1]  356 	ld	a, _cmd_list+0
      009ED6 97               [ 1]  357 	ld	xl, a
      009ED7 A6 40            [ 1]  358 	ld	a, #0x40
      009ED9 42               [ 4]  359 	mul	x, a
      009EDA 1C 00 4A         [ 2]  360 	addw	x, #(_cmd_list+2)
      009EDD 90 89            [ 2]  361 	pushw	y
      009EDF 89               [ 2]  362 	pushw	x
      009EE0 1E 0F            [ 2]  363 	ldw	x, (0x0f, sp)
      009EE2 CD B0 7D         [ 4]  364 	call	___memcpy
                                    365 ;	./../../mib/stm8s_mib_debug_cmd.c: 173: cmd[rdCnt] = 0;
      009EE5 1E 0D            [ 2]  366 	ldw	x, (0x0d, sp)
      009EE7 72 FB 0F         [ 2]  367 	addw	x, (0x0f, sp)
      009EEA 7F               [ 1]  368 	clr	(x)
                                    369 ;	./../../mib/stm8s_mib_debug_cmd.c: 175: MibWriteDebugString(cmd);
      009EEB 1E 0D            [ 2]  370 	ldw	x, (0x0d, sp)
      009EED CD 92 86         [ 4]  371 	call	_MibWriteDebugString
      009EF0 CC 9D 32         [ 2]  372 	jp	00149$
      009EF3                        373 00137$:
                                    374 ;	./../../mib/stm8s_mib_debug_cmd.c: 181: cmd[rdCnt++] = vwCh;
      009EF3 1E 0F            [ 2]  375 	ldw	x, (0x0f, sp)
      009EF5 16 09            [ 2]  376 	ldw	y, (0x09, sp)
      009EF7 17 0F            [ 2]  377 	ldw	(0x0f, sp), y
      009EF9 72 FB 0D         [ 2]  378 	addw	x, (0x0d, sp)
      009EFC 7B 06            [ 1]  379 	ld	a, (0x06, sp)
      009EFE F7               [ 1]  380 	ld	(x), a
                                    381 ;	./../../mib/stm8s_mib_debug_cmd.c: 183: MibWriteDebugByte(vwCh);
      009EFF CD 92 69         [ 4]  382 	call	_MibWriteDebugByte
      009F02 CC 9D 32         [ 2]  383 	jp	00149$
      009F05                        384 00147$:
                                    385 ;	./../../mib/stm8s_mib_debug_cmd.c: 186: return (rdCnt);
      009F05 1E 0F            [ 2]  386 	ldw	x, (0x0f, sp)
      009F07                        387 00151$:
                                    388 ;	./../../mib/stm8s_mib_debug_cmd.c: 187: } // GetCommand.
      009F07 16 11            [ 2]  389 	ldw	y, (17, sp)
      009F09 5B 15            [ 2]  390 	addw	sp, #21
      009F0B 90 FC            [ 2]  391 	jp	(y)
                                    392 ;	./../../mib/stm8s_mib_debug_cmd.c: 197: int GetArgs(char *s, char **argv)
                                    393 ;	-----------------------------------------
                                    394 ;	 function GetArgs
                                    395 ;	-----------------------------------------
      009F0D                        396 _GetArgs:
      009F0D 52 08            [ 2]  397 	sub	sp, #8
      009F0F 1F 05            [ 2]  398 	ldw	(0x05, sp), x
                                    399 ;	./../../mib/stm8s_mib_debug_cmd.c: 199: int args = 0;
      009F11 5F               [ 1]  400 	clrw	x
      009F12 1F 01            [ 2]  401 	ldw	(0x01, sp), x
                                    402 ;	./../../mib/stm8s_mib_debug_cmd.c: 201: if (!s || *s == '\0')
      009F14 1E 05            [ 2]  403 	ldw	x, (0x05, sp)
      009F16 27 03            [ 1]  404 	jreq	00101$
      009F18 F6               [ 1]  405 	ld	a, (x)
      009F19 26 03            [ 1]  406 	jrne	00131$
      009F1B                        407 00101$:
                                    408 ;	./../../mib/stm8s_mib_debug_cmd.c: 202: return 0;
      009F1B 5F               [ 1]  409 	clrw	x
      009F1C 20 73            [ 2]  410 	jra	00120$
                                    411 ;	./../../mib/stm8s_mib_debug_cmd.c: 203: while (args < MAX_ARGS)
      009F1E                        412 00131$:
      009F1E 5F               [ 1]  413 	clrw	x
      009F1F 1F 07            [ 2]  414 	ldw	(0x07, sp), x
      009F21                        415 00117$:
      009F21 1E 07            [ 2]  416 	ldw	x, (0x07, sp)
      009F23 A3 00 05         [ 2]  417 	cpw	x, #0x0005
      009F26 2E 67            [ 1]  418 	jrsge	00119$
                                    419 ;	./../../mib/stm8s_mib_debug_cmd.c: 206: while ((*s == ' ') || (*s == '\t'))
      009F28 1E 05            [ 2]  420 	ldw	x, (0x05, sp)
      009F2A                        421 00105$:
      009F2A F6               [ 1]  422 	ld	a, (x)
      009F2B A1 20            [ 1]  423 	cp	a, #0x20
      009F2D 27 04            [ 1]  424 	jreq	00106$
      009F2F A1 09            [ 1]  425 	cp	a, #0x09
      009F31 26 03            [ 1]  426 	jrne	00107$
      009F33                        427 00106$:
                                    428 ;	./../../mib/stm8s_mib_debug_cmd.c: 207: s++;
      009F33 5C               [ 1]  429 	incw	x
      009F34 20 F4            [ 2]  430 	jra	00105$
      009F36                        431 00107$:
                                    432 ;	./../../mib/stm8s_mib_debug_cmd.c: 210: if (*s == '\0')
      009F36 4D               [ 1]  433 	tnz	a
      009F37 26 0D            [ 1]  434 	jrne	00109$
                                    435 ;	./../../mib/stm8s_mib_debug_cmd.c: 212: argv[args] = 0;
      009F39 1E 01            [ 2]  436 	ldw	x, (0x01, sp)
      009F3B 58               [ 2]  437 	sllw	x
      009F3C 72 FB 0B         [ 2]  438 	addw	x, (0x0b, sp)
      009F3F 6F 01            [ 1]  439 	clr	(0x1, x)
      009F41 7F               [ 1]  440 	clr	(x)
                                    441 ;	./../../mib/stm8s_mib_debug_cmd.c: 213: return args;
      009F42 1E 01            [ 2]  442 	ldw	x, (0x01, sp)
      009F44 20 4B            [ 2]  443 	jra	00120$
      009F46                        444 00109$:
                                    445 ;	./../../mib/stm8s_mib_debug_cmd.c: 216: argv[args++] = s;
      009F46 16 07            [ 2]  446 	ldw	y, (0x07, sp)
      009F48 17 03            [ 2]  447 	ldw	(0x03, sp), y
      009F4A 16 07            [ 2]  448 	ldw	y, (0x07, sp)
      009F4C 90 5C            [ 1]  449 	incw	y
      009F4E 17 07            [ 2]  450 	ldw	(0x07, sp), y
      009F50 17 01            [ 2]  451 	ldw	(0x01, sp), y
      009F52 16 03            [ 2]  452 	ldw	y, (0x03, sp)
      009F54 90 58            [ 2]  453 	sllw	y
      009F56 72 F9 0B         [ 2]  454 	addw	y, (0x0b, sp)
      009F59 90 FF            [ 2]  455 	ldw	(y), x
                                    456 ;	./../../mib/stm8s_mib_debug_cmd.c: 219: while (*s && (*s != ' ') && (*s != '\t'))
      009F5B 1F 05            [ 2]  457 	ldw	(0x05, sp), x
      009F5D                        458 00112$:
      009F5D 1E 05            [ 2]  459 	ldw	x, (0x05, sp)
      009F5F F6               [ 1]  460 	ld	a, (x)
                                    461 ;	./../../mib/stm8s_mib_debug_cmd.c: 220: s++;
      009F60 1E 05            [ 2]  462 	ldw	x, (0x05, sp)
      009F62 5C               [ 1]  463 	incw	x
      009F63 1F 03            [ 2]  464 	ldw	(0x03, sp), x
                                    465 ;	./../../mib/stm8s_mib_debug_cmd.c: 219: while (*s && (*s != ' ') && (*s != '\t'))
      009F65 4D               [ 1]  466 	tnz	a
      009F66 27 0E            [ 1]  467 	jreq	00114$
      009F68 A1 20            [ 1]  468 	cp	a, #0x20
      009F6A 27 0A            [ 1]  469 	jreq	00114$
      009F6C A1 09            [ 1]  470 	cp	a, #0x09
      009F6E 27 06            [ 1]  471 	jreq	00114$
                                    472 ;	./../../mib/stm8s_mib_debug_cmd.c: 220: s++;
      009F70 16 03            [ 2]  473 	ldw	y, (0x03, sp)
      009F72 17 05            [ 2]  474 	ldw	(0x05, sp), y
      009F74 20 E7            [ 2]  475 	jra	00112$
      009F76                        476 00114$:
                                    477 ;	./../../mib/stm8s_mib_debug_cmd.c: 222: if (*s == '\0')
      009F76 4D               [ 1]  478 	tnz	a
      009F77 26 0D            [ 1]  479 	jrne	00116$
                                    480 ;	./../../mib/stm8s_mib_debug_cmd.c: 224: argv[args] = 0;
      009F79 1E 01            [ 2]  481 	ldw	x, (0x01, sp)
      009F7B 58               [ 2]  482 	sllw	x
      009F7C 72 FB 0B         [ 2]  483 	addw	x, (0x0b, sp)
      009F7F 6F 01            [ 1]  484 	clr	(0x1, x)
      009F81 7F               [ 1]  485 	clr	(x)
                                    486 ;	./../../mib/stm8s_mib_debug_cmd.c: 225: return args;
      009F82 1E 01            [ 2]  487 	ldw	x, (0x01, sp)
      009F84 20 0B            [ 2]  488 	jra	00120$
      009F86                        489 00116$:
                                    490 ;	./../../mib/stm8s_mib_debug_cmd.c: 227: *s++ = '\0';
      009F86 1E 05            [ 2]  491 	ldw	x, (0x05, sp)
      009F88 7F               [ 1]  492 	clr	(x)
      009F89 16 03            [ 2]  493 	ldw	y, (0x03, sp)
      009F8B 17 05            [ 2]  494 	ldw	(0x05, sp), y
      009F8D 20 92            [ 2]  495 	jra	00117$
      009F8F                        496 00119$:
                                    497 ;	./../../mib/stm8s_mib_debug_cmd.c: 229: return args;
      009F8F 1E 01            [ 2]  498 	ldw	x, (0x01, sp)
      009F91                        499 00120$:
                                    500 ;	./../../mib/stm8s_mib_debug_cmd.c: 230: } // GetArgs.
      009F91 5B 08            [ 2]  501 	addw	sp, #8
      009F93 90 85            [ 2]  502 	popw	y
      009F95 5B 02            [ 2]  503 	addw	sp, #2
      009F97 90 FC            [ 2]  504 	jp	(y)
                                    505 ;	./../../mib/stm8s_mib_debug_cmd.c: 241: int HexToInt(char *s, void *retval, uint16_t type)
                                    506 ;	-----------------------------------------
                                    507 ;	 function HexToInt
                                    508 ;	-----------------------------------------
      009F99                        509 _HexToInt:
      009F99 52 0E            [ 2]  510 	sub	sp, #14
                                    511 ;	./../../mib/stm8s_mib_debug_cmd.c: 247: if (!s || !retval)
      009F9B 1F 0A            [ 2]  512 	ldw	(0x0a, sp), x
      009F9D 27 04            [ 1]  513 	jreq	00101$
      009F9F 1E 11            [ 2]  514 	ldw	x, (0x11, sp)
      009FA1 26 04            [ 1]  515 	jrne	00102$
      009FA3                        516 00101$:
                                    517 ;	./../../mib/stm8s_mib_debug_cmd.c: 248: return FALSE;
      009FA3 5F               [ 1]  518 	clrw	x
      009FA4 CC A0 7F         [ 2]  519 	jp	00132$
      009FA7                        520 00102$:
                                    521 ;	./../../mib/stm8s_mib_debug_cmd.c: 249: if (!strncmp(s, "0x", 2))
      009FA7 4B 02            [ 1]  522 	push	#0x02
      009FA9 4B 00            [ 1]  523 	push	#0x00
      009FAB 4B 47            [ 1]  524 	push	#<(___str_2+0)
      009FAD 4B 88            [ 1]  525 	push	#((___str_2+0) >> 8)
      009FAF 1E 0E            [ 2]  526 	ldw	x, (0x0e, sp)
      009FB1 CD AF DA         [ 4]  527 	call	_strncmp
      009FB4 5D               [ 2]  528 	tnzw	x
      009FB5 26 06            [ 1]  529 	jrne	00105$
                                    530 ;	./../../mib/stm8s_mib_debug_cmd.c: 250: s += 2;
      009FB7 1E 0A            [ 2]  531 	ldw	x, (0x0a, sp)
      009FB9 5C               [ 1]  532 	incw	x
      009FBA 5C               [ 1]  533 	incw	x
      009FBB 1F 0A            [ 2]  534 	ldw	(0x0a, sp), x
      009FBD                        535 00105$:
                                    536 ;	./../../mib/stm8s_mib_debug_cmd.c: 252: for (i = 0, rval = 0; i < type / 4; i++)
      009FBD 0F 01            [ 1]  537 	clr	(0x01, sp)
      009FBF 5F               [ 1]  538 	clrw	x
      009FC0 1F 04            [ 2]  539 	ldw	(0x04, sp), x
      009FC2 1F 02            [ 2]  540 	ldw	(0x02, sp), x
      009FC4 16 0A            [ 2]  541 	ldw	y, (0x0a, sp)
      009FC6 17 0C            [ 2]  542 	ldw	(0x0c, sp), y
      009FC8 0F 0E            [ 1]  543 	clr	(0x0e, sp)
      009FCA                        544 00130$:
      009FCA 16 13            [ 2]  545 	ldw	y, (0x13, sp)
      009FCC 17 06            [ 2]  546 	ldw	(0x06, sp), y
      009FCE 93               [ 1]  547 	ldw	x, y
      009FCF 54               [ 2]  548 	srlw	x
      009FD0 54               [ 2]  549 	srlw	x
      009FD1 1F 08            [ 2]  550 	ldw	(0x08, sp), x
      009FD3 7B 0E            [ 1]  551 	ld	a, (0x0e, sp)
      009FD5 5F               [ 1]  552 	clrw	x
      009FD6 97               [ 1]  553 	ld	xl, a
      009FD7 13 08            [ 2]  554 	cpw	x, (0x08, sp)
      009FD9 24 70            [ 1]  555 	jrnc	00123$
                                    556 ;	./../../mib/stm8s_mib_debug_cmd.c: 254: if (*s == '\0')
      009FDB 1E 0C            [ 2]  557 	ldw	x, (0x0c, sp)
      009FDD F6               [ 1]  558 	ld	a, (x)
      009FDE 26 08            [ 1]  559 	jrne	00110$
                                    560 ;	./../../mib/stm8s_mib_debug_cmd.c: 256: if (i == 0)
      009FE0 0D 01            [ 1]  561 	tnz	(0x01, sp)
      009FE2 26 67            [ 1]  562 	jrne	00123$
                                    563 ;	./../../mib/stm8s_mib_debug_cmd.c: 257: return FALSE;
      009FE4 5F               [ 1]  564 	clrw	x
      009FE5 CC A0 7F         [ 2]  565 	jp	00132$
                                    566 ;	./../../mib/stm8s_mib_debug_cmd.c: 259: break;
      009FE8                        567 00110$:
                                    568 ;	./../../mib/stm8s_mib_debug_cmd.c: 261: c = *s++;
      009FE8 1E 0C            [ 2]  569 	ldw	x, (0x0c, sp)
      009FEA 5C               [ 1]  570 	incw	x
      009FEB 1F 0C            [ 2]  571 	ldw	(0x0c, sp), x
                                    572 ;	./../../mib/stm8s_mib_debug_cmd.c: 264: c -= '0';
      009FED 97               [ 1]  573 	ld	xl, a
                                    574 ;	./../../mib/stm8s_mib_debug_cmd.c: 263: if (c >= '0' && c <= '9')
      009FEE A1 30            [ 1]  575 	cp	a, #0x30
      009FF0 25 09            [ 1]  576 	jrc	00120$
      009FF2 A1 39            [ 1]  577 	cp	a, #0x39
      009FF4 22 05            [ 1]  578 	jrugt	00120$
                                    579 ;	./../../mib/stm8s_mib_debug_cmd.c: 264: c -= '0';
      009FF6 9F               [ 1]  580 	ld	a, xl
      009FF7 A0 30            [ 1]  581 	sub	a, #0x30
      009FF9 20 1D            [ 2]  582 	jra	00121$
      009FFB                        583 00120$:
                                    584 ;	./../../mib/stm8s_mib_debug_cmd.c: 265: else if (c >= 'a' && c <= 'f')
      009FFB A1 61            [ 1]  585 	cp	a, #0x61
      009FFD 25 09            [ 1]  586 	jrc	00116$
      009FFF A1 66            [ 1]  587 	cp	a, #0x66
      00A001 22 05            [ 1]  588 	jrugt	00116$
                                    589 ;	./../../mib/stm8s_mib_debug_cmd.c: 266: c = c - 'a' + 10;
      00A003 9F               [ 1]  590 	ld	a, xl
      00A004 AB A9            [ 1]  591 	add	a, #0xa9
      00A006 20 10            [ 2]  592 	jra	00121$
      00A008                        593 00116$:
                                    594 ;	./../../mib/stm8s_mib_debug_cmd.c: 267: else if (c >= 'A' && c <= 'F')
      00A008 A1 41            [ 1]  595 	cp	a, #0x41
      00A00A 25 09            [ 1]  596 	jrc	00112$
      00A00C A1 46            [ 1]  597 	cp	a, #0x46
      00A00E 22 05            [ 1]  598 	jrugt	00112$
                                    599 ;	./../../mib/stm8s_mib_debug_cmd.c: 268: c = c - 'A' + 10;
      00A010 9F               [ 1]  600 	ld	a, xl
      00A011 AB C9            [ 1]  601 	add	a, #0xc9
      00A013 20 03            [ 2]  602 	jra	00121$
      00A015                        603 00112$:
                                    604 ;	./../../mib/stm8s_mib_debug_cmd.c: 270: return FALSE;
      00A015 5F               [ 1]  605 	clrw	x
      00A016 20 67            [ 2]  606 	jra	00132$
      00A018                        607 00121$:
                                    608 ;	./../../mib/stm8s_mib_debug_cmd.c: 272: rval = rval << 4 | c;
      00A018 88               [ 1]  609 	push	a
      00A019 1E 05            [ 2]  610 	ldw	x, (0x05, sp)
      00A01B 16 03            [ 2]  611 	ldw	y, (0x03, sp)
      00A01D A6 04            [ 1]  612 	ld	a, #0x04
      00A01F                        613 00222$:
      00A01F 58               [ 2]  614 	sllw	x
      00A020 90 59            [ 2]  615 	rlcw	y
      00A022 4A               [ 1]  616 	dec	a
      00A023 26 FA            [ 1]  617 	jrne	00222$
      00A025 84               [ 1]  618 	pop	a
      00A026 0F 08            [ 1]  619 	clr	(0x08, sp)
      00A028 0F 07            [ 1]  620 	clr	(0x07, sp)
      00A02A 0F 06            [ 1]  621 	clr	(0x06, sp)
      00A02C 89               [ 2]  622 	pushw	x
      00A02D 1A 02            [ 1]  623 	or	a, (2, sp)
      00A02F 85               [ 2]  624 	popw	x
      00A030 02               [ 1]  625 	rlwa	x
      00A031 1A 08            [ 1]  626 	or	a, (0x08, sp)
      00A033 95               [ 1]  627 	ld	xh, a
      00A034 90 9F            [ 1]  628 	ld	a, yl
      00A036 1A 07            [ 1]  629 	or	a, (0x07, sp)
      00A038 90 02            [ 1]  630 	rlwa	y
      00A03A 1A 06            [ 1]  631 	or	a, (0x06, sp)
      00A03C 90 95            [ 1]  632 	ld	yh, a
      00A03E 1F 04            [ 2]  633 	ldw	(0x04, sp), x
      00A040 17 02            [ 2]  634 	ldw	(0x02, sp), y
                                    635 ;	./../../mib/stm8s_mib_debug_cmd.c: 252: for (i = 0, rval = 0; i < type / 4; i++)
      00A042 0C 0E            [ 1]  636 	inc	(0x0e, sp)
      00A044 7B 0E            [ 1]  637 	ld	a, (0x0e, sp)
      00A046 6B 01            [ 1]  638 	ld	(0x01, sp), a
      00A048 CC 9F CA         [ 2]  639 	jp	00130$
      00A04B                        640 00123$:
                                    641 ;	./../../mib/stm8s_mib_debug_cmd.c: 275: switch (type)
      00A04B 1E 06            [ 2]  642 	ldw	x, (0x06, sp)
      00A04D A3 00 08         [ 2]  643 	cpw	x, #0x0008
      00A050 27 10            [ 1]  644 	jreq	00124$
      00A052 1E 06            [ 2]  645 	ldw	x, (0x06, sp)
      00A054 A3 00 10         [ 2]  646 	cpw	x, #0x0010
      00A057 27 10            [ 1]  647 	jreq	00125$
      00A059 1E 06            [ 2]  648 	ldw	x, (0x06, sp)
      00A05B A3 00 20         [ 2]  649 	cpw	x, #0x0020
      00A05E 27 10            [ 1]  650 	jreq	00126$
      00A060 20 19            [ 2]  651 	jra	00127$
                                    652 ;	./../../mib/stm8s_mib_debug_cmd.c: 277: case 8:
      00A062                        653 00124$:
                                    654 ;	./../../mib/stm8s_mib_debug_cmd.c: 278: *(uint8_t *)retval = (uint8_t)rval;
      00A062 1E 11            [ 2]  655 	ldw	x, (0x11, sp)
      00A064 7B 05            [ 1]  656 	ld	a, (0x05, sp)
      00A066 F7               [ 1]  657 	ld	(x), a
                                    658 ;	./../../mib/stm8s_mib_debug_cmd.c: 279: break;
      00A067 20 14            [ 2]  659 	jra	00128$
                                    660 ;	./../../mib/stm8s_mib_debug_cmd.c: 280: case 16:
      00A069                        661 00125$:
                                    662 ;	./../../mib/stm8s_mib_debug_cmd.c: 281: *(uint16_t *)retval = (uint16_t)rval;
      00A069 1E 11            [ 2]  663 	ldw	x, (0x11, sp)
      00A06B 16 04            [ 2]  664 	ldw	y, (0x04, sp)
      00A06D FF               [ 2]  665 	ldw	(x), y
                                    666 ;	./../../mib/stm8s_mib_debug_cmd.c: 282: break;
      00A06E 20 0D            [ 2]  667 	jra	00128$
                                    668 ;	./../../mib/stm8s_mib_debug_cmd.c: 283: case 32:
      00A070                        669 00126$:
                                    670 ;	./../../mib/stm8s_mib_debug_cmd.c: 284: *(uint32_t *)retval = (uint32_t)rval;
      00A070 1E 11            [ 2]  671 	ldw	x, (0x11, sp)
      00A072 16 04            [ 2]  672 	ldw	y, (0x04, sp)
      00A074 EF 02            [ 2]  673 	ldw	(0x2, x), y
      00A076 16 02            [ 2]  674 	ldw	y, (0x02, sp)
      00A078 FF               [ 2]  675 	ldw	(x), y
                                    676 ;	./../../mib/stm8s_mib_debug_cmd.c: 285: break;
      00A079 20 02            [ 2]  677 	jra	00128$
                                    678 ;	./../../mib/stm8s_mib_debug_cmd.c: 286: default:
      00A07B                        679 00127$:
                                    680 ;	./../../mib/stm8s_mib_debug_cmd.c: 287: return FALSE;
      00A07B 5F               [ 1]  681 	clrw	x
                                    682 ;	./../../mib/stm8s_mib_debug_cmd.c: 288: }
                                    683 ;	./../../mib/stm8s_mib_debug_cmd.c: 289: return TRUE;
      00A07C C5                     684 	.byte 0xc5
      00A07D                        685 00128$:
      00A07D 5F               [ 1]  686 	clrw	x
      00A07E 5C               [ 1]  687 	incw	x
      00A07F                        688 00132$:
                                    689 ;	./../../mib/stm8s_mib_debug_cmd.c: 290: } // HexToInt.
      00A07F 16 0F            [ 2]  690 	ldw	y, (15, sp)
      00A081 5B 14            [ 2]  691 	addw	sp, #20
      00A083 90 FC            [ 2]  692 	jp	(y)
                                    693 ;	./../../mib/stm8s_mib_debug_cmd.c: 300: int DecToLong(char *s, void *retval, uint16_t type)
                                    694 ;	-----------------------------------------
                                    695 ;	 function DecToLong
                                    696 ;	-----------------------------------------
      00A085                        697 _DecToLong:
      00A085 52 0E            [ 2]  698 	sub	sp, #14
                                    699 ;	./../../mib/stm8s_mib_debug_cmd.c: 305: if (!s || !s[0] || !retval)
      00A087 5D               [ 2]  700 	tnzw	x
      00A088 27 07            [ 1]  701 	jreq	00101$
      00A08A F6               [ 1]  702 	ld	a, (x)
      00A08B 27 04            [ 1]  703 	jreq	00101$
      00A08D 16 11            [ 2]  704 	ldw	y, (0x11, sp)
      00A08F 26 03            [ 1]  705 	jrne	00102$
      00A091                        706 00101$:
                                    707 ;	./../../mib/stm8s_mib_debug_cmd.c: 306: return FALSE;
      00A091 5F               [ 1]  708 	clrw	x
      00A092 20 73            [ 2]  709 	jra	00117$
      00A094                        710 00102$:
                                    711 ;	./../../mib/stm8s_mib_debug_cmd.c: 308: for (rval= 0; *s; s++)
      00A094 90 5F            [ 1]  712 	clrw	y
      00A096 17 09            [ 2]  713 	ldw	(0x09, sp), y
      00A098 1F 0D            [ 2]  714 	ldw	(0x0d, sp), x
      00A09A                        715 00115$:
      00A09A 1E 0D            [ 2]  716 	ldw	x, (0x0d, sp)
      00A09C F6               [ 1]  717 	ld	a, (x)
      00A09D 27 3C            [ 1]  718 	jreq	00108$
                                    719 ;	./../../mib/stm8s_mib_debug_cmd.c: 310: if (*s < '0' || *s > '9')
      00A09F A1 30            [ 1]  720 	cp	a, #0x30
      00A0A1 25 04            [ 1]  721 	jrc	00105$
      00A0A3 A1 39            [ 1]  722 	cp	a, #0x39
      00A0A5 23 03            [ 2]  723 	jrule	00106$
      00A0A7                        724 00105$:
                                    725 ;	./../../mib/stm8s_mib_debug_cmd.c: 311: return FALSE;
      00A0A7 5F               [ 1]  726 	clrw	x
      00A0A8 20 5D            [ 2]  727 	jra	00117$
      00A0AA                        728 00106$:
                                    729 ;	./../../mib/stm8s_mib_debug_cmd.c: 312: c = *s - '0';
      00A0AA A0 30            [ 1]  730 	sub	a, #0x30
                                    731 ;	./../../mib/stm8s_mib_debug_cmd.c: 313: rval = rval * 10 + c;
      00A0AC 88               [ 1]  732 	push	a
      00A0AD 90 89            [ 2]  733 	pushw	y
      00A0AF 1E 0C            [ 2]  734 	ldw	x, (0x0c, sp)
      00A0B1 89               [ 2]  735 	pushw	x
      00A0B2 4B 0A            [ 1]  736 	push	#0x0a
      00A0B4 5F               [ 1]  737 	clrw	x
      00A0B5 89               [ 2]  738 	pushw	x
      00A0B6 4B 00            [ 1]  739 	push	#0x00
      00A0B8 CD B1 56         [ 4]  740 	call	__mullong
      00A0BB 5B 08            [ 2]  741 	addw	sp, #8
      00A0BD 1F 04            [ 2]  742 	ldw	(0x04, sp), x
      00A0BF 84               [ 1]  743 	pop	a
      00A0C0 5F               [ 1]  744 	clrw	x
      00A0C1 1F 05            [ 2]  745 	ldw	(0x05, sp), x
      00A0C3 97               [ 1]  746 	ld	xl, a
      00A0C4 72 FB 03         [ 2]  747 	addw	x, (0x03, sp)
      00A0C7 90 9F            [ 1]  748 	ld	a, yl
      00A0C9 19 06            [ 1]  749 	adc	a, (0x06, sp)
      00A0CB 6B 0A            [ 1]  750 	ld	(0x0a, sp), a
      00A0CD 90 9E            [ 1]  751 	ld	a, yh
      00A0CF 19 05            [ 1]  752 	adc	a, (0x05, sp)
      00A0D1 6B 09            [ 1]  753 	ld	(0x09, sp), a
      00A0D3 51               [ 1]  754 	exgw	x, y
                                    755 ;	./../../mib/stm8s_mib_debug_cmd.c: 308: for (rval= 0; *s; s++)
      00A0D4 1E 0D            [ 2]  756 	ldw	x, (0x0d, sp)
      00A0D6 5C               [ 1]  757 	incw	x
      00A0D7 1F 0D            [ 2]  758 	ldw	(0x0d, sp), x
      00A0D9 20 BF            [ 2]  759 	jra	00115$
      00A0DB                        760 00108$:
                                    761 ;	./../../mib/stm8s_mib_debug_cmd.c: 316: switch (type)
      00A0DB 1E 13            [ 2]  762 	ldw	x, (0x13, sp)
      00A0DD A3 00 08         [ 2]  763 	cpw	x, #0x0008
      00A0E0 27 0C            [ 1]  764 	jreq	00109$
      00A0E2 A3 00 10         [ 2]  765 	cpw	x, #0x0010
      00A0E5 27 0E            [ 1]  766 	jreq	00110$
      00A0E7 A3 00 20         [ 2]  767 	cpw	x, #0x0020
      00A0EA 27 0E            [ 1]  768 	jreq	00111$
      00A0EC 20 15            [ 2]  769 	jra	00112$
                                    770 ;	./../../mib/stm8s_mib_debug_cmd.c: 318: case 8:
      00A0EE                        771 00109$:
                                    772 ;	./../../mib/stm8s_mib_debug_cmd.c: 319: *(uint8_t *)retval = (uint8_t)rval;
      00A0EE 1E 11            [ 2]  773 	ldw	x, (0x11, sp)
      00A0F0 90 9F            [ 1]  774 	ld	a, yl
      00A0F2 F7               [ 1]  775 	ld	(x), a
                                    776 ;	./../../mib/stm8s_mib_debug_cmd.c: 320: break;
      00A0F3 20 10            [ 2]  777 	jra	00113$
                                    778 ;	./../../mib/stm8s_mib_debug_cmd.c: 321: case 16:
      00A0F5                        779 00110$:
                                    780 ;	./../../mib/stm8s_mib_debug_cmd.c: 322: *(uint16_t *)retval = (uint16_t)rval;
      00A0F5 1E 11            [ 2]  781 	ldw	x, (0x11, sp)
      00A0F7 FF               [ 2]  782 	ldw	(x), y
                                    783 ;	./../../mib/stm8s_mib_debug_cmd.c: 323: break;
      00A0F8 20 0B            [ 2]  784 	jra	00113$
                                    785 ;	./../../mib/stm8s_mib_debug_cmd.c: 324: case 32:
      00A0FA                        786 00111$:
                                    787 ;	./../../mib/stm8s_mib_debug_cmd.c: 325: *(uint32_t *)retval = (uint32_t)rval;
      00A0FA 1E 11            [ 2]  788 	ldw	x, (0x11, sp)
      00A0FC EF 02            [ 2]  789 	ldw	(0x2, x), y
      00A0FE 16 09            [ 2]  790 	ldw	y, (0x09, sp)
      00A100 FF               [ 2]  791 	ldw	(x), y
                                    792 ;	./../../mib/stm8s_mib_debug_cmd.c: 326: break;
      00A101 20 02            [ 2]  793 	jra	00113$
                                    794 ;	./../../mib/stm8s_mib_debug_cmd.c: 327: default:
      00A103                        795 00112$:
                                    796 ;	./../../mib/stm8s_mib_debug_cmd.c: 328: return FALSE;
      00A103 5F               [ 1]  797 	clrw	x
                                    798 ;	./../../mib/stm8s_mib_debug_cmd.c: 329: }
                                    799 ;	./../../mib/stm8s_mib_debug_cmd.c: 330: return TRUE;
      00A104 C5                     800 	.byte 0xc5
      00A105                        801 00113$:
      00A105 5F               [ 1]  802 	clrw	x
      00A106 5C               [ 1]  803 	incw	x
      00A107                        804 00117$:
                                    805 ;	./../../mib/stm8s_mib_debug_cmd.c: 331: } // DecToLong.
      00A107 16 0F            [ 2]  806 	ldw	y, (15, sp)
      00A109 5B 14            [ 2]  807 	addw	sp, #20
      00A10B 90 FC            [ 2]  808 	jp	(y)
                                    809 ;	./../../mib/stm8s_mib_debug_cmd.c: 340: void HexDump(uint32_t addr, uint32_t len)
                                    810 ;	-----------------------------------------
                                    811 ;	 function HexDump
                                    812 ;	-----------------------------------------
      00A10D                        813 _HexDump:
      00A10D 52 27            [ 2]  814 	sub	sp, #39
                                    815 ;	./../../mib/stm8s_mib_debug_cmd.c: 343: uint32_t endPtr = (addr + len);
      00A10F 16 2C            [ 2]  816 	ldw	y, (0x2c, sp)
      00A111 72 F9 30         [ 2]  817 	addw	y, (0x30, sp)
      00A114 1E 2A            [ 2]  818 	ldw	x, (0x2a, sp)
      00A116 24 01            [ 1]  819 	jrnc	00240$
      00A118 5C               [ 1]  820 	incw	x
      00A119                        821 00240$:
      00A119 72 FB 2E         [ 2]  822 	addw	x, (0x2e, sp)
      00A11C 17 17            [ 2]  823 	ldw	(0x17, sp), y
      00A11E 1F 15            [ 2]  824 	ldw	(0x15, sp), x
                                    825 ;	./../../mib/stm8s_mib_debug_cmd.c: 344: int i, remainder = len & 0xf;
      00A120 1E 30            [ 2]  826 	ldw	x, (0x30, sp)
      00A122 9F               [ 1]  827 	ld	a, xl
      00A123 A4 0F            [ 1]  828 	and	a, #0x0f
      00A125 6B 1A            [ 1]  829 	ld	(0x1a, sp), a
      00A127 0F 19            [ 1]  830 	clr	(0x19, sp)
                                    831 ;	./../../mib/stm8s_mib_debug_cmd.c: 350: mib_printf("\r\n");
      00A129 4B 40            [ 1]  832 	push	#<(___str_0+0)
      00A12B 4B 88            [ 1]  833 	push	#((___str_0+0) >> 8)
      00A12D CD 9C 98         [ 4]  834 	call	_mib_printf
      00A130 5B 02            [ 2]  835 	addw	sp, #2
                                    836 ;	./../../mib/stm8s_mib_debug_cmd.c: 351: mib_printf("address     Hex Value                                        Ascii value\r\n");
      00A132 4B 4A            [ 1]  837 	push	#<(___str_3+0)
      00A134 4B 88            [ 1]  838 	push	#((___str_3+0) >> 8)
      00A136 CD 9C 98         [ 4]  839 	call	_mib_printf
      00A139 5B 02            [ 2]  840 	addw	sp, #2
                                    841 ;	./../../mib/stm8s_mib_debug_cmd.c: 354: p_address = (uint32_t)(addr);
      00A13B 1E 2C            [ 2]  842 	ldw	x, (0x2c, sp)
      00A13D 16 2A            [ 2]  843 	ldw	y, (0x2a, sp)
                                    844 ;	./../../mib/stm8s_mib_debug_cmd.c: 355: p_data_ptr = (uint16_t *)p_data;
                                    845 ;	./../../mib/stm8s_mib_debug_cmd.c: 356: while ((p_address + 16) <= endPtr)
      00A13F 1F 1D            [ 2]  846 	ldw	(0x1d, sp), x
      00A141 17 1B            [ 2]  847 	ldw	(0x1b, sp), y
      00A143                        848 00107$:
      00A143 1E 1D            [ 2]  849 	ldw	x, (0x1d, sp)
      00A145 1C 00 10         [ 2]  850 	addw	x, #0x0010
      00A148 1F 21            [ 2]  851 	ldw	(0x21, sp), x
      00A14A 7B 1C            [ 1]  852 	ld	a, (0x1c, sp)
      00A14C A9 00            [ 1]  853 	adc	a, #0x00
      00A14E 6B 20            [ 1]  854 	ld	(0x20, sp), a
      00A150 7B 1B            [ 1]  855 	ld	a, (0x1b, sp)
      00A152 A9 00            [ 1]  856 	adc	a, #0x00
      00A154 6B 1F            [ 1]  857 	ld	(0x1f, sp), a
      00A156 1E 17            [ 2]  858 	ldw	x, (0x17, sp)
      00A158 13 21            [ 2]  859 	cpw	x, (0x21, sp)
      00A15A 7B 16            [ 1]  860 	ld	a, (0x16, sp)
      00A15C 12 20            [ 1]  861 	sbc	a, (0x20, sp)
      00A15E 7B 15            [ 1]  862 	ld	a, (0x15, sp)
      00A160 12 1F            [ 1]  863 	sbc	a, (0x1f, sp)
      00A162 24 03            [ 1]  864 	jrnc	00241$
      00A164 CC A2 27         [ 2]  865 	jp	00163$
      00A167                        866 00241$:
                                    867 ;	./../../mib/stm8s_mib_debug_cmd.c: 358: mib_printf("0x%08lx : ", p_address);
      00A167 1E 1D            [ 2]  868 	ldw	x, (0x1d, sp)
      00A169 89               [ 2]  869 	pushw	x
      00A16A 1E 1D            [ 2]  870 	ldw	x, (0x1d, sp)
      00A16C 89               [ 2]  871 	pushw	x
      00A16D 4B 95            [ 1]  872 	push	#<(___str_4+0)
      00A16F 4B 88            [ 1]  873 	push	#((___str_4+0) >> 8)
      00A171 CD 9C 98         [ 4]  874 	call	_mib_printf
      00A174 5B 06            [ 2]  875 	addw	sp, #6
                                    876 ;	./../../mib/stm8s_mib_debug_cmd.c: 359: for (i = 0; i < 8; i++)
      00A176 5F               [ 1]  877 	clrw	x
      00A177 1F 26            [ 2]  878 	ldw	(0x26, sp), x
      00A179                        879 00120$:
                                    880 ;	./../../mib/stm8s_mib_debug_cmd.c: 361: p_data_ptr[i] = rd_ADDR16(p_address + i * 2);
      00A179 16 26            [ 2]  881 	ldw	y, (0x26, sp)
      00A17B 90 58            [ 2]  882 	sllw	y
      00A17D 93               [ 1]  883 	ldw	x, y
      00A17E 89               [ 2]  884 	pushw	x
      00A17F 96               [ 1]  885 	ldw	x, sp
      00A180 1C 00 03         [ 2]  886 	addw	x, #3
      00A183 72 FB 01         [ 2]  887 	addw	x, (1, sp)
      00A186 5B 02            [ 2]  888 	addw	sp, #2
      00A188 17 24            [ 2]  889 	ldw	(0x24, sp), y
      00A18A 16 1D            [ 2]  890 	ldw	y, (0x1d, sp)
      00A18C 72 F9 24         [ 2]  891 	addw	y, (0x24, sp)
      00A18F 90 FE            [ 2]  892 	ldw	y, (y)
      00A191 FF               [ 2]  893 	ldw	(x), y
                                    894 ;	./../../mib/stm8s_mib_debug_cmd.c: 362: mib_printf("%02x ", p_data[i * 2]);
      00A192 7B 27            [ 1]  895 	ld	a, (0x27, sp)
      00A194 48               [ 1]  896 	sll	a
      00A195 6B 23            [ 1]  897 	ld	(0x23, sp), a
      00A197 6B 25            [ 1]  898 	ld	(0x25, sp), a
      00A199 49               [ 1]  899 	rlc	a
      00A19A 4F               [ 1]  900 	clr	a
      00A19B A2 00            [ 1]  901 	sbc	a, #0x00
      00A19D 6B 24            [ 1]  902 	ld	(0x24, sp), a
      00A19F 96               [ 1]  903 	ldw	x, sp
      00A1A0 5C               [ 1]  904 	incw	x
      00A1A1 72 FB 24         [ 2]  905 	addw	x, (0x24, sp)
      00A1A4 F6               [ 1]  906 	ld	a, (x)
      00A1A5 5F               [ 1]  907 	clrw	x
      00A1A6 97               [ 1]  908 	ld	xl, a
      00A1A7 89               [ 2]  909 	pushw	x
      00A1A8 4B A0            [ 1]  910 	push	#<(___str_5+0)
      00A1AA 4B 88            [ 1]  911 	push	#((___str_5+0) >> 8)
      00A1AC CD 9C 98         [ 4]  912 	call	_mib_printf
      00A1AF 5B 04            [ 2]  913 	addw	sp, #4
                                    914 ;	./../../mib/stm8s_mib_debug_cmd.c: 363: mib_printf("%02x ", p_data[i * 2 + 1]);
      00A1B1 7B 23            [ 1]  915 	ld	a, (0x23, sp)
      00A1B3 4C               [ 1]  916 	inc	a
      00A1B4 6B 25            [ 1]  917 	ld	(0x25, sp), a
      00A1B6 49               [ 1]  918 	rlc	a
      00A1B7 4F               [ 1]  919 	clr	a
      00A1B8 A2 00            [ 1]  920 	sbc	a, #0x00
      00A1BA 6B 24            [ 1]  921 	ld	(0x24, sp), a
      00A1BC 96               [ 1]  922 	ldw	x, sp
      00A1BD 5C               [ 1]  923 	incw	x
      00A1BE 72 FB 24         [ 2]  924 	addw	x, (0x24, sp)
      00A1C1 F6               [ 1]  925 	ld	a, (x)
      00A1C2 5F               [ 1]  926 	clrw	x
      00A1C3 97               [ 1]  927 	ld	xl, a
      00A1C4 89               [ 2]  928 	pushw	x
      00A1C5 4B A0            [ 1]  929 	push	#<(___str_5+0)
      00A1C7 4B 88            [ 1]  930 	push	#((___str_5+0) >> 8)
      00A1C9 CD 9C 98         [ 4]  931 	call	_mib_printf
      00A1CC 5B 04            [ 2]  932 	addw	sp, #4
                                    933 ;	./../../mib/stm8s_mib_debug_cmd.c: 359: for (i = 0; i < 8; i++)
      00A1CE 1E 26            [ 2]  934 	ldw	x, (0x26, sp)
      00A1D0 5C               [ 1]  935 	incw	x
      00A1D1 1F 26            [ 2]  936 	ldw	(0x26, sp), x
      00A1D3 A3 00 08         [ 2]  937 	cpw	x, #0x0008
      00A1D6 2F A1            [ 1]  938 	jrslt	00120$
                                    939 ;	./../../mib/stm8s_mib_debug_cmd.c: 365: mib_printf(" ");
      00A1D8 4B A6            [ 1]  940 	push	#<(___str_6+0)
      00A1DA 4B 88            [ 1]  941 	push	#((___str_6+0) >> 8)
      00A1DC CD 9C 98         [ 4]  942 	call	_mib_printf
      00A1DF 5B 02            [ 2]  943 	addw	sp, #2
                                    944 ;	./../../mib/stm8s_mib_debug_cmd.c: 366: for (i = 0; i < 16; i++)
      00A1E1 5F               [ 1]  945 	clrw	x
      00A1E2 1F 26            [ 2]  946 	ldw	(0x26, sp), x
      00A1E4                        947 00122$:
                                    948 ;	./../../mib/stm8s_mib_debug_cmd.c: 368: c = p_data[i];
      00A1E4 96               [ 1]  949 	ldw	x, sp
      00A1E5 5C               [ 1]  950 	incw	x
      00A1E6 72 FB 26         [ 2]  951 	addw	x, (0x26, sp)
      00A1E9 F6               [ 1]  952 	ld	a, (x)
                                    953 ;	./../../mib/stm8s_mib_debug_cmd.c: 369: if (c >= 32 && c <= 125)
      00A1EA A1 20            [ 1]  954 	cp	a, #0x20
      00A1EC 25 12            [ 1]  955 	jrc	00103$
      00A1EE A1 7D            [ 1]  956 	cp	a, #0x7d
      00A1F0 22 0E            [ 1]  957 	jrugt	00103$
                                    958 ;	./../../mib/stm8s_mib_debug_cmd.c: 370: mib_printf("%c", c);
      00A1F2 5F               [ 1]  959 	clrw	x
      00A1F3 97               [ 1]  960 	ld	xl, a
      00A1F4 89               [ 2]  961 	pushw	x
      00A1F5 4B A8            [ 1]  962 	push	#<(___str_7+0)
      00A1F7 4B 88            [ 1]  963 	push	#((___str_7+0) >> 8)
      00A1F9 CD 9C 98         [ 4]  964 	call	_mib_printf
      00A1FC 5B 04            [ 2]  965 	addw	sp, #4
      00A1FE 20 09            [ 2]  966 	jra	00123$
      00A200                        967 00103$:
                                    968 ;	./../../mib/stm8s_mib_debug_cmd.c: 372: mib_printf(".");
      00A200 4B AB            [ 1]  969 	push	#<(___str_8+0)
      00A202 4B 88            [ 1]  970 	push	#((___str_8+0) >> 8)
      00A204 CD 9C 98         [ 4]  971 	call	_mib_printf
      00A207 5B 02            [ 2]  972 	addw	sp, #2
      00A209                        973 00123$:
                                    974 ;	./../../mib/stm8s_mib_debug_cmd.c: 366: for (i = 0; i < 16; i++)
      00A209 1E 26            [ 2]  975 	ldw	x, (0x26, sp)
      00A20B 5C               [ 1]  976 	incw	x
      00A20C 1F 26            [ 2]  977 	ldw	(0x26, sp), x
      00A20E A3 00 10         [ 2]  978 	cpw	x, #0x0010
      00A211 2F D1            [ 1]  979 	jrslt	00122$
                                    980 ;	./../../mib/stm8s_mib_debug_cmd.c: 374: p_address += 16;
      00A213 16 21            [ 2]  981 	ldw	y, (0x21, sp)
      00A215 17 1D            [ 2]  982 	ldw	(0x1d, sp), y
      00A217 16 1F            [ 2]  983 	ldw	y, (0x1f, sp)
      00A219 17 1B            [ 2]  984 	ldw	(0x1b, sp), y
                                    985 ;	./../../mib/stm8s_mib_debug_cmd.c: 376: mib_printf("\r\n");
      00A21B 4B 40            [ 1]  986 	push	#<(___str_0+0)
      00A21D 4B 88            [ 1]  987 	push	#((___str_0+0) >> 8)
      00A21F CD 9C 98         [ 4]  988 	call	_mib_printf
      00A222 5B 02            [ 2]  989 	addw	sp, #2
      00A224 CC A1 43         [ 2]  990 	jp	00107$
      00A227                        991 00163$:
      00A227 16 1D            [ 2]  992 	ldw	y, (0x1d, sp)
      00A229 17 24            [ 2]  993 	ldw	(0x24, sp), y
      00A22B 16 1B            [ 2]  994 	ldw	y, (0x1b, sp)
      00A22D 17 22            [ 2]  995 	ldw	(0x22, sp), y
                                    996 ;	./../../mib/stm8s_mib_debug_cmd.c: 380: if (remainder)
      00A22F 1E 19            [ 2]  997 	ldw	x, (0x19, sp)
      00A231 26 03            [ 1]  998 	jrne	00248$
      00A233 CC A3 43         [ 2]  999 	jp	00119$
      00A236                       1000 00248$:
                                   1001 ;	./../../mib/stm8s_mib_debug_cmd.c: 382: mib_printf("0x%08lx  ", p_address);
      00A236 1E 1D            [ 2] 1002 	ldw	x, (0x1d, sp)
      00A238 89               [ 2] 1003 	pushw	x
      00A239 1E 1D            [ 2] 1004 	ldw	x, (0x1d, sp)
      00A23B 89               [ 2] 1005 	pushw	x
      00A23C 4B AD            [ 1] 1006 	push	#<(___str_9+0)
      00A23E 4B 88            [ 1] 1007 	push	#((___str_9+0) >> 8)
      00A240 CD 9C 98         [ 4] 1008 	call	_mib_printf
      00A243 5B 06            [ 2] 1009 	addw	sp, #6
                                   1010 ;	./../../mib/stm8s_mib_debug_cmd.c: 383: for (i = 0; i < (remainder >> 1); i++)
      00A245 1E 19            [ 2] 1011 	ldw	x, (0x19, sp)
      00A247 57               [ 2] 1012 	sraw	x
      00A248 1F 1D            [ 2] 1013 	ldw	(0x1d, sp), x
      00A24A 5F               [ 1] 1014 	clrw	x
      00A24B 1F 26            [ 2] 1015 	ldw	(0x26, sp), x
      00A24D                       1016 00125$:
      00A24D 1E 26            [ 2] 1017 	ldw	x, (0x26, sp)
      00A24F 13 1D            [ 2] 1018 	cpw	x, (0x1d, sp)
      00A251 2E 5C            [ 1] 1019 	jrsge	00110$
                                   1020 ;	./../../mib/stm8s_mib_debug_cmd.c: 385: p_data_ptr[i] = rd_ADDR16(p_address + i * 2);
      00A253 16 26            [ 2] 1021 	ldw	y, (0x26, sp)
      00A255 90 58            [ 2] 1022 	sllw	y
      00A257 93               [ 1] 1023 	ldw	x, y
      00A258 89               [ 2] 1024 	pushw	x
      00A259 96               [ 1] 1025 	ldw	x, sp
      00A25A 1C 00 03         [ 2] 1026 	addw	x, #3
      00A25D 72 FB 01         [ 2] 1027 	addw	x, (1, sp)
      00A260 5B 02            [ 2] 1028 	addw	sp, #2
      00A262 17 20            [ 2] 1029 	ldw	(0x20, sp), y
      00A264 16 24            [ 2] 1030 	ldw	y, (0x24, sp)
      00A266 72 F9 20         [ 2] 1031 	addw	y, (0x20, sp)
      00A269 90 FE            [ 2] 1032 	ldw	y, (y)
      00A26B FF               [ 2] 1033 	ldw	(x), y
                                   1034 ;	./../../mib/stm8s_mib_debug_cmd.c: 386: mib_printf("%02x ", p_data[i * 2]);
      00A26C 7B 27            [ 1] 1035 	ld	a, (0x27, sp)
      00A26E 48               [ 1] 1036 	sll	a
      00A26F 6B 1F            [ 1] 1037 	ld	(0x1f, sp), a
      00A271 6B 21            [ 1] 1038 	ld	(0x21, sp), a
      00A273 49               [ 1] 1039 	rlc	a
      00A274 4F               [ 1] 1040 	clr	a
      00A275 A2 00            [ 1] 1041 	sbc	a, #0x00
      00A277 6B 20            [ 1] 1042 	ld	(0x20, sp), a
      00A279 96               [ 1] 1043 	ldw	x, sp
      00A27A 5C               [ 1] 1044 	incw	x
      00A27B 72 FB 20         [ 2] 1045 	addw	x, (0x20, sp)
      00A27E F6               [ 1] 1046 	ld	a, (x)
      00A27F 5F               [ 1] 1047 	clrw	x
      00A280 97               [ 1] 1048 	ld	xl, a
      00A281 89               [ 2] 1049 	pushw	x
      00A282 4B A0            [ 1] 1050 	push	#<(___str_5+0)
      00A284 4B 88            [ 1] 1051 	push	#((___str_5+0) >> 8)
      00A286 CD 9C 98         [ 4] 1052 	call	_mib_printf
      00A289 5B 04            [ 2] 1053 	addw	sp, #4
                                   1054 ;	./../../mib/stm8s_mib_debug_cmd.c: 387: mib_printf("%02x ", p_data[i * 2 + 1]);
      00A28B 7B 1F            [ 1] 1055 	ld	a, (0x1f, sp)
      00A28D 4C               [ 1] 1056 	inc	a
      00A28E 6B 21            [ 1] 1057 	ld	(0x21, sp), a
      00A290 49               [ 1] 1058 	rlc	a
      00A291 4F               [ 1] 1059 	clr	a
      00A292 A2 00            [ 1] 1060 	sbc	a, #0x00
      00A294 6B 20            [ 1] 1061 	ld	(0x20, sp), a
      00A296 96               [ 1] 1062 	ldw	x, sp
      00A297 5C               [ 1] 1063 	incw	x
      00A298 72 FB 20         [ 2] 1064 	addw	x, (0x20, sp)
      00A29B F6               [ 1] 1065 	ld	a, (x)
      00A29C 5F               [ 1] 1066 	clrw	x
      00A29D 97               [ 1] 1067 	ld	xl, a
      00A29E 89               [ 2] 1068 	pushw	x
      00A29F 4B A0            [ 1] 1069 	push	#<(___str_5+0)
      00A2A1 4B 88            [ 1] 1070 	push	#((___str_5+0) >> 8)
      00A2A3 CD 9C 98         [ 4] 1071 	call	_mib_printf
      00A2A6 5B 04            [ 2] 1072 	addw	sp, #4
                                   1073 ;	./../../mib/stm8s_mib_debug_cmd.c: 383: for (i = 0; i < (remainder >> 1); i++)
      00A2A8 1E 26            [ 2] 1074 	ldw	x, (0x26, sp)
      00A2AA 5C               [ 1] 1075 	incw	x
      00A2AB 1F 26            [ 2] 1076 	ldw	(0x26, sp), x
      00A2AD 20 9E            [ 2] 1077 	jra	00125$
      00A2AF                       1078 00110$:
                                   1079 ;	./../../mib/stm8s_mib_debug_cmd.c: 389: for (i = 0; i < (16 - (remainder >> 1) * 2); i++)
      00A2AF 1E 1D            [ 2] 1080 	ldw	x, (0x1d, sp)
      00A2B1 58               [ 2] 1081 	sllw	x
      00A2B2 1F 26            [ 2] 1082 	ldw	(0x26, sp), x
      00A2B4 A6 10            [ 1] 1083 	ld	a, #0x10
      00A2B6 10 27            [ 1] 1084 	sub	a, (0x27, sp)
      00A2B8 6B 25            [ 1] 1085 	ld	(0x25, sp), a
      00A2BA 4F               [ 1] 1086 	clr	a
      00A2BB 12 26            [ 1] 1087 	sbc	a, (0x26, sp)
      00A2BD 6B 24            [ 1] 1088 	ld	(0x24, sp), a
      00A2BF 5F               [ 1] 1089 	clrw	x
      00A2C0 1F 26            [ 2] 1090 	ldw	(0x26, sp), x
      00A2C2                       1091 00128$:
      00A2C2 1E 26            [ 2] 1092 	ldw	x, (0x26, sp)
      00A2C4 13 24            [ 2] 1093 	cpw	x, (0x24, sp)
      00A2C6 2E 10            [ 1] 1094 	jrsge	00111$
                                   1095 ;	./../../mib/stm8s_mib_debug_cmd.c: 391: mib_printf("   ");
      00A2C8 4B B7            [ 1] 1096 	push	#<(___str_10+0)
      00A2CA 4B 88            [ 1] 1097 	push	#((___str_10+0) >> 8)
      00A2CC CD 9C 98         [ 4] 1098 	call	_mib_printf
      00A2CF 5B 02            [ 2] 1099 	addw	sp, #2
                                   1100 ;	./../../mib/stm8s_mib_debug_cmd.c: 389: for (i = 0; i < (16 - (remainder >> 1) * 2); i++)
      00A2D1 1E 26            [ 2] 1101 	ldw	x, (0x26, sp)
      00A2D3 5C               [ 1] 1102 	incw	x
      00A2D4 1F 26            [ 2] 1103 	ldw	(0x26, sp), x
      00A2D6 20 EA            [ 2] 1104 	jra	00128$
      00A2D8                       1105 00111$:
                                   1106 ;	./../../mib/stm8s_mib_debug_cmd.c: 393: mib_printf(" ");
      00A2D8 4B A6            [ 1] 1107 	push	#<(___str_6+0)
      00A2DA 4B 88            [ 1] 1108 	push	#((___str_6+0) >> 8)
      00A2DC CD 9C 98         [ 4] 1109 	call	_mib_printf
      00A2DF 5B 02            [ 2] 1110 	addw	sp, #2
                                   1111 ;	./../../mib/stm8s_mib_debug_cmd.c: 394: for (i = 0; i < remainder; i++)
      00A2E1 5F               [ 1] 1112 	clrw	x
      00A2E2 1F 26            [ 2] 1113 	ldw	(0x26, sp), x
      00A2E4                       1114 00131$:
      00A2E4 1E 26            [ 2] 1115 	ldw	x, (0x26, sp)
      00A2E6 13 19            [ 2] 1116 	cpw	x, (0x19, sp)
      00A2E8 2E 2C            [ 1] 1117 	jrsge	00116$
                                   1118 ;	./../../mib/stm8s_mib_debug_cmd.c: 396: c = p_data[i];
      00A2EA 96               [ 1] 1119 	ldw	x, sp
      00A2EB 5C               [ 1] 1120 	incw	x
      00A2EC 72 FB 26         [ 2] 1121 	addw	x, (0x26, sp)
      00A2EF F6               [ 1] 1122 	ld	a, (x)
                                   1123 ;	./../../mib/stm8s_mib_debug_cmd.c: 397: if (c >= 32 && c <= 125)
      00A2F0 A1 20            [ 1] 1124 	cp	a, #0x20
      00A2F2 25 12            [ 1] 1125 	jrc	00113$
      00A2F4 A1 7D            [ 1] 1126 	cp	a, #0x7d
      00A2F6 22 0E            [ 1] 1127 	jrugt	00113$
                                   1128 ;	./../../mib/stm8s_mib_debug_cmd.c: 398: mib_printf("%c", c);
      00A2F8 5F               [ 1] 1129 	clrw	x
      00A2F9 97               [ 1] 1130 	ld	xl, a
      00A2FA 89               [ 2] 1131 	pushw	x
      00A2FB 4B A8            [ 1] 1132 	push	#<(___str_7+0)
      00A2FD 4B 88            [ 1] 1133 	push	#((___str_7+0) >> 8)
      00A2FF CD 9C 98         [ 4] 1134 	call	_mib_printf
      00A302 5B 04            [ 2] 1135 	addw	sp, #4
      00A304 20 09            [ 2] 1136 	jra	00132$
      00A306                       1137 00113$:
                                   1138 ;	./../../mib/stm8s_mib_debug_cmd.c: 400: mib_printf(".");
      00A306 4B AB            [ 1] 1139 	push	#<(___str_8+0)
      00A308 4B 88            [ 1] 1140 	push	#((___str_8+0) >> 8)
      00A30A CD 9C 98         [ 4] 1141 	call	_mib_printf
      00A30D 5B 02            [ 2] 1142 	addw	sp, #2
      00A30F                       1143 00132$:
                                   1144 ;	./../../mib/stm8s_mib_debug_cmd.c: 394: for (i = 0; i < remainder; i++)
      00A30F 1E 26            [ 2] 1145 	ldw	x, (0x26, sp)
      00A311 5C               [ 1] 1146 	incw	x
      00A312 1F 26            [ 2] 1147 	ldw	(0x26, sp), x
      00A314 20 CE            [ 2] 1148 	jra	00131$
      00A316                       1149 00116$:
                                   1150 ;	./../../mib/stm8s_mib_debug_cmd.c: 402: for (i = 0; i < (16 - remainder); i++)
      00A316 A6 10            [ 1] 1151 	ld	a, #0x10
      00A318 10 1A            [ 1] 1152 	sub	a, (0x1a, sp)
      00A31A 6B 25            [ 1] 1153 	ld	(0x25, sp), a
      00A31C 4F               [ 1] 1154 	clr	a
      00A31D 12 19            [ 1] 1155 	sbc	a, (0x19, sp)
      00A31F 6B 24            [ 1] 1156 	ld	(0x24, sp), a
      00A321 5F               [ 1] 1157 	clrw	x
      00A322 1F 26            [ 2] 1158 	ldw	(0x26, sp), x
      00A324                       1159 00134$:
      00A324 1E 26            [ 2] 1160 	ldw	x, (0x26, sp)
      00A326 13 24            [ 2] 1161 	cpw	x, (0x24, sp)
      00A328 2E 10            [ 1] 1162 	jrsge	00117$
                                   1163 ;	./../../mib/stm8s_mib_debug_cmd.c: 404: mib_printf(" ");
      00A32A 4B A6            [ 1] 1164 	push	#<(___str_6+0)
      00A32C 4B 88            [ 1] 1165 	push	#((___str_6+0) >> 8)
      00A32E CD 9C 98         [ 4] 1166 	call	_mib_printf
      00A331 5B 02            [ 2] 1167 	addw	sp, #2
                                   1168 ;	./../../mib/stm8s_mib_debug_cmd.c: 402: for (i = 0; i < (16 - remainder); i++)
      00A333 1E 26            [ 2] 1169 	ldw	x, (0x26, sp)
      00A335 5C               [ 1] 1170 	incw	x
      00A336 1F 26            [ 2] 1171 	ldw	(0x26, sp), x
      00A338 20 EA            [ 2] 1172 	jra	00134$
      00A33A                       1173 00117$:
                                   1174 ;	./../../mib/stm8s_mib_debug_cmd.c: 407: mib_printf("\r\n");
      00A33A 4B 40            [ 1] 1175 	push	#<(___str_0+0)
      00A33C 4B 88            [ 1] 1176 	push	#((___str_0+0) >> 8)
      00A33E CD 9C 98         [ 4] 1177 	call	_mib_printf
      00A341 5B 02            [ 2] 1178 	addw	sp, #2
      00A343                       1179 00119$:
                                   1180 ;	./../../mib/stm8s_mib_debug_cmd.c: 409: return;
                                   1181 ;	./../../mib/stm8s_mib_debug_cmd.c: 410: } // HexDump.
      00A343 1E 28            [ 2] 1182 	ldw	x, (40, sp)
      00A345 5B 31            [ 2] 1183 	addw	sp, #49
      00A347 FC               [ 2] 1184 	jp	(x)
                                   1185 ;	./../../mib/stm8s_mib_debug_cmd.c: 419: int DoPrintHelp(int argc, char **argv)
                                   1186 ;	-----------------------------------------
                                   1187 ;	 function DoPrintHelp
                                   1188 ;	-----------------------------------------
      00A348                       1189 _DoPrintHelp:
      00A348 52 02            [ 2] 1190 	sub	sp, #2
                                   1191 ;	./../../mib/stm8s_mib_debug_cmd.c: 423: if (argc == 1)
      00A34A 5A               [ 2] 1192 	decw	x
      00A34B 26 39            [ 1] 1193 	jrne	00105$
                                   1194 ;	./../../mib/stm8s_mib_debug_cmd.c: 425: mib_printf("*******\r\n");
      00A34D 4B BB            [ 1] 1195 	push	#<(___str_11+0)
      00A34F 4B 88            [ 1] 1196 	push	#((___str_11+0) >> 8)
      00A351 CD 9C 98         [ 4] 1197 	call	_mib_printf
      00A354 5B 02            [ 2] 1198 	addw	sp, #2
                                   1199 ;	./../../mib/stm8s_mib_debug_cmd.c: 426: mib_printf("  help  Help for commands.\r\n");
      00A356 4B C5            [ 1] 1200 	push	#<(___str_12+0)
      00A358 4B 88            [ 1] 1201 	push	#((___str_12+0) >> 8)
      00A35A CD 9C 98         [ 4] 1202 	call	_mib_printf
      00A35D 5B 02            [ 2] 1203 	addw	sp, #2
                                   1204 ;	./../../mib/stm8s_mib_debug_cmd.c: 428: for (cptr = cmdTbl; cptr->cmd; cptr++)
      00A35F AE 01 5C         [ 2] 1205 	ldw	x, #(_cmdTbl+0)
      00A362 1F 01            [ 2] 1206 	ldw	(0x01, sp), x
      00A364                       1207 00108$:
      00A364 1E 01            [ 2] 1208 	ldw	x, (0x01, sp)
      00A366 FE               [ 2] 1209 	ldw	x, (x)
      00A367 27 12            [ 1] 1210 	jreq	00103$
                                   1211 ;	./../../mib/stm8s_mib_debug_cmd.c: 430: if (cptr->usage)
      00A369 1E 01            [ 2] 1212 	ldw	x, (0x01, sp)
      00A36B EE 04            [ 2] 1213 	ldw	x, (0x4, x)
      00A36D 27 03            [ 1] 1214 	jreq	00109$
                                   1215 ;	./../../mib/stm8s_mib_debug_cmd.c: 431: MibWriteDebugString(cptr->usage);
      00A36F CD 92 86         [ 4] 1216 	call	_MibWriteDebugString
      00A372                       1217 00109$:
                                   1218 ;	./../../mib/stm8s_mib_debug_cmd.c: 428: for (cptr = cmdTbl; cptr->cmd; cptr++)
      00A372 1E 01            [ 2] 1219 	ldw	x, (0x01, sp)
      00A374 1C 00 06         [ 2] 1220 	addw	x, #0x0006
      00A377 1F 01            [ 2] 1221 	ldw	(0x01, sp), x
      00A379 20 E9            [ 2] 1222 	jra	00108$
      00A37B                       1223 00103$:
                                   1224 ;	./../../mib/stm8s_mib_debug_cmd.c: 433: mib_printf("*******\r\n");
      00A37B 4B BB            [ 1] 1225 	push	#<(___str_11+0)
      00A37D 4B 88            [ 1] 1226 	push	#((___str_11+0) >> 8)
      00A37F CD 9C 98         [ 4] 1227 	call	_mib_printf
      00A382 5B 02            [ 2] 1228 	addw	sp, #2
      00A384 20 1F            [ 2] 1229 	jra	00106$
      00A386                       1230 00105$:
                                   1231 ;	./../../mib/stm8s_mib_debug_cmd.c: 437: mib_printf("\tUnknown command : ");
      00A386 4B E2            [ 1] 1232 	push	#<(___str_13+0)
      00A388 4B 88            [ 1] 1233 	push	#((___str_13+0) >> 8)
      00A38A CD 9C 98         [ 4] 1234 	call	_mib_printf
      00A38D 5B 02            [ 2] 1235 	addw	sp, #2
                                   1236 ;	./../../mib/stm8s_mib_debug_cmd.c: 438: mib_printf("%s", argv[0]);
      00A38F 1E 05            [ 2] 1237 	ldw	x, (0x05, sp)
      00A391 FE               [ 2] 1238 	ldw	x, (x)
      00A392 89               [ 2] 1239 	pushw	x
      00A393 4B F6            [ 1] 1240 	push	#<(___str_14+0)
      00A395 4B 88            [ 1] 1241 	push	#((___str_14+0) >> 8)
      00A397 CD 9C 98         [ 4] 1242 	call	_mib_printf
      00A39A 5B 04            [ 2] 1243 	addw	sp, #4
                                   1244 ;	./../../mib/stm8s_mib_debug_cmd.c: 439: mib_printf("\r\n");
      00A39C 4B 40            [ 1] 1245 	push	#<(___str_0+0)
      00A39E 4B 88            [ 1] 1246 	push	#((___str_0+0) >> 8)
      00A3A0 CD 9C 98         [ 4] 1247 	call	_mib_printf
      00A3A3 5B 02            [ 2] 1248 	addw	sp, #2
      00A3A5                       1249 00106$:
                                   1250 ;	./../../mib/stm8s_mib_debug_cmd.c: 441: return TRUE;
      00A3A5 5F               [ 1] 1251 	clrw	x
      00A3A6 5C               [ 1] 1252 	incw	x
                                   1253 ;	./../../mib/stm8s_mib_debug_cmd.c: 442: }
      00A3A7 5B 02            [ 2] 1254 	addw	sp, #2
      00A3A9 90 85            [ 2] 1255 	popw	y
      00A3AB 5B 02            [ 2] 1256 	addw	sp, #2
      00A3AD 90 FC            [ 2] 1257 	jp	(y)
                                   1258 ;	./../../mib/stm8s_mib_debug_cmd.c: 452: int getdec(uint8_t **ptr)
                                   1259 ;	-----------------------------------------
                                   1260 ;	 function getdec
                                   1261 ;	-----------------------------------------
      00A3AF                       1262 _getdec:
      00A3AF 52 06            [ 2] 1263 	sub	sp, #6
                                   1264 ;	./../../mib/stm8s_mib_debug_cmd.c: 454: uint8_t *p = *ptr;
      00A3B1 1F 05            [ 2] 1265 	ldw	(0x05, sp), x
      00A3B3 FE               [ 2] 1266 	ldw	x, (x)
      00A3B4 1F 01            [ 2] 1267 	ldw	(0x01, sp), x
                                   1268 ;	./../../mib/stm8s_mib_debug_cmd.c: 455: int ret = 0;
      00A3B6 5F               [ 1] 1269 	clrw	x
      00A3B7 1F 03            [ 2] 1270 	ldw	(0x03, sp), x
                                   1271 ;	./../../mib/stm8s_mib_debug_cmd.c: 456: if ((*p < '0') || (*p > '9'))
      00A3B9 1E 01            [ 2] 1272 	ldw	x, (0x01, sp)
      00A3BB F6               [ 1] 1273 	ld	a, (x)
      00A3BC A1 30            [ 1] 1274 	cp	a, #0x30
      00A3BE 25 04            [ 1] 1275 	jrc	00101$
      00A3C0 A1 39            [ 1] 1276 	cp	a, #0x39
      00A3C2 23 04            [ 2] 1277 	jrule	00113$
      00A3C4                       1278 00101$:
                                   1279 ;	./../../mib/stm8s_mib_debug_cmd.c: 457: return (-1);
      00A3C4 5F               [ 1] 1280 	clrw	x
      00A3C5 5A               [ 2] 1281 	decw	x
      00A3C6 20 29            [ 2] 1282 	jra	00108$
                                   1283 ;	./../../mib/stm8s_mib_debug_cmd.c: 458: while ((*p >= '0') && (*p <= '9'))
      00A3C8                       1284 00113$:
      00A3C8 16 01            [ 2] 1285 	ldw	y, (0x01, sp)
      00A3CA                       1286 00105$:
      00A3CA 90 F6            [ 1] 1287 	ld	a, (y)
      00A3CC A1 30            [ 1] 1288 	cp	a, #0x30
      00A3CE 25 1C            [ 1] 1289 	jrc	00107$
      00A3D0 A1 39            [ 1] 1290 	cp	a, #0x39
      00A3D2 22 18            [ 1] 1291 	jrugt	00107$
                                   1292 ;	./../../mib/stm8s_mib_debug_cmd.c: 460: ret = ret * 10 + (int)(*p - '0');
      00A3D4 1E 03            [ 2] 1293 	ldw	x, (0x03, sp)
      00A3D6 58               [ 2] 1294 	sllw	x
      00A3D7 58               [ 2] 1295 	sllw	x
      00A3D8 72 FB 03         [ 2] 1296 	addw	x, (0x03, sp)
      00A3DB 58               [ 2] 1297 	sllw	x
      00A3DC 1F 03            [ 2] 1298 	ldw	(0x03, sp), x
      00A3DE 5F               [ 1] 1299 	clrw	x
      00A3DF 97               [ 1] 1300 	ld	xl, a
      00A3E0 1D 00 30         [ 2] 1301 	subw	x, #0x0030
      00A3E3 72 FB 03         [ 2] 1302 	addw	x, (0x03, sp)
      00A3E6 1F 03            [ 2] 1303 	ldw	(0x03, sp), x
                                   1304 ;	./../../mib/stm8s_mib_debug_cmd.c: 461: p++;
      00A3E8 90 5C            [ 1] 1305 	incw	y
      00A3EA 20 DE            [ 2] 1306 	jra	00105$
      00A3EC                       1307 00107$:
                                   1308 ;	./../../mib/stm8s_mib_debug_cmd.c: 463: *ptr = p;
      00A3EC 1E 05            [ 2] 1309 	ldw	x, (0x05, sp)
      00A3EE FF               [ 2] 1310 	ldw	(x), y
                                   1311 ;	./../../mib/stm8s_mib_debug_cmd.c: 464: return (ret);
      00A3EF 1E 03            [ 2] 1312 	ldw	x, (0x03, sp)
      00A3F1                       1313 00108$:
                                   1314 ;	./../../mib/stm8s_mib_debug_cmd.c: 465: }
      00A3F1 5B 06            [ 2] 1315 	addw	sp, #6
      00A3F3 81               [ 4] 1316 	ret
                                   1317 	.area CODE
                                   1318 	.area CONST
                                   1319 	.area CONST
      008840                       1320 ___str_0:
      008840 0D                    1321 	.db 0x0d
      008841 0A                    1322 	.db 0x0a
      008842 00                    1323 	.db 0x00
                                   1324 	.area CODE
                                   1325 	.area CONST
      008843                       1326 ___str_1:
      008843 08                    1327 	.db 0x08
      008844 20                    1328 	.ascii " "
      008845 08                    1329 	.db 0x08
      008846 00                    1330 	.db 0x00
                                   1331 	.area CODE
                                   1332 	.area CONST
      008847                       1333 ___str_2:
      008847 30 78                 1334 	.ascii "0x"
      008849 00                    1335 	.db 0x00
                                   1336 	.area CODE
                                   1337 	.area CONST
      00884A                       1338 ___str_3:
      00884A 61 64 64 72 65 73 73  1339 	.ascii "address     Hex Value                                       "
             20 20 20 20 20 48 65
             78 20 56 61 6C 75 65
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      008886 20 41 73 63 69 69 20  1340 	.ascii " Ascii value"
             76 61 6C 75 65
      008892 0D                    1341 	.db 0x0d
      008893 0A                    1342 	.db 0x0a
      008894 00                    1343 	.db 0x00
                                   1344 	.area CODE
                                   1345 	.area CONST
      008895                       1346 ___str_4:
      008895 30 78 25 30 38 6C 78  1347 	.ascii "0x%08lx : "
             20 3A 20
      00889F 00                    1348 	.db 0x00
                                   1349 	.area CODE
                                   1350 	.area CONST
      0088A0                       1351 ___str_5:
      0088A0 25 30 32 78 20        1352 	.ascii "%02x "
      0088A5 00                    1353 	.db 0x00
                                   1354 	.area CODE
                                   1355 	.area CONST
      0088A6                       1356 ___str_6:
      0088A6 20                    1357 	.ascii " "
      0088A7 00                    1358 	.db 0x00
                                   1359 	.area CODE
                                   1360 	.area CONST
      0088A8                       1361 ___str_7:
      0088A8 25 63                 1362 	.ascii "%c"
      0088AA 00                    1363 	.db 0x00
                                   1364 	.area CODE
                                   1365 	.area CONST
      0088AB                       1366 ___str_8:
      0088AB 2E                    1367 	.ascii "."
      0088AC 00                    1368 	.db 0x00
                                   1369 	.area CODE
                                   1370 	.area CONST
      0088AD                       1371 ___str_9:
      0088AD 30 78 25 30 38 6C 78  1372 	.ascii "0x%08lx  "
             20 20
      0088B6 00                    1373 	.db 0x00
                                   1374 	.area CODE
                                   1375 	.area CONST
      0088B7                       1376 ___str_10:
      0088B7 20 20 20              1377 	.ascii "   "
      0088BA 00                    1378 	.db 0x00
                                   1379 	.area CODE
                                   1380 	.area CONST
      0088BB                       1381 ___str_11:
      0088BB 2A 2A 2A 2A 2A 2A 2A  1382 	.ascii "*******"
      0088C2 0D                    1383 	.db 0x0d
      0088C3 0A                    1384 	.db 0x0a
      0088C4 00                    1385 	.db 0x00
                                   1386 	.area CODE
                                   1387 	.area CONST
      0088C5                       1388 ___str_12:
      0088C5 20 20 68 65 6C 70 20  1389 	.ascii "  help  Help for commands."
             20 48 65 6C 70 20 66
             6F 72 20 63 6F 6D 6D
             61 6E 64 73 2E
      0088DF 0D                    1390 	.db 0x0d
      0088E0 0A                    1391 	.db 0x0a
      0088E1 00                    1392 	.db 0x00
                                   1393 	.area CODE
                                   1394 	.area CONST
      0088E2                       1395 ___str_13:
      0088E2 09                    1396 	.db 0x09
      0088E3 55 6E 6B 6E 6F 77 6E  1397 	.ascii "Unknown command : "
             20 63 6F 6D 6D 61 6E
             64 20 3A 20
      0088F5 00                    1398 	.db 0x00
                                   1399 	.area CODE
                                   1400 	.area CONST
      0088F6                       1401 ___str_14:
      0088F6 25 73                 1402 	.ascii "%s"
      0088F8 00                    1403 	.db 0x00
                                   1404 	.area CODE
                                   1405 	.area INITIALIZER
      008E06                       1406 __xinit__cmdTbl:
      008E06 00 00                 1407 	.dw #0x0000
      008E08 00 00                 1408 	.dw #0x0000
      008E0A 00 00                 1409 	.dw #0x0000
      008E0C 00 00                 1410 	.dw #0x0000
      008E0E 00 00                 1411 	.dw #0x0000
      008E10 00 00                 1412 	.dw #0x0000
      008E12 00 00                 1413 	.dw #0x0000
      008E14 00 00                 1414 	.dw #0x0000
      008E16 00 00                 1415 	.dw #0x0000
      008E18 00 00                 1416 	.dw #0x0000
      008E1A 00 00                 1417 	.dw #0x0000
      008E1C 00 00                 1418 	.dw #0x0000
      008E1E 00 00                 1419 	.dw #0x0000
      008E20 00 00                 1420 	.dw #0x0000
      008E22 00 00                 1421 	.dw #0x0000
      008E24 00 00                 1422 	.dw #0x0000
      008E26 00 00                 1423 	.dw #0x0000
      008E28 00 00                 1424 	.dw #0x0000
                                   1425 	.area CABS (ABS)
