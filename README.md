[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<p align="center">
  <h1 align="center">Scientific Computing Playground</h1>

  <p align="center">
    Where nerds have fun
  </p>

# Table of Contents

* [About the Project](#about)
* [Project Structure](#structure)
* [Tools and Dependencies](#tools_dependencies)
   * [Tools](#tools)
   * [Dependencies](#dependencies)
* [Build and Install](#install)
* [Contributing](#contributing)
* [License](#license)

## About The Project <a name="about"></a>

The goal of this project is to serve as a template for C++ projects, specially
in the field of scientific computing. It uses CMake as the build system
generator, and tries to include scripts to fetch all dependencies during
configuration time, although some libraries are expected to be in the system or
to be easily installable using a package manager (for example, apt in
Ubuntu/Debian).

Personally, I also use this project to test libraries before I include them in
my actual projects, that's why I named it "playground".

## Project Structure <a name="structure"></a>

The project structure is heavily inspired by the book [Modern CMake for
C++](https://www.packtpub.com/product/modern-cmake-for-c/9781801070058), by
Rafał Świdziński. It has a focus on automation of repetitive tasks (code
formatting/linting and generation of the documentation), instrumentation with
static and dynamic analysis tools and organization of the code to allow better
testability.

The directory structure is:

```bash
├── build
│  ├── debug
│  └── release
├── cmake
│  └── CMake scripts
├── CMakeLists.txt
├── LICENSE.txt
├── Makefile
├── README.md
├── .clang-format
├── src
│  ├── CMakeLists.txt
│  ├── playground
│  │  ├── CMakeLists.txt
│  │  ├── include
│  │  │  └── playground
│  │  │     └── hpp files
│  │  └── cpp files
│  └── playground_app
│     ├── CMakeLists.txt
│     ├── cpp files
│     ├── include
│     │  └── hpp files
│     └── main.cpp
└── tests
   ├── CMakeLists.txt
   ├── playground
   │  ├── CMakeLists.txt
   │  └── cpp files
   └── playground_app
      ├── CMakeLists.txt
      └── cpp files
```

The project is composed of two primary targets: a library (`src/playground`)
and an executable (`src/playground_app`). The `playground_app` executable is
also composed of a static library connected to a bootstrapped main file, since
most testing frameworks provide their own main function (see
`src/playground_app/CMakeLists.txt`).

The `cmake` folder contains CMake scripts, mostly used to include dependencies.
The general strategy is to first try to use `find_package` to check if the
dependency is already installed in the system; if this fails, the scripts use
`FetchContent` to include the dependency in the build system. One exception is
OpenCV: since apparently it [doesn't play well with
`FetchContent`](https://github.com/opencv/opencv/issues/20548), I wrote a
Python script to download and install it.

A `Makefile` is provided in the project's root for convenience, since it helps to run CMake commands, that can become quite long, with a simple `make` command.

## Tools and Dependencies <a name="tools_dependencies"></a>

The main dependency is [CMake](https://cmake.org/). Although only v3.16 is
required, v3.20 or higher is recommended, since it has the option --test-dir
for ctest. This is only a convenience to run the tests from the
root directory. You may need to [build CMake from source](https://gitlab.kitware.com/cmake/cmake) to get a more recent version, depending on the package manager you use.

### Tools <a name="tools"></a>

For testing and program analysis, the following tools are used:

* Testing: [Ctest](https://cmake.org/cmake/help/latest/manual/ctest.1.html) with [Catch2 v3](https://github.com/catchorg/Catch2)
* Static analysis: [Cppcheck](http://cppcheck.net/)
* Dynamic analysis (memory leaks): [Valgrind](https://valgrind.org/)
* Code formatting: [ClangFormat](https://clang.llvm.org/docs/ClangFormat.html)
* Documentation: [Doxygen](https://www.doxygen.nl/)

Catch2 is the only of these tools that is fetched and build automatically if
not found on the system (using `FetchContent`). The others need to be
installed. See `src/playground/CMakeLists.txt` and
`src/playground_app/CMakeLists.txt` to activate/deactivate the tools that need
to be used.

Cppcheck and ClangFormat are automatically run when the code recompiles.
ClangFormat's configuration can be changed by editing the file `.clang-format`.

Since Valgrind can take a considerable amount of time to run, dynamic analysis
is not automatically executed after every new recompilation. To execute it, a
specific target needs to be built running `make valgrind` or `make
valgrind-app` (see `Makefile`) and the resulting artifact needs to be executed.
Note that Valgrind runs on the tests, and an html report is generated and
written to `build/debug/valgrind-playground_tests`.

To generate the documentation, run `make doc-lib` and/or `make doc-app`. The
documentation is saved to `build/debug/doxygen-playground_static` and
`build/debug/doxygen-playground_app`, respectively.

### Dependencies <a name="dependencies"></a>

These are not really dependencies of this repository, but rather libraries that
are frequently used in scientific computing applications and are made available
here to facilitate the beginning of new projects. Of course, the libraries that
you decide to use in your project will become a dependency, but the idea is to
automatically download all necessary files.

At the moment, the libraries available are:

* [Blaze](https://bitbucket.org/blaze-lib/blaze/src/master/): a high-performance math library, mostly used for linear algebra.
    * Requires a BLAS library (for example [OpenBlas](https://www.openblas.net/)) for maximum performance, and [LAPACK](https://netlib.org/lapack/) for certain operations.
* [Eigen3](https://eigen.tuxfamily.org/index.php?title=Main_Page): a popular template library for linear algebra.
* [Matplot++](https://alandefreitas.github.io/matplotplusplus/): a graphics library for data visualization.
    * Requires [Gnuplot](http://www.gnuplot.info/) as a runtime dependency.
* [GLFW](https://www.glfw.org/): a multi-platform library for OpenGL development, that provides a simple API for creating windows, contexts and surfaces.
* [OpenCV](https://opencv.org/): a computer vision library, used here for its image manipulation capabilities.

## Build and Install <a name="install"></a>

To build the debug and release versions, run `make debug` and `make release`,
respectively. To build and run the tests, run `make test`. As previously
described, the `Makefile` is provided only for convenience, and it actually
runs CMake commands. Edit this file as necessary for your particular project.


## Contributing <a name="contributing"></a>

Contributions are very welcomed, especially regarding the inclusion of new
libraries in the build system that can be used for scientific computing. Making
the project compatible with other platforms (for example, Windows and MacOS) is
also of great interest.

If you need a refreshment on how to contribute to a GitHub project, please see [this link](https://akrabat.com/the-beginners-guide-to-contributing-to-a-github-project/).

## License <a name="license"></a>

Distributed under the MIT License. See `LICENSE.txt` for more information.

[license-shield]: https://img.shields.io/github/license/lbteixeira/code-starters?style=for-the-badge
[license-url]: https://github.com/lbteixeira/code-starters/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/lucasbrederteixeira
