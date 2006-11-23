#
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

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/
PKG_MD5SUM:=d44b5dddebd8a7a7309aea6c36fda117
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/bc/Default
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=http://www.gnu.org/software/bc/
endef

define Package/bc
  $(call Package/bc/Default)
  TITLE:=Arbitrary precision calculator language
  DESCRIPTION:=\
	bc is a language that supports arbitrary precision numbers with interactive \\\
	execution of statements.
endef

define Package/dc
  $(call Package/bc/Default)
  DEPENDS:=bc
  TITLE:=Arbitrary precision reverse-polish calculator
  DESCRIPTION:=\
	dc is a reverse-polish desk calculator which supports unlimited precision \\\
	arithmetic.
endef

define Package/bc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bc/bc $(1)/usr/bin/
endef

define Package/dc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dc/dc $(1)/usr/bin/
endef

$(eval $(call BuildPackage,bc))
$(eval $(call BuildPackage,dc))
