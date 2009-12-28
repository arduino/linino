# $Id: Makefile xxxx 2009-11-18 07:14:33Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=c-ares
PKG_VERSION:=1.6.0
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://c-ares.haxx.se/
PKG_SOURCE:=c-ares-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=4503b0db3dd79d3c1f58d87722dbab46
PKG_CAT:=zcat

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libcares
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Library for asyncronous name resolves
  URL:=$(PKG_SOURCE_URL)
endef

define Package/libcares/description
  c-ares is a C library that performs DNS requests and name resolves asynchronously.
endef

define Package/libcares/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,libcares))

