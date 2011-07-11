#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pycairo
PKG_VERSION:=1.8.0
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.cairographics.org/releases/
PKG_MD5SUM:=847f5377c32228a656819f5bd18eb6b4
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

PKG_INSTALL=1

CONFIGURE_ARGS += --enable-static

define Package/pycairo
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Cairo bindings to python
  URL:=http://www.cairographics.org/pycairo/
  DEPENDS:=+python-mini +cairo
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
