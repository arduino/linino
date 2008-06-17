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

define Package/python-gtk
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=GTK bindings to python
  URL:=http://www.pygtk.org/
  DEPENDS:=python-core +python-gobject +gtk-2.10.14 +pycairo
endef

define Package/python-gtk/description
  API to GTK and glade library from python
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
		if [ -x $(CONFIGURE_CMD) ]; then \
		$(CP) $(SCRIPT_DIR)/config.{guess,sub} $(PKG_BUILD_DIR)/ && \
			$(CONFIGURE_VARS) \
			$(CONFIGURE_CMD) \
			$(CONFIGURE_ARGS) ;\
		fi \
	)
endef

define Build/Compile
	cd $(PKG_BUILD_DIR) ; PYTHON_HOST=/usr/bin/python DESTDIR=$(PKG_INSTALL_DIR) $(MAKE) all install
endef

define Build/InstallDev
	mkdir -p $(1)
	cp -r $(PKG_INSTALL_DIR)/* $(1)
endef

define Package/python-gtk/install
	mkdir -p $(1)
	cp -r $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,python-gtk))
