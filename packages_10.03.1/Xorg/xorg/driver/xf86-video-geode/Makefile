#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xf86-video-geode
PKG_RELEASE:=1
PKG_VERSION:=2.11.6

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/individual/driver/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=3ff0dfb4b3bd8872c6efb70371cb6b98

PKG_BUILD_DIR:=$(BUILD_DIR)/Xorg/$(PKG_NAME)-$(PKG_VERSION)/

PKG_BUILD_DEPENDS:=randrproto renderproto videoproto xextproto xf86dgaproto \
    xproto fontsproto
PKG_INSTALL:=1


include $(INCLUDE_DIR)/package.mk
$(call include_mk, xorg-driver.mk)

define Package/xf86-video-geode
  SECTION:=xorg-driver
  CATEGORY:=Xorg
  SUBMENU:=driver
  DEPENDS:=+xserver-xorg +libpciaccess @TARGET_x86
  TITLE:=xf86-video-geode
  URL:=http://xorg.freedesktop.org/
endef

define Package/xf86-video-geode/install
	$(INSTALL_DIR) $(1)/usr/lib/xorg/modules/drivers
	$(INSTALL_DATA) \
        $(PKG_INSTALL_DIR)/usr/lib/xorg/modules/drivers/*.so \
        $(1)/usr/lib/xorg/modules/drivers/
endef

$(eval $(call BuildPackage,xf86-video-geode))
