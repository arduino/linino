/*
 *   Microcontroller Message Bus
 *   Linux kernel driver
 *
 *   Copyright (c) 2009-2010 Michael Buesch <mb@bu3sch.de>
 *
 *   This program is free software; you can redistribute it and/or
 *   modify it under the terms of the GNU General Public License
 *   as published by the Free Software Foundation; either version 2
 *   of the License, or (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 */

#include "ucmb.h"

#include <linux/version.h>
#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/miscdevice.h>
#include <linux/fs.h>
#include <linux/spi/spi.h>
#include <linux/spi/spi_gpio.h>
#include <linux/spi/spi_bitbang.h>
#include <linux/gpio.h>
#include <linux/gfp.h>
#include <linux/delay.h>
#include <linux/crc16.h>
#include <linux/sched.h>

#include <asm/uaccess.h>


#define PFX	"ucmb: "

#undef DEBUG


MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Microcontroller Message Bus");
MODULE_AUTHOR("Michael Buesch");


struct ucmb {
	struct mutex mutex;

	bool is_open;

	unsigned int chunk_size;
	unsigned int msg_delay_usec;
	unsigned int gpio_reset;
	bool reset_activelow;

	/* Misc character device driver */
	struct miscdevice mdev;
	struct file_operations mdev_fops;

	/* SPI driver */
	struct spi_device *sdev;

	/* SPI-GPIO driver */
	struct spi_gpio_platform_data spi_gpio_pdata;
	struct platform_device spi_gpio_pdev;
};

#define UCMB_MAX_MSG_DELAY	(10 * 1000 * 1000) /* 10 seconds */


struct ucmb_message_hdr {
	__le16 magic;		/* UCMB_MAGIC */
	__le16 len;		/* Payload length (excluding header and footer) */
} __attribute__((packed));

struct ucmb_message_footer {
	__le16 crc;		/* CRC of the header + payload. */
} __attribute__((packed));

struct ucmb_status {
	__le16 magic;		/* UCMB_MAGIC */
	__le16 code;		/* enum ucmb_status_code */
} __attribute__((packed));

#define UCMB_MAGIC		0x1337

enum ucmb_status_code {
	UCMB_STAT_OK = 0,
	UCMB_STAT_EPROTO,	/* Protocol format error */
	UCMB_STAT_ENOMEM,	/* Out of memory */
	UCMB_STAT_E2BIG,	/* Message too big */
	UCMB_STAT_ECRC,		/* CRC error */
};


static int ucmb_spi_busnum_count = 1337;
static int ucmb_pdev_id_count;


static int __devinit ucmb_spi_probe(struct spi_device *sdev)
{
	return 0;
}

static int __devexit ucmb_spi_remove(struct spi_device *sdev)
{
	return 0;
}

static struct spi_driver ucmb_spi_driver = {
	.driver		= {
		.name	= "ucmb",
		.bus	= &spi_bus_type,
		.owner	= THIS_MODULE,
	},
	.probe		= ucmb_spi_probe,
	.remove		= __devexit_p(ucmb_spi_remove),
};

static void ucmb_toggle_reset_line(struct ucmb *ucmb, bool active)
{
	if (ucmb->reset_activelow)
		active = !active;
	gpio_set_value(ucmb->gpio_reset, active);
}

static int ucmb_reset_microcontroller(struct ucmb *ucmb)
{
	if (ucmb->gpio_reset == UCMB_NO_RESET)
		return -ENODEV;

	ucmb_toggle_reset_line(ucmb, 1);
	msleep(50);
	ucmb_toggle_reset_line(ucmb, 0);
	msleep(50);

	return 0;
}

static int ucmb_status_code_to_errno(enum ucmb_status_code code)
{
	switch (code) {
	case UCMB_STAT_OK:
		return 0;
	case UCMB_STAT_EPROTO:
		return -EPROTO;
	case UCMB_STAT_ENOMEM:
		return -ENOMEM;
	case UCMB_STAT_E2BIG:
		return -E2BIG;
	case UCMB_STAT_ECRC:
		return -EBADMSG;
	}
	return -EBUSY;
}

