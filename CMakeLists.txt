cmake_minimum_required(VERSION 2.8.3)
project(ros_yolo)
set(CMAKE_BUILD_TYPE "debug") #debug release

find_package(catkin_simple REQUIRED)
catkin_simple(ALL_DEPS_REQUIRED)



## target
cs_add_executable(service_client_demo src/service_client_demo.cpp)
target_link_libraries(service_client_demo ${OpenCV_LIBRARIES} )

cs_add_executable(action_client_demo src/action_client_demo.cpp)
target_link_libraries(action_client_demo ${OpenCV_LIBRARIES} )


## make-install-files/catkin-export
cs_install()
cs_export()