#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=syslog-ng
PKG_VERSION:=3.0.4
PKG_RELEASE:=1
PKG_MD5SUM:=86c39779261545d2289e9c309e262b8d

PKG_SOURCE_URL:= \
	http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/3.0.4/source/
PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/syslog-ng3
  SECTION:=admin
  CATEGORY:=Administration
  DEPENDS:=+libpcre +glib2 +libeventlog +libopenssl +libwrap
  TITLE:=A powerful syslog daemon
  URL:=http://www.balabit.com/network-security/syslog-ng/opensource-logging-system/
endef

define Package/syslog-ng3/description
  syslog-ng reads and logs messages to the system console, log
  files, other machines and/or users as specified by its
  configuration file.
endef

define Package/syslog-ng3/conffiles
/etc/syslog-ng.conf
endef

define Build/Configure
	$(SED) 's,-I/usr/include,,' $(PKG_BUILD_DIR)/configure
	$(Build/Configure/Default)
endef

CONFIGURE_ARGS +=  \
	--disable-dependency-tracking \
	--enable-tcp-wrapper \
	--disable-glibtest

TARGET_CPPFLAGS += \
	-I$(STAGING_DIR)/usr/include/eventlog

TARGET_LDFLAGS += \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

CONFIGURE_VARS += \
	LIBDBI_CFLAGS="-I$(STAGING_DIR)/usr/include"

define Package/syslog-ng3/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/syslog-ng $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/syslog-ng.init $(1)/etc/init.d/syslog-ng
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/syslog-ng.conf $(1)/etc
endef

$(eval $(call BuildPackage,syslog-ng3))
