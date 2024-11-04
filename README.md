# CMakeZero

CMakeZero is a CMake script that simplifies the setup and management of CMake projects. It provides macros and functions to streamline common tasks in CMake projects.

## Usage

### Macros

- **`zero_usage()`**: Print usage information.
- **`zero_init()`**: Print usage and initialize the project (call after `project`).
- **`zero_init_quiet()`**: Initialize the project (call after `project`).
- **`zero_info()`**: Show information about the current project setup.
- **`zero_use_bin_subdir()`**: Use `bin/debug` as the runtime output directory when in Debug mode.

### Functions

- **`zero_add_subdirs(src)`**: Navigate to `src/CMakeLists.txt` and all `src/*/CMakeLists.txt`.
- **`zero_add_subdirs_rec(src)`**: Navigate to `src/CMakeLists.txt` and all `src/*/*/CMakeLists.txt` (recursive).
- **`zero_get_files(tmp test)`**: Search for source files in the `test/` directory and store them in `tmp`.
- **`zero_get_files_rec(tmp test)`**: Search for source files in the `test/` directory and all its subdirectories, storing results in `tmp` (recursive).

### Target Functions

- **`zero_target_preset_definitions(targetname)`**: Add predefined compiler definitions for the target.
  - `ZERO_TARGET_NAME=targetname`
  - `ZERO_PROJECT_SOURCE_DIR=PROJECT_SOURCE_DIR`
  - `ZERO_CURRENT_SOURCE_DIR=CMAKE_CURRENT_SOURCE_DIR`
- **`zero_target_use_postfix(targetname)`**: Append `_d` to the target name when in Debug mode (default for libraries).
- **`zero_target_reset_output(targetname RUNTIME path)`**: Change the RUNTIME output directory to `path` (can be RUNTIME, ARCHIVE, or LIBRARY).
- **`zero_target_info(targetname)`**: Display properties of the specified target.


## Example

Manually download the [zero.cmake](cmake/zero.cmake) file and place it in the `cmake/` subdirectory of your project root. You can also download it using the following command:
```
wget https://raw.githubusercontent.com/fenglielie/cmakezero/main/cmake/zero.cmake
```

Then, import it in the `CMakeLists.txt` located in your project root:
```cmake
cmake_minimum_required(VERSION 3.15 FATAL_ERROR)
project(Demo VERSION 1.0)

include(cmake/zero.cmake)

zero_init()
zero_info()

zero_add_subdirs_rec(src)
```

After that, you can use the functions and macros provided by `zero.cmake` to simplify the writing of your `CMakeLists.txt`.
For example, to generate an executable target using all source files in the current directory (and recursive subdirectories):
```cmake
zero_get_files_rec(SRCS .)
add_executable(test ${SRCS})
```
Or:
```cmake
zero_get_files_rec(SRCS .)
add_executable(test ${SRCS})
zero_target_preset_definitions(test)
zero_target_info(test)
```
