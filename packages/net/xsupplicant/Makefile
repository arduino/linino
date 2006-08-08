#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=xsupplicant
PKG_VERSION:=1.2.3
PKG_RELEASE:=1
PKG_MD5SUM:=c9b17b2e1879bac85c583980338fed85

PKG_SOURCE_URL:=@SF/open1x
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/xsupplicant
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl +wireless-tools
  TITLE:=A fully compliant 802.1x authenticator
  DESCRIPTION:=This software allows a GNU/Linux or BSD workstation to authenticate with\\\
	a RADIUS server using 802.1x and various EAP protocols.\\\
  URL:=http://open1x.sourceforge.net/
endef

define Package/xsupplicant/conffiles
/etc/xsupplicant.conf
endef

define Build/Configure	
	(cd $(PKG_BUILD_DIR); rm -rf config.{cache,status}; \
		touch configure.in; \
		touch aclocal.m4; \
		touch Makefile.in; \
		touch configure; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include \
			-I$(PKG_BUILD_DIR)/lib/libxsupconfig/ \
			-I$(STAGING_DIR)/usr/include/madwifi" \
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
			--with-openssl="$(STAGING_DIR)/usr" \
			--with-madwifi-path="$(STAGING_DIR)/usr/include/madwifi" \
	);
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR=$(PKG_INSTALL_DIR) \
		all install
endef

define Package/xsupplicant/install	
	install -d -m0755 $(1)/etc
	install -m0644 $(PKG_BUILD_DIR)/etc/xsupplicant.conf $(1)/etc/
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/xsup_* $(1)/usr/bin/
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/xsupplicant $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,xsupplicant))
