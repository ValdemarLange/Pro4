/*****************************************************************************
* University of Southern Denmark
* Embedded C Programming (ECP)
*
* MODULENAME.: Pid_controller.h
*
* PROJECT....: Semester 4 project
*
* DESCRIPTION: 
*
* Change Log:
******************************************************************************
* Date    Id    Change
* YYMMDD
* --------------------
* 100408  KHA    Module created.
*
*****************************************************************************/

#ifndef PID_CONTROLLER_H_
#define PID_CONTROLLER_H_

/*****************************   Functions   *******************************/

void tilt_PID_control(void *pvParameters);
/*****************************************************************************
*   Input    : Error received from shared memory
*   Output   : Speed of the tilt frame
*   Function : PID calculations for the tilt frame
******************************************************************************/

/****************************** End Of Module *******************************/

void pan_PID_control(void *pvParameters);
/*****************************************************************************
*   Input    : Error received from shared memory
*   Output   : Speed of the pan frame
*   Function : PID calculations for the pan frame
******************************************************************************/

void position_control(void *pvParameters);
/*****************************************************************************
*   Input    : Error received from video feedback
*   Output   : Assigns the error to the shared memory
*   Function : Handles incoming error from video feedback for the PID controllers
******************************************************************************/


#endif /* PID_CONTROLLER_H_ */