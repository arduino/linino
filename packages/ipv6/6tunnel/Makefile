#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=6tunnel
PKG_VERSION:=0.11rc1
PKG_RELEASE:=2
PKG_MD5SUM:=b325fa9d238e32195fbb3fc3646b0d28

PKG_SOURCE_URL:=http://toxygen.net/6tunnel/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-0.11

include $(INCLUDE_DIR)/package.mk

define Package/6tunnel
  SECTION:=ipv6
  CATEGORY:=IPv6
  DEPENDS:=+libpcap
  TITLE:=IPv4 / IPv6 tunnel proxy
  URL:=http://toxygen.net/6tunnel/
endef

define Package/6tunnel/description
IPv4 / IPv6 tunnel proxy
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
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/6tunnel $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,6tunnel))
