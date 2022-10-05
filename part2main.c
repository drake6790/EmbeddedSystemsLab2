#include <msp430.h> 


/**
 * main.c
 */


int sum(x,y){

    return x+y;

}

int main(void)
{
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer

    int a = 0b1110000110100101;
    int b = 0b1001010100010001;

    int d;

    d = sum(a,b);


    while(1);


    return 0;
}
