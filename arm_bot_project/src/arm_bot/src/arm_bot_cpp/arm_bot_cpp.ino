#include <Servo.h>
#include <ros.h>
#include <sensor_msgs/JointState.h>

using namespace ros;

NodeHandle nh;
//
Servo claw_servo;
Servo clawBase_servo;
Servo wrist_servo;
Servo elbow_servoL;
Servo elbow_servoR;
Servo basePlate_servo;


void cb( const sensor_msgs::JointState& msg){
  
  int claws = (int) (msg.position[0] * 57.3248407643); //corresponding pos 0,1,2, 180/3.14=57.3248407643
  claw_servo.write(claws); // 0-180

  int claw_base_hoz = (int) (msg.position[3] * 57.3248407643);//corresponding pos 3
  clawBase_servo.write(claw_base_hoz); // 0-180
  
  int wrist_ver = (int) (msg.position[0] * 57.3248407643);//corresponding pos 4,5
  wrist_servo.write(wrist_ver); // 0-180

  int elbow_verL = (int) (msg.position[1] * 57.3248407643);//corresponding pos 6
  elbow_servoL.write(elbow_verL); // 0-180

  int elbow_verR = (int) ((msg.position[2]-3.14) * (-57.3248407643));//corresponding pos 6
  elbow_servoR.write(elbow_verR); // 180-0
  //Serial.print(elbow_verR);
  
  int base_plate_hoz = (int) (msg.position[3] * 57.3248407643);//corresponding pos 7
  basePlate_servo.write(base_plate_hoz); // 0-180
}

Subscriber<sensor_msgs::JointState>sub("joint_states", cb);

void setup(){
  //nh.getHardware()->setBaud(57600);
  nh.initNode();
  nh.subscribe(sub);
  //Serial.begin(9600);
  
//--------attach servos to appropriate pins
  claw_servo.attach(11);    
  clawBase_servo.attach(10);
  wrist_servo.attach(9);
  elbow_servoL.attach(6);
  elbow_servoR.attach(5);
  basePlate_servo.attach(3);
}

void loop(){
  nh.spinOnce();
  delay(1);
}
