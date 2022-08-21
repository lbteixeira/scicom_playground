enable_testing()

find_package(Catch2 3 QUIET)

if(Catch2_FOUND)
  message("-- Found Catch2")
else()
  message("")
  message("Catch2 was not found in the system, using FetchContent instead.")
  message("")
  Include(FetchContent)

  FetchContent_Declare(
    Catch2
    GIT_REPOSITORY "https://github.com/catchorg/Catch2.git"
    GIT_TAG        "605a34765aa5d5ecbf476b4598a862ada971b0cc" #v3.0.1
  )

  FetchContent_MakeAvailable(Catch2)

  # The path to the Catch.cmake file needs to be included manually. This files
  # enables the automatic test detection.
  list(APPEND CMAKE_MODULE_PATH "${catch2_SOURCE_DIR}/extras")
endif()

# Automatic test discovery.
include(CTest)
include(Catch)
