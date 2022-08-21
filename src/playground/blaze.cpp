#define BLAZE_BLAS_MODE 1
#define BLAZE_DEFAULT_STORAGE_ORDER blaze::rowMajor
#define BLAZE_CACHE_SIZE 3145728UL;
#define BLAZE_DEFAULT_TRANSPOSE_FLAG blaze::columnVector
#define BLAZE_USE_VECTORIZATION 1

#include "playground/blaze.hpp"

#include "blaze/math/StaticVector.h"

blaze::DynamicVector<int> sumVectors() {
  blaze::StaticVector<int, 3UL> a{4, -2, 5};
  blaze::DynamicVector<int> b(3UL);
  b[0] = 2;
  b[1] = 5;
  b[2] = -3;

  // Adding the vectors a and b
  blaze::DynamicVector<int> c = a + b;
  return c;
}
