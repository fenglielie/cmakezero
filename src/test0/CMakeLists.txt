add_executable(test0 test0.cpp)
zero_target_use_postfix(test0)
zero_target_reset_output(test0 RUNTIME ${PROJECT_SOURCE_DIR}/bin/test/)
