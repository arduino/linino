# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=paroli
PKG_VERSION:=20090121
PKG_REV:=9279b50ed72a94100d7f0f49090043134302f2eb
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://git.paroli-project.org/paroli.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
-include $(if $(DUMP),,$(STAGING_DIR)/mk/python-package.mk)

define Package/paroli
  SECTION:=phone
  CATEGORY:=Phone
  TITLE:=integrated phone application
  DEPENDS:=python-core +fso +python-evas +python-ecore +python-edje +python-e_dbus +python-etk
  URL:=http://wiki.openmoko.org/wiki/Paroli
endef

COMPONENTS:= \
	paroli-dialer \
	paroli-contacts \
	paroli-i-o \
	paroli-msgs \

define Package/paroli/description
  Paroli is an integrated phone application written in Python which uses the FSO (freesmartphone.org) DBus API
endef

define Build/Compile
	$(call Build/Compile/PyMod,,build)
	$(call Build/Compile/PyMod,,install --prefix="$(PKG_INSTALL_DIR)/usr")
endef

define Package/paroli/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR) $(1)/usr/bin $(1)/etc/init.d $(1)/usr/share/applications/paroli $(1)/usr/share/paroli/services $(1)/usr/share/icons/paroli $(1)/etc/xdg/autostart
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/
	$(INSTALL_BIN) ./files/paroli.init $(1)/etc/init.d/paroli
	$(foreach c, $(COMPONENTS), \
		$(INSTALL_DIR) $(1)/usr/share/paroli/applications/$(c)
		$(CP) $(PKG_INSTALL_DIR)/../usr/share/paroli/applications/$(c)/$(c).{py,edj} $(1)/usr/share/paroli/applications/$(c)/
		$(CP) $(PKG_INSTALL_DIR)/../usr/share/paroli/applications/$(c)/icon.png $(1)/usr/share/icons/paroli/$(c).png
	)
	$(CP) \
		$(PKG_INSTALL_DIR)/../usr/share/paroli/services/* \
		$(1)/usr/share/paroli/services/
	$(CP) \
		$(PKG_INSTALL_DIR)/../data/tichy \
		$(1)/usr/share/icons/paroli/tichy.png
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/applications/*.desktop \
		$(1)/usr/share/applications/paroli/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/applications/paroli-launcher.desktop \
		$(1)/etc/xdg/autostart/
	$(CP) \
		$(PKG_INSTALL_DIR)/../etc/* \
		$(1)/etc/
endef

$(eval $(call BuildPackage,paroli))
