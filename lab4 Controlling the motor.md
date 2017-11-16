# **ROCO222 LAB-JOURNAL**

## **FAISAL FAZAL-UR-REHMAN** 



## **Index**

[Lab1 Software engineering for roboticists](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab1%20software%20engineering%20for%20roboticists.md)

[Lab2 Build a DC motor](https://github.com/Faisal-f-rehman/journal.md/blob/master/lab2%20dc%20motor.md)

[Lab3 Incremental Encoder](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab3%20Incremental%20Encoder.md)


<br><br><br>

# **Controlling the motor**

In this lab we are going to control our motor in a closed loop formation by connecting the encoder on the motor that we built in lab 2 and 3, to Arduino. The encoder is going to give us the actual speed, which we are going to compare with the goal speed (speed that we wish to acheive). The difference between the actual speed detected from the encoder and the goal speed is then going to determine weather to slow down the motor or speed it up in order to achieve the goal speed.

		Closed loop control
![Closed loop control](https://github.com/Faisal-f-rehman/pics.vids/blob/master/Controlling%20the%20motor/Closed%20loop%20controll.png?raw=true)
image source: lecture notes edited

<br><br>

		The Motor shield
There are two main reasons to use t he motor shield:

+ Higher supply voltage:
	Since the arduino can only provide maximum of 5V, we use the motor shield as it can be operate between 5 to 12 volts with maximum 2A per channel and 4A for the two channels on the motor shield. 

+ H-Bridge
	A H-bridge is a circuit that allows us to switch the direction of the voltage on the outputs, which allows us to drive a motor in both the forward and reverse directions. This is done by 4 Bipolar junction transistors (BJTs) or MOSFETS, and diodes for some protection of the motor shield. These are connected in the following order:

![H-bridge main](https://github.com/Faisal-f-rehman/pics.vids/blob/master/Controlling%20the%20motor/H-Bridge%20main.png?raw=true)

Here Q1 and Q3 are connected to the positive (Vbat), rail of the power supply and Q2 and Q4 are connected to ground.  

_Case 1_
When Q1 and Q4 are turned on and Q3 and Q2 are turned off the current flows from Vbat to Q1 through the motor to Q4 and straight to ground. Assuming the 'A' side is the connected to the forward direction of the motor. This will drive the motor in the forward direction.

_Case 2_
When Q3 and Q2 are turned on and Q1 and Q4 are turned off, the current will flow from Vbat to Q3 through the motor to Q2 and striaght to ground. This will move the motor in the opposite direction than _Case 1_ i.e. in the reverse direction.

Please note that 'A' side and 'B' side in the H-bridge are 
		_Case 1_ Forward direction		_Case 2_ Reverse direction

<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Controlling%20the%20motor/H-bridge%201.png?raw=true" height="50%" width="50%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Controlling%20the%20motor/H-Bridge%202.png?raw=true" height="50%" width="50%"/>

<br><br><br>

## **Part I**

## Controlling a small hobby motor

The connections for the motor shield provided by university (Arduino Motor Shield REV3) are very simple. The motor shield slots on top of the Arduino UNO board and the only wired connections required are the power and ground connections to either port A or port B for a single motor.

![Motor Sheild Rev3](https://github.com/Faisal-f-rehman/pics.vids/blob/master/Controlling%20the%20motor/Uni%20motor%20shield%20connections.png?raw=true)

However since we were running behind we purchased a motorshield online (SAINSMART L293D Motorshield) and started working on it at home. This actually helped us understand how to read through datasheets and schematics to find pins and setup a motorshield from scratch.

Although finding the Arduino pins for direction and PWM on this motorshield was a time taking task wired connections were the same, as this motorshield slots on top of the Arduino UNO board as well.






