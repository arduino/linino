# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=bitlbee
PKG_VERSION:=1.0.1
PKG_RELEASE:=1
PKG_MD5SUM:=a4d7daa9b64898dd41a3a6d104692d9a

PKG_SOURCE_URL:=http://get.bitlbee.org/src \
	http://get.bitlbee.be/src \
	http://get.us.bitlbee.org/src \
	http://ftp.snt.utwente.nl/pub/software/bitlbee/src
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

PKG_BUILDDEP:=openssl glib libiconv

include $(INCLUDE_DIR)/package.mk

define Package/bitlbee
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl +glib1 +libiconv
  TITLE:=IRC gateway to IM chat networks
  DESCRIPTION:=IRC gateway to IM chat networks
  URL:=http://www.bitlbee.org/
endef

define Package/bitlbee/conffiles
/etc/bitlbee/motd.txt
/etc/bitlbee/bitlbee.conf
/etc/init.d/S55bitlbee
endef

define Build/Configure
(cd $(PKG_BUILD_DIR); \
	$(TARGET_CONFIGURE_OPTS) \
	CFLAGS="$(TARGET_CFLAGS)" \
	CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
	STAGING_DIR="$(STAGING_DIR)" \
	STRIP="$(STRIP)" \
	./configure \
	--prefix=/usr/ \
	--bindir=/usr/sbin/ \
	--etcdir=/etc/bitlbee/ \
	--datadir=/usr/share/bitlbee/ \
	--config=/var/lib/bitlbee/ \
	--arch=OpenWrt \
	--cpu="$(ARCH)" \
	--debug=0 \
	--strip=1 \
	--sizeopt=1 \
	--ipv6=1 \
	--ssl=openssl \
	--glib1=1 \
	--glib1prefix="$(STAGING_DIR)/usr" \
);
endef

define Build/Compile
	@echo 'CFLAGS+="-I$(STAGING_DIR)/usr/include/iconv"' >> \
		$(PKG_BUILD_DIR)/Makefile.settings
	@echo 'LFLAGS+="-L$(STAGING_DIR)/usr/lib/iconv"' >> \
		$(PKG_BUILD_DIR)/Makefile.settings
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/bitlbee/install
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(1)" install-etc install-bin 
	$(MAKE) -C $(PKG_BUILD_DIR)/doc/user-guide \
		DESTDIR="$(1)" install 
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/S55bitlbee $(1)/etc/init.d/S55bitlbee
endef

$(eval $(call BuildPackage,bitlbee))
