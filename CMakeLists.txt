cmake_minimum_required(VERSION 3.18)
project(cmake_export_all_symbols CXX CUDA)

add_library(lib SHARED lib.h lib.cpp lib.cu)
set_target_properties(lib PROPERTIES
        WINDOWS_EXPORT_ALL_SYMBOLS ON
        CUDA_ARCHITECTURES 52)

add_executable(libtest main.cpp)
target_link_libraries(libtest lib)
