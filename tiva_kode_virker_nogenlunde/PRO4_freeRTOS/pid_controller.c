/*
 * pid_controller.c
 *
 *  Created on: 7. maj 2024
 *      Author: aksel
 */

/***************************** Include files *******************************/
#include "FreeRTOS.h"
#include <stdint.h>
#include "tm4c123gh6pm.h"
#include "emp_type.h"
#include "uart.h"
#include "spi.h"
#include "systick_frt.h"
#include "task.h"

/*****************************    Defines    *******************************/

/*****************************   Constants   *******************************/

/*****************************   Variables   *******************************/
    //Positions:
    INT16U tiltReceivedPos = 1024; //Used to receive a position //Initially
    INT16U panReceivedPos = 1024; //Used to receive a position //Initially
    INT16S receivedPos;


    //PID gains
    const float kp_tilt = 10.5;
    const float ki_tilt = 0;
    const float kd_tilt = 0.3718;
    INT16S P_term_tilt;
    INT16S I_term_tilt;
    INT16S D_term_tilt;
    INT16S tiltPreviousIntegral;

    const float kp_pan = 8.05;
    const float ki_pan = 0;
    const float kd_pan = 0.8297;
    INT16S P_term_pan;
    INT16S I_term_pan;
    INT16S D_term_pan;
    INT16S panPreviousIntegral;

    //Error
    BOOLEAN is_signed = 0;
    INT16S tiltError;
    INT16S tiltPreviousError = 0; //Initially no error

    INT16S panError;
    INT16S panPreviousError = 0; //Initially no error

    //Other constants
    const INT8U MAX_SPEED = 255; //maks 100% PWM
    const FP32 dt = 0.01; //0.0354; //Bør nok lave delay, der garanterer dette den sampletid (/frekvens)

    //Speed
    INT16S tiltSpeed = 0;
    INT16S panSpeed = 0;

    //Reference
    INT16S tiltReference = 0;
    INT16S panReference = 0;






/*****************************   Functions   *******************************/
void tilt_pid_control()
{
    //Calculate the error
    tiltError = tiltReference + 1024 - tiltReceivedPos;

    //Calculate the proportional gain
    P_term_tilt = tiltError;

    //Integral gain
    I_term_tilt = tiltPreviousIntegral + (dt * (tiltError - tiltPreviousError) / 2);

    //Deriviative gain
    D_term_tilt = (tiltError - tiltPreviousError) / dt;

    //Add the gains together
    tiltSpeed = kp_tilt * P_term_tilt  +  ki_tilt * I_term_tilt  +  kd_tilt * D_term_tilt;

    //Check if speed exceeds the maximum speed
    if (tiltSpeed > MAX_SPEED){
        tiltSpeed = MAX_SPEED;
    }
    else if (tiltSpeed < -MAX_SPEED)
    {
        tiltSpeed = -MAX_SPEED;
    }

    BOOLEAN tiltDir;
    if (tiltSpeed < 0) //Bestem retning
    {
        tiltDir = 0;
        tiltSpeed = -tiltSpeed; //Garenterer at tiltSpeed er postiv.
    }
    else
    {
        tiltDir = 1;
    }

    //If positive then set bit 10. Else ensure that bit 10 isn't set.
    //And ensure bit 11 is set to 0 indication tiltSpeed.
    unsigned int tiltSpeedSPI = tiltSpeed;
    if (tiltDir){
        tiltSpeedSPI |= (1 << 10) | (1 << 11);
    }
    else
    {
        tiltSpeedSPI |= (1 << 11);
        tiltSpeedSPI &= ~(1 << 10);
    }

    //SPI transmission
    SPI1_Full_duppe(tiltSpeedSPI, &receivedPos);
    receivedPos &= ~0xF000; //Set unused bits to zero
    if (receivedPos & 0x0800)
    {
        receivedPos &= ~0x0800;
        tiltReceivedPos = receivedPos; //Undgå negative tal på tilt.
    }
    else
    {
        panReceivedPos = receivedPos; //Undgå negative tal på pan.
    }


    //Assign the error to be the previous error
    tiltPreviousError = tiltError;
}













