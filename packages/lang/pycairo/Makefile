#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pycairo
PKG_VERSION:=1.4.12
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.cairographics.org/releases/
#PKG_MD5SUM:=532268f02870bea18c1d465e88afff30
PKG_BUILD_DEPENDS:=python cairo

include $(INCLUDE_DIR)/package.mk
-include $(if $(DUMP),,$(STAGING_DIR)/mk/python-package.mk)
ifneq ($(MAKECMDGOALS),download)
  $(if $(DUMP)$(Build/Compile/PyMod),,$(error Python packaging code not found.))
endif

define Package/pycairo
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Cairo bindings to python
  URL:=http://www.cairographics.org/
  DEPENDS:=python +cairo
endef

define Package/pycairo/description
  cairo modul for python
endef

define Build/Compile
	$(call Build/Compile/PyMod,., \
		install --prefix="$(PKG_INSTALL_DIR)/usr", \
	)
endef

$(eval $(call PyPackage,pycairo))
$(eval $(call BuildPackage,pycairo))