static inline struct ucmb * filp_to_ucmb(struct file *filp)
{
	return container_of(filp->f_op, struct ucmb, mdev_fops);
}

static int ucmb_open(struct inode *inode, struct file *filp)
{
	struct ucmb *ucmb = filp_to_ucmb(filp);
	int err = 0;

	mutex_lock(&ucmb->mutex);

	if (ucmb->is_open) {
		err = -EBUSY;
		goto out_unlock;
	}
	ucmb->is_open = 1;
	ucmb->msg_delay_usec = 0;

out_unlock:
	mutex_unlock(&ucmb->mutex);

	return err;
}

static int ucmb_release(struct inode *inode, struct file *filp)
{
	struct ucmb *ucmb = filp_to_ucmb(filp);

	mutex_lock(&ucmb->mutex);
	WARN_ON(!ucmb->is_open);
	ucmb->is_open = 0;
	mutex_unlock(&ucmb->mutex);

	return 0;
}

#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,36)
static long ucmb_ioctl(struct file *filp,
		       unsigned int cmd, unsigned long arg)
#else
static int ucmb_ioctl(struct inode *inode, struct file *filp,
		      unsigned int cmd, unsigned long arg)
#endif
{
	struct ucmb *ucmb = filp_to_ucmb(filp);
	int ret = 0;

	mutex_lock(&ucmb->mutex);
	switch (cmd) {
	case UCMB_IOCTL_RESETUC:
		ret = ucmb_reset_microcontroller(ucmb);
		break;
	case UCMB_IOCTL_GMSGDELAY:
		if (put_user(ucmb->msg_delay_usec, (unsigned int __user *)arg)) {
			ret = -EFAULT;
			break;
		}
		break;
	case UCMB_IOCTL_SMSGDELAY: {
		unsigned int msg_delay_usec;

		if (get_user(msg_delay_usec, (unsigned int __user *)arg)) {
			ret = -EFAULT;
			break;
		}
		if (msg_delay_usec > UCMB_MAX_MSG_DELAY) {
			ret = -E2BIG;
			break;
		}
		ucmb->msg_delay_usec = msg_delay_usec;
		break;
	}
	default:
		ret = -EINVAL;
	}
	mutex_unlock(&ucmb->mutex);

	return ret;
}

static int ucmb_spi_write(struct ucmb *ucmb, const void *_buf, size_t size)
{
	const u8 *buf = _buf;
	size_t i, chunk_size, current_size;
	int err = 0;

	chunk_size = ucmb->chunk_size ? : size;
	for (i = 0; i < size; i += chunk_size) {
		current_size = chunk_size;
		if (i + current_size > size)
			current_size = size - i;
		err = spi_write(ucmb->sdev, buf + i, current_size);
		if (err)
			goto out;
		if (ucmb->chunk_size && need_resched())
			msleep(1);
	}
out:
	return err;
}

static int ucmb_spi_read(struct ucmb *ucmb, void *_buf, size_t size)
{
	u8 *buf = _buf;
	size_t i, chunk_size, current_size;
	int err = 0;

	chunk_size = ucmb->chunk_size ? : size;
	for (i = 0; i < size; i += chunk_size) {
		current_size = chunk_size;
		if (i + current_size > size)
			current_size = size - i;
		err = spi_read(ucmb->sdev, buf + i, current_size);
		if (err)
			goto out;
		if (ucmb->chunk_size && need_resched())
			msleep(1);
	}
out:
	return err;
}

