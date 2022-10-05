#include <msp430.h> 


/**
 * main.c
 */


float b = 4.5;
int main(void)
{
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer

    unsigned char c = 0xAD;
    unsigned char d = 0x1234;

    int a = 5;
    a = a +1 ; // A increment

    b = b -1; // B decrement

    unsigned char e = c&&d; //AND operation

    unsigned char f =  c||d; // OR operation

    while(1)

    return 0;
}
