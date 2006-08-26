# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ctorrent
PKG_VERSION:=1.3.4-dnh2
PKG_RELEASE:=1
PKG_MD5SUM:=6635e2d0d0ee21faeb85d95cd93c137b

PKG_SOURCE_URL:=http://www.rahul.net/dholmes/ctorrent/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-dnh2
PKG_CAT:=zcat
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/ctorrent
  SECTION:=net
  CATEGORY:=Network
  TITLE:=console-based BitTorrent client
  DESCRIPTION:=CTorrent is a BitTorrent client written in the C programming language, known to\\\
	be a very robust and mature programming language, which produces fast and\\\
	optimized application.\\\
  URL:=http://www.rahul.net/dholmes/ctorrent/
endef
   
define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -rf config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include/openssl" \
		LDFLAGS="-static -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		./configure \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=/usr \
		--exec-prefix=/usr \
		--bindir=/usr/bin \
		--sbindir=/usr/sbin \
		--libexecdir=/usr/lib \
		--sysconfdir=/etc \
		--datadir=/usr/share \
		--localstatedir=/var \
		--mandir=/usr/man \
		--infodir=/usr/info \
		--program-prefix="" \
		--with-gnu-ld \
	);
endef

define Build/Compile	
  $(call Build/Compile/Default, DESTDIR=$(PKG_INSTALL_DIR)  install)
endef
	
define Package/ctorrent/install	
	mkdir -p $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,ctorrent))
