                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_tim1
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM1_DeInit
                                     12 	.globl _TIM1_TimeBaseInit
                                     13 	.globl _TIM1_OC1Init
                                     14 	.globl _TIM1_OC2Init
                                     15 	.globl _TIM1_OC3Init
                                     16 	.globl _TIM1_OC4Init
                                     17 	.globl _TIM1_BDTRConfig
                                     18 	.globl _TIM1_ICInit
                                     19 	.globl _TIM1_PWMIConfig
                                     20 	.globl _TIM1_Cmd
                                     21 	.globl _TIM1_CtrlPWMOutputs
                                     22 	.globl _TIM1_ITConfig
                                     23 	.globl _TIM1_InternalClockConfig
                                     24 	.globl _TIM1_ETRClockMode1Config
                                     25 	.globl _TIM1_ETRClockMode2Config
                                     26 	.globl _TIM1_ETRConfig
                                     27 	.globl _TIM1_TIxExternalClockConfig
                                     28 	.globl _TIM1_SelectInputTrigger
                                     29 	.globl _TIM1_UpdateDisableConfig
                                     30 	.globl _TIM1_UpdateRequestConfig
                                     31 	.globl _TIM1_SelectHallSensor
                                     32 	.globl _TIM1_SelectOnePulseMode
                                     33 	.globl _TIM1_SelectOutputTrigger
                                     34 	.globl _TIM1_SelectSlaveMode
                                     35 	.globl _TIM1_SelectMasterSlaveMode
                                     36 	.globl _TIM1_EncoderInterfaceConfig
                                     37 	.globl _TIM1_PrescalerConfig
                                     38 	.globl _TIM1_CounterModeConfig
                                     39 	.globl _TIM1_ForcedOC1Config
                                     40 	.globl _TIM1_ForcedOC2Config
                                     41 	.globl _TIM1_ForcedOC3Config
                                     42 	.globl _TIM1_ForcedOC4Config
                                     43 	.globl _TIM1_ARRPreloadConfig
                                     44 	.globl _TIM1_SelectCOM
                                     45 	.globl _TIM1_CCPreloadControl
                                     46 	.globl _TIM1_OC1PreloadConfig
                                     47 	.globl _TIM1_OC2PreloadConfig
                                     48 	.globl _TIM1_OC3PreloadConfig
                                     49 	.globl _TIM1_OC4PreloadConfig
                                     50 	.globl _TIM1_OC1FastConfig
                                     51 	.globl _TIM1_OC2FastConfig
                                     52 	.globl _TIM1_OC3FastConfig
                                     53 	.globl _TIM1_OC4FastConfig
                                     54 	.globl _TIM1_GenerateEvent
                                     55 	.globl _TIM1_OC1PolarityConfig
                                     56 	.globl _TIM1_OC1NPolarityConfig
                                     57 	.globl _TIM1_OC2PolarityConfig
                                     58 	.globl _TIM1_OC2NPolarityConfig
                                     59 	.globl _TIM1_OC3PolarityConfig
                                     60 	.globl _TIM1_OC3NPolarityConfig
                                     61 	.globl _TIM1_OC4PolarityConfig
                                     62 	.globl _TIM1_CCxCmd
                                     63 	.globl _TIM1_CCxNCmd
                                     64 	.globl _TIM1_SelectOCxM
                                     65 	.globl _TIM1_SetCounter
                                     66 	.globl _TIM1_SetAutoreload
                                     67 	.globl _TIM1_SetCompare1
                                     68 	.globl _TIM1_SetCompare2
                                     69 	.globl _TIM1_SetCompare3
                                     70 	.globl _TIM1_SetCompare4
                                     71 	.globl _TIM1_SetIC1Prescaler
                                     72 	.globl _TIM1_SetIC2Prescaler
                                     73 	.globl _TIM1_SetIC3Prescaler
                                     74 	.globl _TIM1_SetIC4Prescaler
                                     75 	.globl _TIM1_GetCapture1
                                     76 	.globl _TIM1_GetCapture2
                                     77 	.globl _TIM1_GetCapture3
                                     78 	.globl _TIM1_GetCapture4
                                     79 	.globl _TIM1_GetCounter
                                     80 	.globl _TIM1_GetPrescaler
                                     81 	.globl _TIM1_GetFlagStatus
                                     82 	.globl _TIM1_ClearFlag
                                     83 	.globl _TIM1_GetITStatus
                                     84 	.globl _TIM1_ClearITPendingBit
                                     85 ;--------------------------------------------------------
                                     86 ; ram data
                                     87 ;--------------------------------------------------------
                                     88 	.area DATA
                                     89 ;--------------------------------------------------------
                                     90 ; ram data
                                     91 ;--------------------------------------------------------
                                     92 	.area INITIALIZED
                                     93 ;--------------------------------------------------------
                                     94 ; absolute external ram data
                                     95 ;--------------------------------------------------------
                                     96 	.area DABS (ABS)
                                     97 
                                     98 ; default segment ordering for linker
                                     99 	.area HOME
                                    100 	.area GSINIT
                                    101 	.area GSFINAL
                                    102 	.area CONST
                                    103 	.area INITIALIZER
                                    104 	.area CODE
                                    105 
                                    106 ;--------------------------------------------------------
                                    107 ; global & static initialisations
                                    108 ;--------------------------------------------------------
                                    109 	.area HOME
                                    110 	.area GSINIT
                                    111 	.area GSFINAL
                                    112 	.area GSINIT
                                    113 ;--------------------------------------------------------
                                    114 ; Home
                                    115 ;--------------------------------------------------------
                                    116 	.area HOME
                                    117 	.area HOME
                                    118 ;--------------------------------------------------------
                                    119 ; code
                                    120 ;--------------------------------------------------------
                                    121 	.area CODE
                                    122 ;	./../../lib/src/stm8s_tim1.c: 58: void TIM1_DeInit(void)
                                    123 ;	-----------------------------------------
                                    124 ;	 function TIM1_DeInit
                                    125 ;	-----------------------------------------
      009942                        126 _TIM1_DeInit:
                                    127 ;	./../../lib/src/stm8s_tim1.c: 60: TIM1->CR1  = TIM1_CR1_RESET_VALUE;
      009942 35 00 52 50      [ 1]  128 	mov	0x5250+0, #0x00
                                    129 ;	./../../lib/src/stm8s_tim1.c: 61: TIM1->CR2  = TIM1_CR2_RESET_VALUE;
      009946 35 00 52 51      [ 1]  130 	mov	0x5251+0, #0x00
                                    131 ;	./../../lib/src/stm8s_tim1.c: 62: TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
      00994A 35 00 52 52      [ 1]  132 	mov	0x5252+0, #0x00
                                    133 ;	./../../lib/src/stm8s_tim1.c: 63: TIM1->ETR  = TIM1_ETR_RESET_VALUE;
      00994E 35 00 52 53      [ 1]  134 	mov	0x5253+0, #0x00
                                    135 ;	./../../lib/src/stm8s_tim1.c: 64: TIM1->IER  = TIM1_IER_RESET_VALUE;
      009952 35 00 52 54      [ 1]  136 	mov	0x5254+0, #0x00
                                    137 ;	./../../lib/src/stm8s_tim1.c: 65: TIM1->SR2  = TIM1_SR2_RESET_VALUE;
      009956 35 00 52 56      [ 1]  138 	mov	0x5256+0, #0x00
                                    139 ;	./../../lib/src/stm8s_tim1.c: 67: TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
      00995A 35 00 52 5C      [ 1]  140 	mov	0x525c+0, #0x00
                                    141 ;	./../../lib/src/stm8s_tim1.c: 68: TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
      00995E 35 00 52 5D      [ 1]  142 	mov	0x525d+0, #0x00
                                    143 ;	./../../lib/src/stm8s_tim1.c: 70: TIM1->CCMR1 = 0x01;
      009962 35 01 52 58      [ 1]  144 	mov	0x5258+0, #0x01
                                    145 ;	./../../lib/src/stm8s_tim1.c: 71: TIM1->CCMR2 = 0x01;
      009966 35 01 52 59      [ 1]  146 	mov	0x5259+0, #0x01
                                    147 ;	./../../lib/src/stm8s_tim1.c: 72: TIM1->CCMR3 = 0x01;
      00996A 35 01 52 5A      [ 1]  148 	mov	0x525a+0, #0x01
                                    149 ;	./../../lib/src/stm8s_tim1.c: 73: TIM1->CCMR4 = 0x01;
      00996E 35 01 52 5B      [ 1]  150 	mov	0x525b+0, #0x01
                                    151 ;	./../../lib/src/stm8s_tim1.c: 75: TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
      009972 35 00 52 5C      [ 1]  152 	mov	0x525c+0, #0x00
                                    153 ;	./../../lib/src/stm8s_tim1.c: 76: TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
      009976 35 00 52 5D      [ 1]  154 	mov	0x525d+0, #0x00
                                    155 ;	./../../lib/src/stm8s_tim1.c: 77: TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
      00997A 35 00 52 58      [ 1]  156 	mov	0x5258+0, #0x00
                                    157 ;	./../../lib/src/stm8s_tim1.c: 78: TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
      00997E 35 00 52 59      [ 1]  158 	mov	0x5259+0, #0x00
                                    159 ;	./../../lib/src/stm8s_tim1.c: 79: TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
      009982 35 00 52 5A      [ 1]  160 	mov	0x525a+0, #0x00
                                    161 ;	./../../lib/src/stm8s_tim1.c: 80: TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
      009986 35 00 52 5B      [ 1]  162 	mov	0x525b+0, #0x00
                                    163 ;	./../../lib/src/stm8s_tim1.c: 81: TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
      00998A 35 00 52 5E      [ 1]  164 	mov	0x525e+0, #0x00
                                    165 ;	./../../lib/src/stm8s_tim1.c: 82: TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
      00998E 35 00 52 5F      [ 1]  166 	mov	0x525f+0, #0x00
                                    167 ;	./../../lib/src/stm8s_tim1.c: 83: TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
      009992 35 00 52 60      [ 1]  168 	mov	0x5260+0, #0x00
                                    169 ;	./../../lib/src/stm8s_tim1.c: 84: TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
      009996 35 00 52 61      [ 1]  170 	mov	0x5261+0, #0x00
                                    171 ;	./../../lib/src/stm8s_tim1.c: 85: TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
      00999A 35 FF 52 62      [ 1]  172 	mov	0x5262+0, #0xff
                                    173 ;	./../../lib/src/stm8s_tim1.c: 86: TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
      00999E 35 FF 52 63      [ 1]  174 	mov	0x5263+0, #0xff
                                    175 ;	./../../lib/src/stm8s_tim1.c: 87: TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
      0099A2 35 00 52 65      [ 1]  176 	mov	0x5265+0, #0x00
                                    177 ;	./../../lib/src/stm8s_tim1.c: 88: TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
      0099A6 35 00 52 66      [ 1]  178 	mov	0x5266+0, #0x00
                                    179 ;	./../../lib/src/stm8s_tim1.c: 89: TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
      0099AA 35 00 52 67      [ 1]  180 	mov	0x5267+0, #0x00
                                    181 ;	./../../lib/src/stm8s_tim1.c: 90: TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
      0099AE 35 00 52 68      [ 1]  182 	mov	0x5268+0, #0x00
                                    183 ;	./../../lib/src/stm8s_tim1.c: 91: TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
      0099B2 35 00 52 69      [ 1]  184 	mov	0x5269+0, #0x00
                                    185 ;	./../../lib/src/stm8s_tim1.c: 92: TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
      0099B6 35 00 52 6A      [ 1]  186 	mov	0x526a+0, #0x00
                                    187 ;	./../../lib/src/stm8s_tim1.c: 93: TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
      0099BA 35 00 52 6B      [ 1]  188 	mov	0x526b+0, #0x00
                                    189 ;	./../../lib/src/stm8s_tim1.c: 94: TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
      0099BE 35 00 52 6C      [ 1]  190 	mov	0x526c+0, #0x00
                                    191 ;	./../../lib/src/stm8s_tim1.c: 95: TIM1->OISR  = TIM1_OISR_RESET_VALUE;
      0099C2 35 00 52 6F      [ 1]  192 	mov	0x526f+0, #0x00
                                    193 ;	./../../lib/src/stm8s_tim1.c: 96: TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
      0099C6 35 01 52 57      [ 1]  194 	mov	0x5257+0, #0x01
                                    195 ;	./../../lib/src/stm8s_tim1.c: 97: TIM1->DTR   = TIM1_DTR_RESET_VALUE;
      0099CA 35 00 52 6E      [ 1]  196 	mov	0x526e+0, #0x00
                                    197 ;	./../../lib/src/stm8s_tim1.c: 98: TIM1->BKR   = TIM1_BKR_RESET_VALUE;
      0099CE 35 00 52 6D      [ 1]  198 	mov	0x526d+0, #0x00
                                    199 ;	./../../lib/src/stm8s_tim1.c: 99: TIM1->RCR   = TIM1_RCR_RESET_VALUE;
      0099D2 35 00 52 64      [ 1]  200 	mov	0x5264+0, #0x00
                                    201 ;	./../../lib/src/stm8s_tim1.c: 100: TIM1->SR1   = TIM1_SR1_RESET_VALUE;
      0099D6 35 00 52 55      [ 1]  202 	mov	0x5255+0, #0x00
                                    203 ;	./../../lib/src/stm8s_tim1.c: 101: }
      0099DA 81               [ 4]  204 	ret
                                    205 ;	./../../lib/src/stm8s_tim1.c: 111: void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
                                    206 ;	-----------------------------------------
                                    207 ;	 function TIM1_TimeBaseInit
                                    208 ;	-----------------------------------------
      0099DB                        209 _TIM1_TimeBaseInit:
      0099DB 88               [ 1]  210 	push	a
      0099DC 6B 01            [ 1]  211 	ld	(0x01, sp), a
                                    212 ;	./../../lib/src/stm8s_tim1.c: 120: TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
      0099DE 7B 04            [ 1]  213 	ld	a, (0x04, sp)
      0099E0 C7 52 62         [ 1]  214 	ld	0x5262, a
                                    215 ;	./../../lib/src/stm8s_tim1.c: 121: TIM1->ARRL = (uint8_t)(TIM1_Period);
      0099E3 7B 05            [ 1]  216 	ld	a, (0x05, sp)
      0099E5 C7 52 63         [ 1]  217 	ld	0x5263, a
                                    218 ;	./../../lib/src/stm8s_tim1.c: 124: TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
      0099E8 9E               [ 1]  219 	ld	a, xh
      0099E9 C7 52 60         [ 1]  220 	ld	0x5260, a
                                    221 ;	./../../lib/src/stm8s_tim1.c: 125: TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
      0099EC 9F               [ 1]  222 	ld	a, xl
      0099ED C7 52 61         [ 1]  223 	ld	0x5261, a
                                    224 ;	./../../lib/src/stm8s_tim1.c: 128: TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
      0099F0 C6 52 50         [ 1]  225 	ld	a, 0x5250
      0099F3 A4 8F            [ 1]  226 	and	a, #0x8f
                                    227 ;	./../../lib/src/stm8s_tim1.c: 129: | (uint8_t)(TIM1_CounterMode));
      0099F5 1A 01            [ 1]  228 	or	a, (0x01, sp)
      0099F7 C7 52 50         [ 1]  229 	ld	0x5250, a
                                    230 ;	./../../lib/src/stm8s_tim1.c: 132: TIM1->RCR = TIM1_RepetitionCounter;
      0099FA AE 52 64         [ 2]  231 	ldw	x, #0x5264
      0099FD 7B 06            [ 1]  232 	ld	a, (0x06, sp)
      0099FF F7               [ 1]  233 	ld	(x), a
                                    234 ;	./../../lib/src/stm8s_tim1.c: 133: }
      009A00 1E 02            [ 2]  235 	ldw	x, (2, sp)
      009A02 5B 06            [ 2]  236 	addw	sp, #6
      009A04 FC               [ 2]  237 	jp	(x)
                                    238 ;	./../../lib/src/stm8s_tim1.c: 154: void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
                                    239 ;	-----------------------------------------
                                    240 ;	 function TIM1_OC1Init
                                    241 ;	-----------------------------------------
      009A05                        242 _TIM1_OC1Init:
      009A05 52 04            [ 2]  243 	sub	sp, #4
      009A07 6B 04            [ 1]  244 	ld	(0x04, sp), a
                                    245 ;	./../../lib/src/stm8s_tim1.c: 174: TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
      009A09 C6 52 5C         [ 1]  246 	ld	a, 0x525c
      009A0C A4 F0            [ 1]  247 	and	a, #0xf0
      009A0E C7 52 5C         [ 1]  248 	ld	0x525c, a
                                    249 ;	./../../lib/src/stm8s_tim1.c: 178: TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
      009A11 C6 52 5C         [ 1]  250 	ld	a, 0x525c
      009A14 6B 01            [ 1]  251 	ld	(0x01, sp), a
      009A16 7B 07            [ 1]  252 	ld	a, (0x07, sp)
      009A18 A4 01            [ 1]  253 	and	a, #0x01
      009A1A 6B 03            [ 1]  254 	ld	(0x03, sp), a
                                    255 ;	./../../lib/src/stm8s_tim1.c: 179: | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
      009A1C 7B 08            [ 1]  256 	ld	a, (0x08, sp)
      009A1E A4 04            [ 1]  257 	and	a, #0x04
      009A20 1A 03            [ 1]  258 	or	a, (0x03, sp)
      009A22 6B 02            [ 1]  259 	ld	(0x02, sp), a
                                    260 ;	./../../lib/src/stm8s_tim1.c: 180: | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
      009A24 7B 0B            [ 1]  261 	ld	a, (0x0b, sp)
      009A26 A4 02            [ 1]  262 	and	a, #0x02
      009A28 6B 03            [ 1]  263 	ld	(0x03, sp), a
                                    264 ;	./../../lib/src/stm8s_tim1.c: 181: | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
      009A2A 7B 0C            [ 1]  265 	ld	a, (0x0c, sp)
      009A2C A4 08            [ 1]  266 	and	a, #0x08
      009A2E 1A 03            [ 1]  267 	or	a, (0x03, sp)
      009A30 1A 02            [ 1]  268 	or	a, (0x02, sp)
      009A32 1A 01            [ 1]  269 	or	a, (0x01, sp)
      009A34 C7 52 5C         [ 1]  270 	ld	0x525c, a
                                    271 ;	./../../lib/src/stm8s_tim1.c: 184: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
      009A37 C6 52 58         [ 1]  272 	ld	a, 0x5258
      009A3A A4 8F            [ 1]  273 	and	a, #0x8f
                                    274 ;	./../../lib/src/stm8s_tim1.c: 185: (uint8_t)TIM1_OCMode);
      009A3C 1A 04            [ 1]  275 	or	a, (0x04, sp)
      009A3E C7 52 58         [ 1]  276 	ld	0x5258, a
                                    277 ;	./../../lib/src/stm8s_tim1.c: 188: TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
      009A41 C6 52 6F         [ 1]  278 	ld	a, 0x526f
      009A44 A4 FC            [ 1]  279 	and	a, #0xfc
      009A46 C7 52 6F         [ 1]  280 	ld	0x526f, a
                                    281 ;	./../../lib/src/stm8s_tim1.c: 190: TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
      009A49 C6 52 6F         [ 1]  282 	ld	a, 0x526f
      009A4C 6B 02            [ 1]  283 	ld	(0x02, sp), a
      009A4E 7B 0D            [ 1]  284 	ld	a, (0x0d, sp)
      009A50 A4 01            [ 1]  285 	and	a, #0x01
      009A52 6B 03            [ 1]  286 	ld	(0x03, sp), a
                                    287 ;	./../../lib/src/stm8s_tim1.c: 191: (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
      009A54 7B 0E            [ 1]  288 	ld	a, (0x0e, sp)
      009A56 A4 02            [ 1]  289 	and	a, #0x02
      009A58 1A 03            [ 1]  290 	or	a, (0x03, sp)
      009A5A 1A 02            [ 1]  291 	or	a, (0x02, sp)
      009A5C C7 52 6F         [ 1]  292 	ld	0x526f, a
                                    293 ;	./../../lib/src/stm8s_tim1.c: 194: TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
      009A5F 7B 09            [ 1]  294 	ld	a, (0x09, sp)
      009A61 C7 52 65         [ 1]  295 	ld	0x5265, a
                                    296 ;	./../../lib/src/stm8s_tim1.c: 195: TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
      009A64 7B 0A            [ 1]  297 	ld	a, (0x0a, sp)
      009A66 C7 52 66         [ 1]  298 	ld	0x5266, a
                                    299 ;	./../../lib/src/stm8s_tim1.c: 196: }
      009A69 1E 05            [ 2]  300 	ldw	x, (5, sp)
      009A6B 5B 0E            [ 2]  301 	addw	sp, #14
      009A6D FC               [ 2]  302 	jp	(x)
                                    303 ;	./../../lib/src/stm8s_tim1.c: 217: void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
                                    304 ;	-----------------------------------------
                                    305 ;	 function TIM1_OC2Init
                                    306 ;	-----------------------------------------
      009A6E                        307 _TIM1_OC2Init:
      009A6E 52 04            [ 2]  308 	sub	sp, #4
      009A70 6B 04            [ 1]  309 	ld	(0x04, sp), a
                                    310 ;	./../../lib/src/stm8s_tim1.c: 237: TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
      009A72 C6 52 5C         [ 1]  311 	ld	a, 0x525c
      009A75 A4 0F            [ 1]  312 	and	a, #0x0f
      009A77 C7 52 5C         [ 1]  313 	ld	0x525c, a
                                    314 ;	./../../lib/src/stm8s_tim1.c: 242: TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
      009A7A C6 52 5C         [ 1]  315 	ld	a, 0x525c
      009A7D 6B 01            [ 1]  316 	ld	(0x01, sp), a
      009A7F 7B 07            [ 1]  317 	ld	a, (0x07, sp)
      009A81 A4 10            [ 1]  318 	and	a, #0x10
      009A83 6B 03            [ 1]  319 	ld	(0x03, sp), a
                                    320 ;	./../../lib/src/stm8s_tim1.c: 243: (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
      009A85 7B 08            [ 1]  321 	ld	a, (0x08, sp)
      009A87 A4 40            [ 1]  322 	and	a, #0x40
      009A89 1A 03            [ 1]  323 	or	a, (0x03, sp)
      009A8B 6B 02            [ 1]  324 	ld	(0x02, sp), a
                                    325 ;	./../../lib/src/stm8s_tim1.c: 244: (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
      009A8D 7B 0B            [ 1]  326 	ld	a, (0x0b, sp)
      009A8F A4 20            [ 1]  327 	and	a, #0x20
      009A91 6B 03            [ 1]  328 	ld	(0x03, sp), a
                                    329 ;	./../../lib/src/stm8s_tim1.c: 245: (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
      009A93 7B 0C            [ 1]  330 	ld	a, (0x0c, sp)
      009A95 A4 80            [ 1]  331 	and	a, #0x80
      009A97 1A 03            [ 1]  332 	or	a, (0x03, sp)
      009A99 1A 02            [ 1]  333 	or	a, (0x02, sp)
      009A9B 1A 01            [ 1]  334 	or	a, (0x01, sp)
      009A9D C7 52 5C         [ 1]  335 	ld	0x525c, a
                                    336 ;	./../../lib/src/stm8s_tim1.c: 248: TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
      009AA0 C6 52 59         [ 1]  337 	ld	a, 0x5259
      009AA3 A4 8F            [ 1]  338 	and	a, #0x8f
                                    339 ;	./../../lib/src/stm8s_tim1.c: 249: (uint8_t)TIM1_OCMode);
      009AA5 1A 04            [ 1]  340 	or	a, (0x04, sp)
      009AA7 C7 52 59         [ 1]  341 	ld	0x5259, a
                                    342 ;	./../../lib/src/stm8s_tim1.c: 252: TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
      009AAA C6 52 6F         [ 1]  343 	ld	a, 0x526f
      009AAD A4 F3            [ 1]  344 	and	a, #0xf3
      009AAF C7 52 6F         [ 1]  345 	ld	0x526f, a
                                    346 ;	./../../lib/src/stm8s_tim1.c: 254: TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
      009AB2 C6 52 6F         [ 1]  347 	ld	a, 0x526f
      009AB5 6B 02            [ 1]  348 	ld	(0x02, sp), a
      009AB7 7B 0D            [ 1]  349 	ld	a, (0x0d, sp)
      009AB9 A4 04            [ 1]  350 	and	a, #0x04
      009ABB 6B 03            [ 1]  351 	ld	(0x03, sp), a
                                    352 ;	./../../lib/src/stm8s_tim1.c: 255: (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
      009ABD 7B 0E            [ 1]  353 	ld	a, (0x0e, sp)
      009ABF A4 08            [ 1]  354 	and	a, #0x08
      009AC1 1A 03            [ 1]  355 	or	a, (0x03, sp)
      009AC3 1A 02            [ 1]  356 	or	a, (0x02, sp)
      009AC5 C7 52 6F         [ 1]  357 	ld	0x526f, a
                                    358 ;	./../../lib/src/stm8s_tim1.c: 258: TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
      009AC8 7B 09            [ 1]  359 	ld	a, (0x09, sp)
      009ACA C7 52 67         [ 1]  360 	ld	0x5267, a
                                    361 ;	./../../lib/src/stm8s_tim1.c: 259: TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
      009ACD 7B 0A            [ 1]  362 	ld	a, (0x0a, sp)
      009ACF C7 52 68         [ 1]  363 	ld	0x5268, a
                                    364 ;	./../../lib/src/stm8s_tim1.c: 260: }
      009AD2 1E 05            [ 2]  365 	ldw	x, (5, sp)
      009AD4 5B 0E            [ 2]  366 	addw	sp, #14
      009AD6 FC               [ 2]  367 	jp	(x)
                                    368 ;	./../../lib/src/stm8s_tim1.c: 281: void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
                                    369 ;	-----------------------------------------
                                    370 ;	 function TIM1_OC3Init
                                    371 ;	-----------------------------------------
      009AD7                        372 _TIM1_OC3Init:
      009AD7 52 04            [ 2]  373 	sub	sp, #4
      009AD9 6B 04            [ 1]  374 	ld	(0x04, sp), a
                                    375 ;	./../../lib/src/stm8s_tim1.c: 301: TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
      009ADB C6 52 5D         [ 1]  376 	ld	a, 0x525d
      009ADE A4 F0            [ 1]  377 	and	a, #0xf0
      009AE0 C7 52 5D         [ 1]  378 	ld	0x525d, a
                                    379 ;	./../../lib/src/stm8s_tim1.c: 305: TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
      009AE3 C6 52 5D         [ 1]  380 	ld	a, 0x525d
      009AE6 6B 01            [ 1]  381 	ld	(0x01, sp), a
      009AE8 7B 07            [ 1]  382 	ld	a, (0x07, sp)
      009AEA A4 01            [ 1]  383 	and	a, #0x01
      009AEC 6B 03            [ 1]  384 	ld	(0x03, sp), a
                                    385 ;	./../../lib/src/stm8s_tim1.c: 306: (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
      009AEE 7B 08            [ 1]  386 	ld	a, (0x08, sp)
      009AF0 A4 04            [ 1]  387 	and	a, #0x04
      009AF2 1A 03            [ 1]  388 	or	a, (0x03, sp)
      009AF4 6B 02            [ 1]  389 	ld	(0x02, sp), a
                                    390 ;	./../../lib/src/stm8s_tim1.c: 307: (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
      009AF6 7B 0B            [ 1]  391 	ld	a, (0x0b, sp)
      009AF8 A4 02            [ 1]  392 	and	a, #0x02
      009AFA 6B 03            [ 1]  393 	ld	(0x03, sp), a
                                    394 ;	./../../lib/src/stm8s_tim1.c: 308: (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
      009AFC 7B 0C            [ 1]  395 	ld	a, (0x0c, sp)
      009AFE A4 08            [ 1]  396 	and	a, #0x08
      009B00 1A 03            [ 1]  397 	or	a, (0x03, sp)
      009B02 1A 02            [ 1]  398 	or	a, (0x02, sp)
      009B04 1A 01            [ 1]  399 	or	a, (0x01, sp)
      009B06 C7 52 5D         [ 1]  400 	ld	0x525d, a
                                    401 ;	./../../lib/src/stm8s_tim1.c: 311: TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
      009B09 C6 52 5A         [ 1]  402 	ld	a, 0x525a
      009B0C A4 8F            [ 1]  403 	and	a, #0x8f
                                    404 ;	./../../lib/src/stm8s_tim1.c: 312: (uint8_t)TIM1_OCMode);
      009B0E 1A 04            [ 1]  405 	or	a, (0x04, sp)
      009B10 C7 52 5A         [ 1]  406 	ld	0x525a, a
                                    407 ;	./../../lib/src/stm8s_tim1.c: 315: TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
      009B13 C6 52 6F         [ 1]  408 	ld	a, 0x526f
      009B16 A4 CF            [ 1]  409 	and	a, #0xcf
      009B18 C7 52 6F         [ 1]  410 	ld	0x526f, a
                                    411 ;	./../../lib/src/stm8s_tim1.c: 317: TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
      009B1B C6 52 6F         [ 1]  412 	ld	a, 0x526f
      009B1E 6B 02            [ 1]  413 	ld	(0x02, sp), a
      009B20 7B 0D            [ 1]  414 	ld	a, (0x0d, sp)
      009B22 A4 10            [ 1]  415 	and	a, #0x10
      009B24 6B 03            [ 1]  416 	ld	(0x03, sp), a
                                    417 ;	./../../lib/src/stm8s_tim1.c: 318: (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
      009B26 7B 0E            [ 1]  418 	ld	a, (0x0e, sp)
      009B28 A4 20            [ 1]  419 	and	a, #0x20
      009B2A 1A 03            [ 1]  420 	or	a, (0x03, sp)
      009B2C 1A 02            [ 1]  421 	or	a, (0x02, sp)
      009B2E C7 52 6F         [ 1]  422 	ld	0x526f, a
                                    423 ;	./../../lib/src/stm8s_tim1.c: 321: TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
      009B31 7B 09            [ 1]  424 	ld	a, (0x09, sp)
      009B33 C7 52 69         [ 1]  425 	ld	0x5269, a
                                    426 ;	./../../lib/src/stm8s_tim1.c: 322: TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
      009B36 7B 0A            [ 1]  427 	ld	a, (0x0a, sp)
      009B38 C7 52 6A         [ 1]  428 	ld	0x526a, a
                                    429 ;	./../../lib/src/stm8s_tim1.c: 323: }
      009B3B 1E 05            [ 2]  430 	ldw	x, (5, sp)
      009B3D 5B 0E            [ 2]  431 	addw	sp, #14
      009B3F FC               [ 2]  432 	jp	(x)
                                    433 ;	./../../lib/src/stm8s_tim1.c: 338: void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
                                    434 ;	-----------------------------------------
                                    435 ;	 function TIM1_OC4Init
                                    436 ;	-----------------------------------------
      009B40                        437 _TIM1_OC4Init:
      009B40 52 03            [ 2]  438 	sub	sp, #3
      009B42 6B 03            [ 1]  439 	ld	(0x03, sp), a
                                    440 ;	./../../lib/src/stm8s_tim1.c: 351: TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
      009B44 C6 52 5D         [ 1]  441 	ld	a, 0x525d
      009B47 A4 CF            [ 1]  442 	and	a, #0xcf
      009B49 C7 52 5D         [ 1]  443 	ld	0x525d, a
                                    444 ;	./../../lib/src/stm8s_tim1.c: 353: TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
      009B4C C6 52 5D         [ 1]  445 	ld	a, 0x525d
      009B4F 6B 01            [ 1]  446 	ld	(0x01, sp), a
      009B51 7B 06            [ 1]  447 	ld	a, (0x06, sp)
      009B53 A4 10            [ 1]  448 	and	a, #0x10
      009B55 6B 02            [ 1]  449 	ld	(0x02, sp), a
                                    450 ;	./../../lib/src/stm8s_tim1.c: 354: (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
      009B57 7B 09            [ 1]  451 	ld	a, (0x09, sp)
      009B59 A4 20            [ 1]  452 	and	a, #0x20
      009B5B 1A 02            [ 1]  453 	or	a, (0x02, sp)
      009B5D 1A 01            [ 1]  454 	or	a, (0x01, sp)
      009B5F C7 52 5D         [ 1]  455 	ld	0x525d, a
                                    456 ;	./../../lib/src/stm8s_tim1.c: 357: TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
      009B62 C6 52 5B         [ 1]  457 	ld	a, 0x525b
      009B65 A4 8F            [ 1]  458 	and	a, #0x8f
      009B67 1A 03            [ 1]  459 	or	a, (0x03, sp)
      009B69 C7 52 5B         [ 1]  460 	ld	0x525b, a
                                    461 ;	./../../lib/src/stm8s_tim1.c: 363: TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
      009B6C C6 52 6F         [ 1]  462 	ld	a, 0x526f
                                    463 ;	./../../lib/src/stm8s_tim1.c: 361: if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
      009B6F 0D 0A            [ 1]  464 	tnz	(0x0a, sp)
      009B71 27 07            [ 1]  465 	jreq	00102$
                                    466 ;	./../../lib/src/stm8s_tim1.c: 363: TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
      009B73 AA DF            [ 1]  467 	or	a, #0xdf
      009B75 C7 52 6F         [ 1]  468 	ld	0x526f, a
      009B78 20 05            [ 2]  469 	jra	00103$
      009B7A                        470 00102$:
                                    471 ;	./../../lib/src/stm8s_tim1.c: 367: TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
      009B7A A4 BF            [ 1]  472 	and	a, #0xbf
      009B7C C7 52 6F         [ 1]  473 	ld	0x526f, a
      009B7F                        474 00103$:
                                    475 ;	./../../lib/src/stm8s_tim1.c: 371: TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
      009B7F 7B 07            [ 1]  476 	ld	a, (0x07, sp)
      009B81 C7 52 6B         [ 1]  477 	ld	0x526b, a
                                    478 ;	./../../lib/src/stm8s_tim1.c: 372: TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
      009B84 7B 08            [ 1]  479 	ld	a, (0x08, sp)
      009B86 C7 52 6C         [ 1]  480 	ld	0x526c, a
                                    481 ;	./../../lib/src/stm8s_tim1.c: 373: }
      009B89 1E 04            [ 2]  482 	ldw	x, (4, sp)
      009B8B 5B 0A            [ 2]  483 	addw	sp, #10
      009B8D FC               [ 2]  484 	jp	(x)
                                    485 ;	./../../lib/src/stm8s_tim1.c: 388: void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
                                    486 ;	-----------------------------------------
                                    487 ;	 function TIM1_BDTRConfig
                                    488 ;	-----------------------------------------
      009B8E                        489 _TIM1_BDTRConfig:
      009B8E 88               [ 1]  490 	push	a
                                    491 ;	./../../lib/src/stm8s_tim1.c: 402: TIM1->DTR = (uint8_t)(TIM1_DeadTime);
      009B8F AE 52 6E         [ 2]  492 	ldw	x, #0x526e
      009B92 88               [ 1]  493 	push	a
      009B93 7B 06            [ 1]  494 	ld	a, (0x06, sp)
      009B95 F7               [ 1]  495 	ld	(x), a
      009B96 84               [ 1]  496 	pop	a
                                    497 ;	./../../lib/src/stm8s_tim1.c: 406: TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
      009B97 1A 04            [ 1]  498 	or	a, (0x04, sp)
      009B99 6B 01            [ 1]  499 	ld	(0x01, sp), a
                                    500 ;	./../../lib/src/stm8s_tim1.c: 407: (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
      009B9B 7B 06            [ 1]  501 	ld	a, (0x06, sp)
      009B9D 1A 07            [ 1]  502 	or	a, (0x07, sp)
                                    503 ;	./../../lib/src/stm8s_tim1.c: 408: (uint8_t)TIM1_AutomaticOutput));
      009B9F 1A 08            [ 1]  504 	or	a, (0x08, sp)
      009BA1 1A 01            [ 1]  505 	or	a, (0x01, sp)
      009BA3 C7 52 6D         [ 1]  506 	ld	0x526d, a
                                    507 ;	./../../lib/src/stm8s_tim1.c: 409: }
      009BA6 1E 02            [ 2]  508 	ldw	x, (2, sp)
      009BA8 5B 08            [ 2]  509 	addw	sp, #8
      009BAA FC               [ 2]  510 	jp	(x)
                                    511 ;	./../../lib/src/stm8s_tim1.c: 423: void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
                                    512 ;	-----------------------------------------
                                    513 ;	 function TIM1_ICInit
                                    514 ;	-----------------------------------------
      009BAB                        515 _TIM1_ICInit:
                                    516 ;	./../../lib/src/stm8s_tim1.c: 439: TI1_Config((uint8_t)TIM1_ICPolarity,
      009BAB 41               [ 1]  517 	exg	a, xl
      009BAC 7B 03            [ 1]  518 	ld	a, (0x03, sp)
      009BAE 41               [ 1]  519 	exg	a, xl
                                    520 ;	./../../lib/src/stm8s_tim1.c: 436: if (TIM1_Channel == TIM1_CHANNEL_1)
      009BAF 4D               [ 1]  521 	tnz	a
      009BB0 26 15            [ 1]  522 	jrne	00108$
                                    523 ;	./../../lib/src/stm8s_tim1.c: 439: TI1_Config((uint8_t)TIM1_ICPolarity,
      009BB2 7B 06            [ 1]  524 	ld	a, (0x06, sp)
      009BB4 88               [ 1]  525 	push	a
      009BB5 7B 05            [ 1]  526 	ld	a, (0x05, sp)
      009BB7 88               [ 1]  527 	push	a
      009BB8 9F               [ 1]  528 	ld	a, xl
      009BB9 CD A2 8E         [ 4]  529 	call	_TI1_Config
                                    530 ;	./../../lib/src/stm8s_tim1.c: 443: TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
      009BBC 7B 05            [ 1]  531 	ld	a, (0x05, sp)
      009BBE 1E 01            [ 2]  532 	ldw	x, (1, sp)
      009BC0 1F 05            [ 2]  533 	ldw	(5, sp), x
      009BC2 5B 04            [ 2]  534 	addw	sp, #4
      009BC4 CC A1 81         [ 2]  535 	jp	_TIM1_SetIC1Prescaler
      009BC7                        536 00108$:
                                    537 ;	./../../lib/src/stm8s_tim1.c: 445: else if (TIM1_Channel == TIM1_CHANNEL_2)
      009BC7 A1 01            [ 1]  538 	cp	a, #0x01
      009BC9 26 15            [ 1]  539 	jrne	00105$
                                    540 ;	./../../lib/src/stm8s_tim1.c: 448: TI2_Config((uint8_t)TIM1_ICPolarity,
      009BCB 7B 06            [ 1]  541 	ld	a, (0x06, sp)
      009BCD 88               [ 1]  542 	push	a
      009BCE 7B 05            [ 1]  543 	ld	a, (0x05, sp)
      009BD0 88               [ 1]  544 	push	a
      009BD1 9F               [ 1]  545 	ld	a, xl
      009BD2 CD A2 C9         [ 4]  546 	call	_TI2_Config
                                    547 ;	./../../lib/src/stm8s_tim1.c: 452: TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
      009BD5 7B 05            [ 1]  548 	ld	a, (0x05, sp)
      009BD7 1E 01            [ 2]  549 	ldw	x, (1, sp)
      009BD9 1F 05            [ 2]  550 	ldw	(5, sp), x
      009BDB 5B 04            [ 2]  551 	addw	sp, #4
      009BDD CC A1 90         [ 2]  552 	jp	_TIM1_SetIC2Prescaler
      009BE0                        553 00105$:
                                    554 ;	./../../lib/src/stm8s_tim1.c: 454: else if (TIM1_Channel == TIM1_CHANNEL_3)
      009BE0 A1 02            [ 1]  555 	cp	a, #0x02
      009BE2 26 15            [ 1]  556 	jrne	00102$
                                    557 ;	./../../lib/src/stm8s_tim1.c: 457: TI3_Config((uint8_t)TIM1_ICPolarity,
      009BE4 7B 06            [ 1]  558 	ld	a, (0x06, sp)
      009BE6 88               [ 1]  559 	push	a
      009BE7 7B 05            [ 1]  560 	ld	a, (0x05, sp)
      009BE9 88               [ 1]  561 	push	a
      009BEA 9F               [ 1]  562 	ld	a, xl
      009BEB CD A3 04         [ 4]  563 	call	_TI3_Config
                                    564 ;	./../../lib/src/stm8s_tim1.c: 461: TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
      009BEE 7B 05            [ 1]  565 	ld	a, (0x05, sp)
      009BF0 1E 01            [ 2]  566 	ldw	x, (1, sp)
      009BF2 1F 05            [ 2]  567 	ldw	(5, sp), x
      009BF4 5B 04            [ 2]  568 	addw	sp, #4
      009BF6 CC A1 9F         [ 2]  569 	jp	_TIM1_SetIC3Prescaler
      009BF9                        570 00102$:
                                    571 ;	./../../lib/src/stm8s_tim1.c: 466: TI4_Config((uint8_t)TIM1_ICPolarity,
      009BF9 7B 06            [ 1]  572 	ld	a, (0x06, sp)
      009BFB 88               [ 1]  573 	push	a
      009BFC 7B 05            [ 1]  574 	ld	a, (0x05, sp)
      009BFE 88               [ 1]  575 	push	a
      009BFF 9F               [ 1]  576 	ld	a, xl
      009C00 CD A3 43         [ 4]  577 	call	_TI4_Config
                                    578 ;	./../../lib/src/stm8s_tim1.c: 470: TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
      009C03 7B 05            [ 1]  579 	ld	a, (0x05, sp)
      009C05 1E 01            [ 2]  580 	ldw	x, (1, sp)
      009C07 1F 05            [ 2]  581 	ldw	(5, sp), x
      009C09 5B 04            [ 2]  582 	addw	sp, #4
                                    583 ;	./../../lib/src/stm8s_tim1.c: 472: }
      009C0B CC A1 AE         [ 2]  584 	jp	_TIM1_SetIC4Prescaler
                                    585 ;	./../../lib/src/stm8s_tim1.c: 488: void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
                                    586 ;	-----------------------------------------
                                    587 ;	 function TIM1_PWMIConfig
                                    588 ;	-----------------------------------------
      009C0E                        589 _TIM1_PWMIConfig:
      009C0E 52 02            [ 2]  590 	sub	sp, #2
      009C10 97               [ 1]  591 	ld	xl, a
                                    592 ;	./../../lib/src/stm8s_tim1.c: 504: if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
      009C11 0D 05            [ 1]  593 	tnz	(0x05, sp)
      009C13 26 05            [ 1]  594 	jrne	00102$
                                    595 ;	./../../lib/src/stm8s_tim1.c: 506: icpolarity = TIM1_ICPOLARITY_FALLING;
      009C15 A6 01            [ 1]  596 	ld	a, #0x01
      009C17 6B 01            [ 1]  597 	ld	(0x01, sp), a
                                    598 ;	./../../lib/src/stm8s_tim1.c: 510: icpolarity = TIM1_ICPOLARITY_RISING;
      009C19 C5                     599 	.byte 0xc5
      009C1A                        600 00102$:
      009C1A 0F 01            [ 1]  601 	clr	(0x01, sp)
      009C1C                        602 00103$:
                                    603 ;	./../../lib/src/stm8s_tim1.c: 514: if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
      009C1C 7B 06            [ 1]  604 	ld	a, (0x06, sp)
      009C1E 4A               [ 1]  605 	dec	a
      009C1F 26 06            [ 1]  606 	jrne	00105$
                                    607 ;	./../../lib/src/stm8s_tim1.c: 516: icselection = TIM1_ICSELECTION_INDIRECTTI;
      009C21 A6 02            [ 1]  608 	ld	a, #0x02
      009C23 6B 02            [ 1]  609 	ld	(0x02, sp), a
      009C25 20 04            [ 2]  610 	jra	00106$
      009C27                        611 00105$:
                                    612 ;	./../../lib/src/stm8s_tim1.c: 520: icselection = TIM1_ICSELECTION_DIRECTTI;
      009C27 A6 01            [ 1]  613 	ld	a, #0x01
      009C29 6B 02            [ 1]  614 	ld	(0x02, sp), a
      009C2B                        615 00106$:
                                    616 ;	./../../lib/src/stm8s_tim1.c: 526: TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
      009C2B 7B 05            [ 1]  617 	ld	a, (0x05, sp)
      009C2D 95               [ 1]  618 	ld	xh, a
                                    619 ;	./../../lib/src/stm8s_tim1.c: 523: if (TIM1_Channel == TIM1_CHANNEL_1)
      009C2E 9F               [ 1]  620 	ld	a, xl
      009C2F 4D               [ 1]  621 	tnz	a
      009C30 26 25            [ 1]  622 	jrne	00108$
                                    623 ;	./../../lib/src/stm8s_tim1.c: 526: TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
      009C32 7B 08            [ 1]  624 	ld	a, (0x08, sp)
      009C34 88               [ 1]  625 	push	a
      009C35 7B 07            [ 1]  626 	ld	a, (0x07, sp)
      009C37 88               [ 1]  627 	push	a
      009C38 9E               [ 1]  628 	ld	a, xh
      009C39 CD A2 8E         [ 4]  629 	call	_TI1_Config
                                    630 ;	./../../lib/src/stm8s_tim1.c: 530: TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
      009C3C 7B 07            [ 1]  631 	ld	a, (0x07, sp)
      009C3E CD A1 81         [ 4]  632 	call	_TIM1_SetIC1Prescaler
                                    633 ;	./../../lib/src/stm8s_tim1.c: 533: TI2_Config(icpolarity, icselection, TIM1_ICFilter);
      009C41 7B 08            [ 1]  634 	ld	a, (0x08, sp)
      009C43 88               [ 1]  635 	push	a
      009C44 7B 03            [ 1]  636 	ld	a, (0x03, sp)
      009C46 88               [ 1]  637 	push	a
      009C47 7B 03            [ 1]  638 	ld	a, (0x03, sp)
      009C49 CD A2 C9         [ 4]  639 	call	_TI2_Config
                                    640 ;	./../../lib/src/stm8s_tim1.c: 536: TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
      009C4C 7B 07            [ 1]  641 	ld	a, (0x07, sp)
      009C4E 1E 03            [ 2]  642 	ldw	x, (3, sp)
      009C50 1F 07            [ 2]  643 	ldw	(7, sp), x
      009C52 5B 06            [ 2]  644 	addw	sp, #6
      009C54 CC A1 90         [ 2]  645 	jp	_TIM1_SetIC2Prescaler
      009C57                        646 00108$:
                                    647 ;	./../../lib/src/stm8s_tim1.c: 541: TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
      009C57 7B 08            [ 1]  648 	ld	a, (0x08, sp)
      009C59 88               [ 1]  649 	push	a
      009C5A 7B 07            [ 1]  650 	ld	a, (0x07, sp)
      009C5C 88               [ 1]  651 	push	a
      009C5D 9E               [ 1]  652 	ld	a, xh
      009C5E CD A2 C9         [ 4]  653 	call	_TI2_Config
                                    654 ;	./../../lib/src/stm8s_tim1.c: 545: TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
      009C61 7B 07            [ 1]  655 	ld	a, (0x07, sp)
      009C63 CD A1 90         [ 4]  656 	call	_TIM1_SetIC2Prescaler
                                    657 ;	./../../lib/src/stm8s_tim1.c: 548: TI1_Config(icpolarity, icselection, TIM1_ICFilter);
      009C66 7B 08            [ 1]  658 	ld	a, (0x08, sp)
      009C68 88               [ 1]  659 	push	a
      009C69 7B 03            [ 1]  660 	ld	a, (0x03, sp)
      009C6B 88               [ 1]  661 	push	a
      009C6C 7B 03            [ 1]  662 	ld	a, (0x03, sp)
      009C6E CD A2 8E         [ 4]  663 	call	_TI1_Config
                                    664 ;	./../../lib/src/stm8s_tim1.c: 551: TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
      009C71 7B 07            [ 1]  665 	ld	a, (0x07, sp)
      009C73 1E 03            [ 2]  666 	ldw	x, (3, sp)
      009C75 1F 07            [ 2]  667 	ldw	(7, sp), x
      009C77 5B 06            [ 2]  668 	addw	sp, #6
                                    669 ;	./../../lib/src/stm8s_tim1.c: 553: }
      009C79 CC A1 81         [ 2]  670 	jp	_TIM1_SetIC1Prescaler
                                    671 ;	./../../lib/src/stm8s_tim1.c: 561: void TIM1_Cmd(FunctionalState NewState)
                                    672 ;	-----------------------------------------
                                    673 ;	 function TIM1_Cmd
                                    674 ;	-----------------------------------------
      009C7C                        675 _TIM1_Cmd:
      009C7C 88               [ 1]  676 	push	a
      009C7D 6B 01            [ 1]  677 	ld	(0x01, sp), a
                                    678 ;	./../../lib/src/stm8s_tim1.c: 569: TIM1->CR1 |= TIM1_CR1_CEN;
      009C7F C6 52 50         [ 1]  679 	ld	a, 0x5250
                                    680 ;	./../../lib/src/stm8s_tim1.c: 567: if (NewState != DISABLE)
      009C82 0D 01            [ 1]  681 	tnz	(0x01, sp)
      009C84 27 07            [ 1]  682 	jreq	00102$
                                    683 ;	./../../lib/src/stm8s_tim1.c: 569: TIM1->CR1 |= TIM1_CR1_CEN;
      009C86 AA 01            [ 1]  684 	or	a, #0x01
      009C88 C7 52 50         [ 1]  685 	ld	0x5250, a
      009C8B 20 05            [ 2]  686 	jra	00104$
      009C8D                        687 00102$:
                                    688 ;	./../../lib/src/stm8s_tim1.c: 573: TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
      009C8D A4 FE            [ 1]  689 	and	a, #0xfe
      009C8F C7 52 50         [ 1]  690 	ld	0x5250, a
      009C92                        691 00104$:
                                    692 ;	./../../lib/src/stm8s_tim1.c: 575: }
      009C92 84               [ 1]  693 	pop	a
      009C93 81               [ 4]  694 	ret
                                    695 ;	./../../lib/src/stm8s_tim1.c: 583: void TIM1_CtrlPWMOutputs(FunctionalState NewState)
                                    696 ;	-----------------------------------------
                                    697 ;	 function TIM1_CtrlPWMOutputs
                                    698 ;	-----------------------------------------
      009C94                        699 _TIM1_CtrlPWMOutputs:
      009C94 88               [ 1]  700 	push	a
      009C95 6B 01            [ 1]  701 	ld	(0x01, sp), a
                                    702 ;	./../../lib/src/stm8s_tim1.c: 592: TIM1->BKR |= TIM1_BKR_MOE;
      009C97 C6 52 6D         [ 1]  703 	ld	a, 0x526d
                                    704 ;	./../../lib/src/stm8s_tim1.c: 590: if (NewState != DISABLE)
      009C9A 0D 01            [ 1]  705 	tnz	(0x01, sp)
      009C9C 27 07            [ 1]  706 	jreq	00102$
                                    707 ;	./../../lib/src/stm8s_tim1.c: 592: TIM1->BKR |= TIM1_BKR_MOE;
      009C9E AA 80            [ 1]  708 	or	a, #0x80
      009CA0 C7 52 6D         [ 1]  709 	ld	0x526d, a
      009CA3 20 05            [ 2]  710 	jra	00104$
      009CA5                        711 00102$:
                                    712 ;	./../../lib/src/stm8s_tim1.c: 596: TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
      009CA5 A4 7F            [ 1]  713 	and	a, #0x7f
      009CA7 C7 52 6D         [ 1]  714 	ld	0x526d, a
      009CAA                        715 00104$:
                                    716 ;	./../../lib/src/stm8s_tim1.c: 598: }
      009CAA 84               [ 1]  717 	pop	a
      009CAB 81               [ 4]  718 	ret
                                    719 ;	./../../lib/src/stm8s_tim1.c: 617: void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
                                    720 ;	-----------------------------------------
                                    721 ;	 function TIM1_ITConfig
                                    722 ;	-----------------------------------------
      009CAC                        723 _TIM1_ITConfig:
      009CAC 88               [ 1]  724 	push	a
                                    725 ;	./../../lib/src/stm8s_tim1.c: 626: TIM1->IER |= (uint8_t)TIM1_IT;
      009CAD AE 52 54         [ 2]  726 	ldw	x, #0x5254
      009CB0 88               [ 1]  727 	push	a
      009CB1 F6               [ 1]  728 	ld	a, (x)
      009CB2 6B 02            [ 1]  729 	ld	(0x02, sp), a
      009CB4 84               [ 1]  730 	pop	a
                                    731 ;	./../../lib/src/stm8s_tim1.c: 623: if (NewState != DISABLE)
      009CB5 0D 04            [ 1]  732 	tnz	(0x04, sp)
      009CB7 27 07            [ 1]  733 	jreq	00102$
                                    734 ;	./../../lib/src/stm8s_tim1.c: 626: TIM1->IER |= (uint8_t)TIM1_IT;
      009CB9 1A 01            [ 1]  735 	or	a, (0x01, sp)
      009CBB C7 52 54         [ 1]  736 	ld	0x5254, a
      009CBE 20 06            [ 2]  737 	jra	00104$
      009CC0                        738 00102$:
                                    739 ;	./../../lib/src/stm8s_tim1.c: 631: TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
      009CC0 43               [ 1]  740 	cpl	a
      009CC1 14 01            [ 1]  741 	and	a, (0x01, sp)
      009CC3 C7 52 54         [ 1]  742 	ld	0x5254, a
      009CC6                        743 00104$:
                                    744 ;	./../../lib/src/stm8s_tim1.c: 633: }
      009CC6 84               [ 1]  745 	pop	a
      009CC7 85               [ 2]  746 	popw	x
      009CC8 84               [ 1]  747 	pop	a
      009CC9 FC               [ 2]  748 	jp	(x)
                                    749 ;	./../../lib/src/stm8s_tim1.c: 640: void TIM1_InternalClockConfig(void)
                                    750 ;	-----------------------------------------
                                    751 ;	 function TIM1_InternalClockConfig
                                    752 ;	-----------------------------------------
      009CCA                        753 _TIM1_InternalClockConfig:
                                    754 ;	./../../lib/src/stm8s_tim1.c: 643: TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
      009CCA C6 52 52         [ 1]  755 	ld	a, 0x5252
      009CCD A4 F8            [ 1]  756 	and	a, #0xf8
      009CCF C7 52 52         [ 1]  757 	ld	0x5252, a
                                    758 ;	./../../lib/src/stm8s_tim1.c: 644: }
      009CD2 81               [ 4]  759 	ret
                                    760 ;	./../../lib/src/stm8s_tim1.c: 662: void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
                                    761 ;	-----------------------------------------
                                    762 ;	 function TIM1_ETRClockMode1Config
                                    763 ;	-----------------------------------------
      009CD3                        764 _TIM1_ETRClockMode1Config:
      009CD3 97               [ 1]  765 	ld	xl, a
                                    766 ;	./../../lib/src/stm8s_tim1.c: 671: TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
      009CD4 7B 04            [ 1]  767 	ld	a, (0x04, sp)
      009CD6 88               [ 1]  768 	push	a
      009CD7 7B 04            [ 1]  769 	ld	a, (0x04, sp)
      009CD9 88               [ 1]  770 	push	a
      009CDA 9F               [ 1]  771 	ld	a, xl
      009CDB CD 9D 05         [ 4]  772 	call	_TIM1_ETRConfig
                                    773 ;	./../../lib/src/stm8s_tim1.c: 674: TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
      009CDE C6 52 52         [ 1]  774 	ld	a, 0x5252
      009CE1 A4 88            [ 1]  775 	and	a, #0x88
      009CE3 AA 77            [ 1]  776 	or	a, #0x77
      009CE5 C7 52 52         [ 1]  777 	ld	0x5252, a
                                    778 ;	./../../lib/src/stm8s_tim1.c: 676: }
      009CE8 1E 01            [ 2]  779 	ldw	x, (1, sp)
      009CEA 5B 04            [ 2]  780 	addw	sp, #4
      009CEC FC               [ 2]  781 	jp	(x)
                                    782 ;	./../../lib/src/stm8s_tim1.c: 694: void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
                                    783 ;	-----------------------------------------
                                    784 ;	 function TIM1_ETRClockMode2Config
                                    785 ;	-----------------------------------------
      009CED                        786 _TIM1_ETRClockMode2Config:
      009CED 97               [ 1]  787 	ld	xl, a
                                    788 ;	./../../lib/src/stm8s_tim1.c: 703: TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
      009CEE 7B 04            [ 1]  789 	ld	a, (0x04, sp)
      009CF0 88               [ 1]  790 	push	a
      009CF1 7B 04            [ 1]  791 	ld	a, (0x04, sp)
      009CF3 88               [ 1]  792 	push	a
      009CF4 9F               [ 1]  793 	ld	a, xl
      009CF5 CD 9D 05         [ 4]  794 	call	_TIM1_ETRConfig
                                    795 ;	./../../lib/src/stm8s_tim1.c: 706: TIM1->ETR |= TIM1_ETR_ECE;
      009CF8 C6 52 53         [ 1]  796 	ld	a, 0x5253
      009CFB AA 40            [ 1]  797 	or	a, #0x40
      009CFD C7 52 53         [ 1]  798 	ld	0x5253, a
                                    799 ;	./../../lib/src/stm8s_tim1.c: 707: }
      009D00 1E 01            [ 2]  800 	ldw	x, (1, sp)
      009D02 5B 04            [ 2]  801 	addw	sp, #4
      009D04 FC               [ 2]  802 	jp	(x)
                                    803 ;	./../../lib/src/stm8s_tim1.c: 725: void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
                                    804 ;	-----------------------------------------
                                    805 ;	 function TIM1_ETRConfig
                                    806 ;	-----------------------------------------
      009D05                        807 _TIM1_ETRConfig:
      009D05 88               [ 1]  808 	push	a
      009D06 97               [ 1]  809 	ld	xl, a
                                    810 ;	./../../lib/src/stm8s_tim1.c: 732: TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
      009D07 C6 52 53         [ 1]  811 	ld	a, 0x5253
      009D0A 6B 01            [ 1]  812 	ld	(0x01, sp), a
      009D0C 9F               [ 1]  813 	ld	a, xl
      009D0D 1A 04            [ 1]  814 	or	a, (0x04, sp)
                                    815 ;	./../../lib/src/stm8s_tim1.c: 733: (uint8_t)ExtTRGFilter );
      009D0F 1A 05            [ 1]  816 	or	a, (0x05, sp)
      009D11 1A 01            [ 1]  817 	or	a, (0x01, sp)
      009D13 C7 52 53         [ 1]  818 	ld	0x5253, a
                                    819 ;	./../../lib/src/stm8s_tim1.c: 734: }
      009D16 1E 02            [ 2]  820 	ldw	x, (2, sp)
      009D18 5B 05            [ 2]  821 	addw	sp, #5
      009D1A FC               [ 2]  822 	jp	(x)
                                    823 ;	./../../lib/src/stm8s_tim1.c: 751: void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
                                    824 ;	-----------------------------------------
                                    825 ;	 function TIM1_TIxExternalClockConfig
                                    826 ;	-----------------------------------------
      009D1B                        827 _TIM1_TIxExternalClockConfig:
      009D1B 88               [ 1]  828 	push	a
      009D1C 6B 01            [ 1]  829 	ld	(0x01, sp), a
                                    830 ;	./../../lib/src/stm8s_tim1.c: 763: TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
      009D1E 7B 04            [ 1]  831 	ld	a, (0x04, sp)
      009D20 97               [ 1]  832 	ld	xl, a
                                    833 ;	./../../lib/src/stm8s_tim1.c: 761: if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
      009D21 7B 01            [ 1]  834 	ld	a, (0x01, sp)
      009D23 A1 60            [ 1]  835 	cp	a, #0x60
      009D25 26 0B            [ 1]  836 	jrne	00102$
                                    837 ;	./../../lib/src/stm8s_tim1.c: 763: TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
      009D27 7B 05            [ 1]  838 	ld	a, (0x05, sp)
      009D29 88               [ 1]  839 	push	a
      009D2A 4B 01            [ 1]  840 	push	#0x01
      009D2C 9F               [ 1]  841 	ld	a, xl
      009D2D CD A2 C9         [ 4]  842 	call	_TI2_Config
      009D30 20 09            [ 2]  843 	jra	00103$
      009D32                        844 00102$:
                                    845 ;	./../../lib/src/stm8s_tim1.c: 767: TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
      009D32 7B 05            [ 1]  846 	ld	a, (0x05, sp)
      009D34 88               [ 1]  847 	push	a
      009D35 4B 01            [ 1]  848 	push	#0x01
      009D37 9F               [ 1]  849 	ld	a, xl
      009D38 CD A2 8E         [ 4]  850 	call	_TI1_Config
      009D3B                        851 00103$:
                                    852 ;	./../../lib/src/stm8s_tim1.c: 771: TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
      009D3B 7B 01            [ 1]  853 	ld	a, (0x01, sp)
      009D3D CD 9D 4D         [ 4]  854 	call	_TIM1_SelectInputTrigger
                                    855 ;	./../../lib/src/stm8s_tim1.c: 774: TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
      009D40 C6 52 52         [ 1]  856 	ld	a, 0x5252
      009D43 AA 07            [ 1]  857 	or	a, #0x07
      009D45 C7 52 52         [ 1]  858 	ld	0x5252, a
                                    859 ;	./../../lib/src/stm8s_tim1.c: 775: }
      009D48 1E 02            [ 2]  860 	ldw	x, (2, sp)
      009D4A 5B 05            [ 2]  861 	addw	sp, #5
      009D4C FC               [ 2]  862 	jp	(x)
                                    863 ;	./../../lib/src/stm8s_tim1.c: 787: void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
                                    864 ;	-----------------------------------------
                                    865 ;	 function TIM1_SelectInputTrigger
                                    866 ;	-----------------------------------------
      009D4D                        867 _TIM1_SelectInputTrigger:
      009D4D 88               [ 1]  868 	push	a
      009D4E 6B 01            [ 1]  869 	ld	(0x01, sp), a
                                    870 ;	./../../lib/src/stm8s_tim1.c: 793: TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
      009D50 C6 52 52         [ 1]  871 	ld	a, 0x5252
      009D53 A4 8F            [ 1]  872 	and	a, #0x8f
      009D55 1A 01            [ 1]  873 	or	a, (0x01, sp)
      009D57 C7 52 52         [ 1]  874 	ld	0x5252, a
                                    875 ;	./../../lib/src/stm8s_tim1.c: 794: }
      009D5A 84               [ 1]  876 	pop	a
      009D5B 81               [ 4]  877 	ret
                                    878 ;	./../../lib/src/stm8s_tim1.c: 803: void TIM1_UpdateDisableConfig(FunctionalState NewState)
                                    879 ;	-----------------------------------------
                                    880 ;	 function TIM1_UpdateDisableConfig
                                    881 ;	-----------------------------------------
      009D5C                        882 _TIM1_UpdateDisableConfig:
      009D5C 88               [ 1]  883 	push	a
      009D5D 6B 01            [ 1]  884 	ld	(0x01, sp), a
                                    885 ;	./../../lib/src/stm8s_tim1.c: 811: TIM1->CR1 |= TIM1_CR1_UDIS;
      009D5F C6 52 50         [ 1]  886 	ld	a, 0x5250
                                    887 ;	./../../lib/src/stm8s_tim1.c: 809: if (NewState != DISABLE)
      009D62 0D 01            [ 1]  888 	tnz	(0x01, sp)
      009D64 27 07            [ 1]  889 	jreq	00102$
                                    890 ;	./../../lib/src/stm8s_tim1.c: 811: TIM1->CR1 |= TIM1_CR1_UDIS;
      009D66 AA 02            [ 1]  891 	or	a, #0x02
      009D68 C7 52 50         [ 1]  892 	ld	0x5250, a
      009D6B 20 05            [ 2]  893 	jra	00104$
      009D6D                        894 00102$:
                                    895 ;	./../../lib/src/stm8s_tim1.c: 815: TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
      009D6D A4 FD            [ 1]  896 	and	a, #0xfd
      009D6F C7 52 50         [ 1]  897 	ld	0x5250, a
      009D72                        898 00104$:
                                    899 ;	./../../lib/src/stm8s_tim1.c: 817: }
      009D72 84               [ 1]  900 	pop	a
      009D73 81               [ 4]  901 	ret
                                    902 ;	./../../lib/src/stm8s_tim1.c: 827: void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
                                    903 ;	-----------------------------------------
                                    904 ;	 function TIM1_UpdateRequestConfig
                                    905 ;	-----------------------------------------
      009D74                        906 _TIM1_UpdateRequestConfig:
      009D74 88               [ 1]  907 	push	a
      009D75 6B 01            [ 1]  908 	ld	(0x01, sp), a
                                    909 ;	./../../lib/src/stm8s_tim1.c: 835: TIM1->CR1 |= TIM1_CR1_URS;
      009D77 C6 52 50         [ 1]  910 	ld	a, 0x5250
                                    911 ;	./../../lib/src/stm8s_tim1.c: 833: if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
      009D7A 0D 01            [ 1]  912 	tnz	(0x01, sp)
      009D7C 27 07            [ 1]  913 	jreq	00102$
                                    914 ;	./../../lib/src/stm8s_tim1.c: 835: TIM1->CR1 |= TIM1_CR1_URS;
      009D7E AA 04            [ 1]  915 	or	a, #0x04
      009D80 C7 52 50         [ 1]  916 	ld	0x5250, a
      009D83 20 05            [ 2]  917 	jra	00104$
      009D85                        918 00102$:
                                    919 ;	./../../lib/src/stm8s_tim1.c: 839: TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
      009D85 A4 FB            [ 1]  920 	and	a, #0xfb
      009D87 C7 52 50         [ 1]  921 	ld	0x5250, a
      009D8A                        922 00104$:
                                    923 ;	./../../lib/src/stm8s_tim1.c: 841: }
      009D8A 84               [ 1]  924 	pop	a
      009D8B 81               [ 4]  925 	ret
                                    926 ;	./../../lib/src/stm8s_tim1.c: 849: void TIM1_SelectHallSensor(FunctionalState NewState)
                                    927 ;	-----------------------------------------
                                    928 ;	 function TIM1_SelectHallSensor
                                    929 ;	-----------------------------------------
      009D8C                        930 _TIM1_SelectHallSensor:
      009D8C 88               [ 1]  931 	push	a
      009D8D 6B 01            [ 1]  932 	ld	(0x01, sp), a
                                    933 ;	./../../lib/src/stm8s_tim1.c: 857: TIM1->CR2 |= TIM1_CR2_TI1S;
      009D8F C6 52 51         [ 1]  934 	ld	a, 0x5251
                                    935 ;	./../../lib/src/stm8s_tim1.c: 855: if (NewState != DISABLE)
      009D92 0D 01            [ 1]  936 	tnz	(0x01, sp)
      009D94 27 07            [ 1]  937 	jreq	00102$
                                    938 ;	./../../lib/src/stm8s_tim1.c: 857: TIM1->CR2 |= TIM1_CR2_TI1S;
      009D96 AA 80            [ 1]  939 	or	a, #0x80
      009D98 C7 52 51         [ 1]  940 	ld	0x5251, a
      009D9B 20 05            [ 2]  941 	jra	00104$
      009D9D                        942 00102$:
                                    943 ;	./../../lib/src/stm8s_tim1.c: 861: TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
      009D9D A4 7F            [ 1]  944 	and	a, #0x7f
      009D9F C7 52 51         [ 1]  945 	ld	0x5251, a
      009DA2                        946 00104$:
                                    947 ;	./../../lib/src/stm8s_tim1.c: 863: }
      009DA2 84               [ 1]  948 	pop	a
      009DA3 81               [ 4]  949 	ret
                                    950 ;	./../../lib/src/stm8s_tim1.c: 873: void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
                                    951 ;	-----------------------------------------
                                    952 ;	 function TIM1_SelectOnePulseMode
                                    953 ;	-----------------------------------------
      009DA4                        954 _TIM1_SelectOnePulseMode:
      009DA4 88               [ 1]  955 	push	a
      009DA5 6B 01            [ 1]  956 	ld	(0x01, sp), a
                                    957 ;	./../../lib/src/stm8s_tim1.c: 881: TIM1->CR1 |= TIM1_CR1_OPM;
      009DA7 C6 52 50         [ 1]  958 	ld	a, 0x5250
                                    959 ;	./../../lib/src/stm8s_tim1.c: 879: if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
      009DAA 0D 01            [ 1]  960 	tnz	(0x01, sp)
      009DAC 27 07            [ 1]  961 	jreq	00102$
                                    962 ;	./../../lib/src/stm8s_tim1.c: 881: TIM1->CR1 |= TIM1_CR1_OPM;
      009DAE AA 08            [ 1]  963 	or	a, #0x08
      009DB0 C7 52 50         [ 1]  964 	ld	0x5250, a
      009DB3 20 05            [ 2]  965 	jra	00104$
      009DB5                        966 00102$:
                                    967 ;	./../../lib/src/stm8s_tim1.c: 885: TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
      009DB5 A4 F7            [ 1]  968 	and	a, #0xf7
      009DB7 C7 52 50         [ 1]  969 	ld	0x5250, a
      009DBA                        970 00104$:
                                    971 ;	./../../lib/src/stm8s_tim1.c: 888: }
      009DBA 84               [ 1]  972 	pop	a
      009DBB 81               [ 4]  973 	ret
                                    974 ;	./../../lib/src/stm8s_tim1.c: 903: void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
                                    975 ;	-----------------------------------------
                                    976 ;	 function TIM1_SelectOutputTrigger
                                    977 ;	-----------------------------------------
      009DBC                        978 _TIM1_SelectOutputTrigger:
      009DBC 88               [ 1]  979 	push	a
      009DBD 6B 01            [ 1]  980 	ld	(0x01, sp), a
                                    981 ;	./../../lib/src/stm8s_tim1.c: 909: TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
      009DBF C6 52 51         [ 1]  982 	ld	a, 0x5251
      009DC2 A4 8F            [ 1]  983 	and	a, #0x8f
                                    984 ;	./../../lib/src/stm8s_tim1.c: 910: (uint8_t) TIM1_TRGOSource);
      009DC4 1A 01            [ 1]  985 	or	a, (0x01, sp)
      009DC6 C7 52 51         [ 1]  986 	ld	0x5251, a
                                    987 ;	./../../lib/src/stm8s_tim1.c: 911: }
      009DC9 84               [ 1]  988 	pop	a
      009DCA 81               [ 4]  989 	ret
                                    990 ;	./../../lib/src/stm8s_tim1.c: 923: void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
                                    991 ;	-----------------------------------------
                                    992 ;	 function TIM1_SelectSlaveMode
                                    993 ;	-----------------------------------------
      009DCB                        994 _TIM1_SelectSlaveMode:
      009DCB 88               [ 1]  995 	push	a
      009DCC 6B 01            [ 1]  996 	ld	(0x01, sp), a
                                    997 ;	./../../lib/src/stm8s_tim1.c: 929: TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
      009DCE C6 52 52         [ 1]  998 	ld	a, 0x5252
      009DD1 A4 F8            [ 1]  999 	and	a, #0xf8
                                   1000 ;	./../../lib/src/stm8s_tim1.c: 930: (uint8_t)TIM1_SlaveMode);
      009DD3 1A 01            [ 1] 1001 	or	a, (0x01, sp)
      009DD5 C7 52 52         [ 1] 1002 	ld	0x5252, a
                                   1003 ;	./../../lib/src/stm8s_tim1.c: 931: }
      009DD8 84               [ 1] 1004 	pop	a
      009DD9 81               [ 4] 1005 	ret
                                   1006 ;	./../../lib/src/stm8s_tim1.c: 939: void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
                                   1007 ;	-----------------------------------------
                                   1008 ;	 function TIM1_SelectMasterSlaveMode
                                   1009 ;	-----------------------------------------
      009DDA                       1010 _TIM1_SelectMasterSlaveMode:
      009DDA 88               [ 1] 1011 	push	a
      009DDB 6B 01            [ 1] 1012 	ld	(0x01, sp), a
                                   1013 ;	./../../lib/src/stm8s_tim1.c: 947: TIM1->SMCR |= TIM1_SMCR_MSM;
      009DDD C6 52 52         [ 1] 1014 	ld	a, 0x5252
                                   1015 ;	./../../lib/src/stm8s_tim1.c: 945: if (NewState != DISABLE)
      009DE0 0D 01            [ 1] 1016 	tnz	(0x01, sp)
      009DE2 27 07            [ 1] 1017 	jreq	00102$
                                   1018 ;	./../../lib/src/stm8s_tim1.c: 947: TIM1->SMCR |= TIM1_SMCR_MSM;
      009DE4 AA 80            [ 1] 1019 	or	a, #0x80
      009DE6 C7 52 52         [ 1] 1020 	ld	0x5252, a
      009DE9 20 05            [ 2] 1021 	jra	00104$
      009DEB                       1022 00102$:
                                   1023 ;	./../../lib/src/stm8s_tim1.c: 951: TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
      009DEB A4 7F            [ 1] 1024 	and	a, #0x7f
      009DED C7 52 52         [ 1] 1025 	ld	0x5252, a
      009DF0                       1026 00104$:
                                   1027 ;	./../../lib/src/stm8s_tim1.c: 953: }
      009DF0 84               [ 1] 1028 	pop	a
      009DF1 81               [ 4] 1029 	ret
                                   1030 ;	./../../lib/src/stm8s_tim1.c: 975: void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
                                   1031 ;	-----------------------------------------
                                   1032 ;	 function TIM1_EncoderInterfaceConfig
                                   1033 ;	-----------------------------------------
      009DF2                       1034 _TIM1_EncoderInterfaceConfig:
      009DF2 88               [ 1] 1035 	push	a
      009DF3 6B 01            [ 1] 1036 	ld	(0x01, sp), a
                                   1037 ;	./../../lib/src/stm8s_tim1.c: 987: TIM1->CCER1 |= TIM1_CCER1_CC1P;
      009DF5 C6 52 5C         [ 1] 1038 	ld	a, 0x525c
                                   1039 ;	./../../lib/src/stm8s_tim1.c: 985: if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
      009DF8 0D 04            [ 1] 1040 	tnz	(0x04, sp)
      009DFA 27 07            [ 1] 1041 	jreq	00102$
                                   1042 ;	./../../lib/src/stm8s_tim1.c: 987: TIM1->CCER1 |= TIM1_CCER1_CC1P;
      009DFC AA 02            [ 1] 1043 	or	a, #0x02
      009DFE C7 52 5C         [ 1] 1044 	ld	0x525c, a
      009E01 20 05            [ 2] 1045 	jra	00103$
      009E03                       1046 00102$:
                                   1047 ;	./../../lib/src/stm8s_tim1.c: 991: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
      009E03 A4 FD            [ 1] 1048 	and	a, #0xfd
      009E05 C7 52 5C         [ 1] 1049 	ld	0x525c, a
      009E08                       1050 00103$:
                                   1051 ;	./../../lib/src/stm8s_tim1.c: 987: TIM1->CCER1 |= TIM1_CCER1_CC1P;
      009E08 C6 52 5C         [ 1] 1052 	ld	a, 0x525c
                                   1053 ;	./../../lib/src/stm8s_tim1.c: 994: if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
      009E0B 0D 05            [ 1] 1054 	tnz	(0x05, sp)
      009E0D 27 07            [ 1] 1055 	jreq	00105$
                                   1056 ;	./../../lib/src/stm8s_tim1.c: 996: TIM1->CCER1 |= TIM1_CCER1_CC2P;
      009E0F AA 20            [ 1] 1057 	or	a, #0x20
      009E11 C7 52 5C         [ 1] 1058 	ld	0x525c, a
      009E14 20 05            [ 2] 1059 	jra	00106$
      009E16                       1060 00105$:
                                   1061 ;	./../../lib/src/stm8s_tim1.c: 1000: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
      009E16 A4 DF            [ 1] 1062 	and	a, #0xdf
      009E18 C7 52 5C         [ 1] 1063 	ld	0x525c, a
      009E1B                       1064 00106$:
                                   1065 ;	./../../lib/src/stm8s_tim1.c: 1003: TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
      009E1B C6 52 52         [ 1] 1066 	ld	a, 0x5252
      009E1E A4 F0            [ 1] 1067 	and	a, #0xf0
                                   1068 ;	./../../lib/src/stm8s_tim1.c: 1004: | (uint8_t) TIM1_EncoderMode);
      009E20 1A 01            [ 1] 1069 	or	a, (0x01, sp)
      009E22 C7 52 52         [ 1] 1070 	ld	0x5252, a
                                   1071 ;	./../../lib/src/stm8s_tim1.c: 1007: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
      009E25 C6 52 58         [ 1] 1072 	ld	a, 0x5258
      009E28 A4 FC            [ 1] 1073 	and	a, #0xfc
      009E2A AA 01            [ 1] 1074 	or	a, #0x01
      009E2C C7 52 58         [ 1] 1075 	ld	0x5258, a
                                   1076 ;	./../../lib/src/stm8s_tim1.c: 1009: TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
      009E2F C6 52 59         [ 1] 1077 	ld	a, 0x5259
      009E32 A4 FC            [ 1] 1078 	and	a, #0xfc
      009E34 AA 01            [ 1] 1079 	or	a, #0x01
      009E36 C7 52 59         [ 1] 1080 	ld	0x5259, a
                                   1081 ;	./../../lib/src/stm8s_tim1.c: 1011: }
      009E39 1E 02            [ 2] 1082 	ldw	x, (2, sp)
      009E3B 5B 05            [ 2] 1083 	addw	sp, #5
      009E3D FC               [ 2] 1084 	jp	(x)
                                   1085 ;	./../../lib/src/stm8s_tim1.c: 1023: void TIM1_PrescalerConfig(uint16_t Prescaler,
                                   1086 ;	-----------------------------------------
                                   1087 ;	 function TIM1_PrescalerConfig
                                   1088 ;	-----------------------------------------
      009E3E                       1089 _TIM1_PrescalerConfig:
      009E3E 88               [ 1] 1090 	push	a
      009E3F 6B 01            [ 1] 1091 	ld	(0x01, sp), a
                                   1092 ;	./../../lib/src/stm8s_tim1.c: 1030: TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
      009E41 9E               [ 1] 1093 	ld	a, xh
      009E42 C7 52 60         [ 1] 1094 	ld	0x5260, a
                                   1095 ;	./../../lib/src/stm8s_tim1.c: 1031: TIM1->PSCRL = (uint8_t)(Prescaler);
      009E45 9F               [ 1] 1096 	ld	a, xl
      009E46 C7 52 61         [ 1] 1097 	ld	0x5261, a
                                   1098 ;	./../../lib/src/stm8s_tim1.c: 1034: TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
      009E49 7B 01            [ 1] 1099 	ld	a, (0x01, sp)
      009E4B C7 52 57         [ 1] 1100 	ld	0x5257, a
                                   1101 ;	./../../lib/src/stm8s_tim1.c: 1035: }
      009E4E 84               [ 1] 1102 	pop	a
      009E4F 81               [ 4] 1103 	ret
                                   1104 ;	./../../lib/src/stm8s_tim1.c: 1048: void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
                                   1105 ;	-----------------------------------------
                                   1106 ;	 function TIM1_CounterModeConfig
                                   1107 ;	-----------------------------------------
      009E50                       1108 _TIM1_CounterModeConfig:
      009E50 88               [ 1] 1109 	push	a
      009E51 6B 01            [ 1] 1110 	ld	(0x01, sp), a
                                   1111 ;	./../../lib/src/stm8s_tim1.c: 1055: TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
      009E53 C6 52 50         [ 1] 1112 	ld	a, 0x5250
      009E56 A4 8F            [ 1] 1113 	and	a, #0x8f
                                   1114 ;	./../../lib/src/stm8s_tim1.c: 1056: | (uint8_t)TIM1_CounterMode);
      009E58 1A 01            [ 1] 1115 	or	a, (0x01, sp)
      009E5A C7 52 50         [ 1] 1116 	ld	0x5250, a
                                   1117 ;	./../../lib/src/stm8s_tim1.c: 1057: }
      009E5D 84               [ 1] 1118 	pop	a
      009E5E 81               [ 4] 1119 	ret
                                   1120 ;	./../../lib/src/stm8s_tim1.c: 1067: void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
                                   1121 ;	-----------------------------------------
                                   1122 ;	 function TIM1_ForcedOC1Config
                                   1123 ;	-----------------------------------------
      009E5F                       1124 _TIM1_ForcedOC1Config:
      009E5F 88               [ 1] 1125 	push	a
      009E60 6B 01            [ 1] 1126 	ld	(0x01, sp), a
                                   1127 ;	./../../lib/src/stm8s_tim1.c: 1073: TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
      009E62 C6 52 58         [ 1] 1128 	ld	a, 0x5258
      009E65 A4 8F            [ 1] 1129 	and	a, #0x8f
                                   1130 ;	./../../lib/src/stm8s_tim1.c: 1074: (uint8_t)TIM1_ForcedAction);
      009E67 1A 01            [ 1] 1131 	or	a, (0x01, sp)
      009E69 C7 52 58         [ 1] 1132 	ld	0x5258, a
                                   1133 ;	./../../lib/src/stm8s_tim1.c: 1075: }
      009E6C 84               [ 1] 1134 	pop	a
      009E6D 81               [ 4] 1135 	ret
                                   1136 ;	./../../lib/src/stm8s_tim1.c: 1085: void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
                                   1137 ;	-----------------------------------------
                                   1138 ;	 function TIM1_ForcedOC2Config
                                   1139 ;	-----------------------------------------
      009E6E                       1140 _TIM1_ForcedOC2Config:
      009E6E 88               [ 1] 1141 	push	a
      009E6F 6B 01            [ 1] 1142 	ld	(0x01, sp), a
                                   1143 ;	./../../lib/src/stm8s_tim1.c: 1091: TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
      009E71 C6 52 59         [ 1] 1144 	ld	a, 0x5259
      009E74 A4 8F            [ 1] 1145 	and	a, #0x8f
                                   1146 ;	./../../lib/src/stm8s_tim1.c: 1092: | (uint8_t)TIM1_ForcedAction);
      009E76 1A 01            [ 1] 1147 	or	a, (0x01, sp)
      009E78 C7 52 59         [ 1] 1148 	ld	0x5259, a
                                   1149 ;	./../../lib/src/stm8s_tim1.c: 1093: }
      009E7B 84               [ 1] 1150 	pop	a
      009E7C 81               [ 4] 1151 	ret
                                   1152 ;	./../../lib/src/stm8s_tim1.c: 1104: void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
                                   1153 ;	-----------------------------------------
                                   1154 ;	 function TIM1_ForcedOC3Config
                                   1155 ;	-----------------------------------------
      009E7D                       1156 _TIM1_ForcedOC3Config:
      009E7D 88               [ 1] 1157 	push	a
      009E7E 6B 01            [ 1] 1158 	ld	(0x01, sp), a
                                   1159 ;	./../../lib/src/stm8s_tim1.c: 1110: TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
      009E80 C6 52 5A         [ 1] 1160 	ld	a, 0x525a
      009E83 A4 8F            [ 1] 1161 	and	a, #0x8f
                                   1162 ;	./../../lib/src/stm8s_tim1.c: 1111: | (uint8_t)TIM1_ForcedAction);
      009E85 1A 01            [ 1] 1163 	or	a, (0x01, sp)
      009E87 C7 52 5A         [ 1] 1164 	ld	0x525a, a
                                   1165 ;	./../../lib/src/stm8s_tim1.c: 1112: }
      009E8A 84               [ 1] 1166 	pop	a
      009E8B 81               [ 4] 1167 	ret
                                   1168 ;	./../../lib/src/stm8s_tim1.c: 1123: void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
                                   1169 ;	-----------------------------------------
                                   1170 ;	 function TIM1_ForcedOC4Config
                                   1171 ;	-----------------------------------------
      009E8C                       1172 _TIM1_ForcedOC4Config:
      009E8C 88               [ 1] 1173 	push	a
      009E8D 6B 01            [ 1] 1174 	ld	(0x01, sp), a
                                   1175 ;	./../../lib/src/stm8s_tim1.c: 1129: TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
      009E8F C6 52 5B         [ 1] 1176 	ld	a, 0x525b
      009E92 A4 8F            [ 1] 1177 	and	a, #0x8f
                                   1178 ;	./../../lib/src/stm8s_tim1.c: 1130: | (uint8_t)TIM1_ForcedAction);
      009E94 1A 01            [ 1] 1179 	or	a, (0x01, sp)
      009E96 C7 52 5B         [ 1] 1180 	ld	0x525b, a
                                   1181 ;	./../../lib/src/stm8s_tim1.c: 1131: }
      009E99 84               [ 1] 1182 	pop	a
      009E9A 81               [ 4] 1183 	ret
                                   1184 ;	./../../lib/src/stm8s_tim1.c: 1139: void TIM1_ARRPreloadConfig(FunctionalState NewState)
                                   1185 ;	-----------------------------------------
                                   1186 ;	 function TIM1_ARRPreloadConfig
                                   1187 ;	-----------------------------------------
      009E9B                       1188 _TIM1_ARRPreloadConfig:
      009E9B 88               [ 1] 1189 	push	a
      009E9C 6B 01            [ 1] 1190 	ld	(0x01, sp), a
                                   1191 ;	./../../lib/src/stm8s_tim1.c: 1147: TIM1->CR1 |= TIM1_CR1_ARPE;
      009E9E C6 52 50         [ 1] 1192 	ld	a, 0x5250
                                   1193 ;	./../../lib/src/stm8s_tim1.c: 1145: if (NewState != DISABLE)
      009EA1 0D 01            [ 1] 1194 	tnz	(0x01, sp)
      009EA3 27 07            [ 1] 1195 	jreq	00102$
                                   1196 ;	./../../lib/src/stm8s_tim1.c: 1147: TIM1->CR1 |= TIM1_CR1_ARPE;
      009EA5 AA 80            [ 1] 1197 	or	a, #0x80
      009EA7 C7 52 50         [ 1] 1198 	ld	0x5250, a
      009EAA 20 05            [ 2] 1199 	jra	00104$
      009EAC                       1200 00102$:
                                   1201 ;	./../../lib/src/stm8s_tim1.c: 1151: TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
      009EAC A4 7F            [ 1] 1202 	and	a, #0x7f
      009EAE C7 52 50         [ 1] 1203 	ld	0x5250, a
      009EB1                       1204 00104$:
                                   1205 ;	./../../lib/src/stm8s_tim1.c: 1153: }
      009EB1 84               [ 1] 1206 	pop	a
      009EB2 81               [ 4] 1207 	ret
                                   1208 ;	./../../lib/src/stm8s_tim1.c: 1161: void TIM1_SelectCOM(FunctionalState NewState)
                                   1209 ;	-----------------------------------------
                                   1210 ;	 function TIM1_SelectCOM
                                   1211 ;	-----------------------------------------
      009EB3                       1212 _TIM1_SelectCOM:
      009EB3 88               [ 1] 1213 	push	a
      009EB4 6B 01            [ 1] 1214 	ld	(0x01, sp), a
                                   1215 ;	./../../lib/src/stm8s_tim1.c: 1169: TIM1->CR2 |= TIM1_CR2_COMS;
      009EB6 C6 52 51         [ 1] 1216 	ld	a, 0x5251
                                   1217 ;	./../../lib/src/stm8s_tim1.c: 1167: if (NewState != DISABLE)
      009EB9 0D 01            [ 1] 1218 	tnz	(0x01, sp)
      009EBB 27 07            [ 1] 1219 	jreq	00102$
                                   1220 ;	./../../lib/src/stm8s_tim1.c: 1169: TIM1->CR2 |= TIM1_CR2_COMS;
      009EBD AA 04            [ 1] 1221 	or	a, #0x04
      009EBF C7 52 51         [ 1] 1222 	ld	0x5251, a
      009EC2 20 05            [ 2] 1223 	jra	00104$
      009EC4                       1224 00102$:
                                   1225 ;	./../../lib/src/stm8s_tim1.c: 1173: TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
      009EC4 A4 FB            [ 1] 1226 	and	a, #0xfb
      009EC6 C7 52 51         [ 1] 1227 	ld	0x5251, a
      009EC9                       1228 00104$:
                                   1229 ;	./../../lib/src/stm8s_tim1.c: 1175: }
      009EC9 84               [ 1] 1230 	pop	a
      009ECA 81               [ 4] 1231 	ret
                                   1232 ;	./../../lib/src/stm8s_tim1.c: 1183: void TIM1_CCPreloadControl(FunctionalState NewState)
                                   1233 ;	-----------------------------------------
                                   1234 ;	 function TIM1_CCPreloadControl
                                   1235 ;	-----------------------------------------
      009ECB                       1236 _TIM1_CCPreloadControl:
      009ECB 88               [ 1] 1237 	push	a
      009ECC 6B 01            [ 1] 1238 	ld	(0x01, sp), a
                                   1239 ;	./../../lib/src/stm8s_tim1.c: 1191: TIM1->CR2 |= TIM1_CR2_CCPC;
      009ECE C6 52 51         [ 1] 1240 	ld	a, 0x5251
                                   1241 ;	./../../lib/src/stm8s_tim1.c: 1189: if (NewState != DISABLE)
      009ED1 0D 01            [ 1] 1242 	tnz	(0x01, sp)
      009ED3 27 07            [ 1] 1243 	jreq	00102$
                                   1244 ;	./../../lib/src/stm8s_tim1.c: 1191: TIM1->CR2 |= TIM1_CR2_CCPC;
      009ED5 AA 01            [ 1] 1245 	or	a, #0x01
      009ED7 C7 52 51         [ 1] 1246 	ld	0x5251, a
      009EDA 20 05            [ 2] 1247 	jra	00104$
      009EDC                       1248 00102$:
                                   1249 ;	./../../lib/src/stm8s_tim1.c: 1195: TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
      009EDC A4 FE            [ 1] 1250 	and	a, #0xfe
      009EDE C7 52 51         [ 1] 1251 	ld	0x5251, a
      009EE1                       1252 00104$:
                                   1253 ;	./../../lib/src/stm8s_tim1.c: 1197: }
      009EE1 84               [ 1] 1254 	pop	a
      009EE2 81               [ 4] 1255 	ret
                                   1256 ;	./../../lib/src/stm8s_tim1.c: 1205: void TIM1_OC1PreloadConfig(FunctionalState NewState)
                                   1257 ;	-----------------------------------------
                                   1258 ;	 function TIM1_OC1PreloadConfig
                                   1259 ;	-----------------------------------------
      009EE3                       1260 _TIM1_OC1PreloadConfig:
      009EE3 88               [ 1] 1261 	push	a
      009EE4 6B 01            [ 1] 1262 	ld	(0x01, sp), a
                                   1263 ;	./../../lib/src/stm8s_tim1.c: 1213: TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
      009EE6 C6 52 58         [ 1] 1264 	ld	a, 0x5258
                                   1265 ;	./../../lib/src/stm8s_tim1.c: 1211: if (NewState != DISABLE)
      009EE9 0D 01            [ 1] 1266 	tnz	(0x01, sp)
      009EEB 27 07            [ 1] 1267 	jreq	00102$
                                   1268 ;	./../../lib/src/stm8s_tim1.c: 1213: TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
      009EED AA 08            [ 1] 1269 	or	a, #0x08
      009EEF C7 52 58         [ 1] 1270 	ld	0x5258, a
      009EF2 20 05            [ 2] 1271 	jra	00104$
      009EF4                       1272 00102$:
                                   1273 ;	./../../lib/src/stm8s_tim1.c: 1217: TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
      009EF4 A4 F7            [ 1] 1274 	and	a, #0xf7
      009EF6 C7 52 58         [ 1] 1275 	ld	0x5258, a
      009EF9                       1276 00104$:
                                   1277 ;	./../../lib/src/stm8s_tim1.c: 1219: }
      009EF9 84               [ 1] 1278 	pop	a
      009EFA 81               [ 4] 1279 	ret
                                   1280 ;	./../../lib/src/stm8s_tim1.c: 1227: void TIM1_OC2PreloadConfig(FunctionalState NewState)
                                   1281 ;	-----------------------------------------
                                   1282 ;	 function TIM1_OC2PreloadConfig
                                   1283 ;	-----------------------------------------
      009EFB                       1284 _TIM1_OC2PreloadConfig:
      009EFB 88               [ 1] 1285 	push	a
      009EFC 6B 01            [ 1] 1286 	ld	(0x01, sp), a
                                   1287 ;	./../../lib/src/stm8s_tim1.c: 1235: TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
      009EFE C6 52 59         [ 1] 1288 	ld	a, 0x5259
                                   1289 ;	./../../lib/src/stm8s_tim1.c: 1233: if (NewState != DISABLE)
      009F01 0D 01            [ 1] 1290 	tnz	(0x01, sp)
      009F03 27 07            [ 1] 1291 	jreq	00102$
                                   1292 ;	./../../lib/src/stm8s_tim1.c: 1235: TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
      009F05 AA 08            [ 1] 1293 	or	a, #0x08
      009F07 C7 52 59         [ 1] 1294 	ld	0x5259, a
      009F0A 20 05            [ 2] 1295 	jra	00104$
      009F0C                       1296 00102$:
                                   1297 ;	./../../lib/src/stm8s_tim1.c: 1239: TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
      009F0C A4 F7            [ 1] 1298 	and	a, #0xf7
      009F0E C7 52 59         [ 1] 1299 	ld	0x5259, a
      009F11                       1300 00104$:
                                   1301 ;	./../../lib/src/stm8s_tim1.c: 1241: }
      009F11 84               [ 1] 1302 	pop	a
      009F12 81               [ 4] 1303 	ret
                                   1304 ;	./../../lib/src/stm8s_tim1.c: 1249: void TIM1_OC3PreloadConfig(FunctionalState NewState)
                                   1305 ;	-----------------------------------------
                                   1306 ;	 function TIM1_OC3PreloadConfig
                                   1307 ;	-----------------------------------------
      009F13                       1308 _TIM1_OC3PreloadConfig:
      009F13 88               [ 1] 1309 	push	a
      009F14 6B 01            [ 1] 1310 	ld	(0x01, sp), a
                                   1311 ;	./../../lib/src/stm8s_tim1.c: 1257: TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
      009F16 C6 52 5A         [ 1] 1312 	ld	a, 0x525a
                                   1313 ;	./../../lib/src/stm8s_tim1.c: 1255: if (NewState != DISABLE)
      009F19 0D 01            [ 1] 1314 	tnz	(0x01, sp)
      009F1B 27 07            [ 1] 1315 	jreq	00102$
                                   1316 ;	./../../lib/src/stm8s_tim1.c: 1257: TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
      009F1D AA 08            [ 1] 1317 	or	a, #0x08
      009F1F C7 52 5A         [ 1] 1318 	ld	0x525a, a
      009F22 20 05            [ 2] 1319 	jra	00104$
      009F24                       1320 00102$:
                                   1321 ;	./../../lib/src/stm8s_tim1.c: 1261: TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
      009F24 A4 F7            [ 1] 1322 	and	a, #0xf7
      009F26 C7 52 5A         [ 1] 1323 	ld	0x525a, a
      009F29                       1324 00104$:
                                   1325 ;	./../../lib/src/stm8s_tim1.c: 1263: }
      009F29 84               [ 1] 1326 	pop	a
      009F2A 81               [ 4] 1327 	ret
                                   1328 ;	./../../lib/src/stm8s_tim1.c: 1271: void TIM1_OC4PreloadConfig(FunctionalState NewState)
                                   1329 ;	-----------------------------------------
                                   1330 ;	 function TIM1_OC4PreloadConfig
                                   1331 ;	-----------------------------------------
      009F2B                       1332 _TIM1_OC4PreloadConfig:
      009F2B 88               [ 1] 1333 	push	a
      009F2C 6B 01            [ 1] 1334 	ld	(0x01, sp), a
                                   1335 ;	./../../lib/src/stm8s_tim1.c: 1279: TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
      009F2E C6 52 5B         [ 1] 1336 	ld	a, 0x525b
                                   1337 ;	./../../lib/src/stm8s_tim1.c: 1277: if (NewState != DISABLE)
      009F31 0D 01            [ 1] 1338 	tnz	(0x01, sp)
      009F33 27 07            [ 1] 1339 	jreq	00102$
                                   1340 ;	./../../lib/src/stm8s_tim1.c: 1279: TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
      009F35 AA 08            [ 1] 1341 	or	a, #0x08
      009F37 C7 52 5B         [ 1] 1342 	ld	0x525b, a
      009F3A 20 05            [ 2] 1343 	jra	00104$
      009F3C                       1344 00102$:
                                   1345 ;	./../../lib/src/stm8s_tim1.c: 1283: TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
      009F3C A4 F7            [ 1] 1346 	and	a, #0xf7
      009F3E C7 52 5B         [ 1] 1347 	ld	0x525b, a
      009F41                       1348 00104$:
                                   1349 ;	./../../lib/src/stm8s_tim1.c: 1285: }
      009F41 84               [ 1] 1350 	pop	a
      009F42 81               [ 4] 1351 	ret
                                   1352 ;	./../../lib/src/stm8s_tim1.c: 1293: void TIM1_OC1FastConfig(FunctionalState NewState)
                                   1353 ;	-----------------------------------------
                                   1354 ;	 function TIM1_OC1FastConfig
                                   1355 ;	-----------------------------------------
      009F43                       1356 _TIM1_OC1FastConfig:
      009F43 88               [ 1] 1357 	push	a
      009F44 6B 01            [ 1] 1358 	ld	(0x01, sp), a
                                   1359 ;	./../../lib/src/stm8s_tim1.c: 1301: TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
      009F46 C6 52 58         [ 1] 1360 	ld	a, 0x5258
                                   1361 ;	./../../lib/src/stm8s_tim1.c: 1299: if (NewState != DISABLE)
      009F49 0D 01            [ 1] 1362 	tnz	(0x01, sp)
      009F4B 27 07            [ 1] 1363 	jreq	00102$
                                   1364 ;	./../../lib/src/stm8s_tim1.c: 1301: TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
      009F4D AA 04            [ 1] 1365 	or	a, #0x04
      009F4F C7 52 58         [ 1] 1366 	ld	0x5258, a
      009F52 20 05            [ 2] 1367 	jra	00104$
      009F54                       1368 00102$:
                                   1369 ;	./../../lib/src/stm8s_tim1.c: 1305: TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
      009F54 A4 FB            [ 1] 1370 	and	a, #0xfb
      009F56 C7 52 58         [ 1] 1371 	ld	0x5258, a
      009F59                       1372 00104$:
                                   1373 ;	./../../lib/src/stm8s_tim1.c: 1307: }
      009F59 84               [ 1] 1374 	pop	a
      009F5A 81               [ 4] 1375 	ret
                                   1376 ;	./../../lib/src/stm8s_tim1.c: 1315: void TIM1_OC2FastConfig(FunctionalState NewState)
                                   1377 ;	-----------------------------------------
                                   1378 ;	 function TIM1_OC2FastConfig
                                   1379 ;	-----------------------------------------
      009F5B                       1380 _TIM1_OC2FastConfig:
      009F5B 88               [ 1] 1381 	push	a
      009F5C 6B 01            [ 1] 1382 	ld	(0x01, sp), a
                                   1383 ;	./../../lib/src/stm8s_tim1.c: 1323: TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
      009F5E C6 52 59         [ 1] 1384 	ld	a, 0x5259
                                   1385 ;	./../../lib/src/stm8s_tim1.c: 1321: if (NewState != DISABLE)
      009F61 0D 01            [ 1] 1386 	tnz	(0x01, sp)
      009F63 27 07            [ 1] 1387 	jreq	00102$
                                   1388 ;	./../../lib/src/stm8s_tim1.c: 1323: TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
      009F65 AA 04            [ 1] 1389 	or	a, #0x04
      009F67 C7 52 59         [ 1] 1390 	ld	0x5259, a
      009F6A 20 05            [ 2] 1391 	jra	00104$
      009F6C                       1392 00102$:
                                   1393 ;	./../../lib/src/stm8s_tim1.c: 1327: TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
      009F6C A4 FB            [ 1] 1394 	and	a, #0xfb
      009F6E C7 52 59         [ 1] 1395 	ld	0x5259, a
      009F71                       1396 00104$:
                                   1397 ;	./../../lib/src/stm8s_tim1.c: 1329: }
      009F71 84               [ 1] 1398 	pop	a
      009F72 81               [ 4] 1399 	ret
                                   1400 ;	./../../lib/src/stm8s_tim1.c: 1337: void TIM1_OC3FastConfig(FunctionalState NewState)
                                   1401 ;	-----------------------------------------
                                   1402 ;	 function TIM1_OC3FastConfig
                                   1403 ;	-----------------------------------------
      009F73                       1404 _TIM1_OC3FastConfig:
      009F73 88               [ 1] 1405 	push	a
      009F74 6B 01            [ 1] 1406 	ld	(0x01, sp), a
                                   1407 ;	./../../lib/src/stm8s_tim1.c: 1345: TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
      009F76 C6 52 5A         [ 1] 1408 	ld	a, 0x525a
                                   1409 ;	./../../lib/src/stm8s_tim1.c: 1343: if (NewState != DISABLE)
      009F79 0D 01            [ 1] 1410 	tnz	(0x01, sp)
      009F7B 27 07            [ 1] 1411 	jreq	00102$
                                   1412 ;	./../../lib/src/stm8s_tim1.c: 1345: TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
      009F7D AA 04            [ 1] 1413 	or	a, #0x04
      009F7F C7 52 5A         [ 1] 1414 	ld	0x525a, a
      009F82 20 05            [ 2] 1415 	jra	00104$
      009F84                       1416 00102$:
                                   1417 ;	./../../lib/src/stm8s_tim1.c: 1349: TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
      009F84 A4 FB            [ 1] 1418 	and	a, #0xfb
      009F86 C7 52 5A         [ 1] 1419 	ld	0x525a, a
      009F89                       1420 00104$:
                                   1421 ;	./../../lib/src/stm8s_tim1.c: 1351: }
      009F89 84               [ 1] 1422 	pop	a
      009F8A 81               [ 4] 1423 	ret
                                   1424 ;	./../../lib/src/stm8s_tim1.c: 1359: void TIM1_OC4FastConfig(FunctionalState NewState)
                                   1425 ;	-----------------------------------------
                                   1426 ;	 function TIM1_OC4FastConfig
                                   1427 ;	-----------------------------------------
      009F8B                       1428 _TIM1_OC4FastConfig:
      009F8B 88               [ 1] 1429 	push	a
      009F8C 6B 01            [ 1] 1430 	ld	(0x01, sp), a
                                   1431 ;	./../../lib/src/stm8s_tim1.c: 1367: TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
      009F8E C6 52 5B         [ 1] 1432 	ld	a, 0x525b
                                   1433 ;	./../../lib/src/stm8s_tim1.c: 1365: if (NewState != DISABLE)
      009F91 0D 01            [ 1] 1434 	tnz	(0x01, sp)
      009F93 27 07            [ 1] 1435 	jreq	00102$
                                   1436 ;	./../../lib/src/stm8s_tim1.c: 1367: TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
      009F95 AA 04            [ 1] 1437 	or	a, #0x04
      009F97 C7 52 5B         [ 1] 1438 	ld	0x525b, a
      009F9A 20 05            [ 2] 1439 	jra	00104$
      009F9C                       1440 00102$:
                                   1441 ;	./../../lib/src/stm8s_tim1.c: 1371: TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
      009F9C A4 FB            [ 1] 1442 	and	a, #0xfb
      009F9E C7 52 5B         [ 1] 1443 	ld	0x525b, a
      009FA1                       1444 00104$:
                                   1445 ;	./../../lib/src/stm8s_tim1.c: 1373: }
      009FA1 84               [ 1] 1446 	pop	a
      009FA2 81               [ 4] 1447 	ret
                                   1448 ;	./../../lib/src/stm8s_tim1.c: 1389: void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
                                   1449 ;	-----------------------------------------
                                   1450 ;	 function TIM1_GenerateEvent
                                   1451 ;	-----------------------------------------
      009FA3                       1452 _TIM1_GenerateEvent:
                                   1453 ;	./../../lib/src/stm8s_tim1.c: 1395: TIM1->EGR = (uint8_t)TIM1_EventSource;
      009FA3 C7 52 57         [ 1] 1454 	ld	0x5257, a
                                   1455 ;	./../../lib/src/stm8s_tim1.c: 1396: }
      009FA6 81               [ 4] 1456 	ret
                                   1457 ;	./../../lib/src/stm8s_tim1.c: 1406: void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
                                   1458 ;	-----------------------------------------
                                   1459 ;	 function TIM1_OC1PolarityConfig
                                   1460 ;	-----------------------------------------
      009FA7                       1461 _TIM1_OC1PolarityConfig:
      009FA7 88               [ 1] 1462 	push	a
      009FA8 6B 01            [ 1] 1463 	ld	(0x01, sp), a
                                   1464 ;	./../../lib/src/stm8s_tim1.c: 1414: TIM1->CCER1 |= TIM1_CCER1_CC1P;
      009FAA C6 52 5C         [ 1] 1465 	ld	a, 0x525c
                                   1466 ;	./../../lib/src/stm8s_tim1.c: 1412: if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
      009FAD 0D 01            [ 1] 1467 	tnz	(0x01, sp)
      009FAF 27 07            [ 1] 1468 	jreq	00102$
                                   1469 ;	./../../lib/src/stm8s_tim1.c: 1414: TIM1->CCER1 |= TIM1_CCER1_CC1P;
      009FB1 AA 02            [ 1] 1470 	or	a, #0x02
      009FB3 C7 52 5C         [ 1] 1471 	ld	0x525c, a
      009FB6 20 05            [ 2] 1472 	jra	00104$
      009FB8                       1473 00102$:
                                   1474 ;	./../../lib/src/stm8s_tim1.c: 1418: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
      009FB8 A4 FD            [ 1] 1475 	and	a, #0xfd
      009FBA C7 52 5C         [ 1] 1476 	ld	0x525c, a
      009FBD                       1477 00104$:
                                   1478 ;	./../../lib/src/stm8s_tim1.c: 1420: }
      009FBD 84               [ 1] 1479 	pop	a
      009FBE 81               [ 4] 1480 	ret
                                   1481 ;	./../../lib/src/stm8s_tim1.c: 1430: void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
                                   1482 ;	-----------------------------------------
                                   1483 ;	 function TIM1_OC1NPolarityConfig
                                   1484 ;	-----------------------------------------
      009FBF                       1485 _TIM1_OC1NPolarityConfig:
      009FBF 88               [ 1] 1486 	push	a
      009FC0 6B 01            [ 1] 1487 	ld	(0x01, sp), a
                                   1488 ;	./../../lib/src/stm8s_tim1.c: 1438: TIM1->CCER1 |= TIM1_CCER1_CC1NP;
      009FC2 C6 52 5C         [ 1] 1489 	ld	a, 0x525c
                                   1490 ;	./../../lib/src/stm8s_tim1.c: 1436: if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
      009FC5 0D 01            [ 1] 1491 	tnz	(0x01, sp)
      009FC7 27 07            [ 1] 1492 	jreq	00102$
                                   1493 ;	./../../lib/src/stm8s_tim1.c: 1438: TIM1->CCER1 |= TIM1_CCER1_CC1NP;
      009FC9 AA 08            [ 1] 1494 	or	a, #0x08
      009FCB C7 52 5C         [ 1] 1495 	ld	0x525c, a
      009FCE 20 05            [ 2] 1496 	jra	00104$
      009FD0                       1497 00102$:
                                   1498 ;	./../../lib/src/stm8s_tim1.c: 1442: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
      009FD0 A4 F7            [ 1] 1499 	and	a, #0xf7
      009FD2 C7 52 5C         [ 1] 1500 	ld	0x525c, a
      009FD5                       1501 00104$:
                                   1502 ;	./../../lib/src/stm8s_tim1.c: 1444: }
      009FD5 84               [ 1] 1503 	pop	a
      009FD6 81               [ 4] 1504 	ret
                                   1505 ;	./../../lib/src/stm8s_tim1.c: 1454: void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
                                   1506 ;	-----------------------------------------
                                   1507 ;	 function TIM1_OC2PolarityConfig
                                   1508 ;	-----------------------------------------
      009FD7                       1509 _TIM1_OC2PolarityConfig:
      009FD7 88               [ 1] 1510 	push	a
      009FD8 6B 01            [ 1] 1511 	ld	(0x01, sp), a
                                   1512 ;	./../../lib/src/stm8s_tim1.c: 1462: TIM1->CCER1 |= TIM1_CCER1_CC2P;
      009FDA C6 52 5C         [ 1] 1513 	ld	a, 0x525c
                                   1514 ;	./../../lib/src/stm8s_tim1.c: 1460: if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
      009FDD 0D 01            [ 1] 1515 	tnz	(0x01, sp)
      009FDF 27 07            [ 1] 1516 	jreq	00102$
                                   1517 ;	./../../lib/src/stm8s_tim1.c: 1462: TIM1->CCER1 |= TIM1_CCER1_CC2P;
      009FE1 AA 20            [ 1] 1518 	or	a, #0x20
      009FE3 C7 52 5C         [ 1] 1519 	ld	0x525c, a
      009FE6 20 05            [ 2] 1520 	jra	00104$
      009FE8                       1521 00102$:
                                   1522 ;	./../../lib/src/stm8s_tim1.c: 1466: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
      009FE8 A4 DF            [ 1] 1523 	and	a, #0xdf
      009FEA C7 52 5C         [ 1] 1524 	ld	0x525c, a
      009FED                       1525 00104$:
                                   1526 ;	./../../lib/src/stm8s_tim1.c: 1468: }
      009FED 84               [ 1] 1527 	pop	a
      009FEE 81               [ 4] 1528 	ret
                                   1529 ;	./../../lib/src/stm8s_tim1.c: 1478: void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
                                   1530 ;	-----------------------------------------
                                   1531 ;	 function TIM1_OC2NPolarityConfig
                                   1532 ;	-----------------------------------------
      009FEF                       1533 _TIM1_OC2NPolarityConfig:
      009FEF 88               [ 1] 1534 	push	a
      009FF0 6B 01            [ 1] 1535 	ld	(0x01, sp), a
                                   1536 ;	./../../lib/src/stm8s_tim1.c: 1486: TIM1->CCER1 |= TIM1_CCER1_CC2NP;
      009FF2 C6 52 5C         [ 1] 1537 	ld	a, 0x525c
                                   1538 ;	./../../lib/src/stm8s_tim1.c: 1484: if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
      009FF5 0D 01            [ 1] 1539 	tnz	(0x01, sp)
      009FF7 27 07            [ 1] 1540 	jreq	00102$
                                   1541 ;	./../../lib/src/stm8s_tim1.c: 1486: TIM1->CCER1 |= TIM1_CCER1_CC2NP;
      009FF9 AA 80            [ 1] 1542 	or	a, #0x80
      009FFB C7 52 5C         [ 1] 1543 	ld	0x525c, a
      009FFE 20 05            [ 2] 1544 	jra	00104$
      00A000                       1545 00102$:
                                   1546 ;	./../../lib/src/stm8s_tim1.c: 1490: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
      00A000 A4 7F            [ 1] 1547 	and	a, #0x7f
      00A002 C7 52 5C         [ 1] 1548 	ld	0x525c, a
      00A005                       1549 00104$:
                                   1550 ;	./../../lib/src/stm8s_tim1.c: 1492: }
      00A005 84               [ 1] 1551 	pop	a
      00A006 81               [ 4] 1552 	ret
                                   1553 ;	./../../lib/src/stm8s_tim1.c: 1502: void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
                                   1554 ;	-----------------------------------------
                                   1555 ;	 function TIM1_OC3PolarityConfig
                                   1556 ;	-----------------------------------------
      00A007                       1557 _TIM1_OC3PolarityConfig:
      00A007 88               [ 1] 1558 	push	a
      00A008 6B 01            [ 1] 1559 	ld	(0x01, sp), a
                                   1560 ;	./../../lib/src/stm8s_tim1.c: 1510: TIM1->CCER2 |= TIM1_CCER2_CC3P;
      00A00A C6 52 5D         [ 1] 1561 	ld	a, 0x525d
                                   1562 ;	./../../lib/src/stm8s_tim1.c: 1508: if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
      00A00D 0D 01            [ 1] 1563 	tnz	(0x01, sp)
      00A00F 27 07            [ 1] 1564 	jreq	00102$
                                   1565 ;	./../../lib/src/stm8s_tim1.c: 1510: TIM1->CCER2 |= TIM1_CCER2_CC3P;
      00A011 AA 02            [ 1] 1566 	or	a, #0x02
      00A013 C7 52 5D         [ 1] 1567 	ld	0x525d, a
      00A016 20 05            [ 2] 1568 	jra	00104$
      00A018                       1569 00102$:
                                   1570 ;	./../../lib/src/stm8s_tim1.c: 1514: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
      00A018 A4 FD            [ 1] 1571 	and	a, #0xfd
      00A01A C7 52 5D         [ 1] 1572 	ld	0x525d, a
      00A01D                       1573 00104$:
                                   1574 ;	./../../lib/src/stm8s_tim1.c: 1516: }
      00A01D 84               [ 1] 1575 	pop	a
      00A01E 81               [ 4] 1576 	ret
                                   1577 ;	./../../lib/src/stm8s_tim1.c: 1527: void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
                                   1578 ;	-----------------------------------------
                                   1579 ;	 function TIM1_OC3NPolarityConfig
                                   1580 ;	-----------------------------------------
      00A01F                       1581 _TIM1_OC3NPolarityConfig:
      00A01F 88               [ 1] 1582 	push	a
      00A020 6B 01            [ 1] 1583 	ld	(0x01, sp), a
                                   1584 ;	./../../lib/src/stm8s_tim1.c: 1535: TIM1->CCER2 |= TIM1_CCER2_CC3NP;
      00A022 C6 52 5D         [ 1] 1585 	ld	a, 0x525d
                                   1586 ;	./../../lib/src/stm8s_tim1.c: 1533: if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
      00A025 0D 01            [ 1] 1587 	tnz	(0x01, sp)
      00A027 27 07            [ 1] 1588 	jreq	00102$
                                   1589 ;	./../../lib/src/stm8s_tim1.c: 1535: TIM1->CCER2 |= TIM1_CCER2_CC3NP;
      00A029 AA 08            [ 1] 1590 	or	a, #0x08
      00A02B C7 52 5D         [ 1] 1591 	ld	0x525d, a
      00A02E 20 05            [ 2] 1592 	jra	00104$
      00A030                       1593 00102$:
                                   1594 ;	./../../lib/src/stm8s_tim1.c: 1539: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
      00A030 A4 F7            [ 1] 1595 	and	a, #0xf7
      00A032 C7 52 5D         [ 1] 1596 	ld	0x525d, a
      00A035                       1597 00104$:
                                   1598 ;	./../../lib/src/stm8s_tim1.c: 1541: }
      00A035 84               [ 1] 1599 	pop	a
      00A036 81               [ 4] 1600 	ret
                                   1601 ;	./../../lib/src/stm8s_tim1.c: 1551: void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
                                   1602 ;	-----------------------------------------
                                   1603 ;	 function TIM1_OC4PolarityConfig
                                   1604 ;	-----------------------------------------
      00A037                       1605 _TIM1_OC4PolarityConfig:
      00A037 88               [ 1] 1606 	push	a
      00A038 6B 01            [ 1] 1607 	ld	(0x01, sp), a
                                   1608 ;	./../../lib/src/stm8s_tim1.c: 1559: TIM1->CCER2 |= TIM1_CCER2_CC4P;
      00A03A C6 52 5D         [ 1] 1609 	ld	a, 0x525d
                                   1610 ;	./../../lib/src/stm8s_tim1.c: 1557: if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
      00A03D 0D 01            [ 1] 1611 	tnz	(0x01, sp)
      00A03F 27 07            [ 1] 1612 	jreq	00102$
                                   1613 ;	./../../lib/src/stm8s_tim1.c: 1559: TIM1->CCER2 |= TIM1_CCER2_CC4P;
      00A041 AA 20            [ 1] 1614 	or	a, #0x20
      00A043 C7 52 5D         [ 1] 1615 	ld	0x525d, a
      00A046 20 05            [ 2] 1616 	jra	00104$
      00A048                       1617 00102$:
                                   1618 ;	./../../lib/src/stm8s_tim1.c: 1563: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
      00A048 A4 DF            [ 1] 1619 	and	a, #0xdf
      00A04A C7 52 5D         [ 1] 1620 	ld	0x525d, a
      00A04D                       1621 00104$:
                                   1622 ;	./../../lib/src/stm8s_tim1.c: 1565: }
      00A04D 84               [ 1] 1623 	pop	a
      00A04E 81               [ 4] 1624 	ret
                                   1625 ;	./../../lib/src/stm8s_tim1.c: 1579: void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
                                   1626 ;	-----------------------------------------
                                   1627 ;	 function TIM1_CCxCmd
                                   1628 ;	-----------------------------------------
      00A04F                       1629 _TIM1_CCxCmd:
                                   1630 ;	./../../lib/src/stm8s_tim1.c: 1585: if (TIM1_Channel == TIM1_CHANNEL_1)
      00A04F 97               [ 1] 1631 	ld	xl, a
      00A050 4D               [ 1] 1632 	tnz	a
      00A051 26 15            [ 1] 1633 	jrne	00120$
                                   1634 ;	./../../lib/src/stm8s_tim1.c: 1590: TIM1->CCER1 |= TIM1_CCER1_CC1E;
      00A053 C6 52 5C         [ 1] 1635 	ld	a, 0x525c
                                   1636 ;	./../../lib/src/stm8s_tim1.c: 1588: if (NewState != DISABLE)
      00A056 0D 03            [ 1] 1637 	tnz	(0x03, sp)
      00A058 27 07            [ 1] 1638 	jreq	00102$
                                   1639 ;	./../../lib/src/stm8s_tim1.c: 1590: TIM1->CCER1 |= TIM1_CCER1_CC1E;
      00A05A AA 01            [ 1] 1640 	or	a, #0x01
      00A05C C7 52 5C         [ 1] 1641 	ld	0x525c, a
      00A05F 20 4C            [ 2] 1642 	jra	00122$
      00A061                       1643 00102$:
                                   1644 ;	./../../lib/src/stm8s_tim1.c: 1594: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
      00A061 A4 FE            [ 1] 1645 	and	a, #0xfe
      00A063 C7 52 5C         [ 1] 1646 	ld	0x525c, a
      00A066 20 45            [ 2] 1647 	jra	00122$
      00A068                       1648 00120$:
                                   1649 ;	./../../lib/src/stm8s_tim1.c: 1598: else if (TIM1_Channel == TIM1_CHANNEL_2)
      00A068 9F               [ 1] 1650 	ld	a, xl
      00A069 4A               [ 1] 1651 	dec	a
      00A06A 26 15            [ 1] 1652 	jrne	00117$
                                   1653 ;	./../../lib/src/stm8s_tim1.c: 1590: TIM1->CCER1 |= TIM1_CCER1_CC1E;
      00A06C C6 52 5C         [ 1] 1654 	ld	a, 0x525c
                                   1655 ;	./../../lib/src/stm8s_tim1.c: 1601: if (NewState != DISABLE)
      00A06F 0D 03            [ 1] 1656 	tnz	(0x03, sp)
      00A071 27 07            [ 1] 1657 	jreq	00105$
                                   1658 ;	./../../lib/src/stm8s_tim1.c: 1603: TIM1->CCER1 |= TIM1_CCER1_CC2E;
      00A073 AA 10            [ 1] 1659 	or	a, #0x10
      00A075 C7 52 5C         [ 1] 1660 	ld	0x525c, a
      00A078 20 33            [ 2] 1661 	jra	00122$
      00A07A                       1662 00105$:
                                   1663 ;	./../../lib/src/stm8s_tim1.c: 1607: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
      00A07A A4 EF            [ 1] 1664 	and	a, #0xef
      00A07C C7 52 5C         [ 1] 1665 	ld	0x525c, a
      00A07F 20 2C            [ 2] 1666 	jra	00122$
      00A081                       1667 00117$:
                                   1668 ;	./../../lib/src/stm8s_tim1.c: 1615: TIM1->CCER2 |= TIM1_CCER2_CC3E;
      00A081 C6 52 5D         [ 1] 1669 	ld	a, 0x525d
                                   1670 ;	./../../lib/src/stm8s_tim1.c: 1610: else if (TIM1_Channel == TIM1_CHANNEL_3)
      00A084 88               [ 1] 1671 	push	a
      00A085 9F               [ 1] 1672 	ld	a, xl
      00A086 A1 02            [ 1] 1673 	cp	a, #0x02
      00A088 84               [ 1] 1674 	pop	a
      00A089 26 12            [ 1] 1675 	jrne	00114$
                                   1676 ;	./../../lib/src/stm8s_tim1.c: 1613: if (NewState != DISABLE)
      00A08B 0D 03            [ 1] 1677 	tnz	(0x03, sp)
      00A08D 27 07            [ 1] 1678 	jreq	00108$
                                   1679 ;	./../../lib/src/stm8s_tim1.c: 1615: TIM1->CCER2 |= TIM1_CCER2_CC3E;
      00A08F AA 01            [ 1] 1680 	or	a, #0x01
      00A091 C7 52 5D         [ 1] 1681 	ld	0x525d, a
      00A094 20 17            [ 2] 1682 	jra	00122$
      00A096                       1683 00108$:
                                   1684 ;	./../../lib/src/stm8s_tim1.c: 1619: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
      00A096 A4 FE            [ 1] 1685 	and	a, #0xfe
      00A098 C7 52 5D         [ 1] 1686 	ld	0x525d, a
      00A09B 20 10            [ 2] 1687 	jra	00122$
      00A09D                       1688 00114$:
                                   1689 ;	./../../lib/src/stm8s_tim1.c: 1625: if (NewState != DISABLE)
      00A09D 0D 03            [ 1] 1690 	tnz	(0x03, sp)
      00A09F 27 07            [ 1] 1691 	jreq	00111$
                                   1692 ;	./../../lib/src/stm8s_tim1.c: 1627: TIM1->CCER2 |= TIM1_CCER2_CC4E;
      00A0A1 AA 10            [ 1] 1693 	or	a, #0x10
      00A0A3 C7 52 5D         [ 1] 1694 	ld	0x525d, a
      00A0A6 20 05            [ 2] 1695 	jra	00122$
      00A0A8                       1696 00111$:
                                   1697 ;	./../../lib/src/stm8s_tim1.c: 1631: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
      00A0A8 A4 EF            [ 1] 1698 	and	a, #0xef
      00A0AA C7 52 5D         [ 1] 1699 	ld	0x525d, a
      00A0AD                       1700 00122$:
                                   1701 ;	./../../lib/src/stm8s_tim1.c: 1634: }
      00A0AD 85               [ 2] 1702 	popw	x
      00A0AE 84               [ 1] 1703 	pop	a
      00A0AF FC               [ 2] 1704 	jp	(x)
                                   1705 ;	./../../lib/src/stm8s_tim1.c: 1647: void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
                                   1706 ;	-----------------------------------------
                                   1707 ;	 function TIM1_CCxNCmd
                                   1708 ;	-----------------------------------------
      00A0B0                       1709 _TIM1_CCxNCmd:
                                   1710 ;	./../../lib/src/stm8s_tim1.c: 1653: if (TIM1_Channel == TIM1_CHANNEL_1)
      00A0B0 4D               [ 1] 1711 	tnz	a
      00A0B1 26 15            [ 1] 1712 	jrne	00114$
                                   1713 ;	./../../lib/src/stm8s_tim1.c: 1658: TIM1->CCER1 |= TIM1_CCER1_CC1NE;
      00A0B3 C6 52 5C         [ 1] 1714 	ld	a, 0x525c
                                   1715 ;	./../../lib/src/stm8s_tim1.c: 1656: if (NewState != DISABLE)
      00A0B6 0D 03            [ 1] 1716 	tnz	(0x03, sp)
      00A0B8 27 07            [ 1] 1717 	jreq	00102$
                                   1718 ;	./../../lib/src/stm8s_tim1.c: 1658: TIM1->CCER1 |= TIM1_CCER1_CC1NE;
      00A0BA AA 04            [ 1] 1719 	or	a, #0x04
      00A0BC C7 52 5C         [ 1] 1720 	ld	0x525c, a
      00A0BF 20 32            [ 2] 1721 	jra	00116$
      00A0C1                       1722 00102$:
                                   1723 ;	./../../lib/src/stm8s_tim1.c: 1662: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
      00A0C1 A4 FB            [ 1] 1724 	and	a, #0xfb
      00A0C3 C7 52 5C         [ 1] 1725 	ld	0x525c, a
      00A0C6 20 2B            [ 2] 1726 	jra	00116$
      00A0C8                       1727 00114$:
                                   1728 ;	./../../lib/src/stm8s_tim1.c: 1665: else if (TIM1_Channel == TIM1_CHANNEL_2)
      00A0C8 4A               [ 1] 1729 	dec	a
      00A0C9 26 15            [ 1] 1730 	jrne	00111$
                                   1731 ;	./../../lib/src/stm8s_tim1.c: 1658: TIM1->CCER1 |= TIM1_CCER1_CC1NE;
      00A0CB C6 52 5C         [ 1] 1732 	ld	a, 0x525c
                                   1733 ;	./../../lib/src/stm8s_tim1.c: 1668: if (NewState != DISABLE)
      00A0CE 0D 03            [ 1] 1734 	tnz	(0x03, sp)
      00A0D0 27 07            [ 1] 1735 	jreq	00105$
                                   1736 ;	./../../lib/src/stm8s_tim1.c: 1670: TIM1->CCER1 |= TIM1_CCER1_CC2NE;
      00A0D2 AA 40            [ 1] 1737 	or	a, #0x40
      00A0D4 C7 52 5C         [ 1] 1738 	ld	0x525c, a
      00A0D7 20 1A            [ 2] 1739 	jra	00116$
      00A0D9                       1740 00105$:
                                   1741 ;	./../../lib/src/stm8s_tim1.c: 1674: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
      00A0D9 A4 BF            [ 1] 1742 	and	a, #0xbf
      00A0DB C7 52 5C         [ 1] 1743 	ld	0x525c, a
      00A0DE 20 13            [ 2] 1744 	jra	00116$
      00A0E0                       1745 00111$:
                                   1746 ;	./../../lib/src/stm8s_tim1.c: 1682: TIM1->CCER2 |= TIM1_CCER2_CC3NE;
      00A0E0 C6 52 5D         [ 1] 1747 	ld	a, 0x525d
                                   1748 ;	./../../lib/src/stm8s_tim1.c: 1680: if (NewState != DISABLE)
      00A0E3 0D 03            [ 1] 1749 	tnz	(0x03, sp)
      00A0E5 27 07            [ 1] 1750 	jreq	00108$
                                   1751 ;	./../../lib/src/stm8s_tim1.c: 1682: TIM1->CCER2 |= TIM1_CCER2_CC3NE;
      00A0E7 AA 04            [ 1] 1752 	or	a, #0x04
      00A0E9 C7 52 5D         [ 1] 1753 	ld	0x525d, a
      00A0EC 20 05            [ 2] 1754 	jra	00116$
      00A0EE                       1755 00108$:
                                   1756 ;	./../../lib/src/stm8s_tim1.c: 1686: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
      00A0EE A4 FB            [ 1] 1757 	and	a, #0xfb
      00A0F0 C7 52 5D         [ 1] 1758 	ld	0x525d, a
      00A0F3                       1759 00116$:
                                   1760 ;	./../../lib/src/stm8s_tim1.c: 1689: }
      00A0F3 85               [ 2] 1761 	popw	x
      00A0F4 84               [ 1] 1762 	pop	a
      00A0F5 FC               [ 2] 1763 	jp	(x)
                                   1764 ;	./../../lib/src/stm8s_tim1.c: 1712: void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
                                   1765 ;	-----------------------------------------
                                   1766 ;	 function TIM1_SelectOCxM
                                   1767 ;	-----------------------------------------
      00A0F6                       1768 _TIM1_SelectOCxM:
                                   1769 ;	./../../lib/src/stm8s_tim1.c: 1718: if (TIM1_Channel == TIM1_CHANNEL_1)
      00A0F6 97               [ 1] 1770 	ld	xl, a
      00A0F7 4D               [ 1] 1771 	tnz	a
      00A0F8 26 10            [ 1] 1772 	jrne	00108$
                                   1773 ;	./../../lib/src/stm8s_tim1.c: 1721: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
      00A0FA 72 11 52 5C      [ 1] 1774 	bres	0x525c, #0
                                   1775 ;	./../../lib/src/stm8s_tim1.c: 1724: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
      00A0FE C6 52 58         [ 1] 1776 	ld	a, 0x5258
      00A101 A4 8F            [ 1] 1777 	and	a, #0x8f
                                   1778 ;	./../../lib/src/stm8s_tim1.c: 1725: | (uint8_t)TIM1_OCMode);
      00A103 1A 03            [ 1] 1779 	or	a, (0x03, sp)
      00A105 C7 52 58         [ 1] 1780 	ld	0x5258, a
      00A108 20 3E            [ 2] 1781 	jra	00110$
      00A10A                       1782 00108$:
                                   1783 ;	./../../lib/src/stm8s_tim1.c: 1727: else if (TIM1_Channel == TIM1_CHANNEL_2)
      00A10A 9F               [ 1] 1784 	ld	a, xl
      00A10B 4A               [ 1] 1785 	dec	a
      00A10C 26 10            [ 1] 1786 	jrne	00105$
                                   1787 ;	./../../lib/src/stm8s_tim1.c: 1730: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
      00A10E 72 19 52 5C      [ 1] 1788 	bres	0x525c, #4
                                   1789 ;	./../../lib/src/stm8s_tim1.c: 1733: TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
      00A112 C6 52 59         [ 1] 1790 	ld	a, 0x5259
      00A115 A4 8F            [ 1] 1791 	and	a, #0x8f
                                   1792 ;	./../../lib/src/stm8s_tim1.c: 1734: | (uint8_t)TIM1_OCMode);
      00A117 1A 03            [ 1] 1793 	or	a, (0x03, sp)
      00A119 C7 52 59         [ 1] 1794 	ld	0x5259, a
      00A11C 20 2A            [ 2] 1795 	jra	00110$
      00A11E                       1796 00105$:
                                   1797 ;	./../../lib/src/stm8s_tim1.c: 1739: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
      00A11E C6 52 5D         [ 1] 1798 	ld	a, 0x525d
                                   1799 ;	./../../lib/src/stm8s_tim1.c: 1736: else if (TIM1_Channel == TIM1_CHANNEL_3)
      00A121 88               [ 1] 1800 	push	a
      00A122 9F               [ 1] 1801 	ld	a, xl
      00A123 A1 02            [ 1] 1802 	cp	a, #0x02
      00A125 84               [ 1] 1803 	pop	a
      00A126 26 11            [ 1] 1804 	jrne	00102$
                                   1805 ;	./../../lib/src/stm8s_tim1.c: 1739: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
      00A128 A4 FE            [ 1] 1806 	and	a, #0xfe
      00A12A C7 52 5D         [ 1] 1807 	ld	0x525d, a
                                   1808 ;	./../../lib/src/stm8s_tim1.c: 1742: TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
      00A12D C6 52 5A         [ 1] 1809 	ld	a, 0x525a
      00A130 A4 8F            [ 1] 1810 	and	a, #0x8f
                                   1811 ;	./../../lib/src/stm8s_tim1.c: 1743: | (uint8_t)TIM1_OCMode);
      00A132 1A 03            [ 1] 1812 	or	a, (0x03, sp)
      00A134 C7 52 5A         [ 1] 1813 	ld	0x525a, a
      00A137 20 0F            [ 2] 1814 	jra	00110$
      00A139                       1815 00102$:
                                   1816 ;	./../../lib/src/stm8s_tim1.c: 1748: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
      00A139 A4 EF            [ 1] 1817 	and	a, #0xef
      00A13B C7 52 5D         [ 1] 1818 	ld	0x525d, a
                                   1819 ;	./../../lib/src/stm8s_tim1.c: 1751: TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
      00A13E C6 52 5B         [ 1] 1820 	ld	a, 0x525b
      00A141 A4 8F            [ 1] 1821 	and	a, #0x8f
                                   1822 ;	./../../lib/src/stm8s_tim1.c: 1752: | (uint8_t)TIM1_OCMode);
      00A143 1A 03            [ 1] 1823 	or	a, (0x03, sp)
      00A145 C7 52 5B         [ 1] 1824 	ld	0x525b, a
      00A148                       1825 00110$:
                                   1826 ;	./../../lib/src/stm8s_tim1.c: 1754: }
      00A148 85               [ 2] 1827 	popw	x
      00A149 84               [ 1] 1828 	pop	a
      00A14A FC               [ 2] 1829 	jp	(x)
                                   1830 ;	./../../lib/src/stm8s_tim1.c: 1762: void TIM1_SetCounter(uint16_t Counter)
                                   1831 ;	-----------------------------------------
                                   1832 ;	 function TIM1_SetCounter
                                   1833 ;	-----------------------------------------
      00A14B                       1834 _TIM1_SetCounter:
                                   1835 ;	./../../lib/src/stm8s_tim1.c: 1765: TIM1->CNTRH = (uint8_t)(Counter >> 8);
      00A14B 9E               [ 1] 1836 	ld	a, xh
      00A14C C7 52 5E         [ 1] 1837 	ld	0x525e, a
                                   1838 ;	./../../lib/src/stm8s_tim1.c: 1766: TIM1->CNTRL = (uint8_t)(Counter);
      00A14F 9F               [ 1] 1839 	ld	a, xl
      00A150 C7 52 5F         [ 1] 1840 	ld	0x525f, a
                                   1841 ;	./../../lib/src/stm8s_tim1.c: 1767: }
      00A153 81               [ 4] 1842 	ret
                                   1843 ;	./../../lib/src/stm8s_tim1.c: 1775: void TIM1_SetAutoreload(uint16_t Autoreload)
                                   1844 ;	-----------------------------------------
                                   1845 ;	 function TIM1_SetAutoreload
                                   1846 ;	-----------------------------------------
      00A154                       1847 _TIM1_SetAutoreload:
                                   1848 ;	./../../lib/src/stm8s_tim1.c: 1778: TIM1->ARRH = (uint8_t)(Autoreload >> 8);
      00A154 9E               [ 1] 1849 	ld	a, xh
      00A155 C7 52 62         [ 1] 1850 	ld	0x5262, a
                                   1851 ;	./../../lib/src/stm8s_tim1.c: 1779: TIM1->ARRL = (uint8_t)(Autoreload);
      00A158 9F               [ 1] 1852 	ld	a, xl
      00A159 C7 52 63         [ 1] 1853 	ld	0x5263, a
                                   1854 ;	./../../lib/src/stm8s_tim1.c: 1780: }
      00A15C 81               [ 4] 1855 	ret
                                   1856 ;	./../../lib/src/stm8s_tim1.c: 1788: void TIM1_SetCompare1(uint16_t Compare1)
                                   1857 ;	-----------------------------------------
                                   1858 ;	 function TIM1_SetCompare1
                                   1859 ;	-----------------------------------------
      00A15D                       1860 _TIM1_SetCompare1:
                                   1861 ;	./../../lib/src/stm8s_tim1.c: 1791: TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
      00A15D 9E               [ 1] 1862 	ld	a, xh
      00A15E C7 52 65         [ 1] 1863 	ld	0x5265, a
                                   1864 ;	./../../lib/src/stm8s_tim1.c: 1792: TIM1->CCR1L = (uint8_t)(Compare1);
      00A161 9F               [ 1] 1865 	ld	a, xl
      00A162 C7 52 66         [ 1] 1866 	ld	0x5266, a
                                   1867 ;	./../../lib/src/stm8s_tim1.c: 1793: }
      00A165 81               [ 4] 1868 	ret
                                   1869 ;	./../../lib/src/stm8s_tim1.c: 1801: void TIM1_SetCompare2(uint16_t Compare2)
                                   1870 ;	-----------------------------------------
                                   1871 ;	 function TIM1_SetCompare2
                                   1872 ;	-----------------------------------------
      00A166                       1873 _TIM1_SetCompare2:
                                   1874 ;	./../../lib/src/stm8s_tim1.c: 1804: TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
      00A166 9E               [ 1] 1875 	ld	a, xh
      00A167 C7 52 67         [ 1] 1876 	ld	0x5267, a
                                   1877 ;	./../../lib/src/stm8s_tim1.c: 1805: TIM1->CCR2L = (uint8_t)(Compare2);
      00A16A 9F               [ 1] 1878 	ld	a, xl
      00A16B C7 52 68         [ 1] 1879 	ld	0x5268, a
                                   1880 ;	./../../lib/src/stm8s_tim1.c: 1806: }
      00A16E 81               [ 4] 1881 	ret
                                   1882 ;	./../../lib/src/stm8s_tim1.c: 1814: void TIM1_SetCompare3(uint16_t Compare3)
                                   1883 ;	-----------------------------------------
                                   1884 ;	 function TIM1_SetCompare3
                                   1885 ;	-----------------------------------------
      00A16F                       1886 _TIM1_SetCompare3:
                                   1887 ;	./../../lib/src/stm8s_tim1.c: 1817: TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
      00A16F 9E               [ 1] 1888 	ld	a, xh
      00A170 C7 52 69         [ 1] 1889 	ld	0x5269, a
                                   1890 ;	./../../lib/src/stm8s_tim1.c: 1818: TIM1->CCR3L = (uint8_t)(Compare3);
      00A173 9F               [ 1] 1891 	ld	a, xl
      00A174 C7 52 6A         [ 1] 1892 	ld	0x526a, a
                                   1893 ;	./../../lib/src/stm8s_tim1.c: 1819: }
      00A177 81               [ 4] 1894 	ret
                                   1895 ;	./../../lib/src/stm8s_tim1.c: 1827: void TIM1_SetCompare4(uint16_t Compare4)
                                   1896 ;	-----------------------------------------
                                   1897 ;	 function TIM1_SetCompare4
                                   1898 ;	-----------------------------------------
      00A178                       1899 _TIM1_SetCompare4:
                                   1900 ;	./../../lib/src/stm8s_tim1.c: 1830: TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
      00A178 9E               [ 1] 1901 	ld	a, xh
      00A179 C7 52 6B         [ 1] 1902 	ld	0x526b, a
                                   1903 ;	./../../lib/src/stm8s_tim1.c: 1831: TIM1->CCR4L = (uint8_t)(Compare4);
      00A17C 9F               [ 1] 1904 	ld	a, xl
      00A17D C7 52 6C         [ 1] 1905 	ld	0x526c, a
                                   1906 ;	./../../lib/src/stm8s_tim1.c: 1832: }
      00A180 81               [ 4] 1907 	ret
                                   1908 ;	./../../lib/src/stm8s_tim1.c: 1844: void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
                                   1909 ;	-----------------------------------------
                                   1910 ;	 function TIM1_SetIC1Prescaler
                                   1911 ;	-----------------------------------------
      00A181                       1912 _TIM1_SetIC1Prescaler:
      00A181 88               [ 1] 1913 	push	a
      00A182 6B 01            [ 1] 1914 	ld	(0x01, sp), a
                                   1915 ;	./../../lib/src/stm8s_tim1.c: 1850: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
      00A184 C6 52 58         [ 1] 1916 	ld	a, 0x5258
      00A187 A4 F3            [ 1] 1917 	and	a, #0xf3
                                   1918 ;	./../../lib/src/stm8s_tim1.c: 1851: | (uint8_t)TIM1_IC1Prescaler);
      00A189 1A 01            [ 1] 1919 	or	a, (0x01, sp)
      00A18B C7 52 58         [ 1] 1920 	ld	0x5258, a
                                   1921 ;	./../../lib/src/stm8s_tim1.c: 1852: }
      00A18E 84               [ 1] 1922 	pop	a
      00A18F 81               [ 4] 1923 	ret
                                   1924 ;	./../../lib/src/stm8s_tim1.c: 1864: void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
                                   1925 ;	-----------------------------------------
                                   1926 ;	 function TIM1_SetIC2Prescaler
                                   1927 ;	-----------------------------------------
      00A190                       1928 _TIM1_SetIC2Prescaler:
      00A190 88               [ 1] 1929 	push	a
      00A191 6B 01            [ 1] 1930 	ld	(0x01, sp), a
                                   1931 ;	./../../lib/src/stm8s_tim1.c: 1871: TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
      00A193 C6 52 59         [ 1] 1932 	ld	a, 0x5259
      00A196 A4 F3            [ 1] 1933 	and	a, #0xf3
                                   1934 ;	./../../lib/src/stm8s_tim1.c: 1872: | (uint8_t)TIM1_IC2Prescaler);
      00A198 1A 01            [ 1] 1935 	or	a, (0x01, sp)
      00A19A C7 52 59         [ 1] 1936 	ld	0x5259, a
                                   1937 ;	./../../lib/src/stm8s_tim1.c: 1873: }
      00A19D 84               [ 1] 1938 	pop	a
      00A19E 81               [ 4] 1939 	ret
                                   1940 ;	./../../lib/src/stm8s_tim1.c: 1885: void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
                                   1941 ;	-----------------------------------------
                                   1942 ;	 function TIM1_SetIC3Prescaler
                                   1943 ;	-----------------------------------------
      00A19F                       1944 _TIM1_SetIC3Prescaler:
      00A19F 88               [ 1] 1945 	push	a
      00A1A0 6B 01            [ 1] 1946 	ld	(0x01, sp), a
                                   1947 ;	./../../lib/src/stm8s_tim1.c: 1892: TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
      00A1A2 C6 52 5A         [ 1] 1948 	ld	a, 0x525a
      00A1A5 A4 F3            [ 1] 1949 	and	a, #0xf3
                                   1950 ;	./../../lib/src/stm8s_tim1.c: 1893: (uint8_t)TIM1_IC3Prescaler);
      00A1A7 1A 01            [ 1] 1951 	or	a, (0x01, sp)
      00A1A9 C7 52 5A         [ 1] 1952 	ld	0x525a, a
                                   1953 ;	./../../lib/src/stm8s_tim1.c: 1894: }
      00A1AC 84               [ 1] 1954 	pop	a
      00A1AD 81               [ 4] 1955 	ret
                                   1956 ;	./../../lib/src/stm8s_tim1.c: 1906: void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
                                   1957 ;	-----------------------------------------
                                   1958 ;	 function TIM1_SetIC4Prescaler
                                   1959 ;	-----------------------------------------
      00A1AE                       1960 _TIM1_SetIC4Prescaler:
      00A1AE 88               [ 1] 1961 	push	a
      00A1AF 6B 01            [ 1] 1962 	ld	(0x01, sp), a
                                   1963 ;	./../../lib/src/stm8s_tim1.c: 1913: TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
      00A1B1 C6 52 5B         [ 1] 1964 	ld	a, 0x525b
      00A1B4 A4 F3            [ 1] 1965 	and	a, #0xf3
                                   1966 ;	./../../lib/src/stm8s_tim1.c: 1914: (uint8_t)TIM1_IC4Prescaler);
      00A1B6 1A 01            [ 1] 1967 	or	a, (0x01, sp)
      00A1B8 C7 52 5B         [ 1] 1968 	ld	0x525b, a
                                   1969 ;	./../../lib/src/stm8s_tim1.c: 1915: }
      00A1BB 84               [ 1] 1970 	pop	a
      00A1BC 81               [ 4] 1971 	ret
                                   1972 ;	./../../lib/src/stm8s_tim1.c: 1922: uint16_t TIM1_GetCapture1(void)
                                   1973 ;	-----------------------------------------
                                   1974 ;	 function TIM1_GetCapture1
                                   1975 ;	-----------------------------------------
      00A1BD                       1976 _TIM1_GetCapture1:
      00A1BD 52 02            [ 2] 1977 	sub	sp, #2
                                   1978 ;	./../../lib/src/stm8s_tim1.c: 1929: tmpccr1h = TIM1->CCR1H;
      00A1BF C6 52 65         [ 1] 1979 	ld	a, 0x5265
      00A1C2 95               [ 1] 1980 	ld	xh, a
                                   1981 ;	./../../lib/src/stm8s_tim1.c: 1930: tmpccr1l = TIM1->CCR1L;
      00A1C3 C6 52 66         [ 1] 1982 	ld	a, 0x5266
                                   1983 ;	./../../lib/src/stm8s_tim1.c: 1932: tmpccr1 = (uint16_t)(tmpccr1l);
      00A1C6 6B 02            [ 1] 1984 	ld	(0x02, sp), a
      00A1C8 0F 01            [ 1] 1985 	clr	(0x01, sp)
                                   1986 ;	./../../lib/src/stm8s_tim1.c: 1933: tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
      00A1CA 7B 02            [ 1] 1987 	ld	a, (0x02, sp)
      00A1CC 02               [ 1] 1988 	rlwa	x
      00A1CD 1A 01            [ 1] 1989 	or	a, (0x01, sp)
                                   1990 ;	./../../lib/src/stm8s_tim1.c: 1935: return (uint16_t)tmpccr1;
      00A1CF 95               [ 1] 1991 	ld	xh, a
                                   1992 ;	./../../lib/src/stm8s_tim1.c: 1936: }
      00A1D0 5B 02            [ 2] 1993 	addw	sp, #2
      00A1D2 81               [ 4] 1994 	ret
                                   1995 ;	./../../lib/src/stm8s_tim1.c: 1943: uint16_t TIM1_GetCapture2(void)
                                   1996 ;	-----------------------------------------
                                   1997 ;	 function TIM1_GetCapture2
                                   1998 ;	-----------------------------------------
      00A1D3                       1999 _TIM1_GetCapture2:
      00A1D3 52 02            [ 2] 2000 	sub	sp, #2
                                   2001 ;	./../../lib/src/stm8s_tim1.c: 1950: tmpccr2h = TIM1->CCR2H;
      00A1D5 C6 52 67         [ 1] 2002 	ld	a, 0x5267
      00A1D8 95               [ 1] 2003 	ld	xh, a
                                   2004 ;	./../../lib/src/stm8s_tim1.c: 1951: tmpccr2l = TIM1->CCR2L;
      00A1D9 C6 52 68         [ 1] 2005 	ld	a, 0x5268
                                   2006 ;	./../../lib/src/stm8s_tim1.c: 1953: tmpccr2 = (uint16_t)(tmpccr2l);
      00A1DC 6B 02            [ 1] 2007 	ld	(0x02, sp), a
      00A1DE 0F 01            [ 1] 2008 	clr	(0x01, sp)
                                   2009 ;	./../../lib/src/stm8s_tim1.c: 1954: tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
      00A1E0 7B 02            [ 1] 2010 	ld	a, (0x02, sp)
      00A1E2 02               [ 1] 2011 	rlwa	x
      00A1E3 1A 01            [ 1] 2012 	or	a, (0x01, sp)
                                   2013 ;	./../../lib/src/stm8s_tim1.c: 1956: return (uint16_t)tmpccr2;
      00A1E5 95               [ 1] 2014 	ld	xh, a
                                   2015 ;	./../../lib/src/stm8s_tim1.c: 1957: }
      00A1E6 5B 02            [ 2] 2016 	addw	sp, #2
      00A1E8 81               [ 4] 2017 	ret
                                   2018 ;	./../../lib/src/stm8s_tim1.c: 1964: uint16_t TIM1_GetCapture3(void)
                                   2019 ;	-----------------------------------------
                                   2020 ;	 function TIM1_GetCapture3
                                   2021 ;	-----------------------------------------
      00A1E9                       2022 _TIM1_GetCapture3:
      00A1E9 52 02            [ 2] 2023 	sub	sp, #2
                                   2024 ;	./../../lib/src/stm8s_tim1.c: 1970: tmpccr3h = TIM1->CCR3H;
      00A1EB C6 52 69         [ 1] 2025 	ld	a, 0x5269
      00A1EE 95               [ 1] 2026 	ld	xh, a
                                   2027 ;	./../../lib/src/stm8s_tim1.c: 1971: tmpccr3l = TIM1->CCR3L;
      00A1EF C6 52 6A         [ 1] 2028 	ld	a, 0x526a
                                   2029 ;	./../../lib/src/stm8s_tim1.c: 1973: tmpccr3 = (uint16_t)(tmpccr3l);
      00A1F2 6B 02            [ 1] 2030 	ld	(0x02, sp), a
      00A1F4 0F 01            [ 1] 2031 	clr	(0x01, sp)
                                   2032 ;	./../../lib/src/stm8s_tim1.c: 1974: tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
      00A1F6 7B 02            [ 1] 2033 	ld	a, (0x02, sp)
      00A1F8 02               [ 1] 2034 	rlwa	x
      00A1F9 1A 01            [ 1] 2035 	or	a, (0x01, sp)
                                   2036 ;	./../../lib/src/stm8s_tim1.c: 1976: return (uint16_t)tmpccr3;
      00A1FB 95               [ 1] 2037 	ld	xh, a
                                   2038 ;	./../../lib/src/stm8s_tim1.c: 1977: }
      00A1FC 5B 02            [ 2] 2039 	addw	sp, #2
      00A1FE 81               [ 4] 2040 	ret
                                   2041 ;	./../../lib/src/stm8s_tim1.c: 1984: uint16_t TIM1_GetCapture4(void)
                                   2042 ;	-----------------------------------------
                                   2043 ;	 function TIM1_GetCapture4
                                   2044 ;	-----------------------------------------
      00A1FF                       2045 _TIM1_GetCapture4:
      00A1FF 52 02            [ 2] 2046 	sub	sp, #2
                                   2047 ;	./../../lib/src/stm8s_tim1.c: 1990: tmpccr4h = TIM1->CCR4H;
      00A201 C6 52 6B         [ 1] 2048 	ld	a, 0x526b
      00A204 95               [ 1] 2049 	ld	xh, a
                                   2050 ;	./../../lib/src/stm8s_tim1.c: 1991: tmpccr4l = TIM1->CCR4L;
      00A205 C6 52 6C         [ 1] 2051 	ld	a, 0x526c
                                   2052 ;	./../../lib/src/stm8s_tim1.c: 1993: tmpccr4 = (uint16_t)(tmpccr4l);
      00A208 6B 02            [ 1] 2053 	ld	(0x02, sp), a
      00A20A 0F 01            [ 1] 2054 	clr	(0x01, sp)
                                   2055 ;	./../../lib/src/stm8s_tim1.c: 1994: tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
      00A20C 7B 02            [ 1] 2056 	ld	a, (0x02, sp)
      00A20E 02               [ 1] 2057 	rlwa	x
      00A20F 1A 01            [ 1] 2058 	or	a, (0x01, sp)
                                   2059 ;	./../../lib/src/stm8s_tim1.c: 1996: return (uint16_t)tmpccr4;
      00A211 95               [ 1] 2060 	ld	xh, a
                                   2061 ;	./../../lib/src/stm8s_tim1.c: 1997: }
      00A212 5B 02            [ 2] 2062 	addw	sp, #2
      00A214 81               [ 4] 2063 	ret
                                   2064 ;	./../../lib/src/stm8s_tim1.c: 2004: uint16_t TIM1_GetCounter(void)
                                   2065 ;	-----------------------------------------
                                   2066 ;	 function TIM1_GetCounter
                                   2067 ;	-----------------------------------------
      00A215                       2068 _TIM1_GetCounter:
      00A215 52 04            [ 2] 2069 	sub	sp, #4
                                   2070 ;	./../../lib/src/stm8s_tim1.c: 2008: tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
      00A217 C6 52 5E         [ 1] 2071 	ld	a, 0x525e
      00A21A 95               [ 1] 2072 	ld	xh, a
      00A21B 0F 02            [ 1] 2073 	clr	(0x02, sp)
                                   2074 ;	./../../lib/src/stm8s_tim1.c: 2011: return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
      00A21D C6 52 5F         [ 1] 2075 	ld	a, 0x525f
      00A220 0F 03            [ 1] 2076 	clr	(0x03, sp)
      00A222 1A 02            [ 1] 2077 	or	a, (0x02, sp)
      00A224 02               [ 1] 2078 	rlwa	x
      00A225 1A 03            [ 1] 2079 	or	a, (0x03, sp)
      00A227 95               [ 1] 2080 	ld	xh, a
                                   2081 ;	./../../lib/src/stm8s_tim1.c: 2012: }
      00A228 5B 04            [ 2] 2082 	addw	sp, #4
      00A22A 81               [ 4] 2083 	ret
                                   2084 ;	./../../lib/src/stm8s_tim1.c: 2019: uint16_t TIM1_GetPrescaler(void)
                                   2085 ;	-----------------------------------------
                                   2086 ;	 function TIM1_GetPrescaler
                                   2087 ;	-----------------------------------------
      00A22B                       2088 _TIM1_GetPrescaler:
      00A22B 52 04            [ 2] 2089 	sub	sp, #4
                                   2090 ;	./../../lib/src/stm8s_tim1.c: 2023: temp = ((uint16_t)TIM1->PSCRH << 8);
      00A22D C6 52 60         [ 1] 2091 	ld	a, 0x5260
      00A230 95               [ 1] 2092 	ld	xh, a
      00A231 0F 02            [ 1] 2093 	clr	(0x02, sp)
                                   2094 ;	./../../lib/src/stm8s_tim1.c: 2026: return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
      00A233 C6 52 61         [ 1] 2095 	ld	a, 0x5261
      00A236 0F 03            [ 1] 2096 	clr	(0x03, sp)
      00A238 1A 02            [ 1] 2097 	or	a, (0x02, sp)
      00A23A 02               [ 1] 2098 	rlwa	x
      00A23B 1A 03            [ 1] 2099 	or	a, (0x03, sp)
      00A23D 95               [ 1] 2100 	ld	xh, a
                                   2101 ;	./../../lib/src/stm8s_tim1.c: 2027: }
      00A23E 5B 04            [ 2] 2102 	addw	sp, #4
      00A240 81               [ 4] 2103 	ret
                                   2104 ;	./../../lib/src/stm8s_tim1.c: 2047: FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
                                   2105 ;	-----------------------------------------
                                   2106 ;	 function TIM1_GetFlagStatus
                                   2107 ;	-----------------------------------------
      00A241                       2108 _TIM1_GetFlagStatus:
      00A241 88               [ 1] 2109 	push	a
                                   2110 ;	./../../lib/src/stm8s_tim1.c: 2055: tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
      00A242 C6 52 55         [ 1] 2111 	ld	a, 0x5255
      00A245 6B 01            [ 1] 2112 	ld	(0x01, sp), a
      00A247 9F               [ 1] 2113 	ld	a, xl
      00A248 14 01            [ 1] 2114 	and	a, (0x01, sp)
      00A24A 6B 01            [ 1] 2115 	ld	(0x01, sp), a
                                   2116 ;	./../../lib/src/stm8s_tim1.c: 2056: tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
                                   2117 ;	./../../lib/src/stm8s_tim1.c: 2058: if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
      00A24C C6 52 56         [ 1] 2118 	ld	a, 0x5256
      00A24F 89               [ 2] 2119 	pushw	x
      00A250 14 01            [ 1] 2120 	and	a, (1, sp)
      00A252 85               [ 2] 2121 	popw	x
      00A253 1A 01            [ 1] 2122 	or	a, (0x01, sp)
      00A255 27 03            [ 1] 2123 	jreq	00102$
                                   2124 ;	./../../lib/src/stm8s_tim1.c: 2060: bitstatus = SET;
      00A257 A6 01            [ 1] 2125 	ld	a, #0x01
                                   2126 ;	./../../lib/src/stm8s_tim1.c: 2064: bitstatus = RESET;
      00A259 21                    2127 	.byte 0x21
      00A25A                       2128 00102$:
      00A25A 4F               [ 1] 2129 	clr	a
      00A25B                       2130 00103$:
                                   2131 ;	./../../lib/src/stm8s_tim1.c: 2066: return (FlagStatus)(bitstatus);
                                   2132 ;	./../../lib/src/stm8s_tim1.c: 2067: }
      00A25B 5B 01            [ 2] 2133 	addw	sp, #1
      00A25D 81               [ 4] 2134 	ret
                                   2135 ;	./../../lib/src/stm8s_tim1.c: 2087: void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
                                   2136 ;	-----------------------------------------
                                   2137 ;	 function TIM1_ClearFlag
                                   2138 ;	-----------------------------------------
      00A25E                       2139 _TIM1_ClearFlag:
                                   2140 ;	./../../lib/src/stm8s_tim1.c: 2093: TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
      00A25E 9F               [ 1] 2141 	ld	a, xl
      00A25F 43               [ 1] 2142 	cpl	a
      00A260 C7 52 55         [ 1] 2143 	ld	0x5255, a
                                   2144 ;	./../../lib/src/stm8s_tim1.c: 2094: TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
      00A263 9E               [ 1] 2145 	ld	a, xh
      00A264 43               [ 1] 2146 	cpl	a
      00A265 A4 1E            [ 1] 2147 	and	a, #0x1e
      00A267 C7 52 56         [ 1] 2148 	ld	0x5256, a
                                   2149 ;	./../../lib/src/stm8s_tim1.c: 2096: }
      00A26A 81               [ 4] 2150 	ret
                                   2151 ;	./../../lib/src/stm8s_tim1.c: 2112: ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
                                   2152 ;	-----------------------------------------
                                   2153 ;	 function TIM1_GetITStatus
                                   2154 ;	-----------------------------------------
      00A26B                       2155 _TIM1_GetITStatus:
      00A26B 52 02            [ 2] 2156 	sub	sp, #2
      00A26D 6B 02            [ 1] 2157 	ld	(0x02, sp), a
                                   2158 ;	./../../lib/src/stm8s_tim1.c: 2120: TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
      00A26F C6 52 55         [ 1] 2159 	ld	a, 0x5255
      00A272 14 02            [ 1] 2160 	and	a, (0x02, sp)
      00A274 6B 01            [ 1] 2161 	ld	(0x01, sp), a
                                   2162 ;	./../../lib/src/stm8s_tim1.c: 2122: TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
      00A276 C6 52 54         [ 1] 2163 	ld	a, 0x5254
      00A279 14 02            [ 1] 2164 	and	a, (0x02, sp)
                                   2165 ;	./../../lib/src/stm8s_tim1.c: 2124: if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
      00A27B 0D 01            [ 1] 2166 	tnz	(0x01, sp)
      00A27D 27 06            [ 1] 2167 	jreq	00102$
      00A27F 4D               [ 1] 2168 	tnz	a
      00A280 27 03            [ 1] 2169 	jreq	00102$
                                   2170 ;	./../../lib/src/stm8s_tim1.c: 2126: bitstatus = SET;
      00A282 A6 01            [ 1] 2171 	ld	a, #0x01
                                   2172 ;	./../../lib/src/stm8s_tim1.c: 2130: bitstatus = RESET;
      00A284 21                    2173 	.byte 0x21
      00A285                       2174 00102$:
      00A285 4F               [ 1] 2175 	clr	a
      00A286                       2176 00103$:
                                   2177 ;	./../../lib/src/stm8s_tim1.c: 2132: return (ITStatus)(bitstatus);
                                   2178 ;	./../../lib/src/stm8s_tim1.c: 2133: }
      00A286 5B 02            [ 2] 2179 	addw	sp, #2
      00A288 81               [ 4] 2180 	ret
                                   2181 ;	./../../lib/src/stm8s_tim1.c: 2149: void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
                                   2182 ;	-----------------------------------------
                                   2183 ;	 function TIM1_ClearITPendingBit
                                   2184 ;	-----------------------------------------
      00A289                       2185 _TIM1_ClearITPendingBit:
                                   2186 ;	./../../lib/src/stm8s_tim1.c: 2155: TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
      00A289 43               [ 1] 2187 	cpl	a
      00A28A C7 52 55         [ 1] 2188 	ld	0x5255, a
                                   2189 ;	./../../lib/src/stm8s_tim1.c: 2156: }
      00A28D 81               [ 4] 2190 	ret
                                   2191 ;	./../../lib/src/stm8s_tim1.c: 2174: static void TI1_Config(uint8_t TIM1_ICPolarity,
                                   2192 ;	-----------------------------------------
                                   2193 ;	 function TI1_Config
                                   2194 ;	-----------------------------------------
      00A28E                       2195 _TI1_Config:
      00A28E 52 02            [ 2] 2196 	sub	sp, #2
      00A290 6B 02            [ 1] 2197 	ld	(0x02, sp), a
                                   2198 ;	./../../lib/src/stm8s_tim1.c: 2179: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
      00A292 72 11 52 5C      [ 1] 2199 	bres	0x525c, #0
                                   2200 ;	./../../lib/src/stm8s_tim1.c: 2182: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
      00A296 C6 52 58         [ 1] 2201 	ld	a, 0x5258
      00A299 A4 0C            [ 1] 2202 	and	a, #0x0c
      00A29B 6B 01            [ 1] 2203 	ld	(0x01, sp), a
                                   2204 ;	./../../lib/src/stm8s_tim1.c: 2183: (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
      00A29D 7B 06            [ 1] 2205 	ld	a, (0x06, sp)
      00A29F 4E               [ 1] 2206 	swap	a
      00A2A0 A4 F0            [ 1] 2207 	and	a, #0xf0
      00A2A2 1A 05            [ 1] 2208 	or	a, (0x05, sp)
      00A2A4 1A 01            [ 1] 2209 	or	a, (0x01, sp)
      00A2A6 C7 52 58         [ 1] 2210 	ld	0x5258, a
                                   2211 ;	./../../lib/src/stm8s_tim1.c: 2179: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
      00A2A9 C6 52 5C         [ 1] 2212 	ld	a, 0x525c
                                   2213 ;	./../../lib/src/stm8s_tim1.c: 2186: if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
      00A2AC 0D 02            [ 1] 2214 	tnz	(0x02, sp)
      00A2AE 27 07            [ 1] 2215 	jreq	00102$
                                   2216 ;	./../../lib/src/stm8s_tim1.c: 2188: TIM1->CCER1 |= TIM1_CCER1_CC1P;
      00A2B0 AA 02            [ 1] 2217 	or	a, #0x02
      00A2B2 C7 52 5C         [ 1] 2218 	ld	0x525c, a
      00A2B5 20 05            [ 2] 2219 	jra	00103$
      00A2B7                       2220 00102$:
                                   2221 ;	./../../lib/src/stm8s_tim1.c: 2192: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
      00A2B7 A4 FD            [ 1] 2222 	and	a, #0xfd
      00A2B9 C7 52 5C         [ 1] 2223 	ld	0x525c, a
      00A2BC                       2224 00103$:
                                   2225 ;	./../../lib/src/stm8s_tim1.c: 2196: TIM1->CCER1 |=  TIM1_CCER1_CC1E;
      00A2BC C6 52 5C         [ 1] 2226 	ld	a, 0x525c
      00A2BF AA 01            [ 1] 2227 	or	a, #0x01
      00A2C1 C7 52 5C         [ 1] 2228 	ld	0x525c, a
                                   2229 ;	./../../lib/src/stm8s_tim1.c: 2197: }
      00A2C4 1E 03            [ 2] 2230 	ldw	x, (3, sp)
      00A2C6 5B 06            [ 2] 2231 	addw	sp, #6
      00A2C8 FC               [ 2] 2232 	jp	(x)
                                   2233 ;	./../../lib/src/stm8s_tim1.c: 2215: static void TI2_Config(uint8_t TIM1_ICPolarity,
                                   2234 ;	-----------------------------------------
                                   2235 ;	 function TI2_Config
                                   2236 ;	-----------------------------------------
      00A2C9                       2237 _TI2_Config:
      00A2C9 52 02            [ 2] 2238 	sub	sp, #2
      00A2CB 6B 02            [ 1] 2239 	ld	(0x02, sp), a
                                   2240 ;	./../../lib/src/stm8s_tim1.c: 2220: TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
      00A2CD 72 19 52 5C      [ 1] 2241 	bres	0x525c, #4
                                   2242 ;	./../../lib/src/stm8s_tim1.c: 2223: TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
      00A2D1 C6 52 59         [ 1] 2243 	ld	a, 0x5259
      00A2D4 A4 0C            [ 1] 2244 	and	a, #0x0c
      00A2D6 6B 01            [ 1] 2245 	ld	(0x01, sp), a
                                   2246 ;	./../../lib/src/stm8s_tim1.c: 2224: | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
      00A2D8 7B 06            [ 1] 2247 	ld	a, (0x06, sp)
      00A2DA 4E               [ 1] 2248 	swap	a
      00A2DB A4 F0            [ 1] 2249 	and	a, #0xf0
      00A2DD 1A 05            [ 1] 2250 	or	a, (0x05, sp)
      00A2DF 1A 01            [ 1] 2251 	or	a, (0x01, sp)
      00A2E1 C7 52 59         [ 1] 2252 	ld	0x5259, a
                                   2253 ;	./../../lib/src/stm8s_tim1.c: 2220: TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
      00A2E4 C6 52 5C         [ 1] 2254 	ld	a, 0x525c
                                   2255 ;	./../../lib/src/stm8s_tim1.c: 2226: if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
      00A2E7 0D 02            [ 1] 2256 	tnz	(0x02, sp)
      00A2E9 27 07            [ 1] 2257 	jreq	00102$
                                   2258 ;	./../../lib/src/stm8s_tim1.c: 2228: TIM1->CCER1 |= TIM1_CCER1_CC2P;
      00A2EB AA 20            [ 1] 2259 	or	a, #0x20
      00A2ED C7 52 5C         [ 1] 2260 	ld	0x525c, a
      00A2F0 20 05            [ 2] 2261 	jra	00103$
      00A2F2                       2262 00102$:
                                   2263 ;	./../../lib/src/stm8s_tim1.c: 2232: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
      00A2F2 A4 DF            [ 1] 2264 	and	a, #0xdf
      00A2F4 C7 52 5C         [ 1] 2265 	ld	0x525c, a
      00A2F7                       2266 00103$:
                                   2267 ;	./../../lib/src/stm8s_tim1.c: 2235: TIM1->CCER1 |=  TIM1_CCER1_CC2E;
      00A2F7 C6 52 5C         [ 1] 2268 	ld	a, 0x525c
      00A2FA AA 10            [ 1] 2269 	or	a, #0x10
      00A2FC C7 52 5C         [ 1] 2270 	ld	0x525c, a
                                   2271 ;	./../../lib/src/stm8s_tim1.c: 2236: }
      00A2FF 1E 03            [ 2] 2272 	ldw	x, (3, sp)
      00A301 5B 06            [ 2] 2273 	addw	sp, #6
      00A303 FC               [ 2] 2274 	jp	(x)
                                   2275 ;	./../../lib/src/stm8s_tim1.c: 2254: static void TI3_Config(uint8_t TIM1_ICPolarity,
                                   2276 ;	-----------------------------------------
                                   2277 ;	 function TI3_Config
                                   2278 ;	-----------------------------------------
      00A304                       2279 _TI3_Config:
      00A304 52 02            [ 2] 2280 	sub	sp, #2
      00A306 6B 02            [ 1] 2281 	ld	(0x02, sp), a
                                   2282 ;	./../../lib/src/stm8s_tim1.c: 2259: TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
      00A308 C6 52 5D         [ 1] 2283 	ld	a, 0x525d
      00A30B A4 FE            [ 1] 2284 	and	a, #0xfe
      00A30D C7 52 5D         [ 1] 2285 	ld	0x525d, a
                                   2286 ;	./../../lib/src/stm8s_tim1.c: 2262: TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
      00A310 C6 52 5A         [ 1] 2287 	ld	a, 0x525a
      00A313 A4 0C            [ 1] 2288 	and	a, #0x0c
      00A315 6B 01            [ 1] 2289 	ld	(0x01, sp), a
                                   2290 ;	./../../lib/src/stm8s_tim1.c: 2263: | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
      00A317 7B 06            [ 1] 2291 	ld	a, (0x06, sp)
      00A319 4E               [ 1] 2292 	swap	a
      00A31A A4 F0            [ 1] 2293 	and	a, #0xf0
      00A31C 1A 05            [ 1] 2294 	or	a, (0x05, sp)
      00A31E 1A 01            [ 1] 2295 	or	a, (0x01, sp)
      00A320 C7 52 5A         [ 1] 2296 	ld	0x525a, a
                                   2297 ;	./../../lib/src/stm8s_tim1.c: 2259: TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
      00A323 C6 52 5D         [ 1] 2298 	ld	a, 0x525d
                                   2299 ;	./../../lib/src/stm8s_tim1.c: 2266: if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
      00A326 0D 02            [ 1] 2300 	tnz	(0x02, sp)
      00A328 27 07            [ 1] 2301 	jreq	00102$
                                   2302 ;	./../../lib/src/stm8s_tim1.c: 2268: TIM1->CCER2 |= TIM1_CCER2_CC3P;
      00A32A AA 02            [ 1] 2303 	or	a, #0x02
      00A32C C7 52 5D         [ 1] 2304 	ld	0x525d, a
      00A32F 20 05            [ 2] 2305 	jra	00103$
      00A331                       2306 00102$:
                                   2307 ;	./../../lib/src/stm8s_tim1.c: 2272: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
      00A331 A4 FD            [ 1] 2308 	and	a, #0xfd
      00A333 C7 52 5D         [ 1] 2309 	ld	0x525d, a
      00A336                       2310 00103$:
                                   2311 ;	./../../lib/src/stm8s_tim1.c: 2275: TIM1->CCER2 |=  TIM1_CCER2_CC3E;
      00A336 C6 52 5D         [ 1] 2312 	ld	a, 0x525d
      00A339 AA 01            [ 1] 2313 	or	a, #0x01
      00A33B C7 52 5D         [ 1] 2314 	ld	0x525d, a
                                   2315 ;	./../../lib/src/stm8s_tim1.c: 2276: }
      00A33E 1E 03            [ 2] 2316 	ldw	x, (3, sp)
      00A340 5B 06            [ 2] 2317 	addw	sp, #6
      00A342 FC               [ 2] 2318 	jp	(x)
                                   2319 ;	./../../lib/src/stm8s_tim1.c: 2294: static void TI4_Config(uint8_t TIM1_ICPolarity,
                                   2320 ;	-----------------------------------------
                                   2321 ;	 function TI4_Config
                                   2322 ;	-----------------------------------------
      00A343                       2323 _TI4_Config:
      00A343 52 02            [ 2] 2324 	sub	sp, #2
      00A345 6B 02            [ 1] 2325 	ld	(0x02, sp), a
                                   2326 ;	./../../lib/src/stm8s_tim1.c: 2299: TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
      00A347 72 19 52 5D      [ 1] 2327 	bres	0x525d, #4
                                   2328 ;	./../../lib/src/stm8s_tim1.c: 2302: TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
      00A34B C6 52 5B         [ 1] 2329 	ld	a, 0x525b
      00A34E A4 0C            [ 1] 2330 	and	a, #0x0c
      00A350 6B 01            [ 1] 2331 	ld	(0x01, sp), a
                                   2332 ;	./../../lib/src/stm8s_tim1.c: 2303: | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
      00A352 7B 06            [ 1] 2333 	ld	a, (0x06, sp)
      00A354 4E               [ 1] 2334 	swap	a
      00A355 A4 F0            [ 1] 2335 	and	a, #0xf0
      00A357 1A 05            [ 1] 2336 	or	a, (0x05, sp)
      00A359 1A 01            [ 1] 2337 	or	a, (0x01, sp)
      00A35B C7 52 5B         [ 1] 2338 	ld	0x525b, a
                                   2339 ;	./../../lib/src/stm8s_tim1.c: 2299: TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
      00A35E C6 52 5D         [ 1] 2340 	ld	a, 0x525d
                                   2341 ;	./../../lib/src/stm8s_tim1.c: 2306: if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
      00A361 0D 02            [ 1] 2342 	tnz	(0x02, sp)
      00A363 27 07            [ 1] 2343 	jreq	00102$
                                   2344 ;	./../../lib/src/stm8s_tim1.c: 2308: TIM1->CCER2 |= TIM1_CCER2_CC4P;
      00A365 AA 20            [ 1] 2345 	or	a, #0x20
      00A367 C7 52 5D         [ 1] 2346 	ld	0x525d, a
      00A36A 20 05            [ 2] 2347 	jra	00103$
      00A36C                       2348 00102$:
                                   2349 ;	./../../lib/src/stm8s_tim1.c: 2312: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
      00A36C A4 DF            [ 1] 2350 	and	a, #0xdf
      00A36E C7 52 5D         [ 1] 2351 	ld	0x525d, a
      00A371                       2352 00103$:
                                   2353 ;	./../../lib/src/stm8s_tim1.c: 2316: TIM1->CCER2 |=  TIM1_CCER2_CC4E;
      00A371 C6 52 5D         [ 1] 2354 	ld	a, 0x525d
      00A374 AA 10            [ 1] 2355 	or	a, #0x10
      00A376 C7 52 5D         [ 1] 2356 	ld	0x525d, a
                                   2357 ;	./../../lib/src/stm8s_tim1.c: 2317: }
      00A379 1E 03            [ 2] 2358 	ldw	x, (3, sp)
      00A37B 5B 06            [ 2] 2359 	addw	sp, #6
      00A37D FC               [ 2] 2360 	jp	(x)
                                   2361 	.area CODE
                                   2362 	.area CONST
                                   2363 	.area INITIALIZER
                                   2364 	.area CABS (ABS)
