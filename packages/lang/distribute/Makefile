#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=distribute
PKG_VERSION:=0.6.10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/d/$(PKG_NAME)/
PKG_MD5SUM:=99fb4b3e4ef0861bba11aa1905e89fed
PKG_BUILD_DIR:=$(BUILD_DIR_HOST)/$(PKG_NAME)-$(PKG_VERSION)/

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

PYTHON:=$(STAGING_DIR)/usr/bin/hostpython

define Package/distribute
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Distribute
  URL:=http://pypi.python.org/pypi/distribute
  DEPENDS:=+python
  PROVIDES:=setuptools
endef

define Package/distribute/description
  Distribute (fork of Setuptools) is a collection of extensions to Distutils
endef

define Host/Compile
	$(call Build/Compile/PyMod,,install --prefix=/usr --root=$(PKG_INSTALL_DIR))
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR_HOST)$(PYTHON_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(STAGING_DIR_HOST)$(PYTHON_PKG_DIR)
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix=/usr --root=$(PKG_INSTALL_DIR))
endef

define Package/distribute/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,distribute))
