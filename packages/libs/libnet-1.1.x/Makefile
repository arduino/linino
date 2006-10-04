# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libnet
PKG_VERSION:=1.1.2.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME).tar.gz
PKG_SOURCE_URL:=http://www.packetfactory.net/libnet/dist/
PKG_MD5SUM:=be845c41170d72c7db524f3411b50256
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/libnet
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libnet1
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libpcap
  TITLE:=Low-level packet creation library (v1.1.x)
  URL:=http://www.packetfactory.net/libnet/
endef

ENDIANESS:=lil
ifeq ($(CONFIG_BIG_ENDIAN),y)
  ENDIANESS:=big
endif

define Build/Configure
	(cd $(PKG_BUILD_DIR); touch \
		configure.in \
		include.m4 \
		aclocal.m4 \
		Makefile.in \
		configure \
	);
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--with-pf_packet=yes \
		, \
		ac_libnet_have_pf_packet=yes \
		ac_cv_lbl_unaligned_fail=no \
		ac_cv_libnet_endianess=$(ENDIANESS) \
		ac_libnet_have_packet_socket=yes \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/lib/libnet-1.1.x/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/libnet-config $(STAGING_DIR)/usr/lib/libnet-1.1.x/bin/
	mkdir -p $(STAGING_DIR)/usr/lib/libnet-1.1.x/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libnet* $(STAGING_DIR)/usr/lib/libnet-1.1.x/include/
	mkdir -p $(STAGING_DIR)/usr/lib/libnet-1.1.x/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libnet.{a,so*} $(STAGING_DIR)/usr/lib/libnet-1.1.x/lib/
endef

define Build/UninstallDev
	rm -rf $(STAGING_DIR)/usr/lib/libnet-1.1.x
endef

define Package/libnet1/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libnet.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libnet1))
