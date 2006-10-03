# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libnids
PKG_VERSION:=1.18
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.packetfactory.net/projects/libnids/dist/
PKG_MD5SUM:=9ee6dcdfac97bae6fe611aa27d2594a5
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libnids
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libnet0
  TITLE:=A network intrusion detection library
  DESCRIPTION:=\
	An implementation of an E-component of Network Intrusion Detection \\\
	System.
  URL:=http://www.packetfactory.net/projects/libnids/
endef

define Build/Configure
	$(call Build/Configure/Default, \
			--enable-shared \
			--enable-static \
			--with-libnet="$(STAGING_DIR)/usr/lib/libnet-1.0.x" \
			--with-libpcap="$(STAGING_DIR)/usr" \
			, \
			CFLAGS="$$$$CFLAGS $$$$CPPFLAGS" \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		LNETLIB="-L$(STAGING_DIR)/usr/lib/libnet-1.0.x/lib -lnet" \
		PCAPLIB="-L$(STAGING_DIR)/usr/lib -lpcap" \
		install_prefix="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/nids.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libnids.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf	$(STAGING_DIR)/usr/include/nids.h \
		$(STAGING_DIR)/usr/lib/libnids.{a,so*}
endef

define Package/libnids/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libnids.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libnids))
