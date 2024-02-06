;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_tim1
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_DeInit
	.globl _TIM1_TimeBaseInit
	.globl _TIM1_OC1Init
	.globl _TIM1_OC2Init
	.globl _TIM1_OC3Init
	.globl _TIM1_OC4Init
	.globl _TIM1_BDTRConfig
	.globl _TIM1_ICInit
	.globl _TIM1_PWMIConfig
	.globl _TIM1_Cmd
	.globl _TIM1_CtrlPWMOutputs
	.globl _TIM1_ITConfig
	.globl _TIM1_InternalClockConfig
	.globl _TIM1_ETRClockMode1Config
	.globl _TIM1_ETRClockMode2Config
	.globl _TIM1_ETRConfig
	.globl _TIM1_TIxExternalClockConfig
	.globl _TIM1_SelectInputTrigger
	.globl _TIM1_UpdateDisableConfig
	.globl _TIM1_UpdateRequestConfig
	.globl _TIM1_SelectHallSensor
	.globl _TIM1_SelectOnePulseMode
	.globl _TIM1_SelectOutputTrigger
	.globl _TIM1_SelectSlaveMode
	.globl _TIM1_SelectMasterSlaveMode
	.globl _TIM1_EncoderInterfaceConfig
	.globl _TIM1_PrescalerConfig
	.globl _TIM1_CounterModeConfig
	.globl _TIM1_ForcedOC1Config
	.globl _TIM1_ForcedOC2Config
	.globl _TIM1_ForcedOC3Config
	.globl _TIM1_ForcedOC4Config
	.globl _TIM1_ARRPreloadConfig
	.globl _TIM1_SelectCOM
	.globl _TIM1_CCPreloadControl
	.globl _TIM1_OC1PreloadConfig
	.globl _TIM1_OC2PreloadConfig
	.globl _TIM1_OC3PreloadConfig
	.globl _TIM1_OC4PreloadConfig
	.globl _TIM1_OC1FastConfig
	.globl _TIM1_OC2FastConfig
	.globl _TIM1_OC3FastConfig
	.globl _TIM1_OC4FastConfig
	.globl _TIM1_GenerateEvent
	.globl _TIM1_OC1PolarityConfig
	.globl _TIM1_OC1NPolarityConfig
	.globl _TIM1_OC2PolarityConfig
	.globl _TIM1_OC2NPolarityConfig
	.globl _TIM1_OC3PolarityConfig
	.globl _TIM1_OC3NPolarityConfig
	.globl _TIM1_OC4PolarityConfig
	.globl _TIM1_CCxCmd
	.globl _TIM1_CCxNCmd
	.globl _TIM1_SelectOCxM
	.globl _TIM1_SetCounter
	.globl _TIM1_SetAutoreload
	.globl _TIM1_SetCompare1
	.globl _TIM1_SetCompare2
	.globl _TIM1_SetCompare3
	.globl _TIM1_SetCompare4
	.globl _TIM1_SetIC1Prescaler
	.globl _TIM1_SetIC2Prescaler
	.globl _TIM1_SetIC3Prescaler
	.globl _TIM1_SetIC4Prescaler
	.globl _TIM1_GetCapture1
	.globl _TIM1_GetCapture2
	.globl _TIM1_GetCapture3
	.globl _TIM1_GetCapture4
	.globl _TIM1_GetCounter
	.globl _TIM1_GetPrescaler
	.globl _TIM1_GetFlagStatus
	.globl _TIM1_ClearFlag
	.globl _TIM1_GetITStatus
	.globl _TIM1_ClearITPendingBit
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
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
;	./../../lib/src/stm8s_tim1.c: 58: void TIM1_DeInit(void)
;	-----------------------------------------
;	 function TIM1_DeInit
;	-----------------------------------------
_TIM1_DeInit:
;	./../../lib/src/stm8s_tim1.c: 60: TIM1->CR1  = TIM1_CR1_RESET_VALUE;
	mov	0x5250+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 61: TIM1->CR2  = TIM1_CR2_RESET_VALUE;
	mov	0x5251+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 62: TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
	mov	0x5252+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 63: TIM1->ETR  = TIM1_ETR_RESET_VALUE;
	mov	0x5253+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 64: TIM1->IER  = TIM1_IER_RESET_VALUE;
	mov	0x5254+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 65: TIM1->SR2  = TIM1_SR2_RESET_VALUE;
	mov	0x5256+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 67: TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
	mov	0x525c+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 68: TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
	mov	0x525d+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 70: TIM1->CCMR1 = 0x01;
	mov	0x5258+0, #0x01
;	./../../lib/src/stm8s_tim1.c: 71: TIM1->CCMR2 = 0x01;
	mov	0x5259+0, #0x01
;	./../../lib/src/stm8s_tim1.c: 72: TIM1->CCMR3 = 0x01;
	mov	0x525a+0, #0x01
;	./../../lib/src/stm8s_tim1.c: 73: TIM1->CCMR4 = 0x01;
	mov	0x525b+0, #0x01
;	./../../lib/src/stm8s_tim1.c: 75: TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
	mov	0x525c+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 76: TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
	mov	0x525d+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 77: TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
	mov	0x5258+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 78: TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
	mov	0x5259+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 79: TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
	mov	0x525a+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 80: TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
	mov	0x525b+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 81: TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
	mov	0x525e+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 82: TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
	mov	0x525f+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 83: TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
	mov	0x5260+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 84: TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
	mov	0x5261+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 85: TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
	mov	0x5262+0, #0xff
;	./../../lib/src/stm8s_tim1.c: 86: TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
	mov	0x5263+0, #0xff
;	./../../lib/src/stm8s_tim1.c: 87: TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
	mov	0x5265+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 88: TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
	mov	0x5266+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 89: TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
	mov	0x5267+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 90: TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
	mov	0x5268+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 91: TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
	mov	0x5269+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 92: TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
	mov	0x526a+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 93: TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
	mov	0x526b+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 94: TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
	mov	0x526c+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 95: TIM1->OISR  = TIM1_OISR_RESET_VALUE;
	mov	0x526f+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 96: TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
	mov	0x5257+0, #0x01
;	./../../lib/src/stm8s_tim1.c: 97: TIM1->DTR   = TIM1_DTR_RESET_VALUE;
	mov	0x526e+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 98: TIM1->BKR   = TIM1_BKR_RESET_VALUE;
	mov	0x526d+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 99: TIM1->RCR   = TIM1_RCR_RESET_VALUE;
	mov	0x5264+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 100: TIM1->SR1   = TIM1_SR1_RESET_VALUE;
	mov	0x5255+0, #0x00
;	./../../lib/src/stm8s_tim1.c: 101: }
	ret
;	./../../lib/src/stm8s_tim1.c: 111: void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
;	-----------------------------------------
;	 function TIM1_TimeBaseInit
;	-----------------------------------------
_TIM1_TimeBaseInit:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 120: TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
	ld	a, (0x04, sp)
	ld	0x5262, a
;	./../../lib/src/stm8s_tim1.c: 121: TIM1->ARRL = (uint8_t)(TIM1_Period);
	ld	a, (0x05, sp)
	ld	0x5263, a
;	./../../lib/src/stm8s_tim1.c: 124: TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
	ld	a, xh
	ld	0x5260, a
;	./../../lib/src/stm8s_tim1.c: 125: TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
	ld	a, xl
	ld	0x5261, a
;	./../../lib/src/stm8s_tim1.c: 128: TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
	ld	a, 0x5250
	and	a, #0x8f
;	./../../lib/src/stm8s_tim1.c: 129: | (uint8_t)(TIM1_CounterMode));
	or	a, (0x01, sp)
	ld	0x5250, a
;	./../../lib/src/stm8s_tim1.c: 132: TIM1->RCR = TIM1_RepetitionCounter;
	ldw	x, #0x5264
	ld	a, (0x06, sp)
	ld	(x), a
;	./../../lib/src/stm8s_tim1.c: 133: }
	ldw	x, (2, sp)
	addw	sp, #6
	jp	(x)
;	./../../lib/src/stm8s_tim1.c: 154: void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
;	-----------------------------------------
;	 function TIM1_OC1Init
;	-----------------------------------------
_TIM1_OC1Init:
	sub	sp, #4
	ld	(0x04, sp), a
;	./../../lib/src/stm8s_tim1.c: 174: TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
	ld	a, 0x525c
	and	a, #0xf0
	ld	0x525c, a
;	./../../lib/src/stm8s_tim1.c: 178: TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
	ld	a, 0x525c
	ld	(0x01, sp), a
	ld	a, (0x07, sp)
	and	a, #0x01
	ld	(0x03, sp), a
;	./../../lib/src/stm8s_tim1.c: 179: | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
	ld	a, (0x08, sp)
	and	a, #0x04
	or	a, (0x03, sp)
	ld	(0x02, sp), a
;	./../../lib/src/stm8s_tim1.c: 180: | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
	ld	a, (0x0b, sp)
	and	a, #0x02
	ld	(0x03, sp), a
;	./../../lib/src/stm8s_tim1.c: 181: | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
	ld	a, (0x0c, sp)
	and	a, #0x08
	or	a, (0x03, sp)
	or	a, (0x02, sp)
	or	a, (0x01, sp)
	ld	0x525c, a
;	./../../lib/src/stm8s_tim1.c: 184: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
	ld	a, 0x5258
	and	a, #0x8f
;	./../../lib/src/stm8s_tim1.c: 185: (uint8_t)TIM1_OCMode);
	or	a, (0x04, sp)
	ld	0x5258, a
;	./../../lib/src/stm8s_tim1.c: 188: TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
	ld	a, 0x526f
	and	a, #0xfc
	ld	0x526f, a
