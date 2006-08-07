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
PKG_MD5SUM:=5e4305c612bc3cccbaf802c275c81a11

PKG_SOURCE_URL:=@SF/rrdcollect
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

ifneq ($(BR2_PACKAGE_LIBRRD),)
RRDTOOL_LIBS:=-lart_lgpl_2 -lfreetype -lpng
endif

include $(INCLUDE_DIR)/package.mk

define Package/rrdcollect
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+librrd1
  TITLE:=Round-Robin Database (RRD) collecting daemon
  DESCRIPTION:=RRDcollect is a daemon which polls ceratin files in /proc/\\\
	directory, gathering data and storing it inside RRDtool's\\\
	database files.  Being written in C should be both fast\\\
	and resources-friendly.  Supports both scanf(3)-style\\\
	pattern matches and perl compatible regular expressions.\\\
  URL:=http://rrdcollect.sourceforge.net/
  MENU:=1
endef

define Package/rrdcollect-example
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=rrdcollect
  TITLE:=Example setup for RRD collecting daemon above
  DESCRIPTION:=RRDcollect is a daemon which polls ceratin files in /proc/\\\
        directory, gathering data and storing it inside RRDtool's\\\
        database files.  Being written in C should be both fast\\\
        and resources-friendly.  Supports both scanf(3)-style\\\
        pattern matches and perl compatible regular expressions.\\\
  URL:=http://rrdcollect.sourceforge.net/
endef

define Package/rrdcollect-example/conffiles
/etc/rrd.conf
/etc/rrdcollect.conf
endef

define Build/Configure
$(call Build/Configure/Default,--enable-shared \
                        --disable-static \
                        --disable-rpath \
                        --with-gnu-ld \
                        --enable-exec \
                        --without-rrdtool \
                        --with-librrd \
                        --without-libpcre \
                        --without-libpcap, CFLAGS="$(TARGET_CFLAGS) -DSOCKET_COMM" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		LIBS="$(RRDTOOL_LIBS) -lz" \
		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
		ac_cv_func_malloc_0_nonnull=yes)
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/rrdcollect/install	
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/rrdcollect $(1)/usr/sbin/
endef

define Package/rrdcollect-example/install	
	install -d -m0755 $(1)/etc
	install -m0644 ./files/rrd.conf $(1)/etc/
	install -m0644 ./files/rrdcollect.conf $(1)/etc/
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/rrdcollect.init $(1)/etc/init.d/S98rrdcollect
	install -d -m0755 $(1)/usr/bin
	install -m0755 ./files/rrd.sh $(1)/usr/bin/
	install -d -m0755 $(1)/www/cgi-bin
	ln -sf /var/lib/rrdcollect/rrd.cgi $(1)/www/cgi-bin/rrd.cgi
	ln -sf /var/lib/rrdcollect/img $(1)/www/img
endef

$(eval $(call BuildPackage,rrdcollect))
$(eval $(call BuildPackage,rrdcollect-example))
