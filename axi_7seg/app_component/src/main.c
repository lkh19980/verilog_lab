#include <stdio.h>
#include "sleep.h"
#include "xparameters.h"

#define BASEADDR XPAR_MYIP_V1_0_S00_AXI_0_BASEADDR
#define data_num 10


int * ptr;

int main(void) {
    int i,j;
    printf("\033[2J \033[0;0H AXI Test test TEST \r\n");
    //printf("we're in main1\r\n");
    ptr = (int *) BASEADDR;
    //printf("we're in main2\r\n");
    while(1){
        //printf("we're in while loop\r\n");
        for (i= 0 ; i < data_num ; i++ ) 
        {
            
            //*(ptr) = i;
            //*ptr = 16*(i/10) + i%10;
            //printf("Wirte Data is %d \r\n",i);
            for(j = 0; j < 1000000; j++){
                //*(ptr) = (i <<4)|j;
                *(ptr) = *(ptr+1);
                printf("DIP SW Read data is %d \r\n",*(ptr+1));
                sleep(1);
            };
            
            //printf("we're in for loop\r\n");
        }   

        sleep(1);
    }
    return 0;
}