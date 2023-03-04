if(${CMAKE_CXX_COMPILER_ID} STREQUAL GNU)
  include(Memcheck)
endif()

# Add target for the tests executable.
add_executable(playground_tests
  test-1.cpp
)

# Link target to the testing framework, to the library being tested and to
# other dependencies.
target_link_libraries(playground_tests
  playground_static
  Catch2::Catch2WithMain
)

include(Catch)
catch_discover_tests(playground_tests
                     WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                     )

if(${CMAKE_CXX_COMPILER_ID} STREQUAL GNU)
  Format(playground_tests .)
  AddMemcheck(playground_tests)
endif()
