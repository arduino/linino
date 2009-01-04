#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gst-plugins-base
PKG_VERSION:=0.10.21
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://gstreamer.freedesktop.org/src/gst-plugins-base/
PKG_MD5SUM:=0e0cd485311502ad1c0c028148e3186
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

export PATH:=$(PKG_BUILD_DIR)/bin:$(TARGET_PATH)

PKG_INSTALL=1

EXTRA_CFLAGS+= \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/libiconv/include \
	-I$(STAGING_DIR)/usr/include/gtk-2.0/gdk \
	-I$(STAGING_DIR)/usr/include/gstreamer-0.10

EXTRA_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

define Package/gst-plugins-base
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=gst-plugins-base
  URL:=http://gstreamer.freedesktop.org/
  DEPENDS:=+gstreamer +liboil +pango +libXv +libogg +libvorbis +libtheora +alsa-lib
endef

define Package/gst-plugins-base/description
	gstreamer base plugins
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-gnome_vfs \
		--disable-examples \
		--disable-cdparanoia \
		--disable-libvisual \
		--disable-oggtest \
		--disable-vorbistest \
		--disable-freetypetest \
	)
	mkdir -p $(PKG_BUILD_DIR)/bin
	touch $(PKG_BUILD_DIR)/bin/gtkdoc-rebase
	chmod +x $(PKG_BUILD_DIR)/bin/gtkdoc-rebase
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/gstreamer-0.10/gst/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,a,la} \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/gstreamer-0.10
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/gstreamer-0.10/*.{so*,a,la} \
		$(1)/usr/lib/gstreamer-0.10/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/gst-plugins-base/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/gstreamer-0.10
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/gstreamer-0.10/*.so* \
		$(1)/usr/lib/gstreamer-0.10
endef

$(eval $(call BuildPackage,gst-plugins-base))
