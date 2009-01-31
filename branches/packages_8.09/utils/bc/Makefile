#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=bc
PKG_VERSION:=1.06.94
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
PKG_SOURCE_URL:=ftp://ftp.debian.org/debian/pool/main/b/bc
PKG_MD5SUM:=ea7704fc02b359ce92fa4360c802fb23

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/bc/Default
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=http://packages.debian.org/sid/bc
endef

define Package/bc
  $(call Package/bc/Default)
  TITLE:=Arbitrary precision calculator language
endef

define Package/bc/description
	bc is a language that supports arbitrary precision numbers with interactive 
	execution of statements.
endef

define Package/dc
  $(call Package/bc/Default)
  DEPENDS:=bc
  TITLE:=Arbitrary precision reverse-polish calculator
endef

define Package/dc/description
	dc is a reverse-polish desk calculator which supports unlimited precision 
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
