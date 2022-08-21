#include <GLFW/glfw3.h>

#include <iostream>

#include "gui_manager.hpp"
#include "playground/matplot.hpp"

int main() {
  playground_app::gui_manager gui_manager(300, 300, "My window");

  gui_manager.terminate_glfw_if_no_window();
  gui_manager.window_loop();
  playground::example_plot();
}
