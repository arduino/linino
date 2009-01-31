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

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/fcgi
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Shared library of FastCGI
  DEPENDS:=+uclibcxx
  URL:=http://www.fastcgi.com/
endef

define Package/fcgi/description
 FastCGI is a language independent, scalable, open extension to 
 CGI that provides high performance without the limitations of 
 server specific APIs.
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \

CONFIGURE_VARS += \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/uClic++" \
	CXXFLAGS="$$$$CXXFLAGS -fno-builtin -fno-rtti -nostdinc++"  \
	LIBS="-nodefaultlibs -luClibc++ -lm" \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/fastcgi.h $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/fcgi{app,_config,misc,o,os,_stdio}.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfcgi.{a,so*} $(1)/usr/lib/
endef

define Package/fcgi/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/cgi-fcgi $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfcgi.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,fcgi))
