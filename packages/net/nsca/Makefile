# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$
include $(TOPDIR)/rules.mk

PKG_NAME:=nsca
PKG_VERSION:=2.6
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/nagios
PKG_MD5SUM:=d526a3ac3c29648c729c5fb4fb332488
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk

define Package/send-nsca
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libmcrypt
  TITLE:=Nagios Service Check Acceptor (NSCA) client
  DESCRIPTION:=Nagios Service Check Acceptor (NSCA) client.
  URL:=http://www.nagios.org/
endef

define Package/send-nsca/conffiles
/etc/send_nsca.cfg
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
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
			--with-libmcrypt-prefix="$(STAGING_DIR)/usr" \
	);
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		send_nsca
endef

define Package/send-nsca/install
	install -d -m0755 $(1)/etc
	install -m0600 $(PKG_BUILD_DIR)/sample-config/send_nsca.cfg $(1)/etc/
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/src/send_nsca $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,send-nsca))
