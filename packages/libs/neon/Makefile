#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=neon
PKG_VERSION:=0.29.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.webdav.org/neon/
PKG_MD5SUM:=18a3764b70f9317f8b61509fd90d9e7a

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/libneon
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=HTTP and WebDAV client library
  URL:=http://www.webdav.org/neon/
  DEPENDS:=+libopenssl +libexpat
endef


TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--with-expat \
	--with-ssl="openssl" \
	--without-egd \
	--without-socks \

CONFIGURE_VARS += \
	LDFLAGS="$$$$LDFLAGS -lcrypto -lssl"

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/neon-config $(1)/usr/bin/
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/neon $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libneon.{a,so*} $(1)/usr/lib/
	mkdir -p $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/neon.pc $(1)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${includedir}/,-I$(1)/usr/include/,g' $(1)/usr/bin/neon-config
	$(SED) 's,-L$$$${libdir},,g' $(1)/usr/bin/neon-config
endef

define Package/libneon/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libneon.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libneon))
