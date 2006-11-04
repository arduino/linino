/*
 * diag.h - GPIO interface driver for Broadcom boards
 *
 * Copyright (C) 2006 Mike Baker <mbm@openwrt.org>,
 *                    Felix Fietkau <nbd@openwrt.org>
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
 * $Id:$
 */

#define MODULE_NAME "diag"

#define MAX_GPIO 8
#define FLASH_TIME HZ/6

enum polarity_t {
	REVERSE = 0,
	NORMAL = 1,
};

enum {
	PROC_BUTTON,
	PROC_LED,
	PROC_MODEL,
	PROC_GPIOMASK
};

struct prochandler_t {
	int type;
	void *ptr;
};

struct button_t {
	struct prochandler_t proc;
	char *name;
	u32 gpio;
	unsigned long seen;
	u8 pressed;
};

struct led_t {
	struct prochandler_t proc;
	char *name;
	u32 gpio;
	u8 polarity;
	u8 flash;
	u8 state;
};

struct platform_t {
	char *name;

	struct button_t buttons[MAX_GPIO];
	u32 button_mask;
	u32 button_polarity;

	struct led_t leds[MAX_GPIO];
};

struct event_t {
	struct tq_struct tq;
	char buf[256];
	char *argv[3];
	char *envp[6];
};

#define sbh bcm947xx_sbh
#define sbh_lock bcm947xx_sbh_lock

extern void *bcm947xx_sbh;
extern spinlock_t bcm947xx_sbh_lock;
extern char *nvram_get(char *str);

static struct platform_t platform;

/* buttons */

static void set_irqenable(int enabled);

static void register_buttons(struct button_t *b);
static void unregister_buttons(struct button_t *b);

static void hotplug_button(struct event_t *event);
static void button_handler(int irq, void *dev_id, struct pt_regs *regs);

/* leds */

static void register_leds(struct led_t *l);
static void unregister_leds(struct led_t *l);

#define EXTIF_ADDR 0x1f000000
#define EXTIF_UART (EXTIF_ADDR + 0x00800000)

#define GPIO_TYPE_NORMAL	(0x0 << 24)
#define GPIO_TYPE_EXTIF 	(0x1 << 24)
#define GPIO_TYPE_MASK  	(0xf << 24)

static void set_led_extif(struct led_t *led);
static void led_flash(unsigned long dummy);

static struct timer_list led_timer = {
	function: &led_flash
};

/* proc */

static struct proc_dir_entry *diag, *leds;

static ssize_t diag_proc_read(struct file *file, char *buf, size_t count, loff_t *ppos);
static ssize_t diag_proc_write(struct file *file, const char *buf, size_t count, void *data);

static struct file_operations diag_proc_fops = {
	read: diag_proc_read,
	write: diag_proc_write
};

static struct prochandler_t proc_model = { .type = PROC_MODEL };
static struct prochandler_t proc_gpiomask = { .type = PROC_GPIOMASK };

/* TODO: export existing sb_irq instead */
static int sb_irq(void *sbh)
{
	uint idx;
	void *regs;
	sbconfig_t *sb;
	uint32 flag, sbipsflag;
	uint irq = 0;

	regs = sb_coreregs(sbh);
	sb = (sbconfig_t *)((ulong) regs + SBCONFIGOFF);
	flag = (R_REG(&sb->sbtpsflag) & SBTPS_NUM0_MASK);

	idx = sb_coreidx(sbh);

	if ((regs = sb_setcore(sbh, SB_MIPS, 0)) ||
	    (regs = sb_setcore(sbh, SB_MIPS33, 0))) {
		sb = (sbconfig_t *)((ulong) regs + SBCONFIGOFF);

		/* sbipsflag specifies which core is routed to interrupts 1 to 4 */
		sbipsflag = R_REG(&sb->sbipsflag);
		for (irq = 1; irq <= 4; irq++, sbipsflag >>= 8) {
			if ((sbipsflag & 0x3f) == flag)
				break;
		}
		if (irq == 5)
			irq = 0;
	}

	sb_setcoreidx(sbh, idx);

	return irq;
}
