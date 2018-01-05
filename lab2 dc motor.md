# **ROCO222 LAB-JOURNAL**

## **FAISAL FAZAL-UR-REHMAN, Student ID** 

[Lab Partner: Spencer Perdomo-Davies](https://github.com/slperdomo-davies/Roco222--Lab-Journal/blob/master/Build_A_DC_Motor.md#practical-2-building-a-dc-motor)

## **Index**

[Lab1 Software engineering for roboticists](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab1%20software%20engineering%20for%20roboticists.md)

[Lab3 Incremental Encoder](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab3%20Incremental%20Encoder.md)

[Lab4 Controlling the motor](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab4%20Controlling%20the%20motor.md)

[Lab5 Stepper motors](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab5%20Stepper%20Motors.md)

[Lab6 Robotic Arm Mini-project Part 1 – Servo motors](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab6%20Robotic%20Arm%20Mini-project%0APart%201%20%E2%80%93%20Servo%20motors.md)

[Lab7 Robotic Arm Mini-project Part 2 – ROS](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab7%20Robotic%20Arm%20Mini-project%0APart%202%20%E2%80%93%20ROS.md)

# **Lab2 Build a DC motor**

**What is it about?**  
	Let’s build a DC motor from scratch! You have 2 weeks to: (1) build a first version, (2) iterate 		and optimise the design, (3) build a better version of your motor.

**Aims**  
	At the end of the practical, you should:
	• know the key parts of a DC motor
	• have gained an experimental intuition of the physics behind DC motors
	• have a working and reasonably efficient DC motor that we will re-use during the coming 		  practicals

**Specific Challenges**  
	• A certain sense of meticulousness might be needed for an optimal result
	• You’ll get your hands dirty
	• (and you’ll need to use a soldering iron)

# 

In this lab we are going to build a brushed DC motor with parts that are fairly easy to get and cheap to buy. The parts are as follows:

1) A cork, possibly from a champagne bottle :D
2) Approximately 10m of copper wire
3) 4 large paperclips
4) 4 screws with washers
5) 4 Rare Earth (Neodymium Magnets)
6) 2 thin but long (about 3.5cm long) nails
7) Approximately 0.5cm thick and about 10-12cm square wooden base
8) DC power supply or a battery


### **_Some theory first_**

A very basic DC brushed motor consists of following:

Two **Poles** facing each other, one is North and the other is south i.e  attracting each other and due to this a magnetic field is generated between the two poles in a straight line, from North to South. 

An **armature** made up of copper wire wrapped around the **core**. Where the substance that the core is made of and the number of copper wire turns effects the magnetic flux density (B=uin => B=uiN/l, see the lecture snippets below). Each of the two ends of the copper wire are attached to two metal strips known as the commutator.   

<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/Workings%20and%20Notes/Screenshot%20from%202017-10-09%2019-59-10.png?raw=true" height="49.5%" width="49.5%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/Workings%20and%20Notes/Screenshot%20from%202017-10-09%2019-59-45.png?raw=true" height="50.5%" width="50.5%"/>

The **commutator** is made of even metal strips (two strips in this case), stuck on a circle on the same shaft as the core and therefore rotates with the armature and the core. Each metal strip is connected to the copper wire as mentioned above and as it rotates the brushes rub on these strips to conduct electricity through the strips and the coils.

There are two **brushes** connected to a dc power supply, one to the positive terminal and one to the negative terminal. These brushes are fixed on the housing/frame of the motor and rub against the commutator as the commutator rotates, switching the currunt flow in the armature.   

### **_How it works_**


