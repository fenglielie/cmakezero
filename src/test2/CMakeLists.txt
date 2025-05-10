zero_get_files(SRCS . RECURSE)
add_executable(test2 ${SRCS})
zero_check_target(test2)
