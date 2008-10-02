#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=pycairo
PKG_VERSION:=1.6.4
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.cairographics.org/releases/
PKG_MD5SUM:=2c3aa21e6e610321498f9f81f7b625df
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk
-include $(if $(DUMP),,$(STAGING_DIR)/mk/python-package.mk)

PKG_INSTALL=1

define Package/pycairo
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Cairo bindings to python
  URL:=http://www.cairographics.org/pycairo/
  DEPENDS:=python-core +cairo
endef

define Package/pycairo/description
  Cairo bindings for python
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/pycairo
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/pycairo/* \
		$(1)/usr/include/pycairo
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/pycairo/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/cairo/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/cairo/*.{py,so,a} \
		$(1)$(PYTHON_PKG_DIR)/cairo/
endef

$(eval $(call BuildPackage,pycairo))
