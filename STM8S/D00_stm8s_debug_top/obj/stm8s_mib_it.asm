;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.10 #13778 (MINGW64)
;--------------------------------------------------------
	.module stm8s_mib_it
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TRAP_IRQHandler
	.globl _TLI_IRQHandler
	.globl _AWU_IRQHandler
	.globl _CLK_IRQHandler
	.globl _EXTI_PORTA_IRQHandler
	.globl _EXTI_PORTB_IRQHandler
	.globl _EXTI_PORTC_IRQHandler
	.globl _EXTI_PORTD_IRQHandler
	.globl _EXTI_PORTE_IRQHandler
	.globl _SPI_IRQHandler
	.globl _TIM1_UPD_OVF_TRG_BRK_IRQHandler
	.globl _TIM1_CAP_COM_IRQHandler
	.globl _TIM2_UPD_OVF_BRK_IRQHandler
	.globl _TIM2_CAP_COM_IRQHandler
	.globl _TIM3_UPD_OVF_BRK_IRQHandler
	.globl _TIM3_CAP_COM_IRQHandler
	.globl _I2C_IRQHandler
	.globl _UART2_TX_IRQHandler
	.globl _UART2_RX_IRQHandler
	.globl _ADC1_IRQHandler
	.globl _TIM4_UPD_OVF_IRQHandler
	.globl _EEPROM_EEC_IRQHandler
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
;	./../../mib/stm8s_mib_it.c: 50: INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
;	-----------------------------------------
;	 function TRAP_IRQHandler
;	-----------------------------------------
_TRAP_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 55: }
	iret
;	./../../mib/stm8s_mib_it.c: 62: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
;	-----------------------------------------
;	 function TLI_IRQHandler
;	-----------------------------------------
_TLI_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 68: }
	iret
;	./../../mib/stm8s_mib_it.c: 75: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
;	-----------------------------------------
;	 function AWU_IRQHandler
;	-----------------------------------------
_AWU_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 80: }
	iret
;	./../../mib/stm8s_mib_it.c: 87: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
;	-----------------------------------------
;	 function CLK_IRQHandler
;	-----------------------------------------
_CLK_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 92: }
	iret
;	./../../mib/stm8s_mib_it.c: 99: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
;	-----------------------------------------
;	 function EXTI_PORTA_IRQHandler
;	-----------------------------------------
_EXTI_PORTA_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 104: }
	iret
;	./../../mib/stm8s_mib_it.c: 111: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
;	-----------------------------------------
;	 function EXTI_PORTB_IRQHandler
;	-----------------------------------------
_EXTI_PORTB_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 116: }
	iret
;	./../../mib/stm8s_mib_it.c: 123: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
;	-----------------------------------------
;	 function EXTI_PORTC_IRQHandler
;	-----------------------------------------
_EXTI_PORTC_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 128: }
	iret
;	./../../mib/stm8s_mib_it.c: 135: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
;	-----------------------------------------
;	 function EXTI_PORTD_IRQHandler
;	-----------------------------------------
_EXTI_PORTD_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 140: }
	iret
;	./../../mib/stm8s_mib_it.c: 147: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
;	-----------------------------------------
;	 function EXTI_PORTE_IRQHandler
;	-----------------------------------------
_EXTI_PORTE_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 152: }
	iret
;	./../../mib/stm8s_mib_it.c: 199: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
;	-----------------------------------------
;	 function SPI_IRQHandler
;	-----------------------------------------
_SPI_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 204: }
	iret
;	./../../mib/stm8s_mib_it.c: 211: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
;	-----------------------------------------
;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
;	-----------------------------------------
_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 216: }
	iret
;	./../../mib/stm8s_mib_it.c: 223: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
;	-----------------------------------------
;	 function TIM1_CAP_COM_IRQHandler
;	-----------------------------------------
_TIM1_CAP_COM_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 228: }
	iret
;	./../../mib/stm8s_mib_it.c: 261: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
;	-----------------------------------------
;	 function TIM2_UPD_OVF_BRK_IRQHandler
;	-----------------------------------------
_TIM2_UPD_OVF_BRK_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 266: }
	iret
;	./../../mib/stm8s_mib_it.c: 273: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
;	-----------------------------------------
;	 function TIM2_CAP_COM_IRQHandler
;	-----------------------------------------
_TIM2_CAP_COM_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 278: }
	iret
;	./../../mib/stm8s_mib_it.c: 288: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
;	-----------------------------------------
;	 function TIM3_UPD_OVF_BRK_IRQHandler
;	-----------------------------------------
_TIM3_UPD_OVF_BRK_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 293: }
	iret
;	./../../mib/stm8s_mib_it.c: 300: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
;	-----------------------------------------
;	 function TIM3_CAP_COM_IRQHandler
;	-----------------------------------------
_TIM3_CAP_COM_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 305: }
	iret
;	./../../mib/stm8s_mib_it.c: 374: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
;	-----------------------------------------
;	 function I2C_IRQHandler
;	-----------------------------------------
_I2C_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 379: }
	iret
;	./../../mib/stm8s_mib_it.c: 387: INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
;	-----------------------------------------
;	 function UART2_TX_IRQHandler
;	-----------------------------------------
_UART2_TX_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 396: }
	iret
;	./../../mib/stm8s_mib_it.c: 403: INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
;	-----------------------------------------
;	 function UART2_RX_IRQHandler
;	-----------------------------------------
_UART2_RX_IRQHandler:
	clr	a
	div	x, a
;	./../../mib/stm8s_mib_it.c: 410: UART_RX_IRQHandler();
	call	_UART_RX_IRQHandler
;	./../../mib/stm8s_mib_it.c: 412: }
	iret
;	./../../mib/stm8s_mib_it.c: 461: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
;	-----------------------------------------
;	 function ADC1_IRQHandler
;	-----------------------------------------
_ADC1_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 466: }
	iret
;	./../../mib/stm8s_mib_it.c: 487: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
;	-----------------------------------------
;	 function TIM4_UPD_OVF_IRQHandler
;	-----------------------------------------
_TIM4_UPD_OVF_IRQHandler:
	clr	a
	div	x, a
;	./../../mib/stm8s_mib_it.c: 494: TIM4->SR1 = (uint8_t)(~TIM4_FLAG_UPDATE);
	mov	0x5342+0, #0xfe
;	./../../mib/stm8s_mib_it.c: 495: timIrqMain();  
	call	_timIrqMain
;	./../../mib/stm8s_mib_it.c: 497: }
	iret
;	./../../mib/stm8s_mib_it.c: 505: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
;	-----------------------------------------
;	 function EEPROM_EEC_IRQHandler
;	-----------------------------------------
_EEPROM_EEC_IRQHandler:
;	./../../mib/stm8s_mib_it.c: 510: }
	iret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
