cmake_minimum_required(VERSION 3.15 FATAL_ERROR)
project(CMakeZero VERSION 1.2)

include(cmake/zero.cmake)

zero_init()

zero_info()

zero_add_subdirs_rec(src)

include(CTest)

zero_add_subdirs_rec(test)

zero_check_update()
