# -*- coding: utf-8 -*-

import Adafruit_MAX31855.MAX31855 as MAX31855
import time
import sys

# Top (Left - closest to USB Ports)
CLKt = 19
CSt = 20
DOt = 25
sensorT = MAX31855.MAX31855(CLKt, CSt, DOt)


# convert Celsius to Fahrenheit
def c_to_f(celsius):
    fahrenheit = celsius * 9.0 / 5 + 32
    return fahrenheit


# Loop printing measurements every second.
while True:
    tempT = sensorT.readTempC()
    internalT = sensorT.readInternalC()
    CSV = '{0:0.3F}, {1:0.3F}'
    print CSV.format(tempT, internalT)

    # Force buffer to close and send all data to Node application
    sys.stdout.flush()
    # Check temperature every second
    time.sleep(1.0)
