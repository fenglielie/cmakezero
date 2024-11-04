# gcc-setup.cmake

message(STATUS "call gcc-setup.cmake")

set(GCC_PATH "$ENV{HOME}/opt/gcc-11.4.0")
set(GCC_VERSION "11.4.0")

set(ENV{CC} "${GCC_PATH}/bin/gcc")
set(ENV{CXX} "${GCC_PATH}/bin/g++")

set(CMAKE_BUILD_RPATH "${GCC_PATH}/lib/gcc/x86_64-pc-linux-gnu/${GCC_VERSION};${GCC_PATH}/lib64")
set(CMAKE_INSTALL_RPATH "${GCC_PATH}/lib/gcc/x86_64-pc-linux-gnu/${GCC_VERSION};${GCC_PATH}/lib64")

set(ENV{C_INCLUDE_PATH} "${GCC_PATH}/include;$ENV{C_INCLUDE_PATH}")
set(ENV{CPLUS_INCLUDE_PATH} "${GCC_PATH}/include/c++/${GCC_VERSION};$ENV{CPLUS_INCLUDE_PATH}")

message(STATUS ">> GCC_PATH = ${GCC_PATH}")
message(STATUS ">> GCC_VERSION = ${GCC_VERSION}")
message(STATUS ">> CMAKE_C_COMPILER = ${CMAKE_C_COMPILER}")
message(STATUS ">> CMAKE_CXX_COMPILER = ${CMAKE_CXX_COMPILER}")
message(STATUS ">> CMAKE_BUILD_RPATH = ${CMAKE_BUILD_RPATH}")
message(STATUS ">> CMAKE_INSTALL_RPATH = ${CMAKE_INSTALL_RPATH}")
message(STATUS ">> ENV{C_INCLUDE_PATH} = $ENV{C_INCLUDE_PATH}")
message(STATUS ">> ENV{CPLUS_INCLUDE_PATH} = $ENV{CPLUS_INCLUDE_PATH}")
