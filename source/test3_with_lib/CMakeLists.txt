add_library(fun_static STATIC fun.cpp)
target_include_directories(fun_static PUBLIC ../../include)

add_executable(test3_main test3.cpp)
target_link_libraries(test3_main PRIVATE fun_static)
