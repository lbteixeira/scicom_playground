find_package(Matplot++ QUIET)

if(Matplot++_FOUND)
  message("-- Found Matplot++")
  set(MATPLOT_TARGET Matplot++::matplot)
else()
  message("")
  message("Matplot++ was not found in the system, using FetchContent instead.")
  message("")
  include(FetchContent)

  FetchContent_Declare(
    matplotplusplus
    GIT_REPOSITORY https://github.com/alandefreitas/matplotplusplus
    GIT_TAG v1.1.0
    GIT_PROGRESS TRUE
  )

  FetchContent_MakeAvailable(matplotplusplus)

  get_target_property(MATPLOTPLUSPLUS_IID matplot INTERFACE_INCLUDE_DIRECTORIES)
  set_target_properties(matplot PROPERTIES INTERFACE_SYSTEM_INCLUDE_DIRECTORIES "${MATPLOTPLUSPLUS_IID}")

  set(MATPLOT_TARGET matplot)

endif()
