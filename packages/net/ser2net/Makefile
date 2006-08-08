#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$
	
include $(TOPDIR)/rules.mk

PKG_NAME:=ser2net
PKG_VERSION:=2.3
PKG_RELEASE:=1
PKG_MD5SUM:=5f83a3e8aec18331cb61069dccdfba47
 
PKG_SOURCE_URL:=@SF/ser2net/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat
	
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/ser2net
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Serial port TCP/IP redirector
  DESCRIPTION:=This is ser2net, a program for allowing network connections to serial\\\
	ports. See the man page for information about using the program. Note\\\
	that ser2net supports RFC 2217 (remote control of serial port parameters),\\\
	but you must have a complient client.\\\
  URL:=http://sourceforge.net/projects/ser2net
endef

define Package/ser2net/conffiles
/etc/ser2net.conf
endef

define Build/Configure	
	(cd $(PKG_BUILD_DIR); \
	$(TARGET_CONFIGURE_OPTS) \
	CFLAGS="$(TARGET_CFLAGS)" \
	./configure \
	--target=$(GNU_TARGET_NAME) \
	--host=$(GNU_TARGET_NAME) \
	--build=$(GNU_HOST_NAME) \
	--prefix=/usr \
	--sysconfdir=/etc \
	);
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
	$(TARGET_CONFIGURE_OPTS) \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	all install
endef
 
define Package/ser2net/install
	install -d -m0755 $(1)/usr/sbin
	cp -fpR $(PKG_INSTALL_DIR)/usr/sbin/ser2net $(1)/usr/sbin
	install -d -m0755 $(1)/etc
	cp -fpR $(PKG_BUILD_DIR)/ser2net.conf $(1)/etc
endef

$(eval $(call BuildPackage,ser2net))
