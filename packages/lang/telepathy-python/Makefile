#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=telepathy-python
PKG_VERSION:=0.15.0
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://telepathy.freedesktop.org/releases/telepathy-python/
PKG_MD5SUM:=678a28e3b7d06f75940beec28130d9a5

include $(INCLUDE_DIR)/package.mk
-include $(if $(DUMP),,$(STAGING_DIR)/mk/python-package.mk)

define Package/telepathy-python
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=telepathy-python
  URL:=http://telepathy.freedesktop.org
  DEPENDS:=python-core
endef

define Package/telepathy-python/description
  telepathy python bingings
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix="$(PKG_INSTALL_DIR)/usr")
endef

define Package/telepathy-python/install
	#FIXME: Only copy required files
	mkdir -p $(1)
	cp -r $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,telepathy-python))

$(eval $(call RequireCommand,xsltproc, \
	$(PKG_NAME) requires xsltproc installed on the host-system. \
))
