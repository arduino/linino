# 
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=ap51-flash
PKG_REV:=195
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=ap51-flash-$(PKG_VERSION)
PKG_SOURCE_URL:=http://dev.open-mesh.com/downloads/svn/ap51-flash/trunk
PKG_SOURCE:=$(PKG_SOURCE_SUBDIR).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/ap51-flash
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A tool for flashing (nearly) all ap51/ap61 based routers
  URL:=http://dev.open-mesh.com/wiki/ap51-flash-station
  DEPENDS:=+libpcap
endef

# pass optimization flags
MAKE_FLAGS += \
	OFLAGS="$(TARGET_CFLAGS)" \

define Package/ap51-flash/install
	$(INSTALL_DIR) $(1)/etc/config $(1)/etc/init.d $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ap51-flash $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/ap51-flash.init $(1)/etc/init.d/ap51-flash
	$(INSTALL_DATA) ./files/ap51-flash.conf $(1)/etc/config/ap51-flash
endef

$(eval $(call BuildPackage,ap51-flash))