;	./../../lib/src/stm8s_tim1.c: 190: TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
	ld	a, 0x526f
	ld	(0x02, sp), a
	ld	a, (0x0d, sp)
	and	a, #0x01
	ld	(0x03, sp), a
;	./../../lib/src/stm8s_tim1.c: 191: (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
	ld	a, (0x0e, sp)
	and	a, #0x02
	or	a, (0x03, sp)
	or	a, (0x02, sp)
	ld	0x526f, a
;	./../../lib/src/stm8s_tim1.c: 194: TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
	ld	a, (0x09, sp)
	ld	0x5265, a
;	./../../lib/src/stm8s_tim1.c: 195: TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
	ld	a, (0x0a, sp)
	ld	0x5266, a
;	./../../lib/src/stm8s_tim1.c: 196: }
	ldw	x, (5, sp)
	addw	sp, #14
	jp	(x)
;	./../../lib/src/stm8s_tim1.c: 217: void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
;	-----------------------------------------
;	 function TIM1_OC2Init
;	-----------------------------------------
_TIM1_OC2Init:
	sub	sp, #4
	ld	(0x04, sp), a
;	./../../lib/src/stm8s_tim1.c: 237: TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
	ld	a, 0x525c
	and	a, #0x0f
	ld	0x525c, a
;	./../../lib/src/stm8s_tim1.c: 242: TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
	ld	a, 0x525c
	ld	(0x01, sp), a
	ld	a, (0x07, sp)
	and	a, #0x10
	ld	(0x03, sp), a
