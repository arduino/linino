#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=aria2
PKG_VERSION:=1.14.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/aria2
PKG_MD5SUM:=3a23844ab3e1460eb7e6dac9b5dd798c
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/aria2
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Lightweight download utility
  URL:=http://aria2.sourceforge.net/
  DEPENDS:=+libopenssl +zlib +libxml2 +libstdcpp \
	$(INTL_DEPENDS) $(ICONV_DEPENDS)
endef

define Package/aria2/description
 aria2 is a lightweight multi-protocol & multi-source download utility 
 operated in command-line. It supports HTTP/HTTPS, FTP, BitTorrent and 
 Metalink. aria2 has built-in JSON-RPC and XML-RPC interface. You can 
 manipulate aria2 via these interfaces.
endef

CONFIGURE_ARGS += \
	--without-gnutls \
	--without-libnettle \
	--without-libgmp \
	--without-libgcrypt \
	--with-openssl \
	--without-sqlite3 \
	--with-libxml2 \
	--without-libexpat \
	--without-libcares \
	--with-libz

CONFIGURE_VARS += \
	ZLIB_CFLAGS="-I$(STAGING_DIR)/usr/include" \
	ZLIB_LIBS="-L$(STAGING_DIR)/usr/lib"

define Package/aria2/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/aria2c $(1)/usr/bin/
endef

$(eval $(call BuildPackage,aria2))
