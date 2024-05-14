/*****************************************************************************
* University of Southern Denmark
* Embedded C Programming (ECP)
*
* MODULENAME.: status led.h
*
* PROJECT....: EMP
*
* DESCRIPTION: Test.
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


void status_led_init(void);

void green_led_pot_task(void *pvParameters);
void yellow_led_pot_task(void *pvParameters);
void red_led_pot_task(void *pvParameters);

void status_led_task(void *pvParameters);


/****************************** End Of Module *******************************/
#endif

