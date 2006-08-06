#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ndisc6
PKG_VERSION:=0.5.1
PKG_RELEASE:=1
PKG_MD5SUM:=33487fe5505b195eb31468d88ba9ab56

PKG_SOURCE_URL:=http://people.via.ecp.fr/~rem/ndisc6/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/ndisc
  SECTION:=ipv6
  CATEGORY:=IPv6
  SUBMENU:=IPv6 discovery tools
  TITLE:=IPv6 discovery tools
  DESCRIPTION:=IPv6 discovery tools
  URL:=http://people.via.ecp.fr/~rem/ndisc6/
endef

define Package/ndisc6
  $(call Package/ndisc)
  TITLE:=An ICMPv6 neighbour discovery tool
  DESCRIPTION:=An ICMPv6 neighbour discovery tools
endef

define Package/rdisc6
  $(call Package/ndisc)
  TITLE:=An ICMPv6 router discovery tool
  DESCRIPTION:=An ICMPv6 router discovery tool
endef

define Package/tcptraceroute6
  $(call Package/ndisc)
  TITLE:=A TCP/IPv6-based traceroute implementation
  DESCRIPTION:=A TCP/IPv6-based traceroute implementation
endef 
  

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		all
endef

define Package/ndisc6/install	
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/ndisc6 $(1)/usr/bin/
endef

define Package/rdisc6/install	
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/rdisc6 $(1)/usr/bin/
endef

define Package/tcptraceroute6/install	
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/tcptraceroute6 $(1)/usr/bin/
endef

$(eval $(call BuildPackage,ndisc6))
$(eval $(call BuildPackage,rdisc6))
$(eval $(call BuildPackage,tcptraceroute6))
