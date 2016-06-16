# -*- coding: utf-8 -*-

import Adafruit_MAX31855.MAX31855 as MAX31855
import time
import sys

# Top (Left - closest to USB Ports)
CLKt = 19
CSt = 20
DOt = 25
sensorT = MAX31855.MAX31855(CLKt, CSt, DOt)

# Middle
CLKm = 22
CSm = 16
DOm = 24
sensorM = MAX31855.MAX31855(CLKm, CSm, DOm)

# Bottom (Right)
CLKb = 4
CSb = 17
DOb = 18
sensorB = MAX31855.MAX31855(CLKb, CSb, DOb)

# Bad pins for CLK: 16, 21, 6, 5, 13


# convert Celsius to Fahrenheit
def c_to_f(celsius):
    fahrenheit = celsius * 9.0 / 5 + 32
    return fahrenheit


# Loop printing measurements every second.
while True:
    tempT = sensorT.readTempC()
    internalT = sensorT.readInternalC()
    tempM = sensorM.readTempC()
    internalM = sensorM.readInternalC()
    CSV = '{0:0.3F}, {1:0.3F}, {2:0.3F}, {3:0.3F}'
    print CSV.format(tempT, internalT, tempM, internalM)

    # Force buffer to close and send all data to Node application
    sys.stdout.flush()
    # Check temperature every second
    time.sleep(1.0)
