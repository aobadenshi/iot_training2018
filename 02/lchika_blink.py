#!/usr/bin/env python
# -*- coding: utf-8 -*-

import RPi.GPIO as GPIO
import time

pin = 17

try:
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(pin, GPIO.OUT)
    for x in xrange(3):
        GPIO.output(pin, True)
        time.sleep(0.3)
        GPIO.output(pin, False)
        time.sleep(0.3)
finally:
    GPIO.cleanup()
