#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=openslp
PKG_VERSION:=1.2.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://prdownloads.sourceforge.net/openslp/
PKG_MD5SUM:=ff9999d1b44017281dd00ed2c4d32330

include $(INCLUDE_DIR)/package.mk

define Package/openslp
  SECTION:=net
  CATEGORY:=Network
  TITLE:=openslp
endef

#CONFIGURE_ARGS += \
#	--disable-libwrap 

#MAKE_FLAGS += \
#	CFLAGS="$(TARGET_CFLAGS) -Wall -D_REENTRANT" \
#	all

define Package/openslp/install
	$(INSTALL_DIR) $(1)/etc $(1)/lib $(1)/usr/bin $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/slpd/slpd $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/slptool/.libs/slptool $(1)/usr/bin/
	$(CP) $(PKG_BUILD_DIR)/libslp/.libs/libslp.so* $(1)/lib
	$(INSTALL_DATA) ./files/etc/slp.* $(1)/etc
	$(INSTALL_BIN) ./files/etc/init.d/* $(1)/etc/init.d
endef

$(eval $(call BuildPackage,openslp))
