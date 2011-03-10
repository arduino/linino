#
# Copyright (C) 2007-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mpd
PKG_VERSION:=0.16.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/musicpd
PKG_MD5SUM:=4d07459125ab0154c5b4fe364331498a

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/mpd
  SECTION:=sound
  CATEGORY:=Sound
  TITLE:=Music Player Daemon
  URL:=http://www.musicpd.org/
# libvorbis and therewith libogg are needed for shout support
  DEPENDS:= \
	+AUDIO_SUPPORT:alsa-lib \
	+libaudiofile \
	+BUILD_PATENTED:libfaad2 +BUILD_PATENTED:libmad \
	+glib2 +libcurl +libflac +libmms +libpthread +libshout \
	+libvorbis +libvorbisidec +libid3tag
endef

define Package/mpd/description
 MPD is a music player supporting flac, mp3 and ogg files. It is
 typically controlled over a network using one of it's many clients
 including mpc(console), gmpc(gnome), phpmp(php), etc...
endef

define Package/mpd/conffiles
/etc/avahi/services/mpd.service
/etc/mpd.conf
endef

# oggflac is not compatible with tremor
CONFIGURE_ARGS += \
	$(call autoconf_bool,CONFIG_BUILD_PATENTED,mad) \
	$(call autoconf_bool,CONFIG_AUDIO_SUPPORT,alsa) \
	--enable-audiofile \
	--disable-mpc \
	$(call autoconf_bool,CONFIG_BUILD_PATENTED,aac) \
	--disable-lsr \
	--disable-ao \
	--disable-mvp \
	--disable-lame-encoder \
	--disable-ffmpeg \
	--enable-flac \
	--enable-vorbis \
	--disable-oggflac \
	--disable-cue \
	--disable-jack \
	--disable-modplug \
	--disable-pulse \
	--disable-sidplay \
	--disable-sqlite \
	--enable-shout \
	--enable-id3 \
	--enable-lastfm \
	--enable-mms \
	--enable-curl \
	--disable-oss \
	--with-zeroconf=no \
	--disable-test \
	--with-tremor=yes \
	--with-faad="$(STAGING_DIR)/usr" \

CONFIGURE_VARS += \
	FLAC_CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/FLAC" \
	FLAC_LIBS="$(TARGET_LDFLAGS) -lFLAC" \
	$(if $(CONFIG_BUILD_PATENTED),MAD_CFLAGS="$(TARGET_CFLAGS)") \
	$(if $(CONFIG_BUILD_PATENTED),MAD_LIBS="$(TARGET_LDFLAGS) -lmad") \

TARGET_CFLAGS += -std=gnu99
TARGET_LDFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

# use gcc instead of g++ to avoid unnecessary linking against libstdc++
TARGET_CXX:=$(TARGET_CC)

define Package/mpd/install
	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_BUILD_DIR)/doc/mpdconf.example $(1)/etc/mpd.conf
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mpd $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/mpd.init $(1)/etc/init.d/mpd
	$(INSTALL_DIR) $(1)/etc/avahi/services
	$(INSTALL_DATA) ./files/mpd.service $(1)/etc/avahi/services/
endef

$(eval $(call BuildPackage,mpd))
