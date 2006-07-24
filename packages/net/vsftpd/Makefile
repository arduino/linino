# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=vsftpd
PKG_VERSION:=2.0.4
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://vsftpd.beasts.org/users/cevans/
PKG_MD5SUM:=c0bf8c7b8e15ab15827172786fc56115
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/vsftpd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A fast and secure FTP server
  DESCRIPTION:=A fast and secure FTP server.
  URL:=http://vsftpd.beasts.org/
endef

define Package/vsftpd/conffiles
/etc/vsftpd.conf
endef

define Build/Configure
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		vsftpd install
endef

define Package/vsftpd/install
	install -d -m0755 $(1)/etc
	install -m0644 ./files/vsftpd.conf $(1)/etc/vsftpd.conf
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/vsftpd.init $(1)/etc/init.d/vsftpd
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/vsftpd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,vsftpd))
