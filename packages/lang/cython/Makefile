#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 13829 2009-01-03 00:28:00Z mirko $

include $(TOPDIR)/rules.mk

PKG_NAME:=cython
PKG_VERSION:=0.10.3
PKG_RELEASE:=1
PKG_SOURCE:=Cython-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.cython.org/
PKG_BUILD_DIR:=$(BUILD_DIR)/Cython-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
-include $(if $(DUMP),,$(STAGING_DIR)/mk/python-package.mk)

define Package/cython
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=cython
  URL:=http://www.cython.org
  DEPENDS:=python-core @BROKEN
endef

define Package/cython/description
  Cython is a language that should make writing C extensions for the Python language easier
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix="$(PKG_INSTALL_DIR)/usr")
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,cython))
