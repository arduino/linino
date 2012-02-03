#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xf86-video-glamo
PKG_VERSION:=20091029
PKG_REV:=15954340b4b7aaf6ab850c149c2f75c1555d9360
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://git.openmoko.org/git/xf86-video-glamo.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(PKG_NAME)-$(PKG_VERSION)/
PKG_BUILD_DEPENDS:=xproto fontsproto randrproto renderproto videoproto
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/xf86-video-glamo
  TITLE:=xf86-video-glamo
  SECTION:=xorg-driver
  CATEGORY:=Xorg
  SUBMENU:=driver
  URL:=http://git.openmoko.org/?p=xf86-video-glamo.git
  DEPENDS:=@DISPLAY_SUPPORT @arm||armeb @TARGET_s3c24xx +xserver-xorg
endef

define Package/xf86-video-glamo/description
 xorg video driver for the smedia glamo 3362 chip.
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR) && autoreconf --force --install)
	$(call Build/Configure/Default, \
		--disable-jbt6k74-set-state \
        --enable-engine-ioctls \
	)
endef

define Package/xf86-video-glamo/install
	$(INSTALL_DIR) $(1)/usr/lib/xorg/modules/drivers
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/xorg/modules/drivers/glamo_drv.so \
		$(1)/usr/lib/xorg/modules/drivers/
endef

$(eval $(call BuildPackage,xf86-video-glamo))
