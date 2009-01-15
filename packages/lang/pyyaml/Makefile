#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 13829 2009-01-03 00:28:00Z mirko $

include $(TOPDIR)/rules.mk

PKG_NAME:=PyYAML
PKG_VERSION:=3.08
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://pyyaml.org/download/pyyaml/

PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
-include $(if $(DUMP),,$(STAGING_DIR)/mk/python-package.mk)

define Package/pyyaml
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=pyyaml
  URL:=http://pyyaml.org
  DEPENDS:=python-core +libyaml
endef

define Package/pyyaml/description
  yaml python bindings
endef

define Build/Compile
	$(call Build/Compile/PyMod,,--with-libyaml install --prefix="$(PKG_INSTALL_DIR)/usr")
endef

define Package/pyyaml/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,pyyaml))
