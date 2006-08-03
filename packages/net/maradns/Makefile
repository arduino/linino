# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=maradns
PKG_VERSION:=1.2.07.2
PKG_RELEASE:=1
PKG_MD5SUM:=dc67f6a496e668127871382a40367733

PKG_SOURCE_URL:=http://www.maradns.org/download/1.2/1.2.07.2/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/maradns
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread
  TITLE:=Small and secure DNS Server
  DESCRIPTION:=A small and secure DNS server
  URL:=http://www.maradns.org/
endef

define Package/maradns/conffiles
/etc/mararc
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -rf config.{cache,status} ; \
		$(TARGET_CONFIGURE_OPTS) \
		./configure \
	);
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CFLAGS="$(TARGET_CFLAGS)" \
		FLAGS="$(TARGET_CFLAGS)" \
		CC=$(TARGET_CC) \
		HOSTCC="$(HOSTCC)"
	mkdir -p $(PKG_INSTALL_DIR)/usr/{bin,sbin}
	mkdir -p $(PKG_INSTALL_DIR)/usr/man/man{1,5,8}
	$(MAKE) -C $(PKG_BUILD_DIR) \
		PREFIX="$(PKG_INSTALL_DIR)/usr" \
		RPM_BUILD_ROOT="$(PKG_INSTALL_DIR)" \
		install
endef

define Package/maradns/install	
	install -d -m0755 $(1)/etc
	install -m0644 ./files/mararc $(1)/etc/mararc
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/maradns.init $(1)/etc/init.d/S60maradns
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/{askmara,getzone,fetchzone,duende} $(1)/usr/bin/
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/{maradns,zoneserver} $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,maradns))