static ssize_t ucmb_read(struct file *filp, char __user *user_buf,
			 size_t size, loff_t *offp)
{
	struct ucmb *ucmb = filp_to_ucmb(filp);
	u8 *buf;
	int res, err;
	struct ucmb_message_hdr hdr;
	struct ucmb_message_footer footer;
	struct ucmb_status status = { .magic = cpu_to_le16(UCMB_MAGIC), };
	u16 crc = 0xFFFF;

	mutex_lock(&ucmb->mutex);

	size = min_t(size_t, size, PAGE_SIZE);

	err = -ENOMEM;
	buf = (char *)__get_free_page(GFP_KERNEL);
	if (!buf)
		goto out;

	err = ucmb_spi_read(ucmb, &hdr, sizeof(hdr));
	if (err)
		goto out_free;
#ifdef DEBUG
	printk(KERN_DEBUG PFX "Received message header 0x%04X 0x%04X\n",
	       le16_to_cpu(hdr.magic), le16_to_cpu(hdr.len));
#endif
	err = -EPROTO;
	if (hdr.magic != cpu_to_le16(UCMB_MAGIC))
		goto out_free;
	err = -ENOBUFS;
	if (size < le16_to_cpu(hdr.len))
		goto out_free;
	size = le16_to_cpu(hdr.len);
	err = ucmb_spi_read(ucmb, buf, size);
	if (err)
		goto out_free;
	err = ucmb_spi_read(ucmb, &footer, sizeof(footer));
	if (err)
		goto out_free;

	crc = crc16(crc, (u8 *)&hdr, sizeof(hdr));
	crc = crc16(crc, buf, size);
	crc ^= 0xFFFF;
	if (crc != le16_to_cpu(footer.crc)) {
		err = -EPROTO;
		status.code = UCMB_STAT_ECRC;
		goto out_send_status;
	}

	if (copy_to_user(user_buf, buf, size)) {
		err = -EFAULT;
		status.code = UCMB_STAT_ENOMEM;
		goto out_send_status;
	}

	status.code = UCMB_STAT_OK;
	err = 0;

out_send_status:
	res = ucmb_spi_write(ucmb, &status, sizeof(status));
	if (res && !err)
		err = res;
out_free:
	free_page((unsigned long)buf);
out:
	mutex_unlock(&ucmb->mutex);

	return err ? err : size;
}

static ssize_t ucmb_write(struct file *filp, const char __user *user_buf,
			  size_t size, loff_t *offp)
{
	struct ucmb *ucmb = filp_to_ucmb(filp);
	u8 *buf;
	int err;
	struct ucmb_message_hdr hdr = { .magic = cpu_to_le16(UCMB_MAGIC), };
	struct ucmb_message_footer footer = { .crc = 0xFFFF, };
	struct ucmb_status status;

	mutex_lock(&ucmb->mutex);

	err = -ENOMEM;
	buf = (char *)__get_free_page(GFP_KERNEL);
	if (!buf)
		goto out;

	size = min_t(size_t, PAGE_SIZE, size);
	err = -EFAULT;
	if (copy_from_user(buf, user_buf, size))
		goto out_free;
	hdr.len = cpu_to_le16(size);

	footer.crc = crc16(footer.crc, (u8 *)&hdr, sizeof(hdr));
	footer.crc = crc16(footer.crc, buf, size);
	footer.crc ^= 0xFFFF;

	err = ucmb_spi_write(ucmb, &hdr, sizeof(hdr));
	if (err)
		goto out_free;
	err = ucmb_spi_write(ucmb, buf, size);
	if (err)
		goto out_free;
	err = ucmb_spi_write(ucmb, &footer, sizeof(footer));
	if (err)
		goto out_free;

	if (ucmb->msg_delay_usec) {
		/* The microcontroller deserves some time to process the message. */
		if (ucmb->msg_delay_usec >= 1000000) {
			ssleep(ucmb->msg_delay_usec / 1000000);
			msleep(DIV_ROUND_UP(ucmb->msg_delay_usec % 1000000, 1000));
		} else if (ucmb->msg_delay_usec >= 1000) {
			msleep(DIV_ROUND_UP(ucmb->msg_delay_usec, 1000));
		} else
			udelay(ucmb->msg_delay_usec);
	}

	/* Get the status code. */
	err = ucmb_spi_read(ucmb, &status, sizeof(status));
	if (err)
		goto out_free;
#ifdef DEBUG
	printk(KERN_DEBUG PFX "Sent message. Status report: 0x%04X 0x%04X\n",
	       le16_to_cpu(status.magic), le16_to_cpu(status.code));
#endif
	err = -EPROTO;
	if (status.magic != cpu_to_le16(UCMB_MAGIC))
		goto out_free;
	err = ucmb_status_code_to_errno(le16_to_cpu(status.code));
	if (err)
		goto out_free;

out_free:
	free_page((unsigned long)buf);
out:
	mutex_unlock(&ucmb->mutex);

	return err ? err : size;
}

