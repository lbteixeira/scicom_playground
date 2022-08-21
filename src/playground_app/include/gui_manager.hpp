#pragma once

#include <GLFW/glfw3.h>

#include <memory>

namespace playground_app {
class gui_manager {
 public:
  gui_manager(int width, int height, const char* title);

  void terminate_glfw_if_no_window();
  void window_loop();

 private:
  GLFWwindow* _window;
  const int _width;
  const int _height;
  const char* _title;
};
}  // namespace playground_app
