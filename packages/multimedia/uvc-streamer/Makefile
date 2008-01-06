# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=uvc-streamer
PKG_VERSION:=1
PKG_RELEASE:=1

PKG_SOURCE:=uvc_streamer_2007_07_21_14.07.06.tgz
PKG_SOURCE_URL:=http://naaa.de/programme/uvc_streamer/
PKG_MD5SUM:=491473a25882c3e7250aeeb68e0ca689

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/uvc-streamer
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Linux-UVC streaming applicaton
  DEPENDS:=@LINUX_2_6 +libpthread
  URL:=http://www.naaa.de/uvc_streamer
endef

define Package/uvc-streamer/description
	This package contains a streaming daemon for Linux-UVC based webcams
endef

MAKE_FLAGS += \
	-C $(PKG_BUILD_DIR) \
	CFLAGS="$(TARGET_CFLAGS)" \
	CC="$(TARGET_CC)" \
	all

define Package/uvc-streamer/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/uvc_stream $(1)/sbin/uvc_streamer
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/$(PKG_NAME).config $(1)/etc/config/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/$(PKG_NAME).init $(1)/etc/init.d/$(PKG_NAME)
endef

$(eval $(call BuildPackage,uvc-streamer))
