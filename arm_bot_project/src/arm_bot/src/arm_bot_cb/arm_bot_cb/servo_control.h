#ifndef servo_control_h
#define servo_control_h

#include "Arduino.h"
#include <Servo.h>
#include <ros.h>
#include <sensor_msgs/JointState.h>
void init_servo(void);
void cb(const sensor_msgs::JointState& msg);
void cb1(const sensor_msgs::JointState& msg);
void cb2(const sensor_msgs::JointState& msg);
void cb3(const sensor_msgs::JointState& msg);
void cb4(const sensor_msgs::JointState& msg);
#endif