;	./../../lib/src/stm8s_tim1.c: 243: (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
	ld	a, (0x08, sp)
	and	a, #0x40
	or	a, (0x03, sp)
	ld	(0x02, sp), a
;	./../../lib/src/stm8s_tim1.c: 244: (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
	ld	a, (0x0b, sp)
	and	a, #0x20
	ld	(0x03, sp), a
;	./../../lib/src/stm8s_tim1.c: 245: (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
	ld	a, (0x0c, sp)
	and	a, #0x80
	or	a, (0x03, sp)
	or	a, (0x02, sp)
	or	a, (0x01, sp)
	ld	0x525c, a
;	./../../lib/src/stm8s_tim1.c: 248: TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
	ld	a, 0x5259
	and	a, #0x8f
;	./../../lib/src/stm8s_tim1.c: 249: (uint8_t)TIM1_OCMode);
	or	a, (0x04, sp)
	ld	0x5259, a
;	./../../lib/src/stm8s_tim1.c: 252: TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
	ld	a, 0x526f
	and	a, #0xf3
	ld	0x526f, a
;	./../../lib/src/stm8s_tim1.c: 254: TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
	ld	a, 0x526f
	ld	(0x02, sp), a
	ld	a, (0x0d, sp)
	and	a, #0x04
	ld	(0x03, sp), a
;	./../../lib/src/stm8s_tim1.c: 255: (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
	ld	a, (0x0e, sp)
	and	a, #0x08
	or	a, (0x03, sp)
	or	a, (0x02, sp)
	ld	0x526f, a
;	./../../lib/src/stm8s_tim1.c: 258: TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
	ld	a, (0x09, sp)
	ld	0x5267, a
;	./../../lib/src/stm8s_tim1.c: 259: TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
	ld	a, (0x0a, sp)
	ld	0x5268, a
;	./../../lib/src/stm8s_tim1.c: 260: }
	ldw	x, (5, sp)
	addw	sp, #14
	jp	(x)
;	./../../lib/src/stm8s_tim1.c: 281: void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
;	-----------------------------------------
;	 function TIM1_OC3Init
;	-----------------------------------------
_TIM1_OC3Init:
	sub	sp, #4
	ld	(0x04, sp), a
;	./../../lib/src/stm8s_tim1.c: 301: TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
	ld	a, 0x525d
	and	a, #0xf0
	ld	0x525d, a
;	./../../lib/src/stm8s_tim1.c: 305: TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
	ld	a, 0x525d
	ld	(0x01, sp), a
	ld	a, (0x07, sp)
	and	a, #0x01
	ld	(0x03, sp), a
;	./../../lib/src/stm8s_tim1.c: 306: (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
	ld	a, (0x08, sp)
	and	a, #0x04
	or	a, (0x03, sp)
	ld	(0x02, sp), a
;	./../../lib/src/stm8s_tim1.c: 307: (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
	ld	a, (0x0b, sp)
	and	a, #0x02
	ld	(0x03, sp), a
;	./../../lib/src/stm8s_tim1.c: 308: (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
	ld	a, (0x0c, sp)
	and	a, #0x08
	or	a, (0x03, sp)
	or	a, (0x02, sp)
	or	a, (0x01, sp)
	ld	0x525d, a
;	./../../lib/src/stm8s_tim1.c: 311: TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
	ld	a, 0x525a
	and	a, #0x8f
;	./../../lib/src/stm8s_tim1.c: 312: (uint8_t)TIM1_OCMode);
	or	a, (0x04, sp)
	ld	0x525a, a
;	./../../lib/src/stm8s_tim1.c: 315: TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
	ld	a, 0x526f
	and	a, #0xcf
	ld	0x526f, a
;	./../../lib/src/stm8s_tim1.c: 317: TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
	ld	a, 0x526f
	ld	(0x02, sp), a
	ld	a, (0x0d, sp)
	and	a, #0x10
	ld	(0x03, sp), a
;	./../../lib/src/stm8s_tim1.c: 318: (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
	ld	a, (0x0e, sp)
	and	a, #0x20
	or	a, (0x03, sp)
	or	a, (0x02, sp)
	ld	0x526f, a
;	./../../lib/src/stm8s_tim1.c: 321: TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
	ld	a, (0x09, sp)
	ld	0x5269, a
;	./../../lib/src/stm8s_tim1.c: 322: TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
	ld	a, (0x0a, sp)
	ld	0x526a, a
;	./../../lib/src/stm8s_tim1.c: 323: }
	ldw	x, (5, sp)
	addw	sp, #14
	jp	(x)
;	./../../lib/src/stm8s_tim1.c: 338: void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
;	-----------------------------------------
;	 function TIM1_OC4Init
;	-----------------------------------------
_TIM1_OC4Init:
	sub	sp, #3
	ld	(0x03, sp), a
;	./../../lib/src/stm8s_tim1.c: 351: TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
	ld	a, 0x525d
	and	a, #0xcf
	ld	0x525d, a
;	./../../lib/src/stm8s_tim1.c: 353: TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
	ld	a, 0x525d
	ld	(0x01, sp), a
	ld	a, (0x06, sp)
	and	a, #0x10
	ld	(0x02, sp), a
;	./../../lib/src/stm8s_tim1.c: 354: (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
	ld	a, (0x09, sp)
	and	a, #0x20
	or	a, (0x02, sp)
	or	a, (0x01, sp)
	ld	0x525d, a
;	./../../lib/src/stm8s_tim1.c: 357: TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
	ld	a, 0x525b
	and	a, #0x8f
	or	a, (0x03, sp)
	ld	0x525b, a
;	./../../lib/src/stm8s_tim1.c: 363: TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
	ld	a, 0x526f
;	./../../lib/src/stm8s_tim1.c: 361: if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
	tnz	(0x0a, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 363: TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
	or	a, #0xdf
	ld	0x526f, a
	jra	00103$
00102$:
;	./../../lib/src/stm8s_tim1.c: 367: TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
	and	a, #0xbf
	ld	0x526f, a
00103$:
;	./../../lib/src/stm8s_tim1.c: 371: TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
	ld	a, (0x07, sp)
	ld	0x526b, a
;	./../../lib/src/stm8s_tim1.c: 372: TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
	ld	a, (0x08, sp)
	ld	0x526c, a
;	./../../lib/src/stm8s_tim1.c: 373: }
	ldw	x, (4, sp)
	addw	sp, #10
	jp	(x)
;	./../../lib/src/stm8s_tim1.c: 388: void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
;	-----------------------------------------
;	 function TIM1_BDTRConfig
;	-----------------------------------------
_TIM1_BDTRConfig:
	push	a
;	./../../lib/src/stm8s_tim1.c: 402: TIM1->DTR = (uint8_t)(TIM1_DeadTime);
	ldw	x, #0x526e
	push	a
	ld	a, (0x06, sp)
	ld	(x), a
	pop	a
;	./../../lib/src/stm8s_tim1.c: 406: TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
	or	a, (0x04, sp)
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 407: (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
	ld	a, (0x06, sp)
	or	a, (0x07, sp)
;	./../../lib/src/stm8s_tim1.c: 408: (uint8_t)TIM1_AutomaticOutput));
	or	a, (0x08, sp)
	or	a, (0x01, sp)
	ld	0x526d, a
;	./../../lib/src/stm8s_tim1.c: 409: }
	ldw	x, (2, sp)
	addw	sp, #8
	jp	(x)
;	./../../lib/src/stm8s_tim1.c: 423: void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
;	-----------------------------------------
;	 function TIM1_ICInit
;	-----------------------------------------
_TIM1_ICInit:
;	./../../lib/src/stm8s_tim1.c: 439: TI1_Config((uint8_t)TIM1_ICPolarity,
	exg	a, xl
	ld	a, (0x03, sp)
	exg	a, xl
;	./../../lib/src/stm8s_tim1.c: 436: if (TIM1_Channel == TIM1_CHANNEL_1)
	tnz	a
	jrne	00108$
;	./../../lib/src/stm8s_tim1.c: 439: TI1_Config((uint8_t)TIM1_ICPolarity,
	ld	a, (0x06, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, xl
	call	_TI1_Config
;	./../../lib/src/stm8s_tim1.c: 443: TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
	ld	a, (0x05, sp)
	ldw	x, (1, sp)
	ldw	(5, sp), x
	addw	sp, #4
	jp	_TIM1_SetIC1Prescaler
00108$:
;	./../../lib/src/stm8s_tim1.c: 445: else if (TIM1_Channel == TIM1_CHANNEL_2)
	cp	a, #0x01
	jrne	00105$
;	./../../lib/src/stm8s_tim1.c: 448: TI2_Config((uint8_t)TIM1_ICPolarity,
	ld	a, (0x06, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, xl
	call	_TI2_Config
;	./../../lib/src/stm8s_tim1.c: 452: TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
	ld	a, (0x05, sp)
	ldw	x, (1, sp)
	ldw	(5, sp), x
	addw	sp, #4
	jp	_TIM1_SetIC2Prescaler
00105$:
;	./../../lib/src/stm8s_tim1.c: 454: else if (TIM1_Channel == TIM1_CHANNEL_3)
	cp	a, #0x02
	jrne	00102$
;	./../../lib/src/stm8s_tim1.c: 457: TI3_Config((uint8_t)TIM1_ICPolarity,
	ld	a, (0x06, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, xl
	call	_TI3_Config
;	./../../lib/src/stm8s_tim1.c: 461: TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
	ld	a, (0x05, sp)
	ldw	x, (1, sp)
	ldw	(5, sp), x
	addw	sp, #4
	jp	_TIM1_SetIC3Prescaler
00102$:
;	./../../lib/src/stm8s_tim1.c: 466: TI4_Config((uint8_t)TIM1_ICPolarity,
	ld	a, (0x06, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, xl
	call	_TI4_Config
;	./../../lib/src/stm8s_tim1.c: 470: TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
	ld	a, (0x05, sp)
	ldw	x, (1, sp)
	ldw	(5, sp), x
	addw	sp, #4
;	./../../lib/src/stm8s_tim1.c: 472: }
	jp	_TIM1_SetIC4Prescaler
;	./../../lib/src/stm8s_tim1.c: 488: void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
;	-----------------------------------------
;	 function TIM1_PWMIConfig
;	-----------------------------------------
_TIM1_PWMIConfig:
	sub	sp, #2
	ld	xl, a
;	./../../lib/src/stm8s_tim1.c: 504: if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
	tnz	(0x05, sp)
	jrne	00102$
;	./../../lib/src/stm8s_tim1.c: 506: icpolarity = TIM1_ICPOLARITY_FALLING;
	ld	a, #0x01
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 510: icpolarity = TIM1_ICPOLARITY_RISING;
	.byte 0xc5
00102$:
	clr	(0x01, sp)
00103$:
;	./../../lib/src/stm8s_tim1.c: 514: if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
	ld	a, (0x06, sp)
	dec	a
	jrne	00105$
;	./../../lib/src/stm8s_tim1.c: 516: icselection = TIM1_ICSELECTION_INDIRECTTI;
	ld	a, #0x02
	ld	(0x02, sp), a
	jra	00106$
00105$:
;	./../../lib/src/stm8s_tim1.c: 520: icselection = TIM1_ICSELECTION_DIRECTTI;
	ld	a, #0x01
	ld	(0x02, sp), a
00106$:
;	./../../lib/src/stm8s_tim1.c: 526: TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
	ld	a, (0x05, sp)
	ld	xh, a
;	./../../lib/src/stm8s_tim1.c: 523: if (TIM1_Channel == TIM1_CHANNEL_1)
	ld	a, xl
	tnz	a
	jrne	00108$
;	./../../lib/src/stm8s_tim1.c: 526: TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
	ld	a, (0x08, sp)
	push	a
	ld	a, (0x07, sp)
	push	a
	ld	a, xh
	call	_TI1_Config
;	./../../lib/src/stm8s_tim1.c: 530: TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
	ld	a, (0x07, sp)
	call	_TIM1_SetIC1Prescaler
;	./../../lib/src/stm8s_tim1.c: 533: TI2_Config(icpolarity, icselection, TIM1_ICFilter);
	ld	a, (0x08, sp)
	push	a
	ld	a, (0x03, sp)
	push	a
	ld	a, (0x03, sp)
	call	_TI2_Config
;	./../../lib/src/stm8s_tim1.c: 536: TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
	ld	a, (0x07, sp)
	ldw	x, (3, sp)
	ldw	(7, sp), x
	addw	sp, #6
	jp	_TIM1_SetIC2Prescaler
00108$:
;	./../../lib/src/stm8s_tim1.c: 541: TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
	ld	a, (0x08, sp)
	push	a
	ld	a, (0x07, sp)
	push	a
	ld	a, xh
	call	_TI2_Config
;	./../../lib/src/stm8s_tim1.c: 545: TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
	ld	a, (0x07, sp)
	call	_TIM1_SetIC2Prescaler
;	./../../lib/src/stm8s_tim1.c: 548: TI1_Config(icpolarity, icselection, TIM1_ICFilter);
	ld	a, (0x08, sp)
	push	a
	ld	a, (0x03, sp)
	push	a
	ld	a, (0x03, sp)
	call	_TI1_Config
;	./../../lib/src/stm8s_tim1.c: 551: TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
	ld	a, (0x07, sp)
	ldw	x, (3, sp)
	ldw	(7, sp), x
	addw	sp, #6
;	./../../lib/src/stm8s_tim1.c: 553: }
	jp	_TIM1_SetIC1Prescaler
;	./../../lib/src/stm8s_tim1.c: 561: void TIM1_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_Cmd
;	-----------------------------------------
_TIM1_Cmd:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 569: TIM1->CR1 |= TIM1_CR1_CEN;
	ld	a, 0x5250
;	./../../lib/src/stm8s_tim1.c: 567: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 569: TIM1->CR1 |= TIM1_CR1_CEN;
	or	a, #0x01
	ld	0x5250, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 573: TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
	and	a, #0xfe
	ld	0x5250, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 575: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 583: void TIM1_CtrlPWMOutputs(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_CtrlPWMOutputs
;	-----------------------------------------
_TIM1_CtrlPWMOutputs:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 592: TIM1->BKR |= TIM1_BKR_MOE;
	ld	a, 0x526d
;	./../../lib/src/stm8s_tim1.c: 590: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 592: TIM1->BKR |= TIM1_BKR_MOE;
	or	a, #0x80
	ld	0x526d, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 596: TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
	and	a, #0x7f
	ld	0x526d, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 598: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 617: void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_ITConfig
;	-----------------------------------------
_TIM1_ITConfig:
	push	a
;	./../../lib/src/stm8s_tim1.c: 626: TIM1->IER |= (uint8_t)TIM1_IT;
	ldw	x, #0x5254
	push	a
	ld	a, (x)
	ld	(0x02, sp), a
	pop	a
;	./../../lib/src/stm8s_tim1.c: 623: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 626: TIM1->IER |= (uint8_t)TIM1_IT;
	or	a, (0x01, sp)
	ld	0x5254, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 631: TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
	cpl	a
	and	a, (0x01, sp)
	ld	0x5254, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 633: }
	pop	a
	popw	x
	pop	a
	jp	(x)
;	./../../lib/src/stm8s_tim1.c: 640: void TIM1_InternalClockConfig(void)
;	-----------------------------------------
;	 function TIM1_InternalClockConfig
;	-----------------------------------------
_TIM1_InternalClockConfig:
;	./../../lib/src/stm8s_tim1.c: 643: TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
	ld	a, 0x5252
	and	a, #0xf8
	ld	0x5252, a
;	./../../lib/src/stm8s_tim1.c: 644: }
	ret
;	./../../lib/src/stm8s_tim1.c: 662: void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
;	-----------------------------------------
;	 function TIM1_ETRClockMode1Config
;	-----------------------------------------
_TIM1_ETRClockMode1Config:
	ld	xl, a
;	./../../lib/src/stm8s_tim1.c: 671: TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
	ld	a, (0x04, sp)
	push	a
	ld	a, (0x04, sp)
	push	a
	ld	a, xl
	call	_TIM1_ETRConfig
;	./../../lib/src/stm8s_tim1.c: 674: TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
	ld	a, 0x5252
	and	a, #0x88
	or	a, #0x77
	ld	0x5252, a
;	./../../lib/src/stm8s_tim1.c: 676: }
	ldw	x, (1, sp)
	addw	sp, #4
	jp	(x)
;	./../../lib/src/stm8s_tim1.c: 694: void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
;	-----------------------------------------
;	 function TIM1_ETRClockMode2Config
;	-----------------------------------------
_TIM1_ETRClockMode2Config:
	ld	xl, a
;	./../../lib/src/stm8s_tim1.c: 703: TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
	ld	a, (0x04, sp)
	push	a
	ld	a, (0x04, sp)
	push	a
	ld	a, xl
	call	_TIM1_ETRConfig
;	./../../lib/src/stm8s_tim1.c: 706: TIM1->ETR |= TIM1_ETR_ECE;
	ld	a, 0x5253
	or	a, #0x40
	ld	0x5253, a
;	./../../lib/src/stm8s_tim1.c: 707: }
	ldw	x, (1, sp)
	addw	sp, #4
	jp	(x)
;	./../../lib/src/stm8s_tim1.c: 725: void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
;	-----------------------------------------
;	 function TIM1_ETRConfig
;	-----------------------------------------
_TIM1_ETRConfig:
	push	a
	ld	xl, a
;	./../../lib/src/stm8s_tim1.c: 732: TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
	ld	a, 0x5253
	ld	(0x01, sp), a
	ld	a, xl
	or	a, (0x04, sp)
;	./../../lib/src/stm8s_tim1.c: 733: (uint8_t)ExtTRGFilter );
	or	a, (0x05, sp)
	or	a, (0x01, sp)
	ld	0x5253, a
;	./../../lib/src/stm8s_tim1.c: 734: }
	ldw	x, (2, sp)
	addw	sp, #5
	jp	(x)
;	./../../lib/src/stm8s_tim1.c: 751: void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
;	-----------------------------------------
;	 function TIM1_TIxExternalClockConfig
;	-----------------------------------------
_TIM1_TIxExternalClockConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 763: TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
	ld	a, (0x04, sp)
	ld	xl, a
;	./../../lib/src/stm8s_tim1.c: 761: if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
	ld	a, (0x01, sp)
	cp	a, #0x60
	jrne	00102$
;	./../../lib/src/stm8s_tim1.c: 763: TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
	ld	a, (0x05, sp)
	push	a
	push	#0x01
	ld	a, xl
	call	_TI2_Config
	jra	00103$
00102$:
;	./../../lib/src/stm8s_tim1.c: 767: TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
	ld	a, (0x05, sp)
	push	a
	push	#0x01
	ld	a, xl
	call	_TI1_Config
00103$:
;	./../../lib/src/stm8s_tim1.c: 771: TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
	ld	a, (0x01, sp)
	call	_TIM1_SelectInputTrigger
;	./../../lib/src/stm8s_tim1.c: 774: TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
	ld	a, 0x5252
	or	a, #0x07
	ld	0x5252, a
;	./../../lib/src/stm8s_tim1.c: 775: }
	ldw	x, (2, sp)
	addw	sp, #5
	jp	(x)
;	./../../lib/src/stm8s_tim1.c: 787: void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
;	-----------------------------------------
;	 function TIM1_SelectInputTrigger
;	-----------------------------------------
_TIM1_SelectInputTrigger:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 793: TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
	ld	a, 0x5252
	and	a, #0x8f
	or	a, (0x01, sp)
	ld	0x5252, a
;	./../../lib/src/stm8s_tim1.c: 794: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 803: void TIM1_UpdateDisableConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_UpdateDisableConfig
;	-----------------------------------------
_TIM1_UpdateDisableConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 811: TIM1->CR1 |= TIM1_CR1_UDIS;
	ld	a, 0x5250
;	./../../lib/src/stm8s_tim1.c: 809: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 811: TIM1->CR1 |= TIM1_CR1_UDIS;
	or	a, #0x02
	ld	0x5250, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 815: TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
	and	a, #0xfd
	ld	0x5250, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 817: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 827: void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
;	-----------------------------------------
;	 function TIM1_UpdateRequestConfig
;	-----------------------------------------
_TIM1_UpdateRequestConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 835: TIM1->CR1 |= TIM1_CR1_URS;
	ld	a, 0x5250
;	./../../lib/src/stm8s_tim1.c: 833: if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 835: TIM1->CR1 |= TIM1_CR1_URS;
	or	a, #0x04
	ld	0x5250, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 839: TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
	and	a, #0xfb
	ld	0x5250, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 841: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 849: void TIM1_SelectHallSensor(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_SelectHallSensor
;	-----------------------------------------
_TIM1_SelectHallSensor:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 857: TIM1->CR2 |= TIM1_CR2_TI1S;
	ld	a, 0x5251
;	./../../lib/src/stm8s_tim1.c: 855: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 857: TIM1->CR2 |= TIM1_CR2_TI1S;
	or	a, #0x80
	ld	0x5251, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 861: TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
	and	a, #0x7f
	ld	0x5251, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 863: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 873: void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
;	-----------------------------------------
;	 function TIM1_SelectOnePulseMode
;	-----------------------------------------
_TIM1_SelectOnePulseMode:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 881: TIM1->CR1 |= TIM1_CR1_OPM;
	ld	a, 0x5250
;	./../../lib/src/stm8s_tim1.c: 879: if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 881: TIM1->CR1 |= TIM1_CR1_OPM;
	or	a, #0x08
	ld	0x5250, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 885: TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
	and	a, #0xf7
	ld	0x5250, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 888: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 903: void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
;	-----------------------------------------
;	 function TIM1_SelectOutputTrigger
;	-----------------------------------------
_TIM1_SelectOutputTrigger:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 909: TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
	ld	a, 0x5251
	and	a, #0x8f
;	./../../lib/src/stm8s_tim1.c: 910: (uint8_t) TIM1_TRGOSource);
	or	a, (0x01, sp)
	ld	0x5251, a
;	./../../lib/src/stm8s_tim1.c: 911: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 923: void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
;	-----------------------------------------
;	 function TIM1_SelectSlaveMode
;	-----------------------------------------
_TIM1_SelectSlaveMode:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 929: TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
	ld	a, 0x5252
	and	a, #0xf8
;	./../../lib/src/stm8s_tim1.c: 930: (uint8_t)TIM1_SlaveMode);
	or	a, (0x01, sp)
	ld	0x5252, a
;	./../../lib/src/stm8s_tim1.c: 931: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 939: void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_SelectMasterSlaveMode
;	-----------------------------------------
_TIM1_SelectMasterSlaveMode:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 947: TIM1->SMCR |= TIM1_SMCR_MSM;
	ld	a, 0x5252
;	./../../lib/src/stm8s_tim1.c: 945: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 947: TIM1->SMCR |= TIM1_SMCR_MSM;
	or	a, #0x80
	ld	0x5252, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 951: TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
	and	a, #0x7f
	ld	0x5252, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 953: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 975: void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
;	-----------------------------------------
;	 function TIM1_EncoderInterfaceConfig
;	-----------------------------------------
_TIM1_EncoderInterfaceConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 987: TIM1->CCER1 |= TIM1_CCER1_CC1P;
	ld	a, 0x525c
;	./../../lib/src/stm8s_tim1.c: 985: if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
	tnz	(0x04, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 987: TIM1->CCER1 |= TIM1_CCER1_CC1P;
	or	a, #0x02
	ld	0x525c, a
	jra	00103$
00102$:
;	./../../lib/src/stm8s_tim1.c: 991: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
	and	a, #0xfd
	ld	0x525c, a
00103$:
;	./../../lib/src/stm8s_tim1.c: 987: TIM1->CCER1 |= TIM1_CCER1_CC1P;
	ld	a, 0x525c
;	./../../lib/src/stm8s_tim1.c: 994: if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
	tnz	(0x05, sp)
	jreq	00105$
;	./../../lib/src/stm8s_tim1.c: 996: TIM1->CCER1 |= TIM1_CCER1_CC2P;
	or	a, #0x20
	ld	0x525c, a
	jra	00106$
00105$:
;	./../../lib/src/stm8s_tim1.c: 1000: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
	and	a, #0xdf
	ld	0x525c, a
00106$:
;	./../../lib/src/stm8s_tim1.c: 1003: TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
	ld	a, 0x5252
	and	a, #0xf0
;	./../../lib/src/stm8s_tim1.c: 1004: | (uint8_t) TIM1_EncoderMode);
	or	a, (0x01, sp)
	ld	0x5252, a
;	./../../lib/src/stm8s_tim1.c: 1007: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
	ld	a, 0x5258
	and	a, #0xfc
	or	a, #0x01
	ld	0x5258, a
;	./../../lib/src/stm8s_tim1.c: 1009: TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
	ld	a, 0x5259
	and	a, #0xfc
	or	a, #0x01
	ld	0x5259, a
;	./../../lib/src/stm8s_tim1.c: 1011: }
	ldw	x, (2, sp)
	addw	sp, #5
	jp	(x)
;	./../../lib/src/stm8s_tim1.c: 1023: void TIM1_PrescalerConfig(uint16_t Prescaler,
;	-----------------------------------------
;	 function TIM1_PrescalerConfig
;	-----------------------------------------
_TIM1_PrescalerConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1030: TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
	ld	a, xh
	ld	0x5260, a
;	./../../lib/src/stm8s_tim1.c: 1031: TIM1->PSCRL = (uint8_t)(Prescaler);
	ld	a, xl
	ld	0x5261, a
;	./../../lib/src/stm8s_tim1.c: 1034: TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
	ld	a, (0x01, sp)
	ld	0x5257, a
;	./../../lib/src/stm8s_tim1.c: 1035: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1048: void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
;	-----------------------------------------
;	 function TIM1_CounterModeConfig
;	-----------------------------------------
_TIM1_CounterModeConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1055: TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
	ld	a, 0x5250
	and	a, #0x8f
;	./../../lib/src/stm8s_tim1.c: 1056: | (uint8_t)TIM1_CounterMode);
	or	a, (0x01, sp)
	ld	0x5250, a
;	./../../lib/src/stm8s_tim1.c: 1057: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1067: void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
;	-----------------------------------------
;	 function TIM1_ForcedOC1Config
;	-----------------------------------------
_TIM1_ForcedOC1Config:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1073: TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
	ld	a, 0x5258
	and	a, #0x8f
;	./../../lib/src/stm8s_tim1.c: 1074: (uint8_t)TIM1_ForcedAction);
	or	a, (0x01, sp)
	ld	0x5258, a
;	./../../lib/src/stm8s_tim1.c: 1075: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1085: void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
;	-----------------------------------------
;	 function TIM1_ForcedOC2Config
;	-----------------------------------------
_TIM1_ForcedOC2Config:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1091: TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
	ld	a, 0x5259
	and	a, #0x8f
;	./../../lib/src/stm8s_tim1.c: 1092: | (uint8_t)TIM1_ForcedAction);
	or	a, (0x01, sp)
	ld	0x5259, a
