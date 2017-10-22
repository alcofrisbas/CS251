#include<stdio.h>

int main(void) {
    int a = 23;
    printf("a = %i\n", a);

    int  *x;    //x points to an int
    x = &a;     //now x points to a
    printf("a = %i\n", a);
    printf("*x = %i\n", *x);
    
    *x = 251;   //now the value that x points to is 251
                //so a is 251
    printf("a = %i\n", a);
    printf("*x = %i\n", *x);

    int *y;     //y now points to the same place as x
    y = x;
    printf("a = %i\n", a);
    printf("*x = %i\n", *x);
    printf("*y = %i\n", *y);

    return 0;
}
