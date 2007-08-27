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

include $(INCLUDE_DIR)/package.mk

define Package/ctorrent
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl +uclibcxx
  TITLE:=console-based BitTorrent client
  DESCRIPTION:=\
  	CTorrent is a BitTorrent client written in the C programming language, known to \\\
	be a very robust and mature programming language, which produces fast and \\\
	optimized application.
  URL:=http://www.rahul.net/dholmes/ctorrent/
endef
   
CONFIGURE_ARGS += \
	CPPFLAGS="$(TARGET_CPPFLAGS) -I$(STAGING_DIR)/usr/include/openssl" \
	CXXFLAGS="$(TARGET_CFLAGS) -fno-builtin -fno-rtti -nostdinc++" \
	LIBS="-nodefaultlibs -lcrypto -luClibc++ -lm -lc -lgcc"

define Package/ctorrent/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,ctorrent))
