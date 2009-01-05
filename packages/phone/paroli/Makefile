# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=paroli
PKG_VERSION:=20090104
PKG_REV:=39c30cb16cc04c478f79cd34fec7719c730469f7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://git.openmoko.org/git/paroli.git
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
  DEPENDS:=python-core +fso
  URL:=http://wiki.openmoko.org/wiki/Paroli
endef

define Package/paroli/description
  Paroli is an integrated phone application written in Python which uses the FSO (freesmartphone.org) DBus API
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix="$(PKG_INSTALL_DIR)/usr")
endef

define Package/paroli/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR) $(1)/usr/bin $(1)/etc $(1)/usr/share/applications/paroli
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/applications/* \
		$(1)/usr/share/applications/paroli/
	$(CP) \
		$(PKG_INSTALL_DIR)/etc/* \
		$(1)/etc/
endef

$(eval $(call BuildPackage,paroli))
