/* main.c simple program to test assembler program */

#include <stdio.h>

//extern long long int test(long long int a, long long int b);
//extern void lab03b();
extern void Lab03c(long long int a);

int main(void)
{
//    long long int a = test(3, 5);
//    lab03b();
//    printf("Result of test(3, 5) = %ld\n", a);
	Lab03c(9);
    return 0;
}
