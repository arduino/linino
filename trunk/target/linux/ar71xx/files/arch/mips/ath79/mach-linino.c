/*
 *  Linino board support
 *
 *  Copyright (C) 2011-2012 Gabor Juhos <juhosg@openwrt.org>
 *
 *  This program is free software; you can redistribute it and/or modify it
 *  under the terms of the GNU General Public License version 2 as published
 *  by the Free Software Foundation.
 */

#include "dev-eth.h"
#include "dev-gpio-buttons.h"
#include "dev-leds-gpio.h"
#include "dev-m25p80.h"
#include "dev-spi.h"
#include "dev-usb.h"
#include "dev-wmac.h"
#include "machtypes.h"
#include <asm/mach-ath79/ar71xx_regs.h>
#include <asm/mach-ath79/ath79.h>
#include "common.h"
#include "gpio.h"
#include "linux/gpio.h"

#define AP121_GPIO_LED_WLAN		0
#define AP121_GPIO_LED_USB		1

#define LININO_GPIO_OE			21
#define LININO_GPIO_OE2			23

#define AP121_KEYS_POLL_INTERVAL	20	/* msecs */
#define AP121_KEYS_DEBOUNCE_INTERVAL	(3 * AP121_KEYS_POLL_INTERVAL)

#define AP121_MAC0_OFFSET		0x0000
#define AP121_MAC1_OFFSET		0x0006
#define AP121_CALDATA_OFFSET		0x1000
#define AP121_WMAC_MAC_OFFSET		0x1002

#define AP121_MINI_GPIO_LED_WLAN	0

static struct gpio_led ap121_leds_gpio[] __initdata = {
	{
		.name		= "ap121:green:usb",
		.gpio		= AP121_GPIO_LED_USB,
		.active_low	= 0,
	},
	{
		.name		= "ap121:green:wlan",
		.gpio		= AP121_GPIO_LED_WLAN,
		.active_low	= 0,
	},
};

static struct gpio_keys_button ap121_gpio_keys[] __initdata = {
/*	{
		.desc		= "jumpstart button",
		.type		= EV_KEY,
		.code		= KEY_WPS_BUTTON,
		.debounce_interval = AP121_KEYS_DEBOUNCE_INTERVAL,
		.gpio		= AP121_GPIO_BTN_JUMPSTART,
		.active_low	= 1,
	},
	{
		.desc		= "reset button",
		.type		= EV_KEY,
		.code		= KEY_RESTART,
		.debounce_interval = AP121_KEYS_DEBOUNCE_INTERVAL,
		.gpio		= AP121_GPIO_BTN_RESET,
		.active_low	= 1,
	}
*/
};

static struct gpio_led ap121_mini_leds_gpio[] __initdata = {
	{
		.name		= "ap121:green:wlan",
		.gpio		= AP121_MINI_GPIO_LED_WLAN,
		.active_low	= 0,
	},
};

static struct gpio_keys_button ap121_mini_gpio_keys[] __initdata = {
/*	{
		.desc		= "jumpstart button",
		.type		= EV_KEY,
		.code		= KEY_WPS_BUTTON,
		.debounce_interval = AP121_KEYS_DEBOUNCE_INTERVAL,
		.gpio		= AP121_MINI_GPIO_BTN_JUMPSTART,
		.active_low	= 1,
	},
	{
		.desc		= "reset button",
		.type		= EV_KEY,
		.code		= KEY_RESTART,
		.debounce_interval = AP121_KEYS_DEBOUNCE_INTERVAL,
		.gpio		= AP121_MINI_GPIO_BTN_RESET,
		.active_low	= 1,
	}
*/
};

static void __init ap121_common_setup(void)
{
	u8 *art = (u8 *) KSEG1ADDR(0x1fff0000);

	ath79_register_m25p80(NULL);
	ath79_register_wmac(art + AP121_CALDATA_OFFSET,
			    art + AP121_WMAC_MAC_OFFSET);

	ath79_init_mac(ath79_eth0_data.mac_addr, art + AP121_MAC0_OFFSET, 0);
	ath79_init_mac(ath79_eth1_data.mac_addr, art + AP121_MAC1_OFFSET, 0);

	ath79_register_mdio(0, 0x0);

	/* LAN ports */
	ath79_register_eth(1);

	/* WAN port */
	ath79_register_eth(0);
}

static void __init ap121_setup(void)
{
	u32 t;

	ap121_common_setup();

	ath79_register_leds_gpio(-1, ARRAY_SIZE(ap121_leds_gpio),
				 ap121_leds_gpio);
	ath79_register_gpio_keys_polled(-1, AP121_KEYS_POLL_INTERVAL,
					ARRAY_SIZE(ap121_gpio_keys),
					ap121_gpio_keys);
	ath79_register_usb();

	//Disable the Function for some pins to have GPIO functionality active
	ath79_gpio_function_setup(AR933X_GPIO_FUNC_JTAG_DISABLE | AR933X_GPIO_FUNC_I2S_MCK_EN, 0);

	ath79_gpio_function2_setup(AR933X_GPIO_FUNC2_JUMPSTART_DISABLE, 0);

	printk("Setting Linino GPIO\n");
	t = ath79_reset_rr(AR933X_RESET_REG_BOOTSTRAP);
	t |= AR933X_BOOTSTRAP_MDIO_GPIO_EN;
	ath79_reset_wr(AR933X_RESET_REG_BOOTSTRAP, t);

	// enable OE of level shifter
	if (gpio_request_one(LININO_GPIO_OE,
		 GPIOF_OUT_INIT_HIGH | GPIOF_EXPORT_DIR_FIXED,
		 "OE-1") != 0)
		printk("Error setting GPIO OE\n");


	if (gpio_request_one(LININO_GPIO_OE2,
		 GPIOF_OUT_INIT_HIGH | GPIOF_EXPORT_DIR_FIXED,
		 "OE-2") != 0)
		printk("Error setting GPIO OE2\n");
}

MIPS_MACHINE(ATH79_MACH_Linino, "Linino", "Linino reference board",
	     ap121_setup);

static void __init ap121_mini_setup(void)
{
	ap121_common_setup();

	ath79_register_leds_gpio(-1, ARRAY_SIZE(ap121_mini_leds_gpio),
				 ap121_mini_leds_gpio);
	ath79_register_gpio_keys_polled(-1, AP121_KEYS_POLL_INTERVAL,
					ARRAY_SIZE(ap121_mini_gpio_keys),
					ap121_mini_gpio_keys);
}

MIPS_MACHINE(ATH79_MACH_AP121_MINI, "AP121-MINI", "Atheros AP121-MINI",
	     ap121_mini_setup);
