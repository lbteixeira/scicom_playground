cmake_minimum_required(VERSION 3.20.0)

project(playground VERSION 0.0.1 LANGUAGES CXX)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Path to cmake module files. These files add extra functionality into the
# project, including dependencies.
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(NoInSourceBuilds)

add_subdirectory(src)

if(PLAYGROUND_BUILD_TESTS)
  add_subdirectory(tests)
endif()
