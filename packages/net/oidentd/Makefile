# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id:$

include $(TOPDIR)/rules.mk

PKG_NAME:=oidentd
PKG_VERSION:=2.0.8
PKG_RELEASE:=1
PKG_MD5SUM:=c3d9a56255819ef8904b867284386911

PKG_SOURCE_URL:=@SF/ojnk
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat


PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/oidentd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=
  TITLE:=Identd server 
  DESCRIPTION:=A nat aware identd server that will correctly forwared requests to clients
endef


define Build/Configure
$(call Build/Configure/Default,--includedir=$(PKG_BUILD_DIR)/)
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC=$(TARGET_CC)
	$(STRIP) $(PKG_BUILD_DIR)/src/$(PKG_NAME)
endef

define Package/oidentd/install
	install -m0755 -d $(1)/usr/sbin
	install -m0755 -d $(1)/etc/init.d
	$(CP) $(PKG_BUILD_DIR)/src/$(PKG_NAME) $(1)/usr/sbin/
	$(CP) ./files/S85oidentd $(1)/etc/init.d
endef

$(eval $(call BuildPackage,oidentd))



