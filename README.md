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

## CMakelists Templates

without cmakezero
```cpp
cmake_minimum_required(VERSION 3.15 FATAL_ERROR)

if(PROJECT_BINARY_DIR STREQUAL PROJECT_SOURCE_DIR)
    message(FATAL_ERROR "The binary directory cannot be the same as source directory")
endif()

if(NOT CMAKE_BUILD_TYPE)
    message(STATUS ">> default CMAKE_BUILD_TYPE: \"Release\"")
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel." FORCE)
endif()

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
 
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

project(Demo VERSION 1.0)

file(GLOB_RECURSE SRCS CONFIGURE_DEPENDS src/*.cpp)
add_executable(${PROJECT_NAME} ${SRCS})
```

with cmakezero
```cpp
cmake_minimum_required(VERSION 3.15 FATAL_ERROR)
project(Demo VERSION 1.0)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(cmake/zero.cmake)

zero_setup()

zero_check()

zero_get_files(SRCS src RECURSE)
add_executable(${PROJECT_NAME} ${SRCS})
zero_check_target(${PROJECT_NAME})
```



