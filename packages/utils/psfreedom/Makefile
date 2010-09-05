#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=psfreedom
PKG_REV:=83445097c1c7687b5e6ccadca90126ca7a9a38b9
PKG_VERSION:=$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://github.com/kakaroto/PSFreedom.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define KernelPackage/psfreedom
  SUBMENU:=USB Support
  DEPENDS:=@TARGET_omap24xx +kmod-usb-tahvo +kmod-musb-hdrc
  TITLE:=PSFreedom PS3 USB exploit
  FILES:=$(PKG_BUILD_DIR)/psfreedom.ko
endef

define KernelPackage/psfreedom/description
  Playstation 3 USB exploit. Runs on Nokia n810.
endef

include $(INCLUDE_DIR)/kernel-defaults.mk

define Build/Compile
	$(MAKE) $(KERNEL_MAKEOPTS) \
		SUBDIRS="$(PKG_BUILD_DIR)" \
		KDIR="$(LINUX_DIR)" \
		PWD="$(PKG_BUILD_DIR)" \
		EXTRA_CFLAGS="-DENABLE_MUSB_CONTROLLER" \
		modules
endef

$(eval $(call KernelPackage,psfreedom))
