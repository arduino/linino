# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=tcpdump
PKG_VERSION:=3.9.8
PKG_RELEASE:=1.1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.tcpdump.org/release/ \
	http://ftp.gwdg.de/pub/misc/tcpdump/ \
	http://www.at.tcpdump.org/ \
	http://www.br.tcpdump.org/
PKG_MD5SUM:=c491a78c52fe73f1f7271aa5d8c6ab2e

include $(INCLUDE_DIR)/package.mk

define Package/tcpdump
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap
  TITLE:=Network monitoring and data acquisition tool
  URL:=http://www.tcpdump.org/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-ipv6 \
		--without-crypto \
		, \
		BUILD_CC="$(TARGET_CC)" \
		HOSTCC="$(HOSTCC)" \
		td_cv_buggygetaddrinfo="no" \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CCOPT="$(TARGET_CFLAGS)" INCLS="-I. -I$(STAGING_DIR)/usr/include" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/tcpdump/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/tcpdump $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,tcpdump))
