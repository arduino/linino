#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=aiccu
PKG_VERSION:=2006.07.25
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.sixxs.net/archive/sixxs/aiccu/unix
PKG_MD5SUM:=0df76e92eb34f4ce8aa3cfcf6896f271
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/aiccu
  SECTION:=ipv6
  CATEGORY:=IPv6
  TITLE:=SixXS Automatic IPv6 Connectivity Client Utility
  URL:=http://www.sixxs.net/archive/sixxs/aiccu/unix
endef

define Build/Configure
	$(SED) "s,strip,$(STRIP)," $(PKG_BUILD_DIR)/unix-console/Makefile
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
	        CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-lpthread" DEBUG=0
endef

define Package/aiccu/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/unix-console/$(PKG_NAME) $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	install -m 644 $(PKG_BUILD_DIR)/doc/aiccu.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/aiccu.init $(1)/etc/init.d/aiccu
endef

$(eval $(call BuildPackage,aiccu))
