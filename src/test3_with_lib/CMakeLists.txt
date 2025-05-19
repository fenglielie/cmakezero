add_subdirectory(func_static)

add_executable(test3 test3.cpp)
target_link_libraries(test3 PRIVATE func_static)
zero_check_target(test3)
