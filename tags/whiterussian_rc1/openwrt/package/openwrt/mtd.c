/*
 * mtd - simple memory technology device manipulation tool
 *
 * Copyright (C) 2005 Waldemar Brodkorb <wbx@dass-it.de>,
 *		      Felix Fietkau <nbd@vd-s.ath.cx>
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
 * $Id$
 *
 * code is based on linux-mtd example code
 */

#include <limits.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <fcntl.h>
#include <errno.h>
#include <error.h>
#include <time.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/param.h>
#include <sys/mount.h>
#include <sys/stat.h>
#include <sys/reboot.h>
#include <string.h>

#include <linux/mtd/mtd.h>

/* trx header */
#define TRX_MAGIC       0x30524448      /* "HDR0" */
#define TRX_VERSION     1
#define TRX_MAX_LEN     0x3A0000
#define TRX_NO_HEADER   1               /* Do not write TRX header */

#define MAX_ARGS 8

struct trx_header {
	uint32_t magic;                 /* "HDR0" */
	uint32_t len;                   /* Length of file including header */
	uint32_t crc32;                 /* 32-bit CRC from flag_version to end of file */
	uint32_t flag_version;  /* 0:15 flags, 16:31 version */
	uint32_t offsets[3];    /* Offsets of partitions from start of header */
};

#define BUFSIZE (10 * 1024)


int
mtd_unlock(const char *mtd)
{
	int fd;
	struct mtd_info_user mtdInfo;
	struct erase_info_user mtdLockInfo;

	fd = mtd_open(mtd, O_RDWR);
	if(fd < 0) {
		fprintf(stderr, "Could not open mtd device: %s\n", mtd);
		exit(1);
	}

	if(ioctl(fd, MEMGETINFO, &mtdInfo)) {
		fprintf(stderr, "Could not get MTD device info from %s\n", mtd);
		close(fd);
		exit(1);
	}

	printf("Unlocking %s ...\n", mtd);
	mtdLockInfo.start = 0;
	mtdLockInfo.length = mtdInfo.size;
	if(ioctl(fd, MEMUNLOCK, &mtdLockInfo)) {
		fprintf(stderr, "Could not unlock MTD device: %s\n", mtd);
		close(fd);
		return 0;
	}
		
	close(fd);
	return 0;
}

int
mtd_open(const char *mtd, int flags)
{
	FILE *fp;
	char dev[PATH_MAX];
	int i;

	if ((fp = fopen("/proc/mtd", "r"))) {
		while (fgets(dev, sizeof(dev), fp)) {
			if (sscanf(dev, "mtd%d:", &i) && strstr(dev, mtd)) {
				snprintf(dev, sizeof(dev), "/dev/mtd/%d", i);
				fclose(fp);
				return open(dev, flags);
			}
		}
		fclose(fp);
	}

	return open(mtd, flags);
}

int
mtd_erase(const char *mtd)
{
	int fd;
	struct mtd_info_user mtdInfo;
	struct erase_info_user mtdEraseInfo;

	fd = mtd_open(mtd, O_RDWR);
	if(fd < 0) {
		fprintf(stderr, "Could not open mtd device: %s\n", mtd);
		exit(1);
	}

	if(ioctl(fd, MEMGETINFO, &mtdInfo)) {
		fprintf(stderr, "Could not get MTD device info from %s\n", mtd);
		close(fd);
		exit(1);
	}

	printf("Erasing %s ...\n", mtd);
	mtdEraseInfo.length = mtdInfo.erasesize;

	for (mtdEraseInfo.start = 0;
		 mtdEraseInfo.start < mtdInfo.size;
		 mtdEraseInfo.start += mtdInfo.erasesize) {
		
		ioctl(fd, MEMUNLOCK, &mtdEraseInfo);
		if(ioctl(fd, MEMERASE, &mtdEraseInfo)) {
			fprintf(stderr, "Could not erase MTD device: %s\n", mtd);
			close(fd);
			exit(1);
		}
	}		

	close(fd);
	return 0;

}

