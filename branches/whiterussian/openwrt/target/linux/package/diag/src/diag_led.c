/*
 * diag_led.c - replacement diag module
 *
 * Copyright (C) 2004-2006 Mike Baker,
 *                         Imre Kaloz <kaloz@dune.hu>,
 *                         Felix Fietkau <nbd@openwrt.org>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *
 * $Id: 005-diag_led.patch 4594 2006-08-18 13:10:19Z florian $
 */

/*
 * ChangeLog:
 * 2004/03/28 initial release 
 * 2004/08/26 asus & buffalo support added
 * 2005/03/14 asus wl-500g deluxe and buffalo v2 support added
 * 2005/04/13 added licensing informations
 * 2005/04/18 base reset polarity off initial readings
 * 2006/08/18 asus power led support added
 */

#include <linux/module.h>
#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/sysctl.h>
#include <asm/io.h>
#include <typedefs.h>
#include <bcmdevs.h>
#include <sbutils.h>

extern char * nvram_get(const char *name);
static void *sbh;

// v2.x - - - - -
#define BITS(n)			((1 << n) - 1)
#define ISSET(n,b)		((n & (1 << b)) ? 1 : 0)
#define DIAG_GPIO (1<<1)
#define AOSS_GPIO (1<<6)
#define DMZ_GPIO  (1<<7)
#define SES_GPIO  ((1 << 2) | (1 << 3) | (1 << 5))

static void set_gpio(uint32 mask, uint32 value) {
	sb_gpiocontrol(sbh,mask,0);
	sb_gpioouten(sbh,mask,mask);
	sb_gpioout(sbh,mask,value);
}

static void v2_set_diag(u8 state) {
	set_gpio(DIAG_GPIO,state);
}
static void v2_set_dmz(u8 state) {
	set_gpio(DMZ_GPIO,state);
}
static void v2_set_aoss(u8 state) {
	set_gpio(AOSS_GPIO,state);
}
static void v2_set_ses(u8 state) {
	set_gpio(SES_GPIO, (ISSET(state, 0) << 2) | (ISSET(state, 1) << 3) | (ISSET(state, 2) << 5));
}
// asus wl-500g (+deluxe)
#define WL500G_PWR_GPIO (1<<0)
// asus wl-500g premium
#define WL500GP_PWR_GPIO (1<<1)

static void wl500g_set_pwr(u8 state) {
	set_gpio(WL500G_PWR_GPIO,state);
}

static void wl500gp_set_pwr(u8 state) {
	set_gpio(WL500GP_PWR_GPIO,state);
}

// v1.x - - - - -
#define LED_DIAG   0x13
#define LED_DMZ    0x12

static void v1_set_diag(u8 state) {
	if (!state) {
		*(volatile u8*)(KSEG1ADDR(BCM4710_EUART)+LED_DIAG)=0xFF;
	} else {
		*(volatile u8*)(KSEG1ADDR(BCM4710_EUART)+LED_DIAG);
	}
}
static void v1_set_dmz(u8 state) {
	if (!state) {
		*(volatile u8*)(KSEG1ADDR(BCM4710_EUART)+LED_DMZ)=0xFF;
	} else {
		*(volatile u8*)(KSEG1ADDR(BCM4710_EUART)+LED_DMZ);
	}
}

// - - - - -
static void ignore(u8 ignored) {};

// - - - - -
#define BIT_DMZ         (1 << 0)
#define BIT_DIAG        (1 << 2)
#define BIT_SES         (BITS(3) << 3)
#define BIT_PWR		(1 << 1)

void (*set_diag)(u8 state);
void (*set_dmz)(u8 state);
void (*set_ses)(u8 state);
void (*set_pwr)(u8 state);

static unsigned int diag_reverse = 1;
static unsigned int ses_reverse = 1;
static unsigned int pwr_reverse = 1;
static unsigned int diag = BIT_PWR; // default: diag off, pwr on, dmz off

static void diag_change()
{
	set_diag(diag_reverse ? 0xFF : 0x00); // off
	set_dmz(diag_reverse ? 0xFF : 0x00); // off
	set_ses(ses_reverse ? 0xFF : 0x00); // off
	set_pwr(pwr_reverse ? 0xFF : 0x00); //off

	if(diag & BIT_DIAG)
		set_diag(diag_reverse ? 0x00 : 0xFF); // on
	if(diag & BIT_DMZ)
		set_dmz(diag_reverse ? 0x00 : 0xFF); // on
	if(diag & BIT_SES)
		set_ses(((ses_reverse ? ~diag : diag) >> 3) & BITS(3));
	if (diag & BIT_PWR)
		set_pwr(pwr_reverse ? 0x00 : 0xFF); // on
}

static int proc_diag(ctl_table *table, int write, struct file *filp,
		void *buffer, size_t *lenp)
{
	int r;
	r = proc_dointvec(table, write, filp, buffer, lenp);
	if (write && !r) {
		diag_change();
	}
	return r;
}

// - - - - -
static unsigned char reset_gpio = 0;
static unsigned char reset_polarity = 0;
static unsigned int reset = 0;
static unsigned char button_gpio = 0;
static unsigned char button_polarity = 0;
static unsigned int button = 0;


