                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_mib_eeprom
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _mmEepromUnlock
                                     12 	.globl _mmEepromLock
                                     13 	.globl _mmEepromWrite
                                     14 	.globl _mmEepromRead
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
                                     52 ;	./../../mib/stm8s_mib_eeprom.c: 64: uint8_t mmEepromUnlock(void) 
                                     53 ;	-----------------------------------------
                                     54 ;	 function mmEepromUnlock
                                     55 ;	-----------------------------------------
      00AD56                         56 _mmEepromUnlock:
      00AD56 52 03            [ 2]   57 	sub	sp, #3
                                     58 ;	./../../mib/stm8s_mib_eeprom.c: 66: volatile uint16_t vwDelay = 0x7fff;
      00AD58 AE 7F FF         [ 2]   59 	ldw	x, #0x7fff
      00AD5B 1F 01            [ 2]   60 	ldw	(0x01, sp), x
                                     61 ;	./../../mib/stm8s_mib_eeprom.c: 67: volatile uint8_t DataUnlocked = 0;
      00AD5D 0F 03            [ 1]   62 	clr	(0x03, sp)
                                     63 ;	./../../mib/stm8s_mib_eeprom.c: 70: while( DataUnlocked == 0 )
      00AD5F                         64 00104$:
      00AD5F 0D 03            [ 1]   65 	tnz	(0x03, sp)
      00AD61 26 1E            [ 1]   66 	jrne	00106$
                                     67 ;	./../../mib/stm8s_mib_eeprom.c: 72: FLASH->DUKR=0xAE;
      00AD63 35 AE 50 64      [ 1]   68 	mov	0x5064+0, #0xae
                                     69 ;	./../../mib/stm8s_mib_eeprom.c: 73: FLASH->DUKR=0x56;
      00AD67 35 56 50 64      [ 1]   70 	mov	0x5064+0, #0x56
                                     71 ;	./../../mib/stm8s_mib_eeprom.c: 75: DataUnlocked = (uint8_t)FLASH->IAPSR;	
      00AD6B C6 50 5F         [ 1]   72 	ld	a, 0x505f
                                     73 ;	./../../mib/stm8s_mib_eeprom.c: 76: DataUnlocked &= FLASH_IAPSR_DUL;
      00AD6E 6B 03            [ 1]   74 	ld	(0x03, sp), a
      00AD70 A4 08            [ 1]   75 	and	a, #0x08
      00AD72 6B 03            [ 1]   76 	ld	(0x03, sp), a
                                     77 ;	./../../mib/stm8s_mib_eeprom.c: 77: if(vwDelay) vwDelay--;
      00AD74 1E 01            [ 2]   78 	ldw	x, (0x01, sp)
      00AD76 27 07            [ 1]   79 	jreq	00102$
      00AD78 1E 01            [ 2]   80 	ldw	x, (0x01, sp)
      00AD7A 5A               [ 2]   81 	decw	x
      00AD7B 1F 01            [ 2]   82 	ldw	(0x01, sp), x
      00AD7D 20 E0            [ 2]   83 	jra	00104$
      00AD7F                         84 00102$:
                                     85 ;	./../../mib/stm8s_mib_eeprom.c: 80: return 0;
      00AD7F 4F               [ 1]   86 	clr	a
                                     87 ;	./../../mib/stm8s_mib_eeprom.c: 83: return 1;
      00AD80 C5                      88 	.byte 0xc5
      00AD81                         89 00106$:
      00AD81 A6 01            [ 1]   90 	ld	a, #0x01
      00AD83                         91 00107$:
                                     92 ;	./../../mib/stm8s_mib_eeprom.c: 84: }
      00AD83 5B 03            [ 2]   93 	addw	sp, #3
      00AD85 81               [ 4]   94 	ret
                                     95 ;	./../../mib/stm8s_mib_eeprom.c: 94: void mmEepromLock(void) 
                                     96 ;	-----------------------------------------
                                     97 ;	 function mmEepromLock
                                     98 ;	-----------------------------------------
      00AD86                         99 _mmEepromLock:
                                    100 ;	./../../mib/stm8s_mib_eeprom.c: 97: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);  // FLASH_MEMTYPE_DATA      = (uint8_t)0xF7  /*!< Data EEPROM memory */ FLASH_IAPSR_DUL
      00AD86 72 17 50 5F      [ 1]  101 	bres	0x505f, #3
                                    102 ;	./../../mib/stm8s_mib_eeprom.c: 98: }
      00AD8A 81               [ 4]  103 	ret
                                    104 ;	./../../mib/stm8s_mib_eeprom.c: 109: uint8_t mmEepromWrite(uint16_t vbOffset,uint8_t vbData) 
                                    105 ;	-----------------------------------------
                                    106 ;	 function mmEepromWrite
                                    107 ;	-----------------------------------------
      00AD8B                        108 _mmEepromWrite:
      00AD8B 52 03            [ 2]  109 	sub	sp, #3
      00AD8D 6B 03            [ 1]  110 	ld	(0x03, sp), a
                                    111 ;	./../../mib/stm8s_mib_eeprom.c: 111: volatile uint16_t vwDelay = 0x7fff;
      00AD8F 90 AE 7F FF      [ 2]  112 	ldw	y, #0x7fff
      00AD93 17 01            [ 2]  113 	ldw	(0x01, sp), y
                                    114 ;	./../../mib/stm8s_mib_eeprom.c: 112: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);		// Set Standard programming time (max 6.6 ms)
      00AD95 72 11 50 5A      [ 1]  115 	bres	0x505a, #0
                                    116 ;	./../../mib/stm8s_mib_eeprom.c: 113: if(vbOffset > (FLASH_DATA_END_PHYSICAL_ADDRESS - FLASH_DATA_START_PHYSICAL_ADDRESS))
      00AD99 A3 03 FF         [ 2]  117 	cpw	x, #0x03ff
      00AD9C 23 03            [ 2]  118 	jrule	00102$
                                    119 ;	./../../mib/stm8s_mib_eeprom.c: 115: return 0; // false...
      00AD9E 4F               [ 1]  120 	clr	a
      00AD9F 20 21            [ 2]  121 	jra	00111$
      00ADA1                        122 00102$:
                                    123 ;	./../../mib/stm8s_mib_eeprom.c: 117: if((FLASH->IAPSR & FLASH_IAPSR_DUL)==0)
      00ADA1 72 06 50 5F 03   [ 2]  124 	btjt	0x505f, #3, 00104$
                                    125 ;	./../../mib/stm8s_mib_eeprom.c: 119: return 0; // false...
      00ADA6 4F               [ 1]  126 	clr	a
      00ADA7 20 19            [ 2]  127 	jra	00111$
      00ADA9                        128 00104$:
                                    129 ;	./../../mib/stm8s_mib_eeprom.c: 122: *((PointerAttr uint8_t*)(FLASH_DATA_START_PHYSICAL_ADDRESS+vbOffset)) = vbData;
      00ADA9 7B 03            [ 1]  130 	ld	a, (0x03, sp)
      00ADAB D7 40 00         [ 1]  131 	ld	(0x4000, x), a
                                    132 ;	./../../mib/stm8s_mib_eeprom.c: 124: while( !(FLASH->IAPSR & FLASH_IAPSR_EOP) )
      00ADAE                        133 00108$:
      00ADAE 72 04 50 5F 0D   [ 2]  134 	btjt	0x505f, #2, 00110$
                                    135 ;	./../../mib/stm8s_mib_eeprom.c: 126: if(vwDelay) vwDelay--;
      00ADB3 1E 01            [ 2]  136 	ldw	x, (0x01, sp)
      00ADB5 27 07            [ 1]  137 	jreq	00106$
      00ADB7 1E 01            [ 2]  138 	ldw	x, (0x01, sp)
      00ADB9 5A               [ 2]  139 	decw	x
      00ADBA 1F 01            [ 2]  140 	ldw	(0x01, sp), x
      00ADBC 20 F0            [ 2]  141 	jra	00108$
      00ADBE                        142 00106$:
                                    143 ;	./../../mib/stm8s_mib_eeprom.c: 129: return 0; // false...
      00ADBE 4F               [ 1]  144 	clr	a
                                    145 ;	./../../mib/stm8s_mib_eeprom.c: 132: return 1; // true...
      00ADBF C5                     146 	.byte 0xc5
      00ADC0                        147 00110$:
      00ADC0 A6 01            [ 1]  148 	ld	a, #0x01
      00ADC2                        149 00111$:
                                    150 ;	./../../mib/stm8s_mib_eeprom.c: 133: }
      00ADC2 5B 03            [ 2]  151 	addw	sp, #3
      00ADC4 81               [ 4]  152 	ret
                                    153 ;	./../../mib/stm8s_mib_eeprom.c: 146: uint8_t mmEepromRead(uint16_t vbOffset)
                                    154 ;	-----------------------------------------
                                    155 ;	 function mmEepromRead
                                    156 ;	-----------------------------------------
      00ADC5                        157 _mmEepromRead:
                                    158 ;	./../../mib/stm8s_mib_eeprom.c: 149: if(vbOffset > (FLASH_DATA_END_PHYSICAL_ADDRESS - FLASH_DATA_START_PHYSICAL_ADDRESS))
      00ADC5 A3 03 FF         [ 2]  159 	cpw	x, #0x03ff
      00ADC8 23 02            [ 2]  160 	jrule	00102$
                                    161 ;	./../../mib/stm8s_mib_eeprom.c: 151: return 0; // false...
      00ADCA 4F               [ 1]  162 	clr	a
      00ADCB 81               [ 4]  163 	ret
      00ADCC                        164 00102$:
                                    165 ;	./../../mib/stm8s_mib_eeprom.c: 154: vbData = *((uint8_t *)(FLASH_DATA_START_PHYSICAL_ADDRESS+vbOffset));
      00ADCC D6 40 00         [ 1]  166 	ld	a, (0x4000, x)
                                    167 ;	./../../mib/stm8s_mib_eeprom.c: 155: return vbData;
                                    168 ;	./../../mib/stm8s_mib_eeprom.c: 157: }
      00ADCF 81               [ 4]  169 	ret
                                    170 	.area CODE
                                    171 	.area CONST
                                    172 	.area INITIALIZER
                                    173 	.area CABS (ABS)
