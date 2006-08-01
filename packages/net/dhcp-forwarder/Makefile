#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=dhcp-forwarder
PKG_VERSION:=0.7
PKG_RELEASE:=4
PKG_MD5SUM:=e7f876e615ebc3f96418f6477b4451e2

PKG_SOURCE_URL:=http://savannah.nongnu.org/download/dhcp-fwd
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/dhcp-forwarder
  SECTION:=net
  CATEGORY:=Network
  TITLE:=DHCP relay agent
  DESCRIPTION:=DHCP relay agent
  URL:=http://www.nongnu.org/dhcp-fwd/
endef

define Build/Configure
$(call Build/Configure/Default,,ac_cv_func_malloc_0_nonnull="yes")
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		cfg_filename="/etc/dhcp-fwd.conf" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef
	
define Package/dhcp-forwarder/install
	install -m0755 -d $(1)/etc
	install -m0644 $(PKG_BUILD_DIR)/contrib/dhcp-fwd.conf $(1)/etc/
	install -m0755 -d $(1)/etc/init.d
	install -m0755 ./files/dhcp-fwd.init $(1)/etc/init.d/dhcp-fwd
	install -m0755 -d $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/dhcp-fwd $(1)/usr/bin/
endef

$(eval $(call BuildPackage,dhcp-forwarder))
