#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# crazy_imp

include $(TOPDIR)/rules.mk

PKG_NAME:=neon
PKG_VERSION:=0.26.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.webdav.org/neon/
PKG_MD5SUM:=6e52cd9c03e372026d6eccbfb80f09ef
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/neon
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libopenssl +libxml2 +libintl
  TITLE:=neon - HTTP and WebDAV client library
  URL:=http://www.webdav.org/neon/
endef

define Build/Configure	
	$(call Build/Configure/Default, \
		--enable-shared \
		--with-libxml2 \
		--with-ssl=openssl \
		--without-egd \
		--without-socks \
		, \
		LDFLAGS="-lcrypto -lssl -L$(STAGING_DIR)/usr/lib" \
		CFLAGS="-I$(STAGING_DIR)/include \
		       	-I$(STAGING_DIR)/usr/include/libxml2 \
			-I$(STAGING_DIR)/usr/lib/libintl/include" \
	)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/neon-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include/neon
	$(CP) $(PKG_INSTALL_DIR)/usr/include/neon/* $(STAGING_DIR)/usr/include/neon/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/{libneon.a,libneon.la,libneon.so,libneon.so.26,libneon.so.26.0.3} $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/neon.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED)  "s,\=\/usr,\=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/bin/neon-config
	$(SED)  "s,"libdir\=\'/usr/lib\'",libdir='$(STAGING_DIR)/usr/lib\'," $(STAGING_DIR)/usr/lib/libneon.la
endef

define Build/UninstallDev
	rm	$(STAGING_DIR)/usr/bin/neon-config \
		$(STAGING_DIR)/usr/lib/{libneon.a,libneon.la,libneon.so,libneon.so.26,libneon.so.26.0.3} \
		$(STAGING_DIR)/usr/lib/pkgconfig/neon.pc
	rm -rf	$(STAGING_DIR)/usr/include/neon
endef

define Package/neon/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/neon-config $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/neon.pc $(1)/usr/lib/pkgconfig/
endef

$(eval $(call BuildPackage,neon))
