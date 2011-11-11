#
# Copyright (C) 2007-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xf86-video-fbdev
PKG_VERSION:=0.4.1
PKG_RELEASE:=2

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/individual/driver
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/Xorg/$(PKG_NAME)-$(PKG_VERSION)/
PKG_MD5SUM:=79ce1eb9f9d2ed56de70d8e06cb767d9

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
$(call include_mk, xorg-driver.mk)

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
