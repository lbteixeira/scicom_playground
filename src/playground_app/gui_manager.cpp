#include "gui_manager.hpp"

#include <GLFW/glfw3.h>

#include <iostream>

namespace playground_app {

gui_manager::gui_manager(int width, int height, const char* title) : _width(width), _height(height), _title(title) {
  if (!glfwInit()) {
    fprintf(stderr, "Failed to initialize GLFW\n");
    exit(EXIT_FAILURE);
  }

  _window = glfwCreateWindow(_width, _height, _title, NULL, NULL);
}

void gui_manager::terminate_glfw_if_no_window() {
  if (!_window) {
    fprintf(stderr, "Failed to open GLFW window\n");
    glfwTerminate();
    exit(EXIT_FAILURE);
  }
}

void gui_manager::window_loop() {
  while (!glfwWindowShouldClose(_window)) {
    glfwSwapBuffers(_window);
    glfwPollEvents();
  }

  glfwTerminate();
}

}  // namespace playground_app
