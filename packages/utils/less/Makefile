#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=less
PKG_VERSION:=436
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.greenwoodsoftware.com/less
PKG_MD5SUM:=817bf051953ad2dea825a1cdf460caa4

include $(INCLUDE_DIR)/package.mk

define Package/less
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Pager program similar to more
  DEPENDS:= +libncurses
  URL:=http://www.greenwoodsoftware.com/less/
endef

define Package/less/description
  Full version of GNU less utility
endef

define Package/less/install
        $(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/less $(1)/usr/bin/less
endef

$(eval $(call BuildPackage,less))
