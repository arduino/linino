#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=httping
PKG_VERSION:=1.3.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://www.vanheusden.com/httping/
PKG_MD5SUM:=fb742d577d3e7a8ea75cf97f7eb802f2

include $(INCLUDE_DIR)/package.mk

define Package/httping
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl
  TITLE:=Httping is like 'ping' but for http-requests
  URL:=http://www.vanheusden.com/httping/
endef

define Package/httping/description
	Give it an url, and it'll show you how long it takes to connect, send a
	request and retrieve the reply (only the headers). Be aware that the
	transmission across the network also takes time!
endef

define Build/Compile
	$(call Build/Compile/Default, \
		CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS)" \
	)
endef

define Package/httping/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/httping $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,httping))
