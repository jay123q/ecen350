/* main.c simple program to test assembler program */

#include <stdio.h>

//extern long long int my_mul(long long int a, long long int b);
extern long long int Lab04b(long long int a);
int main(void)
{
//    long long int a = my_mul(3, 5);
//    printf("Result of my_mul(3, 5) = %ld\n", a);
    long long int c = Lab04b(3);
    printf("Results of my factorial =%ld\n",c);
    return 0;
}
