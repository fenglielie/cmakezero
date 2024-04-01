cmake_minimum_required(VERSION 3.15 FATAL_ERROR)
project(CMakeZero VERSION 1.0)

# set(CMAKE_MODULE_PATH "$ENV{MY_CMAKE_MODULE_PATH}")
# include(zero.cmake)

include(cmake/zero.cmake)

zero_init()

zero_info()

zero_add_subdirs_rec(source)
