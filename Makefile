TARGET=Naive BLOCK Naive_O3 BLOCK_O3 Open MKL BLAS
CC=gcc
#OpenBlas
O_LIB=-L/opt/OpenBLAS/lib
O_INCLUDE=-I /opt/OpenBLAS/include/
export O_FLAGS=-lopenblas -lpthread --static
export OPENBLAS_NUM_THREADS=4
#INTEL
MKLROOT=/home/patrickwu2/intel/mkl
LINK= -Wl,--start-group ${MKLROOT}/lib/intel64/libmkl_intel_ilp64.a ${MKLROOT}/lib/intel64/libmkl_gnu_thread.a ${MKLROOT}/lib/intel64/libmkl_core.a -Wl,--end-group -lgomp -lpthread -lm -ldl
OPTION=-DMKL_ILP64 -m64 -I${MKLROOT}/include
#BLAS
CBLASROOT=/home/patrickwu2/Desktop/CBLAS
BLASROOT=/home/patrickwu2/Desktop/BLAS-3.8.0
OBJ=${CBLASROOT}/testing/c_dblas3.o ${CBLASROOT}/testing/c_d3chke.o ${CBLASROOT}/testing/auxiliary.o  ${CBLASROOT}/testing/c_xerbla.o
B_INCLUDE=-I ${CBLASROOT}/include/
B_LIB=${CBLASROOT}/lib/LINUX.a ${BLASROOT}/blas_LINUX.a
all:$(TARGET)

Naive: naive.c
	$(CC) naive.c -o $@
BLOCK: block.c
	$(CC) block.c -o $@
Naive_O3: naive.c
	$(CC) -O3 naive.c -o $@
BLOCK_O3: block.c
	$(CC) -O3 block.c -o $@
Open: mat.c
	$(CC) mat.c $(O_LIB) $(O_INCLUDE) $(O_FLAGS) -o $@
MKL: mat_intel.c
	$(CC) mat_intel.c $(LINK) $(OPTION) -o $@
BLAS: mat_blas.c
	$(CC) mat_blas.c $(OBJ) $(B_INCLUDE) $(B_LIB) -o $@
clean:
	rm -rf $(TARGET)
