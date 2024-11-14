# setup_gcc.cmake

message(STATUS "call setup_gcc.cmake")

macro(setup_gcc GCC_PATH)
    set(CMAKE_C_COMPILER "${GCC_PATH}/bin/gcc")
    set(CMAKE_CXX_COMPILER "${GCC_PATH}/bin/g++")

    set(CMAKE_BUILD_RPATH "${GCC_PATH}/lib;${GCC_PATH}/lib64")
    set(CMAKE_INSTALL_RPATH "${GCC_PATH}/lib;${GCC_PATH}/lib64")

    message(STATUS ">> CMAKE_C_COMPILER = ${CMAKE_C_COMPILER}")
    message(STATUS ">> CMAKE_CXX_COMPILER = ${CMAKE_CXX_COMPILER}")
    message(STATUS ">> CMAKE_BUILD_RPATH = ${CMAKE_BUILD_RPATH}")
    message(STATUS ">> CMAKE_INSTALL_RPATH = ${CMAKE_INSTALL_RPATH}")

endmacro()
