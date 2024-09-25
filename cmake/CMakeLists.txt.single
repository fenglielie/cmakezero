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

# c++ standard = C++20(required)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# change the project name
project(Demo)

# ./bin
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/bin")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

# ./lib
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/lib")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})

# ./lib
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/lib")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})

# c/c++ compile flags
if (("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU") OR ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang"))
    set(common_flags  "-Wall -Wextra -Wfatal-errors -Wshadow -Wno-unused-parameter")
elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
    set(common_flags "/W3 /WX /MP /utf-8")
else()
    set(common_flags "")
endif()

# empty
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${common_flags}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${common_flags}")

# debug default: -g
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} ${common_flags}")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} ${common_flags}")

# release default: -O3 -DNDEBUG
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} ${common_flags}")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} ${common_flags}")

# add a executable target
file(GLOB_RECURSE SRCS CONFIGURE_DEPENDS src/*.cpp include/*.h)
add_executable(${PROJECT_NAME} ${SRCS})
