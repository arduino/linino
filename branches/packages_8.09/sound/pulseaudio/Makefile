#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=pulseaudio
PKG_VERSION:=0.9.13
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://0pointer.de/lennart/projects/pulseaudio/
PKG_MD5SUM:=279fb92f08393a6a992d55e3ac9a006b

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/pulseaudio
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libspeex +libgdbm +liboil +libsamplerate +libsndfile +libatomicops +libltdl +dbus +libintl +libiconv @BROKEN
  TITLE:=Network sound server
  URL:=http://www.pulseaudio.org
endef

CONFIGURE_ARGS += \
	--with-system-user=root \
	--with-system-group=root \
	--with-realtime-group=root \
	--with-access-group=root \
	--without-x \
	--disable-dbus \
	--disable-hal \
	--disable-gconf \
	--disable-tcpwrap \
	--disable-nls \
	--disable-solaris \
	--disable-glib2 \
	--disable-jack \
	--disable-asyncns \
	--disable-polkit \
	--disable-samplerate \
	--disable-lirc \
	--disable-bluez \
	--without-caps

CONFIGURE_VARS += \
	PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"

SUPP_LIBS:=-L$(STAGING_DIR)/usr/lib/libintl/lib -L$(STAGING_DIR)/usr/lib/libiconv/lib

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib $(SUPP_LIBS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		LIBLTDL="$(STAGING_DIR)/usr/lib/libltdl.la" \
		X_CFLAGS="" \
		all install
endef

define Package/pulseaudio/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,pulseaudio))
