cmake_minimum_required(VERSION 3.4)

project(cmake_export_all_symbols)

option(BUILD_SHARED_LIBS "Build a DLL" ON)

find_package(CUDA REQUIRED)


cuda_add_library(lib lib.h lib.cpp lib.cu)
if(BUILD_SHARED_LIBS)
    set_target_properties(lib PROPERTIES WINDOWS_EXPORT_ALL_SYMBOLS ON)
endif()

include_directories(${CUDA_INCLUDE_DIRECTORIES})

add_executable(libtest main.cpp)

target_link_libraries(libtest lib)