cmake_minimum_required(VERSION 3.15 FATAL_ERROR)

if(PROJECT_BINARY_DIR STREQUAL PROJECT_SOURCE_DIR)
    message(FATAL_ERROR "The binary directory cannot be the same as source directory")
endif()

if(NOT CMAKE_BUILD_TYPE)
    message(STATUS ">> default CMAKE_BUILD_TYPE: \"Release\"")
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel." FORCE)
endif()

# keep use folders in build/
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# create compile_commands.json in build/
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# c++ standard = C++20 (required)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# change the project name
project(Demo VERSION 1.0)

# add a executable target
file(GLOB_RECURSE SRCS CONFIGURE_DEPENDS src/*.cpp)
add_executable(${PROJECT_NAME} ${SRCS})
