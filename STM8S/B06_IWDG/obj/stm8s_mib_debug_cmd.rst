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
      00016D                         39 _cmdTbl::
      00016D                         40 	.ds 36
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
      009733                         74 _GetCommand:
      009733 52 10            [ 2]   75 	sub	sp, #16
      009735 1F 0D            [ 2]   76 	ldw	(0x0d, sp), x
                                     77 ;	./../../mib/stm8s_mib_debug_cmd.c: 88: uint16_t vwIndex, rdCnt, rdMax = len - 1;
      009737 1E 13            [ 2]   78 	ldw	x, (0x13, sp)
      009739 5A               [ 2]   79 	decw	x
      00973A 1F 01            [ 2]   80 	ldw	(0x01, sp), x
                                     81 ;	./../../mib/stm8s_mib_debug_cmd.c: 91: endTime = MibGetSecs() + (uint16_t)timeout;
      00973C CD 97 24         [ 4]   82 	call	_MibGetSecs
      00973F 7B 15            [ 1]   83 	ld	a, (0x15, sp)
      009741 6B 10            [ 1]   84 	ld	(0x10, sp), a
      009743 0F 0F            [ 1]   85 	clr	(0x0f, sp)
      009745 72 FB 0F         [ 2]   86 	addw	x, (0x0f, sp)
      009748 1F 03            [ 2]   87 	ldw	(0x03, sp), x
                                     88 ;	./../../mib/stm8s_mib_debug_cmd.c: 92: cmd_list.cur = cmd_list.next;
      00974A C6 00 4A         [ 1]   89 	ld	a, _cmd_list+1
      00974D C7 00 49         [ 1]   90 	ld	_cmd_list+0, a
                                     91 ;	./../../mib/stm8s_mib_debug_cmd.c: 93: for (rdCnt = 0, vwIndex = 0; rdCnt <= rdMax;)
      009750 5F               [ 1]   92 	clrw	x
      009751 1F 0F            [ 2]   93 	ldw	(0x0f, sp), x
      009753                         94 00149$:
      009753 1E 0F            [ 2]   95 	ldw	x, (0x0f, sp)
      009755 13 01            [ 2]   96 	cpw	x, (0x01, sp)
      009757 23 03            [ 2]   97 	jrule	00243$
      009759 CC 99 26         [ 2]   98 	jp	00147$
      00975C                         99 00243$:
                                    100 ;	./../../mib/stm8s_mib_debug_cmd.c: 96: while (1)
      00975C                        101 00106$:
                                    102 ;	./../../mib/stm8s_mib_debug_cmd.c: 98: vwCh = MibReadDebugByte();
      00975C CD 8C C3         [ 4]  103 	call	_MibReadDebugByte
                                    104 ;	./../../mib/stm8s_mib_debug_cmd.c: 99: if (vwCh != 0xffff)	break;
      00975F 1F 05            [ 2]  105 	ldw	(0x05, sp), x
      009761 1F 07            [ 2]  106 	ldw	(0x07, sp), x
                                    107 ;	./../../mib/stm8s_mib_debug_cmd.c: 102: cmd[rdCnt++] = '\0';
      009763 1E 0F            [ 2]  108 	ldw	x, (0x0f, sp)
      009765 5C               [ 1]  109 	incw	x
      009766 1F 09            [ 2]  110 	ldw	(0x09, sp), x
                                    111 ;	./../../mib/stm8s_mib_debug_cmd.c: 104: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      009768 16 0D            [ 2]  112 	ldw	y, (0x0d, sp)
      00976A 17 0B            [ 2]  113 	ldw	(0x0b, sp), y
                                    114 ;	./../../mib/stm8s_mib_debug_cmd.c: 99: if (vwCh != 0xffff)	break;
      00976C 1E 07            [ 2]  115 	ldw	x, (0x07, sp)
      00976E 5C               [ 1]  116 	incw	x
      00976F 26 55            [ 1]  117 	jrne	00107$
                                    118 ;	./../../mib/stm8s_mib_debug_cmd.c: 100: if (MibGetSecs() > endTime)
      009771 CD 97 24         [ 4]  119 	call	_MibGetSecs
      009774 13 03            [ 2]  120 	cpw	x, (0x03, sp)
      009776 23 E4            [ 2]  121 	jrule	00106$
                                    122 ;	./../../mib/stm8s_mib_debug_cmd.c: 102: cmd[rdCnt++] = '\0';
      009778 1E 0F            [ 2]  123 	ldw	x, (0x0f, sp)
      00977A 16 09            [ 2]  124 	ldw	y, (0x09, sp)
      00977C 17 0F            [ 2]  125 	ldw	(0x0f, sp), y
      00977E 72 FB 0D         [ 2]  126 	addw	x, (0x0d, sp)
      009781 7F               [ 1]  127 	clr	(x)
                                    128 ;	./../../mib/stm8s_mib_debug_cmd.c: 103: memset(cmd_list.buf[cmd_list.next], 0, CMD_CHAR_MAX);
      009782 C6 00 4A         [ 1]  129 	ld	a, _cmd_list+1
      009785 97               [ 1]  130 	ld	xl, a
      009786 A6 40            [ 1]  131 	ld	a, #0x40
      009788 42               [ 4]  132 	mul	x, a
      009789 1C 00 4B         [ 2]  133 	addw	x, #(_cmd_list+2)
      00978C 4B 40            [ 1]  134 	push	#0x40
      00978E 4B 00            [ 1]  135 	push	#0x00
      009790 4B 00            [ 1]  136 	push	#0x00
      009792 4B 00            [ 1]  137 	push	#0x00
      009794 CD A9 33         [ 4]  138 	call	_memset
                                    139 ;	./../../mib/stm8s_mib_debug_cmd.c: 104: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      009797 1E 0D            [ 2]  140 	ldw	x, (0x0d, sp)
      009799 CD A9 57         [ 4]  141 	call	_strlen
      00979C 51               [ 1]  142 	exgw	x, y
      00979D C6 00 4A         [ 1]  143 	ld	a, _cmd_list+1
      0097A0 97               [ 1]  144 	ld	xl, a
      0097A1 A6 40            [ 1]  145 	ld	a, #0x40
      0097A3 42               [ 4]  146 	mul	x, a
      0097A4 1C 00 4B         [ 2]  147 	addw	x, #(_cmd_list+2)
      0097A7 90 89            [ 2]  148 	pushw	y
      0097A9 16 0D            [ 2]  149 	ldw	y, (0x0d, sp)
      0097AB 90 89            [ 2]  150 	pushw	y
      0097AD CD A8 E0         [ 4]  151 	call	___memcpy
                                    152 ;	./../../mib/stm8s_mib_debug_cmd.c: 105: cmd_list.next = (cmd_list.next + 1) % CMD_LINE_MAX;
      0097B0 C6 00 4A         [ 1]  153 	ld	a, _cmd_list+1
      0097B3 5F               [ 1]  154 	clrw	x
      0097B4 97               [ 1]  155 	ld	xl, a
      0097B5 5C               [ 1]  156 	incw	x
      0097B6 4B 04            [ 1]  157 	push	#0x04
      0097B8 4B 00            [ 1]  158 	push	#0x00
      0097BA CD A9 A1         [ 4]  159 	call	__modsint
      0097BD 9F               [ 1]  160 	ld	a, xl
      0097BE C7 00 4A         [ 1]  161 	ld	_cmd_list+1, a
                                    162 ;	./../../mib/stm8s_mib_debug_cmd.c: 106: return rdCnt;
      0097C1 1E 0F            [ 2]  163 	ldw	x, (0x0f, sp)
      0097C3 CC 99 28         [ 2]  164 	jp	00151$
      0097C6                        165 00107$:
                                    166 ;	./../../mib/stm8s_mib_debug_cmd.c: 112: if ((vwCh == '@') || (vwCh == '\n') || (vwCh == 0x03))
      0097C6 1E 07            [ 2]  167 	ldw	x, (0x07, sp)
      0097C8 A3 00 40         [ 2]  168 	cpw	x, #0x0040
      0097CB 27 0E            [ 1]  169 	jreq	00142$
      0097CD 1E 07            [ 2]  170 	ldw	x, (0x07, sp)
      0097CF A3 00 0A         [ 2]  171 	cpw	x, #0x000a
      0097D2 27 07            [ 1]  172 	jreq	00142$
      0097D4 1E 07            [ 2]  173 	ldw	x, (0x07, sp)
      0097D6 A3 00 03         [ 2]  174 	cpw	x, #0x0003
      0097D9 26 57            [ 1]  175 	jrne	00143$
      0097DB                        176 00142$:
                                    177 ;	./../../mib/stm8s_mib_debug_cmd.c: 114: cmd[rdCnt++] = '\0';
      0097DB 1E 0F            [ 2]  178 	ldw	x, (0x0f, sp)
      0097DD 16 09            [ 2]  179 	ldw	y, (0x09, sp)
      0097DF 17 0F            [ 2]  180 	ldw	(0x0f, sp), y
      0097E1 72 FB 0D         [ 2]  181 	addw	x, (0x0d, sp)
      0097E4 7F               [ 1]  182 	clr	(x)
                                    183 ;	./../../mib/stm8s_mib_debug_cmd.c: 115: memset(cmd_list.buf[cmd_list.next], 0, CMD_CHAR_MAX);
      0097E5 C6 00 4A         [ 1]  184 	ld	a, _cmd_list+1
      0097E8 97               [ 1]  185 	ld	xl, a
      0097E9 A6 40            [ 1]  186 	ld	a, #0x40
      0097EB 42               [ 4]  187 	mul	x, a
      0097EC 1C 00 4B         [ 2]  188 	addw	x, #(_cmd_list+2)
      0097EF 4B 40            [ 1]  189 	push	#0x40
      0097F1 4B 00            [ 1]  190 	push	#0x00
      0097F3 4B 00            [ 1]  191 	push	#0x00
      0097F5 4B 00            [ 1]  192 	push	#0x00
      0097F7 CD A9 33         [ 4]  193 	call	_memset
                                    194 ;	./../../mib/stm8s_mib_debug_cmd.c: 116: memcpy(cmd_list.buf[cmd_list.next], cmd, strlen(cmd));
      0097FA 1E 0D            [ 2]  195 	ldw	x, (0x0d, sp)
      0097FC CD A9 57         [ 4]  196 	call	_strlen
      0097FF 51               [ 1]  197 	exgw	x, y
      009800 C6 00 4A         [ 1]  198 	ld	a, _cmd_list+1
      009803 97               [ 1]  199 	ld	xl, a
      009804 A6 40            [ 1]  200 	ld	a, #0x40
      009806 42               [ 4]  201 	mul	x, a
      009807 1C 00 4B         [ 2]  202 	addw	x, #(_cmd_list+2)
      00980A 90 89            [ 2]  203 	pushw	y
      00980C 16 0D            [ 2]  204 	ldw	y, (0x0d, sp)
      00980E 90 89            [ 2]  205 	pushw	y
      009810 CD A8 E0         [ 4]  206 	call	___memcpy
                                    207 ;	./../../mib/stm8s_mib_debug_cmd.c: 117: cmd_list.next = (cmd_list.next + 1) % CMD_LINE_MAX;
      009813 C6 00 4A         [ 1]  208 	ld	a, _cmd_list+1
      009816 5F               [ 1]  209 	clrw	x
      009817 97               [ 1]  210 	ld	xl, a
      009818 5C               [ 1]  211 	incw	x
      009819 4B 04            [ 1]  212 	push	#0x04
      00981B 4B 00            [ 1]  213 	push	#0x00
      00981D CD A9 A1         [ 4]  214 	call	__modsint
      009820 9F               [ 1]  215 	ld	a, xl
      009821 C7 00 4A         [ 1]  216 	ld	_cmd_list+1, a
                                    217 ;	./../../mib/stm8s_mib_debug_cmd.c: 119: mib_printf("\r\n");
      009824 4B 44            [ 1]  218 	push	#<(___str_0+0)
      009826 4B 83            [ 1]  219 	push	#((___str_0+0) >> 8)
      009828 CD 96 B4         [ 4]  220 	call	_mib_printf
      00982B 5B 02            [ 2]  221 	addw	sp, #2
                                    222 ;	./../../mib/stm8s_mib_debug_cmd.c: 120: return rdCnt;
      00982D 1E 0F            [ 2]  223 	ldw	x, (0x0f, sp)
      00982F CC 99 28         [ 2]  224 	jp	00151$
      009832                        225 00143$:
                                    226 ;	./../../mib/stm8s_mib_debug_cmd.c: 122: else if (vwCh == '\b')
      009832 1E 07            [ 2]  227 	ldw	x, (0x07, sp)
      009834 A3 00 08         [ 2]  228 	cpw	x, #0x0008
      009837 26 18            [ 1]  229 	jrne	00140$
                                    230 ;	./../../mib/stm8s_mib_debug_cmd.c: 124: if (rdCnt > 0)
      009839 1E 0F            [ 2]  231 	ldw	x, (0x0f, sp)
      00983B 26 03            [ 1]  232 	jrne	00260$
      00983D CC 97 53         [ 2]  233 	jp	00149$
      009840                        234 00260$:
                                    235 ;	./../../mib/stm8s_mib_debug_cmd.c: 126: rdCnt--;
      009840 1E 0F            [ 2]  236 	ldw	x, (0x0f, sp)
      009842 5A               [ 2]  237 	decw	x
      009843 1F 0F            [ 2]  238 	ldw	(0x0f, sp), x
                                    239 ;	./../../mib/stm8s_mib_debug_cmd.c: 128: mib_printf("\b \b");
      009845 4B 47            [ 1]  240 	push	#<(___str_1+0)
      009847 4B 83            [ 1]  241 	push	#((___str_1+0) >> 8)
      009849 CD 96 B4         [ 4]  242 	call	_mib_printf
      00984C 5B 02            [ 2]  243 	addw	sp, #2
      00984E CC 97 53         [ 2]  244 	jp	00149$
      009851                        245 00140$:
                                    246 ;	./../../mib/stm8s_mib_debug_cmd.c: 131: else if (vwCh == 0x1b)
      009851 1E 07            [ 2]  247 	ldw	x, (0x07, sp)
      009853 A3 00 1B         [ 2]  248 	cpw	x, #0x001b
      009856 27 03            [ 1]  249 	jreq	00263$
      009858 CC 99 14         [ 2]  250 	jp	00137$
      00985B                        251 00263$:
                                    252 ;	./../../mib/stm8s_mib_debug_cmd.c: 134: while (1)
      00985B                        253 00113$:
                                    254 ;	./../../mib/stm8s_mib_debug_cmd.c: 136: vwCh = MibReadDebugByte();
      00985B CD 8C C3         [ 4]  255 	call	_MibReadDebugByte
                                    256 ;	./../../mib/stm8s_mib_debug_cmd.c: 137: if (vwCh != 0xffff)
      00985E A3 FF FF         [ 2]  257 	cpw	x, #0xffff
      009861 27 F8            [ 1]  258 	jreq	00113$
                                    259 ;	./../../mib/stm8s_mib_debug_cmd.c: 140: if (vwCh == '[')
      009863 A3 00 5B         [ 2]  260 	cpw	x, #0x005b
      009866 27 03            [ 1]  261 	jreq	00269$
      009868 CC 97 53         [ 2]  262 	jp	00149$
      00986B                        263 00269$:
                                    264 ;	./../../mib/stm8s_mib_debug_cmd.c: 143: while (1)
      00986B                        265 00118$:
                                    266 ;	./../../mib/stm8s_mib_debug_cmd.c: 145: vwCh = MibReadDebugByte();
      00986B CD 8C C3         [ 4]  267 	call	_MibReadDebugByte
                                    268 ;	./../../mib/stm8s_mib_debug_cmd.c: 146: if (vwCh != 0xffff)
      00986E 1F 09            [ 2]  269 	ldw	(0x09, sp), x
      009870 5C               [ 1]  270 	incw	x
      009871 27 F8            [ 1]  271 	jreq	00118$
                                    272 ;	./../../mib/stm8s_mib_debug_cmd.c: 150: if (vwCh == 'B')
      009873 1E 09            [ 2]  273 	ldw	x, (0x09, sp)
      009875 A3 00 42         [ 2]  274 	cpw	x, #0x0042
      009878 26 48            [ 1]  275 	jrne	00132$
                                    276 ;	./../../mib/stm8s_mib_debug_cmd.c: 152: cmd_list.cur++;
      00987A C6 00 49         [ 1]  277 	ld	a, _cmd_list+0
      00987D 4C               [ 1]  278 	inc	a
      00987E C7 00 49         [ 1]  279 	ld	_cmd_list+0, a
                                    280 ;	./../../mib/stm8s_mib_debug_cmd.c: 153: if (cmd_list.cur == CMD_LINE_MAX)
      009881 A1 04            [ 1]  281 	cp	a, #0x04
      009883 26 04            [ 1]  282 	jrne	00121$
                                    283 ;	./../../mib/stm8s_mib_debug_cmd.c: 154: cmd_list.cur = 0;
      009885 35 00 00 49      [ 1]  284 	mov	_cmd_list+0, #0x00
      009889                        285 00121$:
                                    286 ;	./../../mib/stm8s_mib_debug_cmd.c: 155: rdCnt = strlen(cmd_list.buf[cmd_list.cur]);
      009889 C6 00 49         [ 1]  287 	ld	a, _cmd_list+0
      00988C 97               [ 1]  288 	ld	xl, a
      00988D A6 40            [ 1]  289 	ld	a, #0x40
      00988F 42               [ 4]  290 	mul	x, a
      009890 1C 00 4B         [ 2]  291 	addw	x, #(_cmd_list+2)
      009893 CD A9 57         [ 4]  292 	call	_strlen
                                    293 ;	./../../mib/stm8s_mib_debug_cmd.c: 156: if (rdCnt >= rdMax)
      009896 1F 0F            [ 2]  294 	ldw	(0x0f, sp), x
      009898 13 01            [ 2]  295 	cpw	x, (0x01, sp)
      00989A 25 04            [ 1]  296 	jrc	00123$
                                    297 ;	./../../mib/stm8s_mib_debug_cmd.c: 157: rdCnt = rdMax;
      00989C 16 01            [ 2]  298 	ldw	y, (0x01, sp)
      00989E 17 0F            [ 2]  299 	ldw	(0x0f, sp), y
      0098A0                        300 00123$:
                                    301 ;	./../../mib/stm8s_mib_debug_cmd.c: 158: memcpy(cmd, cmd_list.buf[cmd_list.cur], rdCnt);
      0098A0 16 0F            [ 2]  302 	ldw	y, (0x0f, sp)
      0098A2 C6 00 49         [ 1]  303 	ld	a, _cmd_list+0
      0098A5 97               [ 1]  304 	ld	xl, a
      0098A6 A6 40            [ 1]  305 	ld	a, #0x40
      0098A8 42               [ 4]  306 	mul	x, a
      0098A9 1C 00 4B         [ 2]  307 	addw	x, #(_cmd_list+2)
      0098AC 90 89            [ 2]  308 	pushw	y
      0098AE 89               [ 2]  309 	pushw	x
      0098AF 1E 0F            [ 2]  310 	ldw	x, (0x0f, sp)
      0098B1 CD A8 E0         [ 4]  311 	call	___memcpy
                                    312 ;	./../../mib/stm8s_mib_debug_cmd.c: 159: cmd[rdCnt] = 0;
      0098B4 1E 0D            [ 2]  313 	ldw	x, (0x0d, sp)
      0098B6 72 FB 0F         [ 2]  314 	addw	x, (0x0f, sp)
      0098B9 7F               [ 1]  315 	clr	(x)
                                    316 ;	./../../mib/stm8s_mib_debug_cmd.c: 161: MibWriteDebugString(cmd);
      0098BA 1E 0D            [ 2]  317 	ldw	x, (0x0d, sp)
      0098BC CD 8C A2         [ 4]  318 	call	_MibWriteDebugString
      0098BF CC 97 53         [ 2]  319 	jp	00149$
      0098C2                        320 00132$:
                                    321 ;	./../../mib/stm8s_mib_debug_cmd.c: 163: else if (vwCh == 'A')
      0098C2 1E 09            [ 2]  322 	ldw	x, (0x09, sp)
      0098C4 A3 00 41         [ 2]  323 	cpw	x, #0x0041
      0098C7 27 03            [ 1]  324 	jreq	00282$
      0098C9 CC 97 53         [ 2]  325 	jp	00149$
      0098CC                        326 00282$:
                                    327 ;	./../../mib/stm8s_mib_debug_cmd.c: 152: cmd_list.cur++;
                                    328 ;	./../../mib/stm8s_mib_debug_cmd.c: 165: if (cmd_list.cur == 0)
      0098CC C6 00 49         [ 1]  329 	ld	a, _cmd_list+0
      0098CF 26 06            [ 1]  330 	jrne	00125$
                                    331 ;	./../../mib/stm8s_mib_debug_cmd.c: 166: cmd_list.cur = CMD_LINE_MAX - 1;
      0098D1 35 03 00 49      [ 1]  332 	mov	_cmd_list+0, #0x03
      0098D5 20 04            [ 2]  333 	jra	00126$
      0098D7                        334 00125$:
                                    335 ;	./../../mib/stm8s_mib_debug_cmd.c: 168: cmd_list.cur--;
      0098D7 4A               [ 1]  336 	dec	a
      0098D8 C7 00 49         [ 1]  337 	ld	_cmd_list+0, a
      0098DB                        338 00126$:
                                    339 ;	./../../mib/stm8s_mib_debug_cmd.c: 169: rdCnt = strlen(cmd_list.buf[cmd_list.cur]);
      0098DB C6 00 49         [ 1]  340 	ld	a, _cmd_list+0
      0098DE 97               [ 1]  341 	ld	xl, a
      0098DF A6 40            [ 1]  342 	ld	a, #0x40
      0098E1 42               [ 4]  343 	mul	x, a
      0098E2 1C 00 4B         [ 2]  344 	addw	x, #(_cmd_list+2)
      0098E5 CD A9 57         [ 4]  345 	call	_strlen
                                    346 ;	./../../mib/stm8s_mib_debug_cmd.c: 170: if (rdCnt >= rdMax)
      0098E8 1F 0F            [ 2]  347 	ldw	(0x0f, sp), x
      0098EA 13 01            [ 2]  348 	cpw	x, (0x01, sp)
      0098EC 25 04            [ 1]  349 	jrc	00128$
                                    350 ;	./../../mib/stm8s_mib_debug_cmd.c: 171: rdCnt = rdMax;
      0098EE 16 01            [ 2]  351 	ldw	y, (0x01, sp)
      0098F0 17 0F            [ 2]  352 	ldw	(0x0f, sp), y
      0098F2                        353 00128$:
                                    354 ;	./../../mib/stm8s_mib_debug_cmd.c: 172: memcpy(cmd, cmd_list.buf[cmd_list.cur], rdCnt);
      0098F2 16 0F            [ 2]  355 	ldw	y, (0x0f, sp)
      0098F4 C6 00 49         [ 1]  356 	ld	a, _cmd_list+0
      0098F7 97               [ 1]  357 	ld	xl, a
      0098F8 A6 40            [ 1]  358 	ld	a, #0x40
      0098FA 42               [ 4]  359 	mul	x, a
      0098FB 1C 00 4B         [ 2]  360 	addw	x, #(_cmd_list+2)
      0098FE 90 89            [ 2]  361 	pushw	y
      009900 89               [ 2]  362 	pushw	x
      009901 1E 0F            [ 2]  363 	ldw	x, (0x0f, sp)
      009903 CD A8 E0         [ 4]  364 	call	___memcpy
                                    365 ;	./../../mib/stm8s_mib_debug_cmd.c: 173: cmd[rdCnt] = 0;
      009906 1E 0D            [ 2]  366 	ldw	x, (0x0d, sp)
      009908 72 FB 0F         [ 2]  367 	addw	x, (0x0f, sp)
      00990B 7F               [ 1]  368 	clr	(x)
                                    369 ;	./../../mib/stm8s_mib_debug_cmd.c: 175: MibWriteDebugString(cmd);
      00990C 1E 0D            [ 2]  370 	ldw	x, (0x0d, sp)
      00990E CD 8C A2         [ 4]  371 	call	_MibWriteDebugString
      009911 CC 97 53         [ 2]  372 	jp	00149$
      009914                        373 00137$:
                                    374 ;	./../../mib/stm8s_mib_debug_cmd.c: 181: cmd[rdCnt++] = vwCh;
      009914 1E 0F            [ 2]  375 	ldw	x, (0x0f, sp)
      009916 16 09            [ 2]  376 	ldw	y, (0x09, sp)
      009918 17 0F            [ 2]  377 	ldw	(0x0f, sp), y
      00991A 72 FB 0D         [ 2]  378 	addw	x, (0x0d, sp)
      00991D 7B 06            [ 1]  379 	ld	a, (0x06, sp)
      00991F F7               [ 1]  380 	ld	(x), a
                                    381 ;	./../../mib/stm8s_mib_debug_cmd.c: 183: MibWriteDebugByte(vwCh);
      009920 CD 8C 85         [ 4]  382 	call	_MibWriteDebugByte
      009923 CC 97 53         [ 2]  383 	jp	00149$
      009926                        384 00147$:
                                    385 ;	./../../mib/stm8s_mib_debug_cmd.c: 186: return (rdCnt);
      009926 1E 0F            [ 2]  386 	ldw	x, (0x0f, sp)
      009928                        387 00151$:
                                    388 ;	./../../mib/stm8s_mib_debug_cmd.c: 187: } // GetCommand.
      009928 16 11            [ 2]  389 	ldw	y, (17, sp)
      00992A 5B 15            [ 2]  390 	addw	sp, #21
      00992C 90 FC            [ 2]  391 	jp	(y)
                                    392 ;	./../../mib/stm8s_mib_debug_cmd.c: 197: int GetArgs(char *s, char **argv)
                                    393 ;	-----------------------------------------
                                    394 ;	 function GetArgs
                                    395 ;	-----------------------------------------
      00992E                        396 _GetArgs:
      00992E 52 08            [ 2]  397 	sub	sp, #8
      009930 1F 05            [ 2]  398 	ldw	(0x05, sp), x
                                    399 ;	./../../mib/stm8s_mib_debug_cmd.c: 199: int args = 0;
      009932 5F               [ 1]  400 	clrw	x
      009933 1F 01            [ 2]  401 	ldw	(0x01, sp), x
                                    402 ;	./../../mib/stm8s_mib_debug_cmd.c: 201: if (!s || *s == '\0')
      009935 1E 05            [ 2]  403 	ldw	x, (0x05, sp)
      009937 27 03            [ 1]  404 	jreq	00101$
      009939 F6               [ 1]  405 	ld	a, (x)
      00993A 26 03            [ 1]  406 	jrne	00131$
      00993C                        407 00101$:
                                    408 ;	./../../mib/stm8s_mib_debug_cmd.c: 202: return 0;
      00993C 5F               [ 1]  409 	clrw	x
      00993D 20 73            [ 2]  410 	jra	00120$
                                    411 ;	./../../mib/stm8s_mib_debug_cmd.c: 203: while (args < MAX_ARGS)
      00993F                        412 00131$:
      00993F 5F               [ 1]  413 	clrw	x
      009940 1F 07            [ 2]  414 	ldw	(0x07, sp), x
      009942                        415 00117$:
      009942 1E 07            [ 2]  416 	ldw	x, (0x07, sp)
      009944 A3 00 05         [ 2]  417 	cpw	x, #0x0005
      009947 2E 67            [ 1]  418 	jrsge	00119$
                                    419 ;	./../../mib/stm8s_mib_debug_cmd.c: 206: while ((*s == ' ') || (*s == '\t'))
      009949 1E 05            [ 2]  420 	ldw	x, (0x05, sp)
      00994B                        421 00105$:
      00994B F6               [ 1]  422 	ld	a, (x)
      00994C A1 20            [ 1]  423 	cp	a, #0x20
      00994E 27 04            [ 1]  424 	jreq	00106$
      009950 A1 09            [ 1]  425 	cp	a, #0x09
      009952 26 03            [ 1]  426 	jrne	00107$
      009954                        427 00106$:
                                    428 ;	./../../mib/stm8s_mib_debug_cmd.c: 207: s++;
      009954 5C               [ 1]  429 	incw	x
      009955 20 F4            [ 2]  430 	jra	00105$
      009957                        431 00107$:
                                    432 ;	./../../mib/stm8s_mib_debug_cmd.c: 210: if (*s == '\0')
      009957 4D               [ 1]  433 	tnz	a
      009958 26 0D            [ 1]  434 	jrne	00109$
                                    435 ;	./../../mib/stm8s_mib_debug_cmd.c: 212: argv[args] = 0;
      00995A 1E 01            [ 2]  436 	ldw	x, (0x01, sp)
      00995C 58               [ 2]  437 	sllw	x
      00995D 72 FB 0B         [ 2]  438 	addw	x, (0x0b, sp)
      009960 6F 01            [ 1]  439 	clr	(0x1, x)
      009962 7F               [ 1]  440 	clr	(x)
                                    441 ;	./../../mib/stm8s_mib_debug_cmd.c: 213: return args;
      009963 1E 01            [ 2]  442 	ldw	x, (0x01, sp)
      009965 20 4B            [ 2]  443 	jra	00120$
      009967                        444 00109$:
                                    445 ;	./../../mib/stm8s_mib_debug_cmd.c: 216: argv[args++] = s;
      009967 16 07            [ 2]  446 	ldw	y, (0x07, sp)
      009969 17 03            [ 2]  447 	ldw	(0x03, sp), y
      00996B 16 07            [ 2]  448 	ldw	y, (0x07, sp)
      00996D 90 5C            [ 1]  449 	incw	y
      00996F 17 07            [ 2]  450 	ldw	(0x07, sp), y
      009971 17 01            [ 2]  451 	ldw	(0x01, sp), y
      009973 16 03            [ 2]  452 	ldw	y, (0x03, sp)
      009975 90 58            [ 2]  453 	sllw	y
      009977 72 F9 0B         [ 2]  454 	addw	y, (0x0b, sp)
      00997A 90 FF            [ 2]  455 	ldw	(y), x
                                    456 ;	./../../mib/stm8s_mib_debug_cmd.c: 219: while (*s && (*s != ' ') && (*s != '\t'))
      00997C 1F 05            [ 2]  457 	ldw	(0x05, sp), x
      00997E                        458 00112$:
      00997E 1E 05            [ 2]  459 	ldw	x, (0x05, sp)
      009980 F6               [ 1]  460 	ld	a, (x)
                                    461 ;	./../../mib/stm8s_mib_debug_cmd.c: 220: s++;
      009981 1E 05            [ 2]  462 	ldw	x, (0x05, sp)
      009983 5C               [ 1]  463 	incw	x
      009984 1F 03            [ 2]  464 	ldw	(0x03, sp), x
                                    465 ;	./../../mib/stm8s_mib_debug_cmd.c: 219: while (*s && (*s != ' ') && (*s != '\t'))
      009986 4D               [ 1]  466 	tnz	a
      009987 27 0E            [ 1]  467 	jreq	00114$
      009989 A1 20            [ 1]  468 	cp	a, #0x20
      00998B 27 0A            [ 1]  469 	jreq	00114$
      00998D A1 09            [ 1]  470 	cp	a, #0x09
      00998F 27 06            [ 1]  471 	jreq	00114$
                                    472 ;	./../../mib/stm8s_mib_debug_cmd.c: 220: s++;
      009991 16 03            [ 2]  473 	ldw	y, (0x03, sp)
      009993 17 05            [ 2]  474 	ldw	(0x05, sp), y
      009995 20 E7            [ 2]  475 	jra	00112$
      009997                        476 00114$:
                                    477 ;	./../../mib/stm8s_mib_debug_cmd.c: 222: if (*s == '\0')
      009997 4D               [ 1]  478 	tnz	a
      009998 26 0D            [ 1]  479 	jrne	00116$
                                    480 ;	./../../mib/stm8s_mib_debug_cmd.c: 224: argv[args] = 0;
      00999A 1E 01            [ 2]  481 	ldw	x, (0x01, sp)
      00999C 58               [ 2]  482 	sllw	x
      00999D 72 FB 0B         [ 2]  483 	addw	x, (0x0b, sp)
      0099A0 6F 01            [ 1]  484 	clr	(0x1, x)
      0099A2 7F               [ 1]  485 	clr	(x)
                                    486 ;	./../../mib/stm8s_mib_debug_cmd.c: 225: return args;
      0099A3 1E 01            [ 2]  487 	ldw	x, (0x01, sp)
      0099A5 20 0B            [ 2]  488 	jra	00120$
      0099A7                        489 00116$:
                                    490 ;	./../../mib/stm8s_mib_debug_cmd.c: 227: *s++ = '\0';
      0099A7 1E 05            [ 2]  491 	ldw	x, (0x05, sp)
      0099A9 7F               [ 1]  492 	clr	(x)
      0099AA 16 03            [ 2]  493 	ldw	y, (0x03, sp)
      0099AC 17 05            [ 2]  494 	ldw	(0x05, sp), y
      0099AE 20 92            [ 2]  495 	jra	00117$
      0099B0                        496 00119$:
                                    497 ;	./../../mib/stm8s_mib_debug_cmd.c: 229: return args;
      0099B0 1E 01            [ 2]  498 	ldw	x, (0x01, sp)
      0099B2                        499 00120$:
                                    500 ;	./../../mib/stm8s_mib_debug_cmd.c: 230: } // GetArgs.
      0099B2 5B 08            [ 2]  501 	addw	sp, #8
      0099B4 90 85            [ 2]  502 	popw	y
      0099B6 5B 02            [ 2]  503 	addw	sp, #2
      0099B8 90 FC            [ 2]  504 	jp	(y)
                                    505 ;	./../../mib/stm8s_mib_debug_cmd.c: 241: int HexToInt(char *s, void *retval, uint16_t type)
                                    506 ;	-----------------------------------------
                                    507 ;	 function HexToInt
                                    508 ;	-----------------------------------------
      0099BA                        509 _HexToInt:
      0099BA 52 0E            [ 2]  510 	sub	sp, #14
                                    511 ;	./../../mib/stm8s_mib_debug_cmd.c: 247: if (!s || !retval)
      0099BC 1F 0A            [ 2]  512 	ldw	(0x0a, sp), x
      0099BE 27 04            [ 1]  513 	jreq	00101$
      0099C0 1E 11            [ 2]  514 	ldw	x, (0x11, sp)
      0099C2 26 04            [ 1]  515 	jrne	00102$
      0099C4                        516 00101$:
                                    517 ;	./../../mib/stm8s_mib_debug_cmd.c: 248: return FALSE;
      0099C4 5F               [ 1]  518 	clrw	x
      0099C5 CC 9A A0         [ 2]  519 	jp	00132$
      0099C8                        520 00102$:
                                    521 ;	./../../mib/stm8s_mib_debug_cmd.c: 249: if (!strncmp(s, "0x", 2))
      0099C8 4B 02            [ 1]  522 	push	#0x02
      0099CA 4B 00            [ 1]  523 	push	#0x00
      0099CC 4B 4B            [ 1]  524 	push	#<(___str_2+0)
      0099CE 4B 83            [ 1]  525 	push	#((___str_2+0) >> 8)
      0099D0 1E 0E            [ 2]  526 	ldw	x, (0x0e, sp)
      0099D2 CD A8 3D         [ 4]  527 	call	_strncmp
      0099D5 5D               [ 2]  528 	tnzw	x
      0099D6 26 06            [ 1]  529 	jrne	00105$
                                    530 ;	./../../mib/stm8s_mib_debug_cmd.c: 250: s += 2;
      0099D8 1E 0A            [ 2]  531 	ldw	x, (0x0a, sp)
      0099DA 5C               [ 1]  532 	incw	x
      0099DB 5C               [ 1]  533 	incw	x
      0099DC 1F 0A            [ 2]  534 	ldw	(0x0a, sp), x
      0099DE                        535 00105$:
                                    536 ;	./../../mib/stm8s_mib_debug_cmd.c: 252: for (i = 0, rval = 0; i < type / 4; i++)
      0099DE 0F 01            [ 1]  537 	clr	(0x01, sp)
      0099E0 5F               [ 1]  538 	clrw	x
      0099E1 1F 04            [ 2]  539 	ldw	(0x04, sp), x
      0099E3 1F 02            [ 2]  540 	ldw	(0x02, sp), x
      0099E5 16 0A            [ 2]  541 	ldw	y, (0x0a, sp)
      0099E7 17 0C            [ 2]  542 	ldw	(0x0c, sp), y
      0099E9 0F 0E            [ 1]  543 	clr	(0x0e, sp)
      0099EB                        544 00130$:
      0099EB 16 13            [ 2]  545 	ldw	y, (0x13, sp)
      0099ED 17 06            [ 2]  546 	ldw	(0x06, sp), y
      0099EF 93               [ 1]  547 	ldw	x, y
      0099F0 54               [ 2]  548 	srlw	x
      0099F1 54               [ 2]  549 	srlw	x
      0099F2 1F 08            [ 2]  550 	ldw	(0x08, sp), x
      0099F4 7B 0E            [ 1]  551 	ld	a, (0x0e, sp)
      0099F6 5F               [ 1]  552 	clrw	x
      0099F7 97               [ 1]  553 	ld	xl, a
      0099F8 13 08            [ 2]  554 	cpw	x, (0x08, sp)
      0099FA 24 70            [ 1]  555 	jrnc	00123$
                                    556 ;	./../../mib/stm8s_mib_debug_cmd.c: 254: if (*s == '\0')
      0099FC 1E 0C            [ 2]  557 	ldw	x, (0x0c, sp)
      0099FE F6               [ 1]  558 	ld	a, (x)
      0099FF 26 08            [ 1]  559 	jrne	00110$
                                    560 ;	./../../mib/stm8s_mib_debug_cmd.c: 256: if (i == 0)
      009A01 0D 01            [ 1]  561 	tnz	(0x01, sp)
      009A03 26 67            [ 1]  562 	jrne	00123$
                                    563 ;	./../../mib/stm8s_mib_debug_cmd.c: 257: return FALSE;
      009A05 5F               [ 1]  564 	clrw	x
      009A06 CC 9A A0         [ 2]  565 	jp	00132$
                                    566 ;	./../../mib/stm8s_mib_debug_cmd.c: 259: break;
      009A09                        567 00110$:
                                    568 ;	./../../mib/stm8s_mib_debug_cmd.c: 261: c = *s++;
      009A09 1E 0C            [ 2]  569 	ldw	x, (0x0c, sp)
      009A0B 5C               [ 1]  570 	incw	x
      009A0C 1F 0C            [ 2]  571 	ldw	(0x0c, sp), x
                                    572 ;	./../../mib/stm8s_mib_debug_cmd.c: 264: c -= '0';
      009A0E 97               [ 1]  573 	ld	xl, a
                                    574 ;	./../../mib/stm8s_mib_debug_cmd.c: 263: if (c >= '0' && c <= '9')
      009A0F A1 30            [ 1]  575 	cp	a, #0x30
      009A11 25 09            [ 1]  576 	jrc	00120$
      009A13 A1 39            [ 1]  577 	cp	a, #0x39
      009A15 22 05            [ 1]  578 	jrugt	00120$
                                    579 ;	./../../mib/stm8s_mib_debug_cmd.c: 264: c -= '0';
      009A17 9F               [ 1]  580 	ld	a, xl
      009A18 A0 30            [ 1]  581 	sub	a, #0x30
      009A1A 20 1D            [ 2]  582 	jra	00121$
      009A1C                        583 00120$:
                                    584 ;	./../../mib/stm8s_mib_debug_cmd.c: 265: else if (c >= 'a' && c <= 'f')
      009A1C A1 61            [ 1]  585 	cp	a, #0x61
      009A1E 25 09            [ 1]  586 	jrc	00116$
      009A20 A1 66            [ 1]  587 	cp	a, #0x66
      009A22 22 05            [ 1]  588 	jrugt	00116$
                                    589 ;	./../../mib/stm8s_mib_debug_cmd.c: 266: c = c - 'a' + 10;
      009A24 9F               [ 1]  590 	ld	a, xl
      009A25 AB A9            [ 1]  591 	add	a, #0xa9
      009A27 20 10            [ 2]  592 	jra	00121$
      009A29                        593 00116$:
                                    594 ;	./../../mib/stm8s_mib_debug_cmd.c: 267: else if (c >= 'A' && c <= 'F')
      009A29 A1 41            [ 1]  595 	cp	a, #0x41
      009A2B 25 09            [ 1]  596 	jrc	00112$
      009A2D A1 46            [ 1]  597 	cp	a, #0x46
      009A2F 22 05            [ 1]  598 	jrugt	00112$
                                    599 ;	./../../mib/stm8s_mib_debug_cmd.c: 268: c = c - 'A' + 10;
      009A31 9F               [ 1]  600 	ld	a, xl
      009A32 AB C9            [ 1]  601 	add	a, #0xc9
      009A34 20 03            [ 2]  602 	jra	00121$
      009A36                        603 00112$:
                                    604 ;	./../../mib/stm8s_mib_debug_cmd.c: 270: return FALSE;
      009A36 5F               [ 1]  605 	clrw	x
      009A37 20 67            [ 2]  606 	jra	00132$
      009A39                        607 00121$:
                                    608 ;	./../../mib/stm8s_mib_debug_cmd.c: 272: rval = rval << 4 | c;
      009A39 88               [ 1]  609 	push	a
      009A3A 1E 05            [ 2]  610 	ldw	x, (0x05, sp)
      009A3C 16 03            [ 2]  611 	ldw	y, (0x03, sp)
      009A3E A6 04            [ 1]  612 	ld	a, #0x04
      009A40                        613 00222$:
      009A40 58               [ 2]  614 	sllw	x
      009A41 90 59            [ 2]  615 	rlcw	y
      009A43 4A               [ 1]  616 	dec	a
      009A44 26 FA            [ 1]  617 	jrne	00222$
      009A46 84               [ 1]  618 	pop	a
      009A47 0F 08            [ 1]  619 	clr	(0x08, sp)
      009A49 0F 07            [ 1]  620 	clr	(0x07, sp)
      009A4B 0F 06            [ 1]  621 	clr	(0x06, sp)
      009A4D 89               [ 2]  622 	pushw	x
      009A4E 1A 02            [ 1]  623 	or	a, (2, sp)
      009A50 85               [ 2]  624 	popw	x
      009A51 02               [ 1]  625 	rlwa	x
      009A52 1A 08            [ 1]  626 	or	a, (0x08, sp)
      009A54 95               [ 1]  627 	ld	xh, a
      009A55 90 9F            [ 1]  628 	ld	a, yl
      009A57 1A 07            [ 1]  629 	or	a, (0x07, sp)
      009A59 90 02            [ 1]  630 	rlwa	y
      009A5B 1A 06            [ 1]  631 	or	a, (0x06, sp)
      009A5D 90 95            [ 1]  632 	ld	yh, a
      009A5F 1F 04            [ 2]  633 	ldw	(0x04, sp), x
      009A61 17 02            [ 2]  634 	ldw	(0x02, sp), y
                                    635 ;	./../../mib/stm8s_mib_debug_cmd.c: 252: for (i = 0, rval = 0; i < type / 4; i++)
      009A63 0C 0E            [ 1]  636 	inc	(0x0e, sp)
      009A65 7B 0E            [ 1]  637 	ld	a, (0x0e, sp)
      009A67 6B 01            [ 1]  638 	ld	(0x01, sp), a
      009A69 CC 99 EB         [ 2]  639 	jp	00130$
      009A6C                        640 00123$:
                                    641 ;	./../../mib/stm8s_mib_debug_cmd.c: 275: switch (type)
      009A6C 1E 06            [ 2]  642 	ldw	x, (0x06, sp)
      009A6E A3 00 08         [ 2]  643 	cpw	x, #0x0008
      009A71 27 10            [ 1]  644 	jreq	00124$
      009A73 1E 06            [ 2]  645 	ldw	x, (0x06, sp)
      009A75 A3 00 10         [ 2]  646 	cpw	x, #0x0010
      009A78 27 10            [ 1]  647 	jreq	00125$
      009A7A 1E 06            [ 2]  648 	ldw	x, (0x06, sp)
      009A7C A3 00 20         [ 2]  649 	cpw	x, #0x0020
      009A7F 27 10            [ 1]  650 	jreq	00126$
      009A81 20 19            [ 2]  651 	jra	00127$
                                    652 ;	./../../mib/stm8s_mib_debug_cmd.c: 277: case 8:
      009A83                        653 00124$:
                                    654 ;	./../../mib/stm8s_mib_debug_cmd.c: 278: *(uint8_t *)retval = (uint8_t)rval;
      009A83 1E 11            [ 2]  655 	ldw	x, (0x11, sp)
      009A85 7B 05            [ 1]  656 	ld	a, (0x05, sp)
      009A87 F7               [ 1]  657 	ld	(x), a
                                    658 ;	./../../mib/stm8s_mib_debug_cmd.c: 279: break;
      009A88 20 14            [ 2]  659 	jra	00128$
                                    660 ;	./../../mib/stm8s_mib_debug_cmd.c: 280: case 16:
      009A8A                        661 00125$:
                                    662 ;	./../../mib/stm8s_mib_debug_cmd.c: 281: *(uint16_t *)retval = (uint16_t)rval;
      009A8A 1E 11            [ 2]  663 	ldw	x, (0x11, sp)
      009A8C 16 04            [ 2]  664 	ldw	y, (0x04, sp)
      009A8E FF               [ 2]  665 	ldw	(x), y
                                    666 ;	./../../mib/stm8s_mib_debug_cmd.c: 282: break;
      009A8F 20 0D            [ 2]  667 	jra	00128$
                                    668 ;	./../../mib/stm8s_mib_debug_cmd.c: 283: case 32:
      009A91                        669 00126$:
                                    670 ;	./../../mib/stm8s_mib_debug_cmd.c: 284: *(uint32_t *)retval = (uint32_t)rval;
      009A91 1E 11            [ 2]  671 	ldw	x, (0x11, sp)
      009A93 16 04            [ 2]  672 	ldw	y, (0x04, sp)
      009A95 EF 02            [ 2]  673 	ldw	(0x2, x), y
      009A97 16 02            [ 2]  674 	ldw	y, (0x02, sp)
      009A99 FF               [ 2]  675 	ldw	(x), y
                                    676 ;	./../../mib/stm8s_mib_debug_cmd.c: 285: break;
      009A9A 20 02            [ 2]  677 	jra	00128$
                                    678 ;	./../../mib/stm8s_mib_debug_cmd.c: 286: default:
      009A9C                        679 00127$:
                                    680 ;	./../../mib/stm8s_mib_debug_cmd.c: 287: return FALSE;
      009A9C 5F               [ 1]  681 	clrw	x
                                    682 ;	./../../mib/stm8s_mib_debug_cmd.c: 288: }
                                    683 ;	./../../mib/stm8s_mib_debug_cmd.c: 289: return TRUE;
      009A9D C5                     684 	.byte 0xc5
      009A9E                        685 00128$:
      009A9E 5F               [ 1]  686 	clrw	x
      009A9F 5C               [ 1]  687 	incw	x
      009AA0                        688 00132$:
                                    689 ;	./../../mib/stm8s_mib_debug_cmd.c: 290: } // HexToInt.
      009AA0 16 0F            [ 2]  690 	ldw	y, (15, sp)
      009AA2 5B 14            [ 2]  691 	addw	sp, #20
      009AA4 90 FC            [ 2]  692 	jp	(y)
                                    693 ;	./../../mib/stm8s_mib_debug_cmd.c: 300: int DecToLong(char *s, void *retval, uint16_t type)
                                    694 ;	-----------------------------------------
                                    695 ;	 function DecToLong
                                    696 ;	-----------------------------------------
      009AA6                        697 _DecToLong:
      009AA6 52 0E            [ 2]  698 	sub	sp, #14
                                    699 ;	./../../mib/stm8s_mib_debug_cmd.c: 305: if (!s || !s[0] || !retval)
      009AA8 5D               [ 2]  700 	tnzw	x
      009AA9 27 07            [ 1]  701 	jreq	00101$
      009AAB F6               [ 1]  702 	ld	a, (x)
      009AAC 27 04            [ 1]  703 	jreq	00101$
      009AAE 16 11            [ 2]  704 	ldw	y, (0x11, sp)
      009AB0 26 03            [ 1]  705 	jrne	00102$
      009AB2                        706 00101$:
                                    707 ;	./../../mib/stm8s_mib_debug_cmd.c: 306: return FALSE;
      009AB2 5F               [ 1]  708 	clrw	x
      009AB3 20 73            [ 2]  709 	jra	00117$
      009AB5                        710 00102$:
                                    711 ;	./../../mib/stm8s_mib_debug_cmd.c: 308: for (rval= 0; *s; s++)
      009AB5 90 5F            [ 1]  712 	clrw	y
      009AB7 17 09            [ 2]  713 	ldw	(0x09, sp), y
      009AB9 1F 0D            [ 2]  714 	ldw	(0x0d, sp), x
      009ABB                        715 00115$:
      009ABB 1E 0D            [ 2]  716 	ldw	x, (0x0d, sp)
      009ABD F6               [ 1]  717 	ld	a, (x)
      009ABE 27 3C            [ 1]  718 	jreq	00108$
                                    719 ;	./../../mib/stm8s_mib_debug_cmd.c: 310: if (*s < '0' || *s > '9')
      009AC0 A1 30            [ 1]  720 	cp	a, #0x30
      009AC2 25 04            [ 1]  721 	jrc	00105$
      009AC4 A1 39            [ 1]  722 	cp	a, #0x39
      009AC6 23 03            [ 2]  723 	jrule	00106$
      009AC8                        724 00105$:
                                    725 ;	./../../mib/stm8s_mib_debug_cmd.c: 311: return FALSE;
      009AC8 5F               [ 1]  726 	clrw	x
      009AC9 20 5D            [ 2]  727 	jra	00117$
      009ACB                        728 00106$:
                                    729 ;	./../../mib/stm8s_mib_debug_cmd.c: 312: c = *s - '0';
      009ACB A0 30            [ 1]  730 	sub	a, #0x30
                                    731 ;	./../../mib/stm8s_mib_debug_cmd.c: 313: rval = rval * 10 + c;
      009ACD 88               [ 1]  732 	push	a
      009ACE 90 89            [ 2]  733 	pushw	y
      009AD0 1E 0C            [ 2]  734 	ldw	x, (0x0c, sp)
      009AD2 89               [ 2]  735 	pushw	x
      009AD3 4B 0A            [ 1]  736 	push	#0x0a
      009AD5 5F               [ 1]  737 	clrw	x
      009AD6 89               [ 2]  738 	pushw	x
      009AD7 4B 00            [ 1]  739 	push	#0x00
      009AD9 CD A9 B9         [ 4]  740 	call	__mullong
      009ADC 5B 08            [ 2]  741 	addw	sp, #8
      009ADE 1F 04            [ 2]  742 	ldw	(0x04, sp), x
      009AE0 84               [ 1]  743 	pop	a
      009AE1 5F               [ 1]  744 	clrw	x
      009AE2 1F 05            [ 2]  745 	ldw	(0x05, sp), x
      009AE4 97               [ 1]  746 	ld	xl, a
      009AE5 72 FB 03         [ 2]  747 	addw	x, (0x03, sp)
      009AE8 90 9F            [ 1]  748 	ld	a, yl
      009AEA 19 06            [ 1]  749 	adc	a, (0x06, sp)
      009AEC 6B 0A            [ 1]  750 	ld	(0x0a, sp), a
      009AEE 90 9E            [ 1]  751 	ld	a, yh
      009AF0 19 05            [ 1]  752 	adc	a, (0x05, sp)
      009AF2 6B 09            [ 1]  753 	ld	(0x09, sp), a
      009AF4 51               [ 1]  754 	exgw	x, y
                                    755 ;	./../../mib/stm8s_mib_debug_cmd.c: 308: for (rval= 0; *s; s++)
      009AF5 1E 0D            [ 2]  756 	ldw	x, (0x0d, sp)
      009AF7 5C               [ 1]  757 	incw	x
      009AF8 1F 0D            [ 2]  758 	ldw	(0x0d, sp), x
      009AFA 20 BF            [ 2]  759 	jra	00115$
      009AFC                        760 00108$:
                                    761 ;	./../../mib/stm8s_mib_debug_cmd.c: 316: switch (type)
      009AFC 1E 13            [ 2]  762 	ldw	x, (0x13, sp)
      009AFE A3 00 08         [ 2]  763 	cpw	x, #0x0008
      009B01 27 0C            [ 1]  764 	jreq	00109$
      009B03 A3 00 10         [ 2]  765 	cpw	x, #0x0010
      009B06 27 0E            [ 1]  766 	jreq	00110$
      009B08 A3 00 20         [ 2]  767 	cpw	x, #0x0020
      009B0B 27 0E            [ 1]  768 	jreq	00111$
      009B0D 20 15            [ 2]  769 	jra	00112$
                                    770 ;	./../../mib/stm8s_mib_debug_cmd.c: 318: case 8:
      009B0F                        771 00109$:
                                    772 ;	./../../mib/stm8s_mib_debug_cmd.c: 319: *(uint8_t *)retval = (uint8_t)rval;
      009B0F 1E 11            [ 2]  773 	ldw	x, (0x11, sp)
      009B11 90 9F            [ 1]  774 	ld	a, yl
      009B13 F7               [ 1]  775 	ld	(x), a
                                    776 ;	./../../mib/stm8s_mib_debug_cmd.c: 320: break;
      009B14 20 10            [ 2]  777 	jra	00113$
                                    778 ;	./../../mib/stm8s_mib_debug_cmd.c: 321: case 16:
      009B16                        779 00110$:
                                    780 ;	./../../mib/stm8s_mib_debug_cmd.c: 322: *(uint16_t *)retval = (uint16_t)rval;
      009B16 1E 11            [ 2]  781 	ldw	x, (0x11, sp)
      009B18 FF               [ 2]  782 	ldw	(x), y
                                    783 ;	./../../mib/stm8s_mib_debug_cmd.c: 323: break;
      009B19 20 0B            [ 2]  784 	jra	00113$
                                    785 ;	./../../mib/stm8s_mib_debug_cmd.c: 324: case 32:
      009B1B                        786 00111$:
                                    787 ;	./../../mib/stm8s_mib_debug_cmd.c: 325: *(uint32_t *)retval = (uint32_t)rval;
      009B1B 1E 11            [ 2]  788 	ldw	x, (0x11, sp)
      009B1D EF 02            [ 2]  789 	ldw	(0x2, x), y
      009B1F 16 09            [ 2]  790 	ldw	y, (0x09, sp)
      009B21 FF               [ 2]  791 	ldw	(x), y
                                    792 ;	./../../mib/stm8s_mib_debug_cmd.c: 326: break;
      009B22 20 02            [ 2]  793 	jra	00113$
                                    794 ;	./../../mib/stm8s_mib_debug_cmd.c: 327: default:
      009B24                        795 00112$:
                                    796 ;	./../../mib/stm8s_mib_debug_cmd.c: 328: return FALSE;
      009B24 5F               [ 1]  797 	clrw	x
                                    798 ;	./../../mib/stm8s_mib_debug_cmd.c: 329: }
                                    799 ;	./../../mib/stm8s_mib_debug_cmd.c: 330: return TRUE;
      009B25 C5                     800 	.byte 0xc5
      009B26                        801 00113$:
      009B26 5F               [ 1]  802 	clrw	x
      009B27 5C               [ 1]  803 	incw	x
      009B28                        804 00117$:
                                    805 ;	./../../mib/stm8s_mib_debug_cmd.c: 331: } // DecToLong.
      009B28 16 0F            [ 2]  806 	ldw	y, (15, sp)
      009B2A 5B 14            [ 2]  807 	addw	sp, #20
      009B2C 90 FC            [ 2]  808 	jp	(y)
                                    809 ;	./../../mib/stm8s_mib_debug_cmd.c: 340: void HexDump(uint32_t addr, uint32_t len)
                                    810 ;	-----------------------------------------
                                    811 ;	 function HexDump
                                    812 ;	-----------------------------------------
      009B2E                        813 _HexDump:
      009B2E 52 27            [ 2]  814 	sub	sp, #39
                                    815 ;	./../../mib/stm8s_mib_debug_cmd.c: 343: uint32_t endPtr = (addr + len);
      009B30 16 2C            [ 2]  816 	ldw	y, (0x2c, sp)
      009B32 72 F9 30         [ 2]  817 	addw	y, (0x30, sp)
      009B35 1E 2A            [ 2]  818 	ldw	x, (0x2a, sp)
      009B37 24 01            [ 1]  819 	jrnc	00240$
      009B39 5C               [ 1]  820 	incw	x
      009B3A                        821 00240$:
      009B3A 72 FB 2E         [ 2]  822 	addw	x, (0x2e, sp)
      009B3D 17 17            [ 2]  823 	ldw	(0x17, sp), y
      009B3F 1F 15            [ 2]  824 	ldw	(0x15, sp), x
                                    825 ;	./../../mib/stm8s_mib_debug_cmd.c: 344: int i, remainder = len & 0xf;
      009B41 1E 30            [ 2]  826 	ldw	x, (0x30, sp)
      009B43 9F               [ 1]  827 	ld	a, xl
      009B44 A4 0F            [ 1]  828 	and	a, #0x0f
      009B46 6B 1A            [ 1]  829 	ld	(0x1a, sp), a
      009B48 0F 19            [ 1]  830 	clr	(0x19, sp)
                                    831 ;	./../../mib/stm8s_mib_debug_cmd.c: 350: mib_printf("\r\n");
      009B4A 4B 44            [ 1]  832 	push	#<(___str_0+0)
      009B4C 4B 83            [ 1]  833 	push	#((___str_0+0) >> 8)
      009B4E CD 96 B4         [ 4]  834 	call	_mib_printf
      009B51 5B 02            [ 2]  835 	addw	sp, #2
                                    836 ;	./../../mib/stm8s_mib_debug_cmd.c: 351: mib_printf("address     Hex Value                                        Ascii value\r\n");
      009B53 4B 4E            [ 1]  837 	push	#<(___str_3+0)
      009B55 4B 83            [ 1]  838 	push	#((___str_3+0) >> 8)
      009B57 CD 96 B4         [ 4]  839 	call	_mib_printf
      009B5A 5B 02            [ 2]  840 	addw	sp, #2
                                    841 ;	./../../mib/stm8s_mib_debug_cmd.c: 354: p_address = (uint32_t)(addr);
      009B5C 1E 2C            [ 2]  842 	ldw	x, (0x2c, sp)
      009B5E 16 2A            [ 2]  843 	ldw	y, (0x2a, sp)
                                    844 ;	./../../mib/stm8s_mib_debug_cmd.c: 355: p_data_ptr = (uint16_t *)p_data;
                                    845 ;	./../../mib/stm8s_mib_debug_cmd.c: 356: while ((p_address + 16) <= endPtr)
      009B60 1F 1D            [ 2]  846 	ldw	(0x1d, sp), x
      009B62 17 1B            [ 2]  847 	ldw	(0x1b, sp), y
      009B64                        848 00107$:
      009B64 1E 1D            [ 2]  849 	ldw	x, (0x1d, sp)
      009B66 1C 00 10         [ 2]  850 	addw	x, #0x0010
      009B69 1F 21            [ 2]  851 	ldw	(0x21, sp), x
      009B6B 7B 1C            [ 1]  852 	ld	a, (0x1c, sp)
      009B6D A9 00            [ 1]  853 	adc	a, #0x00
      009B6F 6B 20            [ 1]  854 	ld	(0x20, sp), a
      009B71 7B 1B            [ 1]  855 	ld	a, (0x1b, sp)
      009B73 A9 00            [ 1]  856 	adc	a, #0x00
      009B75 6B 1F            [ 1]  857 	ld	(0x1f, sp), a
      009B77 1E 17            [ 2]  858 	ldw	x, (0x17, sp)
      009B79 13 21            [ 2]  859 	cpw	x, (0x21, sp)
      009B7B 7B 16            [ 1]  860 	ld	a, (0x16, sp)
      009B7D 12 20            [ 1]  861 	sbc	a, (0x20, sp)
      009B7F 7B 15            [ 1]  862 	ld	a, (0x15, sp)
      009B81 12 1F            [ 1]  863 	sbc	a, (0x1f, sp)
      009B83 24 03            [ 1]  864 	jrnc	00241$
      009B85 CC 9C 48         [ 2]  865 	jp	00163$
      009B88                        866 00241$:
                                    867 ;	./../../mib/stm8s_mib_debug_cmd.c: 358: mib_printf("0x%08lx : ", p_address);
      009B88 1E 1D            [ 2]  868 	ldw	x, (0x1d, sp)
      009B8A 89               [ 2]  869 	pushw	x
      009B8B 1E 1D            [ 2]  870 	ldw	x, (0x1d, sp)
      009B8D 89               [ 2]  871 	pushw	x
      009B8E 4B 99            [ 1]  872 	push	#<(___str_4+0)
      009B90 4B 83            [ 1]  873 	push	#((___str_4+0) >> 8)
      009B92 CD 96 B4         [ 4]  874 	call	_mib_printf
      009B95 5B 06            [ 2]  875 	addw	sp, #6
                                    876 ;	./../../mib/stm8s_mib_debug_cmd.c: 359: for (i = 0; i < 8; i++)
      009B97 5F               [ 1]  877 	clrw	x
      009B98 1F 26            [ 2]  878 	ldw	(0x26, sp), x
      009B9A                        879 00120$:
                                    880 ;	./../../mib/stm8s_mib_debug_cmd.c: 361: p_data_ptr[i] = rd_ADDR16(p_address + i * 2);
      009B9A 16 26            [ 2]  881 	ldw	y, (0x26, sp)
      009B9C 90 58            [ 2]  882 	sllw	y
      009B9E 93               [ 1]  883 	ldw	x, y
      009B9F 89               [ 2]  884 	pushw	x
      009BA0 96               [ 1]  885 	ldw	x, sp
      009BA1 1C 00 03         [ 2]  886 	addw	x, #3
      009BA4 72 FB 01         [ 2]  887 	addw	x, (1, sp)
      009BA7 5B 02            [ 2]  888 	addw	sp, #2
      009BA9 17 24            [ 2]  889 	ldw	(0x24, sp), y
      009BAB 16 1D            [ 2]  890 	ldw	y, (0x1d, sp)
      009BAD 72 F9 24         [ 2]  891 	addw	y, (0x24, sp)
      009BB0 90 FE            [ 2]  892 	ldw	y, (y)
      009BB2 FF               [ 2]  893 	ldw	(x), y
                                    894 ;	./../../mib/stm8s_mib_debug_cmd.c: 362: mib_printf("%02x ", p_data[i * 2]);
      009BB3 7B 27            [ 1]  895 	ld	a, (0x27, sp)
      009BB5 48               [ 1]  896 	sll	a
      009BB6 6B 23            [ 1]  897 	ld	(0x23, sp), a
      009BB8 6B 25            [ 1]  898 	ld	(0x25, sp), a
      009BBA 49               [ 1]  899 	rlc	a
      009BBB 4F               [ 1]  900 	clr	a
      009BBC A2 00            [ 1]  901 	sbc	a, #0x00
      009BBE 6B 24            [ 1]  902 	ld	(0x24, sp), a
      009BC0 96               [ 1]  903 	ldw	x, sp
      009BC1 5C               [ 1]  904 	incw	x
      009BC2 72 FB 24         [ 2]  905 	addw	x, (0x24, sp)
      009BC5 F6               [ 1]  906 	ld	a, (x)
      009BC6 5F               [ 1]  907 	clrw	x
      009BC7 97               [ 1]  908 	ld	xl, a
      009BC8 89               [ 2]  909 	pushw	x
      009BC9 4B A4            [ 1]  910 	push	#<(___str_5+0)
      009BCB 4B 83            [ 1]  911 	push	#((___str_5+0) >> 8)
      009BCD CD 96 B4         [ 4]  912 	call	_mib_printf
      009BD0 5B 04            [ 2]  913 	addw	sp, #4
                                    914 ;	./../../mib/stm8s_mib_debug_cmd.c: 363: mib_printf("%02x ", p_data[i * 2 + 1]);
      009BD2 7B 23            [ 1]  915 	ld	a, (0x23, sp)
      009BD4 4C               [ 1]  916 	inc	a
      009BD5 6B 25            [ 1]  917 	ld	(0x25, sp), a
      009BD7 49               [ 1]  918 	rlc	a
      009BD8 4F               [ 1]  919 	clr	a
      009BD9 A2 00            [ 1]  920 	sbc	a, #0x00
      009BDB 6B 24            [ 1]  921 	ld	(0x24, sp), a
      009BDD 96               [ 1]  922 	ldw	x, sp
      009BDE 5C               [ 1]  923 	incw	x
      009BDF 72 FB 24         [ 2]  924 	addw	x, (0x24, sp)
      009BE2 F6               [ 1]  925 	ld	a, (x)
      009BE3 5F               [ 1]  926 	clrw	x
      009BE4 97               [ 1]  927 	ld	xl, a
      009BE5 89               [ 2]  928 	pushw	x
      009BE6 4B A4            [ 1]  929 	push	#<(___str_5+0)
      009BE8 4B 83            [ 1]  930 	push	#((___str_5+0) >> 8)
      009BEA CD 96 B4         [ 4]  931 	call	_mib_printf
      009BED 5B 04            [ 2]  932 	addw	sp, #4
                                    933 ;	./../../mib/stm8s_mib_debug_cmd.c: 359: for (i = 0; i < 8; i++)
      009BEF 1E 26            [ 2]  934 	ldw	x, (0x26, sp)
      009BF1 5C               [ 1]  935 	incw	x
      009BF2 1F 26            [ 2]  936 	ldw	(0x26, sp), x
      009BF4 A3 00 08         [ 2]  937 	cpw	x, #0x0008
      009BF7 2F A1            [ 1]  938 	jrslt	00120$
                                    939 ;	./../../mib/stm8s_mib_debug_cmd.c: 365: mib_printf(" ");
      009BF9 4B AA            [ 1]  940 	push	#<(___str_6+0)
      009BFB 4B 83            [ 1]  941 	push	#((___str_6+0) >> 8)
      009BFD CD 96 B4         [ 4]  942 	call	_mib_printf
      009C00 5B 02            [ 2]  943 	addw	sp, #2
                                    944 ;	./../../mib/stm8s_mib_debug_cmd.c: 366: for (i = 0; i < 16; i++)
      009C02 5F               [ 1]  945 	clrw	x
      009C03 1F 26            [ 2]  946 	ldw	(0x26, sp), x
      009C05                        947 00122$:
                                    948 ;	./../../mib/stm8s_mib_debug_cmd.c: 368: c = p_data[i];
      009C05 96               [ 1]  949 	ldw	x, sp
      009C06 5C               [ 1]  950 	incw	x
      009C07 72 FB 26         [ 2]  951 	addw	x, (0x26, sp)
      009C0A F6               [ 1]  952 	ld	a, (x)
                                    953 ;	./../../mib/stm8s_mib_debug_cmd.c: 369: if (c >= 32 && c <= 125)
      009C0B A1 20            [ 1]  954 	cp	a, #0x20
      009C0D 25 12            [ 1]  955 	jrc	00103$
      009C0F A1 7D            [ 1]  956 	cp	a, #0x7d
      009C11 22 0E            [ 1]  957 	jrugt	00103$
                                    958 ;	./../../mib/stm8s_mib_debug_cmd.c: 370: mib_printf("%c", c);
      009C13 5F               [ 1]  959 	clrw	x
      009C14 97               [ 1]  960 	ld	xl, a
      009C15 89               [ 2]  961 	pushw	x
      009C16 4B AC            [ 1]  962 	push	#<(___str_7+0)
      009C18 4B 83            [ 1]  963 	push	#((___str_7+0) >> 8)
      009C1A CD 96 B4         [ 4]  964 	call	_mib_printf
      009C1D 5B 04            [ 2]  965 	addw	sp, #4
      009C1F 20 09            [ 2]  966 	jra	00123$
      009C21                        967 00103$:
                                    968 ;	./../../mib/stm8s_mib_debug_cmd.c: 372: mib_printf(".");
      009C21 4B AF            [ 1]  969 	push	#<(___str_8+0)
      009C23 4B 83            [ 1]  970 	push	#((___str_8+0) >> 8)
      009C25 CD 96 B4         [ 4]  971 	call	_mib_printf
      009C28 5B 02            [ 2]  972 	addw	sp, #2
      009C2A                        973 00123$:
                                    974 ;	./../../mib/stm8s_mib_debug_cmd.c: 366: for (i = 0; i < 16; i++)
      009C2A 1E 26            [ 2]  975 	ldw	x, (0x26, sp)
      009C2C 5C               [ 1]  976 	incw	x
      009C2D 1F 26            [ 2]  977 	ldw	(0x26, sp), x
      009C2F A3 00 10         [ 2]  978 	cpw	x, #0x0010
      009C32 2F D1            [ 1]  979 	jrslt	00122$
                                    980 ;	./../../mib/stm8s_mib_debug_cmd.c: 374: p_address += 16;
      009C34 16 21            [ 2]  981 	ldw	y, (0x21, sp)
      009C36 17 1D            [ 2]  982 	ldw	(0x1d, sp), y
      009C38 16 1F            [ 2]  983 	ldw	y, (0x1f, sp)
      009C3A 17 1B            [ 2]  984 	ldw	(0x1b, sp), y
                                    985 ;	./../../mib/stm8s_mib_debug_cmd.c: 376: mib_printf("\r\n");
      009C3C 4B 44            [ 1]  986 	push	#<(___str_0+0)
      009C3E 4B 83            [ 1]  987 	push	#((___str_0+0) >> 8)
      009C40 CD 96 B4         [ 4]  988 	call	_mib_printf
      009C43 5B 02            [ 2]  989 	addw	sp, #2
      009C45 CC 9B 64         [ 2]  990 	jp	00107$
      009C48                        991 00163$:
      009C48 16 1D            [ 2]  992 	ldw	y, (0x1d, sp)
      009C4A 17 24            [ 2]  993 	ldw	(0x24, sp), y
      009C4C 16 1B            [ 2]  994 	ldw	y, (0x1b, sp)
      009C4E 17 22            [ 2]  995 	ldw	(0x22, sp), y
                                    996 ;	./../../mib/stm8s_mib_debug_cmd.c: 380: if (remainder)
      009C50 1E 19            [ 2]  997 	ldw	x, (0x19, sp)
      009C52 26 03            [ 1]  998 	jrne	00248$
      009C54 CC 9D 64         [ 2]  999 	jp	00119$
      009C57                       1000 00248$:
                                   1001 ;	./../../mib/stm8s_mib_debug_cmd.c: 382: mib_printf("0x%08lx  ", p_address);
      009C57 1E 1D            [ 2] 1002 	ldw	x, (0x1d, sp)
      009C59 89               [ 2] 1003 	pushw	x
      009C5A 1E 1D            [ 2] 1004 	ldw	x, (0x1d, sp)
      009C5C 89               [ 2] 1005 	pushw	x
      009C5D 4B B1            [ 1] 1006 	push	#<(___str_9+0)
      009C5F 4B 83            [ 1] 1007 	push	#((___str_9+0) >> 8)
      009C61 CD 96 B4         [ 4] 1008 	call	_mib_printf
      009C64 5B 06            [ 2] 1009 	addw	sp, #6
                                   1010 ;	./../../mib/stm8s_mib_debug_cmd.c: 383: for (i = 0; i < (remainder >> 1); i++)
      009C66 1E 19            [ 2] 1011 	ldw	x, (0x19, sp)
      009C68 57               [ 2] 1012 	sraw	x
      009C69 1F 1D            [ 2] 1013 	ldw	(0x1d, sp), x
      009C6B 5F               [ 1] 1014 	clrw	x
      009C6C 1F 26            [ 2] 1015 	ldw	(0x26, sp), x
      009C6E                       1016 00125$:
      009C6E 1E 26            [ 2] 1017 	ldw	x, (0x26, sp)
      009C70 13 1D            [ 2] 1018 	cpw	x, (0x1d, sp)
      009C72 2E 5C            [ 1] 1019 	jrsge	00110$
                                   1020 ;	./../../mib/stm8s_mib_debug_cmd.c: 385: p_data_ptr[i] = rd_ADDR16(p_address + i * 2);
      009C74 16 26            [ 2] 1021 	ldw	y, (0x26, sp)
      009C76 90 58            [ 2] 1022 	sllw	y
      009C78 93               [ 1] 1023 	ldw	x, y
      009C79 89               [ 2] 1024 	pushw	x
      009C7A 96               [ 1] 1025 	ldw	x, sp
      009C7B 1C 00 03         [ 2] 1026 	addw	x, #3
      009C7E 72 FB 01         [ 2] 1027 	addw	x, (1, sp)
      009C81 5B 02            [ 2] 1028 	addw	sp, #2
      009C83 17 20            [ 2] 1029 	ldw	(0x20, sp), y
      009C85 16 24            [ 2] 1030 	ldw	y, (0x24, sp)
      009C87 72 F9 20         [ 2] 1031 	addw	y, (0x20, sp)
      009C8A 90 FE            [ 2] 1032 	ldw	y, (y)
      009C8C FF               [ 2] 1033 	ldw	(x), y
                                   1034 ;	./../../mib/stm8s_mib_debug_cmd.c: 386: mib_printf("%02x ", p_data[i * 2]);
      009C8D 7B 27            [ 1] 1035 	ld	a, (0x27, sp)
      009C8F 48               [ 1] 1036 	sll	a
      009C90 6B 1F            [ 1] 1037 	ld	(0x1f, sp), a
      009C92 6B 21            [ 1] 1038 	ld	(0x21, sp), a
      009C94 49               [ 1] 1039 	rlc	a
      009C95 4F               [ 1] 1040 	clr	a
      009C96 A2 00            [ 1] 1041 	sbc	a, #0x00
      009C98 6B 20            [ 1] 1042 	ld	(0x20, sp), a
      009C9A 96               [ 1] 1043 	ldw	x, sp
      009C9B 5C               [ 1] 1044 	incw	x
      009C9C 72 FB 20         [ 2] 1045 	addw	x, (0x20, sp)
      009C9F F6               [ 1] 1046 	ld	a, (x)
      009CA0 5F               [ 1] 1047 	clrw	x
      009CA1 97               [ 1] 1048 	ld	xl, a
      009CA2 89               [ 2] 1049 	pushw	x
      009CA3 4B A4            [ 1] 1050 	push	#<(___str_5+0)
      009CA5 4B 83            [ 1] 1051 	push	#((___str_5+0) >> 8)
      009CA7 CD 96 B4         [ 4] 1052 	call	_mib_printf
      009CAA 5B 04            [ 2] 1053 	addw	sp, #4
                                   1054 ;	./../../mib/stm8s_mib_debug_cmd.c: 387: mib_printf("%02x ", p_data[i * 2 + 1]);
      009CAC 7B 1F            [ 1] 1055 	ld	a, (0x1f, sp)
      009CAE 4C               [ 1] 1056 	inc	a
      009CAF 6B 21            [ 1] 1057 	ld	(0x21, sp), a
      009CB1 49               [ 1] 1058 	rlc	a
      009CB2 4F               [ 1] 1059 	clr	a
      009CB3 A2 00            [ 1] 1060 	sbc	a, #0x00
      009CB5 6B 20            [ 1] 1061 	ld	(0x20, sp), a
      009CB7 96               [ 1] 1062 	ldw	x, sp
      009CB8 5C               [ 1] 1063 	incw	x
      009CB9 72 FB 20         [ 2] 1064 	addw	x, (0x20, sp)
      009CBC F6               [ 1] 1065 	ld	a, (x)
      009CBD 5F               [ 1] 1066 	clrw	x
      009CBE 97               [ 1] 1067 	ld	xl, a
      009CBF 89               [ 2] 1068 	pushw	x
      009CC0 4B A4            [ 1] 1069 	push	#<(___str_5+0)
      009CC2 4B 83            [ 1] 1070 	push	#((___str_5+0) >> 8)
      009CC4 CD 96 B4         [ 4] 1071 	call	_mib_printf
      009CC7 5B 04            [ 2] 1072 	addw	sp, #4
                                   1073 ;	./../../mib/stm8s_mib_debug_cmd.c: 383: for (i = 0; i < (remainder >> 1); i++)
      009CC9 1E 26            [ 2] 1074 	ldw	x, (0x26, sp)
      009CCB 5C               [ 1] 1075 	incw	x
      009CCC 1F 26            [ 2] 1076 	ldw	(0x26, sp), x
      009CCE 20 9E            [ 2] 1077 	jra	00125$
      009CD0                       1078 00110$:
                                   1079 ;	./../../mib/stm8s_mib_debug_cmd.c: 389: for (i = 0; i < (16 - (remainder >> 1) * 2); i++)
      009CD0 1E 1D            [ 2] 1080 	ldw	x, (0x1d, sp)
      009CD2 58               [ 2] 1081 	sllw	x
      009CD3 1F 26            [ 2] 1082 	ldw	(0x26, sp), x
      009CD5 A6 10            [ 1] 1083 	ld	a, #0x10
      009CD7 10 27            [ 1] 1084 	sub	a, (0x27, sp)
      009CD9 6B 25            [ 1] 1085 	ld	(0x25, sp), a
      009CDB 4F               [ 1] 1086 	clr	a
      009CDC 12 26            [ 1] 1087 	sbc	a, (0x26, sp)
      009CDE 6B 24            [ 1] 1088 	ld	(0x24, sp), a
      009CE0 5F               [ 1] 1089 	clrw	x
      009CE1 1F 26            [ 2] 1090 	ldw	(0x26, sp), x
      009CE3                       1091 00128$:
      009CE3 1E 26            [ 2] 1092 	ldw	x, (0x26, sp)
      009CE5 13 24            [ 2] 1093 	cpw	x, (0x24, sp)
      009CE7 2E 10            [ 1] 1094 	jrsge	00111$
                                   1095 ;	./../../mib/stm8s_mib_debug_cmd.c: 391: mib_printf("   ");
      009CE9 4B BB            [ 1] 1096 	push	#<(___str_10+0)
      009CEB 4B 83            [ 1] 1097 	push	#((___str_10+0) >> 8)
      009CED CD 96 B4         [ 4] 1098 	call	_mib_printf
      009CF0 5B 02            [ 2] 1099 	addw	sp, #2
                                   1100 ;	./../../mib/stm8s_mib_debug_cmd.c: 389: for (i = 0; i < (16 - (remainder >> 1) * 2); i++)
      009CF2 1E 26            [ 2] 1101 	ldw	x, (0x26, sp)
      009CF4 5C               [ 1] 1102 	incw	x
      009CF5 1F 26            [ 2] 1103 	ldw	(0x26, sp), x
      009CF7 20 EA            [ 2] 1104 	jra	00128$
      009CF9                       1105 00111$:
                                   1106 ;	./../../mib/stm8s_mib_debug_cmd.c: 393: mib_printf(" ");
      009CF9 4B AA            [ 1] 1107 	push	#<(___str_6+0)
      009CFB 4B 83            [ 1] 1108 	push	#((___str_6+0) >> 8)
      009CFD CD 96 B4         [ 4] 1109 	call	_mib_printf
      009D00 5B 02            [ 2] 1110 	addw	sp, #2
                                   1111 ;	./../../mib/stm8s_mib_debug_cmd.c: 394: for (i = 0; i < remainder; i++)
      009D02 5F               [ 1] 1112 	clrw	x
      009D03 1F 26            [ 2] 1113 	ldw	(0x26, sp), x
      009D05                       1114 00131$:
      009D05 1E 26            [ 2] 1115 	ldw	x, (0x26, sp)
      009D07 13 19            [ 2] 1116 	cpw	x, (0x19, sp)
      009D09 2E 2C            [ 1] 1117 	jrsge	00116$
                                   1118 ;	./../../mib/stm8s_mib_debug_cmd.c: 396: c = p_data[i];
      009D0B 96               [ 1] 1119 	ldw	x, sp
      009D0C 5C               [ 1] 1120 	incw	x
      009D0D 72 FB 26         [ 2] 1121 	addw	x, (0x26, sp)
      009D10 F6               [ 1] 1122 	ld	a, (x)
                                   1123 ;	./../../mib/stm8s_mib_debug_cmd.c: 397: if (c >= 32 && c <= 125)
      009D11 A1 20            [ 1] 1124 	cp	a, #0x20
      009D13 25 12            [ 1] 1125 	jrc	00113$
      009D15 A1 7D            [ 1] 1126 	cp	a, #0x7d
      009D17 22 0E            [ 1] 1127 	jrugt	00113$
                                   1128 ;	./../../mib/stm8s_mib_debug_cmd.c: 398: mib_printf("%c", c);
      009D19 5F               [ 1] 1129 	clrw	x
      009D1A 97               [ 1] 1130 	ld	xl, a
      009D1B 89               [ 2] 1131 	pushw	x
      009D1C 4B AC            [ 1] 1132 	push	#<(___str_7+0)
      009D1E 4B 83            [ 1] 1133 	push	#((___str_7+0) >> 8)
      009D20 CD 96 B4         [ 4] 1134 	call	_mib_printf
      009D23 5B 04            [ 2] 1135 	addw	sp, #4
      009D25 20 09            [ 2] 1136 	jra	00132$
      009D27                       1137 00113$:
                                   1138 ;	./../../mib/stm8s_mib_debug_cmd.c: 400: mib_printf(".");
      009D27 4B AF            [ 1] 1139 	push	#<(___str_8+0)
      009D29 4B 83            [ 1] 1140 	push	#((___str_8+0) >> 8)
      009D2B CD 96 B4         [ 4] 1141 	call	_mib_printf
      009D2E 5B 02            [ 2] 1142 	addw	sp, #2
      009D30                       1143 00132$:
                                   1144 ;	./../../mib/stm8s_mib_debug_cmd.c: 394: for (i = 0; i < remainder; i++)
      009D30 1E 26            [ 2] 1145 	ldw	x, (0x26, sp)
      009D32 5C               [ 1] 1146 	incw	x
      009D33 1F 26            [ 2] 1147 	ldw	(0x26, sp), x
      009D35 20 CE            [ 2] 1148 	jra	00131$
      009D37                       1149 00116$:
                                   1150 ;	./../../mib/stm8s_mib_debug_cmd.c: 402: for (i = 0; i < (16 - remainder); i++)
      009D37 A6 10            [ 1] 1151 	ld	a, #0x10
      009D39 10 1A            [ 1] 1152 	sub	a, (0x1a, sp)
      009D3B 6B 25            [ 1] 1153 	ld	(0x25, sp), a
      009D3D 4F               [ 1] 1154 	clr	a
      009D3E 12 19            [ 1] 1155 	sbc	a, (0x19, sp)
      009D40 6B 24            [ 1] 1156 	ld	(0x24, sp), a
      009D42 5F               [ 1] 1157 	clrw	x
      009D43 1F 26            [ 2] 1158 	ldw	(0x26, sp), x
      009D45                       1159 00134$:
      009D45 1E 26            [ 2] 1160 	ldw	x, (0x26, sp)
      009D47 13 24            [ 2] 1161 	cpw	x, (0x24, sp)
      009D49 2E 10            [ 1] 1162 	jrsge	00117$
                                   1163 ;	./../../mib/stm8s_mib_debug_cmd.c: 404: mib_printf(" ");
      009D4B 4B AA            [ 1] 1164 	push	#<(___str_6+0)
      009D4D 4B 83            [ 1] 1165 	push	#((___str_6+0) >> 8)
      009D4F CD 96 B4         [ 4] 1166 	call	_mib_printf
      009D52 5B 02            [ 2] 1167 	addw	sp, #2
                                   1168 ;	./../../mib/stm8s_mib_debug_cmd.c: 402: for (i = 0; i < (16 - remainder); i++)
      009D54 1E 26            [ 2] 1169 	ldw	x, (0x26, sp)
      009D56 5C               [ 1] 1170 	incw	x
      009D57 1F 26            [ 2] 1171 	ldw	(0x26, sp), x
      009D59 20 EA            [ 2] 1172 	jra	00134$
      009D5B                       1173 00117$:
                                   1174 ;	./../../mib/stm8s_mib_debug_cmd.c: 407: mib_printf("\r\n");
      009D5B 4B 44            [ 1] 1175 	push	#<(___str_0+0)
      009D5D 4B 83            [ 1] 1176 	push	#((___str_0+0) >> 8)
      009D5F CD 96 B4         [ 4] 1177 	call	_mib_printf
      009D62 5B 02            [ 2] 1178 	addw	sp, #2
      009D64                       1179 00119$:
                                   1180 ;	./../../mib/stm8s_mib_debug_cmd.c: 409: return;
                                   1181 ;	./../../mib/stm8s_mib_debug_cmd.c: 410: } // HexDump.
      009D64 1E 28            [ 2] 1182 	ldw	x, (40, sp)
      009D66 5B 31            [ 2] 1183 	addw	sp, #49
      009D68 FC               [ 2] 1184 	jp	(x)
                                   1185 ;	./../../mib/stm8s_mib_debug_cmd.c: 419: int DoPrintHelp(int argc, char **argv)
                                   1186 ;	-----------------------------------------
                                   1187 ;	 function DoPrintHelp
                                   1188 ;	-----------------------------------------
      009D69                       1189 _DoPrintHelp:
      009D69 52 02            [ 2] 1190 	sub	sp, #2
                                   1191 ;	./../../mib/stm8s_mib_debug_cmd.c: 423: if (argc == 1)
      009D6B 5A               [ 2] 1192 	decw	x
      009D6C 26 39            [ 1] 1193 	jrne	00105$
                                   1194 ;	./../../mib/stm8s_mib_debug_cmd.c: 425: mib_printf("*******\r\n");
      009D6E 4B BF            [ 1] 1195 	push	#<(___str_11+0)
      009D70 4B 83            [ 1] 1196 	push	#((___str_11+0) >> 8)
      009D72 CD 96 B4         [ 4] 1197 	call	_mib_printf
      009D75 5B 02            [ 2] 1198 	addw	sp, #2
                                   1199 ;	./../../mib/stm8s_mib_debug_cmd.c: 426: mib_printf("  help  Help for commands.\r\n");
      009D77 4B C9            [ 1] 1200 	push	#<(___str_12+0)
      009D79 4B 83            [ 1] 1201 	push	#((___str_12+0) >> 8)
      009D7B CD 96 B4         [ 4] 1202 	call	_mib_printf
      009D7E 5B 02            [ 2] 1203 	addw	sp, #2
                                   1204 ;	./../../mib/stm8s_mib_debug_cmd.c: 428: for (cptr = cmdTbl; cptr->cmd; cptr++)
      009D80 AE 01 6D         [ 2] 1205 	ldw	x, #(_cmdTbl+0)
      009D83 1F 01            [ 2] 1206 	ldw	(0x01, sp), x
      009D85                       1207 00108$:
      009D85 1E 01            [ 2] 1208 	ldw	x, (0x01, sp)
      009D87 FE               [ 2] 1209 	ldw	x, (x)
      009D88 27 12            [ 1] 1210 	jreq	00103$
                                   1211 ;	./../../mib/stm8s_mib_debug_cmd.c: 430: if (cptr->usage)
      009D8A 1E 01            [ 2] 1212 	ldw	x, (0x01, sp)
      009D8C EE 04            [ 2] 1213 	ldw	x, (0x4, x)
      009D8E 27 03            [ 1] 1214 	jreq	00109$
                                   1215 ;	./../../mib/stm8s_mib_debug_cmd.c: 431: MibWriteDebugString(cptr->usage);
      009D90 CD 8C A2         [ 4] 1216 	call	_MibWriteDebugString
      009D93                       1217 00109$:
                                   1218 ;	./../../mib/stm8s_mib_debug_cmd.c: 428: for (cptr = cmdTbl; cptr->cmd; cptr++)
      009D93 1E 01            [ 2] 1219 	ldw	x, (0x01, sp)
      009D95 1C 00 06         [ 2] 1220 	addw	x, #0x0006
      009D98 1F 01            [ 2] 1221 	ldw	(0x01, sp), x
      009D9A 20 E9            [ 2] 1222 	jra	00108$
      009D9C                       1223 00103$:
                                   1224 ;	./../../mib/stm8s_mib_debug_cmd.c: 433: mib_printf("*******\r\n");
      009D9C 4B BF            [ 1] 1225 	push	#<(___str_11+0)
      009D9E 4B 83            [ 1] 1226 	push	#((___str_11+0) >> 8)
      009DA0 CD 96 B4         [ 4] 1227 	call	_mib_printf
      009DA3 5B 02            [ 2] 1228 	addw	sp, #2
      009DA5 20 1F            [ 2] 1229 	jra	00106$
      009DA7                       1230 00105$:
                                   1231 ;	./../../mib/stm8s_mib_debug_cmd.c: 437: mib_printf("\tUnknown command : ");
      009DA7 4B E6            [ 1] 1232 	push	#<(___str_13+0)
      009DA9 4B 83            [ 1] 1233 	push	#((___str_13+0) >> 8)
      009DAB CD 96 B4         [ 4] 1234 	call	_mib_printf
      009DAE 5B 02            [ 2] 1235 	addw	sp, #2
                                   1236 ;	./../../mib/stm8s_mib_debug_cmd.c: 438: mib_printf("%s", argv[0]);
      009DB0 1E 05            [ 2] 1237 	ldw	x, (0x05, sp)
      009DB2 FE               [ 2] 1238 	ldw	x, (x)
      009DB3 89               [ 2] 1239 	pushw	x
      009DB4 4B FA            [ 1] 1240 	push	#<(___str_14+0)
      009DB6 4B 83            [ 1] 1241 	push	#((___str_14+0) >> 8)
      009DB8 CD 96 B4         [ 4] 1242 	call	_mib_printf
      009DBB 5B 04            [ 2] 1243 	addw	sp, #4
                                   1244 ;	./../../mib/stm8s_mib_debug_cmd.c: 439: mib_printf("\r\n");
      009DBD 4B 44            [ 1] 1245 	push	#<(___str_0+0)
      009DBF 4B 83            [ 1] 1246 	push	#((___str_0+0) >> 8)
      009DC1 CD 96 B4         [ 4] 1247 	call	_mib_printf
      009DC4 5B 02            [ 2] 1248 	addw	sp, #2
      009DC6                       1249 00106$:
                                   1250 ;	./../../mib/stm8s_mib_debug_cmd.c: 441: return TRUE;
      009DC6 5F               [ 1] 1251 	clrw	x
      009DC7 5C               [ 1] 1252 	incw	x
                                   1253 ;	./../../mib/stm8s_mib_debug_cmd.c: 442: }
      009DC8 5B 02            [ 2] 1254 	addw	sp, #2
      009DCA 90 85            [ 2] 1255 	popw	y
      009DCC 5B 02            [ 2] 1256 	addw	sp, #2
      009DCE 90 FC            [ 2] 1257 	jp	(y)
                                   1258 ;	./../../mib/stm8s_mib_debug_cmd.c: 452: int getdec(uint8_t **ptr)
                                   1259 ;	-----------------------------------------
                                   1260 ;	 function getdec
                                   1261 ;	-----------------------------------------
      009DD0                       1262 _getdec:
      009DD0 52 06            [ 2] 1263 	sub	sp, #6
                                   1264 ;	./../../mib/stm8s_mib_debug_cmd.c: 454: uint8_t *p = *ptr;
      009DD2 1F 05            [ 2] 1265 	ldw	(0x05, sp), x
      009DD4 FE               [ 2] 1266 	ldw	x, (x)
      009DD5 1F 01            [ 2] 1267 	ldw	(0x01, sp), x
                                   1268 ;	./../../mib/stm8s_mib_debug_cmd.c: 455: int ret = 0;
      009DD7 5F               [ 1] 1269 	clrw	x
      009DD8 1F 03            [ 2] 1270 	ldw	(0x03, sp), x
                                   1271 ;	./../../mib/stm8s_mib_debug_cmd.c: 456: if ((*p < '0') || (*p > '9'))
      009DDA 1E 01            [ 2] 1272 	ldw	x, (0x01, sp)
      009DDC F6               [ 1] 1273 	ld	a, (x)
      009DDD A1 30            [ 1] 1274 	cp	a, #0x30
      009DDF 25 04            [ 1] 1275 	jrc	00101$
      009DE1 A1 39            [ 1] 1276 	cp	a, #0x39
      009DE3 23 04            [ 2] 1277 	jrule	00113$
      009DE5                       1278 00101$:
                                   1279 ;	./../../mib/stm8s_mib_debug_cmd.c: 457: return (-1);
      009DE5 5F               [ 1] 1280 	clrw	x
      009DE6 5A               [ 2] 1281 	decw	x
      009DE7 20 29            [ 2] 1282 	jra	00108$
                                   1283 ;	./../../mib/stm8s_mib_debug_cmd.c: 458: while ((*p >= '0') && (*p <= '9'))
      009DE9                       1284 00113$:
      009DE9 16 01            [ 2] 1285 	ldw	y, (0x01, sp)
      009DEB                       1286 00105$:
      009DEB 90 F6            [ 1] 1287 	ld	a, (y)
      009DED A1 30            [ 1] 1288 	cp	a, #0x30
      009DEF 25 1C            [ 1] 1289 	jrc	00107$
      009DF1 A1 39            [ 1] 1290 	cp	a, #0x39
      009DF3 22 18            [ 1] 1291 	jrugt	00107$
                                   1292 ;	./../../mib/stm8s_mib_debug_cmd.c: 460: ret = ret * 10 + (int)(*p - '0');
      009DF5 1E 03            [ 2] 1293 	ldw	x, (0x03, sp)
      009DF7 58               [ 2] 1294 	sllw	x
      009DF8 58               [ 2] 1295 	sllw	x
      009DF9 72 FB 03         [ 2] 1296 	addw	x, (0x03, sp)
      009DFC 58               [ 2] 1297 	sllw	x
      009DFD 1F 03            [ 2] 1298 	ldw	(0x03, sp), x
      009DFF 5F               [ 1] 1299 	clrw	x
      009E00 97               [ 1] 1300 	ld	xl, a
      009E01 1D 00 30         [ 2] 1301 	subw	x, #0x0030
      009E04 72 FB 03         [ 2] 1302 	addw	x, (0x03, sp)
      009E07 1F 03            [ 2] 1303 	ldw	(0x03, sp), x
                                   1304 ;	./../../mib/stm8s_mib_debug_cmd.c: 461: p++;
      009E09 90 5C            [ 1] 1305 	incw	y
      009E0B 20 DE            [ 2] 1306 	jra	00105$
      009E0D                       1307 00107$:
                                   1308 ;	./../../mib/stm8s_mib_debug_cmd.c: 463: *ptr = p;
      009E0D 1E 05            [ 2] 1309 	ldw	x, (0x05, sp)
      009E0F FF               [ 2] 1310 	ldw	(x), y
                                   1311 ;	./../../mib/stm8s_mib_debug_cmd.c: 464: return (ret);
      009E10 1E 03            [ 2] 1312 	ldw	x, (0x03, sp)
      009E12                       1313 00108$:
                                   1314 ;	./../../mib/stm8s_mib_debug_cmd.c: 465: }
      009E12 5B 06            [ 2] 1315 	addw	sp, #6
      009E14 81               [ 4] 1316 	ret
                                   1317 	.area CODE
                                   1318 	.area CONST
                                   1319 	.area CONST
      008344                       1320 ___str_0:
      008344 0D                    1321 	.db 0x0d
      008345 0A                    1322 	.db 0x0a
      008346 00                    1323 	.db 0x00
                                   1324 	.area CODE
                                   1325 	.area CONST
      008347                       1326 ___str_1:
      008347 08                    1327 	.db 0x08
      008348 20                    1328 	.ascii " "
      008349 08                    1329 	.db 0x08
      00834A 00                    1330 	.db 0x00
                                   1331 	.area CODE
                                   1332 	.area CONST
      00834B                       1333 ___str_2:
      00834B 30 78                 1334 	.ascii "0x"
      00834D 00                    1335 	.db 0x00
                                   1336 	.area CODE
                                   1337 	.area CONST
      00834E                       1338 ___str_3:
      00834E 61 64 64 72 65 73 73  1339 	.ascii "address     Hex Value                                       "
             20 20 20 20 20 48 65
             78 20 56 61 6C 75 65
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      00838A 20 41 73 63 69 69 20  1340 	.ascii " Ascii value"
             76 61 6C 75 65
      008396 0D                    1341 	.db 0x0d
      008397 0A                    1342 	.db 0x0a
      008398 00                    1343 	.db 0x00
                                   1344 	.area CODE
                                   1345 	.area CONST
      008399                       1346 ___str_4:
      008399 30 78 25 30 38 6C 78  1347 	.ascii "0x%08lx : "
             20 3A 20
      0083A3 00                    1348 	.db 0x00
                                   1349 	.area CODE
                                   1350 	.area CONST
      0083A4                       1351 ___str_5:
      0083A4 25 30 32 78 20        1352 	.ascii "%02x "
      0083A9 00                    1353 	.db 0x00
                                   1354 	.area CODE
                                   1355 	.area CONST
      0083AA                       1356 ___str_6:
      0083AA 20                    1357 	.ascii " "
      0083AB 00                    1358 	.db 0x00
                                   1359 	.area CODE
                                   1360 	.area CONST
      0083AC                       1361 ___str_7:
      0083AC 25 63                 1362 	.ascii "%c"
      0083AE 00                    1363 	.db 0x00
                                   1364 	.area CODE
                                   1365 	.area CONST
      0083AF                       1366 ___str_8:
      0083AF 2E                    1367 	.ascii "."
      0083B0 00                    1368 	.db 0x00
                                   1369 	.area CODE
                                   1370 	.area CONST
      0083B1                       1371 ___str_9:
      0083B1 30 78 25 30 38 6C 78  1372 	.ascii "0x%08lx  "
             20 20
      0083BA 00                    1373 	.db 0x00
                                   1374 	.area CODE
                                   1375 	.area CONST
      0083BB                       1376 ___str_10:
      0083BB 20 20 20              1377 	.ascii "   "
      0083BE 00                    1378 	.db 0x00
                                   1379 	.area CODE
                                   1380 	.area CONST
      0083BF                       1381 ___str_11:
      0083BF 2A 2A 2A 2A 2A 2A 2A  1382 	.ascii "*******"
      0083C6 0D                    1383 	.db 0x0d
      0083C7 0A                    1384 	.db 0x0a
      0083C8 00                    1385 	.db 0x00
                                   1386 	.area CODE
                                   1387 	.area CONST
      0083C9                       1388 ___str_12:
      0083C9 20 20 68 65 6C 70 20  1389 	.ascii "  help  Help for commands."
             20 48 65 6C 70 20 66
             6F 72 20 63 6F 6D 6D
             61 6E 64 73 2E
      0083E3 0D                    1390 	.db 0x0d
      0083E4 0A                    1391 	.db 0x0a
      0083E5 00                    1392 	.db 0x00
                                   1393 	.area CODE
                                   1394 	.area CONST
      0083E6                       1395 ___str_13:
      0083E6 09                    1396 	.db 0x09
      0083E7 55 6E 6B 6E 6F 77 6E  1397 	.ascii "Unknown command : "
             20 63 6F 6D 6D 61 6E
             64 20 3A 20
      0083F9 00                    1398 	.db 0x00
                                   1399 	.area CODE
                                   1400 	.area CONST
      0083FA                       1401 ___str_14:
      0083FA 25 73                 1402 	.ascii "%s"
      0083FC 00                    1403 	.db 0x00
                                   1404 	.area CODE
                                   1405 	.area INITIALIZER
      00891A                       1406 __xinit__cmdTbl:
      00891A 00 00                 1407 	.dw #0x0000
      00891C 00 00                 1408 	.dw #0x0000
      00891E 00 00                 1409 	.dw #0x0000
      008920 00 00                 1410 	.dw #0x0000
      008922 00 00                 1411 	.dw #0x0000
      008924 00 00                 1412 	.dw #0x0000
      008926 00 00                 1413 	.dw #0x0000
      008928 00 00                 1414 	.dw #0x0000
      00892A 00 00                 1415 	.dw #0x0000
      00892C 00 00                 1416 	.dw #0x0000
      00892E 00 00                 1417 	.dw #0x0000
      008930 00 00                 1418 	.dw #0x0000
      008932 00 00                 1419 	.dw #0x0000
      008934 00 00                 1420 	.dw #0x0000
      008936 00 00                 1421 	.dw #0x0000
      008938 00 00                 1422 	.dw #0x0000
      00893A 00 00                 1423 	.dw #0x0000
      00893C 00 00                 1424 	.dw #0x0000
                                   1425 	.area CABS (ABS)
