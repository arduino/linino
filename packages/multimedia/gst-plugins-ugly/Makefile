#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gst-plugins-ugly
PKG_VERSION:=0.10.13
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://gstreamer.freedesktop.org/src/gst-plugins-ugly/
PKG_MD5SUM:=1619365247ef9cd7da1cd890285bf87a
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

#export PATH:=$(PKG_BUILD_DIR)/bin:$(TARGET_PATH)

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

define Package/gst-plugins-ugly/Default
  TITLE:=gst-plugins-ugly
  URL:=http://gstreamer.freedesktop.org/
endef

define Package/gst-plugins-ugly-lame
  $(call Package/gst-plugins-ugly/Default)
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE+= (lame)
  DEPENDS:=+gstreamer +lame-lib
endef

define Package/gst-plugins-ugly-lame/description
	gstreamer MP3 encoder plugin
endef

define Package/gst-plugins-ugly-mad
  $(call Package/gst-plugins-ugly/Default)
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE+= (mad)
  DEPENDS:=+gstreamer +gst-plugins-base-libgsttag +gst-plugins-base-libgstaudio +gst-plugins-base-libgstinterfaces +libmad +libid3tag
endef

define Package/gst-plugins-ugly-mad/description
=
	gstreamer MP3 decoder plugins
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-pango \
		--disable-gnome_vfs \
		--disable-examples \
		--disable-cdparanoia \
		--disable-libvisual \
		--disable-oggtest \
		--disable-vorbistest \
		--disable-freetypetest \
		--without-x \
	)
	mkdir -p $(PKG_BUILD_DIR)/bin
	touch $(PKG_BUILD_DIR)/bin/gtkdoc-reugly
	chmod +x $(PKG_BUILD_DIR)/bin/gtkdoc-reugly
endef

define Package/gst-plugins-ugly-lame/install
	$(INSTALL_DIR) $(1)/usr/lib/gstreamer-0.10
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/gstreamer-0.10/libgstlame.so \
		$(1)/usr/lib/gstreamer-0.10
endef

define Package/gst-plugins-ugly-mad/install
	$(INSTALL_DIR) $(1)/usr/lib/gstreamer-0.10
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/gstreamer-0.10/libgstmad.so \
		$(1)/usr/lib/gstreamer-0.10
endef

$(eval $(call BuildPackage,gst-plugins-ugly-lame))
$(eval $(call BuildPackage,gst-plugins-ugly-mad))
