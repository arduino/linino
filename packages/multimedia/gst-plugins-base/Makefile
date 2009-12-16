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
  TITLE:=gst-plugins-base
  URL:=http://gstreamer.freedesktop.org/
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:=+gstreamer +libogg
endef

define Package/gst-plugins-base-libgstapp
  $(call Package/gst-plugins-base/Default)
  TITLE+= (libgstapp)
endef

define Package/gst-plugins-base-libgstapp/description
  gstreamer libgstapp
endef

define Package/gst-plugins-base-libgstaudio
  $(call Package/gst-plugins-base/Default)
  TITLE+= (libgstaudio)
endef

define Package/gst-plugins-base-libgstaudio/description
  gstreamer libgstaudio
endef

define Package/gst-plugins-base-libgstinterfaces
  $(call Package/gst-plugins-base/Default)
  TITLE+= (libgstinterfaces)
endef

define Package/gst-plugins-base-libgstinterfaces/description
  gstreamer libgstinterfaces
endef

define Package/gst-plugins-base-libgstpbutils
  $(call Package/gst-plugins-base/Default)
  TITLE+= (libgstpbutils)
endef

define Package/gst-plugins-base-libgstpbutils/description
  gstreamer libgstpbutils
endef

define Package/gst-plugins-base-libgsttag
  $(call Package/gst-plugins-base/Default)
  TITLE+= (libgsttag)
endef

define Package/gst-plugins-base-libgsttag/description
  gstreamer libgsttag
endef

define Package/gst-plugins-base-libgstriff
  $(call Package/gst-plugins-base/Default)
  TITLE+= (libgstriff)
endef

define Package/gst-plugins-base-libgstriff/description
  gstreamer libgstriff
endef

define Package/gst-plugins-base-libgstcdda
  $(call Package/gst-plugins-base/Default)
  TITLE+= (libgstcdda)
endef

define Package/gst-plugins-base-libgstcdda/description
  gstreamer libgstcdda
endef

define Package/gst-plugins-base-libgstfft
  $(call Package/gst-plugins-base/Default)
  TITLE+= (libgstfft)
endef

define Package/gst-plugins-base-libgstfft/description
  gstreamer libgstfft
endef

define Package/gst-plugins-base-libgstnetbuffer
  $(call Package/gst-plugins-base/Default)
  TITLE+= (libgstnetbuffer)
endef

define Package/gst-plugins-base-libgstnetbuffer/description
  gstreamer libgstnetbuffer
endef

define Package/gst-plugins-base-libgstrtp
  $(call Package/gst-plugins-base/Default)
  TITLE+= (libgstrtp)
endef

define Package/gst-plugins-base-libgstrtp/description
  gstreamer libgstrtp
endef

define Package/gst-plugins-base-libgstvideo
  $(call Package/gst-plugins-base/Default)
  TITLE+= (libgstvideo)
endef

define Package/gst-plugins-base-libgstvideo/description
  gstreamer libgstvideo
endef

define Package/gst-plugins-base-libgstvideo
  $(call Package/gst-plugins-base/Default)
  TITLE+= (libgstvideo)
endef

define Package/gst-plugins-base-libgstvideo/description
  gstreamer libgstvideo
endef

define Package/gst-plugins-base-libgstrtsp
  $(call Package/gst-plugins-base/Default)
  TITLE+= (libgstrtsp)
endef

define Package/gst-plugins-base-libgstrtsp/description
  gstreamer libgstrtsp
endef

define Package/gst-plugins-base-libgstsdp
  $(call Package/gst-plugins-base/Default)
  TITLE+= (libgstsdp)
endef

define Package/gst-plugins-base-libgstsdp/description
  gstreamer libgstsdp
endef

define Package/gst-plugins-base-ogg
  $(call Package/gst-plugins-base/Default)
  TITLE+= (ogg)
  DEPENDS += +liboil +gst-plugins-base-libgstriff +gst-plugins-base-libgsttag +gst-plugins-base-libgstaudio +gst-plugins-base-libgstinterfaces
