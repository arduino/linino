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

PKG_BUILD_DIR:=$(BUILD_DIR)/libnet
PKG_SOURCE:=$(PKG_NAME).tar.gz
PKG_SOURCE_URL:=http://www.packetfactory.net/libnet/dist/
PKG_MD5SUM:=be845c41170d72c7db524f3411b50256
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libnet1
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libpcap
  TITLE:=Low-level packet creation library
  DESCRIPTION:=Low-level packet creation library
  URL:=http://www.packetfactory.net/libnet/
endef

ENDIANESS:=lil
ifeq ($(ARCH),mips)
ENDIANESS:=big
endif
ifeq ($(ARCH),armeb)
ENDIANESS:=big
endif
ifeq ($(ARCH),powerpc)
ENDIANESS:=big
endif

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -rf config.cache; \
		touch configure.in; \
		touch include.m4; \
		touch aclocal.m4; \
		touch Makefile.in; \
		touch configure; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		ac_libnet_have_pf_packet=yes \
		ac_cv_lbl_unaligned_fail=no \
		ac_cv_libnet_endianess=$(ENDIANESS) \
		ac_libnet_have_packet_socket=yes \
		./configure \
			--target=$(GNU_TARGET_NAME) \
			--host=$(GNU_TARGET_NAME) \
			--build=$(GNU_HOST_NAME) \
			--program-prefix="" \
			--program-suffix="" \
			--prefix=/usr \
			--exec-prefix=/usr \
			--bindir=/usr/bin \
			--datadir=/usr/share \
			--includedir=/usr/include \
			--infodir=/usr/share/info \
			--libdir=/usr/lib \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc \
			$(DISABLE_NLS) \
			$(DISABLE_LARGEFILE) \
			--enable-shared \
			--enable-static \
			--with-pf_packet=yes \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/libnet1/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libnet.so.* $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/libnet-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libnet* $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libnet.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/libnet-config \
		$(STAGING_DIR)/usr/include/libnet*  \
		$(STAGING_DIR)/usr/lib/libnet.{a,so*}
endef

$(eval $(call BuildPackage,libnet1))
