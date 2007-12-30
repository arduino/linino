# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=mjpg-streamer
PKG_VERSION:=rev35
PKG_RELEASE:=1

PKG_SOURCE:=mjpg_streamer_$(PKG_VERSION).tgz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=2a41d65eff5977e0d7823d2d12f385c9

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/mjpg-streamer
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=MJPG-streamer
  DEPENDS:=@LINUX_2_6 +libpthread +libjpeg
  URL:=http://www.naaa.de/uvc_streamer.htm
endef

define Package/mjpg-streamer/description
	streaming application for Linux-UVC compatible webcams
endef

EXTRA_CFLAGS += -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib
define Build/Compile
	$(call Build/Compile/Default)
endef

define Package/mjpg-streamer/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mjpg_streamer $(1)/sbin
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/input_uvc.so $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/output_http.so $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/output_file.so $(1)/usr/lib
	$(INSTALL_DIR) $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/bodybg.gif $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/cambozola.jar $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/control.htm $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/example.jpg $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/favicon.ico $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/fix.css $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/functions.js $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/index.html $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/java.html $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/javascript.html $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/javascript_simple.html $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/java_simple.html $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/LICENSE.txt $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/sidebarbg.gif $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/static.html $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/static_simple.html $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/stream.html $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/stream_simple.html $(1)/webcam_www
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/www/style.css $(1)/webcam_www
endef

$(eval $(call BuildPackage,mjpg-streamer))
