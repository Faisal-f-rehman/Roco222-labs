
#include "Arduino.h"
#include <Servo.h>
#include <ros.h>
#include <jointstate_to_plain/Dofs.h>


using namespace ros;

NodeHandle nh;


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

void cb( const jointstate_to_plain::Dofs& msg){
//  nh.loginfo("Got msg");
 
  //int claws = (int) (msg.position[1] * 57.3248407643); //corresponding pos 0,1,2, 180/3.14=57.3248407643
  claw_servo.write(msg.claws); // 0-180
  
  
  //int claw_base_hoz = (int) (msg.position[3] * 57.3248407643);//corresponding pos 3
  clawBase_servo.write(msg.wrist_h); // 0-180
  
  
  //int wrist_ver = (int) (msg.position[5] * 57.3248407643);//corresponding pos 4,5
  wrist_servo.write(msg.wrist_v); // 0-180
  
  
  //int elbow_verL = (int) (msg.position[6] * 57.3248407643);//corresponding pos 6
  int elbow_verR = (-1)*(msg.elbow_v-180);
  elbow_servoR.write(elbow_verR); // 180-0

  elbow_servoL.write(msg.elbow_v); // 0-180
  //elbow_servoR.write(msg.elbow_v); // 180-0

  
  //int base_plate_hoz = (int) (msg.position[7] * 57.3248407643);//corresponding pos 7
 basePlate_servo.write(msg.base); // 0-180
 // nh.loginfo(base_plate_hoz);
 
}

Subscriber<jointstate_to_plain::Dofs>sub("arm_dofs", cb);

void setup(){
  
  nh.initNode();
  nh.subscribe(sub);
  init_servo();
  
}

void loop(){
  nh.spinOnce();
  delay(100);
  //nh.loginfo("Ready to go");
}
