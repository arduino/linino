#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=spawn-fcgi
PKG_VERSION:=1.6.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.lighttpd.net/download/
PKG_MD5SUM:=f74a8f4d8e379c53926b5eeef84b381c

PKG_INSTALL = 1

include $(INCLUDE_DIR)/package.mk

define Package/spawn-fcgi
  SUBMENU:=Web
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Tool to spawn fastcgi applications
  URL:=http://www.lighttpd.net/
endef

define Package/spawn-fcgi/description
	spawn-fcgi is used to spawn fastcgi applications
endef

define Package/spawn-fcgi/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/spawn-fcgi $(1)/usr/bin/
endef

$(eval $(call BuildPackage,spawn-fcgi))
