#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$
#
include $(TOPDIR)/rules.mk

PKG_NAME:=rsync
PKG_VERSION:=2.6.9

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://rsync.samba.org/ftp/rsync
PKG_MD5SUM:=996d8d8831dbca17910094e56dcb5942

include $(INCLUDE_DIR)/package.mk

define Package/rsync
  SECTION:=net
  CATEGORY:=Network
  TITLE:=fast incremental file transfer
  URL:=http://rsync.samba.org/
endef

define Build/Compile
	$(call Build/Compile/Default, \
		PREFIX="/usr" \
	)
endef

define Package/rsync/install
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(1)" \
		PREFIX="/usr" \
		install-strip
	rm -rf $(1)/usr/man
endef

$(eval $(call BuildPackage,rsync))
