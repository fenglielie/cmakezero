# mzcy_cmake_utils

This is a set of CMake scripts along with several examples:

1. **cmake/mzcy_utils-beta.cmake**: Beta version for testing, subject to continuous updates.
2. **cmake/mzcy_utils.cmake**: Stable version, placed on the server and the mzcy_dotfiles repository.


These scripts encapsulate common CMake functionalities. The stable version is intended for production use, while the beta version is available for testing and may undergo frequent updates.

use the following command to download the stable version of the script from the network :

```bash
wget files.fenglielie.top/mzcy_utils.cmake
```

The script provides the following functions and macros:

* macro usage:
    * **mzcy_init()**: print usage, init the project (call after project)
    * **mzcy_init_quiet()**: init the project  (call after project)
    * **mzcy_info()**: show infomation
    * **mzcy_usage()**: print this usage
    * **mzcy_use_bin_subdir()**: use bin/debug as runtime output directory when Debug
    * **mzcy_add_my_rpath()**: add environment variable ENV{MY_RPATH} to rpath
    * **mzcy_enable_qt()**: enable CMAKE_AUTOMOC,CMAKE_AUTOUIC,CMAKE_AUTORCC
    * **mzcy_disable_qt()**: disable CMAKE_AUTOMOC,CMAKE_AUTOUIC,CMAKE_AUTORCC

* function usage:
    * **mzcy_add_subdirs(src)**: go to src/CMakeLists.txt and src/*/CMakeLists.txt
    * **mzcy_add_subdirs_rec(src)**: go to src/CMakeLists.txt and src/*/*/CMakeLists.txt (recurse)
    * **mzcy_get_files(tmp test)**: search source files in test/ |*> tmp
    * **mzcy_get_files_rec(tmp test)**: search source files in test/ and test/*/ |*> tmp (recurse)

* target function usage:
    * **mzcy_target_preset_definitions(targetname)**: add some definitions
        * MZCY_TARGET_NAME=targetname
        * MZCY_PROJECT_SOURCE_DIR=PROJECT_SOURCE_DIR
        * MZCY_CURRENT_SOURCE_DIR=CMAKE_CURRENT_SOURCE_DIR
    * **mzcy_target_use_postfix(targetname)**: add postfix _d when Debug (default in library)
    * **mzcy_target_reset_output(targetname RUNTIME path)**: change RUNTIME output to path (RUNTIME|ARCHIVE|LIBRARY)
    * **mzcy_target_info(targetname)**: show target properties
