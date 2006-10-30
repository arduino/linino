#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=rp-pppoe
PKG_VERSION:=3.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://roaringpenguin.com/penguin/pppoe/
PKG_MD5SUM:=97972f8f8f6a3ab9b7070333a6a29c4b
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/rp-pppoe/Default
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+ppp
  TITLE:=PPPoE (PPP over Ethernet)
  URL:=http://roaringpenguin.com/penguin/pppoe/
endef
  
define Package/rp-pppoe-client
  $(call Package/rp-pppoe/Default)
  TITLE+= client
endef

define Package/rp-pppoe-relay
  $(call Package/rp-pppoe/Default)
  TITLE+= relay
endef

define Package/rp-pppoe-server
  $(call Package/rp-pppoe/Default)
  TITLE+= server
endef

define Package/rp-pppoe-sniff
  $(call Package/rp-pppoe/Default)
  TITLE+= sniffer
endef

define Build/Configure
	$(call Build/Configure/Default,,, src)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR)/src \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/rp-pppoe-client/install	
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/pppoe-client.init $(1)/etc/init.d/pppoe-client
	install -d -m0755 $(1)/etc/ppp
	install -m0644 $(PKG_INSTALL_DIR)/etc/pppoe.conf $(1)/etc/
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/pppoe $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/adsl-* $(1)/usr/sbin/
endef

define Package/rp-pppoe-relay/install	
	install -d -m0755 $(1)/etc/default
	install -m0755 ./files/pppoe-relay.default $(1)/etc/default/pppoe-relay
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/pppoe-relay.init $(1)/etc/init.d/pppoe-relay
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/pppoe-relay $(1)/usr/sbin/
endef

define Package/rp-pppoe-server/install	
	install -d -m0755 $(1)/etc/default
	install -m0755 ./files/pppoe-server.default $(1)/etc/default/pppoe-server
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/pppoe-server.init $(1)/etc/init.d/pppoe-server
	install -d -m0755 $(1)/etc/ppp
	install -m0644 $(PKG_INSTALL_DIR)/etc/ppp/pppoe-server-options $(1)/etc/ppp/
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/pppoe-server $(1)/usr/sbin/
endef

define Package/rp-pppoe-sniff/install	
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/pppoe-sniff $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,rp-pppoe-client))
$(eval $(call BuildPackage,rp-pppoe-relay))
$(eval $(call BuildPackage,rp-pppoe-server))
$(eval $(call BuildPackage,rp-pppoe-sniff))
