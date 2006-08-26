# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 4112 2006-07-02 20:33:21Z nico $

include $(TOPDIR)/rules.mk

PKG_NAME:=wpa_supplicant
PKG_VERSION:=0.4.9
PKG_RELEASE:=1
PKG_MD5SUM:=98498c152cbfc388c306fd9bbf7d57d4

PKG_SOURCE_URL:=http://hostap.epitest.fi/releases
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/wpa-supplicant
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl
  TITLE:=WPA Supplicant
  DESCRIPTION:=WPA Supplicant
  URL:=http://hostap.epitest.fi/wpa_supplicant/
endef


define Package/wpa-cli
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=wpa-supplicant
  TITLE:=WPA Supplicant command line interface
  DESCRIPTION:=
endef


define Build/Configure
	cp ./files/config.$(ARCH) $(PKG_BUILD_DIR)/.config
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		KERNEL=$(LINUX_DIR) \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS=" -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		all
	$(STRIP) $(PKG_BUILD_DIR)/wpa_supplicant
	$(STRIP) $(PKG_BUILD_DIR)/wpa_cli
		
endef

define Package/wpa-supplicant/install
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/wpa_supplicant $(1)/usr/sbin/
endef

define Package/wpa-cli/install
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/wpa_cli $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,wpa-supplicant))
$(eval $(call BuildPackage,wpa-cli))



