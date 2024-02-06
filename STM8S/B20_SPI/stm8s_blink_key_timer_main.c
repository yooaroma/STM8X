/**
  ******************************************************************************
  * @file stm8s_blink_key_timer_main.c
  * @brief Depending on the key input, the LED blinks using the timer inside the chip.
  * @author MYMEDIA Co., Ltd.
  * @version V1.0.0
  * @date 2023.1.6
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Hardware define */
/*
  PD0 : LED1
  PB5 : KEY1 
  PD7 : 485_DIR
  PD5 : TXD
  PD6 : RXD
  PB7 : AIN7 : JOYSTICK
  PC7 : SPI_MISO
  PC6 : SPI_MOSI
  PC5 : SPI_CLK
  PE5 : SPI_NSS
  PE1 : I2C_SCL
  PE2 : I2C_SDA
*/
#define UCOM_LED1_GPIO    GPIOD        // PD0
#define UCOM_LED1_PIN     GPIO_PIN_0   // PD0
#define UCOM_LED1_MODE    GPIO_MODE_OUT_PP_LOW_FAST
#define UCOM_KEY1_GPIO    GPIOB        // PB5
#define UCOM_KEY1_PIN     GPIO_PIN_5   // PB5
#define UCOM_KEY1_MODE    GPIO_MODE_IN_PU_NO_IT // GPIO_MODE_IN_FL_NO_IT
#define UCOM_485_GPIO     GPIOD        // PD7
#define UCOM_485_PIN      GPIO_PIN_7   // PD7
#define UCOM_485_MODE     GPIO_MODE_OUT_PP_LOW_FAST
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
void CLK_Configuration(void);
void GPIO_Configuration(void);
void Toggle(void);
/* Private functions ---------------------------------------------------------*/
/* Global variables ----------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/
/**
  ******************************************************************************
  * @brief Main function.
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  ******************************************************************************
  */
void main(void)
{
  {
    /* Configures clocks */
    CLK_Configuration();

    /* Configures GPIOs */
    GPIO_Configuration();
    
    /* Configures TIM4 */
    TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
    TIM4_Cmd(ENABLE);
  }
  {    
    uint32_t vdwDelay = 500; // 500msec
    do {
      if((UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)==0)
      {
        UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN;
        vdwDelay = 500; // 500msec
      }
      else
      {
        // UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR | UCOM_LED1_PIN;
        if(TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == SET)
        {
          TIM4_SetCounter(0);
          TIM4_ClearFlag(TIM4_FLAG_UPDATE);
          if(vdwDelay) vdwDelay--;
        }
        if(vdwDelay==0)
        {
          vdwDelay = 500; // 500msec
          Toggle();
        }
      }
    } while(1);
  }
}

/**
  ******************************************************************************
  * @brief Configures clocks
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  ******************************************************************************
  */
void CLK_Configuration(void)
{

  /* Fmaster = 16MHz */
  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);

}

/**
  ******************************************************************************
  * @brief Configures GPIOs
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  ******************************************************************************
  */
void GPIO_Configuration(void)
{
  /* GPIOD reset */
  GPIO_DeInit(UCOM_LED1_GPIO);

  /* Configure PD0 (LED1) as output push-pull low (led switched on) */
  GPIO_Init(UCOM_LED1_GPIO, UCOM_LED1_PIN, UCOM_LED1_MODE);

  
  GPIO_DeInit(UCOM_KEY1_GPIO);
  /* Configure PA3 : KEY IN as input push-pull low (led switched on) */
  GPIO_Init(UCOM_KEY1_GPIO, UCOM_KEY1_PIN, UCOM_KEY1_MODE);

}

/**
  ******************************************************************************
  * @brief Toggle PD0 (Led LD1)
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  ******************************************************************************
  */
void Toggle(void)
{
  GPIO_WriteReverse(UCOM_LED1_GPIO, UCOM_LED1_PIN);
}
/****************** (c) 2008  STMicroelectronics ******************************/
