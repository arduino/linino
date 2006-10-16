#$Id: 005-diag_led.patch 4594 2006-08-18 13:10:19Z florian $

EXTRA_CFLAGS := -I$(TOPDIR)/arch/mips/bcm947xx/include -DBCMDRIVER

O_TARGET       := diag.o

MAC_OBJS       := diag_led.o

export-objs    := 
obj-y          := $(MAC_OBJS)
obj-m          := $(O_TARGET)

include $(TOPDIR)/Rules.make
