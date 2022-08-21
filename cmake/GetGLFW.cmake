find_package(glfw3 QUIET)

if(glfw3_FOUND)
  message("-- Found GLFW3")
else()
  message("")
  message("GLFW3 was not found in the system, using FetchContent instead.")
  message("")
  include(FetchContent)

  FetchContent_Declare(
    glfw
    GIT_REPOSITORY https://github.com/glfw/glfw
    GIT_TAG 3.3.8
  )

  # Doesn't build parts of GLFW which aren't necessary for the project
  option(GLFW_BUILD_EXAMPLES "" OFF)
  option(GLFW_BUILD_TESTS "" OFF)
  option(GLFW_BUILD_DOCS "" OFF)
  option(GLFW_INSTALL "" OFF)

  FetchContent_MakeAvailable(glfw)

endif()
