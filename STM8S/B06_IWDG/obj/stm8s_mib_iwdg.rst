                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_mib_iwdg
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _mib_printf
                                     12 	.globl _gwTableDataIWDG
                                     13 	.globl _calConfigIWDG
                                     14 ;--------------------------------------------------------
                                     15 ; ram data
                                     16 ;--------------------------------------------------------
                                     17 	.area DATA
                                     18 ;--------------------------------------------------------
                                     19 ; ram data
                                     20 ;--------------------------------------------------------
                                     21 	.area INITIALIZED
      000157                         22 _gwTableDataIWDG::
      000157                         23 	.ds 16
                                     24 ;--------------------------------------------------------
                                     25 ; absolute external ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area DABS (ABS)
                                     28 
                                     29 ; default segment ordering for linker
                                     30 	.area HOME
                                     31 	.area GSINIT
                                     32 	.area GSFINAL
                                     33 	.area CONST
                                     34 	.area INITIALIZER
                                     35 	.area CODE
                                     36 
                                     37 ;--------------------------------------------------------
                                     38 ; global & static initialisations
                                     39 ;--------------------------------------------------------
                                     40 	.area HOME
                                     41 	.area GSINIT
                                     42 	.area GSFINAL
                                     43 	.area GSINIT
                                     44 ;--------------------------------------------------------
                                     45 ; Home
                                     46 ;--------------------------------------------------------
                                     47 	.area HOME
                                     48 	.area HOME
                                     49 ;--------------------------------------------------------
                                     50 ; code
                                     51 ;--------------------------------------------------------
                                     52 	.area CODE
                                     53 ;	./../../mib/stm8s_mib_iwdg.c: 40: void calConfigIWDG(uint16_t vwDelay) // msec... 
                                     54 ;	-----------------------------------------
                                     55 ;	 function calConfigIWDG
                                     56 ;	-----------------------------------------
      008BCD                         57 _calConfigIWDG:
      008BCD 52 0B            [ 2]   58 	sub	sp, #11
                                     59 ;	./../../mib/stm8s_mib_iwdg.c: 42: uint32_t vdwData = vwDelay;
      008BCF 1F 09            [ 2]   60 	ldw	(0x09, sp), x
      008BD1 1F 04            [ 2]   61 	ldw	(0x04, sp), x
      008BD3 5F               [ 1]   62 	clrw	x
      008BD4 1F 02            [ 2]   63 	ldw	(0x02, sp), x
                                     64 ;	./../../mib/stm8s_mib_iwdg.c: 46: for(vbIndex=0;;vbIndex++)
      008BD6 0F 06            [ 1]   65 	clr	(0x06, sp)
      008BD8 0F 0B            [ 1]   66 	clr	(0x0b, sp)
      008BDA                         67 00110$:
                                     68 ;	./../../mib/stm8s_mib_iwdg.c: 48: if(gwTableDataIWDG[vbIndex]==0)
      008BDA 7B 0B            [ 1]   69 	ld	a, (0x0b, sp)
      008BDC 5F               [ 1]   70 	clrw	x
      008BDD 97               [ 1]   71 	ld	xl, a
      008BDE 58               [ 2]   72 	sllw	x
      008BDF DE 01 57         [ 2]   73 	ldw	x, (_gwTableDataIWDG+0, x)
      008BE2 1F 07            [ 2]   74 	ldw	(0x07, sp), x
      008BE4 26 07            [ 1]   75 	jrne	00104$
                                     76 ;	./../../mib/stm8s_mib_iwdg.c: 51: vbPRBIT = vbIndex - 1;
      008BE6 7B 06            [ 1]   77 	ld	a, (0x06, sp)
      008BE8 4A               [ 1]   78 	dec	a
      008BE9 6B 0B            [ 1]   79 	ld	(0x0b, sp), a
                                     80 ;	./../../mib/stm8s_mib_iwdg.c: 52: break;
      008BEB 20 14            [ 2]   81 	jra	00106$
      008BED                         82 00104$:
                                     83 ;	./../../mib/stm8s_mib_iwdg.c: 54: else if(vwDelay <= gwTableDataIWDG[vbIndex])
      008BED 1E 09            [ 2]   84 	ldw	x, (0x09, sp)
      008BEF 13 07            [ 2]   85 	cpw	x, (0x07, sp)
      008BF1 22 06            [ 1]   86 	jrugt	00111$
                                     87 ;	./../../mib/stm8s_mib_iwdg.c: 56: vbPRBIT = vbIndex;
      008BF3 7B 06            [ 1]   88 	ld	a, (0x06, sp)
      008BF5 6B 0B            [ 1]   89 	ld	(0x0b, sp), a
                                     90 ;	./../../mib/stm8s_mib_iwdg.c: 57: break;
      008BF7 20 08            [ 2]   91 	jra	00106$
      008BF9                         92 00111$:
                                     93 ;	./../../mib/stm8s_mib_iwdg.c: 46: for(vbIndex=0;;vbIndex++)
      008BF9 0C 0B            [ 1]   94 	inc	(0x0b, sp)
      008BFB 7B 0B            [ 1]   95 	ld	a, (0x0b, sp)
      008BFD 6B 06            [ 1]   96 	ld	(0x06, sp), a
      008BFF 20 D9            [ 2]   97 	jra	00110$
      008C01                         98 00106$:
                                     99 ;	./../../mib/stm8s_mib_iwdg.c: 61: vdwData = (vdwData * 128) / 2;
      008C01 1E 04            [ 2]  100 	ldw	x, (0x04, sp)
      008C03 16 02            [ 2]  101 	ldw	y, (0x02, sp)
      008C05 A6 07            [ 1]  102 	ld	a, #0x07
      008C07                        103 00136$:
      008C07 58               [ 2]  104 	sllw	x
      008C08 90 59            [ 2]  105 	rlcw	y
      008C0A 4A               [ 1]  106 	dec	a
      008C0B 26 FA            [ 1]  107 	jrne	00136$
      008C0D 90 54            [ 2]  108 	srlw	y
      008C0F 56               [ 2]  109 	rrcw	x
      008C10 1F 03            [ 2]  110 	ldw	(0x03, sp), x
                                    111 ;	./../../mib/stm8s_mib_iwdg.c: 62: vdwData = vdwData / (1<<(vbPRBIT+2));
      008C12 7B 0B            [ 1]  112 	ld	a, (0x0b, sp)
      008C14 AB 02            [ 1]  113 	add	a, #0x02
      008C16 5F               [ 1]  114 	clrw	x
      008C17 5C               [ 1]  115 	incw	x
      008C18 4D               [ 1]  116 	tnz	a
      008C19 27 04            [ 1]  117 	jreq	00139$
      008C1B                        118 00138$:
      008C1B 58               [ 2]  119 	sllw	x
      008C1C 4A               [ 1]  120 	dec	a
      008C1D 26 FC            [ 1]  121 	jrne	00138$
      008C1F                        122 00139$:
      008C1F 9E               [ 1]  123 	ld	a, xh
      008C20 49               [ 1]  124 	rlc	a
      008C21 4F               [ 1]  125 	clr	a
      008C22 A2 00            [ 1]  126 	sbc	a, #0x00
      008C24 6B 06            [ 1]  127 	ld	(0x06, sp), a
      008C26 6B 05            [ 1]  128 	ld	(0x05, sp), a
      008C28 89               [ 2]  129 	pushw	x
      008C29 1E 07            [ 2]  130 	ldw	x, (0x07, sp)
      008C2B 89               [ 2]  131 	pushw	x
      008C2C 1E 07            [ 2]  132 	ldw	x, (0x07, sp)
      008C2E 89               [ 2]  133 	pushw	x
      008C2F 90 89            [ 2]  134 	pushw	y
      008C31 CD A8 87         [ 4]  135 	call	__divulong
      008C34 5B 08            [ 2]  136 	addw	sp, #8
      008C36 1F 03            [ 2]  137 	ldw	(0x03, sp), x
      008C38 17 01            [ 2]  138 	ldw	(0x01, sp), y
                                    139 ;	./../../mib/stm8s_mib_iwdg.c: 63: if(vdwData > 255)
      008C3A AE 00 FF         [ 2]  140 	ldw	x, #0x00ff
      008C3D 13 03            [ 2]  141 	cpw	x, (0x03, sp)
      008C3F 4F               [ 1]  142 	clr	a
      008C40 12 02            [ 1]  143 	sbc	a, (0x02, sp)
      008C42 4F               [ 1]  144 	clr	a
      008C43 12 01            [ 1]  145 	sbc	a, (0x01, sp)
      008C45 24 06            [ 1]  146 	jrnc	00108$
                                    147 ;	./../../mib/stm8s_mib_iwdg.c: 65: vbRLRBIT = 0xff;
      008C47 A6 FF            [ 1]  148 	ld	a, #0xff
      008C49 6B 06            [ 1]  149 	ld	(0x06, sp), a
      008C4B 20 04            [ 2]  150 	jra	00109$
      008C4D                        151 00108$:
                                    152 ;	./../../mib/stm8s_mib_iwdg.c: 69: vbRLRBIT = (uint8_t)(vdwData&0xff);
      008C4D 7B 04            [ 1]  153 	ld	a, (0x04, sp)
      008C4F 6B 06            [ 1]  154 	ld	(0x06, sp), a
      008C51                        155 00109$:
                                    156 ;	./../../mib/stm8s_mib_iwdg.c: 71: ccprintf(_DEBUG_IWDG_A_, ("calConfigIWDG...vbPRBIT[%u]/vbRLRBIT[%u]\r\n",vbPRBIT,vbRLRBIT));		
      008C51 5F               [ 1]  157 	clrw	x
      008C52 7B 06            [ 1]  158 	ld	a, (0x06, sp)
      008C54 97               [ 1]  159 	ld	xl, a
      008C55 7B 0B            [ 1]  160 	ld	a, (0x0b, sp)
      008C57 0F 07            [ 1]  161 	clr	(0x07, sp)
      008C59 89               [ 2]  162 	pushw	x
      008C5A 88               [ 1]  163 	push	a
      008C5B 7B 0A            [ 1]  164 	ld	a, (0x0a, sp)
      008C5D 88               [ 1]  165 	push	a
      008C5E 4B BE            [ 1]  166 	push	#<(__str_0+0)
      008C60 4B 82            [ 1]  167 	push	#((__str_0+0) >> 8)
      008C62 CD 96 B4         [ 4]  168 	call	_mib_printf
      008C65 5B 06            [ 2]  169 	addw	sp, #6
                                    170 ;	./../../mib/stm8s_mib_iwdg.c: 72: MibWriteDebugEmptyCheck();
      008C67 CD 8C 98         [ 4]  171 	call	_MibWriteDebugEmptyCheck
                                    172 ;	./../../mib/stm8s_mib_iwdg.c: 73: IWDG->KR = 0xCC; // KEY_START , enable...
      008C6A 35 CC 50 E0      [ 1]  173 	mov	0x50e0+0, #0xcc
                                    174 ;	./../../mib/stm8s_mib_iwdg.c: 74: IWDG->KR = 0x55; // KEY_ACCESS
      008C6E 35 55 50 E0      [ 1]  175 	mov	0x50e0+0, #0x55
                                    176 ;	./../../mib/stm8s_mib_iwdg.c: 75: IWDG->PR = (uint8_t)vbPRBIT; 
      008C72 AE 50 E1         [ 2]  177 	ldw	x, #0x50e1
      008C75 7B 0B            [ 1]  178 	ld	a, (0x0b, sp)
      008C77 F7               [ 1]  179 	ld	(x), a
                                    180 ;	./../../mib/stm8s_mib_iwdg.c: 76: IWDG->RLR = vbRLRBIT;
      008C78 AE 50 E2         [ 2]  181 	ldw	x, #0x50e2
      008C7B 7B 06            [ 1]  182 	ld	a, (0x06, sp)
      008C7D F7               [ 1]  183 	ld	(x), a
                                    184 ;	./../../mib/stm8s_mib_iwdg.c: 77: IWDG->KR = 0xAA; // KEY_REFRESH
      008C7E 35 AA 50 E0      [ 1]  185 	mov	0x50e0+0, #0xaa
                                    186 ;	./../../mib/stm8s_mib_iwdg.c: 79: }
      008C82 5B 0B            [ 2]  187 	addw	sp, #11
      008C84 81               [ 4]  188 	ret
                                    189 	.area CODE
                                    190 	.area CONST
                                    191 	.area CONST
      0082BE                        192 __str_0:
      0082BE 63 61 6C 43 6F 6E 66   193 	.ascii "calConfigIWDG...vbPRBIT[%u]/vbRLRBIT[%u]"
             69 67 49 57 44 47 2E
             2E 2E 76 62 50 52 42
             49 54 5B 25 75 5D 2F
             76 62 52 4C 52 42 49
             54 5B 25 75 5D
      0082E6 0D                     194 	.db 0x0d
      0082E7 0A                     195 	.db 0x0a
      0082E8 00                     196 	.db 0x00
                                    197 	.area CODE
                                    198 	.area INITIALIZER
      008904                        199 __xinit__gwTableDataIWDG:
      008904 00 0F                  200 	.dw #0x000f
      008906 00 1F                  201 	.dw #0x001f
      008908 00 3F                  202 	.dw #0x003f
      00890A 00 7F                  203 	.dw #0x007f
      00890C 00 FF                  204 	.dw #0x00ff
      00890E 01 FE                  205 	.dw #0x01fe
      008910 03 E8                  206 	.dw #0x03e8
      008912 00 00                  207 	.dw #0x0000
                                    208 	.area CABS (ABS)
