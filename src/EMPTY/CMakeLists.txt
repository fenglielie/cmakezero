add_executable(empty empty.cpp)

zero_target_use_postfix(empty)
zero_target_reset_output(empty RUNTIME ${PROJECT_SOURCE_DIR}/bin/test/)
