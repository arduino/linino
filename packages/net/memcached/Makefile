#
# Copyright (C) 2009-2011 OpenWrt.org
# Copyright (C) 2009-2010 Thomas Heil <heil@terminal-consulting.de>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=memcached
PKG_VERSION:=1.4.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://memcached.googlecode.com/files
PKG_MD5SUM:=cf0becfa65753c3b5a1fc8f84861bb23

include $(INCLUDE_DIR)/package.mk

define Package/memcached
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libevent
  TITLE:=The high-performance, distributed memory object caching system
  MAINTAINER:=Thomas Heil <heil@terminal-consulting.de>
  URL:=http://memcached.org/
endef

define Package/memcached/description
  Free and open source, high-performance, distributed memory object caching system
endef

define Package/memcached/conffiles
/etc/config/memcached
endef

ifeq ($(CONFIG_BIG_ENDIAN),y)
CONFIGURE_VARS += ac_cv_c_endian=big
else
CONFIGURE_VARS += ac_cv_c_endian=little
endif

CONFIGURE_ARGS += \
	--disable-docs \
	--disable-dtrace \
	--disable-coverage  \
	--disable-sasl

TARGET_CFLAGS+= \
    -std=gnu99

define Package/memcached/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/memcached $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/memcached.config $(1)/etc/config/memcached
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/memcached.init $(1)/etc/init.d/memcached
endef

$(eval $(call BuildPackage,memcached))
