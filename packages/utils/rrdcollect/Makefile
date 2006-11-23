#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=rrdcollect
PKG_VERSION:=0.2.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/rrdcollect
PKG_MD5SUM:=5e4305c612bc3cccbaf802c275c81a11
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/rrdcollect/Default
  SECTION:=utils
  CATEGORY:=Utilities
  DESCRIPTION:=\
	RRDcollect is a daemon which polls ceratin files in /proc/ \\\
	directory, gathering data and storing it inside RRDtool's \\\
	database files.  Being written in C should be both fast \\\
	and resources-friendly.  Supports both scanf(3)-style \\\
	pattern matches and perl compatible regular expressions.
  URL:=http://rrdcollect.sourceforge.net/
endef

define Package/rrdcollect
  $(call Package/rrdcollect/Default)
  DEPENDS:=+librrd1
  TITLE:=Round-Robin Database (RRD) collecting daemon
  DESCRIPTION+=\\\
	\\\
	This package contains the RRD collecting daemon.
  MENU:=1
endef

define Package/rrdcollect-example
  $(call Package/rrdcollect/Default)
  DEPENDS:=rrdcollect
  TITLE:=Example setup for RRD collecting daemon above
  DESCRIPTION+=\\\
	\\\
	This package contains examples for the RRD collecting daemon.
endef

define Package/rrdcollect-example/conffiles
/etc/rrd.conf
/etc/rrdcollect.conf
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--disable-static \
		--disable-rpath \
		--enable-exec \
		--without-rrdtool \
		--with-librrd \
		--without-libpcre \
		--without-libpcap \
		, \
		CFLAGS="$(TARGET_CFLAGS) -DSOCKET_COMM" \
		LIBS="-lz" \
	)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/rrdcollect/install	
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/rrdcollect $(1)/usr/sbin/
endef

define Package/rrdcollect-example/install	
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/rrd.conf $(1)/etc/
	$(INSTALL_DATA) ./files/rrdcollect.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/rrdcollect.init $(1)/etc/init.d/rrdcollect
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/rrd.sh $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/www/cgi-bin
	ln -sf /var/lib/rrdcollect/rrd.cgi $(1)/www/cgi-bin/rrd.cgi
	ln -sf /var/lib/rrdcollect/img $(1)/www/img
endef

$(eval $(call BuildPackage,rrdcollect))
$(eval $(call BuildPackage,rrdcollect-example))
