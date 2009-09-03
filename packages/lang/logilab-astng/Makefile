#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=logilab-astng
PKG_VERSION:=0.17.2
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.logilab.fr/pub/astng/

include $(INCLUDE_DIR)/package.mk
-include $(if $(DUMP),,$(STAGING_DIR)/mk/python-package.mk)

define Package/logilab-astng
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=logilab-astng
  URL:=http://www.logilab.fr
  DEPENDS:=+python-mini
endef

define Package/logilab-astng/description
  The aim of this module is to provide a common base representation of python source code for projects such as pychecker, pyreverse, pylint...
endef

define Build/Compile
	$(if $(Build/Compile/PyMod),,@echo Python packaging code not found.; false)
	$(call Build/Compile/PyMod,., \
		install --prefix="$(PKG_INSTALL_DIR)/usr", \
	)
endef

define Package/logilab-astng/install
	mkdir -p $(1)
	cp -r $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,logilab-astng))
