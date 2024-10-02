
#include <iostream>
#include <cuda_runtime.h>

using namespace std;


__global__ void cuda_hello(){
    printf("Hello World from GPU!\n");
}


void get_max_blocks_per_grid(int device_id = 0) {
    cudaDeviceProp props;
    cudaGetDeviceProperties(&props, device_id);

    int max_threads_per_block = props.maxThreadsPerBlock;
    int max_threads_dim = props.maxThreadsDim[0]; // Assuming a 1D grid
    int max_blocks_dim = max_threads_dim / max_threads_per_block;
    int max_blocks_per_grid = max_blocks_dim;

    std::cout << "global memory " << props.totalGlobalMem << std::endl;
    std::cout << "grid size " << props.maxGridSize[0] << std::endl;



    std::cout << "Maximum number of threads per block: " << max_threads_per_block << std::endl;
    std::cout << "Maximum number of threads per dim: " << max_threads_dim << std::endl;
    std::cout << "Maximum number of blocks per dim: " << max_blocks_dim << std::endl;
    std::cout << "Maximum number of blocks per grid: " << max_blocks_per_grid << std::endl;
}




void gpu_memory_info(){
    size_t free_bytes, total_bytes;
    cudaError_t cuda_status = cudaMemGetInfo(&free_bytes, &total_bytes);
    if (cuda_status != cudaSuccess) {
        std::cerr << "Error getting CUDA memory info" << std::endl;
    }

    std::cout << "Total GPU memory: " << total_bytes << " bytes" << std::endl;
    std::cout << "Free GPU memory: " << free_bytes << " bytes" << std::endl;

}

int main(){

    cout<<"Hello world"<<endl;
    cuda_hello<<<1,1>>>();

    gpu_memory_info();
    get_max_blocks_per_grid();

    return 0;

}



