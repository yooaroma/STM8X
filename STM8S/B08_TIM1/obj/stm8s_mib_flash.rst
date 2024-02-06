                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_mib_flash
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _mmFlashUnlock
                                     12 	.globl _mmFlashLock
                                     13 	.globl _mmFlashWrite
                                     14 	.globl _mmFlashRead
                                     15 ;--------------------------------------------------------
                                     16 ; ram data
                                     17 ;--------------------------------------------------------
                                     18 	.area DATA
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area INITIALIZED
                                     23 ;--------------------------------------------------------
                                     24 ; absolute external ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area DABS (ABS)
                                     27 
                                     28 ; default segment ordering for linker
                                     29 	.area HOME
                                     30 	.area GSINIT
                                     31 	.area GSFINAL
                                     32 	.area CONST
                                     33 	.area INITIALIZER
                                     34 	.area CODE
                                     35 
                                     36 ;--------------------------------------------------------
                                     37 ; global & static initialisations
                                     38 ;--------------------------------------------------------
                                     39 	.area HOME
                                     40 	.area GSINIT
                                     41 	.area GSFINAL
                                     42 	.area GSINIT
                                     43 ;--------------------------------------------------------
                                     44 ; Home
                                     45 ;--------------------------------------------------------
                                     46 	.area HOME
                                     47 	.area HOME
                                     48 ;--------------------------------------------------------
                                     49 ; code
                                     50 ;--------------------------------------------------------
                                     51 	.area CODE
                                     52 ;	./../../mib/stm8s_mib_flash.c: 64: uint8_t mmFlashUnlock(void) 
                                     53 ;	-----------------------------------------
                                     54 ;	 function mmFlashUnlock
                                     55 ;	-----------------------------------------
      00C0F2                         56 _mmFlashUnlock:
      00C0F2 52 03            [ 2]   57 	sub	sp, #3
                                     58 ;	./../../mib/stm8s_mib_flash.c: 66: volatile uint16_t vwDelay = 0x7fff;
      00C0F4 AE 7F FF         [ 2]   59 	ldw	x, #0x7fff
      00C0F7 1F 01            [ 2]   60 	ldw	(0x01, sp), x
                                     61 ;	./../../mib/stm8s_mib_flash.c: 67: volatile uint8_t DataUnlocked = 0;
      00C0F9 0F 03            [ 1]   62 	clr	(0x03, sp)
                                     63 ;	./../../mib/stm8s_mib_flash.c: 70: while( DataUnlocked == 0 )
      00C0FB                         64 00104$:
      00C0FB 0D 03            [ 1]   65 	tnz	(0x03, sp)
      00C0FD 26 1E            [ 1]   66 	jrne	00106$
                                     67 ;	./../../mib/stm8s_mib_flash.c: 72: FLASH->PUKR = 0x56;
      00C0FF 35 56 50 62      [ 1]   68 	mov	0x5062+0, #0x56
                                     69 ;	./../../mib/stm8s_mib_flash.c: 73: FLASH->PUKR = 0xAE;
      00C103 35 AE 50 62      [ 1]   70 	mov	0x5062+0, #0xae
                                     71 ;	./../../mib/stm8s_mib_flash.c: 75: DataUnlocked = (uint8_t)FLASH->IAPSR;	
      00C107 C6 50 5F         [ 1]   72 	ld	a, 0x505f
                                     73 ;	./../../mib/stm8s_mib_flash.c: 76: DataUnlocked &= FLASH_IAPSR_PUL;
      00C10A 6B 03            [ 1]   74 	ld	(0x03, sp), a
      00C10C A4 02            [ 1]   75 	and	a, #0x02
      00C10E 6B 03            [ 1]   76 	ld	(0x03, sp), a
                                     77 ;	./../../mib/stm8s_mib_flash.c: 77: if(vwDelay) vwDelay--;
      00C110 1E 01            [ 2]   78 	ldw	x, (0x01, sp)
      00C112 27 07            [ 1]   79 	jreq	00102$
      00C114 1E 01            [ 2]   80 	ldw	x, (0x01, sp)
      00C116 5A               [ 2]   81 	decw	x
      00C117 1F 01            [ 2]   82 	ldw	(0x01, sp), x
      00C119 20 E0            [ 2]   83 	jra	00104$
      00C11B                         84 00102$:
                                     85 ;	./../../mib/stm8s_mib_flash.c: 80: return 0;
      00C11B 4F               [ 1]   86 	clr	a
                                     87 ;	./../../mib/stm8s_mib_flash.c: 83: return 1;
      00C11C C5                      88 	.byte 0xc5
      00C11D                         89 00106$:
      00C11D A6 01            [ 1]   90 	ld	a, #0x01
      00C11F                         91 00107$:
                                     92 ;	./../../mib/stm8s_mib_flash.c: 84: }
      00C11F 5B 03            [ 2]   93 	addw	sp, #3
      00C121 81               [ 4]   94 	ret
                                     95 ;	./../../mib/stm8s_mib_flash.c: 94: void mmFlashLock(void) 
                                     96 ;	-----------------------------------------
                                     97 ;	 function mmFlashLock
                                     98 ;	-----------------------------------------
      00C122                         99 _mmFlashLock:
                                    100 ;	./../../mib/stm8s_mib_flash.c: 97: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL); 
      00C122 72 13 50 5F      [ 1]  101 	bres	0x505f, #1
                                    102 ;	./../../mib/stm8s_mib_flash.c: 98: }
      00C126 81               [ 4]  103 	ret
                                    104 ;	./../../mib/stm8s_mib_flash.c: 109: uint8_t mmFlashWrite(uint16_t vbOffset,uint8_t vbData) 
                                    105 ;	-----------------------------------------
                                    106 ;	 function mmFlashWrite
                                    107 ;	-----------------------------------------
      00C127                        108 _mmFlashWrite:
      00C127 52 03            [ 2]  109 	sub	sp, #3
      00C129 6B 03            [ 1]  110 	ld	(0x03, sp), a
                                    111 ;	./../../mib/stm8s_mib_flash.c: 111: volatile uint16_t vwDelay = 0x7fff;
      00C12B 90 AE 7F FF      [ 2]  112 	ldw	y, #0x7fff
      00C12F 17 01            [ 2]  113 	ldw	(0x01, sp), y
                                    114 ;	./../../mib/stm8s_mib_flash.c: 112: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);		// Set Standard programming time (max 6.6 ms)
      00C131 72 11 50 5A      [ 1]  115 	bres	0x505a, #0
                                    116 ;	./../../mib/stm8s_mib_flash.c: 113: if(vbOffset > (FLASH_PROG_END_PHYSICAL_ADDRESS - FLASH_PROG_START_PHYSICAL_ADDRESS))
      00C135 A3 7F FF         [ 2]  117 	cpw	x, #0x7fff
      00C138 23 03            [ 2]  118 	jrule	00102$
                                    119 ;	./../../mib/stm8s_mib_flash.c: 115: return 0; // false...
      00C13A 4F               [ 1]  120 	clr	a
      00C13B 20 19            [ 2]  121 	jra	00109$
      00C13D                        122 00102$:
                                    123 ;	./../../mib/stm8s_mib_flash.c: 118: *((PointerAttr uint8_t*)(FLASH_PROG_START_PHYSICAL_ADDRESS+vbOffset)) = vbData;
      00C13D 7B 03            [ 1]  124 	ld	a, (0x03, sp)
      00C13F D7 80 00         [ 1]  125 	ld	(0x8000, x), a
                                    126 ;	./../../mib/stm8s_mib_flash.c: 120: while( !(FLASH->IAPSR & FLASH_IAPSR_EOP) )
      00C142                        127 00106$:
      00C142 72 04 50 5F 0D   [ 2]  128 	btjt	0x505f, #2, 00108$
                                    129 ;	./../../mib/stm8s_mib_flash.c: 122: if(vwDelay) vwDelay--;
      00C147 1E 01            [ 2]  130 	ldw	x, (0x01, sp)
      00C149 27 07            [ 1]  131 	jreq	00104$
      00C14B 1E 01            [ 2]  132 	ldw	x, (0x01, sp)
      00C14D 5A               [ 2]  133 	decw	x
      00C14E 1F 01            [ 2]  134 	ldw	(0x01, sp), x
      00C150 20 F0            [ 2]  135 	jra	00106$
      00C152                        136 00104$:
                                    137 ;	./../../mib/stm8s_mib_flash.c: 125: return 0;
      00C152 4F               [ 1]  138 	clr	a
                                    139 ;	./../../mib/stm8s_mib_flash.c: 128: return 1;
      00C153 C5                     140 	.byte 0xc5
      00C154                        141 00108$:
      00C154 A6 01            [ 1]  142 	ld	a, #0x01
      00C156                        143 00109$:
                                    144 ;	./../../mib/stm8s_mib_flash.c: 129: }
      00C156 5B 03            [ 2]  145 	addw	sp, #3
      00C158 81               [ 4]  146 	ret
                                    147 ;	./../../mib/stm8s_mib_flash.c: 142: uint8_t mmFlashRead(uint16_t vbOffset)
                                    148 ;	-----------------------------------------
                                    149 ;	 function mmFlashRead
                                    150 ;	-----------------------------------------
      00C159                        151 _mmFlashRead:
                                    152 ;	./../../mib/stm8s_mib_flash.c: 145: if(vbOffset > (FLASH_PROG_END_PHYSICAL_ADDRESS - FLASH_PROG_START_PHYSICAL_ADDRESS))
      00C159 A3 7F FF         [ 2]  153 	cpw	x, #0x7fff
      00C15C 23 02            [ 2]  154 	jrule	00102$
                                    155 ;	./../../mib/stm8s_mib_flash.c: 147: return 0; // false...
      00C15E 4F               [ 1]  156 	clr	a
      00C15F 81               [ 4]  157 	ret
      00C160                        158 00102$:
                                    159 ;	./../../mib/stm8s_mib_flash.c: 150: vbData = *((uint8_t *)(FLASH_PROG_START_PHYSICAL_ADDRESS+vbOffset));
      00C160 D6 80 00         [ 1]  160 	ld	a, (0x8000, x)
                                    161 ;	./../../mib/stm8s_mib_flash.c: 151: return vbData;
                                    162 ;	./../../mib/stm8s_mib_flash.c: 153: }
      00C163 81               [ 4]  163 	ret
                                    164 	.area CODE
                                    165 	.area CONST
                                    166 	.area INITIALIZER
                                    167 	.area CABS (ABS)
