#ifndef LINUX_UCMB_H_
#define LINUX_UCMB_H_

#include <linux/types.h>
#include <linux/ioctl.h>


/* IOCTLs */
#define __UCMB_IOCTL		('U'|'C'|'M'|'B')

/** UCMB_IOCTL_RESETUC - Reset the microcontroller. */
#define UCMB_IOCTL_RESETUC	_IO(__UCMB_IOCTL, 0)
/** UCMB_IOCTL_GMSGDELAY - Get the delay to wait before fetching the status. */
#define UCMB_IOCTL_GMSGDELAY	_IOR(__UCMB_IOCTL, 1, unsigned int)
/** UCMB_IOCTL_SMSGDELAY - Set the delay to wait before fetching the status. */
#define UCMB_IOCTL_SMSGDELAY	_IOW(__UCMB_IOCTL, 2, unsigned int)


#ifdef __KERNEL__

#include <linux/device.h>
#include <linux/spi/spi.h>
#include <linux/spi/spi_gpio.h>

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
 * @chunk_size:		The maximum chunk size to transmit/receive in one go
 *			without sleeping. The kernel will be allowed to sleep
 *			after each chunk.
 *			If set to 0, the whole data will be transmitted/received
 *			in one big rush without sleeping. Note that this might hurt
 *			system responsiveness, if the kernel is not preemptible.
 *			If CONFIG_PREEMPT is enabled, chunk_size will be forced to 0.
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
	unsigned int chunk_size;

	struct platform_device *pdev; /* internal */
};

#define UCMB_NO_RESET		((unsigned int)-1)

int ucmb_device_register(struct ucmb_platform_data *pdata);
void ucmb_device_unregister(struct ucmb_platform_data *pdata);


#endif /* __KERNEL__ */
#endif /* LINUX_UCMB_H_ */
