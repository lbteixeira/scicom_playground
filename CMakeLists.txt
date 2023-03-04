cmake_minimum_required(VERSION 3.20.0)

project(playground VERSION 0.0.1 LANGUAGES CXX)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Path to cmake module files. These files add extra functionality into the
# project, including dependencies.
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(NoInSourceBuilds)

# Utilities
include(CppCheck)
include(Format)
include(Doxygen)
include(Memcheck)

# Used when the dependencies are included via include FetchContent
#include(GetEigen)
#include(GetOpenCV)
#include(GetMatplotPlusPlus)
#include(GetGLFW)

# Used when the dependencies are included via vcpkg
find_package(Eigen3 CONFIG REQUIRED)
find_package(OpenCV CONFIG REQUIRED)
find_package(Matplot++ CONFIG REQUIRED)
find_package(glfw3 CONFIG REQUIRED)

add_subdirectory(src)

include(CTest)
if(PLAYGROUND_BUILD_TESTS)
  add_subdirectory(tests)
endif()
