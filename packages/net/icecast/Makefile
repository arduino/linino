#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=icecast
PKG_VERSION:=2.3.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.us.xiph.org/releases/icecast/
PKG_MD5SUM:=35256fbc4a93571662af2ed18fbbfcc5
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/icecast
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libcurl +libvorbisidec +libxml2 +libxslt
  TITLE:=A streaming media server for Ogg/Vorbis and MP3 audio streams
  DESCRIPTION:=\
	Icecast is a streaming media server which currently supports Ogg \\\
	Vorbis and MP3 audio streams. It can be used to create an Internet \\\
	radio station or a privately running jukebox and many things in \\\
	between. It is very versatile in that new formats can be added \\\
	relatively easily and supports open standards for commuincation and \\\
	interaction.
  URL:=http://www.icecast.org/
endef


define Build/Configure
	$(call Build/Configure/Default, \
		--enable-yp \
		--with-curl="yes" \
		--with-curl-config="$(STAGING_DIR)/usr/bin/curl-config" \
		--with-ogg="$(STAGING_DIR)/usr" \
		--with-speex="no" \
		--with-theora="no" \
		--with-vorbis="$(STAGING_DIR)/usr" \
		--with-xslt-config="$(STAGING_DIR)/usr/bin/xslt-config" \
		, \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include/libxml2 " \
	)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/icecast/install	
	install -d -m0755 $(1)/etc
	$(CP) $(PKG_INSTALL_DIR)/etc/icecast.xml $(1)/etc/
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/icecast $(1)/usr/bin/
	install -d -m0755 $(1)/usr/share/icecast
	$(CP) $(PKG_INSTALL_DIR)/usr/share/icecast/admin $(1)/usr/share/icecast/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/icecast/web $(1)/usr/share/icecast/
endef

$(eval $(call BuildPackage,icecast))
