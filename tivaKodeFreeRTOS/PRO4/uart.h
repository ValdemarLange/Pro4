/*****************************************************************************
* University of Southern Denmark
* Embedded C Programming (ECP)
*
* MODULENAME.: uart.h
*
* PROJECT....: Semester 4 project
*
* DESCRIPTION: 
*
* Change Log:
******************************************************************************
* Date    Id    Change
* YYMMDD
* --------------------
* 100408  KHA    Module created.
*
*****************************************************************************/


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
*   Input    : Data to be sent
*   Output   : Transmission through UART
*   Function : Sends data through UART
******************************************************************************/

char UART0_ReceiveChar();
/*****************************************************************************
*   Input    : Transmission from UART
*   Output   : Received chars
*   Function : Recives data from UART
******************************************************************************/

INT16U UART0_INT16_receive();
/*****************************************************************************
*   Input    : Transmission from UART
*   Output   : Received 16 bit integer
*   Function : Recives a 16 bit integer from UART using UART0_ReceiveChar
******************************************************************************/

void UART0_SendInt16(INT16U data);
/*****************************************************************************
*   Input    : Data to be sent
*   Output   : Transmission through UART
*   Function : Sends a 16 bit integer through UART using UART0_SendChar
******************************************************************************/


/****************************** End Of Module *******************************/
#endif