;	./../../lib/src/stm8s_tim1.c: 1093: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1104: void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
;	-----------------------------------------
;	 function TIM1_ForcedOC3Config
;	-----------------------------------------
_TIM1_ForcedOC3Config:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1110: TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
	ld	a, 0x525a
	and	a, #0x8f
;	./../../lib/src/stm8s_tim1.c: 1111: | (uint8_t)TIM1_ForcedAction);
	or	a, (0x01, sp)
	ld	0x525a, a
;	./../../lib/src/stm8s_tim1.c: 1112: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1123: void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
;	-----------------------------------------
;	 function TIM1_ForcedOC4Config
;	-----------------------------------------
_TIM1_ForcedOC4Config:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1129: TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
	ld	a, 0x525b
	and	a, #0x8f
;	./../../lib/src/stm8s_tim1.c: 1130: | (uint8_t)TIM1_ForcedAction);
	or	a, (0x01, sp)
	ld	0x525b, a
;	./../../lib/src/stm8s_tim1.c: 1131: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1139: void TIM1_ARRPreloadConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_ARRPreloadConfig
;	-----------------------------------------
_TIM1_ARRPreloadConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1147: TIM1->CR1 |= TIM1_CR1_ARPE;
	ld	a, 0x5250
;	./../../lib/src/stm8s_tim1.c: 1145: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1147: TIM1->CR1 |= TIM1_CR1_ARPE;
	or	a, #0x80
	ld	0x5250, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1151: TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
	and	a, #0x7f
	ld	0x5250, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 1153: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1161: void TIM1_SelectCOM(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_SelectCOM
;	-----------------------------------------
_TIM1_SelectCOM:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1169: TIM1->CR2 |= TIM1_CR2_COMS;
	ld	a, 0x5251
;	./../../lib/src/stm8s_tim1.c: 1167: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1169: TIM1->CR2 |= TIM1_CR2_COMS;
	or	a, #0x04
	ld	0x5251, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1173: TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
	and	a, #0xfb
	ld	0x5251, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 1175: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1183: void TIM1_CCPreloadControl(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_CCPreloadControl
;	-----------------------------------------
_TIM1_CCPreloadControl:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1191: TIM1->CR2 |= TIM1_CR2_CCPC;
	ld	a, 0x5251
;	./../../lib/src/stm8s_tim1.c: 1189: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1191: TIM1->CR2 |= TIM1_CR2_CCPC;
	or	a, #0x01
	ld	0x5251, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1195: TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
	and	a, #0xfe
	ld	0x5251, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 1197: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1205: void TIM1_OC1PreloadConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_OC1PreloadConfig
;	-----------------------------------------
_TIM1_OC1PreloadConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1213: TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
	ld	a, 0x5258
;	./../../lib/src/stm8s_tim1.c: 1211: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1213: TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
	or	a, #0x08
	ld	0x5258, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1217: TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
	and	a, #0xf7
	ld	0x5258, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 1219: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1227: void TIM1_OC2PreloadConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_OC2PreloadConfig
;	-----------------------------------------
_TIM1_OC2PreloadConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1235: TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
	ld	a, 0x5259
;	./../../lib/src/stm8s_tim1.c: 1233: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1235: TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
	or	a, #0x08
	ld	0x5259, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1239: TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
	and	a, #0xf7
	ld	0x5259, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 1241: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1249: void TIM1_OC3PreloadConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_OC3PreloadConfig
;	-----------------------------------------
_TIM1_OC3PreloadConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1257: TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
	ld	a, 0x525a
;	./../../lib/src/stm8s_tim1.c: 1255: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1257: TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
	or	a, #0x08
	ld	0x525a, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1261: TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
	and	a, #0xf7
	ld	0x525a, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 1263: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1271: void TIM1_OC4PreloadConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_OC4PreloadConfig
;	-----------------------------------------
_TIM1_OC4PreloadConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1279: TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
	ld	a, 0x525b
;	./../../lib/src/stm8s_tim1.c: 1277: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1279: TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
	or	a, #0x08
	ld	0x525b, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1283: TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
	and	a, #0xf7
	ld	0x525b, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 1285: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1293: void TIM1_OC1FastConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_OC1FastConfig
;	-----------------------------------------
_TIM1_OC1FastConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1301: TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
	ld	a, 0x5258
;	./../../lib/src/stm8s_tim1.c: 1299: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1301: TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
	or	a, #0x04
	ld	0x5258, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1305: TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
	and	a, #0xfb
	ld	0x5258, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 1307: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1315: void TIM1_OC2FastConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_OC2FastConfig
;	-----------------------------------------
_TIM1_OC2FastConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1323: TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
	ld	a, 0x5259
;	./../../lib/src/stm8s_tim1.c: 1321: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1323: TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
	or	a, #0x04
	ld	0x5259, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1327: TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
	and	a, #0xfb
	ld	0x5259, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 1329: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1337: void TIM1_OC3FastConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_OC3FastConfig
;	-----------------------------------------
_TIM1_OC3FastConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1345: TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
	ld	a, 0x525a
;	./../../lib/src/stm8s_tim1.c: 1343: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1345: TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
	or	a, #0x04
	ld	0x525a, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1349: TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
	and	a, #0xfb
	ld	0x525a, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 1351: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1359: void TIM1_OC4FastConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_OC4FastConfig
;	-----------------------------------------
_TIM1_OC4FastConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1367: TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
	ld	a, 0x525b
;	./../../lib/src/stm8s_tim1.c: 1365: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1367: TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
	or	a, #0x04
	ld	0x525b, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1371: TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
	and	a, #0xfb
	ld	0x525b, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 1373: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1389: void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
;	-----------------------------------------
;	 function TIM1_GenerateEvent
;	-----------------------------------------
_TIM1_GenerateEvent:
;	./../../lib/src/stm8s_tim1.c: 1395: TIM1->EGR = (uint8_t)TIM1_EventSource;
	ld	0x5257, a
;	./../../lib/src/stm8s_tim1.c: 1396: }
	ret
;	./../../lib/src/stm8s_tim1.c: 1406: void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
;	-----------------------------------------
;	 function TIM1_OC1PolarityConfig
;	-----------------------------------------
_TIM1_OC1PolarityConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1414: TIM1->CCER1 |= TIM1_CCER1_CC1P;
	ld	a, 0x525c
;	./../../lib/src/stm8s_tim1.c: 1412: if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1414: TIM1->CCER1 |= TIM1_CCER1_CC1P;
	or	a, #0x02
	ld	0x525c, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1418: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
	and	a, #0xfd
	ld	0x525c, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 1420: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1430: void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
;	-----------------------------------------
;	 function TIM1_OC1NPolarityConfig
;	-----------------------------------------
_TIM1_OC1NPolarityConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1438: TIM1->CCER1 |= TIM1_CCER1_CC1NP;
	ld	a, 0x525c
;	./../../lib/src/stm8s_tim1.c: 1436: if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1438: TIM1->CCER1 |= TIM1_CCER1_CC1NP;
	or	a, #0x08
	ld	0x525c, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1442: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
	and	a, #0xf7
	ld	0x525c, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 1444: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1454: void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
;	-----------------------------------------
;	 function TIM1_OC2PolarityConfig
;	-----------------------------------------
_TIM1_OC2PolarityConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1462: TIM1->CCER1 |= TIM1_CCER1_CC2P;
	ld	a, 0x525c
;	./../../lib/src/stm8s_tim1.c: 1460: if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1462: TIM1->CCER1 |= TIM1_CCER1_CC2P;
	or	a, #0x20
	ld	0x525c, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1466: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
	and	a, #0xdf
	ld	0x525c, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 1468: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1478: void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
;	-----------------------------------------
;	 function TIM1_OC2NPolarityConfig
;	-----------------------------------------
_TIM1_OC2NPolarityConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1486: TIM1->CCER1 |= TIM1_CCER1_CC2NP;
	ld	a, 0x525c
;	./../../lib/src/stm8s_tim1.c: 1484: if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1486: TIM1->CCER1 |= TIM1_CCER1_CC2NP;
	or	a, #0x80
	ld	0x525c, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1490: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
	and	a, #0x7f
	ld	0x525c, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 1492: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1502: void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
;	-----------------------------------------
;	 function TIM1_OC3PolarityConfig
;	-----------------------------------------
_TIM1_OC3PolarityConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1510: TIM1->CCER2 |= TIM1_CCER2_CC3P;
	ld	a, 0x525d
;	./../../lib/src/stm8s_tim1.c: 1508: if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1510: TIM1->CCER2 |= TIM1_CCER2_CC3P;
	or	a, #0x02
	ld	0x525d, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1514: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
	and	a, #0xfd
	ld	0x525d, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 1516: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1527: void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
;	-----------------------------------------
;	 function TIM1_OC3NPolarityConfig
;	-----------------------------------------
_TIM1_OC3NPolarityConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1535: TIM1->CCER2 |= TIM1_CCER2_CC3NP;
	ld	a, 0x525d
;	./../../lib/src/stm8s_tim1.c: 1533: if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1535: TIM1->CCER2 |= TIM1_CCER2_CC3NP;
	or	a, #0x08
	ld	0x525d, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1539: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
	and	a, #0xf7
	ld	0x525d, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 1541: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1551: void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
;	-----------------------------------------
;	 function TIM1_OC4PolarityConfig
;	-----------------------------------------
_TIM1_OC4PolarityConfig:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1559: TIM1->CCER2 |= TIM1_CCER2_CC4P;
	ld	a, 0x525d
;	./../../lib/src/stm8s_tim1.c: 1557: if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
	tnz	(0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1559: TIM1->CCER2 |= TIM1_CCER2_CC4P;
	or	a, #0x20
	ld	0x525d, a
	jra	00104$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1563: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
	and	a, #0xdf
	ld	0x525d, a
00104$:
;	./../../lib/src/stm8s_tim1.c: 1565: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1579: void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_CCxCmd
;	-----------------------------------------
_TIM1_CCxCmd:
;	./../../lib/src/stm8s_tim1.c: 1585: if (TIM1_Channel == TIM1_CHANNEL_1)
	ld	xl, a
	tnz	a
	jrne	00120$
;	./../../lib/src/stm8s_tim1.c: 1590: TIM1->CCER1 |= TIM1_CCER1_CC1E;
	ld	a, 0x525c
;	./../../lib/src/stm8s_tim1.c: 1588: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1590: TIM1->CCER1 |= TIM1_CCER1_CC1E;
	or	a, #0x01
	ld	0x525c, a
	jra	00122$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1594: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
	and	a, #0xfe
	ld	0x525c, a
	jra	00122$
00120$:
;	./../../lib/src/stm8s_tim1.c: 1598: else if (TIM1_Channel == TIM1_CHANNEL_2)
	ld	a, xl
	dec	a
	jrne	00117$
;	./../../lib/src/stm8s_tim1.c: 1590: TIM1->CCER1 |= TIM1_CCER1_CC1E;
	ld	a, 0x525c
;	./../../lib/src/stm8s_tim1.c: 1601: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00105$
;	./../../lib/src/stm8s_tim1.c: 1603: TIM1->CCER1 |= TIM1_CCER1_CC2E;
	or	a, #0x10
	ld	0x525c, a
	jra	00122$
00105$:
;	./../../lib/src/stm8s_tim1.c: 1607: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
	and	a, #0xef
	ld	0x525c, a
	jra	00122$
00117$:
;	./../../lib/src/stm8s_tim1.c: 1615: TIM1->CCER2 |= TIM1_CCER2_CC3E;
	ld	a, 0x525d
;	./../../lib/src/stm8s_tim1.c: 1610: else if (TIM1_Channel == TIM1_CHANNEL_3)
	push	a
	ld	a, xl
	cp	a, #0x02
	pop	a
	jrne	00114$
;	./../../lib/src/stm8s_tim1.c: 1613: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00108$
;	./../../lib/src/stm8s_tim1.c: 1615: TIM1->CCER2 |= TIM1_CCER2_CC3E;
	or	a, #0x01
	ld	0x525d, a
	jra	00122$
00108$:
;	./../../lib/src/stm8s_tim1.c: 1619: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
	and	a, #0xfe
	ld	0x525d, a
	jra	00122$
00114$:
;	./../../lib/src/stm8s_tim1.c: 1625: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00111$
;	./../../lib/src/stm8s_tim1.c: 1627: TIM1->CCER2 |= TIM1_CCER2_CC4E;
	or	a, #0x10
	ld	0x525d, a
	jra	00122$
00111$:
;	./../../lib/src/stm8s_tim1.c: 1631: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
	and	a, #0xef
	ld	0x525d, a
00122$:
;	./../../lib/src/stm8s_tim1.c: 1634: }
	popw	x
	pop	a
	jp	(x)
;	./../../lib/src/stm8s_tim1.c: 1647: void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_CCxNCmd
;	-----------------------------------------
_TIM1_CCxNCmd:
;	./../../lib/src/stm8s_tim1.c: 1653: if (TIM1_Channel == TIM1_CHANNEL_1)
	tnz	a
	jrne	00114$
;	./../../lib/src/stm8s_tim1.c: 1658: TIM1->CCER1 |= TIM1_CCER1_CC1NE;
	ld	a, 0x525c
;	./../../lib/src/stm8s_tim1.c: 1656: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 1658: TIM1->CCER1 |= TIM1_CCER1_CC1NE;
	or	a, #0x04
	ld	0x525c, a
	jra	00116$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1662: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
	and	a, #0xfb
	ld	0x525c, a
	jra	00116$
00114$:
;	./../../lib/src/stm8s_tim1.c: 1665: else if (TIM1_Channel == TIM1_CHANNEL_2)
	dec	a
	jrne	00111$
;	./../../lib/src/stm8s_tim1.c: 1658: TIM1->CCER1 |= TIM1_CCER1_CC1NE;
	ld	a, 0x525c
;	./../../lib/src/stm8s_tim1.c: 1668: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00105$
;	./../../lib/src/stm8s_tim1.c: 1670: TIM1->CCER1 |= TIM1_CCER1_CC2NE;
	or	a, #0x40
	ld	0x525c, a
	jra	00116$
00105$:
;	./../../lib/src/stm8s_tim1.c: 1674: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
	and	a, #0xbf
	ld	0x525c, a
	jra	00116$
00111$:
;	./../../lib/src/stm8s_tim1.c: 1682: TIM1->CCER2 |= TIM1_CCER2_CC3NE;
	ld	a, 0x525d
;	./../../lib/src/stm8s_tim1.c: 1680: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00108$
;	./../../lib/src/stm8s_tim1.c: 1682: TIM1->CCER2 |= TIM1_CCER2_CC3NE;
	or	a, #0x04
	ld	0x525d, a
	jra	00116$
00108$:
;	./../../lib/src/stm8s_tim1.c: 1686: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
	and	a, #0xfb
	ld	0x525d, a
00116$:
;	./../../lib/src/stm8s_tim1.c: 1689: }
	popw	x
	pop	a
	jp	(x)
