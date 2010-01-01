#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=ucmb
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk


define KernelPackage/ucmb
  SUBMENU:=Other modules
  DEPENDS:=@LINUX_2_6 \
          @!LINUX_2_6_21 @!LINUX_2_6_22 @!LINUX_2_6_23 @!LINUX_2_6_24 \
	  @!LINUX_2_6_25 @!LINUX_2_6_26 @!LINUX_2_6_27 \
	  +kmod-spi-gpio +kmod-crc16
  KCONFIG:=CONFIG_SPI=y \
          CONFIG_SPI_MASTER=y
  TITLE:=Microcontroller Message Bus
  FILES:=$(PKG_BUILD_DIR)/ucmb.$(LINUX_KMOD_SUFFIX)
  AUTOLOAD:=$(call AutoLoad,93,ucmb)
endef

define KernelPackage/ucmb/description
	The Microcontroller Message Bus is a tiny SPI-GPIO based communication
	channel used to talk to microcontrollers over GPIO pins.
	The lowlevel protocol is CRC16 protected, so one can be pretty sure
	that the data transmitted and received through the /dev/ucmb node is not corrupted.
	So no further checks should be needed at upper protocol layers.
	The device node considers every read/write to be one packet. The maximum packet
	size is either PAGE_SIZE (at least 4kb) or the microcontroller specific packet size
	limit, which is likely to be a lot smaller than PAGE_SIZE.
	To register an ucmb device, simply create a struct ucmb_platform_data
	and register it via ucmb_device_register() from another kernel module.
	Example implementations for the microcontroller-side code can be found in
	the utils/ucmb/microcontroller_examples subdirectory of the OpenWRT packages feed.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./driver/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	$(MAKE) -C "$(LINUX_DIR)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		ARCH="$(LINUX_KARCH)" \
		SUBDIRS="$(PKG_BUILD_DIR)" \
		EXTRA_CFLAGS="$(BUILDFLAGS)" \
		modules
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) \
		$(PKG_BUILD_DIR)/ucmb.h \
		$(1)/usr/include
endef

$(eval $(call KernelPackage,ucmb))
