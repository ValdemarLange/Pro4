/***************************** Include files *******************************/
#include "uart.h"
#include <stdint.h>
#include "tm4c123gh6pm.h"
#include "emp_type.h"
#include "SPI.h"


/*****************************    Defines    *******************************/
#define PIOSC_clock 16000000                                    //Precision Internal Oscillator
#define BAUDRATE 115200

#define PORTA_RUN_MODE_EN 0x01
#define PORTA_PA0_RX 0x01
#define PORTA_PA1_TX 0x02
#define DATA_LENGTH_AND_NONPARITY 0x60
#define DATA_LENGTH_AND_NONPARITY_FIFO 0x70
#define UART_CLOCK_SELECT_INTERN 0x0
#define UART_PIN_ASSIGNMENT 0x11


/*****************************   Constants   *******************************/

/*****************************   Variables   *******************************/


/*****************************   Functions   *******************************/
void init_uart()
/*****************************************************************************
*   Function : See module specification (.h-file).
*****************************************************************************/
{
    // Initialization and Configuration                         // page 900
    SYSCTL_RCGCUART_R |= PORTA_RUN_MODE_EN;                     // Aktiver UART0 clock       //page 343

    // RCGCgpio -> run mode clock gating control register
    SYSCTL_RCGCGPIO_R |= PORTA_RUN_MODE_EN;                     // Aktiver Port A clock      //page 339
    while((SYSCTL_PRGPIO_R & PORTA_RUN_MODE_EN) != 1);          // Vent kort for at sikre, at clocken til Port A er startet //page 405

    //GPIO alternate function select //page 669
    GPIO_PORTA_AFSEL_R |= (PORTA_PA0_RX | PORTA_PA1_TX);        // Aktiver alternativ funktion for PA0 og PA1

    GPIO_PORTA_PCTL_R |= UART_PIN_ASSIGNMENT;                   //assign uart0 to pa0 and pa1

    GPIO_PORTA_DIR_R |= PORTA_PA1_TX;                           // Set PA1 direction to output //page 661
    GPIO_PORTA_DEN_R |= (PORTA_PA0_RX | PORTA_PA1_TX);          // Digital enable for PA0 og PA1
    GPIO_PORTA_PUR_R |= PORTA_PA1_TX;                           // Enable internal pull-up (PA1)

    UART0_CTL_R &= ~UART_CTL_UARTEN;                            //disable uart0 before configuration

    //baudrate generation page 894 og 901
    //16 MHz clock speed uart - side 218
    // Baudrate 9600
    // Data length 8 bits
    // No parity
    // One stop bit
    // fifo enabled

    INT32U BRD;
    BRD = 64000000 / BAUDRATE;       // X-sys*64/(16*baudrate) = 16M*4/baudrate
    UART0_IBRD_R = BRD / 64;
    UART0_FBRD_R = BRD & 0x0000003F;

    //change in baudrate registers must be followed by a write to LCRH
    UART0_LCRH_R = DATA_LENGTH_AND_NONPARITY_FIFO;                          // Konfigurer frame: 8 data bits, ingen parity, 1 stop bit, fifo enabled  // page 914

    UART0_CC_R |= UART_CLOCK_SELECT_INTERN;                                 // Bruger PIOSC 16MHz clock  page 937

    UART0_CTL_R |= (UART_CTL_UARTEN | UART_CTL_TXE | UART_CTL_RXE);         // Enable UART  Aktiver UART0 med TXE og RXE
}




void UART0_SendChar(INT8U data)
/*****************************************************************************
*   Function : See module specification (.h-file).
*****************************************************************************/
{
    while( UART0_FR_R & UART_FR_TXFF );                                      // Vent indtil TX holding register bliver tom
    UART0_DR_R = data;                                                      // Skriv data til data registeret
}




char UART0_ReceiveChar()
/*****************************************************************************
*   Function : See module specification (.h-file).
*****************************************************************************/
{

    while( UART0_FR_R & UART_FR_RXFE );                                     // Vent indtil RX FIFO ikke er tom
    return UART0_DR_R;                                                      // L�s og returner data fra data registeret
}




void UART0_SendInt16(INT16U data)
/*****************************************************************************
*   Function : See module specification (.h-file).
*****************************************************************************/
{
    UART0_SendChar(data >> 8);
    UART0_SendChar(data);
}


INT16U UART0_INT16_receive()
/*****************************************************************************
*   Function : See module specification (.h-file).
*****************************************************************************/
{
    INT16U data = UART0_ReceiveChar();
    data = (data << 8);
    data += UART0_ReceiveChar();

    return data;
}