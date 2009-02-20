#ifndef LINUX_UCMB_H_
#define LINUX_UCMB_H_

#include <linux/types.h>
#include <linux/ioctl.h>


/* IOCTLs */
#define __UCMB_IOCTL		('U'|'C'|'M'|'B')

/** UCMB_IOCTL_RESETUC - Reset the microcontroller. */
#define UCMB_IOCTL_RESETUC	_IO(__UCMB_IOCTL, 0)


#ifdef __KERNEL__

/**
 * struct ucmb_platform_data - UCMB device descriptor
 *
 * @name:		The name of the device. This will also be the name of
 *			the misc char device.
 *
 * @gpio_cs:		The chipselect GPIO pin. Can be SPI_GPIO_NO_CHIPSELECT,
 *			if chipselect is not used.
 * @gpio_sck:		The clock GPIO pin.
 * @gpio_miso:		The master-in slave-out GPIO pin.
 * @gpio_mosi:		The master-out slave-in GPIO pin.
 *
 * @gpio_reset:		The GPIO pin to the microcontroller reset line.
 *			Can be UCMB_NO_RESET, if reset GPIO is not used.
 * @reset_activelow:	If true, @gpio_reset is considered to be active
 *			on logical 0 (inverted).
 *
 * @mode:		The SPI bus mode. SPI_MODE_*
 * @max_speed_hz:	The bus speed, in Hz. If zero the speed is not limited.
 * @msg_delay_ms:	The message delay time, in milliseconds.
 *			This is the time the microcontroller takes to process
 *			one message.
 */
struct ucmb_platform_data {
	const char *name;

	unsigned long gpio_cs;
	unsigned int gpio_sck;
	unsigned int gpio_miso;
	unsigned int gpio_mosi;

	unsigned int gpio_reset;
	bool reset_activelow;

	u8 mode;
	u32 max_speed_hz;
	unsigned int msg_delay_ms;

	struct platform_device *pdev; /* internal */
};

#define UCMB_NO_RESET		((unsigned int)-1)


#endif /* __KERNEL__ */
#endif /* LINUX_UCMB_H_ */
