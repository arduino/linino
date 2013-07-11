#!/bin/sh
# (c)  Copyright 2013 dog hunter, LLC - All righs reserved  
# GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
# Domenico La Fauci
# Federico Musto

echo "Programming YUN console on ATMEL 32U4 firmware..."

echo 1 > /sys/class/gpio/gpio21/value

[ -e /etc/linino/YunSerialTerminal.hex ] 

avrdude -c linuxgpio -v -C /etc/avrdude.conf -p m32u4 -U lfuse:w:0xFF:m -U hfuse:w:0xD8:m -U efuse:w:0xFB:m -U flash:w:/etc/linino/YunSerialTerminal.hex

echo 0 > /sys/class/gpio/gpio21/value
