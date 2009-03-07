/*
 *   Microcontroller Message Bus
 *   Userspace commandline utility
 *
 *   Copyright (c) 2009 Michael Buesch <mb@bu3sch.de>
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

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/ioctl.h>
#include <linux/ioctl.h>


#define UCMB_DEV	"/dev/ucmb"

#define __UCMB_IOCTL		('U'|'C'|'M'|'B')
#define UCMB_IOCTL_RESETUC	_IO(__UCMB_IOCTL, 0)
#define UCMB_IOCTL_GMSGDELAY	_IOR(__UCMB_IOCTL, 1, unsigned int)
#define UCMB_IOCTL_SMSGDELAY	_IOW(__UCMB_IOCTL, 2, unsigned int)


static void usage(int argc, char **argv)
{
	fprintf(stderr, "Usage: %s read|write|reset [" UCMB_DEV "]\n", argv[0]);
}

int main(int argc, char **argv)
{
	const char *command, *devpath = UCMB_DEV;
	int res, errcode = 0;
	int ucmb_fd;
	char *buf;
	size_t count, buflen;
	ssize_t nrbytes;

	if (argc != 2 && argc != 3) {
		usage(argc, argv);
		return 1;
	}
	if (argc == 3)
		devpath = argv[2];
	command = argv[1];

	ucmb_fd = open(devpath, O_RDWR);
	if (ucmb_fd == -1) {
		fprintf(stderr, "Failed to open %s\n", UCMB_DEV);
		errcode = 1;
		goto out;
	}

	buflen = 4096;
	buf = malloc(buflen);
	if (!buf) {
		fprintf(stderr, "Out of memory\n");
		errcode = 1;
		goto out_close;
	}

	if (strcasecmp(command, "read") == 0) {
		nrbytes = read(ucmb_fd, buf, buflen);
		if (nrbytes < 0) {
			fprintf(stderr, "Failed to read UCMB: %s (%d)\n",
				strerror(errno), errno);
			errcode = 1;
			goto out_free;
		}
		if (fwrite(buf, nrbytes, 1, stdout) != 1) {
			fprintf(stderr, "Failed to write stdout\n");
			errcode = 1;
			goto out_free;
		}
	} else if (strcasecmp(command, "write") == 0) {
		count = fread(buf, 1, buflen, stdin);
		if (!count) {
			fprintf(stderr, "Failed to read stdin\n");
			errcode = 1;
			goto out_free;
		}
		nrbytes = write(ucmb_fd, buf, count);
		if (nrbytes != count) {
			fprintf(stderr, "Failed to write UCMB: %s (%d)\n",
				strerror(errno), errno);
			errcode = 1;
			goto out_free;
		}
	} else if (strcasecmp(command, "reset") == 0) {
		res = ioctl(ucmb_fd, UCMB_IOCTL_RESETUC);
		if (res) {
			fprintf(stderr, "RESET ioctl failed: %s (%d)\n",
				strerror(res < 0 ? -res : res), res);
			errcode = 1;
			goto out_free;
		}
	} else {
		usage(argc, argv);
		errcode = 1;
		goto out_free;
	}

out_free:
	free(buf);
out_close:
	close(ucmb_fd);
out:
	return errcode;
}
