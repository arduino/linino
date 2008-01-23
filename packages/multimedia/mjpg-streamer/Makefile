#
# Copyright (C) 2007,2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=mjpg-streamer
PKG_VERSION:=rev51
PKG_RELEASE:=1

PKG_SOURCE:=mjpg_streamer_$(PKG_VERSION).tgz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=a9f26a96fdebdf3046ce920d2bcfb4ef

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

define Package/mjpg-streamer/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mjpg_streamer $(1)/sbin
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/input_uvc.so $(1)/usr/lib
	$(CP) $(foreach plugin,http file autofocus,$(PKG_BUILD_DIR)/output_$(plugin).so) $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/webcam_www
	$(CP) $(PKG_BUILD_DIR)/www/* $(1)/webcam_www
endef

$(eval $(call BuildPackage,mjpg-streamer))
