#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=srelay
PKG_VERSION:=0.4.6
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/socks-relay
PKG_MD5SUM:=4a9f3298b38d8588f0ffde31b946a47f

include $(INCLUDE_DIR)/package.mk

define Package/srelay
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libwrap
  TITLE:=A socks 4/5 proxy server
  URL:=http://www.c-wind.com/srelay/
endef

define Package/srelay/conffiles
/etc/srelay.conf
endef

CONFIGURE_ARGS += \
	--disable-thread \

CONFIGURE_VARS += \
	CPPFLAGS="-DLINUX" \

define Package/srelay/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) files/$(PKG_NAME).conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) files/$(PKG_NAME).init $(1)/etc/init.d/$(PKG_NAME)
endef

$(eval $(call BuildPackage,srelay))
