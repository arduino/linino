#
# Copyright (C) 2007-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=xwd
PKG_RELEASE:=1
PKG_VERSION:=1.0.3

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.5/src/app
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/Xorg/$(PKG_NAME)-$(PKG_VERSION)/

PKG_MD5SUM:=007cea1f389abde5c93162dcd5541351
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/xwd
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  DEPENDS:=+libX11
  TITLE:=xwd
  URL:=http://xorg.freedesktop.org/
endef

define Package/xwd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin
endef

$(eval $(call BuildPackage,xwd))
