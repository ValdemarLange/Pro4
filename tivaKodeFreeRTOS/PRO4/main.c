/***************************** Include files *******************************/
#include "FreeRTOS.h"
#include <stdint.h>
#include "tm4c123gh6pm.h"
#include "emp_type.h"
#include "systick_frt.h"
#include "task.h"
#include "queue.h"
#include "semphr.h"
#include "status_led.h"
#include "gpio.h"
#include "uart.h"
#include "pid_controller.h"
#include "spi.h"

/*****************************    Defines    *******************************/
#define USERTASK_STACK_SIZE configMINIMAL_STACK_SIZE
#define IDLE_PRIO 0
#define LOW_PRIO  1
#define MED_PRIO  2
#define HIGH_PRIO 3

#define QUEUE_SIZE 128

/*****************************   Constants   *******************************/

/*****************************   Variables   *******************************/
//Semaphore
SemaphoreHandle_t SPI_semphr, tilt_semphr, pan_semphr;

/*****************************   Functions   *******************************/
static void setupHardware(void)
/*****************************************************************************
*   Input    :  -
*   Output   :  -
*   Function : Setup hardware
*****************************************************************************/
{
  init_gpio();
  init_uart();
  SPI1_init();
}

int main(void)
{
  //Initiate hardware
  setupHardware();

  //Create semaphores
  SPI_semphr = xSemaphoreCreateMutex();
  tilt_semphr = xSemaphoreCreateMutex();
  pan_semphr = xSemaphoreCreateMutex();

  //Create tasks
  xTaskCreate( status_led_task, "Status_led", USERTASK_STACK_SIZE, NULL, LOW_PRIO, NULL );
  xTaskCreate( position_control, "Position Control", USERTASK_STACK_SIZE, NULL, LOW_PRIO, NULL );
  xTaskCreate( tilt_PID_control, "Tilt PID Control", USERTASK_STACK_SIZE, NULL, LOW_PRIO, NULL );
  xTaskCreate( pan_PID_control, "Pan PID Control", USERTASK_STACK_SIZE, NULL, LOW_PRIO, NULL );

  //Start scheduler
  vTaskStartScheduler();
	return 0;
}
