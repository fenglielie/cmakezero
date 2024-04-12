add_library(fun_static STATIC fun.cpp)
target_include_directories(fun_static PUBLIC ../../include)
zero_target_info(fun_static)

add_executable(test3_main test3.cpp)
target_link_libraries(test3_main PRIVATE fun_static)
zero_target_info(test3_main)
