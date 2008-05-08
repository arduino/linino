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
#PKG_MD5SUM:=532268f02870bea18c1d465e88afff30
#PKG_BUILD_DEPENDS:=python gtk

include $(INCLUDE_DIR)/package.mk
-include $(if $(DUMP),,$(STAGING_DIR)/mk/python-package.mk)
ifneq ($(MAKECMDGOALS),download)
  $(if $(DUMP)$(Build/Compile/PyMod),,$(error Python packaging code not found.))
endif

define Package/python-gtk
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=GTK bindings to python
  URL:=http://www.pygtk.org/
  DEPENDS:=python-core 
endef

define Package/python-gtk/description
  API to GTK and glade library from python
endef

define Build/Compile
	$(call Build/Compile/PyMod,., \
		install --prefix="$(PKG_INSTALL_DIR)/usr", \
	)
endef

$(eval $(call PyPackage,python-gtk))
$(eval $(call BuildPackage,python-gtk))
