#include <catch2/catch_test_macros.hpp>
#include <utility>

// #include "playground/blaze.hpp"
#include "playground/eigen.hpp"

TEST_CASE("Test case 1", "[tag1]") {
  SECTION("First section") {
    REQUIRE(1 + 1 == 2);
  }
}

TEST_CASE("Eigen") {
  int size = 2;
  int value = 1;
  Eigen::MatrixXd m(size, size);

  for (int a = 0; a < size; a++) {
    for (int b = 0; b < size; b++) {
      m(a, b) = value;
    }
  }

  REQUIRE(m == populateMatrix(size, value));
}