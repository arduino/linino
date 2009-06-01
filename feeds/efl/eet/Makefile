# 
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 12228 2008-08-06 22:43:15Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=eet
PKG_REV:=40853
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://svn.enlightenment.org/svn/e/trunk/$(PKG_NAME)
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/$(PKG_NAME)-$(PKG_VERSION)/

PKG_FIXUP = libtool

HOST_BUILD_DEPENDS:=libjpeg/host eina/host

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/eet
  SECTION:=xorg-lib
  CATEGORY:=Xorg
  SUBMENU:=libraries
  TITLE:=EET is a tiny library designed to write an arbitary set of chunks of data to a file
  URL:=http://wiki.enlightenment.org/index.php/Eet
  DEPENDS:=+libjpeg +zlib +eina
endef

define Package/eet/description
  EET is a tiny library designed to write an arbitary set of chunks of data to a file and optionally compress each chunk (very much like a zip file) and allow fast random-access reading of the file later on. EET files are perfect for storing data that is written once (or rarely) and read many times, especially when the program does not want to have to read all the data in at once.
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); NOCONFIGURE=YES ./autogen.sh );
	$(call Build/Configure/Default, \
		--disable-old-eet-file-format \
		--disable-gnutls \
		--disable-new-gnutls-api \
		--disable-openssl \
		--disable-cipher \
		--disable-signature \
		--disable-assert \
		--disable-tests \
		--disable-coverage \
		--disable-doc \
	)
endef

define Host/Configure
	( cd $(HOST_BUILD_DIR); NOCONFIGURE=YES ./autogen.sh );
	$(call Host/Configure/Default, \
		--disable-old-eet-file-format \
		--disable-gnutls \
		--disable-new-gnutls-api \
		--disable-openssl \
		--disable-cipher \
		--disable-signature \
		--disable-assert \
		--disable-tests \
		--disable-coverage \
		--disable-doc \
	)
endef

define Build/Compile
	DESTDIR="$(PKG_INSTALL_DIR)" $(MAKE) -C $(PKG_BUILD_DIR) all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Package/eet/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libeet*.so* $(1)/usr/lib/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,eet))