static int __devinit ucmb_probe(struct platform_device *pdev)
{
	struct ucmb_platform_data *pdata;
	struct ucmb *ucmb;
	int err;
	const int bus_num = ucmb_spi_busnum_count++;
	struct spi_bitbang *bb;

	pdata = pdev->dev.platform_data;
	if (!pdata)
		return -ENXIO;

	ucmb = kzalloc(sizeof(struct ucmb), GFP_KERNEL);
	if (!ucmb)
		return -ENOMEM;
	mutex_init(&ucmb->mutex);
	ucmb->gpio_reset = pdata->gpio_reset;
	ucmb->reset_activelow = pdata->reset_activelow;
	ucmb->chunk_size = pdata->chunk_size;

#ifdef CONFIG_PREEMPT
	/* A preemptible kernel does not need to sleep between
	 * chunks, because it can sleep at desire (if IRQs are enabled).
	 * So transmit/receive it all in one go. */
	ucmb->chunk_size = 0;
#endif

	/* Create the SPI GPIO bus master. */

#ifdef CONFIG_SPI_GPIO_MODULE
	err = request_module("spi_gpio");
	if (err)
		printk(KERN_WARNING PFX "Failed to request spi_gpio module\n");
#endif /* CONFIG_SPI_GPIO_MODULE */

	ucmb->spi_gpio_pdata.sck = pdata->gpio_sck;
	ucmb->spi_gpio_pdata.mosi = pdata->gpio_mosi;
	ucmb->spi_gpio_pdata.miso = pdata->gpio_miso;
	ucmb->spi_gpio_pdata.num_chipselect = 1;

	ucmb->spi_gpio_pdev.name = "spi_gpio";
	ucmb->spi_gpio_pdev.id = bus_num;
	ucmb->spi_gpio_pdev.dev.platform_data = &ucmb->spi_gpio_pdata;

	err = platform_device_register(&ucmb->spi_gpio_pdev);
	if (err) {
		printk(KERN_ERR PFX "Failed to register SPI-GPIO platform device\n");
		goto err_free_ucmb;
	}
	bb = platform_get_drvdata(&ucmb->spi_gpio_pdev);
	if (!bb || !bb->master) {
		printk(KERN_ERR PFX "No bitbanged master device found.\n");
		goto err_unreg_spi_gpio_pdev;
	}

	/* Create the SPI device. */

	ucmb->sdev = spi_alloc_device(bb->master);
	if (!ucmb->sdev) {
		printk(KERN_ERR PFX "Failed to allocate SPI device\n");
		goto err_unreg_spi_gpio_pdev;
	}
	ucmb->sdev->max_speed_hz = pdata->max_speed_hz;
	ucmb->sdev->chip_select = 0;
	ucmb->sdev->mode = pdata->mode;
	strlcpy(ucmb->sdev->modalias, "ucmb", /* We are the SPI driver. */
		sizeof(ucmb->sdev->modalias));
	ucmb->sdev->controller_data = (void *)pdata->gpio_cs;
	err = spi_add_device(ucmb->sdev);
	if (err) {
		printk(KERN_ERR PFX "Failed to add SPI device\n");
		goto err_free_spi_device;
	}

	/* Initialize the RESET line. */

	if (pdata->gpio_reset != UCMB_NO_RESET) {
		err = gpio_request(pdata->gpio_reset, pdata->name);
		if (err) {
			printk(KERN_ERR PFX
			       "Failed to request RESET GPIO line\n");
			goto err_unreg_spi_device;
		}
		err = gpio_direction_output(pdata->gpio_reset,
					    pdata->reset_activelow);
		if (err) {
			printk(KERN_ERR PFX
			       "Failed to set RESET GPIO direction\n");
			goto err_free_reset_gpio;
		}
		ucmb_reset_microcontroller(ucmb);
	}

	/* Create the Misc char device. */

	ucmb->mdev.minor = MISC_DYNAMIC_MINOR;
	ucmb->mdev.name = pdata->name;
	ucmb->mdev.parent = &pdev->dev;
	ucmb->mdev_fops.open = ucmb_open;
	ucmb->mdev_fops.release = ucmb_release;
	ucmb->mdev_fops.read = ucmb_read;
	ucmb->mdev_fops.write = ucmb_write;
#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,36)
	ucmb->mdev_fops.unlocked_ioctl = ucmb_ioctl;
#else
	ucmb->mdev_fops.ioctl = ucmb_ioctl;
#endif
	ucmb->mdev.fops = &ucmb->mdev_fops;

	err = misc_register(&ucmb->mdev);
	if (err) {
		printk(KERN_ERR PFX "Failed to register miscdev %s\n",
		       ucmb->mdev.name);
		goto err_free_reset_gpio;
	}

	platform_set_drvdata(pdev, ucmb);

	printk(KERN_INFO PFX "Registered message bus \"%s\"\n", pdata->name);

	return 0;

err_free_reset_gpio:
	if (pdata->gpio_reset != UCMB_NO_RESET)
		gpio_free(pdata->gpio_reset);
err_unreg_spi_device:
	spi_unregister_device(ucmb->sdev);
err_free_spi_device:
	spi_dev_put(ucmb->sdev);
err_unreg_spi_gpio_pdev:
	platform_device_unregister(&ucmb->spi_gpio_pdev);
err_free_ucmb:
	kfree(ucmb);

	return err;
}

