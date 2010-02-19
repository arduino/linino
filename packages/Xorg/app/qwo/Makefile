#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=qwo
PKG_VERSION:=0.3
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://mirrors.zerg.biz/nongnu/qwo/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/
PKG_MD5SUM:=4a3cfc9ad505c60cdf0d896f0323aab2

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

TARGET_CPPFLAGS+=-I$(STAGING_DIR)/usr/include/libconfig
TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/qwo
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  DEPENDS:=+libX11 +libXext +libXau +libXtst +imlib2
  TITLE:=qwo
  URL:=http://www.nongnu.org/qwo/
endef

define Package/qwo/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/share/qwo $(1)/usr/share/applications
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/qwo/* \
		$(1)/usr/share/qwo/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/qwo/qwo.desktop \
		$(1)/usr/share/applications/
endef

$(eval $(call BuildPackage,qwo))
