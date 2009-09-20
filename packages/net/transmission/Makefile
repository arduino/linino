#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=transmission
PKG_VERSION:=1.75
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://mirrors.m0k.org/transmission/files
PKG_MD5SUM:=ec09b76ca941f5c389d8dd4f469f1fa6

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/transmission/template
  SUBMENU:=BitTorrent
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A free, lightweight BitTorrent client
  URL:=http://www.transmissionbt.com
endef

define Package/transmission-daemon
  $(call Package/transmission/template)
  DEPENDS:=+libcurl +libopenssl +libpthread +libevent
  MENU:=1
endef

define Package/transmission-cli
  $(call Package/transmission/template)
  DEPENDS:=transmission-daemon
endef

define Package/transmission-web
  $(call Package/transmission/template)
  DEPENDS:=transmission-daemon
endef

define Package/transmission-daemon/description
 Transmission is a simple BitTorrent client.
 It features a very simple, intuitive interface
 on top on an efficient, cross-platform back-end.
 This package contains the daemon itself.
endef

define Package/transmission-cli/description
 CLI utilities for transmission.
endef

define Package/transmission-web/description
 Webinterface resources for transmission.
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

define Package/transmission-daemon/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/daemon/transmission-daemon $(1)/usr/sbin/
endef

define Package/transmission-cli/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cli/transmissioncli $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/daemon/transmission-remote $(1)/usr/bin/
endef

define Package/transmission-web/install
	$(INSTALL_DIR) $(1)/usr/share/transmission
	rm -rf `find $(PKG_BUILD_DIR)/web -type d -name .svn`
	cp -rf $(PKG_BUILD_DIR)/web $(1)/usr/share/transmission
endef

$(eval $(call BuildPackage,transmission-daemon))
$(eval $(call BuildPackage,transmission-cli))
$(eval $(call BuildPackage,transmission-web))
