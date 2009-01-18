#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=mjpg-streamer
PKG_REV:=68
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://mjpg-streamer.svn.sourceforge.net/svnroot/mjpg-streamer/mjpg-streamer/
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_PROTO:=svn

include $(INCLUDE_DIR)/package.mk

define Package/mjpg-streamer
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=MJPG-streamer
  DEPENDS:=@LINUX_2_6 +libpthread +libjpeg
  URL:=http://www.naaa.de/uvc_streamer.htm
endef

define Package/mjpg-streamer/description
	Streaming application for Linux-UVC compatible webcams
endef

EXTRA_CFLAGS += -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib

define Package/mjpg-streamer/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mjpg_streamer $(1)/sbin
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(foreach input_plugin,uvc gspcav1,$(PKG_BUILD_DIR)/input_$(input_plugin).so) $(1)/usr/lib
	$(CP) $(foreach output_plugin,http file autofocus,$(PKG_BUILD_DIR)/output_$(output_plugin).so) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/webcam_www
	$(CP) $(PKG_BUILD_DIR)/www/* $(1)/webcam_www
endef

$(eval $(call BuildPackage,mjpg-streamer))
