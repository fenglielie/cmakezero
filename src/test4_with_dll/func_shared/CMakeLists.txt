add_library(func_shared SHARED func_shared.cpp)
target_include_directories(func_shared PUBLIC .)
target_compile_definitions(func_shared PRIVATE "-DMY_EXPORTS")
zero_check_target(func_shared)
