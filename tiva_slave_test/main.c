/* Example code to transmit data with SPI1 module of TM4C123 */
/* Transmits character A and B with a delay of one second */
#include <stdint.h>
#include "tm4c123gh6pm.h"
#include "emp_type.h"

/* function prototype of SPI and Delay */
void SPI1_init(void);
void SPI1_Write(unsigned int data);
void Delay_ms(int time_ms);

/* Main routine of code */
int main(void)
{

    unsigned int val1 = 12;
    unsigned int val2;
    SPI1_init();
    
    while(1) {
        val2 = SPI1_Read();
        SPI1_Write(val2);
    }
}


void SPI1_Write(unsigned int data)
{
    while((SSI1_SR_R & 2) == 0); /* wait untill Tx FIFO is not full */
    SSI1_DR_R = data;            /* transmit byte over SSI1Tx line */
    while(SSI1_SR_R & 0x10);     /* wait until transmit complete */
}


int SPI1_Read() 
{
    unsigned int data;
    while((SSI1_SR_R & 0x04) == 0); /* wait untill Rx FIFO is not empty */
    data = SSI1_DR_R;            /* read data from SSI1Rx line */
    while(SSI1_SR_R & 0x10);     /* wait until receive complete */
    return data;
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
    GPIO_PORTF_DIR_R &= ~(1<<2);         /* set PF2 pin input */

    /* Select SPI1 as a Master, POL = 1, PHA = 0, clock = 4 MHz, 8 bit data */

    SSI1_CR1_R = 0x04;          /* disable SPI1 and configure it as a slave */
    SSI1_CC_R = 0;           /* Enable System clock Option */
    SSI1_CPSR_R = 0;         /* Select prescaler value of 0 .i.e 16MHz */
    SSI1_CR0_R  = 0x00003;     /* 4MHz SPI1 clock, SPI mode 0, 4 bit data */
    //SSI1_CRO_R = 0x00007; Kan bruges til 8 bit data

    
    SSI1_CR1_R  |= 2;         /* enable SPI1 */
}

/* This function generates delay in ms */
/* calculations are based on 16MHz system clock frequency */

void Delay_ms(int time_ms)
{
    int i, j;
    for(i = 0 ; i < time_ms; i++)
        for(j = 0; j < 3180; j++)
            {}  /* excute NOP for 1ms */
}

