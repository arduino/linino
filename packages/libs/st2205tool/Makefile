# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: 

include $(TOPDIR)/rules.mk

PKG_NAME:=st2205tool
PKG_VERSION:=1.4pre1
PKG_RELEASE:=1

PKG_SOURCE:=st2205tool-v$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://spritesmods.com/picframe/
PKG_MD5SUM:=bf602227bce9c4365e5ae5e9b383d8d9

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/st2205tool
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=ST220xu powered photo-frames library
  DEPENDS:=+libgd
  URL:=http://picframe.spritesserver.nl/wiki/
endef

define Package/st2205tool/description
  Library for hacked photo-frames based on st220xu chipset. You may use those photo-frames with
  mplayer or LCD4Linux
endef

TARGET_CFLAGS += $(FPIC)

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS) -I$(PKG_BUILD_DIR)/libst2205/" \
	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
	SETPICLIBS="-L$(STAGING_DIR)/usr/lib -lgd -ljpeg -lpng -lz -L../libst2205 -lst2205" \


define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/libst2205/st2205.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libst2205/libst2205.{a,so*} $(1)/usr/lib/
endef


define Package/st2205tool/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/{bgrep,phack,splice,hackfw.sh} $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/setpic/setpic $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libst2205/libst2205.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,st2205tool))
