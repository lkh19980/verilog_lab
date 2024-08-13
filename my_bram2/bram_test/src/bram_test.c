#include "xparameters.h"
#include "stdio.h"
//#include "xil_printf.h"
#include "xgpio.h"
#include <sys/types.h>

#define BRAM_MEMORY  XPAR_AXI_BRAM_0_BASEADDRESS

int main(){
    printf("Start");
    
    XGpio Gpio_in;
    XGpio Gpio_out;
    XGpio_Initialize(&Gpio_in, XPAR_AXI_GPIO_IN_BASEADDR);
    XGpio_SetDataDirection(&Gpio_in, 1, 0xffffffff);

    XGpio_Initialize(&Gpio_out, XPAR_AXI_GPIO_OUT_BASEADDR);
    XGpio_SetDataDirection(&Gpio_out, 1, 0x0);

    printf("GPIO Initial");
    int* Source_ADDR = NULL;
    Source_ADDR = (int*)BRAM_MEMORY;
    int* Destination_ADDR = NULL;
    Destination_ADDR = (int*)XPAR_PS7_DDR_0_BASEADDRESS + 0x00020000;
    printf("Addr mapping");
    int i  = 0;
    for (i= 0; i<100; i++) {
        *(Source_ADDR + i) = 0;
        *(Destination_ADDR +i) = 0;
        printf("reset Mem");
    }
    printf("PL start");
    
    
    printf("BRAM START");
    XGpio_DiscreteWrite(&Gpio_out,1,1);
    int pl_state;
    pl_state = XGpio_DiscreteRead(&Gpio_in,1);
    while (pl_state != 0x01){
        pl_state = XGpio_DiscreteRead(&Gpio_in,1);
    }
    
    while(pl_state == 0x01){
        pl_state = XGpio_DiscreteRead(&Gpio_in,1);
    }
    printf("BRAM to DDR");
    for (i= 0; i<100; i++) {
        *(Destination_ADDR +i) = *(Source_ADDR + i);
    }
    printf("printf");
    for (i= 0; i<100; i++) {
        printf("%d",*(Destination_ADDR +i));
    }

}

