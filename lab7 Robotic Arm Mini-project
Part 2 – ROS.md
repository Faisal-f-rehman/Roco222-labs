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
5) Rviz 3D simulation of the arm, written in URDF (XML format)
6) 3D motion planning and finalisation

		SECTION 2 - 3D DESIGN & PRINTING

Initial design was to include a motor for every joint. It included stepper and servo motors.

		INITIAL SKETCHES
![INITIAL SKETCHES](https://github.com/slperdomo-davies/Roco222--Lab-Journal/blob/master/media/Roco222%20Arm%20Concept%201.jpg?raw=true)

However during our sketches Jake pointed out that there is a way to have most servo motors at the bottom of the arm, this helps with the torque of the servo motor, so we decided to include a shaft in our design that would attach to a servo near the base and to a joint further up. We decided to be ambitious and include 5 degrees of freedom with 6 servo motors.

		DESIGN AND PRINTING SOLIDWORKS
<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/assm_pic1.PNG?raw=true" height="50%" width="50%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/assm_pic2.PNG?raw=true" height="50%" width="50%"/>

<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/assm_pic3.PNG?raw=true" height="50%" width="50%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/drawings.PNG?raw=true" height="50%" width="50%"/>

<br>
		SECTION 3 - ASSEMBLING THE ARM
Assembly was a massive task, Spencer had to reprint a few parts since the printer percision is +-1.5mm, which makes a lot difference than one would expect, since the servos and other printed parts had to fit in tightly. After a few attempts and sleepless nights for Spencer, we managed to assemble the arm. However after the assembly, we realised how top heavy the arm was for the small hobby servos. To compensate for the weight we had to include a few rubber bands, although they were a bit of an eye sore, they did the job.

<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/physical_assembly_1.jpeg?raw=true" height="50%" width="50%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/physical_assembly_2.jpeg?raw=true" height="50%" width="50%"/>
<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/physical_assembly_3.jpeg?raw=true" height="50%" width="50%"/>
 
<br>

		SECTION - 4 SERVO MOTOR COTROL THROUGH TERMINAL


<br><br><br>

					END OF LABS
					BACK TO LAB 1

[Lab1 Software engineering for roboticists](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab1%20software%20engineering%20for%20roboticists.md)

For links to other labs please see the Index on top.



  


 
