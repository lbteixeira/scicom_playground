#include "playground/matplot.hpp"

#include <matplot/matplot.h>

#include <cmath>

namespace playground {
int example_plot() {
  std::vector<double> x = matplot::linspace(0, 2 * matplot::pi);
  std::vector<double> y = matplot::transform(x, [](auto x) { return sin(x); });

  matplot::plot(x, y, "-o");
  matplot::hold(matplot::on);
  matplot::plot(x, matplot::transform(y, [](auto y) { return -y; }), "--xr");
  matplot::plot(x, matplot::transform(x, [](auto x) { return x / matplot::pi - 1.; }), "-:gs");
  matplot::plot({1.0, 0.7, 0.4, 0.0, -0.4, -0.7, -1}, "k");

  matplot::show();
  return 0;
}
}  // namespace playground
