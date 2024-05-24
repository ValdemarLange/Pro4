/***************************** Include files *******************************/
#include "emp_type.h"
/*****************************    Defines    *******************************/
#ifndef UART
  #define UART
/*****************************   Constants   *******************************/

/*****************************   Functions   *******************************/
void init_uart();
/*****************************************************************************
*   Input    : -
*   Output   : -
*   Function : Initializes the uart0
******************************************************************************/




void UART0_SendChar(INT8U data);
/*****************************************************************************
*   Input    : -
*   Output   : -
*   Function : sends data through UART
******************************************************************************/



char UART0_ReceiveChar();
/*****************************************************************************
*   Input    : -
*   Output   : -
*   Function : recives data from UART
******************************************************************************/


void UART0_Echo_task(void *pvParameters);




INT16U UART0_INT16_receive();

void UART0_SendFloat(FP32 data);

void UART0_SendInt32(INT32U data);
void UART0_SendInt16(INT16U data);

/****************************** End Of Module *******************************/

#endif
