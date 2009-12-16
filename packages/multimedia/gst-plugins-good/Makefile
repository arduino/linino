#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gst-plugins-good
PKG_VERSION:=0.10.17
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://gstreamer.freedesktop.org/src/gst-plugins-good/
PKG_MD5SUM:=833546cd2b8bbf86b8ed083b00897918
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

define Package/gst-plugins-good/Default
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:=+gstreamer +gst-plugins-base-libgsttag +gst-plugins-base-libgstpbutils
  TITLE:=gst-plugins-good
  URL:=http://gstreamer.freedesktop.org/
endef

define Package/gst-plugins-good-flac
  $(call Package/gst-plugins-good/Default)
  TITLE+= (flac)
  DEPENDS += +libflac
endef

define Package/gst-plugins-good-flac/description
  gstreamer FLAC plugins
endef

define Package/gst-plugins-good-id3demux
  $(call Package/gst-plugins-good/Default)
  TITLE+= (id3demux)
  DEPENDS += +libid3tag
endef

define Package/gst-plugins-good-id3demux/description
  gstreamer FLAC plugins
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
		--without-x \
	)
	mkdir -p $(PKG_BUILD_DIR)/bin
	touch $(PKG_BUILD_DIR)/bin/gtkdoc-rebase
	chmod +x $(PKG_BUILD_DIR)/bin/gtkdoc-rebase
endef

define BuildPlugin
  define Package/gst-plugins-good-$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib/gstreamer-0.10
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/gstreamer-0.10/libgst$(1).so \
		$$(1)/usr/lib/gstreamer-0.10
  endef

  $$(eval $$(call BuildPackage,gst-plugins-good-$(1)))
endef

$(eval $(call BuildPlugin,id3demux))
