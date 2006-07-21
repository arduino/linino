# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=chillispot
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_MD5SUM:=997827a9302a85920cfbc1334092ac0c

PKG_SOURCE_URL:=http://www.chillispot.org/download
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/chillispot
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=@+PACKAGE_KMOD_TUN
  TITLE:=Wireless LAN HotSpot controller
  DESCRIPTION:=Wireless LAN HotSpot controller\\\
    ChilliSpot is an open source captive portal or wireless LAN \\\
    access point controller. It is used for authenticating users \\\
    of a wireless LAN. It supports web based login which is today's \\\
    standard for public HotSpots and it supports Wireless Protected \\\
    Access (WPA) which is the standard of the future. Authentication, \\\
    authorization and accounting (AAA) is handled by your favorite \\\
    radius server.
  URL:=http://www.chillispot.org/
endef

define Package/chillispot/conffiles
/etc/chilli.conf
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -rf config.{cache,status} ; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		ac_cv_func_malloc_0_nonnull=yes \
		ac_cv_func_memcmp_working=yes \
		ac_cv_func_setvbuf_reversed=no \
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
			$(DISABLE_LARGEFILE) \
			$(DISABLE_NLS) \
			--enable-shared \
			--disable-static \
			--with-gnu-ld \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/chillispot/install
	install -m0755 -d $(1)/etc/init.d
	install -m0755 ./files/$(PKG_NAME).init $(1)/etc/init.d/chilli
	install -m0755 -d $(1)/etc
	install -m0644 $(PKG_BUILD_DIR)/doc/chilli.conf $(1)/etc/
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/chilli $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,chillispot))
