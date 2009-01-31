#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=nmap
PKG_VERSION:=4.20
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://download.insecure.org/nmap/dist
PKG_MD5SUM:=ea50419f99472200c4184a304e3831ea

include $(INCLUDE_DIR)/package.mk

define Package/nmap
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libdnet +libpcap +libpcre +uclibcxx
  TITLE:=Network exploration and/or security auditing utility
  URL:=http://www.insecure.org/nmap/
endef

define Package/nmap/description
 A free open source utility for network exploration or security auditing.
endef

CONFIGURE_ARGS += \
	--without-openssl \
	--without-nmapfe \
	--with-libdnet="$(STAGING_DIR)/usr" \
	--with-libpcap="$(STAGING_DIR)/usr" \
	--with-libpcre="$(STAGING_DIR)/usr" \

CONFIGURE_VARS += \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/uClibc++" \
	CXXFLAGS="$$$$CXXFLAGS -fno-builtin -fno-rtti -nostdinc++" \
	LIBS="-nodefaultlibs -luClibc++ -lgcc" \

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/nmap/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/nmap $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share/nmap
	for file in mac-prefixes os-fingerprints protocols rpc service-probes services; do \
		$(CP) $(PKG_INSTALL_DIR)/usr/share/nmap/nmap-$$$$file $(1)/usr/share/nmap/ ; \
	done
endef

$(eval $(call BuildPackage,nmap))
