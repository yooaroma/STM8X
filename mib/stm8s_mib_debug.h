//
//
//  file name : mm8s_debug.h
//  designed by yooaroma  // yooaroma 2018-01-16 PM 10:27:55
//	date : 2006. 4. 11.
//
//
/* Includes */
#include "stm8s.h"

//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
#ifndef __STM8S_MIB_DEBUG_H
#define __STM8S_MIB_DEBUG_H
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
#ifdef __cplusplus
 extern "C" {
#endif
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
/**********************************************************/
// global variable
/**********************************************************/
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
//#define UART_IRQ_RX_USE          0
//#define UART_IRQ_TX_USE       0
//#define UCOM_485_USE	        0
#define MIB_DEBUG_COM_ERROR   (0xffff)
#define MIB_DEBUG_READ_NODATA (0xffff)
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
void MibDebugInit(uint32_t baudrate);
void MibWriteDebugByte(uint8_t c);
void MibWriteDebugByte485(uint8_t c);
void MibWriteDebugString( uint8_t *v_pStr );
void MibWriteDebugStringN( uint8_t *v_pStr, uint8_t nSize );
void MibWriteDebugTransmitHex( uint8_t data );
void MibWriteDebugTransmitHex2( uint8_t data );
uint16_t MibReadDebugByte( void );
void MibWriteDebugEmptyCheck(void);

//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
// DumpReg((UINT32 *)g_pV210IOPregs,(UINT32 sizeof(GPIO_REG),(char *)"GPIO:g_pV210IOPregs");
// RETAILMSG(_DEBUG_CMD_A_,(TEXT("INFO:[%d]\r\n"),aaa));
//#define TEXT
//#define RETAILMSG(cond,printf_exp)      ((cond)?(yprintf printf_exp),1:0)
//#define mprintf(cond,printf_exp)      ((cond)?(yprintf printf_exp),1:0)
//#define MibWriteDebugStringCheck(cond,printf_exp)      
//#define MibWriteDebugTransmitHex2Check(cond,printf_exp)   
#define MibWriteDebugStringCheck(cond,printf_exp)      ((cond)?(MibWriteDebugString (printf_exp)),1:0)
#define MibWriteDebugTransmitHex2Check(cond,printf_exp)      ((cond)?(MibWriteDebugTransmitHex2 (printf_exp)),1:0)
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
#ifdef __cplusplus
}
#endif
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
#endif /* __STM8S_MIB_DEBUG_H */
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------  