static int __devexit ucmb_remove(struct platform_device *pdev)
{
	struct ucmb *ucmb = platform_get_drvdata(pdev);
	int err;

	err = misc_deregister(&ucmb->mdev);
	if (err) {
		printk(KERN_ERR PFX "Failed to unregister miscdev %s\n",
		       ucmb->mdev.name);
	}
	if (ucmb->gpio_reset != UCMB_NO_RESET)
		gpio_free(ucmb->gpio_reset);
	spi_unregister_device(ucmb->sdev);
	spi_dev_put(ucmb->sdev);
	platform_device_unregister(&ucmb->spi_gpio_pdev);

	kfree(ucmb);
	platform_set_drvdata(pdev, NULL);

	return 0;
}

static struct platform_driver ucmb_driver = {
	.driver		= {
		.name	= "ucmb",
		.owner	= THIS_MODULE,
	},
	.probe		= ucmb_probe,
	.remove		= __devexit_p(ucmb_remove),
};

int ucmb_device_register(struct ucmb_platform_data *pdata)
{
	struct platform_device *pdev;
	int err;

	pdev = platform_device_alloc("ucmb", ucmb_pdev_id_count++);
	if (!pdev) {
		printk(KERN_ERR PFX "Failed to allocate platform device.\n");
		return -ENOMEM;
	}
	err = platform_device_add_data(pdev, pdata, sizeof(*pdata));
	if (err) {
		printk(KERN_ERR PFX "Failed to add platform data.\n");
		platform_device_put(pdev);
		return err;
	}
	err = platform_device_add(pdev);
	if (err) {
		printk(KERN_ERR PFX "Failed to register platform device.\n");
		platform_device_put(pdev);
		return err;
	}
	pdata->pdev = pdev;

	return 0;
}
EXPORT_SYMBOL(ucmb_device_register);

void ucmb_device_unregister(struct ucmb_platform_data *pdata)
{
	if (!pdata->pdev)
		return;
	platform_device_unregister(pdata->pdev);
	platform_device_put(pdata->pdev);
	pdata->pdev = NULL;
}
EXPORT_SYMBOL(ucmb_device_unregister);

static int ucmb_modinit(void)
{
	int err;

	printk(KERN_INFO "Microcontroller message bus driver\n");

	err = spi_register_driver(&ucmb_spi_driver);
	if (err) {
		printk(KERN_ERR PFX "Failed to register SPI driver\n");
		return err;
	}
	err = platform_driver_register(&ucmb_driver);
	if (err) {
		printk(KERN_ERR PFX "Failed to register platform driver\n");
		spi_unregister_driver(&ucmb_spi_driver);
		return err;
	}

	return 0;
}
subsys_initcall(ucmb_modinit);

static void ucmb_modexit(void)
{
	platform_driver_unregister(&ucmb_driver);
	spi_unregister_driver(&ucmb_spi_driver);
}
module_exit(ucmb_modexit);
