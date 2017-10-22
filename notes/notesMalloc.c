#include<stdio.h>
#include<stdlib.h>

int main(void) {
    int a; //stack
    printf("stack address: &a= %p\n",&a);
    int *b;
    b = malloc(sizeof(int)); //heap allocate

    if (!b) {
        printf("oops...\n");
        return 1;
    }
    printf("%p\n",b);
    printf("%p\n",&b);
    return 0;

}
