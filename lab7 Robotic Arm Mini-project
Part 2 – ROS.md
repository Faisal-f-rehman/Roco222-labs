# **ROCO222 LAB-JOURNAL**

## **FAISAL FAZAL-UR-REHMAN

[Lab Partner: Spencer Perdomo-Davies](https://github.com/slperdomo-davies/Roco222--Lab-Journal/blob/master/ROS.md)

## **Index**
[Lab1 Software engineering for roboticists](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab1%20software%20engineering%20for%20roboticists.md)

[Lab2 Build a DC motor](https://github.com/Faisal-f-rehman/journal.md/blob/master/lab2%20dc%20motor.md)

[Lab3 Incremental Encoder](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab3%20Incremental%20Encoder.md)

[Lab4 Controlling the motor](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab4%20Controlling%20the%20motor.md)

[Lab5 Stepper motors](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab5%20Stepper%20Motors.md)

[Lab6 Robotic Arm Mini-project Part 1 – Servo motors](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab6%20Robotic%20Arm%20Mini-project%0APart%201%20%E2%80%93%20Servo%20motors.md)

# **Lab7 Robotic Arm Mini-project Part 2 – ROS**

This lab covers sections 2 to 6 from the following list:

1) Servo motor control with Arduino [Lab6 Robotic Arm Mini-project Part 1 – Servo motors](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab6%20Robotic%20Arm%20Mini-project%0APart%201%20%E2%80%93%20Servo%20motors.md)
2) 3D design and 3D printing 
3) Assembling the arm
4) Servo motor control with Arduino through terminal
5) Rviz 3D simulation, written in URDF (XML format)
6) 3D motion planning and finalisation

----------------------------------------------
SECTION 2 - 3D DESIGN & PRINTING
----------------------------------------------

Initial design was to include a motor for every joint. It included stepper and servo motors.

