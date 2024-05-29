/*****************************************************************************
* University of Southern Denmark
* Embedded C Programming (ECP)
*
* MODULENAME.: leds.c
*
* PROJECT....: ECP
*
* DESCRIPTION: See module specification file (.h-file).
*
* Change Log:
******************************************************************************
* Date    Id    Change
* YYMMDD
* --------------------
* 050128  KA    Module created.
*
*****************************************************************************/

/***************************** Include files *******************************/
#include <stdint.h>
#include "tm4c123gh6pm.h"
#include "FreeRTOS.h"
#include "Task.h"
#include "queue.h"
#include "semphr.h"
#include "emp_type.h"
#include "status_led.h"
#include "gpio.h"


/*****************************    Defines    *******************************/
#define RED_LED		0x02

/*****************************   Constants   *******************************/

/*****************************   Variables   *******************************/

/*****************************   Functions   *******************************/


void status_led_task(void *pvParameters)
/*****************************************************************************
*   Function : See module specification (.h-file).
*****************************************************************************/
{
  while(1)
  {
    // Toggle status led
    GPIO_PORTF_DATA_R ^= RED_LED;
    vTaskDelay(500 / portTICK_RATE_MS); // wait 500 ms.
  }
}

/****************************** End Of Module *******************************/




