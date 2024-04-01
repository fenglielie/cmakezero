# mzcy_cmake_utils

mzcy_cmake_utils 是一个 CMake 工具脚本，
提供一系列的宏和函数，包括执行常见的任务，例如设置输出目录、添加并遍历子目录、打印并检查信息等，
可以用于简化项目配置和构建过程，让CMakeLists.txt更加简洁。


## 使用说明——通用宏

### `mzcy_usage`

显示mzcy_cmake_utils自带的使用说明

```cmake
macro(mzcy_usage)
```

内容如下

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



### `mzcy_init`/`mzcy_init_quiet`

调用`mzcy_usage`来显示使用说明，然后对项目进行一些初始化设置，例如：

- 设置可执行文件，库文件的输出目录
- 设置默认模式为Release
- 设置C++标准，禁用C++扩展等
- 禁止在项目根目录进行配置，这会产生大量临时文件污染项目，建议使用`build/`子目录
- 设置编译器参数，支持MSVC，clang，gcc

`mzcy_init_quiet`是`mzcy_init`的静默版本，不会调用`mzcy_usage`。

```cmake
macro(mzcy_init)

macro(mzcy_init_quiet)
```

要求在`project(...)`命令之后调用。

### `mzcy_info`

显示项目相关信息，例如

- 系统信息
- 编译器名称及版本
- 构建类型
- c_flags 和 cxx_flags 等编译器参数

```cmake
macro(mzcy_info)
```

### `mzcy_use_bin_subdir`

将debug模式下的可执行文件输出目录修改为`bin/debug/`，默认为`bin/`。

```cmake
macro(mzcy_use_bin_subdir)
```

### `mzcy_add_my_rpath`

如果当前是Linux系统，将环境变量 `MY_RPATH` 添加到 rpath，以便在运行时优先查找到指定版本的依赖项，例如在系统中存在不同版本的C++标准库时。

```cmake
macro(mzcy_add_my_rpath)
```

### `mzcy_enable_qt`/`mzcy_disable_qt`

启用或禁用 Qt 相关的 CMake 支持，包括：`CMAKE_AUTOMOC`, `CMAKE_AUTOUIC`, `CMAKE_AUTORCC`。

```cmake
macro(mzcy_enable_qt)

macro(mzcy_disable_qt)
```

## 使用说明——通用函数

### `mzcy_get_files`/`mzcy_get_files_rec`

在指定目录中按照若干文件后缀来搜索源文件，并通过参数返回。`mzcy_get_files_rec`是`mzcy_get_files`的递归版本。

```cmake
function(mzcy_get_files rst _sources)

function(mzcy_get_files_rec rst _sources)
```

例如添加`test/`中的所有源文件到`tmp`中
```cmake
mzcy_get_files(tmp test)
```

### `mzcy_add_subdirs`/`mzcy_add_subdirs_rec`

添加指定目录及其子目录中包含的 CMakeLists.txt，然后会依次进入相应的目录执行 CMakeList.txt。`mzcy_add_subdirs_rec`是`mzcy_add_subdirs`的递归版本。

```cmake
function(mzcy_add_subdirs _path)

function(mzcy_add_subdirs_rec _path)
```

例如在顶级目录中使用
```cmake
mzcy_add_subdirs_rec(src)
```

## 使用说明——关于指定target的函数

### `mzcy_target_preset_definitions`

为指定目标添加如下的预定义宏：

- `MZCY_TARGET_NAME=targetname`
- `MZCY_PROJECT_SOURCE_DIR=PROJECT_SOURCE_DIR`
- `MZCY_CURRENT_SOURCE_DIR=CMAKE_CURRENT_SOURCE_DIR`

```cmake
function(mzcy_target_preset_definitions _target)
```

### `mzcy_target_use_postfix`

为指定目标在 Debug 模式下添加`_d`后缀，这个行为对于库文件是默认的，但是对于可执行文件是可选的。

```cmake
function(mzcy_target_use_postfix _target)
```

### `mzcy_target_reset_output`

指定当前目标的输出路径，需要在`_type`参数中提供目标类型，支持RUNTIME、ARCHIVE或LIBRARY。

```cmake
function(mzcy_target_reset_output _target _type _path)
```

### `mzcy_target_info`

显示指定目标的属性信息，尤其在调试时有用。

```cmake
function(mzcy_target_info _target)
```
