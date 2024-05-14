#include "uart.h"
#include <stdint.h>
#include "tm4c123gh6pm.h"
#include "emp_type.h"


#define PIOSC_clock 16000000                                    //Precision Internal Oscillator
#define BAUDRATE 9600

#define PORTA_RUN_MODE_EN 0x01
#define PORTA_PA0_RX 0x01
#define PORTA_PA1_TX 0x02
#define DATA_LENGTH_AND_NONPARITY 0x60
#define DATA_LENGTH_AND_NONPARITY_FIFO 0x70
#define UART_CLOCK_SELECT_INTERN 0x0
#define UART_PIN_ASSIGNMENT 0x11


void init_uart(){
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

    //BRD = UARTSysClk / (ClkDiv * Baud Rate) //clkdiv - clock divider is 16 becuase HSE bit in UARTCTL is 0
    float BRD = (float)(PIOSC_clock) / (16 * BAUDRATE); //104.166
    float BDR_float = BRD - (uint16_t)BRD;
    UART0_IBRD_R = (uint16_t)BRD;                                           // Integer del af BRD
    UART0_FBRD_R = (int)(BDR_float * 64 + 0.5);                             // Fractional del af BRD

    //change in baudrate registers must be followed by a write to LCRH
    UART0_LCRH_R = DATA_LENGTH_AND_NONPARITY_FIFO;                          // Konfigurer frame: 8 data bits, ingen parity, 1 stop bit, fifo enabled  // page 914

    UART0_CC_R |= UART_CLOCK_SELECT_INTERN;                                 // Bruger PIOSC 16MHz clock  page 937

    UART0_CTL_R |= (UART_CTL_UARTEN | UART_CTL_TXE | UART_CTL_RXE);         // Enable UART  Aktiver UART0 med TXE og RXE
}

void UART0_SendChar(INT8U data){
     while(UART0_FR_R & UART_FR_TXFF);                                      // Vent indtil TX holding register bliver tom
    UART0_DR_R = data;                                                      // Skriv data til data registeret
}

char UART0_ReceiveChar(){
    char data;
    while((UART0_FR_R & UART_FR_RXFE));                                     // Vent indtil RX FIFO ikke er tom
    data = UART0_DR_R;                                                      // Læs og returner data fra data registeret
    return data;
}


void UART0_SendInt32(INT32U data){
    unsigned char *ptr, i;
    ptr = (unsigned char *)&data;                       //pointer til første adresse for float
    for (i = 0; i < sizeof(INT32U); i++){
        UART0_SendChar(*(ptr + i));                     //sender byten fra 1 til 4 addrese
    }
}


void UART0_SendFloat(FP32 data){
    unsigned char *ptr, i;
    ptr = (unsigned char *)&data;                       //pointer til første adresse for float
    for (i = 0; i < sizeof(FP32); i++){
        UART0_SendChar(*(ptr + i));                     //sender byten fra 1 til 4 addrese
    }
}

// short int er 2 bytes og gå fra -32768 til 32767
INT16S UART0_SignedINT16_receive(){

    INT16S data = UART0_ReceiveChar();
    data = (data << 8);
    data += UART0_ReceiveChar();

    return data;
}


//hvordan fungere uart på tiva c
// 80 MHz clock speed - FPU (floating point unit) til logiske operationer -> side 45 i datablad
// uart - læs lidt facts på side 53 og side 891 -- 16 MHz clock speed til uart - side 218

//side 892 -  uart register beskrivelse

// clock control:
//UARTCC - clock control
//UARTCTL - control register

//Uart baudrate generator
//UARTIBRD - integer baudrate divisor
//UARTFBRD - fractional baudrate divisor

//UARTDR - ind og ud af rx og tx

//UART CONTROL / STATUS:
//UARTRSR / ECR - receive status - error clear register
//UARTFR - flag register
//UARTLCRH - line control register
//UARTCTL - control register

//u0RX - receive - PA0
//u0TX - transmit - PA1

//page 893 - uart pin nr
//Before any uart registers can be programmed the UARTEN (enable) bit in the UARTCTL register
// must be cleard thus disabeling

//transmit receiver logic
// start bit followed by data bits (LSB) first

//baudrate generation page 894

//data transmission page 895

//page 898 - FIFO operation

//page 902 - uart register map

//DATA transmission page 895
