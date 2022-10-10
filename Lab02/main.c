#include <stdio.h>
//extern long long int test();
//extern long long int lab02b();
//extern void lab02c(long long int a);
extern long long int lab02d(long long int a);

int main(void)
{
//	test();
//	lab02b();
//	lab02c(2);
	long long int b = lab02d(0);
	printf ("Result is = %d\n", b);
    return 0;
}
