add_library(fun_ho INTERFACE)
target_include_directories(fun_ho INTERFACE ../../include)
zero_target_info(fun_ho)

add_executable(test5_main test5.cpp)
target_link_libraries(test5_main PRIVATE fun_ho)
zero_target_preset_definitions(test5_main)
zero_target_info(test5_main)
