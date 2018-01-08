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

1) Servo motor control with Arduino
2) 3D design and 3D printing 
3) Assembling the arm
4) Servo motor control with Arduino through terminal
5) Rviz 3D simulation of the arm, written in URDF (XML format)
6) 3D motion planning and finalisation

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
		Servo control closed loop circuit
![Servo control closed loop circuit](https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/servo_closed_loop_system_lab_snip.png?raw=true)   

Servo motors are high torque, low speed, position control electrical (DC) motors in a closed loop configuration. Where the feedback in the loop is fed through an op-amp comparator. The comparator compares the target (input) signal and the output signal and ouputs the difference between the two, called the error signal. This error signal drives the servo motor. Once the difference between target and output signal equal's to zero ie error = 0 the servo motor stops rotating.  

					Servo control Pusle Width Modulation
<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/servo_pwm.png?raw=true" height="70%" width="70%"/><img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/servo_PWM.gif?raw=true" height="30%" width="30%"/>
To control the servo motor we will send PWM (Pulse Width Modulation) signals. The ratio between when the PWM signal is high and when it is low determines the position of the servo. Typical PWM ratios for servos are between 20/0.7 to 20/2.0, where 20/0.7 is the furthest anti-clockwise position, 20/2.0 is the furthest clockwise position and 20/1.5 is the center position of the servo. The numerator of the ratio is the period of the PWM which is = 20ms and the denominators are the duration of the signal when its high (0.7ms to 2.0ms). 

### Step 1 – Control an RC servo

*Task*
*Write a simple program that runs the servo to generate an output movement back and forward over its entire range so its movement follows a low frequency sine wave of frequency around 0.2Hz*

		Wire up connections
