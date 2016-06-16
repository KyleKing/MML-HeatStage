# Syringe Pump Serial Port Control

## General Notes on Configuration

Connecting to the Harvard Syringe pumps is needlessly difficult because you will need a USB-R232 Cable. [The ones in lab don't appear to work?](http://www.miniinthebox.com/1m-3-28ft-usb2-0-male-to-rs232-male-cable-free-shipping_p1800337.html)

Connecting the the Chemyx Syringe pumps is easy and uses the same USB A cable used for connecting to an Arduino or printer.

### Baud Rate

Double check the baud rate of any pump. Most CHEMYX pumps should be configured to use the 9600 baud rate (along with most devices using serial port communication). If a faster baud rate is necessary, the setting can be configured in the settings menu. For the CHEMYX pumps, the second option is 32000.

### Software Advice

If you aren't using the pumpController.js module, you can easily work with the Chemyx pump using the Arduino IDE.

If you haven't already, download and use the Arduino software. It is cross platform and has a nice UI and is relatively robust. There are plenty of additional command line and GUI options, since all you need is a standard serial port for communication.

<!-- TODO Take photos of settings and quick Guide -->

**Note**: you must use a carriage return and not a new line for sending commands to the CHEMYX pump and likely similar pumps.

### Notation Used in This Guide

- <x-y> input a number from x-y (i.e. <1-4>)
- <x.x> must use a decimal point

## CHEMYX Syringe Pumps

In particular the Fusion 740, but this will likely be applicable to all CHEMYX pumps.

### Commands

```help``` - returns a list of documented commands for most needs

#### Movement Commands

---

```start       ```  - Pump Run

```stop        ```  - Pump Stop

```pause       ```  - Pump Pause

---

#### Setting Commands

---

```set diameter [x.x] ```  - Pump Set Diameter

```set rate [x.x]     ```  - Pump Set Rate

```set volume [x.x]   ```  - Pump Set Volume (+infuse,-withdraws)

```set delay [xxx]    ```  - Pump Set Delay

```set primerate [x.x]```  - Pump Set Priming rate

---

#### Status Commands

---

```read limit parameter```  - Pump Return Max/Min volume & Rate

```dispensed volume    ```  - Pump Return volume Dispensed

```elapsed time        ```  - Pump Return Time Elapsed

---

#### Additional Optional Command

---

```hexw2 [units] [mode] [diameter] [volume] [rate] [delay] ``` - Send All Settings

```hexw2 [units] [mode] [diameter] [volume] [rate] [delay] start ``` - Send All Settings and Starts

#### Undocumented commands

---

```view parameters``` - returns a space separated list of various parameters

```set units <x>``` - from the list of units, set which value should be set

### Settings

| Value | Units   |
| ----- |:-------:|
| 1     | ul/min  |
| 2     | ml/min  |
| 3     | ml/hr   |
| 4     | ml/hr   |


## Harvard PHD 1000

Pump...but not actually listed: https://www.harvardapparatus.com/webapp/wcs/stores/servlet/product_11051_10001_44006_-1_HAI_ProductDetail___#specificationstab


## Other Related projects:

** PUMPY: http://www.benmil.es/2015/06/09/flow/
Actual: https://github.com/tomwphillips/pumpy

** Support for CHEMyx:
https://github.com/pjb7687/single

Advice for python:http://robotics.stackexchange.com/questions/5079/communicating-with-syringe-pump-using-pyserial
and: http://stackoverflow.com/questions/33112780/serial-commands-for-braintree-scientific-inc-syringe-pump-model-bs-8000-rs23

Cool: http://www.mbedded.ninja/electronics/teardowns/cavro-xl3000-8-port-syringe-pump-teardown



https://forums.ni.com/t5/LabVIEW/Labview-Drivers-Chemyx-Syringe-Pump/m-p/1388794
and
http://www.hotfrog.com/business/chemyx/fusion-touch-syringe-pumps-555652
