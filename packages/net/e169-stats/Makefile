#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=e169-stats
PKG_VERSION:=0.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.mavetju.org/download/
PKG_MD5SUM:=11aa0b9abf6ff430ba90bbd7ee178774

include $(INCLUDE_DIR)/package.mk

define Package/e169-stats
  SECTION:=net
  CATEGORY:=Network
  TITLE:=e169-stats
  URL:=http://www.mavetju.org/weblog/html/00282.html
  DEPENDS:=+libncurses
endef

define Package/e169-stats/description
  Huawei E169 statistics, works with other Huawei's devices.
endef

define Package/e169-stats/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/e169-stats $(1)/usr/bin/
endef

$(eval $(call BuildPackage,e169-stats))
