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
//#include "glob_def.h"
//#include "binary.h"
#include "status_led.h"
#include "gpio.h"


/*****************************    Defines    *******************************/
#define PF0		0		// Bit 0

/*****************************   Constants   *******************************/

/*****************************   Variables   *******************************/

/*****************************   Functions   *******************************/

void status_led_init(void)
/*****************************************************************************
*   Input    : 	-
*   Output   : 	-
*   Function : 	
*****************************************************************************/
{
  INT8S dummy;
  // Enable the GPIO port that is used for the on-board LED.
  SYSCTL_RCGC2_R |= SYSCTL_RCGC2_GPIOD;

  // Do a dummy read to insert a few cycles after enabling the peripheral.
  dummy = SYSCTL_RCGC2_R;

  GPIO_PORTD_DIR_R |= 0x40;
  GPIO_PORTD_DEN_R |= 0x40;
}


void green_led_pot_task(void *pvParameters)
{
    init_gpio();
    while(1)
    {
            GPIO_PORTF_DATA_R ^= 0x08; //Green
            vTaskDelay(2000 / portTICK_RATE_MS); // wait 2000 ms. (i.e. 2 seconds)
    }
}




void yellow_led_pot_task(void *pvParameters)
{
    init_gpio();
    while(1)
    {
            GPIO_PORTF_DATA_R ^= 0x04;
            vTaskDelay(3000 / portTICK_RATE_MS); // wait 3000 ms. (i.e. 3 seconds)
    }
}


void red_led_pot_task(void *pvParameters)
{
    INT16U adc_value;
    portTickType delay;

    init_gpio();
    while(1)
    {
        GPIO_PORTF_DATA_R ^= 0x02; //Red
        adc_value = get_adc();
        delay = 1000 - adc_value / 5;
        vTaskDelay(delay / portTICK_RATE_MS); // wait between 1 and 0.1 seconds based on potentiometer
    }
}


void status_led_task(void *pvParameters)
{
	
	status_led_init();

	while(1)
	{
		// Toggle status led
	    GPIO_PORTD_DATA_R ^= 0x40;
		vTaskDelay(500 / portTICK_RATE_MS); // wait 500 ms.
	}
}


/****************************** End Of Module *******************************/




