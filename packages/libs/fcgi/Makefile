#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=fcgi
PKG_VERSION:=2.4.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.fastcgi.com/dist/
PKG_MD5SUM:=d15060a813b91383a9f3c66faf84867e

include $(INCLUDE_DIR)/package.mk

define Package/fcgi
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Shared library of FastCGI
  DESCRIPTION:=\
	FastCGI is a language independent, scalable, open extension to \\\
	CGI that provides high performance without the limitations of \\\
	server specific APIs.
  URL:=http://www.fastcgi.com/
endef

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static

MAKE_FLAGS += \
	CCOPT="$(TARGET_CFLAGS) -I$(BUILD_DIR)/linux/include" \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	LDFLAGS="$(LDFLAGS) -lm" \
	all install

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(STAGING_DIR)/usr/include/
	$(INSTALL_DIR) $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfcgi.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/f*cgi*.h \
		$(STAGING_DIR)/usr/lib/libfcgi.{a,so*}
endef

define Package/fcgi/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfcgi.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/cgi-fcgi $(1)/usr/bin/
endef

$(eval $(call BuildPackage,fcgi))
