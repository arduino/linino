# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xinetd
PKG_VERSION:=2.3.14
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.xinetd.org/
PKG_MD5SUM:=567382d7972613090215c6c54f9b82d9

include $(INCLUDE_DIR)/package.mk

define Package/xinetd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A powerful and secure super-server
  URL:=http://www.xinetd.org/
endef

define Package/xinetd/description
	xinetd has access control mechanisms, extensive logging capabilities,
	the ability to make services available based on time, can place limits
	on the number of servers that can be started, and has deployable
	defence mechanisms to protect against port scanners, among other
	things.
endef

define Package/xinetd/conffiles
/etc/xinetd.conf
endef

TARGET_CFLAGS += -DNO_RPC

define Build/Configure
	$(call Build/Configure/Default, \
		--without-libwrap \
		--with-loadavg \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		build install
endef

define Package/xinetd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/xinetd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/xinetd.conf $(1)/etc/xinetd.conf
	$(INSTALL_DIR) $(1)/etc/xinetd.d
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/xinetd.init $(1)/etc/init.d/xinetd
endef

$(eval $(call BuildPackage,xinetd))
