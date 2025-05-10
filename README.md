# CMakeZero

CMakeZero is a CMake script that provides macros and functions to simplify the writing of `CMakeLists.txt`.

## Usage

Download the single file [zero.cmake](cmake/zero.cmake).
```
wget https://raw.githubusercontent.com/fenglielie/cmakezero/main/cmake/zero.cmake
```

Include it in the `CMakeLists.txt`:
```cmake
cmake_minimum_required(VERSION 3.15 FATAL_ERROR)
project(Demo VERSION 1.0)

include(cmake/zero.cmake)

zero_setup()
zero_check()

zero_add_subdirs(src RECURSE)
```

The functions and macros provided by `zero.cmake` are listed below:
```
macros:
- zero_setup()  (call after project)
- zero_check()
functions:
- zero_add_subdirs(src): go to src/CMakeLists.txt and src/*/CMakeLists.txt
- zero_add_subdirs(src RECURSE): go to src/CMakeLists.txt and src/*/*/CMakeLists.txt (recurse)
- zero_get_files(tmp test): search source files in test/ => tmp
- zero_get_files(tmp test RECURSE): search source files in test/ and test/*/ => tmp (recurse)
- zero_check_target(targetname): display target properties
```
