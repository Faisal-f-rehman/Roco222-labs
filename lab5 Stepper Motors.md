# **ROCO222 LAB-JOURNAL**

## **FAISAL FAZAL-UR-REHMAN** 

[Lab Partner: Spencer Perdomo-Davies](https://github.com/slperdomo-davies/Roco222--Lab-Journal/blob/master/Stepper_Motors.md)

## **Index**

[Lab1 Software engineering for roboticists](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab1%20software%20engineering%20for%20roboticists.md)

[Lab2 Build a DC motor](https://github.com/Faisal-f-rehman/journal.md/blob/master/lab2%20dc%20motor.md)

[Lab3 Incremental Encoder](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab3%20Incremental%20Encoder.md)

[Lab4 Controlling the motor](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab4%20Controlling%20the%20motor.md)

[Lab6 Robotic Arm Mini-project Part 1 – Servo motors](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab6%20Robotic%20Arm%20Mini-project%0APart%201%20%E2%80%93%20Servo%20motors.md)

[Lab7 Robotic Arm Mini-project Part 2 – ROS](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab7%20Robotic%20Arm%20Mini-project%0APart%202%20%E2%80%93%20ROS.md)

# **Lab5 Stepper Motors**

The Aims of this lab are as follows:

+ Wiring of a bipolar or unipolar stepper motor
+ Different operation modes of a stepper motor and their main characteristics (Full Step, Half Step & Micro Step)
+ Programming a stepper motor controller for the Arduino

### Stepper Motor Types

Stepper motors are synchronous electric motors. There are three main types of stepper motors:  

1) Variable reluctance stepper motors (Rotor has teeth and is made of ferromagnetic material)  
2) Permanent magnet stepper motors (Rotor does not have teeth but is made of permanent magnets with magnetic poles)  
3) Hybrid stepper motors (Rotor has both teeth and is made of permanent magnets with magnetic poles) *used in lab*  

<br><br>

### Wiring of a bipolar or unipolar stepper motor

#### Bipolar vs Unipolar

The difference between bipolar and unipolar stepper motors is the circuit wiring. The bipolar motors have 4 wires coming out of the motor and the unipolar motor can have 5 to 6. Unipolar motors have a center tap between two windings and are either brought outside the motor
separately or connected together and brought outside as one wire.

