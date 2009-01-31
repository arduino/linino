#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libshout
PKG_VERSION:=2.2.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.us.xiph.org/releases/libshout/
PKG_MD5SUM:=4f75fc9901c724b712c371c9a1e782d3

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/libshout
  SECTION:=libs
  DEPENDS:=+libvorbisidec
  CATEGORY:=Libraries
  TITLE:=Library which can be used to write a source client like ices
  URL:=http://www.icecast.org/download.php
endef

define Package/libshout/description
	libshout allows applications to easily communicate and broadcast
	to an Icecast streaming media server. It handles the socket connections,
	metadata communication, and data streaming for the calling application,
	and lets developers focus on feature sets instead of implementation
	details.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		VORBIS_CFLAGS="-I$(STAGING_DIR)/usr/include/tremor/"\
		VORBIS_LIBS="-L$(STAGING_DIR)/usr/lib" \
		--enable-shared \
		--enable-static \
	)
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include/shout
	$(CP) $(PKG_INSTALL_DIR)/usr/include/shout/shout.h $(1)/usr/include/shout
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libshout.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/shout.pc $(1)/usr/lib/pkgconfig/		
endef

define Package/libshout/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libshout.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libshout))
