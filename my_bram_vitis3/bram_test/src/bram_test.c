#include "xparameters.h"
#include "stdio.h"
//#include "xil_printf.h"
#include "xgpio.h"
#include <sys/types.h>

#define BRAM_MEMORY  0x40000000

int main(){
    printf("Start\n");
    
    XGpio Gpio_in;
    XGpio Gpio_out;
    XGpio_Initialize(&Gpio_in, XPAR_AXI_GPIO_IN_BASEADDR);
    XGpio_SetDataDirection(&Gpio_in, 1, 0xffffffff);

    XGpio_Initialize(&Gpio_out, XPAR_AXI_GPIO_OUT_BASEADDR);
    XGpio_SetDataDirection(&Gpio_out, 1, 0x0);

    
    // while(1){
    //     XGpio_DiscreteRead(&Gpio_in,1);
    //     XGpio_DiscreteWrite(&Gpio_out,1,1);
    //     //sleep(1);
    //     XGpio_DiscreteWrite(&Gpio_out,1,0);
    // }

    printf("GPIO Initial\n");
    int* Source_ADDR;
    Source_ADDR = (int*)BRAM_MEMORY;
    int* Destination_ADDR;
    //int test = 10;
    Destination_ADDR = (int*)(XPAR_PS7_DDR_0_BASEADDRESS + 0x00020000);
    printf("Addr mapping %d\n",*Destination_ADDR);
    int i  = 0;
    for (i= 0; i<100; i++) {
        *(Source_ADDR + i) = 1;
        *(Destination_ADDR +i) = 0;
        printf("reset Mem %d    %d\n", *(Source_ADDR + i), *(Destination_ADDR +i));
    }
    printf("PL start\n");
    
    
    //printf("BRAM START\n");
    
    int pl_state;
    pl_state = XGpio_DiscreteRead(&Gpio_in,1);
    while (pl_state != 0x01){
        pl_state = XGpio_DiscreteRead(&Gpio_in,1);
    }
    XGpio_DiscreteWrite(&Gpio_out,1,1);
    //if(!(XGpio_DiscreteRead(&Gpio_in,1))){
    XGpio_DiscreteWrite(&Gpio_out,1,0);
    //}   
    //printf("Ready Start\n");
    //while(pl_state == 0x01){
    //    pl_state = XGpio_DiscreteRead(&Gpio_in,1);
    //}
    printf("Ready Done\n");
    while(pl_state != 0x01){
        pl_state = XGpio_DiscreteRead(&Gpio_in,1);
    }
    
    printf("BRAM to DDR\n");
    for (i= 0; i<100; i++) {
        *(Destination_ADDR +i) = *(Source_ADDR + i);
        printf("%d\n",*(Source_ADDR + i));
    }
    printf("printf\n");
    for (i= 0; i<100; i++) {
        printf("ADDR : %02d, DATA : %d\n",i,*(Destination_ADDR +i));
    }

}

