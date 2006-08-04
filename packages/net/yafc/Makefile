# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 4112 2006-07-02 20:33:21Z nico $

include $(TOPDIR)/rules.mk

PKG_NAME:=yafc
PKG_VERSION:=1.1.1
PKG_RELEASE:=1
PKG_MD5SUM:=832d074183a36ee15b47553ed5962fce

PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/yafc
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap
  TITLE:=Yafc is yet another ftp client.
  DESCRIPTION:=console-based FTP client
  URL:=http://yacf.sourceforge.net
endef

define Build/Configure
$(call Build/Configure/Default,--includedir=$(PKG_BUILD_DIR)/)
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)"
endef

define Package/yafc/install
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/src/$(PKG_NAME) $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,yafc))
