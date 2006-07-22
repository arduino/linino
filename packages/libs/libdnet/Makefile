# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libdnet
PKG_VERSION:=1.10
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/libdnet-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=416b765e9d9961501ac85e9a366fd219
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libdnet
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Low-level network library
  DESCRIPTION:=Low-level network library.\\\
    libdnet is a library of simplified, portable interface to several \\\
    low-level networking routines.
  URL:=http://sourceforge.net/projects/libdnet/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		touch configure.in; \
		touch include.m4; \
		touch aclocal.m4; \
		touch Makefile.in; \
		touch configure; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
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
			--localstatedir=/var/run \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc \
			$(DISABLE_NLS) \
			$(DISABLE_LARGEFILE) \
			--enable-shared \
			--enable-static \
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

define Package/libdnet/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libdnet.so.* $(1)/usr/lib/
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/dnet $(1)/usr/sbin/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/dnet-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/dnet.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/dnet $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libdnet.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/bin/dnet-config \
		$(STAGING_DIR)/usr/include/dnet.h  \
		$(STAGING_DIR)/usr/include/dnet  \
		$(STAGING_DIR)/usr/lib/libdnet.{a,so*}
endef

$(eval $(call BuildPackage,libdnet))
