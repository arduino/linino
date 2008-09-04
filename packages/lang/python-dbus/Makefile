#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dbus-python
PKG_VERSION:=0.83.0
PKG_RELEASE:=2
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://dbus.freedesktop.org/releases/dbus-python/
PKG_MD5SUM:=562c78876219bf458d79a041af18293d
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

EXTRA_CFLAGS += \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/libiconv/include

EXTRA_LDFLAGS += \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

define Package/dbus-python
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Python bindings for dbus
  URL:=http://dbus.freedesktop.org/
  DEPENDS:=python-core +libdbus-glib
endef

define Package/dbus-python/description
  Python bindings for dbus.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/dbus-1.0/dbus/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/include/dbus-1.0/dbus/* \
		$(1)/usr/include/dbus-1.0/dbus/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* $(1)/usr/lib/pkgconfig
endef

define Package/dbus-python/install
	$(INSTALL_DIR) $(1)/usr/lib/python2.5/site-packages/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/python2.5/site-packages/*.{py,so,a} \
		$(1)/usr/lib/python2.5/site-packages/
	$(INSTALL_DIR) $(1)/usr/lib/python2.5/site-packages/dbus/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/python2.5/site-packages/dbus/*.py \
		$(1)/usr/lib/python2.5/site-packages/dbus/
	$(INSTALL_DIR) $(1)/usr/lib/python2.5/site-packages/dbus/mainloop/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/python2.5/site-packages/dbus/mainloop/*.py \
		$(1)/usr/lib/python2.5/site-packages/dbus/mainloop/
endef

$(eval $(call BuildPackage,dbus-python))