![Step1 connections](https://github.com/Faisal-f-rehman/pics.vids/blob/master/arm_bot_media/direct_servo_to_arduino.png?raw=true)   

BLACK wire = GND
RED wire = Vin
YELLOW wire = PWM

		Arduino Code
Although there is a library for the servo in arduino which makes things lot simpler, we decided to do this lab by writing the code without the library, to try and understand whats going on between the servo and the Arduino.

*calculations*
Period(Total) = 1/frequency(f) = 1/0.2 = 5sec = 5000ms
Period(T) per cycle = 20ms
Total steps available = 5000/20 = 250 steps
PWM pulse range up = 700us to 2000us
PWM pulse range down = 1990us to 890us
Incrments = Highest range/half steps = (2000-700)/125 = 1300/125 = 10.4
Decrements =  Highest range/half steps =((2000-10)-800)/124 = (1990-800)/124 = 1190/124 = 9.6

		Arduino Code
***c

#define pwm_pin 9

unsigned short pwm_on[250];   //holds delay amounts in milliseconds for the time pulse is high
float steps_up = 700;         //variable to increment from 700us to 2000us -> 0 to 180 degrees 
float steps_down = 1990;      //variable to decrement from 1990us to 890us -> 180 to 0 degrees

//-----setup -- not looped------//
void setup()
{
 pinMode(pwm_pin, OUTPUT);                    //set pin 9 as output
 Serial.begin(9600);                          //set baudrate as 9600

 for(unsigned short idx = 0; idx<=124; idx++)   //run loop 125 times
 {
  pwm_on[idx] = (steps_up);                     //store increment delay times into first half of array pwm_on 
  steps_up += 10.4;                               //increment by 10us 
 }

 
 for(unsigned short idx = 125; idx<=249; idx++) //run loop 124 times
 {
  pwm_on[idx] = (steps_down);                   //store decrement delay times into second half of array pwm_on
  steps_down -= 9.6;                             //decrement by 10us
 }
}

//------main loop -- infinite loop------//
void loop ()  
{
  PWM();                                        //call function PWM();
}

//--------------------------------end of programme----------------------------------------//


//-----PWM function, sends pwm signals for one complete cycle 0 to 180 and back to 0
void PWM (void)
{
  unsigned int pwm_off = 0;                               //variable type integer, holds value for low signal
  for(unsigned short idx = 0; idx<=249; idx++)            //run loop 250 times
  {
    pwm_off = (20000 - pwm_on[idx]);                      //calculate time delay for low signal, formula: low signal time = period - high signal time
    digitalWrite(pwm_pin, HIGH);                          //set pin 9 high 
    delayMicroseconds(pwm_on[idx]);                       //keep in loop for given time delay in us
    digitalWrite(pwm_pin, LOW);                           //set pin 9 low
    delayMicroseconds(pwm_off);                           //keep in loop for given time delay in us
       
//    //-----debugger---- sends values to serial so that we can see what is going on------//
//    Serial.println(pwm_on[idx]);
//    Serial.println("\t");
//    Serial.println(pwm_off);
  }
 }
***

<br><br>

### Step 2 – Control the servo with a potentiometer
**Wire the provided potentiometer to one of the Arduino analog port. Write a program that reads the value of the potentiometer and writes it onto the serial port. Use the potentiometer to rotate the servo-motor**

		Wire up connections
*components*
Arduino UNO
Potentiometer
Servo
Jumper wires  

![servo_pot_connections]()
source: [www.electroschematics.com](http://www.electroschematics.com/wp-content/uploads/2015/03/arduino-servo.jpg)

		Arduino code
This code is written for 2 servos controlled by 2 potentiometers connected to arduino uno

***c

//---Pin assignments to names---//
#define pot_pinL 5        //for left potentiometer
#define pwm_pinL 9        //for left PWM
#define pot_pinR 4        //for right potentiometer
#define pwm_pinR 10       //for right PWM

#define pot_sens 20       //change to adjust sensitivity of potentiometers

//Global variable declaration

//LEFT
int voltL = 0; 
float potL=0;
int rem_periodL = 0;
int state_checkerL = 0;

//RIGHT
int voltR = 0; 
float potR=0;
int rem_periodR = 0;
int state_checkerR = 0;

//-----setup -- not looped------//
void setup()
{
 pinMode(pwm_pinL, OUTPUT); //set PWM left motor pin as output
 pinMode(pot_pinL, INPUT);  //set left potentiometer pin as input
 pinMode(pwm_pinR, OUTPUT); //set PWM right motor pin as output
 pinMode(pot_pinR, INPUT);  //set right potentiometer pin as input
 Serial.begin(9600);        //set baudrate
}

//------main loop -- infinite loop------//
void loop ()
{
 pot_servo_control();       //call function pot_servo_control()
}

//---------END OF PROGRAME---------//


void pot_servo_control(void)
{ 
   
   //-----------------------------------------------------Left Servo

   //checks the current value of RIGHT potentiometer against
   //the last value and keeps in loop until change occurs. pot_sens allows room for switch bounce
   while(state_checkerR <= analogRead(pot_pinR)+pot_sens && state_checkerR >= analogRead(pot_pinR)-pot_sens)
   {   
     voltL = analogRead(pot_pinL);      //assign potentiometer value to voltL = 0 to 1024 (10-bit ADC)
     potL = ((voltL/512.00)*1000)+511;  //calculate high pulse width in microseconds, values between 511 to 2511
     digitalWrite(pwm_pinL, HIGH);      //set pwm pin high
     delayMicroseconds(potL);           //set time delay for calculated value held in potL 
     digitalWrite(pwm_pinL, LOW);       //set pwm pin low
     rem_periodL = 2000-potL;           //calculate pwm pin low time delay
     delayMicroseconds(rem_periodL);    //set time delay for calculated value held in rem_periodL

      //debugger
//     Serial.print("MOVING left----------");
//     Serial.print(potL);
//     Serial.print("\t");
//     Serial.print(rem_periodL);
//     Serial.print("--left\r\n");
         
     state_checkerL=analogRead(pot_pinL);   //assign potentiometer value to state checker
     state_checkerR=analogRead(pot_pinR);   //assign potentiometer value to state checker

     //checks LEFT AND RIGHT potentiometer values and keeps in loop until change occurs
     while((state_checkerL <= analogRead(pot_pinL)+pot_sens && state_checkerL >= analogRead(pot_pinL)-pot_sens) 
       && (state_checkerR <= analogRead(pot_pinR)+pot_sens && state_checkerR >= analogRead(pot_pinR)-pot_sens))
     { 
       //Debugger
//       Serial.print("HOLDING left----------");
//       Serial.print(state_checkerL);
//       Serial.print("\t");
//       Serial.print(analogRead(pot_pinL));
//       Serial.print("--left\r\n");
     }
  
   }
   

    //---------------------------------------------------Right Servo

  state_checkerL=analogRead(pot_pinL); //assign potentiometer value for the left potentiometer to state_chekerL
  
   //checks the current value of LEFT potentiometer against
   //the last value and keeps in loop until change occurs. pot_sens allows room for switch bounce
  while(state_checkerL <= analogRead(pot_pinL)+pot_sens && state_checkerL >= analogRead(pot_pinL)-pot_sens)     
  {   
     voltR = analogRead(pot_pinR);            //assign potentiometer value to voltR = 0 to 1024 (10-bit ADC)
     potR = ((voltR/512.00)*1000)+511;        //calculate high pulse width in microseconds, values between 511 to 2511
     digitalWrite(pwm_pinR, HIGH);            //set pwm pin high
     delayMicroseconds(potR);                 //set time delay for calculated value held in potR
     digitalWrite(pwm_pinR, LOW);             //set pwm pin low
     rem_periodR = 2000-potR;                 //calculate pwm pin low time delay
     delayMicroseconds(rem_periodR);          //set time delay for calculated value held in rem_periodR

     //Debugger
//     Serial.print("MOVING right----------");
//     Serial.print(potR);
//     Serial.print("\t");
//     Serial.print(rem_periodR);
//     Serial.print("--right\r\n");

     state_checkerL=analogRead(pot_pinL);    //assign potentiometer value to state checker
     state_checkerR=analogRead(pot_pinR);    //assign potentiometer value to state checker

      //checks LEFT AND RIGHT potentiometer values and keeps in loop until change occurs
     while((state_checkerL <= analogRead(pot_pinL)+pot_sens && state_checkerL >= analogRead(pot_pinL)-pot_sens) 
        && (state_checkerR <= analogRead(pot_pinR)+pot_sens && state_checkerR >= analogRead(pot_pinR)-pot_sens))
     { 
        //debugger
//       Serial.print("HOLDING right----------");
//       Serial.print(state_checkerR);
//       Serial.print("\t");
//       Serial.print(analogRead(pot_pinR));
//       Serial.print("--right\r\n");   
     }  
  }
  
  state_checkerR=analogRead(pot_pinR);  //assign potentiometer value for the right potentiometer to state_chekerR

   //----reset variables back to zero----\\
   potL=0;
   rem_periodL=0;
   potR=0;
   rem_periodR=0;
}

***

		Video clip
[![](pic)](video)

<br><br>

### Step 3 – A robot arm mock-up


<br><br><br>

		Lab7 Robotic Arm Mini-project
[Lab7 Robotic Arm Mini-project Part 2 – ROS](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab7%20Robotic%20Arm%20Mini-project%0APart%202%20%E2%80%93%20ROS.md)

For links to other labs please see the Index on top.



  


 
