#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=unbound
PKG_VERSION:=1.4.5
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.unbound.net/downloads
PKG_MD5SUM:=f1f6c97b90b15ca503a80b888c311d6c

PKG_FIXUP:=libtool
PKG_INSTALL:=1
PKG_LIBTOOL_PATHS:= ./libtool ./ldns-src/libtool

include $(INCLUDE_DIR)/package.mk

define Package/unbound
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=IP Addresses and Names
  TITLE:=A validating, recursive, and caching DNS resolver
  URL:=http://www.unbound.net/
  DEPENDS:=+libopenssl
endef

CONFIGURE_ARGS += \
	--with-ssl="$(STAGING_DIR)/usr" \
	--without-pthreads \

define Package/unbound/conffiles
/etc/unbound/unbound.conf
endef

define Package/unbound/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libunbound.so.* \
		$(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/sbin/unbound \
		$(PKG_INSTALL_DIR)/usr/sbin/unbound-checkconf \
		$(PKG_INSTALL_DIR)/usr/sbin/unbound-control \
		$(PKG_INSTALL_DIR)/usr/sbin/unbound-host \
		$(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/unbound
	$(INSTALL_CONF) ./files/unbound.conf $(1)/etc/unbound/
	$(INSTALL_CONF) ./files/root.autokey $(1)/etc/unbound/
	$(INSTALL_CONF) ./files/named.cache $(1)/etc/unbound/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/unbound.init $(1)/etc/init.d/unbound
endef

$(eval $(call BuildPackage,unbound))

