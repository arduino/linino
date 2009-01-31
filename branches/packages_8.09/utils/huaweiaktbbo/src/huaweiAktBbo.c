/* HUAWEI E220 3G HSDPA modem - Aktivator modemu = aktivuje ttyUSB0 tty USB1 
   bobovsky 11.12.2006
   dalej sa uz pouzije usbserial a usb-storage
   cc huaweiAktBbo.c -lusb  (resp -I. -L.)
   armeb-linux-gcc huaweiAktBbo.c -L. -I. -lusb
   Copyright (C) 2006 bobovsky bobovsky@kanoistika.sk  GPL 
   This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License2.
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <signal.h>
#include <ctype.h>
#include <usb.h>
#if 0
 #include <linux/usbdevice_fs.h>
 #define LIBUSB_AUGMENT
 #include "libusb_augment.h"
#endif

struct usb_dev_handle *devh;

void release_usb_device(int dummy) {
    int ret;
    ret = usb_release_interface(devh, 0);
    if (!ret)
	printf("failed to release interface: %d\n", ret);
    usb_close(devh);
    if (!ret)
	printf("failed to close interface: %d\n", ret);
    exit(1);
}

void list_devices() {
    struct usb_bus *bus;
    for (bus = usb_get_busses(); bus; bus = bus->next) {
	struct usb_device *dev;
	
	for (dev = bus->devices; dev; dev = dev->next)
	    printf("0x%04x 0x%04x\n",
		   dev->descriptor.idVendor,
		   dev->descriptor.idProduct);
    }
}    

struct usb_device *find_device(int vendor, int product) {
    struct usb_bus *bus;
    
    for (bus = usb_get_busses(); bus; bus = bus->next) {
	struct usb_device *dev;
	
	for (dev = bus->devices; dev; dev = dev->next) {
	    if (dev->descriptor.idVendor == vendor
		&& dev->descriptor.idProduct == product)
		return dev;
	}
    }
    return NULL;
}

void print_bytes(char *bytes, int len) {
    int i;
    if (len > 0) {
	for (i=0; i<len; i++) {
	    printf("%02x ", (int)((unsigned char)bytes[i]));
	}
	printf("\"");
        for (i=0; i<len; i++) {
	    printf("%c", isprint(bytes[i]) ? bytes[i] : '.');
        }
        printf("\"");
    }
}


int main(int argc, char **argv) {
    int ret, vendor, product;
    struct usb_device *dev;
    char buf[65535], *endptr;
#if 0
    usb_urb *isourb;
    struct timeval isotv;
    char isobuf[32768];
#endif

    usb_init();
//    usb_set_debug(255);
    usb_find_busses();
    usb_find_devices();
/*
    if (argc!=3) {
	printf("usage: %s vendorID productID\n", argv[0]);
	printf("ID numbers of currently attached devices:\n");
	list_devices();
	exit(1);
    }
    vendor = strtol(argv[1], &endptr, 16);
    if (*endptr != '\0') {
	printf("invalid vendor id\n");
	exit(1);
    }
    product = strtol(argv[2], &endptr, 16);
    if (*endptr != '\0') {
	printf("invalid product id\n");
	exit(1);
    }
*/
    printf("Hladam HUAWEI E220 a prepnem na modem - bbo 06\n");
    vendor = 0x12d1;
    product = 0x1003;
    dev = find_device(vendor, product);
    assert(dev);

    devh = usb_open(dev);
    assert(devh);
    
    signal(SIGTERM, release_usb_device);

/*
    ret = usb_get_driver_np(devh, 0, buf, sizeof(buf));
    printf("usb_get_driver_np returned %d\n", ret);
    if (ret == 0) {
	printf("interface 0 already claimed by driver \"%s\", attempting to detach it\n", buf);
	ret = usb_detach_kernel_driver_np(devh, 0);
	printf("usb_detach_kernel_driver_np returned %d\n", ret);
    }
    ret = usb_claim_interface(devh, 0);
    if (ret != 0) {
	printf("claim failed with error %d\n", ret);
		exit(1);
    }
    
    ret = usb_set_altinterface(devh, 0);
    assert(ret >= 0);
*/
// BBO typ 1 = DEVICE
ret = usb_get_descriptor(devh, 0x0000001, 0x0000000, buf, 0x0000012);
//printf("1 get descriptor returned %d, bytes: ", ret);
//print_bytes(buf, ret);
//printf("\n");
usleep(1*1000);
// BBO typ 2 = CONFIGURATION
ret = usb_get_descriptor(devh, 0x0000002, 0x0000000, buf, 0x0000009);
//printf("2 get descriptor returned %d, bytes: ", ret);
//print_bytes(buf, ret);
//printf("\n");
usleep(1*1000);
// BBO typ 2 = CONFIGURATION
ret = usb_get_descriptor(devh, 0x0000002, 0x0000000, buf, 0x0000020);
//printf("3 get descriptor returned %d, bytes: ", ret);
//print_bytes(buf, ret);
//printf("\n");
usleep(1*1000);
/*
ret = usb_release_interface(devh, 0);
if (ret != 0) printf("failed to release interface before set_configuration: %d\n", ret);
ret = usb_set_configuration(devh, 0x0000001);
printf("4 set configuration returned %d\n", ret);
ret = usb_claim_interface(devh, 0);
if (ret != 0) printf("claim after set_configuration failed with error %d\n", ret);
ret = usb_set_altinterface(devh, 0);
printf("4 set alternate setting returned %d\n", ret);
usleep(50*1000);
ret = usb_set_altinterface(devh, 0);
printf("5 set alternate setting returned %d\n", ret);
usleep(62*1000);
*/
ret = usb_control_msg(devh, USB_TYPE_STANDARD + USB_RECIP_DEVICE, USB_REQ_SET_FEATURE, 00000001, 0, buf, 0, 1000);
printf("4 set feature request returned %d\n", ret);
/*
	ret = usb_release_interface(devh, 0);
	assert(ret == 0);
*/
	ret = usb_close(devh);
	assert(ret == 0);
	printf("Prepnute-OK, Mas ttyUSB0 ttyUSB1 (cez usbserial vendor=0x12d1 product=0x1003)\n");
	printf("pozri /proc/bus/usb/devices\n");
	return 0;
}
