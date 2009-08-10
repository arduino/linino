#
# Copyright (C) 2007-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tcpdump
PKG_VERSION:=4.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.tcpdump.org/release/ \
	http://ftp.gwdg.de/pub/misc/tcpdump/ \
	http://www.at.tcpdump.org/ \
	http://www.br.tcpdump.org/
PKG_MD5SUM:=b22ca72890df2301d922c9f2d17867f9

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
		--without-crypto \
		, \
		BUILD_CC="$(TARGET_CC)" \
		HOSTCC="$(HOSTCC)" \
		td_cv_buggygetaddrinfo="no" \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CCOPT="$(TARGET_CFLAGS)" INCLS="-I. $(TARGET_CPPFLAGS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/tcpdump/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/tcpdump $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,tcpdump))
