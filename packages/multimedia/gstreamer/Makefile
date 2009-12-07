#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gstreamer
PKG_VERSION:=0.10.25
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://gstreamer.freedesktop.org/src/gstreamer/
PKG_MD5SUM:=88544e034a051baf472983791d233076
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

export PATH:=$(PKG_BUILD_DIR)/bin:$(TARGET_PATH)

PKG_INSTALL=1

EXTRA_CFLAGS+= \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/libiconv/include

EXTRA_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

define Package/gstreamer
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=gstreamer
  URL:=http://gstreamer.freedesktop.org/
  DEPENDS:=+libxml2 +glib2
endef

define Package/gstreamer/description
	A framework for streaming media.
endef

define Build/Configure
	$(call Build/Configure/Default,\
		--disable-tests \
		--disable-examples \
	)
	mkdir -p $(PKG_BUILD_DIR)/bin
	touch $(PKG_BUILD_DIR)/bin/gtkdoc-rebase
	chmod +x $(PKG_BUILD_DIR)/bin/gtkdoc-rebase
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,la} \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/gstreamer-0.10/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/gstreamer-0.10/*.{so*,la} \
		$(1)/usr/lib/gstreamer-0.10

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/

	$(INSTALL_DIR) $(2)/share/aclocal/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/aclocal/* \
		$(2)/share/aclocal/
endef

define Package/gstreamer/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/gstreamer-0.10/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/gstreamer-0.10/*.so* \
		$(1)/usr/lib/gstreamer-0.10
endef

$(eval $(call BuildPackage,gstreamer))
