add_library(func_static STATIC func_static.cpp)
target_include_directories(func_static PUBLIC .)
zero_check_target(func_static)
