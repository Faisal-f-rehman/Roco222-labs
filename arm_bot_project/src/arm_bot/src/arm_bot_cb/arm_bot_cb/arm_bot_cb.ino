#include <Servo.h>
#include <ros.h>
#include <sensor_msgs/JointState.h>
#include "servo_control.h"
using namespace ros;

NodeHandle nh;

Subscriber<sensor_msgs::JointState>sub("joint_states", cb);
Subscriber<sensor_msgs::JointState>sub1("joint_states", cb1);
Subscriber<sensor_msgs::JointState>sub2("joint_states", cb2);
Subscriber<sensor_msgs::JointState>sub3("joint_states", cb3);
Subscriber<sensor_msgs::JointState>sub4("joint_states", cb4);
void setup(){
  
  nh.initNode();
  nh.subscribe(sub);
  nh.subscribe(sub1);
  nh.subscribe(sub2);
  nh.subscribe(sub3);
  nh.subscribe(sub4);

  
  init_servo();
}

void loop(){
  nh.spinOnce();
  delay(1);
}
