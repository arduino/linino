#!/bin/sh
# (c)  Copyright 2013 dog hunter, LLC - All righs reserved  
# GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
# Domenico La Fauci
# Federico Musto

echo "Testing AVRDUDE on ATMEL 32U4 ..."

echo 1 > /sys/class/gpio/gpio21/value

avrdude -c linuxgpio -v -C /etc/avrdude.conf -p m32u4 -U lfuse:w:0xFF:m -U hfuse:w:0xD8:m -U efuse:w:0xFB:m 

echo 0 > /sys/class/gpio/gpio21/value

exit 0
