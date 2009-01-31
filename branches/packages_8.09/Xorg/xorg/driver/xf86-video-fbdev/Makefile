# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org
include $(TOPDIR)/rules.mk

PKG_NAME:=xf86-video-fbdev
PKG_RELEASE:=3
PKG_VERSION:=0.4.0

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.4/src/driver
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/${PKG_NAME}-$(PKG_VERSION)/
PKG_MD5SUM:=6572b39fec77b8e6de1c858a93992924

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL:=1

define Package/xf86-video-fbdev
  SECTION:=xorg-driver
  CATEGORY:=Xorg
  SUBMENU:=driver
  DEPENDS:=+xserver-xorg +libpciaccess
  TITLE:=xf86-video-fbdev
  URL:=http://xorg.freedesktop.org/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-pciaccess \
	)
endef

define Package/xf86-video-fbdev/install
	$(INSTALL_DIR) $(1)/usr/lib/xorg/modules/drivers
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/xorg/modules/drivers/*.so \
		$(1)/usr/lib/xorg/modules/drivers
endef

$(eval $(call BuildPackage,xf86-video-fbdev))
