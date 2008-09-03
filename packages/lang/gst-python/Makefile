#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gst-python
PKG_VERSION:=0.10.11
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://gstreamer.freedesktop.org/src/gst-python/
PKG_FIXUP:=libtool
PKG_MD5SUM:=2c633a06c140024dd0d59db1e87e6945

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

TARGET_CFLAGS += $(FPIC) \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/libiconv/include

TARGET_LDFLAGS += \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

CONFIGURE_VARS += PYTHON=/usr/bin/python

define Package/gst-python
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python bindings for dbus
  URL:=http://gstreamer.freedesktop.org/
  DEPENDS:=+gstreamer +gst-plugins-base +python-gtk
endef

define Package/gst-python/description
  python bindings for dbus 
endef

define Build/InstallDev
	mkdir -p $(1)
	cp -r $(PKG_INSTALL_DIR)/* $(1)
endef

define Package/gst-python/install
	mkdir -p $(1)
	cp -r $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,gst-python))
