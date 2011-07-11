#
# Copyright (C) 2008-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pygtk
PKG_VERSION:=2.12.1
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/2.12/
PKG_MD5SUM:=a816346d750d61e3fa67a200e4292694
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
$(call include_mk, python-package.mk)

define Package/python-gtk
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=GTK bindings for python
  URL:=http://www.pygtk.org/
  DEPENDS:=+python-mini +python-gobject +gtk2 +pycairo @!LINUX_2_4
endef

define Package/python-gtk/description
  API to GTK and glade library from python.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		SUBDIRS="codegen . gtk" \
		all install DESTDIR="$(PKG_INSTALL_DIR)"
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/pygtk-2.0/pygtk
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/pygtk-2.0/pygtk/* \
		$(1)/usr/include/pygtk-2.0/pygtk

	$(INSTALL_DIR) $(1)/usr/share/pygtk/2.0/codegen
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pygtk/2.0/codegen/*.py \
		$(1)/usr/share/pygtk/2.0/codegen/

	$(INSTALL_DIR) $(1)/usr/share/pygtk/2.0/defs/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pygtk/2.0/defs/* \
		$(1)/usr/share/pygtk/2.0/defs

	$(INSTALL_DIR) $(2)/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(2)/bin

	$(SED) 's,^\(datadir\|prefix\)=,\1=$(STAGING_DIR),g' $(2)/bin/pygtk-codegen-2.0

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig

	$(SED) 's,^datadir=,datadir=$(STAGING_DIR),g' $(1)/usr/lib/pkgconfig/pygtk-2.0.pc
endef

define Package/python-gtk/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/gtk-2.0
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/gtk-2.0/*.so \
		$(1)$(PYTHON_PKG_DIR)/gtk-2.0

	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/gtk-2.0/gtk
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/gtk-2.0/gtk/*{.py,.so}* \
		$(1)$(PYTHON_PKG_DIR)/gtk-2.0/gtk
endef

$(eval $(call BuildPackage,python-gtk))