endef

define Package/gst-plugins-base-ogg/description
  gstreamer OGG plugins
endef

define Package/gst-plugins-base-vorbis
  $(call Package/gst-plugins-base/Default)
  TITLE+= (vorbis)
  DEPENDS += +libvorbis +gst-plugins-base-ogg +gst-plugins-base-libgsttag +gst-plugins-base-libgstaudio +gst-plugins-base-libgstinterfaces
endef

define Package/gst-plugins-base-vorbis/description
  gstreamer Vorbis plugins
endef

define Package/gst-plugins-base-theora
  $(call Package/gst-plugins-base/Default)
  TITLE+= (theora)
  DEPENDS += +libogg +libtheora +gst-plugins-base-ogg
endef

define Package/gst-plugins-base-theora/description
  gstreamer Theora plugins
endef

define Package/gst-plugins-base-alsa
  $(call Package/gst-plugins-base/Default)
  TITLE+= (alsa)
  DEPENDS += +liboil
endef

define Package/gst-plugins-base-alsa/description
  gstreamer ALSA plugins
endef

define Package/gst-plugins-base-app
  $(call Package/gst-plugins-base/Default)
  TITLE+= (app)
  DEPENDS += +liboil +gst-plugins-base-libgstapp
endef

define Package/gst-plugins-base-app/description
  gstreamer app plugins
endef

define Package/gst-plugins-base-audioconvert
  $(call Package/gst-plugins-base/Default)
  TITLE+= (audioconvert)
  DEPENDS += +liboil +gst-plugins-base-libgstaudio +gst-plugins-base-libgstinterfaces
endef

define Package/gst-plugins-base-audioconvert/description
  gstreamer audioconvert plugins
endef

define Package/gst-plugins-base-gio
  $(call Package/gst-plugins-base/Default)
  DEPENDS += +liboil +glib2
endef

define Package/gst-plugins-base-gio/description
  gstreamer GIO plugins
endef

define Package/gst-plugins-base-typefindfunctions
  $(call Package/gst-plugins-base/Default)
  TITLE+= (typefind)
  DEPENDS += +liboil
endef

define Package/gst-plugins-base-typefindfunctions/description
  gstreamer typefind plugins
endef

define Package/gst-plugins-base-decodebin
  $(call Package/gst-plugins-base/Default)
  TITLE+= (decodebin)
  DEPENDS += +liboil +gst-plugins-base-libgstpbutils
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

define BuildPlugin
  define Package/gst-plugins-base-$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib/gstreamer-0.10
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/gstreamer-0.10/libgst$(1).so \
		$$(1)/usr/lib/gstreamer-0.10/
  endef

  $$(eval $$(call BuildPackage,gst-plugins-base-$(1)))
endef

define BuildLib
  define Package/gst-plugins-base-libgst$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgst$(1)*.so* \
		$$(1)/usr/lib/
  endef

  $$(eval $$(call BuildPackage,gst-plugins-base-libgst$(1)))
endef

$(eval $(call BuildLib,app))
$(eval $(call BuildLib,audio))
$(eval $(call BuildLib,interfaces))
$(eval $(call BuildLib,pbutils))
$(eval $(call BuildLib,tag))
$(eval $(call BuildLib,riff))
$(eval $(call BuildLib,cdda))
$(eval $(call BuildLib,fft))
$(eval $(call BuildLib,netbuffer))
$(eval $(call BuildLib,rtp))
$(eval $(call BuildLib,video))
$(eval $(call BuildLib,rtsp))
$(eval $(call BuildLib,sdp))

$(eval $(call BuildPlugin,ogg))
$(eval $(call BuildPlugin,vorbis))
$(eval $(call BuildPlugin,theora))
$(eval $(call BuildPlugin,alsa))
$(eval $(call BuildPlugin,app))
$(eval $(call BuildPlugin,audioconvert))
$(eval $(call BuildPlugin,gio))
$(eval $(call BuildPlugin,typefindfunctions))
$(eval $(call BuildPlugin,decodebin))
