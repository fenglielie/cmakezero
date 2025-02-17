cmake_minimum_required(VERSION 3.15 FATAL_ERROR)
project(Demo VERSION 1.0)

include(cmake/zero.cmake)

zero_init()

zero_info()

zero_get_files_rec(SRCS src)
add_executable(${PROJECT_NAME} ${SRCS})
zero_target_preset_definitions(${PROJECT_NAME})
zero_target_info(${PROJECT_NAME})
