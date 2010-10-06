/*
 *   Copyright (C) 2010 Michael Buesch <mb@bu3sch.de>
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

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>

typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;

#include "user_retu_tahvo.h"


static const char * chip2str(int chip)
{
	switch (chip) {
	case CHIP_RETU:
		return "Retu";
	case CHIP_TAHVO:
		return "Tahvo";
	}
	return "UNKNOWN";
}

static int str2uint(const char *str, unsigned int *value)
{
	char *tail;

	*value = strtoul(str, &tail, 0);
	if (*tail != '\0')
		return -1;

	return 0;
}

static int open_dev(int chip)
{
	const char *path;
	int fd;

	switch (chip) {
	case CHIP_RETU:
		path = "/dev/retu";
		break;
	case CHIP_TAHVO:
		path = "/dev/tahvo";
		break;
	default:
		return -1;
	}

	fd = open(path, O_RDWR);
	if (fd < 0) {
		fprintf(stderr, "Failed to open %d: %s\n",
			path, strerror(errno));
	}

	return fd;
}

#define MASKREG(mask, reg)	((mask) | (((reg) & 0x3F) << 16))

static unsigned int encrapify_value(unsigned int value, unsigned int mask)
{
	if (!mask)
		return 0;
	while (!(mask & 1)) {
		value >>= 1;
		mask >>= 1;
	}

	return value;
}

static unsigned int decrapify_value(unsigned int value, unsigned int mask)
{
	if (!mask)
		return 0;
	while (!(mask & 1)) {
		value <<= 1;
		mask >>= 1;
	}

	return value;
}

static int do_read(int chip, int fd, unsigned int mask, unsigned int reg, unsigned int *value)
{
	unsigned int command;
	int res;

	switch (chip) {
	case CHIP_RETU:
		command = RETU_IOCH_READ;
		break;
	case CHIP_TAHVO:
		command = TAHVO_IOCH_READ;
		break;
	default:
		return -1;
	}
	res = ioctl(fd, command, MASKREG(mask, reg));
	if (res < 0)
		return -1;
	*value = decrapify_value(res, mask);

	return 0;
}

static int task_read(int chip, unsigned int reg, unsigned int *value)
{
	int fd, err;

	fd = open_dev(chip);
	if (fd < 0)
		return -1;
	err = do_read(chip, fd, 0xFFFF, reg, value);
	close(fd);

	return err;
}

static int do_write(int chip, int fd, unsigned int mask, unsigned int reg, unsigned int value)
{
	struct retu_tahvo_write_parms p;
	unsigned int command;
	int err;

	switch (chip) {
	case CHIP_RETU:
		command = RETU_IOCX_WRITE;
		break;
	case CHIP_TAHVO:
		command = TAHVO_IOCX_WRITE;
		break;
	default:
		return -1;
	}

	memset(&p, 0, sizeof(p));
	p.field = MASKREG(mask, reg);
	p.value = encrapify_value(value, mask);

	err = ioctl(fd, command, &p);
	if (err) {
		fprintf(stderr, "Write ioctl failed\n");
		return -1;
	}
	if (p.result != 0) {
		fprintf(stderr, "Failed to write\n");
		return -1;
	}

	return 0;
}

static int task_maskset(int chip, unsigned int reg, unsigned int mask, unsigned int set)
{
	int fd, err;
	unsigned int value;

	mask &= 0xFFFF;
	set &= 0xFFFF;

	fd = open_dev(chip);
	if (fd < 0)
		return -1;
	err = do_write(chip, fd, mask, reg, set);
	close(fd);

	return err;
}

static int task_write(int chip, unsigned int reg, unsigned int value)
{
	return task_maskset(chip, reg, 0xFFFF, value);
}

static void usage(FILE *fd, int argc, char **argv)
{
	fprintf(fd, "Usage: %s CHIP TASK REG [VALUE...]\n", argv[0]);
	fprintf(fd, "  CHIP is one of RETU or TAHVO\n");
	fprintf(fd, "  TASK is one of READ, WRITE or MASKSET\n");
	fprintf(fd, "  VALUE are values, depending on TASK\n");
}

int main(int argc, char **argv)
{
	const char *chip_str, *task, *reg_str;
	int chip;
	unsigned int reg, mask, set, value;
	int err;

	if (argc != 4 && argc != 5 && argc != 6)
		goto err_usage;
	chip_str = argv[1];
	task = argv[2];
	reg_str = argv[3];

	if (strcasecmp(chip_str, "retu") == 0)
		chip = CHIP_RETU;
	else if (strcasecmp(chip_str, "tahvo") == 0)
		chip = CHIP_TAHVO;
	else
		goto err_usage;

	err = str2uint(reg_str, &reg);
	if (err)
		goto err_usage;

	if (strcasecmp(task, "read") == 0) {
		if (argc != 4)
			goto err_usage;
		err = task_read(chip, reg, &value);
		if (err) {
			fprintf(stderr, "Failed to read %s register 0x%02X\n",
				chip2str(chip), reg);
			return 1;
		}
		printf("0x%04X\n", value);
	} else if (strcasecmp(task, "write") == 0) {
		if (argc != 5)
			goto err_usage;
		err = str2uint(argv[4], &value);
		if (err)
			goto err_usage;
		err = task_write(chip, reg, value);
		if (err) {
			fprintf(stderr, "Failed to write %s register 0x%02X\n",
				chip2str(chip), reg);
			return 1;
		}
	} else if (strcasecmp(task, "maskset") == 0) {
		if (argc != 6)
			goto err_usage;
		err = str2uint(argv[4], &mask);
		err |= str2uint(argv[5], &set);
		if (err)
			goto err_usage;
		err = task_maskset(chip, reg, mask, set);
		if (err) {
			fprintf(stderr, "Failed to maskset %s register 0x%02X\n",
				chip2str(chip), reg);
			return 1;
		}
	} else
		goto err_usage;

	return 0;

err_usage:
	usage(stderr, argc, argv);
	return 1;
}
