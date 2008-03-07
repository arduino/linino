# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=bemused-mpd
PKG_VERSION:=r047
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.origo.ethz.ch/bemused-lnx-mpdhack/382
PKG_MD5SUM:=f40715812d59d2ab1bd93f96c5e8818b

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/bemusedlinuxserver
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+bluez-libs +glib1 +mpd +libstdcpp
  TITLE:=Bemused linux server
  URL:=http://bemused-lnx-mpdhack.origo.ethz.ch/
endef

define Package/bemusedlinuxserver/description
    Bemused is a system which allows you to control your music collection 
    from your phone, using Bluetooth.
    This is the MPD hack version.
    Check http://jamse.sourceforge.net/ for a mobile phone client.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
	$(TARGET_CONFIGURE_OPTS) \
	CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CPPFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS) " \
	CPPFLAGS="$(TARGET_CPPFLAGS)" \
	INCL="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/usr/include/glib-1.2 -I$(STAGING_DIR)/usr/lib/glib/include" \
	MYLIBS="-lbluetooth -lglib"
	$(STRIP) $(PKG_BUILD_DIR)/bemusedlinuxserver
endef

define Package/bemusedlinuxserver/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bemusedlinuxserver $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/bemused.conf $(1)/etc/bemused.conf
	$(INSTALL_CONF) ./files/bemused-bookmarks $(1)/etc/bemused-bookmarks
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/bemused.init $(1)/etc/init.d/bemused
endef

$(eval $(call BuildPackage,bemusedlinuxserver))
