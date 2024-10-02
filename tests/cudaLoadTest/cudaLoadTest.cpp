


#include <iostream>
#include <cuda_runtime.h>

using namespace std;

__global__ void cuda_hello(){
    printf("Hello World from GPU!\n");
}


void gpu_memory_info(){
    size_t free_bytes, total_bytes;
    cudaError_t cuda_status = cudaMemGetInfo(&free_bytes, &total_bytes);
    if (cuda_status != cudaSuccess) {
        std::cerr << "Error getting CUDA memory info" << std::endl;
        return ;
    }

    std::cout << "Total GPU memory: " << total_bytes << " bytes" << std::endl;
    std::cout << "Free GPU memory: " << free_bytes << " bytes" << std::endl;

}

int main(){

    cout<<"Hello world"<<endl;
    cuda_hello<<<1,1>>>();

    gpu_memory_info();

    return 0;

}



