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
      00A846                         74 _TRAP_IRQHandler:
                                     75 ;	./../../mib/stm8s_mib_it.c: 55: }
      00A846 80               [11]   76 	iret
                                     77 ;	./../../mib/stm8s_mib_it.c: 62: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
                                     78 ;	-----------------------------------------
                                     79 ;	 function TLI_IRQHandler
                                     80 ;	-----------------------------------------
      00A847                         81 _TLI_IRQHandler:
                                     82 ;	./../../mib/stm8s_mib_it.c: 67: }
      00A847 80               [11]   83 	iret
                                     84 ;	./../../mib/stm8s_mib_it.c: 74: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
                                     85 ;	-----------------------------------------
                                     86 ;	 function AWU_IRQHandler
                                     87 ;	-----------------------------------------
      00A848                         88 _AWU_IRQHandler:
                                     89 ;	./../../mib/stm8s_mib_it.c: 85: }
      00A848 80               [11]   90 	iret
                                     91 ;	./../../mib/stm8s_mib_it.c: 92: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
                                     92 ;	-----------------------------------------
                                     93 ;	 function CLK_IRQHandler
                                     94 ;	-----------------------------------------
      00A849                         95 _CLK_IRQHandler:
                                     96 ;	./../../mib/stm8s_mib_it.c: 97: }
      00A849 80               [11]   97 	iret
                                     98 ;	./../../mib/stm8s_mib_it.c: 104: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
                                     99 ;	-----------------------------------------
                                    100 ;	 function EXTI_PORTA_IRQHandler
                                    101 ;	-----------------------------------------
      00A84A                        102 _EXTI_PORTA_IRQHandler:
                                    103 ;	./../../mib/stm8s_mib_it.c: 109: }
      00A84A 80               [11]  104 	iret
                                    105 ;	./../../mib/stm8s_mib_it.c: 116: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
                                    106 ;	-----------------------------------------
                                    107 ;	 function EXTI_PORTB_IRQHandler
                                    108 ;	-----------------------------------------
      00A84B                        109 _EXTI_PORTB_IRQHandler:
                                    110 ;	./../../mib/stm8s_mib_it.c: 121: }
      00A84B 80               [11]  111 	iret
                                    112 ;	./../../mib/stm8s_mib_it.c: 128: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
                                    113 ;	-----------------------------------------
                                    114 ;	 function EXTI_PORTC_IRQHandler
                                    115 ;	-----------------------------------------
      00A84C                        116 _EXTI_PORTC_IRQHandler:
                                    117 ;	./../../mib/stm8s_mib_it.c: 133: }
      00A84C 80               [11]  118 	iret
                                    119 ;	./../../mib/stm8s_mib_it.c: 140: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                    120 ;	-----------------------------------------
                                    121 ;	 function EXTI_PORTD_IRQHandler
                                    122 ;	-----------------------------------------
      00A84D                        123 _EXTI_PORTD_IRQHandler:
                                    124 ;	./../../mib/stm8s_mib_it.c: 145: }
      00A84D 80               [11]  125 	iret
                                    126 ;	./../../mib/stm8s_mib_it.c: 152: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
                                    127 ;	-----------------------------------------
                                    128 ;	 function EXTI_PORTE_IRQHandler
                                    129 ;	-----------------------------------------
      00A84E                        130 _EXTI_PORTE_IRQHandler:
                                    131 ;	./../../mib/stm8s_mib_it.c: 157: }
      00A84E 80               [11]  132 	iret
                                    133 ;	./../../mib/stm8s_mib_it.c: 204: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
                                    134 ;	-----------------------------------------
                                    135 ;	 function SPI_IRQHandler
                                    136 ;	-----------------------------------------
      00A84F                        137 _SPI_IRQHandler:
                                    138 ;	./../../mib/stm8s_mib_it.c: 209: }
      00A84F 80               [11]  139 	iret
                                    140 ;	./../../mib/stm8s_mib_it.c: 216: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
                                    141 ;	-----------------------------------------
                                    142 ;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                    143 ;	-----------------------------------------
      00A850                        144 _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
      00A850 4F               [ 1]  145 	clr	a
      00A851 62               [ 2]  146 	div	x, a
                                    147 ;	./../../mib/stm8s_mib_it.c: 224: irqTim1UpdOvf_CALLBACK();
      00A852 CD 96 DB         [ 4]  148 	call	_irqTim1UpdOvf_CALLBACK
                                    149 ;	./../../mib/stm8s_mib_it.c: 227: }
      00A855 80               [11]  150 	iret
                                    151 ;	./../../mib/stm8s_mib_it.c: 234: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
                                    152 ;	-----------------------------------------
                                    153 ;	 function TIM1_CAP_COM_IRQHandler
                                    154 ;	-----------------------------------------
      00A856                        155 _TIM1_CAP_COM_IRQHandler:
      00A856 4F               [ 1]  156 	clr	a
      00A857 62               [ 2]  157 	div	x, a
                                    158 ;	./../../mib/stm8s_mib_it.c: 242: irqTim1Cap_CALLBACK();
      00A858 CD 96 DC         [ 4]  159 	call	_irqTim1Cap_CALLBACK
                                    160 ;	./../../mib/stm8s_mib_it.c: 245: }
      00A85B 80               [11]  161 	iret
                                    162 ;	./../../mib/stm8s_mib_it.c: 278: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
                                    163 ;	-----------------------------------------
                                    164 ;	 function TIM2_UPD_OVF_BRK_IRQHandler
                                    165 ;	-----------------------------------------
      00A85C                        166 _TIM2_UPD_OVF_BRK_IRQHandler:
                                    167 ;	./../../mib/stm8s_mib_it.c: 283: }
      00A85C 80               [11]  168 	iret
                                    169 ;	./../../mib/stm8s_mib_it.c: 290: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
                                    170 ;	-----------------------------------------
                                    171 ;	 function TIM2_CAP_COM_IRQHandler
                                    172 ;	-----------------------------------------
      00A85D                        173 _TIM2_CAP_COM_IRQHandler:
                                    174 ;	./../../mib/stm8s_mib_it.c: 295: }
      00A85D 80               [11]  175 	iret
                                    176 ;	./../../mib/stm8s_mib_it.c: 305: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
                                    177 ;	-----------------------------------------
                                    178 ;	 function TIM3_UPD_OVF_BRK_IRQHandler
                                    179 ;	-----------------------------------------
      00A85E                        180 _TIM3_UPD_OVF_BRK_IRQHandler:
                                    181 ;	./../../mib/stm8s_mib_it.c: 310: }
      00A85E 80               [11]  182 	iret
                                    183 ;	./../../mib/stm8s_mib_it.c: 317: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
                                    184 ;	-----------------------------------------
                                    185 ;	 function TIM3_CAP_COM_IRQHandler
                                    186 ;	-----------------------------------------
      00A85F                        187 _TIM3_CAP_COM_IRQHandler:
                                    188 ;	./../../mib/stm8s_mib_it.c: 322: }
      00A85F 80               [11]  189 	iret
                                    190 ;	./../../mib/stm8s_mib_it.c: 391: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
                                    191 ;	-----------------------------------------
                                    192 ;	 function I2C_IRQHandler
                                    193 ;	-----------------------------------------
      00A860                        194 _I2C_IRQHandler:
                                    195 ;	./../../mib/stm8s_mib_it.c: 396: }
      00A860 80               [11]  196 	iret
                                    197 ;	./../../mib/stm8s_mib_it.c: 404: INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
                                    198 ;	-----------------------------------------
                                    199 ;	 function UART2_TX_IRQHandler
                                    200 ;	-----------------------------------------
      00A861                        201 _UART2_TX_IRQHandler:
                                    202 ;	./../../mib/stm8s_mib_it.c: 413: }
      00A861 80               [11]  203 	iret
                                    204 ;	./../../mib/stm8s_mib_it.c: 420: INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
                                    205 ;	-----------------------------------------
                                    206 ;	 function UART2_RX_IRQHandler
                                    207 ;	-----------------------------------------
      00A862                        208 _UART2_RX_IRQHandler:
      00A862 4F               [ 1]  209 	clr	a
      00A863 62               [ 2]  210 	div	x, a
                                    211 ;	./../../mib/stm8s_mib_it.c: 427: UART_RX_IRQHandler();
      00A864 CD A8 15         [ 4]  212 	call	_UART_RX_IRQHandler
                                    213 ;	./../../mib/stm8s_mib_it.c: 429: }
      00A867 80               [11]  214 	iret
                                    215 ;	./../../mib/stm8s_mib_it.c: 478: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
                                    216 ;	-----------------------------------------
                                    217 ;	 function ADC1_IRQHandler
                                    218 ;	-----------------------------------------
      00A868                        219 _ADC1_IRQHandler:
                                    220 ;	./../../mib/stm8s_mib_it.c: 483: }
      00A868 80               [11]  221 	iret
                                    222 ;	./../../mib/stm8s_mib_it.c: 504: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    223 ;	-----------------------------------------
                                    224 ;	 function TIM4_UPD_OVF_IRQHandler
                                    225 ;	-----------------------------------------
      00A869                        226 _TIM4_UPD_OVF_IRQHandler:
      00A869 4F               [ 1]  227 	clr	a
      00A86A 62               [ 2]  228 	div	x, a
                                    229 ;	./../../mib/stm8s_mib_it.c: 511: TIM4->SR1 = (uint8_t)(~TIM4_FLAG_UPDATE);
      00A86B 35 FE 53 42      [ 1]  230 	mov	0x5342+0, #0xfe
                                    231 ;	./../../mib/stm8s_mib_it.c: 512: timIrqMain();  
      00A86F CD B0 82         [ 4]  232 	call	_timIrqMain
                                    233 ;	./../../mib/stm8s_mib_it.c: 514: }
      00A872 80               [11]  234 	iret
                                    235 ;	./../../mib/stm8s_mib_it.c: 522: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
                                    236 ;	-----------------------------------------
                                    237 ;	 function EEPROM_EEC_IRQHandler
                                    238 ;	-----------------------------------------
      00A873                        239 _EEPROM_EEC_IRQHandler:
                                    240 ;	./../../mib/stm8s_mib_it.c: 527: }
      00A873 80               [11]  241 	iret
                                    242 	.area CODE
                                    243 	.area CONST
                                    244 	.area INITIALIZER
                                    245 	.area CABS (ABS)
