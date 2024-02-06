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
      00004A                         33 _cmd_list::
      00004A                         34 	.ds 258
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
      0096FF                         74 _GetCommand:
      0096FF 52 10            [ 2]   75 	sub	sp, #16
      009701 1F 0D            [ 2]   76 	ldw	(0x0d, sp), x
                                     77 ;	./../../mib/stm8s_mib_debug_cmd.c: 88: uint16_t vwIndex, rdCnt, rdMax = len - 1;
      009703 1E 13            [ 2]   78 	ldw	x, (0x13, sp)
      009705 5A               [ 2]   79 	decw	x
      009706 1F 01            [ 2]   80 	ldw	(0x01, sp), x
                                     81 ;	./../../mib/stm8s_mib_debug_cmd.c: 91: endTime = MibGetSecs() + (uint16_t)timeout;
      009708 CD 96 F0         [ 4]   82 	call	_MibGetSecs
      00970B 7B 15            [ 1]   83 	ld	a, (0x15, sp)
      00970D 6B 10            [ 1]   84 	ld	(0x10, sp), a
      00970F 0F 0F            [ 1]   85 	clr	(0x0f, sp)
      009711 72 FB 0F         [ 2]   86 	addw	x, (0x0f, sp)
      009714 1F 03            [ 2]   87 	ldw	(0x03, sp), x
                                     88 ;	./../../mib/stm8s_mib_debug_cmd.c: 92: cmd_list.cur = cmd_list.next;
      009716 C6 00 4B         [ 1]   89 	ld	a, _cmd_list+1
      009719 C7 00 4A         [ 1]   90 	ld	_cmd_list+0, a
                                     91 ;	./../../mib/stm8s_mib_debug_cmd.c: 93: for (rdCnt = 0, vwIndex = 0; rdCnt <= rdMax;)
      00971C 5F               [ 1]   92 	clrw	x
      00971D 1F 0F            [ 2]   93 	ldw	(0x0f, sp), x
      00971F                         94 00149$:
      00971F 1E 0F            [ 2]   95 	ldw	x, (0x0f, sp)
      009721 13 01            [ 2]   96 	cpw	x, (0x01, sp)
      009723 23 03            [ 2]   97 	jrule	00243$
      009725 CC 98 F2         [ 2]   98 	jp	00147$
      009728                         99 00243$:
                                    100 ;	./../../mib/stm8s_mib_debug_cmd.c: 96: while (1)
      009728                        101 00106$:
                                    102 ;	./../../mib/stm8s_mib_debug_cmd.c: 98: vwCh = MibReadDebugByte();
      009728 CD 8C 86         [ 4]  103 	call	_MibReadDebugByte
                                    104 ;	./../../mib/stm8s_mib_debug_cmd.c: 99: if (vwCh != 0xffff)	break;
      00972B 1F 05            [ 2]  105 	ldw	(0x05, sp), x
      00972D 1F 07            [ 2]  106 	ldw	(0x07, sp), x
                                    107 ;	./../../mib/stm8s_mib_debug_cmd.c: 102: cmd[rdCnt++] = '\0';
      00972F 1E 0F            [ 2]  108 	ldw	x, (0x0f, sp)
      009731 5C               [ 1]  109 	incw	x
      009732 1F 09            [ 2]  110 	ldw	(0x09, sp), x
                                    111 ;	./../../mib/stm8s_mib_debug_cmd.c: 104: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      009734 16 0D            [ 2]  112 	ldw	y, (0x0d, sp)
      009736 17 0B            [ 2]  113 	ldw	(0x0b, sp), y
                                    114 ;	./../../mib/stm8s_mib_debug_cmd.c: 99: if (vwCh != 0xffff)	break;
      009738 1E 07            [ 2]  115 	ldw	x, (0x07, sp)
      00973A 5C               [ 1]  116 	incw	x
      00973B 26 55            [ 1]  117 	jrne	00107$
                                    118 ;	./../../mib/stm8s_mib_debug_cmd.c: 100: if (MibGetSecs() > endTime)
      00973D CD 96 F0         [ 4]  119 	call	_MibGetSecs
      009740 13 03            [ 2]  120 	cpw	x, (0x03, sp)
      009742 23 E4            [ 2]  121 	jrule	00106$
                                    122 ;	./../../mib/stm8s_mib_debug_cmd.c: 102: cmd[rdCnt++] = '\0';
      009744 1E 0F            [ 2]  123 	ldw	x, (0x0f, sp)
      009746 16 09            [ 2]  124 	ldw	y, (0x09, sp)
      009748 17 0F            [ 2]  125 	ldw	(0x0f, sp), y
      00974A 72 FB 0D         [ 2]  126 	addw	x, (0x0d, sp)
      00974D 7F               [ 1]  127 	clr	(x)
                                    128 ;	./../../mib/stm8s_mib_debug_cmd.c: 103: memset(cmd_list.buf[cmd_list.next], 0, CMD_CHAR_MAX);
      00974E C6 00 4B         [ 1]  129 	ld	a, _cmd_list+1
      009751 97               [ 1]  130 	ld	xl, a
      009752 A6 40            [ 1]  131 	ld	a, #0x40
      009754 42               [ 4]  132 	mul	x, a
      009755 1C 00 4C         [ 2]  133 	addw	x, #(_cmd_list+2)
      009758 4B 40            [ 1]  134 	push	#0x40
      00975A 4B 00            [ 1]  135 	push	#0x00
      00975C 4B 00            [ 1]  136 	push	#0x00
      00975E 4B 00            [ 1]  137 	push	#0x00
      009760 CD A8 E2         [ 4]  138 	call	_memset
                                    139 ;	./../../mib/stm8s_mib_debug_cmd.c: 104: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      009763 1E 0D            [ 2]  140 	ldw	x, (0x0d, sp)
      009765 CD A9 06         [ 4]  141 	call	_strlen
      009768 51               [ 1]  142 	exgw	x, y
      009769 C6 00 4B         [ 1]  143 	ld	a, _cmd_list+1
      00976C 97               [ 1]  144 	ld	xl, a
      00976D A6 40            [ 1]  145 	ld	a, #0x40
      00976F 42               [ 4]  146 	mul	x, a
      009770 1C 00 4C         [ 2]  147 	addw	x, #(_cmd_list+2)
      009773 90 89            [ 2]  148 	pushw	y
      009775 16 0D            [ 2]  149 	ldw	y, (0x0d, sp)
      009777 90 89            [ 2]  150 	pushw	y
      009779 CD A8 8F         [ 4]  151 	call	___memcpy
                                    152 ;	./../../mib/stm8s_mib_debug_cmd.c: 105: cmd_list.next = (cmd_list.next + 1) % CMD_LINE_MAX;
      00977C C6 00 4B         [ 1]  153 	ld	a, _cmd_list+1
      00977F 5F               [ 1]  154 	clrw	x
      009780 97               [ 1]  155 	ld	xl, a
      009781 5C               [ 1]  156 	incw	x
      009782 4B 04            [ 1]  157 	push	#0x04
      009784 4B 00            [ 1]  158 	push	#0x00
      009786 CD A9 50         [ 4]  159 	call	__modsint
      009789 9F               [ 1]  160 	ld	a, xl
      00978A C7 00 4B         [ 1]  161 	ld	_cmd_list+1, a
                                    162 ;	./../../mib/stm8s_mib_debug_cmd.c: 106: return rdCnt;
      00978D 1E 0F            [ 2]  163 	ldw	x, (0x0f, sp)
      00978F CC 98 F4         [ 2]  164 	jp	00151$
      009792                        165 00107$:
                                    166 ;	./../../mib/stm8s_mib_debug_cmd.c: 112: if ((vwCh == '@') || (vwCh == '\n') || (vwCh == 0x03))
      009792 1E 07            [ 2]  167 	ldw	x, (0x07, sp)
      009794 A3 00 40         [ 2]  168 	cpw	x, #0x0040
      009797 27 0E            [ 1]  169 	jreq	00142$
      009799 1E 07            [ 2]  170 	ldw	x, (0x07, sp)
      00979B A3 00 0A         [ 2]  171 	cpw	x, #0x000a
      00979E 27 07            [ 1]  172 	jreq	00142$
      0097A0 1E 07            [ 2]  173 	ldw	x, (0x07, sp)
      0097A2 A3 00 03         [ 2]  174 	cpw	x, #0x0003
      0097A5 26 57            [ 1]  175 	jrne	00143$
      0097A7                        176 00142$:
                                    177 ;	./../../mib/stm8s_mib_debug_cmd.c: 114: cmd[rdCnt++] = '\0';
      0097A7 1E 0F            [ 2]  178 	ldw	x, (0x0f, sp)
      0097A9 16 09            [ 2]  179 	ldw	y, (0x09, sp)
      0097AB 17 0F            [ 2]  180 	ldw	(0x0f, sp), y
      0097AD 72 FB 0D         [ 2]  181 	addw	x, (0x0d, sp)
      0097B0 7F               [ 1]  182 	clr	(x)
                                    183 ;	./../../mib/stm8s_mib_debug_cmd.c: 115: memset(cmd_list.buf[cmd_list.next], 0, CMD_CHAR_MAX);
      0097B1 C6 00 4B         [ 1]  184 	ld	a, _cmd_list+1
      0097B4 97               [ 1]  185 	ld	xl, a
      0097B5 A6 40            [ 1]  186 	ld	a, #0x40
      0097B7 42               [ 4]  187 	mul	x, a
      0097B8 1C 00 4C         [ 2]  188 	addw	x, #(_cmd_list+2)
      0097BB 4B 40            [ 1]  189 	push	#0x40
      0097BD 4B 00            [ 1]  190 	push	#0x00
      0097BF 4B 00            [ 1]  191 	push	#0x00
      0097C1 4B 00            [ 1]  192 	push	#0x00
      0097C3 CD A8 E2         [ 4]  193 	call	_memset
                                    194 ;	./../../mib/stm8s_mib_debug_cmd.c: 116: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      0097C6 1E 0D            [ 2]  195 	ldw	x, (0x0d, sp)
      0097C8 CD A9 06         [ 4]  196 	call	_strlen
      0097CB 51               [ 1]  197 	exgw	x, y
      0097CC C6 00 4B         [ 1]  198 	ld	a, _cmd_list+1
      0097CF 97               [ 1]  199 	ld	xl, a
      0097D0 A6 40            [ 1]  200 	ld	a, #0x40
      0097D2 42               [ 4]  201 	mul	x, a
      0097D3 1C 00 4C         [ 2]  202 	addw	x, #(_cmd_list+2)
      0097D6 90 89            [ 2]  203 	pushw	y
      0097D8 16 0D            [ 2]  204 	ldw	y, (0x0d, sp)
      0097DA 90 89            [ 2]  205 	pushw	y
      0097DC CD A8 8F         [ 4]  206 	call	___memcpy
                                    207 ;	./../../mib/stm8s_mib_debug_cmd.c: 117: cmd_list.next = (cmd_list.next + 1) % CMD_LINE_MAX;
      0097DF C6 00 4B         [ 1]  208 	ld	a, _cmd_list+1
      0097E2 5F               [ 1]  209 	clrw	x
      0097E3 97               [ 1]  210 	ld	xl, a
      0097E4 5C               [ 1]  211 	incw	x
      0097E5 4B 04            [ 1]  212 	push	#0x04
      0097E7 4B 00            [ 1]  213 	push	#0x00
      0097E9 CD A9 50         [ 4]  214 	call	__modsint
      0097EC 9F               [ 1]  215 	ld	a, xl
      0097ED C7 00 4B         [ 1]  216 	ld	_cmd_list+1, a
                                    217 ;	./../../mib/stm8s_mib_debug_cmd.c: 119: mib_printf("\r\n");
      0097F0 4B 36            [ 1]  218 	push	#<(___str_0+0)
      0097F2 4B 83            [ 1]  219 	push	#((___str_0+0) >> 8)
      0097F4 CD 96 77         [ 4]  220 	call	_mib_printf
      0097F7 5B 02            [ 2]  221 	addw	sp, #2
                                    222 ;	./../../mib/stm8s_mib_debug_cmd.c: 120: return rdCnt;
      0097F9 1E 0F            [ 2]  223 	ldw	x, (0x0f, sp)
      0097FB CC 98 F4         [ 2]  224 	jp	00151$
      0097FE                        225 00143$:
                                    226 ;	./../../mib/stm8s_mib_debug_cmd.c: 122: else if (vwCh == '\b')
      0097FE 1E 07            [ 2]  227 	ldw	x, (0x07, sp)
      009800 A3 00 08         [ 2]  228 	cpw	x, #0x0008
      009803 26 18            [ 1]  229 	jrne	00140$
                                    230 ;	./../../mib/stm8s_mib_debug_cmd.c: 124: if (rdCnt > 0)
      009805 1E 0F            [ 2]  231 	ldw	x, (0x0f, sp)
      009807 26 03            [ 1]  232 	jrne	00260$
      009809 CC 97 1F         [ 2]  233 	jp	00149$
      00980C                        234 00260$:
                                    235 ;	./../../mib/stm8s_mib_debug_cmd.c: 126: rdCnt--;
      00980C 1E 0F            [ 2]  236 	ldw	x, (0x0f, sp)
      00980E 5A               [ 2]  237 	decw	x
      00980F 1F 0F            [ 2]  238 	ldw	(0x0f, sp), x
                                    239 ;	./../../mib/stm8s_mib_debug_cmd.c: 128: mib_printf("\b \b");
      009811 4B 39            [ 1]  240 	push	#<(___str_1+0)
      009813 4B 83            [ 1]  241 	push	#((___str_1+0) >> 8)
      009815 CD 96 77         [ 4]  242 	call	_mib_printf
      009818 5B 02            [ 2]  243 	addw	sp, #2
      00981A CC 97 1F         [ 2]  244 	jp	00149$
      00981D                        245 00140$:
                                    246 ;	./../../mib/stm8s_mib_debug_cmd.c: 131: else if (vwCh == 0x1b)
      00981D 1E 07            [ 2]  247 	ldw	x, (0x07, sp)
      00981F A3 00 1B         [ 2]  248 	cpw	x, #0x001b
      009822 27 03            [ 1]  249 	jreq	00263$
      009824 CC 98 E0         [ 2]  250 	jp	00137$
      009827                        251 00263$:
                                    252 ;	./../../mib/stm8s_mib_debug_cmd.c: 134: while (1)
      009827                        253 00113$:
                                    254 ;	./../../mib/stm8s_mib_debug_cmd.c: 136: vwCh = MibReadDebugByte();
      009827 CD 8C 86         [ 4]  255 	call	_MibReadDebugByte
                                    256 ;	./../../mib/stm8s_mib_debug_cmd.c: 137: if (vwCh != 0xffff)
      00982A A3 FF FF         [ 2]  257 	cpw	x, #0xffff
      00982D 27 F8            [ 1]  258 	jreq	00113$
                                    259 ;	./../../mib/stm8s_mib_debug_cmd.c: 140: if (vwCh == '[')
      00982F A3 00 5B         [ 2]  260 	cpw	x, #0x005b
      009832 27 03            [ 1]  261 	jreq	00269$
      009834 CC 97 1F         [ 2]  262 	jp	00149$
      009837                        263 00269$:
                                    264 ;	./../../mib/stm8s_mib_debug_cmd.c: 143: while (1)
      009837                        265 00118$:
                                    266 ;	./../../mib/stm8s_mib_debug_cmd.c: 145: vwCh = MibReadDebugByte();
      009837 CD 8C 86         [ 4]  267 	call	_MibReadDebugByte
                                    268 ;	./../../mib/stm8s_mib_debug_cmd.c: 146: if (vwCh != 0xffff)
      00983A 1F 09            [ 2]  269 	ldw	(0x09, sp), x
      00983C 5C               [ 1]  270 	incw	x
      00983D 27 F8            [ 1]  271 	jreq	00118$
                                    272 ;	./../../mib/stm8s_mib_debug_cmd.c: 150: if (vwCh == 'B')
      00983F 1E 09            [ 2]  273 	ldw	x, (0x09, sp)
      009841 A3 00 42         [ 2]  274 	cpw	x, #0x0042
      009844 26 48            [ 1]  275 	jrne	00132$
                                    276 ;	./../../mib/stm8s_mib_debug_cmd.c: 152: cmd_list.cur++;
      009846 C6 00 4A         [ 1]  277 	ld	a, _cmd_list+0
      009849 4C               [ 1]  278 	inc	a
      00984A C7 00 4A         [ 1]  279 	ld	_cmd_list+0, a
                                    280 ;	./../../mib/stm8s_mib_debug_cmd.c: 153: if (cmd_list.cur == CMD_LINE_MAX)
      00984D A1 04            [ 1]  281 	cp	a, #0x04
      00984F 26 04            [ 1]  282 	jrne	00121$
                                    283 ;	./../../mib/stm8s_mib_debug_cmd.c: 154: cmd_list.cur = 0;
      009851 35 00 00 4A      [ 1]  284 	mov	_cmd_list+0, #0x00
      009855                        285 00121$:
                                    286 ;	./../../mib/stm8s_mib_debug_cmd.c: 155: rdCnt = strlen(cmd_list.buf[cmd_list.cur]);
      009855 C6 00 4A         [ 1]  287 	ld	a, _cmd_list+0
      009858 97               [ 1]  288 	ld	xl, a
      009859 A6 40            [ 1]  289 	ld	a, #0x40
      00985B 42               [ 4]  290 	mul	x, a
      00985C 1C 00 4C         [ 2]  291 	addw	x, #(_cmd_list+2)
      00985F CD A9 06         [ 4]  292 	call	_strlen
                                    293 ;	./../../mib/stm8s_mib_debug_cmd.c: 156: if (rdCnt >= rdMax)
      009862 1F 0F            [ 2]  294 	ldw	(0x0f, sp), x
      009864 13 01            [ 2]  295 	cpw	x, (0x01, sp)
      009866 25 04            [ 1]  296 	jrc	00123$
                                    297 ;	./../../mib/stm8s_mib_debug_cmd.c: 157: rdCnt = rdMax;
      009868 16 01            [ 2]  298 	ldw	y, (0x01, sp)
      00986A 17 0F            [ 2]  299 	ldw	(0x0f, sp), y
      00986C                        300 00123$:
                                    301 ;	./../../mib/stm8s_mib_debug_cmd.c: 158: memcpy(cmd, cmd_list.buf[cmd_list.cur], rdCnt);
      00986C 16 0F            [ 2]  302 	ldw	y, (0x0f, sp)
      00986E C6 00 4A         [ 1]  303 	ld	a, _cmd_list+0
      009871 97               [ 1]  304 	ld	xl, a
      009872 A6 40            [ 1]  305 	ld	a, #0x40
      009874 42               [ 4]  306 	mul	x, a
      009875 1C 00 4C         [ 2]  307 	addw	x, #(_cmd_list+2)
      009878 90 89            [ 2]  308 	pushw	y
      00987A 89               [ 2]  309 	pushw	x
      00987B 1E 0F            [ 2]  310 	ldw	x, (0x0f, sp)
      00987D CD A8 8F         [ 4]  311 	call	___memcpy
                                    312 ;	./../../mib/stm8s_mib_debug_cmd.c: 159: cmd[rdCnt] = 0;
      009880 1E 0D            [ 2]  313 	ldw	x, (0x0d, sp)
      009882 72 FB 0F         [ 2]  314 	addw	x, (0x0f, sp)
      009885 7F               [ 1]  315 	clr	(x)
                                    316 ;	./../../mib/stm8s_mib_debug_cmd.c: 161: MibWriteDebugString(cmd);
      009886 1E 0D            [ 2]  317 	ldw	x, (0x0d, sp)
      009888 CD 8C 65         [ 4]  318 	call	_MibWriteDebugString
      00988B CC 97 1F         [ 2]  319 	jp	00149$
      00988E                        320 00132$:
                                    321 ;	./../../mib/stm8s_mib_debug_cmd.c: 163: else if (vwCh == 'A')
      00988E 1E 09            [ 2]  322 	ldw	x, (0x09, sp)
      009890 A3 00 41         [ 2]  323 	cpw	x, #0x0041
      009893 27 03            [ 1]  324 	jreq	00282$
      009895 CC 97 1F         [ 2]  325 	jp	00149$
      009898                        326 00282$:
                                    327 ;	./../../mib/stm8s_mib_debug_cmd.c: 152: cmd_list.cur++;
                                    328 ;	./../../mib/stm8s_mib_debug_cmd.c: 165: if (cmd_list.cur == 0)
      009898 C6 00 4A         [ 1]  329 	ld	a, _cmd_list+0
      00989B 26 06            [ 1]  330 	jrne	00125$
                                    331 ;	./../../mib/stm8s_mib_debug_cmd.c: 166: cmd_list.cur = CMD_LINE_MAX - 1;
      00989D 35 03 00 4A      [ 1]  332 	mov	_cmd_list+0, #0x03
      0098A1 20 04            [ 2]  333 	jra	00126$
      0098A3                        334 00125$:
                                    335 ;	./../../mib/stm8s_mib_debug_cmd.c: 168: cmd_list.cur--;
      0098A3 4A               [ 1]  336 	dec	a
      0098A4 C7 00 4A         [ 1]  337 	ld	_cmd_list+0, a
      0098A7                        338 00126$:
                                    339 ;	./../../mib/stm8s_mib_debug_cmd.c: 169: rdCnt = strlen(cmd_list.buf[cmd_list.cur]);
      0098A7 C6 00 4A         [ 1]  340 	ld	a, _cmd_list+0
      0098AA 97               [ 1]  341 	ld	xl, a
      0098AB A6 40            [ 1]  342 	ld	a, #0x40
      0098AD 42               [ 4]  343 	mul	x, a
      0098AE 1C 00 4C         [ 2]  344 	addw	x, #(_cmd_list+2)
      0098B1 CD A9 06         [ 4]  345 	call	_strlen
                                    346 ;	./../../mib/stm8s_mib_debug_cmd.c: 170: if (rdCnt >= rdMax)
      0098B4 1F 0F            [ 2]  347 	ldw	(0x0f, sp), x
      0098B6 13 01            [ 2]  348 	cpw	x, (0x01, sp)
      0098B8 25 04            [ 1]  349 	jrc	00128$
                                    350 ;	./../../mib/stm8s_mib_debug_cmd.c: 171: rdCnt = rdMax;
      0098BA 16 01            [ 2]  351 	ldw	y, (0x01, sp)
      0098BC 17 0F            [ 2]  352 	ldw	(0x0f, sp), y
      0098BE                        353 00128$:
                                    354 ;	./../../mib/stm8s_mib_debug_cmd.c: 172: memcpy(cmd, cmd_list.buf[cmd_list.cur], rdCnt);
      0098BE 16 0F            [ 2]  355 	ldw	y, (0x0f, sp)
      0098C0 C6 00 4A         [ 1]  356 	ld	a, _cmd_list+0
      0098C3 97               [ 1]  357 	ld	xl, a
      0098C4 A6 40            [ 1]  358 	ld	a, #0x40
      0098C6 42               [ 4]  359 	mul	x, a
      0098C7 1C 00 4C         [ 2]  360 	addw	x, #(_cmd_list+2)
      0098CA 90 89            [ 2]  361 	pushw	y
      0098CC 89               [ 2]  362 	pushw	x
      0098CD 1E 0F            [ 2]  363 	ldw	x, (0x0f, sp)
      0098CF CD A8 8F         [ 4]  364 	call	___memcpy
                                    365 ;	./../../mib/stm8s_mib_debug_cmd.c: 173: cmd[rdCnt] = 0;
      0098D2 1E 0D            [ 2]  366 	ldw	x, (0x0d, sp)
      0098D4 72 FB 0F         [ 2]  367 	addw	x, (0x0f, sp)
      0098D7 7F               [ 1]  368 	clr	(x)
                                    369 ;	./../../mib/stm8s_mib_debug_cmd.c: 175: MibWriteDebugString(cmd);
      0098D8 1E 0D            [ 2]  370 	ldw	x, (0x0d, sp)
      0098DA CD 8C 65         [ 4]  371 	call	_MibWriteDebugString
      0098DD CC 97 1F         [ 2]  372 	jp	00149$
      0098E0                        373 00137$:
                                    374 ;	./../../mib/stm8s_mib_debug_cmd.c: 181: cmd[rdCnt++] = vwCh;
      0098E0 1E 0F            [ 2]  375 	ldw	x, (0x0f, sp)
      0098E2 16 09            [ 2]  376 	ldw	y, (0x09, sp)
      0098E4 17 0F            [ 2]  377 	ldw	(0x0f, sp), y
      0098E6 72 FB 0D         [ 2]  378 	addw	x, (0x0d, sp)
      0098E9 7B 06            [ 1]  379 	ld	a, (0x06, sp)
      0098EB F7               [ 1]  380 	ld	(x), a
                                    381 ;	./../../mib/stm8s_mib_debug_cmd.c: 183: MibWriteDebugByte(vwCh);
      0098EC CD 8C 48         [ 4]  382 	call	_MibWriteDebugByte
      0098EF CC 97 1F         [ 2]  383 	jp	00149$
      0098F2                        384 00147$:
                                    385 ;	./../../mib/stm8s_mib_debug_cmd.c: 186: return (rdCnt);
      0098F2 1E 0F            [ 2]  386 	ldw	x, (0x0f, sp)
      0098F4                        387 00151$:
                                    388 ;	./../../mib/stm8s_mib_debug_cmd.c: 187: } // GetCommand.
      0098F4 16 11            [ 2]  389 	ldw	y, (17, sp)
      0098F6 5B 15            [ 2]  390 	addw	sp, #21
      0098F8 90 FC            [ 2]  391 	jp	(y)
                                    392 ;	./../../mib/stm8s_mib_debug_cmd.c: 197: int GetArgs(char *s, char **argv)
                                    393 ;	-----------------------------------------
                                    394 ;	 function GetArgs
                                    395 ;	-----------------------------------------
      0098FA                        396 _GetArgs:
      0098FA 52 08            [ 2]  397 	sub	sp, #8
      0098FC 1F 05            [ 2]  398 	ldw	(0x05, sp), x
                                    399 ;	./../../mib/stm8s_mib_debug_cmd.c: 199: int args = 0;
      0098FE 5F               [ 1]  400 	clrw	x
      0098FF 1F 01            [ 2]  401 	ldw	(0x01, sp), x
                                    402 ;	./../../mib/stm8s_mib_debug_cmd.c: 201: if (!s || *s == '\0')
      009901 1E 05            [ 2]  403 	ldw	x, (0x05, sp)
      009903 27 03            [ 1]  404 	jreq	00101$
      009905 F6               [ 1]  405 	ld	a, (x)
      009906 26 03            [ 1]  406 	jrne	00131$
      009908                        407 00101$:
                                    408 ;	./../../mib/stm8s_mib_debug_cmd.c: 202: return 0;
      009908 5F               [ 1]  409 	clrw	x
      009909 20 73            [ 2]  410 	jra	00120$
                                    411 ;	./../../mib/stm8s_mib_debug_cmd.c: 203: while (args < MAX_ARGS)
      00990B                        412 00131$:
      00990B 5F               [ 1]  413 	clrw	x
      00990C 1F 07            [ 2]  414 	ldw	(0x07, sp), x
      00990E                        415 00117$:
      00990E 1E 07            [ 2]  416 	ldw	x, (0x07, sp)
      009910 A3 00 05         [ 2]  417 	cpw	x, #0x0005
      009913 2E 67            [ 1]  418 	jrsge	00119$
                                    419 ;	./../../mib/stm8s_mib_debug_cmd.c: 206: while ((*s == ' ') || (*s == '\t'))
      009915 1E 05            [ 2]  420 	ldw	x, (0x05, sp)
      009917                        421 00105$:
      009917 F6               [ 1]  422 	ld	a, (x)
      009918 A1 20            [ 1]  423 	cp	a, #0x20
      00991A 27 04            [ 1]  424 	jreq	00106$
      00991C A1 09            [ 1]  425 	cp	a, #0x09
      00991E 26 03            [ 1]  426 	jrne	00107$
      009920                        427 00106$:
                                    428 ;	./../../mib/stm8s_mib_debug_cmd.c: 207: s++;
      009920 5C               [ 1]  429 	incw	x
      009921 20 F4            [ 2]  430 	jra	00105$
      009923                        431 00107$:
                                    432 ;	./../../mib/stm8s_mib_debug_cmd.c: 210: if (*s == '\0')
      009923 4D               [ 1]  433 	tnz	a
      009924 26 0D            [ 1]  434 	jrne	00109$
                                    435 ;	./../../mib/stm8s_mib_debug_cmd.c: 212: argv[args] = 0;
      009926 1E 01            [ 2]  436 	ldw	x, (0x01, sp)
      009928 58               [ 2]  437 	sllw	x
      009929 72 FB 0B         [ 2]  438 	addw	x, (0x0b, sp)
      00992C 6F 01            [ 1]  439 	clr	(0x1, x)
      00992E 7F               [ 1]  440 	clr	(x)
                                    441 ;	./../../mib/stm8s_mib_debug_cmd.c: 213: return args;
      00992F 1E 01            [ 2]  442 	ldw	x, (0x01, sp)
      009931 20 4B            [ 2]  443 	jra	00120$
      009933                        444 00109$:
                                    445 ;	./../../mib/stm8s_mib_debug_cmd.c: 216: argv[args++] = s;
      009933 16 07            [ 2]  446 	ldw	y, (0x07, sp)
      009935 17 03            [ 2]  447 	ldw	(0x03, sp), y
      009937 16 07            [ 2]  448 	ldw	y, (0x07, sp)
      009939 90 5C            [ 1]  449 	incw	y
      00993B 17 07            [ 2]  450 	ldw	(0x07, sp), y
      00993D 17 01            [ 2]  451 	ldw	(0x01, sp), y
      00993F 16 03            [ 2]  452 	ldw	y, (0x03, sp)
      009941 90 58            [ 2]  453 	sllw	y
      009943 72 F9 0B         [ 2]  454 	addw	y, (0x0b, sp)
      009946 90 FF            [ 2]  455 	ldw	(y), x
                                    456 ;	./../../mib/stm8s_mib_debug_cmd.c: 219: while (*s && (*s != ' ') && (*s != '\t'))
      009948 1F 05            [ 2]  457 	ldw	(0x05, sp), x
      00994A                        458 00112$:
      00994A 1E 05            [ 2]  459 	ldw	x, (0x05, sp)
      00994C F6               [ 1]  460 	ld	a, (x)
                                    461 ;	./../../mib/stm8s_mib_debug_cmd.c: 220: s++;
      00994D 1E 05            [ 2]  462 	ldw	x, (0x05, sp)
      00994F 5C               [ 1]  463 	incw	x
      009950 1F 03            [ 2]  464 	ldw	(0x03, sp), x
                                    465 ;	./../../mib/stm8s_mib_debug_cmd.c: 219: while (*s && (*s != ' ') && (*s != '\t'))
      009952 4D               [ 1]  466 	tnz	a
      009953 27 0E            [ 1]  467 	jreq	00114$
      009955 A1 20            [ 1]  468 	cp	a, #0x20
      009957 27 0A            [ 1]  469 	jreq	00114$
      009959 A1 09            [ 1]  470 	cp	a, #0x09
      00995B 27 06            [ 1]  471 	jreq	00114$
                                    472 ;	./../../mib/stm8s_mib_debug_cmd.c: 220: s++;
      00995D 16 03            [ 2]  473 	ldw	y, (0x03, sp)
      00995F 17 05            [ 2]  474 	ldw	(0x05, sp), y
      009961 20 E7            [ 2]  475 	jra	00112$
      009963                        476 00114$:
                                    477 ;	./../../mib/stm8s_mib_debug_cmd.c: 222: if (*s == '\0')
      009963 4D               [ 1]  478 	tnz	a
      009964 26 0D            [ 1]  479 	jrne	00116$
                                    480 ;	./../../mib/stm8s_mib_debug_cmd.c: 224: argv[args] = 0;
      009966 1E 01            [ 2]  481 	ldw	x, (0x01, sp)
      009968 58               [ 2]  482 	sllw	x
      009969 72 FB 0B         [ 2]  483 	addw	x, (0x0b, sp)
      00996C 6F 01            [ 1]  484 	clr	(0x1, x)
      00996E 7F               [ 1]  485 	clr	(x)
                                    486 ;	./../../mib/stm8s_mib_debug_cmd.c: 225: return args;
      00996F 1E 01            [ 2]  487 	ldw	x, (0x01, sp)
      009971 20 0B            [ 2]  488 	jra	00120$
      009973                        489 00116$:
                                    490 ;	./../../mib/stm8s_mib_debug_cmd.c: 227: *s++ = '\0';
      009973 1E 05            [ 2]  491 	ldw	x, (0x05, sp)
      009975 7F               [ 1]  492 	clr	(x)
      009976 16 03            [ 2]  493 	ldw	y, (0x03, sp)
      009978 17 05            [ 2]  494 	ldw	(0x05, sp), y
      00997A 20 92            [ 2]  495 	jra	00117$
      00997C                        496 00119$:
                                    497 ;	./../../mib/stm8s_mib_debug_cmd.c: 229: return args;
      00997C 1E 01            [ 2]  498 	ldw	x, (0x01, sp)
      00997E                        499 00120$:
                                    500 ;	./../../mib/stm8s_mib_debug_cmd.c: 230: } // GetArgs.
      00997E 5B 08            [ 2]  501 	addw	sp, #8
      009980 90 85            [ 2]  502 	popw	y
      009982 5B 02            [ 2]  503 	addw	sp, #2
      009984 90 FC            [ 2]  504 	jp	(y)
                                    505 ;	./../../mib/stm8s_mib_debug_cmd.c: 241: int HexToInt(char *s, void *retval, uint16_t type)
                                    506 ;	-----------------------------------------
                                    507 ;	 function HexToInt
                                    508 ;	-----------------------------------------
      009986                        509 _HexToInt:
      009986 52 0E            [ 2]  510 	sub	sp, #14
                                    511 ;	./../../mib/stm8s_mib_debug_cmd.c: 247: if (!s || !retval)
      009988 1F 0A            [ 2]  512 	ldw	(0x0a, sp), x
      00998A 27 04            [ 1]  513 	jreq	00101$
      00998C 1E 11            [ 2]  514 	ldw	x, (0x11, sp)
      00998E 26 04            [ 1]  515 	jrne	00102$
      009990                        516 00101$:
                                    517 ;	./../../mib/stm8s_mib_debug_cmd.c: 248: return FALSE;
      009990 5F               [ 1]  518 	clrw	x
      009991 CC 9A 6C         [ 2]  519 	jp	00132$
      009994                        520 00102$:
                                    521 ;	./../../mib/stm8s_mib_debug_cmd.c: 249: if (!strncmp(s, "0x", 2))
      009994 4B 02            [ 1]  522 	push	#0x02
      009996 4B 00            [ 1]  523 	push	#0x00
      009998 4B 3D            [ 1]  524 	push	#<(___str_2+0)
      00999A 4B 83            [ 1]  525 	push	#((___str_2+0) >> 8)
      00999C 1E 0E            [ 2]  526 	ldw	x, (0x0e, sp)
      00999E CD A7 EC         [ 4]  527 	call	_strncmp
      0099A1 5D               [ 2]  528 	tnzw	x
      0099A2 26 06            [ 1]  529 	jrne	00105$
                                    530 ;	./../../mib/stm8s_mib_debug_cmd.c: 250: s += 2;
      0099A4 1E 0A            [ 2]  531 	ldw	x, (0x0a, sp)
      0099A6 5C               [ 1]  532 	incw	x
      0099A7 5C               [ 1]  533 	incw	x
      0099A8 1F 0A            [ 2]  534 	ldw	(0x0a, sp), x
      0099AA                        535 00105$:
                                    536 ;	./../../mib/stm8s_mib_debug_cmd.c: 252: for (i = 0, rval = 0; i < type / 4; i++)
      0099AA 0F 01            [ 1]  537 	clr	(0x01, sp)
      0099AC 5F               [ 1]  538 	clrw	x
      0099AD 1F 04            [ 2]  539 	ldw	(0x04, sp), x
      0099AF 1F 02            [ 2]  540 	ldw	(0x02, sp), x
      0099B1 16 0A            [ 2]  541 	ldw	y, (0x0a, sp)
      0099B3 17 0C            [ 2]  542 	ldw	(0x0c, sp), y
      0099B5 0F 0E            [ 1]  543 	clr	(0x0e, sp)
      0099B7                        544 00130$:
      0099B7 16 13            [ 2]  545 	ldw	y, (0x13, sp)
      0099B9 17 06            [ 2]  546 	ldw	(0x06, sp), y
      0099BB 93               [ 1]  547 	ldw	x, y
      0099BC 54               [ 2]  548 	srlw	x
      0099BD 54               [ 2]  549 	srlw	x
      0099BE 1F 08            [ 2]  550 	ldw	(0x08, sp), x
      0099C0 7B 0E            [ 1]  551 	ld	a, (0x0e, sp)
      0099C2 5F               [ 1]  552 	clrw	x
      0099C3 97               [ 1]  553 	ld	xl, a
      0099C4 13 08            [ 2]  554 	cpw	x, (0x08, sp)
      0099C6 24 70            [ 1]  555 	jrnc	00123$
                                    556 ;	./../../mib/stm8s_mib_debug_cmd.c: 254: if (*s == '\0')
      0099C8 1E 0C            [ 2]  557 	ldw	x, (0x0c, sp)
      0099CA F6               [ 1]  558 	ld	a, (x)
      0099CB 26 08            [ 1]  559 	jrne	00110$
                                    560 ;	./../../mib/stm8s_mib_debug_cmd.c: 256: if (i == 0)
      0099CD 0D 01            [ 1]  561 	tnz	(0x01, sp)
      0099CF 26 67            [ 1]  562 	jrne	00123$
                                    563 ;	./../../mib/stm8s_mib_debug_cmd.c: 257: return FALSE;
      0099D1 5F               [ 1]  564 	clrw	x
      0099D2 CC 9A 6C         [ 2]  565 	jp	00132$
                                    566 ;	./../../mib/stm8s_mib_debug_cmd.c: 259: break;
      0099D5                        567 00110$:
                                    568 ;	./../../mib/stm8s_mib_debug_cmd.c: 261: c = *s++;
      0099D5 1E 0C            [ 2]  569 	ldw	x, (0x0c, sp)
      0099D7 5C               [ 1]  570 	incw	x
      0099D8 1F 0C            [ 2]  571 	ldw	(0x0c, sp), x
                                    572 ;	./../../mib/stm8s_mib_debug_cmd.c: 264: c -= '0';
      0099DA 97               [ 1]  573 	ld	xl, a
                                    574 ;	./../../mib/stm8s_mib_debug_cmd.c: 263: if (c >= '0' && c <= '9')
      0099DB A1 30            [ 1]  575 	cp	a, #0x30
      0099DD 25 09            [ 1]  576 	jrc	00120$
      0099DF A1 39            [ 1]  577 	cp	a, #0x39
      0099E1 22 05            [ 1]  578 	jrugt	00120$
                                    579 ;	./../../mib/stm8s_mib_debug_cmd.c: 264: c -= '0';
      0099E3 9F               [ 1]  580 	ld	a, xl
      0099E4 A0 30            [ 1]  581 	sub	a, #0x30
      0099E6 20 1D            [ 2]  582 	jra	00121$
      0099E8                        583 00120$:
                                    584 ;	./../../mib/stm8s_mib_debug_cmd.c: 265: else if (c >= 'a' && c <= 'f')
      0099E8 A1 61            [ 1]  585 	cp	a, #0x61
      0099EA 25 09            [ 1]  586 	jrc	00116$
      0099EC A1 66            [ 1]  587 	cp	a, #0x66
      0099EE 22 05            [ 1]  588 	jrugt	00116$
                                    589 ;	./../../mib/stm8s_mib_debug_cmd.c: 266: c = c - 'a' + 10;
      0099F0 9F               [ 1]  590 	ld	a, xl
      0099F1 AB A9            [ 1]  591 	add	a, #0xa9
      0099F3 20 10            [ 2]  592 	jra	00121$
      0099F5                        593 00116$:
                                    594 ;	./../../mib/stm8s_mib_debug_cmd.c: 267: else if (c >= 'A' && c <= 'F')
      0099F5 A1 41            [ 1]  595 	cp	a, #0x41
      0099F7 25 09            [ 1]  596 	jrc	00112$
      0099F9 A1 46            [ 1]  597 	cp	a, #0x46
      0099FB 22 05            [ 1]  598 	jrugt	00112$
                                    599 ;	./../../mib/stm8s_mib_debug_cmd.c: 268: c = c - 'A' + 10;
      0099FD 9F               [ 1]  600 	ld	a, xl
      0099FE AB C9            [ 1]  601 	add	a, #0xc9
      009A00 20 03            [ 2]  602 	jra	00121$
      009A02                        603 00112$:
                                    604 ;	./../../mib/stm8s_mib_debug_cmd.c: 270: return FALSE;
      009A02 5F               [ 1]  605 	clrw	x
      009A03 20 67            [ 2]  606 	jra	00132$
      009A05                        607 00121$:
                                    608 ;	./../../mib/stm8s_mib_debug_cmd.c: 272: rval = rval << 4 | c;
      009A05 88               [ 1]  609 	push	a
      009A06 1E 05            [ 2]  610 	ldw	x, (0x05, sp)
      009A08 16 03            [ 2]  611 	ldw	y, (0x03, sp)
      009A0A A6 04            [ 1]  612 	ld	a, #0x04
      009A0C                        613 00222$:
      009A0C 58               [ 2]  614 	sllw	x
      009A0D 90 59            [ 2]  615 	rlcw	y
      009A0F 4A               [ 1]  616 	dec	a
      009A10 26 FA            [ 1]  617 	jrne	00222$
      009A12 84               [ 1]  618 	pop	a
      009A13 0F 08            [ 1]  619 	clr	(0x08, sp)
      009A15 0F 07            [ 1]  620 	clr	(0x07, sp)
      009A17 0F 06            [ 1]  621 	clr	(0x06, sp)
      009A19 89               [ 2]  622 	pushw	x
      009A1A 1A 02            [ 1]  623 	or	a, (2, sp)
      009A1C 85               [ 2]  624 	popw	x
      009A1D 02               [ 1]  625 	rlwa	x
      009A1E 1A 08            [ 1]  626 	or	a, (0x08, sp)
      009A20 95               [ 1]  627 	ld	xh, a
      009A21 90 9F            [ 1]  628 	ld	a, yl
      009A23 1A 07            [ 1]  629 	or	a, (0x07, sp)
      009A25 90 02            [ 1]  630 	rlwa	y
      009A27 1A 06            [ 1]  631 	or	a, (0x06, sp)
      009A29 90 95            [ 1]  632 	ld	yh, a
      009A2B 1F 04            [ 2]  633 	ldw	(0x04, sp), x
      009A2D 17 02            [ 2]  634 	ldw	(0x02, sp), y
                                    635 ;	./../../mib/stm8s_mib_debug_cmd.c: 252: for (i = 0, rval = 0; i < type / 4; i++)
      009A2F 0C 0E            [ 1]  636 	inc	(0x0e, sp)
      009A31 7B 0E            [ 1]  637 	ld	a, (0x0e, sp)
      009A33 6B 01            [ 1]  638 	ld	(0x01, sp), a
      009A35 CC 99 B7         [ 2]  639 	jp	00130$
      009A38                        640 00123$:
                                    641 ;	./../../mib/stm8s_mib_debug_cmd.c: 275: switch (type)
      009A38 1E 06            [ 2]  642 	ldw	x, (0x06, sp)
      009A3A A3 00 08         [ 2]  643 	cpw	x, #0x0008
      009A3D 27 10            [ 1]  644 	jreq	00124$
      009A3F 1E 06            [ 2]  645 	ldw	x, (0x06, sp)
      009A41 A3 00 10         [ 2]  646 	cpw	x, #0x0010
      009A44 27 10            [ 1]  647 	jreq	00125$
      009A46 1E 06            [ 2]  648 	ldw	x, (0x06, sp)
      009A48 A3 00 20         [ 2]  649 	cpw	x, #0x0020
      009A4B 27 10            [ 1]  650 	jreq	00126$
      009A4D 20 19            [ 2]  651 	jra	00127$
                                    652 ;	./../../mib/stm8s_mib_debug_cmd.c: 277: case 8:
      009A4F                        653 00124$:
                                    654 ;	./../../mib/stm8s_mib_debug_cmd.c: 278: *(uint8_t *)retval = (uint8_t)rval;
      009A4F 1E 11            [ 2]  655 	ldw	x, (0x11, sp)
      009A51 7B 05            [ 1]  656 	ld	a, (0x05, sp)
      009A53 F7               [ 1]  657 	ld	(x), a
                                    658 ;	./../../mib/stm8s_mib_debug_cmd.c: 279: break;
      009A54 20 14            [ 2]  659 	jra	00128$
                                    660 ;	./../../mib/stm8s_mib_debug_cmd.c: 280: case 16:
      009A56                        661 00125$:
                                    662 ;	./../../mib/stm8s_mib_debug_cmd.c: 281: *(uint16_t *)retval = (uint16_t)rval;
      009A56 1E 11            [ 2]  663 	ldw	x, (0x11, sp)
      009A58 16 04            [ 2]  664 	ldw	y, (0x04, sp)
      009A5A FF               [ 2]  665 	ldw	(x), y
                                    666 ;	./../../mib/stm8s_mib_debug_cmd.c: 282: break;
      009A5B 20 0D            [ 2]  667 	jra	00128$
                                    668 ;	./../../mib/stm8s_mib_debug_cmd.c: 283: case 32:
      009A5D                        669 00126$:
                                    670 ;	./../../mib/stm8s_mib_debug_cmd.c: 284: *(uint32_t *)retval = (uint32_t)rval;
      009A5D 1E 11            [ 2]  671 	ldw	x, (0x11, sp)
      009A5F 16 04            [ 2]  672 	ldw	y, (0x04, sp)
      009A61 EF 02            [ 2]  673 	ldw	(0x2, x), y
      009A63 16 02            [ 2]  674 	ldw	y, (0x02, sp)
      009A65 FF               [ 2]  675 	ldw	(x), y
                                    676 ;	./../../mib/stm8s_mib_debug_cmd.c: 285: break;
      009A66 20 02            [ 2]  677 	jra	00128$
                                    678 ;	./../../mib/stm8s_mib_debug_cmd.c: 286: default:
      009A68                        679 00127$:
                                    680 ;	./../../mib/stm8s_mib_debug_cmd.c: 287: return FALSE;
      009A68 5F               [ 1]  681 	clrw	x
                                    682 ;	./../../mib/stm8s_mib_debug_cmd.c: 288: }
                                    683 ;	./../../mib/stm8s_mib_debug_cmd.c: 289: return TRUE;
      009A69 C5                     684 	.byte 0xc5
      009A6A                        685 00128$:
      009A6A 5F               [ 1]  686 	clrw	x
      009A6B 5C               [ 1]  687 	incw	x
      009A6C                        688 00132$:
                                    689 ;	./../../mib/stm8s_mib_debug_cmd.c: 290: } // HexToInt.
      009A6C 16 0F            [ 2]  690 	ldw	y, (15, sp)
      009A6E 5B 14            [ 2]  691 	addw	sp, #20
      009A70 90 FC            [ 2]  692 	jp	(y)
                                    693 ;	./../../mib/stm8s_mib_debug_cmd.c: 300: int DecToLong(char *s, void *retval, uint16_t type)
                                    694 ;	-----------------------------------------
                                    695 ;	 function DecToLong
                                    696 ;	-----------------------------------------
      009A72                        697 _DecToLong:
      009A72 52 0E            [ 2]  698 	sub	sp, #14
                                    699 ;	./../../mib/stm8s_mib_debug_cmd.c: 305: if (!s || !s[0] || !retval)
      009A74 5D               [ 2]  700 	tnzw	x
      009A75 27 07            [ 1]  701 	jreq	00101$
      009A77 F6               [ 1]  702 	ld	a, (x)
      009A78 27 04            [ 1]  703 	jreq	00101$
      009A7A 16 11            [ 2]  704 	ldw	y, (0x11, sp)
      009A7C 26 03            [ 1]  705 	jrne	00102$
      009A7E                        706 00101$:
                                    707 ;	./../../mib/stm8s_mib_debug_cmd.c: 306: return FALSE;
      009A7E 5F               [ 1]  708 	clrw	x
      009A7F 20 73            [ 2]  709 	jra	00117$
      009A81                        710 00102$:
                                    711 ;	./../../mib/stm8s_mib_debug_cmd.c: 308: for (rval= 0; *s; s++)
      009A81 90 5F            [ 1]  712 	clrw	y
      009A83 17 09            [ 2]  713 	ldw	(0x09, sp), y
      009A85 1F 0D            [ 2]  714 	ldw	(0x0d, sp), x
      009A87                        715 00115$:
      009A87 1E 0D            [ 2]  716 	ldw	x, (0x0d, sp)
      009A89 F6               [ 1]  717 	ld	a, (x)
      009A8A 27 3C            [ 1]  718 	jreq	00108$
                                    719 ;	./../../mib/stm8s_mib_debug_cmd.c: 310: if (*s < '0' || *s > '9')
      009A8C A1 30            [ 1]  720 	cp	a, #0x30
      009A8E 25 04            [ 1]  721 	jrc	00105$
      009A90 A1 39            [ 1]  722 	cp	a, #0x39
      009A92 23 03            [ 2]  723 	jrule	00106$
      009A94                        724 00105$:
                                    725 ;	./../../mib/stm8s_mib_debug_cmd.c: 311: return FALSE;
      009A94 5F               [ 1]  726 	clrw	x
      009A95 20 5D            [ 2]  727 	jra	00117$
      009A97                        728 00106$:
                                    729 ;	./../../mib/stm8s_mib_debug_cmd.c: 312: c = *s - '0';
      009A97 A0 30            [ 1]  730 	sub	a, #0x30
                                    731 ;	./../../mib/stm8s_mib_debug_cmd.c: 313: rval = rval * 10 + c;
      009A99 88               [ 1]  732 	push	a
      009A9A 90 89            [ 2]  733 	pushw	y
      009A9C 1E 0C            [ 2]  734 	ldw	x, (0x0c, sp)
      009A9E 89               [ 2]  735 	pushw	x
      009A9F 4B 0A            [ 1]  736 	push	#0x0a
      009AA1 5F               [ 1]  737 	clrw	x
      009AA2 89               [ 2]  738 	pushw	x
      009AA3 4B 00            [ 1]  739 	push	#0x00
      009AA5 CD A9 68         [ 4]  740 	call	__mullong
      009AA8 5B 08            [ 2]  741 	addw	sp, #8
      009AAA 1F 04            [ 2]  742 	ldw	(0x04, sp), x
      009AAC 84               [ 1]  743 	pop	a
      009AAD 5F               [ 1]  744 	clrw	x
      009AAE 1F 05            [ 2]  745 	ldw	(0x05, sp), x
      009AB0 97               [ 1]  746 	ld	xl, a
      009AB1 72 FB 03         [ 2]  747 	addw	x, (0x03, sp)
      009AB4 90 9F            [ 1]  748 	ld	a, yl
      009AB6 19 06            [ 1]  749 	adc	a, (0x06, sp)
      009AB8 6B 0A            [ 1]  750 	ld	(0x0a, sp), a
      009ABA 90 9E            [ 1]  751 	ld	a, yh
      009ABC 19 05            [ 1]  752 	adc	a, (0x05, sp)
      009ABE 6B 09            [ 1]  753 	ld	(0x09, sp), a
      009AC0 51               [ 1]  754 	exgw	x, y
                                    755 ;	./../../mib/stm8s_mib_debug_cmd.c: 308: for (rval= 0; *s; s++)
      009AC1 1E 0D            [ 2]  756 	ldw	x, (0x0d, sp)
      009AC3 5C               [ 1]  757 	incw	x
      009AC4 1F 0D            [ 2]  758 	ldw	(0x0d, sp), x
      009AC6 20 BF            [ 2]  759 	jra	00115$
      009AC8                        760 00108$:
                                    761 ;	./../../mib/stm8s_mib_debug_cmd.c: 316: switch (type)
      009AC8 1E 13            [ 2]  762 	ldw	x, (0x13, sp)
      009ACA A3 00 08         [ 2]  763 	cpw	x, #0x0008
      009ACD 27 0C            [ 1]  764 	jreq	00109$
      009ACF A3 00 10         [ 2]  765 	cpw	x, #0x0010
      009AD2 27 0E            [ 1]  766 	jreq	00110$
      009AD4 A3 00 20         [ 2]  767 	cpw	x, #0x0020
      009AD7 27 0E            [ 1]  768 	jreq	00111$
      009AD9 20 15            [ 2]  769 	jra	00112$
                                    770 ;	./../../mib/stm8s_mib_debug_cmd.c: 318: case 8:
      009ADB                        771 00109$:
                                    772 ;	./../../mib/stm8s_mib_debug_cmd.c: 319: *(uint8_t *)retval = (uint8_t)rval;
      009ADB 1E 11            [ 2]  773 	ldw	x, (0x11, sp)
      009ADD 90 9F            [ 1]  774 	ld	a, yl
      009ADF F7               [ 1]  775 	ld	(x), a
                                    776 ;	./../../mib/stm8s_mib_debug_cmd.c: 320: break;
      009AE0 20 10            [ 2]  777 	jra	00113$
                                    778 ;	./../../mib/stm8s_mib_debug_cmd.c: 321: case 16:
      009AE2                        779 00110$:
                                    780 ;	./../../mib/stm8s_mib_debug_cmd.c: 322: *(uint16_t *)retval = (uint16_t)rval;
      009AE2 1E 11            [ 2]  781 	ldw	x, (0x11, sp)
      009AE4 FF               [ 2]  782 	ldw	(x), y
                                    783 ;	./../../mib/stm8s_mib_debug_cmd.c: 323: break;
      009AE5 20 0B            [ 2]  784 	jra	00113$
                                    785 ;	./../../mib/stm8s_mib_debug_cmd.c: 324: case 32:
      009AE7                        786 00111$:
                                    787 ;	./../../mib/stm8s_mib_debug_cmd.c: 325: *(uint32_t *)retval = (uint32_t)rval;
      009AE7 1E 11            [ 2]  788 	ldw	x, (0x11, sp)
      009AE9 EF 02            [ 2]  789 	ldw	(0x2, x), y
      009AEB 16 09            [ 2]  790 	ldw	y, (0x09, sp)
      009AED FF               [ 2]  791 	ldw	(x), y
                                    792 ;	./../../mib/stm8s_mib_debug_cmd.c: 326: break;
      009AEE 20 02            [ 2]  793 	jra	00113$
                                    794 ;	./../../mib/stm8s_mib_debug_cmd.c: 327: default:
      009AF0                        795 00112$:
                                    796 ;	./../../mib/stm8s_mib_debug_cmd.c: 328: return FALSE;
      009AF0 5F               [ 1]  797 	clrw	x
                                    798 ;	./../../mib/stm8s_mib_debug_cmd.c: 329: }
                                    799 ;	./../../mib/stm8s_mib_debug_cmd.c: 330: return TRUE;
      009AF1 C5                     800 	.byte 0xc5
      009AF2                        801 00113$:
      009AF2 5F               [ 1]  802 	clrw	x
      009AF3 5C               [ 1]  803 	incw	x
      009AF4                        804 00117$:
                                    805 ;	./../../mib/stm8s_mib_debug_cmd.c: 331: } // DecToLong.
      009AF4 16 0F            [ 2]  806 	ldw	y, (15, sp)
      009AF6 5B 14            [ 2]  807 	addw	sp, #20
      009AF8 90 FC            [ 2]  808 	jp	(y)
                                    809 ;	./../../mib/stm8s_mib_debug_cmd.c: 340: void HexDump(uint32_t addr, uint32_t len)
                                    810 ;	-----------------------------------------
                                    811 ;	 function HexDump
                                    812 ;	-----------------------------------------
      009AFA                        813 _HexDump:
      009AFA 52 27            [ 2]  814 	sub	sp, #39
                                    815 ;	./../../mib/stm8s_mib_debug_cmd.c: 343: uint32_t endPtr = (addr + len);
      009AFC 16 2C            [ 2]  816 	ldw	y, (0x2c, sp)
      009AFE 72 F9 30         [ 2]  817 	addw	y, (0x30, sp)
      009B01 1E 2A            [ 2]  818 	ldw	x, (0x2a, sp)
      009B03 24 01            [ 1]  819 	jrnc	00240$
      009B05 5C               [ 1]  820 	incw	x
      009B06                        821 00240$:
      009B06 72 FB 2E         [ 2]  822 	addw	x, (0x2e, sp)
      009B09 17 17            [ 2]  823 	ldw	(0x17, sp), y
      009B0B 1F 15            [ 2]  824 	ldw	(0x15, sp), x
                                    825 ;	./../../mib/stm8s_mib_debug_cmd.c: 344: int i, remainder = len & 0xf;
      009B0D 1E 30            [ 2]  826 	ldw	x, (0x30, sp)
      009B0F 9F               [ 1]  827 	ld	a, xl
      009B10 A4 0F            [ 1]  828 	and	a, #0x0f
      009B12 6B 1A            [ 1]  829 	ld	(0x1a, sp), a
      009B14 0F 19            [ 1]  830 	clr	(0x19, sp)
                                    831 ;	./../../mib/stm8s_mib_debug_cmd.c: 350: mib_printf("\r\n");
      009B16 4B 36            [ 1]  832 	push	#<(___str_0+0)
      009B18 4B 83            [ 1]  833 	push	#((___str_0+0) >> 8)
      009B1A CD 96 77         [ 4]  834 	call	_mib_printf
      009B1D 5B 02            [ 2]  835 	addw	sp, #2
                                    836 ;	./../../mib/stm8s_mib_debug_cmd.c: 351: mib_printf("address     Hex Value                                        Ascii value\r\n");
      009B1F 4B 40            [ 1]  837 	push	#<(___str_3+0)
      009B21 4B 83            [ 1]  838 	push	#((___str_3+0) >> 8)
      009B23 CD 96 77         [ 4]  839 	call	_mib_printf
      009B26 5B 02            [ 2]  840 	addw	sp, #2
                                    841 ;	./../../mib/stm8s_mib_debug_cmd.c: 354: p_address = (uint32_t)(addr);
      009B28 1E 2C            [ 2]  842 	ldw	x, (0x2c, sp)
      009B2A 16 2A            [ 2]  843 	ldw	y, (0x2a, sp)
                                    844 ;	./../../mib/stm8s_mib_debug_cmd.c: 355: p_data_ptr = (uint16_t *)p_data;
                                    845 ;	./../../mib/stm8s_mib_debug_cmd.c: 356: while ((p_address + 16) <= endPtr)
      009B2C 1F 1D            [ 2]  846 	ldw	(0x1d, sp), x
      009B2E 17 1B            [ 2]  847 	ldw	(0x1b, sp), y
      009B30                        848 00107$:
      009B30 1E 1D            [ 2]  849 	ldw	x, (0x1d, sp)
      009B32 1C 00 10         [ 2]  850 	addw	x, #0x0010
      009B35 1F 21            [ 2]  851 	ldw	(0x21, sp), x
      009B37 7B 1C            [ 1]  852 	ld	a, (0x1c, sp)
      009B39 A9 00            [ 1]  853 	adc	a, #0x00
      009B3B 6B 20            [ 1]  854 	ld	(0x20, sp), a
      009B3D 7B 1B            [ 1]  855 	ld	a, (0x1b, sp)
      009B3F A9 00            [ 1]  856 	adc	a, #0x00
      009B41 6B 1F            [ 1]  857 	ld	(0x1f, sp), a
      009B43 1E 17            [ 2]  858 	ldw	x, (0x17, sp)
      009B45 13 21            [ 2]  859 	cpw	x, (0x21, sp)
      009B47 7B 16            [ 1]  860 	ld	a, (0x16, sp)
      009B49 12 20            [ 1]  861 	sbc	a, (0x20, sp)
      009B4B 7B 15            [ 1]  862 	ld	a, (0x15, sp)
      009B4D 12 1F            [ 1]  863 	sbc	a, (0x1f, sp)
      009B4F 24 03            [ 1]  864 	jrnc	00241$
      009B51 CC 9C 14         [ 2]  865 	jp	00163$
      009B54                        866 00241$:
                                    867 ;	./../../mib/stm8s_mib_debug_cmd.c: 358: mib_printf("0x%08lx : ", p_address);
      009B54 1E 1D            [ 2]  868 	ldw	x, (0x1d, sp)
      009B56 89               [ 2]  869 	pushw	x
      009B57 1E 1D            [ 2]  870 	ldw	x, (0x1d, sp)
      009B59 89               [ 2]  871 	pushw	x
      009B5A 4B 8B            [ 1]  872 	push	#<(___str_4+0)
      009B5C 4B 83            [ 1]  873 	push	#((___str_4+0) >> 8)
      009B5E CD 96 77         [ 4]  874 	call	_mib_printf
      009B61 5B 06            [ 2]  875 	addw	sp, #6
                                    876 ;	./../../mib/stm8s_mib_debug_cmd.c: 359: for (i = 0; i < 8; i++)
      009B63 5F               [ 1]  877 	clrw	x
      009B64 1F 26            [ 2]  878 	ldw	(0x26, sp), x
      009B66                        879 00120$:
                                    880 ;	./../../mib/stm8s_mib_debug_cmd.c: 361: p_data_ptr[i] = rd_ADDR16(p_address + i * 2);
      009B66 16 26            [ 2]  881 	ldw	y, (0x26, sp)
      009B68 90 58            [ 2]  882 	sllw	y
      009B6A 93               [ 1]  883 	ldw	x, y
      009B6B 89               [ 2]  884 	pushw	x
      009B6C 96               [ 1]  885 	ldw	x, sp
      009B6D 1C 00 03         [ 2]  886 	addw	x, #3
      009B70 72 FB 01         [ 2]  887 	addw	x, (1, sp)
      009B73 5B 02            [ 2]  888 	addw	sp, #2
      009B75 17 24            [ 2]  889 	ldw	(0x24, sp), y
      009B77 16 1D            [ 2]  890 	ldw	y, (0x1d, sp)
      009B79 72 F9 24         [ 2]  891 	addw	y, (0x24, sp)
      009B7C 90 FE            [ 2]  892 	ldw	y, (y)
      009B7E FF               [ 2]  893 	ldw	(x), y
                                    894 ;	./../../mib/stm8s_mib_debug_cmd.c: 362: mib_printf("%02x ", p_data[i * 2]);
      009B7F 7B 27            [ 1]  895 	ld	a, (0x27, sp)
      009B81 48               [ 1]  896 	sll	a
      009B82 6B 23            [ 1]  897 	ld	(0x23, sp), a
      009B84 6B 25            [ 1]  898 	ld	(0x25, sp), a
      009B86 49               [ 1]  899 	rlc	a
      009B87 4F               [ 1]  900 	clr	a
      009B88 A2 00            [ 1]  901 	sbc	a, #0x00
      009B8A 6B 24            [ 1]  902 	ld	(0x24, sp), a
      009B8C 96               [ 1]  903 	ldw	x, sp
      009B8D 5C               [ 1]  904 	incw	x
      009B8E 72 FB 24         [ 2]  905 	addw	x, (0x24, sp)
      009B91 F6               [ 1]  906 	ld	a, (x)
      009B92 5F               [ 1]  907 	clrw	x
      009B93 97               [ 1]  908 	ld	xl, a
      009B94 89               [ 2]  909 	pushw	x
      009B95 4B 96            [ 1]  910 	push	#<(___str_5+0)
      009B97 4B 83            [ 1]  911 	push	#((___str_5+0) >> 8)
      009B99 CD 96 77         [ 4]  912 	call	_mib_printf
      009B9C 5B 04            [ 2]  913 	addw	sp, #4
                                    914 ;	./../../mib/stm8s_mib_debug_cmd.c: 363: mib_printf("%02x ", p_data[i * 2 + 1]);
      009B9E 7B 23            [ 1]  915 	ld	a, (0x23, sp)
      009BA0 4C               [ 1]  916 	inc	a
      009BA1 6B 25            [ 1]  917 	ld	(0x25, sp), a
      009BA3 49               [ 1]  918 	rlc	a
      009BA4 4F               [ 1]  919 	clr	a
      009BA5 A2 00            [ 1]  920 	sbc	a, #0x00
      009BA7 6B 24            [ 1]  921 	ld	(0x24, sp), a
      009BA9 96               [ 1]  922 	ldw	x, sp
      009BAA 5C               [ 1]  923 	incw	x
      009BAB 72 FB 24         [ 2]  924 	addw	x, (0x24, sp)
      009BAE F6               [ 1]  925 	ld	a, (x)
      009BAF 5F               [ 1]  926 	clrw	x
      009BB0 97               [ 1]  927 	ld	xl, a
      009BB1 89               [ 2]  928 	pushw	x
      009BB2 4B 96            [ 1]  929 	push	#<(___str_5+0)
      009BB4 4B 83            [ 1]  930 	push	#((___str_5+0) >> 8)
      009BB6 CD 96 77         [ 4]  931 	call	_mib_printf
      009BB9 5B 04            [ 2]  932 	addw	sp, #4
                                    933 ;	./../../mib/stm8s_mib_debug_cmd.c: 359: for (i = 0; i < 8; i++)
      009BBB 1E 26            [ 2]  934 	ldw	x, (0x26, sp)
      009BBD 5C               [ 1]  935 	incw	x
      009BBE 1F 26            [ 2]  936 	ldw	(0x26, sp), x
      009BC0 A3 00 08         [ 2]  937 	cpw	x, #0x0008
      009BC3 2F A1            [ 1]  938 	jrslt	00120$
                                    939 ;	./../../mib/stm8s_mib_debug_cmd.c: 365: mib_printf(" ");
      009BC5 4B 9C            [ 1]  940 	push	#<(___str_6+0)
      009BC7 4B 83            [ 1]  941 	push	#((___str_6+0) >> 8)
      009BC9 CD 96 77         [ 4]  942 	call	_mib_printf
      009BCC 5B 02            [ 2]  943 	addw	sp, #2
                                    944 ;	./../../mib/stm8s_mib_debug_cmd.c: 366: for (i = 0; i < 16; i++)
      009BCE 5F               [ 1]  945 	clrw	x
      009BCF 1F 26            [ 2]  946 	ldw	(0x26, sp), x
      009BD1                        947 00122$:
                                    948 ;	./../../mib/stm8s_mib_debug_cmd.c: 368: c = p_data[i];
      009BD1 96               [ 1]  949 	ldw	x, sp
      009BD2 5C               [ 1]  950 	incw	x
      009BD3 72 FB 26         [ 2]  951 	addw	x, (0x26, sp)
      009BD6 F6               [ 1]  952 	ld	a, (x)
                                    953 ;	./../../mib/stm8s_mib_debug_cmd.c: 369: if (c >= 32 && c <= 125)
      009BD7 A1 20            [ 1]  954 	cp	a, #0x20
      009BD9 25 12            [ 1]  955 	jrc	00103$
      009BDB A1 7D            [ 1]  956 	cp	a, #0x7d
      009BDD 22 0E            [ 1]  957 	jrugt	00103$
                                    958 ;	./../../mib/stm8s_mib_debug_cmd.c: 370: mib_printf("%c", c);
      009BDF 5F               [ 1]  959 	clrw	x
      009BE0 97               [ 1]  960 	ld	xl, a
      009BE1 89               [ 2]  961 	pushw	x
      009BE2 4B 9E            [ 1]  962 	push	#<(___str_7+0)
      009BE4 4B 83            [ 1]  963 	push	#((___str_7+0) >> 8)
      009BE6 CD 96 77         [ 4]  964 	call	_mib_printf
      009BE9 5B 04            [ 2]  965 	addw	sp, #4
      009BEB 20 09            [ 2]  966 	jra	00123$
      009BED                        967 00103$:
                                    968 ;	./../../mib/stm8s_mib_debug_cmd.c: 372: mib_printf(".");
      009BED 4B A1            [ 1]  969 	push	#<(___str_8+0)
      009BEF 4B 83            [ 1]  970 	push	#((___str_8+0) >> 8)
      009BF1 CD 96 77         [ 4]  971 	call	_mib_printf
      009BF4 5B 02            [ 2]  972 	addw	sp, #2
      009BF6                        973 00123$:
                                    974 ;	./../../mib/stm8s_mib_debug_cmd.c: 366: for (i = 0; i < 16; i++)
      009BF6 1E 26            [ 2]  975 	ldw	x, (0x26, sp)
      009BF8 5C               [ 1]  976 	incw	x
      009BF9 1F 26            [ 2]  977 	ldw	(0x26, sp), x
      009BFB A3 00 10         [ 2]  978 	cpw	x, #0x0010
      009BFE 2F D1            [ 1]  979 	jrslt	00122$
                                    980 ;	./../../mib/stm8s_mib_debug_cmd.c: 374: p_address += 16;
      009C00 16 21            [ 2]  981 	ldw	y, (0x21, sp)
      009C02 17 1D            [ 2]  982 	ldw	(0x1d, sp), y
      009C04 16 1F            [ 2]  983 	ldw	y, (0x1f, sp)
      009C06 17 1B            [ 2]  984 	ldw	(0x1b, sp), y
                                    985 ;	./../../mib/stm8s_mib_debug_cmd.c: 376: mib_printf("\r\n");
      009C08 4B 36            [ 1]  986 	push	#<(___str_0+0)
      009C0A 4B 83            [ 1]  987 	push	#((___str_0+0) >> 8)
      009C0C CD 96 77         [ 4]  988 	call	_mib_printf
      009C0F 5B 02            [ 2]  989 	addw	sp, #2
      009C11 CC 9B 30         [ 2]  990 	jp	00107$
      009C14                        991 00163$:
      009C14 16 1D            [ 2]  992 	ldw	y, (0x1d, sp)
      009C16 17 24            [ 2]  993 	ldw	(0x24, sp), y
      009C18 16 1B            [ 2]  994 	ldw	y, (0x1b, sp)
      009C1A 17 22            [ 2]  995 	ldw	(0x22, sp), y
                                    996 ;	./../../mib/stm8s_mib_debug_cmd.c: 380: if (remainder)
      009C1C 1E 19            [ 2]  997 	ldw	x, (0x19, sp)
      009C1E 26 03            [ 1]  998 	jrne	00248$
      009C20 CC 9D 30         [ 2]  999 	jp	00119$
      009C23                       1000 00248$:
                                   1001 ;	./../../mib/stm8s_mib_debug_cmd.c: 382: mib_printf("0x%08lx  ", p_address);
      009C23 1E 1D            [ 2] 1002 	ldw	x, (0x1d, sp)
      009C25 89               [ 2] 1003 	pushw	x
      009C26 1E 1D            [ 2] 1004 	ldw	x, (0x1d, sp)
      009C28 89               [ 2] 1005 	pushw	x
      009C29 4B A3            [ 1] 1006 	push	#<(___str_9+0)
      009C2B 4B 83            [ 1] 1007 	push	#((___str_9+0) >> 8)
      009C2D CD 96 77         [ 4] 1008 	call	_mib_printf
      009C30 5B 06            [ 2] 1009 	addw	sp, #6
                                   1010 ;	./../../mib/stm8s_mib_debug_cmd.c: 383: for (i = 0; i < (remainder >> 1); i++)
      009C32 1E 19            [ 2] 1011 	ldw	x, (0x19, sp)
      009C34 57               [ 2] 1012 	sraw	x
      009C35 1F 1D            [ 2] 1013 	ldw	(0x1d, sp), x
      009C37 5F               [ 1] 1014 	clrw	x
      009C38 1F 26            [ 2] 1015 	ldw	(0x26, sp), x
      009C3A                       1016 00125$:
      009C3A 1E 26            [ 2] 1017 	ldw	x, (0x26, sp)
      009C3C 13 1D            [ 2] 1018 	cpw	x, (0x1d, sp)
      009C3E 2E 5C            [ 1] 1019 	jrsge	00110$
                                   1020 ;	./../../mib/stm8s_mib_debug_cmd.c: 385: p_data_ptr[i] = rd_ADDR16(p_address + i * 2);
      009C40 16 26            [ 2] 1021 	ldw	y, (0x26, sp)
      009C42 90 58            [ 2] 1022 	sllw	y
      009C44 93               [ 1] 1023 	ldw	x, y
      009C45 89               [ 2] 1024 	pushw	x
      009C46 96               [ 1] 1025 	ldw	x, sp
      009C47 1C 00 03         [ 2] 1026 	addw	x, #3
      009C4A 72 FB 01         [ 2] 1027 	addw	x, (1, sp)
      009C4D 5B 02            [ 2] 1028 	addw	sp, #2
      009C4F 17 20            [ 2] 1029 	ldw	(0x20, sp), y
      009C51 16 24            [ 2] 1030 	ldw	y, (0x24, sp)
      009C53 72 F9 20         [ 2] 1031 	addw	y, (0x20, sp)
      009C56 90 FE            [ 2] 1032 	ldw	y, (y)
      009C58 FF               [ 2] 1033 	ldw	(x), y
                                   1034 ;	./../../mib/stm8s_mib_debug_cmd.c: 386: mib_printf("%02x ", p_data[i * 2]);
      009C59 7B 27            [ 1] 1035 	ld	a, (0x27, sp)
      009C5B 48               [ 1] 1036 	sll	a
      009C5C 6B 1F            [ 1] 1037 	ld	(0x1f, sp), a
      009C5E 6B 21            [ 1] 1038 	ld	(0x21, sp), a
      009C60 49               [ 1] 1039 	rlc	a
      009C61 4F               [ 1] 1040 	clr	a
      009C62 A2 00            [ 1] 1041 	sbc	a, #0x00
      009C64 6B 20            [ 1] 1042 	ld	(0x20, sp), a
      009C66 96               [ 1] 1043 	ldw	x, sp
      009C67 5C               [ 1] 1044 	incw	x
      009C68 72 FB 20         [ 2] 1045 	addw	x, (0x20, sp)
      009C6B F6               [ 1] 1046 	ld	a, (x)
      009C6C 5F               [ 1] 1047 	clrw	x
      009C6D 97               [ 1] 1048 	ld	xl, a
      009C6E 89               [ 2] 1049 	pushw	x
      009C6F 4B 96            [ 1] 1050 	push	#<(___str_5+0)
      009C71 4B 83            [ 1] 1051 	push	#((___str_5+0) >> 8)
      009C73 CD 96 77         [ 4] 1052 	call	_mib_printf
      009C76 5B 04            [ 2] 1053 	addw	sp, #4
                                   1054 ;	./../../mib/stm8s_mib_debug_cmd.c: 387: mib_printf("%02x ", p_data[i * 2 + 1]);
      009C78 7B 1F            [ 1] 1055 	ld	a, (0x1f, sp)
      009C7A 4C               [ 1] 1056 	inc	a
      009C7B 6B 21            [ 1] 1057 	ld	(0x21, sp), a
      009C7D 49               [ 1] 1058 	rlc	a
      009C7E 4F               [ 1] 1059 	clr	a
      009C7F A2 00            [ 1] 1060 	sbc	a, #0x00
      009C81 6B 20            [ 1] 1061 	ld	(0x20, sp), a
      009C83 96               [ 1] 1062 	ldw	x, sp
      009C84 5C               [ 1] 1063 	incw	x
      009C85 72 FB 20         [ 2] 1064 	addw	x, (0x20, sp)
      009C88 F6               [ 1] 1065 	ld	a, (x)
      009C89 5F               [ 1] 1066 	clrw	x
      009C8A 97               [ 1] 1067 	ld	xl, a
      009C8B 89               [ 2] 1068 	pushw	x
      009C8C 4B 96            [ 1] 1069 	push	#<(___str_5+0)
      009C8E 4B 83            [ 1] 1070 	push	#((___str_5+0) >> 8)
      009C90 CD 96 77         [ 4] 1071 	call	_mib_printf
      009C93 5B 04            [ 2] 1072 	addw	sp, #4
                                   1073 ;	./../../mib/stm8s_mib_debug_cmd.c: 383: for (i = 0; i < (remainder >> 1); i++)
      009C95 1E 26            [ 2] 1074 	ldw	x, (0x26, sp)
      009C97 5C               [ 1] 1075 	incw	x
      009C98 1F 26            [ 2] 1076 	ldw	(0x26, sp), x
      009C9A 20 9E            [ 2] 1077 	jra	00125$
      009C9C                       1078 00110$:
                                   1079 ;	./../../mib/stm8s_mib_debug_cmd.c: 389: for (i = 0; i < (16 - (remainder >> 1) * 2); i++)
      009C9C 1E 1D            [ 2] 1080 	ldw	x, (0x1d, sp)
      009C9E 58               [ 2] 1081 	sllw	x
      009C9F 1F 26            [ 2] 1082 	ldw	(0x26, sp), x
      009CA1 A6 10            [ 1] 1083 	ld	a, #0x10
      009CA3 10 27            [ 1] 1084 	sub	a, (0x27, sp)
      009CA5 6B 25            [ 1] 1085 	ld	(0x25, sp), a
      009CA7 4F               [ 1] 1086 	clr	a
      009CA8 12 26            [ 1] 1087 	sbc	a, (0x26, sp)
      009CAA 6B 24            [ 1] 1088 	ld	(0x24, sp), a
      009CAC 5F               [ 1] 1089 	clrw	x
      009CAD 1F 26            [ 2] 1090 	ldw	(0x26, sp), x
      009CAF                       1091 00128$:
      009CAF 1E 26            [ 2] 1092 	ldw	x, (0x26, sp)
      009CB1 13 24            [ 2] 1093 	cpw	x, (0x24, sp)
      009CB3 2E 10            [ 1] 1094 	jrsge	00111$
                                   1095 ;	./../../mib/stm8s_mib_debug_cmd.c: 391: mib_printf("   ");
      009CB5 4B AD            [ 1] 1096 	push	#<(___str_10+0)
      009CB7 4B 83            [ 1] 1097 	push	#((___str_10+0) >> 8)
      009CB9 CD 96 77         [ 4] 1098 	call	_mib_printf
      009CBC 5B 02            [ 2] 1099 	addw	sp, #2
                                   1100 ;	./../../mib/stm8s_mib_debug_cmd.c: 389: for (i = 0; i < (16 - (remainder >> 1) * 2); i++)
      009CBE 1E 26            [ 2] 1101 	ldw	x, (0x26, sp)
      009CC0 5C               [ 1] 1102 	incw	x
      009CC1 1F 26            [ 2] 1103 	ldw	(0x26, sp), x
      009CC3 20 EA            [ 2] 1104 	jra	00128$
      009CC5                       1105 00111$:
                                   1106 ;	./../../mib/stm8s_mib_debug_cmd.c: 393: mib_printf(" ");
      009CC5 4B 9C            [ 1] 1107 	push	#<(___str_6+0)
      009CC7 4B 83            [ 1] 1108 	push	#((___str_6+0) >> 8)
      009CC9 CD 96 77         [ 4] 1109 	call	_mib_printf
      009CCC 5B 02            [ 2] 1110 	addw	sp, #2
                                   1111 ;	./../../mib/stm8s_mib_debug_cmd.c: 394: for (i = 0; i < remainder; i++)
      009CCE 5F               [ 1] 1112 	clrw	x
      009CCF 1F 26            [ 2] 1113 	ldw	(0x26, sp), x
      009CD1                       1114 00131$:
      009CD1 1E 26            [ 2] 1115 	ldw	x, (0x26, sp)
      009CD3 13 19            [ 2] 1116 	cpw	x, (0x19, sp)
      009CD5 2E 2C            [ 1] 1117 	jrsge	00116$
                                   1118 ;	./../../mib/stm8s_mib_debug_cmd.c: 396: c = p_data[i];
      009CD7 96               [ 1] 1119 	ldw	x, sp
      009CD8 5C               [ 1] 1120 	incw	x
      009CD9 72 FB 26         [ 2] 1121 	addw	x, (0x26, sp)
      009CDC F6               [ 1] 1122 	ld	a, (x)
                                   1123 ;	./../../mib/stm8s_mib_debug_cmd.c: 397: if (c >= 32 && c <= 125)
      009CDD A1 20            [ 1] 1124 	cp	a, #0x20
      009CDF 25 12            [ 1] 1125 	jrc	00113$
      009CE1 A1 7D            [ 1] 1126 	cp	a, #0x7d
      009CE3 22 0E            [ 1] 1127 	jrugt	00113$
                                   1128 ;	./../../mib/stm8s_mib_debug_cmd.c: 398: mib_printf("%c", c);
      009CE5 5F               [ 1] 1129 	clrw	x
      009CE6 97               [ 1] 1130 	ld	xl, a
      009CE7 89               [ 2] 1131 	pushw	x
      009CE8 4B 9E            [ 1] 1132 	push	#<(___str_7+0)
      009CEA 4B 83            [ 1] 1133 	push	#((___str_7+0) >> 8)
      009CEC CD 96 77         [ 4] 1134 	call	_mib_printf
      009CEF 5B 04            [ 2] 1135 	addw	sp, #4
      009CF1 20 09            [ 2] 1136 	jra	00132$
      009CF3                       1137 00113$:
                                   1138 ;	./../../mib/stm8s_mib_debug_cmd.c: 400: mib_printf(".");
      009CF3 4B A1            [ 1] 1139 	push	#<(___str_8+0)
      009CF5 4B 83            [ 1] 1140 	push	#((___str_8+0) >> 8)
      009CF7 CD 96 77         [ 4] 1141 	call	_mib_printf
      009CFA 5B 02            [ 2] 1142 	addw	sp, #2
      009CFC                       1143 00132$:
                                   1144 ;	./../../mib/stm8s_mib_debug_cmd.c: 394: for (i = 0; i < remainder; i++)
      009CFC 1E 26            [ 2] 1145 	ldw	x, (0x26, sp)
      009CFE 5C               [ 1] 1146 	incw	x
      009CFF 1F 26            [ 2] 1147 	ldw	(0x26, sp), x
      009D01 20 CE            [ 2] 1148 	jra	00131$
      009D03                       1149 00116$:
                                   1150 ;	./../../mib/stm8s_mib_debug_cmd.c: 402: for (i = 0; i < (16 - remainder); i++)
      009D03 A6 10            [ 1] 1151 	ld	a, #0x10
      009D05 10 1A            [ 1] 1152 	sub	a, (0x1a, sp)
      009D07 6B 25            [ 1] 1153 	ld	(0x25, sp), a
      009D09 4F               [ 1] 1154 	clr	a
      009D0A 12 19            [ 1] 1155 	sbc	a, (0x19, sp)
      009D0C 6B 24            [ 1] 1156 	ld	(0x24, sp), a
      009D0E 5F               [ 1] 1157 	clrw	x
      009D0F 1F 26            [ 2] 1158 	ldw	(0x26, sp), x
      009D11                       1159 00134$:
      009D11 1E 26            [ 2] 1160 	ldw	x, (0x26, sp)
      009D13 13 24            [ 2] 1161 	cpw	x, (0x24, sp)
      009D15 2E 10            [ 1] 1162 	jrsge	00117$
                                   1163 ;	./../../mib/stm8s_mib_debug_cmd.c: 404: mib_printf(" ");
      009D17 4B 9C            [ 1] 1164 	push	#<(___str_6+0)
      009D19 4B 83            [ 1] 1165 	push	#((___str_6+0) >> 8)
      009D1B CD 96 77         [ 4] 1166 	call	_mib_printf
      009D1E 5B 02            [ 2] 1167 	addw	sp, #2
                                   1168 ;	./../../mib/stm8s_mib_debug_cmd.c: 402: for (i = 0; i < (16 - remainder); i++)
      009D20 1E 26            [ 2] 1169 	ldw	x, (0x26, sp)
      009D22 5C               [ 1] 1170 	incw	x
      009D23 1F 26            [ 2] 1171 	ldw	(0x26, sp), x
      009D25 20 EA            [ 2] 1172 	jra	00134$
      009D27                       1173 00117$:
                                   1174 ;	./../../mib/stm8s_mib_debug_cmd.c: 407: mib_printf("\r\n");
      009D27 4B 36            [ 1] 1175 	push	#<(___str_0+0)
      009D29 4B 83            [ 1] 1176 	push	#((___str_0+0) >> 8)
      009D2B CD 96 77         [ 4] 1177 	call	_mib_printf
      009D2E 5B 02            [ 2] 1178 	addw	sp, #2
      009D30                       1179 00119$:
                                   1180 ;	./../../mib/stm8s_mib_debug_cmd.c: 409: return;
                                   1181 ;	./../../mib/stm8s_mib_debug_cmd.c: 410: } // HexDump.
      009D30 1E 28            [ 2] 1182 	ldw	x, (40, sp)
      009D32 5B 31            [ 2] 1183 	addw	sp, #49
      009D34 FC               [ 2] 1184 	jp	(x)
                                   1185 ;	./../../mib/stm8s_mib_debug_cmd.c: 419: int DoPrintHelp(int argc, char **argv)
                                   1186 ;	-----------------------------------------
                                   1187 ;	 function DoPrintHelp
                                   1188 ;	-----------------------------------------
      009D35                       1189 _DoPrintHelp:
      009D35 52 02            [ 2] 1190 	sub	sp, #2
                                   1191 ;	./../../mib/stm8s_mib_debug_cmd.c: 423: if (argc == 1)
      009D37 5A               [ 2] 1192 	decw	x
      009D38 26 39            [ 1] 1193 	jrne	00105$
                                   1194 ;	./../../mib/stm8s_mib_debug_cmd.c: 425: mib_printf("*******\r\n");
      009D3A 4B B1            [ 1] 1195 	push	#<(___str_11+0)
      009D3C 4B 83            [ 1] 1196 	push	#((___str_11+0) >> 8)
      009D3E CD 96 77         [ 4] 1197 	call	_mib_printf
      009D41 5B 02            [ 2] 1198 	addw	sp, #2
                                   1199 ;	./../../mib/stm8s_mib_debug_cmd.c: 426: mib_printf("  help  Help for commands.\r\n");
      009D43 4B BB            [ 1] 1200 	push	#<(___str_12+0)
      009D45 4B 83            [ 1] 1201 	push	#((___str_12+0) >> 8)
      009D47 CD 96 77         [ 4] 1202 	call	_mib_printf
      009D4A 5B 02            [ 2] 1203 	addw	sp, #2
                                   1204 ;	./../../mib/stm8s_mib_debug_cmd.c: 428: for (cptr = cmdTbl; cptr->cmd; cptr++)
      009D4C AE 01 5E         [ 2] 1205 	ldw	x, #(_cmdTbl+0)
      009D4F 1F 01            [ 2] 1206 	ldw	(0x01, sp), x
      009D51                       1207 00108$:
      009D51 1E 01            [ 2] 1208 	ldw	x, (0x01, sp)
      009D53 FE               [ 2] 1209 	ldw	x, (x)
      009D54 27 12            [ 1] 1210 	jreq	00103$
                                   1211 ;	./../../mib/stm8s_mib_debug_cmd.c: 430: if (cptr->usage)
      009D56 1E 01            [ 2] 1212 	ldw	x, (0x01, sp)
      009D58 EE 04            [ 2] 1213 	ldw	x, (0x4, x)
      009D5A 27 03            [ 1] 1214 	jreq	00109$
                                   1215 ;	./../../mib/stm8s_mib_debug_cmd.c: 431: MibWriteDebugString(cptr->usage);
      009D5C CD 8C 65         [ 4] 1216 	call	_MibWriteDebugString
      009D5F                       1217 00109$:
                                   1218 ;	./../../mib/stm8s_mib_debug_cmd.c: 428: for (cptr = cmdTbl; cptr->cmd; cptr++)
      009D5F 1E 01            [ 2] 1219 	ldw	x, (0x01, sp)
      009D61 1C 00 06         [ 2] 1220 	addw	x, #0x0006
      009D64 1F 01            [ 2] 1221 	ldw	(0x01, sp), x
      009D66 20 E9            [ 2] 1222 	jra	00108$
      009D68                       1223 00103$:
                                   1224 ;	./../../mib/stm8s_mib_debug_cmd.c: 433: mib_printf("*******\r\n");
      009D68 4B B1            [ 1] 1225 	push	#<(___str_11+0)
      009D6A 4B 83            [ 1] 1226 	push	#((___str_11+0) >> 8)
      009D6C CD 96 77         [ 4] 1227 	call	_mib_printf
      009D6F 5B 02            [ 2] 1228 	addw	sp, #2
      009D71 20 1F            [ 2] 1229 	jra	00106$
      009D73                       1230 00105$:
                                   1231 ;	./../../mib/stm8s_mib_debug_cmd.c: 437: mib_printf("\tUnknown command : ");
      009D73 4B D8            [ 1] 1232 	push	#<(___str_13+0)
      009D75 4B 83            [ 1] 1233 	push	#((___str_13+0) >> 8)
      009D77 CD 96 77         [ 4] 1234 	call	_mib_printf
      009D7A 5B 02            [ 2] 1235 	addw	sp, #2
                                   1236 ;	./../../mib/stm8s_mib_debug_cmd.c: 438: mib_printf("%s", argv[0]);
      009D7C 1E 05            [ 2] 1237 	ldw	x, (0x05, sp)
      009D7E FE               [ 2] 1238 	ldw	x, (x)
      009D7F 89               [ 2] 1239 	pushw	x
      009D80 4B EC            [ 1] 1240 	push	#<(___str_14+0)
      009D82 4B 83            [ 1] 1241 	push	#((___str_14+0) >> 8)
      009D84 CD 96 77         [ 4] 1242 	call	_mib_printf
      009D87 5B 04            [ 2] 1243 	addw	sp, #4
                                   1244 ;	./../../mib/stm8s_mib_debug_cmd.c: 439: mib_printf("\r\n");
      009D89 4B 36            [ 1] 1245 	push	#<(___str_0+0)
      009D8B 4B 83            [ 1] 1246 	push	#((___str_0+0) >> 8)
      009D8D CD 96 77         [ 4] 1247 	call	_mib_printf
      009D90 5B 02            [ 2] 1248 	addw	sp, #2
      009D92                       1249 00106$:
                                   1250 ;	./../../mib/stm8s_mib_debug_cmd.c: 441: return TRUE;
      009D92 5F               [ 1] 1251 	clrw	x
      009D93 5C               [ 1] 1252 	incw	x
                                   1253 ;	./../../mib/stm8s_mib_debug_cmd.c: 442: }
      009D94 5B 02            [ 2] 1254 	addw	sp, #2
      009D96 90 85            [ 2] 1255 	popw	y
      009D98 5B 02            [ 2] 1256 	addw	sp, #2
      009D9A 90 FC            [ 2] 1257 	jp	(y)
                                   1258 ;	./../../mib/stm8s_mib_debug_cmd.c: 452: int getdec(uint8_t **ptr)
                                   1259 ;	-----------------------------------------
                                   1260 ;	 function getdec
                                   1261 ;	-----------------------------------------
      009D9C                       1262 _getdec:
      009D9C 52 06            [ 2] 1263 	sub	sp, #6
                                   1264 ;	./../../mib/stm8s_mib_debug_cmd.c: 454: uint8_t *p = *ptr;
      009D9E 1F 05            [ 2] 1265 	ldw	(0x05, sp), x
      009DA0 FE               [ 2] 1266 	ldw	x, (x)
      009DA1 1F 01            [ 2] 1267 	ldw	(0x01, sp), x
                                   1268 ;	./../../mib/stm8s_mib_debug_cmd.c: 455: int ret = 0;
      009DA3 5F               [ 1] 1269 	clrw	x
      009DA4 1F 03            [ 2] 1270 	ldw	(0x03, sp), x
                                   1271 ;	./../../mib/stm8s_mib_debug_cmd.c: 456: if ((*p < '0') || (*p > '9'))
      009DA6 1E 01            [ 2] 1272 	ldw	x, (0x01, sp)
      009DA8 F6               [ 1] 1273 	ld	a, (x)
      009DA9 A1 30            [ 1] 1274 	cp	a, #0x30
      009DAB 25 04            [ 1] 1275 	jrc	00101$
      009DAD A1 39            [ 1] 1276 	cp	a, #0x39
      009DAF 23 04            [ 2] 1277 	jrule	00113$
      009DB1                       1278 00101$:
                                   1279 ;	./../../mib/stm8s_mib_debug_cmd.c: 457: return (-1);
      009DB1 5F               [ 1] 1280 	clrw	x
      009DB2 5A               [ 2] 1281 	decw	x
      009DB3 20 29            [ 2] 1282 	jra	00108$
                                   1283 ;	./../../mib/stm8s_mib_debug_cmd.c: 458: while ((*p >= '0') && (*p <= '9'))
      009DB5                       1284 00113$:
      009DB5 16 01            [ 2] 1285 	ldw	y, (0x01, sp)
      009DB7                       1286 00105$:
      009DB7 90 F6            [ 1] 1287 	ld	a, (y)
      009DB9 A1 30            [ 1] 1288 	cp	a, #0x30
      009DBB 25 1C            [ 1] 1289 	jrc	00107$
      009DBD A1 39            [ 1] 1290 	cp	a, #0x39
      009DBF 22 18            [ 1] 1291 	jrugt	00107$
                                   1292 ;	./../../mib/stm8s_mib_debug_cmd.c: 460: ret = ret * 10 + (int)(*p - '0');
      009DC1 1E 03            [ 2] 1293 	ldw	x, (0x03, sp)
      009DC3 58               [ 2] 1294 	sllw	x
      009DC4 58               [ 2] 1295 	sllw	x
      009DC5 72 FB 03         [ 2] 1296 	addw	x, (0x03, sp)
      009DC8 58               [ 2] 1297 	sllw	x
      009DC9 1F 03            [ 2] 1298 	ldw	(0x03, sp), x
      009DCB 5F               [ 1] 1299 	clrw	x
      009DCC 97               [ 1] 1300 	ld	xl, a
      009DCD 1D 00 30         [ 2] 1301 	subw	x, #0x0030
      009DD0 72 FB 03         [ 2] 1302 	addw	x, (0x03, sp)
      009DD3 1F 03            [ 2] 1303 	ldw	(0x03, sp), x
                                   1304 ;	./../../mib/stm8s_mib_debug_cmd.c: 461: p++;
      009DD5 90 5C            [ 1] 1305 	incw	y
      009DD7 20 DE            [ 2] 1306 	jra	00105$
      009DD9                       1307 00107$:
                                   1308 ;	./../../mib/stm8s_mib_debug_cmd.c: 463: *ptr = p;
      009DD9 1E 05            [ 2] 1309 	ldw	x, (0x05, sp)
      009DDB FF               [ 2] 1310 	ldw	(x), y
                                   1311 ;	./../../mib/stm8s_mib_debug_cmd.c: 464: return (ret);
      009DDC 1E 03            [ 2] 1312 	ldw	x, (0x03, sp)
      009DDE                       1313 00108$:
                                   1314 ;	./../../mib/stm8s_mib_debug_cmd.c: 465: }
      009DDE 5B 06            [ 2] 1315 	addw	sp, #6
      009DE0 81               [ 4] 1316 	ret
                                   1317 	.area CODE
                                   1318 	.area CONST
                                   1319 	.area CONST
      008336                       1320 ___str_0:
      008336 0D                    1321 	.db 0x0d
      008337 0A                    1322 	.db 0x0a
      008338 00                    1323 	.db 0x00
                                   1324 	.area CODE
                                   1325 	.area CONST
      008339                       1326 ___str_1:
      008339 08                    1327 	.db 0x08
      00833A 20                    1328 	.ascii " "
      00833B 08                    1329 	.db 0x08
      00833C 00                    1330 	.db 0x00
                                   1331 	.area CODE
                                   1332 	.area CONST
      00833D                       1333 ___str_2:
      00833D 30 78                 1334 	.ascii "0x"
      00833F 00                    1335 	.db 0x00
                                   1336 	.area CODE
                                   1337 	.area CONST
      008340                       1338 ___str_3:
      008340 61 64 64 72 65 73 73  1339 	.ascii "address     Hex Value                                       "
             20 20 20 20 20 48 65
             78 20 56 61 6C 75 65
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      00837C 20 41 73 63 69 69 20  1340 	.ascii " Ascii value"
             76 61 6C 75 65
      008388 0D                    1341 	.db 0x0d
      008389 0A                    1342 	.db 0x0a
      00838A 00                    1343 	.db 0x00
                                   1344 	.area CODE
                                   1345 	.area CONST
      00838B                       1346 ___str_4:
      00838B 30 78 25 30 38 6C 78  1347 	.ascii "0x%08lx : "
             20 3A 20
      008395 00                    1348 	.db 0x00
                                   1349 	.area CODE
                                   1350 	.area CONST
      008396                       1351 ___str_5:
      008396 25 30 32 78 20        1352 	.ascii "%02x "
      00839B 00                    1353 	.db 0x00
                                   1354 	.area CODE
                                   1355 	.area CONST
      00839C                       1356 ___str_6:
      00839C 20                    1357 	.ascii " "
      00839D 00                    1358 	.db 0x00
                                   1359 	.area CODE
                                   1360 	.area CONST
      00839E                       1361 ___str_7:
      00839E 25 63                 1362 	.ascii "%c"
      0083A0 00                    1363 	.db 0x00
                                   1364 	.area CODE
                                   1365 	.area CONST
      0083A1                       1366 ___str_8:
      0083A1 2E                    1367 	.ascii "."
      0083A2 00                    1368 	.db 0x00
                                   1369 	.area CODE
                                   1370 	.area CONST
      0083A3                       1371 ___str_9:
      0083A3 30 78 25 30 38 6C 78  1372 	.ascii "0x%08lx  "
             20 20
      0083AC 00                    1373 	.db 0x00
                                   1374 	.area CODE
                                   1375 	.area CONST
      0083AD                       1376 ___str_10:
      0083AD 20 20 20              1377 	.ascii "   "
      0083B0 00                    1378 	.db 0x00
                                   1379 	.area CODE
                                   1380 	.area CONST
      0083B1                       1381 ___str_11:
      0083B1 2A 2A 2A 2A 2A 2A 2A  1382 	.ascii "*******"
      0083B8 0D                    1383 	.db 0x0d
      0083B9 0A                    1384 	.db 0x0a
      0083BA 00                    1385 	.db 0x00
                                   1386 	.area CODE
                                   1387 	.area CONST
      0083BB                       1388 ___str_12:
      0083BB 20 20 68 65 6C 70 20  1389 	.ascii "  help  Help for commands."
             20 48 65 6C 70 20 66
             6F 72 20 63 6F 6D 6D
             61 6E 64 73 2E
      0083D5 0D                    1390 	.db 0x0d
      0083D6 0A                    1391 	.db 0x0a
      0083D7 00                    1392 	.db 0x00
                                   1393 	.area CODE
                                   1394 	.area CONST
      0083D8                       1395 ___str_13:
      0083D8 09                    1396 	.db 0x09
      0083D9 55 6E 6B 6E 6F 77 6E  1397 	.ascii "Unknown command : "
             20 63 6F 6D 6D 61 6E
             64 20 3A 20
      0083EB 00                    1398 	.db 0x00
                                   1399 	.area CODE
                                   1400 	.area CONST
      0083EC                       1401 ___str_14:
      0083EC 25 73                 1402 	.ascii "%s"
      0083EE 00                    1403 	.db 0x00
                                   1404 	.area CODE
                                   1405 	.area INITIALIZER
      0088FC                       1406 __xinit__cmdTbl:
      0088FC 00 00                 1407 	.dw #0x0000
      0088FE 00 00                 1408 	.dw #0x0000
      008900 00 00                 1409 	.dw #0x0000
      008902 00 00                 1410 	.dw #0x0000
      008904 00 00                 1411 	.dw #0x0000
      008906 00 00                 1412 	.dw #0x0000
      008908 00 00                 1413 	.dw #0x0000
      00890A 00 00                 1414 	.dw #0x0000
      00890C 00 00                 1415 	.dw #0x0000
      00890E 00 00                 1416 	.dw #0x0000
      008910 00 00                 1417 	.dw #0x0000
      008912 00 00                 1418 	.dw #0x0000
      008914 00 00                 1419 	.dw #0x0000
      008916 00 00                 1420 	.dw #0x0000
      008918 00 00                 1421 	.dw #0x0000
      00891A 00 00                 1422 	.dw #0x0000
      00891C 00 00                 1423 	.dw #0x0000
      00891E 00 00                 1424 	.dw #0x0000
                                   1425 	.area CABS (ABS)
