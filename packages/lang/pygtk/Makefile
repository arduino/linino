#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pygtk
PKG_VERSION:=2.10.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.gnome.org/pub/GNOME/sources/pygtk/2.10/
PKG_FIXUP:=libtool
PKG_MD5SUM:=d033b7617b9074357f687326b52b6296

include $(INCLUDE_DIR)/package.mk

EXTRA_CFLAGS:=-I$(STAGING_DIR)/usr/include/pycairo/ -I$(STAGING_DIR)/usr/lib/libintl/include/ -I$(STAGING_DIR)/usr/lib/libiconv/include/
EXTRA_LDFLAGS:=-L$(STAGING_DIR)/usr/lib/libintl/lib -L$(STAGING_DIR)/usr/lib/libiconv/lib

define Package/python-gtk
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=GTK bindings to python
  URL:=http://www.pygtk.org/
  DEPENDS:=python-core +python-gobject +gtk2 +pycairo
endef

define Package/python-gtk/description
  API to GTK and glade library from python
endef

define Build/Compile
	PYTHON_HOST="python2.5" \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	$(MAKE) -C $(PKG_BUILD_DIR) \
		SUBDIRS="codegen . gtk" \
		all install
	sed -i "s/UCS4/UCS2/g" $(PKG_INSTALL_DIR)/usr/lib/python2.5/site-packages/gtk-2.0/gtk/_gtk.so
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
endef

define Package/python-gtk/install
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,python-gtk))
$(eval $(call RequireCommand,pygtk-codegen-2.0, \
	Please install the pygtk 2.0 development package \
))
$(eval $(call RequireCommand,python2.5, \
	Please install Python 2.5 \
))
