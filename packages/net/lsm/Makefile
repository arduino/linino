# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lsm
PKG_VERSION:=0.53
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://lsm.foobar.fi/download
PKG_MD5SUM:=983911b434a3c649fcefdc99e6ea2f37

include $(INCLUDE_DIR)/package.mk

define Package/lsm
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+ssmtp
  TITLE:=A link state monitor
  URL:=http://lsm.foobar.fi/
endef

define Package/lsm/description
	lsm is a link state monitor for carrying out actions when a link 
	transistions from the up to down state or vice versa.
endef

define Package/lsm/conffiles
/etc/lsm/lsm.conf
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	rmdir $(PKG_BUILD_DIR)
	mv $(BUILD_DIR)/lsm $(PKG_BUILD_DIR)
endef

define Build/Compile
	echo sed -ie 's/\$$$$(CC)/mipsel-openwrt-linux-uclibc-gcc/g' $(PKG_BUILD_DIR)/Makefile
	$(MAKE) -C $(PKG_BUILD_DIR) CC=$(TARGET_CC)
endef

define Package/lsm/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lsm $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/lsm
	$(INSTALL_DIR) $(1)/etc/lsm/script.d
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DATA) ./files/lsm.conf $(1)/etc/lsm/lsm.conf
	$(INSTALL_BIN) ./files/lsm_script $(1)/etc/lsm/script
	$(INSTALL_BIN) ./files/lsm.init $(1)/etc/init.d/lsm
endef

$(eval $(call BuildPackage,lsm))
