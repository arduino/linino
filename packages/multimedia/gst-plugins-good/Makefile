#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=gst-plugins-good
PKG_VERSION:=0.10.10
PKG_RELEASE:=4

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://gstreamer.freedesktop.org/src/gst-plugins-good/
PKG_MD5SUM:=a57b4f6bdb9a4a00351f9da74de35ae9
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

export PATH:=$(PKG_BUILD_DIR)/bin:$(TARGET_PATH)

#FIXME: Each plugin should be indepently selectable

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

define Package/gst-plugins-good
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=gst-plugins-good
  URL:=http://gstreamer.freedesktop.org/
  DEPENDS:=+gstreamer +liboil +pango +cairo +libpng +taglib +libspeex +libjpeg +zlib +gst-plugins-base
endef

define Package/gst-plugins-good/description
	gstreamer good plugins
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-examples \
		--disable-esd \
		--disable-gconf \
		--disable-gconftool \
		--disable-shout2 \
		--disable-aalib \
		--disable-oss \
		--disable-hal \
		--disable-dv \
		--disable-pulse \
		--disable-dv1394 \
		--disable-soup \
		--disable-osx_audio \
		--disable-osx_video \
		--disable-directdraw \
		--disable-directshow \
		--disable-sunaudio \
	)
	mkdir -p $(PKG_BUILD_DIR)/bin
	touch $(PKG_BUILD_DIR)/bin/gtkdoc-rebase
	chmod +x $(PKG_BUILD_DIR)/bin/gtkdoc-rebase
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/gstreamer-0.10
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/gstreamer-0.10/*.{so*,a,la} \
		$(1)/usr/lib/gstreamer-0.10
endef

define Package/gst-plugins-good/install
	$(INSTALL_DIR) $(1)/usr/lib/gstreamer-0.10
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/gstreamer-0.10/*.so* \
		$(1)/usr/lib/gstreamer-0.10
endef

$(eval $(call BuildPackage,gst-plugins-good))
