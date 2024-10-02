

#ifndef BASICNET_CORE_GPU_MATRIX_HPP
#define BASICNET_CORE_GPU_MATRIX_HPP


#include <iostream>
using namespace std;

namespace basicnet{
namespace core{

class GpuMatrix {
    public:  
        GpuMatrix(); 

    private:

        size_t rows;
        size_t cols;
        float *d;
};


}
}



#endif
