cmake_minimum_required(VERSION 3.8 FATAL_ERROR)


# Specify the path to the g++ and nvcc compilers

# Specify the path to the nvcc compiler
#set(CMAKE_CUDA_COMPILER "/usr/lib/cuda-11.2/bin/nvcc")

#set(CUDAToolkit_ROOT "/usr/lib/cuda-11.2")

# Force nvcc to use a specific version of g++ (e.g., g++-9)
#set(CMAKE_CUDA_HOST_COMPILER "/usr/bin/g++-10")


project(Basicnet LANGUAGES CXX CUDA)

#enable_language(CUDA)



# Set the library type (STATIC or SHARED)
set(LIBRARY_TYPE STATIC)  # Change to SHARED for shared library

# Add your source files (adjust to your actual file names)
#set(SOURCES
#    src/*    # C++ source file(s)
#)

# Recursively find all .cpp and .cu files in src/
file(GLOB_RECURSE SOURCES 
    src/*.cpp
   src/*.cu
)


# Add your include directories
include_directories(
    #    ${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES}
include/                   # Path to the library headers
    )


# Enable position-independent code (useful for shared libraries)
#set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# Define the library
add_library(${PROJECT_NAME} ${LIBRARY_TYPE} ${SOURCES})



include(CheckLanguage)
check_language(CUDA)

if(CMAKE_CUDA_COMPILER)
    enable_language(CUDA)
    find_package(CUDAToolkit)
    target_link_libraries(${PROJECT_NAME} CUDA::cudart)
else()
    message(STATUS "No CUDA compiler found")
endif()

# Link CUDA runtime library

# Set compile options for C++ source files
#target_compile_options(${PROJECT_NAME} PRIVATE 
#    -Wall                   # Enable all warnings
#    -Wextra                # Enable extra warnings
#)

# Set compile options for CUDA and C++
#target_compile_options(${PROJECT_NAME} PRIVATE $<$<COMPILE_LANGUAGE:CUDA>:
#    --expt-relaxed-constexpr    # CUDA specific flags, like enabling constexpr support
    # --compiler-bindir=/usr/bin/g++-10
    #    >)

# Set properties for CUDA (if needed)
#set_target_properties(${PROJECT_NAME} PROPERTIES
#    CUDA_SEPARABLE_COMPILATION ON
#    POSITION_INDEPENDENT_CODE ON
#)


