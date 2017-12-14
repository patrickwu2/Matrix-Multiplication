#include <stdio.h>
#include "mkl.h"
#define max 8000
double A[max*max] = {};
double B[max*max] = {};
double C[max*max] = {};
	
int main(){
	for(int i = 0; i < max; i++)
		for(int j = 0; j < max; j++)
			A[max*i+j] = B[max*i+j] = 1.00;
	cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, max, max, max, 1, A, max, B, max, 0, C, max);
	for(int i = 0; i < max; i++){
		for(int j = 0; j < max; j++)
			printf("%lf ", C[max*i+j]);
		puts("");
	}
	return 0;
}
