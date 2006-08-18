# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=bc
PKG_VERSION:=1.06
PKG_RELEASE:=1
PKG_MD5SUM:=d44b5dddebd8a7a7309aea6c36fda117

PKG_SOURCE_URL:=@GNU/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/bc
  SECTION:=utils
  CATEGORY:=Utilities
  MENU:=1
  TITLE:=Arbitrary precision calculator language
  DESCRIPTION:=bc is a language that supports arbitrary precision numbers with interactive execution of statements.
  URL:=http://www.gnu.org/software/bc/
endef

define Package/dc
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=bc
  TITLE:=Arbitrary precision calculator
  DESCRIPTION:=dc is a reverse-polish desk calculator which supports unlimited precision arithmetic.
  URL:=http://www.gnu.org/software/bc/
endef

define Package/bc/install
	install -m0755 -d $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/$(PKG_NAME)/$(PKG_NAME) $(1)/usr/bin/$(PKG_NAME)
endef

define Package/dc/install
	install -m0755 -d $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/$(PKG_NAME)/$(PKG_NAME) $(1)/usr/bin/$(PKG_NAME)
endef

$(eval $(call BuildPackage,bc))
$(eval $(call BuildPackage,dc))
