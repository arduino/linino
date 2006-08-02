# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=gmediaserver
PKG_VERSION:=0.9.0
PKG_RELEASE:=1
PKG_MD5SUM:=93de0f8dcbc1353a0d0dd5b5ab4b3142

PKG_SOURCE_URL:=http://savannah.nongnu.org/download/gmediaserver/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/gmediaserver
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+id3lib +libupnp
  TITLE:=An UPnP music media server
  DESCRIPTION:=An UPnP music media server.
  URL:=http://www.nongnu.org/gmediaserver/
endef


define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -rf config.{cache,status} ; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		LIBS=" -lixml -lthreadutil -lupnp -luClibc++ -lz" \
		am_cv_func_iconv=no \
		./configure \
			--target=$(GNU_TARGET_NAME) \
			--host=$(GNU_TARGET_NAME) \
			--build=$(GNU_HOST_NAME) \
			--program-prefix="" \
			--program-suffix="" \
			--prefix=/usr \
			--exec-prefix=/usr \
			--bindir=/usr/bin \
			--datadir=/usr/share \
			--includedir=/usr/include \
			--infodir=/usr/share/info \
			--libdir=/usr/lib \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc \
			$(DISABLE_LARGEFILE) \
			$(DISABLE_NLS) \
			--enable-shared \
			--disable-static \
			--disable-rpath \
			--with-gnu-ld \
			--with-id3lib="$(STAGING_DIR)/usr" \
			--with-libupnp="$(STAGING_DIR)/usr" \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/gmediaserver/install
	install -m0755 -d $(1)/etc/default
	install -m0644 ./files/gmediaserver.default $(1)/etc/default/gmediaserver
	install -m0755 -d $(1)/etc/init.d
	install -m0755 ./files/gmediaserver.init $(1)/etc/init.d/gmediaserver
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/gmediaserver $(1)/usr/sbin/
	$(RSTRIP) $(1)
	$(IPKG_BUILD) $(1) $(PACKAGE_DIR)
endef

$(eval $(call BuildPackage,gmediaserver))