![uni vs bipolar](http://89.22.98.13/pylog/cnt/projects/shapeoko/_img/stepper/stepper.png)
image source: [Plog](http://89.22.98.13/pylog/pylog.py?disp=cnt/projects/shapeoko/Turn+a+unipolar+into+a+bipolar+steper.txt)

<br>

In this lab we will be using a 4 pole unipolar hybrid stepper motor as a bipolar hybrid stepper motor. This can be done with a 6 wire unipolar motor however a 5 wire unipolar motor has a connection between the wires inside the motor and to use a 5 wire unipolar motor as a bipolar motor we would have to disconnect the connection inside.

![stepper motor wiring](https://github.com/Faisal-f-rehman/pics.vids/blob/master/stepper_motors/stepper%20wiring.png?raw=true)
 
<br><br>

### Different operation modes of a stepper motor and their main characteristics

Stepper motors work in a very different way to brushed DC motors. The best way to understand how stepper motors work is to look at the simplest type, *Variable Reluctance Stepper Motor* which has teeth on the rotar and the stator (around the rotar) has electromagnets. The electromagnets have windings to allow north and south pole on the opposite ends. If we have 3 electromagnets on the stator with 4 teeth on the rotar, it looks like this:

<img src="https://cdn.instructables.com/FBS/BHKW/JAYJ46JT/FBSBHKWJAYJ46JT.MEDIUM.jpg" height="50%" width="50%"/><img src="https://www.amci.com/index.php/download_file/view_inline/2440/" height="50%" width="50%"/>
image source: [www.cdn.instructables.com](https://cdn.instructables.com/FBS/BHKW/JAYJ46JT/FBSBHKWJAYJ46JT.MEDIUM.jpg)	image source: [www.amci.com](https://www.amci.com/index.php/download_file/view_inline/2440/) 

When the current is applied to only electromagnet(EM) 1 the teeth on the rotar aligns' with the EM1, after this if current is applied to only EM2 the rotar will move to align the teeth with EM2. This type of operation is called *full step* and with our configuration ie 3 electromagnets and 4 teeth, this gives us a 30 degrees of movement per step.  

If the current is applied to 2 electromagnetic poles the teeth aligns in the center of the two poles after this if we turn the pole, we are moving away from, off it will align with the only pole that is energised. This type of operation gives more percision than *full step* but less speed, and is called *half step* operation. The half-step with our configuration give a 15 degrees turn per step.  

In *full-step* and *half-step* operations the movement can be jerky, to make smoother turns we can use *micro-stepping*. This can be achieved by sending a sinewave to the electromagnet we are moving to and a cosine wave to that we are moving from, at the same time. Since they are both 90 degrees (Pi/2 radians) out of phase, while the current gradually decreases in the EM we are moving from, the current gradually increases in the EM we are moving to.This is done by Pulse Width Modulation (PWM) as the duty cycle of the signal of one winding is decreased the duty cycle of the signal of other winding is increased. 

![sine-cosine](https://github.com/Faisal-f-rehman/pics.vids/blob/master/stepper_motors/sine-cosine.png?raw=true)
image source: lecture notes 

<br><br>

### Programming a stepper motor controller for the Arduino

**FULL_STEP**

				ARDUINO CODE
```C
#define DIR_A 12
#define PWM_A 3
#define DIR_B 13
#define PWM_B 11

const int delayMs = 1;

void setup() {
pinMode(DIR_A, OUTPUT);
pinMode(DIR_B, OUTPUT);

pinMode(9, OUTPUT); digitalWrite(9, LOW); //No braking ch. A
pinMode(8, OUTPUT); digitalWrite(8, LOW); //No braking ch. B
}

void loop()
{
  digitalWrite(DIR_A, HIGH); // Ch. A forward
  digitalWrite(DIR_B, HIGH); // Ch. B forward
  analogWrite(PWM_A, 255); // Ch. A on
  analogWrite(PWM_B, 0); // Ch. B off
  delay(delayMs);
  
  analogWrite(PWM_A, 255); // Ch. A on
  analogWrite(PWM_B, 0); // Ch. B off
  delay(delayMs);
  
  digitalWrite(DIR_A, LOW); // Ch. A backwards
  digitalWrite(DIR_B, LOW); // Ch. B backwards
  analogWrite(PWM_A, 0); // Ch. A off
  analogWrite(PWM_B, 255); // Ch. B on
  delay(delayMs);

  analogWrite(PWM_A, 255); // Ch. A on
  analogWrite(PWM_B, 0);// Ch. B off
  delay(delayMs);
}
```

*FULL STEP VIDEO CLIP*

[![](https://github.com/Faisal-f-rehman/pics.vids/blob/master/stepper_motors/full-step%20reverse%20stepper.png?raw=true)](https://www.youtube.com/watch?v=yOyhpsQ9kdk&feature=youtu.be) 

<br><br>

**HALF-STEP**
```C

-----------Half Step-----------------------------


#include <Stepper.h>

const int stepsPerRevolution = 400;  // This is for number of steps per revolution (200/0.5 = 400 Steps)
                                    

// initialize the stepper library on pins 8 through 13:
Stepper myStepper(stepsPerRevolution, 13,12,8,9);

int stepCount = 0;         // number of steps the motor has taken

void setup() {
  // initialize the serial port:
  Serial.begin(9600);
}

void loop() {
  if (stepCount < stepsPerRevolution) { 
    // step one step:
    myStepper.step(1);
    Serial.print("steps:" );
    Serial.println(stepCount);
    stepCount++;
    delay(500);
  }
}

  
}
```

<br>

**MICRO-STEPPING**

```C
//-----------Micro Stepping Code example-----------------------------

//----------Define and Initialisation of Variables-------------------

int microsteps =200; /Micro Steps for step
float amp = 255; // Output scaling
int pulseDelay = 10; Microseconds between wrire
int a[200];
int b[200];
int idxG;

//-----------Set Output Index-----------------------------------------

void setup() {
  int idx;

  Serial begin(9600); //Serial port initialisation
  idxG=0; //Initialise O/P index

//---------------Sine and Cos Array (Table build)---------------------

  for (idx-0 ; idx <microsteps; idx++) {
    a[idx] = amp * sin(idx * 2 * PI /microstep);
    b[idx] = amp * cos(idx * 2 * PI /microstep);
  }

//---------Set Pin Functions with Motor Shield Outputs----------------

    pinMode(13, OUTPUT);
    pinMode(12, OUTPUT);
    pinMode(8, OUTPUT);
    pinMode(9, OUTPUT);

//---------- take breaks off-------------------------------------------

    digitalWrite(8, LOW);
    digitalWrite(9, LOW);
  }

//----------------Use sign of value to Set output Direction and 0-255 to PWM only-------------------

//Write to Specified Stepper Channel

  void WriteValue(int value, int chaAnalog, int chanDigit)
  {
    int valueAbs = abs(value); 		// Get absolute value
    analogWrite(chanAnalog, value); 	//Write Absolute value as PWM
    if (value > 0) { 			//Set pos Direction
      digitalWrite(chanDigit, HIGH);
    }
    else{
      digitalWrite(chanDigit, LOW);	// Set Neg direction
    }
  }
 
  void loop() {
    WriteValue(a[idxG], 2, 12); / Write out Sin A and Cos B Values
    WriteValue(a[idxG], 2, 12);

  idxG++; // Index Update	
  if (idxG == microsteps) { 
    idxG = 0;
  }
  delayMicroseconds(pulseDelay); // Wait Delay

}

```




<br><br><br>

		Lab 6 servo motors mini-project
[Lab 6 servo motors mini-project](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab6%20Robotic%20Arm%20Mini-project%0APart%201%20%E2%80%93%20Servo%20motors.md)

For links to other labs please see the Index on top.



  


 
