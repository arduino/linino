#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=nmap
PKG_VERSION:=4.01
PKG_RELEASE:=1

PKG_MD5SUM:=09c259837b24f6c7385c2c1c49760a7c
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://download.insecure.org/nmap/dist
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/nmap
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libdnet +libpcap +libpcre +uclibcxx
  TITLE:=Network exploration and/or security auditing utility
  DESCRIPTION:=\
  	A free open source utility for network exploration or security auditing.
  URL:=http://www.insecure.org/nmap/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--without-openssl \
		--without-nmapfe \
		--with-libdnet="$(STAGING_DIR)/usr" \
		--with-libpcap="$(STAGING_DIR)/usr" \
		--with-libpcre="$(STAGING_DIR)/usr" \
		, \
		CXXFLAGS="$$$$CXXFLAGS -fno-builtin -fno-rtti -nostdinc++" \
		LIBS="-nodefaultlibs -luClibc++ -lc -lm -lgcc" \
	)
endef

define Build/Compile	
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/nmap/install	
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/nmap $(1)/usr/bin/
	install -d -m0755 $(1)/usr/share/nmap
	for file in mac-prefixes os-fingerprints protocols rpc service-probes services; do \
		$(CP) $(PKG_INSTALL_DIR)/usr/share/nmap/nmap-$$$$file $(1)/usr/share/nmap/ ; \
	done
endef

$(eval $(call BuildPackage,nmap))
