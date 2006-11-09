#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 5348 2006-10-30 13:51:50Z nico $

include $(TOPDIR)/rules.mk

PKG_NAME:=tftp-hpa
PKG_VERSION:=0.43
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.kernel.org/pub/software/network/tftp
PKG_MD5SUM:=
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/tftp-hpa
 SECTION:=net
 CATEGORY:=Network
 TITLE:=tftp-hpa is an enhanced version of the BSD TFTP client
 URL:=http://www.kernel.org/pub/software/network/tftp
endef

define Package/tftpd-hpa
 SECTION:=net
 CATEGORY:=Network
 TITLE:=tftp-hpa is an enhanced version of the BSD TFTP server
 URL:=http://www.kernel.org/pub/software/network/tftp
endef

define Build/Configure	
	$(call Build/Configure/Default)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/tftp-hpa/install	
	install -d -m0755 $(1)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/tftp/tftp $(1)/usr/bin/tftp-hpa
endef

define Package/tftpd-hpa/install
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/tftpd/tftpd $(1)/usr/sbin/tftpd-hpa
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/tftpd-hpa.init $(1)/etc/init.d/tftpd-hpa
endef

$(eval $(call BuildPackage,tftp-hpa))
$(eval $(call BuildPackage,tftpd-hpa))
