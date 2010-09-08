#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=psfreedom
PKG_REV:=1998b60b81ddd6400cdf208d71a7878a7021a078
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
  DEPENDS:=@TARGET_omap24xx +TARGET_omap24xx:kmod-usb-tahvo +TARGET_omap24xx:kmod-musb-hdrc
  TITLE:=PSFreedom PS3 USB exploit
  FILES:=$(PKG_BUILD_DIR)/psfreedom.ko
endef

define KernelPackage/psfreedom/description
  Playstation 3 USB exploit. Runs on Nokia n810.
endef

include $(INCLUDE_DIR)/kernel-defaults.mk

TARGET_CFG_CFLAGS:=$(if $(CONFIG_TARGET_omap24xx),-DENABLE_MUSB_CONTROLLER)

define Build/Compile
	$(MAKE) $(KERNEL_MAKEOPTS) \
		SUBDIRS="$(PKG_BUILD_DIR)" \
		KDIR="$(LINUX_DIR)" \
		PWD="$(PKG_BUILD_DIR)" \
		EXTRA_CFLAGS="$(TARGET_CFG_CFLAGS)" \
		modules
endef

define KernelPackage/psfreedom/install
	$(INSTALL_DIR) $(1)/usr/share/psfreedom/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/bins/*.bin $(1)/usr/share/psfreedom/
endef

$(eval $(call KernelPackage,psfreedom))
