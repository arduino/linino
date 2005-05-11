include $(TOPDIR)/rules.mk

ifeq ($(BR2_KERNEL_26),y)
include ./kernel-headers26.mk
else
include ./kernel-headers.mk
endif

source: kernel-headers-source
prepare: kernel-headers
compile:
install:
clean: kernel-headers-toolclean

