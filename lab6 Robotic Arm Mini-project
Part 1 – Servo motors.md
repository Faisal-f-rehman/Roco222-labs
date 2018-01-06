# **ROCO222 LAB-JOURNAL**

## **FAISAL FAZAL-UR-REHMAN

[Lab Partner: Spencer Perdomo-Davies](https://github.com/slperdomo-davies/Roco222--Lab-Journal/blob/master/Robotic_Arm-Mini_project.md)

## **Index**
[Lab1 Software engineering for roboticists](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab1%20software%20engineering%20for%20roboticists.md)

[Lab2 Build a DC motor](https://github.com/Faisal-f-rehman/journal.md/blob/master/lab2%20dc%20motor.md)

[Lab3 Incremental Encoder](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab3%20Incremental%20Encoder.md)

[Lab4 Controlling the motor](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab4%20Controlling%20the%20motor.md)

[Lab5 Stepper motors](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab5%20Stepper%20Motors.md)

[Lab7 Robotic Arm Mini-project Part 2 – ROS](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab7%20Robotic%20Arm%20Mini-project%0APart%202%20%E2%80%93%20ROS.md)

# Lab6 Robotic Arm Mini-project Part 1 – Servo motors

Lab6 and lab7 combined cover a mini project in which we are going to build a robotic arm. This is split in 6 parts which are as follows:

1 Servo motor control with Arduino
2 3D design and 3D printing 
3 Assembling the arm
4 Servo motor control with Arduino through terminal
5 Rviz 3D simulation of the arm, written in URDF (XML format)
6 3D motion planning and finalisation

In this lab we are just going to cover the first part (Servo motor control with Arduino). The components and materials used are as follows:

+ Arduino UNO
+ TowerPro SG-90 9g servo motors
+ 2 Potentiometers
+ Breadboard
+ Some jumper wires
+ A piece of cardboard 

		TowerPro SG-90 9g Servo datasheet
![Servo control closed loop circuit](https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/TowerPro_9g_datasheet.png?raw=true)   


### Servo motor basics

Servo motors are high torque, low speed, position control electrical (DC) motors in a closed loop configuration. Where the feedback in the loop is fed through an op-amp comparator. The comparator compares the target (input) signal and the output signal and ouputs the difference between the two, called the error signal. This error signal drives the servo motor. Once the difference between target and output signal equal's to zero ie error = 0 the servo motor stops rotating.  


		Servo control closed loop circuit
![Servo control closed loop circuit](https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/servo_closed_loop_system_lab_snip.png?raw=true)   


To control the servo motor we will send PWM (Pulse Width Modulation) signals. The ratio between when the PWM signal is high and when it is low determines the position of the servo. Typical PWM ratios for servos are between 20/0.7 to 20/2.0, where 20/0.7 is the furthest anti-clockwise position, 20/2.0 is the furthest clockwise position and 20/1.5 is the center position of the servo. The numerator of the ratio is the period of the PWM which is = 20ms and the denominators are the duration of the signal when its high (0.7ms to 2.0ms). 

					Servo control Pusle Width Modulation
<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/servo_pwm.png?raw=true" height="60%" width="60%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/servo_PWM.gif?raw=true" height="40%" width="40%"/>


<br><br><br>

		Lab7 Robotic Arm Mini-project
[Lab7 Robotic Arm Mini-project Part 2 – ROS](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab7%20Robotic%20Arm%20Mini-project%0APart%202%20%E2%80%93%20ROS.md)

For links to other labs please see the Index on top.



  


 
