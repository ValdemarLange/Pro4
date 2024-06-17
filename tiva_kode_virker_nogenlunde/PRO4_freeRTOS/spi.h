#ifndef SPI_H_
#define SPI_H_


/* function of SPI */

void SPI1_Full_duppe(unsigned int data, unsigned int *receivedData);
void SPI_task(void *pvParameters);
void SPI1_init(void);
void SPI1_Write(unsigned int data);


#endif /* SPI_H_ */
