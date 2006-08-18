#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=reaim
PKG_VERSION:=0.8
PKG_RELEASE:=1
PKG_MD5SUM:=647d2ab72ec454f89294accfb3182c09

PKG_SOURCE_URL:=@SF/reaim
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/reaim
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+iptables
  TITLE:=A transparent AIM / MSN proxy
  DESCRIPTION:=ReAIM is a proxy for file transfers with MSN/AIM.
  URL:=http://reaim.sourceforge.net
endef

define Build/Compile	
  $(call Build/Compile/Default, \
		CFLAGS="$(TARGET_CFLAGS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install \
  )
endef

define Package/reaim/install	
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/reaim.init $(1)/etc/init.d/reaim
	ln -sf reaim $(1)/etc/init.d/S63reaim
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/reaim $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,reaim))
