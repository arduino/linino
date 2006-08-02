# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=htpdate
PKG_VERSION:=0.9.0
PKG_RELEASE:=1
PKG_MD5SUM:=12cf883c5619cf4c13a62f77f1a55b54

PKG_SOURCE_URL:=http://www.clevervest.com/htp/archive/c/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/htpdate
  SECTION:=net
  CATEGORY:=Network
  TITLE:=an HTP (Hypertext Time Protocol) implementation
  DESCRIPTION:=an HTP (Hypertext Time Protocol) implementation
  URL:=http://www.clevervest.com/htp/
endef

define Package/htpdate/conffiles
/etc/default/htpdate
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)"
endef


define Package/htpdate/install	
	install -d -m0755 $(1)/etc/default/
	install -m0644 ./files/htpdate.default $(1)/etc/default/htpdate
	install -d -m0755 $(1)/etc/init.d/
	install -m0755 ./files/htpdate.init $(1)/etc/init.d/htpdate
	ln -sf htpdate $(1)/etc/init.d/S49htpdate
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/htpdate $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,htpdate))

