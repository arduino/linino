#!/bin/sh

echo Programming console firmware...
echo 1 > /sys/class/gpio/gpio21/value
[ -e /etc/linino/Etheris_fw.hex ] {
	avrdude -c linuxgpio -v -C /etc/avrdude.conf -p m32u4 -U lfuse:w:0xFF:m -U hfuse:w:0xD8:m -U efuse:w:0xFB:m -U flash:w:/etc/linino/Etheris_fw.hex
}
echo 0 > /sys/class/gpio/gpio21/value
