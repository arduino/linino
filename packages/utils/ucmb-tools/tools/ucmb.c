/*
 * Microcontroller Message Bus
 * Userspace commandline utility
 *
 * Copyright (c) 2009 Michael Buesch <mb@bu3sch.de>
 *
 * Licensed under the GNU/GPL. See COPYING for details.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>


#define UCMB_DEV	"/dev/ucmb"


static void usage(int argc, char **argv)
{
	fprintf(stderr, "Usage: %s read|write\n", argv[0]);
}

int main(int argc, char **argv)
{
	const char *command;
	int errcode = 0;
	int ucmb_fd;
	char *buf;
	size_t count, buflen;
	ssize_t nrbytes;

	if (argc != 2) {
		usage(argc, argv);
		return 1;
	}
	command = argv[1];

	ucmb_fd = open(UCMB_DEV, O_RDWR);
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
			goto out_free;
		}
		if (fwrite(buf, nrbytes, 1, stdout) != 1) {
			fprintf(stderr, "Failed to write stdout\n");
			goto out_free;
		}
	} else if (strcasecmp(command, "write") == 0) {
		count = fread(buf, 1, buflen, stdin);
		if (!count) {
			fprintf(stderr, "Failed to read stdin\n");
			goto out_free;
		}
		nrbytes = write(ucmb_fd, buf, count);
		if (nrbytes != count) {
			fprintf(stderr, "Failed to write UCMB: %s (%d)\n",
				strerror(errno), errno);
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
