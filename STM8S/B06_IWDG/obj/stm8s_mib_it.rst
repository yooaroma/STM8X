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
      008EC9                         74 _TRAP_IRQHandler:
                                     75 ;	./../../mib/stm8s_mib_it.c: 55: }
      008EC9 80               [11]   76 	iret
                                     77 ;	./../../mib/stm8s_mib_it.c: 62: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
                                     78 ;	-----------------------------------------
                                     79 ;	 function TLI_IRQHandler
                                     80 ;	-----------------------------------------
      008ECA                         81 _TLI_IRQHandler:
                                     82 ;	./../../mib/stm8s_mib_it.c: 67: }
      008ECA 80               [11]   83 	iret
                                     84 ;	./../../mib/stm8s_mib_it.c: 74: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
                                     85 ;	-----------------------------------------
                                     86 ;	 function AWU_IRQHandler
                                     87 ;	-----------------------------------------
      008ECB                         88 _AWU_IRQHandler:
                                     89 ;	./../../mib/stm8s_mib_it.c: 85: }
      008ECB 80               [11]   90 	iret
                                     91 ;	./../../mib/stm8s_mib_it.c: 92: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
                                     92 ;	-----------------------------------------
                                     93 ;	 function CLK_IRQHandler
                                     94 ;	-----------------------------------------
      008ECC                         95 _CLK_IRQHandler:
                                     96 ;	./../../mib/stm8s_mib_it.c: 97: }
      008ECC 80               [11]   97 	iret
                                     98 ;	./../../mib/stm8s_mib_it.c: 104: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
                                     99 ;	-----------------------------------------
                                    100 ;	 function EXTI_PORTA_IRQHandler
                                    101 ;	-----------------------------------------
      008ECD                        102 _EXTI_PORTA_IRQHandler:
                                    103 ;	./../../mib/stm8s_mib_it.c: 109: }
      008ECD 80               [11]  104 	iret
                                    105 ;	./../../mib/stm8s_mib_it.c: 116: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
                                    106 ;	-----------------------------------------
                                    107 ;	 function EXTI_PORTB_IRQHandler
                                    108 ;	-----------------------------------------
      008ECE                        109 _EXTI_PORTB_IRQHandler:
                                    110 ;	./../../mib/stm8s_mib_it.c: 121: }
      008ECE 80               [11]  111 	iret
                                    112 ;	./../../mib/stm8s_mib_it.c: 128: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
                                    113 ;	-----------------------------------------
                                    114 ;	 function EXTI_PORTC_IRQHandler
                                    115 ;	-----------------------------------------
      008ECF                        116 _EXTI_PORTC_IRQHandler:
                                    117 ;	./../../mib/stm8s_mib_it.c: 133: }
      008ECF 80               [11]  118 	iret
                                    119 ;	./../../mib/stm8s_mib_it.c: 140: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                    120 ;	-----------------------------------------
                                    121 ;	 function EXTI_PORTD_IRQHandler
                                    122 ;	-----------------------------------------
      008ED0                        123 _EXTI_PORTD_IRQHandler:
                                    124 ;	./../../mib/stm8s_mib_it.c: 145: }
      008ED0 80               [11]  125 	iret
                                    126 ;	./../../mib/stm8s_mib_it.c: 152: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
                                    127 ;	-----------------------------------------
                                    128 ;	 function EXTI_PORTE_IRQHandler
                                    129 ;	-----------------------------------------
      008ED1                        130 _EXTI_PORTE_IRQHandler:
                                    131 ;	./../../mib/stm8s_mib_it.c: 157: }
      008ED1 80               [11]  132 	iret
                                    133 ;	./../../mib/stm8s_mib_it.c: 204: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
                                    134 ;	-----------------------------------------
                                    135 ;	 function SPI_IRQHandler
                                    136 ;	-----------------------------------------
      008ED2                        137 _SPI_IRQHandler:
                                    138 ;	./../../mib/stm8s_mib_it.c: 209: }
      008ED2 80               [11]  139 	iret
                                    140 ;	./../../mib/stm8s_mib_it.c: 216: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
                                    141 ;	-----------------------------------------
                                    142 ;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                    143 ;	-----------------------------------------
      008ED3                        144 _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
                                    145 ;	./../../mib/stm8s_mib_it.c: 227: }
      008ED3 80               [11]  146 	iret
                                    147 ;	./../../mib/stm8s_mib_it.c: 234: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
                                    148 ;	-----------------------------------------
                                    149 ;	 function TIM1_CAP_COM_IRQHandler
                                    150 ;	-----------------------------------------
      008ED4                        151 _TIM1_CAP_COM_IRQHandler:
                                    152 ;	./../../mib/stm8s_mib_it.c: 245: }
      008ED4 80               [11]  153 	iret
                                    154 ;	./../../mib/stm8s_mib_it.c: 278: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
                                    155 ;	-----------------------------------------
                                    156 ;	 function TIM2_UPD_OVF_BRK_IRQHandler
                                    157 ;	-----------------------------------------
      008ED5                        158 _TIM2_UPD_OVF_BRK_IRQHandler:
                                    159 ;	./../../mib/stm8s_mib_it.c: 283: }
      008ED5 80               [11]  160 	iret
                                    161 ;	./../../mib/stm8s_mib_it.c: 290: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
                                    162 ;	-----------------------------------------
                                    163 ;	 function TIM2_CAP_COM_IRQHandler
                                    164 ;	-----------------------------------------
      008ED6                        165 _TIM2_CAP_COM_IRQHandler:
                                    166 ;	./../../mib/stm8s_mib_it.c: 295: }
      008ED6 80               [11]  167 	iret
                                    168 ;	./../../mib/stm8s_mib_it.c: 305: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
                                    169 ;	-----------------------------------------
                                    170 ;	 function TIM3_UPD_OVF_BRK_IRQHandler
                                    171 ;	-----------------------------------------
      008ED7                        172 _TIM3_UPD_OVF_BRK_IRQHandler:
                                    173 ;	./../../mib/stm8s_mib_it.c: 310: }
      008ED7 80               [11]  174 	iret
                                    175 ;	./../../mib/stm8s_mib_it.c: 317: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
                                    176 ;	-----------------------------------------
                                    177 ;	 function TIM3_CAP_COM_IRQHandler
                                    178 ;	-----------------------------------------
      008ED8                        179 _TIM3_CAP_COM_IRQHandler:
                                    180 ;	./../../mib/stm8s_mib_it.c: 322: }
      008ED8 80               [11]  181 	iret
                                    182 ;	./../../mib/stm8s_mib_it.c: 391: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
                                    183 ;	-----------------------------------------
                                    184 ;	 function I2C_IRQHandler
                                    185 ;	-----------------------------------------
      008ED9                        186 _I2C_IRQHandler:
                                    187 ;	./../../mib/stm8s_mib_it.c: 396: }
      008ED9 80               [11]  188 	iret
                                    189 ;	./../../mib/stm8s_mib_it.c: 404: INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
                                    190 ;	-----------------------------------------
                                    191 ;	 function UART2_TX_IRQHandler
                                    192 ;	-----------------------------------------
      008EDA                        193 _UART2_TX_IRQHandler:
                                    194 ;	./../../mib/stm8s_mib_it.c: 413: }
      008EDA 80               [11]  195 	iret
                                    196 ;	./../../mib/stm8s_mib_it.c: 420: INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
                                    197 ;	-----------------------------------------
                                    198 ;	 function UART2_RX_IRQHandler
                                    199 ;	-----------------------------------------
      008EDB                        200 _UART2_RX_IRQHandler:
      008EDB 4F               [ 1]  201 	clr	a
      008EDC 62               [ 2]  202 	div	x, a
                                    203 ;	./../../mib/stm8s_mib_it.c: 427: UART_RX_IRQHandler();
      008EDD CD 8E 98         [ 4]  204 	call	_UART_RX_IRQHandler
                                    205 ;	./../../mib/stm8s_mib_it.c: 429: }
      008EE0 80               [11]  206 	iret
                                    207 ;	./../../mib/stm8s_mib_it.c: 478: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
                                    208 ;	-----------------------------------------
                                    209 ;	 function ADC1_IRQHandler
                                    210 ;	-----------------------------------------
      008EE1                        211 _ADC1_IRQHandler:
                                    212 ;	./../../mib/stm8s_mib_it.c: 483: }
      008EE1 80               [11]  213 	iret
                                    214 ;	./../../mib/stm8s_mib_it.c: 504: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    215 ;	-----------------------------------------
                                    216 ;	 function TIM4_UPD_OVF_IRQHandler
                                    217 ;	-----------------------------------------
      008EE2                        218 _TIM4_UPD_OVF_IRQHandler:
      008EE2 4F               [ 1]  219 	clr	a
      008EE3 62               [ 2]  220 	div	x, a
                                    221 ;	./../../mib/stm8s_mib_it.c: 511: TIM4->SR1 = (uint8_t)(~TIM4_FLAG_UPDATE);
      008EE4 35 FE 53 42      [ 1]  222 	mov	0x5342+0, #0xfe
                                    223 ;	./../../mib/stm8s_mib_it.c: 512: timIrqMain();  
      008EE8 CD 96 FB         [ 4]  224 	call	_timIrqMain
                                    225 ;	./../../mib/stm8s_mib_it.c: 514: }
      008EEB 80               [11]  226 	iret
                                    227 ;	./../../mib/stm8s_mib_it.c: 522: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
                                    228 ;	-----------------------------------------
                                    229 ;	 function EEPROM_EEC_IRQHandler
                                    230 ;	-----------------------------------------
      008EEC                        231 _EEPROM_EEC_IRQHandler:
                                    232 ;	./../../mib/stm8s_mib_it.c: 527: }
      008EEC 80               [11]  233 	iret
                                    234 	.area CODE
                                    235 	.area CONST
                                    236 	.area INITIALIZER
                                    237 	.area CABS (ABS)
