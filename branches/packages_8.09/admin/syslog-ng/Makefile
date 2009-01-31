#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=syslog-ng
PKG_VERSION:=1.6.12
PKG_RELEASE:=1
PKG_MD5SUM:=a3cbfdb6e1e5beea181a7349749719f3

PKG_SOURCE_URL:= \
	http://www.balabit.com/downloads/files/syslog-ng/sources/1.6/src \
	http://www.balabit.com/downloads/files/syslog-ng/stable/src
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/syslog-ng
  SECTION:=admin
  CATEGORY:=Administration
  DEPENDS:=+libol
  TITLE:=A powerful syslog daemon
  URL:=http://www.balabit.com/products/syslog_ng/
endef

define Package/syslog-ng/description
	syslog-ng reads and logs messages to the system console, log
	files, other machines and/or users as specified by its
	configuration file.
endef

define Package/syslog-ng/conffiles
/etc/syslog-ng/syslog-ng.conf
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-dependency-tracking \
        --disable-full-static \
        --enable-tcp-wrapper \
        --with-libol="$(STAGING_DIR)/host/bin" \
		, \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/usr/include/libol" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/usr/lib/libol" \
	)
endef

define Build/Compile
	$(call Build/Compile/Default,DESTDIR="$(PKG_INSTALL_DIR)" all install)
endef

define Package/syslog-ng/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/syslog-ng $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/syslog-ng.init $(1)/etc/init.d/syslog-ng
	$(INSTALL_DIR) $(1)/etc/syslog-ng
	$(INSTALL_DATA) ./files/syslog-ng.conf $(1)/etc/syslog-ng/
endef

$(eval $(call BuildPackage,syslog-ng))
