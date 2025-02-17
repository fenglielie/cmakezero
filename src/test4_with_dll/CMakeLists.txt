add_library(fun_shared SHARED fun.cpp)
target_include_directories(fun_shared PUBLIC ${PROJECT_SOURCE_DIR}/include)
zero_target_info(fun_shared)

add_executable(test4_main test4.cpp)
target_link_libraries(test4_main PRIVATE fun_shared)
zero_target_info(test4_main)

target_compile_definitions(test4_main PRIVATE "-DDLL_IMPORT")
