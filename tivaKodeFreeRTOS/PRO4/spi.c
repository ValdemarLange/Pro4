/***************************** Include files *******************************/
#include "FreeRTOS.h"
#include <stdint.h>
#include "tm4c123gh6pm.h"
#include "emp_type.h"
#include "uart.h"
#include "spi.h"
#include "systick_frt.h"

/*****************************    Defines    *******************************/
#define SPI_SS_PIN 0x04
#define SPI_FORMAT_SIZE 0x001b                          /*12 bit data TI format*/
#define SPI1_ENABLE      0x02                              /* enable SPI1 */
#define SPI1_ENABLE_PORTD 0x08
#define PORT_D_SPI_PINS 0x0D
#define SS_CLOCK_ENABLE 0x20

/*****************************   Constants   *******************************/

/*****************************   Variables   *******************************/


/*****************************   Functions   *******************************/

void SPI1_Full_duppe(unsigned int data, unsigned int *receivedData)
/*****************************************************************************
*   Function : See module specification (.h-file).
*****************************************************************************/
{
    GPIO_PORTF_DATA_R &= ~SPI_SS_PIN;                       /* Make PF2 Selection line (SS) low */
    while((SSI1_SR_R & 0x02) == 0);                     /* Wait until there is space in the Tx FIFO*/
    SSI1_DR_R = data;                                   /* Write data to be transmitted to the SPI data register*/
    while((SSI1_SR_R & 0x04) == 0);                     /* Wait until Rx FIFO is not empty*/
    *receivedData = SSI1_DR_R;                          /* Read the received data from the SPI data register*/
    GPIO_PORTF_DATA_R |= SPI_SS_PIN;                          /* keep selection line (PF2) high in idle condition */
}



void SPI1_init(void)
/*****************************************************************************
*   Function : See module specification (.h-file).
*****************************************************************************/
{
    /* Enable clock to SPI1, GPIOD and GPIOF */
    SYSCTL_RCGCSSI_R |= SPI1_ENABLE;                    /*set clock enabling bit for SPI1 */
    SYSCTL_RCGCGPIO_R |= SPI1_ENABLE_PORTD;             /* enable clock to GPIOD for SPI1 */
    SYSCTL_RCGCGPIO_R |= SS_CLOCK_ENABLE;               /* enable clock to GPIOF for slave select */


    /*Initialize PD3 and PD0 for SPI1 alternate function*/
    GPIO_PORTD_AMSEL_R &= ~PORT_D_SPI_PINS;             /* disable analog functionality PD0, PD2 and PD3 */
    GPIO_PORTD_DEN_R |= PORT_D_SPI_PINS;                /* Set PD0, PD2 and PD3 as digital pin */
    GPIO_PORTD_AFSEL_R |= PORT_D_SPI_PINS;              /* enable alternate function of PD0, PD2 and PD3*/
    
    GPIO_PORTD_PCTL_R &= ~0x0000FF0F;                   /* assign PD0, PD2 and PD3 pins to SPI1 */
    GPIO_PORTD_PCTL_R |= 0x00002202;                    /* assign PD0, PD2 and PD3 pins to SPI1  */

    /* Initialize PF2 as a digital output as a slave select pin */
    GPIO_PORTF_DEN_R |= SPI_SS_PIN;                     /* set PF2 pin digital */
    GPIO_PORTF_DIR_R |= SPI_SS_PIN;                     /* set PF2 pin output */
    GPIO_PORTF_DATA_R |= SPI_SS_PIN;                    /* keep SS idle high */

    /* Select SPI1 as a Master, POL = 1, PHA = 0, clock = 4 MHz, 8 bit data */
    SSI1_CR1_R = 0;                                     /* disable SPI1 and configure it as a Master */
    SSI1_CC_R = 0;                                      /* Enable System clock Option */
    SSI1_CPSR_R = 0;                                    /* Select prescaler value of 0 .i.e 16MHz */ // Angiveligt skal den v�re minimum 2 => 8MHz
    SSI1_CR0_R  = SPI_FORMAT_SIZE;                      /*12 bit data TI format*/


    SSI1_CR1_R  |= SPI1_ENABLE;                         /* enable SPI1 */
}