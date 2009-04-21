# 
# Copyright (C) 2007-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=mpd
PKG_VERSION:=0.14
PKG_RELEASE:=1.1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/musicpd
PKG_MD5SUM:=ee282390146ead636f3d992399ed3c20

include $(INCLUDE_DIR)/package.mk

define Package/mpd
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libflac +libid3tag +libmad +libvorbisidec +glib2 +CONFIG_PACKAGE_kmod-sound-core:alsa-lib
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

CONFIGURE_ARGS += \
	--disable-aac \
	--disable-ao \
	--disable-audiofile \
	--disable-curl \
	--disable-ffmpeg \
	--enable-flac \
	--disable-ipv6 \
	--disable-jack \
	--disable-lame \
	--disable-lametest \
	--disable-lsr \
	--disable-mod \
	--disable-mpc \
	--disable-mvp \
	--disable-oggflac \
	--disable-pulse \
	--disable-shout-mp3 \
	--disable-shout-ogg \
	--disable-wavpack \
	--with-tremor="$(STAGING_DIR)/usr" \
	--with-zeroconf=no \

ifneq ($(CONFIG_PACKAGE_kmod-sound-core),)
  CONFIGURE_ARGS += --enable-alsa
else
  CONFIGURE_ARGS += --disable-alsa
endif

CONFIGURE_VARS += \
	FLAC_CFLAGS="-I$(STAGING_DIR)/usr/include" \
	FLAC_LIBS="-L$(STAGING_DIR)/usr/lib -lFLAC" \
	ID3TAG_CFLAGS="-I$(STAGING_DIR)/usr/include" \
	ID3TAG_LIBS="-L$(STAGING_DIR)/usr/lib -lz -lid3tag" \
	MAD_CFLAGS="-I$(STAGING_DIR)/usr/include" \
	MAD_LIBS="-L$(STAGING_DIR)/usr/lib -lmad" \
	OGGVORBIS_CFLAGS="-I$(STAGING_DIR)/usr/include" \
	OGGVORBIS_LIBS="-L$(STAGING_DIR)/usr/lib -lvorbisidec" \
	GLIB_CFLAGS="-I$(STAGING_DIR)/usr/include/glib-2.0 -I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
	GLIB_LIBS="-L$(STAGING_DIR)/usr/lib/libintl/lib -lintl -L$(STAGING_DIR)/usr/lib/libiconv/lib -liconv -L$(STAGING_DIR)/usr/lib -lglib-2.0 -lgthread-2.0 -pthread"

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/mpd/install
	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_BUILD_DIR)/doc/mpdconf.example $(1)/etc/mpd.conf
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mpd $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/mpd.init $(1)/etc/init.d/mpd
endef

$(eval $(call BuildPackage,mpd))
