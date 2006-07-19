# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=matrixssl
PKG_VERSION:=1.2.4
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://nbd.vd-s.ath.cx/openwrt
PKG_MD5SUM:=771c1489488e62668d673478311d63ca
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libmatrixssl
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libpthread
  TITLE:=Embedded SSL implementation
  DESCRIPTION:=An embedded SSL implementation.
  URL:=http://www.matrixssl.org/
endef

define Build/Configure
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/src \
		$(TARGET_CONFIGURE_OPTS) \
		DFLAGS="$(TARGET_CFLAGS) -Wall"
endef

define Package/libmatrixssl/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/src/libmatrixssl.so.* $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include/matrixSsl
	$(CP) $(PKG_BUILD_DIR)/matrixSsl.h $(STAGING_DIR)/usr/include/matrixSsl
	ln -sf matrixSsl/matrixSsl.h $(STAGING_DIR)/usr/include/matrixSsl.h
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/src/libmatrixssl.so* $(STAGING_DIR)/usr/lib
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/matrixSsl* \
		$(STAGING_DIR)/usr/lib/libmatrixssl.so*
endef

$(eval $(call BuildPackage,libmatrixssl))