;	./../../lib/src/stm8s_tim1.c: 1712: void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
;	-----------------------------------------
;	 function TIM1_SelectOCxM
;	-----------------------------------------
_TIM1_SelectOCxM:
;	./../../lib/src/stm8s_tim1.c: 1718: if (TIM1_Channel == TIM1_CHANNEL_1)
	ld	xl, a
	tnz	a
	jrne	00108$
;	./../../lib/src/stm8s_tim1.c: 1721: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
	bres	0x525c, #0
;	./../../lib/src/stm8s_tim1.c: 1724: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
	ld	a, 0x5258
	and	a, #0x8f
;	./../../lib/src/stm8s_tim1.c: 1725: | (uint8_t)TIM1_OCMode);
	or	a, (0x03, sp)
	ld	0x5258, a
	jra	00110$
00108$:
;	./../../lib/src/stm8s_tim1.c: 1727: else if (TIM1_Channel == TIM1_CHANNEL_2)
	ld	a, xl
	dec	a
	jrne	00105$
;	./../../lib/src/stm8s_tim1.c: 1730: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
	bres	0x525c, #4
;	./../../lib/src/stm8s_tim1.c: 1733: TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
	ld	a, 0x5259
	and	a, #0x8f
;	./../../lib/src/stm8s_tim1.c: 1734: | (uint8_t)TIM1_OCMode);
	or	a, (0x03, sp)
	ld	0x5259, a
	jra	00110$
