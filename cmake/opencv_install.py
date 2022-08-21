#!/usr/bin/env python

import os

if(not os.path.exists("opencv")):
    print("Downloading OpenCV sources\n")
    os.system("wget -O opencv.zip https://github.com/opencv/opencv/archive/4.6.0.zip")
    os.system("unzip opencv.zip && mv opencv-4.6.0 opencv")
    os.system("rm opencv.zip")

if(not os.path.exists("opencv/build")):
    os.system("mkdir opencv/build")

# Builds only the modules necessary for the project, using the variable BUILD_LIST
build_options = "-D CMAKE_CXX_STANDARD=17 \
                 -D BUILD_TESTS=OFF \
                 -D BUILD_PERF_TESTS=OFF \
                 -D BUILD_EXAMPLES=OFF \
                 -D BUILD_opencv_apps=OFF \
                 -D BUILD_LIST=core,imgproc,imgcodecs,highgui"

os.system("cd opencv && cmake {} -S . -B build".format(build_options))
os.system("cd opencv && cmake --build build && sudo cmake --install build")

