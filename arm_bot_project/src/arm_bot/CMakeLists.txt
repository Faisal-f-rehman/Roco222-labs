cmake_minimum_required(VERSION 2.8.3)
project(arm_bot)

find_package(catkin REQUIRED COMPONENTS
  joint_state_publisher
  robot_state_publisher
  roslaunch
  rviz
  xacro
  roscpp
  rospy
  std_msgs
  urdf
)
catkin_package()

if(CATKIN_ENABLE_TESTING)
  find_package(roslaunch REQUIRED)
  roslaunch_add_file_check(launch)
endif()

install(DIRECTORY meshes launch urdf src/arm_bot_cpp
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})

#include_directories(include ${catkin_INCLUDE_DIRS})
#add_executable(state_publisher src/arm_bot_cpp/arm_bot_cpp.ino)
#target_link_libraries(state_publisher ${catkin_LIBRARIES})
#include_directories(${catkin_INCLUDE_DIRS})

#for launch file: <node name="state_publisher" pkg="arm_bot" type="arm_bot_cpp" />
#
#
#



