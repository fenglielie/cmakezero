
add_library(fun_shared SHARED fun.cpp)
target_include_directories(fun_shared PUBLIC ../../include)

add_executable(test4_main test4.cpp)
target_link_libraries(test4_main PRIVATE fun_shared)
