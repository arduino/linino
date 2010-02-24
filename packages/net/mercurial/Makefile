#
# Copyright (C) 2006,2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mercurial
PKG_VERSION:=1.1.2
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://selenic.com/mercurial/release/
PKG_SOURCE:=mercurial-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=4fd3b9a2e5dcd025840c3849b136bec8
PKG_BUILD_DEPENDS:=python-mini

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/mercurial
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=python
  TITLE:=Mercurial Source Control Management (SCM) system
  URL:=http://www.selenic.com/mercurial/
  SUBMENU:=Version Control Systems
endef

define Package/mercurial/description
  A fast, lightweight Source Control Management system designed for efficient handling of very large distributed projects.
endef

define Build/Compile
	$(call Build/Compile/PyMod,, \
		install --prefix="$(PKG_INSTALL_DIR)", \
    )
endef

define Package/mercurial/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/bin $(1)/usr
	$(CP) $(PKG_INSTALL_DIR)/lib $(1)/usr
endef

$(eval $(call BuildPackage,mercurial))
