add_executable(empty empty.cpp)

mzcy_target_use_postfix(empty)
mzcy_target_reset_output(empty RUNTIME ${PROJECT_SOURCE_DIR}/bin/test/)
