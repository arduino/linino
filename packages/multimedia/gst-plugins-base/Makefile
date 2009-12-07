#
# Copyright (C) 2008-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gst-plugins-base
PKG_VERSION:=0.10.25
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://gstreamer.freedesktop.org/src/gst-plugins-base/
PKG_MD5SUM:=d29669dd79276c5cd94e1613c03cd9ab
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

define Package/gst-plugins-base/Default
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:=+gstreamer +liboil +gst-plugins-base-libs
  TITLE:=gst-plugins-base
  URL:=http://gstreamer.freedesktop.org/
endef

define Package/gst-plugins-base-libs
  $(call Package/gst-plugins-base/Default)
  DEPENDS:=+gstreamer +liboil
  TITLE:=gstreamber plugins base libraries
endef

define Package/gst-plugins-base-ogg
  $(call Package/gst-plugins-base/Default)
  TITLE += (ogg)
  DEPENDS += +libogg
endef

define Package/gst-plugins-base-ogg/description
  gstreamer OGG plugins
endef

define Package/gst-plugins-base-vorbis
  $(call Package/gst-plugins-base/Default)
  TITLE+= (vorbis)
  DEPENDS:=+gst-plugins-base-ogg +libvorbis
endef

define Package/gst-plugins-base-vorbis/description
  gstreamer Vorbis plugins
endef

define Package/gst-plugins-base-theora
  $(call Package/gst-plugins-base/Default)
  TITLE+= (theora)
  DEPENDS:=+gst-plugins-base-ogg +libtheora
endef

define Package/gst-plugins-base-theora/description
  gstreamer Theora plugins
endef

define Package/gst-plugins-base-alsa
  $(call Package/gst-plugins-base/Default)
  TITLE+= (alsa)
endef

define Package/gst-plugins-base-alsa/description
  gstreamer ALSA plugins
endef

define Package/gst-plugins-base-app
  $(call Package/gst-plugins-base/Default)
  TITLE+= (app)
endef

define Package/gst-plugins-base-app/description
  gstreamer app plugins
endef

define Package/gst-plugins-base-audioconvert
  $(call Package/gst-plugins-base/Default)
  TITLE+= (audioconvert)
endef

define Package/gst-plugins-base-audioconvert/description
  gstreamer audioconvert plugins
endef

define Package/gst-plugins-base-gio
  $(call Package/gst-plugins-base/Default)
  TITLE+= (gio)
  DEPENDS += +glib2
endef

define Package/gst-plugins-base-gio/description
  gstreamer GIO plugins
endef

define Package/gst-plugins-base-typefindfunctions
  $(call Package/gst-plugins-base/Default)
  TITLE+= (typefind)
endef

define Package/gst-plugins-base-typefindfunctions/description
  gstreamer typefind plugins
endef

define Package/gst-plugins-base-decodebin
  $(call Package/gst-plugins-base/Default)
  TITLE+= (decodebin)
endef

define Package/gst-plugins-base-decodebin/description
  gstreamer decodebin plugins
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
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,la} \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/gstreamer-0.10
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/gstreamer-0.10/*.{so*,la} \
		$(1)/usr/lib/gstreamer-0.10/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/gst-plugins-base-libs/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib
endef

define BuildPlugin
  define Package/gst-plugins-base-$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib/gstreamer-0.10
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/gstreamer-0.10/libgst$(1).so \
		$$(1)/usr/lib/gstreamer-0.10/
  endef

  $$(eval $$(call BuildPackage,gst-plugins-base-$(1)))
endef

$(eval $(call BuildPlugin,ogg))
$(eval $(call BuildPlugin,vorbis))
$(eval $(call BuildPlugin,theora))
$(eval $(call BuildPlugin,alsa))
$(eval $(call BuildPlugin,app))
$(eval $(call BuildPlugin,audioconvert))
$(eval $(call BuildPlugin,gio))
$(eval $(call BuildPlugin,typefindfunctions))
$(eval $(call BuildPlugin,decodebin))
$(eval $(call BuildPackage,gst-plugins-base-libs))