00105$:
;	./../../lib/src/stm8s_tim1.c: 1739: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
	ld	a, 0x525d
;	./../../lib/src/stm8s_tim1.c: 1736: else if (TIM1_Channel == TIM1_CHANNEL_3)
	push	a
	ld	a, xl
	cp	a, #0x02
	pop	a
	jrne	00102$
;	./../../lib/src/stm8s_tim1.c: 1739: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
	and	a, #0xfe
	ld	0x525d, a
;	./../../lib/src/stm8s_tim1.c: 1742: TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
	ld	a, 0x525a
	and	a, #0x8f
;	./../../lib/src/stm8s_tim1.c: 1743: | (uint8_t)TIM1_OCMode);
	or	a, (0x03, sp)
	ld	0x525a, a
	jra	00110$
00102$:
;	./../../lib/src/stm8s_tim1.c: 1748: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
	and	a, #0xef
	ld	0x525d, a
;	./../../lib/src/stm8s_tim1.c: 1751: TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
	ld	a, 0x525b
	and	a, #0x8f
;	./../../lib/src/stm8s_tim1.c: 1752: | (uint8_t)TIM1_OCMode);
	or	a, (0x03, sp)
	ld	0x525b, a
00110$:
;	./../../lib/src/stm8s_tim1.c: 1754: }
	popw	x
	pop	a
	jp	(x)
;	./../../lib/src/stm8s_tim1.c: 1762: void TIM1_SetCounter(uint16_t Counter)
;	-----------------------------------------
;	 function TIM1_SetCounter
;	-----------------------------------------
_TIM1_SetCounter:
;	./../../lib/src/stm8s_tim1.c: 1765: TIM1->CNTRH = (uint8_t)(Counter >> 8);
	ld	a, xh
	ld	0x525e, a
;	./../../lib/src/stm8s_tim1.c: 1766: TIM1->CNTRL = (uint8_t)(Counter);
	ld	a, xl
	ld	0x525f, a
;	./../../lib/src/stm8s_tim1.c: 1767: }
	ret
;	./../../lib/src/stm8s_tim1.c: 1775: void TIM1_SetAutoreload(uint16_t Autoreload)
;	-----------------------------------------
;	 function TIM1_SetAutoreload
;	-----------------------------------------
_TIM1_SetAutoreload:
;	./../../lib/src/stm8s_tim1.c: 1778: TIM1->ARRH = (uint8_t)(Autoreload >> 8);
	ld	a, xh
	ld	0x5262, a
;	./../../lib/src/stm8s_tim1.c: 1779: TIM1->ARRL = (uint8_t)(Autoreload);
	ld	a, xl
	ld	0x5263, a
;	./../../lib/src/stm8s_tim1.c: 1780: }
	ret
;	./../../lib/src/stm8s_tim1.c: 1788: void TIM1_SetCompare1(uint16_t Compare1)
;	-----------------------------------------
;	 function TIM1_SetCompare1
;	-----------------------------------------
_TIM1_SetCompare1:
;	./../../lib/src/stm8s_tim1.c: 1791: TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
	ld	a, xh
	ld	0x5265, a
;	./../../lib/src/stm8s_tim1.c: 1792: TIM1->CCR1L = (uint8_t)(Compare1);
	ld	a, xl
	ld	0x5266, a
;	./../../lib/src/stm8s_tim1.c: 1793: }
	ret
