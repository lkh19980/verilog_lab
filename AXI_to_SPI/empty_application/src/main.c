#include <stdio.h>
#include "sleep.h"
#include "xparameters.h"

#define BASEADDR XPAR_AXI_SLAVE_S_AXI_0_BASEADDR
#define data_num 4


int * ptr;

int main(void) {
    int i,j;
    printf("\033[2J \033[0;0H AXI Test test TEST \r\n");
    printf("we're in main1\r\n");
    ptr = (int *) BASEADDR;
    printf("we're in main2\r\n");
    while(1){
        *ptr = 0x01ef;
        printf("Wirte Data is 0x01ef \r\n");
            
        sleep(1);
        printf("read data 0x81\r\n");   

        sleep(1);
        int read = *(ptr);

        printf("Read data is %x \r\n",read);
        

        sleep(1);

        sleep(1);
    }
    return 0;
}