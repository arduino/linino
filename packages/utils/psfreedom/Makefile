#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=psfreedom
PKG_REV:=d62f4aedf33c1ad5222a8c970e623da5441c40db
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

define KernelPackage/psfreedom/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/payload_bdemu.bin \
		$(1)/lib/firmware/psfreedom_payload_bdemu.bin
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/payload_no_bdemu.bin \
		$(1)/lib/firmware/psfreedom_payload_no_bdemu.bin
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/shellcode_exec_payload.bin \
		$(1)/lib/firmware/psfreedom_shellcode_exec_payload.bin
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/shellcode_panic.bin \
		$(1)/lib/firmware/psfreedom_shellcode_panic.bin
	( cd $(1)/lib/firmware; \
		$(LN) psfreedom_payload_bdemu.bin psfreedom_payload.bin; \
		$(LN) psfreedom_shellcode_exec_payload.bin psfreedom_shellcode.bin; \
	)
endef

$(eval $(call KernelPackage,psfreedom))
