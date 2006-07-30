# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=aiccu
PKG_VERSION:=2005.01.31
PKG_RELEASE:=1
PKG_MD5SUM:=7c3da5feab3d59fb5a99a45203e0ca56

PKG_SOURCE_URL:=http://www.sixxs.net/archive/sixxs/aiccu/unix
PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/aiccu
  SECTION:=net
  CATEGORY:=Network
  TITLE:=SixXS Automatic IPv6 Connectivity Client Utility
  DESCRIPTION:=SixXS Automatic IPv6 Connectivity Client Utility
  URL:=http://www.sixxs.net/archive/sixxs/aiccu/unix
endef

define Build/Configure
$(SED) "s,strip,$(STRIP)," $(PKG_BUILD_DIR)/unix-console/Makefile
endef

define Build/Compile
        rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
	        CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" DEBUG=0
endef

define Package/aiccu/install
	mkdir -p $(1)/usr/sbin $(1)/etc/init.d
	install -m 755 $(PKG_BUILD_DIR)/unix-console/$(PKG_NAME) $(1)/usr/sbin/
	install -m 755 ./files/aiccu.init $(1)/etc/init.d/S51aiccu
	install -m 644 $(PKG_BUILD_DIR)/doc/aiccu.conf $(1)/etc/aiccu.conf
endef

$(eval $(call BuildPackage,aiccu))
