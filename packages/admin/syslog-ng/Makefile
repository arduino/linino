#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=syslog-ng
PKG_VERSION:=1.6.9
PKG_RELEASE:=1
PKG_MD5SUM:=5280a86b4f5c25b2ba157c8cea302cf0

PKG_SOURCE_URL:=http://www.balabit.com/downloads/syslog-ng/stable/src \
		http://www.balabit.com/downloads/syslog-ng/1.6/src
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install
PKG_INIT_LEVEL:=60

include $(INCLUDE_DIR)/package.mk

define Package/syslog-ng
  SECTION:=admin
  CATEGORY:=Administration
  DEPENDS:=+libol
  TITLE:=A powerful syslog daemon
  DESCRIPTION:=syslog-ng reads and logs messages to the  system  console,  log\\\
	files, other machines and/or users as specified by its\\\
	configuration file.\\\
  URL:=http://www.balabit.com/products/syslog_ng/
endef

define Package/syslog-ng/conffiles
/etc/syslog-ng/syslog-ng.conf
endef

define Build/Configure
$(call Build/Configure/Default,--disable-dependency-tracking \
                        --disable-full-static \
                        --enable-tcp-wrapper \
                        --with-libol="$(STAGING_DIR)/usr/bin",CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/usr/include/libol" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/usr/lib/libol")
endef

define Build/Compile	
$(call Build/Compile/Default,DESTDIR="$(PKG_INSTALL_DIR)" \
		all install)
endef

define Package/syslog-ng/install	
	install -d -m0755 $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/syslog-ng $(1)/usr/sbin/
	install -d -m0755 $(1)/etc/init.d
	install -m0755 ./files/syslog-ng.init $(1)/etc/init.d/S$(PKG_INIT_LEVEL)syslog-ng
	install -d -m0755 $(1)/etc/syslog-ng
	install -m0644 ./files/syslog-ng.conf $(1)/etc/syslog-ng/
endef

$(eval $(call BuildPackage,syslog-ng))
