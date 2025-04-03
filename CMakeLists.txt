cmake_minimum_required(VERSION 3.15 FATAL_ERROR)
project(CMakeZero VERSION 1.3)

include(cmake/zero.cmake)

zero_init()

zero_info()

zero_add_subdirs(src)

include(CTest)

add_test(NAME test1 COMMAND test1)
add_test(NAME test2 COMMAND test2)
add_test(NAME test3 COMMAND test3)
add_test(NAME test4 COMMAND test4)
add_test(NAME test5 COMMAND test5)

zero_check_update()
