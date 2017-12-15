#include "stdio.h"

#define block_size 256
#define MATRIX_SIZE 8000

double A[MATRIX_SIZE][MATRIX_SIZE],
      B[MATRIX_SIZE][MATRIX_SIZE],
      C[MATRIX_SIZE][MATRIX_SIZE];

int main(int argc, char*  argv[])
{
	// Initalize array A and B with '1's
	for (int i = 0; i < MATRIX_SIZE; ++i)
		for (int k = 0; k < MATRIX_SIZE; ++k)
			A[i][k] = B[i][k] = 1.00, C[i][k] = 0.00;

	// Initalize our matix looping variables once
	int k, j, i, jj, kk;

			// Do block matrix multiplication
			for (k = 0; k < MATRIX_SIZE; k += block_size)
				for (j = 0; j < MATRIX_SIZE; j += block_size)
					for (i = 0; i < MATRIX_SIZE; ++i)
						for (jj = j; jj < (j + block_size < MATRIX_SIZE ? j+block_size : MATRIX_SIZE); ++jj)
							for (kk = k; kk < (k + block_size <  MATRIX_SIZE ? k+block_size : MATRIX_SIZE); ++kk)
								C[i][jj] += A[i][kk] * B[kk][jj];
	for(int i = 0; i < MATRIX_SIZE; i++){
		for(int j = 0; j < MATRIX_SIZE; j++)
			printf("%lf ", C[i][j]);
		puts("");
	}
	return 0;
}
