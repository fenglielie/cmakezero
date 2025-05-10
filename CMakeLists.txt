cmake_minimum_required(VERSION 3.15 FATAL_ERROR)
project(CMakeZero VERSION 2.0)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(cmake/zero.cmake)

zero_setup()

zero_check()

zero_add_subdirs(src)

include(CTest)

add_test(NAME test1 COMMAND test1)
add_test(NAME test2 COMMAND test2)
add_test(NAME test3 COMMAND test3)
add_test(NAME test4 COMMAND test4)
add_test(NAME test5 COMMAND test5)
