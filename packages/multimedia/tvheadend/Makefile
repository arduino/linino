#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tvheadend
PKG_VERSION:=3.2
PKG_RELEASE:=0.1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/downloads/tvheadend/tvheadend/
PKG_MD5SUM:=4f7faa75c4ea24942c5a12a77ebdcdf0

include $(INCLUDE_DIR)/package.mk

define Package/tvheadend
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=Tvheadend is a TV streaming server for Linux
  DEPENDS:=+libopenssl +librt +zlib +TVHEADEND_AVAHI_SUPPORT:libavahi-client
  URL:=http://www.lonelycoder.com/hts/tvheadend_overview.html
endef

define Package/tvheadend/description
  Tvheadend is a TV streaming server for Linux supporting DVB, ATSC, IPTV,
  and Analog video (V4L) as input sources.
  Can be used as a backend to Showtime, XBMC and various other clients.
endef

define Package/tvheadend/config
  menu "Configuration"
  depends on PACKAGE_tvheadend
  source "$(SOURCE)/Config.in"
  endmenu
endef

ifeq ($(CONFIG_TVHEADEND_CWC_SUPPORT),)
  CONFIGURE_ARGS += --disable-cwc
endif

ifeq ($(CONFIG_TVHEADEND_V4L_SUPPORT),)
  CONFIGURE_ARGS += --disable-v4l
endif

ifeq ($(CONFIG_TVHEADEND_LINUXDVB_SUPPORT),)
  CONFIGURE_ARGS += --disable-linuxdvb
endif

ifeq ($(CONFIG_TVHEADEND_DVBSCAN_SUPPORT),)
  CONFIGURE_ARGS += --disable-dvbscan
endif

ifeq ($(CONFIG_TVHEADEND_AVAHI_SUPPORT),)
  CONFIGURE_ARGS += --disable-avahi
else
  CONFIGURE_ARGS += --enable-avahi
endif

CONFIGURE_ARGS += \
	--release \
	--enable-bundle

define Package/tvheadend/install
	$(INSTALL_DIR) $(1)/etc/tvheadend
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/tvheadend.init $(1)/etc/init.d/tvheadend
	$(INSTALL_DIR) $(1)/lib/upgrade/keep.d
	$(INSTALL_DATA) ./files/tvheadend.upgrade $(1)/lib/upgrade/keep.d/tvheadend
	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build.linux/tvheadend $(1)/usr/bin/
endef

$(eval $(call BuildPackage,tvheadend))
