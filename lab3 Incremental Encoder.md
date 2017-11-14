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
# 

Once we know how a phototransistor works rest is fairly simple. We fit the IR LED facing the phototransistor and keep the IR LED on. We then install the disc with a slot/gap on it, between the IR LED and the phototransistor to keep the the light from the IR LED shinning on to the phototransistor until the slot/gap in the disc is between the IR LED and the phototransistor. Every time we get a gap in the disc as it rotates the phototransistor turns on and we get a voltage (pulse) on the output of the phototransistor. 

_OPTICAL ENCODER_
<img src="https://github.com/Faisal-f-rehman/pics.vids/blob/master/encoder/optical%20encoder.png?raw=true" height="80%" width="80%"/>  
Image source: [Labsheet Lab3-Incremental encoder]
