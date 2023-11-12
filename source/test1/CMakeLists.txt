mzcy_get_files_rec(SRCS .)
add_executable(helloworld ${SRCS})


mzcy_target_preset_definitions(helloworld)

mzcy_target_info(helloworld)
