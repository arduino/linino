# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 5624 2006-11-23 00:29:07Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=libpam
PKG_VERSION:=0.99.6.3
PKG_RELEASE:=1

PKG_SOURCE:=Linux-PAM-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.kernel.org/pub/linux/libs/pam/pre/library/
PKG_MD5SUM:=0f17f7105faa82a51dfbeb6b08a1ca29
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/Linux-PAM-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libpam
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=free implementation of the following DCE-RFC from Sunsoft.
  DESCRIPTION:=\
	Linux-PAM is a free implementation of the following DCE-RFC from Sunsoft. \\\
  URL:=http://www.kernel.org/pub/linux/libs/pam
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--enable-pamlocking \
		--disable-prelude \
		--disable-lckpwdf \
		--disable-selinux \
		--disable-nls \
		--disable-rpath \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/lib $(STAGING_DIR)/lib
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/lib/* $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(STAGING_DIR)/usr/include
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/security \
		$(STAGING_DIR)/lib/libpam.* \
		$(STAGING_DIR)/lib/security 
endef

define Package/libpam/install
	$(INSTALL_DIR) $(1)/lib
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/lib/
	$(CP) $(PKG_INSTALL_DIR)/etc/* $(1)/etc/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/* $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,libpam))
