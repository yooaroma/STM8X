                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_eeprom_main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _cmd_test_init_before_irq_enable
                                     12 	.globl _cmd_test
                                     13 	.globl _cmd_eeprom
                                     14 	.globl _mmFlashOptionErase
                                     15 	.globl _mmFlashOptionRead
                                     16 	.globl _mmFlashOptionWrite
                                     17 	.globl _mmFlashOptionUnlock
                                     18 	.globl _mmFlashOptionLock
                                     19 	.globl _mmEepromRead
                                     20 	.globl _mmEepromWrite
                                     21 	.globl _mmEepromUnlock
                                     22 	.globl _mmEepromLock
                                     23 	.globl _HexToInt
                                     24 	.globl _mib_printf
                                     25 	.globl _MibWriteDebugString
                                     26 	.globl ___memcpy
                                     27 	.globl _strcmp
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DATA
                                     32 ;--------------------------------------------------------
                                     33 ; ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area INITIALIZED
      00014A                         36 _cmdTbl_only:
      00014A                         37 	.ds 12
                                     38 ;--------------------------------------------------------
                                     39 ; absolute external ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area DABS (ABS)
                                     42 
                                     43 ; default segment ordering for linker
                                     44 	.area HOME
                                     45 	.area GSINIT
                                     46 	.area GSFINAL
                                     47 	.area CONST
                                     48 	.area INITIALIZER
                                     49 	.area CODE
                                     50 
                                     51 ;--------------------------------------------------------
                                     52 ; global & static initialisations
                                     53 ;--------------------------------------------------------
                                     54 	.area HOME
                                     55 	.area GSINIT
                                     56 	.area GSFINAL
                                     57 	.area GSINIT
                                     58 ;--------------------------------------------------------
                                     59 ; Home
                                     60 ;--------------------------------------------------------
                                     61 	.area HOME
                                     62 	.area HOME
                                     63 ;--------------------------------------------------------
                                     64 ; code
                                     65 ;--------------------------------------------------------
                                     66 	.area CODE
                                     67 ;	stm8s_eeprom_main.c: 135: void cmd_eeprom(void)
                                     68 ;	-----------------------------------------
                                     69 ;	 function cmd_eeprom
                                     70 ;	-----------------------------------------
      008E36                         71 _cmd_eeprom:
      008E36 52 0A            [ 2]   72 	sub	sp, #10
                                     73 ;	stm8s_eeprom_main.c: 141: for (cptr = cmdTbl;; cptr++) 
      008E38 AE 01 5C         [ 2]   74 	ldw	x, #(_cmdTbl+0)
      008E3B 1F 01            [ 2]   75 	ldw	(0x01, sp), x
      008E3D 5F               [ 1]   76 	clrw	x
      008E3E 1F 07            [ 2]   77 	ldw	(0x07, sp), x
      008E40 1F 05            [ 2]   78 	ldw	(0x05, sp), x
      008E42 16 01            [ 2]   79 	ldw	y, (0x01, sp)
      008E44 17 09            [ 2]   80 	ldw	(0x09, sp), y
      008E46                         81 00106$:
                                     82 ;	stm8s_eeprom_main.c: 143: if(cptr->cmd==0)
      008E46 1E 09            [ 2]   83 	ldw	x, (0x09, sp)
      008E48 FE               [ 2]   84 	ldw	x, (x)
      008E49 1F 03            [ 2]   85 	ldw	(0x03, sp), x
      008E4B 26 19            [ 1]   86 	jrne	00102$
                                     87 ;	stm8s_eeprom_main.c: 145: ccprintf(1,("INFO:+cmd_eeprom...\r\n"));
      008E4D 4B 8F            [ 1]   88 	push	#<(__str_0+0)
      008E4F 4B 80            [ 1]   89 	push	#((__str_0+0) >> 8)
      008E51 CD 9C 98         [ 4]   90 	call	_mib_printf
      008E54 5B 02            [ 2]   91 	addw	sp, #2
                                     92 ;	stm8s_eeprom_main.c: 146: memcpy((void *)&(cptr->cmd),(void *)&(cmdTbl_only[0].cmd),sizeof(CMD_MY));
      008E56 AE 01 4A         [ 2]   93 	ldw	x, #_cmdTbl_only+0
      008E59 16 01            [ 2]   94 	ldw	y, (0x01, sp)
      008E5B 4B 06            [ 1]   95 	push	#0x06
      008E5D 4B 00            [ 1]   96 	push	#0x00
      008E5F 89               [ 2]   97 	pushw	x
      008E60 93               [ 1]   98 	ldw	x, y
      008E61 CD B0 7D         [ 4]   99 	call	___memcpy
                                    100 ;	stm8s_eeprom_main.c: 147: break;
      008E64 20 2F            [ 2]  101 	jra	00105$
      008E66                        102 00102$:
                                    103 ;	stm8s_eeprom_main.c: 149: index++;
      008E66 1E 07            [ 2]  104 	ldw	x, (0x07, sp)
      008E68 5C               [ 1]  105 	incw	x
      008E69 1F 07            [ 2]  106 	ldw	(0x07, sp), x
      008E6B 26 05            [ 1]  107 	jrne	00126$
      008E6D 1E 05            [ 2]  108 	ldw	x, (0x05, sp)
      008E6F 5C               [ 1]  109 	incw	x
      008E70 1F 05            [ 2]  110 	ldw	(0x05, sp), x
      008E72                        111 00126$:
                                    112 ;	stm8s_eeprom_main.c: 150: if(index>MAX_COMMANDS)
      008E72 AE 00 06         [ 2]  113 	ldw	x, #0x0006
      008E75 13 07            [ 2]  114 	cpw	x, (0x07, sp)
      008E77 4F               [ 1]  115 	clr	a
      008E78 12 06            [ 1]  116 	sbc	a, (0x06, sp)
      008E7A 4F               [ 1]  117 	clr	a
      008E7B 12 05            [ 1]  118 	sbc	a, (0x05, sp)
      008E7D 24 0B            [ 1]  119 	jrnc	00107$
                                    120 ;	stm8s_eeprom_main.c: 152: ccprintf(1,("INFO:-cmd_eeprom...\r\n"));
      008E7F 4B A5            [ 1]  121 	push	#<(__str_1+0)
      008E81 4B 80            [ 1]  122 	push	#((__str_1+0) >> 8)
      008E83 CD 9C 98         [ 4]  123 	call	_mib_printf
      008E86 5B 02            [ 2]  124 	addw	sp, #2
                                    125 ;	stm8s_eeprom_main.c: 153: return;
      008E88 20 0B            [ 2]  126 	jra	00108$
      008E8A                        127 00107$:
                                    128 ;	stm8s_eeprom_main.c: 141: for (cptr = cmdTbl;; cptr++) 
      008E8A 1E 09            [ 2]  129 	ldw	x, (0x09, sp)
      008E8C 1C 00 06         [ 2]  130 	addw	x, #0x0006
      008E8F 1F 09            [ 2]  131 	ldw	(0x09, sp), x
      008E91 1F 01            [ 2]  132 	ldw	(0x01, sp), x
      008E93 20 B1            [ 2]  133 	jra	00106$
      008E95                        134 00105$:
                                    135 ;	stm8s_eeprom_main.c: 156: return;
      008E95                        136 00108$:
                                    137 ;	stm8s_eeprom_main.c: 157: }
      008E95 5B 0A            [ 2]  138 	addw	sp, #10
      008E97 81               [ 4]  139 	ret
                                    140 ;	stm8s_eeprom_main.c: 162: void cmd_test(void)
                                    141 ;	-----------------------------------------
                                    142 ;	 function cmd_test
                                    143 ;	-----------------------------------------
      008E98                        144 _cmd_test:
                                    145 ;	stm8s_eeprom_main.c: 164: cmd_eeprom();
                                    146 ;	stm8s_eeprom_main.c: 165: }
      008E98 CC 8E 36         [ 2]  147 	jp	_cmd_eeprom
                                    148 ;	stm8s_eeprom_main.c: 171: void cmd_test_init_before_irq_enable(void)
                                    149 ;	-----------------------------------------
                                    150 ;	 function cmd_test_init_before_irq_enable
                                    151 ;	-----------------------------------------
      008E9B                        152 _cmd_test_init_before_irq_enable:
                                    153 ;	stm8s_eeprom_main.c: 174: }
      008E9B 81               [ 4]  154 	ret
                                    155 ;	stm8s_eeprom_main.c: 185: static int DoEEPROM(CMD_MY *cptr, int argc, char **argv)
                                    156 ;	-----------------------------------------
                                    157 ;	 function DoEEPROM
                                    158 ;	-----------------------------------------
      008E9C                        159 _DoEEPROM:
      008E9C 52 0D            [ 2]  160 	sub	sp, #13
                                    161 ;	stm8s_eeprom_main.c: 187: uint16_t vwAddr = 0;
      008E9E 0F 02            [ 1]  162 	clr	(0x02, sp)
      008EA0 0F 01            [ 1]  163 	clr	(0x01, sp)
                                    164 ;	stm8s_eeprom_main.c: 188: uint8_t vbData = 0;
      008EA2 0F 03            [ 1]  165 	clr	(0x03, sp)
                                    166 ;	stm8s_eeprom_main.c: 192: MibWriteDebugString(cptr->usage);
      008EA4 1C 00 04         [ 2]  167 	addw	x, #0x0004
      008EA7 1F 04            [ 2]  168 	ldw	(0x04, sp), x
                                    169 ;	stm8s_eeprom_main.c: 190: if (argc < 2)
      008EA9 1E 10            [ 2]  170 	ldw	x, (0x10, sp)
      008EAB A3 00 02         [ 2]  171 	cpw	x, #0x0002
      008EAE 2E 0A            [ 1]  172 	jrsge	00102$
                                    173 ;	stm8s_eeprom_main.c: 192: MibWriteDebugString(cptr->usage);
      008EB0 1E 04            [ 2]  174 	ldw	x, (0x04, sp)
      008EB2 FE               [ 2]  175 	ldw	x, (x)
      008EB3 CD 92 86         [ 4]  176 	call	_MibWriteDebugString
                                    177 ;	stm8s_eeprom_main.c: 193: return FALSE;
      008EB6 5F               [ 1]  178 	clrw	x
      008EB7 CC 92 63         [ 2]  179 	jp	00172$
      008EBA                        180 00102$:
                                    181 ;	stm8s_eeprom_main.c: 198: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      008EBA 1E 12            [ 2]  182 	ldw	x, (0x12, sp)
      008EBC 5C               [ 1]  183 	incw	x
      008EBD 5C               [ 1]  184 	incw	x
      008EBE 1F 06            [ 2]  185 	ldw	(0x06, sp), x
      008EC0 FE               [ 2]  186 	ldw	x, (x)
      008EC1 4B BB            [ 1]  187 	push	#<(___str_2+0)
      008EC3 4B 80            [ 1]  188 	push	#((___str_2+0) >> 8)
      008EC5 CD B1 01         [ 4]  189 	call	_strcmp
      008EC8 51               [ 1]  190 	exgw	x, y
                                    191 ;	stm8s_eeprom_main.c: 200: if (argc < 4)
      008EC9 1E 10            [ 2]  192 	ldw	x, (0x10, sp)
      008ECB A3 00 04         [ 2]  193 	cpw	x, #0x0004
      008ECE 2F 04            [ 1]  194 	jrslt	00315$
      008ED0 0F 08            [ 1]  195 	clr	(0x08, sp)
      008ED2 20 04            [ 2]  196 	jra	00316$
      008ED4                        197 00315$:
      008ED4 A6 01            [ 1]  198 	ld	a, #0x01
      008ED6 6B 08            [ 1]  199 	ld	(0x08, sp), a
      008ED8                        200 00316$:
                                    201 ;	stm8s_eeprom_main.c: 205: if (!HexToInt(argv[2], &vwAddr, 16))
      008ED8 1E 12            [ 2]  202 	ldw	x, (0x12, sp)
      008EDA 1C 00 04         [ 2]  203 	addw	x, #0x0004
      008EDD 1F 09            [ 2]  204 	ldw	(0x09, sp), x
                                    205 ;	stm8s_eeprom_main.c: 210: if (!HexToInt(argv[3], &vbData, 8))
      008EDF 1E 12            [ 2]  206 	ldw	x, (0x12, sp)
      008EE1 1C 00 06         [ 2]  207 	addw	x, #0x0006
      008EE4 1F 0B            [ 2]  208 	ldw	(0x0b, sp), x
                                    209 ;	stm8s_eeprom_main.c: 198: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
      008EE6 90 5D            [ 2]  210 	tnzw	y
      008EE8 27 03            [ 1]  211 	jreq	00317$
      008EEA CC 8F 6B         [ 2]  212 	jp	00170$
      008EED                        213 00317$:
                                    214 ;	stm8s_eeprom_main.c: 200: if (argc < 4)
      008EED 0D 08            [ 1]  215 	tnz	(0x08, sp)
      008EEF 27 0A            [ 1]  216 	jreq	00104$
                                    217 ;	stm8s_eeprom_main.c: 202: MibWriteDebugString(cptr->usage);
      008EF1 1E 04            [ 2]  218 	ldw	x, (0x04, sp)
      008EF3 FE               [ 2]  219 	ldw	x, (x)
      008EF4 CD 92 86         [ 4]  220 	call	_MibWriteDebugString
                                    221 ;	stm8s_eeprom_main.c: 203: return FALSE;
      008EF7 5F               [ 1]  222 	clrw	x
      008EF8 CC 92 63         [ 2]  223 	jp	00172$
      008EFB                        224 00104$:
                                    225 ;	stm8s_eeprom_main.c: 205: if (!HexToInt(argv[2], &vwAddr, 16))
      008EFB 96               [ 1]  226 	ldw	x, sp
      008EFC 5C               [ 1]  227 	incw	x
      008EFD 16 09            [ 2]  228 	ldw	y, (0x09, sp)
      008EFF 90 FE            [ 2]  229 	ldw	y, (y)
      008F01 4B 10            [ 1]  230 	push	#0x10
      008F03 4B 00            [ 1]  231 	push	#0x00
      008F05 89               [ 2]  232 	pushw	x
      008F06 93               [ 1]  233 	ldw	x, y
      008F07 CD 9F 99         [ 4]  234 	call	_HexToInt
      008F0A 5D               [ 2]  235 	tnzw	x
      008F0B 26 0D            [ 1]  236 	jrne	00106$
                                    237 ;	stm8s_eeprom_main.c: 207: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008F0D 4B C1            [ 1]  238 	push	#<(__str_3+0)
      008F0F 4B 80            [ 1]  239 	push	#((__str_3+0) >> 8)
      008F11 CD 9C 98         [ 4]  240 	call	_mib_printf
      008F14 5B 02            [ 2]  241 	addw	sp, #2
                                    242 ;	stm8s_eeprom_main.c: 208: return FALSE;
      008F16 5F               [ 1]  243 	clrw	x
      008F17 CC 92 63         [ 2]  244 	jp	00172$
      008F1A                        245 00106$:
                                    246 ;	stm8s_eeprom_main.c: 210: if (!HexToInt(argv[3], &vbData, 8))
      008F1A 96               [ 1]  247 	ldw	x, sp
      008F1B 1C 00 03         [ 2]  248 	addw	x, #3
      008F1E 16 0B            [ 2]  249 	ldw	y, (0x0b, sp)
      008F20 90 FE            [ 2]  250 	ldw	y, (y)
      008F22 4B 08            [ 1]  251 	push	#0x08
      008F24 4B 00            [ 1]  252 	push	#0x00
      008F26 89               [ 2]  253 	pushw	x
      008F27 93               [ 1]  254 	ldw	x, y
      008F28 CD 9F 99         [ 4]  255 	call	_HexToInt
      008F2B 5D               [ 2]  256 	tnzw	x
      008F2C 26 0D            [ 1]  257 	jrne	00108$
                                    258 ;	stm8s_eeprom_main.c: 212: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008F2E 4B C1            [ 1]  259 	push	#<(__str_3+0)
      008F30 4B 80            [ 1]  260 	push	#((__str_3+0) >> 8)
      008F32 CD 9C 98         [ 4]  261 	call	_mib_printf
      008F35 5B 02            [ 2]  262 	addw	sp, #2
                                    263 ;	stm8s_eeprom_main.c: 213: return FALSE;
      008F37 5F               [ 1]  264 	clrw	x
      008F38 CC 92 63         [ 2]  265 	jp	00172$
      008F3B                        266 00108$:
                                    267 ;	stm8s_eeprom_main.c: 216: if(mmEepromWrite(vwAddr, vbData)==0)
      008F3B 7B 03            [ 1]  268 	ld	a, (0x03, sp)
      008F3D 1E 01            [ 2]  269 	ldw	x, (0x01, sp)
      008F3F CD AD 8B         [ 4]  270 	call	_mmEepromWrite
                                    271 ;	stm8s_eeprom_main.c: 219: ccprintf(_DEBUG_CMD_A_,("mmEepromWrite ERROR!!!: 0x%04x[0x%02x]\r\n", vwAddr,vbData));
      008F42 5F               [ 1]  272 	clrw	x
      008F43 41               [ 1]  273 	exg	a, xl
      008F44 7B 03            [ 1]  274 	ld	a, (0x03, sp)
      008F46 41               [ 1]  275 	exg	a, xl
                                    276 ;	stm8s_eeprom_main.c: 216: if(mmEepromWrite(vwAddr, vbData)==0)
      008F47 4D               [ 1]  277 	tnz	a
      008F48 26 11            [ 1]  278 	jrne	00110$
                                    279 ;	stm8s_eeprom_main.c: 219: ccprintf(_DEBUG_CMD_A_,("mmEepromWrite ERROR!!!: 0x%04x[0x%02x]\r\n", vwAddr,vbData));
      008F4A 89               [ 2]  280 	pushw	x
      008F4B 1E 03            [ 2]  281 	ldw	x, (0x03, sp)
      008F4D 89               [ 2]  282 	pushw	x
      008F4E 4B DE            [ 1]  283 	push	#<(__str_4+0)
      008F50 4B 80            [ 1]  284 	push	#((__str_4+0) >> 8)
      008F52 CD 9C 98         [ 4]  285 	call	_mib_printf
      008F55 5B 06            [ 2]  286 	addw	sp, #6
                                    287 ;	stm8s_eeprom_main.c: 220: return 0; // false...
      008F57 5F               [ 1]  288 	clrw	x
      008F58 CC 92 63         [ 2]  289 	jp	00172$
      008F5B                        290 00110$:
                                    291 ;	stm8s_eeprom_main.c: 224: ccprintf(_DEBUG_CMD_A_,("mmEepromWrite OK!!!: 0x%04x[0x%02x]\r\n", vwAddr,vbData));
      008F5B 89               [ 2]  292 	pushw	x
      008F5C 1E 03            [ 2]  293 	ldw	x, (0x03, sp)
      008F5E 89               [ 2]  294 	pushw	x
      008F5F 4B 07            [ 1]  295 	push	#<(__str_5+0)
      008F61 4B 81            [ 1]  296 	push	#((__str_5+0) >> 8)
      008F63 CD 9C 98         [ 4]  297 	call	_mib_printf
      008F66 5B 06            [ 2]  298 	addw	sp, #6
      008F68 CC 92 61         [ 2]  299 	jp	00171$
      008F6B                        300 00170$:
                                    301 ;	stm8s_eeprom_main.c: 230: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      008F6B 1E 06            [ 2]  302 	ldw	x, (0x06, sp)
      008F6D FE               [ 2]  303 	ldw	x, (x)
      008F6E 4B 2D            [ 1]  304 	push	#<(___str_6+0)
      008F70 4B 81            [ 1]  305 	push	#((___str_6+0) >> 8)
      008F72 CD B1 01         [ 4]  306 	call	_strcmp
      008F75 51               [ 1]  307 	exgw	x, y
                                    308 ;	stm8s_eeprom_main.c: 232: if (argc < 3)
      008F76 1E 10            [ 2]  309 	ldw	x, (0x10, sp)
      008F78 A3 00 03         [ 2]  310 	cpw	x, #0x0003
      008F7B 2F 04            [ 1]  311 	jrslt	00322$
      008F7D 0F 0D            [ 1]  312 	clr	(0x0d, sp)
      008F7F 20 04            [ 2]  313 	jra	00323$
      008F81                        314 00322$:
      008F81 A6 01            [ 1]  315 	ld	a, #0x01
      008F83 6B 0D            [ 1]  316 	ld	(0x0d, sp), a
      008F85                        317 00323$:
                                    318 ;	stm8s_eeprom_main.c: 230: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
      008F85 90 5D            [ 2]  319 	tnzw	y
      008F87 26 46            [ 1]  320 	jrne	00167$
                                    321 ;	stm8s_eeprom_main.c: 232: if (argc < 3)
      008F89 0D 0D            [ 1]  322 	tnz	(0x0d, sp)
      008F8B 27 0A            [ 1]  323 	jreq	00113$
                                    324 ;	stm8s_eeprom_main.c: 234: MibWriteDebugString(cptr->usage);
      008F8D 1E 04            [ 2]  325 	ldw	x, (0x04, sp)
      008F8F FE               [ 2]  326 	ldw	x, (x)
      008F90 CD 92 86         [ 4]  327 	call	_MibWriteDebugString
                                    328 ;	stm8s_eeprom_main.c: 235: return FALSE;
      008F93 5F               [ 1]  329 	clrw	x
      008F94 CC 92 63         [ 2]  330 	jp	00172$
      008F97                        331 00113$:
                                    332 ;	stm8s_eeprom_main.c: 237: if (!HexToInt(argv[2], &vwAddr, 16))
      008F97 96               [ 1]  333 	ldw	x, sp
      008F98 5C               [ 1]  334 	incw	x
      008F99 16 09            [ 2]  335 	ldw	y, (0x09, sp)
      008F9B 90 FE            [ 2]  336 	ldw	y, (y)
      008F9D 4B 10            [ 1]  337 	push	#0x10
      008F9F 4B 00            [ 1]  338 	push	#0x00
      008FA1 89               [ 2]  339 	pushw	x
      008FA2 93               [ 1]  340 	ldw	x, y
      008FA3 CD 9F 99         [ 4]  341 	call	_HexToInt
      008FA6 5D               [ 2]  342 	tnzw	x
      008FA7 26 0D            [ 1]  343 	jrne	00115$
                                    344 ;	stm8s_eeprom_main.c: 239: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      008FA9 4B C1            [ 1]  345 	push	#<(__str_3+0)
      008FAB 4B 80            [ 1]  346 	push	#((__str_3+0) >> 8)
      008FAD CD 9C 98         [ 4]  347 	call	_mib_printf
      008FB0 5B 02            [ 2]  348 	addw	sp, #2
                                    349 ;	stm8s_eeprom_main.c: 240: return FALSE;
      008FB2 5F               [ 1]  350 	clrw	x
      008FB3 CC 92 63         [ 2]  351 	jp	00172$
      008FB6                        352 00115$:
                                    353 ;	stm8s_eeprom_main.c: 244: vbData = mmEepromRead(vwAddr);
      008FB6 1E 01            [ 2]  354 	ldw	x, (0x01, sp)
      008FB8 CD AD C5         [ 4]  355 	call	_mmEepromRead
      008FBB 6B 03            [ 1]  356 	ld	(0x03, sp), a
                                    357 ;	stm8s_eeprom_main.c: 246: ccprintf(_DEBUG_CMD_A_,("mmEepromRead : 0x%04x[0x%02x]\r\n", vwAddr,vbData));
      008FBD 5F               [ 1]  358 	clrw	x
      008FBE 97               [ 1]  359 	ld	xl, a
      008FBF 89               [ 2]  360 	pushw	x
      008FC0 1E 03            [ 2]  361 	ldw	x, (0x03, sp)
      008FC2 89               [ 2]  362 	pushw	x
      008FC3 4B 32            [ 1]  363 	push	#<(__str_7+0)
      008FC5 4B 81            [ 1]  364 	push	#((__str_7+0) >> 8)
      008FC7 CD 9C 98         [ 4]  365 	call	_mib_printf
      008FCA 5B 06            [ 2]  366 	addw	sp, #6
      008FCC CC 92 61         [ 2]  367 	jp	00171$
      008FCF                        368 00167$:
                                    369 ;	stm8s_eeprom_main.c: 251: else if (!strcmp(argv[1], "init")) // _CMD_MY_READ_
      008FCF 1E 06            [ 2]  370 	ldw	x, (0x06, sp)
      008FD1 FE               [ 2]  371 	ldw	x, (x)
      008FD2 4B 52            [ 1]  372 	push	#<(___str_8+0)
      008FD4 4B 81            [ 1]  373 	push	#((___str_8+0) >> 8)
      008FD6 CD B1 01         [ 4]  374 	call	_strcmp
      008FD9 5D               [ 2]  375 	tnzw	x
      008FDA 26 1F            [ 1]  376 	jrne	00164$
                                    377 ;	stm8s_eeprom_main.c: 253: if(mmEepromUnlock()==0)
      008FDC CD AD 56         [ 4]  378 	call	_mmEepromUnlock
      008FDF 4D               [ 1]  379 	tnz	a
      008FE0 26 0D            [ 1]  380 	jrne	00117$
                                    381 ;	stm8s_eeprom_main.c: 256: ccprintf(_DEBUG_CMD_A_, ("eeprom init ERROR!!!....mmEepromUnlock()\r\n"));		
      008FE2 4B 57            [ 1]  382 	push	#<(__str_9+0)
      008FE4 4B 81            [ 1]  383 	push	#((__str_9+0) >> 8)
      008FE6 CD 9C 98         [ 4]  384 	call	_mib_printf
      008FE9 5B 02            [ 2]  385 	addw	sp, #2
                                    386 ;	stm8s_eeprom_main.c: 257: return FALSE;
      008FEB 5F               [ 1]  387 	clrw	x
      008FEC CC 92 63         [ 2]  388 	jp	00172$
      008FEF                        389 00117$:
                                    390 ;	stm8s_eeprom_main.c: 261: ccprintf(_DEBUG_CMD_A_, ("eeprom init OK!!!....mmEepromUnlock()\r\n"));		
      008FEF 4B 82            [ 1]  391 	push	#<(__str_10+0)
      008FF1 4B 81            [ 1]  392 	push	#((__str_10+0) >> 8)
      008FF3 CD 9C 98         [ 4]  393 	call	_mib_printf
      008FF6 5B 02            [ 2]  394 	addw	sp, #2
      008FF8 CC 92 61         [ 2]  395 	jp	00171$
      008FFB                        396 00164$:
                                    397 ;	stm8s_eeprom_main.c: 267: else if (!strcmp(argv[1], "lock")) // _CMD_MY_READ_
      008FFB 1E 06            [ 2]  398 	ldw	x, (0x06, sp)
      008FFD FE               [ 2]  399 	ldw	x, (x)
      008FFE 4B AA            [ 1]  400 	push	#<(___str_11+0)
      009000 4B 81            [ 1]  401 	push	#((___str_11+0) >> 8)
      009002 CD B1 01         [ 4]  402 	call	_strcmp
      009005 5D               [ 2]  403 	tnzw	x
      009006 26 0F            [ 1]  404 	jrne	00161$
                                    405 ;	stm8s_eeprom_main.c: 269: ccprintf(_DEBUG_CMD_A_, ("eeprom lock....mmEepromLock()\r\n"));		
      009008 4B AF            [ 1]  406 	push	#<(__str_12+0)
      00900A 4B 81            [ 1]  407 	push	#((__str_12+0) >> 8)
      00900C CD 9C 98         [ 4]  408 	call	_mib_printf
      00900F 5B 02            [ 2]  409 	addw	sp, #2
                                    410 ;	stm8s_eeprom_main.c: 270: mmEepromLock();
      009011 CD AD 86         [ 4]  411 	call	_mmEepromLock
      009014 CC 92 61         [ 2]  412 	jp	00171$
      009017                        413 00161$:
                                    414 ;	stm8s_eeprom_main.c: 275: else if (!strcmp(argv[1], "help")) // _CMD_MY_READ_
      009017 1E 06            [ 2]  415 	ldw	x, (0x06, sp)
      009019 FE               [ 2]  416 	ldw	x, (x)
      00901A 4B CF            [ 1]  417 	push	#<(___str_13+0)
      00901C 4B 81            [ 1]  418 	push	#((___str_13+0) >> 8)
      00901E CD B1 01         [ 4]  419 	call	_strcmp
      009021 5D               [ 2]  420 	tnzw	x
      009022 27 03            [ 1]  421 	jreq	00330$
      009024 CC 90 C6         [ 2]  422 	jp	00158$
      009027                        423 00330$:
                                    424 ;	stm8s_eeprom_main.c: 277: ccprintf(_DEBUG_CMD_A_, ("FLASH_PROG_START_PHYSICAL_ADDRESS  [0x%08lx]\r\n",FLASH_PROG_START_PHYSICAL_ADDRESS  ));		
      009027 4B 00            [ 1]  425 	push	#0x00
      009029 4B 80            [ 1]  426 	push	#0x80
      00902B 5F               [ 1]  427 	clrw	x
      00902C 89               [ 2]  428 	pushw	x
      00902D 4B D4            [ 1]  429 	push	#<(__str_14+0)
      00902F 4B 81            [ 1]  430 	push	#((__str_14+0) >> 8)
      009031 CD 9C 98         [ 4]  431 	call	_mib_printf
      009034 5B 06            [ 2]  432 	addw	sp, #6
                                    433 ;	stm8s_eeprom_main.c: 278: ccprintf(_DEBUG_CMD_A_, ("FLASH_PROG_END_PHYSICAL_ADDRESS    [0x%08lx]\r\n",FLASH_PROG_END_PHYSICAL_ADDRESS    ));		
      009036 4B FF            [ 1]  434 	push	#0xff
      009038 4B FF            [ 1]  435 	push	#0xff
      00903A 5F               [ 1]  436 	clrw	x
      00903B 89               [ 2]  437 	pushw	x
      00903C 4B 03            [ 1]  438 	push	#<(__str_15+0)
      00903E 4B 82            [ 1]  439 	push	#((__str_15+0) >> 8)
      009040 CD 9C 98         [ 4]  440 	call	_mib_printf
      009043 5B 06            [ 2]  441 	addw	sp, #6
                                    442 ;	stm8s_eeprom_main.c: 279: ccprintf(_DEBUG_CMD_A_, ("FLASH_PROG_BLOCKS_NUMBER           [%d]\r\n" ,FLASH_PROG_BLOCKS_NUMBER             ));		
      009045 4B 00            [ 1]  443 	push	#0x00
      009047 4B 01            [ 1]  444 	push	#0x01
      009049 4B 32            [ 1]  445 	push	#<(__str_16+0)
      00904B 4B 82            [ 1]  446 	push	#((__str_16+0) >> 8)
      00904D CD 9C 98         [ 4]  447 	call	_mib_printf
      009050 5B 04            [ 2]  448 	addw	sp, #4
                                    449 ;	stm8s_eeprom_main.c: 280: ccprintf(_DEBUG_CMD_A_, ("FLASH_DATA_START_PHYSICAL_ADDRESS  [0x%08lx]\r\n",FLASH_DATA_START_PHYSICAL_ADDRESS));		
      009052 4B 00            [ 1]  450 	push	#0x00
      009054 4B 40            [ 1]  451 	push	#0x40
      009056 5F               [ 1]  452 	clrw	x
      009057 89               [ 2]  453 	pushw	x
      009058 4B 5C            [ 1]  454 	push	#<(__str_17+0)
      00905A 4B 82            [ 1]  455 	push	#((__str_17+0) >> 8)
      00905C CD 9C 98         [ 4]  456 	call	_mib_printf
      00905F 5B 06            [ 2]  457 	addw	sp, #6
                                    458 ;	stm8s_eeprom_main.c: 281: ccprintf(_DEBUG_CMD_A_, ("FLASH_DATA_END_PHYSICAL_ADDRESS    [0x%08lx]\r\n",FLASH_DATA_END_PHYSICAL_ADDRESS  ));		
      009061 4B FF            [ 1]  459 	push	#0xff
      009063 4B 43            [ 1]  460 	push	#0x43
      009065 5F               [ 1]  461 	clrw	x
      009066 89               [ 2]  462 	pushw	x
      009067 4B 8B            [ 1]  463 	push	#<(__str_18+0)
      009069 4B 82            [ 1]  464 	push	#((__str_18+0) >> 8)
      00906B CD 9C 98         [ 4]  465 	call	_mib_printf
      00906E 5B 06            [ 2]  466 	addw	sp, #6
                                    467 ;	stm8s_eeprom_main.c: 282: ccprintf(_DEBUG_CMD_A_, ("FLASH_DATA_BLOCKS_NUMBER           [%d]\r\n" ,FLASH_DATA_BLOCKS_NUMBER      ));		
      009070 4B 08            [ 1]  468 	push	#0x08
      009072 4B 00            [ 1]  469 	push	#0x00
      009074 4B BA            [ 1]  470 	push	#<(__str_19+0)
      009076 4B 82            [ 1]  471 	push	#((__str_19+0) >> 8)
      009078 CD 9C 98         [ 4]  472 	call	_mib_printf
      00907B 5B 04            [ 2]  473 	addw	sp, #4
                                    474 ;	stm8s_eeprom_main.c: 283: ccprintf(_DEBUG_CMD_A_, ("FLASH_BLOCK_SIZE                   [%d]\r\n" ,(uint16_t)FLASH_BLOCK_SIZE       ));		
      00907D 4B 80            [ 1]  475 	push	#0x80
      00907F 4B 00            [ 1]  476 	push	#0x00
      009081 4B E4            [ 1]  477 	push	#<(__str_20+0)
      009083 4B 82            [ 1]  478 	push	#((__str_20+0) >> 8)
      009085 CD 9C 98         [ 4]  479 	call	_mib_printf
      009088 5B 04            [ 2]  480 	addw	sp, #4
                                    481 ;	stm8s_eeprom_main.c: 284: ccprintf(_DEBUG_CMD_A_, ("OPTION_BYTE_START_PHYSICAL_ADDRESS [0x%08lx]\r\n",(uint32_t)OPTION_BYTE_START_PHYSICAL_ADDRESS));		
      00908A 4B 00            [ 1]  482 	push	#0x00
      00908C 4B 48            [ 1]  483 	push	#0x48
      00908E 5F               [ 1]  484 	clrw	x
      00908F 89               [ 2]  485 	pushw	x
      009090 4B 0E            [ 1]  486 	push	#<(__str_21+0)
      009092 4B 83            [ 1]  487 	push	#((__str_21+0) >> 8)
      009094 CD 9C 98         [ 4]  488 	call	_mib_printf
      009097 5B 06            [ 2]  489 	addw	sp, #6
                                    490 ;	stm8s_eeprom_main.c: 285: ccprintf(_DEBUG_CMD_A_, ("OPTION_BYTE_END_PHYSICAL_ADDRESS   [0x%08lx]\r\n",(uint32_t)OPTION_BYTE_END_PHYSICAL_ADDRESS  ));		
      009099 4B 7F            [ 1]  491 	push	#0x7f
      00909B 4B 48            [ 1]  492 	push	#0x48
      00909D 5F               [ 1]  493 	clrw	x
      00909E 89               [ 2]  494 	pushw	x
      00909F 4B 3D            [ 1]  495 	push	#<(__str_22+0)
      0090A1 4B 83            [ 1]  496 	push	#((__str_22+0) >> 8)
      0090A3 CD 9C 98         [ 4]  497 	call	_mib_printf
      0090A6 5B 06            [ 2]  498 	addw	sp, #6
                                    499 ;	stm8s_eeprom_main.c: 286: ccprintf(_DEBUG_CMD_A_, (" eeprom help\r\n eeprom init\r\n eeprom write 100 aa\r\n eeprom read 100\r\n eeprom lock\r\n"));	
      0090A8 4B 6C            [ 1]  500 	push	#<(__str_23+0)
      0090AA 4B 83            [ 1]  501 	push	#((__str_23+0) >> 8)
      0090AC CD 9C 98         [ 4]  502 	call	_mib_printf
      0090AF 5B 02            [ 2]  503 	addw	sp, #2
                                    504 ;	stm8s_eeprom_main.c: 287: ccprintf(_DEBUG_CMD_A_, (" eeprom oinit\r\n eeprom oread 4803\r\n eeprom owrite 4803 80\r\n eeprom oerase 4803\r\n eeprom olock\r\n"));	
      0090B1 4B BF            [ 1]  505 	push	#<(__str_24+0)
      0090B3 4B 83            [ 1]  506 	push	#((__str_24+0) >> 8)
      0090B5 CD 9C 98         [ 4]  507 	call	_mib_printf
      0090B8 5B 02            [ 2]  508 	addw	sp, #2
                                    509 ;	stm8s_eeprom_main.c: 288: ccprintf(_DEBUG_CMD_A_, (" https://www.st.com/resource/en/datasheet/stm8s105c6.pdf page 46, AFR7 (beep) / page 29 PD4 (BEEP output, AFR7 bit)\r\n"));		
      0090BA 4B 1F            [ 1]  510 	push	#<(__str_25+0)
      0090BC 4B 84            [ 1]  511 	push	#((__str_25+0) >> 8)
      0090BE CD 9C 98         [ 4]  512 	call	_mib_printf
      0090C1 5B 02            [ 2]  513 	addw	sp, #2
      0090C3 CC 92 61         [ 2]  514 	jp	00171$
      0090C6                        515 00158$:
                                    516 ;	stm8s_eeprom_main.c: 294: else if (!strcmp(argv[1], "owrite")) // _CMD_MY_WRITE_
      0090C6 1E 06            [ 2]  517 	ldw	x, (0x06, sp)
      0090C8 FE               [ 2]  518 	ldw	x, (x)
      0090C9 4B 95            [ 1]  519 	push	#<(___str_26+0)
      0090CB 4B 84            [ 1]  520 	push	#((___str_26+0) >> 8)
      0090CD CD B1 01         [ 4]  521 	call	_strcmp
      0090D0 5D               [ 2]  522 	tnzw	x
      0090D1 27 03            [ 1]  523 	jreq	00331$
      0090D3 CC 91 54         [ 2]  524 	jp	00155$
      0090D6                        525 00331$:
                                    526 ;	stm8s_eeprom_main.c: 296: if (argc < 4)
      0090D6 0D 08            [ 1]  527 	tnz	(0x08, sp)
      0090D8 27 0A            [ 1]  528 	jreq	00120$
                                    529 ;	stm8s_eeprom_main.c: 298: MibWriteDebugString(cptr->usage);
      0090DA 1E 04            [ 2]  530 	ldw	x, (0x04, sp)
      0090DC FE               [ 2]  531 	ldw	x, (x)
      0090DD CD 92 86         [ 4]  532 	call	_MibWriteDebugString
                                    533 ;	stm8s_eeprom_main.c: 299: return FALSE;
      0090E0 5F               [ 1]  534 	clrw	x
      0090E1 CC 92 63         [ 2]  535 	jp	00172$
      0090E4                        536 00120$:
                                    537 ;	stm8s_eeprom_main.c: 301: if (!HexToInt(argv[2], &vwAddr, 16))
      0090E4 96               [ 1]  538 	ldw	x, sp
      0090E5 5C               [ 1]  539 	incw	x
      0090E6 16 09            [ 2]  540 	ldw	y, (0x09, sp)
      0090E8 90 FE            [ 2]  541 	ldw	y, (y)
      0090EA 4B 10            [ 1]  542 	push	#0x10
      0090EC 4B 00            [ 1]  543 	push	#0x00
      0090EE 89               [ 2]  544 	pushw	x
      0090EF 93               [ 1]  545 	ldw	x, y
      0090F0 CD 9F 99         [ 4]  546 	call	_HexToInt
      0090F3 5D               [ 2]  547 	tnzw	x
      0090F4 26 0D            [ 1]  548 	jrne	00122$
                                    549 ;	stm8s_eeprom_main.c: 303: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      0090F6 4B C1            [ 1]  550 	push	#<(__str_3+0)
      0090F8 4B 80            [ 1]  551 	push	#((__str_3+0) >> 8)
      0090FA CD 9C 98         [ 4]  552 	call	_mib_printf
      0090FD 5B 02            [ 2]  553 	addw	sp, #2
                                    554 ;	stm8s_eeprom_main.c: 304: return FALSE;
      0090FF 5F               [ 1]  555 	clrw	x
      009100 CC 92 63         [ 2]  556 	jp	00172$
      009103                        557 00122$:
                                    558 ;	stm8s_eeprom_main.c: 306: if (!HexToInt(argv[3], &vbData, 8))
      009103 96               [ 1]  559 	ldw	x, sp
      009104 1C 00 03         [ 2]  560 	addw	x, #3
      009107 16 0B            [ 2]  561 	ldw	y, (0x0b, sp)
      009109 90 FE            [ 2]  562 	ldw	y, (y)
      00910B 4B 08            [ 1]  563 	push	#0x08
      00910D 4B 00            [ 1]  564 	push	#0x00
      00910F 89               [ 2]  565 	pushw	x
      009110 93               [ 1]  566 	ldw	x, y
      009111 CD 9F 99         [ 4]  567 	call	_HexToInt
      009114 5D               [ 2]  568 	tnzw	x
      009115 26 0D            [ 1]  569 	jrne	00124$
                                    570 ;	stm8s_eeprom_main.c: 308: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009117 4B C1            [ 1]  571 	push	#<(__str_3+0)
      009119 4B 80            [ 1]  572 	push	#((__str_3+0) >> 8)
      00911B CD 9C 98         [ 4]  573 	call	_mib_printf
      00911E 5B 02            [ 2]  574 	addw	sp, #2
                                    575 ;	stm8s_eeprom_main.c: 309: return FALSE;
      009120 5F               [ 1]  576 	clrw	x
      009121 CC 92 63         [ 2]  577 	jp	00172$
      009124                        578 00124$:
                                    579 ;	stm8s_eeprom_main.c: 312: if(mmFlashOptionWrite(vwAddr, vbData)==0)
      009124 7B 03            [ 1]  580 	ld	a, (0x03, sp)
      009126 1E 01            [ 2]  581 	ldw	x, (0x01, sp)
      009128 CD AE 05         [ 4]  582 	call	_mmFlashOptionWrite
                                    583 ;	stm8s_eeprom_main.c: 219: ccprintf(_DEBUG_CMD_A_,("mmEepromWrite ERROR!!!: 0x%04x[0x%02x]\r\n", vwAddr,vbData));
      00912B 5F               [ 1]  584 	clrw	x
      00912C 41               [ 1]  585 	exg	a, xl
      00912D 7B 03            [ 1]  586 	ld	a, (0x03, sp)
      00912F 41               [ 1]  587 	exg	a, xl
                                    588 ;	stm8s_eeprom_main.c: 312: if(mmFlashOptionWrite(vwAddr, vbData)==0)
      009130 4D               [ 1]  589 	tnz	a
      009131 26 11            [ 1]  590 	jrne	00126$
                                    591 ;	stm8s_eeprom_main.c: 315: ccprintf(_DEBUG_CMD_A_,("mmFlashOptionWrite ERROR!!!: 0x%04x[0x%02x]\r\n", vwAddr,vbData));
      009133 89               [ 2]  592 	pushw	x
      009134 1E 03            [ 2]  593 	ldw	x, (0x03, sp)
      009136 89               [ 2]  594 	pushw	x
      009137 4B 9C            [ 1]  595 	push	#<(__str_27+0)
      009139 4B 84            [ 1]  596 	push	#((__str_27+0) >> 8)
      00913B CD 9C 98         [ 4]  597 	call	_mib_printf
      00913E 5B 06            [ 2]  598 	addw	sp, #6
                                    599 ;	stm8s_eeprom_main.c: 316: return 0; // false...
      009140 5F               [ 1]  600 	clrw	x
      009141 CC 92 63         [ 2]  601 	jp	00172$
      009144                        602 00126$:
                                    603 ;	stm8s_eeprom_main.c: 320: ccprintf(_DEBUG_CMD_A_,("mmFlashOptionWrite OK!!!: 0x%04x[0x%02x]\r\n", vwAddr,vbData));
      009144 89               [ 2]  604 	pushw	x
      009145 1E 03            [ 2]  605 	ldw	x, (0x03, sp)
      009147 89               [ 2]  606 	pushw	x
      009148 4B CA            [ 1]  607 	push	#<(__str_28+0)
      00914A 4B 84            [ 1]  608 	push	#((__str_28+0) >> 8)
      00914C CD 9C 98         [ 4]  609 	call	_mib_printf
      00914F 5B 06            [ 2]  610 	addw	sp, #6
      009151 CC 92 61         [ 2]  611 	jp	00171$
      009154                        612 00155$:
                                    613 ;	stm8s_eeprom_main.c: 326: else if (!strcmp(argv[1], "oread")) // _CMD_MY_READ_
      009154 1E 06            [ 2]  614 	ldw	x, (0x06, sp)
      009156 FE               [ 2]  615 	ldw	x, (x)
      009157 4B F5            [ 1]  616 	push	#<(___str_29+0)
      009159 4B 84            [ 1]  617 	push	#((___str_29+0) >> 8)
      00915B CD B1 01         [ 4]  618 	call	_strcmp
      00915E 5D               [ 2]  619 	tnzw	x
      00915F 26 42            [ 1]  620 	jrne	00152$
                                    621 ;	stm8s_eeprom_main.c: 329: if (argc < 3)
      009161 0D 0D            [ 1]  622 	tnz	(0x0d, sp)
      009163 27 0A            [ 1]  623 	jreq	00129$
                                    624 ;	stm8s_eeprom_main.c: 331: MibWriteDebugString(cptr->usage);
      009165 1E 04            [ 2]  625 	ldw	x, (0x04, sp)
      009167 FE               [ 2]  626 	ldw	x, (x)
      009168 CD 92 86         [ 4]  627 	call	_MibWriteDebugString
                                    628 ;	stm8s_eeprom_main.c: 332: return FALSE;
      00916B 5F               [ 1]  629 	clrw	x
      00916C CC 92 63         [ 2]  630 	jp	00172$
      00916F                        631 00129$:
                                    632 ;	stm8s_eeprom_main.c: 334: if (!HexToInt(argv[2], &vwAddr, 16))
      00916F 96               [ 1]  633 	ldw	x, sp
      009170 5C               [ 1]  634 	incw	x
      009171 16 09            [ 2]  635 	ldw	y, (0x09, sp)
      009173 90 FE            [ 2]  636 	ldw	y, (y)
      009175 4B 10            [ 1]  637 	push	#0x10
      009177 4B 00            [ 1]  638 	push	#0x00
      009179 89               [ 2]  639 	pushw	x
      00917A 93               [ 1]  640 	ldw	x, y
      00917B CD 9F 99         [ 4]  641 	call	_HexToInt
      00917E 5D               [ 2]  642 	tnzw	x
      00917F 26 0D            [ 1]  643 	jrne	00131$
                                    644 ;	stm8s_eeprom_main.c: 336: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      009181 4B C1            [ 1]  645 	push	#<(__str_3+0)
      009183 4B 80            [ 1]  646 	push	#((__str_3+0) >> 8)
      009185 CD 9C 98         [ 4]  647 	call	_mib_printf
      009188 5B 02            [ 2]  648 	addw	sp, #2
                                    649 ;	stm8s_eeprom_main.c: 337: return FALSE;
      00918A 5F               [ 1]  650 	clrw	x
      00918B CC 92 63         [ 2]  651 	jp	00172$
      00918E                        652 00131$:
                                    653 ;	stm8s_eeprom_main.c: 341: vwData = mmFlashOptionRead(vwAddr);
      00918E 1E 01            [ 2]  654 	ldw	x, (0x01, sp)
      009190 CD AE 65         [ 4]  655 	call	_mmFlashOptionRead
                                    656 ;	stm8s_eeprom_main.c: 343: ccprintf(_DEBUG_CMD_A_,("mmFlashOptionRead : 0x%04x[0x%04x]\r\n", vwAddr,vwData));
      009193 89               [ 2]  657 	pushw	x
      009194 1E 03            [ 2]  658 	ldw	x, (0x03, sp)
      009196 89               [ 2]  659 	pushw	x
      009197 4B FB            [ 1]  660 	push	#<(__str_30+0)
      009199 4B 84            [ 1]  661 	push	#((__str_30+0) >> 8)
      00919B CD 9C 98         [ 4]  662 	call	_mib_printf
      00919E 5B 06            [ 2]  663 	addw	sp, #6
      0091A0 CC 92 61         [ 2]  664 	jp	00171$
      0091A3                        665 00152$:
                                    666 ;	stm8s_eeprom_main.c: 348: else if (!strcmp(argv[1], "oerase")) // _CMD_MY_READ_
      0091A3 1E 06            [ 2]  667 	ldw	x, (0x06, sp)
      0091A5 FE               [ 2]  668 	ldw	x, (x)
      0091A6 4B 20            [ 1]  669 	push	#<(___str_31+0)
      0091A8 4B 85            [ 1]  670 	push	#((___str_31+0) >> 8)
      0091AA CD B1 01         [ 4]  671 	call	_strcmp
      0091AD 5D               [ 2]  672 	tnzw	x
      0091AE 26 64            [ 1]  673 	jrne	00149$
                                    674 ;	stm8s_eeprom_main.c: 351: if (argc < 3)
      0091B0 0D 0D            [ 1]  675 	tnz	(0x0d, sp)
      0091B2 27 0A            [ 1]  676 	jreq	00133$
                                    677 ;	stm8s_eeprom_main.c: 353: MibWriteDebugString(cptr->usage);
      0091B4 1E 04            [ 2]  678 	ldw	x, (0x04, sp)
      0091B6 FE               [ 2]  679 	ldw	x, (x)
      0091B7 CD 92 86         [ 4]  680 	call	_MibWriteDebugString
                                    681 ;	stm8s_eeprom_main.c: 354: return FALSE;
      0091BA 5F               [ 1]  682 	clrw	x
      0091BB CC 92 63         [ 2]  683 	jp	00172$
      0091BE                        684 00133$:
                                    685 ;	stm8s_eeprom_main.c: 356: if (!HexToInt(argv[2], &vwAddr, 16))
      0091BE 96               [ 1]  686 	ldw	x, sp
      0091BF 5C               [ 1]  687 	incw	x
      0091C0 16 09            [ 2]  688 	ldw	y, (0x09, sp)
      0091C2 90 FE            [ 2]  689 	ldw	y, (y)
      0091C4 4B 10            [ 1]  690 	push	#0x10
      0091C6 4B 00            [ 1]  691 	push	#0x00
      0091C8 89               [ 2]  692 	pushw	x
      0091C9 93               [ 1]  693 	ldw	x, y
      0091CA CD 9F 99         [ 4]  694 	call	_HexToInt
      0091CD 5D               [ 2]  695 	tnzw	x
      0091CE 26 0D            [ 1]  696 	jrne	00135$
                                    697 ;	stm8s_eeprom_main.c: 358: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
      0091D0 4B C1            [ 1]  698 	push	#<(__str_3+0)
      0091D2 4B 80            [ 1]  699 	push	#((__str_3+0) >> 8)
      0091D4 CD 9C 98         [ 4]  700 	call	_mib_printf
      0091D7 5B 02            [ 2]  701 	addw	sp, #2
                                    702 ;	stm8s_eeprom_main.c: 359: return FALSE;
      0091D9 5F               [ 1]  703 	clrw	x
      0091DA CC 92 63         [ 2]  704 	jp	00172$
      0091DD                        705 00135$:
                                    706 ;	stm8s_eeprom_main.c: 363: if(mmFlashOptionErase(vwAddr)==0)
      0091DD 1E 01            [ 2]  707 	ldw	x, (0x01, sp)
      0091DF CD AE B2         [ 4]  708 	call	_mmFlashOptionErase
      0091E2 4D               [ 1]  709 	tnz	a
      0091E3 26 0F            [ 1]  710 	jrne	00137$
                                    711 ;	stm8s_eeprom_main.c: 366: ccprintf(_DEBUG_CMD_A_,("mmFlashOptionErase ERROR!!!: 0x%04x\r\n", vwAddr));
      0091E5 1E 01            [ 2]  712 	ldw	x, (0x01, sp)
      0091E7 89               [ 2]  713 	pushw	x
      0091E8 4B 27            [ 1]  714 	push	#<(__str_32+0)
      0091EA 4B 85            [ 1]  715 	push	#((__str_32+0) >> 8)
      0091EC CD 9C 98         [ 4]  716 	call	_mib_printf
      0091EF 5B 04            [ 2]  717 	addw	sp, #4
                                    718 ;	stm8s_eeprom_main.c: 367: return 0; // false...
      0091F1 5F               [ 1]  719 	clrw	x
      0091F2 20 6F            [ 2]  720 	jra	00172$
      0091F4                        721 00137$:
                                    722 ;	stm8s_eeprom_main.c: 371: ccprintf(_DEBUG_CMD_A_,("mmFlashOptionErase OK!!!: 0x%04x\r\n", vwAddr));
      0091F4 1E 01            [ 2]  723 	ldw	x, (0x01, sp)
      0091F6 89               [ 2]  724 	pushw	x
      0091F7 4B 4D            [ 1]  725 	push	#<(__str_33+0)
      0091F9 4B 85            [ 1]  726 	push	#((__str_33+0) >> 8)
      0091FB CD 9C 98         [ 4]  727 	call	_mib_printf
      0091FE 5B 04            [ 2]  728 	addw	sp, #4
                                    729 ;	stm8s_eeprom_main.c: 373: vwData = mmFlashOptionRead(vwAddr);
      009200 1E 01            [ 2]  730 	ldw	x, (0x01, sp)
      009202 CD AE 65         [ 4]  731 	call	_mmFlashOptionRead
                                    732 ;	stm8s_eeprom_main.c: 375: ccprintf(_DEBUG_CMD_A_,("mmFlashOptionErase : 0x%04x[0x%04x]\r\n", vwAddr,vwData));
      009205 89               [ 2]  733 	pushw	x
      009206 1E 03            [ 2]  734 	ldw	x, (0x03, sp)
      009208 89               [ 2]  735 	pushw	x
      009209 4B 70            [ 1]  736 	push	#<(__str_34+0)
      00920B 4B 85            [ 1]  737 	push	#((__str_34+0) >> 8)
      00920D CD 9C 98         [ 4]  738 	call	_mib_printf
      009210 5B 06            [ 2]  739 	addw	sp, #6
      009212 20 4D            [ 2]  740 	jra	00171$
      009214                        741 00149$:
                                    742 ;	stm8s_eeprom_main.c: 380: else if (!strcmp(argv[1], "oinit")) // _CMD_MY_READ_
      009214 1E 06            [ 2]  743 	ldw	x, (0x06, sp)
      009216 FE               [ 2]  744 	ldw	x, (x)
      009217 4B 96            [ 1]  745 	push	#<(___str_35+0)
      009219 4B 85            [ 1]  746 	push	#((___str_35+0) >> 8)
      00921B CD B1 01         [ 4]  747 	call	_strcmp
      00921E 5D               [ 2]  748 	tnzw	x
      00921F 26 1D            [ 1]  749 	jrne	00146$
                                    750 ;	stm8s_eeprom_main.c: 382: if(mmFlashOptionUnlock()==0)
      009221 CD AD D0         [ 4]  751 	call	_mmFlashOptionUnlock
      009224 4D               [ 1]  752 	tnz	a
      009225 26 0C            [ 1]  753 	jrne	00140$
                                    754 ;	stm8s_eeprom_main.c: 385: ccprintf(_DEBUG_CMD_A_, ("flash Option bytes init ERROR!!!....mmFlashOptionUnlock()\r\n"));		
      009227 4B 9C            [ 1]  755 	push	#<(__str_36+0)
      009229 4B 85            [ 1]  756 	push	#((__str_36+0) >> 8)
      00922B CD 9C 98         [ 4]  757 	call	_mib_printf
      00922E 5B 02            [ 2]  758 	addw	sp, #2
                                    759 ;	stm8s_eeprom_main.c: 386: return FALSE;
      009230 5F               [ 1]  760 	clrw	x
      009231 20 30            [ 2]  761 	jra	00172$
      009233                        762 00140$:
                                    763 ;	stm8s_eeprom_main.c: 390: ccprintf(_DEBUG_CMD_A_, ("flash Option bytes init OK!!!....mmFlashOptionUnlock()\r\n"));		
      009233 4B D8            [ 1]  764 	push	#<(__str_37+0)
      009235 4B 85            [ 1]  765 	push	#((__str_37+0) >> 8)
      009237 CD 9C 98         [ 4]  766 	call	_mib_printf
      00923A 5B 02            [ 2]  767 	addw	sp, #2
      00923C 20 23            [ 2]  768 	jra	00171$
      00923E                        769 00146$:
                                    770 ;	stm8s_eeprom_main.c: 396: else if (!strcmp(argv[1], "olock")) // _CMD_MY_READ_
      00923E 1E 06            [ 2]  771 	ldw	x, (0x06, sp)
      009240 FE               [ 2]  772 	ldw	x, (x)
      009241 4B 11            [ 1]  773 	push	#<(___str_38+0)
      009243 4B 86            [ 1]  774 	push	#((___str_38+0) >> 8)
      009245 CD B1 01         [ 4]  775 	call	_strcmp
      009248 5D               [ 2]  776 	tnzw	x
      009249 26 0E            [ 1]  777 	jrne	00143$
                                    778 ;	stm8s_eeprom_main.c: 398: ccprintf(_DEBUG_CMD_A_, ("flash Option bytes lock....mmFlashOptionLock()\r\n"));		
      00924B 4B 17            [ 1]  779 	push	#<(__str_39+0)
      00924D 4B 86            [ 1]  780 	push	#((__str_39+0) >> 8)
      00924F CD 9C 98         [ 4]  781 	call	_mib_printf
      009252 5B 02            [ 2]  782 	addw	sp, #2
                                    783 ;	stm8s_eeprom_main.c: 399: mmFlashOptionLock();
      009254 CD AE 00         [ 4]  784 	call	_mmFlashOptionLock
      009257 20 08            [ 2]  785 	jra	00171$
      009259                        786 00143$:
                                    787 ;	stm8s_eeprom_main.c: 403: MibWriteDebugString(cptr->usage);
      009259 1E 04            [ 2]  788 	ldw	x, (0x04, sp)
      00925B FE               [ 2]  789 	ldw	x, (x)
      00925C CD 92 86         [ 4]  790 	call	_MibWriteDebugString
                                    791 ;	stm8s_eeprom_main.c: 404: return FALSE;
      00925F 5F               [ 1]  792 	clrw	x
                                    793 ;	stm8s_eeprom_main.c: 406: return TRUE;
      009260 C5                     794 	.byte 0xc5
      009261                        795 00171$:
      009261 5F               [ 1]  796 	clrw	x
      009262 5C               [ 1]  797 	incw	x
      009263                        798 00172$:
                                    799 ;	stm8s_eeprom_main.c: 407: }
      009263 16 0E            [ 2]  800 	ldw	y, (14, sp)
      009265 5B 13            [ 2]  801 	addw	sp, #19
      009267 90 FC            [ 2]  802 	jp	(y)
                                    803 	.area CODE
                                    804 	.area CONST
                                    805 	.area CONST
      00808F                        806 __str_0:
      00808F 49 4E 46 4F 3A 2B 63   807 	.ascii "INFO:+cmd_eeprom..."
             6D 64 5F 65 65 70 72
             6F 6D 2E 2E 2E
      0080A2 0D                     808 	.db 0x0d
      0080A3 0A                     809 	.db 0x0a
      0080A4 00                     810 	.db 0x00
                                    811 	.area CODE
                                    812 	.area CONST
      0080A5                        813 __str_1:
      0080A5 49 4E 46 4F 3A 2D 63   814 	.ascii "INFO:-cmd_eeprom..."
             6D 64 5F 65 65 70 72
             6F 6D 2E 2E 2E
      0080B8 0D                     815 	.db 0x0d
      0080B9 0A                     816 	.db 0x0a
      0080BA 00                     817 	.db 0x00
                                    818 	.area CODE
                                    819 	.area CONST
      0080BB                        820 ___str_2:
      0080BB 77 72 69 74 65         821 	.ascii "write"
      0080C0 00                     822 	.db 0x00
                                    823 	.area CODE
                                    824 	.area CONST
      0080C1                        825 __str_3:
      0080C1 49 6C 6C 75 67 61 6C   826 	.ascii "Illugal character is used."
             20 63 68 61 72 61 63
             74 65 72 20 69 73 20
             75 73 65 64 2E
      0080DB 0D                     827 	.db 0x0d
      0080DC 0A                     828 	.db 0x0a
      0080DD 00                     829 	.db 0x00
                                    830 	.area CODE
                                    831 	.area CONST
      0080DE                        832 __str_4:
      0080DE 6D 6D 45 65 70 72 6F   833 	.ascii "mmEepromWrite ERROR!!!: 0x%04x[0x%02x]"
             6D 57 72 69 74 65 20
             45 52 52 4F 52 21 21
             21 3A 20 30 78 25 30
             34 78 5B 30 78 25 30
             32 78 5D
      008104 0D                     834 	.db 0x0d
      008105 0A                     835 	.db 0x0a
      008106 00                     836 	.db 0x00
                                    837 	.area CODE
                                    838 	.area CONST
      008107                        839 __str_5:
      008107 6D 6D 45 65 70 72 6F   840 	.ascii "mmEepromWrite OK!!!: 0x%04x[0x%02x]"
             6D 57 72 69 74 65 20
             4F 4B 21 21 21 3A 20
             30 78 25 30 34 78 5B
             30 78 25 30 32 78 5D
      00812A 0D                     841 	.db 0x0d
      00812B 0A                     842 	.db 0x0a
      00812C 00                     843 	.db 0x00
                                    844 	.area CODE
                                    845 	.area CONST
      00812D                        846 ___str_6:
      00812D 72 65 61 64            847 	.ascii "read"
      008131 00                     848 	.db 0x00
                                    849 	.area CODE
                                    850 	.area CONST
      008132                        851 __str_7:
      008132 6D 6D 45 65 70 72 6F   852 	.ascii "mmEepromRead : 0x%04x[0x%02x]"
             6D 52 65 61 64 20 3A
             20 30 78 25 30 34 78
             5B 30 78 25 30 32 78
             5D
      00814F 0D                     853 	.db 0x0d
      008150 0A                     854 	.db 0x0a
      008151 00                     855 	.db 0x00
                                    856 	.area CODE
                                    857 	.area CONST
      008152                        858 ___str_8:
      008152 69 6E 69 74            859 	.ascii "init"
      008156 00                     860 	.db 0x00
                                    861 	.area CODE
                                    862 	.area CONST
      008157                        863 __str_9:
      008157 65 65 70 72 6F 6D 20   864 	.ascii "eeprom init ERROR!!!....mmEepromUnlock()"
             69 6E 69 74 20 45 52
             52 4F 52 21 21 21 2E
             2E 2E 2E 6D 6D 45 65
             70 72 6F 6D 55 6E 6C
             6F 63 6B 28 29
      00817F 0D                     865 	.db 0x0d
      008180 0A                     866 	.db 0x0a
      008181 00                     867 	.db 0x00
                                    868 	.area CODE
                                    869 	.area CONST
      008182                        870 __str_10:
      008182 65 65 70 72 6F 6D 20   871 	.ascii "eeprom init OK!!!....mmEepromUnlock()"
             69 6E 69 74 20 4F 4B
             21 21 21 2E 2E 2E 2E
             6D 6D 45 65 70 72 6F
             6D 55 6E 6C 6F 63 6B
             28 29
      0081A7 0D                     872 	.db 0x0d
      0081A8 0A                     873 	.db 0x0a
      0081A9 00                     874 	.db 0x00
                                    875 	.area CODE
                                    876 	.area CONST
      0081AA                        877 ___str_11:
      0081AA 6C 6F 63 6B            878 	.ascii "lock"
      0081AE 00                     879 	.db 0x00
                                    880 	.area CODE
                                    881 	.area CONST
      0081AF                        882 __str_12:
      0081AF 65 65 70 72 6F 6D 20   883 	.ascii "eeprom lock....mmEepromLock()"
             6C 6F 63 6B 2E 2E 2E
             2E 6D 6D 45 65 70 72
             6F 6D 4C 6F 63 6B 28
             29
      0081CC 0D                     884 	.db 0x0d
      0081CD 0A                     885 	.db 0x0a
      0081CE 00                     886 	.db 0x00
                                    887 	.area CODE
                                    888 	.area CONST
      0081CF                        889 ___str_13:
      0081CF 68 65 6C 70            890 	.ascii "help"
      0081D3 00                     891 	.db 0x00
                                    892 	.area CODE
                                    893 	.area CONST
      0081D4                        894 __str_14:
      0081D4 46 4C 41 53 48 5F 50   895 	.ascii "FLASH_PROG_START_PHYSICAL_ADDRESS  [0x%08lx]"
             52 4F 47 5F 53 54 41
             52 54 5F 50 48 59 53
             49 43 41 4C 5F 41 44
             44 52 45 53 53 20 20
             5B 30 78 25 30 38 6C
             78 5D
      008200 0D                     896 	.db 0x0d
      008201 0A                     897 	.db 0x0a
      008202 00                     898 	.db 0x00
                                    899 	.area CODE
                                    900 	.area CONST
      008203                        901 __str_15:
      008203 46 4C 41 53 48 5F 50   902 	.ascii "FLASH_PROG_END_PHYSICAL_ADDRESS    [0x%08lx]"
             52 4F 47 5F 45 4E 44
             5F 50 48 59 53 49 43
             41 4C 5F 41 44 44 52
             45 53 53 20 20 20 20
             5B 30 78 25 30 38 6C
             78 5D
      00822F 0D                     903 	.db 0x0d
      008230 0A                     904 	.db 0x0a
      008231 00                     905 	.db 0x00
                                    906 	.area CODE
                                    907 	.area CONST
      008232                        908 __str_16:
      008232 46 4C 41 53 48 5F 50   909 	.ascii "FLASH_PROG_BLOCKS_NUMBER           [%d]"
             52 4F 47 5F 42 4C 4F
             43 4B 53 5F 4E 55 4D
             42 45 52 20 20 20 20
             20 20 20 20 20 20 20
             5B 25 64 5D
      008259 0D                     910 	.db 0x0d
      00825A 0A                     911 	.db 0x0a
      00825B 00                     912 	.db 0x00
                                    913 	.area CODE
                                    914 	.area CONST
      00825C                        915 __str_17:
      00825C 46 4C 41 53 48 5F 44   916 	.ascii "FLASH_DATA_START_PHYSICAL_ADDRESS  [0x%08lx]"
             41 54 41 5F 53 54 41
             52 54 5F 50 48 59 53
             49 43 41 4C 5F 41 44
             44 52 45 53 53 20 20
             5B 30 78 25 30 38 6C
             78 5D
      008288 0D                     917 	.db 0x0d
      008289 0A                     918 	.db 0x0a
      00828A 00                     919 	.db 0x00
                                    920 	.area CODE
                                    921 	.area CONST
      00828B                        922 __str_18:
      00828B 46 4C 41 53 48 5F 44   923 	.ascii "FLASH_DATA_END_PHYSICAL_ADDRESS    [0x%08lx]"
             41 54 41 5F 45 4E 44
             5F 50 48 59 53 49 43
             41 4C 5F 41 44 44 52
             45 53 53 20 20 20 20
             5B 30 78 25 30 38 6C
             78 5D
      0082B7 0D                     924 	.db 0x0d
      0082B8 0A                     925 	.db 0x0a
      0082B9 00                     926 	.db 0x00
                                    927 	.area CODE
                                    928 	.area CONST
      0082BA                        929 __str_19:
      0082BA 46 4C 41 53 48 5F 44   930 	.ascii "FLASH_DATA_BLOCKS_NUMBER           [%d]"
             41 54 41 5F 42 4C 4F
             43 4B 53 5F 4E 55 4D
             42 45 52 20 20 20 20
             20 20 20 20 20 20 20
             5B 25 64 5D
      0082E1 0D                     931 	.db 0x0d
      0082E2 0A                     932 	.db 0x0a
      0082E3 00                     933 	.db 0x00
                                    934 	.area CODE
                                    935 	.area CONST
      0082E4                        936 __str_20:
      0082E4 46 4C 41 53 48 5F 42   937 	.ascii "FLASH_BLOCK_SIZE                   [%d]"
             4C 4F 43 4B 5F 53 49
             5A 45 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             5B 25 64 5D
      00830B 0D                     938 	.db 0x0d
      00830C 0A                     939 	.db 0x0a
      00830D 00                     940 	.db 0x00
                                    941 	.area CODE
                                    942 	.area CONST
      00830E                        943 __str_21:
      00830E 4F 50 54 49 4F 4E 5F   944 	.ascii "OPTION_BYTE_START_PHYSICAL_ADDRESS [0x%08lx]"
             42 59 54 45 5F 53 54
             41 52 54 5F 50 48 59
             53 49 43 41 4C 5F 41
             44 44 52 45 53 53 20
             5B 30 78 25 30 38 6C
             78 5D
      00833A 0D                     945 	.db 0x0d
      00833B 0A                     946 	.db 0x0a
      00833C 00                     947 	.db 0x00
                                    948 	.area CODE
                                    949 	.area CONST
      00833D                        950 __str_22:
      00833D 4F 50 54 49 4F 4E 5F   951 	.ascii "OPTION_BYTE_END_PHYSICAL_ADDRESS   [0x%08lx]"
             42 59 54 45 5F 45 4E
             44 5F 50 48 59 53 49
             43 41 4C 5F 41 44 44
             52 45 53 53 20 20 20
             5B 30 78 25 30 38 6C
             78 5D
      008369 0D                     952 	.db 0x0d
      00836A 0A                     953 	.db 0x0a
      00836B 00                     954 	.db 0x00
                                    955 	.area CODE
                                    956 	.area CONST
      00836C                        957 __str_23:
      00836C 20 65 65 70 72 6F 6D   958 	.ascii " eeprom help"
             20 68 65 6C 70
      008378 0D                     959 	.db 0x0d
      008379 0A                     960 	.db 0x0a
      00837A 20 65 65 70 72 6F 6D   961 	.ascii " eeprom init"
             20 69 6E 69 74
      008386 0D                     962 	.db 0x0d
      008387 0A                     963 	.db 0x0a
      008388 20 65 65 70 72 6F 6D   964 	.ascii " eeprom write 100 aa"
             20 77 72 69 74 65 20
             31 30 30 20 61 61
      00839C 0D                     965 	.db 0x0d
      00839D 0A                     966 	.db 0x0a
      00839E 20 65 65 70 72 6F 6D   967 	.ascii " eeprom read 100"
             20 72 65 61 64 20 31
             30 30
      0083AE 0D                     968 	.db 0x0d
      0083AF 0A                     969 	.db 0x0a
      0083B0 20 65 65 70 72 6F 6D   970 	.ascii " eeprom lock"
             20 6C 6F 63 6B
      0083BC 0D                     971 	.db 0x0d
      0083BD 0A                     972 	.db 0x0a
      0083BE 00                     973 	.db 0x00
                                    974 	.area CODE
                                    975 	.area CONST
      0083BF                        976 __str_24:
      0083BF 20 65 65 70 72 6F 6D   977 	.ascii " eeprom oinit"
             20 6F 69 6E 69 74
      0083CC 0D                     978 	.db 0x0d
      0083CD 0A                     979 	.db 0x0a
      0083CE 20 65 65 70 72 6F 6D   980 	.ascii " eeprom oread 4803"
             20 6F 72 65 61 64 20
             34 38 30 33
      0083E0 0D                     981 	.db 0x0d
      0083E1 0A                     982 	.db 0x0a
      0083E2 20 65 65 70 72 6F 6D   983 	.ascii " eeprom owrite 4803 80"
             20 6F 77 72 69 74 65
             20 34 38 30 33 20 38
             30
      0083F8 0D                     984 	.db 0x0d
      0083F9 0A                     985 	.db 0x0a
      0083FA 20 65 65 70 72 6F 6D   986 	.ascii " eeprom oerase 4803"
             20 6F 65 72 61 73 65
             20 34 38 30 33
      00840D 0D                     987 	.db 0x0d
      00840E 0A                     988 	.db 0x0a
      00840F 20 65 65 70 72 6F 6D   989 	.ascii " eeprom olock"
             20 6F 6C 6F 63 6B
      00841C 0D                     990 	.db 0x0d
      00841D 0A                     991 	.db 0x0a
      00841E 00                     992 	.db 0x00
                                    993 	.area CODE
                                    994 	.area CONST
      00841F                        995 __str_25:
      00841F 20 68 74 74 70 73 3A   996 	.ascii " https://www.st.com/resource/en/datasheet/stm8s105c6.pdf pag"
             2F 2F 77 77 77 2E 73
             74 2E 63 6F 6D 2F 72
             65 73 6F 75 72 63 65
             2F 65 6E 2F 64 61 74
             61 73 68 65 65 74 2F
             73 74 6D 38 73 31 30
             35 63 36 2E 70 64 66
             20 70 61 67
      00845B 65 20 34 36 2C 20 41   997 	.ascii "e 46, AFR7 (beep) / page 29 PD4 (BEEP output, AFR7 bit)"
             46 52 37 20 28 62 65
             65 70 29 20 2F 20 70
             61 67 65 20 32 39 20
             50 44 34 20 28 42 45
             45 50 20 6F 75 74 70
             75 74 2C 20 41 46 52
             37 20 62 69 74 29
      008492 0D                     998 	.db 0x0d
      008493 0A                     999 	.db 0x0a
      008494 00                    1000 	.db 0x00
                                   1001 	.area CODE
                                   1002 	.area CONST
      008495                       1003 ___str_26:
      008495 6F 77 72 69 74 65     1004 	.ascii "owrite"
      00849B 00                    1005 	.db 0x00
                                   1006 	.area CODE
                                   1007 	.area CONST
      00849C                       1008 __str_27:
      00849C 6D 6D 46 6C 61 73 68  1009 	.ascii "mmFlashOptionWrite ERROR!!!: 0x%04x[0x%02x]"
             4F 70 74 69 6F 6E 57
             72 69 74 65 20 45 52
             52 4F 52 21 21 21 3A
             20 30 78 25 30 34 78
             5B 30 78 25 30 32 78
             5D
      0084C7 0D                    1010 	.db 0x0d
      0084C8 0A                    1011 	.db 0x0a
      0084C9 00                    1012 	.db 0x00
                                   1013 	.area CODE
                                   1014 	.area CONST
      0084CA                       1015 __str_28:
      0084CA 6D 6D 46 6C 61 73 68  1016 	.ascii "mmFlashOptionWrite OK!!!: 0x%04x[0x%02x]"
             4F 70 74 69 6F 6E 57
             72 69 74 65 20 4F 4B
             21 21 21 3A 20 30 78
             25 30 34 78 5B 30 78
             25 30 32 78 5D
      0084F2 0D                    1017 	.db 0x0d
      0084F3 0A                    1018 	.db 0x0a
      0084F4 00                    1019 	.db 0x00
                                   1020 	.area CODE
                                   1021 	.area CONST
      0084F5                       1022 ___str_29:
      0084F5 6F 72 65 61 64        1023 	.ascii "oread"
      0084FA 00                    1024 	.db 0x00
                                   1025 	.area CODE
                                   1026 	.area CONST
      0084FB                       1027 __str_30:
      0084FB 6D 6D 46 6C 61 73 68  1028 	.ascii "mmFlashOptionRead : 0x%04x[0x%04x]"
             4F 70 74 69 6F 6E 52
             65 61 64 20 3A 20 30
             78 25 30 34 78 5B 30
             78 25 30 34 78 5D
      00851D 0D                    1029 	.db 0x0d
      00851E 0A                    1030 	.db 0x0a
      00851F 00                    1031 	.db 0x00
                                   1032 	.area CODE
                                   1033 	.area CONST
      008520                       1034 ___str_31:
      008520 6F 65 72 61 73 65     1035 	.ascii "oerase"
      008526 00                    1036 	.db 0x00
                                   1037 	.area CODE
                                   1038 	.area CONST
      008527                       1039 __str_32:
      008527 6D 6D 46 6C 61 73 68  1040 	.ascii "mmFlashOptionErase ERROR!!!: 0x%04x"
             4F 70 74 69 6F 6E 45
             72 61 73 65 20 45 52
             52 4F 52 21 21 21 3A
             20 30 78 25 30 34 78
      00854A 0D                    1041 	.db 0x0d
      00854B 0A                    1042 	.db 0x0a
      00854C 00                    1043 	.db 0x00
                                   1044 	.area CODE
                                   1045 	.area CONST
      00854D                       1046 __str_33:
      00854D 6D 6D 46 6C 61 73 68  1047 	.ascii "mmFlashOptionErase OK!!!: 0x%04x"
             4F 70 74 69 6F 6E 45
             72 61 73 65 20 4F 4B
             21 21 21 3A 20 30 78
             25 30 34 78
      00856D 0D                    1048 	.db 0x0d
      00856E 0A                    1049 	.db 0x0a
      00856F 00                    1050 	.db 0x00
                                   1051 	.area CODE
                                   1052 	.area CONST
      008570                       1053 __str_34:
      008570 6D 6D 46 6C 61 73 68  1054 	.ascii "mmFlashOptionErase : 0x%04x[0x%04x]"
             4F 70 74 69 6F 6E 45
             72 61 73 65 20 3A 20
             30 78 25 30 34 78 5B
             30 78 25 30 34 78 5D
      008593 0D                    1055 	.db 0x0d
      008594 0A                    1056 	.db 0x0a
      008595 00                    1057 	.db 0x00
                                   1058 	.area CODE
                                   1059 	.area CONST
      008596                       1060 ___str_35:
      008596 6F 69 6E 69 74        1061 	.ascii "oinit"
      00859B 00                    1062 	.db 0x00
                                   1063 	.area CODE
                                   1064 	.area CONST
      00859C                       1065 __str_36:
      00859C 66 6C 61 73 68 20 4F  1066 	.ascii "flash Option bytes init ERROR!!!....mmFlashOptionUnlock()"
             70 74 69 6F 6E 20 62
             79 74 65 73 20 69 6E
             69 74 20 45 52 52 4F
             52 21 21 21 2E 2E 2E
             2E 6D 6D 46 6C 61 73
             68 4F 70 74 69 6F 6E
             55 6E 6C 6F 63 6B 28
             29
      0085D5 0D                    1067 	.db 0x0d
      0085D6 0A                    1068 	.db 0x0a
      0085D7 00                    1069 	.db 0x00
                                   1070 	.area CODE
                                   1071 	.area CONST
      0085D8                       1072 __str_37:
      0085D8 66 6C 61 73 68 20 4F  1073 	.ascii "flash Option bytes init OK!!!....mmFlashOptionUnlock()"
             70 74 69 6F 6E 20 62
             79 74 65 73 20 69 6E
             69 74 20 4F 4B 21 21
             21 2E 2E 2E 2E 6D 6D
             46 6C 61 73 68 4F 70
             74 69 6F 6E 55 6E 6C
             6F 63 6B 28 29
      00860E 0D                    1074 	.db 0x0d
      00860F 0A                    1075 	.db 0x0a
      008610 00                    1076 	.db 0x00
                                   1077 	.area CODE
                                   1078 	.area CONST
      008611                       1079 ___str_38:
      008611 6F 6C 6F 63 6B        1080 	.ascii "olock"
      008616 00                    1081 	.db 0x00
                                   1082 	.area CODE
                                   1083 	.area CONST
      008617                       1084 __str_39:
      008617 66 6C 61 73 68 20 4F  1085 	.ascii "flash Option bytes lock....mmFlashOptionLock()"
             70 74 69 6F 6E 20 62
             79 74 65 73 20 6C 6F
             63 6B 2E 2E 2E 2E 6D
             6D 46 6C 61 73 68 4F
             70 74 69 6F 6E 4C 6F
             63 6B 28 29
      008645 0D                    1086 	.db 0x0d
      008646 0A                    1087 	.db 0x0a
      008647 00                    1088 	.db 0x00
                                   1089 	.area CODE
                                   1090 	.area CONST
      008648                       1091 ___str_40:
      008648 65 65 70 72 6F 6D     1092 	.ascii "eeprom"
      00864E 00                    1093 	.db 0x00
                                   1094 	.area CODE
                                   1095 	.area CONST
      00864F                       1096 ___str_41:
      00864F 20 20 65 65 70 72 6F  1097 	.ascii "  eeprom {init} : EEPROM init"
             6D 20 7B 69 6E 69 74
             7D 20 3A 20 45 45 50
             52 4F 4D 20 69 6E 69
             74
      00866C 0D                    1098 	.db 0x0d
      00866D 0A                    1099 	.db 0x0a
      00866E 20 20 65 65 70 72 6F  1100 	.ascii "  eeprom {lock} "
             6D 20 7B 6C 6F 63 6B
             7D 20
      00867E 0D                    1101 	.db 0x0d
      00867F 0A                    1102 	.db 0x0a
      008680 20 20 65 65 70 72 6F  1103 	.ascii "  eeprom {write} [offset] [data] : (0x4000) <= addr <= (0x40"
             6D 20 7B 77 72 69 74
             65 7D 20 5B 6F 66 66
             73 65 74 5D 20 5B 64
             61 74 61 5D 20 3A 20
             28 30 78 34 30 30 30
             29 20 3C 3D 20 61 64
             64 72 20 3C 3D 20 28
             30 78 34 30
      0086BC 30 30 20 2B 20 30 78  1104 	.ascii "00 + 0x03FF(1K))"
             30 33 46 46 28 31 4B
             29 29
      0086CC 0D                    1105 	.db 0x0d
      0086CD 0A                    1106 	.db 0x0a
      0086CE 20 20 65 65 70 72 6F  1107 	.ascii "  eeprom {read} [offset] : offset 1K(0x3FF)"
             6D 20 7B 72 65 61 64
             7D 20 5B 6F 66 66 73
             65 74 5D 20 3A 20 6F
             66 66 73 65 74 20 31
             4B 28 30 78 33 46 46
             29
      0086F9 0D                    1108 	.db 0x0d
      0086FA 0A                    1109 	.db 0x0a
      0086FB 20 20 65 65 70 72 6F  1110 	.ascii "  eeprom {oinit} : EEPROM OPTION BYTE init(0x4800 to 0x483F "
             6D 20 7B 6F 69 6E 69
             74 7D 20 3A 20 45 45
             50 52 4F 4D 20 4F 50
             54 49 4F 4E 20 42 59
             54 45 20 69 6E 69 74
             28 30 78 34 38 30 30
             20 74 6F 20 30 78 34
             38 33 46 20
      008737 3A 20 36 34 62 79 74  1111 	.ascii ": 64bytes) "
             65 73 29 20
      008742 0D                    1112 	.db 0x0d
      008743 0A                    1113 	.db 0x0a
      008744 20 20 65 65 70 72 6F  1114 	.ascii "  eeprom {olock} "
             6D 20 7B 6F 6C 6F 63
             6B 7D 20
      008755 0D                    1115 	.db 0x0d
      008756 0A                    1116 	.db 0x0a
      008757 20 20 65 65 70 72 6F  1117 	.ascii "  eeprom {owrite} [addr] [data] : addr(4800h to 487Fh) "
             6D 20 7B 6F 77 72 69
             74 65 7D 20 5B 61 64
             64 72 5D 20 5B 64 61
             74 61 5D 20 3A 20 61
             64 64 72 28 34 38 30
             30 68 20 74 6F 20 34
             38 37 46 68 29 20
      00878E 0D                    1118 	.db 0x0d
      00878F 0A                    1119 	.db 0x0a
      008790 20 20 65 65 70 72 6F  1120 	.ascii "  eeprom {oread} [addr] "
             6D 20 7B 6F 72 65 61
             64 7D 20 5B 61 64 64
             72 5D 20
      0087A8 0D                    1121 	.db 0x0d
      0087A9 0A                    1122 	.db 0x0a
      0087AA 20 20 65 65 70 72 6F  1123 	.ascii "  eeprom {oerase} [addr] "
             6D 20 7B 6F 65 72 61
             73 65 7D 20 5B 61 64
             64 72 5D 20
      0087C3 0D                    1124 	.db 0x0d
      0087C4 0A                    1125 	.db 0x0a
      0087C5 20 20 65 65 70 72 6F  1126 	.ascii "  eeprom {help}  eeprom help."
             6D 20 7B 68 65 6C 70
             7D 20 20 65 65 70 72
             6F 6D 20 68 65 6C 70
             2E
      0087E2 0D                    1127 	.db 0x0d
      0087E3 0A                    1128 	.db 0x0a
      0087E4 00                    1129 	.db 0x00
                                   1130 	.area CODE
                                   1131 	.area INITIALIZER
      008DF4                       1132 __xinit__cmdTbl_only:
      008DF4 86 48                 1133 	.dw ___str_40
      008DF6 8E 9C                 1134 	.dw _DoEEPROM
      008DF8 86 4F                 1135 	.dw ___str_41
      008DFA 00 00                 1136 	.dw #0x0000
      008DFC 00 00                 1137 	.dw #0x0000
      008DFE 00 00                 1138 	.dw #0x0000
                                   1139 	.area CABS (ABS)
