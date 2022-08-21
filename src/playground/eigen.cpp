#include "playground/eigen.hpp"

#include <iostream>

Eigen::MatrixXd populateMatrix(int size, int value) {
  Eigen::MatrixXd m(size, size);
  for (int a = 0; a < size; a++) {
    for (int b = 0; b < size; b++) {
      m(a, b) = value;
    }
  }
  return m;
}
