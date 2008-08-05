#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$
	
include $(TOPDIR)/rules.mk

PKG_NAME:=ser2net
PKG_VERSION:=2.5
PKG_RELEASE:=1
 
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/ser2net
PKG_MD5SUM:=c11f36ff2e4c523be7b282f2f6d03638
	
include $(INCLUDE_DIR)/package.mk

define Package/ser2net
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Serial port TCP/IP redirector
  URL:=http://sourceforge.net/projects/ser2net/
endef

define Package/ser2net/description
	This is ser2net, a program for allowing network connections to serial 
	ports. See the man page for information about using the program. Note 
	that ser2net supports RFC 2217 (remote control of serial port parameters), 
	but you must have a complient client.
endef

define Package/ser2net/conffiles
/etc/ser2net.conf
endef

# uses GNU configure

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef
 
define Package/ser2net/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/ser2net $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_BUILD_DIR)/ser2net.conf $(1)/etc/
endef

$(eval $(call BuildPackage,ser2net))
