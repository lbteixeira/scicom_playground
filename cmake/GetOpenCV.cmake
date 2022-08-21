find_package(OpenCV QUIET)

if(OpenCV_FOUND)
   message("-- Found OpenCV")
   # Included as SYSTEM to avoid application of custom compile commands.
   include_directories(SYSTEM ${OpenCV_INCLUDE_DIRS})
else()
   message("")
   message("OpenCV was not found in the system, running installation script instead.")
   message("")

   execute_process(COMMAND python opencv_install.py WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})
endif()
