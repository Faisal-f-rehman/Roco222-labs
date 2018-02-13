#include "Arduino.h"
#include "servo_control.h"
#include <Servo.h>
#include <ros.h>
#include <sensor_msgs/JointState.h>

Servo claw_servo;
Servo clawBase_servo;
Servo wrist_servo;
Servo elbow_servoL;
Servo elbow_servoR;
Servo basePlate_servo;

void init_servo(void){
  claw_servo.attach(11);    
  clawBase_servo.attach(10);
  wrist_servo.attach(9);
  elbow_servoL.attach(6);
  elbow_servoR.attach(5);
  basePlate_servo.attach(3);
}

void cb( const sensor_msgs::JointState& msg){
  int claws = (int) (msg.position[2] * 57.3248407643); //corresponding pos 0,1,2, 180/3.14=57.3248407643
  claw_servo.write(claws); // 0-180 
}

void cb1( const sensor_msgs::JointState& msg){
   int claw_base_hoz = (int) (msg.position[3] * 57.3248407643);//corresponding pos 3
  clawBase_servo.write(claw_base_hoz); // 0-180
}


void cb2( const sensor_msgs::JointState& msg){
   int wrist_ver = (int) (msg.position[5] * 57.3248407643);//corresponding pos 4,5
  wrist_servo.write(wrist_ver); // 0-180
}

void cb3( const sensor_msgs::JointState& msg){
   int elbow_verL = (int) (msg.position[6] * 57.3248407643);//corresponding pos 6
  elbow_servoL.write(elbow_verL); // 0-180
  
  int elbow_verR = (-1)*(elbow_verL-180);
  elbow_servoR.write(elbow_verR); // 180-0
}

void cb4( const sensor_msgs::JointState& msg){
   int base_plate_hoz = (int) (msg.position[7] * 57.3248407643);//corresponding pos 7
  basePlate_servo.write(base_plate_hoz); // 0-180
}




