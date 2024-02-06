;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_eeprom_main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cmd_test_init_before_irq_enable
	.globl _cmd_test
	.globl _cmd_eeprom
	.globl _mmFlashOptionErase
	.globl _mmFlashOptionRead
	.globl _mmFlashOptionWrite
	.globl _mmFlashOptionUnlock
	.globl _mmFlashOptionLock
	.globl _mmEepromRead
	.globl _mmEepromWrite
	.globl _mmEepromUnlock
	.globl _mmEepromLock
	.globl _HexToInt
	.globl _mib_printf
	.globl _MibWriteDebugString
	.globl ___memcpy
	.globl _strcmp
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
;	stm8s_eeprom_main.c: 135: void cmd_eeprom(void)
;	-----------------------------------------
;	 function cmd_eeprom
;	-----------------------------------------
_cmd_eeprom:
	sub	sp, #10
;	stm8s_eeprom_main.c: 141: for (cptr = cmdTbl;; cptr++) 
	ldw	x, #(_cmdTbl+0)
	ldw	(0x01, sp), x
	clrw	x
	ldw	(0x07, sp), x
	ldw	(0x05, sp), x
	ldw	y, (0x01, sp)
	ldw	(0x09, sp), y
00106$:
;	stm8s_eeprom_main.c: 143: if(cptr->cmd==0)
	ldw	x, (0x09, sp)
	ldw	x, (x)
	ldw	(0x03, sp), x
	jrne	00102$
;	stm8s_eeprom_main.c: 145: ccprintf(1,("INFO:+cmd_eeprom...\r\n"));
	push	#<(__str_0+0)
	push	#((__str_0+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_eeprom_main.c: 146: memcpy((void *)&(cptr->cmd),(void *)&(cmdTbl_only[0].cmd),sizeof(CMD_MY));
	ldw	x, #_cmdTbl_only+0
	ldw	y, (0x01, sp)
	push	#0x06
	push	#0x00
	pushw	x
	ldw	x, y
	call	___memcpy
;	stm8s_eeprom_main.c: 147: break;
	jra	00105$
00102$:
;	stm8s_eeprom_main.c: 149: index++;
	ldw	x, (0x07, sp)
	incw	x
	ldw	(0x07, sp), x
	jrne	00126$
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x05, sp), x
00126$:
;	stm8s_eeprom_main.c: 150: if(index>MAX_COMMANDS)
	ldw	x, #0x0006
	cpw	x, (0x07, sp)
	clr	a
	sbc	a, (0x06, sp)
	clr	a
	sbc	a, (0x05, sp)
	jrnc	00107$
;	stm8s_eeprom_main.c: 152: ccprintf(1,("INFO:-cmd_eeprom...\r\n"));
	push	#<(__str_1+0)
	push	#((__str_1+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_eeprom_main.c: 153: return;
	jra	00108$
00107$:
;	stm8s_eeprom_main.c: 141: for (cptr = cmdTbl;; cptr++) 
	ldw	x, (0x09, sp)
	addw	x, #0x0006
	ldw	(0x09, sp), x
	ldw	(0x01, sp), x
	jra	00106$
00105$:
;	stm8s_eeprom_main.c: 156: return;
00108$:
;	stm8s_eeprom_main.c: 157: }
	addw	sp, #10
	ret
;	stm8s_eeprom_main.c: 162: void cmd_test(void)
;	-----------------------------------------
;	 function cmd_test
;	-----------------------------------------
_cmd_test:
;	stm8s_eeprom_main.c: 164: cmd_eeprom();
;	stm8s_eeprom_main.c: 165: }
	jp	_cmd_eeprom
;	stm8s_eeprom_main.c: 171: void cmd_test_init_before_irq_enable(void)
;	-----------------------------------------
;	 function cmd_test_init_before_irq_enable
;	-----------------------------------------
_cmd_test_init_before_irq_enable:
;	stm8s_eeprom_main.c: 174: }
	ret
;	stm8s_eeprom_main.c: 185: static int DoEEPROM(CMD_MY *cptr, int argc, char **argv)
;	-----------------------------------------
;	 function DoEEPROM
;	-----------------------------------------
_DoEEPROM:
	sub	sp, #13
;	stm8s_eeprom_main.c: 187: uint16_t vwAddr = 0;
	clr	(0x02, sp)
	clr	(0x01, sp)
