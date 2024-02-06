                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_mib_wwdg
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _mib_printf
                                     12 	.globl _calConfigWWDG
                                     13 ;--------------------------------------------------------
                                     14 ; ram data
                                     15 ;--------------------------------------------------------
                                     16 	.area DATA
                                     17 ;--------------------------------------------------------
                                     18 ; ram data
                                     19 ;--------------------------------------------------------
                                     20 	.area INITIALIZED
                                     21 ;--------------------------------------------------------
                                     22 ; absolute external ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area DABS (ABS)
                                     25 
                                     26 ; default segment ordering for linker
                                     27 	.area HOME
                                     28 	.area GSINIT
                                     29 	.area GSFINAL
                                     30 	.area CONST
                                     31 	.area INITIALIZER
                                     32 	.area CODE
                                     33 
                                     34 ;--------------------------------------------------------
                                     35 ; global & static initialisations
                                     36 ;--------------------------------------------------------
                                     37 	.area HOME
                                     38 	.area GSINIT
                                     39 	.area GSFINAL
                                     40 	.area GSINIT
                                     41 ;--------------------------------------------------------
                                     42 ; Home
                                     43 ;--------------------------------------------------------
                                     44 	.area HOME
                                     45 	.area HOME
                                     46 ;--------------------------------------------------------
                                     47 ; code
                                     48 ;--------------------------------------------------------
                                     49 	.area CODE
                                     50 ;	./../../mib/stm8s_mib_wwdg.c: 41: uint16_t calConfigWWDG(uint16_t vwDelay) // msec... 
                                     51 ;	-----------------------------------------
                                     52 ;	 function calConfigWWDG
                                     53 ;	-----------------------------------------
      008BF1                         54 _calConfigWWDG:
      008BF1 52 04            [ 2]   55 	sub	sp, #4
                                     56 ;	./../../mib/stm8s_mib_wwdg.c: 43: uint32_t vdwData = vwDelay;
      008BF3 1F 03            [ 2]   57 	ldw	(0x03, sp), x
      008BF5 90 5F            [ 1]   58 	clrw	y
                                     59 ;	./../../mib/stm8s_mib_wwdg.c: 44: if(vwDelay>50)
      008BF7 A3 00 32         [ 2]   60 	cpw	x, #0x0032
      008BFA 23 07            [ 2]   61 	jrule	00102$
                                     62 ;	./../../mib/stm8s_mib_wwdg.c: 46: vdwData = 0x3F;
      008BFC AE 00 3F         [ 2]   63 	ldw	x, #0x003f
      008BFF 1F 03            [ 2]   64 	ldw	(0x03, sp), x
      008C01 20 34            [ 2]   65 	jra	00103$
      008C03                         66 00102$:
                                     67 ;	./../../mib/stm8s_mib_wwdg.c: 50: vdwData = vdwData * 16000000;
      008C03 1E 03            [ 2]   68 	ldw	x, (0x03, sp)
      008C05 89               [ 2]   69 	pushw	x
      008C06 90 89            [ 2]   70 	pushw	y
      008C08 4B 00            [ 1]   71 	push	#0x00
      008C0A 4B 24            [ 1]   72 	push	#0x24
      008C0C 4B F4            [ 1]   73 	push	#0xf4
      008C0E 4B 00            [ 1]   74 	push	#0x00
      008C10 CD A9 68         [ 4]   75 	call	__mullong
      008C13 5B 08            [ 2]   76 	addw	sp, #8
                                     77 ;	./../../mib/stm8s_mib_wwdg.c: 51: vdwData = vdwData / 12288;
      008C15 4B 00            [ 1]   78 	push	#0x00
      008C17 4B 30            [ 1]   79 	push	#0x30
      008C19 4B 00            [ 1]   80 	push	#0x00
      008C1B 4B 00            [ 1]   81 	push	#0x00
      008C1D 89               [ 2]   82 	pushw	x
      008C1E 90 89            [ 2]   83 	pushw	y
      008C20 CD A8 36         [ 4]   84 	call	__divulong
      008C23 5B 08            [ 2]   85 	addw	sp, #8
                                     86 ;	./../../mib/stm8s_mib_wwdg.c: 52: vdwData = vdwData / 1000;
      008C25 4B E8            [ 1]   87 	push	#0xe8
      008C27 4B 03            [ 1]   88 	push	#0x03
      008C29 4B 00            [ 1]   89 	push	#0x00
      008C2B 4B 00            [ 1]   90 	push	#0x00
      008C2D 89               [ 2]   91 	pushw	x
      008C2E 90 89            [ 2]   92 	pushw	y
      008C30 CD A8 36         [ 4]   93 	call	__divulong
      008C33 5B 08            [ 2]   94 	addw	sp, #8
      008C35 1F 03            [ 2]   95 	ldw	(0x03, sp), x
      008C37                         96 00103$:
                                     97 ;	./../../mib/stm8s_mib_wwdg.c: 54: vwDelay = vdwData;
      008C37 1E 03            [ 2]   98 	ldw	x, (0x03, sp)
                                     99 ;	./../../mib/stm8s_mib_wwdg.c: 55: ccprintf(_DEBUG_WWDG_A_, ("calConfigWWDG : [%u][0x%x]\r\n",vwDelay));		 
      008C39 89               [ 2]  100 	pushw	x
      008C3A 89               [ 2]  101 	pushw	x
      008C3B 4B BE            [ 1]  102 	push	#<(__str_0+0)
      008C3D 4B 82            [ 1]  103 	push	#((__str_0+0) >> 8)
      008C3F CD 96 77         [ 4]  104 	call	_mib_printf
      008C42 5B 04            [ 2]  105 	addw	sp, #4
      008C44 85               [ 2]  106 	popw	x
                                    107 ;	./../../mib/stm8s_mib_wwdg.c: 56: return vwDelay;
                                    108 ;	./../../mib/stm8s_mib_wwdg.c: 57: }
      008C45 5B 04            [ 2]  109 	addw	sp, #4
      008C47 81               [ 4]  110 	ret
                                    111 	.area CODE
                                    112 	.area CONST
                                    113 	.area CONST
      0082BE                        114 __str_0:
      0082BE 63 61 6C 43 6F 6E 66   115 	.ascii "calConfigWWDG : [%u][0x%x]"
             69 67 57 57 44 47 20
             3A 20 5B 25 75 5D 5B
             30 78 25 78 5D
      0082D8 0D                     116 	.db 0x0d
      0082D9 0A                     117 	.db 0x0a
      0082DA 00                     118 	.db 0x00
                                    119 	.area CODE
                                    120 	.area INITIALIZER
                                    121 	.area CABS (ABS)
