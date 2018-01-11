# **ROCO222 LAB-JOURNAL**

## **FAISAL FAZAL-UR-REHMAN** 

[Lab Partner: Spencer Perdomo-Davies](https://github.com/slperdomo-davies/Roco222--Lab-Journal/blob/master/Motor_Control_With_The_Arduino.md)

## **Index**

[Lab1 Software engineering for roboticists](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab1%20software%20engineering%20for%20roboticists.md)

[Lab2 Build a DC motor](https://github.com/Faisal-f-rehman/journal.md/blob/master/lab2%20dc%20motor.md)

[Lab3 Incremental Encoder](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab3%20Incremental%20Encoder.md)

[Lab5 Stepper motors](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab5%20Stepper%20Motors.md)

[Lab6 Robotic Arm Mini-project Part 1 – Servo motors](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab6%20Robotic%20Arm%20Mini-project%0APart%201%20%E2%80%93%20Servo%20motors.md)

[Lab7 Robotic Arm Mini-project Part 2 – ROS](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab7%20Robotic%20Arm%20Mini-project%0APart%202%20%E2%80%93%20ROS.md)


<br><br><br>

# **Lab 4 - Controlling the motor**

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
Image source:[www.modularcircuits.com](http://www.modularcircuits.com/blog/articles/h-bridge-secrets/h-bridges-the-basics/)  


Here Q1 and Q3 are connected to the positive (Vbat), rail of the power supply and Q2 and Q4 are connected to ground.  

_Case 1_
When Q1 and Q4 are turned on and Q3 and Q2 are turned off the current flows from Vbat to Q1 through the motor to Q4 and straight to ground. Assuming the 'A' side is the connected to the forward direction of the motor. This will drive the motor in the forward direction.

_Case 2_
When Q3 and Q2 are turned on and Q1 and Q4 are turned off, the current will flow from Vbat to Q3 through the motor to Q2 and striaght to ground. This will move the motor in the opposite direction than _Case 1_ i.e. in the reverse direction.

Please note that 'A' side and 'B' side in the H-bridge are 
		_Case 1_ Forward direction		_Case 2_ Reverse direction

<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Controlling%20the%20motor/H-bridge%201.png?raw=true" height="50%" width="50%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/Controlling%20the%20motor/H-Bridge%202.png?raw=true" height="50%" width="50%"/>
Image source:[www.modularcircuits.com](http://www.modularcircuits.com/blog/articles/h-bridge-secrets/h-bridges-the-basics/)
<br><br><br>

## **Part I**

## Controlling a small hobby motor

The connections for the motor shield provided by university (Arduino Motor Shield REV3) are very simple. The motor shield slots on top of the Arduino UNO board and the only wired connections required are the power and ground connections to either port A or port B for a single motor.

![Motor Sheild Rev3](https://github.com/Faisal-f-rehman/pics.vids/blob/master/Controlling%20the%20motor/Uni%20motor%20shield%20connections.png?raw=true)

The basic code to run the hobby motor provided in the labsheet is as follows:

		Motor Shield 1-Channel DC Motor

```C

/*************************************************************
Motor Shield 1-Channel DC Motor
by Randy Sarafan
For more information see:
https://www.instructables.com/id/Arduino-Motor-Shield-Tutorial/
*************************************************************/

void setup() {
	//Setup Channel A
	pinMode(12, OUTPUT); //Initiates Motor Channel A pin
	pinMode(9, OUTPUT); //Initiates Brake Channel A pin
}

void loop(){
	//forward @ full speed
	digitalWrite(12, HIGH); //Establishes forward direction of Channel A
	digitalWrite(9, LOW);	//Disengage the Brake for Channel A
	analogWrite(3, 255);

	//Spins the motor on Channel A at full speed
	delay(3000);
	digitalWrite(9, HIGH); //Engage the Brake for Channel A
	delay(1000);

	//backward @ half speed
	digitalWrite(12, LOW); //Establishes backward direction of Channel A
	digitalWrite(9, LOW);  //Disengage the Brake for Channel A
	analogWrite(3, 123);

	//Spins the motor on Channel A at half speed
	delay(3000);
	digitalWrite(9, HIGH); //Eengage the Brake for Channel A
	delay(1000);
}
	

```

**Code explaination**

Pin 12 has been set as a digital output pin which controls the direction of the motor (forward and backwards), by changing it between high and low.

Pin 9 has been set as a digital output pin and is used to engage or disengage brakes on the motor, by setting the output high to brake and low to release the brakes 

Pin 3 is used to set the rotational speed of the motor by sending an analogue signal between amplitude 0 to 255, where 255 is the maximum speed

The delay(__) function is library added function thats just a loop keeping the program locked inside it for a given time. The argument time provided is in milliseconds.

**Demonstration**
		Slower version to see the direction
[![](https://github.com/Faisal-f-rehman/pics.vids/blob/master/Controlling%20the%20motor/Arduino%20hobby%20motor%20control%20slow.png?raw=true)](https://www.youtube.com/watch?v=1HtDqOqexIA)
		Faster version
[![](https://github.com/Faisal-f-rehman/pics.vids/blob/master/Controlling%20the%20motor/Arduino%20motor%20control%20fast.png?raw=true)](https://www.youtube.com/watch?v=_2DxTlCiI5U)

<br><br>

## **Part II**

## Controlling your DC motor in closed-loop

Unfortunately our motor was not capable of doing this task so we could not demonstrate this part of the lab. However we did write a code on Arduino for it:

**ARDUINO**
*DC MOTOR CLOSED LOOP CONTROL*

```C
#define TARGET_SPEED 100      //set target speed between 0 to 255

const byte ledPin = 13;
const byte interruptPin = 2;
volatile byte state = LOW;
unsigned long i = 0;
unsigned long time_bank[99];
unsigned long new_time = 0;
float rpm = 0.00;
float total_time_per_cycle = 0.00;
float time_per_cycle = 0.00;
byte PWM = 0;


void setup() 
{
  //MOTOR
  pinMode(12, OUTPUT);         //Initiates Motor Channel A pin
  pinMode(9, OUTPUT);         //Initiates Brake Channel A pin

  //Encoder
  pinMode(ledPin, OUTPUT);                              //set onboard led, pin 13 to output
  pinMode(interruptPin, INPUT);                         //set pin 2, interrupt pin as input
  Serial.begin(9600);                                   //baudrate 9600 
  
  // configure the interrupt call-back: blink is called everytime the pin
  // goes from low to high.

  attachInterrupt(digitalPinToInterrupt(interruptPin), blink, CHANGE);
}

void loop()
{
  //ENCODER
  digitalWrite(ledPin, state);                          //initialise pin 13 (onboard led)as LOW 
  pwmHandler(TARGET_SPEED);
  
}
//---------------END OF PROGRAMME--------------------\\



//-------------------FUNCTIONS------------------------\\

void blink()
{ 
  if(state = !state)                                    //enter if rotation is complete
  { 
    int u = 0;
    i++;
    new_time = micros();                                //assign current time to new_time
    time_bank[i] = new_time;                            //store current time in the array time_bank
    time_per_cycle = time_bank[i]-time_bank[i-1];       //assign time difference between last pulse and current pulse detected
    total_time_per_cycle += time_per_cycle*0.000001*60; //convert time difference from micro-seconds to minutes and add to the total time taken for the rotations so far 
    rpm = float(i/total_time_per_cycle);                //divide total rotations(pulses) by total time to get rotations per minute RPM 

    if(i>98)                                            //reset rotaions counted back to zero
    {
      i=0;
    }
    
    Serial.println(i);                                  //print number of rotations to serial port
    Serial.println(total_time_per_cycle);               //print total time taken for the rotations so far to serial port
    Serial.println(rpm,2);                              //print speed(RPM) to 2 decimal points
  }
  new_time=0;                                           
  rpm = 0.00;
  
}


void pwmHandler (byte target_speed)
{ 
  unsigned short error = 0;
  unsigned short rpm_scaled = 0;
  //Assuming max rpm = 2000, scale it down to 255
  rpm_scaled = rpm/7.843; //rpm_scaled at max = 2000/7.843 = 255
  
  //error signal
  error = target_speed + (rpm_scaled-target_speed); //adjust speed from feedback
  if(error<=0){error = 0;}                           //make sure speed is positive
  
    //MOTOR
  digitalWrite(12, HIGH); //Establishes forward direction of Channel A
  digitalWrite(9, LOW);   //Disengage the Brake for Channel A

  if(PWM >= error)          //Enter if statement to turn motor off
  {
    analogWrite(3, 0);      //turn motor off
    digitalWrite(9, HIGH);  //Engage the Brake for Channel A
    PWM++;
  }
  else
  {
    analogWrite(3, 255);    //motor at full speed
    digitalWrite(9, HIGH);  //Engage the Brake for Channel A
    PWM++;
  }
  if (PWM >= 255)           //PWM duty cycle set at 0 to 255
  {
   PWM = 0;
  }
}


```
<br><br><br>

		Lab 5 Stepper motors
[Lab 5 Stepper motors](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab5%20Stepper%20Motors.md)

For links to other labs please see the Index on top.





