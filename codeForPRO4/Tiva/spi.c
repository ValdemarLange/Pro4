/* Example code to transmit data with SPI1 module of TM4C123 */
/* Transmits character A and B with a delay of one second */
#include "FreeRTOS.h"
#include <stdint.h>
#include "tm4c123gh6pm.h"
#include "emp_type.h"
#include "uart.h"
#include "spi.h"
#include "systick_frt.h"




//void SPI1_Full_duppe(unsigned int data, unsigned int *receivedData)
void SPI1_Full_duppe(unsigned int data, unsigned int *receivedData)
{
    GPIO_PORTF_DATA_R &= ~(1<<2);       /* Make PF2 Selection line (SS) low */
    while((SSI1_SR_R & 0x02) == 0);  // Wait until there is space in the Tx FIFO
    SSI1_DR_R = data;                // Write data to be transmitted to the SPI data register
    while((SSI1_SR_R & 0x04) == 0);  // Wait until Rx FIFO is not empty
    *receivedData = SSI1_DR_R;       // Read the received data from the SPI data register
    GPIO_PORTF_DATA_R |= 0x04;        /* keep selection line (PF2) high in idle condition */
}


void SPI_task(void *pvParameters)
{
    INT16U val1 = 0;
    unsigned int val2 = 0;
    unsigned int motorDeciderBit = 1;

    while(1){
//        UART0_SendChar(0x11);
//        UART0_SendChar(0x11);
        vTaskDelay(500 / portTICK_RATE_MS);
        val2 = 0x0000; //= UART0_INT16_receive();


        if(!motorDeciderBit){           //pan motor
            motorDeciderBit = 1;
            val2 |= (0 << 11);
        }
        else{                           //tilt motor
            motorDeciderBit = 0;
            val2 |= (1 << 11);
        }

        SPI1_Full_duppe(val2, &val1);
        val1 &= ~(0x7000);

        UART0_SendInt16(val2);
        UART0_SendChar(0x22);
        UART0_SendChar(0x22);
        UART0_SendInt16(val1);
        UART0_SendChar(0x22);
        UART0_SendChar(0x22);
    }
}



void SPI1_init(void)
{
    /* Enable clock to SPI1, GPIOD and GPIOF */

    SYSCTL_RCGCSSI_R |= (1<<1);   /*set clock enabling bit for SPI1 */
    SYSCTL_RCGCGPIO_R |= (1<<3); /* enable clock to GPIOD for SPI1 */
    SYSCTL_RCGCGPIO_R |= (1<<5); /* enable clock to GPIOF for slave select */

    /*Initialize PD3 and PD0 for SPI1 alternate function*/

    GPIO_PORTD_AMSEL_R &= ~0x0D;      /* disable analog functionality PD0, PD2 and PD3 */
    GPIO_PORTD_DEN_R |= 0x0D;         /* Set PD0, PD2 and PD3 as digital pin */
    GPIO_PORTD_AFSEL_R |= 0x0D;       /* enable alternate function of PD0, PD2 and PD3*/
    GPIO_PORTD_PCTL_R &= ~0x0000FF0F; /* assign PD0, PD2 and PD3 pins to SPI1 */
    GPIO_PORTD_PCTL_R |= 0x00002202;  /* assign PD0, PD2 and PD3 pins to SPI1  */

    /* Initialize PF2 as a digital output as a slave select pin */

    GPIO_PORTF_DEN_R |= (1<<2);         /* set PF2 pin digital */
    GPIO_PORTF_DIR_R |= (1<<2);         /* set PF2 pin output */
    GPIO_PORTF_DATA_R |= (1<<2);        /* keep SS idle high */

    /* Select SPI1 as a Master, POL = 1, PHA = 0, clock = 4 MHz, 8 bit data */

    SSI1_CR1_R = 0;          /* disable SPI1 and configure it as a Master */
    SSI1_CC_R = 0;           /* Enable System clock Option */
    SSI1_CPSR_R = 0x0;         /* Select prescaler value of 0 .i.e 16MHz */ // Angiveligt skal den v�re minimum 2 => 8MHz
//    SSI1_CR0_R  = 0x0017;     /* 4MHz SPI1 clock, SPI mode 0, 4 bit data */
    SSI1_CR0_R  = 0x001b;     //sat til 8 bit data TI format
    //SSI1_CRO_R = 0x00007; Kan bruges til 8 bit data


    SSI1_CR1_R  |= 2;         /* enable SPI1 */
}

/* This function generates delay in ms */
/* calculations are based on 16MHz system clock frequency */
