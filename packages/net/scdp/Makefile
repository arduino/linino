#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=scdp
PKG_VERSION:=1.0b
PKG_RELEASE:=1
PKG_MD5SUM:=7eafaf5a422e37d04715613993ed5d95

PKG_SOURCE_URL:=@SF/scdp
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/scdp
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libnet
  TITLE:=An utility to send CDP (Cisco Discovery Protocol) packets
  DESCRIPTION:=This program sends CDP (Cisco Discovery Protocol) packets out on\\\
	selected interfaces and tells the connected switch (cisco only)\\\
	where the host is connected.\\\
  URL:=http://sourceforge.net/projects/scdp
endef
			
define Build/Configure
$(call Build/Configure/Default,--enable-shared)
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)/
	mkdir -p $(PKG_INSTALL_DIR)/
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR=$(PKG_INSTALL_DIR) \
		all install
endef

define Package/scdp/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/scdp $(1)/usr/bin/
endef

$(eval $(call BuildPackage,scdp))