;	./../../lib/src/stm8s_tim1.c: 1801: void TIM1_SetCompare2(uint16_t Compare2)
;	-----------------------------------------
;	 function TIM1_SetCompare2
;	-----------------------------------------
_TIM1_SetCompare2:
;	./../../lib/src/stm8s_tim1.c: 1804: TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
	ld	a, xh
	ld	0x5267, a
;	./../../lib/src/stm8s_tim1.c: 1805: TIM1->CCR2L = (uint8_t)(Compare2);
	ld	a, xl
	ld	0x5268, a
;	./../../lib/src/stm8s_tim1.c: 1806: }
	ret
;	./../../lib/src/stm8s_tim1.c: 1814: void TIM1_SetCompare3(uint16_t Compare3)
;	-----------------------------------------
;	 function TIM1_SetCompare3
;	-----------------------------------------
_TIM1_SetCompare3:
;	./../../lib/src/stm8s_tim1.c: 1817: TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
	ld	a, xh
	ld	0x5269, a
;	./../../lib/src/stm8s_tim1.c: 1818: TIM1->CCR3L = (uint8_t)(Compare3);
	ld	a, xl
	ld	0x526a, a
;	./../../lib/src/stm8s_tim1.c: 1819: }
	ret
;	./../../lib/src/stm8s_tim1.c: 1827: void TIM1_SetCompare4(uint16_t Compare4)
;	-----------------------------------------
;	 function TIM1_SetCompare4
;	-----------------------------------------
_TIM1_SetCompare4:
;	./../../lib/src/stm8s_tim1.c: 1830: TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
	ld	a, xh
	ld	0x526b, a
;	./../../lib/src/stm8s_tim1.c: 1831: TIM1->CCR4L = (uint8_t)(Compare4);
	ld	a, xl
	ld	0x526c, a
;	./../../lib/src/stm8s_tim1.c: 1832: }
	ret
;	./../../lib/src/stm8s_tim1.c: 1844: void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
;	-----------------------------------------
;	 function TIM1_SetIC1Prescaler
;	-----------------------------------------
_TIM1_SetIC1Prescaler:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1850: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
	ld	a, 0x5258
	and	a, #0xf3
;	./../../lib/src/stm8s_tim1.c: 1851: | (uint8_t)TIM1_IC1Prescaler);
	or	a, (0x01, sp)
	ld	0x5258, a
;	./../../lib/src/stm8s_tim1.c: 1852: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1864: void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
;	-----------------------------------------
;	 function TIM1_SetIC2Prescaler
;	-----------------------------------------
_TIM1_SetIC2Prescaler:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1871: TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
	ld	a, 0x5259
	and	a, #0xf3
;	./../../lib/src/stm8s_tim1.c: 1872: | (uint8_t)TIM1_IC2Prescaler);
	or	a, (0x01, sp)
	ld	0x5259, a
;	./../../lib/src/stm8s_tim1.c: 1873: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1885: void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
;	-----------------------------------------
;	 function TIM1_SetIC3Prescaler
;	-----------------------------------------
_TIM1_SetIC3Prescaler:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1892: TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
	ld	a, 0x525a
	and	a, #0xf3
;	./../../lib/src/stm8s_tim1.c: 1893: (uint8_t)TIM1_IC3Prescaler);
	or	a, (0x01, sp)
	ld	0x525a, a
;	./../../lib/src/stm8s_tim1.c: 1894: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1906: void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
;	-----------------------------------------
;	 function TIM1_SetIC4Prescaler
;	-----------------------------------------
_TIM1_SetIC4Prescaler:
	push	a
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 1913: TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
	ld	a, 0x525b
	and	a, #0xf3
;	./../../lib/src/stm8s_tim1.c: 1914: (uint8_t)TIM1_IC4Prescaler);
	or	a, (0x01, sp)
	ld	0x525b, a
;	./../../lib/src/stm8s_tim1.c: 1915: }
	pop	a
	ret
;	./../../lib/src/stm8s_tim1.c: 1922: uint16_t TIM1_GetCapture1(void)
;	-----------------------------------------
;	 function TIM1_GetCapture1
;	-----------------------------------------
_TIM1_GetCapture1:
	sub	sp, #2
;	./../../lib/src/stm8s_tim1.c: 1929: tmpccr1h = TIM1->CCR1H;
	ld	a, 0x5265
	ld	xh, a
;	./../../lib/src/stm8s_tim1.c: 1930: tmpccr1l = TIM1->CCR1L;
	ld	a, 0x5266
;	./../../lib/src/stm8s_tim1.c: 1932: tmpccr1 = (uint16_t)(tmpccr1l);
	ld	(0x02, sp), a
	clr	(0x01, sp)
;	./../../lib/src/stm8s_tim1.c: 1933: tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
	ld	a, (0x02, sp)
	rlwa	x
	or	a, (0x01, sp)
;	./../../lib/src/stm8s_tim1.c: 1935: return (uint16_t)tmpccr1;
	ld	xh, a
;	./../../lib/src/stm8s_tim1.c: 1936: }
	addw	sp, #2
	ret
;	./../../lib/src/stm8s_tim1.c: 1943: uint16_t TIM1_GetCapture2(void)
;	-----------------------------------------
;	 function TIM1_GetCapture2
;	-----------------------------------------
_TIM1_GetCapture2:
	sub	sp, #2
;	./../../lib/src/stm8s_tim1.c: 1950: tmpccr2h = TIM1->CCR2H;
	ld	a, 0x5267
	ld	xh, a
;	./../../lib/src/stm8s_tim1.c: 1951: tmpccr2l = TIM1->CCR2L;
	ld	a, 0x5268
;	./../../lib/src/stm8s_tim1.c: 1953: tmpccr2 = (uint16_t)(tmpccr2l);
	ld	(0x02, sp), a
	clr	(0x01, sp)
;	./../../lib/src/stm8s_tim1.c: 1954: tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
	ld	a, (0x02, sp)
	rlwa	x
	or	a, (0x01, sp)
;	./../../lib/src/stm8s_tim1.c: 1956: return (uint16_t)tmpccr2;
	ld	xh, a
;	./../../lib/src/stm8s_tim1.c: 1957: }
	addw	sp, #2
	ret
;	./../../lib/src/stm8s_tim1.c: 1964: uint16_t TIM1_GetCapture3(void)
;	-----------------------------------------
;	 function TIM1_GetCapture3
;	-----------------------------------------
_TIM1_GetCapture3:
	sub	sp, #2
;	./../../lib/src/stm8s_tim1.c: 1970: tmpccr3h = TIM1->CCR3H;
	ld	a, 0x5269
	ld	xh, a
;	./../../lib/src/stm8s_tim1.c: 1971: tmpccr3l = TIM1->CCR3L;
	ld	a, 0x526a
;	./../../lib/src/stm8s_tim1.c: 1973: tmpccr3 = (uint16_t)(tmpccr3l);
	ld	(0x02, sp), a
	clr	(0x01, sp)
;	./../../lib/src/stm8s_tim1.c: 1974: tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
	ld	a, (0x02, sp)
	rlwa	x
	or	a, (0x01, sp)
;	./../../lib/src/stm8s_tim1.c: 1976: return (uint16_t)tmpccr3;
	ld	xh, a
;	./../../lib/src/stm8s_tim1.c: 1977: }
	addw	sp, #2
	ret
;	./../../lib/src/stm8s_tim1.c: 1984: uint16_t TIM1_GetCapture4(void)
;	-----------------------------------------
;	 function TIM1_GetCapture4
;	-----------------------------------------
_TIM1_GetCapture4:
	sub	sp, #2
;	./../../lib/src/stm8s_tim1.c: 1990: tmpccr4h = TIM1->CCR4H;
	ld	a, 0x526b
	ld	xh, a
;	./../../lib/src/stm8s_tim1.c: 1991: tmpccr4l = TIM1->CCR4L;
	ld	a, 0x526c
;	./../../lib/src/stm8s_tim1.c: 1993: tmpccr4 = (uint16_t)(tmpccr4l);
	ld	(0x02, sp), a
	clr	(0x01, sp)
;	./../../lib/src/stm8s_tim1.c: 1994: tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
	ld	a, (0x02, sp)
	rlwa	x
	or	a, (0x01, sp)
;	./../../lib/src/stm8s_tim1.c: 1996: return (uint16_t)tmpccr4;
	ld	xh, a
;	./../../lib/src/stm8s_tim1.c: 1997: }
	addw	sp, #2
	ret
;	./../../lib/src/stm8s_tim1.c: 2004: uint16_t TIM1_GetCounter(void)
;	-----------------------------------------
;	 function TIM1_GetCounter
;	-----------------------------------------
_TIM1_GetCounter:
	sub	sp, #4
;	./../../lib/src/stm8s_tim1.c: 2008: tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
	ld	a, 0x525e
	ld	xh, a
	clr	(0x02, sp)
;	./../../lib/src/stm8s_tim1.c: 2011: return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
	ld	a, 0x525f
	clr	(0x03, sp)
	or	a, (0x02, sp)
	rlwa	x
	or	a, (0x03, sp)
	ld	xh, a
;	./../../lib/src/stm8s_tim1.c: 2012: }
	addw	sp, #4
	ret
;	./../../lib/src/stm8s_tim1.c: 2019: uint16_t TIM1_GetPrescaler(void)
;	-----------------------------------------
;	 function TIM1_GetPrescaler
;	-----------------------------------------
_TIM1_GetPrescaler:
	sub	sp, #4
;	./../../lib/src/stm8s_tim1.c: 2023: temp = ((uint16_t)TIM1->PSCRH << 8);
	ld	a, 0x5260
	ld	xh, a
	clr	(0x02, sp)
;	./../../lib/src/stm8s_tim1.c: 2026: return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
	ld	a, 0x5261
	clr	(0x03, sp)
	or	a, (0x02, sp)
	rlwa	x
	or	a, (0x03, sp)
	ld	xh, a
