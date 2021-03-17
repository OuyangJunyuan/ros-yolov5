# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ros_yolo: 2 messages, 1 services")

set(MSG_I_FLAGS "-Iros_yolo:/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg;-Iroscpp:/opt/ros/melodic/share/roscpp/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ros_yolo_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg" NAME_WE)
add_custom_target(_ros_yolo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ros_yolo" "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg" ""
)

get_filename_component(_filename "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/srv/yolo.srv" NAME_WE)
add_custom_target(_ros_yolo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ros_yolo" "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/srv/yolo.srv" "sensor_msgs/Image:ros_yolo/result:ros_yolo/bbox2d:std_msgs/Header"
)

get_filename_component(_filename "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/result.msg" NAME_WE)
add_custom_target(_ros_yolo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ros_yolo" "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/result.msg" "ros_yolo/bbox2d"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ros_yolo
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ros_yolo
)
_generate_msg_cpp(ros_yolo
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/result.msg"
  "${MSG_I_FLAGS}"
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ros_yolo
)

### Generating Services
_generate_srv_cpp(ros_yolo
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/srv/yolo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/result.msg;/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ros_yolo
)

### Generating Module File
_generate_module_cpp(ros_yolo
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ros_yolo
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ros_yolo_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ros_yolo_generate_messages ros_yolo_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg" NAME_WE)
add_dependencies(ros_yolo_generate_messages_cpp _ros_yolo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/srv/yolo.srv" NAME_WE)
add_dependencies(ros_yolo_generate_messages_cpp _ros_yolo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/result.msg" NAME_WE)
add_dependencies(ros_yolo_generate_messages_cpp _ros_yolo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ros_yolo_gencpp)
add_dependencies(ros_yolo_gencpp ros_yolo_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros_yolo_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ros_yolo
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ros_yolo
)
_generate_msg_eus(ros_yolo
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/result.msg"
  "${MSG_I_FLAGS}"
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ros_yolo
)

### Generating Services
_generate_srv_eus(ros_yolo
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/srv/yolo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/result.msg;/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ros_yolo
)

### Generating Module File
_generate_module_eus(ros_yolo
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ros_yolo
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ros_yolo_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ros_yolo_generate_messages ros_yolo_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg" NAME_WE)
add_dependencies(ros_yolo_generate_messages_eus _ros_yolo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/srv/yolo.srv" NAME_WE)
add_dependencies(ros_yolo_generate_messages_eus _ros_yolo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/result.msg" NAME_WE)
add_dependencies(ros_yolo_generate_messages_eus _ros_yolo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ros_yolo_geneus)
add_dependencies(ros_yolo_geneus ros_yolo_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros_yolo_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ros_yolo
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ros_yolo
)
_generate_msg_lisp(ros_yolo
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/result.msg"
  "${MSG_I_FLAGS}"
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ros_yolo
)

### Generating Services
_generate_srv_lisp(ros_yolo
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/srv/yolo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/result.msg;/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ros_yolo
)

### Generating Module File
_generate_module_lisp(ros_yolo
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ros_yolo
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ros_yolo_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ros_yolo_generate_messages ros_yolo_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg" NAME_WE)
add_dependencies(ros_yolo_generate_messages_lisp _ros_yolo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/srv/yolo.srv" NAME_WE)
add_dependencies(ros_yolo_generate_messages_lisp _ros_yolo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/result.msg" NAME_WE)
add_dependencies(ros_yolo_generate_messages_lisp _ros_yolo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ros_yolo_genlisp)
add_dependencies(ros_yolo_genlisp ros_yolo_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros_yolo_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ros_yolo
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ros_yolo
)
_generate_msg_nodejs(ros_yolo
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/result.msg"
  "${MSG_I_FLAGS}"
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ros_yolo
)

### Generating Services
_generate_srv_nodejs(ros_yolo
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/srv/yolo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/result.msg;/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ros_yolo
)

### Generating Module File
_generate_module_nodejs(ros_yolo
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ros_yolo
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ros_yolo_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ros_yolo_generate_messages ros_yolo_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg" NAME_WE)
add_dependencies(ros_yolo_generate_messages_nodejs _ros_yolo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/srv/yolo.srv" NAME_WE)
add_dependencies(ros_yolo_generate_messages_nodejs _ros_yolo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/result.msg" NAME_WE)
add_dependencies(ros_yolo_generate_messages_nodejs _ros_yolo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ros_yolo_gennodejs)
add_dependencies(ros_yolo_gennodejs ros_yolo_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros_yolo_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ros_yolo
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros_yolo
)
_generate_msg_py(ros_yolo
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/result.msg"
  "${MSG_I_FLAGS}"
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros_yolo
)

### Generating Services
_generate_srv_py(ros_yolo
  "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/srv/yolo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/result.msg;/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros_yolo
)

### Generating Module File
_generate_module_py(ros_yolo
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros_yolo
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ros_yolo_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ros_yolo_generate_messages ros_yolo_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/bbox2d.msg" NAME_WE)
add_dependencies(ros_yolo_generate_messages_py _ros_yolo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/srv/yolo.srv" NAME_WE)
add_dependencies(ros_yolo_generate_messages_py _ros_yolo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/msg/result.msg" NAME_WE)
add_dependencies(ros_yolo_generate_messages_py _ros_yolo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ros_yolo_genpy)
add_dependencies(ros_yolo_genpy ros_yolo_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros_yolo_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ros_yolo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ros_yolo
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_cpp)
  add_dependencies(ros_yolo_generate_messages_cpp roscpp_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ros_yolo_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(ros_yolo_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ros_yolo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ros_yolo
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_eus)
  add_dependencies(ros_yolo_generate_messages_eus roscpp_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ros_yolo_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(ros_yolo_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ros_yolo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ros_yolo
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_lisp)
  add_dependencies(ros_yolo_generate_messages_lisp roscpp_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ros_yolo_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(ros_yolo_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ros_yolo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ros_yolo
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_nodejs)
  add_dependencies(ros_yolo_generate_messages_nodejs roscpp_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ros_yolo_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(ros_yolo_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros_yolo)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros_yolo\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros_yolo
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_py)
  add_dependencies(ros_yolo_generate_messages_py roscpp_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ros_yolo_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(ros_yolo_generate_messages_py sensor_msgs_generate_messages_py)
endif()
