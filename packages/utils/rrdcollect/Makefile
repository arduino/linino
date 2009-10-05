#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rrdcollect
PKG_VERSION:=0.2.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/rrdcollect
PKG_MD5SUM:=fd7ac95195e3e5cbab0677629505d9be

include $(INCLUDE_DIR)/package.mk

define Package/rrdcollect/Default
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=http://rrdcollect.sourceforge.net/
endef

define Package/rrdcollect/Default/description
 RRDcollect is a daemon which polls ceratin files in /proc/ 
 directory, gathering data and storing it inside RRDtool's 
 database files. Being written in C should be both fast 
 and resources-friendly. Supports both scanf(3)-style 
 pattern matches and perl compatible regular expressions.	
endef

define Package/rrdcollect
$(call Package/rrdcollect/Default)
  DEPENDS:=+librrd1
  TITLE:=Round-Robin Database (RRD) collecting daemon
  MENU:=1
endef

define Package/rrdcollect/description
$(call Package/rrdcollect/Default/description)
 This package contains the RRD collecting daemon.
endef

define Package/rrdcollect-example
$(call Package/rrdcollect/Default)
  DEPENDS:=rrdcollect
  TITLE:=Example setup for RRD collecting daemon above
endef

define Package/rrdcollect-example/description
$(call Package/rrdcollect/Default/description)
 This package contains examples for the RRD collecting daemon.
endef

define Package/rrdcollect-example/conffiles
/etc/rrd.conf
/etc/rrdcollect.conf
endef

CONFIGURE_ARGS+= \
	--enable-shared \
	--disable-static \
	--disable-rpath \
	--enable-exec \
	--without-rrdtool \
	--with-librrd="$(STAGING_DIR)/usr/lib/rrdtool-1.0" \
	--without-libpcre \
	--without-libpcap \

CONFIGURE_VARS+= \
	CFLAGS="$(TARGET_CFLAGS) -DSOCKET_COMM" \

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/rrdcollect/install	
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/rrdcollect $(1)/usr/sbin/
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
