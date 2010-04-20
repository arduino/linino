#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mpd
PKG_VERSION:=0.15.8
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/musicpd
PKG_MD5SUM:=824e1ce46c0f468865d9e5e403cdaf5d

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/mpd
  SECTION:=sound
  CATEGORY:=Sound
  # libvorbis and therewith libogg are needed for shout support
  DEPENDS:=+libflac +BUILD_PATENTED:libfaad2 +BUILD_PATENTED:libmad +libvorbisidec +libpthread +glib2 +libmms +libcurl +libshout +alsa-lib +libvorbis
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

TARGET_CFLAGS += \
	-I$(STAGING_DIR)/usr/lib/libintl/include/ \
	-I$(STAGING_DIR)/usr/lib/libiconv/include/

TARGET_LDFLAGS += \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib/ \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib/

# oggflac is not compatible with tremor
CONFIGURE_ARGS+= \
	--$(if $(CONFIG_BUILD_PATENTED),enable-mad,disable-mad) \
	--enable-alsa \
	--enable-audiofile \
	--disable-mpc \
	--$(if $(CONFIG_BUILD_PATENTED),enable-aac,disable-aac) \
	--disable-lsr \
	--disable-ao \
	--disable-mvp \
	--disable-lame-encoder \
	--disable-ffmpeg \
	--enable-flac \
	--enable-vorbis \
	--disable-oggflac \
	--disable-sqlite \
	--enable-shout \
	--enable-id3 \
	--enable-lastfm \
	--enable-mms \
	--enable-curl \
	--disable-oss \
	--enable-aac \
	--with-zeroconf=no \
	--disable-libOggFLACtest \
	--disable-test \
	--with-tremor=yes \
	--with-faad="$(STAGING_DIR)/usr" \

# use gcc instead of g++ to avoid unnecessary linking against libstdc++
TARGET_CXX=$(TARGET_CC)

TARGET_CFLAGS+=-std=gnu99


CONFIGURE_VARS += \
	FLAC_CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/FLAC" \
	FLAC_LIBS="$(TARGET_LDFLAGS) -lFLAC" \
	$(if $(CONFIG_BUILD_PATENTED),MAD_CFLAGS="$(TARGET_CFLAGS)") \
	$(if $(CONFIG_BUILD_PATENTED),MAD_LIBS="$(TARGET_LDFLAGS) -lmad") \

define Package/mpd/install
	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_BUILD_DIR)/doc/mpdconf.example $(1)/etc/mpd.conf
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mpd $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/mpd.init $(1)/etc/init.d/mpd
endef

$(eval $(call BuildPackage,mpd))
