#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ctorrent
PKG_VERSION:=dnh3.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.rahul.net/dholmes/ctorrent/
PKG_MD5SUM:=23b37cd7b558ad6a27974b311499bab6

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/ctorrent
  SUBMENU:=BitTorrent
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl +uclibcxx
  TITLE:=console-based BitTorrent client
  URL:=http://www.rahul.net/dholmes/ctorrent/
endef

define Package/ctorrent/description
 CTorrent is a BitTorrent client written in the C programming language, 
 known to be a very robust and mature programming language, which produces 
 fast and optimized application.
endef
   
CONFIGURE_VARS += \
	CXX="g++-uc" \
	CXXFLAGS="$$$$CXXFLAGS -fno-rtti" \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" all install
endef

define Package/ctorrent/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,ctorrent))
