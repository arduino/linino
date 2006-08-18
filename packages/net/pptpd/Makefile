# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id:$

include $(TOPDIR)/rules.mk

PKG_NAME:=pptpd
PKG_VERSION:=1.3.0
PKG_RELEASE:=1
PKG_MD5SUM:=75d494e881f7027f4e60b114163f6b67

PKG_SOURCE_URL:=@SF/poptop
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat


PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/pptpd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=
  TITLE:=PopTop pptp server
  DESCRIPTION:=PopTop pptp server
endef


define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -rf config.{cache,status}; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
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
		  --with-pppd-ip-alloc \
	)
endef

define Build/Compile
  $(call Build/Compile/Default, \
		CFLAGS="$(TARGET_CFLAGS) -DSBINDIR=\\\"/usr/sbin\\\"" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		INSTALL="install" \
		all install \
  )
endef

define Package/pptpd/install
	install -d -m0755 $(1)/etc
	install -m0644 ./files/pptpd.conf $(1)/etc/
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/pptpd.init $(1)/etc/init.d/S50pptpd
	install -d -m0755 $(1)/etc/ppp
	install -m0644 ./files/options.pptpd $(1)/etc/ppp/
	install -d -m0755 $(1)/usr/sbin
	install -d -m0755 $(1)/usr/lib/pptpd
	cp -fpR $(PKG_INSTALL_DIR)/usr/sbin/pptpd $(1)/usr/sbin/
	cp -fpR $(PKG_INSTALL_DIR)/usr/sbin/pptpctrl $(1)/usr/sbin/
	cp -fpR $(PKG_INSTALL_DIR)/usr/lib/pptpd/* $(1)/usr/lib/pptpd
	$(STRIP) $1/usr/sbin/*
	$(STRIP) $1/usr/lib/pptpd/*
endef

$(eval $(call BuildPackage,pptpd))



