#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mdadm
PKG_VERSION:=2.6.7.2
PKG_RELEASE:=1
PKG_MD5SUM:=e4badb4a8ded4344ba0fa785883955d8

PKG_SOURCE_URL:=http://www.kernel.org/pub/linux/utils/raid/mdadm
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz


include $(INCLUDE_DIR)/package.mk

define Package/mdadm
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A tool for managing Soft RAID under Linux
  URL:=http://www.kernel.org/pub/linux/utils/raid/mdadm/
  DEPENDS:=@LINUX_2_6
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS) -DUCLIBC -DHAVE_STDINT_H" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		mdadm mdassemble
endef

define Package/mdadm/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mdadm $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mdassemble $(1)/sbin
endef

$(eval $(call BuildPackage,mdadm))
