                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_tim2
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM2_DeInit
                                     12 	.globl _TIM2_TimeBaseInit
                                     13 	.globl _TIM2_OC1Init
                                     14 	.globl _TIM2_OC2Init
                                     15 	.globl _TIM2_OC3Init
                                     16 	.globl _TIM2_ICInit
                                     17 	.globl _TIM2_PWMIConfig
                                     18 	.globl _TIM2_Cmd
                                     19 	.globl _TIM2_ITConfig
                                     20 	.globl _TIM2_UpdateDisableConfig
                                     21 	.globl _TIM2_UpdateRequestConfig
                                     22 	.globl _TIM2_SelectOnePulseMode
                                     23 	.globl _TIM2_PrescalerConfig
                                     24 	.globl _TIM2_ForcedOC1Config
                                     25 	.globl _TIM2_ForcedOC2Config
                                     26 	.globl _TIM2_ForcedOC3Config
                                     27 	.globl _TIM2_ARRPreloadConfig
                                     28 	.globl _TIM2_OC1PreloadConfig
                                     29 	.globl _TIM2_OC2PreloadConfig
                                     30 	.globl _TIM2_OC3PreloadConfig
                                     31 	.globl _TIM2_GenerateEvent
                                     32 	.globl _TIM2_OC1PolarityConfig
                                     33 	.globl _TIM2_OC2PolarityConfig
                                     34 	.globl _TIM2_OC3PolarityConfig
                                     35 	.globl _TIM2_CCxCmd
                                     36 	.globl _TIM2_SelectOCxM
                                     37 	.globl _TIM2_SetCounter
                                     38 	.globl _TIM2_SetAutoreload
                                     39 	.globl _TIM2_SetCompare1
                                     40 	.globl _TIM2_SetCompare2
                                     41 	.globl _TIM2_SetCompare3
                                     42 	.globl _TIM2_SetIC1Prescaler
                                     43 	.globl _TIM2_SetIC2Prescaler
                                     44 	.globl _TIM2_SetIC3Prescaler
                                     45 	.globl _TIM2_GetCapture1
                                     46 	.globl _TIM2_GetCapture2
                                     47 	.globl _TIM2_GetCapture3
                                     48 	.globl _TIM2_GetCounter
                                     49 	.globl _TIM2_GetPrescaler
                                     50 	.globl _TIM2_GetFlagStatus
                                     51 	.globl _TIM2_ClearFlag
                                     52 	.globl _TIM2_GetITStatus
                                     53 	.globl _TIM2_ClearITPendingBit
                                     54 ;--------------------------------------------------------
                                     55 ; ram data
                                     56 ;--------------------------------------------------------
                                     57 	.area DATA
                                     58 ;--------------------------------------------------------
                                     59 ; ram data
                                     60 ;--------------------------------------------------------
                                     61 	.area INITIALIZED
                                     62 ;--------------------------------------------------------
                                     63 ; absolute external ram data
                                     64 ;--------------------------------------------------------
                                     65 	.area DABS (ABS)
                                     66 
                                     67 ; default segment ordering for linker
                                     68 	.area HOME
                                     69 	.area GSINIT
                                     70 	.area GSFINAL
                                     71 	.area CONST
                                     72 	.area INITIALIZER
                                     73 	.area CODE
                                     74 
                                     75 ;--------------------------------------------------------
                                     76 ; global & static initialisations
                                     77 ;--------------------------------------------------------
                                     78 	.area HOME
                                     79 	.area GSINIT
                                     80 	.area GSFINAL
                                     81 	.area GSINIT
                                     82 ;--------------------------------------------------------
                                     83 ; Home
                                     84 ;--------------------------------------------------------
                                     85 	.area HOME
                                     86 	.area HOME
                                     87 ;--------------------------------------------------------
                                     88 ; code
                                     89 ;--------------------------------------------------------
                                     90 	.area CODE
                                     91 ;	./../../lib/src/stm8s_tim2.c: 52: void TIM2_DeInit(void)
                                     92 ;	-----------------------------------------
                                     93 ;	 function TIM2_DeInit
                                     94 ;	-----------------------------------------
      008074                         95 _TIM2_DeInit:
                                     96 ;	./../../lib/src/stm8s_tim2.c: 54: TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
      008074 35 00 53 00      [ 1]   97 	mov	0x5300+0, #0x00
                                     98 ;	./../../lib/src/stm8s_tim2.c: 55: TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
      008078 35 00 53 01      [ 1]   99 	mov	0x5301+0, #0x00
                                    100 ;	./../../lib/src/stm8s_tim2.c: 56: TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
      00807C 35 00 53 03      [ 1]  101 	mov	0x5303+0, #0x00
                                    102 ;	./../../lib/src/stm8s_tim2.c: 59: TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
      008080 35 00 53 08      [ 1]  103 	mov	0x5308+0, #0x00
                                    104 ;	./../../lib/src/stm8s_tim2.c: 60: TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
      008084 35 00 53 09      [ 1]  105 	mov	0x5309+0, #0x00
                                    106 ;	./../../lib/src/stm8s_tim2.c: 64: TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
      008088 35 00 53 08      [ 1]  107 	mov	0x5308+0, #0x00
                                    108 ;	./../../lib/src/stm8s_tim2.c: 65: TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
      00808C 35 00 53 09      [ 1]  109 	mov	0x5309+0, #0x00
                                    110 ;	./../../lib/src/stm8s_tim2.c: 66: TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
      008090 35 00 53 05      [ 1]  111 	mov	0x5305+0, #0x00
                                    112 ;	./../../lib/src/stm8s_tim2.c: 67: TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
      008094 35 00 53 06      [ 1]  113 	mov	0x5306+0, #0x00
                                    114 ;	./../../lib/src/stm8s_tim2.c: 68: TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
      008098 35 00 53 07      [ 1]  115 	mov	0x5307+0, #0x00
                                    116 ;	./../../lib/src/stm8s_tim2.c: 69: TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
      00809C 35 00 53 0A      [ 1]  117 	mov	0x530a+0, #0x00
                                    118 ;	./../../lib/src/stm8s_tim2.c: 70: TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
      0080A0 35 00 53 0B      [ 1]  119 	mov	0x530b+0, #0x00
                                    120 ;	./../../lib/src/stm8s_tim2.c: 71: TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
      0080A4 35 00 53 0C      [ 1]  121 	mov	0x530c+0, #0x00
                                    122 ;	./../../lib/src/stm8s_tim2.c: 72: TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
      0080A8 35 FF 53 0D      [ 1]  123 	mov	0x530d+0, #0xff
                                    124 ;	./../../lib/src/stm8s_tim2.c: 73: TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
      0080AC 35 FF 53 0E      [ 1]  125 	mov	0x530e+0, #0xff
                                    126 ;	./../../lib/src/stm8s_tim2.c: 74: TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
      0080B0 35 00 53 0F      [ 1]  127 	mov	0x530f+0, #0x00
                                    128 ;	./../../lib/src/stm8s_tim2.c: 75: TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
      0080B4 35 00 53 10      [ 1]  129 	mov	0x5310+0, #0x00
                                    130 ;	./../../lib/src/stm8s_tim2.c: 76: TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
      0080B8 35 00 53 11      [ 1]  131 	mov	0x5311+0, #0x00
                                    132 ;	./../../lib/src/stm8s_tim2.c: 77: TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
      0080BC 35 00 53 12      [ 1]  133 	mov	0x5312+0, #0x00
                                    134 ;	./../../lib/src/stm8s_tim2.c: 78: TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
      0080C0 35 00 53 13      [ 1]  135 	mov	0x5313+0, #0x00
                                    136 ;	./../../lib/src/stm8s_tim2.c: 79: TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
      0080C4 35 00 53 14      [ 1]  137 	mov	0x5314+0, #0x00
                                    138 ;	./../../lib/src/stm8s_tim2.c: 80: TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
      0080C8 35 00 53 02      [ 1]  139 	mov	0x5302+0, #0x00
                                    140 ;	./../../lib/src/stm8s_tim2.c: 81: }
      0080CC 81               [ 4]  141 	ret
                                    142 ;	./../../lib/src/stm8s_tim2.c: 89: void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
                                    143 ;	-----------------------------------------
                                    144 ;	 function TIM2_TimeBaseInit
                                    145 ;	-----------------------------------------
      0080CD                        146 _TIM2_TimeBaseInit:
                                    147 ;	./../../lib/src/stm8s_tim2.c: 93: TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
      0080CD C7 53 0C         [ 1]  148 	ld	0x530c, a
                                    149 ;	./../../lib/src/stm8s_tim2.c: 95: TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
      0080D0 9E               [ 1]  150 	ld	a, xh
      0080D1 C7 53 0D         [ 1]  151 	ld	0x530d, a
                                    152 ;	./../../lib/src/stm8s_tim2.c: 96: TIM2->ARRL = (uint8_t)(TIM2_Period);
      0080D4 9F               [ 1]  153 	ld	a, xl
      0080D5 C7 53 0E         [ 1]  154 	ld	0x530e, a
                                    155 ;	./../../lib/src/stm8s_tim2.c: 97: }
      0080D8 81               [ 4]  156 	ret
                                    157 ;	./../../lib/src/stm8s_tim2.c: 108: void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
                                    158 ;	-----------------------------------------
                                    159 ;	 function TIM2_OC1Init
                                    160 ;	-----------------------------------------
      0080D9                        161 _TIM2_OC1Init:
      0080D9 52 03            [ 2]  162 	sub	sp, #3
      0080DB 6B 03            [ 1]  163 	ld	(0x03, sp), a
                                    164 ;	./../../lib/src/stm8s_tim2.c: 119: TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
      0080DD C6 53 08         [ 1]  165 	ld	a, 0x5308
      0080E0 A4 FC            [ 1]  166 	and	a, #0xfc
      0080E2 C7 53 08         [ 1]  167 	ld	0x5308, a
                                    168 ;	./../../lib/src/stm8s_tim2.c: 121: TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) |
      0080E5 C6 53 08         [ 1]  169 	ld	a, 0x5308
      0080E8 6B 01            [ 1]  170 	ld	(0x01, sp), a
      0080EA 7B 06            [ 1]  171 	ld	a, (0x06, sp)
      0080EC A4 01            [ 1]  172 	and	a, #0x01
      0080EE 6B 02            [ 1]  173 	ld	(0x02, sp), a
                                    174 ;	./../../lib/src/stm8s_tim2.c: 122: (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
      0080F0 7B 09            [ 1]  175 	ld	a, (0x09, sp)
      0080F2 A4 02            [ 1]  176 	and	a, #0x02
      0080F4 1A 02            [ 1]  177 	or	a, (0x02, sp)
      0080F6 1A 01            [ 1]  178 	or	a, (0x01, sp)
      0080F8 C7 53 08         [ 1]  179 	ld	0x5308, a
                                    180 ;	./../../lib/src/stm8s_tim2.c: 125: TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
      0080FB C6 53 05         [ 1]  181 	ld	a, 0x5305
      0080FE A4 8F            [ 1]  182 	and	a, #0x8f
                                    183 ;	./../../lib/src/stm8s_tim2.c: 126: (uint8_t)TIM2_OCMode);
      008100 1A 03            [ 1]  184 	or	a, (0x03, sp)
      008102 C7 53 05         [ 1]  185 	ld	0x5305, a
                                    186 ;	./../../lib/src/stm8s_tim2.c: 129: TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
      008105 7B 07            [ 1]  187 	ld	a, (0x07, sp)
      008107 C7 53 0F         [ 1]  188 	ld	0x530f, a
                                    189 ;	./../../lib/src/stm8s_tim2.c: 130: TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
      00810A 7B 08            [ 1]  190 	ld	a, (0x08, sp)
      00810C C7 53 10         [ 1]  191 	ld	0x5310, a
                                    192 ;	./../../lib/src/stm8s_tim2.c: 131: }
      00810F 1E 04            [ 2]  193 	ldw	x, (4, sp)
      008111 5B 09            [ 2]  194 	addw	sp, #9
      008113 FC               [ 2]  195 	jp	(x)
                                    196 ;	./../../lib/src/stm8s_tim2.c: 142: void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
                                    197 ;	-----------------------------------------
                                    198 ;	 function TIM2_OC2Init
                                    199 ;	-----------------------------------------
      008114                        200 _TIM2_OC2Init:
      008114 52 03            [ 2]  201 	sub	sp, #3
      008116 6B 03            [ 1]  202 	ld	(0x03, sp), a
                                    203 ;	./../../lib/src/stm8s_tim2.c: 154: TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
      008118 C6 53 08         [ 1]  204 	ld	a, 0x5308
      00811B A4 CF            [ 1]  205 	and	a, #0xcf
      00811D C7 53 08         [ 1]  206 	ld	0x5308, a
                                    207 ;	./../../lib/src/stm8s_tim2.c: 156: TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
      008120 C6 53 08         [ 1]  208 	ld	a, 0x5308
      008123 6B 01            [ 1]  209 	ld	(0x01, sp), a
      008125 7B 06            [ 1]  210 	ld	a, (0x06, sp)
      008127 A4 10            [ 1]  211 	and	a, #0x10
      008129 6B 02            [ 1]  212 	ld	(0x02, sp), a
                                    213 ;	./../../lib/src/stm8s_tim2.c: 157: (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
      00812B 7B 09            [ 1]  214 	ld	a, (0x09, sp)
      00812D A4 20            [ 1]  215 	and	a, #0x20
      00812F 1A 02            [ 1]  216 	or	a, (0x02, sp)
      008131 1A 01            [ 1]  217 	or	a, (0x01, sp)
      008133 C7 53 08         [ 1]  218 	ld	0x5308, a
                                    219 ;	./../../lib/src/stm8s_tim2.c: 161: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) |
      008136 C6 53 06         [ 1]  220 	ld	a, 0x5306
      008139 A4 8F            [ 1]  221 	and	a, #0x8f
                                    222 ;	./../../lib/src/stm8s_tim2.c: 162: (uint8_t)TIM2_OCMode);
      00813B 1A 03            [ 1]  223 	or	a, (0x03, sp)
      00813D C7 53 06         [ 1]  224 	ld	0x5306, a
                                    225 ;	./../../lib/src/stm8s_tim2.c: 166: TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
      008140 7B 07            [ 1]  226 	ld	a, (0x07, sp)
      008142 C7 53 11         [ 1]  227 	ld	0x5311, a
                                    228 ;	./../../lib/src/stm8s_tim2.c: 167: TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
      008145 7B 08            [ 1]  229 	ld	a, (0x08, sp)
      008147 C7 53 12         [ 1]  230 	ld	0x5312, a
                                    231 ;	./../../lib/src/stm8s_tim2.c: 168: }
      00814A 1E 04            [ 2]  232 	ldw	x, (4, sp)
      00814C 5B 09            [ 2]  233 	addw	sp, #9
      00814E FC               [ 2]  234 	jp	(x)
                                    235 ;	./../../lib/src/stm8s_tim2.c: 179: void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
                                    236 ;	-----------------------------------------
                                    237 ;	 function TIM2_OC3Init
                                    238 ;	-----------------------------------------
      00814F                        239 _TIM2_OC3Init:
      00814F 52 03            [ 2]  240 	sub	sp, #3
      008151 6B 03            [ 1]  241 	ld	(0x03, sp), a
                                    242 ;	./../../lib/src/stm8s_tim2.c: 189: TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
      008153 C6 53 09         [ 1]  243 	ld	a, 0x5309
      008156 A4 FC            [ 1]  244 	and	a, #0xfc
      008158 C7 53 09         [ 1]  245 	ld	0x5309, a
                                    246 ;	./../../lib/src/stm8s_tim2.c: 191: TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |
      00815B C6 53 09         [ 1]  247 	ld	a, 0x5309
      00815E 6B 01            [ 1]  248 	ld	(0x01, sp), a
      008160 7B 06            [ 1]  249 	ld	a, (0x06, sp)
      008162 A4 01            [ 1]  250 	and	a, #0x01
      008164 6B 02            [ 1]  251 	ld	(0x02, sp), a
                                    252 ;	./../../lib/src/stm8s_tim2.c: 192: (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
      008166 7B 09            [ 1]  253 	ld	a, (0x09, sp)
      008168 A4 02            [ 1]  254 	and	a, #0x02
      00816A 1A 02            [ 1]  255 	or	a, (0x02, sp)
      00816C 1A 01            [ 1]  256 	or	a, (0x01, sp)
      00816E C7 53 09         [ 1]  257 	ld	0x5309, a
                                    258 ;	./../../lib/src/stm8s_tim2.c: 195: TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
      008171 C6 53 07         [ 1]  259 	ld	a, 0x5307
      008174 A4 8F            [ 1]  260 	and	a, #0x8f
                                    261 ;	./../../lib/src/stm8s_tim2.c: 196: (uint8_t)TIM2_OCMode);
      008176 1A 03            [ 1]  262 	or	a, (0x03, sp)
      008178 C7 53 07         [ 1]  263 	ld	0x5307, a
                                    264 ;	./../../lib/src/stm8s_tim2.c: 199: TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
      00817B 7B 07            [ 1]  265 	ld	a, (0x07, sp)
      00817D C7 53 13         [ 1]  266 	ld	0x5313, a
                                    267 ;	./../../lib/src/stm8s_tim2.c: 200: TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
      008180 7B 08            [ 1]  268 	ld	a, (0x08, sp)
      008182 C7 53 14         [ 1]  269 	ld	0x5314, a
                                    270 ;	./../../lib/src/stm8s_tim2.c: 201: }
      008185 1E 04            [ 2]  271 	ldw	x, (4, sp)
      008187 5B 09            [ 2]  272 	addw	sp, #9
      008189 FC               [ 2]  273 	jp	(x)
                                    274 ;	./../../lib/src/stm8s_tim2.c: 212: void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
                                    275 ;	-----------------------------------------
                                    276 ;	 function TIM2_ICInit
                                    277 ;	-----------------------------------------
      00818A                        278 _TIM2_ICInit:
                                    279 ;	./../../lib/src/stm8s_tim2.c: 225: if (TIM2_Channel == TIM2_CHANNEL_1)
      00818A 4D               [ 1]  280 	tnz	a
      00818B 26 16            [ 1]  281 	jrne	00105$
                                    282 ;	./../../lib/src/stm8s_tim2.c: 228: TI1_Config((uint8_t)TIM2_ICPolarity,
      00818D 7B 06            [ 1]  283 	ld	a, (0x06, sp)
      00818F 88               [ 1]  284 	push	a
      008190 7B 05            [ 1]  285 	ld	a, (0x05, sp)
      008192 88               [ 1]  286 	push	a
      008193 7B 05            [ 1]  287 	ld	a, (0x05, sp)
      008195 CD 85 21         [ 4]  288 	call	_TI1_Config
                                    289 ;	./../../lib/src/stm8s_tim2.c: 233: TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
      008198 7B 05            [ 1]  290 	ld	a, (0x05, sp)
      00819A 1E 01            [ 2]  291 	ldw	x, (1, sp)
      00819C 1F 05            [ 2]  292 	ldw	(5, sp), x
      00819E 5B 04            [ 2]  293 	addw	sp, #4
      0081A0 CC 84 4D         [ 2]  294 	jp	_TIM2_SetIC1Prescaler
      0081A3                        295 00105$:
                                    296 ;	./../../lib/src/stm8s_tim2.c: 235: else if (TIM2_Channel == TIM2_CHANNEL_2)
      0081A3 4A               [ 1]  297 	dec	a
      0081A4 26 16            [ 1]  298 	jrne	00102$
                                    299 ;	./../../lib/src/stm8s_tim2.c: 238: TI2_Config((uint8_t)TIM2_ICPolarity,
      0081A6 7B 06            [ 1]  300 	ld	a, (0x06, sp)
      0081A8 88               [ 1]  301 	push	a
      0081A9 7B 05            [ 1]  302 	ld	a, (0x05, sp)
      0081AB 88               [ 1]  303 	push	a
      0081AC 7B 05            [ 1]  304 	ld	a, (0x05, sp)
      0081AE CD 85 5C         [ 4]  305 	call	_TI2_Config
                                    306 ;	./../../lib/src/stm8s_tim2.c: 243: TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
      0081B1 7B 05            [ 1]  307 	ld	a, (0x05, sp)
      0081B3 1E 01            [ 2]  308 	ldw	x, (1, sp)
      0081B5 1F 05            [ 2]  309 	ldw	(5, sp), x
      0081B7 5B 04            [ 2]  310 	addw	sp, #4
      0081B9 CC 84 5C         [ 2]  311 	jp	_TIM2_SetIC2Prescaler
      0081BC                        312 00102$:
                                    313 ;	./../../lib/src/stm8s_tim2.c: 248: TI3_Config((uint8_t)TIM2_ICPolarity,
      0081BC 7B 06            [ 1]  314 	ld	a, (0x06, sp)
      0081BE 88               [ 1]  315 	push	a
      0081BF 7B 05            [ 1]  316 	ld	a, (0x05, sp)
      0081C1 88               [ 1]  317 	push	a
      0081C2 7B 05            [ 1]  318 	ld	a, (0x05, sp)
      0081C4 CD 85 97         [ 4]  319 	call	_TI3_Config
                                    320 ;	./../../lib/src/stm8s_tim2.c: 253: TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
      0081C7 7B 05            [ 1]  321 	ld	a, (0x05, sp)
      0081C9 1E 01            [ 2]  322 	ldw	x, (1, sp)
      0081CB 1F 05            [ 2]  323 	ldw	(5, sp), x
      0081CD 5B 04            [ 2]  324 	addw	sp, #4
                                    325 ;	./../../lib/src/stm8s_tim2.c: 255: }
      0081CF CC 84 6B         [ 2]  326 	jp	_TIM2_SetIC3Prescaler
                                    327 ;	./../../lib/src/stm8s_tim2.c: 266: void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
                                    328 ;	-----------------------------------------
                                    329 ;	 function TIM2_PWMIConfig
                                    330 ;	-----------------------------------------
      0081D2                        331 _TIM2_PWMIConfig:
      0081D2 52 02            [ 2]  332 	sub	sp, #2
      0081D4 97               [ 1]  333 	ld	xl, a
                                    334 ;	./../../lib/src/stm8s_tim2.c: 282: if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
      0081D5 7B 05            [ 1]  335 	ld	a, (0x05, sp)
      0081D7 A1 44            [ 1]  336 	cp	a, #0x44
      0081D9 27 05            [ 1]  337 	jreq	00102$
                                    338 ;	./../../lib/src/stm8s_tim2.c: 284: icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
      0081DB A6 44            [ 1]  339 	ld	a, #0x44
      0081DD 6B 01            [ 1]  340 	ld	(0x01, sp), a
                                    341 ;	./../../lib/src/stm8s_tim2.c: 288: icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
      0081DF C5                     342 	.byte 0xc5
      0081E0                        343 00102$:
      0081E0 0F 01            [ 1]  344 	clr	(0x01, sp)
      0081E2                        345 00103$:
                                    346 ;	./../../lib/src/stm8s_tim2.c: 292: if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
      0081E2 7B 06            [ 1]  347 	ld	a, (0x06, sp)
      0081E4 4A               [ 1]  348 	dec	a
      0081E5 26 06            [ 1]  349 	jrne	00105$
                                    350 ;	./../../lib/src/stm8s_tim2.c: 294: icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
      0081E7 A6 02            [ 1]  351 	ld	a, #0x02
      0081E9 6B 02            [ 1]  352 	ld	(0x02, sp), a
      0081EB 20 04            [ 2]  353 	jra	00106$
      0081ED                        354 00105$:
                                    355 ;	./../../lib/src/stm8s_tim2.c: 298: icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
      0081ED A6 01            [ 1]  356 	ld	a, #0x01
      0081EF 6B 02            [ 1]  357 	ld	(0x02, sp), a
      0081F1                        358 00106$:
                                    359 ;	./../../lib/src/stm8s_tim2.c: 301: if (TIM2_Channel == TIM2_CHANNEL_1)
      0081F1 9F               [ 1]  360 	ld	a, xl
      0081F2 4D               [ 1]  361 	tnz	a
      0081F3 26 26            [ 1]  362 	jrne	00108$
                                    363 ;	./../../lib/src/stm8s_tim2.c: 304: TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
      0081F5 7B 08            [ 1]  364 	ld	a, (0x08, sp)
      0081F7 88               [ 1]  365 	push	a
      0081F8 7B 07            [ 1]  366 	ld	a, (0x07, sp)
      0081FA 88               [ 1]  367 	push	a
      0081FB 7B 07            [ 1]  368 	ld	a, (0x07, sp)
      0081FD CD 85 21         [ 4]  369 	call	_TI1_Config
                                    370 ;	./../../lib/src/stm8s_tim2.c: 308: TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
      008200 7B 07            [ 1]  371 	ld	a, (0x07, sp)
      008202 CD 84 4D         [ 4]  372 	call	_TIM2_SetIC1Prescaler
                                    373 ;	./../../lib/src/stm8s_tim2.c: 311: TI2_Config(icpolarity, icselection, TIM2_ICFilter);
      008205 7B 08            [ 1]  374 	ld	a, (0x08, sp)
      008207 88               [ 1]  375 	push	a
      008208 7B 03            [ 1]  376 	ld	a, (0x03, sp)
      00820A 88               [ 1]  377 	push	a
      00820B 7B 03            [ 1]  378 	ld	a, (0x03, sp)
      00820D CD 85 5C         [ 4]  379 	call	_TI2_Config
                                    380 ;	./../../lib/src/stm8s_tim2.c: 314: TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
      008210 7B 07            [ 1]  381 	ld	a, (0x07, sp)
      008212 1E 03            [ 2]  382 	ldw	x, (3, sp)
      008214 1F 07            [ 2]  383 	ldw	(7, sp), x
      008216 5B 06            [ 2]  384 	addw	sp, #6
      008218 CC 84 5C         [ 2]  385 	jp	_TIM2_SetIC2Prescaler
      00821B                        386 00108$:
                                    387 ;	./../../lib/src/stm8s_tim2.c: 319: TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
      00821B 7B 08            [ 1]  388 	ld	a, (0x08, sp)
      00821D 88               [ 1]  389 	push	a
      00821E 7B 07            [ 1]  390 	ld	a, (0x07, sp)
      008220 88               [ 1]  391 	push	a
      008221 7B 07            [ 1]  392 	ld	a, (0x07, sp)
      008223 CD 85 5C         [ 4]  393 	call	_TI2_Config
                                    394 ;	./../../lib/src/stm8s_tim2.c: 323: TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
      008226 7B 07            [ 1]  395 	ld	a, (0x07, sp)
      008228 CD 84 5C         [ 4]  396 	call	_TIM2_SetIC2Prescaler
                                    397 ;	./../../lib/src/stm8s_tim2.c: 326: TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
      00822B 7B 08            [ 1]  398 	ld	a, (0x08, sp)
      00822D 88               [ 1]  399 	push	a
      00822E 7B 03            [ 1]  400 	ld	a, (0x03, sp)
      008230 88               [ 1]  401 	push	a
      008231 7B 03            [ 1]  402 	ld	a, (0x03, sp)
      008233 CD 85 21         [ 4]  403 	call	_TI1_Config
                                    404 ;	./../../lib/src/stm8s_tim2.c: 329: TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
      008236 7B 07            [ 1]  405 	ld	a, (0x07, sp)
      008238 1E 03            [ 2]  406 	ldw	x, (3, sp)
      00823A 1F 07            [ 2]  407 	ldw	(7, sp), x
      00823C 5B 06            [ 2]  408 	addw	sp, #6
                                    409 ;	./../../lib/src/stm8s_tim2.c: 331: }
      00823E CC 84 4D         [ 2]  410 	jp	_TIM2_SetIC1Prescaler
                                    411 ;	./../../lib/src/stm8s_tim2.c: 339: void TIM2_Cmd(FunctionalState NewState)
                                    412 ;	-----------------------------------------
                                    413 ;	 function TIM2_Cmd
                                    414 ;	-----------------------------------------
      008241                        415 _TIM2_Cmd:
      008241 88               [ 1]  416 	push	a
      008242 6B 01            [ 1]  417 	ld	(0x01, sp), a
                                    418 ;	./../../lib/src/stm8s_tim2.c: 347: TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
      008244 C6 53 00         [ 1]  419 	ld	a, 0x5300
                                    420 ;	./../../lib/src/stm8s_tim2.c: 345: if (NewState != DISABLE)
      008247 0D 01            [ 1]  421 	tnz	(0x01, sp)
      008249 27 07            [ 1]  422 	jreq	00102$
                                    423 ;	./../../lib/src/stm8s_tim2.c: 347: TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
      00824B AA 01            [ 1]  424 	or	a, #0x01
      00824D C7 53 00         [ 1]  425 	ld	0x5300, a
      008250 20 05            [ 2]  426 	jra	00104$
      008252                        427 00102$:
                                    428 ;	./../../lib/src/stm8s_tim2.c: 351: TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
      008252 A4 FE            [ 1]  429 	and	a, #0xfe
      008254 C7 53 00         [ 1]  430 	ld	0x5300, a
      008257                        431 00104$:
                                    432 ;	./../../lib/src/stm8s_tim2.c: 353: }
      008257 84               [ 1]  433 	pop	a
      008258 81               [ 4]  434 	ret
                                    435 ;	./../../lib/src/stm8s_tim2.c: 368: void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
                                    436 ;	-----------------------------------------
                                    437 ;	 function TIM2_ITConfig
                                    438 ;	-----------------------------------------
      008259                        439 _TIM2_ITConfig:
      008259 88               [ 1]  440 	push	a
                                    441 ;	./../../lib/src/stm8s_tim2.c: 377: TIM2->IER |= (uint8_t)TIM2_IT;
      00825A AE 53 01         [ 2]  442 	ldw	x, #0x5301
      00825D 88               [ 1]  443 	push	a
      00825E F6               [ 1]  444 	ld	a, (x)
      00825F 6B 02            [ 1]  445 	ld	(0x02, sp), a
      008261 84               [ 1]  446 	pop	a
                                    447 ;	./../../lib/src/stm8s_tim2.c: 374: if (NewState != DISABLE)
      008262 0D 04            [ 1]  448 	tnz	(0x04, sp)
      008264 27 07            [ 1]  449 	jreq	00102$
                                    450 ;	./../../lib/src/stm8s_tim2.c: 377: TIM2->IER |= (uint8_t)TIM2_IT;
      008266 1A 01            [ 1]  451 	or	a, (0x01, sp)
      008268 C7 53 01         [ 1]  452 	ld	0x5301, a
      00826B 20 06            [ 2]  453 	jra	00104$
      00826D                        454 00102$:
                                    455 ;	./../../lib/src/stm8s_tim2.c: 382: TIM2->IER &= (uint8_t)(~TIM2_IT);
      00826D 43               [ 1]  456 	cpl	a
      00826E 14 01            [ 1]  457 	and	a, (0x01, sp)
      008270 C7 53 01         [ 1]  458 	ld	0x5301, a
      008273                        459 00104$:
                                    460 ;	./../../lib/src/stm8s_tim2.c: 384: }
      008273 84               [ 1]  461 	pop	a
      008274 85               [ 2]  462 	popw	x
      008275 84               [ 1]  463 	pop	a
      008276 FC               [ 2]  464 	jp	(x)
                                    465 ;	./../../lib/src/stm8s_tim2.c: 392: void TIM2_UpdateDisableConfig(FunctionalState NewState)
                                    466 ;	-----------------------------------------
                                    467 ;	 function TIM2_UpdateDisableConfig
                                    468 ;	-----------------------------------------
      008277                        469 _TIM2_UpdateDisableConfig:
      008277 88               [ 1]  470 	push	a
      008278 6B 01            [ 1]  471 	ld	(0x01, sp), a
                                    472 ;	./../../lib/src/stm8s_tim2.c: 400: TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
      00827A C6 53 00         [ 1]  473 	ld	a, 0x5300
                                    474 ;	./../../lib/src/stm8s_tim2.c: 398: if (NewState != DISABLE)
      00827D 0D 01            [ 1]  475 	tnz	(0x01, sp)
      00827F 27 07            [ 1]  476 	jreq	00102$
                                    477 ;	./../../lib/src/stm8s_tim2.c: 400: TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
      008281 AA 02            [ 1]  478 	or	a, #0x02
      008283 C7 53 00         [ 1]  479 	ld	0x5300, a
      008286 20 05            [ 2]  480 	jra	00104$
      008288                        481 00102$:
                                    482 ;	./../../lib/src/stm8s_tim2.c: 404: TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
      008288 A4 FD            [ 1]  483 	and	a, #0xfd
      00828A C7 53 00         [ 1]  484 	ld	0x5300, a
      00828D                        485 00104$:
                                    486 ;	./../../lib/src/stm8s_tim2.c: 406: }
      00828D 84               [ 1]  487 	pop	a
      00828E 81               [ 4]  488 	ret
                                    489 ;	./../../lib/src/stm8s_tim2.c: 416: void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
                                    490 ;	-----------------------------------------
                                    491 ;	 function TIM2_UpdateRequestConfig
                                    492 ;	-----------------------------------------
      00828F                        493 _TIM2_UpdateRequestConfig:
      00828F 88               [ 1]  494 	push	a
      008290 6B 01            [ 1]  495 	ld	(0x01, sp), a
                                    496 ;	./../../lib/src/stm8s_tim2.c: 424: TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
      008292 C6 53 00         [ 1]  497 	ld	a, 0x5300
                                    498 ;	./../../lib/src/stm8s_tim2.c: 422: if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
      008295 0D 01            [ 1]  499 	tnz	(0x01, sp)
      008297 27 07            [ 1]  500 	jreq	00102$
                                    501 ;	./../../lib/src/stm8s_tim2.c: 424: TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
      008299 AA 04            [ 1]  502 	or	a, #0x04
      00829B C7 53 00         [ 1]  503 	ld	0x5300, a
      00829E 20 05            [ 2]  504 	jra	00104$
      0082A0                        505 00102$:
                                    506 ;	./../../lib/src/stm8s_tim2.c: 428: TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
      0082A0 A4 FB            [ 1]  507 	and	a, #0xfb
      0082A2 C7 53 00         [ 1]  508 	ld	0x5300, a
      0082A5                        509 00104$:
                                    510 ;	./../../lib/src/stm8s_tim2.c: 430: }
      0082A5 84               [ 1]  511 	pop	a
      0082A6 81               [ 4]  512 	ret
                                    513 ;	./../../lib/src/stm8s_tim2.c: 440: void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
                                    514 ;	-----------------------------------------
                                    515 ;	 function TIM2_SelectOnePulseMode
                                    516 ;	-----------------------------------------
      0082A7                        517 _TIM2_SelectOnePulseMode:
      0082A7 88               [ 1]  518 	push	a
      0082A8 6B 01            [ 1]  519 	ld	(0x01, sp), a
                                    520 ;	./../../lib/src/stm8s_tim2.c: 448: TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
      0082AA C6 53 00         [ 1]  521 	ld	a, 0x5300
                                    522 ;	./../../lib/src/stm8s_tim2.c: 446: if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
      0082AD 0D 01            [ 1]  523 	tnz	(0x01, sp)
      0082AF 27 07            [ 1]  524 	jreq	00102$
                                    525 ;	./../../lib/src/stm8s_tim2.c: 448: TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
      0082B1 AA 08            [ 1]  526 	or	a, #0x08
      0082B3 C7 53 00         [ 1]  527 	ld	0x5300, a
      0082B6 20 05            [ 2]  528 	jra	00104$
      0082B8                        529 00102$:
                                    530 ;	./../../lib/src/stm8s_tim2.c: 452: TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
      0082B8 A4 F7            [ 1]  531 	and	a, #0xf7
      0082BA C7 53 00         [ 1]  532 	ld	0x5300, a
      0082BD                        533 00104$:
                                    534 ;	./../../lib/src/stm8s_tim2.c: 454: }
      0082BD 84               [ 1]  535 	pop	a
      0082BE 81               [ 4]  536 	ret
                                    537 ;	./../../lib/src/stm8s_tim2.c: 484: void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
                                    538 ;	-----------------------------------------
                                    539 ;	 function TIM2_PrescalerConfig
                                    540 ;	-----------------------------------------
      0082BF                        541 _TIM2_PrescalerConfig:
                                    542 ;	./../../lib/src/stm8s_tim2.c: 492: TIM2->PSCR = (uint8_t)Prescaler;
      0082BF C7 53 0C         [ 1]  543 	ld	0x530c, a
                                    544 ;	./../../lib/src/stm8s_tim2.c: 495: TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
      0082C2 7B 03            [ 1]  545 	ld	a, (0x03, sp)
      0082C4 C7 53 04         [ 1]  546 	ld	0x5304, a
                                    547 ;	./../../lib/src/stm8s_tim2.c: 496: }
      0082C7 85               [ 2]  548 	popw	x
      0082C8 84               [ 1]  549 	pop	a
      0082C9 FC               [ 2]  550 	jp	(x)
                                    551 ;	./../../lib/src/stm8s_tim2.c: 507: void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
                                    552 ;	-----------------------------------------
                                    553 ;	 function TIM2_ForcedOC1Config
                                    554 ;	-----------------------------------------
      0082CA                        555 _TIM2_ForcedOC1Config:
      0082CA 88               [ 1]  556 	push	a
      0082CB 6B 01            [ 1]  557 	ld	(0x01, sp), a
                                    558 ;	./../../lib/src/stm8s_tim2.c: 513: TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
      0082CD C6 53 05         [ 1]  559 	ld	a, 0x5305
      0082D0 A4 8F            [ 1]  560 	and	a, #0x8f
                                    561 ;	./../../lib/src/stm8s_tim2.c: 514: | (uint8_t)TIM2_ForcedAction);
      0082D2 1A 01            [ 1]  562 	or	a, (0x01, sp)
      0082D4 C7 53 05         [ 1]  563 	ld	0x5305, a
                                    564 ;	./../../lib/src/stm8s_tim2.c: 515: }
      0082D7 84               [ 1]  565 	pop	a
      0082D8 81               [ 4]  566 	ret
                                    567 ;	./../../lib/src/stm8s_tim2.c: 526: void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
                                    568 ;	-----------------------------------------
                                    569 ;	 function TIM2_ForcedOC2Config
                                    570 ;	-----------------------------------------
      0082D9                        571 _TIM2_ForcedOC2Config:
      0082D9 88               [ 1]  572 	push	a
      0082DA 6B 01            [ 1]  573 	ld	(0x01, sp), a
                                    574 ;	./../../lib/src/stm8s_tim2.c: 532: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
      0082DC C6 53 06         [ 1]  575 	ld	a, 0x5306
      0082DF A4 8F            [ 1]  576 	and	a, #0x8f
                                    577 ;	./../../lib/src/stm8s_tim2.c: 533: | (uint8_t)TIM2_ForcedAction);
      0082E1 1A 01            [ 1]  578 	or	a, (0x01, sp)
      0082E3 C7 53 06         [ 1]  579 	ld	0x5306, a
                                    580 ;	./../../lib/src/stm8s_tim2.c: 534: }
      0082E6 84               [ 1]  581 	pop	a
      0082E7 81               [ 4]  582 	ret
                                    583 ;	./../../lib/src/stm8s_tim2.c: 545: void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
                                    584 ;	-----------------------------------------
                                    585 ;	 function TIM2_ForcedOC3Config
                                    586 ;	-----------------------------------------
      0082E8                        587 _TIM2_ForcedOC3Config:
      0082E8 88               [ 1]  588 	push	a
      0082E9 6B 01            [ 1]  589 	ld	(0x01, sp), a
                                    590 ;	./../../lib/src/stm8s_tim2.c: 551: TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
      0082EB C6 53 07         [ 1]  591 	ld	a, 0x5307
      0082EE A4 8F            [ 1]  592 	and	a, #0x8f
                                    593 ;	./../../lib/src/stm8s_tim2.c: 552: | (uint8_t)TIM2_ForcedAction);
      0082F0 1A 01            [ 1]  594 	or	a, (0x01, sp)
      0082F2 C7 53 07         [ 1]  595 	ld	0x5307, a
                                    596 ;	./../../lib/src/stm8s_tim2.c: 553: }
      0082F5 84               [ 1]  597 	pop	a
      0082F6 81               [ 4]  598 	ret
                                    599 ;	./../../lib/src/stm8s_tim2.c: 561: void TIM2_ARRPreloadConfig(FunctionalState NewState)
                                    600 ;	-----------------------------------------
                                    601 ;	 function TIM2_ARRPreloadConfig
                                    602 ;	-----------------------------------------
      0082F7                        603 _TIM2_ARRPreloadConfig:
      0082F7 88               [ 1]  604 	push	a
      0082F8 6B 01            [ 1]  605 	ld	(0x01, sp), a
                                    606 ;	./../../lib/src/stm8s_tim2.c: 569: TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
      0082FA C6 53 00         [ 1]  607 	ld	a, 0x5300
                                    608 ;	./../../lib/src/stm8s_tim2.c: 567: if (NewState != DISABLE)
      0082FD 0D 01            [ 1]  609 	tnz	(0x01, sp)
      0082FF 27 07            [ 1]  610 	jreq	00102$
                                    611 ;	./../../lib/src/stm8s_tim2.c: 569: TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
      008301 AA 80            [ 1]  612 	or	a, #0x80
      008303 C7 53 00         [ 1]  613 	ld	0x5300, a
      008306 20 05            [ 2]  614 	jra	00104$
      008308                        615 00102$:
                                    616 ;	./../../lib/src/stm8s_tim2.c: 573: TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
      008308 A4 7F            [ 1]  617 	and	a, #0x7f
      00830A C7 53 00         [ 1]  618 	ld	0x5300, a
      00830D                        619 00104$:
                                    620 ;	./../../lib/src/stm8s_tim2.c: 575: }
      00830D 84               [ 1]  621 	pop	a
      00830E 81               [ 4]  622 	ret
                                    623 ;	./../../lib/src/stm8s_tim2.c: 583: void TIM2_OC1PreloadConfig(FunctionalState NewState)
                                    624 ;	-----------------------------------------
                                    625 ;	 function TIM2_OC1PreloadConfig
                                    626 ;	-----------------------------------------
      00830F                        627 _TIM2_OC1PreloadConfig:
      00830F 88               [ 1]  628 	push	a
      008310 6B 01            [ 1]  629 	ld	(0x01, sp), a
                                    630 ;	./../../lib/src/stm8s_tim2.c: 591: TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
      008312 C6 53 05         [ 1]  631 	ld	a, 0x5305
                                    632 ;	./../../lib/src/stm8s_tim2.c: 589: if (NewState != DISABLE)
      008315 0D 01            [ 1]  633 	tnz	(0x01, sp)
      008317 27 07            [ 1]  634 	jreq	00102$
                                    635 ;	./../../lib/src/stm8s_tim2.c: 591: TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
      008319 AA 08            [ 1]  636 	or	a, #0x08
      00831B C7 53 05         [ 1]  637 	ld	0x5305, a
      00831E 20 05            [ 2]  638 	jra	00104$
      008320                        639 00102$:
                                    640 ;	./../../lib/src/stm8s_tim2.c: 595: TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
      008320 A4 F7            [ 1]  641 	and	a, #0xf7
      008322 C7 53 05         [ 1]  642 	ld	0x5305, a
      008325                        643 00104$:
                                    644 ;	./../../lib/src/stm8s_tim2.c: 597: }
      008325 84               [ 1]  645 	pop	a
      008326 81               [ 4]  646 	ret
                                    647 ;	./../../lib/src/stm8s_tim2.c: 605: void TIM2_OC2PreloadConfig(FunctionalState NewState)
                                    648 ;	-----------------------------------------
                                    649 ;	 function TIM2_OC2PreloadConfig
                                    650 ;	-----------------------------------------
      008327                        651 _TIM2_OC2PreloadConfig:
      008327 88               [ 1]  652 	push	a
      008328 6B 01            [ 1]  653 	ld	(0x01, sp), a
                                    654 ;	./../../lib/src/stm8s_tim2.c: 613: TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
      00832A C6 53 06         [ 1]  655 	ld	a, 0x5306
                                    656 ;	./../../lib/src/stm8s_tim2.c: 611: if (NewState != DISABLE)
      00832D 0D 01            [ 1]  657 	tnz	(0x01, sp)
      00832F 27 07            [ 1]  658 	jreq	00102$
                                    659 ;	./../../lib/src/stm8s_tim2.c: 613: TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
      008331 AA 08            [ 1]  660 	or	a, #0x08
      008333 C7 53 06         [ 1]  661 	ld	0x5306, a
      008336 20 05            [ 2]  662 	jra	00104$
      008338                        663 00102$:
                                    664 ;	./../../lib/src/stm8s_tim2.c: 617: TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
      008338 A4 F7            [ 1]  665 	and	a, #0xf7
      00833A C7 53 06         [ 1]  666 	ld	0x5306, a
      00833D                        667 00104$:
                                    668 ;	./../../lib/src/stm8s_tim2.c: 619: }
      00833D 84               [ 1]  669 	pop	a
      00833E 81               [ 4]  670 	ret
                                    671 ;	./../../lib/src/stm8s_tim2.c: 627: void TIM2_OC3PreloadConfig(FunctionalState NewState)
                                    672 ;	-----------------------------------------
                                    673 ;	 function TIM2_OC3PreloadConfig
                                    674 ;	-----------------------------------------
      00833F                        675 _TIM2_OC3PreloadConfig:
      00833F 88               [ 1]  676 	push	a
      008340 6B 01            [ 1]  677 	ld	(0x01, sp), a
                                    678 ;	./../../lib/src/stm8s_tim2.c: 635: TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
      008342 C6 53 07         [ 1]  679 	ld	a, 0x5307
                                    680 ;	./../../lib/src/stm8s_tim2.c: 633: if (NewState != DISABLE)
      008345 0D 01            [ 1]  681 	tnz	(0x01, sp)
      008347 27 07            [ 1]  682 	jreq	00102$
                                    683 ;	./../../lib/src/stm8s_tim2.c: 635: TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
      008349 AA 08            [ 1]  684 	or	a, #0x08
      00834B C7 53 07         [ 1]  685 	ld	0x5307, a
      00834E 20 05            [ 2]  686 	jra	00104$
      008350                        687 00102$:
                                    688 ;	./../../lib/src/stm8s_tim2.c: 639: TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
      008350 A4 F7            [ 1]  689 	and	a, #0xf7
      008352 C7 53 07         [ 1]  690 	ld	0x5307, a
      008355                        691 00104$:
                                    692 ;	./../../lib/src/stm8s_tim2.c: 641: }
      008355 84               [ 1]  693 	pop	a
      008356 81               [ 4]  694 	ret
                                    695 ;	./../../lib/src/stm8s_tim2.c: 653: void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
                                    696 ;	-----------------------------------------
                                    697 ;	 function TIM2_GenerateEvent
                                    698 ;	-----------------------------------------
      008357                        699 _TIM2_GenerateEvent:
                                    700 ;	./../../lib/src/stm8s_tim2.c: 659: TIM2->EGR = (uint8_t)TIM2_EventSource;
      008357 C7 53 04         [ 1]  701 	ld	0x5304, a
                                    702 ;	./../../lib/src/stm8s_tim2.c: 660: }
      00835A 81               [ 4]  703 	ret
                                    704 ;	./../../lib/src/stm8s_tim2.c: 670: void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
                                    705 ;	-----------------------------------------
                                    706 ;	 function TIM2_OC1PolarityConfig
                                    707 ;	-----------------------------------------
      00835B                        708 _TIM2_OC1PolarityConfig:
      00835B 88               [ 1]  709 	push	a
      00835C 6B 01            [ 1]  710 	ld	(0x01, sp), a
                                    711 ;	./../../lib/src/stm8s_tim2.c: 678: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
      00835E C6 53 08         [ 1]  712 	ld	a, 0x5308
                                    713 ;	./../../lib/src/stm8s_tim2.c: 676: if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
      008361 0D 01            [ 1]  714 	tnz	(0x01, sp)
      008363 27 07            [ 1]  715 	jreq	00102$
                                    716 ;	./../../lib/src/stm8s_tim2.c: 678: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
      008365 AA 02            [ 1]  717 	or	a, #0x02
      008367 C7 53 08         [ 1]  718 	ld	0x5308, a
      00836A 20 05            [ 2]  719 	jra	00104$
      00836C                        720 00102$:
                                    721 ;	./../../lib/src/stm8s_tim2.c: 682: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
      00836C A4 FD            [ 1]  722 	and	a, #0xfd
      00836E C7 53 08         [ 1]  723 	ld	0x5308, a
      008371                        724 00104$:
                                    725 ;	./../../lib/src/stm8s_tim2.c: 684: }
      008371 84               [ 1]  726 	pop	a
      008372 81               [ 4]  727 	ret
                                    728 ;	./../../lib/src/stm8s_tim2.c: 694: void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
                                    729 ;	-----------------------------------------
                                    730 ;	 function TIM2_OC2PolarityConfig
                                    731 ;	-----------------------------------------
      008373                        732 _TIM2_OC2PolarityConfig:
      008373 88               [ 1]  733 	push	a
      008374 6B 01            [ 1]  734 	ld	(0x01, sp), a
                                    735 ;	./../../lib/src/stm8s_tim2.c: 702: TIM2->CCER1 |= TIM2_CCER1_CC2P;
      008376 C6 53 08         [ 1]  736 	ld	a, 0x5308
                                    737 ;	./../../lib/src/stm8s_tim2.c: 700: if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
      008379 0D 01            [ 1]  738 	tnz	(0x01, sp)
      00837B 27 07            [ 1]  739 	jreq	00102$
                                    740 ;	./../../lib/src/stm8s_tim2.c: 702: TIM2->CCER1 |= TIM2_CCER1_CC2P;
      00837D AA 20            [ 1]  741 	or	a, #0x20
      00837F C7 53 08         [ 1]  742 	ld	0x5308, a
      008382 20 05            [ 2]  743 	jra	00104$
      008384                        744 00102$:
                                    745 ;	./../../lib/src/stm8s_tim2.c: 706: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
      008384 A4 DF            [ 1]  746 	and	a, #0xdf
      008386 C7 53 08         [ 1]  747 	ld	0x5308, a
      008389                        748 00104$:
                                    749 ;	./../../lib/src/stm8s_tim2.c: 708: }
      008389 84               [ 1]  750 	pop	a
      00838A 81               [ 4]  751 	ret
                                    752 ;	./../../lib/src/stm8s_tim2.c: 718: void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
                                    753 ;	-----------------------------------------
                                    754 ;	 function TIM2_OC3PolarityConfig
                                    755 ;	-----------------------------------------
      00838B                        756 _TIM2_OC3PolarityConfig:
      00838B 88               [ 1]  757 	push	a
      00838C 6B 01            [ 1]  758 	ld	(0x01, sp), a
                                    759 ;	./../../lib/src/stm8s_tim2.c: 726: TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
      00838E C6 53 09         [ 1]  760 	ld	a, 0x5309
                                    761 ;	./../../lib/src/stm8s_tim2.c: 724: if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
      008391 0D 01            [ 1]  762 	tnz	(0x01, sp)
      008393 27 07            [ 1]  763 	jreq	00102$
                                    764 ;	./../../lib/src/stm8s_tim2.c: 726: TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
      008395 AA 02            [ 1]  765 	or	a, #0x02
      008397 C7 53 09         [ 1]  766 	ld	0x5309, a
      00839A 20 05            [ 2]  767 	jra	00104$
      00839C                        768 00102$:
                                    769 ;	./../../lib/src/stm8s_tim2.c: 730: TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
      00839C A4 FD            [ 1]  770 	and	a, #0xfd
      00839E C7 53 09         [ 1]  771 	ld	0x5309, a
      0083A1                        772 00104$:
                                    773 ;	./../../lib/src/stm8s_tim2.c: 732: }
      0083A1 84               [ 1]  774 	pop	a
      0083A2 81               [ 4]  775 	ret
                                    776 ;	./../../lib/src/stm8s_tim2.c: 745: void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
                                    777 ;	-----------------------------------------
                                    778 ;	 function TIM2_CCxCmd
                                    779 ;	-----------------------------------------
      0083A3                        780 _TIM2_CCxCmd:
                                    781 ;	./../../lib/src/stm8s_tim2.c: 751: if (TIM2_Channel == TIM2_CHANNEL_1)
      0083A3 4D               [ 1]  782 	tnz	a
      0083A4 26 15            [ 1]  783 	jrne	00114$
                                    784 ;	./../../lib/src/stm8s_tim2.c: 756: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
      0083A6 C6 53 08         [ 1]  785 	ld	a, 0x5308
                                    786 ;	./../../lib/src/stm8s_tim2.c: 754: if (NewState != DISABLE)
      0083A9 0D 03            [ 1]  787 	tnz	(0x03, sp)
      0083AB 27 07            [ 1]  788 	jreq	00102$
                                    789 ;	./../../lib/src/stm8s_tim2.c: 756: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
      0083AD AA 01            [ 1]  790 	or	a, #0x01
      0083AF C7 53 08         [ 1]  791 	ld	0x5308, a
      0083B2 20 32            [ 2]  792 	jra	00116$
      0083B4                        793 00102$:
                                    794 ;	./../../lib/src/stm8s_tim2.c: 760: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
      0083B4 A4 FE            [ 1]  795 	and	a, #0xfe
      0083B6 C7 53 08         [ 1]  796 	ld	0x5308, a
      0083B9 20 2B            [ 2]  797 	jra	00116$
      0083BB                        798 00114$:
                                    799 ;	./../../lib/src/stm8s_tim2.c: 764: else if (TIM2_Channel == TIM2_CHANNEL_2)
      0083BB 4A               [ 1]  800 	dec	a
      0083BC 26 15            [ 1]  801 	jrne	00111$
                                    802 ;	./../../lib/src/stm8s_tim2.c: 756: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
      0083BE C6 53 08         [ 1]  803 	ld	a, 0x5308
                                    804 ;	./../../lib/src/stm8s_tim2.c: 767: if (NewState != DISABLE)
      0083C1 0D 03            [ 1]  805 	tnz	(0x03, sp)
      0083C3 27 07            [ 1]  806 	jreq	00105$
                                    807 ;	./../../lib/src/stm8s_tim2.c: 769: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
      0083C5 AA 10            [ 1]  808 	or	a, #0x10
      0083C7 C7 53 08         [ 1]  809 	ld	0x5308, a
      0083CA 20 1A            [ 2]  810 	jra	00116$
      0083CC                        811 00105$:
                                    812 ;	./../../lib/src/stm8s_tim2.c: 773: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
      0083CC A4 EF            [ 1]  813 	and	a, #0xef
      0083CE C7 53 08         [ 1]  814 	ld	0x5308, a
      0083D1 20 13            [ 2]  815 	jra	00116$
      0083D3                        816 00111$:
                                    817 ;	./../../lib/src/stm8s_tim2.c: 781: TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
      0083D3 C6 53 09         [ 1]  818 	ld	a, 0x5309
                                    819 ;	./../../lib/src/stm8s_tim2.c: 779: if (NewState != DISABLE)
      0083D6 0D 03            [ 1]  820 	tnz	(0x03, sp)
      0083D8 27 07            [ 1]  821 	jreq	00108$
                                    822 ;	./../../lib/src/stm8s_tim2.c: 781: TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
      0083DA AA 01            [ 1]  823 	or	a, #0x01
      0083DC C7 53 09         [ 1]  824 	ld	0x5309, a
      0083DF 20 05            [ 2]  825 	jra	00116$
      0083E1                        826 00108$:
                                    827 ;	./../../lib/src/stm8s_tim2.c: 785: TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
      0083E1 A4 FE            [ 1]  828 	and	a, #0xfe
      0083E3 C7 53 09         [ 1]  829 	ld	0x5309, a
      0083E6                        830 00116$:
                                    831 ;	./../../lib/src/stm8s_tim2.c: 788: }
      0083E6 85               [ 2]  832 	popw	x
      0083E7 84               [ 1]  833 	pop	a
      0083E8 FC               [ 2]  834 	jp	(x)
                                    835 ;	./../../lib/src/stm8s_tim2.c: 810: void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
                                    836 ;	-----------------------------------------
                                    837 ;	 function TIM2_SelectOCxM
                                    838 ;	-----------------------------------------
      0083E9                        839 _TIM2_SelectOCxM:
                                    840 ;	./../../lib/src/stm8s_tim2.c: 816: if (TIM2_Channel == TIM2_CHANNEL_1)
      0083E9 4D               [ 1]  841 	tnz	a
      0083EA 26 10            [ 1]  842 	jrne	00105$
                                    843 ;	./../../lib/src/stm8s_tim2.c: 819: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
      0083EC 72 11 53 08      [ 1]  844 	bres	0x5308, #0
                                    845 ;	./../../lib/src/stm8s_tim2.c: 822: TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
      0083F0 C6 53 05         [ 1]  846 	ld	a, 0x5305
      0083F3 A4 8F            [ 1]  847 	and	a, #0x8f
                                    848 ;	./../../lib/src/stm8s_tim2.c: 823: | (uint8_t)TIM2_OCMode);
      0083F5 1A 03            [ 1]  849 	or	a, (0x03, sp)
      0083F7 C7 53 05         [ 1]  850 	ld	0x5305, a
      0083FA 20 21            [ 2]  851 	jra	00107$
      0083FC                        852 00105$:
                                    853 ;	./../../lib/src/stm8s_tim2.c: 825: else if (TIM2_Channel == TIM2_CHANNEL_2)
      0083FC 4A               [ 1]  854 	dec	a
      0083FD 26 10            [ 1]  855 	jrne	00102$
                                    856 ;	./../../lib/src/stm8s_tim2.c: 828: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
      0083FF 72 19 53 08      [ 1]  857 	bres	0x5308, #4
                                    858 ;	./../../lib/src/stm8s_tim2.c: 831: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
      008403 C6 53 06         [ 1]  859 	ld	a, 0x5306
      008406 A4 8F            [ 1]  860 	and	a, #0x8f
                                    861 ;	./../../lib/src/stm8s_tim2.c: 832: | (uint8_t)TIM2_OCMode);
      008408 1A 03            [ 1]  862 	or	a, (0x03, sp)
      00840A C7 53 06         [ 1]  863 	ld	0x5306, a
      00840D 20 0E            [ 2]  864 	jra	00107$
      00840F                        865 00102$:
                                    866 ;	./../../lib/src/stm8s_tim2.c: 837: TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
      00840F 72 11 53 09      [ 1]  867 	bres	0x5309, #0
                                    868 ;	./../../lib/src/stm8s_tim2.c: 840: TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
      008413 C6 53 07         [ 1]  869 	ld	a, 0x5307
      008416 A4 8F            [ 1]  870 	and	a, #0x8f
                                    871 ;	./../../lib/src/stm8s_tim2.c: 841: | (uint8_t)TIM2_OCMode);
      008418 1A 03            [ 1]  872 	or	a, (0x03, sp)
      00841A C7 53 07         [ 1]  873 	ld	0x5307, a
      00841D                        874 00107$:
                                    875 ;	./../../lib/src/stm8s_tim2.c: 843: }
      00841D 85               [ 2]  876 	popw	x
      00841E 84               [ 1]  877 	pop	a
      00841F FC               [ 2]  878 	jp	(x)
                                    879 ;	./../../lib/src/stm8s_tim2.c: 851: void TIM2_SetCounter(uint16_t Counter)
                                    880 ;	-----------------------------------------
                                    881 ;	 function TIM2_SetCounter
                                    882 ;	-----------------------------------------
      008420                        883 _TIM2_SetCounter:
                                    884 ;	./../../lib/src/stm8s_tim2.c: 854: TIM2->CNTRH = (uint8_t)(Counter >> 8);
      008420 9E               [ 1]  885 	ld	a, xh
      008421 C7 53 0A         [ 1]  886 	ld	0x530a, a
                                    887 ;	./../../lib/src/stm8s_tim2.c: 855: TIM2->CNTRL = (uint8_t)(Counter);
      008424 9F               [ 1]  888 	ld	a, xl
      008425 C7 53 0B         [ 1]  889 	ld	0x530b, a
                                    890 ;	./../../lib/src/stm8s_tim2.c: 856: }
      008428 81               [ 4]  891 	ret
                                    892 ;	./../../lib/src/stm8s_tim2.c: 864: void TIM2_SetAutoreload(uint16_t Autoreload)
                                    893 ;	-----------------------------------------
                                    894 ;	 function TIM2_SetAutoreload
                                    895 ;	-----------------------------------------
      008429                        896 _TIM2_SetAutoreload:
                                    897 ;	./../../lib/src/stm8s_tim2.c: 867: TIM2->ARRH = (uint8_t)(Autoreload >> 8);
      008429 9E               [ 1]  898 	ld	a, xh
      00842A C7 53 0D         [ 1]  899 	ld	0x530d, a
                                    900 ;	./../../lib/src/stm8s_tim2.c: 868: TIM2->ARRL = (uint8_t)(Autoreload);
      00842D 9F               [ 1]  901 	ld	a, xl
      00842E C7 53 0E         [ 1]  902 	ld	0x530e, a
                                    903 ;	./../../lib/src/stm8s_tim2.c: 869: }
      008431 81               [ 4]  904 	ret
                                    905 ;	./../../lib/src/stm8s_tim2.c: 877: void TIM2_SetCompare1(uint16_t Compare1)
                                    906 ;	-----------------------------------------
                                    907 ;	 function TIM2_SetCompare1
                                    908 ;	-----------------------------------------
      008432                        909 _TIM2_SetCompare1:
                                    910 ;	./../../lib/src/stm8s_tim2.c: 880: TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
      008432 9E               [ 1]  911 	ld	a, xh
      008433 C7 53 0F         [ 1]  912 	ld	0x530f, a
                                    913 ;	./../../lib/src/stm8s_tim2.c: 881: TIM2->CCR1L = (uint8_t)(Compare1);
      008436 9F               [ 1]  914 	ld	a, xl
      008437 C7 53 10         [ 1]  915 	ld	0x5310, a
                                    916 ;	./../../lib/src/stm8s_tim2.c: 882: }
      00843A 81               [ 4]  917 	ret
                                    918 ;	./../../lib/src/stm8s_tim2.c: 890: void TIM2_SetCompare2(uint16_t Compare2)
                                    919 ;	-----------------------------------------
                                    920 ;	 function TIM2_SetCompare2
                                    921 ;	-----------------------------------------
      00843B                        922 _TIM2_SetCompare2:
                                    923 ;	./../../lib/src/stm8s_tim2.c: 893: TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
      00843B 9E               [ 1]  924 	ld	a, xh
      00843C C7 53 11         [ 1]  925 	ld	0x5311, a
                                    926 ;	./../../lib/src/stm8s_tim2.c: 894: TIM2->CCR2L = (uint8_t)(Compare2);
      00843F 9F               [ 1]  927 	ld	a, xl
      008440 C7 53 12         [ 1]  928 	ld	0x5312, a
                                    929 ;	./../../lib/src/stm8s_tim2.c: 895: }
      008443 81               [ 4]  930 	ret
                                    931 ;	./../../lib/src/stm8s_tim2.c: 903: void TIM2_SetCompare3(uint16_t Compare3)
                                    932 ;	-----------------------------------------
                                    933 ;	 function TIM2_SetCompare3
                                    934 ;	-----------------------------------------
      008444                        935 _TIM2_SetCompare3:
                                    936 ;	./../../lib/src/stm8s_tim2.c: 906: TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
      008444 9E               [ 1]  937 	ld	a, xh
      008445 C7 53 13         [ 1]  938 	ld	0x5313, a
                                    939 ;	./../../lib/src/stm8s_tim2.c: 907: TIM2->CCR3L = (uint8_t)(Compare3);
      008448 9F               [ 1]  940 	ld	a, xl
      008449 C7 53 14         [ 1]  941 	ld	0x5314, a
                                    942 ;	./../../lib/src/stm8s_tim2.c: 908: }
      00844C 81               [ 4]  943 	ret
                                    944 ;	./../../lib/src/stm8s_tim2.c: 920: void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
                                    945 ;	-----------------------------------------
                                    946 ;	 function TIM2_SetIC1Prescaler
                                    947 ;	-----------------------------------------
      00844D                        948 _TIM2_SetIC1Prescaler:
      00844D 88               [ 1]  949 	push	a
      00844E 6B 01            [ 1]  950 	ld	(0x01, sp), a
                                    951 ;	./../../lib/src/stm8s_tim2.c: 926: TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
      008450 C6 53 05         [ 1]  952 	ld	a, 0x5305
      008453 A4 F3            [ 1]  953 	and	a, #0xf3
                                    954 ;	./../../lib/src/stm8s_tim2.c: 927: | (uint8_t)TIM2_IC1Prescaler);
      008455 1A 01            [ 1]  955 	or	a, (0x01, sp)
      008457 C7 53 05         [ 1]  956 	ld	0x5305, a
                                    957 ;	./../../lib/src/stm8s_tim2.c: 928: }
      00845A 84               [ 1]  958 	pop	a
      00845B 81               [ 4]  959 	ret
                                    960 ;	./../../lib/src/stm8s_tim2.c: 940: void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
                                    961 ;	-----------------------------------------
                                    962 ;	 function TIM2_SetIC2Prescaler
                                    963 ;	-----------------------------------------
      00845C                        964 _TIM2_SetIC2Prescaler:
      00845C 88               [ 1]  965 	push	a
      00845D 6B 01            [ 1]  966 	ld	(0x01, sp), a
                                    967 ;	./../../lib/src/stm8s_tim2.c: 946: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
      00845F C6 53 06         [ 1]  968 	ld	a, 0x5306
      008462 A4 F3            [ 1]  969 	and	a, #0xf3
                                    970 ;	./../../lib/src/stm8s_tim2.c: 947: | (uint8_t)TIM2_IC2Prescaler);
      008464 1A 01            [ 1]  971 	or	a, (0x01, sp)
      008466 C7 53 06         [ 1]  972 	ld	0x5306, a
                                    973 ;	./../../lib/src/stm8s_tim2.c: 948: }
      008469 84               [ 1]  974 	pop	a
      00846A 81               [ 4]  975 	ret
                                    976 ;	./../../lib/src/stm8s_tim2.c: 960: void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
                                    977 ;	-----------------------------------------
                                    978 ;	 function TIM2_SetIC3Prescaler
                                    979 ;	-----------------------------------------
      00846B                        980 _TIM2_SetIC3Prescaler:
      00846B 88               [ 1]  981 	push	a
      00846C 6B 01            [ 1]  982 	ld	(0x01, sp), a
                                    983 ;	./../../lib/src/stm8s_tim2.c: 966: TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
      00846E C6 53 07         [ 1]  984 	ld	a, 0x5307
      008471 A4 F3            [ 1]  985 	and	a, #0xf3
                                    986 ;	./../../lib/src/stm8s_tim2.c: 967: | (uint8_t)TIM2_IC3Prescaler);
      008473 1A 01            [ 1]  987 	or	a, (0x01, sp)
      008475 C7 53 07         [ 1]  988 	ld	0x5307, a
                                    989 ;	./../../lib/src/stm8s_tim2.c: 968: }
      008478 84               [ 1]  990 	pop	a
      008479 81               [ 4]  991 	ret
                                    992 ;	./../../lib/src/stm8s_tim2.c: 975: uint16_t TIM2_GetCapture1(void)
                                    993 ;	-----------------------------------------
                                    994 ;	 function TIM2_GetCapture1
                                    995 ;	-----------------------------------------
      00847A                        996 _TIM2_GetCapture1:
      00847A 52 02            [ 2]  997 	sub	sp, #2
                                    998 ;	./../../lib/src/stm8s_tim2.c: 981: tmpccr1h = TIM2->CCR1H;
      00847C C6 53 0F         [ 1]  999 	ld	a, 0x530f
      00847F 95               [ 1] 1000 	ld	xh, a
                                   1001 ;	./../../lib/src/stm8s_tim2.c: 982: tmpccr1l = TIM2->CCR1L;
      008480 C6 53 10         [ 1] 1002 	ld	a, 0x5310
                                   1003 ;	./../../lib/src/stm8s_tim2.c: 984: tmpccr1 = (uint16_t)(tmpccr1l);
      008483 6B 02            [ 1] 1004 	ld	(0x02, sp), a
      008485 0F 01            [ 1] 1005 	clr	(0x01, sp)
                                   1006 ;	./../../lib/src/stm8s_tim2.c: 985: tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
      008487 7B 02            [ 1] 1007 	ld	a, (0x02, sp)
      008489 02               [ 1] 1008 	rlwa	x
      00848A 1A 01            [ 1] 1009 	or	a, (0x01, sp)
                                   1010 ;	./../../lib/src/stm8s_tim2.c: 987: return (uint16_t)tmpccr1;
      00848C 95               [ 1] 1011 	ld	xh, a
                                   1012 ;	./../../lib/src/stm8s_tim2.c: 988: }
      00848D 5B 02            [ 2] 1013 	addw	sp, #2
      00848F 81               [ 4] 1014 	ret
                                   1015 ;	./../../lib/src/stm8s_tim2.c: 995: uint16_t TIM2_GetCapture2(void)
                                   1016 ;	-----------------------------------------
                                   1017 ;	 function TIM2_GetCapture2
                                   1018 ;	-----------------------------------------
      008490                       1019 _TIM2_GetCapture2:
      008490 52 02            [ 2] 1020 	sub	sp, #2
                                   1021 ;	./../../lib/src/stm8s_tim2.c: 1001: tmpccr2h = TIM2->CCR2H;
      008492 C6 53 11         [ 1] 1022 	ld	a, 0x5311
      008495 95               [ 1] 1023 	ld	xh, a
                                   1024 ;	./../../lib/src/stm8s_tim2.c: 1002: tmpccr2l = TIM2->CCR2L;
      008496 C6 53 12         [ 1] 1025 	ld	a, 0x5312
                                   1026 ;	./../../lib/src/stm8s_tim2.c: 1004: tmpccr2 = (uint16_t)(tmpccr2l);
      008499 6B 02            [ 1] 1027 	ld	(0x02, sp), a
      00849B 0F 01            [ 1] 1028 	clr	(0x01, sp)
                                   1029 ;	./../../lib/src/stm8s_tim2.c: 1005: tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
      00849D 7B 02            [ 1] 1030 	ld	a, (0x02, sp)
      00849F 02               [ 1] 1031 	rlwa	x
      0084A0 1A 01            [ 1] 1032 	or	a, (0x01, sp)
                                   1033 ;	./../../lib/src/stm8s_tim2.c: 1007: return (uint16_t)tmpccr2;
      0084A2 95               [ 1] 1034 	ld	xh, a
                                   1035 ;	./../../lib/src/stm8s_tim2.c: 1008: }
      0084A3 5B 02            [ 2] 1036 	addw	sp, #2
      0084A5 81               [ 4] 1037 	ret
                                   1038 ;	./../../lib/src/stm8s_tim2.c: 1015: uint16_t TIM2_GetCapture3(void)
                                   1039 ;	-----------------------------------------
                                   1040 ;	 function TIM2_GetCapture3
                                   1041 ;	-----------------------------------------
      0084A6                       1042 _TIM2_GetCapture3:
      0084A6 52 02            [ 2] 1043 	sub	sp, #2
                                   1044 ;	./../../lib/src/stm8s_tim2.c: 1021: tmpccr3h = TIM2->CCR3H;
      0084A8 C6 53 13         [ 1] 1045 	ld	a, 0x5313
      0084AB 95               [ 1] 1046 	ld	xh, a
                                   1047 ;	./../../lib/src/stm8s_tim2.c: 1022: tmpccr3l = TIM2->CCR3L;
      0084AC C6 53 14         [ 1] 1048 	ld	a, 0x5314
                                   1049 ;	./../../lib/src/stm8s_tim2.c: 1024: tmpccr3 = (uint16_t)(tmpccr3l);
      0084AF 6B 02            [ 1] 1050 	ld	(0x02, sp), a
      0084B1 0F 01            [ 1] 1051 	clr	(0x01, sp)
                                   1052 ;	./../../lib/src/stm8s_tim2.c: 1025: tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
      0084B3 7B 02            [ 1] 1053 	ld	a, (0x02, sp)
      0084B5 02               [ 1] 1054 	rlwa	x
      0084B6 1A 01            [ 1] 1055 	or	a, (0x01, sp)
                                   1056 ;	./../../lib/src/stm8s_tim2.c: 1027: return (uint16_t)tmpccr3;
      0084B8 95               [ 1] 1057 	ld	xh, a
                                   1058 ;	./../../lib/src/stm8s_tim2.c: 1028: }
      0084B9 5B 02            [ 2] 1059 	addw	sp, #2
      0084BB 81               [ 4] 1060 	ret
                                   1061 ;	./../../lib/src/stm8s_tim2.c: 1035: uint16_t TIM2_GetCounter(void)
                                   1062 ;	-----------------------------------------
                                   1063 ;	 function TIM2_GetCounter
                                   1064 ;	-----------------------------------------
      0084BC                       1065 _TIM2_GetCounter:
      0084BC 52 04            [ 2] 1066 	sub	sp, #4
                                   1067 ;	./../../lib/src/stm8s_tim2.c: 1039: tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
      0084BE C6 53 0A         [ 1] 1068 	ld	a, 0x530a
      0084C1 95               [ 1] 1069 	ld	xh, a
      0084C2 0F 02            [ 1] 1070 	clr	(0x02, sp)
                                   1071 ;	./../../lib/src/stm8s_tim2.c: 1041: return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
      0084C4 C6 53 0B         [ 1] 1072 	ld	a, 0x530b
      0084C7 0F 03            [ 1] 1073 	clr	(0x03, sp)
      0084C9 1A 02            [ 1] 1074 	or	a, (0x02, sp)
      0084CB 02               [ 1] 1075 	rlwa	x
      0084CC 1A 03            [ 1] 1076 	or	a, (0x03, sp)
      0084CE 95               [ 1] 1077 	ld	xh, a
                                   1078 ;	./../../lib/src/stm8s_tim2.c: 1042: }
      0084CF 5B 04            [ 2] 1079 	addw	sp, #4
      0084D1 81               [ 4] 1080 	ret
                                   1081 ;	./../../lib/src/stm8s_tim2.c: 1049: TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
                                   1082 ;	-----------------------------------------
                                   1083 ;	 function TIM2_GetPrescaler
                                   1084 ;	-----------------------------------------
      0084D2                       1085 _TIM2_GetPrescaler:
                                   1086 ;	./../../lib/src/stm8s_tim2.c: 1052: return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
      0084D2 C6 53 0C         [ 1] 1087 	ld	a, 0x530c
                                   1088 ;	./../../lib/src/stm8s_tim2.c: 1053: }
      0084D5 81               [ 4] 1089 	ret
                                   1090 ;	./../../lib/src/stm8s_tim2.c: 1068: FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
                                   1091 ;	-----------------------------------------
                                   1092 ;	 function TIM2_GetFlagStatus
                                   1093 ;	-----------------------------------------
      0084D6                       1094 _TIM2_GetFlagStatus:
      0084D6 88               [ 1] 1095 	push	a
                                   1096 ;	./../../lib/src/stm8s_tim2.c: 1076: tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
      0084D7 C6 53 02         [ 1] 1097 	ld	a, 0x5302
      0084DA 6B 01            [ 1] 1098 	ld	(0x01, sp), a
      0084DC 9F               [ 1] 1099 	ld	a, xl
      0084DD 14 01            [ 1] 1100 	and	a, (0x01, sp)
      0084DF 6B 01            [ 1] 1101 	ld	(0x01, sp), a
                                   1102 ;	./../../lib/src/stm8s_tim2.c: 1077: tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
                                   1103 ;	./../../lib/src/stm8s_tim2.c: 1079: if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
      0084E1 C6 53 03         [ 1] 1104 	ld	a, 0x5303
      0084E4 89               [ 2] 1105 	pushw	x
      0084E5 14 01            [ 1] 1106 	and	a, (1, sp)
      0084E7 85               [ 2] 1107 	popw	x
      0084E8 1A 01            [ 1] 1108 	or	a, (0x01, sp)
      0084EA 27 03            [ 1] 1109 	jreq	00102$
                                   1110 ;	./../../lib/src/stm8s_tim2.c: 1081: bitstatus = SET;
      0084EC A6 01            [ 1] 1111 	ld	a, #0x01
                                   1112 ;	./../../lib/src/stm8s_tim2.c: 1085: bitstatus = RESET;
      0084EE 21                    1113 	.byte 0x21
      0084EF                       1114 00102$:
      0084EF 4F               [ 1] 1115 	clr	a
      0084F0                       1116 00103$:
                                   1117 ;	./../../lib/src/stm8s_tim2.c: 1087: return (FlagStatus)bitstatus;
                                   1118 ;	./../../lib/src/stm8s_tim2.c: 1088: }
      0084F0 5B 01            [ 2] 1119 	addw	sp, #1
      0084F2 81               [ 4] 1120 	ret
                                   1121 ;	./../../lib/src/stm8s_tim2.c: 1103: void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
                                   1122 ;	-----------------------------------------
                                   1123 ;	 function TIM2_ClearFlag
                                   1124 ;	-----------------------------------------
      0084F3                       1125 _TIM2_ClearFlag:
                                   1126 ;	./../../lib/src/stm8s_tim2.c: 1109: TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
      0084F3 9F               [ 1] 1127 	ld	a, xl
      0084F4 43               [ 1] 1128 	cpl	a
      0084F5 C7 53 02         [ 1] 1129 	ld	0x5302, a
                                   1130 ;	./../../lib/src/stm8s_tim2.c: 1111: TIM2->SR2 = (uint8_t)(~((uint8_t)(TIM2_FLAG >> 8))); // [Roshan, 2015-Nov-09]
      0084F8 9E               [ 1] 1131 	ld	a, xh
      0084F9 43               [ 1] 1132 	cpl	a
      0084FA C7 53 03         [ 1] 1133 	ld	0x5303, a
                                   1134 ;	./../../lib/src/stm8s_tim2.c: 1112: }
      0084FD 81               [ 4] 1135 	ret
                                   1136 ;	./../../lib/src/stm8s_tim2.c: 1124: ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
                                   1137 ;	-----------------------------------------
                                   1138 ;	 function TIM2_GetITStatus
                                   1139 ;	-----------------------------------------
      0084FE                       1140 _TIM2_GetITStatus:
      0084FE 52 02            [ 2] 1141 	sub	sp, #2
      008500 6B 02            [ 1] 1142 	ld	(0x02, sp), a
                                   1143 ;	./../../lib/src/stm8s_tim2.c: 1132: TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
      008502 C6 53 02         [ 1] 1144 	ld	a, 0x5302
      008505 14 02            [ 1] 1145 	and	a, (0x02, sp)
      008507 6B 01            [ 1] 1146 	ld	(0x01, sp), a
                                   1147 ;	./../../lib/src/stm8s_tim2.c: 1134: TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
      008509 C6 53 01         [ 1] 1148 	ld	a, 0x5301
      00850C 14 02            [ 1] 1149 	and	a, (0x02, sp)
                                   1150 ;	./../../lib/src/stm8s_tim2.c: 1136: if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
      00850E 0D 01            [ 1] 1151 	tnz	(0x01, sp)
      008510 27 06            [ 1] 1152 	jreq	00102$
      008512 4D               [ 1] 1153 	tnz	a
      008513 27 03            [ 1] 1154 	jreq	00102$
                                   1155 ;	./../../lib/src/stm8s_tim2.c: 1138: bitstatus = SET;
      008515 A6 01            [ 1] 1156 	ld	a, #0x01
                                   1157 ;	./../../lib/src/stm8s_tim2.c: 1142: bitstatus = RESET;
      008517 21                    1158 	.byte 0x21
      008518                       1159 00102$:
      008518 4F               [ 1] 1160 	clr	a
      008519                       1161 00103$:
                                   1162 ;	./../../lib/src/stm8s_tim2.c: 1144: return (ITStatus)(bitstatus);
                                   1163 ;	./../../lib/src/stm8s_tim2.c: 1145: }
      008519 5B 02            [ 2] 1164 	addw	sp, #2
      00851B 81               [ 4] 1165 	ret
                                   1166 ;	./../../lib/src/stm8s_tim2.c: 1157: void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
                                   1167 ;	-----------------------------------------
                                   1168 ;	 function TIM2_ClearITPendingBit
                                   1169 ;	-----------------------------------------
      00851C                       1170 _TIM2_ClearITPendingBit:
                                   1171 ;	./../../lib/src/stm8s_tim2.c: 1163: TIM2->SR1 = (uint8_t)(~TIM2_IT);
      00851C 43               [ 1] 1172 	cpl	a
      00851D C7 53 02         [ 1] 1173 	ld	0x5302, a
                                   1174 ;	./../../lib/src/stm8s_tim2.c: 1164: }
      008520 81               [ 4] 1175 	ret
                                   1176 ;	./../../lib/src/stm8s_tim2.c: 1182: static void TI1_Config(uint8_t TIM2_ICPolarity,
                                   1177 ;	-----------------------------------------
                                   1178 ;	 function TI1_Config
                                   1179 ;	-----------------------------------------
      008521                       1180 _TI1_Config:
      008521 52 02            [ 2] 1181 	sub	sp, #2
      008523 6B 02            [ 1] 1182 	ld	(0x02, sp), a
                                   1183 ;	./../../lib/src/stm8s_tim2.c: 1187: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
      008525 72 11 53 08      [ 1] 1184 	bres	0x5308, #0
                                   1185 ;	./../../lib/src/stm8s_tim2.c: 1190: TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
      008529 C6 53 05         [ 1] 1186 	ld	a, 0x5305
      00852C A4 0C            [ 1] 1187 	and	a, #0x0c
      00852E 6B 01            [ 1] 1188 	ld	(0x01, sp), a
                                   1189 ;	./../../lib/src/stm8s_tim2.c: 1191: | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
      008530 7B 06            [ 1] 1190 	ld	a, (0x06, sp)
      008532 4E               [ 1] 1191 	swap	a
      008533 A4 F0            [ 1] 1192 	and	a, #0xf0
      008535 1A 05            [ 1] 1193 	or	a, (0x05, sp)
      008537 1A 01            [ 1] 1194 	or	a, (0x01, sp)
      008539 C7 53 05         [ 1] 1195 	ld	0x5305, a
                                   1196 ;	./../../lib/src/stm8s_tim2.c: 1187: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
      00853C C6 53 08         [ 1] 1197 	ld	a, 0x5308
                                   1198 ;	./../../lib/src/stm8s_tim2.c: 1194: if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
      00853F 0D 02            [ 1] 1199 	tnz	(0x02, sp)
      008541 27 07            [ 1] 1200 	jreq	00102$
                                   1201 ;	./../../lib/src/stm8s_tim2.c: 1196: TIM2->CCER1 |= TIM2_CCER1_CC1P;
      008543 AA 02            [ 1] 1202 	or	a, #0x02
      008545 C7 53 08         [ 1] 1203 	ld	0x5308, a
      008548 20 05            [ 2] 1204 	jra	00103$
      00854A                       1205 00102$:
                                   1206 ;	./../../lib/src/stm8s_tim2.c: 1200: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
      00854A A4 FD            [ 1] 1207 	and	a, #0xfd
      00854C C7 53 08         [ 1] 1208 	ld	0x5308, a
      00854F                       1209 00103$:
                                   1210 ;	./../../lib/src/stm8s_tim2.c: 1203: TIM2->CCER1 |= TIM2_CCER1_CC1E;
      00854F C6 53 08         [ 1] 1211 	ld	a, 0x5308
      008552 AA 01            [ 1] 1212 	or	a, #0x01
      008554 C7 53 08         [ 1] 1213 	ld	0x5308, a
                                   1214 ;	./../../lib/src/stm8s_tim2.c: 1204: }
      008557 1E 03            [ 2] 1215 	ldw	x, (3, sp)
      008559 5B 06            [ 2] 1216 	addw	sp, #6
      00855B FC               [ 2] 1217 	jp	(x)
                                   1218 ;	./../../lib/src/stm8s_tim2.c: 1222: static void TI2_Config(uint8_t TIM2_ICPolarity,
                                   1219 ;	-----------------------------------------
                                   1220 ;	 function TI2_Config
                                   1221 ;	-----------------------------------------
      00855C                       1222 _TI2_Config:
      00855C 52 02            [ 2] 1223 	sub	sp, #2
      00855E 6B 02            [ 1] 1224 	ld	(0x02, sp), a
                                   1225 ;	./../../lib/src/stm8s_tim2.c: 1227: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
      008560 72 19 53 08      [ 1] 1226 	bres	0x5308, #4
                                   1227 ;	./../../lib/src/stm8s_tim2.c: 1230: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
      008564 C6 53 06         [ 1] 1228 	ld	a, 0x5306
      008567 A4 0C            [ 1] 1229 	and	a, #0x0c
      008569 6B 01            [ 1] 1230 	ld	(0x01, sp), a
                                   1231 ;	./../../lib/src/stm8s_tim2.c: 1231: | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
      00856B 7B 06            [ 1] 1232 	ld	a, (0x06, sp)
      00856D 4E               [ 1] 1233 	swap	a
      00856E A4 F0            [ 1] 1234 	and	a, #0xf0
      008570 1A 05            [ 1] 1235 	or	a, (0x05, sp)
      008572 1A 01            [ 1] 1236 	or	a, (0x01, sp)
      008574 C7 53 06         [ 1] 1237 	ld	0x5306, a
                                   1238 ;	./../../lib/src/stm8s_tim2.c: 1227: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
      008577 C6 53 08         [ 1] 1239 	ld	a, 0x5308
                                   1240 ;	./../../lib/src/stm8s_tim2.c: 1235: if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
      00857A 0D 02            [ 1] 1241 	tnz	(0x02, sp)
      00857C 27 07            [ 1] 1242 	jreq	00102$
                                   1243 ;	./../../lib/src/stm8s_tim2.c: 1237: TIM2->CCER1 |= TIM2_CCER1_CC2P;
      00857E AA 20            [ 1] 1244 	or	a, #0x20
      008580 C7 53 08         [ 1] 1245 	ld	0x5308, a
      008583 20 05            [ 2] 1246 	jra	00103$
      008585                       1247 00102$:
                                   1248 ;	./../../lib/src/stm8s_tim2.c: 1241: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
      008585 A4 DF            [ 1] 1249 	and	a, #0xdf
      008587 C7 53 08         [ 1] 1250 	ld	0x5308, a
      00858A                       1251 00103$:
                                   1252 ;	./../../lib/src/stm8s_tim2.c: 1245: TIM2->CCER1 |= TIM2_CCER1_CC2E;
      00858A C6 53 08         [ 1] 1253 	ld	a, 0x5308
      00858D AA 10            [ 1] 1254 	or	a, #0x10
      00858F C7 53 08         [ 1] 1255 	ld	0x5308, a
                                   1256 ;	./../../lib/src/stm8s_tim2.c: 1246: }
      008592 1E 03            [ 2] 1257 	ldw	x, (3, sp)
      008594 5B 06            [ 2] 1258 	addw	sp, #6
      008596 FC               [ 2] 1259 	jp	(x)
                                   1260 ;	./../../lib/src/stm8s_tim2.c: 1262: static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
                                   1261 ;	-----------------------------------------
                                   1262 ;	 function TI3_Config
                                   1263 ;	-----------------------------------------
      008597                       1264 _TI3_Config:
      008597 52 02            [ 2] 1265 	sub	sp, #2
      008599 6B 02            [ 1] 1266 	ld	(0x02, sp), a
                                   1267 ;	./../../lib/src/stm8s_tim2.c: 1266: TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
      00859B 72 11 53 09      [ 1] 1268 	bres	0x5309, #0
                                   1269 ;	./../../lib/src/stm8s_tim2.c: 1269: TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF)))
      00859F C6 53 07         [ 1] 1270 	ld	a, 0x5307
      0085A2 A4 0C            [ 1] 1271 	and	a, #0x0c
      0085A4 6B 01            [ 1] 1272 	ld	(0x01, sp), a
                                   1273 ;	./../../lib/src/stm8s_tim2.c: 1270: | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
      0085A6 7B 06            [ 1] 1274 	ld	a, (0x06, sp)
      0085A8 4E               [ 1] 1275 	swap	a
      0085A9 A4 F0            [ 1] 1276 	and	a, #0xf0
      0085AB 1A 05            [ 1] 1277 	or	a, (0x05, sp)
      0085AD 1A 01            [ 1] 1278 	or	a, (0x01, sp)
      0085AF C7 53 07         [ 1] 1279 	ld	0x5307, a
                                   1280 ;	./../../lib/src/stm8s_tim2.c: 1266: TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
      0085B2 C6 53 09         [ 1] 1281 	ld	a, 0x5309
                                   1282 ;	./../../lib/src/stm8s_tim2.c: 1274: if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
      0085B5 0D 02            [ 1] 1283 	tnz	(0x02, sp)
      0085B7 27 07            [ 1] 1284 	jreq	00102$
                                   1285 ;	./../../lib/src/stm8s_tim2.c: 1276: TIM2->CCER2 |= TIM2_CCER2_CC3P;
      0085B9 AA 02            [ 1] 1286 	or	a, #0x02
      0085BB C7 53 09         [ 1] 1287 	ld	0x5309, a
      0085BE 20 05            [ 2] 1288 	jra	00103$
      0085C0                       1289 00102$:
                                   1290 ;	./../../lib/src/stm8s_tim2.c: 1280: TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
      0085C0 A4 FD            [ 1] 1291 	and	a, #0xfd
      0085C2 C7 53 09         [ 1] 1292 	ld	0x5309, a
      0085C5                       1293 00103$:
                                   1294 ;	./../../lib/src/stm8s_tim2.c: 1283: TIM2->CCER2 |= TIM2_CCER2_CC3E;
      0085C5 C6 53 09         [ 1] 1295 	ld	a, 0x5309
      0085C8 AA 01            [ 1] 1296 	or	a, #0x01
      0085CA C7 53 09         [ 1] 1297 	ld	0x5309, a
                                   1298 ;	./../../lib/src/stm8s_tim2.c: 1284: }
      0085CD 1E 03            [ 2] 1299 	ldw	x, (3, sp)
      0085CF 5B 06            [ 2] 1300 	addw	sp, #6
      0085D1 FC               [ 2] 1301 	jp	(x)
                                   1302 	.area CODE
                                   1303 	.area CONST
                                   1304 	.area INITIALIZER
                                   1305 	.area CABS (ABS)
