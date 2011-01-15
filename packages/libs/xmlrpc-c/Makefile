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

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/xmlrpc-c_common
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=XML-RPC library - common
  URL:=http://xmlrpc-c.sourceforge.net/
endef

define Package/xmlrpc-c_internal
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=XML-RPC library - (ueses internal expat variant)
  URL:=http://xmlrpc-c.sourceforge.net/
  DEPENDS:=+xmlrpc-c_common
  PROVIDES:=xmlrpc-c
  VARIANT:=internal
endef

define Package/xmlrpc-c_libxml2
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=XML-RPC library - (uses libxml2)
  URL:=http://xmlrpc-c.sourceforge.net/
  DEPENDS:=+xmlrpc-c_common +libxml2
  PROVIDES:=xmlrpc-c
  VARIANT:=libxml2
endef

define Package/xmlrpc-c_client
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=XML-RPC library - client
  URL:=http://xmlrpc-c.sourceforge.net/
  DEPENDS:=xmlrpc-c +libcurl
endef

define Package/xmlrpc-c_server
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=XML-RPC library - server
  URL:=http://xmlrpc-c.sourceforge.net/
  DEPENDS:=xmlrpc-c
endef

define Package/xmlrpc-c_abyss
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=XML-RPC library - abyss
  URL:=http://xmlrpc-c.sourceforge.net/
  DEPENDS:=+xmlrpc-c_common
endef

define Package/xmlrpc-c_server-abyss
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=XML-RPC library - abyss server
  URL:=http://xmlrpc-c.sourceforge.net/
  DEPENDS:=+xmlrpc-c_server +xmlrpc-c_abyss
endef

define Package/xmlrpc-c/description/Default
    Programming library for writing an XML-RPC server or client in C or C++.
    XML-RPC is a standard network protocol to allow a client program to make
    a simple remote procedure call (RPC) type request of a server.
endef

Package/xmlrpc-c_common/description = $(Package/xmlrpc-c/description/Default)
Package/xmlrpc-c_libxml2/description = $(Package/xmlrpc-c/description/Default)
Package/xmlrpc-c_internal/description = $(Package/xmlrpc-c/description/Default)

Package/xmlrpc-c_libxml2/description += Uses external libxml2 library (quite big)
Package/xmlrpc-c_internal/description += Uses internal expat variant (stripped down)

CONFIGURE_ARGS+= \
	--disable-wininet-client \
	--disable-libwww-client \
	--enable-abyss-server \
	--disable-cplusplus \
	--disable-static \
	--disable-abyss-threads \
	--disable-cgi-server

ifeq ($(BUILD_VARIANT),libxml2)
	CONFIGURE_ARGS += \
		--enable-libxml2-backend
endif

ifeq ($(BUILD_VARIANT),internal)
	CONFIGURE_ARGS += \
		--disable-libxml2-backend
endif

define Build/Compile
	( cd $(PKG_BUILD_DIR)/lib/expat/gennmtab && cc -I$(PKG_BUILD_DIR) -c gennmtab.c -o gennmtab.o && cc -o gennmtab  gennmtab.o )
	$(call Build/Compile/Default)
endef

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

define Package/xmlrpc-c_libxml2/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libxmlrpc.so* \
		$(1)/usr/lib/
endef

define Package/xmlrpc-c_internal/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libxmlrpc.so* \
		$(1)/usr/lib/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libxmlrpc_xmltok.so* \
		$(1)/usr/lib/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libxmlrpc_xmlparse.so* \
		$(1)/usr/lib/
endef

define Package/xmlrpc-c_server/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libxmlrpc_server.so* \
		$(1)/usr/lib/
endef

define Package/xmlrpc-c_abyss/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libxmlrpc_abyss.so* \
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


$(eval $(call BuildPackage,xmlrpc-c_common))
$(eval $(call BuildPackage,xmlrpc-c_libxml2))
$(eval $(call BuildPackage,xmlrpc-c_internal))
$(eval $(call BuildPackage,xmlrpc-c_server))
$(eval $(call BuildPackage,xmlrpc-c_abyss))
$(eval $(call BuildPackage,xmlrpc-c_server-abyss))
$(eval $(call BuildPackage,xmlrpc-c_client))
