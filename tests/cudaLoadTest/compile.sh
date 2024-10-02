# Compile CPU code
#g++ -c cudaLoadTest.cpp -o file1.o

# Compile GPU code
#nvcc --compiler-bindir=/usr/bin/g++-10 -c cudaLoadTest.cu -o file2.o
nvcc --compiler-bindir=/usr/bin/g++-10  cudaLoadTest.cu -o main

# Link object files
#nvcc file1.o file2.o -o main3
#nvcc file2.o -o main3
#./main3
#
#
./main