<img src="https://cdn4.explainthatstuff.com/how-electric-motor-works-animation.gif"/>|Source  [www.explainthatstuff.com](http://www.explainthatstuff.com/electricmotors.html)

Taking a very basic DC motor as an example with a single wire/coil as the armature and only two poles, makes it easier to understand the theory. 

A DC brushed motor is all about electromagnetism. When the current passes through the coil it generates magnetic field around the wire. According to Ampere's right hand screw rule if you hold the wire in the right hand with your thumb pointing in the direction of the curret flow, the magnetic fields are generated in the direction that your fingers would fold. (Lecture note snap below)  
<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/Workings%20and%20Notes/Amperes%20right%20hand%20screw%20rule.png?raw=true" height="50%" width="50%"/>  
When the current is passed through the armature coil between the two poles, the magnetic fields from the coil interacts with the magnetic field running from north to south poles, this generates a magnetic force (F=ILB, F, I and B are vector quantities and L is the length of the wire), on the wire/coil, this magnetic force creates torque (T=F*L) which rotates the motor. 

If we hold the wire like we did in Ampere's rule with the thumb pointing in the direction of current but this time unfold our fingers, we will have thumb pointing in the direction of current and if we move our fingers pointing in the direction of flux density (B) of poles, the magnetic force would be pointing away from the palm perpandicular to both flux density and current.(Snap from lecture notes and an image sourced from [Hyperphysics](http://hyperphysics.phy-astr.gsu.edu/hbase/magnetic/motdc.html) below)  
<img src="http://hyperphysics.phy-astr.gsu.edu/hbase/magnetic/imgmag/dcmop.gif" height="50%" width="50%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/Workings%20and%20Notes/Mag%20force%20hand%20rule.png?raw=true" height="50%" width="50%"/>
 
## **Part I**  
# **Build a brushed DC electrical motor**

### Step 1 – Build a commutator

We built the commutator with a self-adhesive copper tape and a cork. We taped two strips of the copper around one end of the cork leaving a gap between the strips, to prevent short circuit.

![Commutator](https://github.com/slperdomo-davies/Roco222--Lab-Journal/blob/master/media/0_Stage_CommutatorandArmature.JPG?raw=true)

### Step 2 – Add support shaft

For the support shaft we pressed two nail like metal pieces in the cork that would allow the cork to rest on them while they rotate.

### Step 3 – Wind the armature coil

We wound the 10m armature coil around the cork and through the gaps between the commutator strips while counting the number of turns, unfortunately we could only get 58 turns out of 60 required from the length of the wire. This is when we measured the resistance of the coil, which came to 3.6ohms (very tiny amount of resistance),so that we could calculate the voltage required, as the max current allowed was 2A according to the labsheet.

![Ready armature with shaft and measured resistance](https://github.com/slperdomo-davies/Roco222--Lab-Journal/blob/master/media/3.6Ohm_Measurement_0_stage_motor.JPG?raw=true)

### Step 4 – Build the shaft support and magnet brackets

The shaft and magnet supports were fairly easy to make with the paper clips, however aligning them properly was a little trickier as once the magnets went on them the clips supporting the shaft started to move from side to side.

### Step 5 – Build the baseplate

We screwed the paper clips into the base plate using the washer and screws provided

![Fully assembled motor](https://github.com/slperdomo-davies/Roco222--Lab-Journal/blob/master/media/0_Stage_Motor_Pic3.JPG?raw=true)


## Part II
# Test the motor

First we calculated the voltage required. Since the "max" current was 2A we decided to start with half the amount of current allowed ie 1A. V = IR = 1A * 3.6ohms = 3.6V

Then we made the brushes by sticking some copper tape at the end of the wires coming from the power supply.

Then we switched the power on and held the brushes on the commutator and gave the shaft a push start, unfortunately we couldnt get any more than a turn or two out of the motor. This could be due a number of reasons:

After some research online and looking at the equations in the lecture notes I found out that greater number of coil turns produces higher torque but lower speeds (N in rpm, rotations per minute) which means that there is a trade off between torque and speed (torque is inversely proportional to speed T=1/N)and this meant the problem we were facing was could be to do with torque and therefore the number of coil turns being under 60, Or this could also be down to the fact that keeping a steady connection between the brushes and the commutator was very difficult.




## Part III
# A better DC motor
**You are now required to build a brushed DC motor with a minimum of two coils. You should also build a com-mutator and brush mechanism so that the motor self starts**

We ended up making 2 motors. We jumped straight into building our first motor without really thinking it through, we learnt a valuable lesson that one should properly understand the maths fully behind the concept first.


## Motor 1
We checked if 1 pence copper coins were attracted to magnets and used them as the core between the coils, at this point we hadn't actually checked the relative permiability (ur, u=greek letter Mu), of copper, which is 1. This meant that the copper core did not help produce more magnetic flux(*B=u0.ur.i*), instead it made matters worse by cogging our motor. 

Since we designed the first motor to have coil windings parallel to the shaft and not wrapped around the shaft, the issue with cogging was even worse. As this meant that each pole due to magnetic attraction of the material inside the coil windings (solinoid), would try to stop when facing the fixed magnets. Although we did take this into account and made a swirl design it still was not powerful enough to get around the cogging. (Motor 1 pictures below).

We also made the diameter of the commutator too big, as this meant that the brushes would have to travel a larger distance to activate the next coil.

		3D printed commutator and armature rotor		Solidworks armature rotor and commutator
<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/1st%20Motor/3d%20print%20motor%201.jpg?raw=true" height="50%" width="50%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/1st%20Motor/Motor%201%20shaft.PNG?raw=true" height="50%" width="50%"/>

		3D printed assembled motor 1				Solidworks assembly of motor 1
<img src="https://github.com/slperdomo-davies/Roco222--Lab-Journal/blob/master/media/First_Design_Assembled.JPG?raw=true" height="55%" width="55%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/1st%20Motor/Motor%201%20assembly.PNG?raw=true" height="45%" width="45%"/>


As you can see above, we decided to save some time and made a wooden frame instead of printing it. This is where Spencer's great wood working skills came in very handy.

## Motor 2
Since we had so many problems with the first motor we decided to start fresh and this time we studied the maths and the theory properly behind the DC brush motor.


By this time lab 3 encoder was out, so we decided to incorporate a suitable holding for the IR LED and the phototransistor into our motor frame and shaft. 

### Considerations taken for the improved motor design:

#### Formulas to consider
![Flux Density, Force and Torque](https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/Workings%20and%20Notes/Page%201.jpeg?raw=true)
![Torque and Power equation](https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/Workings%20and%20Notes/Page%202.jpeg?raw=true)

#### Rough armature sketch and dimensions
![Armatutre sketch ](https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/Workings%20and%20Notes/Page%203%20edit.jpg?raw=true)  

As you can see from the sketches above we decided to wind the coil in almost a lap-winding formation wrapped 'around'the rotar/shaft. This meant that we could print a hollow rotar/core and slide a piece of material with high relative permiability, as this would increase the magnetic flux dramatically without introducing cogging.
<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/2nd%20motor/2nd%20motor%20steel%20core1.jpg?raw=true" height="50%" width="50%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/2nd%20motor/2nd%20motor%20steel%20core2.jpg?raw=true" height="50%" width="50%"/> 


#### Calculations
We decided to start making an excel for the calculations of motors, as this could be very handy to refer back to later on. This also helps us to make graphs for analysis.

![DC brushed motor excel](https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/Workings%20and%20Notes/Roco222%20excel%20snippet%202.PNG?raw=true)

# 
#### Solidworks
		Commutator and Armature					Encoder disc shaft 
<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/2nd%20motor/Motor%202%20Armature%20and%20commutator.PNG?raw=true" height="50%" width="50%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/2nd%20motor/Motor%202%20encoder.PNG?raw=true" height="50%" width="50%"/>

		Motor 2 Frame						Motor 2 Assembly
<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/2nd%20motor/Motor%202%20frame.PNG?raw=true" height="50%" width="50%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/2nd%20motor/Motor%202%20Assembly.PNG?raw=true" height="50%" width="50%"/>

# 
#### 3D Printed Final Model
		Commutator and Armature					Encoder disc shaft 
<img src="https://github.com/slperdomo-davies/Roco222--Lab-Journal/blob/master/media/3d_printing_second_design.JPG?raw=true" height="50%" width="50%"/><img src="https://github.com/slperdomo-davies/Roco222--Lab-Journal/blob/master/media/3D_Printed_Encoder.JPG?raw=true" height="50%" width="50%"/>

		All parts before assembly				Complete and assembled 
<img src="https://github.com/slperdomo-davies/Roco222--Lab-Journal/blob/master/media/3d_Print_Second_Design_all.JPG?raw=true" height="50%" width="50%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/2nd%20motor/2nd%20motor%20ready.jpg?raw=true" height="50%" width="50%"/>

						Video clips of motor running
		Loose brushes
[![](https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/2nd%20motor/loose%20brushes%20youtube%20snap.png?raw=true)](https://www.youtube.com/watch?v=Coqi3rfe3As)

		Fixed brushes
[![](https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/2nd%20motor/fixed%20brushes%20youtube%20snap.png?raw=true)](https://youtu.be/EVDvQrVak18)


### Testing Motor 2

We had a running motor which was fairly powerful. However the motor would only run for half a minute or so at varying speeds and although it would auto start sometimes, it would'nt auto start everytime. After a lot of painful hours of trial and error and head scratching we found the following reasons for this:

+	The shaft was not straight!!. The 3D printed part had a slight bend towards the commutator, which looked like a very little bend while holding it but once fitted into the frame, it created a huge hump for the motor to climb. This meant that when the motor was stationary it would always rest just before the hump. Which is why when we started the motor, sometimes the motor would climb the hump and start rotating but other times it just did not have enough torque and would keep trying to pass the hump but would not succeed. 

+ Even though we had friction less bearings installed on the motor, the shaft was kind of stiff (lot of friction). This was again due to the bend in the shaft, as this made the motor wobbly and it would touch the frame at points while rotating. This also made it very tricky to have fixed brushes as they need to be in constant contact with the commutator and although after a lot of trial and error and adjustments we made two different types of brushes which had some bounce/spring element to it so that it could follow the wobbling shaft as it rotated, it still had very high friction as it pressed towards the brushes while wobbling. We made one type of brushes by collecting some copper coil together and the second one from paper clips.

+ The friction and the wobbling of the shaft meant that there was always some kind of force acting against the motor's direction of torque. Since current is _proportional_ to torque this meant more and more current was required and such a high amount of current made the coils heat up very quickly and since torque is _inversely proportional_ to temprature the motor would stop rotating after half a minute or so.

		Motor trying to climb the hump and succeeding eventually
[![](https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/2nd%20motor/Uneven%20shaft%20youtube%20snap.png?raw=true)](https://www.youtube.com/watch?v=ys8xREoQkec)

# 

At the end although our motors did not work very well and some did not work at all, it was perhaps more educational for us thanm it would have been if our motors worked straight away, since we had to dig into the theory behind it and do lots of research to find out what mistakes we were making. Due to all the issues with the motor we were unable to measure the characteristics of our motor physically, so we decided to take our theoratical measurements instead to plot the torque vs speed graph.  

		Excel torque vs speed (revolutions per minute) 
![Excel speed vs torque](https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/Workings%20and%20Notes/Roco222%20excel%20snippet%202.PNG?raw=true)

		Torque vs Speed (RPM) Graph
![Excel speed vs torque graph](https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/Workings%20and%20Notes/Torque%20vs%20Speed%20snap.PNG?raw=true)
# 

We searched online to check if our theoratical values were atleast reasonable and they seem to be. Following is a snap/image from one of the links we compared our values with:
![DC motor datasheets](https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/Workings%20and%20Notes/Online%20data%20of%20different%20non%20gear%20motors.PNG?raw=true)  
Image source: [www.transmotec.com](https://transmotec.com/product-category/dc-motors/)

# 
# 

		Lab-3 link below
[Lab3 Incremental Encoder](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab3%20Incremental%20Encoder.md)

For links to other labs please see the Index on top.