;	stm8s_eeprom_main.c: 188: uint8_t vbData = 0;
	clr	(0x03, sp)
;	stm8s_eeprom_main.c: 192: MibWriteDebugString(cptr->usage);
	addw	x, #0x0004
	ldw	(0x04, sp), x
;	stm8s_eeprom_main.c: 190: if (argc < 2)
	ldw	x, (0x10, sp)
	cpw	x, #0x0002
	jrsge	00102$
;	stm8s_eeprom_main.c: 192: MibWriteDebugString(cptr->usage);
	ldw	x, (0x04, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_eeprom_main.c: 193: return FALSE;
	clrw	x
	jp	00172$
00102$:
;	stm8s_eeprom_main.c: 198: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
	ldw	x, (0x12, sp)
	incw	x
	incw	x
	ldw	(0x06, sp), x
	ldw	x, (x)
	push	#<(___str_2+0)
	push	#((___str_2+0) >> 8)
	call	_strcmp
	exgw	x, y
;	stm8s_eeprom_main.c: 200: if (argc < 4)
	ldw	x, (0x10, sp)
	cpw	x, #0x0004
	jrslt	00315$
	clr	(0x08, sp)
	jra	00316$
00315$:
	ld	a, #0x01
	ld	(0x08, sp), a
00316$:
;	stm8s_eeprom_main.c: 205: if (!HexToInt(argv[2], &vwAddr, 16))
	ldw	x, (0x12, sp)
	addw	x, #0x0004
	ldw	(0x09, sp), x
;	stm8s_eeprom_main.c: 210: if (!HexToInt(argv[3], &vbData, 8))
	ldw	x, (0x12, sp)
	addw	x, #0x0006
	ldw	(0x0b, sp), x
;	stm8s_eeprom_main.c: 198: if (!strcmp(argv[1], "write")) // _CMD_MY_WRITE_
	tnzw	y
	jreq	00317$
	jp	00170$
00317$:
;	stm8s_eeprom_main.c: 200: if (argc < 4)
	tnz	(0x08, sp)
	jreq	00104$
;	stm8s_eeprom_main.c: 202: MibWriteDebugString(cptr->usage);
	ldw	x, (0x04, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_eeprom_main.c: 203: return FALSE;
	clrw	x
	jp	00172$
00104$:
;	stm8s_eeprom_main.c: 205: if (!HexToInt(argv[2], &vwAddr, 16))
	ldw	x, sp
	incw	x
	ldw	y, (0x09, sp)
	ldw	y, (y)
	push	#0x10
	push	#0x00
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00106$
;	stm8s_eeprom_main.c: 207: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_eeprom_main.c: 208: return FALSE;
	clrw	x
	jp	00172$
00106$:
;	stm8s_eeprom_main.c: 210: if (!HexToInt(argv[3], &vbData, 8))
	ldw	x, sp
	addw	x, #3
	ldw	y, (0x0b, sp)
	ldw	y, (y)
	push	#0x08
	push	#0x00
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00108$
;	stm8s_eeprom_main.c: 212: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_eeprom_main.c: 213: return FALSE;
	clrw	x
	jp	00172$
00108$:
;	stm8s_eeprom_main.c: 216: if(mmEepromWrite(vwAddr, vbData)==0)
	ld	a, (0x03, sp)
	ldw	x, (0x01, sp)
	call	_mmEepromWrite
;	stm8s_eeprom_main.c: 219: ccprintf(_DEBUG_CMD_A_,("mmEepromWrite ERROR!!!: 0x%04x[0x%02x]\r\n", vwAddr,vbData));
	clrw	x
	exg	a, xl
	ld	a, (0x03, sp)
	exg	a, xl
;	stm8s_eeprom_main.c: 216: if(mmEepromWrite(vwAddr, vbData)==0)
	tnz	a
	jrne	00110$
;	stm8s_eeprom_main.c: 219: ccprintf(_DEBUG_CMD_A_,("mmEepromWrite ERROR!!!: 0x%04x[0x%02x]\r\n", vwAddr,vbData));
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	push	#<(__str_4+0)
	push	#((__str_4+0) >> 8)
	call	_mib_printf
	addw	sp, #6
;	stm8s_eeprom_main.c: 220: return 0; // false...
	clrw	x
	jp	00172$
00110$:
;	stm8s_eeprom_main.c: 224: ccprintf(_DEBUG_CMD_A_,("mmEepromWrite OK!!!: 0x%04x[0x%02x]\r\n", vwAddr,vbData));
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	push	#<(__str_5+0)
	push	#((__str_5+0) >> 8)
	call	_mib_printf
	addw	sp, #6
	jp	00171$
00170$:
;	stm8s_eeprom_main.c: 230: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
	ldw	x, (0x06, sp)
	ldw	x, (x)
	push	#<(___str_6+0)
	push	#((___str_6+0) >> 8)
	call	_strcmp
	exgw	x, y
;	stm8s_eeprom_main.c: 232: if (argc < 3)
	ldw	x, (0x10, sp)
	cpw	x, #0x0003
	jrslt	00322$
	clr	(0x0d, sp)
	jra	00323$
00322$:
	ld	a, #0x01
	ld	(0x0d, sp), a
00323$:
;	stm8s_eeprom_main.c: 230: else if (!strcmp(argv[1], "read")) // _CMD_MY_READ_
	tnzw	y
	jrne	00167$
;	stm8s_eeprom_main.c: 232: if (argc < 3)
	tnz	(0x0d, sp)
	jreq	00113$
;	stm8s_eeprom_main.c: 234: MibWriteDebugString(cptr->usage);
	ldw	x, (0x04, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_eeprom_main.c: 235: return FALSE;
	clrw	x
	jp	00172$
00113$:
;	stm8s_eeprom_main.c: 237: if (!HexToInt(argv[2], &vwAddr, 16))
	ldw	x, sp
	incw	x
	ldw	y, (0x09, sp)
	ldw	y, (y)
	push	#0x10
	push	#0x00
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00115$
;	stm8s_eeprom_main.c: 239: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_eeprom_main.c: 240: return FALSE;
	clrw	x
	jp	00172$
00115$:
;	stm8s_eeprom_main.c: 244: vbData = mmEepromRead(vwAddr);
	ldw	x, (0x01, sp)
	call	_mmEepromRead
	ld	(0x03, sp), a
;	stm8s_eeprom_main.c: 246: ccprintf(_DEBUG_CMD_A_,("mmEepromRead : 0x%04x[0x%02x]\r\n", vwAddr,vbData));
	clrw	x
	ld	xl, a
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	push	#<(__str_7+0)
	push	#((__str_7+0) >> 8)
	call	_mib_printf
	addw	sp, #6
	jp	00171$
00167$:
;	stm8s_eeprom_main.c: 251: else if (!strcmp(argv[1], "init")) // _CMD_MY_READ_
	ldw	x, (0x06, sp)
	ldw	x, (x)
	push	#<(___str_8+0)
	push	#((___str_8+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00164$
;	stm8s_eeprom_main.c: 253: if(mmEepromUnlock()==0)
	call	_mmEepromUnlock
	tnz	a
	jrne	00117$
;	stm8s_eeprom_main.c: 256: ccprintf(_DEBUG_CMD_A_, ("eeprom init ERROR!!!....mmEepromUnlock()\r\n"));		
	push	#<(__str_9+0)
	push	#((__str_9+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_eeprom_main.c: 257: return FALSE;
	clrw	x
	jp	00172$
00117$:
;	stm8s_eeprom_main.c: 261: ccprintf(_DEBUG_CMD_A_, ("eeprom init OK!!!....mmEepromUnlock()\r\n"));		
	push	#<(__str_10+0)
	push	#((__str_10+0) >> 8)
	call	_mib_printf
	addw	sp, #2
	jp	00171$
00164$:
;	stm8s_eeprom_main.c: 267: else if (!strcmp(argv[1], "lock")) // _CMD_MY_READ_
	ldw	x, (0x06, sp)
	ldw	x, (x)
	push	#<(___str_11+0)
	push	#((___str_11+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00161$
;	stm8s_eeprom_main.c: 269: ccprintf(_DEBUG_CMD_A_, ("eeprom lock....mmEepromLock()\r\n"));		
	push	#<(__str_12+0)
	push	#((__str_12+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_eeprom_main.c: 270: mmEepromLock();
	call	_mmEepromLock
	jp	00171$
00161$:
;	stm8s_eeprom_main.c: 275: else if (!strcmp(argv[1], "help")) // _CMD_MY_READ_
	ldw	x, (0x06, sp)
	ldw	x, (x)
	push	#<(___str_13+0)
	push	#((___str_13+0) >> 8)
	call	_strcmp
	tnzw	x
	jreq	00330$
	jp	00158$
00330$:
;	stm8s_eeprom_main.c: 277: ccprintf(_DEBUG_CMD_A_, ("FLASH_PROG_START_PHYSICAL_ADDRESS  [0x%08lx]\r\n",FLASH_PROG_START_PHYSICAL_ADDRESS  ));		
	push	#0x00
	push	#0x80
	clrw	x
	pushw	x
	push	#<(__str_14+0)
	push	#((__str_14+0) >> 8)
	call	_mib_printf
	addw	sp, #6
;	stm8s_eeprom_main.c: 278: ccprintf(_DEBUG_CMD_A_, ("FLASH_PROG_END_PHYSICAL_ADDRESS    [0x%08lx]\r\n",FLASH_PROG_END_PHYSICAL_ADDRESS    ));		
	push	#0xff
	push	#0xff
	clrw	x
	pushw	x
	push	#<(__str_15+0)
	push	#((__str_15+0) >> 8)
	call	_mib_printf
	addw	sp, #6
;	stm8s_eeprom_main.c: 279: ccprintf(_DEBUG_CMD_A_, ("FLASH_PROG_BLOCKS_NUMBER           [%d]\r\n" ,FLASH_PROG_BLOCKS_NUMBER             ));		
	push	#0x00
	push	#0x01
	push	#<(__str_16+0)
	push	#((__str_16+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	stm8s_eeprom_main.c: 280: ccprintf(_DEBUG_CMD_A_, ("FLASH_DATA_START_PHYSICAL_ADDRESS  [0x%08lx]\r\n",FLASH_DATA_START_PHYSICAL_ADDRESS));		
	push	#0x00
	push	#0x40
	clrw	x
	pushw	x
	push	#<(__str_17+0)
	push	#((__str_17+0) >> 8)
	call	_mib_printf
	addw	sp, #6
;	stm8s_eeprom_main.c: 281: ccprintf(_DEBUG_CMD_A_, ("FLASH_DATA_END_PHYSICAL_ADDRESS    [0x%08lx]\r\n",FLASH_DATA_END_PHYSICAL_ADDRESS  ));		
	push	#0xff
	push	#0x43
	clrw	x
	pushw	x
	push	#<(__str_18+0)
	push	#((__str_18+0) >> 8)
	call	_mib_printf
	addw	sp, #6
;	stm8s_eeprom_main.c: 282: ccprintf(_DEBUG_CMD_A_, ("FLASH_DATA_BLOCKS_NUMBER           [%d]\r\n" ,FLASH_DATA_BLOCKS_NUMBER      ));		
	push	#0x08
	push	#0x00
	push	#<(__str_19+0)
	push	#((__str_19+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	stm8s_eeprom_main.c: 283: ccprintf(_DEBUG_CMD_A_, ("FLASH_BLOCK_SIZE                   [%d]\r\n" ,(uint16_t)FLASH_BLOCK_SIZE       ));		
	push	#0x80
	push	#0x00
	push	#<(__str_20+0)
	push	#((__str_20+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	stm8s_eeprom_main.c: 284: ccprintf(_DEBUG_CMD_A_, ("OPTION_BYTE_START_PHYSICAL_ADDRESS [0x%08lx]\r\n",(uint32_t)OPTION_BYTE_START_PHYSICAL_ADDRESS));		
	push	#0x00
	push	#0x48
	clrw	x
	pushw	x
	push	#<(__str_21+0)
	push	#((__str_21+0) >> 8)
	call	_mib_printf
	addw	sp, #6
;	stm8s_eeprom_main.c: 285: ccprintf(_DEBUG_CMD_A_, ("OPTION_BYTE_END_PHYSICAL_ADDRESS   [0x%08lx]\r\n",(uint32_t)OPTION_BYTE_END_PHYSICAL_ADDRESS  ));		
	push	#0x7f
	push	#0x48
	clrw	x
	pushw	x
	push	#<(__str_22+0)
	push	#((__str_22+0) >> 8)
	call	_mib_printf
	addw	sp, #6
;	stm8s_eeprom_main.c: 286: ccprintf(_DEBUG_CMD_A_, (" eeprom help\r\n eeprom init\r\n eeprom write 100 aa\r\n eeprom read 100\r\n eeprom lock\r\n"));	
	push	#<(__str_23+0)
	push	#((__str_23+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_eeprom_main.c: 287: ccprintf(_DEBUG_CMD_A_, (" eeprom oinit\r\n eeprom oread 4803\r\n eeprom owrite 4803 80\r\n eeprom oerase 4803\r\n eeprom olock\r\n"));	
	push	#<(__str_24+0)
	push	#((__str_24+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_eeprom_main.c: 288: ccprintf(_DEBUG_CMD_A_, (" https://www.st.com/resource/en/datasheet/stm8s105c6.pdf page 46, AFR7 (beep) / page 29 PD4 (BEEP output, AFR7 bit)\r\n"));		
	push	#<(__str_25+0)
	push	#((__str_25+0) >> 8)
	call	_mib_printf
	addw	sp, #2
	jp	00171$
00158$:
;	stm8s_eeprom_main.c: 294: else if (!strcmp(argv[1], "owrite")) // _CMD_MY_WRITE_
	ldw	x, (0x06, sp)
	ldw	x, (x)
	push	#<(___str_26+0)
	push	#((___str_26+0) >> 8)
	call	_strcmp
	tnzw	x
	jreq	00331$
	jp	00155$
00331$:
;	stm8s_eeprom_main.c: 296: if (argc < 4)
	tnz	(0x08, sp)
	jreq	00120$
;	stm8s_eeprom_main.c: 298: MibWriteDebugString(cptr->usage);
	ldw	x, (0x04, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_eeprom_main.c: 299: return FALSE;
	clrw	x
	jp	00172$
00120$:
;	stm8s_eeprom_main.c: 301: if (!HexToInt(argv[2], &vwAddr, 16))
	ldw	x, sp
	incw	x
	ldw	y, (0x09, sp)
	ldw	y, (y)
	push	#0x10
	push	#0x00
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00122$
;	stm8s_eeprom_main.c: 303: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_eeprom_main.c: 304: return FALSE;
	clrw	x
	jp	00172$
00122$:
;	stm8s_eeprom_main.c: 306: if (!HexToInt(argv[3], &vbData, 8))
	ldw	x, sp
	addw	x, #3
	ldw	y, (0x0b, sp)
	ldw	y, (y)
	push	#0x08
	push	#0x00
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00124$
;	stm8s_eeprom_main.c: 308: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_eeprom_main.c: 309: return FALSE;
	clrw	x
	jp	00172$
00124$:
;	stm8s_eeprom_main.c: 312: if(mmFlashOptionWrite(vwAddr, vbData)==0)
	ld	a, (0x03, sp)
	ldw	x, (0x01, sp)
	call	_mmFlashOptionWrite
;	stm8s_eeprom_main.c: 219: ccprintf(_DEBUG_CMD_A_,("mmEepromWrite ERROR!!!: 0x%04x[0x%02x]\r\n", vwAddr,vbData));
	clrw	x
	exg	a, xl
	ld	a, (0x03, sp)
	exg	a, xl
;	stm8s_eeprom_main.c: 312: if(mmFlashOptionWrite(vwAddr, vbData)==0)
	tnz	a
	jrne	00126$
;	stm8s_eeprom_main.c: 315: ccprintf(_DEBUG_CMD_A_,("mmFlashOptionWrite ERROR!!!: 0x%04x[0x%02x]\r\n", vwAddr,vbData));
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	push	#<(__str_27+0)
	push	#((__str_27+0) >> 8)
	call	_mib_printf
	addw	sp, #6
;	stm8s_eeprom_main.c: 316: return 0; // false...
	clrw	x
	jp	00172$
00126$:
;	stm8s_eeprom_main.c: 320: ccprintf(_DEBUG_CMD_A_,("mmFlashOptionWrite OK!!!: 0x%04x[0x%02x]\r\n", vwAddr,vbData));
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	push	#<(__str_28+0)
	push	#((__str_28+0) >> 8)
	call	_mib_printf
	addw	sp, #6
	jp	00171$
00155$:
;	stm8s_eeprom_main.c: 326: else if (!strcmp(argv[1], "oread")) // _CMD_MY_READ_
	ldw	x, (0x06, sp)
	ldw	x, (x)
	push	#<(___str_29+0)
	push	#((___str_29+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00152$
;	stm8s_eeprom_main.c: 329: if (argc < 3)
	tnz	(0x0d, sp)
	jreq	00129$
;	stm8s_eeprom_main.c: 331: MibWriteDebugString(cptr->usage);
	ldw	x, (0x04, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_eeprom_main.c: 332: return FALSE;
	clrw	x
	jp	00172$
00129$:
;	stm8s_eeprom_main.c: 334: if (!HexToInt(argv[2], &vwAddr, 16))
	ldw	x, sp
	incw	x
	ldw	y, (0x09, sp)
	ldw	y, (y)
	push	#0x10
	push	#0x00
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00131$
;	stm8s_eeprom_main.c: 336: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_eeprom_main.c: 337: return FALSE;
	clrw	x
	jp	00172$
00131$:
;	stm8s_eeprom_main.c: 341: vwData = mmFlashOptionRead(vwAddr);
	ldw	x, (0x01, sp)
	call	_mmFlashOptionRead
;	stm8s_eeprom_main.c: 343: ccprintf(_DEBUG_CMD_A_,("mmFlashOptionRead : 0x%04x[0x%04x]\r\n", vwAddr,vwData));
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	push	#<(__str_30+0)
	push	#((__str_30+0) >> 8)
	call	_mib_printf
	addw	sp, #6
	jp	00171$
00152$:
;	stm8s_eeprom_main.c: 348: else if (!strcmp(argv[1], "oerase")) // _CMD_MY_READ_
	ldw	x, (0x06, sp)
	ldw	x, (x)
	push	#<(___str_31+0)
	push	#((___str_31+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00149$
;	stm8s_eeprom_main.c: 351: if (argc < 3)
	tnz	(0x0d, sp)
	jreq	00133$
;	stm8s_eeprom_main.c: 353: MibWriteDebugString(cptr->usage);
	ldw	x, (0x04, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_eeprom_main.c: 354: return FALSE;
	clrw	x
	jp	00172$
00133$:
;	stm8s_eeprom_main.c: 356: if (!HexToInt(argv[2], &vwAddr, 16))
	ldw	x, sp
	incw	x
	ldw	y, (0x09, sp)
	ldw	y, (y)
	push	#0x10
	push	#0x00
	pushw	x
	ldw	x, y
	call	_HexToInt
	tnzw	x
	jrne	00135$
;	stm8s_eeprom_main.c: 358: ccprintf(_DEBUG_CMD_A_, ("Illugal character is used.\r\n"));
	push	#<(__str_3+0)
	push	#((__str_3+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_eeprom_main.c: 359: return FALSE;
	clrw	x
	jp	00172$
00135$:
;	stm8s_eeprom_main.c: 363: if(mmFlashOptionErase(vwAddr)==0)
	ldw	x, (0x01, sp)
	call	_mmFlashOptionErase
	tnz	a
	jrne	00137$
;	stm8s_eeprom_main.c: 366: ccprintf(_DEBUG_CMD_A_,("mmFlashOptionErase ERROR!!!: 0x%04x\r\n", vwAddr));
	ldw	x, (0x01, sp)
	pushw	x
	push	#<(__str_32+0)
	push	#((__str_32+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	stm8s_eeprom_main.c: 367: return 0; // false...
	clrw	x
	jra	00172$
00137$:
;	stm8s_eeprom_main.c: 371: ccprintf(_DEBUG_CMD_A_,("mmFlashOptionErase OK!!!: 0x%04x\r\n", vwAddr));
	ldw	x, (0x01, sp)
	pushw	x
	push	#<(__str_33+0)
	push	#((__str_33+0) >> 8)
	call	_mib_printf
	addw	sp, #4
;	stm8s_eeprom_main.c: 373: vwData = mmFlashOptionRead(vwAddr);
	ldw	x, (0x01, sp)
	call	_mmFlashOptionRead
;	stm8s_eeprom_main.c: 375: ccprintf(_DEBUG_CMD_A_,("mmFlashOptionErase : 0x%04x[0x%04x]\r\n", vwAddr,vwData));
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	push	#<(__str_34+0)
	push	#((__str_34+0) >> 8)
	call	_mib_printf
	addw	sp, #6
	jra	00171$
00149$:
;	stm8s_eeprom_main.c: 380: else if (!strcmp(argv[1], "oinit")) // _CMD_MY_READ_
	ldw	x, (0x06, sp)
	ldw	x, (x)
	push	#<(___str_35+0)
	push	#((___str_35+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00146$
;	stm8s_eeprom_main.c: 382: if(mmFlashOptionUnlock()==0)
	call	_mmFlashOptionUnlock
	tnz	a
	jrne	00140$
;	stm8s_eeprom_main.c: 385: ccprintf(_DEBUG_CMD_A_, ("flash Option bytes init ERROR!!!....mmFlashOptionUnlock()\r\n"));		
	push	#<(__str_36+0)
	push	#((__str_36+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_eeprom_main.c: 386: return FALSE;
	clrw	x
	jra	00172$
00140$:
;	stm8s_eeprom_main.c: 390: ccprintf(_DEBUG_CMD_A_, ("flash Option bytes init OK!!!....mmFlashOptionUnlock()\r\n"));		
	push	#<(__str_37+0)
	push	#((__str_37+0) >> 8)
	call	_mib_printf
	addw	sp, #2
	jra	00171$
00146$:
;	stm8s_eeprom_main.c: 396: else if (!strcmp(argv[1], "olock")) // _CMD_MY_READ_
	ldw	x, (0x06, sp)
	ldw	x, (x)
	push	#<(___str_38+0)
	push	#((___str_38+0) >> 8)
	call	_strcmp
	tnzw	x
	jrne	00143$
;	stm8s_eeprom_main.c: 398: ccprintf(_DEBUG_CMD_A_, ("flash Option bytes lock....mmFlashOptionLock()\r\n"));		
	push	#<(__str_39+0)
	push	#((__str_39+0) >> 8)
	call	_mib_printf
	addw	sp, #2
;	stm8s_eeprom_main.c: 399: mmFlashOptionLock();
	call	_mmFlashOptionLock
	jra	00171$
00143$:
;	stm8s_eeprom_main.c: 403: MibWriteDebugString(cptr->usage);
	ldw	x, (0x04, sp)
	ldw	x, (x)
	call	_MibWriteDebugString
;	stm8s_eeprom_main.c: 404: return FALSE;
	clrw	x
;	stm8s_eeprom_main.c: 406: return TRUE;
	.byte 0xc5
00171$:
	clrw	x
	incw	x
00172$:
;	stm8s_eeprom_main.c: 407: }
	ldw	y, (14, sp)
	addw	sp, #19
	jp	(y)
	.area CODE
	.area CONST
	.area CONST
__str_0:
	.ascii "INFO:+cmd_eeprom..."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_1:
	.ascii "INFO:-cmd_eeprom..."
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
	.ascii "mmEepromWrite ERROR!!!: 0x%04x[0x%02x]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_5:
	.ascii "mmEepromWrite OK!!!: 0x%04x[0x%02x]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_6:
	.ascii "read"
	.db 0x00
	.area CODE
	.area CONST
__str_7:
	.ascii "mmEepromRead : 0x%04x[0x%02x]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_8:
	.ascii "init"
	.db 0x00
	.area CODE
	.area CONST
__str_9:
	.ascii "eeprom init ERROR!!!....mmEepromUnlock()"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_10:
	.ascii "eeprom init OK!!!....mmEepromUnlock()"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_11:
	.ascii "lock"
	.db 0x00
	.area CODE
	.area CONST
__str_12:
	.ascii "eeprom lock....mmEepromLock()"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_13:
	.ascii "help"
	.db 0x00
	.area CODE
	.area CONST
__str_14:
	.ascii "FLASH_PROG_START_PHYSICAL_ADDRESS  [0x%08lx]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_15:
	.ascii "FLASH_PROG_END_PHYSICAL_ADDRESS    [0x%08lx]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_16:
	.ascii "FLASH_PROG_BLOCKS_NUMBER           [%d]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_17:
	.ascii "FLASH_DATA_START_PHYSICAL_ADDRESS  [0x%08lx]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_18:
	.ascii "FLASH_DATA_END_PHYSICAL_ADDRESS    [0x%08lx]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_19:
	.ascii "FLASH_DATA_BLOCKS_NUMBER           [%d]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_20:
	.ascii "FLASH_BLOCK_SIZE                   [%d]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_21:
	.ascii "OPTION_BYTE_START_PHYSICAL_ADDRESS [0x%08lx]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_22:
	.ascii "OPTION_BYTE_END_PHYSICAL_ADDRESS   [0x%08lx]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_23:
	.ascii " eeprom help"
	.db 0x0d
	.db 0x0a
	.ascii " eeprom init"
	.db 0x0d
	.db 0x0a
	.ascii " eeprom write 100 aa"
	.db 0x0d
	.db 0x0a
	.ascii " eeprom read 100"
	.db 0x0d
	.db 0x0a
	.ascii " eeprom lock"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_24:
	.ascii " eeprom oinit"
	.db 0x0d
	.db 0x0a
	.ascii " eeprom oread 4803"
	.db 0x0d
	.db 0x0a
	.ascii " eeprom owrite 4803 80"
	.db 0x0d
	.db 0x0a
	.ascii " eeprom oerase 4803"
	.db 0x0d
	.db 0x0a
	.ascii " eeprom olock"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_25:
	.ascii " https://www.st.com/resource/en/datasheet/stm8s105c6.pdf pag"
	.ascii "e 46, AFR7 (beep) / page 29 PD4 (BEEP output, AFR7 bit)"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_26:
	.ascii "owrite"
	.db 0x00
	.area CODE
	.area CONST
__str_27:
	.ascii "mmFlashOptionWrite ERROR!!!: 0x%04x[0x%02x]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_28:
	.ascii "mmFlashOptionWrite OK!!!: 0x%04x[0x%02x]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_29:
	.ascii "oread"
	.db 0x00
	.area CODE
	.area CONST
__str_30:
	.ascii "mmFlashOptionRead : 0x%04x[0x%04x]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_31:
	.ascii "oerase"
	.db 0x00
	.area CODE
	.area CONST
__str_32:
	.ascii "mmFlashOptionErase ERROR!!!: 0x%04x"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_33:
	.ascii "mmFlashOptionErase OK!!!: 0x%04x"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_34:
	.ascii "mmFlashOptionErase : 0x%04x[0x%04x]"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_35:
	.ascii "oinit"
	.db 0x00
	.area CODE
	.area CONST
__str_36:
	.ascii "flash Option bytes init ERROR!!!....mmFlashOptionUnlock()"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
__str_37:
	.ascii "flash Option bytes init OK!!!....mmFlashOptionUnlock()"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_38:
	.ascii "olock"
	.db 0x00
	.area CODE
	.area CONST
__str_39:
	.ascii "flash Option bytes lock....mmFlashOptionLock()"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area CONST
___str_40:
	.ascii "eeprom"
	.db 0x00
	.area CODE
	.area CONST
___str_41:
	.ascii "  eeprom {init} : EEPROM init"
	.db 0x0d
	.db 0x0a
	.ascii "  eeprom {lock} "
	.db 0x0d
	.db 0x0a
	.ascii "  eeprom {write} [offset] [data] : (0x4000) <= addr <= (0x40"
	.ascii "00 + 0x03FF(1K))"
	.db 0x0d
	.db 0x0a
	.ascii "  eeprom {read} [offset] : offset 1K(0x3FF)"
	.db 0x0d
	.db 0x0a
	.ascii "  eeprom {oinit} : EEPROM OPTION BYTE init(0x4800 to 0x483F "
	.ascii ": 64bytes) "
	.db 0x0d
	.db 0x0a
	.ascii "  eeprom {olock} "
	.db 0x0d
	.db 0x0a
	.ascii "  eeprom {owrite} [addr] [data] : addr(4800h to 487Fh) "
	.db 0x0d
	.db 0x0a
	.ascii "  eeprom {oread} [addr] "
	.db 0x0d
	.db 0x0a
	.ascii "  eeprom {oerase} [addr] "
	.db 0x0d
	.db 0x0a
	.ascii "  eeprom {help}  eeprom help."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area INITIALIZER
__xinit__cmdTbl_only:
	.dw ___str_40
	.dw _DoEEPROM
	.dw ___str_41
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.area CABS (ABS)
