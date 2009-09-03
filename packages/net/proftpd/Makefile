# 
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=proftpd
PKG_VERSION:=1.3.2a
PKG_RELEASE:=1
PKG_SOURCE_URL:=ftp://ftp.proftpd.org/distrib/source
PKG_MD5SUM:=ad3cbb5db30c5ae39e09b308892392b3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL=1

include $(INCLUDE_DIR)/package.mk

define Package/proftpd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=ProFTPD FTP server
  URL:=http://www.proftpd.org/
endef

TARGET_CPPFLAGS += \
	-I$(LINUX_DIR)/include

MAKE_FLAGS += \
	INSTALL_USER=$(shell id -u) \
	INSTALL_GROUP=$(shell id -g)

CONFIGURE_ARGS += \
	--disable-cap

define Package/proftpd/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
	rm -rf \
		$(1)/usr/include \
		$(1)/usr/share \
		$(1)/usr/man \
		$(1)/usr/lib/pkgconfig \
		$(1)/var
endef

$(eval $(call BuildPackage,proftpd))
