# Create the library target associated with the application business logic.
# The file containing the main function shouldn't be included in the library.
add_library(playground_app_static STATIC
  gui_manager.cpp
)
target_compile_options(playground_app_static PRIVATE ${EXTRA_COMPILATION_FLAGS})

# Include directories for the business logic related library
target_include_directories(playground_app_static PUBLIC include)

target_link_libraries(playground_app_static PUBLIC
  playground_static
  glfw
  #Matplot++::cimg Matplot++::matplot Matplot++::nodesoup
)

add_executable(playground_app main.cpp)
target_link_libraries(playground_app playground_app_static)

if(${CMAKE_CXX_COMPILER_ID} STREQUAL GNU)
  Format(playground_app .)
  AddMemcheck(playground_app)
endif()

# Create the documentation target
if(PLAYGROUND_BUILD_DOC)
  Doxygen(playground_app src/CMakeLists.txt)
endif()
