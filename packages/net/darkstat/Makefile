#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=darkstat
PKG_VERSION:=3.0.708
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://dmr.ath.cx/net/darkstat
PKG_MD5SUM:=21fe231f6ec84be082e9d41747dd0fc9

include $(INCLUDE_DIR)/package.mk

define Package/darkstat
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap +zlib
  TITLE:=Network bandwith monitor
  URL:=http://dmr.ath.cx/net/darkstat/
endef

define Package/darkstat/description
	darkstat is a packet sniffer that runs as a background process on a
	cable/DSL router, gathers all sorts of statistics about network usage,
	and serves them over HTTP.
endef

CONFIGURE_ARGS += \
	--with-chroot-dir /var/empty

define Build/Compile
	mkdir -p $(PKG_INSTALL_DIR)
	$(HOSTCC) $(PKG_BUILD_DIR)/static/c-ify.c \
		-o $(PKG_BUILD_DIR)/c-ify
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/darkstat/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/darkstat $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/darkstat.init $(1)/etc/init.d/darkstat
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/darkstat.conf $(1)/etc/config/darkstat
endef

$(eval $(call BuildPackage,darkstat))
