

/**
 * main.c
 */
#include "FreeRTOS.h"
#include <stdint.h>
#include "tm4c123gh6pm.h"
#include "emp_type.h"
#include "systick_frt.h"
#include "task.h"
#include "status_led.h"
#include "gpio.h"
#include "uart.h"
#include "pid_controller.h"
#include "spi.h"


#define USERTASK_STACK_SIZE configMINIMAL_STACK_SIZE
#define IDLE_PRIO 0
#define LOW_PRIO  1
#define MED_PRIO  2
#define HIGH_PRIO 3

static void setupHardware(void)
/*****************************************************************************
*   Input    :  -
*   Output   :  -
*   Function :
*****************************************************************************/
{
  init_systick();
  init_gpio();
  init_uart();
  SPI1_init();
}

int main(void)
{
    setupHardware();
    xTaskCreate( status_led_task, "Status_led", USERTASK_STACK_SIZE, NULL, LOW_PRIO, NULL );
//    xTaskCreate( UART0_Echo_task, "Uart_Echo", USERTASK_STACK_SIZE, NULL, LOW_PRIO, NULL ); //Own UART echo
    xTaskCreate( do_pid_control, "PID_Control", USERTASK_STACK_SIZE, NULL, LOW_PRIO, NULL );
//    xTaskCreate( SPI_task, "SPI", USERTASK_STACK_SIZE, NULL, LOW_PRIO, NULL );


    vTaskStartScheduler();
	return 0;
}