void pan_pid_control()
{
    //Calculate the error
    panError = panReference + 1024 - panReceivedPos;

    //Calculate the proportional gain
    P_term_pan = panError;

    //Integral gain
    I_term_pan = panPreviousIntegral + (dt * (panError - panPreviousError) / 2);

    //Deriviative gain
    D_term_pan = (panError - panPreviousError) / dt;

    //Add the gains together
    panSpeed = kp_pan * P_term_pan  +  ki_pan * I_term_pan  +  kd_pan * D_term_pan;

    //Check if speed exceeds the maximum speed
    if (panSpeed > MAX_SPEED){
        panSpeed = MAX_SPEED;
    }
    else if (panSpeed < -MAX_SPEED)
    {
        panSpeed = -MAX_SPEED;
    }


    BOOLEAN panDir;
    if (panSpeed < 0) //Bestem retning
    {
        panDir = 1;
        panSpeed = -panSpeed; //Garenterer at tiltSpeed er postiv.
    }
    else
    {
        panDir = 0;
    }

    //If positive then set bit 10. Else ensure that bit 10 isn't set.
    //And ensure bit 11 is set to 0 indication tiltSpeed.
    unsigned int panSpeedSPI = panSpeed;


    if (panDir) {
        panSpeedSPI |= (1 << 10);  // Set bit 10
        panSpeedSPI &= ~(1 << 11); // Clear bit 11
    } else {
        panSpeedSPI &= ~(1 << 10); // Clear bit 10
        panSpeedSPI &= ~(1 << 11); // Clear bit 11
    }

    //SPI transmission
    SPI1_Full_duppe(panSpeedSPI, &receivedPos);
    receivedPos &= ~0xF000; //Set unused bits to zero
    if (receivedPos & 0x0800)
    {
        receivedPos &= ~0x0800;
        tiltReceivedPos = receivedPos; //Undgå negative tal på tilt.
    }
    else
    {
        panReceivedPos = receivedPos; //Undgå negative tal på pan.
    }

//    vTaskDelay(500 / portTICK_RATE_MS); //Delay
//    UART0_SendInt16(0x1111);            //Tilt
//    UART0_SendInt16(tiltReceivedPos);
//    UART0_SendInt16(0x2222);            //Pan
//    UART0_SendInt16(panReceivedPos);


    //Assign the error to be the previous error
    panPreviousError = panError;
}



void do_pid_control(void *pvParameters)
{
    INT8U receivedReference = 0b00000000;
    UART0_SendChar(receivedReference);
    BOOLEAN test1 = 0;              ////////////////////////////////////////////////////////////////////////////////////////
    while(1) //FreeRTOS while loop
    {
            if (!(UART0_FR_R & UART_FR_RXFE))  //Modtag en pos
            {
                receivedReference = UART0_DR_R;
                UART0_SendChar(receivedReference);
                test1 = 1;          ////////////////////////////////////////////////////////////////////////////////////////
            }

            if (receivedReference & 0x40){ //Check if negative (check if bit 6 is set)
                is_signed = 1;          //sets is_signed boolean
                receivedReference &= ~0x40; //set bit 6 from receivedError to zero if set
            }

            if(receivedReference & 0x80 ){ //Check if pan or tilt (check if bit 7 is set)
                receivedReference &= ~0x80; //set bit 7 from receivedError to zero if set
                if(is_signed)
                {
                    tiltReference -= receivedReference;
                    is_signed = 0;
                }
                else
                {
                    tiltReference += receivedReference;
                }
                test1 = 0;          ////////////////////////////////////////////////////////////////////////////////////////
            }
            else if (test1 == 1)    ////////////////////////////////////////////////////////////////////////////////////////
            {
                test1 = 0;          ////////////////////////////////////////////////////////////////////////////////////////
                if(is_signed)
                {
                    panReference -= receivedReference;
                    is_signed = 0;
                }
                else
                {
                    panReference += receivedReference;
                }
            }

            tilt_pid_control();
            pan_pid_control();


    } //while(1) end.
}
