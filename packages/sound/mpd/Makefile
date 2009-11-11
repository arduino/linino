# 
# Copyright (C) 2007-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mpd
PKG_VERSION:=0.15.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/musicpd
PKG_MD5SUM:=addbbcbbf8a24a2ce80db1ba5a1f91ca

include $(INCLUDE_DIR)/package.mk

define Package/mpd
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libflac +libid3tag +libmad +libvorbisidec +libpthread +glib2 +libmms +libcurl +libstdcpp
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

CONFIGURE_ARGS+= \
	--disable-audiofile \
	--disable-mpc \
	--disable-aac \
	--disable-lsr \
	--disable-ao \
	--disable-mvp \
	--disable-lametest \
	--disable-lame-encoder \
	--enable-flac \
	--enable-lastfm \
	--enable-mms \
	--with-tremor="$(STAGING_DIR)/usr/lib" \

ifeq ($(CONFIG_PACKAGE_kmod-sound-core),)
	CONFIGURE_ARGS+= --disable-alsa
endif

CONFIGURE_VARS += \
	CURL_LIBS="-L$(STAGING_DIR)/usr/lib -lssl -lcrypto -lcurl" \
	CURL_CFLAGS="-I$(STAGING_DIR)/usr/include" \
	ID3TAG_LIBS="$(TARGET_LDFLAGS) -lz -lid3tag" \
	ID3TAG_CFLAGS="$(TARGET_CPPFLAGS)" \
	FLAC_LIBS="$(TARGET_LDFLAGS) -lFLAC" \
	FLAC_CFLAGS="-I$(STAGING_DIR)/usr/include/FLAC" \
	MAD_LIBS="$(TARGET_LDFLAGS) -lmad" \
	MAD_CFLAGS="$(TARGET_CPPFLAGS)" \
	OGGVORBIS_LIBS="$(TARGET_LDLFAGS) -lvorbisidec" \
	OGGVORBIS_CFLAGS="$(TARGET_CPPFLAGS)" \
	GLIB_CFLAGS="-I$(STAGING_DIR)/usr/include/glib-2.0 -I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
	GLIB_LIBS="$(TARGET_LDLFAGS) -L$(STAGING_DIR)/usr/lib/libintl/lib -lintl -L$(STAGING_DIR)/usr/lib/libiconv/lib -liconv -lglib-2.0 -lgthread-2.0 -pthread"

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
