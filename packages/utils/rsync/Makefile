# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=rsync
PKG_VERSION:=2.6.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://rsync.samba.org/ftp/rsync/
PKG_MD5SUM:=3691cdf1540d0649ba679edce6bae8fc
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/rsync
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libpopt
  TITLE:=A fast incremental file transfer utility
  URL:=http://rsync.samba.org/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--with-included-popt=no \
		--disable-debug \
		--disable-ipv6 \
		--disable-locale \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/rsync/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/rsync $(1)/usr/bin/
endef

$(eval $(call BuildPackage,rsync))
