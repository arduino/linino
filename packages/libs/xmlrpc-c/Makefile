#
# Copyright (C) 2007-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $ sav $

include $(TOPDIR)/rules.mk

PKG_NAME:=xmlrpc-c
PKG_REV:=1835
PKG_VERSION:=1.20.2_r$(PKG_REV)
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://xmlrpc-c.svn.sourceforge.net/svnroot/xmlrpc-c/advanced
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_PROTO:=svn

PKG_BUILD_DEPENDS:=libcurl libxml2

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/xmlrpc-c
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=XML-RPC library for C/C++ (Xmlrpc-c)
  URL:=http://xmlrpc-c.sourceforge.net/
  DEPENDS:=+libcurl +libxml2
endef

define Package/xmlrpc-c/description
    Programming library for writing an XML-RPC server or client in C or C++.
    XML-RPC is a standard network protocol to allow a client program to make 
    a simple remote procedure call (RPC) type request of a server.
endef

CONFIGURE_ARGS+= \
	--enable-libxml2-backend \
	--disable-wininet-client \
	--disable-libwww-client \
	--disable-abyss-server \
	--disable-cplusplus \
	--disable-static \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/*.h $(1)/usr/include/
	mkdir -p $(1)/usr/include/xmlrpc-c
	$(CP) $(PKG_INSTALL_DIR)/usr/include/xmlrpc-c/*.h $(1)/usr/include/xmlrpc-c
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libxmlrpc*.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/xmlrpc-c-config $(1)/usr/bin/
	$(SED) 's,HEADERINST_DIR="/usr/include",HEADERINST_DIR="$(STAGING_DIR)/usr/include",g' $(1)/usr/bin/xmlrpc-c-config
	$(SED) 's,LIBINST_DIR="/usr/lib",LIBINST_DIR="$(STAGING_DIR)/usr/lib",g' $(1)/usr/bin/xmlrpc-c-config
	mkdir -p $(2)/bin
	ln -sf $(STAGING_DIR)/usr/bin/xmlrpc-c-config $(2)/bin/
endef

define Package/xmlrpc-c/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libxmlrpc*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,xmlrpc-c))
