/***************************** Include files *******************************/
#include "FreeRTOS.h"
#include <stdint.h>
#include "tm4c123gh6pm.h"
#include "emp_type.h"
#include "uart.h"
#include "spi.h"
#include "systick_frt.h"
#include "task.h"
#include "queue.h"
#include "semphr.h"

/*****************************    Defines    *******************************/
#define TRUE    1
#define FALSE   0
#define TILT_DEAD_TIME 45
#define PAN_DEAD_TIME 55
#define NO_MOVEMENT 0

/*****************************   Constants   *******************************/

/*****************************   Variables   *******************************/
//Semaphore
extern SemaphoreHandle_t SPI_semphr, tilt_semphr, pan_semphr;

//Shared memory for error received from video feedback
INT16S tiltErrorSharedMemory;
INT16S panErrorSharedMemory;

//Received position of encoders (Not used)
INT16S receivedPosSPI;

//Other constants
const INT8U MAX_SPEED = 255; //maximum PWM in 8 bits (0-255)
const FP32 dt = 0.01; //Educated guess of the time between each iteration



/*****************************   Functions   *******************************/
void tilt_PID_control(void *pvParameters)
/*****************************************************************************
*   Function : See module specification (.h-file).
*****************************************************************************/
{
    //Error
    INT16S tiltError;
    INT16S tiltPreviousError = 0; //Initially no error

    //PID gains
    const float kp_tilt = 2;
    const float ki_tilt = 0;
    const float kd_tilt = 0.1;
    INT16S P_term_tilt;
    INT16S I_term_tilt;
    INT16S D_term_tilt;
    INT16S tiltPreviousIntegral;

    //Speed variable
    INT16S tiltSpeed = 0;

    //FreeRTOS loop
    while(1)
    {
        if( xSemaphoreTake( tilt_semphr, ( TickType_t ) 100 ) == pdTRUE ) //Take semaphore
        {
            //Set error
            tiltError = tiltErrorSharedMemory;

            //Give semaphore back
            xSemaphoreGive( tilt_semphr );
        }

        //Calculate the proportional gain
        P_term_tilt = tiltError;

        //Calculate the integral gain
        I_term_tilt = tiltPreviousIntegral + (dt * (tiltError - tiltPreviousError) / 2);

        //Calculate the derivative gain
        D_term_tilt = (tiltError - tiltPreviousError) / dt;

        //Add the gains together to get the speed
        tiltSpeed = kp_tilt * P_term_tilt  +  ki_tilt * I_term_tilt  +  kd_tilt * D_term_tilt;

        //Dead time correction
        if (tiltSpeed < TILT_DEAD_TIME && tiltSpeed > -TILT_DEAD_TIME)
        {
            if (tiltSpeed < NO_MOVEMENT)
            {
                tiltSpeed = -TILT_DEAD_TIME;
            }
            else if (tiltSpeed > NO_MOVEMENT)
            {
                tiltSpeed = TILT_DEAD_TIME;
            }
        }

        //Check if speed exceeds the maximum- or minimum speed
        if (tiltSpeed > MAX_SPEED){
            tiltSpeed = MAX_SPEED;
        }
        else if (tiltSpeed < -MAX_SPEED)
        {
            tiltSpeed = -MAX_SPEED;
        }

        //Determine direction based on the speed
        BOOLEAN tiltDir;
        if (tiltSpeed < 0)
        {
            tiltDir = 0;
            tiltSpeed = -tiltSpeed; //If negative, then set tiltDir boolean and ensure that tiltSpeed is positive for SPI transmission
        }
        else
        {
            tiltDir = 1;
        }

        //Determine direction bit based on tiltDir boolean (bit 10), and set the correct bit for tilt (bit 11)
        unsigned int tiltSpeedSPI = tiltSpeed;
        if (tiltDir){
            tiltSpeedSPI |= (1 << 10) | (1 << 11); //Set bit 10 and -11
        }
        else
        {
            tiltSpeedSPI |= (1 << 11); //Set bit 11
            tiltSpeedSPI &= ~(1 << 10); //Clear bit 10
        }

        //SPI transmission
        if( xSemaphoreTake( SPI_semphr, ( TickType_t ) 100 ) == pdTRUE ) //Take semaphore
        {
            SPI1_Full_duppe(tiltSpeedSPI, &receivedPosSPI);
            xSemaphoreGive( SPI_semphr ); //Give semaphore back
        }

        //Assign the error to be the previous error variable
        tiltPreviousError = tiltError;
    }
}













