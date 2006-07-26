# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ez-ipupdate
PKG_VERSION:=3.0.11b8
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
PKG_SOURCE_URL:=http://ftp.debian.org/debian/pool/main/e/ez-ipupdate \
	http://ftp.de.debian.org/debian/pool/main/e/ez-ipupdate
PKG_MD5SUM:=000211add4c4845ffa4211841bff4fb0
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk

define Package/ez-ipupdate
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Dynamic DNS services client
  DESCRIPTION:=Dynamic DNS services client.
  URL:=http://ez-ipupdate.com/
endef

define Package/ez-ipupdate/conffiles
/etc/ez-ipupdate.conf
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
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
	);
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/ez-ipupdate/install
	install -d -m0755 $(1)/etc
	install -m0600 ./files/$(PKG_NAME).conf $(1)/etc/
	install -d -m0755 $(1)/etc/hotplug.d/iface
	install -m0755 ./files/$(PKG_NAME).hotplug $(1)/etc/hotplug.d/iface/10-$(PKG_NAME)
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,ez-ipupdate))