;	./../../lib/src/stm8s_tim1.c: 2027: }
	addw	sp, #4
	ret
;	./../../lib/src/stm8s_tim1.c: 2047: FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
;	-----------------------------------------
;	 function TIM1_GetFlagStatus
;	-----------------------------------------
_TIM1_GetFlagStatus:
	push	a
;	./../../lib/src/stm8s_tim1.c: 2055: tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
	ld	a, 0x5255
	ld	(0x01, sp), a
	ld	a, xl
	and	a, (0x01, sp)
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 2056: tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
;	./../../lib/src/stm8s_tim1.c: 2058: if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
	ld	a, 0x5256
	pushw	x
	and	a, (1, sp)
	popw	x
	or	a, (0x01, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 2060: bitstatus = SET;
	ld	a, #0x01
;	./../../lib/src/stm8s_tim1.c: 2064: bitstatus = RESET;
	.byte 0x21
00102$:
	clr	a
00103$:
;	./../../lib/src/stm8s_tim1.c: 2066: return (FlagStatus)(bitstatus);
;	./../../lib/src/stm8s_tim1.c: 2067: }
	addw	sp, #1
	ret
;	./../../lib/src/stm8s_tim1.c: 2087: void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
;	-----------------------------------------
;	 function TIM1_ClearFlag
;	-----------------------------------------
_TIM1_ClearFlag:
;	./../../lib/src/stm8s_tim1.c: 2093: TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
	ld	a, xl
	cpl	a
	ld	0x5255, a
;	./../../lib/src/stm8s_tim1.c: 2094: TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
	ld	a, xh
	cpl	a
	and	a, #0x1e
	ld	0x5256, a
;	./../../lib/src/stm8s_tim1.c: 2096: }
	ret
;	./../../lib/src/stm8s_tim1.c: 2112: ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
;	-----------------------------------------
;	 function TIM1_GetITStatus
;	-----------------------------------------
_TIM1_GetITStatus:
	sub	sp, #2
	ld	(0x02, sp), a
;	./../../lib/src/stm8s_tim1.c: 2120: TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
	ld	a, 0x5255
	and	a, (0x02, sp)
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 2122: TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
	ld	a, 0x5254
	and	a, (0x02, sp)
;	./../../lib/src/stm8s_tim1.c: 2124: if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
	tnz	(0x01, sp)
	jreq	00102$
	tnz	a
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 2126: bitstatus = SET;
	ld	a, #0x01
;	./../../lib/src/stm8s_tim1.c: 2130: bitstatus = RESET;
	.byte 0x21
00102$:
	clr	a
00103$:
;	./../../lib/src/stm8s_tim1.c: 2132: return (ITStatus)(bitstatus);
;	./../../lib/src/stm8s_tim1.c: 2133: }
	addw	sp, #2
	ret
;	./../../lib/src/stm8s_tim1.c: 2149: void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
;	-----------------------------------------
;	 function TIM1_ClearITPendingBit
;	-----------------------------------------
_TIM1_ClearITPendingBit:
;	./../../lib/src/stm8s_tim1.c: 2155: TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
	cpl	a
	ld	0x5255, a
;	./../../lib/src/stm8s_tim1.c: 2156: }
	ret
;	./../../lib/src/stm8s_tim1.c: 2174: static void TI1_Config(uint8_t TIM1_ICPolarity,
;	-----------------------------------------
;	 function TI1_Config
;	-----------------------------------------
_TI1_Config:
	sub	sp, #2
	ld	(0x02, sp), a
;	./../../lib/src/stm8s_tim1.c: 2179: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
	bres	0x525c, #0
;	./../../lib/src/stm8s_tim1.c: 2182: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
	ld	a, 0x5258
	and	a, #0x0c
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 2183: (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
	ld	a, (0x06, sp)
	swap	a
	and	a, #0xf0
	or	a, (0x05, sp)
	or	a, (0x01, sp)
	ld	0x5258, a
;	./../../lib/src/stm8s_tim1.c: 2179: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
	ld	a, 0x525c
;	./../../lib/src/stm8s_tim1.c: 2186: if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
	tnz	(0x02, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 2188: TIM1->CCER1 |= TIM1_CCER1_CC1P;
	or	a, #0x02
	ld	0x525c, a
	jra	00103$
00102$:
;	./../../lib/src/stm8s_tim1.c: 2192: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
	and	a, #0xfd
	ld	0x525c, a
00103$:
;	./../../lib/src/stm8s_tim1.c: 2196: TIM1->CCER1 |=  TIM1_CCER1_CC1E;
	ld	a, 0x525c
	or	a, #0x01
	ld	0x525c, a
;	./../../lib/src/stm8s_tim1.c: 2197: }
	ldw	x, (3, sp)
	addw	sp, #6
	jp	(x)
;	./../../lib/src/stm8s_tim1.c: 2215: static void TI2_Config(uint8_t TIM1_ICPolarity,
;	-----------------------------------------
;	 function TI2_Config
;	-----------------------------------------
_TI2_Config:
	sub	sp, #2
	ld	(0x02, sp), a
;	./../../lib/src/stm8s_tim1.c: 2220: TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
	bres	0x525c, #4
;	./../../lib/src/stm8s_tim1.c: 2223: TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
	ld	a, 0x5259
	and	a, #0x0c
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 2224: | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
	ld	a, (0x06, sp)
	swap	a
	and	a, #0xf0
	or	a, (0x05, sp)
	or	a, (0x01, sp)
	ld	0x5259, a
;	./../../lib/src/stm8s_tim1.c: 2220: TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
	ld	a, 0x525c
;	./../../lib/src/stm8s_tim1.c: 2226: if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
	tnz	(0x02, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 2228: TIM1->CCER1 |= TIM1_CCER1_CC2P;
	or	a, #0x20
	ld	0x525c, a
	jra	00103$
00102$:
;	./../../lib/src/stm8s_tim1.c: 2232: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
	and	a, #0xdf
	ld	0x525c, a
00103$:
;	./../../lib/src/stm8s_tim1.c: 2235: TIM1->CCER1 |=  TIM1_CCER1_CC2E;
	ld	a, 0x525c
	or	a, #0x10
	ld	0x525c, a
;	./../../lib/src/stm8s_tim1.c: 2236: }
	ldw	x, (3, sp)
	addw	sp, #6
	jp	(x)
;	./../../lib/src/stm8s_tim1.c: 2254: static void TI3_Config(uint8_t TIM1_ICPolarity,
;	-----------------------------------------
;	 function TI3_Config
;	-----------------------------------------
_TI3_Config:
	sub	sp, #2
	ld	(0x02, sp), a
;	./../../lib/src/stm8s_tim1.c: 2259: TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
	ld	a, 0x525d
	and	a, #0xfe
	ld	0x525d, a
;	./../../lib/src/stm8s_tim1.c: 2262: TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
	ld	a, 0x525a
	and	a, #0x0c
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 2263: | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
	ld	a, (0x06, sp)
	swap	a
	and	a, #0xf0
	or	a, (0x05, sp)
	or	a, (0x01, sp)
	ld	0x525a, a
;	./../../lib/src/stm8s_tim1.c: 2259: TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
	ld	a, 0x525d
;	./../../lib/src/stm8s_tim1.c: 2266: if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
	tnz	(0x02, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 2268: TIM1->CCER2 |= TIM1_CCER2_CC3P;
	or	a, #0x02
	ld	0x525d, a
	jra	00103$
00102$:
;	./../../lib/src/stm8s_tim1.c: 2272: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
	and	a, #0xfd
	ld	0x525d, a
00103$:
;	./../../lib/src/stm8s_tim1.c: 2275: TIM1->CCER2 |=  TIM1_CCER2_CC3E;
	ld	a, 0x525d
	or	a, #0x01
	ld	0x525d, a
;	./../../lib/src/stm8s_tim1.c: 2276: }
	ldw	x, (3, sp)
	addw	sp, #6
	jp	(x)
;	./../../lib/src/stm8s_tim1.c: 2294: static void TI4_Config(uint8_t TIM1_ICPolarity,
;	-----------------------------------------
;	 function TI4_Config
;	-----------------------------------------
_TI4_Config:
	sub	sp, #2
	ld	(0x02, sp), a
;	./../../lib/src/stm8s_tim1.c: 2299: TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
	bres	0x525d, #4
;	./../../lib/src/stm8s_tim1.c: 2302: TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
	ld	a, 0x525b
	and	a, #0x0c
	ld	(0x01, sp), a
;	./../../lib/src/stm8s_tim1.c: 2303: | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
	ld	a, (0x06, sp)
	swap	a
	and	a, #0xf0
	or	a, (0x05, sp)
	or	a, (0x01, sp)
	ld	0x525b, a
;	./../../lib/src/stm8s_tim1.c: 2299: TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
	ld	a, 0x525d
;	./../../lib/src/stm8s_tim1.c: 2306: if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
	tnz	(0x02, sp)
	jreq	00102$
;	./../../lib/src/stm8s_tim1.c: 2308: TIM1->CCER2 |= TIM1_CCER2_CC4P;
	or	a, #0x20
	ld	0x525d, a
	jra	00103$
00102$:
;	./../../lib/src/stm8s_tim1.c: 2312: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
	and	a, #0xdf
	ld	0x525d, a
00103$:
;	./../../lib/src/stm8s_tim1.c: 2316: TIM1->CCER2 |=  TIM1_CCER2_CC4E;
	ld	a, 0x525d
	or	a, #0x10
	ld	0x525d, a
;	./../../lib/src/stm8s_tim1.c: 2317: }
	ldw	x, (3, sp)
	addw	sp, #6
	jp	(x)
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
