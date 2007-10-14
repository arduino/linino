# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=mjpg-streamer
PKG_VERSION:=2
PKG_RELEASE:=1

PKG_SOURCE:=mjpg_streamer_2007_10_12.tgz
PKG_SOURCE_URL:=http://naaa.de/programme/mjpg-streamer/
PKG_MD5SUM:=fd1159498a8648d30dfead3e6569ab54

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/mjpg-streamer
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=MJPG-streamer
  DEPENDS:=@LINUX_2_6 +libpthread
  URL:=http://www.naaa.de/uvc_streamer.htm
endef

define Package/mjpg-streamer/description
	streaming application for Linux-UVC compatible webcams
endef

MAKE_FLAGS += \
	-C $(PKG_BUILD_DIR) \
	CFLAGS="$(TARGET_CFLAGS)" \
	CC="$(TARGET_CC)" \
	all

define Package/mjpg-streamer/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mjpg_streamer $(1)/sbin
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/input_uvc.so $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/output_http.so $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/output_file.so $(1)/usr/lib
	$(INSTALL_DIR) $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/cambozola.jar $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/control.htm $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/favicon.ico $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/functions.js $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/index.html $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/java.html $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/LICENSE.txt $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/stream.html $(1)/webcam_www
endef

$(eval $(call BuildPackage,mjpg-streamer))
