#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=proftpd
PKG_VERSION:=1.3.2c
PKG_RELEASE:=1
PKG_SOURCE_URL:=ftp://ftp.proftpd.org/distrib/source
PKG_MD5SUM:=559fd3fb6959d42ddd66b333a03b0c49

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_INSTALL=1

include $(INCLUDE_DIR)/package.mk

define Package/proftpd
  SUBMENU:=FTP
  SECTION:=net
  CATEGORY:=Network
  TITLE:=ProFTPD FTP server
  URL:=http://www.proftpd.org/
endef

define Package/proftpd/conffiles
/etc/proftpd.conf
endef

TARGET_CPPFLAGS += \
	-I$(LINUX_DIR)/include

MAKE_FLAGS += \
	INSTALL_USER=$(shell id -u) \
	INSTALL_GROUP=$(shell id -g)

CONFIGURE_ARGS += \
	--disable-cap \
	--enable-devel \

define Package/proftpd/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/proftpd.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ftp{count,top,who} $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/{ftpshut,proftpd} $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/in.proftpd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,proftpd))
