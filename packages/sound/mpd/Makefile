# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=mpd
PKG_VERSION:=0.13.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.musicpd.org/uploads/files/
PKG_MD5SUM:=0b33bdb9d706439949344073e90f812a

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/mpd
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libflac +libid3tag +libmad +libvorbisidec +libpthread +alsa-lib
  TITLE:=Music Player Daemon
  URL:=http://www.musicpd.org/
endef

define Package/mpd/description
	MPD is a music player supporting flac, mp3 and ogg files.
	It is typically controlled over a network using one of it's many 
	clients including mpc(console), gmpc(gnome), phpmp(php) etc.
endef

define Package/mpd/conffiles
/etc/mpd.conf
endef

ifndef CONFIG_PACKAGE_kmod-soundcore
	EXTRA_CONFIG_PARAM:=--disable-alsa
endif

define Build/Configure
	$(call Build/Configure/Default, \
	        $(EXTRA_CONFIG_PARAM) \
		--disable-shout \
	        --disable-mod \
	        --disable-audiofile \
	        --disable-iconv \
	        --disable-mpc \
	        --disable-aac \
	        --disable-oggvorbis \
	        --disable-oggflac \
	        --with-id3tag-includes="$(STAGING_DIR)/usr/include" \
	        --with-id3tag-libraries="$(STAGING_DIR)/usr/lib" \
	        --with-libFLAC-includes="$(STAGING_DIR)/usr/include" \
	        --with-libFLAC-libraries="$(STAGING_DIR)/usr/lib" \
	        --with-mad-includes="$(STAGING_DIR)/usr/include" \
	        --with-mad-libraries="$(STAGING_DIR)/usr/lib" \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/mpd/install
	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_BUILD_DIR)/doc/mpdconf.example $(1)/etc/mpd.conf
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mpd $(1)/usr/bin/
endef

$(eval $(call BuildPackage,mpd))
