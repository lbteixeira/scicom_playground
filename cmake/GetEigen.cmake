find_package(Eigen3 QUIET)

if(Eigen3_FOUND)
  message("-- Found Eigen3")
else()
  message("")
  message("Eigen3 was not found in the system, using FetchContent instead.")
  message("")
  include(FetchContent)

  FetchContent_Declare(
    Eigen
    GIT_REPOSITORY https://gitlab.com/libeigen/eigen
    GIT_TAG 3.4.0
  )

  option(EIGEN_BUILD_DOC "" OFF)
  option(EIGEN_BUILD_PKGCONFIG "" OFF)
  option(BUILD_TESTING "" OFF)

  FetchContent_MakeAvailable(Eigen)

endif()

set(EIGEN_TARGET Eigen3::Eigen)
