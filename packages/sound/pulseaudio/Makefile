#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=pulseaudio
PKG_VERSION:=0.9.10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://0pointer.de/lennart/projects/pulseaudio/
PKG_MD5SUM:=9187ac1b302b9ab45f355242f453882e

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/pulseaudio
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+liboil +libsamplerate +libsndfile +libatomicops +libltdl +dbus +libintl +libiconv @BROKEN
  TITLE:=Network sound server
  URL:=http://www.pulseaudio.org
endef

CONFIGURE_ARGS += \
	--with-system-user=root \
	--with-system-group=root \
	--with-realtime-group=root \
	--with-access-group=root \
	--without-x \
	--enable-static-bins \
	--enable-ltdl-install \
	--disable-dbus \
	--disable-hal \
	--disable-gconf \
	--disable-tcpwrap \

CONFIGURE_VARS += \
	PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
	LIBOIL_CFLAGS="-I$(STAGING_DIR)/usr/include/liboil-0.3/" \
	LIBOIL_LIBS="-L$(STAGING_DIR)/usr/lib/" \

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
