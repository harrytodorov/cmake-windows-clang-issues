The repository is based on [cmake-windows-export-all-issue](https://github.com/willyd/cmake-windows-export-all-issue) by GitHub user [willyd](https://github.com/willyd).

## Steps to reproduce
Assuming `CMake (v3.18+)`, `Clang`, `CUDA` and `Ninja` are installed on the system and are part of the `PATH` environment variable.

Open a regular `cmd` prompt and run the following commands.
```cmd
# Activate the MSVC's vcvars 64 enviroment.
# The path below assumes a default installation of VS 2019 Community edition.
> "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
# Make sure CMake picks up clang(++) instead of cl.
> set CC=clang.exe
> set CXX=clang++.exe
# Configure and build the project.
> mkdir build
> cd build
> cmake.exe -GNinja ..
> cmake.exe --build .
```

Executing the last build command produces following link errors:
```cmd
clang++: error: no such file or directory: '/DEF:CMakeFiles\lib.dir\.\exports.def'
clang++: error: no such file or directory: 'cudadevrt.lib'
clang++: error: no such file or directory: 'cudart_static.lib'
```