void pan_PID_control(void *pvParameters)
/*****************************************************************************
*   Function : See module specification (.h-file).
*****************************************************************************/
{
    //Error
    INT16S panError;
    INT16S panPreviousError = 0; //Initially no error

    //PID gains
    const float kp_pan = 2;
    const float ki_pan = 0;
    const float kd_pan = 0.1;
    INT16S P_term_pan;
    INT16S I_term_pan;
    INT16S D_term_pan;
    INT16S panPreviousIntegral;

    //Speed variable
    INT16S panSpeed = 0;

    //FreeRTOS loop
    while(1)
    {
        if( xSemaphoreTake( pan_semphr, ( TickType_t ) 100 ) == pdTRUE ) //Take semaphore
        {
            //Set error
            panError = panErrorSharedMemory;

            //Give semaphore
            xSemaphoreGive( pan_semphr );
        }

        //Calculate the proportional term
        P_term_pan = panError;

        //Calculate the integral term
        I_term_pan = panPreviousIntegral + (dt * (panError - panPreviousError) / 2);

        //Calculate the derivative term
        D_term_pan = (panError - panPreviousError) / dt;

        //Add the gains together to get the speed
        panSpeed = kp_pan * P_term_pan  +  ki_pan * I_term_pan  +  kd_pan * D_term_pan;

        //Dead time correction
        if (panSpeed < PAN_DEAD_TIME && panSpeed > -PAN_DEAD_TIME)
        {
            if (panSpeed < NO_MOVEMENT)
            {
                panSpeed = -PAN_DEAD_TIME;
            }
            else if (panSpeed > NO_MOVEMENT)
            {
                panSpeed = PAN_DEAD_TIME;
            }
        }

        //Check if speed exceeds the maximum- or minimum speed
        if (panSpeed > MAX_SPEED){
            panSpeed = MAX_SPEED;
        }
        else if (panSpeed < -MAX_SPEED)
        {
            panSpeed = -MAX_SPEED;
        }

        //Determine direction based on the speed
        BOOLEAN panDir;
        if (panSpeed < 0)
        {
            panDir = 1;
            panSpeed = -panSpeed; //If negative, then set panDir boolean and ensure that panSpeed is positive for SPI transmission
        }
        else
        {
            panDir = 0;
        }


        unsigned int panSpeedSPI = panSpeed;

        //Determine direction bit based on panDir boolean (bit 10), and set the correct bit for pan (bit 11)
        if (panDir) {
            panSpeedSPI |= (1 << 10);  // Set bit 10
            panSpeedSPI &= ~(1 << 11); // Clear bit 11
        } else {
            panSpeedSPI &= ~(1 << 10); // Clear bit 10
            panSpeedSPI &= ~(1 << 11); // Clear bit 11
        }

        //SPI transmission
        if( xSemaphoreTake( SPI_semphr, ( TickType_t ) 100 ) == pdTRUE ) //Take semaphore
        {
            SPI1_Full_duppe(panSpeedSPI, &receivedPosSPI);
            xSemaphoreGive( SPI_semphr ); //Give semaphore back
        }

        //Assign the error to be the previous error variable
        panPreviousError = panError;
    }
}





void position_control(void *pvParameters)
/*****************************************************************************
*   Function : See module specification (.h-file).
*****************************************************************************/
{
    INT8U receivedReference = 0b00000000; //Initialize receivedReference to zero
    BOOLEAN repeatAdvoidance = FALSE; //Initialize repeatAdvoidance to FALSE ensuring that the first error is not repeated
    BOOLEAN is_signed = FALSE; //Initialize is_signed to FALSE (being not signed)
    while(1) //FreeRTOS while loop
    {
        //Receive an error from video feedback
        if (!(UART0_FR_R & UART_FR_RXFE))
        {
            receivedReference = UART0_DR_R;
            UART0_SendChar(receivedReference); //Echo the received error
            repeatAdvoidance = TRUE;        //Sets the repeatAdvoidance boolean to avoid responding to the same error twice
        }

        //Check if negative error by checking bit 6
        if (receivedReference & 0x40){ 
            is_signed = TRUE;          //Sets is_signed boolean if negative error
            receivedReference &= ~0x40; //Clear bit 6 if set
        }

        //Check if pan- or tilt error by checking bit 7
        if( (receivedReference & 0x80) & repeatAdvoidance )
        {
            receivedReference &= ~0x80; //Clear bit 7
            repeatAdvoidance = FALSE;  //Clear repeatAdvoidance boolean to avoid responding to the same error twice

            if( xSemaphoreTake( tilt_semphr, ( TickType_t ) 100 ) == pdTRUE ) //Take semaphore
            {
                if(is_signed) //Check if error is negative
                {
                    tiltErrorSharedMemory = -receivedReference; //Assign shared memory to negative error
                    is_signed = FALSE;                          //Clear is_signed boolean
                }
                else
                {
                    tiltErrorSharedMemory = receivedReference; //If positive, assign shared memory to positive error
                }
                xSemaphoreGive( tilt_semphr ); //Give semaphore back
            }
        }
        else if(repeatAdvoidance) //If not tilt error, then pan error
        {
            repeatAdvoidance = FALSE; //Clear repeatAdvoidance boolean to avoid responding to the same error twice
            if( xSemaphoreTake( pan_semphr, ( TickType_t ) 100 ) == pdTRUE ) //Take semaphore
            {
                if(is_signed) //Check if error is negative
                {
                    panErrorSharedMemory = -receivedReference;  //Assign shared memory to negative error
                    is_signed = FALSE;                          //Clear is_signed boolean
                }
                else
                {
                    panErrorSharedMemory = receivedReference;  //If positive, assign shared memory to positive error
                }
                xSemaphoreGive( pan_semphr ); //Give semaphore back
            }
        }

    }
}
