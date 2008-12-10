# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=vnstati
PKG_VERSION:=beta3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://humdi.net/vnstat
PKG_MD5SUM:=5652b955e16716cec48da464b083c76f

include $(INCLUDE_DIR)/package.mk

define Package/vnstati
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+vnstat +libgd
  TITLE:=vnStat image output - png image output support for vnStat
  URL:=http://humdi.net/vnstat/
endef

define Package/vnstati/description
	The purpose of vnstati is to provide image output support for statistics
	collected using vnstat(1). However, the image file format is limited to
	png. All basic outputs of vnStat are supported excluding live traffic
	features. The image can be outputted either to a file or to standard
	output.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS+="-I$(STAGING_DIR)/usr/include -L$(STAGING_DIR)/usr/lib -Wl,-rpath-link,$(STAGING_DIR)/usr/lib"
endef

define Package/vnstati/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/vnstati $(1)/usr/bin/
endef

$(eval $(call BuildPackage,vnstati))
