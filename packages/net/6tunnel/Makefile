# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 4112 2006-07-02 20:33:21Z nico $

include $(TOPDIR)/rules.mk

PKG_NAME:=6tunnel
PKG_VERSION:=0.11rc1
PKG_RELEASE:=1
PKG_MD5SUM:=b325fa9d238e32195fbb3fc3646b0d28

PKG_SOURCE_URL:=http://toxygen.net/6tunnel/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-0.11
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/6tunnel
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap
  TITLE:=IPv4 / IPv6 tunnel proxy
  DESCRIPTION:=IPv4 / IPv6 tunnel proxy
  URL:=http://toxygen.net/6tunnel/
endef

define Build/Configure
$(call Build/Configure/Default,,ac_cv_path_STRIP=$(STRIP) ac_cv_func_vsnprintf=yes)
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		default
endef

define Package/6tunnel/install
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,6tunnel))
