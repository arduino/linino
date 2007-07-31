# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 5624 2006-11-23 00:29:07Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=batmand-adv
PKG_VERSION:=0.1-alpha-rv466
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)_$(PKG_VERSION)_sources
PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION)_sources.tgz
PKG_SOURCE_URL:=http://downloads.open-mesh.net/batman/development/sources/ \
	http://downloads.open-mesh.net/batman/development/sources/old/
PKG_MD5SUM:=3ebc394a7b7b3fa5cecaf97f6a220a3f
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/batman-advanced
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +kmod-tun
  TITLE:=B.A.T.M.A.N. Advanced (Layer2 Version)
  URL:=https://www.open-mesh.net/
endef

define Build/Configure
endef

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS)" \
	CCFLAGS="$(TARGET_CFLAGS)" \
	OFLAGS="$(TARGET_CFLAGS)" \
	NODEBUG=1 \
	UNAME="Linux" \
	INSTALL_PREFIX="$(PKG_INSTALL_DIR)" \
	STRIP="/bin/true" \
	batmand-adv install

define Package/batman-advanced/install
	$(INSTALL_DIR) $(1)/usr/sbin $(1)/etc/config $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/batmand-adv $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/etc/init.d/batman-adv $(1)/etc/init.d
	$(INSTALL_DATA) ./files/etc/config/batman-adv $(1)/etc/config
endef

$(eval $(call BuildPackage,batman-advanced))
