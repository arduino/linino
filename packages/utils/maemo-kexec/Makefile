#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=maemo-kexec
PKG_VERSION:=0.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/maemo-kexec
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=@TARGET_omap24xx +kexec-tools
  TITLE:=Kexec Maemo from OpenWRT
  MENU:=1
endef

define Package/maemo-kexec/description
 Kexec Maemo from OpenWRT.
 The Maemo kernel image must be provided and the Maemo rootfs
 must be in the rootfs MTD partition.
endef

define Package/maemo-kexec/config
	source "$(SOURCE)/Config.in"
endef

define Build/Compile
endef

define Package/maemo-kexec/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_DIR) $(1)/boot
	$(INSTALL_BIN) ./files/sbin/boot-maemo $(1)/sbin/
	# --- COPYING MAEMO zImage ---
	# If this fails, please check CONFIG_MAEMO_KEXEC_KERNEL_PATH
	$(INSTALL_DATA) $(CONFIG_MAEMO_KEXEC_KERNEL_PATH) $(1)/boot/maemo.zImage
endef

$(eval $(call BuildPackage,maemo-kexec))
