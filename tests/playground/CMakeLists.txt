include(GetEigen)
include(Memcheck)

# Add target for the tests executable.
add_executable(playground_tests
  test-1.cpp
)

include(Format)
Format(playground_tests .)

# Link target to the testing framework, to the library being tested and to
# other dependencies.
target_link_libraries(playground_tests
  playground_static

  Catch2::Catch2WithMain
  Eigen3::Eigen
  ${BLAZE_TARGET}
)

catch_discover_tests(playground_tests)
AddMemcheck(playground_tests)
