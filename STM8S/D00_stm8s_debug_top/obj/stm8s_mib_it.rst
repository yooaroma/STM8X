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
      008989                         74 _TRAP_IRQHandler:
                                     75 ;	./../../mib/stm8s_mib_it.c: 55: }
      008989 80               [11]   76 	iret
                                     77 ;	./../../mib/stm8s_mib_it.c: 62: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
                                     78 ;	-----------------------------------------
                                     79 ;	 function TLI_IRQHandler
                                     80 ;	-----------------------------------------
      00898A                         81 _TLI_IRQHandler:
                                     82 ;	./../../mib/stm8s_mib_it.c: 68: }
      00898A 80               [11]   83 	iret
                                     84 ;	./../../mib/stm8s_mib_it.c: 75: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
                                     85 ;	-----------------------------------------
                                     86 ;	 function AWU_IRQHandler
                                     87 ;	-----------------------------------------
      00898B                         88 _AWU_IRQHandler:
                                     89 ;	./../../mib/stm8s_mib_it.c: 80: }
      00898B 80               [11]   90 	iret
                                     91 ;	./../../mib/stm8s_mib_it.c: 87: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
                                     92 ;	-----------------------------------------
                                     93 ;	 function CLK_IRQHandler
                                     94 ;	-----------------------------------------
      00898C                         95 _CLK_IRQHandler:
                                     96 ;	./../../mib/stm8s_mib_it.c: 92: }
      00898C 80               [11]   97 	iret
                                     98 ;	./../../mib/stm8s_mib_it.c: 99: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
                                     99 ;	-----------------------------------------
                                    100 ;	 function EXTI_PORTA_IRQHandler
                                    101 ;	-----------------------------------------
      00898D                        102 _EXTI_PORTA_IRQHandler:
                                    103 ;	./../../mib/stm8s_mib_it.c: 104: }
      00898D 80               [11]  104 	iret
                                    105 ;	./../../mib/stm8s_mib_it.c: 111: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
                                    106 ;	-----------------------------------------
                                    107 ;	 function EXTI_PORTB_IRQHandler
                                    108 ;	-----------------------------------------
      00898E                        109 _EXTI_PORTB_IRQHandler:
                                    110 ;	./../../mib/stm8s_mib_it.c: 116: }
      00898E 80               [11]  111 	iret
                                    112 ;	./../../mib/stm8s_mib_it.c: 123: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
                                    113 ;	-----------------------------------------
                                    114 ;	 function EXTI_PORTC_IRQHandler
                                    115 ;	-----------------------------------------
      00898F                        116 _EXTI_PORTC_IRQHandler:
                                    117 ;	./../../mib/stm8s_mib_it.c: 128: }
      00898F 80               [11]  118 	iret
                                    119 ;	./../../mib/stm8s_mib_it.c: 135: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                    120 ;	-----------------------------------------
                                    121 ;	 function EXTI_PORTD_IRQHandler
                                    122 ;	-----------------------------------------
      008990                        123 _EXTI_PORTD_IRQHandler:
                                    124 ;	./../../mib/stm8s_mib_it.c: 140: }
      008990 80               [11]  125 	iret
                                    126 ;	./../../mib/stm8s_mib_it.c: 147: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
                                    127 ;	-----------------------------------------
                                    128 ;	 function EXTI_PORTE_IRQHandler
                                    129 ;	-----------------------------------------
      008991                        130 _EXTI_PORTE_IRQHandler:
                                    131 ;	./../../mib/stm8s_mib_it.c: 152: }
      008991 80               [11]  132 	iret
                                    133 ;	./../../mib/stm8s_mib_it.c: 199: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
                                    134 ;	-----------------------------------------
                                    135 ;	 function SPI_IRQHandler
                                    136 ;	-----------------------------------------
      008992                        137 _SPI_IRQHandler:
                                    138 ;	./../../mib/stm8s_mib_it.c: 204: }
      008992 80               [11]  139 	iret
                                    140 ;	./../../mib/stm8s_mib_it.c: 211: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
                                    141 ;	-----------------------------------------
                                    142 ;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                    143 ;	-----------------------------------------
      008993                        144 _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
                                    145 ;	./../../mib/stm8s_mib_it.c: 216: }
      008993 80               [11]  146 	iret
                                    147 ;	./../../mib/stm8s_mib_it.c: 223: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
                                    148 ;	-----------------------------------------
                                    149 ;	 function TIM1_CAP_COM_IRQHandler
                                    150 ;	-----------------------------------------
      008994                        151 _TIM1_CAP_COM_IRQHandler:
                                    152 ;	./../../mib/stm8s_mib_it.c: 228: }
      008994 80               [11]  153 	iret
                                    154 ;	./../../mib/stm8s_mib_it.c: 261: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
                                    155 ;	-----------------------------------------
                                    156 ;	 function TIM2_UPD_OVF_BRK_IRQHandler
                                    157 ;	-----------------------------------------
      008995                        158 _TIM2_UPD_OVF_BRK_IRQHandler:
                                    159 ;	./../../mib/stm8s_mib_it.c: 266: }
      008995 80               [11]  160 	iret
                                    161 ;	./../../mib/stm8s_mib_it.c: 273: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
                                    162 ;	-----------------------------------------
                                    163 ;	 function TIM2_CAP_COM_IRQHandler
                                    164 ;	-----------------------------------------
      008996                        165 _TIM2_CAP_COM_IRQHandler:
                                    166 ;	./../../mib/stm8s_mib_it.c: 278: }
      008996 80               [11]  167 	iret
                                    168 ;	./../../mib/stm8s_mib_it.c: 288: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
                                    169 ;	-----------------------------------------
                                    170 ;	 function TIM3_UPD_OVF_BRK_IRQHandler
                                    171 ;	-----------------------------------------
      008997                        172 _TIM3_UPD_OVF_BRK_IRQHandler:
                                    173 ;	./../../mib/stm8s_mib_it.c: 293: }
      008997 80               [11]  174 	iret
                                    175 ;	./../../mib/stm8s_mib_it.c: 300: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
                                    176 ;	-----------------------------------------
                                    177 ;	 function TIM3_CAP_COM_IRQHandler
                                    178 ;	-----------------------------------------
      008998                        179 _TIM3_CAP_COM_IRQHandler:
                                    180 ;	./../../mib/stm8s_mib_it.c: 305: }
      008998 80               [11]  181 	iret
                                    182 ;	./../../mib/stm8s_mib_it.c: 374: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
                                    183 ;	-----------------------------------------
                                    184 ;	 function I2C_IRQHandler
                                    185 ;	-----------------------------------------
      008999                        186 _I2C_IRQHandler:
                                    187 ;	./../../mib/stm8s_mib_it.c: 379: }
      008999 80               [11]  188 	iret
                                    189 ;	./../../mib/stm8s_mib_it.c: 387: INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
                                    190 ;	-----------------------------------------
                                    191 ;	 function UART2_TX_IRQHandler
                                    192 ;	-----------------------------------------
      00899A                        193 _UART2_TX_IRQHandler:
                                    194 ;	./../../mib/stm8s_mib_it.c: 396: }
      00899A 80               [11]  195 	iret
                                    196 ;	./../../mib/stm8s_mib_it.c: 403: INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
                                    197 ;	-----------------------------------------
                                    198 ;	 function UART2_RX_IRQHandler
                                    199 ;	-----------------------------------------
      00899B                        200 _UART2_RX_IRQHandler:
      00899B 4F               [ 1]  201 	clr	a
      00899C 62               [ 2]  202 	div	x, a
                                    203 ;	./../../mib/stm8s_mib_it.c: 410: UART_RX_IRQHandler();
      00899D CD 89 58         [ 4]  204 	call	_UART_RX_IRQHandler
                                    205 ;	./../../mib/stm8s_mib_it.c: 412: }
      0089A0 80               [11]  206 	iret
                                    207 ;	./../../mib/stm8s_mib_it.c: 461: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
                                    208 ;	-----------------------------------------
                                    209 ;	 function ADC1_IRQHandler
                                    210 ;	-----------------------------------------
      0089A1                        211 _ADC1_IRQHandler:
                                    212 ;	./../../mib/stm8s_mib_it.c: 466: }
      0089A1 80               [11]  213 	iret
                                    214 ;	./../../mib/stm8s_mib_it.c: 487: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    215 ;	-----------------------------------------
                                    216 ;	 function TIM4_UPD_OVF_IRQHandler
                                    217 ;	-----------------------------------------
      0089A2                        218 _TIM4_UPD_OVF_IRQHandler:
      0089A2 4F               [ 1]  219 	clr	a
      0089A3 62               [ 2]  220 	div	x, a
                                    221 ;	./../../mib/stm8s_mib_it.c: 494: TIM4->SR1 = (uint8_t)(~TIM4_FLAG_UPDATE);
      0089A4 35 FE 53 42      [ 1]  222 	mov	0x5342+0, #0xfe
                                    223 ;	./../../mib/stm8s_mib_it.c: 495: timIrqMain();  
      0089A8 CD 91 BA         [ 4]  224 	call	_timIrqMain
                                    225 ;	./../../mib/stm8s_mib_it.c: 497: }
      0089AB 80               [11]  226 	iret
                                    227 ;	./../../mib/stm8s_mib_it.c: 505: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
                                    228 ;	-----------------------------------------
                                    229 ;	 function EEPROM_EEC_IRQHandler
                                    230 ;	-----------------------------------------
      0089AC                        231 _EEPROM_EEC_IRQHandler:
                                    232 ;	./../../mib/stm8s_mib_it.c: 510: }
      0089AC 80               [11]  233 	iret
                                    234 	.area CODE
                                    235 	.area CONST
                                    236 	.area INITIALIZER
                                    237 	.area CABS (ABS)
