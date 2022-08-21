MAKEFLAGS += --silent

.PHONY: debug
debug:
		cmake -D CMAKE_EXPORT_COMPILE_COMMANDS=1 -D CMAKE_BUILD_TYPE="Debug" -S . -B build/debug/
		cp build/debug/compile_commands.json .
		cmake --build ./build/debug

.PHONY: release
release:
		cmake -D CMAKE_EXPORT_COMPILE_COMMANDS=1 -D CMAKE_BUILD_TYPE="Release" -S . -B build/release/
		cp build/release/compile_commands.json .
		cmake --build ./build/release

.PHONY: test
test:
		cmake -D CMAKE_EXPORT_COMPILE_COMMANDS=1 -D PLAYGROUND_BUILD_TESTS="ON" -D CMAKE_BUILD_TYPE="Debug" -S . -B build/debug
		cmake --build ./build/debug
		ctest --test-dir ./build/debug/tests/playground/ --output-on-failure

.PHONY: valgrind
valgrind: test
		cmake --build ./build/debug -t memcheck-playground_tests

.PHONY: valgrind-app
valgrind-app: debug
		cmake --build ./build/debug -t memcheck-playground_app

.PHONY: doc-lib
doc-lib: debug
		cmake --build ./build/debug -t doxygen-playground_static

.PHONY: doc-app
doc-app: debug
		cmake --build ./build/debug -t doxygen-playground_app

.PHONY: clean
clean:
		rm -rf build/debug/*
		rm -rf build/release/*
