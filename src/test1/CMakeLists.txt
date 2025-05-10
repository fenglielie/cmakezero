zero_get_files(SRCS .)
add_executable(test1 ${SRCS})
target_compile_definitions(test1 PRIVATE NAME="test1")
zero_check_target(test1)