static int read_gpio(int gpio, int polarity)
{
	int res;
	
	if (gpio) {
		sb_gpiocontrol(sbh,gpio,gpio);
		sb_gpioouten(sbh,gpio,0);
		res=!(sb_gpioin(sbh)&gpio);

		return (polarity ? !res : res);
	}

	return 0;
}

static int proc_reset(ctl_table *table, int write, struct file *filp,
		void *buffer, size_t *lenp)
{
	reset = read_gpio(reset_gpio, reset_polarity);

	return proc_dointvec(table, write, filp, buffer, lenp);
}

static int proc_button(ctl_table *table, int write, struct file *filp,
		void *buffer, size_t *lenp)
{
	button = read_gpio(button_gpio, button_polarity);

	return proc_dointvec(table, write, filp, buffer, lenp);
}

// - - - - -
static struct ctl_table_header *diag_sysctl_header;

static ctl_table sys_diag[] = {
         { 
	   ctl_name: 2000,
	   procname: "diag", 
	   data: &diag,
	   maxlen: sizeof(diag), 
	   mode: 0644,
	   proc_handler: proc_diag
	 },
	 {
	   ctl_name: 2001,
	   procname: "reset",
	   data: &reset,
	   maxlen: sizeof(reset),
	   mode: 0444,
	   proc_handler: proc_reset 
	 },
	 {
	   ctl_name: 2002,
	   procname: "button",
	   data: &button,
	   maxlen: sizeof(button),
	   mode: 0444,
	   proc_handler: proc_button
	 },
         { 0 }
};

static int __init diag_init()
{
	char *buf;
	u32 board_type;
	sbh = sb_kattach();
	sb_gpiosetcore(sbh);

	board_type = sb_boardtype(sbh);
	printk(KERN_INFO "diag boardtype: %08x\n",board_type);

	set_diag=ignore;
	set_dmz=ignore;
	set_ses=ignore;
	set_pwr=ignore;
	
	buf=nvram_get("pmon_ver") ?: "";
	if (((board_type & 0xf00) == 0x400) && (strncmp(buf, "CFE", 3) != 0)) {
		buf=nvram_get("boardtype")?:"";
		if (!strcmp(buf,"bcm94710dev")) {
			buf=nvram_get("boardnum")?:"";
			if (!strcmp(buf,"42")) {
				// wrt54g v1.x
				set_diag=v1_set_diag;
				set_dmz=v1_set_dmz;
				reset_gpio=(1<<6);
			}
			if (!strcmp(buf,"asusX")) {
				//asus wl-500g
				set_pwr=wl500g_set_pwr;
				reset_gpio=(1<<6);
			}
		}
		if (!strcmp(buf,"bcm94710ap")) {
			buf=nvram_get("boardnum")?:"";
			if (!strcmp(buf,"42")) {
				// buffalo
				set_dmz=v2_set_dmz;
				reset_gpio=(1<<4);
			}
			if (!strcmp(buf,"44")) {
				//dell truemobile
				set_dmz=v2_set_dmz;
				reset_gpio=(1<<0);
			}
		}
	} else {
		buf=nvram_get("boardnum")?:"";
		if (!strcmp(buf,"42")) {
			//linksys
			set_diag=v2_set_diag;
			set_dmz=v2_set_dmz;
			set_ses=v2_set_ses;
			
			reset_gpio=(1<<6);
			button_gpio=(1<<4);

			if (!strcmp((nvram_get("boardtype")?:""), "0x0101")) // WRT54G3G
				ses_reverse = 0;
			else
				ses_reverse = 1;
		}
		if (!strcmp(buf,"44")) {
			//motorola
			reset_gpio=(1<<5);
		}
		if (!strcmp(buf,"00")) {
			//buffalo
			diag_reverse = 0;
			set_dmz=v2_set_diag;
			set_diag=v2_set_aoss;
			reset_gpio=(1<<7);
		}
		if (!strcmp(buf,"45")) { /* ASUS */
			buf=nvram_get("boardtype")?:"";
			if (!strcmp(buf,"0x042f")) {
				//wl-500g premium
				button_gpio=(1<<4);
				reset_gpio=(1<<0);
				set_pwr=wl500gp_set_pwr;
				pwr_reverse = 0;
			} else {
				//wl-500g deluxe
				set_pwr=wl500g_set_pwr;
				reset_gpio=(1<<6);
			}
		}
	}

	sb_gpiocontrol(sbh,reset_gpio,reset_gpio);
	sb_gpioouten(sbh,reset_gpio,0);
	reset_polarity=!(sb_gpioin(sbh)&reset_gpio);

	if (button_gpio) {
		sb_gpiocontrol(sbh,button_gpio,button_gpio);
		sb_gpioouten(sbh,button_gpio,0);
		button_polarity=!(sb_gpioin(sbh)&button_gpio);
	} else {
		// don't create /proc/button
		sys_diag[2].ctl_name = 0;
	}

	diag_sysctl_header = register_sysctl_table(sys_diag, 0);
	diag_change();

	return 0;
}

static void __exit diag_exit()
{
	unregister_sysctl_table(diag_sysctl_header);
}

EXPORT_NO_SYMBOLS;
MODULE_AUTHOR("openwrt.org");
MODULE_LICENSE("GPL");

module_init(diag_init);
module_exit(diag_exit);