int
mtd_write(const char *trxfile, const char *mtd)
{
	int fd;
	int trxfd;
	int i;
	size_t result,size,written;
	struct mtd_info_user mtdInfo;
	struct erase_info_user mtdEraseInfo;
	struct stat trxstat;
	unsigned char src[BUFSIZE],dest[BUFSIZE];

	fd = mtd_open(mtd, O_RDWR);
	if(fd < 0) {
		fprintf(stderr, "Could not open mtd device: %s\n", mtd);
		exit(1);
	}

	if(ioctl(fd, MEMGETINFO, &mtdInfo)) {
		fprintf(stderr, "Could not get MTD device info from %s\n", mtd);
		close(fd);
		exit(1);
	}

	trxfd = open(trxfile,O_RDONLY);	
	if(trxfd < 0) {
		fprintf(stderr, "Could not open trx image: %s\n", trxfile);
		exit(1);
	}

	if (fstat (trxfd,&trxstat) < 0) {
		fprintf(stderr, "Could not get trx image file status: %s\n", trxfile);
		close(trxfd);
		exit(1);
	}
		
	if(mtdInfo.size < trxstat.st_size) {
		fprintf(stderr, "Image too big for partition: %s\n", mtd);
		close(trxfd);
		exit(1);
	}	
	
	printf("Writing %s to %s ...\n", trxfile, mtd);

	mtdEraseInfo.start = 0;
	mtdEraseInfo.length = trxstat.st_size & ~(mtdInfo.erasesize -1);
	if(trxstat.st_size % mtdInfo.erasesize) mtdEraseInfo.length += mtdInfo.erasesize;

	/* erase the chunk */
	if (ioctl (fd,MEMERASE,&mtdEraseInfo) < 0) {
		fprintf(stderr, "Erasing mtd failed: %s\n", mtd);
		exit(1);
	}
	
	size = trxstat.st_size;
	i = BUFSIZE;
	written = 0;

	while (size) {
		if (size < BUFSIZE) i = size;
		read(trxfd,src,i);
		result = write(fd,src,i);
		if (i != result) {
			if (result < 0) {
				fprintf(stderr,"Error while writing image");
				exit(1);
			}
			fprintf(stderr,"Error writing image");
			exit(1);
		}
		written += i;
		size -= i;
	}
	
	return 0;
}

void usage(void)
{
	printf("Usage: mtd [<options> ...] <command> [<arguments> ...] <device>\n\n"
	"The device is in the format of mtdX (eg: mtd4) or its label.\n"
	"mtd recognizes these commands:\n"
	"	unlock			unlock the device\n"
	"	erase			erase all data on device\n"
	"	write <imagefile>	write imagefile to device\n"
	"Following options are available:\n"
	"	-r			reboot after successful command\n"
	"	-e <device>		erase <device> before executing the command\n\n"
	"Example: To write linux.trx to mtd4 labeled as linux and reboot afterwards\n"
	"         mtd -r write linux.trx linux\n\n");
	exit(1);
}

int main (int argc, char **argv)
{
	int ch, i, boot, unlock;
	char *erase[MAX_ARGS], *device;
	enum {
		CMD_ERASE,
		CMD_WRITE,
		CMD_UNLOCK
	} cmd;
	
	erase[0] = NULL;
	boot = 0;

	while ((ch = getopt(argc, argv, "re:")) != -1)
		switch (ch) {
			case 'r':
				boot = 1;
				break;
			case 'e':
				i = 0;
				while ((erase[i] != NULL) && ((i + 1) < MAX_ARGS))
					i++;
					
				erase[i++] = optarg;
				erase[i] = NULL;
				break;
			
			case '?':
			default:
				usage();
		}
	argc -= optind;
	argv += optind;
	
	if (argc < 2)
		usage();

	if ((strcmp(argv[0], "unlock") == 0) && (argc == 2)) {
		cmd = CMD_UNLOCK;
		device = argv[1];
	} else if ((strcmp(argv[0], "erase") == 0) && (argc == 2)) {
		cmd = CMD_ERASE;
		device = argv[1];
	} else if ((strcmp(argv[0], "write") == 0) && (argc == 3)) {
		cmd = CMD_WRITE;
		device = argv[2];
	} else {
		usage();
	}

	sync();

	i = 0;
	while (erase[i] != NULL) {
		mtd_unlock(erase[i]);
		mtd_erase(erase[i]);
		i++;
	}
	
	mtd_unlock(device);

	switch (cmd) {
		case CMD_UNLOCK:
			break;
		case CMD_ERASE:
			mtd_erase(device);
			break;
		case CMD_WRITE:
			mtd_write(argv[1], device);
			break;
	}

	if (boot)
		kill(1, 15); // send SIGTERM to init for reboot

	return 0;
}
