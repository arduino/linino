#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gnome-python-desktop
PKG_VERSION:=2.16.0
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://ftp.gnome.org/pub/GNOME/sources/gnome-python-desktop/2.16/
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

EXTRA_CFLAGS += \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/libiconv/include

EXTRA_LDFLAGS += \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

define Package/gnome-python-desktop
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Gnome Python Bindings
  URL:=http://ftp.gnome.org/
  DEPENDS:=+libwnck +python-gtk
endef

define Package/gnome-python-desktop/description
  python bindings for gnome
endef

MAKE_FLAGS += DESTDIR=$(PKG_INSTALL_DIR) all install

define Build/InstallDev
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
endef

define Package/gnome-python-desktop/install
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,gnome-python-desktop))
