#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=bluelog
PKG_VERSION:=1.0.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.digifail.com/downloads/software/bluelog
PKG_MD5SUM:=f406d47ec94970be219cbb38f49402f9

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/bluelog/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Bluetooth scanner and logger
  URL:=http://www.digifail.com/software/bluelog.shtml
  DEPENDS:=+bluez-utils +kmod-bluetooth
endef

define Package/bluelog/Default/description
  Bluelog is a simple Bluetooth scanner designed to tell you how many
  discoverable devices there are in an area as quickly as possible. It is
  intended to be used as a site survey tool, identifying the number of possible
  Bluetooth targets there are in the surrounding environment.
endef

define Package/bluelog
  $(call Package/bluelog/Default)
endef

define Package/bluelog/description
  $(call Package/bluelog/Default/description)
endef

define Package/bluelog-live
  $(call Package/bluelog/Default)
  TITLE+= (live output)
  DEPENDS+= bluelog
endef

define Package/bluelog-live/description
  $(call Package/bluelog/Default/description)
  This package contains the bluelog live output files for use with an SSI
  capable web server.
endef

TARGET_CFLAGS += -DOPENWRT

MAKE_FLAGS += \
	 LIBS="$(TARGET_LDFLAGS) -lbluetooth"

define Package/bluelog/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/bluelog $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/bluelog.init $(1)/etc/init.d/bluelog
endef

define Package/bluelog-live/install
	$(INSTALL_DIR) $(1)/www
	$(CP) $(PKG_INSTALL_DIR)/var/lib/bluelog $(1)/www/
endef

$(eval $(call BuildPackage,bluelog))
$(eval $(call BuildPackage,bluelog-live))
