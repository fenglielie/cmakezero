add_subdirectory(func_shared)

add_executable(test4 test4.cpp)
target_link_libraries(test4 PRIVATE func_shared)
zero_check_target(test4)
