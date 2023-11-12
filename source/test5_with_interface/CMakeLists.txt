add_library(fun_head INTERFACE)
target_include_directories(fun_head INTERFACE ../../include)

add_executable(test5_main test5.cpp)
target_link_libraries(test5_main PRIVATE fun_head)

mzcy_target_preset_definitions(test5_main)
