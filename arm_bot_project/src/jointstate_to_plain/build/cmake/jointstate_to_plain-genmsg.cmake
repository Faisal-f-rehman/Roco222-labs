# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "jointstate_to_plain: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ijointstate_to_plain:/home/faisal/roco222/arm_project/arm_bot_project/src/jointstate_to_plain/msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(jointstate_to_plain_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/faisal/roco222/arm_project/arm_bot_project/src/jointstate_to_plain/msg/Dofs.msg" NAME_WE)
add_custom_target(_jointstate_to_plain_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "jointstate_to_plain" "/home/faisal/roco222/arm_project/arm_bot_project/src/jointstate_to_plain/msg/Dofs.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(jointstate_to_plain
  "/home/faisal/roco222/arm_project/arm_bot_project/src/jointstate_to_plain/msg/Dofs.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/jointstate_to_plain
)

### Generating Services

### Generating Module File
_generate_module_cpp(jointstate_to_plain
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/jointstate_to_plain
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(jointstate_to_plain_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(jointstate_to_plain_generate_messages jointstate_to_plain_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/faisal/roco222/arm_project/arm_bot_project/src/jointstate_to_plain/msg/Dofs.msg" NAME_WE)
add_dependencies(jointstate_to_plain_generate_messages_cpp _jointstate_to_plain_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(jointstate_to_plain_gencpp)
add_dependencies(jointstate_to_plain_gencpp jointstate_to_plain_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS jointstate_to_plain_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(jointstate_to_plain
  "/home/faisal/roco222/arm_project/arm_bot_project/src/jointstate_to_plain/msg/Dofs.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/jointstate_to_plain
)

### Generating Services

### Generating Module File
_generate_module_eus(jointstate_to_plain
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/jointstate_to_plain
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(jointstate_to_plain_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(jointstate_to_plain_generate_messages jointstate_to_plain_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/faisal/roco222/arm_project/arm_bot_project/src/jointstate_to_plain/msg/Dofs.msg" NAME_WE)
add_dependencies(jointstate_to_plain_generate_messages_eus _jointstate_to_plain_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(jointstate_to_plain_geneus)
add_dependencies(jointstate_to_plain_geneus jointstate_to_plain_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS jointstate_to_plain_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(jointstate_to_plain
  "/home/faisal/roco222/arm_project/arm_bot_project/src/jointstate_to_plain/msg/Dofs.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/jointstate_to_plain
)

### Generating Services

### Generating Module File
_generate_module_lisp(jointstate_to_plain
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/jointstate_to_plain
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(jointstate_to_plain_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(jointstate_to_plain_generate_messages jointstate_to_plain_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/faisal/roco222/arm_project/arm_bot_project/src/jointstate_to_plain/msg/Dofs.msg" NAME_WE)
add_dependencies(jointstate_to_plain_generate_messages_lisp _jointstate_to_plain_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(jointstate_to_plain_genlisp)
add_dependencies(jointstate_to_plain_genlisp jointstate_to_plain_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS jointstate_to_plain_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(jointstate_to_plain
  "/home/faisal/roco222/arm_project/arm_bot_project/src/jointstate_to_plain/msg/Dofs.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/jointstate_to_plain
)

### Generating Services

### Generating Module File
_generate_module_nodejs(jointstate_to_plain
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/jointstate_to_plain
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(jointstate_to_plain_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(jointstate_to_plain_generate_messages jointstate_to_plain_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/faisal/roco222/arm_project/arm_bot_project/src/jointstate_to_plain/msg/Dofs.msg" NAME_WE)
add_dependencies(jointstate_to_plain_generate_messages_nodejs _jointstate_to_plain_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(jointstate_to_plain_gennodejs)
add_dependencies(jointstate_to_plain_gennodejs jointstate_to_plain_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS jointstate_to_plain_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(jointstate_to_plain
  "/home/faisal/roco222/arm_project/arm_bot_project/src/jointstate_to_plain/msg/Dofs.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jointstate_to_plain
)

### Generating Services

### Generating Module File
_generate_module_py(jointstate_to_plain
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jointstate_to_plain
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(jointstate_to_plain_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(jointstate_to_plain_generate_messages jointstate_to_plain_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/faisal/roco222/arm_project/arm_bot_project/src/jointstate_to_plain/msg/Dofs.msg" NAME_WE)
add_dependencies(jointstate_to_plain_generate_messages_py _jointstate_to_plain_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(jointstate_to_plain_genpy)
add_dependencies(jointstate_to_plain_genpy jointstate_to_plain_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS jointstate_to_plain_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/jointstate_to_plain)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/jointstate_to_plain
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(jointstate_to_plain_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/jointstate_to_plain)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/jointstate_to_plain
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(jointstate_to_plain_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/jointstate_to_plain)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/jointstate_to_plain
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(jointstate_to_plain_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/jointstate_to_plain)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/jointstate_to_plain
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(jointstate_to_plain_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jointstate_to_plain)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jointstate_to_plain\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jointstate_to_plain
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(jointstate_to_plain_generate_messages_py sensor_msgs_generate_messages_py)
endif()
