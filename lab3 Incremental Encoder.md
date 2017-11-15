# **ROCO222 LAB-JOURNAL**

## **FAISAL FAZAL-UR-REHMAN** 



## **Index**

[Lab1 Software engineering for roboticists](https://github.com/Faisal-f-rehman/Roco222-labs/blob/master/lab1%20software%20engineering%20for%20roboticists.md)

[Lab2 Build a DC motor](https://github.com/Faisal-f-rehman/journal.md/blob/master/lab2%20dc%20motor.md)

[Lab4]()

[Lab5]()

[Lab6]()

# **Lab3 Incremental Encoder**

In this lab we are going to build an optical incremental encoder for our motor, so that we can read a pulse for every full rotation made by the motor. This is the most basic form of an encoder however it will allow us to measure the speed of our motor. 

### What we have to build the encoder and how it works

		Components used 
+ An Infra-red Led
+ A Phototransistor 
+ A disc with a slot/hole in it, can be made from a cardboard
+ 2 resistors (1Kohms and 10Kohms)
+ A prototyping board (Vero board)
+ Arduino UNO
+ Few jumper wires

		How it works


First of all we need to understand how a **phototransistor** works. When we pass current through an LED it emits light, this is also true in the reverse order i.e. if we shine light on to an LED it produces current and voltage, however this current and voltage produced by the LED is very weak and therefore we need a way to amplify this for it to be of any use to us. This is where the transistor comes in. In a phototransistor a reversed LED diode is connected with a transistor (Bipolar Junction Transistor, BJT) between the collector and the base, where the emitter junction of the BJT is connected to ground. The transistor works like a gate, when the led produces a small amount of voltage (BJT typical voltage required to turn on (Vbe)= 0.7V), it allows a larger amount of current provided to flow from the collector to the emitter. When the Led stops receiving any light source it stops producing any current which turns the transistor off and therefore current stops flowing through the collector junction to the emitter. Now if we take an output from the collector branch of the transistor we will get a larger current provided from an external power supply which is being controlled by a small amount of current produced by the led. i.e. its amplified.

_PHOTOTRANSISTOR EQUIVALENT CIRCUIT_  
![Phototransistor Equivalent](http://www.tpub.com/neets/book7/0174.GIF)
Image source: [www.tpub.com](http://www.tpub.com/neets/book7/26g.htm)  
  
<br><br>

Once we know how a phototransistor works rest is fairly simple. We fit the IR LED facing the phototransistor and keep the IR LED on. We then install the disc with a slot/gap on it, between the IR LED and the phototransistor to keep the the light from the IR LED shinning on to the phototransistor until the slot/gap in the disc is between the IR LED and the phototransistor. Every time we get a gap in the disc as it rotates the phototransistor turns on and we get a voltage (pulse) on the output of the phototransistor. 

_OPTICAL ENCODER_
<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/encoder/optical%20encoder.png?raw=true" height="40%" width="40%"/>  
Image source: Labsheet Lab3-Incremental encoder

<br><br>

We can take the output of the phototransistor and connect it to the Arduino and read it as a pulse. This pulse can then be counted with some fairly simple code in Arduino, and counting how many pulses we get in a minute will give us a rotational speed of the motor (Rotations per minute (RPM)).

# 


# Part 1 

### Building the encoder

## Circuit diagram

		Encoder Circuit Diagram
![Encoder Circuit diagram](https://github.com/Faisal-f-rehman/pics.vids/blob/master/encoder/Encoder%20Circuit%20diagram.png?raw=true)

Led Resistor can be calculated by the following formula

![-------------------](--------------)

We wired up the circuit on the Vero board however rather than a cardboard cut out, since we were 3D printing our DC motor for Lab 2, we decided to print the disc on the shaft and a holder for the IR LED and phototransistor on the frame.

		3D printed encoder disc		3D printed holder and motor frame
<img src="https://github.com/slperdomo-davies/Roco222--Lab-Journal/blob/master/media/3D_Printed_Encoder.JPG?raw=true" height="50%" width="50%"/><img src="https://github.com/slperdomo-davies/Roco222--Lab-Journal/blob/master/media/Second_design_Mount_Fitted_bearings.JPG?raw=true" height="50%" width="50%"/>

<br><br>
		Wired up Vero board		IR LED installed into the holder
<img src="https://github.com/slperdomo-davies/Roco222--Lab-Journal/blob/master/media/Encoder1.jpg?raw=true" height="50%" width="50%"/><img src="https://github.com/slperdomo-davies/Roco222--Lab-Journal/blob/master/media/Encoder2.jpg?raw=true" height="50%" width="50%"/>


<br><br>

# Part II

## Arduino
<br>

### Connecting the Arduino to the encoder

The connections required to connect the encoder to Arduino are surprisingly simple, only 3 wires needed:

+ Red	-	POWER 	(5V)
+ Black	-	Ground	(0V)
+ Blue/Yellow	-	PWM (PIN 2 - PWM Interrupt pin)

![Arduino Connections](https://github.com/Faisal-f-rehman/pics.vids/blob/master/encoder/Connecting%20Arduino.png?raw=true)

<br>

Code Templete provided in the labsheet makes the on board Arduino LED to change state (on to off and vice-versa) every time the light path of the LED to phototransistor is blocked by placing an object in the middle of the two and when the light shines on the phototransistor once the object has been removed.

		Code Provided in the labsheet
```C
const byte ledPin = 13;
const byte interruptPin = 2;
volatile byte state = LOW;

void setup()
{
	pinMode(ledPin, OUTPUT);
	pinMode(interruptPin, INPUT);

	// configure the interrupt call-back: blink is called everytime the pin
	// goes from low to high.
	attachInterrupt(digitalPinToInterrupt(interruptPin), blink, RISING);

}

void loop() 
{
	digitalWrite(ledPin, state);
}


void blink() 
{
	state = !state;
}

```

		Code explaination
```C
const byte ledPin = 13;			//Declare and assign a constant 4 bits variable ledPin to pin 13, onboard LED pin internally connected
const byte interruptPin = 2;		//Declare and assign a constant 4 bits variable interruptPin to pin 2, one of the two interrupt pins available by default
volatile byte state = LOW;		//Declare and assign a volatile 4 bits variable state to initialise LOW ie 0 or off, a volatile variable is manipulated and stored in the RAM rather than storage registers 

void setup()
{
	pinMode(ledPin, OUTPUT);	//set ledPin (pin 13) as output	
	pinMode(interruptPin, INPUT);	//set interruptPin (pin 2) as an input, to read from the encoder

	// configure the interrupt call-back: blink is called everytime the pin
	// goes from low to high.
	attachInterrupt(digitalPinToInterrupt(interruptPin), blink, RISING);

}

void loop() 
{
	digitalWrite(ledPin, state);	//set onboard LED to variable state ie LOW = off
}


void blink() 				//this function is called everytime the interrupt occurs(on a rising edge) ie on every pulse from the encoder
{
	state = !state;			//toggle current state (on to off and off to on)
}

```




  


 
