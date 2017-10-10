
## **Index**

[Lab1 Software engineering for roboticists](https://github.com/Faisal-f-rehman/journal.md/blob/master/journal.md)

[Lab2 Build a DC motor](https://github.com/Faisal-f-rehman/journal.md/blob/master/lab2%20dc%20motor.md)


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

<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/Screenshot%20from%202017-10-09%2019-59-10.png?raw=true" height="49.5%" width="49.5%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/Screenshot%20from%202017-10-09%2019-59-45.png?raw=true" height="50.5%" width="50.5%"/>

The **commutator** is made of even metal strips (two strips in this case), stuck on a circle on the same shaft as the core and therefore rotates with the armature and the core. Each metal strip is connected to the copper wire as mentioned above and as it rotates the brushes rub on these strips to conduct electricity through the strips and the coils.

There are two **brushes** connected to a dc power supply, one to the positive terminal and one to the negative terminal. These brushes are fixed on the housing/frame of the motor and rub against the commutator as the commutator rotates, switching the currunt flow in the armature.   

### **_How it works_**


<img src="https://cdn4.explainthatstuff.com/how-electric-motor-works-animation.gif"/>|Source  [www.explainthatstuff.com](http://www.explainthatstuff.com/electricmotors.html)

Taking a very basic DC motor as an example with a single wire/coil as the armature and only two poles, makes it easier to understand the theory. 

A DC brushed motor is all about electromagnetism. When the current passes through the coil it generates magnetic field around the wire. According to Ampere's right hand screw rule if you hold the wire in the right hand with your thumb pointing in the direction of the curret flow, the magnetic fields are generated in the direction that your fingers would fold. (Lecture note snap below)  
<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/Amperes%20right%20hand%20screw%20rule.png?raw=true" height="50%" width="50%"/>  
When the current is passed through the armature coil between the two poles, the magnetic fields from the coil interacts with the magnetic field running from north to south poles, this generates a magnetic force (F=ILB, F, I and B are vector quantities and L is the length of the wire), on the wire/coil, this magnetic force creates torque (T=F*L) which rotates the motor. 

If we hold the wire like we did in Ampere's rule with the thumb pointing in the direction of current but this time unfold our fingers, we will have thumb pointing in the direction of current and if we move our fingers pointing in the direction of flux density (B) of poles, the magnetic force would be pointing away from the palm perpandicular to both flux density and current.(Snap from lecture notes and an image sourced from [Hyperphysics](http://hyperphysics.phy-astr.gsu.edu/hbase/magnetic/motdc.html) below)  
<img src="http://hyperphysics.phy-astr.gsu.edu/hbase/magnetic/imgmag/dcmop.gif" height="50%" width="50%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Motor/Mag%20force%20hand%20rule.png?raw=true" height="50%" width="50%"/>
 
## **Part I**  
# **Build a brushed DC electrical motor**

### Step 1 – Build a commutator

We built the commutator with a self-adhesive copper tape and a cork. We taped two strips of the copper around one end of the cork leaving a gap between the strips, to prevent short circuit.

### Step 2 – Add support shaft

For the support shaft we pressed two nail like metal pieces in the cork that would allow the cork to rest on them while they rotate.

### Step 3 – Wind the armature coil

We wound the 10m armature coil around the cork and through the gaps between the commutator strips while counting the number of turns, unfortunately we could only get 58 turns out of 60 required from the length of the wire. This is when we measured the resistance of the coil, which came to 3.6ohms (very tiny amount of resistance),so that we could calculate the voltage required, as the max current allowed was 2A according to the labsheet.

### Step 4 – Build the shaft support and magnet brackets

The shaft and magnet supports were fairly easy to make with the paper clips, however aligning them properly was a little trickier as once the magnets went on them the clips supporting the shaft started to move from side to side.

### Step 5 – Build the baseplate

We screwed the paper clips into the base plate using the washer and screws provided


## Part II
# Test the motor

First we calculated the voltage required. Since the "max" current was 2A we decided to start with half the amount of current allowed ie 1A. V = IR = 1A * 3.6ohms = 3.6V

Then we made the brushes by sticking some copper tape at the end of the wires coming from the power supply.

Then we switched the power on and held the brushes on the commutator and gave the shaft a push start, unfortunately we couldnt get any more than a turn or two out of the motor. This could be due a number of reasons:

After some research online and looking at the equations in the lecture notes I found out that greater number of coil turns produces higher torque but lower speeds (N in rpm, rotations per minute) which means that there is a trade off between torque and speed (torque is inversely proportional to speed T=1/N)and this meant the problem we were facing was could be to do with torque and therefore the number of coil turns being under 60, Or this could also be down to the fact that keeping a steady connection between the brushes and the commutator was very difficult.

# Calculating theoratical values

Since we know the resistance (R) the supply voltage (V) and the current (I), from the power equations in the lecture notes we can use simultaneous equations to evaluate torque and rotational speed of the motor:
# ------------------------------------ NEED TO PUT IN MATHS DONE ON PAPER------------------------------

## Part III
# A better DC motor
**You are now required to build a brushed DC motor with a minimum of two coils. You should also build a com-mutator and brush mechanism so that the motor self starts**

