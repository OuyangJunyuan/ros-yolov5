cmake_minimum_required(VERSION 2.8.3)
project(ros_yolo)
set(CMAKE_BUILD_TYPE "release") #debug release

find_package(catkin_simple REQUIRED)
catkin_simple(ALL_DEPS_REQUIRED)

## files
aux_source_directory(./src SRC_LIST)

## target
cs_add_executable(${PROJECT_NAME} ${SRC_LIST})
target_link_libraries(${PROJECT_NAME} ${OpenCV_LIBRARIES} )



## make-install-files/catkin-export
cs_install()
cs_export()