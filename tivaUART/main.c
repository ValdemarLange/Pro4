#include  <stdint.h>
#include "tm4c123gh6pm.h"
#include "emp_type.h"

#include "gpio.h"
#include "systick.h"
#include "uart.h"

/*****************Defines *****************/
#define CLOCK_SPEED 16000000
/*****************Constants****************/
const INT8U color[] = {0x00, 0x08, 0x04, 0x0C, 0x02, 0x0A, 0x06, 0x0E};
/*****************Variables****************/




int main(void){
    init_systick();
    init_gpio();

    init_uart();

    while(1){
        //do something else here
        char received = UART0_ReceiveChar();
        GPIO_PORTF_DATA_R &= ~(0x0F);             //clear led.
        GPIO_PORTF_DATA_R |= color[(int)received]; //yellow led
       UART0_SendChar(received);
    //    UART0_SendChar(received);
    }
}
