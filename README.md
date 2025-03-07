# CMakeZero

CMakeZero is a CMake script that provides macros and functions to simplify the writing of `CMakeLists.txt`.

## Usage

```
-- macro usage:
   - zero_usage(): print usage
   - zero_init(): print usage, then init the project (call after project)
   - zero_init_quiet(): init the project (call after project)
   - zero_info(): show infomation
   - zero_check_update(): check for updates to zero.cmake

-- function usage:
   - zero_add_subdirs(src): go to src/CMakeLists.txt and src/*/CMakeLists.txt
   - zero_add_subdirs_rec(src): go to src/CMakeLists.txt and src/*/*/CMakeLists.txt (recurse)
   - zero_get_files(tmp test): search source files in test/ => tmp
   - zero_get_files_rec(tmp test): search source files in test/ and test/*/ => tmp (recurse)

-- target function usage:
   - zero_target_preset_definitions(targetname): add some compile definitions
     * ZERO_TARGET_NAME=targetname
     * ZERO_PROJECT_SOURCE_DIR=PROJECT_SOURCE_DIR
     * ZERO_CURRENT_SOURCE_DIR=CMAKE_CURRENT_SOURCE_DIR
   - zero_target_info(targetname): show target properties
```


## Example

Manually download the [zero.cmake](cmake/zero.cmake) file and place it in the `cmake/` subdirectory of your project root. You can also download it using the following command:
```
wget https://raw.githubusercontent.com/fenglielie/cmakezero/main/cmake/zero.cmake
```

Then, import it in the `CMakeLists.txt` of your project:
```cmake
cmake_minimum_required(VERSION 3.15 FATAL_ERROR)
project(Demo VERSION 1.0)

include(cmake/zero.cmake)

zero_init()
zero_info()

zero_add_subdirs_rec(src)

zero_check_update()
```

After that, you can use the functions and macros provided by `zero.cmake` to simplify the writing of `CMakeLists.txt`.

For example, add an executable target using all source files in the current directory (and recursive subdirectories):
```cmake
zero_get_files_rec(SRCS .)
add_executable(test ${SRCS})
```

Add some compile definitions and show properties
```cmake
zero_get_files_rec(SRCS .)
add_executable(test ${SRCS})
zero_target_preset_definitions(test)
zero_target_info(test)
```

The output of `zero_target_info` is like this:
```
[cmake] -- ---------- <Check Target Begin> ----------
[cmake] -- name: test1
[cmake] -- type: executable
[cmake] -- location: /path/to/cmakezero/src/test1
[cmake] -- sources:
[cmake] --   * /path/to/cmakezero/src/test1/test1.cpp
[cmake] -- compile_definitions:
[cmake] --   * ZERO_TARGET_NAME="test1"
[cmake] --   * ZERO_PROJECT_SOURCE_DIR="/path/to/cmakezero"
[cmake] --   * ZERO_CURRENT_SOURCE_DIR="/path/to/cmakezero/src/test1"
```
