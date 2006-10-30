#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ctorrent
PKG_VERSION:=1.3.4-dnh2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.rahul.net/dholmes/ctorrent/
PKG_MD5SUM:=6635e2d0d0ee21faeb85d95cd93c137b
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-dnh2
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

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
   
define Build/Configure
	$(call Build/Configure/Default, \
		, \
		CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/openssl" \
		CXXFLAGS="$$$$CXXFLAGS -fno-builtin -fno-rtti -nostdinc++" \
		LIBS="-nodefaultlibs -lcrypto -luClibc++ -lm -lc -lgcc" \
	)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef
	
define Package/ctorrent/install	
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ctorrent $(1)/usr/bin/
endef

$(eval $(call BuildPackage,ctorrent))
