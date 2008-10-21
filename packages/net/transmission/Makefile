#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=transmission
PKG_VERSION:=1.34
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://download.m0k.org/transmission/files
PKG_MD5SUM:=c4ef93639bcb895c1b3d279b2f4e27b3

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/transmission
  SUBMENU:=BitTorrent
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libcurl +libopenssl +libpthread
  TITLE:=A free, lightweight BitTorrent client
  URL:=http://www.transmissionbt.com
endef

define Package/tranmission/description
 Transmission is a simple BitTorrent client.
 It features a very simple, intuitive interface
 on top on an efficient, cross-platform back-end.
endef

CONFIGURE_ARGS += \
	--enable-daemon \
	--disable-gtk \
	--disable-wx \
	--with-wx-config="$(STAGING_DIR)/usr/bin/" \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)"
endef

define Package/transmission/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/daemon/transmission-daemon $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cli/transmissioncli $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/daemon/transmission-remote $(1)/usr/bin/
endef

$(eval $(call BuildPackage,transmission))
