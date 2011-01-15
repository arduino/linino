#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xmlrpc-c
PKG_REV:=2042
PKG_VERSION:=1.24.4_r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://xmlrpc-c.svn.sourceforge.net/svnroot/xmlrpc-c/advanced
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_PROTO:=svn

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/xmlrpc-c_common
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=XML-RPC library for C/C++ (Xmlrpc-c) - common
  URL:=http://xmlrpc-c.sourceforge.net/
endef

define Package/xmlrpc-c
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=XML-RPC library for C/C++ (Xmlrpc-c)
  URL:=http://xmlrpc-c.sourceforge.net/
  DEPENDS:=+libxml2 +xmlrpc-c_common
endef

define Package/xmlrpc-c_client
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=XML-RPC library for C/C++ (Xmlrpc-c) - client
  URL:=http://xmlrpc-c.sourceforge.net/
  DEPENDS:=+xmlrpc-c +libcurl
endef

define Package/xmlrpc-c_server
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=XML-RPC library for C/C++ (Xmlrpc-c) - server
  URL:=http://xmlrpc-c.sourceforge.net/
  DEPENDS:=+xmlrpc-c
endef

define Package/xmlrpc-c_server-abyss
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=XML-RPC library for C/C++ (Xmlrpc-c) - abyss server
  URL:=http://xmlrpc-c.sourceforge.net/
  DEPENDS:=+xmlrpc-c_server
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
	--enable-abyss-server \
	--disable-cplusplus \
	--disable-static \
	--disable-abyss-threads \
	--disable-cgi-server

# define Build/Compile
# 	( cd $(PKG_BUILD_DIR)/lib/expat/gennmtab && cc -I$(PKG_BUILD_DIR) -c gennmtab.c -o gennmtab.o && cc -o gennmtab  gennmtab.o )
# 	$(call Build/Compile/Default)
# endef

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/include \
		$(1)/usr/lib \
		$(1)/usr/bin \
		$(2)/bin

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libxmlrpc*.{a,so*} \
		$(1)/usr/lib/

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/xmlrpc-c-config \
		$(2)/bin/

	$(SED) \
		's,HEADERINST_DIR="/usr/include",HEADERINST_DIR="$(STAGING_DIR)/usr/include",g' \
		$(2)/bin/xmlrpc-c-config

	$(SED) \
		's,LIBINST_DIR="/usr/lib",LIBINST_DIR="$(STAGING_DIR)/usr/lib",g' \
		$(2)/bin/xmlrpc-c-config
endef

define Package/xmlrpc-c/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libxmlrpc.so* \
		$(1)/usr/lib/
endef


define Package/xmlrpc-c_server/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libxmlrpc_server.so* \
		$(1)/usr/lib/
endef

define Package/xmlrpc-c_server-abyss/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libxmlrpc_server_abyss.so* \
		$(1)/usr/lib/
endef

define Package/xmlrpc-c_client/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libxmlrpc_client* \
		$(1)/usr/lib/
endef

define Package/xmlrpc-c_common/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libxmlrpc_util.so* \
		$(1)/usr/lib/
endef


$(eval $(call BuildPackage,xmlrpc-c))
$(eval $(call BuildPackage,xmlrpc-c_server))
$(eval $(call BuildPackage,xmlrpc-c_server-abyss))
$(eval $(call BuildPackage,xmlrpc-c_client))
$(eval $(call BuildPackage,xmlrpc-c_common))
