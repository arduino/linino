# $Id$
#
# Makefile for the diag driver
#
# Copyright (C) 2006 Felix Fietkau <nbd@openwrt.org>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version
# 2 of the License, or (at your option) any later version.
#

EXTRA_CFLAGS := -I$(TOPDIR)/arch/mips/bcm947xx/include -DBCMDRIVER

obj-m			:= diag.o

ifeq ($(MAKING_MODULES),1)
-include $(TOPDIR)/Rules.make
endif

