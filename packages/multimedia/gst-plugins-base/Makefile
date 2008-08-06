#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gst-plugins-base
PKG_VERSION:=0.10.12
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://gstreamer.freedesktop.org/src/gst-plugins-base/
PKG_FIXUP:=libtool
PKG_MD5SUM:=0ee35455a4eb507bcfbfcd44d9e15d1e

include $(INCLUDE_DIR)/package.mk

EXTRA_CFLAGS+= -I$(STAGING_DIR)/usr/lib/libintl/include/ -I$(STAGING_DIR)/usr/lib/libiconv/include/ -I$(STAGING_DIR)/usr/include/gtk-2.0/gdk
EXTRA_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/usr/lib/libintl/lib/ -L$(STAGING_DIR)/usr/lib/libiconv/lib/

define Package/gst-plugins-base
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=gst-plugins-base
  URL:=http://gst-plugins-base.freedesktop.org/
  DEPENDS:=gstreamer +liboil +pango +gtk2
endef

define Package/gst-plugins-base/description
	gstreamer base plugins
endef

define Build/Configure
	$(call Build/Configure/Default,\
		--disable-ogg \
		--disable-vorbis \
		--without-x \
	)
endef

define Build/Compile
	cd $(PKG_BUILD_DIR) ; DESTDIR=$(PKG_INSTALL_DIR) $(MAKE) all install
endef

define Build/InstallDev
	mkdir -p $(1)
	cp -r $(PKG_INSTALL_DIR)/* $(1)
endef

define Package/gst-plugins-base/install
	mkdir -p $(1)
	cp -r $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,gst-plugins-base))
