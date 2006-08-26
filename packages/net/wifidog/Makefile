#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=wifidog
PKG_VERSION:=1.1.3_beta2
PKG_RELEASE:=1
PKG_MD5SUM:=ba1611c7eb959f9c6f93e12b97d70b82

PKG_SOURCE_URL:= @SF/$(PKG_NAME)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/wifidog
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+iptables-mod-extra
  TITLE:=A wireless captive portal solution
  DESCRIPTION:=The Wifidog project is a complete and embeddable captive
  portal solution for wireless community groups or individuals\\\
  who wish to open a free Hotspot while still preventing abuse\\\
  of their Internet connection.\\\
  URL:=http://www.wifidog.org
endef

define Package/wifidog/conffiles
/etc/wifidog.conf
endef

define Build/Configure
$(call Build/Configure/Default,,ac_cv_func_malloc_0_nonnull=yes \
		ac_cv_func_memcmp_working=yes \
		ac_cv_func_setvbuf_reversed=no)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install
endef
	
define Package/wifidog/install
	install -m0755 -d $(1)/etc/init.d
	install -m0755 ./files/$(PKG_NAME).init $(1)/etc/init.d/S65wifidog
	install -m0644 ./files/wifidog.conf $(1)/etc/
	install -m0755 -d $(1)/usr/bin
	install -m0755 -d $(1)/usr/lib
	install -m0755 $(PKG_BUILD_DIR)/scripts/init.d/wifidog $(1)/usr/bin/wifidog-init
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/wifidog $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/wdctl $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libhttpd.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,wifidog))
