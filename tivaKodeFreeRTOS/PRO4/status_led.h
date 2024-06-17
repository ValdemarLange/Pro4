/*****************************************************************************
* University of Southern Denmark
* Embedded C Programming (ECP)
*
* MODULENAME.: status led.h
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

#ifndef _STATUS_LED_H
  #define _STATUS_LED_H

/***************************** Include files *******************************/

/*****************************    Defines    *******************************/

/*****************************   Constants   *******************************/

/*****************************   Functions   *******************************/
void status_led_task(void *pvParameters);
/*****************************************************************************
*   Input    : 
*   Output   : 
*   Function : Board led is to a blink at a interval to see if the program stalls
******************************************************************************/

/****************************** End Of Module *******************************/
#endif