### INITIAL SKETCHES
![INITIAL SKETCHES](https://github.com/slperdomo-davies/Roco222--Lab-Journal/blob/master/media/Roco222%20Arm%20Concept%201.jpg?raw=true)

However during our sketches Jake pointed out that there is a way to have most servo motors at the bottom of the arm, this helps with the torque of the servo motor, so we decided to include a shaft in our design that would attach to a servo near the base and to a joint further up. We decided to be ambitious and include 5 degrees of freedom with 6 servo motors.

### DESIGN AND PRINTING SOLIDWORKS

![DRAWINGS](https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/drawings.PNG?raw=true)
<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/assm_pic1.PNG?raw=true" height="50%" width="50%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/assm_pic2.PNG?raw=true" height="50%" width="50%"/>

<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/assm_pic3.PNG?raw=true" height="50%" width="50%"/>

<br>

----------------------------------------------
SECTION 3 - ASSEMBLING THE ARM
----------------------------------------------

Assembly was a massive task, Spencer had to reprint a few parts since the printer percision is +-1.5mm, which makes a lot difference than one would expect, since the servos and other printed parts had to fit in tightly. After a few attempts and sleepless nights for Spencer, we managed to assemble the arm. However after the assembly, we realised how top heavy the arm was for the small hobby servos. To compensate for the weight we had to include a few rubber bands, although they were a bit of an eye sore, they did the job.

<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/physical_assembly_1.jpeg?raw=true" height="50%" width="50%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/physical_assembly_2.jpeg?raw=true" height="50%" width="50%"/>
<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/physical_assembly_3.jpeg?raw=true" height="50%" width="50%"/>
 
<br>

----------------------------------------------
SECTION - 4 SERVO MOTOR CONTROL THROUGH TERMINAL (ROS)
----------------------------------------------

In this section we control a servo motor through ROS in linux terminal, connected to arduino uno. Connections are very simple and same as the ones in lab6.  

### CONNECTIONS

![Step1 connections](https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/direct_servo_to_arduino.png?raw=true)   

### ARDUINO CODE & ROS

**ARDUINO**
```C
#include <ros.h>
#include <std_msgs/UInt16.h>
#include <Servo.h>

using namespace ros;

NodeHandle nh;
Servo servo;

void cb( const std_msgs::UInt16& msg){
  servo.write(msg.data); // 0-180
}

Subscriber<std_msgs::UInt16> sub("servo", cb);

void setup(){
  nh.initNode();
  nh.subscribe(sub);

  servo.attach(9); //attach it to pin 9
}

void loop(){
  nh.spinOnce();
  delay(1);
}
```

**ROS**

```python
roscore
rosrun rosserial_python serial_node.py /dev/ttyACM0
rostopic pub --once servo std_msgs/UInt16 110
```
**CODE EXPLAIATION**

The last line of ROS 
```python 
rostopic pub --once servo std_msgs/UInt16 <0 to 180>
```
once written on the terminal publishes a topic called servo of type std_msgs, where Uint16 is the name and the maximum size of the message, in this instance it is an unsigned integer of size 16bits (0 to 65536). 

<br>

Then in arduino's line of code 
```C 
Subscriber<std_msgs::UInt16> sub("servo", cb);
```
we subscribe (read from), the topic servo of type std_msgs, size 16bit variable of type unsigned integer and calls the function called cb(argument);

<br>

The cb(argument) function is called the callback function
```c
void cb( const std_msgs::UInt16& msg){
  servo.write(msg.data); // 0-180
}
```
The argument of this function is then assigned the value subscribed from the std_msgs which is then sent to the servos by the following command:

```C
servo.write(msg.data); // 0-180
```

### Video

[![](https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/servo_terminalYT.png?raw=true)](https://www.youtube.com/watch?v=QK5xhgdjI3A)

<br><br>

----------------------------------------------
SECTION 5 RVIZ 3D SIMULATION, WRITTEN IN URDF (XML FORMAT)
----------------------------------------------

In this section we control one servo through simulation of one joint in Rviz written in URDF and C/C++ Arduino

### URDF

```XML
<?xml version="1.0"?>
<robot name="roco_arm">
  <link name="base_link">
    <visual>
      <geometry>
        <cylinder length="0.06" radius="0.1"/>
      </geometry>
    </visual>
  </link>

  <link name="first_segment">
    <visual>
      <geometry>
        <box size="0.6 0.05 0.1"/>
      </geometry>
      <origin rpy="0 0 0" xyz="-0.3 0 0" />
    </visual>
  </link>

  <joint name="base_to_first" type="revolute">
    <axis xyz="0 1 0" />
    <limit effort="1000" lower="0" upper="3.14" velocity="0.5" />
    <parent link="base_link"/>
    <child link="first_segment"/>
    <origin xyz="0 0 0.03" />
  </joint>
</robot>
```
URDF code is pretty much self explainitary, the <links> are the objects we create and the <joint> join them together. In this file we have created two objects from scratch, ie no meshes have been used. "_Base___link_" is the main fixed object which is the center of all links and is necessary, otherwise the robot/simulation has no awareness of the position in space. The link with name "*first*_*segment*" is the second object of <geometry> type box. The origin part in links define the position they are placed in, in 3D space.

These two links are joined by a joint named "*base**_to_**first*" and the joint is a revolving joint with limits of revolution defined in the <limit> section and is in radians. The <origin> of a <joint> positions' the movement axis of the <joint> between the two links. These joints are published, so that they can be subscribed by nodes and used as needed.

### Arduino Code

```c
#include <Servo.h>
#include <ros.h>
#include <sensor_msgs/JointState.h>

using namespace ros;

NodeHandle nh;
Servo servo;

void cb( const sensor_msgs::JointState& msg){
  int angle = (int) (msg.position[0] * 180/3.14);
  servo.write(angle); // 0-180
}

Subscriber<sensor_msgs::JointState>sub("joint_states", cb);

void setup(){
  nh.initNode();
  nh.subscribe(sub);
  
  servo.attach(9); //attach it to pin 9
}

void loop(){
  nh.spinOnce();
  delay(1);
}
```
The Arduino code used is exactly the same as the one in SECTION 4, the difference lies in the callback function's argument (cb(argument)) and that we are subscribing to a differnt type of topic called sensor\_msgs/JointStates instead of std\_msgs/UInt16, where the topic name is /joint\_states instead of servo.

```C
Subscriber<sensor_msgs::JointState>sub("joint_states", cb);
```
The structure of sensor_msgs/JointState.msg is as follows:  

Header header

string[] name
float64[] position
float64[] velocity
float64[] effort

source:[ros.org](http://docs.ros.org/api/sensor_msgs/html/msg/JointState.html)  


The GUI interface is the joint\_state\_publisher that publishes msgs that are then subscribed by the /joint\_state topic, which is then subscribed by Arduino UNO for servo control

For Rviz simulation there is another node called the robot\_state\_publisher that subscribes from the topic /joint_states and broadcasts the corresponding transformation frames(tf frames).


tf is a package that lets the user keep track of multiple coordinate frames over time. tf maintains the relationship between coordinate frames in a tree structure buffered in time, and lets the user transform points, vectors, etc between any two coordinate frames at any desired point in time.
source:[http://wiki.ros.org/tf](http://wiki.ros.org/tf)


<br>

The callback function's argument is given the msgs read from the subscriber like in SECTION 4 but we only need the information of position from the /joint_states and therefore we only attach the msgs.position[array element number] to the servo and since the data is in radians we convert it into degrees.

```C
void cb( const sensor_msgs::JointState& msg){
  int angle = (int) (msg.position[0] * 180/3.14);
  servo.write(angle); // 0-180
}
```

### Video 

[![](https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/servo_single_rviz_YT.png?raw=true)](https://www.youtube.com/watch?v=6OjYXSEfVJ4)

<br><br>

----------------------------------------------		
SECTION 6 3D MOTION PLANNING AND FINALISATION
----------------------------------------------
   
In this section we are going to take everything that we have learnt and apply it to our own robotic arm.

Since we were a little too ambitious and used 6 servos, not only did that make our design more complex for the simulation but also Arduino Uno started to struggle with the size of the data it had to subscribe to, which started to cause memory issues. I also learnt that Arduino Uno is not capable or sourcing enough current for 6 servos, although the fix for this is straight forward, by using an external power supply.

*simulation problem fix**
For the simulation in the URDF file, the way to get around detailed designs is to include meshes. Since we had already designed the arm in solidworks it was very straight forward to export .stl files for each part of the arm. However if the meshes are included in URDF as a direct local file from the computer, it only works on the computer that holds the meshes in the same directory path. The work around this issue is to make a package. This can be done by catkin_make, Cmake or ros packages, this way regardless of the computer, if the full package is downloaded on a computer, the package once installed on that computer can locate the meshes. 

In a lab session Dr.Lemaignan ran me through the full process on how to make packages using Cmake. The general process of making a Cmake package is as follows and have been taken from the lecture notes:

```python
> mkdir build && cd build
> cmake ..
> make
```
This will create lots of directories and files:

build/  
... # lots of compilation  
src/  
main.cpp  
ui.cpp  
ui.hpp  
pathfinding.cpp  
include/  
pathfinding.hpp  
etc/  
ui.conf  
README.md  
LICENSE  
CMakeLists.txt  


*Fixing the memory issue*
After struggling with this issue for days we once again asked Dr.Lemaignan for help. After some debugging and testing he found the root of the problem. The issue was that the data being published by the /joint_states for 6 servos was too large when taken into consideration that the data for each servo includes all of the following:  

Header header  

string[] name  
float64[] position  
float64[] velocity  
float64[] effort  

Where as we are only interested in poistion. To trim this data down we made a new node and called it jointstate\_to\_plain, which subscribes to /joint\_states and only publishes position leaving the rest out. To make a node we followed the Cmake process then we made a new msg type and called it Dofs.msgs

uint16 base  
uint16 elbow_v  
uint16 wrist_v  
uint16 wrist_h  
uint16 claws  

After this we made a file in python which imports data from JointStates, takes only positions, assigns them to jointstate\_to\_plain, initiates the node and publishes to a new topic called arm_dofs . The python file (run.py) is as follows:

```python
#!/usr/bin/env python
import rospy
from sensor_msgs.msg import JointState
from jointstate_to_plain.msg import Dofs

pub=None

def cb(msg):
    rospy.loginfo("Position: %s", str(msg.position))

    dofs = Dofs() 
    dofs.claws = (int) (msg.position[2] * 180/0.22)
    dofs.wrist_h = (int) (-1)*((msg.position[3] * 180/2)-180)
    dofs.wrist_v = (int) ((msg.position[5]-1.36) * 8.72 * 180/3.14)
    dofs.elbow_v = (int) (msg.position[6] * 180/0.40)
    dofs.base = (int) (msg.position[7] * 180/3.14)
    pub.publish(dofs)
    


 

if __name__ == '__main__':
 
    rospy.init_node('jointstate_to_plain')

    pub=rospy.Publisher("arm_dofs", Dofs, queue_size=1)
    rospy.Subscriber("joint_states", JointState, cb)

    

    rospy.spin()
```

Since we had access to the data in run.py I decided to convert radians to degrees in here aswell, this would reduce some of the processing load for calculations, especially divisions for arduino.


### Arduino code & URDF

**Arduino**

```c

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

//write data to servos, from the variable Dofs subscribed from topic arm_dofs 
  claw_servo.write(msg.claws); // 0-180
 
  clawBase_servo.write(msg.wrist_h); // 0-180

  wrist_servo.write(msg.wrist_v); // 0-180
  
  int elbow_verR = (-1)*(msg.elbow_v-180); 	//reverse the direction of the servo
  elbow_servoR.write(elbow_verR); // 180-0

  elbow_servoL.write(msg.elbow_v); // 0-180

  basePlate_servo.write(msg.base); // 0-180

 
}

Subscriber<jointstate_to_plain::Dofs>sub("arm_dofs", cb); //subscribe to arm_dofs of type jointstate_to_plain and variable Dofs

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
```

### arm_bot URDF

```XML
<?xml version="1.0"?>

				<!--...........LINKS Layout: Bottom Up............-->
<robot name="arm_bot">

<!--base link-->
	<link name="base_link">
		<visual>
			<geometry>
				<cylinder length="0.03" radius="0.1"/>
			</geometry>
		</visual>
	</link>

<!--main base-->
	<link name="main_base">
		<visual>
			<origin rpy="-1.5708 0 0" xyz="0 0 0.015"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/main_base.STL"/>
				<!--mesh filename="file:///home/faisal/roco222/arm_project/models/meshes/main_base.STL"/-->
			</geometry>			
		</visual>
	</link>

<!--1st servo base plate-->
	<link name="base_plate_servo">
		<visual>
			<origin rpy="1.5708 0 3.14" xyz="0 0 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/servo/servo.STL"/>
			</geometry>			
		</visual>
	</link>

<!--base plate-->
	<link name="base_plate">
		<visual>
			<origin rpy="-1.5708 0 0" xyz="0 0 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/base_plate.STL"/>
			</geometry>			
		</visual>
	</link>

<!--elbow base-->
	<link name="elbow_base">
		<visual>
			<origin rpy="1.5708 0 0" xyz="0 0 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/elbow_base.STL"/>
			</geometry>			
		</visual>
	</link>

<!--2nd servo elbow vertical left-->
	<link name="servo_elbow_vertical_left">
		<visual>
			<origin rpy="0 -1.5708 -1.5708" xyz="0.04 0 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/servo/servo.STL"/>
			</geometry>			
		</visual>
	</link>

<!--3rd servo elbow vertical right-->
	<link name="servo_elbow_vertical_right">
		<visual>
			<origin rpy="0 -1.5708 1.5708" xyz="-0.04 0 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/servo/servo.STL"/>
			</geometry>			
		</visual>
	</link>

<!--elbow vertical-->
	<link name="elbow_vertical">
		<visual>
			<origin rpy="1.5708 0 3.14" xyz="0 0 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/elbow_ver_link.STL"/>
			</geometry>			
		</visual>
	</link>

<!--top bit of elbow vertical-->
	<link name="elbow_vertical_top">
		<visual>
			<origin rpy="1.5708 0 0" xyz="0 0 0.073"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/elbow_ver_top.STL"/>
			</geometry>			
		</visual>
	</link>

<!--double bearings for elbow to wrist-->
	<link name="double_bearing_1">
		<visual>
			<origin rpy="1.5708 1.5708 0" xyz="0.053 0 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/bearing.STL"/>
			</geometry>			
		</visual>

		<visual>
			<origin rpy="1.5708 1.5708 0" xyz="-0.063 0 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/bearing.STL"/>
			</geometry>			
		</visual>
	</link>

<!--longer shaft-->
	<link name="longer_shaft">
		<visual>
			<origin rpy="0 0 1.5708" xyz="0.068 0 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/elbow_to_wrist_shaft.STL"/>
			</geometry>			
		</visual>
	</link>

<!--vertical wrist-->
	<link name="wrist_vertical">
		<visual>
			<origin rpy="1.5708 0 0" xyz="0 0 -0.01"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/wrist_ver.STL"/>
			</geometry>			
		</visual>
	</link>

<!--control arm shaft-->
	<link name="control_arm_shaft">
		<visual>
			<origin rpy="0 0 1.5708" xyz="0.045 0 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/control_arm_shaft.STL"/>
			</geometry>			
		</visual>
	</link>

<!--4th servo, for control arm -->
	<link name="servo_control_arm">
		<visual>
			<origin rpy="0 -1.5708 1.5708" xyz="0.015 0 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/servo/servo.STL"/>
			</geometry>			
		</visual>
	</link>

<!--control arm fitter -->
	<link name="fitter_control_arm">
		<visual>
			<origin rpy="0 -3 -1.5708" xyz="0 0 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/control_arm_fitter.STL"/>
			</geometry>
		</visual>
	</link>

						<!--control arm
							<link name="control_arm">
								<visual>
									<origin rpy="1.5708 -1.5708 0" xyz="0 0.04 0.05"/>
									<geometry>
										<mesh filename="package://arm_bot/meshes/control_arm.STL"/>
									</geometry>			
								</visual>
							</link>-->

<!--5th servo, for claw base horizontal movement -->
	<link name="servo_claw_base">
		<visual>
			<origin rpy="1.5708 0 0" xyz="-0.005 0 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/servo/servo.STL"/>
			</geometry>			
		</visual>
	</link>

<!--claw base-->
	<link name="claw_base">
		<visual>
			<origin rpy="0 3.14 0" xyz="0 -0.015 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/claw_base.STL"/>
			</geometry>			
		</visual>
	</link>

<!--1st pair of double bearings for claw-->
	<link name="double_bearing_L">
		<visual>
			<origin rpy="0 0 0" xyz="0 0.01 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/bearing.STL"/>
			</geometry>			
		</visual>

		<visual>
			<origin rpy="0 0 0" xyz="0 -0.02 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/bearing.STL"/>
			</geometry>			
		</visual>
	</link>

<!--2nd pair of double bearings for claw-->
	<link name="double_bearing_R">
		<visual>
			<origin rpy="0 0 0" xyz="0 0.01 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/bearing.STL"/>
			</geometry>			
		</visual>

		<visual>
			<origin rpy="0 0 0" xyz="0 -0.02 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/bearing.STL"/>
			</geometry>			
		</visual>
	</link>

<!--Left claw-->
	<link name="claw_L">
		<visual>
			<origin rpy="0 2.94 0" xyz="-0.015 -0.008 0.038"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/claw_finger.STL"/>
			</geometry>			
		</visual>
	</link>

<!--Right claw-->
	<link name="claw_R">
		<visual>
			<origin rpy="3.14 0.2 0" xyz="0.015 0.008 0.038"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/claw_finger.STL"/>
			</geometry>			
		</visual>
	</link>

<!--6th servo, for claws-->
	<link name="servo_claw">
		<visual>
			<origin rpy="0 0 0" xyz="-0.005 0 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/servo/servo.STL"/>
			</geometry>			
		</visual>
	</link>

<!--6th servo,bit for claws-->
	<link name="servo_bit">
		<visual>
			<origin rpy="0 0 0" xyz="0 0.015 0"/>
			<geometry>
				<mesh filename="package://arm_bot/meshes/servo/servo_bit_only.STL"/>
			</geometry>			
		</visual>
	</link>







		<!--.............................JOINTS Layout: Top down.................................-->








<!--6th servo bit to servo-->	
	
	<joint name="claws" type="revolute">
		<axis xyz="0 1 0" />
		<limit effort="1000" lower="0.02" upper="0.22" velocity="0.5" />
		<parent link="servo_claw"/>
		<child link="servo_bit"/>
		<origin xyz="-0.005 0 0" />
	</joint>

<!--6th servo to claw base for claws-->	
	
	<joint name="servo_claws_open_close" type="fixed">
		<parent link="claw_base"/>
		<child link="servo_claw"/>
		<origin xyz="0 0.017 0.003" />
	</joint>

<!--left claw to bearing-->	
	
	<joint name="claw_L_to_claw_base" type="revolute">
		<axis xyz="0 1 0" />
		<limit effort="1000" lower="0.02" upper="0.22" velocity="0.5" />
		<parent link="double_bearing_L"/>
		<child link="claw_L"/>
		<origin xyz="0 0 0" />
		<mimic joint="claws" multiplier="1" offset="0"/>
	</joint>

<!--right claw to bearing-->	
	
	<joint name="claw_R_to_claw_base" type="revolute">
		<axis xyz="0 -1 0" />
		<limit effort="1000" lower="0.02" upper="0.22" velocity="0.5" />
		<parent link="double_bearing_R"/>
		<child link="claw_R"/>
		<origin xyz="0 0 0" />
		<mimic joint="claws" multiplier="1" offset="0"/>
	</joint>

<!--1st pair of double bearings to claw base-->	
	
	<joint name="bearing_claw_L" type="fixed">
		<parent link="claw_base"/>
		<child link="double_bearing_L"/>
		<origin xyz="0.0425 0 0.005" />
	</joint>

<!--2nd pair of double bearings to claw base-->	
	
	<joint name="bearing_claw_R" type="fixed">
		<parent link="claw_base"/>
		<child link="double_bearing_R"/>
		<origin xyz="-0.0425 0 0.005" />
	</joint>

<!--servo to claw base horiizontal-->	
	
	<joint name="claw_base_hoz" type="revolute">
		<axis xyz="0 0 -1" />
		<limit effort="1000" lower="0" upper="2" velocity="0.5" />
		<parent link="servo_claw_base"/>
		<child link="claw_base"/>
		<origin xyz="-0.005 0 0.025" />
	</joint>

<!--servo vertical wrist to claw base horiizontal-->	
	
	<joint name="servo_ver_wrist_to_claw_base" type="fixed">
		<parent link="wrist_vertical"/>
		<child link="servo_claw_base"/>
		<origin xyz="0 0 0.060" />
	</joint>

					<!--control arm to ver wrist
	
						<joint name="control_arm_to_ver_wrist" type="continuous">
							<axis xyz="1 0 0" />		
							<parent link="control_arm_shaft"/>
							<child link="control_arm"/>
							<origin xyz="0 0 0" />
							<mimic joint="wrist_ver" multiplier="1" offset="0"/>
						</joint>-->

					<!--control arm to fitter	
	
						<joint name="control_arm_to_fitter" type="continuous">
							<axis xyz="1 0 0" />		
							<parent link="fitter_control_arm"/>
							<child link="control_arm"/>
							<origin xyz="0 0 0" />
							<mimic joint="wrist_ver" multiplier="1" offset="-0.4"/>
						</joint>-->

<!--control arm servo to elbow base-->	
	
	<joint name="wrist_ver" type="revolute">
		<axis xyz="1 0 0" />
		<limit effort="1000" lower="1.36" upper="1.72" velocity="0.5" />
		<parent link="servo_control_arm"/>
		<child link="fitter_control_arm"/>
		<origin xyz="0 0 0" />
	</joint>

<!--control arm servo to elbow base-->	
	
	<joint name="servo_CA_to_elbow_base" type="fixed">
		<parent link="elbow_base"/>
		<child link="servo_control_arm"/>
		<origin xyz="0.021 0 0.085" />
	</joint>

<!--control arm shaft-->	
	
	<joint name="control_arm_to_wrist_shaft" type="fixed">
		<parent link="wrist_vertical"/>
		<child link="control_arm_shaft"/>
		<origin xyz="0 0 0.03" />
	</joint>

<!--vertical wrist joint to elbow shaft-->	
	
	<joint name="wrist_ver_to_shaft" type="fixed">
		<parent link="longer_shaft"/>
		<child link="wrist_vertical"/>
		<origin xyz="0 0 0" />
	</joint>

<!--elbow to wrist shaft-->	
	
	<joint name="elbow_to_wrist" type="revolute">
		<axis xyz="1 0 0"/>
		<limit effort="1000" lower="1" upper="1.36" velocity="0.5" />	
		<parent link="double_bearing_1"/>
		<child link="longer_shaft"/>
		<origin xyz="0 0 0" />
		<mimic joint="wrist_ver" multiplier="1" offset="0"/>
	</joint>

<!--elbow to wrist shaft bearings-->
	<joint name="elbow_to_wrist_bearings" type="fixed">
		<parent link="elbow_vertical_top"/>
		<child link="double_bearing_1"/>
		<origin xyz="0 0 0.1048" />
	</joint>

<!--vertical elbow's top bit-->
	<joint name="elbow_top" type="fixed">
		<parent link="elbow_vertical"/>
		<child link="elbow_vertical_top"/>
		<origin xyz="0 0 0" />
	</joint>

<!--mimic 2nd & 3rd servo to vertical elbow link-->	
	
	<joint name="elbow_ver" type="revolute">
		<axis xyz="1 0 0" />
		<limit effort="1000" lower="0.1" upper="0.4" velocity="0.5" />
		<parent link="servo_elbow_vertical_left"/>
		<child link="elbow_vertical"/>
		<origin xyz="0 0 0" />
	</joint>

<!--3rd servo to elbow base right-->
	<joint name="3rd_servo_to_elbow_base" type="fixed">
		<parent link="elbow_base"/>
		<child link="servo_elbow_vertical_right"/>
		<origin xyz="0 0 0.04" />
	</joint>

<!--2nd servo to elbow base left-->
	<joint name="2nd_servo_to_elbow_base" type="fixed">
		<parent link="elbow_base"/>
		<child link="servo_elbow_vertical_left"/>
		<origin xyz="0 0 0.04" />
	</joint>

<!--base plate to elbow base-->
	<joint name="plate_to_elbow_base" type="fixed">
		<parent link="base_plate"/>
		<child link="elbow_base"/>
		<origin xyz="0 0 0.01" />
	</joint>


<!--1st servo main base to base plate-->
	<joint name="base_plate_hoz" type="revolute">
		<axis xyz="0 0 1" />
		<limit effort="1000" lower="0.1" upper="3.14" velocity="0.5" />
		<parent link="base_plate_servo"/>
		<child link="base_plate"/>
		<origin xyz="0 0 0.022" />
	</joint>

<!--1st servo on main base-->
	<joint name="servo_on_main_base" type="fixed">
		<parent link="main_base"/>
		<child link="base_plate_servo"/>
		<origin xyz="0 0 0.030" />
	</joint>

<!--base link to main base-->
	<joint name="base_to_main" type="fixed">
		<parent link="base_link"/>
		<child link="main_base"/>
		<origin xyz="0 0 0.015" />
	</joint>
</robot>
```

### Video Demonstration

[![](https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/arm_bot_ROS_YT.png?raw=true)](https://www.youtube.com/watch?v=Z4pNaspH2g0)


<br><br><br>

					END OF LABS
					BACK TO LAB 1

[Lab1 Software engineering for roboticists](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab1%20software%20engineering%20for%20roboticists.md)

For links to other labs please see the Index on top.



  


 
