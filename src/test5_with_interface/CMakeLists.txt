add_subdirectory(func_interface)

add_executable(test5 test5.cpp)
target_link_libraries(test5 PRIVATE func_interface)
zero_target_preset_definitions(test5)
zero_target_info(test5)
