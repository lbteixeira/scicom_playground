# Files that have to be compiled
set(PROJECT_FILES
  eigen.cpp
  opencv.cpp
  matplot.cpp
)

# Generate an obj file that can be used to build static and shared libraries
add_library(playground_obj OBJECT ${PROJECT_FILES})

# Non-default compilation flags
if(${CMAKE_CXX_COMPILER_ID} STREQUAL GNU)
  set(EXTRA_COMPILATION_FLAGS
      -Werror -Wall -Wextra -pedantic-errors -Wconversion -Wsign-conversion)
  target_compile_options(playground_obj PRIVATE ${EXTRA_COMPILATION_FLAGS})
endif()

# Runs Cppcheck on the obj library if in Debug mode
if(${CMAKE_BUILD_TYPE} STREQUAL Debug AND
   ${CMAKE_CXX_COMPILER_ID} STREQUAL GNU)
  AddCppCheck(playground_obj)
endif()

# Linking the dependencies to the obj library
target_link_libraries(playground_obj PRIVATE
  Eigen3::Eigen
  Matplot++::matplot
  ${OpenCV_LIBS}
)

target_include_directories(playground_obj PUBLIC
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>")

# Create a static library target and link the obj into it
add_library(playground_static STATIC)
target_link_libraries(playground_static playground_obj)

# Copy the compile_commands file to the project's root during build time. Only
# executed if the file is exported during configuration time.
if(CMAKE_EXPORT_COMPILE_COMMANDS)
add_custom_command(
  TARGET playground_static
  COMMAND ${CMAKE_COMMAND}
  ARGS -E copy ${CMAKE_BINARY_DIR}/compile_commands.json ${CMAKE_SOURCE_DIR}
  )
endif()

# Formats the source files according to the style defined by .clang-format
if(${CMAKE_CXX_COMPILER_ID} STREQUAL GNU)
  Format(playground_static .)
endif()

# Create the documentation target
if(PLAYGROUND_BUILD_DOC)
  Doxygen(playground_static src/CMakeLists.txt)
endif()

