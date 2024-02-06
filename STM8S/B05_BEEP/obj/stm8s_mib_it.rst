                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.2.10 #13778 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_mib_it
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TRAP_IRQHandler
                                     12 	.globl _TLI_IRQHandler
                                     13 	.globl _AWU_IRQHandler
                                     14 	.globl _CLK_IRQHandler
                                     15 	.globl _EXTI_PORTA_IRQHandler
                                     16 	.globl _EXTI_PORTB_IRQHandler
                                     17 	.globl _EXTI_PORTC_IRQHandler
                                     18 	.globl _EXTI_PORTD_IRQHandler
                                     19 	.globl _EXTI_PORTE_IRQHandler
                                     20 	.globl _SPI_IRQHandler
                                     21 	.globl _TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                     22 	.globl _TIM1_CAP_COM_IRQHandler
                                     23 	.globl _TIM2_UPD_OVF_BRK_IRQHandler
                                     24 	.globl _TIM2_CAP_COM_IRQHandler
                                     25 	.globl _TIM3_UPD_OVF_BRK_IRQHandler
                                     26 	.globl _TIM3_CAP_COM_IRQHandler
                                     27 	.globl _I2C_IRQHandler
                                     28 	.globl _UART2_TX_IRQHandler
                                     29 	.globl _UART2_RX_IRQHandler
                                     30 	.globl _ADC1_IRQHandler
                                     31 	.globl _TIM4_UPD_OVF_IRQHandler
                                     32 	.globl _EEPROM_EEC_IRQHandler
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area DATA
                                     37 ;--------------------------------------------------------
                                     38 ; ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area INITIALIZED
                                     41 ;--------------------------------------------------------
                                     42 ; absolute external ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area DABS (ABS)
                                     45 
                                     46 ; default segment ordering for linker
                                     47 	.area HOME
                                     48 	.area GSINIT
                                     49 	.area GSFINAL
                                     50 	.area CONST
                                     51 	.area INITIALIZER
                                     52 	.area CODE
                                     53 
                                     54 ;--------------------------------------------------------
                                     55 ; global & static initialisations
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
                                     58 	.area GSINIT
                                     59 	.area GSFINAL
                                     60 	.area GSINIT
                                     61 ;--------------------------------------------------------
                                     62 ; Home
                                     63 ;--------------------------------------------------------
                                     64 	.area HOME
                                     65 	.area HOME
                                     66 ;--------------------------------------------------------
                                     67 ; code
                                     68 ;--------------------------------------------------------
                                     69 	.area CODE
                                     70 ;	./../../mib/stm8s_mib_it.c: 50: INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
                                     71 ;	-----------------------------------------
                                     72 ;	 function TRAP_IRQHandler
                                     73 ;	-----------------------------------------
      0097D2                         74 _TRAP_IRQHandler:
                                     75 ;	./../../mib/stm8s_mib_it.c: 55: }
      0097D2 80               [11]   76 	iret
                                     77 ;	./../../mib/stm8s_mib_it.c: 62: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
                                     78 ;	-----------------------------------------
                                     79 ;	 function TLI_IRQHandler
                                     80 ;	-----------------------------------------
      0097D3                         81 _TLI_IRQHandler:
                                     82 ;	./../../mib/stm8s_mib_it.c: 67: }
      0097D3 80               [11]   83 	iret
                                     84 ;	./../../mib/stm8s_mib_it.c: 74: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
                                     85 ;	-----------------------------------------
                                     86 ;	 function AWU_IRQHandler
                                     87 ;	-----------------------------------------
      0097D4                         88 _AWU_IRQHandler:
                                     89 ;	./../../mib/stm8s_mib_it.c: 85: }
      0097D4 80               [11]   90 	iret
                                     91 ;	./../../mib/stm8s_mib_it.c: 92: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
                                     92 ;	-----------------------------------------
                                     93 ;	 function CLK_IRQHandler
                                     94 ;	-----------------------------------------
      0097D5                         95 _CLK_IRQHandler:
                                     96 ;	./../../mib/stm8s_mib_it.c: 97: }
      0097D5 80               [11]   97 	iret
                                     98 ;	./../../mib/stm8s_mib_it.c: 104: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
                                     99 ;	-----------------------------------------
                                    100 ;	 function EXTI_PORTA_IRQHandler
                                    101 ;	-----------------------------------------
      0097D6                        102 _EXTI_PORTA_IRQHandler:
                                    103 ;	./../../mib/stm8s_mib_it.c: 109: }
      0097D6 80               [11]  104 	iret
                                    105 ;	./../../mib/stm8s_mib_it.c: 116: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
                                    106 ;	-----------------------------------------
                                    107 ;	 function EXTI_PORTB_IRQHandler
                                    108 ;	-----------------------------------------
      0097D7                        109 _EXTI_PORTB_IRQHandler:
                                    110 ;	./../../mib/stm8s_mib_it.c: 121: }
      0097D7 80               [11]  111 	iret
                                    112 ;	./../../mib/stm8s_mib_it.c: 128: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
                                    113 ;	-----------------------------------------
                                    114 ;	 function EXTI_PORTC_IRQHandler
                                    115 ;	-----------------------------------------
      0097D8                        116 _EXTI_PORTC_IRQHandler:
                                    117 ;	./../../mib/stm8s_mib_it.c: 133: }
      0097D8 80               [11]  118 	iret
                                    119 ;	./../../mib/stm8s_mib_it.c: 140: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                    120 ;	-----------------------------------------
                                    121 ;	 function EXTI_PORTD_IRQHandler
                                    122 ;	-----------------------------------------
      0097D9                        123 _EXTI_PORTD_IRQHandler:
                                    124 ;	./../../mib/stm8s_mib_it.c: 145: }
      0097D9 80               [11]  125 	iret
                                    126 ;	./../../mib/stm8s_mib_it.c: 152: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
                                    127 ;	-----------------------------------------
                                    128 ;	 function EXTI_PORTE_IRQHandler
                                    129 ;	-----------------------------------------
      0097DA                        130 _EXTI_PORTE_IRQHandler:
                                    131 ;	./../../mib/stm8s_mib_it.c: 157: }
      0097DA 80               [11]  132 	iret
                                    133 ;	./../../mib/stm8s_mib_it.c: 204: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
                                    134 ;	-----------------------------------------
                                    135 ;	 function SPI_IRQHandler
                                    136 ;	-----------------------------------------
      0097DB                        137 _SPI_IRQHandler:
                                    138 ;	./../../mib/stm8s_mib_it.c: 209: }
      0097DB 80               [11]  139 	iret
                                    140 ;	./../../mib/stm8s_mib_it.c: 216: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
                                    141 ;	-----------------------------------------
                                    142 ;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                    143 ;	-----------------------------------------
      0097DC                        144 _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
                                    145 ;	./../../mib/stm8s_mib_it.c: 227: }
      0097DC 80               [11]  146 	iret
                                    147 ;	./../../mib/stm8s_mib_it.c: 234: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
                                    148 ;	-----------------------------------------
                                    149 ;	 function TIM1_CAP_COM_IRQHandler
                                    150 ;	-----------------------------------------
      0097DD                        151 _TIM1_CAP_COM_IRQHandler:
                                    152 ;	./../../mib/stm8s_mib_it.c: 245: }
      0097DD 80               [11]  153 	iret
                                    154 ;	./../../mib/stm8s_mib_it.c: 278: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
                                    155 ;	-----------------------------------------
                                    156 ;	 function TIM2_UPD_OVF_BRK_IRQHandler
                                    157 ;	-----------------------------------------
      0097DE                        158 _TIM2_UPD_OVF_BRK_IRQHandler:
                                    159 ;	./../../mib/stm8s_mib_it.c: 283: }
      0097DE 80               [11]  160 	iret
                                    161 ;	./../../mib/stm8s_mib_it.c: 290: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
                                    162 ;	-----------------------------------------
                                    163 ;	 function TIM2_CAP_COM_IRQHandler
                                    164 ;	-----------------------------------------
      0097DF                        165 _TIM2_CAP_COM_IRQHandler:
                                    166 ;	./../../mib/stm8s_mib_it.c: 295: }
      0097DF 80               [11]  167 	iret
                                    168 ;	./../../mib/stm8s_mib_it.c: 305: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
                                    169 ;	-----------------------------------------
                                    170 ;	 function TIM3_UPD_OVF_BRK_IRQHandler
                                    171 ;	-----------------------------------------
      0097E0                        172 _TIM3_UPD_OVF_BRK_IRQHandler:
                                    173 ;	./../../mib/stm8s_mib_it.c: 310: }
      0097E0 80               [11]  174 	iret
                                    175 ;	./../../mib/stm8s_mib_it.c: 317: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
                                    176 ;	-----------------------------------------
                                    177 ;	 function TIM3_CAP_COM_IRQHandler
                                    178 ;	-----------------------------------------
      0097E1                        179 _TIM3_CAP_COM_IRQHandler:
                                    180 ;	./../../mib/stm8s_mib_it.c: 322: }
      0097E1 80               [11]  181 	iret
                                    182 ;	./../../mib/stm8s_mib_it.c: 391: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
                                    183 ;	-----------------------------------------
                                    184 ;	 function I2C_IRQHandler
                                    185 ;	-----------------------------------------
      0097E2                        186 _I2C_IRQHandler:
                                    187 ;	./../../mib/stm8s_mib_it.c: 396: }
      0097E2 80               [11]  188 	iret
                                    189 ;	./../../mib/stm8s_mib_it.c: 404: INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
                                    190 ;	-----------------------------------------
                                    191 ;	 function UART2_TX_IRQHandler
                                    192 ;	-----------------------------------------
      0097E3                        193 _UART2_TX_IRQHandler:
                                    194 ;	./../../mib/stm8s_mib_it.c: 413: }
      0097E3 80               [11]  195 	iret
                                    196 ;	./../../mib/stm8s_mib_it.c: 420: INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
                                    197 ;	-----------------------------------------
                                    198 ;	 function UART2_RX_IRQHandler
                                    199 ;	-----------------------------------------
      0097E4                        200 _UART2_RX_IRQHandler:
      0097E4 4F               [ 1]  201 	clr	a
      0097E5 62               [ 2]  202 	div	x, a
                                    203 ;	./../../mib/stm8s_mib_it.c: 427: UART_RX_IRQHandler();
      0097E6 CD 97 A1         [ 4]  204 	call	_UART_RX_IRQHandler
                                    205 ;	./../../mib/stm8s_mib_it.c: 429: }
      0097E9 80               [11]  206 	iret
                                    207 ;	./../../mib/stm8s_mib_it.c: 478: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
                                    208 ;	-----------------------------------------
                                    209 ;	 function ADC1_IRQHandler
                                    210 ;	-----------------------------------------
      0097EA                        211 _ADC1_IRQHandler:
                                    212 ;	./../../mib/stm8s_mib_it.c: 483: }
      0097EA 80               [11]  213 	iret
                                    214 ;	./../../mib/stm8s_mib_it.c: 504: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    215 ;	-----------------------------------------
                                    216 ;	 function TIM4_UPD_OVF_IRQHandler
                                    217 ;	-----------------------------------------
      0097EB                        218 _TIM4_UPD_OVF_IRQHandler:
      0097EB 4F               [ 1]  219 	clr	a
      0097EC 62               [ 2]  220 	div	x, a
                                    221 ;	./../../mib/stm8s_mib_it.c: 511: TIM4->SR1 = (uint8_t)(~TIM4_FLAG_UPDATE);
      0097ED 35 FE 53 42      [ 1]  222 	mov	0x5342+0, #0xfe
                                    223 ;	./../../mib/stm8s_mib_it.c: 512: timIrqMain();  
      0097F1 CD A0 04         [ 4]  224 	call	_timIrqMain
                                    225 ;	./../../mib/stm8s_mib_it.c: 514: }
      0097F4 80               [11]  226 	iret
                                    227 ;	./../../mib/stm8s_mib_it.c: 522: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
                                    228 ;	-----------------------------------------
                                    229 ;	 function EEPROM_EEC_IRQHandler
                                    230 ;	-----------------------------------------
      0097F5                        231 _EEPROM_EEC_IRQHandler:
                                    232 ;	./../../mib/stm8s_mib_it.c: 527: }
      0097F5 80               [11]  233 	iret
                                    234 	.area CODE
                                    235 	.area CONST
                                    236 	.area INITIALIZER
                                    237 	.area CABS (ABS)
